@interface PXDisplayAssetLivePhotoContentView
- (AVPlayerItem)videoPlayerItem;
- (BOOL)isDisplayingFullQualityContent;
- (double)loadingProgress;
- (double)playerItemLoadingProgress;
- (id)contentView;
- (int64_t)playbackStyle;
- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5;
- (void)_updateLivePhotoContentMode;
- (void)_updateLivePhotoPlayerItem;
- (void)contentModeDidChange;
- (void)contentsRectDidChange;
- (void)effectivePreferredImageDynamicRangeDidChange;
- (void)imageDidChange;
- (void)imageProgressDidChange;
- (void)imageRequesterDidChange:(unint64_t)a3;
- (void)placeholderImageFiltersDidChange;
- (void)setPlayerItemLoadingProgress:(double)a3;
- (void)setVideoPlayerItem:(id)a3;
- (void)updateContent;
- (void)viewModelDidChange:(unint64_t)a3;
@end

@implementation PXDisplayAssetLivePhotoContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

- (double)playerItemLoadingProgress
{
  return self->_playerItemLoadingProgress;
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- (void)viewModelDidChange:(unint64_t)a3
{
  char v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView viewModelDidChange:](&v8, sel_viewModelDidChange_);
  if ((v3 & 0x10) != 0)
  {
    v5 = [(ISLivePhotoUIView *)self->_livePhotoView player];
    v6 = [(PXDisplayAssetContentView *)self viewModel];
    int v7 = [v6 wantsLivePhotoPlayback];

    if (v7) {
      [v5 startPlaybackWithStyle:1 settleAutomatically:1];
    }
    else {
      [v5 stopPlayback];
    }
  }
}

- (void)imageRequesterDidChange:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  -[PXDisplayAssetContentView imageRequesterDidChange:](&v5, sel_imageRequesterDidChange_);
  if ((v3 & 8) != 0) {
    [(PXDisplayAssetContentView *)self isDisplayingFullQualityContentDidChange];
  }
}

- (void)_updateLivePhotoPlayerItem
{
  char v3 = [(PXDisplayAssetContentView *)self image];
  if (v3)
  {
    v4 = [(AVPlayerItem *)self->_videoPlayerItem asset];
    [v3 imageOrientation];
    uint64_t v5 = PLExifOrientationFromImageOrientation();
    if (v4)
    {
      [v4 duration];
      double v6 = (float)((float)v14 * 0.5);
    }
    else
    {
      double v6 = 0.0;
    }
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F8EB98]) initWithVideoAsset:v4 UIImage:v3 photoTime:v5 photoEXIFOrientation:0 options:v6];
    objc_super v8 = (void *)MEMORY[0x1E4F8EBB0];
    [(PXDisplayAssetContentView *)self targetSize];
    v9 = objc_msgSend(v8, "playerItemWithAsset:targetSize:", v7);
    v10 = [(AVPlayerItem *)self->_videoPlayerItem videoComposition];
    [v9 setVideoComposition:v10];

    v11 = [(ISLivePhotoUIView *)self->_livePhotoView player];
    id v12 = v11;
    if (v9)
    {
      if (!v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F8EBA0]);
        [v12 setAudioEnabled:0];
        [(ISLivePhotoUIView *)self->_livePhotoView setPlayer:v12];
      }
      v11 = v12;
      v13 = v9;
    }
    else
    {
      v13 = 0;
    }
    [v11 setPlayerItem:v13];
  }
  else
  {
    v4 = [(ISLivePhotoUIView *)self->_livePhotoView player];
    [v4 setPlayerItem:0];
  }
}

- (BOOL)isDisplayingFullQualityContent
{
  char v3 = [(PXDisplayAssetContentView *)self imageRequester];
  if ([v3 hasFullQuality])
  {
    v4 = [(PXDisplayAssetLivePhotoContentView *)self videoPlayerItem];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setVideoPlayerItem:(id)a3
{
  BOOL v5 = (AVPlayerItem *)a3;
  if (self->_videoPlayerItem != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_videoPlayerItem, a3);
    [(PXDisplayAssetLivePhotoContentView *)self _updateLivePhotoPlayerItem];
    [(PXDisplayAssetContentView *)self isDisplayingFullQualityContentDidChange];
    BOOL v5 = v6;
  }
}

- (void)contentsRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v3 contentsRectDidChange];
  [(PXDisplayAssetContentView *)self contentsRect];
  -[ISLivePhotoUIView setContentsRect:](self->_livePhotoView, "setContentsRect:");
}

