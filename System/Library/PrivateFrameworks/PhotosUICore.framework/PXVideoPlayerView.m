@interface PXVideoPlayerView
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)isDisplayingPlaceHolder;
- (BOOL)toneMapToStandardDynamicRange;
- (CGRect)placeholderImageContentsRect;
- (ISWrappedAVPlayer)player;
- (NSArray)placeholderImageFilters;
- (PXVideoPlayerView)initWithFrame:(CGRect)a3;
- (PXVideoPlayerViewDelegate)delegate;
- (UIImage)placeholderImage;
- (double)videoAppearanceCrossfadeDuration;
- (id)generateSnapshotImage;
- (int64_t)placeholderDisplayMode;
- (int64_t)videoViewContentMode;
- (void)_runVisibilityChangeCompletionHandler;
- (void)_setDisplayingPlaceholder:(BOOL)a3 requestID:(int64_t)a4;
- (void)_updateContentMode;
- (void)_updateEdgeAntialiasing;
- (void)_updateSubviewsVisibility;
- (void)_updateVideoView;
- (void)layoutSubviews;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholderDisplayMode:(int64_t)a3;
- (void)setPlaceholderDisplayMode:(int64_t)a3 completion:(id)a4;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageContentsRect:(CGRect)a3;
- (void)setPlaceholderImageFilters:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoAppearanceCrossfadeDuration:(double)a3;
- (void)setVideoViewContentMode:(int64_t)a3;
@end

@implementation PXVideoPlayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImageFilters, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_visibilityChangeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_previewImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_videoViewConstraints, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (int64_t)videoViewContentMode
{
  return self->_videoViewContentMode;
}

- (BOOL)isDisplayingPlaceHolder
{
  return self->_displayingPlaceholder;
}

- (int64_t)placeholderDisplayMode
{
  return self->_placeholderDisplayMode;
}

- (CGRect)placeholderImageContentsRect
{
  double x = self->_placeholderImageContentsRect.origin.x;
  double y = self->_placeholderImageContentsRect.origin.y;
  double width = self->_placeholderImageContentsRect.size.width;
  double height = self->_placeholderImageContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVideoAppearanceCrossfadeDuration:(double)a3
{
  self->_videoAppearanceCrossfadeDuration = a3;
}

- (double)videoAppearanceCrossfadeDuration
{
  return self->_videoAppearanceCrossfadeDuration;
}

- (NSArray)placeholderImageFilters
{
  return self->_placeholderImageFilters;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (ISWrappedAVPlayer)player
{
  return self->_player;
}

- (void)setDelegate:(id)a3
{
}

- (PXVideoPlayerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVideoPlayerViewDelegate *)WeakRetained;
}

- (id)generateSnapshotImage
{
  [(UIImageView *)self->_previewImageView alpha];
  if (v3 <= 0.0)
  {
    v5 = [(PXVideoView *)self->_videoView player];
    v6 = v5;
    long long v25 = 0uLL;
    uint64_t v26 = 0;
    if (v5) {
      [v5 currentTime];
    }
    memset(v24, 0, sizeof(v24));
    v7 = [v6 currentItem];
    v8 = [v7 asset];
    v9 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v8];
    [v9 setAppliesPreferredTrackTransform:1];
    v10 = (long long *)MEMORY[0x1E4F1FA48];
    long long v22 = *MEMORY[0x1E4F1FA48];
    uint64_t v23 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v9 setRequestedTimeToleranceAfter:&v22];
    long long v20 = *v10;
    uint64_t v21 = *((void *)v10 + 2);
    [v9 setRequestedTimeToleranceBefore:&v20];
    v11 = [v7 videoComposition];
    [v9 setVideoComposition:v11];

    v12 = [v9 customVideoCompositor];
    NSClassFromString(&cfstr_Nuvideoplaybac.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [v9 customVideoCompositor];
      [v14 setValue:@"PXVideoPlayerView-generateSnapshotImage" forKey:@"label"];
    }
    long long v18 = v25;
    uint64_t v19 = v26;
    v15 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v9 atTime:&v18 actualTime:v24 error:0];
    if (v15)
    {
      v16 = v15;
      if (CGImageGetWidth(v15) && CGImageGetHeight(v16)) {
        v4 = (UIImage *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v16];
      }
      else {
        v4 = 0;
      }
      CFRelease(v16);
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = self->_placeholderImage;
  }
  return v4;
}

- (void)_runVisibilityChangeCompletionHandler
{
  visibilityChangeCompletionHandler = (void (**)(id, SEL))self->_visibilityChangeCompletionHandler;
  if (visibilityChangeCompletionHandler)
  {
    visibilityChangeCompletionHandler[2](visibilityChangeCompletionHandler, a2);
    id v4 = self->_visibilityChangeCompletionHandler;
    self->_visibilityChangeCompletionHandler = 0;
  }
}

