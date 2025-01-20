@interface _SBFullScreenAppFloorSwitcherModifier
- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 appLayout:(id)a4;
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
- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
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
- (CGRect)frameForAppLayout:(id)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (_SBFullScreenAppFloorSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentViewScale;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)plusButtonAlpha;
- (double)reopenClosedWindowsButtonAlpha;
- (double)reopenClosedWindowsButtonScale;
- (double)rotationAngleForIndex:(unint64_t)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (double)switcherBackdropBlurProgress;
- (double)switcherDimmingAlpha;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)activeLeafAppLayoutsReachableByKeyboardShortcut;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)appLayoutForReceivingHardwareButtonEvents;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutToScrollToBeforeReopeningClosedWindows;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToResignActive;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)foregroundAppLayouts;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
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
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
@end

@implementation _SBFullScreenAppFloorSwitcherModifier

- (id)topMostLayoutElements
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutsContainedWithinAppLayout:self->_activeAppLayout];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(SBAppLayout **)(*((void *)&v14 + 1) + 8 * i);
        activeAppLayout = self->_activeAppLayout;
        if (v8 == activeAppLayout
          || ([*(id *)(*((void *)&v14 + 1) + 8 * i) itemForLayoutRole:1],
              v10 = objc_claimAutoreleasedReturnValue(),
              uint64_t v11 = [(SBAppLayout *)activeAppLayout layoutRoleForItem:v10],
              v10,
              v11 != 4))
        {
          [v3 addObject:v8];
        }
        else
        {
          [v3 insertObject:v8 atIndex:0];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (a3 == 4) {
    return 2;
  }
  if ([a4 environment] == 3) {
    return 2;
  }
  return 1;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if ([a4 isEqual:self->_activeAppLayout]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  uint64_t v4 = [a3 itemForLayoutRole:2];
  if (v4) {
    int v5 = [(_SBFullScreenAppFloorSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemContainerPointerInteractionEnabled
{
  return 0;
}

- (BOOL)isIndexRubberbandableForSwipeToKill:(unint64_t)a3
{
  return 0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  v7 = [v6 objectAtIndex:a4];

  double v8 = 1.0;
  if (a3 != 4)
  {
    if ([v7 environment] == 3) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
  }

  return v8;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v6 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutContainingAppLayout:a4];
  LOBYTE(a3) = [(_SBFullScreenAppFloorSwitcherModifier *)self _isLayoutRoleBehindCenterWindow:a3 appLayout:v6];

  return a3;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v3 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  uint64_t v4 = [v3 animationSettings];

  int v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  uint64_t v6 = [v4 layoutSettings];
  [(SBSwitcherAnimationAttributes *)v5 setLayoutSettings:v6];

  v7 = [v4 opacitySettings];
  [(SBSwitcherAnimationAttributes *)v5 setOpacitySettings:v7];

  return v5;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 0;
}

- (BOOL)isScrollEnabled
{
  return 0;
}

- (int64_t)switcherBackdropBlurType
{
  return 1;
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
  result.origin.x = v2;
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  if ([(SBAppLayout *)self->_activeAppLayout type]) {
    return 1;
  }
  else {
    return 4;
  }
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(_SBFullScreenAppFloorSwitcherModifier *)self displayOrdinal])
  {
    id v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
    id v7 = [(_SBFullScreenAppFloorSwitcherModifier *)&v9 activeCornersForTouchResizeForLayoutRole:a3 inAppLayout:v6];
  }

  return (unint64_t)v7;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (id)visibleAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:self->_activeAppLayout];
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  double v3 = [(_SBFullScreenAppFloorSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
}

- (double)wallpaperScale
{
  double v2 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 wallpaperScaleInApplication];
  double v5 = v4;

  return v5;
}

- (double)homeScreenScale
{
  double v2 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 homeScreenScaleInApplication];
  double v5 = v4;

  return v5;
}

- (double)homeScreenAlpha
{
  double v2 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 homeScreenOpacityInApplication];
  double v5 = v4;

  return v5;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (_SBFullScreenAppFloorSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBFullScreenAppLayoutSwitcherModifier.m", 165, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  v10 = [(SBSwitcherModifier *)&v14 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_activeAppLayout, a3);
    objc_storeStrong((id *)&v11->_homeAffordanceReuseIdentifier, a4);
  }

  return v11;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)isContainerStatusBarVisible
{
  return 0;
}

