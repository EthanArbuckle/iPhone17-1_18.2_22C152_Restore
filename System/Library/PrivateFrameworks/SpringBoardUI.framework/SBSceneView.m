@interface SBSceneView
+ (id)defaultDisplayModeAnimationFactory;
- (BOOL)_addContentLikeViewToHierarchyForTransitionIfPossible:(id)a3;
- (BOOL)_contentPrefersToDisableClipping;
- (BOOL)_representsTranslucentContent;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldObserveSceneHostContentState;
- (BOOL)_shouldViewBeInHierarchyForTransition:(id)a3;
- (BOOL)_wantsBlackBackground;
- (BOOL)placeholderContentEnabled;
- (BOOL)rendersAsynchronously;
- (BOOL)resizesHostedContext;
- (CGSize)referenceSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (NSString)minificationFilter;
- (SBSceneHandle)sceneHandle;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (SBScenePlaceholderContentViewProvider)placeholderContentProvider;
- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7;
- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 orientation:(int64_t)a5;
- (SBSceneViewDelegate)delegate;
- (UIEdgeInsets)_contentContainerEdgeInsets;
- (UIScenePresenter)presenter;
- (UIView)backgroundView;
- (UIView)customContentView;
- (double)_contentContainerCornerRadius;
- (id)_transitionViewForHostView;
- (id)_viewForDisplayMode:(int64_t)a3;
- (id)acquireLiveContentDisableAssertionForReason:(id)a3;
- (id)newSnapshot;
- (int64_t)_bestDisplayModeLessThanMode:(int64_t)a3;
- (int64_t)displayMode;
- (int64_t)effectiveDisplayMode;
- (int64_t)orientation;
- (int64_t)preferredStatusBarStyle;
- (void)_clearSnapshotViews;
- (void)_configureBackgroundColorForLiveSnapshot:(BOOL)a3;
- (void)_configureLiveHostView;
- (void)_configureLiveSnapshotView;
- (void)_configurePlaceholderContentView;
- (void)_configureSceneLiveHostView:(id)a3;
- (void)_configureSceneLiveSnapshotView:(id)a3;
- (void)_configureViewForEffectiveDisplayMode:(int64_t)a3;
- (void)_containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3;
- (void)_enableHostingIfPossible;
- (void)_evaluateEffectiveDisplayModeWithAnimationFactory:(id)a3 completion:(id)a4;
- (void)_hotSwapLiveSnapshotView;
- (void)_hotSwapPlaceholderContentView;
- (void)_invalidateContentPrefersToDisableClipping;
- (void)_invalidateHostPresenter;
- (void)_layoutLiveHostView:(id)a3;
- (void)_layoutLiveSnapshotView:(id)a3;
- (void)_modifyPresentationContext:(id)a3;
- (void)_placeholderVisibilityChanged;
- (void)_recheckLiveContentDependencies;
- (void)_refresh;
- (void)_reloadPlaceholderContentIfNecessary;
- (void)_setOrientation:(int64_t)a3;
- (void)_transitionFromDisplayMode:(int64_t)a3 showingView:(id)a4 toDisplayMode:(int64_t)a5 showingView:(id)a6 withAnimationFactory:(id)a7 completion:(id)a8;
- (void)_updateBackgroundColor;
- (void)_updateBackgroundViewContainment;
- (void)_updateLiveContentRendering;
- (void)_updateLiveViewContainment;
- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4;
- (void)_updateResizesHostedContext;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)placeholderContentViewProviderContentDidUpdate:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)setBackgroundView:(id)a3;
- (void)setCustomContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setMinificationFilter:(id)a3;
- (void)setPlaceholderContentContext:(id)a3;
- (void)setPlaceholderContentEnabled:(BOOL)a3;
- (void)setPlaceholderContentProvider:(id)a3;
- (void)setRendersAsynchronously:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
@end

@implementation SBSceneView

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  if (self->_resizesHostedContext != a3)
  {
    self->_resizesHostedContext = a3;
    [(SBSceneView *)self _updateResizesHostedContext];
  }
}

- (id)_transitionViewForHostView
{
  return self->_hostView;
}

- (void)_configureSceneLiveHostView:(id)a3
{
  id v6 = a3;
  v4 = [v6 superview];
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v4 != sceneContentContainerView) {
    [(UIView *)self->_sceneContentContainerView addSubview:v6];
  }
  [(SBSceneView *)self _layoutLiveHostView:v6];
  [(SBSceneView *)self setNeedsLayout];
}

- (void)setPlaceholderContentProvider:(id)a3
{
  v5 = (SBScenePlaceholderContentViewProvider *)a3;
  placeholderContentProvider = self->_placeholderContentProvider;
  if (placeholderContentProvider != v5)
  {
    v7 = v5;
    [(SBScenePlaceholderContentViewProvider *)placeholderContentProvider setDelegate:0];
    objc_storeStrong((id *)&self->_placeholderContentProvider, a3);
    [(SBScenePlaceholderContentViewProvider *)self->_placeholderContentProvider setDelegate:self];
    placeholderContentProvider = (SBScenePlaceholderContentViewProvider *)[(SBSceneView *)self _reloadPlaceholderContentIfNecessary];
    v5 = v7;
  }

  MEMORY[0x270F9A758](placeholderContentProvider, v5);
}

- (void)setPlaceholderContentContext:(id)a3
{
  v5 = (SBScenePlaceholderContentContext *)a3;
  p_placeholderContentContext = &self->_placeholderContentContext;
  if (self->_placeholderContentContext != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_placeholderContentContext, a3);
    p_placeholderContentContext = (SBScenePlaceholderContentContext **)[(SBSceneView *)self _reloadPlaceholderContentIfNecessary];
    v5 = v7;
  }

  MEMORY[0x270F9A758](p_placeholderContentContext, v5);
}

