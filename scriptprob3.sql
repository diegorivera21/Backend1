drop schema if exists educativa;
create schema educativa;


create table educativa.cursos (
	idCurso int primary key not null,
    Nombre char(20) not null,
    descripcion varchar(70),
    precio float,
    horario time
);

create table educativa.profesores (
	idProfesor int primary key not null,
    Nombre char(40) not null,
    foto_profesor blob,
    descripcion_profesor varchar(100)
);

create table educativa.alumnos (
	idAlumno int primary key not null,
    Nombre char(40) not null,
    celular char(8),
    DNI char(9) unique not null,
    email varchar(45) unique not null
);
create table educativa.profesor_has_cursos (
	idProfesor int ,
    idCurso int ,
    primary key(idProfesor,idCurso),
    foreign key(idProfesor) references profesores(idProfesor) on delete cascade,
    foreign key(idCurso) references cursos(idCurso) on delete cascade
    
);
create table educativa.alumnos_has_cursos (
	idAlumno int ,
    idCurso int  ,
    primary key(idAlumno,idCurso),
    foreign key(idAlumno) references alumnos(idAlumno) on delete cascade,
    foreign key(idCurso) references cursos(idCurso)on delete cascade
    
);
insert into alumnos value (
	74736182,
    'Diego Lara',
    '62524510',
    '999213455',
    'diego.lara@gmail.com'
);
insert into cursos value (
	4547,
    'X',
    'hola com estas',
    1.2,
    8
);



select nombre from alumnos where cursos.nombre='X';
select * from cursos where count(profesores)>1;
 select * from alumnos where count(cursos)>1;
 select nombre from alumnos where cursos.nombre='X' and cursos.nombre='Y';



