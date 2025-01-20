@interface UICompatibilityInputViewController
+ (BOOL)_requiresProxyInterface;
+ (id)deferredInputModeControllerWithKeyboard:(id)a3;
+ (id)inputSnapshotViewForInputMode:(id)a3 orientation:(int64_t)a4;
+ (id)inputViewControllerWithView:(id)a3;
+ (void)applicationDidReceiveMemoryWarning:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (NSArray)internalEdgeMatchConstraints;
- (UILayoutGuide)focusSafeAreaLayoutGuide;
- (UITextCursorAssertion)blinkAssertion;
- (UIViewController)inputController;
- (id)_compatView;
- (id)_compatibilityController;
- (id)_initAsDeferredController;
- (id)_keyboard;
- (id)_keyboardForThisViewController;
- (id)_systemViewControllerForInputMode:(id)a3;
- (id)childCompatibilityController;
- (id)preferredFocusedView;
- (void)_tvUpdateAppearanceForUserInterfaceStyle;
- (void)addSnapshotViewForInputMode:(id)a3;
- (void)assertCurrentInputModeIfNecessary;
- (void)dealloc;
- (void)didFinishTranslation;
- (void)didMoveToParentViewController:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)didSuspend:(id)a3;
- (void)finishSplitTransition:(BOOL)a3;
- (void)generateCompatibleSizeConstraintsIfNecessary;
- (void)isHosted:(id)a3;
- (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4;
- (void)killIncomingExtension;
- (void)loadView;
- (void)rebuildChildConstraints;
- (void)removeSnapshotView;
- (void)resetInputMode;
- (void)resetInputModeInMainThread;
- (void)setBlinkAssertion:(id)a3;
- (void)setDeferredSystemView:(id)a3;
- (void)setInputController:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setInternalEdgeMatchConstraints:(id)a3;
- (void)setTearingDownInputController;
- (void)shouldUpdateInputMode:(id)a3;
- (void)takeSnapshotView;
- (void)tearDownInputController;
- (void)validateInputModeIsDisplayed;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willBeginTranslation;
- (void)willResume:(id)a3;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation UICompatibilityInputViewController

+ (id)inputViewControllerWithView:(id)a3
{
  id v3 = a3;
  v4 = +[UIViewController viewControllerForView:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    goto LABEL_13;
  }
  v6 = [v3 superview];
  v7 = +[UIViewController viewControllerForView:v6];

  if (!v7) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [v3 superview];
    +[UIViewController removeViewControllerForView:v8];

LABEL_7:
    v9 = [(UIInputViewController *)[UICompatibilityInputViewController alloc] initWithNibName:0 bundle:0];
    v5 = v9;
    if (v4)
    {
      [v3 _convertToAutolayoutSizingIfNecessary];
      [(UIViewController *)v5 addChildViewController:v4];
      v10 = [(UIViewController *)v5 view];
      [v10 addSubview:v3];

      [v4 didMoveToParentViewController:v5];
      [(UICompatibilityInputViewController *)v5 rebuildChildConstraints];
    }
    else
    {
      [(UIInputViewController *)v9 setView:v3];
    }
    v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    if (strcmp(Name, "CKMessageEntryView")) {
      [(UICompatibilityInputViewController *)v5 generateCompatibleSizeConstraintsIfNecessary];
    }
    goto LABEL_12;
  }
  v5 = v7;
LABEL_12:

LABEL_13:
  return v5;
}

+ (id)deferredInputModeControllerWithKeyboard:(id)a3
{
  id v4 = a3;
  if (qword_1EB25B2C0 != -1) {
    dispatch_once(&qword_1EB25B2C0, &__block_literal_global_315);
  }
  v5 = (void *)qword_1EB25B2B8;
  if (*(id *)(qword_1EB25B2B8 + 1024) != v4)
  {
    [(id)qword_1EB25B2B8 tearDownInputController];
    objc_storeStrong((id *)(qword_1EB25B2B8 + 1024), a3);
    v5 = (void *)qword_1EB25B2B8;
  }
  id v6 = v5;

  return v6;
}

void __78__UICompatibilityInputViewController_deferredInputModeControllerWithKeyboard___block_invoke()
{
  id v0 = [[UICompatibilityInputViewController alloc] _initAsDeferredController];
  v1 = (void *)qword_1EB25B2B8;
  qword_1EB25B2B8 = (uint64_t)v0;
}

- (void)setDeferredSystemView:(id)a3
{
  v5 = (UIKeyboard *)a3;
  if (self->_deferredSystemView != v5)
  {
    id v6 = v5;
    [(UICompatibilityInputViewController *)self tearDownInputController];
    objc_storeStrong((id *)&self->_deferredSystemView, a3);
    v5 = v6;
  }
}

- (id)_initAsDeferredController
{
  v7.receiver = self;
  v7.super_class = (Class)UICompatibilityInputViewController;
  v2 = [(UIViewController *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v3 addObserver:v2 selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v3 addObserver:v2 selector:sel_isHosted_ name:@"UITextEffectsWindowIsHostedNotification" object:0];
    [v3 addObserver:v2 selector:sel_shouldUpdateInputMode_ name:@"UICompatibilityInputViewControllerShouldUpdateNotification" object:0];
    if ([(id)UIApp isSuspended])
    {
      id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v5 = [v4 containerWindow];
      v2->_shouldSuppressRemoteInputController = [v5 _isHostedInAnotherProcess] ^ 1;
    }
    else
    {
      v2->_shouldSuppressRemoteInputController = 0;
    }
  }
  return v2;
}

