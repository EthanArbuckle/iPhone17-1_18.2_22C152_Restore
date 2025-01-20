@interface RidesharingEnableAllAppsTableViewCell
- (BackgroundColorButton)enableButton;
- (MapsThemeMultiPartLabel)secondaryLabel;
- (RidesharingEnableAllAppsTableViewCell)initWithFrame:(CGRect)a3;
- (RidesharingEnableAllAppsTableViewCellDelegate)delegate;
- (unint64_t)type;
- (void)_enableButtonPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)configureForType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateTheme;
@end

@implementation RidesharingEnableAllAppsTableViewCell

- (RidesharingEnableAllAppsTableViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RidesharingEnableAllAppsTableViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RidesharingEnableAllAppsTableViewCell *)v3 _setupViews];
    [(RidesharingEnableAllAppsTableViewCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupViews
{
  v3 = +[BackgroundColorButton buttonWithType:0];
  enableButton = self->_enableButton;
  self->_enableButton = v3;

  [(BackgroundColorButton *)self->_enableButton setClipsToBounds:1];
  v5 = [(BackgroundColorButton *)self->_enableButton layer];
  [v5 setCornerRadius:8.0];

  [(BackgroundColorButton *)self->_enableButton setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_type = 0;
  objc_super v6 = self->_enableButton;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Show Rides [Ride Booking]" value:@"localized string not found" table:0];
  [(BackgroundColorButton *)v6 setTitle:v8 forState:0];

  v9 = [(BackgroundColorButton *)self->_enableButton titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v9 withFontProvider:&stru_101321480];

  [(BackgroundColorButton *)self->_enableButton addTarget:self action:"_enableButtonPressed:" forControlEvents:0x2000];
  v10 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  [v10 addSubview:self->_enableButton];

  v11 = objc_alloc_init(MapsThemeMultiPartLabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v11;

  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTextAlignment:1];
  v13 = +[UIColor secondaryLabelColor];
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setTextColor:v13];

  +[DynamicTypeWizard autorefreshLabel:self->_secondaryLabel withFontProvider:&stru_101321340];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Share your location with ride booking apps to estimate fares and wait times. You can manage this at any time in Maps Settings. [Ridesharing]" value:@"localized string not found" table:0];
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setText:v15];

  v16 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  [v16 addSubview:self->_secondaryLabel];

  [(RidesharingEnableAllAppsTableViewCell *)self updateTheme];
}

- (void)updateTheme
{
  v12.receiver = self;
  v12.super_class = (Class)RidesharingEnableAllAppsTableViewCell;
  [(MapsThemeCollectionViewCell *)&v12 updateTheme];
  v3 = [(RidesharingEnableAllAppsTableViewCell *)self theme];
  enableButton = self->_enableButton;
  v5 = [v3 blueButtonBackgroundColor:0];
  [(BackgroundColorButton *)enableButton setBackgroundColor:v5 forState:0];

  objc_super v6 = self->_enableButton;
  v7 = [v3 blueButtonBackgroundColor:1];
  [(BackgroundColorButton *)v6 setBackgroundColor:v7 forState:1];

  v8 = self->_enableButton;
  v9 = [v3 blueButtonTitleColor:0];
  [(BackgroundColorButton *)v8 setTitleColor:v9 forState:0];

  v10 = self->_enableButton;
  v11 = [v3 blueButtonTitleColor:1];
  [(BackgroundColorButton *)v10 setTitleColor:v11 forState:1];
}

- (void)_setupConstraints
{
  LODWORD(v2) = 1148846080;
  [(BackgroundColorButton *)self->_enableButton setContentCompressionResistancePriority:1 forAxis:v2];
  LODWORD(v4) = 1148846080;
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setContentCompressionResistancePriority:1 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [(MapsThemeMultiPartLabel *)self->_secondaryLabel setContentHuggingPriority:1 forAxis:v5];
  objc_super v6 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v7 = [v6 heightAnchor];
  +[RouteOverviewCell minimumRidesharingHeight];
  v38 = [v7 constraintGreaterThanOrEqualToConstant:];

  v39[0] = v38;
  v36 = [(MapsThemeMultiPartLabel *)self->_secondaryLabel firstBaselineAnchor];
  v37 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v35 = [v37 topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:22.0];
  v39[1] = v34;
  v33 = [(MapsThemeMultiPartLabel *)self->_secondaryLabel lastBaselineAnchor];
  v32 = [(BackgroundColorButton *)self->_enableButton topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-16.0];
  v39[2] = v31;
  v29 = [(MapsThemeMultiPartLabel *)self->_secondaryLabel leadingAnchor];
  v30 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v28 = [v30 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:16.0];
  v39[3] = v27;
  v25 = [(MapsThemeMultiPartLabel *)self->_secondaryLabel trailingAnchor];
  v26 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v24 = [v26 trailingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:-16.0];
  v39[4] = v23;
  v21 = [(BackgroundColorButton *)self->_enableButton leadingAnchor];
  v22 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v20 = [v22 leadingAnchor];
  v18 = [v21 constraintEqualToAnchor:v20 constant:16.0];
  v39[5] = v18;
  v8 = [(BackgroundColorButton *)self->_enableButton trailingAnchor];
  v9 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:-16.0];
  v39[6] = v11;
  objc_super v12 = [(BackgroundColorButton *)self->_enableButton heightAnchor];
  v13 = [v12 constraintGreaterThanOrEqualToConstant:50.0];
  v39[7] = v13;
  v14 = [(BackgroundColorButton *)self->_enableButton bottomAnchor];
  v15 = [(RidesharingEnableAllAppsTableViewCell *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-17.0];
  v39[8] = v17;
  v19 = +[NSArray arrayWithObjects:v39 count:9];

  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)configureForType:(unint64_t)a3
{
  self->_type = a3;
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    enableButton = self->_enableButton;
    double v4 = +[NSBundle mainBundle];
    CFStringRef v5 = @"Show Apps [Ride Booking]";
  }
  else
  {
    enableButton = self->_enableButton;
    double v4 = +[NSBundle mainBundle];
    CFStringRef v5 = @"Show Rides [Ride Booking]";
  }
  id v7 = v4;
  objc_super v6 = [v4 localizedStringForKey:v5 value:@"localized string not found" table:0];
  [(BackgroundColorButton *)enableButton setTitle:v6 forState:0];
}

- (void)_enableButtonPressed:(id)a3
{
  id v4 = [(RidesharingEnableAllAppsTableViewCell *)self delegate];
  [v4 ridesharingEnableAllAppsTableViewCellDidPerformEnableCommand:self];
}

- (RidesharingEnableAllAppsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RidesharingEnableAllAppsTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BackgroundColorButton)enableButton
{
  return self->_enableButton;
}

- (MapsThemeMultiPartLabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_enableButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end