@interface SBProductivityGestureController
- (BOOL)_enabledForCurrentAppScenes;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (SBProductivityGestureController)initWithSystemGestureManager:(id)a3 focusController:(id)a4 gestureDefaults:(id)a5 gestureEducationController:(id)a6;
- (id)_focusedSceneForAction;
- (int64_t)_educationTypeForGesture:(id)a3 direction:(int64_t)a4;
- (int64_t)_orientationOfFocusedSceneForGesture:(id)a3;
- (int64_t)slideDirectionWithGesture:(id)a3;
- (void)_evaluateEnablement;
- (void)_setupGestureRecognizers;
- (void)_tearDownGestureRecognizers;
- (void)handleProductivityGesture:(id)a3;
@end

@implementation SBProductivityGestureController

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return objc_msgSend(a4, "_isPointerTouch", a3) ^ 1;
}

- (SBProductivityGestureController)initWithSystemGestureManager:(id)a3 focusController:(id)a4 gestureDefaults:(id)a5 gestureEducationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)SBProductivityGestureController;
  v15 = [(SBProductivityGestureController *)&v31 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F62490] sharedInstance];
    sceneManager = v15->_sceneManager;
    v15->_sceneManager = (FBSceneManager *)v16;

    objc_storeStrong((id *)&v15->_systemGestureManager, a3);
    objc_storeStrong((id *)&v15->_focusController, a4);
    objc_storeStrong((id *)&v15->_gestureDefaults, a5);
    objc_storeStrong((id *)&v15->_educationController, a6);
    if (_os_feature_enabled_impl())
    {
      objc_initWeak(&location, v15);
      gestureDefaults = v15->_gestureDefaults;
      v19 = [NSString stringWithUTF8String:"productivityGesturesAllowed"];
      uint64_t v20 = MEMORY[0x1E4F14428];
      id v21 = MEMORY[0x1E4F14428];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __123__SBProductivityGestureController_initWithSystemGestureManager_focusController_gestureDefaults_gestureEducationController___block_invoke;
      v28 = &unk_1E6AF4B10;
      objc_copyWeak(&v29, &location);
      uint64_t v22 = [(SBGestureDefaults *)gestureDefaults observeDefault:v19 onQueue:v20 withBlock:&v25];
      gestureDefaultsObserver = v15->_gestureDefaultsObserver;
      v15->_gestureDefaultsObserver = (BSDefaultObserver *)v22;

      [(SBProductivityGestureController *)v15 _evaluateEnablement];
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

void __123__SBProductivityGestureController_initWithSystemGestureManager_focusController_gestureDefaults_gestureEducationController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _evaluateEnablement];
    id WeakRetained = v2;
  }
}

- (void)_evaluateEnablement
{
  if ([(SBGestureDefaults *)self->_gestureDefaults productivityGesturesAllowed])
  {
    [(SBProductivityGestureController *)self _setupGestureRecognizers];
  }
  else
  {
    [(SBProductivityGestureController *)self _tearDownGestureRecognizers];
  }
}

