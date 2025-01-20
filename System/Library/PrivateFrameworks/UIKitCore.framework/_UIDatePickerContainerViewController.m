@interface _UIDatePickerContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (_UIDatePickerContainerViewController)initWithPresentation:(id)a3;
- (_UIDatePickerOverlayPresentation)presentation;
- (double)keyboardAdjustmentOffset;
- (id)keyCommands;
- (id)pendingKeyboardAdjustment;
- (void)_didReceiveEscapeKey:(id)a3;
- (void)dealloc;
- (void)didChangeKeyboardAvoidanceAdjustmentDeferral;
- (void)keyboardFrameWillChange:(id)a3;
- (void)setKeyboardAdjustmentOffset:(double)a3;
- (void)setPendingKeyboardAdjustment:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIDatePickerContainerViewController

- (id)keyCommands
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputEscape" modifierFlags:0 action:sel__didReceiveEscapeKey_];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (_UIDatePickerOverlayPresentation)presentation
{
  v2 = [(UIViewController *)self view];
  v3 = [v2 presentation];

  return (_UIDatePickerOverlayPresentation *)v3;
}

- (_UIDatePickerContainerViewController)initWithPresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerContainerViewController;
  v5 = [(UIViewController *)&v10 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [v6 setPresentation:v4];
    v7 = [v6 passthroughInteraction];
    [v7 setDelegate:v5];

    [(UIViewController *)v5 setView:v6];
    [(UIViewController *)v5 setModalPresentationStyle:5];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel_keyboardFrameWillChange_ name:@"UIKeyboardWillChangeFrameNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardWillChangeFrameNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerContainerViewController;
  [(UIViewController *)&v4 dealloc];
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_didReceiveEscapeKey:(id)a3
{
  id v3 = [(_UIDatePickerContainerViewController *)self presentation];
  [v3 dismissPresentationAnimated:1];
}

- (void)keyboardFrameWillChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"UIKeyboardAnimationDurationUserInfoKey"];
  [v6 doubleValue];
  double v8 = v7;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x4010000000;
  v24[3] = &unk_186D7DBA7;
  long long v25 = 0u;
  long long v26 = 0u;
  v9 = [v4 userInfo];
  objc_super v10 = [v9 objectForKeyedSubscript:@"UIKeyboardFrameEndUserInfoKey"];
  [v10 CGRectValue];
  *(void *)&long long v25 = v11;
  *((void *)&v25 + 1) = v12;
  *(void *)&long long v26 = v13;
  *((void *)&v26 + 1) = v14;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  uint64_t v23 = 0;
  v15 = [v4 userInfo];
  v16 = [v15 objectForKeyedSubscript:@"UIKeyboardAnimationCurveUserInfoKey"];
  uint64_t v17 = [v16 integerValue];

  uint64_t v23 = v17;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = fmax(v8, 0.25);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke;
  v20[3] = &unk_1E530E258;
  v20[4] = self;
  v20[5] = v24;
  v20[6] = v21;
  v20[7] = v22;
  v18 = (void (**)(void))_Block_copy(v20);
  v19 = [(_UIDatePickerContainerViewController *)self presentation];
  LODWORD(v16) = [v19 defersAutomaticKeyboardAvoidanceAdjustments];

  if (v16) {
    [(_UIDatePickerContainerViewController *)self setPendingKeyboardAdjustment:v18];
  }
  else {
    v18[2](v18);
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

- (void)didChangeKeyboardAvoidanceAdjustmentDeferral
{
  id v3 = [(_UIDatePickerContainerViewController *)self pendingKeyboardAdjustment];

  if (v3)
  {
    id v4 = [(_UIDatePickerContainerViewController *)self pendingKeyboardAdjustment];
    v4[2]();

    [(_UIDatePickerContainerViewController *)self setPendingKeyboardAdjustment:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerContainerViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5 = [(_UIDatePickerContainerViewController *)self presentation];
  [v5 dismissPresentationAnimated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerContainerViewController;
  -[UIViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  if ([(UIViewController *)self isBeingDismissed])
  {
    v5 = [(_UIDatePickerContainerViewController *)self presentation];
    objc_super v6 = [v5 containerViewController];

    if (v6 == self)
    {
      double v7 = [(_UIDatePickerContainerViewController *)self presentation];
      [v7 dismissPresentationAnimated:v3];
    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerViewController;
  id v6 = a3;
  [(UIViewController *)&v14 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  uint64_t v7 = objc_msgSend(v6, "horizontalSizeClass", v14.receiver, v14.super_class);
  objc_super v8 = [(UIViewController *)self traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];

  uint64_t v10 = [v6 verticalSizeClass];
  uint64_t v11 = [(UIViewController *)self traitCollection];
  uint64_t v12 = [v11 verticalSizeClass];

  if (![(UIViewController *)self isBeingPresented] && (v7 != v9 || v10 != v12))
  {
    uint64_t v13 = [(_UIDatePickerContainerViewController *)self presentation];
    [v13 dismissPresentationAnimated:0];
  }
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  BOOL v3 = [(_UIDatePickerContainerViewController *)self presentation];
  [v3 dismissPresentationAnimated:1];

  return 1;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  uint64_t v9 = [(UIViewController *)self presentedViewController];

  if (v9)
  {
    char v10 = 0;
  }
  else
  {
    uint64_t v11 = [(UIViewController *)self view];
    uint64_t v12 = [(UIViewController *)self _window];
    objc_msgSend(v12, "convertPoint:fromView:", v11, x, y);
    double v14 = v13;
    double v16 = v15;

    [v11 setLastHitTestWasPassedThrough:0];
    uint64_t v17 = [(UIViewController *)self _window];
    id v18 = (id)objc_msgSend(v17, "hitTest:withEvent:", v8, v14, v16);

    char v10 = [v11 lastHitTestWasPassedThrough];
  }

  return v10;
}

- (id)pendingKeyboardAdjustment
{
  return self->_pendingKeyboardAdjustment;
}

- (void)setPendingKeyboardAdjustment:(id)a3
{
}

- (double)keyboardAdjustmentOffset
{
  return self->_keyboardAdjustmentOffset;
}

- (void)setKeyboardAdjustmentOffset:(double)a3
{
  self->_keyboardAdjustmentOffset = a3;
}

- (void).cxx_destruct
{
}

@end