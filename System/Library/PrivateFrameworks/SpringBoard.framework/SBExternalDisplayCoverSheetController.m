@interface SBExternalDisplayCoverSheetController
- (BOOL)_isCoverSheetPresented;
- (BOOL)_isScreenOn;
- (BOOL)_shouldIgnoreEmbeddedBacklightChangingSource:(int64_t)a3;
- (BOOL)_shouldShowExternalCoverSheet;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isUILocked;
- (BOOL)noAnimations;
- (BOOL)shouldBeVisible;
- (BSInvalidatable)displayLayoutElementAssertion;
- (NSHashTable)observers;
- (NSString)externalDisplayUUID;
- (SBBacklightController)backlightController;
- (SBCoverSheetPresentationManager)presentationManager;
- (SBExternalDisplayCoverSheetController)initWithWindowScene:(id)a3;
- (SBExternalDisplayCoverSheetControllerWindowFactory)windowFactory;
- (SBExternalDisplayCoverSheetViewController)rootViewController;
- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGesture;
- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer;
- (SBLockStateProvider)lockStateProvider;
- (SBSDisplayLayoutElement)displayLayoutElement;
- (SBWindowScene)_sbWindowScene;
- (UIWindow)coversheetWindow;
- (id)_initWithWindowScene:(id)a3 lockStateProvider:(id)a4 backlightController:(id)a5 presentationManager:(id)a6 windowFactory:(id)a7 externalDisplayCoverSheetViewController:(id)a8;
- (id)newCoverSheetWindowForScene:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (void)_embeddedLockStateDidChange:(id)a3;
- (void)_handleScrunchGesture:(id)a3;
- (void)_notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3;
- (void)_notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3;
- (void)_postNotificationForExternalCoverSheetVisibilityDidChange:(BOOL)a3;
- (void)_setCoverSheetWindowVisible:(BOOL)a3 fadeDuration:(double)a4;
- (void)_setCoversheetPresented:(BOOL)a3;
- (void)_setScreenOn:(BOOL)a3;
- (void)_updateExternalDisplayCoverSheetExistence;
- (void)_updateLockStateObservers;
- (void)_wakeScreenForMouseButtonDown:(id)a3;
- (void)addLockStateObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5;
- (void)coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLock:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeLockStateObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCoversheetPresented:(BOOL)a3;
- (void)setCoversheetWindow:(id)a3;
- (void)setDisplayLayoutElement:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setDisplayLayoutElementAssertion:(id)a3;
- (void)setExternalDisplayUUID:(id)a3;
- (void)setMouseButtonDownGesture:(id)a3;
- (void)setNoAnimations:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setSbWindowScene:(id)a3;
- (void)setScrunchDismissGestureRecognizer:(id)a3;
- (void)setShouldBeVisible:(BOOL)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
@end

@implementation SBExternalDisplayCoverSheetController

- (SBExternalDisplayCoverSheetController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v5 = +[SBLockStateAggregator sharedInstance];
  v6 = +[SBBacklightController sharedInstanceIfExists];
  v7 = [v4 coverSheetPresentationManager];
  id v8 = [[SBExternalDisplayCoverSheetViewController alloc] _initWithWindowScene:v4 wallpaperEffectViewFactory:0];
  v9 = [(SBExternalDisplayCoverSheetController *)self _initWithWindowScene:v4 lockStateProvider:v5 backlightController:v6 presentationManager:v7 windowFactory:0 externalDisplayCoverSheetViewController:v8];

  return v9;
}

