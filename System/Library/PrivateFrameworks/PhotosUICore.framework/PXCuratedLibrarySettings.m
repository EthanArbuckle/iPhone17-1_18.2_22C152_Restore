@interface PXCuratedLibrarySettings
+ (BOOL)enableEmptyYearsMonthsDaysForTesting;
+ (PXCuratedLibrarySettings)sharedInstance;
+ (id)settingsControllerModule;
+ (void)setEnableEmptyYearsMonthsDaysForTesting:(BOOL)a3;
- (BOOL)alignActionButtonsTrailingEdges;
- (BOOL)allowsCustomDateTitles;
- (BOOL)allowsModularLayoutForZoomLevel:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 layoutStyle:(unint64_t)a6;
- (BOOL)alwaysShowSecondaryToolbarAtBottom;
- (BOOL)emulatesEmptyLibrary;
- (BOOL)enableCustomScrollToTopOrBottom;
- (BOOL)enableInlinePlayback;
- (BOOL)enableInlinePlaybackInZoomableGrids;
- (BOOL)enableInteractiveTransition;
- (BOOL)enablePlayMovieInYears;
- (BOOL)enablePlaybackDiagnostics;
- (BOOL)enableRecentlyEditedAlbum;
- (BOOL)enableShowAllButtons;
- (BOOL)enableSkimmingInYears;
- (BOOL)enableSlideshowInYears;
- (BOOL)enableTapOnTitleToScroll;
- (BOOL)exaggerateContrast;
- (BOOL)firstTimeExperienceAlwaysLogReadiness;
- (BOOL)forceBadgesOnAllAssets;
- (BOOL)forceFloatingHeaderVisible;
- (BOOL)forcePlayback;
- (BOOL)forceShowAllButtonsVisible;
- (BOOL)hideAggregations;
- (BOOL)hideAnalyzingStatus;
- (BOOL)hideRecents;
- (BOOL)hideStatusFooter;
- (BOOL)hideStatusFooterInSelectMode;
- (BOOL)includeGuestAssetsInFooterCount;
- (BOOL)launchToSavedAllPhotosScrollPosition;
- (BOOL)playBestTimeRange;
- (BOOL)secondaryToolbarAlwaysVisible;
- (BOOL)showAllHighlights;
- (BOOL)showDebugInformationInFloatingHeader;
- (BOOL)showSaliencyRects;
- (BOOL)showSecondaryToolbar;
- (BOOL)showStatusBar;
- (BOOL)stabilizeLivePhotos;
- (BOOL)useCustomDaysCurationType;
- (BOOL)useSaliency;
- (BOOL)useWideModularLayoutInYears;
- (NSString)savedAllPhotosScrollPositionAnchorAssetIdentifier;
- (double)allowSpecialPanoHeaders;
- (double)aspectRatioForCompactLandscapeYears;
- (double)aspectRatioForCompactPortraitMonths;
- (double)aspectRatioForCompactPortraitYears;
- (double)aspectRatioForRegularYears;
- (double)blurredBackgroundFadeDuration;
- (double)blurredBackgroundFinalOpacity;
- (double)blurredBackgroundInitialOpacity;
- (double)blurredBackgroundInitialOpacityMac;
- (double)blurredBackgroundRadius;
- (double)bottomCenterSecondaryToolbarWidth;
- (double)cornerRadiusForDays;
- (double)cornerRadiusForMonths;
- (double)cornerRadiusForYears;
- (double)daysHeaderGradientAlpha;
- (double)daysHeaderGradientHeight;
- (double)defaultZoomLevelTransitionAnimationDuration;
- (double)defaultZoomLevelTransitionMaximumScaleAroundAnchor;
- (double)externalSecondaryToolbarHeight;
- (double)faultInDistance;
- (double)faultOutPadding;
- (double)floatingHeaderButtonsFadeOverDistance;
- (double)floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop;
- (double)floatingHeaderFadeOverDistance;
- (double)floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom;
- (double)floatingHeadersAppearanceCrossfadeDuration;
- (double)interitemSpacingForDays;
- (double)largeHeroMinimumScore;
- (double)lateralMarginDays;
- (double)lateralMarginMonths;
- (double)lateralMarginYears;
- (double)livePhotoLoopingCrossfadeDuration;
- (double)minAutoplaySuggestionScore;
- (double)minimumVisibleHeightForTopMostSection;
- (double)monthsFloatingHeadersAppearanceCrossfadeDistance;
- (double)monthsFloatingHeadersAppearanceCrossfadeStartDistance;
- (double)monthsFloatingHeadersDistanceFromSafeAreaTop;
- (double)monthsFloatingHeadersFadeoutDistance;
- (double)monthsFloatingHeadersSubtitleAlpha;
- (double)monthsHeaderGradientAlpha;
- (double)monthsHeaderGradientHeight;
- (double)monthsInlineHeadersFadeoutDistance;
- (double)monthsInlineHeadersFadeoutMinimumAlpha;
- (double)monthsInlineHeadersFadeoutOffset;
- (double)monthsSmallHeaderGradientHeight;
- (double)nonAnchorDaysFadeSpeed;
- (double)nonAnchorMonthsFadeSpeed;
- (double)nonAnchorYearsFadeSpeed;
- (double)nonInterestingPromotionScore;
- (double)playbackVisibleRectEdgeInset;
- (double)playingRecordsUpdateRateLimit;
- (double)recentHighlightsTimeInterval;
- (double)scrollSnapMaximumAccelerationFactor;
- (double)scrollSnapMaximumDecelerationFactor;
- (double)scrollSnapMinimumSpeed;
- (double)sectionShadowOpacity;
- (double)skimmingScale;
- (double)slideshowIntervalDelay;
- (double)slideshowTriggerDelay;
- (double)spacingBetweenDays;
- (double)statusBarGradientAlpha;
- (double)statusBarGradientAndStyleFadeDuration;
- (double)statusBarGradientHeight;
- (double)swipeBackGestureMinAngle;
- (double)swipeBackGestureMinTranslation;
- (double)topInsetForVisibilityAnchoring;
- (double)transitionScaleForDayNotMatchingMonths;
- (double)transitionToOrFromAllPhotosAnimationDuration;
- (double)transitionToOrFromAllPhotosScale;
- (double)yearsHeaderGradientAlpha;
- (double)yearsHeaderGradientHeight;
- (double)yearsHeadersFadeoutDistance;
- (double)yearsHeadersFadeoutMinimumAlpha;
- (double)yearsHeadersFadeoutOffset;
- (double)zoomLevelControlSegmentExpansionFactor;
- (double)zoomLevelPinchSignificantScaleDelta;
- (id)acceptableLargeHeroPredicate;
- (id)parentSettings;
- (int64_t)firstTimeExperienceMaxNonProcessedAssets;
- (int64_t)firstTimeExperienceMaxNonProcessedHighlights;
- (int64_t)forcedNumberOfYearsColumn;
- (int64_t)initialZoomLevel;
- (int64_t)largeHeroDensity;
- (int64_t)maxNumberOfPlayingItems;
- (int64_t)sectionsToPrefetch;
- (int64_t)version;
- (unsigned)daysCurationType;
- (void)setAlignActionButtonsTrailingEdges:(BOOL)a3;
- (void)setAllowSpecialPanoHeaders:(double)a3;
- (void)setAllowsCustomDateTitles:(BOOL)a3;
- (void)setAlwaysShowSecondaryToolbarAtBottom:(BOOL)a3;
- (void)setAspectRatioForCompactLandscapeYears:(double)a3;
- (void)setAspectRatioForCompactPortraitMonths:(double)a3;
- (void)setAspectRatioForCompactPortraitYears:(double)a3;
- (void)setAspectRatioForRegularYears:(double)a3;
- (void)setBlurredBackgroundFadeDuration:(double)a3;
- (void)setBlurredBackgroundFinalOpacity:(double)a3;
- (void)setBlurredBackgroundInitialOpacity:(double)a3;
- (void)setBlurredBackgroundInitialOpacityMac:(double)a3;
- (void)setBlurredBackgroundRadius:(double)a3;
- (void)setBottomCenterSecondaryToolbarWidth:(double)a3;
- (void)setCornerRadiusForDays:(double)a3;
- (void)setCornerRadiusForMonths:(double)a3;
- (void)setCornerRadiusForYears:(double)a3;
- (void)setDaysCurationType:(unsigned __int16)a3;
- (void)setDaysHeaderGradientAlpha:(double)a3;
- (void)setDaysHeaderGradientHeight:(double)a3;
- (void)setDefaultValues;
- (void)setDefaultZoomLevelTransitionAnimationDuration:(double)a3;
- (void)setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:(double)a3;
- (void)setEmulatesEmptyLibrary:(BOOL)a3;
- (void)setEnableCustomScrollToTopOrBottom:(BOOL)a3;
- (void)setEnableInlinePlayback:(BOOL)a3;
- (void)setEnableInlinePlaybackInZoomableGrids:(BOOL)a3;
- (void)setEnableInteractiveTransition:(BOOL)a3;
- (void)setEnablePlayMovieInYears:(BOOL)a3;
- (void)setEnablePlaybackDiagnostics:(BOOL)a3;
- (void)setEnableRecentlyEditedAlbum:(BOOL)a3;
- (void)setEnableShowAllButtons:(BOOL)a3;
- (void)setEnableSkimmingInYears:(BOOL)a3;
- (void)setEnableSlideshowInYears:(BOOL)a3;
- (void)setEnableTapOnTitleToScroll:(BOOL)a3;
- (void)setExaggerateContrast:(BOOL)a3;
- (void)setExternalSecondaryToolbarHeight:(double)a3;
- (void)setFaultInDistance:(double)a3;
- (void)setFaultOutPadding:(double)a3;
- (void)setFirstTimeExperienceAlwaysLogReadiness:(BOOL)a3;
- (void)setFirstTimeExperienceMaxNonProcessedAssets:(int64_t)a3;
- (void)setFirstTimeExperienceMaxNonProcessedHighlights:(int64_t)a3;
- (void)setFloatingHeaderButtonsFadeOverDistance:(double)a3;
- (void)setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:(double)a3;
- (void)setFloatingHeaderFadeOverDistance:(double)a3;
- (void)setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:(double)a3;
- (void)setFloatingHeadersAppearanceCrossfadeDuration:(double)a3;
- (void)setForceBadgesOnAllAssets:(BOOL)a3;
- (void)setForceFloatingHeaderVisible:(BOOL)a3;
- (void)setForcePlayback:(BOOL)a3;
- (void)setForceShowAllButtonsVisible:(BOOL)a3;
- (void)setForcedNumberOfYearsColumn:(int64_t)a3;
- (void)setHideAggregations:(BOOL)a3;
- (void)setHideAnalyzingStatus:(BOOL)a3;
- (void)setHideRecents:(BOOL)a3;
- (void)setHideStatusFooter:(BOOL)a3;
- (void)setHideStatusFooterInSelectMode:(BOOL)a3;
- (void)setIncludeGuestAssetsInFooterCount:(BOOL)a3;
- (void)setInitialZoomLevel:(int64_t)a3;
- (void)setInteritemSpacingForDays:(double)a3;
- (void)setLargeHeroDensity:(int64_t)a3;
- (void)setLargeHeroMinimumScore:(double)a3;
- (void)setLateralMarginDays:(double)a3;
- (void)setLateralMarginMonths:(double)a3;
- (void)setLateralMarginYears:(double)a3;
- (void)setLaunchToSavedAllPhotosScrollPosition:(BOOL)a3;
- (void)setLivePhotoLoopingCrossfadeDuration:(double)a3;
- (void)setMaxNumberOfPlayingItems:(int64_t)a3;
- (void)setMinAutoplaySuggestionScore:(double)a3;
- (void)setMinimumVisibleHeightForTopMostSection:(double)a3;
- (void)setMonthsFloatingHeadersAppearanceCrossfadeDistance:(double)a3;
- (void)setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:(double)a3;
- (void)setMonthsFloatingHeadersDistanceFromSafeAreaTop:(double)a3;
- (void)setMonthsFloatingHeadersFadeoutDistance:(double)a3;
- (void)setMonthsFloatingHeadersSubtitleAlpha:(double)a3;
- (void)setMonthsHeaderGradientAlpha:(double)a3;
- (void)setMonthsHeaderGradientHeight:(double)a3;
- (void)setMonthsInlineHeadersFadeoutDistance:(double)a3;
- (void)setMonthsInlineHeadersFadeoutMinimumAlpha:(double)a3;
- (void)setMonthsInlineHeadersFadeoutOffset:(double)a3;
- (void)setMonthsSmallHeaderGradientHeight:(double)a3;
- (void)setNonAnchorDaysFadeSpeed:(double)a3;
- (void)setNonAnchorMonthsFadeSpeed:(double)a3;
- (void)setNonAnchorYearsFadeSpeed:(double)a3;
- (void)setNonInterestingPromotionScore:(double)a3;
- (void)setPlayBestTimeRange:(BOOL)a3;
- (void)setPlaybackVisibleRectEdgeInset:(double)a3;
- (void)setPlayingRecordsUpdateRateLimit:(double)a3;
- (void)setRecentHighlightsTimeInterval:(double)a3;
- (void)setSavedAllPhotosScrollPositionAnchorAssetIdentifier:(id)a3;
- (void)setScrollSnapMaximumAccelerationFactor:(double)a3;
- (void)setScrollSnapMaximumDecelerationFactor:(double)a3;
- (void)setScrollSnapMinimumSpeed:(double)a3;
- (void)setSecondaryToolbarAlwaysVisible:(BOOL)a3;
- (void)setSectionShadowOpacity:(double)a3;
- (void)setSectionsToPrefetch:(int64_t)a3;
- (void)setShowAllHighlights:(BOOL)a3;
- (void)setShowDebugInformationInFloatingHeader:(BOOL)a3;
- (void)setShowSaliencyRects:(BOOL)a3;
- (void)setShowSecondaryToolbar:(BOOL)a3;
- (void)setShowStatusBar:(BOOL)a3;
- (void)setSkimmingScale:(double)a3;
- (void)setSlideshowIntervalDelay:(double)a3;
- (void)setSlideshowTriggerDelay:(double)a3;
- (void)setSpacingBetweenDays:(double)a3;
- (void)setStabilizeLivePhotos:(BOOL)a3;
- (void)setStatusBarGradientAlpha:(double)a3;
- (void)setStatusBarGradientAndStyleFadeDuration:(double)a3;
- (void)setStatusBarGradientHeight:(double)a3;
- (void)setSwipeBackGestureMinAngle:(double)a3;
- (void)setSwipeBackGestureMinTranslation:(double)a3;
- (void)setTopInsetForVisibilityAnchoring:(double)a3;
- (void)setTransitionScaleForDayNotMatchingMonths:(double)a3;
- (void)setTransitionToOrFromAllPhotosAnimationDuration:(double)a3;
- (void)setTransitionToOrFromAllPhotosScale:(double)a3;
- (void)setUseCustomDaysCurationType:(BOOL)a3;
- (void)setUseSaliency:(BOOL)a3;
- (void)setUseWideModularLayoutInYears:(BOOL)a3;
- (void)setYearsHeaderGradientAlpha:(double)a3;
- (void)setYearsHeaderGradientHeight:(double)a3;
- (void)setYearsHeadersFadeoutDistance:(double)a3;
- (void)setYearsHeadersFadeoutMinimumAlpha:(double)a3;
- (void)setYearsHeadersFadeoutOffset:(double)a3;
- (void)setZoomLevelControlSegmentExpansionFactor:(double)a3;
- (void)setZoomLevelPinchSignificantScaleDelta:(double)a3;
@end

