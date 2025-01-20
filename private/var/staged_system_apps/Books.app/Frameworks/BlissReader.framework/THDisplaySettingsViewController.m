@interface THDisplaySettingsViewController
- (BOOL)_shouldShowAutoNightMode;
- (BOOL)p_presentingFullscreen;
- (NSArray)supportedSections;
- (THDisplaySettingsViewController)initWithDelegate:(id)a3;
- (THDisplaySettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)appearanceRowHeight;
- (double)p_bestPopoverHeightForSections:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_grayThemeButtonImageSelected:(BOOL)a3;
- (id)_nightThemeButtonImageSelected:(BOOL)a3;
- (id)_sepiaThemeButtonImageSelected:(BOOL)a3;
- (id)_themeButtonImageWithColor:(id)a3 selected:(BOOL)a4;
- (id)_whiteThemeButtonImageSelected:(BOOL)a3;
- (id)autoNightModeSwitch;
- (id)p_buildSupportedSections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)themeContainer;
- (int64_t)appearanceStyle;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)p_currentFlowSizeScale;
- (unint64_t)p_displaySectionForSection:(int64_t)a3;
- (void)_changeAppearanceStyle:(int64_t)a3;
- (void)_restoreAutoNightModeSwitch;
- (void)_turnAutoNightModeSwitchOff;
- (void)contentSizeCategoryDidChange;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5;
- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4;
- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4;
- (void)dealloc;
- (void)decreaseFontSize:(id)a3;
- (void)decreaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4;
- (void)didReceiveMemoryWarning;
- (void)handleAutoNightModeSwitch:(id)a3;
- (void)handleScrollingViewDidChange:(id)a3;
- (void)increaseFontSize:(id)a3;
- (void)increaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4;
- (void)onScrollSwitch:(id)a3;
- (void)p_resizePopoverViewAnimated:(BOOL)a3;
- (void)p_setCurrentFlowSizeScale:(unint64_t)a3;
- (void)p_setPopoverScrolling;
- (void)p_validateButtonsAnimated:(BOOL)a3;
- (void)releaseViews;
- (void)setAppearanceStyle:(int64_t)a3;
- (void)setAutoNightModeSwitch:(BOOL)a3;
- (void)setSupportedSections:(id)a3;
- (void)setTheme:(id)a3;
- (void)setThemeGray:(id)a3;
- (void)setThemeNight:(id)a3;
- (void)setThemeNormal:(id)a3;
- (void)setThemeSepia:(id)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateThemeButtons;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THDisplaySettingsViewController

- (THDisplaySettingsViewController)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewController;
  v4 = [(THDisplaySettingsViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    [(THDisplaySettingsViewController *)v4 setDelegate:a3];
    sub_60C18(v5);
  }
  return v5;
}