- (id)_initWithWindowScene:(id)a3 lockStateProvider:(id)a4 backlightController:(id)a5 presentationManager:(id)a6 windowFactory:(id)a7 externalDisplayCoverSheetViewController:(id)a8
{
  id v15 = a3;
  id v45 = a4;
  id v44 = a5;
  id v43 = a6;
  id v16 = a7;
  id v17 = a8;
  v46.receiver = self;
  v46.super_class = (Class)SBExternalDisplayCoverSheetController;
  v18 = [(SBExternalDisplayCoverSheetController *)&v46 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_sbWindowScene, v15);
    objc_storeStrong((id *)&v19->_lockStateProvider, a4);
    objc_storeStrong((id *)&v19->_backlightController, a5);
    objc_storeStrong((id *)&v19->_presentationManager, a6);
    objc_storeStrong((id *)&v19->_windowFactory, a7);
    v20 = [v15 _sbDisplayConfiguration];
    uint64_t v21 = [v20 hardwareIdentifier];
    externalDisplayUUID = v19->_externalDisplayUUID;
    v19->_externalDisplayUUID = (NSString *)v21;

    if (!v19->_externalDisplayUUID)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2 object:v19 file:@"SBExternalDisplayCoverSheetController.m" lineNumber:217 description:@"Trying to setup external display cover sheet with a nil external displayUUID"];
    }
    [(SBBacklightController *)v19->_backlightController addObserver:v19];
    [(SBExternalDisplayCoverSheetController *)v19 _setScreenOn:[(SBBacklightController *)v19->_backlightController screenIsOn]];
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v19 selector:sel__embeddedLockStateDidChange_ name:@"SBAggregateLockStateDidChangeNotification" object:0];
    id v24 = objc_alloc(MEMORY[0x1E4FA6A68]);
    uint64_t v25 = [v24 initWithIdentifier:*MEMORY[0x1E4F625B0]];
    displayLayoutElement = v19->_displayLayoutElement;
    v19->_displayLayoutElement = (SBSDisplayLayoutElement *)v25;

    double v27 = *MEMORY[0x1E4F43CF8];
    [(SBSDisplayLayoutElement *)v19->_displayLayoutElement setLevel:(uint64_t)*MEMORY[0x1E4F43CF8]];
    [(SBSDisplayLayoutElement *)v19->_displayLayoutElement setFillsDisplayBounds:1];
    [(SBSDisplayLayoutElement *)v19->_displayLayoutElement setLayoutRole:3];
    if (v19->_windowFactory) {
      windowFactory = v19->_windowFactory;
    }
    else {
      windowFactory = v19;
    }
    uint64_t v29 = [windowFactory newCoverSheetWindowForScene:v15];
    coversheetWindow = v19->_coversheetWindow;
    v19->_coversheetWindow = (UIWindow *)v29;

    [(UIWindow *)v19->_coversheetWindow setWindowLevel:v27 + -15.0];
    v31 = v19->_coversheetWindow;
    v32 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIWindow *)v31 setBackgroundColor:v32];

    [(UIWindow *)v19->_coversheetWindow setAlpha:0.0];
    [(UIWindow *)v19->_coversheetWindow setHidden:0];
    [(UIWindow *)v19->_coversheetWindow setUserInteractionEnabled:0];
    [(UIWindow *)v19->_coversheetWindow setRootViewController:v17];
    objc_storeStrong((id *)&v19->_rootViewController, a8);
    v33 = [v15 statusBarManager];
    v34 = [v33 layoutManager];
    [v34 setOrientationWindow:v19->_coversheetWindow forStatusBarLayoutLayer:1];

    [(SBExternalDisplayCoverSheetController *)v19 _updateExternalDisplayCoverSheetExistence];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FA5F98]) initWithTarget:v19 action:sel__wakeScreenForMouseButtonDown_];
    mouseButtonDownGesture = v19->_mouseButtonDownGesture;
    v19->_mouseButtonDownGesture = (SBFMouseButtonDownGestureRecognizer *)v35;

    v37 = [v15 systemGestureManager];
    [v37 addGestureRecognizer:v19->_mouseButtonDownGesture withType:68];

    [(SBFMouseButtonDownGestureRecognizer *)v19->_mouseButtonDownGesture setEnabled:!v19->_screenOn];
    v38 = [[SBFluidScrunchGestureRecognizer alloc] initWithTarget:v19 action:sel__handleScrunchGesture_];
    scrunchDismissGestureRecognizer = v19->_scrunchDismissGestureRecognizer;
    v19->_scrunchDismissGestureRecognizer = v38;

    [(SBFluidScrunchGestureRecognizer *)v19->_scrunchDismissGestureRecognizer setAllowedTouchTypes:&unk_1F33481C8];
    [(SBFluidScrunchGestureRecognizer *)v19->_scrunchDismissGestureRecognizer setDelegate:v19];
    v40 = [v15 systemGestureManager];
    [v40 addGestureRecognizer:v19->_scrunchDismissGestureRecognizer withType:12];
  }
  return v19;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"SBExternalDisplayCoverSheetController.m";
  __int16 v16 = 1024;
  int v17 = 276;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)isUILocked
{
  return self->_coversheetPresented;
}

