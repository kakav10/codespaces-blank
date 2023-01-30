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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body (
    name character varying(30) NOT NULL,
    age_byo integer,
    distance_mly numeric(7,3),
    has_been_visited boolean DEFAULT false NOT NULL,
    times_visited integer DEFAULT 0 NOT NULL,
    details text,
    name2 character varying(30),
    celestial_body_id integer NOT NULL
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_celestial_body_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL
)
INHERITS (public.celestial_body);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
)
INHERITS (public.celestial_body);


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


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL
)
INHERITS (public.celestial_body);


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
-- Name: space_ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_ship (
    space_ship_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    passengers_capacity integer DEFAULT 2 NOT NULL,
    autonomy_months integer DEFAULT 2 NOT NULL,
    weight_ton numeric(7,3),
    has_traveled boolean DEFAULT false NOT NULL,
    details text
);


ALTER TABLE public.space_ship OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_ship_space_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_ship_space_ship_id_seq OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_ship_space_ship_id_seq OWNED BY public.space_ship.space_ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
)
INHERITS (public.celestial_body);


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


--
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


--
-- Name: galaxy has_been_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN has_been_visited SET DEFAULT false;


--
-- Name: galaxy times_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN times_visited SET DEFAULT 0;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


--
-- Name: moon has_been_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN has_been_visited SET DEFAULT false;


--
-- Name: moon times_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN times_visited SET DEFAULT 0;


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


--
-- Name: planet has_been_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN has_been_visited SET DEFAULT false;


--
-- Name: planet times_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN times_visited SET DEFAULT 0;


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


--
-- Name: space_ship space_ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship ALTER COLUMN space_ship_id SET DEFAULT nextval('public.space_ship_space_ship_id_seq'::regclass);


--
-- Name: star has_been_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN has_been_visited SET DEFAULT false;


--
-- Name: star times_visited; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN times_visited SET DEFAULT 0;


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


--
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 10, 0.000, true, 93238, 'Has known and unknown forms of life', 1, NULL, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 11, 12.400, false, 0, 'Once called The Great Andromeda Nebula', 2, NULL, 2);
INSERT INTO public.galaxy VALUES ('Triangulum', 13, 325.600, false, 0, 'A diffuse objet', 3, NULL, 3);
INSERT INTO public.galaxy VALUES ('Centaurus A', 9, 925.700, false, 0, 'Another diffuse object', 4, NULL, 4);
INSERT INTO public.galaxy VALUES ('Large Magellanic', 3, 117.600, false, 0, 'Visible from only he southern hemisphere', 5, NULL, 5);
INSERT INTO public.galaxy VALUES ('Virgo A', 9, 632.000, false, 0, 'A stellar stream in the constellation of Virgo', 6, NULL, 6);
INSERT INTO public.galaxy VALUES ('Canis major', 12, 197.300, true, 1, 'A dwarf galaxy in the process of being pulled apart  by the gravitational field of  the more massive Milky Way Galaxy', 7, NULL, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 3, 0.001, true, 52, 'The marvelous lady of the night', 1, 1, NULL, 29);
INSERT INTO public.moon VALUES ('Phobos', 2, 0.012, false, 0, 'Red Moon', 2, 2, NULL, 30);
INSERT INTO public.moon VALUES ('Deimos', 2, 0.012, false, 0, 'Red Moon II', 3, 2, NULL, 31);
INSERT INTO public.moon VALUES ('Europa', 6, 0.034, false, 0, 'Another Jupiters giant moon', 4, 3, NULL, 32);
INSERT INTO public.moon VALUES ('Ganimedes', 6, 0.034, false, 0, 'Another Jupiters giant moon', 5, 3, NULL, 33);
INSERT INTO public.moon VALUES ('Calisto', 6, 0.034, false, 0, 'Another Jupiters giant moon', 6, 3, NULL, 34);
INSERT INTO public.moon VALUES ('Amalteia', 6, 0.034, false, 0, 'Another Jupiters giant moon', 7, 3, NULL, 35);
INSERT INTO public.moon VALUES ('Adrasteia', 6, 0.034, false, 0, 'Another Jupiters giant moon', 8, 3, NULL, 36);
INSERT INTO public.moon VALUES ('Tebe', 6, 0.034, false, 0, 'Another Jupiters giant moon', 9, 3, NULL, 37);
INSERT INTO public.moon VALUES ('Himalia', 6, 0.034, false, 0, 'Another Jupiters giant moon', 10, 3, NULL, 38);
INSERT INTO public.moon VALUES ('IO', 6, 0.034, false, 0, 'Another Jupiters giant moon', 11, 3, NULL, 39);
INSERT INTO public.moon VALUES ('ThreatLandMoon', 5, 22.900, false, 0, 'The ThreatLand moon', 12, 6, NULL, 40);
INSERT INTO public.moon VALUES ('EarthCousantMoon', 5, 123.900, false, 0, 'Lovely moon', 13, 7, NULL, 41);
INSERT INTO public.moon VALUES ('EarthEnemyMon', 5, 123.900, false, 0, 'Lovely moon II', 14, 8, NULL, 42);
INSERT INTO public.moon VALUES ('WhyNotLiveHereMoon', 5, 973.900, false, 0, 'Lovely and Cool huh?', 15, 9, NULL, 43);
INSERT INTO public.moon VALUES ('Far far away moom', 5, 973.900, false, 0, 'Lovely and Cool huh? II', 16, 10, NULL, 44);
INSERT INTO public.moon VALUES ('Not your home moom', 5, 389.900, false, 0, 'Definitely not your home hoom', 17, 11, NULL, 45);
INSERT INTO public.moon VALUES ('What r u looking at moom', 5, 390.110, false, 0, 'Nothing to look at this moon', 18, 12, NULL, 46);
INSERT INTO public.moon VALUES ('TheSiriusBlack Moon', 5, 221.220, true, 1, 'Moon to Harry Potters best friend Sirius Black', 19, 13, NULL, 47);
INSERT INTO public.moon VALUES ('AggressiveAliens Moon', 5, 220.980, false, 0, 'This is moon for aggressive aliens', 21, 14, NULL, 48);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 5, 0.000, true, 999999, 'Home to nearly 8 billions of humans', 1, 1, NULL, 15);
INSERT INTO public.planet VALUES ('Mars', 4, 0.020, true, 7, 'Home of billions of invisible red martians', 2, 1, NULL, 16);
INSERT INTO public.planet VALUES ('Jupiter', 5, 0.030, false, 0, 'The giant hamburger', 3, 1, NULL, 17);
INSERT INTO public.planet VALUES ('RedPsychosis', 5, 45.340, false, 0, 'Red diamond factory', 4, 2, NULL, 18);
INSERT INTO public.planet VALUES ('OrionMaker', 5, 23.100, false, 0, 'Were orions are made', 5, 3, NULL, 19);
INSERT INTO public.planet VALUES ('ThreatLand', 5, 22.900, false, 0, 'The threat land', 6, 3, NULL, 20);
INSERT INTO public.planet VALUES ('EarthCousant', 5, 131.900, false, 0, 'Lovely earth Cousant', 7, 4, NULL, 21);
INSERT INTO public.planet VALUES ('EarthEnemy', 5, 131.300, false, 0, 'Home for enemies', 8, 4, NULL, 22);
INSERT INTO public.planet VALUES ('WhyNotLiveHere', 5, 997.340, false, 0, 'Cool, huh?', 9, 5, NULL, 23);
INSERT INTO public.planet VALUES ('Far Far Away', 5, 997.670, false, 0, 'Too far away for visiting', 10, 5, NULL, 24);
INSERT INTO public.planet VALUES ('Not your home', 5, 389.330, false, 0, 'Definitely not your home', 11, 6, NULL, 25);
INSERT INTO public.planet VALUES ('What r u looking at', 5, 390.110, false, 0, 'Nothing to look here', 12, 6, NULL, 26);
INSERT INTO public.planet VALUES ('TheSiriusBlackhome', 5, 220.980, false, 0, 'This is home for aggressive aliens', 13, 7, NULL, 27);
INSERT INTO public.planet VALUES ('AggressiveAlienshome', 5, 220.980, false, 0, 'This is home for aggressive aliens', 14, 7, NULL, 28);


