@interface _SBGridFloorSwitcherModifier
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
- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4;
- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4;
- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForShelf:(id)a3;
- (CGRect)shelfBackgroundBlurFrame;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)contentViewScale;
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
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3;
- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (unint64_t)transactionCompletionOptions;
- (void)resetAdjustedScrollingState;
@end

@implementation _SBGridFloorSwitcherModifier

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  return (id)objc_msgSend(a3, "bs_filter:", &__block_literal_global_352);
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
  CGFloat v5 = *MEMORY[0x1E4F1DB20];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v9 = [(_SBGridFloorSwitcherModifier *)self appLayouts];
  v10 = [v9 objectAtIndex:a3];

  v11 = [(_SBGridFloorSwitcherModifier *)self appLayoutContainingAppLayout:v10];
  v12 = [v10 allItems];
  uint64_t v13 = [v12 count];

  if (v13 == 1 && v10 != v11)
  {
    v14 = [v10 itemForLayoutRole:1];
    uint64_t v15 = [v11 layoutRoleForItem:v14];
    [(_SBGridFloorSwitcherModifier *)self containerViewBounds];
    v30.receiver = self;
    v30.super_class = (Class)_SBGridFloorSwitcherModifier;
    -[_SBGridFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v30, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v11);
    CGFloat v5 = v16;
    CGFloat v6 = v17;
    CGFloat v7 = v18;
    CGFloat v8 = v19;
  }
  v31.origin.x = v5;
  v31.origin.y = v6;
  v31.size.width = v7;
  v31.size.height = v8;
  if (CGRectIsNull(v31))
  {
    if ([v10 environment] == 3)
    {
      [(_SBGridFloorSwitcherModifier *)self centerWindowFrameInInterfaceOrientation:[(_SBGridFloorSwitcherModifier *)self switcherInterfaceOrientation] centerConfiguration:1];
      CGFloat v7 = v20;
      CGFloat v8 = v21;
      CGFloat v5 = *MEMORY[0x1E4F1DAD8];
      CGFloat v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else
    {
      [(_SBGridFloorSwitcherModifier *)self containerViewBounds];
      CGFloat v5 = v22;
      CGFloat v6 = v23;
      CGFloat v7 = v24;
      CGFloat v8 = v25;
    }
  }

  double v26 = v5;
  double v27 = v6;
  double v28 = v7;
  double v29 = v8;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  CGFloat v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  CGFloat v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 293, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 1.0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  CGFloat v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  CGFloat v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 298, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 0.0;
}

- (id)visibleAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  v3 = [(_SBGridFloorSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  CGFloat v5 = (objc_class *)objc_opt_class();
  CGFloat v6 = NSStringFromClass(v5);
  CGFloat v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 311, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  CGFloat v8 = (void *)MEMORY[0x1E4F1CAD0];
  return (id)[v8 set];
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
  result.origin.x = v3;
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
  result.origin.x = v2;
  return result;
}

- (double)contentViewScale
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  CGFloat v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 348, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  return 1.0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  CGFloat v7 = (objc_class *)objc_opt_class();
  CGFloat v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 353, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  __break(1u);
  return result;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 358, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  CGFloat v7 = (objc_class *)objc_opt_class();
  CGFloat v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 363, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  [(_SBGridFloorSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v10);
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
  CGFloat v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  CGFloat v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 386, @"%@ shouldn't be asked %@.", v9, v10 object file lineNumber description];

  return 1.0;
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
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 403, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 1.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 408, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  CGFloat v7 = (objc_class *)objc_opt_class();
  CGFloat v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 413, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return 1.0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 418, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  CGFloat v7 = NSStringFromClass(v6);
  CGFloat v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 423, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  double v9 = *MEMORY[0x1E4F43C68];
  double v10 = *(double *)(MEMORY[0x1E4F43C68] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F43C68] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F43C68] + 24);
  result.topRight = v12;
  result.bottomRight = v11;
  result.bottomLeft = v10;
  result.topLeft = v9;
  return result;
}

- (double)homeScreenAlpha
{
  double v2 = [(_SBGridFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 homeScreenOpacityInSwitcher];
  double v5 = v4;

  return v5;
}

- (double)homeScreenScale
{
  double v2 = [(_SBGridFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 homeScreenScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)wallpaperScale
{
  double v2 = [(_SBGridFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
  [v3 wallpaperScaleForMode:2];
  double v5 = v4;

  return v5;
}

- (double)homeScreenDimmingAlpha
{
  double v2 = [(_SBGridFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
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
  double v2 = [(_SBGridFloorSwitcherModifier *)self switcherSettings];
  double v3 = [v2 animationSettings];
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
  return a3 == 0;
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
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
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
  result.origin.x = v6;
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
  double v3 = [a3 itemForLayoutRole:2];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)appLayoutsToCacheSnapshots
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 586, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 591, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  return 2;
}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E4F1CBF0];
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
  double v3 = [(_SBGridFloorSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(_SBGridFloorSwitcherModifier *)self isReduceMotionEnabled];

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
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 650, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return 1;
}

- (BOOL)shouldBringCardToFrontDuringInsertionOrRemoval
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 655, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  return 1;
}

- (unint64_t)indexToScrollToAfterInsertingAtIndex:(unint64_t)a3
{
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 660, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return a3;
}

- (unint64_t)indexToScrollToAfterRemovingIndex:(unint64_t)a3
{
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 665, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return a3;
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

- (id)appLayoutsToResignActive
{
  double v2 = (void *)MEMORY[0x1E4F1C9E8];
  double v3 = (void *)MEMORY[0x1E4F1CAD0];
  int v4 = [(_SBGridFloorSwitcherModifier *)self appLayouts];
  double v5 = [v3 setWithArray:v4];
  double v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334B330];

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

- (id)scrollViewAttributes
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 744, @"%@ shouldn't be asked %@.", v6, v7 object file lineNumber description];

  return 0;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 749, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return 0.0;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 754, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.x, a3.y, a4.x, a4.y);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 759, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)minimumTranslationToKillIndex:(unint64_t)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 764, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 0.0;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F28B00] currentHandler];
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  double v10 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 771, @"%@ shouldn't be asked %@.", v9, v10 object file lineNumber description];

  return v6;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 776, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return v5;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 781, @"%@ shouldn't be asked %@.", v8, v9 object file lineNumber description];

  return 0.0;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 786, @"%@ shouldn't be asked %@.", v7, v8 object file lineNumber description];

  return 0.0;
}

- (CGPoint)adjustedOffsetForOffset:(CGPoint)a3 translation:(CGPoint)a4 startPoint:(CGPoint)a5 locationInView:(CGPoint)a6 horizontalVelocity:(double *)a7 verticalVelocity:(double *)a8
{
  double v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a7, a8, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
  double v11 = (objc_class *)objc_opt_class();
  double v12 = NSStringFromClass(v11);
  uint64_t v13 = NSStringFromSelector(a2);
  [v10 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 791, @"%@ shouldn't be asked %@.", v12, v13 object file lineNumber description];

  double v14 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)resetAdjustedScrollingState
{
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"SBGridSwitcherModifier.m", 796, @"%@ shouldn't be asked %@.", v5, v6 object file lineNumber description];
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

@end