- (void)_reloadPlaceholderContentIfNecessary
{
  if (self->_effectiveDisplayMode != 2) {
    return;
  }
  id v6 = self->_placeholderContentView;
  [(SBScenePlaceholderContentView *)self->_placeholderContentView removeFromSuperview];
  placeholderContentView = self->_placeholderContentView;
  self->_placeholderContentView = 0;

  [(SBSceneView *)self _configurePlaceholderContentView];
  v4 = self->_placeholderContentView;
  if (v4)
  {
    [(SBSceneView *)self _transitionFromDisplayMode:self->_effectiveDisplayMode showingView:v6 toDisplayMode:self->_effectiveDisplayMode showingView:v4 withAnimationFactory:0 completion:0];
LABEL_7:
    v5 = v6;
    goto LABEL_8;
  }
  [(SBSceneView *)self _evaluateEffectiveDisplayModeWithAnimationFactory:0 completion:0];
  v5 = v6;
  if (v6)
  {
    [(SBSceneView *)self _placeholderVisibilityChanged];
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSceneView;
    BOOL v5 = [(SBSceneView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_layoutLiveSnapshotView:(id)a3
{
  id v6 = a3;
  id v4 = [v6 superview];
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v4 == sceneContentContainerView)
  {
    [(UIView *)self->_sceneContentContainerView bounds];
    objc_msgSend(v6, "setFrame:");
  }
}

- (void)_layoutLiveHostView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 superview];
  p_sceneContentContainerView = (id *)&self->_sceneContentContainerView;
  id v7 = *p_sceneContentContainerView;

  if (v5 == v7)
  {
    [*p_sceneContentContainerView bounds];
    objc_msgSend(v4, "setFrame:");
  }
  else
  {
    v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(SBSceneView *)v4 _layoutLiveHostView:v8];
    }
  }
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)SBSceneView;
  [(SBSceneView *)&v42 layoutSubviews];
  [(SBSceneView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBSceneView *)self _contentContainerEdgeInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v41 = v4 + v13;
  -[UIView setFrame:](self->_sceneContentContainerView, "setFrame:", v4 + v13, v12, v15, v17);
  [(SBSceneView *)self _contentContainerCornerRadius];
  double v19 = v18;
  v20 = [(UIView *)self->_sceneContentContainerView layer];
  v21 = v20;
  if (v19 <= 0.0)
  {
    [v20 setCornerRadius:0.0];
  }
  else
  {
    [v20 setCornerRadius:v19];

    v21 = [(UIView *)self->_sceneContentContainerView layer];
    [v21 setCornerCurve:*MEMORY[0x263F15A20]];
  }

  [(UIView *)self->_sceneContentContainerView bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(UIView *)self->_customContentView superview];
  sceneContentContainerView = self->_sceneContentContainerView;

  if (v30 == sceneContentContainerView) {
    -[UIView setFrame:](self->_customContentView, "setFrame:", v23, v25, v27, v29);
  }
  if ([(UIView *)self->_backgroundView isDescendantOfView:self->_sceneContentContainerView]
    || ([(UIScenePresentation *)self->_hostView backgroundView],
        v32 = (UIView *)objc_claimAutoreleasedReturnValue(),
        backgroundView = self->_backgroundView,
        v32,
        v32 == backgroundView))
  {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v23, v25, v27, v29);
    v34 = [(UIView *)self->_backgroundView superview];
    v35 = self->_sceneContentContainerView;

    if (v34 == v35) {
      [(UIView *)self->_sceneContentContainerView sendSubviewToBack:self->_backgroundView];
    }
  }
  v36 = [(SBScenePlaceholderContentView *)self->_placeholderContentView superview];
  v37 = self->_sceneContentContainerView;

  if (v36 == v37) {
    -[SBScenePlaceholderContentView setFrame:](self->_placeholderContentView, "setFrame:", v23, v25, v27, v29);
  }
  [(SBSceneView *)self _layoutLiveSnapshotView:self->_liveSnapshotView];
  [(SBSceneView *)self _layoutLiveHostView:self->_hostView];
  v38 = [(UIView *)self->_crossfadeView superview];

  if (v38 == self)
  {
    -[UIView setFrame:](self->_crossfadeView, "setFrame:", v41, v12, v15, v17);
    v39 = [(UIView *)self->_crossfadeView layer];
    v40 = v39;
    if (v19 <= 0.0)
    {
      [v39 setCornerRadius:0.0];
    }
    else
    {
      [v39 setCornerRadius:v19];

      v40 = [(UIView *)self->_crossfadeView layer];
      [v40 setCornerCurve:*MEMORY[0x263F15A20]];
    }
  }
}

- (void)_layoutLiveHostView:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v5 = [a1 superview];
  uint64_t v6 = *a2;
  int v7 = 138543618;
  double v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2218C9000, a3, OS_LOG_TYPE_ERROR, "Live host view super view[%{public}@] not matching container view[%{public}@], frame not updated", (uint8_t *)&v7, 0x16u);
}

