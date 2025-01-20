@interface SBDeckSwitcherModifier
- (BOOL)_isIndexVisible:(unint64_t)a3;
- (BOOL)_priorIndex:(unint64_t)a3 fullyObscuresCardForIndex:(unint64_t)a4;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isFocusEnabledForAppLayout:(id)a3;
- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3;
- (BOOL)isItemContainerPointerInteractionEnabled;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAcceleratedHomeButtonPressBegin;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3;
- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (BOOL)shouldPerformRotationAnimationForOrientationChange;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3;
- (BOOL)switcherDimmingViewBlocksTouches;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (BOOL)wantsHomeScreenPointerInteractions;
- (BOOL)wantsSlideOverTongue;
- (BOOL)wantsSwitcherBackdropBlur;
- (BOOL)wantsSwitcherDimmingView;
- (CGPoint)_adjustedOffsetForIndex:(int64_t)a3 offset:(CGPoint)a4 start:(CGPoint)a5 originalLocationInView:(CGPoint)a6 locationInView:(CGPoint)a7;
- (CGPoint)_contentOffsetForScrollProgress:(double)a3;
- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4;
- (CGRect)_frameForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5 ignoringScrollOffset:(BOOL)a6;
- (CGRect)_scaleTransformedFrameForIndex:(unint64_t)a3 withUntransformedFrame:(CGRect)a4 scrollProgress:(double)a5;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (CGSize)_contentSize;
- (SBDeckSwitcherModifier)init;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)_cardCornerRadiusInSwitcher;
- (double)_counteractScrollingForOffset:(double)a3 scrollProgress:(double)a4;
- (double)_depthForFrameOrigin:(double)a3;
- (double)_preferredVisibleMarginForTopPage;
- (double)_restingScrollProgressForProgress:(double)a3 velocity:(CGPoint)a4;
- (double)_scaleForTransformForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)_scaleInSwitcherViewForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)_scaleTransformedXOrigin:(double)a3 scrollProgress:(double)a4;
- (double)_scrollMin;
- (double)_scrollProgress;
- (double)_scrollProgressForContentOffset:(CGPoint)a3;
- (double)_scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5;
- (double)_switcherCardScale;
- (double)_unscaledCardCornerRadius;
- (double)_valueAlongDepthCurveForIndex:(unint64_t)a3 scrollProgress:(double)a4 aCoefficient:(double)a5 bCoefficient:(double)a6;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentViewScale;
- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5;
- (double)desiredXOriginForQuantizedTopPage;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scrollProgressForIndex:(unint64_t)a3;
- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5;
- (double)scrollRange;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)switcherBackdropBlurProgress;
- (double)switcherDimmingAlpha;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutForReceivingHardwareButtonEvents;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)debugDescription;
- (id)foregroundAppLayouts;
- (id)handleRemovalEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleSwitcherSettingsChangedEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)scrollViewAttributes;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (id)visibleShelves;
- (int64_t)_topIndexForLocationInContainerCoordinateSpace:(CGPoint)a3;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)dockUpdateMode;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)plusButtonStyle;
- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)switcherBackdropBlurType;
- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)_directionForRemovingIndex:(unint64_t)a3 centeredIndex:(unint64_t)a4;
- (unint64_t)_indexForContentOffset:(CGPoint)a3;
- (unint64_t)_indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5;
- (unint64_t)_indexOfCurrentCenteredCard;
- (unint64_t)_newIndexOfItemAtIndex:(unint64_t)a3 afterRemovingItemAtIndex:(unint64_t)a4;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)numberOfItems;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
- (void)_applyPrototypeSettings;
- (void)didMoveToParentModifier:(id)a3;
- (void)resetAdjustedScrollingState;
@end

@implementation SBDeckSwitcherModifier

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  v5 = [v4 toAppLayout];
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v5;

  v9.receiver = self;
  v9.super_class = (Class)SBDeckSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v9 handleTransitionEvent:v4];

  return v7;
}

- (double)scrollRange
{
  [(SBDeckSwitcherModifier *)self _contentSize];
  double v4 = v3;
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  return v4 - v5;
}

- (CGSize)_contentSize
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double v4 = v3;
  double v6 = v5 * (double)[(SBDeckSwitcherModifier *)self numberOfItems];
  double v7 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (unint64_t)numberOfItems
{
  v2 = [(SBDeckSwitcherModifier *)self appLayouts];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)scrollViewAttributes
{
  unint64_t v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  [(SBSwitcherScrollViewAttributes *)v3 setDecelerationRate:*(double *)&kDecelerationFactor];
  [(SBSwitcherScrollViewAttributes *)v3 setScrollViewPagingEnabled:0];
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBSwitcherScrollViewAttributes *)v3 setInterpolatesDuringSwipeToKill:1];
  [(SBDeckSwitcherModifier *)self _contentSize];
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  return v3;
}

- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v21);
  [(SBDeckSwitcherModifier *)self depthForIndex:a3 displayItemsCount:a4 scrollProgress:a5];
  double v10 = *(double *)&kExponentialLayoutTranslation;
  long double v12 = v10 + Width * exp(v11 * *(double *)&kExponentialLayoutCurveExponent);
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  long double v14 = v12 + Width * ((1.0 - v13) * -0.5);
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  double v16 = v14 / v15;
  [(SBDeckSwitcherModifier *)self scrollRange];
  if (BSFloatIsZero())
  {
    [(SBDeckSwitcherModifier *)self _scrollProgress];
    if (BSFloatEqualToFloat())
    {
      int v17 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
      [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
      if (v17) {
        double v18 = -v18;
      }
      double v16 = v16 - v18;
    }
  }
  [(SBDeckSwitcherModifier *)self scaleForIndex:a3];
  return v16 * v19;
}