- (THDisplaySettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewController;
  v4 = [(THDisplaySettingsViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    sub_60C18(v4);
  }
  return v5;
}

- (void)releaseViews
{
  [(UIButton *)self->_themeWhiteButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_themeWhiteButton = 0;
  [(UIButton *)self->_themeSepiaButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_themeSepiaButton = 0;
  [(UIButton *)self->_themeGrayButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_themeGrayButton = 0;
  [(UIButton *)self->_themeNightButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_themeNightButton = 0;
  self->_themeContainer = 0;

  self->_autoNightModeSwitch = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v3 releaseViews];
}

- (void)dealloc
{
  [(THDisplaySettingsViewController *)self releaseViews];

  self->_supportedSections = 0;
  [+[BCThemeCoordinator shared](BCThemeCoordinator, "shared") removeObserver:self];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:THScrollingViewDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
  [(THDisplaySettingsViewController *)self setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v4 dealloc];
}

- (unint64_t)p_currentFlowSizeScale
{
  id v2 = +[THApplicationSettings sharedSettings];

  return (unint64_t)[v2 flowSizeScale];
}

- (void)p_setCurrentFlowSizeScale:(unint64_t)a3
{
  id v4 = +[THApplicationSettings sharedSettings];

  [v4 setFlowSizeScale:a3];
}

- (void)onScrollSwitch:(id)a3
{
  if (objc_msgSend(-[THDisplaySettingsViewController scrollSwitch](self, "scrollSwitch", a3), "isEnabled"))
  {
    [self scrollSwitch].setEnabled:0;
    dispatch_time_t v4 = dispatch_time(0, 10000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_60FD4;
    block[3] = &unk_456DE0;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleScrollingViewDidChange:(id)a3
{
}

- (void)p_validateButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [[THApplicationSettings sharedSettings] flowSizeScale];
  [self sizeSmallerButton].setEnabled:v5 != 0;
  [self sizeLargerButton].setEnabled:((unint64_t)v5 < 0xB);
  [self scrollSwitch].setEnabled:1;
  [self scrollSwitch].setOn:[self delegate].flowModeEnabled:self];

  [(THDisplaySettingsViewController *)self p_resizePopoverViewAnimated:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v5 viewDidLoad];
  [(-[THDisplaySettingsViewController view](self, "view")) setAccessibilityIgnoresInvertColors:1];
  [+[BCThemeCoordinator shared](BCThemeCoordinator, "shared") addObserver:self];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"handleScrollingViewDidChange:" name:THScrollingViewDidChangeNotification object:0];
  [(NSNotificationCenter *)v3 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  [(THDisplaySettingsViewController *)self setSupportedSections:[(THDisplaySettingsViewController *)self p_buildSupportedSections]];
  [(THDisplaySettingsViewController *)self p_bestPopoverHeightForSections:[(THDisplaySettingsViewController *)self supportedSections]];
  -[THDisplaySettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 296.0, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v4 viewDidAppear:a3];
  [(THDisplaySettingsViewController *)self p_setPopoverScrolling];
}

- (void)p_setPopoverScrolling
{
  id v3 = [(THDisplaySettingsViewController *)self tableView];
  [v3 frame];
  double Height = CGRectGetHeight(v7);
  [(THDisplaySettingsViewController *)self preferredContentSize];

  [v3 setScrollEnabled:Height > v5];
}

- (void)contentSizeCategoryDidChange
{
  [(THDisplaySettingsViewController *)self releaseAuxiliaryCachedViews];
  [(THDisplaySettingsViewController *)self p_resizePopoverViewAnimated:0];

  [(THDisplaySettingsViewController *)self updateBrightness];
}

- (id)p_buildSupportedSections
{
  id v3 = +[NSMutableArray array];
  unsigned int v4 = +[BEAppearanceViewController canChangeBrightness];
  if (v4) {
    [v3 addObject:&off_499090];
  }
  if ([self.delegate shouldShowThemeControls:self])[v3 addObject:&off_4990A8]; {
  if ([self.delegate shouldShowFlowModeSwitch:self])[v3 addObject:&off_4990C0];
  }
  if (objc_msgSend(-[THDisplaySettingsViewController delegate](self, "delegate"), "shouldShowFontResizeControls:", self))
  {
    if (v4) {
      [v3 addObject:&off_4990D8];
    }
    else {
      [v3 insertObject:&off_4990D8 atIndex:0];
    }
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v4 viewWillAppear:a3];
  [(THDisplaySettingsViewController *)self p_validateButtonsAnimated:0];
  [(THDisplaySettingsViewController *)self stylizeForTheme];
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v3 didReceiveMemoryWarning];
  [(THDisplaySettingsViewController *)self releaseViews];
}

- (void)increaseFontSize:(id)a3
{
  [(THDisplaySettingsViewController *)self p_setCurrentFlowSizeScale:(char *)[(THDisplaySettingsViewController *)self p_currentFlowSizeScale] + 1];

  [(THDisplaySettingsViewController *)self increaseFontSize:a3 notifyingCoordinator:1];
}

- (void)increaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDisplaySettingsViewController *)self p_validateButtonsAnimated:0];
  [self.delegate displaySettingsControllerDidChangeFontSize:self toFlowSizeScale:[self p_currentFlowSizeScale]];
  if (v4)
  {
    id v6 = +[BCThemeCoordinator shared];
    [v6 observerDidIncreaseFontSize:self];
  }
}

- (void)decreaseFontSize:(id)a3
{
  [(THDisplaySettingsViewController *)self p_setCurrentFlowSizeScale:(char *)[(THDisplaySettingsViewController *)self p_currentFlowSizeScale] - 1];

  [(THDisplaySettingsViewController *)self decreaseFontSize:a3 notifyingCoordinator:1];
}

- (void)decreaseFontSize:(id)a3 notifyingCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDisplaySettingsViewController *)self p_validateButtonsAnimated:0];
  [self.delegate displaySettingsControllerDidChangeFontSize:self toFlowSizeScale:[self p_currentFlowSizeScale]];
  if (v4)
  {
    id v6 = +[BCThemeCoordinator shared];
    [v6 observerDidDecreaseFontSize:self];
  }
}

