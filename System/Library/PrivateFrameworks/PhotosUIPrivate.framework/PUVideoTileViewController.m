@interface PUVideoTileViewController
+ (id)keyFrameTimeLoadingQueue;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)assetKeyFrameSourceTime;
- (AVPlayerLayer)playerLayer;
- (BOOL)_isDisplayingFullQualityImage;
- (BOOL)_isDisplayingVideo;
- (BOOL)adoptAssetTransitionInfo:(id)a3;
- (BOOL)canPlayVideo;
- (BOOL)currentImageIsPlaceholder;
- (BOOL)isOnSecondScreen;
- (BOOL)placeholderHiddenBehindVideoView;
- (BOOL)placeholderIsAnimatingToHidden;
- (BOOL)placeholderVisible;
- (BOOL)playerDidPlayToEnd;
- (BOOL)playerIsSeeking;
- (BOOL)videoOutputIsReadyForDisplay;
- (CGSize)_targetSize;
- (CGSize)requestedImageTargetSize;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingVideoPlayer)browsingVideoPlayer;
- (PUBrowsingViewModel)browsingViewModel;
- (PUDisplayAsset)asset;
- (PUMediaProvider)mediaProvider;
- (PUVideoTileViewController)initWithReuseIdentifier:(id)a3;
- (PXVideoSession)videoSession;
- (PXVideoSessionUIView)videoView;
- (UIImage)displayedPreloadedImage;
- (UIView)borderView;
- (id)_readyForDisplayCompletionHandler;
- (id)generateAssetTransitionInfo;
- (id)loadView;
- (id)readyForDisplayChangeHandler;
- (id)viewsForApplyingBorder;
- (id)viewsForApplyingCornerRadius;
- (int)_currentImageRequestID;
- (int64_t)_thumbnailRequestNumber;
- (void)_callReadyToDisplayChangeHandler;
- (void)_fetchKeyTimeForAsset:(id)a3;
- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4;
- (void)_handleImageResult:(id)a3 info:(id)a4 synchronous:(BOOL)a5;
- (void)_handleKeyFrameSourceTime:(id *)a3 forAsset:(id)a4;
- (void)_layoutLiveEffectsRenderDebugIndicator;
- (void)_setAsset:(id)a3;
- (void)_setCurrentImageRequestID:(int)a3;
- (void)_setDisplayingFullQualityImage:(BOOL)a3;
- (void)_setImageResult:(id)a3 pixelBuffer:(__CVBuffer *)a4 info:(id)a5 synchronous:(BOOL)a6;
- (void)_setReadyForDisplayCompletionHandler:(id)a3;
- (void)_setTargetSize:(CGSize)a3;
- (void)_setThumbnailRequestNumber:(int64_t)a3;
- (void)_updateDebugBorders;
- (void)_updateImage;
- (void)_updateInteractionHostViewRegistration;
- (void)_updateLiveEffectsRenderDebugIndicator;
- (void)_updateLiveEffectsRenderDebugIndicatorVisibility;
- (void)_updatePlaceholderVisibility;
- (void)_updateReadyForDisplay;
- (void)_updateTargetSize;
- (void)_updateVideo;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)didChangeActive;
- (void)didChangeAnimating;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForVideoResolutionChange;
- (void)removeAllAnimations;
- (void)setAssetKeyFrameSourceTime:(id *)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingVideoPlayer:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setCanPlayVideo:(BOOL)a3;
- (void)setCurrentImageIsPlaceholder:(BOOL)a3;
- (void)setDisplayedPreloadedImage:(id)a3;
- (void)setEdgeAntialiasingEnabled:(BOOL)a3;
- (void)setIsOnSecondScreen:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPlaceholderHiddenBehindVideoView:(BOOL)a3;
- (void)setPlaceholderIsAnimatingToHidden:(BOOL)a3;
- (void)setPlaceholderVisible:(BOOL)a3;
- (void)setPlaceholderVisible:(BOOL)a3 animated:(BOOL)a4 animationDuration:(double)a5 completion:(id)a6;
- (void)setPlayerDidPlayToEnd:(BOOL)a3;
- (void)setPlayerIsSeeking:(BOOL)a3;
- (void)setPreloadedImage:(id)a3;
- (void)setReadyForDisplayChangeHandler:(id)a3;
- (void)setRequestedImageTargetSize:(CGSize)a3;
- (void)setVideoSession:(id)a3;
- (void)setVideoView:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4;
- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4;
- (void)videoSessionViewPlaceholderVisibilityChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUVideoTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_browsingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_displayedPreloadedImage, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong(&self->__readyForDisplayCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong(&self->_readyForDisplayChangeHandler, 0);
  objc_storeStrong((id *)&self->_liveEffectRenderingDebugIndicator, 0);
  objc_storeStrong((id *)&self->_pixelBufferView, 0);
  objc_storeStrong((id *)&self->_preloadedImage, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (PUBrowsingVideoPlayer)browsingVideoPlayer
{
  return self->_browsingVideoPlayer;
}

- (void)setDisplayedPreloadedImage:(id)a3
{
}

- (UIImage)displayedPreloadedImage
{
  return self->_displayedPreloadedImage;
}

- (void)setAssetKeyFrameSourceTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_assetKeyFrameSourceTime.value = *(_OWORD *)&a3->var0;
  self->_assetKeyFrameSourceTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)assetKeyFrameSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[15];
  return self;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (BOOL)placeholderHiddenBehindVideoView
{
  return self->_placeholderHiddenBehindVideoView;
}

- (BOOL)placeholderIsAnimatingToHidden
{
  return self->_placeholderIsAnimatingToHidden;
}

- (void)setCurrentImageIsPlaceholder:(BOOL)a3
{
  self->_currentImageIsPlaceholder = a3;
}

- (BOOL)currentImageIsPlaceholder
{
  return self->_currentImageIsPlaceholder;
}

- (void)setPlaceholderVisible:(BOOL)a3
{
  self->_placeholderVisible = a3;
}

- (BOOL)placeholderVisible
{
  return self->_placeholderVisible;
}

- (BOOL)playerDidPlayToEnd
{
  return self->_playerDidPlayToEnd;
}

- (BOOL)playerIsSeeking
{
  return self->_playerIsSeeking;
}

- (void)_setReadyForDisplayCompletionHandler:(id)a3
{
}

- (id)_readyForDisplayCompletionHandler
{
  return self->__readyForDisplayCompletionHandler;
}

- (BOOL)_isDisplayingFullQualityImage
{
  return self->__isDisplayingFullQualityImage;
}

- (void)_setThumbnailRequestNumber:(int64_t)a3
{
  self->__thumbnailRequestNumber = a3;
}

- (int64_t)_thumbnailRequestNumber
{
  return self->__thumbnailRequestNumber;
}

- (void)setRequestedImageTargetSize:(CGSize)a3
{
  self->_requestedImageTargetSize = a3;
}

- (CGSize)requestedImageTargetSize
{
  double width = self->_requestedImageTargetSize.width;
  double height = self->_requestedImageTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_targetSize
{
  double width = self->__targetSize.width;
  double height = self->__targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)_currentImageRequestID
{
  return self->__currentImageRequestID;
}

- (void)setVideoView:(id)a3
{
}

- (PXVideoSessionUIView)videoView
{
  return self->_videoView;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setIsOnSecondScreen:(BOOL)a3
{
  self->_isOnSecondScreen = a3;
}

- (BOOL)isOnSecondScreen
{
  return self->_isOnSecondScreen;
}

- (BOOL)canPlayVideo
{
  return self->_canPlayVideo;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)setBrowsingViewModel:(id)a3
{
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)setReadyForDisplayChangeHandler:(id)a3
{
}

- (id)readyForDisplayChangeHandler
{
  return self->_readyForDisplayChangeHandler;
}

- (void)_updateLiveEffectsRenderDebugIndicatorVisibility
{
  v3 = [(PUVideoTileViewController *)self videoSession];
  id v6 = [v3 playerItem];

  v4 = [v6 videoComposition];
  BOOL v5 = v4 == 0;

  [(UIView *)self->_liveEffectRenderingDebugIndicator setHidden:v5];
}

- (void)_layoutLiveEffectsRenderDebugIndicator
{
  liveEffectRenderingDebugIndicator = self->_liveEffectRenderingDebugIndicator;
  if (liveEffectRenderingDebugIndicator)
  {
    [(UIView *)liveEffectRenderingDebugIndicator frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(UIView *)self->_liveEffectRenderingDebugIndicator superview];
    [v12 bounds];
    double MaxX = CGRectGetMaxX(v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.double width = v9;
    v20.size.double height = v11;
    double v14 = MaxX - CGRectGetWidth(v20) + -20.0;

    v15 = [(UIView *)self->_liveEffectRenderingDebugIndicator superview];
    [v15 bounds];
    double v16 = CGRectGetMinY(v21) + 40.0;

    v17 = self->_liveEffectRenderingDebugIndicator;
    -[UIView setFrame:](v17, "setFrame:", v14, v16, v9, v11);
  }
}

- (void)_updateLiveEffectsRenderDebugIndicator
{
  v3 = +[PUOneUpSettings sharedInstance];
  int v4 = [v3 videoShowLiveEffectsRenderingIndicator];

  liveEffectRenderingDebugIndicator = self->_liveEffectRenderingDebugIndicator;
  if (v4)
  {
    if (!liveEffectRenderingDebugIndicator)
    {
      CGFloat v7 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 90.0, 20.0);
      double v8 = self->_liveEffectRenderingDebugIndicator;
      self->_liveEffectRenderingDebugIndicator = v7;

      [(UIView *)self->_liveEffectRenderingDebugIndicator setText:@"Live Render"];
      double v9 = [MEMORY[0x1E4FB1618] systemTealColor];
      [(UIView *)self->_liveEffectRenderingDebugIndicator setBackgroundColor:v9];

      [(UIView *)self->_view addSubview:self->_liveEffectRenderingDebugIndicator];
      [(PUVideoTileViewController *)self _updateLiveEffectsRenderDebugIndicatorVisibility];
      [(PUVideoTileViewController *)self _layoutLiveEffectsRenderDebugIndicator];
    }
  }
  else
  {
    [(UIView *)liveEffectRenderingDebugIndicator removeFromSuperview];
    double v6 = self->_liveEffectRenderingDebugIndicator;
    self->_liveEffectRenderingDebugIndicator = 0;
  }
}

- (void)setPlayerDidPlayToEnd:(BOOL)a3
{
  if (self->_playerDidPlayToEnd != a3)
  {
    self->_playerDidPlayToEnd = a3;
    if (a3)
    {
      id v11 = [(PUVideoTileViewController *)self browsingVideoPlayer];
      if ([v11 isActivated])
      {
      }
      else
      {
        int v4 = [(PUVideoTileViewController *)self browsingVideoPlayer];
        char v5 = [v4 loopingEnabledForAllVideos];

        if ((v5 & 1) == 0)
        {
          double v6 = [(PUVideoTileViewController *)self videoView];
          CGFloat v7 = [v6 snapshotViewAfterScreenUpdates:1];
          [v6 addSubview:v7];
          double v8 = [(PUVideoTileViewController *)self browsingVideoPlayer];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke;
          v14[3] = &unk_1E5F2E1C0;
          id v15 = v6;
          id v16 = v7;
          long long v12 = *MEMORY[0x1E4F1FA48];
          uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          id v9 = v7;
          id v10 = v6;
          [v8 seekToTime:&v12 completionHandler:v14];
        }
      }
    }
  }
}

void __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) generateSnapshotImage];
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();
}

