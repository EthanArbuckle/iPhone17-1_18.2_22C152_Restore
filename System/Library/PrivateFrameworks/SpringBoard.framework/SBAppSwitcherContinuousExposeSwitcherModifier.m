@interface SBAppSwitcherContinuousExposeSwitcherModifier
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)handlesTapAppLayoutEvents;
- (BOOL)handlesTapAppLayoutHeaderEvents;
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
- (BOOL)shouldConfigureInAppDockVisibleAssertion;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (BOOL)shouldPerformRotationAnimationForOrientationChange;
- (BOOL)shouldRubberbandFullScreenHomeGrabberView;
- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3;
- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3;
- (BOOL)showsActiveAppLayoutInSwitcher;
- (BOOL)switcherDimmingViewBlocksTouches;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (BOOL)wantsHomeScreenPointerInteractions;
- (BOOL)wantsSlideOverTongue;
- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3;
- (BOOL)wantsSwitcherBackdropBlur;
- (BOOL)wantsSwitcherDimmingView;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)_boundingFrameForPileAtIndex:(unint64_t)a3 withScrollOffsetApplied:(BOOL)a4;
- (CGRect)_boundingFrameForPileWithIdentifier:(id)a3 withScrollOffsetApplied:(BOOL)a4;
- (CGRect)_frameForAppLayout:(id)a3 withScaledApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5;
- (CGRect)_frameForIndex:(unint64_t)a3 withScaleApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5;
- (CGRect)_scaledSwitcherViewBounds;
- (CGRect)_visibleSwitcherBoundsIncludingShadow;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (CGSize)_contentSize;
- (CGSize)_fittedContentSize;
- (SBAppSwitcherContinuousExposeSwitcherModifier)init;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)_visiblePileRange;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)_heightForCardInSwitcherWithScaleFactor:(BOOL)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentViewScale;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)horizontalEdgeSpacingScaleFactor;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleFactor;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)switcherBackdropBlurProgress;
- (double)switcherDimmingAlpha;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_appLayoutsToCacheSnapshotsWithVisiblePileRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5;
- (id)_compactedBoundingBoxSizesByAppLayout;
- (id)_currentLayoutCalculationsValidityToken;
- (id)_visiblePileIdentifiers;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutForReceivingHardwareButtonEvents;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)buildLayoutCalculationsForCache:(id)a3;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)foregroundAppLayouts;
- (id)handleEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapAppLayoutHeaderEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)scrollViewAttributes;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (id)visibleShelves;
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
- (unint64_t)_indexOfAppLayoutInItsPile:(id)a3;
- (unint64_t)_indexOfLeadingAppLayout;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
- (void)setHandlesTapAppLayoutEvents:(BOOL)a3;
- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3;
- (void)setHorizontalEdgeSpacingScaleFactor:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setShowsActiveAppLayoutInSwitcher:(BOOL)a3;
@end

@implementation SBAppSwitcherContinuousExposeSwitcherModifier

- (SBAppSwitcherContinuousExposeSwitcherModifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_handlesTapAppLayoutEvents = 1;
    v2->_handlesTapAppLayoutHeaderEvents = 1;
    v2->_scaleFactor = 1.0;
    v2->_horizontalEdgeSpacingScaleFactor = 1.0;
    v2->_showsActiveAppLayoutInSwitcher = 1;
    v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v3 addChildModifier:v4 atLevel:1 key:0];

    v5 = objc_alloc_init(SBSwitcherLayoutCalculationsCache);
    appLayoutLayoutCalculationsCache = v3->_appLayoutLayoutCalculationsCache;
    v3->_appLayoutLayoutCalculationsCache = v5;

    [(SBSwitcherLayoutCalculationsCache *)v3->_appLayoutLayoutCalculationsCache setDelegate:v3];
  }
  return v3;
}

- (id)handleEvent:(id)a3
{
  ++self->_modifierEventGenCount;
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  v3 = [(SBChainableModifier *)&v5 handleEvent:a3];
  return v3;
}

