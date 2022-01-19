#Inicio -----
a = 1
b <- "Bem vindos a ICMC.JR" 
ls()#Mostra uma lista dos nomes das váriáveis que você tem criadas
rm(list=ls())#Apaga todas as váriáveis que tem criadas(O R salva as váriaveiveis)

#Classes ------
class()'revela a classe da váriavel(explicar sobre as classes, numericos, character(""), factor, 
logical etc.)'
# Explicar sobre TRUE e FALSE
#Ver se alguma variavel é de uma classe especifca == is.classe, exemplo is.numeric() / is.character()
is.numeric(a)
is.character(b)

a <- as.numeric(a)

#Mudar tipos de variáveis(coerção) -----
'serve para o R considerar uma variavel de um tipo como outro == as.classe(). Lembrando que nem todas
converções serão possiveis'
#Exemplo
as.character(a)
class(as.character(a))
typeof(a)
as.numeric(b)#Vai dar um erro por que o R n consegue converter character como numerico(se eles forem letras)
c = "4.5"
as.numeric(c)
class(d)
d <- c(1,2,3,4,5,6,7,8,9,NA)
sd(d)
mean(d, na.rm = T)
?NA
#Criando e nomeando vetores-----
"Um vetor é uma sequencia de elementos do mesmo tipo e é criado pela função c()
O R considera qualquer variavel como um vetor, mesmo que tenha um valor(Vetor de unico valor)
exemplo de criação de vetores
Suponha que você comprou 4 cartas do baralho(2 de ouros, 1 de copas e 1 de paus)" 
naipe = c("Ouros","Copas","Paus","Espadas")
Sobra = c(11,12,12,13)#Cartas de cada naipe que sobrou no baralho
#Se quiser colocar sobre o vetor de sobra quantas cartas que sobraram de cada naipe usa-se a função names()
names(Sobra) = naipe#Pega o nome das colunas de naipe e substitui pelas de Sobra
Sobra = c(ouros = 11,copas = 12, paus = 12, espadas = 13)#Outras duas maneiras de fazer o mesmo com mesmo resultado
Sobra = c("ouros" = 11,"copas" = 12, "paus" = 12, "espadas" = 13)
Sobra <- as.data.frame(Sobra)

#Tamanho de vetores(Numero de observações) ----
length(Sobra)
#OBS: Um vetor so pode armazenar elementos de um mesmo tipo
Testetipo = c(18,"a",15)#Transforma todos para o mesmo tipo

#Acessando dados do seu vetor------
#Da para acessar dados dos vetores usando [x] sendo x o numero do elemento do vetor
naipe[2]#acessa "copas"
naipe[c(1,3)]#Acessa mais de um elemento
naipe[-2]#Exclui o elemento da posição
naipe[-c(1,3)]#exclui elementos do vetor


#Criando matrizes-----
#Matrizes são extenções de vetores, possuem as mesmas regras de apenas uma classe
#Matrizes possuem linhas e colunas
matrix(1:6, nrow = 2)
matrix(1:6, ncol = 2)
#cbind() e rbind() Serve para criar matrizes por colunas ou linhas
matriz.teste = cbind(1:3,1:3)
matriz.teste = cbind(matriz.teste,7:9)#criou uma nova coluna.
matriz.teste = rbind(matriz.teste,1:3)
matriz.teste

#Nomeando linhas e colunas------
rownames(matriz.teste) = c("linha1","linha2","linha3","linha4")
colnames(matriz.teste) = c("coluna1","coluna2","coluna3")
#Acessar elementos da matriz
matriz.teste[1,3]#primeiro valor é da linha 2 da coluna
matriz.teste[,2]#acessa todos os elementos da coluna 2
matriz.teste[,-c(1,3)]

#Fatores(Factors)------
#Usados para variáveis categórigas
Sangue.Tipo = c("A","B","A","AB","O","O","A")
Sangue.factor = as.factor(Sangue.Tipo)#Transforma em factor o vetor 

