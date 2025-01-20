@interface COSWaitForActivationController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (void)didEstablishHold;
- (void)finishedActivating;
@end

@implementation COSWaitForActivationController

+ (BOOL)controllerNeedsToRun
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 isActivated];

  return v3 ^ 1;
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 0.0;
}

- (void)didEstablishHold
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = PBBridgeGizmoDidFinishActivatingNotification;
  [v3 addObserver:self selector:"finishedActivating" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 isActivated];

  if (v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:v4 object:0];

    id v10 = [(COSWaitForActivationController *)self delegate];
    [v10 buddyControllerReleaseHoldAndSkip:self];
  }
  else
  {
    id v10 = +[UIApplication sharedApplication];
    v8 = [v10 setupController];
    v9 = [v8 activationManager];
    [v9 setAwaitingActivation:1];
  }
}

- (void)finishedActivating
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  uint64_t v4 = [(COSWaitForActivationController *)self delegate];
  unsigned int v5 = [v4 buddyControllerIsBeingHeldOff:self];

  if (v5)
  {
    id v6 = [(COSWaitForActivationController *)self delegate];
    [v6 buddyControllerReleaseHoldAndSkip:self];
  }
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"ACTIVATION_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)holdActivityIdentifier
{
  return @"WaitForActivationController";
}

@end