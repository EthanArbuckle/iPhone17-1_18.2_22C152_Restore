@interface PUVideoPlayerView
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)isDisplayingPlaceholder;
- (BOOL)isDisplayingVideo;
- (BOOL)isReadyForVideoDisplay;
- (CGRect)placeholderImageContentsRect;
- (PUVideoPlayerView)initWithFrame:(CGRect)a3;
- (PUVideoPlayerViewDelegate)delegate;
- (UIImage)placeholderImage;
- (id)generateSnapshotImage;
- (unint64_t)videoViewContentMode;
- (void)_installNewVideoViewIfNecessaryWithPlayer:(id)a3;
- (void)_updateContentMode;
- (void)_updateEdgeAntialiasing;
- (void)_updateSubviewsVisibility;
- (void)configureWithAVPlayer:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDisplayingPlaceholder:(BOOL)a3;
- (void)setIsDisplayingVideo:(BOOL)a3;
- (void)setIsReadyForVideoDisplay:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageContentsRect:(CGRect)a3;
- (void)setVideoViewContentMode:(unint64_t)a3;
@end

@implementation PUVideoPlayerView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_previewImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_previewImageView, 0);
  objc_storeStrong((id *)&self->_videoViewConstraints, 0);

  objc_storeStrong((id *)&self->_videoView, 0);
}

- (void)setIsDisplayingVideo:(BOOL)a3
{
  self->_isDisplayingVideo = a3;
}

- (BOOL)isDisplayingVideo
{
  return self->_isDisplayingVideo;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (void)setDelegate:(id)a3
{
}

- (PUVideoPlayerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUVideoPlayerViewDelegate *)WeakRetained;
}

- (unint64_t)videoViewContentMode
{
  return self->_videoViewContentMode;
}

- (BOOL)isDisplayingPlaceholder
{
  return self->_isDisplayingPlaceholder;
}

- (BOOL)isReadyForVideoDisplay
{
  return self->_isReadyForVideoDisplay;
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

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (id)generateSnapshotImage
{
  if (self->_isDisplayingPlaceholder)
  {
    v3 = self->_placeholderImage;
  }
  else
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
    v4 = [(_PUVideoView *)self->_videoView player];
    v5 = v4;
    if (v4)
    {
      [v4 currentTime];
    }
    else
    {
      long long v18 = 0uLL;
      uint64_t v19 = 0;
    }

    memset(v17, 0, sizeof(v17));
    v6 = [(_PUVideoView *)self->_videoView player];
    v7 = [v6 currentItem];
    v8 = [v7 asset];

    v9 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v8];
    [v9 setAppliesPreferredTrackTransform:1];
    long long v15 = *MEMORY[0x1E4F1FA48];
    long long v14 = v15;
    uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    uint64_t v10 = v16;
    [v9 setRequestedTimeToleranceBefore:&v15];
    long long v15 = v14;
    uint64_t v16 = v10;
    [v9 setRequestedTimeToleranceAfter:&v15];
    long long v15 = v18;
    uint64_t v16 = v19;
    v11 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v9 atTime:&v15 actualTime:v17 error:0];
    if (v11)
    {
      v12 = v11;
      if (CGImageGetWidth(v11) && CGImageGetHeight(v12))
      {
        v3 = [MEMORY[0x1E4FB1818] imageWithCGImage:v12];
      }
      else
      {
        v3 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PUPlayerLayerReadyForDisplayObservingContext)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PUVideoPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUVideoPlayerView;
    -[PUVideoPlayerView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __68__PUVideoPlayerView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  uint64_t v3 = [v2 isReadyForDisplay];

  v4 = *(void **)(a1 + 32);

  return [v4 setIsReadyForVideoDisplay:v3];
}

- (void)dealloc
{
  uint64_t v3 = [(_PUVideoView *)self->_videoView layer];
  [v3 removeObserver:self forKeyPath:@"readyForDisplay"];

  v4.receiver = self;
  v4.super_class = (Class)PUVideoPlayerView;
  [(PUVideoPlayerView *)&v4 dealloc];
}

- (void)_updateSubviewsVisibility
{
  BOOL isDisplayingPlaceholder = self->_isDisplayingPlaceholder;
  previewImageView = self->_previewImageView;
  if (isDisplayingPlaceholder)
  {
    [(UIImageView *)previewImageView setAlpha:1.0];
  }
  else
  {
    [(UIImageView *)previewImageView setAlpha:0.0];
    [(_PUVideoView *)self->_videoView removeFromSuperview];
    videoView = self->_videoView;
    [(PUVideoPlayerView *)self addSubview:videoView];
  }
}

- (void)_updateEdgeAntialiasing
{
  BOOL v3 = [(PUVideoPlayerView *)self allowsEdgeAntialiasing];
  objc_super v4 = [(UIImageView *)self->_previewImageView layer];
  [v4 setAllowsEdgeAntialiasing:v3];

  id v5 = [(_PUVideoView *)self->_videoView layer];
  [v5 setAllowsEdgeAntialiasing:v3];
}

- (void)_updateContentMode
{
  unint64_t v3 = [(PUVideoPlayerView *)self videoViewContentMode];
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
  id v6 = [(_PUVideoView *)self->_videoView layer];
  [v6 setVideoGravity:*v5];
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    [(PUVideoPlayerView *)self _updateEdgeAntialiasing];
  }
}

