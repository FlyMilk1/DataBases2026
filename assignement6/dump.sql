--
-- PostgreSQL database dump
--

\restrict P4glj3pelZ9UOaZ2n8kJoeqmi19aEiBwAdBoihsKQQyc47bL3yzo04AE6ypae2U

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classes_id_seq OWNER TO postgres;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    class_id integer NOT NULL,
    subject_id integer NOT NULL,
    teacher_id integer NOT NULL,
    room_id integer NOT NULL,
    weekday smallint NOT NULL,
    period smallint NOT NULL,
    CONSTRAINT lessons_period_check CHECK (((period >= 1) AND (period <= 7))),
    CONSTRAINT lessons_weekday_check CHECK (((weekday >= 1) AND (weekday <= 5)))
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lessons_id_seq OWNER TO postgres;

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    room_number character varying(20) NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subjects_id_seq OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (id, name) FROM stdin;
1	11A
2	11B
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, class_id, subject_id, teacher_id, room_id, weekday, period) FROM stdin;
1	1	1	1	1	1	1
2	1	2	2	2	1	2
3	1	3	3	3	1	3
4	1	4	1	1	1	4
5	1	2	2	1	2	1
6	1	1	1	2	2	2
7	1	3	3	3	3	1
8	2	3	3	2	1	1
9	2	4	1	1	1	2
10	2	1	1	3	2	1
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, room_number) FROM stdin;
1	204
2	301
3	105
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name) FROM stdin;
1	Databases
2	Systems Programming
3	Mathematics
4	English
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, full_name) FROM stdin;
1	Ivan Ivanov
2	Maria Petrova
3	Georgi Georgiev
\.


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_id_seq', 2, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 12, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 3, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 4, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 3, true);


--
-- Name: classes classes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_name_key UNIQUE (name);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_room_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_number_key UNIQUE (room_number);


--
-- Name: subjects subjects_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_name_key UNIQUE (name);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: lessons uq_class_slot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT uq_class_slot UNIQUE (class_id, weekday, period);


--
-- Name: lessons uq_room_slot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT uq_room_slot UNIQUE (room_id, weekday, period);


--
-- Name: lessons uq_teacher_slot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT uq_teacher_slot UNIQUE (teacher_id, weekday, period);


--
-- Name: lessons lessons_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- Name: lessons lessons_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- Name: lessons lessons_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: lessons lessons_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- PostgreSQL database dump complete
--

\unrestrict P4glj3pelZ9UOaZ2n8kJoeqmi19aEiBwAdBoihsKQQyc47bL3yzo04AE6ypae2U

