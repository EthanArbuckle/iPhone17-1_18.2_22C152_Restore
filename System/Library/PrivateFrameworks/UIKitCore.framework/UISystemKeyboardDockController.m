@interface UISystemKeyboardDockController
- (BOOL)_canShowWhileLocked;
- (id)configuredGlyphWithName:(id)a3;
- (id)imageConfig;
- (void)_dictationDidBeginNotification:(id)a3;
- (void)customDockItemWasTapped:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)dictationItemButtonWasPressed:(id)a3 withEvent:(id)a4 isRunningButton:(BOOL)a5;
- (void)globeItemButtonWasPressed:(id)a3 withEvent:(id)a4;
- (void)keyboardDockView:(id)a3 didPressDockItem:(id)a4 withEvent:(id)a5;
- (void)keyboardItemButtonWasTapped:(id)a3 withEvent:(id)a4;
- (void)loadView;
- (void)setDockView:(id)a3;
- (void)setKeyboardDockItem;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDockItemsVisibility;
- (void)updateDockItemsVisibilityWithCustomDictationAction:(id)a3;
- (void)updateRightButtonItemWithCustomAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation UISystemKeyboardDockController

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIKeyboardDidBeginDictationNotification";
  v6[1] = @"UIKeyboardDictationAvailabilityDidChangeNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UISystemKeyboardDockController;
  [(UIViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = [UIKeyboardDockView alloc];
  v25 = -[UIKeyboardDockView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIKeyboardDockView *)v25 setDelegate:self];
  v4 = +[_UIKeyboardTextSelectionGestureController sharedInstance];
  id v5 = (id)[v4 addLongPressTextSelectionInteractionsToView:v25];

  v6 = [UIKeyboardDockItem alloc];
  v7 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:@"globe"];
  v8 = [(UIKeyboardDockItem *)v6 initWithTitle:@"globe" image:v7 identifier:@"globe"];
  globeDockItem = self->_globeDockItem;
  self->_globeDockItem = v8;

  v10 = [UIKeyboardDockItem alloc];
  v11 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:@"mic"];
  v12 = [(UIKeyboardDockItem *)v10 initWithTitle:@"mic" image:v11 identifier:@"dictation"];
  dictationDockItem = self->_dictationDockItem;
  self->_dictationDockItem = v12;

  v14 = [UIKeyboardDockItem alloc];
  v15 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:@"mic"];
  v16 = [(UIKeyboardDockItem *)v14 initWithTitle:@"mic" image:v15 identifier:@"dictationRunning"];
  dictationRunningDockItem = self->_dictationRunningDockItem;
  self->_dictationRunningDockItem = v16;

  v18 = [UIKeyboardDockItem alloc];
  v19 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:@"keyboard"];
  v20 = [(UIKeyboardDockItem *)v18 initWithTitle:@"keyboard" image:v19 identifier:@"keyboardkeyboard"];
  keyboardDockItem = self->_keyboardDockItem;
  self->_keyboardDockItem = v20;

  v22 = +[UIButton buttonWithType:0];
  stopDictationButton = self->_stopDictationButton;
  self->_stopDictationButton = v22;

  v24 = +[UIColor clearColor];
  [(UIView *)self->_stopDictationButton setBackgroundColor:v24];

  [(UIControl *)self->_stopDictationButton addTarget:self action:sel_keyboardItemButtonWasTapped_withEvent_ forControlEvents:0xFFFFFFFFLL];
  [(UIKeyboardDockView *)v25 setLeftDockItem:self->_globeDockItem];
  [(UIKeyboardDockView *)v25 setRightDockItem:self->_dictationDockItem];
  [(UIViewController *)self setView:v25];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UISystemKeyboardDockController;
  id v4 = a3;
  [(UIViewController *)&v7 traitCollectionDidChange:v4];
  id v5 = [(UIViewController *)self traitCollection];
  int v6 = [v4 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6) {
    [(UISystemKeyboardDockController *)self updateDockItemsVisibility];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)UISystemKeyboardDockController;
  [(UIViewController *)&v5 viewDidLoad];
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__dictationDidBeginNotification_ name:@"UIKeyboardDidBeginDictationNotification" object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel_updateDockItemsVisibility name:@"UIKeyboardDictationAvailabilityDidChangeNotification" object:0];
  }
}

