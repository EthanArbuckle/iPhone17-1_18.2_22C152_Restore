@interface NCAudioPlayerControlsView
- (BOOL)contentViewLayoutConstraintsLoaded;
- (BOOL)contentViewLoaded;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCAudioPlayerControlsDelegate)delegate;
- (NCAudioPlayerControlsView)init;
- (NCAudioPlayerControlsView)initWithCoder:(id)a3;
- (NCAudioPlayerControlsView)initWithFrame:(CGRect)a3;
- (NCAudioPlayerTimelineSlider)timelineSlider;
- (UIButton)pauseButton;
- (UIButton)playButton;
- (UIView)contentView;
- (int64_t)state;
- (void)loadContentView;
- (void)loadContentViewLayoutConstraints;
- (void)pauseButtonTapped:(id)a3 withEvent:(id)a4;
- (void)playButtonTapped:(id)a3 withEvent:(id)a4;
- (void)setContentView:(id)a3;
- (void)setContentViewLayoutConstraintsLoaded:(BOOL)a3;
- (void)setContentViewLoaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPauseButton:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setTimelineSlider:(id)a3;
- (void)stopButtonTapped:(id)a3 withEvent:(id)a4;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation NCAudioPlayerControlsView

- (NCAudioPlayerControlsView)init
{
  return -[NCAudioPlayerControlsView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (NCAudioPlayerControlsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCAudioPlayerControlsView;
  v3 = -[NCAudioPlayerControlsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_contentViewLayoutConstraintsLoaded = 0;
    v3->_contentViewLoaded = 0;
    v3->_enabled = 1;
    [(NCAudioPlayerControlsView *)v3 loadContentView];
  }
  return v4;
}

- (NCAudioPlayerControlsView)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UIButton *)self->_playButton sizeToFit];
  [(NCAudioPlayerTimelineSlider *)self->_timelineSlider sizeToFit];
  [(UIButton *)self->_playButton bounds];
  double Height = CGRectGetHeight(v10);
  [(NCAudioPlayerTimelineSlider *)self->_timelineSlider bounds];
  double v6 = CGRectGetHeight(v11);
  if (Height >= v6) {
    double v7 = Height;
  }
  else {
    double v7 = v6;
  }
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id v12 = +[UIColor systemGrayColor];
    if (v3)
    {
      uint64_t v5 = +[UIColor systemBlueColor];

      id v12 = (id)v5;
    }
    double v6 = [(NCAudioPlayerControlsView *)self pauseButton];
    [v6 setEnabled:v3];

    double v7 = [(NCAudioPlayerControlsView *)self pauseButton];
    [v7 setTintColor:v12];

    double v8 = [(NCAudioPlayerControlsView *)self playButton];
    [v8 setEnabled:v3];

    v9 = [(NCAudioPlayerControlsView *)self playButton];
    [v9 setTintColor:v12];

    CGRect v10 = [(NCAudioPlayerControlsView *)self timelineSlider];
    [v10 setEnabled:v3];

    CGRect v11 = [(NCAudioPlayerControlsView *)self timelineSlider];
    [v11 setTintColor:v12];
  }
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[NCAudioPlayerControlsView transitionToState:animated:](self, "transitionToState:animated:");
  }
}

