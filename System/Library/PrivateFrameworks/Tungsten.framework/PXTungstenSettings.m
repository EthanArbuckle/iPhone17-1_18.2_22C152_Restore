@interface PXTungstenSettings
+ (id)sharedInstance;
- (BOOL)allowBlockingDueToFences;
- (BOOL)allowBlockingDuringScrolling;
- (BOOL)allowsViewControllerTransitions;
- (BOOL)anySpritesRectDiagnosticsEnabled;
- (BOOL)colorCachedThumbnails;
- (BOOL)colorCopiedImages;
- (BOOL)debugColorTransform;
- (BOOL)debugExtendedColorRange;
- (BOOL)debugMipmaps;
- (BOOL)debugOpaque;
- (BOOL)debugResolution;
- (BOOL)debugSharedTextures;
- (BOOL)disableLowResThumbnails;
- (BOOL)enableAnchoringRectDiagnostics;
- (BOOL)enableAssetsRectDiagnostics;
- (BOOL)enableColorMatching;
- (BOOL)enableCurrentFocusRectDiagnostics;
- (BOOL)enableFocusRectDiagnostics;
- (BOOL)enableFrameDebuggerCapture;
- (BOOL)enableLayoutDanglingUpdatesAssertions;
- (BOOL)enableMetalRenderer;
- (BOOL)enableMipmaps;
- (BOOL)enableRectDiagnosticsForDecorationSprites;
- (BOOL)enableRectDiagnosticsForDisplayAssetSprites;
- (BOOL)enableRectDiagnosticsForGradientSprites;
- (BOOL)enableRectDiagnosticsForNamedImageSprites;
- (BOOL)enableRectDiagnosticsForPathSprites;
- (BOOL)enableRectDiagnosticsForPixelBufferSprites;
- (BOOL)enableRectDiagnosticsForShadowSprites;
- (BOOL)enableRectDiagnosticsForSolidColorSprites;
- (BOOL)enableRectDiagnosticsForTextSprites;
- (BOOL)enableRectDiagnosticsForTitleSubtitleSprites;
- (BOOL)enableRectDiagnosticsForUndefinedSprites;
- (BOOL)enableRectDiagnosticsForViewSprites;
- (BOOL)enableRenderTextureCache;
- (BOOL)enableRoundedCorners;
- (BOOL)enableSublayoutUpdateCycleAssertions;
- (BOOL)enableTungstenFocusEnvironmentSupport;
- (BOOL)enableTungstenKeyboardNavigation;
- (BOOL)enableViewRenderer;
- (BOOL)enableXcodeCustomDebugHierarchy;
- (BOOL)hideDetailContentDuringTransition;
- (BOOL)hideSummaryContentDuringTransition;
- (BOOL)inLowMemoryModePreferMasterThumb;
- (BOOL)includeLayoutsLocalSpritesInDebugHierarchy;
- (BOOL)loadThumbnailsAsync;
- (BOOL)lowLatency;
- (BOOL)lowMemoryMode;
- (BOOL)requestMasterThumbsOnly;
- (BOOL)requestThumbnailsOnly;
- (BOOL)shouldDeactivateTextureManagerWhenNotVisible;
- (BOOL)shouldShowBoundariesOfTextTextures;
- (BOOL)simulateMissingMetalDevice;
- (BOOL)simulateSomeAssetsInCloud;
- (BOOL)sortSpritesInXcodeCustomDebugHierarchy;
- (BOOL)wantsOrthogonalProjection;
- (BOOL)wantsPerspectiveDebug;
- (BOOL)wantsRectDiagnosticsDebugHUD;
- (BOOL)wantsStatsDebugHUD;
- (PXTungstenSettings)init;
- (double)blockingWhileInitialLoadTimeout;
- (double)blockingWhileScrollingTimeout;
- (double)blockingWhileScrubbingTimeout;
- (double)cameraZoomFactor;
- (double)fullPageSnapshotTileDelay;
- (double)inactivityTimeout;
- (double)keyboardAnimationDuration;
- (double)keyboardDampingRatio;
- (double)keyboardUnselectedDimmingFactor;
- (double)livePhotoInitialCrossfadeDuration;
- (double)maxCornerRadius;
- (double)offscreenTextureMaximumLifeTime;
- (double)opportunisticPreheatRequiredIdleTime;
- (double)perspectiveAngle;
- (double)renderTextureCacheAgeLimit;
- (double)slowAnimationsSpeed;
- (double)slowLayoutUpdateThreshold;
- (double)textLegibilityDimmingStrength;
- (double)viewControllerTransitionDuration;
- (int64_t)blockOnMissingThumbnailsAtSpeedRegime;
- (int64_t)fullPageSnapshotMaximumNumberOfTiles;
- (int64_t)lowSpecProcessorCountLimit;
- (int64_t)sampleCount;
- (int64_t)thumbnailCacheSize;
- (int64_t)videoAllowedAtOrBelowSpeed;
- (int64_t)videoAllowedAtOrBelowSpeedForLowSpec;
- (unint64_t)renderTextureCacheCapacity;
- (unint64_t)renderTextureCacheSizeLimitMB;
- (unint64_t)textLegibilityDimmingType;
- (void)setAllowBlockingDueToFences:(BOOL)a3;
- (void)setAllowBlockingDuringScrolling:(BOOL)a3;
- (void)setAllowsViewControllerTransitions:(BOOL)a3;
- (void)setBlockOnMissingThumbnailsAtSpeedRegime:(int64_t)a3;
- (void)setBlockingWhileInitialLoadTimeout:(double)a3;
- (void)setBlockingWhileScrollingTimeout:(double)a3;
- (void)setBlockingWhileScrubbingTimeout:(double)a3;
- (void)setCameraZoomFactor:(double)a3;
- (void)setColorCachedThumbnails:(BOOL)a3;
- (void)setColorCopiedImages:(BOOL)a3;
- (void)setDebugColorTransform:(BOOL)a3;
- (void)setDebugExtendedColorRange:(BOOL)a3;
- (void)setDebugMipmaps:(BOOL)a3;
- (void)setDebugOpaque:(BOOL)a3;
- (void)setDebugResolution:(BOOL)a3;
- (void)setDebugSharedTextures:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDisableLowResThumbnails:(BOOL)a3;
- (void)setEnableAnchoringRectDiagnostics:(BOOL)a3;
- (void)setEnableAssetsRectDiagnostics:(BOOL)a3;
- (void)setEnableColorMatching:(BOOL)a3;
- (void)setEnableCurrentFocusRectDiagnostics:(BOOL)a3;
- (void)setEnableFocusRectDiagnostics:(BOOL)a3;
- (void)setEnableFrameDebuggerCapture:(BOOL)a3;
- (void)setEnableLayoutDanglingUpdatesAssertions:(BOOL)a3;
- (void)setEnableMetalRenderer:(BOOL)a3;
- (void)setEnableMipmaps:(BOOL)a3;
- (void)setEnableRectDiagnosticsForDecorationSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForDisplayAssetSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForGradientSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForNamedImageSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForPathSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForPixelBufferSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForShadowSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForSolidColorSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForTextSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForTitleSubtitleSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForUndefinedSprites:(BOOL)a3;
- (void)setEnableRectDiagnosticsForViewSprites:(BOOL)a3;
- (void)setEnableRenderTextureCache:(BOOL)a3;
- (void)setEnableRoundedCorners:(BOOL)a3;
- (void)setEnableSublayoutUpdateCycleAssertions:(BOOL)a3;
- (void)setEnableTungstenFocusEnvironmentSupport:(BOOL)a3;
- (void)setEnableTungstenKeyboardNavigation:(BOOL)a3;
- (void)setEnableViewRenderer:(BOOL)a3;
- (void)setEnableXcodeCustomDebugHierarchy:(BOOL)a3;
- (void)setFullPageSnapshotMaximumNumberOfTiles:(int64_t)a3;
- (void)setFullPageSnapshotTileDelay:(double)a3;
- (void)setHideDetailContentDuringTransition:(BOOL)a3;
- (void)setHideSummaryContentDuringTransition:(BOOL)a3;
- (void)setInLowMemoryModePreferMasterThumb:(BOOL)a3;
- (void)setInactivityTimeout:(double)a3;
- (void)setIncludeLayoutsLocalSpritesInDebugHierarchy:(BOOL)a3;
- (void)setKeyboardAnimationDuration:(double)a3;
- (void)setKeyboardDampingRatio:(double)a3;
- (void)setKeyboardUnselectedDimmingFactor:(double)a3;
- (void)setLivePhotoInitialCrossfadeDuration:(double)a3;
- (void)setLoadThumbnailsAsync:(BOOL)a3;
- (void)setLowLatency:(BOOL)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setLowSpecProcessorCountLimit:(int64_t)a3;
- (void)setMaxCornerRadius:(double)a3;
- (void)setOffscreenTextureMaximumLifeTime:(double)a3;
- (void)setOpportunisticPreheatRequiredIdleTime:(double)a3;
- (void)setPerspectiveAngle:(double)a3;
- (void)setRenderTextureCacheAgeLimit:(double)a3;
- (void)setRenderTextureCacheCapacity:(unint64_t)a3;
- (void)setRenderTextureCacheSizeLimitMB:(unint64_t)a3;
- (void)setRequestMasterThumbsOnly:(BOOL)a3;
- (void)setRequestThumbnailsOnly:(BOOL)a3;
- (void)setSampleCount:(int64_t)a3;
- (void)setShouldDeactivateTextureManagerWhenNotVisible:(BOOL)a3;
- (void)setShouldShowBoundariesOfTextTextures:(BOOL)a3;
- (void)setSimulateMissingMetalDevice:(BOOL)a3;
- (void)setSimulateSomeAssetsInCloud:(BOOL)a3;
- (void)setSlowAnimationsSpeed:(double)a3;
- (void)setSlowLayoutUpdateThreshold:(double)a3;
- (void)setSortSpritesInXcodeCustomDebugHierarchy:(BOOL)a3;
- (void)setTextLegibilityDimmingStrength:(double)a3;
- (void)setTextLegibilityDimmingType:(unint64_t)a3;
- (void)setThumbnailCacheSize:(int64_t)a3;
- (void)setVideoAllowedAtOrBelowSpeed:(int64_t)a3;
- (void)setVideoAllowedAtOrBelowSpeedForLowSpec:(int64_t)a3;
- (void)setViewControllerTransitionDuration:(double)a3;
- (void)setWantsOrthogonalProjection:(BOOL)a3;
- (void)setWantsPerspectiveDebug:(BOOL)a3;
- (void)setWantsRectDiagnosticsDebugHUD:(BOOL)a3;
- (void)setWantsStatsDebugHUD:(BOOL)a3;
@end

