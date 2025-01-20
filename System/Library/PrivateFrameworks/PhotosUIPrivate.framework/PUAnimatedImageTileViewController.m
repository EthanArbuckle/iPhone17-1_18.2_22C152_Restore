@interface PUAnimatedImageTileViewController
- (id)loadView;
- (void)_invalidateAnimatedImage;
- (void)_invalidatePlaybackState;
- (void)_updateAnimatedImageIfNeeded;
- (void)_updatePlaybackStateIfNeeded;
- (void)assetViewModelDidChange:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUAnimatedImageTileViewController

- (void).cxx_destruct
{
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUAnimatedImageTileViewController;
  id v7 = a3;
  [(PUImageTileViewController *)&v13 viewModel:v7 didChange:v6];
  id v8 = [(PUImageTileViewController *)self assetViewModel];

  if (v8 == v7)
  {
    if ([v6 focusValueChanged]) {
      [(PUAnimatedImageTileViewController *)self _invalidatePlaybackState];
    }
    uint64_t v9 = [v6 animatedImageChange];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v6 animatedImageChange];
      int v12 = [v11 animatedImageDidChange];

      if (v12)
      {
        [(PUAnimatedImageTileViewController *)self _invalidatePlaybackState];
        [(PUAnimatedImageTileViewController *)self _invalidateAnimatedImage];
      }
    }
    [(PUAnimatedImageTileViewController *)self _updateAnimatedImageIfNeeded];
    [(PUAnimatedImageTileViewController *)self _updatePlaybackStateIfNeeded];
  }
}

- (void)_updateAnimatedImageIfNeeded
{
  if (!self->_isValid.animatedImage)
  {
    self->_isValid.animatedImage = 1;
    v3 = [(PUImageTileViewController *)self assetViewModel];
    v4 = [v3 animatedImagePlayer];
    id v6 = [v4 animatedImage];

    v5 = objc_msgSend(v6, "pf_animatedImage");
    [(ISAnimatedImageView *)self->_animatedImageView setImage:v5];
  }
}

- (void)_invalidateAnimatedImage
{
  self->_isValid.animatedImage = 0;
}

- (void)_updatePlaybackStateIfNeeded
{
  if (!self->_isValid.playbackState)
  {
    self->_isValid.playbackState = 1;
    v3 = [(PUImageTileViewController *)self assetViewModel];

    if (v3)
    {
      v4 = [(PUImageTileViewController *)self assetViewModel];
      [v4 focusValue];
      double v6 = v5;

      double v7 = fabs(v6);
      switch(self->_interactionState)
      {
        case 0:
          id v8 = +[PUOneUpSettings sharedInstance];
          [v8 playGIFEnterThreshold];
          double v10 = v9;

          if (v7 >= v10) {
            goto LABEL_11;
          }
          int64_t v11 = 1;
          uint64_t v12 = 1;
          goto LABEL_17;
        case 1:
          v19 = +[PUOneUpSettings sharedInstance];
          [v19 playGIFSettledThreshold];
          double v21 = v20;

          if (v7 < v21) {
            goto LABEL_13;
          }
          if (v7 < 1.0)
          {
LABEL_15:
            uint64_t v12 = 1;
            break;
          }
LABEL_16:
          int64_t v11 = 0;
          uint64_t v12 = 0;
          goto LABEL_17;
        case 2:
          objc_super v13 = +[PUOneUpSettings sharedInstance];
          [v13 playGIFMoveOutThreshold];
          double v15 = v14;

          if (v7 <= v15) {
            goto LABEL_15;
          }
          uint64_t v12 = 0;
          int64_t v11 = 3;
          goto LABEL_17;
        case 3:
          if (v7 >= 1.0) {
            goto LABEL_16;
          }
          v16 = +[PUOneUpSettings sharedInstance];
          [v16 playGIFSettledThreshold];
          double v18 = v17;

          if (v7 < v18)
          {
LABEL_13:
            uint64_t v12 = 1;
            int64_t v11 = 2;
LABEL_17:
            self->_interactionState = v11;
          }
          else
          {
LABEL_11:
            uint64_t v12 = 0;
          }
          break;
        default:
          goto LABEL_11;
      }
    }
    else
    {
      uint64_t v12 = 0;
      self->_interactionState = 0;
    }
    animatedImageView = self->_animatedImageView;
    [(ISAnimatedImageView *)animatedImageView setPlaying:v12];
  }
}

- (void)_invalidatePlaybackState
{
  self->_isValid.playbackState = 0;
}

- (void)assetViewModelDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUAnimatedImageTileViewController;
  [(PUImageTileViewController *)&v4 assetViewModelDidChange:a3];
  [(PUAnimatedImageTileViewController *)self _invalidatePlaybackState];
  [(PUAnimatedImageTileViewController *)self _invalidateAnimatedImage];
  [(PUAnimatedImageTileViewController *)self _updateAnimatedImageIfNeeded];
  [(PUAnimatedImageTileViewController *)self _updatePlaybackStateIfNeeded];
}

- (id)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)PUAnimatedImageTileViewController;
  v3 = [(PUImageTileViewController *)&v16 loadView];
  objc_super v4 = (ISAnimatedImageView *)[objc_alloc(MEMORY[0x1E4F8EB90]) initWithAnimatedImage:0];
  animatedImageView = self->_animatedImageView;
  self->_animatedImageView = v4;

  [(ISAnimatedImageView *)self->_animatedImageView setContentMode:2];
  double v6 = +[PUOneUpSettings sharedInstance];
  int v7 = [v6 showGIFLoadingDelays];

  id v8 = self->_animatedImageView;
  if (v7)
  {
    double v9 = [MEMORY[0x1E4FB1618] blueColor];
    [(ISAnimatedImageView *)v8 setBackgroundColor:v9];
  }
  else
  {
    [(ISAnimatedImageView *)self->_animatedImageView setPlaceholderImageView:v3];
  }
  double v10 = +[PUOneUpSettings sharedInstance];
  int v11 = [v10 useDebuggingColors];

  if (v11)
  {
    uint64_t v12 = [(ISAnimatedImageView *)self->_animatedImageView layer];
    id v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.258823544 green:0.956862748 blue:0.56078434 alpha:1.0];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    [v12 setBorderWidth:2.0];
  }
  double v14 = self->_animatedImageView;

  return v14;
}

@end