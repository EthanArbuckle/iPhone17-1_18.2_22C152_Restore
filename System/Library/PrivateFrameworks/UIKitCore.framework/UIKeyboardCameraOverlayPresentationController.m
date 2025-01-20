@interface UIKeyboardCameraOverlayPresentationController
- (BOOL)updatesGuideDuringRotation;
- (CGRect)frameOfPresentedViewInContainerView;
- (void)_determinePortraitHeights;
- (void)_handlePan:(id)a3;
- (void)_installGrabber;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIKeyboardCameraOverlayPresentationController

- (BOOL)updatesGuideDuringRotation
{
  return ![(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard];
}

- (void)_determinePortraitHeights
{
  if ([(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard])
  {
    v3 = [(UIPresentationController *)self presentingViewController];
    v4 = [v3 inputViewSet];
    v5 = [v4 inputView];
    uint64_t v6 = [v4 inputAssistantView];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v5;
    }
    id v9 = v8;
    [v9 bounds];
    objc_msgSend(v9, "convertRect:toView:", 0);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v18 = +[UIScreen mainScreen];
    [v18 bounds];
    double Height = CGRectGetHeight(v26);
    v27.origin.x = v11;
    v27.origin.y = v13;
    v27.size.width = v15;
    v27.size.height = v17;
    double v20 = Height - CGRectGetMinY(v27);

    self->_keyboardCameraNormaldouble Height = v20;
  }
  else
  {
    self->_keyboardCameraNormaldouble Height = 325.0;
  }
  v21 = [(UIPresentationController *)self containerView];
  [v21 bounds];
  double v23 = v22;
  v24 = [(UIPresentationController *)self containerView];
  [v24 safeAreaInsets];
  self->_keyboardCameraFullScreendouble Height = v23 - v25;

  self->_keyboardCameradouble Height = self->_keyboardCameraNormalHeight;
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  switch(v5)
  {
    case 3:
      keyboardCameraNormaldouble Height = self->_keyboardCameraNormalHeight;
      if (self->_panningStartingHeight == keyboardCameraNormalHeight)
      {
        if (self->_keyboardCameraHeight - keyboardCameraNormalHeight > 75.0)
        {
          keyboardCameraFullScreendouble Height = self->_keyboardCameraFullScreenHeight;
LABEL_12:
          keyboardCameraNormaldouble Height = keyboardCameraFullScreenHeight;
        }
      }
      else
      {
        keyboardCameraFullScreendouble Height = self->_keyboardCameraFullScreenHeight;
        if (keyboardCameraFullScreenHeight - self->_keyboardCameraHeight <= 75.0) {
          goto LABEL_12;
        }
      }
      self->_keyboardCameradouble Height = keyboardCameraNormalHeight;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__UIKeyboardCameraOverlayPresentationController__handlePan___block_invoke;
      v22[3] = &unk_1E52D9F70;
      v22[4] = self;
      +[UIView animateWithDuration:v22 animations:0.25];
      break;
    case 2:
      v8 = [(UIPresentationController *)self containerView];
      [v4 translationInView:v8];
      double v10 = v9;

      panningStartingdouble Height = self->_panningStartingHeight;
      double v12 = fmax(panningStartingHeight - v10, self->_keyboardCameraNormalHeight);
      if (vabdd_f64(v12, panningStartingHeight) > 75.0) {
        [v4 setState:3];
      }
      self->_keyboardCameradouble Height = v12;
      [(UIKeyboardCameraOverlayPresentationController *)self frameOfPresentedViewInContainerView];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(UIPresentationController *)self presentedView];
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

      break;
    case 1:
      self->_panningStartingdouble Height = self->_keyboardCameraHeight;
      break;
  }
}

void __60__UIKeyboardCameraOverlayPresentationController__handlePan___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frameOfPresentedViewInContainerView];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [*(id *)(a1 + 32) presentedView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  id v11 = [*(id *)(a1 + 32) containerView];
  [v11 layoutIfNeeded];
}

- (void)_installGrabber
{
  v28[4] = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  grabberView = self->_grabberView;
  if (has_internal_diagnostics)
  {
    if (grabberView)
    {
      double v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "There's a request to install the Keyboard Camera grabber when it already exists", buf, 2u);
      }
    }
  }
  else if (grabberView)
  {
    double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_installGrabber___s_category) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "There's a request to install the Keyboard Camera grabber when it already exists", buf, 2u);
    }
  }
  double v5 = objc_alloc_init(UIKeyboardCameraGrabberView);
  double v6 = self->_grabberView;
  self->_grabberView = v5;

  [(UIView *)self->_grabberView setTranslatesAutoresizingMaskIntoConstraints:0];
  CGRect v26 = [(UIPresentationController *)self containerView];
  double v7 = [(UIPresentationController *)self presentedView];
  [v26 addSubview:self->_grabberView];
  double v20 = (void *)MEMORY[0x1E4F5B268];
  double v25 = [(UIView *)self->_grabberView topAnchor];
  double v23 = [v7 topAnchor];
  double v22 = [v25 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v21 = [(UIView *)self->_grabberView centerXAnchor];
  v24 = v7;
  double v8 = [v7 centerXAnchor];
  double v9 = [v21 constraintEqualToAnchor:v8];
  v28[1] = v9;
  double v10 = [(UIView *)self->_grabberView heightAnchor];
  id v11 = [v10 constraintEqualToConstant:30.0];
  v28[2] = v11;
  double v12 = [(UIView *)self->_grabberView widthAnchor];
  double v13 = [v7 widthAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  v28[3] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v20 activateConstraints:v15];

  double v16 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__handlePan_];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v16;

  [(UIView *)self->_grabberView addGestureRecognizer:self->_panGestureRecognizer];
  [(UIView *)self->_grabberView setHidden:self->_isLandscape];
}