- (void)setKeyboardDockItem
{
  BOOL v3 = +[UIDictationController isRunning];
  id v4 = +[UIKeyboardInputMode dictationInputMode];
  int v5 = [v4 isCurrentDictationLanguageOnDevice];

  BOOL v6 = [(UIKeyboardDockItem *)self->_globeDockItem enabled];
  int v7 = v3 & v5;
  if (v6)
  {
    BOOL v8 = v7 == 0;
    uint64_t v9 = 3;
    if (!v8) {
      uint64_t v9 = 2;
    }
    uint64_t v10 = OBJC_IVAR___UISystemKeyboardDockController__globeDockItem[v9];
    goto LABEL_7;
  }
  if (v7)
  {
    uint64_t v10 = 1000;
LABEL_7:
    uint64_t v11 = *(uint64_t *)((char *)&self->super.super.super.isa + v10);
    v12 = [(UISystemKeyboardDockController *)self dockView];
    [v12 setRightDockItem:v11];

    v13 = [(UISystemKeyboardDockController *)self dockView];
    [v13 setCenterDockItem:0];
    goto LABEL_9;
  }
  keyboardDockItem = self->_keyboardDockItem;
  v15 = [(UISystemKeyboardDockController *)self dockView];
  [v15 setCenterDockItem:keyboardDockItem];

  v13 = [(UISystemKeyboardDockController *)self dockView];
  [v13 setRightDockItem:0];
LABEL_9:

  v16 = [(UIViewController *)self view];
  [v16 bounds];
  -[UIButton setFrame:](self->_stopDictationButton, "setFrame:");

  id v17 = [(UIViewController *)self view];
  [v17 insertSubview:self->_stopDictationButton atIndex:0];
}

- (void)updateRightButtonItemWithCustomAction:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (v4)
  {
    int v5 = [v4 image];
    BOOL v6 = [(UISystemKeyboardDockController *)self imageConfig];
    int v7 = [v5 imageByApplyingSymbolConfiguration:v6];

    BOOL v8 = [(UISystemKeyboardDockController *)self dockView];
    uint64_t v9 = [v8 rightDockItem];

    if (!v9)
    {
      uint64_t v10 = [UIKeyboardDockItem alloc];
      uint64_t v11 = [v19 title];
      v12 = [v19 identifier];
      if (v12)
      {
        uint64_t v9 = [(UIKeyboardDockItem *)v10 initWithTitle:v11 image:v7 identifier:v12];
      }
      else
      {
        v14 = NSString;
        v15 = [v19 title];
        v16 = [v14 stringWithFormat:@"CustomAction_%@", v15];
        uint64_t v9 = [(UIKeyboardDockItem *)v10 initWithTitle:v11 image:v7 identifier:v16];
      }
      id v17 = [(UISystemKeyboardDockController *)self dockView];
      [v17 setRightDockItem:v9];
    }
    v18 = [v19 title];
    [(UIKeyboardDockItem *)v9 setTitle:v18 image:v7];

    [(UIKeyboardDockItem *)v9 setCustomAction:v19];
  }
  else
  {
    dictationDockItem = self->_dictationDockItem;
    int v7 = [(UISystemKeyboardDockController *)self dockView];
    [v7 setRightDockItem:dictationDockItem];
  }
}

- (void)_dictationDidBeginNotification:(id)a3
{
  if (!+[UIKeyboard isKeyboardProcess]
    && +[UIKeyboard usesInputSystemUI])
  {
    return;
  }
  id v4 = +[UIKeyboardInputMode dictationInputMode];
  char v5 = [v4 isCurrentDictationLanguageOnDevice];

  if (v5) {
    return;
  }
  BOOL v6 = +[UIKeyboardImpl activeInstance];
  if ([v6 isUsingDictationLayout])
  {

    goto LABEL_7;
  }
  int v7 = +[UIKeyboardImpl activeInstance];
  char v8 = [v7 isMinimized];

  if (v8)
  {
LABEL_7:
    if (!self->_dictationHasUsedServerManualEndpointing)
    {
      [(UISystemKeyboardDockController *)self setKeyboardDockItem];
      keyboardDockItem = self->_keyboardDockItem;
      [(UIKeyboardDockItem *)keyboardDockItem setEnabled:1];
    }
    return;
  }
  uint64_t v10 = +[UIDictationController sharedInstance];
  [v10 cancelDictation];

  uint64_t v11 = +[UIKeyboardImpl activeInstance];
  [v11 dismissDictationPopover];

  stopDictationButton = self->_stopDictationButton;
  [(UIView *)stopDictationButton removeFromSuperview];
}

