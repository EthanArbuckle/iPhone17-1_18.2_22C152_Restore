@interface _UIScreenBasedWindowScene
+ (BOOL)alwaysKeepContexts;
+ (BOOL)autoInvalidates;
+ (BOOL)shouldAllowComponents;
+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4;
+ (id)unassociationCache;
+ (id)unassociationCacheAccessQueue;
- (BOOL)_shouldAllowFencing;
- (BOOL)_usesMinimumSafeAreaInsets;
- (CGRect)_referenceBounds;
- (CGRect)_referenceBoundsForOrientation:(int64_t)a3;
- (_UIScreenBasedWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5;
- (id)_displayInfoProvider;
- (id)_homeAffordanceSceneNotifier;
- (id)_preventAutoInvalidationForReason:(uint64_t)a1;
- (id)_primaryViewServiceOperator;
- (id)_synthesizedSettings;
- (id)renderingEnvironment;
- (id)screen;
- (id)systemShellHostingEnvironment;
- (void)_addSubclassDebugDescriptionWithBuilder:(id)a3;
- (void)_addSubclassFlagsToDebugDescriptionWithBuilder:(id)a3;
- (void)_attachWindow:(id)a3;
- (void)_detachWindow:(id)a3;
- (void)_invalidate;
- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_performInvalidationIfNeeded;
- (void)_removeAutoInvalidationPreventionAssertion:(id)a3;
- (void)_screenDisconnected:(id)a3;
- (void)_screenInterfaceOrientationChanged:(id)a3;
- (void)_setKeepContextAssociationInBackground:(BOOL)a3;
- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4;
@end

@implementation _UIScreenBasedWindowScene

- (id)_displayInfoProvider
{
  v2 = [(_UIScreenBasedWindowScene *)self screen];
  v3 = [v2 _displayInfoProvider];

  return v3;
}

- (id)_synthesizedSettings
{
  if (!self->_synthesizedSettings)
  {
    v3 = (UIMutableApplicationSceneSettings *)objc_opt_new();
    [(UIMutableApplicationSceneSettings *)v3 setForeground:0];
    synthesizedSettings = self->_synthesizedSettings;
    self->_synthesizedSettings = v3;
  }
  [(UIScreen *)self->_screen _referenceBounds];
  -[UIMutableApplicationSceneSettings setFrame:](self->_synthesizedSettings, "setFrame:");
  [(UIMutableApplicationSceneSettings *)self->_synthesizedSettings setArtworkSubtype:[(UIScreen *)self->_screen _artworkSubtype]];
  [(UIMutableApplicationSceneSettings *)self->_synthesizedSettings setInterfaceOrientation:[(UIScreen *)self->_screen _interfaceOrientation]];
  [(UIMutableApplicationSceneSettings *)self->_synthesizedSettings setArtworkSubtype:[(UIScreen *)self->_screen _artworkSubtype]];
  v5 = [(UIScreen *)self->_screen displayConfiguration];
  if (v5) {
    [(UIMutableApplicationSceneSettings *)self->_synthesizedSettings setDisplayConfiguration:v5];
  }
  v6 = [(UIScreen *)self->_screen traitCollection];
  -[UIMutableApplicationSceneSettings setUserInterfaceStyle:](self->_synthesizedSettings, "setUserInterfaceStyle:", [v6 userInterfaceStyle]);

  v7 = (void *)[(UIMutableApplicationSceneSettings *)self->_synthesizedSettings copy];
  return v7;
}

- (CGRect)_referenceBounds
{
  [(UIScreen *)self->_screen _unjailedReferenceBounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)screen
{
  screen = self->_screen;
  if (screen)
  {
    double v3 = screen;
  }
  else
  {
    double v3 = +[UIScreen mainScreen];
  }
  return v3;
}

+ (id)unassociationCache
{
  double v2 = [(id)objc_opt_class() unassociationCacheAccessQueue];
  dispatch_assert_queue_V2(v2);

  double v3 = (void *)unassociationCache__screenWindowSceneDictionary;
  if (!unassociationCache__screenWindowSceneDictionary)
  {
    uint64_t v4 = objc_opt_new();
    double v5 = (void *)unassociationCache__screenWindowSceneDictionary;
    unassociationCache__screenWindowSceneDictionary = v4;

    double v3 = (void *)unassociationCache__screenWindowSceneDictionary;
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v3 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = objc_opt_new();
    v9 = (void *)unassociationCache__screenWindowSceneDictionary;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 setObject:v8 forKey:v11];
  }
  return v8;
}

+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  id v6 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__26;
  v37 = __Block_byref_object_dispose__26;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__26;
  v31 = __Block_byref_object_dispose__26;
  id v32 = 0;
  v7 = [a1 unassociationCacheAccessQueue];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __70___UIScreenBasedWindowScene__unassociatedWindowSceneForScreen_create___block_invoke;
  v20 = &unk_1E52E04A8;
  v22 = &v33;
  id v8 = v6;
  id v21 = v8;
  v23 = &v27;
  v24 = &v39;
  BOOL v26 = a4;
  id v25 = a1;
  dispatch_sync(v7, &v17);

  v9 = v28;
  if (*((unsigned char *)v40 + 24) && v28[5] && v34[5])
  {
    id v10 = objc_alloc((Class)a1);
    v11 = objc_msgSend((id)v28[5], "session", v17, v18, v19, v20);
    v12 = (void *)[v10 initWithScreen:v8 session:v11 lookupKey:v34[5]];

    [(id)v28[5] setScene:v12];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"UISceneWillConnectNotification" object:v12];

    v14 = [(id)v28[5] session];
    [v14 _setScene:v12];

    v9 = v28;
  }
  v15 = objc_msgSend((id)v9[5], "scene", v17, v18, v19, v20);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v15;
}

