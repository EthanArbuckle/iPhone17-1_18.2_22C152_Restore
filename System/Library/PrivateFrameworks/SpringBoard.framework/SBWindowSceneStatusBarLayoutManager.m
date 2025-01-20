@interface SBWindowSceneStatusBarLayoutManager
- (BOOL)statusBarOrientationShouldFollowWindow:(id)a3;
- (NSString)description;
- (SBWindowSceneStatusBarLayoutManager)initWithWindowScene:(id)a3;
- (UIEdgeInsets)statusBarEdgeInsets;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)orientationWindowForLayoutLayer:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)topmostActiveLayoutLayer;
- (void)_applyEdgeInsetsToStatusBar;
- (void)_updateStatusBarOrientationForTopMostActiveLayer;
- (void)_updateWindowLevel;
- (void)addActiveLayoutLayer:(unint64_t)a3;
- (void)removeActiveLayoutLayer:(unint64_t)a3;
- (void)removeWindowLevelOverrideReason:(id)a3;
- (void)setDefaultWindowLevel:(double)a3;
- (void)setOrientationWindow:(id)a3 forStatusBarLayoutLayer:(unint64_t)a4;
- (void)setStatusBarEdgeInsets:(UIEdgeInsets)a3 forLayoutLayer:(unint64_t)a4;
- (void)setWindowLevel:(double)a3 forOverrideReason:(id)a4;
@end

@implementation SBWindowSceneStatusBarLayoutManager

- (UIEdgeInsets)statusBarEdgeInsets
{
  edgeInsetsDictionary = self->_edgeInsetsDictionary;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  v4 = [(NSMutableDictionary *)edgeInsetsDictionary objectForKey:v3];
  [v4 UIEdgeInsetsValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (unint64_t)topmostActiveLayoutLayer
{
  v2 = [(NSMutableSet *)self->_activeLayoutLayers allObjects];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  v4 = [v3 lastObject];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (SBWindowSceneStatusBarLayoutManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBWindowSceneStatusBarLayoutManager;
  unint64_t v5 = [(SBWindowSceneStatusBarLayoutManager *)&v19 init];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    v6->_defaultWindowLevel = *MEMORY[0x1E4F43F28] + -1.0;
    double v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    windowLevelOverrideReasons = v6->_windowLevelOverrideReasons;
    v6->_windowLevelOverrideReasons = v7;

    double v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    windowLevelOverrideMap = v6->_windowLevelOverrideMap;
    v6->_windowLevelOverrideMap = v9;

    double v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    orientationWindowDictionary = v6->_orientationWindowDictionary;
    v6->_orientationWindowDictionary = v11;

    objc_initWeak(&location, v6);
    id v13 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v17, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v6->_stateCaptureAssertion;
    v6->_stateCaptureAssertion = (BSInvalidatable *)v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __59__SBWindowSceneStatusBarLayoutManager_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)addActiveLayoutLayer:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableSet *)self->_activeLayoutLayers count];
  activeLayoutLayers = self->_activeLayoutLayers;
  if (!activeLayoutLayers)
  {
    double v7 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F334B828, 0);
    double v8 = self->_activeLayoutLayers;
    self->_activeLayoutLayers = v7;

    activeLayoutLayers = self->_activeLayoutLayers;
  }
  double v9 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)activeLayoutLayers addObject:v9];

  if ([(NSMutableSet *)self->_activeLayoutLayers count] != v5)
  {
    [(SBWindowSceneStatusBarLayoutManager *)self _updateStatusBarOrientationForTopMostActiveLayer];
    double v10 = SBLogStatusBarish();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBWindowSceneStatusBarLayoutManager addActiveLayoutLayer:](a3, v10);
    }

    [(SBWindowSceneStatusBarLayoutManager *)self _applyEdgeInsetsToStatusBar];
  }
}

- (void)removeActiveLayoutLayer:(unint64_t)a3
{
  if (!a3)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBWindowSceneStatusBarLayoutManager.m", 84, @"Invalid parameter not satisfying: %@", @"layoutLayer != SBWindowSceneStatusBarLayoutLayerHomeScreen" object file lineNumber description];
  }
  uint64_t v5 = [(NSMutableSet *)self->_activeLayoutLayers count];
  activeLayoutLayers = self->_activeLayoutLayers;
  double v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)activeLayoutLayers removeObject:v7];

  if ([(NSMutableSet *)self->_activeLayoutLayers count] != v5)
  {
    [(SBWindowSceneStatusBarLayoutManager *)self _updateStatusBarOrientationForTopMostActiveLayer];
    double v8 = SBLogStatusBarish();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SBWindowSceneStatusBarLayoutManager removeActiveLayoutLayer:](a3, v8);
    }

    [(SBWindowSceneStatusBarLayoutManager *)self _applyEdgeInsetsToStatusBar];
  }
}