- (void)setAutoNightModeSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  -[UISwitch setEnabled:](self->_autoNightModeSwitch, "setEnabled:");
  BOOL v4 = +[NSUserDefaults standardUserDefaults];

  [(NSUserDefaults *)v4 setBool:!v3 forKey:@"THAppearanceDisableAutoNightModeSwitchKey"];
}

- (BOOL)_shouldShowAutoNightMode
{
  id v2 = +[BCLightLevelController shared];

  return [v2 shouldMonitorLightLevel];
}

- (void)_turnAutoNightModeSwitchOff
{
  BOOL v3 = [(UISwitch *)self->_autoNightModeSwitch isOn];
  if (v3)
  {
    [(UISwitch *)self->_autoNightModeSwitch setOn:0 animated:1];
    [(UISwitch *)self->_autoNightModeSwitch sendActionsForControlEvents:4096];
  }
  BOOL v4 = +[NSUserDefaults standardUserDefaults];

  [(NSUserDefaults *)v4 setBool:v3 forKey:@"THAppearanceAutoNightModeSwitchWasOnKey"];
}

- (void)_restoreAutoNightModeSwitch
{
  if ([+[NSUserDefaults standardUserDefaults] BOOLForKey:@"THAppearanceAutoNightModeSwitchWasOnKey"])
  {
    [(UISwitch *)self->_autoNightModeSwitch setOn:1 animated:1];
    autoNightModeSwitch = self->_autoNightModeSwitch;
    [(UISwitch *)autoNightModeSwitch sendActionsForControlEvents:4096];
  }
}

