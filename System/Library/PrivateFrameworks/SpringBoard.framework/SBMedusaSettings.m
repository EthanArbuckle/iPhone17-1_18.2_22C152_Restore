@interface SBMedusaSettings
+ (id)settingsControllerModule;
- (BOOL)persistentDock;
- (BOOL)showContentDragExclusionRects;
- (BOOL)statusBarDebugBackgroundColorsEnabled;
- (BOOL)statusBarDebugOffsettingEnabled;
- (CAColorMatrix)coronaVibrantColorMatrixInput;
- (PTOutlet)killSpringBoardOutlet;
- (SBFFluidBehaviorSettings)dockAnimationSettings;
- (SBFFluidBehaviorSettings)dockWithPresentedFolderAnimationSettings;
- (SBFFluidBehaviorSettings)dropAnimationSettings;
- (SBFFluidBehaviorSettings)medusaAnimationSettings;
- (SBFFluidBehaviorSettings)platterAnimationSettings;
- (SBFFluidBehaviorSettings)resizeAnimationSettings;
- (SBFFluidBehaviorSettings)switcherCardDropAnimationSettings;
- (SBFFluidBehaviorSettings)switcherShelfBounceIconSettings;
- (SBFFluidBehaviorSettings)switcherShelfCardGenieDismissalSettings;
- (SBFFluidBehaviorSettings)switcherShelfCardGeniePresentationSettings;
- (SBFFluidBehaviorSettings)switcherShelfCardNonGenieDismissalSettings;
- (SBFFluidBehaviorSettings)switcherShelfCardNonGeniePresentationSettings;
- (SBFFluidBehaviorSettings)switcherShelfGenieRopeSettings;
- (SBFFluidBehaviorSettings)switcherShelfNonGenieRopeSettings;
- (SBFFluidBehaviorSettings)topAffordanceCollapseAnimationSettings;
- (SBFFluidBehaviorSettings)topAffordanceExpandAnimationSettings;
- (SBFFluidBehaviorSettings)windowDragAnimationSettings;
- (SBMedusa1oSettings)medusa1oSettings;
- (UIEdgeInsets)medusaSeparatorCursorEdgeInsets;
- (UIEdgeInsets)medusaWindowDraggingCursorEdgeInsets;
- (double)blurFadeAnimationDuration;
- (double)cardDragOverSplitAppLayoutScale;
- (double)cardPlatterScale;
- (double)contentDraggingCommandeerGutterInsetForUniversalControl;
- (double)contentDraggingCommandeerGutterWidth;
- (double)contentDraggingFloatingActivationGutterWidth;
- (double)contentDraggingSideActivationGutterWidth;
- (double)cornerRadiusFallbackForOldApps;
- (double)cornerRadiusForCompatibilityAppOuterCorners;
- (double)cornerRadiusForFloatingApps;
- (double)cornerRadiusForInnerCorners;
- (double)coronaDiffuseShadowOpacity;
- (double)coronaDiffuseShadowOpacityWhileTouched;
- (double)coronaRimShadowOpacity;
- (double)defaultDimmingOpacity;
- (double)diffuseShadowOffsetHorizontal;
- (double)diffuseShadowOffsetHorizontalWhileTouched;
- (double)diffuseShadowOffsetVertical;
- (double)diffuseShadowOffsetVerticalWhileTouched;
- (double)diffuseShadowOpacity;
- (double)diffuseShadowOpacityWhileTouched;
- (double)diffuseShadowRadius;
- (double)diffuseShadowRadiusWhileTouched;
- (double)dismissHitTestTopPadding;
- (double)draggingPlatterFullscreenActivationRegionHeight;
- (double)draggingPlatterFullscreenActivationRegionWidth;
- (double)draggingPlatterSideActivationGutterPadding;
- (double)dropAnimationUnblurThresholdPercentage;
- (double)effectiveBlurFadeAnimationDuration;
- (double)floatingAppCardScaleWhileCursorHovered;
- (double)floatingAppCardScaleWhileTouched;
- (double)floatingCardPlatterScale;
- (double)iconPlatterScale;
- (double)leadingSlideOverRelocationDelay;
- (double)medusaSeparatorCursorBottomEdgeInset;
- (double)medusaSeparatorCursorLeftEdgeInset;
- (double)medusaSeparatorCursorRightEdgeInset;
- (double)medusaSeparatorCursorTopEdgeInset;
- (double)medusaWindowDraggingCursorBottomEdgeInset;
- (double)medusaWindowDraggingCursorLeftEdgeInset;
- (double)medusaWindowDraggingCursorRightEdgeInset;
- (double)medusaWindowDraggingCursorTopEdgeInset;
- (double)movePanGestureNegativeVelocityThreshold;
- (double)movePanGesturePositiveVelocityThreshold;
- (double)movePanGestureThresholdPercentage;
- (double)narrowEdgeSwipeHitTestWidth;
- (double)numberOfRecents;
- (double)reduceMotionBlurFadeAnimationDuration;
- (double)reflowAnimationProgressForCardHeaderFadeIn;
- (double)replacementDimmingAlpha;
- (double)resizeAnimationDismissItemOpacity;
- (double)resizeAnimationUnblurThresholdPercentage;
- (double)rimShadowOpacity;
- (double)rimShadowRadius;
- (double)slideOverTongueExpandedScale;
- (double)switcherCenterWindowContentPushInScale;
- (double)switcherCenterWindowShadowOffsetY;
- (double)switcherCenterWindowShadowOpacity;
- (double)switcherCenterWindowShadowRadius;
- (double)switcherFullScreenContentPushInScale;
- (double)switcherPeekingWindowShadowOffsetY;
- (double)switcherPeekingWindowShadowOpacity;
- (double)switcherPeekingWindowShadowRadius;
- (double)switcherShelfBackgroundBlurPresentationThreshold;
- (double)switcherShelfBottomSpacing;
- (double)switcherShelfCardCornerRadius;
- (double)switcherShelfCardGenieDismissedScale;
- (double)switcherShelfCardGenieResponseIncrementScalar;
- (double)switcherShelfCardNonGenieDismissedScale;
- (double)switcherShelfCardNonGenieResponseIncrementScalar;
- (double)switcherShelfCardScale;
- (double)switcherShelfCardShadowOffsetY;
- (double)switcherShelfCardShadowOpacity;
- (double)switcherShelfCardShadowRadius;
- (double)switcherShelfGenieBezierCurvePointYDeltaFromTarget;
- (double)switcherShelfGenieBezierCurveScaleExponent;
- (double)switcherShelfGenieBezierCurveXExponent;
- (double)switcherShelfGenieBezierCurveYExponent;
- (double)switcherShelfGenieIconBounceDelay;
- (double)switcherShelfGenieInitialYIncrementBelowScreen;
- (double)switcherShelfIconHitTestInset;
- (double)switcherShelfLabelLineSpacing;
- (double)switcherShelfSplitViewIconInset;
- (double)switcherSlideOverContentPushInScale;
- (double)switcherSlideOverDosidoLayoutOvershootMultiplicationFactor;
- (double)topAffordanceHitTestExtendBottom;
- (double)topAffordanceHitTestExtendLeft;
- (double)topAffordanceHitTestExtendRight;
- (double)topAffordanceHitTestExtendTop;
- (double)vibrantColorMatrixM11;
- (double)vibrantColorMatrixM12;
- (double)vibrantColorMatrixM13;
- (double)vibrantColorMatrixM14;
- (double)vibrantColorMatrixM15;
- (double)vibrantColorMatrixM21;
- (double)vibrantColorMatrixM22;
- (double)vibrantColorMatrixM23;
- (double)vibrantColorMatrixM24;
- (double)vibrantColorMatrixM25;
- (double)vibrantColorMatrixM31;
- (double)vibrantColorMatrixM32;
- (double)vibrantColorMatrixM33;
- (double)vibrantColorMatrixM34;
- (double)vibrantColorMatrixM35;
- (double)vibrantColorMatrixM41;
- (double)vibrantColorMatrixM42;
- (double)vibrantColorMatrixM43;
- (double)vibrantColorMatrixM44;
- (double)vibrantColorMatrixM45;
- (double)wideEdgeSwipeHitTestWidth;
- (double)windowPlatterScale;
- (double)windowPlatterScaleForReplacingEntireSpace;
- (double)windowSplitViewDismissalGutterWidth;
- (double)windowTearOffDraggingFloatingActivationGutterWidth;
- (double)windowTearOffDraggingSideActivationGutterWidth;
- (void)setBlurFadeAnimationDuration:(double)a3;
- (void)setCardDragOverSplitAppLayoutScale:(double)a3;
- (void)setCardPlatterScale:(double)a3;
- (void)setContentDraggingCommandeerGutterInsetForUniversalControl:(double)a3;
- (void)setContentDraggingCommandeerGutterWidth:(double)a3;
- (void)setContentDraggingFloatingActivationGutterWidth:(double)a3;
- (void)setContentDraggingSideActivationGutterWidth:(double)a3;
- (void)setCornerRadiusFallbackForOldApps:(double)a3;
- (void)setCornerRadiusForCompatibilityAppOuterCorners:(double)a3;
- (void)setCornerRadiusForFloatingApps:(double)a3;
- (void)setCornerRadiusForInnerCorners:(double)a3;
- (void)setCoronaDiffuseShadowOpacity:(double)a3;
- (void)setCoronaDiffuseShadowOpacityWhileTouched:(double)a3;
- (void)setCoronaRimShadowOpacity:(double)a3;
- (void)setDefaultDimmingOpacity:(double)a3;
- (void)setDefaultValues;
- (void)setDiffuseShadowOffsetHorizontal:(double)a3;
- (void)setDiffuseShadowOffsetHorizontalWhileTouched:(double)a3;
- (void)setDiffuseShadowOffsetVertical:(double)a3;
- (void)setDiffuseShadowOffsetVerticalWhileTouched:(double)a3;
- (void)setDiffuseShadowOpacity:(double)a3;
- (void)setDiffuseShadowOpacityWhileTouched:(double)a3;
- (void)setDiffuseShadowRadius:(double)a3;
- (void)setDiffuseShadowRadiusWhileTouched:(double)a3;
- (void)setDismissHitTestTopPadding:(double)a3;
- (void)setDockAnimationSettings:(id)a3;
- (void)setDockWithPresentedFolderAnimationSettings:(id)a3;
- (void)setDraggingPlatterFullscreenActivationRegionHeight:(double)a3;
- (void)setDraggingPlatterFullscreenActivationRegionWidth:(double)a3;
- (void)setDraggingPlatterSideActivationGutterPadding:(double)a3;
- (void)setDropAnimationSettings:(id)a3;
- (void)setDropAnimationUnblurThresholdPercentage:(double)a3;
- (void)setFloatingAppCardScaleWhileCursorHovered:(double)a3;
- (void)setFloatingAppCardScaleWhileTouched:(double)a3;
- (void)setFloatingCardPlatterScale:(double)a3;
- (void)setIconPlatterScale:(double)a3;
- (void)setKillSpringBoardOutlet:(id)a3;
- (void)setLeadingSlideOverRelocationDelay:(double)a3;
- (void)setMedusa1oSettings:(id)a3;
- (void)setMedusaAnimationSettings:(id)a3;
- (void)setMedusaSeparatorCursorBottomEdgeInset:(double)a3;
- (void)setMedusaSeparatorCursorLeftEdgeInset:(double)a3;
- (void)setMedusaSeparatorCursorRightEdgeInset:(double)a3;
- (void)setMedusaSeparatorCursorTopEdgeInset:(double)a3;
- (void)setMedusaWindowDraggingCursorBottomEdgeInset:(double)a3;
- (void)setMedusaWindowDraggingCursorLeftEdgeInset:(double)a3;
- (void)setMedusaWindowDraggingCursorRightEdgeInset:(double)a3;
- (void)setMedusaWindowDraggingCursorTopEdgeInset:(double)a3;
- (void)setMovePanGestureNegativeVelocityThreshold:(double)a3;
- (void)setMovePanGesturePositiveVelocityThreshold:(double)a3;
- (void)setMovePanGestureThresholdPercentage:(double)a3;
- (void)setNarrowEdgeSwipeHitTestWidth:(double)a3;
- (void)setNumberOfRecents:(double)a3;
- (void)setPersistentDock:(BOOL)a3;
- (void)setPlatterAnimationSettings:(id)a3;
- (void)setReduceMotionBlurFadeAnimationDuration:(double)a3;
- (void)setReflowAnimationProgressForCardHeaderFadeIn:(double)a3;
- (void)setReplacementDimmingAlpha:(double)a3;
- (void)setResizeAnimationDismissItemOpacity:(double)a3;
- (void)setResizeAnimationSettings:(id)a3;
- (void)setResizeAnimationUnblurThresholdPercentage:(double)a3;
- (void)setRimShadowOpacity:(double)a3;
- (void)setRimShadowRadius:(double)a3;
- (void)setShowContentDragExclusionRects:(BOOL)a3;
- (void)setSlideOverTongueExpandedScale:(double)a3;
- (void)setStatusBarDebugBackgroundColorsEnabled:(BOOL)a3;
- (void)setStatusBarDebugOffsettingEnabled:(BOOL)a3;
- (void)setSwitcherCardDropAnimationSettings:(id)a3;
- (void)setSwitcherCenterWindowContentPushInScale:(double)a3;
- (void)setSwitcherCenterWindowShadowOffsetY:(double)a3;
- (void)setSwitcherCenterWindowShadowOpacity:(double)a3;
- (void)setSwitcherCenterWindowShadowRadius:(double)a3;
- (void)setSwitcherFullScreenContentPushInScale:(double)a3;
- (void)setSwitcherPeekingWindowShadowOffsetY:(double)a3;
- (void)setSwitcherPeekingWindowShadowOpacity:(double)a3;
- (void)setSwitcherPeekingWindowShadowRadius:(double)a3;
- (void)setSwitcherShelfBackgroundBlurPresentationThreshold:(double)a3;
- (void)setSwitcherShelfBottomSpacing:(double)a3;
- (void)setSwitcherShelfBounceIconSettings:(id)a3;
- (void)setSwitcherShelfCardCornerRadius:(double)a3;
- (void)setSwitcherShelfCardGenieDismissalSettings:(id)a3;
- (void)setSwitcherShelfCardGenieDismissedScale:(double)a3;
- (void)setSwitcherShelfCardGeniePresentationSettings:(id)a3;
- (void)setSwitcherShelfCardGenieResponseIncrementScalar:(double)a3;
- (void)setSwitcherShelfCardNonGenieDismissalSettings:(id)a3;
- (void)setSwitcherShelfCardNonGenieDismissedScale:(double)a3;
- (void)setSwitcherShelfCardNonGeniePresentationSettings:(id)a3;
- (void)setSwitcherShelfCardNonGenieResponseIncrementScalar:(double)a3;
- (void)setSwitcherShelfCardScale:(double)a3;
- (void)setSwitcherShelfCardShadowOffsetY:(double)a3;
- (void)setSwitcherShelfCardShadowOpacity:(double)a3;
- (void)setSwitcherShelfCardShadowRadius:(double)a3;
- (void)setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:(double)a3;
- (void)setSwitcherShelfGenieBezierCurveScaleExponent:(double)a3;
- (void)setSwitcherShelfGenieBezierCurveXExponent:(double)a3;
- (void)setSwitcherShelfGenieBezierCurveYExponent:(double)a3;
- (void)setSwitcherShelfGenieIconBounceDelay:(double)a3;
- (void)setSwitcherShelfGenieInitialYIncrementBelowScreen:(double)a3;
- (void)setSwitcherShelfGenieRopeSettings:(id)a3;
- (void)setSwitcherShelfIconHitTestInset:(double)a3;
- (void)setSwitcherShelfLabelLineSpacing:(double)a3;
- (void)setSwitcherShelfNonGenieRopeSettings:(id)a3;
- (void)setSwitcherShelfSplitViewIconInset:(double)a3;
- (void)setSwitcherSlideOverContentPushInScale:(double)a3;
- (void)setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:(double)a3;
- (void)setTopAffordanceCollapseAnimationSettings:(id)a3;
- (void)setTopAffordanceExpandAnimationSettings:(id)a3;
- (void)setTopAffordanceHitTestExtendBottom:(double)a3;
- (void)setTopAffordanceHitTestExtendLeft:(double)a3;
- (void)setTopAffordanceHitTestExtendRight:(double)a3;
- (void)setTopAffordanceHitTestExtendTop:(double)a3;
- (void)setVibrantColorMatrixM11:(double)a3;
- (void)setVibrantColorMatrixM12:(double)a3;
- (void)setVibrantColorMatrixM13:(double)a3;
- (void)setVibrantColorMatrixM14:(double)a3;
- (void)setVibrantColorMatrixM15:(double)a3;
- (void)setVibrantColorMatrixM21:(double)a3;
- (void)setVibrantColorMatrixM22:(double)a3;
- (void)setVibrantColorMatrixM23:(double)a3;
- (void)setVibrantColorMatrixM24:(double)a3;
- (void)setVibrantColorMatrixM25:(double)a3;
- (void)setVibrantColorMatrixM31:(double)a3;
- (void)setVibrantColorMatrixM32:(double)a3;
- (void)setVibrantColorMatrixM33:(double)a3;
- (void)setVibrantColorMatrixM34:(double)a3;
- (void)setVibrantColorMatrixM35:(double)a3;
- (void)setVibrantColorMatrixM41:(double)a3;
- (void)setVibrantColorMatrixM42:(double)a3;
- (void)setVibrantColorMatrixM43:(double)a3;
- (void)setVibrantColorMatrixM44:(double)a3;
- (void)setVibrantColorMatrixM45:(double)a3;
- (void)setWideEdgeSwipeHitTestWidth:(double)a3;
- (void)setWindowDragAnimationSettings:(id)a3;
- (void)setWindowPlatterScale:(double)a3;
- (void)setWindowPlatterScaleForReplacingEntireSpace:(double)a3;
- (void)setWindowSplitViewDismissalGutterWidth:(double)a3;
- (void)setWindowTearOffDraggingFloatingActivationGutterWidth:(double)a3;
- (void)setWindowTearOffDraggingSideActivationGutterWidth:(double)a3;
@end

