@interface PUAssetViewModelChange
- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged;
- (BOOL)accessoryViewVisibilityChanged;
- (BOOL)accessoryViewVisibilityFractionChanged;
- (BOOL)assetChanged;
- (BOOL)assetContentChanged;
- (BOOL)assetSyndicationStateChanged;
- (BOOL)badgeInfoChanged;
- (BOOL)bestImageChanged;
- (BOOL)contentOffsetChanged;
- (BOOL)focusValueChanged;
- (BOOL)forceBadgesVisibleChanged;
- (BOOL)hasChanges;
- (BOOL)highlightTimeRangesChanged;
- (BOOL)importStateChanged;
- (BOOL)irisPlayerChanged;
- (BOOL)isBeingDismissedChanged;
- (BOOL)isDisplayingSearchQueryLabelChanged;
- (BOOL)isFavoriteChanged;
- (BOOL)isFullyInFocusChanged;
- (BOOL)isFullyOutOfFocusChanged;
- (BOOL)isInEditModeChanged;
- (BOOL)isIrisPlayingChanged;
- (BOOL)isPresentedForPreviewChanged;
- (BOOL)isUpdatingDisplayedContentChanged;
- (BOOL)isUserTransformingTileDidChange;
- (BOOL)isVisualSearchCardShowingChanged;
- (BOOL)isZoomedInChanged;
- (BOOL)loadingStatusChanged;
- (BOOL)mainImageContentsRectChanged;
- (BOOL)modelTileTransformChanged;
- (BOOL)needsResetVisualImageInteractionChanged;
- (BOOL)revealsGainMapImageChanged;
- (BOOL)saveProgressChanged;
- (BOOL)saveStateChanged;
- (BOOL)shouldShowHighlightTimeRangesChanged;
- (BOOL)statusCornerStateChanged;
- (BOOL)videoPlayerDidChange;
- (BOOL)visualImageAnalysisChanged;
- (BOOL)visualIntelligenceAnalyzeRequestIDChanged;
- (PUBrowsingAnimatedImagePlayerChange)animatedImageChange;
- (PUBrowsingIrisPlayerChange)irisPlayerChange;
- (PUBrowsingVideoPlayerChange)videoPlayerChange;
- (void)_setAccessoryViewVisibilityChanged:(BOOL)a3;
- (void)_setAnimatedImageChange:(id)a3;
- (void)_setAssetChanged:(BOOL)a3;
- (void)_setAssetContentChanged:(BOOL)a3;
- (void)_setBadgeInfoChanged:(BOOL)a3;
- (void)_setBestImageChanged:(BOOL)a3;
- (void)_setContentOffsetChanged:(BOOL)a3;
- (void)_setFocusValueChanged:(BOOL)a3;
- (void)_setForceBadgesVisibleChanged:(BOOL)a3;
- (void)_setImportStateChanged:(BOOL)a3;
- (void)_setIrisPlayerChange:(id)a3;
- (void)_setIsBeingDismissedChanged:(BOOL)a3;
- (void)_setIsFavoriteChanged:(BOOL)a3;
- (void)_setIsInEditModeChanged:(BOOL)a3;
- (void)_setIsIrisPlayingChanged:(BOOL)a3;
- (void)_setIsPresentedForPreviewChanged:(BOOL)a3;
- (void)_setIsUpdatingDisplayedContentChanged:(BOOL)a3;
- (void)_setIsVisualSearchCardShowingChanged:(BOOL)a3;
- (void)_setLoadingStatusChanged:(BOOL)a3;
- (void)_setModelTileTransformChanged:(BOOL)a3;
- (void)_setSaveProgressChanged:(BOOL)a3;
- (void)_setSaveStateChanged:(BOOL)a3;
- (void)_setUserTransformingTileDidChange:(BOOL)a3;
- (void)_setVideoPlayerChange:(id)a3;
- (void)_setVisualImageAnalysisChanged:(BOOL)a3;
- (void)setAccessoryViewVisibilityFractionChanged:(BOOL)a3;
- (void)setAssetSyndicationStateChanged:(BOOL)a3;
- (void)setHighlightTimeRangesChanged:(BOOL)a3;
- (void)setIrisPlayerChanged:(BOOL)a3;
- (void)setIsDisplayingSearchQueryLabelChanged:(BOOL)a3;
- (void)setIsFullyInFocusChanged:(BOOL)a3;
- (void)setIsFullyOutOfFocusChanged:(BOOL)a3;
- (void)setIsZoomedInChanged:(BOOL)a3;
- (void)setMainImageContentsRectChanged:(BOOL)a3;
- (void)setNeedsResetVisualImageInteractionChanged:(BOOL)a3;
- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged:(BOOL)a3;
- (void)setRevealsGainMapImageChanged:(BOOL)a3;
- (void)setShouldShowHighlightTimeRangesChanged:(BOOL)a3;
- (void)setStatusCornerStateChanged:(BOOL)a3;
- (void)setVideoPlayerDidChange:(BOOL)a3;
- (void)setVisualIntelligenceAnalyzeRequestIDChanged:(BOOL)a3;
@end

