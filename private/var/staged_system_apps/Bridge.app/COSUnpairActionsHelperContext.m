@interface COSUnpairActionsHelperContext
- (BOOL)markAsMissing;
- (NRDevice)device;
- (NSString)activationLockRemovalTitle;
- (NSString)failureMessage;
- (UIViewController)presentingViewController;
- (void)setActivationLockRemovalTitle:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFailureMessage:(id)a3;
- (void)setMarkAsMissing:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation COSUnpairActionsHelperContext

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (BOOL)markAsMissing
{
  return self->_markAsMissing;
}

- (void)setMarkAsMissing:(BOOL)a3
{
  self->_markAsMissing = a3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)activationLockRemovalTitle
{
  return self->_activationLockRemovalTitle;
}

- (void)setActivationLockRemovalTitle:(id)a3
{
}

- (NSString)failureMessage
{
  return self->_failureMessage;
}

- (void)setFailureMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureMessage, 0);
  objc_storeStrong((id *)&self->_activationLockRemovalTitle, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end