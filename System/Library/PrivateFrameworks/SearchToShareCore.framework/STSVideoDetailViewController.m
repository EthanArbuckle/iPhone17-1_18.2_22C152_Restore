@interface STSVideoDetailViewController
- (void)setContentURL:(id)a3;
- (void)viewDidLoad;
- (void)youTubePlayer:(id)a3 didChangeToState:(int64_t)a4;
@end

@implementation STSVideoDetailViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)STSVideoDetailViewController;
  [(STSVideoDetailViewController *)&v3 viewDidLoad];
  [(STSResultDetailViewController *)self setAllowCustomContentViewInteraction:1];
}

- (void)setContentURL:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSVideoDetailViewController;
  id v5 = [(STSResultDetailViewController *)&v14 contentURL];

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)STSVideoDetailViewController;
    [(STSResultDetailViewController *)&v13 setContentURL:v4];
    id v6 = objc_alloc(MEMORY[0x263F10410]);
    v7 = (LPYouTubePlayerView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    playerView = self->_playerView;
    self->_playerView = v7;

    [(LPYouTubePlayerView *)self->_playerView setDelegate:self];
    v9 = self->_playerView;
    v10 = [MEMORY[0x263F825C8] blackColor];
    [(LPYouTubePlayerView *)v9 setBackgroundColor:v10];

    [(STSResultDetailViewController *)self updateCustomContentWithView:self->_playerView];
    v11 = self->_playerView;
    v12 = [(STSResultDetailViewController *)self contentURL];
    [(LPYouTubePlayerView *)v11 loadVideoWithURL:v12];
  }
}

- (void)youTubePlayer:(id)a3 didChangeToState:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) <= 4) {
    [(STSResultDetailViewController *)self updateWithThumbnail:0 orThumbnailInfo:0];
  }
}

- (void).cxx_destruct
{
}

@end