@interface UIPanelController
+ (id)_withDisabledAppearanceTransitions:(BOOL)a3 forVisibleDescendantsOf:(id)a4 perform:(id)a5;
- (BOOL)_animateCustomTransitionIfNeededWithAnimationState:(id)a3 possiblePublicStates:(id)a4 newPublicState:(id)a5 estimatedDuration:(double)a6 needsInitialLayout:(BOOL)a7;
- (BOOL)_changingViewControllerParentage;
- (BOOL)_hasUpdatedForTraitCollection;
- (BOOL)_needsFirstTimeUpdateForTraitCollection;
- (BOOL)_willCollapseWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4;
- (BOOL)_willExpandWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4;
- (BOOL)animationRequestShouldCoordinate;
- (BOOL)areClippingViewsUnnecessary;
- (BOOL)isAnimating;
- (BOOL)isCollapsed;
- (BOOL)isLeadingViewControllerVisibleAfterAnimation;
- (BOOL)isPresentationGestureActive;
- (BOOL)isRunExpandScheduled;
- (BOOL)isSupplementaryViewControllerVisibleAfterAnimation;
- (BOOL)isTrailingViewControllerVisibleAfterAnimation;
- (BOOL)leadingTrailingWrapsNavigationController;
- (BOOL)showShadowViews;
- (BOOL)supportsColumnStyle;
- (BOOL)wantsFloatingSidebar;
- (CGSize)_expectedSecondaryColumnSizeAfterAnimatingToState:(id)a3 getLeadingColumnSize:(CGSize *)a4 trailingColumnSize:(CGSize *)a5 supplementaryColumnSize:(CGSize *)a6;
- (CGSize)_lastViewSize;
- (NSArray)_lastPossiblePublicStates;
- (NSArray)uncachedPossibleStates;
- (NSString)description;
- (UIDimmingView)_primaryParallaxDimmingView;
- (UILayoutContainerView)view;
- (UINavigationBar)navigationBarForContentLayoutGuideAnimation;
- (UIPanelBorderView)_leadingBorderView;
- (UIPanelBorderView)_supplementaryBorderView;
- (UIPanelBorderView)_trailingBorderView;
- (UIPanelController)initWithOwningViewController:(id)a3;
- (UIPanelControllerDelegate)delegate;
- (UISlidingBarConfiguration)_suspendedConfiguration;
- (UISlidingBarConfiguration)configuration;
- (UISlidingBarState)_lastComputedPublicState;
- (UISlidingBarStateRequest)interactiveStateRequest;
- (UISlidingBarStateRequest)stateRequest;
- (UIView)_contentView;
- (UIView)_destTransitionView;
- (UIView)_sourceTransitionView;
- (UIView)dimmingView;
- (UIView)leadingBarContentClippingView;
- (UIView)supplementaryBarContentClippingView;
- (UIView)trailingBarContentClippingView;
- (UIViewController)collapsedViewController;
- (UIViewController)leadingViewController;
- (UIViewController)mainViewController;
- (UIViewController)owningViewController;
- (UIViewController)preservedDetailController;
- (UIViewController)supplementaryViewController;
- (UIViewController)trailingViewController;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (_UIDuoShadowView)_overlayEdgeShadowView;
- (_UIDuoShadowView)_primaryOrSupplementaryShadowView;
- (_UIDuoShadowView)_supplementaryParallaxShadowView;
- (_UIFloatableBarButtonItem)floatingBarButtonItem;
- (_UIMTCaptureView)_captureView;
- (_UIPanelInternalState)_internalState;
- (_UIPanelInternalState)_previousInternalState;
- (double)interpolatedMarginForPrimaryNavigationBar:(id)a3 supplementaryOrSecondaryNavbar:(id)a4 getInterpolatedAlpha:(double *)a5;
- (id)_createBorderView;
- (id)_createOverlayEdgeShadowViewForEdge:(unint64_t)a3;
- (id)_createOverlayShadowView;
- (id)allViewControllers;
- (id)gatherMultitaskingDragExclusionRectsFromVisibleColumns;
- (id)uncachedPossibleStatesForSize:(CGSize)a3;
- (int64_t)collapsedState;
- (int64_t)style;
- (void)__viewWillLayoutSubviews;
- (void)_addIdentifiedChildViewController:(id)a3;
- (void)_adjustForKeyboardInfo:(id)a3;
- (void)_adjustNonOverlayLeadingScrollViewsForKeyboardInfo:(id)a3;
- (void)_animateFromRequest:(id)a3 toRequest:(id)a4 withAffectedSides:(int64_t)a5 forceOverlay:(BOOL)a6 velocity:(double)a7;
- (void)_clearSuspendedConfiguration;
- (void)_collapseWithTransitionCoordinator:(id)a3;
- (void)_expandWithTransitionCoordinator:(id)a3;
- (void)_layoutContainerViewDidMoveToWindow:(id)a3;
- (void)_layoutContainerViewWillMoveToWindow:(id)a3;
- (void)_observeKeyboardNotificationsOnScreen:(id)a3;
- (void)_performDeferredUpdate;
- (void)_performSingleDeferredUpdatePass;
- (void)_performWrappedUpdate:(id)a3;
- (void)_removeIdentifiedChildViewController:(id)a3;
- (void)_setBorderViewsObserveViewBackgroundColor:(BOOL)a3;
- (void)_setChangingViewControllerParentage:(BOOL)a3;
- (void)_setContentView:(id)a3;
- (void)_setDestinationTransitionView:(id)a3;
- (void)_setHasUpdatedForTraitCollection:(BOOL)a3;
- (void)_setInternalState:(id)a3;
- (void)_setLastComputedPublicState:(id)a3;
- (void)_setLastPossiblePublicStates:(id)a3;
- (void)_setLastViewSize:(CGSize)a3;
- (void)_setLeadingBorderView:(id)a3;
- (void)_setLeadingPanelShadowView:(id)a3;
- (void)_setMaterialThemesCaptureView:(id)a3;
- (void)_setNeedsDeferredUpdate;
- (void)_setNeedsFirstTimeUpdateForTraitCollection:(BOOL)a3;
- (void)_setNeedsLayoutAndPerformImmediately:(BOOL)a3;
- (void)_setOverlayEdgeShadowView:(id)a3;
- (void)_setPreviousInternalState:(id)a3;
- (void)_setPrimaryParallaxDimmingView:(id)a3;
- (void)_setSourceTransitionView:(id)a3;
- (void)_setSupplementaryBorderView:(id)a3;
- (void)_setSupplementaryParallaxShadowView:(id)a3;
- (void)_setSuspendedConfiguration:(id)a3;
- (void)_setTrailingBorderView:(id)a3;
- (void)_stopAnimationsBeginningInteraction:(BOOL)a3;
- (void)_stopObservingKeyboardNotifications;
- (void)_storeSuspendedConfiguration;
- (void)_unspecifiedUpdateToNewPublicState:(id)a3 withSize:(CGSize)a4;
- (void)_updateBorderViewsBackgroundColor:(id)a3;
- (void)_updateForTraitCollection:(id)a3 oldTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_updateToNewPublicState:(id)a3 withSize:(CGSize)a4;
- (void)_withDisabledAppearanceTransitionsPerform:(id)a3;
- (void)addWrapperBlockForNextUpdate:(id)a3;
- (void)animateToRequest:(id)a3;
- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4;
- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4 withVelocity:(double)a5;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeChildViewController:(id)a3;
- (void)setAnimationRequestShouldCoordinate:(BOOL)a3;
- (void)setClippingViewsUnnecessary:(BOOL)a3;
- (void)setCollapsedViewController:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setFloatingBarButtonItem:(id)a3;
- (void)setInteractiveStateRequest:(id)a3;
- (void)setLeadingBarContentClippingView:(id)a3;
- (void)setLeadingTrailingWrapsNavigationController:(BOOL)a3;
- (void)setLeadingViewController:(id)a3;
- (void)setLeadingViewController:(id)a3 changingParentage:(BOOL)a4;
- (void)setMainViewController:(id)a3;
- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4;
- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4 animateTransition:(BOOL)a5;
- (void)setNavigationBarForContentLayoutGuideAnimation:(id)a3;
- (void)setOwningViewController:(id)a3;
- (void)setPresentationGestureActive:(BOOL)a3;
- (void)setPreservedDetailController:(id)a3;
- (void)setRunExpandScheduled:(BOOL)a3;
- (void)setShowShadowViews:(BOOL)a3;
- (void)setStateRequest:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupplementaryBarContentClippingView:(id)a3;
- (void)setSupplementaryViewController:(id)a3;
- (void)setSupplementaryViewController:(id)a3 changingParentage:(BOOL)a4;
- (void)setTrailingBarContentClippingView:(id)a3;
- (void)setTrailingViewController:(id)a3;
- (void)setTrailingViewController:(id)a3 changingParentage:(BOOL)a4;
- (void)setView:(id)a3;
- (void)setWantsFloatingSidebar:(BOOL)a3;
- (void)stopAnimations;
- (void)traitCollectionDidChange:(id)a3 toNewTraits:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5;
@end

@implementation UIPanelController

- (void)setDelegate:(id)a3
{
  id v8 = a3;
  v4 = [(UIPanelController *)self _internalState];
  id v5 = [v4 delegate];

  if (v5 != v8)
  {
    v6 = [(UIPanelController *)self _internalState];
    [v6 setDelegate:v8];

    if (objc_opt_respondsToSelector()) {
      int v7 = 0x8000;
    }
    else {
      int v7 = 0;
    }
    self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFF7FFF | v7);
  }
}

- (void)setWantsFloatingSidebar:(BOOL)a3
{
  self->_wantsFloatingSidebar = a3;
}

- (void)_updateForTraitCollection:(id)a3 oldTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(UIPanelController *)self _internalState];
  v12 = [v11 leadingViewController];
  if (!v12)
  {
    v12 = [(UIPanelController *)self _internalState];
    v13 = [v12 mainViewController];
    if (!v13)
    {
      v13 = [(UIPanelController *)self _internalState];
      v14 = [v13 trailingViewController];
      if (!v14)
      {
        v15 = [(UIPanelController *)self _internalState];
        v16 = [v15 collapsedViewController];

        if (!v16) {
          goto LABEL_13;
        }
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  if ([(UIPanelController *)self _willCollapseWithNewTraitCollection:v8 oldTraitCollection:v9])
  {
    if (os_variant_has_internal_diagnostics())
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPanelController", &_updateForTraitCollection_oldTraitCollection_withTransitionCoordinator____s_category)+ 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = [(UIPanelController *)self _internalState];
        uint64_t v20 = [v19 collapsedState];
        v21 = [(UIPanelController *)self owningViewController];
        v22 = [v21 traitCollection];
        int v23 = 134284035;
        uint64_t v24 = v20;
        __int16 v25 = 2113;
        v26 = v22;
        __int16 v27 = 2113;
        id v28 = v8;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "About to collapse, current collapsedState : %{private}ld, current traitCollection: %{private}@ new traitCollection: %{private}@", (uint8_t *)&v23, 0x20u);
      }
    }
    [(UIPanelController *)self _collapseWithTransitionCoordinator:v10];
  }
  else if ([(UIPanelController *)self _willExpandWithNewTraitCollection:v8 oldTraitCollection:v9])
  {
    [(UIPanelController *)self _expandWithTransitionCoordinator:v10];
  }
  [(UIPanelController *)self _setHasUpdatedForTraitCollection:1];
LABEL_13:
}

- (void)_setHasUpdatedForTraitCollection:(BOOL)a3
{
  self->__hasUpdatedForTraitCollection = a3;
}

- (BOOL)_willCollapseWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIPanelController *)self _internalState];
  uint64_t v9 = [v8 collapsedState];

  uint64_t v10 = [v6 horizontalSizeClass];
  uint64_t v11 = [v7 horizontalSizeClass];

  if (v11 != 1) {
    return 0;
  }
  BOOL v12 = ![(UIPanelController *)self _hasUpdatedForTraitCollection];
  if (v10 == 2) {
    LOBYTE(v12) = 1;
  }
  return !v9 || v12;
}

- (void)traitCollectionDidChange:(id)a3 toNewTraits:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(UIPanelController *)self _hasUpdatedForTraitCollection])
  {
    if (dyld_program_sdk_at_least())
    {
      BOOL v7 = [v6 horizontalSizeClass] == 1;
      if (v7 != [(UIPanelController *)self isCollapsed]) {
        [(UIPanelController *)self _updateForTraitCollection:v6 oldTraitCollection:v8 withTransitionCoordinator:0];
      }
    }
  }
}

- (BOOL)_hasUpdatedForTraitCollection
{
  return self->__hasUpdatedForTraitCollection;
}

- (UIViewController)mainViewController
{
  v2 = [(UIPanelController *)self _internalState];
  v3 = [v2 mainViewController];

  return (UIViewController *)v3;
}

- (UIViewController)collapsedViewController
{
  v2 = [(UIPanelController *)self _internalState];
  v3 = [v2 collapsedViewController];

  return (UIViewController *)v3;
}

- (BOOL)isCollapsed
{
  v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 collapsedState];

  return (unint64_t)(v3 - 1) < 2;
}

- (int64_t)style
{
  return self->_style;
}

- (UIViewController)leadingViewController
{
  v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 leadingViewController];

  return (UIViewController *)v3;
}

- (_UIPanelInternalState)_internalState
{
  return self->__internalState;
}

- (UISlidingBarState)_lastComputedPublicState
{
  return self->__lastComputedPublicState;
}

- (UIViewController)trailingViewController
{
  v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 trailingViewController];

  return (UIViewController *)v3;
}

- (void)_unspecifiedUpdateToNewPublicState:(id)a3 withSize:(CGSize)a4
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v162 = a3;
  v165 = [(UIPanelController *)self _contentView];
  id v5 = [(UIPanelController *)self _internalState];
  v150 = [v5 leadingViewController];

  id v6 = [(UIPanelController *)self _internalState];
  v142 = [v6 mainViewController];

  BOOL v7 = [(UIPanelController *)self _internalState];
  v139 = [v7 trailingViewController];

  BOOL v8 = [v162 _collapsedState] == 1 || objc_msgSend(v162, "_collapsedState") == 2;
  uint64_t v9 = [(UIPanelController *)self _internalState];
  v141 = [v9 collapsedViewController];

  if (v8)
  {
    id v138 = v141;
    uint64_t v10 = [v138 view];
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_35;
  }
  id v138 = v142;
  uint64_t v10 = [v138 view];
  v15 = v162;
  [v162 leadingWidth];
  if (v16 <= 0.0)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = [v150 view];

    v15 = v162;
  }
  [v15 trailingWidth];
  if (v17 <= 0.0)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = [v139 view];

    v15 = v162;
  }
  v18 = [v15 configuration];
  v19 = [v18 borderColor];
  if (v19)
  {
  }
  else if ([(UILayoutContainerView *)self->_view backgroundColorIsDefault])
  {
    uint64_t v20 = +[UIColor _splitViewBorderColor];
    goto LABEL_17;
  }
  uint64_t v20 = [v18 borderColor];
  if (!v20)
  {
    id v22 = [(UIView *)self->_view backgroundColor];

    id v21 = 0;
    goto LABEL_19;
  }
LABEL_17:
  id v21 = v20;
  id v22 = v21;
LABEL_19:

  if (v14
    && ([v162 configuration],
        int v23 = objc_claimAutoreleasedReturnValue(),
        [v23 leadingBorderWidthForScale:1.0],
        double v25 = v24,
        v23,
        v25 > 0.0))
  {
    v26 = [(UIPanelController *)self _leadingBorderView];

    if (!v26)
    {
      __int16 v27 = [(UIPanelController *)self _createBorderView];
      [(UIPanelController *)self _setLeadingBorderView:v27];
    }
    uint64_t v12 = [(UIPanelController *)self _leadingBorderView];
    [(id)v12 setBackgroundColor:v22];
    [(id)v12 setNeedsLayout];
    if (!v13) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (!v13) {
      goto LABEL_30;
    }
  }
  id v28 = [v162 configuration];
  [v28 trailingBorderWidthForScale:1.0];
  double v30 = v29;

  if (v30 > 0.0)
  {
    v31 = [(UIPanelController *)self _trailingBorderView];

    if (!v31)
    {
      v32 = [(UIPanelController *)self _createBorderView];
      [(UIPanelController *)self _setTrailingBorderView:v32];
    }
    uint64_t v11 = [(UIPanelController *)self _trailingBorderView];
    [(id)v11 setBackgroundColor:v22];
    [(id)v11 setNeedsLayout];
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v11 = 0;
LABEL_31:
  if (v12 | v11)
  {
    v33 = [v162 configuration];
    v34 = [v33 borderColor];
    [(UIPanelController *)self _setBorderViewsObserveViewBackgroundColor:v34 == 0];
  }
  else
  {
    [(UIPanelController *)self _setBorderViewsObserveViewBackgroundColor:0];
  }

LABEL_35:
  id v177 = 0;
  id v178 = v10;
  id v176 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v178, &v177, &v176);
  id v159 = v178;

  id v155 = v177;
  id v145 = v176;
  id v174 = 0;
  id v175 = v14;
  id v173 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v175, &v174, &v173);
  id v35 = v175;

  id v157 = v174;
  id v144 = v173;
  id v171 = 0;
  id v172 = v13;
  id v170 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v172, &v171, &v170);
  id v36 = v172;

  id v37 = v171;
  id v143 = v170;
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:5];
  v152 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
  if (v159) {
    objc_msgSend(v38, "addObject:");
  }
  id v39 = v157;
  if (v155) {
    objc_msgSend(v38, "addObject:");
  }
  v146 = v37;
  v161 = v36;
  if ((!v35 || ([v162 leadingOverlapsMain] & 1) == 0)
    && (!v36 || ![v162 trailingOverlapsMain]))
  {
    uint64_t v40 = 0;
    if (!v35) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
  uint64_t v40 = [(UIPanelController *)self dimmingView];
  if (v40) {
    [v38 addObject:v40];
  }
  id v39 = v157;
  if (v35)
  {
LABEL_48:
    [v38 addObject:v35];
    if (v39) {
      [v38 addObject:v39];
    }
    [v152 addObject:v35];
    if (v12) {
      [v38 addObject:v12];
    }
  }
LABEL_52:
  if (v36)
  {
    [v38 addObject:v36];
    if (v37) {
      [v38 addObject:v37];
    }
    [v152 addObject:v36];
    if (v11) {
      [v38 addObject:v11];
    }
  }
  v154 = (void *)v40;
  v41 = [v165 subviews];
  v42 = [v38 array];
  char v43 = [v41 isEqualToArray:v42];

  if ((v43 & 1) == 0)
  {
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    v44 = [v165 subviews];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v166 objects:v187 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v167;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v167 != v46) {
            objc_enumerationMutation(v44);
          }
          v48 = *(void **)(*((void *)&v166 + 1) + 8 * i);
          if (([v38 containsObject:v48] & 1) == 0) {
            [v48 removeFromSuperview];
          }
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v166 objects:v187 count:16];
      }
      while (v45);
    }

    if (v159)
    {
      [v165 insertSubview:v159 atIndex:0];
      uint64_t v49 = 1;
    }
    else
    {
      uint64_t v49 = 0;
    }
    if (v155) {
      [v165 insertSubview:v155 atIndex:v49++];
    }
    if (v154) {
      [v165 insertSubview:v154 atIndex:v49++];
    }
    char v50 = dyld_program_sdk_at_least();
    char v51 = v50;
    if (v12) {
      char v52 = v50;
    }
    else {
      char v52 = 1;
    }
    if ((v52 & 1) == 0) {
      [v165 insertSubview:v12 atIndex:v49++];
    }
    if (v35) {
      [v165 insertSubview:v35 atIndex:v49++];
    }
    if (v157) {
      [v165 insertSubview:v157 atIndex:v49++];
    }
    if (v11) {
      char v53 = v51;
    }
    else {
      char v53 = 1;
    }
    if ((v53 & 1) == 0) {
      [v165 insertSubview:v11 atIndex:v49++];
    }
    if (v161) {
      [v165 insertSubview:v161 atIndex:v49++];
    }
    if (v146) {
      [v165 insertSubview:v146 atIndex:v49++];
    }
    char v54 = v51 ^ 1;
    if (v12 && (v54 & 1) == 0) {
      [v165 insertSubview:v12 atIndex:v49++];
    }
    if (v11) {
      char v55 = v54;
    }
    else {
      char v55 = 1;
    }
    if ((v55 & 1) == 0) {
      [v165 insertSubview:v11 atIndex:v49];
    }
  }
  if ((*(unsigned char *)&self->_panelControllerFlags & 8) != 0)
  {
    double v59 = *MEMORY[0x1E4F1DAD8];
    double v61 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [v165 bounds];
    a4.width = v56;
    a4.height = v57;
    double v59 = v58;
    double v61 = v60;
  }
  v62 = [(UIPanelController *)self view];
  int v158 = [v62 _shouldReverseLayoutDirection];

  [v165 _currentScreenScale];
  double v64 = v63;
  objc_msgSend(v154, "setFrame:", v59, v61, a4.width, a4.height);
  id v147 = v35;
  id v65 = (id)v12;
  id v156 = v159;
  id v66 = (id)v11;
  id v148 = v161;
  id v67 = v162;
  id v68 = v152;
  id v153 = v150;
  id v163 = v138;
  id v151 = v139;
  if (v35) {
    int v69 = [v67 leadingOverlapsMain] ^ 1;
  }
  else {
    int v69 = 0;
  }
  if (v161) {
    int v70 = [v67 trailingOverlapsMain] ^ 1;
  }
  else {
    int v70 = 0;
  }
  [v67 leadingWidth];
  UIRoundToScale(v71, v64);
  double v73 = v72;
  [v67 trailingWidth];
  UIRoundToScale(v74, v64);
  double v140 = v75;
  double v76 = 0.0;
  if (([v67 leadingOverlapsMain] & 1) == 0)
  {
    [v67 leadingDragOffset];
    if (v77 > 0.0)
    {
      [v67 leadingDragOffset];
      double v76 = 0.0 - v78;
    }
  }
  if ([v67 leadingOverlapsMain]
    && ([v67 _leadingEntirelyOverlapsMain] & 1) == 0)
  {
    [v67 _leadingOverlayWidth];
    double v76 = v76 + v73 - v79;
  }
  double v80 = 0.0;
  if (([v67 trailingOverlapsMain] & 1) == 0)
  {
    [v67 trailingDragOffset];
    if (v81 > 0.0)
    {
      [v67 trailingDragOffset];
      double v80 = v82 + 0.0;
    }
  }
  if ([v67 trailingOverlapsMain]
    && ([v67 _trailingEntirelyOverlapsMain] & 1) == 0)
  {
    [v67 trailingWidth];
    double v84 = v83;
    [v67 _trailingOverlayWidth];
    double v80 = v80 + v85 - v84;
  }
  UIRoundToScale(v76, v64);
  double v87 = v86;
  UIRoundToScale(v80, v64);
  if (v159)
  {
    double v89 = v88;
    v189.origin.x = v59;
    v189.origin.y = v61;
    v189.size.width = a4.width;
    v189.size.height = a4.height;
    double Width = CGRectGetWidth(v189);
    if (v69)
    {
      double v91 = -v87;
      if (v87 >= 0.0) {
        double v91 = v87;
      }
      double Width = Width - (v73 - v91);
      if (v65)
      {
        v92 = [v67 configuration];
        [v92 leadingBorderWidthForScale:v64];
        double v94 = v93;

        double Width = Width - v94;
      }
    }
    if (v70)
    {
      double v95 = -v89;
      if (v89 >= 0.0) {
        double v95 = v89;
      }
      double Width = Width - (v140 - v95);
      if (v66)
      {
        v96 = [v67 configuration];
        [v96 trailingBorderWidthForScale:v64];
        double v98 = v97;

        double Width = Width - v98;
      }
    }
  }
  else
  {
    double Width = 0.0;
  }
  v190.origin.x = v59;
  v190.origin.y = v61;
  v190.size.width = a4.width;
  v190.size.height = a4.height;
  CGFloat Height = CGRectGetHeight(v190);
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x2020000000;
  double v186 = 0.0;
  if (v158)
  {
    v191.origin.x = v59;
    v191.origin.y = v61;
    v191.size.width = a4.width;
    v191.size.height = a4.height;
    double v87 = CGRectGetWidth(v191) - v87;
  }
  double v186 = v87;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __unspecifiedLayoutSideBySideViews_block_invoke;
  aBlock[3] = &unk_1E52E9938;
  char v184 = v158 ^ 1;
  v182 = v185;
  CGFloat v183 = Height;
  id v100 = v68;
  id v180 = v100;
  id v101 = v67;
  id v181 = v101;
  v102 = _Block_copy(aBlock);
  v103 = (void (**)(void, void, void, void))v102;
  if (v69)
  {
    (*((void (**)(void *, id, void, id, double))v102 + 2))(v102, v147, 0, v153, v73);
    v104 = [v101 configuration];
    [v104 leadingBorderWidthForScale:v64];
    ((void (**)(void, id, void, void))v103)[2](v103, v65, 0, 0);
  }
  ((void (*)(void (**)(void, void, void, void), id, void, id, double))v103[2])(v103, v156, 0, v163, Width);
  if (v70)
  {
    v105 = [v101 configuration];
    [v105 trailingBorderWidthForScale:v64];
    ((void (**)(void, id, void, void))v103)[2](v103, v66, 0, 0);

    ((void (*)(void (**)(void, void, void, void), id, void, id, double))v103[2])(v103, v148, 0, v151, v140);
  }
  BOOL v106 = v35 == 0;

  _Block_object_dispose(v185, 8);
  id v107 = v147;
  id v160 = v65;
  id v149 = v148;
  id v108 = v66;
  id v109 = v101;
  id v110 = v100;
  id v111 = v153;
  id v112 = v151;
  if (v106) {
    int v113 = 0;
  }
  else {
    int v113 = [v109 leadingOverlapsMain];
  }
  if (v161) {
    int v114 = [v109 trailingOverlapsMain];
  }
  else {
    int v114 = 0;
  }
  [v109 leadingDragOffset];
  double v116 = v115;
  unsigned int v117 = [v109 trailingOverlapsMain];
  if (v113)
  {
    [v109 leadingWidth];
    double v119 = v118;
    v192.origin.x = v59;
    v192.origin.y = v61;
    v192.size.width = a4.width;
    v192.size.height = a4.height;
    double v120 = CGRectGetHeight(v192);
    if (v158)
    {
      v193.origin.x = v59;
      v193.origin.y = v61;
      v193.size.width = a4.width;
      v193.size.height = a4.height;
      double v121 = CGRectGetWidth(v193);
      v194.origin.x = 0.0;
      v194.origin.y = 0.0;
      v194.size.width = v119;
      v194.size.height = v120;
      double v122 = v116 + v121 - CGRectGetWidth(v194);
    }
    else
    {
      double v122 = -v116;
    }
    if ([v110 containsObject:v107])
    {
      [v109 _keyboardAdjustment];
      double v120 = v120 - v123;
    }
    if (v111) {
      objc_msgSend(v111, "_updateControlledViewsToFrame:", v122, 0.0, v119, v120);
    }
    else {
      objc_msgSend(v107, "setFrame:", v122, 0.0, v119, v120);
    }
    if (v160)
    {
      v124 = [v109 configuration];
      [v124 leadingBorderWidthForScale:v64];
      double v126 = v125;

      if (v158)
      {
        double v127 = -v126;
      }
      else
      {
        v195.origin.y = 0.0;
        v195.origin.x = v122;
        v195.size.width = v119;
        v195.size.height = v120;
        double v127 = CGRectGetWidth(v195);
      }
      v196.origin.y = 0.0;
      v196.origin.x = v122;
      v196.size.width = v119;
      v196.size.height = v120;
      CGRect v197 = CGRectOffset(v196, v127, 0.0);
      objc_msgSend(v160, "setFrame:", v197.origin.x, v197.origin.y, v126, v197.size.height);
    }
  }
  if (v114)
  {
    [v109 trailingWidth];
    double v129 = v128;
    v198.origin.x = v59;
    v198.origin.y = v61;
    v198.size.width = a4.width;
    v198.size.height = a4.height;
    double v130 = CGRectGetHeight(v198);
    double v131 = (double)v117;
    if ((v158 & 1) == 0)
    {
      v199.origin.x = v59;
      v199.origin.y = v61;
      v199.size.width = a4.width;
      v199.size.height = a4.height;
      double v132 = CGRectGetWidth(v199);
      v200.origin.x = 0.0;
      v200.origin.y = 0.0;
      v200.size.width = v129;
      v200.size.height = v130;
      double v131 = v132 - CGRectGetWidth(v200) - v131;
    }
    if ([v110 containsObject:v107])
    {
      [v109 _keyboardAdjustment];
      double v130 = v130 - v133;
    }
    if (v112) {
      objc_msgSend(v112, "_updateControlledViewsToFrame:", v131, 0.0, v129, v130);
    }
    else {
      objc_msgSend(v149, "setFrame:", v131, 0.0, v129, v130);
    }
    if (v108)
    {
      v134 = [v109 configuration];
      [v134 trailingBorderWidthForScale:v64];
      double v136 = v135;

      if (v158)
      {
        v201.origin.y = 0.0;
        v201.origin.x = v131;
        v201.size.width = v129;
        v201.size.height = v130;
        double v137 = CGRectGetWidth(v201);
      }
      else
      {
        double v137 = -v136;
      }
      v202.origin.y = 0.0;
      v202.origin.x = v131;
      v202.size.width = v129;
      v202.size.height = v130;
      CGRect v203 = CGRectOffset(v202, v137, 0.0);
      objc_msgSend(v108, "setFrame:", v203.origin.x, v203.origin.y, v136, v203.size.height);
    }
  }

  layoutPresentationViews(v165, v163, v145);
  layoutPresentationViews(v165, v111, v144);
  layoutPresentationViews(v165, v112, v143);
}

