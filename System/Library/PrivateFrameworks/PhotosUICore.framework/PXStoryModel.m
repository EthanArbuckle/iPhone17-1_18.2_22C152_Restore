@interface PXStoryModel
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)thumbnailAutoplayTimeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)nominalPlaybackTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeIntoCurrentSegment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeLeftInCurrentSegment;
- ($68D3C1A33EB7F0335689E2F183EF80A4)pressAnimationInfo;
- ($7DA682ECC7253F641496E0B6E9C98204)currentScrollPosition;
- (AVAudioSession)audioSession;
- (BOOL)allowsScrolling;
- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3;
- (BOOL)currentAssetCollectionIsFavorite;
- (BOOL)currentChapterTitleIsVisible;
- (BOOL)didPrerequestPersistencePermission;
- (BOOL)didReachOutroOnce;
- (BOOL)getMainVisibleClipIdentifier:(int64_t *)a3 assetReferece:(id *)a4;
- (BOOL)inLiveResize;
- (BOOL)isActuallyPlaying;
- (BOOL)isAsync;
- (BOOL)isAtPlaybackEnd;
- (BOOL)isExporting;
- (BOOL)isFirstSegmentVisible;
- (BOOL)isHUDVisible;
- (BOOL)isHovering;
- (BOOL)isInline;
- (BOOL)isLastSegmentVisible;
- (BOOL)isPerformingViewControllerTransition;
- (BOOL)isPresentingAnyAlert;
- (BOOL)isPresentingAssetPicker;
- (BOOL)isPresentingColorGradeEditor;
- (BOOL)isPresentingMusicEditor;
- (BOOL)isScrolling;
- (BOOL)isTouching;
- (BOOL)prefersExportLayoutMatchesPlayback;
- (BOOL)rewindToBeginning;
- (BOOL)rewindToBeginningOfCurrentSegment;
- (BOOL)setCurrentSegmentIdentifier:(int64_t)a3 timeIntoSegment:(id *)a4 timeLeftInSegment:(id *)a5 changeSource:(unint64_t)a6;
- (BOOL)shouldAspectFitCurrentSegment;
- (BOOL)shouldAutoplayThumbnail;
- (BOOL)shouldPauseTransitions;
- (BOOL)shouldUseInactiveImageFilter;
- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3;
- (BOOL)skipToSegmentWithOffset:(int64_t)a3;
- (BOOL)wantsMusicDucked;
- (CGPoint)currentGridScrollPosition;
- (NSCopying)uniqueIdentifier;
- (NSDate)persistenceConfirmationPresentationDate;
- (NSHashTable)videoPresentationControllers;
- (NSIndexSet)visibleSegmentIdentifiers;
- (NSMapTable)HUDContentProvidersByType;
- (NSSet)changesOrigins;
- (NSString)titleCategory;
- (NSString)windowSceneID;
- (NSUndoManager)undoManager;
- (OS_dispatch_queue)storyQueue;
- (PXAssetReference)lastHitAssetReference;
- (PXDisplayAsset)desiredStartAsset;
- (PXDisplayAssetCollection)currentAssetCollection;
- (PXDisplayAssetFetchResult)curatedAssets;
- (PXDisplayAssetFetchResult)untruncatedCuratedAssets;
- (PXDisplayAssetFetchResult)visibleDisplayAssets;
- (PXDisplayRect)presentedSubtitleFrame;
- (PXDisplayRect)presentedTitleFrame;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXNumberAnimator)pressedFractionAnimator;
- (PXStoryAnimationController)animationController;
- (PXStoryChapter)currentChapter;
- (PXStoryChapterCollectionManager)chapterCollectionManager;
- (PXStoryColorGradingRepository)colorGradingRepository;
- (PXStoryConfiguration)configuration;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryLayoutSpec)layoutSpec;
- (PXStoryLayoutSpecManager)layoutSpecManager;
- (PXStoryLoadingStatusReporter)loadingStatusReporter;
- (PXStoryModel)init;
- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4;
- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 loadingCoordinator:(id)a5 paperTrailOptions:(unint64_t)a6;
- (PXStoryModel)initWithTimelineManager:(id)a3 layoutSpecManager:(id)a4 configuration:(id)a5;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager;
- (PXStorySongResource)activeSongResource;
- (PXStorySongResource)currentSongResource;
- (PXStorySongResource)editorPreviewSong;
- (PXStoryStyle)currentStyle;
- (PXStoryStyleManager)styleManager;
- (PXStoryThumbnailActionPerformer)thumbnailActionPerformer;
- (PXStoryTimeline)gridTimeline;
- (PXStoryTimeline)timeline;
- (PXStoryTimelineManager)timelineManager;
- (PXStoryTimelineSpec)timelineSpec;
- (PXStoryViewModeTransition)viewModeTransition;
- (PXUpdater)updater;
- (PXVideoSessionManager)videoSessionManager;
- (double)chromeVisibilityFraction;
- (double)desiredInfoPanelVisibilityFraction;
- (double)inactiveImageFilterIntensity;
- (double)infoPanelVisibilityFraction;
- (double)outroFractionCompleted;
- (double)playbackFractionCompleted;
- (double)playbackMaxFractionCompleted;
- (double)styleSwitcherVisibilityFraction;
- (double)titleOpacity;
- (double)volume;
- (float)volumeDuringViewControllerTransition;
- (id)_appleMusicCapabilitiesDebugInformation;
- (id)_currentAssetCollectionDescriptionForHUDType:(int64_t)a3;
- (id)_musicCurationDebugInformation;
- (id)assetReferenceForClipIdentifier:(int64_t)a3;
- (id)beginMusicDucking;
- (id)currentGradeDescription;
- (id)currentSongDescription;
- (id)currentSongPaceDescription;
- (id)currentSongTagsDescription;
- (id)currentStyleDescription;
- (id)currentTimeDescription;
- (id)diagnosticDescriptionForAllHUDTypes;
- (id)diagnosticHUDContentProviderForType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3;
- (id)overallDurationChangeCompletionHandler;
- (id)photoKitAssetContainerWithAssetCollection:(id)a3;
- (int64_t)bufferingEvents;
- (int64_t)colorGradeKind;
- (int64_t)contentReadinessStatus;
- (int64_t)currentSegmentIdentifier;
- (int64_t)desiredPlayState;
- (int64_t)detailsViewButtonDisplayStyle;
- (int64_t)diagnosticHUDType;
- (int64_t)lastHitClipIdentifier;
- (int64_t)musicReadinessStatus;
- (int64_t)numberOfPresentedAlerts;
- (int64_t)persistencePermission;
- (int64_t)previousSegmentIdentifier;
- (int64_t)readinessStatus;
- (int64_t)thumbnailStyle;
- (int64_t)titleAlignment;
- (int64_t)viewMode;
- (unint64_t)lastPlaybackTimeChangeSource;
- (unint64_t)options;
- (unint64_t)timelineAttributes;
- (void)_callCompletionHandlersPendingTimelineChange;
- (void)_clearLastHitAssetClip;
- (void)_completePersistenceRequestsWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_displayCollectionPersistenceConfirmationIfNeeded;
- (void)_enumerateVisibleAssetVideoPresentationControllersUsingBlock:(id)a3;
- (void)_invalidateCurrentAssetCollection;
- (void)_invalidateCurrentStyleAndFocus;
- (void)_invalidateLayoutSpec;
- (void)_invalidateNominalPlaybackTime;
- (void)_invalidateOutroDuration;
- (void)_invalidateOutroFractionCompleted;
- (void)_invalidatePersistencePermission;
- (void)_invalidatePlaybackFractionCompleted;
- (void)_invalidatePressAnimationInfo;
- (void)_invalidatePressedFractionAnimator;
- (void)_invalidateShouldAspectFitCurrentSegment;
- (void)_invalidateTimeline;
- (void)_invalidateTimelineAttributes;
- (void)_invalidateTimelineSpec;
- (void)_invalidateWantsMusicDucked;
- (void)_setNeedsUpdate;
- (void)_updateCurrentAssetCollection;
- (void)_updateCurrentStyle;
- (void)_updateLayoutSpec;
- (void)_updateNominalPlaybackTime;
- (void)_updateOutroDuration;
- (void)_updateOutroFractionCompleted;
- (void)_updatePersistencePermission;
- (void)_updatePlaybackFractionCompleted;
- (void)_updatePressAnimationInfo;
- (void)_updatePressedFractionAnimator;
- (void)_updateShouldAspectFitCurrentSegment;
- (void)_updateTimeline;
- (void)_updateTimelineAttributes;
- (void)_updateTimelineSpec;
- (void)_updateWantsMusicDucked;
- (void)addVideoPresentationController:(id)a3;
- (void)changeOverallDuration:(int64_t)a3 completionHandler:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didEndChangeHandling;
- (void)didEndPresentingAlert;
- (void)didPerformChanges;
- (void)didStartPresentingAlert;
- (void)endMusicDuckingWithToken:(id)a3;
- (void)flickedPastEnd;
- (void)makeAssetKeyPhoto:(id)a3;
- (void)makeCurrentAssetKeyPhoto;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performChanges:(id)a3 origin:(id)a4;
- (void)performWithPrerequestedPersistencePermission:(id)a3;
- (void)prerequestPersistencePermission:(id)a3;
- (void)reconfigureWithAssetCollection:(id)a3;
- (void)removeAssetsFromCuration:(id)a3;
- (void)removeVideoPresentationController:(id)a3;
- (void)reportNetworkRelatedPlaybackFailure;
- (void)reportPersistenceFailureWithError:(id)a3;
- (void)requestPersistencePermission:(id)a3;
- (void)requestPersistencePermissionWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)restartPlaybackFromBeginning;
- (void)scrollToPosition:(id *)a3;
- (void)setActiveSongResource:(id)a3;
- (void)setAllowsScrolling:(BOOL)a3;
- (void)setAudioSession:(id)a3;
- (void)setBufferingEvents:(int64_t)a3;
- (void)setChromeVisibilityFraction:(double)a3;
- (void)setColorGradeKind:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentReadinessStatus:(int64_t)a3;
- (void)setCurrentAssetCollection:(id)a3;
- (void)setCurrentAssetCollectionIsFavorite:(BOOL)a3;
- (void)setCurrentGridScrollPosition:(CGPoint)a3;
- (void)setCurrentScrollPosition:(id *)a3;
- (void)setCurrentStyle:(id)a3;
- (void)setDesiredInfoPanelVisibilityFraction:(double)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDesiredStartAsset:(id)a3;
- (void)setDetailsViewButtonDisplayStyle:(int64_t)a3;
- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4;
- (void)setDiagnosticHUDType:(int64_t)a3;
- (void)setDidPrerequestPersistencePermission:(BOOL)a3;
- (void)setDidReachOutroOnce:(BOOL)a3;
- (void)setEditorPreviewSong:(id)a3;
- (void)setElapsedTime:(id *)a3;
- (void)setInLiveResize:(BOOL)a3;
- (void)setInactiveImageFilterIntensity:(double)a3;
- (void)setInfoPanelVisibilityFraction:(double)a3;
- (void)setIsActuallyPlaying:(BOOL)a3;
- (void)setIsAtPlaybackEnd:(BOOL)a3;
- (void)setIsHUDVisible:(BOOL)a3;
- (void)setIsHovering:(BOOL)a3;
- (void)setIsPerformingViewControllerTransition:(BOOL)a3;
- (void)setIsPresentingAnyAlert:(BOOL)a3;
- (void)setIsPresentingAssetPicker:(BOOL)a3;
- (void)setIsPresentingColorGradeEditor:(BOOL)a3;
- (void)setIsPresentingMusicEditor:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setIsTouching:(BOOL)a3;
- (void)setLastHitAssetReference:(id)a3;
- (void)setLastHitClipIdentifier:(int64_t)a3;
- (void)setLastPlaybackTimeChangeSource:(unint64_t)a3;
- (void)setLayoutSpec:(id)a3;
- (void)setMusicReadinessStatus:(int64_t)a3;
- (void)setNominalPlaybackTime:(id *)a3;
- (void)setNumberOfPresentedAlerts:(int64_t)a3;
- (void)setOutroDuration:(id *)a3;
- (void)setOutroFractionCompleted:(double)a3;
- (void)setOverallDurationChangeCompletionHandler:(id)a3;
- (void)setPersistenceConfirmationPresentationDate:(id)a3;
- (void)setPersistencePermission:(int64_t)a3;
- (void)setPlaybackDuration:(id *)a3;
- (void)setPlaybackFractionCompleted:(double)a3;
- (void)setPlaybackMaxFractionCompleted:(double)a3;
- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3;
- (void)setPresentedSubtitleFrame:(id)a3;
- (void)setPresentedTitleFrame:(id)a3;
- (void)setPressAnimationInfo:(id *)a3;
- (void)setPreviousSegmentIdentifier:(int64_t)a3;
- (void)setReadinessStatus:(int64_t)a3;
- (void)setShouldAspectFitCurrentSegment:(BOOL)a3;
- (void)setShouldAutoplayThumbnail:(BOOL)a3;
- (void)setShouldPauseTransitions:(BOOL)a3;
- (void)setStyleSwitcherVisibilityFraction:(double)a3;
- (void)setThumbnailAutoplayTimeRange:(id *)a3;
- (void)setThumbnailStyle:(int64_t)a3;
- (void)setTimeline:(id)a3;
- (void)setTimelineAttributes:(unint64_t)a3;
- (void)setTimelineSpec:(id)a3;
- (void)setTitleAlignment:(int64_t)a3;
- (void)setTitleOpacity:(double)a3;
- (void)setUndoManager:(id)a3;
- (void)setViewMode:(int64_t)a3;
- (void)setViewModeTransition:(id)a3;
- (void)setVisibleSegmentIdentifiers:(id)a3;
- (void)setVolume:(double)a3;
- (void)setVolumeDuringViewControllerTransition:(float)a3;
- (void)setWantsMusicDucked:(BOOL)a3;
- (void)setWindowSceneID:(id)a3;
@end

@implementation PXStoryModel

- (id)photoKitAssetContainerWithAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryModel *)self configuration];
  v6 = [v5 originalContainer];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [[PXStoryPhotoKitAssetContainer alloc] initWithAssetCollection:v4 originalContainer:v7];
  return v8;
}

- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 loadingCoordinator:(id)a5 paperTrailOptions:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 timelineProducer];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    PXStoryTimelineProducerCreateDefault();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = [[PXStoryRecipeManager alloc] initWithConfiguration:v9];
  v29 = [[PXStoryResourcesDataSourceManager alloc] initWithRecipeManager:v16];
  v17 = [PXStoryStyleManager alloc];
  v18 = [v9 errorReporter];
  v19 = [(PXStoryStyleManager *)v17 initWithRecipeManager:v16 errorReporter:v18];

  v20 = [[PXStoryTimelineSpecManager alloc] initWithExtendedTraitCollection:v10 configuration:v9];
  v21 = +[PXStoryTimelineManager timelineManagerWithTimelineProducer:v15 resourcesDataSourceManager:v29 styleManager:v19 specManager:v20 configuration:v9 loadingCoordinator:v11 paperTrailOptions:a6];

  v22 = -[PXStoryLayoutSpecManager initWithExtendedTraitCollection:options:storyConfigurationOptions:]([PXStoryLayoutSpecManager alloc], "initWithExtendedTraitCollection:options:storyConfigurationOptions:", v10, 0, [v9 options]);
  v23 = [(PXStoryModel *)self initWithTimelineManager:v21 layoutSpecManager:v22 configuration:v9];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__PXStoryModel_Configuration__initWithConfiguration_extendedTraitCollection_loadingCoordinator_paperTrailOptions___block_invoke;
  v31[3] = &unk_1E5DB6268;
  v32 = v16;
  id v33 = v21;
  id v34 = v9;
  id v35 = v10;
  id v24 = v10;
  id v25 = v9;
  id v26 = v21;
  v27 = v16;
  [(PXStoryModel *)v23 performChanges:v31];

  return v23;
}

void __114__PXStoryModel_Configuration__initWithConfiguration_extendedTraitCollection_loadingCoordinator_paperTrailOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:3];
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:8];
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:9];
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:10];
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 40) forType:7];
  [v3 setDiagnosticHUDContentProvider:*(void *)(a1 + 40) forType:11];
  if (([*(id *)(a1 + 48) options] & 2) != 0)
  {
    [v3 setViewMode:3];
    objc_msgSend(v3, "setThumbnailStyle:", objc_msgSend(*(id *)(a1 + 56), "userInterfaceFeature") == 1);
  }
}

