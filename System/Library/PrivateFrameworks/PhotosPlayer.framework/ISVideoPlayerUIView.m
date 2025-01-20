@interface ISVideoPlayerUIView
- (BOOL)videoLayerReadyForDisplay;
- (CGRect)contentsRect;
- (ISVideoPlayerUIView)initWithCoder:(id)a3;
- (ISVideoPlayerUIView)initWithFrame:(CGRect)a3;
- (ISWrappedAVPlayer)videoPlayer;
- (id)playerLayer;
- (id)videoLayerReadyForDisplayChangeHandler;
- (void)_ISVideoPlayerUIView_commonInitialization;
- (void)_updateVideoGravity;
- (void)setContentMode:(int64_t)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3;
- (void)setVideoPlayer:(id)a3;
@end

@implementation ISVideoPlayerUIView

- (void)setVideoPlayer:(id)a3
{
  p_videoPlayer = &self->_videoPlayer;
  v7 = (ISWrappedAVPlayer *)a3;
  if (*p_videoPlayer != v7)
  {
    v6 = [(ISAVPlayerUIView *)self->_playerView playerLayer];
    [v6 setPlayer:v7];
    objc_storeStrong((id *)p_videoPlayer, a3);
  }
}

- (void)setContentMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ISVideoPlayerUIView;
  [(ISVideoPlayerUIView *)&v4 setContentMode:a3];
  [(ISVideoPlayerUIView *)self _updateVideoGravity];
}

- (void)_updateVideoGravity
{
  uint64_t v3 = [(ISVideoPlayerUIView *)self contentMode];
  objc_super v4 = (id *)MEMORY[0x1E4F15AF0];
  v5 = (id *)MEMORY[0x1E4F15AF8];
  if (v3 != 2) {
    v5 = (id *)MEMORY[0x1E4F15AE8];
  }
  if (v3 != 1) {
    objc_super v4 = v5;
  }
  id v7 = *v4;
  v6 = [(ISAVPlayerUIView *)self->_playerView playerLayer];
  [v6 setVideoGravity:v7];
}

- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ISVideoPlayerUIView *)self playerLayer];
  [v5 setReadyForDisplayChangeHandler:v4];
}

- (id)playerLayer
{
  return [(ISAVPlayerUIView *)self->_playerView playerLayer];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayer, 0);

  objc_storeStrong((id *)&self->_playerView, 0);
}

- (BOOL)videoLayerReadyForDisplay
{
  return self->_videoLayerReadyForDisplay;
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

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
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
    id v9 = [(ISAVPlayerUIView *)self->_playerView layer];
    objc_msgSend(v9, "setContentsRect:", x, y, width, height);
  }
}

- (id)videoLayerReadyForDisplayChangeHandler
{
  v2 = [(ISVideoPlayerUIView *)self playerLayer];
  uint64_t v3 = [v2 readyForDisplayChangeHandler];

  return v3;
}

- (void)_ISVideoPlayerUIView_commonInitialization
{
  uint64_t v3 = [(ISVideoPlayerUIView *)self layer];
  id v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.1 alpha:0.01];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(ISVideoPlayerUIView *)self layer];
  [v5 setBorderWidth:1.0];

  v6 = [ISAVPlayerUIView alloc];
  [(ISVideoPlayerUIView *)self bounds];
  id v7 = -[ISAVPlayerUIView initWithFrame:](v6, "initWithFrame:");
  playerView = self->_playerView;
  self->_playerView = v7;

  [(ISAVPlayerUIView *)self->_playerView setAutoresizingMask:18];
  [(ISVideoPlayerUIView *)self addSubview:self->_playerView];
  self->_contentsRect = *(CGRect *)ISRectUnit;
}

- (ISVideoPlayerUIView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISVideoPlayerUIView;
  uint64_t v3 = [(ISVideoPlayerUIView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(ISVideoPlayerUIView *)v3 _ISVideoPlayerUIView_commonInitialization];
  }
  return v4;
}

- (ISVideoPlayerUIView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISVideoPlayerUIView;
  uint64_t v3 = -[ISVideoPlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(ISVideoPlayerUIView *)v3 _ISVideoPlayerUIView_commonInitialization];
  }
  return v4;
}

@end