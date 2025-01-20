@interface PUScrubberView
- (BOOL)_allowExitFromContentScrubbing;
- (BOOL)_areLayoutTransitionsDisabled;
- (BOOL)_isContentScrubbing;
- (BOOL)_isDrivingPlayheadProgress;
- (BOOL)_isHandlingScrollViewWillEndDragging;
- (BOOL)_isHandlingUserScroll;
- (BOOL)_isLibraryScrubbing;
- (BOOL)_isScrubbingAwayFromContentEdge;
- (BOOL)_scrollViewSettled;
- (BOOL)_snapToExpandedItem;
- (BOOL)_useLoupe;
- (BOOL)_useSmoothingTransitionCoordinator;
- (BOOL)canExpandCurrentAsset;
- (BOOL)currentDragBeganOnContent;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)layout:(id)a3 isItemAtAtIndexPathSelected:(id)a4;
- (BOOL)layout:(id)a3 shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a4;
- (BOOL)playbackTimeIndicatorTileViewControllerCanFlashIndicator:(id)a3;
- (BOOL)useEmbeddedVideoScrubber;
- (BOOL)useThinLoupe;
- (CGPoint)_decelerationTargetOffset;
- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4;
- (NSIndexPath)_decelerationTargetIndexPath;
- (NSNumber)loupeAspectRatio;
- (PUBrowsingSession)browsingSession;
- (PUScrubberTilingLayout)_scrubberLayout;
- (PUScrubberView)initWithFrame:(CGRect)a3;
- (PUScrubberViewDelegate)delegate;
- (PUTilingView)_tilingView;
- (PXSectionedSelectionManager)selectionManager;
- (PXVideoScrubberController)_videoScrubberController;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (double)_decelerationDistance;
- (double)_expandedItemWidth;
- (double)_lengthForDuration:(double)a3;
- (double)_playheadProgressForIrisAssetReference:(id)a3;
- (double)_scrubbingTransitionProgress;
- (double)embeddedVideoScrubberWidthFraction;
- (double)interItemSpacing;
- (double)interSectionSpacing;
- (double)itemCornerRadius;
- (double)slitAspectRatio;
- (double)topOutset;
- (float)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4;
- (id)_currentAssetsDataSource;
- (id)_expandedAssetReference;
- (id)_newScrubberLayoutWithDataSource:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5;
- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4;
- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6;
- (int64_t)_expandedItemType;
- (int64_t)_layoutTransitionsDisabledCount;
- (int64_t)type;
- (void)_disableLayoutTransitionsForDuration:(double)a3;
- (void)_endScrubbing;
- (void)_handleTap:(id)a3;
- (void)_handleTapOnBrowsingIrisPlayer:(id)a3;
- (void)_handleTapOnBrowsingVideoPlayer:(id)a3;
- (void)_handleUserScrollWillBegin:(BOOL)a3;
- (void)_invalidateLoupeEffect;
- (void)_invalidateScrubberLayout;
- (void)_invalidateScrubberLayoutEnsureTransition;
- (void)_invalidateSnapToExpandedItem;
- (void)_reenableLayoutTransitions;
- (void)_setDecelerationDistance:(double)a3;
- (void)_setDecelerationTargetIndexPath:(id)a3;
- (void)_setDecelerationTargetOffset:(CGPoint)a3;
- (void)_setExpandedItemType:(int64_t)a3;
- (void)_setHandlingScrollViewWillEndDragging:(BOOL)a3;
- (void)_setIsHandlingUserScroll:(BOOL)a3;
- (void)_setLayoutTransitionsDisabledCount:(int64_t)a3;
- (void)_setScrollViewSettled:(BOOL)a3;
- (void)_setScrubberLayout:(id)a3;
- (void)_setScrubbingAwayFromContentEdge:(BOOL)a3;
- (void)_setScrubbingTransitionProgress:(double)a3;
- (void)_setSnapToExpandedItem:(BOOL)a3;
- (void)_setTilingView:(id)a3;
- (void)_setUseLoupe:(BOOL)a3;
- (void)_setUseSmoothingTransitionCoordinator:(BOOL)a3;
- (void)_setVideoScrubberController:(id)a3;
- (void)_updateLoupeEffectIfNeeded;
- (void)_updateScrollPositionAnimated:(BOOL)a3;
- (void)_updateScrubberLayoutIfNeeded;
- (void)_updateScrubbingAwayFromContentEdgeBeganDragging:(BOOL)a3;
- (void)_updateSnapToExpandedItemIfNeeded;
- (void)_updateTilingViewIfNeeded;
- (void)beginPreviewing;
- (void)cancelDeceleration;
- (void)dealloc;
- (void)endPreviewing;
- (void)handleTouchGesture:(id)a3;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBrowsingSession:(id)a3;
- (void)setCanExpandCurrentAsset:(BOOL)a3;
- (void)setCurrentDragBeganOnContent:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEmbeddedVideoScrubberWidthFraction:(double)a3;
- (void)setInterItemSpacing:(double)a3;
- (void)setInterSectionSpacing:(double)a3;
- (void)setItemCornerRadius:(double)a3;
- (void)setLoupeAspectRatio:(id)a3;
- (void)setSelectionManager:(id)a3;
- (void)setSlitAspectRatio:(double)a3;
- (void)setTopOutset:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUseEmbeddedVideoScrubber:(BOOL)a3;
- (void)setUseThinLoupe:(BOOL)a3;
- (void)updateIfNeeded;
- (void)videoScrubberController:(id)a3 desiredSeekTime:(id *)a4;
- (void)videoScrubberControllerDidUpdate:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUScrubberView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->__decelerationTargetIndexPath, 0);
  objc_storeStrong((id *)&self->__videoScrubberController, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->__scrubberLayout, 0);
  objc_storeStrong((id *)&self->_loupeAspectRatio, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_aspectRatioByIndexPath, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transitionLayoutIdentifier, 0);
  objc_storeStrong((id *)&self->_contentScrubbingIdentifier, 0);
  objc_storeStrong((id *)&self->_scrubbingIdentifier, 0);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setCurrentDragBeganOnContent:(BOOL)a3
{
  self->_currentDragBeganOnContent = a3;
}

- (BOOL)currentDragBeganOnContent
{
  return self->_currentDragBeganOnContent;
}

- (BOOL)_isHandlingScrollViewWillEndDragging
{
  return self->__isHandlingScrollViewWillEndDragging;
}

- (void)_setScrubbingTransitionProgress:(double)a3
{
  self->__scrubbingTransitionProgress = a3;
}

- (double)_scrubbingTransitionProgress
{
  return self->__scrubbingTransitionProgress;
}

- (void)_setLayoutTransitionsDisabledCount:(int64_t)a3
{
  self->__layoutTransitionsDisabledCount = a3;
}

- (int64_t)_layoutTransitionsDisabledCount
{
  return self->__layoutTransitionsDisabledCount;
}

- (void)_setDecelerationDistance:(double)a3
{
  self->__decelerationDistance = a3;
}

- (double)_decelerationDistance
{
  return self->__decelerationDistance;
}

- (void)_setDecelerationTargetOffset:(CGPoint)a3
{
  self->__decelerationTargetOffset = a3;
}

- (CGPoint)_decelerationTargetOffset
{
  double x = self->__decelerationTargetOffset.x;
  double y = self->__decelerationTargetOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSIndexPath)_decelerationTargetIndexPath
{
  return self->__decelerationTargetIndexPath;
}

- (BOOL)_snapToExpandedItem
{
  return self->__snapToExpandedItem;
}

- (void)_setUseSmoothingTransitionCoordinator:(BOOL)a3
{
  self->__useSmoothingTransitionCoordinator = a3;
}

- (BOOL)_useSmoothingTransitionCoordinator
{
  return self->__useSmoothingTransitionCoordinator;
}

- (BOOL)useThinLoupe
{
  return self->_useThinLoupe;
}

- (BOOL)_useLoupe
{
  return self->__useLoupe;
}

- (void)_setScrollViewSettled:(BOOL)a3
{
  self->__scrollViewSettled = a3;
}

- (BOOL)_scrollViewSettled
{
  return self->__scrollViewSettled;
}

- (BOOL)_isScrubbingAwayFromContentEdge
{
  return self->__isScrubbingAwayFromContentEdge;
}

- (void)_setIsHandlingUserScroll:(BOOL)a3
{
  self->__isHandlingUserScroll = a3;
}

- (BOOL)_isHandlingUserScroll
{
  return self->__isHandlingUserScroll;
}

- (void)_setExpandedItemType:(int64_t)a3
{
  self->__expandedItemType = a3;
}

- (int64_t)_expandedItemType
{
  return self->__expandedItemType;
}

