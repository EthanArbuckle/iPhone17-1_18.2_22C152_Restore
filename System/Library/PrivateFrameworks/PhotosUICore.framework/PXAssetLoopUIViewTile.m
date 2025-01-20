@interface PXAssetLoopUIViewTile
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)bestPlaybackTimeRange;
- (CGRect)desiredContentsRect;
- (CGSize)contentSize;
- (PXAssetLoopUIViewTile)init;
- (PXImageRequester)imageRequester;
- (PXVideoSession)videoSession;
- (UIView)view;
- (double)cornerRadius;
- (int64_t)desiredPlayState;
- (void)_reloadVideoSessionIfNecessary;
- (void)_updateDesiredDynamicRange;
- (void)_updateImageRequester;
- (void)_updateLayer;
- (void)_updateVideoSession;
- (void)becomeReusable;
- (void)dealloc;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setBestPlaybackTimeRange:(id *)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDesiredContentsRect:(CGRect)a3;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setImageRequester:(id)a3;
- (void)setVideoSession:(id)a3;
@end

@implementation PXAssetLoopUIViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredContentsRect:(CGRect)a3
{
  self->_desiredContentsRect = a3;
}

- (CGRect)desiredContentsRect
{
  double x = self->_desiredContentsRect.origin.x;
  double y = self->_desiredContentsRect.origin.y;
  double width = self->_desiredContentsRect.size.width;
  double height = self->_desiredContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
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
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
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

- (void)dealloc
{
  long long v3 = +[PXVideoSessionManager sharedInstance];
  [v3 checkInVideoSession:self->_videoSession];

  v4.receiver = self;
  v4.super_class = (Class)PXAssetLoopUIViewTile;
  [(PXAssetLoopUIViewTile *)&v4 dealloc];
}

- (void)setVideoSession:(id)a3
{
  v5 = (PXVideoSession *)a3;
  if (self->_videoSession != v5)
  {
    v6 = +[PXVideoSessionManager sharedInstance];
    [v6 checkInVideoSession:self->_videoSession];

    [(PXVideoSession *)self->_videoSession unregisterChangeObserver:self context:VideoSessionContext_37430];
    objc_storeStrong((id *)&self->_videoSession, a3);
    [(PXVideoSession *)self->_videoSession registerChangeObserver:self context:VideoSessionContext_37430];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PXAssetLoopUIViewTile_setVideoSession___block_invoke;
    v7[3] = &unk_1E5DB4558;
    v7[4] = self;
    [(PXVideoSession *)v5 performChanges:v7 withPresentationContext:0 presenter:0];
    [(PXVideoSessionUIView *)self->_videoView setVideoSession:v5];
    [(PXAssetLoopUIViewTile *)self _updateDesiredDynamicRange];
  }
}

void __41__PXAssetLoopUIViewTile_setVideoSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setVolume:1 withFade:0.0];
  [v3 setAudioSessionCategory:*MEMORY[0x1E4F14F68] mode:*MEMORY[0x1E4F15050] routeSharingPolicy:0 options:0];
  objc_msgSend(v3, "setDesiredPlayState:", objc_msgSend(*(id *)(a1 + 32), "desiredPlayState") == 1);
}

- (void)_updateDesiredDynamicRange
{
  id v3 = [(PXAssetLoopUIViewTile *)self imageRequester];
  id v10 = [v3 asset];

  if (([v10 mediaSubtypes] & 0x100000) != 0)
  {
    objc_super v4 = [(PXAssetLoopUIViewTile *)self videoSession];
    uint64_t v5 = [v4 playState];

    v6 = [(PXAssetLoopUIViewTile *)self view];
    v7 = [v6 layer];
    v8 = [v7 context];

    LODWORD(v9) = 1065361605;
    if (v5 != 3) {
      *(float *)&double v9 = 1.0;
    }
    [v8 setDesiredDynamicRange:v9];
  }
}

