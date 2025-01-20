@interface SBAppSwitcherSettings
+ (id)settingsControllerModule;
- (BOOL)liveResizeSendsAnimatedSceneSizeUpdates;
- (BOOL)liveResizeUsesGrid;
- (BOOL)shouldDisableSwitcherModelUpdatesForDemo;
- (BOOL)shouldRedactWindowContents;
- (BOOL)shouldRoundCornersDuringSwipeUp;
- (BOOL)shouldSimplifyForOptions:(int64_t)a3;
- (BOOL)showFloatingModifierTimeline;
- (BOOL)showFloats;
- (BOOL)showLockedModifierTimeline;
- (BOOL)showMainModifierTimeline;
- (BOOL)showModifierDebugLabel;
- (BOOL)simplicityOptionNoBlurs;
- (BOOL)simplicityOptionNoControlCenter;
- (BOOL)simplicityOptionNoCrossfade;
- (BOOL)simplicityOptionNoIcons;
- (BOOL)simplicityOptionNoLabels;
- (BOOL)simplicityOptionNoShadows;
- (BOOL)simplicityOptionNoSnapshotBkg;
- (BOOL)simplicityOptionNoSnapshots;
- (BOOL)useAsynchronousRendering;
- (BOOL)useTitleOpacityPrototypeSettings;
- (PTOutlet)addAppsToModelOutlet;
- (PTOutlet)addPPTAppsToModelOutlet;
- (PTOutlet)clearModelOutlet;
- (PTOutlet)loadModelOutlet;
- (PTOutlet)stashModelOutlet;
- (SBCenterWindowSizingSettings)centerWindowSizingSettings;
- (SBDashBoardHomeGestureSettings)dashboardHomeGestureSettings;
- (SBFloatingSwitcherSettings)floatingSwitcherSettings;
- (SBFluidSwitcherAnimationSettings)animationSettings;
- (SBSceneRelevancySettings)sceneRelevancySettings;
- (SBSwitcherChamoisSettings)chamoisSettings;
- (SBSwitcherSystemApertureSettings)systemApertureSettings;
- (double)_spacingBetweenLeadingEdgeAndIcon;
- (double)aExpLayoutCoeff;
- (double)appExposeFloatingDoubleRowScale;
- (double)appExposeNonFloatingDoubleRowScale;
- (double)appExposeNonFloatingSingleRowScale;
- (double)asynchronousRenderingDisableSurfaceCacheDelayDuration;
- (double)bAlpha;
- (double)bDarkening;
- (double)bExpLayoutCoeff;
- (double)centerPoint;
- (double)coplanarSpacingPad;
- (double)coplanarSpacingPhone;
- (double)cursorHoverShadowOffsetInterpolationAmount;
- (double)cursorHoverShadowOpacityInterpolationAmount;
- (double)cursorHoverShadowRadiusInterpolationAmount;
- (double)deckSwitcherDecelerationRate;
- (double)deckSwitcherPageScale;
- (double)depthPadding;
- (double)gridSwitcherHomeButtonDeviceCardCornerRadius;
- (double)gridSwitcherHorizontalInterpageSpacingLandscape;
- (double)gridSwitcherHorizontalInterpageSpacingPortrait;
- (double)gridSwitcherPageScale;
- (double)gridSwitcherSnapToControlCenterHeightSlop;
- (double)gridSwitcherSwipeUpMinimumScale;
- (double)gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale;
- (double)gridSwitcherSwipeUpNormalizedRubberbandingRange;
- (double)gridSwitcherVerticalNaturalSpacingLandscape;
- (double)gridSwitcherVerticalNaturalSpacingPortrait;
- (double)iconSideLength;
- (double)liveResizeGridMinimumHeight;
- (double)liveResizeGridMinimumWidth;
- (double)liveResizeGridRubberbandingRange;
- (double)liveResizePointerInteractionRegionInnerLength;
- (double)liveResizePointerInteractionRegionOuterLength;
- (double)liveResizeSceneUpdateDistanceThreshold;
- (double)liveResizeSceneUpdateTimeThresholdSeconds;
- (double)mAlpha;
- (double)mDarkening;
- (double)mScale;
- (double)maxDarkening;
- (double)maxScale;
- (double)multipleWindowsIndicatorSideLength;
- (double)offscreenCardScaleForFlyIn;
- (double)peekInsetWidth;
- (double)preventMedusaSnapshotsAfterTransitionDuration;
- (double)snapshotAspectRatioAcceptanceThreshold;
- (double)spacingBetweenBoundsCenterAndSecondIcon;
- (double)spacingBetweenIconAndLabel;
- (double)spacingBetweenLabelAndMultipleWindowsIndicator;
- (double)spacingBetweenLabelAndSecondIcon;
- (double)spacingBetweenLeadingEdgeAndIcon;
- (double)spacingBetweenSnapshotAndDescriptionLabelBaseline;
- (double)spacingBetweenSnapshotAndIcon;
- (double)spacingBetweenTitleAndSubtitleBaseline;
- (double)spacingBetweenTrailingEdgeAndLabels;
- (double)switcherCardScaleWhileCursorHovered;
- (double)switcherCardScaleWhileTouched;
- (double)switcherCardShadowOffsetHorizontal;
- (double)switcherCardShadowOffsetHorizontalWhileTouched;
- (double)switcherCardShadowOffsetVertical;
- (double)switcherCardShadowOffsetVerticalWhileTouched;
- (double)switcherCardShadowOpacity;
- (double)switcherCardShadowOpacityWhileTouched;
- (double)switcherCardShadowRadius;
- (double)switcherCardShadowRadiusWhileTouched;
- (double)switcherCenterYOffsetPercentOfScreenHeight;
- (double)tetheredInsertionRemovalInsetForDeterminingVisibility;
- (double)tintStyleDimmingAlphaInFocusForDarkMode;
- (double)tintStyleDimmingAlphaInFocusForLightMode;
- (double)tintStyleDimmingAlphaUnFocusForDarkMode;
- (double)titleOpacityACoeff;
- (double)titleOpacityBCoeff;
- (double)titleOpacityCCoeff;
- (double)titleOpacityDCoeff;
- (id)archiveValueForKey:(id)a3;
- (int64_t)effectiveSwitcherStyle;
- (int64_t)simplicityOptions;
- (int64_t)switcherStyle;
- (unint64_t)numberOfSnapshotsToAlwaysKeepAround;
- (unint64_t)numberOfSnapshotsToCacheInSwitcher;
- (void)setAExpLayoutCoeff:(double)a3;
- (void)setAddAppsToModelOutlet:(id)a3;
- (void)setAddPPTAppsToModelOutlet:(id)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setAppExposeFloatingDoubleRowScale:(double)a3;
- (void)setAppExposeNonFloatingDoubleRowScale:(double)a3;
- (void)setAppExposeNonFloatingSingleRowScale:(double)a3;
- (void)setAsynchronousRenderingDisableSurfaceCacheDelayDuration:(double)a3;
- (void)setBAlpha:(double)a3;
- (void)setBDarkening:(double)a3;
- (void)setBExpLayoutCoeff:(double)a3;
- (void)setCenterPoint:(double)a3;
- (void)setCenterWindowSizingSettings:(id)a3;
- (void)setChamoisSettings:(id)a3;
- (void)setClearModelOutlet:(id)a3;
- (void)setCoplanarSpacingPad:(double)a3;
- (void)setCoplanarSpacingPhone:(double)a3;
- (void)setCursorHoverShadowOffsetInterpolationAmount:(double)a3;
- (void)setCursorHoverShadowOpacityInterpolationAmount:(double)a3;
- (void)setCursorHoverShadowRadiusInterpolationAmount:(double)a3;
- (void)setDashboardHomeGestureSettings:(id)a3;
- (void)setDeckSwitcherDecelerationRate:(double)a3;
- (void)setDeckSwitcherPageScale:(double)a3;
- (void)setDefaultValues;
- (void)setDepthPadding:(double)a3;
- (void)setFloatingSwitcherSettings:(id)a3;
- (void)setGridSwitcherHomeButtonDeviceCardCornerRadius:(double)a3;
- (void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)a3;
- (void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)a3;
- (void)setGridSwitcherPageScale:(double)a3;
- (void)setGridSwitcherSnapToControlCenterHeightSlop:(double)a3;
- (void)setGridSwitcherSwipeUpMinimumScale:(double)a3;
- (void)setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:(double)a3;
- (void)setGridSwitcherSwipeUpNormalizedRubberbandingRange:(double)a3;
- (void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)a3;
- (void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)a3;
- (void)setIconSideLength:(double)a3;
- (void)setLiveResizeGridMinimumHeight:(double)a3;
- (void)setLiveResizeGridMinimumWidth:(double)a3;
- (void)setLiveResizeGridRubberbandingRange:(double)a3;
- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3;
- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3;
- (void)setLiveResizeSceneUpdateDistanceThreshold:(double)a3;
- (void)setLiveResizeSceneUpdateTimeThresholdSeconds:(double)a3;
- (void)setLiveResizeSendsAnimatedSceneSizeUpdates:(BOOL)a3;
- (void)setLiveResizeUsesGrid:(BOOL)a3;
- (void)setLoadModelOutlet:(id)a3;
- (void)setMAlpha:(double)a3;
- (void)setMDarkening:(double)a3;
- (void)setMScale:(double)a3;
- (void)setMaxDarkening:(double)a3;
- (void)setMaxScale:(double)a3;
- (void)setMultipleWindowsIndicatorSideLength:(double)a3;
- (void)setNumberOfSnapshotsToAlwaysKeepAround:(unint64_t)a3;
- (void)setNumberOfSnapshotsToCacheInSwitcher:(unint64_t)a3;
- (void)setOffscreenCardScaleForFlyIn:(double)a3;
- (void)setPeekInsetWidth:(double)a3;
- (void)setPreventMedusaSnapshotsAfterTransitionDuration:(double)a3;
- (void)setSceneRelevancySettings:(id)a3;
- (void)setShouldDisableSwitcherModelUpdatesForDemo:(BOOL)a3;
- (void)setShouldRedactWindowContents:(BOOL)a3;
- (void)setShouldRoundCornersDuringSwipeUp:(BOOL)a3;
- (void)setShowFloatingModifierTimeline:(BOOL)a3;
- (void)setShowFloats:(BOOL)a3;
- (void)setShowLockedModifierTimeline:(BOOL)a3;
- (void)setShowMainModifierTimeline:(BOOL)a3;
- (void)setShowModifierDebugLabel:(BOOL)a3;
- (void)setSimplicityOptionNoBlurs:(BOOL)a3;
- (void)setSimplicityOptionNoControlCenter:(BOOL)a3;
- (void)setSimplicityOptionNoCrossfade:(BOOL)a3;
- (void)setSimplicityOptionNoIcons:(BOOL)a3;
- (void)setSimplicityOptionNoLabels:(BOOL)a3;
- (void)setSimplicityOptionNoShadows:(BOOL)a3;
- (void)setSimplicityOptionNoSnapshotBkg:(BOOL)a3;
- (void)setSimplicityOptionNoSnapshots:(BOOL)a3;
- (void)setSimplicityOptions:(int64_t)a3;
- (void)setSnapshotAspectRatioAcceptanceThreshold:(double)a3;
- (void)setSpacingBetweenBoundsCenterAndSecondIcon:(double)a3;
- (void)setSpacingBetweenIconAndLabel:(double)a3;
- (void)setSpacingBetweenLabelAndMultipleWindowsIndicator:(double)a3;
- (void)setSpacingBetweenLabelAndSecondIcon:(double)a3;
- (void)setSpacingBetweenLeadingEdgeAndIcon:(double)a3;
- (void)setSpacingBetweenSnapshotAndDescriptionLabelBaseline:(double)a3;
- (void)setSpacingBetweenSnapshotAndIcon:(double)a3;
- (void)setSpacingBetweenTitleAndSubtitleBaseline:(double)a3;
- (void)setSpacingBetweenTrailingEdgeAndLabels:(double)a3;
- (void)setStashModelOutlet:(id)a3;
- (void)setSwitcherCardScaleWhileCursorHovered:(double)a3;
- (void)setSwitcherCardScaleWhileTouched:(double)a3;
- (void)setSwitcherCardShadowOffsetHorizontal:(double)a3;
- (void)setSwitcherCardShadowOffsetHorizontalWhileTouched:(double)a3;
- (void)setSwitcherCardShadowOffsetVertical:(double)a3;
- (void)setSwitcherCardShadowOffsetVerticalWhileTouched:(double)a3;
- (void)setSwitcherCardShadowOpacity:(double)a3;
- (void)setSwitcherCardShadowOpacityWhileTouched:(double)a3;
- (void)setSwitcherCardShadowRadius:(double)a3;
- (void)setSwitcherCardShadowRadiusWhileTouched:(double)a3;
- (void)setSwitcherCenterYOffsetPercentOfScreenHeight:(double)a3;
- (void)setSwitcherStyle:(int64_t)a3;
- (void)setSystemApertureSettings:(id)a3;
- (void)setTetheredInsertionRemovalInsetForDeterminingVisibility:(double)a3;
- (void)setTintStyleDimmingAlphaInFocusForDarkMode:(double)a3;
- (void)setTintStyleDimmingAlphaInFocusForLightMode:(double)a3;
- (void)setTintStyleDimmingAlphaUnFocusForDarkMode:(double)a3;
- (void)setTitleOpacityACoeff:(double)a3;
- (void)setTitleOpacityBCoeff:(double)a3;
- (void)setTitleOpacityCCoeff:(double)a3;
- (void)setTitleOpacityDCoeff:(double)a3;
- (void)setUseAsynchronousRendering:(BOOL)a3;
- (void)setUseTitleOpacityPrototypeSettings:(BOOL)a3;
@end

