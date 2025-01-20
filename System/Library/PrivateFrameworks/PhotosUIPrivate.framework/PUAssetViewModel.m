@interface PUAssetViewModel
+ (int64_t)imageAnalysisInteractionHostModeForAccessoryViewVisibility:(BOOL)a3;
- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayed;
- (BOOL)allowAutoplayVideoForAsset:(id)a3;
- (BOOL)forceBadgesVisible;
- (BOOL)hasAutoplayedVideoSinceBecomingFocused;
- (BOOL)hasVisualAnalysisFailed;
- (BOOL)isAccessoryViewVisible;
- (BOOL)isBeingDismissed;
- (BOOL)isDisplayingSearchQueryLabel;
- (BOOL)isFavorite;
- (BOOL)isFullyInFocus;
- (BOOL)isFullyOutOfFocus;
- (BOOL)isHDR;
- (BOOL)isInEditMode;
- (BOOL)isIrisPlaying;
- (BOOL)isLastAccessoryViewVisibilityChangeReasonUserAction;
- (BOOL)isPresentedForPreview;
- (BOOL)isScrubbing;
- (BOOL)isUpdatingDisplayedContent;
- (BOOL)isUserTransformingTile;
- (BOOL)isVisualSearchCardShowing;
- (BOOL)isZoomedIn;
- (BOOL)lowMemoryMode;
- (BOOL)needsResetVisualImageInteraction;
- (BOOL)revealsGainMapImage;
- (BOOL)shouldShowHighlightTimeRanges;
- (CGPoint)contentOffset;
- (CGPoint)contentOffsetForAccessoryFullyVisible;
- (CGPoint)overridingContentOffset;
- (CGPoint)preferredContentOffset;
- (CGRect)mainImageContentsRect;
- (NSArray)highlightTimeRanges;
- (NSHashTable)registeredVideoLayerSources;
- (NSMapTable)interactionHostViewsByMode;
- (NSNumber)assetSyndicationStateOverride;
- (NSNumber)isFavoriteOverride;
- (NSProgress)saveProgress;
- (OS_dispatch_group)displayedContentUpdateGroup;
- (PUAssetHighlightTimeRangesProducer)highlightTimeRangesProducer;
- (PUAssetReference)assetReference;
- (PUAssetSharedViewModel)assetSharedViewModel;
- (PUAssetViewModel)init;
- (PUAssetViewModel)initWithLowMemoryMode:(BOOL)a3;
- (PUAssetViewModel)initWithLowMemoryMode:(BOOL)a3 mediaAnalyzer:(id)a4;
- (PUAssetViewModel)initWithMediaAnalyzer:(id)a3;
- (PUAssetViewModelChange)currentChange;
- (PUAssetViewModelChange)currentChangeIfExists;
- (PUBadgeInfoPromise)badgeInfoPromise;
- (PUBrowsingAnimatedImagePlayer)animatedImagePlayer;
- (PUBrowsingIrisPlayer)irisPlayer;
- (PUBrowsingVideoPlayer)videoPlayer;
- (PUDisplayAsset)asset;
- (PUDisplayTileTransform)secondDisplayTileTransform;
- (PUImageAnalysisInteraction)imageAnalysisInteraction;
- (PUMediaProvider)mediaProvider;
- (PUModelTileTransform)modelTileTransform;
- (PUVideoLayerSource)primaryVideoLayerSource;
- (PXOperationStatus)loadingStatus;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXUpdater)updater;
- (PXVKCVisualSearchResultInfo)visualSearchResultInfo;
- (PXVKImageAnalysis)visualImageAnalysis;
- (PXVKImageAnalysisInteraction)visualSearchImageAnalysisInteraction;
- (UIImage)bestImage;
- (double)accessoryViewVisibilityFraction;
- (double)contentOffsetOverrideFactor;
- (double)focusValue;
- (double)focusValueAtZeroTimestamp;
- (id)debugDetailedDescription;
- (id)newViewModelChange;
- (id)videoAutoplayPredicate;
- (int)visualIntelligenceAnalyzeRequestID;
- (int64_t)_currentFavoriteOverrideRequest;
- (int64_t)displayedContentUpdateCount;
- (int64_t)editStyle;
- (int64_t)fetchAssetSyndicationState;
- (int64_t)imageAnalysisInteractionHostMode;
- (int64_t)importState;
- (int64_t)lastAccessoryViewVisibilityChangeReason;
- (int64_t)lastContentOffsetChangeReason;
- (int64_t)lastEditStyleChangeReason;
- (int64_t)needsResetVisualImageInteractionReason;
- (int64_t)saveState;
- (int64_t)statusCornerState;
- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4;
- (void)_handleBrowsingAnimatedImage:(id)a3 didChange:(id)a4;
- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4;
- (void)_handleBrowsingVideoPlayer:(id)a3 didChange:(id)a4;
- (void)_handleDidEndScrubbing;
- (void)_handleHighlightTimeRangesResult:(id)a3 forAsset:(id)a4;
- (void)_invalidateAccessoryViewVisibilityFraction;
- (void)_invalidateHighlightTimeRangesProducer;
- (void)_invalidateInteractionHostMode;
- (void)_invalidateMediaControllers;
- (void)_invalidateShouldShowHighlightTimeRanges;
- (void)_invalidateVideoPlayersLoadingAllowed;
- (void)_setAssetSyndicationState:(int64_t)a3;
- (void)_setCurrentFavoriteOverrideRequest:(int64_t)a3;
- (void)_setFavorite:(BOOL)a3;
- (void)_setLastAccessoryViewVisibilityChangeReason:(int64_t)a3;
- (void)_setLastContentOffsetChangeReason:(int64_t)a3;
- (void)_updateAccessoryViewVisibilityFraction;
- (void)_updateFavoriteState;
- (void)_updateHighlightTimeRangesProducer;
- (void)_updateImageAnalysisInteractionHostView;
- (void)_updateInteractionHostMode;
- (void)_updateMediaControllers;
- (void)_updatePlayersLoadingAllowed;
- (void)_updatePropertiesFromAssetSharedViewModel;
- (void)_updateShouldShowHighlightTimeRanges;
- (void)_updateVideoPlaybackStartTime;
- (void)assetHighlightTimeRangesProducerDidChangeHighlights:(id)a3;
- (void)dealloc;
- (void)didPerformChanges;
- (void)didUpdateDisplayedContent;
- (void)registerChangeObserver:(id)a3;
- (void)registerVideoLayerSource:(id)a3;
- (void)registerView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4;
- (void)resetContentOffset;
- (void)setAccessoryViewVisibilityFraction:(double)a3;
- (void)setAccessoryViewVisible:(BOOL)a3;
- (void)setAccessoryViewVisible:(BOOL)a3 changeReason:(int64_t)a4;
- (void)setAsset:(id)a3;
- (void)setAssetReference:(id)a3;
- (void)setAssetSharedViewModel:(id)a3;
- (void)setAssetSyndicationStateOverride:(id)a3;
- (void)setBadgeInfoPromise:(id)a3;
- (void)setBestImage:(id)a3;
- (void)setContentOffsetForAccessoryFullyVisible:(CGPoint)a3;
- (void)setContentOffsetOverrideFactor:(double)a3;
- (void)setDisplayedContentUpdateCount:(int64_t)a3;
- (void)setDisplayedContentUpdateGroup:(id)a3;
- (void)setEditStyle:(int64_t)a3 changeReason:(int64_t)a4;
- (void)setFetchAssetSyndicationState:(int64_t)a3;
- (void)setFocusValue:(double)a3;
- (void)setFocusValueAtZeroTimestamp:(double)a3;
- (void)setForceBadgesVisible:(BOOL)a3;
- (void)setHasAutoplayedVideoSinceBecomingFocused:(BOOL)a3;
- (void)setHasVisualAnalysisFailed:(BOOL)a3;
- (void)setHighlightTimeRanges:(id)a3;
- (void)setHighlightTimeRangesProducer:(id)a3;
- (void)setImageAnalysisInteraction:(id)a3;
- (void)setImageAnalysisInteractionHostMode:(int64_t)a3;
- (void)setImportState:(int64_t)a3;
- (void)setInteractionHostViewsByMode:(id)a3;
- (void)setIrisPlayer:(id)a3;
- (void)setIsBeingDismissed:(BOOL)a3;
- (void)setIsDisplayingSearchQueryLabel:(BOOL)a3;
- (void)setIsFavoriteOverride:(id)a3;
- (void)setIsFullyInFocus:(BOOL)a3;
- (void)setIsFullyOutOfFocus:(BOOL)a3;
- (void)setIsIrisPlaying:(BOOL)a3;
- (void)setIsPresentedForPreview:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setIsUpdatingDisplayedContent:(BOOL)a3;
- (void)setIsVisualSearchCardShowing:(BOOL)a3;
- (void)setIsZoomedIn:(BOOL)a3;
- (void)setLoadingStatus:(id)a3;
- (void)setMainImageContentsRect:(CGRect)a3;
- (void)setMediaProvider:(id)a3;
- (void)setModelTileTransform:(id)a3;
- (void)setNeedsResetVisualImageInteraction:(BOOL)a3;
- (void)setNeedsResetVisualImageInteraction:(BOOL)a3 reason:(int64_t)a4;
- (void)setOverridingContentOffset:(CGPoint)a3;
- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayed:(BOOL)a3;
- (void)setPreferredContentOffset:(CGPoint)a3;
- (void)setPreferredContentOffset:(CGPoint)a3 changeReason:(int64_t)a4;
- (void)setRegisteredVideoLayerSources:(id)a3;
- (void)setRevealsGainMapImage:(BOOL)a3;
- (void)setSaveProgress:(id)a3;
- (void)setSaveState:(int64_t)a3;
- (void)setSearchQueryMatchInfo:(id)a3;
- (void)setSecondDisplayTileTransform:(id)a3;
- (void)setShouldShowHighlightTimeRanges:(BOOL)a3;
- (void)setStatusCornerState:(int64_t)a3;
- (void)setUserTransformingTile:(BOOL)a3;
- (void)setVideoAutoplayPredicate:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)setVisualImageAnalysis:(id)a3;
- (void)setVisualIntelligenceAnalyzeRequestID:(int)a3;
- (void)setVisualSearchImageAnalysisInteraction:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)unregisterVideoLayerSource:(id)a3;
- (void)unregisterView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)willUpdateDisplayedContent;
@end