- (id)themeContainer
{
  id result = self->_themeContainer;
  if (!result)
  {
    BOOL v4 = [objc_alloc((Class)UIStackView) initWithFrame:0.0, 0.0, 244.0, 55.0];
    self->_themeContainer = v4;
    [(UIStackView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_themeContainer setDistribution:4];
    [(UIStackView *)self->_themeContainer setAlignment:3];
    [(UIStackView *)self->_themeContainer setSpacing:20.0];
    double v5 = [(UIButton *)[objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 46.0, 55.0]];
    self->_themeWhiteButton = v5;
    [(UIButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_themeWhiteButton setImage:[(THDisplaySettingsViewController *)self _whiteThemeButtonImageSelected:0] forState:0];
    [(UIButton *)self->_themeWhiteButton setImage:[(THDisplaySettingsViewController *)self _whiteThemeButtonImageSelected:1] forState:4];
    [(UIButton *)self->_themeWhiteButton addTarget:self action:"setThemeNormal:" forControlEvents:64];
    [(UIButton *)self->_themeWhiteButton setTitleColor:+[UIColor blackColor] forState:0];
    -[UIButton setAccessibilityLabel:](self->_themeWhiteButton, "setAccessibilityLabel:", [(id)THBundle() localizedStringForKey:@"White" value:&stru_46D7E8 table:0]);
    [(UIButton *)self->_themeWhiteButton setAccessibilityIdentifier:@"theme well white"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeWhiteButton];
    id v6 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 46.0, 55.0];
    self->_themeSepiaButton = v6;
    [(UIButton *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_themeSepiaButton setImage:[(THDisplaySettingsViewController *)self _sepiaThemeButtonImageSelected:0] forState:0];
    [(UIButton *)self->_themeSepiaButton setImage:[(THDisplaySettingsViewController *)self _sepiaThemeButtonImageSelected:1] forState:4];
    [(UIButton *)self->_themeSepiaButton addTarget:self action:"setThemeSepia:" forControlEvents:64];
    [(UIButton *)self->_themeSepiaButton setTitleColor:+[UIColor blackColor] forState:0];
    -[UIButton setAccessibilityLabel:](self->_themeSepiaButton, "setAccessibilityLabel:", [(id)THBundle() localizedStringForKey:@"Sepia" value:&stru_46D7E8 table:0]);
    [(UIButton *)self->_themeSepiaButton setAccessibilityIdentifier:@"theme well sepia"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeSepiaButton];
    CGRect v7 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 46.0, 55.0];
    self->_themeGrayButton = v7;
    [(UIButton *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_themeGrayButton setImage:[(THDisplaySettingsViewController *)self _grayThemeButtonImageSelected:0] forState:0];
    [(UIButton *)self->_themeGrayButton setImage:[(THDisplaySettingsViewController *)self _grayThemeButtonImageSelected:1] forState:4];
    [(UIButton *)self->_themeGrayButton addTarget:self action:"setThemeGray:" forControlEvents:64];
    [(UIButton *)self->_themeGrayButton setTitleColor:+[UIColor blackColor] forState:0];
    -[UIButton setAccessibilityLabel:](self->_themeGrayButton, "setAccessibilityLabel:", [(id)THBundle() localizedStringForKey:@"Gray" value:&stru_46D7E8 table:0]);
    [(UIButton *)self->_themeGrayButton setAccessibilityIdentifier:@"theme well gray"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeGrayButton];
    v8 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, 46.0, 55.0];
    self->_themeNightButton = v8;
    [(UIButton *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_themeNightButton setImage:[(THDisplaySettingsViewController *)self _nightThemeButtonImageSelected:0] forState:0];
    [(UIButton *)self->_themeNightButton setImage:[(THDisplaySettingsViewController *)self _nightThemeButtonImageSelected:1] forState:4];
    [(UIButton *)self->_themeNightButton addTarget:self action:"setThemeNight:" forControlEvents:64];
    [(UIButton *)self->_themeNightButton setTitleColor:+[UIColor blackColor] forState:0];
    -[UIButton setAccessibilityLabel:](self->_themeNightButton, "setAccessibilityLabel:", [(id)THBundle() localizedStringForKey:@"Night" value:&stru_46D7E8 table:0]);
    [(UIButton *)self->_themeNightButton setAccessibilityIdentifier:@"theme well night"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeNightButton];
    v9[0] = [self->_themeContainer widthAnchor constraintEqualToConstant:244.0];
    v9[1] = [self->_themeContainer heightAnchor constraintEqualToConstant:55.0];
    v9[2] = [self->_themeWhiteButton widthAnchor].constraintEqualToConstant(46.0);
    v9[3] = [self->_themeWhiteButton heightAnchor].constraintEqualToConstant:55.0;
    v9[4] = [self->_themeSepiaButton widthAnchor].constraintEqualToConstant(46.0);
    v9[5] = [self->_themeSepiaButton heightAnchor constraintEqualToConstant:55.0];
    v9[6] = [self->_themeGrayButton widthAnchor].constraintEqualToConstant:46.0;
    v9[7] = [self->_themeGrayButton heightAnchor].constraintEqualToConstant(55.0);
    v9[8] = [self->_themeNightButton widthAnchor] constraintEqualToConstant:46.0;
    v9[9] = [self->_themeNightButton heightAnchor constraintEqualToConstant:55.0];
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v9 count:10]);
    [(THDisplaySettingsViewController *)self updateThemeButtons];
    return self->_themeContainer;
  }
  return result;
}

- (void)setAppearanceStyle:(int64_t)a3
{
  if (self->_appearanceStyle != a3)
  {
    self->_appearanceStyle = a3;
    [(THDisplaySettingsViewController *)self updateThemeButtons];
  }
}