- (void)_recheckLiveContentDependencies
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__SBSceneView__recheckLiveContentDependencies__block_invoke;
  v12[3] = &unk_2645D3CD0;
  v12[4] = self;
  double v3 = (void (**)(void))MEMORY[0x223C8BC20](v12, a2);
  int64_t effectiveDisplayMode = self->_effectiveDisplayMode;
  if (self->_requestedDisplayMode != 4)
  {
    if (effectiveDisplayMode != 4) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  BOOL v5 = [(SBSceneHandle *)self->_sceneHandle isContentReady];
  BOOL v6 = v5;
  if ((effectiveDisplayMode == 4) != v5)
  {
    int v7 = [(id)objc_opt_class() defaultDisplayModeAnimationFactory];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v6) {
        int64_t v9 = 4;
      }
      else {
        int64_t v9 = [(SBSceneView *)self _bestDisplayModeLessThanMode:4];
      }
      uint64_t v11 = [WeakRetained animationFactoryForImplicitTransitionFromMode:self->_effectiveDisplayMode toMode:v9 defaultFactory:v7];

      int v7 = (void *)v11;
    }
    [(SBSceneView *)self _evaluateEffectiveDisplayModeWithAnimationFactory:v7 completion:0];

    goto LABEL_17;
  }
  char v10 = !v5;
  if (effectiveDisplayMode != 4) {
    char v10 = 1;
  }
  if ((v10 & 1) == 0 && !self->_hostView) {
LABEL_8:
  }
    v3[2](v3);
LABEL_17:
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  if ([(SBSceneView *)self _shouldObserveSceneHostContentState])
  {
    [(SBSceneView *)self _recheckLiveContentDependencies];
  }
}

- (BOOL)_shouldObserveSceneHostContentState
{
  return self->_requestedDisplayMode == 4 || self->_effectiveDisplayMode == 4;
}

- (void)_evaluateEffectiveDisplayModeWithAnimationFactory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  for (int64_t i = self->_requestedDisplayMode;
        ;
        int64_t i = [(SBSceneView *)self _bestDisplayModeLessThanMode:i])
  {
    [(SBSceneView *)self _configureViewForEffectiveDisplayMode:i];
    if (!i) {
      break;
    }
    int64_t v9 = [(SBSceneView *)self _viewForDisplayMode:i];

    if (v9) {
      break;
    }
  }
  int64_t effectiveDisplayMode = self->_effectiveDisplayMode;
  if (effectiveDisplayMode == i)
  {
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    self->_int64_t effectiveDisplayMode = i;
    [(SBSceneView *)self _updateBackgroundViewContainment];
    ++self->_inflightDisplayModeAnimations;
    uint64_t v11 = [(SBSceneView *)self _viewForDisplayMode:effectiveDisplayMode];
    int64_t v12 = self->_effectiveDisplayMode;
    double v13 = [(SBSceneView *)self _viewForDisplayMode:v12];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__SBSceneView__evaluateEffectiveDisplayModeWithAnimationFactory_completion___block_invoke;
    v14[3] = &unk_2645D3C30;
    v14[4] = self;
    int64_t v16 = i;
    double v15 = v7;
    [(SBSceneView *)self _transitionFromDisplayMode:effectiveDisplayMode showingView:v11 toDisplayMode:v12 showingView:v13 withAnimationFactory:v6 completion:v14];
  }
}

- (void)_updateBackgroundColor
{
  if ([(SBSceneView *)self _wantsBlackBackground])
  {
    id v3 = [MEMORY[0x263F1C550] blackColor];
    [(SBSceneView *)self setBackgroundColor:v3];
  }
  else
  {
    [(SBSceneView *)self setBackgroundColor:0];
  }
}

- (id)_viewForDisplayMode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v5 = 504;
      goto LABEL_8;
    case 2:
      uint64_t v5 = 512;
      goto LABEL_8;
    case 3:
      uint64_t v5 = 520;
LABEL_8:
      id v6 = *(id *)((char *)&self->super.super.super.isa + v5);
      goto LABEL_13;
    case 4:
      if ([(NSCountedSet *)self->_liveContentDisableReasons count]
        || ![(SBSceneHandle *)self->_sceneHandle isContentReady])
      {
        id v6 = 0;
      }
      else
      {
        id v6 = [(SBSceneView *)self _transitionViewForHostView];
      }
LABEL_13:
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (void)_configureViewForEffectiveDisplayMode:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      [(SBSceneView *)self _configureLiveHostView];
      break;
    case 3:
      [(SBSceneView *)self _configureLiveSnapshotView];
      break;
    case 2:
      [(SBSceneView *)self _configurePlaceholderContentView];
      break;
  }
}

- (void)setBackgroundView:(id)a3
{
  double v4 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v4)
  {
    obj = v4;
    [(UIView *)backgroundView removeFromSuperview];
    id v6 = obj;
    if (!obj)
    {
      id v7 = objc_alloc(MEMORY[0x263F1CB60]);
      [(SBSceneView *)self bounds];
      obja = (UIView *)objc_msgSend(v7, "initWithFrame:");
      [(UIView *)obja setBackgroundColor:0];
      id v6 = obja;
    }
    objb = v6;
    objc_storeStrong((id *)&self->_backgroundView, v6);
    backgroundView = (UIView *)[(SBSceneView *)self _updateBackgroundViewContainment];
    double v4 = objb;
  }

  MEMORY[0x270F9A758](backgroundView, v4);
}

- (void)_updateBackgroundViewContainment
{
  int64_t effectiveDisplayMode = self->_effectiveDisplayMode;
  double v4 = [(UIScenePresentation *)self->_hostView backgroundView];
  uint64_t v5 = v4;
  if (effectiveDisplayMode == 4)
  {
    backgroundView = self->_backgroundView;

    if (v5 != backgroundView)
    {
      hostView = self->_hostView;
      double v8 = self->_backgroundView;
      [(UIScenePresentation *)hostView setBackgroundView:v8];
    }
  }
  else
  {

    if (v5) {
      [(UIScenePresentation *)self->_hostView setBackgroundView:0];
    }
    sceneContentContainerView = self->_sceneContentContainerView;
    char v10 = self->_backgroundView;
    [(UIView *)sceneContentContainerView insertSubview:v10 atIndex:0];
  }
}