void __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_3;
  v3[3] = &unk_1E5F2ED10;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v1 transitionWithView:v2 duration:5242880 options:v3 animations:0 completion:0.5];
}

uint64_t __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setPlayerIsSeeking:(BOOL)a3
{
  if (self->_playerIsSeeking != a3)
  {
    self->_playerIsSeeking = a3;
    [(PUVideoTileViewController *)self _updatePlaceholderVisibility];
  }
}

- (void)_updatePlaceholderVisibility
{
  if ([(PUTileController *)self isAnimating]) {
    return;
  }
  BOOL v3 = [(PUVideoTileViewController *)self playerIsSeeking];
  id v4 = [(PUVideoTileViewController *)self asset];
  int v5 = [v4 mediaSubtypes];

  if (v3)
  {
    double v6 = [(PUVideoTileViewController *)self videoView];
    char v7 = [v6 isVideoLayerReadyForDisplay];

    if (v7) {
      goto LABEL_14;
    }
  }
  double v8 = [(PUVideoTileViewController *)self videoView];
  if (([v8 isVideoLayerReadyForDisplay] & 1) == 0 && !self->_hidePlaceholderImmediately)
  {

    goto LABEL_11;
  }
  id v9 = [(PUVideoTileViewController *)self videoSession];
  id v10 = [v9 playerItem];

  if (!v10)
  {
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_15;
  }
  if (!self->_hidePlaceholderImmediately)
  {
    location[0] = 0;
    location[1] = 0;
    uint64_t v23 = 0;
    [(PUVideoTileViewController *)self assetKeyFrameSourceTime];
    long long v20 = 0uLL;
    uint64_t v21 = 0;
    id v11 = [(PUVideoTileViewController *)self browsingVideoPlayer];
    long long v12 = v11;
    if (v11)
    {
      [v11 currentTime];
    }
    else
    {
      long long v20 = 0uLL;
      uint64_t v21 = 0;
    }
  }
LABEL_14:
  uint64_t v13 = 0;
LABEL_15:
  double v14 = 0.0;
  if ((v5 & 0x100000) != 0 && ![(PUTileController *)self shouldSuppressAnimatedUpdates])
  {
    id v16 = [(UIView *)self->_view window];

    BOOL v17 = v16 == 0;
    BOOL v15 = v16 != 0;
    if (v17) {
      double v14 = 0.0;
    }
    else {
      double v14 = 0.2;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
  objc_initWeak(location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__PUVideoTileViewController__updatePlaceholderVisibility__block_invoke;
  v18[3] = &unk_1E5F2E530;
  objc_copyWeak(&v19, location);
  [(PUVideoTileViewController *)self setPlaceholderVisible:v13 animated:v15 animationDuration:v18 completion:v14];
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

void __57__PUVideoTileViewController__updatePlaceholderVisibility__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callReadyToDisplayChangeHandler];
}

- (BOOL)_isDisplayingVideo
{
  uint64_t v2 = [(PUVideoTileViewController *)self videoView];
  char v3 = [v2 placeholderVisible] ^ 1;

  return v3;
}

- (void)_setDisplayingFullQualityImage:(BOOL)a3
{
  if (self->__isDisplayingFullQualityImage != a3)
  {
    self->__isDisplayingFullQualityImage = a3;
    [(PUVideoTileViewController *)self _updateReadyForDisplay];
  }
}

- (void)setVideoSession:(id)a3
{
  int v5 = (PXVideoSession *)a3;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    id v9 = v5;
    [(PXVideoSession *)videoSession unregisterChangeObserver:self context:VideoSessionContext];
    objc_storeStrong((id *)&self->_videoSession, a3);
    [(PXVideoSession *)v9 registerChangeObserver:self context:VideoSessionContext];
    if (v9) {
      BOOL v7 = [(PXVideoSession *)v9 playState] == 3;
    }
    else {
      BOOL v7 = 0;
    }
    self->_hidePlaceholderImmediately = v7;
    double v8 = [(PUVideoTileViewController *)self videoView];
    [v8 setVideoSession:v9];

    [(PUVideoTileViewController *)self setPlayerDidPlayToEnd:0];
    [(PUVideoTileViewController *)self _updatePlaceholderVisibility];
    int v5 = v9;
  }
}

- (void)_updateVideo
{
  char v3 = [(PUVideoTileViewController *)self browsingVideoPlayer];
  id v4 = [v3 videoSession];

  if (![(PUVideoTileViewController *)self canPlayVideo])
  {

    id v4 = 0;
  }
  if (![(PUTileController *)self isAnimating]) {
    [(PUVideoTileViewController *)self setVideoSession:v4];
  }
}

- (void)_setImageResult:(id)a3 pixelBuffer:(__CVBuffer *)a4 info:(id)a5 synchronous:(BOOL)a6
{
  id v23 = a3;
  id v9 = a5;
  if (v23)
  {
    id v10 = [(UIImageView *)self->_placeholderImageView image];
    id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F39710]];
    uint64_t v12 = [v11 BOOLValue];

    uint64_t v13 = [(PUVideoTileViewController *)self displayedPreloadedImage];

    if (v10 == v13)
    {
      [v23 size];
      double v16 = v15;
      [v10 size];
      if (v16 < v17 || ([v23 size], double v19 = v18, objc_msgSend(v10, "size"), v19 < v20))
      {
LABEL_15:
        v22 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
        -[PUVideoTileViewController _setDisplayingFullQualityImage:](self, "_setDisplayingFullQualityImage:", [v22 BOOLValue] ^ 1);

        goto LABEL_16;
      }
    }
    else
    {
      if (v10) {
        char v14 = v12;
      }
      else {
        char v14 = 0;
      }
      if (v14) {
        goto LABEL_15;
      }
    }
    [(PUVideoTileViewController *)self setCurrentImageIsPlaceholder:v12];
    [(PUVideoTileViewController *)self setDisplayedPreloadedImage:0];
    [(UIImageView *)self->_placeholderImageView setImage:v23];
    if (a4) {
      char v21 = v12;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0) {
      [(PXPixelBufferView *)self->_pixelBufferView enqueuePixelBuffer:a4];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_handleImageResult:(id)a3 info:(id)a4 synchronous:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a5
    || ([v9 objectForKeyedSubscript:*MEMORY[0x1E4F39718]],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 intValue],
        int v13 = [(PUVideoTileViewController *)self _currentImageRequestID],
        v11,
        v12 == v13))
  {
    char v14 = [(PUVideoTileViewController *)self asset];
    int v15 = [v14 mediaSubtypes];

    double v16 = 0;
    if (PXSupportsImageModulation() && v8 && (v15 & 0x100000) != 0)
    {
      double v17 = +[PUOneUpSettings sharedInstance];
      int v18 = [v17 useHDRVideoThumbnails];

      if (v18)
      {
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x2050000000;
        double v19 = (void *)getPIHDRUtilitiesClass_softClass;
        uint64_t v29 = getPIHDRUtilitiesClass_softClass;
        if (!getPIHDRUtilitiesClass_softClass)
        {
          location[0] = (id)MEMORY[0x1E4F143A8];
          location[1] = (id)3221225472;
          id location[2] = __getPIHDRUtilitiesClass_block_invoke;
          location[3] = &unk_1E5F2E228;
          location[4] = &v26;
          __getPIHDRUtilitiesClass_block_invoke((uint64_t)location);
          double v19 = (void *)v27[3];
        }
        id v20 = v19;
        _Block_object_dispose(&v26, 8);
        double v16 = objc_msgSend(v20, "newHLGPixelBufferFromSDRImage:", objc_msgSend(v8, "CGImage"));
      }
      else
      {
        double v16 = 0;
      }
    }
    objc_initWeak(location, self);
    objc_copyWeak(v23, location);
    id v21 = v8;
    v23[1] = v16;
    id v22 = v10;
    BOOL v24 = a5;
    px_dispatch_on_main_queue();
    if (v16) {
      CFRelease(v16);
    }

    objc_destroyWeak(v23);
    objc_destroyWeak(location);
  }
}