- (void)_changeAppearanceStyle:(int64_t)a3
{
  -[THDisplaySettingsViewController setAppearanceStyle:](self, "setAppearanceStyle:");
  [+[BCThemeCoordinator shared](BCThemeCoordinator, "shared") observer:self didChangeStyle:a3];
  id v5 = [(THDisplaySettingsViewController *)self delegate];
  int64_t v6 = [(THDisplaySettingsViewController *)self appearanceStyle];

  [v5 displaySettingsController:self didChangeStyle:v6];
}

- (void)stylizeForTheme
{
  v4.receiver = self;
  v4.super_class = (Class)THDisplaySettingsViewController;
  [(THDisplaySettingsViewController *)&v4 stylizeForTheme];
  id v3 = [(THDisplaySettingsViewController *)self themePage];
  [self popoverPresentationController].backgroundColor = [v3 tableViewCellBackgroundColor];
  [(UIButton *)self->_themeWhiteButton setImage:[(THDisplaySettingsViewController *)self _whiteThemeButtonImageSelected:0] forState:0];
  [(UIButton *)self->_themeWhiteButton setImage:[(THDisplaySettingsViewController *)self _whiteThemeButtonImageSelected:1] forState:4];
  [(UIButton *)self->_themeSepiaButton setImage:[(THDisplaySettingsViewController *)self _sepiaThemeButtonImageSelected:0] forState:0];
  [(UIButton *)self->_themeSepiaButton setImage:[(THDisplaySettingsViewController *)self _sepiaThemeButtonImageSelected:1] forState:4];
  [(UIButton *)self->_themeGrayButton setImage:[(THDisplaySettingsViewController *)self _grayThemeButtonImageSelected:0] forState:0];
  [(UIButton *)self->_themeGrayButton setImage:[(THDisplaySettingsViewController *)self _grayThemeButtonImageSelected:1] forState:4];
  [(UIButton *)self->_themeNightButton setImage:[(THDisplaySettingsViewController *)self _nightThemeButtonImageSelected:0] forState:0];
  [(UIButton *)self->_themeNightButton setImage:[(THDisplaySettingsViewController *)self _nightThemeButtonImageSelected:1] forState:4];
  [self sizeSeparatorLine].backgroundColor = [v3 tableViewSeparatorColor];
  [self brightnessSlider].tintColor = [v3 tintColor];
  [self tableView].reloadData;
}

- (void)setTheme:(id)a3
{
  if ([(THDisplaySettingsViewController *)self theme] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)THDisplaySettingsViewController;
    [(THDisplaySettingsViewController *)&v5 setTheme:a3];
    [(THDisplaySettingsViewController *)self stylizeForTheme];
  }
}

- (void)setThemeNormal:(id)a3
{
  [self.delegate displaySettingsController:self willChangeStyle:0];
  if ((char *)[(THDisplaySettingsViewController *)self appearanceStyle] == (char *)&dword_0 + 3)
  {
    [(THDisplaySettingsViewController *)self setAutoNightModeSwitch:1];
    [(THDisplaySettingsViewController *)self _restoreAutoNightModeSwitch];
  }

  [(THDisplaySettingsViewController *)self _changeAppearanceStyle:0];
}

- (void)setThemeGray:(id)a3
{
  [self.delegate displaySettingsController:self willChangeStyle:2];
  if ((char *)[(THDisplaySettingsViewController *)self appearanceStyle] == (char *)&dword_0 + 3)
  {
    [(THDisplaySettingsViewController *)self setAutoNightModeSwitch:1];
    [(THDisplaySettingsViewController *)self _restoreAutoNightModeSwitch];
  }

  [(THDisplaySettingsViewController *)self _changeAppearanceStyle:2];
}

- (void)setThemeSepia:(id)a3
{
  [self.delegate displaySettingsController:self willChangeStyle:1];
  if ((char *)[(THDisplaySettingsViewController *)self appearanceStyle] == (char *)&dword_0 + 3)
  {
    [(THDisplaySettingsViewController *)self setAutoNightModeSwitch:1];
    [(THDisplaySettingsViewController *)self _restoreAutoNightModeSwitch];
  }

  [(THDisplaySettingsViewController *)self _changeAppearanceStyle:1];
}

