Feature: Automatizacion de objetos mediante API REST

  Background:
    * url baseUrl


  Scenario: Consultar todos los objetos correctamente

    Given path 'objects'
    When method get
    Then status 200

    And match response == '#[]'
    And match response[0].id == '#string'
    And match response[0].name == '#string'


  Scenario: Crear, consultar, actualizar y eliminar un objeto

    # =========================================================
    # 1. POST - Crear un objeto
    # =========================================================

    Given path 'objects'

    And request
    """
    {
      "name": "Laptop de prueba",
      "data": {
        "year": 2026,
        "price": 2500,
        "color": "Negro"
      }
    }
    """

    When method post
    Then status 200

    And match response.id == '#string'
    And match response.name == 'Laptop de prueba'
    And match response.data.year == 2026
    And match response.data.price == 2500
    And match response.data.color == 'Negro'

    # Guardamos el ID generado por la API
    * def objectId = response.id


    # =========================================================
    # 2. GET - Consultar el objeto creado
    # =========================================================

    Given path 'objects', objectId
    When method get
    Then status 200

    And match response.id == objectId
    And match response.name == 'Laptop de prueba'
    And match response.data.color == 'Negro'


    # =========================================================
    # 3. PUT - Actualizar completamente el objeto
    # =========================================================

    Given path 'objects', objectId

    And request
    """
    {
      "name": "Laptop actualizada",
      "data": {
        "year": 2027,
        "price": 3000,
        "color": "Azul"
      }
    }
    """

    When method put
    Then status 200

    And match response.id == objectId
    And match response.name == 'Laptop actualizada'
    And match response.data.year == 2027
    And match response.data.price == 3000
    And match response.data.color == 'Azul'


    # =========================================================
    # 4. PATCH - Actualizar parcialmente el objeto
    # =========================================================

    Given path 'objects', objectId

    And request
    """
    {
      "name": "Laptop modificada con PATCH"
    }
    """

    When method patch
    Then status 200

    And match response.id == objectId
    And match response.name == 'Laptop modificada con PATCH'


    # =========================================================
    # 5. GET - Verificar los cambios realizados
    # =========================================================

    Given path 'objects', objectId
    When method get
    Then status 200

    And match response.id == objectId
    And match response.name == 'Laptop modificada con PATCH'


    # =========================================================
    # 6. DELETE - Eliminar el objeto
    # =========================================================

    Given path 'objects', objectId
    When method delete
    Then status 200


    # =========================================================
    # 7. GET - Verificar que el objeto ya no exista
    # =========================================================

    Given path 'objects', objectId
    When method get

    # La API debe indicar que el objeto ya no existe
    Then status 404