void __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v12 = (id *)*a1;
  id v6 = -[UIView __viewDelegate](v12);
  BOOL v7 = [v6 _presentationController];

  if (v7
    && ([v7 shouldPresentInFullscreen] & 1) == 0
    && ([v7 containerView], BOOL v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    int v9 = [v7 shouldRemovePresentersView];
    id v10 = [v7 containerView];
    if (v9)
    {
      *a1 = v10;
      *a2 = 0;
    }
    else
    {
      *a2 = v10;
    }
    id v11 = [v7 containerView];
  }
  else
  {
    id v11 = 0;
    *a2 = 0;
  }
  *a3 = v11;
}

- (void)dealloc
{
  [(UIPanelController *)self _stopObservingKeyboardNotifications];
  [(UIPanelController *)self _setBorderViewsObserveViewBackgroundColor:0];
  v3.receiver = self;
  v3.super_class = (Class)UIPanelController;
  [(UIPanelController *)&v3 dealloc];
}

- (void)_stopObservingKeyboardNotifications
{
  if ((*((unsigned char *)&self->_panelControllerFlags + 1) & 8) != 0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"UIKeyboardPrivateWillShowNotification" object:0];
    [v3 removeObserver:self name:@"UIKeyboardPrivateWillHideNotification" object:0];
    [v3 removeObserver:self name:@"UIKeyboardPrivateDidChangeFrameNotification" object:0];
    *(_DWORD *)&self->_panelControllerFlags &= ~0x800u;
  }
}

- (void)_setBorderViewsObserveViewBackgroundColor:(BOOL)a3
{
  if (((((*((unsigned char *)&self->_panelControllerFlags + 1) & 0x10) == 0) ^ a3) & 1) == 0)
  {
    view = self->_view;
    if (a3)
    {
      [(UILayoutContainerView *)view addObserver:self forKeyPath:@"backgroundColor" options:1 context:0];
      int v5 = 4096;
    }
    else
    {
      [(UILayoutContainerView *)view removeObserver:self forKeyPath:@"backgroundColor"];
      int v5 = 0;
    }
    self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFEFFF | v5);
  }
}

- (int64_t)collapsedState
{
  v2 = [(UIPanelController *)self _internalState];
  int64_t v3 = [v2 collapsedState];

  return v3;
}

- (BOOL)isAnimating
{
  int64_t v3 = [(UIPanelController *)self _internalState];
  v4 = [v3 animationState];
  if (v4)
  {
    int v5 = [(UIPanelController *)self _internalState];
    id v6 = [v5 animationState];
    [v6 progress];
    if (v7 >= 1.0)
    {
      int v9 = [(UIPanelController *)self _internalState];
      id v10 = [v9 animationState];
      char v8 = [v10 isFinishingAnimation];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setLeadingTrailingWrapsNavigationController:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFBFFF | v3);
}

- (void)setSupplementaryViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__destTransitionView, 0);
  objc_storeStrong((id *)&self->__sourceTransitionView, 0);
  objc_storeStrong((id *)&self->__primaryParallaxDimmingView, 0);
  objc_storeStrong((id *)&self->__captureView, 0);
  objc_storeStrong((id *)&self->__supplementaryParallaxShadowView, 0);
  objc_storeStrong((id *)&self->__primaryOrSupplementaryShadowView, 0);
  objc_storeStrong((id *)&self->__overlayEdgeShadowView, 0);
  objc_storeStrong((id *)&self->__supplementaryBorderView, 0);
  objc_storeStrong((id *)&self->__trailingBorderView, 0);
  objc_storeStrong((id *)&self->__leadingBorderView, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__lastPossiblePublicStates, 0);
  objc_storeStrong((id *)&self->__lastComputedPublicState, 0);
  objc_storeStrong((id *)&self->__suspendedConfiguration, 0);
  objc_storeStrong((id *)&self->__previousInternalState, 0);
  objc_storeStrong((id *)&self->__internalState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_floatingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationBarForContentLayoutGuideAnimation, 0);
  objc_storeStrong((id *)&self->_supplementaryBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_trailingBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_leadingBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_owningViewController);
  objc_storeStrong((id *)&self->_wrapperBlocksForNextUpdate, 0);
}

- (void)_collapseWithTransitionCoordinator:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  int v5 = [(UIPanelController *)self _internalState];
  uint64_t v6 = [v5 collapsedState];

  if ((unint64_t)(v6 - 1) <= 1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPanelController", &_collapseWithTransitionCoordinator____s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134283521;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring redundant collapse request (non-workaround path): current collapsedState: %{private}ld", (uint8_t *)&buf, 0xCu);
      }
    }
    goto LABEL_38;
  }
  char v8 = [(UIPanelController *)self _internalState];
  [v8 setCollapsedState:1];

  [(UIPanelController *)self setRunExpandScheduled:0];
  int v9 = [(UIPanelController *)self delegate];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v77 = 0x3032000000;
  double v78 = __Block_byref_object_copy__58;
  double v79 = __Block_byref_object_dispose__58;
  id v80 = 0;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 primaryViewControllerForCollapsingPanelController:self];
    id v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;
  }
  uint64_t v70 = 0;
  double v71 = &v70;
  uint64_t v72 = 0x3032000000;
  double v73 = __Block_byref_object_copy__58;
  double v74 = __Block_byref_object_dispose__58;
  uint64_t v12 = [(UIPanelController *)self _internalState];
  id v75 = [v12 supplementaryViewController];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v14 = [(UIPanelController *)self leadingViewController];
    v15 = (void *)v14;
    if (v14)
    {
      int v16 = 0;
      double v17 = (void *)v14;
    }
    else
    {
      uint64_t v18 = [(UIPanelController *)self trailingViewController];
      int v3 = (void *)v18;
      if (v18)
      {
        int v16 = 0;
        double v17 = (void *)v18;
      }
      else
      {
        double v17 = (void *)v71[5];
        if (v17)
        {
          int v3 = 0;
          int v16 = 0;
        }
        else
        {
          double v17 = [(UIPanelController *)self mainViewController];
          int v3 = 0;
          int v16 = 1;
        }
      }
    }
    objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v17);
    if (v16) {

    }
    if (!v15) {
    BOOL v13 = *(void *)(*((void *)&buf + 1) + 40) == v71[5];
    }
  }
  uint64_t v64 = 0;
  id v65 = &v64;
  uint64_t v66 = 0x3032000000;
  id v67 = __Block_byref_object_copy__58;
  id v68 = __Block_byref_object_dispose__58;
  id v69 = [(UIPanelController *)self mainViewController];
  v19 = v65;
  if (v65[5])
  {
    -[UIPanelController setPreservedDetailController:](self, "setPreservedDetailController:");
    v19 = v65;
    uint64_t v20 = (void *)v65[5];
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (v20 == *(void **)(*((void *)&buf + 1) + 40))
  {
    v19[5] = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v22 = 2;
    goto LABEL_34;
  }
  uint64_t v21 = [v9 topColumnForCollapsingPanelController:self];
  uint64_t v22 = v21;
  switch(v21)
  {
    case 0:
      goto LABEL_31;
    case 1:
LABEL_32:
      v26 = (void *)v65[5];
      v65[5] = 0;

      break;
    case 3:
      uint64_t v23 = [v9 viewControllerForColumn:3];
      double v24 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v23;

LABEL_31:
      double v25 = (void *)v71[5];
      v71[5] = 0;

      goto LABEL_32;
  }
LABEL_34:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E52E96A8;
  void aBlock[4] = self;
  p_long long buf = &buf;
  BOOL v63 = v13;
  double v60 = &v70;
  double v61 = &v64;
  uint64_t v62 = v22;
  id v27 = v9;
  id v57 = v27;
  id v28 = v45;
  id v58 = v28;
  double v29 = (void (**)(void *, void))_Block_copy(aBlock);
  int64_t v30 = [(UIPanelController *)self style];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  char v53 = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_387;
  char v54 = &__block_descriptor_33_e24___UIView_16__0__UIView_8l;
  BOOL v55 = v30 != 0;
  v31 = [(UIPanelController *)self leadingViewController];
  v32 = [v31 _existingView];
  v33 = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_387((uint64_t)v52, v32);

  v34 = [(UIPanelController *)self supplementaryViewController];
  id v35 = [v34 _existingView];
  id v36 = v53((uint64_t)v52, v35);

  id v37 = [(UIPanelController *)self trailingViewController];
  v38 = [v37 _existingView];
  id v39 = v53((uint64_t)v52, v38);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2_390;
  v46[3] = &unk_1E52E96F0;
  id v40 = v33;
  id v47 = v40;
  id v41 = v36;
  id v48 = v41;
  id v42 = v39;
  id v49 = v42;
  char v50 = self;
  id v43 = v27;
  id v51 = v43;
  v44 = (void (**)(void *, void))_Block_copy(v46);
  if (v28)
  {
    [v28 animateAlongsideTransition:v29 completion:v44];
  }
  else
  {
    v29[2](v29, 0);
    v44[2](v44, 0);
  }

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&buf, 8);
LABEL_38:
}

id __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_387(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(unsigned char *)(a1 + 32)) {
    goto LABEL_4;
  }
  id v5 = [v3 window];

  if (!v5) {
    goto LABEL_6;
  }
  int v6 = [v4 autoresizingMask];
  if ((v6 & 2) != 0)
  {
    [v4 setAutoresizingMask:v6 & 0xFFFFFFFD];
    id v5 = v4;
  }
  else
  {
LABEL_4:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4 animateTransition:(BOOL)a5
{
  BOOL v5 = a4;
  id v10 = a3;
  double v7 = [(UIPanelController *)self _internalState];
  id v8 = [v7 mainViewController];

  if (v8 != v10)
  {
    if (v5) {
      [(UIPanelController *)self _removeIdentifiedChildViewController:v8];
    }
    int v9 = [(UIPanelController *)self _internalState];
    [v9 setMainViewController:v10];
  }
  if (v5) {
    [(UIPanelController *)self _addIdentifiedChildViewController:v10];
  }
}

- (void)_performSingleDeferredUpdatePass
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v58 = [(UIPanelController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v57 = [v58 panelControllerWillUpdate:self];
  }
  else
  {
    id v57 = 0;
  }
  v2 = [(UIPanelController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  char v74 = 0;
  double v7 = [(UIPanelController *)self _internalState];
  id v8 = [v7 configuration];
  uint64_t v9 = [v8 forceOverlay];

  id v10 = [(UIPanelController *)self _internalState];
  id v11 = [(UIPanelController *)self view];
  double v59 = objc_msgSend(v10, "computePossibleStatesGivenParentView:withSize:forceOverlay:", v11, v9, v4, v6);

  if (v57)
  {
    uint64_t v12 = v57[2]();
    BOOL v13 = [(UIPanelController *)self _internalState];
    [v13 setStateRequest:v12];

    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      uint64_t v14 = [(UIPanelController *)self _internalState];
      [v14 setExternallyAnimatingStateRequest:v12];

      v15 = [(UIPanelController *)self currentState];
      uint64_t v16 = affectedSidesFromState(v15);
      double v17 = [(UIPanelController *)self _internalState];
      [v17 setExternallyAnimatingAffectedSides:v16];

      objc_initWeak(&location, self);
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke;
      v70[3] = &unk_1E52DF168;
      objc_copyWeak(&v72, &location);
      id v71 = v12;
      +[UIView _addCompletion:v70];

      objc_destroyWeak(&v72);
      objc_destroyWeak(&location);
    }
  }
  uint64_t v18 = [(UIPanelController *)self _internalState];
  double v60 = (void *)[v18 copy];

  v19 = [v60 animationState];

  if (!v19)
  {
    v31 = [v60 externallyAnimatingStateRequest];

    if (v31)
    {
      id v32 = [v60 externallyAnimatingStateRequest];
      uint64_t v33 = objc_msgSend(v60, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v32, objc_msgSend(v60, "externallyAnimatingAffectedSides"), v59);
    }
    else
    {
      v38 = [v60 interactiveStateRequest];

      if (v38)
      {
        id v32 = [v60 interactiveStateRequest];
        uint64_t v33 = [v60 _stateForInteractiveRequest:v32 withAffectedSides:0 inPossibleStates:v59];
      }
      else
      {
        id v39 = [v60 stateRequest];

        if (!v39) {
          goto LABEL_35;
        }
        id v32 = [v60 stateRequest];
        uint64_t v33 = [v32 _matchingState:v59];
      }
    }
    id v37 = (void *)v33;
    goto LABEL_34;
  }
  uint64_t v20 = [v60 animationState];
  [v20 progress];
  BOOL v22 = v21 == 0.0;

  if (!v22)
  {
    id v32 = v59;
    goto LABEL_28;
  }
  CGFloat v56 = [(UIPanelController *)self possibleStates];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v23 = v59;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (!v24)
  {

    int v28 = 1;
    int v27 = 1;
    int v26 = 1;
LABEL_27:
    id v32 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v56 copyItems:1];

    _updateTreatsHiddenAsOverlapsInStates(v32, v26, v27, v28);
    goto LABEL_28;
  }
  uint64_t v25 = *(void *)v67;
  int v26 = 1;
  int v27 = 1;
  int v28 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v67 != v25) {
        objc_enumerationMutation(v23);
      }
      int64_t v30 = *(void **)(*((void *)&v66 + 1) + 8 * i);
      v26 &= objc_msgSend(v30, "leadingOverlapsMain", v56);
      v27 &= [v30 trailingOverlapsMain];
      v28 &= [v30 supplementaryOverlapsMain];
      if (((v26 | v27) & 1) == 0 && !v28)
      {
        int v26 = 0;
        int v27 = 0;
        goto LABEL_23;
      }
    }
    uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v24) {
      continue;
    }
    break;
  }
LABEL_23:

  if ((v26 | v27 | v28) == 1) {
    goto LABEL_27;
  }
  id v32 = v56;
LABEL_28:
  v34 = objc_msgSend(v60, "animationState", v56);
  id v35 = [v34 stateRequest];
  id v36 = [v60 animationState];
  id v37 = objc_msgSend(v60, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v35, objc_msgSend(v36, "affectedSides"), v32);

LABEL_34:
  if (!v37)
  {
LABEL_35:
    id v37 = [v59 firstObject];
    if (!v37) {
      goto LABEL_50;
    }
  }
  id v40 = self;
  if ((*(unsigned char *)&self->_panelControllerFlags & 8) != 0)
  {
    id v42 = [(UIPanelController *)self _previousInternalState];
    BOOL v43 = v42 == 0;

    if (v43)
    {
      id v41 = v37;
    }
    else
    {
      uint64_t v44 = affectedSidesFromState(v37);
      id v45 = [(UIPanelController *)self _previousInternalState];
      uint64_t v46 = [(UIPanelController *)self _previousInternalState];
      id v47 = [v46 stateRequest];
      id v48 = [(UIPanelController *)self _lastPossiblePublicStates];
      id v41 = [v45 _stateForInteractiveRequest:v47 withAffectedSides:v44 inPossibleStates:v48];

      [(UIPanelController *)self _lastViewSize];
      if (!v41) {
        goto LABEL_50;
      }
      double v4 = v49;
      double v6 = v50;
    }
    id v40 = self;
  }
  else
  {
    id v41 = v37;
  }
  p_panelControllerFlags = &v40->_panelControllerFlags;
  *(_DWORD *)&v40->_panelControllerFlags |= 1u;
  char v52 = [(UIPanelController *)v40 delegate];
  if (*(unsigned char *)p_panelControllerFlags & 8) == 0 && (objc_opt_respondsToSelector()) {
    [v52 panelController:self willChangeToState:v41];
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke_2;
  v62[3] = &unk_1E52E05A8;
  v62[4] = self;
  id v53 = v41;
  id v63 = v53;
  double v64 = v4;
  double v65 = v6;
  [(UIPanelController *)self _performWrappedUpdate:v62];
  char v54 = self;
  if ((*(unsigned char *)&self->_panelControllerFlags & 8) == 0)
  {
    [(UIPanelController *)self _setLastComputedPublicState:v53];
    [(UIPanelController *)self _setPreviousInternalState:v60];
    [(UIPanelController *)self _setLastPossiblePublicStates:v59];
    -[UIPanelController _setLastViewSize:](self, "_setLastViewSize:", v4, v6);
    char v55 = objc_opt_respondsToSelector();
    char v54 = self;
    if (v55)
    {
      objc_msgSend(v52, "panelController:didChangeToState:withSize:", self, v53, v4, v6);
      char v54 = self;
    }
  }
  *(_DWORD *)&v54->_panelControllerFlags &= ~1u;

LABEL_50:
}

- (void)_setNeedsDeferredUpdate
{
  $C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = self->_panelControllerFlags;
  if ((*(_WORD *)&panelControllerFlags & 0x144) != 0)
  {
    if (*(unsigned char *)&panelControllerFlags) {
      self->_$C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&panelControllerFlags | 2);
    }
  }
  else
  {
    id v7 = [(UIPanelController *)self _internalState];
    double v4 = [v7 externallyAnimatingStateRequest];
    if (v4)
    {
    }
    else
    {
      $C2610746699A0CC72A5FB1B737BB04DE v5 = self->_panelControllerFlags;

      if ((*(unsigned char *)&v5 & 8) == 0)
      {
        if (+[UIView _isInAnimationBlockWithAnimationsEnabled]&& ([(UIPanelController *)self collapsedState] & 0xFFFFFFFFFFFFFFFDLL) != 1)
        {
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __44__UIPanelController__setNeedsDeferredUpdate__block_invoke;
          v8[3] = &unk_1E52D9F70;
          v8[4] = self;
          +[UIView performWithoutAnimation:v8];
          *(_DWORD *)&self->_panelControllerFlags &= ~8u;
          [(UIPanelController *)self _setNeedsLayoutAndPerformImmediately:1];
        }
        else
        {
          [(UIPanelController *)self _setNeedsLayoutAndPerformImmediately:0];
        }
      }
    }
  }
}

- (UILayoutContainerView)view
{
  view = self->_view;
  if (!view)
  {
    [(UIPanelController *)self loadView];
    view = self->_view;
  }
  return view;
}

- (UISlidingBarStateRequest)stateRequest
{
  v2 = [(UIPanelController *)self _internalState];
  double v3 = [v2 stateRequest];
  double v4 = (void *)[v3 copy];

  return (UISlidingBarStateRequest *)v4;
}

- (void)setShowShadowViews:(BOOL)a3
{
  self->_showShadowViews = a3;
}

- (void)_setPreviousInternalState:(id)a3
{
}

- (void)_setLastViewSize:(CGSize)a3
{
  self->__lastViewSize = a3;
}

- (void)_setLastPossiblePublicStates:(id)a3
{
}

- (void)_setLastComputedPublicState:(id)a3
{
}

- (void)_performWrappedUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  BOOL v13 = (id *)&v12;
  uint64_t v14 = 0x3042000000;
  v15 = __Block_byref_object_copy__408;
  uint64_t v16 = __Block_byref_object_dispose__409;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__UIPanelController__performWrappedUpdate___block_invoke;
  v9[3] = &unk_1E52E9830;
  id v11 = &v12;
  id v5 = v4;
  id v10 = v5;
  double v6 = _Block_copy(v9);
  objc_storeWeak(v13 + 5, v6);
  id v7 = self->_wrapperBlocksForNextUpdate;
  wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  self->_wrapperBlocksForNextUpdate = 0;

  (*((void (**)(void *, NSMutableArray *))v6 + 2))(v6, v7);
  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&v17);
}

void __43__UIPanelController__performWrappedUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 firstObject];
  if (v4)
  {
    id v5 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__UIPanelController__performWrappedUpdate___block_invoke_2;
    v10[3] = &unk_1E52E3210;
    uint64_t v6 = *(void *)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = v6;
    id v7 = (void (*)(void *, void *))v4[2];
    id v8 = v5;
    v7(v4, v10);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

uint64_t __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateToNewPublicState:withSize:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (UIViewController)supplementaryViewController
{
  v2 = [(UIPanelController *)self _internalState];
  id v3 = [v2 supplementaryViewController];

  return (UIViewController *)v3;
}

- (void)loadView
{
  id v3 = [(UIPanelController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UIPanelController *)self delegate];
    id v5 = (objc_class *)[v4 viewClassForPanelController:self];
  }
  else
  {
    id v5 = (objc_class *)objc_opt_class();
  }

  uint64_t v6 = [(UIPanelController *)self owningViewController];
  [v6 _defaultInitialViewFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = (UILayoutContainerView *)objc_msgSend([v5 alloc], "initWithFrame:", v8, v10, v12, v14);
  if (dyld_program_sdk_at_least())
  {
    uint64_t v16 = [(UIPanelController *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(UIPanelController *)self delegate];
      v19 = [v18 primaryBackgroundColor];
      [(UILayoutContainerView *)v15 setDefaultBackgroundColor:v19];

      goto LABEL_10;
    }
    uint64_t v20 = +[UIColor _splitViewBorderColor];
  }
  else
  {
    uint64_t v20 = +[UIColor systemGrayColor];
  }
  uint64_t v18 = (void *)v20;
  [(UILayoutContainerView *)v15 setDefaultBackgroundColor:v20];
LABEL_10:

  [(UIView *)v15 setAutoresizingMask:18];
  [(UILayoutContainerView *)v15 setDelegate:self];
  double v21 = [_UIPanelControllerContentView alloc];
  [(UIView *)v15 bounds];
  id v23 = -[UIView initWithFrame:](v21, "initWithFrame:");
  [(_UIPanelControllerContentView *)v23 _setPanelController:self];
  [(UIView *)v23 setAutoresizingMask:18];
  [(UILayoutContainerView *)v15 addSubview:v23];
  [(UIPanelController *)self _setContentView:v23];
  view = self->_view;
  self->_view = v15;
}

- (UIPanelControllerDelegate)delegate
{
  v2 = [(UIPanelController *)self _internalState];
  id v3 = [v2 delegate];

  return (UIPanelControllerDelegate *)v3;
}

- (void)_setContentView:(id)a3
{
}

- (void)setRunExpandScheduled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFEFFFF | v3);
}

- (void)setDimmingView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_dimmingView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_dimmingView, a3);
    [(UIPanelController *)self _setNeedsDeferredUpdate];
    id v5 = v6;
  }
}

- (void)setPreservedDetailController:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPanelController *)self _internalState];
  [v5 setPreservedDetailController:v4];
}

- (void)_layoutContainerViewWillMoveToWindow:(id)a3
{
  if (a3)
  {
    if ([(UIPanelController *)self _needsFirstTimeUpdateForTraitCollection])
    {
      [(UIPanelController *)self _setNeedsFirstTimeUpdateForTraitCollection:0];
      id v4 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      id v5 = [(UIPanelController *)self owningViewController];
      uint64_t v6 = [v5 traitCollection];

      double v7 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:0];
      [(UIPanelController *)self _updateForTraitCollection:v6 oldTraitCollection:v7 withTransitionCoordinator:v4];

      double v8 = [(UIPanelController *)self owningViewController];
      [v8 _setLastNotifiedTraitCollection:v6];

      [(_UIViewControllerNullAnimationTransitionCoordinator *)v4 _runAlongsideAnimations];
      [(_UIViewControllerNullAnimationTransitionCoordinator *)v4 _runAlongsideCompletionsAfterCommit];
    }
    [(UIPanelController *)self _setNeedsDeferredUpdate];
  }
  else
  {
    [(UIPanelController *)self _setNeedsFirstTimeUpdateForTraitCollection:1];
  }
}