- (double)_scrollProgress
{
  [(SBDeckSwitcherModifier *)self scrollRange];
  double v4 = v3;
  [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
  double v6 = v5;
  if (BSFloatIsZero()) {
    double v7 = 0.0;
  }
  else {
    double v7 = v6 / v4;
  }
  int v8 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
  double result = 1.0 - v7;
  if (v8) {
    return v7;
  }
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier _scaleForTransformForIndex:scrollProgress:](self, "_scaleForTransformForIndex:scrollProgress:", a3);
  double v6 = v5;
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  return v6 * v7;
}

- (double)_scaleForTransformForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  [(SBDeckSwitcherModifier *)self depthForIndex:a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] scrollProgress:a4];
  return v4 * 0.12 + 1.0;
}

- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  double v7 = -(*(double *)&kDepthPadding - (double)a4 * *(double *)&kDepthPadding);
  [(SBDeckSwitcherModifier *)self _scrollMin];
  return v8 + v7 * a5 - *(double *)&kDepthPadding * (double)a3;
}

- (double)_scrollMin
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v6);
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  return log(-(*(double *)&kExponentialLayoutTranslation - Width * ((1.0 - v4) * 0.5)) / Width)
       / *(double *)&kExponentialLayoutCurveExponent;
}

- (double)_switcherCardScale
{
  v2 = [(SBDeckSwitcherModifier *)self switcherSettings];
  [v2 deckSwitcherPageScale];
  double v4 = v3;

  return v4;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  double v7 = v6;
  [(SBDeckSwitcherModifier *)self _frameForIndex:a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] scrollProgress:1 ignoringScrollOffset:v6];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = [(SBDeckSwitcherModifier *)self switcherSettings];
  [v16 switcherCenterYOffsetPercentOfScreenHeight];

  [(SBDeckSwitcherModifier *)self containerViewBounds];
  [(SBDeckSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  CGFloat v18 = v17;
  v37.origin.CGFloat x = v9;
  v37.origin.CGFloat y = v11;
  v37.size.CGFloat width = v13;
  v37.size.CGFloat height = v15;
  CGRect v38 = CGRectOffset(v37, 0.0, v18);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  if ((UIRectIsDiscrete() & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    v31 = NSStringFromCGRect(v39);
    [(SBDeckSwitcherModifier *)self containerViewBounds];
    v32 = NSStringFromCGRect(v40);
    unint64_t v33 = [(SBDeckSwitcherModifier *)self numberOfItems];
    [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
    uint64_t v35 = v34;
    [(SBDeckSwitcherModifier *)self scrollRange];
    [v30 handleFailureInMethod:a2, self, @"SBDeckSwitcherModifier.m", 230, @"Deck switcher computed an invalid frame:%@ based on containerFrame:%@ scrollProgress:%.2f index:%lu numItems:%lu scrollViewXoffset: %.2f scrollRange :%.2f", v31, v32, *(void *)&v7, a3, v33, v35, v36 object file lineNumber description];
  }
  [(SBDeckSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  double v24 = v23;
  BSFloatRoundForScale();
  double v26 = v25;
  double v27 = v24;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)_frameForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5 ignoringScrollOffset:(BOOL)a6
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  int v17 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
  [(SBDeckSwitcherModifier *)self leadingOffsetForIndex:a3 displayItemsCount:a4 scrollProgress:a5];
  if (v17) {
    double v18 = -v18;
  }
  if (!a6) {
    [(SBDeckSwitcherModifier *)self _counteractScrollingForOffset:v18 scrollProgress:a5];
  }
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBDeckSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  return CGRectGetMinY(*(CGRect *)&v5);
}

- (SBDeckSwitcherModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeckSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v6 init];
  double v3 = v2;
  if (v2)
  {
    v2->_grabbedDraggingIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
    double v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v3 addChildModifier:v4];
  }
  return v3;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBDeckSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBDeckSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBDeckSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDeckSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v16 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_13;
  }
  if ([v4 phase] == 2)
  {
    --self->_ongoingAppLayoutRemovals;
    objc_super v6 = [(SBDeckSwitcherModifier *)self appLayouts];
    if ([v6 count])
    {
    }
    else
    {
      unint64_t ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

      if (!ongoingAppLayoutRemovals)
      {
        double v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        double v12 = +[SBAppLayout homeScreenAppLayout];
        [(SBSwitcherTransitionRequest *)v10 setAppLayout:v12];

        [(SBSwitcherTransitionRequest *)v10 setAutoPIPDisabled:1];
LABEL_12:
        double v13 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
        uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v5];

        objc_super v5 = (void *)v14;
        goto LABEL_13;
      }
    }
    double v8 = [v4 appLayout];
    if (!BSEqualObjects())
    {

      goto LABEL_13;
    }
    unint64_t v9 = self->_ongoingAppLayoutRemovals;

    if (v9) {
      goto LABEL_13;
    }
    double v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    double v11 = +[SBAppLayout homeScreenAppLayout];
    [(SBSwitcherTransitionRequest *)v10 setAppLayout:v11];

    [(SBSwitcherTransitionRequest *)v10 setUnlockedEnvironmentMode:2];
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
  objc_msgSend(v5, "setRetainsSiri:", -[SBDeckSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  objc_super v6 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v5 gestureInitiated:0];
  v10.receiver = self;
  v10.super_class = (Class)SBDeckSwitcherModifier;
  objc_super v7 = [(SBSwitcherModifier *)&v10 handleTapAppLayoutEvent:v4];

  double v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v7];

  return v8;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBDeckSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBSwitcherModifier *)&v11 handleTapOutsideToDismissEvent:v3];
  char v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    objc_super v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    objc_super v7 = +[SBSwitcherTransitionRequest requestForActivatingHomeScreen];
    double v8 = [(SBPerformTransitionSwitcherEventResponse *)v6 initWithTransitionRequest:v7 gestureInitiated:0];

    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v4];

    id v4 = (void *)v9;
  }
  return v4;
}

