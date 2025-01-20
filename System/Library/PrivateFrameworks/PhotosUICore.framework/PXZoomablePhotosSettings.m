@interface PXZoomablePhotosSettings
+ (NSArray)columnChoices;
+ (NSArray)validColumns;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)enableAutoCrossfade;
- (BOOL)enableBadges;
- (BOOL)enableBlurDebugLayers;
- (BOOL)enableBlurEffect;
- (BOOL)enableCrossfadeFallback;
- (BOOL)enableDebugLayers;
- (BOOL)enableDebugSprites;
- (BOOL)enableDecadesDensity;
- (BOOL)enableDenseLevelsInSelectMode;
- (BOOL)enableHeaderBlur;
- (BOOL)enableInlineVideo;
- (BOOL)enableOneColumn;
- (BOOL)enablePinch;
- (BOOL)forceSaliency;
- (BOOL)hideBadgesDuringZoom;
- (BOOL)preheatThumbnailsWhenIdle;
- (BOOL)simulateEmptyLibrary;
- (BOOL)tapsZoomsToLastIndividualDensity;
- (BOOL)titleUseDateRange;
- (BOOL)unfoldDebugLogging;
- (NSArray)columns;
- (double)alphaCrossfadeMaxDuration;
- (double)alphaCrossfadeMinDuration;
- (double)alphaDistanceForDirectionChange;
- (double)alphaMaxAcceptableScale;
- (double)alphaMinAcceptableCoverage;
- (double)alphaModeTransitionDuration;
- (double)blurDimmingStrength;
- (double)cardsAspectRatio;
- (double)cardsCornerRadius;
- (double)cardsInteritemSpacing;
- (double)cornerRadius;
- (double)darkModeCornerRadius;
- (double)darkModeInteritemSpacing;
- (double)decadesDensityScale;
- (double)denseLevelMinimumScreensOfContent;
- (double)headerSpaceMinimumScreensOfContent;
- (double)individualLevelMinimumScreensOfContent;
- (double)interitemSpacing;
- (double)macPinchGestureDampening;
- (double)maxBlurRadius;
- (double)minAcceptableCoverage;
- (double)panoramaCompactInteritemSpacing;
- (double)panoramaRegularInteritemSpacing;
- (double)pinchSmoothingDuration;
- (double)recenterSpringDamping;
- (double)recenterSpringStiffness;
- (double)shiftingRequiredScreensTopDistance;
- (double)sliderSmoothingDuration;
- (double)unfoldEaseOutAmount;
- (double)unfoldInitialPercentage;
- (double)unfoldVerticalShiftCompensation;
- (double)zoomDecelerationRate;
- (double)zoomInRubberBanding;
- (double)zoomOutRubberBanding;
- (double)zoomSpringDamping;
- (double)zoomSpringStiffness;
- (double)zoomingHeaderTintOpacity;
- (id)parentSettings;
- (int64_t)columnsChoiceIndex;
- (int64_t)maxColumnsForSaliency;
- (int64_t)maxColumnsForSingleDate;
- (int64_t)maxPhotoCount;
- (int64_t)onlyPhotosFromToday;
- (int64_t)preheatDenserZoomLevels;
- (int64_t)rubberBandEffect;
- (int64_t)simulateMinimumPhotoCount;
- (void)setAlphaCrossfadeMaxDuration:(double)a3;
- (void)setAlphaCrossfadeMinDuration:(double)a3;
- (void)setAlphaDistanceForDirectionChange:(double)a3;
- (void)setAlphaMaxAcceptableScale:(double)a3;
- (void)setAlphaMinAcceptableCoverage:(double)a3;
- (void)setAlphaModeTransitionDuration:(double)a3;
- (void)setBlurDimmingStrength:(double)a3;
- (void)setCardsAspectRatio:(double)a3;
- (void)setCardsCornerRadius:(double)a3;
- (void)setCardsInteritemSpacing:(double)a3;
- (void)setColumns:(id)a3;
- (void)setColumnsChoiceIndex:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDarkModeCornerRadius:(double)a3;
- (void)setDarkModeInteritemSpacing:(double)a3;
- (void)setDecadesDensityScale:(double)a3;
- (void)setDefaultValues;
- (void)setDenseLevelMinimumScreensOfContent:(double)a3;
- (void)setEnableAutoCrossfade:(BOOL)a3;
- (void)setEnableBadges:(BOOL)a3;
- (void)setEnableBlurDebugLayers:(BOOL)a3;
- (void)setEnableBlurEffect:(BOOL)a3;
- (void)setEnableCrossfadeFallback:(BOOL)a3;
- (void)setEnableDebugLayers:(BOOL)a3;
- (void)setEnableDebugSprites:(BOOL)a3;
- (void)setEnableDecadesDensity:(BOOL)a3;
- (void)setEnableDenseLevelsInSelectMode:(BOOL)a3;
- (void)setEnableHeaderBlur:(BOOL)a3;
- (void)setEnableInlineVideo:(BOOL)a3;
- (void)setEnableOneColumn:(BOOL)a3;
- (void)setEnablePinch:(BOOL)a3;
- (void)setForceSaliency:(BOOL)a3;
- (void)setHeaderSpaceMinimumScreensOfContent:(double)a3;
- (void)setHideBadgesDuringZoom:(BOOL)a3;
- (void)setIndividualLevelMinimumScreensOfContent:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setMacPinchGestureDampening:(double)a3;
- (void)setMaxBlurRadius:(double)a3;
- (void)setMaxColumnsForSaliency:(int64_t)a3;
- (void)setMaxColumnsForSingleDate:(int64_t)a3;
- (void)setMaxPhotoCount:(int64_t)a3;
- (void)setMinAcceptableCoverage:(double)a3;
- (void)setOnlyPhotosFromToday:(int64_t)a3;
- (void)setPanoramaCompactInteritemSpacing:(double)a3;
- (void)setPanoramaRegularInteritemSpacing:(double)a3;
- (void)setPinchSmoothingDuration:(double)a3;
- (void)setPreheatDenserZoomLevels:(int64_t)a3;
- (void)setPreheatThumbnailsWhenIdle:(BOOL)a3;
- (void)setRecenterSpringDamping:(double)a3;
- (void)setRecenterSpringStiffness:(double)a3;
- (void)setRubberBandEffect:(int64_t)a3;
- (void)setShiftingRequiredScreensTopDistance:(double)a3;
- (void)setSimulateEmptyLibrary:(BOOL)a3;
- (void)setSimulateMinimumPhotoCount:(int64_t)a3;
- (void)setSliderSmoothingDuration:(double)a3;
- (void)setTapsZoomsToLastIndividualDensity:(BOOL)a3;
- (void)setTitleUseDateRange:(BOOL)a3;
- (void)setUnfoldDebugLogging:(BOOL)a3;
- (void)setUnfoldEaseOutAmount:(double)a3;
- (void)setUnfoldInitialPercentage:(double)a3;
- (void)setUnfoldVerticalShiftCompensation:(double)a3;
- (void)setZoomDecelerationRate:(double)a3;
- (void)setZoomInRubberBanding:(double)a3;
- (void)setZoomOutRubberBanding:(double)a3;
- (void)setZoomSpringDamping:(double)a3;
- (void)setZoomSpringStiffness:(double)a3;
- (void)setZoomingHeaderTintOpacity:(double)a3;
@end

