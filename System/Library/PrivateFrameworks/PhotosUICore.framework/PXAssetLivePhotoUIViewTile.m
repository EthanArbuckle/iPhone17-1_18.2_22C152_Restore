@interface PXAssetLivePhotoUIViewTile
- (CGSize)_targetSize;
- (ISPlayerItem)_playerItem;
- (PXImageRequester)imageRequester;
- (UIView)view;
- (double)cornerRadius;
- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5 expectedRequestID:(int64_t)a6;
- (void)_requestLivePhotoIfNeeded;
- (void)_setPlayerItem:(id)a3;
- (void)_updateLivePhotoView;
- (void)becomeReusable;
- (void)prepareForReuse;
- (void)setCornerRadius:(double)a3;
- (void)setImageRequester:(id)a3;
@end

@implementation PXAssetLivePhotoUIViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerItem, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

- (ISPlayerItem)_playerItem
{
  return self->__playerItem;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5 expectedRequestID:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (self->_requestCount == a5)
  {
    int64_t livePhotoRequestID = self->_livePhotoRequestID;
    if (livePhotoRequestID == a6 && livePhotoRequestID != 0)
    {
      if (v10)
      {
        v14 = [v10 image];
        v15 = [v10 videoAsset];
        [v10 photoTime];
        double Seconds = CMTimeGetSeconds(&time);
        [v14 imageOrientation];
        uint64_t v17 = PLExifOrientationFromImageOrientation();
        [v10 targetSize];
        double v20 = v19;
        double v21 = v18;
        if (v19 == *MEMORY[0x1E4F1DB30] && v18 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          v23 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v23 bounds];
          [v23 scale];
          PXSizeScale();
        }
        uint64_t v24 = [v10 hasPhotoColorAdjustments];
        v25 = (void *)[objc_alloc(MEMORY[0x1E4F8EB98]) initWithVideoAsset:v15 UIImage:v14 photoTime:v17 photoEXIFOrientation:v24 options:Seconds];
        v26 = objc_msgSend(MEMORY[0x1E4F8EBB0], "playerItemWithAsset:targetSize:", v25, v20, v21);
        v27 = [v10 videoComposition];
        [v26 setVideoComposition:v27];
      }
      else
      {
        v26 = 0;
      }
      [(PXAssetLivePhotoUIViewTile *)self _setPlayerItem:v26];
    }
  }
}

- (CGSize)_targetSize
{
  if (_targetSize_onceToken != -1) {
    dispatch_once(&_targetSize_onceToken, &__block_literal_global_182746);
  }
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_requestLivePhotoIfNeeded
{
  double v3 = [(PXAssetLivePhotoUIViewTile *)self imageRequester];
  v4 = [v3 mediaProvider];

  if (v4)
  {
    [v4 cancelImageRequest:self->_livePhotoRequestID];
    v5 = objc_alloc_init(PXLivePhotoRequestOptions);
    [(PXLivePhotoRequestOptions *)v5 setNetworkAccessAllowed:1];
    [(PXLivePhotoRequestOptions *)v5 setDeliveryMode:1];
    objc_initWeak(&location, self);
    v6 = (void *)(self->_requestCount + 1);
    self->_requestCount = (unint64_t)v6;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v7 = [(PXAssetLivePhotoUIViewTile *)self imageRequester];
    v8 = [v7 asset];
    [(PXAssetLivePhotoUIViewTile *)self _targetSize];
    double v10 = v9;
    double v12 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke;
    v14[3] = &unk_1E5DC2838;
    objc_copyWeak(v15, &location);
    v15[1] = v6;
    v14[4] = &v16;
    int64_t v13 = objc_msgSend(v4, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v8, 1, v5, v14, v10, v12);

    v17[3] = v13;
    self->_int64_t livePhotoRequestID = v13;
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXAssetLivePhotoUIViewTile *)self _setPlayerItem:0];
  }
}

void __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v5;
  objc_copyWeak(v8, (id *)(a1 + 40));
  id v7 = v6;
  v8[1] = *(id *)(a1 + 48);
  px_dispatch_on_main_queue();
}

