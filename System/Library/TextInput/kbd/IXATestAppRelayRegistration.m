@interface IXATestAppRelayRegistration
- (BOOL)canReplace;
- (IXATestAppRelayRegistration)initWithEndpoint:(id)a3 andEntitlement:(id)a4 canReplace:(BOOL)a5;
- (NSString)entitlement;
- (NSXPCListenerEndpoint)endpoint;
- (void)setCanReplace:(BOOL)a3;
- (void)setEndpoint:(id)a3;
- (void)setEntitlement:(id)a3;
@end

@implementation IXATestAppRelayRegistration

- (IXATestAppRelayRegistration)initWithEndpoint:(id)a3 andEntitlement:(id)a4 canReplace:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IXATestAppRelayRegistration;
  v11 = [(IXATestAppRelayRegistration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_endpoint, a3);
    objc_storeStrong((id *)&v12->_entitlement, a4);
    v12->_canReplace = a5;
  }

  return v12;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
}

- (BOOL)canReplace
{
  return self->_canReplace;
}

- (void)setCanReplace:(BOOL)a3
{
  self->_canReplace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end