@implementation PXZoomablePhotosSettings

- (BOOL)titleUseDateRange
{
  return self->_titleUseDateRange;
}

- (BOOL)enableInlineVideo
{
  return self->_enableInlineVideo;
}

- (double)shiftingRequiredScreensTopDistance
{
  return self->_shiftingRequiredScreensTopDistance;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (BOOL)enableBadges
{
  return self->_enableBadges;
}

- (int64_t)simulateMinimumPhotoCount
{
  return self->_simulateMinimumPhotoCount;
}

- (BOOL)simulateEmptyLibrary
{
  return self->_simulateEmptyLibrary;
}

- (int64_t)onlyPhotosFromToday
{
  return self->_onlyPhotosFromToday;
}

- (int64_t)maxPhotoCount
{
  return self->_maxPhotoCount;
}

- (BOOL)enableDebugLayers
{
  return self->_enableDebugLayers;
}

- (double)individualLevelMinimumScreensOfContent
{
  return self->_individualLevelMinimumScreensOfContent;
}

- (double)denseLevelMinimumScreensOfContent
{
  return self->_denseLevelMinimumScreensOfContent;
}

- (double)panoramaCompactInteritemSpacing
{
  return self->_panoramaCompactInteritemSpacing;
}

- (int64_t)maxColumnsForSaliency
{
  return self->_maxColumnsForSaliency;
}

- (BOOL)forceSaliency
{
  return self->_forceSaliency;
}

- (BOOL)enableOneColumn
{
  return self->_enableOneColumn;
}

- (BOOL)enableDecadesDensity
{
  return self->_enableDecadesDensity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)alphaDistanceForDirectionChange
{
  return self->_alphaDistanceForDirectionChange;
}

- (double)alphaMinAcceptableCoverage
{
  return self->_alphaMinAcceptableCoverage;
}

- (double)alphaMaxAcceptableScale
{
  return self->_alphaMaxAcceptableScale;
}

- (double)minAcceptableCoverage
{
  return self->_minAcceptableCoverage;
}

- (double)zoomOutRubberBanding
{
  return self->_zoomOutRubberBanding;
}

- (double)zoomInRubberBanding
{
  return self->_zoomInRubberBanding;
}

- (BOOL)enableAutoCrossfade
{
  return self->_enableAutoCrossfade;
}

- (BOOL)enableDebugSprites
{
  return self->_enableDebugSprites;
}

- (BOOL)preheatThumbnailsWhenIdle
{
  return self->_preheatThumbnailsWhenIdle;
}

- (int64_t)preheatDenserZoomLevels
{
  return self->_preheatDenserZoomLevels;
}

- (int64_t)maxColumnsForSingleDate
{
  return self->_maxColumnsForSingleDate;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25700 != -1) {
    dispatch_once(&sharedInstance_onceToken_25700, &__block_literal_global_25701);
  }
  v2 = (void *)sharedInstance_sharedInstance_25702;
  return v2;
}

- (BOOL)enableBlurEffect
{
  return self->_enableBlurEffect;
}

- (BOOL)enableBlurDebugLayers
{
  return self->_enableBlurDebugLayers;
}

- (BOOL)hideBadgesDuringZoom
{
  return self->_hideBadgesDuringZoom;
}