@implementation SBMedusaSettings

- (BOOL)statusBarDebugOffsettingEnabled
{
  return self->_statusBarDebugOffsettingEnabled;
}

- (double)switcherShelfIconHitTestInset
{
  return self->_switcherShelfIconHitTestInset;
}

- (BOOL)showContentDragExclusionRects
{
  return self->_showContentDragExclusionRects;
}

- (BOOL)statusBarDebugBackgroundColorsEnabled
{
  return self->_statusBarDebugBackgroundColorsEnabled;
}

- (void)setDefaultValues
{
  [(SBMedusaSettings *)self setPersistentDock:1];
  [(SBMedusaSettings *)self setNumberOfRecents:3.0];
  [(SBMedusaSettings *)self setDismissHitTestTopPadding:20.0];
  v4 = [(SBMedusaSettings *)self dockAnimationSettings];
  [v4 setDefaultValues];

  v5 = [(SBMedusaSettings *)self dockAnimationSettings];
  CAFrameRateRange v77 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v77.minimum, *(double *)&v77.maximum, *(double *)&v77.preferred);

  v6 = [(SBMedusaSettings *)self dockWithPresentedFolderAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(SBMedusaSettings *)self dockWithPresentedFolderAnimationSettings];
  CAFrameRateRange v78 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v78.minimum, *(double *)&v78.maximum, *(double *)&v78.preferred);

  v8 = [(SBMedusaSettings *)self dockWithPresentedFolderAnimationSettings];
  [v8 setDampingRatio:0.9962];

  v9 = [(SBMedusaSettings *)self dockWithPresentedFolderAnimationSettings];
  [v9 setResponse:0.2721];

  [(SBMedusaSettings *)self setNarrowEdgeSwipeHitTestWidth:108.0];
  [(SBMedusaSettings *)self setWideEdgeSwipeHitTestWidth:140.0];
  [(SBMedusaSettings *)self setRimShadowRadius:0.5];
  [(SBMedusaSettings *)self setRimShadowOpacity:0.15];
  -[SBMedusaSettings setFloatingAppCardScaleWhileTouched:](self, "setFloatingAppCardScaleWhileTouched:");
  [(SBMedusaSettings *)self setFloatingAppCardScaleWhileCursorHovered:1.012];
  [(SBMedusaSettings *)self setDiffuseShadowRadius:56.0];
  [(SBMedusaSettings *)self setDiffuseShadowOpacity:0.24];
  [(SBMedusaSettings *)self setDiffuseShadowOffsetHorizontal:10.0];
  [(SBMedusaSettings *)self setDiffuseShadowOffsetVertical:7.0];
  [(SBMedusaSettings *)self setDiffuseShadowRadiusWhileTouched:60.0];
  [(SBMedusaSettings *)self setDiffuseShadowOpacityWhileTouched:0.26];
  [(SBMedusaSettings *)self setDiffuseShadowOffsetHorizontalWhileTouched:0.0];
  [(SBMedusaSettings *)self setDiffuseShadowOffsetVerticalWhileTouched:30.0];
  [(SBMedusaSettings *)self setCoronaDiffuseShadowOpacity:1.0];
  [(SBMedusaSettings *)self setCoronaDiffuseShadowOpacityWhileTouched:1.0];
  [(SBMedusaSettings *)self setCoronaRimShadowOpacity:0.5];
  [(SBMedusaSettings *)self setVibrantColorMatrixM11:0.664];
  [(SBMedusaSettings *)self setVibrantColorMatrixM12:-0.192];
  [(SBMedusaSettings *)self setVibrantColorMatrixM13:-0.037];
  [(SBMedusaSettings *)self setVibrantColorMatrixM14:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM15:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM21:-0.097];
  [(SBMedusaSettings *)self setVibrantColorMatrixM22:0.57];
  [(SBMedusaSettings *)self setVibrantColorMatrixM23:-0.037];
  [(SBMedusaSettings *)self setVibrantColorMatrixM24:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM25:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM31:-0.098];
  [(SBMedusaSettings *)self setVibrantColorMatrixM32:-0.191];
  [(SBMedusaSettings *)self setVibrantColorMatrixM33:0.724];
  [(SBMedusaSettings *)self setVibrantColorMatrixM34:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM35:0.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM41:-0.26];
  [(SBMedusaSettings *)self setVibrantColorMatrixM42:-0.511];
  [(SBMedusaSettings *)self setVibrantColorMatrixM43:0.099];
  [(SBMedusaSettings *)self setVibrantColorMatrixM44:1.0];
  [(SBMedusaSettings *)self setVibrantColorMatrixM45:0.0];
  [(SBMedusaSettings *)self setBlurFadeAnimationDuration:0.25];
  [(SBMedusaSettings *)self setReduceMotionBlurFadeAnimationDuration:0.2];
  v10 = [(SBMedusaSettings *)self windowDragAnimationSettings];
  [v10 setDefaultValues];

  v11 = [(SBMedusaSettings *)self windowDragAnimationSettings];
  [v11 setTrackingDampingRatio:0.92];

  v12 = [(SBMedusaSettings *)self windowDragAnimationSettings];
  [v12 setTrackingResponse:0.1];

  v13 = [(SBMedusaSettings *)self windowDragAnimationSettings];
  CAFrameRateRange v79 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v79.minimum, *(double *)&v79.maximum, *(double *)&v79.preferred);

  v14 = [(SBMedusaSettings *)self medusaAnimationSettings];
  [v14 setDampingRatio:0.92];

  v15 = [(SBMedusaSettings *)self medusaAnimationSettings];
  [v15 setResponse:0.457];

  v16 = [(SBMedusaSettings *)self medusaAnimationSettings];
  [v16 setTrackingDampingRatio:0.9];

  v17 = [(SBMedusaSettings *)self medusaAnimationSettings];
  [v17 setTrackingResponse:0.12];

  v18 = [(SBMedusaSettings *)self medusaAnimationSettings];
  CAFrameRateRange v80 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v80.minimum, *(double *)&v80.maximum, *(double *)&v80.preferred);

  v19 = [(SBMedusaSettings *)self resizeAnimationSettings];
  [v19 setDampingRatio:1.0];

  v20 = [(SBMedusaSettings *)self resizeAnimationSettings];
  [v20 setResponse:0.42];

  v21 = [(SBMedusaSettings *)self resizeAnimationSettings];
  CAFrameRateRange v81 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v21, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v81.minimum, *(double *)&v81.maximum, *(double *)&v81.preferred);

  v22 = [(SBMedusaSettings *)self platterAnimationSettings];
  [v22 setDampingRatio:0.9];

  v23 = [(SBMedusaSettings *)self platterAnimationSettings];
  [v23 setResponse:0.42];

  v24 = [(SBMedusaSettings *)self platterAnimationSettings];
  CAFrameRateRange v82 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v24, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v82.minimum, *(double *)&v82.maximum, *(double *)&v82.preferred);

  v25 = [(SBMedusaSettings *)self dropAnimationSettings];
  [v25 setDampingRatio:0.92];

  v26 = [(SBMedusaSettings *)self dropAnimationSettings];
  [v26 setResponse:0.457];

  v27 = [(SBMedusaSettings *)self dropAnimationSettings];
  [v27 setTrackingDampingRatio:0.92];

  v28 = [(SBMedusaSettings *)self dropAnimationSettings];
  [v28 setTrackingResponse:0.457];

  v29 = [(SBMedusaSettings *)self dropAnimationSettings];
  CAFrameRateRange v83 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v29, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v83.minimum, *(double *)&v83.maximum, *(double *)&v83.preferred);

  v30 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  [v30 setDefaultValues];

  v31 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  [v31 setDampingRatio:0.92];

  v32 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  [v32 setResponse:0.531];

  v33 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  [v33 setTrackingDampingRatio:0.92];

  v34 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  [v34 setTrackingResponse:0.531];

  v35 = [(SBMedusaSettings *)self switcherCardDropAnimationSettings];
  CAFrameRateRange v84 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v35, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v84.minimum, *(double *)&v84.maximum, *(double *)&v84.preferred);

  v36 = [(SBMedusaSettings *)self topAffordanceExpandAnimationSettings];
  [v36 setDampingRatio:1.01];

  v37 = [(SBMedusaSettings *)self topAffordanceExpandAnimationSettings];
  [v37 setResponse:0.28];

  v38 = [(SBMedusaSettings *)self topAffordanceExpandAnimationSettings];
  [v38 setRetargetImpulse:0.016];

  v39 = [(SBMedusaSettings *)self topAffordanceExpandAnimationSettings];
  CAFrameRateRange v85 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v39, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v85.minimum, *(double *)&v85.maximum, *(double *)&v85.preferred);

  v40 = [(SBMedusaSettings *)self topAffordanceCollapseAnimationSettings];
  [v40 setDampingRatio:1.01];

  v41 = [(SBMedusaSettings *)self topAffordanceCollapseAnimationSettings];
  [v41 setResponse:0.28];

  v42 = [(SBMedusaSettings *)self topAffordanceCollapseAnimationSettings];
  [v42 setRetargetImpulse:0.016];

  v43 = [(SBMedusaSettings *)self topAffordanceCollapseAnimationSettings];
  CAFrameRateRange v86 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v43, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v86.minimum, *(double *)&v86.maximum, *(double *)&v86.preferred);

  [(SBMedusaSettings *)self setDropAnimationUnblurThresholdPercentage:0.5];
  [(SBMedusaSettings *)self setResizeAnimationUnblurThresholdPercentage:0.9];
  [(SBMedusaSettings *)self setResizeAnimationDismissItemOpacity:0.4];
  [(SBMedusaSettings *)self setMovePanGestureThresholdPercentage:0.3];
  [(SBMedusaSettings *)self setMovePanGesturePositiveVelocityThreshold:500.0];
  [(SBMedusaSettings *)self setMovePanGestureNegativeVelocityThreshold:-500.0];
  [(SBMedusaSettings *)self setIconPlatterScale:0.4];
  [(SBMedusaSettings *)self setWindowPlatterScale:0.8];
  [(SBMedusaSettings *)self setWindowPlatterScaleForReplacingEntireSpace:0.6];
  [(SBMedusaSettings *)self setCardPlatterScale:1.0];
  [(SBMedusaSettings *)self setFloatingCardPlatterScale:0.7];
  [(SBMedusaSettings *)self setSlideOverTongueExpandedScale:0.34];
  [(SBMedusaSettings *)self setCardDragOverSplitAppLayoutScale:0.96];
  [(SBMedusaSettings *)self setReflowAnimationProgressForCardHeaderFadeIn:1.0];
  [(SBMedusaSettings *)self setDraggingPlatterSideActivationGutterPadding:8.0];
  [(SBMedusaSettings *)self setDraggingPlatterFullscreenActivationRegionWidth:320.0];
  [(SBMedusaSettings *)self setDraggingPlatterFullscreenActivationRegionHeight:24.0];
  [(SBMedusaSettings *)self setSwitcherFullScreenContentPushInScale:0.98];
  [(SBMedusaSettings *)self setSwitcherCenterWindowContentPushInScale:0.9];
  [(SBMedusaSettings *)self setSwitcherSlideOverContentPushInScale:0.95];
  [(SBMedusaSettings *)self setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:1.2];
  [(SBMedusaSettings *)self setMedusaSeparatorCursorTopEdgeInset:-5.0];
  [(SBMedusaSettings *)self setMedusaSeparatorCursorBottomEdgeInset:-5.0];
  [(SBMedusaSettings *)self setMedusaSeparatorCursorLeftEdgeInset:-2.5];
  [(SBMedusaSettings *)self setMedusaSeparatorCursorRightEdgeInset:-2.5];
  [(SBMedusaSettings *)self setReplacementDimmingAlpha:0.06];
  [(SBMedusaSettings *)self setTopAffordanceHitTestExtendTop:20.0];
  [(SBMedusaSettings *)self setTopAffordanceHitTestExtendBottom:20.0];
  [(SBMedusaSettings *)self setTopAffordanceHitTestExtendLeft:20.0];
  [(SBMedusaSettings *)self setTopAffordanceHitTestExtendRight:20.0];
  [(SBMedusaSettings *)self setShowContentDragExclusionRects:0];
  [(SBMedusaSettings *)self setContentDraggingCommandeerGutterInsetForUniversalControl:20.0];
  [(SBMedusaSettings *)self setContentDraggingCommandeerGutterWidth:120.0];
  [(SBMedusaSettings *)self setContentDraggingSideActivationGutterWidth:60.0];
  [(SBMedusaSettings *)self setContentDraggingFloatingActivationGutterWidth:150.0];
  [(SBMedusaSettings *)self setWindowTearOffDraggingSideActivationGutterWidth:100.0];
  [(SBMedusaSettings *)self setWindowTearOffDraggingFloatingActivationGutterWidth:350.0];
  [(SBMedusaSettings *)self setWindowSplitViewDismissalGutterWidth:90.0];
  [(SBMedusaSettings *)self setMedusaWindowDraggingCursorTopEdgeInset:-4.0];
  [(SBMedusaSettings *)self setMedusaWindowDraggingCursorBottomEdgeInset:-4.0];
  [(SBMedusaSettings *)self setMedusaWindowDraggingCursorLeftEdgeInset:-7.0];
  [(SBMedusaSettings *)self setMedusaWindowDraggingCursorRightEdgeInset:-7.0];
  [(SBMedusaSettings *)self setCornerRadiusForInnerCorners:5.0];
  [(SBMedusaSettings *)self cornerRadiusForInnerCorners];
  -[SBMedusaSettings setCornerRadiusForCompatibilityAppOuterCorners:](self, "setCornerRadiusForCompatibilityAppOuterCorners:");
  [(SBMedusaSettings *)self setCornerRadiusForFloatingApps:10.0];
  int v44 = __sb__runningInSpringBoard();
  char v45 = v44;
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      [(SBMedusaSettings *)self setCornerRadiusFallbackForOldApps:0.0];
      goto LABEL_11;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {
      [(SBMedusaSettings *)self setCornerRadiusFallbackForOldApps:0.0];
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v46 = SBFEffectiveHomeButtonType();
  double v47 = 39.0;
  if (v46 != 2) {
    double v47 = 0.0;
  }
  [(SBMedusaSettings *)self setCornerRadiusFallbackForOldApps:v47];
  if ((v45 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:
  [(SBMedusaSettings *)self setStatusBarDebugBackgroundColorsEnabled:0];
  [(SBMedusaSettings *)self setStatusBarDebugOffsettingEnabled:0];
  [(SBMedusaSettings *)self setSwitcherShelfCardScale:0.105];
  [(SBMedusaSettings *)self setSwitcherShelfCardCornerRadius:6.0];
  [(SBMedusaSettings *)self setSwitcherShelfCardShadowRadius:24.0];
  [(SBMedusaSettings *)self setSwitcherShelfCardShadowOffsetY:16.0];
  [(SBMedusaSettings *)self setSwitcherShelfCardShadowOpacity:0.4];
  [(SBMedusaSettings *)self setSwitcherShelfLabelLineSpacing:1.0];
  [(SBMedusaSettings *)self setSwitcherShelfBottomSpacing:64.0];
  [(SBMedusaSettings *)self setSwitcherShelfBackgroundBlurPresentationThreshold:1.0];
  [(SBMedusaSettings *)self setSwitcherCenterWindowShadowRadius:20.0];
  [(SBMedusaSettings *)self setSwitcherCenterWindowShadowOffsetY:6.0];
  [(SBMedusaSettings *)self setSwitcherCenterWindowShadowOpacity:0.24];
  [(SBMedusaSettings *)self setSwitcherPeekingWindowShadowRadius:44.0];
  [(SBMedusaSettings *)self setSwitcherPeekingWindowShadowOffsetY:0.0];
  [(SBMedusaSettings *)self setSwitcherPeekingWindowShadowOpacity:0.32];
  [(SBMedusaSettings *)self setLeadingSlideOverRelocationDelay:0.4];
  [(SBMedusaSettings *)self setDefaultDimmingOpacity:0.3];
  [(SBMedusaSettings *)self setSwitcherShelfSplitViewIconInset:4.0];
  [(SBMedusaSettings *)self setSwitcherShelfIconHitTestInset:24.0];
  v48 = [(SBMedusaSettings *)self switcherShelfGenieRopeSettings];
  [v48 setDefaultValues];

  v49 = [(SBMedusaSettings *)self switcherShelfGenieRopeSettings];
  [v49 setResponse:0.375];

  v50 = [(SBMedusaSettings *)self switcherShelfGenieRopeSettings];
  [v50 setDampingRatio:1.0];

  v51 = [(SBMedusaSettings *)self switcherShelfGenieRopeSettings];
  CAFrameRateRange v87 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v51, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v87.minimum, *(double *)&v87.maximum, *(double *)&v87.preferred);

  v52 = [(SBMedusaSettings *)self switcherShelfCardGeniePresentationSettings];
  [v52 setDefaultValues];

  v53 = [(SBMedusaSettings *)self switcherShelfCardGeniePresentationSettings];
  [v53 setResponse:0.675];

  v54 = [(SBMedusaSettings *)self switcherShelfCardGeniePresentationSettings];
  [v54 setDampingRatio:1.05];

  v55 = [(SBMedusaSettings *)self switcherShelfCardGeniePresentationSettings];
  CAFrameRateRange v88 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v55, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v88.minimum, *(double *)&v88.maximum, *(double *)&v88.preferred);

  v56 = [(SBMedusaSettings *)self switcherShelfCardGenieDismissalSettings];
  [v56 setDefaultValues];

  v57 = [(SBMedusaSettings *)self switcherShelfCardGenieDismissalSettings];
  [v57 setResponse:0.5];

  v58 = [(SBMedusaSettings *)self switcherShelfCardGenieDismissalSettings];
  [v58 setDampingRatio:0.875];

  v59 = [(SBMedusaSettings *)self switcherShelfCardGenieDismissalSettings];
  CAFrameRateRange v89 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v59, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v89.minimum, *(double *)&v89.maximum, *(double *)&v89.preferred);

  [(SBMedusaSettings *)self setSwitcherShelfGenieInitialYIncrementBelowScreen:100.0];
  [(SBMedusaSettings *)self setSwitcherShelfCardGenieResponseIncrementScalar:0.08];
  [(SBMedusaSettings *)self setSwitcherShelfCardGenieDismissedScale:0.05];
  [(SBMedusaSettings *)self setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:-380.0];
  [(SBMedusaSettings *)self setSwitcherShelfGenieBezierCurveXExponent:1.6];
  [(SBMedusaSettings *)self setSwitcherShelfGenieBezierCurveYExponent:1.0];
  [(SBMedusaSettings *)self setSwitcherShelfGenieBezierCurveScaleExponent:0.98];
  v60 = [(SBMedusaSettings *)self switcherShelfNonGenieRopeSettings];
  [v60 setDefaultValues];

  v61 = [(SBMedusaSettings *)self switcherShelfNonGenieRopeSettings];
  [v61 setResponse:0.4];

  v62 = [(SBMedusaSettings *)self switcherShelfNonGenieRopeSettings];
  [v62 setDampingRatio:1.0];

  v63 = [(SBMedusaSettings *)self switcherShelfNonGenieRopeSettings];
  CAFrameRateRange v90 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v63, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v90.minimum, *(double *)&v90.maximum, *(double *)&v90.preferred);

  v64 = [(SBMedusaSettings *)self switcherShelfCardNonGeniePresentationSettings];
  [v64 setDefaultValues];

  v65 = [(SBMedusaSettings *)self switcherShelfCardNonGeniePresentationSettings];
  [v65 setResponse:0.475];

  v66 = [(SBMedusaSettings *)self switcherShelfCardNonGeniePresentationSettings];
  [v66 setDampingRatio:0.9];

  v67 = [(SBMedusaSettings *)self switcherShelfCardNonGeniePresentationSettings];
  CAFrameRateRange v91 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v67, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v91.minimum, *(double *)&v91.maximum, *(double *)&v91.preferred);

  v68 = [(SBMedusaSettings *)self switcherShelfCardNonGenieDismissalSettings];
  [v68 setDefaultValues];

  v69 = [(SBMedusaSettings *)self switcherShelfCardNonGenieDismissalSettings];
  [v69 setResponse:0.25];

  v70 = [(SBMedusaSettings *)self switcherShelfCardNonGenieDismissalSettings];
  [v70 setDampingRatio:0.85];

  v71 = [(SBMedusaSettings *)self switcherShelfCardNonGenieDismissalSettings];
  CAFrameRateRange v92 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v71, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v92.minimum, *(double *)&v92.maximum, *(double *)&v92.preferred);

  [(SBMedusaSettings *)self setSwitcherShelfCardNonGenieResponseIncrementScalar:0.02];
  [(SBMedusaSettings *)self setSwitcherShelfCardNonGenieDismissedScale:0.8];
  v72 = [(SBMedusaSettings *)self switcherShelfBounceIconSettings];
  [v72 setDefaultValues];

  v73 = [(SBMedusaSettings *)self switcherShelfBounceIconSettings];
  [v73 setResponse:0.5];

  v74 = [(SBMedusaSettings *)self switcherShelfBounceIconSettings];
  [v74 setDampingRatio:1.0];

  v75 = [(SBMedusaSettings *)self switcherShelfBounceIconSettings];
  CAFrameRateRange v93 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v75, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v93.minimum, *(double *)&v93.maximum, *(double *)&v93.preferred);

  [(SBMedusaSettings *)self setSwitcherShelfGenieIconBounceDelay:0.33];
}