void __55__PXAssetLivePhotoUIViewTile__requestLivePhotoIfNeeded__block_invoke_2(uint64_t a1)
{
  id v8 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v3 = [MEMORY[0x1E4F28B00] currentHandler];
      v4 = [NSString stringWithUTF8String:"-[PXAssetLivePhotoUIViewTile _requestLivePhotoIfNeeded]_block_invoke_2"];
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v3 handleFailureInFunction:v4, @"PXAssetLivePhotoUIViewTile.m", 143, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"pxLivePhoto", v6, v7 file lineNumber description];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleLivePhotoResult:v8 info:*(void *)(a1 + 40) expectedRequestCount:*(void *)(a1 + 64) expectedRequestID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (void)_setPlayerItem:(id)a3
{
  id v5 = (ISPlayerItem *)a3;
  if (self->__playerItem != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__playerItem, a3);
    [(PXAssetLivePhotoUIViewTile *)self _updateLivePhotoView];
    id v5 = v6;
  }
}

- (void)_updateLivePhotoView
{
  id v13 = [(PXAssetLivePhotoUIViewTile *)self _playerItem];
  if (v13)
  {
    if (!self->_livePhotoPlayer)
    {
      double v3 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBA0]);
      livePhotoPlayer = self->_livePhotoPlayer;
      self->_livePhotoPlayer = v3;

      [(ISLivePhotoPlayer *)self->_livePhotoPlayer setAudioEnabled:0];
      [(ISLivePhotoUIView *)self->_livePhotoView setPlayer:self->_livePhotoPlayer];
      [(ISLivePhotoPlayer *)self->_livePhotoPlayer setPlayerItem:v13];
      [(ISLivePhotoPlayer *)self->_livePhotoPlayer startPlaybackWithStyleWhenReady:4];
    }
  }
  else
  {
    [(ISLivePhotoUIView *)self->_livePhotoView setPlayer:0];
    id v5 = self->_livePhotoPlayer;
    self->_livePhotoPlayer = 0;
  }
  [(PXAssetLivePhotoUIViewTile *)self cornerRadius];
  if (v6 <= 0.0)
  {
    double v12 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
    [v12 setCornerRadius:0.0];
  }
  else
  {
    [(PXAssetLivePhotoUIViewTile *)self cornerRadius];
    double v8 = v7;
    double v9 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
    [v9 setCornerRadius:v8];

    uint64_t v10 = *MEMORY[0x1E4F39EA8];
    double v11 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
    [v11 setCornerCurve:v10];

    double v12 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
    [v12 setAllowsGroupOpacity:0];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXAssetLivePhotoUIViewTile *)self _updateLivePhotoView];
  }
}

- (void)setImageRequester:(id)a3
{
  double v9 = (PXImageRequester *)a3;
  id v5 = self->_imageRequester;
  if (v5 == v9)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(PXImageRequester *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      double v8 = [(PXImageRequester *)self->_imageRequester mediaProvider];
      [v8 cancelImageRequest:self->_livePhotoRequestID];

      objc_storeStrong((id *)&self->_imageRequester, a3);
      self->_int64_t livePhotoRequestID = 0;
      [(PXAssetLivePhotoUIViewTile *)self _requestLivePhotoIfNeeded];
      [(PXAssetLivePhotoUIViewTile *)self _updateLivePhotoView];
    }
  }
}

- (UIView)view
{
  livePhotoView = self->_livePhotoView;
  if (!livePhotoView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8EBA8]);
    id v5 = (ISLivePhotoUIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_livePhotoView;
    self->_livePhotoView = v5;

    [(ISLivePhotoUIView *)self->_livePhotoView setAutoresizingMask:18];
    char v7 = +[PXAssetsSceneSettings sharedInstance];
    int v8 = [v7 showBordersOnAnimatedContent];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v10 = [v9 CGColor];
      double v11 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
      [v11 setBorderColor:v10];

      double v12 = [(ISLivePhotoUIView *)self->_livePhotoView layer];
      [v12 setBorderWidth:4.0];
    }
    [(PXAssetLivePhotoUIViewTile *)self _updateLivePhotoView];
    livePhotoView = self->_livePhotoView;
  }
  return (UIView *)livePhotoView;
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  [(PXAssetLivePhotoUIViewTile *)self _setPlayerItem:0];
  livePhotoView = self->_livePhotoView;
  [(ISLivePhotoUIView *)livePhotoView setHidden:1];
}

@end