- (void)loadView
{
  id v3 = [_UIKBCompatInputView alloc];
  id v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIInputViewController *)self setView:v4];

  id v5 = [(UIViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v6[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationDidEnterBackgroundNotification";
  v6[1] = @"UIApplicationWillEnterForegroundNotification";
  v6[2] = @"UITextEffectsWindowIsHostedNotification";
  v6[3] = @"UICompatibilityInputViewControllerShouldUpdateNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UICompatibilityInputViewController *)self tearDownInputController];
  v5.receiver = self;
  v5.super_class = (Class)UICompatibilityInputViewController;
  [(UIInputViewController *)&v5 dealloc];
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (id)_compatibilityController
{
  id v3 = [(UIViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_super v5 = self;
  }
  else {
    objc_super v5 = 0;
  }
  return v5;
}

- (id)_compatView
{
  id v3 = [(UIViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = [(UIViewController *)self view];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

- (void)killIncomingExtension
{
  id v3 = [(UIKeyboardInputMode *)self->_incomingExtensionInputMode extension];
  [v3 _kill:3];

  incomingExtensionInputMode = self->_incomingExtensionInputMode;
  self->_incomingExtensionInputMode = 0;
}

- (void)didSuspend:(id)a3
{
  [(UICompatibilityInputViewController *)self didMoveToParentViewController:0];
  self->_shouldSuppressRemoteInputController = 1;
  self->_lastSuspendedTime = CFAbsoluteTimeGetCurrent();
  if (self->_incomingExtensionInputMode && CFAbsoluteTimeGetCurrent() - self->_incomingExtensionInputModeTime > 0.5)
  {
    [(UICompatibilityInputViewController *)self killIncomingExtension];
    id v6 = +[UIKeyboardImpl activeInstance];
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    objc_super v5 = [v4 currentSystemInputMode];
    [v6 setKeyboardInputMode:v5 userInitiated:1];
  }
}

- (void)isHosted:(id)a3
{
  if (self->_shouldSuppressRemoteInputController) {
    [(UICompatibilityInputViewController *)self willResume:a3];
  }
}

- (void)willResume:(id)a3
{
  self->_shouldSuppressRemoteInputController = 0;
  self->_currentResumeTime = CFAbsoluteTimeGetCurrent();
  id v4 = +[UIKeyboardImpl activeInstance];
  if (v4
    && (v9 = v4, v5 = [(UIKeyboardInputMode *)self->_inputMode isExtensionInputMode], id v4 = v9, v5))
  {
    id v6 = [(UICompatibilityInputViewController *)self inputController];
    if (v6)
    {
    }
    else
    {
      incomingExtensionInputMode = self->_incomingExtensionInputMode;

      if (!incomingExtensionInputMode)
      {
        inputMode = self->_inputMode;
        [(UICompatibilityInputViewController *)self setInputMode:inputMode];
      }
    }
  }
  else
  {
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    id v4 = [(UICompatibilityInputViewController *)self inputController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(UICompatibilityInputViewController *)self tearDownInputController];
    }
  }
}

- (void)generateCompatibleSizeConstraintsIfNecessary
{
  id v3 = [(UIViewController *)self view];
  if ([v3 translatesAutoresizingMaskIntoConstraints])
  {
    id v4 = [(UIViewController *)self view];
    unint64_t v5 = ((unint64_t)[v4 autoresizingMask] >> 4) & 1;
  }
  else
  {
    LODWORD(v5) = 1;
  }

  id v6 = [(UIViewController *)self view];
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;

  v11 = [(UICompatibilityInputViewController *)self _keyboard];
  if (v11)
  {

LABEL_9:
    v13 = [(UIViewController *)self view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    goto LABEL_10;
  }
  BOOL v12 = v8 != -1.0;
  if (v10 != -1.0) {
    BOOL v12 = 1;
  }
  if (v12 & v5) {
    goto LABEL_9;
  }
LABEL_10:
  id v14 = [(UIViewController *)self view];
  [v14 _convertToAutolayoutSizingIfNecessary];
}

- (void)rebuildChildConstraints
{
  id v3 = [(UICompatibilityInputViewController *)self internalEdgeMatchConstraints];

  if (v3)
  {
    id v4 = [(UIViewController *)self view];
    unint64_t v5 = [(UICompatibilityInputViewController *)self internalEdgeMatchConstraints];
    [v4 removeConstraints:v5];

    [(UICompatibilityInputViewController *)self setInternalEdgeMatchConstraints:0];
  }
  id v6 = [(UICompatibilityInputViewController *)self inputController];
  id v30 = [v6 view];

  if (!v30)
  {
    double v7 = [(UICompatibilityInputViewController *)self _compatView];
    id v30 = [v7 touchableView];
  }
  double v8 = [(UIViewController *)self view];
  int v9 = [v30 isDescendantOfView:v8];

  if (v9)
  {
    double v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = (void *)MEMORY[0x1E4F5B268];
    BOOL v12 = [(UIViewController *)self view];
    v13 = [v11 constraintWithItem:v12 attribute:1 relatedBy:0 toItem:v30 attribute:1 multiplier:1.0 constant:0.0];
    [v10 addObject:v13];

    id v14 = (void *)MEMORY[0x1E4F5B268];
    v15 = [(UIViewController *)self view];
    v16 = [v14 constraintWithItem:v15 attribute:2 relatedBy:0 toItem:v30 attribute:2 multiplier:1.0 constant:0.0];
    [v10 addObject:v16];

    v17 = (void *)MEMORY[0x1E4F5B268];
    v18 = [(UIViewController *)self view];
    v19 = [v17 constraintWithItem:v18 attribute:3 relatedBy:0 toItem:v30 attribute:3 multiplier:1.0 constant:0.0];
    [v10 addObject:v19];

    v20 = (void *)MEMORY[0x1E4F5B268];
    v21 = [(UIViewController *)self view];
    v22 = [v20 constraintWithItem:v21 attribute:4 relatedBy:0 toItem:v30 attribute:4 multiplier:1.0 constant:0.0];
    [v10 addObject:v22];

    v23 = [(UICompatibilityInputViewController *)self inputController];
    v24 = [v23 view];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = [(UIViewController *)self view];
    [v25 addConstraints:v10];

    [(UICompatibilityInputViewController *)self setInternalEdgeMatchConstraints:v10];
  }
  v26 = [(UIViewController *)self view];
  [v26 invalidateIntrinsicContentSize];

  v27 = [(UIViewController *)self view];
  [v27 setNeedsLayout];

  v28 = [(UIViewController *)self view];
  v29 = [v28 _rootInputWindowController];
  [v29 updateViewSizingConstraints];
}

+ (void)applicationDidReceiveMemoryWarning:(id)a3
{
}

+ (id)inputSnapshotViewForInputMode:(id)a3 orientation:(int64_t)a4
{
  unint64_t v5 = (void *)__snapshotViews;
  id v6 = [a3 identifier];
  double v7 = objc_msgSend(v6, "stringByAppendingFormat:", @"%d", (unint64_t)(a4 - 3) < 2);
  double v8 = [v5 objectForKey:v7];

  return v8;
}

- (void)takeSnapshotView
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UICompatibilityInputViewController_takeSnapshotView__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __54__UICompatibilityInputViewController_takeSnapshotView__block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 1016) isExtensionInputMode]) {
    return;
  }
  id v17 = [*(id *)(a1 + 32) view];
  uint64_t v2 = [v17 window];
  if (v2)
  {
    dispatch_time_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) view];
    [v4 size];
    double v6 = v5;

    if (v6 <= 0.0) {
      return;
    }
    if (!__snapshotViews)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      double v8 = (void *)__snapshotViews;
      __snapshotViews = (uint64_t)v7;
    }
    int v9 = [*(id *)(a1 + 32) view];
    double v10 = [v9 _rootInputWindowController];
    v11 = [*(id *)(a1 + 32) view];
    id v17 = [v10 inputViewSnapshotOfView:v11 afterScreenUpdates:0];

    BOOL v12 = v17;
    if (!v17) {
      goto LABEL_10;
    }
    [v17 size];
    if (v13 > 0.0)
    {
      id v14 = (void *)__snapshotViews;
      v15 = [*(id *)(*(void *)(a1 + 32) + 1016) identifier];
      v16 = objc_msgSend(v15, "stringByAppendingFormat:", @"%d", (unint64_t)(+[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation")- 3) < 2);
      [v14 setObject:v17 forKey:v16];
    }
  }
  BOOL v12 = v17;
LABEL_10:
}

- (void)addSnapshotViewForInputMode:(id)a3
{
  id v19 = a3;
  id v4 = [(UICompatibilityInputViewController *)self _compatibilityController];
  double v5 = [v4 _compatView];

  if (v5)
  {
    double v6 = [(UICompatibilityInputViewController *)self _compatibilityController];
    id v7 = [v6 _compatView];
    double v8 = [v7 snapshotView];

    if (!v8)
    {
      int v9 = objc_msgSend((id)objc_opt_class(), "inputSnapshotViewForInputMode:orientation:", v19, +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
      if (!v9)
      {
        double v10 = +[UIKeyboardImpl activeInstance];
        v11 = [v10 _layout];
        BOOL v12 = [(UIViewController *)self view];
        [v11 updateGlobeKeyAndLayoutOriginBeforeSnapshotForInputView:v12];

        double v13 = [(UIViewController *)self view];
        id v14 = [v13 _rootInputWindowController];
        v15 = [(UIViewController *)self view];
        int v9 = [v14 inputViewSnapshotOfView:v15 afterScreenUpdates:1];
      }
      v16 = [(UIViewController *)self view];
      [v16 addSubview:v9];

      id v17 = [(UICompatibilityInputViewController *)self _compatibilityController];
      v18 = [v17 _compatView];
      [v18 setSnapshotView:v9];
    }
  }
}

- (void)removeSnapshotView
{
  dispatch_time_t v3 = [(UICompatibilityInputViewController *)self _compatibilityController];
  id v4 = [v3 _compatView];
  double v5 = [v4 snapshotView];

  if (v5)
  {
    double v6 = [(UICompatibilityInputViewController *)self _compatibilityController];
    id v7 = [v6 _compatView];
    double v8 = [v7 snapshotView];
    [v8 removeFromSuperview];

    id v10 = [(UICompatibilityInputViewController *)self _compatibilityController];
    int v9 = [v10 _compatView];
    [v9 setSnapshotView:0];
  }
}

- (void)tearDownInputController
{
  [(UIKeyboardInputMode *)self->_inputMode setIsDisplayed:0];
  if ([(UIKeyboardInputMode *)self->_inputMode isExtensionInputMode])
  {
    dispatch_time_t v3 = [(UIKeyboardInputMode *)self->_inputMode extension];
    [v3 setRequestInterruptionBlock:0];
  }
  id v4 = [(UICompatibilityInputViewController *)self inputController];

  if (v4)
  {
    double v5 = [(UIInputViewController *)self _proxyInterface];
    double v6 = [v5 forwardingInterface];
    [v6 _tearDownRemoteService];

    id v7 = [(UIInputViewController *)self _proxyInterface];
    [v7 setForwardingInterface:0];

    double v8 = [(UICompatibilityInputViewController *)self _compatView];
    [v8 setTouchableView:0];

    int v9 = [(UICompatibilityInputViewController *)self inputController];
    id v10 = [v9 view];
    [v10 removeFromSuperview];

    v11 = [(UICompatibilityInputViewController *)self inputController];
    [v11 removeFromParentViewController];

    [(UICompatibilityInputViewController *)self setInputController:0];
  }
  self->_tearingDownInputController = 0;
}

- (void)shouldUpdateInputMode:(id)a3
{
  id v13 = a3;
  id v4 = [v13 userInfo];
  double v5 = [v4 objectForKey:@"UICompatibilityInputViewControllerScreenKey"];

  if (v5)
  {
    double v6 = [(UIResponder *)self _responderWindow];
    uint64_t v7 = [v6 screen];
    if (v7)
    {
      double v8 = (void *)v7;
      int v9 = [(UIResponder *)self _responderWindow];
      id v10 = [v9 screen];

      if (v5 != v10) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v11 = [v13 userInfo];
  BOOL v12 = [v11 objectForKey:@"UICompatibilityInputViewControllerInputModeKey"];

  if (v12) {
    [(UICompatibilityInputViewController *)self setInputMode:v12];
  }

LABEL_9:
}

- (id)_systemViewControllerForInputMode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (double v5 = (objc_class *)[v4 viewControllerClass]) != 0)
  {
    id v6 = objc_alloc_init(v5);
    uint64_t v7 = [(UIViewController *)self view];
    double v8 = [v7 _inheritedRenderConfig];
    if ([v8 lightKeyboard]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }

    id v10 = [v6 traitOverrides];
    [v10 setUserInterfaceStyle:v9];
  }
  else
  {
    id v6 = +[UICompatibilityInputViewController inputViewControllerWithView:self->_deferredSystemView];
  }

  return v6;
}

- (void)resetInputModeInMainThread
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_resetInputModeTime >= 0.3 && !self->_shouldSuppressRemoteInputController)
  {
    id v4 = [(UIKeyboardInputMode *)self->_inputMode identifier];
    objc_initWeak(&location, v4);

    double v5 = +[UIKeyboardInputModeController sharedInputModeController];
    [v5 switchToCurrentSystemInputMode];

    if ([(UIKeyboardInputMode *)self->_inputMode isExtensionInputMode])
    {
      id v6 = (void *)_MergedGlobals_13;
      id v7 = objc_loadWeakRetained(&location);
      double v8 = [v6 objectForKey:v7];

      if (v8)
      {
        if (Current - self->_resetInputModeTime > 3.0)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __64__UICompatibilityInputViewController_resetInputModeInMainThread__block_invoke;
          v15[3] = &unk_1E52DF5A0;
          objc_copyWeak(v16, &location);
          v15[4] = self;
          v16[1] = *(id *)&Current;
          dispatch_async(MEMORY[0x1E4F14428], v15);
          objc_destroyWeak(v16);
        }
      }
      else
      {
        uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
        [v9 _inputModeChangedWhileContextTracked];

        id v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
        v11 = [v10 preferencesActions];
        BOOL v12 = +[UIKeyboardInputModeController sharedInputModeController];
        id v13 = [v12 currentInputMode];
        id v14 = [v13 identifier];
        [v11 setLanguageAwareInputModeLastUsed:v14];
      }
    }
    objc_destroyWeak(&location);
  }
}

void __64__UICompatibilityInputViewController_resetInputModeInMainThread__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  [v2 setInputMode:WeakRetained];

  *(void *)(*(void *)(a1 + 32) + 1072) = *(void *)(a1 + 48);
}

