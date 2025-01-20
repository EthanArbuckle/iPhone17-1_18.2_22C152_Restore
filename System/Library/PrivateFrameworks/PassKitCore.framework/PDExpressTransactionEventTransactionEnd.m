@interface PDExpressTransactionEventTransactionEnd
- (NSNumber)brandCode;
- (PDExpressTransactionEventTransactionEnd)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)status;
- (void)setBrandCode:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PDExpressTransactionEventTransactionEnd

- (id)_initWithType:(int64_t)a3
{
  return 0;
}

- (PDExpressTransactionEventTransactionEnd)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDExpressTransactionEventTransactionEnd;
  return (PDExpressTransactionEventTransactionEnd *)[(PDExpressTransactionEvent *)&v3 _initWithType:4];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSNumber)brandCode
{
  return self->_brandCode;
}

- (void)setBrandCode:(id)a3
{
  self->_brandCode = (NSNumber *)a3;
}

@end