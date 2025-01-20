@interface PBUIRemoteIrisWallpaperPlayer
- (BOOL)isTouchActive;
- (NSURL)videoFileURL;
- (PBUIIrisWallpaperPlayerDelegate)irisDelegate;
- (PBUIRemoteIrisWallpaperPlayer)init;
- (PBUIRemoteIrisWallpaperPlayerDelegate)delegate;
- (UIGestureRecognizer)irisGestureRecognizer;
- (double)stillTimeInVideo;
- (int64_t)irisPlaybackState;
- (void)_handleWallpaperGestureBegan;
- (void)_handleWallpaperGestureEnded;
- (void)_setIrisPlaybackState:(int64_t)a3;
- (void)_setTouchActive:(BOOL)a3;
- (void)_wallpaperGestureChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIrisDelegate:(id)a3;
@end

@implementation PBUIRemoteIrisWallpaperPlayer

- (PBUIRemoteIrisWallpaperPlayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIRemoteIrisWallpaperPlayer;
  v2 = [(PBUIRemoteIrisWallpaperPlayer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v2 action:sel__wallpaperGestureChanged_];
    gestureRecognizer = v2->_gestureRecognizer;
    v2->_gestureRecognizer = (UILongPressGestureRecognizer *)v3;

    [(UILongPressGestureRecognizer *)v2->_gestureRecognizer setMinimumPressDuration:0.15];
    [(UILongPressGestureRecognizer *)v2->_gestureRecognizer setCancelsTouchesInView:0];
  }
  return v2;
}

- (void)_setIrisPlaybackState:(int64_t)a3
{
  if (self->_irisPlaybackState != a3)
  {
    self->_irisPlaybackState = a3;
    id v4 = [(PBUIRemoteIrisWallpaperPlayer *)self irisDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 irisWallpaperPlayerPlaybackStateDidChange:self];
    }
  }
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return (UIGestureRecognizer *)self->_gestureRecognizer;
}

- (double)stillTimeInVideo
{
  return 0.0;
}

- (NSURL)videoFileURL
{
  return 0;
}

- (void)_wallpaperGestureChanged:(id)a3
{
  if (self->_gestureRecognizer == a3)
  {
    uint64_t v4 = [a3 state];
    if ((unint64_t)(v4 - 3) >= 3)
    {
      if (v4 == 2)
      {
        [(PBUIRemoteIrisWallpaperPlayer *)self _handleWallpaperGestureChanged];
      }
      else if (v4 == 1)
      {
        [(PBUIRemoteIrisWallpaperPlayer *)self _handleWallpaperGestureBegan];
      }
    }
    else
    {
      [(PBUIRemoteIrisWallpaperPlayer *)self _handleWallpaperGestureEnded];
    }
  }
}

- (void)_handleWallpaperGestureBegan
{
}

- (void)_handleWallpaperGestureEnded
{
}

- (void)_setTouchActive:(BOOL)a3
{
  if (self->_touchActive != a3)
  {
    self->_touchActive = a3;
    id v5 = [(PBUIRemoteIrisWallpaperPlayer *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 remoteIrisWallpaperPlayer:self touchActiveChanged:self->_touchActive];
    }
    uint64_t v4 = [(PBUIRemoteIrisWallpaperPlayer *)self irisDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 irisWallpaperPlayerIsInteractingDidChange:self];
    }
  }
}

- (PBUIIrisWallpaperPlayerDelegate)irisDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_irisDelegate);
  return (PBUIIrisWallpaperPlayerDelegate *)WeakRetained;
}

- (void)setIrisDelegate:(id)a3
{
}

- (int64_t)irisPlaybackState
{
  return self->_irisPlaybackState;
}

- (PBUIRemoteIrisWallpaperPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIRemoteIrisWallpaperPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isTouchActive
{
  return self->_touchActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_irisDelegate);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end