@implementation SBAppSwitcherSettings

- (SBSwitcherChamoisSettings)chamoisSettings
{
  return self->_chamoisSettings;
}

- (SBFluidSwitcherAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (double)deckSwitcherPageScale
{
  return self->_deckSwitcherPageScale;
}

- (double)switcherCenterYOffsetPercentOfScreenHeight
{
  return self->_switcherCenterYOffsetPercentOfScreenHeight;
}

- (int64_t)effectiveSwitcherStyle
{
  int64_t result = [(SBAppSwitcherSettings *)self switcherStyle];
  if (!result)
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (int64_t)switcherStyle
{
  return self->_switcherStyle;
}

- (BOOL)shouldSimplifyForOptions:(int64_t)a3
{
  return ([(SBAppSwitcherSettings *)self simplicityOptions] & a3) != 0;
}

- (int64_t)simplicityOptions
{
  return self->_simplicityOptions;
}

- (double)preventMedusaSnapshotsAfterTransitionDuration
{
  return self->_preventMedusaSnapshotsAfterTransitionDuration;
}

- (double)asynchronousRenderingDisableSurfaceCacheDelayDuration
{
  return self->_asynchronousRenderingDisableSurfaceCacheDelayDuration;
}

- (BOOL)shouldDisableSwitcherModelUpdatesForDemo
{
  return self->_shouldDisableSwitcherModelUpdatesForDemo;
}

- (double)snapshotAspectRatioAcceptanceThreshold
{
  return self->_snapshotAspectRatioAcceptanceThreshold;
}

- (BOOL)shouldRedactWindowContents
{
  return self->_shouldRedactWindowContents;
}

- (void)setDefaultValues
{
  v5 = [(SBAppSwitcherSettings *)self animationSettings];
  [v5 setDefaultValues];

  v6 = [(SBAppSwitcherSettings *)self chamoisSettings];
  [v6 setDefaultValues];

  v7 = [(SBAppSwitcherSettings *)self floatingSwitcherSettings];
  [v7 setDefaultValues];

  v8 = [(SBAppSwitcherSettings *)self centerWindowSizingSettings];
  [v8 setDefaultValues];

  v9 = [(SBAppSwitcherSettings *)self sceneRelevancySettings];
  [v9 setDefaultValues];

  [(SBAppSwitcherSettings *)self setMScale:0.45];
  [(SBAppSwitcherSettings *)self setCenterPoint:0.4];
  [(SBAppSwitcherSettings *)self setMaxScale:1.3];
  [(SBAppSwitcherSettings *)self setMAlpha:1.5];
  [(SBAppSwitcherSettings *)self setBAlpha:0.95];
  [(SBAppSwitcherSettings *)self setMDarkening:0.55];
  [(SBAppSwitcherSettings *)self setBDarkening:0.0];
  [(SBAppSwitcherSettings *)self setMaxDarkening:0.35];
  if (__sb__runningInSpringBoard())
  {
    [(SBAppSwitcherSettings *)self setSwitcherCardScaleWhileTouched:dbl_1D8FD2B00[SBFEffectiveDeviceClass() == 2]];
  }
  else
  {
    v10 = [MEMORY[0x1E4F42948] currentDevice];
    -[SBAppSwitcherSettings setSwitcherCardScaleWhileTouched:](self, "setSwitcherCardScaleWhileTouched:", dbl_1D8FD2B00[[v10 userInterfaceIdiom] == 1]);
  }
  [(SBAppSwitcherSettings *)self setSwitcherCardScaleWhileCursorHovered:1.0154];
  if (__sb__runningInSpringBoard())
  {
    int v11 = SBFEffectiveDeviceClass();
    double v12 = 30.0;
    if (v11 == 2) {
      double v12 = 16.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCardShadowRadius:v12];
  }
  else
  {
    v13 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];
    double v15 = 30.0;
    if (v14 == 1) {
      double v15 = 16.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCardShadowRadius:v15];
  }
  if (__sb__runningInSpringBoard())
  {
    [(SBAppSwitcherSettings *)self setSwitcherCardShadowOpacity:dbl_1D8FD2B10[SBFEffectiveDeviceClass() == 2]];
  }
  else
  {
    v16 = [MEMORY[0x1E4F42948] currentDevice];
    -[SBAppSwitcherSettings setSwitcherCardShadowOpacity:](self, "setSwitcherCardShadowOpacity:", dbl_1D8FD2B10[[v16 userInterfaceIdiom] == 1]);
  }
  [(SBAppSwitcherSettings *)self setSwitcherCardShadowOffsetHorizontal:0.0];
  if (__sb__runningInSpringBoard())
  {
    int v17 = SBFEffectiveDeviceClass();
    double v18 = 8.0;
    if (v17 != 2) {
      double v18 = 0.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCardShadowOffsetVertical:v18];
  }
  else
  {
    v19 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];
    double v21 = 8.0;
    if (v20 != 1) {
      double v21 = 0.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCardShadowOffsetVertical:v21];
  }
  if (__sb__runningInSpringBoard())
  {
    int v22 = SBFEffectiveDeviceClass();
    double v23 = -0.01;
    if (v22 == 2) {
      double v23 = 0.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCenterYOffsetPercentOfScreenHeight:v23];
  }
  else
  {
    v24 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v25 = [v24 userInterfaceIdiom];
    double v26 = -0.01;
    if (v25 == 1) {
      double v26 = 0.0;
    }
    [(SBAppSwitcherSettings *)self setSwitcherCenterYOffsetPercentOfScreenHeight:v26];
  }
  [(SBAppSwitcherSettings *)self setSwitcherCardShadowRadiusWhileTouched:50.0];
  [(SBAppSwitcherSettings *)self setSwitcherCardShadowOpacityWhileTouched:0.22];
  [(SBAppSwitcherSettings *)self setSwitcherCardShadowOffsetHorizontalWhileTouched:0.0];
  [(SBAppSwitcherSettings *)self setSwitcherCardShadowOffsetVerticalWhileTouched:25.0];
  [(SBAppSwitcherSettings *)self setCursorHoverShadowRadiusInterpolationAmount:0.33];
  [(SBAppSwitcherSettings *)self setCursorHoverShadowOpacityInterpolationAmount:0.33];
  [(SBAppSwitcherSettings *)self setCursorHoverShadowOffsetInterpolationAmount:0.33];
  [(SBAppSwitcherSettings *)self setPeekInsetWidth:48.0];
  [(SBAppSwitcherSettings *)self setTintStyleDimmingAlphaInFocusForDarkMode:0.75];
  [(SBAppSwitcherSettings *)self setTintStyleDimmingAlphaUnFocusForDarkMode:0.25];
  [(SBAppSwitcherSettings *)self setTintStyleDimmingAlphaInFocusForLightMode:0.35];
  [(SBAppSwitcherSettings *)self setGridSwitcherPageScale:0.3];
  [(SBAppSwitcherSettings *)self setShowFloats:0];
  int v27 = __sb__runningInSpringBoard();
  char v28 = v27;
  if (v27)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_42;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

      goto LABEL_42;
    }
  }
  int v29 = __sb__runningInSpringBoard();
  char v30 = v29;
  if (v29)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v32 = v31;
  double v33 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v30 & 1) == 0) {

  }
  if ((v28 & 1) == 0) {
  if (v32 >= v33)
  }
  {
    double v34 = 8.0;
    double v35 = 91.0;
    double v36 = 57.0;
    double v37 = 84.0;
    double v38 = 58.5;
    goto LABEL_58;
  }
LABEL_42:
  int v39 = __sb__runningInSpringBoard();
  char v40 = v39;
  if (v39)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_56;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

LABEL_56:
      double v34 = 6.0;
      double v35 = 68.0;
      double v36 = 42.5;
      double v37 = 63.0;
      uint64_t v46 = 0x4046000000000000;
      goto LABEL_57;
    }
  }
  int v41 = __sb__runningInSpringBoard();
  char v42 = v41;
  if (v41)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v44 = v43;
  double v45 = *(double *)(MEMORY[0x1E4FA6E50] + 248);
  if ((v42 & 1) == 0) {

  }
  if ((v40 & 1) == 0) {
  if (v44 < v45)
  }
    goto LABEL_56;
  double v34 = 6.5;
  double v35 = 74.0;
  double v36 = 44.5;
  double v37 = 68.5;
  uint64_t v46 = 0x4048000000000000;
LABEL_57:
  double v38 = *(double *)&v46;
LABEL_58:
  [(SBAppSwitcherSettings *)self setGridSwitcherHorizontalInterpageSpacingLandscape:v38];
  [(SBAppSwitcherSettings *)self setGridSwitcherVerticalNaturalSpacingLandscape:v37];
  [(SBAppSwitcherSettings *)self setGridSwitcherHorizontalInterpageSpacingPortrait:v36];
  [(SBAppSwitcherSettings *)self setGridSwitcherVerticalNaturalSpacingPortrait:v35];
  [(SBAppSwitcherSettings *)self setGridSwitcherSnapToControlCenterHeightSlop:v34];
  [(SBAppSwitcherSettings *)self setGridSwitcherSwipeUpNormalizedRubberbandingRange:0.6];
  [(SBAppSwitcherSettings *)self setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:0.25];
  [(SBAppSwitcherSettings *)self setGridSwitcherSwipeUpMinimumScale:0.9];
  [(SBAppSwitcherSettings *)self setGridSwitcherHomeButtonDeviceCardCornerRadius:7.0];
  [(SBAppSwitcherSettings *)self setAppExposeNonFloatingSingleRowScale:0.42];
  [(SBAppSwitcherSettings *)self gridSwitcherPageScale];
  -[SBAppSwitcherSettings setAppExposeNonFloatingDoubleRowScale:](self, "setAppExposeNonFloatingDoubleRowScale:");
  [(SBAppSwitcherSettings *)self setAppExposeFloatingDoubleRowScale:0.6];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_60;
    }