void __65__PUVideoTileViewController__handleImageResult_info_synchronous___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setImageResult:*(void *)(a1 + 32) pixelBuffer:*(void *)(a1 + 56) info:*(void *)(a1 + 40) synchronous:*(unsigned __int8 *)(a1 + 64)];
}

- (void)_updateImage
{
  char v3 = [(PUVideoTileViewController *)self assetViewModel];
  id v4 = [v3 asset];

  [(PUVideoTileViewController *)self _targetSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(PUVideoTileViewController *)self mediaProvider];
  id v10 = (void *)v9;
  if (v4)
  {
    if (v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v6 == *MEMORY[0x1E4F1DB30] || v9 == 0)
    {
      [(PUVideoTileViewController *)self _setCurrentImageRequestID:0];
    }
    else
    {
      [(PUVideoTileViewController *)self requestedImageTargetSize];
      if (v13 < v6
        || ([(PUVideoTileViewController *)self requestedImageTargetSize], v14 < v8))
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F390D8]);
        [v15 setAllowPlaceholder:1];
        [v15 setNetworkAccessAllowed:1];
        [(PUVideoTileViewController *)self _setDisplayingFullQualityImage:0];
        -[PUVideoTileViewController setRequestedImageTargetSize:](self, "setRequestedImageTargetSize:", v6, v8);
        objc_initWeak(&location, self);
        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x2020000000;
        char v22 = 1;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __41__PUVideoTileViewController__updateImage__block_invoke;
        v17[3] = &unk_1E5F2E170;
        objc_copyWeak(&v18, &location);
        v17[4] = &v19;
        uint64_t v16 = objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 1, v15, v17, v6, v8);
        *((unsigned char *)v20 + 24) = 0;
        [(PUVideoTileViewController *)self _setCurrentImageRequestID:v16];
        objc_destroyWeak(&v18);
        _Block_object_dispose(&v19, 8);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    [(PUVideoTileViewController *)self _setCurrentImageRequestID:0];
    [(UIImageView *)self->_placeholderImageView setImage:0];
    [(PXPixelBufferView *)self->_pixelBufferView enqueuePixelBuffer:0];
  }
}