+ (id)unassociationCacheAccessQueue
{
  if (qword_1EB25E8E8 != -1) {
    dispatch_once(&qword_1EB25E8E8, &__block_literal_global_96);
  }
  double v2 = (void *)_MergedGlobals_15_0;
  return v2;
}

- (id)_homeAffordanceSceneNotifier
{
  if (!_UIDeviceSupportsGlobalEdgeSwipeTouches()) {
    goto LABEL_6;
  }
  int v3 = _UIApplicationSupportsHomeAffordanceObservation();
  uint64_t v4 = 0;
  if (self && v3)
  {
    if (![(UIScene *)self _hostsWindows] || [(UIScene *)self _hasInvalidated])
    {
LABEL_6:
      uint64_t v4 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [(UIScene *)self _existingHomeAffordanceSceneNotifier];
    if (!v4)
    {
      [(id)UIApp isFrontBoard];
      uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithScene:self];
      [(UIWindowScene *)self _registerSceneComponent:v4 forKey:@"_UIHomeAffordanceSceneNotifierComponentKey"];
    }
  }
LABEL_7:
  return v4;
}

+ (BOOL)alwaysKeepContexts
{
  return 1;
}

+ (BOOL)shouldAllowComponents
{
  return 1;
}

+ (BOOL)autoInvalidates
{
  return 1;
}

- (_UIScreenBasedWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = objc_opt_new();
  v14 = [UISceneConnectionOptions alloc];
  v15 = objc_opt_new();
  id v16 = [(UISceneConnectionOptions *)v14 _initWithConnectionOptionsContext:v15 fbsScene:0 specification:v13];

  [v12 _resetStateRestorationToActivity:0];
  [v12 _clearAllDirtyFlags];
  objc_storeStrong((id *)&self->_screen, a3);
  objc_storeStrong((id *)&self->_lookupKey, a5);
  uint64_t v17 = (_UISceneMetricsCalculating *)objc_opt_new();
  metricsCalculator = self->super._metricsCalculator;
  self->super._metricsCalculator = v17;

  v31.receiver = self;
  v31.super_class = (Class)_UIScreenBasedWindowScene;
  v19 = [(UIWindowScene *)&v31 initWithSession:v12 connectionOptions:v16];

  if (v19)
  {
    [(UIWindowScene *)v19 _computeMetrics:0];
    if ([(id)objc_opt_class() shouldAllowComponents])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62___UIScreenBasedWindowScene_initWithScreen_session_lookupKey___block_invoke;
      aBlock[3] = &unk_1E52E04D0;
      SEL v30 = a2;
      v20 = v19;
      v28 = v20;
      id v21 = v13;
      id v29 = v21;
      v22 = _Block_copy(aBlock);
      v23 = [v21 coreSceneComponentClassDictionary];
      [v23 enumerateKeysAndObjectsUsingBlock:v22];

      v24 = [v21 baseSceneComponentClassDictionary];
      [v24 enumerateKeysAndObjectsUsingBlock:v22];

      [(UIScene *)v20 _initializeSceneComponents];
    }
    id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v19 selector:sel__screenDisconnected_ name:@"_UIScreenDidDisconnectNotification" object:v10];
    [v25 addObserver:v19 selector:sel__screenInterfaceOrientationChanged_ name:@"_UIScreenInterfaceOrientationDidChangeNotification" object:v10];
  }
  return v19;
}

