@interface SBDeviceApplicationRemoteTransientOverlayPresentationContext
- (BSInvalidatable)pipStashAssertion;
- (SBRemoteTransientOverlayViewController)remoteViewController;
- (SBSRemoteAlertPresentationTarget)presentationTarget;
- (void)dealloc;
- (void)setPIPStashAssertion:(id)a3;
- (void)setPresentationTarget:(id)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation SBDeviceApplicationRemoteTransientOverlayPresentationContext

- (void)dealloc
{
  pipStashAssertion = self->_pipStashAssertion;
  if (pipStashAssertion)
  {
    [(BSInvalidatable *)pipStashAssertion invalidate];
    v4 = self->_pipStashAssertion;
    self->_pipStashAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayPresentationContext;
  [(SBDeviceApplicationRemoteTransientOverlayPresentationContext *)&v5 dealloc];
}

- (SBRemoteTransientOverlayViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
}

- (BSInvalidatable)pipStashAssertion
{
  return self->_pipStashAssertion;
}

- (void)setPIPStashAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipStashAssertion, 0);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end