- (void)_setupGestureRecognizers
{
  if (!self->_threeFingerSingleTap)
  {
    v3 = [MEMORY[0x1E4F43210] productivitySingleTapGestureRecognizerWithTarget:self action:sel_handleProductivityGesture_ delegate:self];
    threeFingerSingleTap = self->_threeFingerSingleTap;
    self->_threeFingerSingleTap = v3;
    v5 = v3;

    [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:v5 withType:127];
  }
  if (!self->_threeFingerDoubleTap)
  {
    v6 = [MEMORY[0x1E4F431F0] productivityDoubleTapGestureRecognizerWithTarget:self action:sel_handleProductivityGesture_ delegate:self];
    threeFingerDoubleTap = self->_threeFingerDoubleTap;
    self->_threeFingerDoubleTap = v6;
    v8 = v6;

    [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:v8 withType:129];
  }
  if (!self->_threeFingerSlide)
  {
    v9 = [MEMORY[0x1E4F43200] productivityPanGestureRecognizerWithTarget:self action:sel_handleProductivityGesture_ delegate:self];
    threeFingerSlide = self->_threeFingerSlide;
    self->_threeFingerSlide = v9;
    id v11 = v9;

    [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:v11 withType:130];
  }
  if (!self->_threeFingerLongPress)
  {
    id v12 = [MEMORY[0x1E4F431F8] productivityLongPressGestureRecognizerWithTarget:self action:sel_handleProductivityGesture_ delegate:self];
    threeFingerLongPress = self->_threeFingerLongPress;
    self->_threeFingerLongPress = v12;
    id v14 = v12;

    [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:v14 withType:128];
  }
  if (!self->_threeFingerPinch)
  {
    v15 = [MEMORY[0x1E4F43208] productivityPinchGestureRecognizerWithTarget:self action:sel_handleProductivityGesture_ delegate:self];
    threeFingerPinch = self->_threeFingerPinch;
    self->_threeFingerPinch = v15;
    v17 = v15;

    [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:v17 withType:131];
  }
  [(SBSystemGestureManager *)self->_systemGestureManager gestureRecognizerOfType:127 shouldRequireFailureOfGestureRecognizer:self->_threeFingerDoubleTap];
  [(SBSystemGestureManager *)self->_systemGestureManager gestureRecognizerOfType:127 shouldRequireFailureOfGestureRecognizer:self->_threeFingerSlide];
  [(SBSystemGestureManager *)self->_systemGestureManager gestureRecognizerOfType:127 shouldRequireFailureOfGestureRecognizer:self->_threeFingerLongPress];
  systemGestureManager = self->_systemGestureManager;
  v19 = self->_threeFingerPinch;
  [(SBSystemGestureManager *)systemGestureManager gestureRecognizerOfType:127 shouldRequireFailureOfGestureRecognizer:v19];
}

- (void)_tearDownGestureRecognizers
{
  if (self->_threeFingerSingleTap)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerSingleTap = self->_threeFingerSingleTap;
    self->_threeFingerSingleTap = 0;
  }
  if (self->_threeFingerDoubleTap)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerDoubleTap = self->_threeFingerDoubleTap;
    self->_threeFingerDoubleTap = 0;
  }
  if (self->_threeFingerSlide)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerSlide = self->_threeFingerSlide;
    self->_threeFingerSlide = 0;
  }
  if (self->_threeFingerLongPress)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerLongPress = self->_threeFingerLongPress;
    self->_threeFingerLongPress = 0;
  }
  if (self->_threeFingerPinch)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    threeFingerPinch = self->_threeFingerPinch;
    self->_threeFingerPinch = 0;
  }
}

- (int64_t)slideDirectionWithGesture:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = [(SBProductivityGestureController *)self _orientationOfFocusedSceneForGesture:v4];
  double v11 = -v7;
  double v12 = -v9;
  if (v10 == 3) {
    double v13 = v7;
  }
  else {
    double v13 = v9;
  }
  if (v10 == 3) {
    double v14 = v9;
  }
  else {
    double v14 = v7;
  }
  if (v10 == 4)
  {
    double v13 = -v7;
    double v14 = -v9;
  }
  if (v10 != 2)
  {
    double v12 = v13;
    double v11 = v14;
  }
  double v15 = fabs(v11);
  double v16 = fabs(v12);
  int64_t v17 = 2;
  if (v11 > 0.0) {
    int64_t v17 = 3;
  }
  if (v16 > v15 || v15 < 5.0) {
    return 0;
  }
  else {
    return v17;
  }
}

