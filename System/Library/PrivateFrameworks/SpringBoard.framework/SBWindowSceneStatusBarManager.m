@interface SBWindowSceneStatusBarManager
+ (id)windowSceneStatusBarManagerForEmbeddedDisplay;
- (BOOL)_isEmbeddedDisplay;
- (BOOL)isStatusBarEffectivelyHidden;
- (CGRect)_combineAvoidanceFrame:(CGRect)a3 withFrame:(CGRect)a4;
- (CGRect)_globalAvoidanceFrame;
- (CGRect)avoidanceFrameForStatusBar:(id)statusBar;
- (CGRect)sb_statusBarFrameForStatusBarHeight:(double)a3;
- (CGRect)statusBarFrame;
- (CGRect)statusBarWindowFrame;
- (NSString)description;
- (SBStatusBarReusePool)reusePool;
- (SBWindowSceneStatusBarAssertionManager)assertionManager;
- (SBWindowSceneStatusBarLayoutManager)layoutManager;
- (SBWindowSceneStatusBarManager)initWithScene:(id)a3;
- (UIStatusBar)statusBar;
- (UIStatusBarWindow)statusBarWindow;
- (id)_transientOverlayPresentationManagerActiveStatusBarStyleRequest;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)leadingStatusBarStyleRequest;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)trailingStatusBarStyleRequest;
- (int64_t)statusBarOrientation;
- (void)_applyAvoidanceFrameToStatusBar:(id)a3 withGlobalAvoidanceFrame:(CGRect)a4 animationSettings:(id)a5 reason:(id)a6 options:(unint64_t)a7;
- (void)sbf_addObserver:(id)a3;
- (void)sbf_removeObserver:(id)a3;
- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6;
- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6 options:(unint64_t)a7;
- (void)setStatusBarOrientation:(int64_t)a3;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBWindowSceneStatusBarManager

