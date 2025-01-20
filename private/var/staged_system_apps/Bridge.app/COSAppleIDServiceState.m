@interface COSAppleIDServiceState
- (BOOL)recoveringCredentials;
- (BOOL)signInResponseFromWatchPendingAcknowledgement;
- (BOOL)signInSkipped;
- (BOOL)signedIn;
- (BOOL)silentSignInSuccessful;
- (BOOL)waitingForSilentSigninToComplete;
- (COSAppleIDAuthController)authController;
- (COSAppleIDServiceState)initWithServiceType:(int64_t)a3;
- (id)description;
- (int64_t)serviceType;
- (void)setAuthController:(id)a3;
- (void)setRecoveringCredentials:(BOOL)a3;
- (void)setSignInResponseFromWatchPendingAcknowledgement:(BOOL)a3;
- (void)setSignInSkipped:(BOOL)a3;
- (void)setSignedIn:(BOOL)a3;
- (void)setSilentSignInSuccessful:(BOOL)a3;
- (void)setWaitingForSilentSigninToComplete:(BOOL)a3;
@end

@implementation COSAppleIDServiceState

- (COSAppleIDServiceState)initWithServiceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSAppleIDServiceState;
  result = [(COSAppleIDServiceState *)&v5 init];
  if (result)
  {
    result->_serviceType = a3;
    result->_waitingForSilentSigninToComplete = 1;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"serviceType: %ld signedIn: %d signInSkipped: %d recoveringCredentials: %d signInResponseFromWatchPendingAcknowledgement: %d authController: %d waitingForSilentSigninToComplete: %d silentSignInSuccessful: %d", self->_serviceType, self->_signedIn, self->_signInSkipped, self->_recoveringCredentials, self->_signInResponseFromWatchPendingAcknowledgement, self->_authController != 0, self->_waitingForSilentSigninToComplete, self->_silentSignInSuccessful];
}

- (BOOL)signedIn
{
  return self->_signedIn;
}

- (void)setSignedIn:(BOOL)a3
{
  self->_signedIn = a3;
}

- (BOOL)signInSkipped
{
  return self->_signInSkipped;
}

- (void)setSignInSkipped:(BOOL)a3
{
  self->_signInSkipped = a3;
}

- (BOOL)recoveringCredentials
{
  return self->_recoveringCredentials;
}

- (void)setRecoveringCredentials:(BOOL)a3
{
  self->_recoveringCredentials = a3;
}

- (BOOL)signInResponseFromWatchPendingAcknowledgement
{
  return self->_signInResponseFromWatchPendingAcknowledgement;
}

- (void)setSignInResponseFromWatchPendingAcknowledgement:(BOOL)a3
{
  self->_signInResponseFromWatchPendingAcknowledgement = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (BOOL)waitingForSilentSigninToComplete
{
  return self->_waitingForSilentSigninToComplete;
}

- (void)setWaitingForSilentSigninToComplete:(BOOL)a3
{
  self->_waitingForSilentSigninToComplete = a3;
}

- (BOOL)silentSignInSuccessful
{
  return self->_silentSignInSuccessful;
}

- (void)setSilentSignInSuccessful:(BOOL)a3
{
  self->_silentSignInSuccessful = a3;
}

- (COSAppleIDAuthController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end