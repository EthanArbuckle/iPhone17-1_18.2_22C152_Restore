@interface SBWindowScenePIPManager
- (BOOL)isPointWithinAnyPictureInPictureContent:(CGPoint)a3;
- (BOOL)isZStackForegroundActive;
- (NSDictionary)_sourceToEdgeInsets;
- (SBPIPControllerCoordinator)globalCoordinator;
- (SBWindowScene)windowScene;
- (SBWindowScenePIPManager)initWithGlobalCoordinator:(id)a3;
- (UIEdgeInsets)_minimumStashedPadding;
- (double)_keyboardFrameInScreenSpaceFromNotification:(uint64_t)a1;
- (id)_mutableWindowLevelOverrideAssertionsForContentType:(int)a3 createIfNeeded:;
- (id)_windowLevelOverrideAssertionsForContentType:(int64_t)a3;
- (id)acquireStashAssertionForReason:(int64_t)a3 identifier:(id)a4;
- (id)acquireWindowLevelOverrideAssertionForControllerWithContentType:(int64_t)a3 toWindowLevel:(unint64_t)a4 withReason:(int64_t)a5 identifier:(id)a6;
- (uint64_t)_visualizeKeyboardFrameIfNeeded;
- (void)_adjustPIPInsetsForKeyboardFrameChangeNotification:(uint64_t)a1;
- (void)_floatingDockHeightWillChange:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillRotate:(id)a3;
- (void)_keyboardWillShowOrHide:(id)a3;
- (void)_shelfHeightDidChange:(id)a3;
- (void)_systemApertureInsetsDidChange:(id)a3;
- (void)_updateFloatingDockInsetsWithoutNotifyingControllers;
- (void)_windowManagementStyleDidChange:(id)a3;
- (void)addStashTabSuppressionTarget:(id)a3 action:(SEL)a4;
- (void)applyPictureInPictureInsets:(UIEdgeInsets)a3 forSource:(int64_t)a4;
- (void)applyStashedPictureInPicturePadding:(UIEdgeInsets)a3 forPIPSource:(int64_t)a4;
- (void)configureInsetsForIconController:(id)a3;
- (void)removeStashTabSuppressionTarget:(id)a3 action:(SEL)a4;
- (void)setNeedsUpdateZStackParticipantPreferencesWithReason:(id)a3;
- (void)setSourceToEdgeInsets:(id)a3;
- (void)updatePictureInPictureWindowLevels;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBWindowScenePIPManager

- (NSDictionary)_sourceToEdgeInsets
{
  v2 = (void *)[(NSMutableDictionary *)self->_sourceToEdgeInsets copy];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  v4 = v2;

  return v4;
}

- (BOOL)isPointWithinAnyPictureInPictureContent:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v6 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBWindowScenePIPManager_isPointWithinAnyPictureInPictureContent___block_invoke;
  v10[3] = &unk_1E6AF4F90;
  CGFloat v13 = x;
  CGFloat v14 = y;
  v8 = v6;
  v11 = v8;
  v12 = &v15;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v10];
  LOBYTE(globalCoordinator) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)globalCoordinator;
}

- (void)applyPictureInPictureInsets:(UIEdgeInsets)a3 forSource:(int64_t)a4
{
  UIEdgeInsets v14 = a3;
  v6 = [MEMORY[0x1E4F29238] valueWithBytes:&v14 objCType:"{UIEdgeInsets=dddd}"];
  sourceToEdgeInsets = self->_sourceToEdgeInsets;
  v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sourceToEdgeInsets setObject:v6 forKeyedSubscript:v8];

  v9 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SBWindowScenePIPManager_applyPictureInPictureInsets_forSource___block_invoke;
  v12[3] = &unk_1E6AF4F48;
  CGFloat v13 = v9;
  v11 = v9;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v12];
}

uint64_t __65__SBWindowScenePIPManager_applyPictureInPictureInsets_forSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _edgeInsetsDidChangeOnWindowScene:*(void *)(a1 + 32)];
}