@implementation PUAssetViewModel

- (void).cxx_destruct
{
  objc_storeStrong(&self->_videoAutoplayPredicate, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_interactionHostViewsByMode, 0);
  objc_storeStrong((id *)&self->_highlightTimeRangesProducer, 0);
  objc_storeStrong((id *)&self->_registeredVideoLayerSources, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetSyndicationStateOverride, 0);
  objc_storeStrong((id *)&self->_isFavoriteOverride, 0);
  objc_destroyWeak((id *)&self->_bestImage);
  objc_destroyWeak((id *)&self->_visualSearchImageAnalysisInteraction);
  objc_storeStrong((id *)&self->_visualImageAnalysis, 0);
  objc_storeStrong((id *)&self->_badgeInfoPromise, 0);
  objc_storeStrong((id *)&self->_displayedContentUpdateGroup, 0);
  objc_storeStrong((id *)&self->_saveProgress, 0);
  objc_storeStrong((id *)&self->_loadingStatus, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_highlightTimeRanges, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_secondDisplayTileTransform, 0);
  objc_storeStrong((id *)&self->_modelTileTransform, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_animatedImagePlayer, 0);
  objc_storeStrong((id *)&self->_irisPlayer, 0);
}

- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayed
{
  return self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed;
}

- (id)videoAutoplayPredicate
{
  return self->_videoAutoplayPredicate;
}

- (int64_t)imageAnalysisInteractionHostMode
{
  return self->_imageAnalysisInteractionHostMode;
}

- (PUImageAnalysisInteraction)imageAnalysisInteraction
{
  return self->_imageAnalysisInteraction;
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (void)setAssetReference:(id)a3
{
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setInteractionHostViewsByMode:(id)a3
{
}

- (void)setHasAutoplayedVideoSinceBecomingFocused:(BOOL)a3
{
  self->_hasAutoplayedVideoSinceBecomingFocused = a3;
}

- (BOOL)hasAutoplayedVideoSinceBecomingFocused
{
  return self->_hasAutoplayedVideoSinceBecomingFocused;
}

- (void)setHighlightTimeRangesProducer:(id)a3
{
}

- (PUAssetHighlightTimeRangesProducer)highlightTimeRangesProducer
{
  return self->_highlightTimeRangesProducer;
}

- (void)setRegisteredVideoLayerSources:(id)a3
{
}

- (NSHashTable)registeredVideoLayerSources
{
  return self->_registeredVideoLayerSources;
}

- (int64_t)displayedContentUpdateCount
{
  return self->_displayedContentUpdateCount;
}

- (void)_setCurrentFavoriteOverrideRequest:(int64_t)a3
{
  self->__currentFavoriteOverrideRequest = a3;
}

- (int64_t)_currentFavoriteOverrideRequest
{
  return self->__currentFavoriteOverrideRequest;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSNumber)assetSyndicationStateOverride
{
  return self->_assetSyndicationStateOverride;
}

- (NSNumber)isFavoriteOverride
{
  return self->_isFavoriteOverride;
}

- (int64_t)needsResetVisualImageInteractionReason
{
  return self->_needsResetVisualImageInteractionReason;
}

- (BOOL)needsResetVisualImageInteraction
{
  return self->_needsResetVisualImageInteraction;
}

- (CGRect)mainImageContentsRect
{
  double x = self->_mainImageContentsRect.origin.x;
  double y = self->_mainImageContentsRect.origin.y;
  double width = self->_mainImageContentsRect.size.width;
  double height = self->_mainImageContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIImage)bestImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bestImage);
  return (UIImage *)WeakRetained;
}

- (int64_t)statusCornerState
{
  return self->_statusCornerState;
}

- (void)setHasVisualAnalysisFailed:(BOOL)a3
{
  self->_hasVisualAnalysisFailed = a3;
}

- (BOOL)hasVisualAnalysisFailed
{
  return self->_hasVisualAnalysisFailed;
}

- (void)setVisualSearchImageAnalysisInteraction:(id)a3
{
}

- (PXVKImageAnalysisInteraction)visualSearchImageAnalysisInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualSearchImageAnalysisInteraction);
  return (PXVKImageAnalysisInteraction *)WeakRetained;
}

- (BOOL)isVisualSearchCardShowing
{
  return self->_isVisualSearchCardShowing;
}

- (int)visualIntelligenceAnalyzeRequestID
{
  return self->_visualIntelligenceAnalyzeRequestID;
}

- (BOOL)isIrisPlaying
{
  return self->_isIrisPlaying;
}

- (BOOL)isBeingDismissed
{
  return self->_isBeingDismissed;
}

