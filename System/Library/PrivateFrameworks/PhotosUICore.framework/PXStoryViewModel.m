@interface PXStoryViewModel
+ (void)registerViewModelDesiringSoloPlayback:(id)a3;
+ (void)unregisterViewModelDesiringSoloPlayback:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration;
- ($74445421B386A896E969A1525619931B)swipeDownInteractionState;
- ($7DA682ECC7253F641496E0B6E9C98204)scrubberPosition;
- (BOOL)allowsRelated;
- (BOOL)assetCollectionForcesAutoReplay;
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (BOOL)canShowMuteToggleButtonWhenChromeIsHidden;
- (BOOL)canToggleSelectMode;
- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3;
- (BOOL)didSelectAnyRelated;
- (BOOL)hasAnyError;
- (BOOL)isActionMenuOpen;
- (BOOL)isActive;
- (BOOL)isAnyMenuOpen;
- (BOOL)isAtPlaybackEnd;
- (BOOL)isAtPlaybackStart;
- (BOOL)isHUDVisible;
- (BOOL)isInSelectMode;
- (BOOL)isMuted;
- (BOOL)isPerformingAnyExportOperation;
- (BOOL)isPerformingCrossfadeTransitionToRelated;
- (BOOL)isPerformingViewControllerTransition;
- (BOOL)isReadingFromPhotosGridViewModel;
- (BOOL)isRelatedOverlayScrolledIntoView;
- (BOOL)isScrubbing;
- (BOOL)isUserPerformingRemoteGesture;
- (BOOL)needsStatusBarVisible;
- (BOOL)pausingPlaybackShowsChrome;
- (BOOL)shouldAutoHideChrome;
- (BOOL)shouldAutoHideMuteToggleButton;
- (BOOL)shouldAutoReplayPreference;
- (BOOL)shouldCountDownToUpNext;
- (BOOL)shouldPreventDisplaySleep;
- (BOOL)shouldShowErrorIndicator;
- (BOOL)shouldSimplifyUIForAccessibility;
- (BOOL)showSongInTitleWhenPaused;
- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3;
- (BOOL)skipToSegmentWithOffset:(int64_t)a3;
- (BOOL)skipToSegmentWithOffset:(int64_t)a3 byTappingEdge:(BOOL)a4;
- (BOOL)swipeDownDismissalPreviewEnabled;
- (BOOL)swipeDownTriggeringDismissal;
- (BOOL)wantsChromeVisible;
- (BOOL)wantsFeedbackAction;
- (BOOL)wantsPlaybackEndDarkening;
- (BOOL)wantsRelatedOverlayNavigationButtonsVisible;
- (BOOL)wantsRelatedOverlayScrollable;
- (BOOL)wantsRelatedOverlayVisible;
- (BOOL)wantsScrubberVisible;
- (BOOL)wantsSoloPlayback;
- (NSArray)relatedConfigurations;
- (NSArray)relatedModels;
- (NSAttributedString)displaySubtitle;
- (NSAttributedString)displayTitle;
- (NSDate)lastMainModelChangeDate;
- (NSDate)lastSkipSegmentActionDate;
- (NSDateFormatter)mainAssetInfoUpdateQueue_titleDateFormatter;
- (NSError)displayedError;
- (NSMapTable)diagnosticHUDContentProvidersByType;
- (NSMutableSet)recentlyUsedAppleMusicSongIDs;
- (NSMutableSet)recentlyUsedFlexSongIDs;
- (NSString)diagnosticDescriptionForAllHUDTypes;
- (NSString)identifier;
- (NSTimer)autoHideChromeTimer;
- (NSTimer)autoHideMuteToggleButtonTimer;
- (OS_dispatch_queue)mainAssetInfoUpdateQueue;
- (OS_dispatch_queue)storyQueue;
- (PXAnonymousViewController)presentingViewController;
- (PXApplicationDisabledIdleTimerToken)preventedDisplaySleepToken;
- (PXDisplayAsset)mainAsset;
- (PXDisplayAssetCollection)mainAssetCollection;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXGItemPlacement)viewControllerDismissalTargetPlacement;
- (PXInfoUpdater)mainAssetInfoUpdater;
- (PXMediaProvider)mediaProvider;
- (PXPhotosViewInteraction)photosGridViewInteraction;
- (PXPhotosViewModel)photosGridViewModel;
- (PXStoryAudioSessionController)audioSessionController;
- (PXStoryConfiguration)mainConfiguration;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryErrorRepository)errorRepository;
- (PXStoryModel)mainModel;
- (PXStoryModel)modelCoveredByRelated;
- (PXStoryMusicPlayer)musicPlayer;
- (PXStoryMuteStateController)muteStateController;
- (PXStoryOverlayController)overlayController;
- (PXStoryPacingController)pacingController;
- (PXStoryPacingTimeSource)timeSource;
- (PXStoryPausableLoadingCoordinator)loadingCoordinator;
- (PXStoryPersistenceController)persistenceController;
- (PXStoryRelatedController)relatedController;
- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator;
- (PXStorySongController)songController;
- (PXStoryValidationController)validationController;
- (PXStoryViewActionPerformer)actionPerformer;
- (PXStoryViewBufferingController)bufferingController;
- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration;
- (PXStoryViewChromeTitleInfo)chromeTitleInfo;
- (PXStoryViewEnvironmentModel)viewEnvironmentModel;
- (PXStoryViewLayoutSpec)viewLayoutSpec;
- (PXStoryViewLayoutSpecManager)viewLayoutSpecManager;
- (PXStoryViewModeTransition)viewModeTransition;
- (PXStoryViewModel)init;
- (PXStoryViewModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 timeSource:(id)a5 mediaProvider:(id)a6;
- (PXStoryViewResourcesPreloadingController)resourcesPreloadingController;
- (PXUpdater)updater;
- (PXUserDefaultsDataSource)userDefaults;
- (PXVolumeController)volumeController;
- (UIImpactFeedbackGenerator)scrubberFeedbackGenerator;
- (double)bottomGradientLegibilityOverlayOpacity;
- (double)bufferingIndicatorVisibilityFraction;
- (double)chromeVisibilityFraction;
- (double)fadeOutOverlayVisibilityFraction;
- (double)maximumIndividualTopChromeItemVisibilityFraction;
- (double)muteToggleButtonVisibilityFraction;
- (double)outroFractionCompleted;
- (double)playbackEndDarkening;
- (double)playbackFractionCompleted;
- (double)relatedOverlayVisibilityFraction;
- (double)scrubberVisibilityFraction;
- (double)solidLegibilityOverlayOpacity;
- (double)styleSwitcherVisibilityFraction;
- (double)swipeDownDismissalPreviewFraction;
- (double)topGradientLegibilityOverlayOpacity;
- (double)volume;
- (id)_gridEffectForAsset:(id)a3 colorGradingEffect:(id)a4 entityManager:(id)a5;
- (id)_internalRecoveryOptions;
- (id)_mainAssetInfoUpdateQueue_infoForAsset:(id)a3;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticHUDContentProviderForType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)makeDefaultActionsMenu;
- (id)memoryDebugInfo;
- (id)modelChangeOrigin;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (int64_t)desiredPlayState;
- (int64_t)diagnosticHUDType;
- (int64_t)highlightedRelatedIndex;
- (int64_t)lastMutedChangeReason;
- (int64_t)selectedRelatedIndex;
- (int64_t)viewMode;
- (unint64_t)HUDContentChangeDescriptor;
- (unint64_t)HUDStoryModelChangeDescriptor;
- (unint64_t)HUDVisibiltyChangeDescriptor;
- (unint64_t)allowedChromeItems;
- (unint64_t)chromeItems;
- (unint64_t)chromeItemsToBeDisplayedExternally;
- (unint64_t)edgeToHighlight;
- (unint64_t)endBehavior;
- (void)_accessibilityStatusDidChange;
- (void)_attachAccessibilityHUDIfNeeded;
- (void)_autoHideChrome;
- (void)_autoHideMuteToggleButton;
- (void)_cancelAutoHideChromeTimer;
- (void)_cancelMuteToggleButtonAutoHideTimer;
- (void)_changeMainModelToRelatedAtIndex:(int64_t)a3 changeOrigin:(unint64_t)a4;
- (void)_invalidateAXStoredPlayState;
- (void)_invalidateCanToggleSelectMode;
- (void)_invalidateControllersActiveness;
- (void)_invalidateDesiredPlayState;
- (void)_invalidateDiagnosticHUDState;
- (void)_invalidateDisplayTitleAndSubtitle;
- (void)_invalidateErrorIndicator;
- (void)_invalidateHUDSettings;
- (void)_invalidateIsAnyMenuOpen;
- (void)_invalidateIsInSelectMode;
- (void)_invalidateIsPerformingAnyExportOperation;
- (void)_invalidateLegibilityOverlayOpacity;
- (void)_invalidateMainAsset;
- (void)_invalidateMainAssetCollection;
- (void)_invalidateMainModelControllers;
- (void)_invalidateMainModelProperties;
- (void)_invalidateOutroFractionCompleted;
- (void)_invalidatePhotosGridEffectProvider;
- (void)_invalidatePlaybackDuration;
- (void)_invalidatePlaybackFractionCompleted;
- (void)_invalidateRecentlyUsedSongs;
- (void)_invalidateShouldAutoHideChrome;
- (void)_invalidateShouldAutoHideMuteToggleButton;
- (void)_invalidateShouldPreventDisplaySleep;
- (void)_invalidateSongControllerFailedAssets;
- (void)_invalidateSpecManager;
- (void)_invalidateViewLayoutSpec;
- (void)_invalidateViewMode;
- (void)_invalidateViewModeTransition;
- (void)_invalidateViewModelControllers;
- (void)_invalidateWantsRelatedOverlayScrollable;
- (void)_invalidateWantsSoloPlayback;
- (void)_readFromPhotosGridViewModel:(id)a3;
- (void)_registerForAccessibilityEvents;
- (void)_replayMusic;
- (void)_resetSelectedRelatedIndex;
- (void)_resetShouldAutoHideMuteToggleButton;
- (void)_scheduleMuteToggleButtonAutoHide;
- (void)_setMainModel:(id)a3 changeOrigin:(unint64_t)a4;
- (void)_setNeedsUpdate;
- (void)_updateAXStoredPlayState;
- (void)_updateCanToggleSelectMode;
- (void)_updateControllersActiveness;
- (void)_updateDesiredPlayState;
- (void)_updateDiagnosticHUDState;
- (void)_updateDisplayTitleAndSubtitle;
- (void)_updateErrorIndicator;
- (void)_updateHUDSettings;
- (void)_updateIsAnyMenuOpen;
- (void)_updateIsInSelectMode;
- (void)_updateIsPerformingAnyExportOperation;
- (void)_updateLegibilityOverlayOpacity;
- (void)_updateMainAsset;
- (void)_updateMainAssetCollection;
- (void)_updateMainModelControllers;
- (void)_updateMainModelProperties;
- (void)_updateOutroFractionCompleted;
- (void)_updatePhotosGridEffectProvider;
- (void)_updatePlaybackDuration;
- (void)_updatePlaybackFractionCompleted;
- (void)_updateRecentlyUsedSongs;
- (void)_updateScrubberFeedbackGeneratorWithShouldImpact:(BOOL)a3 shouldPrepare:(BOOL)a4;
- (void)_updateShouldAutoHideChrome;
- (void)_updateShouldAutoHideMuteToggleButton;
- (void)_updateShouldPreventDisplaySleep;
- (void)_updateSongControllerFailedAssets;
- (void)_updateSpecManager;
- (void)_updateViewLayoutSpec;
- (void)_updateViewMode;
- (void)_updateViewModeTransition;
- (void)_updateViewModelControllers;
- (void)_updateWantsRelatedOverlayScrollable;
- (void)_updateWantsSoloPlayback;
- (void)addInternalActionsTo:(id)a3;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
- (void)autoPlayUpNext;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)cycleHUDType;
- (void)dealloc;
- (void)deselectAllGridItems;
- (void)didPerformChanges;
- (void)hideMuteToggleButtonWhenChromeIsHidden;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)liveResizeDidEnd;
- (void)liveResizeWillStart;
- (void)networkStatusMonitor:(id)a3 didChangeBestAvailableNetworkType:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)rewindToBeginning:(BOOL)a3;
- (void)rewindToBeginning:(BOOL)a3 rewindMusic:(BOOL)a4;
- (void)selectAllGridItems;
- (void)selectRelatedAtIndex:(int64_t)a3;
- (void)setActionPerformer:(id)a3;
- (void)setAllowedChromeItems:(unint64_t)a3;
- (void)setAudioSessionController:(id)a3;
- (void)setAutoHideChromeTimer:(id)a3;
- (void)setAutoHideMuteToggleButtonTimer:(id)a3;
- (void)setBottomGradientLegibilityOverlayOpacity:(double)a3;
- (void)setBufferingController:(id)a3;
- (void)setBufferingIndicatorVisibilityFraction:(double)a3;
- (void)setCanShowMuteToggleButtonWhenChromeIsHidden:(BOOL)a3;
- (void)setCanToggleSelectMode:(BOOL)a3;
- (void)setChromeItems:(unint64_t)a3;
- (void)setChromeItemsToBeDisplayedExternally:(unint64_t)a3;
- (void)setChromeTitleInfo:(id)a3;
- (void)setChromeVisibilityFraction:(double)a3;
- (void)setCurrentPlaybackTime:(id *)a3;
- (void)setCustomGeneralChromeTitleConfiguration:(id)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4;
- (void)setDiagnosticHUDType:(int64_t)a3;
- (void)setDidSelectAnyRelated:(BOOL)a3;
- (void)setDisplaySubtitle:(id)a3;
- (void)setDisplayTitle:(id)a3;
- (void)setDisplayedError:(id)a3;
- (void)setEdgeToHighlight:(unint64_t)a3;
- (void)setFadeOutOverlayVisibilityFraction:(double)a3;
- (void)setHasAnyError:(BOOL)a3;
- (void)setHighlightedRelatedIndex:(int64_t)a3;
- (void)setIsActionMenuOpen:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsAnyMenuOpen:(BOOL)a3;
- (void)setIsAtPlaybackEnd:(BOOL)a3;
- (void)setIsAtPlaybackStart:(BOOL)a3;
- (void)setIsHUDVisible:(BOOL)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setIsPerformingAnyExportOperation:(BOOL)a3;
- (void)setIsPerformingCrossfadeTransitionToRelated:(BOOL)a3;
- (void)setIsPerformingViewControllerTransition:(BOOL)a3;
- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setIsUserPerformingRemoteGesture:(BOOL)a3;
- (void)setLastMainModelChangeDate:(id)a3;
- (void)setLastSkipSegmentActionDate:(id)a3;
- (void)setMainAsset:(id)a3;
- (void)setMainAssetCollection:(id)a3;
- (void)setMainConfiguration:(id)a3;
- (void)setMaximumIndividualTopChromeItemVisibilityFraction:(double)a3;
- (void)setMenuIsOpen:(BOOL)a3 withIdentifier:(id)a4;
- (void)setModelCoveredByRelated:(id)a3;
- (void)setMusicPlayer:(id)a3;
- (void)setMuteStateController:(id)a3;
- (void)setMuteToggleButtonVisibilityFraction:(double)a3;
- (void)setMuted:(BOOL)a3 reason:(int64_t)a4;
- (void)setNeedsStatusBarVisible:(BOOL)a3;
- (void)setOutroFractionCompleted:(double)a3;
- (void)setOverlayController:(id)a3;
- (void)setPacingController:(id)a3;
- (void)setPausingPlaybackShowsChrome:(BOOL)a3;
- (void)setPerformingExportOperation:(BOOL)a3 withIdentifier:(id)a4;
- (void)setPersistenceController:(id)a3;
- (void)setPhotosGridViewInteraction:(id)a3;
- (void)setPhotosGridViewModel:(id)a3;
- (void)setPlaybackDuration:(id *)a3;
- (void)setPlaybackEndDarkening:(double)a3;
- (void)setPlaybackFractionCompleted:(double)a3;
- (void)setPreventedDisplaySleepToken:(id)a3;
- (void)setRelatedConfigurations:(id)a3;
- (void)setRelatedController:(id)a3;
- (void)setRelatedModels:(id)a3;
- (void)setRelatedOverlayVisibilityFraction:(double)a3;
- (void)setResourcesPreloadingController:(id)a3;
- (void)setScrubberPosition:(id *)a3;
- (void)setScrubberVisibilityFraction:(double)a3;
- (void)setSelectedRelatedIndex:(int64_t)a3;
- (void)setShouldAutoHideChrome:(BOOL)a3;
- (void)setShouldAutoHideMuteToggleButton:(BOOL)a3;
- (void)setShouldAutoReplayPreference:(BOOL)a3;
- (void)setShouldCountDownToUpNext:(BOOL)a3;
- (void)setShouldPreventDisplaySleep:(BOOL)a3;
- (void)setShouldShowErrorIndicator:(BOOL)a3;
- (void)setShouldSimplifyUIForAccessibility:(BOOL)a3;
- (void)setShowSongInTitleWhenPaused:(BOOL)a3;
- (void)setSolidLegibilityOverlayOpacity:(double)a3;
- (void)setSongController:(id)a3;
- (void)setStyleSwitcherVisibilityFraction:(double)a3;
- (void)setSwipeDownDismissalPreviewEnabled:(BOOL)a3;
- (void)setSwipeDownDismissalPreviewFraction:(double)a3;
- (void)setSwipeDownInteractionState:(id *)a3;
- (void)setSwipeDownTriggeringDismissal:(BOOL)a3;
- (void)setTopGradientLegibilityOverlayOpacity:(double)a3;
- (void)setValidationController:(id)a3;
- (void)setViewControllerDismissalTargetPlacement:(id)a3;
- (void)setViewEnvironmentModel:(id)a3;
- (void)setViewLayoutSpec:(id)a3;
- (void)setViewMode:(int64_t)a3;
- (void)setViewModeTransition:(id)a3;
- (void)setVolume:(double)a3;
- (void)setWantsChromeVisible:(BOOL)a3;
- (void)setWantsPlaybackEndDarkening:(BOOL)a3;
- (void)setWantsRelatedOverlayNavigationButtonsVisible:(BOOL)a3;
- (void)setWantsRelatedOverlayScrollable:(BOOL)a3;
- (void)setWantsRelatedOverlayVisible:(BOOL)a3;
- (void)setWantsScrubberVisible:(BOOL)a3;
- (void)setWantsSoloPlayback:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)temporarilyShowMuteToggleButtonWhenChromeIsHidden;
- (void)toggleAutoReplayPreference;
- (void)toggleChrome;
- (void)toggleHUD;
- (void)togglePlayback;
@end

@implementation PXStoryViewModel

- (id)makeDefaultActionsMenu
{
  v3 = self;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_1AA6302A4;
  v9[5] = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1A9CD752C;
  v9[3] = &block_descriptor_12_5;
  v5 = _Block_copy(v9);
  v6 = self;
  swift_release();
  id v7 = objc_msgSend(v3, sel_menuWithDeferredConfiguration_, v5);
  _Block_release(v5);

  return v7;
}

- (void)addInternalActionsTo:(id)a3
{
  uint64_t v4 = (objc_class *)a3;
  v5._menuItems = (NSMutableArray *)self;
  menuItems = v5._menuItems;
  v5.super.isa = v4;
  PXStoryViewModel.addInternalActions(to:)(v5);
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [PXStoryTimelineVisualDiagnosticsProvider alloc];
  id v11 = [(PXStoryViewModel *)self mainModel];
  v9 = [(PXStoryViewModel *)self extendedTraitCollection];
  [v9 displayScale];
  v10 = -[PXStoryTimelineVisualDiagnosticsProvider initWithModel:screenScale:](v8, "initWithModel:screenScale:", v11);
  [(PXStoryTimelineVisualDiagnosticsProvider *)v10 addVisualDiagnosticsToContext:v7 completionHandler:v6];
}