--
-- Data for Name: space_ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_ship VALUES (1, 1, 'aPOLLO 10', 2, 5, 2.400, true, 'ALMOST TOOK HUMAM KIND TO THE MOON');
INSERT INTO public.space_ship VALUES (2, 1, 'Apollo 11', 3, 5, 2.400, true, 'Actually took human kind to the Moon');
INSERT INTO public.space_ship VALUES (3, 1, 'Apollo 14', 10, 120, 9.400, false, 'Will take human kind to Mars (allegedly)');
INSERT INTO public.space_ship VALUES (4, 2, 'Mars 1', 400, 500, 12.400, false, 'Will bring martians to Earth (allegedly)');
INSERT INTO public.space_ship VALUES (5, 13, 'The Sirius Space bus', 900, 5000, 19.400, true, 'Brought Sirius Black and his family back to Hogwarts to fight Voldemorts army');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 3256, 0.000, true, 29, 'A nearly perfect ball of hot plasma', 1, 1, NULL, 8);
INSERT INTO public.star VALUES ('Alpha', 313, 0.002, false, 0, 'THE BRIGHTEST STAR in the constellation of Andromeda', 2, 2, NULL, 9);
INSERT INTO public.star VALUES ('Gama Trianguli', 14, 12.530, false, 0, 'A binary star system in the constellation Triangulum', 3, 3, NULL, 10);
INSERT INTO public.star VALUES ('Proxima Centauri', 9448, 10.270, false, 0, 'A red dwarf', 4, 4, NULL, 11);
INSERT INTO public.star VALUES ('R71', 89346, 742.610, false, 0, 'A luminous blue variable', 5, 5, NULL, 12);
INSERT INTO public.star VALUES ('Epsilon Virginis', 63431, 928.420, false, 0, 'A zodiac variable', 6, 6, NULL, 13);
INSERT INTO public.star VALUES ('Sirius', 951, 26.320, true, 1, 'THE BRIGHTEST STAR in the night sky, known as The Dog Star', 7, 7, NULL, 14);


--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_celestial_body_id_seq', 48, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_ship_space_ship_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: celestial_body cb_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT cb_name_unique UNIQUE (name);


--
-- Name: celestial_body celestial_body_name2_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name2_key UNIQUE (name2);


--
-- Name: celestial_body celestial_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_pkey PRIMARY KEY (celestial_body_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_ship space_ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_name_key UNIQUE (name);


--
-- Name: space_ship space_ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_pkey PRIMARY KEY (space_ship_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_ship space_ship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