- (UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6 options:(unint64_t)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (!v16)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"SBWindowSceneStatusBarManager.m", 150, @"Invalid parameter not satisfying: %@", @"reason != nil" object file lineNumber description];
  }
  v19 = SBLogStatusBarish();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(CGFloat *)v50 = x;
    *(CGFloat *)&v50[1] = y;
    *(CGFloat *)&v50[2] = width;
    *(CGFloat *)&v50[3] = height;
    v20 = [MEMORY[0x1E4F29238] valueWithBytes:v50 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(_DWORD *)buf = 138412802;
    v52 = v20;
    __int16 v53 = 2114;
    id v54 = v16;
    __int16 v55 = 2048;
    id v56 = v17;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "setAvoidanceFrame:%@ reason: %{public}@ statusBar: %p", buf, 0x20u);
  }
  if (v17)
  {
    instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
    if (!instanceAvoidanceFrames)
    {
      v22 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      v23 = self->_instanceAvoidanceFrames;
      self->_instanceAvoidanceFrames = v22;

      instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
    }
    *(CGFloat *)v40 = x;
    *(CGFloat *)&v40[1] = y;
    *(CGFloat *)&v40[2] = width;
    *(CGFloat *)&v40[3] = height;
    v24 = [MEMORY[0x1E4F29238] valueWithBytes:v40 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [(NSMapTable *)instanceAvoidanceFrames setObject:v24 forKey:v17];

    [(SBWindowSceneStatusBarManager *)self _globalAvoidanceFrame];
    -[SBWindowSceneStatusBarManager _applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:](self, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", v17, v18, v16, a7);
  }
  else
  {
    if (!self->_globalAvoidanceFrames)
    {
      v25 = [MEMORY[0x1E4F1CA60] dictionary];
      globalAvoidanceFrames = self->_globalAvoidanceFrames;
      self->_globalAvoidanceFrames = v25;
    }
    *(CGFloat *)v49 = x;
    *(CGFloat *)&v49[1] = y;
    *(CGFloat *)&v49[2] = width;
    *(CGFloat *)&v49[3] = height;
    v27 = [MEMORY[0x1E4F29238] valueWithBytes:v49 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [(NSMutableDictionary *)self->_globalAvoidanceFrames setObject:v27 forKeyedSubscript:v16];

    [(SBWindowSceneStatusBarManager *)self _globalAvoidanceFrame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    reusePool = self->_reusePool;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __94__SBWindowSceneStatusBarManager_setAvoidanceFrame_reason_statusBar_animationSettings_options___block_invoke;
    v41[3] = &unk_1E6AF58C8;
    v41[4] = self;
    double v44 = v28;
    double v45 = v30;
    double v46 = v32;
    double v47 = v34;
    id v37 = v18;
    id v42 = v37;
    id v38 = v16;
    id v43 = v38;
    unint64_t v48 = a7;
    [(SBStatusBarReusePool *)reusePool enumerateStatusBars:v41];
    -[SBWindowSceneStatusBarManager _applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:](self, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", self->_statusBar, v37, v38, a7, v29, v31, v33, v35);
  }
}

- (CGRect)_globalAvoidanceFrame
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v7 = [(NSMutableDictionary *)self->_globalAvoidanceFrames allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v11) CGRectValue];
        -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:", v4, v3, v6, v5, v12, v13, v14, v15);
        double v4 = v16;
        double v3 = v17;
        double v6 = v18;
        double v5 = v19;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  double v20 = v4;
  double v21 = v3;
  double v22 = v6;
  double v23 = v5;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)_applyAvoidanceFrameToStatusBar:(id)a3 withGlobalAvoidanceFrame:(CGRect)a4 animationSettings:(id)a5 reason:(id)a6 options:(unint64_t)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  double v18 = [(NSMapTable *)self->_instanceAvoidanceFrames objectForKey:v15];
  [v18 CGRectValue];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:", x, y, width, height, v20, v22, v24, v26);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v35 = SBLogStatusBarish();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(double *)double v46 = v28;
    *(double *)&v46[1] = v30;
    *(double *)&v46[2] = v32;
    *(double *)&v46[3] = v34;
    v36 = [MEMORY[0x1E4F29238] valueWithBytes:v46 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(_DWORD *)buf = 138412802;
    v49 = v36;
    __int16 v50 = 2048;
    id v51 = v15;
    __int16 v52 = 2114;
    id v53 = v17;
    _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_INFO, "setting avoidanceFrame %@ on statusBar %p for reason: %{public}@", buf, 0x20u);
  }
  objc_msgSend(v15, "setAvoidanceFrame:animationSettings:options:", v16, a7, v28, v30, v32, v34);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v37 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v43;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v41++) statusBarManager:self didUpdateAvoidanceFrameForStatusBar:v15 withAnimationSettings:v16];
      }
      while (v39 != v41);
      uint64_t v39 = [v37 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v39);
  }
}

- (CGRect)_combineAvoidanceFrame:(CGRect)a3 withFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    if (CGRectIsEmpty(v16))
    {
      CGFloat height = v8;
      CGFloat width = v9;
      CGFloat y = v10;
      CGFloat x = v11;
    }
    else
    {
      v17.origin.CGFloat x = v11;
      v17.origin.CGFloat y = v10;
      v17.size.CGFloat width = v9;
      v17.size.CGFloat height = v8;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGRect v18 = CGRectUnion(v17, v20);
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
    }
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6
{
}

- (SBWindowSceneStatusBarAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (CGRect)sb_statusBarFrameForStatusBarHeight:(double)a3
{
  double v5 = [(UIStatusBarWindow *)self->_statusBarWindow _screen];
  [v5 _referenceBounds];

  [(SBWindowSceneStatusBarManager *)self statusBarOrientation];
  _UIWindowConvertRectFromOrientationToOrientation();
  double v9 = a3;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (int64_t)statusBarOrientation
{
  if ([(SBWindowSceneStatusBarManager *)self _isEmbeddedDisplay])
  {
    double v3 = (void *)SBApp;
    return [v3 statusBarOrientationForEmbeddedDisplay];
  }
  else
  {
    statusBarWindow = self->_statusBarWindow;
    return [(UIStatusBarWindow *)statusBarWindow orientation];
  }
}

- (BOOL)_isEmbeddedDisplay
{
  v2 = [(UIStatusBarWindow *)self->_statusBarWindow _fbsDisplayIdentity];
  char v3 = [v2 isMainDisplay];

  return v3;
}

- (SBStatusBarReusePool)reusePool
{
  return self->_reusePool;
}

- (CGRect)statusBarFrame
{
  if ([(SBWindowSceneStatusBarManager *)self isStatusBarHidden])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(SBWindowSceneStatusBarManager *)self statusBarHeight];
    -[SBWindowSceneStatusBarManager sb_statusBarFrameForStatusBarHeight:](self, "sb_statusBarFrameForStatusBarHeight:");
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

void __47__SBWindowSceneStatusBarManager_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _globalAvoidanceFrame];
  objc_msgSend(WeakRetained, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", v3, 0, @"newly created status bar", 0);
}

- (SBWindowSceneStatusBarLayoutManager)layoutManager
{
  return self->_layoutManager;
}

+ (id)windowSceneStatusBarManagerForEmbeddedDisplay
{
  v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 embeddedDisplayWindowScene];

  double v4 = [v3 statusBarManager];

  return v4;
}