- (void)_transitionFromDisplayMode:(int64_t)a3 showingView:(id)a4 toDisplayMode:(int64_t)a5 showingView:(id)a6 withAnimationFactory:(id)a7 completion:(id)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  double v18 = (void (**)(void))a8;
  id v19 = [(SBSceneView *)self _viewForDisplayMode:a5];

  if (v19 != v16)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    if ((unint64_t)(a5 - 1) > 3) {
      v30 = @"None";
    }
    else {
      v30 = off_2645D3CF0[a5 - 1];
    }
    v31 = [(SBSceneView *)self _viewForDisplayMode:a5];
    [v32 handleFailureInMethod:a2, self, @"SBSceneView.m", 664, @"Expected views to match (toView: %@, toMode: %@, toDisplayModeView: %@).", v16, v30, v31 object file lineNumber description];
  }
  v20 = [(SBSceneView *)self window];
  v21 = v20;
  if (!v17) {
    goto LABEL_7;
  }
  if (!v20
    || ([v20 isHidden] & 1) != 0
    || [(SBSceneView *)self isHiddenOrHasHiddenAncestor])
  {

    id v17 = 0;
LABEL_7:
    if (v16)
    {
      double v22 = [v16 superview];

      if (v22 != self) {
        [(SBSceneView *)self _addContentLikeViewToHierarchyForTransitionIfPossible:v16];
      }
    }
    [v16 setAlpha:1.0];
    if (v18) {
      v18[2](v18);
    }
    goto LABEL_12;
  }
  if (a3 == 4 && a5 == 3) {
    goto LABEL_7;
  }
  if (v15 && v16)
  {
    double v23 = +[SBCrossfadeView crossfadeViewWithStartView:v15 endView:v16 translucent:0];
    [v23 setClipsToBounds:1];
    [v23 setAnimationFactory:v17];
    [(SBSceneView *)self insertSubview:v23 aboveSubview:self->_sceneContentContainerView];
    [(UIView *)self->_crossfadeView removeFromSuperview];
    objc_storeStrong((id *)&self->_crossfadeView, v23);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke;
    v38[3] = &unk_2645D3C58;
    id v39 = v23;
    v40 = self;
    id v41 = v15;
    id v42 = v16;
    v43 = v18;
    id v24 = v23;
    [v24 crossfadeWithCompletion:v38];
  }
  else
  {
    if (v15) {
      double v25 = v15;
    }
    else {
      double v25 = v16;
    }
    id v26 = v25;
    double v27 = v26;
    if (v26)
    {
      if (v26 == v16) {
        [(SBSceneView *)self _addContentLikeViewToHierarchyForTransitionIfPossible:v16];
      }
      if (v15) {
        double v28 = 0.0;
      }
      else {
        double v28 = 1.0;
      }
      double v29 = (void *)MEMORY[0x263F29D20];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_2;
      v35[3] = &unk_2645D3C80;
      id v36 = v27;
      double v37 = v28;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_3;
      v33[3] = &unk_2645D3CA8;
      v34 = v18;
      [v29 animateWithFactory:v17 actions:v35 completion:v33];
    }
    else if (v18)
    {
      v18[2](v18);
    }
  }
LABEL_12:
}

- (void)_configureLiveHostView
{
  if (self->_invalidated)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSceneView.m", 797, @"Attempting to _configureLiveHostView for %@, which is already invalidated.", self object file lineNumber description];
  }
  if ([(SBSceneHandle *)self->_sceneHandle isContentReady])
  {
    hostView = self->_hostView;
    if (!hostView)
    {
      double v4 = [(UIScenePresenter *)self->_presenter presentationView];
      uint64_t v5 = self->_hostView;
      self->_hostView = v4;

      hostView = self->_hostView;
    }
    [(SBSceneView *)self _configureSceneLiveHostView:hostView];
    [(UIScenePresenter *)self->_presenter activate];
    [(SBSceneView *)self _updateBackgroundViewContainment];
    id v6 = [(SBSceneView *)self _transitionViewForHostView];
    [v6 setAlpha:0.0];
  }

  [(SBSceneView *)self _updateBackgroundColor];
}

- (void)_placeholderVisibilityChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v4, "sceneView:changedPreferredStatusBarStyleTo:", self, -[SBSceneView preferredStatusBarStyle](self, "preferredStatusBarStyle", v4));
    }
  }

  MEMORY[0x270F9A790]();
}

uint64_t __76__SBSceneView__evaluateEffectiveDisplayModeWithAnimationFactory_completion___block_invoke(void *a1)
{
  --*(void *)(a1[4] + 560);
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 560))
  {
    uint64_t v3 = *(void *)(v2 + 448);
    if (v3 == a1[6])
    {
      if (v3 == 4
        || (([*(id *)(v2 + 464) deactivate], v2 = a1[4], uint64_t v4 = *(void *)(v2 + 448), v4 != 4)
          ? (BOOL v5 = v4 == 1)
          : (BOOL v5 = 1),
            v5))
      {
        [(id)v2 _clearSnapshotViews];
      }
    }
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "uiPresentationManager", a3);
  id v6 = [v5 createPresenterWithIdentifier:self->_hostingIdentifier priority:self->_hostingPriority];
  presenter = self->_presenter;
  self->_presenter = v6;

  double v8 = self->_presenter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__SBSceneView_sceneHandle_didCreateScene___block_invoke;
  v9[3] = &unk_2645D3C08;
  v9[4] = self;
  [(UIScenePresenter *)v8 modifyPresentationContext:v9];
  [(SBSceneView *)self _updateResizesHostedContext];
  [(SBSceneView *)self _updateLiveContentRendering];
  [(SBSceneView *)self _enableHostingIfPossible];
}