@implementation PXTungstenSettings

- (BOOL)enableRoundedCorners
{
  return self->_enableRoundedCorners;
}

- (BOOL)enableColorMatching
{
  return self->_enableColorMatching;
}

- (BOOL)debugResolution
{
  return self->_debugResolution;
}

- (BOOL)debugOpaque
{
  return self->_debugOpaque;
}

- (BOOL)debugMipmaps
{
  return self->_debugMipmaps;
}

- (BOOL)debugExtendedColorRange
{
  return self->_debugExtendedColorRange;
}

- (BOOL)debugColorTransform
{
  return self->_debugColorTransform;
}

- (BOOL)debugSharedTextures
{
  return self->_debugSharedTextures;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_669);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

- (BOOL)simulateSomeAssetsInCloud
{
  return self->_simulateSomeAssetsInCloud;
}

- (BOOL)requestMasterThumbsOnly
{
  return self->_requestMasterThumbsOnly;
}

- (BOOL)requestThumbnailsOnly
{
  return self->_requestThumbnailsOnly;
}

- (BOOL)wantsPerspectiveDebug
{
  return self->_wantsPerspectiveDebug;
}

- (BOOL)wantsOrthogonalProjection
{
  return self->_wantsOrthogonalProjection;
}

- (double)cameraZoomFactor
{
  return self->_cameraZoomFactor;
}