- (void)_reloadVideoSessionIfNecessary
{
  id v3 = [(PXAssetLoopUIViewTile *)self imageRequester];
  objc_super v4 = [v3 asset];

  uint64_t v5 = [(PXAssetLoopUIViewTile *)self imageRequester];
  v6 = [v5 mediaProvider];

  v7 = 0;
  if (v4 && v6)
  {
    v8 = [(PXAssetLoopUIViewTile *)self view];
    v7 = [(PXVideoSessionManagerDisplayAssetOptions *)v8 window];
    if (v7)
    {
      double v9 = [(PXAssetLoopUIViewTile *)self view];
      if ([v9 isHidden])
      {

LABEL_9:
        v7 = 0;
        goto LABEL_10;
      }
      int64_t v10 = [(PXAssetLoopUIViewTile *)self desiredPlayState];

      if (v10 != 1) {
        goto LABEL_9;
      }
      v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
      [(PXVideoSessionManagerDisplayAssetOptions *)v8 setShouldStabilizeLivePhotosIfPossible:1];
      [(PXVideoSessionManagerDisplayAssetOptions *)v8 setShouldCrossfadeLivePhotosWhenLooping:1];
      [(PXAssetLoopUIViewTile *)self bestPlaybackTimeRange];
      v18[0] = v18[3];
      v18[1] = v18[4];
      v18[2] = v18[5];
      [(PXVideoSessionManagerDisplayAssetOptions *)v8 setLivePhotoLoopTimeRange:v18];
      v11 = +[PXVideoSessionManager sharedInstance];
      v7 = [v11 videoSessionForAsset:v4 withOptions:v8 mediaProvider:v6];

      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __55__PXAssetLoopUIViewTile__reloadVideoSessionIfNecessary__block_invoke;
      v15 = &unk_1E5DAE670;
      id v16 = v4;
      v17 = self;
      [v7 performChanges:&v12 withPresentationContext:0 presenter:0];
      objc_msgSend(v7, "loadIfNeededWithPriority:", 0, v12, v13, v14, v15);
    }
  }
LABEL_10:
  [(PXAssetLoopUIViewTile *)self setVideoSession:v7];
}

void __55__PXAssetLoopUIViewTile__reloadVideoSessionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setLoopingEnabled:1];
  [v3 setVolume:1 withFade:0.0];
  if ([*(id *)(a1 + 32) playbackStyle] == 3)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v7 = *MEMORY[0x1E4F1FA20];
    long long v8 = v4;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    uint64_t v5 = &v7;
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      [v6 bestPlaybackTimeRange];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    long long v10 = v13;
    long long v11 = v14;
    long long v12 = v15;
    uint64_t v5 = &v10;
  }
  objc_msgSend(v3, "setPlaybackTimeRange:", v5, v7, v8, v9, v10, v11, v12);
}

- (void)_updateVideoSession
{
  int64_t v3 = [(PXAssetLoopUIViewTile *)self desiredPlayState];
  long long v4 = [(PXAssetLoopUIViewTile *)self videoSession];
  id v6 = v4;
  if (v3 != 1)
  {
    uint64_t v5 = &__block_literal_global_12;
    goto LABEL_5;
  }
  if (v4)
  {
    uint64_t v5 = &__block_literal_global_2196;
LABEL_5:
    [v4 performChanges:v5 withPresentationContext:0 presenter:0];
    goto LABEL_7;
  }
  [(PXAssetLoopUIViewTile *)self _reloadVideoSessionIfNecessary];
LABEL_7:
}

uint64_t __44__PXAssetLoopUIViewTile__updateVideoSession__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:0];
}

uint64_t __44__PXAssetLoopUIViewTile__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:1];
}

- (void)_updateImageRequester
{
  [(PXAssetLoopUIViewTile *)self contentSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(PXAssetLoopUIViewTile *)self desiredContentsRect];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [(PXVideoSessionUIView *)self->_videoView bounds];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  v19 = [(PXAssetLoopUIViewTile *)self imageRequester];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__PXAssetLoopUIViewTile__updateImageRequester__block_invoke;
  v20[3] = &__block_descriptor_96_e35_v16__0___PXMutableImageRequester__8l;
  v20[4] = v4;
  v20[5] = v6;
  v20[6] = v8;
  v20[7] = v10;
  v20[8] = v12;
  v20[9] = v14;
  v20[10] = v16;
  v20[11] = v18;
  [v19 performChanges:v20];
}

void __46__PXAssetLoopUIViewTile__updateImageRequester__block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);
}

- (void)_updateLayer
{
  [(PXAssetLoopUIViewTile *)self cornerRadius];
  if (v3 <= 0.0)
  {
    id v9 = [(_PXAssetLoopUIView *)self->_view layer];
    [v9 setCornerRadius:0.0];
  }
  else
  {
    [(PXAssetLoopUIViewTile *)self cornerRadius];
    double v5 = v4;
    uint64_t v6 = [(_PXAssetLoopUIView *)self->_view layer];
    [v6 setCornerRadius:v5];

    uint64_t v7 = *MEMORY[0x1E4F39EA8];
    uint64_t v8 = [(_PXAssetLoopUIView *)self->_view layer];
    [v8 setCornerCurve:v7];

    id v9 = [(_PXAssetLoopUIView *)self->_view layer];
    [v9 setAllowsGroupOpacity:0];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ImageRequesterContext == a5)
  {
    if ((v6 & 4) != 0)
    {
      v14[5] = MEMORY[0x1E4F143A8];
      v14[6] = 3221225472;
      v14[7] = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke;
      v14[8] = &unk_1E5DD36F8;
      v14[9] = self;
      px_dispatch_on_main_queue();
    }
    if (v6)
    {
      uint64_t v10 = v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      uint64_t v11 = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_2;
LABEL_9:
      v10[2] = v11;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    if ((void *)VideoSessionContext_37430 != a5)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXAssetLoopUIViewTile.m" lineNumber:172 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v10 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      uint64_t v11 = __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_3;
      goto LABEL_9;
    }
  }
}