+ (id)settingsControllerModule
{
  v437[1] = *MEMORY[0x1E4F143B8];
  v343 = [MEMORY[0x1E4F94138] rowWithTitle:@"Medusa 1.0" childSettingsKeyPath:@"medusa1oSettings"];
  v2 = (void *)MEMORY[0x1E4F94168];
  v437[0] = v343;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v437 count:1];
  v414 = [v2 sectionWithRows:v3];

  v4 = (void *)MEMORY[0x1E4F941E0];
  v5 = NSStringFromSelector(sel_switcherShelfLabelLineSpacing);
  v6 = [v4 rowWithTitle:@"Shelf Label Line Spacing" valueKeyPath:v5];
  v342 = [v6 minValue:0.0 maxValue:5.0];

  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Split View Icon Inset" valueKeyPath:@"switcherShelfSplitViewIconInset"];
  v341 = [v7 between:-10.0 and:50.0];

  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Icon Hit Test Inset" valueKeyPath:@"switcherShelfIconHitTestInset"];
  v340 = [v8 between:0.0 and:50.0];

  v9 = (void *)MEMORY[0x1E4F94168];
  v436[0] = v342;
  v436[1] = v341;
  v436[2] = v340;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v436 count:3];
  v413 = [v9 sectionWithRows:v10 title:@"Shelf Layout"];

  v412 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Genie Rope" childSettingsKeyPath:@"switcherShelfGenieRopeSettings"];
  v411 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Genie Presentation" childSettingsKeyPath:@"switcherShelfCardGeniePresentationSettings"];
  v410 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Genie Dismissal" childSettingsKeyPath:@"switcherShelfCardGenieDismissalSettings"];
  v339 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Bounce Icon" childSettingsKeyPath:@"switcherShelfBounceIconSettings"];
  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Icon Bounce Delay" valueKeyPath:@"switcherShelfGenieIconBounceDelay"];
  v338 = [v11 between:0.0 and:2.0];

  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Y Below Screen" valueKeyPath:@"switcherShelfGenieInitialYIncrementBelowScreen"];
  v337 = [v12 between:0.0 and:200.0];

  v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Gengie Response Increment" valueKeyPath:@"switcherShelfCardGenieResponseIncrementScalar"];
  v336 = [v13 between:0.0 and:1.0];

  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Dismissed Scale" valueKeyPath:@"switcherShelfCardGenieDismissedScale"];
  v335 = [v14 between:0.0 and:1.0];

  v15 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Bezier Y Delta" valueKeyPath:@"switcherShelfGenieBezierCurvePointYDeltaFromTarget"];
  v334 = [v15 between:-1000.0 and:1000.0];

  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Bezier X Exponent" valueKeyPath:@"switcherShelfGenieBezierCurveXExponent"];
  v333 = [v16 between:0.0 and:10.0];

  v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Bezier Y Exponent" valueKeyPath:@"switcherShelfGenieBezierCurveYExponent"];
  v332 = [v17 between:0.0 and:10.0];

  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Genie Bezier Scale Exponent" valueKeyPath:@"switcherShelfGenieBezierCurveScaleExponent"];
  v331 = [v18 between:0.0 and:10.0];

  v19 = (void *)MEMORY[0x1E4F94168];
  v435[0] = v412;
  v435[1] = v411;
  v435[2] = v410;
  v435[3] = v339;
  v435[4] = v338;
  v435[5] = v337;
  v435[6] = v336;
  v435[7] = v335;
  v435[8] = v334;
  v435[9] = v333;
  v435[10] = v332;
  v435[11] = v331;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v435 count:12];
  v409 = [v19 sectionWithRows:v20 title:@"Shelf Genie"];

  v330 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Non-Genie Rope" childSettingsKeyPath:@"switcherShelfNonGenieRopeSettings"];
  v329 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Non-Genie Presentation" childSettingsKeyPath:@"switcherShelfCardNonGeniePresentationSettings"];
  v328 = [MEMORY[0x1E4F94138] rowWithTitle:@"Shelf Non-Genie Dismissal" childSettingsKeyPath:@"switcherShelfCardNonGenieDismissalSettings"];
  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Non-Genie Response Increment" valueKeyPath:@"switcherShelfCardNonGenieResponseIncrementScalar"];
  v327 = [v21 between:0.0 and:1.0];

  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shelf Non-Genie Dismissed Scale" valueKeyPath:@"switcherShelfCardNonGenieDismissedScale"];
  v326 = [v22 between:0.0 and:1.0];

  v23 = (void *)MEMORY[0x1E4F94168];
  v434[0] = v330;
  v434[1] = v329;
  v434[2] = v328;
  v434[3] = v327;
  v434[4] = v326;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v434 count:5];
  v408 = [v23 sectionWithRows:v24 title:@"Shelf Non-Genie"];

  v325 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Persistent Dock" valueKeyPath:@"persistentDock"];
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Number Of Recents" valueKeyPath:@"numberOfRecents"];
  v26 = [v25 precision:0];
  v324 = [v26 between:0.0 and:3.0];

  v27 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dismiss Hit-Test Top Padding" valueKeyPath:@"dismissHitTestTopPadding"];
  v28 = [v27 precision:2];
  v323 = [v28 between:0.0 and:50.0];

  v29 = (void *)MEMORY[0x1E4F94168];
  v433[0] = v325;
  v433[1] = v324;
  v433[2] = v323;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v433 count:3];
  v407 = [v29 sectionWithRows:v30 title:@"Floating Dock Settings"];

  v31 = (void *)MEMORY[0x1E4F94168];
  v32 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Floating Dock Animation Settings"];
  v406 = [v31 submoduleWithModule:v32 childSettingsKeyPath:@"dockAnimationSettings"];

  v33 = (void *)MEMORY[0x1E4F94168];
  v34 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Floating Dock w/ Folder Animation Settings"];
  v405 = [v33 submoduleWithModule:v34 childSettingsKeyPath:@"dockWithPresentedFolderAnimationSettings"];

  v35 = (void *)MEMORY[0x1E4F94168];
  v36 = (void *)MEMORY[0x1E4F941E0];
  v37 = NSStringFromSelector(sel_narrowEdgeSwipeHitTestWidth);
  v38 = [v36 rowWithTitle:@"Narrow Edge Swipe Hit Test Width" valueKeyPath:v37];
  v39 = [v38 minValue:0.0 maxValue:1000.0];
  v432[0] = v39;
  v40 = (void *)MEMORY[0x1E4F941E0];
  v41 = NSStringFromSelector(sel_wideEdgeSwipeHitTestWidth);
  v42 = [v40 rowWithTitle:@"Wide Edge Swipe Hit Test Width" valueKeyPath:v41];
  v43 = [v42 minValue:0.0 maxValue:1000.0];
  v432[1] = v43;
  int v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v432 count:2];
  v404 = [v35 sectionWithRows:v44 title:@"Floating Application (Slide Over) Settings"];

  v402 = (void *)MEMORY[0x1E4F94168];
  char v45 = (void *)MEMORY[0x1E4F941E0];
  v399 = NSStringFromSelector(sel_rimShadowOpacity);
  v396 = [v45 rowWithTitle:@"Rim Shadow Opacity" valueKeyPath:v399];
  v393 = [v396 minValue:0.0 maxValue:100.0];
  v431[0] = v393;
  uint64_t v46 = (void *)MEMORY[0x1E4F941E0];
  v390 = NSStringFromSelector(sel_rimShadowRadius);
  v388 = [v46 rowWithTitle:@"Rim Shadow Radius" valueKeyPath:v390];
  v386 = [v388 minValue:0.0 maxValue:100.0];
  v431[1] = v386;
  double v47 = (void *)MEMORY[0x1E4F941E0];
  v384 = NSStringFromSelector(sel_floatingAppCardScaleWhileTouched);
  v382 = [v47 rowWithTitle:@"Card Scale When Touched/Dragged" valueKeyPath:v384];
  v380 = [v382 minValue:0.899999976 maxValue:1.10000002];
  v431[2] = v380;
  v48 = (void *)MEMORY[0x1E4F941E0];
  v378 = NSStringFromSelector(sel_floatingAppCardScaleWhileCursorHovered);
  v376 = [v48 rowWithTitle:@"Card Scale When Cursor Hovers" valueKeyPath:v378];
  v374 = [v376 minValue:0.899999976 maxValue:1.10000002];
  v431[3] = v374;
  v49 = (void *)MEMORY[0x1E4F94140];
  v372 = NSStringFromSelector(sel_floatingAppCardScaleWhileCursorHovered);
  v370 = [v49 rowWithTitle:&stru_1F3084718 valueKeyPath:v372];
  v368 = [v370 precision:4];
  v366 = [v368 between:0.899999976 and:1.10000002];
  v431[4] = v366;
  v50 = (void *)MEMORY[0x1E4F941E0];
  v364 = NSStringFromSelector(sel_diffuseShadowRadius);
  v362 = [v50 rowWithTitle:@"Diffuse Shadow Radius" valueKeyPath:v364];
  v360 = [v362 minValue:0.0 maxValue:1000.0];
  v431[5] = v360;
  v51 = (void *)MEMORY[0x1E4F941E0];
  v52 = NSStringFromSelector(sel_diffuseShadowOpacity);
  v53 = [v51 rowWithTitle:@"Diffuse Shadow Opacity" valueKeyPath:v52];
  v54 = [v53 minValue:0.0 maxValue:100.0];
  v431[6] = v54;
  v55 = (void *)MEMORY[0x1E4F941E0];
  v56 = NSStringFromSelector(sel_diffuseShadowOffsetHorizontal);
  v57 = [v55 rowWithTitle:@"Diffuse Shadow Offset Horizontal" valueKeyPath:v56];
  v58 = [v57 minValue:0.0 maxValue:100.0];
  v431[7] = v58;
  v59 = (void *)MEMORY[0x1E4F941E0];
  v60 = NSStringFromSelector(sel_diffuseShadowOffsetVertical);
  v61 = [v59 rowWithTitle:@"Diffuse Shadow Offset Vertical" valueKeyPath:v60];
  v62 = [v61 minValue:0.0 maxValue:100.0];
  v431[8] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v431 count:9];
  v403 = [v402 sectionWithRows:v63 title:@"Floating App Shadow Settings"];

  v400 = (void *)MEMORY[0x1E4F94168];
  v64 = (void *)MEMORY[0x1E4F941E0];
  v397 = NSStringFromSelector(sel_diffuseShadowRadiusWhileTouched);
  v394 = [v64 rowWithTitle:@"Diffuse Shadow Radius While Touched" valueKeyPath:v397];
  v391 = [v394 minValue:0.0 maxValue:100.0];
  v430[0] = v391;
  v65 = (void *)MEMORY[0x1E4F941E0];
  v66 = NSStringFromSelector(sel_diffuseShadowOpacityWhileTouched);
  v67 = [v65 rowWithTitle:@"Diffuse Shadow Opacity While Touched" valueKeyPath:v66];
  v68 = [v67 minValue:0.0 maxValue:1.0];
  v430[1] = v68;
  v69 = (void *)MEMORY[0x1E4F941E0];
  v70 = NSStringFromSelector(sel_diffuseShadowOffsetHorizontalWhileTouched);
  v71 = [v69 rowWithTitle:@"Diffuse Shadow Offset Horizontal While Touched" valueKeyPath:v70];
  v72 = [v71 minValue:0.0 maxValue:50.0];
  v430[2] = v72;
  v73 = (void *)MEMORY[0x1E4F941E0];
  v74 = NSStringFromSelector(sel_diffuseShadowOffsetVerticalWhileTouched);
  v75 = [v73 rowWithTitle:@"Diffuse Shadow Offset Vertical While Touched" valueKeyPath:v74];
  v76 = [v75 minValue:0.0 maxValue:50.0];
  v430[3] = v76;
  CAFrameRateRange v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v430 count:4];
  v401 = [v400 sectionWithRows:v77 title:@"Floating App Shadow Settings While Touched"];

  CAFrameRateRange v78 = (void *)MEMORY[0x1E4F941E0];
  CAFrameRateRange v79 = NSStringFromSelector(sel_coronaDiffuseShadowOpacity);
  CAFrameRateRange v80 = [v78 rowWithTitle:@"Corona Diffuse Shadow Opacity" valueKeyPath:v79];
  v398 = [v80 minValue:0.0 maxValue:1.0];

  CAFrameRateRange v81 = (void *)MEMORY[0x1E4F941E0];
  CAFrameRateRange v82 = NSStringFromSelector(sel_coronaDiffuseShadowOpacityWhileTouched);
  CAFrameRateRange v83 = [v81 rowWithTitle:@"Corona Diffuse Shadow Opacity While Touched" valueKeyPath:v82];
  v395 = [v83 minValue:0.0 maxValue:1.0];

  CAFrameRateRange v84 = [MEMORY[0x1E4F94140] rowWithTitle:@"Corona Rim Shadow Opacity" valueKeyPath:@"coronaRimShadowOpacity"];
  CAFrameRateRange v85 = [v84 precision:2];
  v392 = [v85 between:0.0 and:100.0];

  CAFrameRateRange v86 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m11" valueKeyPath:@"vibrantColorMatrixM11"];
  CAFrameRateRange v87 = [v86 precision:3];
  v389 = [v87 between:-1.0 and:1.0];

  CAFrameRateRange v88 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m12" valueKeyPath:@"vibrantColorMatrixM12"];
  CAFrameRateRange v89 = [v88 precision:3];
  v387 = [v89 between:-1.0 and:1.0];

  CAFrameRateRange v90 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m13" valueKeyPath:@"vibrantColorMatrixM13"];
  CAFrameRateRange v91 = [v90 precision:3];
  v385 = [v91 between:-1.0 and:1.0];

  CAFrameRateRange v92 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m14" valueKeyPath:@"vibrantColorMatrixM14"];
  CAFrameRateRange v93 = [v92 precision:3];
  v383 = [v93 between:-1.0 and:1.0];

  v94 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m15" valueKeyPath:@"vibrantColorMatrixM15"];
  v95 = [v94 precision:3];
  v381 = [v95 between:-1.0 and:1.0];

  v96 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m21" valueKeyPath:@"vibrantColorMatrixM21"];
  v97 = [v96 precision:3];
  v379 = [v97 between:-1.0 and:1.0];

  v98 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m22" valueKeyPath:@"vibrantColorMatrixM22"];
  v99 = [v98 precision:3];
  v377 = [v99 between:-1.0 and:1.0];

  v100 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m23" valueKeyPath:@"vibrantColorMatrixM23"];
  v101 = [v100 precision:3];
  v375 = [v101 between:-1.0 and:1.0];

  v102 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m24" valueKeyPath:@"vibrantColorMatrixM24"];
  v103 = [v102 precision:3];
  v373 = [v103 between:-1.0 and:1.0];

  v104 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m25" valueKeyPath:@"vibrantColorMatrixM25"];
  v105 = [v104 precision:3];
  v371 = [v105 between:-1.0 and:1.0];

  v106 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m31" valueKeyPath:@"vibrantColorMatrixM31"];
  v107 = [v106 precision:3];
  v369 = [v107 between:-1.0 and:1.0];

  v108 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m32" valueKeyPath:@"vibrantColorMatrixM32"];
  v109 = [v108 precision:3];
  v367 = [v109 between:-1.0 and:1.0];

  v110 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m33" valueKeyPath:@"vibrantColorMatrixM33"];
  v111 = [v110 precision:3];
  v365 = [v111 between:-1.0 and:1.0];

  v112 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m34" valueKeyPath:@"vibrantColorMatrixM34"];
  v113 = [v112 precision:3];
  v322 = [v113 between:-1.0 and:1.0];

  v114 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m35" valueKeyPath:@"vibrantColorMatrixM35"];
  v115 = [v114 precision:3];
  v321 = [v115 between:-1.0 and:1.0];

  v116 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m41" valueKeyPath:@"vibrantColorMatrixM41"];
  v117 = [v116 precision:3];
  v320 = [v117 between:-1.0 and:1.0];

  v118 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m42" valueKeyPath:@"vibrantColorMatrixM42"];
  v119 = [v118 precision:3];
  v319 = [v119 between:-1.0 and:1.0];

  v120 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m43" valueKeyPath:@"vibrantColorMatrixM43"];
  v121 = [v120 precision:3];
  v318 = [v121 between:-1.0 and:1.0];

  v122 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m44" valueKeyPath:@"vibrantColorMatrixM44"];
  v123 = [v122 precision:3];
  v317 = [v123 between:-1.0 and:1.0];

  v124 = [MEMORY[0x1E4F94140] rowWithTitle:@"vibrantColorMatrix m45" valueKeyPath:@"vibrantColorMatrixM45"];
  v125 = [v124 precision:3];
  v316 = [v125 between:-1.0 and:1.0];

  v126 = (void *)MEMORY[0x1E4F94168];
  v429[0] = v398;
  v429[1] = v395;
  v429[2] = v392;
  v429[3] = v389;
  v429[4] = v387;
  v429[5] = v385;
  v429[6] = v383;
  v429[7] = v381;
  v429[8] = v379;
  v429[9] = v377;
  v429[10] = v375;
  v429[11] = v373;
  v429[12] = v371;
  v429[13] = v369;
  v429[14] = v367;
  v429[15] = v365;
  v429[16] = v322;
  v429[17] = v321;
  v429[18] = v320;
  v429[19] = v319;
  v429[20] = v318;
  v429[21] = v317;
  v429[22] = v316;
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v429 count:23];
  v363 = [v126 sectionWithRows:v127 title:@"Corona Floating Application Shadow Settings"];

  v315 = [MEMORY[0x1E4F94138] rowWithTitle:@"Window Drag Animation Settings" childSettingsKeyPath:@"windowDragAnimationSettings"];
  v314 = [MEMORY[0x1E4F94138] rowWithTitle:@"Medusa Animation Settings" childSettingsKeyPath:@"medusaAnimationSettings"];
  v313 = [MEMORY[0x1E4F94138] rowWithTitle:@"Resize Animation Settings" childSettingsKeyPath:@"resizeAnimationSettings"];
  v312 = [MEMORY[0x1E4F94138] rowWithTitle:@"Platter Animation Settings" childSettingsKeyPath:@"platterAnimationSettings"];
  v311 = [MEMORY[0x1E4F94138] rowWithTitle:@"Drop Animation Settings" childSettingsKeyPath:@"dropAnimationSettings"];
  v310 = [MEMORY[0x1E4F94138] rowWithTitle:@"Switcher Card Drop Animation Settings" childSettingsKeyPath:@"switcherCardDropAnimationSettings"];
  v309 = [MEMORY[0x1E4F94138] rowWithTitle:@"Top Affordance Expansion Settings" childSettingsKeyPath:@"topAffordanceExpandAnimationSettings"];
  v308 = [MEMORY[0x1E4F94138] rowWithTitle:@"Top Affordance Collapse Settings" childSettingsKeyPath:@"topAffordanceCollapseAnimationSettings"];
  v128 = (void *)MEMORY[0x1E4F94168];
  v428[0] = v315;
  v428[1] = v314;
  v428[2] = v313;
  v428[3] = v312;
  v428[4] = v311;
  v428[5] = v310;
  v428[6] = v309;
  v428[7] = v308;
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v428 count:8];
  v361 = [v128 sectionWithRows:v129 title:@"Animation Settings"];

  v130 = [MEMORY[0x1E4F94140] rowWithTitle:@"Blur Fade Animation Duration" valueKeyPath:@"blurFadeAnimationDuration"];
  v131 = [v130 precision:2];
  v359 = [v131 between:0.0 and:100.0];

  v132 = [MEMORY[0x1E4F94140] rowWithTitle:@"Reduce Motion Blur Fade Animation Duration" valueKeyPath:@"reduceMotionBlurFadeAnimationDuration"];
  v133 = [v132 precision:2];
  v358 = [v133 between:0.0 and:100.0];

  v134 = [MEMORY[0x1E4F94140] rowWithTitle:@"Drop Animation Unblur Threshold Percentage" valueKeyPath:@"dropAnimationUnblurThresholdPercentage"];
  v135 = [v134 precision:2];
  v357 = [v135 between:0.0 and:1.0];

  v136 = [MEMORY[0x1E4F94140] rowWithTitle:@"Resize Animation Unblur Threshold Percentage" valueKeyPath:@"resizeAnimationUnblurThresholdPercentage"];
  v137 = [v136 precision:2];
  v356 = [v137 between:0.0 and:1.0];

  v138 = [MEMORY[0x1E4F94140] rowWithTitle:@"Move Pan Gesture Threshold Percentage" valueKeyPath:@"movePanGestureThresholdPercentage"];
  v139 = [v138 precision:2];
  v307 = [v139 between:0.0 and:1.0];

  v140 = [MEMORY[0x1E4F94140] rowWithTitle:@"Move Pan Gesture Positive Velocity Threshold" valueKeyPath:@"movePanGesturePositiveVelocityThreshold"];
  v141 = [v140 precision:5];
  v306 = [v141 between:0.0 and:10000.0];

  v142 = [MEMORY[0x1E4F94140] rowWithTitle:@"Move Pan Gesture Negative Velocity Threshold" valueKeyPath:@"movePanGestureNegativeVelocityThreshold"];
  v143 = [v142 precision:5];
  v305 = [v143 between:-10000.0 and:0.0];

  v144 = [MEMORY[0x1E4F94140] rowWithTitle:@"Top Affordance Hit Test Extend Top" valueKeyPath:@"topAffordanceHitTestExtendTop"];
  v145 = [v144 precision:0];
  v304 = [v145 between:0.0 and:100.0];

  v146 = [MEMORY[0x1E4F94140] rowWithTitle:@"Top Affordance Hit Test Extend Bottom" valueKeyPath:@"topAffordanceHitTestExtendBottom"];
  v147 = [v146 precision:0];
  v303 = [v147 between:0.0 and:100.0];

  v148 = [MEMORY[0x1E4F94140] rowWithTitle:@"Top Affordance Hit Test Extend Left" valueKeyPath:@"topAffordanceHitTestExtendLeft"];
  v149 = [v148 precision:0];
  v302 = [v149 between:0.0 and:100.0];

  v150 = [MEMORY[0x1E4F94140] rowWithTitle:@"Top Affordance Hit Test Extend Right" valueKeyPath:@"topAffordanceHitTestExtendRight"];
  v151 = [v150 precision:0];
  v301 = [v151 between:0.0 and:100.0];

  v152 = (void *)MEMORY[0x1E4F94168];
  v427[0] = v359;
  v427[1] = v358;
  v427[2] = v357;
  v427[3] = v356;
  v427[4] = v307;
  v427[5] = v306;
  v427[6] = v305;
  v427[7] = v304;
  v427[8] = v303;
  v427[9] = v302;
  v427[10] = v301;
  v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v427 count:11];
  v355 = [v152 sectionWithRows:v153 title:@"Medusa User Interaction Settings"];

  v154 = [MEMORY[0x1E4F94140] rowWithTitle:@"Icon Platter Scale" valueKeyPath:@"iconPlatterScale"];
  v155 = [v154 precision:3];
  v354 = [v155 between:0.0 and:1.0];

  v156 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Platter Scale" valueKeyPath:@"windowPlatterScale"];
  v157 = [v156 precision:3];
  v353 = [v157 between:0.0 and:1.0];

  v158 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Platter Scale For Replacing Entire Space" valueKeyPath:@"windowPlatterScaleForReplacingEntireSpace"];
  v159 = [v158 precision:3];
  v352 = [v159 between:0.0 and:1.0];

  v160 = [MEMORY[0x1E4F94140] rowWithTitle:@"Card Platter Scale" valueKeyPath:@"cardPlatterScale"];
  v161 = [v160 precision:3];
  v351 = [v161 between:0.0 and:1.0];

  v162 = [MEMORY[0x1E4F94140] rowWithTitle:@"Floating Card Platter Scale" valueKeyPath:@"floatingCardPlatterScale"];
  v163 = [v162 precision:3];
  v300 = [v163 between:0.0 and:1.0];

  v164 = [MEMORY[0x1E4F94140] rowWithTitle:@"Slide Over Tongue Expanded Scale" valueKeyPath:@"slideOverTongueExpandedScale"];
  v165 = [v164 precision:3];
  v299 = [v165 between:0.0 and:1.0];

  v166 = [MEMORY[0x1E4F94140] rowWithTitle:@"Card Drag Over Split App Layout Scale" valueKeyPath:@"cardPlatterScale"];
  v167 = [v166 precision:3];
  v298 = [v167 between:0.0 and:1.0];

  v168 = [MEMORY[0x1E4F94140] rowWithTitle:@"Reflow Animation Progress for Card Header Fade-In" valueKeyPath:@"reflowAnimationProgressForCardHeaderFadeIn"];
  v169 = [v168 precision:3];
  v297 = [v169 between:0.0 and:1.0];

  v170 = [MEMORY[0x1E4F94140] rowWithTitle:@"Platter Side Activation Padding" valueKeyPath:@"draggingPlatterSideActivationGutterPadding"];
  v171 = [v170 precision:3];
  v296 = [v171 between:0.0 and:500.0];

  v172 = [MEMORY[0x1E4F94140] rowWithTitle:@"Platter Fullscreen Activation Region Width" valueKeyPath:@"draggingPlatterFullscreenActivationRegionWidth"];
  v173 = [v172 precision:3];
  v295 = [v173 between:0.0 and:500.0];

  v174 = [MEMORY[0x1E4F94140] rowWithTitle:@"Platter Fullscreen Activation Region Height" valueKeyPath:@"draggingPlatterFullscreenActivationRegionHeight"];
  v175 = [v174 precision:3];
  v294 = [v175 between:0.0 and:500.0];

  v176 = (void *)MEMORY[0x1E4F94168];
  v426[0] = v354;
  v426[1] = v353;
  v426[2] = v352;
  v426[3] = v351;
  v426[4] = v300;
  v426[5] = v299;
  v426[6] = v298;
  v426[7] = v297;
  v426[8] = v296;
  v426[9] = v295;
  v426[10] = v294;
  v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v426 count:11];
  v350 = [v176 sectionWithRows:v177 title:@"Medusa Dragging Platter Sizes"];

  v348 = (void *)MEMORY[0x1E4F94168];
  v178 = (void *)MEMORY[0x1E4F94140];
  v346 = NSStringFromSelector(sel_switcherFullScreenContentPushInScale);
  v344 = [v178 rowWithTitle:@"Full Screen Content Push In Scale" valueKeyPath:v346];
  v292 = [v344 precision:2];
  v290 = [v292 between:0.0 and:1.0];
  v425[0] = v290;
  v179 = (void *)MEMORY[0x1E4F94140];
  v288 = NSStringFromSelector(sel_switcherCenterWindowContentPushInScale);
  v286 = [v179 rowWithTitle:@"Center Window Content Push In Scale" valueKeyPath:v288];
  v284 = [v286 precision:2];
  v180 = [v284 between:0.0 and:1.0];
  v425[1] = v180;
  v181 = (void *)MEMORY[0x1E4F94140];
  v182 = NSStringFromSelector(sel_switcherSlideOverContentPushInScale);
  v183 = [v181 rowWithTitle:@"Slide Over Content Push In Scale" valueKeyPath:v182];
  v184 = [v183 precision:2];
  v185 = [v184 between:0.0 and:1.0];
  v425[2] = v185;
  v186 = (void *)MEMORY[0x1E4F94140];
  v187 = NSStringFromSelector(sel_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor);
  v188 = [v186 rowWithTitle:@"Slide Over Dosido Layout Overshoot Multiplication Factor" valueKeyPath:v187];
  v189 = [v188 precision:2];
  v190 = [v189 between:0.0 and:5.0];
  v425[3] = v190;
  v191 = [MEMORY[0x1E4F1C978] arrayWithObjects:v425 count:4];
  v349 = [v348 sectionWithRows:v191 title:@"Medusa Replacement Animations"];

  v192 = [MEMORY[0x1E4F94140] rowWithTitle:@"Content Drag Commandeer Inset for Universal Control" valueKeyPath:@"contentDraggingCommandeerGutterInsetForUniversalControl"];
  v193 = [v192 precision:3];
  v293 = [v193 between:0.0 and:500.0];

  v194 = [MEMORY[0x1E4F94140] rowWithTitle:@"Content Drag Commandeer Gutter" valueKeyPath:@"contentDraggingCommandeerGutterWidth"];
  v195 = [v194 precision:3];
  v291 = [v195 between:0.0 and:500.0];

  v196 = [MEMORY[0x1E4F94140] rowWithTitle:@"Content Drag Side Activation Gutter" valueKeyPath:@"contentDraggingSideActivationGutterWidth"];
  v197 = [v196 precision:3];
  v289 = [v197 between:0.0 and:500.0];

  v198 = [MEMORY[0x1E4F94140] rowWithTitle:@"Content Drag Floating Activation Gutter" valueKeyPath:@"contentDraggingFloatingActivationGutterWidth"];
  v199 = [v198 precision:3];
  v287 = [v199 between:0.0 and:500.0];

  v200 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Tear-Off Drag Side Activation Gutter" valueKeyPath:@"windowTearOffDraggingSideActivationGutterWidth"];
  v201 = [v200 precision:3];
  v285 = [v201 between:0.0 and:500.0];

  v202 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Tear-Off Drag Floating Activation Gutter" valueKeyPath:@"windowTearOffDraggingFloatingActivationGutterWidth"];
  v203 = [v202 precision:3];
  v283 = [v203 between:0.0 and:500.0];

  v204 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Split View Dismissal Gutter Width" valueKeyPath:@"windowSplitViewDismissalGutterWidth"];
  v205 = [v204 precision:3];
  v282 = [v205 between:0.0 and:500.0];

  v206 = (void *)MEMORY[0x1E4F94168];
  v424[0] = v293;
  v424[1] = v291;
  v424[2] = v289;
  v424[3] = v287;
  v424[4] = v285;
  v424[5] = v283;
  v424[6] = v282;
  v207 = [MEMORY[0x1E4F1C978] arrayWithObjects:v424 count:7];
  v347 = [v206 sectionWithRows:v207 title:@"Medusa Multi-Window Settings"];

  v208 = [MEMORY[0x1E4F94140] rowWithTitle:@"Separator Cursor Top Edge Inset" valueKeyPath:@"medusaSeparatorCursorTopEdgeInset"];
  v209 = [v208 precision:1];
  v281 = [v209 between:0.0 and:10.0];

  v210 = [MEMORY[0x1E4F94140] rowWithTitle:@"Separator Cursor Bottom Edge Inset" valueKeyPath:@"medusaSeparatorCursorBottomEdgeInset"];
  v211 = [v210 precision:1];
  v280 = [v211 between:0.0 and:10.0];

  v212 = [MEMORY[0x1E4F94140] rowWithTitle:@"Separator Cursor Left Edge Inset" valueKeyPath:@"medusaSeparatorCursorLeftEdgeInset"];
  v213 = [v212 precision:1];
  v279 = [v213 between:0.0 and:10.0];

  v214 = [MEMORY[0x1E4F94140] rowWithTitle:@"Separator Cursor Right Edge Inset" valueKeyPath:@"medusaSeparatorCursorRightEdgeInset"];
  v215 = [v214 precision:1];
  v278 = [v215 between:0.0 and:10.0];

  v216 = (void *)MEMORY[0x1E4F94168];
  v423[0] = v281;
  v423[1] = v279;
  v423[2] = v280;
  v423[3] = v278;
  v217 = [MEMORY[0x1E4F1C978] arrayWithObjects:v423 count:4];
  v345 = [v216 sectionWithRows:v217 title:@"Medusa Separator Cursor Insets"];

  v277 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Content Drag Exclusion Rects" valueKeyPath:@"showContentDragExclusionRects"];
  v218 = (void *)MEMORY[0x1E4F94168];
  v422 = v277;
  v219 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v422 count:1];
  v276 = [v218 sectionWithRows:v219 title:@"Drag and Drop Debugging Aids"];

  v220 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Dragging Cursor Top Edge Inset" valueKeyPath:@"medusaWindowDraggingCursorTopEdgeInset"];
  v221 = [v220 precision:1];
  v275 = [v221 between:0.0 and:10.0];

  v222 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Dragging Cursor Bottom Edge Inset" valueKeyPath:@"medusaWindowDraggingCursorBottomEdgeInset"];
  v223 = [v222 precision:1];
  v274 = [v223 between:0.0 and:10.0];

  v224 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Dragging Cursor Left Edge Inset" valueKeyPath:@"medusaWindowDraggingCursorLeftEdgeInset"];
  v225 = [v224 precision:1];
  v273 = [v225 between:0.0 and:10.0];

  v226 = [MEMORY[0x1E4F94140] rowWithTitle:@"Window Dragging Cursor Right Edge Inset" valueKeyPath:@"medusaWindowDraggingCursorRightEdgeInset"];
  v227 = [v226 precision:1];
  v272 = [v227 between:0.0 and:10.0];

  v228 = (void *)MEMORY[0x1E4F94168];
  v421[0] = v275;
  v421[1] = v273;
  v421[2] = v274;
  v421[3] = v272;
  v229 = [MEMORY[0x1E4F1C978] arrayWithObjects:v421 count:4];
  v271 = [v228 sectionWithRows:v229 title:@"Medusa Window Dragging Cursor Insets"];

  v230 = [MEMORY[0x1E4F94140] rowWithTitle:@"App Inner Corners" valueKeyPath:@"cornerRadiusForInnerCorners"];
  v231 = [v230 precision:3];
  v270 = [v231 between:0.0 and:100.0];

  v232 = [MEMORY[0x1E4F94140] rowWithTitle:@"Medusa Compatibility App Corners" valueKeyPath:@"cornerRadiusForCompatibilityAppOuterCorners"];
  v233 = [v232 precision:3];
  v269 = [v233 between:0.0 and:100.0];

  v234 = [MEMORY[0x1E4F94140] rowWithTitle:@"Floating App Corners" valueKeyPath:@"cornerRadiusForFloatingApps"];
  v235 = [v234 precision:3];
  v268 = [v235 between:0.0 and:100.0];

  v236 = [MEMORY[0x1E4F94140] rowWithTitle:@"Fallback for old apps" valueKeyPath:@"cornerRadiusFallbackForOldApps"];
  v237 = [v236 precision:3];
  v267 = [v237 between:0.0 and:100.0];

  v238 = (void *)MEMORY[0x1E4F94168];
  v420[0] = v270;
  v420[1] = v269;
  v420[2] = v268;
  v420[3] = v267;
  v239 = [MEMORY[0x1E4F1C978] arrayWithObjects:v420 count:4];
  v265 = [v238 sectionWithRows:v239 title:@"Medusa Corner Radii"];

  v240 = (void *)MEMORY[0x1E4F941E0];
  v241 = NSStringFromSelector(sel_leadingSlideOverRelocationDelay);
  v242 = [v240 rowWithTitle:@"Leading Slide Over Teleportation Delay" valueKeyPath:v241];
  v266 = [v242 minValue:0.0 maxValue:0.5];

  v243 = (void *)MEMORY[0x1E4F94168];
  v419 = v266;
  v244 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v419 count:1];
  v245 = [v243 sectionWithRows:v244 title:@"Slide Over"];

  v264 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Debug Background Colors" valueKeyPath:@"statusBarDebugBackgroundColorsEnabled"];
  v263 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Debug Offset for App Status Bar" valueKeyPath:@"statusBarDebugOffsettingEnabled"];
  v246 = (void *)MEMORY[0x1E4F94168];
  v418[0] = v264;
  v418[1] = v263;
  v247 = [MEMORY[0x1E4F1C978] arrayWithObjects:v418 count:2];
  v261 = [v246 sectionWithRows:v247 title:@"Status Bar Settings"];

  v262 = [MEMORY[0x1E4F94100] rowWithTitle:@"Kill SpringBoard" outletKeyPath:@"killSpringBoardOutlet"];
  v248 = (void *)MEMORY[0x1E4F94168];
  v417 = v262;
  v249 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v417 count:1];
  v250 = [v248 sectionWithRows:v249];

  v251 = (void *)MEMORY[0x1E4F94100];
  v252 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v253 = [v251 rowWithTitle:@"Restore Defaults" action:v252];

  v254 = (void *)MEMORY[0x1E4F94168];
  v416 = v253;
  v255 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v416 count:1];
  v256 = [v254 sectionWithRows:v255];

  v257 = (void *)MEMORY[0x1E4F94168];
  v415[0] = v413;
  v415[1] = v409;
  v415[2] = v408;
  v415[3] = v414;
  v415[4] = v407;
  v415[5] = v406;
  v415[6] = v405;
  v415[7] = v404;
  v415[8] = v403;
  v415[9] = v401;
  v415[10] = v363;
  v415[11] = v361;
  v415[12] = v355;
  v415[13] = v350;
  v415[14] = v349;
  v415[15] = v347;
  v415[16] = v345;
  v415[17] = v276;
  v415[18] = v271;
  v415[19] = v265;
  v415[20] = v245;
  v415[21] = v261;
  v415[22] = v250;
  v415[23] = v256;
  v258 = [MEMORY[0x1E4F1C978] arrayWithObjects:v415 count:24];
  v259 = [v257 moduleWithTitle:@"Medusa" contents:v258];

  return v259;
}

