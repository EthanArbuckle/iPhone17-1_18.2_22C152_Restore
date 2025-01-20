@interface PUBrowsingViewModel
+ (PXAssetBadgeInfo)filteredBadgeInfoWithInputInfo:(SEL)a3 assetReference:(PXAssetBadgeInfo *)a4 actionManager:(id)a5;
+ (void)initialize;
- (BOOL)_needsUpdate;
- (BOOL)accessoryViewsDefaultVisibility;
- (BOOL)assetChangesShouldAnimate;
- (BOOL)creatingImageAnalysisInteraction;
- (BOOL)isAnimatingAnyTransition;
- (BOOL)isAnimatingPresentationSize;
- (BOOL)isAttemptingToPlayVideoOverlay;
- (BOOL)isChromeVisible;
- (BOOL)isFillScreenModeEnabled;
- (BOOL)isInSelectionMode;
- (BOOL)isInteractingWithVideoScrubber;
- (BOOL)isPresentedForPreview;
- (BOOL)isPresentingOverOneUp;
- (BOOL)isScrolling;
- (BOOL)isScrubbing;
- (BOOL)isVideoContentAllowed;
- (BOOL)livePhotoShouldPlay;
- (BOOL)lowMemoryMode;
- (BOOL)needsUpdateImageAnalysisInteraction;
- (BOOL)needsUpdateVideoPlayerController;
- (BOOL)wantsContentUnavailableUnlockButtonVisible;
- (CGSize)secondScreenSize;
- (NSDate)lastChromeVisibilityChangeDate;
- (NSMutableSet)_animatingTransitionIdentifiers;
- (NSMutableSet)_videoDisallowedReasons;
- (NSMutableSet)videoScrubberInteractionIdentifiers;
- (NSString)navigationBarTitle;
- (NSString)transitionDriverIdentifier;
- (OS_dispatch_queue)audioSessionUpdateQueue;
- (PUAssetActionManager)actionManager;
- (PUAssetReference)assetBeforeLastViewedAssetReference;
- (PUAssetReference)currentAssetReference;
- (PUAssetReference)lastViewedAssetReference;
- (PUAssetReference)leadingAssetReference;
- (PUAssetReference)trailingAssetReference;
- (PUAssetViewModel)assetViewModelForCurrentAssetReference;
- (PUAssetViewModel)assetViewModelHostingVideoPlayer;
- (PUAssetsDataSource)assetsDataSource;
- (PUBrowsingVideoPlayer)videoPlayer;
- (PUBrowsingViewModel)init;
- (PUBrowsingViewModel)initWithLowMemoryMode:(BOOL)a3;
- (PUImageAnalysisInteraction)imageAnalysisInteraction;
- (PUMediaProvider)mediaProvider;
- (PUOneUpVideoPlayerController)videoPlayerController;
- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel;
- (PUReviewScreenBarsModel)reviewScreenBarsModel;
- (PXAssetImportStatusManager)importStatusManager;
- (PXContentPrivacyController)privacyController;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (double)_focusValueForAsset:(id)a3;
- (double)currentAssetTransitionProgress;
- (id)_assetSharedViewModelForAsset:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_badgeInfoPromiseForAssetReference:(id)a3;
- (id)_filteredAllowedBadges:(id)a3 forAssetReference:(id)a4;
- (id)activeAssetReferences;
- (id)assetSharedViewModelForAsset:(id)a3;
- (id)assetSharedViewModelForAssetUUID:(id)a3;
- (id)assetViewModelForAssetReference:(id)a3;
- (id)currentChange;
- (id)debugDetailedDescription;
- (id)lastChromeVisibilityChangeContext;
- (id)newViewModelChange;
- (int64_t)_importStateForAssetReference:(id)a3;
- (int64_t)_scrubbingSessionDistance;
- (int64_t)_userNavigationDistance;
- (int64_t)browsingSpeedRegime;
- (int64_t)contentPrivacyState;
- (int64_t)horizontalSizeClass;
- (int64_t)lastChromeVisibilityChangeReason;
- (int64_t)systemAuthenticationType;
- (int64_t)videoOverlayPlayState;
- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4;
- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4;
- (void)_handleAsyncBrowsingSpeedRegimeInvalidation;
- (void)_invalidateAllAssetViewModels;
- (void)_invalidateAssetViewModel:(id)a3;
- (void)_invalidateBrowsingSpeedRegime;
- (void)_invalidateBrowsingSpeedRegimeAfterMaximumDelay:(double)a3;
- (void)_invalidateCurrentAndNeighboringAssetViewModels;
- (void)_invalidateImageAnalysisInteraction;
- (void)_invalidatePlaybackAudioSession;
- (void)_invalidateVideoPlayerController;
- (void)_resetAccessoryViewsVisibilityToDefaultWithChangeReason:(int64_t)a3;
- (void)_setAnimatingAnyTransition:(BOOL)a3;
- (void)_setAnimatingTransitionIdentifiers:(id)a3;
- (void)_setBrowsingSpeedRegime:(int64_t)a3;
- (void)_setCurrentAssetTransitionProgress:(double)a3;
- (void)_setLastChromeVisibilityChangeContext:(id)a3;
- (void)_setLastChromeVisibilityChangeReason:(int64_t)a3;
- (void)_setLeadingAssetReference:(id)a3;
- (void)_setScrubbingSessionDistance:(int64_t)a3;
- (void)_setTrailingAssetReference:(id)a3;
- (void)_setTransitionDriverIdentifier:(id)a3;
- (void)_setUserNavigationDistance:(int64_t)a3;
- (void)_setVideoContentAllowed:(BOOL)a3;
- (void)_setVideoDisallowedReasons:(id)a3;
- (void)_updateAssetViewModel:(id)a3;
- (void)_updateAssetViewModelsIfNeeded;
- (void)_updateContentPrivacyState;
- (void)_updateIfNeeded;
- (void)_updateImageAnalysisInteractionIfNeeded;
- (void)_updateIsInteractingWithVideoScrubber;
- (void)_updateNeighboringAssetReferences;
- (void)_updatePlaybackAudioSessionIfNeeded;
- (void)_updateScrubSpeedRegimeIfNeeded;
- (void)_updateSystemAuthenticationType;
- (void)_updateVideoPlayerControllerIfNeeded;
- (void)_updateWantsContentUnavailableUnlockButtonVisible;
- (void)assetImportStatusManager:(id)a3 didChangeStatusForAssetReference:(id)a4;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpVideoPlayerControllerPlayerDidChange:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3;
- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3 changeReason:(int64_t)a4;
- (void)setActionManager:(id)a3;
- (void)setAnimating:(BOOL)a3 transitionWithIdentifier:(id)a4;
- (void)setAssetsDataSource:(id)a3;
- (void)setChromeVisible:(BOOL)a3;
- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4;
- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4 context:(id)a5;
- (void)setContentPrivacyState:(int64_t)a3;
- (void)setCreatingImageAnalysisInteraction:(BOOL)a3;
- (void)setCurrentAssetReference:(id)a3;
- (void)setCurrentAssetReference:(id)a3 transitionProgress:(double)a4 transitionDriverIdentifier:(id)a5 animated:(BOOL)a6;
- (void)setHorizontalSizeClass:(int64_t)a3;
- (void)setImageAnalysisInteraction:(id)a3;
- (void)setImportStatusManager:(id)a3;
- (void)setIsAnimatingPresentationSize:(BOOL)a3;
- (void)setIsAttemptingToPlayVideoOverlay:(BOOL)a3;
- (void)setIsFillScreenModeEnabled:(BOOL)a3;
- (void)setIsInSelectionMode:(BOOL)a3;
- (void)setIsInteractingWithVideoScrubber:(BOOL)a3;
- (void)setIsPresentedForPreview:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setLivePhotoShouldPlay:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setNavigationBarTitle:(id)a3;
- (void)setNeedsUpdateImageAnalysisInteraction:(BOOL)a3;
- (void)setNeedsUpdateVideoPlayerController:(BOOL)a3;
- (void)setPresentingOverOneUp:(BOOL)a3;
- (void)setPrivacyController:(id)a3;
- (void)setResizeTaskDescriptorViewModel:(id)a3;
- (void)setReviewScreenBarsModel:(id)a3;
- (void)setSearchQueryMatchInfo:(id)a3;
- (void)setSecondScreenSize:(CGSize)a3;
- (void)setSystemAuthenticationType:(int64_t)a3;
- (void)setVideoContentAllowed:(BOOL)a3 forReason:(id)a4;
- (void)setVideoContentAllowedForAllReasons;
- (void)setVideoOverlayPlayState:(int64_t)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3;
- (void)signalReviewScreenSelectionChanged;
- (void)unregisterChangeObserver:(id)a3;
- (void)videoScrubberInteractionDidEnd:(id)a3;
- (void)videoScrubberInteractionWillStart:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUBrowsingViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_videoScrubberInteractionIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetViewModelHostingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_audioSessionUpdateQueue, 0);
  objc_storeStrong((id *)&self->__videoDisallowedReasons, 0);
  objc_storeStrong((id *)&self->__animatingTransitionIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_reviewScreenBarsModel, 0);
  objc_storeStrong((id *)&self->_navigationBarTitle, 0);
  objc_storeStrong((id *)&self->_leadingAssetReference, 0);
  objc_storeStrong((id *)&self->_trailingAssetReference, 0);
  objc_storeStrong((id *)&self->_lastChromeVisibilityChangeDate, 0);
  objc_storeStrong(&self->_lastChromeVisibilityChangeContext, 0);
  objc_storeStrong((id *)&self->_transitionDriverIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_assetBeforeLastViewedAssetReference, 0);
  objc_storeStrong((id *)&self->_lastViewedAssetReference, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModelByAssetUUID, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModelByAsset, 0);
  objc_storeStrong((id *)&self->_invalidAssetViewModels, 0);
  objc_storeStrong((id *)&self->_viewModelByAssetReference, 0);
  objc_storeStrong((id *)&self->_currentAssetReferenceChangedDate, 0);
  objc_storeStrong((id *)&self->_currentAssetReference, 0);
}

