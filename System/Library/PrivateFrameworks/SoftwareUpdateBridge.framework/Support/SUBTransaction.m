@interface SUBTransaction
- (OS_os_transaction)transaction;
- (SUBTransaction)initWithName:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setTransaction:(id)a3;
@end

@implementation SUBTransaction

- (SUBTransaction)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUBTransaction;
  v5 = [(SUBTransaction *)&v9 init];
  if (v5)
  {
    [v4 UTF8String];
    uint64_t v6 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v6;

    os_unfair_lock_lock(&stru_100033D28);
    ++dword_100033D2C;
    os_unfair_lock_unlock(&stru_100033D28);
  }

  return v5;
}

- (void)dealloc
{
  [(SUBTransaction *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SUBTransaction;
  [(SUBTransaction *)&v3 dealloc];
}

- (void)invalidate
{
  os_unfair_lock_lock(&stru_100033D28);
  transaction = self->_transaction;
  if (transaction)
  {
    if (!--dword_100033D2C)
    {
      self->_transaction = 0;
    }
  }
  os_unfair_lock_unlock(&stru_100033D28);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end