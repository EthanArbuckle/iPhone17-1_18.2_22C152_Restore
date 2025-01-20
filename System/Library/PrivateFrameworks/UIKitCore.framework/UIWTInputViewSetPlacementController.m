@interface UIWTInputViewSetPlacementController
- (id)_inputWindowController;
- (id)_keyboardTrackingCoordinator;
- (void)_postNotificationsForType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6;
- (void)_postNotificationsForType:(unint64_t)a3 onScreenFrame:(CGRect)a4 forStart:(BOOL)a5;
- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 forShow:(BOOL)a5;
- (void)endFrameChange:(CGRect)a3 to:(CGRect)a4;
- (void)endHideOnScreenFrame:(CGRect)a3;
- (void)endShowOnScreenFrame:(CGRect)a3;
- (void)startFrameChange:(CGRect)a3 to:(CGRect)a4;
- (void)startHideOnScreenFrame:(CGRect)a3;
- (void)startShowForOnScreenFrame:(CGRect)a3;
@end

@implementation UIWTInputViewSetPlacementController

- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 forShow:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  v15 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  char v16 = [v15 showsInvisibleKeyboardBehindWTUI];

  if ((v16 & 1) == 0)
  {
    id v17 = [(UIWTInputViewSetPlacementController *)self _keyboardTrackingCoordinator];
    objc_msgSend(v17, "animateTrackingElementsFromStart:toEnd:duration:forShow:", v5, v13, v12, v11, v10, x, y, width, height, _UISheetTransitionDuration());
  }
}

- (id)_keyboardTrackingCoordinator
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v2 scene];

  v4 = +[UIKeyboardTrackingCoordinator trackingCoordinatorForScene:v3];

  return v4;
}

- (void)startShowForOnScreenFrame:(CGRect)a3
{
}

- (void)endShowOnScreenFrame:(CGRect)a3
{
}

- (void)startHideOnScreenFrame:(CGRect)a3
{
}

- (void)endHideOnScreenFrame:(CGRect)a3
{
}

- (void)startFrameChange:(CGRect)a3 to:(CGRect)a4
{
}

- (void)endFrameChange:(CGRect)a3 to:(CGRect)a4
{
}

- (void)_postNotificationsForType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v17 = [(UIWTInputViewSetPlacementController *)self _inputWindowController];
  char v16 = objc_alloc_init(UIInputViewSetNotificationInfo);
  -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v16, "populateStartInfoWithFrame:", v14, v13, v12, v11);
  -[UIInputViewSetNotificationInfo populateEndInfoWithFrame:](v16, "populateEndInfoWithFrame:", x, y, width, height);
  [(UIInputViewSetNotificationInfo *)v16 addKeyboardNotificationDebuggingInfo:@"WTWritingToolsViewController"];
  [(UIInputViewSetNotificationInfo *)v16 setForWritingToolsSheet:1];
  if (v6)
  {
    [v17 postStartNotifications:a3 withInfo:v16];
    [v17 keyboardMoveOfType:a3 info:v16];
  }
  else
  {
    [v17 postEndNotifications:a3 withInfo:v16];
  }
}

- (void)_postNotificationsForType:(unint64_t)a3 onScreenFrame:(CGRect)a4 forStart:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"UIWTInputViewSetPlacementController.m" lineNumber:81 description:@"Invalid arguments."];
  }
  id v18 = [(UIWTInputViewSetPlacementController *)self _inputWindowController];
  if (a3 == 2) {
    double v12 = 0.0;
  }
  else {
    double v12 = height;
  }
  if (a3 == 2) {
    double v13 = y + height;
  }
  else {
    double v13 = y;
  }
  if (a3 == 2) {
    double v14 = y;
  }
  else {
    double v14 = y + height;
  }
  if (a3 == 2) {
    double v15 = height;
  }
  else {
    double v15 = 0.0;
  }
  -[UIWTInputViewSetPlacementController _postNotificationsForType:from:to:forStart:](self, "_postNotificationsForType:from:to:forStart:", a3, v5, x, v13, width, v12, x, v14, width, v15);
}

- (id)_inputWindowController
{
  v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v5 = [v4 existingContainerRootController];
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIWTInputViewSetPlacementController.m" lineNumber:94 description:@"Missing input window."];
  }
  return v5;
}

@end