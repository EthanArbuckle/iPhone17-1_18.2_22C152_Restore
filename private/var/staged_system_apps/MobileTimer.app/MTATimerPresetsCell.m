@interface MTATimerPresetsCell
- (MTAPresetsViewController)presetsController;
- (MTATimerPresetsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)localSetup;
- (void)setDelegate:(id)a3;
- (void)setPresetsController:(id)a3;
- (void)setupLayoutConstraints;
@end

@implementation MTATimerPresetsCell

- (MTATimerPresetsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTATimerPresetsCell;
  v4 = [(MTATimerPresetsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTATimerPresetsCell *)v4 localSetup];
    [(MTATimerPresetsCell *)v5 setupLayoutConstraints];
  }
  return v5;
}

- (void)localSetup
{
  v3 = [[MTAPresetsViewController alloc] initWithDelegate:0];
  [(MTATimerPresetsCell *)self setPresetsController:v3];

  v4 = [(MTATimerPresetsCell *)self presetsController];
  v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(MTATimerPresetsCell *)self contentView];
  v6 = [(MTATimerPresetsCell *)self presetsController];
  objc_super v7 = [v6 view];
  [v8 addSubview:v7];
}

- (void)setupLayoutConstraints
{
  id v25 = (id)objc_opt_new();
  v3 = [(MTATimerPresetsCell *)self presetsController];
  v4 = [v3 view];

  v5 = [v4 leadingAnchor];
  v6 = [(MTATimerPresetsCell *)self contentView];
  objc_super v7 = [v6 safeAreaLayoutGuide];
  id v8 = [v7 leadingAnchor];
  v9 = [v5 constraintEqualToAnchor:v8];
  [v25 addObject:v9];

  v10 = [v4 trailingAnchor];
  v11 = [(MTATimerPresetsCell *)self contentView];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 trailingAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  [v25 addObject:v14];

  v15 = [v4 topAnchor];
  v16 = [(MTATimerPresetsCell *)self contentView];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v17 topAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  [v25 addObject:v19];

  v20 = [v4 bottomAnchor];
  v21 = [(MTATimerPresetsCell *)self contentView];
  v22 = [v21 safeAreaLayoutGuide];
  v23 = [v22 bottomAnchor];
  v24 = [v20 constraintEqualToAnchor:v23];
  [v25 addObject:v24];

  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATimerPresetsCell *)self presetsController];
  [v5 setDelegate:v4];
}

- (MTAPresetsViewController)presetsController
{
  return self->_presetsController;
}

- (void)setPresetsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end