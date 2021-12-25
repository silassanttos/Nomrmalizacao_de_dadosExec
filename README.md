# Nomrmalizacao_de_dadosExec
Exercícios Propostos


Mais de uma solução pode ser considerada adequada para este exemplo, de acordo com os comentários existentes em cada tabela a seguir.

Tabela TIPO
+----------------------------------+
| CODIGO (PK) | TIPO               |
|-------------+--------------------|
|           1 | Banco de dados     |
|           2 | Programação        |
|           3 | Modelagem de dados |
+----------------------------------+
A tabela TIPO foi criada separadamente pois um mesmo tipo de curso poderá ser utilizado em dezenas de cursos. Para poupar recursos de armazenamento na tabela CURSO – pois armazenar um número (campo CODIGO) ocupa menos espaço do que armazenar textos (campo TIPO) - e também para disponibilizar os tipos de cursos sem depender do cadastro de outros cursos, esta informação deve ser gerenciada por esta tabela.

Tabela INSTRUTOR
+----------------------------------------+
| CODIGO (PK) | INSTRUTOR    | TELEFONE  |
|-------------+--------------+-----------|
|           1 | André Milani | 1111-1111 |
|           2 | Carlos Tosin | 1212-1212 |
+----------------------------------------+
A tabela INSTRUTOR foi criada separadamente dos cursos pois um mesmo instrutor pode ser o responsável por um ou mais cursos disponibilizados pela Softblue. Para não haver redundância de dados, gerar economia de espaço de armazenamento e facilidade de manutenção (alteração de dados do instrutor), estas informações devem ser gerenciadas por esta tabela.

Tabela CURSO
+---------------------------------------------------------------------+
| CODIGO (PK) | CURSO            | TIPO (FK) | INSTRUTOR (FK) | VALOR |                  
|-------------+------------------+-----------+----------------+-------|
|           1 | Java Fundamentos |         2 |              2 |   270 |
|           2 | Java Avançado    |         2 |              2 |   330 |
|           3 | SQL Completo     |         1 |              1 |   170 | 
|           4 | Php Básico       |         2 |              1 |   270 |        
+---------------------------------------------------------------------+
A tabela CURSO é criada com as colunas TIPO e INSTRUTOR como chaves estrangeiras (FK) pois representam o código dos registros das outras tabelas as quais fazem referência. Desta forma, se o instrutor mudar o seu telefone, será necessário alterar apenas na tabela INSTRUTOR, além da economia em espaço de armazenamento por não repetir informações.

Tabela ALUNO
+----------------------------------------------------------------------------+
| CODIGO (PK) | ALUNO      | ENDERECO               | EMAIL                  | 
|-------------+------------+------------------------+------------------------|
|           1 | José       | Rua XV de Novembro 72  | jose@softblue.com.br   |
|           2 | Wagner     | Av. Paulista           | wagner@softblue.com.br |
|           3 | Emílio     | Rua Lajes 103, ap: 701 | emilio@softblue.com.br |  
+----------------------------------------------------------------------------+
A tabela ALUNO é criada sem nenhuma informação sobre as matrículas já realizadas por este aluno, para evitar que seus dados pessoais sejam repetidos em mais de um registro de matrícula. Nesta tabela uma possibilidade seria não criar a coluna CODIGO e em seu lugar utilizar a coluna EMAIL como chave primária. Contudo, para prevenir anomalias de alteração (pois e-mail é algo que uma pessoa pode mudar e criar outro, e neste caso seria necessário alterar em outras tabelas que fizessem referências), bem como para poupar espaço de armazenamento ao utilizar a chave primária em outras tabelas, é recomendável utilizar códigos únicos internos como chave primária.

Tabela PEDIDO
+----------------------------------------------------+
| CODIGO (PK) | ALUNO (FK)   | DATA       | HORA     | 
|-------------+--------------+------------+----------|
|           1 |            2 | 15/04/2010 | 11:23:32 |
|           2 |            2 | 15/04/2010 | 14:36:21 |
|           3 |            3 | 16/04/2010 | 11:17:45 |
+----------------------------------------------------+
A tabela PEDIDO representa o momento em que o aluno realizou o seu pedido, como um caixa de mercado. Ela apresenta as informações do aluno e do momento das matrículas, mas como cada aluno pode estar se matriculando em um ou mais cursos no mesmo pedido, a tabela PEDIDO deve ser referenciada pela tabela PEDIDO_DETALHE, onde consta cada curso que o aluno está se matriculando.

Observe que não consta o valor total do pedido nesta tabela, pois este valor pode ser obtido com a soma dos itens que fazem parte deste pedido, gerenciados pela tabela PEDIDO_DETALHE.

Tabela PEDIDO_DETALHE
+----------------------------------+
| PEDIDO (FK) | CURSO (FK) | VALOR |
|-------------+------------+-------+
|           1 |          1 |   270 |
|           1 |          2 |   330 |
|           2 |          1 |   270 |
|           2 |          2 |   330 |
|           2 |          3 |   170 |
|           3 |          4 |   270 |
+----------------------------------+
A tabela PEDIDO_DETALHE informa quais cursos fazem parte de cada pedido realizado na Softblue. Observe que a chave primária neste exemplo é formada pelas chaves estrangeiras PEDIDO e CURSO. Isto ocorre pois em nosso modelo podemos assumir que não é possível comprar dois ou mais cursos iguais em um mesmo pedido.

Observe que existe uma coluna VALOR, que pode parecer redundante com a coluna VALOR já existente na tabela CURSO, contudo ela será encarregada de armazenar o valor do curso no momento da matrícula, já que futuramente o preço na tabela CURSO poderá ser corrigido devido a novos preços praticados pela Softblue.

Como a coluna VALOR desta tabela e a coluna VALOR de CURSOS possivelmente terão valores que poderão se repetir em vários registros, seria possível ainda normalizar esta coluna em uma tabela chamada PRECO formada por um código (PK) e o valor em questão, e apenas referenciar este código nas tabelas citadas. Contudo, por ser um campo numérico e significativamente ocupar menos espaço que outros campos de texto, e por outras questões de desenvolvimento, este campo não será normalizado em tabela própria.

Todas as chaves estrangeiras apresentadas neste exemplo são consideradas índices.

