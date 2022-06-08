# GamaVendingMachineSC

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)


O projeto deverá atender as seguintes condições:



Criou o próprio Contrato Inteligente de Token.

Criou o próprio Contrato Ingeligente de Maquina de Venda do Token.

O Comprador deve ser possivel comprar tokens com ethers.

O Vendedor deve ser possivel vender tokens por ethers.

O administrador deve ser capaz de reabastecer a maquina com tokens e ethers.

O adminsitrador deve ser capaz de sacar o saldo em ethers

O administrador deve ser capaz de redefinir o valor dos tokens para compra.

O administrador deve ser capaz de redefinir o valor dos tokens para venda.

Não deve ser possivel comprar tokens com valor zero.

Não deve ser possivel vender tokens com valor zero.

Não deve ser possivel reabastecer a maquina com tokens com valor zero.

Não deve ser possivel reabastecer a maquina com ethers com valor zero.


---------------------------------------------------------------------------


implementei algumas funções que podem ser testadas no Remix, são elas:

- Comprar gamatoken com eth
- Comprar eth com gamatoken
- Restock (apenas pelo owner)
- Withdraw (apenas pelo owner)
- Minimum buy