void __41__PUVideoTileViewController__updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleImageResult:v7 info:v6 synchronous:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

- (void)_updateTargetSize
{
  if ([(PUTileController *)self isActive])
  {
    char v3 = [(PUTileViewController *)self view];
    id v4 = [v3 window];
    double v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;

    if (v7 < 1.0)
    {
      double v8 = [(PUTileController *)self tilingView];
      uint64_t v9 = [v8 window];
      id v10 = [v9 screen];
      [v10 scale];
      double v7 = v11;
    }
    if (v7 < 1.0 && PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    int v12 = [(PUTileViewController *)self view];
    [v12 bounds];

    double v13 = [(PUVideoTileViewController *)self asset];
    [v13 pixelWidth];
    [v13 pixelHeight];
    PXSizeMin();
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  -[PUVideoTileViewController _setTargetSize:](self, "_setTargetSize:", v15, v17);
}

- (void)_updateReadyForDisplay
{
  BOOL v3 = [(PUVideoTileViewController *)self _isDisplayingVideo]
    || [(PUVideoTileViewController *)self _isDisplayingFullQualityImage];
  [(PUTileViewController *)self _setReadyForDisplay:v3];
}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  double v7 = [v10 asset];
  [(PUVideoTileViewController *)self _setAsset:v7];

  if ([v6 focusValueChanged] && self->_waitForFocusValueForCrossfade) {
    [(PUVideoTileViewController *)self _updatePlaceholderVisibility];
  }
  if ([v6 isUserTransformingTileDidChange]
    && ([v10 isUserTransformingTile] & 1) == 0)
  {
    double v8 = [(PUVideoTileViewController *)self browsingVideoPlayer];
    [(PUVideoTileViewController *)self _targetSize];
    objc_msgSend(v8, "setDesiredTargetSize:");
  }
  if ([v6 videoPlayerDidChange])
  {
    uint64_t v9 = [v10 videoPlayer];
    [(PUVideoTileViewController *)self setBrowsingVideoPlayer:v9];
  }
}

- (void)_callReadyToDisplayChangeHandler
{
  uint64_t v2 = [(PUVideoTileViewController *)self readyForDisplayChangeHandler];
  uint64_t v4 = [v2 copy];

  BOOL v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    BOOL v3 = (void *)v4;
  }
}

