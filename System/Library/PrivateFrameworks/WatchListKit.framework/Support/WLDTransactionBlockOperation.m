@interface WLDTransactionBlockOperation
- (WLDTransactionBlockOperation)init;
- (void)dealloc;
@end

@implementation WLDTransactionBlockOperation

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)WLDTransactionBlockOperation;
  [(WLDTransactionBlockOperation *)&v4 dealloc];
}

- (WLDTransactionBlockOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLDTransactionBlockOperation;
  v2 = [(WLDTransactionBlockOperation *)&v6 init];
  if (v2)
  {
    v3 = (WLKTransactionScope *)[objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDTransactionBlockOperation.init"];
    transaction = v2->_transaction;
    v2->_transaction = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end