- (PXVideoScrubberController)_videoScrubberController
{
  return self->__videoScrubberController;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (void)_setScrubberLayout:(id)a3
{
}

- (PUScrubberTilingLayout)_scrubberLayout
{
  return self->__scrubberLayout;
}

- (void)setEmbeddedVideoScrubberWidthFraction:(double)a3
{
  self->_embeddedVideoScrubberWidthFraction = a3;
}

- (double)embeddedVideoScrubberWidthFraction
{
  return self->_embeddedVideoScrubberWidthFraction;
}

- (void)setCanExpandCurrentAsset:(BOOL)a3
{
  self->_canExpandCurrentAsset = a3;
}

- (BOOL)canExpandCurrentAsset
{
  return self->_canExpandCurrentAsset;
}

- (void)setUseEmbeddedVideoScrubber:(BOOL)a3
{
  self->_useEmbeddedVideoScrubber = a3;
}

- (BOOL)useEmbeddedVideoScrubber
{
  return self->_useEmbeddedVideoScrubber;
}

- (void)setLoupeAspectRatio:(id)a3
{
}

- (NSNumber)loupeAspectRatio
{
  return self->_loupeAspectRatio;
}

- (void)setInterSectionSpacing:(double)a3
{
  self->_interSectionSpacing = a3;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (void)setSlitAspectRatio:(double)a3
{
  self->_slitAspectRatio = a3;
}

- (double)slitAspectRatio
{
  return self->_slitAspectRatio;
}

- (void)setItemCornerRadius:(double)a3
{
  self->_itemCornerRadius = a3;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (void)setTopOutset:(double)a3
{
  self->_topOutset = a3;
}

- (double)topOutset
{
  return self->_topOutset;
}

- (PUScrubberViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUScrubberViewDelegate *)WeakRetained;
}

- (int64_t)type
{
  return self->_type;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(PUScrubberView *)self topOutset];
  if (y < v8
    && self->_delegateFlags.respondsToShouldIgnoreHitTestWithEvent
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v10 = objc_msgSend(WeakRetained, "scrubberView:shouldIgnoreHitTest:withEvent:", self, v7, x, y),
        WeakRetained,
        (v10 & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUScrubberView;
    v11 = -[PUScrubberView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)playbackTimeIndicatorTileViewControllerCanFlashIndicator:(id)a3
{
  v4 = [a3 presentationLayoutInfo];
  v5 = [(PUScrubberView *)self _tilingView];
  v6 = [v4 indexPath];
  id v7 = [v4 dataSourceIdentifier];
  double v8 = [v5 presentedTileControllerWithIndexPath:v6 kind:@"PUTileKindItemContent" dataSourceIdentifier:v7];

  v9 = [v8 presentationLayoutInfo];

  if (v9)
  {
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [v9 coordinateSystem];
    v19 = [v5 contentCoordinateSystem];
    double v20 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v18, v19, v11, v13);
    double v22 = v21;

    -[PUScrubberView convertRect:fromView:](self, "convertRect:fromView:", v5, v20, v22, v15, v17);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    [(PUScrubberView *)self bounds];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    v42.origin.double x = v24;
    v42.origin.double y = v26;
    v42.size.width = v28;
    v42.size.height = v30;
    double MaxX = CGRectGetMaxX(v42);
    v43.origin.double x = v32;
    v43.origin.double y = v34;
    v43.size.width = v36;
    v43.size.height = v38;
    BOOL v40 = MaxX > CGRectGetMaxX(v43);
  }
  else
  {
    BOOL v40 = 1;
  }

  return v40;
}

- (void)videoScrubberController:(id)a3 desiredSeekTime:(id *)a4
{
  v6 = [(PUScrubberView *)self browsingSession];
  id v7 = [v6 viewModel];

  int64_t v8 = [(PUScrubberView *)self _expandedItemType];
  if (v8 == 2)
  {
    double v13 = [v7 currentAssetReference];
    double v14 = [v7 assetViewModelForAssetReference:v13];
    id v12 = [v14 videoPlayer];

    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v12 setDesiredSeekTime:&v15];
    goto LABEL_5;
  }
  if (v8 == 3)
  {
    v9 = [v7 currentAssetReference];
    double v10 = [v7 assetViewModelForAssetReference:v9];
    double v11 = [v10 irisPlayer];

    [(PUScrubberView *)self _invalidateScrubberLayout];
    [(PUScrubberView *)self updateIfNeeded];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PUScrubberView_videoScrubberController_desiredSeekTime___block_invoke;
    v17[3] = &unk_1E5F2D670;
    id v18 = v11;
    long long v19 = *(_OWORD *)&a4->var0;
    int64_t v20 = a4->var3;
    id v12 = v11;
    [v12 performChanges:v17];

LABEL_5:
  }
}

uint64_t __58__PUScrubberView_videoScrubberController_desiredSeekTime___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v1 setScrubbingPhotoTime:&v3 completion:0];
}

- (void)videoScrubberControllerDidUpdate:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(PUScrubberView *)self _tilingView];
  if (v4)
  {
    v5 = [(PUScrubberView *)self _scrubberLayout];
    [v5 expandedItemWidth];
    double v7 = v6;
    [v22 length];
    double v9 = v8;

    if (v7 != v9) {
      [(PUScrubberView *)self _invalidateScrubberLayout];
    }
    double v10 = [(PUScrubberView *)self _scrubberLayout];
    uint64_t v11 = [(PUScrubberView *)self _videoScrubberController];
    if (v11)
    {
      id v12 = (void *)v11;
      double v13 = [v10 expandedItemIndexPath];

      if (v13)
      {
        [v22 playheadProgress];
        double v15 = v14;
        double v16 = [(PUScrubberView *)self _expandedAssetReference];
        double v17 = [v16 asset];
        int v18 = [v17 canPlayPhotoIris];

        if (v18)
        {
          [(PUScrubberView *)self _playheadProgressForIrisAssetReference:v16];
          double v15 = v19;
        }
        int64_t v20 = [(PUScrubberView *)self _scrubberLayout];
        [v20 setExpandedItemPlayheadProgress:v15];

        if (![(PUScrubberView *)self _isDrivingPlayheadProgress]
          && [(PUScrubberView *)self _expandedItemType] == 2)
        {
          uint64_t v21 = [v4 _contentOffsetRoundingEnabled];
          [v4 _setContentOffsetRoundingEnabled:1];
          [(PUScrubberView *)self _updateScrollPositionAnimated:0];
          [v4 _setContentOffsetRoundingEnabled:v21];
        }
      }
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSelectionManagerObservationContext != a5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUScrubberView.m" lineNumber:1426 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v12 = v9;
    double v10 = [(PUScrubberView *)self _scrubberLayout];
    if ([v10 shouldHighlightSelectedItems]) {
      [v10 invalidateSelectedItems];
    }

    id v9 = v12;
  }
}

- (void)_reenableLayoutTransitions
{
  int64_t v3 = [(PUScrubberView *)self _layoutTransitionsDisabledCount] - 1;
  [(PUScrubberView *)self _setLayoutTransitionsDisabledCount:v3];
  if (!v3)
  {
    [(PUScrubberView *)self _invalidateScrubberLayout];
    [(PUScrubberView *)self updateIfNeeded];
  }
}

- (void)_disableLayoutTransitionsForDuration:(double)a3
{
  [(PUScrubberView *)self _setLayoutTransitionsDisabledCount:[(PUScrubberView *)self _layoutTransitionsDisabledCount] + 1];
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PUScrubberView__disableLayoutTransitionsForDuration___block_invoke;
  v6[3] = &unk_1E5F2E530;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__PUScrubberView__disableLayoutTransitionsForDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reenableLayoutTransitions];
}

- (BOOL)_areLayoutTransitionsDisabled
{
  return [(PUScrubberView *)self _layoutTransitionsDisabledCount] > 0;
}

- (void)_updateScrollPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUScrubberView *)self updateIfNeeded];
  id v25 = [(PUScrubberView *)self _tilingView];
  [v25 layoutIfNeeded];
  dispatch_time_t v5 = [(PUScrubberView *)self _scrubberLayout];
  if ([(PUScrubberView *)self _isContentScrubbing])
  {
    char v6 = [v5 expandedItemIndexPath];
    [v5 visibleRectForScrollingToItemAtIndexPath:v6 scrollPosition:2];
    double v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
  }
  else
  {
    double v15 = [(PUScrubberView *)self browsingSession];
    char v6 = [v15 viewModel];

    double v16 = [v6 currentAssetReference];
    double v17 = [v16 indexPath];
    if (v17)
    {
      [v6 currentAssetTransitionProgress];
      objc_msgSend(v5, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", v17);
      double v8 = v18;
      double v10 = v19;
      CGFloat v12 = v20;
      CGFloat v14 = v21;
    }
    else
    {
      double v8 = *MEMORY[0x1E4F1DB10];
      double v10 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
  }
  v27.origin.double x = v8;
  v27.origin.double y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  if (!CGRectIsInfinite(v27))
  {
    id v22 = [v5 coordinateSystem];
    double v23 = [v25 contentCoordinateSystem];
    double v24 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v22, v23, v8, v10);

    objc_msgSend(v25, "setContentOffset:animated:", v3, v24, 0.0);
    if (v3) {
      objc_msgSend(v25, "px_cancelScrollGesture");
    }
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [(PUScrubberView *)self _tilingView];
  if (v9)
  {
    if ([v8 chromeVisibilityDidChange])
    {
      if ([v7 isChromeVisible])
      {
        if ([(PUScrubberView *)self _areLayoutTransitionsDisabled]) {
          [(PUScrubberView *)self _invalidateScrubberLayout];
        }
      }
      else
      {
        [(PUScrubberView *)self _disableLayoutTransitionsForDuration:0.5];
      }
    }
    SEL v32 = a2;
    uint64_t v10 = [v7 currentAssetReference];
    double v33 = (void *)v10;
    if (v10)
    {
      double v11 = [v8 assetViewModelChangesByAssetReference];
      CGFloat v12 = [v11 objectForKeyedSubscript:v10];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        char v16 = 0;
        uint64_t v17 = *(void *)v35;
        double v31 = v9;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v13);
            }
            double v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            double v20 = [v19 videoPlayerChange];
            if (([v20 avPlayerDidChange] & 1) != 0
              || ([v20 isActivatedDidChange] & 1) != 0)
            {
              [(PUScrubberView *)self _invalidateScrubberLayout];

              double v9 = v31;
              goto LABEL_31;
            }
            if (([v20 desiredPlayStateDidChange] & 1) != 0
              || [v20 playStateDidChange])
            {
              [(PUScrubberView *)self _invalidateScrubberLayout];
            }
            if ([v19 isDisplayingSearchQueryLabelChanged]) {
              [(PUScrubberView *)self _invalidateScrubberLayout];
            }
            double v21 = [v19 irisPlayerChange];
            if ([v21 activatedDidChange])
            {
              [(PUScrubberView *)self _invalidateScrubberLayoutEnsureTransition];
              [(PUScrubberView *)self _invalidateLoupeEffect];
            }
            if ([v21 scrubbingPhotoTimeDidChange]) {
              [(PUScrubberView *)self _invalidateScrubberLayout];
            }
            if ([v21 playingDidChange]) {
              char v16 = 1;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
          double v9 = v31;
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        char v16 = 0;
      }
LABEL_31:

      LODWORD(v10) = v16 & 1;
    }
    if (([v8 currentAssetDidChange] & 1) != 0
      || ([v8 currentAssetTransitionProgressDidChange] & 1) != 0
      || [v8 transitionDriverIdentifierDidChange])
    {
      id v22 = [v7 transitionDriverIdentifier];
      if ([v22 isEqualToString:self->_transitionLayoutIdentifier])
      {

LABEL_38:
        [(PUScrubberView *)self _invalidateLoupeEffect];
        [(PUScrubberView *)self _invalidateScrubberLayoutEnsureTransition];
        char v25 = 1;
        goto LABEL_40;
      }
      double v23 = [v7 transitionDriverIdentifier];
      int v24 = [v23 isEqualToString:@"PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay"];

      if (v24) {
        goto LABEL_38;
      }
    }
    char v25 = 0;
LABEL_40:
    if ([v8 transitionDriverIdentifierDidChange]) {
      [(PUScrubberView *)self _invalidateScrubberLayout];
    }
    if (([v8 currentAssetDidChange] & 1) != 0
      || ([v8 isScrubbingDidChange] & 1) != 0
      || [v8 isInSelectionModeDidChange])
    {
      [(PUScrubberView *)self _invalidateScrubberLayout];
    }
    CGFloat v26 = [v7 assetsDataSource];
    if (([v8 assetsDataSourceDidChange] | v10) == 1)
    {
      [(NSMutableDictionary *)self->_aspectRatioByIndexPath removeAllObjects];
      [(PUScrubberView *)self _setDecelerationTargetIndexPath:0];
      [(PUScrubberView *)self _invalidateScrubberLayoutEnsureTransition];
    }
    [(PUScrubberView *)self updateIfNeeded];
    CGRect v27 = [(PUScrubberView *)self _scrubberLayout];
    CGFloat v28 = [v27 dataSource];
    char v29 = [v26 isEqual:v28];

    if (v29)
    {
      if ((v25 & 1) == 0)
      {
LABEL_50:
        if (![(PUScrubberView *)self _isLibraryScrubbing]
          && ![(PUScrubberView *)self _isContentScrubbing]
          && (([v8 currentAssetDidChange] & 1) != 0
           || ([v8 currentAssetTransitionProgressDidChange] & 1) != 0
           || [v8 transitionDriverIdentifierDidChange]))
        {
          [(PUScrubberView *)self _setDecelerationTargetIndexPath:0];
          [(PUScrubberView *)self _updateScrollPositionAnimated:0];
        }
      }
    }
    else
    {
      CGFloat v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:v32 object:self file:@"PUScrubberView.m" lineNumber:1345 description:@"Session and layout data sources are out of sync."];

      if ((v25 & 1) == 0) {
        goto LABEL_50;
      }
    }
  }
}

