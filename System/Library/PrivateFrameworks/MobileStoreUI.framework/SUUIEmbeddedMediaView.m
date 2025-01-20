@interface SUUIEmbeddedMediaView
- (BOOL)showsThumbnailReflection;
- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4;
- (NSString)mediaURLString;
- (SUUIEmbeddedMediaViewDelegate)delegate;
- (UIImage)thumbnailImage;
- (id)_newMoviePlayerControllerWithURL:(id)a3;
- (id)_thumbnailView;
- (int64_t)mediaType;
- (int64_t)playbackState;
- (int64_t)thumbnailContentMode;
- (void)_didExitFullscreen:(id)a3;
- (void)_didFinishPlayback:(id)a3;
- (void)_sendPlaybackStateChanged;
- (void)_tearDownMoviePlayer;
- (void)beginInlinePlaybackWithURL:(id)a3;
- (void)beginPlaybackAnimated:(BOOL)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)endPlaybackAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMediaURLString:(id)a3;
- (void)setShowsThumbnailReflection:(BOOL)a3;
- (void)setThumbnailContentMode:(int64_t)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation SUUIEmbeddedMediaView

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v4), 0);
  v5 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v5), 0);
  v6 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v6), 0);

  v7.receiver = self;
  v7.super_class = (Class)SUUIEmbeddedMediaView;
  [(SUUIEmbeddedMediaView *)&v7 dealloc];
}

- (void)beginInlinePlaybackWithURL:(id)a3
{
  id v4 = a3;
  [(SUUIEmbeddedMediaView *)self _tearDownMoviePlayer];
  v5 = [(SUUIEmbeddedMediaView *)self _newMoviePlayerControllerWithURL:v4];

  moviePlayer = self->_moviePlayer;
  self->_moviePlayer = v5;

  self->_usingInlinePlayback = 1;
  id v7 = [(MPMoviePlayerController *)self->_moviePlayer view];
  [(SUUIEmbeddedMediaView *)self bounds];
  objc_msgSend(v7, "setFrame:");
  [(SUUIEmbeddedMediaView *)self addSubview:v7];
}

- (void)beginPlaybackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_mediaURLString)
  {
    moviePlayer = self->_moviePlayer;
    if (moviePlayer)
    {
      [(MPMoviePlayerController *)moviePlayer play];
    }
    else
    {
      v6 = objc_msgSend(NSURL, "URLWithString:");
      id v7 = [(SUUIEmbeddedMediaView *)self _newMoviePlayerControllerWithURL:v6];
      v8 = self->_moviePlayer;
      self->_moviePlayer = v7;

      self->_usingInlinePlayback = 0;
      id v9 = [(MPMoviePlayerController *)self->_moviePlayer view];
      [(SUUIEmbeddedMediaView *)self bounds];
      objc_msgSend(v9, "setFrame:");
      [(SUUIEmbeddedMediaView *)self addSubview:v9];
      [(MPMoviePlayerController *)self->_moviePlayer setFullscreen:1 animated:v3];
    }
  }
}

- (void)endPlaybackAnimated:(BOOL)a3
{
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    [(MPMoviePlayerController *)moviePlayer stop];
    if (a3)
    {
      if ([(MPMoviePlayerController *)self->_moviePlayer isFullscreen])
      {
        v6 = self->_moviePlayer;
        [(MPMoviePlayerController *)v6 setFullscreen:0 animated:1];
      }
      else
      {
        [(UIImageView *)self->_playerDecorationView setAlpha:0.0];
        [(UIImageView *)self->_thumbnailReflectionView setAlpha:0.0];
        [(UIImageView *)self->_thumbnailView setAlpha:0.0];
        id v7 = [(MPMoviePlayerController *)self->_moviePlayer view];
        [(SUUIEmbeddedMediaView *)self sendSubviewToBack:v7];

        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke;
        v9[3] = &unk_265400980;
        v9[4] = self;
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2;
        v8[3] = &unk_265400AC8;
        v8[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:v9 animations:v8 completion:0.2];
      }
    }
    else
    {
      [(SUUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    }
  }
}

uint64_t __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 504);
  return [v2 setAlpha:1.0];
}

uint64_t __45__SUUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownMoviePlayer];
}

- (int64_t)playbackState
{
  int64_t result = (int64_t)self->_moviePlayer;
  if (result)
  {
    uint64_t v3 = [(id)result playbackState];
    if ((unint64_t)(v3 - 1) > 4) {
      return 0;
    }
    else {
      return qword_2568A1F20[v3 - 1];
    }
  }
  return result;
}

