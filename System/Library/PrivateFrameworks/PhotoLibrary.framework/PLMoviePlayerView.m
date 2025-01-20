@interface PLMoviePlayerView
- (AVPlayer)player;
- (BOOL)isDestinationPlaceholderHidden;
- (PLMoviePlayerView)initWithFrame:(CGRect)a3;
- (UIView)videoView;
- (int64_t)destinationPlaceholderStyle;
- (void)_installBackgroundView:(id)a3;
- (void)dealloc;
- (void)reattachVideoView;
- (void)setDestinationPlaceholderHidden:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setScaleMode:(int64_t)a3 duration:(double)a4;
@end

@implementation PLMoviePlayerView

- (int64_t)destinationPlaceholderStyle
{
  return self->_destinationPlaceholderStyle;
}

- (void)_installBackgroundView:(id)a3
{
  [(PLMoviePlayerView *)self bounds];
  objc_msgSend(a3, "setFrame:");
  [a3 setAutoresizingMask:18];
  [a3 setHidden:self->_destinationPlaceholderHidden];
  [(PLMoviePlayerView *)self addSubview:a3];
}

- (void)setDestinationPlaceholderHidden:(BOOL)a3
{
  if (self->_destinationPlaceholderHidden != a3) {
    self->_destinationPlaceholderHidden = a3;
  }
}

- (BOOL)isDestinationPlaceholderHidden
{
  return self->_destinationPlaceholderHidden;
}

- (void)setScaleMode:(int64_t)a3 duration:(double)a4
{
}

- (void)setScaleMode:(int64_t)a3
{
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayer)player
{
  return [(PLAVPlayerView *)self->_avPlayerView player];
}

- (void)reattachVideoView
{
  [(PLAVPlayerView *)self->_avPlayerView removeFromSuperview];
  [(PLAVPlayerView *)self->_avPlayerView setAutoresizingMask:18];
  avPlayerView = self->_avPlayerView;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PLAVPlayerView *)avPlayerView setTransform:v6];
  v5 = self->_avPlayerView;
  [(PLMoviePlayerView *)self bounds];
  -[PLAVPlayerView setFrame:](v5, "setFrame:");
  [(PLMoviePlayerView *)self insertSubview:self->_avPlayerView atIndex:0];
}

- (UIView)videoView
{
  return &self->_avPlayerView->super;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLMoviePlayerView;
  [(PLMoviePlayerView *)&v3 dealloc];
}

- (PLMoviePlayerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLMoviePlayerView;
  objc_super v3 = -[PLMoviePlayerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    long long v4 = [PLAVPlayerView alloc];
    [(PLMoviePlayerView *)v3 bounds];
    v5 = -[PLAVPlayerView initWithFrame:](v4, "initWithFrame:");
    v3->_avPlayerView = v5;
    [(PLAVPlayerView *)v5 setUserInteractionEnabled:0];
    [(PLMoviePlayerView *)v3 reattachVideoView];
  }
  return v3;
}

@end