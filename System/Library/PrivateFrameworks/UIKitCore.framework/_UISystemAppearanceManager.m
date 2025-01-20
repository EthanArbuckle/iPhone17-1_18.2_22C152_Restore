@interface _UISystemAppearanceManager
- (BOOL)homeIndicatorAutoHidden;
- (BSInvalidatable)stateCaptureToken;
- (NSArray)multitaskingDragExclusionRects;
- (UIScene)_scene;
- (UIWindow)previousWindowDrivingSystemAppearance;
- (UIWindowScene)windowScene;
- (_UISystemAppearanceManager)initWithScene:(id)a3;
- (id)_findWindowDrivingSystemAppearance;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)userInterfaceStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)screenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleWindowVisibilityNotification:(id)a3;
- (void)_logOrientationPreferencesChangeWithOldSupportedOrientations:(unint64_t)a3 newSupportedOrientations:(unint64_t)a4 oldPreferredOrientation:(int64_t)a5 newPreferredOrientation:(int64_t)a6 animationSettings:(id)a7 fenced:(BOOL)a8;
- (void)_setScene:(id)a3;
- (void)_windowDrivingSystemAppearanceDidChange:(id)a3;
- (void)dealloc;
- (void)setPreviousWindowDrivingSystemAppearance:(id)a3;
- (void)setStateCaptureToken:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)updateHomeIndicatorAutoHidden;
- (void)updateMultitaskingDragExclusionRects;
- (void)updateScreenEdgesDeferringSystemGestures;
- (void)updateWhitePointAdaptivityStyle;
- (void)window:(id)a3 didUpdateSupportedOrientations:(unint64_t)a4 preferredOrientation:(int64_t)a5 prefersAnimation:(BOOL)a6;
@end

@implementation _UISystemAppearanceManager

- (id)_findWindowDrivingSystemAppearance
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:self->_windowScene];
  v4 = [(_UISystemAppearanceManager *)self previousWindowDrivingSystemAppearance];

  if (v3 != v4)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_findWindowDrivingSystemAppearance___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v7 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        windowScene = self->_windowScene;
        if (windowScene)
        {
          v9 = NSString;
          v10 = windowScene;
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];
        }
        else
        {
          v13 = @"(nil)";
        }
        v14 = v13;
        v15 = [(UIScene *)self->_windowScene _persistenceIdentifier];
        v16 = [(_UISystemAppearanceManager *)self previousWindowDrivingSystemAppearance];
        if (v16)
        {
          v17 = NSString;
          v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          v20 = [v17 stringWithFormat:@"<%@: %p>", v19, v16];
        }
        else
        {
          v20 = @"(nil)";
        }
        v21 = v20;
        id v22 = v3;
        if (v22)
        {
          v23 = NSString;
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
        }
        else
        {
          v26 = @"(nil)";
        }

        *(_DWORD *)buf = 138413058;
        v28 = v14;
        __int16 v29 = 2112;
        v30 = v15;
        __int16 v31 = 2112;
        v32 = v21;
        __int16 v33 = 2112;
        v34 = v26;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@ (%@) Scene window driving system appearance changed: %@ -> %@", buf, 0x2Au);
      }
    }
    [(_UISystemAppearanceManager *)self setPreviousWindowDrivingSystemAppearance:v3];
  }
  return v3;
}

- (UIWindow)previousWindowDrivingSystemAppearance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousWindowDrivingSystemAppearance);
  return (UIWindow *)WeakRetained;
}

- (void)setPreviousWindowDrivingSystemAppearance:(id)a3
{
}

- (_UISystemAppearanceManager)initWithScene:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"_UISystemAppearanceManager.m", 47, @"Invalid parameter not satisfying: %@", @"scene == nil || [scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)_UISystemAppearanceManager;
  v6 = [(_UISystemAppearanceManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    [(_UISystemAppearanceManager *)v6 _setScene:v5];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__handleWindowVisibilityNotification_ name:@"UIWindowDidBecomeVisibleNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__handleWindowVisibilityNotification_ name:@"UIWindowDidBecomeHiddenNotification" object:0];
  }
  return v7;
}

- (void)updateWhitePointAdaptivityStyle
{
  v3 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
  v4 = [v3 rootViewController];
  id v5 = [v4 _effectiveWhitePointAdaptivityStyleViewController];

  if (v5) {
    int64_t v6 = [v5 preferredWhitePointAdaptivityStyle];
  }
  else {
    int64_t v6 = 0;
  }
  self->_whitePointAdaptivityStyle = v6;
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    windowScene = self->_windowScene;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61___UISystemAppearanceManager_updateWhitePointAdaptivityStyle__block_invoke;
    v8[3] = &unk_1E52E07A0;
    v8[4] = self;
    [(UIScene *)windowScene _updateUIClientSettingsWithUITransitionBlock:v8];
  }
}

