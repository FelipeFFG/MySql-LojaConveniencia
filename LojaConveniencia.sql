drop database Conveniencia;

create database Conveniencia;

																    #Felipe Fernandes Gomes
use Conveniencia;





create table TBProdutos(                                   
		Codigo_Produto int,
        Tipo_Produto varchar(20),
        Validade_Produto date,
        Fabricação_Produto date,
        primary key (Codigo_Produto));
   

insert into TBProdutos values(000001,'Regrigerante','2020-06-20','2020-01-20');   #Refrigerante     
insert into TBProdutos values(000002,'Detergente','2020-08-20','2020-02-20');     #Detergente     
insert into TBProdutos values(000003,'Lampada','2020-09-20','2020-03-20');        #Lampada      
insert into TBProdutos values(000004,'Amaciante','2020-10-20','2020-04-20');      #Amaciante
insert into TBProdutos values(000005,'PastaDeDente','2020-11-20','2020-05-20');   #PastaDeDente
insert into TBProdutos values(000006,'Vasoura','2020-06-20','2020-01-20');        #Vasoura

create table TBEstoque(                                    
		codigoEstoque int,
        Quantidade_Produto int,
        primary key (codigoEstoque),
        Codigo_Produto int,
        foreign key(Codigo_Produto) references TBProdutos(Codigo_Produto));

insert into TBEstoque values(00011,6,000001);   #Refrigerante
insert into TBEstoque values(00012,7,000002);   #Detergente
insert into TBEstoque values(00013,8,000003);	#Lampada
insert into TBEstoque values(00014,9,000004);   #Amaciante
insert into TBEstoque values(00015,10,000005);  #PastaDeDente 
insert into TBEstoque values(00016,11,000006);  #Vasoura


create table TBSexo(                                         
			cod_sexo int,                                 
            desc_sexo varchar(10),
            primary key (cod_sexo));
            
            
insert into TBSexo values(100,'Masculino');  #Masculino
insert into TBSexo values(101,'Feminino');   #Feminino
insert into TBSexo values(102,'Indefinido'); #Indefinido


## Entidade Especializada
create table TBCliente(                                     
		Nome varchar(70),
        Rua varchar(50),
        Numero int ,
        Complemento varchar(10),
        Cep char(8),
        email varchar(100),
        primary key (email));

insert into TBCliente values('joao','Rua joao',101,'ap41','80730360','joao@gmail.com');				#JOAO
insert into TBCliente values('ana','Rua ana',102,'ap42','80730361','ana@gmail.com');				#ANA
insert into TBCliente values('maria','Rua maria',103,'ap43','80730362','maria@gmail.com');			#MARIA

insert into TBCliente values('AAlojas','Rua AAlojas',104,'ap44','80730363','AAlojas@gmail.com');	#AAlojas
insert into TBCliente values('BBlojas','Rua BBlojas',105,'ap45','80730364','BBlojas@gmail.com');	#BBlojas
insert into TBCliente values('CClojas','Rua CClojas',106,'ap46','80730365','CClojas@gmail.com');	#CClojas
	
insert into TBCliente values('carlos','Rua carlos',107,'ap47','80730366','carlos@gmail.com');		#CARLOS
insert into TBCliente values('umberto','Rua umberto',108,'ap48','80730367','umberto@gmail.com');	#UMBERTO
insert into TBCliente values('marcelo','Rua marcelo',109,'ap49','80730368','marcelo@gmail.com');	#MARCELO

	
create table TBTelefone(
		Numero_Telefone char(9),
        email varchar(100),
        foreign key(email) references TBCliente(email),
        primary key(email));
        
insert into TBTelefone values('992640280','joao@gmail.com');    #TELEFONE JOAO
insert into TBTelefone values('992640281','ana@gmail.com');     #TELEFONE ANA
insert into TBTelefone values('992640282','maria@gmail.com');	#TELEFONE MARIA

insert into TBTelefone values('992640283','AAlojas@gmail.com'); #TELEFONE AAlojas
insert into TBTelefone values('992640284','BBlojas@gmail.com'); #TELEFONE BBlojas
insert into TBTelefone values('992640285','CClojas@gmail.com'); #TELEFONE CClojas

insert into TBTelefone values('992640286','carlos@gmail.com');  #TELEFONE CARLOS
insert into TBTelefone values('992640287','umberto@gmail.com'); #TELEFONE UMBERTO
insert into TBTelefone values('992640288','marcelo@gmail.com'); #TELEFONE MARCELO


