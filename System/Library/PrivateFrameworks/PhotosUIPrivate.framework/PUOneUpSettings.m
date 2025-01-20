@interface PUOneUpSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (id)transientProperties;
- (BOOL)allowAutoplayVideoForAsset:(id)a3;
- (BOOL)allowBadges;
- (BOOL)allowChromeHiding;
- (BOOL)allowDoubleTapZoom;
- (BOOL)allowFullsizeJPEGDisplay;
- (BOOL)allowGIFPlayback;
- (BOOL)allowParallax;
- (BOOL)allowPlayButtonInBars;
- (BOOL)allowScrubber;
- (BOOL)allowStatusBar;
- (BOOL)allowUserTransform;
- (BOOL)allowVisualIntelligence;
- (BOOL)allowsDetailsToggleButtonInBars;
- (BOOL)allowsVisualIntelligenceInVideoFrame;
- (BOOL)allowsVisualIntelligenceRemoveBackground;
- (BOOL)allowsVisualIntelligenceV2;
- (BOOL)allowsVisualIntelligenceVisualLookupInfoPanelMode;
- (BOOL)alwaysShowAirPlayButton;
- (BOOL)alwaysShowRenderIndicator;
- (BOOL)applyPerspectiveTransformDuringVitality;
- (BOOL)autoplayVideo;
- (BOOL)doubleTapZoomAreaExcludesBackground;
- (BOOL)doubleTapZoomAreaExcludesBars;
- (BOOL)enableFigPhotoBackgroundSizeBasedDisplay;
- (BOOL)enableFigPhotoTiledLayer;
- (BOOL)enableHDRImages;
- (BOOL)enablePreferredImageDynamicRangeAnimation;
- (BOOL)forceURLWithFigPhotoTiledLayer;
- (BOOL)hideFloatingInfoPanelWhenHidingChrome;
- (BOOL)hideToolbarWhenShowingAccessoryView;
- (BOOL)insertDummyHighlightTimeRanges;
- (BOOL)livePhotoSRLCompensationEnabled;
- (BOOL)livePhotoSRLCompensationManualMode;
- (BOOL)livePhotoScrubberShowForPlayback;
- (BOOL)lockScrollDuringLivePhotoPlayback;
- (BOOL)persistChromeVisibility;
- (BOOL)quickCropEnabled;
- (BOOL)quickCropHideOtherToolsInEdit;
- (BOOL)quickCropUseSymbol;
- (BOOL)retainProxyUntilZoom;
- (BOOL)shouldFadeAccessoryView;
- (BOOL)shouldMergeOverlappingLivePhotos;
- (BOOL)showBestSquareRect;
- (BOOL)showBufferingIndicatorDuringPlay;
- (BOOL)showFacesRect;
- (BOOL)showFacesTorsosRects;
- (BOOL)showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls;
- (BOOL)showGIFLoadingDelays;
- (BOOL)showGainMapButton;
- (BOOL)showGazeRects;
- (BOOL)showLoadingIndicatorDuringDownload;
- (BOOL)showPaddedFacesRect;
- (BOOL)showReframedBadge;
- (BOOL)showSaliencyRects;
- (BOOL)showSearchQueryInVideoHighlightLabel;
- (BOOL)showVideoHighlightLabel;
- (BOOL)showVideoSearchHighlightLabel;
- (BOOL)showWallpaperCropRect;
- (BOOL)simulateAssetContentLoading;
- (BOOL)simulateLoadingError;
- (BOOL)simulateWorstCaseFigPhotoBackgroundSize;
- (BOOL)squareImageCapToHalfHeight;
- (BOOL)useDebuggingColors;
- (BOOL)useDebuggingProgressLabel;
- (BOOL)useHDRVideoThumbnails;
- (BOOL)useURLForLargePhotosWithFigPhotoTiledLayer;
- (BOOL)userAllowsVisualIntelligence;
- (BOOL)userAllowsVisualIntelligenceInVideoFrame;
- (BOOL)userAllowsVisualIntelligenceRemoveBackground;
- (BOOL)userAllowsVisualIntelligenceV2;
- (BOOL)userAllowsVisualIntelligenceVisualLookupInfoPanelMode;
- (BOOL)videoShowDebugBorders;
- (BOOL)videoShowLiveEffectsRenderingIndicator;
- (BOOL)videoStartAtFirstHighlight;
- (BOOL)vitalityUseInsetLimiting;
- (NSString)livePhotoSRLCompensationFilterName;
- (PUScrubberSettings)scrubberSettings;
- (UIColor)videoHighlightColor;
- (double)accessoryInitialTopPosition;
- (double)autoplayScrubberWidth;
- (double)barsAreaVerticalOutset;
- (double)bounceDelay;
- (double)bounceDuration;
- (double)bounceInitialVelocity;
- (double)bounceSpringDamping;
- (double)chromeAutoHideDelay;
- (double)chromeDefaultAnimationDuration;
- (double)chromeTimedAutoHideAnimationDuration;
- (double)defaultZoomInFactor;
- (double)doubleTapZoomFactor;
- (double)finalFadeOutDuration;
- (double)fullQualityCrossfadeDuration;
- (double)hdrShareSheetCrossfadeAnimationDuration;
- (double)hdrSuppressionAnimationDuration;
- (double)interpageSpacing;
- (double)itemContentCornerRadius;
- (double)livePhotoInteractionThreshold;
- (double)livePhotoMinimumOverlappingDuration;
- (double)livePhotoSRLCompensationManualValue;
- (double)minimumContentInset;
- (double)minimumDurationForIncrementingViewCount;
- (double)minimumFullCommentTitleViewWidth;
- (double)minimumVisibleCommentedContentHeight;
- (double)minimumVisibleContentHeight;
- (double)pagingFrictionAdjustment;
- (double)pagingSpringPullAdjustment;
- (double)parallaxFactor;
- (double)playGIFEnterThreshold;
- (double)playGIFMoveOutThreshold;
- (double)playGIFSettledThreshold;
- (double)preferredImageDynamicRangeAnimationDuration;
- (double)quickCropBackgroundBrightness;
- (double)quickCropFadeIn;
- (double)quickCropFadeOut;
- (double)quickCropInvisibilityTimer;
- (double)simulatedAssetContentLoadingDuration;
- (double)simulatedRenderProgress;
- (double)videoAutoplayThreshold;
- (double)videoHighlightPreroll;
- (double)videoPauseThreshold;
- (double)visibilityDurationForEnteringFastRegime;
- (double)visibilityDurationForEnteringQuickPagingRegime;
- (double)visibilityDurationForExitingFastRegime;
- (double)visibilityDurationForExitingQuickPagingRegime;
- (double)visualLookupGlyphAnimationFadeOutDelay;
- (double)vitalityFeatherScale;
- (double)vitalityMaskBlur;
- (double)vitalityMaxAllowedInsetPoints;
- (double)vitalityMaxAllowedLargeInsetPoints;
- (id)parentSettings;
- (int64_t)accessoryViewType;
- (int64_t)chromeAnimationType;
- (int64_t)chromeAutoHideBehaviorOnLivePhoto;
- (int64_t)chromeAutoHideBehaviorOnPlayButton;
- (int64_t)chromeAutoHideBehaviorOnSwipe;
- (int64_t)chromeAutoHideBehaviorOnZoom;
- (int64_t)chromeBackgroundAnimationType;
- (int64_t)debuggingTitleType;
- (int64_t)minNavigationDistanceForFastRegime;
- (int64_t)minNavigationDistanceForQuickPagingRegime;
- (int64_t)parallaxModel;
- (int64_t)simulatedLoadingErrorType;
- (int64_t)titleTapAction;
- (int64_t)userNavigationMaximumDistance;
- (int64_t)version;
- (unint64_t)debuggingBadges;
- (unint64_t)debuggingBadgesWhenFavorite;
- (unint64_t)fullQualityCrossfadeBehavior;
- (unint64_t)overlappingLivePhotosCountLimit;
- (unint64_t)scaleToFitBehavior;
- (unint64_t)videoHighlightColorName;
- (unint64_t)viewModelCacheCountLimit;
- (void)createChildren;
- (void)preferencesDidChange;
- (void)setAccessoryInitialTopPosition:(double)a3;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setAllowBadges:(BOOL)a3;
- (void)setAllowChromeHiding:(BOOL)a3;
- (void)setAllowDoubleTapZoom:(BOOL)a3;
- (void)setAllowFullsizeJPEGDisplay:(BOOL)a3;
- (void)setAllowGIFPlayback:(BOOL)a3;
- (void)setAllowParallax:(BOOL)a3;
- (void)setAllowPlayButtonInBars:(BOOL)a3;
- (void)setAllowScrubber:(BOOL)a3;
- (void)setAllowStatusBar:(BOOL)a3;
- (void)setAllowUserTransform:(BOOL)a3;
- (void)setAllowsDetailsToggleButtonInBars:(BOOL)a3;
- (void)setAlwaysShowAirPlayButton:(BOOL)a3;
- (void)setAlwaysShowRenderIndicator:(BOOL)a3;
- (void)setApplyPerspectiveTransformDuringVitality:(BOOL)a3;
- (void)setAutoplayScrubberWidth:(double)a3;
- (void)setAutoplayVideo:(BOOL)a3;
- (void)setBarsAreaVerticalOutset:(double)a3;
- (void)setBounceDelay:(double)a3;
- (void)setBounceDuration:(double)a3;
- (void)setBounceInitialVelocity:(double)a3;
- (void)setBounceSpringDamping:(double)a3;
- (void)setChromeAnimationType:(int64_t)a3;
- (void)setChromeAutoHideBehaviorOnLivePhoto:(int64_t)a3;
- (void)setChromeAutoHideBehaviorOnPlayButton:(int64_t)a3;
- (void)setChromeAutoHideBehaviorOnSwipe:(int64_t)a3;
- (void)setChromeAutoHideBehaviorOnZoom:(int64_t)a3;
- (void)setChromeAutoHideDelay:(double)a3;
- (void)setChromeBackgroundAnimationType:(int64_t)a3;
- (void)setChromeDefaultAnimationDuration:(double)a3;
- (void)setChromeTimedAutoHideAnimationDuration:(double)a3;
- (void)setDebuggingBadges:(unint64_t)a3;
- (void)setDebuggingBadgesWhenFavorite:(unint64_t)a3;
- (void)setDebuggingTitleType:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDefaultZoomInFactor:(double)a3;
- (void)setDoubleTapZoomAreaExcludesBackground:(BOOL)a3;
- (void)setDoubleTapZoomAreaExcludesBars:(BOOL)a3;
- (void)setDoubleTapZoomFactor:(double)a3;
- (void)setEnableFigPhotoBackgroundSizeBasedDisplay:(BOOL)a3;
- (void)setEnableFigPhotoTiledLayer:(BOOL)a3;
- (void)setEnableHDRImages:(BOOL)a3;
- (void)setEnablePreferredImageDynamicRangeAnimation:(BOOL)a3;
- (void)setFinalFadeOutDuration:(double)a3;
- (void)setForceURLWithFigPhotoTiledLayer:(BOOL)a3;
- (void)setFullQualityCrossfadeBehavior:(unint64_t)a3;
- (void)setFullQualityCrossfadeDuration:(double)a3;
- (void)setHdrShareSheetCrossfadeAnimationDuration:(double)a3;
- (void)setHdrSuppressionAnimationDuration:(double)a3;
- (void)setHideFloatingInfoPanelWhenHidingChrome:(BOOL)a3;
- (void)setHideToolbarWhenShowingAccessoryView:(BOOL)a3;
- (void)setInsertDummyHighlightTimeRanges:(BOOL)a3;
- (void)setInterpageSpacing:(double)a3;
- (void)setItemContentCornerRadius:(double)a3;
- (void)setLivePhotoInteractionThreshold:(double)a3;
- (void)setLivePhotoMinimumOverlappingDuration:(double)a3;
- (void)setLivePhotoSRLCompensationEnabled:(BOOL)a3;
- (void)setLivePhotoSRLCompensationFilterName:(id)a3;
- (void)setLivePhotoSRLCompensationManualMode:(BOOL)a3;
- (void)setLivePhotoSRLCompensationManualValue:(double)a3;
- (void)setLivePhotoScrubberShowForPlayback:(BOOL)a3;
- (void)setLockScrollDuringLivePhotoPlayback:(BOOL)a3;
- (void)setMinNavigationDistanceForFastRegime:(int64_t)a3;
- (void)setMinNavigationDistanceForQuickPagingRegime:(int64_t)a3;
- (void)setMinimumContentInset:(double)a3;
- (void)setMinimumDurationForIncrementingViewCount:(double)a3;
- (void)setMinimumFullCommentTitleViewWidth:(double)a3;
- (void)setMinimumVisibleCommentedContentHeight:(double)a3;
- (void)setMinimumVisibleContentHeight:(double)a3;
- (void)setOverlappingLivePhotosCountLimit:(unint64_t)a3;
- (void)setPagingFrictionAdjustment:(double)a3;
- (void)setPagingSpringPullAdjustment:(double)a3;
- (void)setParallaxFactor:(double)a3;
- (void)setParallaxModel:(int64_t)a3;
- (void)setPersistChromeVisibility:(BOOL)a3;
- (void)setPlayGIFEnterThreshold:(double)a3;
- (void)setPlayGIFMoveOutThreshold:(double)a3;
- (void)setPlayGIFSettledThreshold:(double)a3;
- (void)setPreferredImageDynamicRangeAnimationDuration:(double)a3;
- (void)setQuickCropBackgroundBrightness:(double)a3;
- (void)setQuickCropEnabled:(BOOL)a3;
- (void)setQuickCropFadeIn:(double)a3;
- (void)setQuickCropFadeOut:(double)a3;
- (void)setQuickCropHideOtherToolsInEdit:(BOOL)a3;
- (void)setQuickCropInvisibilityTimer:(double)a3;
- (void)setQuickCropUseSymbol:(BOOL)a3;
- (void)setRetainProxyUntilZoom:(BOOL)a3;
- (void)setScaleToFitBehavior:(unint64_t)a3;
- (void)setScrubberSettings:(id)a3;
- (void)setShouldFadeAccessoryView:(BOOL)a3;
- (void)setShouldMergeOverlappingLivePhotos:(BOOL)a3;
- (void)setShowBestSquareRect:(BOOL)a3;
- (void)setShowBufferingIndicatorDuringPlay:(BOOL)a3;
- (void)setShowFacesRect:(BOOL)a3;
- (void)setShowFacesTorsosRects:(BOOL)a3;
- (void)setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:(BOOL)a3;
- (void)setShowGIFLoadingDelays:(BOOL)a3;
- (void)setShowGainMapButton:(BOOL)a3;
- (void)setShowGazeRects:(BOOL)a3;
- (void)setShowLoadingIndicatorDuringDownload:(BOOL)a3;
- (void)setShowPaddedFacesRect:(BOOL)a3;
- (void)setShowReframedBadge:(BOOL)a3;
- (void)setShowSaliencyRects:(BOOL)a3;
- (void)setShowSearchQueryInVideoHighlightLabel:(BOOL)a3;
- (void)setShowVideoHighlightLabel:(BOOL)a3;
- (void)setShowVideoSearchHighlightLabel:(BOOL)a3;
- (void)setShowWallpaperCropRect:(BOOL)a3;
- (void)setSimulateAssetContentLoading:(BOOL)a3;
- (void)setSimulateLoadingError:(BOOL)a3;
- (void)setSimulateWorstCaseFigPhotoBackgroundSize:(BOOL)a3;
- (void)setSimulatedAssetContentLoadingDuration:(double)a3;
- (void)setSimulatedLoadingErrorType:(int64_t)a3;
- (void)setSimulatedRenderProgress:(double)a3;
- (void)setSquareImageCapToHalfHeight:(BOOL)a3;
- (void)setTitleTapAction:(int64_t)a3;
- (void)setUseDebuggingColors:(BOOL)a3;
- (void)setUseDebuggingProgressLabel:(BOOL)a3;
- (void)setUseHDRVideoThumbnails:(BOOL)a3;
- (void)setUseURLForLargePhotosWithFigPhotoTiledLayer:(BOOL)a3;
- (void)setUserAllowsVisualIntelligence:(BOOL)a3;
- (void)setUserAllowsVisualIntelligenceInVideoFrame:(BOOL)a3;
- (void)setUserAllowsVisualIntelligenceRemoveBackground:(BOOL)a3;
- (void)setUserAllowsVisualIntelligenceV2:(BOOL)a3;
- (void)setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:(BOOL)a3;
- (void)setUserNavigationMaximumDistance:(int64_t)a3;
- (void)setVideoAutoplayThreshold:(double)a3;
- (void)setVideoHighlightColorName:(unint64_t)a3;
- (void)setVideoHighlightPreroll:(double)a3;
- (void)setVideoPauseThreshold:(double)a3;
- (void)setVideoShowDebugBorders:(BOOL)a3;
- (void)setVideoShowLiveEffectsRenderingIndicator:(BOOL)a3;
- (void)setVideoStartAtFirstHighlight:(BOOL)a3;
- (void)setViewModelCacheCountLimit:(unint64_t)a3;
- (void)setVisibilityDurationForEnteringFastRegime:(double)a3;
- (void)setVisibilityDurationForEnteringQuickPagingRegime:(double)a3;
- (void)setVisibilityDurationForExitingFastRegime:(double)a3;
- (void)setVisibilityDurationForExitingQuickPagingRegime:(double)a3;
- (void)setVisualLookupGlyphAnimationFadeOutDelay:(double)a3;
- (void)setVitalityFeatherScale:(double)a3;
- (void)setVitalityMaskBlur:(double)a3;
- (void)setVitalityMaxAllowedInsetPoints:(double)a3;
- (void)setVitalityMaxAllowedLargeInsetPoints:(double)a3;
- (void)setVitalityUseInsetLimiting:(BOOL)a3;
@end

