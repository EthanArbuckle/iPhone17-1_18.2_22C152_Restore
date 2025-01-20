@interface UISplitViewControllerClassicImpl
+ (double)_defaultGutterWidthInView:(id)a3;
- (BOOL)_canDisplayHostedMaster;
- (BOOL)_defersUpdateDelegateHiddenMasterAspectRatios;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)_effectivePresentsWithGesture;
- (BOOL)_handlesCounterRotationForPresentation;
- (BOOL)_hasMasterViewController;
- (BOOL)_hasPreferredInterfaceOrientationForPresentation;
- (BOOL)_hidesMasterViewInCurrentOrientation;
- (BOOL)_hidesMasterViewInOrientation:(int64_t)a3 medusaState:(int64_t)a4;
- (BOOL)_iPhoneShouldUseOverlayIfRegularWidth;
- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment;
- (BOOL)_isAnimating;
- (BOOL)_isBasicallyHorizontallyCompact;
- (BOOL)_isCollapsed;
- (BOOL)_isExpanding;
- (BOOL)_isHidesMasterInLandscapeInvalid;
- (BOOL)_isHidesMasterInPortraitInvalid;
- (BOOL)_isMasterPopoverVisible;
- (BOOL)_isMasterViewShown;
- (BOOL)_isRotating;
- (BOOL)_isTransitioningFromCollapsedToSeparated;
- (BOOL)_layoutPrimaryOnRight;
- (BOOL)_optsOutOfPopoverControllerHierarchyCheck;
- (BOOL)_shouldPersistViewWhenCoding;
- (BOOL)_shouldPreventAutorotation;
- (BOOL)_shouldShowNSToolbarSidebarToggle;
- (BOOL)_shouldUseRelativeInsets;
- (BOOL)_usesExtraWidePrimaryColumn;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hidesMasterViewInLandscape;
- (BOOL)hidesMasterViewInPortrait;
- (BOOL)inCollapsingToProposedTopColumnCallback;
- (BOOL)inExpandingToProposedDisplayModeCallback;
- (BOOL)isCollapsed;
- (BOOL)lockedForDelegateCallback;
- (BOOL)prefersOverlayInRegularWidthPhone;
- (BOOL)presentsWithGesture;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)usesDeviceOverlayPreferences;
- (CGRect)_detailViewFrame;
- (CGRect)_detailViewFrame:(CGRect)a3;
- (CGRect)_frameForChildContentContainer:(id)a3;
- (CGRect)_masterViewFrame;
- (CGRect)_masterViewFrame:(CGRect)a3;
- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4;
- (CGSize)_preferredContentSize;
- (CGSize)_screenSizeInMainScene:(BOOL)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)viewControllers;
- (NSString)_displayModeButtonItemTitle;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIFocusContainerGuide)_detailFocusContainerGuide;
- (UIFocusContainerGuide)_masterFocusContainerGuide;
- (UISplitViewController)splitViewController;
- (UISplitViewControllerClassicImpl)initWithSplitViewController:(id)a3;
- (UISplitViewControllerDelegate)delegate;
- (UIViewController)_preservedDetailController;
- (double)_contentMarginForChildViewController:(id)a3;
- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3;
- (double)_masterPresentationAnimationDuration;
- (double)_primaryColumnWidthForSize:(CGSize)a3;
- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4;
- (double)_primaryDividerPosition;
- (double)_supplementaryDividerPosition;
- (double)maximumPrimaryColumnWidth;
- (double)minimumPrimaryColumnWidth;
- (double)preferredPrimaryColumnWidthFraction;
- (double)primaryColumnWidth;
- (float)gutterWidth;
- (id)_additionalViewControllersToCheckForUserActivity;
- (id)_allContainedViewControllers;
- (id)_childContainingSender:(id)a3;
- (id)_childViewControllersToSendViewWillTransitionToSize;
- (id)_clearPreventRotationHook;
- (id)_deepestActionResponder;
- (id)_deepestUnambiguousResponder;
- (id)_defaultDisplayModes;
- (id)_effectiveActivityItemsConfiguration;
- (id)_multitaskingDragExclusionRects;
- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3;
- (id)_orderedPreferredFocusedViewControllers;
- (id)_overridingPreferredFocusEnvironment;
- (id)_primaryContentResponder;
- (id)_primaryDimmingView;
- (id)_primaryViewControllerForCollapsing;
- (id)_primaryViewControllerForExpanding;
- (id)_secondaryViewControllerForCollapsing;
- (id)_separateSecondaryViewControllerFromPrimaryViewController:(id)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)detailViewController;
- (id)displayModeButtonItem;
- (id)masterViewController;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (int64_t)_currentInterfaceIdiom;
- (int64_t)_defaultTargetDisplayMode;
- (int64_t)_effectivePrimaryHidingState;
- (int64_t)_effectiveTargetDisplayMode;
- (int64_t)_internalModeForTraitCollection:(id)a3 orientation:(int64_t)a4 viewSize:(CGSize)a5 medusaState:(int64_t)a6;
- (int64_t)_medusaState;
- (int64_t)_medusaStateForOrientation:(int64_t)a3 viewWidth:(double)a4;
- (int64_t)_prepareToTransitionToViewSize:(CGSize)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 duration:(double)a6;
- (int64_t)_primaryHidingState;
- (int64_t)_primaryHidingStateForCurrentOrientation;
- (int64_t)_primaryOffscreenGestureMode;
- (int64_t)displayMode;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredDisplayMode;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (int64_t)primaryBackgroundStyle;
- (int64_t)primaryEdge;
- (int64_t)style;
- (unint64_t)_lastFocusedChildViewControllerIndex;
- (unint64_t)_targetEdgeForPopover;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)__viewWillLayoutSubviews;
- (void)_addOrRemovePopoverPresentationGestureRecognizer;
- (void)_animateTransitionFromTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_animateTransitionToOrientation:(int64_t)a3 duration:(double)a4 masterChange:(int64_t)a5;
- (void)_cacheEffectiveTargetDisplayMode;
- (void)_changeToDisplayMode:(int64_t)a3 forCurrentOrientationOnly:(BOOL)a4;
- (void)_collapseMaster:(id)a3 andDetail:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_collapseMasterAndDetailWithTransitionCoordinator:(id)a3;
- (void)_collapseSecondaryViewController:(id)a3 ontoPrimaryViewController:(id)a4;
- (void)_commonInit;
- (void)_completeTransitionFromOrientation:(int64_t)a3 masterChange:(int64_t)a4;
- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6;
- (void)_didChangeToFirstResponder:(id)a3;
- (void)_didEndSnapshotSession;
- (void)_didTransitionTraitCollection;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_dismissMasterViewController:(BOOL)a3;
- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3;
- (void)_displayModeDidChange;
- (void)_displayModeWillChangeTo:(int64_t)a3;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_initWithCoder:(id)a3;
- (void)_invalidateHidesMasterViewForAspectRatio:(int64_t)a3;
- (void)_layoutContainerViewDidMoveToWindow:(id)a3;
- (void)_layoutContainerViewWillMoveToWindow:(id)a3;
- (void)_loadNewSubviews:(id)a3;
- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5;
- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4;
- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4;
- (void)_prepareForCompactLayout;
- (void)_presentMasterViewController:(BOOL)a3;
- (void)_removeCollapsingSnapshotViews;
- (void)_separateMasterAndDetailWithTransitionCoordinator:(id)a3;
- (void)_setClearPreventRotationHook:(id)a3;
- (void)_setCollapsedState:(int64_t)a3;
- (void)_setDelegateHidesMaster:(BOOL)a3 inAspectRatio:(int64_t)a4;
- (void)_setDetailViewFrame:(CGRect)a3;
- (void)_setDisplayModeButtonItemTitle:(id)a3;
- (void)_setMasterOverrideTraitCollectionActive:(BOOL)a3;
- (void)_setPreservedDetailController:(id)a3;
- (void)_setPrimaryHidingState:(int64_t)a3;
- (void)_setPrimaryHidingStateForCurrentOrientation:(int64_t)a3;
- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3;
- (void)_setupHiddenPopoverControllerWithViewController:(id)a3;
- (void)_setupUnderBarSeparatorView;
- (void)_showMasterViewAnimated:(BOOL)a3;
- (void)_triggerDisplayModeAction:(id)a3;
- (void)_updateChildContentMargins;
- (void)_updateDelegateHiddenMasterAspectRatios;
- (void)_updateDisplayModeButtonItem;
- (void)_updateMasterViewControllerFrame;
- (void)_updateTargetDisplayMode;
- (void)_viewControllerHiding:(id)a3;
- (void)_willBeginSnapshotSession;
- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)popoverWillAppear:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGutterWidth:(float)a3;
- (void)setHidesMasterViewInPortrait:(BOOL)a3;
- (void)setMaximumPrimaryColumnWidth:(double)a3;
- (void)setMinimumPrimaryColumnWidth:(double)a3;
- (void)setPreferredDisplayMode:(int64_t)a3;
- (void)setPreferredPrimaryColumnWidthFraction:(double)a3;
- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3;
- (void)setPresentsWithGesture:(BOOL)a3;
- (void)setPrimaryEdge:(int64_t)a3;
- (void)setUsesDeviceOverlayPreferences:(BOOL)a3;
- (void)setViewControllers:(id)a3;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)snapshotAllViews;
- (void)snapshotForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 masterChange:(int64_t)a5;
- (void)snapshotMasterView;
- (void)toggleMasterVisible:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unloadViewForced:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UISplitViewControllerClassicImpl

- (UISplitViewControllerClassicImpl)initWithSplitViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewControllerClassicImpl;
  v5 = [(UISplitViewControllerClassicImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_svc, v4);
  }

  return v6;
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v6 = [WeakRetained viewControllers];

  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v6 objectAtIndexedSubscript:0];
    if (v8 != 1)
    {
      id v10 = [v6 objectAtIndexedSubscript:1];
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = 0;
LABEL_6:
  if (v9 == v4)
  {
    [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
LABEL_11:
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
    goto LABEL_12;
  }
  if (v10 == v4)
  {
    [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
    goto LABEL_11;
  }
  id v11 = objc_loadWeakRetained((id *)&self->_svc);
  v12 = [v11 view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

LABEL_12:
  double v25 = v14;
  double v26 = v16;
  double v27 = v18;
  double v28 = v20;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_commonInit
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"UISplitViewController is only supported when running under UIUserInterfaceIdiomPad"];
    }
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | 8);
  self->_gutterWidth = -3.4028e38;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  WeakRetained[47] &= ~0x100000uLL;

  self->_presentsWithGesture = 1;
  *(int64x2_t *)&self->_preferredPrimaryColumnWidthFraction = vdupq_n_s64(0xC7EFFFFFE0000000);
  self->_maximumPrimaryColumnWidth = -3.40282347e38;
  self->_primaryEdge = 0;
  int v6 = dyld_program_sdk_at_least();
  uint64_t v7 = 0x8000000000;
  if (!v6) {
    uint64_t v7 = 0;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v7);
  BOOL v8 = +[UISplitViewController _devicePrefersOverlayInRegularWidth];
  uint64_t v9 = 0x10000000000;
  if (!v8) {
    uint64_t v9 = 0;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFEFFFFFFFFFFLL | v9);
  self->_lastFocusedChildViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_initWithCoder:(id)a3
{
  id v11 = a3;
  if ([v11 containsValueForKey:@"UISplitViewControllerPreferredPrimaryColumnWidthFraction"])
  {
    [v11 decodeDoubleForKey:@"UISplitViewControllerPreferredPrimaryColumnWidthFraction"];
    self->_preferredPrimaryColumnWidthFraction = v4;
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerMaximumPrimaryColumnWidth"])
  {
    [v11 decodeDoubleForKey:@"UISplitViewControllerMaximumPrimaryColumnWidth"];
    self->_maximumPrimaryColumnWidth = v5;
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerMinimumPrimaryColumnWidth"])
  {
    [v11 decodeDoubleForKey:@"UISplitViewControllerMinimumPrimaryColumnWidth"];
    self->_minimumPrimaryColumnWidth = v6;
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerPrimaryEdge"]) {
    self->_primaryEdge = [v11 decodeIntegerForKey:@"UISplitViewControllerPrimaryEdge"];
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerPresentsWithGesture"]) {
    self->_presentsWithGesture = [v11 decodeBoolForKey:@"UISplitViewControllerPresentsWithGesture"];
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"])
  {
    int v7 = [v11 decodeBoolForKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"];
    uint64_t v8 = 0x8000000000;
    if (!v7) {
      uint64_t v8 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v8);
  }
  if ([v11 containsValueForKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"])
  {
    int v9 = [v11 decodeBoolForKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"];
    uint64_t v10 = 0x4000000000;
    if (!v9) {
      uint64_t v10 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v10);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UISplitViewControllerPreferredPrimaryColumnWidthFraction");
    id v4 = v5;
  }
  if (self->_maximumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", @"UISplitViewControllerMaximumPrimaryColumnWidth");
    id v4 = v5;
  }
  if (self->_minimumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", @"UISplitViewControllerMinimumPrimaryColumnWidth");
    id v4 = v5;
  }
  [v4 encodeInteger:self->_primaryEdge forKey:@"UISplitViewControllerPrimaryEdge"];
  [v5 encodeBool:self->_presentsWithGesture forKey:@"UISplitViewControllerPresentsWithGesture"];
  [v5 encodeBool:(*(void *)&self->_splitViewControllerFlags >> 39) & 1 forKey:@"UISplitViewControllerUsesDeviceOverlayPreferences"];
  [v5 encodeBool:(*(void *)&self->_splitViewControllerFlags >> 38) & 1 forKey:@"UISplitViewControllerUsesExtraWidePrimaryColumn"];
}

- (void)dealloc
{
  [(UISplitViewControllerClassicImpl *)self _removeCollapsingSnapshotViews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v6 = v5[4];

    if (v6)
    {
      int v7 = (id *)objc_loadWeakRetained((id *)&self->_svc);
      [v7[4] removeGestureRecognizer:self->_popoverPresentationGestureRecognizer];
    }
  }
  popoverPresentationGestureRecognizer = self->_popoverPresentationGestureRecognizer;
  self->_popoverPresentationGestureRecognizer = 0;

  postTransitionResponder = self->_postTransitionResponder;
  self->_postTransitionResponder = 0;

  [(UIView *)self->_rotationSnapshotView removeFromSuperview];
  rotationSnapshotView = self->_rotationSnapshotView;
  self->_rotationSnapshotView = 0;

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self name:@"_UIAlertWillAppearNotification" object:0];

  v12.receiver = self;
  v12.super_class = (Class)UISplitViewControllerClassicImpl;
  [(UISplitViewControllerClassicImpl *)&v12 dealloc];
}

- (UISplitViewController)splitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  return (UISplitViewController *)WeakRetained;
}

- (void)_loadNewSubviews:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v23 = [WeakRetained masterViewController];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = objc_loadWeakRetained((id *)&self->_svc);
  id obj = [v7 mutableChildViewControllers];

  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    double v21 = v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        if (!v4 || (objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v28 + 1) + 8 * v10), v21) & 1) == 0)
        {
          objc_super v12 = objc_msgSend(v11, "view", v21);
          if (v23 == v11)
          {
            id v14 = objc_loadWeakRetained((id *)p_svc);
            BOOL v13 = [v14 displayMode] == 2;
          }
          else
          {
            BOOL v13 = 1;
          }
          [v12 setAutoresizingMask:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 setClipsToBounds:1];
          }
          if (([v11 appearanceTransitionsAreDisabled] & 1) == 0)
          {
            double v15 = objc_loadWeakRetained((id *)p_svc);
            if (v15)
            {
              BOOL v16 = ((v15[94] >> 1) & 3u) - 1 < 2 && v13;

              if (v16) {
                objc_msgSend(v11, "__viewWillAppear:", 0);
              }
            }
          }
          id v17 = objc_loadWeakRetained((id *)p_svc);
          double v18 = [v17 view];
          [v18 insertSubview:v12 atIndex:0];

          objc_initWeak(&location, v11);
          if (([v11 appearanceTransitionsAreDisabled] & 1) == 0)
          {
            double v19 = objc_loadWeakRetained((id *)p_svc);
            if (v19)
            {
              if (((v19[94] >> 1) & 3u) - 1 >= 2) {
                BOOL v13 = 0;
              }

              if (v13)
              {
                v24[0] = MEMORY[0x1E4F143A8];
                v24[1] = 3221225472;
                v25[0] = __53__UISplitViewControllerClassicImpl__loadNewSubviews___block_invoke;
                v25[1] = &unk_1E52DC308;
                objc_copyWeak(&v26, &location);
                [v11 setAfterAppearanceBlock:v24];
                [(id)UIApp _addAfterCACommitBlockForViewController:v11];
                objc_destroyWeak(&v26);
              }
            }
          }
          objc_destroyWeak(&location);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }
}

void __53__UISplitViewControllerClassicImpl__loadNewSubviews___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", 0);
}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)loadView
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained _defaultInitialViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v15 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v6, v8, v10, v12);
  if (dyld_program_sdk_at_least()) {
    +[UIColor _splitViewBorderColor];
  }
  else {
  BOOL v13 = +[UIColor systemGrayColor];
  }
  [(UILayoutContainerView *)v15 setBackgroundColor:v13];

  [(UIView *)v15 setAutoresizingMask:18];
  [(UILayoutContainerView *)v15 setDelegate:self];
  id v14 = objc_loadWeakRetained((id *)p_svc);
  [v14 setView:v15];

  [(UISplitViewControllerClassicImpl *)self _loadNewSubviews:0];
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 3) & 0x40) != 0)
  {
    [(UISplitViewControllerClassicImpl *)self _updateTargetDisplayMode];
    *(void *)&self->_splitViewControllerFlags &= ~0x40000000uLL;
  }
  [(UISplitViewControllerClassicImpl *)self _setUpFocusContainerGuides];
}

- (void)unloadViewForced:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = objc_msgSend(WeakRetained, "mutableChildViewControllers", 0);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) unloadViewIfReloadable];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int64_t)_effectivePrimaryHidingState
{
  int64_t result = [(UISplitViewControllerClassicImpl *)self _primaryHidingStateForCurrentOrientation];
  if (!result)
  {
    return [(UISplitViewControllerClassicImpl *)self _primaryHidingState];
  }
  return result;
}

- (int64_t)_primaryHidingState
{
  return (*(void *)&self->_splitViewControllerFlags >> 22) & 3;
}

- (void)_setPrimaryHidingState:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFF3FFFFFLL | ((unint64_t)(a3 & 3) << 22));
}

- (int64_t)_primaryHidingStateForCurrentOrientation
{
  return (*(void *)&self->_splitViewControllerFlags >> 24) & 3;
}

- (void)_setPrimaryHidingStateForCurrentOrientation:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFCFFFFFFLL | ((unint64_t)(a3 & 3) << 24));
}

- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)prefersOverlayInRegularWidthPhone
{
  return *((unsigned char *)&self->_splitViewControllerFlags + 5) & 1;
}

- (void)setUsesDeviceOverlayPreferences:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)usesDeviceOverlayPreferences
{
  return *((unsigned __int8 *)&self->_splitViewControllerFlags + 4) >> 7;
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  BOOL v3 = [(UISplitViewControllerClassicImpl *)self usesDeviceOverlayPreferences]
    && [(UISplitViewControllerClassicImpl *)self prefersOverlayInRegularWidthPhone]
    || +[UISplitViewController _automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v5 = ([WeakRetained presentsWithGesture] & 1) != 0
    || [(UISplitViewControllerDisplayModeBarButtonItem *)self->_displayModeButtonItem _hasBeenUsed];

  return v3 && v5;
}

- (BOOL)_iPhoneShouldUseOverlayIfRegularWidth
{
  if ([(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact]) {
    return 0;
  }
  return [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
}

- (int64_t)_currentInterfaceIdiom
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained traitCollection];
  int64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != -1) {
    return v4;
  }
  uint64_t v6 = +[UIDevice currentDevice];
  int64_t v7 = [v6 userInterfaceIdiom];

  return v7;
}

- (BOOL)_isMasterViewShown
{
  if (((*(void *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2
    && (int64_t v3 = [(UISplitViewControllerClassicImpl *)self _effectivePrimaryHidingState],
        v3 != 2)
    && (v3
     || ((int64_t v4 = [(UISplitViewControllerClassicImpl *)self _currentInterfaceIdiom], v4 == 1)
      || !v4
      && [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayIfRegularWidth])&& [(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation]))
  {
    BOOL v5 = [(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible];
    if (v5) {
      LOBYTE(v5) = ![(UIPopoverController *)self->_hiddenPopoverController _isDismissing];
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)_primaryDimmingView
{
  return [(UIPopoverController *)self->_hiddenPopoverController _dimmingView];
}

- (void)_invalidateHidesMasterViewForAspectRatio:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFFCLL | ((1 << a3) | *(void *)&self->_splitViewControllerFlags) & 3);
}

- (BOOL)_isHidesMasterInPortraitInvalid
{
  return (*(unsigned char *)&self->_splitViewControllerFlags >> 1) & 1;
}

- (BOOL)_isHidesMasterInLandscapeInvalid
{
  return *(_DWORD *)&self->_splitViewControllerFlags & 1;
}

- (void)_setDelegateHidesMaster:(BOOL)a3 inAspectRatio:(int64_t)a4
{
  if (a3)
  {
    unint64_t v4 = *(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | ((4 << a4) | *(void *)&self->_splitViewControllerFlags) & 0xC;
    int v5 = 1 << a4;
  }
  else
  {
    int v5 = 1 << a4;
    unint64_t v4 = *(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | *(void *)&self->_splitViewControllerFlags & (4 * ~(1 << a4)) & 0xC;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(v4 & 0xFFFFFFFFFFFFFFFCLL | v4 & ~(_BYTE)v5 & 3);
}

- (BOOL)_defersUpdateDelegateHiddenMasterAspectRatios
{
  if ((*(unsigned char *)&self->_splitViewControllerFlags & 0x10) != 0) {
    return 0;
  }
  else {
    return dyld_program_sdk_at_least();
  }
}

- (void)_updateDelegateHiddenMasterAspectRatios
{
  if ((*(unsigned char *)&self->_splitViewControllerFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v15 = [WeakRetained masterViewController];

    if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInPortraitInvalid])
    {
      id v5 = objc_loadWeakRetained(&self->_delegate);
      id v6 = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v7 = 1;
      if (([v5 splitViewController:v6 shouldHideViewController:v15 inOrientation:1] & 1) == 0)
      {
        id v8 = objc_loadWeakRetained(&self->_delegate);
        id v9 = objc_loadWeakRetained((id *)&self->_svc);
        uint64_t v7 = [v8 splitViewController:v9 shouldHideViewController:v15 inOrientation:2];
      }
      [(UISplitViewControllerClassicImpl *)self _setDelegateHidesMaster:v7 inAspectRatio:1];
    }
    if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInLandscapeInvalid])
    {
      id v10 = objc_loadWeakRetained(&self->_delegate);
      id v11 = objc_loadWeakRetained((id *)&self->_svc);
      if ([v10 splitViewController:v11 shouldHideViewController:v15 inOrientation:4])
      {
        uint64_t v12 = 1;
      }
      else
      {
        id v13 = objc_loadWeakRetained(&self->_delegate);
        id v14 = objc_loadWeakRetained((id *)&self->_svc);
        uint64_t v12 = [v13 splitViewController:v14 shouldHideViewController:v15 inOrientation:3];
      }
      [(UISplitViewControllerClassicImpl *)self _setDelegateHidesMaster:v12 inAspectRatio:0];
    }
  }
  else
  {
    if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInPortraitInvalid]) {
      [(UISplitViewControllerClassicImpl *)self _setDelegateHidesMaster:1 inAspectRatio:1];
    }
    if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInLandscapeInvalid])
    {
      if ([(UISplitViewControllerClassicImpl *)self _currentInterfaceIdiom]) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
      }
      [(UISplitViewControllerClassicImpl *)self _setDelegateHidesMaster:v3 inAspectRatio:0];
    }
  }
}