- (PXStoryModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  return [(PXStoryModel *)self initWithConfiguration:a3 extendedTraitCollection:a4 loadingCoordinator:0 paperTrailOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_persistenceConfirmationPresentationDate, 0);
  objc_storeStrong((id *)&self->_desiredStartAsset, 0);
  objc_storeStrong((id *)&self->_pressedFractionAnimator, 0);
  objc_storeStrong(&self->_overallDurationChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoPresentationControllers, 0);
  objc_storeStrong((id *)&self->_HUDContentProvidersByType, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_layoutSpecManager, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingStatusReporter, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_currentAssetCollection, 0);
  objc_storeStrong((id *)&self->_activeSongResource, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_editorPreviewSong, 0);
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_lastHitAssetReference, 0);
  objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_gridTimeline, 0);
  objc_storeStrong((id *)&self->_timelineSpec, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_presentedSubtitleFrame, 0);
  objc_storeStrong((id *)&self->_presentedTitleFrame, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_thumbnailActionPerformer, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_titleCategory, 0);
  objc_storeStrong((id *)&self->_windowSceneID, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_musicDuckingTokens, 0);
  objc_storeStrong((id *)&self->_persistenceRequests, 0);
  objc_storeStrong((id *)&self->_changesOrigins, 0);
}

- (double)playbackMaxFractionCompleted
{
  return self->_playbackMaxFractionCompleted;
}

- (PXStoryTimelineManager)timelineManager
{
  return self->_timelineManager;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setPersistenceConfirmationPresentationDate:(id)a3
{
}

- (NSDate)persistenceConfirmationPresentationDate
{
  return self->_persistenceConfirmationPresentationDate;
}

- (void)setDesiredStartAsset:(id)a3
{
}

- (PXDisplayAsset)desiredStartAsset
{
  return self->_desiredStartAsset;
}

- (void)setDidPrerequestPersistencePermission:(BOOL)a3
{
  self->_didPrerequestPersistencePermission = a3;
}

- (BOOL)didPrerequestPersistencePermission
{
  return self->_didPrerequestPersistencePermission;
}

- (BOOL)didReachOutroOnce
{
  return self->_didReachOutroOnce;
}

- (PXNumberAnimator)pressedFractionAnimator
{
  return self->_pressedFractionAnimator;
}

- (int64_t)numberOfPresentedAlerts
{
  return self->_numberOfPresentedAlerts;
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (void)setOverallDurationChangeCompletionHandler:(id)a3
{
}

- (id)overallDurationChangeCompletionHandler
{
  return self->_overallDurationChangeCompletionHandler;
}

- (NSHashTable)videoPresentationControllers
{
  return self->_videoPresentationControllers;
}

- (NSMapTable)HUDContentProvidersByType
{
  return self->_HUDContentProvidersByType;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryLayoutSpecManager)layoutSpecManager
{
  return self->_layoutSpecManager;
}

- (double)infoPanelVisibilityFraction
{
  return self->_infoPanelVisibilityFraction;
}

- (double)desiredInfoPanelVisibilityFraction
{
  return self->_desiredInfoPanelVisibilityFraction;
}

- (float)volumeDuringViewControllerTransition
{
  return self->_volumeDuringViewControllerTransition;
}

- (double)volume
{
  return self->_volume;
}

- (BOOL)wantsMusicDucked
{
  return self->_wantsMusicDucked;
}

- (int64_t)persistencePermission
{
  return self->_persistencePermission;
}

- (void)setUndoManager:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (int64_t)diagnosticHUDType
{
  return self->_diagnosticHUDType;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryLoadingStatusReporter)loadingStatusReporter
{
  return self->_loadingStatusReporter;
}

- (BOOL)shouldPauseTransitions
{
  return self->_shouldPauseTransitions;
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (BOOL)isAsync
{
  return self->_isAsync;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXStoryLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (PXStoryAnimationController)animationController
{
  return self->_animationController;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 848);
  return self;
}

- (BOOL)currentAssetCollectionIsFavorite
{
  return self->_currentAssetCollectionIsFavorite;
}

- (PXDisplayAssetCollection)currentAssetCollection
{
  return self->_currentAssetCollection;
}

- (PXStorySongResource)activeSongResource
{
  return self->_activeSongResource;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStorySongResource)editorPreviewSong
{
  return self->_editorPreviewSong;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (double)styleSwitcherVisibilityFraction
{
  return self->_styleSwitcherVisibilityFraction;
}

- (PXStoryStyle)currentStyle
{
  return self->_currentStyle;
}

- (int64_t)musicReadinessStatus
{
  return self->_musicReadinessStatus;
}

- (int64_t)contentReadinessStatus
{
  return self->_contentReadinessStatus;
}

- (int64_t)readinessStatus
{
  return self->_readinessStatus;
}

- (PXAssetReference)lastHitAssetReference
{
  return self->_lastHitAssetReference;
}

- (int64_t)lastHitClipIdentifier
{
  return self->_lastHitClipIdentifier;
}

- (NSIndexSet)visibleSegmentIdentifiers
{
  return self->_visibleSegmentIdentifiers;
}

- (int64_t)previousSegmentIdentifier
{
  return self->_previousSegmentIdentifier;
}

- (int64_t)currentSegmentIdentifier
{
  return self->_currentSegmentIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeLeftInCurrentSegment
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 824);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeIntoCurrentSegment
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 800);
  return self;
}

- (PXStoryTimeline)gridTimeline
{
  return self->_gridTimeline;
}

- (PXStoryTimelineSpec)timelineSpec
{
  return self->_timelineSpec;
}

- (unint64_t)timelineAttributes
{
  return self->_timelineAttributes;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (BOOL)isPresentingAnyAlert
{
  return self->_isPresentingAnyAlert;
}

- (BOOL)isPerformingViewControllerTransition
{
  return self->_isPerformingViewControllerTransition;
}

- (BOOL)isPresentingColorGradeEditor
{
  return self->_isPresentingColorGradeEditor;
}

- (BOOL)isPresentingMusicEditor
{
  return self->_isPresentingMusicEditor;
}

- (BOOL)isPresentingAssetPicker
{
  return self->_isPresentingAssetPicker;
}

- (BOOL)isHovering
{
  return self->_isHovering;
}

- ($68D3C1A33EB7F0335689E2F183EF80A4)pressAnimationInfo
{
  return self;
}

- (BOOL)isTouching
{
  return self->_isTouching;
}

- (BOOL)allowsScrolling
{
  return self->_allowsScrolling;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- ($7DA682ECC7253F641496E0B6E9C98204)currentScrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 776);
  return self;
}

- (CGPoint)currentGridScrollPosition
{
  double x = self->_currentGridScrollPosition.x;
  double y = self->_currentGridScrollPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (PXDisplayRect)presentedSubtitleFrame
{
  return self->_presentedSubtitleFrame;
}

- (PXDisplayRect)presentedTitleFrame
{
  return self->_presentedTitleFrame;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (double)chromeVisibilityFraction
{
  return self->_chromeVisibilityFraction;
}

- (BOOL)prefersExportLayoutMatchesPlayback
{
  return self->_prefersExportLayoutMatchesPlayback;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- (BOOL)shouldAspectFitCurrentSegment
{
  return self->_shouldAspectFitCurrentSegment;
}

- (PXStoryThumbnailActionPerformer)thumbnailActionPerformer
{
  return self->_thumbnailActionPerformer;
}

- (double)inactiveImageFilterIntensity
{
  return self->_inactiveImageFilterIntensity;
}

- (BOOL)shouldUseInactiveImageFilter
{
  return self->_shouldUseInactiveImageFilter;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)thumbnailAutoplayTimeRange
{
  long long v3 = *(_OWORD *)&self[19].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[18].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[19].var1.var0;
  return self;
}

- (BOOL)shouldAutoplayThumbnail
{
  return self->_shouldAutoplayThumbnail;
}

- (int64_t)detailsViewButtonDisplayStyle
{
  return self->_detailsViewButtonDisplayStyle;
}

- (int64_t)thumbnailStyle
{
  return self->_thumbnailStyle;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)isActuallyPlaying
{
  return self->_isActuallyPlaying;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (BOOL)isAtPlaybackEnd
{
  return self->_isAtPlaybackEnd;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 752);
  return self;
}

- (double)playbackFractionCompleted
{
  return self->_playbackFractionCompleted;
}

- (unint64_t)lastPlaybackTimeChangeSource
{
  return self->_lastPlaybackTimeChangeSource;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 728);
  return self;
}

- (double)outroFractionCompleted
{
  return self->_outroFractionCompleted;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)nominalPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 704);
  return self;
}

- (NSCopying)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setWindowSceneID:(id)a3
{
}

- (NSString)windowSceneID
{
  return self->_windowSceneID;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (id)currentSongPaceDescription
{
  v2 = [(PXStoryModel *)self currentSongResource];
  long long v3 = objc_msgSend(v2, "px_storyResourceSongAsset");

  if (v3)
  {
    [v3 pace];
    PFStoryRecipeSongPaceDescription();
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"-";
  }
  uint64_t v5 = [v3 pace];
  v6 = v4;
  id v7 = +[PXStorySettings sharedInstance];
  uint64_t v8 = [v7 autoEditSongPaceOverride];

  if (v8) {
    BOOL v9 = v8 == v5;
  }
  else {
    BOOL v9 = 1;
  }
  id v10 = v6;
  if (!v9)
  {
    id v11 = NSString;
    v12 = PFStoryRecipeSongPaceDescription();
    id v10 = [v11 stringWithFormat:@"%@ (overridden from %@)", v12, v6];
  }
  return v10;
}

- (id)currentSongTagsDescription
{
  v2 = [(PXStoryModel *)self currentSongResource];
  long long v3 = objc_msgSend(v2, "px_storyResourceSongAsset");

  if (v3)
  {
    id v4 = [v3 assetTagsDescription];
  }
  else
  {
    id v4 = @"-";
  }

  return v4;
}

- (id)currentSongDescription
{
  long long v3 = [(PXStoryModel *)self currentSongResource];
  id v4 = objc_msgSend(v3, "px_storyResourceSongAsset");

  if (v4)
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [v4 title];
    id v7 = (void *)v6;
    if (v6)
    {
      int v8 = 0;
      BOOL v9 = (void *)v6;
    }
    else
    {
      uint64_t v11 = [v4 artistName];
      v2 = (void *)v11;
      if (v11)
      {
        int v8 = 0;
        BOOL v9 = (void *)v11;
      }
      else
      {
        BOOL v9 = [v4 albumTitle];
        int v8 = 1;
      }
    }
    unint64_t v12 = [v4 catalog];
    if (v12 > 4) {
      v13 = @"Mock";
    }
    else {
      v13 = off_1E5DC36E0[v12];
    }
    id v14 = v13;
    id v10 = (__CFString *)[v5 initWithFormat:@"%@ (%@)", v9, v14];

    if (v8) {
    if (!v7)
    }
  }
  else
  {
    id v10 = @"-";
  }

  return v10;
}

- (id)currentGradeDescription
{
  long long v3 = objc_opt_new();
  id v4 = [(PXStoryModel *)self currentStyle];
  uint64_t v5 = [v4 customColorGradeKind];

  uint64_t v6 = [(PXStoryModel *)self currentStyle];
  id v7 = [v6 originalColorGradeCategory];

  int v8 = [(PXStoryModel *)self currentAssetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(PXStoryModel *)self currentAssetCollection];
    uint64_t v11 = [v10 storyColorGradeKind];
  }
  else
  {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(PXStoryModel *)self colorGradingRepository];
  uint64_t v13 = [v12 colorGradeKindForColorGradeCategory:v7];
  id v14 = @"<music> ";
  if (v5)
  {
    if (v7)
    {
      if (v5 != 1 || v11)
      {
        if (v13 != v5) {
          id v14 = @"<custom> ";
        }
      }
      else
      {
        id v14 = @"<curation> ";
        uint64_t v5 = 1;
      }
    }
    else
    {
      id v14 = @"<curation> ";
    }
  }
  else
  {
    uint64_t v5 = v13;
  }
  [v3 appendString:v14];
  v15 = [v12 localizedTitleForColorGradeKind:v5];
  [v3 appendString:v15];

  return v3;
}

- (id)currentStyleDescription
{
  v2 = [(PXStoryModel *)self currentStyle];
  long long v3 = [v2 originalColorGradeCategory];
  id v4 = v3;
  if (!v3) {
    long long v3 = @"-";
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)currentTimeDescription
{
  int64_t v3 = [(PXStoryModel *)self desiredPlayState];
  id v4 = @"▶︎";
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"❚❚";
  }
  id v6 = [NSString alloc];
  [(PXStoryModel *)self nominalPlaybackTime];
  id v7 = PXStoryTimeDescription(&v11);
  [(PXStoryModel *)self playbackFractionCompleted];
  BOOL v9 = (void *)[v6 initWithFormat:@"%@ (%0.1f%%) %@", v7, v8 * 100.0, v5];

  return v9;
}

- (id)_currentAssetCollectionDescriptionForHUDType:(int64_t)a3
{
  id v4 = [(PXStoryModel *)self currentAssetCollection];
  if (v4)
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [v4 localizedTitle];
    id v7 = (void *)v6;
    if (v6) {
      double v8 = (__CFString *)v6;
    }
    else {
      double v8 = &stru_1F00B0030;
    }
    uint64_t v9 = [v4 localizedSubtitle];
    id v10 = (void *)v9;
    if (v9) {
      CMTime v11 = (__CFString *)v9;
    }
    else {
      CMTime v11 = &stru_1F00B0030;
    }
    unint64_t v12 = (void *)[v5 initWithFormat:@"%@ \n%@", v8, v11];

    uint64_t v13 = [off_1E5DA7230 defaultHelper];
    id v14 = [v13 displayableTextForTitle:v12 intent:1];

    if (a3 == 14)
    {
      v15 = [v4 uuid];
      v16 = [(__CFString *)v14 stringByAppendingFormat:@"\n\tUUID: %@", v15];

      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      id v14 = [v16 stringByAppendingFormat:@"\n\tType: %@", v18];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v4;
        v20 = [v19 photosGraphProperties];
        v21 = [v20 objectForKeyedSubscript:@"info"];
        v22 = [v21 objectForKeyedSubscript:@"osInfo"];

        v23 = @"?";
        if (v22) {
          v23 = v22;
        }
        id v24 = [(__CFString *)v14 stringByAppendingFormat:@"\n\tGenerated on: %@", v23];

        if ([v19 pendingState] == 2) {
          id v25 = @"YES";
        }
        else {
          id v25 = @"NO";
        }
        id v26 = [v24 stringByAppendingFormat:@"\n\tlocal: %@", v25];

        if ([v19 isEnriched]) {
          v27 = @"YES";
        }
        else {
          v27 = @"NO";
        }
        v28 = [v26 stringByAppendingFormat:@"\n\tenriched: %@", v27];

        v29 = [v19 storyTitleCategory];
        v30 = [v28 stringByAppendingFormat:@"\n\tstoryTitleCategory: %@", v29];

        [v19 storyColorGradeKind];
        v31 = PFStoryColorGradeKindToString();
        id v14 = [v30 stringByAppendingFormat:@"\n\tstoryColorGradeKind: %@", v31];
      }
    }
  }
  else
  {
    id v14 = @"-";
  }

  return v14;
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = [(PXStoryModel *)self _currentAssetCollectionDescriptionForHUDType:a3];
  [v5 appendFormat:@" Asset Collection: %@\n", v6];

  id v7 = [(PXStoryModel *)self currentTimeDescription];
  [v5 appendFormat:@"             Time: %@\n", v7];

  double v8 = [(PXStoryModel *)self currentStyleDescription];
  [v5 appendFormat:@"            Style: %@\n", v8];

  uint64_t v9 = [(PXStoryModel *)self currentGradeDescription];
  [v5 appendFormat:@"            Grade: %@\n", v9];

  id v10 = [(PXStoryModel *)self currentSongDescription];
  [v5 appendFormat:@"             Song: %@\n", v10];

  CMTime v11 = [(PXStoryModel *)self currentSongTagsDescription];
  [v5 appendFormat:@"        Song Tags: %@\n", v11];

  unint64_t v12 = [(PXStoryModel *)self currentSongPaceDescription];
  [v5 appendFormat:@"        Song Pace: %@\n", v12];

  [(PXStoryModel *)self outroDuration];
  CMTime time = v32;
  [v5 appendFormat:@"   Outro Duration: %.2fs\n", CMTimeGetSeconds(&time)];
  if (a3 == 14)
  {
    uint64_t v13 = [(PXStoryModel *)self visibleSegmentIdentifiers];
    id v14 = objc_msgSend(v13, "px_shortDescription");
    [v5 appendFormat:@" Visible Segments: %@\n", v14];

    BOOL v15 = [(PXStoryModel *)self allowsScrolling];
    v16 = @"No";
    if (v15) {
      v16 = @"Yes";
    }
    [v5 appendFormat:@"Scrolling Allowed: %@\n", v16];
    [v5 appendString:@"\n"];
    unint64_t v17 = [(PXStoryModel *)self readinessStatus];
    if (v17 > 3) {
      v18 = @"??";
    }
    else {
      v18 = off_1E5DC5210[v17];
    }
    id v19 = v18;
    [v5 appendFormat:@"   Overall Status: %@\n", v19];

    unint64_t v20 = [(PXStoryModel *)self musicReadinessStatus];
    if (v20 > 3) {
      v21 = @"??";
    }
    else {
      v21 = off_1E5DC5210[v20];
    }
    v22 = v21;
    [v5 appendFormat:@"     Music Status: %@\n", v22];

    unint64_t v23 = [(PXStoryModel *)self contentReadinessStatus];
    if (v23 > 3) {
      id v24 = @"??";
    }
    else {
      id v24 = off_1E5DC5210[v23];
    }
    id v25 = v24;
    [v5 appendFormat:@"   Content Status: %@\n", v25];

    [(PXStoryModel *)self volume];
    uint64_t v27 = v26;
    [(PXStoryModel *)self volumeDuringViewControllerTransition];
    [v5 appendFormat:@"          Volumes: %.2f %.2f\n", v27, v28];
    v29 = [(PXStoryModel *)self timeline];
    [v5 appendFormat:@"         Timeline: %@\n", v29];
  }
  v30 = (void *)[v5 copy];

  return v30;
}