- (void)presentationTransitionWillBegin
{
  double v3 = +[UIDevice currentDevice];
  self->_isLandscape = (unint64_t)([v3 orientation] - 3) < 2;

  [(UIKeyboardCameraOverlayPresentationController *)self _determinePortraitHeights];
  if (![(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard])
  {
    [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:2 forStart:1];
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  [(UIPresentationController *)self _setContainerIgnoresDirectTouchEvents:1];
  [(UIKeyboardCameraOverlayPresentationController *)self _installGrabber];
  if (![(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard])
  {
    [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:2 forStart:0];
  }
}

- (void)dismissalTransitionWillBegin
{
  if (![(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard])
  {
    [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:3 forStart:1];
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (![(UIKeyboardCameraBasePresentationController *)self presentingOverKeyboard])
  {
    [(UIKeyboardCameraBasePresentationController *)self modifyKeyboardTrackingUsingNotificationType:3 forStart:0];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3 = [(UIPresentationController *)self containerView];
  [v3 bounds];

  BOOL isLandscape = self->_isLandscape;
  double v5 = [(UIPresentationController *)self containerView];
  [v5 bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  keyboardCameraCGFloat Height = v12;

  if (!isLandscape)
  {
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = keyboardCameraHeight;
    CGFloat Height = CGRectGetHeight(v19);
    keyboardCameraCGFloat Height = self->_keyboardCameraHeight;
    double v9 = v9 + Height - keyboardCameraHeight;
  }
  double v15 = v7;
  double v16 = v9;
  double v17 = v11;
  double v18 = keyboardCameraHeight;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardCameraOverlayPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  BOOL v8 = [(UIKeyboardCameraOverlayPresentationController *)self updatesGuideDuringRotation];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x4010000000;
  v16[3] = &unk_186D7DBA7;
  long long v17 = 0u;
  long long v18 = 0u;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x4010000000;
  v13[3] = &unk_186D7DBA7;
  long long v14 = 0u;
  long long v15 = 0u;
  self->_BOOL isLandscape = width > height;
  -[UIView setHidden:](self->_grabberView, "setHidden:");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E52E9A48;
  v11[4] = self;
  v11[5] = v16;
  v11[6] = v13;
  BOOL v12 = v8;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E52E9A48;
  BOOL v10 = v8;
  v9[4] = self;
  v9[5] = v16;
  v9[6] = v13;
  [v7 animateAlongsideTransition:v11 completion:v9];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v16, 8);
}

void __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _determinePortraitHeights];
  double v2 = [*(id *)(a1 + 32) presentedView];
  [v2 frame];
  double v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

  [*(id *)(a1 + 32) frameOfPresentedViewInContainerView];
  BOOL v8 = *(void **)(*(void *)(a1 + 48) + 8);
  v8[4] = v9;
  v8[5] = v10;
  v8[6] = v11;
  v8[7] = v12;
  if (*(unsigned char *)(a1 + 56))
  {
    double v13 = *(double **)(*(void *)(a1 + 40) + 8);
    long long v14 = *(double **)(*(void *)(a1 + 48) + 8);
    objc_msgSend(*(id *)(a1 + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 1, 0, v13[4], v13[5], v13[6], v13[7], v14[4], v14[5], v14[6], v14[7]);
  }
  long long v15 = *(double **)(*(void *)(a1 + 48) + 8);
  double v16 = v15[4];
  double v17 = v15[5];
  double v18 = v15[6];
  double v19 = v15[7];
  id v20 = [*(id *)(a1 + 32) presentedView];
  objc_msgSend(v20, "setFrame:", v16, v17, v18, v19);
}

uint64_t __100__UIKeyboardCameraOverlayPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 56))
  {
    v1 = *(double **)(*(void *)(result + 40) + 8);
    double v2 = *(double **)(*(void *)(result + 48) + 8);
    return objc_msgSend(*(id *)(result + 32), "modifyKeyboardTrackingUsingNotificationType:from:to:forStart:", 1, 0, v1[4], v1[5], v1[6], v1[7], v2[4], v2[5], v2[6], v2[7]);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
}

@end