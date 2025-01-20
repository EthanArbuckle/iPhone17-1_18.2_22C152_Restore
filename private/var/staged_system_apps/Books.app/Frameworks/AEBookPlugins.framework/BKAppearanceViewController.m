@interface BKAppearanceViewController
+ (int)_fontSizeToSegmentIndex:(float)a3;
- (AEBookInfo)book;
- (BKAppearanceFontViewController)fontVC;
- (BKAppearanceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKAppearanceViewControllerDelegate)delegate;
- (BOOL)_shouldShowAutoNightMode;
- (BOOL)advancedFonts;
- (BOOL)shownCannotDownloadFontAlert;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)contentSize;
- (ContentStyle)style;
- (NSArray)currentItems;
- (NSArray)fonts;
- (NSArray)menuItems;
- (UIButton)themeGrayButton;
- (UIButton)themeNightButton;
- (UIButton)themeSepiaButton;
- (UIButton)themeWhiteButton;
- (UIStackView)themeContainer;
- (UISwitch)autoNightModeSwitch;
- (UIView)bottomThemeHairline;
- (UIView)topThemeHairline;
- (double)appearanceColorContainerHeight;
- (double)appearanceColorPotHeight;
- (double)appearanceColorPotSeparator;
- (double)appearanceColorPotWidth;
- (double)fontAppearanceWidthPadding;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_grayThemeButtonImageSelected:(BOOL)a3;
- (id)_nightThemeButtonImageSelected:(BOOL)a3;
- (id)_sepiaThemeButtonImageSelected:(BOOL)a3;
- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4;
- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selected:(BOOL)a5;
- (id)_whiteThemeButtonImageSelected:(BOOL)a3;
- (id)fontObserver;
- (id)keyCommands;
- (id)styleManager;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int)maxVisibleFonts;
- (int64_t)colorPotOffsetMultiplier:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)appearanceStyle;
- (unint64_t)layout;
- (unint64_t)supportedInterfaceOrientations;
- (void)_changeAppearanceStyle:(unint64_t)a3;
- (void)_restoreAutoNightModeSwitch;
- (void)_sendActionsForAutoNightSwitchWithPreviousState:(BOOL)a3;
- (void)_setPopoverScrolling;
- (void)_turnAutoNightModeSwitchOff;
- (void)appearanceFontViewController:(id)a3 didChangeToFontWithName:(id)a4;
- (void)appearanceShouldDismissPopover;
- (void)changeFontSize:(id)a3;
- (void)changeLegibility:(id)a3;
- (void)changeLineHeight:(id)a3;
- (void)contentSizeCategoryDidChange;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5;
- (void)dealloc;
- (void)decreaseFontSize:(id)a3;
- (void)defaultFontSize:(id)a3;
- (void)disableAutoNightModeSwitch;
- (void)dismissMenu:(id)a3;
- (void)enableAutoNightModeSwitch;
- (void)fontSizeModifiedByOffset:(float)a3;
- (void)handleAutoNightModeSwitch:(id)a3;
- (void)increaseFontSize:(id)a3;
- (void)lineHeightModifiedByOffset:(float)a3;
- (void)loadFonts;
- (void)loadView;
- (void)onScrollSwitch:(id)a3;
- (void)onScrollSwitch:(id)a3 notifyingCoordinator:(BOOL)a4;
- (void)releaseViews;
- (void)setAppearanceStyle:(unint64_t)a3;
- (void)setAutoNightModeSwitch:(id)a3;
- (void)setBook:(id)a3;
- (void)setBottomThemeHairline:(id)a3;
- (void)setCurrentItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFontVC:(id)a3;
- (void)setFonts:(id)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setMenuItems:(id)a3;
- (void)setScrollModeOn:(BOOL)a3 notifyingCoordinator:(BOOL)a4;
- (void)setShownCannotDownloadFontAlert:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTheme:(id)a3;
- (void)setThemeContainer:(id)a3;
- (void)setThemeGray:(id)a3;
- (void)setThemeGrayButton:(id)a3;
- (void)setThemeNight:(id)a3;
- (void)setThemeNightButton:(id)a3;
- (void)setThemeNormal:(id)a3;
- (void)setThemeSepia:(id)a3;
- (void)setThemeSepiaButton:(id)a3;
- (void)setThemeWhiteButton:(id)a3;
- (void)setTopThemeHairline:(id)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateThemeButtons;
- (void)updateUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKAppearanceViewController

- (double)appearanceColorPotSeparator
{
  return 20.0;
}

- (double)appearanceColorPotWidth
{
  return 46.0;
}

- (double)appearanceColorPotHeight
{
  return 55.0;
}

- (double)fontAppearanceWidthPadding
{
  return 60.0;
}

- (double)appearanceColorContainerHeight
{
  return 55.0;
}