- (void)_invalidate
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_UIScreenBasedWindowScene;
  [(UIWindowScene *)&v4 _invalidate];
}

- (void)_performInvalidationIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1 && a1[505] && ([a1 _hasInvalidated] & 1) == 0)
  {
    a1[505] = 0;
    double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneAutoInvalidation", _performInvalidationIfNeeded___s_category)
                      + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = v2;
      objc_super v4 = [a1 succinctDescription];
      *(_DWORD *)buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Performing invalidation for scene: %{public}@", buf, 0xCu);
    }
    [a1 _invalidate];
    double v5 = [(id)objc_opt_class() unassociationCacheAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___UIScreenBasedWindowScene__performInvalidationIfNeeded__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = a1;
    dispatch_sync(v5, block);
  }
}

- (id)_preventAutoInvalidationForReason:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && [(id)objc_opt_class() autoInvalidates] && !*(unsigned char *)(a1 + 505))
  {
    if (!*(void *)(a1 + 520))
    {
      uint64_t v6 = objc_opt_new();
      v7 = *(void **)(a1 + 520);
      *(void *)(a1 + 520) = v6;
    }
    id v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    if (!*(void *)(a1 + 512))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %p: prevent screen disconnection", Name, a1);
      uint64_t v11 = -[UIScreen _preventDisconnectionForReason:](*(void *)(a1 + 488), v10);
      id v12 = *(void **)(a1 + 512);
      *(void *)(a1 + 512) = v11;
    }
    objc_initWeak(&location, (id)a1);
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%p-%lu", Name, a1, ++qword_1EB25E8F0);
    id v14 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v15 = MEMORY[0x1E4F14428];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63___UIScreenBasedWindowScene__preventAutoInvalidationForReason___block_invoke;
    v24[3] = &unk_1E52E04F8;
    objc_copyWeak(&v25, &location);
    objc_super v4 = (void *)[v14 initWithIdentifier:v13 forReason:v3 queue:MEMORY[0x1E4F14428] invalidationBlock:v24];

    [*(id *)(a1 + 520) addObject:v4];
    id v16 = *(id *)(__UILogGetCategoryCachedImpl("SceneAutoInvalidation", &qword_1EB25E8F8) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (id *)(id)a1;
      uint64_t v18 = NSString;
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      id v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];

      id v22 = v21;
      uint64_t v23 = [v17[65] count];
      *(_DWORD *)buf = 138543874;
      id v28 = v22;
      __int16 v29 = 2048;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      id v32 = v4;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "Preventing auto invalidation of scene: %{public}@; assertionsCount: %lu; assertion: %{public}@",
        buf,
        0x20u);
    }
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)_removeAutoInvalidationPreventionAssertion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_autoInvalidationPreventionAssertions containsObject:v4] & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        autoInvalidationPreventionAssertions = self->_autoInvalidationPreventionAssertions;
        *(_DWORD *)buf = 138412546;
        id v21 = v4;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)autoInvalidationPreventionAssertions;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempting to remove untracked autoInvalidationPreventionAssertion: %@; _autoInvalidationPreventionAssertions: %@",
          buf,
          0x16u);
      }
    }
    else
    {
      id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E900) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = self->_autoInvalidationPreventionAssertions;
        *(_DWORD *)buf = 138412546;
        id v21 = v4;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v17;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Attempting to remove untracked autoInvalidationPreventionAssertion: %@; _autoInvalidationPreventionAssertions: %@",
          buf,
          0x16u);
      }
    }
  }
  double v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("SceneAutoInvalidation", &qword_1EB25E908) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSString;
    v7 = self;
    id v8 = v5;
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = [v6 stringWithFormat:@"<%@: %p>", v10, v7];

    id v12 = self->_autoInvalidationPreventionAssertions;
    id v13 = v11;
    uint64_t v14 = [(NSMutableSet *)v12 count];
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    __int16 v24 = 2114;
    id v25 = v4;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Removing autoInvalidationPreventionAssertion from scene: %{public}@; assertionsCount: %lu; assertion: %{public}@; ",
      buf,
      0x20u);
  }
  [(NSMutableSet *)self->_autoInvalidationPreventionAssertions removeObject:v4];
  if (![(NSMutableSet *)self->_autoInvalidationPreventionAssertions count])
  {
    -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](self);
    [(BSInvalidatable *)self->_screenDisconnectionPreventionAssertion invalidate];
    screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
    self->_screenDisconnectionPreventionAssertion = 0;
  }
}

