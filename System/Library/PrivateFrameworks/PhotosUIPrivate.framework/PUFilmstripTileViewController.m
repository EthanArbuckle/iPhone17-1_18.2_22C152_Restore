@interface PUFilmstripTileViewController
- (BOOL)isExpanded;
- (BOOL)wantsVisibleRectChanges;
- (CGSize)expandedSize;
- (CGSize)targetSizeForProposedTargetSize:(CGSize)a3;
- (CGSize)unexpandedSize;
- (PUBrowsingVideoPlayer)videoPlayer;
- (PUFilmstripWrapperView)wrapperView;
- (id)_currentIndicatorInfos;
- (id)loadView;
- (void)_updateFilmStripContents;
- (void)_updateFilmstripView;
- (void)applyLayoutInfo:(id)a3;
- (void)assetViewModelDidChange:(id)a3;
- (void)becomeReusable;
- (void)didChangeAnimating;
- (void)didChangeVisibleRect;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedSize:(CGSize)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setUnexpandedSize:(CGSize)a3;
- (void)setVideoPlayer:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUFilmstripTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setUnexpandedSize:(CGSize)a3
{
  self->_unexpandedSize = a3;
}

- (CGSize)unexpandedSize
{
  double width = self->_unexpandedSize.width;
  double height = self->_unexpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)expandedSize
{
  double width = self->_expandedSize.width;
  double height = self->_expandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (PUFilmstripWrapperView)wrapperView
{
  return self->_wrapperView;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUFilmstripTileViewController;
  [(PUImageTileViewController *)&v16 viewModel:a3 didChange:v6];
  int v7 = [v6 highlightTimeRangesChanged];
  if ([v6 videoPlayerDidChange])
  {
    v8 = [(PUImageTileViewController *)self assetViewModel];
    v9 = [v8 videoPlayer];
    [(PUFilmstripTileViewController *)self setVideoPlayer:v9];
  }
  v10 = [v6 videoPlayerChange];
  if ([v10 playerItemDidChange])
  {
    int v11 = 1;
  }
  else
  {
    v12 = [v6 videoPlayerChange];
    int v13 = [v12 avPlayerDidChange];

    int v11 = v13 | v7;
  }

  v14 = [v6 irisPlayerChange];
  char v15 = [v14 currentlyDisplayedTimesDidChange];

  if ((v15 & 1) != 0 || v11) {
    [(PUFilmstripTileViewController *)self _updateFilmstripView];
  }
}

- (id)_currentIndicatorInfos
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PUImageTileViewController *)self assetViewModel];
  v5 = [v4 irisPlayer];
  id v6 = [v4 videoPlayer];
  int v7 = [(PUImageTileViewController *)self asset];
  if (![v7 canPlayPhotoIris])
  {
    if (v6)
    {
      [v6 duration];
      goto LABEL_6;
    }
LABEL_7:
    CMTimeEpoch epoch = 0;
    CMTimeFlags flags = 0;
    memset(&time1, 0, sizeof(time1));
    goto LABEL_8;
  }
  if (!v5) {
    goto LABEL_7;
  }
  [v5 currentVideoDuration];
LABEL_6:
  CMTimeFlags flags = time1.flags;
  CMTimeEpoch epoch = time1.epoch;
LABEL_8:
  CMTimeValue value = time1.value;
  CMTimeScale timescale = time1.timescale;
  if ((flags & 0x1D) == 1
    && (time1.CMTimeValue value = value,
        time1.CMTimeScale timescale = timescale,
        time1.CMTimeFlags flags = flags,
        time1.CMTimeEpoch epoch = epoch,
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
        CMTimeCompare(&time1, &time2)))
  {
    time1.CMTimeValue value = value;
    time1.CMTimeScale timescale = timescale;
    time1.CMTimeFlags flags = flags;
    time1.CMTimeEpoch epoch = epoch;
    double Seconds = CMTimeGetSeconds(&time1);
  }
  else
  {
    [v7 duration];
  }
  double v11 = Seconds;
  if (Seconds > 0.0)
  {
    if (v5)
    {
      v12 = [v5 currentlyDisplayedTimes];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__PUFilmstripTileViewController__currentIndicatorInfos__block_invoke;
      v15[3] = &unk_1E5F255F0;
      double v17 = v11;
      v15[4] = self;
      id v16 = v3;
      [v12 enumerateObjectsUsingBlock:v15];
    }
    else if (v6 && [v6 desiredPlayState] == 3 && (objc_msgSend(v6, "isActivated") & 1) == 0)
    {
      memset(&time1, 0, sizeof(time1));
      [v6 currentTime];
      CMTime time2 = time1;
      v14 = [[PUFilmStripViewIndicatorInfo alloc] initWithLocation:0 preferredColor:CMTimeGetSeconds(&time2) / v11];
      [v3 addObject:v14];
    }
  }

  return v3;
}

