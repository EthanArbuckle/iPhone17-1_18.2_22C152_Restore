@interface SBDeckFloatingSwitcherModifier
- (BOOL)_isIndexVisible:(unint64_t)a3;
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
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (CGSize)_contentSize;
- (CGSize)_contentSizeWithWithCardSize:(CGSize)a3 contentInsets:(UIEdgeInsets)a4 switcherViewBounds:(CGRect)a5 numberOfItems:(unint64_t)a6;
- (SBDeckFloatingSwitcherModifier)init;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIEdgeInsets)_contentInsetsWithContainerViewBounds:(CGRect)a3 switcherViewBounds:(CGRect)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)_adjustedIndexForScaleForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(uint64_t)a7 switcherViewBounds:(unint64_t)a8;
- (double)_cardCornerRadiusInSwitcher;
- (double)_distanceFromPreviousCardForCardAtIndex:(unint64_t)a3;
- (double)_scaleForScaleAdjustedIndex:(double)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)contentViewScale;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)minimumTranslationToKillIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rotationAngleForIndex:(unint64_t)a3;
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
- (uint64_t)_frameForIndex:(double)a3 withCardSize:(double)a4 scale:(double)a5 adjustedIndexForScale:(double)a6 contentOffset:(double)a7 contentSize:(double)a8 contentInsets:(double)a9 switcherViewBounds:(double)a10;
- (uint64_t)_frameWithScaleAppliedForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(double)a7 switcherViewBounds:(uint64_t)a8;
- (unint64_t)_indexForContentOffset:(CGPoint)a3;
- (unint64_t)_numberOfItems;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
- (void)_applyPrototypeSettings;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBDeckFloatingSwitcherModifier

- (SBDeckFloatingSwitcherModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeckFloatingSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentFloatingConfiguration = 4;
    v4 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v3 addChildModifier:v4];
  }
  return v3;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeckFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBDeckFloatingSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBDeckFloatingSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v18 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_16;
  }
  if ([v4 phase] == 2)
  {
    --self->_ongoingAppLayoutRemovals;
    objc_super v6 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
    if ([v6 count])
    {
    }
    else
    {
      unint64_t ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

      if (!ongoingAppLayoutRemovals)
      {
        v15 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        [(SBSwitcherTransitionRequest *)v15 setFloatingSwitcherVisible:0];
        [(SBSwitcherTransitionRequest *)v15 setFloatingConfiguration:4];
        v16 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v15 gestureInitiated:0];
        uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v16 toResponse:v5];

LABEL_15:
        objc_super v5 = (void *)v14;
        goto LABEL_16;
      }
    }
    v8 = [v4 appLayout];
    if (!BSEqualObjects())
    {

      goto LABEL_16;
    }
    unint64_t v9 = self->_ongoingAppLayoutRemovals;

    if (v9) {
      goto LABEL_16;
    }
    v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    v11 = v10;
    if (((self->_currentFloatingConfiguration - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 3;
    }
    [(SBSwitcherTransitionRequest *)v10 setFloatingConfiguration:v12];
    [(SBSwitcherTransitionRequest *)v11 setFloatingSwitcherVisible:1];
    v13 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v11 gestureInitiated:0];
    uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v5];

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBDeckFloatingSwitcherModifier;
  id v4 = a3;
  objc_super v5 = [(SBSwitcherModifier *)&v10 handleTapAppLayoutEvent:v4];
  objc_super v6 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);

  objc_msgSend(v6, "setRetainsSiri:", -[SBDeckFloatingSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  v7 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v6 gestureInitiated:0];
  v8 = SBAppendSwitcherModifierResponse(v7, v5);

  return v8;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBDeckFloatingSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBSwitcherModifier *)&v11 handleTapOutsideToDismissEvent:v3];
  char v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    objc_super v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    v7 = +[SBSwitcherTransitionRequest requestForDeactivatingFloatingSwitcher];
    v8 = [(SBPerformTransitionSwitcherEventResponse *)v6 initWithTransitionRequest:v7 gestureInitiated:0];

    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v4];

    id v4 = (void *)v9;
  }
  return v4;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBDeckFloatingSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBDeckFloatingSwitcherModifier;
  char v5 = [(SBSwitcherModifier *)&v7 handleSwitcherSettingsChangedEvent:v4];

  return v5;
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
  self->_previousContentOffset.y = v6;
  v11.receiver = self;
  v11.super_class = (Class)SBDeckFloatingSwitcherModifier;
  uint64_t v9 = [(SBSwitcherModifier *)&v11 handleScrollEvent:v4];

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 toFloatingSwitcherVisible]
    && ([v4 fromFloatingSwitcherVisible] & 1) == 0)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  double v5 = [v4 toFloatingAppLayout];
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v5;

  self->_currentFloatingConfiguration = [v4 toFloatingConfiguration];
  v9.receiver = self;
  v9.super_class = (Class)SBDeckFloatingSwitcherModifier;
  objc_super v7 = [(SBSwitcherModifier *)&v9 handleTransitionEvent:v4];

  return v7;
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

