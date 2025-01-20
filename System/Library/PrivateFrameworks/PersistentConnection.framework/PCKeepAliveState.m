@interface PCKeepAliveState
- (PCKeepAliveState)initWithKeepAliveState:(unsigned __int8)a3 subState:(unsigned __int8)a4;
- (unsigned)state;
- (unsigned)subState;
- (void)setState:(unsigned __int8)a3;
- (void)setSubState:(unsigned __int8)a3;
@end

@implementation PCKeepAliveState

- (PCKeepAliveState)initWithKeepAliveState:(unsigned __int8)a3 subState:(unsigned __int8)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PCKeepAliveState;
  result = [(PCKeepAliveState *)&v6 init];
  if (result)
  {
    result->_state = a3;
    result->_subState = a3;
  }
  return result;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unsigned)subState
{
  return self->_subState;
}

- (void)setSubState:(unsigned __int8)a3
{
  self->_subState = a3;
}

@end