- (PUOneUpVideoPlayerController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PXAssetImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (void)setActionManager:(id)a3
{
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setCreatingImageAnalysisInteraction:(BOOL)a3
{
  self->_creatingImageAnalysisInteraction = a3;
}

- (BOOL)creatingImageAnalysisInteraction
{
  return self->_creatingImageAnalysisInteraction;
}

- (void)setNeedsUpdateImageAnalysisInteraction:(BOOL)a3
{
  self->_needsUpdateImageAnalysisInteraction = a3;
}

- (BOOL)needsUpdateImageAnalysisInteraction
{
  return self->_needsUpdateImageAnalysisInteraction;
}

- (NSMutableSet)videoScrubberInteractionIdentifiers
{
  return self->_videoScrubberInteractionIdentifiers;
}

- (PUAssetViewModel)assetViewModelHostingVideoPlayer
{
  return self->_assetViewModelHostingVideoPlayer;
}

- (void)setNeedsUpdateVideoPlayerController:(BOOL)a3
{
  self->_needsUpdateVideoPlayerController = a3;
}

- (BOOL)needsUpdateVideoPlayerController
{
  return self->_needsUpdateVideoPlayerController;
}

- (OS_dispatch_queue)audioSessionUpdateQueue
{
  return self->_audioSessionUpdateQueue;
}

- (void)_setVideoDisallowedReasons:(id)a3
{
}

- (NSMutableSet)_videoDisallowedReasons
{
  return self->__videoDisallowedReasons;
}

- (void)_setAnimatingTransitionIdentifiers:(id)a3
{
}

- (NSMutableSet)_animatingTransitionIdentifiers
{
  return self->__animatingTransitionIdentifiers;
}

- (void)_setScrubbingSessionDistance:(int64_t)a3
{
  self->__scrubbingSessionDistance = a3;
}

- (int64_t)_scrubbingSessionDistance
{
  return self->__scrubbingSessionDistance;
}

- (void)_setUserNavigationDistance:(int64_t)a3
{
  self->__userNavigationDistance = a3;
}

- (int64_t)_userNavigationDistance
{
  return self->__userNavigationDistance;
}

- (PUImageAnalysisInteraction)imageAnalysisInteraction
{
  return self->_imageAnalysisInteraction;
}

- (BOOL)isInteractingWithVideoScrubber
{
  return self->_isInteractingWithVideoScrubber;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (BOOL)isFillScreenModeEnabled
{
  return self->_isFillScreenModeEnabled;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (BOOL)livePhotoShouldPlay
{
  return self->_livePhotoShouldPlay;
}

- (BOOL)isInSelectionMode
{
  return self->_isInSelectionMode;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (PUReviewScreenBarsModel)reviewScreenBarsModel
{
  return self->_reviewScreenBarsModel;
}

- (NSString)navigationBarTitle
{
  return self->_navigationBarTitle;
}

- (void)_setLeadingAssetReference:(id)a3
{
}

- (PUAssetReference)leadingAssetReference
{
  return self->_leadingAssetReference;
}

- (void)_setTrailingAssetReference:(id)a3
{
}

- (PUAssetReference)trailingAssetReference
{
  return self->_trailingAssetReference;
}

- (BOOL)isAnimatingPresentationSize
{
  return self->_isAnimatingPresentationSize;
}

- (CGSize)secondScreenSize
{
  double width = self->_secondScreenSize.width;
  double height = self->_secondScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (BOOL)isPresentingOverOneUp
{
  return self->_presentingOverOneUp;
}

- (NSDate)lastChromeVisibilityChangeDate
{
  return self->_lastChromeVisibilityChangeDate;
}

- (void)_setLastChromeVisibilityChangeContext:(id)a3
{
}

- (id)lastChromeVisibilityChangeContext
{
  return self->_lastChromeVisibilityChangeContext;
}

- (void)_setLastChromeVisibilityChangeReason:(int64_t)a3
{
  self->_lastChromeVisibilityChangeReason = a3;
}

- (int64_t)lastChromeVisibilityChangeReason
{
  return self->_lastChromeVisibilityChangeReason;
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisible
{
  return self->_wantsContentUnavailableUnlockButtonVisible;
}

- (int64_t)systemAuthenticationType
{
  return self->_systemAuthenticationType;
}

- (int64_t)contentPrivacyState
{
  return self->_contentPrivacyState;
}

- (BOOL)accessoryViewsDefaultVisibility
{
  return self->_accessoryViewsDefaultVisibility;
}

- (BOOL)isAttemptingToPlayVideoOverlay
{
  return self->_isAttemptingToPlayVideoOverlay;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (int64_t)videoOverlayPlayState
{
  return self->_videoOverlayPlayState;
}

- (BOOL)isAnimatingAnyTransition
{
  return self->_isAnimatingAnyTransition;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (int64_t)browsingSpeedRegime
{
  return self->_browsingSpeedRegime;
}

- (BOOL)assetChangesShouldAnimate
{
  return self->_assetChangesShouldAnimate;
}

- (NSString)transitionDriverIdentifier
{
  return self->_transitionDriverIdentifier;
}

- (double)currentAssetTransitionProgress
{
  return self->_currentAssetTransitionProgress;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUAssetReference)assetBeforeLastViewedAssetReference
{
  return self->_assetBeforeLastViewedAssetReference;
}

- (PUAssetReference)lastViewedAssetReference
{
  return self->_lastViewedAssetReference;
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (id)debugDetailedDescription
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  unint64_t v4 = [(PUCachedMapTable *)self->_viewModelByAssetReference accurateCount];
  objc_msgSend(v3, "appendFormat:", @"Asset View Models: %lu\n", v4);
  objc_msgSend(v3, "appendFormat:", @"Asset Shared View Models: %lu\n", -[PUCachedMapTable accurateCount](self->_assetSharedViewModelByAsset, "accurateCount"));
  if ([(PUBrowsingViewModel *)self isScrubbing]) {
    [v3 appendString:@"Scrubbing"];
  }
  if ([(PUBrowsingViewModel *)self isScrolling]) {
    [v3 appendString:@"Scrolling"];
  }
  if ([(PUBrowsingViewModel *)self isAnimatingAnyTransition])
  {
    v5 = [(PUBrowsingViewModel *)self _animatingTransitionIdentifiers];
    v6 = [v5 allObjects];
    v7 = [v6 componentsJoinedByString:@", "];
    [v3 appendFormat:@"Animating Transitions: %@", v7];
  }
  [v3 appendString:@"\nAsset View Models:\n"];
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v4];
  v28 = self;
  viewModelByAssetReference = self->_viewModelByAssetReference;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke;
  v33[3] = &unk_1E5F24180;
  id v10 = v8;
  id v34 = v10;
  [(PUCachedMapTable *)viewModelByAssetReference enumerateKeysAndObjectsUsingBlock:v33];
  v11 = [v10 allKeys];
  v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_17238];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = [v18 description];
        v20 = [v10 objectForKeyedSubscript:v18];
        v21 = objc_msgSend(v20, "pu_stringByIndentingNewLines");
        [v3 appendFormat:@"%@:\n\t%@\n", v19, v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v15);
  }

  v22 = NSString;
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  v25 = objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v26 = [v22 stringWithFormat:@"<%@ %p> {\n\t%@}", v24, v28, v25];

  return v26;
}

void __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 debugDetailedDescription];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 indexPath];
  id v6 = [v4 indexPath];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUBrowsingViewModelPrivacyControllerObservationContext == a5)
  {
    if (v6)
    {
      [(PUBrowsingViewModel *)self _updateContentPrivacyState];
      if ((v6 & 4) == 0)
      {
LABEL_6:
        if ((v6 & 8) == 0) {
          goto LABEL_8;
        }
LABEL_7:
        [(PUBrowsingViewModel *)self _updateWantsContentUnavailableUnlockButtonVisible];
        goto LABEL_8;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_6;
    }
    [(PUBrowsingViewModel *)self _updateSystemAuthenticationType];
    [(PUBrowsingViewModel *)self _updateWantsContentUnavailableUnlockButtonVisible];
    if ((v6 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((void *)VideoMuteControllerContext_17263 != a5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUBrowsingViewModel.m" lineNumber:1511 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PUBrowsingViewModel_observable_didChange_context___block_invoke;
  v11[3] = &unk_1E5F2ED10;
  v11[4] = self;
  [(PUViewModel *)self performChanges:v11];
LABEL_8:
}

uint64_t __52__PUBrowsingViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlaybackAudioSession];
}

- (void)oneUpVideoPlayerControllerPlayerDidChange:(id)a3
{
  id v5 = a3;
  id v6 = [(PUBrowsingViewModel *)self videoPlayerController];

  if (v6 != v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 1486, @"Invalid parameter not satisfying: %@", @"controller == self.videoPlayerController" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PUBrowsingViewModel_oneUpVideoPlayerControllerPlayerDidChange___block_invoke;
  v9[3] = &unk_1E5F2ECC8;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [(PUViewModel *)self performChanges:v9];
}

void __65__PUBrowsingViewModel_oneUpVideoPlayerControllerPlayerDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) player];
  [*(id *)(a1 + 32) setVideoPlayer:v2];
}

- (void)assetImportStatusManager:(id)a3 didChangeStatusForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUBrowsingViewModel *)self assetsDataSource];
  if (v5)
  {
    [v5 indexPath];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  id v7 = PXIndexPathFromSimpleIndexPath();
  v8 = [v6 assetReferenceAtIndexPath:v7];

  id v9 = [(PUBrowsingViewModel *)self assetViewModelForAssetReference:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PUBrowsingViewModel_assetImportStatusManager_didChangeStatusForAssetReference___block_invoke;
  v12[3] = &unk_1E5F2E908;
  id v13 = v9;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  [v11 performChanges:v12];
}

uint64_t __81__PUBrowsingViewModel_assetImportStatusManager_didChangeStatusForAssetReference___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) _importStateForAssetReference:*(void *)(a1 + 48)];
  v3 = *(void **)(a1 + 32);
  return [v3 setImportState:v2];
}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v7 = a4;
  v8 = [a3 asset];
  id v9 = [v8 uuid];

  if (![v9 length])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 1460, @"Invalid parameter not satisfying: %@", @"uuid.length > 0" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PUBrowsingViewModel__handleAssetSharedViewModel_didChange___block_invoke;
  v13[3] = &unk_1E5F2E908;
  v13[4] = self;
  id v14 = v9;
  id v15 = v7;
  id v10 = v7;
  id v11 = v9;
  [(PUViewModel *)self performChanges:v13];
}

void __61__PUBrowsingViewModel__handleAssetSharedViewModel_didChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentChange];
  id v4 = [v2 _mutableSharedViewModelChangesByAssetUUID];

  v3 = [v4 objectForKey:*(void *)(a1 + 40)];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [v4 setObject:v3 forKey:*(void *)(a1 + 40)];
  }
  [v3 addObject:*(void *)(a1 + 48)];
}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 assetReference];
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUBrowsingViewModel.m" lineNumber:1437 description:@"Should always be able to lookup the asset reference of a view model"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PUBrowsingViewModel__handleAssetViewModel_didChange___block_invoke;
  v14[3] = &unk_1E5F2D098;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  [(PUViewModel *)self performChanges:v14];
}