- (CGRect)frameForIndex:(unint64_t)a3
{
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v48 = v17;
  double v20 = v19;
  double v50 = v19;
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  double v46 = v22;
  double v47 = v21;
  unint64_t v23 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  double v24 = v16;
  double v49 = v6;
  double v25 = v8;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v14, v24, v18, v20, v6, v8, v10, v12);
  double v51 = v26;
  double v28 = v27;
  double v30 = v29;
  double v42 = v6;
  double v32 = v31;
  double v43 = v31;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v48, v50, v26, v27, v31, v29, *(void *)&v42, *(void *)&v25, *(void *)&v10, *(void *)&v12);
  double v44 = v34;
  double v45 = v33;
  -[SBDeckFloatingSwitcherModifier _adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v48, v50, v47, v46, v33, v34, *(void *)&v51, *(void *)&v28, *(void *)&v32, *(void *)&v30, *(void *)&v49, *(void *)&v25, *(void *)&v10, *(void *)&v12);
  double v36 = v35;
  -[SBDeckFloatingSwitcherModifier _scaleForScaleAdjustedIndex:](self, "_scaleForScaleAdjustedIndex:");
  -[SBDeckFloatingSwitcherModifier _frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v48, v50, v37, v36, v47, v46, v45, v44, *(void *)&v51, *(void *)&v28, *(void *)&v43, *(void *)&v30, *(void *)&v49, *(void *)&v25, *(void *)&v10, *(void *)&v12);
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.double x = v38;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v39 = v19;
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  double v40 = v22;
  double v41 = v21;
  unint64_t v23 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  double v24 = v14;
  double v25 = v20;
  double v26 = v6;
  double v27 = v8;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v24, v16, v18, v25, v6, v8, v10, v12);
  double v38 = v28;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v18, v39, v28, v29, v31, v33, *(void *)&v26, *(void *)&v27, *(void *)&v10, *(void *)&v12);
  -[SBDeckFloatingSwitcherModifier _adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v18, v39, v41, v40, v35, v36, *(void *)&v38, *(void *)&v30, *(void *)&v32, *(void *)&v34, *(void *)&v26, *(void *)&v27, *(void *)&v10, *(void *)&v12);
  -[SBDeckFloatingSwitcherModifier _scaleForScaleAdjustedIndex:](self, "_scaleForScaleAdjustedIndex:");
  return result;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (id)visibleAppLayouts
{
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBDeckFloatingSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = (void *)MEMORY[0x1E4F1CAD0];
  double v7 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  double v8 = objc_msgSend(v7, "subarrayWithRange:", v3, v5);
  double v9 = [v6 setWithArray:v8];

  return v9;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
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
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
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
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)_isIndexVisible:(unint64_t)a3
{
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v53 = v17;
  double v20 = v19;
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  double v57 = v21;
  double v56 = v22;
  unint64_t v23 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  double v24 = v18;
  double v54 = v20;
  double v25 = v6;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v14, v16, v24, v20, v6, v8, v10, v12);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  CGFloat v55 = v25;
  double v32 = v20;
  double v34 = v33;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v53, v32, v33, v27, v28, v30, *(void *)&v25, *(void *)&v8, *(void *)&v10, *(void *)&v12);
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v53, v54, v57, v56, v35, v36, *(void *)&v34, *(void *)&v27, *(void *)&v29, *(void *)&v31, *(void *)&v25, *(void *)&v8, *(void *)&v10, *(void *)&v12);
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  double v45 = [(SBDeckFloatingSwitcherModifier *)self medusaSettings];
  [v45 diffuseShadowRadius];
  double v47 = v46;

  v58.origin.double x = v55;
  v58.size.height = v12;
  v58.origin.y = v8;
  v58.size.width = v10;
  CGRect v59 = CGRectInset(v58, v47 * -2.8, v47 * -2.8);
  v60.origin.double x = v38;
  v60.origin.y = v40;
  v60.size.width = v42;
  v60.size.height = v44;
  if (!CGRectIntersectsRect(v59, v60)) {
    return 0;
  }
  double v48 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  double v49 = [v48 objectAtIndex:a3];

  [(SBDeckFloatingSwitcherModifier *)self opacityForLayoutRole:1 inAppLayout:v49 atIndex:a3];
  BOOL v51 = v50 > 0.01;

  return v51;
}