- (void)handleProductivityGesture:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (_UIKBProductivityLongPressGestureRecognizer *)a3;
  v5 = v4;
  if (self->_threeFingerSingleTap == v4 || self->_threeFingerLongPress == v4)
  {
    if ([(_UIKBProductivityLongPressGestureRecognizer *)v4 state] != 3) {
      goto LABEL_42;
    }
    uint64_t v7 = 1;
  }
  else if (self->_threeFingerDoubleTap == v4)
  {
    if ([(_UIKBProductivityLongPressGestureRecognizer *)v4 state] != 3) {
      goto LABEL_42;
    }
    uint64_t v7 = 2;
  }
  else if (self->_threeFingerSlide == v4)
  {
    if ([(_UIKBProductivityLongPressGestureRecognizer *)v4 state] != 3) {
      goto LABEL_42;
    }
    uint64_t v7 = [(SBProductivityGestureController *)self slideDirectionWithGesture:v5];
    if (!v7) {
      goto LABEL_42;
    }
  }
  else
  {
    if (self->_threeFingerPinch != v4) {
      goto LABEL_42;
    }
    double v6 = v4;
    if ([(_UIKBProductivityLongPressGestureRecognizer *)v6 state] == 1)
    {
      [(_UIKBProductivityLongPressGestureRecognizer *)v6 avgTouchesToCentroidDistance];
      uint64_t v7 = 0;
      self->_initPinchableDistance = v8;
    }
    else if ([(_UIKBProductivityLongPressGestureRecognizer *)v6 state] == 3)
    {
      [(_UIKBProductivityLongPressGestureRecognizer *)v6 avgTouchesToCentroidDistance];
      uint64_t v7 = v18 <= self->_initPinchableDistance ? 8 : 10;
    }
    else
    {
      uint64_t v7 = 0;
    }

    if (!v7) {
      goto LABEL_42;
    }
  }
  if ([(SBProductivityGestureController *)self _enabledForCurrentAppScenes])
  {
    double v9 = [(SBProductivityGestureController *)self _focusedSceneForAction];
    if (v9)
    {
      if (self->_threeFingerLongPress == v5
        || self->_threeFingerSingleTap == v5
        || ![(SBGestureDefaults *)self->_gestureDefaults productivityGesturesRequireEducation])
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke;
        v26[3] = &unk_1E6B0EB50;
        uint64_t v28 = v7;
        double v9 = v9;
        v27 = v9;
        uint64_t v12 = MEMORY[0x1D948C7A0](v26);
        double v13 = (void *)v12;
        if (v7 == 10)
        {
          double v14 = [v9 clientHandle];
          double v15 = [v14 processHandle];
          double v16 = v15;
          if (v15)
          {
            [v15 auditToken];
          }
          else
          {
            long long v24 = 0u;
            long long v25 = 0u;
          }
          uint64_t v19 = BSVersionedPIDForAuditToken();

          uint64_t v20 = dispatch_get_global_queue(33, 0);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_15;
          v21[3] = &unk_1E6AFE440;
          uint64_t v23 = v19;
          id v22 = v13;
          dispatch_async(v20, v21);
        }
        else
        {
          (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
        }
      }
      else
      {
        int64_t v10 = [(SBProductivityGestureController *)self _educationTypeForGesture:v5 direction:v7];
        if (v10)
        {
          double v11 = SBLogProductivityGestures();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v30 = v10;
            _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Suggesting education %lu", buf, 0xCu);
          }
        }
        [(SBProductivityGestureEducationController *)self->_educationController gestureActivatedForType:v10];
      }
    }
    else
    {
      int64_t v17 = SBLogProductivityGestures();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "Recognized gesture but no focused scene", buf, 2u);
      }
    }
  }
  else
  {
    double v9 = SBLogProductivityGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Recognized gesture but one or more scenes don't want gestures enabled", buf, 2u);
    }
  }

LABEL_42:
}

void __61__SBProductivityGestureController_handleProductivityGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F432A8];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithGestureDirection:*(void *)(a1 + 40) authenticationMessage:v4];

  double v6 = SBLogProductivityGestures();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138543618;
    double v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Sending action: %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
  }

  double v8 = *(void **)(a1 + 32);
  double v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  [v8 sendActions:v9];
}