- (void)dictationItemButtonWasPressed:(id)a3 withEvent:(id)a4 isRunningButton:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 touchesForView:v8];
    v12 = [v11 anyObject];

    if (!+[UIDictationController isRunning]
      || [v12 phase]
      || a5)
    {
      uint64_t v56 = 0;
      v57 = (CGPoint *)&v56;
      uint64_t v58 = 0x3010000000;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      v59 = &unk_186D7DBA7;
      [v12 locationInView:v8];
      uint64_t v60 = v19;
      uint64_t v61 = v20;
      uint64_t v21 = objc_msgSend(v8, "pointInsideTapActionRegion:", v57[2].x, v57[2].y);
      if (![v12 phase] && !self->_dictationItemButtonTouchDownTime)
      {
        v22 = [MEMORY[0x1E4F1C9C8] date];
        dictationItemButtonTouchDownTime = self->_dictationItemButtonTouchDownTime;
        self->_dictationItemButtonTouchDownTime = v22;

        self->_dictationItemButtonTouchDownLocationInView = v57[2];
      }
      [v8 bounds];
      double MidX = CGRectGetMidX(v63);
      [v8 bounds];
      objc_msgSend(v8, "convertPoint:toView:", 0, MidX, CGRectGetMinY(v64));
      double v26 = v25;
      double v28 = v27;
      v29 = +[UIInputSwitcherView sharedInstance];
      if (self->_dictationHasUsedServerManualEndpointing)
      {
        v30 = 0;
      }
      else
      {
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke;
        v50[3] = &unk_1E52FD518;
        v50[4] = self;
        id v51 = v12;
        BOOL v54 = a5;
        id v52 = v8;
        v53 = &v56;
        char v55 = v21;
        v30 = objc_msgSend(v29, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", v52, v10, v21, 1, v50, v26, v28);
      }
      uint64_t v31 = [v12 phase];
      if ((unint64_t)(v31 - 3) < 2)
      {
        self->_dictationUsingServerManualEndpointing = 0;
        [v29 hide];
      }
      else if (v31 == 1)
      {
        if ([v29 isVisible])
        {
          [v29 bounds];
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          [v12 locationInView:v29];
          v62.x = v42;
          v62.y = v43;
          v65.origin.x = v35;
          v65.origin.y = v37;
          v65.size.width = v39;
          v65.size.height = v41;
          if (CGRectContainsPoint(v65, v62)) {
            self->_dictationUsingServerManualEndpointing = 0;
          }
        }
      }
      else if (!v31 {
             && !a5
      }
             && +[UIDictationController usingServerManualEndpointingThreshold])
      {
        self->_dictationUsingServerManualEndpointing = 1;
        self->_dictationHasUsedServerManualEndpointing = 0;
        +[UIDictationController serverManualEndpointingThreshold];
        dispatch_time_t v33 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_70;
        block[3] = &unk_1E52E5B08;
        id v45 = v30;
        v46 = self;
        char v49 = v21;
        id v47 = v12;
        id v48 = v29;
        dispatch_after(v33, MEMORY[0x1E4F14428], block);
      }
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      dictationDockItem = self->_dictationDockItem;
      v14 = [(UISystemKeyboardDockController *)self dockView];
      [v14 setRightDockItem:dictationDockItem];

      unint64_t v15 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard];
      v16 = +[UIDictationController sharedInstance];
      [v16 setReasonType:v15];

      id v17 = +[UIDictationController sharedInstance];
      [v17 stopDictation];

      v18 = +[UIDictationController sharedInstance];
      [v18 cancelDictation];
    }
  }
}