- (void)_addOrRemovePopoverPresentationGestureRecognizer
{
  if ([(UISplitViewControllerClassicImpl *)self _effectivePresentsWithGesture])
  {
    if ([(UISplitViewControllerClassicImpl *)self _hasMasterViewController])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      unint64_t v4 = [WeakRetained masterViewController];
      [(UISplitViewControllerClassicImpl *)self _setupHiddenPopoverControllerWithViewController:v4];
    }
    if (self->_popoverPresentationGestureRecognizer
      || ([(UIPopoverController *)self->_hiddenPopoverController _gestureRecognizerForPresentationFromEdge:[(UISplitViewControllerClassicImpl *)self _targetEdgeForPopover]], id v5 = (UIGestureRecognizer *)objc_claimAutoreleasedReturnValue(), popoverPresentationGestureRecognizer = self->_popoverPresentationGestureRecognizer, self->_popoverPresentationGestureRecognizer = v5, popoverPresentationGestureRecognizer, self->_popoverPresentationGestureRecognizer))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_svc);
      id v8 = [v7 view];
      [v8 addGestureRecognizer:self->_popoverPresentationGestureRecognizer];

      int64_t v9 = [(UISplitViewControllerClassicImpl *)self _effectiveTargetDisplayMode];
      if (v9 == 1)
      {
        id v7 = objc_loadWeakRetained((id *)&self->_svc);
        if ([v7 displayMode] == 3)
        {
          BOOL v10 = 1;
LABEL_20:

          goto LABEL_21;
        }
        if ([(UISplitViewControllerClassicImpl *)self _effectiveTargetDisplayMode] != 3)
        {
          BOOL v10 = 0;
          goto LABEL_20;
        }
      }
      else if ([(UISplitViewControllerClassicImpl *)self _effectiveTargetDisplayMode] != 3)
      {
        BOOL v10 = 0;
LABEL_21:
        hiddenPopoverController = self->_hiddenPopoverController;
        [(UIPopoverController *)hiddenPopoverController _setGesturesEnabled:v10];
        return;
      }
      id v14 = objc_loadWeakRetained((id *)&self->_svc);
      BOOL v10 = [v14 displayMode] == 1;

      if (v9 != 1) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if (self->_popoverPresentationGestureRecognizer)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v12 = [v11 view];
    [v12 removeGestureRecognizer:self->_popoverPresentationGestureRecognizer];

    id v13 = self->_popoverPresentationGestureRecognizer;
    self->_popoverPresentationGestureRecognizer = 0;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  id v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak(&self->_delegate, obj);
    char v6 = objc_opt_respondsToSelector();
    uint64_t v7 = 512;
    if ((v6 & 1) == 0) {
      uint64_t v7 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFDFFLL | v7);
    char v8 = objc_opt_respondsToSelector();
    uint64_t v9 = 1024;
    if ((v8 & 1) == 0) {
      uint64_t v9 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFBFFLL | v9);
    char v10 = objc_opt_respondsToSelector();
    uint64_t v11 = 2048;
    if ((v10 & 1) == 0) {
      uint64_t v11 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v11);
    char v12 = objc_opt_respondsToSelector();
    uint64_t v13 = 16;
    if ((v12 & 1) == 0) {
      uint64_t v13 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFEFLL | v13);
    char v14 = objc_opt_respondsToSelector();
    uint64_t v15 = 0x4000;
    if ((v14 & 1) == 0) {
      uint64_t v15 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFBFFFLL | v15);
    char v16 = objc_opt_respondsToSelector();
    uint64_t v17 = 0x8000;
    if ((v16 & 1) == 0) {
      uint64_t v17 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v17);
    char v18 = objc_opt_respondsToSelector();
    uint64_t v19 = 0x10000;
    if ((v18 & 1) == 0) {
      uint64_t v19 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v19);
    char v20 = objc_opt_respondsToSelector();
    uint64_t v21 = 0x20000;
    if ((v20 & 1) == 0) {
      uint64_t v21 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFDFFFFLL | v21);
    char v22 = objc_opt_respondsToSelector();
    uint64_t v23 = 0x40000;
    if ((v22 & 1) == 0) {
      uint64_t v23 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFBFFFFLL | v23);
    char v24 = objc_opt_respondsToSelector();
    uint64_t v25 = 0x80000;
    if ((v24 & 1) == 0) {
      uint64_t v25 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v25);
    char v26 = objc_opt_respondsToSelector();
    uint64_t v27 = 0x1000000000;
    if ((v26 & 1) == 0) {
      uint64_t v27 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFEFFFFFFFFFLL | v27);
    char v28 = objc_opt_respondsToSelector();
    uint64_t v29 = 0x2000000000;
    if ((v28 & 1) == 0) {
      uint64_t v29 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v29);
    char v30 = objc_opt_respondsToSelector();
    uint64_t v31 = 4096;
    if ((v30 & 1) == 0) {
      uint64_t v31 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFEFFFLL | v31);
    char v32 = objc_opt_respondsToSelector();
    uint64_t v33 = 0x2000;
    if ((v32 & 1) == 0) {
      uint64_t v33 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFDFFFLL | v33);
    char v34 = objc_opt_respondsToSelector();
    uint64_t v35 = 0x4000000;
    if ((v34 & 1) == 0) {
      uint64_t v35 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v35);
    char v36 = objc_opt_respondsToSelector();
    uint64_t v37 = 0x8000000;
    if ((v36 & 1) == 0) {
      uint64_t v37 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v37);
    char v38 = objc_opt_respondsToSelector();
    uint64_t v39 = 0x10000000;
    if ((v38 & 1) == 0) {
      uint64_t v39 = 0;
    }
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v39);
    [(UISplitViewControllerClassicImpl *)self _invalidateHidesMasterViewForAspectRatio:1];
    [(UISplitViewControllerClassicImpl *)self _invalidateHidesMasterViewForAspectRatio:0];
    if (![(UISplitViewControllerClassicImpl *)self _defersUpdateDelegateHiddenMasterAspectRatios])[(UISplitViewControllerClassicImpl *)self _updateDelegateHiddenMasterAspectRatios]; {
    id v40 = objc_loadWeakRetained((id *)&self->_svc);
    }
    int v41 = [v40 _hasAppeared];

    if (v41) {
      [(UISplitViewControllerClassicImpl *)self _addOrRemovePopoverPresentationGestureRecognizer];
    }
    id v42 = objc_loadWeakRetained((id *)&self->_svc);
    int v43 = [v42 isViewLoaded];

    if (v43) {
      [(UISplitViewControllerClassicImpl *)self _updateTargetDisplayMode];
    }
    else {
      *(void *)&self->_splitViewControllerFlags |= 0x40000000uLL;
    }
    id v5 = obj;
  }
}

- (CGRect)_masterViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", a3.size.width, a3.size.height);
  double v9 = v8;
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown]) {
    double v10 = 0.0;
  }
  else {
    double v10 = -v9;
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v11 = CGRectGetHeight(v20);
  if ([(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight])
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v12 = CGRectGetWidth(v21);
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      [(UISplitViewControllerClassicImpl *)self _screenSizeInMainScene:1];
      double v12 = v13;
    }
    BOOL v14 = [(UISplitViewControllerClassicImpl *)self _isMasterViewShown];
    double v15 = 0.0;
    if (v14) {
      double v15 = v9;
    }
    double v10 = v12 - v15;
  }
  double v16 = 0.0;
  double v17 = v10;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_masterViewFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v4 = [WeakRetained view];
  [v4 bounds];
  -[UISplitViewControllerClassicImpl _masterViewFrame:](self, "_masterViewFrame:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_detailViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained displayMode] != 2
    || (uint64_t v10 = (*(void *)&self->_splitViewControllerFlags >> 20) & 3, v10 == 1))
  {
LABEL_7:

    goto LABEL_8;
  }

  if (v10 != 2)
  {
    -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", width, height);
    double v12 = v11;
    double v13 = 0.0;
    if (![(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight])
    {
      id v14 = objc_loadWeakRetained((id *)p_svc);
      [v14 gutterWidth];
      double v13 = x + v12 + v15;
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_svc);
    [WeakRetained gutterWidth];
    double width = width - (v12 + v16);
    double x = v13;
    goto LABEL_7;
  }
LABEL_8:
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_detailViewFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v4 = [WeakRetained view];
  [v4 bounds];
  -[UISplitViewControllerClassicImpl _detailViewFrame:](self, "_detailViewFrame:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_setupHiddenPopoverControllerWithViewController:(id)a3
{
  id v4 = a3;
  if (!self->_hiddenPopoverController)
  {
    double v12 = v4;
    if (!dyld_program_sdk_at_least()
      || (id v5 = objc_loadWeakRetained((id *)&self->_svc),
          unint64_t v6 = [v5 childViewControllersCount],
          v5,
          id v4 = v12,
          v6 >= 2))
    {
      double v7 = [[UIPopoverController alloc] _initWithContentViewController:v12 popoverControllerStyle:1];
      hiddenPopoverController = self->_hiddenPopoverController;
      self->_hiddenPopoverController = v7;

      double v9 = self->_hiddenPopoverController;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      [(UIPopoverController *)v9 _setManagingSplitViewController:WeakRetained];

      [v12 _setPopoverController:0];
      double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:self selector:sel_popoverWillAppear_ name:@"_UIAlertWillAppearNotification" object:self->_hiddenPopoverController];

      [(UIPopoverController *)self->_hiddenPopoverController setPopoverBackgroundViewClass:objc_opt_class()];
      [(UISplitViewControllerClassicImpl *)self _addOrRemovePopoverPresentationGestureRecognizer];
      id v4 = v12;
    }
  }
}

- (void)_viewControllerHiding:(id)a3
{
  id v14 = a3;
  $C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = self->_splitViewControllerFlags;
  if ((*(_WORD *)&splitViewControllerFlags & 0x400) == 0)
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_9;
    }
    $C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = self->_splitViewControllerFlags;
  }
  if ((*(unsigned char *)&splitViewControllerFlags & 0xE0) != 0x80)
  {
    if (!self->_barButtonItem)
    {
      id v5 = [UIBarButtonItem alloc];
      unint64_t v6 = [v14 title];
      double v7 = [(UIBarButtonItem *)v5 initWithTitle:v6 style:1 target:self action:sel_toggleMasterVisible_];
      barButtonItem = self->_barButtonItem;
      self->_barButtonItem = v7;

      double v9 = [v14 title];
      double v10 = (NSString *)[v9 copy];
      buttonTitle = self->_buttonTitle;
      self->_buttonTitle = v10;
    }
    [(UISplitViewControllerClassicImpl *)self _setupHiddenPopoverControllerWithViewController:v14];
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      id v13 = objc_loadWeakRetained((id *)&self->_svc);
      [WeakRetained splitViewController:v13 willHideViewController:v14 withBarButtonItem:self->_barButtonItem forPopoverController:self->_hiddenPopoverController];
    }
  }
LABEL_9:
}

- (double)primaryColumnWidth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = [WeakRetained view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", v6, v8);
  return result;
}

- (CGSize)_screenSizeInMainScene:(BOOL)a3
{
  BOOL v3 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v6 = [WeakRetained _window];

  id v7 = objc_loadWeakRetained((id *)p_svc);
  double v8 = [v7 _screen];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = v6;
LABEL_5:
    [v9 bounds];
    goto LABEL_6;
  }
  double v9 = v8;
  if (!v3) {
    goto LABEL_5;
  }
  [v8 _interfaceOrientedMainSceneBounds];
LABEL_6:
  double v12 = v10;
  double v13 = v11;

  double v14 = v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return (*((unsigned __int8 *)&self->_splitViewControllerFlags + 4) >> 6) & 1;
}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (CGSize)_preferredContentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_preferredContentSize");
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3
{
  double width = a3.width;
  -[UISplitViewControllerClassicImpl _screenSizeInMainScene:](self, "_screenSizeInMainScene:", 0, a3.width, a3.height);
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  unint64_t v10 = [WeakRetained interfaceOrientation] - 3;
  BOOL v11 = v10 < 2;

  BOOL v12 = v7 <= 1112.0;
  if (v7 > 1210.0) {
    BOOL v12 = 1;
  }
  if (v12) {
    BOOL v11 = v7 > 1210.0;
  }
  if (v11) {
    double v13 = 375.0;
  }
  else {
    double v13 = 320.0;
  }
  if (dyld_program_sdk_at_least())
  {
    if (v10 <= 1)
    {
      if (width <= v7 * 0.5)
      {
        id v21 = objc_loadWeakRetained((id *)p_svc);
        uint64_t v22 = [v21 displayMode];

        if (v22 == 2) {
          return 320.0;
        }
        else {
          return 375.0;
        }
      }
      else if (width <= v7 - v13)
      {
        if (v7 <= 1210.0) {
          return 320.0;
        }
        else {
          return 375.0;
        }
      }
      else
      {
        id v14 = objc_loadWeakRetained((id *)p_svc);
        int v15 = [v14 _usesExtraWidePrimaryColumn];

        double v16 = 414.0;
        if (!v11) {
          double v16 = 375.0;
        }
        if (v15) {
          return v16;
        }
      }
    }
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v18 = [v17 preferredDisplayMode];

    if (v18 == 2)
    {
      double v19 = round(width * 0.38);
      if (width > v7 * 0.5)
      {
        id v20 = objc_loadWeakRetained((id *)p_svc);
        if ((unint64_t)([v20 interfaceOrientation] - 1) < 2)
        {

          return v13;
        }

        if (width <= v7 - v13) {
          return v13;
        }
      }
      return v19;
    }
  }
  return v13;
}

- (double)_primaryColumnWidthForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact];
  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", v6, width, height);
  return result;
}

- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4
{
  double width = a3.width;
  if (a4) {
    return width;
  }
  double height = a3.height;
  if (!dyld_program_sdk_at_least()) {
    return 320.0;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained preferredPrimaryColumnWidthFraction];
  double v10 = v9;

  BOOL v11 = +[UIDevice currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !dyld_program_sdk_at_least())
  {
    if ([(UISplitViewControllerClassicImpl *)self _currentInterfaceIdiom]
      || !dyld_program_sdk_at_least()
      || v10 != -3.40282347e38)
    {
      if (height <= 1210.0 && width <= 1210.0) {
        double v14 = 320.0;
      }
      else {
        double v14 = 375.0;
      }
      if (v10 == -3.40282347e38)
      {
        double v17 = 0.4;
      }
      else
      {
        id v27 = objc_loadWeakRetained((id *)&self->_svc);
        [v27 preferredPrimaryColumnWidthFraction];
        double v17 = v28;
      }
      double v15 = ceil(width * v17);
      goto LABEL_29;
    }
    id v18 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v19 = [v18 displayMode];

    if (v19 == 2) {
      double v14 = 320.0;
    }
    else {
      double v14 = 375.0;
    }
    goto LABEL_23;
  }
  -[UISplitViewControllerClassicImpl _defaultMaximumPrimaryColumnWidthForSize:](self, "_defaultMaximumPrimaryColumnWidthForSize:", width, height);
  double v14 = v13;
  if (v10 == -3.40282347e38)
  {
    double v15 = v13;
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_29;
    }
LABEL_23:
    id v20 = objc_loadWeakRetained((id *)&self->_svc);
    id v21 = [v20 viewIfLoaded];
    [v21 safeAreaInsets];
    double v23 = v22;
    double v25 = v24;

    if ([(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight]) {
      double v26 = v25;
    }
    else {
      double v26 = v23;
    }
    double v15 = v14 + v26;
    double v14 = v14 + v26;
    goto LABEL_29;
  }
  id v38 = objc_loadWeakRetained((id *)&self->_svc);
  [v38 preferredPrimaryColumnWidthFraction];
  double v15 = ceil(width * v39);

LABEL_29:
  id v29 = objc_loadWeakRetained((id *)p_svc);
  [v29 minimumPrimaryColumnWidth];
  if (v30 == -3.40282347e38)
  {
    double width = 0.0;
  }
  else
  {
    id v31 = objc_loadWeakRetained((id *)p_svc);
    [v31 minimumPrimaryColumnWidth];
    double width = v32;
  }
  if (width < v15) {
    double width = v15;
  }
  id v33 = objc_loadWeakRetained((id *)p_svc);
  [v33 maximumPrimaryColumnWidth];
  if (v34 != -3.40282347e38)
  {
    id v35 = objc_loadWeakRetained((id *)p_svc);
    [v35 maximumPrimaryColumnWidth];
    double v14 = v36;
  }
  if (v14 < width) {
    return v14;
  }
  return width;
}

- (BOOL)_isExpanding
{
  return (~*(_DWORD *)&self->_splitViewControllerFlags & 0x300000) == 0;
}

- (BOOL)isCollapsed
{
  return (*(void *)&self->_splitViewControllerFlags & 0x300000) == 0x200000;
}

- (BOOL)_isCollapsed
{
  return ((*(void *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 < 2;
}

- (void)_setCollapsedState:(int64_t)a3
{
  char v3 = a3;
  double v4 = self;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v7 = [WeakRetained isCollapsed];

  v4->_$C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&v4->_splitViewControllerFlags & 0xFFFFFFFFFFCFFFFFLL | ((unint64_t)(v3 & 3) << 20));
  id v8 = objc_loadWeakRetained((id *)p_svc);
  LODWORD(v4) = [v8 isCollapsed];

  if (v7 != v4)
  {
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v9 = objc_loadWeakRetained((id *)p_svc);
    [v10 postNotificationName:@"UIViewControllerShowDetailTargetDidChangeNotification" object:v9];
  }
}

- (id)_primaryViewControllerForCollapsing
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 2) & 4) == 0
    || (id v3 = objc_loadWeakRetained(&self->_delegate),
        id v4 = objc_loadWeakRetained((id *)&self->_svc),
        [v3 primaryViewControllerForCollapsingSplitViewController:v4],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v5 = [WeakRetained masterViewController];
  }
  return v5;
}

- (id)_primaryViewControllerForExpanding
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 2) & 8) == 0
    || (id v3 = objc_loadWeakRetained(&self->_delegate),
        id v4 = objc_loadWeakRetained((id *)&self->_svc),
        [v3 primaryViewControllerForExpandingSplitViewController:v4],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v5 = [WeakRetained masterViewController];
  }
  return v5;
}

- (id)_secondaryViewControllerForCollapsing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v3 = [WeakRetained detailViewController];

  return v3;
}

- (void)_collapseSecondaryViewController:(id)a3 ontoPrimaryViewController:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  [v6 _setAllowNestedNavigationControllers:1];
  if ((unint64_t)(self->_suspendedState - 3) > 1)
  {
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 2) & 1) == 0) {
      goto LABEL_13;
    }
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    id v15 = objc_loadWeakRetained((id *)&self->_svc);
    char v16 = [WeakRetained splitViewController:v15 collapseSecondaryViewController:v23 ontoPrimaryViewController:v6];

    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    id v7 = objc_loadWeakRetained(&self->_delegate);
    if (!v7 || ($C946B5D877B827A51B09546B3F197234 v8 = self->_splitViewControllerFlags, v7, (*(void *)&v8 & 0x2000000000) == 0))
    {
      id v9 = objc_loadWeakRetained(&self->_delegate);
      if (v9)
      {
        $C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = self->_splitViewControllerFlags;

        if ((*(_DWORD *)&splitViewControllerFlags & 0x10000) != 0)
        {
          id v11 = objc_loadWeakRetained(&self->_delegate);
          id v12 = objc_loadWeakRetained((id *)&self->_svc);
          char v13 = [v11 splitViewController:v12 collapseSecondaryViewController:v23 ontoPrimaryViewController:v6];

          if (v13) {
            goto LABEL_16;
          }
        }
      }
      if (self->_suspendedState == 3) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    uint64_t v17 = self->_suspendedState == 3;
    id v18 = objc_loadWeakRetained(&self->_delegate);
    id v19 = objc_loadWeakRetained((id *)&self->_svc);
    LOBYTE(v17) = [v18 _splitViewController:v19 collapseSecondaryViewController:v23 ontoPrimaryViewController:v6 forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible:v17];

    if ((v17 & 1) == 0)
    {
LABEL_13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v23 childViewControllers],
            id v20 = objc_claimAutoreleasedReturnValue(),
            uint64_t v21 = [v20 count],
            v20,
            !v21))
      {
        NSLog(&cfstr_SWhenCollapsin.isa, "-[UISplitViewControllerClassicImpl _collapseSecondaryViewController:ontoPrimaryViewController:]", self, v6, v23);
      }
      else
      {
        id v22 = objc_loadWeakRetained((id *)&self->_svc);
        [v6 collapseSecondaryViewController:v23 forSplitViewController:v22];
      }
    }
  }
LABEL_16:
}

- (id)_separateSecondaryViewControllerFromPrimaryViewController:(id)a3
{
  id v4 = a3;
  if (qword_1EB260080 != -1) {
    dispatch_once(&qword_1EB260080, &__block_literal_global_141);
  }
  if (_MergedGlobals_1010)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v6 = [WeakRetained _existingView];
    id v7 = [v6 window];
    $C946B5D877B827A51B09546B3F197234 v8 = [v7 rootViewController];
    id v9 = [v8 _printHierarchy];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_loadWeakRetained(&self->_delegate);
  id v11 = v10;
  int v12 = 0;
  int v13 = 0;
  if (self->_suspendedState == 2 && v10)
  {
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 0x10) != 0)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_svc);
      int v12 = [v11 _splitViewControllerIsPrimaryVisible:v14];

      int v13 = 1;
    }
    else
    {
      int v12 = 0;
      int v13 = 0;
    }
  }
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 2) & 2) == 0)
  {
    id v15 = 0;
LABEL_15:
    id v19 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v18 = [v4 separateSecondaryViewControllerForSplitViewController:v19];

    goto LABEL_16;
  }
  id v16 = objc_loadWeakRetained((id *)&self->_svc);
  id v15 = [v11 splitViewController:v16 separateSecondaryViewControllerFromPrimaryViewController:v4];

  if (!v15) {
    goto LABEL_15;
  }
  id v17 = [v15 parentViewController];

  uint64_t v18 = (uint64_t)v15;
  if (v17 == v4) {
    goto LABEL_15;
  }
LABEL_16:
  if (self->_suspendedState == 2)
  {
    BOOL v20 = v18 == 0;
    if (v13) {
      BOOL v20 = v12;
    }
    BOOL v21 = !v20;
    int64_t v22 = 3;
    if (v21) {
      int64_t v22 = 4;
    }
    self->_suspendedState = v22;
  }
  id v23 = (void *)v18;
  if (!v18)
  {
    id v23 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
  }
  if (_MergedGlobals_1010)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2;
    aBlock[3] = &unk_1E52E9A70;
    aBlock[4] = self;
    BOOL v28 = v18 == 0;
    id v27 = v9;
    double v24 = (void (**)(void *, id, __CFString *))_Block_copy(aBlock);
    v24[2](v24, v4, @"primary");
    v24[2](v24, v23, @"secondary");
  }
  return v23;
}

void __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_1010 = [@"com.apple.MobileSMS" isEqualToString:v0];
  }
  else
  {
    _MergedGlobals_1010 = 0;
  }
}

void __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 parentViewController];

    if (!v7)
    {
      $C946B5D877B827A51B09546B3F197234 v8 = [v5 _existingView];
      id v9 = [v8 window];

      if (v9)
      {
        id v10 = [v8 superview];
        id v11 = [v10 _viewControllerForAncestor];

        if (v11)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

          if (WeakRetained != v11)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v13 = *(unsigned __int8 *)(a1 + 48);
              *(_DWORD *)buf = 138413314;
              id v65 = v6;
              __int16 v66 = 2112;
              id v67 = v5;
              __int16 v68 = 2112;
              v69 = v8;
              __int16 v70 = 2112;
              id v71 = v11;
              __int16 v72 = 1024;
              int v73 = v13;
              _os_log_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Separation error: '%@' %@ has view %@ in the wrong VC: %@. Fell back:%d", buf, 0x30u);
            }
            v45 = v11;
            v46 = v8;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            uint64_t v47 = a1;
            id v14 = [*(id *)(a1 + 40) componentsSeparatedByString:@"\n"];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v63 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              id v17 = MEMORY[0x1E4F14500];
              uint64_t v18 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v58 != v18) {
                    objc_enumerationMutation(v14);
                  }
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    BOOL v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                    *(_DWORD *)buf = 138412290;
                    id v65 = v20;
                    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_INFO, "VCs before: %@", buf, 0xCu);
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v63 count:16];
              }
              while (v16);
            }

            id v21 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 8));
            int64_t v22 = [v21 _existingView];
            id v23 = [v22 window];
            double v24 = [v23 rootViewController];
            double v25 = [v24 _printHierarchy];

            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            v44 = v25;
            double v26 = [v25 componentsSeparatedByString:@"\n"];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              id v29 = MEMORY[0x1E4F14500];
              uint64_t v30 = *(void *)v54;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v54 != v30) {
                    objc_enumerationMutation(v26);
                  }
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    double v32 = *(void **)(*((void *)&v53 + 1) + 8 * j);
                    *(_DWORD *)buf = 138412290;
                    id v65 = v32;
                    _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_INFO, "VCs after: %@", buf, 0xCu);
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v62 count:16];
              }
              while (v28);
            }

            id v33 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 8));
            double v34 = [v33 _existingView];
            id v35 = [v34 window];
            double v36 = [v35 recursiveDescription];

            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v48 = v36;
            uint64_t v37 = [v36 componentsSeparatedByString:@"\n"];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v49 objects:v61 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              id v40 = MEMORY[0x1E4F14500];
              uint64_t v41 = *(void *)v50;
              do
              {
                for (uint64_t k = 0; k != v39; ++k)
                {
                  if (*(void *)v50 != v41) {
                    objc_enumerationMutation(v37);
                  }
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  {
                    int v43 = *(void **)(*((void *)&v49 + 1) + 8 * k);
                    *(_DWORD *)buf = 138412290;
                    id v65 = v43;
                    _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_INFO, "Views after: %@", buf, 0xCu);
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v49 objects:v61 count:16];
              }
              while (v39);
            }

            id v11 = v45;
            $C946B5D877B827A51B09546B3F197234 v8 = v46;
          }
        }
      }
    }
  }
}

