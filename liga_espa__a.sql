-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2025 a las 04:13:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga españa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerArbitros` ()   BEGIN
    SELECT * FROM vista_arbitros;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerClasificacionPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_clasificacion WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDashboardLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_dashboard_liga WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDiferenciaGoles` ()   BEGIN
    SELECT * FROM vista_diferencia_goles;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEficienciaJugadores` ()   BEGIN
    SELECT * FROM vista_eficiencia_jugadores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEquiposPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_equipos_liga WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEstadisticasEquipo` (IN `nombre_equipo` VARCHAR(100))   BEGIN
    SELECT * FROM vista_estadisticas_equipos WHERE equipo = nombre_equipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerExpulsadosPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_jugadores_expulsados WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerFairPlayEquipo` (IN `nombre_equipo` VARCHAR(100))   BEGIN
    SELECT * FROM vista_fair_play WHERE equipo = nombre_equipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerGoleadoresPorEquipo` (IN `nombre_equipo` VARCHAR(100))   BEGIN
    SELECT * FROM vista_goleadores_equipo WHERE equipo = nombre_equipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerGoleadoresPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_goleadores WHERE liga = nombre_liga ORDER BY goles DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerHistorialEquipo` (IN `nombre_equipo` VARCHAR(100))   BEGIN
    SELECT * FROM vista_historial_partidos
    WHERE local = nombre_equipo OR visitante = nombre_equipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerLocalVsVisitante` ()   BEGIN
    SELECT * FROM vista_local_vs_visitante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMaximasGoleadas` ()   BEGIN
    SELECT * FROM vista_maximas_goleadas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMejoresEquiposPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_mejores_equipos WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPartidosEspectaculares` ()   BEGIN
    SELECT * FROM vista_partidos_espectaculares;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPartidosPendientes` ()   BEGIN
    SELECT * FROM vista_partidos_pendientes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPartidosPorEstado` (IN `estado_partido` VARCHAR(20))   BEGIN
    SELECT * FROM vista_partidos_detalle WHERE estado = estado_partido;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerPromedioGolesPorLiga` (IN `nombre_liga` VARCHAR(100))   BEGIN
    SELECT * FROM vista_promedio_goles WHERE liga = nombre_liga;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerRachasEquipos` ()   BEGIN
    SELECT * FROM vista_rachas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerRankingPorteros` ()   BEGIN
    SELECT * FROM vista_ranking_porteros ORDER BY goles_recibidos ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerResumenLigas` ()   BEGIN
    SELECT * FROM vista_ligas_resumen;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTablaHistoricaEquipo` (IN `nombre_equipo` VARCHAR(100))   BEGIN
    SELECT * FROM vista_tabla_historica WHERE equipo = nombre_equipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTarjetasJugador` (IN `nombre_jugador` VARCHAR(100))   BEGIN
    SELECT * FROM vista_tarjetas_jugadores WHERE nombre = nombre_jugador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTopGoleadores` ()   BEGIN
    SELECT * FROM vista_top_goleadores;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitros`
--