void __55__PUFilmstripTileViewController__currentIndicatorInfos__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3 / *(double *)(a1 + 48);
  v5 = [PUFilmStripViewIndicatorInfo alloc];
  id v6 = [*(id *)(a1 + 32) view];
  int v7 = [v6 tintColor];
  v8 = [(PUFilmStripViewIndicatorInfo *)v5 initWithLocation:v7 preferredColor:v4];

  [*(id *)(a1 + 40) addObject:v8];
}

- (void)_updateFilmstripView
{
  double v3 = [(PUFilmstripTileViewController *)self wrapperView];
  double v4 = [v3 filmstripView];
  BOOL v5 = [(PUFilmstripTileViewController *)self isExpanded];
  if (v5 && !v4)
  {
    id v6 = [PUFilmstripView alloc];
    [v3 bounds];
    double v4 = -[PUFilmstripView initWithFrame:](v6, "initWithFrame:");
    [(PUFilmstripView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 setFilmstripView:v4];
  }
  if (v4) {
    char v7 = v5;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0 && ![(PUTileController *)self isAnimating])
  {
    [v3 setFilmstripView:0 leavingPreviousViewInPlace:1];
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke;
    v13[3] = &unk_1E5F2ED10;
    v14 = v4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke_2;
    v11[3] = &unk_1E5F2CEE8;
    v12 = v14;
    [v8 animateWithDuration:v13 animations:v11 completion:0.25];

    double v4 = 0;
  }
  if (![(PUTileController *)self isAnimating]) {
    [(PUFilmstripTileViewController *)self _updateFilmStripContents];
  }
  v9 = [(PUImageTileViewController *)self image];
  [(PUFilmstripView *)v4 setPlaceholderImage:v9];

  v10 = [(PUFilmstripTileViewController *)self _currentIndicatorInfos];
  [(PUFilmstripView *)v4 setIndicatorInfos:v10];

  objc_msgSend(v3, "setAnimating:", -[PUTileController isAnimating](self, "isAnimating"));
  [(PUTileViewController *)self visibleRect];
  objc_msgSend(v3, "setVisibleRect:");
  objc_msgSend(v3, "setExpanded:", -[PUFilmstripTileViewController isExpanded](self, "isExpanded"));
  [(PUFilmstripTileViewController *)self expandedSize];
  objc_msgSend(v3, "setExpandedSize:");
}

uint64_t __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__PUFilmstripTileViewController__updateFilmstripView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateFilmStripContents
{
  double v3 = [(PUFilmstripTileViewController *)self wrapperView];
  id v15 = [v3 filmstripView];

  double v4 = [(PUImageTileViewController *)self assetViewModel];
  BOOL v5 = [v4 videoPlayer];
  id v6 = [v5 playerItem];
  char v7 = [v6 asset];

  if (!v7)
  {
    v8 = [(PUImageTileViewController *)self assetViewModel];
    v9 = [v8 irisPlayer];
    v10 = [v9 playerItem];
    char v7 = [v10 asset];
  }
  double v11 = [(PUImageTileViewController *)self assetViewModel];
  v12 = [v11 videoPlayer];
  int v13 = [v12 playerItem];
  v14 = [v13 videoComposition];

  [v15 setAsset:v7 videoComposition:v14];
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    [(PUFilmstripTileViewController *)self _updateFilmstripView];
  }
}

- (void)setExpandedSize:(CGSize)a3
{
  if (self->_expandedSize.width != a3.width || self->_expandedSize.height != a3.height)
  {
    self->_expandedSize = a3;
    [(PUFilmstripTileViewController *)self _updateFilmstripView];
  }
}

- (void)setVideoPlayer:(id)a3
{
  BOOL v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    char v7 = v5;
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterTimeObserver:self];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->_videoPlayer registerTimeObserver:self];
    BOOL v5 = v7;
  }
}