- (PXVKImageAnalysis)visualImageAnalysis
{
  return self->_visualImageAnalysis;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (BOOL)revealsGainMapImage
{
  return self->_revealsGainMapImage;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (int64_t)lastEditStyleChangeReason
{
  return self->_lastEditStyleChangeReason;
}

- (int64_t)editStyle
{
  return self->_editStyle;
}

- (double)contentOffsetOverrideFactor
{
  return self->_contentOffsetOverrideFactor;
}

- (CGPoint)overridingContentOffset
{
  double x = self->_overridingContentOffset.x;
  double y = self->_overridingContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)preferredContentOffset
{
  double x = self->_preferredContentOffset.x;
  double y = self->_preferredContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)accessoryViewVisibilityFraction
{
  return self->_accessoryViewVisibilityFraction;
}

- (CGPoint)contentOffsetForAccessoryFullyVisible
{
  double x = self->_contentOffsetForAccessoryFullyVisible.x;
  double y = self->_contentOffsetForAccessoryFullyVisible.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setLastContentOffsetChangeReason:(int64_t)a3
{
  self->_lastContentOffsetChangeReason = a3;
}

- (int64_t)lastContentOffsetChangeReason
{
  return self->_lastContentOffsetChangeReason;
}

- (void)_setLastAccessoryViewVisibilityChangeReason:(int64_t)a3
{
  self->_lastAccessoryViewVisibilityChangeReason = a3;
}

- (int64_t)lastAccessoryViewVisibilityChangeReason
{
  return self->_lastAccessoryViewVisibilityChangeReason;
}

- (BOOL)isAccessoryViewVisible
{
  return self->_accessoryViewVisible;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (PUBadgeInfoPromise)badgeInfoPromise
{
  return self->_badgeInfoPromise;
}

- (OS_dispatch_group)displayedContentUpdateGroup
{
  return self->_displayedContentUpdateGroup;
}

- (BOOL)isUpdatingDisplayedContent
{
  return self->_isUpdatingDisplayedContent;
}

- (int64_t)importState
{
  return self->_importState;
}

- (int64_t)saveState
{
  return self->_saveState;
}

- (NSProgress)saveProgress
{
  return self->_saveProgress;
}

- (PXOperationStatus)loadingStatus
{
  return self->_loadingStatus;
}

- (PUBrowsingAnimatedImagePlayer)animatedImagePlayer
{
  return self->_animatedImagePlayer;
}

- (PUBrowsingIrisPlayer)irisPlayer
{
  return self->_irisPlayer;
}

- (BOOL)forceBadgesVisible
{
  return self->_forceBadgesVisible;
}

- (BOOL)isDisplayingSearchQueryLabel
{
  return self->_isDisplayingSearchQueryLabel;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (BOOL)shouldShowHighlightTimeRanges
{
  return self->_shouldShowHighlightTimeRanges;
}

- (NSArray)highlightTimeRanges
{
  return self->_highlightTimeRanges;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setFocusValueAtZeroTimestamp:(double)a3
{
  self->_focusValueAtZeroTimestamp = a3;
}

- (double)focusValueAtZeroTimestamp
{
  return self->_focusValueAtZeroTimestamp;
}

- (BOOL)isZoomedIn
{
  return self->_isZoomedIn;
}

- (BOOL)isFullyOutOfFocus
{
  return self->_isFullyOutOfFocus;
}

- (BOOL)isFullyInFocus
{
  return self->_isFullyInFocus;
}

- (double)focusValue
{
  return self->_focusValue;
}

- (BOOL)isUserTransformingTile
{
  return self->_isUserTransformingTile;
}

- (void)setSecondDisplayTileTransform:(id)a3
{
}

- (PUDisplayTileTransform)secondDisplayTileTransform
{
  return self->_secondDisplayTileTransform;
}

- (PUModelTileTransform)modelTileTransform
{
  return self->_modelTileTransform;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setFetchAssetSyndicationState:(int64_t)a3
{
  self->_assetSyndicationState = a3;
}

- (id)debugDetailedDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(PUAssetViewModel *)self focusValue];
  objc_msgSend(v3, "appendFormat:", @"Focus Value: %f\n", v4);
  v5 = [(PUAssetViewModel *)self modelTileTransform];
  [v3 appendFormat:@"Tile Transform: %@\n", v5];

  [(PUAssetViewModel *)self contentOffset];
  v6 = NSStringFromCGPoint(v23);
  [v3 appendFormat:@"Content Offset: %@\n", v6];

  v7 = [(PUAssetViewModel *)self badgeInfoPromise];
  [v3 appendFormat:@"Badge Info: %@\n", v7];

  v8 = [(PUAssetViewModel *)self loadingStatus];
  [v3 appendFormat:@"Loading Status: %@\n", v8];

  v9 = [(PUAssetViewModel *)self videoPlayer];
  v10 = [v9 debugDetailedDescription];
  [v3 appendFormat:@"Video Player: %@\n", v10];

  v11 = [(PUAssetViewModel *)self irisPlayer];
  v12 = [v11 debugDetailedDescription];
  [v3 appendFormat:@"Iris Player: %@\n", v12];

  v13 = [(PUAssetViewModel *)self animatedImagePlayer];
  v14 = [v13 debugDetailedDescription];
  [v3 appendFormat:@"Animated Image: %@\n", v14];

  v15 = [(PUAssetViewModel *)self searchQueryMatchInfo];
  [v3 appendFormat:@"Search Info: %@\n", v15];

  if ([(PUAssetViewModel *)self isUserTransformingTile]) {
    [v3 appendString:@"User Transforming Tile\n"];
  }
  v16 = NSString;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v19 = objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v20 = [v16 stringWithFormat:@"<%@ %p> {\n\t%@}", v18, self, v19];

  return v20;
}

- (void)_updateInteractionHostMode
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "imageAnalysisInteractionHostModeForAccessoryViewVisibility:", -[PUAssetViewModel isAccessoryViewVisible](self, "isAccessoryViewVisible"));
  [(PUAssetViewModel *)self setImageAnalysisInteractionHostMode:v3];
}

- (void)_invalidateInteractionHostMode
{
  id v2 = [(PUAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInteractionHostMode];
}

- (void)_updateImageAnalysisInteractionHostView
{
  int64_t v3 = [(PUAssetViewModel *)self imageAnalysisInteractionHostMode];
  uint64_t v4 = [(PUAssetViewModel *)self interactionHostViewsByMode];
  v5 = [NSNumber numberWithInteger:v3];
  id v7 = [v4 objectForKey:v5];

  v6 = [(PUAssetViewModel *)self imageAnalysisInteraction];
  [v6 setHostView:v7];
}

- (void)setImageAnalysisInteractionHostMode:(int64_t)a3
{
  if (self->_imageAnalysisInteractionHostMode != a3)
  {
    self->_imageAnalysisInteractionHostMode = a3;
    [(PUAssetViewModel *)self _updateImageAnalysisInteractionHostView];
  }
}

- (NSMapTable)interactionHostViewsByMode
{
  interactionHostViewsByMode = self->_interactionHostViewsByMode;
  if (!interactionHostViewsByMode)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v5 = self->_interactionHostViewsByMode;
    self->_interactionHostViewsByMode = v4;

    interactionHostViewsByMode = self->_interactionHostViewsByMode;
  }
  return interactionHostViewsByMode;
}

- (void)unregisterView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PUAssetViewModel *)self interactionHostViewsByMode];
  v8 = [NSNumber numberWithInteger:a4];
  id v9 = [v7 objectForKey:v8];

  if (v9 == v6)
  {
    v10 = [(PUAssetViewModel *)self interactionHostViewsByMode];
    v11 = [NSNumber numberWithInteger:a4];
    [v10 removeObjectForKey:v11];

    [(PUAssetViewModel *)self _updateImageAnalysisInteractionHostView];
  }
}

- (void)registerView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PUAssetViewModel *)self interactionHostViewsByMode];
  v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];

  [(PUAssetViewModel *)self _updateImageAnalysisInteractionHostView];
}

- (void)_handleBrowsingAnimatedImage:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PUAssetViewModel__handleBrowsingAnimatedImage_didChange___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PUViewModel *)self performChanges:v7];
}

void __59__PUAssetViewModel__handleBrowsingAnimatedImage_didChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentChange];
  [v2 _setAnimatedImageChange:*(void *)(a1 + 40)];
}

- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PUAssetViewModel__handleBrowsingIrisPlayer_didChange___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PUViewModel *)self performChanges:v7];
}

void __56__PUAssetViewModel__handleBrowsingIrisPlayer_didChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentChange];
  [v2 _setIrisPlayerChange:*(void *)(a1 + 40)];
}

- (void)_handleBrowsingVideoPlayer:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke;
  v13 = &unk_1E5F2ECC8;
  v14 = self;
  id v15 = v5;
  id v6 = v5;
  id v7 = (void (**)(void))_Block_copy(&v10);
  id v8 = [(PUAssetViewModel *)self updater];
  int v9 = [v8 isPerformingUpdates];

  if (v9) {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  else {
    v7[2](v7);
  }
}

void __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke_2;
  v5[3] = &unk_1E5F2ECC8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performChanges:v5];
}

void __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) durationDidChange]) {
    [*(id *)(a1 + 40) _invalidateShouldShowHighlightTimeRanges];
  }
  id v2 = [*(id *)(a1 + 40) currentChange];
  [v2 _setVideoPlayerChange:*(void *)(a1 + 32)];
}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  if (([v5 loadingStatusChanged] & 1) != 0
    || ([v5 saveProgressChanged] & 1) != 0
    || [v5 saveStateChanged])
  {
    [(PUAssetViewModel *)self _updatePropertiesFromAssetSharedViewModel];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PUAssetViewModel *)self _handleAssetSharedViewModel:v7 didChange:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PUAssetViewModel *)self _handleBrowsingVideoPlayer:v7 didChange:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PUAssetViewModel *)self _handleBrowsingIrisPlayer:v7 didChange:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PUAssetViewModel *)self _handleBrowsingAnimatedImage:v7 didChange:v6];
        }
      }
    }
  }
}

- (void)assetHighlightTimeRangesProducerDidChangeHighlights:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PUAssetViewModel_assetHighlightTimeRangesProducerDidChangeHighlights___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUViewModel *)self performChanges:v6];
}

void __72__PUAssetViewModel_assetHighlightTimeRangesProducerDidChangeHighlights___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) highlightTimeRanges];
  [*(id *)(a1 + 32) setHighlightTimeRanges:v2];
}

- (int64_t)fetchAssetSyndicationState
{
  int64_t result = self->_assetSyndicationState;
  if (!result)
  {
    id v4 = [(PUAssetViewModel *)self assetSyndicationStateOverride];
    id v5 = v4;
    if (v4)
    {
      int64_t v6 = [v4 integerValue];
    }
    else
    {
      id v7 = [(PUAssetViewModel *)self asset];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if (objc_msgSend(v8, "px_isUnsavedSyndicatedAsset"))
        {
          if (PXContentSyndicationCMMAssetIsBeingSaved())
          {
            [(PUAssetViewModel *)self setAssetSyndicationStateOverride:&unk_1F078BB70];
            int64_t v6 = 1;
          }
          else
          {
            int64_t v6 = 2;
          }
        }
        else if (objc_msgSend(v8, "px_wasSavedThroughSyndication"))
        {
          int64_t v6 = 4;
        }
        else
        {
          int64_t v6 = 1;
        }
      }
      else
      {
        int64_t v6 = 1;
      }
    }
    self->_assetSyndicationState = v6;
    int v9 = [(PUAssetViewModel *)self currentChange];
    [v9 setAssetSyndicationStateChanged:1];

    return self->_assetSyndicationState;
  }
  return result;
}