- (void)setStatusBarEdgeInsets:(UIEdgeInsets)a3 forLayoutLayer:(unint64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  edgeInsetsDictionary = self->_edgeInsetsDictionary;
  if (!edgeInsetsDictionary)
  {
    double v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v12 = self->_edgeInsetsDictionary;
    self->_edgeInsetsDictionary = v11;

    edgeInsetsDictionary = self->_edgeInsetsDictionary;
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", top, left, bottom, right);
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)edgeInsetsDictionary setObject:v13 forKey:v14];

  [(SBWindowSceneStatusBarLayoutManager *)self _applyEdgeInsetsToStatusBar];
}

- (void)setDefaultWindowLevel:(double)a3
{
  self->_defaultWindowLevel = a3;
  [(SBWindowSceneStatusBarLayoutManager *)self _updateWindowLevel];
}

- (void)setWindowLevel:(double)a3 forOverrideReason:(id)a4
{
  id v7 = a4;
  id v11 = v7;
  if (!v7)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBWindowSceneStatusBarLayoutManager.m" lineNumber:122 description:@"windowLevelOverrideReason is not valid"];

    id v7 = 0;
  }
  [(NSMutableOrderedSet *)self->_windowLevelOverrideReasons addObject:v7];
  windowLevelOverrideMap = self->_windowLevelOverrideMap;
  double v9 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)windowLevelOverrideMap setObject:v9 forKey:v11];

  [(SBWindowSceneStatusBarLayoutManager *)self _updateWindowLevel];
}

- (void)removeWindowLevelOverrideReason:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBWindowSceneStatusBarLayoutManager.m" lineNumber:131 description:@"windowLevelOverrideReason is not valid"];

    id v5 = 0;
  }
  [(NSMutableOrderedSet *)self->_windowLevelOverrideReasons removeObject:v5];
  [(NSMutableDictionary *)self->_windowLevelOverrideMap removeObjectForKey:v7];
  [(SBWindowSceneStatusBarLayoutManager *)self _updateWindowLevel];
}

- (void)setOrientationWindow:(id)a3 forStatusBarLayoutLayer:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = SBLogStatusBarish();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a4 > 2) {
      double v8 = @"invalid";
    }
    else {
      double v8 = off_1E6B0EC00[a4];
    }
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Updating window for status bar orientation updates to %@ for layer %@.", (uint8_t *)&v11, 0x16u);
  }

  if (v6)
  {
    orientationWindowDictionary = self->_orientationWindowDictionary;
    double v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)orientationWindowDictionary setObject:v6 forKey:v10];
  }
}

- (BOOL)statusBarOrientationShouldFollowWindow:(id)a3
{
  orientationWindowDictionary = self->_orientationWindowDictionary;
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  id v8 = [(NSMutableDictionary *)orientationWindowDictionary objectForKey:v7];

  return v8 == v6;
}

- (id)orientationWindowForLayoutLayer:(unint64_t)a3
{
  orientationWindowDictionary = self->_orientationWindowDictionary;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)orientationWindowDictionary objectForKey:v4];

  return v5;
}

- (void)_updateWindowLevel
{
  double defaultWindowLevel = self->_defaultWindowLevel;
  if ([(NSMutableOrderedSet *)self->_windowLevelOverrideReasons count])
  {
    windowLevelOverrideMap = self->_windowLevelOverrideMap;
    id v5 = [(NSMutableOrderedSet *)self->_windowLevelOverrideReasons firstObject];
    id v6 = [(NSMutableDictionary *)windowLevelOverrideMap objectForKey:v5];
    [v6 floatValue];
    double defaultWindowLevel = v7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v8 = [WeakRetained statusBarManager];
  double v9 = [v8 statusBarWindow];
  [v9 setWindowLevel:defaultWindowLevel];
}

- (void)_applyEdgeInsetsToStatusBar
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v4 = [WeakRetained statusBarManager];

  id v5 = [v4 statusBarWindow];
  [v4 statusBarWindowFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SBWindowSceneStatusBarLayoutManager *)self statusBarEdgeInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = SBLogStatusBarish();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v40.double top = v15;
    v40.double left = v17;
    v40.double bottom = v19;
    v40.double right = v21;
    v31 = NSStringFromUIEdgeInsets(v40);
    unint64_t v32 = [(SBWindowSceneStatusBarLayoutManager *)self topmostActiveLayoutLayer];
    if (v32 > 2) {
      v33 = @"invalid";
    }
    else {
      v33 = off_1E6B0EC00[v32];
    }
    int v34 = 138412546;
    v35 = v31;
    __int16 v36 = 2112;
    v37 = v33;
    _os_log_debug_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEBUG, "Updating status bar insets to %@ for active layout layer %@", (uint8_t *)&v34, 0x16u);
  }
  double v23 = v7 + v17;
  double v24 = v9 + v15;
  double v25 = v11 - (v17 + v21);
  double v26 = v13 - (v15 + v19);
  [v5 frame];
  v41.origin.x = v27;
  v41.origin.y = v28;
  v41.size.width = v29;
  v41.size.height = v30;
  v39.origin.x = v23;
  v39.origin.y = v24;
  v39.size.width = v25;
  v39.size.height = v26;
  if (!CGRectEqualToRect(v39, v41)) {
    objc_msgSend(v5, "setFrame:", v23, v24, v25, v26);
  }
}