void __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke(uint64_t a1)
{
  unint64_t v2 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard];
  BOOL v3 = +[UIDictationController sharedInstance];
  [v3 setReasonType:v2];

  [*(id *)(*(void *)(a1 + 32) + 1024) timeIntervalSinceNow];
  double v5 = -v4;
  BOOL v6 = +[UIKBTouchState touchStateForTouch:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 64))
  {
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = v7[124];
    id v9 = [v7 dockView];
    [v9 setRightDockItem:v8];

    uint64_t v10 = +[UIDictationController activeInstance];
    [v10 stopDictation];

    uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v12 = [v11 _textInputSessionAnalytics];
    [*(id *)(a1 + 48) size];
    double v14 = v13;
    double v16 = v15;
    id v17 = (double *)(*(void *)(a1 + 32) + 1032);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = [v6 inputSource];
    double v20 = *v17;
    double v21 = v17[1];
    double v22 = *(double *)(v18 + 32);
    double v23 = *(double *)(v18 + 40);
    uint64_t v24 = 3;
  }
  else if (*(unsigned char *)(a1 + 65))
  {
    if (+[UIDictationController _applicationIsActive])
    {
      double v25 = +[UIDictationController sharedInstance];
      [v25 switchToDictationInputModeWithTouch:0];
    }
    else
    {
      v30 = _UIDictationControllerLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v38 = 0;
        _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_DEFAULT, "Tap mic button will delay switch to dictation", v38, 2u);
      }

      dispatch_time_t v31 = dispatch_time(0, 200000000);
      dispatch_after(v31, MEMORY[0x1E4F14428], &__block_literal_global_365);
    }
    uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v12 = [v11 _textInputSessionAnalytics];
    [*(id *)(a1 + 48) size];
    double v14 = v32;
    double v16 = v33;
    double v34 = (double *)(*(void *)(a1 + 32) + 1032);
    uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = [v6 inputSource];
    double v20 = *v34;
    double v21 = v34[1];
    double v22 = *(double *)(v35 + 32);
    double v23 = *(double *)(v35 + 40);
    uint64_t v24 = 1;
  }
  else
  {
    _logRejectedTapAction();
    uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v12 = [v11 _textInputSessionAnalytics];
    [*(id *)(a1 + 48) size];
    double v14 = v26;
    double v16 = v27;
    double v28 = (double *)(*(void *)(a1 + 32) + 1032);
    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = [v6 inputSource];
    double v20 = *v28;
    double v21 = v28[1];
    double v22 = *(double *)(v29 + 32);
    double v23 = *(double *)(v29 + 40);
    uint64_t v24 = 2;
  }
  objc_msgSend(v12, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", v24, 1, v19, v14, v16, v20, v21, v22, v23, v5);

  uint64_t v36 = *(void *)(a1 + 32);
  CGFloat v37 = *(void **)(v36 + 1024);
  *(void *)(v36 + 1024) = 0;
}

void __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_68()
{
  v0 = _UIDictationControllerLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v2 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_DEFAULT, "Tap mic button will switch to dictation", v2, 2u);
  }

  v1 = +[UIDictationController sharedInstance];
  [v1 switchToDictationInputModeWithTouch:0];
}

uint64_t __90__UISystemKeyboardDockController_dictationItemButtonWasPressed_withEvent_isRunningButton___block_invoke_70(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) gestureConflictsWithTypingWindow];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 977) && (result & 1) == 0 && *(unsigned char *)(a1 + 64))
  {
    *(unsigned char *)(v3 + 976) = 1;
    double v4 = +[UIDictationController sharedInstance];
    [v4 setReasonType:7];

    double v5 = +[UIDictationController sharedInstance];
    [v5 switchToDictationInputModeWithTouch:*(void *)(a1 + 48)];

    BOOL v6 = *(void **)(a1 + 56);
    return [v6 hide];
  }
  return result;
}