- (void)placeholderImageFiltersDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v4 placeholderImageFiltersDidChange];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_ERROR, "Warning: PXDisplayAssetContentView placeholder image filters are not currnetly supported for Live Photos", v3, 2u);
  }
}

- (void)imageDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v3 imageDidChange];
  [(PXDisplayAssetLivePhotoContentView *)self _updateLivePhotoPlayerItem];
}

- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAFB8];
  char v10 = [v9 BOOLValue];

  if ([(PXDisplayAssetContentView *)self requestID] == a5 && (v10 & 1) == 0)
  {
    [(PXDisplayAssetLivePhotoContentView *)self setVideoPlayerItem:v12];
    if (!v12)
    {
      v11 = [v8 objectForKeyedSubscript:*(void *)off_1E5DAAFC0];
      [(PXDisplayAssetContentView *)self handleError:v11];
    }
  }
}

- (double)loadingProgress
{
  [(PXDisplayAssetContentView *)self imageProgress];
  double v4 = v3;
  [(PXDisplayAssetLivePhotoContentView *)self playerItemLoadingProgress];
  return v5 * 0.33 + v4 * 0.67;
}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v3 effectivePreferredImageDynamicRangeDidChange];
  [(PXDisplayAssetContentView *)self effectivePreferredImageDynamicRange];
  PXPlatformImageDynamicRangeFromPXImageDynamicRange();
}

- (void)imageProgressDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v3 imageProgressDidChange];
  [(PXDisplayAssetContentView *)self invalidateLoadingProgress];
}

- (void)setPlayerItemLoadingProgress:(double)a3
{
  if (self->_playerItemLoadingProgress != a3)
  {
    self->_playerItemLoadingProgress = a3;
    [(PXDisplayAssetContentView *)self invalidateLoadingProgress];
  }
}

- (void)updateContent
{
  v22.receiver = self;
  v22.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v22 updateContent];
  objc_super v3 = [(PXDisplayAssetContentView *)self asset];
  double v4 = [(PXDisplayAssetContentView *)self mediaProvider];
  [(PXDisplayAssetContentView *)self targetSize];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (v4 && v3 && v5 > 0.0 && v6 > 0.0)
  {
    int v7 = objc_alloc_init(PXVideoRequestOptions);
    [(PXVideoRequestOptions *)v7 setNetworkAccessAllowed:1];
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke;
    v15[3] = &unk_1E5DD1230;
    objc_copyWeak(&v16, &location);
    [(PXVideoRequestOptions *)v7 setProgressHandler:v15];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_3;
    id v12 = &unk_1E5DB9A90;
    objc_copyWeak(&v14, &location);
    v13 = &v18;
    uint64_t v8 = [v4 requestPlayerItemForVideo:v3 options:v7 resultHandler:&v9];
    v19[3] = v8;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXDisplayAssetLivePhotoContentView *)self setVideoPlayerItem:0];
  }
  -[PXDisplayAssetContentView setRequestID:](self, "setRequestID:", v19[3], v9, v10, v11, v12);
  _Block_object_dispose(&v18, 8);
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  objc_copyWeak(v10, (id *)(a1 + 32));
  v10[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5;
  v6;
  px_dispatch_on_main_queue();
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handlePlayerItemResult:*(void *)(a1 + 32) info:*(void *)(a1 + 40) requestID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

void __51__PXDisplayAssetLivePhotoContentView_updateContent__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPlayerItemLoadingProgress:v1];
}

- (void)_updateLivePhotoContentMode
{
  uint64_t v3 = [(PXDisplayAssetLivePhotoContentView *)self contentMode];
  livePhotoView = self->_livePhotoView;
  [(ISLivePhotoUIView *)livePhotoView setContentMode:v3];
}

- (void)contentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLivePhotoContentView;
  [(PXDisplayAssetContentView *)&v3 contentModeDidChange];
  [(PXDisplayAssetLivePhotoContentView *)self _updateLivePhotoContentMode];
}

- (id)contentView
{
  livePhotoView = self->_livePhotoView;
  if (!livePhotoView)
  {
    double v4 = (ISLivePhotoUIView *)objc_alloc_init(MEMORY[0x1E4F8EBA8]);
    id v5 = self->_livePhotoView;
    self->_livePhotoView = v4;

    [(PXDisplayAssetLivePhotoContentView *)self _updateLivePhotoContentMode];
    id v6 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
    [v6 setMasksToBounds:1];

    livePhotoView = self->_livePhotoView;
  }
  return livePhotoView;
}

- (int64_t)playbackStyle
{
  return 3;
}

@end