@implementation PUOneUpSettings

- (void)createChildren
{
  v3 = [(PTSettings *)[PUScrubberSettings alloc] initWithDefaultValues];
  scrubberSettings = self->_scrubberSettings;
  self->_scrubberSettings = v3;
}

- (void)setDefaultValues
{
  v10.receiver = self;
  v10.super_class = (Class)PUOneUpSettings;
  [(PTSettings *)&v10 setDefaultValues];
  [(PUOneUpSettings *)self setFullQualityCrossfadeDuration:0.8];
  [(PUOneUpSettings *)self setFullQualityCrossfadeBehavior:2];
  int v3 = MGGetBoolAnswer();
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  [(PUOneUpSettings *)self setTitleTapAction:0];
  uint64_t v6 = 1;
  [(PUOneUpSettings *)self setAllowUserTransform:1];
  [(PUOneUpSettings *)self setAllowBadges:1];
  if (v5 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v3 ^ 1u;
  }
  [(PUOneUpSettings *)self setAllowScrubber:v7];
  [(PUOneUpSettings *)self setAllowChromeHiding:1];
  [(PUOneUpSettings *)self setAllowDoubleTapZoom:1];
  [(PUOneUpSettings *)self setAllowFullsizeJPEGDisplay:1];
  [(PUOneUpSettings *)self setUserNavigationMaximumDistance:2];
  [(PUOneUpSettings *)self setShowSaliencyRects:0];
  [(PUOneUpSettings *)self setShowFacesRect:0];
  [(PUOneUpSettings *)self setShowPaddedFacesRect:0];
  [(PUOneUpSettings *)self setShowBestSquareRect:0];
  [(PUOneUpSettings *)self setShowFacesTorsosRects:0];
  [(PUOneUpSettings *)self setShowGazeRects:0];
  [(PUOneUpSettings *)self setShowWallpaperCropRect:0];
  [(PUOneUpSettings *)self setEnableFigPhotoTiledLayer:1];
  [(PUOneUpSettings *)self setUseURLForLargePhotosWithFigPhotoTiledLayer:1];
  [(PUOneUpSettings *)self setForceURLWithFigPhotoTiledLayer:0];
  [(PUOneUpSettings *)self setEnableFigPhotoBackgroundSizeBasedDisplay:0];
  [(PUOneUpSettings *)self setSimulateWorstCaseFigPhotoBackgroundSize:0];
  [(PUOneUpSettings *)self setUseHDRVideoThumbnails:0];
  [(PUOneUpSettings *)self setEnableHDRImages:_os_feature_enabled_impl()];
  [(PUOneUpSettings *)self setEnablePreferredImageDynamicRangeAnimation:1];
  [(PUOneUpSettings *)self setPreferredImageDynamicRangeAnimationDuration:2.0];
  [(PUOneUpSettings *)self setHdrSuppressionAnimationDuration:2.0];
  [(PUOneUpSettings *)self setHdrShareSheetCrossfadeAnimationDuration:2.0];
  [(PUOneUpSettings *)self setShowGainMapButton:0];
  [(PUOneUpSettings *)self setAccessoryViewType:1];
  [(PUOneUpSettings *)self setAccessoryInitialTopPosition:0.300000012];
  [(PUOneUpSettings *)self setMinimumVisibleContentHeight:-180.0];
  [(PUOneUpSettings *)self setMinimumVisibleCommentedContentHeight:100.0];
  [(PUOneUpSettings *)self setMinimumFullCommentTitleViewWidth:375.0];
  [(PUOneUpSettings *)self setAllowsDetailsToggleButtonInBars:1];
  [(PUOneUpSettings *)self setSquareImageCapToHalfHeight:1];
  [(PUOneUpSettings *)self setHideFloatingInfoPanelWhenHidingChrome:0];
  [(PUOneUpSettings *)self setHideToolbarWhenShowingAccessoryView:0];
  [(PUOneUpSettings *)self setShouldFadeAccessoryView:1];
  [(PUOneUpSettings *)self setChromeDefaultAnimationDuration:*MEMORY[0x1E4FB2E08]];
  [(PUOneUpSettings *)self setChromeAutoHideBehaviorOnLivePhoto:0];
  [(PUOneUpSettings *)self setChromeAutoHideBehaviorOnPlayButton:2];
  [(PUOneUpSettings *)self setChromeAutoHideBehaviorOnSwipe:0];
  [(PUOneUpSettings *)self setChromeAutoHideBehaviorOnZoom:2];
  [(PUOneUpSettings *)self setChromeAutoHideDelay:0.0];
  [(PUOneUpSettings *)self setPersistChromeVisibility:PLIsCamera()];
  [(PUOneUpSettings *)self setChromeTimedAutoHideAnimationDuration:1.0];
  [(PUOneUpSettings *)self setChromeAnimationType:1];
  [(PUOneUpSettings *)self setChromeBackgroundAnimationType:1];
  [(PUOneUpSettings *)self setAllowParallax:1];
  [(PUOneUpSettings *)self setInterpageSpacing:40.0];
  [(PUOneUpSettings *)self setPagingSpringPullAdjustment:0.0];
  [(PUOneUpSettings *)self setPagingFrictionAdjustment:2.0];
  [(PUOneUpSettings *)self setParallaxModel:1];
  [(PUOneUpSettings *)self setParallaxFactor:12.5];
  [(PUOneUpSettings *)self setItemContentCornerRadius:0.0];
  [(PUOneUpSettings *)self setAllowStatusBar:1];
  [(PUOneUpSettings *)self setBarsAreaVerticalOutset:10.0];
  [(PUOneUpSettings *)self setVisualLookupGlyphAnimationFadeOutDelay:3.0];
  [(PUOneUpSettings *)self setScaleToFitBehavior:1];
  [(PUOneUpSettings *)self setMinimumContentInset:0.0];
  [(PUOneUpSettings *)self setDefaultZoomInFactor:6.0];
  [(PUOneUpSettings *)self setDoubleTapZoomFactor:2.5];
  [(PUOneUpSettings *)self setDoubleTapZoomAreaExcludesBars:1];
  [(PUOneUpSettings *)self setDoubleTapZoomAreaExcludesBackground:1];
  if ((PLIsMobileSlideShow() & 1) == 0)
  {
    if (PLIsCamera()) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = PLIsSpotlight();
    }
  }
  [(PUOneUpSettings *)self setAutoplayVideo:v6];
  [(PUOneUpSettings *)self setVideoAutoplayThreshold:0.800000012];
  [(PUOneUpSettings *)self setVideoPauseThreshold:1.0];
  if (PLIsMobileSlideShow() & 1) != 0 || (PLIsCamera() & 1) != 0 || (PLIsSpotlight()) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = PLIsPreferences();
  }
  [(PUOneUpSettings *)self setAllowPlayButtonInBars:v8];
  [(PUOneUpSettings *)self setAutoplayScrubberWidth:100.0];
  [(PUOneUpSettings *)self setVideoShowDebugBorders:0];
  [(PUOneUpSettings *)self setVideoShowLiveEffectsRenderingIndicator:0];
  uint64_t v9 = 1;
  [(PUOneUpSettings *)self setLivePhotoSRLCompensationEnabled:1];
  [(PUOneUpSettings *)self setLivePhotoSRLCompensationManualMode:0];
  [(PUOneUpSettings *)self setLivePhotoSRLCompensationManualValue:0.0];
  [(PUOneUpSettings *)self setLivePhotoSRLCompensationFilterName:@"srl"];
  [(PUOneUpSettings *)self setLivePhotoInteractionThreshold:0.5];
  [(PUOneUpSettings *)self setVitalityMaxAllowedInsetPoints:25.0];
  [(PUOneUpSettings *)self setVitalityMaxAllowedLargeInsetPoints:40.0];
  [(PUOneUpSettings *)self setVitalityUseInsetLimiting:1];
  [(PUOneUpSettings *)self setApplyPerspectiveTransformDuringVitality:1];
  [(PUOneUpSettings *)self setLockScrollDuringLivePhotoPlayback:1];
  [(PUOneUpSettings *)self setLivePhotoScrubberShowForPlayback:0];
  if ((PLIsMobileSlideShow() & 1) == 0) {
    uint64_t v9 = PLIsCamera();
  }
  [(PUOneUpSettings *)self setShouldMergeOverlappingLivePhotos:v9];
  [(PUOneUpSettings *)self setLivePhotoMinimumOverlappingDuration:0.0];
  [(PUOneUpSettings *)self setOverlappingLivePhotosCountLimit:16];
  [(PUOneUpSettings *)self setVitalityMaskBlur:4.0];
  [(PUOneUpSettings *)self setVitalityFeatherScale:0.005];
  [(PUOneUpSettings *)self setShowReframedBadge:1];
  [(PUOneUpSettings *)self setShowVideoSearchHighlightLabel:1];
  [(PUOneUpSettings *)self setVideoStartAtFirstHighlight:1];
  [(PUOneUpSettings *)self setVideoHighlightColorName:0];
  [(PUOneUpSettings *)self setVideoHighlightPreroll:0.25];
  [(PUOneUpSettings *)self setViewModelCacheCountLimit:100];
  [(PUOneUpSettings *)self setVisibilityDurationForEnteringQuickPagingRegime:0.5];
  [(PUOneUpSettings *)self setVisibilityDurationForExitingQuickPagingRegime:0.55];
  [(PUOneUpSettings *)self setMinNavigationDistanceForQuickPagingRegime:3];
  [(PUOneUpSettings *)self setVisibilityDurationForEnteringFastRegime:0.07];
  [(PUOneUpSettings *)self setVisibilityDurationForExitingFastRegime:0.11];
  [(PUOneUpSettings *)self setMinNavigationDistanceForFastRegime:10];
  [(PUOneUpSettings *)self setBounceDuration:0.5];
  [(PUOneUpSettings *)self setBounceDelay:0.0];
  [(PUOneUpSettings *)self setBounceInitialVelocity:100.0];
  [(PUOneUpSettings *)self setBounceSpringDamping:1.0];
  [(PUOneUpSettings *)self setAllowGIFPlayback:1];
  [(PUOneUpSettings *)self setShowGIFLoadingDelays:0];
  [(PUOneUpSettings *)self setPlayGIFSettledThreshold:0.25];
  [(PUOneUpSettings *)self setPlayGIFEnterThreshold:0.899999976];
  [(PUOneUpSettings *)self setPlayGIFMoveOutThreshold:0.25];
  [(PUOneUpSettings *)self setUserAllowsVisualIntelligence:1];
  [(PUOneUpSettings *)self setUserAllowsVisualIntelligenceV2:1];
  [(PUOneUpSettings *)self setUserAllowsVisualIntelligenceInVideoFrame:1];
  [(PUOneUpSettings *)self setUserAllowsVisualIntelligenceRemoveBackground:1];
  [(PUOneUpSettings *)self setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:1];
  [(PUOneUpSettings *)self setSimulateAssetContentLoading:0];
  [(PUOneUpSettings *)self setSimulatedAssetContentLoadingDuration:5.0];
  [(PUOneUpSettings *)self setSimulateLoadingError:0];
  [(PUOneUpSettings *)self setSimulatedLoadingErrorType:0];
  [(PUOneUpSettings *)self setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:1];
  [(PUOneUpSettings *)self setQuickCropEnabled:1];
  [(PUOneUpSettings *)self setQuickCropInvisibilityTimer:3.5];
  [(PUOneUpSettings *)self setQuickCropFadeIn:0.5];
  [(PUOneUpSettings *)self setQuickCropFadeOut:0.2];
  [(PUOneUpSettings *)self setQuickCropBackgroundBrightness:-0.13];
  [(PUOneUpSettings *)self setQuickCropHideOtherToolsInEdit:0];
  [(PUOneUpSettings *)self setQuickCropUseSymbol:0];
  [(PUOneUpSettings *)self setUseDebuggingColors:0];
  [(PUOneUpSettings *)self setDebuggingTitleType:0];
  [(PUOneUpSettings *)self setDebuggingBadges:0];
  [(PUOneUpSettings *)self setDebuggingBadgesWhenFavorite:0];
  [(PUOneUpSettings *)self setUseDebuggingProgressLabel:0];
  [(PUOneUpSettings *)self setShowBufferingIndicatorDuringPlay:0];
  [(PUOneUpSettings *)self setShowLoadingIndicatorDuringDownload:0];
  [(PUOneUpSettings *)self setAlwaysShowRenderIndicator:0];
  [(PUOneUpSettings *)self setSimulatedRenderProgress:0.33];
  [(PUOneUpSettings *)self setAlwaysShowAirPlayButton:0];
  [(PUOneUpSettings *)self setFinalFadeOutDuration:0.2];
  [(PUOneUpSettings *)self setMinimumDurationForIncrementingViewCount:1.0];
}