- (void)handleTouchGesture:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      [(PUScrubberView *)self _handleUserScrollWillBegin:1];
    }
  }
  else
  {
    id v5 = [(PUScrubberView *)self _tilingView];
    if (([v5 isDecelerating] & 1) == 0 && (objc_msgSend(v5, "isDragging") & 1) == 0) {
      [(PUScrubberView *)self _endScrubbing];
    }
  }
}

- (void)_endScrubbing
{
  BOOL v3 = [(PUScrubberView *)self _tilingView];
  if (([v3 isTracking] & 1) == 0
    && ([v3 isDecelerating] & 1) == 0
    && ([v3 isDragging] & 1) == 0)
  {
    [(PUScrubberView *)self _setScrollViewSettled:1];
  }
  uint64_t v4 = [(PUScrubberView *)self browsingSession];
  id v5 = [v4 viewModel];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __31__PUScrubberView__endScrubbing__block_invoke;
  v16[3] = &unk_1E5F2ED10;
  id v6 = v5;
  id v17 = v6;
  [v6 performChanges:v16];
  if ([(PUScrubberView *)self _expandedItemType] == 3
    || [(PUScrubberView *)self _expandedItemType] == 1)
  {
    id v7 = [v6 currentAssetReference];
    id v8 = [v6 assetViewModelForAssetReference:v7];
    double v9 = [v8 irisPlayer];

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __31__PUScrubberView__endScrubbing__block_invoke_2;
    uint64_t v14 = &unk_1E5F2ED10;
    id v15 = v9;
    id v10 = v9;
    [v10 performChanges:&v11];
    -[PUScrubberView _updateScrollPositionAnimated:](self, "_updateScrollPositionAnimated:", 1, v11, v12, v13, v14);
  }
}

uint64_t __31__PUScrubberView__endScrubbing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsScrubbing:0];
}

uint64_t __31__PUScrubberView__endScrubbing__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [v1 setScrubbingPhotoTime:&v3 completion:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(PUScrubberView *)self _endScrubbing];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v44 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CGRect v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1174, @"Invalid parameter not satisfying: %@", @"[tilingView isKindOfClass:[PUTilingView class]]" object file lineNumber description];
  }
  id v8 = [(PUScrubberView *)self _scrubberLayout];
  double v9 = [v8 expandedItemIndexPath];

  if (!v9)
  {
    [(PUScrubberView *)self _setHandlingScrollViewWillEndDragging:1];
    [(PUScrubberView *)self updateIfNeeded];
    double x = a5->x;
    double y = a5->y;
    [v8 focusPoint];
    double v13 = v12;
    double v15 = v14;
    char v16 = [v8 coordinateSystem];
    id v17 = [v44 contentCoordinateSystem];
    double v18 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v16, v17, v13, v15);
    double v20 = v19;

    [v44 contentOffset];
    double v23 = x + v18 - v21;
    double v24 = y + v20 - v22;
    char v25 = [v44 contentCoordinateSystem];
    CGFloat v26 = [v8 coordinateSystem];
    double v27 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v25, v26, v23, v24);
    double v29 = v28;

    CGFloat v30 = objc_msgSend(v8, "indexPathOfItemClosestToPoint:", v27, v29);
    if (v30)
    {
      double v31 = [(PUScrubberView *)self _scrubberLayout];
      [v31 visibleRectForScrollingToItemAtIndexPath:v30 transitionProgress:0.0];
      double v33 = v32;
      double v35 = v34;
      long long v36 = [v31 coordinateSystem];
      long long v37 = [v44 contentCoordinateSystem];
      double v38 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v36, v37, v33, v35);
      double v40 = v39;
    }
    else
    {
      double v38 = x;
      double v40 = y;
    }
    if ((PUPointIsEqualToPointWithTolerance() & 1) == 0)
    {
      a5->double x = v38;
      a5->double y = v40;
    }
    [(PUScrubberView *)self _setDecelerationTargetIndexPath:v30];
    -[PUScrubberView _setDecelerationTargetOffset:](self, "_setDecelerationTargetOffset:", v38, v40);
    [v44 contentOffset];
    [(PUScrubberView *)self _setDecelerationDistance:(double)hypot(v38 - v41, v40 - v42)];
    [(PUScrubberView *)self _setHandlingScrollViewWillEndDragging:0];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(PUScrubberView *)self _tilingView];

  if (v5 == v4)
  {
    [(PUScrubberView *)self _handleUserScrollWillBegin:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  id v4 = [(PUScrubberView *)self _tilingView];

  id v5 = v9;
  if (v4 == v9)
  {
    [(PUScrubberView *)self _invalidateLoupeEffect];
    if ([v9 isDragging] & 1) != 0 || (objc_msgSend(v9, "isDecelerating")) {
      int v6 = 1;
    }
    else {
      int v6 = [v9 isTracking];
    }
    char v7 = objc_msgSend(v9, "pu_isPerformingScrollTest");
    id v5 = v9;
    if ((v7 & 1) != 0
      || v6
      && ([(PUScrubberView *)self _isContentScrubbing]
       || (BOOL v8 = [(PUScrubberView *)self _isLibraryScrubbing], v5 = v9, v8)))
    {
      [(PUScrubberView *)self _handleUserScrollWillBegin:0];
      id v5 = v9;
    }
  }
}

- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4
{
  id v6 = a4;
  char v7 = [(PUScrubberView *)self browsingSession];
  BOOL v8 = [v7 viewModel];

  id v9 = [(PUScrubberView *)self _currentAssetsDataSource];
  id v10 = [v6 dataSource];
  char v11 = [v10 isEqual:v9];

  if ((v11 & 1) == 0)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1123, @"Invalid parameter not satisfying: %@", @"[[layout dataSource] isEqual:assetsDataSource]" object file lineNumber description];
  }
  double v12 = [v8 currentAssetReference];
  double v13 = [v9 indexPathForAssetReference:v12];
  if (!v13 && v9)
  {
    if ([v9 isEmpty])
    {
LABEL_10:
      double v14 = *MEMORY[0x1E4F1DB28];
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      goto LABEL_13;
    }
    double v13 = [v9 firstItemIndexPath];
  }
  if (!v13) {
    goto LABEL_10;
  }
  if ([(PUScrubberView *)self _isLibraryScrubbing]) {
    [(PUScrubberView *)self _scrubbingTransitionProgress];
  }
  else {
    [v8 currentAssetTransitionProgress];
  }
  objc_msgSend(v6, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", v13);
  double v14 = v16;
  double v15 = v17;

LABEL_13:
  double v18 = v14;
  double v19 = v15;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 invalidatedExpandedItem])
  {
    BOOL v8 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:0 tilingView:v6];
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = +[PUScrubberSettings sharedInstance];
  if ([v9 useSmoothingAnimation]) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = [(PUScrubberView *)self _expandedAssetReference];
  if (v11)
  {
    double v12 = (void *)v11;
    BOOL v8 = 0;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  BOOL v13 = [(PUScrubberView *)self _useSmoothingTransitionCoordinator];

  if (v13)
  {
    BOOL v8 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:0 tilingView:v6];
    double v14 = NSNumber;
    id v9 = +[PUScrubberSettings sharedInstance];
    [v9 smoothingAnimationDuration];
    double v12 = objc_msgSend(v14, "numberWithDouble:");
    [v8 setAnimationDuration:v12];
    goto LABEL_14;
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  if (a6 <= 0.0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, a3, a6, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  }
  return v6;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUOneUpAssetsDataSourceConverter defaultConverter];
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  id v7 = +[PUTileTransitionCoordinator browsingTileTransitionCoordinatorForTransitionFromLayout:a4 toLayout:a5 withTilingView:a3 anchorAssetReference:0 context:a6];
  BOOL v8 = [(PUScrubberView *)self browsingSession];
  id v9 = [v8 viewModel];
  BOOL v10 = [v9 transitionDriverIdentifier];

  uint64_t v11 = [(PUScrubberView *)self _decelerationTargetIndexPath];

  if (v11)
  {
    double v12 = +[PUScrubberSettings sharedInstance];
    [(PUScrubberView *)self _decelerationDistance];
    double v14 = v13;
    [v12 settleRequiredDecelerationDistance];
    if (v14 <= v15)
    {
LABEL_8:

      goto LABEL_9;
    }
    double v16 = NSNumber;
    [v12 settleAnimationDuration];
LABEL_7:
    double v17 = objc_msgSend(v16, "numberWithDouble:");
    [v7 setAnimationDuration:v17];

    goto LABEL_8;
  }
  if (([v10 isEqual:self->_transitionLayoutIdentifier] & 1) != 0
    || [v10 isEqual:@"PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay"])
  {
    double v16 = NSNumber;
    double v12 = +[PUScrubberSettings sharedInstance];
    [v12 tapAnimationDuration];
    goto LABEL_7;
  }
  [v7 setAnimationDuration:&unk_1F078D3F0];
LABEL_9:

  return v7;
}