void __55__PUBrowsingViewModel__handleAssetViewModel_didChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentChange];
  id v10 = [v2 _mutableViewModelChangesByAssetReference];

  v3 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [v10 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [v3 addObject:*(void *)(a1 + 48)];
  id v4 = *(id *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) currentAssetReference];
  if (v4 == v5)
  {
  }
  else
  {
    int v6 = [v4 isEqual:v5];

    if (!v6) {
      goto LABEL_12;
    }
  }
  char v7 = [*(id *)(a1 + 32) isPresentingOverOneUp];

  if (v7) {
    goto LABEL_13;
  }
  id v5 = [*(id *)(a1 + 56) videoPlayer];
  id v8 = [*(id *)(a1 + 48) videoPlayerChange];
  if ([v5 isPlaybackDesired]
    && [v8 audioSessionVolumeIncreaseDidOccur])
  {
    id v9 = [MEMORY[0x1E4F908A0] sharedController];
    [v9 userDidUnmute];
  }
LABEL_12:

LABEL_13:
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 1425, @"Invalid parameter not satisfying: %@", @"[change isKindOfClass:[PUAssetViewModelChange class]]" object file lineNumber description];
    }
    [(PUBrowsingViewModel *)self _handleAssetViewModel:v10 didChange:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 1429, @"Invalid parameter not satisfying: %@", @"[change isKindOfClass:[PUAssetSharedViewModelChange class]]" object file lineNumber description];
      }
      [(PUBrowsingViewModel *)self _handleAssetSharedViewModel:v10 didChange:v7];
    }
  }
}

- (int64_t)_importStateForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUBrowsingViewModel *)self importStatusManager];
  int v6 = (void *)v5;
  int64_t v7 = 0;
  if (v4 && v5)
  {
    id v8 = [v4 asset];
    uint64_t v9 = [v6 importStateForAsset:v8];

    if ((unint64_t)(v9 - 1) >= 3) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = v9;
    }
  }

  return v7;
}

- (id)_filteredAllowedBadges:(id)a3 forAssetReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUBrowsingViewModel *)self actionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PUBrowsingViewModel__filteredAllowedBadges_forAssetReference___block_invoke;
  v13[3] = &unk_1E5F24220;
  id v14 = v6;
  id v15 = v8;
  id v9 = v8;
  id v10 = v6;
  id v11 = [v7 badgeInfoPromiseWithAdjustments:v13];

  return v11;
}

PXAssetBadgeInfo *__64__PUBrowsingViewModel__filteredAllowedBadges_forAssetReference___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return +[PUBrowsingViewModel filteredBadgeInfoWithInputInfo:v6 assetReference:v2 actionManager:v3];
}

- (id)_badgeInfoPromiseForAssetReference:(id)a3
{
  id v5 = a3;
  id v6 = [(PUBrowsingViewModel *)self assetsDataSource];
  id v7 = [v5 dataSourceIdentifier];
  id v8 = [v6 identifier];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 1351, @"Invalid parameter not satisfying: %@", @"[[assetReference dataSourceIdentifier] isEqual:[assetsDataSource identifier]]" object file lineNumber description];
  }
  id v10 = [v5 indexPath];
  id v11 = [v6 badgeInfoPromiseForAssetAtIndexPath:v10];

  id v12 = [(PUBrowsingViewModel *)self _filteredAllowedBadges:v11 forAssetReference:v5];

  return v12;
}

- (double)_focusValueForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PUBrowsingViewModel *)self currentAssetReference];
  [(PUBrowsingViewModel *)self currentAssetTransitionProgress];
  double v7 = v6;
  if ([v4 isEqual:v5])
  {
    double v8 = -v7;
    goto LABEL_14;
  }
  char v9 = [(PUBrowsingViewModel *)self trailingAssetReference];
  int v10 = [v4 isEqual:v9];

  if (v10)
  {
    double v11 = 1.0;
LABEL_7:
    double v8 = v11 - v7;
    goto LABEL_14;
  }
  id v12 = [(PUBrowsingViewModel *)self leadingAssetReference];
  int v13 = [v4 isEqual:v12];

  if (v13)
  {
    double v11 = -1.0;
    goto LABEL_7;
  }
  id v14 = [v4 indexPath];
  id v15 = [v5 indexPath];
  uint64_t v16 = [v14 compare:v15];
  double v17 = 0.0;
  if (v16 == 1) {
    double v17 = 2.0;
  }
  if (v16 == -1) {
    double v8 = -2.0;
  }
  else {
    double v8 = v17;
  }

LABEL_14:
  return v8;
}

- (void)_updateNeighboringAssetReferences
{
  uint64_t v3 = [(PUBrowsingViewModel *)self assetsDataSource];
  id v4 = [(PUBrowsingViewModel *)self currentAssetReference];
  id v5 = [v4 indexPath];
  double v6 = v5;
  if (v5)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__17294;
    long long v29 = __Block_byref_object_dispose__17295;
    id v30 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke;
    v22[3] = &unk_1E5F2BB28;
    id v7 = v5;
    id v23 = v7;
    v24 = &v25;
    [v3 enumerateIndexPathsStartingAtIndexPath:v7 reverseDirection:1 usingBlock:v22];
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__17294;
    v20 = __Block_byref_object_dispose__17295;
    id v21 = 0;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke_2;
    int v13 = &unk_1E5F2BB28;
    id v14 = v7;
    id v15 = &v16;
    [v3 enumerateIndexPathsStartingAtIndexPath:v14 reverseDirection:0 usingBlock:&v10];
    if (v26[5])
    {
      double v8 = objc_msgSend(v3, "assetReferenceAtIndexPath:", v10, v11, v12, v13);
    }
    else
    {
      double v8 = 0;
    }
    if (v17[5])
    {
      char v9 = objc_msgSend(v3, "assetReferenceAtIndexPath:");
    }
    else
    {
      char v9 = 0;
    }
    -[PUBrowsingViewModel _setLeadingAssetReference:](self, "_setLeadingAssetReference:", v8, v10, v11, v12, v13);
    [(PUBrowsingViewModel *)self _setTrailingAssetReference:v9];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(PUBrowsingViewModel *)self _setLeadingAssetReference:0];
    [(PUBrowsingViewModel *)self _setTrailingAssetReference:0];
  }
}

void __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (([v6 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (([v6 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_updateWantsContentUnavailableUnlockButtonVisible
{
  uint64_t v3 = [(PUBrowsingViewModel *)self privacyController];
  char v4 = [v3 willPerformAuthenticationAutomatically] ^ 1;

  id v5 = [MEMORY[0x1E4F90078] sharedInstance];
  id v6 = self;
  char v7 = [v6 shouldAlwaysShowUnlockButtonInContentUnavailableViews];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PUBrowsingViewModel__updateWantsContentUnavailableUnlockButtonVisible__block_invoke;
  v8[3] = &unk_1E5F2BD48;
  v8[4] = self;
  char v9 = v4;
  char v10 = v7;
  [(PUViewModel *)self performChanges:v8];
}

uint64_t __72__PUBrowsingViewModel__updateWantsContentUnavailableUnlockButtonVisible__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = *(unsigned char *)(a1 + 41) != 0;
  }
  return [*(id *)(a1 + 32) setWantsContentUnavailableUnlockButtonVisible:v1];
}

- (void)_updateSystemAuthenticationType
{
  uint64_t v3 = [(PUBrowsingViewModel *)self privacyController];
  uint64_t v4 = [v3 authenticationType];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PUBrowsingViewModel__updateSystemAuthenticationType__block_invoke;
  v5[3] = &unk_1E5F2E0A8;
  v5[4] = self;
  v5[5] = v4;
  [(PUViewModel *)self performChanges:v5];
}

uint64_t __54__PUBrowsingViewModel__updateSystemAuthenticationType__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSystemAuthenticationType:*(void *)(a1 + 40)];
}

- (void)_updateContentPrivacyState
{
  uint64_t v3 = [(PUBrowsingViewModel *)self privacyController];
  char v4 = [v3 isLocked];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PUBrowsingViewModel__updateContentPrivacyState__block_invoke;
  v5[3] = &unk_1E5F2E120;
  v5[4] = self;
  char v6 = v4;
  [(PUViewModel *)self performChanges:v5];
}

uint64_t __49__PUBrowsingViewModel__updateContentPrivacyState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setContentPrivacyState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateAssetViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetReference];
  BOOL v16 = [(PUBrowsingViewModel *)self isScrubbing];
  BOOL v6 = [(PUBrowsingViewModel *)self isAnimatingAnyTransition];
  BOOL v7 = [(PUBrowsingViewModel *)self browsingSpeedRegime] > 0;
  BOOL videoContentAllowed = self->_videoContentAllowed;
  char v9 = [v4 asset];
  BOOL v10 = [v9 playbackStyle] == 5;

  LOBYTE(v9) = PXIsOLEDDevice();
  uint64_t v11 = [v5 asset];
  int v12 = [v11 mediaSubtypes];

  [(PUBrowsingViewModel *)self _focusValueForAsset:v5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke;
  v17[3] = &unk_1E5F241F8;
  id v18 = v4;
  v19 = self;
  uint64_t v21 = v13;
  BOOL v22 = v16;
  BOOL v23 = v6;
  BOOL v24 = v7;
  BOOL v25 = videoContentAllowed;
  BOOL v26 = v10;
  BOOL v27 = (v12 & 0x100000) != 0;
  char v28 = (char)v9;
  id v20 = v5;
  id v14 = v5;
  id v15 = v4;
  [v15 performChanges:v17];
}

void __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) asset];
  uint64_t v3 = [*(id *)(a1 + 40) videoPlayer];
  id v4 = [v3 asset];
  int v5 = [v2 isEqual:v4];

  if (v5)
  {
    BOOL v6 = [*(id *)(a1 + 40) videoPlayer];
    [*(id *)(a1 + 32) setVideoPlayer:v6];
  }
  else
  {
    [*(id *)(a1 + 32) setVideoPlayer:0];
  }
  BOOL v7 = [*(id *)(a1 + 32) asset];
  double v8 = [v7 uuid];
  char v9 = [*(id *)(a1 + 40) currentAssetReference];
  BOOL v10 = [v9 asset];
  uint64_t v11 = [v10 uuid];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 40) imageAnalysisInteraction];
    [*(id *)(a1 + 32) setImageAnalysisInteraction:v13];
  }
  else
  {
    [*(id *)(a1 + 32) setImageAnalysisInteraction:0];
  }
  [*(id *)(a1 + 32) setFocusValue:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setForceBadgesVisible:*(unsigned __int8 *)(a1 + 64)];
  [*(id *)(a1 + 32) setIsScrubbing:*(unsigned __int8 *)(a1 + 64)];
  id v14 = [*(id *)(a1 + 32) irisPlayer];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_2;
  v33[3] = &unk_1E5F244A0;
  id v34 = v14;
  int v35 = *(_DWORD *)(a1 + 64);
  id v15 = v14;
  [v15 performChanges:v33];
  BOOL v16 = [*(id *)(a1 + 32) videoPlayer];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_3;
  v26[3] = &unk_1E5F241D0;
  char v29 = *(unsigned char *)(a1 + 68);
  char v30 = *(unsigned char *)(a1 + 66);
  char v31 = *(unsigned char *)(a1 + 64);
  __int16 v32 = *(_WORD *)(a1 + 69);
  uint64_t v17 = *(void *)(a1 + 40);
  id v27 = v16;
  uint64_t v28 = v17;
  id v18 = v16;
  [v18 performChanges:v26];
  v19 = [*(id *)(a1 + 32) animatedImagePlayer];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_4;
  v22[3] = &unk_1E5F2BD48;
  id v23 = v19;
  char v24 = *(unsigned char *)(a1 + 64);
  char v25 = *(unsigned char *)(a1 + 66);
  id v20 = v19;
  [v20 performChanges:v22];
  objc_msgSend(*(id *)(a1 + 32), "setImportState:", objc_msgSend(*(id *)(a1 + 40), "_importStateForAssetReference:", *(void *)(a1 + 48)));
  uint64_t v21 = [*(id *)(a1 + 40) searchQueryMatchInfo];
  [*(id *)(a1 + 32) setSearchQueryMatchInfo:v21];
}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setLivePhotoPlaybackDisabled:*(unsigned __int8 *)(a1 + 40) forReason:@"Scrubbing"];
  [*(id *)(a1 + 32) setLivePhotoLoadingDisabled:*(unsigned __int8 *)(a1 + 40) forReason:@"Scrubbing"];
  [*(id *)(a1 + 32) setLivePhotoLoadingDisabled:*(unsigned __int8 *)(a1 + 41) forReason:@"TransitionAnimation"];
  [*(id *)(a1 + 32) setLivePhotoLoadingDisabled:*(unsigned __int8 *)(a1 + 42) forReason:@"BrowsingSpeed"];
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = *(unsigned char *)(a1 + 43) == 0;
  return [v2 setLivePhotoLoadingDisabled:v3 forReason:@"VideoContentDisallowed"];
}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    BOOL v2 = !*(unsigned char *)(a1 + 49) && !*(unsigned char *)(a1 + 50) && *(unsigned char *)(a1 + 51) && *(unsigned char *)(a1 + 52) != 0;
    [*(id *)(a1 + 32) setShouldPreloadVideoContent:v2];
  }
  if ([*(id *)(a1 + 40) isInteractingWithVideoScrubber]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 40) isScrubbing];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 setIsUserScrubbing:v3];
}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatedImageLoadingDisabled:*(unsigned __int8 *)(a1 + 40) forReason:@"Scrubbing"];
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
  return [v2 setAnimatedImageLoadingDisabled:v3 forReason:@"BrowsingSpeed"];
}

