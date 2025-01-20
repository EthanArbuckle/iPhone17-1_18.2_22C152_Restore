@interface _SBHomeScreenFloorSwitcherModifier
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
- (id)handleTransitionEvent:(id)a3;
- (id)inactiveAppLayoutsReachableByKeyboardShortcut;
- (id)keyboardSuppressionMode;
- (id)neighboringAppLayoutsForFocusedAppLayout:(id)a3;
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
@end

@implementation _SBHomeScreenFloorSwitcherModifier

- (BOOL)shouldUseBrightMaterialForIndex:(unint64_t)a3
{
  return 0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  v3 = [a3 itemForLayoutRole:2];
  BOOL v4 = v3 != 0;

  return v4;
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

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 0.0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v3 = [(_SBHomeScreenFloorSwitcherModifier *)self switcherSettings];
  BOOL v4 = [v3 animationSettings];

  v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:1];
  v6 = [v4 layoutSettings];
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

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (id)visibleAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)_SBHomeScreenFloorSwitcherModifier;
  double v5 = [(SBSwitcherModifier *)&v60 handleTransitionEvent:v4];
  if ([v4 phase] != 1 || objc_msgSend(v4, "isHandled"))
  {
    id v6 = v5;
    goto LABEL_24;
  }
  v7 = [v4 transitionID];
  v8 = [v4 fromAppLayout];
  uint64_t v9 = [v4 toEnvironmentMode];
  v10 = [v4 toAppLayout];
  uint64_t v11 = [(_SBHomeScreenFloorSwitcherModifier *)self isChamoisWindowingUIEnabled];
  v12 = [v4 zoomFromHardwareButtonPreludeTokenWrapper];
  int v13 = [v12 isTokenAvailable];

  if (v9 == 3)
  {
    if ([v4 isIconZoomDisabled])
    {
      CGFloat v14 = *MEMORY[0x1E4F1DB20];
      CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    else
    {
      [(_SBHomeScreenFloorSwitcherModifier *)self homeScreenIconFrameForAppLayout:v10];
      CGFloat v14 = v18;
      CGFloat v15 = v19;
      CGFloat v16 = v20;
      CGFloat v17 = v21;
    }
    if ([v4 prefersCenterZoomTransition])
    {
LABEL_9:
      v22 = [[SBHomeToFullScreenCenterZoomSwitcherModifier alloc] initWithTransitionID:v7 toAppLayout:v10];
      v23 = (SBPIPRestoreToFullScreenSwitcherModifier *)v22;
      if (v11) {
        [(SBHomeToFullScreenCenterZoomSwitcherModifier *)v22 setShouldForceDefaultAnchorPointForTransition:1];
      }
      goto LABEL_21;
    }
    if ([v4 isBannerUnfurlTransition])
    {
      v24 = [v4 bannerUnfurlSourceContext];

      if (v24)
      {
        v25 = [SBBannerUnfurlToFullScreenSwitcherModifier alloc];
        v26 = [v4 bannerUnfurlSourceContext];
        v23 = [(SBBannerUnfurlToFullScreenSwitcherModifier *)v25 initWithTransitionID:v7 fromAppLayout:0 toAppLayout:v10 bannerUnfurlSourceContext:v26];
LABEL_16:

        goto LABEL_21;
      }
    }
    if ([v4 isMorphFromPIPTransition])
    {
      v27 = [SBFullScreenToHomeIconZoomSwitcherModifier alloc];
      [(_SBHomeScreenFloorSwitcherModifier *)self morphToPIPClippingFrame];
      v26 = -[SBFullScreenToHomeIconZoomSwitcherModifier initWithTransitionID:targetFrame:appLayout:direction:](v27, "initWithTransitionID:targetFrame:appLayout:direction:", v7, v10, 0);
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v26 setShouldForceDefaultAnchorPointForTransition:v11];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v26 setShouldDockOrderFrontDuringTransition:v11];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v26 setShouldMatchMoveToIconView:0];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v26 setShouldUpdateIconViewVisibility:0];
      v23 = -[SBPIPRestoreToFullScreenSwitcherModifier initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:]([SBPIPRestoreToFullScreenSwitcherModifier alloc], "initWithTransitionID:transitionModifier:fromAppLayout:toAppLayout:toLayoutRole:", v7, v26, 0, v10, [v4 morphingPIPLayoutRole]);
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldForceDefaultAnchorPointForTransition:v11];
      [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldClippingTakeShadowIntoAccount:v11];
      goto LABEL_16;
    }
    if ([v4 isZoomFromSystemApertureTransition])
    {
      v28 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v7 appLayout:v10 direction:0];
      v29 = [(_SBHomeScreenFloorSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:v8 key:@"position"];
      [v29 CGPointValue];
      double v31 = v30;
      double v33 = v32;

      v34 = [(_SBHomeScreenFloorSwitcherModifier *)self appLayouts];
      uint64_t v35 = [v34 indexOfObject:v10];

      [(_SBHomeScreenFloorSwitcherModifier *)self frameForIndex:v35];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      [(_SBHomeScreenFloorSwitcherModifier *)self scaleForIndex:v35];
      v23 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v7, v28, v10, 0, v37, v39, v41, v43, v44, v31, v33);

      goto LABEL_21;
    }
    if (v13)
    {
      v45 = [v4 zoomFromHardwareButtonPreludeTokenWrapper];
      v46 = [v45 consumeToken];

      v47 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v7 appLayout:v10 direction:0];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v47 setShouldUpdateIconViewVisibility:0];
      [(SBFullScreenToHomeIconZoomSwitcherModifier *)v47 setShouldMatchMoveToIconView:0];
      v23 = [[SBCaptureDropletZoomSwitcherModifier alloc] initWithTransitionID:v7 zoomModifier:v47 appLayout:v10 launchPreludeAnimationToken:v46];
      v48 = [[SBConsumedPreludeAnimationTokenSwitcherEventResponse alloc] initWithPreludeToken:v46];
      uint64_t v49 = SBAppendSwitcherModifierResponse(v48, v5);

      double v5 = (void *)v49;
      goto LABEL_21;
    }
    if ([v4 isExitingSlideOverPeekToAppEvent])
    {
      v53 = [v4 toFloatingAppLayout];
      v54 = [v4 fromFloatingAppLayout];
      char v55 = [v53 isEqual:v54];

      if ((v55 & 1) == 0)
      {
        v56 = [SBSlideOverToFullScreenSwitcherModifier alloc];
        v26 = [v4 fromFloatingAppLayout];
        v57 = [v4 toAppLayout];
        v23 = [(SBSlideOverToFullScreenSwitcherModifier *)v56 initWithTransitionID:v7 slideOverAppLayout:v26 fullScreenAppLayout:v57 replacingMainAppLayout:0];

        goto LABEL_16;
      }
    }
    if (([v4 isExitingSlideOverPeekToHomeScreenEvent] & 1) == 0)
    {
      if ([v4 isMoveDisplaysTransition])
      {
        v23 = [[SBMoveDisplaysTransitionSwitcherModifier alloc] initWithTransitionEvent:v4];
        goto LABEL_21;
      }
      if ((([(_SBHomeScreenFloorSwitcherModifier *)self isDevicePad] & 1) != 0
         || !+[SBHomeScreenReturnToSpotlightPolicy areSpotlightBreadcrumbsEnabled](SBHomeScreenReturnToSpotlightPolicy, "areSpotlightBreadcrumbsEnabled"))&& [v4 isSpotlightTransition])
      {
        goto LABEL_9;
      }
      v62.origin.x = v14;
      v62.origin.y = v15;
      v62.size.width = v16;
      v62.size.height = v17;
      if (!CGRectIsNull(v62))
      {
        v58 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v7 appLayout:v10 direction:0];
        v23 = (SBPIPRestoreToFullScreenSwitcherModifier *)v58;
        if (v11)
        {
          [(SBFullScreenToHomeIconZoomSwitcherModifier *)v58 setShouldForceDefaultAnchorPointForTransition:1];
          [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldDockOrderFrontDuringTransition:1];
          v59 = [(_SBHomeScreenFloorSwitcherModifier *)self homeScreenIconLocationForAppLayout:v10];
          [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldUpdateIconViewVisibility:SBIconLocationGroupContainsLocation() ^ 1];
          if ([v4 isMoveDisplaysTransition]) {
            [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldDisableAsyncRendering:1];
          }
        }
        if ([v4 fromEnvironmentMode] == 1 && objc_msgSend(v4, "isEnteringAnyPeekEvent")) {
          [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setShouldUpdateIconViewVisibility:0];
        }
        goto LABEL_21;
      }
      if ([v4 prefersCrossfadeTransition])
      {
        v23 = [[SBCrossfadeDosidoSwitcherModifier alloc] initWithTransitionID:v7 fromAppLayout:v8 toAppLayout:v10];
        [(SBPIPRestoreToFullScreenSwitcherModifier *)v23 setFullScreenTransition:v11 ^ 1];
LABEL_21:
        if (v23)
        {
          v50 = [[SBAddModifierSwitcherEventResponse alloc] initWithModifier:v23 level:3];
          uint64_t v51 = SBAppendSwitcherModifierResponse(v50, v5);

          double v5 = (void *)v51;
        }
        goto LABEL_23;
      }
      if (v10) {
        goto LABEL_9;
      }
    }
  }