- (void)setMinificationFilter:(id)a3
{
  id v4 = a3;
  uint64_t minificationFilter = (uint64_t)self->_minificationFilter;
  if ((id)minificationFilter != v4)
  {
    double v8 = v4;
    uint64_t minificationFilter = [(id)minificationFilter isEqual:v4];
    id v4 = v8;
    if ((minificationFilter & 1) == 0)
    {
      id v6 = (NSString *)[v8 copy];
      id v7 = self->_minificationFilter;
      self->_uint64_t minificationFilter = v6;

      uint64_t minificationFilter = [(SBSceneView *)self _updateLiveContentRendering];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](minificationFilter, v4);
}

- (void)_updateLiveContentRendering
{
  presenter = self->_presenter;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SBSceneView__updateLiveContentRendering__block_invoke;
  v8[3] = &unk_2645D3C08;
  v8[4] = self;
  [(UIScenePresenter *)presenter modifyPresentationContext:v8];
  if (self->_rendersAsynchronously) {
    uint64_t minificationFilter = self->_minificationFilter;
  }
  else {
    uint64_t minificationFilter = 0;
  }
  sceneContentContainerView = self->_sceneContentContainerView;
  id v6 = minificationFilter;
  id v7 = [(UIView *)sceneContentContainerView layer];
  [v7 setMinificationFilter:v6];
}

- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  if (!v15)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SBSceneView.m", 77, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];
  }
  if ((unint64_t)(a6 - 3) >= 2) {
    double v17 = height;
  }
  else {
    double v17 = width;
  }
  if ((unint64_t)(a6 - 3) >= 2) {
    double v18 = width;
  }
  else {
    double v18 = height;
  }
  double v19 = *MEMORY[0x263F00148];
  double v20 = *(double *)(MEMORY[0x263F00148] + 8);
  v40.receiver = self;
  v40.super_class = (Class)SBSceneView;
  v21 = -[SBSceneView initWithFrame:](&v40, sel_initWithFrame_, v19, v20, v18, v17);
  double v22 = v21;
  if (v21)
  {
    [(SBSceneView *)v21 setOpaque:0];
    objc_storeStrong((id *)&v22->_sceneHandle, a3);
    v22->_referenceSize.double width = width;
    v22->_referenceSize.double height = height;
    v22->_orientation = a5;
    v22->_requestedDisplayMode = 0;
    v22->_int64_t effectiveDisplayMode = 0;
    v22->_placeholderContentEnabled = 1;
    id v23 = objc_alloc(MEMORY[0x263F1CB60]);
    [(SBSceneView *)v22 bounds];
    uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
    sceneContentContainerView = v22->_sceneContentContainerView;
    v22->_sceneContentContainerView = (UIView *)v24;

    [(SBSceneView *)v22 _invalidateContentPrefersToDisableClipping];
    [(SBSceneView *)v22 addSubview:v22->_sceneContentContainerView];
    [(SBSceneView *)v22 setBackgroundView:0];
    if (v16) {
      uint64_t v26 = [v16 sceneViewPresentationPriority:v22];
    }
    else {
      uint64_t v26 = 0;
    }
    v22->_hostingPriority = v26;
    uint64_t v27 = [v16 sceneViewPresentationIdentifier:v22];
    double v28 = (void *)v27;
    double v29 = @"SBApplicationSceneView";
    if (v27) {
      double v29 = (__CFString *)v27;
    }
    v30 = v29;

    id v31 = [NSString alloc];
    uint64_t v32 = ++initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester____RequesterCounter;
    if (v16) {
      uint64_t v33 = [v31 initWithFormat:@"%@:%p-SBApplicationSceneView:%p-%llu", v30, v16, v22, v32];
    }
    else {
      uint64_t v33 = [v31 initWithFormat:@"%@-%p-%llu", v30, v22, v32, v39];
    }
    v34 = (NSString *)v33;

    hostingIdentifier = v22->_hostingIdentifier;
    v22->_hostingIdentifier = v34;

    [(SBSceneHandle *)v22->_sceneHandle addObserver:v22];
    id v36 = [v15 sceneIfExists];
    if (v36) {
      [(SBSceneView *)v22 sceneHandle:v15 didCreateScene:v36];
    }
  }
  return v22;
}

- (void)_updateResizesHostedContext
{
  presenter = self->_presenter;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__SBSceneView__updateResizesHostedContext__block_invoke;
  v3[3] = &unk_2645D3C08;
  v3[4] = self;
  [(UIScenePresenter *)presenter modifyPresentationContext:v3];
}

- (void)_invalidateContentPrefersToDisableClipping
{
  uint64_t v3 = [(SBSceneView *)self _contentPrefersToDisableClipping] ^ 1;
  [(SBSceneView *)self setClipsToBounds:v3];
  [(UIView *)self->_sceneContentContainerView setClipsToBounds:v3];
  presenter = self->_presenter;
  if (presenter)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__SBSceneView__invalidateContentPrefersToDisableClipping__block_invoke;
    v5[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    char v6 = v3;
    [(UIScenePresenter *)presenter modifyPresentationContext:v5];
  }
}

- (void)_enableHostingIfPossible
{
  if (self->_invalidated)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSceneView.m" lineNumber:561 description:@"this object has already been invalidated"];
  }

  [(SBSceneView *)self _recheckLiveContentDependencies];
}