- (CAColorMatrix)coronaVibrantColorMatrixInput
{
  float v3 = *(double *)&self[11].var4;
  float v4 = *(double *)&self[11].var6;
  retstr->var0 = v3;
  retstr->var1 = v4;
  float v5 = *(double *)&self[11].var8;
  float v6 = *(double *)&self[11].var10;
  retstr->var2 = v5;
  retstr->var3 = v6;
  float v7 = *(double *)&self[11].var12;
  float v8 = *(double *)&self[11].var14;
  retstr->var4 = v7;
  retstr->var5 = v8;
  float v9 = *(double *)&self[11].var16;
  float v10 = *(double *)&self[11].var18;
  retstr->var6 = v9;
  retstr->var7 = v10;
  float v11 = *(double *)&self[12].var0;
  float v12 = *(double *)&self[12].var2;
  retstr->var8 = v11;
  retstr->var9 = v12;
  float v13 = *(double *)&self[12].var4;
  float v14 = *(double *)&self[12].var6;
  retstr->var10 = v13;
  retstr->var11 = v14;
  float v15 = *(double *)&self[12].var8;
  float v16 = *(double *)&self[12].var10;
  retstr->var12 = v15;
  retstr->var13 = v16;
  float v17 = *(double *)&self[12].var12;
  float v18 = *(double *)&self[12].var14;
  retstr->var14 = v17;
  retstr->var15 = v18;
  float v19 = *(double *)&self[12].var16;
  float v20 = *(double *)&self[12].var18;
  retstr->var16 = v19;
  retstr->var17 = v20;
  float v21 = *(double *)&self[13].var0;
  float v22 = *(double *)&self[13].var2;
  retstr->var18 = v21;
  retstr->var19 = v22;
  return self;
}

