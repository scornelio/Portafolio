-- Insertar los Roles
INSERT INTO Roles (NombreRol, Descripcion)
VALUES 
('Administrador', 'Usuario con acceso a todas las funcionalidades.'),
('Editor', 'Usuario con permisos para crear y editar entradas.'),
('Usuario', 'Usuario estándar con acceso básico.')
GO

-- Suponiendo que el hash se realiza en el servidor de aplicaciones y solo se inserta el resultado
INSERT INTO Usuarios (Nombre, Apellido, Email, NombreUsuario, Contrasena, Activo)
VALUES 
('Stuart', 'Cornelio', 'stuart.cornelio@example.com', 'scornelio','9YRElOKu5J29b8367zJMP6Vco/vjkwkQQWuGIYzXvnPVd6co' , 1),
('Grace', 'Sanchez', 'grace.sanchez@example.com', 'gsanchez', '9YRElOKu5J29b8367zJMP6Vco/vjkwkQQWuGIYzXvnPVd6co', 1)
GO

-- Obtener los IDs de los usuarios y roles
DECLARE @UserIDJuan INT, @UserIDLaura INT, @RoleIDAdmin INT, @RoleIDEditor INT;

SELECT @UserIDJuan = UsuarioId FROM Usuarios WHERE NombreUsuario = 'scornelio';
SELECT @UserIDLaura = UsuarioId FROM Usuarios WHERE NombreUsuario = 'gsanchez';
SELECT @RoleIDAdmin = RolId FROM Roles WHERE NombreRol = 'Administrador';
SELECT @RoleIDEditor = RolId FROM Roles WHERE NombreRol = 'Editor';

-- Asignar roles
INSERT INTO UsuarioRoles (UsuarioId, RolId)
VALUES 
(@UserIDJuan, @RoleIDAdmin),
(@UserIDLaura, @RoleIDEditor)
GO