#DataFrames(Tabela onde as linhas são observações e colunas váriaveis)----
'Dataframes são a classe de variáveis que provavelmente mais utilizaremos. è muito util para
organizar e acessar dados. Podemos criar nosso próprio data.frame ou importar para o 
R, por exemplo importar uma tabela do excell(csv). Para criar dataframes eles devem ter o 
mesmo numero de elementos'

#Criando um data Frame-----
#Usamos a função data.frame()
Nomes = c("Maria","Paulo","Julia")
Anos = c(19,22,18)
Possui.Irmaos = as.factor(c(1,0,1))
df = data.frame(Nomes,Anos,Possui.Irmaos)
names(df) = c("Nomes", "Idade","Irmãos?")#mudei o nome das colunas
df$Nomes #Se digitar o simbolo de cifrão após o nome do dataframe aparecerá os nomes das colunas
#do seu dataframe, ao selecionar uma aparecerá apenas a escolhida, por exemplo Nomes'
df$Idade
#Adicionando colunas ao seu dataframe-----
altura = c(1.75,1.60,1.68)
peso = c(55,70,63.5)
'Há algumas maneiras de se fazer isso:'
df$altura = altura
df <- cbind(df,peso)
"(Função table: retorna o numero de cada elemento de um objeto no R que possa ser classificado 
como fatores)"
table(df)

#Como instalar cearregar pacotes no R-----
#Para instalar um pacote no R usa-se a função install.packages("nome do pacote")
'Para carregar um pacote para que se possa usar alguma função dele usamos função 
require(nome do pacote) ou library(nome do pacote)'
if(!require(rstudioapi)) install.packages("rstudioapi"); require(rstudioapi)
'Esse é uma linha para facilitar o código em qualquer computador com o R instalado,
nele lemos: Se vc n tem como carregar o pacote(x), instale esse pacote; depois carregue ele.'
library(tidyverse)
#Pacotes importantes q vamos usar----
if(!require(rstudioapi)) install.packages("rstudioapi"); require(rstudioapi)
if(!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)
'O primeiro serve como um pacote para uma api, usamos ele para essa linha de código,

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

Esse código faz o rstudio procurar os diretórios dos arquivos diretamente,
o segundo é um "Pacotão", nele há o aglomerado de vários outros pacotes importantes do R,
em especial que vamos utilizar mais é o dplyr(Para manipulação dos dados) e o ggplot2(Para gráficos)'

# Abrindo um arquivo no R------
"O R consegue abrir diversos tipos de arquivos "

#   O dplyr
"Primeiramente começamos a falar sobre o operador pipe(%>%), ele serve como um conector das funções.
usar o valor resultante da expressão do lado esquerdo como primeiro argumento da 
função do lado direito."

# Receita de bolo sem pipe. Tente entender o que é preciso fazer(Não rode). -----