void __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageRequester];
  double v3 = [v2 image];
  [*(id *)(*(void *)(a1 + 32) + 32) setPlaceholderImage:v3];

  id v4 = [*(id *)(a1 + 32) imageRequester];
  [v4 contentsRect];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setContentsRect:");
}

uint64_t __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadVideoSessionIfNecessary];
}

uint64_t __54__PXAssetLoopUIViewTile_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDesiredDynamicRange];
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (self->_desiredPlayState != a3)
  {
    self->_desiredPlayState = a3;
    [(PXAssetLoopUIViewTile *)self _updateVideoSession];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXAssetLoopUIViewTile *)self _updateLayer];
  }
}

- (void)setImageRequester:(id)a3
{
  id v9 = (PXImageRequester *)a3;
  double v5 = self->_imageRequester;
  if (v5 == v9)
  {
  }
  else
  {
    char v6 = [(PXImageRequester *)v9 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(PXVideoSession *)self->_videoSession contentProvider];
      [v7 cancelLoading];

      [(PXImageRequester *)self->_imageRequester unregisterChangeObserver:self context:ImageRequesterContext];
      objc_storeStrong((id *)&self->_imageRequester, a3);
      [(PXImageRequester *)self->_imageRequester registerChangeObserver:self context:ImageRequesterContext];
      uint64_t v8 = [(PXImageRequester *)self->_imageRequester image];
      [(PXVideoSessionUIView *)self->_videoView setPlaceholderImage:v8];

      [(PXAssetLoopUIViewTile *)self _updateImageRequester];
      [(PXAssetLoopUIViewTile *)self _reloadVideoSessionIfNecessary];
    }
  }
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    objc_initWeak(&location, self);
    id v4 = [_PXAssetLoopUIView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v9 = -[_PXAssetLoopUIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    uint64_t v10 = self->_view;
    self->_view = v9;

    [(_PXAssetLoopUIView *)self->_view setUserInteractionEnabled:0];
    [(_PXAssetLoopUIView *)self->_view setClipsToBounds:1];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __29__PXAssetLoopUIViewTile_view__block_invoke;
    v23 = &unk_1E5DD32D0;
    objc_copyWeak(&v24, &location);
    [(_PXAssetLoopUIView *)self->_view setVisibilityChangeHandler:&v20];
    uint64_t v11 = +[PXAssetsSceneSettings sharedInstance];
    int v12 = [v11 showBordersOnAnimatedContent];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4FB1618] greenColor];
      uint64_t v14 = [v13 CGColor];
      uint64_t v15 = [(_PXAssetLoopUIView *)self->_view layer];
      [v15 setBorderColor:v14];

      uint64_t v16 = [(_PXAssetLoopUIView *)self->_view layer];
      [v16 setBorderWidth:4.0];
    }
    uint64_t v17 = -[PXVideoSessionUIView initWithFrame:]([PXVideoSessionUIView alloc], "initWithFrame:", v5, v6, v7, v8);
    videoView = self->_videoView;
    self->_videoView = v17;

    [(PXVideoSessionUIView *)self->_videoView setAutoresizingMask:18];
    [(PXAssetLoopUIViewTile *)self _updateLayer];
    [(_PXAssetLoopUIView *)self->_view addSubview:self->_videoView];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    view = self->_view;
  }
  return (UIView *)view;
}

void __29__PXAssetLoopUIViewTile_view__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadVideoSessionIfNecessary];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXVideoSessionUIView setContentsRect:](self->_videoView, "setContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  -[PXAssetLoopUIViewTile setDesiredContentsRect:](self, "setDesiredContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  -[PXAssetLoopUIViewTile setContentSize:](self, "setContentSize:", a3->contentSize.width, a3->contentSize.height);
  [(PXAssetLoopUIViewTile *)self _updateImageRequester];
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  self->_desiredPlayState = 1;
}

- (PXAssetLoopUIViewTile)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetLoopUIViewTile;
  CGRect result = [(PXAssetLoopUIViewTile *)&v3 init];
  if (result) {
    result->_desiredPlayState = 1;
  }
  return result;
}

@end