- (void)_updateAssetViewModelsIfNeeded
{
  if (self->_allAssetViewModelsAreInvalid) {
    goto LABEL_2;
  }
  if ([(NSMutableSet *)self->_invalidAssetViewModels count])
  {
    if (!self->_allAssetViewModelsAreInvalid)
    {
      invalidAssetViewModels = self->_invalidAssetViewModels;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke_2;
      v5[3] = &unk_1E5F241A8;
      v5[4] = self;
      [(NSMutableSet *)invalidAssetViewModels enumerateObjectsUsingBlock:v5];
      goto LABEL_3;
    }
LABEL_2:
    uint64_t v3 = (void *)[(PUCachedMapTable *)self->_viewModelByAssetReference copy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _OWORD v6[2] = __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke;
    v6[3] = &unk_1E5F24180;
    v6[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];

LABEL_3:
    [(NSMutableSet *)self->_invalidAssetViewModels removeAllObjects];
    self->_allAssetViewModelsAreInvalid = 0;
  }
}

uint64_t __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetViewModel:");
}

uint64_t __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateAssetViewModel:a2];
}

- (void)_invalidateAssetViewModel:(id)a3
{
}

- (void)_invalidateCurrentAndNeighboringAssetViewModels
{
  id v8 = [(PUBrowsingViewModel *)self currentAssetReference];
  uint64_t v3 = [(PUBrowsingViewModel *)self leadingAssetReference];
  id v4 = [(PUBrowsingViewModel *)self trailingAssetReference];
  int v5 = [(PUCachedMapTable *)self->_viewModelByAssetReference objectForKey:v8];
  BOOL v6 = [(PUCachedMapTable *)self->_viewModelByAssetReference objectForKey:v3];
  BOOL v7 = [(PUCachedMapTable *)self->_viewModelByAssetReference objectForKey:v4];
  if (v5) {
    [(PUBrowsingViewModel *)self _invalidateAssetViewModel:v5];
  }
  if (v6) {
    [(PUBrowsingViewModel *)self _invalidateAssetViewModel:v6];
  }
  if (v7) {
    [(PUBrowsingViewModel *)self _invalidateAssetViewModel:v7];
  }
}

- (void)_invalidateAllAssetViewModels
{
  self->_allAssetViewModelsAreInvalid = 1;
}

- (void)_updateImageAnalysisInteractionIfNeeded
{
  if ([(PUBrowsingViewModel *)self needsUpdateImageAnalysisInteraction])
  {
    [(PUBrowsingViewModel *)self setNeedsUpdateImageAnalysisInteraction:0];
    uint64_t v3 = [(PUBrowsingViewModel *)self imageAnalysisInteraction];
    char v4 = [v3 isDrivingLivePhotoPlayback];

    if ((v4 & 1) == 0)
    {
      int v5 = [(PUBrowsingViewModel *)self imageAnalysisInteraction];
      if (v5)
      {
      }
      else if (![(PUBrowsingViewModel *)self creatingImageAnalysisInteraction])
      {
        [(PUBrowsingViewModel *)self setCreatingImageAnalysisInteraction:1];
        objc_initWeak(&location, self);
        objc_copyWeak(&v6, &location);
        px_dispatch_on_main_queue_when_idle_after_delay();
        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke(uint64_t a1)
{
  BOOL v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke_2;
  v4[3] = &unk_1E5F2E530;
  objc_copyWeak(&v5, v1);
  [WeakRetained performChanges:v4];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setCreatingImageAnalysisInteraction:0];

  objc_destroyWeak(&v5);
}

void __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke_2(uint64_t a1)
{
  id v3 = objc_alloc_init(PUImageAnalysisInteraction);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setImageAnalysisInteraction:v3];
}

- (void)_invalidateImageAnalysisInteraction
{
}

- (void)_updateVideoPlayerControllerIfNeeded
{
  if ([(PUBrowsingViewModel *)self needsUpdateVideoPlayerController])
  {
    [(PUBrowsingViewModel *)self setNeedsUpdateVideoPlayerController:0];
    id v3 = [(PUBrowsingViewModel *)self videoPlayerController];
    [v3 updateWithBrowsingViewModel:self];
  }
}

- (void)_invalidateVideoPlayerController
{
}

- (void)_handleAsyncBrowsingSpeedRegimeInvalidation
{
  self->_isBrowsingSpeedRegimeInvalidationScheduled = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__PUBrowsingViewModel__handleAsyncBrowsingSpeedRegimeInvalidation__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

uint64_t __66__PUBrowsingViewModel__handleAsyncBrowsingSpeedRegimeInvalidation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBrowsingSpeedRegime];
}

- (void)_invalidateBrowsingSpeedRegimeAfterMaximumDelay:(double)a3
{
  if (!self->_isBrowsingSpeedRegimeInvalidationScheduled)
  {
    self->_isBrowsingSpeedRegimeInvalidationScheduled = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__PUBrowsingViewModel__invalidateBrowsingSpeedRegimeAfterMaximumDelay___block_invoke;
    v5[3] = &unk_1E5F2E530;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __71__PUBrowsingViewModel__invalidateBrowsingSpeedRegimeAfterMaximumDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAsyncBrowsingSpeedRegimeInvalidation];
}

- (void)_updateScrubSpeedRegimeIfNeeded
{
  if (self->_browsingSpeedRegimeIsValid) {
    return;
  }
  self->_browsingSpeedRegimeIsValid = 1;
  id v25 = +[PUOneUpSettings sharedInstance];
  int64_t v3 = [(PUBrowsingViewModel *)self browsingSpeedRegime];
  dispatch_time_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_currentAssetReferenceChangedDate];
  double v6 = v5;

  if (![(PUBrowsingViewModel *)self isScrubbing])
  {
    [v25 visibilityDurationForExitingQuickPagingRegime];
    double v8 = v16;
    if (v3 == 1)
    {
      if (v6 >= v16 || self->_lastAssetWasCurrentForDuration >= v16) {
        goto LABEL_38;
      }
    }
    else
    {
      if (v3) {
        goto LABEL_38;
      }
      [v25 visibilityDurationForEnteringQuickPagingRegime];
      double v18 = v17;
      uint64_t v19 = [(PUBrowsingViewModel *)self _scrubbingSessionDistance];
      uint64_t v20 = v19 >= 0 ? v19 : -v19;
      uint64_t v21 = [v25 minNavigationDistanceForQuickPagingRegime];
      BOOL v22 = self->_lastAssetWasCurrentForDuration < v18 && v6 < v18;
      if (!v22 || v20 <= v21) {
        goto LABEL_38;
      }
    }
    uint64_t v24 = 1;
    goto LABEL_37;
  }
  [v25 visibilityDurationForExitingFastRegime];
  double v8 = v7;
  if (v3 != 2)
  {
    if (!v3)
    {
      [v25 visibilityDurationForEnteringFastRegime];
      double v10 = v9;
      uint64_t v11 = [(PUBrowsingViewModel *)self _scrubbingSessionDistance];
      uint64_t v12 = v11 >= 0 ? v11 : -v11;
      uint64_t v13 = [v25 minNavigationDistanceForFastRegime];
      BOOL v14 = self->_lastAssetWasCurrentForDuration < v10 && v6 < v10;
      if (v14 && v12 > v13) {
        goto LABEL_33;
      }
    }
LABEL_38:
    uint64_t v24 = 0;
    goto LABEL_39;
  }
  if (v6 >= v7 || self->_lastAssetWasCurrentForDuration >= v7) {
    goto LABEL_38;
  }
LABEL_33:
  uint64_t v24 = 2;
LABEL_37:
  [(PUBrowsingViewModel *)self _invalidateBrowsingSpeedRegimeAfterMaximumDelay:v8];
LABEL_39:
  [(PUBrowsingViewModel *)self _setBrowsingSpeedRegime:v24];
}