- (BOOL)layout:(id)a3 isItemAtAtIndexPathSelected:(id)a4
{
  id v5 = a4;
  id v6 = [(PUScrubberView *)self browsingSession];
  id v7 = [v6 actionManager];
  BOOL v8 = objc_msgSend(v7, "px_selectionManager");
  id v9 = [v8 selectionSnapshot];

  if (v9)
  {
    BOOL v10 = [v9 dataSource];
    uint64_t v11 = [v10 identifier];
    uint64_t v12 = [v5 section];
    uint64_t v13 = [v5 item];

    double v14 = [v9 selectedIndexPaths];
    v17[0] = v11;
    v17[1] = v12;
    v17[2] = v13;
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
    char v15 = [v14 containsIndexPath:v17];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)layout:(id)a3 shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PUScrubberView *)self useEmbeddedVideoScrubber])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    BOOL v10 = [v7 dataSource];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1050, @"Invalid parameter not satisfying: %@", @"[assetsDataSource isKindOfClass:[PUAssetsDataSource class]]" object file lineNumber description];
    }
    uint64_t v11 = [v10 assetAtIndexPath:v8];
    int v9 = [v11 canPlayPhotoIris] ^ 1;
  }
  return v9;
}

- (float)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PUScrubberView *)self loupeAspectRatio];

  if (v9)
  {
    BOOL v10 = [(PUScrubberView *)self loupeAspectRatio];
  }
  else
  {
    BOOL v10 = [(NSMutableDictionary *)self->_aspectRatioByIndexPath objectForKeyedSubscript:v8];
    if (!v10)
    {
      uint64_t v11 = [v7 dataSource];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1030, @"Invalid parameter not satisfying: %@", @"[assetsDataSource isKindOfClass:[PUAssetsDataSource class]]" object file lineNumber description];
      }
      uint64_t v12 = [v11 assetAtIndexPath:v8];
      [v12 aspectRatio];
      float v14 = v13;
      BOOL v15 = (LODWORD(v14) & 0x7FFFFFFFu) - 1 < 0x7FFFFF;
      BOOL v16 = ((LODWORD(v14) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F;
      if (v14 >= 0.0)
      {
        BOOL v16 = 0;
        BOOL v15 = 0;
      }
      if (!fabs(v13)) {
        BOOL v15 = 1;
      }
      int v17 = COERCE_INT(fabs(v13)) == 2139095040 || v15;
      if (COERCE_UNSIGNED_INT(fabs(v13)) > 0x7F800000) {
        int v17 = 1;
      }
      if ((v17 | v16) == 1)
      {
        double v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1033, @"Asset:%@ must provide a valid aspect ratio, got:%f.", v12, v14 object file lineNumber description];
      }
      *(float *)&double v13 = v14;
      BOOL v10 = [NSNumber numberWithFloat:v13];
      [(NSMutableDictionary *)self->_aspectRatioByIndexPath setObject:v10 forKeyedSubscript:v8];
    }
  }
  [v10 floatValue];
  float v19 = v18;

  return v19;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  float v14 = [(PUScrubberView *)self browsingSession];
  BOOL v15 = [v14 viewModel];

  BOOL v16 = [v15 assetsDataSource];
  char v17 = [v13 isEqual:v16];

  if ((v17 & 1) == 0)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PUScrubberView.m", 967, @"Invalid parameter not satisfying: %@", @"[dataSource isEqual:assetsDataSource]" object file lineNumber description];
  }
  if ([v12 isEqualToString:@"PUTileKindItemContent"])
  {
    v59 = v10;
    float v18 = [(PUScrubberView *)self browsingSession];
    [v18 mediaProvider];
    double v20 = v19 = self;

    double v21 = [v16 assetReferenceAtIndexPath:v11];
    double v22 = [v15 assetViewModelForAssetReference:v21];
    v58 = v19;
    if (![(PUScrubberView *)v19 useEmbeddedVideoScrubber])
    {
      double v23 = [v22 asset];
      if ([v23 mediaType] == 2)
      {

LABEL_12:
        double v34 = PUFilmstripTileViewReuseIdentifier;
LABEL_14:
        double v24 = [v59 dequeueTileControllerWithReuseIdentifier:*v34];
        [v24 setAssetViewModel:v22];
        [v24 setMediaProvider:v20];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v35 = +[PUInterfaceManager currentTheme];
          [v35 scrubberPlaceholderColor];
          long long v36 = v15;
          long long v37 = v16;
          id v38 = v12;
          double v40 = v39 = v11;
          [v24 setPlaceholderColor:v40];

          id v11 = v39;
          id v12 = v38;
          BOOL v16 = v37;
          BOOL v15 = v36;
        }
        id v10 = v59;
        goto LABEL_17;
      }
      [v22 asset];
      v56 = v15;
      double v29 = v16;
      id v30 = v12;
      v32 = id v31 = v11;
      char v33 = [v32 canPlayPhotoIris];

      id v11 = v31;
      id v12 = v30;
      BOOL v16 = v29;
      BOOL v15 = v56;

      if (v33) {
        goto LABEL_12;
      }
    }
    double v34 = &PUScrubberImageTileViewReuseIdentifier;
    goto LABEL_14;
  }
  if ([v12 isEqualToString:@"PUTileKindPlayhead"])
  {
    double v24 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUPlayheadTileViewReuseIdentifier"];
    goto LABEL_18;
  }
  if ([v12 isEqualToString:@"PUTileKindPlaybackTimeIndicator"])
  {
    char v25 = [v16 assetReferenceAtIndexPath:v11];
    [v15 assetViewModelForAssetReference:v25];
    v27 = id v26 = v11;
    double v28 = [v27 videoPlayer];
    double v24 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUPlaybackTimeIndicatorTileViewReuseIdentifier"];
    [v24 setDelegate:self];
    [v24 setVideoPlayer:v28];
    [v24 setViewModel:v15];

    id v11 = v26;
    goto LABEL_18;
  }
  if ([v12 isEqualToString:@"PUTileKindVideoHighlightStrip"])
  {
    double v24 = [v10 dequeueTileControllerWithReuseIdentifier:@"PUVideoHighlightStripTileViewControllerReuseIdentifier"];
    v58 = self;
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_25:
        double v42 = [v16 assetReferenceAtIndexPath:v11];
        [v15 assetViewModelForAssetReference:v42];
        v44 = id v43 = v11;
        [v24 setAssetViewModel:v44];
        v45 = +[PUOneUpSettings sharedInstance];
        v46 = [v45 videoHighlightColor];
        [v24 setHighlightColor:v46];

        id v11 = v43;
LABEL_17:
        self = v58;
LABEL_18:
        if (v24) {
          goto LABEL_19;
        }
        goto LABEL_26;
      }
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v54 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v54);
      v55 = objc_msgSend(v24, "px_descriptionForAssertionMessage");
      [v49 handleFailureInMethod:a2, v58, @"PUScrubberView.m", 1005, @"%@ should be an instance inheriting from %@, but it is %@", @"[tilingView dequeueTileControllerWithReuseIdentifier:PUVideoHighlightStripTileViewControllerReuseIdentifier]", v53, v55 object file lineNumber description];
    }
    else
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      v50 = (objc_class *)objc_opt_class();
      uint64_t v51 = NSStringFromClass(v50);
      v52 = self;
      v53 = (void *)v51;
      [v49 handleFailureInMethod:a2, v52, @"PUScrubberView.m", 1005, @"%@ should be an instance inheriting from %@, but it is nil", @"[tilingView dequeueTileControllerWithReuseIdentifier:PUVideoHighlightStripTileViewControllerReuseIdentifier]", v51 object file lineNumber description];
    }

    goto LABEL_25;
  }
LABEL_26:
  v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"PUScrubberView.m", 1014, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];

  double v24 = 0;
LABEL_19:

  return v24;
}

- (double)_playheadProgressForIrisAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asset];
  int v6 = [v5 canPlayPhotoIris];

  double v7 = 0.0;
  if (v6)
  {
    id v8 = [(PUScrubberView *)self browsingSession];
    int v9 = [v8 viewModel];

    id v10 = [v9 assetViewModelForAssetReference:v4];
    id v11 = [v10 irisPlayer];

    memset(&v16[1], 0, sizeof(CMTime));
    if (v11)
    {
      [v11 currentPhotoTime];
      memset(v16, 0, 24);
      [v11 currentVideoDuration];
    }
    else
    {
      memset(v16, 0, 24);
    }
    CMTime time1 = v16[0];
    CMTime v14 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1, &v14) >= 1 && (v16[0].flags & 0x1D) == 1 && (v16[1].flags & 0x1D) == 1)
    {
      CMTime time1 = v16[1];
      double Seconds = CMTimeGetSeconds(&time1);
      CMTime time1 = v16[0];
      double v7 = Seconds / CMTimeGetSeconds(&time1);
    }
  }
  return v7;
}

- (double)_expandedItemWidth
{
  if ([(PUScrubberView *)self _expandedItemType] == 1)
  {
    long long v3 = +[PUOneUpSettings sharedInstance];
    [v3 autoplayScrubberWidth];
  }
  else
  {
    if ([(PUScrubberView *)self _expandedItemType] == 4)
    {
      [(PUScrubberView *)self bounds];
      double Width = CGRectGetWidth(v15);
      [(PUScrubberView *)self embeddedVideoScrubberWidthFraction];
      return Width * v6;
    }
    id v8 = [(PUScrubberView *)self _videoScrubberController];

    if (!v8)
    {
      id v10 = [(PUScrubberView *)self browsingSession];
      id v11 = [v10 viewModel];
      id v12 = [v11 currentAssetReference];
      id v13 = [v12 asset];

      [v13 duration];
      -[PUScrubberView _lengthForDuration:](self, "_lengthForDuration:");
      double v9 = v14;

      return v9;
    }
    long long v3 = [(PUScrubberView *)self _videoScrubberController];
    [v3 length];
  }
  double v9 = v4;

  return v9;
}

- (void)_updateScrubbingAwayFromContentEdgeBeganDragging:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUScrubberView *)self _videoScrubberController];

  if (v5)
  {
    double v6 = [(PUScrubberView *)self _videoScrubberController];
    [v6 playheadProgress];
    BOOL v8 = v7 < 0.99 && v7 > 0.00999999978;
    if (v3 && !v8 && [(PUScrubberView *)self _scrollViewSettled]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [(PUScrubberView *)self _isScrubbingAwayFromContentEdge] & !v8;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(PUScrubberView *)self _setScrubbingAwayFromContentEdge:v9];
}