- (void)_setDisplayingPlaceholder:(BOOL)a3 requestID:(int64_t)a4
{
  if (self->_placeholderVisibilityRequestID == a4 && (BOOL v5 = a3, self->_displayingPlaceholder != a3))
  {
    self->_displayingPlaceholder = a3;
    [(PXVideoPlayerView *)self videoAppearanceCrossfadeDuration];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke;
    v8[3] = &unk_1E5DCFE98;
    v8[4] = self;
    BOOL v9 = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke_2;
    v7[3] = &unk_1E5DD2188;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 4, v8, v7);
    v6 = [(PXVideoPlayerView *)self delegate];
    [v6 videoPlayerView:self isDisplayingPlaceholderDidChange:v5];
  }
  else
  {
    [(PXVideoPlayerView *)self _runVisibilityChangeCompletionHandler];
  }
}

uint64_t __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:v1];
}

uint64_t __57__PXVideoPlayerView__setDisplayingPlaceholder_requestID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runVisibilityChangeCompletionHandler];
}

- (void)_updateSubviewsVisibility
{
  int64_t v3 = [(PXVideoPlayerView *)self placeholderDisplayMode];
  id v4 = [(PXVideoView *)self->_videoView layer];
  int v5 = [v4 isReadyForDisplay];

  if (v3 == 1) {
    goto LABEL_9;
  }
  if (v3)
  {
    int64_t v3 = 0;
    goto LABEL_9;
  }
  int64_t v3 = v5 ^ 1u;
  v6 = [(PXVideoPlayerView *)self player];
  [v6 rate];
  if (v7 <= 0.0) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  if (v8 == 1)
  {

LABEL_9:
    int64_t v9 = self->_placeholderVisibilityRequestID + 1;
    self->_placeholderVisibilityRequestID = v9;
    goto LABEL_10;
  }
  v10 = [(PXVideoPlayerView *)self window];

  int64_t v9 = self->_placeholderVisibilityRequestID + 1;
  self->_placeholderVisibilityRequestID = v9;
  if (v10)
  {
    dispatch_time_t v11 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PXVideoPlayerView__updateSubviewsVisibility__block_invoke;
    block[3] = &unk_1E5DBE3F8;
    char v13 = v3;
    block[4] = self;
    block[5] = v9;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
    return;
  }
LABEL_10:
  [(PXVideoPlayerView *)self _setDisplayingPlaceholder:v3 requestID:v9];
}

uint64_t __46__PXVideoPlayerView__updateSubviewsVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDisplayingPlaceholder:*(unsigned __int8 *)(a1 + 48) requestID:*(void *)(a1 + 40)];
}

- (void)_updateEdgeAntialiasing
{
  BOOL v3 = [(PXVideoPlayerView *)self allowsEdgeAntialiasing];
  id v4 = [(UIImageView *)self->_previewImageView layer];
  [v4 setAllowsEdgeAntialiasing:v3];

  id v5 = [(PXVideoView *)self->_videoView layer];
  [v5 setAllowsEdgeAntialiasing:v3];
}

- (void)_updateContentMode
{
  int64_t v3 = [(PXVideoPlayerView *)self videoViewContentMode];
  uint64_t v4 = v3;
  if (v3 == 1)
  {
    id v5 = (void *)MEMORY[0x1E4F15AF0];
  }
  else
  {
    if (v3) {
      return;
    }
    id v5 = (void *)MEMORY[0x1E4F15AF8];
    uint64_t v4 = 2;
  }
  [(UIImageView *)self->_previewImageView setContentMode:v4];
  id v6 = [(PXVideoView *)self->_videoView layer];
  [v6 setVideoGravity:*v5];
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    [(PXVideoPlayerView *)self _updateEdgeAntialiasing];
  }
}

- (void)setVideoViewContentMode:(int64_t)a3
{
  if (self->_videoViewContentMode != a3)
  {
    self->_videoViewContentMode = a3;
    [(PXVideoPlayerView *)self _updateContentMode];
  }
}

- (void)setPlaceholderImageContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_placeholderImageContentsRect = &self->_placeholderImageContentsRect;
  if (!CGRectEqualToRect(a3, self->_placeholderImageContentsRect))
  {
    p_placeholderImageContentsRect->origin.double x = x;
    p_placeholderImageContentsRect->origin.double y = y;
    p_placeholderImageContentsRect->size.double width = width;
    p_placeholderImageContentsRect->size.double height = height;
    id v9 = [(UIImageView *)self->_previewImageView layer];
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);
  }
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  self->_toneMapToStandardDynamicRange = a3;
  -[PXVideoView setToneMapToStandardDynamicRange:](self->_videoView, "setToneMapToStandardDynamicRange:");
}