- (id)_primaryViewServiceOperator
{
  id v3 = +[_UIActiveViewServiceSessionTracker sharedTracker];
  if (!-[_UIActiveViewServiceSessionTracker hasTrackedSessions]((uint64_t)v3))
  {
    id v10 = 0;
    goto LABEL_26;
  }
  id v4 = [(UIWindowScene *)self traitCollection];
  -[_UIActiveViewServiceSessionTracker mostActiveViewServiceSessionForUserInterfaceIdiom:](v3, [v4 userInterfaceIdiom]);
  double v5 = (id *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    id WeakRetained = objc_loadWeakRetained(v5 + 9);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v7 = objc_opt_class();
  id v8 = WeakRetained;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = v9;

  if (!v11) {
    goto LABEL_15;
  }
  id v12 = [v11 windowScene];
  id v13 = self;
  uint64_t v14 = v13;
  if (v12 == v13)
  {

    goto LABEL_17;
  }
  if (!v13 || !v12)
  {

    id v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  int v15 = [(_UIScreenBasedWindowScene *)v12 isEqual:v13];

  if (v15)
  {
LABEL_17:
    id v16 = [v11 rootViewController];
    uint64_t v17 = objc_opt_class();
    id v12 = v16;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v12;
      }
      else {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    id v10 = v18;
    goto LABEL_24;
  }
LABEL_15:
  id v10 = 0;
LABEL_25:

LABEL_26:
  return v10;
}

- (void)_addSubclassFlagsToDebugDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIScreenBasedWindowScene;
  [(UIScene *)&v7 _addSubclassFlagsToDebugDescriptionWithBuilder:v4];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", objc_msgSend((id)objc_opt_class(), "autoInvalidates"), @"autoInvalidates");
  id v6 = (id)[v4 appendBool:self->_needsInvalidation withName:@"needsInvalidation"];
}

- (void)_addSubclassDebugDescriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIScreenBasedWindowScene;
  [(UIScene *)&v10 _addSubclassDebugDescriptionWithBuilder:v4];
  screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
  if (screenDisconnectionPreventionAssertion) {
    id v6 = (id)[v4 appendObject:screenDisconnectionPreventionAssertion withName:@"screenDisconnectionPreventionAssertion"];
  }
  if (self->_autoInvalidationPreventionAssertions)
  {
    objc_super v7 = [v4 activeMultilinePrefix];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69___UIScreenBasedWindowScene__addSubclassDebugDescriptionWithBuilder___block_invoke;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    id v9 = v4;
    [v9 appendBodySectionWithName:@"autoInvalidationPreventionAssertions" multilinePrefix:v7 block:v8];
  }
}

- (CGRect)_referenceBoundsForOrientation:(int64_t)a3
{
  [(UIScreen *)self->_screen _unjailedReferenceBoundsForInterfaceOrientation:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4
{
}

- (void)_setKeepContextAssociationInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() alwaysKeepContexts])
  {
    id v5 = [(UIWindowScene *)self _contextBinder];
    [v5 setContextManagementPolicy:1];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIScreenBasedWindowScene;
    [(UIWindowScene *)&v6 _setKeepContextAssociationInBackground:v3];
  }
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 0;
}

- (void)_attachWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIScreenBasedWindowScene;
  [(UIWindowScene *)&v5 _attachWindow:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"_UIScreenBasedWindowSceneDidAttachWindowNotification" object:self userInfo:0];
}