@implementation PXCuratedLibrarySettings

- (BOOL)enableInlinePlaybackInZoomableGrids
{
  return self->_enableInlinePlaybackInZoomableGrids;
}

- (double)daysHeaderGradientAlpha
{
  return self->_daysHeaderGradientAlpha;
}

+ (PXCuratedLibrarySettings)sharedInstance
{
  if (sharedInstance_onceToken_203933 != -1) {
    dispatch_once(&sharedInstance_onceToken_203933, &__block_literal_global_203934);
  }
  v2 = (void *)sharedInstance_sharedInstance_203935;
  return (PXCuratedLibrarySettings *)v2;
}

- (double)monthsFloatingHeadersFadeoutDistance
{
  return self->_monthsFloatingHeadersFadeoutDistance;
}

- (double)monthsFloatingHeadersDistanceFromSafeAreaTop
{
  return self->_monthsFloatingHeadersDistanceFromSafeAreaTop;
}

- (double)monthsFloatingHeadersAppearanceCrossfadeStartDistance
{
  return self->_monthsFloatingHeadersAppearanceCrossfadeStartDistance;
}

- (double)monthsFloatingHeadersAppearanceCrossfadeDistance
{
  return self->_monthsFloatingHeadersAppearanceCrossfadeDistance;
}

- (double)floatingHeadersAppearanceCrossfadeDuration
{
  return self->_floatingHeadersAppearanceCrossfadeDuration;
}

- (BOOL)allowsModularLayoutForZoomLevel:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 layoutStyle:(unint64_t)a6
{
  if ((unint64_t)(a3 - 1) > 1) {
    return 0;
  }
  if (a4 == 2 || a4 == 1 && a5 == 2) {
    return 1;
  }
  return a3 == 2 && a6 == 1;
}

- (BOOL)allowsCustomDateTitles
{
  return self->_allowsCustomDateTitles;
}

- (double)monthsSmallHeaderGradientHeight
{
  return self->_monthsSmallHeaderGradientHeight;
}

- (double)monthsInlineHeadersFadeoutOffset
{
  return self->_monthsInlineHeadersFadeoutOffset;
}

- (double)monthsInlineHeadersFadeoutMinimumAlpha
{
  return self->_monthsInlineHeadersFadeoutMinimumAlpha;
}

- (double)monthsInlineHeadersFadeoutDistance
{
  return self->_monthsInlineHeadersFadeoutDistance;
}

- (double)monthsHeaderGradientAlpha
{
  return self->_monthsHeaderGradientAlpha;
}

- (double)yearsHeadersFadeoutOffset
{
  return self->_yearsHeadersFadeoutOffset;
}

- (double)yearsHeadersFadeoutMinimumAlpha
{
  return self->_yearsHeadersFadeoutMinimumAlpha;
}

- (double)yearsHeadersFadeoutDistance
{
  return self->_yearsHeadersFadeoutDistance;
}

- (double)yearsHeaderGradientHeight
{
  return self->_yearsHeaderGradientHeight;
}

- (double)yearsHeaderGradientAlpha
{
  return self->_yearsHeaderGradientAlpha;
}

- (double)cornerRadiusForYears
{
  return self->_cornerRadiusForYears;
}

- (BOOL)exaggerateContrast
{
  return self->_exaggerateContrast;
}

- (double)cornerRadiusForMonths
{
  return self->_cornerRadiusForMonths;
}

- (double)aspectRatioForCompactPortraitMonths
{
  return self->_aspectRatioForCompactPortraitMonths;
}

- (double)aspectRatioForCompactPortraitYears
{
  return self->_aspectRatioForCompactPortraitYears;
}

- (double)daysHeaderGradientHeight
{
  return self->_daysHeaderGradientHeight;
}

- (BOOL)showSecondaryToolbar
{
  return self->_showSecondaryToolbar;
}

- (BOOL)secondaryToolbarAlwaysVisible
{
  return self->_secondaryToolbarAlwaysVisible;
}

- (BOOL)showAllHighlights
{
  return self->_showAllHighlights;
}

- (double)nonInterestingPromotionScore
{
  return self->_nonInterestingPromotionScore;
}

- (BOOL)hideRecents
{
  return self->_hideRecents;
}

- (BOOL)hideAggregations
{
  return self->_hideAggregations;
}

- (BOOL)emulatesEmptyLibrary
{
  return self->_emulatesEmptyLibrary;
}

+ (BOOL)enableEmptyYearsMonthsDaysForTesting
{
  return _enableEmptyYearsMonthsDaysForTesting;
}

- (double)spacingBetweenDays
{
  return self->_spacingBetweenDays;
}

- (double)interitemSpacingForDays
{
  return self->_interitemSpacingForDays;
}

- (BOOL)showStatusBar
{
  return self->_showStatusBar;
}

- (BOOL)enablePlaybackDiagnostics
{
  return self->_enablePlaybackDiagnostics;
}

- (int64_t)firstTimeExperienceMaxNonProcessedHighlights
{
  return self->_firstTimeExperienceMaxNonProcessedHighlights;
}

- (int64_t)firstTimeExperienceMaxNonProcessedAssets
{
  return self->_firstTimeExperienceMaxNonProcessedAssets;
}

- (BOOL)hideStatusFooterInSelectMode
{
  return self->_hideStatusFooterInSelectMode;
}

- (double)zoomLevelControlSegmentExpansionFactor
{
  return self->_zoomLevelControlSegmentExpansionFactor;
}

- (BOOL)enableSkimmingInYears
{
  return self->_enableSkimmingInYears;
}

- (double)swipeBackGestureMinTranslation
{
  return self->_swipeBackGestureMinTranslation;
}

- (double)swipeBackGestureMinAngle
{
  return self->_swipeBackGestureMinAngle;
}

- (double)playingRecordsUpdateRateLimit
{
  return self->_playingRecordsUpdateRateLimit;
}