- (void)setMediaType:(int64_t)a3
{
  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    [(UIImageView *)self->_playerDecorationView removeFromSuperview];
    playerDecorationView = self->_playerDecorationView;
    self->_playerDecorationView = 0;

    [(SUUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (void)setShowsThumbnailReflection:(BOOL)a3
{
  if ([(SUUIEmbeddedMediaView *)self showsThumbnailReflection] != a3)
  {
    if (a3)
    {
      id v5 = objc_alloc(MEMORY[0x263F82828]);
      v6 = [(UIImageView *)self->_thumbnailView image];
      id v7 = (UIImageView *)[v5 initWithImage:v6];
      thumbnailReflectionView = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = v7;

      [(UIImageView *)self->_thumbnailReflectionView setContentMode:[(UIImageView *)self->_thumbnailView contentMode]];
      id v9 = [(UIImageView *)self->_thumbnailReflectionView layer];
      CATransform3DMakeScale(&v11, -1.0, -1.0, 1.0);
      [v9 setTransform:&v11];

      [(SUUIEmbeddedMediaView *)self addSubview:self->_thumbnailReflectionView];
    }
    else
    {
      [(UIImageView *)self->_thumbnailReflectionView removeFromSuperview];
      v10 = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = 0;
    }
    [(SUUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (void)setThumbnailContentMode:(int64_t)a3
{
  id v5 = [(SUUIEmbeddedMediaView *)self _thumbnailView];
  [v5 setContentMode:a3];

  thumbnailReflectionView = self->_thumbnailReflectionView;
  [(UIImageView *)thumbnailReflectionView setContentMode:a3];
}

- (void)setThumbnailImage:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_thumbnailView image];

  if (v4 != v6)
  {
    id v5 = [(SUUIEmbeddedMediaView *)self _thumbnailView];
    [v5 setImage:v6];
    [(UIImageView *)self->_thumbnailReflectionView setImage:v6];
    [(SUUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (BOOL)showsThumbnailReflection
{
  return self->_thumbnailReflectionView != 0;
}

- (int64_t)thumbnailContentMode
{
  v2 = [(SUUIEmbeddedMediaView *)self _thumbnailView];
  int64_t v3 = [v2 contentMode];

  return v3;
}

- (UIImage)thumbnailImage
{
  return [(UIImageView *)self->_thumbnailView image];
}

- (void)layoutSubviews
{
  [(SUUIEmbeddedMediaView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (self->_thumbnailReflectionView) {
    double v11 = v3 * 0.5;
  }
  else {
    double v11 = v3;
  }
  int64_t v12 = [(SUUIEmbeddedMediaView *)self thumbnailContentMode];
  thumbnailReflectionView = self->_thumbnailReflectionView;
  if (thumbnailReflectionView)
  {
    v14 = [(UIImageView *)thumbnailReflectionView image];
    [v14 size];
    double v16 = v15;
    double v18 = v17;

    [(UIImageView *)self->_thumbnailReflectionView frame];
    -[SUUIEmbeddedMediaView _sizeToFitImageSize:bounds:](self, "_sizeToFitImageSize:bounds:", v16, v18, v5, v7, v9, v11);
    double v21 = v20;
    CGFloat v22 = v19;
    *(float *)&double v20 = (v9 - v20) * 0.5;
    double v23 = v9;
    double v24 = v11;
    double v25 = floorf(*(float *)&v20);
    if (v12 == 6) {
      double v26 = v10 - v19;
    }
    else {
      double v26 = 0.0;
    }
    -[UIImageView setFrame:](self->_thumbnailReflectionView, "setFrame:", v25, v26, v21, v19);
    v58.origin.x = v25;
    double v11 = v24;
    double v9 = v23;
    v58.origin.y = v26;
    v58.size.width = v21;
    v58.size.height = v22;
    double MaxY = CGRectGetMaxY(v58);
  }
  else
  {
    double MaxY = 0.0;
  }
  id v56 = [(SUUIEmbeddedMediaView *)self _thumbnailView];
  [v56 frame];
  v28 = [v56 image];
  [v28 size];
  -[SUUIEmbeddedMediaView _sizeToFitImageSize:bounds:](self, "_sizeToFitImageSize:bounds:");
  double v30 = v29;
  double v32 = v31;

  float v33 = (v9 - v30) * 0.5;
  float v34 = floorf(v33);
  double v35 = v34;
  if (v12 == 6) {
    double v36 = v10 - v32;
  }
  else {
    double v36 = MaxY;
  }
  objc_msgSend(v56, "setFrame:", v34, v36, v30, v32);
  if (self->_mediaType == 2)
  {
    playerDecorationView = self->_playerDecorationView;
    if (!playerDecorationView)
    {
      v38 = (void *)MEMORY[0x263F827E8];
      v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v38 imageNamed:@"PlayControl" inBundle:v39];

      v41 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v40];
      v42 = self->_playerDecorationView;
      self->_playerDecorationView = v41;

      [(SUUIEmbeddedMediaView *)self addSubview:self->_playerDecorationView];
      playerDecorationView = self->_playerDecorationView;
    }
    [(UIImageView *)playerDecorationView frame];
    double v44 = v43;
    double v46 = v45;
    v47 = [v56 image];

    float v48 = (v9 - v44) * 0.5;
    double v49 = floorf(v48);
    float v50 = (v30 - v44) * 0.5;
    double v51 = v35 + floorf(v50);
    if (v47) {
      double v52 = v32;
    }
    else {
      double v52 = v11;
    }
    if (v47) {
      double v49 = v51;
    }
    float v53 = (v52 - v46) * 0.5;
    -[UIImageView setFrame:](self->_playerDecorationView, "setFrame:", v49, v36 + floorf(v53), v44, v46);
    thumbnailView = self->_thumbnailView;
    v55 = [MEMORY[0x263F825C8] blackColor];
    [(UIImageView *)thumbnailView setBackgroundColor:v55];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (self->_mediaType != 2) {
    [(UIImageView *)self->_thumbnailView setBackgroundColor:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUIEmbeddedMediaView;
  [(SUUIEmbeddedMediaView *)&v5 setBackgroundColor:v4];
}

- (void)didMoveToWindow
{
  double v3 = [(SUUIEmbeddedMediaView *)self window];

  if (!v3)
  {
    [(SUUIEmbeddedMediaView *)self endPlaybackAnimated:0];
  }
}

- (void)_didExitFullscreen:(id)a3
{
  if (!self->_usingInlinePlayback)
  {
    [(SUUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    [(SUUIEmbeddedMediaView *)self _sendPlaybackStateChanged];
  }
}

- (void)_didFinishPlayback:(id)a3
{
  if ([(MPMoviePlayerController *)self->_moviePlayer isFullscreen])
  {
    moviePlayer = self->_moviePlayer;
    [(MPMoviePlayerController *)moviePlayer setFullscreen:0 animated:1];
  }
  else
  {
    [(SUUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    [(SUUIEmbeddedMediaView *)self _sendPlaybackStateChanged];
  }
}

- (id)_newMoviePlayerControllerWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SUUIMediaPlayerFramework();
  double v6 = objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(&cfstr_Mpmovieplayerc.isa, v5)), "initWithContentURL:", v4);

  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  double v8 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didExitFullscreen_, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v8), v6);
  double v9 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didFinishPlayback_, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v9), v6);
  double v10 = (void *)SUUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v10), v6);

  return v6;
}

- (void)_sendPlaybackStateChanged
{
  id v3 = [(SUUIEmbeddedMediaView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "mediaView:playbackStateDidChange:", self, -[SUUIEmbeddedMediaView playbackState](self, "playbackState"));
  }
}

- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v6 = a3.height;
  double v7 = a3.width;
  if ([(SUUIEmbeddedMediaView *)self thumbnailContentMode] == 1&& (v7 > width || v6 > height))
  {
    float v9 = v6 * (width / v7);
    double v6 = ceilf(v9);
    double v7 = width;
  }
  double v10 = v7;
  double v11 = v6;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_tearDownMoviePlayer
{
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    [(MPMoviePlayerController *)moviePlayer stop];
    id v4 = [(MPMoviePlayerController *)self->_moviePlayer view];
    [v4 removeFromSuperview];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v5 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v5), self->_moviePlayer);
    double v6 = (void *)SUUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(void *)SUUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v6), self->_moviePlayer);
    double v7 = self->_moviePlayer;
    self->_moviePlayer = 0;
  }
}

- (id)_thumbnailView
{
  thumbnailView = self->_thumbnailView;
  if (!thumbnailView)
  {
    id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    uint64_t v5 = self->_thumbnailView;
    self->_thumbnailView = v4;

    double v6 = self->_thumbnailView;
    double v7 = [(SUUIEmbeddedMediaView *)self backgroundColor];
    [(UIImageView *)v6 setBackgroundColor:v7];

    [(UIImageView *)self->_thumbnailView setContentMode:1];
    [(SUUIEmbeddedMediaView *)self addSubview:self->_thumbnailView];
    thumbnailView = self->_thumbnailView;
  }
  return thumbnailView;
}

- (SUUIEmbeddedMediaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIEmbeddedMediaViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_thumbnailReflectionView, 0);
  objc_storeStrong((id *)&self->_playerDecorationView, 0);
  objc_storeStrong((id *)&self->_moviePlayer, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end