- (void)addLockStateObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBExternalDisplayCoverSheetController.m", 287, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  lockStateObservers = self->_lockStateObservers;
  if (!lockStateObservers)
  {
    v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int v8 = self->_lockStateObservers;
    self->_lockStateObservers = v7;

    id v5 = v10;
    lockStateObservers = self->_lockStateObservers;
  }
  [(NSHashTable *)lockStateObservers addObject:v5];
  [(SBExternalDisplayCoverSheetController *)self _updateLockStateObservers];
}

- (void)removeLockStateObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBExternalDisplayCoverSheetController.m", 297, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_lockStateObservers removeObject:v5];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v3 = SBLogCoverSheet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %p", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  [(SBBacklightController *)self->_backlightController removeObserver:self];
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v7 = [WeakRetained systemGestureManager];

  [v7 removeGestureRecognizer:self->_mouseButtonDownGesture];
  [v7 removeGestureRecognizer:self->_scrunchDismissGestureRecognizer];
  self->_isInvalidated = 1;
}

- (id)newCoverSheetWindowForScene:(id)a3
{
  id v3 = a3;
  id v4 = [[SBWindow alloc] initWithWindowScene:v3 role:@"SBTraitsParticipantRoleCoverSheet" debugName:@"External Display Cover Sheet Window"];

  return v4;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  displayLayoutElement = self->_displayLayoutElement;
  if (self->_displayLayoutElementAssertion)
  {
    id v7 = displayLayoutElement;
    int v8 = (void (**)(id, id))a3;
    v9 = [(SBExternalDisplayCoverSheetController *)self _sbWindowScene];
    if (!v9)
    {
      int v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"SBExternalDisplayCoverSheetController.m", 336, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v19 = [v9 displayLayoutPublisher];
    if (!v19)
    {
      __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBExternalDisplayCoverSheetController.m", 336, @"No publisher for window scene: %@; self: %@",
        v9,
        self);
    }
    uint64_t v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    __int16 v12 = [v19 transitionAssertionWithReason:v11];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v8[2](v8, v7);
    __int16 v14 = [v19 addElement:v7];
    id v15 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v14;

    [(SBSDisplayLayoutElement *)v12 invalidate];
  }
  else
  {
    __int16 v16 = (void (*)(void))*((void *)a3 + 2);
    __int16 v12 = displayLayoutElement;
    id v19 = a3;
    v16();
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (displayLayoutElementAssertion) {
      return;
    }
    v6 = self->_displayLayoutElement;
    id v7 = [(SBExternalDisplayCoverSheetController *)self _sbWindowScene];
    if (!v7)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"SBExternalDisplayCoverSheetController.m", 356, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    uint64_t v13 = [v7 displayLayoutPublisher];
    if (!v13)
    {
      __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBExternalDisplayCoverSheetController.m", 356, @"No publisher for window scene: %@; self: %@",
        v7,
        self);
    }
    int v8 = [v13 addElement:v6];
    v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v8;

    uint64_t v10 = (BSInvalidatable *)v13;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    uint64_t v10 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (BOOL)_shouldIgnoreEmbeddedBacklightChangingSource:(int64_t)a3
{
  return ((unint64_t)a3 < 0x17) & (0x401003u >> a3);
}

- (void)backlightController:(id)a3 willAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if ([(SBExternalDisplayCoverSheetController *)self _shouldIgnoreEmbeddedBacklightChangingSource:a5])
  {
    int v8 = SBLogCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      int64_t v16 = a5;
      v9 = "[EXTERNAL] ignoring backlight change source: %ld";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_isInvalidated)
  {
    int v8 = SBLogCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "[EXTERNAL] ignoring backlight change because I'm invalidated";
      uint64_t v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  float v12 = fabsf(a4);
  float v13 = fabsf(a4 + -1.0);
  if (v12 < 2.2204e-16 || v13 < 2.2204e-16)
  {
    [(SBExternalDisplayCoverSheetController *)self _setScreenOn:v12 >= 2.2204e-16];
  }
}

- (void)_embeddedLockStateDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL isInvalidated = self->_isInvalidated;
  id v5 = SBLogCoverSheet();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isInvalidated)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] ignoring embedded lock state change because I'm invalidated", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (v6)
    {
      int v7 = [(SBLockStateProvider *)self->_lockStateProvider hasAnyLockState];
      int v8 = @"NO";
      if (v7) {
        int v8 = @"YES";
      }
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] lock state change - has any state: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(SBExternalDisplayCoverSheetController *)self _updateExternalDisplayCoverSheetExistence];
  }
}

