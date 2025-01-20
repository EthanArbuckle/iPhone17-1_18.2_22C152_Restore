@interface _SBSUIRemoteAlertServiceObserverHandle
- (id)activationHandler;
- (id)deactivationHandler;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActivationHandler:(id)a3;
- (void)setDeactivationHandler:(id)a3;
@end

@implementation _SBSUIRemoteAlertServiceObserverHandle

- (void)remoteAlertHandleDidActivate:(id)a3
{
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (id)deactivationHandler
{
  return self->_deactivationHandler;
}

- (void)setDeactivationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
}

@end