- (double)contentViewScale
{
  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  double v3 = [(SBDeckFloatingSwitcherModifier *)self switcherSettings];
  double v4 = [v3 animationSettings];

  double v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  double v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  double v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  return CGRectGetWidth(*(CGRect *)&v3);
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  if (!a5) {
    return 1.0;
  }
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:", a5, a4);
  return fmin(fmax((v5 - *(double *)&kDeckFloatingOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingOpacityFadeDistance, 0.0), 1.0);
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  double v6 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (!v7) {
    return 0.0;
  }
  [(SBDeckFloatingSwitcherModifier *)self _distanceFromPreviousCardForCardAtIndex:v7];
  return fmin(fmax(*(double *)&kDeckFloatingMaximumDarkening* (1.0- (v8 - *(double *)&kDeckFloatingDarkeningMinimumDistanceThreshold)/ *(double *)&kDeckFloatingDarkeningFadeDistance), 0.0), 1.0);
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
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  if (!a3) {
    return 1.0;
  }
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:");
  return fmin(fmax((v3 - *(double *)&kDeckFloatingTitleAndIconOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingTitleAndIconOpacityFadeDistance, 0.0), 1.0);
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  if (!a3) {
    return 1.0;
  }
  -[SBDeckFloatingSwitcherModifier _distanceFromPreviousCardForCardAtIndex:](self, "_distanceFromPreviousCardForCardAtIndex:");
  return fmin(fmax((v3 - *(double *)&kDeckFloatingTitleOpacityMinimumDistanceThreshold)/ *(double *)&kDeckFloatingTitleOpacityFadeDistance, 0.0), 1.0);
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
  [(SBDeckFloatingSwitcherModifier *)self _cardCornerRadiusInSwitcher];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 1;
}

- (int64_t)switcherBackdropBlurType
{
  return 2;
}

- (double)switcherBackdropBlurProgress
{
  return 1.0;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  return *(double *)&kDeckFloatingHomeScreenDimmingAlpha;
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
  return 1;
}

- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    double v8 = [MEMORY[0x1E4F28E60] indexSet];
    double v9 = v8;
    if (v6) {
      [v8 addIndex:v6 - 1];
    }
    if (v6 < [v5 count] - 1) {
      [v9 addIndex:v6 + 1];
    }
    double v10 = (void *)MEMORY[0x1E4F1CAD0];
    double v11 = [v5 objectsAtIndexes:v9];
    uint64_t v7 = [v10 setWithArray:v11];
  }
  return v7;
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
  return 2;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 1;
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
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
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

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v3 = [(SBDeckFloatingSwitcherModifier *)self _visibleAppLayoutRangeForContentOffset:"_visibleAppLayoutRangeForContentOffset:"];
  uint64_t v5 = v4;
  double v6 = [(SBDeckFloatingSwitcherModifier *)self switcherSettings];
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
  uint64_t v3 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(SBDeckFloatingSwitcherModifier *)self isReduceMotionEnabled];

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
  return [(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:a4];
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 count];

  if (v6 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_9:
    unint64_t v10 = v6 - 1;
    unint64_t v7 = a3;
    while (++v7 < v10)
    {
      if ([(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:v7]) {
        return v7;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (![(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:a3])
  {
LABEL_8:
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      return v7;
    }
    goto LABEL_9;
  }
  int64_t v8 = a3;
  while (v8-- >= 1)
  {
    if (![(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:v8])
    {
      unint64_t v7 = v8 + 1;
      goto LABEL_8;
    }
  }
  return 0;
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
  return 1;
}

- (double)dockProgress
{
  return 0.0;
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

- (id)appLayoutsToResignActive
{
  double v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  int v4 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v3 setWithArray:v4];
  unint64_t v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334A988];

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

- (BOOL)wantsSlideOverTongue
{
  return 1;
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
  return *(double *)&kDeckFloatingSwitcherCardScale;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  return *(double *)&kDeckFloatingSwitcherCardScale;
}

- (id)scrollViewAttributes
{
  id v3 = objc_alloc_init(SBMutableSwitcherScrollViewAttributes);
  [(SBSwitcherScrollViewAttributes *)v3 setDecelerationRate:*MEMORY[0x1E4F43CE0]];
  [(SBSwitcherScrollViewAttributes *)v3 setScrollViewPagingEnabled:0];
  -[SBSwitcherScrollViewAttributes setInterpageSpacingForPaging:](v3, "setInterpageSpacingForPaging:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[SBSwitcherScrollViewAttributes setPagingOrigin:](v3, "setPagingOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBSwitcherScrollViewAttributes *)v3 setInterpolatesDuringSwipeToKill:1];
  [(SBDeckFloatingSwitcherModifier *)self _contentSize];
  -[SBSwitcherScrollViewAttributes setContentSize:](v3, "setContentSize:");
  return v3;
}

- (double)_cardCornerRadiusInSwitcher
{
  double v2 = [(SBDeckFloatingSwitcherModifier *)self medusaSettings];
  [v2 cornerRadiusForFloatingApps];
  double v4 = v3;

  return v4;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  -[SBDeckFloatingSwitcherModifier frameForIndex:](self, "frameForIndex:");
  [(SBDeckFloatingSwitcherModifier *)self scaleForIndex:a3];
  SBTransformedRectWithScale();
  return CGRectGetMinY(*(CGRect *)&v5);
}

- (CGSize)_contentSize
{
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  unint64_t v19 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v12, v14, v16, v18, v4, v6, v8, v10);
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v19, v16, v18, v20, v21, v22, v23, *(void *)&v4, *(void *)&v6, *(void *)&v8, *(void *)&v10);
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v35 = *(double *)&kDeckFloatingCardSpacing;
    unint64_t v24 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
    -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v17, v19, v21, v23, v9, v11, v13, v15);
    double v26 = v25;
    double v28 = v27;
    -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v24, v21, v23, v29, v25, v30, v27, *(void *)&v9, *(void *)&v11, *(void *)&v13, *(void *)&v15);
    double v32 = v31 - v13;
    double v33 = v35 + v21 * *(double *)&kDeckFloatingSwitcherCardScale;
    if ([(SBDeckFloatingSwitcherModifier *)self isRTLEnabled]) {
      double v34 = v33 * (double)a3;
    }
    else {
      double v34 = v32 - (double)a3 * v33;
    }
    if (a3 && v28 > v26) {
      double v34 = fmod(v26 - v28, v33) + v34;
    }
    double v5 = 0.0;
    double v4 = fmax(v34, 0.0);
    if (v32 <= v4) {
      double v4 = v32;
    }
  }
  result.y = v5;
  result.double x = v4;
  return result;
}