LABEL_65:
    [(SBAppSwitcherSettings *)self setNumberOfSnapshotsToCacheInSwitcher:12];
    [(SBAppSwitcherSettings *)self setNumberOfSnapshotsToAlwaysKeepAround:7];
    goto LABEL_79;
  }
  v49 = [MEMORY[0x1E4F42948] currentDevice];
  v2 = (void *)[v49 userInterfaceIdiom];

  if (v2 == (void *)1) {
    goto LABEL_65;
  }
LABEL_60:
  [(SBAppSwitcherSettings *)self setNumberOfSnapshotsToAlwaysKeepAround:0];
  int v47 = __sb__runningInSpringBoard();
  char v48 = v47;
  if (v47)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_77;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {

LABEL_77:
      v55 = self;
      uint64_t v56 = 9;
      goto LABEL_78;
    }
  }
  int v50 = __sb__runningInSpringBoard();
  char v51 = v50;
  if (v50)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v53 = v52;
  double v54 = *(double *)(MEMORY[0x1E4FA6E50] + 56);
  if ((v51 & 1) == 0) {

  }
  if ((v48 & 1) == 0) {
  if (v53 < v54)
  }
    goto LABEL_77;
  v55 = self;
  uint64_t v56 = 7;
LABEL_78:
  [(SBAppSwitcherSettings *)v55 setNumberOfSnapshotsToCacheInSwitcher:v56];
LABEL_79:
  [(SBAppSwitcherSettings *)self _spacingBetweenLeadingEdgeAndIcon];
  -[SBAppSwitcherSettings setSpacingBetweenLeadingEdgeAndIcon:](self, "setSpacingBetweenLeadingEdgeAndIcon:");
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_81;
    }
LABEL_87:
    [(SBAppSwitcherSettings *)self setSpacingBetweenTrailingEdgeAndLabels:8.0];
    double v58 = 16.0;
LABEL_98:
    double v62 = 29.0;
    goto LABEL_99;
  }
  v57 = [MEMORY[0x1E4F42948] currentDevice];
  v2 = (void *)[v57 userInterfaceIdiom];

  if (v2 == (void *)1) {
    goto LABEL_87;
  }
LABEL_81:
  if (!__sb__runningInSpringBoard())
  {
    v59 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v59 userInterfaceIdiom])
    {
    }
    else
    {
      v2 = (void *)SBFEffectiveHomeButtonType();

      if (v2 == (void *)2) {
        goto LABEL_91;
      }
    }
LABEL_97:
    [(SBAppSwitcherSettings *)self setSpacingBetweenTrailingEdgeAndLabels:14.0];
    double v58 = 9.0;
    goto LABEL_98;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
    || SBFEffectiveHomeButtonType() != 2)
  {
    goto LABEL_97;
  }
LABEL_91:
  [(SBAppSwitcherSettings *)self setSpacingBetweenTrailingEdgeAndLabels:24.0];
  int v60 = __sb__runningInSpringBoard();
  char v61 = v60;
  if (v60)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_130;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v61) {
        goto LABEL_130;
      }
      goto LABEL_122;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_122:

      goto LABEL_130;
    }
  }
  int v69 = __sb__runningInSpringBoard();
  char v70 = v69;
  if (v69)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v72 = v71;
  double v73 = *(double *)(MEMORY[0x1E4FA6E50] + 136);
  if ((v70 & 1) == 0) {

  }
  if ((v61 & 1) == 0) {
  if (v72 >= v73)
  }
  {
    double v58 = 8.0;
    double v62 = 28.0;
    goto LABEL_99;
  }
LABEL_130:
  double v58 = 8.0;
  double v62 = 26.0;
LABEL_99:
  [(SBAppSwitcherSettings *)self setIconSideLength:v62];
  [(SBAppSwitcherSettings *)self setMultipleWindowsIndicatorSideLength:v62];
  [(SBAppSwitcherSettings *)self setSpacingBetweenSnapshotAndIcon:v58];
  [(SBAppSwitcherSettings *)self setSpacingBetweenSnapshotAndDescriptionLabelBaseline:16.0];
  [(SBAppSwitcherSettings *)self setSpacingBetweenTitleAndSubtitleBaseline:18.0];
  [(SBAppSwitcherSettings *)self setSpacingBetweenIconAndLabel:8.0];
  [(SBAppSwitcherSettings *)self setSpacingBetweenLabelAndMultipleWindowsIndicator:8.0];
  [(SBAppSwitcherSettings *)self setSpacingBetweenLabelAndSecondIcon:21.0];
  [(SBAppSwitcherSettings *)self setSpacingBetweenBoundsCenterAndSecondIcon:3.0];
  [(SBAppSwitcherSettings *)self setSimplicityOptions:0];
  [(SBAppSwitcherSettings *)self setUseAsynchronousRendering:1];
  [(SBAppSwitcherSettings *)self setShouldRoundCornersDuringSwipeUp:1];
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_100:
    double v63 = 5.0;
    goto LABEL_101;
  }
  if (__sb__runningInSpringBoard())
  {
    int v64 = SBFEffectiveDeviceClass();
    double v63 = 0.0;
    if (v64 == 2) {
      goto LABEL_100;
    }
  }
  else
  {
    v66 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v67 = [v66 userInterfaceIdiom];

    double v63 = 0.0;
    if (v67 == 1) {
      goto LABEL_100;
    }
  }
LABEL_101:
  [(SBAppSwitcherSettings *)self setAsynchronousRenderingDisableSurfaceCacheDelayDuration:v63];
  [(SBAppSwitcherSettings *)self setPreventMedusaSnapshotsAfterTransitionDuration:1.5];
  [(SBAppSwitcherSettings *)self setCoplanarSpacingPhone:24.0];
  [(SBAppSwitcherSettings *)self setCoplanarSpacingPad:48.0];
  [(SBAppSwitcherSettings *)self setLiveResizeSceneUpdateDistanceThreshold:80.0];
  [(SBAppSwitcherSettings *)self setLiveResizeSceneUpdateTimeThresholdSeconds:0.08];
  [(SBAppSwitcherSettings *)self setLiveResizeUsesGrid:0];
  [(SBAppSwitcherSettings *)self setLiveResizeGridRubberbandingRange:200.0];
  [(SBAppSwitcherSettings *)self setLiveResizeGridMinimumWidth:100.0];
  [(SBAppSwitcherSettings *)self setLiveResizeGridMinimumHeight:300.0];
  [(SBAppSwitcherSettings *)self setLiveResizeSendsAnimatedSceneSizeUpdates:0];
  [(SBAppSwitcherSettings *)self setLiveResizePointerInteractionRegionOuterLength:12.5];
  [(SBAppSwitcherSettings *)self setLiveResizePointerInteractionRegionInnerLength:5.0];
  [(SBAppSwitcherSettings *)self setSnapshotAspectRatioAcceptanceThreshold:0.1];
  [(SBAppSwitcherSettings *)self setSwitcherStyle:0];
  [(SBAppSwitcherSettings *)self setDeckSwitcherPageScale:0.75];
  [(SBAppSwitcherSettings *)self setDeckSwitcherDecelerationRate:0.993];
  [(SBAppSwitcherSettings *)self setAExpLayoutCoeff:-18.0];
  [(SBAppSwitcherSettings *)self setBExpLayoutCoeff:9.0];
  [(SBAppSwitcherSettings *)self setDepthPadding:0.13];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_115;
    }
LABEL_114:
    [(SBAppSwitcherSettings *)self setDeckSwitcherPageScale:0.7];
    [(SBAppSwitcherSettings *)self setAExpLayoutCoeff:-28.0];
    [(SBAppSwitcherSettings *)self setBExpLayoutCoeff:8.5];
    [(SBAppSwitcherSettings *)self setDepthPadding:0.123];
    goto LABEL_115;
  }
  v65 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v65 userInterfaceIdiom])
  {

    goto LABEL_115;
  }
  uint64_t v68 = SBFEffectiveHomeButtonType();

  if (v68 == 2) {
    goto LABEL_114;
  }
LABEL_115:
  [(SBAppSwitcherSettings *)self setUseTitleOpacityPrototypeSettings:0];
  [(SBAppSwitcherSettings *)self setTitleOpacityACoeff:0.16];
  [(SBAppSwitcherSettings *)self setTitleOpacityBCoeff:8.0];
  [(SBAppSwitcherSettings *)self setTitleOpacityCCoeff:0.023];
  [(SBAppSwitcherSettings *)self setTitleOpacityDCoeff:40.0];
  [(SBAppSwitcherSettings *)self setOffscreenCardScaleForFlyIn:0.8];
  [(SBAppSwitcherSettings *)self setShouldRedactWindowContents:0];
  [(SBAppSwitcherSettings *)self setShowModifierDebugLabel:0];
  [(SBAppSwitcherSettings *)self setShowMainModifierTimeline:0];
  [(SBAppSwitcherSettings *)self setShowLockedModifierTimeline:0];
  [(SBAppSwitcherSettings *)self setShouldDisableSwitcherModelUpdatesForDemo:0];
}