- (void)globeItemButtonWasPressed:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 touchesForView:v6];
  id v9 = [v8 anyObject];

  [v6 bounds];
  double MidX = CGRectGetMidX(v37);
  [v6 bounds];
  objc_msgSend(v6, "convertPoint:toView:", 0, MidX, CGRectGetMinY(v38));
  double v12 = v11;
  double v14 = v13;
  [v9 locationInView:v6];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  uint64_t v19 = objc_msgSend(v6, "pointInsideTapActionRegion:");
  if (![v9 phase] && !self->_globeItemButtonTouchDownTime)
  {
    double v20 = [MEMORY[0x1E4F1C9C8] date];
    globeItemButtonTouchDownTime = self->_globeItemButtonTouchDownTime;
    self->_globeItemButtonTouchDownTime = v20;

    self->_globeItemButtonTouchDownLocationInView.x = v16;
    self->_globeItemButtonTouchDownLocationInView.y = v18;
  }
  double v22 = +[UIKeyboardInputMode dictationInputMode];
  double v23 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v24 = [v23 currentInputMode];
  int v25 = [v22 isEqual:v24];

  if (v25)
  {
    double v26 = +[UIDictationView sharedInstance];
    objc_msgSend(v26, "globeButtonPressed:withEvent:location:", v6, v7, v12, v14);

    double v27 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v28 = [v27 _textInputSessionAnalytics];
    [v28 didInsertKeyPressWithInputSource:1];
  }
  else
  {
    uint64_t v29 = +[UIInputSwitcherView sharedInstance];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke;
    v31[3] = &unk_1E52DF5F0;
    v31[4] = self;
    id v32 = v9;
    char v36 = v19;
    id v33 = v6;
    CGFloat v34 = v16;
    CGFloat v35 = v18;
    id v30 = (id)objc_msgSend(v29, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", v33, v7, v19, 0, v31, v12, v14);
  }
}

void __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1048) timeIntervalSinceNow];
  double v3 = -v2;
  double v4 = +[UIKBTouchState touchStateForTouch:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 72))
  {
    double v5 = +[UIKeyboardImpl activeInstance];
    if (qword_1EB25C9B8 != -1) {
      dispatch_once(&qword_1EB25C9B8, &__block_literal_global_74_0);
    }
    id v6 = [v5 taskQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_4;
    v16[3] = &unk_1E52FD540;
    id v17 = v5;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v18 = v7;
    uint64_t v19 = v8;
    long long v21 = *(_OWORD *)(a1 + 56);
    double v22 = v3;
    id v20 = v4;
    uint64_t v9 = _MergedGlobals_5_11;
    id v10 = v5;
    [v6 performSingleTask:v16 breadcrumb:v9];
  }
  else
  {
    _logRejectedTapAction();
    id v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v11 = [v10 _textInputSessionAnalytics];
    [*(id *)(a1 + 48) size];
    objc_msgSend(v11, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", 2, 2, objc_msgSend(v4, "inputSource"), v12, v13, *(double *)(*(void *)(a1 + 32) + 1056), *(double *)(*(void *)(a1 + 32) + 1064), *(double *)(a1 + 56), *(double *)(a1 + 64), v3);
  }
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = *(void **)(v14 + 1048);
  *(void *)(v14 + 1048) = 0;
}

void __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_77_1 copy];
  v1 = (void *)_MergedGlobals_5_11;
  _MergedGlobals_5_11 = v0;
}

uint64_t __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __70__UISystemKeyboardDockController_globeItemButtonWasPressed_withEvent___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setInputModeToNextInPreferredListWithExecutionContext:a2];
  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v3 = [v6 _textInputSessionAnalytics];
  [*(id *)(a1 + 40) size];
  objc_msgSend(v3, "didKeyboardDockItemButtonPress:buttonType:buttonSize:touchDown:touchUp:touchDuration:inputSource:", 1, 2, objc_msgSend(*(id *)(a1 + 56), "inputSource"), v4, v5, *(double *)(*(void *)(a1 + 48) + 1056), *(double *)(*(void *)(a1 + 48) + 1064), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)keyboardItemButtonWasTapped:(id)a3 withEvent:(id)a4
{
  double v5 = [a4 touchesForView:a3];
  id v10 = [v5 anyObject];

  if ([v10 phase] == 3)
  {
    if (+[UIDictationController isRunning])
    {
      id v6 = +[UIDictationController sharedInstance];
      [v6 setReasonType:15];

      id v7 = +[UIDictationController sharedInstance];
      [v7 stopDictation];

      uint64_t v8 = +[UIKeyboardImpl activeInstance];
      [v8 dismissDictationPopover];
    }
    uint64_t v9 = +[UIDictationView activeInstance];
    [v9 returnToKeyboard];

    [(UIKeyboardDockItem *)self->_keyboardDockItem setEnabled:0];
  }
}