- (void)_updateScrubberLayoutIfNeeded
{
  if (!self->_scrubberLayoutIsValid)
  {
    self->_scrubberLayoutIsValid = 1;
    BOOL v3 = [(PUScrubberView *)self _tilingView];
    double v4 = [(PUScrubberView *)self browsingSession];
    id v5 = [v4 viewModel];

    double v6 = [(PUScrubberView *)self _currentAssetsDataSource];
    double v7 = [v5 currentAssetReference];
    v106 = [v7 indexPath];
    BOOL v8 = [v5 assetViewModelForAssetReference:v7];
    uint64_t v9 = [v8 videoPlayer];
    id v10 = [v8 irisPlayer];
    int v105 = [v8 isDisplayingSearchQueryLabel];
    if ([(PUScrubberView *)self _areLayoutTransitionsDisabled]
      && !self->_scrubberLayoutNeedsTransition
      && ![v5 isChromeVisible])
    {
LABEL_94:

      return;
    }
    v100 = v9;
    uint64_t v11 = [v9 avPlayer];
    v99 = v3;
    v103 = v6;
    v97 = v7;
    if ([v5 isScrubbing]
      && [(PUScrubberView *)self _isLibraryScrubbing])
    {
      uint64_t v12 = 0;
      goto LABEL_21;
    }
    id v13 = [v7 asset];
    uint64_t v14 = [v13 playbackStyle];

    if (v14 != 5)
    {
      BOOL v16 = [v7 asset];
      if ([v16 playbackStyle] == 4)
      {
        BOOL v17 = [(PUScrubberView *)self useEmbeddedVideoScrubber];

        if (v17)
        {
          uint64_t v15 = 4;
          if (v11) {
            goto LABEL_10;
          }
          goto LABEL_19;
        }
      }
      else
      {
      }
      float v18 = v100;
      if ([v100 desiredPlayState] == 4 || (objc_msgSend(v100, "isActivated") & 1) != 0)
      {
        uint64_t v15 = 2;
        if (v11) {
          goto LABEL_10;
        }
        goto LABEL_19;
      }
      if ([v100 desiredPlayState] == 3)
      {
        if ([(PUScrubberView *)self _isLibraryScrubbing])
        {
          v94 = [(PUScrubberView *)self _tilingView];
          if ([v94 isTracking] & 1) != 0 || (objc_msgSend(v94, "isDecelerating"))
          {

            goto LABEL_9;
          }

          float v18 = v100;
        }
        uint64_t v15 = [v18 playState] != 5;
        if (v11) {
          goto LABEL_10;
        }
        goto LABEL_19;
      }
    }
LABEL_9:
    uint64_t v15 = 0;
    if (v11)
    {
LABEL_10:
      [(PUScrubberView *)self _setExpandedItemType:v15];
LABEL_22:
      float v19 = v10;
      double v20 = [(PUScrubberView *)self _videoScrubberController];
      double v21 = [v20 target];
      double v22 = [v21 videoPlayer];

      v102 = (void *)v11;
      if (v22 != (void *)v11)
      {
        double v23 = [v7 asset];
        [v23 duration];
        double Seconds = v24;
        id v26 = &OBJC_IVAR___PUReviewScrubber__scrubberCellClass;
        if ([v23 canPlayPhotoIris])
        {
          memset(&v109, 0, sizeof(v109));
          if (v23)
          {
            [v23 photoIrisVideoDuration];
            if (v109.flags)
            {
              CMTime time = v109;
              double Seconds = CMTimeGetSeconds(&time);
            }
          }
        }
        double v27 = (void *)[objc_alloc(MEMORY[0x1E4F906D0]) initWithVideoPlayer:v102];
        double v28 = (void *)[objc_alloc(MEMORY[0x1E4F908B8]) initWithTarget:v27 estimatedDuration:Seconds];
        [(PUScrubberView *)self _setVideoScrubberController:v28];
        [v28 playheadProgress];
        BOOL v30 = v29 > 0.0;

        id v10 = v19;
        double v6 = v103;
LABEL_32:
        v107 = [(PUScrubberView *)self _expandedAssetReference];
        int64_t v31 = [(PUScrubberView *)self type];
        v104 = +[PUScrubberSettings sharedInstance];
        double v32 = [(PUScrubberView *)self _scrubberLayout];
        char v33 = v32;
        uint64_t v34 = v26[231];
        if (*((unsigned char *)&self->super.super.super.isa + v34))
        {
          *((unsigned char *)&self->super.super.super.isa + v34) = 0;
          BOOL v30 = 1;
        }
        v95 = v8;
        v101 = v10;
        if (v32)
        {
          double v35 = [v32 dataSource];
          long long v36 = [v35 identifier];
          long long v37 = [v6 identifier];
          int v38 = [v36 isEqualToString:v37] ^ 1;
        }
        else
        {
          int v38 = 1;
        }
        id v39 = objc_msgSend(v107, "indexPath", v95);
        uint64_t v40 = [v33 expandedItemIndexPath];
        v98 = v5;
        if (v39 == (void *)v40)
        {
        }
        else
        {
          double v41 = (void *)v40;
          double v42 = [v107 indexPath];
          id v43 = [v33 expandedItemIndexPath];
          int v44 = [v42 isEqual:v43];

          if (!v44)
          {
            int v45 = 1;
LABEL_42:
            unsigned int v46 = (v31 == 1) ^ [v33 onlyShowExpandedItem];
            [(PUScrubberView *)self _expandedItemWidth];
            double v48 = v47;
            [v33 expandedItemWidth];
            if (v48 == v49 || v107 == 0) {
              int v51 = v46;
            }
            else {
              int v51 = 1;
            }
            v52 = [(PUScrubberView *)self _decelerationTargetIndexPath];
            char v53 = [v106 isEqual:v52];
            v54 = v52;
            if (v53) {
              goto LABEL_49;
            }
            if (v52)
            {
              if (![(PUScrubberView *)self _isHandlingScrollViewWillEndDragging])
              {
                [v104 decelerationTargetExpansionDistance];
                if (v56 > 0.0)
                {
                  [v99 contentOffset];
                  double v58 = v57;
                  double v60 = v59;
                  [(PUScrubberView *)self _decelerationTargetOffset];
                  double v63 = hypot(v61 - v58, v62 - v60);
                  [v104 decelerationTargetExpansionDistance];
                  v54 = v52;
                  if (v63 < v64) {
                    goto LABEL_49;
                  }
                }
              }
            }
            if ([(PUScrubberView *)self _useLoupe]
              && (BOOL v65 = [(PUScrubberView *)self _isLibraryScrubbing], v54 = v106, v65))
            {
LABEL_49:
              id v55 = v54;
            }
            else
            {
              id v55 = 0;
            }
            int v66 = v51 | v45;
            id v67 = [v33 overrideLoupeIndexPath];
            if (v67 != v55)
            {
              v68 = [v33 overrideLoupeIndexPath];
              int v69 = [v68 isEqual:v55] ^ 1;

              v66 |= v69;
            }

            BOOL v70 = [(PUScrubberView *)self _useLoupe];
            if (v55) {
              int v71 = 1;
            }
            else {
              int v71 = v70;
            }
            if (v71) {
              double v72 = 1.0;
            }
            else {
              double v72 = 0.0;
            }
            [v33 loupeAmount];
            BOOL v75 = v73 != v72 && v107 == 0;
            if ([(PUScrubberView *)self useThinLoupe]) {
              [(PUScrubberView *)self slitAspectRatio];
            }
            else {
              [v104 maxAspectRatio];
            }
            double v77 = v76;
            double v6 = v103;
            [v33 maxAspectRatio];
            double v79 = v78;
            if (v105) {
              double v80 = -30.0;
            }
            else {
              double v80 = 0.0;
            }
            [v33 timeIndicatorVerticalOffset];
            BOOL v82 = v80 != v81;
            if (v77 != v79) {
              BOOL v82 = 1;
            }
            if ((v82 | v75 | v66) == 1)
            {
              id v83 = [(PUScrubberView *)self _newScrubberLayoutWithDataSource:v103];

              v84 = [v107 indexPath];
              [v83 setExpandedItemIndexPath:v84];

              [v83 setOnlyShowExpandedItem:v31 == 1];
              [(PUScrubberView *)self _setScrubberLayout:v83];
              char v33 = v83;
            }
            id v5 = v98;
            BOOL v3 = v99;
            double v85 = -24.0;
            if (!v105) {
              double v85 = 0.0;
            }
            [v33 setTimeIndicatorVerticalOffset:v85];
            [v33 setMaxAspectRatio:v77];
            [v33 setOverrideLoupeIndexPath:v55];
            [v33 setLoupeAmount:v72];
            [v33 setExpandedItemWidth:v48];
            objc_msgSend(v33, "setShouldHighlightSelectedItems:", objc_msgSend(v98, "isInSelectionMode"));
            int64_t v86 = [(PUScrubberView *)self _expandedItemType];
            if (v86 == 3) {
              uint64_t v87 = [v101 isPlaying] ^ 1;
            }
            else {
              uint64_t v87 = v86 == 2;
            }
            [v33 setShowPlayheadForExpandedItem:v87];
            switch([(PUScrubberView *)self _expandedItemType])
            {
              case 0:
              case 1:
              case 4:
                double v88 = 0.5;
                break;
              case 2:
                v89 = [(PUScrubberView *)self _videoScrubberController];
                [v89 playheadProgress];
                double v88 = v90;

                break;
              case 3:
                [(PUScrubberView *)self _playheadProgressForIrisAssetReference:v107];
                double v88 = v91;
                break;
              default:
                double v88 = 0.0;
                break;
            }
            [v33 setExpandedItemPlayheadProgress:v88];
            objc_msgSend(v33, "setSnapToExpandedItem:", -[PUScrubberView _allowExitFromContentScrubbing](self, "_allowExitFromContentScrubbing") ^ 1);
            v92 = [v99 layout];

            if (v92 != v33)
            {
              BOOL v93 = [(PUScrubberView *)self _useSmoothingTransitionCoordinator];
              [(PUScrubberView *)self _setUseSmoothingTransitionCoordinator:0];
              [v99 transitionToLayout:v33];
              [v99 layoutIfNeeded];
              [(PUScrubberView *)self _setUseSmoothingTransitionCoordinator:v93];
            }

            BOOL v8 = v96;
            double v7 = v97;
            uint64_t v9 = v100;
            id v10 = v101;
            goto LABEL_94;
          }
        }
        int v45 = v38 | v30;
        goto LABEL_42;
      }
      BOOL v30 = 0;
      id v10 = v19;
      double v6 = v103;
LABEL_31:
      id v26 = &OBJC_IVAR___PUReviewScrubber__scrubberCellClass;
      goto LABEL_32;
    }
LABEL_19:
    if (([v10 isActivated] & 1) == 0)
    {
      [(PUScrubberView *)self _setExpandedItemType:v15];
      goto LABEL_30;
    }
    uint64_t v11 = [v10 videoPlayer];
    uint64_t v12 = 3;
LABEL_21:
    [(PUScrubberView *)self _setExpandedItemType:v12];
    if (v11) {
      goto LABEL_22;
    }
LABEL_30:
    [(PUScrubberView *)self _setVideoScrubberController:0];
    v102 = 0;
    BOOL v30 = 0;
    goto LABEL_31;
  }
}

