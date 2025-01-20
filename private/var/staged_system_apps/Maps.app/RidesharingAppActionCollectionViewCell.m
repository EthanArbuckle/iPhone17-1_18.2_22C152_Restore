@interface RidesharingAppActionCollectionViewCell
- (NSLayoutConstraint)buttonBaselineToTopConstraint;
- (RideBookingRideOptionStatus)status;
- (RidesharingAppActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (RidesharingAppActionCollectionViewCellDelegate)delegate;
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

@implementation RidesharingAppActionCollectionViewCell

- (RidesharingAppActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RidesharingAppActionCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RidesharingAppActionCollectionViewCell *)v3 _setupViews];
    [(RidesharingAppActionCollectionViewCell *)v4 _setupConstraints];
    [(RidesharingAppActionCollectionViewCell *)v4 _updateContentSizeCategoryDependentFontsAndConstraints];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_updateContentSizeCategoryDependentFontsAndConstraints" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppActionCollectionViewCell;
  [(RidesharingAppActionCollectionViewCell *)&v4 dealloc];
}

- (void)_setupViews
{
  v3 = +[UIButton buttonWithType:0];
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_actionButton addTarget:self action:"_openAppPressed:" forControlEvents:0x2000];
  v5 = [(RidesharingAppActionCollectionViewCell *)self contentView];
  [v5 addSubview:self->_actionButton];

  [(RidesharingAppActionCollectionViewCell *)self updateTheme];
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)RidesharingAppActionCollectionViewCell;
  [(MapsThemeCollectionViewCell *)&v9 updateTheme];
  actionButton = self->_actionButton;
  objc_super v4 = [(RidesharingAppActionCollectionViewCell *)self theme];
  v5 = [v4 keyColor];
  [(UIButton *)actionButton setTitleColor:v5 forState:0];

  v6 = self->_actionButton;
  objc_super v7 = [(RidesharingAppActionCollectionViewCell *)self theme];
  v8 = [v7 darkKeyColor];
  [(UIButton *)v6 setTitleColor:v8 forState:1];
}

- (void)_setupConstraints
{
  v3 = [(UIButton *)self->_actionButton firstBaselineAnchor];
  objc_super v4 = [(RidesharingAppActionCollectionViewCell *)self contentView];
  v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  buttonBaselineToTopConstraint = self->_buttonBaselineToTopConstraint;
  self->_buttonBaselineToTopConstraint = v6;

  v20 = [(UIButton *)self->_actionButton leadingAnchor];
  v21 = [(RidesharingAppActionCollectionViewCell *)self contentView];
  v19 = [v21 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:16.0];
  v22[0] = v18;
  v8 = [(UIButton *)self->_actionButton trailingAnchor];
  objc_super v9 = [(RidesharingAppActionCollectionViewCell *)self contentView];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintLessThanOrEqualToAnchor:v10 constant:-16.0];
  v12 = self->_buttonBaselineToTopConstraint;
  v22[1] = v11;
  v22[2] = v12;
  v13 = [(UIButton *)self->_actionButton centerYAnchor];
  v14 = [(RidesharingAppActionCollectionViewCell *)self contentView];
  v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v22[3] = v16;
  v17 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)_openAppPressed:(id)a3
{
  id v4 = [(RidesharingAppActionCollectionViewCell *)self delegate];
  [v4 ridesharingAppActionCollectionViewCellDidPerformAction:self];
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
  [(RidesharingAppActionCollectionViewCell *)self setApplicationName:v8 titleType:a4];
}

- (void)setApplicationName:(id)a3 titleType:(unint64_t)a4
{
  id v13 = a3;
  self->_titleType = a4;
  switch(a4)
  {
    case 0uLL:
      actionButton = self->_actionButton;
      id v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"Open App %@ [Ridesharing]";
      goto LABEL_5;
    case 1uLL:
      actionButton = self->_actionButton;
      id v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"View App %@ [Ridesharing]";
      goto LABEL_5;
    case 2uLL:
      actionButton = self->_actionButton;
      id v7 = +[NSBundle mainBundle];
      v8 = v7;
      CFStringRef v9 = @"More from App %@ [Ridesharing]";
LABEL_5:
      v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
      v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v13);
      [(UIButton *)actionButton setTitle:v11 forState:0];

      goto LABEL_7;
    case 3uLL:
      v12 = self->_actionButton;
      v8 = +[NSBundle mainBundle];
      v10 = [v8 localizedStringForKey:@"More from the App Store [Ridesharing]" value:@"localized string not found" table:0];
      [(UIButton *)v12 setTitle:v10 forState:0];
LABEL_7:

      break;
    default:
      break;
  }
}

- (RidesharingAppActionCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RidesharingAppActionCollectionViewCellDelegate *)WeakRetained;
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