- (BOOL)_canDisplayHostedMaster
{
  if (dyld_program_sdk_at_least()) {
    return 1;
  }
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 4) == 0) {
    return 0;
  }
  return [(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation];
}

- (BOOL)_isBasicallyHorizontallyCompact
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained _horizontalSizeClass] == 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = +[UIDevice currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 4;
  }
  return v3;
}

- (BOOL)inCollapsingToProposedTopColumnCallback
{
  return 0;
}

- (BOOL)inExpandingToProposedDisplayModeCallback
{
  return 0;
}

- (NSArray)viewControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained childViewControllers];

  return (NSArray *)v3;
}

- (void)setViewControllers:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  __int16 v66 = self;
  if ((unint64_t)[v69 count] >= 2
    && [(UISplitViewControllerClassicImpl *)self _isCollapsed])
  {
    if (os_variant_has_internal_diagnostics())
    {
      v64 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v88 = v69;
        _os_log_fault_impl(&dword_1853B0000, v64, OS_LOG_TYPE_FAULT, "Too many view controllers assigned to collapsed split view controller: %@", buf, 0xCu);
      }
    }
    else
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setViewControllers____s_category) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v88 = v69;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Too many view controllers assigned to collapsed split view controller: %@", buf, 0xCu);
      }
    }
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  id v7 = [WeakRetained _existingView];
  $C946B5D877B827A51B09546B3F197234 v8 = [v7 window];
  BOOL v65 = v8
     && !v66->_useChangingBoundsLayout
     && [(UISplitViewControllerClassicImpl *)v66 _isBasicallyHorizontallyCompact];

  [(UISplitViewControllerClassicImpl *)v66 _setMasterOverrideTraitCollectionActive:0];
  id v9 = objc_loadWeakRetained((id *)p_svc);
  id v67 = [v9 mutableChildViewControllers];

  id v10 = objc_loadWeakRetained((id *)p_svc);
  id v11 = [v10 childViewControllers];

  if (v67 == v69)
  {
    [(UISplitViewControllerClassicImpl *)v66 _setMasterOverrideTraitCollectionActive:1];
  }
  else
  {
    __int16 v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v11];
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v69];
    [v12 intersectSet:v68];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v81 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v18 = [v11 indexOfObject:v17];
          if (v18 == [v69 indexOfObject:v17]) {
            [v68 removeObject:v17];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }
      while (v14);
    }

    [v13 minusSet:v68];
    [v67 removeAllObjects];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v77 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          if (([v13 containsObject:v23] & 1) == 0)
          {
            [v23 willMoveToParentViewController:0];
            [v23 removeFromParentViewController];
            id v24 = objc_loadWeakRetained((id *)p_svc);
            int v25 = [v24 isViewLoaded];

            if (v25)
            {
              if (([v23 appearanceTransitionsAreDisabled] & 1) == 0)
              {
                double v26 = objc_loadWeakRetained((id *)p_svc);
                if (v26)
                {
                  BOOL v27 = ((v26[94] >> 1) & 3u) - 1 < 2;

                  if (v27) {
                    -[UIViewController __viewWillDisappear:]((uint64_t)v23, 0);
                  }
                }
              }
              uint64_t v28 = [v23 view];
              [v28 removeFromSuperview];

              if (([v23 appearanceTransitionsAreDisabled] & 1) == 0
                && (id v29 = objc_loadWeakRetained((id *)p_svc)) != 0
                && (BOOL v30 = ((v29[94] >> 1) & 3u) - 1 < 2, v29, v30))
              {
                objc_initWeak((id *)buf, v23);
                v74[0] = MEMORY[0x1E4F143A8];
                v74[1] = 3221225472;
                v74[2] = __55__UISplitViewControllerClassicImpl_setViewControllers___block_invoke;
                v74[3] = &unk_1E52DC308;
                objc_copyWeak(&v75, (id *)buf);
                [v23 setAfterAppearanceBlock:v74];
                [(id)UIApp _addAfterCACommitBlockForViewController:v23];
                objc_destroyWeak(&v75);
                objc_destroyWeak((id *)buf);
              }
              else if (([v23 appearanceTransitionsAreDisabled] & 1) == 0)
              {
                v23[47] &= 0xFFFFFFFFFFFFFFF9;
              }
              id v31 = [v23 view];
              [v31 _setSpeedBumpEdges:0];
            }
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v20);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v32 = v69;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:v84 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v71 != v34) {
            objc_enumerationMutation(v32);
          }
          double v36 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          if ([v13 containsObject:v36])
          {
            [v67 addObject:v36];
          }
          else
          {
            id v37 = objc_loadWeakRetained((id *)p_svc);
            [v37 addChildViewController:v36];

            [v36 setDefinesPresentationContext:1];
            [v36 setNeedsDidMoveCleanup:1];
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v70 objects:v84 count:16];
      }
      while (v33);
    }

    id v38 = objc_loadWeakRetained((id *)p_svc);
    int v39 = [v38 isViewLoaded];

    if (v39)
    {
      if ([v32 count] == 1)
      {
        id v40 = [v32 objectAtIndexedSubscript:0];
        if (!v40 || (BOOL v41 = ((v40[94] >> 1) & 3u) - 1 < 2, v40, !v41))
        {
          id v42 = [v32 objectAtIndexedSubscript:0];
          [v13 removeObject:v42];
        }
      }
      [(UISplitViewControllerClassicImpl *)v66 _loadNewSubviews:v13];
      id v43 = objc_loadWeakRetained((id *)p_svc);
      v44 = [v43 view];
      [v44 setNeedsLayout];
    }
    uint64_t v45 = [v32 count];
    v46 = v66;
    if (v45)
    {
      barButtonItem = v66->_barButtonItem;
      if (barButtonItem)
      {
        v48 = [(UIBarButtonItem *)barButtonItem title];
        int v49 = [v48 isEqualToString:v66->_buttonTitle];

        v46 = v66;
        if (v49)
        {
          id v50 = objc_loadWeakRetained((id *)p_svc);
          long long v51 = [v50 masterViewController];
          long long v52 = [v51 title];
          [(UIBarButtonItem *)v66->_barButtonItem setTitle:v52];

          long long v53 = [(UIBarButtonItem *)v66->_barButtonItem title];
          uint64_t v54 = [v53 copy];
          buttonTitle = v66->_buttonTitle;
          v66->_buttonTitle = (NSString *)v54;

          v46 = v66;
        }
      }
    }
    [(UISplitViewControllerClassicImpl *)v46 _updateDisplayModeButtonItem];
    if (![(UISplitViewControllerClassicImpl *)v66 _defersUpdateDelegateHiddenMasterAspectRatios])[(UISplitViewControllerClassicImpl *)v66 _updateDelegateHiddenMasterAspectRatios]; {
    if ([v32 count])
    }
    {
      id v56 = objc_loadWeakRetained((id *)p_svc);
      long long v57 = [v56 masterViewController];
      long long v58 = [v57 view];
      [v58 _setSpeedBumpEdges:8];
    }
    id v59 = objc_loadWeakRetained((id *)p_svc);
    [v59 _didChangeDeepestActionResponder];

    [(UISplitViewControllerClassicImpl *)v66 _setMasterOverrideTraitCollectionActive:1];
    if (v65)
    {
      [(UISplitViewControllerClassicImpl *)v66 _prepareForCompactLayout];
      goto LABEL_70;
    }
  }
  id v60 = objc_loadWeakRetained((id *)p_svc);
  v61 = [v60 _existingView];
  v62 = [v61 window];
  BOOL v63 = v62 == 0;

  if (v63) {
    [(UISplitViewControllerClassicImpl *)v66 _setCollapsedState:0];
  }
LABEL_70:
}

void __55__UISplitViewControllerClassicImpl_setViewControllers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, 0);
}

- (void)_setMasterOverrideTraitCollectionActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _hasMasterViewController])
  {
    if (v3)
    {
      uint64_t v5 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v8 = (id)v5;
    id v6 = objc_loadWeakRetained((id *)&self->_svc);
    id v7 = [v6 masterViewController];
    [v6 setOverrideTraitCollection:v8 forChildViewController:v7];
  }
}

- (id)_childContainingSender:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v5 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
      int v8 = [v4 _isMemberOfViewControllerHierarchy:v7];

      if (v8)
      {
        id v9 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
        goto LABEL_12;
      }
    }
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)p_svc);
    int v12 = [WeakRetained masterViewController];
    int v13 = [v4 _isMemberOfViewControllerHierarchy:v12];

    id v14 = objc_loadWeakRetained((id *)p_svc);
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = [v14 masterViewController];
LABEL_10:
      id v9 = (void *)v16;

      goto LABEL_12;
    }
    uint64_t v17 = [v14 detailViewController];
    int v18 = [v4 _isMemberOfViewControllerHierarchy:v17];

    if (v18)
    {
      id v15 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v16 = [v15 detailViewController];
      goto LABEL_10;
    }
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (id)_primaryContentResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained detailViewController];

  return v3;
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UISplitViewControllerClassicImpl *)self _childContainingSender:v7];
  id v9 = (void *)v8;
  if (v6)
  {
    if ((id)v8 != v6)
    {
      if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 0x40) == 0
        || (id v10 = objc_loadWeakRetained(&self->_delegate),
            id v11 = objc_loadWeakRetained((id *)&self->_svc),
            char v12 = [v10 splitViewController:v11 showViewController:v6 sender:v7],
            v11,
            v10,
            (v12 & 1) == 0))
      {
        p_svc = &self->_svc;
        id WeakRetained = objc_loadWeakRetained((id *)p_svc);
        uint64_t v15 = [WeakRetained _horizontalSizeClass];

        id v16 = objc_loadWeakRetained((id *)p_svc);
        uint64_t v17 = v16;
        if (v15 == 2)
        {
          int v18 = [v16 masterViewController];

          id v19 = objc_loadWeakRetained((id *)p_svc);
          if (v18 == v9)
          {
            v27[0] = v6;
            id v20 = v19;
            uint64_t v21 = [v20 viewControllers];
            int64_t v22 = [v21 objectAtIndex:1];
            v27[1] = v22;
            id v23 = (void *)MEMORY[0x1E4F1C978];
            id v24 = v27;
          }
          else
          {
            id v20 = v19;
            uint64_t v21 = [v20 viewControllers];
            int64_t v22 = [v21 objectAtIndex:0];
            v26[0] = v22;
            v26[1] = v6;
            id v23 = (void *)MEMORY[0x1E4F1C978];
            id v24 = v26;
          }
          int v25 = [v23 arrayWithObjects:v24 count:2];
          [v20 setViewControllers:v25];
        }
        else
        {
          objc_msgSend(v16, "presentViewController:animated:completion:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
        }
      }
    }
  }
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v10 = [WeakRetained detailViewController];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
  }
  id v13 = v12;

  id v14 = [v13 _existingView];
  uint64_t v15 = [v14 window];
  if (!v15)
  {

LABEL_8:
    id v14 = objc_loadWeakRetained((id *)&self->_svc);
    id v17 = [v14 masterViewController];
    id v16 = v13;
    goto LABEL_9;
  }
  id v16 = (void *)v15;
  if (v13 == v6)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_svc);
    int v25 = [v24 traitCollection];
    uint64_t v26 = [v25 userInterfaceIdiom];

    id v17 = v6;
    if (v26) {
      goto LABEL_23;
    }
    goto LABEL_8;
  }
  id v17 = v13;
LABEL_9:

  if (v6)
  {
    if (v17 != v6)
    {
      BOOL v18 = [(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact];
      if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 0x80) == 0
        || (id v19 = objc_loadWeakRetained(&self->_delegate),
            id v20 = objc_loadWeakRetained((id *)p_svc),
            char v21 = [v19 splitViewController:v20 showDetailViewController:v6 sender:v7],
            v20,
            v19,
            (v21 & 1) == 0))
      {
        id v22 = objc_loadWeakRetained((id *)p_svc);
        id v23 = v22;
        if (v18)
        {
          [v22 _willShowCollapsedDetailViewController:v6 inTargetController:v17];

          if ([(id)objc_opt_class() doesOverrideViewControllerMethod:sel_showViewController_sender_])
          {
            [v17 showViewController:v6 sender:v7];
          }
          else
          {
            id v32 = objc_loadWeakRetained((id *)p_svc);
            objc_msgSend(v32, "presentViewController:animated:completion:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
          }
        }
        else
        {
          BOOL v27 = [v22 masterViewController];

          id v28 = objc_loadWeakRetained((id *)p_svc);
          if (v27)
          {
            id v35 = v27;
            id v36 = v6;
            id v29 = (void *)MEMORY[0x1E4F1C978];
            BOOL v30 = &v35;
            uint64_t v31 = 2;
          }
          else
          {
            id v34 = v6;
            id v29 = (void *)MEMORY[0x1E4F1C978];
            BOOL v30 = &v34;
            uint64_t v31 = 1;
          }
          uint64_t v33 = objc_msgSend(v29, "arrayWithObjects:count:", v30, v31, v34, v35, v36, v37);
          [v28 setViewControllers:v33];
        }
      }
    }
  }
LABEL_23:
}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(UISplitViewControllerClassicImpl *)self _setPreservedDetailController:v6];
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0
    && [(id)objc_opt_class() doesOverrideViewControllerMethod:sel_showViewController_sender_])
  {
    [v7 _setAllowNestedNavigationControllers:1];
  }
}

- (void)_prepareForCompactLayout
{
  self->_useChangingBoundsLayout = 1;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v5 = [WeakRetained masterViewController];

  id v6 = objc_loadWeakRetained((id *)p_svc);
  id v7 = [v6 detailViewController];

  uint64_t v8 = [(UISplitViewControllerClassicImpl *)self _primaryViewControllerForCollapsing];
  id v9 = [(UISplitViewControllerClassicImpl *)self _secondaryViewControllerForCollapsing];
  if (v9)
  {
    [(UISplitViewControllerClassicImpl *)self _setPreservedDetailController:v9];
    id v10 = objc_loadWeakRetained((id *)p_svc);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke;
    v18[3] = &unk_1E52DCB30;
    v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    +[UIViewController _withDisabledAppearanceTransitionsForVisibleDescendantsOf:v10 perform:v18];

    if (dyld_program_sdk_at_least())
    {
      if (v5)
      {
        id v11 = [v5 _existingView];
        id v12 = [v11 window];
        if (v12)
        {
        }
        else
        {
          unsigned int v14 = ((v5[94] >> 1) & 3) - 1;

          if (v14 <= 1)
          {
            -[UIViewController __viewWillDisappear:]((uint64_t)v5, 0);
            -[UIViewController __viewDidDisappear:]((uint64_t)v5, 0);
          }
        }
      }
      if (v7)
      {
        uint64_t v15 = [v7 _existingView];
        id v16 = [v15 window];
        if (v16)
        {
        }
        else
        {
          unsigned int v17 = ((v7[94] >> 1) & 3) - 1;

          if (v17 <= 1)
          {
            -[UIViewController __viewWillDisappear:]((uint64_t)v7, 0);
            -[UIViewController __viewDidDisappear:]((uint64_t)v7, 0);
          }
        }
      }
    }
  }
  else
  {
    id v13 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];

    if (!v13) {
      [(UISplitViewControllerClassicImpl *)self _setPreservedDetailController:0];
    }
  }
}

void __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke(uint64_t *a1)
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke_2;
  id v6 = &unk_1E52D9F98;
  v2 = (void *)a1[5];
  uint64_t v7 = a1[4];
  id v8 = v2;
  +[UIView performWithoutAnimation:&v3];
  objc_msgSend((id)a1[4], "_collapseSecondaryViewController:ontoPrimaryViewController:", a1[6], a1[5], v3, v4, v5, v6, v7);
}

void __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [WeakRetained setViewControllers:v3];
}

- (void)_animateTransitionFromTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [a3 horizontalSizeClass];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v8 = [WeakRetained traitCollection];
  uint64_t v9 = [v8 horizontalSizeClass];

  if (v6 == 1 && v9 == 2)
  {
    [(UISplitViewControllerClassicImpl *)self _separateMasterAndDetailWithTransitionCoordinator:v10];
    self->_useChangingBoundsLayout = 1;
  }
  else
  {
    self->_useChangingBoundsLayout = 1;
    if (v6 == 2 && v9 == 1) {
      [(UISplitViewControllerClassicImpl *)self _collapseMasterAndDetailWithTransitionCoordinator:v10];
    }
  }
  [(UISplitViewControllerClassicImpl *)self _updateTargetDisplayMode];
}

- (void)_separateMasterAndDetailWithTransitionCoordinator:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
  [(UIView *)self->_collapsingMasterSnapshotView setAlpha:0.0];
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [WeakRetained masterViewController];
  uint64_t v4 = [v3 view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [*(id *)(a1 + 32) _removeCollapsingSnapshotViews];
  id v13 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", v6, v8, v10, v12);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v13;

  uint64_t v16 = *(void *)(a1 + 32);
  unsigned int v17 = *(void **)(v16 + 72);
  id v18 = objc_loadWeakRetained((id *)(v16 + 8));
  id v19 = [v18 masterViewController];
  id v20 = [v19 view];
  [v17 captureSnapshotOfView:v20 withSnapshotType:1];

  id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v22 = [v21 view];
  [v22 addSubview:*(void *)(*(void *)(a1 + 32) + 72)];

  [*(id *)(a1 + 32) _setCollapsedState:3];
  id v23 = [*(id *)(a1 + 32) _primaryViewControllerForExpanding];
  id v24 = [*(id *)(a1 + 32) _preservedDetailController];
  if (!v24)
  {
    id v24 = [*(id *)(a1 + 32) _secondaryViewControllerForCollapsing];
    [*(id *)(a1 + 32) _setPreservedDetailController:v24];
  }
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = __Block_byref_object_copy__59;
  v61 = __Block_byref_object_dispose__59;
  id v62 = 0;
  if (v24) {
    BOOL v25 = ((v24[94] >> 1) & 3u) - 1 < 2;
  }
  else {
    BOOL v25 = 0;
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_99;
  v54[3] = &unk_1E52E1B98;
  uint64_t v26 = *(void *)(a1 + 32);
  id v56 = &v57;
  v54[4] = v26;
  id v27 = v23;
  id v55 = v27;
  +[UIViewController _withDisabledAppearanceTransitions:v25 forDescendantsOf:v24 visibleOnly:1 perform:v54];
  [*(id *)(a1 + 32) _setPreservedDetailController:v58[5]];
  uint64_t v28 = [(id)v58[5] _hasAppeared];
  id v29 = (_DWORD *)v58[5];
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  int v49 = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_3;
  id v50 = &unk_1E52E1B98;
  long long v53 = &v57;
  id v30 = v27;
  uint64_t v31 = *(void *)(a1 + 32);
  id v51 = v30;
  uint64_t v52 = v31;
  +[UIViewController _withDisabledAppearanceTransitions:v28 forDescendantsOf:v29 visibleOnly:v29 != v24 perform:&v47];
  id v32 = objc_msgSend(v30, "view", v47, v48, v49, v50);
  [v32 frame];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  LODWORD(v28) = [*(id *)(a1 + 32) _layoutPrimaryOnRight];
  BOOL v41 = [v30 view];
  id v42 = v41;
  double v43 = -v38;
  if (v28) {
    double v43 = v38;
  }
  objc_msgSend(v41, "setFrame:", v34 + v43, v36, v38, v40);

  v44 = [(id)v58[5] view];
  objc_msgSend(v44, "setFrame:", v6, v8, v10, v12);

  id v45 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v46 = [v45 view];
  [v46 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 72)];

  _Block_object_dispose(&v57, 8);
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_99(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E52E1B98;
  v3[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 40);
  id v1 = (id)v2;
  long long v4 = v2;
  +[UIViewController _performWithoutDeferringTransitions:v3];
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _separateSecondaryViewControllerFromPrimaryViewController:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_3(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v2)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = v2;
    uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
    long long v4 = &v9;
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v8 = a1[4];
    uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
    long long v4 = &v8;
    uint64_t v5 = 1;
  }
  double v6 = objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10, v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  [WeakRetained setViewControllers:v6];
}

- (void)_collapseMasterAndDetailWithTransitionCoordinator:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isCollapsed])
  {
    uint64_t v5 = [(UISplitViewControllerClassicImpl *)self viewControllers];
    BOOL v6 = (unint64_t)[v5 count] > 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(UISplitViewControllerClassicImpl *)self _setCollapsedState:1];
  double v7 = [(UISplitViewControllerClassicImpl *)self _secondaryViewControllerForCollapsing];
  uint64_t v8 = [(UISplitViewControllerClassicImpl *)self _primaryViewControllerForCollapsing];
  if (v6)
  {
    uint64_t v9 = [v7 navigationController];
    uint64_t v10 = [v9 _outermostNavigationController];
    int v11 = [v10 isEqual:v8];

    if (v11)
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v13 = __UIFaultDebugAssertLog();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          goto LABEL_10;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        int v15 = 138412290;
        id v16 = WeakRetained;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Avoid pushing detail twice while collapsing an already collapsed UISVC. UISplitViewController may be in inconsistent state. %@", (uint8_t *)&v15, 0xCu);
      }
      else
      {
        double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_collapseMasterAndDetailWithTransitionCoordinator____s_category)+ 8);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
LABEL_11:

          double v7 = 0;
LABEL_15:
          [(UISplitViewControllerClassicImpl *)self _setCollapsedState:2];
          goto LABEL_16;
        }
        id v13 = v12;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        int v15 = 138412290;
        id v16 = WeakRetained;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Avoid pushing detail twice while collapsing an already collapsed UISVC. UISplitViewController may be in inconsistent state. %@", (uint8_t *)&v15, 0xCu);
      }

LABEL_10:
      goto LABEL_11;
    }
  }
  if (!v8 || !v7) {
    goto LABEL_15;
  }
  [(UISplitViewControllerClassicImpl *)self _setPreservedDetailController:v7];
  [(UISplitViewControllerClassicImpl *)self _collapseMaster:v8 andDetail:v7 withTransitionCoordinator:v4];
LABEL_16:
}

- (void)_collapseMaster:(id)a3 andDetail:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke;
  id v23 = &unk_1E52DD450;
  id v24 = v8;
  BOOL v25 = self;
  id v26 = v10;
  int v11 = v9;
  id v27 = v11;
  id v12 = v10;
  id v13 = v8;
  +[UIViewController _withDisabledAppearanceTransitionsForVisibleDescendantsOf:v11 perform:&v20];
  int v14 = dyld_program_sdk_at_least();
  if (v11 && v14 && ((v11[94] >> 1) & 3u) - 1 <= 1)
  {
    objc_msgSend(v11, "splitViewController", v20, v21, v22, v23, v24, v25, v26, v27);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    if (v15 == WeakRetained)
    {
    }
    else
    {
      uint64_t v17 = WeakRetained;
      id v18 = [v11 _existingView];
      id v19 = [v18 window];

      if (!v19)
      {
        -[UIViewController __viewWillDisappear:]((uint64_t)v11, 0);
        -[UIViewController __viewDidDisappear:]((uint64_t)v11, 0);
      }
    }
  }
}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _appearState] == 3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_2;
  v5[3] = &unk_1E52DD450;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  +[UIViewController _withDisabledAppearanceTransitions:v2 forDescendantsOf:v3 visibleOnly:1 perform:v5];
}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_3;
  id v6 = &unk_1E52DD450;
  BOOL v2 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v2;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  +[UIView performWithoutAnimation:&v3];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setAlpha:", 0.0, v3, v4, v5, v6, v7);
}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 72))
  {
    uint64_t v3 = [UISnapshotView alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = [WeakRetained masterViewController];
    id v6 = [v5 view];
    [v6 frame];
    uint64_t v7 = -[UISnapshotView initWithFrame:](v3, "initWithFrame:");
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 72);
    *(void *)(v8 + 72) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 72);
    id v12 = objc_loadWeakRetained((id *)(v10 + 8));
    id v13 = [v12 masterViewController];
    int v14 = [v13 view];
    [v11 captureSnapshotOfView:v14 withSnapshotType:1];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v15 = objc_loadWeakRetained((id *)(v2 + 8));
  id v16 = [v15 view];
  [v16 addSubview:*(void *)(*(void *)(a1 + 32) + 72)];

  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(void *)(v17 + 80))
  {
    id v18 = [UISnapshotView alloc];
    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v20 = [v19 detailViewController];
    uint64_t v21 = [v20 view];
    [v21 frame];
    uint64_t v22 = -[UISnapshotView initWithFrame:](v18, "initWithFrame:");
    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = *(void **)(v23 + 80);
    *(void *)(v23 + 80) = v22;

    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 80);
    id v27 = objc_loadWeakRetained((id *)(v25 + 8));
    uint64_t v28 = [v27 detailViewController];
    id v29 = [v28 view];
    [v26 captureSnapshotOfView:v29 withSnapshotType:1];

    uint64_t v17 = *(void *)(a1 + 32);
  }
  id v30 = objc_loadWeakRetained((id *)(v17 + 8));
  uint64_t v31 = [v30 view];
  [v31 addSubview:*(void *)(*(void *)(a1 + 32) + 80)];

  id v32 = *(void **)(a1 + 40);
  if (v32)
  {
    [v32 targetTransform];
    unint64_t v33 = (unint64_t)(*(double *)&v50 < 0.0) << 31;
  }
  else
  {
    unint64_t v33 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
  }
  *(void *)(*(void *)(a1 + 32) + 336) = *(void *)(*(void *)(a1 + 32) + 336) & 0xFFFFFFFF7FFFFFFFLL | v33;
  id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v52[0] = *(void *)(a1 + 48);
  double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  [v34 setViewControllers:v35];

  id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v37 = [v36 view];
  [v37 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 72)];

  id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v39 = [v38 view];
  [v39 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 80)];

  double v40 = *(double **)(a1 + 32);
  double v41 = v40[36];
  double v42 = v40[37];
  double v43 = v40[38];
  double v44 = v40[39];
  id v45 = [*(id *)(a1 + 48) view];
  objc_msgSend(v45, "setFrame:", v41, v42, v43, v44);

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_4;
  v46[3] = &unk_1E52DCB30;
  v46[4] = *(void *)(a1 + 32);
  id v47 = *(id *)(a1 + 56);
  id v48 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:v46];
}

