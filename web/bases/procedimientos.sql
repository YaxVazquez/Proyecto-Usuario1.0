drop procedure if exists addUser;
delimiter //
 create procedure addUser(IdUs int(3), NombreUs varchar(30), NomApell varchar(20), Con varchar(20), Email varchar(30))
 begin 
	declare xIdUs int;
    declare xMsj nvarchar(50);
    declare existe int;
    
    if (idUs = 0) then
		set existe = (select count(*) from Usuario where Correo = Email);
        if (existe = 0) then
			set xIdUs = (select ifnull(max(IdUsuario),0) + 1 from Usuario);
            
            insert into Usuario (IdUsuario, NombreUsuario, Nombre, Contraseña, Correo) values(xIdUs, NombreUs, NomApell ,Con, Email);
            set xMsj ="Registro exitoso";
		else 
			set xMsj = "Usuario ya registrado";
			set xIdUs = 0;
		end if;
    else 
		update Usuario set Contrasenia = Con, Nombre = Nom where idUsuario = idUs;
        set xMsj = "Datos modificados";
        set xIdUs = idUs;
    end if;
    select xIdUs as IdUsuario, xMsj;
 end;//
 