- (unint64_t)_indexForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v36 = *(double *)&kDeckFloatingCardSpacing;
  unint64_t v20 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v13, v15, v17, v19, v5, v7, v9, v11);
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v20, v17, v19, v21, v22, v23, v24, *(void *)&v5, *(void *)&v7, *(void *)&v9, *(void *)&v11);
  double v26 = v25;
  double v27 = v36 + v17 * *(double *)&kDeckFloatingSwitcherCardScale;
  int v28 = [(SBDeckFloatingSwitcherModifier *)self isRTLEnabled];
  double v29 = v26 - v9 - x;
  if (v28) {
    double v29 = x;
  }
  double v30 = v29 / v27;
  double v31 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  double v32 = (double)(unint64_t)[v31 count] + -1.0;
  double v33 = fmax(v30, 0.0);

  if (v32 <= v33) {
    return (unint64_t)v32;
  }
  else {
    return (unint64_t)v33;
  }
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  double v5 = [(SBDeckFloatingSwitcherModifier *)self switcherSettings];
  [v5 switcherCardShadowRadius];
  double v7 = v6;
  [v5 deckSwitcherPageScale];
  double v9 = v7 / v8;
  [(SBDeckFloatingSwitcherModifier *)self scaleForIndex:a3];
  [(SBSwitcherModifier *)self distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:a3 numberOfRows:1 padding:0 layoutDirection:v9 * v10 * 2.8];
  double v12 = v11;

  return v12;
}

