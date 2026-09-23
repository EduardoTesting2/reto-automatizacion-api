package api;

import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Clase encargada de ejecutar
 * las pruebas automatizadas de la API.
 */
public class ApiTest {

    @Test
    void ejecutarPruebasApi() {

        SuiteResult resultado = Runner
                .path("classpath:api")
                .outputHtmlReport(true)
                .parallel(1);

        assertTrue(
                resultado.isPassed(),
                "Una o más pruebas de API fallaron"
        );
    }
}