- (void)resetInputMode
{
  +[_UIKeyboardUsageTracking keyboardExtensionCrashed];
  dispatch_time_t v3 = [(UIKeyboardInputMode *)self->_inputMode extension];
  [v3 setRequestInterruptionBlock:0];

  if (pthread_main_np() == 1)
  {
    [(UICompatibilityInputViewController *)self resetInputModeInMainThread];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__UICompatibilityInputViewController_resetInputMode__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__UICompatibilityInputViewController_resetInputMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetInputModeInMainThread];
}

- (void)assertCurrentInputModeIfNecessary
{
  inputMode = self->_inputMode;
  if (inputMode && ![(UIKeyboardInputMode *)inputMode isDisplayed])
  {
    double v5 = self->_inputMode;
    [(UICompatibilityInputViewController *)self setInputMode:v5];
  }
  else
  {
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v6 = [v4 currentInputMode];

    if (([v6 isDisplayed] & 1) == 0) {
      [(UICompatibilityInputViewController *)self setInputMode:v6];
    }
  }
}

- (void)validateInputModeIsDisplayed
{
  inputMode = self->_inputMode;
  if (inputMode && ![(UIKeyboardInputMode *)inputMode isDisplayed])
  {
    id v4 = self->_inputMode;
    [(UICompatibilityInputViewController *)self setInputMode:v4];
  }
}

