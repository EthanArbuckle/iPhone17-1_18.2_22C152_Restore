@interface PXAssetAnimatedImageUIViewTile
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestPlaybackTimeRange;
- (PHAnimatedImage)_animatedImage;
- (PXAssetAnimatedImageUIViewTile)init;
- (PXImageRequester)imageRequester;
- (UIView)view;
- (double)cornerRadius;
- (int64_t)desiredPlayState;
- (void)_handleAnimatedImageResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5;
- (void)_requestAnimatedImageIfNeeded;
- (void)_setAnimatedImage:(id)a3;
- (void)_updateAnimatedImageView;
- (void)becomeReusable;
- (void)prepareForReuse;
- (void)setBestPlaybackTimeRange:(id *)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setImageRequester:(id)a3;
@end

@implementation PXAssetAnimatedImageUIViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animatedImage, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_animatedImageView, 0);
}

- (PHAnimatedImage)_animatedImage
{
  return self->__animatedImage;
}

- (void)setBestPlaybackTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestPlaybackTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_bestPlaybackTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_bestPlaybackTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestPlaybackTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)_setAnimatedImage:(id)a3
{
  v5 = (PHAnimatedImage *)a3;
  if (self->__animatedImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__animatedImage, a3);
    [(PXAssetAnimatedImageUIViewTile *)self _updateAnimatedImageView];
    v5 = v6;
  }
}

- (void)_handleAnimatedImageResult:(id)a3 info:(id)a4 expectedRequestCount:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_requestCount == a5 && self->_animatedImageRequestID)
  {
    if (!v8)
    {
      v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch animated image with error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    self->_animatedImageRequestID = 0;
    [(PXAssetAnimatedImageUIViewTile *)self _setAnimatedImage:v8];
  }
}

- (void)_requestAnimatedImageIfNeeded
{
  long long v4 = [(PXAssetAnimatedImageUIViewTile *)self imageRequester];
  v5 = [v4 mediaProvider];

  if (v5)
  {
    [v5 cancelImageRequest:self->_animatedImageRequestID];
    v6 = objc_alloc_init(PXAnimatedImageRequestOptions);
    [(PXAnimatedImageRequestOptions *)v6 setVersion:2];
    [(PXAnimatedImageRequestOptions *)v6 setDeliveryMode:1];
    [(PXAnimatedImageRequestOptions *)v6 setNetworkAccessAllowed:0];
    [(PXAnimatedImageRequestOptions *)v6 setAllowPreCaching:0];
    [(PXAnimatedImageRequestOptions *)v6 setUseSharedImageDecoding:1];
    objc_initWeak(&location, self);
    v7 = (void *)(self->_requestCount + 1);
    self->_requestCount = (unint64_t)v7;
    id v8 = [(PXAssetAnimatedImageUIViewTile *)self imageRequester];
    id v9 = [v8 asset];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke;
    v10[3] = &unk_1E5DB69C0;
    v11[1] = (id)a2;
    v10[4] = self;
    objc_copyWeak(v11, &location);
    v11[2] = v7;
    self->_animatedImageRequestID = [v5 requestAnimatedImageForAsset:v9 options:v6 resultHandler:v10];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PXAssetAnimatedImageUIViewTile *)self _setAnimatedImage:0];
  }
}

void __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  v8[1] = a1[6];
  objc_copyWeak(v8, a1 + 5);
  v6;
  v8[2] = a1[7];
  px_dispatch_on_main_queue();
}

void __63__PXAssetAnimatedImageUIViewTile__requestAnimatedImageIfNeeded__block_invoke_2(uint64_t a1)
{
  id v9 = *(id *)(a1 + 32);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = *(void *)(a1 + 64);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v3 handleFailureInMethod:v4, v5, @"PXAssetAnimatedImageUIViewTile.m", 155, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"result", v7, v8 object file lineNumber description];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAnimatedImageResult:v9 info:*(void *)(a1 + 48) expectedRequestCount:*(void *)(a1 + 72)];
}