- (BOOL)enableSublayoutUpdateCycleAssertions
{
  return self->_enableSublayoutUpdateCycleAssertions;
}

- (BOOL)enableTungstenKeyboardNavigation
{
  return self->_enableTungstenKeyboardNavigation;
}

- (BOOL)wantsRectDiagnosticsDebugHUD
{
  return self->_wantsRectDiagnosticsDebugHUD;
}

- (double)offscreenTextureMaximumLifeTime
{
  return self->_offscreenTextureMaximumLifeTime;
}

- (BOOL)enableViewRenderer
{
  return self->_enableViewRenderer;
}

- (BOOL)enableMetalRenderer
{
  return self->_enableMetalRenderer;
}

- (int64_t)blockOnMissingThumbnailsAtSpeedRegime
{
  return self->_blockOnMissingThumbnailsAtSpeedRegime;
}

- (BOOL)allowBlockingDuringScrolling
{
  return self->_allowBlockingDuringScrolling;
}

- (BOOL)allowBlockingDueToFences
{
  return self->_allowBlockingDueToFences;
}

- (double)blockingWhileScrollingTimeout
{
  return self->_blockingWhileScrollingTimeout;
}

- (BOOL)disableLowResThumbnails
{
  return self->_disableLowResThumbnails;
}

- (int64_t)thumbnailCacheSize
{
  return self->_thumbnailCacheSize;
}

- (int64_t)videoAllowedAtOrBelowSpeed
{
  return self->_videoAllowedAtOrBelowSpeed;
}

- (BOOL)shouldShowBoundariesOfTextTextures
{
  return self->_shouldShowBoundariesOfTextTextures;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (BOOL)enableMipmaps
{
  return self->_enableMipmaps;
}

- (BOOL)wantsStatsDebugHUD
{
  return self->_wantsStatsDebugHUD;
}

- (double)slowLayoutUpdateThreshold
{
  return self->_slowLayoutUpdateThreshold;
}

- (BOOL)simulateMissingMetalDevice
{
  return self->_simulateMissingMetalDevice;
}

- (int64_t)lowSpecProcessorCountLimit
{
  return self->_lowSpecProcessorCountLimit;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)lowLatency
{
  return self->_lowLatency;
}

- (BOOL)loadThumbnailsAsync
{
  return self->_loadThumbnailsAsync;
}

uint64_t __36__PXTungstenSettings_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(PXTungstenSettings);

  return MEMORY[0x270F9A758]();
}

- (PXTungstenSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXTungstenSettings;
  v2 = [(PXTungstenSettings *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PXTungstenSettings *)v2 setDefaultValues];
  }
  return v3;
}

