@interface PXStoryConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration;
- (BOOL)_checkForceFlexMusicSettingForAssetCollection:(id)a3;
- (BOOL)activeStateManagedExternally;
- (BOOL)allowInactiveAppearance;
- (BOOL)allowPlayingMultipleStoriesSimultaneously;
- (BOOL)allowsVerticalGestures;
- (BOOL)disableBufferingController;
- (BOOL)disableNUp;
- (BOOL)disableVideoPlayback;
- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
- (BOOL)isAllowedToPlayAnyMusicOrSound;
- (BOOL)isAllowedToPlayAppleMusic;
- (BOOL)isAppleMusicPreview;
- (BOOL)isExportPreview;
- (BOOL)isLetterboxingAllowed;
- (BOOL)isPresentedForAirPlay;
- (BOOL)isRelated;
- (BOOL)nUpCompositionIgnoresOverallTargetDuration;
- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
- (BOOL)preferFaceCrops;
- (BOOL)shouldDismissAtEnd;
- (BOOL)shouldFadeToBlackAtEnd;
- (BOOL)shouldForceUsingFlexMusic;
- (BOOL)shouldReplayAtEnd;
- (BOOL)useLowMemoryMode;
- (BOOL)usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets;
- (BOOL)wantsFeedbackAction;
- (NSArray)referencePersons;
- (NSIndexSet)allowedTransitionKinds;
- (NSMutableDictionary)userInfo;
- (NSString)description;
- (NSString)launchType;
- (OS_dispatch_queue)storyQueue;
- (OS_os_log)log;
- (PFStoryRecipe)persistableRecipe;
- (PHPhotoLibrary)photoLibrary;
- (PXAnonymousViewController)presentingViewController;
- (PXAppleMusicStatusProvider)appleMusicStatusProvider;
- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate;
- (PXDisplayAsset)desiredStartAsset;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)assets;
- (PXDisplayAssetFetchResult)keyAsset;
- (PXMediaProvider)mediaProvider;
- (PXStoryAutoCurationProducer)autoCurationProducer;
- (PXStoryConfiguration)init;
- (PXStoryConfiguration)initWithAssetCollection:(id)a3;
- (PXStoryConfiguration)initWithAssetCollection:(id)a3 assets:(id)a4 keyAsset:(id)a5 referencePersons:(id)a6 persistableRecipe:(id)a7 musicCurationProvider:(id)a8 errorRepository:(id)a9 queue:(id)a10 parentConfiguration:(id)a11;
- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4;
- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5;
- (PXStoryConfiguration)initWithAssets:(id)a3;
- (PXStoryConfiguration)initWithAssets:(id)a3 keyAsset:(id)a4 persistableRecipe:(id)a5;
- (PXStoryConfiguration)initWithPersistableRecipe:(id)a3;
- (PXStoryConfiguration)initWithSyntheticAsset;
- (PXStoryConfiguration)initWithSyntheticAssetCount:(int64_t)a3;
- (PXStoryConfiguration)parentConfiguration;
- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryErrorRepository)errorRepository;
- (PXStoryMusicCurationProvider)musicCurationProvider;
- (PXStoryPhotoKitAssetContainer)photoKitAssetContainer;
- (PXStoryRelatedProducer)relatedProducer;
- (PXStorySongsConfiguration)songsConfiguration;
- (PXStoryStyleProducer)styleProducer;
- (PXStoryTimelineProducer)timelineProducer;
- (PXTapToRadarDiagnosticProvider)containerTapToRadarDiagnosticsProvider;
- (PXUserDefaultsDataSource)userDefaults;
- (PXVolumeController)volumeController;
- (double)kenBurnsPanSpeed;
- (double)kenBurnsScaleSpeed;
- (double)noncriticalBufferingTimeout;
- (double)overlayBlurRadius;
- (double)videoPlaybackRate;
- (id)copyForMusicPreviewWithCuratedSongs:(id)a3;
- (id)copyWithAdditionalOptions:(unint64_t)a3;
- (id)copyWithAssetCollection:(id)a3;
- (id)copyWithKeyAsset:(id)a3;
- (id)copyWithParentConfiguration:(id)a3;
- (id)copyWithStoryQueue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)originalContainer;
- (id)originalCurationContext;
- (int64_t)collectionPersistenceConfirmationStyle;
- (int64_t)curationKind;
- (int64_t)initialViewMode;
- (int64_t)keyAssetAspectRatioOverride;
- (int64_t)movementAnimationCurve;
- (int64_t)otherAssetsAspectRatioOverride;
- (int64_t)songsProducerKind;
- (unint64_t)allowedInlineTitles;
- (unint64_t)disabledClipMotionStyles;
- (unint64_t)forcedKenBurnsScaleDirection;
- (unint64_t)keyAssetKenBurnsPanDirection;
- (unint64_t)keyAssetKenBurnsScaleDirection;
- (unint64_t)logContext;
- (unint64_t)options;
- (void)_copyPropertiesFromConfiguration:(id)a3;
- (void)configureWithNavigationSource:(id)a3;
- (void)setActiveStateManagedExternally:(BOOL)a3;
- (void)setAllowInactiveAppearance:(BOOL)a3;
- (void)setAllowPlayingMultipleStoriesSimultaneously:(BOOL)a3;
- (void)setAllowedInlineTitles:(unint64_t)a3;
- (void)setAllowedTransitionKinds:(id)a3;
- (void)setAllowsVerticalGestures:(BOOL)a3;
- (void)setAppleMusicStatusProvider:(id)a3;
- (void)setAssetCollectionActionPerformerDelegate:(id)a3;
- (void)setAutoCurationProducer:(id)a3;
- (void)setCollectionPersistenceConfirmationStyle:(int64_t)a3;
- (void)setContainerTapToRadarDiagnosticsProvider:(id)a3;
- (void)setCurationKind:(int64_t)a3;
- (void)setDesiredStartAsset:(id)a3;
- (void)setDetailedSaliencyProducer:(id)a3;
- (void)setDisableBufferingController:(BOOL)a3;
- (void)setDisableNUp:(BOOL)a3;
- (void)setDisableVideoPlayback:(BOOL)a3;
- (void)setDisabledClipMotionStyles:(unint64_t)a3;
- (void)setFixedSegmentDuration:(id *)a3;
- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3;
- (void)setForcedKenBurnsScaleDirection:(unint64_t)a3;
- (void)setInitialViewMode:(int64_t)a3;
- (void)setIsAllowedToPlayAnyMusicOrSound:(BOOL)a3;
- (void)setIsAllowedToPlayAppleMusic:(BOOL)a3;
- (void)setIsLetterboxingAllowed:(BOOL)a3;
- (void)setKenBurnsPanSpeed:(double)a3;
- (void)setKenBurnsScaleSpeed:(double)a3;
- (void)setKeyAssetAspectRatioOverride:(int64_t)a3;
- (void)setKeyAssetKenBurnsPanDirection:(unint64_t)a3;
- (void)setKeyAssetKenBurnsScaleDirection:(unint64_t)a3;
- (void)setLaunchType:(id)a3;
- (void)setLog:(id)a3;
- (void)setLogContext:(unint64_t)a3;
- (void)setMediaProvider:(id)a3;
- (void)setMovementAnimationCurve:(int64_t)a3;
- (void)setMusicCurationProvider:(id)a3;
- (void)setNUpCompositionIgnoresOverallTargetDuration:(BOOL)a3;
- (void)setNoncriticalBufferingTimeout:(double)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setOriginalContainer:(id)a3;
- (void)setOriginalCurationContext:(id)a3;
- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3;
- (void)setOverlayBlurRadius:(double)a3;
- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3;
- (void)setPreferFaceCrops:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRelatedProducer:(id)a3;
- (void)setShouldForceUsingFlexMusic:(BOOL)a3;
- (void)setSongsConfiguration:(id)a3;
- (void)setSongsProducerKind:(int64_t)a3;
- (void)setStyleProducer:(id)a3;
- (void)setTimelineProducer:(id)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)setVideoPlaybackRate:(double)a3;
- (void)setVolumeController:(id)a3;
- (void)setWantsFeedbackAction:(BOOL)a3;
- (void)swift_copyPropertiesFromConfiguration:(id)a3;
@end

