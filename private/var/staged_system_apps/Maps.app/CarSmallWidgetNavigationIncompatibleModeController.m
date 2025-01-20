@interface CarSmallWidgetNavigationIncompatibleModeController
- (BOOL)showsMapView;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (void)_displayIncompatibilityMessage;
- (void)loadView;
- (void)setChromeViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation CarSmallWidgetNavigationIncompatibleModeController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)CarSmallWidgetNavigationIncompatibleModeController;
  [(CarSmallWidgetNavigationIncompatibleModeController *)&v5 loadView];
  v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  incompatibleLabel = self->_incompatibleLabel;
  self->_incompatibleLabel = v3;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)CarSmallWidgetNavigationIncompatibleModeController;
  [(CarSmallWidgetNavigationIncompatibleModeController *)&v13 viewDidLoad];
  v3 = [(CarSmallWidgetNavigationIncompatibleModeController *)self view];
  [v3 setAccessibilityIdentifier:@"CarSmallWidgetNavigationIncompatibleView"];

  [(UILabel *)self->_incompatibleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = +[UIFont systemFontOfSize:17.0];
  [(UILabel *)self->_incompatibleLabel setFont:v4];

  [(UILabel *)self->_incompatibleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_incompatibleLabel setMinimumScaleFactor:0.600000024];
  [(UILabel *)self->_incompatibleLabel setNumberOfLines:0];
  [(UILabel *)self->_incompatibleLabel setTextAlignment:1];
  objc_super v5 = +[UIColor labelColor];
  [(UILabel *)self->_incompatibleLabel setTextColor:v5];

  [(UILabel *)self->_incompatibleLabel setAccessibilityIdentifier:@"IncompatibleLabel"];
  v6 = [(CarSmallWidgetNavigationIncompatibleModeController *)self view];
  [v6 addSubview:self->_incompatibleLabel];

  incompatibleLabel = self->_incompatibleLabel;
  v8 = [(CarSmallWidgetNavigationIncompatibleModeController *)self view];
  v9 = [v8 safeAreaLayoutGuide];
  LODWORD(v10) = 1148846080;
  v11 = -[UILabel _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](incompatibleLabel, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v9, 6.0, 6.0, 6.0, 6.0, v10);
  v12 = [v11 allConstraints];
  +[NSLayoutConstraint activateConstraints:v12];

  [(CarSmallWidgetNavigationIncompatibleModeController *)self _displayIncompatibilityMessage];
}

- (void)_displayIncompatibilityMessage
{
  id v7 = +[MNNavigationService sharedService];
  if ([v7 desiredTransportType])
  {
    unsigned int v3 = [v7 desiredTransportType];
    if (v3 > 5) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = qword_100F72128[v3];
    }
    objc_super v5 = CarInterruptionUserInfoWithTransportType(v4);
    v6 = [v5 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
    [(UILabel *)self->_incompatibleLabel setText:v6];
  }
  else
  {
    objc_super v5 = CarDisplayTurnByTurnNotAvailableAdvisory();
    [(UILabel *)self->_incompatibleLabel setText:v5];
  }
}

- (BOOL)showsMapView
{
  return 0;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);

  objc_storeStrong((id *)&self->_incompatibleLabel, 0);
}

@end