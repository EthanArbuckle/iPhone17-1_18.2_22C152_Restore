@interface SBNotificationPresentableViewController
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)shouldAcquireWindowLevelAssertion;
- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4;
- (SBUIPresentableHomeGestureContext)homeGestureContext;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)longLookDidPresentForNotificationViewController:(id)a3;
- (void)longLookWillDismissForNotificationViewController:(id)a3;
- (void)longLookWillPresentForNotificationViewController:(id)a3;
- (void)setHomeGestureContext:(id)a3;
@end

@implementation SBNotificationPresentableViewController

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v5 longLookWillPresentForNotificationViewController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  [WeakRetained setWantsHomeGesture:1];
}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v21 longLookDidPresentForNotificationViewController:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if (objc_opt_respondsToSelector())
  {
    v6 = [WeakRetained platterBarSwipeAffordanceViewForParticipant:self];
    [v6 addObserver:self];
    v7 = [v4 containerViewForExpandedContent];
    [v7 addSubview:v6];
    [v7 bounds];
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    CGRectGetWidth(v22);
    objc_msgSend(v6, "sizeThatFits:", width, height);
    BSRectWithSize();
    double v13 = v12;
    CGFloat v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v15;
    v24.size.double width = v17;
    v24.size.double height = v19;
    objc_msgSend(v6, "setFrame:", v13, MaxY - CGRectGetHeight(v24), v17, v19);
    [v6 setAutoresizingMask:10];
  }
}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBNotificationPresentableViewController;
  [(NCNotificationPresentableViewController *)&v5 longLookWillDismissForNotificationViewController:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  [WeakRetained setWantsHomeGesture:0];
}

- (BOOL)handleHomeButtonPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonDoublePress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleHomeButtonLongPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleLockButtonPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleLockButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVoiceCommandButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVolumeUpButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 handleVolumeDownButtonPress];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 handleHeadsetButtonPress:v3];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  v2 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldAcquireWindowLevelAssertion];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  v7 = [(NCNotificationPresentableViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 shouldDismissForReason:v6 outReason:a4];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  char v3 = [(NCNotificationPresentableViewController *)self notificationViewController];
  id v6 = [v3 presentedExpandedPlatterViewController];

  if (objc_opt_respondsToSelector())
  {
    id v4 = v6;
    char v5 = [v4 dismisser];
    [v5 expandedPlatterPresentable:v4 requestsDismissalWithTrigger:2];
  }
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  return (SBUIPresentableHomeGestureContext *)WeakRetained;
}

- (void)setHomeGestureContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end