- (void)_updateAnimatedImageView
{
  long long v3 = [(PXAssetAnimatedImageUIViewTile *)self _animatedImage];

  animatedImageView = self->_animatedImageView;
  if (v3)
  {
    uint64_t v5 = [(ISAnimatedImageView *)animatedImageView player];

    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F8EB88]);
      id v7 = [(PXAssetAnimatedImageUIViewTile *)self _animatedImage];
      id v8 = objc_msgSend(v7, "pf_animatedImage");
      id v9 = (void *)[v6 initWithAnimatedImage:v8];

      [v9 setAllowFrameDrops:0];
      [(ISAnimatedImageView *)self->_animatedImageView setPlayer:v9];
    }
    BOOL v10 = [(PXAssetAnimatedImageUIViewTile *)self desiredPlayState] == 1;
  }
  else
  {
    [(ISAnimatedImageView *)animatedImageView setPlayer:0];
    BOOL v10 = 0;
  }
  [(ISAnimatedImageView *)self->_animatedImageView setPlaying:v10];
  [(PXAssetAnimatedImageUIViewTile *)self cornerRadius];
  if (v11 <= 0.0)
  {
    id v17 = [(ISAnimatedImageView *)self->_animatedImageView layer];
    [v17 setCornerRadius:0.0];
  }
  else
  {
    [(PXAssetAnimatedImageUIViewTile *)self cornerRadius];
    double v13 = v12;
    uint64_t v14 = [(ISAnimatedImageView *)self->_animatedImageView layer];
    [v14 setCornerRadius:v13];

    uint64_t v15 = *MEMORY[0x1E4F39EA8];
    v16 = [(ISAnimatedImageView *)self->_animatedImageView layer];
    [v16 setCornerCurve:v15];

    id v17 = [(ISAnimatedImageView *)self->_animatedImageView layer];
    [v17 setAllowsGroupOpacity:0];
  }
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    [(PXAssetAnimatedImageUIViewTile *)self _updateAnimatedImageView];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXAssetAnimatedImageUIViewTile *)self _updateAnimatedImageView];
  }
}

- (void)setImageRequester:(id)a3
{
  id v8 = (PXImageRequester *)a3;
  uint64_t v5 = self->_imageRequester;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = [(PXImageRequester *)v8 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = [(PXImageRequester *)self->_imageRequester mediaProvider];
      [v7 cancelImageRequest:self->_animatedImageRequestID];

      objc_storeStrong((id *)&self->_imageRequester, a3);
      self->_animatedImageRequestID = 0;
      [(PXAssetAnimatedImageUIViewTile *)self _requestAnimatedImageIfNeeded];
    }
  }
}

- (UIView)view
{
  animatedImageView = self->_animatedImageView;
  if (!animatedImageView)
  {
    uint64_t v4 = (ISAnimatedImageView *)[objc_alloc(MEMORY[0x1E4F8EB90]) initWithAnimatedImage:0];
    uint64_t v5 = self->_animatedImageView;
    self->_animatedImageView = v4;

    [(ISAnimatedImageView *)self->_animatedImageView setContentMode:2];
    [(ISAnimatedImageView *)self->_animatedImageView setClipsToBounds:1];
    [(ISAnimatedImageView *)self->_animatedImageView setUserInteractionEnabled:0];
    char v6 = +[PXAssetsSceneSettings sharedInstance];
    int v7 = [v6 showBordersOnAnimatedContent];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v9 = [v8 CGColor];
      BOOL v10 = [(ISAnimatedImageView *)self->_animatedImageView layer];
      [v10 setBorderColor:v9];

      double v11 = [(ISAnimatedImageView *)self->_animatedImageView layer];
      [v11 setBorderWidth:4.0];
    }
    [(PXAssetAnimatedImageUIViewTile *)self _updateAnimatedImageView];
    animatedImageView = self->_animatedImageView;
  }
  return (UIView *)animatedImageView;
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  self->_desiredPlayState = 1;
}

- (PXAssetAnimatedImageUIViewTile)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetAnimatedImageUIViewTile;
  result = [(PXAssetAnimatedImageUIViewTile *)&v3 init];
  if (result) {
    result->_desiredPlayState = 1;
  }
  return result;
}

@end