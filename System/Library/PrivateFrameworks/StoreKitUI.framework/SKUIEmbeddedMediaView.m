@interface SKUIEmbeddedMediaView
- (BOOL)showsThumbnailReflection;
- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4;
- (NSString)mediaURLString;
- (SKUIEmbeddedMediaViewDelegate)delegate;
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
- (void)playbackState;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMediaURLString:(id)a3;
- (void)setShowsThumbnailReflection:(BOOL)a3;
- (void)setThumbnailContentMode:(int64_t)a3;
- (void)setThumbnailImage:(id)a3;
- (void)showsThumbnailReflection;
- (void)thumbnailContentMode;
- (void)thumbnailImage;
@end

@implementation SKUIEmbeddedMediaView

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v4), 0);
  v5 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v5), 0);
  v6 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v6), 0);

  v7.receiver = self;
  v7.super_class = (Class)SKUIEmbeddedMediaView;
  [(SKUIEmbeddedMediaView *)&v7 dealloc];
}

- (void)beginInlinePlaybackWithURL:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView beginInlinePlaybackWithURL:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIEmbeddedMediaView *)self _tearDownMoviePlayer];
  v13 = [(SKUIEmbeddedMediaView *)self _newMoviePlayerControllerWithURL:v4];

  moviePlayer = self->_moviePlayer;
  self->_moviePlayer = v13;

  self->_usingInlinePlayback = 1;
  v15 = [(MPMoviePlayerController *)self->_moviePlayer view];
  [(SKUIEmbeddedMediaView *)self bounds];
  objc_msgSend(v15, "setFrame:");
  [(SKUIEmbeddedMediaView *)self addSubview:v15];
}

- (void)beginPlaybackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView beginPlaybackAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_mediaURLString)
  {
    moviePlayer = self->_moviePlayer;
    if (moviePlayer)
    {
      [(MPMoviePlayerController *)moviePlayer play];
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
      v15 = [(SKUIEmbeddedMediaView *)self _newMoviePlayerControllerWithURL:v14];
      v16 = self->_moviePlayer;
      self->_moviePlayer = v15;

      self->_usingInlinePlayback = 0;
      v17 = [(MPMoviePlayerController *)self->_moviePlayer view];
      [(SKUIEmbeddedMediaView *)self bounds];
      objc_msgSend(v17, "setFrame:");
      [(SKUIEmbeddedMediaView *)self addSubview:v17];
      [(MPMoviePlayerController *)self->_moviePlayer setFullscreen:1 animated:v3];
    }
  }
}

- (void)endPlaybackAnimated:(BOOL)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView endPlaybackAnimated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  moviePlayer = self->_moviePlayer;
  if (moviePlayer)
  {
    [(MPMoviePlayerController *)moviePlayer stop];
    if (a3)
    {
      if ([(MPMoviePlayerController *)self->_moviePlayer isFullscreen])
      {
        [(MPMoviePlayerController *)self->_moviePlayer setFullscreen:0 animated:1];
      }
      else
      {
        [(UIImageView *)self->_playerDecorationView setAlpha:0.0];
        [(UIImageView *)self->_thumbnailReflectionView setAlpha:0.0];
        [(UIImageView *)self->_thumbnailView setAlpha:0.0];
        v14 = [(MPMoviePlayerController *)self->_moviePlayer view];
        [(SKUIEmbeddedMediaView *)self sendSubviewToBack:v14];

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke;
        v16[3] = &unk_1E6422020;
        v16[4] = self;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2;
        v15[3] = &unk_1E64223D0;
        v15[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v16 animations:v15 completion:0.2];
      }
    }
    else
    {
      [(SKUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    }
  }
}

uint64_t __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 504);

  return [v2 setAlpha:1.0];
}

uint64_t __45__SKUIEmbeddedMediaView_endPlaybackAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownMoviePlayer];
}

- (int64_t)playbackState
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmbeddedMediaView *)v3 playbackState];
      }
    }
  }
  int64_t result = (int64_t)self->_moviePlayer;
  if (result)
  {
    uint64_t v12 = [(id)result playbackState];
    if ((unint64_t)(v12 - 1) > 4) {
      return 0;
    }
    else {
      return qword_1C1CCC6F8[v12 - 1];
    }
  }
  return result;
}