- (void)updateHomeIndicatorAutoHidden
{
  v3 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
  v4 = [v3 rootViewController];
  id v5 = [v4 _effectiveHomeIndicatorAutoHiddenViewController];

  if (v5) {
    char v6 = [v5 prefersHomeIndicatorAutoHidden];
  }
  else {
    char v6 = 0;
  }
  self->_homeIndicatorAutoHidden = v6;
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v7 = [(UIScene *)self->_windowScene _FBSScene];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59___UISystemAppearanceManager_updateHomeIndicatorAutoHidden__block_invoke;
    v8[3] = &unk_1E52DAE80;
    v8[4] = self;
    [v7 updateUIClientSettingsWithBlock:v8];
  }
}

- (void)updateScreenEdgesDeferringSystemGestures
{
  v3 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
  if ((dyld_program_sdk_at_least() & 1) != 0
    || ([(UIWindowScene *)self->_windowScene statusBarManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isStatusBarHidden],
        v4,
        (v5 & 1) == 0))
  {
    v7 = [v3 rootViewController];
    v8 = [v7 _effectiveScreenEdgesDeferringSystemGesturesViewController];

    if (v8) {
      unint64_t v6 = [v8 preferredScreenEdgesDeferringSystemGestures];
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 15;
  }
  self->_screenEdgesDeferringSystemGestures = v6;
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v9 = [(UIScene *)self->_windowScene _FBSScene];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70___UISystemAppearanceManager_updateScreenEdgesDeferringSystemGestures__block_invoke;
    v10[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    v10[4] = v6;
    [v9 updateUIClientSettingsWithBlock:v10];
  }
}

- (void)window:(id)a3 didUpdateSupportedOrientations:(unint64_t)a4 preferredOrientation:(int64_t)a5 prefersAnimation:(BOOL)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(_UISystemAppearanceManager *)self windowScene];

  if (v11)
  {
    objc_super v12 = [v10 windowScene];
    v13 = [(_UISystemAppearanceManager *)self windowScene];

    unint64_t v47 = a4;
    int64_t v48 = a5;
    if (v12 != v13)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v39 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          v40 = [(_UISystemAppearanceManager *)self windowScene];
          v41 = [v10 windowScene];
          *(_DWORD *)buf = 138412802;
          id v63 = v10;
          __int16 v64 = 2112;
          v65 = v40;
          __int16 v66 = 2112;
          v67 = v41;
          _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "Window (%@) with unexpected windowScene passed to windowDidUpdateOrientationPreferences. Expected: %@, Received: %@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation____s_category)+ 8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          v37 = [(_UISystemAppearanceManager *)self windowScene];
          v38 = [v10 windowScene];
          *(_DWORD *)buf = 138412802;
          id v63 = v10;
          __int16 v64 = 2112;
          v65 = v37;
          __int16 v66 = 2112;
          v67 = v38;
          _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "Window (%@) with unexpected windowScene passed to windowDidUpdateOrientationPreferences. Expected: %@, Received: %@", buf, 0x20u);
        }
      }
    }
    uint64_t v14 = [(UIWindowScene *)self->_windowScene _windowOrientationPreferencesObserver];
    v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, id, unint64_t, int64_t))(v14 + 16))(v14, v10, a4, a5);
    }
    v16 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
    id v17 = v10;
    id v18 = v16;
    if (v18 == v17)
    {
      BOOL v45 = a6;
    }
    else
    {
      v19 = v18;
      if (!v17 || !v18)
      {

LABEL_27:
LABEL_28:

        goto LABEL_29;
      }
      BOOL v45 = a6;
      int v20 = [v17 isEqual:v18];

      if (!v20) {
        goto LABEL_28;
      }
    }
    id v46 = v10;
    BOOL v21 = [(UIScene *)self->_windowScene _canDynamicallySpecifySupportedInterfaceOrientations];
    unint64_t supportedInterfaceOrientations = self->_supportedInterfaceOrientations;
    int64_t preferredInterfaceOrientation = self->_preferredInterfaceOrientation;
    unint64_t v25 = v47;
    int64_t v24 = v48;
    if (v21)
    {
      v26 = [(_UISystemAppearanceManager *)self windowScene];
      uint64_t v27 = [v26 interfaceOrientation];
      v28 = [(_UISystemAppearanceManager *)self windowScene];
      BOOL v32 = v27 == [v28 _interfaceOrientationForSupportedOrientations:v47 preferredOrientation:v48];
      unint64_t v25 = v47;
      int v29 = !v32;
      LODWORD(v42) = v29;

      int64_t v24 = v48;
    }
    else
    {
      LODWORD(v42) = 0;
    }
    self->_unint64_t supportedInterfaceOrientations = v25;
    self->_int64_t preferredInterfaceOrientation = v24;
    HIDWORD(v42) = supportedInterfaceOrientations != v47;
    v30 = [(UIScene *)self->_windowScene _effectiveUISettings];
    int v31 = [v30 _debugValidationOrientationMaskEnabled];

    BOOL v32 = supportedInterfaceOrientations == v25 && preferredInterfaceOrientation == v24;
    int v33 = !v32;
    id v10 = v46;
    if ((v21 | v31) != 1 || !v33) {
      goto LABEL_28;
    }
    windowScene = self->_windowScene;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __106___UISystemAppearanceManager_window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation___block_invoke;
    v49[3] = &unk_1E52E07C8;
    char v56 = v44;
    BOOL v57 = v21;
    char v58 = v31;
    BOOL v59 = preferredInterfaceOrientation != v48;
    unint64_t v52 = v47;
    int64_t v53 = v48;
    BOOL v60 = v45;
    id v50 = v17;
    v51 = self;
    unint64_t v54 = supportedInterfaceOrientations;
    int64_t v55 = preferredInterfaceOrientation;
    char v61 = v43;
    [(UIScene *)windowScene _updateUIClientSettingsWithUITransitionBlock:v49];
    v19 = v50;
    goto LABEL_27;
  }
