@interface WLTipsVideoView
- (WLTipsVideoView)initWithTips:(id)a3;
- (void)dealloc;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setTipsImage;
- (void)setTipsVideo;
- (void)userInterfaceStyleDidChange;
@end

@implementation WLTipsVideoView

- (WLTipsVideoView)initWithTips:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLTipsVideoView;
  v5 = -[WLTipsVideoView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tips, v4);
    [(WLTipsVideoView *)v6 setContentMode:1];
    [(WLTipsVideoView *)v6 setAutoresizingMask:18];
    [(WLTipsVideoView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WLTipsVideoView *)v6 setTipsImage];
    [(WLTipsVideoView *)v6 sizeToFit];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFA860]) initWithPlayerItem:0];
    player = v6->_player;
    v6->_player = (AVQueuePlayer *)v7;

    uint64_t v9 = [MEMORY[0x263EFA838] playerLayerWithPlayer:v6->_player];
    playerLayer = v6->_playerLayer;
    v6->_playerLayer = (AVPlayerLayer *)v9;

    v11 = v6->_playerLayer;
    [(WLTipsVideoView *)v6 bounds];
    -[AVPlayerLayer setFrame:](v11, "setFrame:");
    v12 = [(WLTipsVideoView *)v6 layer];
    [v12 addSublayer:v6->_playerLayer];

    [(WLTipsVideoView *)v6 setTipsVideo];
    v13 = self;
    v19[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    id v15 = (id)[(WLTipsVideoView *)v6 registerForTraitChanges:v14 withAction:sel_userInterfaceStyleDidChange];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v6 selector:sel_applicationWillEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLTipsVideoView;
  [(WLTipsVideoView *)&v4 dealloc];
}

- (void)setTipsImage
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  objc_super v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  v6 = (void *)MEMORY[0x263F827E8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tips);
  v8 = [WeakRetained image];
  uint64_t v9 = v8;
  if (v5 == 2) {
    [v8 dark];
  }
  else {
  v10 = [v8 light];
  }
  v11 = [v10 localFile];
  id v12 = [v6 imageNamed:v11];

  [(WLTipsVideoView *)self setImage:v12];
}

- (void)setTipsVideo
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  objc_super v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tips);
  uint64_t v7 = [WeakRetained video];
  v8 = v7;
  if (v5 == 2) {
    [v7 dark];
  }
  else {
  uint64_t v9 = [v7 light];
  }
  id v14 = [v9 localFile];

  v10 = [NSURL fileURLWithPath:v14];
  v11 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithURL:v10];
  [(AVQueuePlayer *)self->_player pause];
  [(AVPlayerLooper *)self->_playerLooper disableLooping];
  [(AVQueuePlayer *)self->_player removeAllItems];
  [(AVQueuePlayer *)self->_player insertItem:v11 afterItem:0];
  id v12 = [MEMORY[0x263EFA840] playerLooperWithPlayer:self->_player templateItem:v11];
  playerLooper = self->_playerLooper;
  self->_playerLooper = v12;

  [(AVQueuePlayer *)self->_player play];
}

- (void)userInterfaceStyleDidChange
{
  [(WLTipsVideoView *)self setTipsImage];
  [(WLTipsVideoView *)self setTipsVideo];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  playerLayer = self->_playerLayer;
  [(WLTipsVideoView *)self bounds];
  -[AVPlayerLayer setFrame:](playerLayer, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_tips);
}

@end