- (void)setVitalityUseInsetLimiting:(BOOL)a3
{
  self->_vitalityUseInsetLimiting = a3;
}

- (void)setVitalityMaxAllowedLargeInsetPoints:(double)a3
{
  self->_vitalityMaxAllowedLargeInsetPoints = a3;
}

- (void)setVitalityMaxAllowedInsetPoints:(double)a3
{
  self->_vitalityMaxAllowedInsetPoints = a3;
}

- (void)setVitalityMaskBlur:(double)a3
{
  self->_vitalityMaskBlur = a3;
}

- (void)setVitalityFeatherScale:(double)a3
{
  self->_vitalityFeatherScale = a3;
}

- (void)setVisualLookupGlyphAnimationFadeOutDelay:(double)a3
{
  self->_visualLookupGlyphAnimationFadeOutDelay = a3;
}

- (void)setVisibilityDurationForExitingQuickPagingRegime:(double)a3
{
  self->_visibilityDurationForExitingQuickPagingRegime = a3;
}

- (void)setVisibilityDurationForExitingFastRegime:(double)a3
{
  self->_visibilityDurationForExitingFastRegime = a3;
}

- (void)setVisibilityDurationForEnteringQuickPagingRegime:(double)a3
{
  self->_visibilityDurationForEnteringQuickPagingRegime = a3;
}

- (void)setVisibilityDurationForEnteringFastRegime:(double)a3
{
  self->_visibilityDurationForEnteringFastRegime = a3;
}

- (void)setViewModelCacheCountLimit:(unint64_t)a3
{
  self->_viewModelCacheCountLimit = a3;
}

- (void)setVideoStartAtFirstHighlight:(BOOL)a3
{
  self->_videoStartAtFirstHighlight = a3;
}

- (void)setVideoShowLiveEffectsRenderingIndicator:(BOOL)a3
{
  self->_videoShowLiveEffectsRenderingIndicator = a3;
}

- (void)setVideoShowDebugBorders:(BOOL)a3
{
  self->_videoShowDebugBorders = a3;
}

- (void)setVideoPauseThreshold:(double)a3
{
  self->_videoPauseThreshold = a3;
}

- (void)setVideoHighlightPreroll:(double)a3
{
  self->_videoHighlightPreroll = a3;
}

- (void)setVideoHighlightColorName:(unint64_t)a3
{
  self->_videoHighlightColorName = a3;
}

- (void)setVideoAutoplayThreshold:(double)a3
{
  self->_videoAutoplayThreshold = a3;
}

- (void)setUserNavigationMaximumDistance:(int64_t)a3
{
  self->_userNavigationMaximumDistance = a3;
}

- (void)setUserAllowsVisualIntelligenceVisualLookupInfoPanelMode:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceVisualLookupInfoPanelMode = a3;
}

- (void)setUserAllowsVisualIntelligenceV2:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceV2 = a3;
}

- (void)setUserAllowsVisualIntelligenceRemoveBackground:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceRemoveBackground = a3;
}

- (void)setUserAllowsVisualIntelligenceInVideoFrame:(BOOL)a3
{
  self->_userAllowsVisualIntelligenceInVideoFrame = a3;
}

- (void)setUserAllowsVisualIntelligence:(BOOL)a3
{
  self->_userAllowsVisualIntelligence = a3;
}

- (void)setUseURLForLargePhotosWithFigPhotoTiledLayer:(BOOL)a3
{
  self->_useURLForLargePhotosWithFigPhotoTiledLayer = a3;
}

- (void)setUseHDRVideoThumbnails:(BOOL)a3
{
  self->_useHDRVideoThumbnails = a3;
}

- (void)setUseDebuggingProgressLabel:(BOOL)a3
{
  self->_useDebuggingProgressLabel = a3;
}

- (void)setUseDebuggingColors:(BOOL)a3
{
  self->_useDebuggingColors = a3;
}

- (void)setTitleTapAction:(int64_t)a3
{
  self->_titleTapAction = a3;
}

- (void)setSquareImageCapToHalfHeight:(BOOL)a3
{
  self->_squareImageCapToHalfHeight = a3;
}

- (void)setSimulatedRenderProgress:(double)a3
{
  self->_simulatedRenderProgress = a3;
}

- (void)setSimulatedLoadingErrorType:(int64_t)a3
{
  self->_simulatedLoadingErrorType = a3;
}

- (void)setSimulatedAssetContentLoadingDuration:(double)a3
{
  self->_simulatedAssetContentLoadingDuration = a3;
}

- (void)setSimulateWorstCaseFigPhotoBackgroundSize:(BOOL)a3
{
  self->_simulateWorstCaseFigPhotoBackgroundSize = a3;
}

- (void)setSimulateLoadingError:(BOOL)a3
{
  self->_simulateLoadingError = a3;
}

- (void)setSimulateAssetContentLoading:(BOOL)a3
{
  self->_simulateAssetContentLoading = a3;
}

- (void)setShowWallpaperCropRect:(BOOL)a3
{
  self->_showWallpaperCropRect = a3;
}

- (void)setShowVideoSearchHighlightLabel:(BOOL)a3
{
  self->_showVideoSearchHighlightLabel = a3;
}

- (void)setShowSaliencyRects:(BOOL)a3
{
  self->_showSaliencyRects = a3;
}

- (void)setShowReframedBadge:(BOOL)a3
{
  self->_showReframedBadge = a3;
}

- (void)setShowPaddedFacesRect:(BOOL)a3
{
  self->_showPaddedFacesRect = a3;
}

- (void)setShowLoadingIndicatorDuringDownload:(BOOL)a3
{
  self->_showLoadingIndicatorDuringDownload = a3;
}

- (void)setShowGazeRects:(BOOL)a3
{
  self->_showGazeRects = a3;
}

- (void)setShowGainMapButton:(BOOL)a3
{
  self->_showGainMapButton = a3;
}

- (void)setShowGIFLoadingDelays:(BOOL)a3
{
  self->_showGIFLoadingDelays = a3;
}

- (void)setShowFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls = a3;
}

- (void)setShowFacesTorsosRects:(BOOL)a3
{
  self->_showFacesTorsosRects = a3;
}

- (void)setShowFacesRect:(BOOL)a3
{
  self->_showFacesRect = a3;
}

- (void)setShowBufferingIndicatorDuringPlay:(BOOL)a3
{
  self->_showBufferingIndicatorDuringPlay = a3;
}

- (void)setShowBestSquareRect:(BOOL)a3
{
  self->_showBestSquareRect = a3;
}

- (void)setShouldMergeOverlappingLivePhotos:(BOOL)a3
{
  self->_shouldMergeOverlappingLivePhotos = a3;
}

- (void)setShouldFadeAccessoryView:(BOOL)a3
{
  self->_shouldFadeAccessoryView = a3;
}

- (void)setScaleToFitBehavior:(unint64_t)a3
{
  self->_scaleToFitBehavior = a3;
}

- (void)setQuickCropUseSymbol:(BOOL)a3
{
  self->_quickCropUseSymbol = a3;
}

- (void)setQuickCropInvisibilityTimer:(double)a3
{
  self->_quickCropInvisibilityTimer = a3;
}

- (void)setQuickCropHideOtherToolsInEdit:(BOOL)a3
{
  self->_quickCropHideOtherToolsInEdit = a3;
}

- (void)setQuickCropFadeOut:(double)a3
{
  self->_quickCropFadeOut = a3;
}

- (void)setQuickCropFadeIn:(double)a3
{
  self->_quickCropFadeIn = a3;
}

- (void)setQuickCropEnabled:(BOOL)a3
{
  self->_quickCropEnabled = a3;
}

- (void)setQuickCropBackgroundBrightness:(double)a3
{
  self->_quickCropBackgroundBrightness = a3;
}

- (void)setPreferredImageDynamicRangeAnimationDuration:(double)a3
{
  self->_preferredImageDynamicRangeAnimationDuration = a3;
}

- (void)setPlayGIFSettledThreshold:(double)a3
{
  self->_playGIFSettledThreshold = a3;
}

- (void)setPlayGIFMoveOutThreshold:(double)a3
{
  self->_playGIFMoveOutThreshold = a3;
}

- (void)setPlayGIFEnterThreshold:(double)a3
{
  self->_playGIFEnterThreshold = a3;
}

- (void)setPersistChromeVisibility:(BOOL)a3
{
  self->_persistChromeVisibility = a3;
}

- (void)setParallaxModel:(int64_t)a3
{
  self->_parallaxModel = a3;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void)setPagingSpringPullAdjustment:(double)a3
{
  self->_pagingSpringPullAdjustment = a3;
}

- (void)setPagingFrictionAdjustment:(double)a3
{
  self->_pagingFrictionAdjustment = a3;
}

- (void)setOverlappingLivePhotosCountLimit:(unint64_t)a3
{
  self->_overlappingLivePhotosCountLimit = a3;
}

- (void)setMinimumVisibleContentHeight:(double)a3
{
  self->_minimumVisibleContentHeight = a3;
}

- (void)setMinimumVisibleCommentedContentHeight:(double)a3
{
  self->_minimumVisibleCommentedContentHeight = a3;
}

- (void)setMinimumFullCommentTitleViewWidth:(double)a3
{
  self->_minimumFullCommentTitleViewWidth = a3;
}

- (void)setMinimumContentInset:(double)a3
{
  self->_minimumContentInset = a3;
}

- (void)setMinNavigationDistanceForQuickPagingRegime:(int64_t)a3
{
  self->_minNavigationDistanceForQuickPagingRegime = a3;
}

- (void)setMinNavigationDistanceForFastRegime:(int64_t)a3
{
  self->_minNavigationDistanceForFastRegime = a3;
}

- (void)setLockScrollDuringLivePhotoPlayback:(BOOL)a3
{
  self->_lockScrollDuringLivePhotoPlayback = a3;
}

- (void)setLivePhotoScrubberShowForPlayback:(BOOL)a3
{
  self->_livePhotoScrubberShowForPlayback = a3;
}

- (void)setLivePhotoSRLCompensationManualValue:(double)a3
{
  self->_livePhotoSRLCompensationManualValue = a3;
}

- (void)setLivePhotoSRLCompensationManualMode:(BOOL)a3
{
  self->_livePhotoSRLCompensationManualMode = a3;
}

- (void)setLivePhotoSRLCompensationFilterName:(id)a3
{
}

- (void)setLivePhotoSRLCompensationEnabled:(BOOL)a3
{
  self->_livePhotoSRLCompensationEnabled = a3;
}

- (void)setLivePhotoMinimumOverlappingDuration:(double)a3
{
  self->_livePhotoMinimumOverlappingDuration = a3;
}

- (void)setLivePhotoInteractionThreshold:(double)a3
{
  self->_livePhotoInteractionThreshold = a3;
}

- (void)setItemContentCornerRadius:(double)a3
{
  self->_itemContentCornerRadius = a3;
}

- (void)setInterpageSpacing:(double)a3
{
  self->_interpageSpacing = a3;
}

- (void)setHideToolbarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideToolbarWhenShowingAccessoryView = a3;
}

- (void)setHideFloatingInfoPanelWhenHidingChrome:(BOOL)a3
{
  self->_hideFloatingInfoPanelWhenHidingChrome = a3;
}

- (void)setHdrSuppressionAnimationDuration:(double)a3
{
  self->_hdrSuppressionAnimationDuration = a3;
}

- (void)setHdrShareSheetCrossfadeAnimationDuration:(double)a3
{
  self->_hdrShareSheetCrossfadeAnimationDuration = a3;
}

- (void)setFullQualityCrossfadeDuration:(double)a3
{
  self->_fullQualityCrossfadeDuration = a3;
}

- (void)setFullQualityCrossfadeBehavior:(unint64_t)a3
{
  self->_fullQualityCrossfadeBehavior = a3;
}

- (void)setForceURLWithFigPhotoTiledLayer:(BOOL)a3
{
  self->_forceURLWithFigPhotoTiledLayer = a3;
}

- (void)setFinalFadeOutDuration:(double)a3
{
  self->_finalFadeOutDuration = a3;
}

- (void)setEnablePreferredImageDynamicRangeAnimation:(BOOL)a3
{
  self->_enablePreferredImageDynamicRangeAnimation = a3;
}

- (void)setEnableHDRImages:(BOOL)a3
{
  self->_enableHDRImages = a3;
}

- (void)setEnableFigPhotoTiledLayer:(BOOL)a3
{
  self->_enableFigPhotoTiledLayer = a3;
}

