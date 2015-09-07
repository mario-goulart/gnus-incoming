## gnus-incoming

gnus-incoming é uma extensão para o [Gnus](http://gnus.org/) que provê
uma caixa de entrada de mensagens.

A menos que especificado de outra forma, o Gnus coloca todas as
mensagens em um único grupo. O usuário então, para organizar suas
mensagens, deve manualmente movê-las para os grupos
correspondentes. Ou pode configurar a variável `nnmail-split-methods`
para que as mensagens sejam filtradas automaticamente na chegada.

O método automático, na minha opinião, tem a desvantagem de distribuir
as mensagens nos respectivos grupos antes mesmo que o usuário veja
brevemente do que elas se tratam. Esta extensão provê uma forma de
permitir que as mensagens sejam distribuídas nos grupos
correspondentes depois de terem passado por um grupo de entrada, onde
o usuário pode examiná-las rapidamente.

Para usá-la, siga os seguintes passos:

* Salvar o arquivo em anexo em um lugar onde o Emacs procure por arquivos Elisp `.el`.
* Criar um grupo onde ficarão as mensagens que chegam (e.g., `G m mail.incoming`).
* Colocar no arquivo `.gnus`:

   (require 'gnus-incoming)
   (setq gi-incoming-group "mail.incoming")
   (gnus-define-keys gnus-group-mode-map "g" gi-get-new-news)
   (gnus-define-keys gnus-summary-mode-map "+" gi-respool)

* Reiniciar o Gnus

A partir disso, a tecla `g` estará associada a `gi-get-new-news` no
`gnus-group-mode`. Sempre que ela for usada, o grupo
`gi-incoming-group` será aberto e nele estará disponível a tecla `+`,
que faz a distribuição das mensagens de acordo com
`nnmail-split-methods`.