- (void)_setCurrentImageRequestID:(int)a3
{
  if (self->__currentImageRequestID != a3)
  {
    double v5 = [(PUVideoTileViewController *)self mediaProvider];
    [v5 cancelImageRequest:self->__currentImageRequestID];

    self->__currentImageRequestID = a3;
  }
}

- (void)_setTargetSize:(CGSize)a3
{
  double width = self->__targetSize.width;
  double height = self->__targetSize.height;
  if (a3.width != width || a3.height != height)
  {
    double v6 = a3.height;
    double v7 = a3.width;
    self->__targetSize = a3;
    id v13 = [(UIImageView *)self->_placeholderImageView image];
    if (v13) {
      BOOL v9 = v7 <= width;
    }
    else {
      BOOL v9 = 0;
    }
    BOOL v10 = v9 && v6 <= height;
    if (!v10 || ([v13 size], v7 > v11) || (objc_msgSend(v13, "size"), v6 > v12))
    {
      if ([(PUVideoTileViewController *)self placeholderVisible]) {
        [(PUVideoTileViewController *)self _updateImage];
      }
    }
  }
}

- (void)setPlaceholderHiddenBehindVideoView:(BOOL)a3
{
  if (self->_placeholderHiddenBehindVideoView != a3)
  {
    self->_placeholderHiddenBehindVideoView = a3;
    placeholderImageView = self->_placeholderImageView;
    if (a3)
    {
      [(UIImageView *)placeholderImageView setAlpha:1.0];
      view = self->_view;
      double v6 = self->_placeholderImageView;
      videoView = self->_videoView;
      [(UIView *)view insertSubview:v6 belowSubview:videoView];
    }
    else
    {
      [(UIImageView *)placeholderImageView setAlpha:0.0];
      double v8 = self->_view;
      BOOL v9 = self->_placeholderImageView;
      BOOL v10 = self->_videoView;
      [(UIView *)v8 insertSubview:v9 aboveSubview:v10];
    }
  }
}

- (void)setPlaceholderVisible:(BOOL)a3 animated:(BOOL)a4 animationDuration:(double)a5 completion:(id)a6
{
  BOOL v7 = a3;
  id v9 = a6;
  if (self->_placeholderVisible != v7)
  {
    self->_placeholderVisible = v7;
    unsigned int v10 = !v7;
    if (a5 > 0.0) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    [(PUVideoTileViewController *)self setPlaceholderIsAnimatingToHidden:v11];
    [(PUVideoTileViewController *)self setPlaceholderHiddenBehindVideoView:0];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke;
    v16[3] = &unk_1E5F2E120;
    v16[4] = self;
    BOOL v17 = v7;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke_2;
    v13[3] = &unk_1E5F2E148;
    v13[4] = self;
    BOOL v15 = v7;
    id v14 = v9;
    [v12 animateWithDuration:2 delay:v16 options:v13 animations:a5 completion:0.0];
    if ((v10 & 1) == 0) {
      [(PUVideoTileViewController *)self _updateImage];
    }
  }
}

uint64_t __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 176) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlaceholderIsAnimatingToHidden:0];
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setPlaceholderHiddenBehindVideoView:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setBrowsingVideoPlayer:(id)a3
{
  double v5 = (PUBrowsingVideoPlayer *)a3;
  p_browsingVideoPlayer = &self->_browsingVideoPlayer;
  browsingVideoPlayer = self->_browsingVideoPlayer;
  if (browsingVideoPlayer != v5)
  {
    double v8 = v5;
    [(PUBrowsingVideoPlayer *)browsingVideoPlayer unregisterChangeObserver:self];
    [(PUBrowsingVideoPlayer *)*p_browsingVideoPlayer unregisterTimeObserver:self];
    [(PUBrowsingVideoPlayer *)*p_browsingVideoPlayer unregisterVideoOutput:self];
    objc_storeStrong((id *)&self->_browsingVideoPlayer, a3);
    [(PUBrowsingVideoPlayer *)*p_browsingVideoPlayer registerTimeObserver:self];
    if ([(PUVideoTileViewController *)self canPlayVideo]) {
      [(PUBrowsingVideoPlayer *)*p_browsingVideoPlayer registerVideoOutput:self];
    }
    [(PUBrowsingVideoPlayer *)*p_browsingVideoPlayer registerChangeObserver:self];
    [(PUVideoTileViewController *)self _updateVideo];
    double v5 = v8;
  }
}

- (void)_handleKeyFrameSourceTime:(id *)a3 forAsset:(id)a4
{
  id v6 = a4;
  id v7 = [(PUVideoTileViewController *)self asset];

  if (v7 == v6)
  {
    long long v8 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PUVideoTileViewController *)self setAssetKeyFrameSourceTime:&v8];
  }
}

- (void)_fetchKeyTimeForAsset:(id)a3
{
  id v4 = a3;
  double v5 = [(id)objc_opt_class() keyFrameTimeLoadingQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke;
  BOOL v17 = &unk_1E5F2E0D0;
  id v20 = &v21;
  id v6 = v4;
  id v18 = v6;
  uint64_t v19 = self;
  px_dispatch_on_main_queue_sync();
  if (*((unsigned char *)v22 + 24))
  {
    long long v12 = 0uLL;
    uint64_t v13 = 0;
    if (objc_opt_respondsToSelector())
    {
      if (v6)
      {
        [v6 videoKeyFrameSourceTime];
      }
      else
      {
        long long v12 = 0uLL;
        uint64_t v13 = 0;
      }
    }
    else
    {
      long long v12 = *MEMORY[0x1E4F1F9F8];
      uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    }
    objc_initWeak(&location, self);
    objc_copyWeak(&v8, &location);
    long long v9 = v12;
    uint64_t v10 = v13;
    id v7 = v6;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v21, 8);
}

void __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) asset];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 == v3;
}