- (void)setKeyboardDampingRatio:(double)a3
{
  self->_keyboardDampingRatio = a3;
}

- (void)setDefaultValues
{
  [(PXTungstenSettings *)self setEnableXcodeCustomDebugHierarchy:0];
  [(PXTungstenSettings *)self setSortSpritesInXcodeCustomDebugHierarchy:1];
  [(PXTungstenSettings *)self setIncludeLayoutsLocalSpritesInDebugHierarchy:0];
  [(PXTungstenSettings *)self setSimulateMissingMetalDevice:0];
  [(PXTungstenSettings *)self setEnableMetalRenderer:1];
  [(PXTungstenSettings *)self setEnableViewRenderer:1];
  [(PXTungstenSettings *)self setDebugExtendedColorRange:0];
  [(PXTungstenSettings *)self setDebugOpaque:0];
  [(PXTungstenSettings *)self setDebugResolution:0];
  [(PXTungstenSettings *)self setDebugColorTransform:0];
  [(PXTungstenSettings *)self setDebugSharedTextures:0];
  [(PXTungstenSettings *)self setDebugMipmaps:0];
  [(PXTungstenSettings *)self setColorCachedThumbnails:0];
  [(PXTungstenSettings *)self setRequestThumbnailsOnly:0];
  [(PXTungstenSettings *)self setRequestMasterThumbsOnly:0];
  [(PXTungstenSettings *)self setSimulateSomeAssetsInCloud:0];
  [(PXTungstenSettings *)self setDisableLowResThumbnails:0];
  [(PXTungstenSettings *)self setThumbnailCacheSize:0];
  [(PXTungstenSettings *)self setLoadThumbnailsAsync:0];
  [(PXTungstenSettings *)self setOpportunisticPreheatRequiredIdleTime:0.25];
  [(PXTungstenSettings *)self setColorCopiedImages:0];
  [(PXTungstenSettings *)self setLowLatency:0];
  [(PXTungstenSettings *)self setLowMemoryMode:0];
  [(PXTungstenSettings *)self setInLowMemoryModePreferMasterThumb:1];
  [(PXTungstenSettings *)self setInactivityTimeout:0.25];
  [(PXTungstenSettings *)self setSampleCount:1];
  [(PXTungstenSettings *)self setEnableColorMatching:1];
  [(PXTungstenSettings *)self setEnableRoundedCorners:1];
  [(PXTungstenSettings *)self setEnableMipmaps:0];
  [(PXTungstenSettings *)self setSlowLayoutUpdateThreshold:4.0];
  [(PXTungstenSettings *)self setEnableFrameDebuggerCapture:0];
  [(PXTungstenSettings *)self setAllowBlockingDuringScrolling:1];
  [(PXTungstenSettings *)self setBlockingWhileScrollingTimeout:0.0];
  [(PXTungstenSettings *)self setBlockingWhileScrubbingTimeout:0.0];
  [(PXTungstenSettings *)self setBlockingWhileInitialLoadTimeout:0.0];
  [(PXTungstenSettings *)self setAllowBlockingDueToFences:1];
  [(PXTungstenSettings *)self setBlockOnMissingThumbnailsAtSpeedRegime:3];
  [(PXTungstenSettings *)self setVideoAllowedAtOrBelowSpeed:2];
  [(PXTungstenSettings *)self setVideoAllowedAtOrBelowSpeedForLowSpec:1];
  [(PXTungstenSettings *)self setLowSpecProcessorCountLimit:2];
  [(PXTungstenSettings *)self setSlowAnimationsSpeed:0.200000003];
  [(PXTungstenSettings *)self setTextLegibilityDimmingType:1];
  [(PXTungstenSettings *)self setTextLegibilityDimmingStrength:0.7];
  [(PXTungstenSettings *)self setMaxCornerRadius:20.0];
  [(PXTungstenSettings *)self setCameraZoomFactor:1.0];
  [(PXTungstenSettings *)self setWantsOrthogonalProjection:1];
  [(PXTungstenSettings *)self setWantsStatsDebugHUD:0];
  [(PXTungstenSettings *)self setWantsRectDiagnosticsDebugHUD:0];
  [(PXTungstenSettings *)self setEnableAnchoringRectDiagnostics:0];
  [(PXTungstenSettings *)self setEnableAssetsRectDiagnostics:0];
  [(PXTungstenSettings *)self setEnableFocusRectDiagnostics:0];
  [(PXTungstenSettings *)self setEnableCurrentFocusRectDiagnostics:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForUndefinedSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForNamedImageSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForDisplayAssetSprites:1];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForTextSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForTitleSubtitleSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForSolidColorSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForGradientSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForShadowSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForDecorationSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForViewSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForPathSprites:0];
  [(PXTungstenSettings *)self setEnableRectDiagnosticsForPixelBufferSprites:0];
  [(PXTungstenSettings *)self setWantsPerspectiveDebug:0];
  [(PXTungstenSettings *)self setFullPageSnapshotMaximumNumberOfTiles:0];
  [(PXTungstenSettings *)self setFullPageSnapshotTileDelay:0.3];
  [(PXTungstenSettings *)self setShouldShowBoundariesOfTextTextures:0];
  [(PXTungstenSettings *)self setLivePhotoInitialCrossfadeDuration:0.3];
  [(PXTungstenSettings *)self setEnableLayoutDanglingUpdatesAssertions:1];
  [(PXTungstenSettings *)self setEnableSublayoutUpdateCycleAssertions:1];
  [(PXTungstenSettings *)self setOffscreenTextureMaximumLifeTime:1.0];
  [(PXTungstenSettings *)self setEnableRenderTextureCache:0];
  [(PXTungstenSettings *)self setRenderTextureCacheCapacity:10];
  [(PXTungstenSettings *)self setRenderTextureCacheAgeLimit:0.05];
  [(PXTungstenSettings *)self setRenderTextureCacheSizeLimitMB:250];
  [(PXTungstenSettings *)self setShouldDeactivateTextureManagerWhenNotVisible:1];
  [(PXTungstenSettings *)self setAllowsViewControllerTransitions:1];
  [(PXTungstenSettings *)self setViewControllerTransitionDuration:0.666];
  [(PXTungstenSettings *)self setHideSummaryContentDuringTransition:0];
  [(PXTungstenSettings *)self setHideDetailContentDuringTransition:0];
  [(PXTungstenSettings *)self setEnableTungstenKeyboardNavigation:0];
  [(PXTungstenSettings *)self setEnableTungstenFocusEnvironmentSupport:1];
  [(PXTungstenSettings *)self setKeyboardUnselectedDimmingFactor:0.2];
  [(PXTungstenSettings *)self setKeyboardAnimationDuration:0.25];

  [(PXTungstenSettings *)self setKeyboardDampingRatio:0.7];
}