- (id)memoryDebugInfo
{
  v2 = [(PXStoryViewModel *)self mainAssetCollection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    uint64_t v4 = [v3 photoLibrary];
    PXMenuBuilder v5 = [v3 photosGraphProperties];
    id v6 = [v3 localIdentifier];
    id v7 = +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:](PXMemoriesRelatedDiagnosticsHelper, "preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:", v5, v6, [v3 photosGraphVersion], v4);
    v8 = (void *)[v7 mutableCopy];

    v9 = [v3 localIdentifier];
    uint64_t v13 = 0;
    v10 = [v4 curationDebugInformationForAssetCollectionWithLocalIdentifier:v9 options:&unk_1F02DA870 error:&v13];

    if (v10) {
      [v8 addEntriesFromDictionary:v10];
    }
    id v11 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:v3];
    [v8 setObject:v11 forKeyedSubscript:@"memorySummary"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v11 = a3;
  uint64_t v4 = +[PXStorySettings sharedInstance];
  PXMenuBuilder v5 = PXStoryDiagnosticDescriptionForAllHUDTypes(self, 1);
  [v11 addAttachmentWithText:v5 name:@"HUD"];
  id v6 = [(PXStoryViewModel *)self mainModel];
  [v11 addSubprovider:v6];

  id v7 = [(PXStoryViewModel *)self relatedController];
  [v11 addSubprovider:v7];

  v8 = [(PXStoryViewModel *)self pacingController];
  [v11 addSubprovider:v8];

  v9 = [(PXStoryViewModel *)self memoryDebugInfo];
  if (v9) {
    [v11 addAttachmentWithDictionary:v9 name:@"MemoryInfoAndCuration"];
  }
  v10 = (void *)[objc_alloc((Class)off_1E5DA9860) initWithRootProvider:self];
  [v10 setName:@"Visual Diagnostics"];
  objc_msgSend(v10, "setIsPrivateDataAllowed:", objc_msgSend(v4, "includeImagesInVisualDiagnosticsForTTR"));
  [v11 addSubprovider:v10];
}

- (NSString)diagnosticDescriptionForAllHUDTypes
{
  return (NSString *)PXStoryDiagnosticDescriptionForAllHUDTypes(self, 0);
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXStoryViewModel_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke;
  aBlock[3] = &unk_1E5DD2D18;
  id v46 = v6;
  id v52 = v46;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (a3 == 14)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v8 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    id v9 = [NSString alloc];
    v10 = [(PXStoryViewModel *)self lastMainModelChangeDate];
    id v11 = [v8 stringFromDate:v10];
    v12 = (void *)[v9 initWithFormat:@"Playback Started: %@\n", v11];
    v7[2](v7, v12);
  }
  uint64_t v13 = [(PXStoryViewModel *)self diagnosticTextForHUDType:a3];
  v7[2](v7, v13);

  v14 = [(PXStoryViewModel *)self mainModel];
  v15 = [v14 diagnosticTextForHUDType:a3];
  v7[2](v7, v15);

  v16 = [(PXStoryViewModel *)self musicPlayer];
  v17 = [v16 diagnosticTextForHUDType:a3];
  v7[2](v7, v17);

  v18 = [(PXStoryViewModel *)self pacingController];
  v19 = [v18 diagnosticTextForHUDType:a3];
  v7[2](v7, v19);

  if (a3 == 14)
  {
    id v20 = [NSString alloc];
    BOOL v21 = [(PXStoryViewModel *)self shouldPreventDisplaySleep];
    v22 = @"No 😴";
    if (v21) {
      v22 = @"Yes 😳";
    }
    v23 = (void *)[v20 initWithFormat:@"Prevent Sleep: %@\n", v22];
    v7[2](v7, v23);

    id v24 = [NSString alloc];
    v25 = PXStoryViewModeDescription([(PXStoryViewModel *)self viewMode]);
    v26 = (void *)[v24 initWithFormat:@"View Mode: %@\n", v25];
    v7[2](v7, v26);
  }
  v27 = [(PXStoryViewModel *)self errorRepository];
  v28 = [v27 errorsByComponent];
  v29 = (void *)[v28 mutableCopy];

  for (uint64_t i = 0; i != 20; ++i)
  {
    v31 = [(PXStoryViewModel *)self diagnosticHUDContentProviderForType:i];
    v32 = [v31 diagnosticErrorsByComponentForHUDType:i];

    if (v32) {
      [v29 addEntriesFromDictionary:v32];
    }
  }
  if ([v29 count])
  {
    v45 = v7;
    [v46 appendString:@"\n⚠️ Errors:\n"];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v33 = [v29 allKeys];
    v34 = [v33 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          v40 = [v29 objectForKeyedSubscript:v39];
          v41 = [v40 localizedDescription];
          v42 = PXStoryErrorDetailsDescription(v40);
          [v46 appendFormat:@"• %@: %@ / %@\n", v39, v41, v42];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v36);
    }

    id v7 = v45;
  }
  v43 = (void *)[v46 copy];

  return v43;
}

void __70__PXStoryViewModel_Diagnostics__diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    if ([*(id *)(a1 + 32) length]) {
      [*(id *)(a1 + 32) appendString:@"\n"];
    }
    [*(id *)(a1 + 32) appendString:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMainModelChangeDate, 0);
  objc_storeStrong((id *)&self->_photosGridViewInteraction, 0);
  objc_storeStrong((id *)&self->_validationController, 0);
  objc_storeStrong((id *)&self->_muteStateController, 0);
  objc_storeStrong((id *)&self->_bufferingController, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingController, 0);
  objc_storeStrong((id *)&self->_songController, 0);
  objc_storeStrong((id *)&self->_pacingController, 0);
  objc_storeStrong((id *)&self->_musicPlayer, 0);
  objc_storeStrong((id *)&self->_relatedController, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_errorRepository, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingCoordinator, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_autoHideChromeTimer, 0);
  objc_storeStrong((id *)&self->_autoHideMuteToggleButtonTimer, 0);
  objc_storeStrong((id *)&self->_scrubberFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_modelCoveredByRelated);
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdateQueue, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdater, 0);
  objc_storeStrong((id *)&self->_preventedDisplaySleepToken, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_diagnosticHUDContentProvidersByType, 0);
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewLayoutSpecManager, 0);
  objc_storeStrong((id *)&self->_photosGridViewModel, 0);
  objc_storeStrong((id *)&self->_chromeTitleInfo, 0);
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_mainAsset, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_displayedError, 0);
  objc_storeStrong((id *)&self->_relatedConfigurations, 0);
  objc_storeStrong((id *)&self->_relatedModels, 0);
  objc_storeStrong((id *)&self->_mainConfiguration, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_viewEnvironmentModel);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_destroyWeak((id *)&self->_actionPerformer);
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_mainAssetCollection, 0);
  objc_storeStrong((id *)&self->_lastSkipSegmentActionDate, 0);
  objc_storeStrong((id *)&self->_viewControllerDismissalTargetPlacement, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_customGeneralChromeTitleConfiguration, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_mainAssetInfoUpdateQueue_titleDateFormatter, 0);
  objc_storeStrong((id *)&self->_exportOperationIdentifiers, 0);
  objc_storeStrong((id *)&self->_openMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDContentProvider, 0);
}

- (void)setPausingPlaybackShowsChrome:(BOOL)a3
{
  self->_pausingPlaybackShowsChrome = a3;
}

- (BOOL)pausingPlaybackShowsChrome
{
  return self->_pausingPlaybackShowsChrome;
}

- (void)setLastMainModelChangeDate:(id)a3
{
}

- (NSDate)lastMainModelChangeDate
{
  return self->_lastMainModelChangeDate;
}

- (void)setPhotosGridViewInteraction:(id)a3
{
}

- (PXPhotosViewInteraction)photosGridViewInteraction
{
  return self->_photosGridViewInteraction;
}

- (PXStoryValidationController)validationController
{
  return self->_validationController;
}

- (PXStoryMuteStateController)muteStateController
{
  return self->_muteStateController;
}

- (PXStoryViewBufferingController)bufferingController
{
  return self->_bufferingController;
}

- (PXStoryPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (PXStoryViewResourcesPreloadingController)resourcesPreloadingController
{
  return self->_resourcesPreloadingController;
}

- (PXStorySongController)songController
{
  return self->_songController;
}

- (PXStoryPacingController)pacingController
{
  return self->_pacingController;
}

- (PXStoryMusicPlayer)musicPlayer
{
  return self->_musicPlayer;
}

- (PXStoryRelatedController)relatedController
{
  return self->_relatedController;
}

- (PXStoryOverlayController)overlayController
{
  return self->_overlayController;
}

- (PXStoryAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (BOOL)shouldAutoHideChrome
{
  return self->_shouldAutoHideChrome;
}

- (PXStoryErrorRepository)errorRepository
{
  return self->_errorRepository;
}

- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator
{
  return self->_resourcesPreloadingCoordinator;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void)setAutoHideChromeTimer:(id)a3
{
}

- (NSTimer)autoHideChromeTimer
{
  return self->_autoHideChromeTimer;
}

- (void)setAutoHideMuteToggleButtonTimer:(id)a3
{
}

- (NSTimer)autoHideMuteToggleButtonTimer
{
  return self->_autoHideMuteToggleButtonTimer;
}

- (UIImpactFeedbackGenerator)scrubberFeedbackGenerator
{
  return self->_scrubberFeedbackGenerator;
}

- (BOOL)shouldAutoHideMuteToggleButton
{
  return self->_shouldAutoHideMuteToggleButton;
}

- (PXStoryModel)modelCoveredByRelated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoveredByRelated);
  return (PXStoryModel *)WeakRetained;
}

- (NSMutableSet)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (NSMutableSet)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (OS_dispatch_queue)mainAssetInfoUpdateQueue
{
  return self->_mainAssetInfoUpdateQueue;
}

- (PXInfoUpdater)mainAssetInfoUpdater
{
  return self->_mainAssetInfoUpdater;
}

- (void)setPreventedDisplaySleepToken:(id)a3
{
}

- (PXApplicationDisabledIdleTimerToken)preventedDisplaySleepToken
{
  return self->_preventedDisplaySleepToken;
}

- (BOOL)wantsSoloPlayback
{
  return self->_wantsSoloPlayback;
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (PXStoryPausableLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (BOOL)isAtPlaybackStart
{
  return self->_isAtPlaybackStart;
}

- (BOOL)isReadingFromPhotosGridViewModel
{
  return self->_isReadingFromPhotosGridViewModel;
}

- (BOOL)hasAnyError
{
  return self->_hasAnyError;
}

- (NSMapTable)diagnosticHUDContentProvidersByType
{
  return self->_diagnosticHUDContentProvidersByType;
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryViewLayoutSpecManager)viewLayoutSpecManager
{
  return self->_viewLayoutSpecManager;
}

- (BOOL)shouldAutoReplayPreference
{
  return self->_shouldAutoReplayPreference;
}

- (BOOL)wantsFeedbackAction
{
  return self->_wantsFeedbackAction;
}

- (BOOL)shouldSimplifyUIForAccessibility
{
  return self->_shouldSimplifyUIForAccessibility;
}

- (BOOL)isUserPerformingRemoteGesture
{
  return self->_isUserPerformingRemoteGesture;
}

- (int64_t)highlightedRelatedIndex
{
  return self->_highlightedRelatedIndex;
}

- (PXPhotosViewModel)photosGridViewModel
{
  return self->_photosGridViewModel;
}

- (BOOL)isPerformingCrossfadeTransitionToRelated
{
  return self->_isPerformingCrossfadeTransitionToRelated;
}

- (BOOL)canShowMuteToggleButtonWhenChromeIsHidden
{
  return self->_canShowMuteToggleButtonWhenChromeIsHidden;
}

- (double)volume
{
  return self->_volume;
}

- (int64_t)lastMutedChangeReason
{
  return self->_lastMutedChangeReason;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (BOOL)showSongInTitleWhenPaused
{
  return self->_showSongInTitleWhenPaused;
}

- (PXStoryViewChromeTitleInfo)chromeTitleInfo
{
  return self->_chromeTitleInfo;
}

- (NSAttributedString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (NSAttributedString)displayTitle
{
  return self->_displayTitle;
}

- (PXDisplayAsset)mainAsset
{
  return self->_mainAsset;
}

- (PXAnonymousViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PXAnonymousViewController *)WeakRetained;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (BOOL)canToggleSelectMode
{
  return self->_canToggleSelectMode;
}

- (NSError)displayedError
{
  return self->_displayedError;
}

- (BOOL)shouldShowErrorIndicator
{
  return self->_shouldShowErrorIndicator;
}

- (BOOL)isActionMenuOpen
{
  return self->_isActionMenuOpen;
}

- (BOOL)isPerformingAnyExportOperation
{
  return self->_isPerformingAnyExportOperation;
}

- (BOOL)isAnyMenuOpen
{
  return self->_isAnyMenuOpen;
}

- (BOOL)shouldPreventDisplaySleep
{
  return self->_shouldPreventDisplaySleep;
}

- (BOOL)didSelectAnyRelated
{
  return self->_didSelectAnyRelated;
}

- (int64_t)selectedRelatedIndex
{
  return self->_selectedRelatedIndex;
}

- (NSArray)relatedConfigurations
{
  return self->_relatedConfigurations;
}

- (NSArray)relatedModels
{
  return self->_relatedModels;
}

- (PXStoryConfiguration)mainConfiguration
{
  return self->_mainConfiguration;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXStoryViewEnvironmentModel)viewEnvironmentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewEnvironmentModel);
  return (PXStoryViewEnvironmentModel *)WeakRetained;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryViewActionPerformer)actionPerformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformer);
  return (PXStoryViewActionPerformer *)WeakRetained;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (PXDisplayAssetCollection)mainAssetCollection
{
  return self->_mainAssetCollection;
}

- (double)styleSwitcherVisibilityFraction
{
  return self->_styleSwitcherVisibilityFraction;
}

- (unint64_t)edgeToHighlight
{
  return self->_edgeToHighlight;
}

- (NSDate)lastSkipSegmentActionDate
{
  return self->_lastSkipSegmentActionDate;
}

- ($7DA682ECC7253F641496E0B6E9C98204)scrubberPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 904);
  return self;
}

- (double)scrubberVisibilityFraction
{
  return self->_scrubberVisibilityFraction;
}

- (BOOL)wantsScrubberVisible
{
  return self->_wantsScrubberVisible;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (double)swipeDownDismissalPreviewFraction
{
  return self->_swipeDownDismissalPreviewFraction;
}

- (BOOL)swipeDownDismissalPreviewEnabled
{
  return self->_swipeDownDismissalPreviewEnabled;
}

- (BOOL)swipeDownTriggeringDismissal
{
  return self->_swipeDownTriggeringDismissal;
}

- (PXGItemPlacement)viewControllerDismissalTargetPlacement
{
  return self->_viewControllerDismissalTargetPlacement;
}

- (BOOL)isPerformingViewControllerTransition
{
  return self->_isPerformingViewControllerTransition;
}

- ($74445421B386A896E969A1525619931B)swipeDownInteractionState
{
  long long v3 = *(_OWORD *)&self[13].var2.y;
  retstr->var2 = *(CGPoint *)&self[13].var1.y;
  *(_OWORD *)&retstr->var3 = v3;
  retstr->var5 = self[13].var4;
  CGPoint v4 = *(CGPoint *)&self[13].var0.y;
  retstr->var0 = *(CGPoint *)&self[12].var5;
  retstr->var1 = v4;
  return self;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration
{
  return self->_customGeneralChromeTitleConfiguration;
}

- (double)bottomGradientLegibilityOverlayOpacity
{
  return self->_bottomGradientLegibilityOverlayOpacity;
}

- (double)topGradientLegibilityOverlayOpacity
{
  return self->_topGradientLegibilityOverlayOpacity;
}

- (double)solidLegibilityOverlayOpacity
{
  return self->_solidLegibilityOverlayOpacity;
}

- (double)playbackEndDarkening
{
  return self->_playbackEndDarkening;
}

- (BOOL)wantsPlaybackEndDarkening
{
  return self->_wantsPlaybackEndDarkening;
}

- (BOOL)shouldCountDownToUpNext
{
  return self->_shouldCountDownToUpNext;
}

- (BOOL)wantsRelatedOverlayNavigationButtonsVisible
{
  return self->_wantsRelatedOverlayNavigationButtonsVisible;
}

- (BOOL)isRelatedOverlayScrolledIntoView
{
  return self->_isRelatedOverlayScrolledIntoView;
}

- (double)fadeOutOverlayVisibilityFraction
{
  return self->_fadeOutOverlayVisibilityFraction;
}

- (double)relatedOverlayVisibilityFraction
{
  return self->_relatedOverlayVisibilityFraction;
}

- (BOOL)wantsRelatedOverlayScrollable
{
  return self->_wantsRelatedOverlayScrollable;
}

- (BOOL)wantsRelatedOverlayVisible
{
  return self->_wantsRelatedOverlayVisible;
}

- (double)maximumIndividualTopChromeItemVisibilityFraction
{
  return self->_maximumIndividualTopChromeItemVisibilityFraction;
}

- (double)muteToggleButtonVisibilityFraction
{
  return self->_muteToggleButtonVisibilityFraction;
}

- (double)bufferingIndicatorVisibilityFraction
{
  return self->_bufferingIndicatorVisibilityFraction;
}

- (unint64_t)chromeItemsToBeDisplayedExternally
{
  return self->_chromeItemsToBeDisplayedExternally;
}

- (unint64_t)allowedChromeItems
{
  return self->_allowedChromeItems;
}

- (unint64_t)chromeItems
{
  return self->_chromeItems;
}

- (double)chromeVisibilityFraction
{
  return self->_chromeVisibilityFraction;
}

- (BOOL)needsStatusBarVisible
{
  return self->_needsStatusBarVisible;
}

- (BOOL)wantsChromeVisible
{
  return self->_wantsChromeVisible;
}

- (double)outroFractionCompleted
{
  return self->_outroFractionCompleted;
}

- (BOOL)isAtPlaybackEnd
{
  return self->_isAtPlaybackEnd;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 880);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 856);
  return self;
}

- (double)playbackFractionCompleted
{
  return self->_playbackFractionCompleted;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (int64_t)diagnosticHUDType
{
  return self->_diagnosticHUDType;
}

- (BOOL)isHUDVisible
{
  return self->_isHUDVisible;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)networkStatusMonitor:(id)a3 didChangeBestAvailableNetworkType:(id)a4
{
  if (a4.var0 != 1)
  {
    id v5 = [(PXStoryViewModel *)self errorReporter];
    [v5 setError:0 forComponent:@"NetworkReachablity"];
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (a3 == 14)
  {
    BOOL v6 = [(PXStoryViewModel *)self shouldSimplifyUIForAccessibility];
    id v7 = @"NO";
    if (v6) {
      id v7 = @"YES";
    }
    id v8 = v7;
    [v5 appendFormat:@"UI Simplified For AX: %@\n", v8];
  }
  id v9 = (void *)[v5 copy];

  return v9;
}

- (unint64_t)HUDStoryModelChangeDescriptor
{
  return 64;
}

- (unint64_t)HUDContentChangeDescriptor
{
  return 7172;
}

- (unint64_t)HUDVisibiltyChangeDescriptor
{
  return 1024;
}

- (void)setShouldSimplifyUIForAccessibility:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_shouldSimplifyUIForAccessibility != a3)
  {
    BOOL v3 = a3;
    self->_shouldSimplifyUIForAccessibility = a3;
    id v5 = PLStoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = @"NO";
      if (v3) {
        BOOL v6 = @"YES";
      }
      id v7 = v6;
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "UI simplification for accessibility %@", buf, 0xCu);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__PXStoryViewModel_setShouldSimplifyUIForAccessibility___block_invoke;
    v8[3] = &unk_1E5DC30B0;
    v8[4] = self;
    BOOL v9 = v3;
    [(PXStoryViewModel *)self performChanges:v8];
  }
}

