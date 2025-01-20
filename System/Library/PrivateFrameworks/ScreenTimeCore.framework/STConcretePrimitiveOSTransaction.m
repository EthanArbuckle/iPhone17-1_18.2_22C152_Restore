@interface STConcretePrimitiveOSTransaction
- (OS_os_transaction)underlyingTransaction;
- (STConcretePrimitiveOSTransaction)initWithDescription:(const char *)a3;
@end

@implementation STConcretePrimitiveOSTransaction

- (STConcretePrimitiveOSTransaction)initWithDescription:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STConcretePrimitiveOSTransaction;
  v3 = [(STConcretePrimitiveOSTransaction *)&v7 init];
  uint64_t v4 = os_transaction_create();
  underlyingTransaction = v3->_underlyingTransaction;
  v3->_underlyingTransaction = (OS_os_transaction *)v4;

  return v3;
}

- (OS_os_transaction)underlyingTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end