- (void)_configurePlaceholderContentView
{
  if (!self->_placeholderContentView && self->_placeholderContentEnabled)
  {
    uint64_t v3 = [(SBScenePlaceholderContentViewProvider *)self->_placeholderContentProvider sceneView:self requestsPlaceholderContentViewWithContext:self->_placeholderContentContext];
    placeholderContentView = self->_placeholderContentView;
    self->_placeholderContentView = v3;

    [(SBScenePlaceholderContentView *)self->_placeholderContentView setAlpha:0.0];
    [(UIView *)self->_sceneContentContainerView addSubview:self->_placeholderContentView];
    [(SBSceneView *)self _placeholderVisibilityChanged];
  }
}

- (int64_t)_bestDisplayModeLessThanMode:(int64_t)a3
{
  return 2 * ((unint64_t)a3 > 2);
}

+ (id)defaultDisplayModeAnimationFactory
{
  return (id)[MEMORY[0x263F29D20] factoryWithDuration:0.35];
}

- (int64_t)preferredStatusBarStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }
  placeholderContentView = self->_placeholderContentView;

  return [(SBScenePlaceholderContentView *)placeholderContentView statusBarStyle];
}

- (void)_clearSnapshotViews
{
  [(SBScenePlaceholderContentView *)self->_placeholderContentView removeFromSuperview];
  placeholderContentView = self->_placeholderContentView;
  self->_placeholderContentView = 0;

  [(SBSceneView *)self _placeholderVisibilityChanged];
  [(UISceneSnapshotPresentation *)self->_liveSnapshotView removeFromSuperview];
  liveSnapshotView = self->_liveSnapshotView;
  self->_liveSnapshotView = 0;

  [(SBSceneView *)self _configureBackgroundColorForLiveSnapshot:0];
}

- (void)_configureBackgroundColorForLiveSnapshot:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(SBSceneHandle *)self->_sceneHandle sceneIfExists];
    BOOL v5 = [v4 uiPresentationManager];
    char v6 = [v5 defaultPresentationContext];
    id v7 = [v6 backgroundColorWhileHosting];

    [(SBSceneView *)self setBackgroundColor:v7];
  }
  else
  {
    [(SBSceneView *)self _updateBackgroundColor];
  }
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3 == v2[67])
  {
    [v2 _updateBackgroundViewContainment];
    [*(id *)(a1 + 40) _addContentLikeViewToHierarchyForTransitionIfPossible:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _addContentLikeViewToHierarchyForTransitionIfPossible:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) removeFromSuperview];
    uint64_t v4 = *(void *)(a1 + 40);
    BOOL v5 = *(void **)(v4 + 536);
    *(void *)(v4 + 536) = 0;
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (BOOL)_addContentLikeViewToHierarchyForTransitionIfPossible:(id)a3
{
  id v4 = a3;
  if (v4 && [(SBSceneView *)self _shouldViewBeInHierarchyForTransition:v4])
  {
    [(UIView *)self->_sceneContentContainerView addSubview:v4];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldViewBeInHierarchyForTransition:(id)a3
{
  id v4 = (UIView *)a3;
  BOOL v5 = v4;
  if (self->_customContentView == v4 || (UIView *)self->_placeholderContentView == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    char v6 = [(SBSceneView *)self _transitionViewForHostView];
    BOOL v7 = v6 == v5;
  }
  return v7;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

uint64_t __42__SBSceneView__updateLiveContentRendering__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRenderingMode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 569)];
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  if (self->_rendersAsynchronously != a3)
  {
    self->_rendersAsynchronously = a3;
    [(SBSceneView *)self _updateLiveContentRendering];
  }
}

- (SBScenePlaceholderContentViewProvider)placeholderContentProvider
{
  return self->_placeholderContentProvider;
}

- (int64_t)effectiveDisplayMode
{
  return self->_effectiveDisplayMode;
}

- (void)setDelegate:(id)a3
{
}

uint64_t __42__SBSceneView__updateResizesHostedContext__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setResizesHostedContext:*(unsigned __int8 *)(*(void *)(a1 + 32) + 570)];
}

void __42__SBSceneView_sceneHandle_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAppearanceStyle:2];
  [*(id *)(a1 + 32) _modifyPresentationContext:v3];
}

- (void)_modifyPresentationContext:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setClippingDisabled:", -[SBSceneView _contentPrefersToDisableClipping](self, "_contentPrefersToDisableClipping"));
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v11 = a4;
  int64_t v9 = (void (**)(void))a5;
  if (self->_invalidated)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSceneView.m" lineNumber:248 description:@"this object has already been invalidated"];
  }
  if (self->_requestedDisplayMode == a3)
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    self->_requestedDisplayMode = a3;
    [(SBSceneView *)self _evaluateEffectiveDisplayModeWithAnimationFactory:v11 completion:v9];
  }
}

- (void)setCustomContentView:(id)a3
{
  int64_t v9 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  char v6 = self->_customContentView;
  if (v6 != v9)
  {
    objc_storeStrong((id *)&self->_customContentView, a3);
    BOOL v7 = *p_customContentView;
    [(SBSceneView *)self bounds];
    -[UIView setFrame:](v7, "setFrame:");
    if (self->_effectiveDisplayMode == 1)
    {
      backgroundView = v6;
      if (!v6) {
        backgroundView = self->_backgroundView;
      }
      [(SBSceneView *)self _transitionFromDisplayMode:1 showingView:backgroundView toDisplayMode:1 showingView:*p_customContentView withAnimationFactory:0 completion:0];
    }
    else
    {
      [(UIView *)*p_customContentView setAlpha:0.0];
      [(UIView *)self->_sceneContentContainerView addSubview:*p_customContentView];
    }
    [(UIView *)v6 removeFromSuperview];
  }
}