@implementation PUAssetViewModelChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageChange, 0);
  objc_storeStrong((id *)&self->_irisPlayerChange, 0);
  objc_storeStrong((id *)&self->_videoPlayerChange, 0);
}

- (void)setMainImageContentsRectChanged:(BOOL)a3
{
  self->_mainImageContentsRectChanged = a3;
}

- (BOOL)mainImageContentsRectChanged
{
  return self->_mainImageContentsRectChanged;
}

- (void)setAccessoryViewVisibilityFractionChanged:(BOOL)a3
{
  self->_accessoryViewVisibilityFractionChanged = a3;
}

- (BOOL)accessoryViewVisibilityFractionChanged
{
  return self->_accessoryViewVisibilityFractionChanged;
}

- (void)setIsZoomedInChanged:(BOOL)a3
{
  self->_isZoomedInChanged = a3;
}

- (BOOL)isZoomedInChanged
{
  return self->_isZoomedInChanged;
}

- (void)setIsFullyOutOfFocusChanged:(BOOL)a3
{
  self->_isFullyOutOfFocusChanged = a3;
}

- (BOOL)isFullyOutOfFocusChanged
{
  return self->_isFullyOutOfFocusChanged;
}

- (void)setIsFullyInFocusChanged:(BOOL)a3
{
  self->_isFullyInFocusChanged = a3;
}

- (BOOL)isFullyInFocusChanged
{
  return self->_isFullyInFocusChanged;
}

- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged:(BOOL)a3
{
  self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged = a3;
}

- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged
{
  return self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged;
}

- (void)setVisualIntelligenceAnalyzeRequestIDChanged:(BOOL)a3
{
  self->_visualIntelligenceAnalyzeRequestIDChanged = a3;
}

- (BOOL)visualIntelligenceAnalyzeRequestIDChanged
{
  return self->_visualIntelligenceAnalyzeRequestIDChanged;
}

- (void)setIsDisplayingSearchQueryLabelChanged:(BOOL)a3
{
  self->_isDisplayingSearchQueryLabelChanged = a3;
}

- (BOOL)isDisplayingSearchQueryLabelChanged
{
  return self->_isDisplayingSearchQueryLabelChanged;
}

- (void)setNeedsResetVisualImageInteractionChanged:(BOOL)a3
{
  self->_needsResetVisualImageInteractionChanged = a3;
}

- (BOOL)needsResetVisualImageInteractionChanged
{
  return self->_needsResetVisualImageInteractionChanged;
}

- (void)setShouldShowHighlightTimeRangesChanged:(BOOL)a3
{
  self->_shouldShowHighlightTimeRangesChanged = a3;
}

- (BOOL)shouldShowHighlightTimeRangesChanged
{
  return self->_shouldShowHighlightTimeRangesChanged;
}

- (void)setHighlightTimeRangesChanged:(BOOL)a3
{
  self->_highlightTimeRangesChanged = a3;
}

- (BOOL)highlightTimeRangesChanged
{
  return self->_highlightTimeRangesChanged;
}

- (void)setIrisPlayerChanged:(BOOL)a3
{
  self->_irisPlayerChanged = a3;
}

- (BOOL)irisPlayerChanged
{
  return self->_irisPlayerChanged;
}

- (void)setVideoPlayerDidChange:(BOOL)a3
{
  self->_videoPlayerDidChange = a3;
}

- (BOOL)videoPlayerDidChange
{
  return self->_videoPlayerDidChange;
}

- (void)_setBestImageChanged:(BOOL)a3
{
  self->_bestImageChanged = a3;
}

- (BOOL)bestImageChanged
{
  return self->_bestImageChanged;
}

