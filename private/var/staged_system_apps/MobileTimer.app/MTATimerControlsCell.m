@interface MTATimerControlsCell
- (BOOL)edited;
- (MTATimerControlsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTATimerControlsView)controlsView;
- (double)getCurrentDuration;
- (id)getCurrentLabel;
- (unint64_t)timerViewStyle;
- (void)localSetup;
- (void)setControlsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTimerToneName:(id)a3;
- (void)setupLayoutConstraints;
@end

@implementation MTATimerControlsCell

- (MTATimerControlsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerControlsCell;
  v4 = [(MTATimerControlsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTATimerControlsCell *)v4 localSetup];
    [(MTATimerControlsCell *)v5 setupLayoutConstraints];
  }
  return v5;
}

- (void)localSetup
{
  v3 = [[MTATimerControlsView alloc] initWithDelegate:0 style:[(MTATimerControlsCell *)self timerViewStyle] timerControlState:0];
  [(MTATimerControlsCell *)self setControlsView:v3];

  v4 = [(MTATimerControlsCell *)self controlsView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(MTATimerControlsCell *)self contentView];
  v5 = [(MTATimerControlsCell *)self controlsView];
  [v6 addSubview:v5];
}

- (void)setupLayoutConstraints
{
  id v27 = (id)objc_opt_new();
  v3 = [(MTATimerControlsCell *)self controlsView];
  v4 = [v3 leadingAnchor];
  v5 = [(MTATimerControlsCell *)self contentView];
  id v6 = [v5 safeAreaLayoutGuide];
  objc_super v7 = [v6 leadingAnchor];
  v8 = [v4 constraintEqualToAnchor:v7];
  [v27 addObject:v8];

  v9 = [(MTATimerControlsCell *)self controlsView];
  v10 = [v9 trailingAnchor];
  v11 = [(MTATimerControlsCell *)self contentView];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 trailingAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  [v27 addObject:v14];

  v15 = [(MTATimerControlsCell *)self controlsView];
  v16 = [v15 topAnchor];
  v17 = [(MTATimerControlsCell *)self contentView];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 topAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  [v27 addObject:v20];

  v21 = [(MTATimerControlsCell *)self controlsView];
  v22 = [v21 bottomAnchor];
  v23 = [(MTATimerControlsCell *)self contentView];
  v24 = [v23 safeAreaLayoutGuide];
  v25 = [v24 bottomAnchor];
  v26 = [v22 constraintEqualToAnchor:v25];
  [v27 addObject:v26];

  +[NSLayoutConstraint activateConstraints:v27];
}

- (BOOL)edited
{
  v2 = [(MTATimerControlsCell *)self controlsView];
  unsigned __int8 v3 = [v2 edited];

  return v3;
}

- (unint64_t)timerViewStyle
{
  v2 = [(MTATimerControlsCell *)self traitCollection];
  id v3 = [v2 horizontalSizeClass];

  if (v3 == (id)1) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerControlsCell *)self controlsView];
  [v5 setControlsViewDelegate:v4];
}

- (void)setDuration:(double)a3
{
  id v4 = [(MTATimerControlsCell *)self controlsView];
  [v4 setCountDownDuration:a3];
}

- (double)getCurrentDuration
{
  [(MTATimerControlsView *)self->_controlsView countDownDuration];
  return result;
}

- (id)getCurrentLabel
{
  return [(MTATimerControlsView *)self->_controlsView getCurrentLabel];
}

- (void)setTimerToneName:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerControlsCell *)self controlsView];
  [v5 setTimerToneName:v4];
}

- (MTATimerControlsView)controlsView
{
  return self->_controlsView;
}

- (void)setControlsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end