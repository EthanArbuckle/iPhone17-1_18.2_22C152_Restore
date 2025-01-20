@interface PUVideoHighlightStripTileViewController
+ (double)preferredTileHeight;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingVideoPlayer)videoPlayer;
- (UIColor)highlightColor;
- (_PUVideoHighlightStripView)highlightsView;
- (void)_updateHighlightsView;
- (void)_updateHighlightsViewCurrentTime;
- (void)becomeReusable;
- (void)setAssetViewModel:(id)a3;
- (void)setCurrentTime:(id *)a3;
- (void)setHighlightColor:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4;
- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUVideoHighlightStripTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_highlightsView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (_PUVideoHighlightStripView)highlightsView
{
  return self->_highlightsView;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  if (a3)
  {
    [a3 desiredSeekTime];
  }
  else
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
  }
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PUVideoHighlightStripTileViewController *)self setCurrentTime:&v5];
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  if (a3)
  {
    [a3 currentTime];
  }
  else
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
  }
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PUVideoHighlightStripTileViewController *)self setCurrentTime:&v5];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PUVideoHighlightStripTileViewController *)self assetViewModel];

  if (v7 == v6)
  {
    if (([v9 highlightTimeRangesChanged] & 1) != 0
      || ([v9 videoPlayerDidChange] & 1) != 0
      || ([v9 videoPlayerChange], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      [(PUVideoHighlightStripTileViewController *)self _updateHighlightsView];
    }
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoHighlightStripTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUVideoHighlightStripTileViewController *)self setAssetViewModel:0];
}

- (void)_updateHighlightsViewCurrentTime
{
  [(PUVideoHighlightStripTileViewController *)self currentTime];
  objc_super v3 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
  long long v4 = v6;
  uint64_t v5 = v7;
  [v3 setCurrentTime:&v4];
}

- (void)setCurrentTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 currentTime = &self->_currentTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentTime = self->_currentTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_currentTime->epoch = a3->var3;
    *(_OWORD *)&p_currentTime->value = v6;
    [(PUVideoHighlightStripTileViewController *)self _updateHighlightsViewCurrentTime];
  }
}

- (void)setHighlightColor:(id)a3
{
  uint64_t v8 = (UIColor *)a3;
  uint64_t v5 = self->_highlightColor;
  long long v6 = v8;
  if (v5 != v8)
  {
    char v7 = [(UIColor *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_highlightColor, a3);
    long long v6 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
    [v6 setHighlightColor:v8];
  }

LABEL_5:
}

- (void)_updateHighlightsView
{
  objc_super v3 = [(PUVideoHighlightStripTileViewController *)self assetViewModel];
  long long v4 = [v3 highlightTimeRanges];
  uint64_t v5 = [v3 videoPlayer];
  long long v6 = [v5 timeRangeMapper];

  if (v6)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __64__PUVideoHighlightStripTileViewController__updateHighlightsView__block_invoke;
    v24 = &unk_1E5F2C438;
    id v25 = v6;
    uint64_t v7 = PXMap();

    long long v4 = (void *)v7;
  }
  uint64_t v8 = [v3 shouldShowHighlightTimeRanges] ^ 1;
  id v9 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
  [v9 setHidden:v8];

  v10 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
  [v10 setHighlightTimeRanges:v4];

  v11 = [v3 videoPlayer];
  v12 = v11;
  if (v11)
  {
    [v11 duration];
  }
  else
  {
    long long v19 = 0uLL;
    uint64_t v20 = 0;
  }
  v13 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
  long long v17 = v19;
  uint64_t v18 = v20;
  [v13 setVideoDuration:&v17];

  v14 = [v3 videoPlayer];
  uint64_t v15 = [v14 isPlaybackDesired];
  v16 = [(PUVideoHighlightStripTileViewController *)self highlightsView];
  [v16 setIsPlaying:v15];

  [(PUVideoHighlightStripTileViewController *)self _updateHighlightsViewCurrentTime];
}

id __64__PUVideoHighlightStripTileViewController__updateHighlightsView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = v3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 CMTimeRangeValue];
    if (v5)
    {
LABEL_3:
      [v5 scaledTimeRangeForOriginalTimeRange:v9];
      goto LABEL_6;
    }
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    if (v5) {
      goto LABEL_3;
    }
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
LABEL_6:
  v8[0] = v10;
  v8[1] = v11;
  v8[2] = v12;
  long long v6 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:v8];

  return v6;
}

- (void)setVideoPlayer:(id)a3
{
  uint64_t v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterTimeObserver:self];
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    if (v5)
    {
      [(PUBrowsingVideoPlayer *)v5 currentTime];
    }
    else
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
    }
    long long v7 = v9;
    uint64_t v8 = v10;
    [(PUVideoHighlightStripTileViewController *)self setCurrentTime:&v7];
    [(PUBrowsingVideoPlayer *)v5 registerTimeObserver:self];
  }
}

- (void)setAssetViewModel:(id)a3
{
  uint64_t v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  uint64_t v8 = v5;
  if (assetViewModel != v5)
  {
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    long long v7 = [(PUAssetViewModel *)v8 videoPlayer];
    [(PUVideoHighlightStripTileViewController *)self setVideoPlayer:v7];

    [(PUAssetViewModel *)v8 registerChangeObserver:self];
    [(PUVideoHighlightStripTileViewController *)self _updateHighlightsView];
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PUVideoHighlightStripTileViewController;
  [(PUTileViewController *)&v11 viewDidLoad];
  id v3 = [(PUTileViewController *)self view];
  [v3 bounds];
  uint64_t v8 = -[_PUVideoHighlightStripView initWithFrame:]([_PUVideoHighlightStripView alloc], "initWithFrame:", v4, v5, v6, v7);
  [(_PUVideoHighlightStripView *)v8 setAutoresizingMask:18];
  [v3 addSubview:v8];
  long long v9 = [(PUVideoHighlightStripTileViewController *)self highlightColor];
  [(_PUVideoHighlightStripView *)v8 setHighlightColor:v9];

  highlightsView = self->_highlightsView;
  self->_highlightsView = v8;

  [(PUVideoHighlightStripTileViewController *)self _updateHighlightsView];
}

+ (double)preferredTileHeight
{
  return 5.0;
}

@end