- (BKAppearanceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BKAppearanceViewController;
  v4 = [(BEAppearanceViewController *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(BKAppearanceViewController *)v4 contentSize];
    -[BKAppearanceViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
    v6 = [[BKAppearanceFontViewController alloc] initWithNibName:0 bundle:0];
    fontVC = v5->_fontVC;
    v5->_fontVC = v6;

    [(BKAppearanceViewController *)v5 preferredContentSize];
    -[BKAppearanceFontViewController setPreferredContentSize:](v5->_fontVC, "setPreferredContentSize:");
    [(BKAppearanceFontViewController *)v5->_fontVC setDelegate:v5];
    v8 = +[BCThemeCoordinator shared];
    [v8 addObserver:v5];
  }
  return v5;
}

- (void)releaseViews
{
  currentItems = self->_currentItems;
  self->_currentItems = 0;

  [(UIButton *)self->_themeWhiteButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  themeWhiteButton = self->_themeWhiteButton;
  self->_themeWhiteButton = 0;

  [(UIButton *)self->_themeSepiaButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  themeSepiaButton = self->_themeSepiaButton;
  self->_themeSepiaButton = 0;

  [(UIButton *)self->_themeGrayButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  themeGrayButton = self->_themeGrayButton;
  self->_themeGrayButton = 0;

  [(UIButton *)self->_themeNightButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  themeNightButton = self->_themeNightButton;
  self->_themeNightButton = 0;

  themeContainer = self->_themeContainer;
  self->_themeContainer = 0;

  topThemeHairline = self->_topThemeHairline;
  self->_topThemeHairline = 0;

  bottomThemeHairline = self->_bottomThemeHairline;
  self->_bottomThemeHairline = 0;

  autoNightModeSwitch = self->_autoNightModeSwitch;
  self->_autoNightModeSwitch = 0;

  v12.receiver = self;
  v12.super_class = (Class)BKAppearanceViewController;
  [(BEAppearanceViewController *)&v12 releaseViews];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[BCThemeCoordinator shared];
  [v4 removeObserver:self];

  [(BKAppearanceViewController *)self setFonts:0];
  [(BKAppearanceViewController *)self releaseViews];
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceViewController;
  [(BEAppearanceViewController *)&v5 dealloc];
}

- (void)_setPopoverScrolling
{
  if (((isPad() & 1) != 0 || isPortrait())
    && (+[UIFont bc_accessibilityFontSizesEnabled] & 1) == 0)
  {
    v3 = [(BEAppearanceViewController *)self tableView];
    id v5 = v3;
    uint64_t v4 = 0;
  }
  else
  {
    v3 = [(BEAppearanceViewController *)self tableView];
    id v5 = v3;
    uint64_t v4 = 1;
  }
  [v3 setScrollEnabled:v4];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)BKAppearanceViewController;
  [(BEAppearanceViewController *)&v4 loadView];
  [(BKAppearanceViewController *)self _setPopoverScrolling];
  v3 = [(BEAppearanceViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"BKAppearanceTableViewCell"];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)BKAppearanceViewController;
  [(BEAppearanceViewController *)&v8 viewDidLoad];
  v3 = [(BKAppearanceViewController *)self view];
  [v3 setAccessibilityIgnoresInvertColors:1];

  objc_super v4 = [(BKAppearanceViewController *)self navigationController];
  id v5 = [v4 navigationBar];

  v6 = objc_opt_new();
  [v5 setBackgroundImage:v6 forBarMetrics:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)contentSizeCategoryDidChange
{
  [(BEAppearanceViewController *)self releaseAuxiliaryCachedViews];
  [(BKAppearanceViewController *)self updateUI];
  [(BEAppearanceViewController *)self updateBrightness];

  [(BKAppearanceViewController *)self _setPopoverScrolling];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)advancedFonts
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKFontControlAdvanced"];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewController;
  -[BEAppearanceViewController viewWillAppear:](&v6, "viewWillAppear:");
  id v5 = [(BKAppearanceViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];

  [(BKAppearanceViewController *)self updateUI];
  [(BKAppearanceViewController *)self stylizeForTheme];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewController;
  [(BKAppearanceViewController *)&v6 viewDidAppear:a3];
  if (!self->_fonts)
  {
    objc_super v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_45C10;
    block[3] = &unk_1DAB88;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (CGSize)contentSize
{
  BOOL v3 = [(BEAppearanceViewController *)self tableView];
  uint64_t v4 = [(BKAppearanceViewController *)self numberOfSectionsInTableView:v3];

  if (v4 < 1)
  {
    double v6 = 0.0;
  }
  else
  {
    uint64_t v5 = 0;
    double v6 = 0.0;
    do
    {
      v7 = [(BEAppearanceViewController *)self tableView];
      uint64_t v8 = [(BKAppearanceViewController *)self tableView:v7 numberOfRowsInSection:v5];

      if (v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          objc_super v10 = [(BEAppearanceViewController *)self tableView];
          v11 = +[NSIndexPath indexPathForRow:i inSection:v5];
          [(BKAppearanceViewController *)self tableView:v10 heightForRowAtIndexPath:v11];
          double v13 = v12;

          double v6 = v6 + v13;
        }
      }
      v14 = [(BEAppearanceViewController *)self tableView];
      [(BKAppearanceViewController *)self tableView:v14 heightForHeaderInSection:v5];
      double v16 = v6 + v15;

      v17 = [(BEAppearanceViewController *)self tableView];
      [(BKAppearanceViewController *)self tableView:v17 heightForFooterInSection:v5];
      double v6 = v16 + v18;

      ++v5;
    }
    while (v5 != v4);
  }
  unsigned int v19 = +[UIFont bc_accessibilityFontSizesEnabled];
  double v20 = fmin(400.0, v6);
  if (v19) {
    double v21 = v20;
  }
  else {
    double v21 = v6;
  }
  double v22 = 296.0;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceViewController *)self theme];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKAppearanceViewController;
    [(BKAppearanceViewController *)&v6 setTheme:v4];
    [(BKAppearanceFontViewController *)self->_fontVC setTheme:v4];
    [(BKAppearanceViewController *)self stylizeForTheme];
  }
}

- (int64_t)colorPotOffsetMultiplier:(int64_t)a3
{
  id v4 = [(BKAppearanceViewController *)self view];
  UIUserInterfaceLayoutDirection v5 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v4 semanticContentAttribute]);

  if (v5 == UIUserInterfaceLayoutDirectionRightToLeft) {
    return 3 - a3;
  }
  else {
    return a3;
  }
}

- (UIStackView)themeContainer
{
  themeContainer = self->_themeContainer;
  if (!themeContainer)
  {
    id v4 = objc_alloc((Class)UIStackView);
    [(BKAppearanceViewController *)self appearanceColorPotSeparator];
    double v6 = v5;
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    double v8 = v7 * 4.0 + v6 * 3.0;
    [(BKAppearanceViewController *)self appearanceColorContainerHeight];
    objc_super v10 = (UIStackView *)[v4 initWithFrame:0.0, 0.0, v8, v9];
    v11 = self->_themeContainer;
    self->_themeContainer = v10;

    [(UIStackView *)self->_themeContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_themeContainer setDistribution:4];
    [(UIStackView *)self->_themeContainer setAlignment:3];
    [(BKAppearanceViewController *)self appearanceColorPotSeparator];
    -[UIStackView setSpacing:](self->_themeContainer, "setSpacing:");
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    double v13 = v12;
    [(BKAppearanceViewController *)self appearanceColorPotHeight];
    double v15 = v14;
    double v16 = (UIButton *)[objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, v13, v14];
    themeWhiteButton = self->_themeWhiteButton;
    self->_themeWhiteButton = v16;

    [(UIButton *)self->_themeWhiteButton setTranslatesAutoresizingMaskIntoConstraints:0];
    double v18 = self->_themeWhiteButton;
    unsigned int v19 = [(BKAppearanceViewController *)self _whiteThemeButtonImageSelected:0];
    [(UIButton *)v18 setImage:v19 forState:0];

    double v20 = self->_themeWhiteButton;
    double v21 = [(BKAppearanceViewController *)self _whiteThemeButtonImageSelected:1];
    [(UIButton *)v20 setImage:v21 forState:4];

    [(UIButton *)self->_themeWhiteButton addTarget:self action:"setThemeNormal:" forControlEvents:64];
    double v22 = self->_themeWhiteButton;
    v23 = +[UIColor blackColor];
    [(UIButton *)v22 setTitleColor:v23 forState:0];

    v24 = self->_themeWhiteButton;
    v25 = AEBundle();
    v26 = [v25 localizedStringForKey:@"White" value:&stru_1DF0D8 table:0];
    [(UIButton *)v24 setAccessibilityLabel:v26];

    [(UIButton *)self->_themeWhiteButton setAccessibilityIdentifier:@"theme well white"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeWhiteButton];
    v27 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, v13, v15];
    themeSepiaButton = self->_themeSepiaButton;
    self->_themeSepiaButton = v27;

    [(UIButton *)self->_themeSepiaButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = self->_themeSepiaButton;
    v30 = [(BKAppearanceViewController *)self _sepiaThemeButtonImageSelected:0];
    [(UIButton *)v29 setImage:v30 forState:0];

    v31 = self->_themeSepiaButton;
    v32 = [(BKAppearanceViewController *)self _sepiaThemeButtonImageSelected:1];
    [(UIButton *)v31 setImage:v32 forState:4];

    [(UIButton *)self->_themeSepiaButton addTarget:self action:"setThemeSepia:" forControlEvents:64];
    v33 = self->_themeSepiaButton;
    v34 = +[UIColor blackColor];
    [(UIButton *)v33 setTitleColor:v34 forState:0];

    v35 = self->_themeSepiaButton;
    v36 = AEBundle();
    v37 = [v36 localizedStringForKey:@"Sepia" value:&stru_1DF0D8 table:0];
    [(UIButton *)v35 setAccessibilityLabel:v37];

    [(UIButton *)self->_themeSepiaButton setAccessibilityIdentifier:@"theme well sepia"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeSepiaButton];
    v38 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, v13, v15];
    themeGrayButton = self->_themeGrayButton;
    self->_themeGrayButton = v38;

    [(UIButton *)self->_themeGrayButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = self->_themeGrayButton;
    v41 = [(BKAppearanceViewController *)self _grayThemeButtonImageSelected:0];
    [(UIButton *)v40 setImage:v41 forState:0];

    v42 = self->_themeGrayButton;
    v43 = [(BKAppearanceViewController *)self _grayThemeButtonImageSelected:1];
    [(UIButton *)v42 setImage:v43 forState:4];

    [(UIButton *)self->_themeGrayButton addTarget:self action:"setThemeGray:" forControlEvents:64];
    v44 = self->_themeGrayButton;
    v45 = +[UIColor blackColor];
    [(UIButton *)v44 setTitleColor:v45 forState:0];

    v46 = self->_themeGrayButton;
    v47 = AEBundle();
    v48 = [v47 localizedStringForKey:@"Gray" value:&stru_1DF0D8 table:0];
    [(UIButton *)v46 setAccessibilityLabel:v48];

    [(UIButton *)self->_themeGrayButton setAccessibilityIdentifier:@"theme well gray"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeGrayButton];
    v49 = [objc_alloc((Class)UIButton) initWithFrame:0.0, 0.0, v13, v15];
    themeNightButton = self->_themeNightButton;
    self->_themeNightButton = v49;

    [(UIButton *)self->_themeNightButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = self->_themeNightButton;
    v52 = [(BKAppearanceViewController *)self _nightThemeButtonImageSelected:0];
    [(UIButton *)v51 setImage:v52 forState:0];

    v53 = self->_themeNightButton;
    v54 = [(BKAppearanceViewController *)self _nightThemeButtonImageSelected:1];
    [(UIButton *)v53 setImage:v54 forState:4];

    [(UIButton *)self->_themeNightButton addTarget:self action:"setThemeNight:" forControlEvents:64];
    v55 = self->_themeNightButton;
    v56 = +[UIColor blackColor];
    [(UIButton *)v55 setTitleColor:v56 forState:0];

    v57 = self->_themeNightButton;
    v58 = AEBundle();
    v59 = [v58 localizedStringForKey:@"Night" value:&stru_1DF0D8 table:0];
    [(UIButton *)v57 setAccessibilityLabel:v59];

    [(UIButton *)self->_themeNightButton setAccessibilityIdentifier:@"theme well night"];
    [(UIStackView *)self->_themeContainer addArrangedSubview:self->_themeNightButton];
    v84 = [(UIStackView *)self->_themeContainer widthAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotSeparator];
    double v61 = v60;
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    v83 = [v84 constraintEqualToConstant:v62 * 4.0 + v61 * 3.0];
    v85[0] = v83;
    v82 = [(UIStackView *)self->_themeContainer heightAnchor];
    [(BKAppearanceViewController *)self appearanceColorContainerHeight];
    v81 = [v82 constraintEqualToConstant:];
    v85[1] = v81;
    v80 = [(UIButton *)self->_themeWhiteButton widthAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    v79 = [v80 constraintEqualToConstant:];
    v85[2] = v79;
    v78 = [(UIButton *)self->_themeWhiteButton heightAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotHeight];
    v77 = [v78 constraintEqualToConstant:];
    v85[3] = v77;
    v76 = [(UIButton *)self->_themeSepiaButton widthAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    v75 = [v76 constraintEqualToConstant:];
    v85[4] = v75;
    v74 = [(UIButton *)self->_themeSepiaButton heightAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotHeight];
    v73 = [v74 constraintEqualToConstant:];
    v85[5] = v73;
    v72 = [(UIButton *)self->_themeGrayButton widthAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    v63 = [v72 constraintEqualToConstant:];
    v85[6] = v63;
    v64 = [(UIButton *)self->_themeGrayButton heightAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotHeight];
    v65 = [v64 constraintEqualToConstant:];
    v85[7] = v65;
    v66 = [(UIButton *)self->_themeNightButton widthAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotWidth];
    v67 = [v66 constraintEqualToConstant:];
    v85[8] = v67;
    v68 = [(UIButton *)self->_themeNightButton heightAnchor];
    [(BKAppearanceViewController *)self appearanceColorPotHeight];
    v69 = [v68 constraintEqualToConstant:];
    v85[9] = v69;
    v70 = +[NSArray arrayWithObjects:v85 count:10];
    +[NSLayoutConstraint activateConstraints:v70];

    [(BKAppearanceViewController *)self updateThemeButtons];
    themeContainer = self->_themeContainer;
  }

  return themeContainer;
}

- (UISwitch)autoNightModeSwitch
{
  autoNightModeSwitch = self->_autoNightModeSwitch;
  if (!autoNightModeSwitch)
  {
    id v4 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_autoNightModeSwitch;
    self->_autoNightModeSwitch = v4;

    [(UISwitch *)self->_autoNightModeSwitch setPreferredStyle:2];
    [(UISwitch *)self->_autoNightModeSwitch addTarget:self action:"handleAutoNightModeSwitch:" forControlEvents:4096];
    [(UISwitch *)self->_autoNightModeSwitch sizeToFit];
    double v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v6 BOOLForKey:kIMThemeAutoNightModeOnKey];

    [(UISwitch *)self->_autoNightModeSwitch setOn:v7];
    [(UISwitch *)self->_autoNightModeSwitch setEnabled:1];
    autoNightModeSwitch = self->_autoNightModeSwitch;
  }

  return autoNightModeSwitch;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(BKAppearanceViewController *)self menuItems];
  if (v4)
  {
    double v5 = [(BKAppearanceViewController *)self menuItems];
    id v6 = [v5 count];
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(BKAppearanceViewController *)self menuItems];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  if (v7 == @"BKAppearanceMenuItemFont")
  {
    int64_t v8 = 2;
  }
  else if (v7 == @"BKAppearanceMenuItemTheme")
  {
    if ([(BKAppearanceViewController *)self _shouldShowAutoNightMode]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  [(BEAppearanceViewController *)self appearanceRowHeight];
  double v7 = v6;
  int64_t v8 = [(BKAppearanceViewController *)self menuItems];
  [v8 objectAtIndexedSubscript:[v5 section]];
  double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == @"BKAppearanceMenuItemTheme")
  {
    if (![v5 row])
    {
      double v7 = 60.0;
      goto LABEL_16;
    }
    if ([v5 row] != (char *)&dword_0 + 1) {
      goto LABEL_4;
    }
LABEL_11:
    [(BEAppearanceViewController *)self scrollingRowHeight];
    double v7 = v10;
    goto LABEL_16;
  }
  if (v9 == @"BKAppearanceMenuItemHorizontalScrollingView"
    || v9 == @"BKAppearanceMenuItemVerticalScrollingView")
  {
    goto LABEL_11;
  }
LABEL_4:
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled")&& v9 == @"BKAppearanceMenuItemFont"&& [v5 row] == (char *)&dword_0 + 1)
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
    {
      double v7 = 155.0;
    }
    else if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge])
    {
      double v7 = 115.0;
    }
    else
    {
      double v7 = 85.0;
    }
  }
LABEL_16:

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 5.0;
  if (!a4) {
    return 0.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v5 = [(BEAppearanceViewController *)self tableViewHeaderView];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"BKAppearanceTableViewCell" forIndexPath:v6];
  if (v7)
  {
    id v8 = v7;
    double v9 = [v7 textLabel];
    [v9 setText:0];

    double v10 = [v8 detailTextLabel];
    [v10 setText:0];

    [v8 setAccessoryView:0];
    [v8 setAccessoryType:0];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v11 = [v8 contentView];
    double v12 = [v11 subviews];

    id v13 = [v12 countByEnumeratingWithState:&v105 objects:v113 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v106 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v105 + 1) + 8 * i) removeFromSuperview];
        }
        id v14 = [v12 countByEnumeratingWithState:&v105 objects:v113 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:@"BKAppearanceTableViewCell"];
  }
  v17 = [v8 contentView];
  double v18 = [(BKAppearanceViewController *)self menuItems];
  [v18 objectAtIndexedSubscript:[v6 section]];
  unsigned int v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v19 == @"BKAppearanceMenuItemBrightness")
  {
    double v20 = [(BEAppearanceViewController *)self brightnessSlider];
    [v17 addSubview:v20];
    v96 = [v20 leadingAnchor];
    id obj = [v17 layoutMarginsGuide];
    v89 = [obj leadingAnchor];
    v87 = [v96 constraintEqualToAnchor:v89];
    v112[0] = v87;
    v84 = [v20 trailingAnchor];
    v85 = [v17 layoutMarginsGuide];
    v83 = [v85 trailingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v112[1] = v82;
    [v20 topAnchor];
    double v21 = v91 = v19;
    [v17 topAnchor];
    double v22 = v94 = v6;
    v23 = [v21 constraintEqualToAnchor:v22];
    v112[2] = v23;
    v24 = [v20 bottomAnchor];
    [v17 bottomAnchor];
    v26 = v25 = v17;
    v27 = [v24 constraintEqualToAnchor:v26 constant:-1.0];
    v112[3] = v27;
    v28 = v112;
    goto LABEL_18;
  }
  if (v19 == @"BKAppearanceMenuItemFont")
  {
    if ([v6 row])
    {
      if ([v6 row] != (char *)&dword_0 + 1) {
        goto LABEL_21;
      }
      v90 = v17;
      v92 = v19;
      id v95 = v6;
      v32 = AEBundle();
      v33 = [v32 localizedStringForKey:@"Fonts" value:&stru_1DF0D8 table:0];
      v34 = [v8 textLabel];
      [v34 setText:v33];

      uint64_t v35 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleHeadline scale:1];
      v36 = +[UIImage systemImageNamed:@"chevron.forward"];
      v88 = (void *)v35;
      uint64_t v37 = [v36 imageWithConfiguration:v35];

      v86 = (void *)v37;
      id v38 = [objc_alloc((Class)UIImageView) initWithImage:v37];
      [v8 setAccessoryView:v38];

      v39 = [(BKAppearanceViewController *)self themePage];
      v40 = [v39 tertiaryTextColor];
      v41 = [v8 accessoryView];
      [v41 setTintColor:v40];

      v42 = [(BKAppearanceViewController *)self themePage];
      v43 = [v42 secondaryTextColor];
      v44 = [v8 detailTextLabel];
      [v44 setTextColor:v43];

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id obja = [(BKAppearanceViewController *)self fonts];
      id v45 = [obja countByEnumeratingWithState:&v101 objects:v110 count:16];
      if (!v45) {
        goto LABEL_44;
      }
      id v46 = v45;
      uint64_t v47 = *(void *)v102;
      uint64_t v97 = kCTFontUIFontDesignSerif;
      while (1)
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v102 != v47) {
            objc_enumerationMutation(obja);
          }
          v49 = *(void **)(*((void *)&v101 + 1) + 8 * (void)j);
          v50 = self;
          v51 = [(BKAppearanceViewController *)self style];
          v52 = [v51 fontFamily];
          v53 = [v49 familyName];
          unsigned int v54 = [v52 isEqualToString:v53];

          if (v54)
          {
            if ([v49 kind] == (char *)&dword_0 + 1)
            {
              v55 = AEBundle();
              v56 = [v55 localizedStringForKey:@"Original" value:&stru_1DF0D8 table:0];
              v57 = [v8 detailTextLabel];
              [v57 setText:v56];

              v58 = [v8 detailTextLabel];
              v59 = [v58 font];
              [v59 pointSize];
              double v60 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
              double v61 = [v8 detailTextLabel];
              [v61 setFont:v60];

LABEL_41:
              goto LABEL_42;
            }
            v58 = [v49 displayName];
            double v62 = [v8 detailTextLabel];
            v63 = [v62 font];
            [v63 pointSize];
            double v65 = v64;

            if ([v49 kind] == &dword_4)
            {
              uint64_t v66 = +[UIFont systemFontOfSize:v97 weight:v65 design:UIFontWeightRegular];
              goto LABEL_38;
            }
            if ([v49 kind] == (char *)&dword_0 + 3)
            {
              uint64_t v66 = +[UIFont systemFontOfSize:v65];
LABEL_38:
              v59 = (void *)v66;
            }
            else
            {
              v67 = [v49 familyName];
              v59 = +[UIFont fontWithName:v67 size:v65];
            }
            v68 = [v8 detailTextLabel];
            [v68 setText:v58];

            v69 = [v59 bkEffectiveFontForText:v58];
            v70 = [v8 detailTextLabel];
            [v70 setFont:v69];

            v71 = [v8 detailTextLabel];
            [v71 setLineBreakMode:4];

            double v60 = [v8 detailTextLabel];
            [v60 setNumberOfLines:1];
            goto LABEL_41;
          }
LABEL_42:
          self = v50;
        }
        id v46 = [obja countByEnumeratingWithState:&v101 objects:v110 count:16];
        if (!v46)
        {
LABEL_44:

          unsigned int v19 = v92;
          id v6 = v95;
          v17 = v90;
          goto LABEL_21;
        }
      }
    }
    double v20 = [(BEAppearanceViewController *)self fontSizeButtons];
    [v17 addSubview:v20];
    v96 = [v20 leadingAnchor];
    id obj = [v17 layoutMarginsGuide];
    v89 = [obj leadingAnchor];
    v87 = [v96 constraintEqualToAnchor:v89];
    v111[0] = v87;
    v84 = [v20 trailingAnchor];
    v85 = [v17 layoutMarginsGuide];
    v83 = [v85 trailingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v111[1] = v82;
    [v20 topAnchor];
    double v21 = v91 = v19;
    [v17 topAnchor];
    double v22 = v94 = v6;
    v23 = [v21 constraintEqualToAnchor:v22];
    v111[2] = v23;
    v24 = [v20 bottomAnchor];
    [v17 bottomAnchor];
    v26 = v25 = v17;
    v27 = [v24 constraintEqualToAnchor:v26 constant:-1.0];
    v111[3] = v27;
    v28 = v111;
LABEL_18:
    v29 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    v17 = v25;
    id v6 = v94;

    unsigned int v19 = v91;
    v30 = v96;
    goto LABEL_19;
  }
  if (v19 == @"BKAppearanceMenuItemTheme")
  {
    if ([v6 row])
    {
      if ([v6 row] != (char *)&dword_0 + 1) {
        goto LABEL_21;
      }
      v72 = AEBundle();
      v73 = [v72 localizedStringForKey:@"Auto-Night Theme" value:&stru_1DF0D8 table:0];
      v74 = [v8 textLabel];
      [v74 setText:v73];

      double v20 = [(BKAppearanceViewController *)self autoNightModeSwitch];
      [v8 setAccessoryView:v20];
LABEL_20:

      goto LABEL_21;
    }
    double v20 = [(BKAppearanceViewController *)self themeContainer];
    [v17 addSubview:v20];
    id objb = [v20 centerXAnchor];
    v75 = [v17 centerXAnchor];
    [objb constraintEqualToAnchor:v75];
    v76 = v93 = v19;
    v109[0] = v76;
    v77 = [v20 centerYAnchor];
    [v17 centerYAnchor];
    v79 = v78 = v17;
    v80 = [v77 constraintEqualToAnchor:v79];
    v109[1] = v80;
    v81 = +[NSArray arrayWithObjects:v109 count:2];
    +[NSLayoutConstraint activateConstraints:v81];

    v17 = v78;
    unsigned int v19 = v93;

    v30 = objb;
LABEL_19:

    goto LABEL_20;
  }
  if (v19 == @"BKAppearanceMenuItemHorizontalScrollingView")
  {
    [(BEAppearanceViewController *)self configureHorizontalScrollSwitchCell:v8];
  }
  else if (v19 == @"BKAppearanceMenuItemVerticalScrollingView")
  {
    [(BEAppearanceViewController *)self configureVerticalScrollSwitchCell:v8];
  }
