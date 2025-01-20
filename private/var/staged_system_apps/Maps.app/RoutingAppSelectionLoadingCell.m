@interface RoutingAppSelectionLoadingCell
- (RoutingAppSelectionLoadingCell)initWithMode:(unint64_t)a3 reuseIdentifier:(id)a4;
- (RoutingAppSelectionLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unint64_t)mode;
- (void)_configureViewsForMode:(unint64_t)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation RoutingAppSelectionLoadingCell

- (RoutingAppSelectionLoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(RoutingAppSelectionLoadingCell *)self initWithMode:0 reuseIdentifier:a4];
}

- (RoutingAppSelectionLoadingCell)initWithMode:(unint64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)RoutingAppSelectionLoadingCell;
  v5 = [(RoutingAppSelectionLoadingCell *)&v15 initWithStyle:0 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    v5->_mode = a3;
    [(RoutingAppSelectionLoadingCell *)v5 _configureViewsForMode:a3];
    v7 = +[UIColor clearColor];
    [(RoutingAppSelectionLoadingCell *)v6 setBackgroundColor:v7];

    v8 = +[UIColor clearColor];
    v9 = [(RoutingAppSelectionLoadingCell *)v6 contentView];
    [v9 setBackgroundColor:v8];

    [(RoutingAppSelectionLoadingCell *)v6 setUserInteractionEnabled:0];
    v10 = [(RoutingAppSelectionLoadingCell *)v6 contentView];
    v11 = [v10 heightAnchor];
    v12 = [v11 constraintGreaterThanOrEqualToConstant:50.0];
    v16 = v12;
    v13 = +[NSArray arrayWithObjects:&v16 count:1];
    +[NSLayoutConstraint activateConstraints:v13];
  }
  return v6;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[RoutingAppSelectionLoadingCell _configureViewsForMode:](self, "_configureViewsForMode:");
  }
}

- (void)_configureViewsForMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    if (!self->_noAppsLabel)
    {
      objc_super v15 = (UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      noAppsLabel = self->_noAppsLabel;
      self->_noAppsLabel = v15;

      [(UILabel *)self->_noAppsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v17 = +[UIFont boldSystemFontOfSize:14.0];
      [(UILabel *)self->_noAppsLabel setFont:v17];

      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"No Matches for Routing Apps" value:@"localized string not found" table:0];
      [(UILabel *)self->_noAppsLabel setText:v19];

      v20 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_noAppsLabel setTextColor:v20];
    }
    [(LoadingModeView *)self->_loadingView removeFromSuperview];
    v21 = [(RoutingAppSelectionLoadingCell *)self contentView];
    [v21 addSubview:self->_noAppsLabel];

    v37 = [(UILabel *)self->_noAppsLabel topAnchor];
    id v39 = [(RoutingAppSelectionLoadingCell *)self contentView];
    v36 = [v39 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v40[0] = v35;
    v33 = [(UILabel *)self->_noAppsLabel leadingAnchor];
    v34 = [(RoutingAppSelectionLoadingCell *)self contentView];
    v32 = [v34 leadingAnchor];
    v22 = [v33 constraintEqualToAnchor:v32 constant:16.0];
    v40[1] = v22;
    v23 = [(RoutingAppSelectionLoadingCell *)self contentView];
    v24 = [v23 bottomAnchor];
    v25 = [(UILabel *)self->_noAppsLabel bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v40[2] = v26;
    v27 = [(RoutingAppSelectionLoadingCell *)self contentView];
    v28 = [v27 trailingAnchor];
    v29 = [(UILabel *)self->_noAppsLabel trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:16.0];
    v40[3] = v30;
    v31 = +[NSArray arrayWithObjects:v40 count:4];
    +[NSLayoutConstraint activateConstraints:v31];
  }
  else if (!a3)
  {
    if (!self->_loadingView)
    {
      v4 = [LoadingModeView alloc];
      v5 = +[NSBundle mainBundle];
      v6 = [v5 localizedStringForKey:@"Loading Text for Routing Apps" value:@"localized string not found" table:0];
      v7 = [(LoadingModeView *)v4 initWithTitle:v6 axis:0];
      loadingView = self->_loadingView;
      self->_loadingView = v7;

      [(LoadingModeView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    [(UILabel *)self->_noAppsLabel removeFromSuperview];
    v9 = [(RoutingAppSelectionLoadingCell *)self contentView];
    [v9 addSubview:self->_loadingView];

    v10 = self->_loadingView;
    uint64_t v11 = [(RoutingAppSelectionLoadingCell *)self contentView];
    LODWORD(v12) = 1148846080;
    id v38 = (id)v11;
    v13 = -[LoadingModeView _maps_constraintsEqualToEdgesOfView:priority:](v10, "_maps_constraintsEqualToEdgesOfView:priority:", v12);
    v14 = [v13 allConstraints];
    +[NSLayoutConstraint activateConstraints:v14];
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_noAppsLabel, 0);
}

@end