- (void)loadContentView
{
  if (!self->_contentViewLoaded)
  {
    id v3 = objc_alloc((Class)UIButton);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    double v7 = (UIButton *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    pauseButton = self->_pauseButton;
    self->_pauseButton = v7;

    [(UIButton *)self->_pauseButton setAlpha:0.0];
    v9 = +[UIColor clearColor];
    [(UIButton *)self->_pauseButton setBackgroundColor:v9];

    [(UIButton *)self->_pauseButton setHidden:1];
    CGRect v10 = +[UIColor systemBlueColor];
    [(UIButton *)self->_pauseButton setTintColor:v10];

    [(UIButton *)self->_pauseButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_pauseButton addTarget:self action:"pauseButtonTapped:withEvent:" forControlEvents:64];
    LODWORD(v11) = 1148846080;
    [(UIButton *)self->_pauseButton setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(UIButton *)self->_pauseButton setContentCompressionResistancePriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIButton *)self->_pauseButton setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UIButton *)self->_pauseButton setContentHuggingPriority:1 forAxis:v14];
    v15 = self->_pauseButton;
    v16 = +[UIImage _systemImageNamed:@"pause.fill"];
    [(UIButton *)v15 setImage:v16 forState:0];

    v17 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    playButton = self->_playButton;
    self->_playButton = v17;

    v19 = +[UIColor clearColor];
    [(UIButton *)self->_playButton setBackgroundColor:v19];

    v20 = +[UIColor systemBlueColor];
    [(UIButton *)self->_playButton setTintColor:v20];

    [(UIButton *)self->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_playButton addTarget:self action:"playButtonTapped:withEvent:" forControlEvents:64];
    LODWORD(v21) = 1148846080;
    [(UIButton *)self->_playButton setContentCompressionResistancePriority:0 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(UIButton *)self->_playButton setContentCompressionResistancePriority:1 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIButton *)self->_playButton setContentHuggingPriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIButton *)self->_playButton setContentHuggingPriority:1 forAxis:v24];
    v25 = self->_playButton;
    v26 = +[UIImage _systemImageNamed:@"play.fill"];
    [(UIButton *)v25 setImage:v26 forState:0];

    v27 = -[NCAudioPlayerTimelineSlider initWithFrame:]([NCAudioPlayerTimelineSlider alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    timelineSlider = self->_timelineSlider;
    self->_timelineSlider = v27;

    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setAllowsDetailScrubbing:0];
    v29 = +[UIColor clearColor];
    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setBackgroundColor:v29];

    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v30) = 1144750080;
    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setContentCompressionResistancePriority:0 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setContentCompressionResistancePriority:1 forAxis:v31];
    LODWORD(v32) = 1144750080;
    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setContentHuggingPriority:0 forAxis:v32];
    LODWORD(v33) = 1148846080;
    [(NCAudioPlayerTimelineSlider *)self->_timelineSlider setContentHuggingPriority:1 forAxis:v33];
    v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contentView = self->_contentView;
    self->_contentView = v34;

    [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v36) = 1148846080;
    [(UIView *)self->_contentView setContentCompressionResistancePriority:0 forAxis:v36];
    LODWORD(v37) = 1148846080;
    [(UIView *)self->_contentView setContentCompressionResistancePriority:1 forAxis:v37];
    LODWORD(v38) = 1148846080;
    [(UIView *)self->_contentView setContentHuggingPriority:0 forAxis:v38];
    LODWORD(v39) = 1148846080;
    [(UIView *)self->_contentView setContentHuggingPriority:1 forAxis:v39];
    [(UIView *)self->_contentView addSubview:self->_timelineSlider];
    [(UIView *)self->_contentView addSubview:self->_pauseButton];
    [(UIView *)self->_contentView addSubview:self->_playButton];
    [(NCAudioPlayerControlsView *)self addSubview:self->_contentView];
    [(NCAudioPlayerControlsView *)self loadContentViewLayoutConstraints];
    self->_contentViewLoaded = 1;
  }
}