uint64_t __56__PXStoryViewModel_setShouldSimplifyUIForAccessibility___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _invalidateShouldAutoHideChrome];
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setWantsChromeVisible:1];
  }
  return result;
}

- (void)_accessibilityStatusDidChange
{
  BOOL v3 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  [(PXStoryViewModel *)self setShouldSimplifyUIForAccessibility:v3];
}

- (void)_registerForAccessibilityEvents
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accessibilityStatusDidChange name:*MEMORY[0x1E4FB25D0] object:0];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__accessibilityStatusDidChange name:*MEMORY[0x1E4FB24E8] object:0];

  [(PXStoryViewModel *)self _accessibilityStatusDidChange];
}

- (void)_attachAccessibilityHUDIfNeeded
{
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  BOOL v6 = [a3 underlyingErrors];
  id v7 = [v6 firstObject];

  id v8 = [v7 localizedRecoveryOptions];
  unint64_t v9 = [v8 count];

  unint64_t v10 = a4 - v9;
  if (a4 < v9)
  {
    id v11 = [v7 recoveryAttempter];
    [v11 attemptRecoveryFromError:v7 optionIndex:a4];
LABEL_6:

    goto LABEL_8;
  }
  if (v10 == 1)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PXStoryViewModel_attemptRecoveryFromError_optionIndex___block_invoke;
    v13[3] = &unk_1E5DD1EF0;
    v13[4] = self;
    [(PXStoryViewModel *)self performChanges:v13];
    goto LABEL_8;
  }
  if (!v10)
  {
    id v11 = [(PXStoryViewModel *)self actionPerformer];
    [v11 performActionForChromeActionMenuItem:8 withValue:0 sender:0];
    goto LABEL_6;
  }
LABEL_8:

  return 1;
}

uint64_t __57__PXStoryViewModel_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldShowErrorIndicator:0];
}

- (id)_internalRecoveryOptions
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = PXLocalizedStringFromTable(@"InteractiveMemoryInternalRecovery_FileRadar_AlertAction", @"PhotosUICore");
  v6[0] = v2;
  BOOL v3 = PXLocalizedStringFromTable(@"InteractiveMemoryInternalRecovery_HideError_AlertAction", @"PhotosUICore");
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  BOOL v6 = NSStringFromSelector(sel_defaultHUDType);
  if ([v5 isEqualToString:v6])
  {

LABEL_4:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PXStoryViewModel_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_5;
  }
  id v7 = NSStringFromSelector(sel_isHUDVisible);
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __48__PXStoryViewModel_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PXStoryViewModel_settings_changedValueForKey___block_invoke_2;
  v3[3] = &unk_1E5DD1EF0;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __48__PXStoryViewModel_settings_changedValueForKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDiagnosticHUDState];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PXStoryViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DC3088;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryViewModel *)self performChanges:v5];
}

void __49__PXStoryViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 != MainModelObservationContext_186383)
  {
    if (v4 == ViewLayoutSpecManagerObservationContext)
    {
      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_57;
      }
      id v14 = v3;
      [*(id *)(a1 + 32) _invalidateViewLayoutSpec];
      goto LABEL_56;
    }
    if (v4 == ErrorRepositoryObservationContext)
    {
      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_57;
      }
      id v14 = v3;
      [*(id *)(a1 + 32) _invalidateErrorIndicator];
      goto LABEL_56;
    }
    if (v4 == PhotosGridViewModelObservationContext)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v14 = v3;
      if ((v11 & 0x200000) != 0)
      {
        [*(id *)(a1 + 32) _invalidateCanToggleSelectMode];
        id v3 = v14;
        uint64_t v11 = *(void *)(a1 + 48);
      }
      if ((v11 & 4) != 0)
      {
        [*(id *)(a1 + 32) _invalidateIsInSelectMode];
        goto LABEL_56;
      }
    }
    else
    {
      if (v4 == ViewModeTransitionObservationContext_186384)
      {
        if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
          goto LABEL_57;
        }
        id v14 = v3;
        [*(id *)(a1 + 32) _invalidateLegibilityOverlayOpacity];
        goto LABEL_56;
      }
      if (v4 == HUDObservableObservationContext)
      {
        id v14 = v3;
        BOOL v12 = [*(id *)(a1 + 32) diagnosticHUDType] == 17;
        id v3 = v14;
        if (v12)
        {
          [*(id *)(a1 + 32) _attachAccessibilityHUDIfNeeded];
          goto LABEL_56;
        }
      }
      else
      {
        if (v4 != MusicPlayerObservationContext)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryViewModel.m" lineNumber:2510 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        if ((*(unsigned char *)(a1 + 48) & 4) != 0)
        {
          id v14 = v3;
          [*(id *)(a1 + 32) _invalidateSongControllerFailedAssets];
LABEL_56:
          id v3 = v14;
          goto LABEL_57;
        }
      }
    }
    goto LABEL_57;
  }
  id v14 = v3;
  id v5 = [*(id *)(a1 + 32) mainModel];
  BOOL v6 = [v5 changesOrigins];
  id v7 = [*(id *)(a1 + 32) modelChangeOrigin];
  char v8 = [v6 containsObject:v7];

  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x10000) != 0 && (v8 & 1) == 0)
  {
    [*(id *)(a1 + 32) _invalidateViewMode];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((v9 & 2) != 0) {
    char v10 = v8;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    [*(id *)(a1 + 32) _invalidateDesiredPlayState];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((v9 & 0x10000000) != 0)
  {
    [*(id *)(a1 + 32) _invalidateShouldAutoHideChrome];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((v9 & 0x80001) != 0)
  {
    [*(id *)(a1 + 32) _invalidatePlaybackFractionCompleted];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((v9 & 0x20000) != 0)
  {
    [*(id *)(a1 + 32) _invalidatePlaybackDuration];
    uint64_t v9 = *(void *)(a1 + 48);
    if ((v9 & 0x400000000000) == 0)
    {
LABEL_24:
      if ((v9 & 0x800) == 0) {
        goto LABEL_25;
      }
      goto LABEL_40;
    }
  }
  else if ((v9 & 0x400000000000) == 0)
  {
    goto LABEL_24;
  }
  [*(id *)(a1 + 32) _invalidateOutroFractionCompleted];
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x800) == 0)
  {
LABEL_25:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
LABEL_40:
  [*(id *)(a1 + 32) _invalidateMainAssetCollection];
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x8000) == 0)
  {
LABEL_26:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_42;
  }
LABEL_41:
  [*(id *)(a1 + 32) signalChange:4096];
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x400000) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_43;
  }
LABEL_42:
  [*(id *)(a1 + 32) _invalidateViewModeTransition];
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_43:
  [*(id *)(a1 + 32) _invalidatePhotosGridEffectProvider];
  uint64_t v9 = *(void *)(a1 + 48);
  if ((v9 & 0x200) != 0)
  {
LABEL_29:
    [*(id *)(a1 + 32) _invalidateDisplayTitleAndSubtitle];
    [*(id *)(a1 + 32) _invalidateRecentlyUsedSongs];
    uint64_t v9 = *(void *)(a1 + 48);
  }
LABEL_30:
  if ((v9 & 0x18000400000) != 0)
  {
    [*(id *)(a1 + 32) _invalidateLegibilityOverlayOpacity];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    [*(id *)(a1 + 32) rewindToBeginning:1];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  id v3 = v14;
  if ((v9 & 0x40) != 0)
  {
    [*(id *)(a1 + 32) _invalidateMainAsset];
    goto LABEL_56;
  }
LABEL_57:
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5 = a3;
  id v6 = [(PXStoryViewModel *)self mainAssetInfoUpdater];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXStoryViewModel.m" lineNumber:2429 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PXStoryViewModel_infoUpdaterDidUpdate___block_invoke;
  v8[3] = &unk_1E5DD1EF0;
  v8[4] = self;
  [(PXStoryViewModel *)self performChanges:v8];
}

uint64_t __41__PXStoryViewModel_infoUpdaterDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDisplayTitleAndSubtitle];
}

- (NSDateFormatter)mainAssetInfoUpdateQueue_titleDateFormatter
{
  mainAssetInfoUpdateQueue_titleDateFormatter = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
  if (!mainAssetInfoUpdateQueue_titleDateFormatter)
  {
    uint64_t v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v4 setLocale:v5];

    [(NSDateFormatter *)v4 setDateStyle:2];
    [(NSDateFormatter *)v4 setTimeStyle:0];
    id v6 = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
    self->_mainAssetInfoUpdateQueue_titleDateFormatter = v4;

    mainAssetInfoUpdateQueue_titleDateFormatter = self->_mainAssetInfoUpdateQueue_titleDateFormatter;
  }
  return mainAssetInfoUpdateQueue_titleDateFormatter;
}

- (id)_mainAssetInfoUpdateQueue_infoForAsset:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 localizedGeoDescription];
  [v6 setObject:v7 forKeyedSubscript:@"PXStoryViewModelMainAssetInfoLocationDescriptionKey"];

  char v8 = [(PXStoryViewModel *)self mainAssetInfoUpdateQueue_titleDateFormatter];
  uint64_t v9 = [v5 localCreationDate];

  char v10 = [v8 stringFromDate:v9];
  [v6 setObject:v10 forKeyedSubscript:@"PXStoryViewModelMainAssetInfoDateDescriptionKey"];

  return v6;
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  if (![v7 isEqualToString:@"PXStoryViewModelMainAssetInfoKind"])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryViewModel.m" lineNumber:2397 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  char v10 = [(PXStoryViewModel *)self mainAsset];
  if (v10)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = [(PXStoryViewModel *)self mainAssetInfoUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PXStoryViewModel_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E5DD2078;
    id v15 = v9;
    objc_copyWeak(&v18, &location);
    id v16 = v10;
    id v17 = v8;
    dispatch_async(v11, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }

  return v9;
}

void __56__PXStoryViewModel_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_mainAssetInfoUpdateQueue_infoForAsset:", *(void *)(a1 + 40));
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_updateMainAsset
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  id v12 = 0;
  char v4 = [v3 getMainVisibleClipIdentifier:0 assetReferece:&v12];
  id v5 = v12;
  id v6 = v5;
  if ((v4 & 1) == 0)
  {

    goto LABEL_6;
  }
  id v7 = [v5 asset];

  if (!v7)
  {
LABEL_6:
    [(PXStoryViewModel *)self setMainAsset:0];
    id v8 = [(PXStoryViewModel *)self mainAssetInfoUpdater];
    [v8 invalidateInfo];
    goto LABEL_7;
  }
  id v8 = [v6 asset];
  uint64_t v9 = [(PXStoryViewModel *)self mainAsset];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    [(PXStoryViewModel *)self setMainAsset:v8];
    uint64_t v11 = [(PXStoryViewModel *)self mainAssetInfoUpdater];
    [v11 invalidateInfo];
  }
LABEL_7:
}

- (void)setMainAsset:(id)a3
{
  id v7 = (PXDisplayAsset *)a3;
  id v5 = self->_mainAsset;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXDisplayAsset *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainAsset, a3);
      [(PXStoryViewModel *)self signalChange:0x1000000000000000];
    }
  }
}

- (void)_invalidateMainAsset
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainAsset];
}

- (void)_updateDisplayTitleAndSubtitle
{
  v70 = +[PXStorySettings sharedInstance];
  id v3 = [(PXStoryViewModel *)self viewLayoutSpec];
  char v4 = [(PXStoryViewModel *)self mainModel];
  id v5 = [v4 currentStyle];
  char v6 = [v5 songResource];

  id v7 = objc_msgSend(v6, "px_storyResourceSongAsset");
  uint64_t v68 = [v7 title];

  id v8 = objc_msgSend(v6, "px_storyResourceSongAsset");
  uint64_t v9 = [v8 artistName];

  char v10 = [(PXStoryViewModel *)self mainAssetCollection];
  uint64_t v11 = [[_TtC12PhotosUICore27PXPhotosCollectionTitleInfo alloc] initWithAssetCollection:v10];
  id v12 = [off_1E5DA7230 defaultHelper];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PXStoryViewModel__updateDisplayTitleAndSubtitle__block_invoke;
  aBlock[3] = &unk_1E5DC3060;
  id v66 = v12;
  id v73 = v66;
  uint64_t v13 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v14 = [(PXPhotosCollectionTitleInfo *)v11 title];
  id v15 = v13[2](v13, v14);

  v67 = v11;
  id v16 = [(PXPhotosCollectionTitleInfo *)v11 subtitle];
  v65 = v13;
  id v17 = v13[2](v13, v16);

  v71 = v3;
  v62 = v10;
  v63 = v6;
  v69 = v9;
  if ([v3 shouldUseAssetCollectionForTitleAndSubtitle])
  {
    id v18 = [v15 localizedUppercaseString];
    v19 = [v17 localizedUppercaseString];
LABEL_6:
    id v20 = v19;
    int v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_7;
  }
  if ([(PXStoryViewModel *)self wantsRelatedOverlayVisible]
    || [(PXStoryViewModel *)self viewMode] == 2)
  {
    id v18 = v15;
    v19 = v17;
    goto LABEL_6;
  }
  v60 = v17;
  long long v50 = [(PXStoryViewModel *)self mainAssetInfoUpdater];
  v27 = [v50 info];

  long long v47 = (void *)v68;
  if (!v27)
  {
    v64 = 0;
    long long v49 = v65;
    long long v48 = v66;
    v45 = v15;
    goto LABEL_23;
  }
  v23 = [(__CFString *)v27 objectForKeyedSubscript:@"PXStoryViewModelMainAssetInfoLocationDescriptionKey"];
  id v51 = [(__CFString *)v27 objectForKeyedSubscript:@"PXStoryViewModelMainAssetInfoDateDescriptionKey"];
  id v52 = [(PXStoryViewModel *)self mainConfiguration];
  int v53 = [v52 preferAssetLocationAndCreationDateForClipTitleAndSubtitle];

  if (v53)
  {
    uint64_t v54 = &stru_1F00B0030;
    if (v23) {
      uint64_t v54 = v23;
    }
    id v18 = v54;
    int v21 = 0;
    v55 = v51;
    v22 = v51;
  }
  else if (v23)
  {
    id v18 = v23;
    int64_t v56 = [(PXStoryViewModel *)self desiredPlayState];
    if ([(PXStoryViewModel *)self showSongInTitleWhenPaused]
      || v56 == 1 && ![(PXStoryViewModel *)self isMuted])
    {
      int v21 = 1;
      v55 = (void *)v68;
      v22 = v51;
    }
    else
    {
      int v21 = 0;
      v22 = v51;
      v55 = v51;
    }
  }
  else
  {
    v22 = v51;
    id v18 = (__CFString *)v51;
    int v21 = 1;
    v55 = (void *)v68;
  }
  id v20 = v55;

  id v17 = v60;
LABEL_7:
  v59 = v22;
  v61 = v15;
  v58 = v23;
  if ([v70 simulateLongChromeStrings])
  {
    uint64_t v24 = [(__CFString *)v18 px_stringByRepeating:10];

    uint64_t v25 = [(__CFString *)v20 px_stringByRepeating:10];

    id v20 = (__CFString *)v25;
    id v18 = (__CFString *)v24;
  }
  if (v18) {
    v26 = v18;
  }
  else {
    v26 = &stru_1F00B0030;
  }
  v27 = v26;

  if (v20) {
    v28 = v20;
  }
  else {
    v28 = &stru_1F00B0030;
  }
  v29 = v28;

  BOOL v30 = [(PXStoryViewModel *)self wantsRelatedOverlayVisible];
  id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v30)
  {
    v32 = [v71 playbackEndTitleAttributes];
    v33 = (void *)[v31 initWithString:v27 attributes:v32];

    id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v35 = [v71 playbackEndSubtitleAttributes];
    uint64_t v36 = (void *)[v34 initWithString:v29 attributes:v35];

    uint64_t v37 = 0;
    id v38 = v29;
  }
  else
  {
    uint64_t v39 = [v71 chromeTitleAttributes];
    v33 = (void *)[v31 initWithString:v27 attributes:v39];

    if (v21 && -[__CFString length](v29, "length") && [v69 length])
    {
      uint64_t v40 = [v71 chromeSongStringWithTitle:v29 artist:v69];

      uint64_t v36 = [v71 chromeSongAttributedStringWithString:v40];
      uint64_t v37 = [v71 chromeSongSymbolName];
      id v38 = (id)v40;
    }
    else
    {
      id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
      v42 = [v71 chromeSubtitleAttributes];
      v43 = v41;
      id v38 = v29;
      uint64_t v36 = (void *)[v43 initWithString:v29 attributes:v42];

      uint64_t v37 = 0;
    }
  }
  v64 = v38;
  v57 = PXAttributedStringWithLanguageAwareLineHeightAdjustments(v33);

  v44 = PXAttributedStringWithLanguageAwareLineHeightAdjustments(v36);

  [(PXStoryViewModel *)self setDisplayTitle:v57];
  [(PXStoryViewModel *)self setDisplaySubtitle:v44];
  v45 = v61;
  uint64_t v9 = v69;
  id v46 = [[PXStoryViewChromeTitleInfo alloc] initWithCollectionTitle:v61 collectionSubtitle:v17 locationName:v58 dateName:v59 songName:v68 artistName:v69 title:v27 subtitle:v38 subtitleSymbolName:v37];
  long long v47 = (void *)v68;
  [(PXStoryViewModel *)self setChromeTitleInfo:v46];

  char v10 = v62;
  char v6 = v63;
  long long v49 = v65;
  long long v48 = v66;
LABEL_23:
}

id __50__PXStoryViewModel__updateDisplayTitleAndSubtitle__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) displayableTextForTitle:a2 intent:1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_invalidateDisplayTitleAndSubtitle
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDisplayTitleAndSubtitle];
}

- (void)_readFromPhotosGridViewModel:(id)a3
{
  BOOL isReadingFromPhotosGridViewModel = self->_isReadingFromPhotosGridViewModel;
  self->_BOOL isReadingFromPhotosGridViewModel = 1;
  id v6 = a3;
  id v7 = [(PXStoryViewModel *)self photosGridViewModel];
  (*((void (**)(id, void *))a3 + 2))(v6, v7);

  self->_BOOL isReadingFromPhotosGridViewModel = isReadingFromPhotosGridViewModel;
}

- (void)_updateSongControllerFailedAssets
{
  id v3 = [(PXStoryViewModel *)self musicPlayer];
  char v4 = [v3 failedAudioAssets];

  id v5 = [(PXStoryViewModel *)self songController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryViewModel__updateSongControllerFailedAssets__block_invoke;
  v7[3] = &unk_1E5DC3038;
  id v8 = v4;
  id v6 = v4;
  [v5 performChanges:v7];
}

uint64_t __53__PXStoryViewModel__updateSongControllerFailedAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFailedAudioAssets:*(void *)(a1 + 32)];
}

- (void)_invalidateSongControllerFailedAssets
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSongControllerFailedAssets];
}

- (void)_updateRecentlyUsedSongs
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  char v4 = [v3 currentSongResource];
  objc_msgSend(v4, "px_storyResourceSongAsset");
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v10;
  if (v10)
  {
    id v6 = [v10 identifier];
    uint64_t v7 = [v10 catalog];
    if (v7 == 4)
    {
      id v8 = [(PXStoryViewModel *)self recentlyUsedFlexSongIDs];
    }
    else
    {
      if (v7 != 2)
      {
LABEL_7:

        id v5 = v10;
        goto LABEL_8;
      }
      id v8 = [(PXStoryViewModel *)self recentlyUsedAppleMusicSongIDs];
    }
    uint64_t v9 = v8;
    [v8 addObject:v6];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_invalidateRecentlyUsedSongs
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecentlyUsedSongs];
}