- (double)playbackVisibleRectEdgeInset
{
  return self->_playbackVisibleRectEdgeInset;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXCuratedLibrarySettings *)self setEnablePlayMovieInYears:0];
  [(PXCuratedLibrarySettings *)self setEnableSkimmingInYears:1];
  [(PXCuratedLibrarySettings *)self setEnableSlideshowInYears:1];
  [(PXCuratedLibrarySettings *)self setLaunchToSavedAllPhotosScrollPosition:0];
  [(PXCuratedLibrarySettings *)self setSavedAllPhotosScrollPositionAnchorAssetIdentifier:0];
  [(PXCuratedLibrarySettings *)self setEmulatesEmptyLibrary:0];
  [(PXCuratedLibrarySettings *)self setBlurredBackgroundRadius:40.0];
  [(PXCuratedLibrarySettings *)self setBlurredBackgroundInitialOpacity:1.0];
  [(PXCuratedLibrarySettings *)self setBlurredBackgroundInitialOpacityMac:0.5];
  [(PXCuratedLibrarySettings *)self setBlurredBackgroundFinalOpacity:0.05];
  [(PXCuratedLibrarySettings *)self setBlurredBackgroundFadeDuration:2.5];
  [(PXCuratedLibrarySettings *)self setShowStatusBar:1];
  [(PXCuratedLibrarySettings *)self setSecondaryToolbarAlwaysVisible:0];
  [(PXCuratedLibrarySettings *)self setAlwaysShowSecondaryToolbarAtBottom:0];
  [(PXCuratedLibrarySettings *)self setBottomCenterSecondaryToolbarWidth:400.0];
  [(PXCuratedLibrarySettings *)self setShowSecondaryToolbar:1];
  [(PXCuratedLibrarySettings *)self setEnableTapOnTitleToScroll:1];
  [(PXCuratedLibrarySettings *)self setEnableCustomScrollToTopOrBottom:0];
  [(PXCuratedLibrarySettings *)self setScrollSnapMaximumDecelerationFactor:2.0];
  [(PXCuratedLibrarySettings *)self setScrollSnapMaximumAccelerationFactor:1.2];
  [(PXCuratedLibrarySettings *)self setScrollSnapMinimumSpeed:0.1];
  [(PXCuratedLibrarySettings *)self setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:50.0];
  [(PXCuratedLibrarySettings *)self setFloatingHeaderFadeOverDistance:100.0];
  [(PXCuratedLibrarySettings *)self setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:12.0];
  [(PXCuratedLibrarySettings *)self setFloatingHeaderButtonsFadeOverDistance:30.0];
  [(PXCuratedLibrarySettings *)self setFloatingHeadersAppearanceCrossfadeDuration:0.4];
  [(PXCuratedLibrarySettings *)self setMonthsFloatingHeadersDistanceFromSafeAreaTop:3.0];
  [(PXCuratedLibrarySettings *)self setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:0.3];
  [(PXCuratedLibrarySettings *)self setMonthsFloatingHeadersAppearanceCrossfadeDistance:1.0];
  [(PXCuratedLibrarySettings *)self setMonthsFloatingHeadersFadeoutDistance:1.5];
  [(PXCuratedLibrarySettings *)self setMonthsFloatingHeadersSubtitleAlpha:0.67];
  [(PXCuratedLibrarySettings *)self setMonthsInlineHeadersFadeoutOffset:0.8];
  [(PXCuratedLibrarySettings *)self setMonthsInlineHeadersFadeoutDistance:2.0];
  [(PXCuratedLibrarySettings *)self setMonthsInlineHeadersFadeoutMinimumAlpha:0.4];
  [(PXCuratedLibrarySettings *)self setYearsHeadersFadeoutOffset:-20.0];
  [(PXCuratedLibrarySettings *)self setYearsHeadersFadeoutDistance:67.0];
  [(PXCuratedLibrarySettings *)self setYearsHeadersFadeoutMinimumAlpha:0.4];
  [(PXCuratedLibrarySettings *)self setUseSaliency:1];
  [(PXCuratedLibrarySettings *)self setShowSaliencyRects:0];
  [(PXCuratedLibrarySettings *)self setLargeHeroDensity:3];
  [(PXCuratedLibrarySettings *)self setLargeHeroMinimumScore:0.0];
  [(PXCuratedLibrarySettings *)self setAspectRatioForCompactPortraitYears:1.33333333];
  [(PXCuratedLibrarySettings *)self setAspectRatioForCompactLandscapeYears:1.77777778];
  [(PXCuratedLibrarySettings *)self setAspectRatioForRegularYears:1.5];
  [(PXCuratedLibrarySettings *)self setForcedNumberOfYearsColumn:0];
  [(PXCuratedLibrarySettings *)self setUseWideModularLayoutInYears:0];
  [(PXCuratedLibrarySettings *)self setAspectRatioForCompactPortraitMonths:1.0];
  [(PXCuratedLibrarySettings *)self setSpacingBetweenDays:5.0];
  [(PXCuratedLibrarySettings *)self setInteritemSpacingForDays:2.0];
  [(PXCuratedLibrarySettings *)self setCornerRadiusForDays:0.0];
  [(PXCuratedLibrarySettings *)self setCornerRadiusForMonths:10.0];
  [(PXCuratedLibrarySettings *)self setCornerRadiusForYears:10.0];
  [(PXCuratedLibrarySettings *)self setAllowSpecialPanoHeaders:0.0];
  [(PXCuratedLibrarySettings *)self setTopInsetForVisibilityAnchoring:90.0];
  [(PXCuratedLibrarySettings *)self setSectionShadowOpacity:0.15];
  [(PXCuratedLibrarySettings *)self setSkimmingScale:0.95];
  [(PXCuratedLibrarySettings *)self setSectionsToPrefetch:5];
  [(PXCuratedLibrarySettings *)self setFaultInDistance:2000.0];
  [(PXCuratedLibrarySettings *)self setFaultOutPadding:1000.0];
  [(PXCuratedLibrarySettings *)self setForceFloatingHeaderVisible:0];
  [(PXCuratedLibrarySettings *)self setShowDebugInformationInFloatingHeader:0];
  [(PXCuratedLibrarySettings *)self setMinimumVisibleHeightForTopMostSection:0.0];
  [(PXCuratedLibrarySettings *)self setEnableShowAllButtons:1];
  [(PXCuratedLibrarySettings *)self setAllowsCustomDateTitles:1];
  [(PXCuratedLibrarySettings *)self setYearsHeaderGradientAlpha:0.4];
  [(PXCuratedLibrarySettings *)self setYearsHeaderGradientHeight:120.0];
  [(PXCuratedLibrarySettings *)self setMonthsHeaderGradientAlpha:0.4];
  [(PXCuratedLibrarySettings *)self setMonthsHeaderGradientHeight:120.0];
  [(PXCuratedLibrarySettings *)self setMonthsSmallHeaderGradientHeight:90.0];
  [(PXCuratedLibrarySettings *)self setDaysHeaderGradientAlpha:0.4];
  [(PXCuratedLibrarySettings *)self setDaysHeaderGradientHeight:150.0];
  [(PXCuratedLibrarySettings *)self setStatusBarGradientAlpha:0.25];
  [(PXCuratedLibrarySettings *)self setStatusBarGradientHeight:130.0];
  [(PXCuratedLibrarySettings *)self setStatusBarGradientAndStyleFadeDuration:0.75];
  [(PXCuratedLibrarySettings *)self setInitialZoomLevel:3];
  [(PXCuratedLibrarySettings *)self setShowAllHighlights:0];
  [(PXCuratedLibrarySettings *)self setUseCustomDaysCurationType:0];
  [(PXCuratedLibrarySettings *)self setDaysCurationType:2];
  [(PXCuratedLibrarySettings *)self setNonInterestingPromotionScore:0.25];
  [(PXCuratedLibrarySettings *)self setHideRecents:0];
  [(PXCuratedLibrarySettings *)self setHideAggregations:0];
  [(PXCuratedLibrarySettings *)self setEnableInlinePlayback:1];
  [(PXCuratedLibrarySettings *)self setEnableInlinePlaybackInZoomableGrids:0];
  [(PXCuratedLibrarySettings *)self setStabilizeLivePhotos:1];
  [(PXCuratedLibrarySettings *)self setForcePlayback:0];
  [(PXCuratedLibrarySettings *)self setMinAutoplaySuggestionScore:0.5];
  [(PXCuratedLibrarySettings *)self setPlayBestTimeRange:1];
  [(PXCuratedLibrarySettings *)self setMaxNumberOfPlayingItems:1];
  [(PXCuratedLibrarySettings *)self setPlaybackVisibleRectEdgeInset:30.0];
  [(PXCuratedLibrarySettings *)self setLivePhotoLoopingCrossfadeDuration:0.25];
  [(PXCuratedLibrarySettings *)self setEnablePlaybackDiagnostics:0];
  [(PXCuratedLibrarySettings *)self setPlayingRecordsUpdateRateLimit:0.02];
  [(PXCuratedLibrarySettings *)self setSlideshowTriggerDelay:5.0];
  [(PXCuratedLibrarySettings *)self setSlideshowIntervalDelay:4.0];
  [(PXCuratedLibrarySettings *)self setFirstTimeExperienceMaxNonProcessedHighlights:2];
  [(PXCuratedLibrarySettings *)self setFirstTimeExperienceMaxNonProcessedAssets:50];
  [(PXCuratedLibrarySettings *)self setFirstTimeExperienceAlwaysLogReadiness:0];
  [(PXCuratedLibrarySettings *)self setEnableInteractiveTransition:0];
  [(PXCuratedLibrarySettings *)self setDefaultZoomLevelTransitionAnimationDuration:0.58];
  [(PXCuratedLibrarySettings *)self setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:2.0];
  [(PXCuratedLibrarySettings *)self setNonAnchorYearsFadeSpeed:1.3];
  [(PXCuratedLibrarySettings *)self setNonAnchorMonthsFadeSpeed:1.4];
  [(PXCuratedLibrarySettings *)self setNonAnchorDaysFadeSpeed:1.4];
  [(PXCuratedLibrarySettings *)self setTransitionToOrFromAllPhotosAnimationDuration:0.58];
  [(PXCuratedLibrarySettings *)self setTransitionToOrFromAllPhotosScale:0.8];
  [(PXCuratedLibrarySettings *)self setTransitionScaleForDayNotMatchingMonths:0.8];
  [(PXCuratedLibrarySettings *)self setZoomLevelPinchSignificantScaleDelta:0.1];
  [(PXCuratedLibrarySettings *)self setSwipeBackGestureMinAngle:30.0];
  [(PXCuratedLibrarySettings *)self setSwipeBackGestureMinTranslation:30.0];
  [(PXCuratedLibrarySettings *)self setZoomLevelControlSegmentExpansionFactor:0.5];
  [(PXCuratedLibrarySettings *)self setEnableRecentlyEditedAlbum:0];
  [(PXCuratedLibrarySettings *)self setAlignActionButtonsTrailingEdges:0];
  [(PXCuratedLibrarySettings *)self setLateralMarginDays:0.0];
  [(PXCuratedLibrarySettings *)self setLateralMarginMonths:22.0];
  [(PXCuratedLibrarySettings *)self setLateralMarginYears:26.0];
  [(PXCuratedLibrarySettings *)self setExternalSecondaryToolbarHeight:24.0];
  [(PXCuratedLibrarySettings *)self setExaggerateContrast:0];
  [(PXCuratedLibrarySettings *)self setForceBadgesOnAllAssets:0];
  [(PXCuratedLibrarySettings *)self setForceShowAllButtonsVisible:0];
  [(PXCuratedLibrarySettings *)self setHideStatusFooter:0];
  [(PXCuratedLibrarySettings *)self setHideStatusFooterInSelectMode:1];
  [(PXCuratedLibrarySettings *)self setHideAnalyzingStatus:0];
  [(PXCuratedLibrarySettings *)self setIncludeGuestAssetsInFooterCount:0];
}

- (void)setZoomLevelPinchSignificantScaleDelta:(double)a3
{
  self->_zoomLevelPinchSignificantScaleDelta = a3;
}

- (void)setZoomLevelControlSegmentExpansionFactor:(double)a3
{
  self->_zoomLevelControlSegmentExpansionFactor = a3;
}

- (void)setYearsHeadersFadeoutOffset:(double)a3
{
  self->_yearsHeadersFadeoutOffset = a3;
}

- (void)setYearsHeadersFadeoutMinimumAlpha:(double)a3
{
  self->_yearsHeadersFadeoutMinimumAlpha = a3;
}

- (void)setYearsHeadersFadeoutDistance:(double)a3
{
  self->_yearsHeadersFadeoutDistance = a3;
}

- (void)setYearsHeaderGradientHeight:(double)a3
{
  self->_yearsHeaderGradientHeight = a3;
}

- (void)setYearsHeaderGradientAlpha:(double)a3
{
  self->_yearsHeaderGradientAlpha = a3;
}

