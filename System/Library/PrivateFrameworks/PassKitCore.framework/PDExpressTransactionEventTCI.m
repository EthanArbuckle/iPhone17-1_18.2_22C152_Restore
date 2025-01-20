@interface PDExpressTransactionEventTCI
- (NSOrderedSet)TCIs;
- (PDExpressTransactionEventTCI)init;
- (id)_initWithType:(int64_t)a3;
- (void)setTCIs:(id)a3;
@end

@implementation PDExpressTransactionEventTCI

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventTCI)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventTCI;
  return (PDExpressTransactionEventTCI *)[(PDExpressTransactionEvent *)&v3 _initWithType:6];
}

- (NSOrderedSet)TCIs
{
  return self->_TCIs;
}

- (void)setTCIs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end