- (void)_detachWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIScreenBasedWindowScene;
  [(UIWindowScene *)&v5 _detachWindow:a3];
  if ([(id)objc_opt_class() autoInvalidates]
    && !self->_invalidationEvaluatorRegistered
    && ![(UIScene *)self _hasInvalidated]
    && !self->_invalidationEvaluatorRegistered)
  {
    self->_invalidationEvaluatorRegistered = 1;
    objc_initWeak(&location, self);
    double v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke;
    v6[3] = &unk_1E52D9960;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [v4 performBlock:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v5 = a5;
  objc_super v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___UIScreenBasedWindowScene__openURL_options_completionHandler___block_invoke;
    block[3] = &unk_1E52DA040;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (BOOL)_shouldAllowFencing
{
  return 1;
}

- (void)_screenDisconnected:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 object];
    if (v7 == self->_screen)
    {
      if (self->_screenDisconnectionPreventionAssertion)
      {
        if (os_variant_has_internal_diagnostics())
        {
          id v11 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
            int v13 = 138412546;
            uint64_t v14 = v7;
            __int16 v15 = 2112;
            id v16 = screenDisconnectionPreventionAssertion;
            _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Screen is disconnecting when we have an assertion that should prevent it from doing so: %@; screenDisconne"
              "ctionPreventionAssertion: %@",
              (uint8_t *)&v13,
              0x16u);
          }
        }
        else
        {
          id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_screenDisconnected____s_category) + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            objc_super v10 = self->_screenDisconnectionPreventionAssertion;
            int v13 = 138412546;
            uint64_t v14 = v7;
            __int16 v15 = 2112;
            id v16 = v10;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Screen is disconnecting when we have an assertion that should prevent it from doing so: %@; screenDisconne"
              "ctionPreventionAssertion: %@",
              (uint8_t *)&v13,
              0x16u);
          }
        }
      }
      [(BSInvalidatable *)self->_screenDisconnectionPreventionAssertion invalidate];
      id v8 = self->_screenDisconnectionPreventionAssertion;
      self->_screenDisconnectionPreventionAssertion = 0;

      self->_needsInvalidation = 1;
      -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](self);
    }
  }
}

- (void)_screenInterfaceOrientationChanged:(id)a3
{
  id v8 = a3;
  id v4 = [v8 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v6 = v8;
  if (isKindOfClass)
  {
    id v7 = [v8 object];
    if (v7 == self->_screen) {
      [(UIWindowScene *)self _computeMetrics:0];
    }

    objc_super v6 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInvalidationPreventionAssertions, 0);
  objc_storeStrong((id *)&self->_screenDisconnectionPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_synthesizedSettings, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_lookupKey, 0);
}

- (id)systemShellHostingEnvironment
{
  BOOL v3 = [(UIScene *)self _settingsScene];
  if ([(UIScene *)self _hasSettingsScene])
  {
    id v4 = [v3 systemShellHostingEnvironment];
    goto LABEL_17;
  }
  id v5 = [(_UIScreenBasedWindowScene *)self _primaryViewServiceOperator];
  objc_super v6 = [v5 _sceneContext];
  id v7 = v6;
  if (!v6)
  {
    if (([(id)UIApp isFrontBoard] & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __int16 v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", buf, 2u);
        }
      }
      else
      {
        uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &systemShellHostingEnvironment___s_category) + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", (uint8_t *)v16, 2u);
        }
      }
    }
    id v8 = +[UIWindowScene _keyWindowScene]();
    if (v8)
    {
      id v9 = self;
      objc_super v10 = v8;
      if (v10 == v9)
      {
      }
      else
      {
        id v11 = v10;
        if (!v9)
        {

LABEL_14:
          id v4 = [(_UIScreenBasedWindowScene *)v11 systemShellHostingEnvironment];
          goto LABEL_15;
        }
        char v12 = [(_UIScreenBasedWindowScene *)v9 isEqual:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    id v4 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v4 = v6;
LABEL_16:

LABEL_17:
  return v4;
}

- (id)renderingEnvironment
{
  BOOL v3 = [(UIScene *)self _settingsScene];
  if ([(UIScene *)self _hasSettingsScene])
  {
    id v4 = [v3 renderingEnvironment];
    goto LABEL_17;
  }
  id v5 = [(_UIScreenBasedWindowScene *)self _primaryViewServiceOperator];
  objc_super v6 = [v5 _sceneContext];
  id v7 = v6;
  if (!v6)
  {
    if (([(id)UIApp isFrontBoard] & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __int16 v15 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", buf, 2u);
        }
      }
      else
      {
        uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &renderingEnvironment___s_category) + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16[0] = 0;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", (uint8_t *)v16, 2u);
        }
      }
    }
    id v8 = +[UIWindowScene _keyWindowScene]();
    if (v8)
    {
      id v9 = self;
      objc_super v10 = v8;
      if (v10 == v9)
      {
      }
      else
      {
        id v11 = v10;
        if (!v9)
        {

LABEL_14:
          id v4 = [(_UIScreenBasedWindowScene *)v11 renderingEnvironment];
          goto LABEL_15;
        }
        char v12 = [(_UIScreenBasedWindowScene *)v9 isEqual:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    id v4 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v4 = v6;
LABEL_16:

LABEL_17:
  return v4;
}

@end