- (void)setUseWideModularLayoutInYears:(BOOL)a3
{
  self->_useWideModularLayoutInYears = a3;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (void)setUseCustomDaysCurationType:(BOOL)a3
{
  self->_useCustomDaysCurationType = a3;
}

- (void)setTransitionToOrFromAllPhotosScale:(double)a3
{
  self->_transitionToOrFromAllPhotosScale = a3;
}

- (void)setTransitionToOrFromAllPhotosAnimationDuration:(double)a3
{
  self->_transitionToOrFromAllPhotosAnimationDuration = a3;
}

- (void)setTransitionScaleForDayNotMatchingMonths:(double)a3
{
  self->_transitionScaleForDayNotMatchingMonths = a3;
}

- (void)setTopInsetForVisibilityAnchoring:(double)a3
{
  self->_topInsetForVisibilityAnchoring = a3;
}

- (void)setSwipeBackGestureMinTranslation:(double)a3
{
  self->_swipeBackGestureMinTranslation = a3;
}

- (void)setSwipeBackGestureMinAngle:(double)a3
{
  self->_swipeBackGestureMinAngle = a3;
}

- (void)setStatusBarGradientHeight:(double)a3
{
  self->_statusBarGradientHeight = a3;
}

- (void)setStatusBarGradientAndStyleFadeDuration:(double)a3
{
  self->_statusBarGradientAndStyleFadeDuration = a3;
}

- (void)setStatusBarGradientAlpha:(double)a3
{
  self->_statusBarGradientAlpha = a3;
}

- (void)setStabilizeLivePhotos:(BOOL)a3
{
  self->_stabilizeLivePhotos = a3;
}

- (void)setSpacingBetweenDays:(double)a3
{
  self->_spacingBetweenDays = a3;
}

- (void)setSlideshowTriggerDelay:(double)a3
{
  self->_slideshowTriggerDelay = a3;
}

- (void)setSlideshowIntervalDelay:(double)a3
{
  self->_slideshowIntervalDelay = a3;
}

- (void)setSkimmingScale:(double)a3
{
  self->_skimmingScale = a3;
}

- (void)setShowStatusBar:(BOOL)a3
{
  self->_showStatusBar = a3;
}

- (void)setShowSecondaryToolbar:(BOOL)a3
{
  self->_showSecondaryToolbar = a3;
}

- (void)setShowSaliencyRects:(BOOL)a3
{
  self->_showSaliencyRects = a3;
}

- (void)setShowDebugInformationInFloatingHeader:(BOOL)a3
{
  self->_showDebugInformationInFloatingHeader = a3;
}

- (void)setShowAllHighlights:(BOOL)a3
{
  self->_showAllHighlights = a3;
}

- (void)setSectionsToPrefetch:(int64_t)a3
{
  self->_sectionsToPrefetch = a3;
}

- (void)setSectionShadowOpacity:(double)a3
{
  self->_sectionShadowOpacity = a3;
}

- (void)setSecondaryToolbarAlwaysVisible:(BOOL)a3
{
  self->_secondaryToolbarAlwaysVisible = a3;
}

- (void)setScrollSnapMinimumSpeed:(double)a3
{
  self->_scrollSnapMinimumSpeed = a3;
}

- (void)setScrollSnapMaximumDecelerationFactor:(double)a3
{
  self->_scrollSnapMaximumDecelerationFactor = a3;
}

- (void)setScrollSnapMaximumAccelerationFactor:(double)a3
{
  self->_scrollSnapMaximumAccelerationFactor = a3;
}

- (void)setSavedAllPhotosScrollPositionAnchorAssetIdentifier:(id)a3
{
}

- (void)setPlayingRecordsUpdateRateLimit:(double)a3
{
  self->_playingRecordsUpdateRateLimit = a3;
}

- (void)setPlaybackVisibleRectEdgeInset:(double)a3
{
  self->_playbackVisibleRectEdgeInset = a3;
}

- (void)setPlayBestTimeRange:(BOOL)a3
{
  self->_playBestTimeRange = a3;
}

- (void)setNonInterestingPromotionScore:(double)a3
{
  self->_nonInterestingPromotionScore = a3;
}

- (void)setNonAnchorYearsFadeSpeed:(double)a3
{
  self->_nonAnchorYearsFadeSpeed = a3;
}

- (void)setNonAnchorMonthsFadeSpeed:(double)a3
{
  self->_nonAnchorMonthsFadeSpeed = a3;
}

- (void)setNonAnchorDaysFadeSpeed:(double)a3
{
  self->_nonAnchorDaysFadeSpeed = a3;
}

- (void)setMonthsSmallHeaderGradientHeight:(double)a3
{
  self->_monthsSmallHeaderGradientHeight = a3;
}

- (void)setMonthsInlineHeadersFadeoutOffset:(double)a3
{
  self->_monthsInlineHeadersFadeoutOffset = a3;
}

- (void)setMonthsInlineHeadersFadeoutMinimumAlpha:(double)a3
{
  self->_monthsInlineHeadersFadeoutMinimumAlpha = a3;
}

- (void)setMonthsInlineHeadersFadeoutDistance:(double)a3
{
  self->_monthsInlineHeadersFadeoutDistance = a3;
}

- (void)setMonthsHeaderGradientHeight:(double)a3
{
  self->_monthsHeaderGradientHeight = a3;
}

- (void)setMonthsHeaderGradientAlpha:(double)a3
{
  self->_monthsHeaderGradientAlpha = a3;
}

- (void)setMonthsFloatingHeadersSubtitleAlpha:(double)a3
{
  self->_monthsFloatingHeadersSubtitleAlpha = a3;
}

- (void)setMonthsFloatingHeadersFadeoutDistance:(double)a3
{
  self->_monthsFloatingHeadersFadeoutDistance = a3;
}

- (void)setMonthsFloatingHeadersDistanceFromSafeAreaTop:(double)a3
{
  self->_monthsFloatingHeadersDistanceFromSafeAreaTop = a3;
}

- (void)setMonthsFloatingHeadersAppearanceCrossfadeStartDistance:(double)a3
{
  self->_monthsFloatingHeadersAppearanceCrossfadeStartDistance = a3;
}

- (void)setMonthsFloatingHeadersAppearanceCrossfadeDistance:(double)a3
{
  self->_monthsFloatingHeadersAppearanceCrossfadeDistance = a3;
}

- (void)setMinimumVisibleHeightForTopMostSection:(double)a3
{
  self->_minimumVisibleHeightForTopMostSection = a3;
}

- (void)setMinAutoplaySuggestionScore:(double)a3
{
  self->_minAutoplaySuggestionScore = a3;
}

- (void)setMaxNumberOfPlayingItems:(int64_t)a3
{
  self->_maxNumberOfPlayingItems = a3;
}

- (void)setLivePhotoLoopingCrossfadeDuration:(double)a3
{
  self->_livePhotoLoopingCrossfadeDuration = a3;
}

- (void)setLaunchToSavedAllPhotosScrollPosition:(BOOL)a3
{
  self->_launchToSavedAllPhotosScrollPosition = a3;
}

- (void)setLateralMarginYears:(double)a3
{
  self->_lateralMarginYears = a3;
}

- (void)setLateralMarginMonths:(double)a3
{
  self->_lateralMarginMonths = a3;
}

- (void)setLateralMarginDays:(double)a3
{
  self->_lateralMarginDays = a3;
}

- (void)setLargeHeroMinimumScore:(double)a3
{
  self->_largeHeroMinimumScore = a3;
}

- (void)setLargeHeroDensity:(int64_t)a3
{
  self->_largeHeroDensity = a3;
}

- (void)setInteritemSpacingForDays:(double)a3
{
  self->_interitemSpacingForDays = a3;
}

- (void)setInitialZoomLevel:(int64_t)a3
{
  self->_initialZoomLevel = a3;
}

- (void)setIncludeGuestAssetsInFooterCount:(BOOL)a3
{
  self->_includeGuestAssetsInFooterCount = a3;
}

- (void)setHideStatusFooterInSelectMode:(BOOL)a3
{
  self->_hideStatusFooterInSelectMode = a3;
}

- (void)setHideStatusFooter:(BOOL)a3
{
  self->_hideStatusFooter = a3;
}

- (void)setHideRecents:(BOOL)a3
{
  self->_hideRecents = a3;
}

- (void)setHideAnalyzingStatus:(BOOL)a3
{
  self->_hideAnalyzingStatus = a3;
}

- (void)setHideAggregations:(BOOL)a3
{
  self->_hideAggregations = a3;
}

- (void)setForcedNumberOfYearsColumn:(int64_t)a3
{
  self->_forcedNumberOfYearsColumn = a3;
}

- (void)setForceShowAllButtonsVisible:(BOOL)a3
{
  self->_forceShowAllButtonsVisible = a3;
}

- (void)setForcePlayback:(BOOL)a3
{
  self->_forcePlayback = a3;
}

- (void)setForceFloatingHeaderVisible:(BOOL)a3
{
  self->_forceFloatingHeaderVisible = a3;
}

- (void)setForceBadgesOnAllAssets:(BOOL)a3
{
  self->_forceBadgesOnAllAssets = a3;
}

- (void)setFloatingHeadersAppearanceCrossfadeDuration:(double)a3
{
  self->_floatingHeadersAppearanceCrossfadeDuration = a3;
}

- (void)setFloatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom:(double)a3
{
  self->_floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom = a3;
}

- (void)setFloatingHeaderFadeOverDistance:(double)a3
{
  self->_floatingHeaderFadeOverDistance = a3;
}

- (void)setFloatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop:(double)a3
{
  self->_floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop = a3;
}

- (void)setFloatingHeaderButtonsFadeOverDistance:(double)a3
{
  self->_floatingHeaderButtonsFadeOverDistance = a3;
}

- (void)setFirstTimeExperienceMaxNonProcessedHighlights:(int64_t)a3
{
  self->_firstTimeExperienceMaxNonProcessedHighlights = a3;
}

- (void)setFirstTimeExperienceMaxNonProcessedAssets:(int64_t)a3
{
  self->_firstTimeExperienceMaxNonProcessedAssets = a3;
}

- (void)setFirstTimeExperienceAlwaysLogReadiness:(BOOL)a3
{
  self->_firstTimeExperienceAlwaysLogReadiness = a3;
}

- (void)setFaultOutPadding:(double)a3
{
  self->_faultOutPadding = a3;
}

- (void)setFaultInDistance:(double)a3
{
  self->_faultInDistance = a3;
}

- (void)setExternalSecondaryToolbarHeight:(double)a3
{
  self->_externalSecondaryToolbarHeight = a3;
}

- (void)setExaggerateContrast:(BOOL)a3
{
  self->_exaggerateContrast = a3;
}

- (void)setEnableTapOnTitleToScroll:(BOOL)a3
{
  self->_enableTapOnTitleToScroll = a3;
}

- (void)setEnableSlideshowInYears:(BOOL)a3
{
  self->_enableSlideshowInYears = a3;
}

- (void)setEnableSkimmingInYears:(BOOL)a3
{
  self->_enableSkimmingInYears = a3;
}

- (void)setEnableShowAllButtons:(BOOL)a3
{
  self->_enableShowAllButtons = a3;
}

- (void)setEnableRecentlyEditedAlbum:(BOOL)a3
{
  self->_enableRecentlyEditedAlbum = a3;
}

- (void)setEnablePlaybackDiagnostics:(BOOL)a3
{
  self->_enablePlaybackDiagnostics = a3;
}

- (void)setEnablePlayMovieInYears:(BOOL)a3
{
  self->_enablePlayMovieInYears = a3;
}

- (void)setEnableInteractiveTransition:(BOOL)a3
{
  self->_enableInteractiveTransition = a3;
}

- (void)setEnableInlinePlaybackInZoomableGrids:(BOOL)a3
{
  self->_enableInlinePlaybackInZoomableGrids = a3;
}

- (void)setEnableInlinePlayback:(BOOL)a3
{
  self->_enableInlinePlayback = a3;
}

- (void)setEnableCustomScrollToTopOrBottom:(BOOL)a3
{
  self->_enableCustomScrollToTopOrBottom = a3;
}

- (void)setEmulatesEmptyLibrary:(BOOL)a3
{
  self->_emulatesEmptyLibrary = a3;
}

- (void)setDefaultZoomLevelTransitionMaximumScaleAroundAnchor:(double)a3
{
  self->_defaultZoomLevelTransitionMaximumScaleAroundAnchor = a3;
}

- (void)setDefaultZoomLevelTransitionAnimationDuration:(double)a3
{
  self->_defaultZoomLevelTransitionAnimationDuration = a3;
}

- (void)setDaysHeaderGradientHeight:(double)a3
{
  self->_daysHeaderGradientHeight = a3;
}

- (void)setDaysHeaderGradientAlpha:(double)a3
{
  self->_daysHeaderGradientAlpha = a3;
}

- (void)setDaysCurationType:(unsigned __int16)a3
{
  self->_daysCurationType = a3;
}

- (void)setCornerRadiusForYears:(double)a3
{
  self->_cornerRadiusForYears = a3;
}

- (void)setCornerRadiusForMonths:(double)a3
{
  self->_cornerRadiusForMonths = a3;
}

- (void)setCornerRadiusForDays:(double)a3
{
  self->_cornerRadiusForDays = a3;
}

- (void)setBottomCenterSecondaryToolbarWidth:(double)a3
{
  self->_bottomCenterSecondaryToolbarWidth = a3;
}

- (void)setBlurredBackgroundRadius:(double)a3
{
  self->_blurredBackgroundRadius = a3;
}

- (void)setAspectRatioForRegularYears:(double)a3
{
  self->_aspectRatioForRegularYears = a3;
}

- (void)setAspectRatioForCompactPortraitYears:(double)a3
{
  self->_aspectRatioForCompactPortraitYears = a3;
}

- (void)setAspectRatioForCompactPortraitMonths:(double)a3
{
  self->_aspectRatioForCompactPortraitMonths = a3;
}

- (void)setAspectRatioForCompactLandscapeYears:(double)a3
{
  self->_aspectRatioForCompactLandscapeYears = a3;
}

- (void)setAlwaysShowSecondaryToolbarAtBottom:(BOOL)a3
{
  self->_alwaysShowSecondaryToolbarAtBottom = a3;
}

- (void)setAllowsCustomDateTitles:(BOOL)a3
{
  self->_allowsCustomDateTitles = a3;
}

- (void)setAllowSpecialPanoHeaders:(double)a3
{
  self->_allowSpecialPanoHeaders = a3;
}

- (void)setAlignActionButtonsTrailingEdges:(BOOL)a3
{
  self->_alignActionButtonsTrailingEdges = a3;
}

- (double)zoomLevelPinchSignificantScaleDelta
{
  return self->_zoomLevelPinchSignificantScaleDelta;
}

- (BOOL)launchToSavedAllPhotosScrollPosition
{
  return self->_launchToSavedAllPhotosScrollPosition;
}

- (BOOL)forceBadgesOnAllAssets
{
  return self->_forceBadgesOnAllAssets;
}

void __42__PXCuratedLibrarySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 curatedLibrarySettings];
  v1 = (void *)sharedInstance_sharedInstance_203935;
  sharedInstance_sharedInstance_203935 = v0;
}