- (SBWindowSceneStatusBarManager)initWithScene:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBWindowSceneStatusBarManager;
  double v6 = [(SBWindowSceneStatusBarManager *)&v35 initWithScene:v5];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    double v8 = SBSafeCast(v7, v5);
    if (!v8)
    {
      double v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:v6 file:@"SBWindowSceneStatusBarManager.m" lineNumber:65 description:@"SBWindowSceneStatusBarManager is only for use with SBWindowScenes"];
    }
    double v9 = [v8 session];
    CGFloat v10 = [v9 role];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F43F38]];

    if (v11)
    {
      double v12 = [(id)SBApp statusBarWindowForEmbeddedDisplay];
      double v13 = [(id)SBApp statusBarForEmbeddedDisplay];
      [v12 setWindowScene:v8];
    }
    else
    {
      double v14 = (objc_class *)[(id)objc_opt_class() _statusBarWindowClass];
      double v15 = (objc_class *)[(id)objc_opt_class() _statusBarClass];
      double v12 = (void *)[[v14 alloc] initWithWindowScene:v8];
      [v12 frame];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [(SBWindowSceneStatusBarManager *)v6 defaultStatusBarHeight];
      double v13 = objc_msgSend([v15 alloc], "initWithFrame:", v17, v19, v21, v22);
      [v13 setOrientation:1];
      [v13 setStyleDelegate:SBApp];
      [(SBWindowSceneStatusBarManager *)v6 updateStatusBarAppearance];
      [v12 setStatusBar:v13];
      [v12 setOrientation:1 animationParameters:0];
      [v12 setWindowLevel:*MEMORY[0x1E4F43F28]];
      [v12 _orderFrontWithoutMakingKey];
    }
    objc_storeStrong((id *)&v6->_statusBarWindow, v12);
    objc_storeStrong((id *)&v6->_statusBar, v13);
    double v23 = [[SBWindowSceneStatusBarAssertionManager alloc] initWithWindowScene:v8];
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v23;

    double v25 = [[SBWindowSceneStatusBarLayoutManager alloc] initWithWindowScene:v8];
    layoutManager = v6->_layoutManager;
    v6->_layoutManager = v25;

    double v27 = [[SBStatusBarReusePool alloc] initWithWindowScene:v8];
    reusePool = v6->_reusePool;
    v6->_reusePool = v27;

    [v13 setManager:v6->_assertionManager];
    objc_initWeak(&location, v6);
    double v29 = v6->_reusePool;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__SBWindowSceneStatusBarManager_initWithScene___block_invoke;
    v32[3] = &unk_1E6AF58A0;
    objc_copyWeak(&v33, &location);
    [(SBStatusBarReusePool *)v29 setNewStatusBarConfigurationHandler:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (CGRect)statusBarWindowFrame
{
  id v3 = [(UIStatusBarWindow *)self->_statusBarWindow windowScene];
  [v3 _referenceBounds];

  [(UIStatusBarWindow *)self->_statusBarWindow orientation];
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v7 = a3;
  id v5 = [(UIStatusBarWindow *)self->_statusBarWindow _sbWindowScene];

  if (v5 != v7)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBWindowSceneStatusBarManager.m" lineNumber:116 description:@"should connect to the window scene our status bar window is on"];
  }
  if (SBStatusBarIsSpeakeasy()) {
    [(UIStatusBarWindow *)self->_statusBarWindow windowSceneDidConnect:v7];
  }
}