- (void)_updateFavoriteState
{
  id v6 = [(PUAssetViewModel *)self asset];
  id v3 = [(PUAssetViewModel *)self isFavoriteOverride];
  if (v3)
  {
    id v4 = [(PUAssetViewModel *)self isFavoriteOverride];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v5 = [v6 isFavorite];
  }

  [(PUAssetViewModel *)self _setFavorite:v5];
}

- (PXVKCVisualSearchResultInfo)visualSearchResultInfo
{
  id v2 = [(PUAssetViewModel *)self visualImageAnalysis];
  id v3 = [v2 resultItems];
  id v4 = [v3 firstObject];

  return (PXVKCVisualSearchResultInfo *)v4;
}

- (void)_updateVideoPlaybackStartTime
{
  id v3 = [(PUAssetViewModel *)self videoPlayer];
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__PUAssetViewModel__updateVideoPlaybackStartTime__block_invoke;
    v5[3] = &unk_1E5F2ECC8;
    void v5[4] = self;
    id v6 = v3;
    [v6 performChanges:v5];
  }
}

uint64_t __49__PUAssetViewModel__updateVideoPlaybackStartTime__block_invoke(uint64_t a1)
{
  id v2 = +[PUOneUpSettings sharedInstance];
  int v3 = [v2 videoStartAtFirstHighlight];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) highlightTimeRanges];
    uint64_t v5 = [v4 firstObject];
    id v6 = v5;
    if (v5)
    {
      [v5 CMTimeRangeValue];
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
    }
    *(_OWORD *)&v22.value = v19;
    v22.epoch = v20;

    memset(&v18, 0, sizeof(v18));
    int v9 = +[PUOneUpSettings sharedInstance];
    [v9 videoHighlightPreroll];
    CMTimeMakeWithSeconds(&rhs, v10, 600);
    CMTime lhs = v22;
    CMTimeSubtract(&time2, &lhs, &rhs);
    CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeMaximum(&v18, &lhs, &time2);

    CMTime v14 = v18;
    id v7 = *(void **)(a1 + 40);
    id v8 = &v14;
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    long long v12 = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    id v8 = (CMTime *)&v12;
  }
  return objc_msgSend(v7, "setPlaybackStartTime:", v8, v12, v13);
}

- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayed:(BOOL)a3
{
  if (self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed != a3)
  {
    self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    objc_msgSend(v3, "setPPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged:", 1);
  }
}

- (void)setNeedsResetVisualImageInteraction:(BOOL)a3 reason:(int64_t)a4
{
  if (self->_needsResetVisualImageInteraction != a3)
  {
    self->_needsResetVisualImageInteraction = a3;
    self->_needsResetVisualImageInteractionReason = a4;
    id v4 = [(PUAssetViewModel *)self currentChange];
    [v4 setNeedsResetVisualImageInteractionChanged:1];
  }
}

- (void)setNeedsResetVisualImageInteraction:(BOOL)a3
{
}

- (void)setStatusCornerState:(int64_t)a3
{
  if (self->_statusCornerState != a3)
  {
    self->_statusCornerState = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setStatusCornerStateChanged:1];
  }
}

- (void)setBestImage:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bestImage);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_bestImage, obj);
    id v6 = [(PUAssetViewModel *)self currentChange];
    [v6 _setBestImageChanged:1];

    uint64_t v5 = obj;
  }
}

- (void)setIsVisualSearchCardShowing:(BOOL)a3
{
  if (self->_isVisualSearchCardShowing != a3)
  {
    self->_isVisualSearchCardShowing = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setIsVisualSearchCardShowingChanged:1];
  }
}

- (void)setIsIrisPlaying:(BOOL)a3
{
  if (self->_isIrisPlaying != a3)
  {
    self->_isIrisPlaying = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setIsIrisPlayingChanged:1];
  }
}

- (void)setIsBeingDismissed:(BOOL)a3
{
  if (self->_isBeingDismissed != a3)
  {
    self->_isBeingDismissed = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setIsBeingDismissedChanged:1];
  }
}

- (void)setVisualIntelligenceAnalyzeRequestID:(int)a3
{
  if (self->_visualIntelligenceAnalyzeRequestID != a3)
  {
    self->_visualIntelligenceAnalyzeRequestID = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setVisualIntelligenceAnalyzeRequestIDChanged:1];
  }
}

- (void)setMainImageContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_mainImageContentsRect = &self->_mainImageContentsRect;
  if (!CGRectEqualToRect(a3, self->_mainImageContentsRect))
  {
    p_mainImageContentsRect->origin.CGFloat x = x;
    p_mainImageContentsRect->origin.CGFloat y = y;
    p_mainImageContentsRect->size.CGFloat width = width;
    p_mainImageContentsRect->size.CGFloat height = height;
    id v9 = [(PUAssetViewModel *)self currentChange];
    [v9 setMainImageContentsRectChanged:1];
  }
}

- (void)setVisualImageAnalysis:(id)a3
{
  uint64_t v5 = (PXVKImageAnalysis *)a3;
  if (self->_visualImageAnalysis != v5)
  {
    id v7 = v5;
    PXDeferredDealloc();
    objc_storeStrong((id *)&self->_visualImageAnalysis, a3);
    id v6 = [(PUAssetViewModel *)self currentChange];
    [v6 _setVisualImageAnalysisChanged:1];

    uint64_t v5 = v7;
  }
}

- (void)setIsPresentedForPreview:(BOOL)a3
{
  if (self->_isPresentedForPreview != a3)
  {
    self->_isPresentedForPreview = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setIsPresentedForPreviewChanged:1];
  }
}

- (void)setDisplayedContentUpdateGroup:(id)a3
{
  id v5 = a3;
  p_displayedContentUpdateGroup = (id *)&self->_displayedContentUpdateGroup;
  id v7 = *p_displayedContentUpdateGroup;
  id v8 = v5;
  if (*p_displayedContentUpdateGroup != v5)
  {
    if (v7) {
      dispatch_group_leave(v7);
    }
    objc_storeStrong(p_displayedContentUpdateGroup, a3);
    if (*p_displayedContentUpdateGroup) {
      dispatch_group_enter((dispatch_group_t)*p_displayedContentUpdateGroup);
    }
  }
}

- (void)setIsUpdatingDisplayedContent:(BOOL)a3
{
  if (self->_isUpdatingDisplayedContent != a3)
  {
    self->_isUpdatingDisplayedContent = a3;
    kdebug_trace();
    id v5 = [(PUAssetViewModel *)self currentChange];
    [v5 _setIsUpdatingDisplayedContentChanged:1];

    if (a3)
    {
      dispatch_group_t v6 = dispatch_group_create();
      [(PUAssetViewModel *)self setDisplayedContentUpdateGroup:v6];
    }
    else
    {
      [(PUAssetViewModel *)self setDisplayedContentUpdateGroup:0];
    }
  }
}

- (void)setDisplayedContentUpdateCount:(int64_t)a3
{
  if (self->_displayedContentUpdateCount != a3)
  {
    if (a3 < 0)
    {
      id v4 = PLOneUpGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "displayedContentUpdateCount underflow", v5, 2u);
      }

      a3 = 0;
    }
    self->_displayedContentUpdateCount = a3;
    [(PUAssetViewModel *)self setIsUpdatingDisplayedContent:a3 != 0];
  }
}

- (void)didUpdateDisplayedContent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PUAssetViewModel_didUpdateDisplayedContent__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

uint64_t __45__PUAssetViewModel_didUpdateDisplayedContent__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 displayedContentUpdateCount] - 1;
  return [v1 setDisplayedContentUpdateCount:v2];
}

- (void)willUpdateDisplayedContent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__PUAssetViewModel_willUpdateDisplayedContent__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

uint64_t __46__PUAssetViewModel_willUpdateDisplayedContent__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 displayedContentUpdateCount] + 1;
  return [v1 setDisplayedContentUpdateCount:v2];
}

- (void)_updatePropertiesFromAssetSharedViewModel
{
  id v3 = [(PUAssetViewModel *)self assetSharedViewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PUAssetViewModel__updatePropertiesFromAssetSharedViewModel__block_invoke;
  v5[3] = &unk_1E5F2ECC8;
  void v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(PUViewModel *)self performChanges:v5];
}

uint64_t __61__PUAssetViewModel__updatePropertiesFromAssetSharedViewModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) loadingStatus];
  [*(id *)(a1 + 32) setLoadingStatus:v2];

  id v3 = [*(id *)(a1 + 40) saveProgress];
  [*(id *)(a1 + 32) setSaveProgress:v3];

  uint64_t v4 = [*(id *)(a1 + 40) saveState];
  id v5 = *(void **)(a1 + 32);
  return [v5 setSaveState:v4];
}