- (BOOL)enableSlideshowInYears
{
  return self->_enableSlideshowInYears;
}

- (double)slideshowTriggerDelay
{
  return self->_slideshowTriggerDelay;
}

- (double)slideshowIntervalDelay
{
  return self->_slideshowIntervalDelay;
}

- (double)statusBarGradientHeight
{
  return self->_statusBarGradientHeight;
}

- (double)statusBarGradientAndStyleFadeDuration
{
  return self->_statusBarGradientAndStyleFadeDuration;
}

- (double)statusBarGradientAlpha
{
  return self->_statusBarGradientAlpha;
}

- (BOOL)firstTimeExperienceAlwaysLogReadiness
{
  return self->_firstTimeExperienceAlwaysLogReadiness;
}

+ (id)settingsControllerModule
{
  v380[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F941A8];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Review All", &__block_literal_global_157717);
  v380[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v380 count:1];
  v358 = [v2 sectionWithRows:v4 title:@"External Assets"];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Launch to Saved All Photos Position" valueKeyPath:@"launchToSavedAllPhotosScrollPosition"];
  v379[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Save Current All Photos Position", &__block_literal_global_19_157722);
  v8 = [v7 conditionFormat:@"launchToSavedAllPhotosScrollPosition != 0"];
  v379[1] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Slideshow In Years" valueKeyPath:@"enableSlideshowInYears"];
  v379[2] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Play Movie In Years" valueKeyPath:@"enablePlayMovieInYears"];
  v379[3] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Analyzing Status" valueKeyPath:@"hideAnalyzingStatus"];
  v379[4] = v11;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v13 = NSStringFromSelector(sel_emulatesEmptyLibrary);
  v14 = [v12 rowWithTitle:@"Emulates Empty Library" valueKeyPath:v13];
  v379[5] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v379 count:6];
  v357 = [v5 sectionWithRows:v15 title:@"Demo"];

  v355 = (void *)MEMORY[0x1E4F94160];
  v16 = (void *)MEMORY[0x1E4F941D8];
  v352 = NSStringFromSelector(sel_blurredBackgroundRadius);
  v348 = [v16 rowWithTitle:@"Y/M Blur Radius" valueKeyPath:v352];
  v344 = [v348 minValue:0.0 maxValue:60.0];
  v341 = objc_msgSend(v344, "px_increment:", 1.0);
  v378[0] = v341;
  v17 = (void *)MEMORY[0x1E4F941D8];
  v337 = NSStringFromSelector(sel_blurredBackgroundInitialOpacity);
  v332 = [v17 rowWithTitle:@"Blur Initial Opacity" valueKeyPath:v337];
  v326 = [v332 minValue:0.0 maxValue:1.0];
  v18 = objc_msgSend(v326, "px_increment:", 0.01);
  v378[1] = v18;
  v19 = (void *)MEMORY[0x1E4F941D8];
  v20 = NSStringFromSelector(sel_blurredBackgroundFinalOpacity);
  v21 = [v19 rowWithTitle:@"Blur Final Opacity" valueKeyPath:v20];
  v22 = [v21 minValue:0.0 maxValue:1.0];
  v23 = objc_msgSend(v22, "px_increment:", 0.01);
  v378[2] = v23;
  v24 = (void *)MEMORY[0x1E4F941D8];
  v25 = NSStringFromSelector(sel_blurredBackgroundFadeDuration);
  v26 = [v24 rowWithTitle:@"Blur Fade Duration" valueKeyPath:v25];
  v27 = [v26 minValue:0.0 maxValue:5.0];
  v28 = objc_msgSend(v27, "px_increment:", 0.05);
  v378[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v378 count:4];
  v356 = [v355 sectionWithRows:v29 title:@"Lemonade"];

  v353 = (void *)MEMORY[0x1E4F94160];
  v349 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Tap on Title to Scroll" valueKeyPath:@"enableTapOnTitleToScroll"];
  v377[0] = v349;
  v345 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Custom Scroll to Top/Bottom" valueKeyPath:@"enableCustomScrollToTopOrBottom"];
  v377[1] = v345;
  v30 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Snap Max Deceleration" valueKeyPath:@"scrollSnapMaximumDecelerationFactor"];
  v31 = [v30 minValue:1.0 maxValue:5.0];
  v32 = objc_msgSend(v31, "px_increment:", 0.1);
  v377[2] = v32;
  v33 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Snap Max Acceleration" valueKeyPath:@"scrollSnapMaximumAccelerationFactor"];
  v34 = [v33 minValue:1.0 maxValue:5.0];
  v35 = objc_msgSend(v34, "px_increment:", 0.1);
  v377[3] = v35;
  v36 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Snap Min Speed" valueKeyPath:@"scrollSnapMinimumSpeed"];
  v37 = [v36 minValue:0.0 maxValue:0.5];
  v38 = objc_msgSend(v37, "px_increment:", 0.01);
  v377[4] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v377 count:5];
  v354 = [v353 sectionWithRows:v39 title:@"Scrolling"];

  v350 = (void *)MEMORY[0x1E4F94160];
  v346 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Saliency for Layouts" valueKeyPath:@"useSaliency"];
  v376[0] = v346;
  v342 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Saliency Rects" valueKeyPath:@"showSaliencyRects"];
  v376[1] = v342;
  v338 = [MEMORY[0x1E4F94108] rowWithTitle:@"Large Hero Density" valueKeyPath:@"largeHeroDensity"];
  id v40 = &unk_1F02D4378;
  id v41 = &unk_1F02D4390;
  v333 = [v338 possibleValues:&unk_1F02D4378 titles:&unk_1F02D4390];
  v376[2] = v333;
  v327 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Large Hero Min Score" valueKeyPath:@"largeHeroMinimumScore"];
  v320 = [v327 minValue:0.0 maxValue:1.0];
  v315 = objc_msgSend(v320, "px_increment:", 0.05);
  v376[3] = v315;
  v309 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Forced Years Column" valueKeyPath:@"forcedNumberOfYearsColumn"];
  v302 = [v309 minValue:0.0 maxValue:3.0];
  v295 = objc_msgSend(v302, "px_increment:", 1.0);
  v376[4] = v295;
  v289 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Days Spacing" valueKeyPath:@"spacingBetweenDays"];
  v282 = [v289 minValue:0.0 maxValue:100.0];
  v275 = objc_msgSend(v282, "px_increment:", 1.0);
  v376[5] = v275;
  v268 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Days Item Spacing" valueKeyPath:@"interitemSpacingForDays"];
  v261 = [v268 minValue:0.0 maxValue:5.0];
  v254 = objc_msgSend(v261, "px_increment:", 0.5);
  v376[6] = v254;
  id v246 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Special Pano Headers" valueKeyPath:@"allowSpecialPanoHeaders"];
  v376[7] = v246;
  v240 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Top Visibility Inset" valueKeyPath:@"topInsetForVisibilityAnchoring"];
  v234 = [v240 minValue:0.0 maxValue:200.0];
  v228 = objc_msgSend(v234, "px_increment:", 5.0);
  v376[8] = v228;
  v223 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Section Shadow Opacity" valueKeyPath:@"sectionShadowOpacity"];
  v220 = [v223 minValue:0.0 maxValue:1.0];
  v217 = objc_msgSend(v220, "px_increment:", 0.05);
  v376[9] = v217;
  v214 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Skimming Scale" valueKeyPath:@"skimmingScale"];
  v211 = [v214 minValue:0.5 maxValue:1.0];
  v42 = objc_msgSend(v211, "px_increment:", 0.01);
  v376[10] = v42;
  v43 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fault In Distance" valueKeyPath:@"faultInDistance"];
  v44 = [v43 minValue:0.0 maxValue:5000.0];
  v45 = objc_msgSend(v44, "px_increment:", 100.0);
  v376[11] = v45;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fault Out Padding" valueKeyPath:@"faultOutPadding"];
  v47 = [v46 minValue:0.0 maxValue:5000.0];
  v48 = objc_msgSend(v47, "px_increment:", 100.0);
  v376[12] = v48;
  v49 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Status Footer" valueKeyPath:@"hideStatusFooter"];
  v376[13] = v49;
  v50 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Status Footer In Select Mode" valueKeyPath:@"hideStatusFooterInSelectMode"];
  v376[14] = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v376 count:15];
  v351 = [v350 sectionWithRows:v51 title:@"Layout"];

  v52 = (void *)MEMORY[0x1E4F94160];
  v53 = [MEMORY[0x1E4F94108] rowWithTitle:@"Years Aspect Ratio" valueKeyPath:@"aspectRatioForCompactPortraitYears"];
  v54 = [v53 possibleValues:&unk_1F02D49C0 titles:&unk_1F02D49D8];
  v375[0] = v54;
  v55 = [MEMORY[0x1E4F94108] rowWithTitle:@"Years Landscape Aspect Ratio" valueKeyPath:@"aspectRatioForCompactLandscapeYears"];
  v56 = [v55 possibleValues:&unk_1F02D49C0 titles:&unk_1F02D49D8];
  v375[1] = v56;
  v57 = [MEMORY[0x1E4F94108] rowWithTitle:@"Months Aspect Ratio" valueKeyPath:@"aspectRatioForCompactPortraitMonths"];
  v58 = [v57 possibleValues:&unk_1F02D49C0 titles:&unk_1F02D49D8];
  v375[2] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v375 count:3];
  v347 = [v52 sectionWithRows:v59 title:@"Phone Layout"];

  v60 = (void *)MEMORY[0x1E4F94160];
  v61 = [MEMORY[0x1E4F94108] rowWithTitle:@"Years Aspect Ratio" valueKeyPath:@"aspectRatioForRegularYears"];
  v62 = [v61 possibleValues:&unk_1F02D49C0 titles:&unk_1F02D49D8];
  v374 = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v374 count:1];
  v343 = [v60 sectionWithRows:v63 title:@"Pad Layout"];

  v339 = (void *)MEMORY[0x1E4F94160];
  v334 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Floating Header Visible" valueKeyPath:@"forceFloatingHeaderVisible"];
  v373[0] = v334;
  v328 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Debug Info in Floating Header" valueKeyPath:@"showDebugInformationInFloatingHeader"];
  v373[1] = v328;
  v321 = [MEMORY[0x1E4F94108] rowWithTitle:@"Min. Visible Section Height" valueKeyPath:@"minimumVisibleHeightForTopMostSection"];
  v316 = objc_msgSend(v321, "px_possibleValues:", &unk_1F02D49F0);
  v373[2] = v316;
  v310 = [MEMORY[0x1E4F941F0] rowWithTitle:@"“Show All“ Buttons" valueKeyPath:@"enableShowAllButtons"];
  v373[3] = v310;
  v303 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Custom Date Titles" valueKeyPath:@"allowsCustomDateTitles"];
  v373[4] = v303;
  v296 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Years Header Gradient Alpha" valueKeyPath:@"yearsHeaderGradientAlpha"];
  v290 = [v296 minValue:0.0 maxValue:1.0];
  v283 = objc_msgSend(v290, "px_increment:", 0.0500000007);
  v373[5] = v283;
  v276 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Years Header Gradient Height" valueKeyPath:@"yearsHeaderGradientHeight"];
  v269 = [v276 minValue:0.0 maxValue:350.0];
  v262 = objc_msgSend(v269, "px_increment:", 10.0);
  v373[6] = v262;
  v255 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Years Header Gradient Alpha" valueKeyPath:@"monthsHeaderGradientAlpha"];
  id v247 = [v255 minValue:0.0 maxValue:1.0];
  v241 = objc_msgSend(v247, "px_increment:", 0.0500000007);
  v373[7] = v241;
  v235 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Months Header Gradient Height" valueKeyPath:@"monthsHeaderGradientHeight"];
  v229 = [v235 minValue:0.0 maxValue:350.0];
  v224 = objc_msgSend(v229, "px_increment:", 10.0);
  v373[8] = v224;
  v221 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Months Small Header Gradient Height" valueKeyPath:@"monthsSmallHeaderGradientHeight"];
  v218 = [v221 minValue:0.0 maxValue:350.0];
  v215 = objc_msgSend(v218, "px_increment:", 10.0);
  v373[9] = v215;
  v212 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Days Header Gradient Alpha" valueKeyPath:@"daysHeaderGradientAlpha"];
  v209 = [v212 minValue:0.0 maxValue:1.0];
  v207 = objc_msgSend(v209, "px_increment:", 0.0500000007);
  v373[10] = v207;
  v205 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Days Header Gradient Height" valueKeyPath:@"daysHeaderGradientHeight"];
  v203 = [v205 minValue:0.0 maxValue:350.0];
  v201 = objc_msgSend(v203, "px_increment:", 10.0);
  v373[11] = v201;
  v199 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Status Bar" valueKeyPath:@"showStatusBar"];
  v373[12] = v199;
  v197 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Status Bar Gradient Alpha" valueKeyPath:@"statusBarGradientAlpha"];
  v195 = [v197 minValue:0.0 maxValue:1.0];
  v194 = objc_msgSend(v195, "px_increment:", 0.0500000007);
  v373[13] = v194;
  v193 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Status Bar Gradient Height" valueKeyPath:@"statusBarGradientHeight"];
  v192 = [v193 minValue:0.0 maxValue:350.0];
  v191 = objc_msgSend(v192, "px_increment:", 10.0);
  v373[14] = v191;
  v64 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Status Bar Gradient & Style Fade Duration" valueKeyPath:@"statusBarGradientAndStyleFadeDuration"];
  v65 = [v64 minValue:0.0 maxValue:1.0];
  v66 = objc_msgSend(v65, "px_increment:", 0.0500000007);
  v373[15] = v66;
  v67 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Toolbar Always Visible" valueKeyPath:@"secondaryToolbarAlwaysVisible"];
  v373[16] = v67;
  v68 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Toolbar Always at Bottom" valueKeyPath:@"alwaysShowSecondaryToolbarAtBottom"];
  v373[17] = v68;
  v69 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Bottom Toolbar Width" valueKeyPath:@"bottomCenterSecondaryToolbarWidth"];
  v70 = [v69 minValue:300.0 maxValue:1000.0];
  v71 = objc_msgSend(v70, "px_increment:", 10.0);
  v72 = [v71 conditionFormat:@"alwaysShowSecondaryToolbarAtBottom != 0"];
  v373[18] = v72;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v373 count:19];
  v340 = [v339 sectionWithRows:v73 title:@"Header"];

  v335 = (void *)MEMORY[0x1E4F94160];
  v329 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Position Threshold" valueKeyPath:@"floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom"];
  v322 = [v329 minValue:0.0 maxValue:300.0];
  v317 = objc_msgSend(v322, "px_increment:", 5.0);
  v372[0] = v317;
  v311 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Distance" valueKeyPath:@"floatingHeaderFadeOverDistance"];
  v304 = [v311 minValue:0.0 maxValue:300.0];
  v297 = objc_msgSend(v304, "px_increment:", 5.0);
  v372[1] = v297;
  v74 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Buttons Position Threshold" valueKeyPath:@"floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop"];
  v75 = [v74 minValue:-50.0 maxValue:100.0];
  v76 = objc_msgSend(v75, "px_increment:", 1.0);
  v372[2] = v76;
  v77 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Buttons Fade Distance" valueKeyPath:@"floatingHeaderButtonsFadeOverDistance"];
  v78 = [v77 minValue:1.0 maxValue:100.0];
  v79 = objc_msgSend(v78, "px_increment:", 1.0);
  v372[3] = v79;
  v80 = [MEMORY[0x1E4F941D8] rowWithTitle:@"X-Fade Duration" valueKeyPath:@"floatingHeadersAppearanceCrossfadeDuration"];
  v81 = [v80 minValue:0.0 maxValue:2.0];
  v82 = objc_msgSend(v81, "px_increment:", 0.1);
  v372[4] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v372 count:5];
  v336 = [v335 sectionWithRows:v83 title:@"Floating Header"];

  v330 = (void *)MEMORY[0x1E4F94160];
  v323 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Floating Distance" valueKeyPath:@"monthsFloatingHeadersDistanceFromSafeAreaTop"];
  v318 = [v323 minValue:-20.0 maxValue:50.0];
  v312 = objc_msgSend(v318, "px_increment:", 1.0);
  v371[0] = v312;
  v305 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Hysteresis Distance" valueKeyPath:@"monthsFloatingHeadersAppearanceCrossfadeStartDistance"];
  v298 = [v305 minValue:-1.0 maxValue:2.0];
  v291 = objc_msgSend(v298, "px_increment:", 0.05);
  v371[1] = v291;
  v284 = [MEMORY[0x1E4F941D8] rowWithTitle:@"X-Fade Distance" valueKeyPath:@"monthsFloatingHeadersAppearanceCrossfadeDistance"];
  v277 = [v284 minValue:0.0 maxValue:2.0];
  v270 = objc_msgSend(v277, "px_increment:", 0.1);
  v371[2] = v270;
  v263 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Out Distance" valueKeyPath:@"monthsFloatingHeadersFadeoutDistance"];
  v256 = [v263 minValue:0.0 maxValue:3.0];
  objc_msgSend(v256, "px_increment:", 0.1);
  id v248 = (id)objc_claimAutoreleasedReturnValue();
  v371[3] = v248;
  v242 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Floating Subtitle Alpha" valueKeyPath:@"monthsFloatingHeadersSubtitleAlpha"];
  v236 = [v242 minValue:0.0 maxValue:1.0];
  v230 = objc_msgSend(v236, "px_increment:", 0.01);
  v371[4] = v230;
  v84 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Inline Fade Offset" valueKeyPath:@"monthsInlineHeadersFadeoutOffset"];
  v85 = [v84 minValue:-1.0 maxValue:2.0];
  v86 = objc_msgSend(v85, "px_increment:", 0.1);
  v371[5] = v86;
  v87 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Inline Fade Distance" valueKeyPath:@"monthsInlineHeadersFadeoutDistance"];
  v88 = [v87 minValue:0.0 maxValue:3.0];
  v89 = objc_msgSend(v88, "px_increment:", 0.1);
  v371[6] = v89;
  v90 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Inline Min Alpha" valueKeyPath:@"monthsInlineHeadersFadeoutMinimumAlpha"];
  v91 = [v90 minValue:0.0 maxValue:1.0];
  v92 = objc_msgSend(v91, "px_increment:", 0.05);
  v371[7] = v92;
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v371 count:8];
  v331 = [v330 sectionWithRows:v93 title:@"Months Headers"];

  v324 = (void *)MEMORY[0x1E4F94160];
  v94 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Offset" valueKeyPath:@"yearsHeadersFadeoutOffset"];
  v95 = [v94 minValue:-100.0 maxValue:20.0];
  v96 = objc_msgSend(v95, "px_increment:", 1.0);
  v370[0] = v96;
  v97 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Distance" valueKeyPath:@"yearsHeadersFadeoutDistance"];
  v98 = [v97 minValue:0.0 maxValue:150.0];
  v99 = objc_msgSend(v98, "px_increment:", 1.0);
  v370[1] = v99;
  v100 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Alpha" valueKeyPath:@"yearsHeadersFadeoutMinimumAlpha"];
  v101 = [v100 minValue:0.0 maxValue:1.0];
  v102 = objc_msgSend(v101, "px_increment:", 0.05);
  v370[2] = v102;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v370 count:3];
  v325 = [v324 sectionWithRows:v103 title:@"Years Headers"];

  v104 = (void *)MEMORY[0x1E4F94160];
  v105 = (void *)MEMORY[0x1E4F941F0];
  v106 = NSStringFromSelector(sel_includeGuestAssetsInFooterCount);
  v107 = [v105 rowWithTitle:@"Counts Include Guest Assets" valueKeyPath:v106];
  v369 = v107;
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v369 count:1];
  v319 = [v104 sectionWithRows:v108 title:@"Footer"];

  v313 = (void *)MEMORY[0x1E4F94160];
  v306 = [MEMORY[0x1E4F94108] rowWithTitle:@"Initial Zoom Level" valueKeyPath:@"initialZoomLevel"];
  v299 = [v306 possibleValues:&unk_1F02D4A38 titles:&unk_1F02D4A50];
  v368[0] = v299;
  v292 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show All Highlights" valueKeyPath:@"showAllHighlights"];
  v368[1] = v292;
  v285 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Custom Days Curation" valueKeyPath:@"useCustomDaysCurationType"];
  v368[2] = v285;
  v109 = [MEMORY[0x1E4F94108] rowWithTitle:@"Days Curation" valueKeyPath:@"daysCurationType"];
  v110 = [v109 possibleValues:&unk_1F02D4A08 titles:&unk_1F02D4A20];
  v111 = [v110 conditionFormat:@"useCustomDaysCurationType == YES"];
  v368[3] = v111;
  v112 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Low Promotion Score Threshold" valueKeyPath:@"nonInterestingPromotionScore"];
  v113 = [v112 minValue:0.0 maxValue:1.0];
  v114 = objc_msgSend(v113, "px_increment:", 0.05);
  v115 = [v114 conditionFormat:@"showAllHighlights == 0"];
  v368[4] = v115;
  v116 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Recents" valueKeyPath:@"hideRecents"];
  v368[5] = v116;
  v117 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Aggregations" valueKeyPath:@"hideAggregations"];
  v368[6] = v117;
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v368 count:7];
  v314 = [v313 sectionWithRows:v118 title:@"Data Source"];

  v307 = (void *)MEMORY[0x1E4F94160];
  v119 = (void *)MEMORY[0x1E4F941F0];
  v300 = NSStringFromSelector(sel_enableInlinePlayback);
  v293 = [v119 rowWithTitle:@"Inline Playback" valueKeyPath:v300];
  v367[0] = v293;
  v120 = (void *)MEMORY[0x1E4F941F0];
  v286 = NSStringFromSelector(sel_enableInlinePlaybackInZoomableGrids);
  v278 = [v120 rowWithTitle:@"…in Zoomable Grid" valueKeyPath:v286];
  v271 = [v278 conditionFormat:@"enableInlinePlayback == YES"];
  v367[1] = v271;
  v264 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Playback" valueKeyPath:@"forcePlayback"];
  v257 = [v264 conditionFormat:@"enableInlinePlayback == YES"];
  v367[2] = v257;
  id v249 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Autoplay Suggestion Score" valueKeyPath:@"minAutoplaySuggestionScore"];
  v243 = [v249 minValue:0.0 maxValue:1.0];
  v237 = objc_msgSend(v243, "px_increment:", 0.100000001);
  v231 = [v237 conditionFormat:@"enableInlinePlayback == YES && forcePlayback == NO"];
  v367[3] = v231;
  v225 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Play Best Time Range" valueKeyPath:@"playBestTimeRange"];
  v222 = [v225 conditionFormat:@"enableInlinePlayback == YES "];
  v367[4] = v222;
  v219 = [MEMORY[0x1E4F94108] rowWithTitle:@"Max # of Playing Items" valueKeyPath:@"maxNumberOfPlayingItems"];
  v216 = [v219 possibleValues:&unk_1F02D4A68 titles:&unk_1F02D4A80];
  v213 = [v216 conditionFormat:@"enableInlinePlayback == YES"];
  v367[5] = v213;
  v210 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Playback Visibility Inset" valueKeyPath:@"playbackVisibleRectEdgeInset"];
  v208 = [v210 minValue:0.0 maxValue:200.0];
  v206 = objc_msgSend(v208, "px_increment:", 1.0);
  v204 = [v206 conditionFormat:@"enableInlinePlayback == YES"];
  v367[6] = v204;
  v202 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Live Photo Crossfade Duration" valueKeyPath:@"livePhotoLoopingCrossfadeDuration"];
  v200 = [v202 minValue:0.0 maxValue:1.0];
  v198 = objc_msgSend(v200, "px_increment:", 0.05);
  v196 = [v198 conditionFormat:@"enableInlinePlayback == YES"];
  v367[7] = v196;
  v121 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Playback Diagnostics" valueKeyPath:@"enablePlaybackDiagnostics"];
  v122 = [v121 conditionFormat:@"enableInlinePlayback == YES"];
  v367[8] = v122;
  v123 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Stabilize Live Photos" valueKeyPath:@"stabilizeLivePhotos"];
  v124 = [v123 conditionFormat:@"enableInlinePlayback == YES"];
  v367[9] = v124;
  v125 = (void *)MEMORY[0x1E4F941D8];
  v126 = NSStringFromSelector(sel_playingRecordsUpdateRateLimit);
  v127 = [v125 rowWithTitle:@"Playing Records Update Rate Limit" valueKeyPath:v126];
  v128 = [v127 minValue:0.0 maxValue:2.0];
  v129 = objc_msgSend(v128, "px_increment:", 0.02);
  v130 = [v129 conditionFormat:@"enableInlinePlayback == YES"];
  v367[10] = v130;
  v131 = [MEMORY[0x1E4F1C978] arrayWithObjects:v367 count:11];
  v308 = [v307 sectionWithRows:v131 title:@"Inline Media Playback"];

  v132 = (void *)MEMORY[0x1E4F94160];
  v133 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Trigger Delay" valueKeyPath:@"slideshowTriggerDelay"];
  v134 = [v133 minValue:1.0 maxValue:15.0];
  v135 = objc_msgSend(v134, "px_increment:", 0.5);
  v366[0] = v135;
  v136 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Interval Delay" valueKeyPath:@"slideshowIntervalDelay"];
  v137 = [v136 minValue:1.0 maxValue:15.0];
  v138 = objc_msgSend(v137, "px_increment:", 0.5);
  v366[1] = v138;
  v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:v366 count:2];
  v301 = [v132 sectionWithRows:v139 title:@"Slideshow"];

  v140 = (void *)MEMORY[0x1E4F94160];
  v141 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Non-Processed Highlights" valueKeyPath:@"firstTimeExperienceMaxNonProcessedHighlights"];
  v142 = [v141 minValue:0.0 maxValue:100.0];
  v143 = objc_msgSend(v142, "px_increment:", 1.0);
  v365[0] = v143;
  v144 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Non-Processed assets" valueKeyPath:@"firstTimeExperienceMaxNonProcessedAssets"];
  v145 = [v144 minValue:0.0 maxValue:1000.0];
  v146 = objc_msgSend(v145, "px_increment:", 50.0);
  v365[1] = v146;
  v147 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Log FTE Readiness" valueKeyPath:@"firstTimeExperienceAlwaysLogReadiness"];
  v365[2] = v147;
  v148 = [MEMORY[0x1E4F1C978] arrayWithObjects:v365 count:3];
  v294 = [v140 sectionWithRows:v148 title:@"First Time Experience"];

  v287 = (void *)MEMORY[0x1E4F94160];
  v279 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Zoom Level Duration" valueKeyPath:@"defaultZoomLevelTransitionAnimationDuration"];
  v272 = [v279 minValue:0.0 maxValue:2.0];
  v265 = objc_msgSend(v272, "px_increment:", 0.05);
  v364[0] = v265;
  v258 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Scale" valueKeyPath:@"defaultZoomLevelTransitionMaximumScaleAroundAnchor"];
  id v250 = [v258 minValue:1.0 maxValue:10.0];
  v244 = objc_msgSend(v250, "px_increment:", 0.1);
  v364[1] = v244;
  v238 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Years Fade Speed" valueKeyPath:@"nonAnchorYearsFadeSpeed"];
  v232 = [v238 minValue:1.0 maxValue:2.0];
  v226 = objc_msgSend(v232, "px_increment:", 0.05);
  v364[2] = v226;
  v149 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Months Fade Speed" valueKeyPath:@"nonAnchorMonthsFadeSpeed"];
  v150 = [v149 minValue:1.0 maxValue:2.0];
  v151 = objc_msgSend(v150, "px_increment:", 0.05);
  v364[3] = v151;
  v152 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Days Fade Speed" valueKeyPath:@"nonAnchorDaysFadeSpeed"];
  v153 = [v152 minValue:1.0 maxValue:2.0];
  v154 = objc_msgSend(v153, "px_increment:", 0.05);
  v364[4] = v154;
  v155 = [MEMORY[0x1E4F941D8] rowWithTitle:@"All Photos Duration" valueKeyPath:@"transitionToOrFromAllPhotosAnimationDuration"];
  v156 = [v155 minValue:0.0 maxValue:2.0];
  v157 = objc_msgSend(v156, "px_increment:", 0.05);
  v364[5] = v157;
  v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v364 count:6];
  v288 = [v287 sectionWithRows:v158 title:@"Animations"];

  v280 = (void *)MEMORY[0x1E4F94160];
  v159 = (void *)MEMORY[0x1E4F941F0];
  v273 = NSStringFromSelector(sel_enableInteractiveTransition);
  v266 = [v159 rowWithTitle:@"Interactive transitions" valueKeyPath:v273];
  v363[0] = v266;
  v259 = [MEMORY[0x1E4F941D8] rowWithTitle:@"All Photos Scale" valueKeyPath:@"transitionToOrFromAllPhotosScale"];
  id v251 = [v259 minValue:0.5 maxValue:1.0];
  v245 = objc_msgSend(v251, "px_increment:", 0.01);
  v363[1] = v245;
  v239 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Day Scale Not Matching Months" valueKeyPath:@"transitionScaleForDayNotMatchingMonths"];
  v233 = [v239 minValue:0.5 maxValue:1.0];
  v227 = objc_msgSend(v233, "px_increment:", 0.01);
  v363[2] = v227;
  v160 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Pinch Scale Delta" valueKeyPath:@"zoomLevelPinchSignificantScaleDelta"];
  v161 = [v160 minValue:0.0 maxValue:0.2];
  v162 = objc_msgSend(v161, "px_increment:", 0.01);
  v363[3] = v162;
  v163 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Swipe Back Angle" valueKeyPath:@"swipeBackGestureMinAngle"];
  v164 = [v163 minValue:10.0 maxValue:85.0];
  v165 = objc_msgSend(v164, "px_increment:", 1.0);
  v363[4] = v165;
  v166 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Swipe Back Translation" valueKeyPath:@"swipeBackGestureMinTranslation"];
  v167 = [v166 minValue:10.0 maxValue:100.0];
  v168 = objc_msgSend(v167, "px_increment:", 5.0);
  v363[5] = v168;
  v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:v363 count:6];
  v281 = [v280 sectionWithRows:v169 title:@"Transitions"];

  v170 = (void *)MEMORY[0x1E4F94160];
  v171 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Segment Expansion" valueKeyPath:@"zoomLevelControlSegmentExpansionFactor"];
  v172 = [v171 minValue:0.0 maxValue:1.0];
  v173 = objc_msgSend(v172, "px_increment:", 0.05);
  v362 = v173;
  v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v362 count:1];
  v274 = [v170 sectionWithRows:v174 title:@"Zoom Level Control"];

  v175 = (void *)MEMORY[0x1E4F94160];
  v176 = (void *)MEMORY[0x1E4F941F0];
  v177 = NSStringFromSelector(sel_enableRecentlyEditedAlbum);
  v178 = [v176 rowWithTitle:@"Enable Recently Edited Album" valueKeyPath:v177];
  v361[0] = v178;
  v179 = (void *)MEMORY[0x1E4F941F0];
  v180 = NSStringFromSelector(sel_alignActionButtonsTrailingEdges);
  v181 = [v179 rowWithTitle:@"Align Action Button Trailing Edge" valueKeyPath:v180];
  v361[1] = v181;
  v182 = [MEMORY[0x1E4F1C978] arrayWithObjects:v361 count:2];
  v267 = [v175 sectionWithRows:v182 title:@"Miscellaneous"];

  v183 = (void *)MEMORY[0x1E4F94160];
  v184 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Exaggerate Contrast" valueKeyPath:@"exaggerateContrast"];
  v360[0] = v184;
  v185 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Badges on All Assets" valueKeyPath:@"forceBadgesOnAllAssets"];
  v360[1] = v185;
  v186 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Show All Buttons Visible" valueKeyPath:@"forceShowAllButtonsVisible"];
  v360[2] = v186;
  v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:v360 count:3];
  v260 = [v183 sectionWithRows:v187 title:@"Debug"];

  v188 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  id v252 = (id)MEMORY[0x1E4F94160];
  v359[0] = v358;
  v359[1] = v357;
  v359[2] = v356;
  v359[3] = v354;
  v359[4] = v351;
  v359[5] = v347;
  v359[6] = v343;
  v359[7] = v340;
  v359[8] = v336;
  v359[9] = v331;
  v359[10] = v325;
  v359[11] = v319;
  v359[12] = v314;
  v359[13] = v308;
  v359[14] = v301;
  v359[15] = v294;
  v359[16] = v288;
  v359[17] = v281;
  v359[18] = v274;
  v359[19] = v267;
  v359[20] = v260;
  v359[21] = v188;
  v189 = [MEMORY[0x1E4F1C978] arrayWithObjects:v359 count:22];
  id v253 = [v252 moduleWithTitle:@"Curated Library" contents:v189];

  return v253;
}

