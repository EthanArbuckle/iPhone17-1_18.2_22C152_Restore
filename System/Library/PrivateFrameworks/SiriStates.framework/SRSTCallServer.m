@interface SRSTCallServer
- (SRSTCallServer)init;
- (SRSTCallState)currentState;
- (_SRSTCallServer)underlyingObject;
@end

@implementation SRSTCallServer

- (SRSTCallServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTCallServer;
  v2 = [(SRSTCallServer *)&v6 init];
  v3 = objc_alloc_init(_SRSTCallServer);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

- (SRSTCallState)currentState
{
  v3 = [SRSTCallState alloc];
  v4 = [(_SRSTCallServer *)self->_underlyingObject currentState];
  v5 = [(SRSTCallState *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (_SRSTCallServer)underlyingObject
{
  return (_SRSTCallServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end