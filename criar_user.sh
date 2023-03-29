#!/bin/bash
useradd guest10 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd -crypt 123)
passwd guest10 -e

useradd guest110 -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd -crypt 123)
passwd guest10 -e