- (void)customDockItemWasTapped:(id)a3 withEvent:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  id v6 = [v22 customAction];

  if (v6)
  {
    id v7 = [v22 view];
    uint64_t v8 = [v5 touchesForView:v7];
    uint64_t v9 = [v8 anyObject];

    id v10 = [v22 view];
    [v9 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    double v15 = [v22 view];
    int v16 = objc_msgSend(v15, "pointInsideTapActionRegion:", v12, v14);

    if ([v9 phase] == 3)
    {
      id v17 = [v22 lastTouchUp];
      unsigned int v18 = v16 & ~[v9 isEqual:v17];

      if (v18 == 1)
      {
        [v22 setLastTouchUp:v9];
        uint64_t v19 = [v22 customAction];
        id v20 = [v22 customAction];
        long long v21 = [v20 sender];
        [v19 performWithSender:v21 target:0];
      }
    }
  }
}

- (void)keyboardDockView:(id)a3 didPressDockItem:(id)a4 withEvent:(id)a5
{
  id v17 = (UIKeyboardDockItem *)a4;
  id v7 = a5;
  uint64_t v8 = [(UIKeyboardDockItem *)v17 view];
  uint64_t v9 = [v7 touchesForView:v8];
  id v10 = [v9 anyObject];

  if (![v10 phase])
  {
    double v11 = +[UIKeyboardImpl activeInstance];
    int v12 = [v11 continuousPathUnderway];

    if (v12) {
      self->_isSuppressingDockItemTouch = 1;
    }
  }
  if (!self->_isSuppressingDockItemTouch)
  {
    double v13 = [(UIKeyboardDockItem *)v17 customAction];

    if (v13)
    {
      [(UISystemKeyboardDockController *)self customDockItemWasTapped:v17 withEvent:v7];
      goto LABEL_15;
    }
    double v14 = v17;
    if (self->_dictationDockItem == v17 || (double v14 = v17, self->_dictationRunningDockItem == v17))
    {
      int v16 = [(UIKeyboardDockItem *)v14 view];
      [(UISystemKeyboardDockController *)self dictationItemButtonWasPressed:v16 withEvent:v7 isRunningButton:self->_dictationRunningDockItem == v17];
      goto LABEL_14;
    }
    if (self->_keyboardDockItem == v17)
    {
      int v16 = [(UIKeyboardDockItem *)v17 view];
      [(UISystemKeyboardDockController *)self keyboardItemButtonWasTapped:v16 withEvent:v7];
      goto LABEL_14;
    }
    if (self->_globeDockItem == v17)
    {
      double v15 = [(UIKeyboardDockItem *)v17 customAction];

      if (!v15)
      {
        int v16 = [(UIKeyboardDockItem *)v17 view];
        [(UISystemKeyboardDockController *)self globeItemButtonWasPressed:v16 withEvent:v7];
LABEL_14:
      }
    }
  }
LABEL_15:
  if ([v10 phase] == 3 || objc_msgSend(v10, "phase") == 4) {
    self->_isSuppressingDockItemTouch = 0;
  }
}

- (void)updateDockItemsVisibility
{
  id v5 = [(UISystemKeyboardDockController *)self dockView];
  double v3 = [v5 rightDockItem];
  double v4 = [v3 customAction];
  [(UISystemKeyboardDockController *)self updateDockItemsVisibilityWithCustomDictationAction:v4];
}