void __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_15(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogProductivityGestures();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Requesting secure paste authentication message for client %{public}lld", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v4 = (void *)getPBServerConnectionClass_softClass;
  uint64_t v16 = getPBServerConnectionClass_softClass;
  if (!getPBServerConnectionClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    double v18 = __getPBServerConnectionClass_block_invoke;
    uint64_t v19 = &unk_1E6AF56B0;
    uint64_t v20 = &v13;
    __getPBServerConnectionClass_block_invoke((uint64_t)&buf);
    id v4 = (void *)v14[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  double v6 = [v5 defaultConnection];
  uint64_t v7 = [v6 requestSecurePasteAuthenticationMessageWithContext:0x25FC7F58D8DEA672 forClientVersionedPID:*(void *)(a1 + 40) error:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_16;
  v10[3] = &unk_1E6AF5A78;
  id v8 = *(id *)(a1 + 32);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __61__SBProductivityGestureController_handleProductivityGesture___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_enabledForCurrentAppScenes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = [v2 count] != 0;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "displayIdentity", (void)v18);
        if ([v10 isMainDisplay])
        {
          id v11 = [v9 sceneIfExists];
          id v12 = [v11 uiClientSettings];
          uint64_t v13 = [v12 editingInteractionConfiguration];

          if (!v13)
          {
            uint64_t v14 = SBLogProductivityGestures();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = [v9 sceneIfExists];
              *(_DWORD *)long long buf = 138543362;
              uint64_t v23 = v16;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Gestures disabled for scene: %{public}@", buf, 0xCu);
            }
            BOOL v3 = 0;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v3;
}

- (id)_focusedSceneForAction
{
  id v2 = [(SBKeyboardFocusControlling *)self->_focusController sceneWithFocusIncludingSpringBoard];
  BOOL v3 = [v2 settings];
  id v4 = objc_msgSend(v3, "sb_displayIdentityForSceneManagers");
  int v5 = [v4 isMainDisplay];

  if (v5) {
    id v6 = v2;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)_orientationOfFocusedSceneForGesture:(id)a3
{
  id v4 = a3;
  int v5 = [(SBKeyboardFocusControlling *)self->_focusController sceneWithFocusIncludingSpringBoard];
  id v6 = [v5 settings];
  uint64_t v7 = objc_msgSend(v6, "sb_displayIdentityForSceneManagers");
  int v8 = [v7 isMainDisplay];

  if (v8)
  {
    id v9 = [v5 uiClientSettings];
    int64_t v10 = [v9 interfaceOrientation];
  }
  else
  {
    id v9 = [v4 view];
    id v11 = [v9 window];
    int64_t v10 = [v11 interfaceOrientation];
  }
  return v10;
}

- (int64_t)_educationTypeForGesture:(id)a3 direction:(int64_t)a4
{
  id v6 = (_UIKBProductivitySingleTapGesture *)a3;
  uint64_t v7 = v6;
  if (self->_threeFingerSingleTap == v6)
  {
    id v9 = SBLogProductivityGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      int64_t v10 = "No education necessary for 3 finger single tap";
      id v11 = buf;
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (self->_threeFingerDoubleTap == v6)
  {
    int64_t v8 = 1;
    goto LABEL_15;
  }
  if (self->_threeFingerSlide != v6)
  {
    if (self->_threeFingerLongPress != v6)
    {
      if (self->_threeFingerPinch == v6)
      {
        if (a4 == 10)
        {
          int64_t v8 = 3;
          goto LABEL_15;
        }
        if (a4 == 8)
        {
          int64_t v8 = 2;
          goto LABEL_15;
        }
        uint64_t v13 = SBLogProductivityGestures();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SBProductivityGestureController _educationTypeForGesture:direction:](a4, v13);
        }
        goto LABEL_31;
      }
LABEL_13:
      int64_t v8 = 0;
      goto LABEL_15;
    }
    id v9 = SBLogProductivityGestures();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      int64_t v10 = "No education necessary for 3 finger long press";
      id v11 = (uint8_t *)&v14;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a4 == 3)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      int64_t v8 = 4;
    }
    else {
      int64_t v8 = 5;
    }
  }
  else
  {
    if (a4 != 2)
    {
      uint64_t v13 = SBLogProductivityGestures();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SBProductivityGestureController _educationTypeForGesture:direction:](a4, v13);
      }
LABEL_31:

      goto LABEL_13;
    }
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      int64_t v8 = 5;
    }
    else {
      int64_t v8 = 4;
    }
  }
LABEL_15:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threeFingerPinch, 0);
  objc_storeStrong((id *)&self->_threeFingerLongPress, 0);
  objc_storeStrong((id *)&self->_threeFingerSlide, 0);
  objc_storeStrong((id *)&self->_threeFingerDoubleTap, 0);
  objc_storeStrong((id *)&self->_threeFingerSingleTap, 0);
  objc_storeStrong((id *)&self->_educationController, 0);
  objc_storeStrong((id *)&self->_gestureDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_gestureDefaults, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)_educationTypeForGesture:(uint64_t)a1 direction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to map 3 finger slide direction %lu to education type", (uint8_t *)&v2, 0xCu);
}

- (void)_educationTypeForGesture:(uint64_t)a1 direction:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to map 3 finger pinch direction %lu to education type", (uint8_t *)&v2, 0xCu);
}

@end