- (void)_invalidateScrubberLayout
{
  self->_scrubberLayoutIsValid = 0;
  [(PUScrubberView *)self _setNeedsUpdate];
}

- (void)_invalidateScrubberLayoutEnsureTransition
{
  self->_scrubberLayoutNeedsTransition = 1;
  [(PUScrubberView *)self _invalidateScrubberLayout];
}

- (id)_expandedAssetReference
{
  if (![(PUScrubberView *)self canExpandCurrentAsset])
  {
    id v10 = 0;
    goto LABEL_18;
  }
  BOOL v3 = [(PUScrubberView *)self browsingSession];
  double v4 = [v3 viewModel];

  id v5 = [v4 currentAssetReference];
  double v6 = [v5 asset];
  double v7 = [v4 assetViewModelForAssetReference:v5];
  BOOL v8 = [v7 videoPlayer];
  uint64_t v9 = [v7 irisPlayer];
  if ([(PUScrubberView *)self _expandedItemType] == 4)
  {
    if ([v6 playbackStyle] != 4)
    {
LABEL_16:
      id v11 = 0;
      goto LABEL_17;
    }
  }
  else if (([(PUScrubberView *)self _expandedItemType] == 2 {
          || [(PUScrubberView *)self _expandedItemType] == 1)
  }
         && ([v6 isLivePhoto] & 1) == 0
         && ([v6 canPlayPhotoIris] & 1) == 0)
  {
    if ([v6 playbackStyle] != 4
      || ([v8 isActivated] & 1) == 0 && objc_msgSend(v8, "desiredPlayState") != 3)
    {
      goto LABEL_16;
    }
  }
  else if ([(PUScrubberView *)self _expandedItemType] != 3 {
         || ![v9 isActivated])
  }
  {
    goto LABEL_16;
  }
  id v11 = v5;
LABEL_17:
  id v10 = v11;

LABEL_18:
  return v10;
}

- (id)_currentAssetsDataSource
{
  v2 = [(PUScrubberView *)self browsingSession];
  BOOL v3 = [v2 viewModel];

  double v4 = [v3 assetsDataSource];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[PUAssetsDataSource emptyDataSource];
  }
  double v7 = v6;

  return v7;
}

- (double)_lengthForDuration:(double)a3
{
  double v4 = +[PUScrubberSettings sharedInstance];
  [v4 minVideoDuration];
  if (v5 <= a3) {
    double v5 = a3;
  }
  if (v5 >= 2.0)
  {
    float v7 = v5;
    double v6 = log2f(v7);
  }
  else
  {
    double v6 = v5 * 0.5;
  }
  [v4 baseVideoWidth];
  double v9 = v6 * v8;

  return v9;
}

- (void)_handleTapOnBrowsingIrisPlayer:(id)a3
{
  id v3 = a3;
  if (([v3 isActivated] & 1) == 0)
  {
    if (v3)
    {
      [v3 currentVideoDuration];
      if ((v11 & 0x100000000) != 0)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke;
        v9[3] = &unk_1E5F2ED10;
        double v4 = (id *)v10;
        id v5 = v3;
        v10[0] = v5;
        double v6 = v9;
LABEL_8:
        [v5 performChanges:v6];

        goto LABEL_9;
      }
    }
    else
    {
      v10[1] = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  if ([v3 isActivated])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke_2;
    v7[3] = &unk_1E5F2ED10;
    double v4 = &v8;
    id v5 = v3;
    id v8 = v5;
    double v6 = v7;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:1];
}

uint64_t __49__PUScrubberView__handleTapOnBrowsingIrisPlayer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:0];
}

- (void)_handleTapOnBrowsingVideoPlayer:(id)a3
{
  id v3 = a3;
  double v4 = [v3 asset];
  if (([v4 canPlayLoopingVideo] & 1) == 0)
  {
    id v5 = +[PUOneUpSettings sharedInstance];
    int v6 = [v5 allowAutoplayVideoForAsset:v4];

    if (v6)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke;
      v23[3] = &unk_1E5F2ED10;
      float v7 = &v24;
      id v8 = v3;
      id v24 = v8;
      double v9 = v23;
    }
    else
    {
      id v10 = [v3 asset];
      int v11 = [v10 canPlayLoopingVideo];

      if ((v11 & 1) == 0)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_2;
        v21[3] = &unk_1E5F2ED10;
        float v7 = &v22;
        id v12 = v3;
        id v22 = v12;
        [v12 performChanges:v21];
        id v13 = +[PUOneUpSettings sharedInstance];
        int v14 = [v13 allowPlayButtonInBars];

        if (v14)
        {
          if ((unint64_t)[v12 desiredPlayState] <= 2) {
            uint64_t v15 = 4;
          }
          else {
            uint64_t v15 = 2;
          }
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_3;
          v18[3] = &unk_1E5F2E0A8;
          id v19 = v12;
          uint64_t v20 = v15;
          [v19 performChanges:v18];
        }
        goto LABEL_7;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      CMTime v16[2] = __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_4;
      v16[3] = &unk_1E5F2ED10;
      float v7 = &v17;
      id v8 = v3;
      id v17 = v8;
      double v9 = v16;
    }
    [v8 performChanges:v9];
LABEL_7:
  }
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:1];
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActivated:1];
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDesiredPlayState:*(void *)(a1 + 40) reason:@"User tapped on player in scrubber."];
}

uint64_t __50__PUScrubberView__handleTapOnBrowsingVideoPlayer___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivated:1];
  v2 = *(void **)(a1 + 32);
  return [v2 setDesiredPlayState:3 reason:@"User tapped looping video in scrubber."];
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  id v5 = [(PUScrubberView *)self _tilingView];
  int v6 = [(PUScrubberView *)self browsingSession];
  float v7 = [v6 viewModel];

  id v8 = [v7 assetsDataSource];
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int64_t v31 = __Block_byref_object_copy__82561;
  double v32 = __Block_byref_object_dispose__82562;
  id v33 = 0;
  [v4 locationInView:v5];
  double v10 = v9;
  double v12 = v11;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __29__PUScrubberView__handleTap___block_invoke;
  v25[3] = &unk_1E5F2BB60;
  id v13 = v8;
  id v26 = v13;
  double v27 = &v28;
  objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v25, v10, v12, 1.0, 1.0);
  if (v29[5])
  {
    int v14 = objc_msgSend(v13, "assetReferenceAtIndexPath:");
    uint64_t v15 = [v7 currentAssetReference];
    int v16 = [v15 isEqual:v14];

    if (v16)
    {
      id v17 = [v7 assetViewModelForAssetReference:v14];
      float v18 = [v17 videoPlayer];
      uint64_t v19 = [v17 irisPlayer];
      uint64_t v20 = (void *)v19;
      if (v18)
      {
        [(PUScrubberView *)self _handleTapOnBrowsingVideoPlayer:v18];
      }
      else if (v19)
      {
        [(PUScrubberView *)self _handleTapOnBrowsingIrisPlayer:v19];
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __29__PUScrubberView__handleTap___block_invoke_2;
      v21[3] = &unk_1E5F2E908;
      id v22 = v7;
      id v23 = v14;
      id v24 = self;
      [v22 performChanges:v21];

      id v17 = v22;
    }
  }
  _Block_object_dispose(&v28, 8);
}

void __29__PUScrubberView__handleTap___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  int v6 = [v14 tileKind];
  int v7 = [v6 isEqualToString:@"PUTileKindItemContent"];

  if (v7)
  {
    id v8 = [v14 dataSourceIdentifier];
    double v9 = [*(id *)(a1 + 32) identifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      uint64_t v11 = [v14 indexPath];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }
}

uint64_t __29__PUScrubberView__handleTap___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40) transitionProgress:*(void *)(*(void *)(a1 + 48) + 424) transitionDriverIdentifier:0 animated:0.0];
}

- (void)_handleUserScrollWillBegin:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUScrubberView *)self _setIsHandlingUserScroll:1];
  [(PUScrubberView *)self _updateScrubbingAwayFromContentEdgeBeganDragging:v3];
  if (v3) {
    [(PUScrubberView *)self _setDecelerationTargetIndexPath:0];
  }
  int v6 = [(PUScrubberView *)self _tilingView];
  if (([v6 isDragging] & 1) != 0 || objc_msgSend(v6, "isDecelerating")) {
    [(PUScrubberView *)self _setScrollViewSettled:0];
  }
  int v7 = [(PUScrubberView *)self _scrubberLayout];
  id v8 = [(PUScrubberView *)self _currentAssetsDataSource];
  id v9 = [v7 dataSource];
  if (v9 == v8)
  {

    uint64_t v14 = (uint64_t)v8;
  }
  else
  {
    int v10 = v9;
    char v11 = [v9 isEqual:v8];

    if (v11) {
      goto LABEL_11;
    }
    [(PUScrubberView *)self updateIfNeeded];
    uint64_t v12 = [(PUScrubberView *)self _tilingView];
    [v12 layoutIfNeeded];

    uint64_t v13 = [(PUScrubberView *)self _scrubberLayout];

    uint64_t v14 = [(PUScrubberView *)self _currentAssetsDataSource];
    int v7 = (void *)v13;
  }

  id v8 = (id)v14;
LABEL_11:
  uint64_t v15 = [v7 dataSource];
  if (([v15 isEqual:v8] & 1) == 0)
  {
    id v16 = [v7 dataSource];

    if (v16 == v8) {
      goto LABEL_15;
    }
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUScrubberView.m", 482, @"Invalid parameter not satisfying: %@", @"[scrubberLayout.dataSource isEqual:assetsDataSource] || scrubberLayout.dataSource == assetsDataSource" object file lineNumber description];
  }