create table TBFisico(
		cod_sexo int,
        rg char(9),
        cpf char(11),
        email varchar(100),
        foreign key(email) references TBCliente(email),
		primary key(email),
		foreign key(cod_sexo) references TBSexo(cod_sexo));
 
 
insert into TBFisico values(100,'098765432','09876543211','joao@gmail.com'); #TBFisico JOAO
insert into TBFisico values(101,'098765433','09876543212','ana@gmail.com');	 #TBFisico ANA
insert into TBFisico values(101,'098765434','09876543213','maria@gmail.com'); #TBFisico MARIA

insert into TBFisico values(100,'098765435','09876543214','carlos@gmail.com'); #TBFisico CARLOS
insert into TBFisico values(100,'098765436','09876543215','umberto@gmail.com'); #TBFisico UMBERTO
insert into TBFisico values(100,'098765437','09876543216','marcelo@gmail.com'); #TBFisico MARCELO


create table TBJuridico(
		CNPJ char(11),
        email varchar(100),
        foreign key(email) references TBCliente(email),
		primary key(email));
        
insert into TBJuridico values(12345678900,'AAlojas@gmail.com'); #TBJuridico AA
insert into TBJuridico values(12345678901,'BBlojas@gmail.com'); #TBJuridico BB
insert into TBJuridico values(12345678902,'CClojas@gmail.com'); #TBJuridico CC

create table TBPessoaJuridica(
		email_pessoa varchar(100),
        email_juridico varchar(100),
        foreign key(email_juridico) references TBCliente(email),
		primary key (email_juridico));
        
insert into TBPessoaJuridica values('carlos@gmail.com','AAlojas@gmail.com'); #TBPessoaJuridica CARLOS
insert into TBPessoaJuridica values('umberto@gmail.com','BBlojas@gmail.com');#TBPessoaJuridica UMBERTO
insert into TBPessoaJuridica values('marcelo@gmail.com','CClojas@gmail.com');#TBPessoaJuridica MARCELO
      

## Entidade Especializada
create table TBPrateleira(
		Codigo_Prateleira int,
        Catalogo varchar(20),
        primary key (Codigo_Prateleira),
        Codigo_Produto int,
        foreign key(Codigo_Produto) references TBProdutos(Codigo_Produto));
        
        

insert into TBPrateleira values(09876,'Bebidas',000001);      #TBPrateleiras Bebidas
insert into TBPrateleira values(09877,'Limpeza',000002);      #TBPrateleiras Limpeza
insert into TBPrateleira values(09878,'Limpeza',000004);      #TBPrateleiras Limpeza
insert into TBPrateleira values(09879,'Limpeza',000006);      #TBPrateleiras Limpeza
insert into TBPrateleira values(09870,'Ultilitarios',000003); #TBPrateleiras Ultilitarios
insert into TBPrateleira values(09871,'Banheiro',000005);     #TBPrateleiras Banheiro
	
    
create table TBFuncionario(
		Codigo_Funcionario int,
        Salario int,
        CPF char(11),
        RG char(9),
        primary key (Codigo_Funcionario));     

insert into TBFuncionario values(09231,1300,56765432816,345676543); #TBFuncionarios  01
insert into TBFuncionario values(09232,1400,56765432817,345676544);	#TBFuncionarios  02
insert into TBFuncionario values(09233,1500,56765432818,345676545); #TBFuncionarios  03
insert into TBFuncionario values(09234,1600,56765432819,345676546); #TBFuncionarios  04
insert into TBFuncionario values(09235,1700,56765432810,345676547); #TBFuncionarios  05
insert into TBFuncionario values(09236,1800,56765432811,345676548); #TBFuncionarios  06

        
   create table TBFornecedor(
		Codigo_fornecedor int,
        Produto varchar(20),
        Rua varchar(50),
        Numero int,
        Complemento varchar(10),
        Cep char(8),
        primary key (Codigo_fornecedor),
        Codigo_Produto int,
        foreign key(Codigo_Produto) references TBProdutos(Codigo_Produto));        
              