- (void)_invalidateBrowsingSpeedRegime
{
  self->_browsingSpeedRegimeIsValid = 0;
}

- (void)_updatePlaybackAudioSessionIfNeeded
{
  if (self->_needsUpdatePlaybackAudioSession)
  {
    self->_needsUpdatePlaybackAudioSession = 0;
    int64_t v3 = [MEMORY[0x1E4F908A0] sharedController];
    int v4 = [v3 isMuted];

    double v5 = (id *)MEMORY[0x1E4F14F68];
    if (!v4) {
      double v5 = (id *)MEMORY[0x1E4F14F98];
    }
    id v6 = *v5;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      double v7 = [(PUBrowsingViewModel *)self audioSessionUpdateQueue];
      id v8 = v6;
      PXDispatchAsyncWithSignpost();
    }
  }
}

void __58__PUBrowsingViewModel__updatePlaybackAudioSessionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F8EBC8] sharedVideoPlaybackInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F15050];
  id v8 = 0;
  char v5 = [v2 setCategory:v3 mode:v4 routeSharingPolicy:0 options:0 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    double v7 = PLOneUpGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_FAULT, "Failed to set 1-Up video playback audio session category. %@", buf, 0xCu);
    }
  }
}

- (void)_invalidatePlaybackAudioSession
{
  self->_needsUpdatePlaybackAudioSession = 1;
}

- (void)_updateIfNeeded
{
  if ([(PUBrowsingViewModel *)self _needsUpdate])
  {
    [(PUBrowsingViewModel *)self _updateScrubSpeedRegimeIfNeeded];
    [(PUBrowsingViewModel *)self _updateVideoPlayerControllerIfNeeded];
    [(PUBrowsingViewModel *)self _updateImageAnalysisInteractionIfNeeded];
    [(PUBrowsingViewModel *)self _updateAssetViewModelsIfNeeded];
    [(PUBrowsingViewModel *)self _updatePlaybackAudioSessionIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  if ([(NSMutableSet *)self->_invalidAssetViewModels count]
    || self->_allAssetViewModelsAreInvalid
    || !self->_browsingSpeedRegimeIsValid
    || self->_needsUpdatePlaybackAudioSession
    || [(PUBrowsingViewModel *)self needsUpdateVideoPlayerController])
  {
    return 1;
  }
  return [(PUBrowsingViewModel *)self needsUpdateImageAnalysisInteraction];
}

- (void)_updateIsInteractingWithVideoScrubber
{
  id v3 = [(PUBrowsingViewModel *)self videoScrubberInteractionIdentifiers];
  -[PUBrowsingViewModel setIsInteractingWithVideoScrubber:](self, "setIsInteractingWithVideoScrubber:", [v3 count] != 0);
}

- (void)videoScrubberInteractionDidEnd:(id)a3
{
  id v4 = a3;
  char v5 = [(PUBrowsingViewModel *)self videoScrubberInteractionIdentifiers];
  [v5 removeObject:v4];

  [(PUBrowsingViewModel *)self _updateIsInteractingWithVideoScrubber];
}

- (void)videoScrubberInteractionWillStart:(id)a3
{
  id v4 = a3;
  char v5 = [(PUBrowsingViewModel *)self videoScrubberInteractionIdentifiers];
  [v5 addObject:v4];

  [(PUBrowsingViewModel *)self _updateIsInteractingWithVideoScrubber];
}

- (void)setIsInteractingWithVideoScrubber:(BOOL)a3
{
  if (self->_isInteractingWithVideoScrubber != a3)
  {
    self->_isInteractingWithVideoScrubber = a3;
    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
    id v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 setIsInteractingWithVideoScrubberDidChange:1];
  }
}

- (void)setImageAnalysisInteraction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = (PUImageAnalysisInteraction *)a3;
  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (imageAnalysisInteraction != v5)
  {
    [(PUImageAnalysisInteraction *)imageAnalysisInteraction setBrowsingViewModel:0];
    objc_storeStrong((id *)&self->_imageAnalysisInteraction, a3);
    [(PUImageAnalysisInteraction *)self->_imageAnalysisInteraction setBrowsingViewModel:self];
    double v7 = [(PUBrowsingViewModel *)self currentChange];
    [v7 setImageAnalysisInteractionDidChange:1];

    id v8 = PLVisualIntelligenceGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "1-Up image Analysis Interaction has become: %@", (uint8_t *)&v9, 0xCu);
    }

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
  }
}

- (void)setVideoPlayer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = (PUBrowsingVideoPlayer *)a3;
  if (self->_videoPlayer != v5)
  {
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    id v6 = [(PUBrowsingViewModel *)self currentChange];
    [v6 setVideoPlayerDidChange:1];

    double v7 = PLVideoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = v5;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "1-Up video player has become: %@", (uint8_t *)&v8, 0xCu);
    }

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
  }
}

- (void)setMediaProvider:(id)a3
{
  char v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    char v5 = v6;
  }
}

- (void)setIsFillScreenModeEnabled:(BOOL)a3
{
  if (self->_isFillScreenModeEnabled != a3)
  {
    self->_isFillScreenModeEnabled = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 setIsFillScreenModeEnabledDidChange:1];
  }
}

- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3
{
  if (self->_wantsContentUnavailableUnlockButtonVisible != a3)
  {
    self->_wantsContentUnavailableUnlockButtonVisible = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 _setWantsContentUnavailableUnlockButtonVisibleDidChange:1];
  }
}

- (void)setSystemAuthenticationType:(int64_t)a3
{
  if (self->_systemAuthenticationType != a3)
  {
    self->_systemAuthenticationType = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 _setSystemAuthenticationTypeDidChange:1];
  }
}

- (void)setContentPrivacyState:(int64_t)a3
{
  if (self->_contentPrivacyState != a3)
  {
    self->_contentPrivacyState = a3;
    id v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setContentPrivacyStateDidChange:1];

    char v5 = [(PUBrowsingViewModel *)self assetViewModelForCurrentAssetReference];
    if ([v5 isAccessoryViewVisible])
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _OWORD v6[2] = __46__PUBrowsingViewModel_setContentPrivacyState___block_invoke;
      v6[3] = &unk_1E5F2ED10;
      id v7 = v5;
      [v7 performChanges:v6];
    }
  }
}

uint64_t __46__PUBrowsingViewModel_setContentPrivacyState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryViewVisible:0];
}

- (void)signalReviewScreenSelectionChanged
{
  id v2 = [(PUBrowsingViewModel *)self currentChange];
  [v2 _setReviewScreenSelectionDidChange:1];
}

- (void)setReviewScreenBarsModel:(id)a3
{
  char v5 = (PUReviewScreenBarsModel *)a3;
  if (self->_reviewScreenBarsModel != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_reviewScreenBarsModel, a3);
    id v6 = [(PUBrowsingViewModel *)self currentChange];
    [v6 _setReviewScreenBarsModelDidChange:1];

    char v5 = v7;
  }
}

- (void)setResizeTaskDescriptorViewModel:(id)a3
{
  char v5 = (PUPhotoPickerResizeTaskDescriptorViewModel *)a3;
  if (self->_resizeTaskDescriptorViewModel != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, a3);
    id v6 = [(PUBrowsingViewModel *)self currentChange];
    [v6 _setResizeTaskDescriptorViewModelDidChange:1];

    char v5 = v7;
  }
}

- (void)setNavigationBarTitle:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_navigationBarTitle] & 1) == 0)
  {
    id v4 = (NSString *)[v7 copy];
    navigationBarTitle = self->_navigationBarTitle;
    self->_navigationBarTitle = v4;

    id v6 = [(PUBrowsingViewModel *)self currentChange];
    [v6 _setNavigationBarTitleDidChange:1];
  }
}

- (id)_assetSharedViewModelForAsset:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 788, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  int v8 = [(PUCachedMapTable *)self->_assetSharedViewModelByAsset objectForKey:v7];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    uint64_t v10 = [[PUAssetSharedViewModel alloc] initWithAsset:v7];
    uint64_t v11 = (void *)[(PUCachedMapTable *)self->_viewModelByAssetReference copy];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__PUBrowsingViewModel__assetSharedViewModelForAsset_createIfNeeded___block_invoke;
    v17[3] = &unk_1E5F24118;
    id v12 = v7;
    id v18 = v12;
    int v8 = v10;
    uint64_t v19 = v8;
    [v11 enumerateKeysAndObjectsUsingBlock:v17];

    [(PUCachedMapTable *)self->_assetSharedViewModelByAsset setObject:v8 forKey:v12];
    assetSharedViewModelByAssetUUID = self->_assetSharedViewModelByAssetUUID;
    BOOL v14 = [v12 uuid];
    [(PUCachedMapTable *)assetSharedViewModelByAssetUUID setObject:v8 forKey:v14];

    [(PUAssetSharedViewModel *)v8 registerChangeObserver:self];
  }

  return v8;
}

void __68__PUBrowsingViewModel__assetSharedViewModelForAsset_createIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  char v5 = [a2 asset];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6) {
    [v7 setAssetSharedViewModel:*(void *)(a1 + 40)];
  }
}

- (id)assetSharedViewModelForAssetUUID:(id)a3
{
  return [(PUCachedMapTable *)self->_assetSharedViewModelByAssetUUID objectForKey:a3];
}

- (id)assetSharedViewModelForAsset:(id)a3
{
  return [(PUBrowsingViewModel *)self _assetSharedViewModelForAsset:a3 createIfNeeded:1];
}

- (PUAssetViewModel)assetViewModelForCurrentAssetReference
{
  id v3 = [(PUBrowsingViewModel *)self currentAssetReference];
  if (v3)
  {
    BOOL v4 = [(PUBrowsingViewModel *)self assetViewModelForAssetReference:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (PUAssetViewModel *)v4;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  BOOL v4 = (PXSearchQueryMatchInfo *)a3;
  char v5 = self->_searchQueryMatchInfo;
  if (v5 == v4)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(PXSearchQueryMatchInfo *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__PUBrowsingViewModel_setSearchQueryMatchInfo___block_invoke;
      v8[3] = &unk_1E5F2ECC8;
      v8[4] = self;
      BOOL v9 = v4;
      [(PUViewModel *)self performChanges:v8];
    }
  }
}

uint64_t __47__PUBrowsingViewModel_setSearchQueryMatchInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 312), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAllAssetViewModels];
}