uint64_t __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _collapseSecondaryViewController:*(void *)(a1 + 40) ontoPrimaryViewController:*(void *)(a1 + 48)];
}

- (void)_didTransitionTraitCollection
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v16 = [WeakRetained masterViewController];

  uint64_t v5 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
  uint64_t v6 = (*(void *)&self->_splitViewControllerFlags >> 20) & 3;
  if (v16 && v5)
  {
    if (v6 == 1)
    {
      uint64_t v6 = 2;
    }
    else if (v6 == 3)
    {
      [(UISplitViewControllerClassicImpl *)self _setPreservedDetailController:0];
      uint64_t v6 = 0;
    }
  }
  self->_useChangingBoundsLayout = 0;
  [(UISplitViewControllerClassicImpl *)self _setCollapsedState:v6];
  [(UISplitViewControllerClassicImpl *)self _removeCollapsingSnapshotViews];
  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder)
  {
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 1) == 0)
    {
      id v8 = objc_loadWeakRetained((id *)p_svc);
      char v9 = [v8 _containsResponder:self->_postTransitionResponder];

      if (v9)
      {
        if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 2) != 0)
        {
          [(UIResponder *)self->_postTransitionResponder becomeFirstResponder];
        }
        else
        {
          id v10 = objc_loadWeakRetained((id *)p_svc);
          int v11 = [v10 _window];
          [v11 _setFirstResponder:self->_postTransitionResponder];
        }
        id v12 = 0;
        goto LABEL_16;
      }
      postTransitionResponder = self->_postTransitionResponder;
    }
    id v12 = postTransitionResponder;
LABEL_16:
    id v13 = self->_postTransitionResponder;
    self->_postTransitionResponder = 0;

    *(void *)&self->_splitViewControllerFlags &= 0xFFFFFFFCFFFFFFFFLL;
    if (v12) {
      [(UIResponder *)v12 _finishResignFirstResponder];
    }
    id v14 = objc_loadWeakRetained((id *)p_svc);
    id v15 = [v14 _window];
    [v15 _setIsSettingFirstResponder:0];
  }
}

- (void)_didChangeToFirstResponder:(id)a3
{
  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder) {
    BOOL v4 = postTransitionResponder == a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v5 = 0x100000000;
    if (!a3) {
      uint64_t v5 = 0x200000000;
    }
    *(void *)&self->_splitViewControllerFlags |= v5;
  }
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  if (self->_postTransitionResponder) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v4 = objc_msgSend(WeakRetained, "_super_disableAutomaticKeyboardBehavior");

  return v4;
}

- (id)_deepestUnambiguousResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v3 = objc_msgSend(WeakRetained, "_super_deepestActionResponder");

  return v3;
}

- (void)_removeCollapsingSnapshotViews
{
  [(UIView *)self->_collapsingMasterSnapshotView removeFromSuperview];
  collapsingMasterSnapshotView = self->_collapsingMasterSnapshotView;
  self->_collapsingMasterSnapshotView = 0;

  [(UIView *)self->_collapsingDetailSnapshotView removeFromSuperview];
  collapsingDetailSnapshotView = self->_collapsingDetailSnapshotView;
  self->_collapsingDetailSnapshotView = 0;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 8) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    char v9 = [WeakRetained isCollapsed];

    if ((v9 & 1) == 0)
    {
      if ([(UISplitViewControllerClassicImpl *)self _hasMasterViewController])
      {
        id v10 = objc_loadWeakRetained((id *)&self->_svc);
        id v11 = [v10 masterViewController];

        if (v11 == v7)
        {
          -[UISplitViewControllerClassicImpl _masterViewFrame:](self, "_masterViewFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
          goto LABEL_23;
        }
      }
      id v12 = objc_loadWeakRetained((id *)&self->_svc);
      id v13 = [v12 detailViewController];

      if (v13 == v7)
      {
        -[UISplitViewControllerClassicImpl _detailViewFrame:](self, "_detailViewFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
LABEL_23:
        double width = v14;
        double height = v15;
        goto LABEL_20;
      }
    }
    goto LABEL_18;
  }
  if (!self->_transitioningToInternalMode) {
    goto LABEL_18;
  }
  if ([(UISplitViewControllerClassicImpl *)self _hasMasterViewController])
  {
    id v16 = objc_loadWeakRetained((id *)&self->_svc);
    id v17 = [v16 masterViewController];

    if (v17 == v7)
    {
      -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", 0, width, height);
      double width = v30;
      goto LABEL_20;
    }
  }
  id v18 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v19 = [v18 detailViewController];
  if ((id)v19 == v7)
  {

    goto LABEL_15;
  }
  uint64_t v20 = (void *)v19;
  if (![(UISplitViewControllerClassicImpl *)self _isTransitioningFromCollapsedToSeparated])
  {

    goto LABEL_18;
  }
  id v21 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];

  if (v21 != v7)
  {
LABEL_18:
    id v24 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v24, "_super_sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
    double width = v26;
    double height = v27;
    goto LABEL_19;
  }
LABEL_15:
  if (self->_transitioningToInternalMode == 1)
  {
    -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", 0, width, height);
    double v23 = v22;
    id v24 = objc_loadWeakRetained((id *)&self->_svc);
    [v24 gutterWidth];
    double width = width - (v23 + v25);
LABEL_19:
  }
LABEL_20:

  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v10 = [WeakRetained _existingView];
  if (!v10)
  {

    goto LABEL_6;
  }
  id v11 = (void *)v10;
  id v12 = objc_loadWeakRetained((id *)&self->_svc);
  [v12 traitCollection];
  id v13 = v101 = v8;
  uint64_t v14 = [v13 horizontalSizeClass];
  uint64_t v15 = [v7 horizontalSizeClass];

  id v8 = v101;
  if (v14 == v15)
  {
LABEL_6:
    id v23 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v23, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", v7, v8);

    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, a3);
  if ([v7 horizontalSizeClass] == 1)
  {
    self->_useChangingBoundsLayout = 1;
    id v16 = objc_loadWeakRetained((id *)&self->_svc);
    id v17 = [v16 view];
    [v17 bounds];
    self->_viewBoundsBeforeCollapse.origin.double x = v18;
    self->_viewBoundsBeforeCollapse.origin.CGFloat y = v19;
    self->_viewBoundsBeforeCollapse.size.double width = v20;
    self->_viewBoundsBeforeCollapse.size.double height = v21;

    BOOL v22 = 0;
  }
  else
  {
    BOOL v22 = [v7 horizontalSizeClass] == 2;
  }
  id v24 = objc_loadWeakRetained((id *)&self->_svc);
  float v25 = [v24 traitCollection];

  id v26 = objc_loadWeakRetained((id *)&self->_svc);
  double v27 = [v26 _window];
  double v28 = [v27 firstResponder];

  id v29 = objc_loadWeakRetained((id *)&self->_svc);
  double v30 = [v29 detailViewController];
  uint64_t v31 = v30;
  if (v30) {
    id v32 = v30;
  }
  else {
    id v32 = objc_loadWeakRetained((id *)&self->_svc);
  }
  unint64_t v33 = v32;

  if ([v33 _containsResponder:v28])
  {
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 3) & 0x10) == 0
      || (id v34 = objc_loadWeakRetained(&self->_delegate),
          id v35 = objc_loadWeakRetained((id *)&self->_svc),
          int v36 = [v34 _splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:v35],
          v35,
          v34,
          v36))
    {
      objc_storeStrong((id *)&self->_postTransitionResponder, v28);
      *(void *)&self->_splitViewControllerFlags &= 0xFFFFFFFCFFFFFFFFLL;
      id v37 = objc_loadWeakRetained((id *)&self->_svc);
      id v38 = [v37 _window];
      [v38 _setIsSettingFirstResponder:1];
    }
  }
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v107[3] = &unk_1E52E7BF8;
  v107[4] = self;
  id v108 = v25;
  id v8 = v101;
  id v39 = v101;
  id v109 = v39;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  v106[3] = &unk_1E52DA598;
  v106[4] = self;
  id v40 = v25;
  [v39 animateAlongsideTransition:v107 completion:v106];

  id v41 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v41, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", v7, v39);

  if (v22)
  {
    id v42 = objc_loadWeakRetained((id *)&self->_svc);
    double v43 = [v42 masterViewController];

    double v44 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
    if (v43)
    {
      id v45 = objc_loadWeakRetained((id *)&self->_svc);
      v46 = [v45 overrideTraitCollectionForChildViewController:v43];

      if (v46)
      {
        if (v44)
        {
          id v47 = objc_loadWeakRetained((id *)&self->_svc);
          id v48 = [v47 overrideTraitCollectionForChildViewController:v44];

          id v49 = objc_loadWeakRetained((id *)&self->_svc);
          long long v50 = [(id)objc_opt_class() _traitCollectionWithParentTraitCollection:v7 overrideTraitCollection:v48];

          [v44 _unsafeParentWillTransitionToTraitCollection:v50 withTransitionCoordinator:v39];
          id v8 = v101;
        }
      }
    }
  }
  [(UISplitViewControllerClassicImpl *)self _removeCollapsingSnapshotViews];
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    id v51 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v52 = [v51 masterViewController];
    long long v53 = [v52 childModalViewController];

    if (v53)
    {
      id v54 = objc_loadWeakRetained((id *)&self->_svc);
      id v55 = [v54 masterViewController];
      id v56 = [v55 _presentationController];
      uint64_t v57 = [v56 _firstCurrentContextChildInWindow];

      if (v57)
      {
        long long v58 = [UISnapshotView alloc];
        id v59 = objc_loadWeakRetained((id *)&self->_svc);
        id v60 = [v59 masterViewController];
        v61 = [v60 view];
        [v61 frame];
        id v62 = -[UISnapshotView initWithFrame:](v58, "initWithFrame:");
        collapsingMasterSnapshotView = self->_collapsingMasterSnapshotView;
        self->_collapsingMasterSnapshotView = v62;

        v64 = self->_collapsingMasterSnapshotView;
        BOOL v65 = [v57 view];
        [(UISnapshotView *)v64 captureSnapshotOfView:v65 withSnapshotType:1];

        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3;
        v105[3] = &unk_1E52D9F70;
        v105[4] = self;
        __int16 v66 = v105;
      }
      else
      {
        if (![(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible]
          || [v7 horizontalSizeClass] != 1)
        {
          goto LABEL_27;
        }
        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_4;
        v104[3] = &unk_1E52D9F70;
        v104[4] = self;
        __int16 v66 = v104;
      }
      +[UIViewController _performWithoutDeferringTransitions:v66];
LABEL_27:
    }
  }
  id v67 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v68 = [v67 detailViewController];
  if (!v68)
  {
LABEL_32:

    goto LABEL_33;
  }
  id v69 = (void *)v68;
  id v70 = objc_loadWeakRetained((id *)&self->_svc);
  long long v71 = [v70 detailViewController];
  long long v72 = [v71 childModalViewController];

  if (v72)
  {
    id v73 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v74 = [v73 detailViewController];
    id v75 = [v74 _presentationController];
    id v67 = [v75 _firstCurrentContextChildInWindow];

    if (v67)
    {
      long long v76 = [UISnapshotView alloc];
      id v77 = objc_loadWeakRetained((id *)&self->_svc);
      long long v78 = [v77 detailViewController];
      long long v79 = [v78 childModalViewController];
      long long v80 = [v79 view];
      [v80 frame];
      long long v81 = -[UISnapshotView initWithFrame:](v76, "initWithFrame:");
      collapsingDetailSnapshotView = self->_collapsingDetailSnapshotView;
      self->_collapsingDetailSnapshotView = v81;

      id v8 = v101;
      long long v83 = self->_collapsingDetailSnapshotView;
      v84 = [v67 view];
      [(UISnapshotView *)v83 captureSnapshotOfView:v84 withSnapshotType:1];

      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_5;
      v103[3] = &unk_1E52D9F70;
      v103[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:v103];
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t v85 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
    id v88 = [v87 childModalViewController];

    if (v88)
    {
      uint64_t v89 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];
      v90 = [v89 _presentationController];
      v91 = [v90 _firstCurrentContextChildInWindow];

      if (v91)
      {
        v92 = [UISnapshotView alloc];
        id v93 = objc_loadWeakRetained((id *)&self->_svc);
        v94 = [v93 detailViewController];
        v95 = [v94 childModalViewController];
        v96 = [v95 view];
        [v96 frame];
        v97 = -[UISnapshotView initWithFrame:](v92, "initWithFrame:");
        v98 = self->_collapsingMasterSnapshotView;
        self->_collapsingMasterSnapshotView = v97;

        v99 = self->_collapsingMasterSnapshotView;
        v100 = [v91 view];
        [(UISnapshotView *)v99 captureSnapshotOfView:v100 withSnapshotType:1];
      }
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_6;
      v102[3] = &unk_1E52D9F70;
      v102[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:v102];
    }
  }
LABEL_7:
}

uint64_t __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateTransitionFromTraitCollection:*(void *)(a1 + 40) withTransitionCoordinator:*(void *)(a1 + 48)];
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _didTransitionTraitCollection];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 264);
  *(void *)(v2 + 264) = 0;
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v1 = [WeakRetained masterViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v1 = [WeakRetained masterViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v1 = [WeakRetained detailViewController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _preservedDetailController];
  [v1 dismissViewControllerAnimated:0 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  p_svc = &self->_svc;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_svc);
  id v7 = [WeakRetained traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];
  uint64_t v9 = [v5 horizontalSizeClass];

  if (v8 != v9)
  {
    [(UISplitViewControllerClassicImpl *)self _setMasterOverrideTraitCollectionActive:1];
  }
}

- (void)_setupUnderBarSeparatorView
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v5 = [WeakRetained view];
  uint64_t v6 = [v5 backgroundColor];

  underBarSeparatorView = self->_underBarSeparatorView;
  if (v6)
  {
    if (!underBarSeparatorView)
    {
      uint64_t v8 = [UIView alloc];
      id v9 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v10 = [v9 view];
      [v10 frame];
      id v11 = -[UIView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0);
      id v12 = self->_underBarSeparatorView;
      self->_underBarSeparatorView = v11;

      id v13 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v14 = [v13 view];
      [v14 addSubview:self->_underBarSeparatorView];
    }
    id v15 = objc_loadWeakRetained((id *)p_svc);
    id v16 = [v15 view];
    [v16 sendSubviewToBack:self->_underBarSeparatorView];

    if (dyld_program_sdk_at_least())
    {
      id v17 = objc_loadWeakRetained((id *)p_svc);
      CGFloat v18 = [v17 view];
      CGFloat v19 = [v18 backgroundColor];
      [(UIView *)self->_underBarSeparatorView setBackgroundColor:v19];
    }
    else
    {
      double v35 = 0.0;
      double v36 = 0.0;
      double v34 = 0.0;
      id v21 = objc_loadWeakRetained((id *)p_svc);
      BOOL v22 = objc_msgSend(v21, "view", 0);
      id v23 = [v22 backgroundColor];
      [v23 getRed:&v36 green:&v35 blue:&v34 alpha:&v33];

      id v17 = +[UIColor colorWithRed:v36 + (1.0 - v36) * 0.400000006 green:v35 + (1.0 - v35) * 0.400000006 blue:v34 + (1.0 - v34) * 0.400000006 alpha:1.0];
      [(UIView *)self->_underBarSeparatorView setBackgroundColor:v17];
    }

    id v24 = objc_loadWeakRetained((id *)p_svc);
    if ([v24 isCollapsed])
    {
    }
    else
    {
      id v25 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v26 = [v25 displayMode];

      if (v26 == 2)
      {
        id v27 = objc_loadWeakRetained((id *)p_svc);
        double v28 = [v27 masterViewController];
        [v28 _topBarHeight];

        id v29 = objc_loadWeakRetained((id *)p_svc);
        double v30 = [v29 detailViewController];
        [v30 _topBarHeight];
      }
    }
    id v31 = objc_loadWeakRetained((id *)p_svc);
    id v32 = [v31 view];
    [v32 bounds];
    -[UIView setFrame:](self->_underBarSeparatorView, "setFrame:", 0.0, 0.0);
  }
  else if (underBarSeparatorView)
  {
    [(UIView *)underBarSeparatorView removeFromSuperview];
    CGFloat v20 = self->_underBarSeparatorView;
    self->_underBarSeparatorView = 0;
  }
}

- (BOOL)_hasMasterViewController
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained childViewControllersCount])
  {
    id v4 = objc_loadWeakRetained((id *)p_svc);
    id v5 = [v4 masterViewController];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)masterViewController
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v5 = [WeakRetained childViewControllersCount];

  if (v5 < 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__UISplitViewControllerClassicImpl_masterViewController__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    if (masterViewController_once != -1) {
      dispatch_once(&masterViewController_once, block);
    }
    uint64_t v8 = 0;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_svc);
    id v7 = [v6 mutableChildViewControllers];
    uint64_t v8 = [v7 objectAtIndex:0];
  }
  return v8;
}

void __56__UISplitViewControllerClassicImpl_masterViewController__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &kUISVCUsesExtraWidePrimaryColumn_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Splitview controller %@ is expected to have a view controller at index 0 before it's used!", (uint8_t *)&v4, 0xCu);
  }
}

- (id)detailViewController
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v4 = [WeakRetained childViewControllersCount];

  if (v4 < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v6 = [v5 mutableChildViewControllers];
    id v7 = [v6 objectAtIndex:1];
  }
  return v7;
}

- (BOOL)hidesMasterViewInPortrait
{
  if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInPortraitInvalid]) {
    [(UISplitViewControllerClassicImpl *)self _updateDelegateHiddenMasterAspectRatios];
  }
  return (*(unsigned char *)&self->_splitViewControllerFlags >> 3) & 1;
}

- (BOOL)hidesMasterViewInLandscape
{
  if ([(UISplitViewControllerClassicImpl *)self _isHidesMasterInLandscapeInvalid]) {
    [(UISplitViewControllerClassicImpl *)self _updateDelegateHiddenMasterAspectRatios];
  }
  return (*(unsigned char *)&self->_splitViewControllerFlags >> 2) & 1;
}

- (BOOL)_hidesMasterViewInCurrentOrientation
{
  uint64_t v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  LOBYTE(v2) = -[UISplitViewControllerClassicImpl _hidesMasterViewInOrientation:medusaState:](v2, "_hidesMasterViewInOrientation:medusaState:", [WeakRetained interfaceOrientation], -[UISplitViewControllerClassicImpl _medusaState](v2, "_medusaState"));

  return (char)v2;
}

- (BOOL)_hidesMasterViewInOrientation:(int64_t)a3 medusaState:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      LOBYTE(v5) = [(UISplitViewControllerClassicImpl *)self hidesMasterViewInLandscape];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      char v7 = [WeakRetained hidesMasterViewInPortrait];

      LOBYTE(v5) = v7;
    }
  }
  else
  {
    return (3u >> ((a4 - 1) & 7)) & 1;
  }
  return v5;
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  if ((*(unsigned char *)&self->_splitViewControllerFlags & 0x10) != 0) {
    return;
  }
  BOOL v3 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v7 = [WeakRetained hidesMasterViewInPortrait];

  if (v7 == v3) {
    return;
  }
  id v8 = objc_loadWeakRetained((id *)p_svc);
  id v18 = [v8 _window];

  if (v18) {
    BOOL v9 = (unint64_t)(objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:") - 3) < 2;
  }
  else {
    BOOL v9 = 0;
  }
  [(UISplitViewControllerClassicImpl *)self _setDelegateHidesMaster:v3 inAspectRatio:1];
  if (!v9 && !v3)
  {
    uint64_t v10 = objc_loadWeakRetained((id *)p_svc);
    if (v10)
    {
      unsigned int v11 = ((v10[94] >> 1) & 3) - 1;

      if (v11 <= 1) {
        [(UISplitViewControllerClassicImpl *)self _showMasterViewAnimated:0];
      }
    }
  }
  id v12 = objc_loadWeakRetained((id *)p_svc);
  id v13 = [v12 view];
  [v13 setNeedsLayout];

  if (!v9 && v3)
  {
    uint64_t v14 = objc_loadWeakRetained((id *)p_svc);
    if (!v14)
    {
      id v16 = 0;
      goto LABEL_16;
    }
    unsigned int v15 = ((v14[94] >> 1) & 3) - 1;

    if (v15 <= 1)
    {
      id v16 = objc_loadWeakRetained((id *)p_svc);
      id v17 = [v16 masterViewController];
      -[UIViewController __viewDidDisappear:]((uint64_t)v17, 0);

LABEL_16:
    }
  }
}

- (void)_showMasterViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v7 = [WeakRetained masterViewController];
  objc_msgSend(v7, "__viewWillAppear:", v3);

  id v8 = objc_loadWeakRetained((id *)p_svc);
  BOOL v9 = [v8 masterViewController];
  uint64_t v10 = [v9 view];
  unsigned int v11 = [v10 superview];
  id v12 = objc_loadWeakRetained((id *)p_svc);
  id v13 = [v12 view];

  if (v11 != v13)
  {
    id v14 = objc_loadWeakRetained((id *)p_svc);
    unsigned int v15 = [v14 masterViewController];
    id v16 = [v15 view];
    [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
    objc_msgSend(v16, "setFrame:");

    id v21 = objc_loadWeakRetained((id *)p_svc);
    id v17 = [v21 view];
    id v18 = objc_loadWeakRetained((id *)p_svc);
    CGFloat v19 = [v18 masterViewController];
    CGFloat v20 = [v19 view];
    [v17 insertSubview:v20 atIndex:0];
  }
}

- (double)_masterPresentationAnimationDuration
{
  return 0.2;
}

- (void)setMinimumPrimaryColumnWidth:(double)a3
{
  if (self->_minimumPrimaryColumnWidth != a3)
  {
    self->_minimumPrimaryColumnWidth = a3;
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v5 = [WeakRetained view];
    [v5 setNeedsLayout];

    if (+[UIView _isInAnimationBlock])
    {
      id v7 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v6 = [v7 view];
      [v6 layoutBelowIfNeeded];
    }
  }
}

- (void)setMaximumPrimaryColumnWidth:(double)a3
{
  if (self->_maximumPrimaryColumnWidth != a3)
  {
    self->_maximumPrimaryColumnWidth = a3;
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v5 = [WeakRetained view];
    [v5 setNeedsLayout];

    if (+[UIView _isInAnimationBlock])
    {
      id v7 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v6 = [v7 view];
      [v6 layoutBelowIfNeeded];
    }
  }
}

- (void)setPreferredPrimaryColumnWidthFraction:(double)a3
{
  if (self->_preferredPrimaryColumnWidthFraction != a3)
  {
    self->_preferredPrimaryColumnWidthFraction = a3;
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v5 = [WeakRetained view];
    [v5 setNeedsLayout];

    if (+[UIView _isInAnimationBlock])
    {
      id v7 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v6 = [v7 view];
      [v6 layoutBelowIfNeeded];
    }
  }
}