- (id)_musicCurationDebugInformation
{
  int64_t v3 = [(PXStoryModel *)self currentSongResource];
  id v4 = objc_msgSend(v3, "px_storyResourceSongAsset");

  if (v4)
  {
    id v5 = [(PXStoryModel *)self currentAssetCollection];

    if (v5)
    {
      uint64_t v6 = [(PXStoryModel *)self currentAssetCollection];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v8 = [(PXStoryModel *)self currentAssetCollection];
        uint64_t v9 = [(PXStoryModel *)self photoKitAssetContainerWithAssetCollection:v8];
        uint64_t v19 = 0;
        unint64_t v20 = &v19;
        uint64_t v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__150613;
        unint64_t v23 = __Block_byref_object_dispose__150614;
        id v24 = @"Unavailable";
        id v10 = dispatch_group_create();
        dispatch_group_enter(v10);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __46__PXStoryModel__musicCurationDebugInformation__block_invoke;
        v16[3] = &unk_1E5DC3FD0;
        v18 = &v19;
        CMTime v11 = v10;
        unint64_t v17 = v11;
        id v12 = +[PXMusicCurator requestDebugInformationForAudioAsset:v4 assetContainer:v9 resultHandler:v16];
        dispatch_time_t v13 = dispatch_time(0, 10000000000);
        if (dispatch_group_wait(v11, v13)) {
          id v14 = @"Requesting music curation debug information timed out.";
        }
        else {
          id v14 = (__CFString *)(id)v20[5];
        }

        _Block_object_dispose(&v19, 8);
      }
      else
      {
        id v14 = @"Current asset collection is not a PHAssetCollection.";
      }
    }
    else
    {
      id v14 = @"Asset collection is nil.";
    }
  }
  else
  {
    id v14 = @"Song is nil.";
  }

  return v14;
}

void __46__PXStoryModel__musicCurationDebugInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    double v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = [a3 localizedDescription];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_appleMusicCapabilitiesDebugInformation
{
  int64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(PXStoryModel *)self configuration];
  id v5 = [v4 appleMusicStatusProvider];

  uint64_t v6 = [v5 statusForCapability:1];
  id v7 = [v5 error];
  if ((unint64_t)(v6 - 1) > 2) {
    double v8 = @"Unknown";
  }
  else {
    double v8 = off_1E5DAEAE8[v6 - 1];
  }
  uint64_t v9 = v8;
  uint64_t v10 = v9;
  if (!v6 && v7)
  {
    uint64_t v11 = [(__CFString *)v9 stringByAppendingFormat:@" (Error: %@)", v7];

    uint64_t v10 = (void *)v11;
  }

  return v10;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v11 = [(PXStoryModel *)self timeline];
  id v5 = [v11 diagnosticDescription];
  [v4 addAttachmentWithText:v5 name:@"Timeline"];

  uint64_t v6 = [v11 objectiveCCode];
  [v4 addAttachmentWithObjectiveCCode:v6 name:@"Timeline"];

  id v7 = [(PXStoryModel *)self _appleMusicCapabilitiesDebugInformation];
  [v4 addAttachmentWithText:v7 name:@"AppleMusicCapabilities"];

  double v8 = [(PXStoryModel *)self _musicCurationDebugInformation];
  [v4 addAttachmentWithText:v8 name:@"MusicCurationDebugInformation"];

  uint64_t v9 = [(PXStoryModel *)self styleManager];
  [v4 addSubprovider:v9];

  uint64_t v10 = [(PXStoryModel *)self timelineManager];
  [v4 addSubprovider:v10];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PXStoryModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DC0490;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryModel *)self performChanges:v5];
}

void __45__PXStoryModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == TimelineManagerObservationContext)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = v3;
    if (v5)
    {
      [*(id *)(a1 + 32) _invalidateTimeline];
      id v3 = v7;
      uint64_t v5 = *(void *)(a1 + 48);
    }
    if ((v5 & 4) != 0)
    {
      [*(id *)(a1 + 32) _invalidateTimelineAttributes];
      goto LABEL_21;
    }
  }
  else
  {
    if (v4 == ResourcesDataSourceManagerObservationContext_150645)
    {
      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_22;
      }
      id v7 = v3;
      [*(id *)(a1 + 32) _invalidateCurrentAssetCollection];
      goto LABEL_21;
    }
    if (v4 == StyleManagerObservationContext_150646)
    {
      if ((*(unsigned char *)(a1 + 48) & 4) == 0) {
        goto LABEL_22;
      }
      id v7 = v3;
      [*(id *)(a1 + 32) _invalidateCurrentStyleAndFocus];
      goto LABEL_21;
    }
    if (v4 == LayoutSpecManagerObservationContext)
    {
      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_22;
      }
      id v7 = v3;
      [*(id *)(a1 + 32) _invalidateLayoutSpec];
      goto LABEL_21;
    }
    if (v4 == TimelineSpecManagerObservationContext)
    {
      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_22;
      }
      id v7 = v3;
      [*(id *)(a1 + 32) _invalidateTimelineSpec];
      goto LABEL_21;
    }
    if (v4 != PressedFractionAnimatorObservationContext)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryModel.m" lineNumber:1702 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((*(unsigned char *)(a1 + 48) & 2) != 0)
    {
      id v7 = v3;
      [*(id *)(a1 + 32) _invalidatePressAnimationInfo];
LABEL_21:
      id v3 = v7;
    }
  }
LABEL_22:
}

- (void)_updatePressAnimationInfo
{
  id v14 = [(PXStoryModel *)self pressedFractionAnimator];
  [v14 presentationValue];
  double v4 = v3;
  [(PXStoryModel *)self pressAnimationInfo];
  if (v4 == 0.0)
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v7 = v5;
    double v8 = v6;
    if (v5 == *MEMORY[0x1E4F1DB30] && v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v10 = [(PXStoryModel *)self timeline];
      [v10 size];
      double v7 = v11;
      double v8 = v12;
    }
  }
  [v14 approximateVelocity];
  -[PXStoryModel setPressAnimationInfo:](self, "setPressAnimationInfo:", v4, v13, v7, v8);
}

- (void)_invalidatePressAnimationInfo
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePressAnimationInfo];
}

- (void)_updatePressedFractionAnimator
{
  double v3 = 0.0;
  if ([(PXStoryModel *)self isTouching] && [(PXStoryModel *)self viewMode] == 3)
  {
    double v4 = [(PXStoryModel *)self layoutSpec];
    if ([v4 canScaleWhenPressed]) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  double v5 = [(PXStoryModel *)self pressedFractionAnimator];
  [v5 value];
  double v7 = v6;

  if (v7 != v3)
  {
    double v8 = [(PXStoryModel *)self pressedFractionAnimator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PXStoryModel__updatePressedFractionAnimator__block_invoke;
    v9[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v9[4] = v3;
    [v8 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v9 changes:0.0];
  }
}

uint64_t __46__PXStoryModel__updatePressedFractionAnimator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_invalidatePressedFractionAnimator
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePressedFractionAnimator];
}

- (void)_updateOutroFractionCompleted
{
  int64_t v3 = [(PXStoryModel *)self viewMode];
  double v4 = 0.0;
  if (v3 != 4)
  {
    [(PXStoryModel *)self nominalPlaybackTime];
    memset(v13, 0, sizeof(v13));
    [(PXStoryModel *)self outroDuration];
    memset(&v12, 0, sizeof(v12));
    double v5 = [(PXStoryModel *)self timeline];
    double v6 = v5;
    if (v5)
    {
      [v5 timeRange];
    }
    else
    {
      memset(v11, 0, sizeof(v11));
      long long v10 = 0u;
    }
    CMTime lhs = *(CMTime *)((char *)v11 + 8);
    CMTime rhs = v13[0];
    CMTimeSubtract(&v12, &lhs, &rhs);

    CMTime lhs = v13[1];
    CMTime rhs = v12;
    int32_t v7 = CMTimeCompare(&lhs, &rhs);
    double v4 = 0.0;
    if (v7 >= 1)
    {
      CMTime lhs = v13[1];
      CMTime rhs = v12;
      CMTimeSubtract(&v9, &lhs, &rhs);
      CMTime lhs = v9;
      double Seconds = CMTimeGetSeconds(&lhs);
      CMTime lhs = v13[0];
      double v4 = Seconds / CMTimeGetSeconds(&lhs);
      if (v4 > 1.0) {
        double v4 = 1.0;
      }
    }
  }
  [(PXStoryModel *)self setOutroFractionCompleted:v4];
}

- (void)_invalidateOutroFractionCompleted
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOutroFractionCompleted];
}

- (void)_updateOutroDuration
{
  memset(&v12, 0, sizeof(v12));
  int64_t v3 = [(PXStoryModel *)self styleManager];
  double v4 = [v3 currentStyle];
  double v5 = v4;
  if (v4) {
    [v4 outroDuration];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }

  if ((v12.flags & 0x1D) != 1) {
    PXAssertGetLog();
  }
  double v6 = [(PXStoryModel *)self timeline];
  if ([v6 numberOfSegments] >= 1)
  {
    uint64_t v7 = objc_msgSend(v6, "identifierForSegmentAtIndex:", objc_msgSend(v6, "numberOfSegments") - 1);
    if (v6)
    {
      [v6 timeRangeForSegmentWithIdentifier:v7];
    }
    else
    {
      memset(v11, 0, sizeof(v11));
      long long v10 = 0u;
    }
    CMTime time1 = v12;
    CMTime time2 = *(CMTime *)((char *)v11 + 8);
    CMTimeMinimum(&v9, &time1, &time2);
    CMTime v12 = v9;
  }
  CMTime v8 = v12;
  [(PXStoryModel *)self setOutroDuration:&v8];
}

- (void)_invalidateOutroDuration
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOutroDuration];
}

- (void)_updateWantsMusicDucked
{
  BOOL v3 = [(NSMutableSet *)self->_musicDuckingTokens count] != 0;
  [(PXStoryModel *)self setWantsMusicDucked:v3];
}

- (void)_invalidateWantsMusicDucked
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsMusicDucked];
}

- (void)_updatePersistencePermission
{
  BOOL v3 = [(PXStoryModel *)self configuration];
  BOOL v4 = +[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:v3];

  if (v4)
  {
    uint64_t v5 = 1;
    [(PXStoryModel *)self _completePersistenceRequestsWithSuccess:1 error:0];
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_persistenceRequests count];
    int64_t v6 = [(PXStoryModel *)self persistencePermission];
    if (v6 == 1) {
      PXAssertGetLog();
    }
    if (v6)
    {
      uint64_t v5 = 0;
    }
    else if (v5)
    {
      [(PXStoryModel *)self _displayCollectionPersistenceConfirmationIfNeeded];
      uint64_t v5 = 1;
    }
  }
  [(PXStoryModel *)self setPersistencePermission:v5];
}

- (void)_invalidatePersistencePermission
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistencePermission];
}

- (void)_updateShouldAspectFitCurrentSegment
{
  if ([(PXStoryModel *)self desiredPlayState] == 1
    || [(PXStoryModel *)self isScrolling])
  {
    [(PXStoryModel *)self setShouldAspectFitCurrentSegment:0];
  }
}

- (void)_invalidateShouldAspectFitCurrentSegment
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldAspectFitCurrentSegment];
}

- (void)_updateLayoutSpec
{
  id v4 = [(PXStoryModel *)self layoutSpecManager];
  BOOL v3 = [v4 layoutSpec];
  [(PXStoryModel *)self setLayoutSpec:v3];
}

- (void)_invalidateLayoutSpec
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLayoutSpec];
}

- (void)_updateCurrentStyle
{
  id v4 = [(PXStoryModel *)self styleManager];
  BOOL v3 = [v4 currentStyle];
  [(PXStoryModel *)self setCurrentStyle:v3];
}

- (void)_invalidateCurrentStyleAndFocus
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentStyle];
}

- (void)_updateCurrentAssetCollection
{
  id v5 = [(PXStoryModel *)self resourcesDataSourceManager];
  BOOL v3 = [v5 dataSource];
  id v4 = [v3 assetCollection];
  [(PXStoryModel *)self setCurrentAssetCollection:v4];
}

- (void)_invalidateCurrentAssetCollection
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentAssetCollection];
}

- (void)_updatePlaybackFractionCompleted
{
  memset(&v12, 0, sizeof(v12));
  BOOL v3 = [(PXStoryModel *)self timeline];
  id v4 = v3;
  if (v3) {
    [v3 timeRange];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CMTimeRange range = v11;
  CMTimeRangeGetEnd(&v12, &range);

  [(PXStoryModel *)self nominalPlaybackTime];
  *(_OWORD *)&range.start.value = v9;
  range.start.epoch = v10;
  double Seconds = CMTimeGetSeconds(&range.start);
  range.start = v12;
  double v6 = Seconds / CMTimeGetSeconds(&range.start);
  [(PXStoryModel *)self setPlaybackFractionCompleted:v6];
  [(PXStoryModel *)self playbackMaxFractionCompleted];
  if (v6 >= v7) {
    double v7 = v6;
  }
  [(PXStoryModel *)self setPlaybackMaxFractionCompleted:v7];
  [(PXStoryModel *)self setIsAtPlaybackEnd:v6 >= 1.0];
  CMTime v8 = v12;
  [(PXStoryModel *)self setPlaybackDuration:&v8];
}

- (void)_invalidatePlaybackFractionCompleted
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaybackFractionCompleted];
}

- (void)_updateNominalPlaybackTime
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CMTimeScale timescale = 0;
  CMTimeValue value = 0;
  int64_t v3 = [(PXStoryModel *)self currentSegmentIdentifier];
  if (v3)
  {
    int64_t v4 = v3;
    memset(v16, 0, sizeof(v16));
    long long v15 = 0u;
    id v5 = [(PXStoryModel *)self timeline];
    double v6 = v5;
    if (v5)
    {
      [v5 timeRangeForSegmentWithIdentifier:v4];
    }
    else
    {
      memset(v16, 0, sizeof(v16));
      long long v15 = 0u;
    }

    memset(&v14, 0, sizeof(v14));
    [(PXStoryModel *)self timeIntoCurrentSegment];
    if ((unsigned __int128)0 >> 96
      && (BYTE12(v15) & 1) != 0
      && (BYTE4(v16[1]) & 1) != 0
      && !*((void *)&v16[1] + 1)
      && (*((void *)&v16[0] + 1) & 0x8000000000000000) == 0)
    {
      CMTime time1 = v14;
      CMTime time2 = *(CMTime *)((char *)v16 + 8);
      CMTimeMinimum(&v13, &time1, &time2);
      CMTime v14 = v13;
      *(_OWORD *)&time1.CMTimeValue value = v15;
      time1.CMTimeEpoch epoch = *(void *)&v16[0];
      CMTime time2 = v13;
      CMTimeAdd(&v13, &time1, &time2);
      CMTimeValue value = v13.value;
      CMTimeFlags flags = v13.flags;
      CMTimeScale timescale = v13.timescale;
      CMTimeEpoch epoch = v13.epoch;
      if ((v13.flags & 1) == 0) {
        PXAssertGetLog();
      }
    }
    else
    {
      CMTimeEpoch epoch = 0;
      CMTimeFlags flags = 1;
      CMTimeScale timescale = 1;
      CMTimeValue value = 0;
    }
  }
  else
  {
    CMTimeEpoch epoch = 0;
    CMTimeFlags flags = 0;
  }
  CMTimeValue v9 = value;
  CMTimeScale v10 = timescale;
  CMTimeFlags v11 = flags;
  CMTimeEpoch v12 = epoch;
  [(PXStoryModel *)self setNominalPlaybackTime:&v9];
}

