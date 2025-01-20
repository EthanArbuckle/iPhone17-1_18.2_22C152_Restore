@interface NCAudioPlayerControlsViewController
- (BOOL)_canShowWhileLocked;
- (NCAudioPlayerController)playerController;
- (NCAudioPlayerControlsView)playerControlsView;
- (NCAudioPlayerControlsViewController)init;
- (NCAudioPlayerControlsViewController)initWithCoder:(id)a3;
- (NCAudioPlayerControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSURL)URL;
- (void)detailSlider:(id)a3 didChangeValue:(float)a4;
- (void)detailSliderTrackingDidBegin:(id)a3;
- (void)detailSliderTrackingDidCancel:(id)a3;
- (void)detailSliderTrackingDidEnd:(id)a3;
- (void)playbackControls:(id)a3 didRequestState:(int64_t)a4;
- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4;
- (void)playerController:(id)a3 didChangeToDuration:(double)a4;
- (void)playerController:(id)a3 didChangeToPlaybackState:(int64_t)a4;
- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4;
- (void)playerController:(id)a3 didSeekToTime:(float)a4;
- (void)setPlayerController:(id)a3;
- (void)setPlayerControlsView:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation NCAudioPlayerControlsViewController

- (NCAudioPlayerControlsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCAudioPlayerControlsViewController;
  return [(NCAudioPlayerControlsViewController *)&v3 initWithNibName:0 bundle:0];
}

- (NCAudioPlayerControlsViewController)initWithCoder:(id)a3
{
  return 0;
}

- (NCAudioPlayerControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (void)setURL:(id)a3
{
  v5 = (NSURL *)a3;
  p_URL = &self->_URL;
  if (self->_URL != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_URL, a3);
    if (*p_URL)
    {
      v7 = *p_URL;
      v8 = [[NCAudioPlayerController alloc] initWithURL:v7];
    }
    else
    {
      v8 = 0;
    }
    [(NCAudioPlayerControlsViewController *)self setPlayerController:v8];

    v5 = v9;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPlayerController:(id)a3
{
  p_playerController = &self->_playerController;
  v12 = (NCAudioPlayerController *)a3;
  if (*p_playerController != v12)
  {
    objc_storeStrong((id *)&self->_playerController, a3);
    if (*p_playerController)
    {
      [(NCAudioPlayerController *)*p_playerController setDelegate:self];
      if ((id)[(NCAudioPlayerController *)*p_playerController status] == (id)1)
      {
        v6 = [(NCAudioPlayerControlsViewController *)self playerController];
        [v6 duration];
        double v8 = v7;
        v9 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
        v10 = [v9 timelineSlider];
        [v10 setDuration:v8];

        v11 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
        [v11 setEnabled:1];
      }
    }
  }
}

- (NCAudioPlayerControlsView)playerControlsView
{
  playerControlsView = self->_playerControlsView;
  if (!playerControlsView)
  {
    v4 = -[NCAudioPlayerControlsView initWithFrame:]([NCAudioPlayerControlsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_playerControlsView;
    self->_playerControlsView = v4;

    [(NCAudioPlayerControlsView *)self->_playerControlsView setDelegate:self];
    [(NCAudioPlayerControlsView *)self->_playerControlsView setEnabled:0];
    v6 = [(NCAudioPlayerControlsView *)self->_playerControlsView timelineSlider];
    [v6 setDelegate:self];

    [(NCAudioPlayerControlsView *)self->_playerControlsView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(NCAudioPlayerControlsViewController *)self view];
    [v7 addSubview:self->_playerControlsView];
    double v8 = [(NCAudioPlayerControlsView *)self->_playerControlsView leadingAnchor];
    v9 = [v7 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(NCAudioPlayerControlsView *)self->_playerControlsView topAnchor];
    v12 = [v7 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(NCAudioPlayerControlsView *)self->_playerControlsView trailingAnchor];
    v15 = [v7 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    playerControlsView = self->_playerControlsView;
  }

  return playerControlsView;
}

- (void)detailSliderTrackingDidBegin:(id)a3
{
  id v3 = [(NCAudioPlayerControlsViewController *)self playerController];
  [v3 pause];
}

- (void)detailSliderTrackingDidEnd:(id)a3
{
  id v3 = [(NCAudioPlayerControlsViewController *)self playerController];
  [v3 play];
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  id v6 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
  v4 = [v6 timelineSlider];
  v5 = [(NCAudioPlayerControlsViewController *)self playerController];
  [v5 currentTime];
  objc_msgSend(v4, "setValue:animated:", 0);
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  id v6 = [(NCAudioPlayerControlsViewController *)self playerController];
  *(float *)&double v5 = a4;
  [v6 seekToTime:v5];
}

- (void)playerController:(id)a3 didChangeToCurrentTime:(float)a4
{
  id v7 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
  double v5 = [v7 timelineSlider];
  *(float *)&double v6 = a4;
  [v5 setValue:1 animated:v6];
}

- (void)playerController:(id)a3 didChangeToDuration:(double)a4
{
  double v6 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
  id v7 = [v6 timelineSlider];
  [v7 setDuration:a4];

  double v8 = [(NCAudioPlayerControlsViewController *)self playerController];
  id v9 = [v8 status];

  if (v9 == (id)1)
  {
    id v10 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    [v10 setEnabled:1];
  }
}

- (void)playerController:(id)a3 didChangeToPlaybackState:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2 || a4 == 1)
  {
    id v10 = v6;
    id v7 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  else
  {
    if (a4) {
      goto LABEL_7;
    }
    id v10 = v6;
    id v7 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    double v8 = v7;
    uint64_t v9 = 2;
  }
  [v7 setState:v9 animated:1];

  id v6 = v10;
LABEL_7:
}

- (void)playerController:(id)a3 didChangeToStatus:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v11 = v6;
    double v8 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    id v7 = [v8 timelineSlider];

    uint64_t v9 = [(NCAudioPlayerControlsViewController *)self playerController];
    [v9 duration];
    objc_msgSend(v7, "setDuration:");

    [v7 setValue:0 animated:0.0];
    id v10 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    [v10 setEnabled:1];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v11 = v6;
    id v7 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
    [v7 setEnabled:0];
  }

  id v6 = v11;
LABEL_6:
}

- (void)playerController:(id)a3 didSeekToTime:(float)a4
{
  id v7 = [(NCAudioPlayerControlsViewController *)self playerControlsView];
  double v5 = [v7 timelineSlider];
  *(float *)&double v6 = a4;
  [v5 setValue:1 animated:v6];
}

- (void)playbackControls:(id)a3 didRequestState:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 2)
  {
    double v6 = [(NCAudioPlayerControlsViewController *)self playerController];
    [v6 pause];
  }
  else if (a4 == 1)
  {
    double v6 = [(NCAudioPlayerControlsViewController *)self playerController];
    [v6 play];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    double v6 = [(NCAudioPlayerControlsViewController *)self playerController];
    [v6 stop];
  }

LABEL_8:
  [v7 setState:a4];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setPlayerControlsView:(id)a3
{
}

- (NCAudioPlayerController)playerController
{
  return self->_playerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playerControlsView, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end