- (void)_removeIdentifiedChildViewController:(id)a3
{
  id v10 = a3;
  id v4 = [v10 parentViewController];
  id v5 = [(UIPanelController *)self owningViewController];

  if (v4 == v5)
  {
    [v10 willMoveToParentViewController:0];
    uint64_t v6 = [v10 _existingView];
    double v7 = v6;
    if (self->_view)
    {
      double v8 = [v6 superview];
      view = self->_view;

      if (v8 == view) {
        [v7 removeFromSuperview];
      }
    }
    [v10 removeFromParentViewController];
  }
}

- (void)_addIdentifiedChildViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v21 = v4;
    id v5 = [v4 parentViewController];
    uint64_t v6 = [(UIPanelController *)self owningViewController];
    if (v5 == (void *)v6)
    {

LABEL_15:
      goto LABEL_16;
    }
    double v7 = (void *)v6;
    double v8 = [(UIPanelController *)self owningViewController];
    double v9 = [v8 childViewControllers];
    uint64_t v10 = [v9 indexOfObjectIdenticalTo:v21];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_16:
      [(UIPanelController *)self _setNeedsDeferredUpdate];
      id v4 = v21;
      goto LABEL_17;
    }
    double v11 = [(UIPanelController *)self owningViewController];
    [v11 addChildViewController:v21];

    if (![(UIPanelController *)self style])
    {
      id v12 = [(UIPanelController *)self leadingViewController];
      if (v12 == v21)
      {
      }
      else
      {
        id v13 = [(UIPanelController *)self trailingViewController];

        if (v13 != v21) {
          goto LABEL_11;
        }
      }
      double v14 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
      v15 = [(UIPanelController *)self owningViewController];
      [v15 setOverrideTraitCollection:v14 forChildViewController:v21];
    }
LABEL_11:
    uint64_t v16 = [(UIPanelController *)self _contentView];
    if (v16)
    {
      char v17 = (void *)v16;
      int64_t v18 = [(UIPanelController *)self style];

      if (!v18)
      {
        v19 = [(UIPanelController *)self _contentView];
        uint64_t v20 = [v21 view];
        [v19 addSubview:v20];
      }
    }
    id v5 = [(UIPanelController *)self owningViewController];
    [v21 didMoveToParentViewController:v5];
    goto LABEL_15;
  }
LABEL_17:
}

- (UIViewController)owningViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
  return (UIViewController *)WeakRetained;
}

- (void)_setNeedsLayoutAndPerformImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_view setNeedsLayout];
  *(_DWORD *)&self->_panelControllerFlags |= 0x2000u;
  if (v3)
  {
    view = self->_view;
    [(UIView *)view layoutIfNeeded];
  }
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIPanelController)initWithOwningViewController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPanelController;
  id v5 = [(UIPanelController *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UIPanelController *)v5 setOwningViewController:v4];
    double v7 = objc_alloc_init(_UIPanelInternalState);
    [(UIPanelController *)v6 _setInternalState:v7];

    double v8 = objc_alloc_init(UISlidingBarConfiguration);
    double v9 = [(UIPanelController *)v6 _internalState];
    [v9 setConfiguration:v8];

    [(UIPanelController *)v6 _setNeedsFirstTimeUpdateForTraitCollection:1];
  }

  return v6;
}

- (void)_setNeedsFirstTimeUpdateForTraitCollection:(BOOL)a3
{
  self->__needsFirstTimeUpdateForTraitCollection = a3;
}

- (void)setOwningViewController:(id)a3
{
}

- (void)_setInternalState:(id)a3
{
}

- (BOOL)_needsFirstTimeUpdateForTraitCollection
{
  return self->__needsFirstTimeUpdateForTraitCollection;
}

- (void)__viewWillLayoutSubviews
{
  uint64_t v3 = [(UIPanelController *)self _sourceTransitionView];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(UIPanelController *)self _sourceTransitionView];
    uint64_t v6 = [v5 superview];
    double v7 = [(UIPanelController *)self view];
    if (v6 == v7)
    {
      $C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = self->_panelControllerFlags;

      if ((*(_WORD *)&panelControllerFlags & 0x400) == 0) {
        return;
      }
    }
    else
    {
    }
  }
  $C2610746699A0CC72A5FB1B737BB04DE v9 = self->_panelControllerFlags;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
    if ((*(_WORD *)&v9 & 0x2000) != 0)
    {
      self->_$C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&v9 & 0xFFFFDFFF);
    }
    else
    {
      uint64_t v10 = [(UIPanelController *)self view];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;
      [(UIPanelController *)self _lastViewSize];
      double v16 = v15;
      double v18 = v17;

      if (v12 == v16 && v14 == v18) {
        return;
      }
      int v19 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      $C2610746699A0CC72A5FB1B737BB04DE v20 = self->_panelControllerFlags;
      if ((((*(unsigned char *)&v20 & 8) == 0) & ~v19) == 0 && (*(unsigned char *)&v20 & 0x80) != 0) {
        return;
      }
    }
    [(UIPanelController *)self _performDeferredUpdate];
  }
}

- (UIView)_sourceTransitionView
{
  return self->__sourceTransitionView;
}

- (void)_performDeferredUpdate
{
  int panelControllerFlags = *(_DWORD *)&self->_panelControllerFlags | 4;
  char v4 = 1;
  do
  {
    self->_int panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(panelControllerFlags & 0xFFFFFFFD);
    [(UIPanelController *)self _performSingleDeferredUpdatePass];
    int panelControllerFlags = (int)self->_panelControllerFlags;
    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
  }
  while ((panelControllerFlags & 2) != 0);
  self->_int panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(panelControllerFlags & 0xFFFFFFF9);
}

- (CGSize)_lastViewSize
{
  double width = self->__lastViewSize.width;
  double height = self->__lastViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)supportsColumnStyle
{
  return self->_style != 0;
}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E52E9680;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:v4];
}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_4;
  v4[3] = &unk_1E52E9680;
  v4[4] = v2;
  char v10 = *(unsigned char *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 _withDisabledAppearanceTransitionsPerform:v4];
}

- (void)_withDisabledAppearanceTransitionsPerform:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIPanelController *)self owningViewController];
  id v6 = objc_opt_class();
  if (v5) {
    BOOL v7 = ((v5[94] >> 1) & 3u) - 1 < 2;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = objc_msgSend(v6, "_withDisabledAppearanceTransitions:forVisibleDescendantsOf:perform:", v7, v5, v4, v4);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v16 = [v15 _existingView];
        double v17 = [v16 window];

        if (!v17) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__UIPanelController__withDisabledAppearanceTransitionsPerform___block_invoke;
    v19[3] = &unk_1E52E97E0;
    id v20 = v9;
    [(UIPanelController *)self addWrapperBlockForNextUpdate:v19];
  }
}

+ (id)_withDisabledAppearanceTransitions:(BOOL)a3 forVisibleDescendantsOf:(id)a4 perform:(id)a5
{
  BOOL v6 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v9 = v8;
  if (!v6)
  {
    id v13 = 0;
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3042000000;
  id v36 = __Block_byref_object_copy__408;
  id v37 = __Block_byref_object_dispose__409;
  id v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__UIPanelController__withDisabledAppearanceTransitions_forVisibleDescendantsOf_perform___block_invoke;
  aBlock[3] = &unk_1E52E9808;
  id v11 = v10;
  id v31 = v11;
  id v32 = &v33;
  uint64_t v12 = _Block_copy(aBlock);
  objc_storeWeak(v34 + 5, v12);
  (*((void (**)(void *, id))v12 + 2))(v12, v7);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) setAppearanceTransitionsAreDisabled:1];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v33, 8);
  objc_destroyWeak(&v38);
  if (v9) {
LABEL_12:
  }
    v9[2](v9);
LABEL_13:
  if (v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "setAppearanceTransitionsAreDisabled:", 0, (void)v22);
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v39 count:16];
      }
      while (v18);
    }
  }
  return v13;
}

void __88__UIPanelController__withDisabledAppearanceTransitions_forVisibleDescendantsOf_perform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 _existingView];
  id v5 = v4;
  if (v4)
  {
    if (([v4 isHidden] & 1) == 0)
    {
      uint64_t v6 = [v5 window];
      if (v6)
      {
        id v7 = (void *)v6;
        char v8 = [v3 appearanceTransitionsAreDisabled];

        if ((v8 & 1) == 0) {
          [*(id *)(a1 + 32) addObject:v3];
        }
      }
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = objc_msgSend(v3, "mutableChildViewControllers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [v14 _existingView];
          int v16 = [v15 isDescendantOfView:v5];

          if (v16)
          {
            id WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                        + 40));
            WeakRetained[2](WeakRetained, v14);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setChangingViewControllerParentage:1];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) _internalState];
  [v3 setCollapsedViewController:v2];

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 80);
    if (v5 == 3)
    {
      id v6 = 0;
    }
    else
    {
      if ([*(id *)(a1 + 32) leadingTrailingWrapsNavigationController]
        && !*(unsigned char *)(a1 + 88))
      {
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) childViewControllers];
        id v6 = [v11 firstObject];
      }
      else
      {
        id v6 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      [v6 _setAllowNestedNavigationControllers:1];
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    [v4 _setOverrideUserInterfaceRenderingMode:0];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _setOverrideUserInterfaceRenderingMode:0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) _setOverrideUserInterfaceRenderingMode:0];
    [*(id *)(a1 + 32) _addIdentifiedChildViewController:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if (v5 != 3
      && ((objc_opt_respondsToSelector() & 1) == 0
       || ([*(id *)(a1 + 40) panelController:*(void *)(a1 + 32) collapseOntoPrimaryViewController:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0))
    {
      char v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v8 || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        if (![v8 _isNavigationController]
          || ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) viewControllers],
              uint64_t v9 = objc_claimAutoreleasedReturnValue(),
              uint64_t v10 = [v9 count],
              v9,
              v10))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([*(id *)(a1 + 40) panelController:*(void *)(a1 + 32) collapsePrimaryViewController:v6 withFallbackSecondaryViewController:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) onTopOfSupplementaryViewController:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) transitionCoordinator:*(void *)(a1 + 48)] & 1) == 0)
          {
            if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
            {
              if (os_variant_has_internal_diagnostics())
              {
                id v13 = __UIFaultDebugAssertLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Incomplete collapse because of unexpectedly nil secondary view controller.", buf, 2u);
                }
              }
              else
              {
                uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_2)+ 8);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)uint64_t v14 = 0;
                  _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Incomplete collapse because of unexpectedly nil secondary view controller.", v14, 2u);
                }
              }
            }
            if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0) {
              [*(id *)(a1 + 40) panelController:*(void *)(a1 + 32) collapsePrimaryViewController:v6 withFallbackSecondaryViewController:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) transitionCoordinator:*(void *)(a1 + 48)];
            }
          }
        }
      }
    }
  }
  return [*(id *)(a1 + 32) _setChangingViewControllerParentage:0];
}

- (void)_setChangingViewControllerParentage:(BOOL)a3
{
  self->__changingViewControllerParentage = a3;
}

- (BOOL)leadingTrailingWrapsNavigationController
{
  return (*((unsigned __int8 *)&self->_panelControllerFlags + 1) >> 6) & 1;
}

BOOL __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_426(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = v4;
  if (v4)
  {
    if (v3)
    {
      id v6 = [v3 superview];

      if (!v6) {
        [v5 _installContentClippingView:v3];
      }
    }
    else
    {
      [v4 _removeContentClippingView];
    }
  }

  return v3 == 0;
}

id __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(unsigned char **)(a1 + 32);
    if ((v4[9] & 0x80) != 0)
    {
      uint64_t v10 = [v4 delegate];
      uint64_t v16 = [v10 panelController:*(void *)(a1 + 32) navigationBarForViewController:v3];
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v18 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Fallback for finding a navigation bar is unreliable", buf, 2u);
        }
      }
      else
      {
        uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category_1)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v19 = 0;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Fallback for finding a navigation bar is unreliable", v19, 2u);
        }
      }
      int v6 = [v3 _isNavigationController];
      char v7 = v6;
      if (v6) {
        char v8 = v3;
      }
      else {
        char v8 = 0;
      }
      id v9 = v8;
      uint64_t v10 = v3;
      if ((v7 & 1) == 0)
      {
        uint64_t v11 = [v3 childViewControllers];
        uint64_t v12 = [v11 firstObject];
        int v13 = [v12 _isNavigationController];

        if (v13)
        {
          uint64_t v14 = [v3 childViewControllers];
          uint64_t v10 = [v14 firstObject];
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      uint64_t v16 = [v10 navigationBar];
    }
    uint64_t v15 = (void *)v16;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  id v8 = a3;
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v8)
    {
      int v6 = [v8 screen];
      [(UIPanelController *)self _observeKeyboardNotificationsOnScreen:v6];

      [(UIPanelController *)self _adjustForKeyboardInfo:0];
    }
    else
    {
      [(UIPanelController *)self _stopObservingKeyboardNotifications];
      char v7 = [(UIPanelController *)self _internalState];
      [v7 setKeyboardAdjustment:0.0];
    }
  }
}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2_390(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = a1[4];
  if (v3) {
    objc_msgSend(a1[4], "setAutoresizingMask:", objc_msgSend(v3, "autoresizingMask") | 2);
  }
  id v4 = a1[5];
  if (v4) {
    objc_msgSend(a1[5], "setAutoresizingMask:", objc_msgSend(v4, "autoresizingMask") | 2);
  }
  id v5 = a1[6];
  if (v5) {
    objc_msgSend(a1[6], "setAutoresizingMask:", objc_msgSend(v5, "autoresizingMask") | 2);
  }
  int v6 = [a1[7] _internalState];
  uint64_t v7 = [v6 collapsedState];

  if (v7 == 1)
  {
    id v8 = [a1[7] _internalState];
    [v8 setCollapsedState:2];

    [a1[7] _setNeedsDeferredUpdate];
    if (objc_opt_respondsToSelector()) {
      [a1[8] panelControllerDidCollapse:a1[7]];
    }
  }
}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _internalState];
  uint64_t v3 = [v2 collapsedState];

  if (v3 == 1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2;
    v6[3] = &unk_1E52E9680;
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    char v12 = *(unsigned char *)(a1 + 88);
    long long v9 = *(_OWORD *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = v5;
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:v6];
  }
}

- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4
{
}

- (void)setMainViewController:(id)a3
{
}

- (void)setLeadingViewController:(id)a3 changingParentage:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  int v6 = [(UIPanelController *)self _internalState];
  id v7 = [v6 leadingViewController];

  if (v7 != v9)
  {
    if (v4) {
      [(UIPanelController *)self _removeIdentifiedChildViewController:v7];
    }
    id v8 = [(UIPanelController *)self _internalState];
    [v8 setLeadingViewController:v9];
  }
  if (v4) {
    [(UIPanelController *)self _addIdentifiedChildViewController:v9];
  }
}

- (void)setLeadingViewController:(id)a3
{
}

- (void)setTrailingViewController:(id)a3 changingParentage:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  int v6 = [(UIPanelController *)self _internalState];
  id v7 = [v6 trailingViewController];

  if (v7 != v9)
  {
    if (v4) {
      [(UIPanelController *)self _removeIdentifiedChildViewController:v7];
    }
    id v8 = [(UIPanelController *)self _internalState];
    [v8 setTrailingViewController:v9];
  }
  if (v4) {
    [(UIPanelController *)self _addIdentifiedChildViewController:v9];
  }
}

- (void)setTrailingViewController:(id)a3
{
}

- (void)setSupplementaryViewController:(id)a3 changingParentage:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  int v6 = [(UIPanelController *)self _internalState];
  id v7 = [v6 supplementaryViewController];

  if (v7 != v9)
  {
    if (v4) {
      [(UIPanelController *)self _removeIdentifiedChildViewController:v7];
    }
    id v8 = [(UIPanelController *)self _internalState];
    [v8 setSupplementaryViewController:v9];
  }
  if (v4) {
    [(UIPanelController *)self _addIdentifiedChildViewController:v9];
  }
}

- (UISlidingBarConfiguration)configuration
{
  uint64_t v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 configuration];
  BOOL v4 = (void *)[v3 copy];

  return (UISlidingBarConfiguration *)v4;
}

- (void)setConfiguration:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(UIPanelController *)self _internalState];
  uint64_t v5 = [v4 configuration];
  char v6 = [v8 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [(UIPanelController *)self _internalState];
    [v7 setConfiguration:v8];

    [(UIPanelController *)self _setNeedsDeferredUpdate];
  }
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setClippingViewsUnnecessary:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_int panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFFFDF | v3);
}

- (BOOL)areClippingViewsUnnecessary
{
  return (*(unsigned char *)&self->_panelControllerFlags >> 5) & 1;
}

- (void)removeChildViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v20 = v4;
    if (![(UIPanelController *)self _changingViewControllerParentage])
    {
      uint64_t v5 = [(UIPanelController *)self _internalState];
      id v6 = [v5 leadingViewController];

      if (v6 == v20)
      {
        id v7 = [(UIPanelController *)self _internalState];
        [v7 setLeadingViewController:0];
      }
      id v8 = [(UIPanelController *)self _internalState];
      id v9 = [v8 mainViewController];

      if (v9 == v20)
      {
        uint64_t v10 = [(UIPanelController *)self _internalState];
        [v10 setMainViewController:0];
      }
      uint64_t v11 = [(UIPanelController *)self _internalState];
      id v12 = [v11 trailingViewController];

      if (v12 == v20)
      {
        int v13 = [(UIPanelController *)self _internalState];
        [v13 setTrailingViewController:0];
      }
      uint64_t v14 = [(UIPanelController *)self _internalState];
      id v15 = [v14 collapsedViewController];

      if (v15 == v20)
      {
        uint64_t v16 = [(UIPanelController *)self _internalState];
        [v16 setCollapsedViewController:0];
      }
      id v17 = [(UIPanelController *)self _internalState];
      id v18 = [v17 preservedDetailController];

      if (v18 == v20)
      {
        long long v19 = [(UIPanelController *)self _internalState];
        [v19 setPreservedDetailController:0];
      }
    }
    [(UIPanelController *)self _setNeedsDeferredUpdate];
    id v4 = v20;
  }
}

- (BOOL)_changingViewControllerParentage
{
  return self->__changingViewControllerParentage;
}

- (void)_updateToNewPublicState:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v677 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![(UIPanelController *)self style])
  {
    -[UIPanelController _unspecifiedUpdateToNewPublicState:withSize:](self, "_unspecifiedUpdateToNewPublicState:withSize:", v7, width, height);
    goto LABEL_787;
  }
  CGFloat r1_24 = width;
  CGFloat v601 = height;
  v613 = v7;
  v614 = self;
  id v8 = [(UIPanelController *)self _contentView];
  id v9 = [(UIPanelController *)v614 _internalState];
  v593 = [v9 leadingViewController];

  uint64_t v10 = [(UIPanelController *)v614 _internalState];
  v529 = [v10 mainViewController];

  uint64_t v11 = [(UIPanelController *)v614 _internalState];
  v592 = [v11 trailingViewController];

  id v12 = [(UIPanelController *)v614 _internalState];
  v577 = [v12 supplementaryViewController];

  BOOL v13 = [v613 _collapsedState] == 1 || objc_msgSend(v613, "_collapsedState") == 2;
  uint64_t v14 = [(UIPanelController *)v614 _internalState];
  v528 = [v14 collapsedViewController];

  id v15 = [(UIPanelController *)v614 configuration];
  uint64_t v544 = [v15 supplementaryEdge];

  v591 = [v613 configuration];
  if (!v13)
  {
    id v568 = v529;
    uint64_t v16 = [v568 view];
    long long v19 = v613;
    [v613 leadingWidth];
    if (v20 <= 0.0 && ([v613 leadingOffscreenWidth], v21 <= 0.0))
    {
      unint64_t v17 = 0;
    }
    else
    {
      unint64_t v17 = [v593 view];

      long long v19 = v613;
    }
    [v19 trailingWidth];
    if (v22 <= 0.0 && ([v19 trailingOffscreenWidth], v23 <= 0.0))
    {
      id v24 = 0;
    }
    else
    {
      id v24 = [v592 view];

      long long v19 = v613;
    }
    [v19 supplementaryWidth];
    if (v25 <= 0.0 && ([v19 supplementaryOffscreenWidth], v26 <= 0.0))
    {
      int v603 = 0;
      BOOL v28 = 0;
      id r1_16 = 0;
    }
    else
    {
      id v27 = [v577 view];

      int v603 = 0;
      BOOL v28 = v27 != 0;
      id r1_16 = v27;
      if (v27 && !v17 && !v24)
      {
        id v29 = v27;
        unint64_t v17 = (unint64_t)v29;
        if (v544)
        {
          unint64_t v18 = 0;
          BOOL v28 = 1;
          id r1_16 = v29;
          int v603 = 1;
          int v30 = 1;
          if ([v591 forceOverlay]) {
            goto LABEL_38;
          }
          goto LABEL_32;
        }
        id v24 = 0;
        int v603 = 1;
        BOOL v28 = 1;
        id r1_16 = v29;
      }
    }
    if ([v591 forceOverlay] & 1) != 0 || v17 && (objc_msgSend(v613, "leadingOverlapsMain"))
    {
      int v30 = 1;
      unint64_t v18 = v17;
      unint64_t v17 = (unint64_t)v24;
      goto LABEL_38;
    }
    unint64_t v18 = v17;
    if (!v24)
    {
      unint64_t v17 = 0;
LABEL_35:
      if (r1_16)
      {
        int v30 = [v613 supplementaryOverlapsMain];
      }
      else
      {
        id r1_16 = 0;
        int v30 = 0;
      }
LABEL_38:
      id v31 = [v591 borderColor];
      if (v31)
      {
      }
      else if ([(UILayoutContainerView *)v614->_view backgroundColorIsDefault])
      {
        id v32 = +[UIColor _splitViewBorderColor];

        if (v30)
        {
          int v606 = 0;
          uint64_t v33 = v614;
          if (!v18) {
            goto LABEL_66;
          }
          goto LABEL_49;
        }
        uint64_t v33 = v614;
        if ([v591 borderAbuttingMainRendersAsShadow])
        {
          if (v18 | v17) {
            int v45 = 1;
          }
          else {
            int v45 = v28;
          }
          int v606 = v45;
          if (!v18) {
            goto LABEL_66;
          }
          goto LABEL_49;
        }
LABEL_48:
        int v606 = 0;
        if (!v18) {
          goto LABEL_66;
        }
LABEL_49:
        [v591 leadingBorderWidthForScale:1.0];
        if (v36 > 0.0)
        {
          id v37 = [(UIPanelController *)v33 _leadingBorderView];

          id v38 = v614;
          if (!v37)
          {
            id v39 = [(UIPanelController *)v614 _createBorderView];
            id v38 = v614;
            [(UIPanelController *)v614 _setLeadingBorderView:v39];
          }
          uint64_t v595 = [(UIPanelController *)v38 _leadingBorderView];
          [(id)v595 setRenderAsShadow:0];
          [(id)v595 setBackgroundColor:v32];
          [(id)v595 setNeedsLayout];
          BOOL v40 = v544 != 0;
          if (!r1_16) {
            BOOL v40 = 1;
          }
          if ((v603 | v40))
          {
            v560 = 0;
          }
          else
          {
            uint64_t v41 = [(UIPanelController *)v614 _supplementaryBorderView];

            id v42 = v614;
            if (!v41)
            {
              BOOL v43 = [(UIPanelController *)v614 _createBorderView];
              id v42 = v614;
              [(UIPanelController *)v614 _setSupplementaryBorderView:v43];
            }
            v560 = [(UIPanelController *)v42 _supplementaryBorderView];
            [v560 setRenderAsShadow:0];
            uint64_t v44 = [(id)v595 backgroundColor];
            [v560 setBackgroundColor:v44];

            [v560 setNeedsLayout];
          }
          uint64_t v33 = v614;
          if (!v17) {
            goto LABEL_77;
          }
LABEL_67:
          [v591 trailingBorderWidthForScale:1.0];
          if (v46 > 0.0)
          {
            id v47 = [(UIPanelController *)v33 _trailingBorderView];

            id v48 = v614;
            if (!v47)
            {
              double v49 = [(UIPanelController *)v614 _createBorderView];
              id v48 = v614;
              [(UIPanelController *)v614 _setTrailingBorderView:v49];
            }
            uint64_t v50 = [(UIPanelController *)v48 _trailingBorderView];
            [(id)v50 setRenderAsShadow:0];
            [(id)v50 setBackgroundColor:v32];
            [(id)v50 setNeedsLayout];
            if (r1_16) {
              BOOL v51 = v544 == 0;
            }
            else {
              BOOL v51 = 1;
            }
            if (((v603 | v51) & 1) == 0)
            {
              char v52 = [(UIPanelController *)v614 _supplementaryBorderView];

              id v53 = v614;
              if (!v52)
              {
                char v54 = [(UIPanelController *)v614 _createBorderView];
                id v53 = v614;
                [(UIPanelController *)v614 _setSupplementaryBorderView:v54];
              }
              char v55 = [(UIPanelController *)v53 _supplementaryBorderView];

              [v55 setRenderAsShadow:0];
              CGFloat v56 = [(id)v50 backgroundColor];
              [v55 setBackgroundColor:v56];

              [v55 setNeedsLayout];
              v560 = v55;
            }
LABEL_78:
            if (v18 | v17) {
              int v57 = v603 ^ 1;
            }
            else {
              int v57 = 0;
            }
            v556 = (void *)v50;
            if (v595 | v50)
            {
              id v58 = [v591 borderColor];
              [(UIPanelController *)v614 _setBorderViewsObserveViewBackgroundColor:v58 == 0];

              if (!v30)
              {
LABEL_83:
                v546 = 0;
                goto LABEL_89;
              }
            }
            else
            {
              [(UIPanelController *)v614 _setBorderViewsObserveViewBackgroundColor:0];
              if (!v30) {
                goto LABEL_83;
              }
            }
            double v59 = v614;
            if ([(UIPanelController *)v614 showShadowViews])
            {
              double v60 = [(UIPanelController *)v614 _overlayEdgeShadowView];

              double v59 = v614;
              if (!v60)
              {
                double v61 = [(UIPanelController *)v614 _createOverlayShadowView];
                double v59 = v614;
                [(UIPanelController *)v614 _setOverlayEdgeShadowView:v61];
              }
            }
            v546 = [(UIPanelController *)v59 _overlayEdgeShadowView];
LABEL_89:
            int v610 = v28 & v57;
            if ((v28 & v57) != 0)
            {
              uint64_t v62 = v614;
              if (![(UIPanelController *)v614 isAnimating])
              {
                [v613 supplementaryDragOffset];
                if (v63 == 0.0)
                {
                  v545 = 0;
                  v572 = 0;
                  goto LABEL_103;
                }
              }
              double v64 = [(UIPanelController *)v614 _supplementaryParallaxShadowView];

              double v65 = v614;
              if (!v64)
              {
                long long v66 = [(UIPanelController *)v614 _createOverlayShadowView];
                double v65 = v614;
                [(UIPanelController *)v614 _setSupplementaryParallaxShadowView:v66];
              }
              v572 = [(UIPanelController *)v65 _supplementaryParallaxShadowView];
              long long v67 = [(UIPanelController *)v614 _primaryParallaxDimmingView];

              if (!v67)
              {
                long long v68 = [UIDimmingView alloc];
                if (v18) {
                  long long v69 = (void *)v18;
                }
                else {
                  long long v69 = (void *)v17;
                }
                [v69 frame];
                uint64_t v70 = -[UIDimmingView initWithFrame:](v68, "initWithFrame:");
                [(UIPanelController *)v614 _setPrimaryParallaxDimmingView:v70];
              }
              v545 = [(UIPanelController *)v614 _primaryParallaxDimmingView];
            }
            else
            {
              v545 = 0;
              v572 = 0;
            }
            uint64_t v62 = v614;
LABEL_103:
            if (((v30 | ((*(unsigned char *)&v62->_panelControllerFlags & 0x20) >> 5)) & 1) == 0
              && ([v591 allowTotalWidthGreaterThanParent] & 1) == 0
              && ($C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = v62->_panelControllerFlags, (*(unsigned char *)&panelControllerFlags & 0x80) == 0)
              && ((*(unsigned char *)&panelControllerFlags & 8) != 0
               || [(UIPanelController *)v62 isAnimating]
               || (*(unsigned char *)&v62->_panelControllerFlags & 0x10) != 0))
            {
              uint64_t v565 = [(UIPanelController *)v62 leadingBarContentClippingView];
              uint64_t v564 = [(UIPanelController *)v614 trailingBarContentClippingView];
              uint64_t v206 = [(UIPanelController *)v614 style];
              char v207 = v603 ^ 1;
              if (v206 != 2) {
                char v207 = 1;
              }
              if (v207)
              {
                uint64_t v563 = 0;
              }
              else
              {
                uint64_t v563 = [(UIPanelController *)v614 supplementaryBarContentClippingView];
              }
            }
            else
            {
              uint64_t v563 = 0;
              uint64_t v564 = 0;
              uint64_t v565 = 0;
            }

            goto LABEL_111;
          }
LABEL_77:
          uint64_t v50 = 0;
          goto LABEL_78;
        }
LABEL_66:
        v560 = 0;
        uint64_t v595 = 0;
        if (!v17) {
          goto LABEL_77;
        }
        goto LABEL_67;
      }
      v34 = [v591 borderColor];
      uint64_t v35 = v34;
      if (v34)
      {
        id v32 = v34;
      }
      else
      {
        id v32 = [(UIView *)v614->_view backgroundColor];
      }
      uint64_t v33 = v614;

      goto LABEL_48;
    }
    unint64_t v17 = (unint64_t)v24;
LABEL_32:
    if ([v613 trailingOverlapsMain])
    {
      int v30 = 1;
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  id v568 = v528;
  uint64_t v16 = [v568 view];
  int v606 = 0;
  int v610 = 0;
  uint64_t v563 = 0;
  uint64_t v564 = 0;
  uint64_t v565 = 0;
  v545 = 0;
  v546 = 0;
  v572 = 0;
  v560 = 0;
  v556 = 0;
  uint64_t v595 = 0;
  id r1_16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
LABEL_111:
  id v658 = v16;
  id v657 = 0;
  id v656 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v658, &v657, &v656);
  id v552 = v658;

  id v539 = v657;
  id v537 = v656;
  id v655 = (id)v18;
  id v654 = 0;
  id v653 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v655, &v654, &v653);
  unint64_t r1_8 = (unint64_t)v655;

  id v538 = v654;
  id v536 = v653;
  id v652 = (id)v17;
  id v651 = 0;
  id v650 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v652, &v651, &v650);
  unint64_t v602 = (unint64_t)v652;

  id v532 = v651;
  id v535 = v650;
  if (v610)
  {
    id v649 = r1_16;
    id v648 = 0;
    id v647 = 0;
    __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v649, &v648, &v647);
    id v72 = v649;

    id v527 = v648;
    id v534 = v647;
    uint64_t v73 = 7;
    id r1_16 = v72;
  }
  else
  {
    id v534 = 0;
    id v527 = 0;
    uint64_t v73 = 5;
  }
  char v74 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v73];
  v584 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v73];
  id v75 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:2];
  id v76 = v74;
  uint64_t v77 = v76;
  double v78 = v614;
  int v79 = r1_8;
  uint64_t v80 = v595;
  unint64_t v81 = (unint64_t)v556;
  if (v552) {
    objc_msgSend(v76, "addObject:");
  }
  if (v539) {
    objc_msgSend(v77, "addObject:");
  }
  if (r1_8)
  {
    if ([v613 leadingOverlapsMain])
    {
      int v79 = 1;
    }
    else if (r1_16 == (id)r1_8)
    {
      int v79 = [v613 supplementaryOverlapsMain];
    }
    else
    {
      int v79 = 0;
    }
  }
  if (!v602) {
    goto LABEL_128;
  }
  if ([v613 trailingOverlapsMain])
  {
    [v591 allowTotalWidthGreaterThanParent];
    goto LABEL_130;
  }
  if (r1_16 == (id)v602) {
    int v82 = [v613 supplementaryOverlapsMain];
  }
  else {
LABEL_128:
  }
    int v82 = 0;
  int v83 = [v591 allowTotalWidthGreaterThanParent];
  if ((v79 | v82) != 1)
  {
    v587 = 0;
    uint64_t v85 = 0;
    if ((v610 & v83) != 1) {
      goto LABEL_137;
    }
    goto LABEL_134;
  }
