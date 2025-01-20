@interface GMWrcan7O3y8iiV3
- (GMWrcan7O3y8iiV3)init;
- (NSData)PpszCwt7GD641hHj;
- (aNsMZddNZSx2EODW)Xj38ZYkbLwtCgBTH;
- (unsigned)rUC18JCl8oMcmXim;
- (void)YdwGDxa5y8ubHXip:(aNsMZddNZSx2EODW *)a3;
- (void)setPpszCwt7GD641hHj:(id)a3;
- (void)setRUC18JCl8oMcmXim:(unsigned __int8)a3;
@end

@implementation GMWrcan7O3y8iiV3

- (GMWrcan7O3y8iiV3)init
{
  v6.receiver = self;
  v6.super_class = (Class)GMWrcan7O3y8iiV3;
  v2 = [(GMWrcan7O3y8iiV3 *)&v6 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    BcUJq3Q7Dzl8BUQE = v2->_BcUJq3Q7Dzl8BUQE;
    v2->_BcUJq3Q7Dzl8BUQE = (OS_os_transaction *)v3;

    v2->ChyJduzFZH7cLbo8.stack = 0;
    v2->ChyJduzFZH7cLbo8.counterLock = 0;
    v2->ChyJduzFZH7cLbo8.usageCount = 0;
  }
  return v2;
}

- (void)YdwGDxa5y8ubHXip:(aNsMZddNZSx2EODW *)a3
{
  self->ChyJduzFZH7cLbo8 = *a3;
}

- (aNsMZddNZSx2EODW)Xj38ZYkbLwtCgBTH
{
  *retstr = *(aNsMZddNZSx2EODW *)&self->counterLock;
  return self;
}

- (NSData)PpszCwt7GD641hHj
{
  return self->_PpszCwt7GD641hHj;
}

- (void)setPpszCwt7GD641hHj:(id)a3
{
}

- (unsigned)rUC18JCl8oMcmXim
{
  return self->_rUC18JCl8oMcmXim;
}

- (void)setRUC18JCl8oMcmXim:(unsigned __int8)a3
{
  self->_rUC18JCl8oMcmXim = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PpszCwt7GD641hHj, 0);

  objc_storeStrong((id *)&self->_BcUJq3Q7Dzl8BUQE, 0);
}

@end