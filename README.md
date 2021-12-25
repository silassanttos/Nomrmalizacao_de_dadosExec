# Nomrmalizacao_de_dadosExec
Exercícios Propostos

Tabela TIPOA

![image](https://user-images.githubusercontent.com/69328711/147393224-c99d8282-c745-4d44-99ef-0d4e967d9c7e.png)

A tabela TIPO foi criada separadamente pois um mesmo tipo de curso poderá ser utilizado em dezenas de cursos. Para poupar recursos de armazenamento na tabela CURSO – pois armazenar um número (campo CODIGO) ocupa menos espaço do que armazenar textos (campo TIPO) - e também para disponibilizar os tipos de cursos sem depender do cadastro de outros cursos, esta informação deve ser gerenciada por esta tabela.

Tabela INSTRUTOR

![image](https://user-images.githubusercontent.com/69328711/147393236-5e7d44b4-6b82-425c-a782-9c11c35f52ea.png)

A tabela INSTRUTOR foi criada separadamente dos cursos pois um mesmo instrutor pode ser o responsável por um ou mais cursos disponibilizados pela Softblue. Para não haver redundância de dados, gerar economia de espaço de armazenamento e facilidade de manutenção (alteração de dados do instrutor), estas informações devem ser gerenciadas por esta tabela.

Tabela CURSO

![image](https://user-images.githubusercontent.com/69328711/147393241-35748cb2-09c9-42dc-b493-0e9c57f947ee.png)

A tabela CURSO é criada com as colunas TIPO e INSTRUTOR como chaves estrangeiras (FK) pois representam o código dos registros das outras tabelas as quais fazem referência. Desta forma, se o instrutor mudar o seu telefone, será necessário alterar apenas na tabela INSTRUTOR, além da economia em espaço de armazenamento por não repetir informações.

Tabela ALUNO

![image](https://user-images.githubusercontent.com/69328711/147393262-09db7c4b-5f0a-4327-a3ef-c28eb97293a5.png)

A tabela ALUNO é criada sem nenhuma informação sobre as matrículas já realizadas por este aluno, para evitar que seus dados pessoais sejam repetidos em mais de um registro de matrícula. Nesta tabela uma possibilidade seria não criar a coluna CODIGO e em seu lugar utilizar a coluna EMAIL como chave primária. Contudo, para prevenir anomalias de alteração (pois e-mail é algo que uma pessoa pode mudar e criar outro, e neste caso seria necessário alterar em outras tabelas que fizessem referências), bem como para poupar espaço de armazenamento ao utilizar a chave primária em outras tabelas, é recomendável utilizar códigos únicos internos como chave primária.

Tabela PEDIDO

![image](https://user-images.githubusercontent.com/69328711/147393257-44b2f2a9-b0fb-4b2c-8a64-4617eacee265.png)

A tabela PEDIDO representa o momento em que o aluno realizou o seu pedido, como um caixa de mercado. Ela apresenta as informações do aluno e do momento das matrículas, mas como cada aluno pode estar se matriculando em um ou mais cursos no mesmo pedido, a tabela PEDIDO deve ser referenciada pela tabela PEDIDO_DETALHE, onde consta cada curso que o aluno está se matriculando.

Observe que não consta o valor total do pedido nesta tabela, pois este valor pode ser obtido com a soma dos itens que fazem parte deste pedido, gerenciados pela tabela PEDIDO_DETALHE.

Tabela PEDIDO_DETALHE

![image](https://user-images.githubusercontent.com/69328711/147393253-2ce7a01c-76d4-466c-9f8a-8b5b20bb638a.png)

A tabela PEDIDO_DETALHE informa quais cursos fazem parte de cada pedido realizado na Softblue. Observe que a chave primária neste exemplo é formada pelas chaves estrangeiras PEDIDO e CURSO. Isto ocorre pois em nosso modelo podemos assumir que não é possível comprar dois ou mais cursos iguais em um mesmo pedido.

Observe que existe uma coluna VALOR, que pode parecer redundante com a coluna VALOR já existente na tabela CURSO, contudo ela será encarregada de armazenar o valor do curso no momento da matrícula, já que futuramente o preço na tabela CURSO poderá ser corrigido devido a novos preços praticados pela Softblue.

Como a coluna VALOR desta tabela e a coluna VALOR de CURSOS possivelmente terão valores que poderão se repetir em vários registros, seria possível ainda normalizar esta coluna em uma tabela chamada PRECO formada por um código (PK) e o valor em questão, e apenas referenciar este código nas tabelas citadas. Contudo, por ser um campo numérico e significativamente ocupar menos espaço que outros campos de texto, e por outras questões de desenvolvimento, este campo não será normalizado em tabela própria.

Todas as chaves estrangeiras apresentadas neste exemplo são consideradas índices.

