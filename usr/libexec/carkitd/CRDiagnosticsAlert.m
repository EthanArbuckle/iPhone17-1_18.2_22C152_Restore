@interface CRDiagnosticsAlert
- (BOOL)allowInCar;
- (NSString)bannerMessage;
- (double)alertDismissal;
- (double)timeoutInterval;
- (id)alertAcceptButtonTitle;
- (id)alertTitle;
- (id)lockscreenTitle;
- (void)setBannerMessage:(id)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation CRDiagnosticsAlert

- (BOOL)allowInCar
{
  return 1;
}

- (double)alertDismissal
{
  [(CRDiagnosticsAlert *)self timeoutInterval];
  return result;
}

- (id)alertTitle
{
  return [(CRDiagnosticsAlert *)self bannerMessage];
}

- (id)lockscreenTitle
{
  return [(CRDiagnosticsAlert *)self bannerMessage];
}

- (id)alertAcceptButtonTitle
{
  return (id)CRLocalizedStringForKey();
}

- (NSString)bannerMessage
{
  return self->_bannerMessage;
}

- (void)setBannerMessage:(id)a3
{
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void).cxx_destruct
{
}

@end