- (void)_updateVideoView
{
  if (!self->_videoView)
  {
    int64_t v3 = [PXVideoView alloc];
    [(PXVideoPlayerView *)self bounds];
    uint64_t v4 = -[PXVideoView initWithFrame:](v3, "initWithFrame:");
    videoView = self->_videoView;
    self->_videoView = v4;

    [(PXVideoView *)self->_videoView setUserInteractionEnabled:0];
    [(PXVideoView *)self->_videoView setAutoresizingMask:18];
    [(PXVideoView *)self->_videoView setToneMapToStandardDynamicRange:[(PXVideoPlayerView *)self toneMapToStandardDynamicRange]];
    [(PXVideoPlayerView *)self insertSubview:self->_videoView atIndex:0];
    objc_initWeak(&location, self);
    id v6 = [(PXVideoView *)self->_videoView layer];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __37__PXVideoPlayerView__updateVideoView__block_invoke;
    dispatch_time_t v11 = &unk_1E5DD32D0;
    objc_copyWeak(&v12, &location);
    [v6 setReadyForDisplayChangeHandler:&v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  float v7 = [(PXVideoPlayerView *)self player];
  [(PXVideoView *)self->_videoView setPlayer:v7];
  [(PXVideoPlayerView *)self _updateContentMode];
  [(PXVideoPlayerView *)self _updateEdgeAntialiasing];
  [(PXVideoPlayerView *)self _updateSubviewsVisibility];
  [(PXVideoPlayerView *)self setNeedsLayout];
}

void __37__PXVideoPlayerView__updateVideoView__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  px_dispatch_on_main_queue();
}

void __37__PXVideoPlayerView__updateVideoView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSubviewsVisibility];
}

- (void)setPlayer:(id)a3
{
  id v5 = (ISWrappedAVPlayer *)a3;
  if (self->_player != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_player, a3);
    [(PXVideoPlayerView *)self _updateVideoView];
    id v5 = v6;
  }
}

- (void)setPlaceholderDisplayMode:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (self->_placeholderDisplayMode == a3)
  {
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v9 = v6;
    v6[2]();
  }
  else
  {
    uint64_t v9 = v6;
    float v7 = (void *)[v6 copy];
    id visibilityChangeCompletionHandler = self->_visibilityChangeCompletionHandler;
    self->_id visibilityChangeCompletionHandler = v7;

    self->_placeholderDisplayMode = a3;
    [(PXVideoPlayerView *)self _updateSubviewsVisibility];
  }
  id v6 = v9;
LABEL_6:
}

- (void)setPlaceholderDisplayMode:(int64_t)a3
{
}

- (void)setPlaceholderImageFilters:(id)a3
{
  id v12 = (NSArray *)a3;
  uint64_t v4 = self->_placeholderImageFilters;
  id v5 = v12;
  if (v4 != v12)
  {
    char v6 = [(NSArray *)v12 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    float v7 = (NSArray *)[(NSArray *)v12 copy];
    placeholderImageFilters = self->_placeholderImageFilters;
    self->_placeholderImageFilters = v7;

    uint64_t v9 = [(UIImageView *)self->_previewImageView layer];
    [v9 setFilters:v12];

    BOOL v10 = [(NSArray *)v12 count] != 0;
    dispatch_time_t v11 = [(UIImageView *)self->_previewImageView layer];
    [v11 setShouldRasterize:v10];

    id v5 = [(UIImageView *)self->_previewImageView layer];
    [v5 setRasterizationScale:0.5];
  }

LABEL_5:
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(UIImageView *)self->_previewImageView setImage:v5];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXVideoPlayerView;
  [(PXVideoPlayerView *)&v11 layoutSubviews];
  [(PXVideoPlayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_previewImageView, "setFrame:");
  -[PXVideoView setFrame:](self->_videoView, "setFrame:", v4, v6, v8, v10);
}

- (PXVideoPlayerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXVideoPlayerView;
  double v3 = -[PXVideoPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_placeholderDisplayMode = 0;
    v3->_videoAppearanceCrossfadeDuration = 0.0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PXVideoPlayerView *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    previewImageView = v4->_previewImageView;
    v4->_previewImageView = (UIImageView *)v6;

    [(UIImageView *)v4->_previewImageView setUserInteractionEnabled:0];
    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v4->_previewImageView setBackgroundColor:v8];

    v4->_displayingPlaceholder = 1;
    [(PXVideoPlayerView *)v4 addSubview:v4->_previewImageView];
    [(PXVideoPlayerView *)v4 setVideoViewContentMode:0];
    [(PXVideoPlayerView *)v4 setClipsToBounds:1];
    [(PXVideoPlayerView *)v4 _updateContentMode];
    [(PXVideoPlayerView *)v4 _updateEdgeAntialiasing];
    [(PXVideoPlayerView *)v4 _updateSubviewsVisibility];
  }
  return v4;
}

@end