@interface PDExpressTransactionEventEntered
- (PDExpressTransactionEventEntered)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)technologyType;
- (void)setTechnologyType:(int64_t)a3;
@end

@implementation PDExpressTransactionEventEntered

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventEntered)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventEntered;
  return (PDExpressTransactionEventEntered *)[(PDExpressTransactionEvent *)&v3 _initWithType:0];
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

@end