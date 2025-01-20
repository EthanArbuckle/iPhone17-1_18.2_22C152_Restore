@interface SVPlayerLayer
+ (id)defaultActionForKey:(id)a3;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (NSString)videoGravity;
- (SVImageLayer)stillImageLayer;
- (SVKeyValueObserver)readyForDisplayObserver;
- (SVKeyValueObserver)statusObserver;
- (SVLooper)looper;
- (SVNonAnimatingDelegate)nonAnimatingDelegate;
- (SVPlayerLayer)init;
- (SVPlayerLayer)initWithCoder:(id)a3;
- (SVPlayerLayer)initWithLayer:(id)a3;
- (unint64_t)currentPlaybackKind;
- (void)dealloc;
- (void)initialize;
- (void)layoutSublayers;
- (void)pause;
- (void)play;
- (void)playWithPlaybackKind:(unint64_t)a3 looping:(BOOL)a4;
- (void)setCurrentPlaybackKind:(unint64_t)a3;
- (void)setLooper:(id)a3;
- (void)setNonAnimatingDelegate:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setReadyForDisplayObserver:(id)a3;
- (void)setStatusObserver:(id)a3;
- (void)setVideoGravity:(id)a3;
@end

@implementation SVPlayerLayer

- (void)initialize
{
  self->_currentPlaybackKind = 1;
  v3 = objc_alloc_init(SVImageLayer);
  stillImageLayer = self->_stillImageLayer;
  self->_stillImageLayer = v3;

  v5 = (AVPlayerLayer *)objc_alloc_init(MEMORY[0x263EFA838]);
  playerLayer = self->_playerLayer;
  self->_playerLayer = v5;

  v7 = objc_alloc_init(SVNonAnimatingDelegate);
  nonAnimatingDelegate = self->_nonAnimatingDelegate;
  self->_nonAnimatingDelegate = v7;

  [(SVImageLayer *)self->_stillImageLayer setDelegate:self->_nonAnimatingDelegate];
  [(AVPlayerLayer *)self->_playerLayer setDelegate:self->_nonAnimatingDelegate];
  [(SVPlayerLayer *)self addSublayer:self->_playerLayer];
  v9 = self->_stillImageLayer;

  [(SVPlayerLayer *)self addSublayer:v9];
}

- (SVPlayerLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)SVPlayerLayer;
  v2 = [(SVPlayerLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SVPlayerLayer *)v2 initialize];
  }
  return v3;
}

- (SVPlayerLayer)initWithLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SVPlayerLayer;
  v3 = [(SVPlayerLayer *)&v6 initWithLayer:a3];
  v4 = v3;
  if (v3) {
    [(SVPlayerLayer *)v3 initialize];
  }
  return v4;
}

