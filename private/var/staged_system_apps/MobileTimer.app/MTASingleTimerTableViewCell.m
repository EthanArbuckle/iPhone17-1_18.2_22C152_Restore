@interface MTASingleTimerTableViewCell
- (MTASingleTimerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTATimerControlsView)controlsView;
- (void)setControlsView:(id)a3;
- (void)setupControlsView;
- (void)setupLayoutConstraints;
- (void)updateDelegate:(id)a3;
- (void)updateWithLatestDuration:(id)a3;
@end

@implementation MTASingleTimerTableViewCell

- (MTASingleTimerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTASingleTimerTableViewCell;
  v4 = [(MTASingleTimerTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTASingleTimerTableViewCell *)v4 setupControlsView];
    [(MTASingleTimerTableViewCell *)v5 setupLayoutConstraints];
  }
  return v5;
}

- (void)setupControlsView
{
  v3 = [[MTATimerControlsView alloc] initWithDelegate:0 style:2 timerControlState:0];
  [(MTASingleTimerTableViewCell *)self setControlsView:v3];

  v4 = [(MTASingleTimerTableViewCell *)self controlsView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(MTASingleTimerTableViewCell *)self contentView];
  v5 = [(MTASingleTimerTableViewCell *)self controlsView];
  [v6 addSubview:v5];
}

- (void)setupLayoutConstraints
{
  id v27 = (id)objc_opt_new();
  v3 = [(MTASingleTimerTableViewCell *)self controlsView];
  v4 = [v3 leadingAnchor];
  v5 = [(MTASingleTimerTableViewCell *)self contentView];
  id v6 = [v5 safeAreaLayoutGuide];
  objc_super v7 = [v6 leadingAnchor];
  v8 = [v4 constraintEqualToAnchor:v7];
  [v27 addObject:v8];

  v9 = [(MTASingleTimerTableViewCell *)self controlsView];
  v10 = [v9 trailingAnchor];
  v11 = [(MTASingleTimerTableViewCell *)self contentView];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 trailingAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  [v27 addObject:v14];

  v15 = [(MTASingleTimerTableViewCell *)self controlsView];
  v16 = [v15 topAnchor];
  v17 = [(MTASingleTimerTableViewCell *)self contentView];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 topAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  [v27 addObject:v20];

  v21 = [(MTASingleTimerTableViewCell *)self controlsView];
  v22 = [v21 bottomAnchor];
  v23 = [(MTASingleTimerTableViewCell *)self contentView];
  v24 = [v23 safeAreaLayoutGuide];
  v25 = [v24 bottomAnchor];
  v26 = [v22 constraintEqualToAnchor:v25];
  [v27 addObject:v26];

  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)updateWithLatestDuration:(id)a3
{
  [a3 duration];
  double v5 = v4;
  id v6 = [(MTASingleTimerTableViewCell *)self controlsView];
  [v6 setCountDownDuration:v5];
}

- (void)updateDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTASingleTimerTableViewCell *)self controlsView];
  [v5 setControlsViewDelegate:v4];
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