uint64_t __67__SBWindowScenePIPManager_isPointWithinAnyPictureInPictureContent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend(a2, "_isPointInsidePictureInPictureContent:onWindowScene:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (SBWindowScenePIPManager)initWithGlobalCoordinator:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBWindowScenePIPManager;
  v6 = [(SBWindowScenePIPManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalCoordinator, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    contentTypeToWindowMargins = v7->_contentTypeToWindowMargins;
    v7->_contentTypeToWindowMargins = (NSMutableDictionary *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:11];
    sourceToEdgeInsets = v7->_sourceToEdgeInsets;
    v7->_sourceToEdgeInsets = (NSMutableDictionary *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__shelfHeightDidChange_ name:@"SBSwitcherShelfHeightDidChangeNotification" object:0];
    [v12 addObserver:v7 selector:sel__systemApertureInsetsDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
    if (+[SBFloatingDockController isFloatingDockSupported])
    {
      [v12 addObserver:v7 selector:sel__floatingDockHeightWillChange_ name:@"SBFloatingDockControllerHeightWillChangeNotification" object:0];
    }
  }
  return v7;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v6 = a3;
  if (self->_windowScene)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBWindowScenePIPManager.m" lineNumber:95 description:@"Cannot assign a new window scene to a PIP manager"];
  }
  objc_storeStrong((id *)&self->_windowScene, a3);
  v7 = [_SBPIPEndStashTabSuppressionGestureManager alloc];
  uint64_t v8 = [v6 systemGestureManager];
  v9 = [(_SBPIPEndStashTabSuppressionGestureManager *)v7 initWithSystemGestureManager:v8];
  endStashTabSuppressionGestureManager = self->_endStashTabSuppressionGestureManager;
  self->_endStashTabSuppressionGestureManager = v9;

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12 = [v6 _fbsDisplayIdentity];
  int v13 = [v12 isMainDisplay];

  if (v13)
  {
    [v11 addObserver:self selector:sel__keyboardWillShowOrHide_ name:*MEMORY[0x1E4F43B40] object:0];
    [v11 addObserver:self selector:sel__keyboardWillShowOrHide_ name:*MEMORY[0x1E4F43B38] object:0];
    [v11 addObserver:self selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4F43B30] object:0];
    [v11 addObserver:self selector:sel__keyboardWillRotate_ name:*MEMORY[0x1E4F440C0] object:0];
  }
  objc_super v14 = [v6 switcherController];
  [v11 addObserver:self selector:sel__windowManagementStyleDidChange_ name:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:v14];

  globalCoordinator = self->_globalCoordinator;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__SBWindowScenePIPManager_windowSceneDidConnect___block_invoke;
  v18[3] = &unk_1E6AF4F48;
  id v19 = v6;
  id v16 = v6;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v18];
}

uint64_t __49__SBWindowScenePIPManager_windowSceneDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _windowSceneDidConnect:*(void *)(a1 + 32)];
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v5 = (SBWindowScene *)a3;
  windowScene = v5;
  if (self->_windowScene != v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBWindowScenePIPManager.m" lineNumber:115 description:@"Disconnecting an unrelated window scene"];

    windowScene = self->_windowScene;
  }
  self->_windowScene = 0;

  endStashTabSuppressionGestureManager = self->_endStashTabSuppressionGestureManager;
  self->_endStashTabSuppressionGestureManager = 0;

  globalCoordinator = self->_globalCoordinator;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SBWindowScenePIPManager_windowSceneDidDisconnect___block_invoke;
  v11[3] = &unk_1E6AF4F48;
  v12 = v5;
  v9 = v5;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v11];
}

uint64_t __52__SBWindowScenePIPManager_windowSceneDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _windowSceneDidDisconnect:*(void *)(a1 + 32)];
}

- (void)configureInsetsForIconController:(id)a3
{
  id v7 = a3;
  if (!+[SBFloatingDockController isFloatingDockSupported])
  {
    v4 = [v7 _rootFolderController];
    [v4 dockHeight];
    double v6 = v5;

    -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v6, 0.0);
  }
}