- (SBSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 orientation:(int64_t)a5
{
  return -[SBSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](self, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", a3, a5, a5, 0, a4.width, a4.height);
}

- (void)dealloc
{
  [(SBSceneHandle *)self->_sceneHandle removeObserver:self];
  [(SBSceneView *)self _invalidateHostPresenter];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneView;
  [(SBSceneView *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(SBSceneHandle *)self->_sceneHandle sceneIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"sceneId"];

  id v6 = (id)[v3 appendPointer:self->_sceneHandle withName:@"sceneHandle"];
  unint64_t v7 = [(SBSceneView *)self displayMode] - 1;
  if (v7 > 3) {
    double v8 = @"None";
  }
  else {
    double v8 = off_2645D3CF0[v7];
  }
  id v9 = (id)[v3 appendObject:v8 withName:@"requestedDisplayMode"];
  unint64_t v10 = [(SBSceneView *)self effectiveDisplayMode] - 1;
  if (v10 > 3) {
    id v11 = @"None";
  }
  else {
    id v11 = off_2645D3CF0[v10];
  }
  id v12 = (id)[v3 appendObject:v11 withName:@"effectiveDisplayMode"];
  double v13 = [(NSCountedSet *)self->_liveContentDisableReasons allObjects];
  [v3 appendArraySection:v13 withName:@"liveContentDisableAssertions" skipIfEmpty:1];

  id v14 = (id)[v3 appendSuper];
  id v15 = [v3 build];

  return (NSString *)v15;
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
  if (self->_placeholderContentEnabled != a3)
  {
    self->_placeholderContentEnabled = a3;
    [(SBSceneView *)self _reloadPlaceholderContentIfNecessary];
  }
}

- (id)newSnapshot
{
  objc_super v3 = [(SBSceneView *)self sceneHandle];
  id v4 = [v3 sceneIfExists];

  id v5 = (void *)[(UIScenePresenter *)self->_presenter newSnapshotContext];
  if (v5)
  {
    [(SBSceneView *)self _configureSceneSnapshotContext:v5];
    id v6 = [v4 createSnapshotWithContext:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)acquireLiveContentDisableAssertionForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBSceneView.m", 273, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v6 = (void *)[v5 copy];

  liveContentDisableReasons = self->_liveContentDisableReasons;
  if (liveContentDisableReasons)
  {
    [(NSCountedSet *)liveContentDisableReasons addObject:v6];
  }
  else
  {
    double v8 = [MEMORY[0x263F08760] setWithObject:v6];
    id v9 = self->_liveContentDisableReasons;
    self->_liveContentDisableReasons = v8;
  }
  [(SBSceneView *)self _evaluateEffectiveDisplayModeWithAnimationFactory:0 completion:0];
  [(UIScenePresentation *)self->_hostView removeFromSuperview];
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x263F29CD8]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__SBSceneView_acquireLiveContentDisableAssertionForReason___block_invoke;
  v15[3] = &unk_2645D3BC0;
  objc_copyWeak(&v17, &location);
  id v11 = v6;
  id v16 = v11;
  id v12 = (void *)[v10 initWithIdentifier:@"SBSceneView.DisableLiveContent" forReason:v11 invalidationBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

void __59__SBSceneView_acquireLiveContentDisableAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    [WeakRetained[69] removeObject:*(void *)(a1 + 32)];
    [v3 _evaluateEffectiveDisplayModeWithAnimationFactory:0 completion:0];
    id WeakRetained = v3;
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    self->_requestedDisplayMode = 0;
    objc_super v3 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.176470588 blue:0.333333333 alpha:1.0];
    [(SBSceneView *)self setBackgroundColor:v3];

    [(SBSceneView *)self _invalidateHostPresenter];
    [(SBSceneView *)self _clearSnapshotViews];
    [(SBScenePlaceholderContentViewProvider *)self->_placeholderContentProvider setDelegate:0];
    placeholderContentProvider = self->_placeholderContentProvider;
    self->_placeholderContentProvider = 0;

    [(UIView *)self->_customContentView removeFromSuperview];
    customContentView = self->_customContentView;
    self->_customContentView = 0;

    id v6 = [(UIView *)self->_backgroundView superview];
    sceneContentContainerView = self->_sceneContentContainerView;

    if (v6 == sceneContentContainerView) {
      [(UIView *)self->_backgroundView removeFromSuperview];
    }
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    sceneHandle = self->_sceneHandle;
    [(SBSceneHandle *)sceneHandle removeObserver:self];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_hostView) {
    self = (SBSceneView *)self->_hostView;
  }
  [(SBSceneView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)_refresh
{
  int64_t effectiveDisplayMode = self->_effectiveDisplayMode;
  if (effectiveDisplayMode == 3)
  {
    [(SBSceneView *)self _hotSwapLiveSnapshotView];
  }
  else if (effectiveDisplayMode == 2)
  {
    [(SBSceneView *)self _hotSwapPlaceholderContentView];
  }

  [(SBSceneView *)self _updateBackgroundColor];
}

- (void)_configureSceneLiveSnapshotView:(id)a3
{
}

- (BOOL)_representsTranslucentContent
{
  return 0;
}

- (BOOL)_contentPrefersToDisableClipping
{
  return 0;
}

uint64_t __57__SBSceneView__invalidateContentPrefersToDisableClipping__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setClippingDisabled:*(unsigned char *)(a1 + 32) == 0];
}

- (BOOL)_wantsBlackBackground
{
  return 0;
}

- (UIEdgeInsets)_contentContainerEdgeInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_contentContainerCornerRadius
{
  return 0.0;
}

- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBSceneView.m" lineNumber:486 description:@"bogus reference size"];
  }
  if ((BSInterfaceOrientationIsValid() & 1) == 0)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBSceneView.m" lineNumber:487 description:@"bogus interface orientation"];
  }
  int64_t orientation = self->_orientation;
  double v11 = self->_referenceSize.width;
  double v12 = self->_referenceSize.height;
  self->_referenceSize.double width = width;
  self->_referenceSize.double height = height;
  [(SBSceneView *)self _setOrientation:a4];
  if ([(SBSceneView *)self effectiveDisplayMode] == 2)
  {
    BOOL v13 = orientation == a4 && v11 == width;
    if (!v13 || v12 != height)
    {
      [(SBSceneView *)self _hotSwapPlaceholderContentView];
    }
  }
}