- (id)handleScrollEvent:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  CGFloat v8 = v7;
  p_previousContentOffset = &self->_previousContentOffset;
  BOOL v10 = self->_previousContentOffset.x == 1.79769313e308 && self->_previousContentOffset.y == 1.79769313e308;
  if (!v10 && (BSFloatEqualToFloat() & 1) == 0) {
    self->_isScrollingForward = p_previousContentOffset->x > v6;
  }
  p_previousContentOffset->x = v6;
  self->_previousContentOffset.y = v8;
  v13.receiver = self;
  v13.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v13 handleScrollEvent:v4];

  return v11;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 toEnvironmentMode] == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  double v5 = [v4 toAppLayout];
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v5;

  v9.receiver = self;
  v9.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  double v7 = [(SBSwitcherModifier *)&v9 handleTransitionEvent:v4];

  return v7;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  double v5 = [(SBSwitcherModifier *)&v22 handleTapAppLayoutEvent:v4];
  if (self->_handlesTapAppLayoutEvents && ([v4 isHandled] & 1) == 0)
  {
    double v6 = [v4 appLayout];
    double v7 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v6];

    CGFloat v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    int v9 = [v8 isAdditiveModelEnabled];

    if (v9)
    {
      BOOL v10 = [v4 appLayout];
      v21.receiver = self;
      v21.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
      v11 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)&v21 appLayoutContainingAppLayout:v10];

      v12 = [v4 appLayout];
      objc_super v13 = [v12 allItems];
      v14 = [v13 firstObject];
      v15 = objc_msgSend(v11, "itemForLayoutRole:", objc_msgSend(v11, "layoutRoleForItem:", v14));

      v16 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      v17 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutByBringingItemToFront:v15 inAppLayout:v11];
      [(SBSwitcherTransitionRequest *)v16 setAppLayout:v17];

      [(SBSwitcherTransitionRequest *)v16 setActivatingDisplayItem:v15];
      double v7 = v16;
    }
    v18 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v19 = SBAppendSwitcherModifierResponse(v18, v5);

    [v4 handleWithReason:@"App Switcher Continuous Expose"];
    double v5 = (void *)v19;
  }

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  int v6 = [v5 isAdditiveModelEnabled];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
    id v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)&v10 appLayoutContainingAppLayout:v4];
  }
  CGFloat v8 = v7;

  return v8;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  int v6 = [v5 isAdditiveModelEnabled];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    CGFloat v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [v13 continuousExposeIdentifier];
          int v15 = [v14 isEqualToString:v4];

          if (v15) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
    id v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)&v17 appLayoutsForContinuousExposeIdentifier:v4];
  }

  return v7;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  id v4 = a3;
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  char v6 = [v5 isAdditiveModelEnabled];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
    id v7 = [(SBSwitcherModifier *)&v16 handleTapAppLayoutHeaderEvent:v4];
    if (self->_handlesTapAppLayoutHeaderEvents && ([v4 isHandled] & 1) == 0)
    {
      CGFloat v8 = [v4 appLayout];
      uint64_t v9 = objc_msgSend(v8, "itemForLayoutRole:", objc_msgSend(v4, "layoutRole"));

      if ([(SBAppSwitcherContinuousExposeSwitcherModifier *)self displayItemSupportsMultipleWindowsIndicator:v9])
      {
        uint64_t v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        [(SBSwitcherTransitionRequest *)v10 setSource:3];
        uint64_t v11 = [v9 bundleIdentifier];
        [(SBSwitcherTransitionRequest *)v10 setBundleIdentifierForAppExpose:v11];

        v12 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
      }
      else
      {
        uint64_t v10 = [[SBPulseDisplayItemSwitcherModifier alloc] initWithDisplayItem:v9];
        v12 = [[SBAddModifierSwitcherEventResponse alloc] initWithModifier:v10 level:3];
      }
      objc_super v13 = v12;
      uint64_t v14 = SBAppendSwitcherModifierResponse(v12, v7);

      id v7 = (void *)v14;
    }
  }

  return v7;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBSwitcherModifier *)&v11 handleTapOutsideToDismissEvent:v3];
  char v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    char v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    id v7 = +[SBSwitcherTransitionRequest requestForActivatingHomeScreen];
    CGFloat v8 = [(SBPerformTransitionSwitcherEventResponse *)v6 initWithTransitionRequest:v7 gestureInitiated:0];

    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v4];

    id v4 = (void *)v9;
  }
  return v4;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  char v5 = [(SBSwitcherModifier *)&v16 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_13;
  }
  if ([v4 phase] == 2)
  {
    --self->_ongoingAppLayoutRemovals;
    char v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
    if ([v6 count])
    {
    }
    else
    {
      unint64_t ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

      if (!ongoingAppLayoutRemovals)
      {
        uint64_t v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        v12 = +[SBAppLayout homeScreenAppLayout];
        [(SBSwitcherTransitionRequest *)v10 setAppLayout:v12];

        [(SBSwitcherTransitionRequest *)v10 setAutoPIPDisabled:1];
LABEL_12:
        objc_super v13 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
        uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v5];

        char v5 = (void *)v14;
        goto LABEL_13;
      }
    }
    CGFloat v8 = [v4 appLayout];
    if (!BSEqualObjects())
    {

      goto LABEL_13;
    }
    unint64_t v9 = self->_ongoingAppLayoutRemovals;

    if (v9) {
      goto LABEL_13;
    }
    uint64_t v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    objc_super v11 = +[SBAppLayout homeScreenAppLayout];
    [(SBSwitcherTransitionRequest *)v10 setAppLayout:v11];

    [(SBSwitcherTransitionRequest *)v10 setUnlockedEnvironmentMode:2];
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (CGRect)_scaledSwitcherViewBounds
{
  v16.receiver = self;
  v16.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)&v16 switcherViewBounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ((BSFloatIsOne() & 1) == 0)
  {
    CGAffineTransformMakeScale(&v15, self->_scaleFactor, self->_scaleFactor);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v18 = CGRectApplyAffineTransform(v17, &v15);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _frameForIndex:a3 withScaleApplied:0 scrollOffsetApplied:1];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  id v7 = a4;
  CGFloat v8 = [v7 itemForLayoutRole:a3];
  double v9 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v7];

  uint64_t v10 = [v9 autoLayoutItemForDisplayItem:v8];
  [v10 compactedPosition];
  [v9 compactedBoundingBox];
  [v10 size];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self screenScale];
  SBRectWithSize();
  UIRectCenteredAboutPointScale();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  CGFloat v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
  [(SBSwitcherLayoutCalculationsCache *)appLayoutLayoutCalculationsCache scaleForKey:v6 validityToken:v8 fallback:&__block_literal_global_298];
  double v10 = v9;

  return v10;
}

double __63__SBAppSwitcherContinuousExposeSwitcherModifier_scaleForIndex___block_invoke()
{
  return 1.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([(SBAppSwitcherContinuousExposeSwitcherModifier *)self _indexOfAppLayoutInItsPile:v6])
  {
    double v7 = 0.0;
  }
  else
  {
    double v7 = 1.0;
  }

  return v7;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  double v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  char v6 = [v5 isAdditiveModelEnabled];

  if (v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)SBAppSwitcherContinuousExposeSwitcherModifier;
    double v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)&v24 appLayoutOnStage];
    if (v7)
    {
      id v18 = v4;
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      double v9 = [v7 zOrderedItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __81__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
            v19[3] = &unk_1E6AF4B38;
            v19[4] = v14;
            double v15 = objc_msgSend(v7, "appLayoutWithItemsPassingTest:", v19, v18);
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      double v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];

      id v4 = v18;
    }
    else
    {
      double v16 = [MEMORY[0x1E4F1C978] array];
    }
  }
  else
  {
    double v16 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_34_1);
  }

  return v16;
}

BOOL __81__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] != 3;
}

uint64_t __81__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2()
{
  return BSEqualObjects();
}

- (id)visibleAppLayouts
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  double v5 = [v4 chamoisSettings];
  unint64_t v21 = [v5 numberOfVisibleItemsPerGroup];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v20 = self;
  id obj = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visiblePileIdentifiers];
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v11 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v20 appLayoutsForContinuousExposeIdentifier:v10];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          unint64_t v14 = 0;
          uint64_t v15 = *(void *)v23;
LABEL_8:
          uint64_t v16 = 0;
          if (v21 >= v14) {
            uint64_t v17 = v21 - v14;
          }
          else {
            uint64_t v17 = 0;
          }
          while (1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v11);
            }
            if (v17 == v16) {
              break;
            }
            [v3 addObject:*(void *)(*((void *)&v22 + 1) + 8 * v16++)];
            if (v13 == v16)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
              v14 += v16;
              if (v13) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return v3;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  double v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  uint64_t v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  uint64_t v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (id)topMostLayoutElements
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  double v5 = [v4 chamoisSettings];
  unint64_t v6 = [v5 numberOfVisibleItemsPerGroup];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v21 = self;
  id obj = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visiblePileIdentifiers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v11 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v21 appLayoutsForContinuousExposeIdentifier:v10];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v23;