+ (id)settingsControllerModule
{
  v397[1] = *MEMORY[0x1E4F143B8];
  v367 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Sliders/Floats" valueKeyPath:@"showFloats"];
  v321 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showFloats == YES"];
  v368 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showFloats == NO"];
  v308 = [MEMORY[0x1E4F94138] rowWithTitle:@"Animation Settings" childSettingsKeyPath:@"animationSettings"];
  v2 = (void *)MEMORY[0x1E4F94168];
  v397[0] = v308;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v397 count:1];
  v366 = [v2 sectionWithRows:v3];

  v307 = [MEMORY[0x1E4F94138] rowWithTitle:@"Chamois Settings" childSettingsKeyPath:@"chamoisSettings"];
  uint64_t v4 = (void *)MEMORY[0x1E4F94168];
  v396 = v307;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v396 count:1];
  v365 = [v4 sectionWithRows:v5];

  v306 = [MEMORY[0x1E4F94138] rowWithTitle:@"System Aperture Settings" childSettingsKeyPath:@"systemApertureSettings"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v395 = v306;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v395 count:1];
  v364 = [v6 sectionWithRows:v7];

  v305 = [MEMORY[0x1E4F94138] rowWithTitle:@"Floating Switcher Settings" childSettingsKeyPath:@"floatingSwitcherSettings"];
  v8 = (void *)MEMORY[0x1E4F94168];
  v394 = v305;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v394 count:1];
  v363 = [v8 sectionWithRows:v9];

  v304 = [MEMORY[0x1E4F94138] rowWithTitle:@"Center Window Sizing Settings" childSettingsKeyPath:@"centerWindowSizingSettings"];
  v10 = (void *)MEMORY[0x1E4F94168];
  v393 = v304;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v393 count:1];
  v362 = [v10 sectionWithRows:v11];

  v303 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scene Relevancy Settings" childSettingsKeyPath:@"sceneRelevancySettings"];
  double v12 = (void *)MEMORY[0x1E4F94168];
  v392 = v303;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v392 count:1];
  v361 = [v12 sectionWithRows:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F94138];
  double v15 = NSStringFromSelector(sel_dashboardHomeGestureSettings);
  v302 = [v14 rowWithTitle:@"Dashboard Home Gesture Settings" childSettingsKeyPath:v15];

  v16 = (void *)MEMORY[0x1E4F94168];
  v391 = v302;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v391 count:1];
  v360 = [v16 sectionWithRows:v17 title:@"Dashboard Settings"];

  double v18 = (void *)MEMORY[0x1E4F94168];
  v19 = (void *)MEMORY[0x1E4F94140];
  uint64_t v20 = NSStringFromSelector(sel_liveResizeSceneUpdateDistanceThreshold);
  double v21 = [v19 rowWithTitle:@"Live Resize Distance Threshold for Scene Size Update" valueKeyPath:v20];
  int v22 = [v21 between:0.0 and:1000.0];
  v390[0] = v22;
  double v23 = (void *)MEMORY[0x1E4F94140];
  v24 = NSStringFromSelector(sel_liveResizeSceneUpdateTimeThresholdSeconds);
  uint64_t v25 = [v23 rowWithTitle:@"Live Resize Pause Threshold for Scene Size Update (seconds)" valueKeyPath:v24];
  double v26 = [v25 precision:3];
  int v27 = [v26 between:0.0 and:5.0];
  v390[1] = v27;
  char v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v390 count:2];
  v359 = [v18 sectionWithRows:v28 title:@"Live Resize"];

  v357 = (void *)MEMORY[0x1E4F94168];
  int v29 = (void *)MEMORY[0x1E4F941E8];
  v355 = NSStringFromSelector(sel_liveResizeUsesGrid);
  v353 = [v29 rowWithTitle:@"Live Resizes Uses Grid" valueKeyPath:v355];
  v389[0] = v353;
  char v30 = (void *)MEMORY[0x1E4F94140];
  v351 = NSStringFromSelector(sel_liveResizeGridRubberbandingRange);
  v348 = [v30 rowWithTitle:@"Live Resize Grid Rubberbanding Range" valueKeyPath:v351];
  v345 = [v348 precision:0];
  double v31 = [v345 between:0.0 and:500.0];
  v389[1] = v31;
  double v32 = (void *)MEMORY[0x1E4F94140];
  double v33 = NSStringFromSelector(sel_liveResizeGridMinimumWidth);
  double v34 = [v32 rowWithTitle:@"Live Resize Grid Minimum Width" valueKeyPath:v33];
  double v35 = [v34 precision:0];
  double v36 = [v35 between:0.0 and:1500.0];
  v389[2] = v36;
  double v37 = (void *)MEMORY[0x1E4F94140];
  double v38 = NSStringFromSelector(sel_liveResizeGridMinimumHeight);
  int v39 = [v37 rowWithTitle:@"Live Resize Grid Minimum Height" valueKeyPath:v38];
  char v40 = [v39 precision:0];
  int v41 = [v40 between:0.0 and:1500.0];
  v389[3] = v41;
  char v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v389 count:4];
  v358 = [v357 sectionWithRows:v42 title:@"Live Resize On Grid"];

  double v43 = (void *)MEMORY[0x1E4F94168];
  double v44 = (void *)MEMORY[0x1E4F941E8];
  double v45 = NSStringFromSelector(sel_liveResizeSendsAnimatedSceneSizeUpdates);
  uint64_t v46 = [v44 rowWithTitle:@"Send Animated Scene Size Updates" valueKeyPath:v45];
  v388 = v46;
  int v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v388 count:1];
  v356 = [v43 sectionWithRows:v47 title:@"Live Resize With Animation"];

  char v48 = (void *)MEMORY[0x1E4F94168];
  v49 = (void *)MEMORY[0x1E4F94140];
  int v50 = NSStringFromSelector(sel_liveResizePointerInteractionRegionOuterLength);
  char v51 = [v49 rowWithTitle:@"Live Resize Pointer Interaction Region Outer Length" valueKeyPath:v50];
  double v52 = [v51 precision:0];
  double v53 = [v52 between:1.0 and:1500.0];
  v387[0] = v53;
  double v54 = (void *)MEMORY[0x1E4F94140];
  v55 = NSStringFromSelector(sel_liveResizePointerInteractionRegionInnerLength);
  uint64_t v56 = [v54 rowWithTitle:@"Live Resize Pointer Interaction Region Inner Length" valueKeyPath:v55];
  v57 = [v56 precision:0];
  double v58 = [v57 between:1.0 and:1500.0];
  v387[1] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v387 count:2];
  v354 = [v48 sectionWithRows:v59 title:@"Live Resize Pointer Interaction"];

  int v60 = (void *)MEMORY[0x1E4F94168];
  char v61 = (void *)MEMORY[0x1E4F94140];
  double v62 = NSStringFromSelector(sel_snapshotAspectRatioAcceptanceThreshold);
  double v63 = [v61 rowWithTitle:@"Snapshot Aspect Ratio Acceptance Threshold" valueKeyPath:v62];
  int v64 = [v63 precision:2];
  v65 = [v64 between:0.0 and:1.0];
  v386 = v65;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v386 count:1];
  v352 = [v60 sectionWithRows:v66 title:@"Snapshots"];

  v349 = (void *)MEMORY[0x1E4F94168];
  v346 = [MEMORY[0x1E4F94110] rowWithTitle:@"Switcher" valueKeyPath:@"switcherStyle"];
  v342 = [v346 possibleValues:&unk_1F3348390 titles:&unk_1F3348378];
  v385[0] = v342;
  uint64_t v67 = (void *)MEMORY[0x1E4F941E0];
  v338 = NSStringFromSelector(sel_switcherCardScaleWhileTouched);
  uint64_t v68 = [v67 rowWithTitle:@"Scale When Touched/Dragged" valueKeyPath:v338];
  int v69 = [v68 minValue:0.9 maxValue:1.1];
  v385[1] = v69;
  char v70 = (void *)MEMORY[0x1E4F941E0];
  double v71 = NSStringFromSelector(sel_switcherCardScaleWhileCursorHovered);
  double v72 = [v70 rowWithTitle:@"Scale When Cursor Hovers" valueKeyPath:v71];
  double v73 = [v72 minValue:0.9 maxValue:1.1];
  v385[2] = v73;
  v74 = (void *)MEMORY[0x1E4F94140];
  v75 = NSStringFromSelector(sel_switcherCardScaleWhileCursorHovered);
  v76 = [v74 rowWithTitle:&stru_1F3084718 valueKeyPath:v75];
  v77 = [v76 precision:4];
  v78 = [v77 between:0.9 and:1.1];
  v385[3] = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v385 count:4];
  v350 = [v349 sectionWithRows:v79 title:@"Card Style"];

  v80 = (void *)MEMORY[0x1E4F94168];
  v81 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shadow Radius" valueKeyPath:@"switcherCardShadowRadius"];
  v82 = [v81 minValue:0.0 maxValue:50.0];
  v384[0] = v82;
  v83 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shadow Opacity" valueKeyPath:@"switcherCardShadowOpacity"];
  v84 = [v83 minValue:0.0 maxValue:0.5];
  v384[1] = v84;
  v85 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shadow Horizontal Offset" valueKeyPath:@"switcherCardShadowOffsetHorizontal"];
  v86 = [v85 minValue:0.0 maxValue:60.0];
  v384[2] = v86;
  v87 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Shadow Vertical Offset" valueKeyPath:@"switcherCardShadowOffsetVertical"];
  v88 = [v87 minValue:0.0 maxValue:60.0];
  v384[3] = v88;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v384 count:4];
  v347 = [v80 sectionWithRows:v89 title:@"Card Shadow"];

  v343 = (void *)MEMORY[0x1E4F94168];
  v90 = (void *)MEMORY[0x1E4F941E0];
  v339 = NSStringFromSelector(sel_switcherCardShadowRadiusWhileTouched);
  v336 = [v90 rowWithTitle:@"Shadow Radius When Touched" valueKeyPath:v339];
  v333 = [v336 minValue:0.0 maxValue:50.0];
  v383[0] = v333;
  v91 = (void *)MEMORY[0x1E4F941E0];
  v92 = NSStringFromSelector(sel_switcherCardShadowOpacityWhileTouched);
  v93 = [v91 rowWithTitle:@"Shadow Opacity When Touched" valueKeyPath:v92];
  v94 = [v93 minValue:0.0 maxValue:1.0];
  v383[1] = v94;
  v95 = (void *)MEMORY[0x1E4F941E0];
  v96 = NSStringFromSelector(sel_switcherCardShadowOffsetHorizontalWhileTouched);
  v97 = [v95 rowWithTitle:@"Shadow Horizontal Offset When Touched" valueKeyPath:v96];
  v98 = [v97 minValue:0.0 maxValue:60.0];
  v383[2] = v98;
  v99 = (void *)MEMORY[0x1E4F941E0];
  v100 = NSStringFromSelector(sel_switcherCardShadowOffsetVerticalWhileTouched);
  v101 = [v99 rowWithTitle:@"Shadow Vertical Offset When Touched" valueKeyPath:v100];
  v102 = [v101 minValue:0.0 maxValue:60.0];
  v383[3] = v102;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v383 count:4];
  v344 = [v343 sectionWithRows:v103 title:@"Card Shadow When Touched/Dragged"];

  v340 = (void *)MEMORY[0x1E4F94168];
  v104 = (void *)MEMORY[0x1E4F941E0];
  v105 = NSStringFromSelector(sel_cursorHoverShadowRadiusInterpolationAmount);
  v106 = [v104 rowWithTitle:@"Shadow Radius Interpolation Amount" valueKeyPath:v105];
  v107 = [v106 minValue:0.0 maxValue:1.0];
  v382[0] = v107;
  v108 = (void *)MEMORY[0x1E4F941E0];
  v109 = NSStringFromSelector(sel_cursorHoverShadowOpacityInterpolationAmount);
  v110 = [v108 rowWithTitle:@"Shadow Opacity Interpolation Amount" valueKeyPath:v109];
  v111 = [v110 minValue:0.0 maxValue:1.0];
  v382[1] = v111;
  v112 = (void *)MEMORY[0x1E4F941E0];
  v113 = NSStringFromSelector(sel_cursorHoverShadowOffsetInterpolationAmount);
  v114 = [v112 rowWithTitle:@"Shadow Offset Interpolation Amount" valueKeyPath:v113];
  v115 = [v114 minValue:0.0 maxValue:1.0];
  v382[2] = v115;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v382 count:3];
  v341 = [v340 sectionWithRows:v116 title:@"Hover Shadow Interpolation Amount"];

  v117 = (void *)MEMORY[0x1E4F94168];
  v118 = (void *)MEMORY[0x1E4F941E0];
  v119 = NSStringFromSelector(sel_peekInsetWidth);
  v120 = [v118 rowWithTitle:@"Peek Inset From Edge" valueKeyPath:v119];
  v121 = [v120 minValue:0.0 maxValue:100.0];
  v381 = v121;
  v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v381 count:1];
  v337 = [v117 sectionWithRows:v122 title:@"Peek"];

  v334 = (void *)MEMORY[0x1E4F94168];
  v123 = (void *)MEMORY[0x1E4F941E0];
  v124 = NSStringFromSelector(sel_tintStyleDimmingAlphaInFocusForDarkMode);
  v125 = [v123 rowWithTitle:@"Tint style dimming alpha in-focus for dark mode" valueKeyPath:v124];
  v126 = [v125 minValue:0.0 maxValue:1.0];
  v380[0] = v126;
  v127 = (void *)MEMORY[0x1E4F941E0];
  v128 = NSStringFromSelector(sel_tintStyleDimmingAlphaUnFocusForDarkMode);
  v129 = [v127 rowWithTitle:@"Tint style dimming alpha un-focus for dark mode" valueKeyPath:v128];
  v130 = [v129 minValue:0.0 maxValue:1.0];
  v380[1] = v130;
  v131 = (void *)MEMORY[0x1E4F941E0];
  v132 = NSStringFromSelector(sel_tintStyleDimmingAlphaInFocusForLightMode);
  v133 = [v131 rowWithTitle:@"Tint style dimming alpha in-focus for light mode" valueKeyPath:v132];
  v134 = [v133 minValue:0.0 maxValue:1.0];
  v380[2] = v134;
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v380 count:3];
  v335 = [v334 sectionWithRows:v135 title:@"Shelf"];

  v136 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale Slope" valueKeyPath:@"mScale"];
  v137 = [v136 minValue:0.0 maxValue:2.0];
  v332 = [v137 condition:v368];

  v138 = [MEMORY[0x1E4F94140] rowWithTitle:@"Scale Slope" valueKeyPath:@"mScale"];
  v331 = [v138 condition:v321];

  [v331 setPrecision:6];
  v139 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Center Point" valueKeyPath:@"centerPoint"];
  v140 = [v139 minValue:0.0 maxValue:1.0];
  v330 = [v140 condition:v368];

  v141 = [MEMORY[0x1E4F94140] rowWithTitle:@"Center Point" valueKeyPath:@"centerPoint"];
  v329 = [v141 condition:v321];

  [v329 setPrecision:6];
  v142 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Max Scale" valueKeyPath:@"maxScale"];
  v143 = [v142 minValue:0.0 maxValue:1.5];
  v328 = [v143 condition:v368];

  v144 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Scale" valueKeyPath:@"maxScale"];
  v327 = [v144 condition:v321];

  [v327 setPrecision:6];
  v145 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Alpha Slope" valueKeyPath:@"mAlpha"];
  v146 = [v145 minValue:0.0 maxValue:2.0];
  v326 = [v146 condition:v368];

  v147 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alpha Slope" valueKeyPath:@"mAlpha"];
  v325 = [v147 condition:v321];

  [v325 setPrecision:6];
  v148 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Alpha Offset" valueKeyPath:@"bAlpha"];
  v149 = [v148 minValue:0.0 maxValue:1.0];
  v324 = [v149 condition:v368];

  v150 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alpha Offset" valueKeyPath:@"bAlpha"];
  v323 = [v150 condition:v321];

  [v323 setPrecision:6];
  v151 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Darkening Slope" valueKeyPath:@"mDarkening"];
  v152 = [v151 minValue:0.0 maxValue:2.0];
  v322 = [v152 condition:v368];

  v153 = [MEMORY[0x1E4F94140] rowWithTitle:@"Darkening Slope" valueKeyPath:@"mDarkening"];
  v154 = [v153 condition:v321];

  [v154 setPrecision:6];
  v155 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Darkening Offset" valueKeyPath:@"bDarkening"];
  v156 = [v155 minValue:0.0 maxValue:2.0];
  v301 = [v156 condition:v368];

  v157 = [MEMORY[0x1E4F94140] rowWithTitle:@"Darkening Offset" valueKeyPath:@"bDarkening"];
  v158 = [v157 condition:v321];

  v300 = v158;
  [v158 setPrecision:6];
  v159 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Max Darkening" valueKeyPath:@"maxDarkening"];
  v160 = [v159 minValue:0.0 maxValue:2.0];
  v299 = [v160 condition:v368];

  v161 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Darkening" valueKeyPath:@"maxDarkening"];
  v162 = [v161 condition:v321];

  v298 = v162;
  [v162 setPrecision:6];
  v163 = (void *)MEMORY[0x1E4F94168];
  v379[0] = v332;
  v379[1] = v331;
  v379[2] = v330;
  v379[3] = v329;
  v379[4] = v328;
  v379[5] = v327;
  v379[6] = v326;
  v379[7] = v325;
  v379[8] = v324;
  v379[9] = v323;
  v379[10] = v299;
  v379[11] = v322;
  v379[12] = v154;
  v379[13] = v301;
  v379[14] = v158;
  v379[15] = v162;
  v164 = [MEMORY[0x1E4F1C978] arrayWithObjects:v379 count:16];
  v315 = [v163 sectionWithRows:v164];

  v165 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Grid Page Scale" valueKeyPath:@"gridSwitcherPageScale"];
  v166 = [v165 minValue:0.1 maxValue:0.5];
  v320 = [v166 condition:v368];

  v167 = [MEMORY[0x1E4F94140] rowWithTitle:@"Grid Page Scale" valueKeyPath:@"gridSwitcherPageScale"];
  v319 = [v167 condition:v321];

  [v319 setPrecision:6];
  v168 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Horiz. Spacing Landscape" valueKeyPath:@"gridSwitcherHorizontalInterpageSpacingLandscape"];
  v169 = [v168 minValue:0.0 maxValue:100.0];
  v318 = [v169 condition:v368];

  v170 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horiz. Spacing Landscape" valueKeyPath:@"gridSwitcherHorizontalInterpageSpacingLandscape"];
  v317 = [v170 condition:v321];

  [v317 setPrecision:6];
  v171 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Vert. Nat. Spacing Landscape" valueKeyPath:@"gridSwitcherVerticalNaturalSpacingLandscape"];
  v172 = [v171 minValue:0.0 maxValue:150.0];
  v316 = [v172 condition:v368];

  v173 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vert. Nat. Spacing Landscape" valueKeyPath:@"gridSwitcherVerticalNaturalSpacingLandscape"];
  v314 = [v173 condition:v321];

  [v314 setPrecision:6];
  v174 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Horiz. Spacing Portrait" valueKeyPath:@"gridSwitcherHorizontalInterpageSpacingPortrait"];
  v175 = [v174 minValue:0.0 maxValue:100.0];
  v313 = [v175 condition:v368];

  v176 = [MEMORY[0x1E4F94140] rowWithTitle:@"Horiz. Spacing Portrait" valueKeyPath:@"gridSwitcherHorizontalInterpageSpacingPortrait"];
  v312 = [v176 condition:v321];

  [v312 setPrecision:6];
  v177 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Vert. Nat. Spacing Portrait" valueKeyPath:@"gridSwitcherVerticalNaturalSpacingPortrait"];
  v178 = [v177 minValue:0.0 maxValue:200.0];
  v297 = [v178 condition:v368];

  v179 = [MEMORY[0x1E4F94140] rowWithTitle:@"Vert. Nat. Spacing Portrait" valueKeyPath:@"gridSwitcherVerticalNaturalSpacingPortrait"];
  v180 = [v179 condition:v321];

  [v180 setPrecision:6];
  v181 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Snap To CC Height Slop" valueKeyPath:@"gridSwitcherSnapToControlCenterHeightSlop"];
  v182 = [v181 minValue:0.0 maxValue:60.0];
  v296 = [v182 condition:v368];

  v183 = [MEMORY[0x1E4F94140] rowWithTitle:@"Snap To CC Height Slop" valueKeyPath:@"gridSwitcherSnapToControlCenterHeightSlop"];
  v184 = [v183 condition:v321];

  v295 = v184;
  [v184 setPrecision:6];
  v185 = [MEMORY[0x1E4F94140] rowWithTitle:@"Swipe Up Rubberbanding Range (% of screen height)" valueKeyPath:@"gridSwitcherSwipeUpNormalizedRubberbandingRange"];
  v294 = [v185 between:0.0 and:1.0];

  v186 = [MEMORY[0x1E4F94140] rowWithTitle:@"Swipe Up Rubberbanded Translation at Minimum Scale (% of screen height)" valueKeyPath:@"gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale"];
  v293 = [v186 between:0.0 and:1.0];

  v187 = [MEMORY[0x1E4F94140] rowWithTitle:@"Swipe Up Minimum Scale" valueKeyPath:@"gridSwitcherSwipeUpMinimumScale"];
  v292 = [v187 between:0.0 and:1.0];

  v188 = (void *)MEMORY[0x1E4F94168];
  v378[0] = v367;
  v378[1] = v320;
  v378[2] = v319;
  v378[3] = v318;
  v378[4] = v317;
  v378[5] = v316;
  v378[6] = v314;
  v378[7] = v313;
  v378[8] = v312;
  v378[9] = v297;
  v378[10] = v180;
  v378[11] = v296;
  v378[12] = v184;
  v378[13] = v294;
  v378[14] = v293;
  v378[15] = v292;
  v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:v378 count:16];
  v311 = [v188 sectionWithRows:v189 title:@"Grid Layout"];

  v190 = [MEMORY[0x1E4F94140] rowWithTitle:@"Non Floating Single Row Scale" valueKeyPath:@"appExposeNonFloatingSingleRowScale"];
  v291 = [v190 precision:0];

  v191 = [MEMORY[0x1E4F94140] rowWithTitle:@"Non Floating Gridified Scale" valueKeyPath:@"appExposeNonFloatingDoubleRowScale"];
  v290 = [v191 precision:0];

  v192 = [MEMORY[0x1E4F94140] rowWithTitle:@"Floating Gridified Scale" valueKeyPath:@"appExposeFloatingDoubleRowScale"];
  v289 = [v192 precision:0];

  v193 = (void *)MEMORY[0x1E4F94168];
  v377[0] = v291;
  v377[1] = v290;
  v377[2] = v289;
  v194 = [MEMORY[0x1E4F1C978] arrayWithObjects:v377 count:3];
  v310 = [v193 sectionWithRows:v194 title:@"App Expose"];

  v288 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Use Asynchronous Rendering" valueKeyPath:@"useAsynchronousRendering"];
  v287 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Round Corners During Swipe Up" valueKeyPath:@"shouldRoundCornersDuringSwipeUp"];
  v195 = [MEMORY[0x1E4F94140] rowWithTitle:@"Asynchronous Rendering Disable Surface Cache Delay" valueKeyPath:@"asynchronousRenderingDisableSurfaceCacheDelayDuration"];
  v196 = [v195 precision:0];
  v286 = [v196 between:0.0 and:20.0];

  v197 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prevent Medusa Snapshots After Transition Duration" valueKeyPath:@"preventMedusaSnapshotsAfterTransitionDuration"];
  v198 = [v197 precision:0];
  v285 = [v198 between:0.0 and:20.0];

  v199 = (void *)MEMORY[0x1E4F94168];
  v376[0] = v288;
  v376[1] = v287;
  v376[2] = v286;
  v376[3] = v285;
  v200 = [MEMORY[0x1E4F1C978] arrayWithObjects:v376 count:4];
  v309 = [v199 sectionWithRows:v200];

  v201 = [MEMORY[0x1E4F94140] rowWithTitle:@"Deck Page Scale" valueKeyPath:@"deckSwitcherPageScale"];
  v202 = [v201 between:0.1 and:1.0];
  v284 = [v202 precision:2];

  v203 = [MEMORY[0x1E4F94140] rowWithTitle:@"Deck Deceleration Rate" valueKeyPath:@"deckSwitcherDecelerationRate"];
  v204 = [v203 between:0.1 and:1.0];
  v283 = [v204 precision:3];

  v205 = [MEMORY[0x1E4F94140] rowWithTitle:@"Translation" valueKeyPath:@"aExpLayoutCoeff"];
  v206 = [v205 between:-220.0 and:120.0];
  v282 = [v206 precision:2];

  v207 = [MEMORY[0x1E4F94140] rowWithTitle:@"Curve Exponent" valueKeyPath:@"bExpLayoutCoeff"];
  v208 = [v207 between:0.0 and:30.0];
  v281 = [v208 precision:2];

  v209 = [MEMORY[0x1E4F94140] rowWithTitle:@"Depth Padding" valueKeyPath:@"depthPadding"];
  v210 = [v209 between:0.001 and:0.2];
  v280 = [v210 precision:3];

  v211 = [MEMORY[0x1E4F94140] rowWithTitle:@"Offscreen Card Scale for Fly In" valueKeyPath:@"offscreenCardScaleForFlyIn"];
  v212 = [v211 between:0.01 and:1.0];
  v279 = [v212 precision:2];

  v213 = (void *)MEMORY[0x1E4F94168];
  v375[0] = v284;
  v375[1] = v283;
  v375[2] = v282;
  v375[3] = v281;
  v375[4] = v280;
  v375[5] = v279;
  v214 = [MEMORY[0x1E4F1C978] arrayWithObjects:v375 count:6];
  v275 = [v213 sectionWithRows:v214 title:@"Deck Switcher Layout"];

  v278 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enabled" valueKeyPath:@"useTitleOpacityPrototypeSettings"];
  v215 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Title Opacity A" valueKeyPath:@"titleOpacityACoeff"];
  v277 = [v215 minValue:0.0 maxValue:0.5];

  v216 = [MEMORY[0x1E4F94140] rowWithTitle:@"Title Opacity A" valueKeyPath:@"titleOpacityACoeff"];
  v217 = [v216 between:0.0 and:0.1];

  v276 = v217;
  [v217 setPrecision:6];
  v218 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Title Opacity B" valueKeyPath:@"titleOpacityBCoeff"];
  v274 = [v218 minValue:0.0 maxValue:50.0];

  v219 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Title Opacity C" valueKeyPath:@"titleOpacityCCoeff"];
  v273 = [v219 minValue:0.0 maxValue:0.04];

  v272 = [MEMORY[0x1E4F94140] rowWithTitle:@"Title Opacity C" valueKeyPath:@"titleOpacityCCoeff"];
  v220 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Title Opacity D" valueKeyPath:@"titleOpacityDCoeff"];
  v271 = [v220 minValue:20.0 maxValue:200.0];

  [v272 setPrecision:6];
  v221 = (void *)MEMORY[0x1E4F94168];
  v374[0] = v278;
  v374[1] = v277;
  v374[2] = v217;
  v374[3] = v274;
  v374[4] = v273;
  v374[5] = v272;
  v374[6] = v271;
  v222 = [MEMORY[0x1E4F1C978] arrayWithObjects:v374 count:7];
  v265 = [v221 sectionWithRows:v222 title:@"Title Opacity"];

  v270 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Redact Window Contents" valueKeyPath:@"shouldRedactWindowContents"];
  v269 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Modifier Debug Label" valueKeyPath:@"showModifierDebugLabel"];
  v268 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Main Modifier Timeline" valueKeyPath:@"showMainModifierTimeline"];
  v267 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Floating Modifier Timeline" valueKeyPath:@"showFloatingModifierTimeline"];
  v266 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Show Locked Modifier Timeline" valueKeyPath:@"showLockedModifierTimeline"];
  v223 = (void *)MEMORY[0x1E4F94168];
  v373[0] = v270;
  v373[1] = v269;
  v373[2] = v268;
  v373[3] = v267;
  v373[4] = v266;
  v224 = [MEMORY[0x1E4F1C978] arrayWithObjects:v373 count:5];
  v264 = [v223 sectionWithRows:v224];

  v225 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Snapshots" valueKeyPath:@"simplicityOptionNoSnapshots"];
  v263 = [v225 valueValidator:&__block_literal_global_308];

  v226 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Crossfade" valueKeyPath:@"simplicityOptionNoCrossfade"];
  v262 = [v226 valueValidator:&__block_literal_global_521];

  v227 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Labels" valueKeyPath:@"simplicityOptionNoLabels"];
  v261 = [v227 valueValidator:&__block_literal_global_523];

  v228 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Icons" valueKeyPath:@"simplicityOptionNoIcons"];
  v260 = [v228 valueValidator:&__block_literal_global_525];

  v229 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Blurs" valueKeyPath:@"simplicityOptionNoBlurs"];
  v259 = [v229 valueValidator:&__block_literal_global_527];

  v230 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Shadows" valueKeyPath:@"simplicityOptionNoShadows"];
  v258 = [v230 valueValidator:&__block_literal_global_529];

  v231 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Control Center" valueKeyPath:@"simplicityOptionNoControlCenter"];
  v257 = [v231 valueValidator:&__block_literal_global_531];

  v232 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Snapshot Bkg" valueKeyPath:@"simplicityOptionNoSnapshotBkg"];
  v256 = [v232 valueValidator:&__block_literal_global_533];

  v233 = (void *)MEMORY[0x1E4F94168];
  v372[0] = v263;
  v372[1] = v262;
  v372[2] = v261;
  v372[3] = v260;
  v372[4] = v259;
  v372[5] = v258;
  v372[6] = v257;
  v372[7] = v256;
  v234 = [MEMORY[0x1E4F1C978] arrayWithObjects:v372 count:8];
  v255 = [v233 sectionWithRows:v234 title:@"Simplicity"];

  v254 = [MEMORY[0x1E4F94100] rowWithTitle:@"Clear Switcher Model" outletKeyPath:@"clearModelOutlet"];
  v253 = [MEMORY[0x1E4F94100] rowWithTitle:@"Stash Switcher Model" outletKeyPath:@"stashModelOutlet"];
  v252 = [MEMORY[0x1E4F94100] rowWithTitle:@"Load Stashed Switcher Model" outletKeyPath:@"loadModelOutlet"];
  v251 = [MEMORY[0x1E4F94100] rowWithTitle:@"Add All Apps to Model" outletKeyPath:@"addAppsToModelOutlet"];
  v250 = [MEMORY[0x1E4F94100] rowWithTitle:@"Add Apps used in PPT tests to Model" outletKeyPath:@"addPPTAppsToModelOutlet"];
  v235 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Disable Model Updates for Demo" valueKeyPath:@"shouldDisableSwitcherModelUpdatesForDemo"];
  v236 = [v235 valueValidator:&__block_literal_global_531];

  v237 = (void *)MEMORY[0x1E4F94168];
  v371[0] = v254;
  v371[1] = v253;
  v371[2] = v252;
  v371[3] = v251;
  v371[4] = v250;
  v371[5] = v236;
  v238 = [MEMORY[0x1E4F1C978] arrayWithObjects:v371 count:6];
  v239 = [v237 sectionWithRows:v238];

  v240 = (void *)MEMORY[0x1E4F94100];
  v241 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v242 = [v240 rowWithTitle:@"Restore Defaults" action:v241];

  v243 = (void *)MEMORY[0x1E4F94168];
  v370 = v242;
  v244 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v370 count:1];
  v245 = [v243 sectionWithRows:v244];

  v246 = (void *)MEMORY[0x1E4F94168];
  v369[0] = v366;
  v369[1] = v365;
  v369[2] = v352;
  v369[3] = v364;
  v369[4] = v363;
  v369[5] = v362;
  v369[6] = v361;
  v369[7] = v360;
  v369[8] = v359;
  v369[9] = v358;
  v369[10] = v356;
  v369[11] = v354;
  v369[12] = v350;
  v369[13] = v347;
  v369[14] = v344;
  v369[15] = v341;
  v369[16] = v337;
  v369[17] = v335;
  v369[18] = v315;
  v369[19] = v309;
  v369[20] = v311;
  v369[21] = v310;
  v369[22] = v255;
  v369[23] = v275;
  v369[24] = v265;
  v369[25] = v264;
  v369[26] = v239;
  v369[27] = v245;
  v247 = [MEMORY[0x1E4F1C978] arrayWithObjects:v369 count:28];
  v248 = [v246 moduleWithTitle:@"App Switcher" contents:v247];

  return v248;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_msgSend(v5, "setSimplicityOptions:", objc_msgSend(v5, "simplicityOptions") & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v4, "BOOLValue"));

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 2;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFFDLL];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 4;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFFBLL];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 8;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFF7];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 16;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFEFLL];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 32;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFDFLL];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 64;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFFBFLL];

  return v4;
}