- (int64_t)rubberBandEffect
{
  return self->_rubberBandEffect;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXZoomablePhotosSettings *)self setEnablePinch:1];
  [(PXZoomablePhotosSettings *)self setEnableBadges:1];
  [(PXZoomablePhotosSettings *)self setEnableInlineVideo:1];
  [(PXZoomablePhotosSettings *)self setEnableOneColumn:1];
  [(PXZoomablePhotosSettings *)self setEnableHeaderBlur:0];
  [(PXZoomablePhotosSettings *)self setEnableDecadesDensity:0];
  [(PXZoomablePhotosSettings *)self setEnableCrossfadeFallback:1];
  [(PXZoomablePhotosSettings *)self setEnableDenseLevelsInSelectMode:1];
  [(PXZoomablePhotosSettings *)self setDecadesDensityScale:0.5];
  [(PXZoomablePhotosSettings *)self setIndividualLevelMinimumScreensOfContent:0.0];
  [(PXZoomablePhotosSettings *)self setDenseLevelMinimumScreensOfContent:0.4];
  [(PXZoomablePhotosSettings *)self setHeaderSpaceMinimumScreensOfContent:1.5];
  [(PXZoomablePhotosSettings *)self setShiftingRequiredScreensTopDistance:10.0];
  [(PXZoomablePhotosSettings *)self setTitleUseDateRange:1];
  [(PXZoomablePhotosSettings *)self setZoomingHeaderTintOpacity:0.9];
  [(PXZoomablePhotosSettings *)self setTapsZoomsToLastIndividualDensity:1];
  [(PXZoomablePhotosSettings *)self setForceSaliency:0];
  [(PXZoomablePhotosSettings *)self setEnableDebugLayers:0];
  [(PXZoomablePhotosSettings *)self setEnableDebugSprites:0];
  [(PXZoomablePhotosSettings *)self setColumnsChoiceIndex:0];
  [(PXZoomablePhotosSettings *)self setInteritemSpacing:1.5];
  [(PXZoomablePhotosSettings *)self setDarkModeInteritemSpacing:6.0];
  [(PXZoomablePhotosSettings *)self setCardsInteritemSpacing:8.0];
  [(PXZoomablePhotosSettings *)self setPanoramaCompactInteritemSpacing:2.0];
  [(PXZoomablePhotosSettings *)self setPanoramaRegularInteritemSpacing:10.0];
  [(PXZoomablePhotosSettings *)self setCornerRadius:0.0];
  [(PXZoomablePhotosSettings *)self setDarkModeCornerRadius:6.0];
  [(PXZoomablePhotosSettings *)self setCardsCornerRadius:8.0];
  [(PXZoomablePhotosSettings *)self setCardsAspectRatio:0.666666667];
  [(PXZoomablePhotosSettings *)self setRubberBandEffect:1];
  [(PXZoomablePhotosSettings *)self setZoomDecelerationRate:992.0];
  [(PXZoomablePhotosSettings *)self setZoomSpringStiffness:150.0];
  [(PXZoomablePhotosSettings *)self setZoomSpringDamping:1.0];
  [(PXZoomablePhotosSettings *)self setRecenterSpringStiffness:100.0];
  [(PXZoomablePhotosSettings *)self setRecenterSpringDamping:1.0];
  [(PXZoomablePhotosSettings *)self setZoomOutRubberBanding:5.0];
  [(PXZoomablePhotosSettings *)self setZoomInRubberBanding:0.5];
  [(PXZoomablePhotosSettings *)self setPinchSmoothingDuration:0.0333333333];
  [(PXZoomablePhotosSettings *)self setSliderSmoothingDuration:0.2];
  [(PXZoomablePhotosSettings *)self setMacPinchGestureDampening:0.5];
  [(PXZoomablePhotosSettings *)self setSimulateEmptyLibrary:0];
  [(PXZoomablePhotosSettings *)self setSimulateMinimumPhotoCount:0];
  [(PXZoomablePhotosSettings *)self setMaxPhotoCount:0];
  [(PXZoomablePhotosSettings *)self setOnlyPhotosFromToday:0];
  [(PXZoomablePhotosSettings *)self setEnableAutoCrossfade:1];
  [(PXZoomablePhotosSettings *)self setAlphaMaxAcceptableScale:2.5];
  [(PXZoomablePhotosSettings *)self setAlphaMinAcceptableCoverage:0.5];
  [(PXZoomablePhotosSettings *)self setMinAcceptableCoverage:0.3];
  [(PXZoomablePhotosSettings *)self setAlphaDistanceForDirectionChange:0.025];
  [(PXZoomablePhotosSettings *)self setAlphaModeTransitionDuration:0.3];
  [(PXZoomablePhotosSettings *)self setAlphaCrossfadeMinDuration:0.2];
  [(PXZoomablePhotosSettings *)self setAlphaCrossfadeMaxDuration:1.5];
  [(PXZoomablePhotosSettings *)self setHideBadgesDuringZoom:0];
  [(PXZoomablePhotosSettings *)self setPreheatDenserZoomLevels:1];
  [(PXZoomablePhotosSettings *)self setPreheatThumbnailsWhenIdle:0];
  [(PXZoomablePhotosSettings *)self setMaxColumnsForSaliency:7];
  [(PXZoomablePhotosSettings *)self setMaxColumnsForSingleDate:3];
  [(PXZoomablePhotosSettings *)self setEnableBlurEffect:1];
  [(PXZoomablePhotosSettings *)self setMaxBlurRadius:5.0];
  [(PXZoomablePhotosSettings *)self setBlurDimmingStrength:1.0];
  [(PXZoomablePhotosSettings *)self setEnableBlurDebugLayers:0];
  [(PXZoomablePhotosSettings *)self setUnfoldInitialPercentage:0.4];
  [(PXZoomablePhotosSettings *)self setUnfoldVerticalShiftCompensation:0.3];
  [(PXZoomablePhotosSettings *)self setUnfoldEaseOutAmount:1.0];
  [(PXZoomablePhotosSettings *)self setUnfoldDebugLogging:0];
}

- (void)setZoomingHeaderTintOpacity:(double)a3
{
  self->_zoomingHeaderTintOpacity = a3;
}

- (void)setZoomSpringStiffness:(double)a3
{
  self->_zoomSpringStiffness = a3;
}

- (void)setZoomSpringDamping:(double)a3
{
  self->_zoomSpringDamping = a3;
}

- (void)setZoomOutRubberBanding:(double)a3
{
  self->_zoomOutRubberBanding = a3;
}

- (void)setZoomInRubberBanding:(double)a3
{
  self->_zoomInRubberBanding = a3;
}

- (void)setZoomDecelerationRate:(double)a3
{
  self->_zoomDecelerationRate = a3;
}

- (void)setUnfoldVerticalShiftCompensation:(double)a3
{
  self->_unfoldVerticalShiftCompensation = a3;
}

- (void)setUnfoldInitialPercentage:(double)a3
{
  self->_unfoldInitialPercentage = a3;
}

- (void)setUnfoldEaseOutAmount:(double)a3
{
  self->_unfoldEaseOutAmount = a3;
}

- (void)setUnfoldDebugLogging:(BOOL)a3
{
  self->_unfoldDebugLogging = a3;
}

- (void)setTitleUseDateRange:(BOOL)a3
{
  self->_titleUseDateRange = a3;
}

- (void)setTapsZoomsToLastIndividualDensity:(BOOL)a3
{
  self->_tapsZoomsToLastIndividualDensity = a3;
}

- (void)setSliderSmoothingDuration:(double)a3
{
  self->_sliderSmoothingDuration = a3;
}

- (void)setSimulateMinimumPhotoCount:(int64_t)a3
{
  self->_simulateMinimumPhotoCount = a3;
}

- (void)setSimulateEmptyLibrary:(BOOL)a3
{
  self->_simulateEmptyLibrary = a3;
}

- (void)setShiftingRequiredScreensTopDistance:(double)a3
{
  self->_shiftingRequiredScreensTopDistance = a3;
}

- (void)setRubberBandEffect:(int64_t)a3
{
  self->_rubberBandEffect = a3;
}

- (void)setRecenterSpringStiffness:(double)a3
{
  self->_recenterSpringStiffness = a3;
}

- (void)setRecenterSpringDamping:(double)a3
{
  self->_recenterSpringDamping = a3;
}

- (void)setPreheatThumbnailsWhenIdle:(BOOL)a3
{
  self->_preheatThumbnailsWhenIdle = a3;
}

- (void)setPreheatDenserZoomLevels:(int64_t)a3
{
  self->_preheatDenserZoomLevels = a3;
}

- (void)setPinchSmoothingDuration:(double)a3
{
  self->_pinchSmoothingDuration = a3;
}

- (void)setPanoramaRegularInteritemSpacing:(double)a3
{
  self->_panoramaRegularInteritemSpacing = a3;
}

- (void)setPanoramaCompactInteritemSpacing:(double)a3
{
  self->_panoramaCompactInteritemSpacing = a3;
}