- (void)_updateStatusBarOrientationForTopMostActiveLayer
{
  orientationWindowDictionary = self->_orientationWindowDictionary;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBWindowSceneStatusBarLayoutManager topmostActiveLayoutLayer](self, "topmostActiveLayoutLayer"));
  id v7 = [(NSMutableDictionary *)orientationWindowDictionary objectForKeyedSubscript:v4];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v6 = [WeakRetained statusBarManager];
    objc_msgSend(v6, "setStatusBarOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  }
}

- (NSString)description
{
  return (NSString *)[(SBWindowSceneStatusBarLayoutManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBWindowSceneStatusBarLayoutManager *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBWindowSceneStatusBarLayoutManager_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v4 = v3;
  id v9 = v4;
  double v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

id __65__SBWindowSceneStatusBarLayoutManager_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) topmostActiveLayoutLayer];
  if (v3 > 2) {
    id v4 = @"invalid";
  }
  else {
    id v4 = off_1E6B0EC00[v3];
  }
  id v5 = (id)[v2 appendObject:v4 withName:@"topmostActiveLayoutLayer"];
  return (id)[*(id *)(a1 + 32) appendFloat:@"defaultWindowLevel" withName:*(double *)(*(void *)(a1 + 40) + 48)];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBWindowSceneStatusBarLayoutManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v7 = v6;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
  id v4 = [WeakRetained _sceneIdentifier];
  id v5 = (id)[v2 appendObject:v4 withName:@"windowScene identifier"];

  id v6 = *(void **)(a1 + 32);
  unint64_t v7 = [*(id *)(a1 + 40) topmostActiveLayoutLayer];
  if (v7 > 2) {
    id v8 = @"invalid";
  }
  else {
    id v8 = off_1E6B0EC00[v7];
  }
  id v9 = (id)[v6 appendObject:v8 withName:@"topmostActiveLayoutLayer"];
  id v10 = (id)[*(id *)(a1 + 32) appendFloat:@"defaultWindowLevel" withName:*(double *)(*(void *)(a1 + 40) + 48)];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"window level overrides" skipIfEmpty:1];
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  double v12 = *(void **)(*(void *)(a1 + 40) + 24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v22[3] = &unk_1E6B0EBB8;
  id v23 = v11;
  id v13 = v11;
  objc_msgSend(v12, "bs_each:", v22);
  [*(id *)(a1 + 32) appendDictionarySection:v13 withName:@"edge insets (by layer)" skipIfEmpty:1];
  double v14 = [MEMORY[0x1E4F1CA60] dictionary];
  double v15 = *(void **)(*(void *)(a1 + 40) + 40);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  double v19 = __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  double v20 = &unk_1E6B0EBE0;
  id v21 = v14;
  id v16 = v14;
  objc_msgSend(v15, "bs_each:", &v17);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", v16, @"orientation windows (by layer)", 1, v17, v18, v19, v20);
}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 UIEdgeInsetsValue];
  NSStringFromUIEdgeInsets(v10);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 > 2) {
    unint64_t v7 = @"invalid";
  }
  else {
    unint64_t v7 = off_1E6B0EC00[v6];
  }
  [*(id *)(a1 + 32) setValue:v8 forKey:v7];
}

void __77__SBWindowSceneStatusBarLayoutManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  unint64_t v5 = [a2 unsignedIntegerValue];
  if (v5 > 2) {
    unint64_t v6 = @"invalid";
  }
  else {
    unint64_t v6 = off_1E6B0EC00[v5];
  }
  [*(id *)(a1 + 32) setValue:v7 forKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_orientationWindowDictionary, 0);
  objc_storeStrong((id *)&self->_activeLayoutLayers, 0);
  objc_storeStrong((id *)&self->_edgeInsetsDictionary, 0);
  objc_storeStrong((id *)&self->_windowLevelOverrideMap, 0);
  objc_storeStrong((id *)&self->_windowLevelOverrideReasons, 0);
}

- (void)addActiveLayoutLayer:(unint64_t)a1 .cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1 > 2) {
    v2 = @"invalid";
  }
  else {
    v2 = off_1E6B0EC00[a1];
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Adding status bar active layout layer %@", (uint8_t *)&v3, 0xCu);
}

- (void)removeActiveLayoutLayer:(unint64_t)a1 .cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1 > 2) {
    v2 = @"invalid";
  }
  else {
    v2 = off_1E6B0EC00[a1];
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Removing status bar active layout layer %@", (uint8_t *)&v3, 0xCu);
}

@end