- (double)containerStatusBarAnimationDuration
{
  return 0.35;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 0;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  [(_SBFullScreenAppFloorSwitcherModifier *)self displayCornerRadius];
  if ([v6 environment] == 3 && BSFloatIsZero())
  {
    id v7 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
    [v7 gridSwitcherHomeButtonDeviceCardCornerRadius];
  }
  SBRectCornerRadiiForRadius();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v16 = [v6 allItems];
  if ([v16 count] != 1) {
    goto LABEL_8;
  }
  char v17 = [(_SBFullScreenAppFloorSwitcherModifier *)self isChamoisWindowingUIEnabled];

  if ((v17 & 1) == 0)
  {
    long long v16 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutContainingAppLayout:v6];
    if (v6 != v16)
    {
      v18 = [v6 itemForLayoutRole:1];
      -[_SBFullScreenAppFloorSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](self, "cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:", [v16 layoutRoleForItem:v18], v16, v9, v11, v13, v15);
      double v9 = v19;
      double v11 = v20;
      double v13 = v21;
      double v15 = v22;
    }
LABEL_8:
  }
  double v23 = v9;
  double v24 = v11;
  double v25 = v13;
  double v26 = v15;
  result.topRight = v26;
  result.bottomRight = v25;
  result.bottomLeft = v24;
  result.topLeft = v23;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 0;
}

- (double)homeScreenDimmingAlpha
{
  double v2 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 dimmingAlphaInApplication];
  double v5 = v4;

  return v5;
}

- (double)homeScreenBackdropBlurProgress
{
  double v2 = [(_SBFullScreenAppFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 homeScreenBlurInApplication];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutContainingAppLayout:a4];
  LOBYTE(a3) = [(_SBFullScreenAppFloorSwitcherModifier *)self _isLayoutRoleBehindCenterWindow:a3 appLayout:v6];

  return a3;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutContainingAppLayout:a4];
  LOBYTE(a3) = ![(_SBFullScreenAppFloorSwitcherModifier *)self _isLayoutRoleBehindCenterWindow:a3 appLayout:v6];

  return a3;
}

- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 appLayout:(id)a4
{
  double v5 = [a4 itemForLayoutRole:4];
  if (v5) {
    BOOL IsValidForSplitView = SBLayoutRoleIsValidForSplitView(a3);
  }
  else {
    BOOL IsValidForSplitView = 0;
  }

  return IsValidForSplitView;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  unint64_t v7 = [(_SBFullScreenAppFloorSwitcherModifier *)&v13 hiddenContentStatusBarPartsForLayoutRole:a3 inAppLayout:v6];
  double v8 = [(SBAppLayout *)self->_activeAppLayout itemForLayoutRole:4];
  double v9 = v8;
  if (a3 == 4 || v8 == 0)
  {
  }
  else
  {
    uint64_t v11 = [v6 environment];

    if (v11 != 3) {
      v7 |= 4uLL;
    }
  }

  return v7;
}