+ (double)_defaultGutterWidthInView:(id)a3
{
  id v3 = a3;
  double v4 = 1.0;
  if (dyld_program_sdk_at_least())
  {
    BOOL v5 = [v3 _screen];

    if (v5)
    {
      uint64_t v6 = [v3 _screen];
      [v6 scale];
      double v8 = 1.0 / v7;

      BOOL v9 = [v3 _window];
      objc_msgSend(v9, "convertRect:fromWindow:", 0, 0.0, 0.0, v8, v8);
      objc_msgSend(v3, "convertRect:fromView:", 0);
      double v4 = v10;
    }
    else
    {
      BOOL v9 = +[UIScreen mainScreen];
      [v9 scale];
      double v4 = 1.0 / v11;
    }
  }
  return v4;
}

- (float)gutterWidth
{
  float gutterWidth = self->_gutterWidth;
  if (gutterWidth == -3.4028e38)
  {
    double v4 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v6 = [WeakRetained _existingView];
    [v4 _defaultGutterWidthInView:v6];
    float gutterWidth = v7;
  }
  return gutterWidth;
}

- (void)setGutterWidth:(float)a3
{
  self->_float gutterWidth = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v3 = [WeakRetained _existingView];
  [v3 setNeedsLayout];
}

- (void)setPresentsWithGesture:(BOOL)a3
{
  if (self->_presentsWithGesture != a3)
  {
    self->_presentsWithGesture = a3;
    [(UISplitViewControllerClassicImpl *)self _addOrRemovePopoverPresentationGestureRecognizer];
  }
}

- (BOOL)_effectivePresentsWithGesture
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained presentsWithGesture]
    && ((*(void *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2)
  {
    id v6 = objc_loadWeakRetained((id *)p_svc);
    if ((([v6 hidesMasterViewInPortrait] & 1) != 0
       || [(UISplitViewControllerClassicImpl *)self hidesMasterViewInLandscape])
      && ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 4) != 0 || (dyld_program_sdk_at_least() & 1) != 0))
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = objc_loadWeakRetained((id *)p_svc);
      BOOL v5 = [v7 preferredDisplayMode] != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)primaryEdge
{
  return self->_primaryEdge;
}

- (void)setPrimaryEdge:(int64_t)a3
{
  if (self->_primaryEdge != a3)
  {
    self->_primaryEdge = a3;
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v5 = [WeakRetained view];
    [v5 setNeedsLayout];

    id v6 = objc_loadWeakRetained((id *)p_svc);
    id v7 = [v6 masterViewController];
    double v8 = [v7 view];
    [v8 setNeedsLayout];

    id v11 = objc_loadWeakRetained((id *)p_svc);
    BOOL v9 = [v11 detailViewController];
    double v10 = [v9 view];
    [v10 setNeedsLayout];
  }
}

- (BOOL)_layoutPrimaryOnRight
{
  int64_t primaryEdge = self->_primaryEdge;
  if (!primaryEdge)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v3 = [WeakRetained view];
    if ([v3 _shouldReverseLayoutDirection])
    {
      LOBYTE(v6) = 1;
      goto LABEL_10;
    }
    if (self->_primaryEdge != 1)
    {
      LOBYTE(v6) = 0;
      goto LABEL_10;
    }
LABEL_7:
    id v7 = objc_loadWeakRetained((id *)&self->_svc);
    double v8 = [v7 view];
    int v6 = [v8 _shouldReverseLayoutDirection] ^ 1;

    if (primaryEdge) {
      return v6;
    }
LABEL_10:

    return v6;
  }
  if (primaryEdge == 1) {
    goto LABEL_7;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode | a3)
  {
    self->_preferredDisplayMode = a3;
    -[UISplitViewControllerClassicImpl _changeToDisplayMode:forCurrentOrientationOnly:](self, "_changeToDisplayMode:forCurrentOrientationOnly:");
  }
}

- (int64_t)displayMode
{
  if (![(UISplitViewControllerClassicImpl *)self _isMasterViewShown]) {
    return 1;
  }
  if ([(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible]
    && ![(UIPopoverController *)self->_hiddenPopoverController _isDismissing])
  {
    return 3;
  }
  return 2;
}

- (id)_defaultDisplayModes
{
  int64_t v3 = [(UISplitViewControllerClassicImpl *)self _currentInterfaceIdiom];
  if (v3)
  {
    if (v3 == 1)
    {
      BOOL v4 = [(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation];
      BOOL v5 = &unk_1ED3EF7E8;
      int v6 = &unk_1ED3EF7D0;
      goto LABEL_6;
    }
    return &unk_1ED3EF830;
  }
  if (![(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment])return &unk_1ED3EF830; {
  BOOL v4 = [(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation];
  }
  BOOL v5 = &unk_1ED3EF818;
  int v6 = &unk_1ED3EF800;
LABEL_6:
  if (v4) {
    return v6;
  }
  else {
    return v5;
  }
}

- (int64_t)_defaultTargetDisplayMode
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v5 = [WeakRetained traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v6 == 1) {
    return 0;
  }
  int64_t v8 = [(UISplitViewControllerClassicImpl *)self _currentInterfaceIdiom];
  id v9 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v10 = [v9 displayMode];

  id v11 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v12 = [v11 preferredDisplayMode];

  if (!v12)
  {
    if (v8 == 1)
    {
      if (![(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation])
      {
        if ((dyld_program_sdk_at_least() & (v10 == 1)) != 0) {
          return 2;
        }
        else {
          return 0;
        }
      }
    }
    else if (v8 {
           || ![(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment])
    }
    {
      if (v10 == 1) {
        return 2;
      }
      else {
        return 1;
      }
    }
    if (v10 == 1) {
      return 3;
    }
    else {
      return 1;
    }
  }
  if (v10 != 1) {
    return 1;
  }
  id v13 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v14 = [v13 preferredDisplayMode];

  if (v14 == 1)
  {
    if (v8 == 1
      || !v8
      && [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment])
    {
      return 3;
    }
    else
    {
      return 2;
    }
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)p_svc);
    int64_t v16 = [v15 preferredDisplayMode];

    return v16;
  }
}

- (void)_changeToDisplayMode:(int64_t)a3 forCurrentOrientationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(UISplitViewControllerClassicImpl *)self _isMasterViewShown];
  uint64_t v8 = 1;
  switch(a3)
  {
    case 0:
      id v9 = [(UISplitViewControllerClassicImpl *)self _defaultDisplayModes];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      a3 = [WeakRetained displayMode];

      id v11 = [NSNumber numberWithInteger:a3];
      char v12 = [v9 containsObject:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [v9 firstObject];
        a3 = [v13 integerValue];
      }
      goto LABEL_5;
    case 1:
    case 3:
      break;
    case 2:
      uint64_t v8 = 2;
      a3 = 2;
      break;
    default:
LABEL_5:
      uint64_t v8 = 0;
      break;
  }
  [(UISplitViewControllerClassicImpl *)self _displayModeWillChangeTo:a3];
  if (v4)
  {
    [(UISplitViewControllerClassicImpl *)self _setPrimaryHidingStateForCurrentOrientation:v8];
  }
  else
  {
    [(UISplitViewControllerClassicImpl *)self _setPrimaryHidingStateForCurrentOrientation:0];
    [(UISplitViewControllerClassicImpl *)self _setPrimaryHidingState:v8];
  }
  BOOL v14 = [(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible];
  if (a3 == 3)
  {
    if (!v14)
    {
      if (v7)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __83__UISplitViewControllerClassicImpl__changeToDisplayMode_forCurrentOrientationOnly___block_invoke;
        v30[3] = &unk_1E52D9F70;
        v30[4] = self;
        +[UIView performWithoutAnimation:v30];
      }
      else
      {
        [(UISplitViewControllerClassicImpl *)self _presentMasterViewController:+[UIView _isInAnimationBlock]];
      }
    }
    goto LABEL_27;
  }
  if (v14)
  {
    BOOL v15 = +[UIView _isInAnimationBlock];
    BOOL v16 = a3 == 1 && v15;
    [(UISplitViewControllerClassicImpl *)self _dismissMasterViewController:v16];
  }
  if (a3 == 2)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_svc);
    id v18 = [v17 masterViewController];
    CGFloat v19 = [v18 view];
    CGFloat v20 = [v19 superview];
    id v21 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v22 = [v21 view];
    if (v20 == (void *)v22)
    {
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = objc_loadWeakRetained((id *)&self->_svc);
      if (v24)
      {
        unsigned int v25 = ((v24[94] >> 1) & 3) - 1;

        if (v25 <= 1) {
          [(UISplitViewControllerClassicImpl *)self _showMasterViewAnimated:+[UIView _isInAnimationBlock]];
        }
        goto LABEL_27;
      }
    }
  }
LABEL_27:
  id v26 = objc_loadWeakRetained((id *)&self->_svc);
  id v27 = [v26 view];
  [v27 setNeedsLayout];

  if (+[UIView _isInAnimationBlock])
  {
    id v28 = objc_loadWeakRetained((id *)&self->_svc);
    id v29 = [v28 view];
    [v29 layoutBelowIfNeeded];
  }
  [(UISplitViewControllerClassicImpl *)self _displayModeDidChange];
}

uint64_t __83__UISplitViewControllerClassicImpl__changeToDisplayMode_forCurrentOrientationOnly___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentMasterViewController:0];
}

- (void)_displayModeWillChangeTo:(int64_t)a3
{
  int64_t pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
  if (!pendingDisplayModeChangeCount)
  {
    if (self->_lastNotifiedDisplayMode == a3)
    {
      int64_t pendingDisplayModeChangeCount = 0;
    }
    else
    {
      if ((*((unsigned char *)&self->_splitViewControllerFlags + 3) & 4) != 0)
      {
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        id v7 = objc_loadWeakRetained((id *)&self->_svc);
        [WeakRetained splitViewController:v7 willChangeToDisplayMode:a3];

        int64_t pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
      }
      else
      {
        int64_t pendingDisplayModeChangeCount = 0;
      }
      self->_lastNotifiedDisplayMode = a3;
    }
  }
  self->_int64_t pendingDisplayModeChangeCount = pendingDisplayModeChangeCount + 1;
}

- (void)_displayModeDidChange
{
  [(UISplitViewControllerClassicImpl *)self _updateTargetDisplayMode];
  int64_t pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
  BOOL v4 = pendingDisplayModeChangeCount < 1;
  int64_t v5 = pendingDisplayModeChangeCount - 1;
  if (!v4) {
    self->_int64_t pendingDisplayModeChangeCount = v5;
  }
}

- (void)_updateTargetDisplayMode
{
  [(UISplitViewControllerClassicImpl *)self _cacheEffectiveTargetDisplayMode];
  [(UISplitViewControllerClassicImpl *)self _updateDisplayModeButtonItem];
  [(UISplitViewControllerClassicImpl *)self _addOrRemovePopoverPresentationGestureRecognizer];
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 4) == 0)
  {
    if (a4) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    [(UISplitViewControllerClassicImpl *)self _displayModeWillChangeTo:v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained setNeedsStatusBarAppearanceUpdate];
}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 4) == 0) {
    [(UISplitViewControllerClassicImpl *)self _displayModeDidChange];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained setNeedsStatusBarAppearanceUpdate];
}

- (void)_cacheEffectiveTargetDisplayMode
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v5 = [WeakRetained traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v6 == 1)
  {
    int64_t v7 = 0;
  }
  else if ((*((unsigned char *)&self->_splitViewControllerFlags + 3) & 8) == 0 {
         || (id v8 = objc_loadWeakRetained(&self->_delegate),
  }
             id v9 = objc_loadWeakRetained((id *)p_svc),
             int64_t v7 = [v8 targetDisplayModeForActionInSplitViewController:v9],
             v9,
             v8,
             !v7))
  {
    int64_t v7 = [(UISplitViewControllerClassicImpl *)self _defaultTargetDisplayMode];
  }
  self->_effectiveTargetDisplayMode = v7;
}

- (int64_t)_effectiveTargetDisplayMode
{
  return self->_effectiveTargetDisplayMode;
}

- (void)_triggerDisplayModeAction:(id)a3
{
  int64_t v4 = [(UISplitViewControllerClassicImpl *)self _effectiveTargetDisplayMode];
  if (v4)
  {
    int64_t v5 = v4;
    [(UISplitViewControllerClassicImpl *)self _masterPresentationAnimationDuration];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__UISplitViewControllerClassicImpl__triggerDisplayModeAction___block_invoke;
    v6[3] = &unk_1E52D9CD0;
    v6[4] = self;
    v6[5] = v5;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6);
  }
}

uint64_t __62__UISplitViewControllerClassicImpl__triggerDisplayModeAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeToDisplayMode:*(void *)(a1 + 40) forCurrentOrientationOnly:1];
}

- (void)_updateDisplayModeButtonItem
{
  if (!self->_displayModeButtonItem) {
    return;
  }
  int64_t v3 = [(UISplitViewControllerClassicImpl *)self _effectiveTargetDisplayMode];
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      uint64_t v4 = 0;
      BOOL v5 = v3 == 0;
      uint64_t v6 = 0;
      int64_t v7 = 0;
      goto LABEL_14;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v9 = [WeakRetained displayMode];

    if (v9 != 3)
    {
      id v13 = _UIImageWithName(@"UISplitViewControllerFullScreen.png");
      int64_t v7 = [v13 imageFlippedForRightToLeftLayoutDirection];

      uint64_t v4 = 0;
      BOOL v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_14;
    }
  }
  id v10 = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v15 = [v10 _displayModeButtonItemTitle];

  uint64_t v6 = v15;
  if (!v15)
  {
    if (![(UISplitViewControllerClassicImpl *)self _hasMasterViewController])
    {
      BOOL v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_13;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_svc);
    char v12 = [v11 masterViewController];
    BOOL v16 = [v12 title];

    uint64_t v6 = v16;
  }
  BOOL v5 = 0;
LABEL_13:
  int64_t v7 = 0;
  uint64_t v4 = 1;
LABEL_14:
  id v17 = v6;
  if (![(__CFString *)v6 length] && !v7)
  {

    id v17 = @" ";
  }
  [(UIBarButtonItem *)self->_displayModeButtonItem setImage:v7];
  [(UIBarButtonItem *)self->_displayModeButtonItem setTitle:v17];
  [(UIBarButtonItem *)self->_displayModeButtonItem _setShowsBackButtonIndicator:v4];
  if (v4) {
    BOOL v14 = +[UIDragInteraction isEnabledByDefault];
  }
  else {
    BOOL v14 = 0;
  }
  [(UIBarButtonItem *)self->_displayModeButtonItem setSpringLoaded:v14];
  [(UIBarButtonItem *)self->_displayModeButtonItem setHidden:v5];
}

- (id)displayModeButtonItem
{
  displayModeButtonItem = self->_displayModeButtonItem;
  if (!displayModeButtonItem)
  {
    uint64_t v4 = [(UIBarButtonItem *)[UISplitViewControllerDisplayModeBarButtonItem alloc] initWithImage:0 landscapeImagePhone:0 style:0 target:self action:sel__triggerDisplayModeAction_];
    BOOL v5 = self->_displayModeButtonItem;
    self->_displayModeButtonItem = v4;

    [(UISplitViewControllerDisplayModeBarButtonItem *)self->_displayModeButtonItem _setImpl:self];
    [(UISplitViewControllerClassicImpl *)self _updateDisplayModeButtonItem];
    displayModeButtonItem = self->_displayModeButtonItem;
  }
  return displayModeButtonItem;
}

- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3
{
  if ([(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int v5 = [WeakRetained isViewLoaded];

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_svc);
      int64_t v7 = [v6 view];
      [v7 setNeedsLayout];

      [(UISplitViewControllerClassicImpl *)self _cacheEffectiveTargetDisplayMode];
    }
  }
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  displayModeButtonItemTitle = self->_displayModeButtonItemTitle;
  if (displayModeButtonItemTitle != v4)
  {
    uint64_t v9 = v4;
    BOOL v6 = [(NSString *)displayModeButtonItemTitle isEqualToString:v4];
    uint64_t v4 = v9;
    if (!v6)
    {
      int64_t v7 = (NSString *)[(NSString *)v9 copy];
      id v8 = self->_displayModeButtonItemTitle;
      self->_displayModeButtonItemTitle = v7;

      [(UISplitViewControllerClassicImpl *)self _updateDisplayModeButtonItem];
      uint64_t v4 = v9;
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UISplitViewControllerClassicImpl *)self _isMasterViewShown];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int64_t v7 = WeakRetained;
  if (v5)
  {
    id v8 = [WeakRetained masterViewController];
    objc_msgSend(v8, "__viewWillAppear:", v3);
  }
  else
  {
    uint64_t v9 = [WeakRetained displayMode];

    if (v9 != 2)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_svc);
      id v11 = [v10 masterViewController];
      [(UISplitViewControllerClassicImpl *)self _viewControllerHiding:v11];

      self->_$C946B5D877B827A51B09546B3F197234 splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x80);
    }
  }
  [(UISplitViewControllerClassicImpl *)self _addOrRemovePopoverPresentationGestureRecognizer];
  id v13 = objc_loadWeakRetained((id *)&self->_svc);
  char v12 = [v13 detailViewController];
  objc_msgSend(v12, "__viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v6 = [WeakRetained masterViewController];
    objc_msgSend(v6, "__viewDidAppear:", v3);
  }
  id v7 = objc_loadWeakRetained((id *)&self->_svc);
  id v8 = [v7 detailViewController];
  objc_msgSend(v8, "__viewDidAppear:", v3);

  id v9 = objc_loadWeakRetained((id *)&self->_svc);
  self->_lastPresentedOrientation = [v9 interfaceOrientation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v6 = [WeakRetained masterViewController];
    -[UIViewController __viewWillDisappear:]((uint64_t)v6, v3);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [v8 detailViewController];
  -[UIViewController __viewWillDisappear:]((uint64_t)v7, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v6 = [WeakRetained masterViewController];
    -[UIViewController __viewDidDisappear:]((uint64_t)v6, v3);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [v8 detailViewController];
  -[UIViewController __viewDidDisappear:]((uint64_t)v7, v3);
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 1;
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  if (a3)
  {
    [(UISplitViewControllerClassicImpl *)self _updateTargetDisplayMode];
    if ([(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact])
    {
      if ((*(void *)&self->_splitViewControllerFlags & 0x300000) == 0x100000) {
        [(UISplitViewControllerClassicImpl *)self _prepareForCompactLayout];
      }
    }
    else if (self->_traitCollectionWhenRemovedFromWindow)
    {
      uint64_t v6 = (*(void *)&self->_splitViewControllerFlags >> 20) & 3;
      if (v6)
      {
        if (v6 != 3 && dyld_program_sdk_at_least())
        {
          id v7 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
          [(UISplitViewControllerClassicImpl *)self _animateTransitionFromTraitCollection:self->_traitCollectionWhenRemovedFromWindow withTransitionCoordinator:v7];
          [(_UIViewControllerNullAnimationTransitionCoordinator *)v7 _runAlongsideAnimations];
          [(_UIViewControllerNullAnimationTransitionCoordinator *)v7 _runAlongsideCompletionsAfterCommit];
        }
      }
    }
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 3) & 0x20) != 0) {
      [(UISplitViewControllerClassicImpl *)self _presentMasterViewController:0];
    }
    traitCollectionWhenRemovedFromWindow = self->_traitCollectionWhenRemovedFromWindow;
    self->_traitCollectionWhenRemovedFromWindow = 0;
  }
  else
  {
    uint64_t v4 = [(UISplitViewControllerClassicImpl *)self _clearPreventRotationHook];

    if (v4)
    {
      BOOL v5 = [(UISplitViewControllerClassicImpl *)self _clearPreventRotationHook];
      v5[2]();

      [(UISplitViewControllerClassicImpl *)self _setClearPreventRotationHook:0];
    }
  }
}

- (BOOL)_shouldPreventAutorotation
{
  BOOL v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1
    || ![(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v6 = [WeakRetained masterViewController];
  id v7 = [v6 childModalViewController];
  id v8 = [v7 presentationController];
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)_layoutContainerViewWillMoveToWindow:(id)a3
{
  id v4 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact]
    && ((*(void *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2)
  {
    [(UISplitViewControllerClassicImpl *)self _setCollapsedState:1];
  }
  if (!v4)
  {
    if ([(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible]) {
      *(void *)&self->_splitViewControllerFlags |= 0x20000000uLL;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    BOOL v16 = [WeakRetained traitCollection];
    traitCollectionWhenRemovedFromWindow = self->_traitCollectionWhenRemovedFromWindow;
    self->_traitCollectionWhenRemovedFromWindow = v16;

    id v18 = objc_loadWeakRetained((id *)&self->_svc);
    CGFloat v19 = [v18 _window];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke;
    v21[3] = &unk_1E52D9F70;
    id v5 = v19;
    id v22 = v5;
    [(UISplitViewControllerClassicImpl *)self _setClearPreventRotationHook:v21];
    if (dyld_program_sdk_at_least()
      && [(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible])
    {
      [(UISplitViewControllerClassicImpl *)self _dismissMasterViewController:0];
    }

    goto LABEL_18;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke_2;
  v20[3] = &unk_1E52DA6B0;
  v20[4] = self;
  [v4 _setShouldPreventRotationHook:v20];
  id v5 = objc_loadWeakRetained((id *)&self->_svc);
  if ([v5 displayMode] != 2)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [v6 masterViewController];
  id v8 = [v7 view];
  BOOL v9 = [v8 superview];
  id v10 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v11 = [v10 view];
  if (v9 == (void *)v11)
  {

LABEL_17:
    goto LABEL_18;
  }
  char v12 = (void *)v11;
  id v13 = objc_loadWeakRetained((id *)&self->_svc);
  if (!v13)
  {

    goto LABEL_17;
  }
  unsigned int v14 = ((v13[94] >> 1) & 3) - 1;

  if (v14 <= 1) {
    [(UISplitViewControllerClassicImpl *)self _showMasterViewAnimated:0];
  }
LABEL_19:
}

uint64_t __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShouldPreventRotationHook:0];
}

uint64_t __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shouldPreventAutorotation];
}

- (void)_willBeginSnapshotSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v3 = [WeakRetained _isCollapsed];
  int64_t v4 = 1;
  if (v3) {
    int64_t v4 = 2;
  }
  self->_suspendedState = v4;
}

- (void)_didEndSnapshotSession
{
  self->_suspendedState = 0;
}

- (BOOL)_isMasterPopoverVisible
{
  return (*((unsigned char *)&self->_splitViewControllerFlags + 3) & 0x20) != 0
      || [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible];
}

- (void)_presentMasterViewController:(BOOL)a3
{
  BOOL v3 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [WeakRetained _existingView];
  id v8 = [v7 window];

  if (v8)
  {
    if ([(UISplitViewControllerClassicImpl *)self _canDisplayHostedMaster])
    {
      *(void *)&self->_splitViewControllerFlags &= ~0x20000000uLL;
      id v9 = objc_loadWeakRetained((id *)p_svc);
      id v10 = [v9 masterViewController];
      [(UISplitViewControllerClassicImpl *)self _setupHiddenPopoverControllerWithViewController:v10];

      if (![(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
      {
        hiddenPopoverController = self->_hiddenPopoverController;
        unint64_t v12 = [(UISplitViewControllerClassicImpl *)self _targetEdgeForPopover];
        id v14 = objc_loadWeakRetained((id *)p_svc);
        id v13 = [v14 view];
        [(UIPopoverController *)hiddenPopoverController _presentPopoverFromEdge:v12 ofView:v13 animated:v3];
      }
    }
  }
  else
  {
    *(void *)&self->_splitViewControllerFlags |= 0x20000000uLL;
  }
}

- (unint64_t)_targetEdgeForPopover
{
  if ([(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight]) {
    return 8;
  }
  else {
    return 2;
  }
}

- (void)_dismissMasterViewController:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&self->_splitViewControllerFlags &= ~0x20000000uLL;
  if ([(UISplitViewControllerClassicImpl *)self _canDisplayHostedMaster]
    && [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
  {
    [(UISplitViewControllerClassicImpl *)self _displayModeWillChangeTo:1];
    [(UIPopoverController *)self->_hiddenPopoverController dismissPopoverAnimated:v3];
    [(UISplitViewControllerClassicImpl *)self _displayModeDidChange];
  }
}

- (void)toggleMasterVisible:(id)a3
{
  if ([(UISplitViewControllerClassicImpl *)self _canDisplayHostedMaster])
  {
    if ([(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible])
    {
      [(UISplitViewControllerClassicImpl *)self _dismissMasterViewController:1];
    }
    else
    {
      [(UISplitViewControllerClassicImpl *)self _presentMasterViewController:1];
    }
  }
}

- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(UISplitViewControllerClassicImpl *)self _canDisplayHostedMaster]
    && [(UISplitViewControllerClassicImpl *)self _isMasterPopoverVisible])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v13 = [WeakRetained masterViewController];

    id v14 = v10;
    if (!v14) {
      goto LABEL_12;
    }
    id v15 = v14;
    BOOL v16 = 0;
    do
    {
      id v17 = objc_loadWeakRetained((id *)&self->_svc);

      if (v15 == v17 || v16) {
        break;
      }
      BOOL v16 = v15 == v13;
      id v18 = [v15 parentViewController];
      CGFloat v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        id v20 = [v15 parentModalViewController];
      }
      id v21 = v20;

      id v15 = v21;
    }
    while (v21);

    if (!v16) {
LABEL_12:
    }
      [(UISplitViewControllerClassicImpl *)self _dismissMasterViewController:v6];
  }
  id v22 = objc_loadWeakRetained((id *)&self->_svc);
  id v23 = [v22 splitViewController];
  [v23 _descendantWillPresentViewController:v24 modalSourceViewController:v10 presentationController:v11 animated:v6];
}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  [WeakRetained primaryColumnWidth];
  double v7 = v6;
  id v8 = objc_loadWeakRetained((id *)p_svc);
  id v9 = [v8 view];
  [v9 bounds];
  CGFloat Height = CGRectGetHeight(v14);

  double v11 = v7;
  double v12 = Height;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)popoverWillAppear:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hiddenPopoverController)
  {
    double v6 = [v4 object];
    hiddenPopoverController = self->_hiddenPopoverController;

    if (v6 == hiddenPopoverController)
    {
      if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 8) != 0)
      {
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        id v9 = objc_loadWeakRetained((id *)&self->_svc);
        id v10 = self->_hiddenPopoverController;
        id v11 = v9;
        double v12 = [v11 masterViewController];
        [WeakRetained splitViewController:v11 popoverController:v10 willPresentViewController:v12];
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__UISplitViewControllerClassicImpl_popoverWillAppear___block_invoke;
      v13[3] = &unk_1E52D9F70;
      v13[4] = self;
      +[UIView performWithoutAnimation:v13];
    }
  }
}