id __49__SBAppSwitcherSettings_settingsControllerModule__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 simplicityOptions];
  int v7 = [v4 BOOLValue];
  uint64_t v8 = 128;
  if (!v7) {
    uint64_t v8 = 0;
  }
  [v5 setSimplicityOptions:v8 | v6 & 0xFFFFFFFFFFFFFF7FLL];

  return v4;
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"simplicityOptionNoSnapshots"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoCrossfade"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoLabels"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoIcons"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoBlurs"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoShadows"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoControlCenter"] & 1) != 0
    || ([v4 isEqualToString:@"simplicityOptionNoSnapshotBkg"] & 1) != 0)
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppSwitcherSettings;
    id v5 = [(PTSettings *)&v7 archiveValueForKey:v4];
  }

  return v5;
}

- (void)setSimplicityOptions:(int64_t)a3
{
  if (self->_simplicityOptions != a3)
  {
    self->_simplicityOptions = a3;
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoSnapshots:a3 & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoCrossfade:((unint64_t)a3 >> 1) & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoLabels:((unint64_t)a3 >> 2) & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoIcons:((unint64_t)a3 >> 3) & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoBlurs:((unint64_t)a3 >> 4) & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoShadows:((unint64_t)a3 >> 5) & 1];
    [(SBAppSwitcherSettings *)self setSimplicityOptionNoControlCenter:((unint64_t)a3 >> 6) & 1];
  }
}