@implementation PXStoryConfiguration

- (void)swift_copyPropertiesFromConfiguration:(id)a3
{
}

- (PXStoryConfiguration)initWithSyntheticAssetCount:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  if (a3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = objc_alloc((Class)off_1E5DA94B0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__PXStoryConfiguration_Synthetic__initWithSyntheticAssetCount___block_invoke;
      v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableSyntheticAsset__8l;
      v9[4] = v5;
      v7 = (void *)[v6 initWithConfiguration:v9];
      [v4 addObject:v7];

      ++v5;
    }
    while (a3 != v5);
  }
  PXDisplayAssetFetchResultFromArray();
}

void __63__PXStoryConfiguration_Synthetic__initWithSyntheticAssetCount___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (id)objc_msgSend([v3 alloc], "initWithFormat:", @"A%li", *(void *)(a1 + 32));
  [v4 setLabel:v5];
}

- (PXStoryConfiguration)initWithSyntheticAsset
{
  return [(PXStoryConfiguration *)self initWithSyntheticAssetCount:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_desiredStartAsset, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_launchType, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, 0);
  objc_storeStrong((id *)&self->_songsConfiguration, 0);
  objc_storeStrong(&self->_originalCurationContext, 0);
  objc_storeStrong(&self->_originalContainer, 0);
  objc_storeStrong((id *)&self->_parentConfiguration, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_errorRepository, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
  objc_destroyWeak((id *)&self->_containerTapToRadarDiagnosticsProvider);
  objc_destroyWeak((id *)&self->_assetCollectionActionPerformerDelegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_autoCurationProducer, 0);
  objc_storeStrong((id *)&self->_relatedProducer, 0);
  objc_storeStrong((id *)&self->_styleProducer, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_appleMusicStatusProvider, 0);
  objc_storeStrong((id *)&self->_musicCurationProvider, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setAllowPlayingMultipleStoriesSimultaneously:(BOOL)a3
{
  self->_allowPlayingMultipleStoriesSimultaneously = a3;
}

- (BOOL)allowPlayingMultipleStoriesSimultaneously
{
  return self->_allowPlayingMultipleStoriesSimultaneously;
}

- (void)setDesiredStartAsset:(id)a3
{
}

- (PXDisplayAsset)desiredStartAsset
{
  return self->_desiredStartAsset;
}

- (void)setOverlayBlurRadius:(double)a3
{
  self->_overlayBlurRadius = a3;
}

- (double)overlayBlurRadius
{
  return self->_overlayBlurRadius;
}

- (void)setVideoPlaybackRate:(double)a3
{
  self->_videoPlaybackRate = a3;
}

- (double)videoPlaybackRate
{
  return self->_videoPlaybackRate;
}

- (void)setKeyAssetKenBurnsPanDirection:(unint64_t)a3
{
  self->_keyAssetKenBurnsPanDirection = a3;
}

- (unint64_t)keyAssetKenBurnsPanDirection
{
  return self->_keyAssetKenBurnsPanDirection;
}

- (void)setKeyAssetKenBurnsScaleDirection:(unint64_t)a3
{
  self->_keyAssetKenBurnsScaleDirection = a3;
}

- (unint64_t)keyAssetKenBurnsScaleDirection
{
  return self->_keyAssetKenBurnsScaleDirection;
}

- (void)setForcedKenBurnsScaleDirection:(unint64_t)a3
{
  self->_forcedKenBurnsScaleDirection = a3;
}

- (unint64_t)forcedKenBurnsScaleDirection
{
  return self->_forcedKenBurnsScaleDirection;
}

- (void)setActiveStateManagedExternally:(BOOL)a3
{
  self->_activeStateManagedExternally = a3;
}

- (BOOL)activeStateManagedExternally
{
  return self->_activeStateManagedExternally;
}

- (void)setAllowsVerticalGestures:(BOOL)a3
{
  self->_allowsVerticalGestures = a3;
}

- (BOOL)allowsVerticalGestures
{
  return self->_allowsVerticalGestures;
}

- (void)setWantsFeedbackAction:(BOOL)a3
{
  self->_wantsFeedbackAction = a3;
}

- (BOOL)wantsFeedbackAction
{
  return self->_wantsFeedbackAction;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setCollectionPersistenceConfirmationStyle:(int64_t)a3
{
  self->_collectionPersistenceConfirmationStyle = a3;
}

- (int64_t)collectionPersistenceConfirmationStyle
{
  return self->_collectionPersistenceConfirmationStyle;
}

- (void)setFixedSegmentDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_fixedSegmentDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fixedSegmentDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 424);
  return self;
}

- (void)setUserDefaults:(id)a3
{
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (void)setVolumeController:(id)a3
{
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setLaunchType:(id)a3
{
}

- (NSString)launchType
{
  return self->_launchType;
}

- (void)setDisableBufferingController:(BOOL)a3
{
  self->_disableBufferingController = a3;
}

- (BOOL)disableBufferingController
{
  return self->_disableBufferingController;
}

- (void)setDetailedSaliencyProducer:(id)a3
{
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (void)setSongsProducerKind:(int64_t)a3
{
  self->_songsProducerKind = a3;
}

- (int64_t)songsProducerKind
{
  return self->_songsProducerKind;
}

- (void)setSongsConfiguration:(id)a3
{
}

- (PXStorySongsConfiguration)songsConfiguration
{
  return self->_songsConfiguration;
}

- (void)setOriginalCurationContext:(id)a3
{
}

- (id)originalCurationContext
{
  return self->_originalCurationContext;
}

- (void)setOriginalContainer:(id)a3
{
}

- (id)originalContainer
{
  return self->_originalContainer;
}

- (PXStoryConfiguration)parentConfiguration
{
  return self->_parentConfiguration;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (PXStoryErrorRepository)errorRepository
{
  return self->_errorRepository;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (PXDisplayAssetFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (void)setAllowInactiveAppearance:(BOOL)a3
{
  self->_allowInactiveAppearance = a3;
}

- (BOOL)allowInactiveAppearance
{
  return self->_allowInactiveAppearance;
}

- (void)setMovementAnimationCurve:(int64_t)a3
{
  self->_movementAnimationCurve = a3;
}

- (int64_t)movementAnimationCurve
{
  return self->_movementAnimationCurve;
}

- (void)setDisableVideoPlayback:(BOOL)a3
{
  self->_disableVideoPlayback = a3;
}

- (BOOL)disableVideoPlayback
{
  return self->_disableVideoPlayback;
}

- (void)setNoncriticalBufferingTimeout:(double)a3
{
  self->_noncriticalBufferingTimeout = a3;
}

- (double)noncriticalBufferingTimeout
{
  return self->_noncriticalBufferingTimeout;
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (void)setPreferFaceCrops:(BOOL)a3
{
  self->_preferFaceCrops = a3;
}

- (BOOL)preferFaceCrops
{
  return self->_preferFaceCrops;
}

- (void)setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:(BOOL)a3
{
  self->_usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets = a3;
}

- (BOOL)usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets
{
  return self->_usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets;
}

- (void)setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:(BOOL)a3
{
  self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = a3;
}

- (BOOL)forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset
{
  return self->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset;
}

- (void)setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:(BOOL)a3
{
  self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = a3;
}

- (BOOL)preferAssetLocationAndCreationDateForClipTitleAndSubtitle
{
  return self->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle;
}

- (void)setOtherAssetsAspectRatioOverride:(int64_t)a3
{
  self->_otherAssetsAspectRatioOverride = a3;
}

- (int64_t)otherAssetsAspectRatioOverride
{
  return self->_otherAssetsAspectRatioOverride;
}

- (void)setKeyAssetAspectRatioOverride:(int64_t)a3
{
  self->_keyAssetAspectRatioOverride = a3;
}

- (int64_t)keyAssetAspectRatioOverride
{
  return self->_keyAssetAspectRatioOverride;
}

- (void)setAllowedTransitionKinds:(id)a3
{
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (void)setAllowedInlineTitles:(unint64_t)a3
{
  self->_allowedInlineTitles = a3;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- (void)setIsLetterboxingAllowed:(BOOL)a3
{
  self->_isLetterboxingAllowed = a3;
}

- (BOOL)isLetterboxingAllowed
{
  return self->_isLetterboxingAllowed;
}

- (void)setDisabledClipMotionStyles:(unint64_t)a3
{
  self->_disabledClipMotionStyles = a3;
}

- (unint64_t)disabledClipMotionStyles
{
  return self->_disabledClipMotionStyles;
}

- (void)setDisableNUp:(BOOL)a3
{
  self->_disableNUp = a3;
}

- (BOOL)disableNUp
{
  return self->_disableNUp;
}

- (void)setNUpCompositionIgnoresOverallTargetDuration:(BOOL)a3
{
  self->_nUpCompositionIgnoresOverallTargetDuration = a3;
}

- (BOOL)nUpCompositionIgnoresOverallTargetDuration
{
  return self->_nUpCompositionIgnoresOverallTargetDuration;
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (void)setIsAllowedToPlayAppleMusic:(BOOL)a3
{
  self->_isAllowedToPlayAppleMusic = a3;
}

- (BOOL)isAllowedToPlayAppleMusic
{
  return self->_isAllowedToPlayAppleMusic;
}

- (void)setShouldForceUsingFlexMusic:(BOOL)a3
{
  self->_shouldForceUsingFlexMusic = a3;
}

- (BOOL)shouldForceUsingFlexMusic
{
  return self->_shouldForceUsingFlexMusic;
}

- (void)setIsAllowedToPlayAnyMusicOrSound:(BOOL)a3
{
  self->_isAllowedToPlayAnyMusicOrSound = a3;
}

- (BOOL)isAllowedToPlayAnyMusicOrSound
{
  return self->_isAllowedToPlayAnyMusicOrSound;
}

- (void)setInitialViewMode:(int64_t)a3
{
  self->_initialViewMode = a3;
}

- (int64_t)initialViewMode
{
  return self->_initialViewMode;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setContainerTapToRadarDiagnosticsProvider:(id)a3
{
}

- (PXTapToRadarDiagnosticProvider)containerTapToRadarDiagnosticsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerTapToRadarDiagnosticsProvider);
  return (PXTapToRadarDiagnosticProvider *)WeakRetained;
}

- (void)setAssetCollectionActionPerformerDelegate:(id)a3
{
}

- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCollectionActionPerformerDelegate);
  return (PXAssetCollectionActionPerformerDelegate *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (PXAnonymousViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PXAnonymousViewController *)WeakRetained;
}

- (void)setAutoCurationProducer:(id)a3
{
}

- (PXStoryAutoCurationProducer)autoCurationProducer
{
  return self->_autoCurationProducer;
}

- (void)setRelatedProducer:(id)a3
{
}

- (PXStoryRelatedProducer)relatedProducer
{
  return self->_relatedProducer;
}

- (void)setStyleProducer:(id)a3
{
}

- (PXStoryStyleProducer)styleProducer
{
  return self->_styleProducer;
}

- (void)setTimelineProducer:(id)a3
{
}

- (PXStoryTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (void)setAppleMusicStatusProvider:(id)a3
{
}

- (PXAppleMusicStatusProvider)appleMusicStatusProvider
{
  return self->_appleMusicStatusProvider;
}

- (void)setMusicCurationProvider:(id)a3
{
}

- (PXStoryMusicCurationProvider)musicCurationProvider
{
  return self->_musicCurationProvider;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v15 = objc_alloc((Class)objc_opt_class());
  v14 = [(PXStoryConfiguration *)self assetCollection];
  id v4 = [(PXStoryConfiguration *)self assets];
  id v5 = [(PXStoryConfiguration *)self keyAsset];
  id v6 = [(PXStoryConfiguration *)self referencePersons];
  v7 = [(PXStoryConfiguration *)self persistableRecipe];
  v8 = [(PXStoryConfiguration *)self musicCurationProvider];
  v9 = [(PXStoryConfiguration *)self errorRepository];
  v10 = [(PXStoryConfiguration *)self storyQueue];
  v11 = [(PXStoryConfiguration *)self parentConfiguration];
  v12 = (void *)[v15 initWithAssetCollection:v14 assets:v4 keyAsset:v5 referencePersons:v6 persistableRecipe:v7 musicCurationProvider:v8 errorRepository:v9 queue:v10 parentConfiguration:v11];

  [v12 _copyPropertiesFromConfiguration:self];
  objc_msgSend(v12, "setLogContext:", -[PXStoryConfiguration logContext](self, "logContext"));
  return v12;
}

- (id)copyWithAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(PXStoryConfiguration *)self errorRepository];
  v7 = [(PXStoryConfiguration *)self storyQueue];
  v8 = [(PXStoryConfiguration *)self parentConfiguration];
  v9 = (void *)[v5 initWithAssetCollection:v4 assets:0 keyAsset:0 referencePersons:0 persistableRecipe:0 musicCurationProvider:0 errorRepository:v6 queue:v7 parentConfiguration:v8];

  [v9 _copyPropertiesFromConfiguration:self];
  return v9;
}

- (void)_copyPropertiesFromConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, *((id *)a3 + 5));
  id v5 = a3;
  id v6 = [v5 userInfo];
  v7 = (NSMutableDictionary *)[v6 mutableCopy];
  userInfo = self->_userInfo;
  self->_userInfo = v7;

  v9 = [v5 timelineProducer];
  [(PXStoryConfiguration *)self setTimelineProducer:v9];

  v10 = [v5 styleProducer];
  [(PXStoryConfiguration *)self setStyleProducer:v10];

  v11 = [v5 relatedProducer];
  [(PXStoryConfiguration *)self setRelatedProducer:v11];

  v12 = [v5 autoCurationProducer];
  [(PXStoryConfiguration *)self setAutoCurationProducer:v12];

  -[PXStoryConfiguration setOptions:](self, "setOptions:", [v5 options]);
  v13 = [v5 launchType];
  [(PXStoryConfiguration *)self setLaunchType:v13];

  v14 = [v5 originalContainer];
  [(PXStoryConfiguration *)self setOriginalContainer:v14];

  id v15 = [v5 originalCurationContext];
  [(PXStoryConfiguration *)self setOriginalCurationContext:v15];

  v16 = [v5 songsConfiguration];
  [(PXStoryConfiguration *)self setSongsConfiguration:v16];

  -[PXStoryConfiguration setSongsProducerKind:](self, "setSongsProducerKind:", [v5 songsProducerKind]);
  v17 = [v5 detailedSaliencyProducer];
  [(PXStoryConfiguration *)self setDetailedSaliencyProducer:v17];

  -[PXStoryConfiguration setDisableBufferingController:](self, "setDisableBufferingController:", [v5 disableBufferingController]);
  v18 = [v5 presentingViewController];
  [(PXStoryConfiguration *)self setPresentingViewController:v18];

  v19 = [v5 assetCollectionActionPerformerDelegate];
  [(PXStoryConfiguration *)self setAssetCollectionActionPerformerDelegate:v19];

  v20 = [v5 containerTapToRadarDiagnosticsProvider];
  [(PXStoryConfiguration *)self setContainerTapToRadarDiagnosticsProvider:v20];

  -[PXStoryConfiguration setInitialViewMode:](self, "setInitialViewMode:", [v5 initialViewMode]);
  v21 = [v5 musicCurationProvider];
  [(PXStoryConfiguration *)self setMusicCurationProvider:v21];

  v22 = [v5 log];
  [(PXStoryConfiguration *)self setLog:v22];

  v23 = [v5 appleMusicStatusProvider];
  [(PXStoryConfiguration *)self setAppleMusicStatusProvider:v23];

  [v5 fixedSegmentDuration];
  long long v26 = v28;
  uint64_t v27 = v29;
  [(PXStoryConfiguration *)self setFixedSegmentDuration:&v26];
  -[PXStoryConfiguration setAllowedInlineTitles:](self, "setAllowedInlineTitles:", [v5 allowedInlineTitles]);
  -[PXStoryConfiguration setCurationKind:](self, "setCurationKind:", [v5 curationKind]);
  -[PXStoryConfiguration setNUpCompositionIgnoresOverallTargetDuration:](self, "setNUpCompositionIgnoresOverallTargetDuration:", [v5 nUpCompositionIgnoresOverallTargetDuration]);
  -[PXStoryConfiguration setDisableNUp:](self, "setDisableNUp:", [v5 disableNUp]);
  -[PXStoryConfiguration setDisabledClipMotionStyles:](self, "setDisabledClipMotionStyles:", [v5 disabledClipMotionStyles]);
  -[PXStoryConfiguration setIsLetterboxingAllowed:](self, "setIsLetterboxingAllowed:", [v5 isLetterboxingAllowed]);
  v24 = [v5 allowedTransitionKinds];
  [(PXStoryConfiguration *)self setAllowedTransitionKinds:v24];

  -[PXStoryConfiguration setKeyAssetAspectRatioOverride:](self, "setKeyAssetAspectRatioOverride:", [v5 keyAssetAspectRatioOverride]);
  -[PXStoryConfiguration setOtherAssetsAspectRatioOverride:](self, "setOtherAssetsAspectRatioOverride:", [v5 otherAssetsAspectRatioOverride]);
  -[PXStoryConfiguration setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:](self, "setPreferAssetLocationAndCreationDateForClipTitleAndSubtitle:", [v5 preferAssetLocationAndCreationDateForClipTitleAndSubtitle]);
  -[PXStoryConfiguration setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:](self, "setForcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset:", [v5 forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset]);
  -[PXStoryConfiguration setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:](self, "setUsePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets:", [v5 usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets]);
  -[PXStoryConfiguration setPreferFaceCrops:](self, "setPreferFaceCrops:", [v5 preferFaceCrops]);
  [v5 kenBurnsPanSpeed];
  -[PXStoryConfiguration setKenBurnsPanSpeed:](self, "setKenBurnsPanSpeed:");
  [v5 kenBurnsScaleSpeed];
  -[PXStoryConfiguration setKenBurnsScaleSpeed:](self, "setKenBurnsScaleSpeed:");
  v25 = [v5 desiredStartAsset];
  [(PXStoryConfiguration *)self setDesiredStartAsset:v25];

  [v5 noncriticalBufferingTimeout];
  [(PXStoryConfiguration *)self setNoncriticalBufferingTimeout:"setNoncriticalBufferingTimeout:"];
  -[PXStoryConfiguration setAllowPlayingMultipleStoriesSimultaneously:](self, "setAllowPlayingMultipleStoriesSimultaneously:", [v5 allowPlayingMultipleStoriesSimultaneously]);
  -[PXStoryConfiguration setDisableVideoPlayback:](self, "setDisableVideoPlayback:", [v5 disableVideoPlayback]);
  [v5 overlayBlurRadius];
  -[PXStoryConfiguration setOverlayBlurRadius:](self, "setOverlayBlurRadius:");
  -[PXStoryConfiguration setMovementAnimationCurve:](self, "setMovementAnimationCurve:", [v5 movementAnimationCurve]);
  -[PXStoryConfiguration setCollectionPersistenceConfirmationStyle:](self, "setCollectionPersistenceConfirmationStyle:", [v5 collectionPersistenceConfirmationStyle]);
  -[PXStoryConfiguration setUseLowMemoryMode:](self, "setUseLowMemoryMode:", [v5 useLowMemoryMode]);
  -[PXStoryConfiguration setForcedKenBurnsScaleDirection:](self, "setForcedKenBurnsScaleDirection:", [v5 forcedKenBurnsScaleDirection]);
  -[PXStoryConfiguration setKeyAssetKenBurnsScaleDirection:](self, "setKeyAssetKenBurnsScaleDirection:", [v5 keyAssetKenBurnsScaleDirection]);
  -[PXStoryConfiguration setKeyAssetKenBurnsPanDirection:](self, "setKeyAssetKenBurnsPanDirection:", [v5 keyAssetKenBurnsPanDirection]);
  -[PXStoryConfiguration setWantsFeedbackAction:](self, "setWantsFeedbackAction:", [v5 wantsFeedbackAction]);
  -[PXStoryConfiguration setAllowsVerticalGestures:](self, "setAllowsVerticalGestures:", [v5 allowsVerticalGestures]);
  -[PXStoryConfiguration setActiveStateManagedExternally:](self, "setActiveStateManagedExternally:", [v5 activeStateManagedExternally]);
  -[PXStoryConfiguration setIsAllowedToPlayAnyMusicOrSound:](self, "setIsAllowedToPlayAnyMusicOrSound:", [v5 isAllowedToPlayAnyMusicOrSound]);
  -[PXStoryConfiguration setShouldForceUsingFlexMusic:](self, "setShouldForceUsingFlexMusic:", [v5 shouldForceUsingFlexMusic]);
  -[PXStoryConfiguration setIsAllowedToPlayAppleMusic:](self, "setIsAllowedToPlayAppleMusic:", [v5 isAllowedToPlayAppleMusic]);
  [v5 videoPlaybackRate];
  -[PXStoryConfiguration setVideoPlaybackRate:](self, "setVideoPlaybackRate:");
  -[PXStoryConfiguration setAllowInactiveAppearance:](self, "setAllowInactiveAppearance:", [v5 allowInactiveAppearance]);
  [(PXStoryConfiguration *)self swift_copyPropertiesFromConfiguration:v5];
}

- (id)copyWithKeyAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryConfiguration *)self keyAsset];
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  id v6 = v5;
  int v7 = [v4 isEqual:v5];

  if (v7)
  {
LABEL_5:
    id v15 = self;
    goto LABEL_6;
  }
  id v18 = objc_alloc((Class)objc_opt_class());
  v17 = [(PXStoryConfiguration *)self assetCollection];
  v8 = [(PXStoryConfiguration *)self assets];
  v9 = [(PXStoryConfiguration *)self referencePersons];
  v10 = [(PXStoryConfiguration *)self persistableRecipe];
  v11 = [(PXStoryConfiguration *)self musicCurationProvider];
  v12 = [(PXStoryConfiguration *)self errorRepository];
  v13 = [(PXStoryConfiguration *)self storyQueue];
  v14 = [(PXStoryConfiguration *)self parentConfiguration];
  id v15 = (PXStoryConfiguration *)[v18 initWithAssetCollection:v17 assets:v8 keyAsset:v4 referencePersons:v9 persistableRecipe:v10 musicCurationProvider:v11 errorRepository:v12 queue:v13 parentConfiguration:v14];

  [(PXStoryConfiguration *)v15 _copyPropertiesFromConfiguration:self];
LABEL_6:

  return v15;
}

- (id)copyWithParentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryConfiguration *)self parentConfiguration];
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  id v6 = v5;
  int v7 = [v4 isEqual:v5];

  if (v7)
  {
LABEL_5:
    id v15 = self;
    goto LABEL_6;
  }
  id v18 = objc_alloc((Class)objc_opt_class());
  v17 = [(PXStoryConfiguration *)self assetCollection];
  v8 = [(PXStoryConfiguration *)self assets];
  v9 = [(PXStoryConfiguration *)self keyAsset];
  v10 = [(PXStoryConfiguration *)self referencePersons];
  v11 = [(PXStoryConfiguration *)self persistableRecipe];
  v12 = [(PXStoryConfiguration *)self musicCurationProvider];
  v13 = [v4 errorRepository];
  v14 = [v4 storyQueue];
  id v15 = (PXStoryConfiguration *)[v18 initWithAssetCollection:v17 assets:v8 keyAsset:v9 referencePersons:v10 persistableRecipe:v11 musicCurationProvider:v12 errorRepository:v13 queue:v14 parentConfiguration:v4];

  [(PXStoryConfiguration *)v15 _copyPropertiesFromConfiguration:self];
LABEL_6:

  return v15;
}

- (void)configureWithNavigationSource:(id)a3
{
  id v5 = (__CFString *)a3;
  if ([(__CFString *)v5 isEqualToString:@"notification"])
  {
    id v4 = @"Notification";
  }
  else if ([(__CFString *)v5 isEqualToString:@"widget"])
  {
    id v4 = @"Widget";
  }
  else
  {
    id v4 = v5;
  }
  [(PXStoryConfiguration *)self setLaunchType:v4];
}

- (id)copyWithStoryQueue:(id)a3
{
  id v4 = a3;
  id v15 = objc_alloc((Class)objc_opt_class());
  v14 = [(PXStoryConfiguration *)self assetCollection];
  id v5 = [(PXStoryConfiguration *)self assets];
  id v6 = [(PXStoryConfiguration *)self keyAsset];
  int v7 = [(PXStoryConfiguration *)self referencePersons];
  v8 = [(PXStoryConfiguration *)self persistableRecipe];
  v9 = [(PXStoryConfiguration *)self musicCurationProvider];
  v10 = [(PXStoryConfiguration *)self errorRepository];
  v11 = [(PXStoryConfiguration *)self parentConfiguration];
  v12 = (void *)[v15 initWithAssetCollection:v14 assets:v5 keyAsset:v6 referencePersons:v7 persistableRecipe:v8 musicCurationProvider:v9 errorRepository:v10 queue:v4 parentConfiguration:v11];

  [v12 _copyPropertiesFromConfiguration:self];
  return v12;
}

- (id)copyWithAdditionalOptions:(unint64_t)a3
{
  id v4 = (void *)[(PXStoryConfiguration *)self copy];
  objc_msgSend(v4, "setOptions:", objc_msgSend(v4, "options") | a3);
  return v4;
}

- (BOOL)shouldFadeToBlackAtEnd
{
  return ([(PXStoryConfiguration *)self options] >> 12) & 1;
}

- (BOOL)shouldReplayAtEnd
{
  return ([(PXStoryConfiguration *)self options] >> 11) & 1;
}

- (BOOL)shouldDismissAtEnd
{
  return ([(PXStoryConfiguration *)self options] >> 8) & 1;
}

- (BOOL)isRelated
{
  return ([(PXStoryConfiguration *)self options] & 0xC) != 0;
}

- (BOOL)isPresentedForAirPlay
{
  return ([(PXStoryConfiguration *)self options] >> 5) & 1;
}

- (BOOL)isExportPreview
{
  return ([(PXStoryConfiguration *)self options] >> 7) & 1;
}

- (BOOL)isAppleMusicPreview
{
  return ([(PXStoryConfiguration *)self options] >> 4) & 1;
}

- (void)setMediaProvider:(id)a3
{
  id v4 = (PXMediaProvider *)a3;
  obj = self;
  objc_sync_enter(obj);
  mediaProvider = obj->_mediaProvider;
  obj->_mediaProvider = v4;

  objc_sync_exit(obj);
}

- (PXMediaProvider)mediaProvider
{
  long long v3 = self;
  objc_sync_enter(v3);
  mediaProvider = v3->_mediaProvider;
  if (!mediaProvider)
  {
    id v5 = [(PXStoryConfiguration *)v3 photoLibrary];
    if (!v5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v3, @"PXStoryConfiguration.m", 196, @"no media provider could be determined for %@", v3 object file lineNumber description];

      abort();
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F390D0]);
    int v7 = [[PXPhotoKitUIMediaProvider alloc] initWithImageManager:v6 library:v5];
    v8 = v3->_mediaProvider;
    v3->_mediaProvider = &v7->super.super;

    mediaProvider = v3->_mediaProvider;
  }
  v9 = mediaProvider;
  objc_sync_exit(v3);

  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  long long v3 = [(PXStoryConfiguration *)self assetCollection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [(PXStoryConfiguration *)self persistableRecipe];
    if (v5)
    {
      id v6 = [(PXStoryConfiguration *)self persistableRecipe];
      uint64_t v7 = +[PFStoryRecipe_PXStoryExtension PHPhotoLibraryForRecipe:v6];
    }
    else
    {
      v8 = [(PXStoryConfiguration *)self keyAsset];
      v9 = [v8 firstObject];
      v10 = v9;
      if (v9)
      {
        id v6 = v9;
      }
      else
      {
        v11 = [(PXStoryConfiguration *)self assets];
        id v6 = [v11 firstObject];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v4 = 0;
LABEL_12:

        if (v4) {
          goto LABEL_18;
        }
        goto LABEL_13;
      }
      uint64_t v7 = [v6 photoLibrary];
    }
    id v4 = (void *)v7;
    goto LABEL_12;
  }
  id v4 = [v3 photoLibrary];
  if (v4) {
    goto LABEL_18;
  }