- (void)setAssetSharedViewModel:(id)a3
{
  id v5 = (PUAssetSharedViewModel *)a3;
  assetSharedViewModel = self->_assetSharedViewModel;
  if (assetSharedViewModel != v5)
  {
    id v7 = v5;
    [(PUAssetSharedViewModel *)assetSharedViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    [(PUAssetSharedViewModel *)self->_assetSharedViewModel registerChangeObserver:self];
    [(PUAssetViewModel *)self _updatePropertiesFromAssetSharedViewModel];
    id v5 = v7;
  }
}

- (void)setForceBadgesVisible:(BOOL)a3
{
  if (self->_forceBadgesVisible != a3)
  {
    self->_forceBadgesVisible = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setForceBadgesVisibleChanged:1];
  }
}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setRevealsGainMapImageChanged:1];
  }
}

- (void)setEditStyle:(int64_t)a3 changeReason:(int64_t)a4
{
  if (*(_OWORD *)&self->_editStyle != __PAIR128__(a4, a3))
  {
    BOOL v7 = [(PUAssetViewModel *)self isInEditMode];
    self->_editStyle = a3;
    self->_lastEditStyleChangeReason = a4;
    if (v7 != [(PUAssetViewModel *)self isInEditMode])
    {
      id v8 = [(PUAssetViewModel *)self currentChange];
      [v8 _setIsInEditModeChanged:1];
    }
  }
}

- (BOOL)isInEditMode
{
  return self->_editStyle != 0;
}

- (void)setContentOffsetOverrideFactor:(double)a3
{
  if (self->_contentOffsetOverrideFactor != a3)
  {
    self->_contentOffsetOverrideFactor = a3;
    kdebug_trace();
    uint64_t v4 = [(PUAssetViewModel *)self currentChange];
    [v4 _setContentOffsetChanged:1];

    [(PUAssetViewModel *)self _updateAccessoryViewVisibilityFraction];
  }
}

- (void)setOverridingContentOffset:(CGPoint)a3
{
  if (a3.x != self->_overridingContentOffset.x || a3.y != self->_overridingContentOffset.y)
  {
    self->_overridingContentOffset = a3;
    kdebug_trace();
    [(PUAssetViewModel *)self _setLastContentOffsetChangeReason:0];
    id v5 = [(PUAssetViewModel *)self currentChange];
    [v5 _setContentOffsetChanged:1];

    [(PUAssetViewModel *)self _updateAccessoryViewVisibilityFraction];
  }
}

- (void)setPreferredContentOffset:(CGPoint)a3 changeReason:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_preferredContentOffset = &self->_preferredContentOffset;
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
  {
    p_preferredContentOffset->CGFloat x = x;
    p_preferredContentOffset->CGFloat y = y;
    kdebug_trace();
    [(PUAssetViewModel *)self _setLastContentOffsetChangeReason:a4];
    id v9 = [(PUAssetViewModel *)self currentChange];
    [v9 _setContentOffsetChanged:1];

    [(PUAssetViewModel *)self _updateAccessoryViewVisibilityFraction];
  }
}

- (void)setPreferredContentOffset:(CGPoint)a3
{
}

- (void)resetContentOffset
{
  [(PUAssetViewModel *)self preferredContentOffset];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v6 != *MEMORY[0x1E4F1DAD8] || v3 != v5)
  {
    [(PUAssetViewModel *)self contentOffsetOverrideFactor];
    if (v8 != 0.0)
    {
      -[PUAssetViewModel setPreferredContentOffset:](self, "setPreferredContentOffset:", v4, v5);
      [(PUAssetViewModel *)self setContentOffsetOverrideFactor:0.0];
      id v9 = [(PUAssetViewModel *)self currentChange];
      [v9 _setContentOffsetChanged:1];
    }
  }
}

- (CGPoint)contentOffset
{
  [(PUAssetViewModel *)self preferredContentOffset];
  double v4 = v3;
  double v6 = v5;
  [(PUAssetViewModel *)self overridingContentOffset];
  double v8 = v7;
  double v10 = v9;
  [(PUAssetViewModel *)self contentOffsetOverrideFactor];
  double v12 = v6 * (1.0 - v11);
  double v13 = v10 * v11;
  double v14 = v4 * (1.0 - v11) + v8 * v11;
  double v15 = v12 + v13;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (BOOL)isLastAccessoryViewVisibilityChangeReasonUserAction
{
  return (unint64_t)([(PUAssetViewModel *)self lastAccessoryViewVisibilityChangeReason]- 1) < 2;
}

- (void)setAccessoryViewVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  if (self->_accessoryViewVisible != a3)
  {
    self->_accessoryViewVisible = a3;
    double v6 = [(PUAssetViewModel *)self currentChange];
    [v6 _setAccessoryViewVisibilityChanged:1];

    [(PUAssetViewModel *)self _setLastAccessoryViewVisibilityChangeReason:a4];
    [(PUAssetViewModel *)self _invalidateAccessoryViewVisibilityFraction];
  }
}

- (void)setAccessoryViewVisible:(BOOL)a3
{
}

- (void)setAccessoryViewVisibilityFraction:(double)a3
{
  if (self->_accessoryViewVisibilityFraction != a3)
  {
    self->_accessoryViewVisibilityFraction = a3;
    [(PUAssetViewModel *)self _invalidateInteractionHostMode];
    id v4 = [(PUAssetViewModel *)self currentChange];
    [v4 setAccessoryViewVisibilityFractionChanged:1];
  }
}

- (void)_updateAccessoryViewVisibilityFraction
{
  [(PUAssetViewModel *)self contentOffsetForAccessoryFullyVisible];
  if (v4 == *MEMORY[0x1E4F1DAD8] && v3 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    double v8 = (double)[(PUAssetViewModel *)self isAccessoryViewVisible];
  }
  else
  {
    PXPointDistanceFromOrigin();
    double v7 = v6;
    double v8 = 0.0;
    if (v7 != 0.0)
    {
      [(PUAssetViewModel *)self contentOffset];
      PXPointDistanceFromOrigin();
      PXClamp();
    }
  }
  [(PUAssetViewModel *)self setAccessoryViewVisibilityFraction:v8];
}

- (void)_invalidateAccessoryViewVisibilityFraction
{
  id v2 = [(PUAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAccessoryViewVisibilityFraction];
}

- (void)setContentOffsetForAccessoryFullyVisible:(CGPoint)a3
{
  if (a3.x != self->_contentOffsetForAccessoryFullyVisible.x || a3.y != self->_contentOffsetForAccessoryFullyVisible.y)
  {
    self->_contentOffsetForAccessoryFullyVisible = a3;
    [(PUAssetViewModel *)self _updateAccessoryViewVisibilityFraction];
  }
}

- (void)setModelTileTransform:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v4 = (PUModelTileTransform *)a3;
  double v5 = v4;
  if (self->_modelTileTransform != v4 && !-[PUModelTileTransform isEqual:](v4, "isEqual:"))
  {
    double v6 = (PUModelTileTransform *)[(PUModelTileTransform *)v5 copy];
    modelTileTransform = self->_modelTileTransform;
    self->_modelTileTransform = v6;

    double v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134218242;
      double v11 = self;
      __int16 v12 = 2112;
      double v13 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "%p modelTileTransform=%@", (uint8_t *)&v10, 0x16u);
    }

    double v9 = [(PUAssetViewModel *)self currentChange];
    [v9 _setModelTileTransformChanged:1];
  }
}

- (void)setIsZoomedIn:(BOOL)a3
{
  if (self->_isZoomedIn != a3)
  {
    self->_isZoomedIn = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setIsZoomedInChanged:1];
  }
}

- (PUVideoLayerSource)primaryVideoLayerSource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_registeredVideoLayerSources;
  id v3 = (id)[(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v6, "isOnSecondScreen", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSHashTable *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (PUVideoLayerSource *)v3;
}

- (void)unregisterVideoLayerSource:(id)a3
{
}

- (void)registerVideoLayerSource:(id)a3
{
}

- (void)setIsDisplayingSearchQueryLabel:(BOOL)a3
{
  if (self->_isDisplayingSearchQueryLabel != a3)
  {
    self->_isDisplayingSearchQueryLabel = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setIsDisplayingSearchQueryLabelChanged:1];
  }
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  double v7 = (PXSearchQueryMatchInfo *)a3;
  double v5 = self->_searchQueryMatchInfo;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXSearchQueryMatchInfo *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_searchQueryMatchInfo, a3);
      [(PUAssetViewModel *)self _invalidateHighlightTimeRangesProducer];
    }
  }
}

- (void)setShouldShowHighlightTimeRanges:(BOOL)a3
{
  if (self->_shouldShowHighlightTimeRanges != a3)
  {
    self->_shouldShowHighlightTimeRanges = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setShouldShowHighlightTimeRangesChanged:1];
  }
}

