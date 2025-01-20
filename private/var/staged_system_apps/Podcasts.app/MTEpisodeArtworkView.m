@interface MTEpisodeArtworkView
- (BOOL)canBecomeFocused;
- (BOOL)isCurrentPlayerItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTEpisodeArtworkView)initWithFrame:(CGRect)a3;
- (MTNowPlayingIndicatorView)barsView;
- (MTVibrantImageView)vibrantImageView;
- (UIImage)artwork;
- (UIImageView)imageView;
- (UIView)dimmingView;
- (id)_blurredArtworkForArtwork:(id)a3;
- (void)_updateBarMetricsForArtworkSize:(CGSize)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArtwork:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDimmingView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVibrantImageView:(id)a3;
- (void)startObservingPlaybackState;
- (void)stopObservingPlaybackState;
- (void)updatePlaybackState;
@end

@implementation MTEpisodeArtworkView

- (MTEpisodeArtworkView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTEpisodeArtworkView;
  v3 = -[MTEpisodeArtworkView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTEpisodeArtworkView *)v3 imageView];
    [(MTEpisodeArtworkView *)v4 addSubview:v5];

    [(MTEpisodeArtworkView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeArtworkView;
  [(MTEpisodeArtworkView *)&v4 dealloc];
}

- (UIImage)artwork
{
  v2 = [(MTEpisodeArtworkView *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setArtwork:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(MTEpisodeArtworkView *)self imageView];
  [v4 setImage:v8];

  unsigned int v5 = [(MTEpisodeArtworkView *)self isCurrentPlayerItem];
  if (v5)
  {
    v6 = [(MTEpisodeArtworkView *)self _blurredArtworkForArtwork:v8];
  }
  else
  {
    v6 = 0;
  }
  objc_super v7 = [(MTEpisodeArtworkView *)self vibrantImageView];
  [v7 setImage:v6];

  if (v5) {
}
  }

- (MTVibrantImageView)vibrantImageView
{
  vibrantImageView = self->_vibrantImageView;
  if (!vibrantImageView)
  {
    objc_super v4 = (MTVibrantImageView *)objc_opt_new();
    unsigned int v5 = self->_vibrantImageView;
    self->_vibrantImageView = v4;

    v6 = [(MTEpisodeArtworkView *)self barsView];
    [(MTVibrantImageView *)self->_vibrantImageView setMaskView:v6];

    vibrantImageView = self->_vibrantImageView;
  }

  return vibrantImageView;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    self->_currentPlayerItem = a3;
    if (a3)
    {
      objc_super v4 = [(MTEpisodeArtworkView *)self dimmingView];
      [(MTEpisodeArtworkView *)self addSubview:v4];

      unsigned int v5 = [(MTEpisodeArtworkView *)self vibrantImageView];
      v6 = [v5 image];

      if (!v6)
      {
        objc_super v7 = [(MTEpisodeArtworkView *)self artwork];
        id v8 = [(MTEpisodeArtworkView *)self _blurredArtworkForArtwork:v7];
        v9 = [(MTEpisodeArtworkView *)self vibrantImageView];
        [v9 setImage:v8];
      }
      v10 = [(MTEpisodeArtworkView *)self vibrantImageView];
      [(MTEpisodeArtworkView *)self addSubview:v10];

      [(MTEpisodeArtworkView *)self startObservingPlaybackState];
    }
    else
    {
      [(UIView *)self->_dimmingView removeFromSuperview];
      [(MTVibrantImageView *)self->_vibrantImageView removeFromSuperview];
      [(MTEpisodeArtworkView *)self stopObservingPlaybackState];
    }
    [(MTEpisodeArtworkView *)self updatePlaybackState];
  }
}

- (void)startObservingPlaybackState
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"updatePlaybackState" name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)stopObservingPlaybackState
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)updatePlaybackState
{
  if ([(MTEpisodeArtworkView *)self isCurrentPlayerItem])
  {
    id v3 = +[MTPlayerController defaultInstance];
    unsigned int v4 = [v3 isTargetPlaying];

    if (v4) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  barsView = self->_barsView;

  [(MTNowPlayingIndicatorView *)barsView setPlaybackState:v5];
}

- (void)layoutSubviews
{
  [(MTEpisodeArtworkView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MTEpisodeArtworkView *)self imageView];
  [v11 setFrame:v4, v6, v8, v10];

  v12 = [(UIView *)self->_dimmingView superview];

  if (v12)
  {
    v13 = [(MTEpisodeArtworkView *)self dimmingView];
    [v13 setFrame:v4, v6, v8, v10];
  }
  v14 = [(MTVibrantImageView *)self->_vibrantImageView superview];

  if (v14)
  {
    -[MTVibrantImageView setFrame:](self->_vibrantImageView, "setFrame:", v4, v6, v8, v10);
    -[MTEpisodeArtworkView _updateBarMetricsForArtworkSize:](self, "_updateBarMetricsForArtworkSize:", v8, v10);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(MTEpisodeArtworkView *)self imageView];
  [v5 sizeThatFits:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = (UIImageView *)objc_opt_new();
    double v5 = self->_imageView;
    self->_imageView = v4;

    id v6 = +[UIColor artworkBorderColor];
    id v7 = [v6 CGColor];
    double v8 = [(UIImageView *)self->_imageView layer];
    [v8 setBorderColor:v7];

    double v9 = +[UIScreen mainScreen];
    [v9 scale];
    double v11 = v10;

    v12 = [(UIImageView *)self->_imageView layer];
    [v12 setBorderWidth:1.0 / v11];

    imageView = self->_imageView;
  }

  return imageView;
}

- (UIView)dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    double v4 = (UIView *)objc_opt_new();
    double v5 = self->_dimmingView;
    self->_dimmingView = v4;

    id v6 = +[UIColor colorWithWhite:0.0 alpha:0.32];
    [(UIView *)self->_dimmingView setBackgroundColor:v6];

    dimmingView = self->_dimmingView;
  }

  return dimmingView;
}

