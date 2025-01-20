@interface RidesharingAppActionTableViewCell
- (NSLayoutConstraint)buttonBaselineToTopConstraint;
- (RideBookingRideOptionStatus)status;
- (RidesharingAppActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (RidesharingAppActionTableViewCellDelegate)delegate;
- (UIButton)actionButton;
- (unint64_t)titleType;
- (void)_openAppPressed:(id)a3;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateContentSizeCategoryDependentFontsAndConstraints;
- (void)configureWithRideBookingRideOptionStatus:(id)a3 titleType:(unint64_t)a4;
- (void)dealloc;
- (void)setActionButton:(id)a3;
- (void)setApplicationName:(id)a3 titleType:(unint64_t)a4;
- (void)setButtonBaselineToTopConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTitleType:(unint64_t)a3;
- (void)updateTheme;
@end

@implementation RidesharingAppActionTableViewCell

- (RidesharingAppActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RidesharingAppActionTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RidesharingAppActionTableViewCell *)v4 _setupViews];
    [(RidesharingAppActionTableViewCell *)v5 _setupConstraints];
    [(RidesharingAppActionTableViewCell *)v5 _updateContentSizeCategoryDependentFontsAndConstraints];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_updateContentSizeCategoryDependentFontsAndConstraints" name:UIContentSizeCategoryDidChangeNotification object:0];

    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(RidesharingAppActionTableViewCell *)v5 setAccessibilityIdentifier:v8];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppActionTableViewCell;
  [(RidesharingAppActionTableViewCell *)&v4 dealloc];
}

- (void)_setupViews
{
  [(RidesharingAppActionTableViewCell *)self setSelectionStyle:0];
  v3 = +[UIButton buttonWithType:0];
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_actionButton addTarget:self action:"_openAppPressed:" forControlEvents:0x2000];
  [(UIButton *)self->_actionButton setAccessibilityIdentifier:@"ActionButton"];
  v5 = [(RidesharingAppActionTableViewCell *)self contentView];
  [v5 addSubview:self->_actionButton];

  [(RidesharingAppActionTableViewCell *)self updateTheme];
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)RidesharingAppActionTableViewCell;
  [(MapsThemeTableViewCell *)&v9 updateTheme];
  actionButton = self->_actionButton;
  objc_super v4 = [(RidesharingAppActionTableViewCell *)self theme];
  v5 = [v4 keyColor];
  [(UIButton *)actionButton setTitleColor:v5 forState:0];

  v6 = self->_actionButton;
  v7 = [(RidesharingAppActionTableViewCell *)self theme];
  v8 = [v7 darkKeyColor];
  [(UIButton *)v6 setTitleColor:v8 forState:1];
}

- (void)_setupConstraints
{
  v3 = [(UIButton *)self->_actionButton firstBaselineAnchor];
  objc_super v4 = [(RidesharingAppActionTableViewCell *)self contentView];
  v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  buttonBaselineToTopConstraint = self->_buttonBaselineToTopConstraint;
  self->_buttonBaselineToTopConstraint = v6;

  v20 = [(UIButton *)self->_actionButton leadingAnchor];
  v21 = [(RidesharingAppActionTableViewCell *)self contentView];
  v19 = [v21 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:16.0];
  v22[0] = v18;
  v8 = [(UIButton *)self->_actionButton trailingAnchor];
  objc_super v9 = [(RidesharingAppActionTableViewCell *)self contentView];
  objc_super v10 = [v9 trailingAnchor];
  v11 = [v8 constraintLessThanOrEqualToAnchor:v10 constant:-16.0];
  v12 = self->_buttonBaselineToTopConstraint;
  v22[1] = v11;
  v22[2] = v12;
  v13 = [(UIButton *)self->_actionButton lastBaselineAnchor];
  v14 = [(RidesharingAppActionTableViewCell *)self contentView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:-41.0];
  v22[3] = v16;
  v17 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_openAppPressed:(id)a3
{
  id v4 = [(RidesharingAppActionTableViewCell *)self delegate];
  [v4 ridesharingAppActionTableViewCellDidPerformAction:self];
}

- (void)_updateContentSizeCategoryDependentFontsAndConstraints
{
  v3 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline addingSymbolicTraits:0];
  id v4 = [(UIButton *)self->_actionButton titleLabel];
  [v4 setFont:v3];

  id v6 = [(UIButton *)self->_actionButton titleLabel];
  v5 = [v6 font];
  [v5 _mapkit_scaledValueForValue:25.0];
  -[NSLayoutConstraint setConstant:](self->_buttonBaselineToTopConstraint, "setConstant:");
}

- (void)configureWithRideBookingRideOptionStatus:(id)a3 titleType:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_status, a3);
  id v7 = a3;
  id v9 = [v7 application];

  v8 = [v9 name];
  [(RidesharingAppActionTableViewCell *)self setApplicationName:v8 titleType:a4];
}

- (void)setApplicationName:(id)a3 titleType:(unint64_t)a4
{
  id v6 = a3;
  self->_titleType = a4;
  id v18 = v6;
  switch(a4)
  {
    case 0uLL:
      actionButton = self->_actionButton;
      v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"Open App %@ [Ridesharing]";
      goto LABEL_5;
    case 1uLL:
      actionButton = self->_actionButton;
      v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"View App %@ [Ridesharing]";
      goto LABEL_5;
    case 2uLL:
      actionButton = self->_actionButton;
      v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"More from App %@ [Ridesharing]";
LABEL_5:
      v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
      v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v18);
      [(UIButton *)actionButton setTitle:v12 forState:0];

      break;
    case 3uLL:
      v13 = self->_actionButton;
      v14 = +[NSBundle mainBundle];
      v15 = [v14 localizedStringForKey:@"More from the App Store [Ridesharing]" value:@"localized string not found" table:0];
      [(UIButton *)v13 setTitle:v15 forState:0];

      break;
    default:
      break;
  }
  v16 = [(UIButton *)self->_actionButton titleLabel];
  [v16 setLineBreakMode:0];

  v17 = [(UIButton *)self->_actionButton titleLabel];
  [v17 setNumberOfLines:0];
}

- (RidesharingAppActionTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RidesharingAppActionTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(unint64_t)a3
{
  self->_titleType = a3;
}

- (RideBookingRideOptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (NSLayoutConstraint)buttonBaselineToTopConstraint
{
  return self->_buttonBaselineToTopConstraint;
}

- (void)setButtonBaselineToTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end