- (void)coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLock:(id)a3
{
  id v4 = (SBCoverSheetPresentationManager *)a3;
  if (self->_presentationManager == v4 && !self->_isInvalidated)
  {
    id v5 = v4;
    [(SBExternalDisplayCoverSheetController *)self _updateExternalDisplayCoverSheetExistence];
    id v4 = v5;
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return (id)[(SBExternalDisplayCoverSheetViewController *)self->_rootViewController view];
}

- (void)_updateExternalDisplayCoverSheetExistence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v5 = [WeakRetained sceneManager];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBExternalDisplayCoverSheetController.m", 437, @"failed to get a SBSystemShellExternalDisplaySceneManager. instead we got: %@", v7 object file lineNumber description];
  }
  BOOL v10 = [(SBExternalDisplayCoverSheetController *)self _shouldShowExternalCoverSheet];
  BOOL shouldBeVisible = self->_shouldBeVisible;
  float v12 = SBLogCoverSheet();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (shouldBeVisible)
    {
      if (v13)
      {
        __int16 v21 = 0;
        __int16 v14 = "[EXTERNAL] not presenting cover sheet, it is already presented";
        int v15 = (uint8_t *)&v21;
LABEL_22:
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (v13)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] presenting cover sheet", v22, 2u);
    }

    [(SBExternalDisplayCoverSheetController *)self _notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:1];
    [(SBExternalDisplayCoverSheetController *)self _setCoverSheetWindowVisible:1 fadeDuration:0.5];
    [v9 setSuspendedUnderLock:1];
    [(SBExternalDisplayCoverSheetController *)self _postNotificationForExternalCoverSheetVisibilityDidChange:1];
    [(SBExternalDisplayCoverSheetController *)self setDisplayLayoutElementActive:1];
    int64_t v16 = self;
    uint64_t v17 = 1;
  }
  else
  {
    if (!shouldBeVisible)
    {
      if (v13)
      {
        *(_WORD *)id v19 = 0;
        __int16 v14 = "[EXTERNAL] not dismissing cover sheet, it is already dismissed";
        int v15 = v19;
        goto LABEL_22;
      }
LABEL_23:

      goto LABEL_24;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] dismissing cover sheet", buf, 2u);
    }

    [(SBExternalDisplayCoverSheetController *)self _notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:0];
    [(SBExternalDisplayCoverSheetController *)self _setScreenOn:1];
    [(SBExternalDisplayCoverSheetController *)self _setCoverSheetWindowVisible:0 fadeDuration:0.5];
    [v9 setSuspendedUnderLock:0];
    [(SBExternalDisplayCoverSheetController *)self _postNotificationForExternalCoverSheetVisibilityDidChange:0];
    [(SBExternalDisplayCoverSheetController *)self setDisplayLayoutElementActive:0];
    int64_t v16 = self;
    uint64_t v17 = 0;
  }
  [(SBExternalDisplayCoverSheetController *)v16 _notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:v17];