- (void)_updateIsInSelectMode
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__PXStoryViewModel__updateIsInSelectMode__block_invoke;
  v2[3] = &unk_1E5DC3010;
  v2[4] = self;
  [(PXStoryViewModel *)self _readFromPhotosGridViewModel:v2];
}

void __41__PXStoryViewModel__updateIsInSelectMode__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photosGridViewModel];
  objc_msgSend(*(id *)(a1 + 32), "setIsInSelectMode:", objc_msgSend(v2, "isInSelectMode"));
}

- (void)_invalidateIsInSelectMode
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsInSelectMode];
}

- (id)_gridEffectForAsset:(id)a3 colorGradingEffect:(id)a4 entityManager:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (PXStoryColorNormalizationEffect *)a4;
  id v9 = a5;
  id v10 = +[PXStorySettings sharedInstance];
  if (![v10 enableBrowseViewColorNormalization]
    || ![v10 colorNormalizationMode])
  {
    goto LABEL_16;
  }
  uint64_t v11 = [v10 colorNormalizationMode];
  if (!v8 && ![v10 enableColorNormalizationWithoutColorGrade])
  {
    uint64_t v13 = 0;
    id v17 = 0;
    goto LABEL_17;
  }
  if (v11 == 2) {
    PXDisplayAssetColorNormalizationData();
  }
  if (v11 != 4
    || (+[PXStoryColorNormalizationAdjustment dummyNormalization], (id v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_16:
    uint64_t v13 = 0;
    id v17 = v8;
    goto LABEL_17;
  }
  uint64_t v13 = [[PXStoryColorNormalizationEffect alloc] initWithEntityManager:v9];
  [(PXStoryColorNormalizationEffect *)v13 setAssetNormalization:v12];
  [v10 colorNormalizationIntensity];
  -[PXGColorGradingEffect setIntensity:](v13, "setIntensity:");

  if (v8 && v13)
  {
    id v14 = objc_alloc((Class)off_1E5DA6718);
    v19[0] = v13;
    v19[1] = v8;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v16 = (PXStoryColorNormalizationEffect *)[v14 initWithEffects:v15];

    goto LABEL_18;
  }
  if (v13) {
    id v17 = v13;
  }
  else {
    id v17 = v8;
  }
LABEL_17:
  id v16 = v17;
LABEL_18:

  return v16;
}

- (void)_updateAXStoredPlayState
{
  int64_t v3 = [(PXStoryViewModel *)self viewMode];
  int64_t v4 = v3;
  if (v3 == 1)
  {
    if (self->_axStoredPlayStateLastViewModeOnUpdate == 4 && self->_axStoredPlayStateHasStoredPlayState)
    {
      self->_axStoredPlayStateHasStoredPlayState = 0;
      id v6 = [(PXStoryViewModel *)self mainModel];
      id v7 = v6;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke_2;
      v9[3] = &unk_1E5DCEE38;
      v9[4] = self;
      id v8 = v9;
      goto LABEL_9;
    }
  }
  else if (v3 == 4 {
         && self->_axStoredPlayStateLastViewModeOnUpdate == 1
  }
         && [(PXStoryViewModel *)self shouldSimplifyUIForAccessibility])
  {
    id v5 = [(PXStoryViewModel *)self mainModel];
    self->_axStoredPlayState = [v5 desiredPlayState];

    self->_axStoredPlayStateHasStoredPlayState = 1;
    id v6 = [(PXStoryViewModel *)self mainModel];
    id v7 = v6;
    id v8 = &__block_literal_global_475_186424;
LABEL_9:
    [v6 performChanges:v8];
  }
  self->_axStoredPlayStateLastViewModeOnUpdate = v4;
}

uint64_t __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:*(void *)(*(void *)(a1 + 32) + 120)];
}

uint64_t __44__PXStoryViewModel__updateAXStoredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:0];
}

- (void)_invalidateAXStoredPlayState
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAXStoredPlayState];
}

- (void)_updatePhotosGridEffectProvider
{
  int64_t v3 = [(PXStoryViewModel *)self mainModel];
  uint64_t v4 = [v3 colorGradeKind];

  id v5 = [(PXStoryViewModel *)self photosGridViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke;
  void v6[3] = &unk_1E5DCD388;
  v6[4] = self;
  v6[5] = v4;
  [v5 performChanges:v6];
}

void __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[PXStorySettings sharedInstance];
  id v5 = v4;
  if (*(void *)(a1 + 40) == 1 || ([v4 disableColorGrading] & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) mainModel];
    id v8 = [v7 colorGradingRepository];
    id v6 = [v8 colorLookupCubeForColorGradeKind:*(void *)(a1 + 40)];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__186428;
  v15[4] = __Block_byref_object_dispose__186429;
  id v16 = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke_471;
  v10[3] = &unk_1E5DC2FE8;
  id v12 = v15;
  id v9 = v6;
  id v11 = v9;
  objc_copyWeak(&v13, &location);
  [v3 setEffectProvider:v10];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);
}

id __51__PXStoryViewModel__updatePhotosGridEffectProvider__block_invoke_471(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && *(void *)(a1 + 32))
  {
    uint64_t v7 = [objc_alloc((Class)off_1E5DA66F8) initWithEntityManager:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setColorLookupCube:*(void *)(a1 + 32)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = [WeakRetained _gridEffectForAsset:v6 colorGradingEffect:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) entityManager:v5];

  return v11;
}

- (void)_invalidatePhotosGridEffectProvider
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePhotosGridEffectProvider];
}

- (void)_updateCanToggleSelectMode
{
  if ([(PXStoryViewModel *)self viewMode] == 2
    && ([(PXStoryViewModel *)self photosGridViewModel],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 canEnterSelectMode],
        v3,
        v4))
  {
    id v5 = [(PXStoryViewModel *)self photosGridViewModel];
    uint64_t v6 = [v5 canExitSelectMode];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(PXStoryViewModel *)self setCanToggleSelectMode:v6];
}

- (void)_invalidateCanToggleSelectMode
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCanToggleSelectMode];
}

- (void)setPhotosGridViewModel:(id)a3
{
  id v5 = (PXPhotosViewModel *)a3;
  photosGridViewModel = self->_photosGridViewModel;
  if (photosGridViewModel != v5)
  {
    uint64_t v7 = v5;
    [(PXPhotosViewModel *)photosGridViewModel unregisterChangeObserver:self context:PhotosGridViewModelObservationContext];
    objc_storeStrong((id *)&self->_photosGridViewModel, a3);
    [(PXPhotosViewModel *)self->_photosGridViewModel registerChangeObserver:self context:PhotosGridViewModelObservationContext];
    [(PXStoryViewModel *)self signalChange:0x80000000000000];
    [(PXStoryViewModel *)self _invalidateCanToggleSelectMode];
    [(PXStoryViewModel *)self _invalidateIsInSelectMode];
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
    [(PXStoryViewModel *)self _invalidatePhotosGridEffectProvider];
    id v5 = v7;
  }
}

- (void)_updateDiagnosticHUDState
{
  id v4 = +[PXStorySettings sharedInstance];
  if ([v4 isHUDEnabled]) {
    uint64_t v3 = [v4 isHUDVisible];
  }
  else {
    uint64_t v3 = 0;
  }
  [(PXStoryViewModel *)self setIsHUDVisible:v3];
  -[PXStoryViewModel setDiagnosticHUDType:](self, "setDiagnosticHUDType:", [v4 defaultHUDType]);
}

- (void)_invalidateDiagnosticHUDState
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDiagnosticHUDState];
}

- (void)_updateErrorIndicator
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXStoryViewModel *)self errorRepository];
  id v4 = [v3 errors];

  id v5 = +[PXStorySettings sharedInstance];
  if (![v4 count])
  {
    uint64_t v6 = [v5 simulatedError];
    switch(v6)
    {
      case 3:
        id v13 = PXStoryPublicErrorCreateSimulatedCriticalError();
        id v31 = v13;
        id v14 = (uint64_t *)&v31;
        break;
      case 2:
        id v13 = PXStoryPublicErrorCreateSimulatedError();
        v32 = v13;
        id v14 = (uint64_t *)&v32;
        break;
      case 1:
        id v13 = PXStoryErrorCreateWithCodeDebugFormat(1, @"Simulated internal error.", v7, v8, v9, v10, v11, v12, (uint64_t)v31);
        v33[0] = v13;
        id v14 = v33;
        break;
      default:
        goto LABEL_9;
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v31, v32, v33[0]);

    id v4 = (void *)v15;
  }
LABEL_9:
  if ([v4 count])
  {
    id v16 = PXStoryPublicErrorForErrors(v4);
    id v17 = +[PXRootSettings sharedInstance];
    int v18 = [v17 canShowInternalUI];

    if (v18)
    {
      if (!v16)
      {
        id v16 = PXStoryInternalErrorForErrors(v4);
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v20 = [v16 localizedFailureReason];
      [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      int v21 = [v16 localizedRecoverySuggestion];
      [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F285A0]];

      [v19 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      uint64_t v22 = [v16 localizedRecoveryOptions];
      v23 = (void *)v22;
      if (v22) {
        uint64_t v24 = (void *)v22;
      }
      else {
        uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v25 = [(PXStoryViewModel *)self _internalRecoveryOptions];
      v26 = [v24 arrayByAddingObjectsFromArray:v25];
      [v19 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F28590]];

      v27 = [[_PXStoryInternalErrorRecoveryAttempter alloc] initWithRecoveryAttempter:self];
      [v19 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F288B8]];

      v28 = (void *)MEMORY[0x1E4F28C58];
      v29 = [v16 domain];
      uint64_t v30 = objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, objc_msgSend(v16, "code"), v19);

      id v16 = (void *)v30;
    }
  }
  else
  {
    id v16 = 0;
  }
  [(PXStoryViewModel *)self setHasAnyError:v16 != 0];
  [(PXStoryViewModel *)self setDisplayedError:v16];
}

- (void)_invalidateErrorIndicator
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateErrorIndicator];
}

- (void)_updateShouldPreventDisplaySleep
{
  BOOL v3 = [(PXStoryViewModel *)self viewMode] == 1 || [(PXStoryViewModel *)self viewMode] == 5;
  if ([(PXStoryViewModel *)self isActive]
    && [(PXStoryViewModel *)self desiredPlayState] == 1)
  {
    uint64_t v4 = v3 & ~[(PXStoryViewModel *)self isAtPlaybackEnd];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PXStoryViewModel *)self setShouldPreventDisplaySleep:v4];
}

- (void)_invalidateShouldPreventDisplaySleep
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldPreventDisplaySleep];
}

- (void)_updateShouldAutoHideMuteToggleButton
{
  if ([(PXStoryViewModel *)self canShowMuteToggleButtonWhenChromeIsHidden]
    && ![(PXStoryViewModel *)self isAtPlaybackStart])
  {
    uint64_t v3 = [(PXStoryViewModel *)self wantsChromeVisible] ^ 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  [(PXStoryViewModel *)self setShouldAutoHideMuteToggleButton:v3];
}

- (void)_invalidateShouldAutoHideMuteToggleButton
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldAutoHideMuteToggleButton];
}

- (void)_resetShouldAutoHideMuteToggleButton
{
  [(PXStoryViewModel *)self setShouldAutoHideMuteToggleButton:0];
  [(PXStoryViewModel *)self _invalidateShouldAutoHideMuteToggleButton];
}

- (void)_updateShouldAutoHideChrome
{
  uint64_t v3 = +[PXStorySettings sharedInstance];
  int v4 = [v3 chromeAllowAutoHide];

  if (v4 && [(PXStoryViewModel *)self wantsChromeVisible])
  {
    id v6 = [(PXStoryViewModel *)self mainModel];
    if (![v6 isActuallyPlaying]
      || [(PXStoryViewModel *)self wantsRelatedOverlayVisible]
      || [(PXStoryViewModel *)self shouldSimplifyUIForAccessibility]
      || [(PXStoryViewModel *)self isAnyMenuOpen]
      || [(PXStoryViewModel *)self isUserPerformingRemoteGesture])
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [(PXStoryViewModel *)self isScrubbing] ^ 1;
    }
    [(PXStoryViewModel *)self setShouldAutoHideChrome:v5];
  }
  else
  {
    [(PXStoryViewModel *)self setShouldAutoHideChrome:0];
  }
}

- (void)_invalidateShouldAutoHideChrome
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldAutoHideChrome];
}

- (void)_updateIsAnyMenuOpen
{
  BOOL v3 = [(NSMutableSet *)self->_openMenuIdentifiers count] != 0;
  [(PXStoryViewModel *)self setIsAnyMenuOpen:v3];
}

- (void)_invalidateIsAnyMenuOpen
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsAnyMenuOpen];
}

- (void)_updateWantsRelatedOverlayScrollable
{
  if ([(PXStoryViewModel *)self wantsRelatedOverlayVisible])
  {
    id v4 = [(PXStoryViewModel *)self relatedModels];
    if ([v4 count]) {
      BOOL v3 = [(PXStoryViewModel *)self allowsRelated];
    }
    else {
      BOOL v3 = 0;
    }
    [(PXStoryViewModel *)self setWantsRelatedOverlayScrollable:v3];
  }
  else
  {
    [(PXStoryViewModel *)self setWantsRelatedOverlayScrollable:0];
  }
}

- (void)_invalidateWantsRelatedOverlayScrollable
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsRelatedOverlayScrollable];
}

- (void)_updateLegibilityOverlayOpacity
{
  BOOL v3 = +[PXStorySettings sharedInstance];
  if ([v3 scrubberDimsMainContent]) {
    [(PXStoryViewModel *)self scrubberVisibilityFraction];
  }
  [(PXStoryViewModel *)self chromeVisibilityFraction];
  [v3 legibilityGradientOpacity];
  [(PXStoryViewModel *)self styleSwitcherVisibilityFraction];
  [(PXStoryViewModel *)self maximumIndividualTopChromeItemVisibilityFraction];
  PXFloatByLinearlyInterpolatingFloats();
}

uint64_t __51__PXStoryViewModel__updateLegibilityOverlayOpacity__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitleBackgroundOpacity:*(double *)(a1 + 32)];
}

- (void)_invalidateLegibilityOverlayOpacity
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLegibilityOverlayOpacity];
}

- (void)_updateControllersActiveness
{
  BOOL v3 = [(PXStoryViewModel *)self isActive];
  BOOL v4 = [(PXStoryViewModel *)self viewMode] == 2;
  uint64_t v5 = +[PXStorySettings sharedInstance];
  id v6 = [(PXStoryViewModel *)self relatedController];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke;
  v31[3] = &unk_1E5DC2EF0;
  BOOL v34 = v3;
  id v7 = v5;
  id v32 = v7;
  v33 = self;
  [v6 performChanges:v31];

  uint64_t v8 = [(PXStoryViewModel *)self musicPlayer];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_2;
  v29[3] = &__block_descriptor_33_e37_v16__0___PXMutableStoryMusicPlayer__8l;
  BOOL v30 = v3;
  [v8 performChanges:v29];

  uint64_t v9 = [(PXStoryViewModel *)self pacingController];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_3;
  v26[3] = &__block_descriptor_34_e42_v16__0___PXStoryMutablePacingController__8l;
  BOOL v27 = v3;
  BOOL v28 = v4;
  [v9 performChanges:v26];

  uint64_t v10 = [(PXStoryViewModel *)self resourcesPreloadingController];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_4;
  v23[3] = &unk_1E5DC2F58;
  BOOL v25 = v3;
  id v11 = v7;
  id v24 = v11;
  [v10 performChanges:v23];

  uint64_t v12 = [(PXStoryViewModel *)self persistenceController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_5;
  v20[3] = &unk_1E5DC2F80;
  BOOL v22 = v3;
  id v21 = v11;
  id v13 = v11;
  [v12 performChanges:v20];

  id v14 = [(PXStoryViewModel *)self bufferingController];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_6;
  v18[3] = &__block_descriptor_33_e49_v16__0___PXStoryMutableViewBufferingController__8l;
  BOOL v19 = v3;
  [v14 performChanges:v18];

  uint64_t v15 = [(PXStoryViewModel *)self validationController];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__PXStoryViewModel__updateControllersActiveness__block_invoke_7;
  v16[3] = &__block_descriptor_33_e46_v16__0___PXStoryMutableValidationController__8l;
  BOOL v17 = v3;
  [v15 performChanges:v16];
}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) wantsRelated]) {
      uint64_t v4 = [*(id *)(a1 + 40) allowsRelated];
    }
    else {
      uint64_t v4 = 0;
    }
    id v3 = v7;
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setIsActive:v4];
  if ([v7 isActive])
  {
    uint64_t v5 = [*(id *)(a1 + 40) recentlyUsedFlexSongIDs];
    [v7 setRecentlyUsedFlexSongIDs:v5];

    id v6 = [*(id *)(a1 + 40) recentlyUsedAppleMusicSongIDs];
    [v7 setRecentlyUsedAppleMusicSongIDs:v6];
  }
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_3(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v2 = *(unsigned char *)(a1 + 33) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  return [a2 setIsActive:v2];
}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = [*(id *)(a1 + 32) wantsResourcesPreloading];
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setIsActive:v3];
}

void __48__PXStoryViewModel__updateControllersActiveness__block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = [*(id *)(a1 + 32) wantsPersistence];
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setIsActive:v3];
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __48__PXStoryViewModel__updateControllersActiveness__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateControllersActiveness
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateControllersActiveness];
}

- (void)_updateMainModelControllers
{
  uint64_t v3 = [(PXStoryViewModel *)self mainModel];
  id v12 = (id)v3;
  if (self->_isAllowedToPlayAnyMusicOrSound)
  {
    id v4 = [[PXStoryMusicPlayer alloc] initWithModel:v3 targetDurationMatchesTimeline:[(PXStoryViewModel *)self assetCollectionForcesAutoReplay] ^ 1];
    [(PXStoryViewModel *)self setMusicPlayer:v4];
  }
  else
  {
    [(PXStoryViewModel *)self setMusicPlayer:0];
  }
  if (!self->_isAllowedToPlayAnyMusicOrSound) {
    [v12 performChanges:&__block_literal_global_454];
  }
  uint64_t v5 = [PXStoryPacingController alloc];
  id v6 = [(PXStoryViewModel *)self timeSource];
  id v7 = [(PXStoryViewModel *)self musicPlayer];
  uint64_t v8 = [(PXStoryPacingController *)v5 initWithModel:v12 timeSource:v6 cueSource:v7];
  [(PXStoryViewModel *)self setPacingController:v8];

  uint64_t v9 = [[PXStorySongController alloc] initWithModel:v12];
  [(PXStoryViewModel *)self setSongController:v9];

  uint64_t v10 = [[PXStoryPersistenceController alloc] initWithModel:v12];
  [(PXStoryViewModel *)self setPersistenceController:v10];

  id v11 = [[PXStoryAudioSessionController alloc] initWithModel:v12];
  [(PXStoryViewModel *)self setAudioSessionController:v11];
}

uint64_t __47__PXStoryViewModel__updateMainModelControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMusicReadinessStatus:3];
}

- (void)_invalidateMainModelControllers
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModelControllers];
}