LABEL_21:

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(BKAppearanceViewController *)self menuItems];
  [v6 objectAtIndexedSubscript:[v5 section]];
  double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  BOOL v8 = v7 == @"BKAppearanceMenuItemFont" && [v5 row] == (char *)&dword_0 + 1;
  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([(BKAppearanceViewController *)self tableView:a3 shouldHighlightRowAtIndexPath:v6])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v5 = [(BKAppearanceViewController *)self menuItems];
  [v5 objectAtIndexedSubscript:[v13 section]];
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 == @"BKAppearanceMenuItemFont" && [v13 row] == (char *)&dword_0 + 1)
  {
    id v7 = [(BKAppearanceViewController *)self navigationController];
    BOOL v8 = [v7 topViewController];
    double v9 = v8;
    if (v8 == self->_fontVC)
    {
    }
    else
    {
      double v10 = [(BKAppearanceViewController *)self navigationController];
      v11 = [v10 viewControllers];
      unsigned __int8 v12 = [v11 containsObject:self->_fontVC];

      if (v12) {
        goto LABEL_8;
      }
      id v7 = [(BKAppearanceViewController *)self navigationController];
      [v7 pushViewController:self->_fontVC animated:1];
    }
  }
LABEL_8:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [(BKAppearanceViewController *)self theme];
  [v7 stylizeTableViewCell:v6];

  id v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [v10 _scaledValueForValue:18.0];
  BOOL v8 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  double v9 = [v6 textLabel];

  [v9 setFont:v8];
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return [(BKAppearanceViewController *)self numberOfSectionsInTableView:a3] - 1 > a4;
}

