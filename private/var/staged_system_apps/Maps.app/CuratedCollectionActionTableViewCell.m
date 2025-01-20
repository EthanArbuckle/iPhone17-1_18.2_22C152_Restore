@interface CuratedCollectionActionTableViewCell
- (BOOL)alwaysUseLightForegroundColors;
- (CuratedCollectionActionCellModel)model;
- (CuratedCollectionActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MUPlaceCardActionsRowView)actionRowView;
- (void)_createSubviews;
- (void)_resetActionRow;
- (void)_setupConstraints;
- (void)configureWithModel:(id)a3;
- (void)layoutMarginsDidChange;
- (void)setActionRowView:(id)a3;
- (void)setAlwaysUseLightForegroundColors:(BOOL)a3;
- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4;
- (void)setModel:(id)a3;
@end

@implementation CuratedCollectionActionTableViewCell

- (CuratedCollectionActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionActionTableViewCell;
  v4 = [(CuratedCollectionActionTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CuratedCollectionActionTableViewCell *)v4 setSelectionStyle:0];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(CuratedCollectionActionTableViewCell *)v5 setAccessibilityIdentifier:v7];

    [(CuratedCollectionActionTableViewCell *)v5 _createSubviews];
    [(CuratedCollectionActionTableViewCell *)v5 _setupConstraints];
  }
  return v5;
}

- (void)_createSubviews
{
  v3 = +[UIColor clearColor];
  [(CuratedCollectionActionTableViewCell *)self setBackgroundColor:v3];

  uint64_t v4 = sub_1000BBB44(self);
  if (self->_alwaysUseLightForegroundColors) {
    +[UIColor whiteColor];
  }
  else {
  id v16 = +[UIColor clearColor];
  }
  uint64_t v5 = 2 * (v4 == 5);
  v6 = +[MUGroupedActionsRowViewConfiguration defaultConfiguration];
  [v6 setTintColor:v16];
  v7 = +[UIColor colorWithWhite:1.0 alpha:0.100000001];
  [v6 setItemBackgroundColor:v7];

  v8 = +[UIColor colorWithWhite:1.0 alpha:0.200000003];
  [v6 setItemHighlightColor:v8];

  [v6 setUseVibrancy:0];
  id v9 = [objc_alloc((Class)MUPlaceCardActionsRowView) initWithConfiguration:v6 style:v5];
  [(CuratedCollectionActionTableViewCell *)self setActionRowView:v9];

  v10 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  [v10 setPreservesSuperviewLayoutMargins:1];

  v11 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  v12 = [v11 layer];
  [v12 setAllowsGroupOpacity:0];

  v13 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(CuratedCollectionActionTableViewCell *)self contentView];
  v15 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  [v14 addSubview:v15];
}

- (void)_setupConstraints
{
  uint64_t v3 = sub_1000BBB44(self);
  if (v3 == 5) {
    double v4 = 5.0;
  }
  else {
    double v4 = 16.0;
  }
  if (v3 == 5) {
    double v5 = -5.0;
  }
  else {
    double v5 = 0.0;
  }
  v29 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  v27 = [v29 topAnchor];
  v28 = [(CuratedCollectionActionTableViewCell *)self contentView];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:v4];
  v30[0] = v25;
  v24 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  v22 = [v24 leadingAnchor];
  v23 = [(CuratedCollectionActionTableViewCell *)self contentView];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21 constant:v5];
  v30[1] = v20;
  v19 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  v18 = [v19 trailingAnchor];
  v6 = [(CuratedCollectionActionTableViewCell *)self contentView];
  v7 = [v6 trailingAnchor];
  v8 = [v18 constraintEqualToAnchor:v7];
  v30[2] = v8;
  id v9 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  v10 = [v9 bottomAnchor];
  v11 = [(CuratedCollectionActionTableViewCell *)self contentView];
  v12 = [v11 bottomAnchor];
  LODWORD(v13) = 1112276992;
  v14 = [v10 constraintEqualToAnchor:v12 constant:-v4 priority:v13];
  v30[3] = v14;
  v15 = +[NSArray arrayWithObjects:v30 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  id v16 = [(CuratedCollectionActionTableViewCell *)self contentView];
  [v16 setLayoutMargins:0.0, 16.0, 0.0, 16.0];

  v17 = [(CuratedCollectionActionTableViewCell *)self contentView];
  [v17 setPreservesSuperviewLayoutMargins:0];
}

- (void)layoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionActionTableViewCell;
  [(CuratedCollectionActionTableViewCell *)&v4 layoutMarginsDidChange];
  [(CuratedCollectionActionTableViewCell *)self bounds];
  -[CuratedCollectionActionTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3
{
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_alwaysUseLightForegroundColors != a3)
  {
    BOOL v4 = a4;
    self->_alwaysUseLightForegroundColors = a3;
    v6 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
    [(CuratedCollectionActionTableViewCell *)self _createSubviews];
    [(CuratedCollectionActionTableViewCell *)self _setupConstraints];
    [(CuratedCollectionActionTableViewCell *)self _resetActionRow];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100D27C28;
    v15[3] = &unk_1012E5D08;
    v15[4] = self;
    +[UIView performWithoutAnimation:v15];
    v7 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
    double v8 = 0.0;
    [v7 setAlpha:0.0];

    if (v4) {
      double v8 = 0.2;
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100D27C30;
    v12[3] = &unk_1012E5D58;
    id v13 = v6;
    v14 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100D27C90;
    v10[3] = &unk_1012E7D28;
    id v11 = v13;
    id v9 = v13;
    +[UIView animateWithDuration:v12 animations:v10 completion:v8];
  }
}

- (void)configureWithModel:(id)a3
{
  id v6 = a3;
  id v4 = [(CuratedCollectionActionTableViewCell *)self model];

  double v5 = v6;
  if (v4 != v6)
  {
    [(CuratedCollectionActionTableViewCell *)self setModel:v6];
    [(CuratedCollectionActionTableViewCell *)self _resetActionRow];
    double v5 = v6;
  }
}

- (void)_resetActionRow
{
  double v3 = [(CuratedCollectionActionTableViewCell *)self model];
  id v4 = [v3 actionManager];
  double v5 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  [v5 setActionManager:v4];

  id v6 = [(CuratedCollectionActionTableViewCell *)self actionRowView];
  [v6 reload];
}

- (BOOL)alwaysUseLightForegroundColors
{
  return self->_alwaysUseLightForegroundColors;
}

- (MUPlaceCardActionsRowView)actionRowView
{
  return self->_actionRowView;
}

- (void)setActionRowView:(id)a3
{
}

- (CuratedCollectionActionCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_actionRowView, 0);
}

@end