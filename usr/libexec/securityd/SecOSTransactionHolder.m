@interface SecOSTransactionHolder
- (OS_os_transaction)transaction;
- (id)init:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SecOSTransactionHolder

- (void).cxx_destruct
{
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (id)init:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecOSTransactionHolder;
  v6 = [(SecOSTransactionHolder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

@end