- (void)setBook:(id)a3
{
  id v5 = (AEBookInfo *)a3;
  p_book = &self->_book;
  if (self->_book != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_book, a3);
    [(BKAppearanceFontViewController *)self->_fontVC setBook:v7];
    if (self->_fonts) {
      [(BKAppearanceViewController *)self setFonts:0];
    }
    p_book = (AEBookInfo **)[(BKAppearanceViewController *)self loadFonts];
  }

  _objc_release_x2(p_book);
}

- (id)styleManager
{
  return [(AEBookInfo *)self->_book styleManager];
}

- (void)loadFonts
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fonts)
  {
    BOOL v3 = [(BKAppearanceViewController *)v2 styleManager];
    uint64_t v4 = [v3 fonts];
    id v5 = [(id)v4 mutableCopy];

    id v6 = [(BKAppearanceViewController *)v2 book];
    LOBYTE(v4) = [v6 showOriginalFontOption];

    if ((v4 & 1) == 0)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v5;
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            unsigned __int8 v12 = [v11 familyName];
            unsigned __int8 v13 = [v12 isEqualToString:&stru_1DF0D8];

            if (v13)
            {
              id v14 = v11;

              if (v14) {
                [v7 removeObject:v14];
              }
              goto LABEL_14;
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      id v14 = 0;
LABEL_14:
    }
    -[BKAppearanceViewController setFonts:](v2, "setFonts:", v5, (void)v15);
  }
  objc_sync_exit(v2);
}