void __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  [WeakRetained _handleKeyFrameSourceTime:&v4 forAsset:v3];
}

- (void)_setAsset:(id)a3
{
  uint64_t v5 = (PUDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    id v7 = asset;
    uint64_t v8 = [(PUDisplayAsset *)v5 isContentEqualTo:v7];
    if (!v8) {
      uint64_t v8 = [(PUDisplayAsset *)v7 isContentEqualTo:v5];
    }

    objc_storeStrong((id *)&self->_asset, a3);
    objc_initWeak(&location, self);
    long long v9 = [(id)objc_opt_class() keyFrameTimeLoadingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PUVideoTileViewController__setAsset___block_invoke;
    block[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v12, &location);
    uint64_t v11 = v5;
    dispatch_async(v9, block);

    [(PUVideoTileViewController *)self _updateTargetSize];
    [(PUVideoTileViewController *)self _updateVideo];
    if (v8 != 2)
    {
      -[PUVideoTileViewController setRequestedImageTargetSize:](self, "setRequestedImageTargetSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      [(PUVideoTileViewController *)self _updateImage];
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __39__PUVideoTileViewController__setAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _fetchKeyTimeForAsset:*(void *)(a1 + 32)];
}

- (void)setPlaceholderIsAnimatingToHidden:(BOOL)a3
{
  if (self->_placeholderIsAnimatingToHidden != a3)
  {
    self->_placeholderIsAnimatingToHidden = a3;
    [(PUVideoTileViewController *)self _callReadyToDisplayChangeHandler];
  }
}

- (void)_updateDebugBorders
{
  uint64_t v3 = +[PUOneUpSettings sharedInstance];
  int v4 = [v3 videoShowDebugBorders];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4FB1618] redColor];
    uint64_t v6 = [v5 CGColor];
    id v7 = [(UIImageView *)self->_placeholderImageView layer];
    [v7 setBorderColor:v6];

    uint64_t v8 = [(UIImageView *)self->_placeholderImageView layer];
    [v8 setBorderWidth:5.0];

    id v9 = [MEMORY[0x1E4FB1618] blueColor];
    uint64_t v10 = [v9 CGColor];
    uint64_t v11 = [(PXVideoSessionUIView *)self->_videoView layer];
    [v11 setBorderColor:v10];

    id v12 = [(PXVideoSessionUIView *)self->_videoView layer];
    double v13 = 8.0;
  }
  else
  {
    uint64_t v14 = [(UIImageView *)self->_placeholderImageView layer];
    [v14 setBorderColor:0];

    uint64_t v15 = [(UIImageView *)self->_placeholderImageView layer];
    [v15 setBorderWidth:0.0];

    double v16 = [(PXVideoSessionUIView *)self->_videoView layer];
    [v16 setBorderColor:0];

    id v12 = [(PXVideoSessionUIView *)self->_videoView layer];
    double v13 = 0.0;
  }
  id v17 = v12;
  [v12 setBorderWidth:v13];
}

- (void)_updateInteractionHostViewRegistration
{
  id v3 = [(PUVideoTileViewController *)self assetViewModel];
  [v3 registerView:self->_view forImageAnalysisInteractionHostMode:2];
}

- (AVPlayerLayer)playerLayer
{
  uint64_t v2 = [(PUVideoTileViewController *)self videoView];
  id v3 = [v2 activePlayerLayer];

  return (AVPlayerLayer *)v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v9 = a4;
  id v5 = NSStringFromSelector(sel_videoShowDebugBorders);
  int v6 = [v9 isEqualToString:v5];

  if (v6) {
    [(PUVideoTileViewController *)self _updateDebugBorders];
  }
  id v7 = NSStringFromSelector(sel_videoShowLiveEffectsRenderingIndicator);
  int v8 = [v9 isEqualToString:v7];

  if (v8) {
    [(PUVideoTileViewController *)self _updateLiveEffectsRenderDebugIndicator];
  }
}

- (void)prepareForVideoResolutionChange
{
  id v3 = [(PUVideoTileViewController *)self videoView];
  int v4 = [v3 activePlayerLayer];
  id v5 = (__CVBuffer *)[v4 copyDisplayedPixelBuffer];

  if (v5)
  {
    [(PXPixelBufferView *)self->_pixelBufferView enqueuePixelBuffer:v5];
    CVPixelBufferRelease(v5);
    [(PUVideoTileViewController *)self setPlaceholderVisible:1 animated:0 animationDuration:0 completion:0.0];
  }
}

- (BOOL)videoOutputIsReadyForDisplay
{
  id v3 = [(PUVideoTileViewController *)self videoView];
  BOOL v4 = [v3 isVideoLayerReadyForDisplay]
    && ![(PUTileController *)self isAnimating]
    && ![(PUVideoTileViewController *)self placeholderIsAnimatingToHidden]
    && [(PUVideoTileViewController *)self canPlayVideo];

  return v4;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (![(PUTileController *)self shouldPreserveCurrentContent])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PUVideoTileViewController *)self _handleAssetViewModel:v14 didChange:v7];
LABEL_10:
      [(PUVideoTileViewController *)self _updateReadyForDisplay];
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_7:
        if ([v8 avPlayerDidChange]) {
          [(PUVideoTileViewController *)self _updateVideo];
        }

        goto LABEL_10;
      }
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v12);
      double v13 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PUVideoTileViewController.m", 357, @"%@ should be an instance inheriting from %@, but it is %@", @"change", v11, v13 object file lineNumber description];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, self, @"PUVideoTileViewController.m", 357, @"%@ should be an instance inheriting from %@, but it is nil", @"change", v11 object file lineNumber description];
    }

    goto LABEL_7;
  }