- (void)setOnlyPhotosFromToday:(int64_t)a3
{
  self->_onlyPhotosFromToday = a3;
}

- (void)setMinAcceptableCoverage:(double)a3
{
  self->_minAcceptableCoverage = a3;
}

- (void)setMaxPhotoCount:(int64_t)a3
{
  self->_maxPhotoCount = a3;
}

- (void)setMaxColumnsForSingleDate:(int64_t)a3
{
  self->_maxColumnsForSingleDate = a3;
}

- (void)setMaxColumnsForSaliency:(int64_t)a3
{
  self->_maxColumnsForSaliency = a3;
}

- (void)setMaxBlurRadius:(double)a3
{
  self->_maxBlurRadius = a3;
}

- (void)setMacPinchGestureDampening:(double)a3
{
  self->_macPinchGestureDampening = a3;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (void)setIndividualLevelMinimumScreensOfContent:(double)a3
{
  self->_individualLevelMinimumScreensOfContent = a3;
}

- (void)setHideBadgesDuringZoom:(BOOL)a3
{
  self->_hideBadgesDuringZoom = a3;
}

- (void)setHeaderSpaceMinimumScreensOfContent:(double)a3
{
  self->_headerSpaceMinimumScreensOfContent = a3;
}

- (void)setForceSaliency:(BOOL)a3
{
  self->_forceSaliency = a3;
}

- (void)setEnablePinch:(BOOL)a3
{
  self->_enablePinch = a3;
}

- (void)setEnableOneColumn:(BOOL)a3
{
  self->_enableOneColumn = a3;
}

- (void)setEnableInlineVideo:(BOOL)a3
{
  self->_enableInlineVideo = a3;
}

- (void)setEnableHeaderBlur:(BOOL)a3
{
  self->_enableHeaderBlur = a3;
}

- (void)setEnableDenseLevelsInSelectMode:(BOOL)a3
{
  self->_enableDenseLevelsInSelectMode = a3;
}

- (void)setEnableDecadesDensity:(BOOL)a3
{
  self->_enableDecadesDensity = a3;
}

- (void)setEnableDebugSprites:(BOOL)a3
{
  self->_enableDebugSprites = a3;
}

- (void)setEnableDebugLayers:(BOOL)a3
{
  self->_enableDebugLayers = a3;
}

- (void)setEnableCrossfadeFallback:(BOOL)a3
{
  self->_enableCrossfadeFallback = a3;
}

- (void)setEnableBlurEffect:(BOOL)a3
{
  self->_enableBlurEffect = a3;
}

- (void)setEnableBlurDebugLayers:(BOOL)a3
{
  self->_enableBlurDebugLayers = a3;
}

- (void)setEnableBadges:(BOOL)a3
{
  self->_enableBadges = a3;
}

- (void)setEnableAutoCrossfade:(BOOL)a3
{
  self->_enableAutoCrossfade = a3;
}

- (void)setDenseLevelMinimumScreensOfContent:(double)a3
{
  self->_denseLevelMinimumScreensOfContent = a3;
}

- (void)setDecadesDensityScale:(double)a3
{
  self->_decadesDensityScale = a3;
}

- (void)setDarkModeInteritemSpacing:(double)a3
{
  self->_darkModeInteritemSpacing = a3;
}

- (void)setDarkModeCornerRadius:(double)a3
{
  self->_darkModeCornerRadius = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setColumnsChoiceIndex:(int64_t)a3
{
  self->_columnsChoiceIndex = a3;
}

- (void)setCardsInteritemSpacing:(double)a3
{
  self->_cardsInteritemSpacing = a3;
}

- (void)setCardsCornerRadius:(double)a3
{
  self->_cardsCornerRadius = a3;
}

- (void)setCardsAspectRatio:(double)a3
{
  self->_cardsAspectRatio = a3;
}

- (void)setBlurDimmingStrength:(double)a3
{
  self->_blurDimmingStrength = a3;
}

- (void)setAlphaModeTransitionDuration:(double)a3
{
  self->_alphaModeTransitionDuration = a3;
}

- (void)setAlphaMinAcceptableCoverage:(double)a3
{
  self->_alphaMinAcceptableCoverage = a3;
}

- (void)setAlphaMaxAcceptableScale:(double)a3
{
  self->_alphaMaxAcceptableScale = a3;
}

- (void)setAlphaDistanceForDirectionChange:(double)a3
{
  self->_alphaDistanceForDirectionChange = a3;
}

- (void)setAlphaCrossfadeMinDuration:(double)a3
{
  self->_alphaCrossfadeMinDuration = a3;
}

- (void)setAlphaCrossfadeMaxDuration:(double)a3
{
  self->_alphaCrossfadeMaxDuration = a3;
}

void __42__PXZoomablePhotosSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 zoomablePhotosSettings];
  v1 = (void *)sharedInstance_sharedInstance_25702;
  sharedInstance_sharedInstance_25702 = v0;
}