- (void)setThemeNight:(id)a3
{
  [self.delegate displaySettingsController:self willChangeStyle:3];
  if ((char *)[(THDisplaySettingsViewController *)self appearanceStyle] != (char *)&dword_0 + 3)
  {
    [(THDisplaySettingsViewController *)self _turnAutoNightModeSwitchOff];
    [(THDisplaySettingsViewController *)self setAutoNightModeSwitch:0];
  }

  [(THDisplaySettingsViewController *)self _changeAppearanceStyle:3];
}

- (void)updateThemeButtons
{
  int64_t v3 = [(THDisplaySettingsViewController *)self appearanceStyle];
  [(UIButton *)self->_themeWhiteButton setSelected:v3 == 0];
  [(UIButton *)self->_themeSepiaButton setSelected:v3 == 1];
  [(UIButton *)self->_themeGrayButton setSelected:v3 == 2];
  themeNightButton = self->_themeNightButton;

  [(UIButton *)themeNightButton setSelected:v3 == 3];
}

- (id)_whiteThemeButtonImageSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIColor colorWithWhite:1.0 alpha:1.0];

  return [(THDisplaySettingsViewController *)self _themeButtonImageWithColor:v5 selected:v3];
}

- (id)_sepiaThemeButtonImageSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIColor colorWithRed:0.831372549 green:0.776470588 blue:0.623529412 alpha:1.0];

  return [(THDisplaySettingsViewController *)self _themeButtonImageWithColor:v5 selected:v3];
}

- (id)_grayThemeButtonImageSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIColor colorWithRed:0.352941176 green:0.352941176 blue:0.360784314 alpha:1.0];

  return [(THDisplaySettingsViewController *)self _themeButtonImageWithColor:v5 selected:v3];
}

- (id)_nightThemeButtonImageSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[UIColor colorWithWhite:0.2 alpha:1.0];

  return [(THDisplaySettingsViewController *)self _themeButtonImageWithColor:v5 selected:v3];
}