- (double)effectiveBlurFadeAnimationDuration
{
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    [(SBMedusaSettings *)self reduceMotionBlurFadeAnimationDuration];
  }
  else
  {
    [(SBMedusaSettings *)self blurFadeAnimationDuration];
  }
  return result;
}

- (UIEdgeInsets)medusaSeparatorCursorEdgeInsets
{
  double medusaSeparatorCursorTopEdgeInset = self->_medusaSeparatorCursorTopEdgeInset;
  double medusaSeparatorCursorLeftEdgeInset = self->_medusaSeparatorCursorLeftEdgeInset;
  double medusaSeparatorCursorBottomEdgeInset = self->_medusaSeparatorCursorBottomEdgeInset;
  double medusaSeparatorCursorRightEdgeInset = self->_medusaSeparatorCursorRightEdgeInset;
  result.right = medusaSeparatorCursorRightEdgeInset;
  result.bottom = medusaSeparatorCursorBottomEdgeInset;
  result.left = medusaSeparatorCursorLeftEdgeInset;
  result.top = medusaSeparatorCursorTopEdgeInset;
  return result;
}

- (UIEdgeInsets)medusaWindowDraggingCursorEdgeInsets
{
  double medusaWindowDraggingCursorTopEdgeInset = self->_medusaWindowDraggingCursorTopEdgeInset;
  double medusaWindowDraggingCursorLeftEdgeInset = self->_medusaWindowDraggingCursorLeftEdgeInset;
  double medusaWindowDraggingCursorBottomEdgeInset = self->_medusaWindowDraggingCursorBottomEdgeInset;
  double medusaWindowDraggingCursorRightEdgeInset = self->_medusaWindowDraggingCursorRightEdgeInset;
  result.right = medusaWindowDraggingCursorRightEdgeInset;
  result.bottom = medusaWindowDraggingCursorBottomEdgeInset;
  result.left = medusaWindowDraggingCursorLeftEdgeInset;
  result.top = medusaWindowDraggingCursorTopEdgeInset;
  return result;
}

