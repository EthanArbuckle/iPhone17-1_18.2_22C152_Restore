@interface PXVideoSessionUIView
- (AVPlayerLayer)activePlayerLayer;
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)isVideoLayerReadyForDisplay;
- (BOOL)placeholderVisible;
- (BOOL)toneMapToStandardDynamicRange;
- (CGRect)contentsRect;
- (NSString)videoGravity;
- (PXVideoSession)videoSession;
- (PXVideoSessionUIView)initWithFrame:(CGRect)a3;
- (PXVideoSessionUIViewDelegate)delegate;
- (UIImage)placeholderImage;
- (UIView)viewForSnapshotting;
- (id)generateSnapshotImage;
- (void)_updateEdgeAntialiasing;
- (void)_updatePlaceholderVisibility;
- (void)_updateVideoViewFrame;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderVisible:(BOOL)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
- (void)setVideoSession:(id)a3;
@end

@implementation PXVideoSessionUIView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoGravity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_adoptedVideoView, 0);
  objc_storeStrong((id *)&self->_videoContainerView, 0);
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (PXVideoSessionUIViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVideoSessionUIViewDelegate *)WeakRetained;
}

- (BOOL)placeholderVisible
{
  return self->_placeholderVisible;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void)_updateEdgeAntialiasing
{
  BOOL v3 = [(PXVideoSessionUIView *)self allowsEdgeAntialiasing];
  v4 = [(UIImageView *)self->_placeholderImageView layer];
  [v4 setAllowsEdgeAntialiasing:v3];

  id v5 = [(PXVideoView *)self->_adoptedVideoView layer];
  [v5 setAllowsEdgeAntialiasing:v3];
}

- (void)setPlaceholderVisible:(BOOL)a3
{
  if (self->_placeholderVisible != a3)
  {
    self->_placeholderVisible = a3;
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(UIImageView *)self->_placeholderImageView setAlpha:v4];
    id v5 = [(PXVideoSessionUIView *)self delegate];
    [v5 videoSessionViewPlaceholderVisibilityChanged:self];
  }
}

- (void)_updatePlaceholderVisibility
{
  uint64_t v3 = [(PXVideoView *)self->_adoptedVideoView videoIsReadyForDisplay] ^ 1;
  [(PXVideoSessionUIView *)self setPlaceholderVisible:v3];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x4000) != 0 && (void *)VideoSessionContext == a5) {
    px_dispatch_on_main_queue_sync();
  }
}

void __53__PXVideoSessionUIView_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) videoSession];
  v2 = [v3 videoPlayer];
  [*(id *)(*(void *)(a1 + 32) + 416) setPlayer:v2];
}

- (void)dealloc
{
  if (self->_adoptedVideoView)
  {
    videoSession = self->_videoSession;
    if (videoSession) {
      -[PXVideoSession recycleVideoView:](videoSession, "recycleVideoView:");
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)PXVideoSessionUIView;
  [(PXVideoSessionUIView *)&v4 dealloc];
}

- (BOOL)isVideoLayerReadyForDisplay
{
  return [(PXVideoView *)self->_adoptedVideoView videoIsReadyForDisplay];
}

- (AVPlayerLayer)activePlayerLayer
{
  return (AVPlayerLayer *)[(PXVideoView *)self->_adoptedVideoView playerLayer];
}

- (UIView)viewForSnapshotting
{
  adoptedVideoView = self->_adoptedVideoView;
  if (adoptedVideoView)
  {
    if ([(PXVideoView *)adoptedVideoView videoIsReadyForDisplay]) {
      adoptedVideoView = self->_adoptedVideoView;
    }
    else {
      adoptedVideoView = 0;
    }
  }
  return (UIView *)adoptedVideoView;
}

- (id)generateSnapshotImage
{
  if ([(PXVideoSessionUIView *)self placeholderVisible])
  {
    id v3 = [(PXVideoSessionUIView *)self placeholderImage];
  }
  else
  {
    objc_super v4 = [(PXVideoSessionUIView *)self videoSession];
    id v5 = (CGImage *)[v4 generateSnapshotImage];

    if (v5)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v5];
      CGImageRelease(v5);
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  if (self->_allowsEdgeAntialiasing != a3)
  {
    self->_allowsEdgeAntialiasing = a3;
    [(PXVideoSessionUIView *)self _updateEdgeAntialiasing];
  }
}

- (void)_updateVideoViewFrame
{
  id v3 = [(PXVideoSessionUIView *)self videoSession];
  objc_super v4 = [v3 contentProvider];
  id v19 = [v4 videoAspectRatio];

  [(PXVideoSessionUIView *)self contentsRect];
  [(PXVideoSessionUIView *)self bounds];
  [v19 floatValue];
  double v6 = v5;
  v7 = [(PXVideoSessionUIView *)self traitCollection];
  [v7 displayScale];
  double v17 = v6;
  uint64_t v18 = v8;
  PFFrameApplyingContentsRectInBounds();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[PXVideoView setFrame:](self->_adoptedVideoView, "setFrame:", v10, v12, v14, v16, *(void *)&v17, v18);
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  if (self->_toneMapToStandardDynamicRange != a3)
  {
    self->_toneMapToStandardDynamicRange = a3;
    -[PXVideoView setToneMapToStandardDynamicRange:](self->_adoptedVideoView, "setToneMapToStandardDynamicRange:");
  }
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.double x = x;
    p_contentsRect->origin.double y = y;
    p_contentsRect->size.double width = width;
    p_contentsRect->size.double height = height;
    double v9 = [(UIImageView *)self->_placeholderImageView layer];
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);

    [(PXVideoSessionUIView *)self _updateVideoViewFrame];
  }
}

