@interface UIKeyboardCameraBasePresentationController
- (BOOL)presentingOverKeyboard;
- (BOOL)updatesGuideDuringRotation;
- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 forStart:(BOOL)a4;
- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6;
- (void)setPresentingOverKeyboard:(BOOL)a3;
@end

@implementation UIKeyboardCameraBasePresentationController

- (BOOL)updatesGuideDuringRotation
{
  return 0;
}

- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 from:(CGRect)a4 to:(CGRect)a5 forStart:(BOOL)a6
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
  v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v26 = [v18 existingContainerRootController];

  v19 = v26;
  if (!v26)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraBasePresentationController.m" lineNumber:23 description:@"Missing input window."];

    v19 = 0;
  }
  v20 = [v19 view];
  v21 = [v20 window];
  v22 = [v21 windowScene];
  v23 = +[UIKeyboardTrackingCoordinator trackingCoordinatorForScene:v22];

  +[UITransitionView defaultDurationForTransition:16];
  if (v6) {
    objc_msgSend(v23, "animateTrackingElementsFromStart:toEnd:duration:forShow:", a3 == 2, v14, v13, v12, v11, x, y, width, height, v24);
  }
  else {
    objc_msgSend(v23, "moveKeyboardTrackingElementsFromStartFrame:endFrame:duration:isStart:forShow:", 0, a3 == 2, v14, v13, v12, v11, x, y, width, height, v24);
  }
}

- (void)modifyKeyboardTrackingUsingNotificationType:(unint64_t)a3 forStart:(BOOL)a4
{
  BOOL v4 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraBasePresentationController.m" lineNumber:38 description:@"Invalid arguments."];
  }
  v8 = [(UIPresentationController *)self presentingViewController];
  id v56 = v8;
  if (!v8)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraBasePresentationController.m" lineNumber:41 description:@"Missing input window."];

    v8 = 0;
  }
  v9 = [v8 hosting];
  v10 = [v9 itemForPurpose:1];
  [v10 notificationsFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v56, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v12, v14, v16, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(UIPresentationController *)self frameOfPresentedViewInContainerView];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [(UIPresentationController *)self containerView];
  v36 = [v35 window];
  v37 = [(UIPresentationController *)self containerView];
  objc_msgSend(v37, "convertRect:toView:", 0, v28, v30, v32, v34);
  objc_msgSend(v36, "convertRect:toWindow:", 0);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  if (a3 == 2) {
    double v46 = v26;
  }
  else {
    double v46 = v45;
  }
  if (a3 == 2) {
    double v47 = v24;
  }
  else {
    double v47 = v43;
  }
  if (a3 == 2) {
    double v48 = v22;
  }
  else {
    double v48 = v41;
  }
  if (a3 == 2) {
    double v49 = v20;
  }
  else {
    double v49 = v39;
  }
  if (a3 == 2) {
    double v50 = v39;
  }
  else {
    double v50 = v20;
  }
  if (a3 == 2) {
    double v51 = v41;
  }
  else {
    double v51 = v22;
  }
  if (a3 == 2) {
    double v52 = v43;
  }
  else {
    double v52 = v24;
  }
  if (a3 == 2) {
    double v53 = v45;
  }
  else {
    double v53 = v26;
  }
  -[UIKeyboardCameraBasePresentationController modifyKeyboardTrackingUsingNotificationType:from:to:forStart:](self, "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", a3, v4, v49, v48, v47, v46, v50, v51, v52, v53);
}

- (BOOL)presentingOverKeyboard
{
  return self->_presentingOverKeyboard;
}

- (void)setPresentingOverKeyboard:(BOOL)a3
{
  self->_presentingOverKeyboard = a3;
}

@end