- (CGSize)_contentSizeWithWithCardSize:(CGSize)a3 contentInsets:(UIEdgeInsets)a4 switcherViewBounds:(CGRect)a5 numberOfItems:(unint64_t)a6
{
  CGRectGetHeight(a5);
  [(SBDeckFloatingSwitcherModifier *)self screenScale];
  BSSizeRoundForScale();
  double v8 = v7;
  double v10 = v9;
  double Width = CGRectGetWidth(a5);
  if (v8 >= Width) {
    double Width = v8;
  }
  double v12 = v10;
  result.height = v12;
  result.width = Width;
  return result;
}

- (UIEdgeInsets)_contentInsetsWithContainerViewBounds:(CGRect)a3 switcherViewBounds:(CGRect)a4
{
  CGFloat rect = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat height = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.CGFloat height = rect;
  double MaxX = CGRectGetMaxX(v22);
  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v9;
  v23.size.double width = v8;
  v23.size.CGFloat height = height;
  double v14 = MaxX - CGRectGetMaxX(v23);
  if (MinX > width * 0.4) {
    double MinX = width * 0.4;
  }
  if (v14 <= width * 0.4) {
    double v15 = v14;
  }
  else {
    double v15 = width * 0.4;
  }
  int v16 = [(SBDeckFloatingSwitcherModifier *)self isRTLEnabled];
  if (v16) {
    double v17 = MinX;
  }
  else {
    double v17 = v15;
  }
  if (v16) {
    double v18 = v15;
  }
  else {
    double v18 = MinX;
  }
  double v19 = 0.0;
  double v20 = 0.0;
  result.right = v17;
  result.bottom = v20;
  result.left = v18;
  result.top = v19;
  return result;
}

- (uint64_t)_frameForIndex:(double)a3 withCardSize:(double)a4 scale:(double)a5 adjustedIndexForScale:(double)a6 contentOffset:(double)a7 contentSize:(double)a8 contentInsets:(double)a9 switcherViewBounds:(double)a10
{
  int v26 = [a1 isRTLEnabled];
  double v27 = a8 - a16 - a6;
  if (!v26) {
    double v27 = a6;
  }
  double v33 = v27;
  double v28 = *(double *)&kDeckFloatingSwitcherCardScale;
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  double v30 = a2 * ((v28 - a4) * 0.5) * a5 + v29 - v33;
  if (a11 <= a13) {
    double v31 = a11;
  }
  else {
    double v31 = a13;
  }
  if (v31 - a2 * (1.0 - a4) * 0.5 + *(double *)&kDeckFloatingLeadingEdgeRubberbandingRange - v30 > 0.0) {
    BSUIConstrainValueWithRubberBand();
  }
  return [a1 isRTLEnabled];
}