- (void)setEnableFigPhotoBackgroundSizeBasedDisplay:(BOOL)a3
{
  self->_enableFigPhotoBackgroundSizeBasedDisplay = a3;
}

- (void)setDoubleTapZoomFactor:(double)a3
{
  self->_doubleTapZoomFactor = a3;
}

- (void)setDoubleTapZoomAreaExcludesBars:(BOOL)a3
{
  self->_doubleTapZoomAreaExcludesBars = a3;
}

- (void)setDoubleTapZoomAreaExcludesBackground:(BOOL)a3
{
  self->_doubleTapZoomAreaExcludesBackground = a3;
}

- (void)setDefaultZoomInFactor:(double)a3
{
  self->_defaultZoomInFactor = a3;
}

- (void)setDebuggingTitleType:(int64_t)a3
{
  self->_debuggingTitleType = a3;
}

- (void)setDebuggingBadgesWhenFavorite:(unint64_t)a3
{
  self->_debuggingBadgesWhenFavorite = a3;
}

- (void)setDebuggingBadges:(unint64_t)a3
{
  self->_debuggingBadges = a3;
}

- (void)setChromeTimedAutoHideAnimationDuration:(double)a3
{
  self->_chromeTimedAutoHideAnimationDuration = a3;
}

- (void)setChromeDefaultAnimationDuration:(double)a3
{
  self->_chromeDefaultAnimationDuration = a3;
}

- (void)setChromeBackgroundAnimationType:(int64_t)a3
{
  self->_chromeBackgroundAnimationType = a3;
}

- (void)setChromeAutoHideDelay:(double)a3
{
  self->_chromeAutoHideDelay = a3;
}

- (void)setChromeAutoHideBehaviorOnZoom:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnZoom = a3;
}

- (void)setChromeAutoHideBehaviorOnSwipe:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnSwipe = a3;
}

- (void)setChromeAutoHideBehaviorOnPlayButton:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnPlayButton = a3;
}

- (void)setChromeAutoHideBehaviorOnLivePhoto:(int64_t)a3
{
  self->_chromeAutoHideBehaviorOnLivePhoto = a3;
}

- (void)setChromeAnimationType:(int64_t)a3
{
  self->_chromeAnimationType = a3;
}

- (void)setBounceSpringDamping:(double)a3
{
  self->_bounceSpringDamping = a3;
}

- (void)setBounceInitialVelocity:(double)a3
{
  self->_bounceInitialVelocity = a3;
}

- (void)setBounceDuration:(double)a3
{
  self->_bounceDuration = a3;
}

- (void)setBounceDelay:(double)a3
{
  self->_bounceDelay = a3;
}

- (void)setBarsAreaVerticalOutset:(double)a3
{
  self->_barsAreaVerticalOutset = a3;
}

- (void)setAutoplayVideo:(BOOL)a3
{
  self->_autoplayVideo = a3;
}

- (void)setAutoplayScrubberWidth:(double)a3
{
  self->_autoplayScrubberWidth = a3;
}

- (void)setApplyPerspectiveTransformDuringVitality:(BOOL)a3
{
  self->_applyPerspectiveTransformDuringVitality = a3;
}

- (void)setAlwaysShowRenderIndicator:(BOOL)a3
{
  self->_alwaysShowRenderIndicator = a3;
}

- (void)setAlwaysShowAirPlayButton:(BOOL)a3
{
  self->_alwaysShowAirPlayButton = a3;
}

- (void)setAllowsDetailsToggleButtonInBars:(BOOL)a3
{
  self->_allowsDetailsToggleButtonInBars = a3;
}

- (void)setAllowUserTransform:(BOOL)a3
{
  self->_allowUserTransform = a3;
}

- (void)setAllowStatusBar:(BOOL)a3
{
  self->_allowStatusBar = a3;
}

- (void)setAllowScrubber:(BOOL)a3
{
  self->_allowScrubber = a3;
}

- (void)setAllowPlayButtonInBars:(BOOL)a3
{
  self->_allowPlayButtonInBars = a3;
}

- (void)setAllowParallax:(BOOL)a3
{
  self->_allowParallax = a3;
}

- (void)setAllowGIFPlayback:(BOOL)a3
{
  self->_allowGIFPlayback = a3;
}

- (void)setAllowFullsizeJPEGDisplay:(BOOL)a3
{
  self->_allowFullsizeJPEGDisplay = a3;
}

- (void)setAllowDoubleTapZoom:(BOOL)a3
{
  self->_allowDoubleTapZoom = a3;
}

- (void)setAllowChromeHiding:(BOOL)a3
{
  self->_allowChromeHiding = a3;
}

- (void)setAllowBadges:(BOOL)a3
{
  self->_allowBadges = a3;
}

- (void)setAccessoryViewType:(int64_t)a3
{
  self->_accessoryViewType = a3;
}

- (void)setAccessoryInitialTopPosition:(double)a3
{
  self->_accessoryInitialTopPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoSRLCompensationFilterName, 0);
  objc_storeStrong((id *)&self->_scrubberSettings, 0);
  objc_storeStrong((id *)&self->_cachedAutoplayVideoEnabled, 0);
}

- (BOOL)userAllowsVisualIntelligenceVisualLookupInfoPanelMode
{
  return self->_userAllowsVisualIntelligenceVisualLookupInfoPanelMode;
}

- (BOOL)userAllowsVisualIntelligenceRemoveBackground
{
  return self->_userAllowsVisualIntelligenceRemoveBackground;
}

- (BOOL)userAllowsVisualIntelligenceInVideoFrame
{
  return self->_userAllowsVisualIntelligenceInVideoFrame;
}

- (BOOL)userAllowsVisualIntelligenceV2
{
  return self->_userAllowsVisualIntelligenceV2;
}

- (BOOL)userAllowsVisualIntelligence
{
  return self->_userAllowsVisualIntelligence;
}

- (void)setMinimumDurationForIncrementingViewCount:(double)a3
{
  self->_minimumDurationForIncrementingViewCount = a3;
}

- (double)minimumDurationForIncrementingViewCount
{
  return self->_minimumDurationForIncrementingViewCount;
}

- (double)finalFadeOutDuration
{
  return self->_finalFadeOutDuration;
}

- (BOOL)alwaysShowAirPlayButton
{
  return self->_alwaysShowAirPlayButton;
}

- (double)simulatedRenderProgress
{
  return self->_simulatedRenderProgress;
}

- (BOOL)alwaysShowRenderIndicator
{
  return self->_alwaysShowRenderIndicator;
}

- (BOOL)showLoadingIndicatorDuringDownload
{
  return self->_showLoadingIndicatorDuringDownload;
}

- (BOOL)showBufferingIndicatorDuringPlay
{
  return self->_showBufferingIndicatorDuringPlay;
}

- (BOOL)useDebuggingProgressLabel
{
  return self->_useDebuggingProgressLabel;
}

- (unint64_t)debuggingBadgesWhenFavorite
{
  return self->_debuggingBadgesWhenFavorite;
}

- (unint64_t)debuggingBadges
{
  return self->_debuggingBadges;
}

- (int64_t)debuggingTitleType
{
  return self->_debuggingTitleType;
}

- (BOOL)useDebuggingColors
{
  return self->_useDebuggingColors;
}

- (BOOL)quickCropUseSymbol
{
  return self->_quickCropUseSymbol;
}

- (BOOL)quickCropHideOtherToolsInEdit
{
  return self->_quickCropHideOtherToolsInEdit;
}

- (double)quickCropBackgroundBrightness
{
  return self->_quickCropBackgroundBrightness;
}

- (double)quickCropFadeOut
{
  return self->_quickCropFadeOut;
}

- (double)quickCropFadeIn
{
  return self->_quickCropFadeIn;
}

- (double)quickCropInvisibilityTimer
{
  return self->_quickCropInvisibilityTimer;
}

- (BOOL)quickCropEnabled
{
  return self->_quickCropEnabled;
}

- (BOOL)showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls
{
  return self->_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls;
}

- (int64_t)simulatedLoadingErrorType
{
  return self->_simulatedLoadingErrorType;
}

- (BOOL)simulateLoadingError
{
  return self->_simulateLoadingError;
}

- (double)simulatedAssetContentLoadingDuration
{
  return self->_simulatedAssetContentLoadingDuration;
}

- (BOOL)simulateAssetContentLoading
{
  return self->_simulateAssetContentLoading;
}

- (double)playGIFMoveOutThreshold
{
  return self->_playGIFMoveOutThreshold;
}

- (double)playGIFEnterThreshold
{
  return self->_playGIFEnterThreshold;
}

- (double)playGIFSettledThreshold
{
  return self->_playGIFSettledThreshold;
}

- (BOOL)showGIFLoadingDelays
{
  return self->_showGIFLoadingDelays;
}

- (BOOL)allowGIFPlayback
{
  return self->_allowGIFPlayback;
}

- (double)bounceInitialVelocity
{
  return self->_bounceInitialVelocity;
}

- (double)bounceSpringDamping
{
  return self->_bounceSpringDamping;
}

- (double)bounceDelay
{
  return self->_bounceDelay;
}

- (double)bounceDuration
{
  return self->_bounceDuration;
}

- (int64_t)minNavigationDistanceForFastRegime
{
  return self->_minNavigationDistanceForFastRegime;
}

- (double)visibilityDurationForExitingFastRegime
{
  return self->_visibilityDurationForExitingFastRegime;
}

- (double)visibilityDurationForEnteringFastRegime
{
  return self->_visibilityDurationForEnteringFastRegime;
}

- (int64_t)minNavigationDistanceForQuickPagingRegime
{
  return self->_minNavigationDistanceForQuickPagingRegime;
}

- (double)visibilityDurationForExitingQuickPagingRegime
{
  return self->_visibilityDurationForExitingQuickPagingRegime;
}

- (double)visibilityDurationForEnteringQuickPagingRegime
{
  return self->_visibilityDurationForEnteringQuickPagingRegime;
}

- (unint64_t)viewModelCacheCountLimit
{
  return self->_viewModelCacheCountLimit;
}

- (BOOL)showReframedBadge
{
  return self->_showReframedBadge;
}

- (BOOL)vitalityUseInsetLimiting
{
  return self->_vitalityUseInsetLimiting;
}

- (double)vitalityMaxAllowedLargeInsetPoints
{
  return self->_vitalityMaxAllowedLargeInsetPoints;
}

- (double)vitalityMaxAllowedInsetPoints
{
  return self->_vitalityMaxAllowedInsetPoints;
}

- (double)vitalityFeatherScale
{
  return self->_vitalityFeatherScale;
}

- (double)vitalityMaskBlur
{
  return self->_vitalityMaskBlur;
}

- (unint64_t)overlappingLivePhotosCountLimit
{
  return self->_overlappingLivePhotosCountLimit;
}

- (double)livePhotoMinimumOverlappingDuration
{
  return self->_livePhotoMinimumOverlappingDuration;
}

- (BOOL)shouldMergeOverlappingLivePhotos
{
  return self->_shouldMergeOverlappingLivePhotos;
}

- (BOOL)livePhotoScrubberShowForPlayback
{
  return self->_livePhotoScrubberShowForPlayback;
}

- (BOOL)lockScrollDuringLivePhotoPlayback
{
  return self->_lockScrollDuringLivePhotoPlayback;
}

- (BOOL)applyPerspectiveTransformDuringVitality
{
  return self->_applyPerspectiveTransformDuringVitality;
}

- (double)livePhotoInteractionThreshold
{
  return self->_livePhotoInteractionThreshold;
}

- (NSString)livePhotoSRLCompensationFilterName
{
  return self->_livePhotoSRLCompensationFilterName;
}

- (double)livePhotoSRLCompensationManualValue
{
  return self->_livePhotoSRLCompensationManualValue;
}

- (BOOL)livePhotoSRLCompensationManualMode
{
  return self->_livePhotoSRLCompensationManualMode;
}

- (BOOL)livePhotoSRLCompensationEnabled
{
  return self->_livePhotoSRLCompensationEnabled;
}

- (double)videoHighlightPreroll
{
  return self->_videoHighlightPreroll;
}

- (unint64_t)videoHighlightColorName
{
  return self->_videoHighlightColorName;
}

- (void)setShowSearchQueryInVideoHighlightLabel:(BOOL)a3
{
  self->_showSearchQueryInVideoHighlightLabel = a3;
}

- (BOOL)showSearchQueryInVideoHighlightLabel
{
  return self->_showSearchQueryInVideoHighlightLabel;
}

- (void)setShowVideoHighlightLabel:(BOOL)a3
{
  self->_showVideoHighlightLabel = a3;
}

- (BOOL)showVideoHighlightLabel
{
  return self->_showVideoHighlightLabel;
}

- (BOOL)videoStartAtFirstHighlight
{
  return self->_videoStartAtFirstHighlight;
}

- (BOOL)showVideoSearchHighlightLabel
{
  return self->_showVideoSearchHighlightLabel;
}

- (void)setInsertDummyHighlightTimeRanges:(BOOL)a3
{
  self->_insertDummyHighlightTimeRanges = a3;
}

- (BOOL)insertDummyHighlightTimeRanges
{
  return self->_insertDummyHighlightTimeRanges;
}

- (BOOL)videoShowLiveEffectsRenderingIndicator
{
  return self->_videoShowLiveEffectsRenderingIndicator;
}

- (BOOL)videoShowDebugBorders
{
  return self->_videoShowDebugBorders;
}

- (double)autoplayScrubberWidth
{
  return self->_autoplayScrubberWidth;
}

- (double)videoPauseThreshold
{
  return self->_videoPauseThreshold;
}

- (BOOL)allowPlayButtonInBars
{
  return self->_allowPlayButtonInBars;
}

- (double)videoAutoplayThreshold
{
  return self->_videoAutoplayThreshold;
}

- (BOOL)autoplayVideo
{
  return self->_autoplayVideo;
}

- (BOOL)simulateWorstCaseFigPhotoBackgroundSize
{
  return self->_simulateWorstCaseFigPhotoBackgroundSize;
}

- (BOOL)enableFigPhotoBackgroundSizeBasedDisplay
{
  return self->_enableFigPhotoBackgroundSizeBasedDisplay;
}

- (BOOL)forceURLWithFigPhotoTiledLayer
{
  return self->_forceURLWithFigPhotoTiledLayer;
}

- (BOOL)useURLForLargePhotosWithFigPhotoTiledLayer
{
  return self->_useURLForLargePhotosWithFigPhotoTiledLayer;
}