LABEL_8:
          uint64_t v16 = 0;
          uint64_t v17 = v14 + v13;
          while (1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v11);
            }
            if (v14 + v16 > v6) {
              break;
            }
            [v3 addObject:*(void *)(*((void *)&v22 + 1) + 8 * v16++)];
            if (v13 == v16)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
              uint64_t v14 = v17;
              if (v13) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  return v3;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  unint64_t v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _indexOfAppLayoutInItsPile:a4];
  uint64_t v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  uint64_t v8 = [v7 chamoisSettings];
  unint64_t v9 = [v8 numberOfVisibleItemsPerGroup];

  double result = 0.0;
  if (v6 < v9) {
    return 1.0;
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  unint64_t v6 = [v5 chamoisSettings];
  [v6 switcherCornerRadius];

  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
  SBRectCornerRadiiForRadius();
  result.topRight = v10;
  result.bottomRight = v9;
  result.bottomLeft = v8;
  result.topLeft = v7;
  return result;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (double)homeScreenScale
{
  v2 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  id v3 = [v2 animationSettings];
  [v3 homeScreenScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)wallpaperScale
{
  v2 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  id v3 = [v2 animationSettings];
  [v3 wallpaperScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
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
  return 1;
}

- (BOOL)canSelectLeafWithModifierKeysInAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [v4 continuousExposeIdentifier];
  unint64_t v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v5];

  id v7 = [v6 firstObject];

  return v7 == v4;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  unint64_t v6 = [v4 set];
  id v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
  double v8 = [v5 continuousExposeIdentifier];

  unint64_t v9 = [v7 indexOfObject:v8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[v7 count] >= 3)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __90__SBAppSwitcherContinuousExposeSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke;
    double v19 = &unk_1E6B08FF0;
    uint64_t v20 = self;
    id v21 = v6;
    double v10 = (void (**)(void, void))MEMORY[0x1D948C7A0](&v16);
    if (v9)
    {
      uint64_t v11 = objc_msgSend(v7, "objectAtIndex:", v9 - 1, v16, v17, v18, v19, v20);
      ((void (**)(void, void *))v10)[2](v10, v11);

      if (v9 != 1)
      {
        uint64_t v12 = [v7 objectAtIndex:v9 - 2];
        ((void (**)(void, void *))v10)[2](v10, v12);
      }
    }
    if (v9 < objc_msgSend(v7, "count", v16, v17, v18, v19, v20) - 1)
    {
      uint64_t v13 = [v7 objectAtIndex:v9 + 1];
      ((void (**)(void, void *))v10)[2](v10, v13);
    }
    if (v9 < [v7 count] - 2)
    {
      uint64_t v14 = [v7 objectAtIndex:v9 + 2];
      ((void (**)(void, void *))v10)[2](v10, v14);
    }
  }

  return v6;
}

void __90__SBAppSwitcherContinuousExposeSwitcherModifier_neighboringAppLayoutsForFocusedAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) appLayoutsForContinuousExposeIdentifier:a2];
  id v5 = [v3 firstObject];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
    id v4 = v5;
  }
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return a3 == 0;
}

- (id)activeLeafAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
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
  return 5;
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
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
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
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  id v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  uint64_t v4 = [v3 numberOfSnapshotsToCacheInSwitcher];

  uint64_t v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visiblePileRange];
  BOOL isScrollingForward = self->_isScrollingForward;
  return -[SBAppSwitcherContinuousExposeSwitcherModifier _appLayoutsToCacheSnapshotsWithVisiblePileRange:numberOfSnapshotsToCache:biasForward:](self, "_appLayoutsToCacheSnapshotsWithVisiblePileRange:numberOfSnapshotsToCache:biasForward:", v6, v5, v4, isScrollingForward);
}

- (_NSRange)_visiblePileRange
{
  id v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visibleSwitcherBoundsIncludingShadow];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [v3 count];
  if (v12)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    while (v16 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileAtIndex:v13 withScrollOffsetApplied:1];
      v38.origin.CGFloat x = v19;
      v38.origin.CGFloat y = v20;
      v38.size.CGFloat width = v21;
      v38.size.CGFloat height = v22;
      v37.origin.CGFloat x = v5;
      v37.origin.CGFloat y = v7;
      v37.size.CGFloat width = v9;
      v37.size.CGFloat height = v11;
      BOOL v23 = CGRectIntersectsRect(v37, v38);
      if (v23) {
        uint64_t v24 = v13;
      }
      else {
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v23) {
        uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v25 = v13;
      }
      if ((v13 & 1) == 0 && v14 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v14 = v24;
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL && (v13 & 1) != 0) {
        unint64_t v17 = v24;
      }
      BOOL v27 = v14 != 0x7FFFFFFFFFFFFFFFLL && (v13 & 1) == 0;
      if (v27 && v16 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v16 = v25;
      }
      if ((v13 & (v17 != 0x7FFFFFFFFFFFFFFFLL) & (v15 == 0x7FFFFFFFFFFFFFFFLL)) != 0) {
        uint64_t v15 = v25;
      }
      if (v12 == ++v13)
      {
        if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_32;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
    uint64_t v16 = v12;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v28 = v12;
  }
  else {
    uint64_t v28 = v15;
  }
  unint64_t v29 = v28 - 2;
  if (v14 >= v17) {
    unint64_t v30 = v17;
  }
  else {
    unint64_t v30 = v14;
  }
  if (v16 - 2 > v29) {
    unint64_t v29 = v16 - 2;
  }
  BOOL v31 = v30 == 0x7FFFFFFFFFFFFFFFLL || v29 == 0x7FFFFFFFFFFFFFFFLL;
  if (v31) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = v29 - v30 + 1;
  }
  if (v31) {
    NSUInteger v33 = 0;
  }
  else {
    NSUInteger v33 = v30;
  }

  NSUInteger v34 = v33;
  NSUInteger v35 = v32;
  result.length = v35;
  result.location = v34;
  return result;
}

- (id)_appLayoutsToCacheSnapshotsWithVisiblePileRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a3.length)
  {
    BOOL v5 = a5;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    v42 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
    unint64_t v8 = [v42 count];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    NSUInteger v10 = location + length;
    if (v5)
    {
      uint64_t v11 = 2;
      uint64_t v12 = 1;
      if (location < v10)
      {
        NSUInteger v13 = location;
        do
        {
          unint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
          [v9 addObject:v14];

          ++v13;
          --length;
        }
        while (length);
      }
    }
    else if (v10 <= location)
    {
      uint64_t v11 = 1;
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v11 = 1;
      uint64_t v12 = 2;
      NSUInteger v16 = location + length;
      do
      {
        unint64_t v17 = [NSNumber numberWithUnsignedInteger:--v16];
        [v9 addObject:v17];
      }
      while (v16 > location);
    }
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    NSUInteger v63 = location - 1;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    NSUInteger v59 = v10;
    while (v10 < v8 || (v61[3] & 0x8000000000000000) == 0)
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke;
      v51[3] = &unk_1E6AF6420;
      v53 = &v56;
      unint64_t v54 = v8;
      uint64_t v55 = v11;
      id v18 = v9;
      id v52 = v18;
      CGFloat v19 = (void (**)(void))MEMORY[0x1D948C7A0](v51);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke_2;
      v47[3] = &unk_1E6AF6358;
      v49 = &v60;
      uint64_t v50 = v12;
      id v48 = v18;
      uint64_t v20 = MEMORY[0x1D948C7A0](v47);
      CGFloat v21 = (void (**)(void))v20;
      if (v5)
      {
        v19[2](v19);
        CGFloat v22 = v21;
      }
      else
      {
        (*(void (**)(uint64_t))(v20 + 16))(v20);
        CGFloat v22 = v19;
      }
      ((void (*)(void))v22[2])();

      NSUInteger v10 = v57[3];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v23 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
    uint64_t v24 = [v23 chamoisSettings];
    unint64_t v25 = [v24 numberOfVisibleItemsPerGroup];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = v9;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v64 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v44;
LABEL_22:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v26);
        }
        unint64_t v30 = *(void **)(*((void *)&v43 + 1) + 8 * v29);
        unint64_t v31 = [v15 count];
        unint64_t v32 = a4 >= v31 ? a4 - v31 : 0;
        if (v31 >= a4) {
          break;
        }
        NSUInteger v33 = objc_msgSend(v42, "objectAtIndex:", objc_msgSend(v30, "unsignedIntegerValue"));
        NSUInteger v34 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v33];
        unint64_t v35 = [v34 count];
        if (v35 >= v25) {
          unint64_t v36 = v25;
        }
        else {
          unint64_t v36 = v35;
        }
        if (v36 >= v32) {
          unint64_t v37 = v32;
        }
        else {
          unint64_t v37 = v36;
        }
        CGRect v38 = objc_msgSend(v34, "subarrayWithRange:", 0, v37);
        [v15 addObjectsFromArray:v38];

        if (v27 == ++v29)
        {
          uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v64 count:16];
          if (v27) {
            goto LABEL_22;
          }
          break;
        }
      }
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v15;
}