- (void)setTearingDownInputController
{
  self->_tearingDownInputController = 1;
}

- (void)setInputMode:(id)a3
{
  double v5 = (UIKeyboardInputMode *)a3;
  if (qword_1EB25B2C8 != -1) {
    dispatch_once(&qword_1EB25B2C8, &__block_literal_global_258);
  }
  if ([(UIKeyboardInputMode *)v5 isExtensionInputMode])
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    if ([v6 _shouldSuppressSoftwareKeyboard])
    {
      BOOL v7 = +[UIKeyboardImpl isFloatingForced];

      if (!v7) {
        goto LABEL_76;
      }
    }
    else
    {
    }
  }
  p_inputMode = &self->_inputMode;
  if ([(UIKeyboardInputMode *)self->_inputMode isExtensionInputMode]
    || [(UIKeyboardInputMode *)v5 isExtensionInputMode])
  {
    int v9 = 0;
  }
  else
  {
    id v10 = [(UIKeyboardInputMode *)*p_inputMode normalizedIdentifier];
    if (UIKeyboardInputModeUsesKBStar(v10))
    {
      v11 = [(UIKeyboardInputMode *)v5 normalizedIdentifier];
      int v9 = UIKeyboardInputModeUsesKBStar(v11);
    }
    else
    {
      int v9 = 0;
    }
  }
  if (![(UIKeyboardInputMode *)*p_inputMode isEqual:v5] && !v9) {
    goto LABEL_17;
  }
  v15 = [(UICompatibilityInputViewController *)self inputController];
  v16 = [v15 view];
  id v17 = [v16 superview];
  v18 = [(UIViewController *)self view];
  if (v17 == v18)
  {
  }
  else
  {
    incomingExtensionInputMode = self->_incomingExtensionInputMode;

    if (!incomingExtensionInputMode) {
      goto LABEL_17;
    }
  }
  v44 = +[UIDevice currentDevice];
  if ([v44 _predictionGraphicsQuality] == 100) {
    double v45 = 3.0;
  }
  else {
    double v45 = 5.0;
  }

  if ([(UIKeyboardInputMode *)v5 isExtensionInputMode]
    && self->_incomingExtensionInputMode
    && (CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent(),
        double incomingExtensionInputModeTime = self->_incomingExtensionInputModeTime,
        Current - incomingExtensionInputModeTime > v45)
    && vabdd_f64(self->_lastSuspendedTime, incomingExtensionInputModeTime) > v45)
  {
    [(UICompatibilityInputViewController *)self killIncomingExtension];
    [(UICompatibilityInputViewController *)self resetInputMode];
  }
  else if (!self->_incomingExtensionInputMode)
  {
    if (!self->_tearingDownInputController) {
      goto LABEL_60;
    }
    if (![(UIKeyboardInputMode *)*p_inputMode isExtensionInputMode])
    {
      v48 = [(UICompatibilityInputViewController *)self inputController];
      v49 = [v48 view];
      v50 = [(UICompatibilityInputViewController *)self _keyboard];

      if (v49 == v50)
      {
LABEL_60:
        [(UIKeyboardInputMode *)*p_inputMode setIsDisplayed:0];
        objc_storeStrong((id *)&self->_inputMode, a3);
LABEL_75:
        [(UIKeyboardInputMode *)*p_inputMode setIsDisplayed:1];
        goto LABEL_76;
      }
    }
    [(UICompatibilityInputViewController *)self tearDownInputController];
LABEL_17:
    BOOL v12 = [(UIViewController *)self view];
    id v13 = [v12 _rootInputWindowController];
    [v13 registerPowerLogEvent:1];

    if ([(UIKeyboardInputMode *)*p_inputMode isExtensionInputMode]
      && self->_shouldSuppressRemoteInputController)
    {
      id v14 = *p_inputMode;
    }
    else
    {
      BOOL v20 = [(UIKeyboardInputMode *)v5 isExtensionInputMode];
      id v14 = v5;
      if (!v20)
      {
LABEL_25:
        [(UICompatibilityInputViewController *)self tearDownInputController];
        objc_storeStrong((id *)&self->_inputMode, a3);
        if ([(UIKeyboardInputMode *)v5 isExtensionInputMode]
          && !self->_shouldSuppressRemoteInputController
          && !+[UIKeyboard usesInputSystemUI])
        {
          objc_storeStrong((id *)&self->_incomingExtensionInputMode, a3);
          self->_double incomingExtensionInputModeTime = CFAbsoluteTimeGetCurrent();
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_2;
          v78[3] = &unk_1E52F3BE0;
          v78[4] = self;
          v58 = [(UIKeyboardInputMode *)v5 extension];
          [v58 setRequestInterruptionBlock:v78];

          v59 = [(UIKeyboardInputMode *)v5 extension];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_4;
          v76[3] = &unk_1E52F3C08;
          v76[4] = self;
          v77 = v5;
          [v59 instantiateViewControllerWithInputItems:MEMORY[0x1E4F1CBF0] connectionHandler:v76];

          v60 = (void *)_MergedGlobals_13;
          v61 = [(UIKeyboardInputMode *)self->_incomingExtensionInputMode identifier];
          v62 = [v60 objectForKey:v61];

          double v63 = 3.0;
          if (self->_lastSuspendedTime <= self->_currentResumeTime)
          {
            if (CFAbsoluteTimeGetCurrent() - self->_currentResumeTime >= 1.0) {
              double v63 = 0.5;
            }
            else {
              double v63 = 3.0;
            }
          }
          if (v62)
          {
            [v62 floatValue];
            int64_t v65 = (uint64_t)((v63 + (float)(v64 + v64)) * 1000000000.0);
          }
          else
          {
            int64_t v65 = 5000000000;
          }
          dispatch_time_t v67 = dispatch_time(0, v65);
          self->_latestDelayTime = v67;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_6;
          block[3] = &unk_1E52D9CD0;
          block[4] = self;
          void block[5] = v67;
          dispatch_after(v67, MEMORY[0x1E4F14428], block);

          goto LABEL_75;
        }
        v21 = [(UIKeyboardInputMode *)v5 identifier];
        if ([v21 isEqualToString:@"autofillsignup"])
        {
          if (!self->_incomingExtensionInputMode)
          {

LABEL_54:
            v51 = +[UIKeyboardImpl activeInstance];
            v37 = [v51 _autofillContext];

            v52 = [v37 objectForKey:@"_automaticPasswordKeyboard"];

            if (!v52)
            {

              v37 = 0;
            }
            v53 = +[UIKeyboardImpl activeInstance];
            v54 = [v53 _passwordRules];

            if (get_SFAutomaticPasswordInputViewControllerClass()
              && ![(UIKeyboardInputMode *)*p_inputMode isDisplayed])
            {
              dispatch_semaphore_t v55 = dispatch_semaphore_create(0);
              uint64_t v68 = MEMORY[0x1E4F143A8];
              uint64_t v69 = 3221225472;
              v70 = __51__UICompatibilityInputViewController_setInputMode___block_invoke_7;
              v71 = &unk_1E52F3C30;
              v72 = self;
              v73 = v5;
              v56 = v55;
              v74 = v56;
              v57 = _Block_copy(&v68);
              if (+[UIKeyboard isKeyboardProcess])
              {
                objc_storeStrong((id *)&self->_incomingExtensionInputMode, *p_inputMode);
              }
              else
              {
                get_SFAutomaticPasswordInputViewControllerClass();
                if (objc_opt_respondsToSelector())
                {
                  objc_storeStrong((id *)&self->_incomingExtensionInputMode, *p_inputMode);
                  [get_SFAutomaticPasswordInputViewControllerClass() inputViewControllerWithAutoFillContext:v37 passwordRules:v54 completion:v57];
                  dispatch_time_t v66 = dispatch_time(0, 500000000);
                  dispatch_semaphore_wait(v56, v66);
                }
                else
                {
                  [(UICompatibilityInputViewController *)self resetInputMode];
                }
              }
            }
LABEL_74:

            goto LABEL_75;
          }
          BOOL v22 = +[UIKeyboard isKeyboardProcess];

          if (v22) {
            goto LABEL_54;
          }
        }
        else
        {
        }
        if ([(UIKeyboardInputMode *)v5 isExtensionInputMode]) {
          goto LABEL_75;
        }
        if (!self->_deferredSystemView) {
          goto LABEL_75;
        }
        v23 = [(UIKeyboardInputMode *)v5 identifier];
        char v24 = [v23 isEqualToString:@"autofillsignup"];

        if (v24) {
          goto LABEL_75;
        }
        [(UICompatibilityInputViewController *)self removeSnapshotView];
        v25 = [(UICompatibilityInputViewController *)self _systemViewControllerForInputMode:v5];
        [(UICompatibilityInputViewController *)self setInputController:v25];

        v26 = [(UIInputViewController *)self _proxyInterface];
        [v26 setForwardingInterface:0];

        v27 = [(UICompatibilityInputViewController *)self inputController];
        [(UIViewController *)self addChildViewController:v27];

        v28 = [(UIViewController *)self view];
        v29 = [(UICompatibilityInputViewController *)self inputController];
        id v30 = [v29 view];
        [v28 addSubview:v30];

        v31 = [(UICompatibilityInputViewController *)self _compatView];
        v32 = [(UICompatibilityInputViewController *)self inputController];
        v33 = [v32 view];
        [v31 setTouchableView:v33];

        v34 = [(UICompatibilityInputViewController *)self inputController];
        [v34 didMoveToParentViewController:self];

        [(UICompatibilityInputViewController *)self rebuildChildConstraints];
        if (![(UIKeyboard *)self->_deferredSystemView isActive]) {
          [(UIKeyboard *)self->_deferredSystemView activate];
        }
        v35 = [(UICompatibilityInputViewController *)self inputController];
        v36 = [v35 view];
        [v36 size];
        v37 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");

        [v37 setSplitWidthsChanged:1];
        [v37 setUpdateAssistantView:1];
        v38 = [(UIViewController *)self view];
        v39 = [v38 superview];
        [v39 _didChangeKeyplaneWithContext:v37];

        v40 = [(UICompatibilityInputViewController *)self inputController];
        v41 = [v40 view];
        v42 = [(UIViewController *)self view];
        v43 = [v42 _inheritedRenderConfig];
        [v41 _setRenderConfig:v43];

        +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
        goto LABEL_74;
      }
    }
    [(UICompatibilityInputViewController *)self addSnapshotViewForInputMode:v14];
    goto LABEL_25;
  }