- (SVPlayerLayer)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSublayers
{
  v21.receiver = self;
  v21.super_class = (Class)SVPlayerLayer;
  [(SVPlayerLayer *)&v21 layoutSublayers];
  [(SVPlayerLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SVPlayerLayer *)self stillImageLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(SVPlayerLayer *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(SVPlayerLayer *)self playerLayer];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (AVPlayer)player
{
  return [(AVPlayerLayer *)self->_playerLayer player];
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  double v5 = [(AVPlayerLayer *)self->_playerLayer player];

  if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[SVPlayerLayer setPlayer:]();
  }
  uint64_t v6 = +[SVAudioSession sharedSessionForMode:2];
  double v7 = (void *)v6;
  if (v4 && v6)
  {
    double v8 = [(AVPlayerLayer *)self->_playerLayer player];
    [v7 removeInterestForPlayer:v8];

    [(AVPlayerLayer *)self->_playerLayer setPlayer:v4];
    [v7 addInterestForPlayer:v4 withMode:2];
  }
  objc_initWeak(&location, self);
  double v9 = [SVKeyValueObserver alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __27__SVPlayerLayer_setPlayer___block_invoke;
  v13[3] = &unk_264771258;
  objc_copyWeak(&v15, &location);
  id v10 = v4;
  id v14 = v10;
  v11 = [(SVKeyValueObserver *)v9 initWithKeyPath:@"status" ofObject:v10 withOptions:1 change:v13];
  statusObserver = self->_statusObserver;
  self->_statusObserver = v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __27__SVPlayerLayer_setPlayer___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    BOOL v3 = [*(id *)(a1 + 32) status] == 2;
    WeakRetained = v6;
    if (v3)
    {
      [v6[4] setHidden:0];
      id v4 = v6[7];
      v6[7] = 0;

      id v5 = v6[8];
      v6[8] = 0;

      WeakRetained = v6;
    }
  }
}

- (NSString)videoGravity
{
  return [(AVPlayerLayer *)self->_playerLayer videoGravity];
}

- (void)setVideoGravity:(id)a3
{
  id v4 = (void *)MEMORY[0x263F158F8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  [(AVPlayerLayer *)self->_playerLayer setVideoGravity:v5];

  uint64_t v6 = (void *)MEMORY[0x263F158F8];

  [v6 commit];
}

+ (id)defaultActionForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
}

- (void)playWithPlaybackKind:(unint64_t)a3 looping:(BOOL)a4
{
  BOOL v4 = a4;
  -[SVPlayerLayer setCurrentPlaybackKind:](self, "setCurrentPlaybackKind:");
  uint64_t v7 = [(SVPlayerLayer *)self player];
  if (v7)
  {
    double v8 = (void *)v7;
    double v9 = [(SVPlayerLayer *)self player];
    uint64_t v10 = [v9 timeControlStatus];

    if (!v10 && (a3 == 1 || !UIAccessibilityIsReduceMotionEnabled()))
    {
      if (v4)
      {
        v11 = [SVLooper alloc];
        double v12 = [(SVPlayerLayer *)self player];
        double v13 = [(SVLooper *)v11 initWithPlayer:v12];
        [(SVPlayerLayer *)self setLooper:v13];
      }
      else
      {
        [(SVPlayerLayer *)self setLooper:0];
      }
      objc_initWeak(&location, self);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke;
      v22[3] = &unk_264771208;
      objc_copyWeak(&v23, &location);
      id v14 = (void *)MEMORY[0x22A63E020](v22);
      id v15 = [(SVPlayerLayer *)self player];
      [v15 play];

      double v16 = [SVKeyValueObserver alloc];
      double v17 = [(SVPlayerLayer *)self playerLayer];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke_2;
      v20[3] = &unk_264771280;
      id v18 = v14;
      id v21 = v18;
      double v19 = [(SVKeyValueObserver *)v16 initWithKeyPath:@"readyForDisplay" ofObject:v17 withOptions:5 change:v20];
      [(SVPlayerLayer *)self setReadyForDisplayObserver:v19];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained playerLayer];
  int v2 = [v1 isReadyForDisplay];

  if (v2)
  {
    BOOL v3 = [WeakRetained stillImageLayer];
    [v3 setHidden:1];

    [WeakRetained setReadyForDisplayObserver:0];
  }
}

uint64_t __46__SVPlayerLayer_playWithPlaybackKind_looping___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)play
{
}

- (void)pause
{
  id v2 = [(SVPlayerLayer *)self player];
  [v2 pause];
}

- (void)dealloc
{
  BOOL v3 = [(SVPlayerLayer *)self player];

  if (v3)
  {
    BOOL v4 = [(SVPlayerLayer *)self player];
    [v4 pause];

    id v5 = +[SVAudioSession sharedSessionForMode:2];
    uint64_t v6 = [(SVPlayerLayer *)self player];
    [v5 removeInterestForPlayer:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)SVPlayerLayer;
  [(SVPlayerLayer *)&v7 dealloc];
}

- (SVImageLayer)stillImageLayer
{
  return (SVImageLayer *)objc_getProperty(self, a2, 32, 1);
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (SVLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
}

- (SVKeyValueObserver)readyForDisplayObserver
{
  return self->_readyForDisplayObserver;
}

- (void)setReadyForDisplayObserver:(id)a3
{
}

- (SVKeyValueObserver)statusObserver
{
  return self->_statusObserver;
}

- (void)setStatusObserver:(id)a3
{
}

- (SVNonAnimatingDelegate)nonAnimatingDelegate
{
  return self->_nonAnimatingDelegate;
}

- (void)setNonAnimatingDelegate:(id)a3
{
}

- (unint64_t)currentPlaybackKind
{
  return self->_currentPlaybackKind;
}

- (void)setCurrentPlaybackKind:(unint64_t)a3
{
  self->_currentPlaybackKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAnimatingDelegate, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_readyForDisplayObserver, 0);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);

  objc_storeStrong((id *)&self->_stillImageLayer, 0);
}

- (void)setPlayer:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Tried to re-set an already created AVPlayer!"];
  int v1 = 136315906;
  id v2 = "-[SVPlayerLayer setPlayer:]";
  __int16 v3 = 2080;
  BOOL v4 = "SVPlayerLayer.m";
  __int16 v5 = 1024;
  int v6 = 92;
  __int16 v7 = 2114;
  double v8 = v0;
  _os_log_error_impl(&dword_225C7F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end