- (void)setWantsStatsDebugHUD:(BOOL)a3
{
  self->_wantsStatsDebugHUD = a3;
}

- (void)setWantsRectDiagnosticsDebugHUD:(BOOL)a3
{
  self->_wantsRectDiagnosticsDebugHUD = a3;
}

- (void)setWantsPerspectiveDebug:(BOOL)a3
{
  self->_wantsPerspectiveDebug = a3;
}

- (void)setWantsOrthogonalProjection:(BOOL)a3
{
  self->_wantsOrthogonalProjection = a3;
}

- (void)setViewControllerTransitionDuration:(double)a3
{
  self->_viewControllerTransitionDuration = a3;
}

- (void)setVideoAllowedAtOrBelowSpeedForLowSpec:(int64_t)a3
{
  self->_videoAllowedAtOrBelowSpeedForLowSpec = a3;
}

- (void)setVideoAllowedAtOrBelowSpeed:(int64_t)a3
{
  self->_videoAllowedAtOrBelowSpeed = a3;
}

- (void)setThumbnailCacheSize:(int64_t)a3
{
  self->_thumbnailCacheSize = a3;
}

- (void)setTextLegibilityDimmingType:(unint64_t)a3
{
  self->_textLegibilityDimmingType = a3;
}

- (void)setTextLegibilityDimmingStrength:(double)a3
{
  self->_textLegibilityDimmingStrength = a3;
}

- (void)setSortSpritesInXcodeCustomDebugHierarchy:(BOOL)a3
{
  self->_sortSpritesInXcodeCustomDebugHierarchy = a3;
}

- (void)setSlowLayoutUpdateThreshold:(double)a3
{
  self->_slowLayoutUpdateThreshold = a3;
}

- (void)setSlowAnimationsSpeed:(double)a3
{
  self->_slowAnimationsSpeed = a3;
}

- (void)setSimulateSomeAssetsInCloud:(BOOL)a3
{
  self->_simulateSomeAssetsInCloud = a3;
}

- (void)setSimulateMissingMetalDevice:(BOOL)a3
{
  self->_simulateMissingMetalDevice = a3;
}

- (void)setShouldShowBoundariesOfTextTextures:(BOOL)a3
{
  self->_shouldShowBoundariesOfTextTextures = a3;
}