void __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke(void *a1)
{
  unint64_t v1 = a1[6];
  unint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 24);
  BOOL v3 = v1 >= v2;
  unint64_t v4 = v1 - v2;
  if (!v3) {
    unint64_t v4 = 0;
  }
  if (v4 >= a1[7]) {
    unint64_t v5 = a1[7];
  }
  else {
    unint64_t v5 = v4;
  }
  for (; v5; --v5)
  {
    CGFloat v7 = (void *)a1[4];
    unint64_t v8 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
    [v7 addObject:v8];

    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
}

void __134__SBAppSwitcherContinuousExposeSwitcherModifier__appLayoutsToCacheSnapshotsWithVisiblePileRange_numberOfSnapshotsToCache_biasForward___block_invoke_2(void *a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (v1 + 1 < a1[6]) {
    uint64_t v2 = v1 + 1;
  }
  else {
    uint64_t v2 = a1[6];
  }
  for (; v2; --v2)
  {
    unint64_t v4 = (void *)a1[4];
    unint64_t v5 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
    [v4 addObject:v5];

    --*(void *)(*(void *)(a1[5] + 8) + 24);
  }
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
  BOOL v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self isReduceMotionEnabled];

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

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  unint64_t result = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _indexOfLeadingAppLayout];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return result;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  int v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  unint64_t v5 = [v4 count];

  if (v5 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _indexOfLeadingAppLayout];
}

- (unint64_t)_indexOfLeadingAppLayout
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visibleSwitcherBoundsIncludingShadow];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileWithIdentifier:v16 withScrollOffsetApplied:1];
        v33.origin.CGFloat x = v17;
        v33.origin.CGFloat y = v18;
        v33.size.CGFloat width = v19;
        v33.size.CGFloat height = v20;
        v32.origin.CGFloat x = v4;
        v32.origin.CGFloat y = v6;
        v32.size.CGFloat width = v8;
        v32.size.CGFloat height = v10;
        if (CGRectIntersectsRect(v32, v33))
        {
          CGFloat v21 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v16];
          CGFloat v22 = [v21 firstObject];

          if (v22)
          {
            uint64_t v24 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
            unint64_t v23 = [v24 indexOfObject:v22];

            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v23;
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

- (id)appLayoutsToResignActive
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  double v3 = (void *)MEMORY[0x1E4F1CAD0];
  CGFloat v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  double v5 = [v3 setWithArray:v4];
  CGFloat v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334AC40];

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

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ([(SBAppSwitcherContinuousExposeSwitcherModifier *)self prefersStripHiddenAndDisabled])
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    double v9 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v78 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:*(void *)(*((void *)&v77 + 1) + 8 * i)];
          id v15 = [v14 continuousExposeIdentifier];
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v8 array];
    goto LABEL_69;
  }
  CGFloat v17 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutOnStage];
  CGFloat v18 = [v17 continuousExposeIdentifier];

  if (v18)
  {
    CGFloat v19 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v18];
    unint64_t v20 = [v19 count];

    if (v20 < 2)
    {
      if (self->_showsActiveAppLayoutInSwitcher) {
        [v8 addObject:v18];
      }
      char v22 = 0;
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
    uint64_t v21 = [v7 indexOfObject:v18];
  }
  else
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  char v22 = 1;
LABEL_18:
  id v66 = v6;
  unint64_t v23 = [v7 count];
  if (v23)
  {
    unint64_t v24 = v23;
    unint64_t v25 = v23 >> 1;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v26 = v23 >> 1;
    }
    else {
      unint64_t v26 = v21;
    }
    if (v23 >= 6) {
      -[SBAppSwitcherContinuousExposeSwitcherModifier adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:]();
    }
    char v67 = v22;
    if (__SBStripOrderingMapsByStripSize__onceToken != -1) {
      dispatch_once(&__SBStripOrderingMapsByStripSize__onceToken, &__block_literal_global_338);
    }
    long long v27 = NSNumber;
    id v28 = (id)__SBStripOrderingMapsByStripSize__map;
    long long v29 = [v27 numberWithUnsignedInteger:v24];
    unint64_t v30 = [v28 objectForKey:v29];

    if (v25 > v26 || v24 == 5) {
      unint64_t v32 = v26;
    }
    else {
      unint64_t v32 = v24 + ~v26;
    }
    CGRect v33 = [NSNumber numberWithUnsignedInteger:v32];
    NSUInteger v34 = [v30 objectForKey:v33];

    unint64_t v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
    unint64_t v36 = v35;
    if ((v67 & 1) != 0 || !self->_showsActiveAppLayoutInSwitcher)
    {
      uint64_t v65 = v34;
      [v35 addObjectsFromArray:v34];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v48 = v36;
      id v49 = v36;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v74 != v52) {
              objc_enumerationMutation(v49);
            }
            unint64_t v54 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * j), "integerValue"));
            [v8 addObject:v54];
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v73 objects:v82 count:16];
        }
        while (v51);
      }

      NSUInteger v34 = v65;
      unint64_t v36 = v48;
    }
    else if ([v8 containsObject:v18])
    {
      NSUInteger v63 = v36;
      unint64_t v37 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
      v68 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
      uint64_t v38 = 0;
      unint64_t v39 = v24;
      do
      {
        if (v38) {
          v40 = v68;
        }
        else {
          v40 = v37;
        }
        [v34 objectAtIndex:v38];
        v42 = v41 = v37;
        [v40 addObject:v42];

        unint64_t v37 = v41;
        ++v38;
      }
      while (v39 != v38);
      v64 = v34;
      if (v39 != -1)
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if ((k + 1))
          {
            if ([v68 count]) {
              long long v44 = v68;
            }
            else {
              long long v44 = v37;
            }
          }
          else if ([v37 count])
          {
            long long v44 = v37;
          }
          else
          {
            long long v44 = v68;
          }
          id v45 = v44;
          long long v46 = [v45 firstObject];
          v47 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v46, "integerValue"));
          [v8 addObject:v47];

          [v45 removeObject:v46];
          unint64_t v37 = v41;
        }
      }

      unint64_t v36 = v63;
      NSUInteger v34 = v64;
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v55 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v70 != v58) {
          objc_enumerationMutation(v55);
        }
        uint64_t v60 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:*(void *)(*((void *)&v69 + 1) + 8 * m)];
        v61 = [v60 continuousExposeIdentifier];
        if ((BSEqualStrings() & 1) == 0) {
          [v8 addObject:v61];
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v57);
  }

  uint64_t v16 = [v8 array];

  id v6 = v66;