- (BOOL)enableFigPhotoTiledLayer
{
  return self->_enableFigPhotoTiledLayer;
}

- (void)setRetainProxyUntilZoom:(BOOL)a3
{
  self->_retainProxyUntilZoom = a3;
}

- (BOOL)retainProxyUntilZoom
{
  return self->_retainProxyUntilZoom;
}

- (double)fullQualityCrossfadeDuration
{
  return self->_fullQualityCrossfadeDuration;
}

- (unint64_t)fullQualityCrossfadeBehavior
{
  return self->_fullQualityCrossfadeBehavior;
}

- (BOOL)doubleTapZoomAreaExcludesBackground
{
  return self->_doubleTapZoomAreaExcludesBackground;
}

- (BOOL)doubleTapZoomAreaExcludesBars
{
  return self->_doubleTapZoomAreaExcludesBars;
}

- (double)doubleTapZoomFactor
{
  return self->_doubleTapZoomFactor;
}

- (double)defaultZoomInFactor
{
  return self->_defaultZoomInFactor;
}

- (double)visualLookupGlyphAnimationFadeOutDelay
{
  return self->_visualLookupGlyphAnimationFadeOutDelay;
}

- (double)barsAreaVerticalOutset
{
  return self->_barsAreaVerticalOutset;
}

- (BOOL)allowStatusBar
{
  return self->_allowStatusBar;
}

- (double)itemContentCornerRadius
{
  return self->_itemContentCornerRadius;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (int64_t)parallaxModel
{
  return self->_parallaxModel;
}

- (BOOL)allowParallax
{
  return self->_allowParallax;
}

- (double)pagingFrictionAdjustment
{
  return self->_pagingFrictionAdjustment;
}

- (double)pagingSpringPullAdjustment
{
  return self->_pagingSpringPullAdjustment;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (int64_t)chromeBackgroundAnimationType
{
  return self->_chromeBackgroundAnimationType;
}

- (int64_t)chromeAnimationType
{
  return self->_chromeAnimationType;
}

- (BOOL)persistChromeVisibility
{
  return self->_persistChromeVisibility;
}

- (double)chromeTimedAutoHideAnimationDuration
{
  return self->_chromeTimedAutoHideAnimationDuration;
}

- (double)chromeAutoHideDelay
{
  return self->_chromeAutoHideDelay;
}

- (int64_t)chromeAutoHideBehaviorOnZoom
{
  return self->_chromeAutoHideBehaviorOnZoom;
}

- (int64_t)chromeAutoHideBehaviorOnSwipe
{
  return self->_chromeAutoHideBehaviorOnSwipe;
}

- (int64_t)chromeAutoHideBehaviorOnPlayButton
{
  return self->_chromeAutoHideBehaviorOnPlayButton;
}

- (int64_t)chromeAutoHideBehaviorOnLivePhoto
{
  return self->_chromeAutoHideBehaviorOnLivePhoto;
}

- (double)chromeDefaultAnimationDuration
{
  return self->_chromeDefaultAnimationDuration;
}

- (BOOL)shouldFadeAccessoryView
{
  return self->_shouldFadeAccessoryView;
}

- (BOOL)squareImageCapToHalfHeight
{
  return self->_squareImageCapToHalfHeight;
}

- (BOOL)allowsDetailsToggleButtonInBars
{
  return self->_allowsDetailsToggleButtonInBars;
}

- (BOOL)hideFloatingInfoPanelWhenHidingChrome
{
  return self->_hideFloatingInfoPanelWhenHidingChrome;
}

- (BOOL)hideToolbarWhenShowingAccessoryView
{
  return self->_hideToolbarWhenShowingAccessoryView;
}

- (double)minimumFullCommentTitleViewWidth
{
  return self->_minimumFullCommentTitleViewWidth;
}

- (double)minimumVisibleCommentedContentHeight
{
  return self->_minimumVisibleCommentedContentHeight;
}

- (double)minimumVisibleContentHeight
{
  return self->_minimumVisibleContentHeight;
}

- (double)accessoryInitialTopPosition
{
  return self->_accessoryInitialTopPosition;
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (double)hdrShareSheetCrossfadeAnimationDuration
{
  return self->_hdrShareSheetCrossfadeAnimationDuration;
}

- (double)hdrSuppressionAnimationDuration
{
  return self->_hdrSuppressionAnimationDuration;
}

- (double)preferredImageDynamicRangeAnimationDuration
{
  return self->_preferredImageDynamicRangeAnimationDuration;
}

- (BOOL)enablePreferredImageDynamicRangeAnimation
{
  return self->_enablePreferredImageDynamicRangeAnimation;
}

- (BOOL)enableHDRImages
{
  return self->_enableHDRImages;
}

- (BOOL)showGainMapButton
{
  return self->_showGainMapButton;
}

- (BOOL)useHDRVideoThumbnails
{
  return self->_useHDRVideoThumbnails;
}

- (BOOL)showWallpaperCropRect
{
  return self->_showWallpaperCropRect;
}

- (BOOL)showGazeRects
{
  return self->_showGazeRects;
}

- (BOOL)showFacesTorsosRects
{
  return self->_showFacesTorsosRects;
}

- (BOOL)showBestSquareRect
{
  return self->_showBestSquareRect;
}

- (BOOL)showPaddedFacesRect
{
  return self->_showPaddedFacesRect;
}

- (BOOL)showFacesRect
{
  return self->_showFacesRect;
}

- (BOOL)showSaliencyRects
{
  return self->_showSaliencyRects;
}

- (int64_t)userNavigationMaximumDistance
{
  return self->_userNavigationMaximumDistance;
}

- (BOOL)allowFullsizeJPEGDisplay
{
  return self->_allowFullsizeJPEGDisplay;
}

- (BOOL)allowDoubleTapZoom
{
  return self->_allowDoubleTapZoom;
}

- (BOOL)allowChromeHiding
{
  return self->_allowChromeHiding;
}

- (BOOL)allowScrubber
{
  return self->_allowScrubber;
}

- (BOOL)allowBadges
{
  return self->_allowBadges;
}

- (BOOL)allowUserTransform
{
  return self->_allowUserTransform;
}

- (double)minimumContentInset
{
  return self->_minimumContentInset;
}

- (unint64_t)scaleToFitBehavior
{
  return self->_scaleToFitBehavior;
}

- (void)setScrubberSettings:(id)a3
{
}

- (PUScrubberSettings)scrubberSettings
{
  return self->_scrubberSettings;
}

- (int64_t)titleTapAction
{
  return self->_titleTapAction;
}

- (void)preferencesDidChange
{
  cachedAutoplayVideoEnabled = self->_cachedAutoplayVideoEnabled;
  self->_cachedAutoplayVideoEnabled = 0;

  PXUnregisterPreferencesObserver();
}

- (UIColor)videoHighlightColor
{
  v2 = [(PUOneUpSettings *)self videoHighlightColorName];
  if (v2 == (void *)1)
  {
    v2 = [MEMORY[0x1E4FB1618] systemYellowColor];
  }
  else if (!v2)
  {
    v2 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  return (UIColor *)v2;
}

- (BOOL)allowAutoplayVideoForAsset:(id)a3
{
  id v4 = a3;
  if (!self->_cachedAutoplayVideoEnabled)
  {
    uint64_t v5 = [NSNumber numberWithBool:PXPreferencesIsVideoAutoplayEnabled()];
    cachedAutoplayVideoEnabled = self->_cachedAutoplayVideoEnabled;
    self->_cachedAutoplayVideoEnabled = v5;

    PXRegisterPreferencesObserver();
  }
  if ([(PUOneUpSettings *)self autoplayVideo]) {
    BOOL v7 = [(NSNumber *)self->_cachedAutoplayVideoEnabled BOOLValue];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)allowsVisualIntelligenceVisualLookupInfoPanelMode
{
  LODWORD(v2) = [(PUOneUpSettings *)self userAllowsVisualIntelligenceVisualLookupInfoPanelMode];
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1) {
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1888);
    }
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 24) & 1;
  }
  return v2;
}

- (BOOL)allowsVisualIntelligenceRemoveBackground
{
  LODWORD(v2) = [(PUOneUpSettings *)self userAllowsVisualIntelligenceRemoveBackground];
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1) {
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1888);
    }
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 16) & 1;
  }
  return v2;
}

- (BOOL)allowsVisualIntelligenceInVideoFrame
{
  BOOL v2 = [(PUOneUpSettings *)self userAllowsVisualIntelligenceInVideoFrame];
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1) {
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1888);
    }
    LOBYTE(v2) = byte_1E9AAC40C & 1;
  }
  return v2;
}

- (BOOL)allowsVisualIntelligenceV2
{
  LODWORD(v2) = [(PUOneUpSettings *)self userAllowsVisualIntelligenceV2];
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1) {
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1888);
    }
    return ((unint64_t)_visualIntelligenceSupport_sharedSupport >> 8) & 1;
  }
  return v2;
}

- (BOOL)allowVisualIntelligence
{
  BOOL v2 = [(PUOneUpSettings *)self userAllowsVisualIntelligence];
  if (v2)
  {
    if (_visualIntelligenceSupport_onceToken != -1) {
      dispatch_once(&_visualIntelligenceSupport_onceToken, &__block_literal_global_1888);
    }
    LOBYTE(v2) = _visualIntelligenceSupport_sharedSupport & 1;
  }
  return v2;
}

- (int64_t)version
{
  return 4;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PUOneUpSettings_transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken != -1) {
    dispatch_once(&transientProperties_onceToken, block);
  }
  BOOL v2 = (void *)transientProperties_transientProperties;
  return v2;
}

void __38__PUOneUpSettings_transientProperties__block_invoke(uint64_t a1)
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)&OBJC_METACLASS___PUOneUpSettings;
  v1 = objc_msgSendSuper2(&v11, sel_transientProperties);
  BOOL v2 = NSStringFromSelector(sel_videoHighlightColor);
  v12[0] = v2;
  int v3 = NSStringFromSelector(sel_allowVisualIntelligence);
  v12[1] = v3;
  id v4 = NSStringFromSelector(sel_allowsVisualIntelligenceV2);
  v12[2] = v4;
  uint64_t v5 = NSStringFromSelector(sel_allowsVisualIntelligenceInVideoFrame);
  v12[3] = v5;
  uint64_t v6 = NSStringFromSelector(sel_allowsVisualIntelligenceRemoveBackground);
  v12[4] = v6;
  BOOL v7 = NSStringFromSelector(sel_allowsVisualIntelligenceVisualLookupInfoPanelMode);
  v12[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];
  uint64_t v9 = [v1 setByAddingObjectsFromArray:v8];
  objc_super v10 = (void *)transientProperties_transientProperties;
  transientProperties_transientProperties = v9;
}