- (NSArray)fonts
{
  fonts = self->_fonts;
  if (!fonts)
  {
    [(BKAppearanceViewController *)self loadFonts];
    fonts = self->_fonts;
  }

  return fonts;
}

- (id)fontObserver
{
  return self->_fontVC;
}

- (void)setFonts:(id)a3
{
  p_fonts = &self->_fonts;
  id v10 = a3;
  if (!-[NSArray isEqualToArray:](*p_fonts, "isEqualToArray:"))
  {
    [(BKAppearanceFontViewController *)self->_fontVC setFonts:v10];
    id v6 = [(BKAppearanceViewController *)self fontObserver];
    if (*p_fonts)
    {
      id v7 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(NSArray *)*p_fonts count]);
      [(NSArray *)*p_fonts removeObserver:v6 fromObjectsAtIndexes:v7 forKeyPath:@"state"];
      [(NSArray *)*p_fonts removeObserver:v6 fromObjectsAtIndexes:v7 forKeyPath:@"downloadProgress"];
      id v8 = *p_fonts;
      *p_fonts = 0;
    }
    if (v10)
    {
      uint64_t v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v10 count]);
      [v10 addObserver:v6 toObjectsAtIndexes:v9 forKeyPath:@"state" options:0 context:0];
      [v10 addObserver:v6 toObjectsAtIndexes:v9 forKeyPath:@"downloadProgress" options:0 context:0];
      objc_storeStrong((id *)p_fonts, a3);
    }
  }
}