- (void)loadContentViewLayoutConstraints
{
  if (!self->_contentViewLayoutConstraintsLoaded)
  {
    id v3 = [(UIView *)self->_contentView bottomAnchor];
    v4 = [(NCAudioPlayerControlsView *)self bottomAnchor];
    uint64_t v5 = [v3 constraintEqualToAnchor:v4];
    [v5 setActive:1];

    double v6 = [(UIView *)self->_contentView leadingAnchor];
    double v7 = [(NCAudioPlayerControlsView *)self leadingAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    v9 = [(UIView *)self->_contentView topAnchor];
    CGRect v10 = [(NCAudioPlayerControlsView *)self topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    double v12 = [(UIView *)self->_contentView trailingAnchor];
    double v13 = [(NCAudioPlayerControlsView *)self trailingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [(UIButton *)self->_pauseButton bottomAnchor];
    v16 = [(UIView *)self->_contentView bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(UIButton *)self->_pauseButton leadingAnchor];
    v19 = [(UIView *)self->_contentView leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    double v21 = [(UIButton *)self->_pauseButton topAnchor];
    double v22 = [(UIView *)self->_contentView topAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    double v24 = [(UIButton *)self->_pauseButton trailingAnchor];
    v25 = [(NCAudioPlayerTimelineSlider *)self->_timelineSlider leadingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UIButton *)self->_pauseButton heightAnchor];
    v28 = [v27 constraintEqualToConstant:38.0];
    [v28 setActive:1];

    v29 = [(UIButton *)self->_playButton bottomAnchor];
    double v30 = [(UIView *)self->_contentView bottomAnchor];
    double v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    double v32 = [(UIButton *)self->_playButton leadingAnchor];
    double v33 = [(UIView *)self->_contentView leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(UIButton *)self->_playButton topAnchor];
    double v36 = [(UIView *)self->_contentView topAnchor];
    double v37 = [v35 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    double v38 = [(UIButton *)self->_playButton trailingAnchor];
    double v39 = [(NCAudioPlayerTimelineSlider *)self->_timelineSlider leadingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(UIButton *)self->_playButton heightAnchor];
    v42 = [v41 constraintEqualToConstant:38.0];
    [v42 setActive:1];

    v43 = [(NCAudioPlayerTimelineSlider *)self->_timelineSlider centerYAnchor];
    v44 = [(UIView *)self->_contentView centerYAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v45 setActive:1];

    v46 = [(NCAudioPlayerTimelineSlider *)self->_timelineSlider trailingAnchor];
    v47 = [(UIView *)self->_contentView trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    self->_contentViewLayoutConstraintsLoaded = 1;
  }
}

- (void)pauseButtonTapped:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [(NCAudioPlayerControlsView *)self delegate];
  id v6 = [(NCAudioPlayerControlsView *)self pauseButton];
  if (v6 == v8)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7) {
      [v5 playbackControls:self didRequestState:2];
    }
  }
  else
  {
  }
}

- (void)playButtonTapped:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [(NCAudioPlayerControlsView *)self delegate];
  id v6 = [(NCAudioPlayerControlsView *)self playButton];
  if (v6 == v8)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7) {
      [v5 playbackControls:self didRequestState:1];
    }
  }
  else
  {
  }
}

- (void)stopButtonTapped:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [(NCAudioPlayerControlsView *)self delegate];
  id v6 = [(NCAudioPlayerControlsView *)self playButton];
  if (v6 == v8)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7) {
      [v5 playbackControls:self didRequestState:0];
    }
  }
  else
  {
  }
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, self);
  if (!a3 || a3 == 2)
  {
    id v6 = v12;
    char v7 = (id *)&v13;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000643C;
    v14[3] = &unk_10000C428;
    id v8 = &v15;
    objc_copyWeak(&v15, &location);
    v9 = objc_retainBlock(v14);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    CGRect v10 = sub_1000064D4;
  }
  else
  {
    if (a3 != 1)
    {
      double v11 = 0;
      v9 = 0;
      if (v4) {
        goto LABEL_7;
      }
LABEL_9:
      ((void (*)(void *))v9[2])(v9);
      v11[2](v11, 1);
      goto LABEL_10;
    }
    id v6 = v16;
    char v7 = (id *)&v17;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006344;
    v18[3] = &unk_10000C428;
    id v8 = &v19;
    objc_copyWeak(&v19, &location);
    v9 = objc_retainBlock(v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    CGRect v10 = sub_1000063DC;
  }
  v6[2] = v10;
  v6[3] = &unk_10000C450;
  objc_copyWeak(v7, &location);
  double v11 = objc_retainBlock(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(v8);
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  +[UIView animateWithDuration:4 delay:v9 options:v11 animations:0.300000012 completion:0.0];
LABEL_10:
  objc_destroyWeak(&location);
}

- (NCAudioPlayerControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCAudioPlayerControlsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIButton)pauseButton
{
  return self->_pauseButton;
}

- (void)setPauseButton:(id)a3
{
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (NCAudioPlayerTimelineSlider)timelineSlider
{
  return self->_timelineSlider;
}

- (void)setTimelineSlider:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)contentViewLoaded
{
  return self->_contentViewLoaded;
}

- (void)setContentViewLoaded:(BOOL)a3
{
  self->_contentViewLoaded = a3;
}

- (BOOL)contentViewLayoutConstraintsLoaded
{
  return self->_contentViewLayoutConstraintsLoaded;
}

- (void)setContentViewLayoutConstraintsLoaded:(BOOL)a3
{
  self->_contentViewLayoutConstraintsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_timelineSlider, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end