- (id)handleScrollEvent:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double x = self->_previousContentOffset.x;
  if (x != 1.79769313e308 || self->_previousContentOffset.y != 1.79769313e308) {
    self->_isScrollingForward = x > v5;
  }
  self->_previousContentOffset.double x = v5;
  self->_previousContentOffset.CGFloat y = v6;
  v11.receiver = self;
  v11.super_class = (Class)SBDeckSwitcherModifier;
  uint64_t v9 = [(SBSwitcherModifier *)&v11 handleScrollEvent:v4];

  return v9;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (double)plusButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  return 0.0;
}

- (double)reopenClosedWindowsButtonScale
{
  return 1.0;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 0;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBDeckSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  CGFloat v6 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v7 = [(SBDeckSwitcherModifier *)self appLayouts];
  double v8 = objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  uint64_t v9 = [v6 setWithArray:v8];

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  uint64_t v3 = [(SBDeckSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleShelves
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (CGRect)frameForShelf:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (double)shelfBackgroundBlurOpacity
{
  return 0.0;
}

- (CGRect)shelfBackgroundBlurFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  double v5 = [(SBDeckSwitcherModifier *)self switcherSettings];
  [v5 switcherCardShadowRadius];
  double v7 = v6;
  [v5 deckSwitcherPageScale];
  double v9 = v7 / v8;
  [(SBDeckSwitcherModifier *)self scaleForIndex:a3];
  double v11 = v9 * v10;
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  CGRect v26 = CGRectInset(v25, v11 * -2.8, v11 * -2.8);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  double v17 = v16;
  [(SBDeckSwitcherModifier *)self frameForIndex:a3];
  -[SBDeckSwitcherModifier _scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:](self, "_scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:", a3);
  v28.origin.CGFloat x = v18;
  v28.origin.CGFloat y = v19;
  v28.size.CGFloat width = v20;
  v28.size.CGFloat height = v21;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (CGRectIntersectsRect(v27, v28))
  {
    [(SBDeckSwitcherModifier *)self opacityForIndex:a3 scrollProgress:v17];
    BOOL v23 = v22 > 0.01;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  double v3 = [(SBDeckSwitcherModifier *)self switcherSettings];
  double v4 = [v3 animationSettings];

  double v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  double v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  double v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return a3 != 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  -[SBDeckSwitcherModifier frameForIndex:](self, "frameForIndex:");
  double x = v23.origin.x;
  CGFloat y = v23.origin.y;
  double width = v23.size.width;
  CGFloat height = v23.size.height;
  double v9 = CGRectGetWidth(v23);
  if ([(SBDeckSwitcherModifier *)self clipsToUnobscuredMarginAtIndex:a3])
  {
    uint64_t v10 = 1;
    while (![(SBDeckSwitcherModifier *)self _priorIndex:v10 fullyObscuresCardForIndex:a3])
    {
      if (++v10 == 5) {
        goto LABEL_9;
      }
    }
    [(SBDeckSwitcherModifier *)self _cardCornerRadiusInSwitcher];
    double v12 = v11;
    [(SBDeckSwitcherModifier *)self scaleForIndex:a3];
    double v14 = v13;
    [(SBDeckSwitcherModifier *)self frameForIndex:a3 - v10];
    double v16 = v15;
    double v18 = v17;
    int v19 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
    double v20 = x + width - (v16 + v18);
    if (!v19) {
      double v20 = v16 - x;
    }
    double v9 = (v12 + v20) / v14;
LABEL_9:
    v24.origin.double x = x;
    v24.origin.CGFloat y = y;
    v24.size.double width = width;
    v24.size.CGFloat height = height;
    double v21 = CGRectGetWidth(v24);
    if (v9 >= v21) {
      return v21;
    }
  }
  return v9;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier opacityForIndex:scrollProgress:](self, "opacityForIndex:scrollProgress:", a5);
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  double v6 = [(SBDeckSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (!v7) {
    return 0.0;
  }
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", v7);
  return result;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a3);
  return result;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBDeckSwitcherModifier *)self numberOfItems];
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier depthForIndex:displayItemsCount:scrollProgress:](self, "depthForIndex:displayItemsCount:scrollProgress:", a3, v5);
  return fmin(fmax((v6 + 0.144) * 0.75, 0.0), 1.0);
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a3);
  return 1.0 - v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  -[SBDeckSwitcherModifier titleOpacityForIndex:scrollProgress:](self, "titleOpacityForIndex:scrollProgress:", a3);
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBDeckSwitcherModifier *)self _unscaledCardCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  if ([(SBDeckSwitcherModifier *)self isShowingSpotlightOrTodayView]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  double v4 = [(SBDeckSwitcherModifier *)self switcherSettings];
  double v5 = [v4 animationSettings];
  [v5 homeScreenAlphaForMode:v3];
  double v7 = v6;

  return v7;
}