- (void)setStyle:(id)a3
{
  id v5 = a3;
  if (!-[ContentStyle isEqual:](self->_style, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_style, a3);
    [(BKAppearanceViewController *)self updateUI];
  }
}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(BKAppearanceViewController *)self updateUI];
  }
}

- (void)setAppearanceStyle:(unint64_t)a3
{
  if (self->_appearanceStyle != a3)
  {
    self->_appearanceStyle = a3;
    [(BKAppearanceViewController *)self updateThemeButtons];
  }
}

- (void)_changeAppearanceStyle:(unint64_t)a3
{
  -[BKAppearanceViewController setAppearanceStyle:](self, "setAppearanceStyle:");
  id v5 = +[BCThemeCoordinator shared];
  [v5 observer:self didChangeStyle:a3];
}

- (void)_turnAutoNightModeSwitchOff
{
  BOOL v3 = [(UISwitch *)self->_autoNightModeSwitch isOn];
  if (v3)
  {
    [(UISwitch *)self->_autoNightModeSwitch setOn:0 animated:1];
    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:0 forKey:kIMThemeAutoNightModeOnKey];

    [(BKAppearanceViewController *)self _sendActionsForAutoNightSwitchWithPreviousState:0];
  }
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v3 forKey:@"BKAppearanceAutoNightModeSwitchWasOnKey"];
}

- (void)_restoreAutoNightModeSwitch
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"BKAppearanceAutoNightModeSwitchWasOnKey"];

  if (v4)
  {
    [(UISwitch *)self->_autoNightModeSwitch setOn:1 animated:1];
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setBool:1 forKey:kIMThemeAutoNightModeOnKey];

    [(BKAppearanceViewController *)self _sendActionsForAutoNightSwitchWithPreviousState:1];
  }
}

- (void)_sendActionsForAutoNightSwitchWithPreviousState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:[self->_autoNightModeSwitch isOn] forKey:@"BKAppearanceAutoNightModeSwitchWasOnKey"];

  id v6 = [(BKAppearanceViewController *)self delegate];
  [v6 appearanceViewController:self didChangeAutoNightMode:[self->_autoNightModeSwitch isOn] previousValue:v3];
}

- (void)enableAutoNightModeSwitch
{
  if (+[IMTheme isAutoNightModeEnabled])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 setBool:0 forKey:@"BKAppearanceDisableAutoNightModeSwitchKey"];
  }
}

- (void)disableAutoNightModeSwitch
{
  if (+[IMTheme isAutoNightModeEnabled])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 setBool:1 forKey:@"BKAppearanceDisableAutoNightModeSwitchKey"];
  }
}

- (void)setThemeNormal:(id)a3
{
  unsigned int v4 = [(BKAppearanceViewController *)self delegate];
  [v4 appearanceViewController:self willChangeTheme:0];

  id v5 = +[BCLightLevelController sharedInstance];
  unsigned __int8 v6 = [v5 isLowLight];

  if ((v6 & 1) == 0)
  {
    [(BKAppearanceViewController *)self enableAutoNightModeSwitch];
    [(BKAppearanceViewController *)self _restoreAutoNightModeSwitch];
  }

  [(BKAppearanceViewController *)self _changeAppearanceStyle:0];
}

- (void)setThemeGray:(id)a3
{
  unsigned int v4 = [(BKAppearanceViewController *)self delegate];
  [v4 appearanceViewController:self willChangeTheme:2];

  id v5 = +[BCLightLevelController sharedInstance];
  unsigned __int8 v6 = [v5 isLowLight];

  if ((v6 & 1) == 0)
  {
    [(BKAppearanceViewController *)self enableAutoNightModeSwitch];
    [(BKAppearanceViewController *)self _restoreAutoNightModeSwitch];
  }

  [(BKAppearanceViewController *)self _changeAppearanceStyle:2];
}

- (void)setThemeSepia:(id)a3
{
  unsigned int v4 = [(BKAppearanceViewController *)self delegate];
  [v4 appearanceViewController:self willChangeTheme:1];

  id v5 = +[BCLightLevelController sharedInstance];
  unsigned __int8 v6 = [v5 isLowLight];

  if ((v6 & 1) == 0)
  {
    [(BKAppearanceViewController *)self enableAutoNightModeSwitch];
    [(BKAppearanceViewController *)self _restoreAutoNightModeSwitch];
  }

  [(BKAppearanceViewController *)self _changeAppearanceStyle:1];
}

- (void)setThemeNight:(id)a3
{
  unsigned int v4 = [(BKAppearanceViewController *)self delegate];
  [v4 appearanceViewController:self willChangeTheme:3];

  id v5 = +[BCLightLevelController sharedInstance];
  unsigned __int8 v6 = [v5 isLowLight];

  if ((v6 & 1) == 0) {
    [(BKAppearanceViewController *)self _turnAutoNightModeSwitchOff];
  }

  [(BKAppearanceViewController *)self _changeAppearanceStyle:3];
}

- (void)updateThemeButtons
{
  unint64_t v3 = [(BKAppearanceViewController *)self appearanceStyle];
  [(UIButton *)self->_themeWhiteButton setSelected:v3 == 0];
  [(UIButton *)self->_themeSepiaButton setSelected:v3 == 1];
  [(UIButton *)self->_themeGrayButton setSelected:v3 == 2];
  themeNightButton = self->_themeNightButton;

  [(UIButton *)themeNightButton setSelected:v3 == 3];
}

- (BOOL)_shouldShowAutoNightMode
{
  id v2 = +[BCLightLevelController shared];
  unsigned __int8 v3 = [v2 shouldMonitorLightLevel];

  return v3;
}

- (void)appearanceFontViewController:(id)a3 didChangeToFontWithName:(id)a4
{
  id v5 = a4;
  id v6 = [(BKAppearanceViewController *)self delegate];
  [v6 appearanceViewController:self didChangeFont:v5];
}

- (void)changeFontSize:(id)a3
{
  LODWORD(v4) = dword_18E9D8[[a3 selectedSegmentIndex] == 0];

  [(BKAppearanceViewController *)self fontSizeModifiedByOffset:v4];
}

- (void)changeLineHeight:(id)a3
{
  LODWORD(v4) = dword_18E9D8[[a3 selectedSegmentIndex] == 0];

  [(BKAppearanceViewController *)self lineHeightModifiedByOffset:v4];
}

- (int)maxVisibleFonts
{
  if (isPad()) {
    return 8;
  }
  if isTallPhone() && (isPortrait()) {
    return 7;
  }
  if (isLandscape()) {
    return 4;
  }
  return 5;
}

