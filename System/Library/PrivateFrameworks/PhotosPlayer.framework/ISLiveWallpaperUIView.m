@interface ISLiveWallpaperUIView
- (BOOL)touching;
- (ISLiveWallpaperUIView)initWithCoder:(id)a3;
- (ISLiveWallpaperUIView)initWithFrame:(CGRect)a3;
- (NSTimer)updateTimer;
- (UIGestureRecognizer)playbackGestureRecognizer;
- (double)force;
- (void)_ISLiveWallpaperUIViewCommonInitialization;
- (void)_handlePlaybackRecognizer:(id)a3;
- (void)_handleUpdateTimer;
- (void)_updatePlayer;
- (void)dealloc;
- (void)setForce:(double)a3;
- (void)setTouching:(BOOL)a3;
- (void)setUpdateTimer:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ISLiveWallpaperUIView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_playbackGestureRecognizer, 0);
}

- (void)setUpdateTimer:(id)a3
{
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (double)force
{
  return self->_force;
}

- (BOOL)touching
{
  return self->_touching;
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  return self->_playbackGestureRecognizer;
}

- (void)dealloc
{
  [(NSTimer *)self->_updateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ISLiveWallpaperUIView;
  [(ISLiveWallpaperUIView *)&v3 dealloc];
}

- (void)_updatePlayer
{
  BOOL v3 = [(ISLiveWallpaperUIView *)self touching];
  [(ISLiveWallpaperUIView *)self force];
  uint64_t v5 = v4;
  v6 = [(ISBasePlayerUIView *)self player];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__ISLiveWallpaperUIView__updatePlayer__block_invoke;
  v8[3] = &unk_1E6BEC858;
  id v9 = v6;
  BOOL v11 = v3;
  uint64_t v10 = v5;
  id v7 = v6;
  [v7 performChanges:v8];
}

uint64_t __38__ISLiveWallpaperUIView__updatePlayer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTouching:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);

  return [v2 setForce:v3];
}

- (void)_handlePlaybackRecognizer:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;

  [(ISLiveWallpaperUIView *)self setTouching:v4];
}

- (void)_handleUpdateTimer
{
  [(ISLiveWallpaperUIView *)self force];
  double v4 = v3;
  BOOL v5 = [(ISLiveWallpaperUIView *)self touching];
  double v6 = v4 + 0.25;
  if (!v5) {
    double v6 = 0.0;
  }
  double v7 = fmax(v6, 0.0);
  if (v7 > 400.0) {
    double v7 = 400.0;
  }

  [(ISLiveWallpaperUIView *)self setForce:v7];
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    [(ISLiveWallpaperUIView *)self _updatePlayer];
  }
}

- (void)setTouching:(BOOL)a3
{
  if (self->_touching != a3)
  {
    self->_touching = a3;
    [(ISLiveWallpaperUIView *)self _updatePlayer];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ISLiveWallpaperUIView;
  [(ISLiveWallpaperUIView *)&v14 willMoveToWindow:v4];
  if (v4)
  {
    objc_initWeak(&location, self);
    BOOL v5 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __42__ISLiveWallpaperUIView_willMoveToWindow___block_invoke;
    BOOL v11 = &unk_1E6BEC830;
    objc_copyWeak(&v12, &location);
    double v6 = [v5 scheduledTimerWithTimeInterval:1 repeats:&v8 block:0.06];
    -[ISLiveWallpaperUIView setUpdateTimer:](self, "setUpdateTimer:", v6, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    double v7 = [(ISLiveWallpaperUIView *)self updateTimer];
    [v7 invalidate];
  }
}

void __42__ISLiveWallpaperUIView_willMoveToWindow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleUpdateTimer];
}

- (void)_ISLiveWallpaperUIViewCommonInitialization
{
  [(ISBasePlayerUIView *)self setContentMode:2];
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.livewallpaperplayer", 0);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F16608]) initWithDispatchQueue:v7];
  id v4 = [(ISBasePlayer *)[ISLiveWallpaperPlayer alloc] initWithVideoPlayer:v3];
  [(ISBasePlayerUIView *)self setPlayer:v4];
  BOOL v5 = [[ISTouchingGestureRecognizer alloc] initWithTarget:self action:sel__handlePlaybackRecognizer_];
  [(ISTouchingGestureRecognizer *)v5 setMinimumTouchDuration:0.075];
  [(ISTouchingGestureRecognizer *)v5 setCancelsTouchesInView:0];
  [(ISLiveWallpaperUIView *)self addGestureRecognizer:v5];
  playbackGestureRecognizer = self->_playbackGestureRecognizer;
  self->_playbackGestureRecognizer = &v5->super;
}

- (ISLiveWallpaperUIView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISLiveWallpaperUIView;
  double v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(ISLiveWallpaperUIView *)v3 _ISLiveWallpaperUIViewCommonInitialization];
  }
  return v4;
}

- (ISLiveWallpaperUIView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISLiveWallpaperUIView;
  double v3 = [(ISBasePlayerUIView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(ISLiveWallpaperUIView *)v3 _ISLiveWallpaperUIViewCommonInitialization];
  }
  return v4;
}

@end