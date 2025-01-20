@interface _UIFallbackPresentationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasDismissCompletionHandler;
- (BOOL)hasPreservedKeyboardInputViews;
- (UIWindow)rotationDecider;
- (id)presentationPreparationBlock;
- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5;
- (void)_preparePresentationControllerForPresenting:(id)a3;
- (void)_presentViewController:(id)a3 sendingView:(id)a4 animated:(BOOL)a5;
- (void)_preserveInputViewsAnimated:(BOOL)a3;
- (void)_restoreInputViewsAnimated:(BOOL)a3;
- (void)setHasDismissCompletionHandler:(BOOL)a3;
- (void)setHasPreservedKeyboardInputViews:(BOOL)a3;
- (void)setPresentationPreparationBlock:(id)a3;
- (void)setRotationDecider:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIFallbackPresentationViewController

- (void)viewDidLoad
{
  v3 = [(UIViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  v5.receiver = self;
  v5.super_class = (Class)_UIFallbackPresentationViewController;
  [(UIViewController *)&v5 viewDidLoad];
}

- (void)_presentViewController:(id)a3 sendingView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = VisibleViewController(v8);
  int v11 = UIKeyboardAutomaticIsOnScreen();
  if (objc_opt_respondsToSelector()) {
    [v10 setEnableRotation:1];
  }
  v12 = [v9 window];
  v13 = [v12 windowScene];

  v14 = [(UIApplicationRotationFollowingWindow *)[_UIFallbackPresentationWindow alloc] initWithWindowScene:v13];
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v14;

  v16 = +[UIWindow _applicationKeyWindow];
  [v16 windowLevel];
  double v18 = v17 + 1.0;

  double v19 = 100.0;
  if (v18 >= 100.0) {
    double v19 = v18;
  }
  [(UIWindow *)self->_presentationWindow setWindowLevel:v19];
  v20 = [(UIViewController *)self view];
  [(UIView *)self->_presentationWindow bounds];
  objc_msgSend(v20, "setFrame:");
  v21 = +[UIColor clearColor];
  [v20 setBackgroundColor:v21];

  [(UIWindow *)self->_presentationWindow setRootViewController:self];
  [(UIView *)self->_presentationWindow addSubview:v20];
  [(UIWindow *)self->_presentationWindow makeKeyAndVisible];
  if (objc_opt_respondsToSelector())
  {
    v22 = [v10 dismissCompletionHandler];
  }
  else
  {
    v22 = 0;
  }
  [(_UIFallbackPresentationViewController *)self setHasDismissCompletionHandler:objc_opt_respondsToSelector() & 1];
  if ([(_UIFallbackPresentationViewController *)self hasDismissCompletionHandler])
  {
    v25 = v13;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__56;
    v33[4] = __Block_byref_object_dispose__56;
    v34 = self;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __85___UIFallbackPresentationViewController__presentViewController_sendingView_animated___block_invoke;
    v29 = &unk_1E52E9490;
    v30 = v34;
    v32 = v33;
    id v31 = v22;
    [v10 setDismissCompletionHandler:&v26];

    _Block_object_dispose(v33, 8);
  }
  if (v11)
  {
    [(_UIFallbackPresentationViewController *)self _preserveInputViewsAnimated:v5];
    v23 = [(UIWindow *)self->_presentationWindow windowScene];
    v24 = [v23 keyboardSceneDelegate];
    [v24 forceOrderOutAutomaticExceptAccessoryView];
  }
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, v5, 0, v25, v26, v27, v28, v29, v30);
}

- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (![(_UIFallbackPresentationViewController *)self hasDismissCompletionHandler]) {
    [(_UIFallbackPresentationViewController *)self _restoreInputViewsAnimated:1];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94___UIFallbackPresentationViewController__dismissViewControllerWithTransition_from_completion___block_invoke;
  v13[3] = &unk_1E52DA160;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)_UIFallbackPresentationViewController;
  id v10 = v9;
  id v11 = v8;
  [(UIViewController *)&v12 _dismissViewControllerWithTransition:v6 from:v11 completion:v13];
}

- (void)_preserveInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIFallbackPresentationViewController *)self setHasPreservedKeyboardInputViews:1];
  id v7 = [(UIWindow *)self->_presentationWindow windowScene];
  BOOL v5 = [v7 keyboardSceneDelegate];
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v5 _preserveInputViewsWithId:v6 animated:v3];
}

- (void)_restoreInputViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIFallbackPresentationViewController *)self hasPreservedKeyboardInputViews])
  {
    id v7 = [(UIWindow *)self->_presentationWindow windowScene];
    BOOL v5 = [v7 keyboardSceneDelegate];
    uint64_t v6 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v5 _restoreInputViewsWithId:v6 animated:v3];
  }
}

- (void)_preparePresentationControllerForPresenting:(id)a3
{
  id v4 = a3;
  presentationPreparationBlock = (uint64_t (**)(void))self->_presentationPreparationBlock;
  if (presentationPreparationBlock)
  {
    id v8 = v4;
    int v6 = presentationPreparationBlock[2]();
    id v4 = v8;
    if (v6)
    {
      id v7 = self->_presentationPreparationBlock;
      self->_presentationPreparationBlock = 0;

      id v4 = v8;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIWindow)rotationDecider
{
  return self->_rotationDecider;
}

- (void)setRotationDecider:(id)a3
{
}

- (id)presentationPreparationBlock
{
  return self->_presentationPreparationBlock;
}

- (void)setPresentationPreparationBlock:(id)a3
{
}

- (BOOL)hasPreservedKeyboardInputViews
{
  return self->_hasPreservedKeyboardInputViews;
}

- (void)setHasPreservedKeyboardInputViews:(BOOL)a3
{
  self->_hasPreservedKeyboardInputViews = a3;
}

- (BOOL)hasDismissCompletionHandler
{
  return self->_hasDismissCompletionHandler;
}

- (void)setHasDismissCompletionHandler:(BOOL)a3
{
  self->_hasDismissCompletionHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationPreparationBlock, 0);
  objc_storeStrong((id *)&self->_rotationDecider, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

@end