- (double)homeScreenScale
{
  double v2 = [(SBDeckSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  [v3 homeScreenScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)wallpaperScale
{
  double v2 = [(SBDeckSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  [v3 wallpaperScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  double v2 = [(SBDeckSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  [v3 homeScreenDimmingAlphaForMode:2];
  double v5 = v4;

  return v5;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  double v2 = [(SBDeckSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  [v3 homeScreenBlurProgressForMode:2];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  return 0;
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 0;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return 0;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v9;
  result.size.double width = v8;
  result.origin.CGFloat y = v7;
  result.origin.double x = v6;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBDeckSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = [(SBDeckSwitcherModifier *)self switcherSettings];
  uint64_t v7 = [v6 numberOfSnapshotsToCacheInSwitcher];

  BOOL isScrollingForward = self->_isScrollingForward;
  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v3, v5, v7, isScrollingForward);
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  return 0;
}

- (BOOL)shouldAcceleratedHomeButtonPressBegin
{
  return 0;
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  uint64_t v3 = [(SBDeckSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(SBDeckSwitcherModifier *)self isReduceMotionEnabled];

    if (v4) {
      return 6;
    }
    else {
      return 2;
    }
  }
  else
  {

    return 6;
  }
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return [(SBDeckSwitcherModifier *)self _isIndexVisible:a4];
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result = [(SBDeckSwitcherModifier *)self _indexOfCurrentCenteredCard];
  if (result < a3) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = result + 1;
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    return v5;
  }
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBDeckSwitcherModifier *)self _indexOfCurrentCenteredCard];
  if (![(SBDeckSwitcherModifier *)self _isIndexVisible:a3]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double v6 = [(SBDeckSwitcherModifier *)self appLayouts];
  unint64_t v7 = [v6 count];

  if (![(SBDeckSwitcherModifier *)self _directionForRemovingIndex:a3 centeredIndex:v5])
  {
    if (!a3)
    {
      if (v5 <= 1) {
        unint64_t v5 = 1;
      }
      if (v7 <= 1) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_13;
    }
    if (v5 != a3) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (v7 - 1 != a3)
  {
LABEL_8:
    unint64_t v5 = a3 + 1;
    if (a3 + 1 >= v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_13;
  }
  if (v7 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 -= v5 == a3;
LABEL_13:
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBDeckSwitcherModifier *)self _newIndexOfItemAtIndex:v5 afterRemovingItemAtIndex:a3];
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return objc_msgSend(a4, "type", a3) == 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (id)appLayoutsToResignActive
{
  double v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  int v4 = [(SBDeckSwitcherModifier *)self appLayouts];
  unint64_t v5 = [v3 setWithArray:v4];
  double v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334B408];

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  return 1;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (id)foregroundAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (char)jetsamModeForAppLayout:(id)a3
{
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v4 = a3;
  return v4;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v3 = a3;
  return v3;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  double v8 = v7;
  if (__sb__runningInSpringBoard())
  {
    int v9 = SBFEffectiveDeviceClass();
    double result = 0.5;
    if (v9 == 2) {
      return result;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v11 = [v4 userInterfaceIdiom];

    double result = 0.5;
    if (v11 == 1) {
      return result;
    }
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_16;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom])
    {

      goto LABEL_16;
    }
    uint64_t v12 = SBFEffectiveHomeButtonType();

    if (v12 != 2)
    {
LABEL_16:
      int v13 = __sb__runningInSpringBoard();
      char v14 = v13;
      if (v13)
      {
        if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
        {
LABEL_23:
          int v15 = __sb__runningInSpringBoard();
          char v16 = v15;
          if (v15)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            unint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
            [v5 _referenceBounds];
          }
          BSSizeRoundForScale();
          BOOL v18 = v17 >= *(double *)(MEMORY[0x1E4FA6E50] + 56);
          if ((v16 & 1) == 0) {

          }
          if ((v14 & 1) == 0) {
          double result = v8;
          }
          if (v18) {
            return 0.5;
          }
          return result;
        }
      }
      else
      {
        id v4 = [MEMORY[0x1E4F42948] currentDevice];
        if (![v4 userInterfaceIdiom]) {
          goto LABEL_23;
        }
      }
      return v8;
    }
  }
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  return result;
}

- (double)_cardCornerRadiusInSwitcher
{
  [(SBDeckSwitcherModifier *)self _unscaledCardCornerRadius];
  double v4 = v3;
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  return v4 * v5;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  -[SBDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", a3, a4);
  -[SBDeckSwitcherModifier _contentOffsetForScrollProgress:](self, "_contentOffsetForScrollProgress:");
  result.CGFloat y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  -[SBDeckSwitcherModifier _scrollProgressForContentOffset:](self, "_scrollProgressForContentOffset:", a3.x, a3.y);
  -[SBDeckSwitcherModifier _restingScrollProgressForProgress:velocity:](self, "_restingScrollProgressForProgress:velocity:");
  -[SBDeckSwitcherModifier _contentOffsetForScrollProgress:](self, "_contentOffsetForScrollProgress:");
  result.CGFloat y = v6;
  result.double x = v5;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  double v5 = [(SBDeckSwitcherModifier *)self switcherSettings];
  [v5 switcherCardShadowRadius];
  double v7 = v6;
  [v5 deckSwitcherPageScale];
  double v9 = v7 / v8;
  [(SBDeckSwitcherModifier *)self scaleForIndex:a3];
  [(SBSwitcherModifier *)self distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:a3 numberOfRows:1 padding:0 layoutDirection:v9 * v10 * 2.8];
  double v12 = v11;

  return v12;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  double y = a6.y;
  double x = a6.x;
  CGFloat v12 = a5.y;
  double v13 = a5.x;
  double v14 = a4.y;
  double v15 = a4.x;
  double v16 = a3.y;
  double v17 = a3.x;
  if (a7)
  {
    if (a8) {
      goto LABEL_3;
    }
  }
  else
  {
    CGRect v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"SBDeckSwitcherModifier.m", 908, @"Invalid parameter not satisfying: %@", @"hv != nil" object file lineNumber description];

    if (a8) {
      goto LABEL_3;
    }
  }
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"SBDeckSwitcherModifier.m", 909, @"Invalid parameter not satisfying: %@", @"vv != nil" object file lineNumber description];

LABEL_3:
  if ([(SBDeckSwitcherModifier *)self numberOfItems] >= 2)
  {
    -[SBDeckSwitcherModifier scrollableQueryModifier:convertScrollViewPointToContainerViewCoordinateSpace:](self, "scrollableQueryModifier:convertScrollViewPointToContainerViewCoordinateSpace:", self, x, y);
    double v22 = v20;
    double v23 = v21;
    if (self->_grabbedDraggingIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_grabbedDraggingIndedouble x = -[SBDeckSwitcherModifier _topIndexForLocationInContainerCoordinateSpace:](self, "_topIndexForLocationInContainerCoordinateSpace:", v20, v21);
      self->_double outputContentOffsetAdjustmentForIndexChange = 0.0;
      self->_inputContentOffsetAdjustmentForIndexChange = 0.0;
      self->_start.double x = v13;
      self->_start.double y = v12;
      self->_originalLocationInView.double x = v22 - v15;
      self->_originalLocationInView.double y = v23 - v14;
      self->_initialTranslationAdjustment = v13 - v17;
    }
    int64_t v24 = -[SBDeckSwitcherModifier _topIndexForLocationInContainerCoordinateSpace:](self, "_topIndexForLocationInContainerCoordinateSpace:", v22, v23);
    if (self->_grabbedDraggingIndex == 0x7FFFFFFFFFFFFFFFLL) {
      grabbedDraggingIndedouble x = 0;
    }
    else {
      grabbedDraggingIndedouble x = self->_grabbedDraggingIndex;
    }
    p_start = &self->_start;
    p_originalLocationInView = &self->_originalLocationInView;
    -[SBDeckSwitcherModifier _adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:](self, "_adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:", grabbedDraggingIndex, v17, v16, self->_start.x, self->_start.y, self->_originalLocationInView.x, self->_originalLocationInView.y, v22, v23);
    double v30 = v29;
    if (v24 >= grabbedDraggingIndex)
    {
      double outputContentOffsetAdjustmentForIndexChange = self->_outputContentOffsetAdjustmentForIndexChange;
      double v16 = v28;
    }
    else
    {
      self->_grabbedDraggingIndedouble x = v24;
      [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
      p_start->double x = v31;
      self->_start.double y = v32;
      p_originalLocationInView->double x = v22;
      self->_originalLocationInView.double y = v23;
      self->_inputContentOffsetAdjustmentForIndexChange = p_start->x - v17;
      -[SBDeckSwitcherModifier _adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:](self, "_adjustedOffsetForIndex:offset:start:originalLocationInView:locationInView:", v24, v17, v16, p_start->x, self->_start.y, p_originalLocationInView->x, self->_originalLocationInView.y, v22, v23);
      double v16 = v33;
      double outputContentOffsetAdjustmentForIndexChange = self->_outputContentOffsetAdjustmentForIndexChange + v34 - v30;
      self->_double outputContentOffsetAdjustmentForIndexChange = outputContentOffsetAdjustmentForIndexChange;
      double v30 = v34;
    }
    double v17 = v30 - outputContentOffsetAdjustmentForIndexChange;
    -[SBDeckSwitcherModifier scrollableQueryModifier:contentOffsetVelocityConsideringNextContentOffset:](self, "scrollableQueryModifier:contentOffsetVelocityConsideringNextContentOffset:", self, v30 - outputContentOffsetAdjustmentForIndexChange, v16);
    if (a7 && v36 * *a7 > 0.0) {
      *a7 = v36;
    }
    if (a8 && v37 * *a8 > 0.0) {
      *a8 = v37;
    }
  }
  double v38 = v17;
  double v39 = v16;
  result.double y = v39;
  result.double x = v38;
  return result;
}

- (void)resetAdjustedScrollingState
{
  self->_grabbedDraggingIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  [(SBDeckSwitcherModifier *)self scrollViewContentOffset];
  unint64_t v4 = -[SBDeckSwitcherModifier _indexForContentOffset:](self, "_indexForContentOffset:");
  double v5 = [(SBDeckSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 count];
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v9 = v6 - v4;
  if (v6 <= v4) {
    goto LABEL_26;
  }
  uint64_t v10 = 0;
  do
  {
    if ([(SBDeckSwitcherModifier *)self _isIndexVisible:v4 + v10])
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v8 = v4 + v10;
      }
      uint64_t v7 = v4 + v10;
    }
    else if (v10)
    {
      break;
    }
    ++v10;
  }
  while (v9 != v10);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if ([(SBDeckSwitcherModifier *)self _isIndexVisible:v8])
    {
      while (v8-- >= 1)
      {
        if (![(SBDeckSwitcherModifier *)self _isIndexVisible:v8])
        {
          ++v8;
          goto LABEL_15;
        }
      }
      uint64_t v8 = 0;
    }
  }
LABEL_15:
  BOOL v12 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v13 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  if (v12 && v13) {
    NSUInteger v14 = v8;
  }
  else {
    NSUInteger v14 = 0;
  }
  if (v12 && v13) {
    uint64_t v15 = v7 - v8 + 1;
  }
  else {
    uint64_t v15 = 0;
  }

  NSUInteger v16 = v14;
  NSUInteger v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  -[SBDeckSwitcherModifier _scrollProgressForContentOffset:](self, "_scrollProgressForContentOffset:", a3.x, a3.y);
  double v5 = v4;
  unint64_t v6 = [(SBDeckSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 count];
  [(SBDeckSwitcherModifier *)self desiredXOriginForQuantizedTopPage];
  unint64_t v9 = [(SBDeckSwitcherModifier *)self indexForScrollProgress:v7 displayItemsCount:v5 frameOrigin:v8];

  return v9;
}

- (id)debugDescription
{
  v20[3] = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"grabbedIndex %ld", self->_grabbedDraggingIndex);
  double v4 = NSString;
  [(SBDeckSwitcherModifier *)self _scrollProgress];
  unint64_t v6 = objc_msgSend(v4, "stringWithFormat:", @"scrollProgress: %0.2f", v5);
  uint64_t v7 = NSString;
  [(SBDeckSwitcherModifier *)self scrollRange];
  unint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"scrollRange: %0.2f", v8);
  v20[0] = v3;
  v20[1] = v6;
  v20[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3084718];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__SBDeckSwitcherModifier_debugDescription__block_invoke;
  v17[3] = &unk_1E6B0B978;
  id v12 = v11;
  id v18 = v12;
  int v19 = v10;
  id v13 = v10;
  [v13 enumerateObjectsUsingBlock:v17];
  NSUInteger v14 = v19;
  id v15 = v12;

  return v15;
}

void __42__SBDeckSwitcherModifier_debugDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = NSString;
  uint64_t v5 = *(void **)(a1 + 32);
  unint64_t v6 = *(void **)(a1 + 40);
  id v7 = a2;
  if ([v6 count] - 1 == a3) {
    uint64_t v8 = &stru_1F3084718;
  }
  else {
    uint64_t v8 = @"\n";
  }
  id v9 = [v4 stringWithFormat:@"%@%@", v7, v8];

  [v5 appendString:v9];
}

- (unint64_t)_indexOfCurrentCenteredCard
{
  double v3 = [(SBDeckSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  while (1)
  {
    if ([(SBDeckSwitcherModifier *)self _isIndexVisible:v5])
    {
      [(SBDeckSwitcherModifier *)self frameForIndex:v5];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(SBDeckSwitcherModifier *)self scaleForIndex:v5];
      CGFloat v15 = v14;
      UIRectGetCenter();
      CGAffineTransformMakeScale(&v27, v15, v15);
      v28.origin.double x = v7;
      v28.origin.double y = v9;
      v28.size.double width = v11;
      v28.size.CGFloat height = v13;
      CGRectApplyAffineTransform(v28, &v27);
      SBUnintegralizedRectCenteredAboutPoint();
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      [(SBDeckSwitcherModifier *)self containerViewBounds];
      v30.origin.double x = v17;
      v30.origin.double y = v19;
      v30.size.double width = v21;
      v30.size.CGFloat height = v23;
      if (CGRectContainsRect(v29, v30)) {
        break;
      }
    }
    ++v5;
    int64_t v24 = [(SBDeckSwitcherModifier *)self appLayouts];
    unint64_t v25 = [v24 count];

    if (v5 >= v25) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (unint64_t)_directionForRemovingIndex:(unint64_t)a3 centeredIndex:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  double v6 = [(SBDeckSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 count] - 1;

  return v7 == a3 || a3 < a4;
}

- (unint64_t)_newIndexOfItemAtIndex:(unint64_t)a3 afterRemovingItemAtIndex:(unint64_t)a4
{
  if (a4 < a3) {
    return a3 - 1;
  }
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 > a3)
  {
    double v6 = [(SBDeckSwitcherModifier *)self appLayouts];
    if ([v6 count] > a3) {
      unint64_t v5 = a3;
    }
  }
  return v5;
}

- (CGPoint)_contentOffsetForScrollProgress:(double)a3
{
  [(SBDeckSwitcherModifier *)self scrollRange];
  [(SBDeckSwitcherModifier *)self isRTLEnabled];
  [(SBDeckSwitcherModifier *)self screenScale];
  BSPointRoundForScale();
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (double)_scrollProgressForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  [(SBDeckSwitcherModifier *)self scrollRange];
  double v6 = v5;
  if (BSFloatIsZero()) {
    double v7 = 0.0;
  }
  else {
    double v7 = x / v6;
  }
  int v8 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
  double result = 1.0 - v7;
  if (v8) {
    return v7;
  }
  return result;
}

- (double)_restingScrollProgressForProgress:(double)a3 velocity:(CGPoint)a4
{
  double x = a4.x;
  unint64_t v7 = [(SBDeckSwitcherModifier *)self numberOfItems];
  if (a3 > 1.0) {
    return a3;
  }
  unint64_t v8 = v7;
  if (a3 < 0.0 || v7 < 2) {
    return a3;
  }
  [(SBDeckSwitcherModifier *)self desiredXOriginForQuantizedTopPage];
  double v11 = v10;
  uint64_t v12 = 0;
  char v13 = 0;
  uint64_t v14 = 0;
  double v15 = 1.0;
  do
  {
    [(SBDeckSwitcherModifier *)self scrollProgressForIndex:v12 displayItemsCount:v8 frameOrigin:v11];
    double v17 = v16;
    double v18 = vabdd_f64(a3, v16);
    int v19 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
    if (v18 < v15)
    {
      double v20 = v19 ? -x : x;
      if ((a3 - v17) * v20 >= 0.0)
      {
        char v13 = 1;
        uint64_t v14 = v12;
        double v15 = v18;
      }
    }
    ++v12;
  }
  while (v8 != v12);
  if ((fabs(a3) >= v15) | v13 & 1)
  {
    [(SBDeckSwitcherModifier *)self scrollProgressForIndex:v14 displayItemsCount:v8 frameOrigin:v11];
  }
  else
  {
    if (v14) {
      return a3;
    }
    [(SBDeckSwitcherModifier *)self scrollProgressForIndex:0 displayItemsCount:v8 frameOrigin:v11];
    if (a3 <= 0.0 || v22 <= a3) {
      return a3;
    }
    [(SBDeckSwitcherModifier *)self scrollProgressForIndex:0];
  }
  return result;
}

- (double)_scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5
{
  if (a4 == 1)
  {
    [(SBDeckSwitcherModifier *)self _scrollMin];
  }
  else
  {
    double v8 = a5 + *(double *)&kDepthPadding * (double)a3;
    [(SBDeckSwitcherModifier *)self _scrollMin];
    return (v8 - v9) / -(*(double *)&kDepthPadding - (double)a4 * *(double *)&kDepthPadding);
  }
  return result;
}

- (unint64_t)_indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 depth:(double)a5
{
  if (a4 < 2) {
    return 0;
  }
  double v5 = -(a5 - *(double *)&kDepthPadding * (double)(a4 - 1) * a3);
  [(SBDeckSwitcherModifier *)self _scrollMin];
  double v7 = (v6 + v5) / *(double *)&kDepthPadding;
  int v8 = BSFloatLessThanOrEqualToFloat();
  unint64_t v9 = vcvtmd_u64_f64(v7);
  if (v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (double)scrollProgressForIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBDeckSwitcherModifier *)self numberOfItems];
  if (!a3) {
    return 0.0;
  }
  unint64_t v6 = v5;
  if (v5 > 2 || (double result = 1.0, v5 - 1 != a3))
  {
    [(SBDeckSwitcherModifier *)self desiredXOriginForQuantizedTopPage];
    -[SBDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", a3 - 1, v6);
  }
  return result;
}

- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  [(SBDeckSwitcherModifier *)self _depthForFrameOrigin:a5];
  -[SBDeckSwitcherModifier _scrollProgressForIndex:displayItemsCount:depth:](self, "_scrollProgressForIndex:displayItemsCount:depth:", a3, a4);
  return result;
}

- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  [(SBDeckSwitcherModifier *)self _depthForFrameOrigin:a5];
  return [(SBDeckSwitcherModifier *)self _indexForScrollProgress:a4 displayItemsCount:a3 depth:v8];
}

- (double)_depthForFrameOrigin:(double)a3
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v12);
  if ([(SBDeckSwitcherModifier *)self isRTLEnabled]) {
    a3 = Width - a3;
  }
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  double v7 = v6;
  double result = 0.0;
  if (Width > 0.0)
  {
    double v9 = a3 + Width * ((1.0 - v7) * 0.5);
    double v11 = *(double *)&kExponentialLayoutCurveExponent;
    if (v9 - (*(double *)&kExponentialLayoutTranslation + 1.0) <= 0.0)
    {
      double v10 = *(double *)&kExponentialLayoutTranslation + 1.0;
      return v9 / Width + log((v10 - *(double *)&kExponentialLayoutTranslation) / Width) / v11 - v10 / Width;
    }
    else
    {
      return log((v9 - *(double *)&kExponentialLayoutTranslation) / Width) / v11;
    }
  }
  return result;
}

- (double)_counteractScrollingForOffset:(double)a3 scrollProgress:(double)a4
{
  if (![(SBDeckSwitcherModifier *)self isRTLEnabled]) {
    a4 = 1.0 - a4;
  }
  [(SBDeckSwitcherModifier *)self scrollRange];
  return a3 + a4 * v7;
}

- (double)desiredXOriginForQuantizedTopPage
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v10);
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  double v5 = (Width - Width * v4) * 0.5;
  [(SBDeckSwitcherModifier *)self _preferredVisibleMarginForTopPage];
  double v7 = v6;
  int v8 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
  double result = Width - v5 - v7;
  if (v8) {
    return v7 + v5;
  }
  return result;
}