LABEL_15:
  uint64_t v17 = [(PUScrubberView *)self _videoScrubberController];
  if (!v17)
  {
    uint64_t v64 = 0;
    BOOL v65 = &v64;
    uint64_t v66 = 0x2020000000;
    char v67 = 0;
    goto LABEL_27;
  }
  float v18 = (void *)v17;
  uint64_t v19 = [v7 expandedItemIndexPath];

  uint64_t v64 = 0;
  BOOL v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  if (!v19) {
    goto LABEL_27;
  }
  if (v3)
  {
    uint64_t v20 = [(PUScrubberView *)self _tilingView];
    double v21 = [v20 panGestureRecognizer];
    id v22 = [(PUScrubberView *)self _tilingView];
    [v21 locationInView:v22];

    PXRectWithCenterAndSize();
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    int64_t v31 = [(PUScrubberView *)self browsingSession];
    double v32 = [v31 viewModel];
    id v33 = [v32 currentAssetReference];
    uint64_t v34 = [v33 indexPath];

    double v35 = [(PUScrubberView *)self _tilingView];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke;
    v61[3] = &unk_1E5F2BB60;
    id v36 = v34;
    id v62 = v36;
    double v63 = &v64;
    objc_msgSend(v35, "enumeratePresentedTileControllersInRect:usingBlock:", v61, v24, v26, v28, v30);

    long long v37 = [(PUScrubberView *)self browsingSession];
    int v38 = [v37 viewModel];
    id v39 = [v38 assetViewModelForCurrentAssetReference];
    uint64_t v40 = [v39 videoPlayer];

    if (*((unsigned char *)v65 + 24))
    {
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_2;
      v59[3] = &unk_1E5F2ED10;
      id v60 = v40;
      [v60 performChanges:v59];

      BOOL v41 = *((unsigned char *)v65 + 24) != 0;
    }
    else
    {
      BOOL v41 = 0;
    }
    [(PUScrubberView *)self setCurrentDragBeganOnContent:v41];

    goto LABEL_26;
  }
  if ([(PUScrubberView *)self _expandedItemType] == 2
    || [(PUScrubberView *)self _expandedItemType] == 3)
  {
    [v7 currentItemFocusProgress];
    double v43 = v42;
    id v36 = [(PUScrubberView *)self _videoScrubberController];
    [v36 setPlayheadProgress:v43];
LABEL_26:
  }
LABEL_27:
  int v44 = [v7 currentItemIndexPath];
  int v45 = [v7 expandedItemIndexPath];
  if ([v44 isEqual:v45])
  {

    unsigned int v46 = &OBJC_IVAR___PUScrubberView__contentScrubbingIdentifier;
  }
  else
  {
    int v47 = *((unsigned __int8 *)v65 + 24);

    unsigned int v46 = &OBJC_IVAR___PUScrubberView__contentScrubbingIdentifier;
    if (!v47) {
      unsigned int v46 = &OBJC_IVAR___PUScrubberView__scrubbingIdentifier;
    }
  }
  id v48 = *(id *)((char *)&self->super.super.super.isa + *v46);
  if (v44)
  {
    [v7 currentItemTransitionProgress];
    -[PUScrubberView _setScrubbingTransitionProgress:](self, "_setScrubbingTransitionProgress:");
    double v49 = [v8 assetReferenceAtIndexPath:v44];
    if (!v49)
    {
      v54 = [MEMORY[0x1E4F28B00] currentHandler];
      [v54 handleFailureInMethod:a2, self, @"PUScrubberView.m", 526, @"Invalid parameter not satisfying: %@", @"assetReference != nil" object file lineNumber description];
    }
    v50 = [(PUScrubberView *)self browsingSession];
    int v51 = [v50 viewModel];

    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_3;
    v55[3] = &unk_1E5F2E908;
    id v52 = v51;
    id v56 = v52;
    id v53 = v49;
    id v57 = v53;
    id v58 = v48;
    [v52 performChanges:v55];
  }
  [(PUScrubberView *)self _invalidateSnapToExpandedItem];
  [(PUScrubberView *)self _setIsHandlingUserScroll:0];

  _Block_object_dispose(&v64, 8);
}

void __45__PUScrubberView__handleUserScrollWillBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = [a3 indexPath];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  id v8 = v7;
  int v9 = [v6 isEqual:v7];

  if (v9)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivated:1];
  uint64_t result = [*(id *)(a1 + 32) desiredPlayState];
  if (result == 3)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setDesiredPlayState:4 reason:@"User began scrubbing video while video was autoplaying"];
  }
  return result;
}

uint64_t __45__PUScrubberView__handleUserScrollWillBegin___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40) transitionProgress:*(void *)(a1 + 48) transitionDriverIdentifier:0 animated:0.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setIsScrubbing:1];
}

- (BOOL)_allowExitFromContentScrubbing
{
  if (![(PUScrubberView *)self _isScrubbingAwayFromContentEdge]
    && [(PUScrubberView *)self _expandedItemType] != 1
    && [(PUScrubberView *)self _expandedItemType] != 4)
  {
    return 0;
  }
  BOOL v3 = [(PUScrubberView *)self _tilingView];
  if ([v3 isTracking]) {
    BOOL v4 = [(PUScrubberView *)self type] != 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_isDrivingPlayheadProgress
{
  BOOL v3 = [(PUScrubberView *)self _tilingView];
  if ([(PUScrubberView *)self _isHandlingUserScroll]
    || ([v3 isTracking] & 1) != 0
    || ([v3 isDecelerating] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isDragging];
  }

  return v4;
}

- (BOOL)_isContentScrubbing
{
  BOOL v3 = [(PUScrubberView *)self browsingSession];
  char v4 = [v3 viewModel];
  id v5 = [v4 transitionDriverIdentifier];

  id v6 = [(PUScrubberView *)self _scrubberLayout];
  if ([v5 isEqualToString:self->_contentScrubbingIdentifier])
  {
    id v7 = [(PUScrubberView *)self _videoScrubberController];
    if (v7)
    {
      id v8 = [v6 expandedItemIndexPath];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_isLibraryScrubbing
{
  v2 = self;
  BOOL v3 = [(PUScrubberView *)self browsingSession];
  char v4 = [v3 viewModel];
  id v5 = [v4 transitionDriverIdentifier];

  LOBYTE(v2) = [v5 isEqualToString:v2->_scrubbingIdentifier];
  return (char)v2;
}

- (id)_newScrubberLayoutWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(PUSectionedTilingLayout *)[PUScrubberTilingLayout alloc] initWithDataSource:v4];

  [(PUScrubberView *)self itemCornerRadius];
  -[PUScrubberTilingLayout setItemCornerRadius:](v5, "setItemCornerRadius:");
  [(PUScrubberView *)self slitAspectRatio];
  -[PUScrubberTilingLayout setSlitAspectRatio:](v5, "setSlitAspectRatio:");
  [(PUScrubberView *)self interItemSpacing];
  double v7 = v6;
  [(PUScrubberView *)self interSectionSpacing];
  double v9 = v8;
  -[PUScrubberTilingLayout setInterItemSpacing:](v5, "setInterItemSpacing:", v7, v7);
  -[PUSectionedTilingLayout setInterSectionSpacing:](v5, "setInterSectionSpacing:", v9, v9);
  [(PUScrubberTilingLayout *)v5 setUseEmbeddedVideoScrubber:[(PUScrubberView *)self useEmbeddedVideoScrubber]];
  if ([(PUScrubberView *)self useEmbeddedVideoScrubber]) {
    [(PUScrubberTilingLayout *)v5 setExpandedItemPadding:8.0];
  }
  int v10 = +[PUScrubberSettings sharedInstance];
  [v10 verticalMargin];
  double v12 = v11;

  [(PUScrubberView *)self topOutset];
  -[PUScrubberTilingLayout setContentPadding:](v5, "setContentPadding:", v12 + v13, 0.0, v12, 0.0);
  [(PUScrubberTilingLayout *)v5 setPlayheadVerticalOverhang:v12 * 0.5];
  [(PUScrubberTilingLayout *)v5 setDelegate:self];
  return v5;
}

- (void)_updateTilingViewIfNeeded
{
  BOOL v3 = [(PUScrubberView *)self _tilingView];
  if (!v3)
  {
    id v4 = [PUTilingView alloc];
    [(PUScrubberView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(PUScrubberView *)self _scrubberLayout];
    id v22 = -[PUTilingView initWithFrame:layout:](v4, "initWithFrame:layout:", v13, v6, v8, v10, v12);

    [(PUTilingView *)v22 setAutoresizingMask:18];
    [(PUTilingView *)v22 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(PUTilingView *)v22 setShowsHorizontalScrollIndicator:0];
    [(PUTilingView *)v22 setShowsVerticalScrollIndicator:0];
    [(PUTilingView *)v22 setClipsToBounds:0];
    [(PUTilingView *)v22 _setContentOffsetRoundingEnabled:0];
    [(PUTilingView *)v22 _setAutomaticContentOffsetAdjustmentEnabled:0];
    [(PUTilingView *)v22 _setSupportsPointerDragScrolling:1];
    [(PUScrubberView *)self addSubview:v22];
    [(PUTilingView *)v22 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUFilmstripTileViewReuseIdentifier"];
    [(PUTilingView *)v22 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUScrubberImageTileViewReuseIdentifier"];
    [(PUTilingView *)v22 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUPlayheadTileViewReuseIdentifier"];
    [(PUTilingView *)v22 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUPlaybackTimeIndicatorTileViewReuseIdentifier"];
    [(PUTilingView *)v22 registerTileControllerClass:objc_opt_class() forReuseIdentifier:@"PUVideoHighlightStripTileViewControllerReuseIdentifier"];
    [(PUScrubberView *)self _setTilingView:v22];
    BOOL v3 = v22;
  }
  id v23 = v3;
  uint64_t v14 = [v3 layout];
  [v23 bounds];
  double v16 = v15;
  [v14 slitAspectRatio];
  double v18 = v17 * v16;
  [v14 interItemSpacing];
  double v20 = (v18 + v19) * -3.0;
  double v21 = 0.0;
  if (v20 <= 0.0) {
    double v21 = v20;
  }
  objc_msgSend(v23, "setLoadingInsets:", 0.0, v21, 0.0, v21);
}

- (void)_setTilingView:(id)a3
{
  double v5 = (PUTilingView *)a3;
  p_tilingView = &self->__tilingView;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    double v13 = v5;
    [(PUTilingView *)tilingView setTileSource:0];
    [(PUTilingView *)*p_tilingView setTileTransitionDelegate:0];
    [(PUTilingView *)*p_tilingView setScrollDelegate:0];
    [(PUTilingView *)*p_tilingView setDelegate:0];
    objc_storeStrong((id *)&self->__tilingView, a3);
    [(PUTilingView *)*p_tilingView setTileSource:self];
    [(PUTilingView *)*p_tilingView setTileTransitionDelegate:self];
    [(PUTilingView *)*p_tilingView setScrollDelegate:self];
    [(PUTilingView *)*p_tilingView setDelegate:self];
    double v8 = [(PUScrubberView *)self browsingSession];
    [v8 configureTilingView:v13];

    double v9 = [(PUScrubberView *)self _tapGestureRecognizer];
    double v10 = [v9 view];
    double v11 = *p_tilingView;

    if (v10 != v11)
    {
      double v12 = [v9 view];
      [v12 removeGestureRecognizer:v9];

      [(PUTilingView *)*p_tilingView addGestureRecognizer:v9];
    }

    double v5 = v13;
  }
}

- (void)_setScrubbingAwayFromContentEdge:(BOOL)a3
{
  if (self->__isScrubbingAwayFromContentEdge != a3)
  {
    self->__isScrubbingAwayFromContentEdge = a3;
    [(PUScrubberView *)self _invalidateSnapToExpandedItem];
  }
}

- (void)_setVideoScrubberController:(id)a3
{
  double v5 = (PXVideoScrubberController *)a3;
  videoScrubberController = self->__videoScrubberController;
  double v7 = v5;
  if (videoScrubberController != v5)
  {
    [(PXVideoScrubberController *)videoScrubberController setDelegate:0];
    objc_storeStrong((id *)&self->__videoScrubberController, a3);
    [(PXVideoScrubberController *)v7 setDelegate:self];
  }
}

- (void)_updateSnapToExpandedItemIfNeeded
{
  if (!self->_snapToExpandedIsValid)
  {
    self->_snapToExpandedIsValid = 1;
    uint64_t v3 = [(PUScrubberView *)self _allowExitFromContentScrubbing] ^ 1;
    [(PUScrubberView *)self _setSnapToExpandedItem:v3];
  }
}

- (void)_invalidateSnapToExpandedItem
{
  self->_snapToExpandedIsValid = 0;
  [(PUScrubberView *)self _setNeedsUpdate];
}

- (void)_updateLoupeEffectIfNeeded
{
  if (!self->_loupeEffectIsValid)
  {
    self->_loupeEffectIsValid = 1;
    uint64_t v3 = +[PUScrubberSettings sharedInstance];
    uint64_t v4 = [v3 interactiveLoupeBehavior];

    id v9 = [(PUScrubberView *)self _tilingView];
    if ([v9 isDecelerating] && !objc_msgSend(v9, "isTracking")
      || [(PUScrubberView *)self _isHandlingScrollViewWillEndDragging]
      || [v9 isDragging] && !v4)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = objc_msgSend(v9, "pu_isPerformingScrollTest") ^ 1;
    }
    [(PUScrubberView *)self _setUseLoupe:v5];
    if (([v9 isDragging] & 1) != 0 || objc_msgSend(v9, "isDecelerating"))
    {
      double v6 = [(PUScrubberView *)self _decelerationTargetIndexPath];
      if (v6) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = v4 == 1;
      }
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(PUScrubberView *)self setUseThinLoupe:v8];
  }
}

- (void)_invalidateLoupeEffect
{
  self->_loupeEffectIsValid = 0;
  [(PUScrubberView *)self _setNeedsUpdate];
}

- (void)updateIfNeeded
{
  [(PUScrubberView *)self _updateLoupeEffectIfNeeded];
  [(PUScrubberView *)self _updateSnapToExpandedItemIfNeeded];
  [(PUScrubberView *)self _updateScrubberLayoutIfNeeded];
  [(PUScrubberView *)self _updateTilingViewIfNeeded];
}

- (void)_setDecelerationTargetIndexPath:(id)a3
{
  uint64_t v5 = (NSIndexPath *)a3;
  decelerationTargetIndexPath = self->__decelerationTargetIndexPath;
  if (decelerationTargetIndexPath != v5)
  {
    uint64_t v8 = v5;
    char v7 = [(NSIndexPath *)decelerationTargetIndexPath isEqual:v5];
    uint64_t v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__decelerationTargetIndexPath, a3);
      [(PUScrubberView *)self _invalidateLoupeEffect];
      [(PUScrubberView *)self _invalidateScrubberLayout];
      uint64_t v5 = v8;
    }
  }
}

- (void)_setHandlingScrollViewWillEndDragging:(BOOL)a3
{
  if (self->__isHandlingScrollViewWillEndDragging != a3)
  {
    self->__isHandlingScrollViewWillEndDragging = a3;
    [(PUScrubberView *)self _invalidateLoupeEffect];
    [(PUScrubberView *)self _invalidateScrubberLayout];
  }
}

- (void)_setSnapToExpandedItem:(BOOL)a3
{
  if (self->__snapToExpandedItem != a3)
  {
    self->__snapToExpandedItem = a3;
    [(PUScrubberView *)self _invalidateScrubberLayout];
  }
}

- (void)setUseThinLoupe:(BOOL)a3
{
  if (self->_useThinLoupe != a3)
  {
    self->_useThinLoupe = a3;
    [(PUScrubberView *)self _invalidateScrubberLayout];
  }
}

- (void)_setUseLoupe:(BOOL)a3
{
  if (self->__useLoupe != a3)
  {
    self->__useLoupe = a3;
    [(PUScrubberView *)self _invalidateScrubberLayout];
  }
}

- (void)cancelDeceleration
{
  uint64_t v3 = [(PUScrubberView *)self _tilingView];
  int v4 = [v3 isDecelerating];

  if (v4)
  {
    id v6 = [(PUScrubberView *)self _tilingView];
    uint64_t v5 = [(PUScrubberView *)self _tilingView];
    [v5 contentOffset];
    objc_msgSend(v6, "setContentOffset:animated:", 0);
  }
}

- (void)endPreviewing
{
  [(PUScrubberView *)self _endScrubbing];
  uint64_t v3 = [(PUScrubberView *)self browsingSession];
  int v4 = [v3 viewModel];

  [(PUScrubberView *)self _updateScrollPositionAnimated:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__PUScrubberView_endPreviewing__block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 performChanges:v6];
}

void __31__PUScrubberView_endPreviewing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetsDataSource];
  id v3 = [v2 startingAssetReference];

  [*(id *)(a1 + 32) setCurrentAssetReference:v3 transitionProgress:*(void *)(*(void *)(a1 + 40) + 408) transitionDriverIdentifier:0 animated:0.0];
}

- (void)beginPreviewing
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToShouldIgnoreHitTestWithEvent = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(PUScrubberView *)self _invalidateScrubberLayout];
  }
}