void __56__PXCuratedLibrarySettings_UI__settingsControllerModule__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:PXCuratedLibrarySaveCurrentAllPhotosScrollPositionNotificationName object:0];
}

void __56__PXCuratedLibrarySettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v15 = 0;
  objc_super v3 = PXExternalContentReviewViewController((uint64_t)&v15);
  id v4 = v15;
  v5 = v4;
  if (!v3)
  {
    id v6 = [v4 localizedDescription];
    id v7 = v2;
    v8 = v7;
    if (v6)
    {
      if (v7)
      {
LABEL_5:
        v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:0 preferredStyle:1];
        v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
        [v9 addAction:v10];

        [v8 presentViewController:v9 animated:1 completion:0];
        goto LABEL_6;
      }
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentAlertForNavigationController(NSString *__strong, NSString * _Nullable __strong, UINavigationController *__strong)");
      [v11 handleFailureInFunction:v12, @"PXCuratedLibrarySettings+UI.m", 264, @"Invalid parameter not satisfying: %@", @"title" file lineNumber description];

      if (v8) {
        goto LABEL_5;
      }
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PresentAlertForNavigationController(NSString *__strong, NSString * _Nullable __strong, UINavigationController *__strong)");
    [v13 handleFailureInFunction:v14, @"PXCuratedLibrarySettings+UI.m", 265, @"Invalid parameter not satisfying: %@", @"navigationController" file lineNumber description];

    goto LABEL_5;
  }
  [v2 pushViewController:v3 animated:1];