- (void)setVideoGravity:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_videoGravity] & 1) == 0)
  {
    objc_super v4 = (NSString *)[v6 copy];
    videoGravitdouble y = self->_videoGravity;
    self->_videoGravitdouble y = v4;

    [(PXVideoView *)self->_adoptedVideoView setVideoGravity:self->_videoGravity];
  }
}

- (void)setPlaceholderImage:(id)a3
{
  float v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    [(UIImageView *)self->_placeholderImageView setImage:v5];
  }
}

- (void)setVideoSession:(id)a3
{
  float v5 = (PXVideoSession *)a3;
  p_videoSession = &self->_videoSession;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    double v13 = v5;
    [(PXVideoSession *)videoSession unregisterChangeObserver:self context:VideoSessionContext];
    adoptedVideoView = self->_adoptedVideoView;
    if (adoptedVideoView)
    {
      [(PXVideoView *)adoptedVideoView setDelegate:0];
      [(PXVideoView *)self->_adoptedVideoView removeFromSuperview];
      [(PXVideoSession *)*p_videoSession recycleVideoView:self->_adoptedVideoView];
      double v9 = self->_adoptedVideoView;
      self->_adoptedVideoView = 0;
    }
    objc_storeStrong((id *)&self->_videoSession, a3);
    [(PXVideoSession *)*p_videoSession registerChangeObserver:self context:VideoSessionContext];
    double v10 = [(PXVideoSession *)v13 dequeueVideoView];
    double v11 = self->_adoptedVideoView;
    self->_adoptedVideoView = v10;

    double v12 = [(PXVideoSessionUIView *)self videoGravity];
    [(PXVideoView *)self->_adoptedVideoView setVideoGravity:v12];

    [(PXVideoView *)self->_adoptedVideoView setContentMode:[(PXVideoSessionUIView *)self contentMode]];
    [(PXVideoView *)self->_adoptedVideoView setToneMapToStandardDynamicRange:[(PXVideoSessionUIView *)self toneMapToStandardDynamicRange]];
    [(PXVideoView *)self->_adoptedVideoView setDelegate:self];
    [(UIView *)self->_videoContainerView addSubview:self->_adoptedVideoView];
    [(PXVideoSessionUIView *)self setNeedsLayout];
    [(PXVideoSessionUIView *)self _updateEdgeAntialiasing];
    [(PXVideoSessionUIView *)self _updatePlaceholderVisibility];
    [(PXVideoSessionUIView *)self _updateVideoViewFrame];
    float v5 = v13;
  }
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXVideoSessionUIView;
  -[PXVideoSessionUIView setContentMode:](&v5, sel_setContentMode_);
  [(PXVideoView *)self->_adoptedVideoView setContentMode:a3];
  [(UIImageView *)self->_placeholderImageView setContentMode:a3];
  [(UIView *)self->_videoContainerView setContentMode:a3];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PXVideoSessionUIView;
  [(PXVideoSessionUIView *)&v11 layoutSubviews];
  [(PXVideoSessionUIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  -[UIView setFrame:](self->_videoContainerView, "setFrame:", v4, v6, v8, v10);
  [(PXVideoSessionUIView *)self _updateVideoViewFrame];
}

- (PXVideoSessionUIView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXVideoSessionUIView;
  double v3 = -[PXVideoSessionUIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_videoGravity, (id)*MEMORY[0x1E4F15AF8]);
    v4->_placeholderVisible = 1;
    double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    placeholderImageView = v4->_placeholderImageView;
    v4->_placeholderImageView = v5;

    double v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    videoContainerView = v4->_videoContainerView;
    v4->_videoContainerView = v7;

    [(UIView *)v4->_videoContainerView setClipsToBounds:1];
    CGSize v9 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
    v4->_contentsRect.origin = *(CGPoint *)off_1E5DAB010;
    v4->_contentsRect.size = v9;
    [(PXVideoSessionUIView *)v4 addSubview:v4->_placeholderImageView];
    [(PXVideoSessionUIView *)v4 addSubview:v4->_videoContainerView];
    [(PXVideoSessionUIView *)v4 setContentMode:2];
    [(PXVideoSessionUIView *)v4 setClipsToBounds:1];
    [(PXVideoSessionUIView *)v4 _updateEdgeAntialiasing];
  }
  return v4;
}

@end