- (SBMedusa1oSettings)medusa1oSettings
{
  return self->_medusa1oSettings;
}

- (void)setMedusa1oSettings:(id)a3
{
}

- (BOOL)persistentDock
{
  return self->_persistentDock;
}

- (void)setPersistentDock:(BOOL)a3
{
  self->_persistentDock = a3;
}

- (double)numberOfRecents
{
  return self->_numberOfRecents;
}

- (void)setNumberOfRecents:(double)a3
{
  self->_numberOfRecents = a3;
}

- (double)dismissHitTestTopPadding
{
  return self->_dismissHitTestTopPadding;
}

- (void)setDismissHitTestTopPadding:(double)a3
{
  self->_dismissHitTestTopPadding = a3;
}

- (SBFFluidBehaviorSettings)dockAnimationSettings
{
  return self->_dockAnimationSettings;
}

- (void)setDockAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dockWithPresentedFolderAnimationSettings
{
  return self->_dockWithPresentedFolderAnimationSettings;
}

- (void)setDockWithPresentedFolderAnimationSettings:(id)a3
{
}

- (double)narrowEdgeSwipeHitTestWidth
{
  return self->_narrowEdgeSwipeHitTestWidth;
}

- (void)setNarrowEdgeSwipeHitTestWidth:(double)a3
{
  self->_narrowEdgeSwipeHitTestWidth = a3;
}

- (double)wideEdgeSwipeHitTestWidth
{
  return self->_wideEdgeSwipeHitTestWidth;
}

- (void)setWideEdgeSwipeHitTestWidth:(double)a3
{
  self->_wideEdgeSwipeHitTestWidth = a3;
}

- (double)rimShadowOpacity
{
  return self->_rimShadowOpacity;
}

- (void)setRimShadowOpacity:(double)a3
{
  self->_rimShadowOpacity = a3;
}

- (double)rimShadowRadius
{
  return self->_rimShadowRadius;
}

- (void)setRimShadowRadius:(double)a3
{
  self->_rimShadowRadius = a3;
}

- (double)floatingAppCardScaleWhileTouched
{
  return self->_floatingAppCardScaleWhileTouched;
}

- (void)setFloatingAppCardScaleWhileTouched:(double)a3
{
  self->_floatingAppCardScaleWhileTouched = a3;
}

- (double)floatingAppCardScaleWhileCursorHovered
{
  return self->_floatingAppCardScaleWhileCursorHovered;
}

- (void)setFloatingAppCardScaleWhileCursorHovered:(double)a3
{
  self->_floatingAppCardScaleWhileCursorHovered = a3;
}

- (double)diffuseShadowRadius
{
  return self->_diffuseShadowRadius;
}

- (void)setDiffuseShadowRadius:(double)a3
{
  self->_diffuseShadowRadius = a3;
}

- (double)diffuseShadowOpacity
{
  return self->_diffuseShadowOpacity;
}

- (void)setDiffuseShadowOpacity:(double)a3
{
  self->_diffuseShadowOpacity = a3;
}

- (double)diffuseShadowOffsetHorizontal
{
  return self->_diffuseShadowOffsetHorizontal;
}

- (void)setDiffuseShadowOffsetHorizontal:(double)a3
{
  self->_diffuseShadowOffsetHorizontal = a3;
}

- (double)diffuseShadowOffsetVertical
{
  return self->_diffuseShadowOffsetVertical;
}

- (void)setDiffuseShadowOffsetVertical:(double)a3
{
  self->_diffuseShadowOffsetVertical = a3;
}

- (double)diffuseShadowRadiusWhileTouched
{
  return self->_diffuseShadowRadiusWhileTouched;
}

- (void)setDiffuseShadowRadiusWhileTouched:(double)a3
{
  self->_diffuseShadowRadiusWhileTouched = a3;
}

- (double)diffuseShadowOpacityWhileTouched
{
  return self->_diffuseShadowOpacityWhileTouched;
}

- (void)setDiffuseShadowOpacityWhileTouched:(double)a3
{
  self->_diffuseShadowOpacityWhileTouched = a3;
}

- (double)diffuseShadowOffsetHorizontalWhileTouched
{
  return self->_diffuseShadowOffsetHorizontalWhileTouched;
}

- (void)setDiffuseShadowOffsetHorizontalWhileTouched:(double)a3
{
  self->_diffuseShadowOffsetHorizontalWhileTouched = a3;
}

- (double)diffuseShadowOffsetVerticalWhileTouched
{
  return self->_diffuseShadowOffsetVerticalWhileTouched;
}

- (void)setDiffuseShadowOffsetVerticalWhileTouched:(double)a3
{
  self->_diffuseShadowOffsetVerticalWhileTouched = a3;
}

- (double)coronaDiffuseShadowOpacity
{
  return self->_coronaDiffuseShadowOpacity;
}

- (void)setCoronaDiffuseShadowOpacity:(double)a3
{
  self->_coronaDiffuseShadowOpacity = a3;
}

- (double)coronaDiffuseShadowOpacityWhileTouched
{
  return self->_coronaDiffuseShadowOpacityWhileTouched;
}