+ (id)settingsControllerModule
{
  v278[8] = *MEMORY[0x1E4F143B8];
  v272 = (void *)MEMORY[0x1E4F94160];
  id v2 = (void *)MEMORY[0x1E4F941F0];
  v268 = NSStringFromSelector(sel_enableBlurEffect);
  v264 = [v2 rowWithTitle:@"Blur Effect" valueKeyPath:v268];
  v278[0] = v264;
  objc_super v3 = (void *)MEMORY[0x1E4F941D8];
  v260 = NSStringFromSelector(sel_maxBlurRadius);
  v256 = [v3 rowWithTitle:@"Blur Radius Max" valueKeyPath:v260];
  v253 = [v256 minValue:0.0 maxValue:30.0];
  v250 = objc_msgSend(v253, "px_increment:", 1.0);
  v278[1] = v250;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v247 = NSStringFromSelector(sel_blurDimmingStrength);
  v244 = [v4 rowWithTitle:@"Blur Dimming Strength" valueKeyPath:v247];
  v241 = [v244 minValue:0.0 maxValue:1.0];
  v238 = objc_msgSend(v241, "px_increment:", 0.05);
  v278[2] = v238;
  v5 = (void *)MEMORY[0x1E4F941F0];
  v235 = NSStringFromSelector(sel_enableBlurDebugLayers);
  v231 = [v5 rowWithTitle:@"Debug Blur Layers" valueKeyPath:v235];
  v278[3] = v231;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v228 = NSStringFromSelector(sel_unfoldDebugLogging);
  v225 = [v6 rowWithTitle:@"Debug Logging" valueKeyPath:v228];
  v278[4] = v225;
  v7 = (void *)MEMORY[0x1E4F941D8];
  v222 = NSStringFromSelector(sel_unfoldInitialPercentage);
  v219 = [v7 rowWithTitle:@"Unfold Initial Percentage" valueKeyPath:v222];
  v216 = [v219 minValue:0.0 maxValue:1.0];
  v8 = objc_msgSend(v216, "px_increment:", 0.01);
  v278[5] = v8;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v10 = NSStringFromSelector(sel_unfoldVerticalShiftCompensation);
  v11 = [v9 rowWithTitle:@"Vertical Shift Compensation" valueKeyPath:v10];
  v12 = [v11 minValue:0.0 maxValue:1.0];
  v13 = objc_msgSend(v12, "px_increment:", 0.01);
  v278[6] = v13;
  v14 = (void *)MEMORY[0x1E4F941D8];
  v15 = NSStringFromSelector(sel_unfoldEaseOutAmount);
  v16 = [v14 rowWithTitle:@"Ease Out Amount" valueKeyPath:v15];
  v17 = [v16 minValue:0.0 maxValue:1.0];
  v18 = objc_msgSend(v17, "px_increment:", 0.01);
  v278[7] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v278 count:8];
  v273 = [v272 sectionWithRows:v19 title:@"Cube Mode"];

  v186 = (void *)MEMORY[0x1E4F94160];
  v20 = (void *)MEMORY[0x1E4F941F0];
  v269 = NSStringFromSelector(sel_enableHeaderBlur);
  v265 = [v20 rowWithTitle:@"Zoom Header Blur" valueKeyPath:v269];
  v277[0] = v265;
  v21 = (void *)MEMORY[0x1E4F941D8];
  v261 = NSStringFromSelector(sel_zoomingHeaderTintOpacity);
  v257 = [v21 rowWithTitle:@"Zoom Header Tint" valueKeyPath:v261];
  v254 = [v257 minValue:0.0 maxValue:1.0];
  v251 = objc_msgSend(v254, "px_increment:", 0.01);
  v277[1] = v251;
  v22 = (void *)MEMORY[0x1E4F941F0];
  v248 = NSStringFromSelector(sel_titleUseDateRange);
  v245 = [v22 rowWithTitle:@"Title Shows Date Range" valueKeyPath:v248];
  v277[2] = v245;
  v23 = (void *)MEMORY[0x1E4F941F0];
  v242 = NSStringFromSelector(sel_enableBadges);
  v239 = [v23 rowWithTitle:@"Show Badges" valueKeyPath:v242];
  v277[3] = v239;
  v24 = (void *)MEMORY[0x1E4F941F0];
  v236 = NSStringFromSelector(sel_hideBadgesDuringZoom);
  v232 = [v24 rowWithTitle:@"Hide Badges During Zoom" valueKeyPath:v236];
  v277[4] = v232;
  v25 = (void *)MEMORY[0x1E4F941F0];
  v229 = NSStringFromSelector(sel_enableInlineVideo);
  v226 = [v25 rowWithTitle:@"Inline Video" valueKeyPath:v229];
  v277[5] = v226;
  v26 = (void *)MEMORY[0x1E4F941F0];
  v223 = NSStringFromSelector(sel_enableOneColumn);
  v220 = [v26 rowWithTitle:@"One Column" valueKeyPath:v223];
  v277[6] = v220;
  v27 = (void *)MEMORY[0x1E4F941F0];
  v217 = NSStringFromSelector(sel_enableDecadesDensity);
  v214 = [v27 rowWithTitle:@"Enable Decades Density" valueKeyPath:v217];
  v277[7] = v214;
  v28 = (void *)MEMORY[0x1E4F941D8];
  v212 = NSStringFromSelector(sel_decadesDensityScale);
  v210 = [v28 rowWithTitle:@"Decades Scale" valueKeyPath:v212];
  v208 = [v210 minValue:0.1 maxValue:0.5];
  v206 = objc_msgSend(v208, "px_increment:", 0.01);
  v277[8] = v206;
  v29 = (void *)MEMORY[0x1E4F941F0];
  v204 = NSStringFromSelector(sel_forceSaliency);
  v203 = [v29 rowWithTitle:@"Force Saliency" valueKeyPath:v204];
  v277[9] = v203;
  v30 = (void *)MEMORY[0x1E4F941F0];
  v202 = NSStringFromSelector(sel_enableCrossfadeFallback);
  v201 = [v30 rowWithTitle:@"Crossfade Fallback" valueKeyPath:v202];
  v277[10] = v201;
  v31 = (void *)MEMORY[0x1E4F941F0];
  v200 = NSStringFromSelector(sel_enableDenseLevelsInSelectMode);
  v199 = [v31 rowWithTitle:@"Dense Levels in Select Mode" valueKeyPath:v200];
  v277[11] = v199;
  v32 = (void *)MEMORY[0x1E4F941F0];
  v198 = NSStringFromSelector(sel_tapsZoomsToLastIndividualDensity);
  v197 = [v32 rowWithTitle:@"Tap Zooms To Last Used" valueKeyPath:v198];
  v277[12] = v197;
  v33 = (void *)MEMORY[0x1E4F941D8];
  v196 = NSStringFromSelector(sel_individualLevelMinimumScreensOfContent);
  v195 = [v33 rowWithTitle:@"Individ. Min Screens Of Content" valueKeyPath:v196];
  v194 = [v195 minValue:0.0 maxValue:2.0];
  v193 = objc_msgSend(v194, "px_increment:", 0.05);
  v277[13] = v193;
  v34 = (void *)MEMORY[0x1E4F941D8];
  v192 = NSStringFromSelector(sel_denseLevelMinimumScreensOfContent);
  v191 = [v34 rowWithTitle:@"Dense Min Screens Of Content" valueKeyPath:v192];
  v190 = [v191 minValue:0.0 maxValue:3.0];
  v189 = objc_msgSend(v190, "px_increment:", 0.1);
  v277[14] = v189;
  v35 = (void *)MEMORY[0x1E4F941D8];
  v188 = NSStringFromSelector(sel_headerSpaceMinimumScreensOfContent);
  v185 = [v35 rowWithTitle:@"Header Space Min Screens Of Content" valueKeyPath:v188];
  v184 = [v185 minValue:0.0 maxValue:3.0];
  v183 = objc_msgSend(v184, "px_increment:", 0.1);
  v277[15] = v183;
  v36 = (void *)MEMORY[0x1E4F941D8];
  v182 = NSStringFromSelector(sel_shiftingRequiredScreensTopDistance);
  v181 = [v36 rowWithTitle:@"Shifting Min Screens Distance" valueKeyPath:v182];
  v180 = [v181 minValue:0.0 maxValue:30.0];
  v179 = objc_msgSend(v180, "px_increment:", 1.0);
  v277[16] = v179;
  v37 = (void *)MEMORY[0x1E4F941F0];
  v178 = NSStringFromSelector(sel_enablePinch);
  v177 = [v37 rowWithTitle:@"Enable Pinch" valueKeyPath:v178];
  v277[17] = v177;
  v38 = (void *)MEMORY[0x1E4F941D8];
  v176 = NSStringFromSelector(sel_pinchSmoothingDuration);
  v175 = [v38 rowWithTitle:@"Pinch Smoothing Duration" valueKeyPath:v176];
  v174 = [v175 minValue:0.0 maxValue:0.1];
  v173 = objc_msgSend(v174, "px_increment:", 0.0166666667);
  v277[18] = v173;
  v39 = (void *)MEMORY[0x1E4F941D8];
  v172 = NSStringFromSelector(sel_sliderSmoothingDuration);
  v171 = [v39 rowWithTitle:@"Slider Smoothing Duration" valueKeyPath:v172];
  v170 = [v171 minValue:0.0 maxValue:0.5];
  v169 = objc_msgSend(v170, "px_increment:", 0.0166666667);
  v277[19] = v169;
  v40 = (void *)MEMORY[0x1E4F941D8];
  v168 = NSStringFromSelector(sel_interitemSpacing);
  v167 = [v40 rowWithTitle:@"Interitem Spacing" valueKeyPath:v168];
  v166 = [v167 minValue:0.0 maxValue:5.0];
  v165 = objc_msgSend(v166, "px_increment:", 0.5);
  v277[20] = v165;
  v41 = (void *)MEMORY[0x1E4F941D8];
  v164 = NSStringFromSelector(sel_darkModeInteritemSpacing);
  v163 = [v41 rowWithTitle:@"Dark Mode Interitem Spacing" valueKeyPath:v164];
  v162 = [v163 minValue:0.0 maxValue:10.0];
  v161 = objc_msgSend(v162, "px_increment:", 0.5);
  v277[21] = v161;
  v42 = (void *)MEMORY[0x1E4F941D8];
  v160 = NSStringFromSelector(sel_panoramaCompactInteritemSpacing);
  v159 = [v42 rowWithTitle:@"Pano Interitem Spacing (compact)" valueKeyPath:v160];
  v158 = [v159 minValue:0.0 maxValue:17.0];
  v157 = objc_msgSend(v158, "px_increment:", 1.0);
  v277[22] = v157;
  v43 = (void *)MEMORY[0x1E4F941D8];
  v156 = NSStringFromSelector(sel_panoramaRegularInteritemSpacing);
  v155 = [v43 rowWithTitle:@"Pano Interitem Spacing (regular)" valueKeyPath:v156];
  v154 = [v155 minValue:0.0 maxValue:17.0];
  v153 = objc_msgSend(v154, "px_increment:", 1.0);
  v277[23] = v153;
  v44 = (void *)MEMORY[0x1E4F94108];
  v152 = NSStringFromSelector(sel_maxColumnsForSingleDate);
  v151 = [v44 rowWithTitle:@"Single Date Max Cols" valueKeyPath:v152];
  v150 = +[PXZoomablePhotosSettings validColumns];
  v149 = objc_msgSend(v151, "px_possibleValues:", v150);
  v277[24] = v149;
  v45 = (void *)MEMORY[0x1E4F94108];
  v148 = NSStringFromSelector(sel_rubberBandEffect);
  v147 = [v45 rowWithTitle:@"Rubber Band Effect" valueKeyPath:v148];
  v146 = [v147 possibleValues:&unk_1F02D3448 titles:&unk_1F02D3460];
  v277[25] = v146;
  v46 = (void *)MEMORY[0x1E4F941D8];
  v145 = NSStringFromSelector(sel_zoomOutRubberBanding);
  v144 = [v46 rowWithTitle:@"Zoom Out Rubber Banding" valueKeyPath:v145];
  v143 = [v144 minValue:1.0 maxValue:10.0];
  v142 = objc_msgSend(v143, "px_increment:", 0.05);
  v277[26] = v142;
  v47 = (void *)MEMORY[0x1E4F941D8];
  v141 = NSStringFromSelector(sel_zoomInRubberBanding);
  v140 = [v47 rowWithTitle:@"Zoom In Rubber Banding" valueKeyPath:v141];
  v139 = [v140 minValue:0.01 maxValue:1.0];
  v138 = objc_msgSend(v139, "px_increment:", 0.01);
  v277[27] = v138;
  v48 = (void *)MEMORY[0x1E4F941D8];
  v137 = NSStringFromSelector(sel_zoomDecelerationRate);
  v136 = [v48 rowWithTitle:@"Zoom Deceleration Rate" valueKeyPath:v137];
  v135 = [v136 minValue:985.0 maxValue:999.0];
  v134 = objc_msgSend(v135, "px_increment:", 1.0);
  v277[28] = v134;
  v49 = (void *)MEMORY[0x1E4F941D8];
  v133 = NSStringFromSelector(sel_zoomSpringStiffness);
  v132 = [v49 rowWithTitle:@"Zoom Spring Stiffness" valueKeyPath:v133];
  v131 = [v132 minValue:0.0 maxValue:1000.0];
  v130 = objc_msgSend(v131, "px_increment:", 10.0);
  v277[29] = v130;
  v50 = (void *)MEMORY[0x1E4F941D8];
  v129 = NSStringFromSelector(sel_zoomSpringDamping);
  v128 = [v50 rowWithTitle:@"Zoom Spring Damping Factor" valueKeyPath:v129];
  v127 = [v128 minValue:0.0 maxValue:1.0];
  v126 = objc_msgSend(v127, "px_increment:", 0.01);
  v277[30] = v126;
  v51 = (void *)MEMORY[0x1E4F941D8];
  v125 = NSStringFromSelector(sel_recenterSpringStiffness);
  v124 = [v51 rowWithTitle:@"Recenter Spring Stiffness" valueKeyPath:v125];
  v123 = [v124 minValue:0.0 maxValue:500.0];
  v122 = objc_msgSend(v123, "px_increment:", 10.0);
  v277[31] = v122;
  v52 = (void *)MEMORY[0x1E4F941D8];
  v121 = NSStringFromSelector(sel_recenterSpringDamping);
  v120 = [v52 rowWithTitle:@"Recenter Spring Damping Factor" valueKeyPath:v121];
  v119 = [v120 minValue:0.0 maxValue:1.0];
  v118 = objc_msgSend(v119, "px_increment:", 0.01);
  v277[32] = v118;
  v53 = (void *)MEMORY[0x1E4F941F0];
  v117 = NSStringFromSelector(sel_simulateEmptyLibrary);
  v116 = [v53 rowWithTitle:@"Simulate Empty Library" valueKeyPath:v117];
  v277[33] = v116;
  v54 = (void *)MEMORY[0x1E4F94108];
  v115 = NSStringFromSelector(sel_simulateMinimumPhotoCount);
  v114 = [v54 rowWithTitle:@"Simulate Photo Count" valueKeyPath:v115];
  v113 = [&unk_1F02D3430 valueForKeyPath:@"description"];
  v112 = [v114 possibleValues:&unk_1F02D3430 titles:v113];
  v277[34] = v112;
  v55 = (void *)MEMORY[0x1E4F94108];
  v111 = NSStringFromSelector(sel_maxPhotoCount);
  v110 = [v55 rowWithTitle:@"Max Photo Count" valueKeyPath:v111];
  v109 = [&unk_1F02D3430 valueForKeyPath:@"description"];
  v108 = [v110 possibleValues:&unk_1F02D3430 titles:v109];
  v277[35] = v108;
  v56 = (void *)MEMORY[0x1E4F941F0];
  v107 = NSStringFromSelector(sel_onlyPhotosFromToday);
  v57 = [v56 rowWithTitle:@"Only Photos from Today" valueKeyPath:v107];
  v277[36] = v57;
  v58 = (void *)MEMORY[0x1E4F941F0];
  v59 = NSStringFromSelector(sel_preheatDenserZoomLevels);
  v60 = [v58 rowWithTitle:@"Preheat Denser Zoom Layers" valueKeyPath:v59];
  v277[37] = v60;
  v61 = (void *)MEMORY[0x1E4F941F0];
  v62 = NSStringFromSelector(sel_preheatThumbnailsWhenIdle);
  v63 = [v61 rowWithTitle:@"Preheat Thumbnails When Idle" valueKeyPath:v62];
  v277[38] = v63;
  v64 = (void *)MEMORY[0x1E4F941F0];
  v65 = NSStringFromSelector(sel_enableDebugLayers);
  v66 = [v64 rowWithTitle:@"Debug Layers" valueKeyPath:v65];
  v277[39] = v66;
  v67 = (void *)MEMORY[0x1E4F941F0];
  v68 = NSStringFromSelector(sel_enableDebugSprites);
  v69 = [v67 rowWithTitle:@"Debug Sprites" valueKeyPath:v68];
  v277[40] = v69;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v277 count:41];
  v187 = [v186 sectionWithRows:v70 title:@"Main"];

  v270 = (void *)MEMORY[0x1E4F94160];
  v71 = (void *)MEMORY[0x1E4F941D8];
  v266 = NSStringFromSelector(sel_cardsAspectRatio);
  v262 = [v71 rowWithTitle:@"Aspect Ratio (Portrait)" valueKeyPath:v266];
  v258 = [v262 minValue:0.01 maxValue:1.0];
  v72 = objc_msgSend(v258, "px_increment:", 0.01);
  v276[0] = v72;
  v73 = (void *)MEMORY[0x1E4F941D8];
  v74 = NSStringFromSelector(sel_cardsCornerRadius);
  v75 = [v73 rowWithTitle:@"Corner Radius" valueKeyPath:v74];
  v76 = [v75 minValue:0.01 maxValue:10.0];
  v77 = objc_msgSend(v76, "px_increment:", 1.0);
  v276[1] = v77;
  v78 = (void *)MEMORY[0x1E4F941D8];
  v79 = NSStringFromSelector(sel_cardsInteritemSpacing);
  v80 = [v78 rowWithTitle:@"Interitem Spacing" valueKeyPath:v79];
  v81 = [v80 minValue:0.01 maxValue:20.0];
  v82 = objc_msgSend(v81, "px_increment:", 1.0);
  v276[2] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v276 count:3];
  v271 = [v270 sectionWithRows:v83 title:@"Cards Style"];

  v233 = (void *)MEMORY[0x1E4F94160];
  v84 = (void *)MEMORY[0x1E4F941F0];
  v267 = NSStringFromSelector(sel_enableAutoCrossfade);
  v263 = [v84 rowWithTitle:@"Auto Crossfade" valueKeyPath:v267];
  v275[0] = v263;
  v85 = (void *)MEMORY[0x1E4F941D8];
  v259 = NSStringFromSelector(sel_alphaCrossfadeMinDuration);
  v255 = [v85 rowWithTitle:@"Min Crossfade Duration" valueKeyPath:v259];
  v252 = [v255 minValue:0.01 maxValue:1.0];
  v249 = objc_msgSend(v252, "px_increment:", 0.05);
  v275[1] = v249;
  v86 = (void *)MEMORY[0x1E4F941D8];
  v246 = NSStringFromSelector(sel_alphaCrossfadeMaxDuration);
  v243 = [v86 rowWithTitle:@"Max Crossfade Duration" valueKeyPath:v246];
  v240 = [v243 minValue:0.01 maxValue:5.0];
  v237 = objc_msgSend(v240, "px_increment:", 0.05);
  v275[2] = v237;
  v87 = (void *)MEMORY[0x1E4F941D8];
  v230 = NSStringFromSelector(sel_alphaMaxAcceptableScale);
  v227 = [v87 rowWithTitle:@"Max Accept. Scale" valueKeyPath:v230];
  v224 = [v227 minValue:1.0 maxValue:10.0];
  v221 = objc_msgSend(v224, "px_increment:", 0.01);
  v275[3] = v221;
  v88 = (void *)MEMORY[0x1E4F941D8];
  v218 = NSStringFromSelector(sel_alphaMinAcceptableCoverage);
  v215 = [v88 rowWithTitle:@"Min Accept. Coverage" valueKeyPath:v218];
  v213 = [v215 minValue:0.0 maxValue:1.0];
  v211 = objc_msgSend(v213, "px_increment:", 0.01);
  v275[4] = v211;
  v89 = (void *)MEMORY[0x1E4F941D8];
  v209 = NSStringFromSelector(sel_minAcceptableCoverage);
  v207 = [v89 rowWithTitle:@"Min Transition Dist." valueKeyPath:v209];
  v205 = [v207 minValue:0.01 maxValue:0.9];
  v90 = objc_msgSend(v205, "px_increment:", 0.01);
  v275[5] = v90;
  v91 = (void *)MEMORY[0x1E4F941D8];
  v92 = NSStringFromSelector(sel_alphaDistanceForDirectionChange);
  v93 = [v91 rowWithTitle:@"Min Dist. for Direction Change" valueKeyPath:v92];
  v94 = [v93 minValue:0.0 maxValue:0.5];
  v95 = objc_msgSend(v94, "px_increment:", 0.005);
  v275[6] = v95;
  v96 = (void *)MEMORY[0x1E4F941D8];
  v97 = NSStringFromSelector(sel_alphaModeTransitionDuration);
  v98 = [v96 rowWithTitle:@"Mode Transition Duration" valueKeyPath:v97];
  v99 = [v98 minValue:0.01 maxValue:1.0];
  v100 = objc_msgSend(v99, "px_increment:", 0.05);
  v275[7] = v100;
  v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v275 count:8];
  v234 = [v233 sectionWithRows:v101 title:@"Crossfade"];

  v102 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v103 = (void *)MEMORY[0x1E4F94160];
  v274[0] = v273;
  v274[1] = v187;
  v274[2] = v271;
  v274[3] = v234;
  v274[4] = v102;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v274 count:5];
  v105 = [v103 moduleWithTitle:@"Zoomable Photos" contents:v104];

  return v105;
}