LABEL_130:
  [(UIPanelController *)v614 _captureView];
  double v78 = v614;
  double v84 = (_UIMTCaptureView *)objc_claimAutoreleasedReturnValue();
  if (!v84)
  {
    double v84 = objc_alloc_init(_UIMTCaptureView);
    [(UIPanelController *)v614 _setMaterialThemesCaptureView:v84];
  }
  v587 = v84;
  [v77 addObject:v84];
LABEL_134:
  uint64_t v85 = [(UIPanelController *)v78 dimmingView];
  if (v85) {
    [v77 addObject:v85];
  }
  uint64_t v80 = v595;
  unint64_t v81 = (unint64_t)v556;
LABEL_137:
  v588 = (void *)v85;
  char v86 = dyld_program_sdk_at_least();
  char v87 = v86;
  if (v80 && (v86 & 1) == 0) {
    [v77 addObject:v80];
  }
  if (r1_8)
  {
    [v77 addObject:r1_8];
    if (v538) {
      [v77 addObject:v538];
    }
    [v584 addObject:r1_8];
  }
  if (v81) {
    char v88 = v87;
  }
  else {
    char v88 = 1;
  }
  if ((v88 & 1) == 0) {
    [v77 addObject:v81];
  }
  if (v602)
  {
    [v77 addObject:v602];
    if (v532) {
      objc_msgSend(v77, "addObject:");
    }
    [v584 addObject:v602];
    if (v81) {
      [v77 addObject:v81];
    }
  }
  if (v610)
  {
    [v77 addObject:r1_16];
    if (v527) {
      objc_msgSend(v77, "addObject:");
    }
    [v584 addObject:r1_16];
    if (v560) {
      [v77 addObject:v560];
    }
  }
  char v89 = v87 ^ 1;
  if (!((v80 == 0) | v89 & 1)) {
    [v77 addObject:v80];
  }
  if (!((v81 == 0) | v89 & 1)) {
    [v77 addObject:v81];
  }
  if (v546 && v85) {
    objc_msgSend(v77, "insertObject:atIndex:", v546, objc_msgSend(v77, "indexOfObject:", v85) + 1);
  }
  if (v606)
  {
    if (v80) {
      v90 = (void *)v80;
    }
    else {
      v90 = (void *)v81;
    }
    if (v560) {
      v90 = v560;
    }
    id v91 = v90;
    [v91 setRenderAsShadow:1];
  }
  if (r1_8 | v602) {
    BOOL v92 = v545 != 0;
  }
  else {
    BOOL v92 = 0;
  }
  BOOL v524 = v92;
  if (v92)
  {
    if (r1_8) {
      unint64_t v93 = r1_8;
    }
    else {
      unint64_t v93 = v602;
    }
    objc_msgSend(v77, "insertObject:atIndex:", v545, objc_msgSend(v77, "indexOfObject:", v93) + 1);
  }
  if (v572)
  {
    uint64_t v94 = [v77 indexOfObject:r1_16];
    if (v81 | v80)
    {
      if (v80)
      {
        [v77 insertObject:v80 atIndex:v94];
        double v95 = v77;
        uint64_t v96 = v80;
      }
      else
      {
        [v77 insertObject:v81 atIndex:v94];
        double v95 = v77;
        uint64_t v96 = v81;
      }
      uint64_t v94 = [v95 indexOfObject:v96];
    }
    [v77 insertObject:v572 atIndex:v94];
  }
  BOOL v533 = (r1_8 | v602) != 0;
  double v97 = [v8 subviews];
  double v98 = [v77 array];
  int v99 = [v97 isEqualToArray:v98];

  id v100 = [0 contentView];
  if (v100)
  {
    id v101 = v100;

LABEL_192:
    v102 = [v101 subviews];
    v103 = [v75 array];
    int v607 = [v102 isEqualToArray:v103] ^ 1;

    goto LABEL_193;
  }
  id v101 = [0 contentView];

  if (v101) {
    goto LABEL_192;
  }
  int v607 = 0;
LABEL_193:
  if (v99)
  {
    [v8 setNeedsLayout];
  }
  else
  {
    long long v645 = 0u;
    long long v646 = 0u;
    long long v643 = 0u;
    long long v644 = 0u;
    v104 = [v8 subviews];
    uint64_t v105 = [v104 countByEnumeratingWithState:&v643 objects:v676 count:16];
    if (v105)
    {
      uint64_t v106 = *(void *)v644;
      do
      {
        for (uint64_t i = 0; i != v105; ++i)
        {
          if (*(void *)v644 != v106) {
            objc_enumerationMutation(v104);
          }
          id v108 = *(void **)(*((void *)&v643 + 1) + 8 * i);
          if (([v77 containsObject:v108] & 1) == 0
            && ([v75 containsObject:v108] & 1) == 0)
          {
            [v108 removeFromSuperview];
          }
        }
        uint64_t v105 = [v104 countByEnumeratingWithState:&v643 objects:v676 count:16];
      }
      while (v105);
    }

    long long v641 = 0u;
    long long v642 = 0u;
    long long v639 = 0u;
    long long v640 = 0u;
    id v109 = v77;
    uint64_t v110 = [v109 countByEnumeratingWithState:&v639 objects:v675 count:16];
    if (v110)
    {
      uint64_t v111 = 0;
      uint64_t v112 = *(void *)v640;
      do
      {
        for (uint64_t j = 0; j != v110; ++j)
        {
          if (*(void *)v640 != v112) {
            objc_enumerationMutation(v109);
          }
          [v8 insertSubview:*(void *)(*((void *)&v639 + 1) + 8 * j) atIndex:v111 + j];
        }
        uint64_t v110 = [v109 countByEnumeratingWithState:&v639 objects:v675 count:16];
        v111 += j;
      }
      while (v110);
    }
  }
  if (v607)
  {
    long long v637 = 0u;
    long long v638 = 0u;
    long long v635 = 0u;
    long long v636 = 0u;
    int v114 = [v101 subviews];
    uint64_t v115 = [v114 countByEnumeratingWithState:&v635 objects:v674 count:16];
    if (v115)
    {
      uint64_t v116 = *(void *)v636;
      do
      {
        for (uint64_t k = 0; k != v115; ++k)
        {
          if (*(void *)v636 != v116) {
            objc_enumerationMutation(v114);
          }
          double v118 = *(void **)(*((void *)&v635 + 1) + 8 * k);
          if (([v77 containsObject:v118] & 1) == 0
            && ([v75 containsObject:v118] & 1) == 0)
          {
            [v118 removeFromSuperview];
          }
        }
        uint64_t v115 = [v114 countByEnumeratingWithState:&v635 objects:v674 count:16];
      }
      while (v115);
    }

    long long v633 = 0u;
    long long v634 = 0u;
    long long v631 = 0u;
    long long v632 = 0u;
    id v119 = v75;
    uint64_t v120 = [v119 countByEnumeratingWithState:&v631 objects:v673 count:16];
    if (v120)
    {
      uint64_t v121 = 0;
      uint64_t v122 = *(void *)v632;
      do
      {
        for (uint64_t m = 0; m != v120; ++m)
        {
          if (*(void *)v632 != v122) {
            objc_enumerationMutation(v119);
          }
          [v101 insertSubview:*(void *)(*((void *)&v631 + 1) + 8 * m) atIndex:v121 + m];
        }
        uint64_t v120 = [v119 countByEnumeratingWithState:&v631 objects:v673 count:16];
        v121 += m;
      }
      while (v120);
    }
  }
  v627[0] = MEMORY[0x1E4F143A8];
  v627[1] = 3221225472;
  v628 = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2;
  v629 = &unk_1E52E9858;
  v630 = v614;
  v623[0] = MEMORY[0x1E4F143A8];
  v623[1] = 3221225472;
  v624 = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_426;
  v625 = &__block_descriptor_40_e37_B24__0__UIView_8__UIViewController_16lu32l8;
  v626 = v627;
  if (__54__UIPanelController__updateToNewPublicState_withSize___block_invoke_426((uint64_t)v623, (void *)v565))
  {
    v124 = [(UIPanelController *)v614 leadingBarContentClippingView];
    double v125 = [v124 subviews];
    BOOL v126 = [v125 count] == 0;

    if (!v126)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v511 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v511, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v511, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v511 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584D8) + 8);
        if (os_log_type_enabled(v511, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v511, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
    }
    double v127 = [(UIPanelController *)v614 leadingBarContentClippingView];
    [v127 removeFromSuperview];
  }
  if (((unsigned int (*)(void *, uint64_t, void *))v624)(v623, v564, v592))
  {
    double v128 = [(UIPanelController *)v614 trailingBarContentClippingView];
    double v129 = [v128 subviews];
    BOOL v130 = [v129 count] == 0;

    if (!v130)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v512 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v512, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v512, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v512 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584E0) + 8);
        if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v512, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
    }
    double v131 = [(UIPanelController *)v614 trailingBarContentClippingView];
    [v131 removeFromSuperview];
  }
  if (((unsigned int (*)(void *, uint64_t, void *))v624)(v623, v563, v577))
  {
    double v132 = [(UIPanelController *)v614 supplementaryBarContentClippingView];
    double v133 = [v132 subviews];
    BOOL v134 = [v133 count] == 0;

    if (!v134)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v513 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v513, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v513, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v513 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584E8) + 8);
        if (os_log_type_enabled(v513, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v513, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
    }
    double v135 = [(UIPanelController *)v614 supplementaryBarContentClippingView];
    [v135 removeFromSuperview];
  }
  if (+[UIView _materialSidebarsEnabled]())
  {
    if ([v613 leadingOverlapsMain]) {
      uint64_t v136 = 2;
    }
    else {
      uint64_t v136 = 0;
    }
    double v137 = [(UIPanelController *)v614 leadingViewController];
    [v137 _setOverrideUserInterfaceRenderingMode:v136];

    if ([v613 trailingOverlapsMain]) {
      uint64_t v138 = 2;
    }
    else {
      uint64_t v138 = 0;
    }
    v139 = [(UIPanelController *)v614 trailingViewController];
    [v139 _setOverrideUserInterfaceRenderingMode:v138];

    if ([v613 supplementaryOverlapsMain]) {
      uint64_t v140 = 2;
    }
    else {
      uint64_t v140 = 0;
    }
    v141 = [(UIPanelController *)v614 supplementaryViewController];
    [v141 _setOverrideUserInterfaceRenderingMode:v140];
  }
  v142 = v614;
  if ((*(unsigned char *)&v614->_panelControllerFlags & 8) != 0)
  {
    CGFloat r1 = *MEMORY[0x1E4F1DAD8];
    double rect = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [v8 bounds];
    CGFloat r1 = v143;
    double rect = v144;
    CGFloat r1_24 = v145;
    CGFloat v601 = v146;
    v142 = v614;
  }
  id v147 = [(UIPanelController *)v142 view];
  int v604 = [v147 _shouldReverseLayoutDirection];

  [v8 _currentScreenScale];
  double v608 = v148;
  if (v610)
  {
    [v613 leadingWidth];
    double v150 = v149;
    [v613 leadingDragOffset];
    if (v150 - v151 <= 0.0
      && ([v613 trailingWidth], double v153 = v152, objc_msgSend(v613, "trailingDragOffset"), v153 - v154 <= 0.0))
    {
      BOOL v526 = 0;
    }
    else
    {
      [v613 supplementaryWidth];
      double v156 = v155;
      [v613 supplementaryDragOffset];
      BOOL v526 = v156 - v157 > 0.0;
    }
    v581 = v560;
    int v158 = r1_16;
  }
  else
  {
    v581 = 0;
    int v158 = 0;
    BOOL v526 = 0;
  }
  BOOL v159 = [(UIPanelController *)v614 wantsFloatingSidebar];
  id v583 = v588;
  id v160 = v613;
  int v161 = v159 | dyld_program_sdk_at_least() ^ 1;
  double v162 = r1;
  double v163 = r1_24;
  double v164 = v601;
  if ((v161 & 1) == 0)
  {
    if (r1_8)
    {
      [v160 leadingWidth];
      double v166 = v165;
      [v160 leadingDragOffset];
    }
    else
    {
      [v160 trailingWidth];
      double v166 = v168;
      [v160 trailingDragOffset];
    }
    double v169 = v167;
    [v160 supplementaryWidth];
    double v171 = v170;
    [v160 supplementaryDragOffset];
    double v173 = v166 + v171 - v169 - v172;
    if (((r1_8 == 0) | v604) == 1)
    {
      double v174 = r1;
      double v162 = r1;
      CGFloat v176 = r1_24;
      CGFloat v175 = v601;
      double v163 = r1_24;
      double v164 = v601;
      if (v173 <= 0.0) {
        goto LABEL_276;
      }
      char v177 = v604 ^ 1;
      if (!v602) {
        char v177 = 1;
      }
      if (v177)
      {
        double v162 = r1;
LABEL_275:
        double v178 = rect;
        CGFloat v179 = v176;
        CGFloat v180 = v175;
        double v181 = CGRectGetWidth(*(CGRect *)&v174);
        v678.origin.double x = r1;
        v678.origin.double y = rect;
        v678.size.double width = r1_24;
        v678.size.double height = v601;
        double v164 = CGRectGetHeight(v678);
        double v163 = v181 - v173;
        goto LABEL_276;
      }
    }
    else
    {
      double v174 = r1;
      double v162 = r1;
      CGFloat v176 = r1_24;
      CGFloat v175 = v601;
      double v163 = r1_24;
      double v164 = v601;
      if (v173 <= 0.0) {
        goto LABEL_276;
      }
    }
    double v162 = v174 + v173;
    goto LABEL_275;
  }
LABEL_276:
  objc_msgSend(v583, "setFrame:", v162, rect, v163, v164);
  v182 = [v160 configuration];
  int v183 = [v182 allowTotalWidthGreaterThanParent];

  double v185 = 1.0;
  if ((!v526 | v183) != 1) {
    goto LABEL_302;
  }
  if (r1_16) {
    char v186 = v183;
  }
  else {
    char v186 = 1;
  }
  if (v186)
  {
    double v185 = 0.0;
    if (!(r1_8 | v602)) {
      goto LABEL_302;
    }
    if ((v526 & v183) == 1)
    {
      objc_msgSend(v160, "leadingDragOffset", 0.0);
      double v188 = v187;
      [v160 trailingDragOffset];
      double v185 = v188 + v189;
      double v184 = 1.0;
      if (v185 == 0.0) {
        goto LABEL_299;
      }
    }
    if (v183)
    {
      id v190 = v160;
      [v190 leadingWidth];
      double v192 = v191;
      [v190 trailingWidth];
      double v194 = v193;

      id v195 = v190;
      [v195 leadingDragOffset];
      double v197 = v196;
      [v195 trailingDragOffset];
      double v199 = v198;
      [v195 supplementaryDragOffset];
      double v201 = v200;

      double v184 = 0.0;
      if (v192 + v194 > 0.0)
      {
        double v202 = (v192 + v194 - (v197 + v199 + v201)) / (v192 + v194);
        goto LABEL_297;
      }
    }
    else
    {
      objc_msgSend(v160, "leadingWidth", v185);
      double v209 = v208;
      [v160 trailingWidth];
      double v211 = v210;
      [v160 leadingDragOffset];
      double v213 = v212;
      [v160 trailingDragOffset];
      double v184 = 0.0;
      if (v209 + v211 > 0.0)
      {
        double v202 = (v209 + v211 - (v213 + v214)) / (v209 + v211);
LABEL_297:
        double v215 = fmax(v202, 0.0);
        double v184 = 1.0;
        if (v215 <= 1.0) {
          double v184 = v215;
        }
      }
    }
LABEL_299:
    double v216 = 1.0;
    if (v183) {
      double v216 = 0.5;
    }
    double v185 = v216 * v184;
    goto LABEL_302;
  }
  objc_msgSend(v160, "supplementaryWidth", 1.0);
  double v204 = v203;
  [v160 supplementaryDragOffset];
  double v184 = v205;
  double v185 = 0.0;
  if (v204 > 0.0)
  {
    double v185 = fmax((v204 - v184) / v204, 0.0);
    double v184 = 1.0;
    if (v185 > 1.0) {
      double v185 = 1.0;
    }
  }
LABEL_302:
  objc_msgSend(v583, "setPercentDisplayed:", v185, v184);

  if (v544) {
    v217 = 0;
  }
  else {
    v217 = v577;
  }
  if (v544) {
    v218 = v577;
  }
  else {
    v218 = 0;
  }
  if (v593) {
    v217 = v593;
  }
  id v219 = v217;
  v220 = v592;
  if (!v592) {
    v220 = v218;
  }
  id v221 = v220;
  int v522 = [v591 _supplementaryAdoptsPrimaryBackgroundStyle];
  int v222 = v610 ^ 1;
  if (!r1_16) {
    int v222 = 0;
  }
  int v611 = v222;
  id v541 = (id)r1_8;
  id v566 = (id)v595;
  id v223 = v158;
  id v589 = v581;
  id v554 = v572;
  id v582 = v552;
  id v570 = v556;
  id v543 = (id)v602;
  id v224 = v160;
  id v523 = v584;
  id v585 = v219;
  id v574 = v577;
  id v569 = v568;
  id v550 = v221;
  v578 = v223;
  if (v223) {
    BOOL v225 = r1_8 != 0;
  }
  else {
    BOOL v225 = 0;
  }
  if (v602 != 0 && v225)
  {
    v509 = [MEMORY[0x1E4F28B00] currentHandler];
    v510 = objc_msgSend(NSString, "stringWithUTF8String:", "void layoutSideBySideViewsColumnStyle(UIView *__strong, UIView *__strong, UIPanelBorderView *__strong, UIView *__strong, BOOL, UIPanelBorderView *__strong, UIView *__strong, UIView *__strong, UIPanelBorderView *__strong, UIView *__strong, UIView *__strong, BOOL, UISlidingBarState *__strong, BOOL, CGRect, NSMutableSet *__strong, CGFloat, UIViewController *__strong, UIViewController *__strong, UIViewController *__strong, UIViewController *__strong)");
    [v509 handleFailureInFunction:v510, @"UIPanelController.m", 3162, @"Side-by-side layout not supported for all non-nil leading, trailing, and supplementary views. This is an internal UIKit problem." file lineNumber description];
  }
  int v226 = [v224 supplementaryOverlapsMain];
  if (v585) {
    char v227 = v611;
  }
  else {
    char v227 = 1;
  }
  if (v585) {
    int v228 = v226;
  }
  else {
    int v228 = 0;
  }
  if (v227)
  {
    if (v585) {
      int v229 = v226;
    }
    else {
      int v229 = 1;
    }
    if (v585) {
      int v230 = 0;
    }
    else {
      int v230 = v226;
    }
    if (v611 & 1 | (v585 != 0))
    {
      int v530 = v230;
      int v231 = (v585 != 0) | v226;
    }
    else
    {
      int v231 = [v224 trailingOverlapsMain];
      int v229 = 1;
      int v530 = v231;
    }
  }
  else
  {
    int v228 = [v224 leadingOverlapsMain];
    int v530 = 0;
    int v231 = 1;
    int v229 = v228;
  }
  v232 = v566;
  if (!v595) {
    v232 = v570;
  }
  if (v589) {
    v232 = v589;
  }
  id v521 = v232;
  [v521 renderAsShadow];
  if ((v533 & v611) != 1)
  {
    double v558 = 0.0;
    double v540 = 0.0;
    if (!(r1_8 | v602)) {
      goto LABEL_346;
    }
    goto LABEL_345;
  }
  if (v585 == v574 || (v558 = 0.0, double v540 = 0.0, v550 == v574))
  {
LABEL_345:
    v233 = [v224 configuration];
    [v233 rubberBandExtension];
    double v558 = v234;

    [v224 _rubberBandInset];
    UIRoundToScale(v235, v608);
    double v540 = v236;
  }
LABEL_346:
  if (v595)
  {
    v237 = [v224 configuration];
    [v237 leadingBorderWidthForScale:v608];
    double v561 = v238;
LABEL_350:

    goto LABEL_351;
  }
  if (v570)
  {
    v237 = [v224 configuration];
    [v237 trailingBorderWidthForScale:v608];
    double v561 = v239;
    goto LABEL_350;
  }
  double v561 = 0.0;