- (void)setVideoViewContentMode:(unint64_t)a3
{
  if (self->_videoViewContentMode != a3)
  {
    self->_videoViewContentMode = a3;
    [(PUVideoPlayerView *)self _updateContentMode];
  }
}

- (void)setIsReadyForVideoDisplay:(BOOL)a3
{
  if (self->_isReadyForVideoDisplay != a3)
  {
    BOOL v3 = a3;
    self->_isReadyForVideoDispladouble y = a3;
    id v5 = [(PUVideoPlayerView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PUVideoPlayerView *)self delegate];
      [v7 videoPlayerView:self isReadyForDisplayDidChange:v3];
    }
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

- (void)_installNewVideoViewIfNecessaryWithPlayer:(id)a3
{
  id v4 = a3;
  videoView = self->_videoView;
  id v10 = v4;
  if (!videoView)
  {
    char v6 = [_PUVideoView alloc];
    [(PUVideoPlayerView *)self bounds];
    id v7 = -[_PUVideoView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_videoView;
    self->_videoView = v7;

    [(_PUVideoView *)self->_videoView setUserInteractionEnabled:0];
    [(_PUVideoView *)self->_videoView setAutoresizingMask:18];
    [(PUVideoPlayerView *)self insertSubview:self->_videoView atIndex:0];
    id v9 = [(_PUVideoView *)self->_videoView layer];
    [v9 addObserver:self forKeyPath:@"readyForDisplay" options:4 context:&PUPlayerLayerReadyForDisplayObservingContext];

    id v4 = v10;
    videoView = self->_videoView;
  }
  [(_PUVideoView *)videoView setPlayer:v4];
  [(PUVideoPlayerView *)self _updateContentMode];
  [(PUVideoPlayerView *)self _updateEdgeAntialiasing];
  [(PUVideoPlayerView *)self setNeedsLayout];
}

- (void)setIsDisplayingPlaceholder:(BOOL)a3
{
  if (self->_isDisplayingPlaceholder != a3)
  {
    self->_BOOL isDisplayingPlaceholder = a3;
    [(PUVideoPlayerView *)self _updateSubviewsVisibility];
  }
}

- (void)configureWithAVPlayer:(id)a3
{
  id v5 = a3;
  id v4 = [(_PUVideoView *)self->_videoView player];

  if (v4 != v5)
  {
    [(PUVideoPlayerView *)self setIsDisplayingPlaceholder:1];
    [(PUVideoPlayerView *)self setIsReadyForVideoDisplay:0];
    [(PUVideoPlayerView *)self _installNewVideoViewIfNecessaryWithPlayer:v5];
  }
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
  v11.super_class = (Class)PUVideoPlayerView;
  [(PUVideoPlayerView *)&v11 layoutSubviews];
  [(PUVideoPlayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_previewImageView, "setFrame:");
  -[_PUVideoView setFrame:](self->_videoView, "setFrame:", v4, v6, v8, v10);
  [(PUVideoPlayerView *)self _updateSubviewsVisibility];
}

- (PUVideoPlayerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUVideoPlayerView;
  double v3 = -[PUVideoPlayerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PUVideoPlayerView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    previewImageView = v3->_previewImageView;
    v3->_previewImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_previewImageView setUserInteractionEnabled:0];
    [(PUVideoPlayerView *)v3 addSubview:v3->_previewImageView];
    v3->_BOOL isDisplayingPlaceholder = 1;
    v3->_isReadyForVideoDispladouble y = 0;
    [(PUVideoPlayerView *)v3 setVideoViewContentMode:0];
    [(PUVideoPlayerView *)v3 setClipsToBounds:1];
    [(PUVideoPlayerView *)v3 _updateContentMode];
    [(PUVideoPlayerView *)v3 _updateEdgeAntialiasing];
  }
  return v3;
}

@end