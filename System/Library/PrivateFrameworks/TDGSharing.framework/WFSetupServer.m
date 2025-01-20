@interface WFSetupServer
- (OS_dispatch_queue)dispatchQueue;
- (WFSetupServer)init;
- (WFSetupServerInternal)underlyingSwiftObject;
- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider;
- (id)completionHandler;
- (id)receivedObjectHandler;
- (id)setupProgressEventHandler;
- (id)setupPromptPinHandler;
- (id)userInteractionProgressEventHandler;
- (void)activate;
- (void)invalidate;
- (void)prepareToRun;
- (void)sendObject:(id)a3 withEncryption:(BOOL)a4;
- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5;
- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setSetupProgressEventHandler:(id)a3;
- (void)setSetupPromptPinHandler:(id)a3;
- (void)setUserInteractionProgressEventHandler:(id)a3;
- (void)startSecureChannelWithResetFlag:(BOOL)a3 completion:(id)a4;
- (void)startSecureChannelWithResetFlag:(BOOL)a3 context:(id)a4 completion:(id)a5;
- (void)tryPIN:(id)a3;
@end

@implementation WFSetupServer

- (WFSetupServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSetupServer;
  v2 = [(WFSetupServer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    underlyingSwiftObject = v2->_underlyingSwiftObject;
    v2->_underlyingSwiftObject = (WFSetupServerInternal *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)completionHandler
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject completionHandler];
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)receivedObjectHandler
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject receivedObjectHandler];
}

- (void)setReceivedObjectHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject dispatchQueue];
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setSetupPromptPinHandler:(id)a3
{
}

- (id)setupPromptPinHandler
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject setupPromptPinHandler];
}

- (id)setupProgressEventHandler
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject setupProgressEventHandler];
}

- (void)setSetupProgressEventHandler:(id)a3
{
}

- (id)userInteractionProgressEventHandler
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject userInteractionProgressEventHandler];
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  return [(WFSetupServerInternal *)self->_underlyingSwiftObject anisetteDataProvider];
}

- (void)prepareToRun
{
}

- (void)activate
{
}

- (void)invalidate
{
}

- (void)sendObject:(id)a3 withEncryption:(BOOL)a4
{
}

- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
}

- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
}

- (void)tryPIN:(id)a3
{
}

- (void)startSecureChannelWithResetFlag:(BOOL)a3 completion:(id)a4
{
}

- (void)startSecureChannelWithResetFlag:(BOOL)a3 context:(id)a4 completion:(id)a5
{
}

- (WFSetupServerInternal)underlyingSwiftObject
{
  return (WFSetupServerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end