+ (id)settingsControllerModule
{
  v521[22] = *MEMORY[0x1E4F143B8];
  v499 = (void *)MEMORY[0x1E4F94160];
  v496 = [MEMORY[0x1E4F94108] rowWithTitle:@"Title Tap Action" valueKeyPath:@"titleTapAction"];
  v491 = [v496 possibleValues:&unk_1F078AF58 titles:&unk_1F078AF70];
  v521[0] = v491;
  v485 = [MEMORY[0x1E4F94108] rowWithTitle:@"Scale Content To Fit" valueKeyPath:@"scaleToFitBehavior"];
  v478 = [v485 possibleValues:&unk_1F078AF88 titles:&unk_1F078AFA0];
  v521[1] = v478;
  v471 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Content Inset" valueKeyPath:@"minimumContentInset"];
  v464 = [v471 minValue:0.0 maxValue:300.0];
  v457 = objc_msgSend(v464, "pu_increment:", 1.0);
  v450 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"scaleToFitBehavior == %@", &unk_1F078C4E8];
  v443 = [v457 condition:v450];
  v521[2] = v443;
  v435 = [MEMORY[0x1E4F941F0] rowWithTitle:@"User Transform" valueKeyPath:@"allowUserTransform"];
  v521[3] = v435;
  v426 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Badges" valueKeyPath:@"allowBadges"];
  v521[4] = v426;
  v417 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Chrome Hiding" valueKeyPath:@"allowChromeHiding"];
  v521[5] = v417;
  v415 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Double Tap Zoom" valueKeyPath:@"allowDoubleTapZoom"];
  v521[6] = v415;
  v413 = [MEMORY[0x1E4F941F0] rowWithTitle:@"1:1 Zoom" valueKeyPath:@"allowFullsizeJPEGDisplay"];
  v521[7] = v413;
  v408 = [MEMORY[0x1E4F941D8] rowWithTitle:@"User Swipe Direction Memory" valueKeyPath:@"userNavigationMaximumDistance"];
  v399 = [v408 minValue:0.0 maxValue:20.0];
  v391 = objc_msgSend(v399, "pu_increment:", 1.0);
  v521[8] = v391;
  BOOL v2 = (void *)MEMORY[0x1E4F94130];
  v383 = [MEMORY[0x1E4F907C0] sharedInstance];
  v375 = objc_msgSend(v2, "pu_rowWithTitle:settings:", @"Swipe Down", v383);
  v521[9] = v375;
  v367 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Library Scrubber" valueKeyPath:@"allowScrubber"];
  v521[10] = v367;
  v359 = [MEMORY[0x1E4F94130] rowWithTitle:@"Scrubber" childSettingsKeyPath:@"scrubberSettings"];
  v521[11] = v359;
  v351 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Saliency Rects" valueKeyPath:@"showSaliencyRects"];
  v521[12] = v351;
  v344 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Faces Rect" valueKeyPath:@"showFacesRect"];
  v521[13] = v344;
  v337 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Padded Faces Rect" valueKeyPath:@"showPaddedFacesRect"];
  v330 = [v337 conditionFormat:@"showFacesRect == YES"];
  v521[14] = v330;
  v323 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Best Square Rect" valueKeyPath:@"showBestSquareRect"];
  v521[15] = v323;
  v318 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Faces and Torsos Rects" valueKeyPath:@"showFacesTorsosRects"];
  v521[16] = v318;
  int v3 = (void *)MEMORY[0x1E4F941F0];
  v313 = NSStringFromSelector(sel_showGazeRects);
  id v4 = [v3 rowWithTitle:@"Show Gaze Rects" valueKeyPath:v313];
  v521[17] = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F941F0];
  uint64_t v6 = NSStringFromSelector(sel_showWallpaperCropRect);
  BOOL v7 = [v5 rowWithTitle:@"Show Wallpaper Crop Rects" valueKeyPath:v6];
  v521[18] = v7;
  uint64_t v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Gain Map Button" valueKeyPath:@"showGainMapButton"];
  v521[19] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F941F0];
  objc_super v10 = NSStringFromSelector(sel_useHDRVideoThumbnails);
  objc_super v11 = [v9 rowWithTitle:@"HDR Video Thumbnails" valueKeyPath:v10];
  v521[20] = v11;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v13 = NSStringFromSelector(sel_enableHDRImages);
  v14 = [v12 rowWithTitle:@"Enable HDR Images" valueKeyPath:v13];
  v521[21] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v521 count:22];
  v500 = [v499 sectionWithRows:v15 title:@"Features"];

  v497 = (void *)MEMORY[0x1E4F94160];
  v16 = (void *)MEMORY[0x1E4F941F0];
  v492 = NSStringFromSelector(sel_enablePreferredImageDynamicRangeAnimation);
  v486 = [v16 rowWithTitle:@"Enable Animation" valueKeyPath:v492];
  v520[0] = v486;
  v17 = (void *)MEMORY[0x1E4F941D8];
  v479 = NSStringFromSelector(sel_preferredImageDynamicRangeAnimationDuration);
  v472 = [v17 rowWithTitle:@"Preferred Image Dynamic Range Duration" valueKeyPath:v479];
  v465 = [v472 minValue:0.0 maxValue:10.0];
  v458 = objc_msgSend(v465, "pu_increment:", 0.0500000007);
  v451 = [v458 conditionFormat:@"enablePreferredImageDynamicRangeAnimation == YES"];
  v520[1] = v451;
  v18 = (void *)MEMORY[0x1E4F941D8];
  v19 = NSStringFromSelector(sel_hdrSuppressionAnimationDuration);
  v20 = [v18 rowWithTitle:@"Duration" valueKeyPath:v19];
  v21 = [v20 minValue:0.0 maxValue:10.0];
  v22 = objc_msgSend(v21, "pu_increment:", 0.100000001);
  v23 = [v22 conditionFormat:@"enablePreferredImageDynamicRangeAnimation == YES"];
  v520[2] = v23;
  v24 = (void *)MEMORY[0x1E4F941D8];
  v25 = NSStringFromSelector(sel_hdrShareSheetCrossfadeAnimationDuration);
  v26 = [v24 rowWithTitle:@"HDR Share Sheet Crossfade Duration" valueKeyPath:v25];
  v27 = [v26 minValue:0.0 maxValue:10.0];
  v28 = objc_msgSend(v27, "pu_increment:", 0.0500000007);
  v520[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v520 count:4];
  v498 = [v497 sectionWithRows:v29 title:@"HDR Animations"];

  int v416 = _os_feature_enabled_impl();
  if (v416)
  {
    v466 = (void *)MEMORY[0x1E4F94160];
    v30 = (void *)MEMORY[0x1E4F941F0];
    v493 = NSStringFromSelector(sel_userAllowsVisualIntelligence);
    v487 = [v30 rowWithTitle:@"Allow V1" valueKeyPath:v493];
    v519[0] = v487;
    v31 = (void *)MEMORY[0x1E4F941F0];
    v480 = NSStringFromSelector(sel_userAllowsVisualIntelligenceV2);
    v473 = [v31 rowWithTitle:@"Allow V2" valueKeyPath:v480];
    v519[1] = v473;
    v32 = (void *)MEMORY[0x1E4F941F0];
    v33 = NSStringFromSelector(sel_userAllowsVisualIntelligenceInVideoFrame);
    v34 = [v32 rowWithTitle:@"Allow Video" valueKeyPath:v33];
    v35 = [v34 conditionFormat:@"allowVisualIntelligence == YES && allowsVisualIntelligenceV2 == YES"];
    v519[2] = v35;
    v36 = (void *)MEMORY[0x1E4F941F0];
    v37 = NSStringFromSelector(sel_userAllowsVisualIntelligenceRemoveBackground);
    v38 = [v36 rowWithTitle:@"Allow Remove Background" valueKeyPath:v37];
    v39 = [v38 conditionFormat:@"allowVisualIntelligence == YES"];
    v519[3] = v39;
    v40 = (void *)MEMORY[0x1E4F941F0];
    v41 = NSStringFromSelector(sel_userAllowsVisualIntelligenceVisualLookupInfoPanelMode);
    v42 = [v40 rowWithTitle:@"Allow Info Panel Mode" valueKeyPath:v41];
    v43 = [v42 conditionFormat:@"allowVisualIntelligence == YES"];
    v519[4] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v519 count:5];
    v414 = [v466 sectionWithRows:v44 title:@"Visual Intelligence Allow"];
  }
  else
  {
    v414 = 0;
  }
  v494 = (void *)MEMORY[0x1E4F94160];
  v488 = [MEMORY[0x1E4F94108] rowWithTitle:@"Accessory Views" valueKeyPath:@"accessoryViewType"];
  v481 = [v488 possibleValues:&unk_1F078AFB8 titles:&unk_1F078AFD0];
  v518[0] = v481;
  v474 = objc_msgSend(MEMORY[0x1E4F94130], "pu_rowWithTitle:settingsProvider:", @"Sample Accessory View Settings", &__block_literal_global_317);
  v467 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"accessoryViewType == %@", &unk_1F078C518];
  v459 = [v474 condition:v467];
  v518[1] = v459;
  v452 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Initial Top Position" valueKeyPath:@"accessoryInitialTopPosition"];
  v444 = [v452 minValue:0.0 maxValue:1.0];
  v436 = objc_msgSend(v444, "pu_increment:", 0.0500000007);
  v518[2] = v436;
  v427 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Visible Content Height" valueKeyPath:@"minimumVisibleContentHeight"];
  v418 = [v427 minValue:-180.0 maxValue:500.0];
  v409 = objc_msgSend(v418, "pu_increment:", 10.0);
  v518[3] = v409;
  v45 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Visible Commented Content Height" valueKeyPath:@"minimumVisibleCommentedContentHeight"];
  v46 = [v45 minValue:-100.0 maxValue:500.0];
  v47 = objc_msgSend(v46, "pu_increment:", 10.0);
  v518[4] = v47;
  v48 = (void *)MEMORY[0x1E4F941F0];
  v49 = NSStringFromSelector(sel_squareImageCapToHalfHeight);
  v50 = [v48 rowWithTitle:@"Square Image Cap to Half Height" valueKeyPath:v49];
  v518[5] = v50;
  v51 = (void *)MEMORY[0x1E4F941F0];
  v52 = NSStringFromSelector(sel_hideFloatingInfoPanelWhenHidingChrome);
  v53 = [v51 rowWithTitle:@"Hide Floating Info Panel When Hiding Chrome" valueKeyPath:v52];
  v518[6] = v53;
  v54 = (void *)MEMORY[0x1E4F941F0];
  v55 = NSStringFromSelector(sel_shouldFadeAccessoryView);
  v56 = [v54 rowWithTitle:@"Fading Details View" valueKeyPath:v55];
  v518[7] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v518 count:8];
  v495 = [v494 sectionWithRows:v57 title:@"Accessory View"];

  v489 = (void *)MEMORY[0x1E4F94160];
  v482 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Default Animation Duration" valueKeyPath:@"chromeDefaultAnimationDuration"];
  v475 = [v482 minValue:0.0 maxValue:1.0];
  v468 = objc_msgSend(v475, "pu_increment:", 0.0500000007);
  v517[0] = v468;
  v460 = [MEMORY[0x1E4F94108] rowWithTitle:@"Auto Hide on Play Button" valueKeyPath:@"chromeAutoHideBehaviorOnPlayButton"];
  v453 = [v460 possibleValues:&unk_1F078AFE8 titles:&unk_1F078B000];
  v517[1] = v453;
  v445 = [MEMORY[0x1E4F94108] rowWithTitle:@"Auto Hide on Live Photo" valueKeyPath:@"chromeAutoHideBehaviorOnLivePhoto"];
  v437 = [v445 possibleValues:&unk_1F078AFE8 titles:&unk_1F078B000];
  v517[2] = v437;
  v428 = [MEMORY[0x1E4F94108] rowWithTitle:@"Auto Hide on Swipe" valueKeyPath:@"chromeAutoHideBehaviorOnSwipe"];
  v419 = [v428 possibleValues:&unk_1F078AFE8 titles:&unk_1F078B000];
  v517[3] = v419;
  v410 = [MEMORY[0x1E4F94108] rowWithTitle:@"Auto Hide on Zoom" valueKeyPath:@"chromeAutoHideBehaviorOnZoom"];
  v400 = [v410 possibleValues:&unk_1F078AFE8 titles:&unk_1F078B000];
  v517[4] = v400;
  v392 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Auto Hide Delay" valueKeyPath:@"chromeAutoHideDelay"];
  v384 = [v392 minValue:0.0 maxValue:5.0];
  v376 = objc_msgSend(v384, "pu_increment:", 0.100000001);
  v517[5] = v376;
  v58 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Auto Hide Animation Duration" valueKeyPath:@"chromeTimedAutoHideAnimationDuration"];
  v59 = [v58 minValue:0.0 maxValue:5.0];
  v60 = objc_msgSend(v59, "pu_increment:", 0.0500000007);
  v61 = [v60 conditionFormat:@"chromeAutoHideDelay > 0.0"];
  v517[6] = v61;
  v62 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Persist Visibility" valueKeyPath:@"persistChromeVisibility"];
  v517[7] = v62;
  v63 = [MEMORY[0x1E4F94108] rowWithTitle:@"Animation Type" valueKeyPath:@"chromeAnimationType"];
  v64 = [v63 possibleValues:&unk_1F078B018 titles:&unk_1F078B030];
  v517[8] = v64;
  v65 = [MEMORY[0x1E4F94108] rowWithTitle:@"Background Animation" valueKeyPath:@"chromeBackgroundAnimationType"];
  v66 = [v65 possibleValues:&unk_1F078B048 titles:&unk_1F078B060];
  v517[9] = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v517 count:10];
  v490 = [v489 sectionWithRows:v67 title:@"Chrome" conditionFormat:@"allowChromeHiding != 0"];

  v476 = (void *)MEMORY[0x1E4F94160];
  v483 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Interpage Spacing" valueKeyPath:@"interpageSpacing"];
  v469 = [v483 minValue:1.0 maxValue:100.0];
  v461 = objc_msgSend(v469, "pu_increment:", 1.0);
  v516[0] = v461;
  v454 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Paging Spring Pull Adjustment" valueKeyPath:@"pagingSpringPullAdjustment"];
  v446 = [v454 minValue:-3.0 maxValue:3.0];
  v438 = objc_msgSend(v446, "pu_increment:", 0.100000001);
  v516[1] = v438;
  v429 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Paging Friction Adjustment" valueKeyPath:@"pagingFrictionAdjustment"];
  v420 = [v429 minValue:-3.0 maxValue:3.0];
  v411 = objc_msgSend(v420, "pu_increment:", 0.100000001);
  v516[2] = v411;
  v401 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Parallax" valueKeyPath:@"allowParallax"];
  v516[3] = v401;
  v68 = [MEMORY[0x1E4F94108] rowWithTitle:@"Parallax Model" valueKeyPath:@"parallaxModel"];
  v69 = [v68 possibleValues:&unk_1F078B078 titles:&unk_1F078B090];
  v516[4] = v69;
  v70 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Parallax Factor" valueKeyPath:@"parallaxFactor"];
  v71 = [v70 minValue:0.0 maxValue:100.0];
  v72 = objc_msgSend(v71, "pu_increment:", 0.5);
  v516[5] = v72;
  v73 = (void *)MEMORY[0x1E4F941D8];
  v74 = NSStringFromSelector(sel_itemContentCornerRadius);
  v75 = [v73 rowWithTitle:@"Item Content Corner Radius" valueKeyPath:v74];
  v76 = [v75 minValue:0.0 maxValue:100.0];
  v77 = objc_msgSend(v76, "pu_increment:", 0.5);
  v516[6] = v77;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v516 count:7];
  v477 = [v476 sectionWithRows:v78 title:@"Layout"];

  v79 = (void *)MEMORY[0x1E4F94160];
  v80 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Status Bar" valueKeyPath:@"allowStatusBar"];
  v515[0] = v80;
  v81 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Area Vertical Outset" valueKeyPath:@"barsAreaVerticalOutset"];
  v82 = [v81 minValue:0.0 maxValue:500.0];
  v83 = objc_msgSend(v82, "pu_increment:", 1.0);
  v515[1] = v83;
  v84 = (void *)MEMORY[0x1E4F941D8];
  v85 = NSStringFromSelector(sel_visualLookupGlyphAnimationFadeOutDelay);
  v86 = [v84 rowWithTitle:@"LookUp Glyph FadeOut Delay" valueKeyPath:v85];
  v87 = [v86 minValue:0.0 maxValue:5.0];
  v88 = objc_msgSend(v87, "pu_increment:", 1.0);
  v515[2] = v88;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v515 count:3];
  v484 = [v79 sectionWithRows:v89 title:@"Bars"];

  v90 = (void *)MEMORY[0x1E4F94160];
  v91 = (void *)MEMORY[0x1E4F941D8];
  v92 = NSStringFromSelector(sel_defaultZoomInFactor);
  v93 = [v91 rowWithTitle:@"ZoomIn Factor" valueKeyPath:v92];
  v94 = [v93 minValue:1.0 maxValue:5.0];
  v95 = objc_msgSend(v94, "pu_increment:", 0.100000001);
  v514[0] = v95;
  v96 = (void *)MEMORY[0x1E4F94130];
  v97 = [MEMORY[0x1E4F903D0] sharedInstance];
  v98 = objc_msgSend(v96, "pu_rowWithTitle:settings:", @"Core Settings", v97);
  v514[1] = v98;
  v99 = objc_msgSend(MEMORY[0x1E4F94130], "pu_rowWithTitle:action:", @"Review Initial Zoom Scales", &__block_literal_global_558);
  v514[2] = v99;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v514 count:3];
  v412 = [v90 sectionWithRows:v100 title:@"Zoom" conditionFormat:@"allowDoubleTapZoom != 0"];

  v101 = (void *)MEMORY[0x1E4F94160];
  v102 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Zoom Factor" valueKeyPath:@"doubleTapZoomFactor"];
  v103 = [v102 minValue:1.0 maxValue:5.0];
  v104 = objc_msgSend(v103, "pu_increment:", 0.100000001);
  v513[0] = v104;
  v105 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Area Excludes Bars" valueKeyPath:@"doubleTapZoomAreaExcludesBars"];
  v513[1] = v105;
  v106 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Area Excludes Background" valueKeyPath:@"doubleTapZoomAreaExcludesBackground"];
  v513[2] = v106;
  v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:v513 count:3];
  v470 = [v101 sectionWithRows:v107 title:@"Double Tap Zoom" conditionFormat:@"allowDoubleTapZoom != 0"];

  v462 = (void *)MEMORY[0x1E4F94160];
  v108 = (void *)MEMORY[0x1E4F94108];
  v455 = NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v447 = [v108 rowWithTitle:@"Full Quality Crossfade" valueKeyPath:v455];
  v439 = [v447 possibleValues:&unk_1F078B0A8 titles:&unk_1F078B0C0];
  v512[0] = v439;
  v109 = (void *)MEMORY[0x1E4F941F0];
  v430 = NSStringFromSelector(sel_retainProxyUntilZoom);
  v110 = [v109 rowWithTitle:@"Retain DP Proxy Until Zoom" valueKeyPath:v430];
  v111 = NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v112 = [v110 conditionFormat:@"%@ != 0", v111];
  v512[1] = v112;
  v113 = (void *)MEMORY[0x1E4F941D8];
  v114 = NSStringFromSelector(sel_fullQualityCrossfadeDuration);
  v115 = [v113 rowWithTitle:@"Duration" valueKeyPath:v114];
  v116 = [v115 minValue:0.0 maxValue:3.0];
  v117 = objc_msgSend(v116, "pu_increment:", 0.1);
  v118 = NSStringFromSelector(sel_fullQualityCrossfadeBehavior);
  v119 = [v117 conditionFormat:@"%@ != 0", v118];
  v512[2] = v119;
  v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:v512 count:3];
  v463 = [v462 sectionWithRows:v120 title:@"Image Loading"];

  v121 = (void *)MEMORY[0x1E4F94160];
  v122 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable FigPhotoTiledLayer" valueKeyPath:@"enableFigPhotoTiledLayer"];
  v511[0] = v122;
  v123 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use URL for large photos" valueKeyPath:@"useURLForLargePhotosWithFigPhotoTiledLayer"];
  v511[1] = v123;
  v124 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force URL for all photos" valueKeyPath:@"forceURLWithFigPhotoTiledLayer"];
  v511[2] = v124;
  v125 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable background size based display" valueKeyPath:@"enableFigPhotoBackgroundSizeBasedDisplay"];
  v511[3] = v125;
  v126 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate worst case background size" valueKeyPath:@"simulateWorstCaseFigPhotoBackgroundSize"];
  v511[4] = v126;
  v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v511 count:5];
  v456 = [v121 sectionWithRows:v127 title:@"Fig Photo Tiled Layer"];

  v448 = (void *)MEMORY[0x1E4F94160];
  v128 = (void *)MEMORY[0x1E4F941F0];
  v440 = NSStringFromSelector(sel_autoplayVideo);
  v431 = [v128 rowWithTitle:@"Autoplay" valueKeyPath:v440];
  v510[0] = v431;
  v129 = (void *)MEMORY[0x1E4F941D8];
  v421 = NSStringFromSelector(sel_videoAutoplayThreshold);
  v402 = [v129 rowWithTitle:@"Threshold" valueKeyPath:v421];
  v393 = [v402 minValue:0.100000001 maxValue:1.0];
  v385 = [v393 conditionFormat:@"autoplayVideo == YES"];
  v510[1] = v385;
  v130 = (void *)MEMORY[0x1E4F941D8];
  v377 = NSStringFromSelector(sel_videoPauseThreshold);
  v368 = [v130 rowWithTitle:@"Video Pause Threshold" valueKeyPath:v377];
  v360 = [v368 minValue:0.100000001 maxValue:1.0];
  v510[2] = v360;
  v131 = (void *)MEMORY[0x1E4F941F0];
  v352 = NSStringFromSelector(sel_allowPlayButtonInBars);
  v345 = [v131 rowWithTitle:@"Play Button in Bars" valueKeyPath:v352];
  v510[3] = v345;
  v132 = (void *)MEMORY[0x1E4F941D8];
  v338 = NSStringFromSelector(sel_autoplayScrubberWidth);
  v331 = [v132 rowWithTitle:@"Autoplay Scrubber Width" valueKeyPath:v338];
  v324 = [v331 minValue:80.0 maxValue:200.0];
  v510[4] = v324;
  v133 = (void *)MEMORY[0x1E4F941F0];
  v319 = NSStringFromSelector(sel_videoShowDebugBorders);
  v314 = [v133 rowWithTitle:@"Debug Borders" valueKeyPath:v319];
  v510[5] = v314;
  v134 = (void *)MEMORY[0x1E4F941F0];
  v309 = NSStringFromSelector(sel_videoShowLiveEffectsRenderingIndicator);
  v306 = [v134 rowWithTitle:@"Live Effects Indicator" valueKeyPath:v309];
  v510[6] = v306;
  v135 = (void *)MEMORY[0x1E4F941F0];
  v303 = NSStringFromSelector(sel_insertDummyHighlightTimeRanges);
  v300 = [v135 rowWithTitle:@"Dummy Highlights" valueKeyPath:v303];
  v510[7] = v300;
  v136 = (void *)MEMORY[0x1E4F941F0];
  v297 = NSStringFromSelector(sel_showVideoSearchHighlightLabel);
  v293 = [v136 rowWithTitle:@"Search Highlight Label" valueKeyPath:v297];
  v510[8] = v293;
  v137 = (void *)MEMORY[0x1E4F941F0];
  v290 = NSStringFromSelector(sel_showSearchQueryInVideoHighlightLabel);
  v287 = [v137 rowWithTitle:@"Show Query" valueKeyPath:v290];
  v284 = NSStringFromSelector(sel_showVideoSearchHighlightLabel);
  v138 = [v287 conditionFormat:@"%@ == YES", v284];
  v510[9] = v138;
  v139 = (void *)MEMORY[0x1E4F941F0];
  v140 = NSStringFromSelector(sel_videoStartAtFirstHighlight);
  v141 = [v139 rowWithTitle:@"Seek To Highlight" valueKeyPath:v140];
  v510[10] = v141;
  v142 = (void *)MEMORY[0x1E4F94108];
  v143 = NSStringFromSelector(sel_videoHighlightColorName);
  v144 = [v142 rowWithTitle:@"Highlight Color" valueKeyPath:v143];
  v145 = [v144 possibleValues:&unk_1F078B0D8 titles:&unk_1F078B0F0];
  v510[11] = v145;
  v146 = (void *)MEMORY[0x1E4F941D8];
  v147 = NSStringFromSelector(sel_videoHighlightPreroll);
  v148 = [v146 rowWithTitle:@"Highlight Preroll" valueKeyPath:v147];
  v149 = [v148 minValue:0.0 maxValue:1.0];
  v510[12] = v149;
  v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v510 count:13];
  v449 = [v448 sectionWithRows:v150 title:@"Video"];

  v441 = (void *)MEMORY[0x1E4F94160];
  v151 = (void *)MEMORY[0x1E4F941F0];
  v432 = NSStringFromSelector(sel_livePhotoSRLCompensationEnabled);
  v422 = [v151 rowWithTitle:@"SRL Compensation" valueKeyPath:v432];
  v509[0] = v422;
  v152 = (void *)MEMORY[0x1E4F941F0];
  v403 = NSStringFromSelector(sel_livePhotoSRLCompensationManualMode);
  v394 = [v152 rowWithTitle:@"SRL Manual Mode" valueKeyPath:v403];
  v386 = [v394 conditionFormat:@"livePhotoSRLCompensationEnabled == 1"];
  v509[1] = v386;
  v153 = (void *)MEMORY[0x1E4F941D8];
  v378 = NSStringFromSelector(sel_livePhotoSRLCompensationManualValue);
  v369 = [v153 rowWithTitle:@"Manual Value" valueKeyPath:v378];
  v361 = [v369 minValue:0.0 maxValue:1.0];
  v353 = [v361 conditionFormat:@"livePhotoSRLCompensationEnabled == 1 && livePhotoSRLCompensationManualMode == 1"];
  v509[2] = v353;
  v154 = (void *)MEMORY[0x1E4F94108];
  v346 = NSStringFromSelector(sel_livePhotoSRLCompensationFilterName);
  v339 = [v154 rowWithTitle:@"Filter Type" valueKeyPath:v346];
  v332 = [v339 possibleValues:&unk_1F078B108 titles:&unk_1F078B120];
  v325 = [v332 conditionFormat:@"livePhotoSRLCompensationEnabled == 1"];
  v509[3] = v325;
  v320 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Vitality Max Inset" valueKeyPath:@"vitalityMaxAllowedInsetPoints"];
  v315 = [v320 minValue:0.0 maxValue:40.0];
  v509[4] = v315;
  v310 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Vitality Max Large Inset" valueKeyPath:@"vitalityMaxAllowedLargeInsetPoints"];
  v307 = [v310 minValue:0.0 maxValue:120.0];
  v509[5] = v307;
  v304 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Transform Limiting" valueKeyPath:@"vitalityUseInsetLimiting"];
  v509[6] = v304;
  v301 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Vitality Edge Blur" valueKeyPath:@"vitalityMaskBlur"];
  v298 = [v301 minValue:0.0 maxValue:20.0];
  v509[7] = v298;
  v294 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Vitality Feather Scale" valueKeyPath:@"vitalityFeatherScale"];
  v291 = [v294 minValue:0.0 maxValue:0.05];
  v509[8] = v291;
  v288 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Interaction Threshold" valueKeyPath:@"livePhotoInteractionThreshold"];
  v285 = [v288 minValue:0.0 maxValue:1.0];
  v509[9] = v285;
  v282 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Transform During Vitality" valueKeyPath:@"applyPerspectiveTransformDuringVitality"];
  v509[10] = v282;
  v280 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Lock Scroll During Playback" valueKeyPath:@"lockScrollDuringLivePhotoPlayback"];
  v509[11] = v280;
  v155 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Scrubber on Play" valueKeyPath:@"livePhotoScrubberShowForPlayback"];
  v509[12] = v155;
  v156 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Merge Overlapping Captures" valueKeyPath:@"shouldMergeOverlappingLivePhotos"];
  v509[13] = v156;
  v157 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Minimum Overlap" valueKeyPath:@"livePhotoMinimumOverlappingDuration"];
  v158 = [v157 minValue:-120.0 maxValue:0.0];
  v159 = [v158 conditionFormat:@"shouldMergeOverlappingLivePhotos == YES"];
  v509[14] = v159;
  v160 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Overlapping Live Photos Count Limit" valueKeyPath:@"overlappingLivePhotosCountLimit"];
  v161 = [v160 minValue:2.0 maxValue:100.0];
  v162 = [v161 conditionFormat:@"shouldMergeOverlappingLivePhotos == YES"];
  v509[15] = v162;
  v163 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Reframed Badge" valueKeyPath:@"showReframedBadge"];
  v509[16] = v163;
  v164 = [MEMORY[0x1E4F1C978] arrayWithObjects:v509 count:17];
  v442 = [v441 sectionWithRows:v164 title:@"Live Photo"];

  v433 = (void *)MEMORY[0x1E4F94160];
  v423 = [MEMORY[0x1E4F941D8] rowWithTitle:@"View Model Cache Count Limit" valueKeyPath:@"viewModelCacheCountLimit"];
  v404 = [v423 minValue:0.0 maxValue:2000.0];
  v395 = objc_msgSend(v404, "pu_increment:", 50.0);
  v508[0] = v395;
  v387 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Entering Quick Paging Regime Duration" valueKeyPath:@"visibilityDurationForEnteringQuickPagingRegime"];
  v379 = [v387 minValue:0.0 maxValue:2.0];
  v370 = objc_msgSend(v379, "pu_increment:", 0.00999999978);
  v508[1] = v370;
  v362 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Exiting Quick Paging Regime Duration" valueKeyPath:@"visibilityDurationForExitingQuickPagingRegime"];
  v354 = [v362 minValue:0.0 maxValue:2.0];
  v347 = objc_msgSend(v354, "pu_increment:", 0.00999999978);
  v508[2] = v347;
  v340 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Scrub Distance For Quick Paging Regime" valueKeyPath:@"minNavigationDistanceForQuickPagingRegime"];
  v333 = [v340 minValue:0.0 maxValue:100.0];
  v326 = objc_msgSend(v333, "pu_increment:", 1.0);
  v508[3] = v326;
  v165 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Entering Fast Regime Duration" valueKeyPath:@"visibilityDurationForEnteringFastRegime"];
  v166 = [v165 minValue:0.0 maxValue:0.300000012];
  v167 = objc_msgSend(v166, "pu_increment:", 0.00999999978);
  v508[4] = v167;
  v168 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Exiting Fast Regime Duration" valueKeyPath:@"visibilityDurationForExitingFastRegime"];
  v169 = [v168 minValue:0.0 maxValue:0.300000012];
  v170 = objc_msgSend(v169, "pu_increment:", 0.00999999978);
  v508[5] = v170;
  v171 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Scrub Distance For Fast Regime" valueKeyPath:@"minNavigationDistanceForFastRegime"];
  v172 = [v171 minValue:0.0 maxValue:100.0];
  v173 = objc_msgSend(v172, "pu_increment:", 1.0);
  v508[6] = v173;
  v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v508 count:7];
  v434 = [v433 sectionWithRows:v174 title:@"Performance"];

  v424 = (void *)MEMORY[0x1E4F94160];
  v405 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Duration" valueKeyPath:@"bounceDuration"];
  v396 = [v405 minValue:0.0 maxValue:1.0];
  v388 = objc_msgSend(v396, "pu_increment:", 0.100000001);
  v507[0] = v388;
  v175 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Delay" valueKeyPath:@"bounceDelay"];
  v176 = [v175 minValue:0.0 maxValue:0.5];
  v177 = objc_msgSend(v176, "pu_increment:", 0.100000001);
  v507[1] = v177;
  v178 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Spring Damping" valueKeyPath:@"bounceSpringDamping"];
  v179 = [v178 minValue:0.0 maxValue:1.0];
  v180 = objc_msgSend(v179, "pu_increment:", 0.100000001);
  v507[2] = v180;
  v181 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Initial Velocity" valueKeyPath:@"bounceInitialVelocity"];
  v182 = [v181 minValue:0.0 maxValue:500.0];
  v183 = objc_msgSend(v182, "pu_increment:", 50.0);
  v507[3] = v183;
  v184 = [MEMORY[0x1E4F1C978] arrayWithObjects:v507 count:4];
  v425 = [v424 sectionWithRows:v184 title:@"Orb Bounce"];

  v406 = (void *)MEMORY[0x1E4F94160];
  v397 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow GIF playback" valueKeyPath:@"allowGIFPlayback"];
  v506[0] = v397;
  v389 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Loading Delays" valueKeyPath:@"showGIFLoadingDelays"];
  v380 = [v389 conditionFormat:@"allowGIFPlayback != 0"];
  v506[1] = v380;
  v371 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Enter Threshold" valueKeyPath:@"playGIFEnterThreshold"];
  v363 = [v371 minValue:0.0 maxValue:1.0];
  v355 = objc_msgSend(v363, "pu_increment:", 0.0500000007);
  v185 = [v355 conditionFormat:@"allowGIFPlayback != 0"];
  v506[2] = v185;
  v186 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Settle Threshold" valueKeyPath:@"playGIFSettledThreshold"];
  v187 = [v186 minValue:0.0 maxValue:1.0];
  v188 = objc_msgSend(v187, "pu_increment:", 0.0500000007);
  v189 = [v188 conditionFormat:@"allowGIFPlayback != 0"];
  v506[3] = v189;
  v190 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Leaving Threshold" valueKeyPath:@"playGIFMoveOutThreshold"];
  v191 = [v190 minValue:0.0 maxValue:1.0];
  v192 = objc_msgSend(v191, "pu_increment:", 0.0500000007);
  v193 = [v192 conditionFormat:@"allowGIFPlayback != 0"];
  v506[4] = v193;
  v194 = [MEMORY[0x1E4F1C978] arrayWithObjects:v506 count:5];
  v407 = [v406 sectionWithRows:v194 title:@"GIF Playback"];

  v195 = (void *)MEMORY[0x1E4F28F60];
  v196 = NSStringFromSelector(sel_simulateAssetContentLoading);
  uint64_t v197 = [v195 predicateWithFormat:@"%@ != 0", v196];

  v198 = (void *)MEMORY[0x1E4F28F60];
  v199 = NSStringFromSelector(sel_simulateAssetContentLoading);
  v200 = NSStringFromSelector(sel_simulateLoadingError);
  uint64_t v201 = [v198 predicateWithFormat:@"%@ != 0 AND %@ != 0", v199, v200];

  v381 = (void *)MEMORY[0x1E4F94160];
  v202 = (void *)MEMORY[0x1E4F941F0];
  v372 = NSStringFromSelector(sel_simulateAssetContentLoading);
  v364 = [v202 rowWithTitle:@"Simulate Content Loading" valueKeyPath:v372];
  v505[0] = v364;
  v203 = (void *)MEMORY[0x1E4F941D8];
  v356 = NSStringFromSelector(sel_simulatedAssetContentLoadingDuration);
  v348 = [v203 rowWithTitle:@"Loading Speed" valueKeyPath:v356];
  v341 = [v348 minValue:0.0 maxValue:10.0];
  v334 = objc_msgSend(v341, "pu_increment:", 0.5);
  v327 = [v334 condition:v197];
  v505[1] = v327;
  v204 = (void *)MEMORY[0x1E4F941F0];
  v205 = NSStringFromSelector(sel_simulateLoadingError);
  v206 = [v204 rowWithTitle:@"Simulate Loading Error" valueKeyPath:v205];
  v398 = (void *)v197;
  v207 = [v206 condition:v197];
  v505[2] = v207;
  v208 = (void *)MEMORY[0x1E4F94108];
  v209 = NSStringFromSelector(sel_simulatedLoadingErrorType);
  v210 = [v208 rowWithTitle:@"Simulated Error" valueKeyPath:v209];
  v211 = [v210 possibleValues:&unk_1F078B138 titles:&unk_1F078B150];
  v390 = (void *)v201;
  v212 = [v211 condition:v201];
  v505[3] = v212;
  v213 = (void *)MEMORY[0x1E4F941F0];
  v214 = NSStringFromSelector(sel_showFileRadarButtonForOneUpErrorPresentationsOnInternalInstalls);
  v215 = [v213 rowWithTitle:@"Show File Radar Button (Internal Only)" valueKeyPath:v214];
  v505[4] = v215;
  v216 = [MEMORY[0x1E4F1C978] arrayWithObjects:v505 count:5];
  v382 = [v381 sectionWithRows:v216 title:@"Loading & Playback Errors"];

  v373 = (void *)MEMORY[0x1E4F94160];
  v217 = (void *)MEMORY[0x1E4F941F0];
  v365 = NSStringFromSelector(sel_quickCropEnabled);
  v357 = [v217 rowWithTitle:@"Enabled" valueKeyPath:v365];
  v504[0] = v357;
  v218 = (void *)MEMORY[0x1E4F941D8];
  v349 = NSStringFromSelector(sel_quickCropInvisibilityTimer);
  v342 = [v218 rowWithTitle:@"Hide Timer" valueKeyPath:v349];
  v335 = [v342 minValue:0.0 maxValue:10.0];
  v504[1] = v335;
  v219 = (void *)MEMORY[0x1E4F941D8];
  v328 = NSStringFromSelector(sel_quickCropFadeIn);
  v321 = [v219 rowWithTitle:@"Fade In" valueKeyPath:v328];
  v316 = [v321 minValue:0.0 maxValue:2.0];
  v504[2] = v316;
  v220 = (void *)MEMORY[0x1E4F941D8];
  v311 = NSStringFromSelector(sel_quickCropFadeOut);
  v221 = [v220 rowWithTitle:@"Fade Out" valueKeyPath:v311];
  v222 = [v221 minValue:0.0 maxValue:2.0];
  v504[3] = v222;
  v223 = (void *)MEMORY[0x1E4F941D8];
  v224 = NSStringFromSelector(sel_quickCropBackgroundBrightness);
  v225 = [v223 rowWithTitle:@"BG Brightness" valueKeyPath:v224];
  v226 = [v225 minValue:-0.5 maxValue:0.0];
  v504[4] = v226;
  v227 = (void *)MEMORY[0x1E4F941F0];
  v228 = NSStringFromSelector(sel_quickCropHideOtherToolsInEdit);
  v229 = [v227 rowWithTitle:@"Hide Other Edit Tools" valueKeyPath:v228];
  v504[5] = v229;
  v230 = (void *)MEMORY[0x1E4F941F0];
  v231 = NSStringFromSelector(sel_quickCropUseSymbol);
  v232 = [v230 rowWithTitle:@"Use Symbol" valueKeyPath:v231];
  v504[6] = v232;
  v233 = [MEMORY[0x1E4F1C978] arrayWithObjects:v504 count:7];
  v374 = [v373 sectionWithRows:v233 title:@"Quick Crop"];

  v234 = (void *)MEMORY[0x1E4F28F60];
  v235 = NSStringFromSelector(sel_alwaysShowRenderIndicator);
  uint64_t v236 = [v234 predicateWithFormat:@"%@ != 0", v235];

  v295 = (void *)MEMORY[0x1E4F94160];
  v237 = (void *)MEMORY[0x1E4F941F0];
  v358 = NSStringFromSelector(sel_useDebuggingColors);
  v350 = [v237 rowWithTitle:@"Debugging Colors" valueKeyPath:v358];
  v503[0] = v350;
  v238 = (void *)MEMORY[0x1E4F94108];
  v343 = NSStringFromSelector(sel_debuggingTitleType);
  v336 = [v238 rowWithTitle:@"Debugging Title" valueKeyPath:v343];
  v329 = [v336 possibleValues:&unk_1F078B198 titles:&unk_1F078B1B0];
  v503[1] = v329;
  v239 = (void *)MEMORY[0x1E4F94108];
  v322 = NSStringFromSelector(sel_debuggingBadges);
  v317 = [v239 rowWithTitle:@"Debugging Badge" valueKeyPath:v322];
  v312 = [v317 possibleValues:&unk_1F078B168 titles:&unk_1F078B180];
  v308 = [v312 conditionFormat:@"allowBadges != 0"];
  v503[2] = v308;
  v240 = (void *)MEMORY[0x1E4F94108];
  v305 = NSStringFromSelector(sel_debuggingBadgesWhenFavorite);
  v302 = [v240 rowWithTitle:@"Debugging Badge (Favorite)" valueKeyPath:v305];
  v299 = [v302 possibleValues:&unk_1F078B168 titles:&unk_1F078B180];
  v292 = [v299 conditionFormat:@"allowBadges != 0"];
  v503[3] = v292;
  v241 = (void *)MEMORY[0x1E4F941F0];
  v289 = NSStringFromSelector(sel_useDebuggingProgressLabel);
  v286 = [v241 rowWithTitle:@"Progress Label" valueKeyPath:v289];
  v503[4] = v286;
  v242 = (void *)MEMORY[0x1E4F941F0];
  v283 = NSStringFromSelector(sel_showBufferingIndicatorDuringPlay);
  v281 = [v242 rowWithTitle:@"Buffering Indicator During Play" valueKeyPath:v283];
  v503[5] = v281;
  v243 = (void *)MEMORY[0x1E4F941F0];
  v279 = NSStringFromSelector(sel_showLoadingIndicatorDuringDownload);
  v278 = [v243 rowWithTitle:@"Loading Indicator During Download" valueKeyPath:v279];
  v503[6] = v278;
  v244 = (void *)MEMORY[0x1E4F941F0];
  v277 = NSStringFromSelector(sel_alwaysShowRenderIndicator);
  v276 = [v244 rowWithTitle:@"Always Show Render Indicator" valueKeyPath:v277];
  v503[7] = v276;
  v245 = (void *)MEMORY[0x1E4F941D8];
  v275 = NSStringFromSelector(sel_simulatedRenderProgress);
  v274 = [v245 rowWithTitle:@"Fake Render Progress" valueKeyPath:v275];
  v273 = [v274 minValue:0.0 maxValue:1.0];
  v272 = objc_msgSend(v273, "pu_increment:", 1.0);
  v366 = (void *)v236;
  v271 = [v272 condition:v236];
  v503[8] = v271;
  v246 = (void *)MEMORY[0x1E4F941F0];
  v270 = NSStringFromSelector(sel_alwaysShowAirPlayButton);
  v247 = [v246 rowWithTitle:@"Always Show AirPlay Button" valueKeyPath:v270];
  v503[9] = v247;
  v248 = (void *)MEMORY[0x1E4F941D8];
  v249 = NSStringFromSelector(sel_finalFadeOutDuration);
  v250 = [v248 rowWithTitle:@"Final Fade Out Duration" valueKeyPath:v249];
  v251 = [v250 minValue:0.0 maxValue:2.0];
  v252 = objc_msgSend(v251, "pu_increment:", 0.1);
  v503[10] = v252;
  v253 = (void *)MEMORY[0x1E4F941D8];
  v254 = NSStringFromSelector(sel_minimumDurationForIncrementingViewCount);
  v255 = [v253 rowWithTitle:@"Increment View Count Delay" valueKeyPath:v254];
  v256 = [v255 minValue:0.0 maxValue:5.0];
  v257 = objc_msgSend(v256, "pu_increment:", 0.1);
  v503[11] = v257;
  v258 = [MEMORY[0x1E4F1C978] arrayWithObjects:v503 count:12];
  v296 = [v295 sectionWithRows:v258 title:@"Debugging"];

  v259 = (void *)MEMORY[0x1E4F94160];
  v260 = (void *)MEMORY[0x1E4F940F8];
  v261 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v262 = [v260 rowWithTitle:@"Restore Defaults" action:v261];
  v502 = v262;
  v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v502 count:1];
  v264 = [v259 sectionWithRows:v263];

  id v265 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v501[0] = v500;
  v501[1] = v498;
  v501[2] = v495;
  v501[3] = v490;
  v501[4] = v477;
  v501[5] = v484;
  v501[6] = v412;
  v501[7] = v470;
  v501[8] = v463;
  v501[9] = v456;
  v501[10] = v449;
  v501[11] = v442;
  v501[12] = v434;
  v501[13] = v425;
  v501[14] = v407;
  v501[15] = v382;
  v501[16] = v374;
  v501[17] = v296;
  v501[18] = v264;
  v266 = [MEMORY[0x1E4F1C978] arrayWithObjects:v501 count:19];
  v267 = (void *)[v265 initWithArray:v266];

  if (v416) {
    [v267 insertObject:v414 atIndex:2];
  }
  v268 = [MEMORY[0x1E4F94160] moduleWithTitle:@"One Up" contents:v267];

  return v268;
}

