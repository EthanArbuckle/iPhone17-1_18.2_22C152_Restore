@interface SBDynamicFlashlightActivityElement
- (BOOL)_canShowWhileLocked;
- (BOOL)hasActivityBehavior;
- (BOOL)inhibitSystemLongPressGesture;
- (BOOL)inhibitSystemPanGesture;
- (BOOL)isExpanding;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isPreviewing;
- (BOOL)isProminent;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)isUrgent;
- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)shouldRemainActiveWhileFlashlightIsOff;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (CGRect)_frameForContentViewInContainerView:(id)a3;
- (CGSize)intrinsicCompactContainerSize;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)coverSheetIdentifier;
- (NSString)elementIdentifier;
- (SAActivityHosting)activityHost;
- (SAElementHosting)elementHost;
- (SAUILayoutHosting)layoutHost;
- (SBDynamicFlashlightActivityElement)initWithState:(id)a3 coverSheetViewController:(id)a4 fixedWidth:(BOOL)a5;
- (SBDynamicFlashlightActivityElementDelegate)delegate;
- (SBDynamicFlashlightState)flashlightState;
- (SBSystemApertureGestureHandling)gestureHandler;
- (SBSystemAperturePlatformElementHosting)platformElementHost;
- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider;
- (SBUISystemApertureTextContentProvider)trailingTextProvider;
- (UIColor)keyColor;
- (UIView)customView;
- (UIView)leadingView;
- (UIView)trailingView;
- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4;
- (id)_leadingPackageStateForState:(id)a3;
- (id)_textColorForState:(id)a3;
- (id)_trailingTextForState:(id)a3;
- (int64_t)elementOrientation;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)preferredLayoutMode;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (int64_t)systemApertureCustomLayout;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (unint64_t)obstructionEdge;
- (unint64_t)restrictedCapabilities;
- (void)_alertingAssertionDidInvalidate:(id)a3 withReason:(id)a4;
- (void)_layoutContentViewInContainerView:(id)a3;
- (void)_setCustomViewExpanded:(BOOL)a3;
- (void)_setupContentViewInContainerView:(id)a3;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)dealloc;
- (void)dynamicFlashlightViewControllerCancelSystemApertureGestureHandlers;
- (void)dynamicFlashlightViewControllerDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
- (void)dynamicFlashlightViewControllerDidChangePreferredContentRect;
- (void)dynamicFlashlightViewControllerDidToggleFlashlight;
- (void)dynamicFlashlightViewControllerShouldDismiss;
- (void)dynamicFlashlightViewControllerUpdatePersistedIntensity:(double)a3 width:(double)a4;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)pop;
- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3;
- (void)setActivityHost:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementHost:(id)a3;
- (void)setExpanding:(BOOL)a3;
- (void)setFlashlightState:(id)a3;
- (void)setGestureHandler:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setObstructionEdge:(unint64_t)a3;
- (void)setPlatformElementHost:(id)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setProminent:(BOOL)a3;
- (void)setUrgent:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)shouldRemainActiveWhileFlashlightIsOff;
- (void)takeAlertingAssertionWithReason:(id)a3;
@end

@implementation SBDynamicFlashlightActivityElement

- (void)dealloc
{
  if ([(SAAutomaticallyInvalidatable *)self->_alertingAssertion isValid]) {
    [(SAAutomaticallyInvalidatable *)self->_alertingAssertion invalidateWithReason:@"Dynamic flashlight dealloc"];
  }
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalBehaviorProvider:self];
  [(PTSettings *)self->_flashlightSettings removeKeyPathObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDynamicFlashlightActivityElement;
  [(SBDynamicFlashlightActivityElement *)&v3 dealloc];
}