LABEL_69:

  return v16;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBAppSwitcherContinuousExposeSwitcherModifier *)self prefersStripHiddenAndDisabled])
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_93;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  unint64_t v76 = [v7 numberOfRowsWhileInApp];

  id v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutOnStage];
  v83 = [v8 continuousExposeIdentifier];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  double v9 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v108 objects:v117 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v109;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v109 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:*(void *)(*((void *)&v108 + 1) + 8 * v13)];
      if (!v8 || ([v8 containsAnyItemFromAppLayout:v14] & 1) == 0)
      {
        id v15 = [v14 continuousExposeIdentifier];
        [v6 addObject:v15];
      }
      uint64_t v16 = [v6 count];

      if (v16 == v76) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v108 objects:v117 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (v83)
  {
    CGFloat v17 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v83];
    if (([v6 containsObject:v83] & 1) != 0 || !objc_msgSend(v17, "count")) {
      goto LABEL_26;
    }
    if ([v17 count] == 1)
    {
      CGFloat v18 = [v17 firstObject];
      if (v8
        && (([v8 isOrContainsAppLayout:v18] & 1) != 0
         || [v18 isOrContainsAppLayout:v8]))
      {

LABEL_26:
        goto LABEL_27;
      }
    }
    if ([v6 count] == v76)
    {
      CGFloat v19 = [v6 lastObject];
      [v6 removeObject:v19];
    }
    [v6 insertObject:v83 atIndex:0];
    goto LABEL_26;
  }
LABEL_27:
  if ([v4 count] <= v76)
  {
    double v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    unint64_t v20 = objc_msgSend(v4, "subarrayWithRange:", 0, v76);
    double v5 = (void *)[v20 mutableCopy];
  }
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
  v106[3] = &unk_1E6AF4A20;
  id v21 = v4;
  id v107 = v21;
  char v22 = objc_msgSend(v6, "bs_filter:", v106);
  unint64_t v23 = [v22 array];
  unint64_t v24 = (void *)[v23 mutableCopy];

  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2;
  v104[3] = &unk_1E6AF4A20;
  id v25 = v6;
  unint64_t v26 = v24;
  id v73 = v25;
  id v105 = v25;
  long long v27 = objc_msgSend(v21, "bs_filter:", v104);
  id v28 = (void *)[v27 mutableCopy];

  if ([v24 count] || objc_msgSend(v28, "count"))
  {
    while ([v24 count] && objc_msgSend(v28, "count"))
    {
      long long v29 = [v24 firstObject];
      unint64_t v30 = [v28 firstObject];
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", objc_msgSend(v5, "indexOfObject:", v30), v29);
      [v28 removeObject:v30];
      [v24 removeObject:v29];
    }
    if ([v24 count] || objc_msgSend(v28, "count"))
    {
      long long v74 = v28;
      v82 = v5;
      long long v71 = v8;
      id v72 = v4;
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      unint64_t v32 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v100 objects:v116 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v101 != v35) {
              objc_enumerationMutation(v32);
            }
            unint64_t v37 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:*(void *)(*((void *)&v100 + 1) + 8 * i)];
            uint64_t v38 = [v37 continuousExposeIdentifier];
            [v31 addObject:v38];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v100 objects:v116 count:16];
        }
        while (v34);
      }

      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v70 = v26;
      id obj = v26;
      uint64_t v39 = [obj countByEnumeratingWithState:&v96 objects:v115 count:16];
      double v5 = v82;
      unint64_t v40 = v76;
      if (v39)
      {
        uint64_t v41 = v39;
        uint64_t v42 = *(void *)v97;
        uint64_t v75 = *(void *)v97;
        do
        {
          uint64_t v43 = 0;
          uint64_t v78 = v41;
          do
          {
            if (*(void *)v97 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void *)(*((void *)&v96 + 1) + 8 * v43);
            if ([v5 count] < v40)
            {
              [v5 addObject:v44];
              goto LABEL_66;
            }
            uint64_t v80 = v43;
            long long v94 = 0u;
            long long v95 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            id v45 = v5;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v92 objects:v114 count:16];
            if (!v46)
            {
              id v48 = v45;
              uint64_t v41 = v78;
              goto LABEL_65;
            }
            uint64_t v47 = v46;
            uint64_t v77 = v44;
            id v48 = 0;
            uint64_t v49 = *(void *)v93;
            unint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v93 != v49) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v52 = *(void **)(*((void *)&v92 + 1) + 8 * j);
                unint64_t v53 = [v31 indexOfObject:v52];
                if (v53 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  unint64_t v54 = v53;
                  if (v50 == 0x7FFFFFFFFFFFFFFFLL || v53 > v50)
                  {
                    id v55 = v52;

                    unint64_t v50 = v54;
                    id v48 = v55;
                  }
                }
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v92 objects:v114 count:16];
            }
            while (v47);

            uint64_t v43 = v80;
            double v5 = v82;
            uint64_t v42 = v75;
            unint64_t v40 = v76;
            uint64_t v41 = v78;
            if (v48)
            {
              objc_msgSend(v45, "replaceObjectAtIndex:withObject:", objc_msgSend(v45, "indexOfObject:", v48), v77);
LABEL_65:
            }