- (void)setCoronaDiffuseShadowOpacityWhileTouched:(double)a3
{
  self->_coronaDiffuseShadowOpacityWhileTouched = a3;
}

- (double)coronaRimShadowOpacity
{
  return self->_coronaRimShadowOpacity;
}

- (void)setCoronaRimShadowOpacity:(double)a3
{
  self->_coronaRimShadowOpacity = a3;
}

- (double)blurFadeAnimationDuration
{
  return self->_blurFadeAnimationDuration;
}

- (void)setBlurFadeAnimationDuration:(double)a3
{
  self->_blurFadeAnimationDuration = a3;
}

- (double)reduceMotionBlurFadeAnimationDuration
{
  return self->_reduceMotionBlurFadeAnimationDuration;
}

- (void)setReduceMotionBlurFadeAnimationDuration:(double)a3
{
  self->_reduceMotionBlurFadeAnimationDuration = a3;
}

- (SBFFluidBehaviorSettings)windowDragAnimationSettings
{
  return self->_windowDragAnimationSettings;
}

- (void)setWindowDragAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)medusaAnimationSettings
{
  return self->_medusaAnimationSettings;
}

- (void)setMedusaAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)resizeAnimationSettings
{
  return self->_resizeAnimationSettings;
}

- (void)setResizeAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)platterAnimationSettings
{
  return self->_platterAnimationSettings;
}

- (void)setPlatterAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dropAnimationSettings
{
  return self->_dropAnimationSettings;
}

- (void)setDropAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherCardDropAnimationSettings
{
  return self->_switcherCardDropAnimationSettings;
}

- (void)setSwitcherCardDropAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)topAffordanceExpandAnimationSettings
{
  return self->_topAffordanceExpandAnimationSettings;
}

- (void)setTopAffordanceExpandAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)topAffordanceCollapseAnimationSettings
{
  return self->_topAffordanceCollapseAnimationSettings;
}

- (void)setTopAffordanceCollapseAnimationSettings:(id)a3
{
}

- (double)dropAnimationUnblurThresholdPercentage
{
  return self->_dropAnimationUnblurThresholdPercentage;
}

- (void)setDropAnimationUnblurThresholdPercentage:(double)a3
{
  self->_dropAnimationUnblurThresholdPercentage = a3;
}

- (double)resizeAnimationUnblurThresholdPercentage
{
  return self->_resizeAnimationUnblurThresholdPercentage;
}

- (void)setResizeAnimationUnblurThresholdPercentage:(double)a3
{
  self->_resizeAnimationUnblurThresholdPercentage = a3;
}

- (double)resizeAnimationDismissItemOpacity
{
  return self->_resizeAnimationDismissItemOpacity;
}

- (void)setResizeAnimationDismissItemOpacity:(double)a3
{
  self->_resizeAnimationDismissItemOpacity = a3;
}

- (double)movePanGestureThresholdPercentage
{
  return self->_movePanGestureThresholdPercentage;
}

- (void)setMovePanGestureThresholdPercentage:(double)a3
{
  self->_movePanGestureThresholdPercentage = a3;
}

- (double)movePanGesturePositiveVelocityThreshold
{
  return self->_movePanGesturePositiveVelocityThreshold;
}

- (void)setMovePanGesturePositiveVelocityThreshold:(double)a3
{
  self->_movePanGesturePositiveVelocityThreshold = a3;
}

- (double)movePanGestureNegativeVelocityThreshold
{
  return self->_movePanGestureNegativeVelocityThreshold;
}

- (void)setMovePanGestureNegativeVelocityThreshold:(double)a3
{
  self->_movePanGestureNegativeVelocityThreshold = a3;
}

- (double)replacementDimmingAlpha
{
  return self->_replacementDimmingAlpha;
}

- (void)setReplacementDimmingAlpha:(double)a3
{
  self->_replacementDimmingAlpha = a3;
}

- (double)topAffordanceHitTestExtendTop
{
  return self->_topAffordanceHitTestExtendTop;
}

- (void)setTopAffordanceHitTestExtendTop:(double)a3
{
  self->_topAffordanceHitTestExtendTop = a3;
}

- (double)topAffordanceHitTestExtendBottom
{
  return self->_topAffordanceHitTestExtendBottom;
}

- (void)setTopAffordanceHitTestExtendBottom:(double)a3
{
  self->_topAffordanceHitTestExtendBottom = a3;
}

- (double)topAffordanceHitTestExtendLeft
{
  return self->_topAffordanceHitTestExtendLeft;
}

- (void)setTopAffordanceHitTestExtendLeft:(double)a3
{
  self->_topAffordanceHitTestExtendLeft = a3;
}

- (double)topAffordanceHitTestExtendRight
{
  return self->_topAffordanceHitTestExtendRight;
}

- (void)setTopAffordanceHitTestExtendRight:(double)a3
{
  self->_topAffordanceHitTestExtendRight = a3;
}

- (double)iconPlatterScale
{
  return self->_iconPlatterScale;
}

- (void)setIconPlatterScale:(double)a3
{
  self->_iconPlatterScale = a3;
}

- (double)windowPlatterScale
{
  return self->_windowPlatterScale;
}

- (void)setWindowPlatterScale:(double)a3
{
  self->_windowPlatterScale = a3;
}

- (double)windowPlatterScaleForReplacingEntireSpace
{
  return self->_windowPlatterScaleForReplacingEntireSpace;
}

- (void)setWindowPlatterScaleForReplacingEntireSpace:(double)a3
{
  self->_windowPlatterScaleForReplacingEntireSpace = a3;
}

- (double)cardPlatterScale
{
  return self->_cardPlatterScale;
}

- (void)setCardPlatterScale:(double)a3
{
  self->_cardPlatterScale = a3;
}

- (double)floatingCardPlatterScale
{
  return self->_floatingCardPlatterScale;
}

- (void)setFloatingCardPlatterScale:(double)a3
{
  self->_floatingCardPlatterScale = a3;
}

- (double)slideOverTongueExpandedScale
{
  return self->_slideOverTongueExpandedScale;
}

- (void)setSlideOverTongueExpandedScale:(double)a3
{
  self->_slideOverTongueExpandedScale = a3;
}

- (double)draggingPlatterSideActivationGutterPadding
{
  return self->_draggingPlatterSideActivationGutterPadding;
}

- (void)setDraggingPlatterSideActivationGutterPadding:(double)a3
{
  self->_draggingPlatterSideActivationGutterPadding = a3;
}

- (double)draggingPlatterFullscreenActivationRegionWidth
{
  return self->_draggingPlatterFullscreenActivationRegionWidth;
}

- (void)setDraggingPlatterFullscreenActivationRegionWidth:(double)a3
{
  self->_draggingPlatterFullscreenActivationRegionWidth = a3;
}

- (double)draggingPlatterFullscreenActivationRegionHeight
{
  return self->_draggingPlatterFullscreenActivationRegionHeight;
}

- (void)setDraggingPlatterFullscreenActivationRegionHeight:(double)a3
{
  self->_draggingPlatterFullscreenActivationRegionHeight = a3;
}

- (double)switcherFullScreenContentPushInScale
{
  return self->_switcherFullScreenContentPushInScale;
}

- (void)setSwitcherFullScreenContentPushInScale:(double)a3
{
  self->_switcherFullScreenContentPushInScale = a3;
}

- (double)switcherCenterWindowContentPushInScale
{
  return self->_switcherCenterWindowContentPushInScale;
}

- (void)setSwitcherCenterWindowContentPushInScale:(double)a3
{
  self->_switcherCenterWindowContentPushInScale = a3;
}

- (double)switcherSlideOverContentPushInScale
{
  return self->_switcherSlideOverContentPushInScale;
}

- (void)setSwitcherSlideOverContentPushInScale:(double)a3
{
  self->_switcherSlideOverContentPushInScale = a3;
}

- (double)switcherSlideOverDosidoLayoutOvershootMultiplicationFactor
{
  return self->_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor;
}

- (void)setSwitcherSlideOverDosidoLayoutOvershootMultiplicationFactor:(double)a3
{
  self->_switcherSlideOverDosidoLayoutOvershootMultiplicationFactor = a3;
}

- (double)cardDragOverSplitAppLayoutScale
{
  return self->_cardDragOverSplitAppLayoutScale;
}

- (void)setCardDragOverSplitAppLayoutScale:(double)a3
{
  self->_cardDragOverSplitAppLayoutScale = a3;
}

- (double)reflowAnimationProgressForCardHeaderFadeIn
{
  return self->_reflowAnimationProgressForCardHeaderFadeIn;
}

- (void)setReflowAnimationProgressForCardHeaderFadeIn:(double)a3
{
  self->_reflowAnimationProgressForCardHeaderFadeIn = a3;
}

- (void)setShowContentDragExclusionRects:(BOOL)a3
{
  self->_showContentDragExclusionRects = a3;
}

- (double)contentDraggingCommandeerGutterInsetForUniversalControl
{
  return self->_contentDraggingCommandeerGutterInsetForUniversalControl;
}

- (void)setContentDraggingCommandeerGutterInsetForUniversalControl:(double)a3
{
  self->_contentDraggingCommandeerGutterInsetForUniversalControl = a3;
}

- (double)contentDraggingCommandeerGutterWidth
{
  return self->_contentDraggingCommandeerGutterWidth;
}

- (void)setContentDraggingCommandeerGutterWidth:(double)a3
{
  self->_contentDraggingCommandeerGutterWidth = a3;
}

- (double)contentDraggingSideActivationGutterWidth
{
  return self->_contentDraggingSideActivationGutterWidth;
}

- (void)setContentDraggingSideActivationGutterWidth:(double)a3
{
  self->_contentDraggingSideActivationGutterWidth = a3;
}

- (double)contentDraggingFloatingActivationGutterWidth
{
  return self->_contentDraggingFloatingActivationGutterWidth;
}

- (void)setContentDraggingFloatingActivationGutterWidth:(double)a3
{
  self->_contentDraggingFloatingActivationGutterWidth = a3;
}

- (double)windowTearOffDraggingSideActivationGutterWidth
{
  return self->_windowTearOffDraggingSideActivationGutterWidth;
}

- (void)setWindowTearOffDraggingSideActivationGutterWidth:(double)a3
{
  self->_windowTearOffDraggingSideActivationGutterWidth = a3;
}

- (double)windowTearOffDraggingFloatingActivationGutterWidth
{
  return self->_windowTearOffDraggingFloatingActivationGutterWidth;
}

- (void)setWindowTearOffDraggingFloatingActivationGutterWidth:(double)a3
{
  self->_windowTearOffDraggingFloatingActivationGutterWidth = a3;
}

- (double)windowSplitViewDismissalGutterWidth
{
  return self->_windowSplitViewDismissalGutterWidth;
}

- (void)setWindowSplitViewDismissalGutterWidth:(double)a3
{
  self->_windowSplitViewDismissalGutterWidth = a3;
}

- (PTOutlet)killSpringBoardOutlet
{
  return self->_killSpringBoardOutlet;
}

- (void)setKillSpringBoardOutlet:(id)a3
{
}

- (double)cornerRadiusForInnerCorners
{
  return self->_cornerRadiusForInnerCorners;
}

- (void)setCornerRadiusForInnerCorners:(double)a3
{
  self->_cornerRadiusForInnerCorners = a3;
}

- (double)cornerRadiusForCompatibilityAppOuterCorners
{
  return self->_cornerRadiusForCompatibilityAppOuterCorners;
}

- (void)setCornerRadiusForCompatibilityAppOuterCorners:(double)a3
{
  self->_cornerRadiusForCompatibilityAppOuterCorners = a3;
}

- (double)cornerRadiusForFloatingApps
{
  return self->_cornerRadiusForFloatingApps;
}

- (void)setCornerRadiusForFloatingApps:(double)a3
{
  self->_cornerRadiusForFloatingApps = a3;
}

- (double)cornerRadiusFallbackForOldApps
{
  return self->_cornerRadiusFallbackForOldApps;
}

- (void)setCornerRadiusFallbackForOldApps:(double)a3
{
  self->_cornerRadiusFallbackForOldApps = a3;
}

- (void)setStatusBarDebugBackgroundColorsEnabled:(BOOL)a3
{
  self->_statusBarDebugBackgroundColorsEnabled = a3;
}

- (void)setStatusBarDebugOffsettingEnabled:(BOOL)a3
{
  self->_statusBarDebugOffsettingEnabled = a3;
}

- (double)switcherShelfCardScale
{
  return self->_switcherShelfCardScale;
}

- (void)setSwitcherShelfCardScale:(double)a3
{
  self->_switcherShelfCardScale = a3;
}

- (double)switcherShelfCardCornerRadius
{
  return self->_switcherShelfCardCornerRadius;
}

- (void)setSwitcherShelfCardCornerRadius:(double)a3
{
  self->_switcherShelfCardCornerRadius = a3;
}

- (double)switcherShelfCardShadowRadius
{
  return self->_switcherShelfCardShadowRadius;
}

- (void)setSwitcherShelfCardShadowRadius:(double)a3
{
  self->_switcherShelfCardShadowRadius = a3;
}

- (double)switcherShelfCardShadowOffsetY
{
  return self->_switcherShelfCardShadowOffsetY;
}

- (void)setSwitcherShelfCardShadowOffsetY:(double)a3
{
  self->_switcherShelfCardShadowOffsetY = a3;
}

- (double)switcherShelfCardShadowOpacity
{
  return self->_switcherShelfCardShadowOpacity;
}

- (void)setSwitcherShelfCardShadowOpacity:(double)a3
{
  self->_switcherShelfCardShadowOpacity = a3;
}

- (double)switcherShelfLabelLineSpacing
{
  return self->_switcherShelfLabelLineSpacing;
}

- (void)setSwitcherShelfLabelLineSpacing:(double)a3
{
  self->_switcherShelfLabelLineSpacing = a3;
}

- (double)switcherShelfBottomSpacing
{
  return self->_switcherShelfBottomSpacing;
}

- (void)setSwitcherShelfBottomSpacing:(double)a3
{
  self->_switcherShelfBottomSpacing = a3;
}

- (double)switcherShelfSplitViewIconInset
{
  return self->_switcherShelfSplitViewIconInset;
}

- (void)setSwitcherShelfSplitViewIconInset:(double)a3
{
  self->_switcherShelfSplitViewIconInset = a3;
}