- (MTNowPlayingIndicatorView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    double v4 = (MTNowPlayingIndicatorView *)objc_opt_new();
    double v5 = self->_barsView;
    self->_barsView = v4;

    if (isTV()) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 4;
    }
    [(MTNowPlayingIndicatorView *)self->_barsView setNumberOfLevels:v6];
    [(MTNowPlayingIndicatorView *)self->_barsView setBounceStyle:1];
    [(MTNowPlayingIndicatorView *)self->_barsView setLevelWidth:3.5];
    [(MTNowPlayingIndicatorView *)self->_barsView setInterLevelSpacing:2.0];
    [(MTNowPlayingIndicatorView *)self->_barsView setLevelCornerRadius:1.0];
    barsView = self->_barsView;
  }

  return barsView;
}

- (id)_blurredArtworkForArtwork:(id)a3
{
  id v3 = a3;
  double v4 = +[_UIBackdropViewSettings settingsForPrivateStyle:2020];
  double v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  [v4 setBlurRadius:1.0 / v7 * 8.0];
  double v8 = [v3 _applyBackdropViewSettings:v4 includeTints:1 includeBlur:1];

  return v8;
}

- (void)_updateBarMetricsForArtworkSize:(CGSize)a3
{
  if (self->_barsView)
  {
    int v4 = isTV();
    int v5 = isTV();
    isTV();
    isTV();
    [(MTNowPlayingIndicatorView *)self->_barsView numberOfLevels];
    isTV();
    IMRoundToPixel();
    double v24 = v6;
    IMRoundToPixel();
    if (v7 < 1.0) {
      double v7 = 1.0;
    }
    double v23 = v7;
    IMRoundToPixel();
    if (v8 < 2.0) {
      double v8 = 2.0;
    }
    double v22 = v8;
    IMRoundToPixel();
    if (v9 < 1.0) {
      double v9 = 1.0;
    }
    double v21 = v9;
    double v10 = 0.0;
    if ((isTV() & 1) == 0)
    {
      if (v5) {
        double v10 = 0.0;
      }
      else {
        double v10 = 4.0;
      }
      if (v4) {
        double v11 = 0.0;
      }
      else {
        double v11 = 1.0;
      }
      IMRoundToPixel();
      if (v12 < v11) {
        double v12 = v11;
      }
      if (v12 < v10) {
        double v10 = v12;
      }
    }
    IMRoundToPixel();
    double v14 = v13;
    IMRoundToPixel();
    double v16 = v15;
    IMRoundToPixel();
    double v18 = v17;
    IMRoundToPixel();
    -[MTNowPlayingIndicatorView setFrame:](self->_barsView, "setFrame:", v18, v19, v14, v16);
    [(MTNowPlayingIndicatorView *)self->_barsView setMaximumLevelHeight:v24];
    [(MTNowPlayingIndicatorView *)self->_barsView setMinimumLevelHeight:v23];
    [(MTNowPlayingIndicatorView *)self->_barsView setLevelWidth:v22];
    [(MTNowPlayingIndicatorView *)self->_barsView setInterLevelSpacing:v21];
    barsView = self->_barsView;
    [(MTNowPlayingIndicatorView *)barsView setLevelCornerRadius:v10];
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (void)setImageView:(id)a3
{
}

- (void)setDimmingView:(id)a3
{
}

- (void)setVibrantImageView:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_vibrantImageView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end