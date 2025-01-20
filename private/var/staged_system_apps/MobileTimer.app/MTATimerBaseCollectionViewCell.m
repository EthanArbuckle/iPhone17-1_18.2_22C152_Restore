@interface MTATimerBaseCollectionViewCell
+ (double)cellHeight;
- (BOOL)_disableRasterizeInAnimations;
- (MTATimerBaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTATimerCollectionViewCellDelegate)delegate;
- (MTATimerControlsView)timerControlsView;
- (unint64_t)defaultViewStyle;
- (void)setDelegate:(id)a3;
- (void)setTimerControlsView:(id)a3;
- (void)setupConstraints;
@end

@implementation MTATimerBaseCollectionViewCell

- (MTATimerBaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MTATimerBaseCollectionViewCell;
  v3 = -[MTATimerBaseCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[MTATimerControlsView alloc] initWithDelegate:v3 style:[(MTATimerBaseCollectionViewCell *)v3 defaultViewStyle] timerControlState:1];
    [(MTATimerBaseCollectionViewCell *)v3 setTimerControlsView:v4];

    v5 = [(MTATimerBaseCollectionViewCell *)v3 timerControlsView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(MTATimerBaseCollectionViewCell *)v3 contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [(MTATimerBaseCollectionViewCell *)v3 timerControlsView];
    [v15 setFrame:v8, v10, v12, v14];

    v16 = [(MTATimerBaseCollectionViewCell *)v3 contentView];
    [v16 addSubview:v3->_timerControlsView];

    v17 = +[UIColor mtui_foregroundColor];
    v18 = [(MTATimerBaseCollectionViewCell *)v3 contentView];
    [v18 setBackgroundColor:v17];

    v19 = [(MTATimerBaseCollectionViewCell *)v3 contentView];
    v20 = [v19 layer];
    [v20 setCornerRadius:16.0];

    v21 = [(MTATimerBaseCollectionViewCell *)v3 contentView];
    v22 = [v21 layer];
    [v22 setMasksToBounds:1];

    v23 = [(MTATimerBaseCollectionViewCell *)v3 timerControlsView];
    v24 = +[UIColor mtui_foregroundColor];
    [v23 applyBackgroundColor:v24];

    [(MTATimerBaseCollectionViewCell *)v3 setupConstraints];
  }
  return v3;
}

- (void)setupConstraints
{
  id v23 = (id)objc_opt_new();
  v3 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  v4 = [v3 leadingAnchor];
  v5 = [(MTATimerBaseCollectionViewCell *)self contentView];
  v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  [v23 addObject:v7];

  double v8 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  double v9 = [v8 trailingAnchor];
  double v10 = [(MTATimerBaseCollectionViewCell *)self contentView];
  double v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  [v23 addObject:v12];

  double v13 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  double v14 = [v13 topAnchor];
  v15 = [(MTATimerBaseCollectionViewCell *)self contentView];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v23 addObject:v17];

  v18 = [(MTATimerBaseCollectionViewCell *)self timerControlsView];
  v19 = [v18 bottomAnchor];
  v20 = [(MTATimerBaseCollectionViewCell *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v23];
}

+ (double)cellHeight
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 lineHeight];
  double v4 = v3 * 3.0 + 7.0 + 115.0;
  [v2 _scaledValueForValue:8.0];
  double v6 = v4 + v5 + 31.0 + 53.0 + 100.0;

  return v6;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (unint64_t)defaultViewStyle
{
  return 6;
}

- (MTATimerControlsView)timerControlsView
{
  return self->_timerControlsView;
}

- (void)setTimerControlsView:(id)a3
{
}

- (MTATimerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTATimerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timerControlsView, 0);
}

@end