- (SBDynamicFlashlightActivityElement)initWithState:(id)a3 coverSheetViewController:(id)a4 fixedWidth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SBDynamicFlashlightActivityElement;
  v10 = [(SBDynamicFlashlightActivityElement *)&v33 init];
  v11 = v10;
  if (v10)
  {
    v10->_preferredLayoutMode = 2;
    uint64_t v12 = +[SBDynamicFlashlightDomain rootSettings];
    flashlightSettings = v11->_flashlightSettings;
    v11->_flashlightSettings = (SBDynamicFlashlightSettings *)v12;

    [(PTSettings *)v11->_flashlightSettings addKeyPathObserver:v11];
    id v14 = objc_alloc(MEMORY[0x1E4FA7D68]);
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v14 initWithPackageName:@"Flashlight-Leading-D83" inBundle:v15];
    leadingPackageViewProvider = v11->_leadingPackageViewProvider;
    v11->_leadingPackageViewProvider = (SBUISystemApertureCAPackageContentProvider *)v16;

    -[SBUISystemApertureCAPackageContentProvider setIntrinsicPackageSize:](v11->_leadingPackageViewProvider, "setIntrinsicPackageSize:", 36.6666667, 36.6666667);
    v18 = v11->_leadingPackageViewProvider;
    v19 = [(SBDynamicFlashlightActivityElement *)v11 _leadingPackageStateForState:v8];
    [(SBUISystemApertureCAPackageContentProvider *)v18 setState:v19 animated:0];

    id v20 = objc_alloc(MEMORY[0x1E4FA7DB0]);
    v21 = [(SBDynamicFlashlightActivityElement *)v11 _trailingTextForState:v8];
    uint64_t v22 = [v20 initWithText:v21 style:4];
    trailingTextProvider = v11->_trailingTextProvider;
    v11->_trailingTextProvider = (SBUISystemApertureTextContentProvider *)v22;

    v24 = v11->_trailingTextProvider;
    v25 = [(SBDynamicFlashlightActivityElement *)v11 _textColorForState:v8];
    [(SBUISystemApertureTextContentProvider *)v24 setContentColor:v25];

    v26 = [[SBDynamicFlashlightActivityElementViewController alloc] initWithOptionsProvider:v11->_flashlightSettings state:v8 fixedWidth:v5];
    elementViewController = v11->_elementViewController;
    v11->_elementViewController = v26;

    [(SBDynamicFlashlightActivityElementViewController *)v11->_elementViewController setDelegate:v11];
    [(SBDynamicFlashlightActivityElementViewController *)v11->_elementViewController setPanEnabled:0];
    uint64_t v28 = +[SBDynamicFlashlightState offState];
    flashlightState = v11->_flashlightState;
    v11->_flashlightState = (SBDynamicFlashlightState *)v28;

    uint64_t v30 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v11);
    previewingCoordinator = v11->_previewingCoordinator;
    v11->_previewingCoordinator = (SBSystemActionElementPreviewingCoordinator *)v30;

    objc_storeStrong((id *)&v11->_coverSheetViewController, a4);
    [(CSCoverSheetViewController *)v11->_coverSheetViewController registerExternalBehaviorProvider:v11];
  }

  return v11;
}

- (void)setFlashlightState:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(SBDynamicFlashlightState *)self->_flashlightState isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_flashlightState, a3);
    [(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController setState:v5];
    v6 = [(SBDynamicFlashlightActivityElement *)self _leadingPackageStateForState:v5];
    v7 = [(SBDynamicFlashlightActivityElement *)self leadingPackageViewProvider];
    [v7 setState:v6 animated:1];

    id v8 = [(SBDynamicFlashlightActivityElement *)self _trailingTextForState:v5];
    id v9 = [(SBDynamicFlashlightActivityElement *)self _textColorForState:v5];
    v10 = [(SBDynamicFlashlightActivityElement *)self trailingTextProvider];
    [v10 swapInText:v8 textColor:v9];

    if ([(SBDynamicFlashlightActivityElement *)self layoutMode] == 3)
    {
      v11 = [(SBDynamicFlashlightActivityElement *)self customView];
      uint64_t v12 = [v11 superview];

      if (v12) {
        [(SBDynamicFlashlightActivityElement *)self layoutHostContainerViewDidLayoutSubviews:v12];
      }
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = @"SBSystemApertureNotificationUserInfoElementKey";
    v16[0] = self;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v13 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v14];
  }
}

- (BOOL)shouldRemainActiveWhileFlashlightIsOff
{
  objc_super v3 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(SBDynamicFlashlightActivityElement *)(uint64_t)self shouldRemainActiveWhileFlashlightIsOff];
  }

  if (self->_layoutMode == 3) {
    return ![(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController shouldDismissWhenOff];
  }
  else {
    return 0;
  }
}