LABEL_351:
  [v224 supplementaryWidth];
  double v241 = v240;
  [v224 supplementaryOffscreenWidth];
  if (v241 >= v242) {
    double v242 = v241;
  }
  UIRoundToScale(v242, v608);
  double v244 = v243;
  if (v585)
  {
    [v224 leadingOffscreenWidth];
    if (v245 > 0.0)
    {
      [v224 leadingWidth];
      if (v246 != 0.0)
      {
        [v224 leadingWidth];
        [v224 leadingOffscreenWidth];
      }
    }
  }
  else
  {
    [v224 trailingOffscreenWidth];
    if (v247 > 0.0)
    {
      [v224 trailingWidth];
      if (v248 != 0.0)
      {
        [v224 trailingWidth];
        [v224 trailingOffscreenWidth];
      }
    }
  }
  [v224 supplementaryOffscreenWidth];
  double v250 = v249;
  [v224 _supplementaryOverlayWidth];
  double v252 = v251;
  double v253 = 0.0;
  if (v611)
  {
    double v525 = 0.0;
    double v520 = v250;
    double v548 = v244;
    double v254 = 0.0;
  }
  else
  {
    [v224 leadingWidth];
    double v256 = v255;
    [v224 leadingOffscreenWidth];
    if (v256 >= v257) {
      double v257 = v256;
    }
    UIRoundToScale(v257, v608);
    double v259 = v258;
    [v224 leadingOffscreenWidth];
    double v520 = v260;
    [v224 trailingWidth];
    double v262 = v261;
    [v224 trailingOffscreenWidth];
    if (v262 >= v263) {
      double v263 = v262;
    }
    UIRoundToScale(v263, v608);
    double v548 = v264;
    [v224 trailingOffscreenWidth];
    double v266 = v265;
    [v224 supplementaryDragOffset];
    double v254 = v267;
    double v253 = v244;
    double v525 = v250;
    double v250 = v266;
    double v244 = v259;
  }
  if (v229 & v231) {
    char v268 = 0;
  }
  else {
    char v268 = [v224 _supplementaryEntirelyOverlapsMain];
  }
  double v269 = 0.0;
  double v270 = 0.0;
  int v271 = v611;
  if ((v229 & 1) == 0)
  {
    if (v611)
    {
      [v224 supplementaryDragOffset];
      double v273 = v272;
      BOOL v274 = v272 == 0.0 && v244 > 0.0;
      char v275 = v268;
      if (v274)
      {
        [v224 supplementaryWidth];
        if (v276 == 0.0) {
          double v273 = v244;
        }
        char v275 = v268;
      }
    }
    else
    {
      [v224 leadingDragOffset];
      double v273 = v277;
      if (v277 == 0.0 && v244 > 0.0)
      {
        [v224 leadingWidth];
        if (v279 == 0.0) {
          double v273 = v244;
        }
      }
      char v275 = [v224 _leadingEntirelyOverlapsMain];
    }
    double v280 = 0.0 - v273;
    if (!v228 || (v275 & 1) != 0)
    {
      int v271 = v611;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        v281 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v281, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v281, OS_LOG_TYPE_FAULT, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }
      else
      {
        v281 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584F0) + 8);
        if (os_log_type_enabled(v281, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v281, OS_LOG_TYPE_ERROR, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }

      double v282 = v252;
      int v271 = v611;
      if ((v611 & 1) == 0)
      {
        objc_msgSend(v224, "_leadingOverlayWidth", v252);
        int v271 = v611;
      }
      double v280 = v280 + v244 - v282;
    }
    double v270 = v540 - v558 + v280;
  }
  if ((v231 & 1) == 0)
  {
    if (v271)
    {
      objc_msgSend(v224, "supplementaryDragOffset", v548);
      double v284 = v283;
      if (v283 == 0.0 && v548 > 0.0)
      {
        [v224 supplementaryWidth];
        if (v286 == 0.0) {
          double v284 = v548;
        }
      }
    }
    else
    {
      objc_msgSend(v224, "trailingDragOffset", v548);
      double v284 = v287;
      if (v287 == 0.0 && v548 > 0.0)
      {
        [v224 trailingWidth];
        if (v289 == 0.0) {
          double v284 = v548;
        }
      }
      char v268 = [v224 _trailingEntirelyOverlapsMain];
    }
    double v290 = v284 + 0.0;
    if (v530 && (v268 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v291 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v291, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v291, OS_LOG_TYPE_FAULT, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }
      else
      {
        v291 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2584F8) + 8);
        if (os_log_type_enabled(v291, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v291, OS_LOG_TYPE_ERROR, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }

      if ((v611 & 1) == 0)
      {
        [v224 _trailingOverlayWidth];
        double v252 = v292;
      }
      double v290 = v290 + v548 - v252;
    }
    double v269 = v558 - v540 + v290;
  }
  UIRoundToScale(v270, v608);
  double v294 = v293;
  UIRoundToScale(v269, v608);
  double v296 = v295;
  UIRoundToScale(v254, v608);
  double v298 = v297;
  [v224 mainWidth];
  double v300 = v299;
  if (v229)
  {
    double v301 = 0.0;
    id v302 = v552;
    if ((v231 & 1) == 0) {
      double v301 = v558 - v540 + v253 + v548 - v296 - v298;
    }
    int v303 = v611;
  }
  else
  {
    double v301 = v558 - v540 + v253 + v244 + v294 - v298;
    id v302 = v552;
    int v303 = v611;
    if (v294 != 0.0 && v244 + v294 == 0.0 && (!v578 ? (char v304 = 1) : (char v304 = v611), (v304 & 1) != 0 || v525 == 0.0))
    {
      double v305 = v561;
    }
    else
    {
      double v305 = 0.0;
      BOOL v306 = v525 != v244 - v294 - v298 || v525 == 0.0;
      if (!v306) {
        double v305 = v561;
      }
    }
    double v294 = v294 - v305;
  }
  int v531 = v303 ^ 1;
  if (v302)
  {
    double v307 = v300;
    if (v300 == 0.0)
    {
      v679.origin.double x = r1;
      v679.origin.double y = rect;
      v679.size.double width = r1_24;
      v679.size.double height = v601;
      double v307 = CGRectGetWidth(v679);
      if ((v229 & 1) == 0)
      {
        int v308 = 0;
        if (v595)
        {
          if (v244 > 0.0)
          {
            int v308 = 0;
            if (v520 < v244 && v298 == 0.0) {
              int v308 = objc_msgSend(v566, "renderAsShadow", v520) ^ 1;
            }
          }
        }
        int v309 = 0;
        char v310 = v531 ^ 1;
        if (!v589) {
          char v310 = 1;
        }
        if ((v310 & 1) == 0 && v253 > 0.0 && v525 < v253) {
          int v309 = objc_msgSend(v589, "renderAsShadow", v525) ^ 1;
        }
        double v311 = 1.0;
        if ((v308 & v309) != 0) {
          double v311 = 2.0;
        }
        double v312 = v561 * v311;
        if (!(v308 | v309)) {
          double v312 = 0.0;
        }
        double v307 = v307 - v301 - v312;
      }
      if ((v231 & 1) == 0)
      {
        int v313 = 0;
        if (v556)
        {
          if (v548 > 0.0)
          {
            int v313 = 0;
            if (v250 < v548 && v298 == 0.0) {
              int v313 = [v570 renderAsShadow] ^ 1;
            }
          }
        }
        int v314 = 0;
        char v315 = v531 ^ 1;
        if (!v589) {
          char v315 = 1;
        }
        if ((v315 & 1) == 0 && v253 > 0.0 && v525 < v253) {
          int v314 = objc_msgSend(v589, "renderAsShadow", v525) ^ 1;
        }
        double v316 = 1.0;
        if ((v313 & v314) != 0) {
          double v316 = 2.0;
        }
        double v317 = v561 * v316;
        if (!(v313 | v314)) {
          double v317 = 0.0;
        }
        double v307 = v307 - v301 - v317;
      }
    }
  }
  else
  {
    double v307 = v300;
  }
  v680.origin.double x = r1;
  v680.origin.double y = rect;
  v680.size.double width = r1_24;
  v680.size.double height = v601;
  CGFloat v318 = CGRectGetHeight(v680);
  uint64_t v669 = 0;
  v670 = (double *)&v669;
  uint64_t v671 = 0x2020000000;
  double v672 = 0.0;
  if (v604)
  {
    v681.origin.double x = r1;
    v681.origin.double y = rect;
    v681.size.double width = r1_24;
    v681.size.double height = v601;
    double MaxX = CGRectGetMaxX(v681);
    v320 = v670;
    v670[3] = MaxX;
    if (v229)
    {
      int v321 = v611;
      if (v231) {
        goto LABEL_504;
      }
      if (v300 == 0.0)
      {
        double v324 = v540;
      }
      else
      {
        double MaxX = v540 + v301 + v307;
        v320[3] = MaxX;
        if (v301 <= 0.0) {
          goto LABEL_504;
        }
        unsigned __int8 v322 = v531;
        if (!v589) {
          unsigned __int8 v322 = 0;
        }
        if (v253 <= 0.0) {
          unsigned __int8 v322 = 0;
        }
        double v323 = 1.0;
        if ((v322 & (v525 < v253)) != 0) {
          double v323 = 2.0;
        }
        double v324 = v561 * v323;
      }
      double v328 = v324 + MaxX;
      goto LABEL_770;
    }
    v320[3] = MaxX - v294;
LABEL_503:
    int v321 = v611;
    goto LABEL_504;
  }
  if ((v229 & 1) == 0)
  {
    double v672 = v294;
    goto LABEL_503;
  }
  int v321 = v611;
  if (v231) {
    goto LABEL_504;
  }
  if (v300 == 0.0)
  {
    double v672 = -v540;
    goto LABEL_504;
  }
  v682.origin.double x = r1;
  v682.origin.double y = rect;
  v682.size.double width = r1_24;
  v682.size.double height = v601;
  double v325 = CGRectGetMaxX(v682) - v301 - v307;
  v320 = v670;
  v670[3] = v325;
  int v321 = v611;
  if (v301 <= 0.0) {
    goto LABEL_504;
  }
  unsigned __int8 v326 = v531;
  if (!v589) {
    unsigned __int8 v326 = 0;
  }
  if (v253 <= 0.0) {
    unsigned __int8 v326 = 0;
  }
  double v327 = 1.0;
  if ((v326 & (v525 < v253)) != 0) {
    double v327 = 2.0;
  }
  double v328 = v325 - v561 * v327;
LABEL_770:
  v320[3] = v328;
LABEL_504:
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v661 = 3221225472;
  v662 = __layoutSideBySideViewsColumnStyle_block_invoke;
  v663 = &unk_1E52E9960;
  char v668 = v604 ^ 1;
  v666 = &v669;
  CGFloat v667 = v318;
  id v329 = v523;
  id v664 = v329;
  id v330 = v224;
  id v665 = v330;
  v683.origin.double x = r1;
  v683.origin.double y = rect;
  v683.size.double width = r1_24;
  v683.size.double height = v601;
  v331.n128_f64[0] = CGRectGetWidth(v683);
  if ((v229 & 1) == 0)
  {
    double v333 = v331.n128_f64[0] - v307 - (v558 + v244 + v294);
    if (v321 | v522 ^ 1) {
      double v333 = 0.0;
    }
    v332.n128_f64[0] = -v333;
    if (!v604) {
      v332.n128_f64[0] = v333;
    }
    if (v321) {
      id v334 = v574;
    }
    else {
      id v334 = v585;
    }
    v331.n128_f64[0] = v558 + v244;
    ((void (*)(uint8_t *, id, void, id, __n128, __n128, double))v662)(buf, v541, 0, v334, v331, v332, 0.0);
    if (v578)
    {
      if (v298 > 0.0)
      {
        double v335 = v561 + v298;
        if (!v604) {
          double v335 = -(v561 + v298);
        }
        v670[3] = v335 + v670[3];
      }
      unsigned int v336 = [v566 renderAsShadow];
      v662((uint64_t)buf, v566, 0, 0, v561, 0.0, (double)v336);
      if (v572)
      {
        double v337 = -1.0;
        if (v604) {
          double v337 = 1.0;
        }
        v670[3] = v337 + v670[3];
        v662((uint64_t)buf, v554, 0, 0, 1.0, 0.0, 0.0);
        if (v244 <= 0.0 || v253 <= 0.0)
        {
          if (os_variant_has_internal_diagnostics())
          {
            v518 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v518, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v659 = 0;
              _os_log_fault_impl(&dword_1853B0000, v518, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", v659, 2u);
            }
          }
          else
          {
            v518 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258500) + 8);
            if (os_log_type_enabled(v518, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v659 = 0;
              _os_log_impl(&dword_1853B0000, v518, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", v659, 2u);
            }
          }

          int v321 = v611;
        }
        double v338 = 0.0;
        if (v244 > 0.0) {
          double v338 = v298 / (v244 * -0.5) + 1.0;
        }
        [v554 setAlpha:1.0 - v338];
      }
      v662((uint64_t)buf, v578, 0, v574, v253, 0.0, 0.0);
      unsigned int v339 = [v589 renderAsShadow];
      v662((uint64_t)buf, v589, 0, 0, v561, 0.0, (double)v339);
    }
    else
    {
      unsigned int v340 = [v566 renderAsShadow];
      v662((uint64_t)buf, v566, 0, 0, v561, 0.0, (double)v340);
    }
  }
  v662((uint64_t)buf, v582, 0, v569, v307, 0.0, 0.0);
  if ((v231 & 1) == 0)
  {
    if (v522)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v514 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v514, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v659 = 0;
          _os_log_fault_impl(&dword_1853B0000, v514, OS_LOG_TYPE_FAULT, "SPI to put supplementary col in background view not implemented for trailing primary", v659, 2u);
        }
      }
      else
      {
        v514 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258508) + 8);
        if (os_log_type_enabled(v514, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v659 = 0;
          _os_log_impl(&dword_1853B0000, v514, OS_LOG_TYPE_ERROR, "SPI to put supplementary col in background view not implemented for trailing primary", v659, 2u);
        }
      }

      int v321 = v611;
    }
    if (v578)
    {
      unsigned int v341 = [v589 renderAsShadow];
      v662((uint64_t)buf, v589, 0, 0, v561, 0.0, (double)v341);
      v662((uint64_t)buf, v578, 0, v574, v253, 0.0, 0.0);
    }
    unsigned int v342 = [v570 renderAsShadow];
    v662((uint64_t)buf, v570, 0, 0, v561, 0.0, (double)v342);
    v344 = v670;
    if (v572)
    {
      double v345 = -v561;
      int v346 = v604;
      if (v604) {
        double v345 = v561;
      }
      v670[3] = v345 + v670[3];
      v662((uint64_t)buf, v554, 0, 0, 1.0, 0.0, 0.0);
      if (v548 <= 0.0 || v253 <= 0.0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v515 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v515, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v659 = 0;
            _os_log_fault_impl(&dword_1853B0000, v515, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", v659, 2u);
          }
        }
        else
        {
          v515 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258510) + 8);
          if (os_log_type_enabled(v515, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v659 = 0;
            _os_log_impl(&dword_1853B0000, v515, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", v659, 2u);
          }
        }

        int v346 = v604;
        int v321 = v611;
      }
      double v347 = 0.0;
      if (v548 > 0.0) {
        double v347 = v298 / (v548 * -0.5) + 1.0;
      }
      [v554 setAlpha:1.0 - v347];
      v343.n128_f64[0] = 1.0 - v561;
      if (!v346) {
        v343.n128_f64[0] = -(1.0 - v561);
      }
      v344 = v670;
      double v348 = v343.n128_f64[0] + v670[3];
      v670[3] = v348;
    }
    else
    {
      double v348 = v670[3];
      int v346 = v604;
    }
    double v349 = -v298;
    if (v346) {
      double v349 = v298;
    }
    v344[3] = v349 + v348;
    if (v321) {
      id v350 = v574;
    }
    else {
      id v350 = v550;
    }
    v343.n128_f64[0] = v558 + v548;
    ((void (*)(uint8_t *, id, void, id, __n128, double, double))v662)(buf, v543, 0, v350, v343, 0.0, 0.0);
  }

  _Block_object_dispose(&v669, 8);
  id v351 = v541;
  id v562 = v566;
  id v542 = v578;
  id v549 = v589;
  id v553 = v543;
  id v559 = v570;
  id v571 = v546;
  id v567 = v554;
  id v352 = v330;
  id v557 = v329;
  id v590 = v585;
  id v586 = v550;
  id v596 = v574;
  int v353 = [v352 supplementaryOverlapsMain];
  int v354 = v353;
  int v355 = v611;
  if (v611 & 1 | (r1_8 == 0))
  {
    int v356 = (r1_8 != 0) & v353;
  }
  else
  {
    int v356 = [v352 leadingOverlapsMain];
    int v355 = v611;
  }
  if (v602) {
    char v357 = v355;
  }
  else {
    char v357 = 1;
  }
  if (v602) {
    int v358 = v354;
  }
  else {
    int v358 = 0;
  }
  if ((v357 & 1) == 0)
  {
    int v358 = [v352 trailingOverlapsMain];
    int v355 = v611;
  }
  int v359 = v354 & v531;
  if (!v578) {
    int v359 = 0;
  }
  int v551 = v359;
  if (!v356)
  {
    if ((v358 & 1) == 0)
    {
      double v362 = 0.0;
      double v361 = 0.0;
      double v363 = 0.0;
      if (v355) {
        goto LABEL_572;
      }
      goto LABEL_571;
    }
    double v361 = 0.0;
    if (v355) {
      goto LABEL_567;
    }
    goto LABEL_569;
  }
  if ((v355 & 1) == 0)
  {
    [v352 leadingDragOffset];
    double v361 = -v365;
    double v362 = 0.0;
    if ((v358 & 1) == 0)
    {
LABEL_571:
      [v352 supplementaryDragOffset];
      double v363 = v367;
      goto LABEL_572;
    }
LABEL_569:
    [v352 trailingDragOffset];
    double v362 = v366;
    goto LABEL_571;
  }
  [v352 supplementaryDragOffset];
  double v361 = -v360;
  double v362 = 0.0;
  double v363 = 0.0;
  if (v358)
  {
LABEL_567:
    [v352 supplementaryDragOffset];
    double v362 = v364;
    double v363 = 0.0;
  }
LABEL_572:
  [v352 supplementaryWidth];
  double v369 = v368;
  [v352 supplementaryOffscreenWidth];
  if (v369 >= v370) {
    double v370 = v369;
  }
  double v579 = v370;
  if ((v533 & v611) == 0)
  {
    double v371 = 0.0;
    double v555 = 0.0;
    if (!(r1_8 | v602)) {
      goto LABEL_580;
    }
    goto LABEL_579;
  }
  if (v590 == v596 || (double v371 = 0.0, v555 = 0.0, v586 == v596))
  {
LABEL_579:
    v372 = [v352 configuration];
    [v372 rubberBandExtension];
    double v371 = v373;

    [v352 _rubberBandInset];
    UIRoundToScale(v374, v608);
    double v555 = v375;
  }
LABEL_580:
  UIRoundToScale(v361, v608);
  double v377 = v376;
  UIRoundToScale(v362, v608);
  double v547 = v378;
  UIRoundToScale(v363, v608);
  double v575 = v379;
  if (!v356) {
    goto LABEL_648;
  }
  if (!v611)
  {
    [v352 leadingWidth];
    double v386 = v385;
    [v352 leadingOffscreenWidth];
    if (v386 >= v387) {
      double v383 = v386;
    }
    else {
      double v383 = v387;
    }
    if (v383 > 0.0)
    {
      [v352 leadingWidth];
      goto LABEL_593;
    }
LABEL_591:
    int v388 = 1;
    CGFloat v389 = r1_24;
    CGFloat v390 = v601;
    CGFloat v391 = r1;
    goto LABEL_597;
  }
  [v352 supplementaryWidth];
  double v381 = v380;
  [v352 supplementaryOffscreenWidth];
  if (v381 >= v382) {
    double v383 = v381;
  }
  else {
    double v383 = v382;
  }
  if (v383 <= 0.0) {
    goto LABEL_591;
  }
  [v352 supplementaryWidth];
LABEL_593:
  BOOL v306 = v384 == 0.0;
  CGFloat v389 = r1_24;
  CGFloat v390 = v601;
  CGFloat v391 = r1;
  int v388 = 0;
  if (v306 && v377 > -v383) {
    double v377 = -v383;
  }
LABEL_597:
  double v392 = rect;
  double v393 = CGRectGetHeight(*(CGRect *)&v391);
  double v394 = v371 + v383;
  if (v604)
  {
    v684.origin.double x = r1;
    v684.origin.double y = rect;
    v684.size.double width = r1_24;
    v684.size.double height = v601;
    double v395 = CGRectGetWidth(v684);
    v685.origin.double x = 0.0;
    v685.origin.double y = 0.0;
    v685.size.double width = v371 + v383;
    v685.size.double height = v393;
    double x = v371 - v555 + v395 - CGRectGetWidth(v685) - v377;
  }
  else
  {
    double x = v377 - (v371 - v555);
  }
  if ([v557 containsObject:v351])
  {
    [v352 _keyboardAdjustment];
    double v393 = v393 - v397;
  }
  if (v611) {
    v398 = v596;
  }
  else {
    v398 = v590;
  }
  id v399 = v351;
  id v400 = v398;
  v401 = v400;
  if (v400) {
    objc_msgSend(v400, "_updateControlledViewsToFrame:", x, 0.0, v371 + v383, v393);
  }
  else {
    objc_msgSend(v399, "setFrame:", x, 0.0, v371 + v383, v393);
  }

  if (v562)
  {
    v402 = [v352 configuration];
    [v402 leadingBorderWidthForScale:v608];
    double v404 = v403;

    if (v575 <= 0.0)
    {
      if (v604)
      {
        double v405 = -v404;
      }
      else
      {
        v690.origin.double y = 0.0;
        v690.origin.double x = x;
        v690.size.double width = v371 + v383;
        v690.size.double height = v393;
        double v405 = CGRectGetWidth(v690);
      }
      v691.origin.double y = 0.0;
      v691.origin.double x = x;
      v691.size.double width = v371 + v383;
      v691.size.double height = v393;
      CGRect v689 = CGRectOffset(v691, v405, 0.0);
LABEL_623:
      double x = v689.origin.x;
      double y = v689.origin.y;
      double v393 = v689.size.height;
      objc_msgSend(v562, "setFrame:");
      double v394 = v404;
      goto LABEL_624;
    }
LABEL_613:
    if (v604)
    {
      double v407 = -(v579 - v575);
    }
    else
    {
      v686.origin.double y = 0.0;
      v686.origin.double x = x;
      v686.size.double width = v371 + v383;
      v686.size.double height = v393;
      double v407 = CGRectGetWidth(v686) - v575;
    }
    v687.origin.double y = 0.0;
    v687.origin.double x = x;
    v687.size.double width = v371 + v383;
    v687.size.double height = v393;
    CGRect v688 = CGRectOffset(v687, v407, 0.0);
    double x = v688.origin.x;
    double y = v688.origin.y;
    double v394 = v688.size.width;
    double v393 = v688.size.height;
    if (!v562) {
      goto LABEL_624;
    }
    if (v604) {
      double v408 = v579;
    }
    else {
      double v408 = -v404;
    }
    CGRect v689 = CGRectOffset(v688, v408, 0.0);
    goto LABEL_623;
  }
  double v404 = 0.0;
  double y = 0.0;
  if (v575 > 0.0) {
    goto LABEL_613;
  }