- (void)setShouldDeactivateTextureManagerWhenNotVisible:(BOOL)a3
{
  self->_shouldDeactivateTextureManagerWhenNotVisible = a3;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

- (void)setRequestThumbnailsOnly:(BOOL)a3
{
  self->_requestThumbnailsOnly = a3;
}

- (void)setRequestMasterThumbsOnly:(BOOL)a3
{
  self->_requestMasterThumbsOnly = a3;
}

- (void)setRenderTextureCacheSizeLimitMB:(unint64_t)a3
{
  self->_renderTextureCacheSizeLimitMB = a3;
}

- (void)setRenderTextureCacheCapacity:(unint64_t)a3
{
  self->_renderTextureCacheCapacity = a3;
}

- (void)setRenderTextureCacheAgeLimit:(double)a3
{
  self->_renderTextureCacheAgeLimit = a3;
}

- (void)setOpportunisticPreheatRequiredIdleTime:(double)a3
{
  self->_opportunisticPreheatRequiredIdleTime = a3;
}

- (void)setOffscreenTextureMaximumLifeTime:(double)a3
{
  self->_offscreenTextureMaximumLifeTime = a3;
}

- (void)setMaxCornerRadius:(double)a3
{
  self->_maxCornerRadius = a3;
}

- (void)setLowSpecProcessorCountLimit:(int64_t)a3
{
  self->_lowSpecProcessorCountLimit = a3;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (void)setLowLatency:(BOOL)a3
{
  self->_lowLatency = a3;
}

- (void)setLoadThumbnailsAsync:(BOOL)a3
{
  self->_loadThumbnailsAsync = a3;
}

- (void)setLivePhotoInitialCrossfadeDuration:(double)a3
{
  self->_livePhotoInitialCrossfadeDuration = a3;
}

- (void)setKeyboardUnselectedDimmingFactor:(double)a3
{
  self->_keyboardUnselectedDimmingFactor = a3;
}

- (void)setKeyboardAnimationDuration:(double)a3
{
  self->_keyboardAnimationDuration = a3;
}

- (void)setIncludeLayoutsLocalSpritesInDebugHierarchy:(BOOL)a3
{
  self->_includeLayoutsLocalSpritesInDebugHierarchy = a3;
}

- (void)setInactivityTimeout:(double)a3
{
  self->_inactivityTimeout = a3;
}

- (void)setInLowMemoryModePreferMasterThumb:(BOOL)a3
{
  self->_inLowMemoryModePreferMasterThumb = a3;
}

- (void)setHideSummaryContentDuringTransition:(BOOL)a3
{
  self->_hideSummaryContentDuringTransition = a3;
}

- (void)setHideDetailContentDuringTransition:(BOOL)a3
{
  self->_hideDetailContentDuringTransition = a3;
}

- (void)setFullPageSnapshotTileDelay:(double)a3
{
  self->_fullPageSnapshotTileDelay = a3;
}

- (void)setFullPageSnapshotMaximumNumberOfTiles:(int64_t)a3
{
  self->_fullPageSnapshotMaximumNumberOfTiles = a3;
}

- (void)setEnableXcodeCustomDebugHierarchy:(BOOL)a3
{
  self->_enableXcodeCustomDebugHierarchy = a3;
}

- (void)setEnableViewRenderer:(BOOL)a3
{
  self->_enableViewRenderer = a3;
}

- (void)setEnableTungstenKeyboardNavigation:(BOOL)a3
{
  self->_enableTungstenKeyboardNavigation = a3;
}

- (void)setEnableTungstenFocusEnvironmentSupport:(BOOL)a3
{
  self->_enableTungstenFocusEnvironmentSupport = a3;
}

- (void)setEnableSublayoutUpdateCycleAssertions:(BOOL)a3
{
  self->_enableSublayoutUpdateCycleAssertions = a3;
}

- (void)setEnableRoundedCorners:(BOOL)a3
{
  self->_enableRoundedCorners = a3;
}

- (void)setEnableRenderTextureCache:(BOOL)a3
{
  self->_enableRenderTextureCache = a3;
}

- (void)setEnableRectDiagnosticsForViewSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForViewSprites = a3;
}

- (void)setEnableRectDiagnosticsForUndefinedSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForUndefinedSprites = a3;
}

- (void)setEnableRectDiagnosticsForTitleSubtitleSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForTitleSubtitleSprites = a3;
}

- (void)setEnableRectDiagnosticsForTextSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForTextSprites = a3;
}

- (void)setEnableRectDiagnosticsForSolidColorSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForSolidColorSprites = a3;
}

- (void)setEnableRectDiagnosticsForShadowSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForShadowSprites = a3;
}

- (void)setEnableRectDiagnosticsForPixelBufferSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForPixelBufferSprites = a3;
}

- (void)setEnableRectDiagnosticsForPathSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForPathSprites = a3;
}

- (void)setEnableRectDiagnosticsForNamedImageSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForNamedImageSprites = a3;
}

- (void)setEnableRectDiagnosticsForGradientSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForGradientSprites = a3;
}

- (void)setEnableRectDiagnosticsForDisplayAssetSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForDisplayAssetSprites = a3;
}

- (void)setEnableRectDiagnosticsForDecorationSprites:(BOOL)a3
{
  self->_enableRectDiagnosticsForDecorationSprites = a3;
}

- (void)setEnableMipmaps:(BOOL)a3
{
  self->_enableMipmaps = a3;
}

- (void)setEnableMetalRenderer:(BOOL)a3
{
  self->_enableMetalRenderer = a3;
}