void __54__UISplitViewControllerClassicImpl_popoverWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v3 = [WeakRetained masterViewController];
  id v4 = [v3 view];
  [v4 setNeedsLayout];

  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [v7 masterViewController];
  double v6 = [v5 view];
  [v6 layoutIfNeeded];
}

- (BOOL)_shouldUseRelativeInsets
{
  if (+[UIDevice _hasHomeButton]
    || ![(UISplitViewControllerClassicImpl *)self _isBasicallyHorizontallyCompact])
  {
    return 0;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained isViewLoaded])
  {
    id v5 = objc_loadWeakRetained((id *)p_svc);
    double v6 = [v5 view];
    id v7 = [v6 window];
    char v8 = [v7 _isHostedInAnotherProcess];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (![(UISplitViewControllerClassicImpl *)self _shouldUseRelativeInsets])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    [WeakRetained _contentOverlayInsets];
    double v9 = v11;
    double v7 = v12;

    [(UISplitViewControllerClassicImpl *)self _contentMarginForChildViewController:v6];
    double v8 = v13;
    *a4 = 1;
  }

  double v14 = v9;
  double v15 = v8;
  double v16 = v7;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  id v9 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _shouldUseRelativeInsets]) {
    [(UISplitViewControllerClassicImpl *)self _contentMarginForChildViewController:v9];
  }
  else {
    unint64_t v8 = 0xFFEFFFFFFFFFFFFFLL;
  }
  *(void *)a4 = v8;
  *(void *)a5 = v8;
}

- (void)_updateChildContentMargins
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = objc_msgSend(WeakRetained, "viewControllers", 0);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [(UISplitViewControllerClassicImpl *)self _contentMarginForChildViewController:v9];
        objc_msgSend(v9, "_setContentMargin:");
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (double)_contentMarginForChildViewController:(id)a3
{
  BOOL v3 = [a3 view];
  +[UIViewController _horizontalContentMarginForView:v3];
  double v5 = v4;

  return v5;
}

- (unint64_t)_lastFocusedChildViewControllerIndex
{
  if (self->_lastFocusedChildViewControllerIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v5 = [WeakRetained viewControllers];
  uint64_t v6 = [v5 count];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  lastFocusedChildViewControllerIndedouble x = self->_lastFocusedChildViewControllerIndex;
  id v8 = objc_loadWeakRetained((id *)p_svc);
  id v9 = [v8 viewControllers];
  unint64_t v10 = [v9 count] - 1;

  if (lastFocusedChildViewControllerIndex >= v10) {
    return v10;
  }
  else {
    return lastFocusedChildViewControllerIndex;
  }
}

- (id)_orderedPreferredFocusedViewControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained viewControllers];

  if (dyld_program_sdk_at_least() && (unint64_t)[v3 count] >= 2)
  {
    double v4 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    double v5 = [v3 firstObject];
    id v6 = [v4 arrayByAddingObject:v5];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)preferredFocusedView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UISplitViewControllerClassicImpl *)self _lastFocusedChildViewControllerIndex];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v6 = [WeakRetained viewControllers];
  unint64_t v7 = [v6 count];

  if (v3 >= v7)
  {
    long long v11 = 0;
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)&self->_svc);
    id v9 = [v8 viewControllers];
    unint64_t v10 = objc_msgSend(v9, "objectAtIndex:", -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex"));
    long long v11 = [v10 preferredFocusedView];

    if (v11 && (-[UIView _containsPreferredFocusableView](v11) & 1) != 0) {
      goto LABEL_18;
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = [(UISplitViewControllerClassicImpl *)self _orderedPreferredFocusedViewControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_8:
    uint64_t v16 = 0;
    double v17 = v11;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v11 = [*(id *)(*((void *)&v19 + 1) + 8 * v16) preferredFocusedView];

      if (v11)
      {
        if (-[UIView _containsPreferredFocusableView](v11)) {
          break;
        }
      }
      ++v16;
      double v17 = v11;
      if (v14 == v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:

    if (v11) {
      goto LABEL_18;
    }
    long long v12 = objc_loadWeakRetained((id *)p_svc);
    long long v11 = objc_msgSend(v12, "_super_preferredFocusedView");
  }

LABEL_18:
  return v11;
}

- (id)preferredFocusEnvironments
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(UISplitViewControllerClassicImpl *)self _lastFocusedChildViewControllerIndex];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v7 = [WeakRetained viewControllers];
  unint64_t v8 = [v7 count];

  if (v4 < v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_svc);
    unint64_t v10 = [v9 viewControllers];
    long long v11 = objc_msgSend(v10, "objectAtIndex:", -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex"));

    if (v11) {
      [v3 addObject:v11];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v12 = [(UISplitViewControllerClassicImpl *)self _orderedPreferredFocusedViewControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([v3 containsObject:v17] & 1) == 0) {
          [v3 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  id v18 = objc_loadWeakRetained((id *)p_svc);
  long long v19 = objc_msgSend(v18, "_super_preferredFocusEnvironments");
  [v3 addObjectsFromArray:v19];

  id v20 = objc_loadWeakRetained((id *)p_svc);
  long long v21 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(v20, v3, [v20 _subclassPreferredFocusedViewPrioritizationType]);

  return v21;
}

- (id)_overridingPreferredFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v3 = objc_msgSend(WeakRetained, "_super_overridingPreferredFocusEnvironment");

  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  if ([(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    char v6 = objc_msgSend(WeakRetained, "_super_shouldUpdateFocusInContext:", v4);
  }
  else
  {
    id WeakRetained = [v4 nextFocusedView];
    id v7 = objc_loadWeakRetained((id *)&self->_svc);
    unint64_t v8 = [v7 masterViewController];
    id v9 = [v8 view];
    if ([WeakRetained isDescendantOfView:v9])
    {
      id v10 = objc_loadWeakRetained((id *)&self->_svc);
      if ([v10 presentsWithGesture]) {
        char v6 = [(UISplitViewControllerClassicImpl *)self _lastFocusedChildViewControllerIndex] != 0;
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 1;
    }
  }
  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = self;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_didUpdateFocusInContext:", v4);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v8 = [v7 viewControllers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v4 nextFocusedView];
        uint64_t v15 = [v13 view];
        int v16 = [v14 isDescendantOfView:v15];

        if (v16)
        {
          id v17 = objc_loadWeakRetained((id *)p_svc);
          id v18 = [v17 viewControllers];
          v23->_lastFocusedChildViewControllerIndedouble x = [v18 indexOfObject:v13];

          id v19 = objc_loadWeakRetained((id *)p_svc);
          id v20 = [v19 masterViewController];
          if (v13 == v20 && ![(UISplitViewControllerClassicImpl *)v23 _isMasterViewShown])
          {
            id v21 = objc_loadWeakRetained((id *)p_svc);
            int v22 = [v21 presentsWithGesture];

            if (v22) {
              [(UISplitViewControllerClassicImpl *)v23 _triggerDisplayModeAction:v23];
            }
          }
          else
          {
          }
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (id)_multitaskingDragExclusionRects
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v3 = objc_msgSend(WeakRetained, "_super_multitaskingDragExclusionRects");

  return v3;
}

- (int64_t)_primaryOffscreenGestureMode
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_menuGestureRecognizer != a3) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v3 = [WeakRetained displayMode] == 1;

  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v5 = [WeakRetained _shouldUseNewStatusBarBehavior];

  id v6 = objc_loadWeakRetained((id *)p_svc);
  id v7 = v6;
  if (v5)
  {
    if ([v6 _shouldUseSeparateStatusBarStyles])
    {
      unint64_t v8 = 0;
    }
    else
    {
      uint64_t v9 = [(UISplitViewControllerClassicImpl *)self viewControllers];
      unint64_t v8 = [v9 firstObject];
    }
  }
  else
  {
    unint64_t v8 = objc_msgSend(v6, "_super_childViewControllerForStatusBarStyle");
  }

  return v8;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v5 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (!v5) {
    return 4;
  }
  id v6 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v7 = [v6 displayMode];
  unint64_t v8 = [(UISplitViewControllerClassicImpl *)self viewControllers];
  uint64_t v9 = v8;
  if (v7 == 1) {
    [v8 lastObject];
  }
  else {
  uint64_t v11 = [v8 firstObject];
  }

  long long v12 = [v11 _effectiveStatusBarStyleViewController];
  uint64_t v13 = [v12 preferredStatusBarStyle];
  if (v13 == 1) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = 2 * (v13 == 3);
  }

  return v10;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (!v4) {
    return 4;
  }
  int v5 = [(UISplitViewControllerClassicImpl *)self viewControllers];
  id v6 = [v5 lastObject];
  uint64_t v7 = [v6 _effectiveStatusBarStyleViewController];
  uint64_t v8 = [v7 preferredStatusBarStyle];
  if (v8 == 1) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 2 * (v8 == 3);
  }

  return v9;
}

- (int64_t)preferredCenterStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v4 = [WeakRetained _shouldUseSeparateStatusBarStyles];

  if (!v4) {
    return 4;
  }
  int v5 = [(UISplitViewControllerClassicImpl *)self viewControllers];
  id v6 = [v5 lastObject];
  uint64_t v7 = [v6 _effectiveStatusBarStyleViewController];
  uint64_t v8 = [v7 preferredStatusBarStyle];
  if (v8 == 1) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 2 * (v8 == 3);
  }

  return v9;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  unint64_t v3 = objc_msgSend(WeakRetained, "_super_preferredScreenEdgesDeferringSystemGestures");

  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v5 = objc_msgSend(WeakRetained, "mutableChildViewControllers", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 &= [*(id *)(*((void *)&v12 + 1) + 8 * i) shouldAutorotateToInterfaceOrientation:a3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (dyld_program_sdk_at_least() && (*((unsigned char *)&self->_splitViewControllerFlags + 1) & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    id v5 = objc_loadWeakRetained((id *)&self->_svc);
    unint64_t v4 = [WeakRetained splitViewControllerSupportedInterfaceOrientations:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    unint64_t v4 = objc_msgSend(WeakRetained, "_super_supportedInterfaceOrientations");
  }

  return v4;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  int v3 = dyld_program_sdk_at_least();
  if (v3) {
    return (*((unsigned __int8 *)&self->_splitViewControllerFlags + 1) >> 5) & 1;
  }
  return v3;
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return dyld_program_sdk_at_least();
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    id v5 = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v4 = [WeakRetained splitViewControllerPreferredInterfaceOrientationForPresentation:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v4 = objc_msgSend(WeakRetained, "_super_preferredInterfaceOrientationForPresentation");
  }

  return v4;
}

- (BOOL)_isRotating
{
  return self->_rotatingFromOrientation != 0;
}

- (int64_t)_internalModeForTraitCollection:(id)a3 orientation:(int64_t)a4 viewSize:(CGSize)a5 medusaState:(int64_t)a6
{
  id v9 = a3;
  if ([v9 horizontalSizeClass] == 1)
  {
    int64_t v10 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v12 = [WeakRetained preferredDisplayMode];

    if ((unint64_t)(v12 - 1) >= 3)
    {
      if ([v9 userInterfaceIdiom])
      {
        if ([v9 userInterfaceIdiom] == 1)
        {
          if ([(UISplitViewControllerClassicImpl *)self _hidesMasterViewInOrientation:a4 medusaState:a6])
          {
            int64_t v10 = 4;
          }
          else
          {
            int64_t v10 = 1;
          }
        }
        else
        {
          int64_t v10 = 1;
        }
      }
      else
      {
        BOOL v13 = [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayInCurrentEnvironment];
        int64_t v14 = [(UISplitViewControllerClassicImpl *)self _effectivePrimaryHidingState];
        if (v13)
        {
          if (v14 == 1)
          {
            int64_t v10 = 4;
          }
          else if ([(UISplitViewControllerClassicImpl *)self _hidesMasterViewInOrientation:a4 medusaState:a6])
          {
            int64_t v10 = 4;
          }
          else
          {
            int64_t v10 = 3;
          }
        }
        else if (v14 == 1)
        {
          int64_t v10 = 2;
        }
        else
        {
          int64_t v10 = 1;
        }
      }
    }
    else
    {
      int64_t v10 = qword_186B94518[v12 - 1];
    }
  }

  return v10;
}

- (int64_t)_prepareToTransitionToViewSize:(CGSize)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 duration:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  if ((*(unsigned char *)&self->_splitViewControllerFlags & 0x10) != 0) {
    [(UISplitViewControllerClassicImpl *)self _invalidateHidesMasterViewForAspectRatio:(unint64_t)(a5 - 1) < 2];
  }
  if (a6 > 0.0 || !self->_rotatingFromOrientation) {
    self->_rotatingFromOrientation = a4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  BOOL v13 = [WeakRetained masterViewController];
  int64_t v14 = [v13 view];

  [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
  self->_rotatingFromMasterViewFrame.origin.double x = v15;
  self->_rotatingFromMasterViewFrame.origin.CGFloat y = v16;
  self->_rotatingFromMasterViewFrame.size.double width = v17;
  self->_rotatingFromMasterViewFrame.size.double height = v18;
  if (self->_transitioningToTraitCollection) {
    goto LABEL_16;
  }
  id v19 = objc_loadWeakRetained((id *)&self->_svc);
  id v20 = [v19 _existingView];
  [v20 bounds];
  if (width != v22 || height != v21) {
    goto LABEL_15;
  }
  if ((unint64_t)(a4 - 1) <= 1)
  {
    unint64_t v23 = a5 - 1;
    goto LABEL_13;
  }
  if ((unint64_t)(a4 - 3) >= 2)
  {
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v23 = a5 - 3;
LABEL_13:

  if (v23 < 2)
  {
    int64_t v24 = 0;
    goto LABEL_75;
  }
LABEL_16:
  int64_t v25 = [(UISplitViewControllerClassicImpl *)self _medusaStateForOrientation:a5 viewWidth:width];
  transitioningToTraitCollection = self->_transitioningToTraitCollection;
  if (transitioningToTraitCollection)
  {
    long long v27 = transitioningToTraitCollection;
  }
  else
  {
    id v28 = objc_loadWeakRetained((id *)&self->_svc);
    long long v27 = [v28 traitCollection];
  }
  int64_t v29 = -[UISplitViewControllerClassicImpl _internalModeForTraitCollection:orientation:viewSize:medusaState:](self, "_internalModeForTraitCollection:orientation:viewSize:medusaState:", v27, a5, v25, width, height);
  id v30 = objc_loadWeakRetained((id *)&self->_svc);
  id v31 = [v30 traitCollection];
  uint64_t v32 = [v31 horizontalSizeClass];

  int64_t lastNotifiedDisplayMode = self->_lastNotifiedDisplayMode;
  id v69 = v27;
  if ((unint64_t)(lastNotifiedDisplayMode - 2) >= 2)
  {
    if (lastNotifiedDisplayMode == 1)
    {
      double v35 = v14;
      double v36 = [v14 superview];
      id v37 = objc_loadWeakRetained((id *)&self->_svc);
      id v38 = [v37 view];
      if (v36 == v38)
      {
        id v39 = objc_loadWeakRetained((id *)&self->_svc);
        id v40 = [v39 masterViewController];
        if (v40) {
          BOOL v34 = ((v40[94] >> 1) & 3u) - 1 < 2;
        }
        else {
          BOOL v34 = 0;
        }
      }
      else
      {
        BOOL v34 = 0;
      }

      int64_t v14 = v35;
    }
    else
    {
      BOOL v34 = 0;
    }
  }
  else
  {
    BOOL v34 = 1;
  }
  if (v29 == 4)
  {
    int v42 = 0;
    int v43 = 0;
    BOOL v44 = v32 != 1 && v34;
    BOOL v68 = v44;
    if (v34 && v32 == 1) {
      uint64_t v41 = 3;
    }
    else {
      uint64_t v41 = 0;
    }
  }
  else if (v29 == 3)
  {
    BOOL v68 = 0;
    uint64_t v41 = 0;
    int v43 = 0;
    int v42 = !v34;
  }
  else
  {
    if (v29 == 1)
    {
      BOOL v68 = 0;
      uint64_t v41 = 0;
      int v42 = !v34;
    }
    else
    {
      int v42 = 0;
      BOOL v68 = 0;
      uint64_t v41 = 0;
    }
    int v43 = 1;
  }
  id v45 = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v46 = [v45 preferredDisplayMode];

  if (!v46)
  {
    id v47 = objc_loadWeakRetained((id *)&self->_svc);
    id v48 = [v47 traitCollection];

    uint64_t v49 = [v48 userInterfaceIdiom];
    if ((v49 == 1
       || !v49
       && -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment"))&& [v48 horizontalSizeClass] != 1&& -[UITraitCollection horizontalSizeClass](v69, "horizontalSizeClass") != UIUserInterfaceSizeClassCompact)
    {
      [(UISplitViewControllerClassicImpl *)self _setPrimaryHidingStateForCurrentOrientation:0];
    }
  }
  if ((unint64_t)(v29 - 2) > 2) {
    uint64_t v50 = 2;
  }
  else {
    uint64_t v50 = qword_186B94530[v29 - 2];
  }
  [(UISplitViewControllerClassicImpl *)self _displayModeWillChangeTo:v50];
  if ((v42 | v43) == 1)
  {
    if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) == 0)
    {
      id v51 = [v14 superview];
      id v52 = objc_loadWeakRetained((id *)&self->_svc);
      long long v53 = [v52 view];
      if (v51 != v53)
      {

LABEL_58:
        if ([(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible]) {
          [(UIPopoverController *)self->_hiddenPopoverController _dismissPopoverAnimated:0 stateOnly:1 notifyDelegate:1];
        }
        id v57 = objc_loadWeakRetained((id *)&self->_svc);
        long long v58 = [v57 masterViewController];
        [v58 _setPopoverController:0];

        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __106__UISplitViewControllerClassicImpl__prepareToTransitionToViewSize_fromOrientation_toOrientation_duration___block_invoke;
        v70[3] = &unk_1E52D9F98;
        v70[4] = self;
        id v71 = v14;
        +[UIView performWithoutAnimation:v70];

        goto LABEL_61;
      }
      id v54 = objc_loadWeakRetained((id *)&self->_svc);
      [v54 masterViewController];
      id v55 = v67 = v14;
      id v56 = [v55 _popoverController];

      int64_t v14 = v67;
      if (v56) {
        goto LABEL_58;
      }
    }
LABEL_61:
    [(UIPopoverController *)self->_hiddenPopoverController _setGesturesEnabled:0];
  }
  if (v42) {
    self->_unint64_t splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x20);
  }
  if (!v68)
  {
    unint64_t splitViewControllerFlags = (unint64_t)self->_splitViewControllerFlags;
    goto LABEL_71;
  }
  id v59 = objc_loadWeakRetained((id *)&self->_svc);
  id v60 = [v59 masterViewController];
  [(UISplitViewControllerClassicImpl *)self _viewControllerHiding:v60];

  id v61 = objc_loadWeakRetained((id *)&self->_svc);
  id v62 = [v61 masterViewController];
  if (!v62)
  {
    v64 = 0;
    goto LABEL_68;
  }
  unsigned int v63 = ((v62[94] >> 1) & 3) - 1;

  if (v63 <= 1)
  {
    id v61 = objc_loadWeakRetained((id *)&self->_svc);
    v64 = [v61 masterViewController];
    -[UIViewController __viewWillDisappear:]((uint64_t)v64, 0);
LABEL_68:
  }
  unint64_t splitViewControllerFlags = *(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x60;
  uint64_t v41 = 2;
LABEL_71:
  self->_transitioningToInternalMode = v29;
  self->_unint64_t splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(splitViewControllerFlags | 0x800000000);
  if (v42) {
    int64_t v24 = 1;
  }
  else {
    int64_t v24 = v41;
  }

LABEL_75:
  return v24;
}

void __106__UISplitViewControllerClassicImpl__prepareToTransitionToViewSize_fromOrientation_toOrientation_duration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _masterViewFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v11 = [WeakRetained masterViewController];
  uint64_t v12 = [v11 view];
  objc_msgSend(v12, "setFrame:", v3, v5, v7, v9);

  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  int64_t v14 = [v13 masterViewController];
  CGFloat v15 = [v14 view];
  [v15 setAutoresizingMask:0];

  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  CGFloat v18 = [v17 masterViewController];
  id v19 = v18;
  if (v18)
  {
    __int16 v20 = v18[192];
    v18[192] = v20 | 0x100;
    [v18 setParentViewController:v16];
    v19[192] = v19[192] & 0xFEFF | v20 & 0x100;
  }

  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v21 = [v22 view];
  [v21 insertSubview:*(void *)(a1 + 40) atIndex:0];
}

- (void)_animateTransitionToOrientation:(int64_t)a3 duration:(double)a4 masterChange:(int64_t)a5
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v11 = [WeakRetained childViewControllersCount];

  if (a4 > 0.0 && v11 == 2)
  {
    [(UISplitViewControllerClassicImpl *)self snapshotForRotationFromInterfaceOrientation:self->_rotatingFromOrientation toInterfaceOrientation:a3 masterChange:a5];
    if (self->_rotationSnapshotView)
    {
      int64_t rotatingFromOrientation = self->_rotatingFromOrientation;
      if ((unint64_t)(rotatingFromOrientation - 1) >= 2)
      {
        if (((rotatingFromOrientation - 3) | (unint64_t)(a3 - 3)) >= 2) {
          goto LABEL_9;
        }
      }
      else if ((unint64_t)(a3 - 1) > 1)
      {
LABEL_9:
        int64_t v14 = objc_loadWeakRetained((id *)p_svc);
        CGFloat v15 = [v14 masterViewController];
        id v16 = [v15 view];
        [v16 setHidden:1];

LABEL_12:
        goto LABEL_13;
      }
      id v17 = objc_loadWeakRetained((id *)p_svc);
      int64_t v14 = [v17 mutableChildViewControllers];

      [v14 enumerateObjectsUsingBlock:&__block_literal_global_136];
      goto LABEL_12;
    }
  }
LABEL_13:
  id v18 = objc_loadWeakRetained((id *)p_svc);
  id v19 = [v18 _existingView];
  __int16 v20 = [v19 window];

  if (v20)
  {
    id v21 = objc_loadWeakRetained((id *)p_svc);
    id v22 = [v21 view];
    [v22 setNeedsLayout];

    id v24 = objc_loadWeakRetained((id *)p_svc);
    unint64_t v23 = [v24 view];
    [v23 layoutIfNeeded];
  }
}

void __90__UISplitViewControllerClassicImpl__animateTransitionToOrientation_duration_masterChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  [v2 setHidden:1];
}

- (void)_completeTransitionFromOrientation:(int64_t)a3 masterChange:(int64_t)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v84 = [WeakRetained mutableChildViewControllers];

  int64_t rotatingFromOrientation = self->_rotatingFromOrientation;
  self->_int64_t rotatingFromOrientation = 0;
  if (self->_rotationSnapshotView)
  {
    id v10 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v11 = [v10 interfaceOrientation];
    if ((unint64_t)(rotatingFromOrientation - 1) < 2)
    {
      unint64_t v12 = v11 - 1;

      if (v12 > 1) {
        goto LABEL_18;
      }
LABEL_7:
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v14 = v84;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v94 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v91;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v91 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = [*(id *)(*((void *)&v90 + 1) + 8 * v17) view];
            [v18 setHidden:0];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v94 count:16];
        }
        while (v15);
      }

      hiddenPopoverController = self->_hiddenPopoverController;
      if (hiddenPopoverController && (*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) != 0)
      {
        unint64_t v20 = [(UISplitViewControllerClassicImpl *)self _targetEdgeForPopover];
        id v21 = objc_loadWeakRetained((id *)p_svc);
        id v22 = [v21 view];
        [(UIPopoverController *)hiddenPopoverController _presentPopoverFromEdge:v20 ofView:v22 animated:0];

        *(void *)&self->_splitViewControllerFlags &= ~0x100uLL;
      }
      goto LABEL_19;
    }
    if ((unint64_t)(rotatingFromOrientation - 3) >= 2)
    {
    }
    else
    {
      unint64_t v13 = v11 - 3;

      if (v13 < 2) {
        goto LABEL_7;
      }
    }
LABEL_18:
    id v23 = objc_loadWeakRetained((id *)p_svc);
    id v24 = [v23 masterViewController];
    int64_t v25 = [v24 view];
    [v25 setHidden:0];

    [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    id v34 = objc_loadWeakRetained((id *)p_svc);
    double v35 = [v34 masterViewController];
    double v36 = [v35 view];
    objc_msgSend(v36, "setFrame:", v27, v29, v31, v33);

LABEL_19:
    id v37 = objc_loadWeakRetained((id *)p_svc);
    id v38 = [v37 view];
    id v39 = [v38 layer];
    [v39 setNeedsLayoutOnGeometryChange:0];

    [(UIView *)self->_rotationSnapshotView removeFromSuperview];
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = 0;

    id v41 = objc_loadWeakRetained((id *)p_svc);
    int v42 = [v41 view];
    int v43 = [v42 layer];
    [v43 setNeedsLayoutOnGeometryChange:1];
  }
  BOOL v44 = objc_loadWeakRetained((id *)p_svc);
  if (v44)
  {
    BOOL v45 = ((v44[94] >> 1) & 3u) - 1 < 2;

    if (v45)
    {
      if (a4 == 1)
      {
        uint64_t v46 = objc_loadWeakRetained((id *)p_svc);
        id v47 = v46;
        if (v46[41] || (*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) != 0)
        {
        }
        else
        {
          BOOL v48 = [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible];

          if (!v48)
          {
            id v49 = objc_loadWeakRetained((id *)p_svc);
            uint64_t v50 = [v49 masterViewController];
            objc_initWeak(&location, v50);

            v87[0] = MEMORY[0x1E4F143A8];
            v87[1] = 3221225472;
            v87[2] = __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke;
            v87[3] = &unk_1E52DC308;
            objc_copyWeak(&v88, &location);
            id v51 = objc_loadWeakRetained(&location);
            [v51 setAfterAppearanceBlock:v87];

            id v52 = (void *)UIApp;
            id v53 = objc_loadWeakRetained(&location);
            [v52 _addAfterCACommitBlockForViewController:v53];

            objc_destroyWeak(&v88);
            objc_destroyWeak(&location);
          }
        }
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        id v54 = objc_loadWeakRetained((id *)p_svc);
        uint64_t v55 = [v54 masterViewController];
        objc_initWeak(&location, (id)v55);

        id v56 = objc_loadWeakRetained(&location);
        LOBYTE(v55) = [v56 _appearState] == 0;

        if ((v55 & 1) == 0)
        {
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke_2;
          v85[3] = &unk_1E52DC308;
          objc_copyWeak(&v86, &location);
          id v57 = objc_loadWeakRetained(&location);
          [v57 setAfterAppearanceBlock:v85];

          long long v58 = (void *)UIApp;
          id v59 = objc_loadWeakRetained(&location);
          [v58 _addAfterCACommitBlockForViewController:v59];

          objc_destroyWeak(&v86);
        }
        [(UIPopoverController *)self->_hiddenPopoverController _setGesturesEnabled:1];
        objc_destroyWeak(&location);
      }
    }
  }
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) == 0
    && ![(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
  {
    goto LABEL_45;
  }
  id v60 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v61 = [v60 interfaceOrientation];
  if ((unint64_t)(a3 - 1) < 2)
  {
    BOOL v62 = (unint64_t)(v61 - 1) < 2;

    goto LABEL_38;
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    BOOL v62 = (unint64_t)(v61 - 3) < 2;

LABEL_38:
    if (v62) {
      goto LABEL_48;
    }
    goto LABEL_41;
  }

LABEL_41:
  unsigned int v63 = self->_hiddenPopoverController;
  if (v63)
  {
    if (a4)
    {
      long long v83 = [(UIPopoverController *)v63 popoverView];
      [(UIPopoverController *)self->_hiddenPopoverController _dismissPopoverAnimated:0 stateOnly:1 notifyDelegate:1];
      id v64 = objc_loadWeakRetained((id *)p_svc);
      BOOL v65 = [v64 masterViewController];
      __int16 v66 = [v65 view];
      [v83 frame];
      objc_msgSend(v66, "setFrame:");

      id v67 = objc_loadWeakRetained((id *)p_svc);
      BOOL v68 = [v67 view];
      id v69 = objc_loadWeakRetained((id *)p_svc);
      id v70 = [v69 masterViewController];
      id v71 = [v70 view];
      id v72 = objc_loadWeakRetained((id *)p_svc);
      id v73 = [v72 detailViewController];
      uint64_t v74 = [v73 view];
      [v68 insertSubview:v71 belowSubview:v74];

      id v75 = objc_loadWeakRetained((id *)p_svc);
      long long v76 = [v75 masterViewController];
      [v76 _setPopoverController:0];
    }
  }
  else
  {
    *(void *)&self->_splitViewControllerFlags &= ~0x100uLL;
  }
LABEL_45:
  id v77 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v78 = [v77 displayMode];
  uint64_t v79 = 128;
  if (v78 == 2) {
    uint64_t v79 = 64;
  }
  self->_unint64_t splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(void *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | v79);

LABEL_48:
  id v80 = objc_loadWeakRetained((id *)p_svc);
  long long v81 = [v80 view];
  [v81 setNeedsLayout];

  id v82 = objc_loadWeakRetained((id *)p_svc);
  self->_lastPresentedOrientation = [v82 interfaceOrientation];
}

void __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", 0);
}

void __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, 0);
}