LABEL_66:
            ++v43;
          }
          while (v43 != v41);
          uint64_t v41 = [obj countByEnumeratingWithState:&v96 objects:v115 count:16];
        }
        while (v41);
      }

      [obj removeAllObjects];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v56 = v74;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v88 objects:v113 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v89;
        do
        {
          uint64_t v60 = 0;
          uint64_t v81 = v58;
          do
          {
            if (*(void *)v89 != v59) {
              objc_enumerationMutation(v56);
            }
            uint64_t v61 = *(void *)(*((void *)&v88 + 1) + 8 * v60);
            if ([v5 containsObject:v61])
            {
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v62 = v31;
              uint64_t v63 = [v62 countByEnumeratingWithState:&v84 objects:v112 count:16];
              if (v63)
              {
                uint64_t v64 = v63;
                uint64_t v65 = *(void *)v85;
LABEL_76:
                uint64_t v66 = 0;
                while (1)
                {
                  if (*(void *)v85 != v65) {
                    objc_enumerationMutation(v62);
                  }
                  char v67 = *(void **)(*((void *)&v84 + 1) + 8 * v66);
                  if ((BSEqualStrings() & 1) == 0
                    && ([v82 containsObject:v67] & 1) == 0
                    && ![v56 containsObject:v67])
                  {
                    break;
                  }
                  if (v64 == ++v66)
                  {
                    uint64_t v64 = [v62 countByEnumeratingWithState:&v84 objects:v112 count:16];
                    if (v64) {
                      goto LABEL_76;
                    }
                    goto LABEL_84;
                  }
                }
                id v68 = v67;

                if (!v68) {
                  goto LABEL_87;
                }
                double v5 = v82;
                objc_msgSend(v82, "replaceObjectAtIndex:withObject:", objc_msgSend(v82, "indexOfObject:", v61), v68);
              }
              else
              {
LABEL_84:

LABEL_87:
                double v5 = v82;
                [v82 removeObject:v61];
              }
              uint64_t v58 = v81;
            }
            ++v60;
          }
          while (v60 != v58);
          uint64_t v58 = [v56 countByEnumeratingWithState:&v88 objects:v113 count:16];
        }
        while (v58);
      }

      [v56 removeAllObjects];
      id v8 = v71;
      id v4 = v72;
      unint64_t v26 = v70;
      id v28 = v74;
    }
  }

LABEL_93:
  return v5;
}

uint64_t __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __122__SBAppSwitcherContinuousExposeSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _frameForAppLayout:v6 withScaledApplied:1 scrollOffsetApplied:0];
  double v8 = v7;
  if (BSFloatIsZero())
  {
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _heightForCardInSwitcherWithScaleFactor:0];
    double v8 = v9;
  }
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self containerViewBounds];
  -[SBAppSwitcherContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6);
  double v11 = v10;

  int IsZero = BSFloatIsZero();
  double result = v8 / v11;
  if (IsZero) {
    return 1.0;
  }
  return result;
}

- (id)scrollViewAttributes
{
  double v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _contentSize];
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  [(SBSwitcherScrollViewAttributes *)v3 setDecelerationRate:*MEMORY[0x1E4F43CE0]];
  [(SBSwitcherScrollViewAttributes *)v3 setScrollViewPagingEnabled:0];
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBSwitcherScrollViewAttributes *)v3 setInterpolatesDuringSwipeToKill:0];
  return v3;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  -[SBAppSwitcherContinuousExposeSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  return CGRectGetMinY(*(CGRect *)&v5);
}

- (CGSize)_contentSize
{
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherViewBounds];
  double v5 = v4;
  double width = self->_cachedFittedContentSize.width;
  if (width < v3) {
    double width = v3;
  }
  result.CGFloat height = v5;
  result.double width = width;
  return result;
}

- (CGSize)_fittedContentSize
{
  double width = self->_cachedFittedContentSize.width;
  double height = self->_cachedFittedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  int v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self isRTLEnabled];
  double v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherViewBounds];
  double v10 = v9;
  [v8 switcherHorizontalEdgeSpacing];
  double v12 = v11;
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _frameForIndex:a3 withScaleApplied:1 scrollOffsetApplied:0];
  double v17 = 0.0;
  switch(a4)
  {
    case 0:
    case 3:
      if (v7) {
        double v17 = v12;
      }
      else {
        double v17 = v10 - v15 - v12;
      }
      break;
    case 1:
      if (v7) {
        double v17 = v10 - v15 - v12;
      }
      else {
        double v17 = v12;
      }
      break;
    case 2:
      double v17 = (v10 - v15) * 0.5;
      break;
    default:
      break;
  }
  double v18 = CGRectGetMinX(*(CGRect *)&v13) - v17;
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _contentSize];
  double v20 = v19 - v10;
  double v21 = fmax(v18, 0.0);
  if (v20 <= v21) {
    double v22 = v20;
  }
  else {
    double v22 = v21;
  }

  double v23 = 0.0;
  double v24 = v22;
  result.CGFloat y = v23;
  result.CGFloat x = v24;
  return result;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  uint64_t v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visiblePileRange];
  unint64_t v6 = v5;
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileAtIndex:v4 withScrollOffsetApplied:0];
  if (v6 >= 2)
  {
    CGFloat v11 = v7;
    CGFloat v12 = v8;
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileAtIndex:v4 + 1 withScrollOffsetApplied:0];
    double MaxX = CGRectGetMaxX(v30);
    v31.origin.CGFloat x = v11;
    v31.origin.CGFloat y = v12;
    v31.size.double width = v13;
    v31.size.double height = v14;
    if (MaxX > CGRectGetMaxX(v31)) {
      ++v4;
    }
  }
  double result = 0.0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBAppSwitcherContinuousExposeSwitcherModifier _boundingFrameForPileAtIndex:withScrollOffsetApplied:](self, "_boundingFrameForPileAtIndex:withScrollOffsetApplied:", v4, 1, 0.0);
    double v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    if ([(SBAppSwitcherContinuousExposeSwitcherModifier *)self isRTLEnabled])
    {
      [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherViewBounds];
      double v26 = v25 - v18;
    }
    else
    {
      v32.origin.CGFloat x = v18;
      v32.origin.CGFloat y = v20;
      v32.size.double width = v22;
      v32.size.double height = v24;
      double v26 = CGRectGetMaxX(v32);
    }
    long long v27 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
    [v27 switcherHorizontalInterItemSpacing];
    double v29 = v28;

    return v26 + v29;
  }
  return result;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)shouldConfigureInAppDockVisibleAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 3;
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

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 1;
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
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
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
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (id)_currentLayoutCalculationsValidityToken
{
  double v3 = [SBSwitcherLayoutCalculationsCacheValidityToken alloc];
  uint64_t v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsGenerationCount];
  uint64_t v5 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersGenerationCount];
  uint64_t v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _scaledSwitcherViewBounds];
  double v7 = -[SBSwitcherLayoutCalculationsCacheValidityToken initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:](v3, "initWithAppLayoutsGenCount:continuousExposeIdentifiersGenCount:switcherInterfaceOrientation:containerViewBounds:modifierEventGenCount:", v4, v5, v6, self->_modifierEventGenCount);
  return v7;
}

- (id)_compactedBoundingBoxSizesByAppLayout
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  cached_compactedBoundingBoxSizesByAppLayout = self->_cached_compactedBoundingBoxSizesByAppLayout;
  if (!cached_compactedBoundingBoxSizesByAppLayout)
  {
    uint64_t v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
    uint64_t v5 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          CGFloat v12 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v11];
          [v12 compactedBoundingBox];
          double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v13, v14);
          [(NSDictionary *)v5 setObject:v15 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v16 = self->_cached_compactedBoundingBoxSizesByAppLayout;
    self->_cached_compactedBoundingBoxSizesByAppLayout = v5;

    cached_compactedBoundingBoxSizesByAppLayout = self->_cached_compactedBoundingBoxSizesByAppLayout;
  }
  return cached_compactedBoundingBoxSizesByAppLayout;
}