- (double)_adjustedIndexForScaleForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(uint64_t)a7 switcherViewBounds:(unint64_t)a8
{
  int v24 = [a1 isRTLEnabled];
  if (a13 <= a15) {
    double v25 = a13;
  }
  else {
    double v25 = a15;
  }
  double v26 = a6 - a18 - a4;
  if (!v24) {
    double v26 = a4;
  }
  return (double)a8
       - (a6 - a18 - (a13 + a15) - (v26 - (a13 + v25)))
       / (*(double *)&kDeckFloatingCardSpacing + a2 * *(double *)&kDeckFloatingSwitcherCardScale);
}

- (double)_scaleForScaleAdjustedIndex:(double)a3
{
  double v3 = *(double *)&kDeckFloatingPerCardAdditionalScaleCoefficient * a3;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  double result = *(double *)&kDeckFloatingSwitcherCardScale
         * (1.0 - pow(v3, *(long double *)&kDeckFloatingScaleCurveExponent));
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)_distanceFromPreviousCardForCardAtIndex:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  [(SBDeckFloatingSwitcherModifier *)self switcherViewBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBDeckFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  double v66 = v22;
  double v67 = v21;
  unint64_t v23 = [(SBDeckFloatingSwitcherModifier *)self _numberOfItems];
  double v24 = v14;
  double v25 = v16;
  double v26 = v20;
  double v27 = v20;
  double v28 = v8;
  double v69 = v10;
  double v29 = v12;
  -[SBDeckFloatingSwitcherModifier _contentInsetsWithContainerViewBounds:switcherViewBounds:](self, "_contentInsetsWithContainerViewBounds:switcherViewBounds:", v24, v25, v18, v26, v6, v8, v10, v12);
  double v31 = v30;
  double v70 = v30;
  double v33 = v32;
  double v35 = v34;
  double v60 = v10;
  double v61 = v12;
  double v36 = v18;
  double v65 = v18;
  double v37 = v18;
  double v38 = v27;
  double v39 = v27;
  double v40 = v33;
  double v42 = v41;
  double v62 = v41;
  -[SBDeckFloatingSwitcherModifier _contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:](self, "_contentSizeWithWithCardSize:contentInsets:switcherViewBounds:numberOfItems:", v23, v37, v39, v31, v33, v34, v41, *(void *)&v6, *(void *)&v28, *(void *)&v60, *(void *)&v61);
  double v63 = v44;
  double v64 = v43;
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3, v36, v38, v67, v66, v43, v44, *(void *)&v70, *(void *)&v40, *(void *)&v35, *(void *)&v42, *(void *)&v6, *(void *)&v28, *(void *)&v69, *(void *)&v29);
  v68.origin.CGFloat x = v45;
  v68.origin.CGFloat y = v46;
  v68.size.double width = v47;
  v68.size.CGFloat height = v48;
  -[SBDeckFloatingSwitcherModifier _frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:](self, "_frameWithScaleAppliedForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a3 - 1, v65, v38, v67, v66, v64, v63, *(void *)&v70, *(void *)&v40, *(void *)&v35, *(void *)&v62, *(void *)&v6, *(void *)&v28, *(void *)&v69, *(void *)&v29);
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  if ([(SBDeckFloatingSwitcherModifier *)self isRTLEnabled])
  {
    double MaxX = CGRectGetMaxX(v68);
    v71.origin.CGFloat x = v50;
    v71.origin.CGFloat y = v52;
    v71.size.double width = v54;
    v71.size.CGFloat height = v56;
    return MaxX - CGRectGetMaxX(v71);
  }
  else
  {
    v72.origin.CGFloat x = v50;
    v72.origin.CGFloat y = v52;
    v72.size.double width = v54;
    v72.size.CGFloat height = v56;
    double MinX = CGRectGetMinX(v72);
    return MinX - CGRectGetMinX(v68);
  }
}