- (NSString)elementIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    [(SBUISystemApertureCAPackageContentProvider *)self->_leadingPackageViewProvider setContentContainer:self];
    v4 = [(SBUISystemApertureCAPackageContentProvider *)self->_leadingPackageViewProvider providedView];
    id v5 = self->_leadingView;
    self->_leadingView = v4;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    [(SBUISystemApertureTextContentProvider *)self->_trailingTextProvider setContentContainer:self];
    v4 = [(SBUISystemApertureTextContentProvider *)self->_trailingTextProvider providedView];
    id v5 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (UIView)customView
{
  return (UIView *)[(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController view];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_int64_t layoutMode = a3;
    if (a3 == 3)
    {
      coverSheetViewController = self->_coverSheetViewController;
      -[CSCoverSheetViewController externalBehaviorProviderBehaviorChanged:](coverSheetViewController, "externalBehaviorProviderBehaviorChanged:", self, a4);
    }
    else if (layoutMode == 3)
    {
      if ([(SAAutomaticallyInvalidatable *)self->_alertingAssertion isValid])
      {
        [(SAAutomaticallyInvalidatable *)self->_alertingAssertion invalidateWithReason:@"Dynamic flashlight element collapsed layout"];
        alertingAssertion = self->_alertingAssertion;
        self->_alertingAssertion = 0;
      }
      [(CSCoverSheetViewController *)self->_coverSheetViewController externalBehaviorProviderBehaviorChanged:self];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dynamicFlashlightActivityElementDidCollapse];
    }
  }
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  if (a3 == 3)
  {
    [(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController preferredContentRect];
    double v7 = v6;
    double v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", v7, v9);
    CGFloat top = v11;
    CGFloat leading = v13;
    CGFloat bottom = v15;
    CGFloat trailing = v17;
  }
  else
  {
    CGFloat trailing = a4.trailing;
    CGFloat bottom = a4.bottom;
    CGFloat leading = a4.leading;
    CGFloat top = a4.top;
  }
  double v19 = top;
  double v20 = leading;
  double v21 = bottom;
  double v22 = trailing;
  result.CGFloat trailing = v22;
  result.CGFloat bottom = v21;
  result.CGFloat leading = v20;
  result.CGFloat top = v19;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  elementViewController = self->_elementViewController;
  id v5 = a3;
  [(SBDynamicFlashlightActivityElementViewController *)elementViewController setElementOrientation:[(SBDynamicFlashlightActivityElement *)self elementOrientation]];
  [(SBDynamicFlashlightActivityElement *)self _layoutContentViewInContainerView:v5];
}

- (void)_layoutContentViewInContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDynamicFlashlightActivityElement *)self customView];
  [(SBDynamicFlashlightActivityElement *)self _frameForContentViewInContainerView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  if ((unint64_t)(self->_layoutMode - 1) >= 2) {
    double v14 = 0.0;
  }
  else {
    double v14 = 1.0;
  }
  [(UIView *)self->_leadingView setAlpha:v14];
  [(UIView *)self->_trailingView setAlpha:v14];
  double v15 = [(SBDynamicFlashlightActivityElement *)self customView];
  uint64_t v16 = v15;
  if (self->_layoutMode >= 3) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  [v15 setAlpha:v17];

  if ([(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController isExpanded]
    || self->_layoutMode != 3)
  {
    if (![(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController isExpanded]
      || self->_layoutMode == 3)
    {
      return;
    }
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  [(SBDynamicFlashlightActivityElement *)self _setCustomViewExpanded:v18];
}

- (CGRect)_frameForContentViewInContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDynamicFlashlightActivityElement *)self customView];
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v7 = v6;
  double v9 = v8;

  double v11 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v4)
  {
    [v4 bounds];
    UIRectCenteredIntegralRectScale();
    double v11 = v12;
    double v10 = v13;
    double v7 = v14;
    double v9 = v15;
  }

  double v16 = v11;
  double v17 = v10;
  double v18 = v7;
  double v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  return self->_leadingView == a3;
}

- (void)_setCustomViewExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBDynamicFlashlightActivityElementViewController setExpanded:](self->_elementViewController, "setExpanded:");
  elementViewController = self->_elementViewController;
  [(SBDynamicFlashlightActivityElementViewController *)elementViewController setPanEnabled:v3];
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(SBDynamicFlashlightActivityElementViewController *)self->_elementViewController setElementOrientation:[(SBDynamicFlashlightActivityElement *)self elementOrientation]];
  double v9 = (void *)MEMORY[0x1E4F42FF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v16[3] = &unk_1E6AF5290;
  v16[4] = self;
  id v10 = v7;
  id v17 = v10;
  [v9 _performWithoutRetargetingAnimations:v16];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E6B087B8;
  objc_copyWeak(&v14, &location);
  id v11 = v10;
  id v13 = v11;
  [v8 animateAlongsideTransition:v12 completion:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupContentViewInContainerView:*(void *)(a1 + 40)];
}

void __112__SBDynamicFlashlightActivityElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _layoutContentViewInContainerView:*(void *)(a1 + 32)];
    BOOL v3 = [v5 customView];
    [v3 setNeedsLayout];

    id v4 = [v5 customView];
    [v4 layoutIfNeeded];

    id WeakRetained = v5;
  }
}

- (void)_setupContentViewInContainerView:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [(SBDynamicFlashlightActivityElement *)self customView];
    char v5 = [v4 isDescendantOfView:v7];

    if ((v5 & 1) == 0)
    {
      double v6 = [(SBDynamicFlashlightActivityElement *)self customView];
      [v7 insertSubview:v6 atIndex:0];
    }
  }
}

- (void)takeAlertingAssertionWithReason:(id)a3
{
  id v4 = a3;
  char v5 = [(SBDynamicFlashlightActivityElement *)self activityHost];
  double v6 = [v5 alertWithReason:v4 implicitlyDismissable:1];
  if (v6 != self->_alertingAssertion)
  {
    objc_storeStrong((id *)&self->_alertingAssertion, v6);
    objc_initWeak(&location, self);
    alertingAssertion = self->_alertingAssertion;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBDynamicFlashlightActivityElement_takeAlertingAssertionWithReason___block_invoke;
    v8[3] = &unk_1E6AFFF18;
    objc_copyWeak(&v9, &location);
    [(SAAutomaticallyInvalidatable *)alertingAssertion addInvalidationBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __70__SBDynamicFlashlightActivityElement_takeAlertingAssertionWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _alertingAssertionDidInvalidate:v6 withReason:v5];
}

- (void)_alertingAssertionDidInvalidate:(id)a3 withReason:(id)a4
{
  id v5 = (SAAutomaticallyInvalidatable *)a3;
  if (self->_alertingAssertion == v5)
  {
    self->_alertingAssertion = 0;
    id v6 = v5;

    id v5 = v6;
  }
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
}

- (CGSize)intrinsicCompactContainerSize
{
  v2 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  [v2 maximumLeadingTrailingViewSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)keyColor
{
  return (UIColor *)[(SBDynamicFlashlightActivityElement *)self _textColorForState:self->_flashlightState];
}

- (void)setObstructionEdge:(unint64_t)a3
{
  if (self->_obstructionEdge != a3)
  {
    self->_obstructionEdge = a3;
    elementViewController = self->_elementViewController;
    int64_t v4 = [(SBDynamicFlashlightActivityElement *)self elementOrientation];
    [(SBDynamicFlashlightActivityElementViewController *)elementViewController setElementOrientation:v4];
  }
}

- (int64_t)elementOrientation
{
  unint64_t v2 = [(SBDynamicFlashlightActivityElement *)self obstructionEdge];
  if (v2 > 3) {
    return 1;
  }
  else {
    return qword_1D8FD2830[v2];
  }
}

- (int64_t)systemApertureCustomLayout
{
  return 4;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  int64_t v3 = [(SBDynamicFlashlightActivityElement *)self isProminent];
  if ([(SBDynamicFlashlightActivityElement *)self isPreviewing]) {
    return v3;
  }
  else {
    return v3 | 2;
  }
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return self->_leadingView == a3;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)pop
{
}

- (BOOL)inhibitSystemPanGesture
{
  return self->_layoutMode == 3;
}

- (BOOL)inhibitSystemLongPressGesture
{
  return self->_layoutMode == 3;
}

- (void)dynamicFlashlightViewControllerDidChangeIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  [(SAAutomaticallyInvalidatable *)self->_alertingAssertion resetAutomaticInvalidationTimer];
  id v9 = [(SBDynamicFlashlightActivityElement *)self delegate];
  [v9 dynamicFlashlightActivityElementDidChangeIntensity:v5 width:a3 animated:a4];
}

- (void)dynamicFlashlightViewControllerDidToggleFlashlight
{
  [(SAAutomaticallyInvalidatable *)self->_alertingAssertion resetAutomaticInvalidationTimer];
  id v3 = [(SBDynamicFlashlightActivityElement *)self delegate];
  [v3 dynamicFlashlightActivityElementRequestsTogglingFlashlight];
}

- (void)dynamicFlashlightViewControllerDidChangePreferredContentRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
}

