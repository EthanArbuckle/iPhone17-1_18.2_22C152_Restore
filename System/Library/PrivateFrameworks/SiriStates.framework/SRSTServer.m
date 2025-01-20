@interface SRSTServer
- (SRSTServer)init;
- (SRSTState)currentState;
- (_SRSTServer)underlyingObject;
@end

@implementation SRSTServer

- (SRSTServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSTServer;
  v2 = [(SRSTServer *)&v6 init];
  v3 = objc_alloc_init(_SRSTServer);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

- (SRSTState)currentState
{
  v3 = [SRSTState alloc];
  v4 = [(_SRSTServer *)self->_underlyingObject currentState];
  v5 = [(SRSTState *)v3 initWithUnderlyingObject:v4];

  return v5;
}

- (_SRSTServer)underlyingObject
{
  return (_SRSTServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end