LABEL_76:
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = (uint64_t)v0;
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_3;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__UICompatibilityInputViewController_setInputMode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetInputMode];
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 1032) == *(void *)(v10 + 1016) && !*(unsigned char *)(v10 + 1065))
  {
    if (v8)
    {
      [(id)v10 removeSnapshotView];
      [*(id *)(a1 + 32) setInputController:v8];
      v15 = *(void **)(a1 + 32);
      v16 = objc_alloc_init(_UITextDocumentInterface);
      [v15 _setTextDocumentProxy:v16];

      id v17 = [*(id *)(a1 + 40) extension];
      v18 = [v17 _extensionContextForUUID:v7];

      id v19 = [*(id *)(a1 + 32) _proxyInterface];
      [v19 setForwardingInterface:v18];

      BOOL v20 = *(void **)(a1 + 32);
      v21 = [v20 inputController];
      [v20 addChildViewController:v21];

      BOOL v22 = [*(id *)(a1 + 32) view];
      v23 = [*(id *)(a1 + 32) inputController];
      char v24 = [v23 view];
      [v22 addSubview:v24];

      v25 = [*(id *)(a1 + 32) _compatView];
      v26 = [*(id *)(a1 + 32) inputController];
      v27 = [v26 view];
      [v25 setTouchableView:v27];

      v28 = [*(id *)(a1 + 32) inputController];
      [v28 didMoveToParentViewController:*(void *)(a1 + 32)];

      [*(id *)(a1 + 32) rebuildChildConstraints];
      v29 = [*(id *)(a1 + 32) inputController];
      id v30 = [v29 view];
      [v30 size];
      v31 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");

      [v31 setSplitWidthsChanged:1];
      [v31 setUpdateAssistantView:1];
      v32 = [*(id *)(a1 + 32) view];
      v33 = [v32 superview];
      [v33 _didChangeKeyplaneWithContext:v31];

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v35 = *(void *)(a1 + 32);
      double v36 = Current - *(double *)(v35 + 1040);
      v37 = (void *)_MergedGlobals_13;
      v38 = [*(id *)(v35 + 1032) identifier];
      v39 = [v37 objectForKey:v38];
      [v39 floatValue];
      float v41 = v40;
      double v42 = v40;

      if (v41 == 0.0 || vabdd_f64(v36, v42) > 0.2)
      {
        double v43 = (v36 + v42) * 0.5;
        if (v41 <= 0.0) {
          double v43 = v36;
        }
        v44 = (void *)_MergedGlobals_13;
        *(float *)&double v43 = v43;
        double v45 = [NSNumber numberWithFloat:v43];
        v46 = [*(id *)(*(void *)(a1 + 32) + 1032) identifier];
        [v44 setObject:v45 forKey:v46];
      }
      [*(id *)(a1 + 32) takeSnapshotView];
      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
    }
    else if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__UICompatibilityInputViewController_setInputMode___block_invoke_5;
      block[3] = &unk_1E52D9F70;
      block[4] = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    uint64_t v47 = *(void *)(a1 + 32);
    v48 = *(void **)(v47 + 1032);
    *(void *)(v47 + 1032) = 0;
  }
  else if (![*(id *)(v10 + 1016) isExtensionInputMode] {
         || *(unsigned char *)(*(void *)(a1 + 32) + 1065))
  }
  {
    v11 = [*(id *)(a1 + 40) extension];
    BOOL v12 = [v11 _extensionContextForUUID:v7];

    [v12 _tearDownRemoteService];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 1032);
    *(void *)(v13 + 1032) = 0;
  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_5(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  dispatch_time_t v3 = *(double **)(a1 + 32);
  if (Current - v3[134] >= 0.3)
  {
    [v3 resetInputMode];
  }
  else
  {
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    [v4 switchToCurrentSystemInputMode];
  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 1080) == *(void *)(a1 + 40))
  {
    dispatch_time_t v3 = *(void **)(v1 + 1032);
    if (v3 == *(void **)(v1 + 1016) && !*(unsigned char *)(v1 + 1065))
    {
      id v4 = [v3 identifier];
      [*(id *)(a1 + 32) killIncomingExtension];
      [*(id *)(a1 + 32) resetInputMode];
      [(id)_MergedGlobals_13 removeObjectForKey:v4];
    }
  }
}