LABEL_6:
}

- (void).cxx_destruct
{
}

- (BOOL)forceShowAllButtonsVisible
{
  return self->_forceShowAllButtonsVisible;
}

- (double)externalSecondaryToolbarHeight
{
  return self->_externalSecondaryToolbarHeight;
}

- (double)lateralMarginYears
{
  return self->_lateralMarginYears;
}

- (double)lateralMarginMonths
{
  return self->_lateralMarginMonths;
}

- (double)lateralMarginDays
{
  return self->_lateralMarginDays;
}

- (BOOL)alignActionButtonsTrailingEdges
{
  return self->_alignActionButtonsTrailingEdges;
}

- (BOOL)enableRecentlyEditedAlbum
{
  return self->_enableRecentlyEditedAlbum;
}

- (double)transitionScaleForDayNotMatchingMonths
{
  return self->_transitionScaleForDayNotMatchingMonths;
}

- (double)transitionToOrFromAllPhotosScale
{
  return self->_transitionToOrFromAllPhotosScale;
}

- (double)transitionToOrFromAllPhotosAnimationDuration
{
  return self->_transitionToOrFromAllPhotosAnimationDuration;
}

- (double)nonAnchorDaysFadeSpeed
{
  return self->_nonAnchorDaysFadeSpeed;
}