- (void)setEnableLayoutDanglingUpdatesAssertions:(BOOL)a3
{
  self->_enableLayoutDanglingUpdatesAssertions = a3;
}

- (void)setEnableFrameDebuggerCapture:(BOOL)a3
{
  self->_enableFrameDebuggerCapture = a3;
}

- (void)setEnableFocusRectDiagnostics:(BOOL)a3
{
  self->_enableFocusRectDiagnostics = a3;
}

- (void)setEnableCurrentFocusRectDiagnostics:(BOOL)a3
{
  self->_enableCurrentFocusRectDiagnostics = a3;
}

- (void)setEnableColorMatching:(BOOL)a3
{
  self->_enableColorMatching = a3;
}

- (void)setEnableAssetsRectDiagnostics:(BOOL)a3
{
  self->_enableAssetsRectDiagnostics = a3;
}

- (void)setEnableAnchoringRectDiagnostics:(BOOL)a3
{
  self->_enableAnchoringRectDiagnostics = a3;
}

- (void)setDisableLowResThumbnails:(BOOL)a3
{
  self->_disableLowResThumbnails = a3;
}

- (void)setDebugSharedTextures:(BOOL)a3
{
  self->_debugSharedTextures = a3;
}

- (void)setDebugResolution:(BOOL)a3
{
  self->_debugResolution = a3;
}

- (void)setDebugOpaque:(BOOL)a3
{
  self->_debugOpaque = a3;
}

- (void)setDebugMipmaps:(BOOL)a3
{
  self->_debugMipmaps = a3;
}

- (void)setDebugExtendedColorRange:(BOOL)a3
{
  self->_debugExtendedColorRange = a3;
}

- (void)setDebugColorTransform:(BOOL)a3
{
  self->_debugColorTransform = a3;
}

- (void)setColorCopiedImages:(BOOL)a3
{
  self->_colorCopiedImages = a3;
}

- (void)setColorCachedThumbnails:(BOOL)a3
{
  self->_colorCachedThumbnails = a3;
}

- (void)setCameraZoomFactor:(double)a3
{
  self->_cameraZoomFactor = a3;
}

- (void)setBlockingWhileScrubbingTimeout:(double)a3
{
  self->_blockingWhileScrubbingTimeout = a3;
}

- (void)setBlockingWhileScrollingTimeout:(double)a3
{
  self->_blockingWhileScrollingTimeout = a3;
}

- (void)setBlockingWhileInitialLoadTimeout:(double)a3
{
  self->_blockingWhileInitialLoadTimeout = a3;
}

- (void)setBlockOnMissingThumbnailsAtSpeedRegime:(int64_t)a3
{
  self->_blockOnMissingThumbnailsAtSpeedRegime = a3;
}

- (void)setAllowsViewControllerTransitions:(BOOL)a3
{
  self->_allowsViewControllerTransitions = a3;
}

- (void)setAllowBlockingDuringScrolling:(BOOL)a3
{
  self->_allowBlockingDuringScrolling = a3;
}

- (void)setAllowBlockingDueToFences:(BOOL)a3
{
  self->_allowBlockingDueToFences = a3;
}

