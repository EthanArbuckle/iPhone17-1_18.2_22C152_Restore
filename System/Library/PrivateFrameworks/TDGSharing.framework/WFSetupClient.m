@interface WFSetupClient
- (CUMessageSession)messageSessionTemplate;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (WFSetupClient)init;
- (WFSetupClientInternal)underlyingSwiftObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)progressEventHandler;
- (id)receivedObjectHandler;
- (id)securePairingCompletionHandler;
- (id)setupProgressEventHandler;
- (id)showPINHandler;
- (id)userInteractionProgressEventHandler;
- (void)activate;
- (void)invalidate;
- (void)sendObject:(id)a3 encrypted:(BOOL)a4;
- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setProgressEventHandler:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setSecurePairingCompletionHandler:(id)a3;
- (void)setSetupProgressEventHandler:(id)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setUserInteractionProgressEventHandler:(id)a3;
@end

@implementation WFSetupClient

- (WFSetupClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSetupClient;
  v2 = [(WFSetupClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    underlyingSwiftObject = v2->_underlyingSwiftObject;
    v2->_underlyingSwiftObject = (WFSetupClientInternal *)v3;

    v5 = v2;
  }

  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject dispatchQueue];
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject interruptionHandler];
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject invalidationHandler];
}

- (void)setInvalidationHandler:(id)a3
{
}

- (SFDevice)peerDevice
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject peerDevice];
}

- (void)setPeerDevice:(id)a3
{
}

- (id)setupProgressEventHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject setupProgressEventHandler];
}

- (void)setSetupProgressEventHandler:(id)a3
{
}

- (id)userInteractionProgressEventHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject userInteractionProgressEventHandler];
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSetupClient *)self underlyingSwiftObject];
  [v5 setUserInteractionProgressEventHandler:v4];
}

- (id)showPINHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject showPinHandler];
}

- (void)setShowPINHandler:(id)a3
{
}

- (id)receivedObjectHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject receivedObjectHandler];
}

- (void)setReceivedObjectHandler:(id)a3
{
}

- (id)securePairingCompletionHandler
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject setupSecurePairingCompletionHandler];
}

- (void)setSecurePairingCompletionHandler:(id)a3
{
}

- (void)activate
{
}

- (void)invalidate
{
}

- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
}

- (void)sendObject:(id)a3 encrypted:(BOOL)a4
{
}

- (CUMessageSession)messageSessionTemplate
{
  return [(WFSetupClientInternal *)self->_underlyingSwiftObject messageSessionTemplate];
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
}

- (WFSetupClientInternal)underlyingSwiftObject
{
  return (WFSetupClientInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSwiftObject, 0);

  objc_storeStrong(&self->_progressEventHandler, 0);
}

@end