CREATE TABLE `arbitros` (
  `id_arbitro` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arbitros`
--

INSERT INTO `arbitros` (`id_arbitro`, `nombre`, `apellido`, `nacionalidad`, `fecha_nacimiento`, `created_at`, `updated_at`) VALUES
(1, 'Ricardo', 'Morales', 'Colombia', '1980-02-15', '2025-08-27 00:29:22', '2025-08-27 00:29:22'),
(2, 'Pedro', 'Silva', 'Brasil', '1975-06-25', '2025-08-27 00:29:22', '2025-08-27 00:29:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitros_partido`
--

CREATE TABLE `arbitros_partido` (
  `id_arbitro_partido` int(11) NOT NULL,
  `id_partido` int(11) DEFAULT NULL,
  `id_arbitro` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `arbitros_partido`
--

INSERT INTO `arbitros_partido` (`id_arbitro_partido`, `id_partido`, `id_arbitro`, `created_at`) VALUES
(1, 1, 1, '2025-08-27 00:30:23'),
(2, 2, 2, '2025-08-27 00:30:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id_clasificacion` int(11) NOT NULL,
  `id_liga` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `partidos_jugados` int(11) DEFAULT 0,
  `partidos_ganados` int(11) DEFAULT 0,
  `partidos_empatados` int(11) DEFAULT 0,
  `partidos_perdidos` int(11) DEFAULT 0,
  `goles_a_favor` int(11) DEFAULT 0,
  `goles_en_contra` int(11) DEFAULT 0,
  `diferencia_goles` int(11) DEFAULT 0,
  `puntos` int(11) DEFAULT 0,
  `temporada` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasificacion`, `id_liga`, `id_equipo`, `partidos_jugados`, `partidos_ganados`, `partidos_empatados`, `partidos_perdidos`, `goles_a_favor`, `goles_en_contra`, `diferencia_goles`, `puntos`, `temporada`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 0, 0, 2, 1, 1, 3, '2025', '2025-08-27 00:27:53', '2025-08-27 00:27:53'),
(2, 1, 2, 1, 0, 0, 1, 1, 2, -1, 0, '2025', '2025-08-27 00:27:53', '2025-08-27 00:27:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `estadio` varchar(100) DEFAULT NULL,
  `fundacion` year(4) DEFAULT NULL,
  `presidente` varchar(100) DEFAULT NULL,
  `entrenador` varchar(100) DEFAULT NULL,
  `id_liga` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre`, `ciudad`, `estadio`, `fundacion`, `presidente`, `entrenador`, `id_liga`, `created_at`, `updated_at`) VALUES
(1, 'Águilas Doradas', 'Medellín', 'Estadio Dorado', '1995', 'Carlos Ríos', 'Miguel Gómez', 1, '2025-08-26 01:54:31', '2025-08-26 01:54:31'),
(2, 'Tiburones FC', 'Barranquilla', 'Estadio Caribe', '1980', 'Luis Pardo', 'Javier Hernández', 1, '2025-08-26 01:54:31', '2025-08-26 01:54:31'),
(3, 'Leones Verdes', 'São Paulo', 'Arena Verde', '1975', 'João Silva', 'Rafael Costa', 2, '2025-08-26 01:54:31', '2025-08-26 01:54:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goles`
--

CREATE TABLE `goles` (
  `id_gol` int(11) NOT NULL,
  `id_partido` int(11) DEFAULT NULL,
  `id_jugador` int(11) DEFAULT NULL,
  `minuto` int(11) DEFAULT NULL,
  `tipo` enum('Normal','Penalti','Falta directa','Autogol') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `goles`
--

INSERT INTO `goles` (`id_gol`, `id_partido`, `id_jugador`, `minuto`, `tipo`, `descripcion`, `created_at`) VALUES
(1, 1, 1, 23, 'Normal', 'Remate de cabeza', '2025-08-27 00:20:51'),
(2, 1, 2, 55, 'Autogol', 'Desviación en propia puerta', '2025-08-27 00:20:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `posicion` enum('Portero','Defensa','Centrocampista','Delantero') NOT NULL,
  `numero_camiseta` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre`, `apellido`, `fecha_nacimiento`, `nacionalidad`, `posicion`, `numero_camiseta`, `id_equipo`, `created_at`, `updated_at`) VALUES
(1, 'Juan', 'Pérez', '1998-05-20', 'Colombia', 'Delantero', 9, 1, '2025-08-26 02:29:24', '2025-08-26 02:29:24'),
(2, 'Carlos', 'López', '2000-10-11', 'Colombia', 'Defensa', 4, 1, '2025-08-26 02:29:24', '2025-08-26 02:29:24'),
(3, 'Andrés', 'Gómez', '1996-03-15', 'Colombia', 'Portero', 1, 2, '2025-08-26 02:29:24', '2025-08-26 02:29:24'),
(4, 'Paulo', 'Santos', '1995-07-12', 'Brasil', '', 10, 3, '2025-08-26 02:29:24', '2025-08-26 02:29:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas`
--

CREATE TABLE `ligas` (
  `id_liga` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `temporada` varchar(20) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ligas`
--

INSERT INTO `ligas` (`id_liga`, `nombre`, `pais`, `temporada`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 'Liga Nacional', 'Colombia', '2025', '2025-01-15', '2025-06-15', '2025-08-26 01:51:03', '2025-08-26 01:51:03'),
(2, 'Copa Continental', 'Brasil', '2025', '2025-02-01', '2025-07-20', '2025-08-26 01:51:03', '2025-08-26 01:51:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `estadio` varchar(100) DEFAULT NULL,
  `id_equipo_local` int(11) DEFAULT NULL,
  `id_equipo_visitante` int(11) DEFAULT NULL,
  `goles_local` int(11) DEFAULT 0,
  `goles_visitante` int(11) DEFAULT 0,
  `jornada` int(11) DEFAULT NULL,
  `id_liga` int(11) DEFAULT NULL,
  `estado` enum('Programado','En juego','Finalizado','Suspendido') DEFAULT 'Programado',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partido`, `fecha_hora`, `estadio`, `id_equipo_local`, `id_equipo_visitante`, `goles_local`, `goles_visitante`, `jornada`, `id_liga`, `estado`, `created_at`, `updated_at`) VALUES
(1, '2025-02-15 15:00:00', 'Estadio Dorado', 1, 2, 2, 1, NULL, 1, 'Finalizado', '2025-08-27 00:17:59', '2025-08-27 00:17:59'),
(2, '2025-02-20 18:00:00', 'Estadio Caribe', 2, 1, 0, 0, NULL, 2, 'Programado', '2025-08-27 00:17:59', '2025-08-27 00:17:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `id_partido` int(11) DEFAULT NULL,
  `id_jugador` int(11) DEFAULT NULL,
  `minuto` int(11) DEFAULT NULL,
  `tipo` enum('Amarilla','Roja') NOT NULL,
  `motivo` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id_tarjeta`, `id_partido`, `id_jugador`, `minuto`, `tipo`, `motivo`, `created_at`) VALUES
(1, 1, 2, 60, 'Amarilla', 'Falta táctica', '2025-08-27 00:24:09'),
(2, 1, 1, 75, 'Roja', 'Agresión', '2025-08-27 00:24:09');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_arbitros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_arbitros` (
`arbitro` varchar(100)
,`partidos_dirigidos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clasificacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clasificacion` (
`liga` varchar(100)
,`equipo` varchar(100)
,`puntos` int(11)
,`partidos_jugados` int(11)
,`partidos_ganados` int(11)
,`partidos_empatados` int(11)
,`partidos_perdidos` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_dashboard_liga`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_dashboard_liga` (
`id_liga` int(11)
,`liga` varchar(100)
,`equipo_lider` varchar(100)
,`max_goleador` varchar(100)
,`mas_amonestado` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_diferencia_goles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_diferencia_goles` (
`id_partido` int(11)
,`liga` varchar(100)
,`local` varchar(100)
,`visitante` varchar(100)
,`goles_local` int(11)
,`goles_visitante` int(11)
,`diferencia_goles` bigint(12)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_eficiencia_jugadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_eficiencia_jugadores` (
`jugador` varchar(100)
,`equipo` varchar(100)
,`goles` bigint(21)
,`partidos_jugados` bigint(21)
,`goles_por_partido` decimal(23,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_equipos_liga`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_equipos_liga` (
`id_equipo` int(11)
,`equipo` varchar(100)
,`ciudad` varchar(50)
,`estadio` varchar(100)
,`liga` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estadisticas_equipos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_estadisticas_equipos` (
`id_equipo` int(11)
,`equipo` varchar(100)
,`liga` varchar(100)
,`partidos_jugados` int(11)
,`partidos_ganados` int(11)
,`partidos_empatados` int(11)
,`partidos_perdidos` int(11)
,`puntos` int(11)
,`goles_marcados` bigint(21)
,`tarjetas_totales` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_fair_play`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_fair_play` (
`equipo` varchar(100)
,`liga` varchar(100)
,`amarillas` decimal(22,0)
,`rojas` decimal(22,0)
,`total_tarjetas` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_goleadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_goleadores` (
`liga` varchar(100)
,`jugador` varchar(100)
,`equipo` varchar(100)
,`goles` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_goleadores_equipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_goleadores_equipo` (
`equipo` varchar(100)
,`jugador` varchar(100)
,`goles` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_partidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_partidos` (
`id_partido` int(11)
,`liga` varchar(100)
,`local` varchar(100)
,`visitante` varchar(100)
,`fecha_hora` datetime
,`estadio` varchar(100)
,`goles_local` int(11)
,`goles_visitante` int(11)
,`resultado` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_jugadores_expulsados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_jugadores_expulsados` (
`jugador` varchar(100)
,`equipo` varchar(100)
,`liga` varchar(100)
,`rojas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ligas_resumen`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ligas_resumen` (
`id_liga` int(11)
,`nombre` varchar(100)
,`pais` varchar(50)
,`temporada` varchar(20)
,`fecha_inicio` date
,`fecha_fin` date
,`duracion_dias` int(7)
,`total_equipos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_local_vs_visitante`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_local_vs_visitante` (
`equipo` varchar(100)
,`liga` varchar(100)
,`goles_local` decimal(32,0)
,`goles_visitante` decimal(32,0)
,`goles_recibidos_local` decimal(32,0)
,`goles_recibidos_visitante` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_maximas_goleadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_maximas_goleadas` (
`id_partido` int(11)
,`liga` varchar(100)
,`local` varchar(100)
,`visitante` varchar(100)
,`goles_local` int(11)
,`goles_visitante` int(11)
,`diferencia` bigint(12)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_mejores_equipos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_mejores_equipos` (
`equipo` varchar(100)
,`liga` varchar(100)
,`puntos` int(11)
,`diferencia_goles` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_partidos_detalle`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_partidos_detalle` (
`id_partido` int(11)
,`fecha_hora` datetime
,`estadio` varchar(100)
,`equipo_local` varchar(100)
,`equipo_visitante` varchar(100)
,`goles_local` int(11)
,`goles_visitante` int(11)
,`arbitro` varchar(100)
,`pais_arbitro` varchar(50)
,`estado` enum('Programado','En juego','Finalizado','Suspendido')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_partidos_espectaculares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_partidos_espectaculares` (
`id_partido` int(11)
,`liga` varchar(100)
,`local` varchar(100)
,`visitante` varchar(100)
,`goles_local` int(11)
,`goles_visitante` int(11)
,`total_goles` bigint(12)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_partidos_pendientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_partidos_pendientes` (
`id_partido` int(11)
,`liga` varchar(100)
,`local` varchar(100)
,`visitante` varchar(100)
,`fecha_hora` datetime
,`estadio` varchar(100)
,`estado` enum('Programado','En juego','Finalizado','Suspendido')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_promedio_goles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_promedio_goles` (
`liga` varchar(100)
,`total_partidos` bigint(21)
,`total_goles` decimal(33,0)
,`promedio_goles` decimal(14,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_rachas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_rachas` (
`equipo` varchar(100)
,`ultimos_5` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ranking_porteros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ranking_porteros` (
`portero` varchar(100)
,`equipo` varchar(100)
,`liga` varchar(100)
,`goles_recibidos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tabla_historica`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tabla_historica` (
`equipo` varchar(100)
,`liga` varchar(100)
,`puntos_totales` decimal(32,0)
,`victorias_totales` decimal(32,0)
,`empates_totales` decimal(32,0)
,`derrotas_totales` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tarjetas_jugadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tarjetas_jugadores` (
`id_jugador` int(11)
,`nombre` varchar(100)
,`posicion` enum('Portero','Defensa','Centrocampista','Delantero')
,`equipo` varchar(100)
,`total_amarillas` bigint(21)
,`total_rojas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_top_goleadores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_top_goleadores` (
`jugador` varchar(100)
,`equipo` varchar(100)
,`liga` varchar(100)
,`total_goles` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_arbitros`
--
DROP TABLE IF EXISTS `vista_arbitros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_arbitros`  AS SELECT `a`.`nombre` AS `arbitro`, count(`ap`.`id_partido`) AS `partidos_dirigidos` FROM (`arbitros` `a` join `arbitros_partido` `ap` on(`a`.`id_arbitro` = `ap`.`id_arbitro`)) GROUP BY `a`.`nombre` ORDER BY count(`ap`.`id_partido`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clasificacion`
--
DROP TABLE IF EXISTS `vista_clasificacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clasificacion`  AS SELECT `l`.`nombre` AS `liga`, `e`.`nombre` AS `equipo`, `c`.`puntos` AS `puntos`, `c`.`partidos_jugados` AS `partidos_jugados`, `c`.`partidos_ganados` AS `partidos_ganados`, `c`.`partidos_empatados` AS `partidos_empatados`, `c`.`partidos_perdidos` AS `partidos_perdidos` FROM ((`clasificacion` `c` join `equipos` `e` on(`c`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`c`.`id_liga` = `l`.`id_liga`)) ORDER BY `l`.`nombre` ASC, `c`.`puntos` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_dashboard_liga`
--
DROP TABLE IF EXISTS `vista_dashboard_liga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_dashboard_liga`  AS SELECT `l`.`id_liga` AS `id_liga`, `l`.`nombre` AS `liga`, (select `e`.`nombre` from (`clasificacion` `c` join `equipos` `e` on(`c`.`id_equipo` = `e`.`id_equipo`)) where `c`.`id_liga` = `l`.`id_liga` order by `c`.`puntos` desc,`c`.`partidos_ganados` desc limit 1) AS `equipo_lider`, (select `j`.`nombre` from ((`goles` `g` join `jugadores` `j` on(`g`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) where `e`.`id_liga` = `l`.`id_liga` group by `j`.`nombre` order by count(`g`.`id_gol`) desc limit 1) AS `max_goleador`, (select `j`.`nombre` from ((`tarjetas` `t` join `jugadores` `j` on(`t`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) where `e`.`id_liga` = `l`.`id_liga` group by `j`.`nombre` order by sum(case when `t`.`tipo` = 'Amarilla' then 1 else 0 end) desc,sum(case when `t`.`tipo` = 'Roja' then 1 else 0 end) desc limit 1) AS `mas_amonestado` FROM `ligas` AS `l` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_diferencia_goles`
--
DROP TABLE IF EXISTS `vista_diferencia_goles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_diferencia_goles`  AS SELECT `p`.`id_partido` AS `id_partido`, `l`.`nombre` AS `liga`, `e_local`.`nombre` AS `local`, `e_visitante`.`nombre` AS `visitante`, `p`.`goles_local` AS `goles_local`, `p`.`goles_visitante` AS `goles_visitante`, abs(`p`.`goles_local` - `p`.`goles_visitante`) AS `diferencia_goles` FROM (((`partidos` `p` join `ligas` `l` on(`l`.`id_liga` <> 0)) join `equipos` `e_local` on(`e_local`.`id_equipo` <> 0)) join `equipos` `e_visitante` on(`e_visitante`.`id_equipo` <> 0)) WHERE `p`.`estado` = 'Finalizado' ORDER BY abs(`p`.`goles_local` - `p`.`goles_visitante`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_eficiencia_jugadores`
--
DROP TABLE IF EXISTS `vista_eficiencia_jugadores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_eficiencia_jugadores`  AS SELECT `j`.`nombre` AS `jugador`, `e`.`nombre` AS `equipo`, count(distinct `g`.`id_gol`) AS `goles`, count(distinct `p`.`id_partido`) AS `partidos_jugados`, round(count(distinct `g`.`id_gol`) / count(distinct `p`.`id_partido`),2) AS `goles_por_partido` FROM (((`jugadores` `j` join `equipos` `e` on(`e`.`id_equipo` <> 0)) join `partidos` `p` on(`e`.`id_equipo` <> 0 or `e`.`id_equipo` <> 0)) left join `goles` `g` on(`j`.`id_jugador` <> 0)) GROUP BY `j`.`nombre`, `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_equipos_liga`
--
DROP TABLE IF EXISTS `vista_equipos_liga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_equipos_liga`  AS SELECT `e`.`id_equipo` AS `id_equipo`, `e`.`nombre` AS `equipo`, `e`.`ciudad` AS `ciudad`, `e`.`estadio` AS `estadio`, `l`.`nombre` AS `liga` FROM (`equipos` `e` join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estadisticas_equipos`
--
DROP TABLE IF EXISTS `vista_estadisticas_equipos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estadisticas_equipos`  AS SELECT `e`.`id_equipo` AS `id_equipo`, `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, `c`.`partidos_jugados` AS `partidos_jugados`, `c`.`partidos_ganados` AS `partidos_ganados`, `c`.`partidos_empatados` AS `partidos_empatados`, `c`.`partidos_perdidos` AS `partidos_perdidos`, `c`.`puntos` AS `puntos`, count(distinct `g`.`id_gol`) AS `goles_marcados`, count(distinct `t`.`id_tarjeta`) AS `tarjetas_totales` FROM (((((`equipos` `e` join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) left join `clasificacion` `c` on(`e`.`id_equipo` = `c`.`id_equipo`)) left join `jugadores` `j` on(`j`.`id_equipo` = `e`.`id_equipo`)) left join `goles` `g` on(`g`.`id_jugador` = `j`.`id_jugador`)) left join `tarjetas` `t` on(`t`.`id_jugador` = `j`.`id_jugador`)) GROUP BY `e`.`id_equipo`, `e`.`nombre`, `l`.`nombre`, `c`.`partidos_jugados`, `c`.`partidos_ganados`, `c`.`partidos_empatados`, `c`.`partidos_perdidos`, `c`.`puntos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_fair_play`
--
DROP TABLE IF EXISTS `vista_fair_play`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fair_play`  AS SELECT `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, sum(case when `t`.`tipo` = 'Amarilla' then 1 else 0 end) AS `amarillas`, sum(case when `t`.`tipo` = 'Roja' then 1 else 0 end) AS `rojas`, sum(case when `t`.`tipo` in ('Amarilla','Roja') then 1 else 0 end) AS `total_tarjetas` FROM (((`equipos` `e` join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) join `jugadores` `j` on(`j`.`id_equipo` = `e`.`id_equipo`)) left join `tarjetas` `t` on(`t`.`id_jugador` = `j`.`id_jugador`)) GROUP BY `e`.`nombre`, `l`.`nombre` ORDER BY sum(case when `t`.`tipo` in ('Amarilla','Roja') then 1 else 0 end) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_goleadores`
--
DROP TABLE IF EXISTS `vista_goleadores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_goleadores`  AS SELECT `l`.`nombre` AS `liga`, `j`.`nombre` AS `jugador`, `e`.`nombre` AS `equipo`, count(`g`.`id_gol`) AS `goles` FROM (((`goles` `g` join `jugadores` `j` on(`g`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) GROUP BY `l`.`nombre`, `j`.`nombre`, `e`.`nombre` ORDER BY `l`.`nombre` ASC, count(`g`.`id_gol`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_goleadores_equipo`
--
DROP TABLE IF EXISTS `vista_goleadores_equipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_goleadores_equipo`  AS SELECT `e`.`nombre` AS `equipo`, `j`.`nombre` AS `jugador`, count(`g`.`id_gol`) AS `goles` FROM ((`goles` `g` join `jugadores` `j` on(`g`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) GROUP BY `e`.`nombre`, `j`.`nombre` ORDER BY `e`.`nombre` ASC, count(`g`.`id_gol`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_partidos`
--
DROP TABLE IF EXISTS `vista_historial_partidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_partidos`  AS SELECT `p`.`id_partido` AS `id_partido`, `l`.`nombre` AS `liga`, `e_local`.`nombre` AS `local`, `e_visitante`.`nombre` AS `visitante`, `p`.`fecha_hora` AS `fecha_hora`, `p`.`estadio` AS `estadio`, `p`.`goles_local` AS `goles_local`, `p`.`goles_visitante` AS `goles_visitante`, CASE WHEN `p`.`goles_local` > `p`.`goles_visitante` THEN `e_local`.`nombre` WHEN `p`.`goles_visitante` > `p`.`goles_local` THEN `e_visitante`.`nombre` ELSE 'Empate' END AS `resultado` FROM (((`partidos` `p` join `ligas` `l` on(`p`.`id_liga` = `l`.`id_liga`)) join `equipos` `e_local` on(`e_local`.`id_equipo` <> 0)) join `equipos` `e_visitante` on(`e_visitante`.`id_equipo` <> 0)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_jugadores_expulsados`
--
DROP TABLE IF EXISTS `vista_jugadores_expulsados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_jugadores_expulsados`  AS SELECT `j`.`nombre` AS `jugador`, `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, count(`t`.`id_tarjeta`) AS `rojas` FROM (((`tarjetas` `t` join `jugadores` `j` on(`t`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) WHERE `t`.`tipo` = 'Roja' GROUP BY `j`.`nombre`, `e`.`nombre`, `l`.`nombre` ORDER BY count(`t`.`id_tarjeta`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ligas_resumen`
--
DROP TABLE IF EXISTS `vista_ligas_resumen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ligas_resumen`  AS SELECT `l`.`id_liga` AS `id_liga`, `l`.`nombre` AS `nombre`, `l`.`pais` AS `pais`, `l`.`temporada` AS `temporada`, `l`.`fecha_inicio` AS `fecha_inicio`, `l`.`fecha_fin` AS `fecha_fin`, to_days(`l`.`fecha_fin`) - to_days(`l`.`fecha_inicio`) AS `duracion_dias`, count(`e`.`id_equipo`) AS `total_equipos` FROM (`ligas` `l` left join `equipos` `e` on(`l`.`id_liga` = `e`.`id_liga`)) GROUP BY `l`.`id_liga`, `l`.`nombre`, `l`.`pais`, `l`.`temporada`, `l`.`fecha_inicio`, `l`.`fecha_fin` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_local_vs_visitante`
--
DROP TABLE IF EXISTS `vista_local_vs_visitante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_local_vs_visitante`  AS SELECT `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, sum(case when `e`.`id_equipo` then `p`.`goles_local` else 0 end) AS `goles_local`, sum(case when `e`.`id_equipo` then `p`.`goles_visitante` else 0 end) AS `goles_visitante`, sum(case when `e`.`id_equipo` then `p`.`goles_visitante` else 0 end) AS `goles_recibidos_local`, sum(case when `e`.`id_equipo` then `p`.`goles_local` else 0 end) AS `goles_recibidos_visitante` FROM ((`equipos` `e` join `ligas` `l` on(`l`.`id_liga` <> 0)) join `partidos` `p` on(`e`.`id_equipo` <> 0 or `e`.`id_equipo` <> 0)) GROUP BY `e`.`nombre`, `l`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_maximas_goleadas`
--
DROP TABLE IF EXISTS `vista_maximas_goleadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_maximas_goleadas`  AS SELECT `p`.`id_partido` AS `id_partido`, `l`.`nombre` AS `liga`, `e_local`.`nombre` AS `local`, `e_visitante`.`nombre` AS `visitante`, `p`.`goles_local` AS `goles_local`, `p`.`goles_visitante` AS `goles_visitante`, abs(`p`.`goles_local` - `p`.`goles_visitante`) AS `diferencia` FROM (((`partidos` `p` join `ligas` `l` on(`l`.`id_liga` <> 0)) join `equipos` `e_local` on(`e_local`.`id_equipo` <> 0)) join `equipos` `e_visitante` on(`e_visitante`.`id_equipo` <> 0)) WHERE `p`.`estado` = 'Finalizado' ORDER BY abs(`p`.`goles_local` - `p`.`goles_visitante`) DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_mejores_equipos`
--
DROP TABLE IF EXISTS `vista_mejores_equipos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_mejores_equipos`  AS SELECT `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, `c`.`puntos` AS `puntos`, `c`.`diferencia_goles` AS `diferencia_goles` FROM ((`clasificacion` `c` join `equipos` `e` on(`c`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`c`.`id_liga` = `l`.`id_liga`)) ORDER BY `c`.`puntos` DESC, `c`.`diferencia_goles` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_partidos_detalle`
--
DROP TABLE IF EXISTS `vista_partidos_detalle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_partidos_detalle`  AS SELECT `p`.`id_partido` AS `id_partido`, `p`.`fecha_hora` AS `fecha_hora`, `p`.`estadio` AS `estadio`, `e1`.`nombre` AS `equipo_local`, `e2`.`nombre` AS `equipo_visitante`, `p`.`goles_local` AS `goles_local`, `p`.`goles_visitante` AS `goles_visitante`, `a`.`nombre` AS `arbitro`, `a`.`nacionalidad` AS `pais_arbitro`, `p`.`estado` AS `estado` FROM ((((`partidos` `p` join `equipos` `e1` on(`p`.`id_equipo_local` = `e1`.`id_equipo`)) join `equipos` `e2` on(`p`.`id_equipo_visitante` = `e2`.`id_equipo`)) join `arbitros_partido` `ap` on(`p`.`id_partido` = `ap`.`id_partido`)) join `arbitros` `a` on(`ap`.`id_arbitro` = `a`.`id_arbitro`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_partidos_espectaculares`
--
DROP TABLE IF EXISTS `vista_partidos_espectaculares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_partidos_espectaculares`  AS SELECT `p`.`id_partido` AS `id_partido`, `l`.`nombre` AS `liga`, `e_local`.`nombre` AS `local`, `e_visitante`.`nombre` AS `visitante`, `p`.`goles_local` AS `goles_local`, `p`.`goles_visitante` AS `goles_visitante`, `p`.`goles_local`+ `p`.`goles_visitante` AS `total_goles` FROM (((`partidos` `p` join `ligas` `l` on(`l`.`id_liga` <> 0)) join `equipos` `e_local` on(`e_local`.`id_equipo` <> 0)) join `equipos` `e_visitante` on(`e_visitante`.`id_equipo` <> 0)) WHERE `p`.`goles_local` + `p`.`goles_visitante` >= 3 ORDER BY `p`.`goles_local`+ `p`.`goles_visitante` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_partidos_pendientes`
--
DROP TABLE IF EXISTS `vista_partidos_pendientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_partidos_pendientes`  AS SELECT `p`.`id_partido` AS `id_partido`, `l`.`nombre` AS `liga`, `e_local`.`nombre` AS `local`, `e_visitante`.`nombre` AS `visitante`, `p`.`fecha_hora` AS `fecha_hora`, `p`.`estadio` AS `estadio`, `p`.`estado` AS `estado` FROM (((`partidos` `p` join `ligas` `l` on(`l`.`id_liga` <> 0)) join `equipos` `e_local` on(`e_local`.`id_equipo` <> 0)) join `equipos` `e_visitante` on(`e_visitante`.`id_equipo` <> 0)) WHERE `p`.`estado` = 'Pendiente' ORDER BY `p`.`fecha_hora` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_promedio_goles`
--
DROP TABLE IF EXISTS `vista_promedio_goles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_promedio_goles`  AS SELECT `l`.`nombre` AS `liga`, count(`p`.`id_partido`) AS `total_partidos`, sum(`p`.`goles_local` + `p`.`goles_visitante`) AS `total_goles`, round(avg(`p`.`goles_local` + `p`.`goles_visitante`),2) AS `promedio_goles` FROM (`partidos` `p` join `ligas` `l` on(`p`.`id_liga` = `l`.`id_liga`)) WHERE `p`.`estado` = 'Finalizado' GROUP BY `l`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_rachas`
--
DROP TABLE IF EXISTS `vista_rachas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_rachas`  AS SELECT `e`.`nombre` AS `equipo`, group_concat(case when `e`.`id_equipo` <> 0 and `p`.`goles_local` > `p`.`goles_visitante` or `e`.`id_equipo` <> 0 and `p`.`goles_visitante` > `p`.`goles_local` then 'V' when `p`.`goles_local` = `p`.`goles_visitante` then 'E' else 'D' end order by `p`.`fecha_hora` DESC separator ',' limit 5) AS `ultimos_5` FROM (`equipos` `e` join `partidos` `p` on(`e`.`id_equipo` <> 0 or `e`.`id_equipo` <> 0)) WHERE `p`.`estado` = 'Finalizado' GROUP BY `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ranking_porteros`
--
DROP TABLE IF EXISTS `vista_ranking_porteros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ranking_porteros`  AS SELECT `j`.`nombre` AS `portero`, `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, count(`g`.`id_gol`) AS `goles_recibidos` FROM (((`jugadores` `j` join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) left join `goles` `g` on(`g`.`id_jugador` = `j`.`id_jugador`)) WHERE `j`.`posicion` = 'Portero' GROUP BY `j`.`nombre`, `e`.`nombre`, `l`.`nombre` ORDER BY count(`g`.`id_gol`) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tabla_historica`
--
DROP TABLE IF EXISTS `vista_tabla_historica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tabla_historica`  AS SELECT `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, sum(`c`.`puntos`) AS `puntos_totales`, sum(`c`.`partidos_ganados`) AS `victorias_totales`, sum(`c`.`partidos_empatados`) AS `empates_totales`, sum(`c`.`partidos_perdidos`) AS `derrotas_totales` FROM ((`clasificacion` `c` join `equipos` `e` on(`e`.`id_equipo` <> 0)) join `ligas` `l` on(`l`.`id_liga` <> 0)) GROUP BY `e`.`nombre`, `l`.`nombre` ORDER BY sum(`c`.`puntos`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tarjetas_jugadores`
--
DROP TABLE IF EXISTS `vista_tarjetas_jugadores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tarjetas_jugadores`  AS SELECT `j`.`id_jugador` AS `id_jugador`, `j`.`nombre` AS `nombre`, `j`.`posicion` AS `posicion`, `e`.`nombre` AS `equipo`, count(case when `t`.`tipo` = 'Amarilla' then 1 end) AS `total_amarillas`, count(case when `t`.`tipo` = 'Roja' then 1 end) AS `total_rojas` FROM ((`jugadores` `j` left join `tarjetas` `t` on(`j`.`id_jugador` = `t`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) GROUP BY `j`.`id_jugador`, `j`.`nombre`, `j`.`posicion`, `e`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_top_goleadores`
--
DROP TABLE IF EXISTS `vista_top_goleadores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_top_goleadores`  AS SELECT `j`.`nombre` AS `jugador`, `e`.`nombre` AS `equipo`, `l`.`nombre` AS `liga`, count(`g`.`id_gol`) AS `total_goles` FROM (((`goles` `g` join `jugadores` `j` on(`g`.`id_jugador` = `j`.`id_jugador`)) join `equipos` `e` on(`j`.`id_equipo` = `e`.`id_equipo`)) join `ligas` `l` on(`e`.`id_liga` = `l`.`id_liga`)) GROUP BY `j`.`nombre`, `e`.`nombre`, `l`.`nombre` ORDER BY count(`g`.`id_gol`) DESC LIMIT 0, 10 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  ADD PRIMARY KEY (`id_arbitro`);

--
-- Indices de la tabla `arbitros_partido`
--
ALTER TABLE `arbitros_partido`
  ADD PRIMARY KEY (`id_arbitro_partido`),
  ADD KEY `id_partido` (`id_partido`),
  ADD KEY `id_arbitro` (`id_arbitro`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id_clasificacion`),
  ADD UNIQUE KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_liga` (`id_liga`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_liga` (`id_liga`);

--
-- Indices de la tabla `goles`
--
ALTER TABLE `goles`
  ADD PRIMARY KEY (`id_gol`),
  ADD KEY `id_partido` (`id_partido`),
  ADD KEY `id_jugador` (`id_jugador`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `ligas`
--
ALTER TABLE `ligas`
  ADD PRIMARY KEY (`id_liga`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `id_equipo_local` (`id_equipo_local`),
  ADD KEY `id_equipo_visitante` (`id_equipo_visitante`),
  ADD KEY `id_liga` (`id_liga`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `id_partido` (`id_partido`),
  ADD KEY `id_jugador` (`id_jugador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `arbitros`
--
ALTER TABLE `arbitros`
  MODIFY `id_arbitro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `arbitros_partido`
--
ALTER TABLE `arbitros_partido`
  MODIFY `id_arbitro_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `goles`
--
ALTER TABLE `goles`
  MODIFY `id_gol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ligas`
--
ALTER TABLE `ligas`
  MODIFY `id_liga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arbitros_partido`
--
ALTER TABLE `arbitros_partido`
  ADD CONSTRAINT `arbitros_partido_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`) ON DELETE CASCADE,
  ADD CONSTRAINT `arbitros_partido_ibfk_2` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitros` (`id_arbitro`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_ibfk_1` FOREIGN KEY (`id_liga`) REFERENCES `ligas` (`id_liga`) ON DELETE CASCADE,
  ADD CONSTRAINT `clasificacion_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_liga`) REFERENCES `ligas` (`id_liga`) ON DELETE CASCADE;

--
-- Filtros para la tabla `goles`
--
ALTER TABLE `goles`
  ADD CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`) ON DELETE CASCADE,
  ADD CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE;

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`id_equipo_local`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `equipos` (`id_equipo`) ON DELETE CASCADE,
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`id_liga`) REFERENCES `ligas` (`id_liga`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`) ON DELETE CASCADE,
  ADD CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