- (void)_invalidateNominalPlaybackTime
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateNominalPlaybackTime];
}

- (void)_updateTimelineSpec
{
  id v5 = [(PXStoryModel *)self timelineManager];
  int64_t v3 = [v5 specManager];
  int64_t v4 = [v3 spec];
  [(PXStoryModel *)self setTimelineSpec:v4];
}

- (void)_invalidateTimelineSpec
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimelineSpec];
}

- (void)_updateTimelineAttributes
{
  id v3 = [(PXStoryModel *)self timelineManager];
  -[PXStoryModel setTimelineAttributes:](self, "setTimelineAttributes:", [v3 timelineAttributes]);
}

- (void)_invalidateTimelineAttributes
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimelineAttributes];
}

- (void)_updateTimeline
{
  id v4 = [(PXStoryModel *)self timelineManager];
  id v3 = [v4 timeline];
  [(PXStoryModel *)self setTimeline:v3];
}

- (void)_invalidateTimeline
{
  id v2 = [(PXStoryModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateTimeline];
}

- (void)_setNeedsUpdate
{
}

- (void)setPressAnimationInfo:(id *)a3
{
  BOOL v7 = v3 == self->_pressAnimationInfo.pressedFraction && v4 == self->_pressAnimationInfo.pressedFractionVelocity;
  if (!v7
    || (v5 == self->_pressAnimationInfo.timelineSizeBeforePressing.width
      ? (BOOL v8 = v6 == self->_pressAnimationInfo.timelineSizeBeforePressing.height)
      : (BOOL v8 = 0),
        !v8))
  {
    self->_pressAnimationInfo.pressedFraction = v3;
    self->_pressAnimationInfo.pressedFractionVelocitdouble y = v4;
    self->_pressAnimationInfo.timelineSizeBeforePressing.width = v5;
    self->_pressAnimationInfo.timelineSizeBeforePressing.height = v6;
    [(PXStoryModel *)self signalChange:0x8000000000000000];
  }
}

- (void)_enumerateVisibleAssetVideoPresentationControllersUsingBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void *, unsigned char *))a3;
  double v5 = [(PXStoryModel *)self visibleDisplayAssets];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v5 count] >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      BOOL v8 = [v5 objectAtIndexedSubscript:v7];
      CMTimeValue v9 = [v8 uuid];
      [v6 addObject:v9];

      ++v7;
    }
    while (v7 < [v5 count]);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(PXStoryModel *)self videoPresentationControllers];
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(obj);
      }
      CMTime v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
      long long v15 = [v14 displayAsset];
      v16 = [v15 uuid];
      int v17 = [v6 containsObject:v16];

      if (v17)
      {
        char v19 = 0;
        v4[2](v4, v14, &v19);
        if (v19) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (void)removeVideoPresentationController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryModel *)self videoPresentationControllers];
  [v5 removeObject:v4];
}

- (void)addVideoPresentationController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryModel *)self videoPresentationControllers];
  [v5 addObject:v4];
}

- (void)setInfoPanelVisibilityFraction:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_infoPanelVisibilityFraction != a3)
  {
    self->_infoPanelVisibilityFraction = a3;
    [(PXStoryModel *)self signalChange:0x800000000000000];
    id v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    BOOL v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        double v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

    uint64_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 2048;
        double v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedInfoPanelVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)setDesiredInfoPanelVisibilityFraction:(double)a3
{
  if (self->_desiredInfoPanelVisibilityFraction != a3)
  {
    self->_desiredInfoPanelVisibilityFraction = a3;
    [(PXStoryModel *)self signalChange:0x400000000000000];
  }
}

- (void)setVolumeDuringViewControllerTransition:(float)a3
{
  if (self->_volumeDuringViewControllerTransition != a3)
  {
    self->_volumeDuringViewControllerTransition = a3;
    [(PXStoryModel *)self signalChange:0x200000000000000];
  }
}

- (void)setVolume:(double)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(PXStoryModel *)self signalChange:0x200000000000000];
  }
}

- (void)setPreviousSegmentIdentifier:(int64_t)a3
{
  if (self->_previousSegmentIdentifier != a3)
  {
    self->_previousSegmentIdentifier = a3;
    [(PXStoryModel *)self signalChange:0x100000000000000];
  }
}

- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3
{
  if ([(PXStoryModel *)self isPresentingAssetPicker])
  {
    if (a3)
    {
      id v5 = "isPresentingAssetPicker";
LABEL_13:
      *a3 = (id)[[NSString alloc] initWithUTF8String:v5];
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([(PXStoryModel *)self isPresentingMusicEditor])
  {
    if (a3)
    {
      id v5 = "isPresentingMusicEditor";
      goto LABEL_13;
    }
LABEL_14:
    LOBYTE(v6) = 1;
    return v6;
  }
  if ([(PXStoryModel *)self isPresentingColorGradeEditor])
  {
    if (a3)
    {
      id v5 = "isPresentingColorGradeEditor";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  BOOL v6 = [(PXStoryModel *)self isPresentingAnyAlert];
  if (v6)
  {
    if (a3)
    {
      id v5 = "isPresentingAnyAlert";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  return v6;
}

- (void)setOutroDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 outroDuration = &self->_outroDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 outroDuration = self->_outroDuration;
  if (CMTimeCompare(&time1, (CMTime *)&outroDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_outroDuration->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_outroDuration->CMTimeValue value = v6;
    [(PXStoryModel *)self _invalidateOutroFractionCompleted];
  }
}

- (id)diagnosticDescriptionForAllHUDTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = -1;
  do
  {
    unint64_t v5 = v4 + 1;
    long long v6 = [(PXStoryModel *)self diagnosticHUDContentProviderForType:v4 + 1];
    os_signpost_id_t v7 = objc_msgSend(v6, "diagnosticTextForHUDType:displaySize:", v4 + 1, 1920.0, 1080.0);

    if (v7)
    {
      BOOL v8 = @"None";
      if (v4 <= 0x12) {
        BOOL v8 = off_1E5DC50E0[v4];
      }
      os_signpost_id_t v9 = v8;
      [v3 appendFormat:@"=== %@ ===\n", v9];

      [v3 appendString:v7];
      [v3 appendString:@"\n\n"];
    }

    ++v4;
  }
  while (v5 != 19);
  os_signpost_id_t v10 = (void *)[v3 copy];

  return v10;
}

- (void)endMusicDuckingWithToken:(id)a3
{
  [(NSMutableSet *)self->_musicDuckingTokens removeObject:a3];
  [(PXStoryModel *)self _invalidateWantsMusicDucked];
}

- (id)beginMusicDucking
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  [(NSMutableSet *)self->_musicDuckingTokens addObject:v3];
  [(PXStoryModel *)self _invalidateWantsMusicDucked];
  return v3;
}

- (void)setWantsMusicDucked:(BOOL)a3
{
  if (self->_wantsMusicDucked != a3)
  {
    self->_wantsMusicDucked = a3;
    [(PXStoryModel *)self signalChange:256];
  }
}

- (void)removeAssetsFromCuration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PXStoryModel_removeAssetsFromCuration___block_invoke;
  v6[3] = &unk_1E5DD2570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryModel *)self requestPersistencePermission:v6];
}

void __41__PXStoryModel_removeAssetsFromCuration___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  long long v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v6 recipeManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _OWORD v16[2] = __41__PXStoryModel_removeAssetsFromCuration___block_invoke_2;
    v16[3] = &unk_1E5DC1548;
    id v17 = *(id *)(a1 + 40);
    [v7 performChanges:v16];
  }
  else
  {
    BOOL v8 = [v6 errorReporter];
    os_signpost_id_t v14 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, @"unable to remove asset from curation, persistence request failed", v9, v10, v11, v12, v13, v15);
    [v8 setError:v14 forComponent:@"CuratedAssetRemoval"];
  }
}

uint64_t __41__PXStoryModel_removeAssetsFromCuration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applyManuallyRemovedAssets:*(void *)(a1 + 32)];
}

- (void)makeAssetKeyPhoto:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PXStoryModel_makeAssetKeyPhoto___block_invoke;
  v6[3] = &unk_1E5DD2570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryModel *)self requestPersistencePermission:v6];
}

void __34__PXStoryModel_makeAssetKeyPhoto___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  long long v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v6 recipeManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _OWORD v16[2] = __34__PXStoryModel_makeAssetKeyPhoto___block_invoke_2;
    v16[3] = &unk_1E5DC1548;
    id v17 = *(id *)(a1 + 40);
    [v7 performChanges:v16];
  }
  else
  {
    BOOL v8 = [v6 errorReporter];
    os_signpost_id_t v14 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, @"unable to make asset key photo, persistence request failed", v9, v10, v11, v12, v13, v15);
    [v8 setError:v14 forComponent:@"KeyAssetPick"];
  }
}

uint64_t __34__PXStoryModel_makeAssetKeyPhoto___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applyKeyAsset:*(void *)(a1 + 32)];
}

- (void)makeCurrentAssetKeyPhoto
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryModel *)self visibleDisplayAssets];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    [(PXStoryModel *)self makeAssetKeyPhoto:v4];
  }
  else
  {
    id v5 = PLStoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      uint64_t v7 = [v3 count];
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Can't set key asset when visibleDisplayAssets count = %ld", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)changeOverallDuration:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PXStoryModel *)self overallDurationChangeCompletionHandler];

  if (v7)
  {
    uint64_t v8 = [(PXStoryModel *)self overallDurationChangeCompletionHandler];
    v8[2](v8, 0);
  }
  [(PXStoryModel *)self setOverallDurationChangeCompletionHandler:v6];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
  long long v15 = v9;
  uint64_t v16 = *(void *)(MEMORY[0x1E4F8D280] + 64);
  long long v10 = *MEMORY[0x1E4F8D280];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
  long long v12 = v10;
  [(PXStoryModel *)self setDesiredPlayState:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke;
  v11[3] = &unk_1E5DBF8D8;
  v11[4] = self;
  v11[5] = a3;
  [(PXStoryModel *)self requestPersistencePermission:v11];
}

void __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v7 = [v6 recipeManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke_2;
    v17[3] = (uint64_t)&__block_descriptor_112_e39_v16__0___PXStoryMutableRecipeManager__8l;
    long long v8 = *(_OWORD *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 88);
    long long v20 = *(_OWORD *)(a1 + 72);
    long long v21 = v9;
    long long v22 = *(_OWORD *)(a1 + 104);
    long long v18 = *(_OWORD *)(a1 + 40);
    long long v19 = v8;
    [v7 performChanges:v17];
  }
  else
  {
    long long v10 = [v6 errorReporter];
    uint64_t v16 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, @"unable to change overall duration, persistence request failed", v11, v12, v13, v14, v15, v17[0]);
    [v10 setError:v16 forComponent:@"OverallDurationPick"];
  }
}

uint64_t __56__PXStoryModel_changeOverallDuration_completionHandler___block_invoke_2(_OWORD *a1, void *a2)
{
  long long v2 = a1[5];
  v5[2] = a1[4];
  v5[3] = v2;
  v5[4] = a1[6];
  long long v3 = a1[3];
  v5[0] = a1[2];
  v5[1] = v3;
  return [a2 applyTargetOverallDurationInfo:v5];
}

- (void)_completePersistenceRequestsWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v16 = v4;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Error requesting persistence success:%d error:%@", buf, 0x12u);
    }
  }
  if ([(NSMutableArray *)self->_persistenceRequests count])
  {
    long long v8 = (void *)[(NSMutableArray *)self->_persistenceRequests copy];
    [(NSMutableArray *)self->_persistenceRequests removeAllObjects];
    long long v9 = [(PXStoryModel *)self storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PXStoryModel__completePersistenceRequestsWithSuccess_error___block_invoke;
    block[3] = &unk_1E5DD21E8;
    id v12 = v8;
    BOOL v14 = v4;
    id v13 = v6;
    id v10 = v8;
    dispatch_async(v9, block);
  }
}

void __62__PXStoryModel__completePersistenceRequestsWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)performWithPrerequestedPersistencePermission:(id)a3
{
  id v4 = a3;
  if (![(PXStoryModel *)self didPrerequestPersistencePermission]) {
    PXAssertGetLog();
  }
  objc_initWeak(location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PXStoryModel_performWithPrerequestedPersistencePermission___block_invoke;
  v5[3] = &unk_1E5DCD9C8;
  id v6 = v4;
  objc_copyWeak(&v7, location);
  [(PXStoryModel *)self requestPersistencePermission:v5];
  objc_destroyWeak(&v7);

  objc_destroyWeak(location);
}

void __61__PXStoryModel_performWithPrerequestedPersistencePermission___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v15 = 138412290;
      *(void *)&v15[4] = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to realize pre-requested persistence permission: %@", v15, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    long long v8 = [WeakRetained errorReporter];
    BOOL v14 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(24, v5, @"failed to realize pre-requested persistence permission", v9, v10, v11, v12, v13, *(uint64_t *)v15);
    [v8 setError:v14 forComponent:@"PrerequestedPersistencePermission"];
  }
}

- (void)prerequestPersistencePermission:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  [(PXStoryModel *)self setDidPrerequestPersistencePermission:1];
  v4[2](v4, 1, 0);
}

- (void)reportNetworkRelatedPlaybackFailure
{
  uint64_t v3 = +[PXNetworkStatusMonitor sharedInstance];
  uint64_t v4 = [v3 bestAvailableNetworkType];

  if (v4 == 1)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(19, 0, @"Network required for playback", v5, v6, v7, v8, v9, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [(PXStoryModel *)self errorReporter];
    [v10 setError:v12 forComponent:@"NetworkReachablity"];
  }
}

- (void)reportPersistenceFailureWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PXStoryModel_reportPersistenceFailureWithError___block_invoke;
  v6[3] = &unk_1E5DC3540;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryModel *)self performChanges:v6];
}

uint64_t __50__PXStoryModel_reportPersistenceFailureWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistencePermission:0];
  [*(id *)(a1 + 32) _completePersistenceRequestsWithSuccess:0 error:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidatePersistencePermission];
}

- (void)requestPersistencePermissionWithTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  if ([(PXStoryModel *)self persistencePermission] == 1)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    id v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "queuing persistence request", buf, 2u);
    }

    [(PXStoryModel *)self setPersistenceConfirmationPresentationDate:0];
    *(void *)buf = 0;
    long long v21 = buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5DBF868;
    uint64_t v19 = buf;
    aBlock[4] = self;
    id v18 = v6;
    uint64_t v8 = _Block_copy(aBlock);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    uint64_t v10 = [(PXStoryModel *)self storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_2;
    block[3] = &unk_1E5DD3128;
    id v11 = v8;
    id v16 = v11;
    dispatch_after(v9, v10, block);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    CMTime v13[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_3;
    v13[3] = &unk_1E5DBF890;
    v13[4] = self;
    id v12 = v11;
    id v14 = v12;
    [(PXStoryModel *)self performChanges:v13];

    _Block_object_dispose(buf, 8);
  }
}

void __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    id v7 = [*(id *)(a1 + 32) persistenceConfirmationPresentationDate];
    uint64_t v8 = v7;
    int64_t v9 = 0;
    if (a2 && v7)
    {
      [v7 timeIntervalSinceNow];
      double v11 = v10;
      id v12 = +[PXStorySettings sharedInstance];
      [v12 persistenceConfirmationDuration];
      double v14 = v11 + v13;

      if (v14 < 0.0) {
        double v14 = 0.0;
      }
      uint64_t v15 = PLStoryGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v23 = -v11;
        __int16 v24 = 2048;
        double v25 = v14;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "persistence confirmation presented for %0.2fs, delaying by %0.2fs", buf, 0x16u);
      }

      int64_t v9 = (uint64_t)(v14 * 1000000000.0);
    }
    dispatch_time_t v16 = dispatch_time(0, v9);
    __int16 v17 = [*(id *)(a1 + 32) storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_289;
    block[3] = &unk_1E5DD1758;
    id v20 = *(id *)(a1 + 40);
    char v21 = a2;
    id v19 = v5;
    dispatch_after(v16, v17, block);
  }
}