LABEL_11:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)VideoSessionContext == a5) {
    px_dispatch_on_main_queue();
  }
}

void __58__PUVideoTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 41) & 2) != 0 && ([*(id *)(a1 + 32) playerIsSeeking] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) videoSession];
    int v3 = [v2 isAtEnd];

    if (v3) {
      [*(id *)(a1 + 32) setPlayerDidPlayToEnd:1];
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _updatePlaceholderVisibility];
    BOOL v4 = *(void **)(a1 + 32);
    [v4 _updateLiveEffectsRenderDebugIndicatorVisibility];
  }
}

- (void)videoSessionViewPlaceholderVisibilityChanged:(id)a3
{
  [(PUVideoTileViewController *)self _updateReadyForDisplay];
  [(PUVideoTileViewController *)self _updatePlaceholderVisibility];
  [(PUVideoTileViewController *)self _callReadyToDisplayChangeHandler];
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  id v5 = a3;
  if ([v5 playState] == 3)
  {
    [(PUVideoTileViewController *)self setPlayerIsSeeking:0];
    if (([v5 isAtEnd] & 1) == 0 && (objc_msgSend(v5, "isAtBeginning") & 1) == 0) {
      [(PUVideoTileViewController *)self setPlayerDidPlayToEnd:0];
    }
  }
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  if (a4->var2)
  {
    [(PUVideoTileViewController *)self setPlayerDidPlayToEnd:0];
    [(PUVideoTileViewController *)self setPlayerIsSeeking:1];
  }
}

- (BOOL)adoptAssetTransitionInfo:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PUVideoTileViewController *)self browsingVideoPlayer];
    long long v9 = 0uLL;
    uint64_t v10 = 0;
    [v4 seekTime];

    if ((unsigned __int128)0 >> 96)
    {
      long long v7 = v9;
      uint64_t v8 = v10;
      [v5 seekToTime:&v7 completionHandler:0];
    }
    [(PUVideoTileViewController *)self _updateVideo];
  }
  return 1;
}

- (id)generateAssetTransitionInfo
{
  int v3 = [(PUVideoTileViewController *)self videoSession];
  id v4 = [(PUVideoTileViewController *)self videoView];
  id v5 = [v4 generateSnapshotImage];

  if (!v5)
  {
    id v5 = [(UIImageView *)self->_placeholderImageView image];
  }
  int v6 = [(PUVideoTileViewController *)self videoView];
  long long v7 = [v6 viewForSnapshotting];
  uint64_t v8 = [v7 snapshotViewAfterScreenUpdates:0];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__PUVideoTileViewController_generateAssetTransitionInfo__block_invoke;
  v14[3] = &unk_1E5F2E080;
  void v14[4] = self;
  id v15 = v5;
  id v16 = v8;
  id v17 = v3;
  id v9 = v3;
  id v10 = v8;
  id v11 = v5;
  id v12 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v14];

  return v12;
}

void __56__PUVideoTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) asset];
  [v3 setAsset:v4];

  [v3 setImage:*(void *)(a1 + 40)];
  [v3 setSnapshotView:*(void *)(a1 + 48)];
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    [v5 currentTime];
    long long v6 = v8;
    uint64_t v7 = v9;
    [v3 setSeekTime:&v6];
  }
}

- (void)setPreloadedImage:(id)a3
{
  id v5 = a3;
  id v4 = [(UIImageView *)self->_placeholderImageView image];

  if (!v4)
  {
    [(PUVideoTileViewController *)self setDisplayedPreloadedImage:v5];
    [(UIImageView *)self->_placeholderImageView setImage:v5];
  }
}

- (void)didChangeActive
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  [(PUTileController *)&v3 didChangeActive];
  [(PUVideoTileViewController *)self _updateTargetSize];
}

- (void)didChangeAnimating
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  [(PUTileController *)&v3 didChangeAnimating];
  [(PUVideoTileViewController *)self _updatePlaceholderVisibility];
  [(PUVideoTileViewController *)self _callReadyToDisplayChangeHandler];
  if (![(PUTileController *)self shouldPreserveCurrentContent]) {
    [(PUVideoTileViewController *)self _updateVideo];
  }
}

- (void)removeAllAnimations
{
  v4.receiver = self;
  v4.super_class = (Class)PUVideoTileViewController;
  [(PUTileViewController *)&v4 removeAllAnimations];
  objc_super v3 = [(PUVideoTileViewController *)self videoView];
  objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 1);

  [(UIImageView *)self->_placeholderImageView pu_removeAllGeometryAnimationsRecursively:1];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUVideoTileViewController *)self setAssetViewModel:0];
  [(PUVideoTileViewController *)self setMediaProvider:0];
  [(PUVideoTileViewController *)self setDisplayedPreloadedImage:0];
  self->_waitForFocusValueForCrossfade = 0;
  self->_isOnSecondScreen = 0;
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUVideoTileViewController *)self videoView];
  [v4 setAllowsEdgeAntialiasing:v3];
}

- (id)viewsForApplyingCornerRadius
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    BOOL v3 = [(PUTileViewController *)self view];
    v7[0] = v3;
    id v4 = [(PUVideoTileViewController *)self borderView];
    v7[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)viewsForApplyingBorder
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PUTileViewController *)self isViewLoaded])
  {
    BOOL v3 = [(PUVideoTileViewController *)self borderView];
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)applyLayoutInfo:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PUVideoTileViewController;
  id v4 = a3;
  [(PUTileViewController *)&v18 applyLayoutInfo:v4];
  [v4 contentsRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.double width = v10;
  v19.size.double height = v12;
  if (!CGRectIsEmpty(v19))
  {
    double v13 = [(PUVideoTileViewController *)self videoView];
    objc_msgSend(v13, "setContentsRect:", v6, v8, v10, v12);

    id v14 = [(UIImageView *)self->_placeholderImageView layer];
    objc_msgSend(v14, "setContentsRect:", v6, v8, v10, v12);

    [(PUVideoTileViewController *)self _layoutLiveEffectsRenderDebugIndicator];
    id v15 = [(PUVideoTileViewController *)self assetViewModel];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__PUVideoTileViewController_applyLayoutInfo___block_invoke;
    v17[3] = &unk_1E5F2E058;
    v17[4] = self;
    *(double *)&void v17[5] = v6;
    *(double *)&v17[6] = v8;
    *(double *)&v17[7] = v10;
    *(double *)&v17[8] = v12;
    [v15 performChanges:v17];
  }
  [(PUVideoTileViewController *)self _updateTargetSize];
  id v16 = [(PUTileViewController *)self view];
  [v16 layoutIfNeeded];
}

