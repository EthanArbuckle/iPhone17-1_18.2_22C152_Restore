@interface PDExpressTransactionEvent
- (PDExpressTransactionEvent)init;
- (id)_initWithType:(int64_t)a3;
- (int64_t)type;
@end

@implementation PDExpressTransactionEvent

- (PDExpressTransactionEvent)init
{
  return 0;
}

- (id)_initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDExpressTransactionEvent;
  id result = [(PDExpressTransactionEvent *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

@end