- (double)_preferredVisibleMarginForTopPage
{
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  +[SBFluidSwitcherItemContainer preferredRestingVisibleMarginForBounds:](SBFluidSwitcherItemContainer, "preferredRestingVisibleMarginForBounds:");
  return result;
}

- (int64_t)_topIndexForLocationInContainerCoordinateSpace:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v5 = [(SBDeckSwitcherModifier *)self numberOfItems];
  if (v5 <= 0) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = v5 - 1;
  }
  if (v5)
  {
    uint64_t v7 = v5;
    int64_t v8 = 0;
    while (1)
    {
      if ([(SBDeckSwitcherModifier *)self _isIndexVisible:v8])
      {
        [(SBDeckSwitcherModifier *)self frameForIndex:v8];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [(SBDeckSwitcherModifier *)self scaleForIndex:v8];
        CGFloat v18 = v17;
        UIRectGetCenter();
        CGAffineTransformMakeScale(&v21, v18, v18);
        v22.origin.double x = v10;
        v22.origin.double y = v12;
        v22.size.double width = v14;
        v22.size.CGFloat height = v16;
        CGRectApplyAffineTransform(v22, &v21);
        SBUnintegralizedRectCenteredAboutPoint();
        if (v19 < x) {
          break;
        }
      }
      if (v7 == ++v8) {
        return v6;
      }
    }
    return v8;
  }
  return v6;
}