- (void)_updateViewModelControllers
{
  uint64_t v3 = [[PXStoryOverlayController alloc] initWithViewModel:self];
  [(PXStoryViewModel *)self setOverlayController:v3];

  id v4 = [[PXStoryRelatedController alloc] initWithViewModel:self];
  [(PXStoryViewModel *)self setRelatedController:v4];

  uint64_t v5 = [[PXStoryViewResourcesPreloadingController alloc] initWithViewModel:self];
  [(PXStoryViewModel *)self setResourcesPreloadingController:v5];

  id v6 = [[PXStoryViewBufferingController alloc] initWithViewModel:self];
  [(PXStoryViewModel *)self setBufferingController:v6];

  id v7 = [PXStoryMuteStateController alloc];
  uint64_t v8 = [(PXStoryViewModel *)self volumeController];
  uint64_t v9 = [(PXStoryViewModel *)self userDefaults];
  uint64_t v10 = [(PXStoryMuteStateController *)v7 initWithViewModel:self volumeController:v8 userDefaults:v9];
  [(PXStoryViewModel *)self setMuteStateController:v10];

  id v11 = +[PXStorySettings sharedInstance];
  LODWORD(v8) = [v11 wantsValidation];

  if (v8)
  {
    id v12 = [[PXStoryValidationController alloc] initWithViewModel:self];
    [(PXStoryViewModel *)self setValidationController:v12];
  }
}

- (void)_invalidateViewModelControllers
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewModelControllers];
}

- (void)_updateViewLayoutSpec
{
  id v4 = [(PXStoryViewModel *)self viewLayoutSpecManager];
  uint64_t v3 = [v4 viewLayoutSpec];
  [(PXStoryViewModel *)self setViewLayoutSpec:v3];
}

- (void)_invalidateViewLayoutSpec
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewLayoutSpec];
}

- (void)_updateMainAssetCollection
{
  id v4 = [(PXStoryViewModel *)self mainModel];
  uint64_t v3 = [v4 currentAssetCollection];
  [(PXStoryViewModel *)self setMainAssetCollection:v3];
}

- (void)_invalidateMainAssetCollection
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainAssetCollection];
}

- (void)_updateOutroFractionCompleted
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  [v3 outroFractionCompleted];
  -[PXStoryViewModel setOutroFractionCompleted:](self, "setOutroFractionCompleted:");
}

- (void)_invalidateOutroFractionCompleted
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOutroFractionCompleted];
}

- (void)_updatePlaybackDuration
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  id v4 = v3;
  if (v3)
  {
    [v3 playbackDuration];
  }
  else
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
  }
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PXStoryViewModel *)self setPlaybackDuration:&v5];
}

- (void)_invalidatePlaybackDuration
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaybackDuration];
}

- (void)_updatePlaybackFractionCompleted
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  [v3 playbackFractionCompleted];
  -[PXStoryViewModel setPlaybackFractionCompleted:](self, "setPlaybackFractionCompleted:");
  if (v3)
  {
    [v3 nominalPlaybackTime];
  }
  else
  {
    long long v6 = 0uLL;
    uint64_t v7 = 0;
  }
  long long v4 = v6;
  uint64_t v5 = v7;
  [(PXStoryViewModel *)self setCurrentPlaybackTime:&v4];
}

- (void)_invalidatePlaybackFractionCompleted
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaybackFractionCompleted];
}

- (void)_updateDesiredPlayState
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  -[PXStoryViewModel setDesiredPlayState:](self, "setDesiredPlayState:", [v3 desiredPlayState]);
}

- (void)_invalidateDesiredPlayState
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredPlayState];
}

- (void)_updateViewModeTransition
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  long long v4 = [v3 viewModeTransition];
  [(PXStoryViewModel *)self setViewModeTransition:v4];

  uint64_t v5 = [(PXStoryViewModel *)self viewModeTransition];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PXStoryViewModel__updateViewModeTransition__block_invoke;
  void v6[3] = &unk_1E5DC2EC8;
  v6[4] = self;
  [v5 performChanges:v6];
}

void __45__PXStoryViewModel__updateViewModeTransition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 swipeDownInteractionState];
  }
  else
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  v5[2] = v9;
  v5[3] = v10;
  uint64_t v6 = v11;
  v5[0] = v7;
  v5[1] = v8;
  [v3 setSwipeDownInteractionState:v5];
}

- (void)_invalidateViewModeTransition
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewModeTransition];
}

- (void)_updateViewMode
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  -[PXStoryViewModel setViewMode:](self, "setViewMode:", [v3 viewMode]);
}

- (void)_invalidateViewMode
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewMode];
}

- (void)_updateMainModelProperties
{
  id v3 = [(PXStoryViewModel *)self mainModel];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = v3;
  id v4 = v3;
  uint64_t v5 = [(PXStoryViewModel *)self modelChangeOrigin];
  [v4 performChanges:&v6 origin:v5];
}

void __46__PXStoryViewModel__updateMainModelProperties__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_msgSend(v9, "setDesiredPlayState:", objc_msgSend(*(id *)(a1 + 32), "desiredPlayState"));
  objc_msgSend(v9, "setViewMode:", objc_msgSend(*(id *)(a1 + 32), "viewMode"));
  [*(id *)(a1 + 32) styleSwitcherVisibilityFraction];
  objc_msgSend(v9, "setStyleSwitcherVisibilityFraction:");
  objc_msgSend(v9, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 32), "isHUDVisible"));
  objc_msgSend(v9, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 32), "diagnosticHUDType"));
  objc_msgSend(v9, "setAllowsScrolling:", objc_msgSend(*(id *)(a1 + 32), "wantsRelatedOverlayScrollable") ^ 1);
  objc_msgSend(v9, "setIsPerformingViewControllerTransition:", objc_msgSend(*(id *)(a1 + 32), "isPerformingViewControllerTransition"));
  char v3 = [*(id *)(a1 + 32) isMuted];
  double v4 = 0.0;
  if ((v3 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "volume", 0.0);
  }
  [v9 setVolume:v4];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) modelCoveredByRelated];
  double v7 = 1.0;
  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "relatedOverlayVisibilityFraction", 1.0);
    double v7 = 1.0 - v8;
  }
  [v9 setTitleOpacity:v7];

  [*(id *)(a1 + 32) chromeVisibilityFraction];
  objc_msgSend(v9, "setChromeVisibilityFraction:");
}

- (void)_invalidateMainModelProperties
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModelProperties];
}

- (void)_updateSpecManager
{
  id v5 = [(PXStoryViewModel *)self viewLayoutSpecManager];
  char v3 = [(PXStoryViewModel *)self mainConfiguration];
  objc_msgSend(v5, "setStoryConfigurationOptions:", objc_msgSend(v3, "options"));

  double v4 = [(PXStoryViewModel *)self customGeneralChromeTitleConfiguration];
  [v5 setCustomGeneralChromeTitleConfiguration:v4];
}

- (void)_invalidateSpecManager
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSpecManager];
}

- (void)_setNeedsUpdate
{
}

- (void)setIsUserPerformingRemoteGesture:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isUserPerformingRemoteGesture != a3)
  {
    BOOL v3 = a3;
    self->_isUserPerformingRemoteGesture = a3;
    [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
    [(PXStoryViewModel *)self signalChange:0x200000000000000];
    id v5 = [(PXStoryViewModel *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryViewModel *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    double v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryViewModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    id v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryViewModel *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryViewModelChangedIsUserPerformingRemoteGesture", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (BOOL)checkIfShouldPreventAdvancingAndReturnReason:(id *)a3
{
  if ([(PXStoryViewModel *)self isAnyMenuOpen])
  {
    if (a3)
    {
      id v5 = "isAnyMenuOpen";
LABEL_7:
      *a3 = (id)[[NSString alloc] initWithUTF8String:v5];
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL v6 = [(PXStoryViewModel *)self isScrubbing];
  if (v6)
  {
    if (a3)
    {
      id v5 = "isScrubbing";
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)setHighlightedRelatedIndex:(int64_t)a3
{
  if (self->_highlightedRelatedIndex != a3)
  {
    self->_highlightedRelatedIndex = a3;
    [(PXStoryViewModel *)self signalChange:0x100000000000000];
  }
}

- (void)_autoHideMuteToggleButton
{
  [(PXStoryViewModel *)self _cancelMuteToggleButtonAutoHideTimer];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PXStoryViewModel__autoHideMuteToggleButton__block_invoke;
  v3[3] = &unk_1E5DD1EF0;
  v3[4] = self;
  [(PXStoryViewModel *)self performChanges:v3];
}

uint64_t __45__PXStoryViewModel__autoHideMuteToggleButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCanShowMuteToggleButtonWhenChromeIsHidden:0];
}

- (void)_cancelMuteToggleButtonAutoHideTimer
{
  BOOL v3 = [(PXStoryViewModel *)self autoHideMuteToggleButtonTimer];
  [v3 invalidate];

  [(PXStoryViewModel *)self setAutoHideMuteToggleButtonTimer:0];
}

- (void)_scheduleMuteToggleButtonAutoHide
{
  [(PXStoryViewModel *)self _cancelMuteToggleButtonAutoHideTimer];
  BOOL v3 = +[PXStorySettings sharedInstance];
  [v3 muteToggleButtonAutoHideDelay];
  double v5 = v4;

  objc_initWeak(&location, self);
  BOOL v6 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __53__PXStoryViewModel__scheduleMuteToggleButtonAutoHide__block_invoke;
  os_signpost_id_t v13 = &unk_1E5DCD920;
  objc_copyWeak(&v14, &location);
  os_signpost_id_t v7 = [v6 timerWithTimeInterval:0 repeats:&v10 block:v5];
  -[PXStoryViewModel setAutoHideMuteToggleButtonTimer:](self, "setAutoHideMuteToggleButtonTimer:", v7, v10, v11, v12, v13);

  double v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  os_signpost_id_t v9 = [(PXStoryViewModel *)self autoHideMuteToggleButtonTimer];
  [v8 addTimer:v9 forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__PXStoryViewModel__scheduleMuteToggleButtonAutoHide__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _autoHideMuteToggleButton];
}

- (void)setShouldAutoHideMuteToggleButton:(BOOL)a3
{
  if (self->_shouldAutoHideMuteToggleButton != a3)
  {
    self->_shouldAutoHideMuteToggleButton = a3;
    if (a3) {
      [(PXStoryViewModel *)self _scheduleMuteToggleButtonAutoHide];
    }
    else {
      [(PXStoryViewModel *)self _cancelMuteToggleButtonAutoHideTimer];
    }
  }
}

- (void)hideMuteToggleButtonWhenChromeIsHidden
{
  [(PXStoryViewModel *)self setCanShowMuteToggleButtonWhenChromeIsHidden:0];
  [(PXStoryViewModel *)self _cancelMuteToggleButtonAutoHideTimer];
}

- (void)temporarilyShowMuteToggleButtonWhenChromeIsHidden
{
  [(PXStoryViewModel *)self setCanShowMuteToggleButtonWhenChromeIsHidden:1];
  [(PXStoryViewModel *)self _resetShouldAutoHideMuteToggleButton];
}

- (void)setCanShowMuteToggleButtonWhenChromeIsHidden:(BOOL)a3
{
  if (self->_canShowMuteToggleButtonWhenChromeIsHidden != a3)
  {
    self->_canShowMuteToggleButtonWhenChromeIsHidden = a3;
    [(PXStoryViewModel *)self signalChange:0x800000000000000];
    [(PXStoryViewModel *)self _invalidateShouldAutoHideMuteToggleButton];
  }
}

- (void)setVolume:(double)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    double v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    BOOL v6 = [NSNumber numberWithDouble:a3];
    [v5 setObject:v6 forKey:@"PXStoryVolume"];

    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setMuted:(BOOL)a3 reason:(int64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    self->_lastMutedChangeReason = a4;
    [(PXStoryViewModel *)self signalChange:0x400000000000000];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
    if (![(PXStoryViewModel *)self wantsChromeVisible])
    {
      if ([(PXStoryViewModel *)self canShowMuteToggleButtonWhenChromeIsHidden]|| ([(PXStoryViewModel *)self muteToggleButtonVisibilityFraction], v6 > 0.0))
      {
        [(PXStoryViewModel *)self temporarilyShowMuteToggleButtonWhenChromeIsHidden];
      }
    }
    if ((unint64_t)(a4 - 1) <= 3)
    {
      os_signpost_id_t v7 = off_1E5DC30D8[a4 - 1];
      if (self->_isMuted) {
        double v8 = @"Muted";
      }
      else {
        double v8 = @"Unmuted";
      }
      os_signpost_id_t v9 = (void *)MEMORY[0x1E4F56658];
      uint64_t v10 = [NSString stringWithFormat:@"com.apple.photos.memory.interactiveMemoryPlayback%@DueTo%@", v8, v7];
      uint64_t v14 = *MEMORY[0x1E4F56560];
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      v15[0] = v12;
      os_signpost_id_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v9 sendEvent:v10 withPayload:v13];
    }
  }
}

- (void)setDiagnosticHUDContentProvider:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = [(PXStoryViewModel *)self diagnosticHUDContentProvidersByType];
  double v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];

  [(PXStoryViewModel *)self signalChange:4096];
}

- (id)diagnosticHUDContentProviderForType:(int64_t)a3
{
  double v5 = [(PXStoryViewModel *)self diagnosticHUDContentProvidersByType];
  id v6 = [NSNumber numberWithInteger:a3];
  os_signpost_id_t v7 = [v5 objectForKey:v6];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(PXStoryViewModel *)self mainModel];
    id v9 = [v10 diagnosticHUDContentProviderForType:a3];
  }
  return v9;
}

- (void)_updateHUDSettings
{
  BOOL v3 = [(PXStoryViewModel *)self isHUDVisible];
  int64_t v4 = [(PXStoryViewModel *)self diagnosticHUDType];
  id v5 = +[PXStorySettings sharedInstance];
  if (v3 != [v5 isHUDVisible] || objc_msgSend(v5, "defaultHUDType") != v4)
  {
    [v5 setIsHUDVisible:v3];
    [v5 setDefaultHUDType:v4];
    [v5 save];
  }
}

- (void)_invalidateHUDSettings
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHUDSettings];
}

- (void)setDiagnosticHUDType:(int64_t)a3
{
  if (self->_diagnosticHUDType != a3)
  {
    self->_diagnosticHUDType = a3;
    [(PXStoryViewModel *)self signalChange:2048];
    [(PXStoryViewModel *)self _invalidateHUDSettings];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setIsHUDVisible:(BOOL)a3
{
  if (self->_isHUDVisible != a3)
  {
    self->_isHUDVisible = a3;
    [(PXStoryViewModel *)self signalChange:1024];
    [(PXStoryViewModel *)self _invalidateHUDSettings];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setDisplayedError:(id)a3
{
  double v8 = (NSError *)a3;
  int64_t v4 = self->_displayedError;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSError *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSError *)[(NSError *)v8 copy];
      displayedError = self->_displayedError;
      self->_displayedError = v6;

      [(PXStoryViewModel *)self signalChange:0x100000];
    }
  }
}

- (void)setShouldShowErrorIndicator:(BOOL)a3
{
  if (self->_shouldShowErrorIndicator != a3)
  {
    self->_shouldShowErrorIndicator = a3;
    [(PXStoryViewModel *)self signalChange:0x80000];
  }
}

- (void)setHasAnyError:(BOOL)a3
{
  if (self->_hasAnyError != a3)
  {
    self->_hasAnyError = a3;
    if (a3)
    {
      id v4 = +[PXRootSettings sharedInstance];
      -[PXStoryViewModel setShouldShowErrorIndicator:](self, "setShouldShowErrorIndicator:", [v4 canShowInternalUI]);
    }
    else
    {
      [(PXStoryViewModel *)self setShouldShowErrorIndicator:0];
    }
  }
}

- (void)setShowSongInTitleWhenPaused:(BOOL)a3
{
  if (self->_showSongInTitleWhenPaused != a3)
  {
    self->_showSongInTitleWhenPaused = a3;
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
  }
}

- (void)setChromeTitleInfo:(id)a3
{
  os_signpost_id_t v7 = (PXStoryViewChromeTitleInfo *)a3;
  char v5 = self->_chromeTitleInfo;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryViewChromeTitleInfo *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_chromeTitleInfo, a3);
      [(PXStoryViewModel *)self signalChange:0x8000000000000];
    }
  }
}

- (void)setDisplaySubtitle:(id)a3
{
  os_signpost_id_t v7 = (NSAttributedString *)a3;
  char v5 = self->_displaySubtitle;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSAttributedString *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displaySubtitle, a3);
      [(PXStoryViewModel *)self signalChange:0x10000000000000];
    }
  }
}

- (void)setDisplayTitle:(id)a3
{
  os_signpost_id_t v7 = (NSAttributedString *)a3;
  char v5 = self->_displayTitle;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSAttributedString *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayTitle, a3);
      [(PXStoryViewModel *)self signalChange:0x8000000000000];
    }
  }
}

- (void)setViewControllerDismissalTargetPlacement:(id)a3
{
  os_signpost_id_t v7 = (PXGItemPlacement *)a3;
  char v5 = self->_viewControllerDismissalTargetPlacement;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXGItemPlacement *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewControllerDismissalTargetPlacement, a3);
      [(PXStoryViewModel *)self signalChange:0x2000000000];
    }
  }
}

- (void)setIsPerformingViewControllerTransition:(BOOL)a3
{
  if (self->_isPerformingViewControllerTransition != a3)
  {
    self->_isPerformingViewControllerTransition = a3;
    [(PXStoryViewModel *)self signalChange:0x1000000000];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setShouldPreventDisplaySleep:(BOOL)a3
{
  if (self->_shouldPreventDisplaySleep != a3)
  {
    self->_BOOL shouldPreventDisplaySleep = a3;
    [(PXStoryViewModel *)self signalChange:0x20000000];
    id v4 = +[PXApplicationState sharedState];
    BOOL shouldPreventDisplaySleep = self->_shouldPreventDisplaySleep;
    char v6 = [(PXStoryViewModel *)self preventedDisplaySleepToken];
    os_signpost_id_t v7 = v6;
    if (shouldPreventDisplaySleep)
    {

      if (v7) {
        PXAssertGetLog();
      }
      uint64_t v8 = [v4 beginDisablingIdleTimerForReason:@"Interactive memory playback (PXStoryViewModel)"];
      os_signpost_id_t v7 = (void *)v8;
    }
    else
    {
      if (!v6) {
        PXAssertGetLog();
      }
      [v4 endDisablingIdleTimer:v6];
      uint64_t v8 = 0;
    }
    [(PXStoryViewModel *)self setPreventedDisplaySleepToken:v8];
  }
}

- (void)deselectAllGridItems
{
  id v2 = [(PXStoryViewModel *)self photosGridViewModel];
  [v2 performChanges:&__block_literal_global_411];
}

uint64_t __40__PXStoryViewModel_deselectAllGridItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)selectAllGridItems
{
  id v2 = [(PXStoryViewModel *)self photosGridViewModel];
  [v2 performChanges:&__block_literal_global_409];
}

uint64_t __38__PXStoryViewModel_selectAllGridItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAll];
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    [(PXStoryViewModel *)self signalChange:0x200000000];
    if (![(PXStoryViewModel *)self isReadingFromPhotosGridViewModel])
    {
      char v5 = [(PXStoryViewModel *)self photosGridViewModel];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __38__PXStoryViewModel_setIsInSelectMode___block_invoke;
      void v6[3] = &unk_1E5DC2EA0;
      BOOL v7 = a3;
      v6[4] = self;
      [v5 performChanges:v6];
    }
  }
}

uint64_t __38__PXStoryViewModel_setIsInSelectMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 attemptSetInSelectMode:*(unsigned __int8 *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__PXStoryViewModel_setIsInSelectMode___block_invoke_2;
    v5[3] = &unk_1E5DD1EF0;
    _OWORD v5[4] = v4;
    return [v4 performChanges:v5];
  }
  return result;
}

uint64_t __38__PXStoryViewModel_setIsInSelectMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateIsInSelectMode];
}