- (void)_updateShouldShowHighlightTimeRanges
{
  id v3 = [(PUAssetViewModel *)self highlightTimeRanges];
  memset(&v13, 0, sizeof(v13));
  uint64_t v4 = [(PUAssetViewModel *)self videoPlayer];
  double v5 = v4;
  if (v4) {
    [v4 duration];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }

  if ((v13.flags & 0x1D) == 1 && [v3 count])
  {
    CMTime time = v13;
    double Seconds = CMTimeGetSeconds(&time);
    PXCMTimeRangeCombinedDuration();
    Float64 v7 = CMTimeGetSeconds(&v11) / Seconds;
    long long v8 = [MEMORY[0x1E4F908A8] sharedInstance];
    [v8 maxHighlightFractionForDisplay];
    BOOL v10 = v7 <= v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  [(PUAssetViewModel *)self setShouldShowHighlightTimeRanges:v10];
}

- (void)_invalidateShouldShowHighlightTimeRanges
{
  id v2 = [(PUAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldShowHighlightTimeRanges];
}

- (void)setHighlightTimeRanges:(id)a3
{
  Float64 v9 = (NSArray *)a3;
  uint64_t v4 = self->_highlightTimeRanges;
  double v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(NSArray *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    Float64 v7 = (NSArray *)[(NSArray *)v9 copy];
    highlightTimeRanges = self->_highlightTimeRanges;
    self->_highlightTimeRanges = v7;

    [(PUAssetViewModel *)self _invalidateShouldShowHighlightTimeRanges];
    [(PUAssetViewModel *)self _updateVideoPlaybackStartTime];
    double v5 = [(PUAssetViewModel *)self currentChange];
    [v5 setHighlightTimeRangesChanged:1];
  }

LABEL_5:
}

- (void)_handleHighlightTimeRangesResult:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUAssetViewModel *)self asset];

  if (v8 == v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__PUAssetViewModel__handleHighlightTimeRangesResult_forAsset___block_invoke;
    v9[3] = &unk_1E5F2ECC8;
    v9[4] = self;
    id v10 = v6;
    [(PUViewModel *)self performChanges:v9];
  }
}

uint64_t __62__PUAssetViewModel__handleHighlightTimeRangesResult_forAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlightTimeRanges:*(void *)(a1 + 40)];
}

- (void)_updateHighlightTimeRangesProducer
{
  id v3 = [(PUAssetViewModel *)self _pxDisplayAsset];
  uint64_t v4 = [(PUAssetViewModel *)self highlightTimeRangesProducer];
  [v4 setAsset:v3];

  id v6 = [(PUAssetViewModel *)self searchQueryMatchInfo];
  double v5 = [(PUAssetViewModel *)self highlightTimeRangesProducer];
  [v5 setSearchQueryMatchInfo:v6];
}

- (void)_invalidateHighlightTimeRangesProducer
{
}

- (void)setImageAnalysisInteraction:(id)a3
{
  double v5 = (PUImageAnalysisInteraction *)a3;
  p_imageAnalysisInteraction = &self->_imageAnalysisInteraction;
  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (imageAnalysisInteraction != v5)
  {
    Float64 v9 = v5;
    id v8 = [(PUImageAnalysisInteraction *)imageAnalysisInteraction assetViewModel];

    if (v8 == self) {
      [(PUImageAnalysisInteraction *)*p_imageAnalysisInteraction setAssetViewModel:0];
    }
    objc_storeStrong((id *)&self->_imageAnalysisInteraction, a3);
    [(PUImageAnalysisInteraction *)*p_imageAnalysisInteraction setAssetViewModel:self];
    [(PUAssetViewModel *)self _updateImageAnalysisInteractionHostView];
    double v5 = v9;
  }
}

- (void)setIrisPlayer:(id)a3
{
  double v5 = (PUBrowsingIrisPlayer *)a3;
  irisPlayer = self->_irisPlayer;
  if (irisPlayer != v5)
  {
    id v8 = v5;
    [(PUBrowsingIrisPlayer *)irisPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_irisPlayer, a3);
    [(PUBrowsingIrisPlayer *)self->_irisPlayer registerChangeObserver:self];
    id v7 = [(PUAssetViewModel *)self currentChange];
    [v7 setIrisPlayerChanged:1];

    [(PUAssetViewModel *)self _invalidateVideoPlayersLoadingAllowed];
    double v5 = v8;
  }
}

- (void)setVideoPlayer:(id)a3
{
  double v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    id v8 = v5;
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->_videoPlayer registerChangeObserver:self];
    id v7 = [(PUAssetViewModel *)self currentChange];
    [v7 setVideoPlayerDidChange:1];

    [(PUAssetViewModel *)self _invalidateMediaControllers];
    [(PUAssetViewModel *)self _invalidateVideoPlayersLoadingAllowed];
    double v5 = v8;
  }
}

- (void)_updateMediaControllers
{
  id v3 = [(PUAssetViewModel *)self asset];
  [(PUAssetViewModel *)self focusValue];
  double v5 = fabs(v4);
  BOOL v6 = v5 < 1.0 && [v3 playbackStyle] == 5;
  int v7 = 0;
  if (![(PUAssetViewModel *)self lowMemoryMode] && !v6)
  {
    id v8 = [(PUAssetViewModel *)self mediaProvider];
    if (v8)
    {
      if ([v3 canPlayPhotoIris]) {
        int v7 = 1;
      }
      else {
        int v7 = [v3 isPhotoIrisPlaceholder];
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  if (v5 >= 1.0)
  {
    int v11 = 0;
  }
  else
  {
    Float64 v9 = [(PUAssetViewModel *)self mediaProvider];
    if (v9 && [v3 isAnimatedImage])
    {
      id v10 = +[PUOneUpSettings sharedInstance];
      int v11 = [v10 allowGIFPlayback];
    }
    else
    {
      int v11 = 0;
    }
  }
  __int16 v12 = +[PUOneUpSettings sharedInstance];
  CMTime v13 = [(PUAssetViewModel *)self videoPlayer];
  if (v13)
  {
    [v12 videoPauseThreshold];
    double v15 = v5 / v14;
    double v16 = 1.0 - v15;
    BOOL v17 = v15 <= 1.0;
    double v18 = 0.0;
    if (v17) {
      double v18 = v16;
    }
    float v19 = v18;
    float v20 = v19 * v19;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke;
    v34[3] = &unk_1E5F23A88;
    id v35 = v13;
    float v38 = v20;
    id v36 = v3;
    v37 = self;
    [v35 performChanges:v34];
    [(PUAssetViewModel *)self _updateVideoPlaybackStartTime];
  }
  if (v7)
  {
    long long v21 = [(PUAssetViewModel *)self irisPlayer];

    if (!v21)
    {
      CMTime v22 = [PUBrowsingIrisPlayer alloc];
      CGPoint v23 = [(PUAssetViewModel *)self mediaProvider];
      v24 = [(PUBrowsingIrisPlayer *)v22 initWithAsset:v3 mediaProvider:v23];

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke_3;
      v32[3] = &unk_1E5F2ED10;
      v33 = v24;
      v25 = v24;
      [(PUViewModel *)v25 performChanges:v32];
      [(PUAssetViewModel *)self setIrisPlayer:v25];
    }
  }
  else
  {
    [(PUAssetViewModel *)self setIrisPlayer:0];
  }
  animatedImagePlayer = self->_animatedImagePlayer;
  if (v11)
  {
    if (!animatedImagePlayer)
    {
      v27 = [PUBrowsingAnimatedImagePlayer alloc];
      v28 = [(PUAssetViewModel *)self mediaProvider];
      v29 = [(PUBrowsingAnimatedImagePlayer *)v27 initWithAsset:v3 mediaProvider:v28];
      v30 = self->_animatedImagePlayer;
      self->_animatedImagePlayer = v29;

      [(PUViewModel *)self->_animatedImagePlayer registerChangeObserver:self];
    }
  }
  else
  {
    [(PUViewModel *)animatedImagePlayer unregisterChangeObserver:self];
    v31 = self->_animatedImagePlayer;
    self->_animatedImagePlayer = 0;
  }
}

void __43__PUAssetViewModel__updateMediaControllers__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  [*(id *)(a1 + 32) setVolume:a2];
  uint64_t v3 = [*(id *)(a1 + 40) playbackStyle];
  double v4 = *(void **)(a1 + 32);
  if (v3 == 5)
  {
    [v4 setDesiredPlayState:4 reason:@"Automatic playback of looping video"];
  }
  else if (![v4 desiredPlayState])
  {
    double v5 = *(void **)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) asset];
    if (objc_msgSend(v5, "allowAutoplayVideoForAsset:")
      && ([*(id *)(a1 + 48) isFullyInFocus] & 1) != 0)
    {
      char v6 = [*(id *)(a1 + 48) hasAutoplayedVideoSinceBecomingFocused];

      if ((v6 & 1) == 0)
      {
        [*(id *)(a1 + 48) setHasAutoplayedVideoSinceBecomingFocused:1];
        int v7 = *(void **)(a1 + 32);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke_2;
        v9[3] = &unk_1E5F2ED10;
        id v10 = v7;
        [v10 performChanges:v9];
      }
    }
    else
    {
    }
  }
}

uint64_t __43__PUAssetViewModel__updateMediaControllers__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImageLoadingEnabled:0];
}

uint64_t __43__PUAssetViewModel__updateMediaControllers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:3 reason:@"Starting auto-play of in-focus video"];
}