insert into TBFornecedor values(78765,'Bebida','Rua das bebidas',1044,'casa43',12343236,000001);              #Fornecedor Bebida
insert into TBFornecedor values(78766,'Limpeza','Rua das Limpeza',1045,'casa44',12343232,000002);             #Fornecedor Limpeza 01
insert into TBFornecedor values(78767,'Ultilitarios','Rua das Ultilitarios',1046,'casa45',12343239,000003);   #Fornecedor Ultilitarios                
insert into TBFornecedor values(78768,'Limpeza','Rua das Limpeza',1045,'casa46',12343232,000004);             #Fornecedor Limpeza 02
insert into TBFornecedor values(78769,'Banheiro','Rua das Banheiro',1047,'casa47',12343237,000005);           #Fornecedor Banheiro
insert into TBFornecedor values(78760,'Limpeza','Rua das Limpeza',1044,'casa48',12343232,000006);             #Fornecedor Limpeza 03
        
create table TBCompra(
		Codigo_Compra int,
        Valor_Compra int,
        Data_Compra date,
        Hora_Compra time,
        email varchar(100),
        Codigo_Prateleira int ,
        Codigo_Funcionario int,
		primary key (Codigo_Compra),
        foreign key(email) references TBCliente(email),
        foreign key(Codigo_Prateleira) references TBPrateleira(Codigo_Prateleira),
		foreign key(Codigo_Funcionario) references TBFuncionario(Codigo_Funcionario)
        );
        
        
insert into TBCompra values(87658,500,'2020-06-30','16:30:32','joao@gmail.com',09876,09231);   #TBCOMPRA 01
insert into TBCompra values(87657,1500,'2021-05-30','15:30:32','ana@gmail.com',09877,09232);   #TBCOMPRA 02
insert into TBCompra values(87656,2500,'2021-04-30','13:40:32','maria@gmail.com',09878,09233); #TBCOMPRA 03
insert into TBCompra values(87655,350,'2021-03-30','12:35:32','AAlojas@gmail.com',09879,09234);#TBCOMPRA 04
insert into TBCompra values(87654,300,'2022-04-30','11:50:32','BBlojas@gmail.com',09870,09235);#TBCOMPRA 05
insert into TBCompra values(87653,700,'2020-06-30','14:20:32','CClojas@gmail.com',09871,09236);#TBCOMPRA 06
insert into TBCompra values(87652,600,'2020-07-30','18:23:32','AAlojas@gmail.com',09877,09233);#TBCOMPRA 07
insert into TBCompra values(87651,500,'2021-04-30','17:43:32','ana@gmail.com',09876,09233);    #TBCOMPRA 08
insert into TBCompra values(87650,500,'2022-05-30','16:35:32','BBlojas@gmail.com',09878,09234);#TBCOMPRA 09





#NOME DOS CLIENTES QUE EFETURAM COMPRAS ACIMA DE 500 REAIS                        01
select TBCliente.Nome ,TBCompra.Valor_Compra                                      #No select selencionamos os nome dos clientes e os valores a qual buscamos  os valores
from TBCompra, TBCliente                                                          #a  tabela a qual iremos realizar a busca, sendo a TBCompra e a TBCliente
where TBCompra.Valor_Compra > 500                                                 #A condição de busca na qual ira pegar apenas os valores que apresentam valor de compra maior que 500 reias
	and TBCompra.email =TBCliente.email;

        
#OS EMAIL DOS CLIENTES QUE TIVERAM COMPRA ABAIXO DE 400 REIAS                     02
select TBCompra.email ,TBCompra.Valor_Compra                                      #no select selecionamos os atributos email e e valor da compra a qual queremos os valores
from TBCompra                                                                     #A tabela a qual iremos realizar as buscas, sendo ultilizado a TBCompra
where TBCompra.Valor_Compra < 400;                                                #A condição de busca sendo apenas os valores abaixo de 400 reais
	
#O CODIGO DOS FUNCIONARIOS QUE REALIZARAM MAIS VENDAS                             03
SELECT   Codigo_Funcionario,COUNT(Codigo_Funcionario) AS Qtd_Vendas               #no select selecionamos o codigo dos funcionarios e o count que vai realizar a quantidade de vendas de cada funcionario
FROM  TBCompra                                                                    #A TBCompra a qual vai ser realizado a busca
GROUP BY Codigo_Funcionario                                                       #A condição de busca, a qual a contagem de funcionarios necesita ser maior que 0 sendo ordenado de acordo com os que apresentam mais vendas 
HAVING   COUNT(Codigo_Funcionario) > 0
ORDER BY COUNT(Codigo_Funcionario) DESC;


