@interface SKCaptiveContext
- (SKSetupCaptiveNetworkJoinServer)server;
- (id)responseHandler;
- (void)setResponseHandler:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation SKCaptiveContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setServer:(id)a3
{
}

- (SKSetupCaptiveNetworkJoinServer)server
{
  return self->_server;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

@end