void __51__UICompatibilityInputViewController_setInputMode___block_invoke_7(uint64_t a1, void *a2)
{
  id v25 = a2;
  if (v25)
  {
    dispatch_time_t v3 = [*(id *)(*(void *)(a1 + 32) + 1016) identifier];
    int v4 = [v3 isEqualToString:@"autofillsignup"];

    if (!v4) {
      goto LABEL_9;
    }
    [*(id *)(a1 + 32) removeSnapshotView];
    [*(id *)(a1 + 32) setInputController:v25];
    double v5 = *(void **)(a1 + 32);
    id v6 = objc_alloc_init(_UITextDocumentInterface);
    [v5 _setTextDocumentProxy:v6];

    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 inputController];
    [v7 addChildViewController:v8];

    id v9 = [*(id *)(a1 + 32) view];
    uint64_t v10 = [*(id *)(a1 + 32) inputController];
    v11 = [v10 view];
    [v9 addSubview:v11];

    BOOL v12 = [*(id *)(a1 + 32) _compatView];
    uint64_t v13 = [*(id *)(a1 + 32) inputController];
    id v14 = [v13 view];
    [v12 setTouchableView:v14];

    v15 = [*(id *)(a1 + 32) inputController];
    [v15 didMoveToParentViewController:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) rebuildChildConstraints];
    v16 = [*(id *)(a1 + 32) inputController];
    id v17 = [v16 view];
    [v17 size];
    v18 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");

    [v18 setSplitWidthsChanged:1];
    id v19 = [*(id *)(a1 + 32) view];
    BOOL v20 = [v19 superview];
    [v20 _didChangeKeyplaneWithContext:v18];

    [*(id *)(a1 + 32) takeSnapshotView];
    goto LABEL_8;
  }
  if (+[UIKeyboard usesInputSystemUI]) {
    [*(id *)(a1 + 40) clearViewControllerClass];
  }
  [*(id *)(a1 + 32) resetInputMode];
  if (+[UIKeyboard usesInputSystemUI])
  {
    v21 = +[UIKeyboardImpl activeInstance];
    [v21 setSkipRecomputeInputMode:1];

    BOOL v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v22 forceReloadInputViews];

    v18 = +[UIKeyboardImpl activeInstance];
    [v18 setSkipRecomputeInputMode:0];