LABEL_624:
  if (v572)
  {
    if ((v604 & 1) == 0)
    {
      v692.origin.double x = x;
      v692.origin.double y = y;
      v692.size.double width = v394;
      v692.size.double height = v393;
      CGRect v693 = CGRectOffset(v692, -(1.0 - v404), 0.0);
      double x = v693.origin.x;
      double y = v693.origin.y;
      double v393 = v693.size.height;
    }
    objc_msgSend(v567, "setFrame:", x, y, 1.0, v393);
    if (v579 <= 0.0) {
      int v409 = 1;
    }
    else {
      int v409 = v388;
    }
    if (v409 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v516 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v516, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v516, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
      else
      {
        v516 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258518) + 8);
        if (os_log_type_enabled(v516, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v516, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
    }
    double v410 = 0.0;
    if ((v388 & 1) == 0) {
      double v410 = v575 / (v383 * -0.5) + 1.0;
    }
    double v394 = 1.0;
    [v567 setAlpha:1.0 - v410];
    if ((v604 & 1) == 0)
    {
      v694.size.double width = 1.0;
      v694.origin.double x = x;
      v694.origin.double y = y;
      v694.size.double height = v393;
      CGRect v695 = CGRectOffset(v694, 1.0 - v404, 0.0);
      double x = v695.origin.x;
      double y = v695.origin.y;
      double v394 = v695.size.width;
      double v393 = v695.size.height;
    }
  }
  if (v551)
  {
    double v411 = v604 ? -v579 : v404;
    v696.origin.double x = x;
    v696.origin.double y = y;
    v696.size.double width = v394;
    v696.size.double height = v393;
    CGRect v697 = CGRectOffset(v696, v411, 0.0);
    double x = v697.origin.x;
    double y = v697.origin.y;
    double v393 = v697.size.height;
    objc_msgSend(v542, "setFrame:");
    if (v549)
    {
      if (v604)
      {
        double v412 = -v404;
      }
      else
      {
        v698.origin.double x = x;
        v698.origin.double y = y;
        v698.size.double width = v579;
        v698.size.double height = v393;
        double v412 = CGRectGetWidth(v698);
      }
      v699.origin.double x = x;
      v699.origin.double y = y;
      v699.size.double width = v579;
      v699.size.double height = v393;
      CGRect v700 = CGRectOffset(v699, v412, 0.0);
      double x = v700.origin.x;
      double y = v700.origin.y;
      double v393 = v700.size.height;
      objc_msgSend(v549, "setFrame:");
    }
  }
  if (v571)
  {
    double v413 = 0.0;
    if (v604)
    {
      v701.size.double width = 1.0;
      v701.origin.double x = x;
      v701.origin.double y = y;
      v701.size.double height = v393;
      double v413 = -CGRectGetWidth(v701);
    }
    v702.size.double width = 1.0;
    v702.origin.double x = x;
    v702.origin.double y = y;
    v702.size.double height = v393;
    CGRect v703 = CGRectOffset(v702, v413, 0.0);
    objc_msgSend(v571, "setFrame:", v703.origin.x, v703.origin.y, v703.size.width, v703.size.height);
  }
LABEL_648:
  if (!v358) {
    goto LABEL_717;
  }
  if (v611)
  {
    [v352 supplementaryWidth];
    double v415 = v414;
    [v352 supplementaryOffscreenWidth];
    if (v415 >= v416) {
      double v417 = v415;
    }
    else {
      double v417 = v416;
    }
    if (v417 > 0.0)
    {
      [v352 supplementaryWidth];
      goto LABEL_661;
    }
LABEL_659:
    int v422 = 1;
    CGFloat v423 = r1_24;
    CGFloat v424 = v601;
    CGFloat v425 = r1;
    goto LABEL_666;
  }
  [v352 trailingWidth];
  double v420 = v419;
  [v352 trailingOffscreenWidth];
  if (v420 >= v421) {
    double v417 = v420;
  }
  else {
    double v417 = v421;
  }
  if (v417 <= 0.0) {
    goto LABEL_659;
  }
  [v352 trailingWidth];
LABEL_661:
  BOOL v306 = v418 == 0.0;
  CGFloat v423 = r1_24;
  CGFloat v424 = v601;
  CGFloat v425 = r1;
  int v422 = 0;
  if (v306)
  {
    double v426 = v547;
    if (v417 >= v547) {
      double v426 = v417;
    }
    double v547 = v426;
  }
LABEL_666:
  double v427 = rect;
  double v428 = CGRectGetHeight(*(CGRect *)&v425);
  double v429 = v371 + v417;
  if (v604)
  {
    double v430 = -v547 - (v371 - v555);
  }
  else
  {
    v704.origin.double x = r1;
    v704.origin.double y = rect;
    v704.size.double width = r1_24;
    v704.size.double height = v601;
    double v431 = CGRectGetWidth(v704);
    v705.origin.double x = 0.0;
    v705.origin.double y = 0.0;
    v705.size.double width = v371 + v417;
    v705.size.double height = v428;
    double v430 = v371 - v555 + v547 + v431 - CGRectGetWidth(v705);
  }
  if ([v557 containsObject:v351])
  {
    [v352 _keyboardAdjustment];
    double v428 = v428 - v432;
  }
  if (v611) {
    v433 = v596;
  }
  else {
    v433 = v586;
  }
  id v434 = v553;
  id v435 = v433;
  v436 = v435;
  if (v435) {
    objc_msgSend(v435, "_updateControlledViewsToFrame:", v430, 0.0, v371 + v417, v428);
  }
  else {
    objc_msgSend(v434, "setFrame:", v430, 0.0, v371 + v417, v428);
  }

  if (v559)
  {
    v437 = [v352 configuration];
    [v437 trailingBorderWidthForScale:v608];
    double v439 = v438;

    if (v575 <= 0.0)
    {
      if (v604)
      {
        v706.origin.double y = 0.0;
        v706.origin.double x = v430;
        v706.size.double width = v371 + v417;
        v706.size.double height = v428;
        double v440 = CGRectGetWidth(v706);
      }
      else
      {
        double v440 = -v439;
      }
      v710.origin.double y = 0.0;
      v710.origin.double x = v430;
      v710.size.double width = v371 + v417;
      v710.size.double height = v428;
      CGRect v709 = CGRectOffset(v710, v440, 0.0);
LABEL_692:
      double v430 = v709.origin.x;
      double v441 = v709.origin.y;
      double v428 = v709.size.height;
      objc_msgSend(v559, "setFrame:");
      double v429 = v439;
      goto LABEL_693;
    }
LABEL_682:
    if (v604) {
      double v442 = v371 - v555 + v417 - v575;
    }
    else {
      double v442 = -(v579 - v575);
    }
    v707.origin.double y = 0.0;
    v707.origin.double x = v430;
    v707.size.double width = v371 + v417;
    v707.size.double height = v428;
    CGRect v708 = CGRectOffset(v707, v442, 0.0);
    double v430 = v708.origin.x;
    double v441 = v708.origin.y;
    double v429 = v708.size.width;
    double v428 = v708.size.height;
    if (!v559) {
      goto LABEL_693;
    }
    if (v604) {
      double v443 = -v439;
    }
    else {
      double v443 = v579;
    }
    CGRect v709 = CGRectOffset(v708, v443, 0.0);
    goto LABEL_692;
  }
  double v439 = 0.0;
  double v441 = 0.0;
  if (v575 > 0.0) {
    goto LABEL_682;
  }
LABEL_693:
  if (v572)
  {
    if (v604)
    {
      v711.origin.double x = v430;
      v711.origin.double y = v441;
      v711.size.double width = v429;
      v711.size.double height = v428;
      CGRect v712 = CGRectOffset(v711, -(1.0 - v439), 0.0);
      double v430 = v712.origin.x;
      double v441 = v712.origin.y;
      double v428 = v712.size.height;
    }
    objc_msgSend(v567, "setFrame:", v430, v441, 1.0, v428);
    if (v579 <= 0.0) {
      int v444 = 1;
    }
    else {
      int v444 = v422;
    }
    if (v444 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v517 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v517, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v517, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
      else
      {
        v517 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258520) + 8);
        if (os_log_type_enabled(v517, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v517, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
    }
    double v445 = 0.0;
    if ((v422 & 1) == 0) {
      double v445 = v575 / (v417 * -0.5) + 1.0;
    }
    double v429 = 1.0;
    [v567 setAlpha:1.0 - v445];
    if (v604)
    {
      v713.size.double width = 1.0;
      v713.origin.double x = v430;
      v713.origin.double y = v441;
      v713.size.double height = v428;
      CGRect v714 = CGRectOffset(v713, 1.0 - v439, 0.0);
      double v430 = v714.origin.x;
      double v441 = v714.origin.y;
      double v429 = v714.size.width;
      double v428 = v714.size.height;
    }
  }
  if (v551)
  {
    double v446 = v604 ? v439 : -v579;
    v715.origin.double x = v430;
    v715.origin.double y = v441;
    v715.size.double width = v429;
    v715.size.double height = v428;
    CGRect v716 = CGRectOffset(v715, v446, 0.0);
    double v430 = v716.origin.x;
    double v441 = v716.origin.y;
    double v428 = v716.size.height;
    objc_msgSend(v542, "setFrame:");
    if (v549)
    {
      if (v604)
      {
        v717.origin.double x = v430;
        v717.origin.double y = v441;
        v717.size.double width = v579;
        v717.size.double height = v428;
        double v447 = CGRectGetWidth(v717);
      }
      else
      {
        double v447 = -v439;
      }
      v718.origin.double x = v430;
      v718.origin.double y = v441;
      v718.size.double width = v579;
      v718.size.double height = v428;
      CGRect v719 = CGRectOffset(v718, v447, 0.0);
      double v430 = v719.origin.x;
      double v441 = v719.origin.y;
      double v428 = v719.size.height;
      objc_msgSend(v549, "setFrame:");
    }
  }
  if (v571)
  {
    double v448 = 0.0;
    if ((v604 & 1) == 0)
    {
      v720.size.double width = 1.0;
      v720.origin.double x = v430;
      v720.origin.double y = v441;
      v720.size.double height = v428;
      double v448 = -CGRectGetWidth(v720);
    }
    v721.size.double width = 1.0;
    v721.origin.double x = v430;
    v721.origin.double y = v441;
    v721.size.double height = v428;
    CGRect v722 = CGRectOffset(v721, v448, 0.0);
    objc_msgSend(v571, "setFrame:", v722.origin.x, v722.origin.y, v722.size.width, v722.size.height);
  }
LABEL_717:

  id v580 = v545;
  id v576 = v351;
  id v573 = v553;
  id v449 = v352;
  if (v524)
  {
    if (r1_8) {
      [v576 frame];
    }
    else {
      [v573 frame];
    }
    objc_msgSend(v580, "setFrame:");
    id v450 = v449;
    [v450 leadingWidth];
    double v452 = v451;
    [v450 trailingWidth];
    double v454 = v453;

    id v455 = v450;
    [v455 leadingDragOffset];
    double v457 = v456;
    [v455 trailingDragOffset];
    double v459 = v458;
    [v455 supplementaryDragOffset];
    double v461 = v460;

    double v462 = 0.0;
    if (v452 + v454 > 0.0)
    {
      double v463 = fmax((v452 + v454 - (v457 + v459 + v461)) / (v452 + v454), 0.0);
      double v462 = 1.0;
      if (v463 <= 1.0) {
        double v462 = v463;
      }
    }
    [v580 setPercentDisplayed:(1.0 - v462) * 0.5];
  }

  layoutPresentationViews(v8, v569, v537);
  layoutPresentationViews(v8, v593, v536);
  layoutPresentationViews(v8, v592, v535);
  layoutPresentationViews(v8, v596, v534);
  [v8 bounds];
  -[UIView setFrame:](v587, "setFrame:");
  v464 = [(_UIMTCaptureView *)v587 mt_captureGroupName];
  v465 = [v593 _existingView];
  objc_msgSend(v465, "mt_setCaptureGroupName:", v464);

  v466 = [(_UIMTCaptureView *)v587 mt_captureGroupName];
  v467 = [v592 _existingView];
  objc_msgSend(v467, "mt_setCaptureGroupName:", v466);

  v468 = [(_UIMTCaptureView *)v587 mt_captureGroupName];
  v469 = [v596 _existingView];
  objc_msgSend(v469, "mt_setCaptureGroupName:", v468);

  v612 = [(UIPanelController *)v614 floatingBarButtonItem];
  if ([v612 _isFloatable])
  {
    int v470 = [v612 _isFloating];
    if (v565 | v564 | v563)
    {
      if (v470) {
        goto LABEL_731;
      }
    }
    else if (!v470)
    {
      goto LABEL_731;
    }
    [v612 _setFloating:(v565 | v564 | v563) != 0];
    v619[0] = MEMORY[0x1E4F143A8];
    v619[1] = 3221225472;
    v620 = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_431;
    v621 = &__block_descriptor_40_e26_v16__0__UIViewController_8lu32l8;
    v622 = v627;
    v471 = v628((uint64_t)v627, v593);
    [v471 _setNeedsStaticNavBarButtonUpdate];

    ((void (*)(void *, void *))__54__UIPanelController__updateToNewPublicState_withSize___block_invoke_431)(v619, v592);
    ((void (*)(void *, id))v620)(v619, v596);
    ((void (*)(void *, id))v620)(v619, v569);
  }
LABEL_731:
  if (v604) {
    BOOL v472 = v602 != 0;
  }
  else {
    BOOL v472 = r1_8 != 0;
  }
  layoutClippingView((void *)v565, v612, v472);
  layoutClippingView((void *)v563, v612, v472);
  layoutClippingView((void *)v564, v612, v472);
  uint64_t v473 = [(UIPanelController *)v614 style];
  uint64_t v474 = v473;
  if (v544) {
    id v475 = v586;
  }
  else {
    id v475 = v590;
  }
  BOOL v477 = v473 != 1 && v475 == v596;
  v609 = [(UIPanelController *)v614 navigationBarForContentLayoutGuideAnimation];
  v478 = [v609 window];
  if (v478)
  {
    char v479 = [v609 _isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];

    if ((v479 & 1) == 0)
    {
      [v609 layoutIfNeeded];
      [v609 _beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
    }
  }
  id v480 = [(UIPanelController *)v614 navigationBarForContentLayoutGuideAnimation];
  id v481 = v449;
  v482 = [v481 configuration];
  int v615 = [v482 allowTotalWidthGreaterThanParent];

  if ([v481 leadingOverlapsMain] & 1) != 0 || (objc_msgSend(v481, "trailingOverlapsMain")) {
    int v483 = 1;
  }
  else {
    int v483 = [v481 supplementaryOverlapsMain];
  }
  int v605 = v483;
  int v484 = v483 | v615;
  BOOL v485 = !v477;
  if (v474 == 1) {
    BOOL v485 = 0;
  }
  if (!v485 && v484)
  {
    if (v615)
    {
      if (os_variant_has_internal_diagnostics())
      {
        v519 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v519, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v519, OS_LOG_TYPE_FAULT, "Unexpected attempt to layout for Displace behavior in double-column UISVC", buf, 2u);
        }
      }
      else
      {
        v486 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB258528) + 8);
        if (os_log_type_enabled(v486, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1853B0000, v486, OS_LOG_TYPE_ERROR, "Unexpected attempt to layout for Displace behavior in double-column UISVC", buf, 2u);
        }
      }
    }
    goto LABEL_779;
  }
  if ([v480 _isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange])
  {
    if (v484)
    {
      if (v526)
      {
        id v487 = v481;
        [v487 leadingWidth];
        [v487 trailingWidth];

        id v488 = v487;
        [v488 leadingDragOffset];
        [v488 trailingDragOffset];
        [v488 supplementaryDragOffset];
      }
    }
    else if (v474 == 1)
    {
      id v489 = v481;
      [v489 leadingWidth];
      [v489 trailingWidth];

      [v489 leadingDragOffset];
      [v489 trailingDragOffset];
    }
    else if (v475 == v596)
    {
      [v481 supplementaryWidth];
      [v481 supplementaryDragOffset];
    }
    else
    {
      id v490 = v481;
      [v490 leadingWidth];
      double v492 = v491;
      [v490 trailingWidth];
      double v494 = v493;

      if (v492 + v494 > 0.0) {
        totalObscuredPrimaryWidthForState(v490);
      }
    }
    [v480 _navItemContentLayoutGuideAnimationDistance];
    UIRoundToViewScale(v480);
    int v495 = objc_msgSend(v480, "_updateNavItemContentLayoutGuideAnimationConstraintConstant:");
    int v496 = v605 | v495 ^ 1;
    if ((v496 | v615))
    {
      if ((v495 | v496 ^ 1) != 1) {
        goto LABEL_778;
      }
    }
    else
    {
      v497 = [v480 _staticNavBarButtonItem];
      BOOL v498 = v497 == 0;

      if (!v498)
      {
LABEL_778:
        [v480 layoutIfNeeded];
        goto LABEL_779;
      }
    }
    [v480 _setNeedsStaticNavBarButtonUpdate];
    goto LABEL_778;
  }
LABEL_779:

  [v582 frame];
  v727.origin.double x = v499;
  v727.origin.double y = v500;
  v727.size.double width = v501;
  v727.size.double height = v502;
  v723.origin.double x = r1;
  v723.origin.double y = rect;
  v723.size.double width = r1_24;
  v723.size.double height = v601;
  CGRect v724 = CGRectIntersection(v723, v727);
  CGFloat v503 = v724.origin.x;
  CGFloat v504 = v724.origin.y;
  CGFloat v505 = v724.size.width;
  CGFloat v506 = v724.size.height;
  if (CGRectGetWidth(v724) == 0.0) {
    goto LABEL_782;
  }
  v725.origin.double x = v503;
  v725.origin.double y = v504;
  v725.size.double width = v505;
  v725.size.double height = v506;
  if (CGRectGetHeight(v725) == 0.0
    || (v726.origin.double x = v503,
        v726.origin.double y = v504,
        v726.size.double width = v505,
        v726.size.double height = v506,
        CGRectEqualToRect(v726, *MEMORY[0x1E4F1DB20])))
  {
LABEL_782:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2_433;
    aBlock[3] = &unk_1E52DA660;
    id v617 = v583;
    id v618 = v582;
    v507 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v508 = +[UIView _currentViewAnimationState];
      [v508 _addCompletion:v507];
    }
    else
    {
      v507[2](v507, 1);
    }
  }
  id v7 = v613;
LABEL_787:
}

- (UIView)trailingBarContentClippingView
{
  return self->_trailingBarContentClippingView;
}

- (UIView)supplementaryBarContentClippingView
{
  return self->_supplementaryBarContentClippingView;
}

- (UINavigationBar)navigationBarForContentLayoutGuideAnimation
{
  return self->_navigationBarForContentLayoutGuideAnimation;
}

- (UIView)leadingBarContentClippingView
{
  return self->_leadingBarContentClippingView;
}

- (BOOL)wantsFloatingSidebar
{
  return self->_wantsFloatingSidebar;
}

- (_UIFloatableBarButtonItem)floatingBarButtonItem
{
  return self->_floatingBarButtonItem;
}

- (id)allViewControllers
{
  int v3 = objc_opt_new();
  id v4 = [(UIPanelController *)self mainViewController];

  if (v4)
  {
    uint64_t v5 = [(UIPanelController *)self mainViewController];
    [v3 addObject:v5];
  }
  id v6 = [(UIPanelController *)self leadingViewController];

  if (v6)
  {
    id v7 = [(UIPanelController *)self leadingViewController];
    [v3 addObject:v7];
  }
  id v8 = [(UIPanelController *)self trailingViewController];

  if (v8)
  {
    id v9 = [(UIPanelController *)self trailingViewController];
    [v3 addObject:v9];
  }
  uint64_t v10 = [(UIPanelController *)self collapsedViewController];
  if (v10)
  {
    uint64_t v11 = [v3 indexOfObjectIdenticalTo:v10];
    if (v11)
    {
      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        [v3 removeObjectAtIndex:v11];
      }
      [v3 insertObject:v10 atIndex:0];
    }
  }

  return v3;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  int v3 = [(UIPanelController *)self _internalState];
  id v4 = [v3 animationState];
  if ([v4 animatorShouldCoordinate])
  {
    uint64_t v5 = [(UIPanelController *)self _internalState];
    id v6 = [v5 animationState];
    id v7 = [v6 animator];
  }
  else
  {
    id v7 = 0;
  }

  return (UIViewControllerTransitionCoordinator *)v7;
}

- (void)setPresentationGestureActive:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFFFEF | v3);
}

- (BOOL)isPresentationGestureActive
{
  return (*(unsigned char *)&self->_panelControllerFlags >> 4) & 1;
}

- (BOOL)isRunExpandScheduled
{
  return *((unsigned char *)&self->_panelControllerFlags + 2) & 1;
}

- (UIViewController)preservedDetailController
{
  uint64_t v2 = [(UIPanelController *)self _internalState];
  int v3 = [v2 preservedDetailController];

  return (UIViewController *)v3;
}

- (void)setCollapsedViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPanelController *)self _internalState];
  [v5 setCollapsedViewController:v4];
}

- (void)setStateRequest:(id)a3
{
  id v7 = a3;
  id v4 = [(UIPanelController *)self _internalState];
  id v5 = [v4 stateRequest];

  if (v5 != v7)
  {
    id v6 = [(UIPanelController *)self _internalState];
    [v6 setStateRequest:v7];

    if (!v7 || !v5 || ([v5 isEqual:v7] & 1) == 0) {
      [(UIPanelController *)self _setNeedsDeferredUpdate];
    }
  }
}

- (void)addWrapperBlockForNextUpdate:(id)a3
{
  id v4 = a3;
  wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  aBlocuint64_t k = v4;
  if (!wrapperBlocksForNextUpdate)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_wrapperBlocksForNextUpdate;
    self->_wrapperBlocksForNextUpdate = v6;

    id v4 = aBlock;
    wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  }
  id v8 = _Block_copy(v4);
  [(NSMutableArray *)wrapperBlocksForNextUpdate addObject:v8];
}

- (id)gatherMultitaskingDragExclusionRectsFromVisibleColumns
{
  int v3 = [(UIPanelController *)self _internalState];
  id v4 = [v3 leadingViewController];

  id v5 = [(UIPanelController *)self _internalState];
  id v6 = [v5 mainViewController];

  id v7 = [(UIPanelController *)self _internalState];
  id v8 = [v7 trailingViewController];

  id v9 = [(UIPanelController *)self _internalState];
  uint64_t v10 = [v9 supplementaryViewController];

  uint64_t v11 = [(UIPanelController *)self _lastComputedPublicState];
  uint64_t v12 = [v11 _collapsedState];

  BOOL v13 = [(UIPanelController *)self _internalState];
  uint64_t v14 = [v13 collapsedViewController];

  id v15 = [(UIPanelController *)self owningViewController];
  uint64_t v16 = [v15 viewIfLoaded];

  if (v16)
  {
    unint64_t v17 = v12 - 1;
    unint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    id v32 = __75__UIPanelController_gatherMultitaskingDragExclusionRectsFromVisibleColumns__block_invoke;
    uint64_t v33 = &unk_1E52E8EB0;
    id v34 = v16;
    id v35 = v18;
    id v19 = v18;
    double v20 = _Block_copy(&v30);
    double v25 = (void (**)(void, void))v20;
    double v26 = (void (*)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v20 + 2);
    if (v17 > 1)
    {
      v26(v20, v4, v21, v22, v23, v24);
      ((void (**)(void, void *))v25)[2](v25, v6);
      ((void (**)(void, void *))v25)[2](v25, v8);
      double v26 = (void (*)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t))v25[2];
      double v20 = v25;
      id v27 = v10;
    }
    else
    {
      id v27 = v14;
    }
    ((void (*)(void *, void *))v26)(v20, v27);
    BOOL v28 = objc_msgSend(v19, "copy", v30, v31, v32, v33);
  }
  else
  {
    BOOL v28 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

void __75__UIPanelController_gatherMultitaskingDragExclusionRectsFromVisibleColumns__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 _effectiveViewControllerForMultitaskingDragExclusionRects];
    id v6 = [v4 _effectiveViewControllerForMultitaskingDragExclusionRects];
    id v7 = [v6 viewIfLoaded];

    if (v7)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v16 = v5;
      id v8 = [v5 _multitaskingDragExclusionRects];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            BOOL v13 = *(void **)(a1 + 32);
            [*(id *)(*((void *)&v17 + 1) + 8 * v12) CGRectValue];
            objc_msgSend(v13, "convertRect:fromView:", v7);
            uint64_t v14 = *(void **)(a1 + 40);
            id v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
            [v14 addObject:v15];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      id v5 = v16;
    }
  }
}

- (BOOL)_willExpandWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIPanelController *)self _willCollapseWithNewTraitCollection:v6 oldTraitCollection:v7])
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [(UIPanelController *)self _internalState];
    uint64_t v10 = [v9 collapsedState];

    uint64_t v11 = [v7 horizontalSizeClass];
    uint64_t v12 = [v6 horizontalSizeClass];
    BOOL v14 = v11 == 1 || v10 == 2;
    BOOL v8 = v12 == 2 && v14;
  }

  return v8;
}

- (void)_expandWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPanelController *)self _internalState];
  [v5 setCollapsedState:3];

  id v6 = [(UIPanelController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ([(UIPanelController *)self delegate],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        [v8 primaryViewControllerForExpandingPanelController:self],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    uint64_t v10 = [(UIPanelController *)self _internalState];
    uint64_t v9 = [v10 collapsedViewController];
  }
  uint64_t v11 = [(UIPanelController *)self delegate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E52E7BF8;
  void aBlock[4] = self;
  id v12 = v9;
  id v33 = v12;
  id v13 = v11;
  id v34 = v13;
  BOOL v14 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_5;
  v30[3] = &unk_1E52DB270;
  v30[4] = self;
  id v15 = v13;
  id v31 = v15;
  uint64_t v16 = _Block_copy(v30);
  if (UIApp)
  {
    if (![(UIPanelController *)self style]) {
      goto LABEL_14;
    }
    uint64_t v17 = [v12 _window];
    if (!v17) {
      goto LABEL_14;
    }
    long long v18 = (void *)v17;
    int v19 = [v12 _isNavigationController];

    if (!v19) {
      goto LABEL_14;
    }
    long long v20 = [v12 _transitionConductor];
    id v21 = [v20 transitionCoordinator];

    if (v21)
    {
      uint64_t v22 = v4;
      if (v21 != v4)
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        double v25 = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_6;
        double v26 = &unk_1E52E9718;
        id v27 = self;
        id v28 = v14;
        id v29 = v16;
        [v21 animateAlongsideTransition:0 completion:&v23];
        -[UIPanelController setRunExpandScheduled:](self, "setRunExpandScheduled:", 1, v23, v24, v25, v26, v27);

        uint64_t v22 = v21;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
LABEL_14:
      uint64_t v22 = 0;
    }
    if (![(UIPanelController *)self isRunExpandScheduled])
    {
      if (v4)
      {
        [v4 animateAlongsideTransition:v14 completion:v16];
        [(UIPanelController *)self setRunExpandScheduled:1];
      }
      else
      {
        (*((void (**)(void *, void))v14 + 2))(v14, 0);
        (*((void (**)(void *, void))v16 + 2))(v16, 0);
      }
    }
    goto LABEL_19;
  }
  if (v4)
  {
    [v4 animateAlongsideTransition:v14 completion:v16];
  }
  else
  {
    (*((void (**)(void *, void))v14 + 2))(v14, 0);
    (*((void (**)(void *, void))v16 + 2))(v16, 0);
  }
LABEL_20:
}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _internalState];
  uint64_t v3 = [v2 collapsedState];

  if (v3 == 3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_2;
    v5[3] = &unk_1E52DCB30;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:v5];
  }
}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_3;
  v3[3] = &unk_1E52DCB30;
  uint64_t v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:v3];
}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_4;
  v3[3] = &unk_1E52DCB30;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _withDisabledAppearanceTransitionsPerform:v3];
}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_4(id *a1)
{
  [a1[4] _setChangingViewControllerParentage:1];
  if (!a1[5])
  {
    uint64_t v3 = 0;
    id v19 = 0;
    goto LABEL_29;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [a1[6] panelController:a1[4] separateSecondaryViewControllerFromPrimaryViewController:a1[5]];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v19 = (id)v2;
  if (a1[5])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [a1[6] panelController:a1[4] separateSupplementaryViewControllerFromPrimaryViewController:a1[5]];
      if (v3) {
        [a1[4] _addIdentifiedChildViewController:v3];
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    if (v19) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (v2) {
LABEL_14:
    }
      [a1[4] _addIdentifiedChildViewController:v19];
  }
  id v4 = a1[5];
  if (!v4) {
    goto LABEL_29;
  }
  id v5 = [v4 parentViewController];
  id v6 = [a1[4] owningViewController];
  if (v5 != v6)
  {

LABEL_28:
    goto LABEL_29;
  }
  id v7 = a1[5];
  uint64_t v8 = [a1[4] mainViewController];
  if (v7 == (id)v8)
  {

LABEL_27:
    goto LABEL_28;
  }
  uint64_t v9 = (void *)v8;
  id v10 = a1[5];
  uint64_t v11 = [a1[4] leadingViewController];
  if (v10 == (id)v11)
  {

LABEL_26:
    goto LABEL_27;
  }
  id v12 = (void *)v11;
  id v13 = a1[5];
  uint64_t v14 = [a1[4] trailingViewController];
  if (v13 == (id)v14)
  {

    goto LABEL_26;
  }
  id v15 = (void *)v14;
  id v16 = a1[5];
  id v17 = [a1[4] supplementaryViewController];

  if (v16 != v17) {
    [a1[4] _removeIdentifiedChildViewController:a1[5]];
  }
LABEL_29:
  [a1[4] _setChangingViewControllerParentage:0];
  [a1[5] _setAllowNestedNavigationControllers:0];
  long long v18 = [a1[4] _internalState];
  [v18 setCollapsedViewController:0];
}

uint64_t __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _internalState];
  uint64_t v3 = [v2 collapsedState];

  if (v3 == 3)
  {
    id v4 = [*(id *)(a1 + 32) _internalState];
    [v4 setCollapsedState:0];

    [*(id *)(a1 + 32) setPreservedDetailController:0];
    [*(id *)(a1 + 32) _setNeedsDeferredUpdate];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) panelControllerDidExpand:*(void *)(a1 + 32)];
    }
  }
  id v5 = *(void **)(a1 + 32);
  return [v5 setRunExpandScheduled:0];
}

