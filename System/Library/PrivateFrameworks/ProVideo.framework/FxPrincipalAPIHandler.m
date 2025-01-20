@interface FxPrincipalAPIHandler
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (FxPrincipalAPIHandler)initWithDelegate:(id)a3;
- (id)delegate;
- (id)servicePrincipal;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation FxPrincipalAPIHandler

- (FxPrincipalAPIHandler)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FxPrincipalAPIHandler;
  v4 = [(FxPrincipalAPIHandler *)&v6 init];
  if (v4) {
    v4->_delegate = (FxPlugPrincipalDelegate *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FxPrincipalAPIHandler;
  [(FxPrincipalAPIHandler *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  delegate = self->_delegate;
  self->_delegate = (FxPlugPrincipalDelegate *)a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (id)servicePrincipal
{
  return (id)[(FxPlugPrincipalDelegate *)self->_delegate fxServiceProxy];
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return 0;
}

@end