- (void)setSelectionManager:(id)a3
{
  id v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  if (selectionManager != v5)
  {
    id v7 = v5;
    [(PXSectionedSelectionManager *)selectionManager unregisterChangeObserver:self context:PXSelectionManagerObservationContext];
    objc_storeStrong((id *)&self->_selectionManager, a3);
    [(PXSectionedSelectionManager *)self->_selectionManager registerChangeObserver:self context:PXSelectionManagerObservationContext];
    id v5 = v7;
  }
}

- (void)setBrowsingSession:(id)a3
{
  id v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  double v13 = v5;
  if (browsingSession != v5)
  {
    id v7 = [(PUBrowsingSession *)browsingSession viewModel];
    [v7 unregisterChangeObserver:self];

    objc_storeStrong((id *)&self->_browsingSession, a3);
    uint64_t v8 = [(PUBrowsingSession *)self->_browsingSession viewModel];
    [v8 registerChangeObserver:self];

    [(NSMutableDictionary *)self->_aspectRatioByIndexPath removeAllObjects];
    [(PUScrubberView *)self _setDecelerationTargetIndexPath:0];
    [(PUScrubberView *)self _invalidateLoupeEffect];
    [(PUScrubberView *)self _invalidateScrubberLayout];
    [(PUScrubberView *)self _invalidateSnapToExpandedItem];
    id v9 = [(PUBrowsingSession *)v13 actionManager];
    double v10 = objc_msgSend(v9, "px_selectionManager");
    [(PUScrubberView *)self setSelectionManager:v10];

    double v11 = [(PUScrubberView *)self _tilingView];

    if (v11)
    {
      double v12 = [(PUScrubberView *)self _tilingView];
      [(PUBrowsingSession *)v13 configureTilingView:v12];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUScrubberView;
  [(PUScrubberView *)&v3 layoutSubviews];
  [(PUScrubberView *)self updateIfNeeded];
}

- (void)dealloc
{
  [(PUTilingView *)self->__tilingView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PUScrubberView;
  [(PUScrubberView *)&v3 dealloc];
}

- (PUScrubberView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)PUScrubberView;
  objc_super v3 = -[PUScrubberView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    v3->_canExpandCurrentAsset = 1;
    id v5 = +[PUScrubberSettings sharedInstance];
    [v5 slitAspectRatio];
    v4->_slitAspectRatio = v6;
    [v5 interItemSpacing];
    v4->_interItemSpacing = v7;
    [v5 interSectionSpacing];
    v4->_interSectionSpacing = v8;
    [v5 itemCornerRadius];
    v4->_itemCornerRadius = v9;
    [v5 topOutset];
    v4->_topOutset = v10;
    v4->_useEmbeddedVideoScrubber = 0;
    v4->_embeddedVideoScrubberWidthFraction = 0.7;
    double v11 = +[PUOneUpSettings sharedInstance];
    int v12 = [v11 useDebuggingColors];

    if (v12)
    {
      double v13 = [MEMORY[0x1E4FB1618] yellowColor];
      [(PUScrubberView *)v4 setBackgroundColor:v13];
    }
    uint64_t v14 = [(id)objc_opt_class() description];
    double v15 = [MEMORY[0x1E4F29128] UUID];
    double v16 = [v15 UUIDString];
    uint64_t v17 = [v14 stringByAppendingString:v16];
    scrubbingIdentifier = v4->_scrubbingIdentifier;
    v4->_scrubbingIdentifier = (NSString *)v17;

    double v19 = [(id)objc_opt_class() description];
    double v20 = [MEMORY[0x1E4F29128] UUID];
    double v21 = [v20 UUIDString];
    uint64_t v22 = [v19 stringByAppendingString:v21];
    contentScrubbingIdentifier = v4->_contentScrubbingIdentifier;
    v4->_contentScrubbingIdentifier = (NSString *)v22;

    double v24 = [(id)objc_opt_class() description];
    double v25 = [MEMORY[0x1E4F29128] UUID];
    double v26 = [v25 UUIDString];
    uint64_t v27 = [v24 stringByAppendingString:v26];
    transitionLayoutIdentifier = v4->_transitionLayoutIdentifier;
    v4->_transitionLayoutIdentifier = (NSString *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__handleTap_];
    tapGestureRecognizer = v4->__tapGestureRecognizer;
    v4->__tapGestureRecognizer = (UITapGestureRecognizer *)v29;

    int64_t v31 = [[PUTouchingGestureRecognizer alloc] initWithTarget:v4 action:sel_handleTouchGesture_];
    touchingGestureRecognizer = v4->_touchingGestureRecognizer;
    v4->_touchingGestureRecognizer = v31;

    [(PUTouchingGestureRecognizer *)v4->_touchingGestureRecognizer setDelegate:v4];
    [(PUScrubberView *)v4 addGestureRecognizer:v4->_touchingGestureRecognizer];
    v4->__useSmoothingTransitionCoordinator = 1;
    v4->__scrollViewSettled = 1;
    id v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aspectRatioByIndexPath = v4->_aspectRatioByIndexPath;
    v4->_aspectRatioByIndexPath = v33;
  }
  return v4;
}

@end