- (BOOL)_isTransitioningFromCollapsedToSeparated
{
  if ((*((unsigned char *)&self->_splitViewControllerFlags + 4) & 8) == 0 || !self->_transitioningToInternalMode) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  char v3 = [WeakRetained _isCollapsed];

  return v3;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  if ([(UISplitViewControllerClassicImpl *)self _isTransitioningFromCollapsedToSeparated])
  {
    char v3 = [MEMORY[0x1E4F1CA48] array];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v5 = [WeakRetained masterViewController];

    if (v5) {
      [v3 addObject:v5];
    }
    id v6 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v7 = [v6 detailViewController];
    if (v7)
    {
      double v8 = (void *)v7;
    }
    else
    {
      double v8 = [(UISplitViewControllerClassicImpl *)self _preservedDetailController];

      if (!v8) {
        goto LABEL_10;
      }
    }
    [v3 addObject:v8];
  }
  else
  {
    double v8 = objc_loadWeakRetained((id *)&self->_svc);
    char v3 = objc_msgSend(v8, "_super_childViewControllersToSendViewWillTransitionToSize");
  }

LABEL_10:
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v9 = [WeakRetained interfaceOrientation];

  switch(v9)
  {
    case 1:
      double v10 = 0.0;
      break;
    case 3:
      double v10 = 1.57079633;
      break;
    case 4:
      double v10 = -1.57079633;
      break;
    default:
      double v10 = 3.14159265;
      if (v9 != 2) {
        double v10 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&t1, v10);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v24, &t1, &t2);
  uint64_t v11 = 0;
  float64x2_t v18 = vrndaq_f64(*(float64x2_t *)&v24.c);
  float64x2_t v19 = vrndaq_f64(*(float64x2_t *)&v24.a);
  float64x2_t v17 = vrndaq_f64(*(float64x2_t *)&v24.tx);
  while (1)
  {
    *(float64x2_t *)&v27.a = v19;
    *(float64x2_t *)&v27.c = v18;
    CGFloat v12 = 3.14159265;
    *(float64x2_t *)&v27.tdouble x = v17;
    if (v11 <= 2) {
      CGFloat v12 = dbl_186B94548[v11];
    }
    CGAffineTransformMakeRotation(&v25, v12);
    *(float64x2_t *)&v25.a = vrndaq_f64(*(float64x2_t *)&v25.a);
    *(float64x2_t *)&v25.c = vrndaq_f64(*(float64x2_t *)&v25.c);
    *(float64x2_t *)&v25.tdouble x = vrndaq_f64(*(float64x2_t *)&v25.tx);
    CGAffineTransform v26 = v25;
    if (CGAffineTransformEqualToTransform(&v27, &v26)) {
      break;
    }
    if (++v11 == 4)
    {
      uint64_t v13 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v13 = qword_186B944F8[v11];
LABEL_19:
  *(void *)&self->_splitViewControllerFlags |= 0x400000000uLL;
  objc_msgSend(v7, "transitionDuration", *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19);
  int64_t v15 = -[UISplitViewControllerClassicImpl _prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:](self, "_prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:", v9, v13, width, height, v14);
  self->_transitioningMasterChange = v15;
  *(void *)&self->_splitViewControllerFlags &= ~0x400000000uLL;
  id v16 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v16, "_super_viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  *(void *)&self->_splitViewControllerFlags &= ~0x800000000uLL;
  v20[6] = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v21[3] = &unk_1E52E9AD8;
  void v21[4] = self;
  v21[5] = v15;
  v21[6] = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v20[3] = &unk_1E52E9AD8;
  v20[4] = self;
  void v20[5] = v9;
  [v7 animateAlongsideTransition:v21 completion:v20];
}

void __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  if (a1[5] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    double v4 = [WeakRetained masterViewController];
    -[UIViewController __viewWillDisappear:]((uint64_t)v4, 0);
  }
  double v5 = (void *)a1[4];
  uint64_t v6 = a1[6];
  [v7 transitionDuration];
  objc_msgSend(v5, "_animateTransitionToOrientation:duration:masterChange:", v6, a1[5]);
}

uint64_t __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _completeTransitionFromOrientation:*(void *)(a1 + 40) masterChange:*(void *)(a1 + 48)];
  uint64_t result = [*(id *)(a1 + 32) _displayModeDidChange];
  *(void *)(*(void *)(a1 + 32) + 256) = 0;
  return result;
}

- (void)snapshotMasterView
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v47 = [WeakRetained detailViewController];

  id v5 = objc_loadWeakRetained((id *)p_svc);
  uint64_t v6 = [v5 detailViewController];
  id v7 = [v6 childModalViewController];

  if (v7)
  {
    while (1)
    {
      double v8 = [v7 presentationController];
      char v9 = [v8 shouldPresentInFullscreen];

      if (v9) {
        break;
      }
      id v10 = v7;

      id v7 = [v10 presentedViewController];

      id v47 = v10;
      if (!v7)
      {
        uint64_t v11 = v10;
        goto LABEL_6;
      }
    }
  }
  uint64_t v11 = v47;
LABEL_6:
  id v48 = v11;
  CGFloat v12 = [v11 view];
  if (!self->_rotationSnapshotView)
  {
    +[UIView setAnimationsEnabled:0];
    id v13 = objc_loadWeakRetained((id *)p_svc);
    double v14 = [v13 masterViewController];
    int64_t v15 = [v14 view];

    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    objc_msgSend(v15, "setFrame:", self->_rotatingFromMasterViewFrame.origin.x, self->_rotatingFromMasterViewFrame.origin.y, self->_rotatingFromMasterViewFrame.size.width, self->_rotatingFromMasterViewFrame.size.height);
    [v15 layoutBelowIfNeeded];
    CGAffineTransform v24 = [v15 superview];
    id v25 = objc_loadWeakRetained((id *)p_svc);
    CGAffineTransform v26 = [v25 view];
    if (v24 == v26)
    {
      BOOL v45 = v12;
      id v27 = objc_loadWeakRetained((id *)p_svc);
      double v28 = [v27 view];
      double v29 = [v28 subviews];
      uint64_t v46 = [v29 indexOfObject:v45] + 1;

      CGFloat v12 = v45;
    }
    else
    {
      uint64_t v46 = 0;
    }

    double v30 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", self->_rotatingFromMasterViewFrame.origin.x, self->_rotatingFromMasterViewFrame.origin.y, self->_rotatingFromMasterViewFrame.size.width, self->_rotatingFromMasterViewFrame.size.height);
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = &v30->super;

    double v32 = self->_rotationSnapshotView;
    id v33 = objc_loadWeakRetained((id *)p_svc);
    [v33 gutterWidth];
    -[UIView setEdgePadding:](v32, "setEdgePadding:", 0.0, 0.0, 0.0, v34);

    double v35 = self->_rotationSnapshotView;
    id v36 = objc_loadWeakRetained((id *)p_svc);
    id v37 = [v36 view];
    id v38 = [v37 backgroundColor];
    [(UIView *)v35 setEdgePaddingColor:v38];

    id v39 = self->_rotationSnapshotView;
    id v40 = objc_loadWeakRetained((id *)p_svc);
    id v41 = [v40 masterViewController];
    int v42 = [v41 view];
    [(UIView *)v39 captureSnapshotOfView:v42 withSnapshotType:self->_transitioningMasterChange != 1];

    id v43 = objc_loadWeakRetained((id *)p_svc);
    BOOL v44 = [v43 view];
    [v44 insertSubview:self->_rotationSnapshotView atIndex:v46];

    objc_msgSend(v15, "setFrame:", v17, v19, v21, v23);
    +[UIView setAnimationsEnabled:1];
    -[UIView setFrame:](self->_rotationSnapshotView, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);
  }
}

- (void)snapshotAllViews
{
  if (!self->_rotationSnapshotView)
  {
    +[UIView setAnimationsEnabled:0];
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    id v5 = [WeakRetained view];
    [v5 layoutBelowIfNeeded];

    uint64_t v6 = [UISnapshotView alloc];
    id v7 = objc_loadWeakRetained((id *)&self->_svc);
    double v8 = [v7 view];
    [v8 bounds];
    char v9 = -[UISnapshotView initWithFrame:](v6, "initWithFrame:");
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = v9;

    uint64_t v11 = self->_rotationSnapshotView;
    id v12 = objc_loadWeakRetained((id *)&self->_svc);
    id v13 = [v12 view];
    [(UIView *)v11 captureSnapshotOfView:v13 withSnapshotType:1];

    id v14 = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v15 = [v14 view];
    [v15 addSubview:self->_rotationSnapshotView];

    +[UIView setAnimationsEnabled:1];
    double v16 = self->_rotationSnapshotView;
    id v18 = objc_loadWeakRetained((id *)p_svc);
    double v17 = [v18 view];
    [v17 bounds];
    -[UIView setFrame:](v16, "setFrame:");
  }
}

- (void)snapshotForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 masterChange:(int64_t)a5
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if ([WeakRetained _isRotating])
  {
    BOOL v10 = +[UIView areAnimationsEnabled];

    if (!v10) {
      return;
    }
    id v11 = objc_loadWeakRetained((id *)p_svc);
    id v12 = [v11 view];
    id v13 = [v12 layer];
    [v13 setNeedsLayoutOnGeometryChange:0];

    if (!a5
      || (*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) != 0
      || [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
    {
      if ((unint64_t)(a3 - 1) < 2)
      {
        if ((unint64_t)(a4 - 1) > 1) {
          goto LABEL_18;
        }
LABEL_13:
        [(UISplitViewControllerClassicImpl *)self snapshotAllViews];
        if ([(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
        {
          id v14 = [(UIPopoverController *)self->_hiddenPopoverController popoverView];
          int64_t v15 = [UISnapshotView alloc];
          [v14 bounds];
          double v16 = -[UISnapshotView initWithFrame:](v15, "initWithFrame:");
          [v14 bounds];
          uint64_t v18 = v17;
          uint64_t v20 = v19;
          [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
          double v22 = v21;
          uint64_t v24 = v23;
          BOOL v25 = [(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight];
          id v26 = objc_loadWeakRetained((id *)p_svc);
          [v26 primaryColumnWidth];
          double v28 = v27;

          double v29 = -v28;
          if (!v25) {
            double v29 = v28;
          }
          double v30 = v22 + v29;
          [v14 _snapshotBounds];
          -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](v16, "captureSnapshotRect:fromView:withSnapshotType:", v14, 1);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __116__UISplitViewControllerClassicImpl_snapshotForRotationFromInterfaceOrientation_toInterfaceOrientation_masterChange___block_invoke;
          v36[3] = &unk_1E52E69B8;
          v36[4] = self;
          id v37 = v16;
          double v38 = v30;
          uint64_t v39 = v24;
          uint64_t v40 = v18;
          uint64_t v41 = v20;
          double v31 = v16;
          +[UIView performWithoutAnimation:v36];
          *(void *)&self->_splitViewControllerFlags |= 0x100uLL;
          [(UIPopoverController *)self->_hiddenPopoverController _dismissPopoverAnimated:0 stateOnly:1 notifyDelegate:0];
        }
        goto LABEL_18;
      }
      if (((a4 - 3) | (unint64_t)(a3 - 3)) < 2) {
        goto LABEL_13;
      }
    }
    else
    {
      [(UISplitViewControllerClassicImpl *)self snapshotMasterView];
    }
LABEL_18:
    id v32 = objc_loadWeakRetained((id *)p_svc);
    id v33 = [v32 view];
    float v34 = [v33 layer];
    [v34 setNeedsLayoutOnGeometryChange:1];

    return;
  }
}

uint64_t __116__UISplitViewControllerClassicImpl_snapshotForRotationFromInterfaceOrientation_toInterfaceOrientation_masterChange___block_invoke(double *a1)
{
  [*(id *)(*((void *)a1 + 4) + 56) addSubview:*((void *)a1 + 5)];
  id v2 = (void *)*((void *)a1 + 5);
  double v3 = a1[6];
  double v4 = a1[7];
  double v5 = a1[8];
  double v6 = a1[9];
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v8 = [WeakRetained view];
    [v8 size];
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_loadWeakRetained((id *)&self->_svc);
    self->_rotatingMasterChange = -[UISplitViewControllerClassicImpl _prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:](self, "_prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:", [v13 interfaceOrientation], a3, v10, v12, a4);

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = objc_loadWeakRetained((id *)&self->_svc);
    int64_t v15 = objc_msgSend(v14, "childViewControllers", 0);

    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v20 willRotateToInterfaceOrientation:a3 duration:a4];
          double v21 = [v20 view];
          [v21 layoutBelowIfNeeded];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v8 = [WeakRetained childViewControllersCount];

    id v9 = objc_loadWeakRetained((id *)&self->_svc);
    double v10 = v9;
    if (v8 == 2)
    {
      double v11 = [v9 mutableChildViewControllers];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __87__UISplitViewControllerClassicImpl_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
      v13[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
      v13[4] = a3;
      *(double *)&void v13[5] = a4;
      [v11 enumerateObjectsUsingBlock:v13];
    }
    else
    {
      double v12 = [v9 masterViewController];
      [v12 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
    }
    [(UISplitViewControllerClassicImpl *)self _animateTransitionToOrientation:a3 duration:self->_rotatingMasterChange masterChange:a4];
  }
}

uint64_t __87__UISplitViewControllerClassicImpl_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 32) duration:*(double *)(a1 + 40)];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    [(UISplitViewControllerClassicImpl *)self _completeTransitionFromOrientation:a3 masterChange:self->_rotatingMasterChange];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v6 = [WeakRetained mutableChildViewControllers];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "didRotateFromInterfaceOrientation:", a3, (void)v14);
          id v13 = [v12 view];
          [v13 setNeedsLayout];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(UISplitViewControllerClassicImpl *)self _displayModeDidChange];
    self->_rotatingMasterChange = 0;
  }
}