void __45__PUVideoTileViewController_applyLayoutInfo___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) assetViewModel];
  objc_msgSend(v5, "setMainImageContentsRect:", v1, v2, v3, v4);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  [(PUTileViewController *)&v3 viewDidLoad];
  [(PUVideoTileViewController *)self _updateInteractionHostViewRegistration];
}

- (id)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  view = self->_view;
  self->_view = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F908C8]);
  [(UIView *)self->_view bounds];
  double v7 = (PXVideoSessionUIView *)objc_msgSend(v6, "initWithFrame:");
  videoView = self->_videoView;
  self->_videoView = v7;

  [(PXVideoSessionUIView *)self->_videoView setAutoresizingMask:18];
  [(PXVideoSessionUIView *)self->_videoView setDelegate:self];
  [(UIView *)self->_view addSubview:self->_videoView];
  id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
  [(UIView *)self->_view bounds];
  double v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:");
  placeholderImageView = self->_placeholderImageView;
  self->_placeholderImageView = v10;

  [(UIImageView *)self->_placeholderImageView setAutoresizingMask:18];
  [(UIImageView *)self->_placeholderImageView setContentMode:2];
  [(UIImageView *)self->_placeholderImageView setAlpha:(double)[(PUVideoTileViewController *)self placeholderVisible]];
  [(UIView *)self->_view addSubview:self->_placeholderImageView];
  id v12 = objc_alloc(MEMORY[0x1E4F905B8]);
  [(UIView *)self->_view bounds];
  double v13 = (PXPixelBufferView *)objc_msgSend(v12, "initWithFrame:");
  pixelBufferView = self->_pixelBufferView;
  self->_pixelBufferView = v13;

  [(PXPixelBufferView *)self->_pixelBufferView setAutoresizingMask:18];
  [(UIImageView *)self->_placeholderImageView addSubview:self->_pixelBufferView];
  self->_placeholderIsAnimatingToHidden = ![(PUVideoTileViewController *)self placeholderVisible];
  [(PUVideoTileViewController *)self _updateDebugBorders];
  [(PUVideoTileViewController *)self _updateLiveEffectsRenderDebugIndicator];
  id v15 = +[PUOneUpSettings sharedInstance];
  [v15 addKeyObserver:self];

  id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(UIView *)self->_view bounds];
  id v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
  borderView = self->_borderView;
  self->_borderView = v17;

  [(UIView *)self->_borderView setUserInteractionEnabled:0];
  CGRect v19 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)self->_borderView setBackgroundColor:v19];

  [(UIView *)self->_borderView setClipsToBounds:1];
  [(UIView *)self->_borderView setAutoresizingMask:18];
  [(UIView *)self->_view addSubview:self->_borderView];
  id v20 = self->_view;
  return v20;
}

- (void)setMediaProvider:(id)a3
{
  id v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PUVideoTileViewController *)self _updateImage];
    id v5 = v6;
  }
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  assetViewModel = self->_assetViewModel;
  double v10 = v5;
  if (assetViewModel != v5)
  {
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    [(PUAssetViewModel *)*p_assetViewModel unregisterVideoLayerSource:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)*p_assetViewModel registerChangeObserver:self];
    [(PUAssetViewModel *)*p_assetViewModel registerVideoLayerSource:self];
    double v8 = [(PUAssetViewModel *)v10 asset];
    [(PUVideoTileViewController *)self _setAsset:v8];

    id v9 = [(PUAssetViewModel *)*p_assetViewModel videoPlayer];
    [(PUVideoTileViewController *)self setBrowsingVideoPlayer:v9];

    [(PUVideoTileViewController *)self _updateInteractionHostViewRegistration];
  }
}

- (void)setCanPlayVideo:(BOOL)a3
{
  if (self->_canPlayVideo != a3)
  {
    BOOL v3 = a3;
    id v5 = [(PUVideoTileViewController *)self browsingVideoPlayer];
    id v6 = v5;
    if (v3) {
      [v5 registerVideoOutput:self];
    }
    else {
      [v5 unregisterVideoOutput:self];
    }

    self->_canPlayVideo = v3;
    [(PUVideoTileViewController *)self _callReadyToDisplayChangeHandler];
    [(PUVideoTileViewController *)self _updateVideo];
  }
}

- (PUVideoTileViewController)initWithReuseIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUVideoTileViewController;
  uint64_t result = [(PUTileController *)&v4 initWithReuseIdentifier:a3];
  if (result)
  {
    result->_placeholderVisible = 1;
    result->_canPlayVideo = 1;
  }
  return result;
}

+ (id)keyFrameTimeLoadingQueue
{
  if (keyFrameTimeLoadingQueue_onceToken != -1) {
    dispatch_once(&keyFrameTimeLoadingQueue_onceToken, &__block_literal_global_100145);
  }
  double v2 = (void *)keyFrameTimeLoadingQueue_queue;
  return v2;
}

void __53__PUVideoTileViewController_keyFrameTimeLoadingQueue__block_invoke()
{
  uint64_t v0 = px_dispatch_queue_create_serial();
  double v1 = (void *)keyFrameTimeLoadingQueue_queue;
  keyFrameTimeLoadingQueue_queue = v0;
}

@end