esfrie(asse(coloque(bata(acrescente(recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo"), "farinha", até = "macio"), duração = "3min"), lugar = "forma", tipo = "grande", untada = TRUE), duração = "50min"), "geladeira", "20min")


# Veja como o código acima pode ser reescrito utilizando-se o pipe. Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
acrescente("farinha", até = "macio") %>%
bata(duraço = "3min") %>%
coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
asse(duração = "50min") %>%
esfrie("geladeira", "20min")


#rename() ------
"Um jeito de renomear o nome das colunas do nosso data frame

A rename(banco de dados, novo_nome = antigo_nome)

Note que no nosso exemplo por causa do pipe não foi necessário especificar o
dataframe como primeiro argumento da função"
Teste.Rename = data.frame(a = c("Ana","Julio"),b= c(20,25))
Teste.Rename = Teste.Rename %>% rename(Nomes = a,
                        Idade = b)

#select()-----
"Serve para selecionar quais colunas que desejamos trabalhar.
As vezes será necessário trabalhar criar um novo data.frame só com as colunas
desejadas, para outras aplicações, por exemplo um gráfico. 
No exemplo criei este data frame"
Teste.Rename = cbind(Teste.Rename,Peso = c(50,80),Cor_Cabelo = c("Preto", "Castanho"),Altura.teste = c(1.60,1.75))

Teste.Select = data.frame(Teste.Rename %>% 
                            select(Idade,Peso,Altura.teste))

#mutate()-----
"cria uma nova coluna no seu banco de dados"
teste.Mutate = Teste.Select %>%
                mutate(IMC = Peso/Altura.teste^2)

#group_by() e Summarize()-----
"Agrupa o dado baseado em uma ou mais variáveis, a primeira vista se apenas
rodar essa função ela parece não fazer nada, mas o poder dela vem junto do summarize"
# summarize()
"Ele retorna as funções que você colocar nele para você. Ele é muito util com o 
group_by por que muitas analises podem ser feitas no estilo de dividir em grupos,
aplicar um tipo de teste para cada grupo e juntar os resultados depois, e é nesta parte de juntar
resultados que o summarize é util"
df.Group_by = data.frame(pessoa = c(1:10),
                         cidade = c("A","B","C","C","A","C","B","B","A","C"),
                         Sexo = c(1,0,1,0,1,0,1,1,1,0),
                         Salarios = c(2,4,5,1,1,3,10,3,2,1))
df.analise = df.Group_by %>%
                select(cidade,Sexo,Salarios) %>%
                group_by(cidade)%>%
                summarize(Total = n(),
                  Media_Salario = mean(Salarios))

# filter() ------
"Ele serve para você filtrar suas observações por uma determinada regra de
decisão colocada por você"
Teste.Filter = df.Group_by %>%
                filter(cidade == c("A"))
z <- starwars

#arrange() -----
"Organiza seu banco de dados em ordem crescente baseado em uma
variável. Para usar a ordem decrescente usamos desc(variavel)"
teste.Arrange.C = df.Group_by %>%
                arrange(Salarios)#Crescente
teste.Arrange.D = df.Group_by %>%
  arrange(desc(Salarios))#Decrescente

#spread() -----
"Serve para 'espalhar' em diversas colunas"
teste.spread = df.Group_by %>%
                spread(cidade, Salarios)

#gather() -----
"Serve para 'empilhar' as colunas"
teste.gather = teste.spread %>%
                gather(cidade, salarios, -pessoa, -Sexo, na.rm = T)

#apply -----
'apply(base de dados, 1 = linha e 2 = coluna, função )'
apply(teste.spread[,c(3:5)], 2, mean, na.rm = T)

#ggplot2() -----
"https://www.curso-r.com/material/ggplot/
https://www.r-graph-gallery.com/
Esse é o pacote que usamos para criar os gráficos"

if(!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)
if(!require(rstudioapi)) install.packages("rstudioapi"); require(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
imdb <- readr::read_rds("imdb.rds")
str(imdb)#Ambas funções mostram um resumo do banco de dados, com nomes de variaveis, 
glimpse(imdb)# classe da variavel e as primeiras observações
" A função do ggplot recebe um data.frame e cria a primeira camada que é a base
 do nosso gráfico, repare que mesmo tendo mandado os dados para a função ela não faz nada.
Será necessário informar como as informações serão mostradas e que formas geométricas
usaremos."
ggplot(data = imdb)#Cria apenas a base do gráfico
ggplot(imdb) +
  geom_point(aes(x = orcamento, y = receita))#Cria um grafico de disperção
"  Observações:
+ une as camadas do gráfico, sempre que adicionar uma usaremos o +;
geom_point determina que tipo de grafico usaremos(forma do grafico),
existe uma familia de funções geom_, cada uma resultando num grafico diferente
com suas proprias especificações(veremos mais pra frente);
a função aes() é responsavel por descrever como serão mapeadas no aspecto visual
as variaveis da forma escolhida, no caso pontos(normalmente usaremos para definir eixos);

  Podemos adicionar mais camadas n  o gráfico, por exemplo passaremos uma linnha
para saber quais filmes se pagaram
"
ggplot(imdb) +
  geom_point(mapping = aes(x = orcamento, y = receita)) +
  geom_abline(intercept = 0, slope = 1, color = "red")
" Oberservações:
geom_abline gera uma linha inclinada, intercept é onde ela intercepta o eixo x,
slope é a inclinação da reta, color é a cor da reta.
Os filmes que estão abaixo da reta representam filmes que deram prejuizo,
porém há como fazer uma forma melhor, podemos pintar os filmes que deram lucros
e projuizos com cores diferentes
"
imdb %>%
  mutate(
    lucro = receita - orcamento,
    lucro = ifelse(lucro <= 0, "Não", "Sim")
  ) %>% 
  filter(!is.na(lucro)) %>% 
  ggplot() + 
  geom_point(aes(x = orcamento, y = receita, color = lucro))+
  labs(x = "Orçamento", y = "Arrecadação", color = "Houve lucro?")+
  theme_bw()

"Observações:
Essa parte de manipulação de dados(mutate e filter) é bem comum na 
crianção de graficos
Neste caso a cor do gráfico foi definida na função aes
labs: adiciona legendas as variaveis definidas no aes

  Atributos estéticos de um grafico são definidos na função aes. Principais 
funções do aes:
color=: altera a cor de formas que não têm área (pontos e retas).
fill=: altera a cor de formas com área (barras, caixas, densidades, áreas).
size=: altera o tamanho de formas.
type=: altera o tipo da forma, geralmente usada para pontos.
linetype=: altera o tipo da linha.
Algo importante sobre a função aes é que ela espera uma variável para cada
atributo.
"
#Queremos transformar os pontos do grafico em azul
ggplot(imdb) +
  geom_point(aes(x = orcamento, y = receita, color = "blue"))#errado

ggplot(imdb) +
  geom_point(aes(x = orcamento, y = receita), color = "blue")#Certo
"O primeiro exemplo é considerado errado por que a função color do aes
esta esperando uma variavel, e ele armazenou a string blue como valor, 
repare que no segundo grafico, a função color está fora do aes"
"FORMAS GEOMÉTRICAS
Os geoms definem qual forma geométrica será utilizada para a visualização das observações. Como já vimos,
a função geom_point() gera gráficos de dispersão transformando pares (x,y)
em pontos. Veja a seguir outros geoms bastante utilizados:

geom_line - para linhas definidas por pares (x,y).
geom_abline - para retas inclinadas definidas por um intercepto e uma inclinação.
geom_hline - para retas horizontais.
geom_vline - para retas verticais
geom_bar - para barras.
geom_histogram - para histogramas.
geom_boxplot - para boxplots.
geom_density - para densidades.
geom_area - para áreas.
"
#Linhas
imdb %>% 
  filter(diretor == "Steven Spielberg") %>%
group_by(ano) %>% 
summarise(nota_media = mean(nota_imdb, na.rm = TRUE)) %>% 
ggplot() +
geom_line(aes(x = ano, y = nota_media))

#Histograma
ggplot(imdb) + 
  geom_histogram(aes(x = orcamento), color = "black", fill = "white")
hist(imdb$orcamento)
#Boxplot  
imdb %>% 
  filter(diretor %in% c("Steven Spielberg", "Quentin Tarantino", "Woody Allen")) %>%
  ggplot() + 
  geom_boxplot(aes(x = diretor, y = receita))

#Barras
imdb %>% 
  filter(ano > 1990) %>% 
  ggplot() +
  geom_bar(aes(x = ano), color = "black", fill = "light blue")

#         Juntando Gráficos
"Vários geom no mesmo gráfico
Podemos acrescentar vários geoms em um mesmo gráfico, apenas adicionando 
novas camadas. No código abaixo, construímos o gráfico de dispersão da 
receita pelo orçamento dos filmes, acrescentando também uma reta de 
tendência aos pontos."
ggplot(imdb) +
  geom_point(aes(x = orcamento, y = receita)) +
  geom_smooth(aes(x = orcamento, y = receita), se = F, method = "lm")
"Podemos reduzir código especificando a função aes() diretamente no código
 do ggplot. Ela será atribuida a todos os geom abaixo"
ggplot(imdb, aes(x = orcamento, y = receita)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
"Mas ainda é possivel usar a função aes dentro do geom para mudar coisas 
especificas daquele geom"
ggplot(imdb, aes(x = orcamento, y = receita)) +
  geom_point(aes(color = ano)) +#Mudou a cor
  geom_smooth(color = "black", se = FALSE, method = "lm")#mudou a cor da reta

#   Replicando um mesmo gráfico para mais de uma variável
imdb %>%
  filter(classificacao %in% c("Livre", "A partir de 13 anos")) %>%
  ggplot() +
  geom_point(aes(x = orcamento, y = nota_imdb)) +
  facet_wrap(~classificacao, nrow = 2)
"Obs:
Podemos definir como os graficos aparecerão pela função nrow e ncol
"
imdb %>%
  filter(classificacao %in% c("Livre", "A partir de 13 anos")) %>%
  ggplot() +
  geom_point(aes(x = orcamento, y = nota_imdb)) +
  facet_wrap(~classificacao, ncol = 2)
"A função facet_wrap é usada quando apenas uma variavel é usada para segmentar
o gráfico, para uma combinação de duas variaveis usamos a função facet_grid
"
imdb %>%
  filter(classificacao %in% c("Livre", "A partir de 13 anos")) %>%
  ggplot() +
  geom_point(aes(x = orcamento, y = nota_imdb)) +
  facet_grid(cor~classificacao)
#Personalizando gráficos
"Como exemplo de personalização de um gráfico com o ggplot2, vamos partir
de um simples boxplot e fazer diversas alterações no seu visual."
imdb %>% 
  filter(diretor %in% c("Steven Spielberg", "Quentin Tarantino", "Woody Allen")) %>%
  ggplot() + 
  geom_boxplot(aes(x = diretor, y = receita, fill = diretor))
"Grafico apos algumas mudanças"
imdb %>% 
  filter(diretor %in% c("Steven Spielberg", "Quentin Tarantino", "Woody Allen")) %>%
  ggplot() + 
  geom_boxplot(aes(x = diretor, y = receita, fill = diretor), show.legend = FALSE) +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_discrete(
    limits = c("Woody Allen", "Quentin Tarantino", "Steven Spielberg")
    )+
    scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9"))
  
  
"obs: 
show.legend = False: retira totalmente a legenda do gráfico(vem como True de defaut da função)
scale_y_continuous(labels = scales::dollar): muda a escala de x para dólares
scale_x_discret: Muda a ordem que as categorias do gráfico aparecem
scale_fill_manual: muda os valores das cores de forma manual, há outras maneiras de mudar
cores e usar ja paletas prontas de pacotes 
"
"Modificando o visual do gráfico:
Podemos mudar aspectos visuais do gráfico, como fontes, cores e estilos dos textos, grids, marcações,
cor do fundo etc, a partir da função theme()."
imdb %>% 
  filter(diretor %in% c("Steven Spielberg", "Quentin Tarantino", "Woody Allen")) %>%
  ggplot() + 
  geom_boxplot(aes(x = diretor, y = receita, fill = diretor)) +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_discrete(
    limits = c("Woody Allen", "Quentin Tarantino", "Steven Spielberg")
  ) +
  scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9")) +
  theme(
    axis.text.x = element_blank(), 
    axis.ticks.x = element_blank(),
    legend.position = "bottom"
  )+
  ggtitle("Meu boxplot")
"Obs:
axis.text.x: removeu os nomes do eixo x
axis.ticks.x: removeu a marcação de pontos do eixo X
legend.position: moveu a posiçao da legenda para a posição escolhida, 
no caso bottom(baixo). Lembrar que neste código a parte de remover legenda aprendida
anteriormente não está mais"
"O R possui alguns themes padrões para se usar:
theme_bw(),theme_minimal(),theme_dark(), para usar basta no grafico n por o 
theme e colocar eles no lugar
"
imdb %>% 
  filter(diretor %in% c("Steven Spielberg", "Quentin Tarantino", "Woody Allen")) %>%
  ggplot() + 
  geom_boxplot(aes(x = diretor, y = receita, fill = diretor)) +
  scale_y_continuous(labels = scales::dollar) +
  scale_x_discrete(
    limits = c("Woody Allen", "Quentin Tarantino", "Steven Spielberg")
  ) +
  scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9")) +
  theme_bw()+
  ggtitle("Meu boxplot")

