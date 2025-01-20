@interface PDExpressTransactionEventExited
- (PDExpressTransactionEventExited)init;
- (id)_initWithType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventExited

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventExited)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventExited;
  return (PDExpressTransactionEventExited *)[(PDExpressTransactionEvent *)&v3 _initWithType:1];
}

@end