uint64_t __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _internalState];
  uint64_t v3 = [v2 collapsedState];

  if (v3 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setRunExpandScheduled:0];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  id v10 = [(UIPanelController *)self owningViewController];
  uint64_t v11 = [v10 traitCollection];

  id v12 = [(UIView *)self->_view window];
  if (v12)
  {
    if (v8) {
      [v8 targetTransform];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    if (!CGAffineTransformIsIdentity(&v17))
    {
      if ([(UIPanelController *)self _willCollapseWithNewTraitCollection:v16 oldTraitCollection:v11])
      {
      }
      else
      {
        BOOL v13 = [(UIPanelController *)self _willExpandWithNewTraitCollection:v16 oldTraitCollection:v11];

        if (!v13) {
          goto LABEL_12;
        }
      }
      uint64_t v14 = [(UIPanelController *)self _contentView];
      id v12 = [v14 snapshotViewAfterScreenUpdates:0];

      if (v12)
      {
        id v15 = [[_UIPanelControllerMeshAnimatingTransitionView alloc] initWithView:v12];
        [(UIPanelController *)self _setSourceTransitionView:v15];
      }
    }
  }

LABEL_12:
  *(_DWORD *)&self->_panelControllerFlags |= 0x40u;
  [(UIPanelController *)self _updateForTraitCollection:v16 oldTraitCollection:v11 withTransitionCoordinator:v8];
  *(_DWORD *)&self->_panelControllerFlags &= ~0x40u;
  if (v9) {
    v9[2](v9);
  }
}

- (void)_storeSuspendedConfiguration
{
  id v4 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v4 configuration];
  [(UIPanelController *)self _setSuspendedConfiguration:v3];
}

- (void)_clearSuspendedConfiguration
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a4;
  id v10 = a5;
  [(UIPanelController *)self _stopAnimationsBeginningInteraction:0];
  *(_DWORD *)&self->_panelControllerFlags |= 0x80u;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke;
  aBlock[3] = &unk_1E52E9740;
  void aBlock[4] = self;
  CGFloat v67 = width;
  CGFloat v68 = height;
  id v11 = v10;
  id v66 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  BOOL v13 = [(UIPanelController *)self _sourceTransitionView];
  uint64_t v14 = [(UIPanelController *)self _contentView];
  if (v9) {
    [v9 targetTransform];
  }
  else {
    memset(&v69, 0, sizeof(v69));
  }
  id v15 = 0;
  if (!CGAffineTransformIsIdentity(&v69) && !v13)
  {
    if ((*((unsigned char *)&self->_panelControllerFlags + 1) & 2) != 0)
    {
      id v15 = 0;
    }
    else
    {
      char v16 = [v14 autoresizesSubviews];
      *(_DWORD *)&self->_panelControllerFlags |= 0x200u;
      [v14 setAutoresizesSubviews:0];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_2;
      v62[3] = &unk_1E52DC3D0;
      v62[4] = self;
      id v63 = v14;
      char v64 = v16;
      id v15 = _Block_copy(v62);
    }
  }
  v69.a = 0.0;
  *(void *)&v69.b = &v69;
  *(void *)&v69.c = 0x3032000000;
  *(void *)&v69.d = __Block_byref_object_copy__58;
  *(void *)&v69.tdouble x = __Block_byref_object_dispose__58;
  v69.tdouble y = 0.0;
  [v14 bounds];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  [v14 center];
  uint64_t v41 = v26;
  uint64_t v42 = v25;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
  id v28 = [(UIPanelController *)self _internalState];
  double v29 = _transitionInsetsForViewController(WeakRetained, v28);
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_3;
  v47[3] = &unk_1E52E9790;
  v47[4] = self;
  id v36 = v15;
  id v50 = v36;
  id v37 = v13;
  id v48 = v37;
  id v38 = v14;
  id v49 = v38;
  BOOL v51 = &v69;
  uint64_t v52 = v24;
  uint64_t v53 = v22;
  uint64_t v54 = v20;
  uint64_t v55 = v18;
  double v56 = v29;
  uint64_t v57 = v31;
  uint64_t v58 = v33;
  uint64_t v59 = v35;
  uint64_t v60 = v42;
  uint64_t v61 = v41;
  [v9 animateAlongsideTransition:v47 completion:0];
  v12[2](v12);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_6;
  v43[3] = &unk_1E52E97B8;
  v43[4] = self;
  id v39 = v37;
  id v44 = v39;
  double v46 = &v69;
  id v40 = v38;
  id v45 = v40;
  [v9 animateAlongsideTransition:0 completion:v43];

  _Block_object_dispose(&v69, 8);
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 8) |= 0x100u;
  id v14 = [*(id *)(a1 + 32) _internalState];
  uint64_t v2 = [*(id *)(a1 + 32) _lastComputedPublicState];
  uint64_t v3 = [*(id *)(a1 + 32) _lastPossiblePublicStates];
  id v4 = (void *)[v14 copy];
  [*(id *)(a1 + 32) _setInternalState:v4];
  id v5 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 panelControllerWillUpdate:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [*(id *)(a1 + 32) view];
  id v8 = objc_msgSend(v4, "computePossibleStatesGivenParentView:withSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v6)
  {
    id v9 = ((void (**)(void, void *, void))v6)[2](v6, v8, 0);
    [*(id *)(a1 + 32) setStateRequest:v9];
  }
  id v10 = [v4 stateRequest];

  if (!v10
    || ([v4 stateRequest],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 _matchingState:v8],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    id v12 = [v8 firstObject];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 panelController:*(void *)(a1 + 32) willChangeToState:v12];
  }
  [*(id *)(a1 + 32) _setLastComputedPublicState:v12];
  [*(id *)(a1 + 32) _setLastPossiblePublicStates:v8];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
  [*(id *)(a1 + 32) _setInternalState:v14];
  [*(id *)(a1 + 32) _setLastComputedPublicState:v2];
  [*(id *)(a1 + 32) _setLastPossiblePublicStates:v3];
  *(_DWORD *)(*(void *)(a1 + 32) + 8) &= ~0x100u;
}

uint64_t __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 8) &= ~0x200u;
  return [*(id *)(a1 + 40) setAutoresizesSubviews:*(unsigned __int8 *)(a1 + 48)];
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id v5 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v6 = [v5 _destTransitionView];

    if (!v6)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 8) |= 0x400u;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_4;
      v72[3] = &unk_1E52D9F70;
      v72[4] = *(void *)(a1 + 32);
      +[UIView performWithoutAnimation:v72];
      [*(id *)(a1 + 48) _removeAllAnimationsIncludingSubviewsTrackingForAnimationRestoration];
      id v7 = [_UIPortalView alloc];
      [*(id *)(a1 + 48) bounds];
      id v8 = -[_UIPortalView initWithFrame:](v7, "initWithFrame:");
      [(_UIPortalView *)v8 setSourceView:*(void *)(a1 + 48)];
      [(_UIPortalView *)v8 setHidesSourceView:1];
      id v9 = [[_UIPanelControllerMeshAnimatingTransitionView alloc] initWithView:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [*(id *)(a1 + 32) _setDestinationTransitionView:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      *(_DWORD *)(*(void *)(a1 + 32) + 8) &= ~0x400u;
      [*(id *)(a1 + 48) bounds];
      double v13 = v12;
      double rect = v14;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      double v19 = v15 * 0.5;
      double v46 = v17 * 0.5;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      uint64_t v21 = [*(id *)(a1 + 32) _internalState];
      double v22 = _transitionInsetsForViewController(WeakRetained, v21);
      double v44 = v23;
      double v45 = v22;
      double v42 = v25;
      double v43 = v24;

      double Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
      double v27 = 1.0;
      double v28 = 1.0;
      if (Width > 0.0)
      {
        double v29 = Width;
        v73.origin.double x = v13;
        v73.origin.double y = rect;
        v73.size.CGFloat width = v16;
        v73.size.CGFloat height = v18;
        double v28 = CGRectGetWidth(v73) / v29;
      }
      double v47 = rect + v46;
      double v48 = v13 + v19;
      double Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
      if (Height > 0.0)
      {
        double v31 = Height;
        v74.origin.double x = v13;
        v74.origin.double y = rect;
        v74.size.CGFloat width = v16;
        v74.size.CGFloat height = v18;
        double v27 = CGRectGetHeight(v74) / v31;
      }
      memset(&v71, 0, sizeof(v71));
      CGAffineTransformMakeScale(&v71, v28, v27);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      void v52[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_5;
      v52[3] = &unk_1E52E9768;
      id v53 = *(id *)(a1 + 48);
      id v32 = *(id *)(a1 + 40);
      long long v33 = *(_OWORD *)(a1 + 88);
      long long v57 = *(_OWORD *)(a1 + 72);
      long long v58 = v33;
      long long v34 = *(_OWORD *)(a1 + 120);
      long long v59 = *(_OWORD *)(a1 + 104);
      long long v60 = v34;
      uint64_t v56 = *(void *)(a1 + 64);
      long long v61 = *(_OWORD *)(a1 + 136);
      CGAffineTransform v62 = v71;
      double v63 = v13;
      double v64 = rect;
      CGFloat v65 = v16;
      CGFloat v66 = v18;
      double v67 = v45;
      double v68 = v44;
      double v69 = v43;
      double v70 = v42;
      uint64_t v35 = *(void *)(a1 + 32);
      id v54 = v32;
      uint64_t v55 = v35;
      +[UIView performWithoutAnimation:v52];
      objc_msgSend(*(id *)(a1 + 40), "setCenter:", v48, v47);
      CGAffineTransform v51 = v71;
      [*(id *)(a1 + 40) setTransform:&v51];
      id v36 = _resizeMeshTransform(*(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), v13, rect, v16, v18, v45, v44, v43, v42);
      id v37 = [*(id *)(a1 + 40) layer];
      [v37 setMeshTransform:v36];

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAlpha:1.0];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setCenter:", v48, v47);
      id v38 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      long long v39 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v50[0] = *MEMORY[0x1E4F1DAB8];
      v50[1] = v39;
      v50[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v38 setTransform:v50];
      id v40 = _resizeMeshTransform(v13, rect, v16, v18, v45, v44, v43, v42, v13, rect, v16, v18, v45, v44, v43, v42);
      uint64_t v41 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) layer];
      [v41 setMeshTransform:v40];
    }
  }
  else
  {
    [v5 _setNeedsDeferredUpdate];
  }
}

uint64_t __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsLayoutAndPerformImmediately:1];
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) traitCollection];
  [v2 displayScale];
  double v4 = v3;

  id v5 = _resizeMeshTransform(*(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  id v6 = [*(id *)(a1 + 40) layer];
  [v6 setMeshTransform:v5];

  id v7 = [*(id *)(a1 + 40) layer];
  [v7 setRasterizationScale:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAlpha:0.0];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setCenter:", *(double *)(a1 + 128), *(double *)(a1 + 136));
  long long v8 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&v16.a = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v16.c = v8;
  *(_OWORD *)&v16.tdouble x = *(_OWORD *)(a1 + 176);
  CGAffineTransformInvert(&v17, &v16);
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  CGAffineTransform v15 = v17;
  [v9 setTransform:&v15];
  uint64_t v10 = _resizeMeshTransform(*(CGFloat *)(a1 + 192), *(CGFloat *)(a1 + 200), *(CGFloat *)(a1 + 208), *(CGFloat *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  id v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) layer];
  [v11 setMeshTransform:v10];

  double v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) layer];
  [v12 setRasterizationScale:v4];

  double v13 = [*(id *)(a1 + 48) view];
  [v13 insertSubview:*(void *)(a1 + 40) aboveSubview:*(void *)(a1 + 32)];

  double v14 = [*(id *)(a1 + 48) view];
  [v14 insertSubview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) aboveSubview:*(void *)(a1 + 40)];
}

void *__83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_6(uint64_t a1)
{
  CGSize result = *(void **)(a1 + 40);
  if (result && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [result removeFromSuperview];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeFromSuperview];
    [*(id *)(a1 + 32) _setSourceTransitionView:0];
    [*(id *)(a1 + 32) _setDestinationTransitionView:0];
    CGSize result = (void *)[*(id *)(a1 + 48) _finishTrackingForAnimationRestoration];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 8) &= ~0x80u;
  return result;
}

void __63__UIPanelController__withDisabledAppearanceTransitionsPerform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v8++) setAppearanceTransitionsAreDisabled:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  if (v3) {
    v3[2](v3);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v13++) setAppearanceTransitionsAreDisabled:0];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
        if (v19)
        {
          if (((*(_DWORD *)(v19 + 376) >> 1) & 3u) - 1 <= 1)
          {
            uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v18), "_existingView", (void)v22);
            uint64_t v21 = [v20 window];

            if (!v21)
            {
              -[UIViewController __viewWillDisappear:](v19, 0);
              -[UIViewController __viewDidDisappear:](v19, 0);
            }
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v16);
  }
}

uint64_t __44__UIPanelController__setNeedsDeferredUpdate__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 8) |= 8u;
  return [*(id *)(a1 + 32) _setNeedsLayoutAndPerformImmediately:1];
}

void __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = *(void **)(a1 + 32);
    id v8 = WeakRetained;
    id v4 = [WeakRetained _internalState];
    uint64_t v5 = [v4 externallyAnimatingStateRequest];
    LODWORD(v3) = [v3 isEqual:v5];

    id WeakRetained = v8;
    if (v3)
    {
      uint64_t v6 = [v8 _internalState];
      [v6 setExternallyAnimatingStateRequest:0];

      uint64_t v7 = [v8 _internalState];
      [v7 setExternallyAnimatingAffectedSides:0];

      [v8 setNeedsUpdate];
      id WeakRetained = v8;
    }
  }
}

void __43__UIPanelController__performWrappedUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (void (**)(id, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 40));
  WeakRetained[2](WeakRetained, *(void *)(a1 + 32));
}

void __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_431(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _setNeedsStaticNavBarButtonUpdate];
}

uint64_t __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2_433(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    double v3 = *(void **)(v2 + 40);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (double)interpolatedMarginForPrimaryNavigationBar:(id)a3 supplementaryOrSecondaryNavbar:(id)a4 getInterpolatedAlpha:(double *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(UIPanelController *)self currentState];
  [v10 supplementaryWidth];
  double v12 = v11;
  id v13 = v10;
  [v13 leadingWidth];
  double v15 = v14;
  [v13 trailingWidth];
  double v17 = v16;

  double v18 = v15 + v17;
  if (v12 <= 0.0)
  {
    [v13 leadingDragOffset];
    double v29 = v28;
    [v13 trailingDragOffset];
    double v19 = 1.0;
    if (v18 <= 0.0) {
      goto LABEL_7;
    }
    double v27 = v29 + v30;
  }
  else
  {
    double v19 = 1.0;
    if (v18 <= 0.0) {
      goto LABEL_7;
    }
    id v20 = v13;
    [v20 leadingDragOffset];
    double v22 = v21;
    [v20 trailingDragOffset];
    double v24 = v22 + v23;
    [v20 supplementaryDragOffset];
    double v26 = v25;

    double v27 = v24 + v26;
  }
  double v19 = v27 / v18;
LABEL_7:
  if (v8)
  {
    int v31 = [v8 _isContentViewHidden] ^ 1;
    if (v9)
    {
LABEL_9:
      int v32 = [v9 _isContentViewHidden];
      double v33 = 0.0;
      if (v31) {
        double v34 = 1.0;
      }
      else {
        double v34 = 0.0;
      }
      if (v32)
      {
        uint64_t v35 = v8;
      }
      else
      {
        double v33 = 1.0;
        uint64_t v35 = v9;
      }
      goto LABEL_19;
    }
  }
  else
  {
    int v31 = 0;
    if (v9) {
      goto LABEL_9;
    }
  }
  double v33 = 0.0;
  double v34 = 1.0;
  if (!v31) {
    double v34 = 0.0;
  }
  uint64_t v35 = v8;
LABEL_19:
  double v36 = 1.0 - v19;
  if (a5)
  {
    double v34 = v36 * v34;
    double v33 = v34 + v19 * v33;
    *a5 = v33;
  }
  if (v31) {
    uint64_t v37 = v8;
  }
  else {
    uint64_t v37 = v9;
  }
  objc_msgSend(v37, "_contentMargin", v33, v34);
  double v39 = v38;
  [v35 _contentMargin];
  double v41 = v36 * v39 + v19 * v40;

  return v41;
}

- (id)_createBorderView
{
  uint64_t v2 = [UIPanelBorderView alloc];
  double v3 = -[UIPanelBorderView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

- (id)_createOverlayEdgeShadowViewForEdge:(unint64_t)a3
{
  double v3 = [[_UIVerticalEdgeShadowView alloc] initWithWidth:a3 edge:9.0];
  return v3;
}

- (id)_createOverlayShadowView
{
  uint64_t v2 = objc_opt_new();
  [v2 setRadius:1.0];
  [v2 setOpacity:0.16];
  double v3 = objc_opt_new();
  [v3 setRadius:4.0];
  [v3 setOpacity:0.1];
  id v4 = objc_alloc_init(_UIDuoShadowView);
  -[_UIDuoShadowView setPrimaryShadow:]((uint64_t)v4, v2);
  -[_UIDuoShadowView setSecondaryShadow:]((uint64_t)v4, v3);

  return v4;
}

- (void)_updateBorderViewsBackgroundColor:(id)a3
{
  id v10 = a3;
  id v4 = [(UIPanelController *)self _leadingBorderView];

  if (v4)
  {
    uint64_t v5 = [(UIPanelController *)self _leadingBorderView];
    [v5 setBackgroundColor:v10];
  }
  uint64_t v6 = [(UIPanelController *)self _trailingBorderView];

  if (v6)
  {
    uint64_t v7 = [(UIPanelController *)self _trailingBorderView];
    [v7 setBackgroundColor:v10];
  }
  id v8 = [(UIPanelController *)self _supplementaryBorderView];

  if (v8)
  {
    id v9 = [(UIPanelController *)self _supplementaryBorderView];
    [v9 setBackgroundColor:v10];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_view == a4 && [a3 isEqualToString:@"backgroundColor"])
  {
    id v7 = [(UIView *)self->_view backgroundColor];
    [(UIPanelController *)self _updateBorderViewsBackgroundColor:v7];
  }
}

- (void)_stopAnimationsBeginningInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIPanelController *)self _internalState];
  uint64_t v6 = [v5 animationState];
  id v50 = [v6 animator];

  int v7 = [v50 isRunning];
  [v50 stopAnimation:0];
  [v50 finishAnimationAtPosition:2];
  id v8 = [(UIPanelController *)self navigationBarForContentLayoutGuideAnimation];
  id v9 = v8;
  if (v8)
  {
    [v8 _endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
    [v9 _setShouldFadeStaticNavBarButton:0];
    [(UIPanelController *)self setNavigationBarForContentLayoutGuideAnimation:0];
  }
  if (v3)
  {
    id v10 = [(UIPanelController *)self currentState];
    double v11 = [v10 stateRequest];

    double v12 = (void *)[v11 copy];
    if (v7)
    {
      id v13 = [(UIPanelController *)self _internalState];
      double v14 = [v13 configuration];

      id v49 = v14;
      uint64_t v15 = [v14 supplementaryEdge];
      double v16 = [(UIPanelController *)self view];
      unsigned int v17 = (v15 == 0) ^ [v16 _shouldReverseLayoutDirection];
      if (v15) {
        [(UIPanelController *)self trailingViewController];
      }
      else {
      double v18 = [(UIPanelController *)self leadingViewController];
      }
      double v19 = [v18 view];

      if (v17)
      {
        CGFloat MaxX = *MEMORY[0x1E4F1DB28];
        CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      else
      {
        [v16 bounds];
        CGFloat MaxX = CGRectGetMaxX(v52);
        CGFloat v22 = 0.0;
        CGFloat v23 = 0.0;
        CGFloat v21 = 0.0;
      }
      double v24 = [v19 window];

      if (v24)
      {
        [v19 frame];
        CGFloat MaxX = v25;
        CGFloat v21 = v26;
        CGFloat v23 = v27;
        CGFloat v22 = v28;
      }
      double v29 = [(UIPanelController *)self supplementaryViewController];
      double v30 = [v29 view];
      [v30 frame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      if (v17)
      {
        v53.origin.double x = MaxX;
        v53.origin.double y = v21;
        v53.size.CGFloat width = v23;
        v53.size.CGFloat height = v22;
        double v39 = CGRectGetMaxX(v53);
      }
      else
      {
        [v16 bounds];
        CGFloat v40 = CGRectGetMaxX(v54);
        CGFloat v41 = MaxX;
        double v42 = v40;
        v55.origin.double x = v41;
        v55.origin.double y = v21;
        v55.size.CGFloat width = v23;
        v55.size.CGFloat height = v22;
        double v39 = v42 - CGRectGetMinX(v55);
      }
      if (v15) {
        [v12 setTrailingWidth:v39];
      }
      else {
        [v12 setLeadingWidth:v39];
      }
      v56.origin.double x = v32;
      v56.origin.double y = v34;
      v56.size.CGFloat width = v36;
      v56.size.CGFloat height = v38;
      double Width = CGRectGetWidth(v56);
      if (v17)
      {
        v57.origin.double x = v32;
        v57.origin.double y = v34;
        v57.size.CGFloat width = v36;
        v57.size.CGFloat height = v38;
        double v44 = CGRectGetMaxX(v57);
      }
      else
      {
        [v16 bounds];
        double v45 = CGRectGetMaxX(v58);
        v59.origin.double x = v32;
        v59.origin.double y = v34;
        v59.size.CGFloat width = v36;
        v59.size.CGFloat height = v38;
        double v44 = v45 - CGRectGetMinX(v59);
      }
      if (Width < v44) {
        double v44 = Width;
      }
      [v12 setSupplementaryWidth:v44];
    }
    if (![v12 isEqual:v11]
      || ([v12 leadingWidth], v46 != 0.0)
      || ([v12 supplementaryWidth], v47 != 0.0)
      || ([v12 trailingWidth], v48 != 0.0))
    {
      [(UIPanelController *)self setInteractiveStateRequest:v12];
    }
  }
}

- (void)stopAnimations
{
}

- (CGSize)_expectedSecondaryColumnSizeAfterAnimatingToState:(id)a3 getLeadingColumnSize:(CGSize *)a4 trailingColumnSize:(CGSize *)a5 supplementaryColumnSize:(CGSize *)a6
{
  id v9 = a3;
  if (![(UIPanelController *)self style])
  {
    CGRect v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2 object:self file:@"UIPanelController.m" lineNumber:4958 description:@"Unsupported code path for unspecified-style UISplitViewController"];
  }
  [v9 leadingWidth];
  double v11 = v10;
  [v9 trailingWidth];
  double v13 = v12;
  [v9 supplementaryWidth];
  double v15 = v14;
  if (v11 <= 0.0) {
    int v16 = 0;
  }
  else {
    int v16 = [v9 leadingOverlapsMain] ^ 1;
  }
  if (v13 <= 0.0) {
    int v17 = 0;
  }
  else {
    int v17 = [v9 trailingOverlapsMain] ^ 1;
  }
  if (v15 <= 0.0) {
    int v18 = 0;
  }
  else {
    int v18 = [v9 supplementaryOverlapsMain] ^ 1;
  }
  double v19 = [v9 configuration];
  id v20 = [(UIPanelController *)self _contentView];
  [v20 bounds];
  double v22 = v21;
  CGFloat v23 = [(UIPanelController *)self mainViewController];
  double v24 = [v23 view];
  [v24 bounds];
  double v61 = v25;
  double v62 = v26;

  double v27 = [(UIPanelController *)self leadingViewController];
  double v28 = [v27 view];
  [v28 bounds];
  double v30 = v29;
  CGFloat v60 = v31;

  CGFloat v32 = [(UIPanelController *)self trailingViewController];
  double v33 = [v32 view];
  [v33 bounds];
  double v35 = v34;
  CGFloat v59 = v36;

  double v37 = [(UIPanelController *)self supplementaryViewController];
  CGFloat v38 = [v37 view];
  [v38 bounds];
  double v40 = v39;
  CGFloat v58 = v41;

  [v20 _currentScreenScale];
  objc_msgSend(v19, "leadingBorderWidthForScale:");
  double v43 = v42;
  [v9 mainWidth];
  if (v44 == 0.0)
  {
    if ((v16 | v17 | v18) == 1)
    {
      double v45 = v11 + v43;
      double v46 = 0.0;
      if (!v16) {
        double v45 = 0.0;
      }
      double v47 = v22 - v45;
      if (v17) {
        double v46 = v13 + v43;
      }
      double v22 = v47 - v46;
      if (v18) {
        double v22 = v22 - (v15 + v43);
      }
    }
  }
  else
  {
    double v22 = v44;
  }
  if (v11 == 0.0)
  {
    [v9 leadingOffscreenWidth];
    double v11 = v48;
  }
  if (v13 == 0.0)
  {
    [v9 trailingOffscreenWidth];
    double v13 = v49;
  }
  if (v11 > 0.0)
  {
    [v19 rubberBandExtension];
    double v30 = v11 + v50;
  }
  if (v13 > 0.0)
  {
    [v19 rubberBandExtension];
    double v35 = v13 + v51;
  }
  if (v15 == 0.0)
  {
    [v9 supplementaryOffscreenWidth];
    double v15 = v52;
  }
  if (v15 <= 0.0) {
    double v53 = v40;
  }
  else {
    double v53 = v15;
  }
  if (a4)
  {
    a4->CGFloat width = v30;
    a4->CGFloat height = v60;
  }
  if (a5)
  {
    a5->CGFloat width = v35;
    a5->CGFloat height = v59;
  }
  if (a6)
  {
    a6->CGFloat width = v53;
    a6->CGFloat height = v58;
  }
  if (v22 <= 0.0) {
    double v54 = v61;
  }
  else {
    double v54 = v22;
  }

  double v55 = v54;
  double v56 = v62;
  result.CGFloat height = v56;
  result.CGFloat width = v55;
  return result;
}

- (void)_animateFromRequest:(id)a3 toRequest:(id)a4 withAffectedSides:(int64_t)a5 forceOverlay:(BOOL)a6 velocity:(double)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  double v14 = v13;
  if (v12 && v13)
  {
    double v15 = [(UIPanelController *)self _internalState];
    int v16 = [v15 animationState];

    if (v16)
    {
      int v17 = [(UIPanelController *)self _internalState];
      int v18 = [v17 animationState];
      double v19 = [v18 toRequest];
      char v20 = [v19 isEqual:v14];

      if (v20) {
        goto LABEL_25;
      }
      double v21 = [(UIPanelController *)self _internalState];
      double v22 = [v21 animationState];
      CGFloat v23 = [v22 animator];
      [v23 stopAnimation:1];
    }
    double v24 = [(UIPanelController *)self currentState];
    double v25 = [v24 _interactiveStateRequest];
    int v26 = [v14 isEqual:v25];

    if (v26)
    {
      double v27 = [(UIPanelController *)self _internalState];
      [v27 setStateRequest:v14];

      double v28 = [(UIPanelController *)self _internalState];
      double v29 = [v28 animationState];

      if (!v29)
      {
        double v30 = [(UIPanelController *)self navigationBarForContentLayoutGuideAnimation];
        [v30 _endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];

        [(UIPanelController *)self setNavigationBarForContentLayoutGuideAnimation:0];
      }
    }
    else
    {
      id v75 = [(UIPanelController *)self delegate];
      double v31 = [(UIPanelController *)self view];
      CGFloat v32 = [(UIPanelController *)self _internalState];
      double v33 = (void *)[v32 copy];

      [v31 bounds];
      CGRect v74 = v31;
      uint64_t v36 = objc_msgSend(v33, "computePossibleStatesGivenParentView:withSize:forceOverlay:", v31, v8, v34, v35);
      CGRect v73 = v33;
      double v37 = [v33 _stateForInteractiveRequest:v14 withAffectedSides:a5 inPossibleStates:v36];
      +[_UIPanelAnimationState defaultDuration];
      double v39 = v38;
      double v40 = objc_alloc_init(_UIPanelAnimationState);
      [(_UIPanelAnimationState *)v40 setToRequest:v14];
      [(_UIPanelAnimationState *)v40 setFromRequest:v12];
      [(_UIPanelAnimationState *)v40 setAffectedSides:a5];
      int64_t v71 = [(UIPanelController *)self style];
      [(_UIPanelAnimationState *)v40 setShouldAssignOffscreenWidthsToStateRequest:v71 != 0];
      [(_UIPanelAnimationState *)v40 setAnimatorShouldCoordinate:[(UIPanelController *)self animationRequestShouldCoordinate]];
      [(UIPanelController *)self setAnimationRequestShouldCoordinate:0];
      double v41 = [(UIPanelController *)self _internalState];
      [v41 setAnimationState:v40];

      id v72 = (void *)v36;
      if (![(UIPanelController *)self _animateCustomTransitionIfNeededWithAnimationState:v40 possiblePublicStates:v36 newPublicState:v37 estimatedDuration:v16 == 0 needsInitialLayout:*(double *)&v39])
      {
        double v70 = [(UIPanelController *)self navigationBarForContentLayoutGuideAnimation];
        objc_initWeak(location, self);
        objc_initWeak(&from, v40);
        double v42 = [_UIPanelCoordinatingAnimator alloc];
        double v43 = +[_UIPanelAnimationState timingCurveProviderWithVelocity:a7];
        double v44 = [(UIViewPropertyAnimator *)v42 initWithDuration:v43 timingParameters:*(double *)&v39];
        [(_UIPanelAnimationState *)v40 setAnimator:v44];

        double v45 = [(_UIPanelAnimationState *)v40 animator];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke;
        v92[3] = &unk_1E52E98C0;
        objc_copyWeak(&v95, location);
        objc_copyWeak(v96, &from);
        BOOL v97 = v71 != 0;
        id v46 = v14;
        id v93 = v46;
        id v47 = v37;
        id v94 = v47;
        v96[1] = v39;
        [v45 addAnimations:v92];
        id v69 = v47;

        double v48 = [(_UIPanelAnimationState *)v40 animator];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_3;
        v88[3] = &unk_1E52E98E8;
        objc_copyWeak(&v91, location);
        id v89 = v46;
        id v49 = v70;
        id v90 = v49;
        [v48 addCompletion:v88];

        double v50 = [(UIPanelController *)self configuration];
        double v51 = v49;
        objc_msgSend(v49, "_setShouldFadeStaticNavBarButton:", objc_msgSend(v50, "shouldFadeStaticNavBarButton"));

        if (v16)
        {
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_5;
          v82[3] = &unk_1E52D9F70;
          v82[4] = self;
          +[UIView performWithoutAnimation:v82];
        }
        else
        {
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_4;
          v83[3] = &unk_1E52DC3F8;
          BOOL v87 = v71 != 0;
          double v84 = v40;
          uint64_t v85 = self;
          id v86 = v49;
          +[UIView performWithoutAnimation:v83];
        }
        double v52 = [(UIPanelController *)self _contentView];
        double v53 = [(_UIPanelAnimationState *)v40 animator];
        [v53 setContainerView:v52];

        if (v71)
        {
          if ([(_UIPanelAnimationState *)v40 animatorShouldCoordinate])
          {
            double v54 = [(UIPanelController *)self delegate];
            char v55 = objc_opt_respondsToSelector();

            if (v55)
            {
              double v80 = 0.0;
              double v81 = 0.0;
              double v78 = 0.0;
              double v79 = 0.0;
              double v76 = 0.0;
              double v77 = 0.0;
              [(UIPanelController *)self _expectedSecondaryColumnSizeAfterAnimatingToState:v69 getLeadingColumnSize:&v80 trailingColumnSize:&v78 supplementaryColumnSize:&v76];
              double v57 = v56;
              double v59 = v58;
              double v60 = v80;
              double v61 = v81;
              double v62 = v78;
              double v63 = v79;
              double v64 = [(UIPanelController *)self delegate];
              CGFloat v65 = v64;
              if (v62 <= 0.0) {
                double v66 = v61;
              }
              else {
                double v66 = v63;
              }
              if (v62 <= 0.0) {
                double v67 = v60;
              }
              else {
                double v67 = v62;
              }
              objc_msgSend(v64, "panelController:willBeginAnimationToPrimarySize:supplementarySize:secondarySize:", self, v67, v66, v76, v77, v57, v59);
            }
          }
        }
        double v68 = [(_UIPanelAnimationState *)v40 animator];
        [v68 startAnimation];

        objc_destroyWeak(&v91);
        objc_destroyWeak(v96);
        objc_destroyWeak(&v95);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);
      }
    }
  }