- (void)setStatusCornerStateChanged:(BOOL)a3
{
  self->_statusCornerStateChanged = a3;
}

- (BOOL)statusCornerStateChanged
{
  return self->_statusCornerStateChanged;
}

- (void)_setIsVisualSearchCardShowingChanged:(BOOL)a3
{
  self->_isVisualSearchCardShowingChanged = a3;
}

- (BOOL)isVisualSearchCardShowingChanged
{
  return self->_isVisualSearchCardShowingChanged;
}

- (void)_setIsIrisPlayingChanged:(BOOL)a3
{
  self->_isIrisPlayingChanged = a3;
}

- (BOOL)isIrisPlayingChanged
{
  return self->_isIrisPlayingChanged;
}

- (void)_setIsBeingDismissedChanged:(BOOL)a3
{
  self->_isBeingDismissedChanged = a3;
}

- (BOOL)isBeingDismissedChanged
{
  return self->_isBeingDismissedChanged;
}

- (void)_setVisualImageAnalysisChanged:(BOOL)a3
{
  self->_visualImageAnalysisChanged = a3;
}

- (BOOL)visualImageAnalysisChanged
{
  return self->_visualImageAnalysisChanged;
}

- (void)_setIsPresentedForPreviewChanged:(BOOL)a3
{
  self->_isPresentedForPreviewChanged = a3;
}

- (BOOL)isPresentedForPreviewChanged
{
  return self->_isPresentedForPreviewChanged;
}

- (void)setRevealsGainMapImageChanged:(BOOL)a3
{
  self->_revealsGainMapImageChanged = a3;
}

- (BOOL)revealsGainMapImageChanged
{
  return self->_revealsGainMapImageChanged;
}

- (void)_setIsInEditModeChanged:(BOOL)a3
{
  self->_isInEditModeChanged = a3;
}

- (BOOL)isInEditModeChanged
{
  return self->_isInEditModeChanged;
}

- (void)_setContentOffsetChanged:(BOOL)a3
{
  self->_contentOffsetChanged = a3;
}

- (BOOL)contentOffsetChanged
{
  return self->_contentOffsetChanged;
}

- (void)_setAccessoryViewVisibilityChanged:(BOOL)a3
{
  self->_accessoryViewVisibilityChanged = a3;
}

- (BOOL)accessoryViewVisibilityChanged
{
  return self->_accessoryViewVisibilityChanged;
}

- (void)setAssetSyndicationStateChanged:(BOOL)a3
{
  self->_assetSyndicationStateChanged = a3;
}

- (BOOL)assetSyndicationStateChanged
{
  return self->_assetSyndicationStateChanged;
}

- (void)_setIsFavoriteChanged:(BOOL)a3
{
  self->_isFavoriteChanged = a3;
}

- (BOOL)isFavoriteChanged
{
  return self->_isFavoriteChanged;
}

- (void)_setIsUpdatingDisplayedContentChanged:(BOOL)a3
{
  self->_isUpdatingDisplayedContentChanged = a3;
}

- (BOOL)isUpdatingDisplayedContentChanged
{
  return self->_isUpdatingDisplayedContentChanged;
}

- (void)_setAnimatedImageChange:(id)a3
{
}

- (PUBrowsingAnimatedImagePlayerChange)animatedImageChange
{
  return self->_animatedImageChange;
}

- (void)_setBadgeInfoChanged:(BOOL)a3
{
  self->_badgeInfoChanged = a3;
}

- (BOOL)badgeInfoChanged
{
  return self->_badgeInfoChanged;
}

- (void)_setIrisPlayerChange:(id)a3
{
}

- (PUBrowsingIrisPlayerChange)irisPlayerChange
{
  return self->_irisPlayerChange;
}

- (void)_setForceBadgesVisibleChanged:(BOOL)a3
{
  self->_forceBadgesVisibleChanged = a3;
}

- (BOOL)forceBadgesVisibleChanged
{
  return self->_forceBadgesVisibleChanged;
}

- (void)_setVideoPlayerChange:(id)a3
{
}

- (PUBrowsingVideoPlayerChange)videoPlayerChange
{
  return self->_videoPlayerChange;
}

- (void)_setImportStateChanged:(BOOL)a3
{
  self->_importStateChanged = a3;
}

- (BOOL)importStateChanged
{
  return self->_importStateChanged;
}