- (double)nonAnchorMonthsFadeSpeed
{
  return self->_nonAnchorMonthsFadeSpeed;
}

- (double)nonAnchorYearsFadeSpeed
{
  return self->_nonAnchorYearsFadeSpeed;
}

- (double)defaultZoomLevelTransitionMaximumScaleAroundAnchor
{
  return self->_defaultZoomLevelTransitionMaximumScaleAroundAnchor;
}

- (double)defaultZoomLevelTransitionAnimationDuration
{
  return self->_defaultZoomLevelTransitionAnimationDuration;
}

- (BOOL)enableInteractiveTransition
{
  return self->_enableInteractiveTransition;
}

- (BOOL)stabilizeLivePhotos
{
  return self->_stabilizeLivePhotos;
}

- (double)livePhotoLoopingCrossfadeDuration
{
  return self->_livePhotoLoopingCrossfadeDuration;
}

- (int64_t)maxNumberOfPlayingItems
{
  return self->_maxNumberOfPlayingItems;
}

- (BOOL)playBestTimeRange
{
  return self->_playBestTimeRange;
}

- (double)minAutoplaySuggestionScore
{
  return self->_minAutoplaySuggestionScore;
}

- (BOOL)forcePlayback
{
  return self->_forcePlayback;
}

- (BOOL)enableInlinePlayback
{
  return self->_enableInlinePlayback;
}

- (unsigned)daysCurationType
{
  return self->_daysCurationType;
}

- (BOOL)useCustomDaysCurationType
{
  return self->_useCustomDaysCurationType;
}

- (int64_t)initialZoomLevel
{
  return self->_initialZoomLevel;
}

- (BOOL)includeGuestAssetsInFooterCount
{
  return self->_includeGuestAssetsInFooterCount;
}

- (double)monthsHeaderGradientHeight
{
  return self->_monthsHeaderGradientHeight;
}

- (BOOL)enableShowAllButtons
{
  return self->_enableShowAllButtons;
}

- (double)minimumVisibleHeightForTopMostSection
{
  return self->_minimumVisibleHeightForTopMostSection;
}

- (BOOL)showDebugInformationInFloatingHeader
{
  return self->_showDebugInformationInFloatingHeader;
}

- (BOOL)forceFloatingHeaderVisible
{
  return self->_forceFloatingHeaderVisible;
}

- (BOOL)hideAnalyzingStatus
{
  return self->_hideAnalyzingStatus;
}

- (BOOL)hideStatusFooter
{
  return self->_hideStatusFooter;
}

- (double)faultOutPadding
{
  return self->_faultOutPadding;
}

- (double)faultInDistance
{
  return self->_faultInDistance;
}

- (int64_t)sectionsToPrefetch
{
  return self->_sectionsToPrefetch;
}

- (double)skimmingScale
{
  return self->_skimmingScale;
}

- (double)sectionShadowOpacity
{
  return self->_sectionShadowOpacity;
}

- (double)topInsetForVisibilityAnchoring
{
  return self->_topInsetForVisibilityAnchoring;
}

- (double)allowSpecialPanoHeaders
{
  return self->_allowSpecialPanoHeaders;
}

- (double)cornerRadiusForDays
{
  return self->_cornerRadiusForDays;
}

- (BOOL)useWideModularLayoutInYears
{
  return self->_useWideModularLayoutInYears;
}

- (int64_t)forcedNumberOfYearsColumn
{
  return self->_forcedNumberOfYearsColumn;
}

- (double)aspectRatioForRegularYears
{
  return self->_aspectRatioForRegularYears;
}

- (double)aspectRatioForCompactLandscapeYears
{
  return self->_aspectRatioForCompactLandscapeYears;
}

- (double)largeHeroMinimumScore
{
  return self->_largeHeroMinimumScore;
}

- (int64_t)largeHeroDensity
{
  return self->_largeHeroDensity;
}

- (BOOL)showSaliencyRects
{
  return self->_showSaliencyRects;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (double)monthsFloatingHeadersSubtitleAlpha
{
  return self->_monthsFloatingHeadersSubtitleAlpha;
}

- (double)floatingHeaderButtonsFadeOverDistance
{
  return self->_floatingHeaderButtonsFadeOverDistance;
}

- (double)floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop
{
  return self->_floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop;
}

- (double)floatingHeaderFadeOverDistance
{
  return self->_floatingHeaderFadeOverDistance;
}

- (double)floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom
{
  return self->_floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom;
}

- (double)scrollSnapMinimumSpeed
{
  return self->_scrollSnapMinimumSpeed;
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (BOOL)enableCustomScrollToTopOrBottom
{
  return self->_enableCustomScrollToTopOrBottom;
}

- (BOOL)enableTapOnTitleToScroll
{
  return self->_enableTapOnTitleToScroll;
}

- (void)setBlurredBackgroundFadeDuration:(double)a3
{
  self->_blurredBackgroundFadeDuration = a3;
}

- (double)blurredBackgroundFadeDuration
{
  return self->_blurredBackgroundFadeDuration;
}

- (void)setBlurredBackgroundFinalOpacity:(double)a3
{
  self->_blurredBackgroundFinalOpacity = a3;
}

- (double)blurredBackgroundFinalOpacity
{
  return self->_blurredBackgroundFinalOpacity;
}

- (void)setBlurredBackgroundInitialOpacityMac:(double)a3
{
  self->_blurredBackgroundInitialOpacityMac = a3;
}

- (double)blurredBackgroundInitialOpacityMac
{
  return self->_blurredBackgroundInitialOpacityMac;
}

- (void)setBlurredBackgroundInitialOpacity:(double)a3
{
  self->_blurredBackgroundInitialOpacity = a3;
}

- (double)blurredBackgroundInitialOpacity
{
  return self->_blurredBackgroundInitialOpacity;
}

- (double)blurredBackgroundRadius
{
  return self->_blurredBackgroundRadius;
}

- (double)bottomCenterSecondaryToolbarWidth
{
  return self->_bottomCenterSecondaryToolbarWidth;
}

- (BOOL)alwaysShowSecondaryToolbarAtBottom
{
  return self->_alwaysShowSecondaryToolbarAtBottom;
}

- (NSString)savedAllPhotosScrollPositionAnchorAssetIdentifier
{
  return self->_savedAllPhotosScrollPositionAnchorAssetIdentifier;
}

- (BOOL)enablePlayMovieInYears
{
  return self->_enablePlayMovieInYears;
}

- (void)setRecentHighlightsTimeInterval:(double)a3
{
  self->_recentHighlightsTimeInterval = a3;
}

- (double)recentHighlightsTimeInterval
{
  return self->_recentHighlightsTimeInterval;
}

- (int64_t)version
{
  return 11;
}

- (id)acceptableLargeHeroPredicate
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXCuratedLibrarySettings_acceptableLargeHeroPredicate__block_invoke;
  aBlock[3] = &unk_1E5DC4738;
  aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  return v2;
}

BOOL __56__PXCuratedLibrarySettings_acceptableLargeHeroPredicate__block_invoke(uint64_t a1, void *a2)
{
  [a2 weightUsingCriterion:2];
  double v4 = v3;
  [*(id *)(a1 + 32) largeHeroMinimumScore];
  return v4 >= v5;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (void)setEnableEmptyYearsMonthsDaysForTesting:(BOOL)a3
{
  _enableEmptyYearsMonthsDaysForTesting = a3;
}

@end