- (void).cxx_destruct
{
}

- (double)alphaCrossfadeMaxDuration
{
  return self->_alphaCrossfadeMaxDuration;
}

- (double)alphaCrossfadeMinDuration
{
  return self->_alphaCrossfadeMinDuration;
}

- (double)alphaModeTransitionDuration
{
  return self->_alphaModeTransitionDuration;
}

- (BOOL)unfoldDebugLogging
{
  return self->_unfoldDebugLogging;
}

- (double)unfoldEaseOutAmount
{
  return self->_unfoldEaseOutAmount;
}

- (double)unfoldVerticalShiftCompensation
{
  return self->_unfoldVerticalShiftCompensation;
}

- (double)unfoldInitialPercentage
{
  return self->_unfoldInitialPercentage;
}

- (double)blurDimmingStrength
{
  return self->_blurDimmingStrength;
}

- (double)maxBlurRadius
{
  return self->_maxBlurRadius;
}

- (double)macPinchGestureDampening
{
  return self->_macPinchGestureDampening;
}

- (double)sliderSmoothingDuration
{
  return self->_sliderSmoothingDuration;
}

- (double)pinchSmoothingDuration
{
  return self->_pinchSmoothingDuration;
}

- (double)recenterSpringDamping
{
  return self->_recenterSpringDamping;
}