- (void)dynamicFlashlightViewControllerCancelSystemApertureGestureHandlers
{
}

- (void)dynamicFlashlightViewControllerUpdatePersistedIntensity:(double)a3 width:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dynamicFlashlightActivityElementDidUpdatePersistedIntensity:a3 width:a4];
}

- (void)dynamicFlashlightViewControllerShouldDismiss
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "ELT: Invalidating preferredLayoutMode...", v1, 2u);
}

- (id)_leadingPackageStateForState:(id)a3
{
  id v3 = a3;
  if ([v3 isUnavailable])
  {
    int64_t v4 = @"unavailable";
  }
  else if ([v3 isOn])
  {
    int64_t v4 = @"ON";
  }
  else
  {
    int64_t v4 = @"OFF";
  }

  return v4;
}

- (id)_trailingTextForState:(id)a3
{
  id v3 = a3;
  if ([v3 isUnavailable])
  {
    int64_t v4 = 0;
  }
  else
  {
    int v5 = [v3 isOn];
    double v6 = [MEMORY[0x1E4F28B50] mainBundle];
    double v7 = v6;
    if (v5) {
      double v8 = @"FLASHLIGHT_ON";
    }
    else {
      double v8 = @"FLASHLIGHT_OFF";
    }
    int64_t v4 = [v6 localizedStringForKey:v8 value:&stru_1F3084718 table:@"SpringBoard"];
  }
  return v4;
}

- (id)_textColorForState:(id)a3
{
  id v3 = a3;
  if (([v3 isUnavailable] & 1) != 0 || (objc_msgSend(v3, "isOn") & 1) == 0)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F428B8], "sbui_inactiveColor");
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.835294118 green:0.823529412 blue:1.0 alpha:1.0];
  }
  int v5 = (void *)v4;

  return v5;
}

- (NSString)coverSheetIdentifier
{
  unint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (self->_layoutMode == 3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0x8000000;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 9;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  int v5 = [(SBDynamicFlashlightActivityElement *)self flashlightState];
  double v6 = +[SBDynamicFlashlightState offState];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    double v8 = +[SBDynamicFlashlightState offState];
    [(SBDynamicFlashlightActivityElement *)self setFlashlightState:v8];

    id v9 = [(SBDynamicFlashlightActivityElement *)self delegate];
    [v9 dynamicFlashlightActivityElementRequestsTogglingFlashlight];

    alertingAssertion = self->_alertingAssertion;
    [(SAAutomaticallyInvalidatable *)alertingAssertion invalidateWithReason:@"prototype settings changed"];
  }
}

- (unint64_t)obstructionEdge
{
  return self->_obstructionEdge;
}

- (SAActivityHosting)activityHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityHost);
  return (SAActivityHosting *)WeakRetained;
}

- (void)setActivityHost:(id)a3
{
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (SAElementHosting)elementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementHost);
  return (SAElementHosting *)WeakRetained;
}

- (void)setElementHost:(id)a3
{
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  return (SBSystemAperturePlatformElementHosting *)WeakRetained;
}

- (void)setPlatformElementHost:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (SBSystemApertureGestureHandling)gestureHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureHandler);
  return (SBSystemApertureGestureHandling *)WeakRetained;
}

- (void)setGestureHandler:(id)a3
{
}

- (SBDynamicFlashlightActivityElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDynamicFlashlightActivityElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBDynamicFlashlightState)flashlightState
{
  return self->_flashlightState;
}

- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider
{
  return self->_leadingPackageViewProvider;
}

- (SBUISystemApertureTextContentProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, 0);
  objc_storeStrong((id *)&self->_flashlightState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_gestureHandler);
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_activityHost);
  objc_storeStrong((id *)&self->_flashlightSettings, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_elementViewController, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
}

- (void)shouldRemainActiveWhileFlashlightIsOff
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(void *)(a1 + 88) == 3;
  int v4 = [*(id *)(a1 + 16) shouldDismissWhenOff];
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4 ^ 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "ELT: Remain active? layoutMode:%{BOOL}i && shouldNotDismiss:%{BOOL}i", (uint8_t *)v5, 0xEu);
}

@end