- (void)setSwitcherShelfIconHitTestInset:(double)a3
{
  self->_switcherShelfIconHitTestInset = a3;
}

- (double)switcherShelfBackgroundBlurPresentationThreshold
{
  return self->_switcherShelfBackgroundBlurPresentationThreshold;
}

- (void)setSwitcherShelfBackgroundBlurPresentationThreshold:(double)a3
{
  self->_switcherShelfBackgroundBlurPresentationThreshold = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfGenieRopeSettings
{
  return self->_switcherShelfGenieRopeSettings;
}

- (void)setSwitcherShelfGenieRopeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherShelfCardGeniePresentationSettings
{
  return self->_switcherShelfCardGeniePresentationSettings;
}

- (void)setSwitcherShelfCardGeniePresentationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherShelfCardGenieDismissalSettings
{
  return self->_switcherShelfCardGenieDismissalSettings;
}

- (void)setSwitcherShelfCardGenieDismissalSettings:(id)a3
{
}

- (double)switcherShelfGenieInitialYIncrementBelowScreen
{
  return self->_switcherShelfGenieInitialYIncrementBelowScreen;
}

- (void)setSwitcherShelfGenieInitialYIncrementBelowScreen:(double)a3
{
  self->_switcherShelfGenieInitialYIncrementBelowScreen = a3;
}

- (double)switcherShelfCardGenieResponseIncrementScalar
{
  return self->_switcherShelfCardGenieResponseIncrementScalar;
}

- (void)setSwitcherShelfCardGenieResponseIncrementScalar:(double)a3
{
  self->_switcherShelfCardGenieResponseIncrementScalar = a3;
}

- (double)switcherShelfCardGenieDismissedScale
{
  return self->_switcherShelfCardGenieDismissedScale;
}

- (void)setSwitcherShelfCardGenieDismissedScale:(double)a3
{
  self->_switcherShelfCardGenieDismissedScale = a3;
}

- (double)switcherShelfGenieBezierCurvePointYDeltaFromTarget
{
  return self->_switcherShelfGenieBezierCurvePointYDeltaFromTarget;
}

- (void)setSwitcherShelfGenieBezierCurvePointYDeltaFromTarget:(double)a3
{
  self->_switcherShelfGenieBezierCurvePointYDeltaFromTarget = a3;
}

- (double)switcherShelfGenieBezierCurveXExponent
{
  return self->_switcherShelfGenieBezierCurveXExponent;
}

- (void)setSwitcherShelfGenieBezierCurveXExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveXExponent = a3;
}

- (double)switcherShelfGenieBezierCurveYExponent
{
  return self->_switcherShelfGenieBezierCurveYExponent;
}

- (void)setSwitcherShelfGenieBezierCurveYExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveYExponent = a3;
}

- (double)switcherShelfGenieBezierCurveScaleExponent
{
  return self->_switcherShelfGenieBezierCurveScaleExponent;
}

- (void)setSwitcherShelfGenieBezierCurveScaleExponent:(double)a3
{
  self->_switcherShelfGenieBezierCurveScaleExponent = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfBounceIconSettings
{
  return self->_switcherShelfBounceIconSettings;
}

- (void)setSwitcherShelfBounceIconSettings:(id)a3
{
}

- (double)switcherShelfGenieIconBounceDelay
{
  return self->_switcherShelfGenieIconBounceDelay;
}

- (void)setSwitcherShelfGenieIconBounceDelay:(double)a3
{
  self->_switcherShelfGenieIconBounceDelay = a3;
}

- (SBFFluidBehaviorSettings)switcherShelfNonGenieRopeSettings
{
  return self->_switcherShelfNonGenieRopeSettings;
}

- (void)setSwitcherShelfNonGenieRopeSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherShelfCardNonGeniePresentationSettings
{
  return self->_switcherShelfCardNonGeniePresentationSettings;
}

- (void)setSwitcherShelfCardNonGeniePresentationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)switcherShelfCardNonGenieDismissalSettings
{
  return self->_switcherShelfCardNonGenieDismissalSettings;
}

- (void)setSwitcherShelfCardNonGenieDismissalSettings:(id)a3
{
}

- (double)switcherShelfCardNonGenieResponseIncrementScalar
{
  return self->_switcherShelfCardNonGenieResponseIncrementScalar;
}

- (void)setSwitcherShelfCardNonGenieResponseIncrementScalar:(double)a3
{
  self->_switcherShelfCardNonGenieResponseIncrementScalar = a3;
}

- (double)switcherShelfCardNonGenieDismissedScale
{
  return self->_switcherShelfCardNonGenieDismissedScale;
}

- (void)setSwitcherShelfCardNonGenieDismissedScale:(double)a3
{
  self->_switcherShelfCardNonGenieDismissedScale = a3;
}

- (double)switcherCenterWindowShadowRadius
{
  return self->_switcherCenterWindowShadowRadius;
}

- (void)setSwitcherCenterWindowShadowRadius:(double)a3
{
  self->_switcherCenterWindowShadowRadius = a3;
}

- (double)switcherCenterWindowShadowOffsetY
{
  return self->_switcherCenterWindowShadowOffsetY;
}

- (void)setSwitcherCenterWindowShadowOffsetY:(double)a3
{
  self->_switcherCenterWindowShadowOffsetY = a3;
}

- (double)switcherCenterWindowShadowOpacity
{
  return self->_switcherCenterWindowShadowOpacity;
}

- (void)setSwitcherCenterWindowShadowOpacity:(double)a3
{
  self->_switcherCenterWindowShadowOpacity = a3;
}

- (double)switcherPeekingWindowShadowRadius
{
  return self->_switcherPeekingWindowShadowRadius;
}

- (void)setSwitcherPeekingWindowShadowRadius:(double)a3
{
  self->_switcherPeekingWindowShadowRadius = a3;
}

- (double)switcherPeekingWindowShadowOffsetY
{
  return self->_switcherPeekingWindowShadowOffsetY;
}

- (void)setSwitcherPeekingWindowShadowOffsetY:(double)a3
{
  self->_switcherPeekingWindowShadowOffsetY = a3;
}

- (double)switcherPeekingWindowShadowOpacity
{
  return self->_switcherPeekingWindowShadowOpacity;
}

- (void)setSwitcherPeekingWindowShadowOpacity:(double)a3
{
  self->_switcherPeekingWindowShadowOpacity = a3;
}

- (double)leadingSlideOverRelocationDelay
{
  return self->_leadingSlideOverRelocationDelay;
}

- (void)setLeadingSlideOverRelocationDelay:(double)a3
{
  self->_leadingSlideOverRelocationDelay = a3;
}

- (double)defaultDimmingOpacity
{
  return self->_defaultDimmingOpacity;
}

- (void)setDefaultDimmingOpacity:(double)a3
{
  self->_defaultDimmingOpacity = a3;
}

- (double)vibrantColorMatrixM11
{
  return self->_vibrantColorMatrixM11;
}

- (void)setVibrantColorMatrixM11:(double)a3
{
  self->_vibrantColorMatrixM11 = a3;
}

- (double)vibrantColorMatrixM12
{
  return self->_vibrantColorMatrixM12;
}

- (void)setVibrantColorMatrixM12:(double)a3
{
  self->_vibrantColorMatrixM12 = a3;
}

- (double)vibrantColorMatrixM13
{
  return self->_vibrantColorMatrixM13;
}

- (void)setVibrantColorMatrixM13:(double)a3
{
  self->_vibrantColorMatrixM13 = a3;
}

- (double)vibrantColorMatrixM14
{
  return self->_vibrantColorMatrixM14;
}

- (void)setVibrantColorMatrixM14:(double)a3
{
  self->_vibrantColorMatrixM14 = a3;
}

- (double)vibrantColorMatrixM15
{
  return self->_vibrantColorMatrixM15;
}

- (void)setVibrantColorMatrixM15:(double)a3
{
  self->_vibrantColorMatrixM15 = a3;
}

- (double)vibrantColorMatrixM21
{
  return self->_vibrantColorMatrixM21;
}

- (void)setVibrantColorMatrixM21:(double)a3
{
  self->_vibrantColorMatrixM21 = a3;
}

- (double)vibrantColorMatrixM22
{
  return self->_vibrantColorMatrixM22;
}

- (void)setVibrantColorMatrixM22:(double)a3
{
  self->_vibrantColorMatrixM22 = a3;
}

- (double)vibrantColorMatrixM23
{
  return self->_vibrantColorMatrixM23;
}

- (void)setVibrantColorMatrixM23:(double)a3
{
  self->_vibrantColorMatrixM23 = a3;
}

- (double)vibrantColorMatrixM24
{
  return self->_vibrantColorMatrixM24;
}

- (void)setVibrantColorMatrixM24:(double)a3
{
  self->_vibrantColorMatrixM24 = a3;
}

- (double)vibrantColorMatrixM25
{
  return self->_vibrantColorMatrixM25;
}

- (void)setVibrantColorMatrixM25:(double)a3
{
  self->_vibrantColorMatrixM25 = a3;
}

- (double)vibrantColorMatrixM31
{
  return self->_vibrantColorMatrixM31;
}

- (void)setVibrantColorMatrixM31:(double)a3
{
  self->_vibrantColorMatrixM31 = a3;
}

- (double)vibrantColorMatrixM32
{
  return self->_vibrantColorMatrixM32;
}

- (void)setVibrantColorMatrixM32:(double)a3
{
  self->_vibrantColorMatrixM32 = a3;
}

- (double)vibrantColorMatrixM33
{
  return self->_vibrantColorMatrixM33;
}

- (void)setVibrantColorMatrixM33:(double)a3
{
  self->_vibrantColorMatrixM33 = a3;
}

- (double)vibrantColorMatrixM34
{
  return self->_vibrantColorMatrixM34;
}

- (void)setVibrantColorMatrixM34:(double)a3
{
  self->_vibrantColorMatrixM34 = a3;
}

- (double)vibrantColorMatrixM35
{
  return self->_vibrantColorMatrixM35;
}

- (void)setVibrantColorMatrixM35:(double)a3
{
  self->_vibrantColorMatrixM35 = a3;
}

- (double)vibrantColorMatrixM41
{
  return self->_vibrantColorMatrixM41;
}

- (void)setVibrantColorMatrixM41:(double)a3
{
  self->_vibrantColorMatrixM41 = a3;
}

- (double)vibrantColorMatrixM42
{
  return self->_vibrantColorMatrixM42;
}

- (void)setVibrantColorMatrixM42:(double)a3
{
  self->_vibrantColorMatrixM42 = a3;
}

- (double)vibrantColorMatrixM43
{
  return self->_vibrantColorMatrixM43;
}

- (void)setVibrantColorMatrixM43:(double)a3
{
  self->_vibrantColorMatrixM43 = a3;
}

- (double)vibrantColorMatrixM44
{
  return self->_vibrantColorMatrixM44;
}

- (void)setVibrantColorMatrixM44:(double)a3
{
  self->_vibrantColorMatrixM44 = a3;
}

- (double)vibrantColorMatrixM45
{
  return self->_vibrantColorMatrixM45;
}

- (void)setVibrantColorMatrixM45:(double)a3
{
  self->_vibrantColorMatrixM45 = a3;
}

- (double)medusaSeparatorCursorTopEdgeInset
{
  return self->_medusaSeparatorCursorTopEdgeInset;
}

- (void)setMedusaSeparatorCursorTopEdgeInset:(double)a3
{
  self->_double medusaSeparatorCursorTopEdgeInset = a3;
}

- (double)medusaSeparatorCursorBottomEdgeInset
{
  return self->_medusaSeparatorCursorBottomEdgeInset;
}

- (void)setMedusaSeparatorCursorBottomEdgeInset:(double)a3
{
  self->_double medusaSeparatorCursorBottomEdgeInset = a3;
}

- (double)medusaSeparatorCursorLeftEdgeInset
{
  return self->_medusaSeparatorCursorLeftEdgeInset;
}

- (void)setMedusaSeparatorCursorLeftEdgeInset:(double)a3
{
  self->_double medusaSeparatorCursorLeftEdgeInset = a3;
}

- (double)medusaSeparatorCursorRightEdgeInset
{
  return self->_medusaSeparatorCursorRightEdgeInset;
}

- (void)setMedusaSeparatorCursorRightEdgeInset:(double)a3
{
  self->_double medusaSeparatorCursorRightEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorTopEdgeInset
{
  return self->_medusaWindowDraggingCursorTopEdgeInset;
}

- (void)setMedusaWindowDraggingCursorTopEdgeInset:(double)a3
{
  self->_double medusaWindowDraggingCursorTopEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorBottomEdgeInset
{
  return self->_medusaWindowDraggingCursorBottomEdgeInset;
}

- (void)setMedusaWindowDraggingCursorBottomEdgeInset:(double)a3
{
  self->_double medusaWindowDraggingCursorBottomEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorLeftEdgeInset
{
  return self->_medusaWindowDraggingCursorLeftEdgeInset;
}

- (void)setMedusaWindowDraggingCursorLeftEdgeInset:(double)a3
{
  self->_double medusaWindowDraggingCursorLeftEdgeInset = a3;
}

- (double)medusaWindowDraggingCursorRightEdgeInset
{
  return self->_medusaWindowDraggingCursorRightEdgeInset;
}

- (void)setMedusaWindowDraggingCursorRightEdgeInset:(double)a3
{
  self->_double medusaWindowDraggingCursorRightEdgeInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherShelfCardNonGenieDismissalSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardNonGeniePresentationSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfNonGenieRopeSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfBounceIconSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardGenieDismissalSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfCardGeniePresentationSettings, 0);
  objc_storeStrong((id *)&self->_switcherShelfGenieRopeSettings, 0);
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, 0);
  objc_storeStrong((id *)&self->_topAffordanceCollapseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_topAffordanceExpandAnimationSettings, 0);
  objc_storeStrong((id *)&self->_switcherCardDropAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dropAnimationSettings, 0);
  objc_storeStrong((id *)&self->_platterAnimationSettings, 0);
  objc_storeStrong((id *)&self->_resizeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusaAnimationSettings, 0);
  objc_storeStrong((id *)&self->_windowDragAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dockWithPresentedFolderAnimationSettings, 0);
  objc_storeStrong((id *)&self->_dockAnimationSettings, 0);
  objc_storeStrong((id *)&self->_medusa1oSettings, 0);
}

@end