- (double)recenterSpringStiffness
{
  return self->_recenterSpringStiffness;
}

- (double)zoomSpringDamping
{
  return self->_zoomSpringDamping;
}

- (double)zoomSpringStiffness
{
  return self->_zoomSpringStiffness;
}

- (double)zoomDecelerationRate
{
  return self->_zoomDecelerationRate;
}

- (double)cardsAspectRatio
{
  return self->_cardsAspectRatio;
}

- (double)cardsCornerRadius
{
  return self->_cardsCornerRadius;
}

- (double)cardsInteritemSpacing
{
  return self->_cardsInteritemSpacing;
}

- (double)panoramaRegularInteritemSpacing
{
  return self->_panoramaRegularInteritemSpacing;
}

- (double)darkModeCornerRadius
{
  return self->_darkModeCornerRadius;
}

- (double)darkModeInteritemSpacing
{
  return self->_darkModeInteritemSpacing;
}

- (void)setColumns:(id)a3
{
}

- (int64_t)columnsChoiceIndex
{
  return self->_columnsChoiceIndex;
}

- (double)zoomingHeaderTintOpacity
{
  return self->_zoomingHeaderTintOpacity;
}

- (double)headerSpaceMinimumScreensOfContent
{
  return self->_headerSpaceMinimumScreensOfContent;
}