- (id)assetViewModelForAssetReference:(id)a3
{
  id v4 = a3;
  char v5 = [(PUBrowsingViewModel *)self assetsDataSource];
  int v6 = [v5 assetReferenceForAssetReference:v4];

  if (v6)
  {
    char v7 = [(PUCachedMapTable *)self->_viewModelByAssetReference objectForKey:v6];
    if (!v7)
    {
      int v8 = [[PUAssetViewModel alloc] initWithLowMemoryMode:[(PUBrowsingViewModel *)self lowMemoryMode]];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55__PUBrowsingViewModel_assetViewModelForAssetReference___block_invoke;
      v13[3] = &unk_1E5F2E908;
      char v7 = v8;
      BOOL v14 = v7;
      id v15 = self;
      id v9 = v6;
      id v16 = v9;
      [(PUViewModel *)v7 performChanges:v13];
      uint64_t v10 = [v9 asset];
      uint64_t v11 = [(PUBrowsingViewModel *)self _assetSharedViewModelForAsset:v10 createIfNeeded:0];

      [(PUAssetViewModel *)v7 setAssetSharedViewModel:v11];
      [(PUCachedMapTable *)self->_viewModelByAssetReference setObject:v7 forKey:v9];
      [(PUAssetViewModel *)v7 setAssetReference:v9];
      [(PUAssetViewModel *)v7 registerChangeObserver:self];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __55__PUBrowsingViewModel_assetViewModelForAssetReference___block_invoke(id *a1)
{
  id v2 = a1[4];
  id v3 = [a1[5] mediaProvider];
  [v2 setMediaProvider:v3];

  id v4 = a1[4];
  char v5 = [a1[6] asset];
  [v4 setAsset:v5];

  [a1[4] setAssetReference:a1[6]];
  id v6 = [a1[5] _badgeInfoPromiseForAssetReference:a1[6]];
  [a1[4] setBadgeInfoPromise:v6];
  objc_msgSend(a1[4], "setAccessoryViewVisible:", objc_msgSend(a1[5], "accessoryViewsDefaultVisibility"));
  objc_msgSend(a1[4], "setIsScrubbing:", objc_msgSend(a1[5], "isScrubbing"));
  [a1[5] _updateAssetViewModel:a1[4]];
}

- (id)activeAssetReferences
{
  id v2 = [(PUCachedMapTable *)self->_viewModelByAssetReference keyEnumerator];
  id v3 = [v2 allObjects];

  return v3;
}

- (BOOL)isVideoContentAllowed
{
  return self->_videoContentAllowed;
}

- (void)_setVideoContentAllowed:(BOOL)a3
{
  if (self->_videoContentAllowed != a3)
  {
    self->_BOOL videoContentAllowed = a3;
    char v5 = [(PUBrowsingViewModel *)self currentChange];
    [v5 setIsVideoContentAllowedDidChange:1];

    id v6 = (void *)[(PUCachedMapTable *)self->_viewModelByAssetReference copy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke;
    v7[3] = &__block_descriptor_33_e51_v32__0__PUAssetReference_8__PUAssetViewModel_16_B24l;
    BOOL v8 = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 irisPlayer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke_2;
  v6[3] = &unk_1E5F2E120;
  id v7 = v4;
  char v8 = *(unsigned char *)(a1 + 32);
  id v5 = v4;
  [v5 performChanges:v6];
}

uint64_t __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setLivePhotoLoadingDisabled:*(unsigned char *)(a1 + 40) == 0 forReason:@"VideoContentDisallowed"];
  if (!*(unsigned char *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 unloadLivePhoto];
  }
  return result;
}

- (void)setVideoContentAllowedForAllReasons
{
  id v3 = [(PUBrowsingViewModel *)self _videoDisallowedReasons];
  [v3 removeAllObjects];
  [(PUBrowsingViewModel *)self _setVideoContentAllowed:1];
}

- (void)setVideoContentAllowed:(BOOL)a3 forReason:(id)a4
{
  id v10 = a4;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 666, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v7 = [(PUBrowsingViewModel *)self _videoDisallowedReasons];
  char v8 = v7;
  if (a3)
  {
    [v7 removeObject:v10];
  }
  else
  {
    if ([v7 containsObject:v10]) {
      goto LABEL_10;
    }
    if (!v8)
    {
      char v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
      [(PUBrowsingViewModel *)self _setVideoDisallowedReasons:v8];
    }
    [v8 addObject:v10];
  }
  -[PUBrowsingViewModel _setVideoContentAllowed:](self, "_setVideoContentAllowed:", [v8 count] == 0);
LABEL_10:
}

- (void)setPresentingOverOneUp:(BOOL)a3
{
  if (self->_presentingOverOneUp != a3)
  {
    self->_presentingOverOneUp = a3;
    if (a3)
    {
      id v4 = [(PUBrowsingViewModel *)self videoPlayer];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _OWORD v6[2] = __46__PUBrowsingViewModel_setPresentingOverOneUp___block_invoke;
      v6[3] = &unk_1E5F2ED10;
      void v6[4] = self;
      [v4 performChanges:v6];
    }
    id v5 = [(PUBrowsingViewModel *)self currentChange];
    [v5 _setPresentingOverOneUpDidChange:1];
  }
}

void __46__PUBrowsingViewModel_setPresentingOverOneUp___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) videoPlayer];
  [v1 setDesiredPlayState:1 reason:@"Presenting Over 1-Up"];
}

- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4 context:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_isChromeVisible != v6)
  {
    id v22 = v8;
    if (a4 != 1
      || v6
      || ([(PUBrowsingViewModel *)self assetsDataSource],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isEmpty],
          v9,
          id v8 = v22,
          (v10 & 1) == 0))
    {
      self->_isChromeVisible = v6;
      uint64_t v11 = [(PUBrowsingViewModel *)self currentChange];
      [v11 _setChromeVisibilityDidChange:1];

      [(PUBrowsingViewModel *)self _setLastChromeVisibilityChangeReason:a4];
      [(PUBrowsingViewModel *)self _setLastChromeVisibilityChangeContext:v22];
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      lastChromeVisibilityChangeDate = self->_lastChromeVisibilityChangeDate;
      self->_lastChromeVisibilityChangeDate = v12;

      BOOL v14 = +[PUOneUpSettings sharedInstance];
      int v15 = [v14 persistChromeVisibility];

      if (v15)
      {
        id v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v16 setBool:v6 forKey:@"browsingChromeVisibility"];
      }
      double v17 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v18 = [v17 userInterfaceIdiom];

      if (v18 == 1 && [(PUBrowsingViewModel *)self horizontalSizeClass] == 2)
      {
        uint64_t v19 = +[PUOneUpSettings sharedInstance];
        char v20 = [v19 hideFloatingInfoPanelWhenHidingChrome];

        char v21 = v20 ^ 1;
      }
      else
      {
        char v21 = 0;
      }
      id v8 = v22;
      if (a4 != 5 && !v6 && (v21 & 1) == 0)
      {
        [(PUBrowsingViewModel *)self setAccessoryViewsDefaultVisibility:0 changeReason:3];
        [(PUBrowsingViewModel *)self _resetAccessoryViewsVisibilityToDefaultWithChangeReason:3];
        id v8 = v22;
      }
    }
  }
}

- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
}

- (void)setChromeVisible:(BOOL)a3
{
}

- (void)setIsAnimatingPresentationSize:(BOOL)a3
{
  if (self->_isAnimatingPresentationSize != a3)
  {
    self->_isAnimatingPresentationSize = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 setIsAnimatingPresentationSizeDidChange:1];
  }
}

- (void)setIsInSelectionMode:(BOOL)a3
{
  if (self->_isInSelectionMode != a3)
  {
    self->_isInSelectionMode = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 _setIsInSelectionModeDidChange:1];
  }
}

- (void)_resetAccessoryViewsVisibilityToDefaultWithChangeReason:(int64_t)a3
{
  BOOL v5 = [(PUBrowsingViewModel *)self accessoryViewsDefaultVisibility];
  BOOL v6 = (void *)[(PUCachedMapTable *)self->_viewModelByAssetReference copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke;
  v7[3] = &__block_descriptor_41_e51_v32__0__PUAssetReference_8__PUAssetViewModel_16_B24l;
  BOOL v8 = v5;
  void v7[4] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(unsigned __int8 *)(a1 + 40) != [v4 isAccessoryViewVisible])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_2;
    v13[3] = &unk_1E5F2D968;
    id v5 = v4;
    char v16 = *(unsigned char *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v14 = v5;
    uint64_t v15 = v6;
    [v5 performChanges:v13];
  }
  [v4 preferredContentOffset];
  if (v8 != *MEMORY[0x1E4F1DAD8] || v7 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [v4 focusValue];
    if (fabs(v10) >= 1.0)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_3;
      v11[3] = &unk_1E5F2ED10;
      id v12 = v4;
      [v12 performChanges:v11];
    }
  }
}

uint64_t __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryViewVisible:*(unsigned __int8 *)(a1 + 48) changeReason:*(void *)(a1 + 40)];
}

uint64_t __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3 changeReason:(int64_t)a4
{
  if (self->_accessoryViewsDefaultVisibility != a3)
  {
    self->_accessoryViewsDefaultVisibility = a3;
    [(PUBrowsingViewModel *)self _resetAccessoryViewsVisibilityToDefaultWithChangeReason:a4];
  }
}

- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3
{
}

- (void)setIsPresentedForPreview:(BOOL)a3
{
  if (self->_isPresentedForPreview != a3)
  {
    self->_isPresentedForPreview = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 setIsPresentedForPreviewDidChange:1];
  }
}

- (void)setSecondScreenSize:(CGSize)a3
{
  if (a3.width != self->_secondScreenSize.width || a3.height != self->_secondScreenSize.height)
  {
    self->_secondScreenSize = a3;
    id v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setSecondScreenSizeDidChange:1];
  }
}

- (void)_setAnimatingAnyTransition:(BOOL)a3
{
  if (self->_isAnimatingAnyTransition != a3)
  {
    self->_isAnimatingAnyTransition = a3;
    id v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setAnimatingAnyTransitionDidChange:1];

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
  }
}