- (id)_themeButtonImageWithColor:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  [+[UIScreen mainScreen] scale];
  double v8 = v7;
  v19.width = 46.0;
  v19.height = 46.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  if (v4)
  {
    v9 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0);
    objc_msgSend(objc_msgSend(-[THDisplaySettingsViewController theme](self, "theme"), "keyColor"), "setFill");
    [(UIBezierPath *)v9 fill];
    double v10 = 42.0;
    double v11 = 2.0;
    double v12 = 2.0;
  }
  else
  {
    double v13 = 1.0 / v8;
    v14 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    v15 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0);
    [(UIColor *)v14 setFill];
    [(UIBezierPath *)v15 fill];
    double v10 = v13 * -2.0 + 46.0;
    double v11 = v13;
    double v12 = v13;
  }
  v16 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12, v10, v10);
  [a3 setFill];
  [(UIBezierPath *)v16 fill];
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (id)autoNightModeSwitch
{
  autoNightModeSwitch = self->_autoNightModeSwitch;
  if (!autoNightModeSwitch)
  {
    BOOL v4 = [(UISwitch *)[objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    self->_autoNightModeSwitch = v4;
    [(UISwitch *)v4 addTarget:self action:"handleAutoNightModeSwitch:" forControlEvents:4096];
    [(UISwitch *)self->_autoNightModeSwitch sizeToFit];
    [(UISwitch *)self->_autoNightModeSwitch setEnabled:[+[NSUserDefaults standardUserDefaults] BOOLForKey:@"THAppearanceDisableAutoNightModeSwitchKey"] ^ 1];
    autoNightModeSwitch = self->_autoNightModeSwitch;
  }
  -[UISwitch setOn:[self.delegate autoNightModeEnabled:self]];
  return self->_autoNightModeSwitch;
}

- (void)handleAutoNightModeSwitch:(id)a3
{
  [+[NSUserDefaults standardUserDefaults] setBool:[(UISwitch *)self->_autoNightModeSwitch isOn] forKey:@"THAppearanceAutoNightModeSwitchWasOnKey"];
  id v4 = [(THDisplaySettingsViewController *)self delegate];
  BOOL v5 = [(UISwitch *)self->_autoNightModeSwitch isOn];

  [v4 displaySettingsController:self didChangeAutoNightMode:v5];
}

- (void)coordinator:(id)a3 observerDidIncreaseFontSize:(id)a4
{
}

- (void)coordinator:(id)a3 observerDidDecreaseFontSize:(id)a4
{
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  BOOL v5 = (a5 & 0xFFFFFFFFFFFFFFFELL) == 2;
  id v6 = [(THDisplaySettingsViewController *)self scrollSwitch];

  [v6 setOn:v5];
}

- (BOOL)p_presentingFullscreen
{
  return [(THDisplaySettingsViewController *)self modalPresentationStyle] != (char *)&dword_4 + 3;
}

- (double)p_bestPopoverHeightForSections:(id)a3
{
  uint64_t v5 = [(NSArray *)[(THDisplaySettingsViewController *)self supportedSections] count];
  if (v5 < 1)
  {
    double v8 = 0.0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      [(THDisplaySettingsViewController *)self tableView:[(THDisplaySettingsViewController *)self tableView] heightForHeaderInSection:v7];
      double v8 = v8 + v9;
      ++v7;
    }
    while (v6 != v7);
  }
  if ([a3 containsObject:&off_499090])
  {
    [(THDisplaySettingsViewController *)self appearanceRowHeight];
    double v8 = v8 + v10;
  }
  if ([a3 containsObject:&off_4990A8])
  {
    double v8 = v8 + 60.0;
    if ([(THDisplaySettingsViewController *)self _shouldShowAutoNightMode])
    {
      [(THDisplaySettingsViewController *)self scrollingRowHeight];
      double v8 = v8 + v11;
    }
  }
  if ([a3 containsObject:&off_4990C0])
  {
    [(THDisplaySettingsViewController *)self scrollingRowHeight];
    double v8 = v8 + v12;
  }
  if ([a3 containsObject:&off_4990D8])
  {
    [(THDisplaySettingsViewController *)self appearanceRowHeight];
    return v8 + v13;
  }
  return v8;
}

- (void)p_resizePopoverViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(THDisplaySettingsViewController *)self p_buildSupportedSections];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  CGSize v19 = sub_62A14;
  v20 = &unk_456E38;
  v21 = self;
  id v22 = v5;
  if ([(THDisplaySettingsViewController *)self p_presentingFullscreen])
  {
    v19((uint64_t)v18);
  }
  else
  {
    [self view].frame
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    [(THDisplaySettingsViewController *)self p_bestPopoverHeightForSections:v5];
    double v11 = v10;
    [(THDisplaySettingsViewController *)self appearanceRowHeight];
    if (v11 == v12) {
      BOOL v3 = 0;
    }
    [self view].frame;
    if (v11 != v13
      || ([(THDisplaySettingsViewController *)self preferredContentSize], v11 != v14))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_62A5C;
      v17[3] = &unk_457188;
      v17[4] = self;
      v17[5] = v7;
      v17[6] = v9;
      v17[7] = 0x4072800000000000;
      *(double *)&v17[8] = v11;
      if (v3)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_62A68;
        v16[3] = &unk_457CF8;
        v16[4] = v18;
        +[UIView animateWithDuration:v17 animations:v16 completion:0.3];
      }
      else
      {
        v19((uint64_t)v18);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_62A78;
        v15[3] = &unk_457868;
        v15[4] = v17;
        +[UIView performWithoutAnimation:v15];
      }
    }
  }
}