- (void)setMediaType:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView setMediaType:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_mediaType != a3)
  {
    self->_mediaType = a3;
    [(UIImageView *)self->_playerDecorationView removeFromSuperview];
    playerDecorationView = self->_playerDecorationView;
    self->_playerDecorationView = 0;

    [(SKUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (void)setShowsThumbnailReflection:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView setShowsThumbnailReflection:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if ([(SKUIEmbeddedMediaView *)self showsThumbnailReflection] != v3)
  {
    if (v3)
    {
      id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
      v14 = [(UIImageView *)self->_thumbnailView image];
      v15 = (UIImageView *)[v13 initWithImage:v14];
      thumbnailReflectionView = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = v15;

      [(UIImageView *)self->_thumbnailReflectionView setContentMode:[(UIImageView *)self->_thumbnailView contentMode]];
      v17 = [(UIImageView *)self->_thumbnailReflectionView layer];
      CATransform3DMakeScale(&v19, -1.0, -1.0, 1.0);
      [v17 setTransform:&v19];

      [(SKUIEmbeddedMediaView *)self addSubview:self->_thumbnailReflectionView];
    }
    else
    {
      [(UIImageView *)self->_thumbnailReflectionView removeFromSuperview];
      v18 = self->_thumbnailReflectionView;
      self->_thumbnailReflectionView = 0;
    }
    [(SKUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (void)setThumbnailContentMode:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView setThumbnailContentMode:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(SKUIEmbeddedMediaView *)self _thumbnailView];
  [v13 setContentMode:a3];

  [(UIImageView *)self->_thumbnailReflectionView setContentMode:a3];
}

- (void)setThumbnailImage:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView setThumbnailImage:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  id v13 = [(UIImageView *)self->_thumbnailView image];

  if (v13 != v4)
  {
    v14 = [(SKUIEmbeddedMediaView *)self _thumbnailView];
    [v14 setImage:v4];
    [(UIImageView *)self->_thumbnailReflectionView setImage:v4];
    [(SKUIEmbeddedMediaView *)self setNeedsLayout];
  }
}

- (BOOL)showsThumbnailReflection
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmbeddedMediaView *)v3 showsThumbnailReflection];
      }
    }
  }
  return self->_thumbnailReflectionView != 0;
}

- (int64_t)thumbnailContentMode
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmbeddedMediaView *)v3 thumbnailContentMode];
      }
    }
  }
  uint64_t v11 = [(SKUIEmbeddedMediaView *)self _thumbnailView];
  int64_t v12 = [v11 contentMode];

  return v12;
}

- (UIImage)thumbnailImage
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEmbeddedMediaView *)v3 thumbnailImage];
      }
    }
  }
  uint64_t v11 = [(UIImageView *)self->_thumbnailView image];

  return (UIImage *)v11;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEmbeddedMediaView setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_mediaType != 2) {
    [(UIImageView *)self->_thumbnailView setBackgroundColor:v4];
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIEmbeddedMediaView;
  [(SKUIEmbeddedMediaView *)&v13 setBackgroundColor:v4];
}

- (void)didMoveToWindow
{
}

- (void)_didExitFullscreen:(id)a3
{
  if (!self->_usingInlinePlayback)
  {
    [(SKUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    [(SKUIEmbeddedMediaView *)self _sendPlaybackStateChanged];
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
    [(SKUIEmbeddedMediaView *)self _tearDownMoviePlayer];
    [(SKUIEmbeddedMediaView *)self _sendPlaybackStateChanged];
  }
}

- (id)_newMoviePlayerControllerWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SKUIMediaPlayerFramework();
  uint64_t v6 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Mpmovieplayerc.isa, v5)), "initWithContentURL:", v4);

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didExitFullscreen_, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v8), v6);
  uint64_t v9 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__didFinishPlayback_, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v9), v6);
  uint64_t v10 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackStateDidChangeNotification", v10), v6);

  return v6;
}

- (void)_sendPlaybackStateChanged
{
  id v3 = [(SKUIEmbeddedMediaView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "mediaView:playbackStateDidChange:", self, -[SKUIEmbeddedMediaView playbackState](self, "playbackState"));
  }
}

- (CGSize)_sizeToFitImageSize:(CGSize)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v6 = a3.height;
  double v7 = a3.width;
  if ([(SKUIEmbeddedMediaView *)self thumbnailContentMode] == 1&& (v7 > width || v6 > height))
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

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerDidExitFullscreenNotification", v5), self->_moviePlayer);
    double v6 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v8, "removeObserver:name:object:", self, *(void *)SKUIWeakLinkedSymbolForString("MPMoviePlayerPlaybackDidFinishNotification", v6), self->_moviePlayer);
    double v7 = self->_moviePlayer;
    self->_moviePlayer = 0;
  }
}

- (id)_thumbnailView
{
  thumbnailView = self->_thumbnailView;
  if (!thumbnailView)
  {
    id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    uint64_t v5 = self->_thumbnailView;
    self->_thumbnailView = v4;

    double v6 = self->_thumbnailView;
    double v7 = [(SKUIEmbeddedMediaView *)self backgroundColor];
    [(UIImageView *)v6 setBackgroundColor:v7];

    [(UIImageView *)self->_thumbnailView setContentMode:1];
    [(SKUIEmbeddedMediaView *)self addSubview:self->_thumbnailView];
    thumbnailView = self->_thumbnailView;
  }

  return thumbnailView;
}

- (SKUIEmbeddedMediaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIEmbeddedMediaViewDelegate *)WeakRetained;
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

- (void)beginInlinePlaybackWithURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)beginPlaybackAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endPlaybackAnimated:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)playbackState
{
}

- (void)setMediaType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShowsThumbnailReflection:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setThumbnailContentMode:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setThumbnailImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)showsThumbnailReflection
{
}

- (void)thumbnailContentMode
{
}

- (void)thumbnailImage
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end