LABEL_13:
  v12 = [(PXStoryConfiguration *)self assets];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  id v4 = [v13 photoLibrary];

LABEL_18:
  return (PHPhotoLibrary *)v4;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PXStoryConfiguration *)self assetCollection];
  uint64_t v7 = [(PXStoryConfiguration *)self assets];
  v8 = [(PXStoryConfiguration *)self keyAsset];
  v9 = [v8 firstObject];
  v10 = [(PXStoryConfiguration *)self persistableRecipe];
  v11 = (void *)[v3 initWithFormat:@"<%@: %p, assetCollection=%@ assets=%@ keyAsset=%@ persistableRecipe=%@>", v5, self, v6, v7, v9, v10];

  return (NSString *)v11;
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 assets:(id)a4 keyAsset:(id)a5 referencePersons:(id)a6 persistableRecipe:(id)a7 musicCurationProvider:(id)a8 errorRepository:(id)a9 queue:(id)a10 parentConfiguration:(id)a11
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v56 = a4;
  id v55 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v54 = a11;
  v58.receiver = self;
  v58.super_class = (Class)PXStoryConfiguration;
  v21 = [(PXStoryConfiguration *)&v58 init];
  v22 = v21;
  if (v21)
  {
    v53 = v19;
    objc_storeStrong((id *)&v21->_assetCollection, a3);
    objc_storeStrong((id *)&v22->_assets, a4);
    objc_storeStrong((id *)&v22->_keyAsset, a5);
    uint64_t v23 = [v17 copy];
    referencePersons = v22->_referencePersons;
    v22->_referencePersons = (NSArray *)v23;

    uint64_t v25 = [v18 copyWithZone:0];
    persistableRecipe = v22->_persistableRecipe;
    v22->_persistableRecipe = (PFStoryRecipe *)v25;

    if (v20)
    {
      uint64_t v27 = (OS_dispatch_queue *)v20;
      storyQueue = v22->_storyQueue;
      v22->_storyQueue = v27;
    }
    else
    {
      uint64_t v29 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v30 = MEMORY[0x1E4F14428];
      storyQueue = v22->_storyQueue;
      v22->_storyQueue = v29;
    }

    objc_storeStrong((id *)&v22->_errorRepository, a9);
    objc_storeStrong((id *)&v22->_errorReporter, a9);
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v22->_userInfo;
    v22->_userInfo = v31;

    objc_storeStrong((id *)&v22->_parentConfiguration, a11);
    v22->_initialViewMode = 1;
    v22->_songsProducerKind = 0;
    v33 = objc_alloc_init(PXStoryPhotoKitMusicCurationProvider);
    musicCurationProvider = v22->_musicCurationProvider;
    v22->_musicCurationProvider = (PXStoryMusicCurationProvider *)v33;

    v35 = +[PXStorySettings sharedInstance];
    id v36 = v20;
    if ([v35 isAppleMusicAllowed])
    {
      v37 = objc_alloc_init(PXDefaultAppleMusicStatusProvider);
      appleMusicStatusProvider = v22->_appleMusicStatusProvider;
      v22->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v37;
    }
    else
    {
      v59 = &unk_1F02D9F70;
      v60[0] = &unk_1F02D9F88;
      appleMusicStatusProvider = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
      uint64_t v39 = PXCreateDefaultAppleMusicStatusProviderWithOverrides(appleMusicStatusProvider);
      v40 = v22->_appleMusicStatusProvider;
      v22->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v39;
    }
    v22->_isAllowedToPlayAnyMusicOrSound = 1;
    v41 = +[PXStorySettings sharedInstance];
    v22->_isAllowedToPlayAppleMusic = [v41 shouldShowAppleMusicRelatedUI];

    v22->_shouldForceUsingFlexMusic = [(PXStoryConfiguration *)v22 _checkForceFlexMusicSettingForAssetCollection:v57];
    objc_storeStrong((id *)&v22->_launchType, @"Unknown");
    v22->_fixedSegmentDuration.value = 0;
    *(void *)&v22->_fixedSegmentDuration.timescale = 0;
    v22->_fixedSegmentDuration.epoch = 0;
    v22->_allowedInlineTitles = [v35 wantsTitles] << 63 >> 63;
    v22->_disableNUp = [v35 autoEditDisableNUp];
    v22->_keyAssetAspectRatioOverride = [v35 keyAssetAspectRatioOverride];
    v22->_otherAssetsAspectRatioOverride = [v35 otherAssetsAspectRatioOverride];
    v22->_disabledClipMotionStyles = [v35 disabledClipMotionStyles];
    v22->_isLetterboxingAllowed = 1;
    v22->_preferAssetLocationAndCreationDateForClipTitleAndSubtitle = [v35 preferAssetLocationAndCreationDateForClipTitleAndSubtitle];
    v22->_forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset = [v35 forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset];
    [v35 noncriticalBufferingTimeout];
    v22->_noncriticalBufferingTimeout = v42;
    v22->_disableVideoPlayback = [v35 disableVideoPlayback];
    v22->_movementAnimationCurve = [v35 movementAnimationCurve];
    v22->_collectionPersistenceConfirmationStyle = 1;
    v43 = +[PXStoryConcreteTimelineSettings sharedInstance];
    [v43 kenBurnsPanSpeed];
    v22->_kenBurnsPanSpeed = v44;
    [v43 kenBurnsScaleSpeed];
    v22->_kenBurnsScaleSpeed = v45;
    v22->_allowPlayingMultipleStoriesSimultaneously = 0;
    v22->_keyAssetKenBurnsScaleDirection = 0;
    v22->_keyAssetKenBurnsPanDirection = 0;
    v22->_forcedKenBurnsScaleDirection = 0;
    unint64_t v46 = (unint64_t)v57;
    if (objc_opt_class())
    {
      unint64_t v47 = (unint64_t)v18;
      if (objc_opt_isKindOfClass()) {
        id v48 = (id)v46;
      }
      else {
        id v48 = 0;
      }
    }
    else
    {
      id v48 = 0;
      unint64_t v47 = (unint64_t)v18;
    }

    v22->_wantsFeedbackAction = [v48 isGenerative];
    v22->_allowsVerticalGestures = 1;
    *(_OWORD *)&v22->_videoPlaybackRate = xmmword_1AB2F54C0;
    v22->_curationKind = 2;
    if (!(v46 | v47)) {
      v22->_nUpCompositionIgnoresOverallTargetDuration = v56 != 0;
    }
    id v19 = v53;
    if (initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__onceToken != -1) {
      dispatch_once(&initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__onceToken, &__block_literal_global_275846);
    }
    v22->_logContext = (int)atomic_fetch_add(initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__contextId, 1u);
    uint64_t v49 = PLStoryGetLog();
    log = v22->_log;
    v22->_log = (OS_os_log *)v49;

    v51 = [(PXStoryConfiguration *)v22 log];
    [v53 setLog:v51];

    objc_msgSend(v53, "setLogContext:", -[PXStoryConfiguration logContext](v22, "logContext"));
    id v20 = v36;
  }

  return v22;
}