- (double)_spacingBetweenLeadingEdgeAndIcon
{
  if (__sb__runningInSpringBoard())
  {
    int v2 = SBFEffectiveDeviceClass();
    double result = 8.0;
    if (v2 == 2) {
      return result;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    double result = 8.0;
    if (v5 == 1) {
      return result;
    }
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass())
    {
      int v6 = SBFEffectiveDeviceClass();
      double result = 14.0;
      if (v6 != 1) {
        return result;
      }
    }
    uint64_t v7 = SBFEffectiveHomeButtonType();
    double result = 14.0;
    if (v7 != 2) {
      return result;
    }
LABEL_13:
    uint64_t v10 = SBHScreenTypeForCurrentDevice();
    double result = 24.0;
    if ((unint64_t)(v10 - 9) <= 0xF) {
      return dbl_1D8FD2B20[v10 - 9];
    }
    return result;
  }
  uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v8 userInterfaceIdiom])
  {

    return 14.0;
  }
  uint64_t v9 = SBFEffectiveHomeButtonType();

  double result = 14.0;
  if (v9 == 2) {
    goto LABEL_13;
  }
  return result;
}

- (double)liveResizeSceneUpdateDistanceThreshold
{
  return self->_liveResizeSceneUpdateDistanceThreshold;
}

- (void)setLiveResizeSceneUpdateDistanceThreshold:(double)a3
{
  self->_liveResizeSceneUpdateDistanceThreshold = a3;
}

- (double)liveResizeSceneUpdateTimeThresholdSeconds
{
  return self->_liveResizeSceneUpdateTimeThresholdSeconds;
}

- (void)setLiveResizeSceneUpdateTimeThresholdSeconds:(double)a3
{
  self->_liveResizeSceneUpdateTimeThresholdSeconds = a3;
}

- (BOOL)liveResizeUsesGrid
{
  return self->_liveResizeUsesGrid;
}

- (void)setLiveResizeUsesGrid:(BOOL)a3
{
  self->_liveResizeUsesGrid = a3;
}

- (double)liveResizeGridRubberbandingRange
{
  return self->_liveResizeGridRubberbandingRange;
}

- (void)setLiveResizeGridRubberbandingRange:(double)a3
{
  self->_liveResizeGridRubberbandingRange = a3;
}

- (double)liveResizeGridMinimumWidth
{
  return self->_liveResizeGridMinimumWidth;
}

- (void)setLiveResizeGridMinimumWidth:(double)a3
{
  self->_liveResizeGridMinimumWidth = a3;
}

- (double)liveResizeGridMinimumHeight
{
  return self->_liveResizeGridMinimumHeight;
}

- (void)setLiveResizeGridMinimumHeight:(double)a3
{
  self->_liveResizeGridMinimumHeight = a3;
}

- (BOOL)liveResizeSendsAnimatedSceneSizeUpdates
{
  return self->_liveResizeSendsAnimatedSceneSizeUpdates;
}

- (void)setLiveResizeSendsAnimatedSceneSizeUpdates:(BOOL)a3
{
  self->_liveResizeSendsAnimatedSceneSizeUpdates = a3;
}

- (double)liveResizePointerInteractionRegionOuterLength
{
  return self->_liveResizePointerInteractionRegionOuterLength;
}

- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3
{
  self->_liveResizePointerInteractionRegionOuterLength = a3;
}

- (double)liveResizePointerInteractionRegionInnerLength
{
  return self->_liveResizePointerInteractionRegionInnerLength;
}

- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionInnerLength = a3;
}

- (void)setSnapshotAspectRatioAcceptanceThreshold:(double)a3
{
  self->_snapshotAspectRatioAcceptanceThreshold = a3;
}

- (void)setSwitcherStyle:(int64_t)a3
{
  self->_switcherStyle = a3;
}

- (BOOL)useAsynchronousRendering
{
  return self->_useAsynchronousRendering;
}

- (void)setUseAsynchronousRendering:(BOOL)a3
{
  self->_useAsynchronousRendering = a3;
}

- (BOOL)shouldRoundCornersDuringSwipeUp
{
  return self->_shouldRoundCornersDuringSwipeUp;
}

- (void)setShouldRoundCornersDuringSwipeUp:(BOOL)a3
{
  self->_shouldRoundCornersDuringSwipeUp = a3;
}

- (void)setAsynchronousRenderingDisableSurfaceCacheDelayDuration:(double)a3
{
  self->_asynchronousRenderingDisableSurfaceCacheDelayDuration = a3;
}

- (void)setPreventMedusaSnapshotsAfterTransitionDuration:(double)a3
{
  self->_preventMedusaSnapshotsAfterTransitionDuration = a3;
}

- (SBSwitcherSystemApertureSettings)systemApertureSettings
{
  return self->_systemApertureSettings;
}

- (void)setSystemApertureSettings:(id)a3
{
}

- (void)setChamoisSettings:(id)a3
{
}

- (SBFloatingSwitcherSettings)floatingSwitcherSettings
{
  return self->_floatingSwitcherSettings;
}

- (void)setFloatingSwitcherSettings:(id)a3
{
}

- (SBCenterWindowSizingSettings)centerWindowSizingSettings
{
  return self->_centerWindowSizingSettings;
}

- (void)setCenterWindowSizingSettings:(id)a3
{
}

- (SBSceneRelevancySettings)sceneRelevancySettings
{
  return self->_sceneRelevancySettings;
}

- (void)setSceneRelevancySettings:(id)a3
{
}

- (double)mScale
{
  return self->_mScale;
}

- (void)setMScale:(double)a3
{
  self->_mScale = a3;
}

- (double)centerPoint
{
  return self->_centerPoint;
}

- (void)setCenterPoint:(double)a3
{
  self->_centerPoint = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)mAlpha
{
  return self->_mAlpha;
}

- (void)setMAlpha:(double)a3
{
  self->_mAlpha = a3;
}

- (double)bAlpha
{
  return self->_bAlpha;
}

- (void)setBAlpha:(double)a3
{
  self->_bAlpha = a3;
}

- (double)mDarkening
{
  return self->_mDarkening;
}

- (void)setMDarkening:(double)a3
{
  self->_mDarkening = a3;
}

- (double)bDarkening
{
  return self->_bDarkening;
}

- (void)setBDarkening:(double)a3
{
  self->_bDarkening = a3;
}

- (double)maxDarkening
{
  return self->_maxDarkening;
}

- (void)setMaxDarkening:(double)a3
{
  self->_maxDarkening = a3;
}

- (double)tetheredInsertionRemovalInsetForDeterminingVisibility
{
  return self->_tetheredInsertionRemovalInsetForDeterminingVisibility;
}

- (void)setTetheredInsertionRemovalInsetForDeterminingVisibility:(double)a3
{
  self->_tetheredInsertionRemovalInsetForDeterminingVisibility = a3;
}

- (double)switcherCardScaleWhileTouched
{
  return self->_switcherCardScaleWhileTouched;
}

- (void)setSwitcherCardScaleWhileTouched:(double)a3
{
  self->_switcherCardScaleWhileTouched = a3;
}

- (double)switcherCardScaleWhileCursorHovered
{
  return self->_switcherCardScaleWhileCursorHovered;
}

- (void)setSwitcherCardScaleWhileCursorHovered:(double)a3
{
  self->_switcherCardScaleWhileCursorHovered = a3;
}

- (double)switcherCardShadowRadius
{
  return self->_switcherCardShadowRadius;
}

- (void)setSwitcherCardShadowRadius:(double)a3
{
  self->_switcherCardShadowRadius = a3;
}

- (double)switcherCardShadowOpacity
{
  return self->_switcherCardShadowOpacity;
}

- (void)setSwitcherCardShadowOpacity:(double)a3
{
  self->_switcherCardShadowOpacity = a3;
}

- (double)switcherCardShadowOffsetHorizontal
{
  return self->_switcherCardShadowOffsetHorizontal;
}

- (void)setSwitcherCardShadowOffsetHorizontal:(double)a3
{
  self->_switcherCardShadowOffsetHorizontal = a3;
}

- (double)switcherCardShadowOffsetVertical
{
  return self->_switcherCardShadowOffsetVertical;
}

- (void)setSwitcherCardShadowOffsetVertical:(double)a3
{
  self->_switcherCardShadowOffsetVertical = a3;
}

- (void)setSwitcherCenterYOffsetPercentOfScreenHeight:(double)a3
{
  self->_switcherCenterYOffsetPercentOfScreenHeight = a3;
}

- (double)switcherCardShadowRadiusWhileTouched
{
  return self->_switcherCardShadowRadiusWhileTouched;
}

- (void)setSwitcherCardShadowRadiusWhileTouched:(double)a3
{
  self->_switcherCardShadowRadiusWhileTouched = a3;
}

- (double)switcherCardShadowOpacityWhileTouched
{
  return self->_switcherCardShadowOpacityWhileTouched;
}

- (void)setSwitcherCardShadowOpacityWhileTouched:(double)a3
{
  self->_switcherCardShadowOpacityWhileTouched = a3;
}

- (double)switcherCardShadowOffsetHorizontalWhileTouched
{
  return self->_switcherCardShadowOffsetHorizontalWhileTouched;
}

- (void)setSwitcherCardShadowOffsetHorizontalWhileTouched:(double)a3
{
  self->_switcherCardShadowOffsetHorizontalWhileTouched = a3;
}

- (double)switcherCardShadowOffsetVerticalWhileTouched
{
  return self->_switcherCardShadowOffsetVerticalWhileTouched;
}

- (void)setSwitcherCardShadowOffsetVerticalWhileTouched:(double)a3
{
  self->_switcherCardShadowOffsetVerticalWhileTouched = a3;
}

- (double)cursorHoverShadowRadiusInterpolationAmount
{
  return self->_cursorHoverShadowRadiusInterpolationAmount;
}

- (void)setCursorHoverShadowRadiusInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowRadiusInterpolationAmount = a3;
}

- (double)cursorHoverShadowOpacityInterpolationAmount
{
  return self->_cursorHoverShadowOpacityInterpolationAmount;
}

- (void)setCursorHoverShadowOpacityInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowOpacityInterpolationAmount = a3;
}

- (double)cursorHoverShadowOffsetInterpolationAmount
{
  return self->_cursorHoverShadowOffsetInterpolationAmount;
}

- (void)setCursorHoverShadowOffsetInterpolationAmount:(double)a3
{
  self->_cursorHoverShadowOffsetInterpolationAmount = a3;
}

- (double)peekInsetWidth
{
  return self->_peekInsetWidth;
}

- (void)setPeekInsetWidth:(double)a3
{
  self->_peekInsetWidth = a3;
}

- (double)tintStyleDimmingAlphaInFocusForDarkMode
{
  return self->_tintStyleDimmingAlphaInFocusForDarkMode;
}

- (void)setTintStyleDimmingAlphaInFocusForDarkMode:(double)a3
{
  self->_tintStyleDimmingAlphaInFocusForDarkMode = a3;
}

- (double)tintStyleDimmingAlphaUnFocusForDarkMode
{
  return self->_tintStyleDimmingAlphaUnFocusForDarkMode;
}

- (void)setTintStyleDimmingAlphaUnFocusForDarkMode:(double)a3
{
  self->_tintStyleDimmingAlphaUnFocusForDarkMode = a3;
}

- (double)tintStyleDimmingAlphaInFocusForLightMode
{
  return self->_tintStyleDimmingAlphaInFocusForLightMode;
}

- (void)setTintStyleDimmingAlphaInFocusForLightMode:(double)a3
{
  self->_tintStyleDimmingAlphaInFocusForLightMode = a3;
}

- (double)appExposeNonFloatingSingleRowScale
{
  return self->_appExposeNonFloatingSingleRowScale;
}

- (void)setAppExposeNonFloatingSingleRowScale:(double)a3
{
  self->_appExposeNonFloatingSingleRowScale = a3;
}

- (double)appExposeNonFloatingDoubleRowScale
{
  return self->_appExposeNonFloatingDoubleRowScale;
}

- (void)setAppExposeNonFloatingDoubleRowScale:(double)a3
{
  self->_appExposeNonFloatingDoubleRowScale = a3;
}

- (double)appExposeFloatingDoubleRowScale
{
  return self->_appExposeFloatingDoubleRowScale;
}

- (void)setAppExposeFloatingDoubleRowScale:(double)a3
{
  self->_appExposeFloatingDoubleRowScale = a3;
}

- (double)gridSwitcherPageScale
{
  return self->_gridSwitcherPageScale;
}

- (void)setGridSwitcherPageScale:(double)a3
{
  self->_gridSwitcherPageScale = a3;
}

- (double)gridSwitcherHorizontalInterpageSpacingLandscape
{
  return self->_gridSwitcherHorizontalInterpageSpacingLandscape;
}

- (void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)a3
{
  self->_gridSwitcherHorizontalInterpageSpacingLandscape = a3;
}

- (double)gridSwitcherVerticalNaturalSpacingLandscape
{
  return self->_gridSwitcherVerticalNaturalSpacingLandscape;
}

- (void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)a3
{
  self->_gridSwitcherVerticalNaturalSpacingLandscape = a3;
}

- (double)gridSwitcherHorizontalInterpageSpacingPortrait
{
  return self->_gridSwitcherHorizontalInterpageSpacingPortrait;
}

- (void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)a3
{
  self->_gridSwitcherHorizontalInterpageSpacingPortrait = a3;
}

- (double)gridSwitcherVerticalNaturalSpacingPortrait
{
  return self->_gridSwitcherVerticalNaturalSpacingPortrait;
}

- (void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)a3
{
  self->_gridSwitcherVerticalNaturalSpacingPortrait = a3;
}

- (double)gridSwitcherSnapToControlCenterHeightSlop
{
  return self->_gridSwitcherSnapToControlCenterHeightSlop;
}

- (void)setGridSwitcherSnapToControlCenterHeightSlop:(double)a3
{
  self->_gridSwitcherSnapToControlCenterHeightSlop = a3;
}

- (double)gridSwitcherSwipeUpNormalizedRubberbandingRange
{
  return self->_gridSwitcherSwipeUpNormalizedRubberbandingRange;
}

- (void)setGridSwitcherSwipeUpNormalizedRubberbandingRange:(double)a3
{
  self->_gridSwitcherSwipeUpNormalizedRubberbandingRange = a3;
}

- (double)gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale
{
  return self->_gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale;
}

- (void)setGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale:(double)a3
{
  self->_gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale = a3;
}

- (double)gridSwitcherSwipeUpMinimumScale
{
  return self->_gridSwitcherSwipeUpMinimumScale;
}

- (void)setGridSwitcherSwipeUpMinimumScale:(double)a3
{
  self->_gridSwitcherSwipeUpMinimumScale = a3;
}

- (double)gridSwitcherHomeButtonDeviceCardCornerRadius
{
  return self->_gridSwitcherHomeButtonDeviceCardCornerRadius;
}