- (void)assetViewModelDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUFilmstripTileViewController;
  [(PUImageTileViewController *)&v6 assetViewModelDidChange:a3];
  double v4 = [(PUImageTileViewController *)self assetViewModel];
  BOOL v5 = [v4 videoPlayer];
  [(PUFilmstripTileViewController *)self setVideoPlayer:v5];

  [(PUFilmstripTileViewController *)self _updateFilmstripView];
}

- (void)didChangeAnimating
{
  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripTileViewController;
  [(PUTileController *)&v3 didChangeAnimating];
  [(PUFilmstripTileViewController *)self _updateFilmstripView];
}

- (void)didChangeVisibleRect
{
  v3.receiver = self;
  v3.super_class = (Class)PUFilmstripTileViewController;
  [(PUImageTileViewController *)&v3 didChangeVisibleRect];
  [(PUFilmstripTileViewController *)self _updateFilmstripView];
}

- (BOOL)wantsVisibleRectChanges
{
  return 1;
}

- (void)becomeReusable
{
  v4.receiver = self;
  v4.super_class = (Class)PUFilmstripTileViewController;
  [(PUImageTileViewController *)&v4 becomeReusable];
  [(PUImageTileViewController *)self setAssetViewModel:0];
  [(PUFilmstripTileViewController *)self setExpanded:0];
  -[PUFilmstripTileViewController setExpandedSize:](self, "setExpandedSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_super v3 = [(PUFilmstripTileViewController *)self wrapperView];
  [v3 setAnchoredLeft:0];
}

- (CGSize)targetSizeForProposedTargetSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(PUFilmstripTileViewController *)self unexpandedSize];
  if (v7 != *MEMORY[0x1E4F1DB30] || v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v9 = [(PUTileViewController *)self view];
    v10 = [v9 window];
    double v11 = [v10 screen];
    [v11 scale];
    double v13 = v12;

    if (v13 < 1.0)
    {
      v14 = [(PUTileController *)self tilingView];
      id v15 = [v14 window];
      id v16 = [v15 screen];
      [v16 scale];
      double v13 = v17;
    }
    if (v13 < 1.0 && PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    [(PUFilmstripTileViewController *)self unexpandedSize];
    PXSizeScale();
    PXSizeMin();
    CGFloat width = v18;
    CGFloat height = v19;
  }
  double v20 = width;
  double v21 = height;
  result.CGFloat height = v21;
  result.CGFloat width = v20;
  return result;
}

- (void)applyLayoutInfo:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUFilmstripTileViewController;
  [(PUImageTileViewController *)&v18 applyLayoutInfo:v5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUFilmstripTileViewController.m", 72, @"Invalid parameter not satisfying: %@", @"[layoutInfo isKindOfClass:PUExpandableTileLayoutInfo.class]" object file lineNumber description];
  }
  id v6 = v5;
  [v6 expandedSize];
  -[PUFilmstripTileViewController setExpandedSize:](self, "setExpandedSize:");
  -[PUFilmstripTileViewController setExpanded:](self, "setExpanded:", [v6 isExpanded]);
  [v6 unexpandedSize];
  -[PUFilmstripTileViewController setUnexpandedSize:](self, "setUnexpandedSize:");
  [v6 cornerRadius];
  double v8 = v7;
  v9 = [(PUImageTileViewController *)self imageView];
  v10 = [v9 layer];
  [v10 setCornerRadius:v8];

  double v11 = [v6 cornerCurve];
  double v12 = [(PUImageTileViewController *)self imageView];
  double v13 = [v12 layer];
  [v13 setCornerCurve:v11];

  uint64_t v14 = [v6 cornerMask];
  id v15 = [(PUImageTileViewController *)self imageView];
  id v16 = [v15 layer];
  [v16 setMaskedCorners:v14];
}

- (id)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripTileViewController;
  objc_super v3 = [(PUImageTileViewController *)&v7 loadView];
  objc_super v4 = [PUFilmstripWrapperView alloc];
  [v3 bounds];
  id v5 = -[PUFilmstripWrapperView initWithFrame:](v4, "initWithFrame:");
  [(PUFilmstripWrapperView *)v5 setUserInteractionEnabled:0];
  [(PUFilmstripTileViewController *)self expandedSize];
  -[PUFilmstripWrapperView setExpandedSize:](v5, "setExpandedSize:");
  objc_storeStrong((id *)&self->_wrapperView, v5);
  [(PUFilmstripWrapperView *)v5 setBackgroundView:v3];

  return v5;
}

@end