LABEL_8:
  }
LABEL_9:
  uint64_t v23 = *(void *)(a1 + 32);
  char v24 = *(void **)(v23 + 1032);
  *(void *)(v23 + 1032) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)preferredFocusedView
{
  uint64_t v2 = [(UICompatibilityInputViewController *)self inputController];
  dispatch_time_t v3 = [v2 view];

  return v3;
}

- (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(UICompatibilityInputViewController *)self inputController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(UICompatibilityInputViewController *)self inputController];
    [v9 keyboardWillChangeFromDelegate:v10 toDelegate:v6];
  }
}

- (id)childCompatibilityController
{
  dispatch_time_t v3 = [(UICompatibilityInputViewController *)self inputController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(UICompatibilityInputViewController *)self inputController];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)_keyboard
{
  dispatch_time_t v3 = [(UIViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [(UIViewController *)self view];

    if (v4) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  if ([(UIInputViewController *)self _isPlaceholder])
  {
    double v5 = [(UIViewController *)self view];
    id v6 = [v5 placeheldView];
    id v7 = +[UIViewController viewControllerForView:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v4 = [v7 _keyboard];

      if (v4) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  char v8 = [(UICompatibilityInputViewController *)self childCompatibilityController];
  int v4 = [v8 _keyboard];

LABEL_11:
  return v4;
}

- (id)_keyboardForThisViewController
{
  dispatch_time_t v3 = [(UIViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [(UIViewController *)self view];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICompatibilityInputViewController;
  [(UIViewController *)&v6 viewWillDisappear:a3];
  dispatch_time_t v3 = +[UIInputSwitcherView activeInstance];
  int v4 = [v3 isVisible];

  if (v4)
  {
    double v5 = +[UIInputSwitcherView activeInstance];
    [v5 hide];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UICompatibilityInputViewController;
  [(UIViewController *)&v7 viewWillAppear:a3];
  int v4 = [(UICompatibilityInputViewController *)self _keyboardForThisViewController];
  char v5 = [v4 isActive];

  if ((v5 & 1) == 0)
  {
    objc_super v6 = [(UICompatibilityInputViewController *)self _keyboardForThisViewController];
    [v6 activate];
  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v6 = [(UICompatibilityInputViewController *)self _keyboardForThisViewController];
  int v7 = [v6 isActive];

  if (v7)
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    [v8 prepareLayoutForInterfaceOrientation:a3];
  }
  id v9 = [(UICompatibilityInputViewController *)self inputController];
  if (v9) {
    goto LABEL_4;
  }
  BOOL v12 = [(UIViewController *)self childViewControllers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = [(UICompatibilityInputViewController *)self _compatView];
    id v9 = [v14 touchableView];

    if ([v9 _hasAutolayoutHeightConstraint])
    {
      if (v9)
      {
        uint64_t v15 = [v9 _disableLayoutFlushingCount];
        if (v15 >= 1) {
          uint64_t v16 = v15 + 1;
        }
        else {
          uint64_t v16 = 1;
        }
        [v9 _setDisableLayoutFlushingCount:v16];
        [v9 _disableLayoutFlushing];
      }
      [v9 _removeAutolayoutSizingConstraints];
      self->_shouldRegenerateSizingConstraints = 1;
    }
LABEL_4:
  }
  id v10 = +[UIInputSwitcherView activeInstance];
  int v11 = [v10 isVisible];

  if (v11)
  {
    id v17 = +[UIInputSwitcherView activeInstance];
    [v17 hide];
  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v6 = [(UICompatibilityInputViewController *)self _keyboardForThisViewController];
  int v7 = [v6 isActive];

  if (v7)
  {
    id v9 = +[UIKeyboardImpl activeInstance];
    [v9 updateLayoutToCurrentInterfaceOrientation];
  }
  else
  {
    deferredSystemView = self->_deferredSystemView;
    [(UIKeyboard *)deferredSystemView setOrientation:a3];
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  int v4 = [(UICompatibilityInputViewController *)self _keyboardForThisViewController];
  int v5 = [v4 isActive];

  if (v5)
  {
    objc_super v6 = +[UIKeyboardImpl activeInstance];
    [v6 finishLayoutToCurrentInterfaceOrientation];
  }
  int v7 = [(UICompatibilityInputViewController *)self inputController];
  if (!v7)
  {
    char v8 = [(UIViewController *)self childViewControllers];
    uint64_t v9 = [v8 count];

    if (!v9 || !self->_shouldRegenerateSizingConstraints) {
      return;
    }
    self->_shouldRegenerateSizingConstraints = 0;
    id v10 = [(UICompatibilityInputViewController *)self _compatView];
    id v11 = [v10 touchableView];

    [v11 _convertToAutolayoutSizingIfNecessary];
    -[UIView _popDisableLayoutFlushing](v11);
    int v7 = v11;
  }
}

- (void)willBeginTranslation
{
  dispatch_time_t v3 = [(UICompatibilityInputViewController *)self _keyboard];
  int v4 = [v3 isActive];

  if (v4)
  {
    if (![(UIInputViewController *)self _isPlaceholder])
    {
      int v5 = [(UICompatibilityInputViewController *)self blinkAssertion];
      [v5 invalidate];

      objc_super v6 = +[UIKeyboardImpl activeInstance];
      int v7 = [v6 _activeAssertionController];
      char v8 = [v7 nonBlinkingAssertionWithReason:@"Split/Floating Keyboard Translation"];
      [(UICompatibilityInputViewController *)self setBlinkAssertion:v8];

      uint64_t v9 = +[UIKeyboardImpl activeInstance];
      id v10 = [v9 autocorrectPrompt];

      if (v10)
      {
        id v11 = +[UIKeyboardImpl activeInstance];
        [v11 prepareForGeometryChange];
      }
    }
    uint64_t v12 = [(UICompatibilityInputViewController *)self _keyboard];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      id v14 = +[UIKeyboardImpl activeInstance];
      int v15 = [v14 showsCandidateBar];

      if (v15)
      {
        uint64_t v16 = +[UIKeyboardImpl activeInstance];
        id v17 = [v16 candidateController];

        if ([v17 barIsExtended]) {
          [v17 collapse];
        }
      }
    }
    id v19 = +[UIKeyboardImpl activeInstance];
    v18 = [v19 _layout];
    [v18 deactivateActiveKeys];
  }
}

- (void)finishSplitTransition:(BOOL)a3
{
  if (![(UIInputViewController *)self _isPlaceholder])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__UICompatibilityInputViewController_finishSplitTransition___block_invoke;
    aBlock[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v11 = a3;
    int v5 = (void (**)(void))_Block_copy(aBlock);
    objc_super v6 = [(UICompatibilityInputViewController *)self _keyboard];
    int v7 = [v6 isActive];

    if (v7)
    {
      v5[2](v5);
    }
    else
    {
      char v8 = [(UICompatibilityInputViewController *)self _keyboard];
      uint64_t v9 = +[UIKeyboard activeKeyboard];

      if (v8 == v9) {
        +[UIView performWithoutAnimation:v5];
      }
    }
  }
}

void __60__UICompatibilityInputViewController_finishSplitTransition___block_invoke(uint64_t a1)
{
  if (+[UIKeyboardImpl rivenPreference])
  {
    uint64_t v2 = +[UIKeyboardImpl activeInstance];
    id v4 = v2;
    double v3 = 1.0;
    if (!*(unsigned char *)(a1 + 32)) {
      double v3 = 0.0;
    }
    [v2 finishSplitTransitionWithProgress:v3];
  }
}

- (void)didFinishTranslation
{
  id v6 = [(UICompatibilityInputViewController *)self _keyboard];
  if ([v6 isActive])
  {
    BOOL v3 = [(UIInputViewController *)self _isPlaceholder];

    if (v3) {
      return;
    }
    id v4 = [(UICompatibilityInputViewController *)self blinkAssertion];
    [v4 invalidate];

    [(UICompatibilityInputViewController *)self setBlinkAssertion:0];
    int v5 = +[UIKeyboardImpl activeInstance];
    LODWORD(v4) = [v5 geometryIsChanging];

    if (!v4) {
      return;
    }
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 geometryChangeDone:1];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UICompatibilityInputViewController;
  [(UIViewController *)&v5 viewDidLayoutSubviews];
  BOOL v3 = [(UIViewController *)self parentViewController];
  if ([v3 conformsToProtocol:&unk_1ED5DE500])
  {
    id v4 = [v3 controllerDelegate];
    [v4 controllerDidLayoutSubviews:v3];
  }
}

- (void)_tvUpdateAppearanceForUserInterfaceStyle
{
  BOOL v3 = [(UIViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1000 || v4 == 2)
  {
    objc_super v5 = +[UIKBRenderConfig darkConfig];
  }
  else
  {
    objc_super v5 = +[UIKBRenderConfig defaultConfig];
  }
  id v6 = v5;
  id v7 = v5;

  id v8 = [(UIViewController *)self view];
  [v8 _setRenderConfig:v7];
}

- (UILayoutGuide)focusSafeAreaLayoutGuide
{
  v34[4] = *MEMORY[0x1E4F143B8];
  focusSafeAreaLayoutGuide = self->_focusSafeAreaLayoutGuide;
  if (!focusSafeAreaLayoutGuide)
  {
    +[UIKeyboard _keyboardFocusGuideMargins];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = objc_alloc_init(UILayoutGuide);
    uint64_t v13 = [(UIViewController *)self view];
    [v13 addLayoutGuide:v12];

    v26 = (void *)MEMORY[0x1E4F5B268];
    v32 = [(UILayoutGuide *)v12 topAnchor];
    v33 = [(UIViewController *)self view];
    v31 = [v33 topAnchor];
    id v30 = [v32 constraintEqualToAnchor:v31 constant:v5];
    v34[0] = v30;
    v28 = [(UILayoutGuide *)v12 leftAnchor];
    v29 = [(UIViewController *)self view];
    v27 = [v29 leftAnchor];
    id v25 = [v28 constraintEqualToAnchor:v27 constant:v7];
    v34[1] = v25;
    char v24 = [(UIViewController *)self view];
    uint64_t v23 = [v24 bottomAnchor];
    id v14 = [(UILayoutGuide *)v12 bottomAnchor];
    int v15 = [v23 constraintEqualToAnchor:v14 constant:v9];
    v34[2] = v15;
    uint64_t v16 = [(UIViewController *)self view];
    id v17 = [v16 rightAnchor];
    v18 = [(UILayoutGuide *)v12 rightAnchor];
    id v19 = [v17 constraintEqualToAnchor:v18 constant:v11];
    v34[3] = v19;
    BOOL v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    [v26 activateConstraints:v20];

    v21 = self->_focusSafeAreaLayoutGuide;
    self->_focusSafeAreaLayoutGuide = v12;

    focusSafeAreaLayoutGuide = self->_focusSafeAreaLayoutGuide;
  }
  return focusSafeAreaLayoutGuide;
}

- (UIViewController)inputController
{
  return self->_inputController;
}

- (void)setInputController:(id)a3
{
}

- (NSArray)internalEdgeMatchConstraints
{
  return self->_internalEdgeMatchConstraints;
}

- (void)setInternalEdgeMatchConstraints:(id)a3
{
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_storeStrong((id *)&self->_internalEdgeMatchConstraints, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_storeStrong((id *)&self->_focusSafeAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_incomingExtensionInputMode, 0);
  objc_storeStrong((id *)&self->_deferredSystemView, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end