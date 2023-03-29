<<comentário
O script abaixo realiza as seguintes ações:
-cria os diretórios público, adm, ven e sec na raiz do sistema 
-cria os grupos GRP_ADM, GRP_VEN e GRP_SEC
-cria os usuários: carlos, maria, joao, debora, sebastiana, roberto, josefina, amanda e rogerio onde os mesmos terão permissão total dentro do grupo nos quais estão inseridos.
-todos os usuários terão permissão total no diretório /publico
-os usuários não terao permissão de leitura, escrita ou execução nos diretórios de departamentos dos quais eles não fazem parte.
comentário

#Observações: em alguns servidores o parâmetro -crypt não funciona...bastando colocar apenas -p $(openssl passwd senha123)
echo "Criando diretórios"
mkdir /publico /adm /ven /sec
echo "Criando grupos"
groupadd GRP_ADM && groupadd GRP_VEN && groupadd GRP_SEC
echo "Criando usuários"
useradd carlos -c "Carlos" -m -G GRP_ADM -p $(openssl passwd 123) && passwd carlos -e
useradd maria -c "Maria" -m -G GRP_ADM -p $(openssl passwd 123) && passwd maria -e
useradd joao -c "João" -m -G GRP_ADM -p $(openssl passwd 123) && passwd joao -e

useradd debora -c "Débora" -m -G GRP_VEN -p $(openssl passwd 123) && passwd debora -e
useradd sebastiana -c "Sebastiana" -m -G GRP_VEN -p $(openssl passwd 123) && passwd sebastiana -e
useradd roberto -c "Roberto" -m -G GRP_VEN -p $(openssl passwd 123) && passwd roberto -e

useradd josefina -c "Josefina" -m -G GRP_SEC -p $(openssl passwd 123) && passwd josefina -e
useradd amanda -c "Amanda" -m -G GRP_SEC -p $(openssl passwd 123) && passwd amanda -e
useradd rogerio -c "Rogério" -m -G GRP_SEC -p $(openssl passwd 123) && passwd rogerio -e

echo "Adicionando permissões aos diretórios /adm /ven /sec"
chmod 777 /publico
chmod 770 /adm /ven /sec
echo "Especificando donos dos diretórios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Ações realizadas com sucesso"

<<comentário
Para desfazer ações realizadas acima, crie um arquivo .sh com os comandos abaixo ou execute os mesmos em sequência:
rmdir /publico /adm /ven /sec
groupdel -f GRP_ADM
groupdel -f GRP_SEC
groupdel -f GRP_VEN
userdel -r -f carlos
userdel -r -f maria
userdel -r -f joao
userdel -r -f debora
userdel -r -f sebastiana
userdel -r -f roberto
userdel -r -f josefina
userdel -r -f amanda
userdel -r -f rogerio
comentário