- (void)setCanToggleSelectMode:(BOOL)a3
{
  if (self->_canToggleSelectMode != a3)
  {
    self->_canToggleSelectMode = a3;
    [(PXStoryViewModel *)self signalChange:0x100000000];
  }
}

- (void)setScrubberPosition:(id *)a3
{
  if (a3->var0 != self->_scrubberPosition.firstSegmentIdentifier
    || (a3->var1 == self->_scrubberPosition.secondSegmentMixFactor
      ? (BOOL v3 = a3->var2 == self->_scrubberPosition.secondSegmentIdentifier)
      : (BOOL v3 = 0),
        !v3))
  {
    long long v4 = *(_OWORD *)&a3->var0;
    self->_scrubberPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_scrubberPosition.firstSegmentIdentifier = v4;
    [(PXStoryViewModel *)self signalChange:0x40000];
  }
}

- (void)_updateScrubberFeedbackGeneratorWithShouldImpact:(BOOL)a3 shouldPrepare:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    char v6 = [(PXStoryViewModel *)self scrubberFeedbackGenerator];
    [v6 impactOccurred];
  }
  if (v4)
  {
    id v7 = [(PXStoryViewModel *)self scrubberFeedbackGenerator];
    [v7 prepare];
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  if (self->_isScrubbing != a3)
  {
    BOOL v3 = a3;
    self->_isScrubbing = a3;
    char v5 = [(PXStoryViewModel *)self mainModel];
    char v6 = [v5 timeline];
    uint64_t v7 = [v6 firstSegmentIdentifier];
    [(PXStoryViewModel *)self scrubberPosition];
    uint64_t v8 = &v14;
    if (v13 <= 0.5) {
      uint64_t v8 = (uint64_t *)&v12;
    }
    uint64_t v9 = *v8;

    int64_t v10 = [(PXStoryViewModel *)self desiredPlayState];
    if (v3 || v7 != v9)
    {
      [(PXStoryViewModel *)self _updateScrubberFeedbackGeneratorWithShouldImpact:0 shouldPrepare:v3];
    }
    else
    {
      int64_t v11 = v10;
      [(PXStoryViewModel *)self _updateScrubberFeedbackGeneratorWithShouldImpact:v10 == 1 shouldPrepare:0];
      if (v11 == 1) {
        [(PXStoryViewModel *)self _replayMusic];
      }
    }
    [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
    [(PXStoryViewModel *)self signalChange:0x800000];
  }
}

- (void)_replayMusic
{
  id v2 = [(PXStoryViewModel *)self musicPlayer];
  [v2 performChanges:&__block_literal_global_406];
}

uint64_t __32__PXStoryViewModel__replayMusic__block_invoke(uint64_t a1, void *a2)
{
  return [a2 replay];
}

- (void)rewindToBeginning:(BOOL)a3 rewindMusic:(BOOL)a4
{
  uint64_t v7 = [(PXStoryViewModel *)self storyQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke;
  v8[3] = &unk_1E5DC2E78;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = a4;
  dispatch_async(v7, v8);
}

uint64_t __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke_2;
  v3[3] = &unk_1E5DC2E50;
  v3[4] = v1;
  __int16 v4 = *(_WORD *)(a1 + 40);
  return [v1 performChanges:v3];
}

void __50__PXStoryViewModel_rewindToBeginning_rewindMusic___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 mainModel];
  __int16 v4 = [v3 timeline];
  objc_msgSend(v2, "skipToBeginningOfSegmentWithIdentifier:", objc_msgSend(v4, "firstSegmentIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "setWantsChromeVisible:", objc_msgSend(*(id *)(a1 + 32), "shouldSimplifyUIForAccessibility"));
  [*(id *)(a1 + 32) setWantsRelatedOverlayVisible:0];
  [*(id *)(a1 + 32) setDesiredPlayState:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 41))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      char v5 = [*(id *)(a1 + 32) mainConfiguration];
      char v6 = [v5 isAppleMusicPreview];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = *(void **)(a1 + 32);
        [v7 _replayMusic];
      }
    }
  }
}

- (void)rewindToBeginning:(BOOL)a3
{
}

- (void)_resetSelectedRelatedIndex
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__PXStoryViewModel__resetSelectedRelatedIndex__block_invoke;
  v2[3] = &unk_1E5DD1EF0;
  v2[4] = self;
  [(PXStoryViewModel *)self performChanges:v2];
}

uint64_t __46__PXStoryViewModel__resetSelectedRelatedIndex__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedRelatedIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)_changeMainModelToRelatedAtIndex:(int64_t)a3 changeOrigin:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PXStoryViewModel *)self relatedModels];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

  BOOL v9 = [v8 timeline];
  BOOL v10 = v9;
  if (v9)
  {
    [v9 timeRange];
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    long long v19 = 0u;
  }
  CMTime time = *(CMTime *)((char *)v20 + 8);
  BOOL v11 = CMTimeGetSeconds(&time) > 0.0;

  if (v11)
  {
    [(PXStoryViewModel *)self setSelectedRelatedIndex:a3];
    objc_initWeak((id *)&time, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v18, (id *)&time);
    dispatch_async(MEMORY[0x1E4F14428], block);
    [(PXStoryViewModel *)self setDidSelectAnyRelated:1];
    [(PXStoryViewModel *)self _setMainModel:v8 changeOrigin:a4];
    char v12 = [(PXStoryViewModel *)self relatedConfigurations];
    double v13 = [v12 objectAtIndexedSubscript:a3];
    [(PXStoryViewModel *)self setMainConfiguration:v13];

    [(PXStoryViewModel *)self setRelatedConfigurations:0];
    [(PXStoryViewModel *)self setWantsChromeVisible:[(PXStoryViewModel *)self shouldSimplifyUIForAccessibility]];
    [(PXStoryViewModel *)self setWantsRelatedOverlayVisible:0];
    [v8 performChanges:&__block_literal_global_404_186541];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)&time);
  }
  else
  {
    uint64_t v14 = PLStoryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = [v8 currentAssetCollection];
      int v16 = objc_msgSend(v15, "px_cheapLogIdentifier");
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v16;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_FAULT, "Can't select related for asset collection %{public}@ because it's not ready", (uint8_t *)&time, 0xCu);
    }
  }
}

void __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetSelectedRelatedIndex];
}

void __66__PXStoryViewModel__changeMainModelToRelatedAtIndex_changeOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDesiredPlayState:1];
  [v2 setTitleOpacity:1.0];
}

- (void)setSelectedRelatedIndex:(int64_t)a3
{
  if (self->_selectedRelatedIndex != a3)
  {
    self->_selectedRelatedIndex = a3;
    [(PXStoryViewModel *)self signalChange:0x20000000000];
  }
}

- (void)autoPlayUpNext
{
  BOOL v3 = [(PXStoryViewModel *)self relatedConfigurations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(PXStoryViewModel *)self _changeMainModelToRelatedAtIndex:0 changeOrigin:2];
  }
}

- (void)selectRelatedAtIndex:(int64_t)a3
{
}

- (void)setMainConfiguration:(id)a3
{
  uint64_t v7 = (PXStoryConfiguration *)a3;
  char v5 = self->_mainConfiguration;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryConfiguration *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_mainConfiguration, a3);
      [(PXStoryViewModel *)self _invalidateSpecManager];
      [(PXStoryViewModel *)self signalChange:128];
    }
  }
}

- (void)setRelatedConfigurations:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  char v5 = self->_relatedConfigurations;
  if (v5 == v4)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(NSArray *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (NSArray *)[(NSArray *)v4 copy];
      relatedConfigurations = self->_relatedConfigurations;
      self->_relatedConfigurations = v8;

      [(PXStoryViewModel *)self signalChange:512];
      BOOL v10 = [(PXStoryViewModel *)self recentlyUsedFlexSongIDs];
      BOOL v11 = [v10 allObjects];

      char v12 = [(PXStoryViewModel *)self recentlyUsedAppleMusicSongIDs];
      double v13 = [v12 allObjects];

      uint64_t v14 = [(PXStoryViewModel *)self extendedTraitCollection];
      id v15 = v11;
      id v16 = v13;
      id v17 = v14;
      PXMap();
    }
  }
}

PXStoryModel *__45__PXStoryViewModel_setRelatedConfigurations___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 musicCurationProvider];
  if (!v4) {
    PXAssertGetLog();
  }
  [v4 setRecentlyUsedFlexSongIDs:a1[5]];
  [v4 setRecentlyUsedAppleMusicSongIDs:a1[6]];
  char v5 = +[PXStorySettings sharedInstance];
  char v6 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:", v3, a1[7], 0, [v5 fullsizePaperTrailOptions]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PXStoryViewModel_setRelatedConfigurations___block_invoke_401;
  v10[3] = &unk_1E5DC3540;
  id v11 = v3;
  id v12 = v5;
  id v7 = v5;
  id v8 = v3;
  [(PXStoryModel *)v6 performChanges:v10];

  return v6;
}

void __45__PXStoryViewModel_setRelatedConfigurations___block_invoke_401(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setViewMode:3];
  if ([*(id *)(a1 + 32) options] == 4) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  [v6 setThumbnailStyle:v3];
  objc_msgSend(v6, "setIsHUDVisible:", objc_msgSend(*(id *)(a1 + 40), "areRelatedHUDsVisible"));
  objc_msgSend(v6, "setDiagnosticHUDType:", objc_msgSend(*(id *)(a1 + 40), "defaultHUDType"));
  uint64_t v4 = +[PXStorySettings sharedInstance];
  char v5 = [v4 renderTitlesForRelated];

  if ((v5 & 1) == 0) {
    [v6 setTitleOpacity:0.0];
  }
}

- (void)setValidationController:(id)a3
{
  char v5 = (PXStoryValidationController *)a3;
  validationController = self->_validationController;
  if (validationController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)validationController performChanges:&__block_literal_global_400];
    objc_storeStrong((id *)&self->_validationController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __44__PXStoryViewModel_setValidationController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setMuteStateController:(id)a3
{
}

- (void)setBufferingController:(id)a3
{
  char v5 = (PXStoryViewBufferingController *)a3;
  bufferingController = self->_bufferingController;
  if (bufferingController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)bufferingController performChanges:&__block_literal_global_397_186546];
    objc_storeStrong((id *)&self->_bufferingController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __43__PXStoryViewModel_setBufferingController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setPersistenceController:(id)a3
{
  char v5 = (PXStoryPersistenceController *)a3;
  persistenceController = self->_persistenceController;
  if (persistenceController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)persistenceController performChanges:&__block_literal_global_394_186548];
    objc_storeStrong((id *)&self->_persistenceController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __45__PXStoryViewModel_setPersistenceController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setAudioSessionController:(id)a3
{
  char v5 = (PXStoryAudioSessionController *)a3;
  if (self->_audioSessionController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_audioSessionController, a3);
    char v5 = v6;
  }
}

- (void)setSongController:(id)a3
{
}

- (void)setResourcesPreloadingController:(id)a3
{
  char v5 = (PXStoryViewResourcesPreloadingController *)a3;
  resourcesPreloadingController = self->_resourcesPreloadingController;
  if (resourcesPreloadingController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)resourcesPreloadingController performChanges:&__block_literal_global_391];
    objc_storeStrong((id *)&self->_resourcesPreloadingController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __53__PXStoryViewModel_setResourcesPreloadingController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setPacingController:(id)a3
{
  char v5 = (PXStoryPacingController *)a3;
  pacingController = self->_pacingController;
  if (pacingController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)pacingController performChanges:&__block_literal_global_388_186550];
    objc_storeStrong((id *)&self->_pacingController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __40__PXStoryViewModel_setPacingController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setMusicPlayer:(id)a3
{
  char v5 = (PXStoryMusicPlayer *)a3;
  p_musicPlayer = &self->_musicPlayer;
  musicPlayer = self->_musicPlayer;
  if (musicPlayer != v5)
  {
    id v8 = v5;
    [(PXStoryMusicPlayer *)musicPlayer unregisterChangeObserver:self context:MusicPlayerObservationContext];
    [(PXStoryMusicPlayer *)*p_musicPlayer performChanges:&__block_literal_global_385_186552];
    objc_storeStrong((id *)&self->_musicPlayer, a3);
    [(PXStoryMusicPlayer *)*p_musicPlayer registerChangeObserver:self context:MusicPlayerObservationContext];
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v8;
  }
}

uint64_t __35__PXStoryViewModel_setMusicPlayer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setRelatedController:(id)a3
{
  char v5 = (PXStoryRelatedController *)a3;
  relatedController = self->_relatedController;
  if (relatedController != v5)
  {
    id v7 = v5;
    [(PXStoryController *)relatedController performChanges:&__block_literal_global_382_186554];
    objc_storeStrong((id *)&self->_relatedController, a3);
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    char v5 = v7;
  }
}

uint64_t __41__PXStoryViewModel_setRelatedController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

- (void)setOverlayController:(id)a3
{
}

- (void)liveResizeDidEnd
{
  id v2 = [(PXStoryViewModel *)self mainModel];
  [v2 performChanges:&__block_literal_global_379];
}

uint64_t __36__PXStoryViewModel_liveResizeDidEnd__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInLiveResize:0];
}

- (void)liveResizeWillStart
{
  id v2 = [(PXStoryViewModel *)self mainModel];
  [v2 performChanges:&__block_literal_global_377];
}

uint64_t __39__PXStoryViewModel_liveResizeWillStart__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInLiveResize:1];
}

- (void)cycleHUDType
{
}

void __32__PXStoryViewModel_cycleHUDType__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 isHUDVisible])
  {
    id v2 = +[PXStorySettings possibleDefaultHUDTypes];
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "diagnosticHUDType"));
    uint64_t v4 = [v2 indexOfObject:v3];

    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = (v4 + 1) % (unint64_t)[v2 count];
    }
    id v6 = [v2 objectAtIndexedSubscript:v5];
    objc_msgSend(v7, "setDiagnosticHUDType:", objc_msgSend(v6, "integerValue"));
  }
  else
  {
    [v7 setIsHUDVisible:1];
  }
}

- (void)toggleHUD
{
}

void __29__PXStoryViewModel_toggleHUD__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setIsHUDVisible:", objc_msgSend(v2, "isHUDVisible") ^ 1);
  if ([v2 isHUDVisible] && !objc_msgSend(v2, "diagnosticHUDType")) {
    [v2 cycleHUDType];
  }
}

- (void)toggleChrome
{
  uint64_t v3 = [(PXStoryViewModel *)self wantsChromeVisible] ^ 1;
  [(PXStoryViewModel *)self setWantsChromeVisible:v3];
}

- (BOOL)skipToBeginningOfSegmentWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v4 = [(PXStoryViewModel *)self mainModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PXStoryViewModel_skipToBeginningOfSegmentWithIdentifier___block_invoke;
  void v6[3] = &unk_1E5DC2D40;
  v6[4] = &v7;
  void v6[5] = a3;
  [v4 performChanges:v6];

  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __59__PXStoryViewModel_skipToBeginningOfSegmentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 skipToBeginningOfSegmentWithIdentifier:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3 byTappingEdge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(PXStoryViewModel *)self mainModel];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PXStoryViewModel_skipToSegmentWithOffset_byTappingEdge___block_invoke;
  v14[3] = &unk_1E5DC2D40;
  v14[4] = &v15;
  v14[5] = a3;
  [v8 performChanges:v14];

  if (*((unsigned char *)v16 + 24))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    [(PXStoryViewModel *)self setLastSkipSegmentActionDate:v9];

    if (v4)
    {
      if (a3 <= 0)
      {
        if ((a3 & 0x8000000000000000) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"PXStoryViewModel.m" lineNumber:1106 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        uint64_t v10 = 2;
      }
      else
      {
        uint64_t v10 = 8;
      }
      [(PXStoryViewModel *)self setEdgeToHighlight:v10];
    }
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __58__PXStoryViewModel_skipToSegmentWithOffset_byTappingEdge___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 skipToSegmentWithOffset:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)skipToSegmentWithOffset:(int64_t)a3
{
  return [(PXStoryViewModel *)self skipToSegmentWithOffset:a3 byTappingEdge:0];
}

- (void)togglePlayback
{
  BOOL v3 = [(PXStoryViewModel *)self desiredPlayState] == 0;
  [(PXStoryViewModel *)self setDesiredPlayState:v3];
}

- (void)setIsPerformingCrossfadeTransitionToRelated:(BOOL)a3
{
  if (self->_isPerformingCrossfadeTransitionToRelated != a3)
  {
    self->_isPerformingCrossfadeTransitionToRelated = a3;
    [(PXStoryViewModel *)self signalChange:0x20000000000000];
  }
}

- (void)setEdgeToHighlight:(unint64_t)a3
{
  if (self->_edgeToHighlight != a3)
  {
    self->_edgeToHighlight = a3;
    [(PXStoryViewModel *)self signalChange:0x80000000];
  }
}

- (void)setLastSkipSegmentActionDate:(id)a3
{
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastSkipSegmentActionDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastSkipSegmentActionDate, a3);
    [(PXStoryViewModel *)self signalChange:0x4000000];
  }
}

- (void)setDidSelectAnyRelated:(BOOL)a3
{
  self->_didSelectAnyRelated = a3;
}

- (void)setViewEnvironmentModel:(id)a3
{
  obuint64_t j = a3;
  p_viewEnvironmentModel = &self->_viewEnvironmentModel;
  id v5 = objc_loadWeakRetained((id *)p_viewEnvironmentModel);
  if (v5 == obj)
  {
  }
  else
  {
    char v6 = [obj isEqual:v5];

    if ((v6 & 1) == 0) {
      objc_storeWeak((id *)p_viewEnvironmentModel, obj);
    }
  }
}

- (void)setRelatedModels:(id)a3
{
  id v8 = (NSArray *)a3;
  BOOL v4 = self->_relatedModels;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      relatedModels = self->_relatedModels;
      self->_relatedModels = v6;

      [(PXStoryViewModel *)self signalChange:256];
      [(PXStoryViewModel *)self _invalidateWantsRelatedOverlayScrollable];
    }
  }
}