- (void)_updateMasterViewControllerFrame
{
  int64_t transitioningMasterChange = self->_transitioningMasterChange;
  int64_t rotatingFromOrientation = self->_rotatingFromOrientation;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  int v7 = +[UIView _degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:](UIView, "_degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:", rotatingFromOrientation, [WeakRetained interfaceOrientation]);

  [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
  self->_rotatingToMasterViewFrame.size.CGFloat height = v8;
  p_CGFloat height = &self->_rotatingToMasterViewFrame.size.height;
  self->_rotatingToMasterViewFrame.origin.double x = v10;
  self->_rotatingToMasterViewFrame.origin.CGFloat y = v11;
  self->_rotatingToMasterViewFrame.size.CGFloat width = v12;
  id v13 = objc_loadWeakRetained((id *)p_svc);
  if (![v13 _isRotating])
  {

    goto LABEL_7;
  }
  BOOL v14 = +[UIView areAnimationsEnabled];

  if (v14)
  {
    if ([(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible])
    {
      int64_t v15 = self->_rotatingFromOrientation;
      id v16 = objc_loadWeakRetained((id *)p_svc);
      uint64_t v17 = [v16 interfaceOrientation];
      if ((unint64_t)(v15 - 1) >= 2)
      {
        if ((unint64_t)(v15 - 3) >= 2)
        {

LABEL_51:
          id v74 = objc_loadWeakRetained((id *)p_svc);
          if ([v74 preferredDisplayMode])
          {

LABEL_54:
            hiddenPopoverController = self->_hiddenPopoverController;
            unint64_t v77 = [(UISplitViewControllerClassicImpl *)self _targetEdgeForPopover];
            id v78 = objc_loadWeakRetained((id *)p_svc);
            uint64_t v79 = [v78 view];
            [(UIPopoverController *)hiddenPopoverController _presentPopoverFromEdge:v77 ofView:v79 animated:1];

            goto LABEL_7;
          }
          BOOL v75 = [(UISplitViewControllerClassicImpl *)self _hidesMasterViewInCurrentOrientation];

          if (v75) {
            goto LABEL_54;
          }
          CGPoint origin = self->_rotatingToMasterViewFrame.origin;
          CGFloat width = self->_rotatingToMasterViewFrame.size.width;
          CGFloat height = self->_rotatingToMasterViewFrame.size.height;
          long long v83 = [(UIPopoverController *)self->_hiddenPopoverController popoverView];
          uint64_t v61 = v83;
          if (v83)
          {
            [v83 frame];
            uint64_t v85 = v84;
            uint64_t v87 = v86;
            v94[0] = MEMORY[0x1E4F143A8];
            v94[1] = 3221225472;
            v94[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_2;
            v94[3] = &unk_1E52E69B8;
            v94[4] = self;
            id v88 = v61;
            id v95 = v88;
            CGPoint v96 = origin;
            uint64_t v97 = v85;
            uint64_t v98 = v87;
            +[UIView performWithoutAnimation:v94];
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_3;
            v89[3] = &unk_1E52DA520;
            id v90 = v88;
            CGPoint v91 = origin;
            CGFloat v92 = width;
            CGFloat v93 = height;
            +[UIView animateWithDuration:4 delay:v89 options:0 animations:0.2 completion:0.0];
          }
LABEL_63:

          goto LABEL_7;
        }
        unint64_t v18 = v17 - 3;
      }
      else
      {
        unint64_t v18 = v17 - 1;
      }

      if (v18 >= 2) {
        goto LABEL_51;
      }
      goto LABEL_7;
    }
    if ((unint64_t)(transitioningMasterChange - 1) > 1)
    {
      id v56 = objc_loadWeakRetained((id *)p_svc);
      id v57 = [v56 masterViewController];
      long long v58 = [v57 view];
      objc_msgSend(v58, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);

      id v59 = objc_loadWeakRetained((id *)p_svc);
      id v60 = [v59 masterViewController];
      uint64_t v61 = [v60 childModalViewController];

      if (v61)
      {
        do
        {
          BOOL v62 = [v61 presentationController];
          char v63 = [v62 shouldPresentInFullscreen];

          if (v63) {
            break;
          }
          [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
          double v65 = v64;
          double v67 = v66;
          double v69 = v68;
          double v71 = v70;
          id v72 = [v61 view];
          objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

          uint64_t v73 = [v61 presentedViewController];

          uint64_t v61 = (void *)v73;
        }
        while (v73);
        goto LABEL_63;
      }
      goto LABEL_7;
    }
    if (transitioningMasterChange == 1 && v7 <= 0)
    {
      int64_t v55 = self->_rotatingFromOrientation;
      if ((unint64_t)(v55 - 3) >= 2) {
        self->_rotatingFromMasterViewFrame.origin.CGFloat y = self->_rotatingFromMasterViewFrame.origin.y
      }
                                                    + self->_rotatingFromMasterViewFrame.size.height
                                                    - self->_rotatingToMasterViewFrame.size.height;
LABEL_57:
      self->_rotatingFromMasterViewFrame.size.CGFloat width = self->_rotatingToMasterViewFrame.size.width;
      if ((unint64_t)(v55 - 1) <= 1 || (unint64_t)(v55 - 3) <= 1) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
    if (transitioningMasterChange == 2 && v7 >= 1)
    {
      if ((unint64_t)(self->_rotatingFromOrientation - 3) <= 1) {
        self->_rotatingToMasterViewFrame.origin.CGFloat y = self->_rotatingToMasterViewFrame.origin.y
      }
                                                  + self->_rotatingToMasterViewFrame.size.height
                                                  - self->_rotatingFromMasterViewFrame.size.height;
    }
    else if (transitioningMasterChange == 1)
    {
      int64_t v55 = self->_rotatingFromOrientation;
      goto LABEL_57;
    }
LABEL_59:
    p_CGFloat height = &self->_rotatingFromMasterViewFrame.size.height;
LABEL_60:
    CGFloat v80 = *p_height;
    self->_rotatingToMasterViewFrame.size.CGFloat height = *p_height;
    self->_rotatingFromMasterViewFrame.size.CGFloat height = v80;
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke;
    v100[3] = &unk_1E52D9F70;
    v100[4] = self;
    +[UIView performWithoutAnimation:v100];
  }
LABEL_7:
  id v19 = objc_loadWeakRetained((id *)p_svc);
  int v20 = [v19 _isRotating];

  if (v20 && transitioningMasterChange == 1)
  {
    if ((*(void *)&self->_splitViewControllerFlags & 0x2E0) == 0x220)
    {
      id v21 = objc_loadWeakRetained(&self->_delegate);
      id v22 = objc_loadWeakRetained((id *)p_svc);
      long long v23 = [v22 masterViewController];
      [v21 splitViewController:v22 willShowViewController:v23 invalidatingBarButtonItem:self->_barButtonItem];
    }
    id v24 = objc_loadWeakRetained((id *)p_svc);
    id v25 = v24;
    if (v24
      && ((*((_DWORD *)v24 + 94) >> 1) & 3u) - 1 <= 1
      && (*((unsigned char *)&self->_splitViewControllerFlags + 1) & 1) == 0)
    {
      BOOL v26 = [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible];

      if (v26) {
        goto LABEL_17;
      }
      id v27 = objc_loadWeakRetained((id *)p_svc);
      double v28 = [v27 masterViewController];
      [v28 setAfterAppearanceBlock:0];

      id v25 = objc_loadWeakRetained((id *)p_svc);
      double v29 = [v25 masterViewController];
      objc_msgSend(v29, "__viewWillAppear:", 0);
    }
  }
LABEL_17:
  id v30 = objc_loadWeakRetained((id *)p_svc);
  double v31 = [v30 masterViewController];

  if (v31)
  {
    id v32 = [(UIPopoverController *)self->_hiddenPopoverController contentViewController];
    if (v32 == v31)
    {
      id v33 = [v31 view];
      float v34 = [(UIPopoverController *)self->_hiddenPopoverController popoverView];
      char v35 = [v33 isDescendantOfView:v34];

      if (v35) {
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  id v36 = objc_loadWeakRetained((id *)p_svc);
  if ([v36 _isRotating] & 1) != 0 || (*((unsigned char *)&self->_splitViewControllerFlags + 1)) {
    goto LABEL_25;
  }
  BOOL v37 = [(UIPopoverController *)self->_hiddenPopoverController isPopoverVisible];

  if (!v37)
  {
    id v36 = objc_loadWeakRetained((id *)p_svc);
    double v38 = [v36 masterViewController];
    uint64_t v39 = [v38 view];
    objc_msgSend(v39, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);

LABEL_25:
  }
LABEL_26:
  if ((dyld_program_sdk_at_least() & 1) == 0
    && [(UISplitViewControllerClassicImpl *)self _layoutPrimaryOnRight]
    && [(UISplitViewControllerClassicImpl *)self _isMasterViewShown])
  {
    [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    id v46 = objc_loadWeakRetained((id *)p_svc);
    id v47 = [v46 masterViewController];
    id v48 = [v47 _popoverController];
    char v49 = [v48 isPopoverVisible];

    double v50 = 0.5;
    if ((v49 & 1) == 0)
    {
      [(UISplitViewControllerClassicImpl *)self _screenSizeInMainScene:1];
      double v50 = v51 - v43;
    }
    id v52 = objc_loadWeakRetained((id *)p_svc);
    id v53 = [v52 masterViewController];
    id v54 = [v53 view];
    objc_msgSend(v54, "setFrame:", v50, v41, v43, v45);
  }
}

void __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v3 = [WeakRetained masterViewController];
  double v4 = [v3 view];
  objc_msgSend(v4, "setFrame:", *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120), *(double *)(*(void *)(a1 + 32) + 128), *(double *)(*(void *)(a1 + 32) + 136));

  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v5 = [v7 masterViewController];
  double v6 = [v5 view];
  [v6 layoutBelowIfNeeded];
}

uint64_t __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_2(double *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 8));
  double v3 = [WeakRetained view];
  uint64_t v4 = *((void *)a1 + 5);
  id v5 = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 8));
  double v6 = [v5 detailViewController];
  id v7 = [v6 view];
  [v3 insertSubview:v4 aboveSubview:v7];

  CGFloat v8 = (void *)*((void *)a1 + 5);
  double v9 = a1[6];
  double v10 = a1[7];
  double v11 = a1[8];
  double v12 = a1[9];
  return objc_msgSend(v8, "setFrame:", v9, v10, v11, v12);
}

uint64_t __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_setDetailViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v7 = [WeakRetained detailViewController];
  CGFloat v8 = [v7 view];
  objc_msgSend(v8, "setFrame:", x, y, width, height);
}

- (void)__viewWillLayoutSubviews
{
  if (!self->_lastNotifiedDisplayMode)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    self->_int64_t lastNotifiedDisplayMode = [WeakRetained displayMode];
  }
  [(UISplitViewControllerClassicImpl *)self _setupUnderBarSeparatorView];
  if (self->_useChangingBoundsLayout)
  {
    id v4 = objc_loadWeakRetained((id *)&self->_svc);
    id v5 = [v4 detailViewController];

    if (v5)
    {
      double v6 = +[UIScreen mainScreen];
      [v6 _referenceBounds];
      double v8 = ceil(v7 * 0.666);

      double v9 = ceil(v8 * 0.6);
      id v10 = objc_loadWeakRetained((id *)&self->_svc);
      double v11 = [v10 detailViewController];
      double v12 = [v11 view];
      [v12 frame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      if (v18 >= v9 || (*(void *)&self->_splitViewControllerFlags & 0x300000) != 0x100000)
      {
        [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
        double v14 = v21;
        double v16 = v22;
        double v9 = v23;
        double v20 = v24;
      }
      -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:", v14, v16, v9, v20);
    }
    else if (self->_useChangingBoundsLayout)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__UISplitViewControllerClassicImpl___viewWillLayoutSubviews__block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      aBlock[4] = self;
      long long v58 = (void (**)(void))_Block_copy(aBlock);
      if (+[UIView areAnimationsEnabled])
      {
        +[UIView inheritedAnimationDuration];
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v58, 0);
      }
      else
      {
        v58[2](v58);
      }
      if ((*(void *)&self->_splitViewControllerFlags & 0x300000) == 0x100000)
      {
        [(UISplitViewControllerClassicImpl *)self _setCollapsedState:2];
        self->_useChangingBoundsLayout = 0;
      }

      return;
    }
  }
  id v25 = +[UIDevice currentDevice];
  if ([v25 userInterfaceIdiom])
  {
  }
  else
  {
    BOOL v26 = [(UISplitViewControllerClassicImpl *)self _iPhoneShouldUseOverlayIfRegularWidth];

    if (!v26)
    {
      uint64_t v59 = *(void *)&self->_splitViewControllerFlags & 0x300000;
      [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      id v68 = objc_loadWeakRetained((id *)&self->_svc);
      double v69 = [v68 masterViewController];
      double v70 = [v69 view];
      objc_msgSend(v70, "setFrame:", v61, v63, v65, v67);

      if (self->_collapsingMasterSnapshotView && !self->_collapsingDetailSnapshotView)
      {
        [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
        -[UISnapshotView setFrame:](self->_collapsingMasterSnapshotView, "setFrame:");
      }
      if (v59 != 0x200000)
      {
        [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
        -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:");
      }
      return;
    }
  }
  if (!self->_lastPresentedOrientation
    || self->_rotatingFromOrientation
    || (id v27 = objc_loadWeakRetained((id *)&self->_svc),
        uint64_t v28 = [v27 interfaceOrientation],
        int64_t lastPresentedOrientation = self->_lastPresentedOrientation,
        v27,
        v28 == lastPresentedOrientation))
  {
    int v30 = 0;
  }
  else
  {
    self->_int64_t rotatingFromOrientation = self->_lastPresentedOrientation;
    double v71 = objc_loadWeakRetained((id *)&self->_svc);
    [(UISplitViewControllerClassicImpl *)self willRotateToInterfaceOrientation:v71[33] duration:0.0];

    id v72 = objc_loadWeakRetained((id *)&self->_svc);
    [(UISplitViewControllerClassicImpl *)self willAnimateRotationToInterfaceOrientation:v72[33] duration:0.0];

    int v30 = 1;
  }
  p_svc = &self->_svc;
  id v32 = objc_loadWeakRetained((id *)&self->_svc);
  id v33 = [v32 masterViewController];
  float v34 = [v33 _popoverController];
  if (([v34 isPopoverVisible] & 1) == 0)
  {

    if (!v30) {
      goto LABEL_23;
    }
LABEL_21:
    if ((*(void *)&self->_splitViewControllerFlags & 0x2E0) == 0x220)
    {
      id v37 = objc_loadWeakRetained(&self->_delegate);
      id v38 = objc_loadWeakRetained((id *)&self->_svc);
      uint64_t v39 = [v38 masterViewController];
      [v37 splitViewController:v38 willShowViewController:v39 invalidatingBarButtonItem:self->_barButtonItem];
    }
    goto LABEL_23;
  }
  id v35 = objc_loadWeakRetained((id *)&self->_svc);
  int v36 = [v35 _isRotating];

  if (!v36) {
    goto LABEL_24;
  }
  if (v30) {
    goto LABEL_21;
  }
LABEL_23:
  [(UISplitViewControllerClassicImpl *)self _updateMasterViewControllerFrame];
LABEL_24:
  if (v30)
  {
    [(UISplitViewControllerClassicImpl *)self didRotateFromInterfaceOrientation:self->_lastPresentedOrientation];
    self->_int64_t rotatingFromOrientation = 0;
    id v40 = objc_loadWeakRetained((id *)&self->_svc);
    self->_int64_t lastPresentedOrientation = [v40 interfaceOrientation];
  }
  [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
  double v45 = v41;
  double v46 = v42;
  double v47 = v43;
  double v48 = v44;
  if (!self->_useChangingBoundsLayout) {
    -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:", v41, v42, v43, v44);
  }
  id v49 = objc_loadWeakRetained((id *)&self->_svc);
  int v50 = [v49 _isRotating];

  if (v50)
  {
    id v51 = objc_loadWeakRetained((id *)p_svc);
    id v52 = [v51 detailViewController];
    id v73 = [v52 childModalViewController];

    id v53 = v73;
    if (v73)
    {
      while (1)
      {
        id v54 = objc_msgSend(v53, "presentationController", v53);
        char v55 = [v54 shouldPresentInFullscreen];

        if (v55) {
          break;
        }
        id v56 = [v74 view];
        objc_msgSend(v56, "setFrame:", v45, v46, v47, v48);

        uint64_t v57 = [v74 presentedViewController];

        id v53 = (void *)v57;
        if (!v57) {
          goto LABEL_44;
        }
      }
      id v53 = v74;
LABEL_44:
    }
  }
}

void *__60__UISplitViewControllerClassicImpl___viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _masterViewFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  double v11 = [WeakRetained masterViewController];
  objc_msgSend(v11, "_updateControlledViewsToFrame:", v3, v5, v7, v9);

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(v12 + 72);
  if (result && *(void *)(v12 + 80))
  {
    [result frame];
    double v15 = v14;
    double v17 = v16;
    if ([*(id *)(a1 + 32) _layoutPrimaryOnRight])
    {
      v27.origin.double x = v3;
      v27.origin.double y = v5;
      v27.size.double width = v7;
      v27.size.double height = v9;
      double MaxX = CGRectGetMaxX(v27);
    }
    else
    {
      double MaxX = v3 - v15;
    }
    double v19 = v17 + 50.0;
    double v20 = *(void **)(a1 + 32);
    uint64_t v21 = v20[42];
    int v22 = [v20 _layoutPrimaryOnRight];
    unint64_t v23 = (unint64_t)(v21 & 0x80000000) >> 31;
    if (v22) {
      LODWORD(v23) = (int)v21 >= 0;
    }
    double v24 = v5;
    if (v23 == 1)
    {
      v28.origin.double x = v3;
      v28.origin.double y = v5;
      v28.size.double width = v7;
      v28.size.double height = v9;
      double v24 = CGRectGetMaxY(v28) - v19;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setFrame:", MaxX, v24, v15, v19);
    id v25 = *(void **)(*(void *)(a1 + 32) + 80);
    return objc_msgSend(v25, "setFrame:", v3, v5, v7, v9);
  }
  return result;
}

- (void)viewDidLayoutSubviews
{
  double v3 = [(UISplitViewControllerClassicImpl *)self _masterFocusContainerGuide];

  if (v3)
  {
    double v4 = [(UISplitViewControllerClassicImpl *)self _masterFocusContainerGuide];
    [(UISplitViewControllerClassicImpl *)self _masterViewFrame];
    objc_msgSend(v4, "_setManualLayoutFrame:");
  }
  double v5 = [(UISplitViewControllerClassicImpl *)self _detailFocusContainerGuide];

  if (v5)
  {
    id v6 = [(UISplitViewControllerClassicImpl *)self _detailFocusContainerGuide];
    [(UISplitViewControllerClassicImpl *)self _detailViewFrame];
    objc_msgSend(v6, "_setManualLayoutFrame:");
  }
}

- (void)_getRotationContentSettings:(id *)a3
{
  double v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5) {
    int v6 = 14;
  }
  else {
    int v6 = 15;
  }
  a3->var6 = v6;
}

- (int64_t)_medusaState
{
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  uint64_t v5 = [WeakRetained interfaceOrientation];
  id v6 = objc_loadWeakRetained((id *)p_svc);
  double v7 = [v6 view];
  [v7 bounds];
  int64_t v9 = [(UISplitViewControllerClassicImpl *)self _medusaStateForOrientation:v5 viewWidth:v8];

  return v9;
}

- (int64_t)_medusaStateForOrientation:(int64_t)a3 viewWidth:(double)a4
{
  double v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    p_svc = &self->_svc;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    double v11 = [WeakRetained _screen];

    id v12 = objc_loadWeakRetained((id *)p_svc);
    double v13 = [v12 _window];

    double v14 = [v13 _windowHostingScene];
    char v15 = [v14 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

    if (v15) {
      goto LABEL_15;
    }
    [v11 _boundsForInterfaceOrientation:a3];
    double v17 = v16;
    double v19 = v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 bounds];
      double v21 = v20;
      double v23 = v22;
      uint64_t v24 = [v13 interfaceOrientation];
      if (a3
        && v24
        && (unint64_t)a3 < 3 != (unint64_t)([v13 interfaceOrientation] - 1) < 2)
      {
        double v21 = v23;
      }
    }
    else
    {
      BOOL v26 = [v13 _windowHostingScene];
      if (v26)
      {
        CGRect v27 = [v13 _windowHostingScene];
        [v27 _boundsForInterfaceOrientation:a3];
        double v21 = v28;
      }
      else
      {
        [v11 _boundsForInterfaceOrientation:a3];
        double v21 = v29;
      }
    }
    if (v21 >= v17)
    {
LABEL_15:
      int64_t v25 = 0;
LABEL_16:

      return v25;
    }
    double v31 = fmax(v17, v19);
    if (v31 > 1210.0)
    {
      if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL && v17 * 0.3 < a4 && v17 * 0.5 >= a4)
      {
        int64_t v25 = 1;
        goto LABEL_16;
      }
    }
    else if (v31 <= 1112.0 && (unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL && v17 * 0.5 < a4)
    {
      int64_t v25 = 2;
      goto LABEL_16;
    }
    int64_t v25 = 3;
    goto LABEL_16;
  }
  return 0;
}

- (id)_allContainedViewControllers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v3 = [WeakRetained viewControllers];

  return v3;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  double v7 = [WeakRetained viewControllers];

  _UISaveReferencedChildViewControllers(v7, 0);
  id v8 = objc_loadWeakRetained((id *)p_svc);
  int64_t v9 = [v8 _window];

  if (v9) {
    uint64_t v10 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v9];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v11, "displayMode"), @"SplitViewControllerDisplayMode");

  [v4 encodeInteger:v10 forKey:@"SplitViewInterfaceOrientation"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v18 = [v17 _restorationIdentifierPath];

        if (!v18)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SViewControlle.isa, "-[UISplitViewControllerClassicImpl encodeRestorableStateWithCoder:]", v17, (void)v19);
          }
          [(id)UIApp ignoreSnapshotOnNextApplicationLaunch];
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v6 = [WeakRetained _window];

  if (v6) {
    uint64_t v7 = [(id)UIApp _sceneInterfaceOrientationFromWindow:v6];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = +[UIDevice currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIApplicationStateRestorationUserInterfaceIdiom"];
  if (v9 == (int)[v10 intValue])
  {
    id v11 = objc_loadWeakRetained((id *)&self->_svc);
    [v11 displayMode];

    if (v9 == 1) {
      int v12 = [v4 decodeBoolForKey:@"SplitViewControllerShowingMasterView"];
    }
    else {
      int v12 = 0;
    }
    if ([v4 containsValueForKey:@"SplitViewControllerDisplayMode"]
      && [v4 containsValueForKey:@"SplitViewInterfaceOrientation"])
    {
      if ([v4 decodeIntegerForKey:@"SplitViewInterfaceOrientation"] != v7) {
        goto LABEL_36;
      }
      uint64_t v18 = [v4 decodeIntegerForKey:@"SplitViewControllerDisplayMode"];
    }
    else
    {
      if ((unint64_t)(v7 - 1) < 2) {
        int v19 = v12;
      }
      else {
        int v19 = 0;
      }
      if (v19 != 1) {
        goto LABEL_36;
      }
      uint64_t v18 = 3;
    }
    id v20 = objc_loadWeakRetained((id *)&self->_svc);
    uint64_t v21 = [v20 displayMode];

    if (v18 != v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_svc);
      if ([v22 isViewLoaded])
      {
        id v23 = objc_loadWeakRetained((id *)&self->_svc);
        uint64_t v24 = [v23 view];
        int64_t v25 = [v24 window];

        if (v25)
        {
          [(UISplitViewControllerClassicImpl *)self _changeToDisplayMode:v18 forCurrentOrientationOnly:1];
          goto LABEL_36;
        }
      }
      else
      {
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__UISplitViewControllerClassicImpl_decodeRestorableStateWithCoder___block_invoke;
      block[3] = &unk_1E52D9CD0;
      block[4] = self;
      void block[5] = v18;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    if (v9) {
      uint64_t v13 = @"Unspecified";
    }
    else {
      uint64_t v13 = @"iPhone";
    }
    if (v9 == 1) {
      uint64_t v13 = @"iPad";
    }
    uint64_t v14 = v13;
    uint64_t v15 = [v10 integerValue];
    if (v15) {
      double v16 = @"Unspecified";
    }
    else {
      double v16 = @"iPhone";
    }
    if (v15 == 1) {
      double v16 = @"iPad";
    }
    double v17 = v16;
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SSkippingCheck.isa, "-[UISplitViewControllerClassicImpl decodeRestorableStateWithCoder:]", v14, v17);
    }
  }
LABEL_36:
}

void __67__UISplitViewControllerClassicImpl_decodeRestorableStateWithCoder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if ([WeakRetained isViewLoaded])
  {
    id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    double v3 = [v2 view];
    id v4 = [v3 window];

    if (v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      [v5 _changeToDisplayMode:v6 forCurrentOrientationOnly:1];
    }
  }
  else
  {
  }
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  v12[2] = *MEMORY[0x1E4F143B8];
  p_svc = &self->_svc;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  id v4 = [WeakRetained viewControllers];

  uint64_t v5 = [v4 count];
  if (v5 == 2)
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:1];
    v12[0] = v7;
    id v8 = [v4 objectAtIndexedSubscript:0];
    v12[1] = v8;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  else if (v5 == 1)
  {
    id v6 = v4;
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)p_svc);
    uint64_t v10 = [v9 viewControllers];
    NSLog(&cfstr_SWarningChecki.isa, "-[UISplitViewControllerClassicImpl _additionalViewControllersToCheckForUserActivity]", v10);

    id v6 = 0;
  }

  return v6;
}

- (id)_effectiveActivityItemsConfiguration
{
  id v2 = [(UISplitViewControllerClassicImpl *)self viewControllers];
  double v3 = [v2 lastObject];
  id v4 = [v3 _effectiveActivityItemsConfiguration];

  return v4;
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  return 0;
}

- (int64_t)primaryBackgroundStyle
{
  return 0;
}

- (BOOL)_shouldShowNSToolbarSidebarToggle
{
  return 1;
}

- (int64_t)style
{
  return 0;
}

- (BOOL)lockedForDelegateCallback
{
  return 0;
}

- (BOOL)_isAnimating
{
  return 0;
}

- (double)_primaryDividerPosition
{
  return 0.0;
}

- (double)_supplementaryDividerPosition
{
  return 0.0;
}

- (id)_deepestActionResponder
{
  id v2 = [(UISplitViewControllerClassicImpl *)self viewControllers];
  double v3 = [v2 lastObject];

  return v3;
}

- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3
{
  id v4 = a3;
  if (![(UISplitViewControllerClassicImpl *)self isCollapsed]
    && ([(UISplitViewControllerClassicImpl *)self detailViewController],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v4))
  {
    id v6 = [(UISplitViewControllerClassicImpl *)self masterViewController];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UISplitViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return (UISplitViewControllerDelegate *)WeakRetained;
}

- (BOOL)presentsWithGesture
{
  return self->_presentsWithGesture;
}

- (NSString)_displayModeButtonItemTitle
{
  return self->_displayModeButtonItemTitle;
}

- (double)preferredPrimaryColumnWidthFraction
{
  return self->_preferredPrimaryColumnWidthFraction;
}

- (double)minimumPrimaryColumnWidth
{
  return self->_minimumPrimaryColumnWidth;
}

- (double)maximumPrimaryColumnWidth
{
  return self->_maximumPrimaryColumnWidth;
}

- (UIViewController)_preservedDetailController
{
  return self->__preservedDetailController;
}

- (void)_setPreservedDetailController:(id)a3
{
}

- (id)_clearPreventRotationHook
{
  return self->__clearPreventRotationHook;
}

- (void)_setClearPreventRotationHook:(id)a3
{
}

- (UIFocusContainerGuide)_masterFocusContainerGuide
{
  return self->_masterFocusContainerGuide;
}

- (UIFocusContainerGuide)_detailFocusContainerGuide
{
  return self->_detailFocusContainerGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_masterFocusContainerGuide, 0);
  objc_storeStrong(&self->__clearPreventRotationHook, 0);
  objc_storeStrong((id *)&self->__preservedDetailController, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItemTitle, 0);
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_popoverPresentationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_traitCollectionWhenRemovedFromWindow, 0);
  objc_storeStrong((id *)&self->_underBarSeparatorView, 0);
  objc_storeStrong((id *)&self->_collapsingDetailSnapshotView, 0);
  objc_storeStrong((id *)&self->_collapsingMasterSnapshotView, 0);
  objc_storeStrong((id *)&self->_postTransitionResponder, 0);
  objc_storeStrong((id *)&self->_rotationSnapshotView, 0);
  objc_storeStrong((id *)&self->_hiddenPopoverController, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItem, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_svc);
}

@end