LABEL_24:
}

- (void)_setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    uint64_t v6 = [WeakRetained _sbDisplayConfiguration];
    id v8 = [v6 hardwareIdentifier];

    if (!v8)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBExternalDisplayCoverSheetController.m" lineNumber:479 description:@"We need a non-nil hardwareIdentifier in order to blank the external display"];
    }
    BKSDisplayServicesSetDisplayBlanked();
    [(SBFMouseButtonDownGestureRecognizer *)self->_mouseButtonDownGesture setEnabled:!self->_screenOn];
  }
}

- (void)_setCoversheetPresented:(BOOL)a3
{
  if (self->_coversheetPresented != a3)
  {
    self->_coversheetPresented = a3;
    [(SBExternalDisplayCoverSheetController *)self _updateLockStateObservers];
  }
}

- (void)_setCoverSheetWindowVisible:(BOOL)a3 fadeDuration:(double)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->_BOOL shouldBeVisible = a3;
  if ([(SBExternalDisplayCoverSheetController *)self noAnimations]) {
    a4 = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v8 = SBLogCoverSheet();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v5;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] making coversheet window visible: %{BOOL}u duration: %f", (uint8_t *)&buf, 0x12u);
  }

  if (self->_shouldBeVisible)
  {
    [(UIWindow *)self->_coversheetWindow setHidden:0];
    [(SBExternalDisplayCoverSheetController *)self _setCoversheetPresented:1];
    [(SBExternalDisplayCoverSheetViewController *)self->_rootViewController prepareForPresentation];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke;
  v16[3] = &unk_1E6AF4AC0;
  v16[4] = self;
  id v9 = (void (**)(void))MEMORY[0x1D948C7A0](v16);
  if (BSFloatIsZero())
  {
    v9[2](v9);
    if (!self->_shouldBeVisible)
    {
      [(UIWindow *)self->_coversheetWindow setHidden:1];
      [(SBExternalDisplayCoverSheetViewController *)self->_rootViewController cleanupAfterDismissal];
      [(SBExternalDisplayCoverSheetController *)self _setCoversheetPresented:0];
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    BOOL v10 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    BOOL v13 = __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke_2;
    __int16 v14 = &unk_1E6AF80B8;
    objc_copyWeak(&v15, &buf);
    [v10 animateWithDuration:v9 animations:&v11 completion:a4];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&buf);
  }
  objc_msgSend(WeakRetained, "_synchronizeDrawing", v11, v12, v13, v14);
}

uint64_t __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(v1 + 25)) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 32) setAlpha:v2];
}

void __82__SBExternalDisplayCoverSheetController__setCoverSheetWindowVisible_fadeDuration___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = *((unsigned __int8 *)WeakRetained + 25);
    id v4 = SBLogCoverSheet();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[EXTERNAL] coversheet window animation to visible %{BOOL}u completed", (uint8_t *)v5, 8u);
    }

    if (!v3)
    {
      [v2[4] setHidden:1];
      [v2[6] cleanupAfterDismissal];
      [v2 _setCoversheetPresented:0];
    }
  }
}

- (BOOL)_shouldShowExternalCoverSheet
{
  return [(SBLockStateProvider *)self->_lockStateProvider hasAnyLockState];
}