LABEL_29:
}

- (void)_handleWindowVisibilityNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(_UISystemAppearanceManager *)self windowScene];
  id v19 = v4;
  unint64_t v6 = [v19 name];
  if ([v6 isEqualToString:@"UIWindowDidBecomeVisibleNotification"])
  {
  }
  else
  {
    v7 = [v19 name];
    int v8 = [v7 isEqualToString:@"UIWindowDidBecomeHiddenNotification"];

    if (!v8)
    {
LABEL_10:
      id v16 = 0;
      goto LABEL_16;
    }
  }
  v9 = [v19 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  v11 = [v19 object];
  id v12 = [v11 windowScene];
  id v13 = v5;
  uint64_t v14 = v13;
  if (v12 == v13)
  {
  }
  else
  {
    if (!v13 || !v12)
    {

LABEL_14:
      id v16 = 0;
      goto LABEL_15;
    }
    int v15 = [v12 isEqual:v13];

    if (!v15) {
      goto LABEL_14;
    }
  }
  id v16 = v11;
LABEL_15:

LABEL_16:
  if (v16)
  {
    id v17 = [(_UISystemAppearanceManager *)self previousWindowDrivingSystemAppearance];
    id v18 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
    if (v17 != v18) {
      [(_UISystemAppearanceManager *)self _windowDrivingSystemAppearanceDidChange:v18];
    }
  }
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)_windowDrivingSystemAppearanceDidChange:(id)a3
{
}

- (void)_setScene:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"_UISystemAppearanceManager.m", 71, @"Invalid parameter not satisfying: %@", @"scene == nil || [scene isKindOfClass:[UIWindowScene class]]" object file lineNumber description];
    }
  }
  objc_storeStrong((id *)&self->_windowScene, a3);
  objc_storeWeak((id *)&self->_previousWindowDrivingSystemAppearance, 0);
  v7 = [(_UISystemAppearanceManager *)self stateCaptureToken];
  [v7 invalidate];

  int v8 = NSString;
  v9 = [(UIScene *)self->_windowScene session];
  id v10 = [v9 persistentIdentifier];
  v11 = [v8 stringWithFormat:@"UIKit - UIWindowSceneOrientationState - %@", v10];

  objc_initWeak(&location, self->_windowScene);
  id v12 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v16, &location);
  BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  id v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureToken = self->_stateCaptureToken;
  self->_stateCaptureToken = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BSInvalidatable)stateCaptureToken
{
  return self->_stateCaptureToken;
}

