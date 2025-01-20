@interface PDExpressTransactionEventTransactionTimeout
- (PDExpressTransactionEventTransactionTimeout)init;
- (id)_initWithType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventTransactionTimeout

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventTransactionTimeout)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventTransactionTimeout;
  return (PDExpressTransactionEventTransactionTimeout *)[(PDExpressTransactionEvent *)&v3 _initWithType:3];
}

@end