void __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  PXStoryErrorCreateWithCodeDebugFormat(24, @"persistence permission request timed out", a3, a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 40));
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidatePersistencePermission];
}

uint64_t __74__PXStoryModel_requestPersistencePermissionWithTimeout_completionHandler___block_invoke_289(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)requestPersistencePermission:(id)a3
{
}

- (void)reconfigureWithAssetCollection:(id)a3
{
  id v4 = [(PXStoryConfiguration *)self->_configuration copyWithAssetCollection:a3];
  [(PXStoryModel *)self setConfiguration:v4];
  id v5 = [(PXStoryModel *)self recipeManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PXStoryModel_reconfigureWithAssetCollection___block_invoke;
  v7[3] = &unk_1E5DC1548;
  id v8 = v4;
  id v6 = v4;
  [v5 performChanges:v7];

  [(PXStoryModel *)self _completePersistenceRequestsWithSuccess:1 error:0];
}

uint64_t __47__PXStoryModel_reconfigureWithAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setConfiguration:*(void *)(a1 + 32)];
}

- (BOOL)isLastSegmentVisible
{
  uint64_t v3 = [(PXStoryModel *)self visibleSegmentIdentifiers];
  id v4 = [(PXStoryModel *)self timeline];
  char v5 = objc_msgSend(v3, "containsIndex:", objc_msgSend(v4, "lastSegmentIdentifier"));

  return v5;
}

- (BOOL)isFirstSegmentVisible
{
  uint64_t v3 = [(PXStoryModel *)self timeline];
  uint64_t v4 = [v3 firstSegmentIdentifier];

  char v5 = [(PXStoryModel *)self visibleSegmentIdentifiers];
  char v6 = [v5 containsIndex:v4];

  if (v6) {
    return 1;
  }
  [(PXStoryModel *)self elapsedTime];
  id v8 = [(PXStoryModel *)self timeline];
  uint64_t v9 = v8;
  if (v8) {
    [v8 infoForSegmentWithIdentifier:v4];
  }
  else {
    memset(v11, 0, 24);
  }
  CMTime time2 = *(CMTime *)v11;
  CMTime time1 = *(CMTime *)&v11[88];
  BOOL v7 = CMTimeCompare(&time1, &time2) == -1;

  return v7;
}

- (id)assetReferenceForClipIdentifier:(int64_t)a3
{
  uint64_t v4 = [(PXStoryModel *)self timeline];
  char v5 = [v4 clipWithIdentifier:a3];

  char v6 = [v5 resource];
  uint64_t v7 = objc_msgSend(v6, "px_storyResourceKind");

  if (v7 == 1)
  {
    id v8 = [v5 resource];
    uint64_t v9 = objc_msgSend(v8, "px_storyResourceDisplayAsset");
    id v10 = objc_alloc((Class)off_1E5DA55E0);
    long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
    v14[0] = *(_OWORD *)off_1E5DAB028;
    v14[1] = v11;
    id v12 = (void *)[v10 initWithSectionObject:0 itemObject:v9 subitemObject:0 indexPath:v14];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)getMainVisibleClipIdentifier:(int64_t *)a3 assetReferece:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(PXStoryModel *)self timeline];
  uint64_t v9 = [(PXStoryModel *)self visibleSegmentIdentifiers];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke;
  id v20 = &unk_1E5DD1558;
  id v21 = v8;
  id v10 = v7;
  id v22 = v10;
  id v11 = v8;
  [v9 enumerateIndexesUsingBlock:&v17];

  uint64_t v12 = objc_msgSend(v10, "count", v17, v18, v19, v20);
  if (v12)
  {
    if ((unint64_t)[v10 count] > 2) {
      objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
    }
    else {
    uint64_t v15 = [v10 firstObject];
    }
    int64_t v13 = [v15 integerValue];

    double v14 = [(PXStoryModel *)self assetReferenceForClipIdentifier:v13];
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64_t v13 = 0;
  double v14 = 0;
  if (a3) {
LABEL_8:
  }
    *a3 = v13;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v12 != 0;
}

void __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 timeRangeForSegmentWithIdentifier:a2];
    uint64_t v3 = *(void **)(a1 + 32);
  }
  [v3 size];
  PXRectWithOriginAndSize();
}

void __59__PXStoryModel_getMainVisibleClipIdentifier_assetReferece___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    id v7 = (void *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        id v8 = *(void **)(a1 + 32);
        uint64_t v9 = [NSNumber numberWithInteger:*(v7 - 1)];
        [v8 addObject:v9];
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

- (PXDisplayAssetFetchResult)visibleDisplayAssets
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(PXStoryModel *)self timeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXRectWithOriginAndSize();
}

void __36__PXStoryModel_visibleDisplayAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 timeRangeForSegmentWithIdentifier:a2];
    uint64_t v4 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__PXStoryModel_visibleDisplayAssets__block_invoke_2;
  v9[3] = &unk_1E5DC7760;
  id v5 = v4;
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  v8[0] = v14;
  v8[1] = v15;
  v8[2] = v16;
  objc_msgSend(v5, "enumerateClipsInTimeRange:rect:usingBlock:", v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __36__PXStoryModel_visibleDisplayAssets__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    id v7 = (void *)(a5 + 8);
    do
    {
      if (*v7 == 1)
      {
        id v8 = [*(id *)(a1 + 32) clipWithIdentifier:*(v7 - 1)];
        uint64_t v9 = [v8 resource];

        id v10 = objc_msgSend(v9, "px_storyResourceDisplayAsset");
        [*(id *)(a1 + 48) addObject:v10];
      }
      v7 += 96;
      --v5;
    }
    while (v5);
  }
}

- (void)setLastPlaybackTimeChangeSource:(unint64_t)a3
{
  if (self->_lastPlaybackTimeChangeSource != a3)
  {
    self->_lastPlaybackTimeChangeSource = a3;
    [(PXStoryModel *)self signalChange:0x10000000000000];
  }
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  uint64_t v2 = [(PXStoryModel *)self recipeManager];
  id v3 = [v2 recipe];
  uint64_t v4 = [v3 untruncatedCuratedAssets];

  return (PXDisplayAssetFetchResult *)v4;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  uint64_t v2 = [(PXStoryModel *)self recipeManager];
  id v3 = [v2 recipe];
  uint64_t v4 = [v3 curatedAssets];

  return (PXDisplayAssetFetchResult *)v4;
}

- (void)setDidReachOutroOnce:(BOOL)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self->_didReachOutroOnce != a3)
  {
    self->_didReachOutroOnce = a3;
    if (a3)
    {
      uint64_t v17 = *MEMORY[0x1E4F56560];
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      v18[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

      [(PXStoryModel *)self volume];
      if (v7 == 0.0) {
        id v8 = @"com.apple.photos.memory.interactiveMemoryPlaybackFinishedMuted";
      }
      else {
        id v8 = @"com.apple.photos.memory.interactiveMemoryPlaybackFinishedUnmuted";
      }
      [MEMORY[0x1E4F56658] sendEvent:v8 withPayload:v6];
      uint64_t v9 = [(PXStoryModel *)self untruncatedCuratedAssets];
      id v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 count];
        id v12 = [(PXStoryModel *)self curatedAssets];
        uint64_t v13 = v11 - [v12 count];

        if (v13 >= 1)
        {
          long long v14 = PLStoryGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            int v15 = 134217984;
            uint64_t v16 = v13;
            _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_FAULT, "reached outro with %li missed assets", (uint8_t *)&v15, 0xCu);
          }

          [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.memory.interactiveMemoryPlaybackFinishedTruncated" withPayload:v6];
        }
      }
    }
  }
}

- (void)setOutroFractionCompleted:(double)a3
{
  if (self->_outroFractionCompleted != a3)
  {
    self->_outroFractionCompleted = a3;
    [(PXStoryModel *)self signalChange:0x400000000000];
    if (self->_outroFractionCompleted > 0.0)
    {
      [(PXStoryModel *)self setDidReachOutroOnce:1];
    }
  }
}

- (void)setDiagnosticHUDType:(int64_t)a3
{
  if (self->_diagnosticHUDType != a3)
  {
    self->_diagnosticHUDType = a3;
    [(PXStoryModel *)self signalChange:0x1000000];
  }
}

- (void)setIsHUDVisible:(BOOL)a3
{
  if (self->_isHUDVisible != a3)
  {
    self->_isHUDVisible = a3;
    [(PXStoryModel *)self signalChange:0x800000];
  }
}

- (void)setElapsedTime:(id *)a3
{
  p_elapsedTime = &self->_elapsedTime;
  CMTime time1 = (CMTime)self->_elapsedTime;
  CMTime v7 = *(CMTime *)a3;
  if (CMTimeCompare(&time1, &v7))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_elapsedTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_elapsedTime->CMTimeValue value = v6;
    [(PXStoryModel *)self signalChange:4096];
  }
}

- (void)scrollToPosition:(id *)a3
{
  p_int64_t var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a3->var2;
  if (a3->var1 <= 0.5) {
    p_int64_t var2 = a3;
  }
  int64_t var0 = p_var2->var0;
  if (var0 != [(PXStoryModel *)self currentSegmentIdentifier])
  {
    CMTime v7 = [(PXStoryModel *)self timeline];
    id v8 = v7;
    if (v7)
    {
      [v7 timeRangeForSegmentWithIdentifier:var0];
    }
    else
    {
      memset(v16, 0, sizeof(v16));
      long long v15 = 0u;
    }
    long long v17 = *(_OWORD *)((char *)v16 + 8);
    uint64_t v18 = *((void *)&v16[1] + 1);

    long long v13 = PXStoryTimeZero;
    uint64_t v14 = 0;
    long long v11 = v17;
    uint64_t v12 = v18;
    [(PXStoryModel *)self setCurrentSegmentIdentifier:var0 timeIntoSegment:&v13 timeLeftInSegment:&v11 changeSource:2];
  }
  long long v9 = *(_OWORD *)&a3->var0;
  int64_t var2 = a3->var2;
  [(PXStoryModel *)self setCurrentScrollPosition:&v9];
}

- (void)restartPlaybackFromBeginning
{
}

- (void)flickedPastEnd
{
}

- (BOOL)rewindToBeginningOfCurrentSegment
{
  [(PXStoryModel *)self _enumerateVisibleAssetVideoPresentationControllersUsingBlock:&__block_literal_global_269];
  int64_t v3 = [(PXStoryModel *)self currentSegmentIdentifier];
  return [(PXStoryModel *)self skipToBeginningOfSegmentWithIdentifier:v3];
}

uint64_t __49__PXStoryModel_rewindToBeginningOfCurrentSegment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performChanges:&__block_literal_global_272_150732];
}

uint64_t __49__PXStoryModel_rewindToBeginningOfCurrentSegment__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 rewind];
}

- (BOOL)rewindToBeginning
{
  uint64_t v2 = self;
  int64_t v3 = [(PXStoryModel *)self timeline];
  LOBYTE(v2) = -[PXStoryModel skipToBeginningOfSegmentWithIdentifier:](v2, "skipToBeginningOfSegmentWithIdentifier:", [v3 firstSegmentIdentifier]);

  return (char)v2;
}

- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3
{
  uint64_t v5 = [(PXStoryModel *)self timeline];
  long long v6 = v5;
  if (v5)
  {
    [v5 timeRangeForSegmentWithIdentifier:a3];
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    long long v12 = 0u;
  }
  long long v14 = *(_OWORD *)((char *)v13 + 8);
  uint64_t v15 = *((void *)&v13[1] + 1);

  long long v10 = PXStoryTimeZero;
  uint64_t v11 = 0;
  long long v8 = v14;
  uint64_t v9 = v15;
  return [(PXStoryModel *)self setCurrentSegmentIdentifier:a3 timeIntoSegment:&v10 timeLeftInSegment:&v8 changeSource:2];
}

- (BOOL)setCurrentSegmentIdentifier:(int64_t)a3 timeIntoSegment:(id *)a4 timeLeftInSegment:(id *)a5 changeSource:(unint64_t)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self->_currentSegmentIdentifier != a3
    || (uint64_t v11 = &self->_timeIntoCurrentSegment,
        CMTime time1 = *(CMTime *)a4,
        CMTime time2 = (CMTime)self->_timeIntoCurrentSegment,
        CMTimeCompare(&time1, &time2))
    || (CMTime time1 = (CMTime)*a4,
        *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&v11->value,
        time2.CMTimeEpoch epoch = self->_timeIntoCurrentSegment.epoch,
        CMTimeCompare(&time1, &time2)))
  {
    long long v12 = [(PXStoryModel *)self timeline];
    int v13 = [v12 containsSegmentWithIdentifier:a3];
    if (v13)
    {
      p_timeIntoCurrentSegment = &self->_timeIntoCurrentSegment;
      CMTime time1 = (CMTime)*a4;
      CMTime time2 = (CMTime)self->_timeIntoCurrentSegment;
      if (CMTimeCompare(&time1, &time2))
      {
        *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_timeIntoCurrentSegment->value;
        time2.CMTimeEpoch epoch = self->_timeIntoCurrentSegment.epoch;
        int64_t var3 = a4->var3;
        *(_OWORD *)&p_timeIntoCurrentSegment->CMTimeValue value = *(_OWORD *)&a4->var0;
        self->_timeIntoCurrentSegment.CMTimeEpoch epoch = var3;
        [(PXStoryModel *)self signalChange:0x800000000];
        if (self->_currentSegmentIdentifier != a3)
        {
          uint64_t v16 = [(PXStoryModel *)self log];
          os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v18 = v17;
            if (os_signpost_enabled(v16))
            {
              CMTimeValue v42 = [(PXStoryModel *)self logContext];
              CMTime time1 = time2;
              v41 = PXStoryTimeDescription(&time1);
              CMTime time1 = (CMTime)*a4;
              v40 = PXStoryTimeDescription(&time1);
              LODWORD(time1.value) = 134219010;
              *(CMTimeValue *)((char *)&time1.value + 4) = v42;
              LOWORD(time1.flags) = 2050;
              *(void *)((char *)&time1.flags + 2) = a3;
              HIWORD(time1.epoch) = 2114;
              unint64_t v47 = (unint64_t)v41;
              __int16 v48 = 2114;
              v49 = v40;
              __int16 v50 = 2050;
              unint64_t v51 = a6;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_EVENT, v18, "PXStoryModelChangedTimeIntoCurrentSegment", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld timeIntoSegment=%{signpost.description:attribute, public}@ → %{signpost.description:attribute, public}@ changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x34u);
            }
          }
        }
      }
      p_timeLeftInCurrentSegment = &self->_timeLeftInCurrentSegment;
      CMTime time1 = (CMTime)*a5;
      CMTime time2 = (CMTime)self->_timeLeftInCurrentSegment;
      if (CMTimeCompare(&time1, &time2))
      {
        *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_timeLeftInCurrentSegment->value;
        time2.CMTimeEpoch epoch = self->_timeLeftInCurrentSegment.epoch;
        int64_t v20 = a5->var3;
        *(_OWORD *)&p_timeLeftInCurrentSegment->CMTimeValue value = *(_OWORD *)&a5->var0;
        self->_timeLeftInCurrentSegment.CMTimeEpoch epoch = v20;
        [(PXStoryModel *)self signalChange:0x40000000];
        if (self->_currentSegmentIdentifier != a3)
        {
          id v21 = [(PXStoryModel *)self log];
          os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, self);
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v23 = v22;
            if (os_signpost_enabled(v21))
            {
              CMTimeValue v43 = [(PXStoryModel *)self logContext];
              CMTime time1 = time2;
              __int16 v24 = PXStoryTimeDescription(&time1);
              CMTime time1 = (CMTime)*a5;
              double v25 = PXStoryTimeDescription(&time1);
              LODWORD(time1.value) = 134219010;
              *(CMTimeValue *)((char *)&time1.value + 4) = v43;
              LOWORD(time1.flags) = 2050;
              *(void *)((char *)&time1.flags + 2) = a3;
              HIWORD(time1.epoch) = 2114;
              unint64_t v47 = (unint64_t)v24;
              __int16 v48 = 2114;
              v49 = v25;
              __int16 v50 = 2050;
              unint64_t v51 = a6;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_EVENT, v23, "PXStoryModelChangedTimeLeftInCurrentSegment", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld timeLeftInSegment=%{signpost.description:attribute, public}@ → %{signpost.description:attribute, public}@ changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x34u);
            }
          }
        }
      }
      if (self->_currentSegmentIdentifier != a3)
      {
        -[PXStoryModel setPreviousSegmentIdentifier:](self, "setPreviousSegmentIdentifier:");
        self->_currentSegmentIdentifier = a3;
        [(PXStoryModel *)self signalChange:32];
        uint64_t v26 = [(PXStoryModel *)self log];
        os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, self);
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v28 = v27;
          if (os_signpost_enabled(v26))
          {
            CMTimeValue v29 = [(PXStoryModel *)self logContext];
            LODWORD(time1.value) = 134217984;
            *(CMTimeValue *)((char *)&time1.value + 4) = v29;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v26, OS_SIGNPOST_INTERVAL_END, v28, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&time1, 0xCu);
          }
        }

        v30 = v26;
        os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, self);
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v32 = v31;
          if (os_signpost_enabled(v30))
          {
            CMTimeValue v33 = [(PXStoryModel *)self logContext];
            LODWORD(time1.value) = 134218496;
            *(CMTimeValue *)((char *)&time1.value + 4) = v33;
            LOWORD(time1.flags) = 2050;
            *(void *)((char *)&time1.flags + 2) = a3;
            HIWORD(time1.epoch) = 2050;
            unint64_t v47 = a6;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v30, OS_SIGNPOST_EVENT, v32, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x20u);
          }
        }

        id v34 = v30;
        os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v34, self);
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v36 = v35;
          if (os_signpost_enabled(v34))
          {
            CMTimeValue v37 = [(PXStoryModel *)self logContext];
            LODWORD(time1.value) = 134218496;
            *(CMTimeValue *)((char *)&time1.value + 4) = v37;
            LOWORD(time1.flags) = 2050;
            *(void *)((char *)&time1.flags + 2) = a3;
            HIWORD(time1.epoch) = 2050;
            unint64_t v47 = a6;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PXStoryModelChangedCurrentSegmentIdentifier", "Context=%{signpost.telemetry:string2}lu segmentIdentifier=%{signpost.description:attribute, public}ld changeSource=%{signpost.description:attribute, public}ld", (uint8_t *)&time1, 0x20u);
          }
        }

        if (a6 == 2)
        {
          v38 = [(PXStoryModel *)self loadingStatusReporter];
          [v38 notifyUserDidNavigate];
        }
      }
      -[PXStoryModel setLastPlaybackTimeChangeSource:](self, "setLastPlaybackTimeChangeSource:", a6, v40);
      v44[1] = 0;
      v44[2] = 0;
      v44[0] = a3;
      [(PXStoryModel *)self setCurrentScrollPosition:v44];
      [(PXStoryModel *)self _invalidateNominalPlaybackTime];
    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (void)setIsPresentingAnyAlert:(BOOL)a3
{
  if (self->_isPresentingAnyAlert != a3)
  {
    self->_isPresentingAnyAlert = a3;
    [(PXStoryModel *)self signalChange:0x80000000000];
  }
}