+ (int)_fontSizeToSegmentIndex:(float)a3
{
  float v3 = floorf(a3);
  if (v3 == 12.0) {
    return 0;
  }
  if (v3 == 24.0) {
    int v5 = 2;
  }
  else {
    int v5 = -1;
  }
  if (v3 == 19.0) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)fontSizeModifiedByOffset:(float)a3
{
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 fontSize];
  float v7 = roundf((float)(v6 + a3) * 100.0) / 100.0;

  float v8 = 6.0;
  if (v7 <= 6.0) {
    float v8 = v7;
  }
  if (v8 >= 0.1) {
    float v9 = v8;
  }
  else {
    float v9 = 0.1;
  }
  id v11 = [(BKAppearanceViewController *)self styleManager];
  *(float *)&double v10 = v9;
  [v11 setFontSize:v10];
}

- (void)lineHeightModifiedByOffset:(float)a3
{
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 lineHeight];
  float v7 = (float)(roundf(v6 * 100.0) / 100.0) + a3;

  float v8 = 6.0;
  if (v7 <= 6.0) {
    float v8 = v7;
  }
  if (v8 >= 0.1) {
    float v9 = v8;
  }
  else {
    float v9 = 0.1;
  }
  id v11 = [(BKAppearanceViewController *)self styleManager];
  *(float *)&double v10 = v9;
  [v11 setLineHeight:v10];
}

- (void)defaultFontSize:(id)a3
{
  double v4 = [(BKAppearanceViewController *)self styleManager];
  [v4 setDefaultFontSize];

  id v7 = [(BKAppearanceViewController *)self delegate];
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 fontSize];
  [v7 appearanceViewController:self didChangeFontSize:v6];
}

- (void)increaseFontSize:(id)a3
{
  double v4 = [(BKAppearanceViewController *)self styleManager];
  [v4 increaseFontSize];

  id v7 = [(BKAppearanceViewController *)self delegate];
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 fontSize];
  [v7 appearanceViewController:self didChangeFontSize:v6];
}

- (void)decreaseFontSize:(id)a3
{
  double v4 = [(BKAppearanceViewController *)self styleManager];
  [v4 decreaseFontSize];

  id v7 = [(BKAppearanceViewController *)self delegate];
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 fontSize];
  [v7 appearanceViewController:self didChangeFontSize:v6];
}

- (void)changeLegibility:(id)a3
{
  id v6 = [(BKAppearanceViewController *)self styleManager];
  uint64_t v4 = [v6 optimizeLegibility] ^ 1;
  int v5 = [(BKAppearanceViewController *)self styleManager];
  [v5 setOptimizeLegibility:v4];
}

- (void)updateUI
{
  id v24 = [(BKAppearanceViewController *)self styleManager];
  id v3 = [v24 canDecreaseFontSize];
  uint64_t v4 = [(BEAppearanceViewController *)self sizeSmallerButton];
  [v4 setEnabled:v3];

  id v5 = [v24 canIncreaseFontSize];
  id v6 = [(BEAppearanceViewController *)self sizeLargerButton];
  [v6 setEnabled:v5];

  BOOL v7 = (char *)[(BKAppearanceViewController *)self layout] == (char *)&dword_0 + 2
    || (char *)[(BKAppearanceViewController *)self layout] == (char *)&dword_0 + 3;
  float v8 = [(BEAppearanceViewController *)self scrollSwitch];
  [v8 setOn:v7];

  [(BKAppearanceViewController *)self updateThemeButtons];
  float v9 = [(BEAppearanceViewController *)self tableView];
  [v9 reloadData];

  [(BKAppearanceViewController *)self contentSize];
  -[BKAppearanceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(BKAppearanceViewController *)self preferredContentSize];
  double v11 = v10;
  double v13 = v12;
  [(BKAppearanceViewController *)self fontAppearanceWidthPadding];
  -[BKAppearanceFontViewController setDesiredContentSize:](self->_fontVC, "setDesiredContentSize:", v11 + v14, v13);
  long long v15 = [(BKAppearanceViewController *)self navigationController];
  long long v16 = [v15 topViewController];

  if (v16) {
    long long v17 = v16;
  }
  else {
    long long v17 = self;
  }
  [(BKAppearanceViewController *)v17 preferredContentSize];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(BKAppearanceViewController *)self presentingViewController];
  v23 = [v22 presentedViewController];
  [v23 setPreferredContentSize:v19, v21];
}

- (void)stylizeForTheme
{
  v32.receiver = self;
  v32.super_class = (Class)BKAppearanceViewController;
  [(BEAppearanceViewController *)&v32 stylizeForTheme];
  id v3 = [(BKAppearanceViewController *)self themePage];
  uint64_t v4 = [(BKAppearanceViewController *)self navigationController];
  [v3 stylizeNavigationController:v4];

  id v5 = [(BEAppearanceViewController *)self tableView];
  id v6 = [v5 backgroundColor];
  BOOL v7 = [(BKAppearanceViewController *)self navigationController];
  float v8 = [v7 navigationBar];
  [v8 setBackgroundColor:v6];

  themeWhiteButton = self->_themeWhiteButton;
  double v10 = [(BKAppearanceViewController *)self _whiteThemeButtonImageSelected:0];
  [(UIButton *)themeWhiteButton setImage:v10 forState:0];

  double v11 = self->_themeWhiteButton;
  double v12 = [(BKAppearanceViewController *)self _whiteThemeButtonImageSelected:1];
  [(UIButton *)v11 setImage:v12 forState:4];

  themeSepiaButton = self->_themeSepiaButton;
  double v14 = [(BKAppearanceViewController *)self _sepiaThemeButtonImageSelected:0];
  [(UIButton *)themeSepiaButton setImage:v14 forState:0];

  long long v15 = self->_themeSepiaButton;
  long long v16 = [(BKAppearanceViewController *)self _sepiaThemeButtonImageSelected:1];
  [(UIButton *)v15 setImage:v16 forState:4];

  themeGrayButton = self->_themeGrayButton;
  double v18 = [(BKAppearanceViewController *)self _grayThemeButtonImageSelected:0];
  [(UIButton *)themeGrayButton setImage:v18 forState:0];

  double v19 = self->_themeGrayButton;
  double v20 = [(BKAppearanceViewController *)self _grayThemeButtonImageSelected:1];
  [(UIButton *)v19 setImage:v20 forState:4];

  themeNightButton = self->_themeNightButton;
  double v22 = [(BKAppearanceViewController *)self _nightThemeButtonImageSelected:0];
  [(UIButton *)themeNightButton setImage:v22 forState:0];

  v23 = self->_themeNightButton;
  id v24 = [(BKAppearanceViewController *)self _nightThemeButtonImageSelected:1];
  [(UIButton *)v23 setImage:v24 forState:4];

  v25 = [v3 tableViewSeparatorColor];
  v26 = [(BEAppearanceViewController *)self sizeSeparatorLine];
  [v26 setBackgroundColor:v25];

  v27 = [v3 switchColor];
  v28 = [(BEAppearanceViewController *)self scrollSwitch];
  [v28 setOnTintColor:v27];

  v29 = [v3 switchColor];
  v30 = [(BKAppearanceViewController *)self autoNightModeSwitch];
  [v30 setOnTintColor:v29];

  v31 = [(BEAppearanceViewController *)self tableView];
  [v31 reloadData];
}