- (void)_setMainModel:(id)a3 changeOrigin:(unint64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  id v9 = self->_mainModel;
  if (v9 == v7)
  {
  }
  else
  {
    uint64_t v10 = v9;
    char v11 = [(PXStoryModel *)v7 isEqual:v9];

    if ((v11 & 1) == 0)
    {
      [(PXStoryModel *)*p_mainModel unregisterChangeObserver:self context:MainModelObservationContext_186383];
      objc_storeStrong((id *)&self->_mainModel, a3);
      [(PXStoryModel *)*p_mainModel registerChangeObserver:self context:MainModelObservationContext_186383];
      [(PXStoryViewModel *)self signalChange:64];
      id v12 = [(PXStoryModel *)*p_mainModel currentAssetCollection];
      if (a4 == 2)
      {
        char v13 = 0;
        uint64_t v14 = @"autoPlayRelated";
        uint64_t v15 = @"com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedByAutoplayedRelated";
      }
      else if (a4 == 1)
      {
        char v13 = 0;
        uint64_t v14 = @"userSelectedRelated";
        uint64_t v15 = @"com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedByUserSelectingRelated";
      }
      else if (a4)
      {
        uint64_t v15 = 0;
        uint64_t v14 = 0;
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
        uint64_t v14 = @"initialization";
        uint64_t v15 = @"com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStarted";
      }
      id v16 = PLStoryGetLog();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      uint64_t v40 = v12;
      if (v12)
      {
        if (v17)
        {
          objc_msgSend(v12, "px_cheapLogIdentifier");
          char v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          long long v19 = [v12 uuid];
          *(_DWORD *)buf = 138543874;
          id v46 = v18;
          __int16 v47 = 2114;
          long long v48 = v19;
          __int16 v49 = 2114;
          long long v50 = v14;
          _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Started fullscreen playback for asset collection==%{public}@, uuid==%{public}@, origin==%{public}@", buf, 0x20u);
        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 138543362;
        id v46 = v14;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Started fullscreen playback for arbitrary set of assets, origin==%{public}@", buf, 0xCu);
      }

      uint64_t v20 = [(PXStoryModel *)*p_mainModel configuration];
      if ([v20 isAllowedToPlayAnyMusicOrSound])
      {
        id v21 = +[PXStorySettings sharedInstance];
        uint64_t v22 = [v21 appleMusicPromptTrigger];

        if (v22 == 1) {
          +[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:0];
        }
      }
      else
      {
      }
      v23 = (void *)MEMORY[0x1E4F56560];
      if ((v13 & 1) == 0)
      {
        id v24 = (void *)MEMORY[0x1E4F56658];
        uint64_t v43 = *MEMORY[0x1E4F56560];
        BOOL v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        BOOL v27 = v26 = v23;
        v44 = v27;
        BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        [v24 sendEvent:v15 withPayload:v28];

        v23 = v26;
      }
      v29 = [(PXStoryModel *)*p_mainModel untruncatedCuratedAssets];
      BOOL v30 = v29;
      if (v29)
      {
        uint64_t v31 = [v29 count];
      }
      else
      {
        id v32 = [(PXStoryModel *)*p_mainModel curatedAssets];
        uint64_t v31 = [v32 count];
      }
      v33 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", v31, 0, 10, 50, 100, 200, 300, 500, 1000, 2000, 5000, 10000, 20000, 0);
      BOOL v34 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.memory.interactiveMemoryFullscreenPlaybackStartedWith%@CuratedAssets", v33];
      uint64_t v35 = (void *)MEMORY[0x1E4F56658];
      uint64_t v41 = *v23;
      uint64_t v36 = (objc_class *)objc_opt_class();
      uint64_t v37 = NSStringFromClass(v36);
      v42 = v37;
      id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      [v35 sendEvent:v34 withPayload:v38];

      uint64_t v39 = [MEMORY[0x1E4F1C9C8] date];
      [(PXStoryViewModel *)self setLastMainModelChangeDate:v39];

      [(PXStoryViewModel *)self _invalidateMainModelProperties];
      [(PXStoryViewModel *)self _invalidateDesiredPlayState];
      [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
      [(PXStoryViewModel *)self _invalidatePlaybackFractionCompleted];
      [(PXStoryViewModel *)self _invalidatePlaybackDuration];
      [(PXStoryViewModel *)self _invalidateOutroFractionCompleted];
      [(PXStoryViewModel *)self _invalidateMainAssetCollection];
      [(PXStoryViewModel *)self _invalidateMainModelControllers];
      [(PXStoryViewModel *)self _invalidateRecentlyUsedSongs];
      [(PXStoryViewModel *)self _invalidateMainAsset];
      [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
    }
  }
}

- (void)setActionPerformer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_actionPerformer = &self->_actionPerformer;
  id WeakRetained = objc_loadWeakRetained((id *)p_actionPerformer);

  if (WeakRetained != v4)
  {
    id v7 = objc_loadWeakRetained((id *)p_actionPerformer);

    if (v7) {
      PXAssertGetLog();
    }
    objc_storeWeak((id *)p_actionPerformer, v4);
  }
}

- (void)setViewLayoutSpec:(id)a3
{
  id v7 = (PXStoryViewLayoutSpec *)a3;
  char v5 = self->_viewLayoutSpec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryViewLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewLayoutSpec, a3);
      [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
      [(PXStoryViewModel *)self signalChange:32];
    }
  }
}

- (void)setMainAssetCollection:(id)a3
{
  char v5 = (PXDisplayAssetCollection *)a3;
  if (self->_mainAssetCollection != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_mainAssetCollection, a3);
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
    [(PXStoryViewModel *)self signalChange:16];
    char v5 = v6;
  }
}

- (void)setCustomGeneralChromeTitleConfiguration:(id)a3
{
  uint64_t v8 = (PXStoryViewChromeTitleConfiguration *)a3;
  id v4 = self->_customGeneralChromeTitleConfiguration;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXStoryViewChromeTitleConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      char v6 = (PXStoryViewChromeTitleConfiguration *)[(PXStoryViewChromeTitleConfiguration *)v8 copy];
      customGeneralChromeTitleConfiguration = self->_customGeneralChromeTitleConfiguration;
      self->_customGeneralChromeTitleConfiguration = v6;

      [(PXStoryViewModel *)self _invalidateSpecManager];
    }
  }
}

- (void)setBottomGradientLegibilityOverlayOpacity:(double)a3
{
  if (self->_bottomGradientLegibilityOverlayOpacity != a3)
  {
    self->_bottomGradientLegibilityOverlayOpacity = a3;
    [(PXStoryViewModel *)self signalChange:0x100000000000];
  }
}

- (void)setTopGradientLegibilityOverlayOpacity:(double)a3
{
  if (self->_topGradientLegibilityOverlayOpacity != a3)
  {
    self->_topGradientLegibilityOverlayOpacity = a3;
    [(PXStoryViewModel *)self signalChange:0x80000000000];
  }
}

- (void)setSolidLegibilityOverlayOpacity:(double)a3
{
  if (self->_solidLegibilityOverlayOpacity != a3)
  {
    self->_solidLegibilityOverlayOpacity = a3;
    [(PXStoryViewModel *)self signalChange:0x20000];
  }
}

- (void)setPlaybackEndDarkening:(double)a3
{
  if (self->_playbackEndDarkening != a3)
  {
    self->_playbackEndDarkening = a3;
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
  }
}

- (void)setWantsPlaybackEndDarkening:(BOOL)a3
{
  if (self->_wantsPlaybackEndDarkening != a3)
  {
    self->_wantsPlaybackEndDarkening = a3;
    [(PXStoryViewModel *)self signalChange:0x800000000000];
  }
}

- (void)setShouldCountDownToUpNext:(BOOL)a3
{
  if (self->_shouldCountDownToUpNext != a3)
  {
    self->_shouldCountDownToUpNext = a3;
    [(PXStoryViewModel *)self signalChange:0x10000000];
  }
}

- (void)setWantsRelatedOverlayNavigationButtonsVisible:(BOOL)a3
{
  if (self->_wantsRelatedOverlayNavigationButtonsVisible != a3)
  {
    self->_wantsRelatedOverlayNavigationButtonsVisible = a3;
    [(PXStoryViewModel *)self signalChange:0x40000000000000];
  }
}

- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3
{
  if (self->_isRelatedOverlayScrolledIntoView != a3)
  {
    self->_isRelatedOverlayScrolledIntoView = a3;
    [(PXStoryViewModel *)self signalChange:0x8000000];
  }
}

- (void)setFadeOutOverlayVisibilityFraction:(double)a3
{
  if (self->_fadeOutOverlayVisibilityFraction != a3)
  {
    self->_fadeOutOverlayVisibilityFraction = a3;
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
  }
}

- (void)setRelatedOverlayVisibilityFraction:(double)a3
{
  if (self->_relatedOverlayVisibilityFraction != a3)
  {
    self->_relatedOverlayVisibilityFraction = a3;
    [(PXStoryViewModel *)self signalChange:0x10000];
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setWantsRelatedOverlayScrollable:(BOOL)a3
{
  if (self->_wantsRelatedOverlayScrollable != a3)
  {
    self->_wantsRelatedOverlayScrollable = a3;
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setModelCoveredByRelated:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoveredByRelated);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_modelCoveredByRelated, obj);
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
    BOOL v5 = obj;
  }
}

- (void)setWantsRelatedOverlayVisible:(BOOL)a3
{
  if (self->_wantsRelatedOverlayVisible != a3)
  {
    self->_wantsRelatedOverlayVisible = a3;
    [(PXStoryViewModel *)self signalChange:0x8000];
    if (self->_wantsRelatedOverlayVisible)
    {
      id v4 = +[PXStorySettings sharedInstance];
      if ([v4 wantsRelatedCountdown]) {
        uint64_t v5 = [(PXStoryViewModel *)self shouldSimplifyUIForAccessibility] ^ 1;
      }
      else {
        uint64_t v5 = 0;
      }
      [(PXStoryViewModel *)self setShouldCountDownToUpNext:v5];
    }
    else
    {
      [(PXStoryViewModel *)self setShouldCountDownToUpNext:0];
    }
    [(PXStoryViewModel *)self _invalidateWantsRelatedOverlayScrollable];
    [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
    if (self->_wantsRelatedOverlayVisible)
    {
      [(PXStoryViewModel *)self setHighlightedRelatedIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    else
    {
      [(PXStoryViewModel *)self setWantsPlaybackEndDarkening:0];
      [(PXStoryViewModel *)self setWantsRelatedOverlayNavigationButtonsVisible:0];
    }
    if (self->_wantsRelatedOverlayVisible)
    {
      id v6 = [(PXStoryViewModel *)self mainModel];
      [(PXStoryViewModel *)self setModelCoveredByRelated:v6];
    }
    else
    {
      [(PXStoryViewModel *)self setModelCoveredByRelated:0];
    }
  }
}

- (void)setStyleSwitcherVisibilityFraction:(double)a3
{
  if (self->_styleSwitcherVisibilityFraction != a3)
  {
    self->_styleSwitcherVisibilityFraction = a3;
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
  }
}

- (void)setScrubberVisibilityFraction:(double)a3
{
  if (self->_scrubberVisibilityFraction != a3)
  {
    self->_scrubberVisibilityFraction = a3;
    [(PXStoryViewModel *)self signalChange:0x1000000];
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
  }
}

- (void)setWantsScrubberVisible:(BOOL)a3
{
  if (self->_wantsScrubberVisible != a3)
  {
    self->_wantsScrubberVisible = a3;
    [(PXStoryViewModel *)self signalChange:0x2000000];
  }
}

- (void)setMaximumIndividualTopChromeItemVisibilityFraction:(double)a3
{
  if (self->_maximumIndividualTopChromeItemVisibilityFraction != a3)
  {
    self->_maximumIndividualTopChromeItemVisibilityFraction = a3;
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
  }
}

- (void)setMuteToggleButtonVisibilityFraction:(double)a3
{
  self->_muteToggleButtonVisibilityFraction = a3;
}

- (void)setBufferingIndicatorVisibilityFraction:(double)a3
{
  if (self->_bufferingIndicatorVisibilityFraction != a3)
  {
    self->_bufferingIndicatorVisibilityFraction = a3;
    id v4 = +[PXStorySettings sharedInstance];
    int v5 = [v4 useBottomLegibilityGradientForBufferingIndicator];

    if (v5)
    {
      [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
    }
  }
}

- (void)setChromeItemsToBeDisplayedExternally:(unint64_t)a3
{
  if (self->_chromeItemsToBeDisplayedExternally != a3)
  {
    self->_chromeItemsToBeDisplayedExternally = a3;
    [(PXStoryViewModel *)self signalChange:0x400000000000];
  }
}

- (void)setAllowedChromeItems:(unint64_t)a3
{
  if (self->_allowedChromeItems != a3)
  {
    self->_allowedChromeItems = a3;
    [(PXStoryViewModel *)self signalChange:0x40000000000];
  }
}

- (void)setChromeItems:(unint64_t)a3
{
  if (self->_chromeItems != a3)
  {
    self->_chromeItems = a3;
    [(PXStoryViewModel *)self signalChange:0x400000];
  }
}

- (void)setChromeVisibilityFraction:(double)a3
{
  if (self->_chromeVisibilityFraction != a3)
  {
    self->_chromeVisibilityFraction = a3;
    [(PXStoryViewModel *)self signalChange:0x4000];
    [(PXStoryViewModel *)self _invalidateLegibilityOverlayOpacity];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
  }
}

- (void)setNeedsStatusBarVisible:(BOOL)a3
{
  if (self->_needsStatusBarVisible != a3)
  {
    self->_needsStatusBarVisible = a3;
    [(PXStoryViewModel *)self signalChange:0x2000000000000];
  }
}

- (void)setWantsChromeVisible:(BOOL)a3
{
  if (self->_wantsChromeVisible != a3)
  {
    self->_wantsChromeVisible = a3;
    [(PXStoryViewModel *)self signalChange:8];
    [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
    [(PXStoryViewModel *)self _invalidateShouldAutoHideMuteToggleButton];
    [(PXStoryViewModel *)self hideMuteToggleButtonWhenChromeIsHidden];
  }
}

- (void)setIsPerformingAnyExportOperation:(BOOL)a3
{
  if (self->_isPerformingAnyExportOperation != a3)
  {
    self->_isPerformingAnyExportOperation = a3;
    [(PXStoryViewModel *)self signalChange:0x4000000000000];
  }
}

- (void)_updateIsPerformingAnyExportOperation
{
  BOOL v3 = [(NSMutableSet *)self->_exportOperationIdentifiers count] != 0;
  [(PXStoryViewModel *)self setIsPerformingAnyExportOperation:v3];
}

- (void)_invalidateIsPerformingAnyExportOperation
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsPerformingAnyExportOperation];
}

- (void)setPerformingExportOperation:(BOOL)a3 withIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  exportOperationIdentifiers = self->_exportOperationIdentifiers;
  id v10 = v6;
  if (v4)
  {
    if (!exportOperationIdentifiers)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      id v9 = self->_exportOperationIdentifiers;
      self->_exportOperationIdentifiers = v8;

      id v6 = v10;
      exportOperationIdentifiers = self->_exportOperationIdentifiers;
    }
    [(NSMutableSet *)exportOperationIdentifiers addObject:v6];
  }
  else
  {
    [(NSMutableSet *)exportOperationIdentifiers removeObject:v6];
  }
  [(PXStoryViewModel *)self _invalidateIsPerformingAnyExportOperation];
}

- (void)setIsAnyMenuOpen:(BOOL)a3
{
  if (self->_isAnyMenuOpen != a3)
  {
    self->_isAnyMenuOpen = a3;
    [(PXStoryViewModel *)self signalChange:0x4000000000000];
    [(PXStoryViewModel *)self _invalidateShouldAutoHideChrome];
  }
}

- (void)setMenuIsOpen:(BOOL)a3 withIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  openMenuIdentifiers = self->_openMenuIdentifiers;
  id v10 = v6;
  if (v4)
  {
    if (!openMenuIdentifiers)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      id v9 = self->_openMenuIdentifiers;
      self->_openMenuIdentifiers = v8;

      id v6 = v10;
      openMenuIdentifiers = self->_openMenuIdentifiers;
    }
    [(NSMutableSet *)openMenuIdentifiers addObject:v6];
  }
  else
  {
    [(NSMutableSet *)openMenuIdentifiers removeObject:v6];
  }
  [(PXStoryViewModel *)self _invalidateIsAnyMenuOpen];
}

- (void)setIsActionMenuOpen:(BOOL)a3
{
  if (self->_isActionMenuOpen != a3)
  {
    self->_isActionMenuOpen = a3;
    -[PXStoryViewModel setMenuIsOpen:withIdentifier:](self, "setMenuIsOpen:withIdentifier:");
  }
}

- (BOOL)assetCollectionForcesAutoReplay
{
  id v2 = [(PXStoryViewModel *)self mainConfiguration];
  BOOL v3 = [v2 assetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if ([v4 isGenerative]) {
    BOOL v5 = [v4 subcategory] == 1100;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setShouldAutoReplayPreference:(BOOL)a3
{
  if (self->_shouldAutoReplayPreference != a3)
  {
    BOOL v3 = a3;
    self->_shouldAutoReplayPreference = a3;
    [(PXStoryViewModel *)self signalChange:0x4000000000];
    if (![(PXStoryViewModel *)self assetCollectionForcesAutoReplay])
    {
      BOOL v5 = [(PXStoryViewModel *)self userDefaults];
      id v6 = [NSNumber numberWithBool:v3];
      [v5 setPersistedValue:v6 forKey:@"PXStoryViewModelAutoReplay"];
    }
    [(PXStoryViewModel *)self _invalidateWantsRelatedOverlayScrollable];
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
  }
}

- (void)toggleAutoReplayPreference
{
  uint64_t v3 = [(PXStoryViewModel *)self shouldAutoReplayPreference] ^ 1;
  [(PXStoryViewModel *)self setShouldAutoReplayPreference:v3];
}

- (void)setIsAtPlaybackEnd:(BOOL)a3
{
  if (self->_isAtPlaybackEnd == a3) {
    return;
  }
  self->_isAtPlaybackEnd = a3;
  [(PXStoryViewModel *)self signalChange:0x200000];
  [(PXStoryViewModel *)self _invalidateShouldPreventDisplaySleep];
  unint64_t v4 = [(PXStoryViewModel *)self endBehavior];
  switch(v4)
  {
    case 4uLL:
      BOOL v5 = self;
      uint64_t v6 = 0;
      break;
    case 3uLL:
      BOOL v5 = self;
      uint64_t v6 = 1;
      uint64_t v7 = 0;
      goto LABEL_10;
    case 2uLL:
      BOOL v5 = self;
      uint64_t v6 = 1;
      break;
    default:
      return;
  }
  uint64_t v7 = 1;
LABEL_10:
  [(PXStoryViewModel *)v5 rewindToBeginning:v6 rewindMusic:v7];
}

- (void)setIsAtPlaybackStart:(BOOL)a3
{
  if (self->_isAtPlaybackStart != a3)
  {
    self->_isAtPlaybackStart = a3;
    [(PXStoryViewModel *)self _invalidateShouldAutoHideMuteToggleButton];
  }
}

- (void)_autoHideChrome
{
  [(PXStoryViewModel *)self _cancelAutoHideChromeTimer];
  if ([(PXStoryViewModel *)self shouldAutoHideChrome])
  {
    [(PXStoryViewModel *)self performChanges:&__block_literal_global_337_186592];
  }
}

uint64_t __35__PXStoryViewModel__autoHideChrome__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsChromeVisible:0];
}

- (void)_cancelAutoHideChromeTimer
{
  uint64_t v3 = [(PXStoryViewModel *)self autoHideChromeTimer];
  [v3 invalidate];

  [(PXStoryViewModel *)self setAutoHideChromeTimer:0];
}

- (void)setShouldAutoHideChrome:(BOOL)a3
{
  if (self->_shouldAutoHideChrome != a3)
  {
    BOOL v3 = a3;
    self->_shouldAutoHideChrome = a3;
    [(PXStoryViewModel *)self _cancelAutoHideChromeTimer];
    if (v3)
    {
      BOOL v5 = +[PXStorySettings sharedInstance];
      [v5 chromeAutoHideDelay];
      double v7 = v6;

      objc_initWeak(&location, self);
      uint64_t v8 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __44__PXStoryViewModel_setShouldAutoHideChrome___block_invoke;
      uint64_t v15 = &unk_1E5DCD920;
      objc_copyWeak(&v16, &location);
      id v9 = [v8 timerWithTimeInterval:0 repeats:&v12 block:v7];
      -[PXStoryViewModel setAutoHideChromeTimer:](self, "setAutoHideChromeTimer:", v9, v12, v13, v14, v15);

      id v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      char v11 = [(PXStoryViewModel *)self autoHideChromeTimer];
      [v10 addTimer:v11 forMode:*MEMORY[0x1E4F1C4B0]];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __44__PXStoryViewModel_setShouldAutoHideChrome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _autoHideChrome];
}

- (void)setOutroFractionCompleted:(double)a3
{
  if (self->_outroFractionCompleted != a3)
  {
    self->_outroFractionCompleted = a3;
    [(PXStoryViewModel *)self signalChange:0x1000000000000];
    BOOL v4 = self->_outroFractionCompleted > 0.0;
    [(PXStoryViewModel *)self setWantsPlaybackEndDarkening:v4];
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
    p_playbackDuration->epoch = a3->var3;
    *(_OWORD *)&p_playbackDuration->value = v6;
    [(PXStoryViewModel *)self signalChange:0x200000000000];
  }
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime = &self->_currentPlaybackTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_currentPlaybackTime->epoch = a3->var3;
    *(_OWORD *)&p_currentPlaybackTime->value = v6;
    [(PXStoryViewModel *)self signalChange:4];
  }
}

- (void)setPlaybackFractionCompleted:(double)a3
{
  if (self->_playbackFractionCompleted != a3)
  {
    self->_playbackFractionCompleted = a3;
    [(PXStoryViewModel *)self signalChange:4];
    [(PXStoryViewModel *)self setIsAtPlaybackStart:self->_playbackFractionCompleted <= 0.0];
    BOOL v4 = self->_playbackFractionCompleted >= 1.0;
    [(PXStoryViewModel *)self setIsAtPlaybackEnd:v4];
  }
}

- (void)setWantsSoloPlayback:(BOOL)a3
{
  if (self->_wantsSoloPlayback != a3)
  {
    BOOL v3 = a3;
    self->_wantsSoloPlayback = a3;
    BOOL v5 = objc_opt_class();
    if (v3)
    {
      [v5 registerViewModelDesiringSoloPlayback:self];
    }
    else
    {
      [v5 unregisterViewModelDesiringSoloPlayback:self];
    }
  }
}

- (void)_updateWantsSoloPlayback
{
  if ([(PXStoryViewModel *)self desiredPlayState] == 1
    && [(PXStoryViewModel *)self isActive])
  {
    BOOL v3 = [(PXStoryViewModel *)self mainConfiguration];
    uint64_t v4 = [v3 allowPlayingMultipleStoriesSimultaneously] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PXStoryViewModel *)self setWantsSoloPlayback:v4];
}