- (void)setNumberOfPresentedAlerts:(int64_t)a3
{
  self->_numberOfPresentedAlerts = a3;
  [(PXStoryModel *)self setIsPresentingAnyAlert:a3 > 0];
}

- (void)didEndPresentingAlert
{
  int64_t v3 = [(PXStoryModel *)self numberOfPresentedAlerts] - 1;
  [(PXStoryModel *)self setNumberOfPresentedAlerts:v3];
}

- (void)didStartPresentingAlert
{
  int64_t v3 = [(PXStoryModel *)self numberOfPresentedAlerts] + 1;
  [(PXStoryModel *)self setNumberOfPresentedAlerts:v3];
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3
{
  if ([(PXStoryModel *)self viewMode] != 1) {
    return 0;
  }
  uint64_t v5 = [(PXStoryModel *)self viewModeTransition];

  if (v5) {
    return 0;
  }
  if (a3 == -1)
  {
    *(void *)&long long v17 = 0;
    *((void *)&v17 + 1) = &v17;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _OWORD v16[2] = __40__PXStoryModel_skipToSegmentWithOffset___block_invoke;
    v16[3] = &unk_1E5DBF7B0;
    void v16[4] = &v17;
    [(PXStoryModel *)self _enumerateVisibleAssetVideoPresentationControllersUsingBlock:v16];
    if (*(unsigned char *)(*((void *)&v17 + 1) + 24))
    {
      [(PXStoryModel *)self rewindToBeginningOfCurrentSegment];
      _Block_object_dispose(&v17, 8);
      return 1;
    }
    _Block_object_dispose(&v17, 8);
  }
  long long v8 = [(PXStoryModel *)self timeline];
  uint64_t v9 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", -[PXStoryModel currentSegmentIdentifier](self, "currentSegmentIdentifier"));
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v10 = v9 + a3, v10 < 0) || v10 >= [v8 numberOfSegments])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v11 = [v8 identifierForSegmentAtIndex:v10];
    if (v8)
    {
      [v8 timeRangeForSegmentWithIdentifier:v11];
    }
    else
    {
      memset(v15, 0, sizeof(v15));
      long long v14 = 0u;
    }
    uint64_t v18 = 0;
    long long v17 = PXStoryTimeZero;
    long long v12 = *(_OWORD *)((char *)v15 + 8);
    uint64_t v13 = *((void *)&v15[1] + 1);
    [(PXStoryModel *)self setCurrentSegmentIdentifier:v11 timeIntoSegment:&v17 timeLeftInSegment:&v12 changeSource:2];
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t __40__PXStoryModel_skipToSegmentWithOffset___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 shouldRewindOnBackAction];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)setShouldPauseTransitions:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_shouldPauseTransitions != a3)
  {
    BOOL v3 = a3;
    self->_shouldPauseTransitions = a3;
    [(PXStoryModel *)self signalChange:0x40000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    long long v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    long long v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedShouldPauseTransitions", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setInLiveResize:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_inLiveResize != a3)
  {
    BOOL v3 = a3;
    self->_inLiveResize = a3;
    [(PXStoryModel *)self signalChange:0x4000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    long long v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    long long v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedInLiveResize", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  uint64_t v4 = [(PXStoryModel *)self HUDContentProvidersByType];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  os_signpost_id_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = [(PXStoryModel *)self HUDContentProvidersByType];
  long long v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];

  [(PXStoryModel *)self signalChange:0x8000];
}

- (void)setLastHitAssetReference:(id)a3
{
  long long v8 = (PXAssetReference *)a3;
  uint64_t v5 = self->_lastHitAssetReference;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PXAssetReference *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastHitAssetReference, a3);
      [(PXStoryModel *)self signalChange:0x2000000];
    }
  }
}

- (void)setLastHitClipIdentifier:(int64_t)a3
{
  if (self->_lastHitClipIdentifier != a3)
  {
    self->_lastHitClipIdentifier = a3;
    [(PXStoryModel *)self signalChange:0x2000000];
  }
}

- (void)_clearLastHitAssetClip
{
  [(PXStoryModel *)self setLastHitAssetReference:0];
  [(PXStoryModel *)self setLastHitClipIdentifier:0];
}

- (void)setVisibleSegmentIdentifiers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSIndexSet *)a3;
  id v6 = self->_visibleSegmentIdentifiers;
  if (v6 == v5)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [(NSIndexSet *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_visibleSegmentIdentifiers, a3);
      int64_t viewMode = self->_viewMode;
      [(PXStoryModel *)self signalChange:64];
      if (viewMode != 3)
      {
        os_signpost_id_t v10 = [(PXStoryModel *)self log];
        os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v12 = v11;
          if (os_signpost_enabled(v10))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v26 = [(PXStoryModel *)self logContext];
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
          }
        }

        os_signpost_id_t v13 = v10;
        os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v15 = v14;
          if (os_signpost_enabled(v13))
          {
            uint64_t v16 = [(PXStoryModel *)self logContext];
            uint64_t v17 = [(NSIndexSet *)v5 px_shortDescription];
            *(_DWORD *)buf = 134218242;
            uint64_t v26 = v16;
            __int16 v27 = 2114;
            os_signpost_id_t v28 = v17;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_EVENT, v15, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
          }
        }

        __int16 v18 = v13;
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v20 = v19;
          if (os_signpost_enabled(v18))
          {
            uint64_t v21 = [(PXStoryModel *)self logContext];
            os_signpost_id_t v22 = [(NSIndexSet *)v5 px_shortDescription];
            *(_DWORD *)buf = 134218242;
            uint64_t v26 = v21;
            __int16 v27 = 2114;
            os_signpost_id_t v28 = v22;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PXStoryModelChangedVisibleSegmentIdentifiers", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
          }
        }
      }
      os_signpost_id_t v23 = [(PXStoryModel *)self timelineManager];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __45__PXStoryModel_setVisibleSegmentIdentifiers___block_invoke;
      v24[3] = &unk_1E5DC05F8;
      v24[4] = self;
      [v23 performChanges:v24];
    }
  }
}

uint64_t __45__PXStoryModel_setVisibleSegmentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisibleSegmentIdentifiers:*(void *)(*(void *)(a1 + 32) + 352) afterUpdatePass:1];
}

- (void)setEditorPreviewSong:(id)a3
{
  char v7 = (PXStorySongResource *)a3;
  uint64_t v5 = self->_editorPreviewSong;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStorySongResource *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editorPreviewSong, a3);
      [(PXStoryModel *)self signalChange:0x800000000000];
    }
  }
}

- (PXStorySongResource)currentSongResource
{
  uint64_t v2 = [(PXStoryModel *)self currentStyle];
  BOOL v3 = [v2 songResource];

  return (PXStorySongResource *)v3;
}

- (void)setActiveSongResource:(id)a3
{
  uint64_t v5 = (PXStorySongResource *)a3;
  if (self->_activeSongResource != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_activeSongResource, a3);
    [(PXStoryModel *)self signalChange:1024];
    uint64_t v5 = v6;
  }
}

- (void)setAudioSession:(id)a3
{
  uint64_t v5 = (AVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_audioSession, a3);
    uint64_t v5 = v6;
  }
}

- (void)setColorGradeKind:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_colorGradeKind != a3)
  {
    self->_colorGradeKind = a3;
    [(PXStoryModel *)self signalChange:0x100000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2050;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu %{public}ld", (uint8_t *)&v16, 0x16u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 2050;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedColorGradeKind", "Context=%{signpost.telemetry:string2}lu %{public}ld", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)setStyleSwitcherVisibilityFraction:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_styleSwitcherVisibilityFraction != a3)
  {
    self->_styleSwitcherVisibilityFraction = a3;
    [(PXStoryModel *)self signalChange:0x2000000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        double v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 2048;
        double v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedStyleSwitcherVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %0.1f", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)setCurrentStyle:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (PXStoryStyle *)a3;
  os_signpost_id_t v6 = self->_currentStyle;
  if (v6 == v5)
  {
  }
  else
  {
    os_signpost_id_t v7 = v6;
    char v8 = [(PXStoryStyle *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStyle, a3);
      uint64_t v9 = [(PXStoryStyle *)v5 customColorGradeKind];
      if (!v9)
      {
        os_signpost_id_t v10 = [(PXStoryStyle *)v5 originalColorGradeCategory];
        uint64_t v11 = [(PXStoryModel *)self colorGradingRepository];
        uint64_t v9 = [v11 colorGradeKindForColorGradeCategory:v10];
      }
      [(PXStoryModel *)self setColorGradeKind:v9];
      [(PXStoryModel *)self _invalidateOutroDuration];
      [(PXStoryModel *)self signalChange:512];
      os_signpost_id_t v12 = [(PXStoryModel *)self log];
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          int v23 = 134217984;
          uint64_t v24 = [(PXStoryModel *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v23, 0xCu);
        }
      }

      uint64_t v15 = v12;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          uint64_t v18 = [(PXStoryModel *)self logContext];
          int v23 = 134218242;
          uint64_t v24 = v18;
          __int16 v25 = 2114;
          uint64_t v26 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_EVENT, v17, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v23, 0x16u);
        }
      }

      double v19 = v15;
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v21 = v20;
        if (os_signpost_enabled(v19))
        {
          uint64_t v22 = [(PXStoryModel *)self logContext];
          int v23 = 134218242;
          uint64_t v24 = v22;
          __int16 v25 = 2114;
          uint64_t v26 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PXStoryModelChangedCurrentStyle", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v23, 0x16u);
        }
      }
    }
  }
}

- (void)setPersistencePermission:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_persistencePermission != a3)
  {
    self->_persistencePermission = a3;
    [(PXStoryModel *)self signalChange:0x4000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 2048;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedPersistencePermission", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }
  }
}

- (void)setCurrentAssetCollectionIsFavorite:(BOOL)a3
{
  if (self->_currentAssetCollectionIsFavorite != a3)
  {
    self->_currentAssetCollectionIsFavorite = a3;
    [(PXStoryModel *)self signalChange:0x200000000000];
  }
}

- (NSString)titleCategory
{
  titleCategordouble y = (__CFString *)self->_titleCategory;
  if (titleCategory == @"<UninitializedMemoryTitleCategory>")
  {
    uint64_t v4 = [(PXStoryModel *)self currentAssetCollection];
    uint64_t v5 = [v4 storyTitleCategory];
    os_signpost_id_t v6 = self->_titleCategory;
    self->_titleCategordouble y = v5;

    titleCategordouble y = (__CFString *)self->_titleCategory;
  }
  return (NSString *)titleCategory;
}

- (void)setCurrentAssetCollection:(id)a3
{
  uint64_t v5 = (PXDisplayAssetCollection *)a3;
  if (self->_currentAssetCollection != v5)
  {
    os_signpost_id_t v9 = v5;
    objc_storeStrong((id *)&self->_currentAssetCollection, a3);
    [(PXStoryModel *)self signalChange:2048];
    os_signpost_id_t v6 = (__CFString *)(id)*MEMORY[0x1E4F8D2E0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(PXDisplayAssetCollection *)self->_currentAssetCollection isFavorite];

      os_signpost_id_t v6 = @"<UninitializedMemoryTitleCategory>";
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(PXStoryModel *)self setCurrentAssetCollectionIsFavorite:v7];
    titleCategordouble y = self->_titleCategory;
    self->_titleCategordouble y = &v6->isa;

    uint64_t v5 = v9;
  }
}

- (void)setCurrentScrollPosition:(id *)a3
{
  if (a3->var0 != self->_currentScrollPosition.firstSegmentIdentifier
    || (a3->var1 == self->_currentScrollPosition.secondSegmentMixFactor
      ? (BOOL v3 = a3->var2 == self->_currentScrollPosition.secondSegmentIdentifier)
      : (BOOL v3 = 0),
        !v3))
  {
    long long v4 = *(_OWORD *)&a3->var0;
    self->_currentScrollPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_currentScrollPosition.firstSegmentIdentifier = v4;
    [(PXStoryModel *)self signalChange:4];
  }
}