- (void)_containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    placeholderContentView = self->_placeholderContentView;
    [(SBScenePlaceholderContentView *)placeholderContentView setContainerOrientation:a3];
  }
}

- (void)placeholderContentViewProviderContentDidUpdate:(id)a3
{
  if (self->_placeholderContentProvider == a3) {
    [(SBSceneView *)self _reloadPlaceholderContentIfNecessary];
  }
}

- (void)_setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_int64_t orientation = a3;
    [(SBSceneView *)self setNeedsLayout];
  }
}

- (void)_invalidateHostPresenter
{
  [(UIScenePresenter *)self->_presenter invalidate];
  presenter = self->_presenter;
  self->_presenter = 0;

  [(SBSceneView *)self _invalidateSceneLiveHostView:self->_hostView];
  [(UIScenePresentation *)self->_hostView removeFromSuperview];
  hostView = self->_hostView;
  self->_hostView = 0;
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __112__SBSceneView__transitionFromDisplayMode_showingView_toDisplayMode_showingView_withAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_configureLiveSnapshotView
{
  if (!self->_liveSnapshotView && [(SBSceneHandle *)self->_sceneHandle isContentReady])
  {
    double v3 = [(SBSceneHandle *)self->_sceneHandle sceneIfExists];
    double v4 = [v3 uiPresentationManager];
    id v5 = [(SBSceneView *)self newSnapshot];
    double v6 = [v4 snapshotPresentationForSnapshot:v5];
    liveSnapshotView = self->_liveSnapshotView;
    self->_liveSnapshotView = v6;

    [(UISceneSnapshotPresentation *)self->_liveSnapshotView setAlpha:0.0];
    [(SBSceneView *)self _configureBackgroundColorForLiveSnapshot:1];
    [(SBSceneView *)self _configureSceneLiveSnapshotView:self->_liveSnapshotView];
    [(SBSceneView *)self setNeedsLayout];
    [(SBSceneView *)self layoutIfNeeded];
  }
}

- (void)_updateLiveViewContainment
{
  if (self->_hostView) {
    -[SBSceneView _configureSceneLiveHostView:](self, "_configureSceneLiveHostView:");
  }
  if (self->_liveSnapshotView)
  {
    -[SBSceneView _configureSceneLiveSnapshotView:](self, "_configureSceneLiveSnapshotView:");
  }
}

- (void)_hotSwapPlaceholderContentView
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__SBSceneView__hotSwapPlaceholderContentView__block_invoke;
  v2[3] = &unk_2645D3CD0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

uint64_t __45__SBSceneView__hotSwapPlaceholderContentView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearSnapshotViews];
  [*(id *)(a1 + 32) _configurePlaceholderContentView];
  [*(id *)(*(void *)(a1 + 32) + 512) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

- (void)_hotSwapLiveSnapshotView
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__SBSceneView__hotSwapLiveSnapshotView__block_invoke;
  v2[3] = &unk_2645D3CD0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

void __39__SBSceneView__hotSwapLiveSnapshotView__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 520);
  id v4 = v2;
  [*(id *)(a1 + 32) _clearSnapshotViews];
  [*(id *)(a1 + 32) _configureLiveSnapshotView];
  double v3 = *(void **)(*(void *)(a1 + 32) + 520);
  if (!v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 520), v2);
    [*(id *)(*(void *)(a1 + 32) + 496) addSubview:*(void *)(*(void *)(a1 + 32) + 520)];
    double v3 = *(void **)(*(void *)(a1 + 32) + 520);
  }
  [v3 setAlpha:1.0];
  [*(id *)(a1 + 32) setNeedsLayout];
}

uint64_t __46__SBSceneView__recheckLiveContentDependencies__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureLiveHostView];
  double v2 = [*(id *)(a1 + 32) _transitionViewForHostView];
  [v2 setAlpha:1.0];

  double v3 = *(void **)(a1 + 32);

  return [v3 setNeedsLayout];
}

- (int64_t)displayMode
{
  return self->_requestedDisplayMode;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return self->_placeholderContentContext;
}

- (BOOL)placeholderContentEnabled
{
  return self->_placeholderContentEnabled;
}

- (NSString)minificationFilter
{
  return self->_minificationFilter;
}

- (BOOL)rendersAsynchronously
{
  return self->_rendersAsynchronously;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (SBSceneViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SBSceneViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minificationFilter, 0);
  objc_storeStrong((id *)&self->_placeholderContentProvider, 0);
  objc_storeStrong((id *)&self->_liveContentDisableReasons, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_crossfadeView, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_liveSnapshotView, 0);
  objc_storeStrong((id *)&self->_placeholderContentView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_sceneContentContainerView, 0);
  objc_storeStrong((id *)&self->_placeholderContentContext, 0);
  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end