uint64_t __163__PXStoryConfiguration_initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration___block_invoke()
{
  uint64_t result = arc4random_uniform(0xF4240u);
  atomic_store(result, (unsigned int *)initWithAssetCollection_assets_keyAsset_referencePersons_persistableRecipe_musicCurationProvider_errorRepository_queue_parentConfiguration__contextId);
  return result;
}

- (BOOL)_checkForceFlexMusicSettingForAssetCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = +[PXStorySettings sharedInstance];
  id v6 = v5;
  if (isKindOfClass)
  {
    char v7 = [v5 forceFlexForPHMemory];

    if ((v7 & 1) == 0)
    {
LABEL_3:
      v8 = PLStoryGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[LemMusic][ForceFlex] Not Enabled.", v12, 2u);
      }
      BOOL v9 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = [v5 forceFlexForNonPHMemory];

    if (!v10) {
      goto LABEL_3;
    }
  }
  v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[LemMusic][ForceFlex] Enabled via Internal Settings UI.", buf, 2u);
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (PXStoryConfiguration)initWithPersistableRecipe:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PXStoryErrorRepository);
  id v6 = [(PXStoryConfiguration *)self initWithAssetCollection:0 assets:0 keyAsset:0 referencePersons:0 persistableRecipe:v4 musicCurationProvider:0 errorRepository:v5 queue:0 parentConfiguration:0];

  return v6;
}