#O CODIGO DO FORNECEDOR QUE FORNECE O REFRIGERANTE                                04
select Codigo_fornecedor                                                          #No select selecionamos o atributo a qual iremos retirar os dados codigo do fornecedor  
from TBFornecedor,TBProdutos                                                      #A busca na realizada na tabela TBFornecedor e TBProdutos
where TBProdutos.Codigo_Produto = 000001                                          #A condição de busca a qual apresentam o codigo do produto igual a 000001 e produto do fornecedor igual a BEBIDA
	and TBFornecedor.Codigo_Produto = TBProdutos.Codigo_Produto
    and TBFornecedor.Produto ='Bebida';


#QUANTIDADE DE DETERGENTE PRESENTE NO ESTOQUE                                     05
select TBProdutos.Tipo_Produto,TBEstoque.Quantidade_Produto                       #No select selecionamos o tipo do produto e quantidade do produto
from TBEstoque,TBProdutos                                                         #No From selecionamos as tabelas que iremos realizar a busca
where TBProdutos.Tipo_Produto = 'Detergente'                                      #A condição de busca, a qual é apenas os produtos que apresetam o tipo igual a Detergente
     and TBProdutos.Codigo_Produto = TBEstoque.Codigo_Produto;

#                                                                                 06
#A hora, valor, nome do cliente e código dos funcionários em que foi realizada os maiores valores de compra   
SELECT Hora_Compra as hora,MAX(Valor_Compra) as valor_compra ,TBCliente.Nome,TBFuncionario.Codigo_Funcionario as Cod_Funcionario                  
FROM TBCompra,TBCliente,TBFuncionario                                             #No select selecionamos os Atributos Hora,Valor,Nome do cliente,e o codigo do funcioanrio que realizou a venda
where TBCliente.email = TBCompra.email                                            #No From selecionamos as tres tabelas que iremos realizar a busca
      And TBFuncionario.Codigo_Funcionario =TBCompra.Codigo_Funcionario           #Em seguida selecionamos os paramentros que apresentam valores iguais nas tabelas a qual vai realizar a busca                                                           #A forma em que deve ser realizado a ordenação dos valores da tabela.
GROUP BY Hora_Compra                                                              #A forma em que deve ser realizado a ordenação dos valores da tabela.
ORDER BY MAX(Valor_Compra) DESC;
 
#                                                                                 07
#Data, valor, nome do cliente e código dos funcionários em que foram realizadas as menores compra na loja  
SELECT Data_Compra as data,MIN(Valor_Compra) as Valor,TBCliente.Nome,TBFuncionario.Codigo_Funcionario as Cod_Funcionario   
FROM TBCompra,TBCliente,TBFuncionario                                             #No select selecionamos os Atributos Data,Valor,Nome do cliente,e o codigo do funcioanrio que realizou a venda
where TBCliente.email = TBCompra.email                                            #No From selecionamos as tres tabelas que iremos realizar a busca
      And TBFuncionario.Codigo_Funcionario =TBCompra.Codigo_Funcionario           #Em seguida selecionamos os paramentros que apresentam valores iguais nas tabelas a qual vai realizar a busca
GROUP BY Data_Compra                                                              #A forma em que deve ser realizado a ordenação dos valores da tabela.
ORDER BY MIN(Valor_Compra);



#CPF dos que nao realizaram vendas em 2021      						          08
select CPF as CPF_Funcionarios                                                    #no select setamos o CPF dos clientes que desejamos retirar os dados
from TBFuncionario                                                                #A tabela a qual devemos realizar a busca, sendo a TBFuncionario
where  Codigo_Funcionario not in (                                                #A condição de busca, na qual sera os codigos dos funcionarios que nao apresentam venda no ano de 2021
				select Codigo_Funcionario
                from TBCompra
				where year(Data_Compra) = 2021 ) ;


#Nome dos clientes que nao realizaram compra em 2020							  09
select Nome as Nome_Clientes													  #no select setamos o nome como sendo o atributo em que desejamos retirar os dados
from TBCliente                                                                    #A tabela a qual devemos realizar a busca
where email not in (															  
			select email
			from TBCompra
            where year(Data_Compra) = 2020);
        
#CNPJ das empresas que obtiveram compras diferentes de 500 reais                  10
select CNPJ as CNPJ_Empresas													  #no select setamos o cnpj das empresas como atributo que desjamos retirar os dados
from TBJuridico                                                                   #A tabela a qual devemos realizar a busca, sendo a TBJuridico
where email not in (                                                              #A condição de busca sendo os email que nao apresentam compra no valor igual a 500 reais
				select email
				from TBCompra
				where Valor_Compra = 500 );
	
					