- (unint64_t)p_displaySectionForSection:(int64_t)a3
{
  if ([(NSArray *)[(THDisplaySettingsViewController *)self supportedSections] count] <= a3) {
    return 0;
  }
  id v5 = [(NSArray *)[(THDisplaySettingsViewController *)self supportedSections] objectAtIndexedSubscript:a3];

  return (unint64_t)[v5 unsignedIntegerValue];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((char *)[(THDisplaySettingsViewController *)self p_displaySectionForSection:a4] != (char *)&dword_0 + 1) {
    return 1;
  }
  if ([(THDisplaySettingsViewController *)self _shouldShowAutoNightMode]) {
    return 2;
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:0];
  [v6 setSelectionStyle:0];
  id v7 = [v6 contentView];
  switch(-[THDisplaySettingsViewController p_displaySectionForSection:](self, "p_displaySectionForSection:", [a4 section]))
  {
    case 0uLL:
      id v8 = [(THDisplaySettingsViewController *)self brightnessSlider];
      if (v8)
      {
        uint64_t v9 = v8;
        [v7 addSubview:v8];
        v17[0] = objc_msgSend(objc_msgSend(v9, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "leadingAnchor"));
        v17[1] = objc_msgSend(objc_msgSend(v9, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "trailingAnchor"));
        v17[2] = objc_msgSend(objc_msgSend(v9, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
        v17[3] = objc_msgSend(objc_msgSend(v9, "bottomAnchor"), "constraintEqualToAnchor:constant:", objc_msgSend(v7, "bottomAnchor"), -1.0);
        double v10 = v17;
        goto LABEL_9;
      }
      break;
    case 1uLL:
      if (![a4 row])
      {
        id v14 = [(THDisplaySettingsViewController *)self themeContainer];
        [v7 addSubview:v14];
        v16[0] = objc_msgSend(objc_msgSend(v14, "centerXAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "centerXAnchor"));
        v16[1] = objc_msgSend(objc_msgSend(v14, "centerYAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "centerYAnchor"));
        double v12 = +[NSArray arrayWithObjects:v16 count:2];
        goto LABEL_10;
      }
      if ([a4 row] == (char *)&dword_0 + 1)
      {
        objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Auto-Night Theme", &stru_46D7E8, 0));
        [v6 setAccessoryView:[self autoNightModeSwitch]];
      }
      break;
    case 2uLL:
      [(THDisplaySettingsViewController *)self configureVerticalScrollSwitchCell:v6];
      break;
    case 3uLL:
      id v11 = [(THDisplaySettingsViewController *)self fontSizeButtons];
      [v7 addSubview:v11];
      v15[0] = objc_msgSend(objc_msgSend(v11, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "leadingAnchor"));
      v15[1] = objc_msgSend(objc_msgSend(v11, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v7, "layoutMarginsGuide"), "trailingAnchor"));
      v15[2] = objc_msgSend(objc_msgSend(v11, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "topAnchor"));
      v15[3] = objc_msgSend(objc_msgSend(v11, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v7, "bottomAnchor"));
      double v10 = v15;
LABEL_9:
      double v12 = +[NSArray arrayWithObjects:v10 count:4];
LABEL_10:
      +[NSLayoutConstraint activateConstraints:v12];
      break;
    default:
      return v6;
  }
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(THDisplaySettingsViewController *)self supportedSections];

  return [(NSArray *)v3 count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [(THDisplaySettingsViewController *)self appearanceRowHeight];
  double v7 = v6;
  unint64_t v8 = -[THDisplaySettingsViewController p_displaySectionForSection:](self, "p_displaySectionForSection:", [a4 section]);
  if (v8 != 2)
  {
    if (v8 == 1)
    {
      if ([a4 row])
      {
        if ([a4 row] == (char *)&dword_0 + 1) {
          goto LABEL_5;
        }
      }
      else
      {
        return 60.0;
      }
    }
    return v7;
  }
LABEL_5:

  [(THDisplaySettingsViewController *)self scrollingRowHeight];
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 5.0;
  if (!a4) {
    return 0.0;
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  [self theme:a3, a4, a5].stylizeTableViewCell:a4;
  [+[UIFont preferredFontForTextStyle:UIFontTextStyleBody] _scaledValueForValue:18.0];
  double v6 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  id v7 = [a4 textLabel];

  [v7 setFont:v6];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = [(THDisplaySettingsViewController *)self tableViewHeaderView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v4;
}

- (double)appearanceRowHeight
{
  unsigned int v2 = +[UIFont bc_accessibilityFontSizesEnabled];
  double result = 44.0;
  if (v2) {
    return 65.0;
  }
  return result;
}

- (int64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (NSArray)supportedSections
{
  return self->_supportedSections;
}

- (void)setSupportedSections:(id)a3
{
}

@end