- (void)setGridSwitcherHomeButtonDeviceCardCornerRadius:(double)a3
{
  self->_gridSwitcherHomeButtonDeviceCardCornerRadius = a3;
}

- (unint64_t)numberOfSnapshotsToCacheInSwitcher
{
  return self->_numberOfSnapshotsToCacheInSwitcher;
}

- (void)setNumberOfSnapshotsToCacheInSwitcher:(unint64_t)a3
{
  self->_numberOfSnapshotsToCacheInSwitcher = a3;
}

- (unint64_t)numberOfSnapshotsToAlwaysKeepAround
{
  return self->_numberOfSnapshotsToAlwaysKeepAround;
}

- (void)setNumberOfSnapshotsToAlwaysKeepAround:(unint64_t)a3
{
  self->_numberOfSnapshotsToAlwaysKeepAround = a3;
}

- (double)spacingBetweenLeadingEdgeAndIcon
{
  return self->_spacingBetweenLeadingEdgeAndIcon;
}

- (void)setSpacingBetweenLeadingEdgeAndIcon:(double)a3
{
  self->_spacingBetweenLeadingEdgeAndIcon = a3;
}

- (double)spacingBetweenTrailingEdgeAndLabels
{
  return self->_spacingBetweenTrailingEdgeAndLabels;
}

- (void)setSpacingBetweenTrailingEdgeAndLabels:(double)a3
{
  self->_spacingBetweenTrailingEdgeAndLabels = a3;
}

- (double)iconSideLength
{
  return self->_iconSideLength;
}

- (void)setIconSideLength:(double)a3
{
  self->_iconSideLength = a3;
}

- (double)spacingBetweenSnapshotAndIcon
{
  return self->_spacingBetweenSnapshotAndIcon;
}

- (void)setSpacingBetweenSnapshotAndIcon:(double)a3
{
  self->_spacingBetweenSnapshotAndIcon = a3;
}

- (double)spacingBetweenSnapshotAndDescriptionLabelBaseline
{
  return self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
}

- (void)setSpacingBetweenSnapshotAndDescriptionLabelBaseline:(double)a3
{
  self->_spacingBetweenSnapshotAndDescriptionLabelBaseline = a3;
}

- (double)spacingBetweenTitleAndSubtitleBaseline
{
  return self->_spacingBetweenTitleAndSubtitleBaseline;
}

- (void)setSpacingBetweenTitleAndSubtitleBaseline:(double)a3
{
  self->_spacingBetweenTitleAndSubtitleBaseline = a3;
}

- (double)spacingBetweenIconAndLabel
{
  return self->_spacingBetweenIconAndLabel;
}

- (void)setSpacingBetweenIconAndLabel:(double)a3
{
  self->_spacingBetweenIconAndLabel = a3;
}

- (double)spacingBetweenLabelAndMultipleWindowsIndicator
{
  return self->_spacingBetweenLabelAndMultipleWindowsIndicator;
}

- (void)setSpacingBetweenLabelAndMultipleWindowsIndicator:(double)a3
{
  self->_spacingBetweenLabelAndMultipleWindowsIndicator = a3;
}

- (double)multipleWindowsIndicatorSideLength
{
  return self->_multipleWindowsIndicatorSideLength;
}

- (void)setMultipleWindowsIndicatorSideLength:(double)a3
{
  self->_multipleWindowsIndicatorSideLength = a3;
}

- (double)spacingBetweenLabelAndSecondIcon
{
  return self->_spacingBetweenLabelAndSecondIcon;
}

- (void)setSpacingBetweenLabelAndSecondIcon:(double)a3
{
  self->_spacingBetweenLabelAndSecondIcon = a3;
}

- (double)spacingBetweenBoundsCenterAndSecondIcon
{
  return self->_spacingBetweenBoundsCenterAndSecondIcon;
}

- (void)setSpacingBetweenBoundsCenterAndSecondIcon:(double)a3
{
  self->_spacingBetweenBoundsCenterAndSecondIcon = a3;
}

- (void)setDeckSwitcherPageScale:(double)a3
{
  self->_deckSwitcherPageScale = a3;
}

- (double)deckSwitcherDecelerationRate
{
  return self->_deckSwitcherDecelerationRate;
}

- (void)setDeckSwitcherDecelerationRate:(double)a3
{
  self->_deckSwitcherDecelerationRate = a3;
}

- (double)aExpLayoutCoeff
{
  return self->_aExpLayoutCoeff;
}

- (void)setAExpLayoutCoeff:(double)a3
{
  self->_aExpLayoutCoeff = a3;
}

- (double)bExpLayoutCoeff
{
  return self->_bExpLayoutCoeff;
}

- (void)setBExpLayoutCoeff:(double)a3
{
  self->_bExpLayoutCoeff = a3;
}

- (double)depthPadding
{
  return self->_depthPadding;
}

- (void)setDepthPadding:(double)a3
{
  self->_depthPadding = a3;
}

- (double)offscreenCardScaleForFlyIn
{
  return self->_offscreenCardScaleForFlyIn;
}

- (void)setOffscreenCardScaleForFlyIn:(double)a3
{
  self->_offscreenCardScaleForFlyIn = a3;
}

- (double)coplanarSpacingPhone
{
  return self->_coplanarSpacingPhone;
}

- (void)setCoplanarSpacingPhone:(double)a3
{
  self->_coplanarSpacingPhone = a3;
}

- (double)coplanarSpacingPad
{
  return self->_coplanarSpacingPad;
}

- (void)setCoplanarSpacingPad:(double)a3
{
  self->_coplanarSpacingPad = a3;
}

- (BOOL)useTitleOpacityPrototypeSettings
{
  return self->_useTitleOpacityPrototypeSettings;
}

- (void)setUseTitleOpacityPrototypeSettings:(BOOL)a3
{
  self->_useTitleOpacityPrototypeSettings = a3;
}

- (double)titleOpacityACoeff
{
  return self->_titleOpacityACoeff;
}

- (void)setTitleOpacityACoeff:(double)a3
{
  self->_titleOpacityACoeff = a3;
}

- (double)titleOpacityBCoeff
{
  return self->_titleOpacityBCoeff;
}

- (void)setTitleOpacityBCoeff:(double)a3
{
  self->_titleOpacityBCoeff = a3;
}

- (double)titleOpacityCCoeff
{
  return self->_titleOpacityCCoeff;
}

- (void)setTitleOpacityCCoeff:(double)a3
{
  self->_titleOpacityCCoeff = a3;
}

- (double)titleOpacityDCoeff
{
  return self->_titleOpacityDCoeff;
}

- (void)setTitleOpacityDCoeff:(double)a3
{
  self->_titleOpacityDCoeff = a3;
}

- (void)setShouldRedactWindowContents:(BOOL)a3
{
  self->_shouldRedactWindowContents = a3;
}

- (BOOL)showModifierDebugLabel
{
  return self->_showModifierDebugLabel;
}

- (void)setShowModifierDebugLabel:(BOOL)a3
{
  self->_showModifierDebugLabel = a3;
}

- (BOOL)showMainModifierTimeline
{
  return self->_showMainModifierTimeline;
}

- (void)setShowMainModifierTimeline:(BOOL)a3
{
  self->_showMainModifierTimeline = a3;
}

- (BOOL)showFloatingModifierTimeline
{
  return self->_showFloatingModifierTimeline;
}

- (void)setShowFloatingModifierTimeline:(BOOL)a3
{
  self->_showFloatingModifierTimeline = a3;
}

- (BOOL)showLockedModifierTimeline
{
  return self->_showLockedModifierTimeline;
}

- (void)setShowLockedModifierTimeline:(BOOL)a3
{
  self->_showLockedModifierTimeline = a3;
}

- (void)setShouldDisableSwitcherModelUpdatesForDemo:(BOOL)a3
{
  self->_shouldDisableSwitcherModelUpdatesForDemo = a3;
}

- (void)setAnimationSettings:(id)a3
{
}

- (SBDashBoardHomeGestureSettings)dashboardHomeGestureSettings
{
  return self->_dashboardHomeGestureSettings;
}

- (void)setDashboardHomeGestureSettings:(id)a3
{
}

- (PTOutlet)clearModelOutlet
{
  return self->_clearModelOutlet;
}

- (void)setClearModelOutlet:(id)a3
{
}

- (PTOutlet)stashModelOutlet
{
  return self->_stashModelOutlet;
}

- (void)setStashModelOutlet:(id)a3
{
}

- (PTOutlet)loadModelOutlet
{
  return self->_loadModelOutlet;
}

- (void)setLoadModelOutlet:(id)a3
{
}

- (PTOutlet)addAppsToModelOutlet
{
  return self->_addAppsToModelOutlet;
}

- (void)setAddAppsToModelOutlet:(id)a3
{
}

- (PTOutlet)addPPTAppsToModelOutlet
{
  return self->_addPPTAppsToModelOutlet;
}

- (void)setAddPPTAppsToModelOutlet:(id)a3
{
}

- (BOOL)simplicityOptionNoSnapshots
{
  return self->_simplicityOptionNoSnapshots;
}

- (void)setSimplicityOptionNoSnapshots:(BOOL)a3
{
  self->_simplicityOptionNoSnapshots = a3;
}

- (BOOL)simplicityOptionNoCrossfade
{
  return self->_simplicityOptionNoCrossfade;
}

- (void)setSimplicityOptionNoCrossfade:(BOOL)a3
{
  self->_simplicityOptionNoCrossfade = a3;
}

- (BOOL)simplicityOptionNoLabels
{
  return self->_simplicityOptionNoLabels;
}

- (void)setSimplicityOptionNoLabels:(BOOL)a3
{
  self->_simplicityOptionNoLabels = a3;
}

- (BOOL)simplicityOptionNoIcons
{
  return self->_simplicityOptionNoIcons;
}

- (void)setSimplicityOptionNoIcons:(BOOL)a3
{
  self->_simplicityOptionNoIcons = a3;
}

- (BOOL)simplicityOptionNoBlurs
{
  return self->_simplicityOptionNoBlurs;
}

- (void)setSimplicityOptionNoBlurs:(BOOL)a3
{
  self->_simplicityOptionNoBlurs = a3;
}

- (BOOL)simplicityOptionNoShadows
{
  return self->_simplicityOptionNoShadows;
}

- (void)setSimplicityOptionNoShadows:(BOOL)a3
{
  self->_simplicityOptionNoShadows = a3;
}

- (BOOL)simplicityOptionNoControlCenter
{
  return self->_simplicityOptionNoControlCenter;
}

- (void)setSimplicityOptionNoControlCenter:(BOOL)a3
{
  self->_simplicityOptionNoControlCenter = a3;
}

- (BOOL)simplicityOptionNoSnapshotBkg
{
  return self->_simplicityOptionNoSnapshotBkg;
}

- (void)setSimplicityOptionNoSnapshotBkg:(BOOL)a3
{
  self->_simplicityOptionNoSnapshotBkg = a3;
}

- (BOOL)showFloats
{
  return self->_showFloats;
}

- (void)setShowFloats:(BOOL)a3
{
  self->_showFloats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPPTAppsToModelOutlet, 0);
  objc_storeStrong((id *)&self->_addAppsToModelOutlet, 0);
  objc_storeStrong((id *)&self->_loadModelOutlet, 0);
  objc_storeStrong((id *)&self->_stashModelOutlet, 0);
  objc_storeStrong((id *)&self->_clearModelOutlet, 0);
  objc_storeStrong((id *)&self->_dashboardHomeGestureSettings, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_sceneRelevancySettings, 0);
  objc_storeStrong((id *)&self->_centerWindowSizingSettings, 0);
  objc_storeStrong((id *)&self->_floatingSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_systemApertureSettings, 0);
}

@end