- (void)_setSaveStateChanged:(BOOL)a3
{
  self->_saveStateChanged = a3;
}

- (BOOL)saveStateChanged
{
  return self->_saveStateChanged;
}

- (void)_setSaveProgressChanged:(BOOL)a3
{
  self->_saveProgressChanged = a3;
}

- (BOOL)saveProgressChanged
{
  return self->_saveProgressChanged;
}

- (void)_setLoadingStatusChanged:(BOOL)a3
{
  self->_loadingStatusChanged = a3;
}

- (BOOL)loadingStatusChanged
{
  return self->_loadingStatusChanged;
}

- (void)_setFocusValueChanged:(BOOL)a3
{
  self->_focusValueChanged = a3;
}

- (BOOL)focusValueChanged
{
  return self->_focusValueChanged;
}

- (void)_setUserTransformingTileDidChange:(BOOL)a3
{
  self->_isUserTransformingTileDidChange = a3;
}

- (BOOL)isUserTransformingTileDidChange
{
  return self->_isUserTransformingTileDidChange;
}

- (void)_setModelTileTransformChanged:(BOOL)a3
{
  self->_modelTileTransformChanged = a3;
}

- (BOOL)modelTileTransformChanged
{
  return self->_modelTileTransformChanged;
}

- (void)_setAssetContentChanged:(BOOL)a3
{
  self->_assetContentChanged = a3;
}

- (BOOL)assetContentChanged
{
  return self->_assetContentChanged;
}

- (void)_setAssetChanged:(BOOL)a3
{
  self->_assetChanged = a3;
}

- (BOOL)assetChanged
{
  return self->_assetChanged;
}

- (BOOL)hasChanges
{
  v7.receiver = self;
  v7.super_class = (Class)PUAssetViewModelChange;
  if ([(PUViewModelChange *)&v7 hasChanges]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self assetChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self assetContentChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self modelTileTransformChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self isUserTransformingTileDidChange]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self focusValueChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self loadingStatusChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self saveProgressChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self saveStateChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self importStateChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self isUpdatingDisplayedContentChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self isFavoriteChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self assetSyndicationStateChanged]) {
    return 1;
  }
  v3 = [(PUAssetViewModelChange *)self videoPlayerChange];

  if (v3) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self forceBadgesVisibleChanged]) {
    return 1;
  }
  v4 = [(PUAssetViewModelChange *)self irisPlayerChange];

  if (v4) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self badgeInfoChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self accessoryViewVisibilityChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self contentOffsetChanged]) {
    return 1;
  }
  if ([(PUAssetViewModelChange *)self isInEditModeChanged]) {
    return 1;
  }
  v5 = [(PUAssetViewModelChange *)self animatedImageChange];

  return v5
      || [(PUAssetViewModelChange *)self revealsGainMapImageChanged]
      || [(PUAssetViewModelChange *)self isPresentedForPreviewChanged]
      || [(PUAssetViewModelChange *)self visualImageAnalysisChanged]
      || [(PUAssetViewModelChange *)self isBeingDismissedChanged]
      || [(PUAssetViewModelChange *)self isIrisPlayingChanged]
      || [(PUAssetViewModelChange *)self isVisualSearchCardShowingChanged]
      || [(PUAssetViewModelChange *)self statusCornerStateChanged]
      || [(PUAssetViewModelChange *)self bestImageChanged]
      || [(PUAssetViewModelChange *)self videoPlayerDidChange]
      || [(PUAssetViewModelChange *)self irisPlayerChanged]
      || [(PUAssetViewModelChange *)self highlightTimeRangesChanged]
      || [(PUAssetViewModelChange *)self needsResetVisualImageInteractionChanged]|| [(PUAssetViewModelChange *)self PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged]|| [(PUAssetViewModelChange *)self isDisplayingSearchQueryLabelChanged]|| [(PUAssetViewModelChange *)self visualIntelligenceAnalyzeRequestIDChanged]|| [(PUAssetViewModelChange *)self isFullyInFocusChanged]|| [(PUAssetViewModelChange *)self isZoomedInChanged]|| [(PUAssetViewModelChange *)self isFullyOutOfFocusChanged]|| [(PUAssetViewModelChange *)self accessoryViewVisibilityFractionChanged]|| [(PUAssetViewModelChange *)self mainImageContentsRectChanged];
}

@end