LABEL_25:
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke(uint64_t a1)
{
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimuuint64_t m = v14.minimum;
  maximuuint64_t m = v14.maximum;
  float preferred = v14.preferred;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_2;
  v7[3] = &unk_1E52E98C0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  char v13 = *(unsigned char *)(a1 + 72);
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 64);
  *(float *)&double v5 = maximum;
  *(float *)&double v6 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048622, v7, COERCE_DOUBLE(__PAIR64__(HIDWORD(v12), LODWORD(minimum))), v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = v2;
  if (*(unsigned char *)(a1 + 72))
  {
    [v2 setProgress:1.0];
    [v3 setFinishingAnimation:1];
  }
  else
  {
    [v2 setProgress:0.999];
  }
  [WeakRetained _setNeedsLayoutAndPerformImmediately:1];
  id v4 = [WeakRetained delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [WeakRetained delegate];
    [v6 panelController:WeakRetained animateTransitionToStateRequest:*(void *)(a1 + 32) predictedEndState:*(void *)(a1 + 40) predictedDuration:*(double *)(a1 + 64)];
  }
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = [WeakRetained _internalState];
    [v5 setStateRequest:v4];
  }
  double v6 = [WeakRetained _internalState];
  [v6 setAnimationState:0];

  int v7 = [WeakRetained delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [WeakRetained delegate];
    [v9 panelController:WeakRetained didEndAnimatedTransitionToStateRequest:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) _endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange];
  [*(id *)(a1 + 40) _setShouldFadeStaticNavBarButton:0];
  [WeakRetained setNavigationBarForContentLayoutGuideAnimation:0];
  [WeakRetained _setNeedsLayoutAndPerformImmediately:0];
}

uint64_t __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_4(uint64_t a1)
{
  double v2 = 0.001;
  if (*(unsigned char *)(a1 + 56)) {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setProgress:v2];
  [*(id *)(a1 + 40) setNavigationBarForContentLayoutGuideAnimation:0];
  [*(id *)(a1 + 40) _setNeedsLayoutAndPerformImmediately:1];
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 setNavigationBarForContentLayoutGuideAnimation:v4];
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) leadingViewController];
  BOOL v3 = [v2 _existingView];
  [v3 layoutIfNeeded];

  uint64_t v4 = [*(id *)(a1 + 32) supplementaryViewController];
  char v5 = [v4 _existingView];
  [v5 layoutIfNeeded];

  double v6 = [*(id *)(a1 + 32) trailingViewController];
  int v7 = [v6 _existingView];
  [v7 layoutIfNeeded];

  id v9 = [*(id *)(a1 + 32) mainViewController];
  char v8 = [v9 _existingView];
  [v8 layoutIfNeeded];
}

- (BOOL)_animateCustomTransitionIfNeededWithAnimationState:(id)a3 possiblePublicStates:(id)a4 newPublicState:(id)a5 estimatedDuration:(double)a6 needsInitialLayout:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = [(UIPanelController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    int v17 = [(UIPanelController *)self delegate];
    int v18 = [v12 toRequest];
    double v19 = [v17 panelController:self willBeginAnimatedTransitionToStateRequest:v18 predictedEndState:v14 predictedDuration:a6];

    if (v19)
    {
      char v20 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v19];

      if (!v20)
      {
        BOOL v69 = v7;
        double v21 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
        [(_UIViewControllerTransitionContext *)v21 _setIsAnimated:+[UIView areAnimationsEnabled]];
        double v22 = [(UIPanelController *)self _contentView];
        [(_UIViewControllerTransitionContext *)v21 _setContainerView:v22];

        [(_UIViewControllerTransitionContext *)v21 _setAnimator:v19];
        [(_UIViewControllerTransitionContext *)v21 _setDuration:a6];
        [(_UIViewControllerOneToOneTransitionContext *)v21 _setFromView:0];
        [(_UIViewControllerOneToOneTransitionContext *)v21 _setFromViewController:0];
        CGFloat v23 = [(UIPanelController *)self _internalState];
        double v24 = [v23 leadingViewController];
        double v25 = [v24 view];
        [(_UIViewControllerOneToOneTransitionContext *)v21 _setToView:v25];

        int v26 = [(UIPanelController *)self _internalState];
        double v27 = [v26 leadingViewController];
        int64_t v71 = v21;
        [(_UIViewControllerOneToOneTransitionContext *)v21 _setToViewController:v27];

        double v28 = [(UIPanelController *)self view];
        double v29 = [v12 fromRequest];
        double v70 = [v12 toRequest];
        double v30 = [(UIPanelController *)self _internalState];
        double v31 = (void *)[v30 copy];

        uint64_t v32 = [v12 affectedSides];
        double v33 = [(UIPanelController *)self possibleStates];
        double v34 = [v31 _stateForInteractiveRequest:v29 withAffectedSides:v32 inPossibleStates:v33];

        [v29 leadingWidth];
        double v36 = v35;
        double v68 = v29;
        [v29 leadingOffscreenWidth];
        if (v36 < v37) {
          double v36 = v37;
        }
        double v67 = v34;
        [v34 leadingDragOffset];
        double v39 = v38;
        [v28 _currentScreenScale];
        UIRoundToScale(v39, v40);
        double v42 = v41;
        id v72 = v28;
        [v28 bounds];
        double Height = CGRectGetHeight(v84);
        double v44 = [(UIPanelController *)self view];
        char v45 = [v44 _shouldReverseLayoutDirection];

        if (v45)
        {
          id v46 = [(UIPanelController *)self view];
          [v46 bounds];
          double v49 = v47 + v48 - (v36 - v42);
        }
        else
        {
          double v49 = -v42;
        }
        double v51 = 0.0;
        -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v71, "_setToStartFrame:", v49, 0.0, v36, Height);
        [v70 leadingWidth];
        double v53 = v52;
        [v70 leadingOffscreenWidth];
        if (v53 < v54) {
          double v53 = v54;
        }
        [v14 leadingDragOffset];
        double v56 = v55;
        [v28 _currentScreenScale];
        UIRoundToScale(v56, v57);
        double v59 = v58;
        [v28 bounds];
        double v60 = CGRectGetHeight(v85);
        if (v45)
        {
          double v61 = [(UIPanelController *)self view];
          [v61 bounds];
        }
        else
        {
          double v51 = -v59;
        }
        -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v71, "_setToEndFrame:", v51, 0.0, v53, v60);
        objc_initWeak(location, self);
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke;
        v77[3] = &unk_1E52E9910;
        objc_copyWeak(&v82, location);
        id v62 = v70;
        id v78 = v62;
        id v79 = v14;
        id v63 = v31;
        id v80 = v63;
        id v81 = v13;
        [(_UIViewControllerTransitionContext *)v71 _setCompletionHandler:v77];
        if (v69)
        {
          double v64 = [(UIPanelController *)self navigationBarForContentLayoutGuideAnimation];
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke_2;
          v73[3] = &unk_1E52DCB30;
          id v74 = v12;
          id v75 = self;
          id v65 = v64;
          id v76 = v65;
          +[UIView performWithoutAnimation:v73];
        }
        [v19 animateTransition:v71];

        objc_destroyWeak(&v82);
        objc_destroyWeak(location);
      }
      BOOL v50 = 1;
    }
    else
    {
      BOOL v50 = 0;
    }
  }
  else
  {
    BOOL v50 = 0;
    double v19 = 0;
  }

  return v50;
}

void __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v22 = WeakRetained;
    if (a3)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = [WeakRetained _internalState];
      [v7 setStateRequest:v6];

      id WeakRetained = v22;
    }
    char v8 = [WeakRetained _internalState];
    [v8 setAnimationState:0];

    id v9 = [v22 delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [v22 delegate];
      [v11 panelController:v22 didEndAnimatedTransitionToStateRequest:*(void *)(a1 + 32)];
    }
    [v22 _setLastComputedPublicState:*(void *)(a1 + 40)];
    [v22 _setPreviousInternalState:*(void *)(a1 + 48)];
    [v22 _setLastPossiblePublicStates:*(void *)(a1 + 56)];
    id v12 = [v22 view];
    [v12 bounds];
    objc_msgSend(v22, "_setLastViewSize:", v13, v14);

    double v15 = [v22 delegate];
    char v16 = objc_opt_respondsToSelector();

    id WeakRetained = v22;
    if (v16)
    {
      int v17 = [v22 delegate];
      uint64_t v18 = *(void *)(a1 + 40);
      double v19 = [v22 view];
      [v19 bounds];
      objc_msgSend(v17, "panelController:didChangeToState:withSize:", v22, v18, v20, v21);

      id WeakRetained = v22;
    }
  }
}

uint64_t __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgress:0.0];
  [*(id *)(a1 + 40) setNavigationBarForContentLayoutGuideAnimation:0];
  [*(id *)(a1 + 40) _setNeedsLayoutAndPerformImmediately:1];
  double v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setNavigationBarForContentLayoutGuideAnimation:v3];
}

- (BOOL)isLeadingViewControllerVisibleAfterAnimation
{
  double v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 animationState];
  uint64_t v4 = [v3 toRequest];
  [v4 leadingWidth];
  BOOL v6 = v5 > 0.0;

  return v6;
}

- (BOOL)isTrailingViewControllerVisibleAfterAnimation
{
  double v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 animationState];
  uint64_t v4 = [v3 toRequest];
  [v4 trailingWidth];
  BOOL v6 = v5 > 0.0;

  return v6;
}

- (BOOL)isSupplementaryViewControllerVisibleAfterAnimation
{
  double v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 animationState];
  uint64_t v4 = [v3 toRequest];
  [v4 supplementaryWidth];
  BOOL v6 = v5 > 0.0;

  return v6;
}

- (void)animateToRequest:(id)a3
{
}

- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4
{
}

- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4 withVelocity:(double)a5
{
  BOOL v6 = a4;
  id v29 = a3;
  char v8 = [(UIPanelController *)self interactiveStateRequest];
  [(UIPanelController *)self setInteractiveStateRequest:0];
  id v9 = v8;
  char v10 = v9;
  if (!v9)
  {
    id v11 = [(UIPanelController *)self currentState];
    char v10 = [v11 stateRequest];
    if ([v29 isEqual:v10])
    {
      id v12 = [(UIPanelController *)self delegate];
      uint64_t v13 = [v12 primaryEdge];

      if (v13)
      {
        [v11 trailingDragOffset];
        double v15 = v14;
        [v11 supplementaryDragOffset];
        double v17 = v15 + v16;
        if (v17 > 0.0)
        {
          [v10 trailingWidth];
LABEL_8:
          double v22 = v17 - v18;
          double v23 = v18 - v17;
          BOOL v24 = v17 < v18;
          double v25 = 0.0;
          if (v24) {
            double v26 = 0.0;
          }
          else {
            double v26 = v22;
          }
          if (v24) {
            double v27 = v23;
          }
          else {
            double v27 = 0.0;
          }
          [v10 supplementaryWidth];
          if (v26 < v28) {
            double v25 = v28 - v26;
          }
          if (v13) {
            [v10 setTrailingWidth:v27];
          }
          else {
            [v10 setLeadingWidth:v27];
          }
          [v10 setSupplementaryWidth:v25];
        }
      }
      else
      {
        [v11 leadingDragOffset];
        double v20 = v19;
        [v11 supplementaryDragOffset];
        double v17 = v20 + v21;
        if (v17 > 0.0)
        {
          [v10 leadingWidth];
          goto LABEL_8;
        }
      }
    }
  }
  [(UIPanelController *)self _animateFromRequest:v10 toRequest:v29 withAffectedSides:0 forceOverlay:v6 velocity:a5];
}

- (UISlidingBarStateRequest)interactiveStateRequest
{
  double v2 = [(UIPanelController *)self _internalState];
  uint64_t v3 = [v2 interactiveStateRequest];

  return (UISlidingBarStateRequest *)v3;
}

- (void)setInteractiveStateRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPanelController *)self _internalState];
  [v5 setInteractiveStateRequest:v4];

  [(UIPanelController *)self _setNeedsLayoutAndPerformImmediately:0];
}

- (NSArray)uncachedPossibleStates
{
  uint64_t v3 = [(UIPanelController *)self view];
  id v4 = [(UIPanelController *)self _internalState];
  [v3 bounds];
  BOOL v7 = objc_msgSend(v4, "computePossibleStatesGivenParentView:withSize:", v3, v5, v6);

  return (NSArray *)v7;
}

- (id)uncachedPossibleStatesForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UIPanelController *)self _internalState];
  BOOL v7 = [(UIPanelController *)self view];
  char v8 = objc_msgSend(v6, "computePossibleStatesGivenParentView:withSize:", v7, width, height);

  return v8;
}

- (void)_observeKeyboardNotificationsOnScreen:(id)a3
{
  id v4 = a3;
  if (v4 && (*((unsigned char *)&self->_panelControllerFlags + 1) & 8) == 0)
  {
    id v6 = v4;
    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__adjustForKeyboardInfo_ name:@"UIKeyboardPrivateWillShowNotification" object:v6];
    [v5 addObserver:self selector:sel__adjustForKeyboardInfo_ name:@"UIKeyboardPrivateWillHideNotification" object:v6];
    [v5 addObserver:self selector:sel__adjustForKeyboardInfo_ name:@"UIKeyboardPrivateDidChangeFrameNotification" object:v6];
    *(_DWORD *)&self->_panelControllerFlags |= 0x800u;

    id v4 = v6;
  }
}

- (void)_adjustForKeyboardInfo:(id)a3
{
  id v4 = a3;
  if (self->_view && ![(UIPanelController *)self isCollapsed])
  {
    if (![(UIPanelController *)self supportsColumnStyle])
    {
      double v5 = [(UIPanelController *)self owningViewController];
      id v6 = -[UIViewController _keyboardSceneDelegate](v5);
      view = self->_view;
      char v8 = [v4 userInfo];
      [v6 verticalOverlapForView:view usingKeyboardInfo:v8];
      double v10 = v9;

      id v11 = [(UIPanelController *)self _internalState];
      [v11 keyboardAdjustment];
      double v13 = v12;

      if (v13 != v10)
      {
        double v14 = [(UIPanelController *)self owningViewController];
        double v15 = findTransitioningChildNavigationController(v14);

        if (v15)
        {
          double v16 = [v15 transitionCoordinator];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __44__UIPanelController__adjustForKeyboardInfo___block_invoke;
          v29[3] = &unk_1E52DA598;
          v29[4] = self;
          [v16 animateAlongsideTransition:0 completion:v29];
        }
        else
        {
          double v17 = [(UIPanelController *)self _internalState];
          [v17 setKeyboardAdjustment:v10];

          double v18 = [(UIPanelController *)self currentState];
          int v19 = [v18 leadingOverlapsMain];

          if (v19) {
            [(UIPanelController *)self _setNeedsDeferredUpdate];
          }
        }
      }
    }
    double v20 = [(UIPanelController *)self currentState];
    char v21 = [v20 leadingOverlapsMain];

    if ((v21 & 1) == 0)
    {
      double v22 = [v4 name];
      if ([v22 isEqualToString:@"UIKeyboardPrivateWillShowNotification"])
      {

LABEL_14:
        double v25 = [v4 userInfo];
        [(UIPanelController *)self _adjustNonOverlayLeadingScrollViewsForKeyboardInfo:v25];

        [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__adjustNonOverlayLeadingScrollViewsForKeyboardInfo_ object:0];
        goto LABEL_15;
      }
      double v23 = [v4 name];
      int v24 = [v23 isEqualToString:@"UIKeyboardPrivateDidChangeFrameNotification"];

      if (v24) {
        goto LABEL_14;
      }
      double v26 = [v4 name];
      int v27 = [v26 isEqualToString:@"UIKeyboardPrivateWillHideNotification"];

      if (v27)
      {
        double v28 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C4B0]];
        [(UIPanelController *)self performSelector:sel__adjustNonOverlayLeadingScrollViewsForKeyboardInfo_ withObject:0 afterDelay:v28 inModes:0.0];
      }
    }
  }
LABEL_15:
}

uint64_t __44__UIPanelController__adjustForKeyboardInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustForKeyboardInfo:0];
}

- (void)_adjustNonOverlayLeadingScrollViewsForKeyboardInfo:(id)a3
{
  id v7 = a3;
  id v4 = [(UIPanelController *)self delegate];
  double v5 = [(UIPanelController *)self leadingViewController];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 panelController:self adjustLeadingViewController:v5 forKeyboardInfo:v7];
  }
  id v6 = [(UIPanelController *)self trailingViewController];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 panelController:self adjustTrailingViewController:v6 forKeyboardInfo:v7];
  }
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)UIPanelController;
  uint64_t v3 = [(UIPanelController *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
    objc_msgSend(v4, "appendFormat:", @" svc=%p state=%p", WeakRetained, self->__internalState);

    if (self->__previousInternalState) {
      objc_msgSend(v4, "appendFormat:", @" prevState=%p", self->__previousInternalState);
    }
    if (self->__lastComputedPublicState) {
      objc_msgSend(v4, "appendFormat:", @" publicState=%p", self->__lastComputedPublicState);
    }
    if ([(NSArray *)self->__lastPossiblePublicStates count]) {
      objc_msgSend(v4, "appendFormat:", @" possibleStates=%p", self->__lastPossiblePublicStates);
    }
    id v7 = _UISplitViewControllerStyleDescription(self->_style);
    [v4 appendFormat:@" style=%@", v7];
  }
  return (NSString *)v4;
}

- (BOOL)animationRequestShouldCoordinate
{
  return self->_animationRequestShouldCoordinate;
}

- (void)setAnimationRequestShouldCoordinate:(BOOL)a3
{
  self->_animationRequestShouldCoordinate = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (BOOL)showShadowViews
{
  return self->_showShadowViews;
}

- (void)setLeadingBarContentClippingView:(id)a3
{
}

- (void)setTrailingBarContentClippingView:(id)a3
{
}

- (void)setSupplementaryBarContentClippingView:(id)a3
{
}

- (void)setNavigationBarForContentLayoutGuideAnimation:(id)a3
{
}

- (void)setFloatingBarButtonItem:(id)a3
{
}

- (void)setView:(id)a3
{
}

- (_UIPanelInternalState)_previousInternalState
{
  return self->__previousInternalState;
}

- (UISlidingBarConfiguration)_suspendedConfiguration
{
  return self->__suspendedConfiguration;
}

- (void)_setSuspendedConfiguration:(id)a3
{
}

- (NSArray)_lastPossiblePublicStates
{
  return self->__lastPossiblePublicStates;
}

- (UIPanelBorderView)_leadingBorderView
{
  return self->__leadingBorderView;
}

- (void)_setLeadingBorderView:(id)a3
{
}

- (UIPanelBorderView)_trailingBorderView
{
  return self->__trailingBorderView;
}

- (void)_setTrailingBorderView:(id)a3
{
}

- (UIPanelBorderView)_supplementaryBorderView
{
  return self->__supplementaryBorderView;
}

- (void)_setSupplementaryBorderView:(id)a3
{
}

- (_UIDuoShadowView)_overlayEdgeShadowView
{
  return self->__overlayEdgeShadowView;
}

- (void)_setOverlayEdgeShadowView:(id)a3
{
}

- (_UIDuoShadowView)_primaryOrSupplementaryShadowView
{
  return self->__primaryOrSupplementaryShadowView;
}

- (void)_setLeadingPanelShadowView:(id)a3
{
}

- (_UIDuoShadowView)_supplementaryParallaxShadowView
{
  return self->__supplementaryParallaxShadowView;
}

- (void)_setSupplementaryParallaxShadowView:(id)a3
{
}

- (_UIMTCaptureView)_captureView
{
  return self->__captureView;
}

- (void)_setMaterialThemesCaptureView:(id)a3
{
}

- (UIDimmingView)_primaryParallaxDimmingView
{
  return self->__primaryParallaxDimmingView;
}

- (void)_setPrimaryParallaxDimmingView:(id)a3
{
}

- (void)_setSourceTransitionView:(id)a3
{
}

- (UIView)_destTransitionView
{
  return self->__destTransitionView;
}

- (void)_setDestinationTransitionView:(id)a3
{
}

@end