LABEL_23:
  id v6 = v5;

LABEL_24:
  return v6;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return 0;
}

- (BOOL)wantsHomeScreenPointerInteractions
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

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldPerformRotationAnimationForOrientationChange
{
  return 0;
}

- (double)rotationAngleForIndex:(unint64_t)a3
{
  return 0.0;
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

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
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

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 0;
}

- (double)contentViewScale
{
  return 1.0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 0;
}

- (unint64_t)transactionCompletionOptions
{
  double v3 = [(_SBHomeScreenFloorSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    int v4 = [(_SBHomeScreenFloorSwitcherModifier *)self isReduceMotionEnabled];

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

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  char v5 = [(_SBHomeScreenFloorSwitcherModifier *)self isChamoisWindowingUIEnabled];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70___SBHomeScreenFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &__block_descriptor_33_e21_B16__0__SBAppLayout_8l;
  char v9 = v5;
  double v6 = objc_msgSend(v4, "bs_filter:", v8);

  return v6;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
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
  char v9 = [(_SBHomeScreenFloorSwitcherModifier *)self appLayouts];
  v10 = [v9 objectAtIndex:a3];

  uint64_t v11 = [v10 allItems];
  uint64_t v12 = [v11 count];

  if (v12 == 1)
  {
    int v13 = [(_SBHomeScreenFloorSwitcherModifier *)self appLayoutContainingAppLayout:v10];
    if (v10 != v13)
    {
      CGFloat v14 = [v10 itemForLayoutRole:1];
      uint64_t v15 = [v13 layoutRoleForItem:v14];
      [(_SBHomeScreenFloorSwitcherModifier *)self containerViewBounds];
      v28.receiver = self;
      v28.super_class = (Class)_SBHomeScreenFloorSwitcherModifier;
      -[_SBHomeScreenFloorSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v28, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v13);
      CGFloat v5 = v16;
      CGFloat v6 = v17;
      CGFloat v7 = v18;
      CGFloat v8 = v19;
    }
  }
  v29.origin.x = v5;
  v29.origin.y = v6;
  v29.size.width = v7;
  v29.size.height = v8;
  if (CGRectIsNull(v29))
  {
    [(_SBHomeScreenFloorSwitcherModifier *)self containerViewBounds];
    CGFloat v5 = v20;
    CGFloat v6 = v21;
    CGFloat v7 = v22;
    CGFloat v8 = v23;
  }

  double v24 = v5;
  double v25 = v6;
  double v26 = v7;
  double v27 = v8;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  return 1.0;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  double v3 = [(_SBHomeScreenFloorSwitcherModifier *)self homeGrabberSettings];
  char v4 = [v3 isEnabled];

  return v4;
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

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(_SBHomeScreenFloorSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (BOOL)shouldScaleOverlayToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(_SBHomeScreenFloorSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
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

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  if (a3) {
    BOOL v4 = a3 == 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (((1 << a3) & 0x6808) != 0) {
    BOOL v5 = a4 != 0;
  }
  else {
    BOOL v5 = v4;
  }
  return (unint64_t)a3 <= 0xE && v5;
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

- (BOOL)shouldUseBackgroundWallpaperTreatmentForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  double v2 = [(_SBHomeScreenFloorSwitcherModifier *)self appLayouts];
  double v3 = objc_msgSend(v2, "subarrayWithRange:", 0, objc_msgSend(v2, "count") != 0);

  return v3;
}

- (int64_t)preferredSnapshotOrientationForAppLayout:(id)a3
{
  if ([(_SBHomeScreenFloorSwitcherModifier *)self isDisplayEmbedded]) {
    return 1;
  }
  else {
    return 2;
  }
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

- (id)appLayoutForReceivingHardwareButtonEvents
{
  return 0;
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
  return 0;
}

- (char)activityModeForAppLayout:(id)a3
{
  return 0;
}

@end