- (CGPoint)_adjustedOffsetForIndex:(int64_t)a3 offset:(CGPoint)a4 start:(CGPoint)a5 originalLocationInView:(CGPoint)a6 locationInView:(CGPoint)a7
{
  double x = a6.x;
  CGFloat y = a4.y;
  double v7 = a5.x;
  double v35 = a4.x;
  [(SBDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v40);
  [(SBDeckSwitcherModifier *)self _contentSize];
  double v12 = v11;
  [(SBDeckSwitcherModifier *)self scrollRange];
  double v38 = v13;
  double v14 = 0.0;
  double v15 = 0.0;
  if (v12 > Width)
  {
    if ([(SBDeckSwitcherModifier *)self isRTLEnabled]) {
      double v15 = v7 / v38;
    }
    else {
      double v15 = 1.0 - v7 / v38;
    }
  }
  [(SBDeckSwitcherModifier *)self _scaleTransformedXOrigin:(double)a3 scrollProgress:v15];
  double v17 = v16;
  double initialTranslationAdjustment = self->_initialTranslationAdjustment;
  double inputContentOffsetAdjustmentForIndexChange = self->_inputContentOffsetAdjustmentForIndexChange;
  if (v12 > Width)
  {
    if ([(SBDeckSwitcherModifier *)self isRTLEnabled]) {
      double v14 = v35 / v38;
    }
    else {
      double v14 = 1.0 - v35 / v38;
    }
  }
  double v20 = x + v7 - v35 - initialTranslationAdjustment - inputContentOffsetAdjustmentForIndexChange;
  double v21 = v7 + x - v17;
  [(SBDeckSwitcherModifier *)self _scaleInSwitcherViewForIndex:a3 scrollProgress:v15];
  double v23 = v22;
  [(SBDeckSwitcherModifier *)self _scaleInSwitcherViewForIndex:a3 scrollProgress:v14];
  double v25 = v24;
  double v26 = v21 / v23 * v24;
  double v27 = Width * 0.5 * (v24 + -1.0);
  if ([(SBDeckSwitcherModifier *)self isRTLEnabled]) {
    double v28 = v20 - (v26 - Width * v25) - v27;
  }
  else {
    double v28 = v20 - v26 + v27;
  }
  [(SBDeckSwitcherModifier *)self scrollProgressForIndex:a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] frameOrigin:v28];
  double v30 = v29;
  int v31 = [(SBDeckSwitcherModifier *)self isRTLEnabled];
  double v32 = 1.0 - v30;
  if (v31) {
    double v32 = v30;
  }
  double v33 = v38 * v32;
  double v34 = y;
  result.CGFloat y = v34;
  result.double x = v33;
  return result;
}