void __43__PUOneUpSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  int v3 = (void *)getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass;
  uint64_t v11 = getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass;
  if (!getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_block_invoke;
    v7[3] = &unk_1E5F2E228;
    v7[4] = &v8;
    __getPUTesterOneUpInitialZoomScalesReviewViewControllerClass_block_invoke((uint64_t)v7);
    int v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  id v6 = objc_alloc_init((Class)v4);
  uint64_t v5 = [v2 navigationController];

  [v5 pushViewController:v6 animated:1];
}

id __43__PUOneUpSettings_settingsControllerModule__block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getPUTesterSampleAccessoryViewSettingsClass_softClass;
  uint64_t v8 = getPUTesterSampleAccessoryViewSettingsClass_softClass;
  if (!getPUTesterSampleAccessoryViewSettingsClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getPUTesterSampleAccessoryViewSettingsClass_block_invoke;
    v4[3] = &unk_1E5F2E228;
    v4[4] = &v5;
    __getPUTesterSampleAccessoryViewSettingsClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = [v1 sharedInstance];
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_48976 != -1) {
    dispatch_once(&sharedInstance_onceToken_48976, &__block_literal_global_48977);
  }
  id v2 = (void *)sharedInstance_sharedInstance_48978;
  return v2;
}

void __33__PUOneUpSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 oneUpSettings];
  id v1 = (void *)sharedInstance_sharedInstance_48978;
  sharedInstance_sharedInstance_48978 = v0;
}

@end