- (void)updateDockItemsVisibilityWithCustomDictationAction:(id)a3
{
  id v63 = a3;
  double v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 isCurrentEditResponderInEditingMode];

  if (v5)
  {
    id v6 = [(UIViewController *)self view];
    id v7 = [v6 _inheritedRenderConfig];
    int v8 = [v7 animatedBackground];

    uint64_t v9 = [(UIViewController *)self view];
    id v10 = [v9 layer];
    double v11 = v10;
    if (v8)
    {
      [v10 setAllowsGroupOpacity:0];

      int v12 = [(UIViewController *)self view];
      double v13 = [v12 layer];
      double v14 = v13;
      uint64_t v15 = 0;
    }
    else
    {
      [v10 setAllowsGroupOpacity:1];

      int v12 = [(UIViewController *)self view];
      double v13 = [v12 layer];
      double v14 = v13;
      uint64_t v15 = 1;
    }
    [v13 setAllowsGroupBlending:v15];

    int v16 = @"globe";
    id v17 = +[UIKeyboardImpl activeInstance];
    if ([v17 globeKeyDisplaysAsEmojiKey])
    {
      unsigned int v18 = +[UIKeyboardImpl activeInstance];
      int v19 = [v18 showsDedicatedEmojiKeyAlongsideGlobeButton] ^ 1;
    }
    else
    {
      int v19 = 0;
    }

    id v20 = +[UIKeyboardInputModeController sharedInputModeController];
    int v21 = [v20 lastInputModeSwitchTriggeredByASCIIToggle];

    if (v19)
    {
      id v22 = UIKeyboardEmojiIconImageName;
    }
    else
    {
      if (!v21)
      {
        CGFloat v34 = +[UIKeyboardImpl activeInstance];
        CGFloat v35 = [v34 internationalKeyDisplayStringOnEmojiKeyboard];

        uint64_t v36 = [(__CFString *)v35 length];
        BOOL v24 = v36 != 0;
        if (v36)
        {
          double v23 = v35;
        }
        else
        {
          double v23 = v16;
        }
        if (v35 == @"")
        {
          uint64_t v58 = @"hand.draw";

          int v16 = v35;
          double v23 = v58;
        }
        else
        {
          int v16 = v35;
        }
LABEL_13:

        int v25 = [(UISystemKeyboardDockController *)self dockView];
        double v26 = [v25 leftDockItem];
        double v27 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:v23];
        [v26 setTitle:v23 image:v27];

        double v28 = +[UIKBAnalyticsDispatcher sharedInstance];
        [v28 setGlomojiTitle:v23];

        uint64_t v29 = +[UIKeyboardImpl activeInstance];
        int v30 = [v29 isUsingDictationLayout];

        if (v63)
        {
          -[UISystemKeyboardDockController updateRightButtonItemWithCustomAction:](self, "updateRightButtonItemWithCustomAction:");
LABEL_41:

          goto LABEL_42;
        }
        if (v30)
        {
          dispatch_time_t v31 = +[UIKeyboardInputModeController sharedInputModeController];
          id v32 = [v31 enabledDictationLanguages];
          BOOL v33 = (unint64_t)[v32 count] > 1;

          [(UIKeyboardDockItem *)self->_globeDockItem setEnabled:v33];
          [(UISystemKeyboardDockController *)self setKeyboardDockItem];
          [(UIKeyboardDockItem *)self->_keyboardDockItem setEnabled:1];
          [(UIKeyboardDockItem *)self->_dictationDockItem setActive:1];
          goto LABEL_41;
        }
        CGRect v37 = +[UIKeyboardImpl activeInstance];
        uint64_t v38 = [v37 shouldShowInternationalKey];

        [(UIKeyboardDockItem *)self->_globeDockItem setEnabled:v38];
        LODWORD(v38) = +[UIDictationController isRunning];
        CGFloat v39 = +[UIKeyboardInputMode dictationInputMode];
        int v40 = [v39 isCurrentDictationLanguageOnDevice];

        if (v38)
        {
          uint64_t v41 = 3;
          if (v40) {
            uint64_t v41 = 2;
          }
          uint64_t v42 = *(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___UISystemKeyboardDockController__globeDockItem[v41]);
          CGFloat v43 = [(UISystemKeyboardDockController *)self dockView];
          [(__CFString *)v43 setRightDockItem:v42];
LABEL_31:

          id v51 = +[UIKeyboardInputModeController sharedInputModeController];
          id v52 = [v51 currentInputMode];
          if ([v52 isExtensionInputMode])
          {
            v53 = +[UIKeyboardInputModeController sharedInputModeController];
            BOOL v54 = [v53 currentInputMode];
            char v55 = [v54 extensionInputModeHasDictation];

            if (v55)
            {
              BOOL v56 = 0;
              v57 = &off_1E52D3000;
LABEL_40:
              [(UIKeyboardDockItem *)self->_dictationDockItem setEnabled:v56];
              -[UIKeyboardDockItem setActive:](self->_dictationDockItem, "setActive:", v56 & [v57[254] dictationIsFunctional]);
              CGPoint v62 = [(UISystemKeyboardDockController *)self dockView];
              [v62 setCenterDockItem:0];

              [(UIView *)self->_stopDictationButton removeFromSuperview];
              goto LABEL_41;
            }
          }
          else
          {
          }
          v59 = +[UIKeyboardImpl activeInstance];
          if ([v59 shouldShowDictationKey])
          {
            uint64_t v60 = +[UIKeyboardInputModeController sharedInputModeController];
            uint64_t v61 = [v60 enabledDictationLanguages];
            BOOL v56 = [v61 count] != 0;
          }
          else
          {
            BOOL v56 = 0;
          }
          v57 = &off_1E52D3000;

          goto LABEL_40;
        }
        CGFloat v43 = @"mic";
        v44 = +[UIKeyboard activeKeyboard];
        if (([v44 _lightStyleRenderConfig] & 1) == 0)
        {

          if ((v19 | v24) != 1)
          {
LABEL_30:
            dictationDockItem = self->_dictationDockItem;
            v46 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:v43];
            [(UIKeyboardDockItem *)dictationDockItem setTitle:v43 image:v46];

            dictationRunningDockItem = self->_dictationRunningDockItem;
            id v48 = [(UISystemKeyboardDockController *)self configuredGlyphWithName:v43];
            [(UIKeyboardDockItem *)dictationRunningDockItem setTitle:v43 image:v48];

            char v49 = self->_dictationDockItem;
            v50 = [(UISystemKeyboardDockController *)self dockView];
            [v50 setRightDockItem:v49];

            goto LABEL_31;
          }
          v44 = v43;
          CGFloat v43 = @"mic.fill";
        }

        goto LABEL_30;
      }
      id v22 = UIKeyboardGlobeWithBackChevronIconImageName;
    }
    double v23 = *v22;
    BOOL v24 = 0;
    goto LABEL_13;
  }
