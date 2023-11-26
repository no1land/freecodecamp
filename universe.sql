--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL UNIQUE,
    description text,
    galaxy_types integer,
    distance_from_earth bigint,
    name character varying(32) NOT NULL,
    has_life boolean
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

INSERT INTO public.cluster (cluster_id, description, galaxy_types, distance_from_earth, name, has_life) VALUES
(1, 'Local Group, containing Milky Way and Andromeda among others', 1, 0, 'Local Group', true),
(2, 'Virgo Cluster, part of the Virgo Supercluster, containing about 1300-2000 galaxies', 2, 53000000, 'Virgo Cluster', false),
(3, 'Coma Cluster, a large cluster containing thousands of galaxies', 1, 320000000, 'Coma Cluster', false);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL UNIQUE,
    name character varying(32) NOT NULL,
    distance_from_earth integer,
    galaxy_types integer,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_glaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_glaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_glaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_glaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_glaxy_id_seq OWNED BY public.galaxy.galaxy_id;


INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, galaxy_types, has_life) VALUES
(1, 'Milky Way', 0, 1, true),
(2, 'Andromeda', 2500000, 1, false),
(3, 'Triangulum', 3000000, 1, false),
(4, 'Large Magellanic Cloud', 163000, 3, false),
(5, 'Small Magellanic Cloud', 200000, 3, false),
(6, 'Sombrero Galaxy', 29000000, 1, false);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL UNIQUE,
    name character varying(32) NOT NULL,
    planet_id integer,
    distance_from_earth bigint,
    has_life boolean
);

ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


INSERT INTO public.moon (moon_id, name, planet_id, distance_from_earth, has_life) VALUES
(1, 'Moon', 3, 384400, false),
(2, 'Io', 5, 628300000, false),
(3, 'Europa', 5, 628300000, false),
(4, 'Ganymede', 5, 628300000, false),
(5, 'Callisto', 5, 628300000, false),
(6, 'Titan', 6, 1275000000, false),
(7, 'Rhea', 6, 1275000000, false),
(8, 'Iapetus', 6, 1275000000, false),
(9, 'Dione', 6, 1275000000, false),
(10, 'Tethys', 6, 1275000000, false),
(11, 'Enceladus', 6, 1275000000, false),
(12, 'Mimas', 6, 1275000000, false),
(13, 'Miranda', 7, 2711700000, false),
(14, 'Ariel', 7, 2711700000, false),
(15, 'Umbriel', 7, 2711700000, false),
(16, 'Oberon', 7, 2711700000, false),
(17, 'Titania', 7, 2711700000, false),
(18, 'Triton', 8, 4495100000, false),
(19, 'Charon', 9, 5913520000, false),
(20, 'Nix', 9, 5913520000, false);



--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL UNIQUE,
    name character varying(32) NOT NULL,
    star_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_types integer,
    distance_from_earth bigint,
    age_in_millions_of_years numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet (planet_id, name, star_id, description, has_life, is_spherical, planet_types, distance_from_earth, age_in_millions_of_years) VALUES
(1, 'Mercury', 1, 'Smallest planet in our Solar System, closest to the Sun.', false, true, 1, 91700000, 4500),
(2, 'Venus', 1, 'Second planet from the Sun, hottest in our Solar System.', false, true, 1, 41400000, 4500),
(3, 'Earth', 1, 'Our home planet, third from the Sun.', true, true, 1, 0, 4500),
(4, 'Mars', 1, 'Fourth planet from the Sun, known as the Red Planet.', false, true, 1, 78340000, 4500),
(5, 'Jupiter', 1, 'Largest planet in our Solar System.', false, true, 2, 628300000, 4500),
(6, 'Saturn', 1, 'Known for its prominent ring system.', false, true, 2, 1275000000, 4500),
(7, 'Uranus', 1, 'Ice giant with a unique sideways rotation.', false, true, 2, 2711700000, 4500),
(8, 'Neptune', 1, 'Farthest known planet in our Solar System.', false, true, 2, 4495100000, 4500),
(9, 'Pluto', 1, 'Dwarf planet in the Kuiper belt.', false, true, 3, 5913520000, 4500),
(10, 'Proxima Centauri b', 2, 'Exoplanet orbiting the closest star to the Sun.', false, true, 1, 40000000000, 4860),
(11, 'Kepler-22b', 3, 'A potentially habitable exoplanet in the Kepler-22 system.', false, true, 1, 620000000000, 3000),
(12, 'TRAPPIST-1d', 3, 'One of seven Earth-size exoplanets in the TRAPPIST-1 system.', false, true, 1, 39000000000, 5000);


CREATE TABLE public.star (
    star_id integer NOT NULL UNIQUE, 
    name character varying(32) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth integer,
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


INSERT INTO public.star (star_id, name, galaxy_id, distance_from_earth, has_life) VALUES
(1, 'Sun', 1, 0, true),
(2, 'Proxima Centauri', 1, 4.24, false),
(3, 'Sirius', 1, 8.6, false),
(4, 'Alpha Centauri A', 1, 4.37, false),
(5, 'Alpha Centauri B', 1, 4.37, false),
(6, 'Betelgeuse', 1, 642.5, false);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_glaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy_glaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_glaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