- (void)_invalidateMediaControllers
{
  id v2 = [(PUAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMediaControllers];
}

- (void)_updatePlayersLoadingAllowed
{
  [(PUAssetViewModel *)self focusValue];
  double v4 = fabs(v3);
  if (v4 > 0.25) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  char v6 = [(PUAssetViewModel *)self irisPlayer];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke;
  v13[3] = &unk_1E5F2D968;
  BOOL v16 = v4 > 1.1;
  id v14 = v6;
  uint64_t v15 = v5;
  id v7 = v6;
  [v7 performChanges:v13];
  id v8 = [(PUAssetViewModel *)self animatedImagePlayer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke_2;
  v10[3] = &unk_1E5F2E120;
  id v11 = v8;
  BOOL v12 = v4 > 0.25;
  id v9 = v8;
  [v9 performChanges:v10];
}

uint64_t __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLivePhotoLoadingDisabled:*(unsigned __int8 *)(a1 + 48) forReason:@"OutOfFocus"];
  uint64_t result = [*(id *)(a1 + 32) setLoadingTarget:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 unloadLivePhoto];
  }
  return result;
}

uint64_t __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAnimatedImageLoadingDisabled:*(unsigned __int8 *)(a1 + 40) forReason:@"OutOfFocus"];
  if (*(unsigned char *)(a1 + 40))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 unloadAnimatedImage];
  }
  return result;
}

- (void)_invalidateVideoPlayersLoadingAllowed
{
  id v2 = [(PUAssetViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlayersLoadingAllowed];
}

- (void)_handleDidEndScrubbing
{
  if (![(PUAssetViewModel *)self isScrubbing])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__PUAssetViewModel__handleDidEndScrubbing__block_invoke;
    v3[3] = &unk_1E5F2ED10;
    v3[4] = self;
    [(PUViewModel *)self performChanges:v3];
  }
}

uint64_t __42__PUAssetViewModel__handleDidEndScrubbing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetSyndicationStateOverride:0];
}

- (void)setIsScrubbing:(BOOL)a3
{
  if (self->_isScrubbing != a3)
  {
    self->_isScrubbing = a3;
    if (a3)
    {
      if (!self->_assetSyndicationState)
      {
        double v4 = [(PUAssetViewModel *)self assetSyndicationStateOverride];

        if (!v4)
        {
          [(PUAssetViewModel *)self setAssetSyndicationStateOverride:&unk_1F078BB58];
        }
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __35__PUAssetViewModel_setIsScrubbing___block_invoke;
      v5[3] = &unk_1E5F2E530;
      objc_copyWeak(&v6, &location);
      dispatch_async(MEMORY[0x1E4F14428], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void __35__PUAssetViewModel_setIsScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDidEndScrubbing];
}

- (void)setImportState:(int64_t)a3
{
  if (self->_importState != a3)
  {
    self->_importState = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setImportStateChanged:1];
  }
}

- (void)setSaveState:(int64_t)a3
{
  if (self->_saveState != a3)
  {
    self->_saveState = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setSaveStateChanged:1];
  }
}

- (void)setSaveProgress:(id)a3
{
  uint64_t v5 = (NSProgress *)a3;
  if (self->_saveProgress != v5)
  {
    id v7 = v5;
    kdebug_trace();
    objc_storeStrong((id *)&self->_saveProgress, a3);
    id v6 = [(PUAssetViewModel *)self currentChange];
    [v6 _setSaveProgressChanged:1];

    uint64_t v5 = v7;
  }
}

- (void)setLoadingStatus:(id)a3
{
  id v9 = (PXOperationStatus *)a3;
  double v4 = self->_loadingStatus;
  uint64_t v5 = v9;
  if (v4 != v9)
  {
    char v6 = [(PXOperationStatus *)v9 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    id v7 = (PXOperationStatus *)[(PXOperationStatus *)v9 copy];
    loadingStatus = self->_loadingStatus;
    self->_loadingStatus = v7;

    uint64_t v5 = [(PUAssetViewModel *)self currentChange];
    [v5 _setLoadingStatusChanged:1];
  }

LABEL_5:
}

- (void)_setAssetSyndicationState:(int64_t)a3
{
  if (self->_assetSyndicationState != a3)
  {
    self->_assetSyndicationState = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setAssetSyndicationStateChanged:1];
  }
}

- (void)_setFavorite:(BOOL)a3
{
  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setIsFavoriteChanged:1];
  }
}

- (BOOL)isHDR
{
  id v2 = [(PUAssetViewModel *)self asset];
  BOOL v3 = ([v2 mediaSubtypes] & 0x900202) != 0;

  return v3;
}

- (void)setAssetSyndicationStateOverride:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_assetSyndicationStateOverride = &self->_assetSyndicationStateOverride;
  if (([(NSNumber *)self->_assetSyndicationStateOverride isEqual:v5] & 1) == 0)
  {
    if (!v5)
    {
      id v9 = *p_assetSyndicationStateOverride;
      *p_assetSyndicationStateOverride = 0;

      uint64_t v8 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = [v5 integerValue];
    if ((unint64_t)(v7 - 1) < 4)
    {
      objc_storeStrong((id *)&self->_assetSyndicationStateOverride, a3);
      uint64_t v8 = [v5 integerValue];
LABEL_6:
      [(PUAssetViewModel *)self _setAssetSyndicationState:v8];
      goto LABEL_10;
    }
    uint64_t v10 = v7;
    id v11 = PXAssertGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      uint64_t v13 = v10;
      _os_log_error_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "PUAssetViewModel syndication state override is not valid: %ld", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_10:
}

- (void)setIsFavoriteOverride:(id)a3
{
  double v4 = (NSNumber *)a3;
  isFavoriteOverride = self->_isFavoriteOverride;
  if (isFavoriteOverride != v4 && ([(NSNumber *)isFavoriteOverride isEqual:v4] & 1) == 0)
  {
    char v6 = (NSNumber *)[(NSNumber *)v4 copy];
    uint64_t v7 = self->_isFavoriteOverride;
    self->_isFavoriteOverride = v6;

    [(PUAssetViewModel *)self _updateFavoriteState];
    uint64_t v8 = (void *)([(PUAssetViewModel *)self _currentFavoriteOverrideRequest] + 1);
    [(PUAssetViewModel *)self _setCurrentFavoriteOverrideRequest:v8];
    objc_initWeak(&location, self);
    dispatch_time_t v9 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke;
    block[3] = &unk_1E5F2B980;
    objc_copyWeak(v11, &location);
    v11[1] = v8;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _currentFavoriteOverrideRequest] == *(void *)(a1 + 40))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke_2;
    v3[3] = &unk_1E5F2ED10;
    id v4 = WeakRetained;
    [v4 performChanges:v3];
  }
}

uint64_t __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsFavoriteOverride:0];
}

- (void)setBadgeInfoPromise:(id)a3
{
  id v4 = (PUBadgeInfoPromise *)a3;
  id v5 = v4;
  if (self->_badgeInfoPromise != v4)
  {
    uint64_t v10 = v4;
    BOOL v6 = -[PUBadgeInfoPromise isEqual:](v4, "isEqual:");
    id v5 = v10;
    if (!v6)
    {
      uint64_t v7 = (PUBadgeInfoPromise *)[(PUBadgeInfoPromise *)v10 copy];
      badgeInfoPromise = self->_badgeInfoPromise;
      self->_badgeInfoPromise = v7;

      dispatch_time_t v9 = [(PUAssetViewModel *)self currentChange];
      [v9 _setBadgeInfoChanged:1];

      id v5 = v10;
    }
  }
}

- (void)setIsFullyOutOfFocus:(BOOL)a3
{
  if (self->_isFullyOutOfFocus != a3)
  {
    self->_isFullyOutOfFocus = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 setIsFullyOutOfFocusChanged:1];
  }
}

- (void)setIsFullyInFocus:(BOOL)a3
{
  if (self->_isFullyInFocus != a3)
  {
    self->_isFullyInFocus = a3;
    if (!a3) {
      [(PUAssetViewModel *)self setHasAutoplayedVideoSinceBecomingFocused:0];
    }
    id v4 = [(PUAssetViewModel *)self currentChange];
    [v4 setIsFullyInFocusChanged:1];
  }
}