- (uint64_t)_frameWithScaleAppliedForIndex:(double)a3 withCardSize:(double)a4 contentOffset:(double)a5 contentSize:(double)a6 contentInsets:(double)a7 switcherViewBounds:(uint64_t)a8
{
  objc_msgSend(a1, "_adjustedIndexForScaleForIndex:withCardSize:contentOffset:contentSize:contentInsets:switcherViewBounds:", a15, a16, a17, a18, a19, a20, a21, a22);
  double v25 = v24;
  objc_msgSend(a1, "_scaleForScaleAdjustedIndex:");
  objc_msgSend(a1, "_frameForIndex:withCardSize:scale:adjustedIndexForScale:contentOffset:contentSize:contentInsets:switcherViewBounds:", a9, a2, a3, v26, v25, a4, a5, a6, a7, a15, a16, a17, a18, a19, a20, a21, a22);
  return SBTransformedRectWithScale();
}

- (unint64_t)_numberOfItems
{
  double v2 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  unint64_t v3 = [v2 count];

  return v3;
}

- (_NSRange)_visibleAppLayoutRangeForContentOffset:(CGPoint)a3
{
  [(SBDeckFloatingSwitcherModifier *)self scrollViewContentOffset];
  unint64_t v4 = -[SBDeckFloatingSwitcherModifier _indexForContentOffset:](self, "_indexForContentOffset:");
  double v5 = [(SBDeckFloatingSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 count];
  unint64_t v7 = v6 - v4;
  if (v6 <= v4) {
    goto LABEL_10;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if ([(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:v4 + v8])
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v10 = v4 + v8;
      }
      uint64_t v9 = v4 + v8;
    }
    else if (v8)
    {
      break;
    }
    ++v8;
  }
  while (v7 != v8);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    NSUInteger v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    if ((v10 & 0x8000000000000000) == 0
      && [(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:v10])
    {
      while (v10-- >= 1)
      {
        if (![(SBDeckFloatingSwitcherModifier *)self _isIndexVisible:v10])
        {
          ++v10;
          goto LABEL_17;
        }
      }
      uint64_t v10 = 0;
    }
LABEL_17:
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v11 = 0;
    }
    else {
      NSUInteger v11 = v10;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v9 - v10 + 1;
    }
  }

  NSUInteger v14 = v11;
  NSUInteger v15 = v12;
  result.length = v15;
  result.location = v14;
  return result;
}

- (void)_applyPrototypeSettings
{
  double v2 = [(SBDeckFloatingSwitcherModifier *)self switcherSettings];
  id v18 = [v2 floatingSwitcherSettings];

  [v18 switcherCardScale];
  kDeckFloatingSwitcherCardScale = v3;
  [v18 cardSpacing];
  kDeckFloatingCardSpacing = v4;
  [v18 dimmingAlpha];
  kDeckFloatingHomeScreenDimmingAlpha = v5;
  [v18 leadingEdgeRubberbandingRange];
  kDeckFloatingLeadingEdgeRubberbandingRange = v6;
  [v18 perCardAdditionalScaleCoefficient];
  kDeckFloatingPerCardAdditionalScaleCoefficient = v7;
  [v18 scaleCurveExponent];
  kDeckFloatingScaleCurveExponent = v8;
  [v18 opacityMinimumDistanceThreshold];
  kDeckFloatingOpacityMinimumDistanceThreshold = v9;
  [v18 opacityFadeDistance];
  kDeckFloatingOpacityFadeDistance = v10;
  [v18 darkeningMinimumDistanceThreshold];
  kDeckFloatingDarkeningMinimumDistanceThreshold = v11;
  [v18 darkeningFadeDistance];
  kDeckFloatingDarkeningFadeDistance = v12;
  [v18 maximumDarkening];
  kDeckFloatingMaximumDarkening = v13;
  [v18 titleAndIconOpacityMinimumDistanceThreshold];
  kDeckFloatingTitleAndIconOpacityMinimumDistanceThreshold = v14;
  [v18 titleAndIconOpacityFadeDistance];
  kDeckFloatingTitleAndIconOpacityFadeDistance = v15;
  [v18 titleOpacityMinimumDistanceThreshold];
  kDeckFloatingTitleOpacityMinimumDistanceThreshold = v16;
  [v18 titleOpacityFadeDistance];
  kDeckFloatingTitleOpacityFadeDistance = v17;
}

- (void).cxx_destruct
{
}

@end