- (double)decadesDensityScale
{
  return self->_decadesDensityScale;
}

- (BOOL)tapsZoomsToLastIndividualDensity
{
  return self->_tapsZoomsToLastIndividualDensity;
}

- (BOOL)enableDenseLevelsInSelectMode
{
  return self->_enableDenseLevelsInSelectMode;
}

- (BOOL)enableCrossfadeFallback
{
  return self->_enableCrossfadeFallback;
}

- (BOOL)enableHeaderBlur
{
  return self->_enableHeaderBlur;
}

- (BOOL)enablePinch
{
  return self->_enablePinch;
}

- (NSArray)columns
{
  objc_super v3 = +[PXZoomablePhotosSettings columnChoices];
  unint64_t v4 = [(PXZoomablePhotosSettings *)self columnsChoiceIndex];
  uint64_t v5 = [v3 count];
  if (v4 >= v5 - 1) {
    unint64_t v6 = v5 - 1;
  }
  else {
    unint64_t v6 = v4;
  }
  v7 = [v3 objectAtIndexedSubscript:v6];

  return (NSArray *)v7;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (NSArray)columnChoices
{
  if (columnChoices_onceToken != -1) {
    dispatch_once(&columnChoices_onceToken, &__block_literal_global_7_25676);
  }
  id v2 = (void *)columnChoices_columnChoices;
  return (NSArray *)v2;
}

void __41__PXZoomablePhotosSettings_columnChoices__block_invoke()
{
  uint64_t v0 = (void *)columnChoices_columnChoices;
  columnChoices_columnChoices = (uint64_t)&unk_1F02D3568;
}

+ (NSArray)validColumns
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (validColumns_onceToken != -1) {
    dispatch_once(&validColumns_onceToken, block);
  }
  id v2 = (void *)validColumns_validColumns;
  return (NSArray *)v2;
}

void __40__PXZoomablePhotosSettings_validColumns__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_super v3 = [*(id *)(a1 + 32) columnChoices];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke_2;
  v8[3] = &unk_1E5DB16E8;
  id v9 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v8];

  uint64_t v5 = [v4 allObjects];
  uint64_t v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  v7 = (void *)validColumns_validColumns;
  validColumns_validColumns = v6;
}

void __40__PXZoomablePhotosSettings_validColumns__block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PXZoomablePhotosSettings_validColumns__block_invoke_3;
  v3[3] = &unk_1E5DC3FF8;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

uint64_t __40__PXZoomablePhotosSettings_validColumns__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end