- (void)setAnimating:(BOOL)a3 transitionWithIdentifier:(id)a4
{
  int v4 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 508, @"Invalid parameter not satisfying: %@", @"transitionIdentifier" object file lineNumber description];
  }
  double v7 = [(PUBrowsingViewModel *)self _animatingTransitionIdentifiers];
  if ([v7 containsObject:v10] != v4)
  {
    if (v4)
    {
      id v8 = v10;
      if (!v7)
      {
        double v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:5];
        [(PUBrowsingViewModel *)self _setAnimatingTransitionIdentifiers:v7];
        id v8 = v10;
      }
      [v7 addObject:v8];
    }
    else
    {
      [v7 removeObject:v10];
    }
    -[PUBrowsingViewModel _setAnimatingAnyTransition:](self, "_setAnimatingAnyTransition:", [v7 count] != 0);
  }
}

- (void)setLivePhotoShouldPlay:(BOOL)a3
{
  if (self->_livePhotoShouldPlay != a3)
  {
    self->_livePhotoShouldPlay = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 setLivePhotoShouldPlayDidChange:1];
  }
}

- (void)setIsScrolling:(BOOL)a3
{
  if (self->_isScrolling != a3)
  {
    self->_isScrolling = a3;
    int v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setIsScrollingDidChange:1];

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
  }
}

- (void)setIsAttemptingToPlayVideoOverlay:(BOOL)a3
{
  if (self->_isAttemptingToPlayVideoOverlay != a3)
  {
    self->_isAttemptingToPlayVideoOverlay = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 _setIsAttemptingToPlayVideoOverlayDidChange:1];
  }
}

- (void)setVideoOverlayPlayState:(int64_t)a3
{
  if (self->_videoOverlayPlayState != a3)
  {
    self->_videoOverlayPlayState = a3;
    int v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setVideoOverlayPlayStateDidChange:1];

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
    [(PUBrowsingViewModel *)self _invalidateBrowsingSpeedRegime];
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isScrubbing != a3)
  {
    if (self->_isScrubbing)
    {
      id v5 = PLOneUpGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(PUBrowsingViewModel *)self currentAssetReference];
        double v7 = [v6 asset];
        id v8 = [v7 uuid];
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Scrubbing ended on asset UUID: %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
    self->_isScrubbing = a3;
    id v9 = [(PUBrowsingViewModel *)self currentChange];
    [v9 _setIsScrubbingDidChange:1];

    [(PUBrowsingViewModel *)self _setScrubbingSessionDistance:0];
    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
    [(PUBrowsingViewModel *)self _invalidateBrowsingSpeedRegime];
  }
}

- (void)_setBrowsingSpeedRegime:(int64_t)a3
{
  if (self->_browsingSpeedRegime != a3)
  {
    self->_browsingSpeedRegime = a3;
    int v4 = [(PUBrowsingViewModel *)self currentChange];
    [v4 _setBrowsingSpeedRegimeDidChange:1];

    [(PUBrowsingViewModel *)self _invalidateAllAssetViewModels];
  }
}

- (void)_setTransitionDriverIdentifier:(id)a3
{
  if (self->_transitionDriverIdentifier != a3)
  {
    int v4 = (NSString *)[a3 copy];
    transitionDriverIdentifier = self->_transitionDriverIdentifier;
    self->_transitionDriverIdentifier = v4;

    id v6 = [(PUBrowsingViewModel *)self currentChange];
    [v6 _setTransitionDriverIdentifierDidChange:1];
  }
}

- (void)_setCurrentAssetTransitionProgress:(double)a3
{
  if (self->_currentAssetTransitionProgress != a3)
  {
    self->_currentAssetTransitionProgress = a3;
    id v3 = [(PUBrowsingViewModel *)self currentChange];
    [v3 _setCurrentAssetTransitionProgressDidChange:1];
  }
}

- (void)setCurrentAssetReference:(id)a3
{
  int v4 = (PUAssetReference *)a3;
  currentAssetReference = self->_currentAssetReference;
  if (currentAssetReference != v4)
  {
    id v9 = v4;
    BOOL v6 = [(PUAssetReference *)currentAssetReference isEqual:v4];
    int v4 = v9;
    if (!v6)
    {
      double v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [v7 UUIDString];
      [(PUBrowsingViewModel *)self setCurrentAssetReference:v9 transitionProgress:v8 transitionDriverIdentifier:0 animated:0.0];

      int v4 = v9;
    }
  }
}

- (PUAssetReference)currentAssetReference
{
  currentAssetReference = self->_currentAssetReference;
  if (!currentAssetReference)
  {
    int v4 = [(PUBrowsingViewModel *)self assetsDataSource];
    id v5 = [v4 startingAssetReference];
    BOOL v6 = self->_currentAssetReference;
    self->_currentAssetReference = v5;

    currentAssetReference = self->_currentAssetReference;
  }
  return currentAssetReference;
}

- (void)setCurrentAssetReference:(id)a3 transitionProgress:(double)a4 transitionDriverIdentifier:(id)a5 animated:(BOOL)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (PUAssetReference *)a3;
  id v13 = a5;
  if (v12)
  {
    id v14 = [(PUBrowsingViewModel *)self assetsDataSource];
    uint64_t v15 = [v14 identifier];
    char v16 = [(PUAssetReference *)v12 dataSourceIdentifier];
    char v17 = [v15 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PUBrowsingViewModel.m", 320, @"Invalid parameter not satisfying: %@", @"!currentAssetReference || [[[self assetsDataSource] identifier] isEqual:[currentAssetReference dataSourceIdentifier]]" object file lineNumber description];
    }
    uint64_t v19 = [(PUBrowsingViewModel *)self assetsDataSource];
    char v20 = [v19 assetReferenceForAssetReference:v12];

    if (!v20)
    {
      char v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PUBrowsingViewModel.m" lineNumber:321 description:@"Tried to set a current asset reference that doesn't exist in the data source"];
    }
  }
  p_currentAssetReference = &self->_currentAssetReference;
  if (self->_currentAssetReference != v12 && !-[PUAssetReference isEqual:](v12, "isEqual:"))
  {
    if (![(PUBrowsingViewModel *)self isScrubbing])
    {
      id v23 = PLOneUpGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(PUAssetReference *)v12 asset];
        id v25 = [v24 uuid];
        *(_DWORD *)buf = 138543362;
        v53 = v25;
        _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEFAULT, "Current asset changed and not scrubbing. UUID: %{public}@", buf, 0xCu);
      }
    }
    if (*p_currentAssetReference)
    {
      [(PUBrowsingViewModel *)self _invalidateCurrentAndNeighboringAssetViewModels];
      BOOL v26 = *p_currentAssetReference;
    }
    else
    {
      BOOL v26 = 0;
    }
    id v27 = v26;
    if (v12)
    {
      objc_storeStrong((id *)&self->_lastViewedAssetReference, a3);
      objc_storeStrong((id *)&self->_assetBeforeLastViewedAssetReference, v26);
    }
    objc_storeStrong((id *)&self->_currentAssetReference, a3);
    uint64_t v28 = [(PUBrowsingViewModel *)self currentChange];
    [v28 _setCurrentAssetDidChange:1];

    [(PUBrowsingViewModel *)self _updateNeighboringAssetReferences];
    char v29 = [(PUAssetReference *)v27 dataSourceIdentifier];
    char v30 = [(PUAssetReference *)v12 dataSourceIdentifier];
    int v31 = [v29 isEqualToString:v30];

    if (v31)
    {
      __int16 v32 = [(PUAssetReference *)v27 indexPath];
      v33 = [(PUAssetReference *)v12 indexPath];
      uint64_t v34 = [v32 compare:v33];

      BOOL v35 = v34 == -1;
      BOOL v36 = v34 == -1;
      BOOL v37 = v34 == 1;
      BOOL v38 = v34 == 1;
      BOOL v39 = !v37 && v35;
      if (v37) {
        uint64_t v40 = -1;
      }
      else {
        uint64_t v40 = v36;
      }
      v41 = +[PUOneUpSettings sharedInstance];
      uint64_t v42 = [v41 userNavigationMaximumDistance];

      uint64_t v43 = [(PUBrowsingViewModel *)self _userNavigationDistance] + v40;
      if (v38 && v43 == 0) {
        uint64_t v43 = -1;
      }
      if (v43 <= -v42) {
        uint64_t v43 = -v42;
      }
      if (v43 >= v42) {
        uint64_t v44 = v42;
      }
      else {
        uint64_t v44 = v43;
      }
      [(PUBrowsingViewModel *)self _setUserNavigationDistance:v44];
      uint64_t v45 = [(PUBrowsingViewModel *)self _scrubbingSessionDistance];
      BOOL v46 = v45 > 0 && v38;
      BOOL v47 = v45 < 0 && v39;
      if (v46 || v47) {
        uint64_t v48 = 0;
      }
      else {
        uint64_t v48 = v45;
      }
      [(PUBrowsingViewModel *)self _setScrubbingSessionDistance:v48 + v40];
    }
    v49 = [MEMORY[0x1E4F1C9C8] date];
    [(NSDate *)v49 timeIntervalSinceDate:self->_currentAssetReferenceChangedDate];
    self->_lastAssetWasCurrentForDuration = v50;
    currentAssetReferenceChangedDate = self->_currentAssetReferenceChangedDate;
    self->_currentAssetReferenceChangedDate = v49;

    [(PUBrowsingViewModel *)self _invalidateBrowsingSpeedRegime];
  }
  [(PUBrowsingViewModel *)self _setCurrentAssetTransitionProgress:a4];
  [(PUBrowsingViewModel *)self _setTransitionDriverIdentifier:v13];
  self->_assetChangesShouldAnimate = a6;
  [(PUBrowsingViewModel *)self _invalidateCurrentAndNeighboringAssetViewModels];
  [(PUBrowsingViewModel *)self _invalidateImageAnalysisInteraction];
  [(PUBrowsingViewModel *)self _updateIfNeeded];
}

- (void)setPrivacyController:(id)a3
{
  id v5 = (PXContentPrivacyController *)a3;
  privacyController = self->_privacyController;
  if (privacyController != v5)
  {
    double v7 = v5;
    [(PXContentPrivacyController *)privacyController unregisterChangeObserver:self context:PUBrowsingViewModelPrivacyControllerObservationContext];
    objc_storeStrong((id *)&self->_privacyController, a3);
    [(PXContentPrivacyController *)self->_privacyController registerChangeObserver:self context:PUBrowsingViewModelPrivacyControllerObservationContext];
    [(PUBrowsingViewModel *)self _updateContentPrivacyState];
    [(PUBrowsingViewModel *)self _updateSystemAuthenticationType];
    [(PUBrowsingViewModel *)self _updateWantsContentUnavailableUnlockButtonVisible];
    id v5 = v7;
  }
}

