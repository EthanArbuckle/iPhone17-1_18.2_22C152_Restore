@interface MTAPresetCollectionViewCell
- (MTAPresetCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTATimerPresetView)presetView;
- (void)setHighlighted:(BOOL)a3;
- (void)setPresetItem:(id)a3;
- (void)setPresetView:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupPresetView;
@end

@implementation MTAPresetCollectionViewCell

- (MTAPresetCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTAPresetCollectionViewCell;
  v3 = -[MTAPresetCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTAPresetCollectionViewCell *)v3 setupPresetView];
    [(MTAPresetCollectionViewCell *)v4 setupLayoutConstraints];
  }
  return v4;
}

- (void)setPresetItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MTAPresetCollectionViewCell *)self presetView];
  [v5 setPresetItem:v4];
}

- (void)setupPresetView
{
  v3 = [MTATimerPresetView alloc];
  [(MTAPresetCollectionViewCell *)self bounds];
  id v4 = -[MTATimerPresetView initWithFrame:](v3, "initWithFrame:");
  [(MTAPresetCollectionViewCell *)self setPresetView:v4];

  id v5 = [(MTAPresetCollectionViewCell *)self presetView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(MTAPresetCollectionViewCell *)self presetView];
  [v6 setUserInteractionEnabled:0];

  id v8 = [(MTAPresetCollectionViewCell *)self contentView];
  v7 = [(MTAPresetCollectionViewCell *)self presetView];
  [v8 addSubview:v7];
}

- (void)setupLayoutConstraints
{
  id v23 = (id)objc_opt_new();
  v3 = [(MTAPresetCollectionViewCell *)self presetView];
  id v4 = [v3 leadingAnchor];
  id v5 = [(MTAPresetCollectionViewCell *)self contentView];
  objc_super v6 = [v5 leadingAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  [v23 addObject:v7];

  id v8 = [(MTAPresetCollectionViewCell *)self presetView];
  v9 = [v8 trailingAnchor];
  v10 = [(MTAPresetCollectionViewCell *)self contentView];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v23 addObject:v12];

  v13 = [(MTAPresetCollectionViewCell *)self presetView];
  v14 = [v13 topAnchor];
  v15 = [(MTAPresetCollectionViewCell *)self contentView];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v23 addObject:v17];

  v18 = [(MTAPresetCollectionViewCell *)self presetView];
  v19 = [v18 bottomAnchor];
  v20 = [(MTAPresetCollectionViewCell *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v23];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTAPresetCollectionViewCell;
  -[MTAPresetCollectionViewCell setHighlighted:](&v6, "setHighlighted:");
  id v5 = [(MTAPresetCollectionViewCell *)self presetView];
  [v5 setHighlighted:v3];
}

- (MTATimerPresetView)presetView
{
  return self->_presetView;
}

- (void)setPresetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end