- (void)setIsPerformingViewControllerTransition:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isPerformingViewControllerTransition != a3)
  {
    BOOL v3 = a3;
    self->_isPerformingViewControllerTransition = a3;
    [(PXStoryModel *)self signalChange:0x400000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPerformingViewControllerTransition", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsPresentingColorGradeEditor:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isPresentingColorGradeEditor != a3)
  {
    BOOL v3 = a3;
    self->_isPresentingColorGradeEditor = a3;
    [(PXStoryModel *)self signalChange:0x10000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingColorGradeEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsPresentingMusicEditor:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isPresentingMusicEditor != a3)
  {
    BOOL v3 = a3;
    self->_isPresentingMusicEditor = a3;
    [(PXStoryModel *)self signalChange:0x8000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingMusicEditor", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsPresentingAssetPicker:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isPresentingAssetPicker != a3)
  {
    BOOL v3 = a3;
    self->_isPresentingAssetPicker = a3;
    [(PXStoryModel *)self signalChange:0x200000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsPresentingAssetPicker", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsHovering:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isHovering != a3)
  {
    BOOL v3 = a3;
    self->_isHovering = a3;
    [(PXStoryModel *)self signalChange:0x4000000000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsHovering", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsTouching:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isTouching != a3)
  {
    BOOL v3 = a3;
    self->_isTouching = a3;
    [(PXStoryModel *)self _invalidatePressedFractionAnimator];
    [(PXStoryModel *)self signalChange:0x4000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsTouching", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setAllowsScrolling:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_allowsScrolling != a3)
  {
    BOOL v3 = a3;
    self->_allowsScrolling = a3;
    [(PXStoryModel *)self signalChange:0x8000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedAllowsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setIsScrolling:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isScrolling != a3)
  {
    BOOL v3 = a3;
    self->_isScrolling = a3;
    [(PXStoryModel *)self signalChange:8];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsScrolling", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    [(PXStoryModel *)self _invalidateShouldAspectFitCurrentSegment];
  }
}

- (void)setIsActuallyPlaying:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isActuallyPlaying != a3)
  {
    BOOL v3 = a3;
    self->_isActuallyPlaying = a3;
    [(PXStoryModel *)self signalChange:0x10000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedIsActuallyPlaying", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    [(PXStoryModel *)self signalChange:2];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 2048;
        int64_t v19 = a3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedDesiredPlayState", "Context=%{signpost.telemetry:string2}lu %ld", (uint8_t *)&v16, 0x16u);
      }
    }

    [(PXStoryModel *)self _invalidateShouldAspectFitCurrentSegment];
  }
}

- (void)setNominalPlaybackTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 nominalPlaybackTime = &self->_nominalPlaybackTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 nominalPlaybackTime = self->_nominalPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&nominalPlaybackTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_nominalPlaybackTime->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_nominalPlaybackTime->CMTimeValue value = v6;
    [(PXStoryModel *)self _invalidatePlaybackFractionCompleted];
    [(PXStoryModel *)self _invalidateOutroFractionCompleted];
    [(PXStoryModel *)self signalChange:1];
  }
}

- (void)setIsAtPlaybackEnd:(BOOL)a3
{
  if (self->_isAtPlaybackEnd != a3)
  {
    self->_isAtPlaybackEnd = a3;
    [(PXStoryModel *)self signalChange:0x40000000000];
  }
}

- (void)setPlaybackMaxFractionCompleted:(double)a3
{
  if (self->_playbackMaxFractionCompleted != a3) {
    self->_playbackMaxFractionCompleted = a3;
  }
}

- (void)setPlaybackDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 playbackDuration = &self->_playbackDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_playbackDuration->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_playbackDuration->CMTimeValue value = v6;
    [(PXStoryModel *)self signalChange:0x20000];
  }
}

- (void)setPlaybackFractionCompleted:(double)a3
{
  if (self->_playbackFractionCompleted != a3) {
    PXFloatEqualToFloatWithTolerance();
  }
}

- (void)setReadinessStatus:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_readinessStatus == a3) {
    return;
  }
  if ([(PXStoryModel *)self desiredPlayState] == 1)
  {
    if (a3 == 1)
    {
      [(PXStoryModel *)self setBufferingEvents:[(PXStoryModel *)self bufferingEvents] + 1];
      uint64_t v5 = [(PXStoryModel *)self log];
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          int v28 = 134217984;
          uint64_t v29 = [(PXStoryModel *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryModel.Buffering", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else
    {
      if (a3 != 3 || self->_readinessStatus != 1) {
        goto LABEL_13;
      }
      uint64_t v5 = [(PXStoryModel *)self log];
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v5, self);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v5))
        {
          uint64_t v10 = [(PXStoryModel *)self logContext];
          uint64_t v11 = +[PXNetworkStatusMonitor sharedInstance];
          int v28 = 134218496;
          uint64_t v29 = v10;
          __int16 v30 = 2050;
          int64_t v31 = [v11 bestAvailableNetworkType];
          __int16 v32 = 2050;
          int64_t v33 = [(PXStoryModel *)self bufferingEvents];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryModel.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEventCount=%{signpost.telemetry:number2,public}lu", (uint8_t *)&v28, 0x20u);
        }
      }
    }
  }
LABEL_13:
  self->_readinessStatus = a3;
  [(PXStoryModel *)self signalChange:0x200000];
  os_signpost_id_t v12 = [(PXStoryModel *)self log];
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      uint64_t v15 = [(PXStoryModel *)self logContext];
      int v28 = 134217984;
      uint64_t v29 = v15;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v14, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v28, 0xCu);
    }
  }

  int v16 = v12;
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v16))
    {
      uint64_t v19 = [(PXStoryModel *)self logContext];
      if ((unint64_t)a3 > 3) {
        uint64_t v20 = @"??";
      }
      else {
        uint64_t v20 = off_1E5DC5210[a3];
      }
      os_signpost_id_t v21 = v20;
      int v28 = 134218498;
      uint64_t v29 = v19;
      __int16 v30 = 2048;
      int64_t v31 = a3;
      __int16 v32 = 2114;
      int64_t v33 = (int64_t)v21;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_EVENT, v18, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v28, 0x20u);
    }
  }

  uint64_t v22 = v16;
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, self);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      uint64_t v25 = [(PXStoryModel *)self logContext];
      if ((unint64_t)a3 > 3) {
        uint64_t v26 = @"??";
      }
      else {
        uint64_t v26 = off_1E5DC5210[a3];
      }
      uint64_t v27 = v26;
      int v28 = 134218498;
      uint64_t v29 = v25;
      __int16 v30 = 2048;
      int64_t v31 = a3;
      __int16 v32 = 2114;
      int64_t v33 = (int64_t)v27;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PXStoryModelChangedReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v28, 0x20u);
    }
  }
}

- (void)setMusicReadinessStatus:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_musicReadinessStatus != a3)
  {
    self->_musicReadinessStatus = a3;
    [(PXStoryModel *)self signalChange:0x100000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v20 = 134217984;
        uint64_t v21 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    os_signpost_id_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        if ((unint64_t)a3 > 3) {
          os_signpost_id_t v12 = @"??";
        }
        else {
          os_signpost_id_t v12 = off_1E5DC5210[a3];
        }
        os_signpost_id_t v13 = v12;
        int v20 = 134218498;
        uint64_t v21 = v11;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        uint64_t v25 = v13;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }

    os_signpost_id_t v14 = v8;
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        uint64_t v17 = [(PXStoryModel *)self logContext];
        if ((unint64_t)a3 > 3) {
          os_signpost_id_t v18 = @"??";
        }
        else {
          os_signpost_id_t v18 = off_1E5DC5210[a3];
        }
        uint64_t v19 = v18;
        int v20 = 134218498;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        uint64_t v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXStoryModelChangedMusicReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (void)setContentReadinessStatus:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_contentReadinessStatus != a3)
  {
    self->_contentReadinessStatus = a3;
    [(PXStoryModel *)self signalChange:128];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v20 = 134217984;
        uint64_t v21 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
      }
    }

    os_signpost_id_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        if ((unint64_t)a3 > 3) {
          os_signpost_id_t v12 = @"??";
        }
        else {
          os_signpost_id_t v12 = off_1E5DC5210[a3];
        }
        os_signpost_id_t v13 = v12;
        int v20 = 134218498;
        uint64_t v21 = v11;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        uint64_t v25 = v13;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }

    os_signpost_id_t v14 = v8;
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        uint64_t v17 = [(PXStoryModel *)self logContext];
        if ((unint64_t)a3 > 3) {
          os_signpost_id_t v18 = @"??";
        }
        else {
          os_signpost_id_t v18 = off_1E5DC5210[a3];
        }
        uint64_t v19 = v18;
        int v20 = 134218498;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        uint64_t v25 = v19;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXStoryModelChangedContentReadinessStatus", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (void)setLayoutSpec:(id)a3
{
  os_signpost_id_t v7 = (PXStoryLayoutSpec *)a3;
  uint64_t v5 = self->_layoutSpec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_layoutSpec, a3);
      [(PXStoryModel *)self _invalidatePressedFractionAnimator];
      [(PXStoryModel *)self signalChange:0x2000];
    }
  }
}

- (void)setCurrentGridScrollPosition:(CGPoint)a3
{
}

- (void)setTimelineSpec:(id)a3
{
  uint64_t v5 = (PXStoryTimelineSpec *)a3;
  if (self->_timelineSpec != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_timelineSpec, a3);
    uint64_t v5 = v6;
  }
}

- (void)setTimelineAttributes:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t timelineAttributes = self->_timelineAttributes;
  if (timelineAttributes == a3) {
    return;
  }
  if ((timelineAttributes & 2) == 0 || !(((self->_timelineAttributes & 1) == 0) | a3 & 1))
  {
    if ((((self->_timelineAttributes & 2) == 0) & (((self->_timelineAttributes & 1) == 0) | a3)) != 0) {
      goto LABEL_8;
    }
LABEL_7:
    PXAssertGetLog();
  }
  if ((a3 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_8:
  self->_unint64_t timelineAttributes = a3;
  [(PXStoryModel *)self signalChange:0x20000000];
  char v6 = [(PXStoryModel *)self log];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      uint64_t v9 = [(PXStoryModel *)self logContext];
      int v20 = 134217984;
      uint64_t v21 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
    }
  }

  os_signpost_id_t v10 = v6;
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      uint64_t v13 = [(PXStoryModel *)self logContext];
      os_signpost_id_t v14 = PXStoryComponentAttributesDescription(a3);
      int v20 = 134218498;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_EVENT, v12, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }

  os_signpost_id_t v15 = v10;
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v15))
    {
      uint64_t v18 = [(PXStoryModel *)self logContext];
      uint64_t v19 = PXStoryComponentAttributesDescription(a3);
      int v20 = 134218498;
      uint64_t v21 = v18;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryModelChangedTimelineAttributes", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)_callCompletionHandlersPendingTimelineChange
{
  BOOL v3 = [(PXStoryModel *)self overallDurationChangeCompletionHandler];
  if (v3)
  {
    [(PXStoryModel *)self setOverallDurationChangeCompletionHandler:0];
    v3[2](v3, 1);
  }
}

- (void)setTimeline:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (PXStoryTimeline *)a3;
  char v6 = self->_timeline;
  if (v6 == v5)
  {
  }
  else
  {
    os_signpost_id_t v7 = v6;
    char v8 = [(PXStoryTimeline *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = self->_timeline;
      objc_storeStrong((id *)&self->_timeline, a3);
      [(PXStoryModel *)self signalChange:16];
      os_signpost_id_t v10 = [(PXStoryModel *)self log];
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v12 = v11;
        if (os_signpost_enabled(v10))
        {
          LODWORD(buf.value) = 134217984;
          *(CMTimeValue *)((char *)&buf.value + 4) = [(PXStoryModel *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&buf, 0xCu);
        }
      }

      uint64_t v13 = v10;
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v15 = v14;
        if (os_signpost_enabled(v13))
        {
          CMTimeValue v16 = [(PXStoryModel *)self logContext];
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = v16;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_EVENT, v15, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&buf, 0x16u);
        }
      }

      os_signpost_id_t v17 = v13;
      os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v19 = v18;
        if (os_signpost_enabled(v17))
        {
          CMTimeValue v20 = [(PXStoryModel *)self logContext];
          LODWORD(buf.value) = 134218242;
          *(CMTimeValue *)((char *)&buf.value + 4) = v20;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PXStoryModelChangedTimeline", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&buf, 0x16u);
        }
      }

      uint64_t v21 = [(PXStoryModel *)self currentSegmentIdentifier];
      __int16 v22 = [(PXStoryModel *)self desiredStartAsset];
      if (v22)
      {
        uint64_t v23 = [(PXStoryTimeline *)v5 identifierOfFirstSegmentContainingAsset:v22];
        if (v23)
        {
          uint64_t v24 = v23;
          [(PXStoryModel *)self setDesiredStartAsset:0];
          uint64_t v21 = v24;
        }
      }
      v29.CMTimeEpoch epoch = 0;
      *(_OWORD *)&v29.CMTimeValue value = PXStoryTimeZero;
      *(_OWORD *)&v28.CMTimeValue value = PXStoryTimeZero;
      v28.CMTimeEpoch epoch = 0;
      if ([(PXStoryTimeline *)v9 containsSegmentWithIdentifier:v21])
      {
        [(PXStoryModel *)self timeIntoCurrentSegment];
        [(PXStoryModel *)self timeLeftInCurrentSegment];
      }
      if (([(PXStoryTimeline *)v5 containsSegmentWithIdentifier:v21] & 1) == 0)
      {
        uint64_t v21 = [(PXStoryTimeline *)v5 identifierOfSegmentClosestToSegmentWithIdentifier:v21 inTimeline:v9];
        if (v5)
        {
          [(PXStoryTimeline *)v5 timeRangeForSegmentWithIdentifier:v21];
        }
        else
        {
          memset(v26, 0, 32);
          long long v25 = 0u;
        }
        CMTime buf = *(CMTime *)&v26[1];
        CMTime rhs = v28;
        CMTimeSubtract(&v27, &buf, &rhs);
        CMTime v28 = v27;
      }
      CMTime buf = v29;
      CMTime rhs = v28;
      -[PXStoryModel setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:](self, "setCurrentSegmentIdentifier:timeIntoSegment:timeLeftInSegment:changeSource:", v21, &buf, &rhs, 1, v25, v26[0]);
      [(PXStoryModel *)self _invalidateNominalPlaybackTime];
      [(PXStoryModel *)self _invalidateOutroDuration];
      [(PXStoryModel *)self _invalidatePlaybackFractionCompleted];
      [(PXStoryModel *)self _callCompletionHandlersPendingTimelineChange];
    }
  }
}

- (void)setViewModeTransition:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (PXStoryViewModeTransition *)a3;
  char v6 = self->_viewModeTransition;
  if (v6 == v5)
  {
  }
  else
  {
    os_signpost_id_t v7 = v6;
    char v8 = [(PXStoryViewModeTransition *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModeTransition, a3);
      [(PXStoryModel *)self signalChange:0x400000];
      uint64_t v9 = [(PXStoryModel *)self log];
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          int v20 = 134217984;
          uint64_t v21 = [(PXStoryModel *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
        }
      }

      os_signpost_id_t v12 = v9;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          uint64_t v15 = [(PXStoryModel *)self logContext];
          int v20 = 134218242;
          uint64_t v21 = v15;
          __int16 v22 = 2114;
          uint64_t v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      CMTimeValue v16 = v12;
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v18 = v17;
        if (os_signpost_enabled(v16))
        {
          uint64_t v19 = [(PXStoryModel *)self logContext];
          int v20 = 134218242;
          uint64_t v21 = v19;
          __int16 v22 = 2114;
          uint64_t v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryModelChangedViewModeTransition", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }
    }
  }
}

- (void)setShouldAspectFitCurrentSegment:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_shouldAspectFitCurrentSegment != a3)
  {
    BOOL v3 = a3;
    self->_shouldAspectFitCurrentSegment = a3;
    [(PXStoryModel *)self signalChange:0x1000000000];
    uint64_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    char v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedShouldAspectFitCurrentSegment", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setThumbnailAutoplayTimeRange:(id *)a3
{
  p_thumbnailAutoplayTimeRange = &self->_thumbnailAutoplayTimeRange;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.CMTimeValue value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v6;
  *(_OWORD *)&range1.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
  long long v7 = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.start.epoch;
  *(_OWORD *)&v10.start.CMTimeValue value = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.start.value;
  *(_OWORD *)&v10.start.CMTimeEpoch epoch = v7;
  *(_OWORD *)&v10.duration.CMTimeScale timescale = *(_OWORD *)&self->_thumbnailAutoplayTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->start.CMTimeEpoch epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->duration.CMTimeScale timescale = v9;
    *(_OWORD *)&p_thumbnailAutoplayTimeRange->start.CMTimeValue value = v8;
    [(PXStoryModel *)self signalChange:0x4000000000000];
  }
}

- (void)setInactiveImageFilterIntensity:(double)a3
{
}

- (void)setShouldAutoplayThumbnail:(BOOL)a3
{
  if (self->_shouldAutoplayThumbnail != a3)
  {
    self->_shouldAutoplayThumbnail = a3;
    [(PXStoryModel *)self signalChange:0x80000000];
  }
}

- (void)setDetailsViewButtonDisplayStyle:(int64_t)a3
{
  if (self->_detailsViewButtonDisplayStyle != a3) {
    self->_detailsViewButtonDisplayStyle = a3;
  }
}

- (void)setTitleAlignment:(int64_t)a3
{
  if (self->_titleAlignment != a3)
  {
    self->_titleAlignment = a3;
    [(PXStoryModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setPresentedSubtitleFrame:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_presentedSubtitleFrame] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedSubtitleFrame, a3);
    [(PXStoryModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setPresentedTitleFrame:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_presentedTitleFrame] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedTitleFrame, a3);
    [(PXStoryModel *)self signalChange:0x2000000000000000];
  }
}