- (double)keyboardDampingRatio
{
  return self->_keyboardDampingRatio;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

- (double)keyboardUnselectedDimmingFactor
{
  return self->_keyboardUnselectedDimmingFactor;
}

- (BOOL)enableTungstenFocusEnvironmentSupport
{
  return self->_enableTungstenFocusEnvironmentSupport;
}

- (BOOL)hideDetailContentDuringTransition
{
  return self->_hideDetailContentDuringTransition;
}

- (BOOL)hideSummaryContentDuringTransition
{
  return self->_hideSummaryContentDuringTransition;
}

- (double)viewControllerTransitionDuration
{
  return self->_viewControllerTransitionDuration;
}

- (BOOL)allowsViewControllerTransitions
{
  return self->_allowsViewControllerTransitions;
}

- (BOOL)shouldDeactivateTextureManagerWhenNotVisible
{
  return self->_shouldDeactivateTextureManagerWhenNotVisible;
}

- (unint64_t)renderTextureCacheSizeLimitMB
{
  return self->_renderTextureCacheSizeLimitMB;
}

- (double)renderTextureCacheAgeLimit
{
  return self->_renderTextureCacheAgeLimit;
}

- (unint64_t)renderTextureCacheCapacity
{
  return self->_renderTextureCacheCapacity;
}

- (BOOL)enableRenderTextureCache
{
  return self->_enableRenderTextureCache;
}

- (BOOL)enableLayoutDanglingUpdatesAssertions
{
  return self->_enableLayoutDanglingUpdatesAssertions;
}

- (double)livePhotoInitialCrossfadeDuration
{
  return self->_livePhotoInitialCrossfadeDuration;
}

- (double)fullPageSnapshotTileDelay
{
  return self->_fullPageSnapshotTileDelay;
}

- (int64_t)fullPageSnapshotMaximumNumberOfTiles
{
  return self->_fullPageSnapshotMaximumNumberOfTiles;
}

- (void)setPerspectiveAngle:(double)a3
{
  self->_perspectiveAngle = a3;
}

- (double)perspectiveAngle
{
  return self->_perspectiveAngle;
}

- (BOOL)enableRectDiagnosticsForPixelBufferSprites
{
  return self->_enableRectDiagnosticsForPixelBufferSprites;
}

- (BOOL)enableRectDiagnosticsForPathSprites
{
  return self->_enableRectDiagnosticsForPathSprites;
}

- (BOOL)enableRectDiagnosticsForViewSprites
{
  return self->_enableRectDiagnosticsForViewSprites;
}

- (BOOL)enableRectDiagnosticsForDecorationSprites
{
  return self->_enableRectDiagnosticsForDecorationSprites;
}

- (BOOL)enableRectDiagnosticsForShadowSprites
{
  return self->_enableRectDiagnosticsForShadowSprites;
}

- (BOOL)enableRectDiagnosticsForGradientSprites
{
  return self->_enableRectDiagnosticsForGradientSprites;
}

- (BOOL)enableRectDiagnosticsForSolidColorSprites
{
  return self->_enableRectDiagnosticsForSolidColorSprites;
}

- (BOOL)enableRectDiagnosticsForTitleSubtitleSprites
{
  return self->_enableRectDiagnosticsForTitleSubtitleSprites;
}

- (BOOL)enableRectDiagnosticsForTextSprites
{
  return self->_enableRectDiagnosticsForTextSprites;
}

- (BOOL)enableRectDiagnosticsForDisplayAssetSprites
{
  return self->_enableRectDiagnosticsForDisplayAssetSprites;
}

- (BOOL)enableRectDiagnosticsForNamedImageSprites
{
  return self->_enableRectDiagnosticsForNamedImageSprites;
}

- (BOOL)enableRectDiagnosticsForUndefinedSprites
{
  return self->_enableRectDiagnosticsForUndefinedSprites;
}

- (BOOL)enableCurrentFocusRectDiagnostics
{
  return self->_enableCurrentFocusRectDiagnostics;
}

- (BOOL)enableFocusRectDiagnostics
{
  return self->_enableFocusRectDiagnostics;
}

- (BOOL)enableAssetsRectDiagnostics
{
  return self->_enableAssetsRectDiagnostics;
}

- (BOOL)enableAnchoringRectDiagnostics
{
  return self->_enableAnchoringRectDiagnostics;
}

- (double)maxCornerRadius
{
  return self->_maxCornerRadius;
}

- (double)slowAnimationsSpeed
{
  return self->_slowAnimationsSpeed;
}

- (int64_t)videoAllowedAtOrBelowSpeedForLowSpec
{
  return self->_videoAllowedAtOrBelowSpeedForLowSpec;
}

- (double)blockingWhileInitialLoadTimeout
{
  return self->_blockingWhileInitialLoadTimeout;
}

- (double)blockingWhileScrubbingTimeout
{
  return self->_blockingWhileScrubbingTimeout;
}

- (double)textLegibilityDimmingStrength
{
  return self->_textLegibilityDimmingStrength;
}

- (unint64_t)textLegibilityDimmingType
{
  return self->_textLegibilityDimmingType;
}

- (double)opportunisticPreheatRequiredIdleTime
{
  return self->_opportunisticPreheatRequiredIdleTime;
}

- (BOOL)colorCachedThumbnails
{
  return self->_colorCachedThumbnails;
}

- (BOOL)colorCopiedImages
{
  return self->_colorCopiedImages;
}

- (BOOL)enableFrameDebuggerCapture
{
  return self->_enableFrameDebuggerCapture;
}

- (double)inactivityTimeout
{
  return self->_inactivityTimeout;
}

- (BOOL)inLowMemoryModePreferMasterThumb
{
  return self->_inLowMemoryModePreferMasterThumb;
}

- (BOOL)includeLayoutsLocalSpritesInDebugHierarchy
{
  return self->_includeLayoutsLocalSpritesInDebugHierarchy;
}

- (BOOL)sortSpritesInXcodeCustomDebugHierarchy
{
  return self->_sortSpritesInXcodeCustomDebugHierarchy;
}

- (BOOL)enableXcodeCustomDebugHierarchy
{
  return self->_enableXcodeCustomDebugHierarchy;
}

- (BOOL)anySpritesRectDiagnosticsEnabled
{
  if ([(PXTungstenSettings *)self enableRectDiagnosticsForUndefinedSprites]
    || [(PXTungstenSettings *)self enableRectDiagnosticsForNamedImageSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForDisplayAssetSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForTextSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForTitleSubtitleSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForSolidColorSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForGradientSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForShadowSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForDecorationSprites]|| [(PXTungstenSettings *)self enableRectDiagnosticsForViewSprites])
  {
    return 1;
  }

  return [(PXTungstenSettings *)self enableRectDiagnosticsForPathSprites];
}

@end