- (void)_adjustPIPInsetsForKeyboardFrameChangeNotification:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = [MEMORY[0x1E4F42F08] activeTextEffectsWindowForWindowScene:*(void *)(a1 + 80)];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v13 = -[SBWindowScenePIPManager _keyboardFrameInScreenSpaceFromNotification:](a1, v3);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v36 = v8;
    CGFloat v37 = v6;
    v49.origin.CGFloat x = v6;
    v49.origin.CGFloat y = v8;
    CGFloat v34 = v12;
    CGFloat v35 = v10;
    v49.size.CGFloat width = v10;
    v49.size.CGFloat height = v12;
    v56.origin.CGFloat x = v13;
    v56.origin.CGFloat y = v15;
    v56.size.CGFloat width = v17;
    v56.size.CGFloat height = v19;
    CGRect v50 = CGRectIntersection(v49, v56);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
    if (*(unsigned char *)(a1 + 8) && CGRectIsEmpty(v50))
    {
      if (([*(id *)(a1 + 80) isMainDisplayWindowScene] & 1) == 0) {
        [*(id *)(a1 + 72) _enumerateControllersByDescendingPriority:&__block_literal_global_4];
      }
      v24 = SBLogPIP();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:](v3);
      }
    }
    else
    {
      CGFloat v33 = width;
      v25 = SBLogPIP();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v30 = [v3 name];
        *(double *)v39 = v13;
        *(CGFloat *)&v39[1] = v15;
        *(CGFloat *)&v39[2] = v17;
        *(CGFloat *)&v39[3] = v19;
        v31 = [MEMORY[0x1E4F29238] valueWithBytes:v39 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        *(CGFloat *)v38 = x;
        *(CGFloat *)&v38[1] = y;
        *(CGFloat *)&v38[2] = width;
        *(CGFloat *)&v38[3] = height;
        v32 = [MEMORY[0x1E4F29238] valueWithBytes:v38 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        *(_DWORD *)buf = 136315906;
        v41 = "-[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]";
        __int16 v42 = 2114;
        v43 = v30;
        __int16 v44 = 2112;
        v45 = v31;
        __int16 v46 = 2114;
        v47 = v32;
        _os_log_debug_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEBUG, "insets: %s %{public}@ newFrame: %@ intersectionWithContainer: %{public}@", buf, 0x2Au);
      }
      v51.origin.CGFloat x = v13;
      v51.origin.CGFloat y = v15;
      v51.size.CGFloat width = v17;
      v51.size.CGFloat height = v19;
      double v26 = CGRectGetWidth(v51);
      v52.origin.CGFloat x = v37;
      v52.origin.CGFloat y = v36;
      v52.size.CGFloat width = v35;
      v52.size.CGFloat height = v34;
      double v27 = 0.0;
      if (v26 == CGRectGetWidth(v52))
      {
        v53.origin.CGFloat x = v37;
        v53.origin.CGFloat y = v36;
        v53.size.CGFloat width = v35;
        v53.size.CGFloat height = v34;
        double MaxY = CGRectGetMaxY(v53);
        v54.origin.CGFloat x = x;
        v54.origin.CGFloat y = y;
        v54.size.CGFloat width = v33;
        v54.size.CGFloat height = height;
        if (MaxY == CGRectGetMaxY(v54))
        {
          v55.origin.CGFloat x = x;
          v55.origin.CGFloat y = y;
          v55.size.CGFloat width = v33;
          v55.size.CGFloat height = height;
          double v27 = CGRectGetHeight(v55);
          if (+[SBSpotlightMultiplexingViewController isShownWithinWindowScene:*(void *)(a1 + 80)])
          {
            +[SBSpotlightMultiplexingViewController effectiveSpotlightSearchFieldAvoidanceHeight];
            double v27 = v27 + v29;
          }
        }
      }
      objc_msgSend((id)a1, "applyPictureInPictureInsets:forSource:", 5, 0.0, 0.0, v27, 0.0, *(void *)&v33, *(void *)&height);
    }
  }
}

- (double)_keyboardFrameInScreenSpaceFromNotification:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    double v5 = [v3 name];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F43B38]];

    if (v6)
    {
      double v7 = *MEMORY[0x1E4F1DB28];
    }
    else
    {
      CGFloat v8 = [v4 userInfo];
      double v9 = [v8 objectForKey:*MEMORY[0x1E4F43AF0]];
      [v9 rectValue];
      double v7 = v10;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;

      CGFloat v17 = [v4 userInfo];
      double v18 = [v17 objectForKey:*MEMORY[0x1E4F43AE0]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 floatValue];
        v20.origin.CGFloat x = v7;
        v20.origin.CGFloat y = v12;
        v20.size.CGFloat width = v14;
        v20.size.CGFloat height = v16;
        CGRectGetHeight(v20);
      }
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (uint64_t)_visualizeKeyboardFrameIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 80) isMainDisplayWindowScene];
    if ((result & 1) == 0)
    {
      v2 = *(void **)(v1 + 72);
      return [v2 _enumerateControllersByDescendingPriority:&__block_literal_global_4];
    }
  }
  return result;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  int v6 = [v5 objectForKey:*MEMORY[0x1E4F43B18]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    if (self && ![(SBWindowScene *)self->_windowScene isMainDisplayWindowScene]) {
      [(SBPIPControllerCoordinator *)self->_globalCoordinator _enumerateControllersByDescendingPriority:&__block_literal_global_4];
    }
    CGFloat v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBWindowScenePIPManager _keyboardWillChangeFrame:](v4);
    }
  }
  else
  {
    -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]((uint64_t)self, v4);
  }
}