- (void)handleAutoNightModeSwitch:(id)a3
{
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = kIMThemeAutoNightModeOnKey;
  id v6 = [v4 BOOLForKey:kIMThemeAutoNightModeOnKey];

  BOOL v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setBool:v6 ^ 1 forKey:v5];

  +[IMTheme setAutoNightModeEnabled:v6 ^ 1];
  float v8 = [(BKAppearanceViewController *)self delegate];
  [v8 appearanceViewController:self didChangeAutoNightMode:[self->_autoNightModeSwitch isOn] previousValue:v6];

  id v9 = +[NSUserDefaults standardUserDefaults];
  [v9 setBool:[self->_autoNightModeSwitch isOn] forKey:@"BKAppearanceAutoNightModeSwitchWasOnKey"];
}

- (void)onScrollSwitch:(id)a3
{
}

- (void)onScrollSwitch:(id)a3 notifyingCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(BEAppearanceViewController *)self scrollSwitch];
  -[BKAppearanceViewController setScrollModeOn:notifyingCoordinator:](self, "setScrollModeOn:notifyingCoordinator:", [v6 isOn], v4);
}

- (void)setScrollModeOn:(BOOL)a3 notifyingCoordinator:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = [(BKAppearanceViewController *)self book];
    id v7 = [v6 scrollModeOrientation];

    unint64_t v8 = [(BKAppearanceViewController *)self layout];
    if (v7) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    if (v7) {
      BOOL v10 = v8 != 2;
    }
    else {
      BOOL v10 = v8 != 3;
    }
  }
  else
  {
    BOOL v10 = (char *)[(BKAppearanceViewController *)self layout] != (char *)&dword_0 + 1;
    uint64_t v9 = 1;
  }
  [(BKAppearanceViewController *)self setLayout:v9];
  if (v4 && v10)
  {
    id v11 = +[BCThemeCoordinator shared];
    [v11 observer:self didChangeLayout:[self layout]];
  }
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
  BOOL v6 = (a5 & 0xFFFFFFFFFFFFFFFELL) == 2;
  id v7 = [(BEAppearanceViewController *)self scrollSwitch];
  [v7 setOn:v6];

  [(BKAppearanceViewController *)self onScrollSwitch:0 notifyingCoordinator:0];
}

- (id)keyCommands
{
  id v2 = +[NSMutableArray array];
  id v3 = AEBundle();
  BOOL v4 = [v3 localizedStringForKey:@"Dismiss menu" value:&stru_1DF0D8 table:0];
  uint64_t v5 = +[UIKeyCommand commandWithTitle:v4 image:0 action:"dismissMenu:" input:UIKeyInputEscape modifierFlags:0 propertyList:0];
  [v2 addObject:v5];

  return v2;
}

- (void)dismissMenu:(id)a3
{
  [(BKAppearanceViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v4 = [(BKAppearanceViewController *)self delegate];
  [v4 appearanceViewControllerShouldDismiss];
}

- (id)_whiteThemeButtonImageSelected:(BOOL)a3
{
  return [(BKAppearanceViewController *)self _themeButtonImageForTheme:2 selected:a3];
}

- (id)_sepiaThemeButtonImageSelected:(BOOL)a3
{
  return [(BKAppearanceViewController *)self _themeButtonImageForTheme:3 selected:a3];
}

- (id)_grayThemeButtonImageSelected:(BOOL)a3
{
  return [(BKAppearanceViewController *)self _themeButtonImageForTheme:4 selected:a3];
}

- (id)_nightThemeButtonImageSelected:(BOOL)a3
{
  return [(BKAppearanceViewController *)self _themeButtonImageForTheme:5 selected:a3];
}

- (id)_themeButtonImageForTheme:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = +[IMThemePage themeForEPUBTheme:a3];
  id v7 = [v6 buttonFillColor];
  unint64_t v8 = [v6 keyColor];
  if (!v4)
  {
    uint64_t v9 = [v6 separatorColor];

    unint64_t v8 = (void *)v9;
  }
  BOOL v10 = [(BKAppearanceViewController *)self _themeButtonImageWithColor:v7 unselectedBorderColor:v8 selected:v4];

  return v10;
}

- (id)_themeButtonImageWithColor:(id)a3 unselectedBorderColor:(id)a4 selected:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[UIScreen mainScreen];
  [v9 scale];
  double v11 = 1.0 / v10;

  v17.width = 46.0;
  v17.height = 46.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  if (v5) {
    double v11 = 2.0;
  }
  double v12 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 46.0, 46.0);
  [v7 setFill];

  [v12 fill];
  double v13 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v11, v11 * -2.0 + 46.0, v11 * -2.0 + 46.0);
  [v8 setFill];

  [v13 fill];
  double v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v14;
}

- (void)appearanceShouldDismissPopover
{
  id v2 = [(BKAppearanceViewController *)self delegate];
  [v2 appearanceViewControllerShouldDismiss];
}

- (BKAppearanceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAppearanceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AEBookInfo)book
{
  return self->_book;
}

- (ContentStyle)style
{
  return self->_style;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (unint64_t)appearanceStyle
{
  return self->_appearanceStyle;
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (BKAppearanceFontViewController)fontVC
{
  return self->_fontVC;
}

- (void)setFontVC:(id)a3
{
}

- (NSArray)currentItems
{
  return self->_currentItems;
}

- (void)setCurrentItems:(id)a3
{
}

- (UIButton)themeWhiteButton
{
  return self->_themeWhiteButton;
}

- (void)setThemeWhiteButton:(id)a3
{
}

- (UIButton)themeSepiaButton
{
  return self->_themeSepiaButton;
}

- (void)setThemeSepiaButton:(id)a3
{
}

- (UIButton)themeGrayButton
{
  return self->_themeGrayButton;
}

- (void)setThemeGrayButton:(id)a3
{
}

- (UIButton)themeNightButton
{
  return self->_themeNightButton;
}

- (void)setThemeNightButton:(id)a3
{
}

- (void)setThemeContainer:(id)a3
{
}

- (UIView)topThemeHairline
{
  return self->_topThemeHairline;
}

- (void)setTopThemeHairline:(id)a3
{
}

- (UIView)bottomThemeHairline
{
  return self->_bottomThemeHairline;
}

- (void)setBottomThemeHairline:(id)a3
{
}

- (void)setAutoNightModeSwitch:(id)a3
{
}

- (BOOL)shownCannotDownloadFontAlert
{
  return self->_shownCannotDownloadFontAlert;
}

- (void)setShownCannotDownloadFontAlert:(BOOL)a3
{
  self->_shownCannotDownloadFontAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoNightModeSwitch, 0);
  objc_storeStrong((id *)&self->_bottomThemeHairline, 0);
  objc_storeStrong((id *)&self->_topThemeHairline, 0);
  objc_storeStrong((id *)&self->_themeContainer, 0);
  objc_storeStrong((id *)&self->_themeNightButton, 0);
  objc_storeStrong((id *)&self->_themeGrayButton, 0);
  objc_storeStrong((id *)&self->_themeSepiaButton, 0);
  objc_storeStrong((id *)&self->_themeWhiteButton, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_fontVC, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_book, 0);
}

@end