LABEL_42:
}

- (id)configuredGlyphWithName:(id)a3
{
  id v4 = a3;
  if (!self->_priorityGlyphBundle)
  {
    int v5 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/SFSymbols.framework/CoreGlyphsPriority.bundle"];
    priorityGlyphBundle = self->_priorityGlyphBundle;
    self->_priorityGlyphBundle = v5;
  }
  id v7 = [(UISystemKeyboardDockController *)self imageConfig];
  int v8 = +[UIImage imageNamed:v4 inBundle:self->_priorityGlyphBundle withConfiguration:v7];
  if (!v8)
  {
    int v8 = +[UIImage _systemImageNamed:v4 withConfiguration:v7];
  }

  return v8;
}

- (id)imageConfig
{
  double v2 = +[UIKeyboard activeKeyboard];
  if ([v2 _lightStyleRenderConfig]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }

  id v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v3];
  int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:21.0];
  id v6 = [v5 configurationWithTraitCollection:v4];

  return v6;
}

- (void)setDockView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_priorityGlyphBundle, 0);
  objc_storeStrong((id *)&self->_globeItemButtonTouchDownTime, 0);
  objc_storeStrong((id *)&self->_dictationItemButtonTouchDownTime, 0);
  objc_storeStrong((id *)&self->_stopDictationButton, 0);
  objc_storeStrong((id *)&self->_keyboardDockItem, 0);
  objc_storeStrong((id *)&self->_dictationRunningDockItem, 0);
  objc_storeStrong((id *)&self->_dictationDockItem, 0);
  objc_storeStrong((id *)&self->_globeDockItem, 0);
}

@end