- (double)contentViewScale
{
  return 1.0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  double v4 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  double v5 = [v4 objectAtIndex:a3];

  double v6 = 0.0;
  if ([v5 environment] != 3)
  {
    if ([v5 isSplitConfiguration]) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
  }

  return v6;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (unint64_t)transactionCompletionOptions
{
  double v3 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(_SBFullScreenAppFloorSwitcherModifier *)self isReduceMotionEnabled];

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

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  char v5 = [(_SBFullScreenAppFloorSwitcherModifier *)self isChamoisWindowingUIEnabled];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73___SBFullScreenAppFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &__block_descriptor_33_e21_B16__0__SBAppLayout_8l;
  char v9 = v5;
  double v6 = objc_msgSend(v4, "bs_filter:", v8);

  return v6;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(_SBFullScreenAppFloorSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  char v5 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  [(_SBFullScreenAppFloorSwitcherModifier *)self frameForAppLayout:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(_SBFullScreenAppFloorSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    id v5 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v4];
    [v5 boundingBox];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
  }
  else
  {
    CGFloat v7 = *MEMORY[0x1E4F1DB20];
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v14 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayoutContainingAppLayout:v4];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __59___SBFullScreenAppFloorSwitcherModifier_frameForAppLayout___block_invoke;
    v35[3] = &unk_1E6AF4B38;
    id v5 = v14;
    id v36 = v5;
    id v15 = [v5 appLayoutWithItemsPassingTest:v35];
    double v16 = [v4 allItems];
    uint64_t v17 = [v16 count];

    if (v17 == 1 && v15 != v4)
    {
      double v18 = [v4 itemForLayoutRole:1];
      uint64_t v19 = [v5 layoutRoleForItem:v18];
      [(_SBFullScreenAppFloorSwitcherModifier *)self containerViewBounds];
      v34.receiver = self;
      v34.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
      -[_SBFullScreenAppFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, v19, v5);
      CGFloat v7 = v20;
      CGFloat v9 = v21;
      CGFloat v11 = v22;
      CGFloat v13 = v23;
    }
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    if (CGRectIsNull(v37))
    {
      if ([v4 environment] == 3)
      {
        [(_SBFullScreenAppFloorSwitcherModifier *)self centerWindowFrameInInterfaceOrientation:[(_SBFullScreenAppFloorSwitcherModifier *)self switcherInterfaceOrientation] centerConfiguration:1];
        CGFloat v11 = v24;
        CGFloat v13 = v25;
        CGFloat v7 = *MEMORY[0x1E4F1DAD8];
        CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      else
      {
        [(_SBFullScreenAppFloorSwitcherModifier *)self containerViewBounds];
        CGFloat v7 = v26;
        CGFloat v9 = v27;
        CGFloat v11 = v28;
        CGFloat v13 = v29;
      }
    }
  }
  double v30 = v7;
  double v31 = v9;
  double v32 = v11;
  double v33 = v13;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v20 handleTapAppLayoutEvent:v4];
  double v6 = [v4 appLayout];
  char v7 = [(_SBFullScreenAppFloorSwitcherModifier *)self isChamoisWindowingUIEnabled];
  if (([v4 isHandled] & 1) == 0 && objc_msgSend(v6, "isEqual:", self->_activeAppLayout))
  {
    double v8 = [v6 leafAppLayoutForRole:4];
    if (v8 && [v4 layoutRole] != 4)
    {
      CGFloat v9 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65___SBFullScreenAppFloorSwitcherModifier_handleTapAppLayoutEvent___block_invoke;
      v18[3] = &unk_1E6AF4B38;
      double v12 = v8;
      uint64_t v19 = v12;
      CGFloat v13 = [v6 appLayoutWithItemsPassingTest:v18];
      [v9 setAppLayout:v13];

      if ((v7 & 1) == 0)
      {
        double v14 = [(SBPerformTransitionSwitcherEventResponse *)v12 itemForLayoutRole:1];
        id v15 = [v14 bundleIdentifier];
        [v9 setBundleIdentifierForAppExpose:v15];
      }
      double v16 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v9 gestureInitiated:0];
      uint64_t v11 = SBAppendSwitcherModifierResponse(v16, v5);

      double v10 = v19;
    }
    else
    {
      if ((v7 & 1) != 0 || [v4 source] != 1) {
        goto LABEL_12;
      }
      CGFloat v9 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
      double v10 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v9 gestureInitiated:0];
      uint64_t v11 = SBAppendSwitcherModifierResponse(v10, v5);
    }
    id v5 = (void *)v11;
LABEL_12:
  }
  return v5;
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

- (double)scaleForIndex:(unint64_t)a3
{
  return 1.0;
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
  result.origin.x = v3;
  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  return 0;
}

- (double)switcherBackdropBlurProgress
{
  return 0.0;
}

- (double)switcherDimmingAlpha
{
  return 0.0;
}

- (BOOL)switcherDimmingViewBlocksTouches
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
  return [(SBAppLayout *)self->_activeAppLayout leafAppLayouts];
}

- (id)inactiveAppLayoutsReachableByKeyboardShortcut
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  return 1;
}

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  double v3 = [(_SBFullScreenAppFloorSwitcherModifier *)self appLayouts];
  NSUInteger v4 = [v3 indexOfObject:self->_activeAppLayout];
  v10.length = [v3 count];
  v9.location = v4;
  v9.length = 2;
  v10.location = 0;
  NSRange v5 = NSIntersectionRange(v9, v10);
  double v6 = objc_msgSend(v3, "subarrayWithRange:", v5.location, v5.length);

  return v6;
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  if ([(_SBFullScreenAppFloorSwitcherModifier *)self displayOrdinal]) {
    return 2;
  }
  else {
    return 1;
  }
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

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 containsObject:self->_activeAppLayout])
  {
    double v8 = self->_activeAppLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
    double v8 = [(_SBFullScreenAppFloorSwitcherModifier *)&v11 preferredAppLayoutToReuseAccessoryForAppLayout:v6 fromAppLayouts:v7];
  }
  NSRange v9 = v8;

  return v9;
}

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return self->_activeAppLayout;
}

- (BOOL)shouldAnimateInsertionOrRemovalOfAppLayout:(id)a3 atIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  return 0;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 1;
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

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
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
  if (self->_activeAppLayout == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  return [(_SBFullScreenAppFloorSwitcherModifier *)&v4 jetsamModeForAppLayout:sel_jetsamModeForAppLayout_];
}

- (char)activityModeForAppLayout:(id)a3
{
  if (self->_activeAppLayout == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBFullScreenAppFloorSwitcherModifier;
  return [(_SBFullScreenAppFloorSwitcherModifier *)&v4 activityModeForAppLayout:sel_activityModeForAppLayout_];
}

@end