- (id)buildLayoutCalculationsForCache:(id)a3
{
  double v3 = self;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  uint64_t v5 = [v4 chamoisSettings];

  id v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 chamoisLayoutAttributes];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 containerViewBounds];
  double scaleFactor = v3->_scaleFactor;
  double v108 = v7;
  [v6 screenEdgePadding];
  [v6 switcherHorizontalEdgeSpacing];
  double v9 = v8;
  double horizontalEdgeSpacingScaleFactor = v3->_horizontalEdgeSpacingScaleFactor;
  double v11 = v8 * horizontalEdgeSpacingScaleFactor;
  [v6 switcherHorizontalInterItemSpacing];
  double v123 = v12 * v3->_scaleFactor;
  [v6 switcherVerticalEdgeSpacing];
  [v6 switcherVerticalInterItemSpacing];
  long long v109 = v6;
  [v6 switcherPileCardMinimumPeekAmount];
  double v14 = v13;
  double v15 = v3->_scaleFactor;
  int v16 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 isRTLEnabled];
  long long v110 = v5;
  unint64_t v17 = [v5 numberOfVisibleItemsPerGroup];
  long long v18 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 continuousExposeIdentifiersInSwitcher];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 _heightForCardInSwitcherWithScaleFactor:1];
  double v20 = v19;
  cached_compactedBoundingBoxSizesByAppLayout = v3->_cached_compactedBoundingBoxSizesByAppLayout;
  v3->_cached_compactedBoundingBoxSizesByAppLayout = 0;

  CGFloat v22 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 _compactedBoundingBoxSizesByAppLayout];
  uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v18, "count"));
  id v129 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v24 = -(v9 * horizontalEdgeSpacingScaleFactor);
  if (v16) {
    double v24 = v11;
  }
  double v25 = v24 + 0.0;
  v121 = v23;
  v122 = v18;
  if (objc_msgSend(v18, "count", *(void *)&v11))
  {
    unint64_t v26 = 0;
    double v127 = v14 * v15;
    double v119 = *MEMORY[0x1E4F1DB20];
    double v117 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v118 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v116 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v114 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v115 = *MEMORY[0x1E4F1DB28];
    double v112 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v113 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = 1.0;
    if (v16) {
      double v27 = -1.0;
    }
    double v111 = -v27;
    double v28 = v25;
    double v128 = v20;
    v120 = v3;
    do
    {
      uint64_t v29 = [v18 objectAtIndex:v26];
      CGRect v30 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 appLayoutsForContinuousExposeIdentifier:v29];
      uint64_t v31 = [v30 count];
      double v125 = v28;
      double v126 = v25;
      if (v26) {
        double v32 = v28;
      }
      else {
        double v32 = v25;
      }
      v124 = (void *)v29;
      if (v31)
      {
        uint64_t v33 = v31;
        unint64_t v34 = 0;
        double y = v118;
        double x = v119;
        double v133 = v32;
        double height = v116;
        double width = v117;
        double v39 = v32;
        do
        {
          unint64_t v40 = [v30 objectAtIndex:v34];
          uint64_t v41 = [v22 objectForKey:v40];
          uint64_t v42 = v41;
          if (v41)
          {
            [v41 CGSizeValue];
            double v44 = v20 / v43 + (double)v34 * -0.01;
            double v46 = v45 * v44;
            double v132 = v32;
            CGFloat v130 = y;
            CGFloat v131 = width;
            if (v34)
            {
              if (v16)
              {
                double v47 = v133;
                if (v133 < v127 + v39 - v46) {
                  double v47 = v127 + v39 - v46;
                }
              }
              else
              {
                double v47 = v133;
                if (v133 >= v39 - v127 + v46) {
                  double v47 = v39 - v127 + v46;
                }
              }
            }
            else
            {
              double v47 = v133;
            }
            double v133 = v47;
            SBRectWithSize();
            SBUnintegralizedRectCenteredAboutPoint();
            double v49 = v48;
            double v51 = v50;
            double v53 = v52;
            double v55 = v54;
            id v56 = objc_alloc_init(SBSwitcherLayoutCalculations);
            -[SBSwitcherLayoutCalculations setFrame:](v56, "setFrame:", v49, v51, v53, v55);
            [(SBSwitcherLayoutCalculations *)v56 setScale:v44];
            [v129 setObject:v56 forKey:v40];
            double v57 = v49;
            double v58 = v51;
            double v59 = v53;
            double v60 = v55;
            if (v16) {
              double MaxX = CGRectGetMaxX(*(CGRect *)&v57);
            }
            else {
              double MaxX = CGRectGetMinX(*(CGRect *)&v57);
            }
            double v39 = MaxX;
            double v32 = v132;
            if (v34 < v17) {
              double v32 = MaxX;
            }
            SBRectWithSize();
            SBUnintegralizedRectCenteredAboutPoint();
            v149.origin.double x = v62;
            v149.origin.double y = v63;
            v149.size.double width = v64;
            v149.size.double height = v65;
            v146.origin.double x = x;
            v146.origin.double y = v130;
            v146.size.double width = v131;
            v146.size.double height = height;
            CGRect v147 = CGRectUnion(v146, v149);
            double x = v147.origin.x;
            double y = v147.origin.y;
            double width = v147.size.width;
            double height = v147.size.height;

            double v20 = v128;
          }

          ++v34;
        }
        while (v33 != v34);
      }
      else
      {
        double height = v116;
        double width = v117;
        double y = v118;
        double x = v119;
      }
      v148.origin.double x = x;
      v148.origin.double y = y;
      v148.size.double width = width;
      v148.size.double height = height;
      BOOL IsNull = CGRectIsNull(v148);
      double v68 = v114;
      double v67 = v115;
      if (!IsNull)
      {
        double v67 = x;
        double v68 = y;
      }
      double v70 = v112;
      double v69 = v113;
      if (!IsNull)
      {
        double v69 = width;
        double v70 = height;
      }
      double v28 = v125;
      double v25 = v126;
      if (v26) {
        double v28 = v32 + v111 * v123;
      }
      else {
        double v25 = v32 + v111 * v123;
      }
      long long v71 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v67, v68, v69, v70);
      uint64_t v23 = v121;
      [v121 setObject:v71 forKey:v124];

      ++v26;
      long long v18 = v122;
      double v3 = v120;
    }
    while (v26 < [v122 count]);
  }
  else
  {
    double v28 = v25;
  }
  double v72 = v108 * scaleFactor;
  double v73 = v106 - v123;
  p_double width = &v3->_cachedFittedContentSize.width;
  if (v16)
  {
    if (v25 >= v28) {
      double v75 = v25;
    }
    else {
      double v75 = v28;
    }
    *p_double width = v73 + v75;
    v3->_cachedFittedContentSize.double height = v72;
    objc_storeStrong((id *)&v3->_cachedPileBoundingFrameByPileIdentifier, v23);
  }
  else
  {
    if (v25 >= v28) {
      double v76 = v28;
    }
    else {
      double v76 = v25;
    }
    *p_double width = v73 - v76;
    v3->_cachedFittedContentSize.double height = v72;
    uint64_t v77 = v3;
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v3 _contentSize];
    double v79 = v78;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    id v80 = v129;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v138 objects:v143 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v139 != v83) {
            objc_enumerationMutation(v80);
          }
          long long v85 = [v80 objectForKey:*(void *)(*((void *)&v138 + 1) + 8 * i)];
          [v85 frame];
          [v85 setFrame:v79 + v86];
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v138 objects:v143 count:16];
      }
      while (v82);
    }

    long long v87 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v23, "count"));
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v88 = v23;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v134 objects:v142 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v135;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v135 != v91) {
            objc_enumerationMutation(v88);
          }
          uint64_t v93 = *(void *)(*((void *)&v134 + 1) + 8 * j);
          long long v94 = [v88 objectForKey:v93];
          [v94 CGRectValue];
          double v96 = v95;
          double v98 = v97;
          double v100 = v99;
          double v102 = v101;

          long long v103 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v79 + v96, v98, v100, v102);
          [(NSDictionary *)v87 setObject:v103 forKey:v93];
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v134 objects:v142 count:16];
      }
      while (v90);
    }

    cachedPileBoundingFrameByPileIdentifier = v77->_cachedPileBoundingFrameByPileIdentifier;
    v77->_cachedPileBoundingFrameByPileIdentifier = v87;

    uint64_t v23 = v121;
    long long v18 = v122;
  }

  return v129;
}