- (void)_wakeScreenForMouseButtonDown:(id)a3
{
  id v3 = a3;
  id v4 = +[SBLockScreenManager sharedInstanceIfExists];
  [v4 _wakeScreenForMouseButtonDown:v3];
}

- (void)_handleScrunchGesture:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 state];
  BOOL v5 = v14;
  if (v4 == 3)
  {
    uint64_t v6 = [(SBExternalDisplayCoverSheetController *)self viewForSystemGestureRecognizer:v14];
    [v14 locationInView:v6];
    double v8 = v7;
    [v6 bounds];
    double v10 = v9 - v8;
    uint64_t v11 = [MEMORY[0x1E4F5E408] rootSettings];
    [v11 unlockPasscodeThresholdForExternalDisplay];
    double v13 = v12;

    if (v10 >= v13) {
      [(SBCoverSheetPresentationManager *)self->_presentationManager _notifyDelegateRequestsUnlock];
    }

    BOOL v5 = v14;
  }
}

- (void)_notifyObserversWillUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 willUpdateExternalDisplayCoverSheetAppearance:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_notifyObserversDidUpdateExternalDisplayCoverSheetAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 didUpdateExternalDisplayCoverSheetAppearance:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_postNotificationForExternalCoverSheetVisibilityDidChange:(BOOL)a3
{
  BOOL v3 = @"SBExternalDisplayCoverSheetDidDismiss";
  if (a3) {
    BOOL v3 = @"SBExternalDisplayCoverSheetDidPresent";
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  uint64_t v5 = v3;
  id v6 = [v4 defaultCenter];
  [v6 postNotificationName:v5 object:0];
}

- (void)_updateLockStateObservers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBExternalDisplayCoverSheetController *)self isUILocked];
  uint64_t v4 = (void *)[(NSHashTable *)self->_lockStateObservers copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "lockStateProvider:didUpdateIsUILocked:", self, v3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (UIWindow)coversheetWindow
{
  return self->_coversheetWindow;
}

- (void)setCoversheetWindow:(id)a3
{
}

- (NSString)externalDisplayUUID
{
  return self->_externalDisplayUUID;
}

- (void)setExternalDisplayUUID:(id)a3
{
}

- (SBExternalDisplayCoverSheetViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (SBSDisplayLayoutElement)displayLayoutElement
{
  return self->_displayLayoutElement;
}

- (void)setDisplayLayoutElement:(id)a3
{
}

- (BSInvalidatable)displayLayoutElementAssertion
{
  return self->_displayLayoutElementAssertion;
}

- (void)setDisplayLayoutElementAssertion:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)_isCoverSheetPresented
{
  return self->_coversheetPresented;
}

- (void)setCoversheetPresented:(BOOL)a3
{
  self->_coversheetPresented = a3;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (void)setShouldBeVisible:(BOOL)a3
{
  self->_BOOL shouldBeVisible = a3;
}

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setSbWindowScene:(id)a3
{
}

- (SBLockStateProvider)lockStateProvider
{
  return self->_lockStateProvider;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (SBCoverSheetPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (SBExternalDisplayCoverSheetControllerWindowFactory)windowFactory
{
  return self->_windowFactory;
}

- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGesture
{
  return self->_mouseButtonDownGesture;
}

- (void)setMouseButtonDownGesture:(id)a3
{
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
}

- (BOOL)_isScreenOn
{
  return self->_screenOn;
}

- (BOOL)noAnimations
{
  return self->_noAnimations;
}

- (void)setNoAnimations:(BOOL)a3
{
  self->_noAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGesture, 0);
  objc_storeStrong((id *)&self->_windowFactory, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_lockStateProvider, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_externalDisplayUUID, 0);
  objc_storeStrong((id *)&self->_coversheetWindow, 0);
  objc_storeStrong((id *)&self->_lockStateObservers, 0);
}

@end