- (double)_scaleTransformedXOrigin:(double)a3 scrollProgress:(double)a4
{
  unint64_t v5 = (unint64_t)a3;
  [(SBDeckSwitcherModifier *)self _frameForIndex:(unint64_t)a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] scrollProgress:0 ignoringScrollOffset:a4];
  -[SBDeckSwitcherModifier _scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:](self, "_scaleTransformedFrameForIndex:withUntransformedFrame:scrollProgress:", v5);
  return CGRectGetMinX(*(CGRect *)&v6);
}

- (CGRect)_scaleTransformedFrameForIndex:(unint64_t)a3 withUntransformedFrame:(CGRect)a4 scrollProgress:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(SBDeckSwitcherModifier *)self _scaleForTransformForIndex:a3 scrollProgress:a5];
  double v11 = v10 + -1.0;
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  double v13 = v11 + v12;
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double v14 = CGRectGetWidth(v22);
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double v15 = v14 - CGRectGetWidth(v23) * v13;
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  double v16 = CGRectGetHeight(v24);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double v17 = v16 - CGRectGetHeight(v25) * v13;
  double v18 = x + v15 * 0.5;
  double v19 = y + v17 * 0.5;
  double v20 = width * v13;
  double v21 = height * v13;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)_scaleInSwitcherViewForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  [(SBDeckSwitcherModifier *)self _scaleForTransformForIndex:a3 scrollProgress:a4];
  double v6 = v5 + -1.0;
  [(SBDeckSwitcherModifier *)self _switcherCardScale];
  return v6 + v7;
}

- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  if (!a3) {
    return 1.0;
  }
  -[SBDeckSwitcherModifier _valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:](self, "_valueAlongDepthCurveForIndex:scrollProgress:aCoefficient:bCoefficient:", a4, 0.41, 8.0);
  return 1.0 - v4;
}

- (double)_valueAlongDepthCurveForIndex:(unint64_t)a3 scrollProgress:(double)a4 aCoefficient:(double)a5 bCoefficient:(double)a6
{
  [(SBDeckSwitcherModifier *)self depthForIndex:a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] scrollProgress:a4];
  return fmin(fmax((-v8 - a5) * a6, 0.0), 1.0);
}

- (BOOL)_priorIndex:(unint64_t)a3 fullyObscuresCardForIndex:(unint64_t)a4
{
  unint64_t v7 = [(SBDeckSwitcherModifier *)self numberOfItems];
  BOOL v8 = 0;
  unint64_t v9 = a4 - a3;
  if (a4 >= a3 && a4 != 0x7FFFFFFFFFFFFFFFLL && v7 > a3)
  {
    double v10 = [(SBDeckSwitcherModifier *)self appLayouts];
    double v11 = [v10 objectAtIndex:a4 - a3];

    [(SBDeckSwitcherModifier *)self opacityForLayoutRole:1 inAppLayout:v11 atIndex:v9];
    BOOL v8 = v12 >= 1.0;
  }
  return v8;
}

- (double)_unscaledCardCornerRadius
{
  [(SBDeckSwitcherModifier *)self displayCornerRadius];
  if (result <= 0.0)
  {
    [(SBDeckSwitcherModifier *)self _switcherCardScale];
    return 5.0 / v4;
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  [(SBDeckSwitcherModifier *)self depthForIndex:a3 displayItemsCount:[(SBDeckSwitcherModifier *)self numberOfItems] scrollProgress:a4];
  double v7 = -v6;
  if (a3)
  {
    double v8 = fmax((v7 - *(double *)&kATitleOpacityCoefficient) * *(double *)&kBTitleOpacityCoefficient, 0.0);
    if (v8 >= 1.0) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0 - v8;
    }
  }
  else
  {
    double v9 = 1.0;
  }
  if (self->_useTitleOpacityPrototypeSettings)
  {
    double v10 = *(double *)&kCTitleOpacityCoefficient;
    double v11 = *(double *)&kDTitleOpacityCoefficient;
  }
  else
  {
    uint64_t v12 = [(SBDeckSwitcherModifier *)self switcherInterfaceOrientation];
    double v10 = dbl_1D8FD30E0[(unint64_t)(v12 - 1) < 2];
    double v11 = 75.0;
    if ((unint64_t)(v12 - 1) < 2) {
      double v11 = 40.0;
    }
  }
  return v9 * fmin(fmax((v7 - v10) * v11, 0.0), 1.0);
}

- (void)_applyPrototypeSettings
{
  id v11 = [(SBDeckSwitcherModifier *)self switcherSettings];
  [v11 aExpLayoutCoeff];
  kExponentialLayoutTranslation = v3;
  [v11 bExpLayoutCoeff];
  kExponentialLayoutCurveExponent = v4;
  [v11 depthPadding];
  kDepthPadding = v5;
  [v11 deckSwitcherDecelerationRate];
  kDecelerationFactor = v6;
  if ([v11 useTitleOpacityPrototypeSettings])
  {
    self->_useTitleOpacityPrototypeSettings = 1;
    [v11 titleOpacityACoeff];
    kATitleOpacityCoefficient = v7;
    [v11 titleOpacityBCoeff];
    kBTitleOpacityCoefficient = v8;
    [v11 titleOpacityCCoeff];
    kCTitleOpacityCoefficient = v9;
    [v11 titleOpacityDCoeff];
    kDTitleOpacityCoefficient = v10;
  }
  else
  {
    self->_useTitleOpacityPrototypeSettings = 0;
  }
}

- (void).cxx_destruct
{
}

@end