- (void)_logOrientationPreferencesChangeWithOldSupportedOrientations:(unint64_t)a3 newSupportedOrientations:(unint64_t)a4 oldPreferredOrientation:(int64_t)a5 newPreferredOrientation:(int64_t)a6 animationSettings:(id)a7 fenced:(BOOL)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  if (a3 != a4)
  {
    int v15 = NSString;
    id v16 = BSInterfaceOrientationMaskDescription();
    id v17 = BSInterfaceOrientationMaskDescription();
    id v18 = [v15 stringWithFormat:@"%@ -> %@", v16, v17];
    [v14 addObject:v18];
  }
  if (a5 != a6)
  {
    id v19 = NSString;
    int v20 = BSInterfaceOrientationDescription();
    BOOL v21 = BSInterfaceOrientationDescription();
    id v22 = [v19 stringWithFormat:@"%@ -> %@", v20, v21];
    [v14 addObject:v22];
  }
  if (os_variant_has_internal_diagnostics())
  {
    v34 = NSString;
    uint64_t v35 = NSStringFromBOOL();
    v36 = [v34 stringWithFormat:@"fenced=%@", v35];
    [v14 addObject:v36];

    v37 = NSString;
    [v13 duration];
    v39 = objc_msgSend(v37, "stringWithFormat:", @"animationDuration=%0.4f", v38);
    [v14 addObject:v39];

    [v13 speed];
    if (v40 != 1.0)
    {
      v41 = NSString;
      [v13 speed];
      char v43 = objc_msgSend(v41, "stringWithFormat:", @"animationSpeed=%0.4f", v42);
      [v14 addObject:v43];
    }
  }
  v23 = *(id *)(__UILogGetCategoryCachedImpl("Orientation", &_logOrientationPreferencesChangeWithOldSupportedOrientations_newSupportedOrientations_oldPreferredOrientation_newPreferredOrientation_animationSettings_fenced____s_category)+ 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    if (windowScene)
    {
      unint64_t v25 = NSString;
      v26 = windowScene;
      uint64_t v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      int v29 = [v25 stringWithFormat:@"<%@: %p>", v28, v26];

      v30 = self->_windowScene;
    }
    else
    {
      v30 = 0;
      int v29 = @"(nil)";
    }
    int v31 = v29;
    BOOL v32 = [(UIScene *)v30 _persistenceIdentifier];
    int v33 = [v14 componentsJoinedByString:@"; "];
    *(_DWORD *)buf = 138412802;
    BOOL v45 = v29;
    __int16 v46 = 2112;
    unint64_t v47 = v32;
    __int16 v48 = 2112;
    v49 = v33;
    _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "%@ (%@) Scene updated orientation preferences: %@", buf, 0x20u);
  }
}

- (void)dealloc
{
  v3 = [(_UISystemAppearanceManager *)self stateCaptureToken];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)_UISystemAppearanceManager;
  [(_UISystemAppearanceManager *)&v4 dealloc];
}

- (UIScene)_scene
{
  return (UIScene *)self->_windowScene;
}

- (void)updateMultitaskingDragExclusionRects
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(_UISystemAppearanceManager *)self _findWindowDrivingSystemAppearance];
  objc_super v4 = [v3 rootViewController];
  id v5 = [v4 _effectiveViewControllerForMultitaskingDragExclusionRects];

  id v6 = [v5 _multitaskingDragExclusionRects];
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v12) CGRectValue];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        BOOL v21 = [v5 viewIfLoaded];
        objc_msgSend(v3, "convertRect:fromView:", v21, v14, v16, v18, v20);
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;

        objc_msgSend(v3, "_convertRectToSceneReferenceSpace:", v23, v25, v27, v29);
        v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
        [v7 addObject:v30];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }

  int v31 = (NSArray *)[v7 copy];
  multitaskingDragExclusionRects = self->_multitaskingDragExclusionRects;
  self->_multitaskingDragExclusionRects = v31;

  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    windowScene = self->_windowScene;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66___UISystemAppearanceManager_updateMultitaskingDragExclusionRects__block_invoke;
    v34[3] = &unk_1E52DAE80;
    v34[4] = self;
    [(UIScene *)windowScene _updateUIClientSettingsWithBlock:v34];
  }
}

- (BOOL)homeIndicatorAutoHidden
{
  return self->_homeIndicatorAutoHidden;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  return self->_screenEdgesDeferringSystemGestures;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (NSArray)multitaskingDragExclusionRects
{
  return self->_multitaskingDragExclusionRects;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (void)setWindowScene:(id)a3
{
}

- (void)setStateCaptureToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_destroyWeak((id *)&self->_previousWindowDrivingSystemAppearance);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_multitaskingDragExclusionRects, 0);
}

@end