- (PXStoryConfiguration)initWithAssets:(id)a3 keyAsset:(id)a4 persistableRecipe:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(PXStoryErrorRepository);
  v12 = [(PXStoryConfiguration *)self initWithAssetCollection:0 assets:v10 keyAsset:v9 referencePersons:0 persistableRecipe:v8 musicCurationProvider:0 errorRepository:v11 queue:0 parentConfiguration:0];

  return v12;
}

- (PXStoryConfiguration)initWithAssets:(id)a3
{
  return [(PXStoryConfiguration *)self initWithAssets:a3 keyAsset:0 persistableRecipe:0];
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(PXStoryErrorRepository);
  v12 = [(PXStoryConfiguration *)self initWithAssetCollection:v10 assets:0 keyAsset:v9 referencePersons:v8 persistableRecipe:0 musicCurationProvider:0 errorRepository:v11 queue:0 parentConfiguration:0];

  return v12;
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  return [(PXStoryConfiguration *)self initWithAssetCollection:a3 keyAsset:a4 referencePersons:0];
}

- (PXStoryConfiguration)initWithAssetCollection:(id)a3
{
  return [(PXStoryConfiguration *)self initWithAssetCollection:a3 keyAsset:0];
}

- (PXStoryConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConfiguration.m", 37, @"%s is not available as initializer", "-[PXStoryConfiguration init]");

  abort();
}

