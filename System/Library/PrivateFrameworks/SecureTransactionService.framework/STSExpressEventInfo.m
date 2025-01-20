@interface STSExpressEventInfo
- (STSExpressEventInfo)initWithState:(unsigned int)a3;
- (unsigned)state;
@end

@implementation STSExpressEventInfo

- (STSExpressEventInfo)initWithState:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSExpressEventInfo;
  result = [(STSExpressEventInfo *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (unsigned)state
{
  return self->_state;
}

@end