- (void)_keyboardWillRotate:(id)a3
{
}

- (void)_keyboardWillShowOrHide:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  int v6 = [v5 objectForKey:*MEMORY[0x1E4F43B18]];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    if (self && ![(SBWindowScene *)self->_windowScene isMainDisplayWindowScene]) {
      [(SBPIPControllerCoordinator *)self->_globalCoordinator _enumerateControllersByDescendingPriority:&__block_literal_global_4];
    }
    CGFloat v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBWindowScenePIPManager _keyboardWillShowOrHide:](v4);
    }
  }
  else
  {
    double v9 = [v4 name];
    self->_assumingKeyboardIsVisible = [v9 isEqualToString:*MEMORY[0x1E4F43B40]];

    -[SBWindowScenePIPManager _adjustPIPInsetsForKeyboardFrameChangeNotification:]((uint64_t)self, v4);
  }
}

- (void)_updateFloatingDockInsetsWithoutNotifyingControllers
{
  id v3 = [(SBWindowScenePIPManager *)self windowScene];
  if ([v3 isMainDisplayWindowScene])
  {
    id v4 = [v3 floatingDockController];
    int v5 = [v4 isFloatingDockPresented];
    uint64_t v6 = 0;
    if (v5) {
      objc_msgSend(v4, "floatingDockHeight", 0.0);
    }
    v8[0] = 0;
    v8[1] = 0;
    v8[2] = v6;
    v8[3] = 0;
    char v7 = [MEMORY[0x1E4F29238] valueWithBytes:v8 objCType:"{UIEdgeInsets=dddd}"];
    [(NSMutableDictionary *)self->_sourceToEdgeInsets setObject:v7 forKeyedSubscript:&unk_1F3349008];
  }
}

- (void)_floatingDockHeightWillChange:(id)a3
{
  id v10 = a3;
  id v4 = [(SBWindowScene *)self->_windowScene floatingDockController];
  int v5 = [v10 object];

  if (v5 == v4)
  {
    uint64_t v6 = [v10 userInfo];
    char v7 = [v6 objectForKey:@"SBFloatingDockControllerHeight"];
    [v7 doubleValue];
    double v9 = v8;

    -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 7, 0.0, 0.0, v9, 0.0);
  }
}

- (void)_shelfHeightDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:@"SBSwitcherShelfHeight"];
  [v5 floatValue];
  double v7 = v6;

  -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 9, 0.0, 0.0, v7, 0.0);
}

- (void)_systemApertureInsetsDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:@"SBSystemApertureEdgeInsets"];
  [v5 UIEdgeInsetsValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[SBWindowScenePIPManager applyPictureInPictureInsets:forSource:](self, "applyPictureInPictureInsets:forSource:", 10, v7, v9, v11, v13);
}

uint64_t __58__SBWindowScenePIPManager__visualizeKeyboardFrameIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _visualizeKeyboardFrameIfNeeded];
}

- (id)acquireStashAssertionForReason:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  double v8 = SBStringForPIPBehaviorOverrideReason(a3);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke;
  v25[3] = &unk_1E6AF4FB8;
  objc_copyWeak(&v26, &location);
  double v9 = (void *)[v7 initWithIdentifier:v6 forReason:v8 invalidationBlock:v25];

  double v10 = self->_windowScene;
  double v11 = [[SBPIPCompoundAssertion alloc] initWithIdentifier:v6 reason:a3];
  globalCoordinator = self->_globalCoordinator;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke_2;
  v22 = &unk_1E6AF4FE0;
  double v13 = v11;
  v23 = v13;
  CGFloat v14 = v10;
  v24 = v14;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:&v19];
  stashAssertionsToCompoundAssertionMap = self->_stashAssertionsToCompoundAssertionMap;
  if (!stashAssertionsToCompoundAssertionMap)
  {
    objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v19, v20, v21, v22, v23);
    CGFloat v16 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    CGFloat v17 = self->_stashAssertionsToCompoundAssertionMap;
    self->_stashAssertionsToCompoundAssertionMap = v16;

    stashAssertionsToCompoundAssertionMap = self->_stashAssertionsToCompoundAssertionMap;
  }
  -[NSMapTable setObject:forKey:](stashAssertionsToCompoundAssertionMap, "setObject:forKey:", v13, v9, v19, v20, v21, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v9;
}