- (BOOL)isStatusBarEffectivelyHidden
{
  if ([(SBWindowSceneStatusBarManager *)self isStatusBarHidden]) {
    return 1;
  }
  [(UIStatusBar *)self->_statusBar alpha];
  return v4 == 0.0;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  if ([(SBWindowSceneStatusBarManager *)self _isEmbeddedDisplay])
  {
    id v5 = (void *)SBApp;
    [v5 setStatusBarOrientation:a3 forEmbeddedDisplayAnimated:0];
  }
  else
  {
    statusBarWindow = self->_statusBarWindow;
    [(UIStatusBarWindow *)statusBarWindow setOrientation:a3 animationParameters:0];
  }
}

uint64_t __94__SBWindowSceneStatusBarManager_setAvoidanceFrame_reason_statusBar_animationSettings_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (CGRect)avoidanceFrameForStatusBar:(id)statusBar
{
  instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
  if (!statusBar) {
    statusBar = self->_statusBar;
  }
  id v5 = [(NSMapTable *)instanceAvoidanceFrames objectForKey:statusBar];
  [v5 CGRectValue];

  [(SBWindowSceneStatusBarManager *)self _globalAvoidanceFrame];
  -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:");
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (id)leadingStatusBarStyleRequest
{
  if (![(SBWindowSceneStatusBarManager *)self isStatusBarEffectivelyHidden]) {
    goto LABEL_4;
  }
  id v3 = [(SBWindowSceneStatusBarManager *)self _transientOverlayPresentationManagerActiveStatusBarStyleRequest];
  if (!v3)
  {
    double v4 = [(UIStatusBarWindow *)self->_statusBarWindow _sbWindowScene];
    id v5 = [v4 switcherController];

    id v3 = [v5 leadingStatusBarStyleRequest];

    if (!v3)
    {
LABEL_4:
      id v3 = [(SBWindowSceneStatusBarAssertionManager *)self->_assertionManager effectiveStatusBarStyleRequestWithSettings:0];
    }
  }
  return v3;
}

- (id)trailingStatusBarStyleRequest
{
  if (![(SBWindowSceneStatusBarManager *)self isStatusBarEffectivelyHidden]) {
    goto LABEL_7;
  }
  id v3 = [(SBWindowSceneStatusBarManager *)self _transientOverlayPresentationManagerActiveStatusBarStyleRequest];
  if (!v3)
  {
    double v4 = [(UIStatusBarWindow *)self->_statusBarWindow _sbWindowScene];
    id v5 = [v4 switcherController];

    double v6 = [v5 leadingStatusBarStyleRequest];
    uint64_t v7 = [v5 trailingStatusBarStyleRequest];
    double v8 = (void *)v7;
    double v9 = v7 ? (void *)v7 : v6;
    id v3 = v9;

    if (!v3)
    {
LABEL_7:
      id v3 = [(SBWindowSceneStatusBarAssertionManager *)self->_assertionManager effectiveStatusBarStyleRequestWithSettings:0];
    }
  }
  return v3;
}

- (id)_transientOverlayPresentationManagerActiveStatusBarStyleRequest
{
  v2 = [(UIStatusBarWindow *)self->_statusBarWindow _sbWindowScene];
  id v3 = [v2 transientOverlayPresenter];
  if ([v3 hasActivePresentation])
  {
    double v4 = [v3 currentStatusBarStyleRequest];

    if (v4)
    {
      double v4 = [v3 currentStatusBarStyleRequest];
    }
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBWindowSceneStatusBarManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBWindowSceneStatusBarManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBWindowSceneStatusBarManager *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWindowSceneStatusBarManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBWindowSceneStatusBarManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __71__SBWindowSceneStatusBarManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 64) _sbWindowScene];
  id v4 = [v3 succinctDescription];
  id v5 = (id)[v2 appendObject:v4 withName:@"windowScene"];

  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"status bar"];
  id v7 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"status bar window"];
  id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 112) withName:@"layout manager"];
  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 104) withName:@"assertion manager"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 120) withName:@"reuse pool"];
}

- (UIStatusBarWindow)statusBarWindow
{
  return self->_statusBarWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusePool, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_instanceAvoidanceFrames, 0);
  objc_storeStrong((id *)&self->_globalAvoidanceFrames, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWindow, 0);
}

- (void)sbf_addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)sbf_removeObserver:(id)a3
{
}

@end