- (id)copyForMusicPreviewWithCuratedSongs:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryConfiguration *)self copyWithAdditionalOptions:16];
  [v5 setInitialViewMode:4];
  id v6 = [v4 previewConfiguration];

  [v5 setSongsConfiguration:v6];
  return v5;
}

- (PXStoryPhotoKitAssetContainer)photoKitAssetContainer
{
  id v3 = [(PXStoryConfiguration *)self assetCollection];
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_6:
    id v5 = [(PXStoryConfiguration *)self assets];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      char v7 = [v6 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v4 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v6 title:0];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v9 = [v5 firstObject];
      int v10 = [v9 isMemberOfClass:objc_opt_class()];

      if (!v10)
      {
        id v4 = 0;
        goto LABEL_17;
      }
      id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      if ([v5 count] >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          v12 = [v5 objectAtIndexedSubscript:v11];
          id v13 = [v12 objectID];
          [v6 addObject:v13];

          ++v11;
        }
        while ([v5 count] > v11);
      }
      v14 = [v5 firstObject];
      id v15 = [v14 photoLibrary];

      id v16 = objc_alloc(MEMORY[0x1E4F39150]);
      id v17 = (void *)[v6 copy];
      id v18 = (void *)[v16 initWithOids:v17 photoLibrary:v15 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

      id v4 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v18 subtype:2];
    }
LABEL_17:
  }
  id v19 = [(PXStoryConfiguration *)self originalContainer];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (v4) {
    v21 = [[PXStoryPhotoKitAssetContainer alloc] initWithAssetCollection:v4 originalContainer:v20];
  }
  else {
    v21 = 0;
  }

  return v21;
}

@end