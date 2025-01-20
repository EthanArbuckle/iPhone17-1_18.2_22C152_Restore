@interface PKPlayerView
- (PKPlayerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)playItemAtURL:(id)a3;
@end

@implementation PKPlayerView

- (PKPlayerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPlayerView;
  v3 = -[PKPlayerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F16670] playerWithPlayerItem:0];
    player = v3->_player;
    v3->_player = (AVQueuePlayer *)v4;

    [(AVQueuePlayer *)v3->_player setMuted:1];
    v6 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E4F16750]);
    controller = v3->_controller;
    v3->_controller = v6;

    [(AVPlayerViewController *)v3->_controller setShowsMinimalPlaybackControlsWhenEmbeddedInline:1];
    [(AVPlayerViewController *)v3->_controller setCanPausePlaybackWhenExitingFullScreen:0];
    [(AVPlayerViewController *)v3->_controller setVideoGravity:*MEMORY[0x1E4F15AF8]];
    [(AVPlayerViewController *)v3->_controller setPlayer:v3->_player];
    v8 = [(AVPlayerViewController *)v3->_controller view];
    [(PKPlayerView *)v3 addSubview:v8];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPlayerView;
  [(PKPlayerView *)&v4 layoutSubviews];
  v3 = [(AVPlayerViewController *)self->_controller view];
  [(PKPlayerView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)playItemAtURL:(id)a3
{
  id v6 = [MEMORY[0x1E4F16620] playerItemWithURL:a3];
  objc_super v4 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:self->_player templateItem:v6];
  playerLooper = self->_playerLooper;
  self->_playerLooper = v4;

  [(AVQueuePlayer *)self->_player play];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end