- (void)setTitleOpacity:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_titleOpacity != a3)
  {
    self->_titleOpacitdouble y = a3;
    [(PXStoryModel *)self signalChange:0x1000000000000];
    long long v4 = [(PXStoryModel *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    long long v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXStoryModel *)self logContext];
        titleOpacitdouble y = self->_titleOpacity;
        int v17 = 134218240;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        double v20 = titleOpacity;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

    os_signpost_id_t v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        double v16 = self->_titleOpacity;
        int v17 = 134218240;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        double v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedTitleOpacity", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setChromeVisibilityFraction:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_chromeVisibilityFraction != a3)
  {
    self->_double chromeVisibilityFraction = a3;
    [(PXStoryModel *)self signalChange:0x1000000000000000];
    long long v4 = [(PXStoryModel *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    long long v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXStoryModel *)self logContext];
        double chromeVisibilityFraction = self->_chromeVisibilityFraction;
        int v17 = 134218240;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        double v20 = chromeVisibilityFraction;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }

    os_signpost_id_t v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        double v16 = self->_chromeVisibilityFraction;
        int v17 = 134218240;
        uint64_t v18 = v15;
        __int16 v19 = 2048;
        double v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedChromeVisibilityFraction", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_prefersExportLayoutMatchesPlayback != a3)
  {
    BOOL v3 = a3;
    self->_prefersExportLayoutMatchesPlayback = a3;
    [(PXStoryModel *)self signalChange:0x80000000000000];
    os_signpost_id_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    os_signpost_id_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryModelChangedPrefersExportLayoutMatchesPlayback", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setThumbnailStyle:(int64_t)a3
{
  if (self->_thumbnailStyle != a3) {
    self->_thumbnailStyle = a3;
  }
}

- (void)setViewMode:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_viewMode != a3)
  {
    self->_int64_t viewMode = a3;
    if (a3 != 3) {
      [(PXStoryModel *)self setThumbnailStyle:0];
    }
    [(PXStoryModel *)self _invalidateOutroFractionCompleted];
    [(PXStoryModel *)self _invalidatePressedFractionAnimator];
    [(PXStoryModel *)self signalChange:0x10000];
    os_signpost_id_t v5 = [(PXStoryModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v18 = 134217984;
        uint64_t v19 = [(PXStoryModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v18, 0xCu);
      }
    }

    os_signpost_id_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryModel *)self logContext];
        os_signpost_id_t v12 = PXStoryViewModeDescription(a3);
        int v18 = 134218498;
        uint64_t v19 = v11;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        __int16 v22 = 2114;
        uint64_t v23 = v12;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v18, 0x20u);
      }
    }

    os_signpost_id_t v13 = v8;
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        uint64_t v16 = [(PXStoryModel *)self logContext];
        uint64_t v17 = PXStoryViewModeDescription(a3);
        int v18 = 134218498;
        uint64_t v19 = v16;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        __int16 v22 = 2114;
        uint64_t v23 = v17;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryModelChangedViewMode", "Context=%{signpost.telemetry:string2}lu %ld %{public}@", (uint8_t *)&v18, 0x20u);
      }
    }
  }
}

- (void)setConfiguration:(id)a3
{
  os_signpost_id_t v8 = (PXStoryConfiguration *)a3;
  os_signpost_id_t v5 = self->_configuration;
  if (v5 == v8)
  {
  }
  else
  {
    os_signpost_id_t v6 = v5;
    char v7 = [(PXStoryConfiguration *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      [(PXStoryModel *)self signalChange:0x2000000000];
      [(PXStoryModel *)self _invalidatePersistencePermission];
    }
  }
}

- (void)_displayCollectionPersistenceConfirmationIfNeeded
{
  BOOL v3 = [(PXStoryModel *)self configuration];
  uint64_t v4 = [v3 collectionPersistenceConfirmationStyle];

  if (v4 == 1)
  {
    os_signpost_id_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [(PXStoryModel *)self setPersistenceConfirmationPresentationDate:v5];

    os_signpost_id_t v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)os_signpost_id_t v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "displaying persistence confirmation toast", v8, 2u);
    }

    id v7 = +[PXToast show:&__block_literal_global_150932];
  }
}

void __65__PXStoryModel__displayCollectionPersistenceConfirmationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v2 = PXLocalizedStringFromTable(@"InteractiveMemoryPersistenceConfirmationToastMessage", @"PhotosUICore");
  [v3 setMessage:v2];

  [v3 setIconSystemImageName:@"memories.badge.plus"];
  [v3 setAutoDismissalDelay:3.0];
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  uint64_t v2 = [(PXStoryModel *)self recipeManager];
  id v3 = [v2 chapterCollectionManager];

  return (PXStoryChapterCollectionManager *)v3;
}

- (BOOL)currentChapterTitleIsVisible
{
  id v3 = [(PXStoryModel *)self chapterCollectionManager];
  uint64_t v4 = [v3 chapterCollection];

  os_signpost_id_t v5 = [(PXStoryModel *)self visibleDisplayAssets];
  if ([v5 count] < 1)
  {
LABEL_5:
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v5 objectAtIndexedSubscript:v6];
      int v8 = [v4 containsChapterBeginningWithAsset:v7];

      if (v8) {
        break;
      }
      if (++v6 >= [v5 count]) {
        goto LABEL_5;
      }
    }
    os_signpost_id_t v10 = [(PXStoryModel *)self timeline];
    uint64_t v11 = [(PXStoryModel *)self visibleSegmentIdentifiers];
    uint64_t v12 = objc_msgSend(v10, "indexOfSegmentWithIdentifier:", objc_msgSend(v11, "firstIndex"));

    BOOL v9 = v12 != 0;
  }

  return v9;
}

- (PXStoryChapter)currentChapter
{
  id v3 = [(PXStoryModel *)self chapterCollectionManager];
  uint64_t v4 = [v3 chapterCollection];

  os_signpost_id_t v5 = [(PXStoryModel *)self visibleDisplayAssets];
  if ([v5 count] < 1)
  {
LABEL_5:
    int v8 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v5 objectAtIndexedSubscript:v6];
      int v8 = [v4 chapterContainingAsset:v7];

      if (v8) {
        break;
      }
      if (++v6 >= [v5 count]) {
        goto LABEL_5;
      }
    }
  }

  return (PXStoryChapter *)v8;
}

- (BOOL)isExporting
{
  return [(PXStoryModel *)self options] & 1;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  uint64_t v2 = [(PXStoryModel *)self layoutSpecManager];
  id v3 = [v2 extendedTraitCollection];

  return (PXExtendedTraitCollection *)v3;
}

- (NSSet)changesOrigins
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_changesOrigins copy];
  return (NSSet *)v2;
}

- (void)didEndChangeHandling
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryModel;
  [(PXStoryModel *)&v3 didEndChangeHandling];
  [(NSMutableSet *)self->_changesOrigins removeAllObjects];
}

- (void)didPerformChanges
{
  int v3 = [(PXStoryModel *)self currentChanges];
  int v4 = [(PXStoryModel *)self currentChanges];
  if ((v3 & 0x10000) != 0 && (v4 & 0x2000000) == 0) {
    [(PXStoryModel *)self _clearLastHitAssetClip];
  }
  v6.receiver = self;
  v6.super_class = (Class)PXStoryModel;
  [(PXStoryModel *)&v6 didPerformChanges];
  os_signpost_id_t v5 = [(PXStoryModel *)self updater];
  [v5 updateIfNeeded];
}

- (void)performChanges:(id)a3 origin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PXStoryModel *)self storyQueue];
  dispatch_assert_queue_V2(v8);

  if (v7) {
    [(NSMutableSet *)self->_changesOrigins addObject:v7];
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryModel;
  [(PXStoryModel *)&v9 performChanges:v6];
}

- (void)performChanges:(id)a3
{
}

- (PXStoryModel)initWithTimelineManager:(id)a3 layoutSpecManager:(id)a4 configuration:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v76.receiver = self;
  v76.super_class = (Class)PXStoryModel;
  uint64_t v12 = [(PXStoryModel *)&v76 init];
  if (v12)
  {
    os_signpost_id_t v13 = [v11 log];
    [v12 setLog:v13];

    objc_msgSend(v12, "setLogContext:", objc_msgSend(v11, "logContext"));
    os_signpost_id_t v14 = [v12 log];
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v12);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        CMTimeValue v68 = [v12 logContext];
        v70 = [v11 assetCollection];
        uint64_t v17 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v17);
        v69 = [v11 assetCollection];
        uint64_t v19 = [v69 localizedTitle];
        [v11 assetCollection];
        __int16 v20 = v72 = v9;
        [v20 uuid];
        int64_t v21 = v71 = v10;
        LODWORD(buf.value) = 134218754;
        *(CMTimeValue *)((char *)&buf.value + 4) = v68;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v18;
        HIWORD(buf.epoch) = 2112;
        v78 = v19;
        __int16 v79 = 2114;
        v80 = v21;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_EVENT, v16, "PXStoryModel.init", "Context=%{signpost.telemetry:string2}lu AssetCollection=%{signpost.description:attribute,public}@ Title=%{signpost.description:attribute}@ UUID=%{signpost.description:attribute,public}@ ", (uint8_t *)&buf, 0x2Au);

        id v10 = v71;
        id v9 = v72;
      }
    }

    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "logContext"));
    uint64_t v23 = (void *)*((void *)v12 + 22);
    *((void *)v12 + 22) = v22;

    objc_storeStrong((id *)v12 + 84, a3);
    [*((id *)v12 + 84) registerChangeObserver:v12 context:TimelineManagerObservationContext];
    uint64_t v24 = [*((id *)v12 + 84) specManager];
    [v24 registerChangeObserver:v12 context:TimelineSpecManagerObservationContext];

    uint64_t v25 = [v9 resourcesDataSourceManager];
    uint64_t v26 = (void *)*((void *)v12 + 56);
    *((void *)v12 + 56) = v25;

    [*((id *)v12 + 56) registerChangeObserver:v12 context:ResourcesDataSourceManagerObservationContext_150645];
    uint64_t v27 = [v9 styleManager];
    CMTime v28 = (void *)*((void *)v12 + 52);
    *((void *)v12 + 52) = v27;

    [*((id *)v12 + 52) registerChangeObserver:v12 context:StyleManagerObservationContext_150646];
    uint64_t v29 = [*((id *)v12 + 56) recipeManager];
    __int16 v30 = (void *)*((void *)v12 + 57);
    *((void *)v12 + 57) = v29;

    objc_storeStrong((id *)v12 + 73, a4);
    [*((id *)v12 + 73) registerChangeObserver:v12 context:LayoutSpecManagerObservationContext];
    int64_t v31 = objc_alloc_init(PXStoryLoadingStatusReporter);
    uint64_t v32 = (void *)*((void *)v12 + 65);
    *((void *)v12 + 65) = v31;

    int64_t v33 = [v12 log];
    [*((id *)v12 + 65) setLog:v33];

    objc_msgSend(*((id *)v12 + 65), "setLogContext:", objc_msgSend(v12, "logContext"));
    uint64_t v34 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v12 needsUpdateSelector:sel__setNeedsUpdate];
    os_signpost_id_t v35 = (void *)*((void *)v12 + 74);
    *((void *)v12 + 74) = v34;

    [*((id *)v12 + 74) addUpdateSelector:sel__updateTimeline];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateTimelineAttributes];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateTimelineSpec];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateNominalPlaybackTime];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateCurrentStyle];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateOutroDuration];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateOutroFractionCompleted];
    [*((id *)v12 + 74) addUpdateSelector:sel__updatePlaybackFractionCompleted];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateCurrentAssetCollection];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateLayoutSpec];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateShouldAspectFitCurrentSegment];
    [*((id *)v12 + 74) addUpdateSelector:sel__updatePersistencePermission];
    [*((id *)v12 + 74) addUpdateSelector:sel__updateWantsMusicDucked];
    [*((id *)v12 + 74) addUpdateSelector:sel__updatePressedFractionAnimator];
    [*((id *)v12 + 74) addUpdateSelector:sel__updatePressAnimationInfo];
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    CMTimeValue v37 = (void *)*((void *)v12 + 12);
    *((void *)v12 + 12) = v36;

    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v39 = (void *)*((void *)v12 + 13);
    *((void *)v12 + 13) = v38;

    uint64_t v40 = [*((id *)v12 + 52) colorGradingRepository];
    v41 = (void *)*((void *)v12 + 53);
    *((void *)v12 + 53) = v40;

    *((void *)v12 + 26) = 0;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    long long v42 = *(_OWORD *)&buf.value;
    *((void *)v12 + 102) = buf.epoch;
    *((_OWORD *)v12 + 50) = v42;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    long long v43 = *(_OWORD *)&buf.value;
    *((void *)v12 + 90) = buf.epoch;
    *((_OWORD *)v12 + 44) = v43;
    *((void *)v12 + 85) = 0;
    CMTimeMakeWithSeconds(&buf, 0.0, 600);
    long long v44 = *(_OWORD *)&buf.value;
    *((void *)v12 + 108) = buf.epoch;
    *((_OWORD *)v12 + 53) = v44;
    *((void *)v12 + 27) = [v11 initialViewMode];
    v12[127] = 1;
    *(_OWORD *)(v12 + 920) = 0u;
    *(_OWORD *)(v12 + 936) = 0u;
    *(_OWORD *)(v12 + 904) = 0u;
    *((void *)v12 + 29) = 1;
    *((void *)v12 + 34) = 0x3FF0000000000000;
    *((void *)v12 + 70) = 0x3FF0000000000000;
    v12[123] = [v11 allowInactiveAppearance];
    uint64_t v45 = [v9 storyQueue];
    v46 = (void *)*((void *)v12 + 19);
    *((void *)v12 + 19) = v45;

    v12[136] = ([v11 options] & 0x2000) != 0 || *((void *)v12 + 19) != MEMORY[0x1E4F14428];
    v12[137] = ([v11 options] & 0x8000) != 0;
    unint64_t v47 = [v11 options];
    *((void *)v12 + 64) = [v9 options] & 1 | (2 * ((v47 >> 6) & 1));
    uint64_t v48 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v49 = (void *)*((void *)v12 + 75);
    *((void *)v12 + 75) = v48;

    uint64_t v50 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    unint64_t v51 = (void *)*((void *)v12 + 76);
    *((void *)v12 + 76) = v50;

    uint64_t v52 = [v11 errorReporter];
    v53 = (void *)*((void *)v12 + 66);
    *((void *)v12 + 66) = v52;

    v54 = [[PXStoryAnimationController alloc] initWithModel:v12];
    v55 = (void *)*((void *)v12 + 61);
    *((void *)v12 + 61) = v54;

    v56 = objc_alloc_init(PXVideoSessionManager);
    v57 = (void *)*((void *)v12 + 62);
    *((void *)v12 + 62) = v56;

    v58 = [v12 log];
    [*((id *)v12 + 62) setLog:v58];

    objc_msgSend(*((id *)v12 + 62), "setLogContext:", objc_msgSend(v12, "logContext"));
    *((void *)v12 + 70) = 0x3FF0000000000000;
    *((_DWORD *)v12 + 36) = 1065353216;
    id v59 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v60 = (void *)*((void *)v12 + 14);
    *((void *)v12 + 14) = v59;

    uint64_t v61 = +[PXStoryUIFactory thumbnailActionPerformerWithModel:v12];
    v62 = (void *)*((void *)v12 + 31);
    *((void *)v12 + 31) = v61;

    uint64_t v63 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    v64 = (void *)*((void *)v12 + 80);
    *((void *)v12 + 80) = v63;

    [*((id *)v12 + 80) registerChangeObserver:v12 context:PressedFractionAnimatorObservationContext];
    uint64_t v65 = [v11 desiredStartAsset];
    v66 = (void *)*((void *)v12 + 81);
    *((void *)v12 + 81) = v65;

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __72__PXStoryModel_initWithTimelineManager_layoutSpecManager_configuration___block_invoke;
    v73[3] = &unk_1E5DD0328;
    v74 = v12;
    id v75 = v11;
    [v74 performChanges:v73];
  }
  return (PXStoryModel *)v12;
}

uint64_t __72__PXStoryModel_initWithTimelineManager_layoutSpecManager_configuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setConfiguration:v2];

  [*(id *)(a1 + 32) _invalidateTimeline];
  [*(id *)(a1 + 32) _invalidateTimelineAttributes];
  [*(id *)(a1 + 32) _invalidateTimelineSpec];
  [*(id *)(a1 + 32) _invalidateCurrentAssetCollection];
  [*(id *)(a1 + 32) _invalidateCurrentStyleAndFocus];
  [*(id *)(a1 + 32) _invalidateLayoutSpec];
  int v3 = *(void **)(a1 + 32);
  return [v3 _invalidatePersistencePermission];
}

- (PXStoryModel)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryModel.m", 118, @"%s is not available as initializer", "-[PXStoryModel init]");

  abort();
}

@end