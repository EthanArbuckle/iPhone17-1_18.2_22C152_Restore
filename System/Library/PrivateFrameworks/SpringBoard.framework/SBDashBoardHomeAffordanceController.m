@interface SBDashBoardHomeAffordanceController
- (BSAnimationSettings)hideHomeAffordanceAnimationSettings;
- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings;
- (SBDashBoardHomeAffordanceController)init;
- (UIPanGestureRecognizer)screenEdgePanGesture;
- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription;
- (id)keyboardAssertionForGestureWindow:(id)a3;
- (void)registerHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4;
- (void)unregisterHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4;
@end

@implementation SBDashBoardHomeAffordanceController

- (SBDashBoardHomeAffordanceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHomeAffordanceController;
  v2 = [(SBDashBoardHomeAffordanceController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SBNotificationHomeAffordanceController sharedInstance];
    notificationHomeAffordanceController = v2->_notificationHomeAffordanceController;
    v2->_notificationHomeAffordanceController = (SBNotificationHomeAffordanceController *)v3;
  }
  return v2;
}

- (UIPanGestureRecognizer)screenEdgePanGesture
{
  return (UIPanGestureRecognizer *)[(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController screenEdgePanGesture];
}

- (BSAnimationSettings)hideHomeAffordanceAnimationSettings
{
  return [(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController hideHomeAffordanceAnimationSettings];
}

- (BSAnimationSettings)unhideHomeAffordanceAnimationSettings
{
  return [(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController unhideHomeAffordanceAnimationSettings];
}

- (UIViewSpringAnimationBehaviorDescribing)settleHomeAffordanceAnimationBehaviorDescription
{
  return [(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController settleHomeAffordanceAnimationBehaviorDescription];
}

- (void)registerHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4
{
  id object = a3;
  objc_getAssociatedObject(object, "SBDashBoardHomeAffordanceControllerParticipantKey");
  v5 = (SBDashBoardHomeAffordanceControllerClientBridge *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = [[SBDashBoardHomeAffordanceControllerClientBridge alloc] initWithCoverSheetHomeGestureParticipant:object];
    objc_setAssociatedObject(object, "SBDashBoardHomeAffordanceControllerParticipantKey", v5, (void *)1);
  }
  [(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController registerClient:v5 withZStackIdentifier:14];
}

- (void)unregisterHomeGestureParticipant:(id)a3 withIdentifier:(int64_t)a4
{
  id v5 = a3;
  objc_getAssociatedObject(v5, "SBDashBoardHomeAffordanceControllerParticipantKey");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SBNotificationHomeAffordanceController *)self->_notificationHomeAffordanceController unregisterClient:v6 withZStackIdentifier:14];
  objc_setAssociatedObject(v5, "SBDashBoardHomeAffordanceControllerParticipantKey", 0, (void *)1);
}

- (id)keyboardAssertionForGestureWindow:(id)a3
{
  return +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:a3];
}

- (void).cxx_destruct
{
}

@end