- (void)_invalidateWantsSoloPlayback
{
  id v2 = [(PXStoryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateWantsSoloPlayback];
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    [(PXStoryViewModel *)self signalChange:2];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
    [(PXStoryViewModel *)self _invalidateShouldPreventDisplaySleep];
    [(PXStoryViewModel *)self _invalidateWantsSoloPlayback];
    if ([(PXStoryViewModel *)self pausingPlaybackShowsChrome])
    {
      if (!self->_desiredPlayState)
      {
        [(PXStoryViewModel *)self performChanges:&__block_literal_global_332];
      }
    }
  }
}

uint64_t __40__PXStoryViewModel_setDesiredPlayState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsChromeVisible:1];
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXStoryViewModel *)self signalChange:1];
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    [(PXStoryViewModel *)self _invalidateShouldPreventDisplaySleep];
    [(PXStoryViewModel *)self _invalidateWantsSoloPlayback];
    if (self->_isActive && !self->_hasBeenActiveOnce)
    {
      self->_hasBeenActiveOnce = 1;
      id v4 = [(PXStoryViewModel *)self loadingCoordinator];
      [v4 resumeTimelineWork];
    }
  }
}

- (void)setSwipeDownDismissalPreviewFraction:(double)a3
{
  if (self->_swipeDownDismissalPreviewFraction != a3) {
    self->_swipeDownDismissalPreviewFraction = a3;
  }
}

- (void)setSwipeDownDismissalPreviewEnabled:(BOOL)a3
{
  if (self->_swipeDownDismissalPreviewEnabled != a3)
  {
    self->_swipeDownDismissalPreviewEnabled = a3;
    [(PXStoryViewModel *)self signalChange:0x8000000000];
  }
}

- (void)setSwipeDownTriggeringDismissal:(BOOL)a3
{
  if (self->_swipeDownTriggeringDismissal != a3) {
    self->_swipeDownTriggeringDismissal = a3;
  }
}

- (void)setSwipeDownInteractionState:(id *)a3
{
  p_swipeDownInteractionState = &self->_swipeDownInteractionState;
  long long v6 = *(_OWORD *)&self->_swipeDownInteractionState.coordinateSpace;
  void v15[2] = self->_swipeDownInteractionState.velocity;
  v15[3] = v6;
  double lastTimestamp = self->_swipeDownInteractionState.lastTimestamp;
  CGPoint location = self->_swipeDownInteractionState.location;
  v15[0] = self->_swipeDownInteractionState.initialLocation;
  v15[1] = location;
  long long v8 = *(_OWORD *)&a3->var3;
  v13[2] = a3->var2;
  v13[3] = v8;
  double var5 = a3->var5;
  CGPoint var1 = a3->var1;
  v13[0] = a3->var0;
  v13[1] = var1;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v15, (uint64_t)v13) & 1) == 0)
  {
    p_swipeDownInteractionState->initialLocation = a3->var0;
    CGPoint v10 = a3->var1;
    CGPoint var2 = a3->var2;
    long long v12 = *(_OWORD *)&a3->var3;
    p_swipeDownInteractionState->double lastTimestamp = a3->var5;
    p_swipeDownInteractionState->velocity = var2;
    *(_OWORD *)&p_swipeDownInteractionState->coordinateSpace = v12;
    p_swipeDownInteractionState->CGPoint location = v10;
    [(PXStoryViewModel *)self signalChange:0x800000000];
    [(PXStoryViewModel *)self _invalidateViewModeTransition];
  }
}

- (void)setViewModeTransition:(id)a3
{
  BOOL v5 = (PXStoryViewModeTransition *)a3;
  viewModeTransition = self->_viewModeTransition;
  if (viewModeTransition != v5)
  {
    double v7 = v5;
    [(PXStoryViewModeTransition *)viewModeTransition registerChangeObserver:self context:ViewModeTransitionObservationContext_186384];
    objc_storeStrong((id *)&self->_viewModeTransition, a3);
    [(PXStoryViewModeTransition *)self->_viewModeTransition registerChangeObserver:self context:ViewModeTransitionObservationContext_186384];
    [(PXStoryViewModel *)self signalChange:0x400000000];
    BOOL v5 = v7;
  }
}

- (void)setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    [(PXStoryViewModel *)self signalChange:0x2000];
    [(PXStoryViewModel *)self _invalidateMainModelProperties];
    [(PXStoryViewModel *)self _invalidateShouldPreventDisplaySleep];
    [(PXStoryViewModel *)self _invalidateCanToggleSelectMode];
    [(PXStoryViewModel *)self _invalidateControllersActiveness];
    [(PXStoryViewModel *)self _invalidateAXStoredPlayState];
    [(PXStoryViewModel *)self _invalidateDisplayTitleAndSubtitle];
  }
}

- (unint64_t)endBehavior
{
  BOOL v3 = [(PXStoryViewModel *)self mainConfiguration];
  if ([v3 isExportPreview])
  {
    unint64_t v4 = 2;
  }
  else if (([v3 shouldReplayAtEnd] & 1) != 0 {
         || ([v3 isAppleMusicPreview] & 1) != 0
  }
         || [(PXStoryViewModel *)self viewMode] == 4)
  {
    if ([(PXStoryViewModel *)self assetCollectionForcesAutoReplay]) {
      unint64_t v4 = 3;
    }
    else {
      unint64_t v4 = 2;
    }
  }
  else if ([v3 isPresentedForAirPlay])
  {
    unint64_t v4 = 4;
  }
  else if ([(PXStoryViewModel *)self shouldAutoReplayPreference])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)allowsRelated
{
  BOOL v3 = [(PXStoryViewModel *)self mainConfiguration];
  if (([v3 shouldReplayAtEnd] & 1) != 0
    || [(PXStoryViewModel *)self shouldAutoReplayPreference]
    || ([v3 isAppleMusicPreview] & 1) != 0
    || ([v3 isPresentedForAirPlay] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isExportPreview] ^ 1;
  }

  return v4;
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModel;
  [(PXStoryViewModel *)&v4 didPerformChanges];
  BOOL v3 = [(PXStoryViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXStoryViewModel *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewModel;
  [(PXStoryViewModel *)&v6 performChanges:v4];
}

- (void)dealloc
{
  [(PXStoryViewModel *)self _unregisterForAccessibilityEvents];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModel;
  [(PXStoryViewModel *)&v3 dealloc];
}

- (PXStoryViewModel)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4 timeSource:(id)a5 mediaProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v82.receiver = self;
  v82.super_class = (Class)PXStoryViewModel;
  uint64_t v15 = [(PXStoryViewModel *)&v82 init];
  if (v15)
  {
    id v77 = v14;
    id v16 = [v11 log];
    [(PXStoryViewModel *)v15 setLog:v16];

    -[PXStoryViewModel setLogContext:](v15, "setLogContext:", [v11 logContext]);
    objc_storeStrong((id *)&v15->_mainConfiguration, a3);
    p_extendedTraitCollection = &v15->_extendedTraitCollection;
    objc_storeStrong((id *)&v15->_extendedTraitCollection, a4);
    objc_storeStrong((id *)&v15->_timeSource, a5);
    objc_storeStrong((id *)&v15->_mediaProvider, a6);
    v15->_isAllowedToPlayAnyMusicOrSound = [v11 isAllowedToPlayAnyMusicOrSound];
    v15->_swipeDownInteractionState.initialLocation = 0u;
    v15->_swipeDownInteractionState.CGPoint location = 0u;
    v15->_swipeDownInteractionState.velocity = 0u;
    *(_OWORD *)&v15->_swipeDownInteractionState.coordinateSpace = 0u;
    v15->_swipeDownInteractionState.double lastTimestamp = 0.0;
    char v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v18 UUIDString];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v19;

    uint64_t v21 = [v11 storyQueue];
    storyQueue = v15->_storyQueue;
    v15->_storyQueue = (OS_dispatch_queue *)v21;

    v15->_viewMode = [v11 initialViewMode];
    v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v24 = [v23 objectForKey:@"PXStoryVolume"];

    id v78 = v13;
    if (v24)
    {
      [v24 floatValue];
      double v26 = v25;
    }
    else
    {
      double v26 = 1.0;
    }
    v15->_volume = v26;
    BOOL v27 = objc_alloc_init(PXStoryPausableLoadingCoordinator);
    loadingCoordinator = v15->_loadingCoordinator;
    v15->_loadingCoordinator = v27;

    [(PXStoryPausableLoadingCoordinator *)v15->_loadingCoordinator pauseTimelineWork];
    v29 = +[PXStorySettings sharedInstance];
    BOOL v30 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:loadingCoordinator:paperTrailOptions:", v15->_mainConfiguration, *p_extendedTraitCollection, v15->_loadingCoordinator, [v29 fullsizePaperTrailOptions]);
    v15->_desiredPlayState = [(PXStoryModel *)v30 desiredPlayState];
    uint64_t v31 = [v11 presentingViewController];
    objc_storeWeak((id *)&v15->_presentingViewController, v31);

    id v32 = [(PXFeatureSpecManager *)[PXStoryViewLayoutSpecManager alloc] initWithExtendedTraitCollection:*p_extendedTraitCollection];
    viewLayoutSpecManager = v15->_viewLayoutSpecManager;
    v15->_viewLayoutSpecManager = v32;

    -[PXStoryViewLayoutSpecManager setStoryConfigurationOptions:](v15->_viewLayoutSpecManager, "setStoryConfigurationOptions:", [v11 options]);
    [(PXStoryViewLayoutSpecManager *)v15->_viewLayoutSpecManager registerChangeObserver:v15 context:ViewLayoutSpecManagerObservationContext];
    v15->_allowedChromeItems = -268435457;
    [v29 addDeferredKeyObserver:v15];
    uint64_t v34 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    diagnosticHUDContentProvidersByType = v15->_diagnosticHUDContentProvidersByType;
    v15->_diagnosticHUDContentProvidersByType = (NSMapTable *)v34;

    uint64_t v36 = [[PXStoryResourcesPreloadingCoordinator alloc] initWithQueue:v15->_storyQueue];
    resourcesPreloadingCoordinator = v15->_resourcesPreloadingCoordinator;
    v15->_resourcesPreloadingCoordinator = v36;

    uint64_t v38 = [v11 errorReporter];
    errorReporter = v15->_errorReporter;
    v15->_errorReporter = (PXStoryErrorReporter *)v38;

    uint64_t v40 = [v11 errorRepository];
    errorRepository = v15->_errorRepository;
    v15->_errorRepository = (PXStoryErrorRepository *)v40;

    [(PXStoryErrorRepository *)v15->_errorRepository registerChangeObserver:v15 context:ErrorRepositoryObservationContext];
    v42 = [v11 volumeController];
    uint64_t v43 = v42;
    if (!v42)
    {
      uint64_t v43 = +[PXDeviceVolumeController sharedInstance];
    }
    objc_storeStrong((id *)&v15->_volumeController, v43);
    if (!v42) {

    }
    v44 = [v11 userDefaults];
    v45 = v44;
    if (!v44)
    {
      v45 = +[PXUserDefaultsStandardDataSource sharedInstance];
    }
    objc_storeStrong((id *)&v15->_userDefaults, v45);
    if (!v44) {

    }
    id v46 = +[PXNetworkStatusMonitor sharedInstance];
    [v46 registerObserver:v15 queue:v15->_storyQueue];

    v15->_selectedRelatedIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v47 = [NSString alloc];
    long long v48 = (objc_class *)objc_opt_class();
    __int16 v49 = NSStringFromClass(v48);
    uint64_t v50 = [v47 initWithFormat:@"changeOrigin-%@-%p", v49, v15];
    id modelChangeOrigin = v15->_modelChangeOrigin;
    v15->_id modelChangeOrigin = (id)v50;

    id v52 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    recentlyUsedFlexSongIDs = v15->_recentlyUsedFlexSongIDs;
    v15->_recentlyUsedFlexSongIDs = v52;

    uint64_t v54 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    recentlyUsedAppleMusicSongIDs = v15->_recentlyUsedAppleMusicSongIDs;
    v15->_recentlyUsedAppleMusicSongIDs = v54;

    int64_t v56 = [[PXInfoUpdater alloc] initWithInfoProvider:v15 infoKind:@"PXStoryViewModelMainAssetInfoKind"];
    mainAssetInfoUpdater = v15->_mainAssetInfoUpdater;
    v15->_mainAssetInfoUpdater = v56;

    [(PXInfoUpdater *)v15->_mainAssetInfoUpdater setObserver:v15];
    v58 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v59 = dispatch_queue_attr_make_with_qos_class(v58, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v60 = dispatch_queue_create("PXStoryViewModel.mainAssetlocationQueue", v59);
    mainAssetInfoUpdateQueue = v15->_mainAssetInfoUpdateQueue;
    v15->_mainAssetInfoUpdateQueue = (OS_dispatch_queue *)v60;

    v15->_isAtPlaybackStart = 1;
    if ([v11 wantsFeedbackAction])
    {
      v62 = +[PXRootSettings sharedInstance];
      v15->_wantsFeedbackAction = [v62 canShowInternalUI];
    }
    else
    {
      v15->_wantsFeedbackAction = 0;
    }
    v15->_pausingPlaybackShowsChrome = 0;
    v63 = [(PXUserDefaultsDataSource *)v15->_userDefaults persistedValueForKey:@"PXStoryViewModelAutoReplay"];
    if ([v63 BOOLValue]) {
      char v64 = 1;
    }
    else {
      char v64 = [(PXStoryViewModel *)v15 assetCollectionForcesAutoReplay];
    }
    v15->_shouldAutoReplayPreference = v64;
    v65 = objc_alloc_init(PXStoryViewChromeTitleInfo);
    chromeTitleInfo = v15->_chromeTitleInfo;
    v15->_chromeTitleInfo = v65;

    uint64_t v67 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v15 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v15->_updater;
    v15->_updater = (PXUpdater *)v67;

    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateViewMode];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateAXStoredPlayState];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateSpecManager];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateViewModeTransition];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateDesiredPlayState];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateDiagnosticHUDState];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateWantsRelatedOverlayScrollable];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updatePlaybackFractionCompleted];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updatePlaybackDuration];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateMainAssetCollection];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updatePhotosGridEffectProvider];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateViewLayoutSpec];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateViewModelControllers];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateMainModelControllers];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateMainModelProperties];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateControllersActiveness];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateSongControllerFailedAssets];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateLegibilityOverlayOpacity];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateIsAnyMenuOpen];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateIsPerformingAnyExportOperation];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateShouldAutoHideChrome];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateShouldAutoHideMuteToggleButton];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateShouldPreventDisplaySleep];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateErrorIndicator];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateHUDSettings];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateIsInSelectMode];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateCanToggleSelectMode];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateRecentlyUsedSongs];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateOutroFractionCompleted];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateMainAsset];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateDisplayTitleAndSubtitle];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateWantsSoloPlayback];
    v69 = [[PXStoryViewAccessibilityHUDContentProvider alloc] initWithViewModel:v15];
    accessibilityHUDContentProvider = v15->_accessibilityHUDContentProvider;
    v15->_accessibilityHUDContentProvider = v69;

    v71 = [(PXStoryViewModel *)v15 HUDObservable];
    [v71 registerChangeObserver:v15 context:HUDObservableObservationContext];

    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __91__PXStoryViewModel_initWithConfiguration_extendedTraitCollection_timeSource_mediaProvider___block_invoke;
    v79[3] = &unk_1E5DC2D18;
    v72 = v15;
    v80 = v72;
    v81 = v30;
    id v73 = v30;
    [(PXStoryViewModel *)v72 performChanges:v79];
    [(PXStoryViewModel *)v72 _registerForAccessibilityEvents];
    v72->_axStoredPlayStateLastViewModeOnUpdate = 1;
    uint64_t v74 = [objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:0];
    scrubberFeedbackGenerator = v72->_scrubberFeedbackGenerator;
    v72->_scrubberFeedbackGenerator = (UIImpactFeedbackGenerator *)v74;

    id v14 = v77;
    id v13 = v78;
  }

  return v15;
}

void __91__PXStoryViewModel_initWithConfiguration_extendedTraitCollection_timeSource_mediaProvider___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 _setMainModel:v4 changeOrigin:0];
  [*(id *)(a1 + 32) _invalidateViewLayoutSpec];
  [*(id *)(a1 + 32) _invalidateViewModelControllers];
  [*(id *)(a1 + 32) _invalidateDiagnosticHUDState];
  [*(id *)(a1 + 32) _invalidateErrorIndicator];
  [*(id *)(a1 + 32) _invalidateMainAsset];
  [*(id *)(a1 + 32) _invalidateDisplayTitleAndSubtitle];
  [v5 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:1];
  [v5 setDiagnosticHUDContentProvider:*(void *)(a1 + 32) forType:14];
  [v5 setDiagnosticHUDContentProvider:*(void *)(*(void *)(a1 + 32) + 128) forType:17];
}

- (PXStoryViewModel)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewModel.m", 208, @"%s is not available as initializer", "-[PXStoryViewModel init]");

  abort();
}

+ (void)unregisterViewModelDesiringSoloPlayback:(id)a3
{
}

+ (void)registerViewModelDesiringSoloPlayback:(id)a3
{
  id v5 = a3;
  if (PFOSVariantHasInternalDiagnostics())
  {
    objc_super v6 = (void *)_viewModelsDesiringPlayback;
    if (!_viewModelsDesiringPlayback)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      long long v8 = (void *)_viewModelsDesiringPlayback;
      _viewModelsDesiringPlayback = v7;

      objc_super v6 = (void *)_viewModelsDesiringPlayback;
    }
    [v6 addObject:v5];
    id v9 = [v5 mainConfiguration];
    char v10 = [v9 allowPlayingMultipleStoriesSimultaneously];

    if ((v10 & 1) == 0)
    {
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke;
      v12[3] = &__block_descriptor_48_e5_v8__0l;
      v12[4] = a2;
      v12[5] = a1;
      dispatch_after(v11, MEMORY[0x1E4F14428], v12);
    }
  }
}

void __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXFilter();
}

uint64_t __58__PXStoryViewModel_registerViewModelDesiringSoloPlayback___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 wantsSoloPlayback];
}

@end