- (void)setImportStatusManager:(id)a3
{
  id v5 = (PXAssetImportStatusManager *)a3;
  importStatusManager = self->_importStatusManager;
  if (importStatusManager != v5)
  {
    double v7 = v5;
    [(PXAssetImportStatusManager *)importStatusManager removeAssetImportStatusObserver:self];
    objc_storeStrong((id *)&self->_importStatusManager, a3);
    [(PXAssetImportStatusManager *)self->_importStatusManager addAssetImportStatusObserver:self];
    id v5 = v7;
  }
}

- (void)setAssetsDataSource:(id)a3
{
  id v5 = (PUAssetsDataSource *)a3;
  assetsDataSource = self->_assetsDataSource;
  if (assetsDataSource != v5 && ![(PUTilingDataSource *)assetsDataSource isEqual:v5])
  {
    double v7 = [(PUBrowsingViewModel *)self currentAssetReference];
    uint64_t v29 = 0;
    char v30 = &v29;
    uint64_t v31 = 0x3032000000;
    __int16 v32 = __Block_byref_object_copy__17294;
    v33 = __Block_byref_object_dispose__17295;
    id v34 = 0;
    if (v7)
    {
      if ([(PUAssetsDataSource *)v5 isEmpty])
      {
LABEL_10:
        objc_storeStrong((id *)&self->_assetsDataSource, a3);
        uint64_t v15 = [(PUBrowsingViewModel *)self currentChange];
        [v15 _setAssetsDataSourceDidChange:1];

        char v16 = (void *)[(PUCachedMapTable *)self->_viewModelByAssetReference copy];
        [(PUCachedMapTable *)self->_viewModelByAssetReference removeAllObjects];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_2;
        v17[3] = &unk_1E5F24118;
        uint64_t v18 = v5;
        uint64_t v19 = self;
        [v16 enumerateKeysAndObjectsUsingBlock:v17];
        [(PUBrowsingViewModel *)self setCurrentAssetReference:v30[5]];

        _Block_object_dispose(&v29, 8);
        goto LABEL_11;
      }
      id v8 = self->_assetsDataSource;
      unint64_t v9 = [(PUBrowsingViewModel *)self _userNavigationDistance];
      uint64_t v25 = 0;
      BOOL v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v28 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke;
      aBlock[3] = &unk_1E5F240F0;
      id v23 = &v25;
      int v10 = v8;
      char v21 = v10;
      uint64_t v24 = &v29;
      id v22 = v5;
      uint64_t v11 = _Block_copy(aBlock);
      uint64_t v12 = [v7 indexPath];
      unint64_t v13 = v9 >> 63;
      [(PUTilingDataSource *)v10 enumerateIndexPathsStartingAtIndexPath:v12 reverseDirection:v13 usingBlock:v11];
      v26[3] = 0;
      if (!v30[5]) {
        [(PUTilingDataSource *)v10 enumerateIndexPathsStartingAtIndexPath:v12 reverseDirection:v13 ^ 1 usingBlock:v11];
      }

      _Block_object_dispose(&v25, 8);
    }
    else
    {
      uint64_t v14 = [(PUAssetsDataSource *)v5 startingAssetReference];
      int v10 = (PUAssetsDataSource *)v30[5];
      v30[5] = v14;
    }

    goto LABEL_10;
  }
LABEL_11:
}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v8 = [*(id *)(a1 + 32) assetReferenceAtIndexPath:a2];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "assetReferenceForAssetReference:");
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 100)
  {
    *a3 = 1;
  }
}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) assetReferenceForAssetReference:a2];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    [*(id *)(v7 + 96) setObject:v5 forKey:v6];
    [v5 setAssetReference:v6];
    id v8 = [*(id *)(a1 + 40) _badgeInfoPromiseForAssetReference:v6];
    uint64_t v9 = [*(id *)(a1 + 40) _importStateForAssetReference:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_3;
    v19[3] = &unk_1E5F26410;
    id v20 = v5;
    id v10 = v6;
    id v21 = v10;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 40);
    id v22 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = v9;
    [v20 performChanges:v19];
    unint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v10 asset];
    uint64_t v15 = [v13 _assetSharedViewModelForAsset:v14 createIfNeeded:0];

    if (v15)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_4;
      v16[3] = &unk_1E5F2ECC8;
      id v17 = v15;
      id v18 = v10;
      [v17 performChanges:v16];
    }
  }
  else
  {
    [v5 unregisterChangeObserver:v7];
  }
}

uint64_t __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) asset];
  [v2 setAsset:v3];

  [*(id *)(a1 + 32) setAssetReference:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setBadgeInfoPromise:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setImportState:*(void *)(a1 + 64)];
  uint64_t v4 = [*(id *)(a1 + 56) isScrubbing];
  id v5 = *(void **)(a1 + 32);
  return [v5 setIsScrubbing:v4];
}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) asset];
  [v1 setAsset:v2];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  [(PUViewModel *)&v3 didPerformChanges];
  [(PUBrowsingViewModel *)self _invalidateVideoPlayerController];
  [(PUBrowsingViewModel *)self _updateIfNeeded];
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (id)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUBrowsingViewModel;
  id v2 = [(PUViewModel *)&v4 currentChange];
  return v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingViewModelChange);
}

- (PUBrowsingViewModel)init
{
  return [(PUBrowsingViewModel *)self initWithLowMemoryMode:0];
}

- (PUBrowsingViewModel)initWithLowMemoryMode:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)PUBrowsingViewModel;
  objc_super v4 = [(PUViewModel *)&v28 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lowMemoryMode = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    invalidAssetViewModels = v5->_invalidAssetViewModels;
    v5->_invalidAssetViewModels = (NSMutableSet *)v6;

    id v8 = +[PUOneUpSettings sharedInstance];
    uint64_t v9 = [v8 viewModelCacheCountLimit];

    id v10 = objc_alloc_init(PUCachedMapTable);
    viewModelByAssetReference = v5->_viewModelByAssetReference;
    v5->_viewModelByAssetReference = v10;

    [(PUCachedMapTable *)v5->_viewModelByAssetReference setCacheCountLimit:v9];
    uint64_t v12 = objc_alloc_init(PUCachedMapTable);
    assetSharedViewModelByAsset = v5->_assetSharedViewModelByAsset;
    v5->_assetSharedViewModelByAsset = v12;

    [(PUCachedMapTable *)v5->_assetSharedViewModelByAsset setCacheCountLimit:v9];
    uint64_t v14 = objc_alloc_init(PUCachedMapTable);
    assetSharedViewModelByAssetUUID = v5->_assetSharedViewModelByAssetUUID;
    v5->_assetSharedViewModelByAssetUUID = v14;

    [(PUCachedMapTable *)v5->_assetSharedViewModelByAssetUUID setCacheCountLimit:v9];
    char v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    videoScrubberInteractionIdentifiers = v5->_videoScrubberInteractionIdentifiers;
    v5->_videoScrubberInteractionIdentifiers = v16;

    id v18 = +[PUOneUpSettings sharedInstance];
    if ([v18 persistChromeVisibility])
    {
      uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v5->_isChromeVisible = [v19 BOOLForKey:@"browsingChromeVisibility"];
    }
    else
    {
      v5->_isChromeVisible = 1;
    }

    uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    currentAssetReferenceChangedDate = v5->_currentAssetReferenceChangedDate;
    v5->_currentAssetReferenceChangedDate = (NSDate *)v20;

    v5->_BOOL videoContentAllowed = 0;
    v5->_needsUpdatePlaybackAudioSession = 1;
    uint64_t v22 = px_dispatch_queue_create_serial();
    audioSessionUpdateQueue = v5->_audioSessionUpdateQueue;
    v5->_audioSessionUpdateQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = objc_alloc_init(PUOneUpVideoPlayerController);
    videoPlayerController = v5->_videoPlayerController;
    v5->_videoPlayerController = v24;

    [(PUOneUpVideoPlayerController *)v5->_videoPlayerController setDelegate:v5];
    BOOL v26 = [MEMORY[0x1E4F908A0] sharedController];
    [v26 registerChangeObserver:v5 context:VideoMuteControllerContext_17263];
  }
  return v5;
}

+ (PXAssetBadgeInfo)filteredBadgeInfoWithInputInfo:(SEL)a3 assetReference:(PXAssetBadgeInfo *)a4 actionManager:(id)a5
{
  id v32 = a5;
  long long v9 = *(_OWORD *)&a4->count;
  *(_OWORD *)&retstr->unint64_t badges = *(_OWORD *)&a4->badges;
  *(_OWORD *)&retstr->count = v9;
  unint64_t badges = a4->badges;
  id v11 = a6;
  uint64_t v12 = [v32 asset];
  unint64_t v13 = [v32 assetCollection];
  int v14 = [v11 canPerformActionType:15 onAsset:v12 inAssetCollection:v13];

  uint64_t v15 = [v32 asset];
  char v16 = [v32 assetCollection];
  int v17 = [v11 shouldEnableActionType:15 onAsset:v15 inAssetCollection:v16];

  id v18 = [MEMORY[0x1E4F8FFD0] sharedManager];
  uint64_t v19 = PXAssetEditOperationTypeForVariationType();
  uint64_t v20 = [v32 asset];
  int v21 = [v18 canPerformEditOperationWithType:v19 onAsset:v20];

  int v22 = v14 & v17;
  unint64_t v23 = badges & 0xFFFFFFFFFFBFFFFFLL;
  if ((badges & 0x400000) != 0) {
    int v24 = v14 & v17;
  }
  else {
    int v24 = 1;
  }
  if (v24) {
    unint64_t v23 = badges;
  }
  int v25 = v22 & v21;
  if ((v23 & 0x2000) == 0) {
    int v25 = 1;
  }
  if (v25) {
    unint64_t v26 = v23;
  }
  else {
    unint64_t v26 = v23 & 0xFFFFFFFFFFFFDFFFLL;
  }
  if ((v26 & 0x40000000000) != 0)
  {
    if (!v22) {
      goto LABEL_14;
    }
    uint64_t v27 = [MEMORY[0x1E4F8FFD0] sharedManager];
    objc_super v28 = PXAssetEditOperationTypeForDepthToggle();
    uint64_t v29 = [v32 asset];
    char v30 = [v27 canPerformEditOperationWithType:v28 onAsset:v29];

    if ((v30 & 1) == 0) {
LABEL_14:
    }
      v26 &= ~0x40000000000uLL;
  }
  retstr->unint64_t badges = v26;

  return result;
}

+ (void)initialize
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_super v4 = @"browsingChromeVisibility";
    v5[0] = MEMORY[0x1E4F1CC38];
    objc_super v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

@end