- (void)setFocusValue:(double)a3
{
  if (self->_focusValue == a3) {
    return;
  }
  self->_focusValue = a3;
  id v5 = [(PUAssetViewModel *)self currentChange];
  [v5 _setFocusValueChanged:1];

  double v6 = fabs(a3);
  [(PUAssetViewModel *)self setIsFullyInFocus:v6 <= 0.01];
  [(PUAssetViewModel *)self setIsFullyOutOfFocus:v6 >= 0.9];
  uint64_t v7 = [(PUAssetViewModel *)self irisPlayer];
  uint64_t v8 = v7;
  if (v6 >= 0.5 && v7 != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__PUAssetViewModel_setFocusValue___block_invoke;
    v12[3] = &unk_1E5F2ED10;
    id v13 = v7;
    [v13 performChanges:v12];
  }
  if (a3 == 0.0)
  {
    [(PUAssetViewModel *)self focusValueAtZeroTimestamp];
    if (v10 == 0.0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
LABEL_11:
      [(PUAssetViewModel *)self setFocusValueAtZeroTimestamp:Current];
      goto LABEL_12;
    }
  }
  double Current = 0.0;
  if (v6 > 0.75) {
    goto LABEL_11;
  }
LABEL_12:
  [(PUAssetViewModel *)self _invalidateVideoPlayersLoadingAllowed];
  [(PUAssetViewModel *)self _invalidateMediaControllers];
  if (v6 > 1.0)
  {
    [(PUAssetViewModel *)self setVisualImageAnalysis:0];
    [(PUAssetViewModel *)self setBestImage:0];
  }
}

uint64_t __34__PUAssetViewModel_setFocusValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:0];
}

- (void)setUserTransformingTile:(BOOL)a3
{
  if (self->_isUserTransformingTile != a3)
  {
    self->_isUserTransformingTile = a3;
    id v3 = [(PUAssetViewModel *)self currentChange];
    [v3 _setUserTransformingTileDidChange:1];
  }
}

- (void)setMediaProvider:(id)a3
{
  id v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    double v6 = [(PUAssetViewModel *)self currentChange];
    [v6 setHasChanges];

    [(PUAssetViewModel *)self _invalidateMediaControllers];
    id v5 = v7;
  }
}

- (void)setAsset:(id)a3
{
  id v5 = (PUDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    uint64_t v7 = asset;
    uint64_t v8 = [(PUDisplayAsset *)v5 isContentEqualTo:v7];
    if (!v8) {
      uint64_t v8 = [(PUDisplayAsset *)v7 isContentEqualTo:v5];
    }

    if (v8 != 2)
    {
      dispatch_time_t v9 = [(PUAssetViewModel *)self currentChange];
      [v9 _setAssetContentChanged:1];
    }
    objc_storeStrong((id *)&self->_asset, a3);
    double v10 = [(PUAssetViewModel *)self currentChange];
    [v10 _setAssetChanged:1];

    [(PUAssetViewModel *)self setIsFavoriteOverride:0];
    [(PUAssetViewModel *)self _updateFavoriteState];
    [(PUAssetViewModel *)self setAssetSyndicationStateOverride:0];
    [(PUAssetViewModel *)self _invalidateMediaControllers];
    id v11 = [(PUAssetViewModel *)self videoPlayer];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __29__PUAssetViewModel_setAsset___block_invoke;
    v28[3] = &unk_1E5F2ECC8;
    id v29 = v11;
    int v12 = v5;
    v30 = v12;
    id v13 = v11;
    [v13 performChanges:v28];
    uint64_t v14 = [(PUAssetViewModel *)self irisPlayer];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __29__PUAssetViewModel_setAsset___block_invoke_2;
    v25[3] = &unk_1E5F2ECC8;
    id v26 = v14;
    uint64_t v15 = v12;
    v27 = v15;
    id v16 = v14;
    [v16 performChanges:v25];
    BOOL v17 = [(PUAssetViewModel *)self animatedImagePlayer];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    long long v21 = __29__PUAssetViewModel_setAsset___block_invoke_3;
    CMTime v22 = &unk_1E5F2ECC8;
    id v23 = v17;
    v24 = v15;
    id v18 = v17;
    [v18 performChanges:&v19];
    [(PUAssetViewModel *)self _invalidateHighlightTimeRangesProducer];
  }
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAsset:*(void *)(a1 + 40)];
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAsset:*(void *)(a1 + 40)];
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAsset:*(void *)(a1 + 40)];
}

- (void)unregisterChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  [(PUViewModel *)&v3 unregisterChangeObserver:a3];
}

- (void)registerChangeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  [(PUViewModel *)&v3 registerChangeObserver:a3];
}

- (void)didPerformChanges
{
  v5.receiver = self;
  v5.super_class = (Class)PUAssetViewModel;
  [(PUViewModel *)&v5 didPerformChanges];
  objc_super v3 = [(PUAssetViewModel *)self updater];
  [v3 updateIfNeeded];

  id v4 = [(PUAssetViewModel *)self currentChangeIfExists];
  if ([v4 contentOffsetChanged])
  {
    [(PUAssetViewModel *)self contentOffset];
    kdebug_trace();
  }
}

- (PUAssetViewModelChange)currentChangeIfExists
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetViewModel;
  id v2 = [(PUViewModel *)&v4 currentChangeIfExists];
  return (PUAssetViewModelChange *)v2;
}

- (PUAssetViewModelChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetViewModel;
  id v2 = [(PUViewModel *)&v4 currentChange];
  return (PUAssetViewModelChange *)v2;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUAssetViewModelChange);
}

- (BOOL)allowAutoplayVideoForAsset:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PUAssetViewModel *)self videoAutoplayPredicate];

  if (v5)
  {
    double v6 = [(PUAssetViewModel *)self videoAutoplayPredicate];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    double v6 = +[PUOneUpSettings sharedInstance];
    char v7 = [v6 allowAutoplayVideoForAsset:v4];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)setVideoAutoplayPredicate:(id)a3
{
  if (self->_videoAutoplayPredicate != a3)
  {
    id v4 = _Block_copy(a3);
    id videoAutoplayPredicate = self->_videoAutoplayPredicate;
    self->_id videoAutoplayPredicate = v4;

    [(PUAssetViewModel *)self _updateMediaControllers];
  }
}

- (void)dealloc
{
  PXDeferredDealloc();
  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  [(PUAssetViewModel *)&v3 dealloc];
}

- (PUAssetViewModel)initWithLowMemoryMode:(BOOL)a3 mediaAnalyzer:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PUAssetViewModel;
  char v7 = [(PUViewModel *)&v22 init];
  BOOL v8 = v7;
  if (v7)
  {
    v7->_isZoomedIn = 0;
    dispatch_time_t v9 = [[PUModelTileTransform alloc] initWithNoUserInput];
    modelTileTransform = v8->_modelTileTransform;
    v8->_modelTileTransform = v9;

    v8->_focusValue = 1.79769313e308;
    v8->_lowMemoryMode = a3;
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    registeredVideoLayerSources = v8->_registeredVideoLayerSources;
    v8->_registeredVideoLayerSources = (NSHashTable *)v11;

    highlightTimeRanges = v8->_highlightTimeRanges;
    v8->_highlightTimeRanges = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (!v6)
    {
      uint64_t v14 = +[PUOneUpSettings sharedInstance];
      int v15 = [v14 insertDummyHighlightTimeRanges];

      if (v15) {
        id v16 = (id)[objc_alloc(MEMORY[0x1E4F903F0]) initWithTimeRangeProvider:&__block_literal_global_12604];
      }
      else {
        id v16 = objc_alloc_init(MEMORY[0x1E4F907E8]);
      }
      id v6 = v16;
    }
    BOOL v17 = [[PUAssetHighlightTimeRangesProducer alloc] initWithMediaAnalyzer:v6];
    highlightTimeRangesProducer = v8->_highlightTimeRangesProducer;
    v8->_highlightTimeRangesProducer = v17;

    [(PUAssetHighlightTimeRangesProducer *)v8->_highlightTimeRangesProducer setDelegate:v8];
    v8->_imageAnalysisInteractionHostMode = 1;
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v8];
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v19;

    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateHighlightTimeRangesProducer needsUpdate:1];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateShouldShowHighlightTimeRanges needsUpdate:1];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateMediaControllers];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updatePlayersLoadingAllowed];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateAccessoryViewVisibilityFraction];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateInteractionHostMode needsUpdate:1];
  }

  return v8;
}

id __56__PUAssetViewModel_initWithLowMemoryMode_mediaAnalyzer___block_invoke(double a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  memset(&v8, 0, sizeof(v8));
  CMTimeMakeWithSeconds(&v8, a1 * 0.33, 600);
  v1 = (void *)MEMORY[0x1E4F29238];
  CMTime start = v8;
  CMTime v5 = v8;
  CMTimeRangeMake(&v7, &start, &v5);
  id v2 = [v1 valueWithCMTimeRange:&v7];
  v9[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v3;
}

- (PUAssetViewModel)initWithMediaAnalyzer:(id)a3
{
  return [(PUAssetViewModel *)self initWithLowMemoryMode:0 mediaAnalyzer:a3];
}

- (PUAssetViewModel)initWithLowMemoryMode:(BOOL)a3
{
  return [(PUAssetViewModel *)self initWithLowMemoryMode:a3 mediaAnalyzer:0];
}

- (PUAssetViewModel)init
{
  return [(PUAssetViewModel *)self initWithLowMemoryMode:0];
}

+ (int64_t)imageAnalysisInteractionHostModeForAccessoryViewVisibility:(BOOL)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

@end