void __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = [WeakRetained[6] objectForKey:v6];
    [v5 invalidate];
    [v4[6] removeObjectForKey:v6];
  }
}

uint64_t __69__SBWindowScenePIPManager_acquireStashAssertionForReason_identifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAssertionForController:a2 windowScene:*(void *)(a1 + 40)];
}

- (void)applyStashedPictureInPicturePadding:(UIEdgeInsets)a3 forPIPSource:(int64_t)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  if (!self->_contentTypeToStashedPadding)
  {
    double v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    contentTypeToStashedPadding = self->_contentTypeToStashedPadding;
    self->_contentTypeToStashedPadding = v10;
  }
  *(CGFloat *)uint64_t v20 = top;
  *(CGFloat *)&v20[1] = left;
  *(CGFloat *)&v20[2] = bottom;
  *(CGFloat *)&v20[3] = right;
  double v12 = [MEMORY[0x1E4F29238] valueWithBytes:v20 objCType:"{UIEdgeInsets=dddd}"];
  double v13 = self->_contentTypeToStashedPadding;
  CGFloat v14 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

  double v15 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__SBWindowScenePIPManager_applyStashedPictureInPicturePadding_forPIPSource___block_invoke;
  v18[3] = &unk_1E6AF4F48;
  uint64_t v19 = v15;
  CGFloat v17 = v15;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v18];
}

uint64_t __76__SBWindowScenePIPManager_applyStashedPictureInPicturePadding_forPIPSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _minimumStashedPaddingDidChangeOnWindowScene:*(void *)(a1 + 32)];
}

- (UIEdgeInsets)_minimumStashedPadding
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v4 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_contentTypeToStashedPadding;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_contentTypeToStashedPadding, "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * v11), (void)v21);
        [v12 UIEdgeInsetsValue];

        UIEdgeInsetsMax();
        double v4 = v13;
        double v3 = v14;
        double v6 = v15;
        double v5 = v16;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  double v17 = v4;
  double v18 = v3;
  double v19 = v6;
  double v20 = v5;
  result.CGFloat right = v20;
  result.CGFloat bottom = v19;
  result.CGFloat left = v18;
  result.CGFloat top = v17;
  return result;
}

- (void)addStashTabSuppressionTarget:(id)a3 action:(SEL)a4
{
}

- (void)removeStashTabSuppressionTarget:(id)a3 action:(SEL)a4
{
}

- (id)acquireWindowLevelOverrideAssertionForControllerWithContentType:(int64_t)a3 toWindowLevel:(unint64_t)a4 withReason:(int64_t)a5 identifier:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  if (!a5)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBWindowScenePIPManager.m", 343, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  double v12 = [SBPIPWindowLevelOverrideAssertion alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __127__SBWindowScenePIPManager_acquireWindowLevelOverrideAssertionForControllerWithContentType_toWindowLevel_withReason_identifier___block_invoke;
  v19[3] = &unk_1E6AF5008;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  double v13 = [(SBPIPWindowLevelOverrideAssertion *)v12 initWithWindowLevel:a4 reason:a5 identifier:v11 invalidationBlock:v19];
  if (v13)
  {
    double v14 = SBLogPIP();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v23 = v13;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[Assertions] Window level assertion was acquired: %{public}@", buf, 0xCu);
    }

    double v15 = -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)self, a3, 1);
    [v15 addObject:v13];

    double v16 = [(SBPIPControllerCoordinator *)self->_globalCoordinator controllerForType:a3];
    [v16 updatePictureInPictureWindowLevelForWindowScene:self->_windowScene];
  }
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v13;
}

void __127__SBWindowScenePIPManager_acquireWindowLevelOverrideAssertionForControllerWithContentType_toWindowLevel_withReason_identifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)WeakRetained, *(void *)(a1 + 40), 0);
    [v6 removeObject:v3];

    id v7 = SBLogPIP();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] Window level assertion was invalidated: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [v5[9] controllerForType:*(void *)(a1 + 40)];
    [v8 updatePictureInPictureWindowLevelForWindowScene:v5[10]];
  }
}