- (CGRect)_visibleSwitcherBoundsIncludingShadow
{
  double v3 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherSettings];
  [v3 switcherCardShadowRadius];
  double v5 = v4;

  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherViewBounds];
  return CGRectInset(*(CGRect *)&v6, v5 * -2.8, v5 * -2.8);
}

- (id)_visiblePileIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _visibleSwitcherBoundsIncludingShadow];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileAtIndex:v13 withScrollOffsetApplied:1];
      v22.origin.double x = v14;
      v22.origin.double y = v15;
      v22.size.double width = v16;
      v22.size.double height = v17;
      v21.origin.double x = v5;
      v21.origin.double y = v7;
      v21.size.double width = v9;
      v21.size.double height = v11;
      if (CGRectIntersectsRect(v21, v22))
      {
        long long v18 = [v12 objectAtIndex:v13];
        [v3 addObject:v18];
      }
      ++v13;
    }
    while (v13 < [v12 count]);
  }

  return v3;
}

- (unint64_t)_indexOfAppLayoutInItsPile:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 continuousExposeIdentifier];
  double v6 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v5];
  unint64_t v7 = [v6 indexOfObject:v4];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v7;
  }
}

- (CGRect)_frameForIndex:(unint64_t)a3 withScaleApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  CGFloat v9 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self appLayouts];
  double v10 = [v9 objectAtIndex:a3];

  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _frameForAppLayout:v10 withScaledApplied:v6 scrollOffsetApplied:v5];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)_frameForAppLayout:(id)a3 withScaledApplied:(BOOL)a4 scrollOffsetApplied:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  double v10 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
  [(SBSwitcherLayoutCalculationsCache *)appLayoutLayoutCalculationsCache frameForKey:v8 validityToken:v10 fallback:&__block_literal_global_56_1];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if (!a4)
  {
    double v19 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _compactedBoundingBoxSizesByAppLayout];
    double v20 = [v19 objectForKey:v8];
    [v20 CGSizeValue];

    SBRectWithSize();
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    double v12 = v21;
    double v14 = v22;
    double v16 = v23;
    double v18 = v24;
  }
  if (v5)
  {
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)self scrollViewContentOffset];
    double v12 = v12 - v25;
  }

  double v26 = v12;
  double v27 = v14;
  double v28 = v16;
  double v29 = v18;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

double __106__SBAppSwitcherContinuousExposeSwitcherModifier__frameForAppLayout_withScaledApplied_scrollOffsetApplied___block_invoke()
{
  return *MEMORY[0x1E4F1DB28];
}

- (CGRect)_boundingFrameForPileAtIndex:(unint64_t)a3 withScrollOffsetApplied:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
  id v8 = [v7 objectAtIndex:a3];

  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _boundingFrameForPileWithIdentifier:v8 withScrollOffsetApplied:v4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_boundingFrameForPileWithIdentifier:(id)a3 withScrollOffsetApplied:(BOOL)a4
{
  BOOL v4 = a4;
  appLayoutLayoutCalculationsCache = self->_appLayoutLayoutCalculationsCache;
  id v7 = a3;
  id v8 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self _currentLayoutCalculationsValidityToken];
  [(SBSwitcherLayoutCalculationsCache *)appLayoutLayoutCalculationsCache rebuildIfNecessaryForValidityToken:v8];

  double v9 = [(NSDictionary *)self->_cachedPileBoundingFrameByPileIdentifier objectForKey:v7];

  [v9 CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (v4)
  {
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)self scrollViewContentOffset];
    double v11 = v11 - v18;
  }
  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (double)_heightForCardInSwitcherWithScaleFactor:(BOOL)a3
{
  BOOL v4 = [(SBAppSwitcherContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [v4 screenEdgePadding];
  [v4 switcherVerticalEdgeSpacing];
  [v4 switcherVerticalInterItemSpacing];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self switcherViewBounds];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self numberOfRowsInGridSwitcher];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self screenScale];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self floatingDockHeight];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)self statusBarHeight];
  BSFloatRoundForScale();
  double v6 = v5;

  return v6;
}

- (BOOL)handlesTapAppLayoutEvents
{
  return self->_handlesTapAppLayoutEvents;
}

- (void)setHandlesTapAppLayoutEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutEvents = a3;
}

- (BOOL)handlesTapAppLayoutHeaderEvents
{
  return self->_handlesTapAppLayoutHeaderEvents;
}

- (void)setHandlesTapAppLayoutHeaderEvents:(BOOL)a3
{
  self->_handlesTapAppLayoutHeaderEvents = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_double scaleFactor = a3;
}

- (double)horizontalEdgeSpacingScaleFactor
{
  return self->_horizontalEdgeSpacingScaleFactor;
}

- (void)setHorizontalEdgeSpacingScaleFactor:(double)a3
{
  self->_double horizontalEdgeSpacingScaleFactor = a3;
}

- (BOOL)showsActiveAppLayoutInSwitcher
{
  return self->_showsActiveAppLayoutInSwitcher;
}

- (void)setShowsActiveAppLayoutInSwitcher:(BOOL)a3
{
  self->_showsActiveAppLayoutInSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_cached_compactedBoundingBoxSizesByAppLayout, 0);
  objc_storeStrong((id *)&self->_cachedPileBoundingFrameByPileIdentifier, 0);
  objc_storeStrong((id *)&self->_appLayoutLayoutCalculationsCache, 0);
}

- (void)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:.cold.1()
{
}

@end