- (id)_mutableWindowLevelOverrideAssertionsForContentType:(int)a3 createIfNeeded:
{
  if (a1)
  {
    double v6 = *(void **)(a1 + 32);
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = a3 == 0;
    }
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      int v9 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v8;

      double v6 = *(void **)(a1 + 32);
    }
    id v10 = [NSNumber numberWithInteger:a2];
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];

    if (v11) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = a3 == 0;
    }
    if (!v12)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      double v13 = *(void **)(a1 + 32);
      double v14 = [NSNumber numberWithInteger:a2];
      [v13 setObject:v11 forKeyedSubscript:v14];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)_windowLevelOverrideAssertionsForContentType:(int64_t)a3
{
  id v3 = -[SBWindowScenePIPManager _mutableWindowLevelOverrideAssertionsForContentType:createIfNeeded:]((uint64_t)self, a3, 0);
  double v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)updatePictureInPictureWindowLevels
{
  id v3 = self->_windowScene;
  globalCoordinator = self->_globalCoordinator;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBWindowScenePIPManager_updatePictureInPictureWindowLevels__block_invoke;
  v6[3] = &unk_1E6AF4F48;
  BOOL v7 = v3;
  id v5 = v3;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v6];
}

uint64_t __61__SBWindowScenePIPManager_updatePictureInPictureWindowLevels__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePictureInPictureWindowLevelForWindowScene:*(void *)(a1 + 32)];
}

- (void)setNeedsUpdateZStackParticipantPreferencesWithReason:(id)a3
{
  [(SBFZStackParticipant *)self->_zStackParticipant setNeedsUpdatePreferencesWithReason:a3];
  if (!self->_zStackParticipant)
  {
    double v4 = [(SBWindowScenePIPManager *)self windowScene];
    id v7 = [v4 zStackResolver];

    id v5 = [v7 acquireParticipantWithIdentifier:16 delegate:self];
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v5;
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v5 = a4;
  double v6 = [(SBWindowScenePIPManager *)self windowScene];
  globalCoordinator = self->_globalCoordinator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SBWindowScenePIPManager_zStackParticipant_updatePreferences___block_invoke;
  v10[3] = &unk_1E6AF5030;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v10];
}

uint64_t __63__SBWindowScenePIPManager_zStackParticipant_updatePreferences___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateZStackParticipantPreferencesIfNeeded:*(void *)(a1 + 32) windowScene:*(void *)(a1 + 40)];
}

- (BOOL)isZStackForegroundActive
{
  return [(SBFZStackParticipant *)self->_zStackParticipant activationState] == 0;
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  double v4 = [(SBWindowScene *)self->_windowScene switcherController];
  char v5 = [v4 isChamoisWindowingUIEnabled];

  globalCoordinator = self->_globalCoordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SBWindowScenePIPManager__windowManagementStyleDidChange___block_invoke;
  v7[3] = &unk_1E6AF5058;
  char v8 = v5;
  v7[4] = self;
  [(SBPIPControllerCoordinator *)globalCoordinator _enumerateControllersByDescendingPriority:v7];
}

uint64_t __59__SBWindowScenePIPManager__windowManagementStyleDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnhancedWindowingModeEnabled:*(unsigned __int8 *)(a1 + 40) windowScene:*(void *)(*(void *)(a1 + 32) + 80)];
}

- (SBPIPControllerCoordinator)globalCoordinator
{
  return self->_globalCoordinator;
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setSourceToEdgeInsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_globalCoordinator, 0);
  objc_storeStrong((id *)&self->_endStashTabSuppressionGestureManager, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_stashAssertionsToCompoundAssertionMap, 0);
  objc_storeStrong((id *)&self->_sourceToEdgeInsets, 0);
  objc_storeStrong((id *)&self->_contentTypeToWindowLevelOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_contentTypeToWindowMargins, 0);
  objc_storeStrong((id *)&self->_contentTypeToStashedPadding, 0);
}

- (void)_adjustPIPInsetsForKeyboardFrameChangeNotification:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_keyboardWillChangeFrame:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_keyboardWillShowOrHide:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "insets: %s ignoring %{public}@", v4, v5, v6, v7, 2u);
}

@end