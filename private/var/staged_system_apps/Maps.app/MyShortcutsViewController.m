@interface MyShortcutsViewController
- (BOOL)_canShowWhileLocked;
- (MyShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIBarButtonItem)addBarButtonItem;
- (UIBarButtonItem)dismissButton;
- (UIBarButtonItem)doneEditingBarButtonItem;
- (UIBarButtonItem)editBarButtonItem;
- (UIBarButtonItem)titleLabelButton;
- (UINavigationBar)navBar;
- (UINavigationItem)customNavItem;
- (id)keyCommands;
- (id)pinnedTitle;
- (id)preferredFocusEnvironments;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_addShortcutAction;
- (void)_captureTapActionForFavoriteItem:(id)a3;
- (void)_configureNavItemsForEditMode:(BOOL)a3;
- (void)_dismissButtonTapped;
- (void)_doneEditingButtonTapped;
- (void)_editButtonTapped;
- (void)_updateFooterInset;
- (void)_updateHeaderHairlineAnimated:(BOOL)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)loadDataSource;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAddBarButtonItem:(id)a3;
- (void)setCustomNavItem:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setDoneEditingBarButtonItem:(id)a3;
- (void)setEditBarButtonItem:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setTitleLabelButton:(id)a3;
- (void)view:(id)a3 requestsShortcutAction:(unint64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willResignCurrent:(BOOL)a3;
@end

@implementation MyShortcutsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MyShortcutsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MyShortcutsViewController;
  v4 = [(MyShortcutsViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setPresentedModally:1];

    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setTakesAvailableHeight:1];
  }
  return v5;
}

- (UIBarButtonItem)titleLabelButton
{
  titleLabelButton = self->_titleLabelButton;
  if (!titleLabelButton)
  {
    v4 = [(MyShortcutsViewController *)self pinnedTitle];
    v5 = +[LibraryUIUtilities iOSNavbarTitleButtonItemWithTitle:v4];
    v6 = self->_titleLabelButton;
    self->_titleLabelButton = v5;

    titleLabelButton = self->_titleLabelButton;
  }

  return titleLabelButton;
}

- (UIBarButtonItem)dismissButton
{
  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    v4 = +[LibraryUIUtilities closeButtonItemWithTarget:self action:"_dismissButtonTapped"];
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    dismissButton = self->_dismissButton;
  }

  return dismissButton;
}

- (UIBarButtonItem)doneEditingBarButtonItem
{
  doneEditingBarButtonItem = self->_doneEditingBarButtonItem;
  if (!doneEditingBarButtonItem)
  {
    v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneEditingButtonTapped"];
    v5 = self->_doneEditingBarButtonItem;
    self->_doneEditingBarButtonItem = v4;

    doneEditingBarButtonItem = self->_doneEditingBarButtonItem;
  }
  [(UIBarButtonItem *)doneEditingBarButtonItem setAccessibilityIdentifier:@"DoneEditingBarButton"];
  v6 = self->_doneEditingBarButtonItem;

  return v6;
}

- (UIBarButtonItem)editBarButtonItem
{
  editBarButtonItem = self->_editBarButtonItem;
  if (!editBarButtonItem)
  {
    v4 = +[LibraryUIUtilities editBarButtonItemWithTarget:self action:"_editButtonTapped"];
    v5 = self->_editBarButtonItem;
    self->_editBarButtonItem = v4;

    editBarButtonItem = self->_editBarButtonItem;
  }

  return editBarButtonItem;
}

- (UIBarButtonItem)addBarButtonItem
{
  addBarButtonItem = self->_addBarButtonItem;
  if (!addBarButtonItem)
  {
    v4 = +[LibraryUIUtilities addBarButtonItemWithTarget:self action:"_addButtonTapped"];
    v5 = self->_addBarButtonItem;
    self->_addBarButtonItem = v4;

    addBarButtonItem = self->_addBarButtonItem;
  }

  return addBarButtonItem;
}

- (id)pinnedTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Library] Pinned" value:@"localized string not found" table:0];

  return v3;
}

- (id)keyCommands
{
  v15.receiver = self;
  v15.super_class = (Class)MyShortcutsViewController;
  v3 = [(ContaineeViewController *)&v15 keyCommands];
  id v4 = [v3 mutableCopy];

  v5 = [(MyShortcutsViewController *)self presentedViewController];

  if (!v5)
  {
    unsigned int v6 = +[LibraryUIUtilities isMyPlacesEnabled];
    v7 = +[NSBundle mainBundle];
    v8 = v7;
    if (v6) {
      CFStringRef v9 = @"[Shortcuts] Add";
    }
    else {
      CFStringRef v9 = @"[Shortcuts] Add Favorite";
    }
    v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

    v11 = +[UIKeyCommand commandWithTitle:v10 image:0 action:"_addShortcutAction" input:@"a" modifierFlags:0x100000 propertyList:0];
    [v4 addObject:v11];

    v12 = [(MyShortcutsDataSource *)self->_myShortcutsDataSource keyCommands];
    [v4 addObjectsFromArray:v12];
  }
  id v13 = [v4 copy];

  return v13;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(MyShortcutsDataSource *)self->_myShortcutsDataSource keyCommands];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    CFStringRef v9 = self->_myShortcutsDataSource;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MyShortcutsViewController;
    CFStringRef v9 = [(MyShortcutsViewController *)&v12 targetForAction:a3 withSender:v6];
  }
  v10 = v9;

  return v10;
}

- (id)preferredFocusEnvironments
{
  tableView = self->_tableView;
  v2 = +[NSArray arrayWithObjects:&tableView count:1];

  return v2;
}

- (void)viewDidLoad
{
  v112.receiver = self;
  v112.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v112 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(MyShortcutsViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(MyShortcutsViewController *)self view];
  [v5 setAccessibilityIdentifier:@"MyShortcutsView"];

  id v6 = [(ContaineeViewController *)self headerView];
  v7 = [(ContaineeViewController *)self contentView];
  unsigned int v8 = [(ContaineeViewController *)self headerView];
  [v8 setAccessibilityIdentifier:@"MyShortcutsHeader"];

  CFStringRef v9 = [(ContaineeViewController *)self contentView];
  [v9 setAccessibilityIdentifier:@"MyShortcutsContent"];

  v10 = [MapsThemeTableView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v14 = -[MapsThemeTableView initWithFrame:style:](v10, "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  [(MapsThemeTableView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v15 = +[UIColor clearColor];
  [(MapsThemeTableView *)v14 setBackgroundColor:v15];

  [(MapsThemeTableView *)v14 _setHeaderAndFooterViewsFloat:0];
  [(MapsThemeTableView *)v14 setPreservesSuperviewLayoutMargins:1];
  [(MapsThemeTableView *)v14 setAccessibilityIdentifier:@"MyShortcutsTable"];
  [v7 addSubview:v14];
  v111 = v14;
  objc_storeStrong((id *)&self->_tableView, v14);
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v16 = (ContainerHeaderView *)[objc_alloc((Class)UINavigationItem) initWithTitle:&stru_101324E70];
    [(MyShortcutsViewController *)self setCustomNavItem:v16];
    [(MyShortcutsViewController *)self _configureNavItemsForEditMode:0];
    id v17 = objc_alloc_init((Class)UINavigationBar);
    [(MyShortcutsViewController *)self setNavBar:v17];

    v18 = [(MyShortcutsViewController *)self navBar];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(MyShortcutsViewController *)self navBar];
    v20 = [v19 standardAppearance];
    [v20 configureWithTransparentBackground];

    v21 = [(MyShortcutsViewController *)self navBar];
    [v21 pushNavigationItem:v16 animated:0];

    v22 = [(ContaineeViewController *)self headerView];
    v23 = [(MyShortcutsViewController *)self navBar];
    [v22 addSubview:v23];
  }
  else
  {
    v24 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(ContainerHeaderView *)v24 setAccessibilityIdentifier:@"PinsHeader"];
    [(ContainerHeaderView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)v24 setDelegate:self];
    [(ContainerHeaderView *)v24 setHeaderSize:2];
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"[Shortcuts] Favorites" value:@"localized string not found" table:0];
    [(ContainerHeaderView *)v24 setTitle:v26];

    [v6 addSubview:v24];
    titleHeaderView = self->_titleHeaderView;
    self->_titleHeaderView = v24;
    v16 = v24;

    v28 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    hideableFooterView = self->_hideableFooterView;
    self->_hideableFooterView = v28;

    [(UIView *)self->_hideableFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_hideableFooterView setAccessibilityIdentifier:@"MyShortcutsHideableFooter"];
    [v7 addSubview:self->_hideableFooterView];
    v30 = -[FooterToolBarView initWithFrame:]([ShortcutFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    footerContentView = self->_footerContentView;
    self->_footerContentView = v30;

    [(ShortcutFooterToolBarView *)self->_footerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FooterToolBarView *)self->_footerContentView setDelegate:self];
    [(UIView *)self->_hideableFooterView addSubview:self->_footerContentView];
    [(FooterToolBarView *)self->_footerContentView setState:7];
  }

  v110 = v7;
  v107 = v6;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v100 = [(MyShortcutsViewController *)self navBar];
    v32 = [v100 topAnchor];
    v33 = [v6 topAnchor];
    +[LibraryUIUtilities NavBarChromeHeaderTopYOffset];
    v96 = v32;
    v34 = [v32 constraintEqualToAnchor:v33];
    v115[0] = v34;
    v35 = [(MyShortcutsViewController *)self navBar];
    uint64_t v36 = [v35 leadingAnchor];
    uint64_t v37 = [v6 leadingAnchor];
    v108 = (void *)v36;
    v38 = (void *)v36;
    v39 = (void *)v37;
    v105 = [v38 constraintEqualToAnchor:v37];
    v115[1] = v105;
    v103 = [(MyShortcutsViewController *)self navBar];
    uint64_t v40 = [v103 trailingAnchor];
    uint64_t v41 = [v6 trailingAnchor];
    v101 = (void *)v40;
    v42 = (void *)v40;
    v43 = (void *)v41;
    v99 = [v42 constraintEqualToAnchor:v41];
    v115[2] = v99;
    v98 = [(MyShortcutsViewController *)self navBar];
    [v98 bottomAnchor];
    uint64_t v45 = v44 = v6;
    uint64_t v46 = [v44 bottomAnchor];
    v97 = (void *)v45;
    v47 = (void *)v45;
    v48 = (void *)v46;
    v95 = [v47 constraintEqualToAnchor:v46];
    v115[3] = v95;
    v94 = +[NSArray arrayWithObjects:v115 count:4];
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
  }
  else
  {
    v100 = [(UIView *)self->_hideableFooterView leadingAnchor];
    v96 = [v7 leadingAnchor];
    uint64_t v93 = [v100 constraintEqualToAnchor:v96];
    v114[0] = v93;
    v92 = [(UIView *)self->_hideableFooterView trailingAnchor];
    uint64_t v91 = [v7 trailingAnchor];
    v108 = [v92 constraintEqualToAnchor:v91];
    v114[1] = v108;
    v90 = [(UIView *)self->_hideableFooterView bottomAnchor];
    v105 = [v7 bottomAnchor];
    v103 = [v90 constraintEqualToAnchor:];
    v114[2] = v103;
    v49 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
    uint64_t v88 = [v6 topAnchor];
    v101 = v49;
    v99 = [v49 constraintEqualToAnchor:v88];
    v114[3] = v99;
    v50 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
    v97 = [v6 leadingAnchor];
    v98 = v50;
    uint64_t v84 = [v50 constraintEqualToAnchor:v97];
    v114[4] = v84;
    v51 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
    v94 = [v6 trailingAnchor];
    v95 = v51;
    v89 = [v51 constraintEqualToAnchor:v94];
    v114[5] = v89;
    v87 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
    v86 = [v6 bottomAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v114[6] = v85;
    v83 = [(UIView *)self->_hideableFooterView topAnchor];
    v82 = [(ShortcutFooterToolBarView *)self->_footerContentView topAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v114[7] = v81;
    v80 = [(UIView *)self->_hideableFooterView bottomAnchor];
    v52 = [(ShortcutFooterToolBarView *)self->_footerContentView bottomAnchor];
    v53 = [v80 constraintEqualToAnchor:v52];
    v114[8] = v53;
    v54 = [(UIView *)self->_hideableFooterView leadingAnchor];
    v55 = [(ShortcutFooterToolBarView *)self->_footerContentView leadingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    v114[9] = v56;
    v57 = [(UIView *)self->_hideableFooterView trailingAnchor];
    v58 = [(ShortcutFooterToolBarView *)self->_footerContentView trailingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    v114[10] = v59;
    v60 = +[NSArray arrayWithObjects:v114 count:11];
    +[NSLayoutConstraint activateConstraints:v60];

    v7 = v110;
    v43 = (void *)v88;

    v35 = (void *)v91;
    v48 = (void *)v84;

    v39 = v90;
    v33 = (void *)v93;

    v34 = v92;
  }

  v61 = [(MapsThemeTableView *)v111 topAnchor];
  v109 = v61;
  uint64_t v62 = [v7 topAnchor];
  v106 = (void *)v62;
  unsigned int v63 = +[LibraryUIUtilities isMyPlacesEnabled];
  double v64 = 0.0;
  if (v63) {
    double v64 = 8.0;
  }
  v104 = [v61 constraintEqualToAnchor:v62 constant:v64];
  v113[0] = v104;
  v102 = [(MapsThemeTableView *)v111 leadingAnchor];
  [v7 leadingAnchor];
  v66 = v65 = v7;
  v67 = [v102 constraintEqualToAnchor:v66];
  v113[1] = v67;
  v68 = [(MapsThemeTableView *)v111 trailingAnchor];
  v69 = [v65 trailingAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  v113[2] = v70;
  v71 = [(MapsThemeTableView *)v111 bottomAnchor];
  v72 = [v65 bottomAnchor];
  v73 = [v71 constraintEqualToAnchor:v72];
  v113[3] = v73;
  v74 = +[NSArray arrayWithObjects:v113 count:4];
  +[NSLayoutConstraint activateConstraints:v74];

  [(MyShortcutsViewController *)self _updateHeaderHairlineAnimated:0];
  v75 = +[LibraryItemsCountManager sharedManager];
  v76 = [v75 lastFetchedCounts];
  id v77 = [v76 pinnedItemsCount];

  v78 = +[MKMapService sharedService];
  v79 = +[NSString stringWithFormat:@"%ld", v77];
  [v78 captureUserAction:21 onTarget:254 eventValue:v79];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(MyShortcutsViewController *)self loadDataSource];
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v5 willBecomeCurrent:a3];
  objc_super v4 = [(MyShortcutsViewController *)self view];

  if (v4) {
    [(MyShortcutsDataSource *)self->_myShortcutsDataSource reloadData];
  }
}

- (void)willResignCurrent:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v4 willResignCurrent:a3];
  [(MyShortcutsDataSource *)self->_myShortcutsDataSource setEditing:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v3 viewDidLayoutSubviews];
  [(MyShortcutsViewController *)self _updateFooterInset];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v4 didChangeLayout:a3];
  [(MyShortcutsViewController *)self _updateFooterInset];
}

- (void)_updateFooterInset
{
  [(UIView *)self->_hideableFooterView frame];
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", 0.0, 0.0, CGRectGetHeight(v5) + 16.0, 0.0);
  [(MapsThemeTableView *)self->_tableView contentInset];
  tableView = self->_tableView;

  -[MapsThemeTableView setScrollIndicatorInsets:](tableView, "setScrollIndicatorInsets:");
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsThemeTableView *)self->_tableView _maps_shouldShowTopHairline];
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047925C;
  v7[3] = &unk_1012EB708;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100479270;
  v6[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:v3 animated:v7 getter:v6 setter:(double)v5];
}

- (void)loadDataSource
{
  BOOL v3 = [[MyShortcutsDataSource alloc] initWithTableView:self->_tableView updateLocation:0];
  myShortcutsDataSource = self->_myShortcutsDataSource;
  self->_myShortcutsDataSource = v3;

  [self->_myShortcutsDataSource setDelegate:self];
  unsigned int v5 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v5 appCoordinator];
  [(MyShortcutsDataSource *)self->_myShortcutsDataSource setShareDelegate:v6];

  [(MapsThemeTableView *)self->_tableView setDelegate:self->_myShortcutsDataSource];
  [(MapsThemeTableView *)self->_tableView setDataSource:self->_myShortcutsDataSource];
  v7 = self->_myShortcutsDataSource;

  [(DataSource *)v7 setActive:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyShortcutsViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(MyShortcutsViewController *)self _updateHeaderHairlineAnimated:1];
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_myShortcutsDataSource == a3)
  {
    [(MapsThemeTableView *)self->_tableView reloadData];
    [(MyShortcutsViewController *)self _updateHeaderHairlineAnimated:0];
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 shortcut];
    id v8 = [v7 type];

    if (v8 == (id)6)
    {
      [v6 setMoveToPreferredIndexInFavorites:1];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100479710;
      v18[3] = &unk_1012E7D28;
      id v19 = v6;
      [v19 saveWithCompletion:v18];

LABEL_15:
      goto LABEL_16;
    }
    if (+[LibraryUIUtilities isMyPlacesEnabled]
      && ([v6 shortcut],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 isSetupPlaceholder],
          v12,
          v13))
    {
      CFStringRef v9 = [(ControlContaineeViewController *)self delegate];
      [v9 viewController:self showAddShortcut:v6];
    }
    else
    {
      CFStringRef v9 = [(ControlContaineeViewController *)self delegate];
      [v9 viewController:self editShortcut:v6];
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    MapsSuggestionsEntryFromShortcut();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    CFStringRef v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:&off_1013A7150 forKeyedSubscript:@"DirectionsSessionInitiatorKey"];
    if ([v6 isShortcut])
    {
      v10 = [v6 shortcutIdentifier];
      [v9 setObject:v10 forKeyedSubscript:@"ShortcutIdentifier"];
    }
    v11 = [(ControlContaineeViewController *)self delegate];
    [v11 viewController:self openMapsSuggestionEntry:v6 withUserInfo:v9];

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v5;
    objc_super v15 = +[NSMutableDictionary dictionary];
    [v15 setObject:&off_1013A7150 forKeyedSubscript:@"DirectionsSessionInitiatorKey"];
    v16 = [v14 shortcutIdentifier];
    [v15 setObject:v16 forKeyedSubscript:@"ShortcutIdentifier"];

    id v17 = [(ControlContaineeViewController *)self delegate];
    [v17 viewController:self openFavoriteItem:v14 withUserInfo:v15];

    [(MyShortcutsViewController *)self _captureTapActionForFavoriteItem:v14];
    +[GEOAPPortal captureUserAction:478 target:254 value:0];
    +[GEOAPPortal captureUserAction:2007 target:0 value:0];
  }
LABEL_16:
}

- (void)_captureTapActionForFavoriteItem:(id)a3
{
  id v7 = a3;
  unsigned __int8 v3 = [v7 isShortcutForSetup];
  objc_super v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = [v7 type];
    if (v5 == (id)2)
    {
      uint64_t v6 = 2046;
    }
    else
    {
      objc_super v4 = v7;
      if (v5 != (id)3) {
        goto LABEL_7;
      }
      uint64_t v6 = 2047;
    }
    +[GEOAPPortal captureUserAction:v6 target:254 value:0];
    objc_super v4 = v7;
  }
LABEL_7:
}

- (void)view:(id)a3 requestsShortcutAction:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v7 = v6;
    [(MyShortcutsViewController *)self _addShortcutAction];
  }
  else if (a4 == 1)
  {
    id v7 = v6;
    [(MyShortcutsDataSource *)self->_myShortcutsDataSource setEditing:0];
    [(FooterToolBarView *)self->_footerContentView setState:7];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    id v7 = v6;
    [(MyShortcutsDataSource *)self->_myShortcutsDataSource setEditing:1];
    [(FooterToolBarView *)self->_footerContentView setState:8];
    +[GEOAPPortal captureUserAction:2058 target:254 value:0];
  }
  id v6 = v7;
LABEL_8:
}

- (void)_addShortcutAction
{
  unsigned __int8 v3 = [(ControlContaineeViewController *)self delegate];
  objc_super v4 = +[ShortcutEditSession addSession];
  [v3 viewController:self showAddShortcut:v4];

  +[GEOAPPortal captureUserAction:2044 target:254 value:0];
}

- (void)_dismissButtonTapped
{
}

- (void)_editButtonTapped
{
  [(MyShortcutsDataSource *)self->_myShortcutsDataSource setEditing:1];

  [(MyShortcutsViewController *)self _configureNavItemsForEditMode:1];
}

- (void)_doneEditingButtonTapped
{
  [(MyShortcutsDataSource *)self->_myShortcutsDataSource setEditing:0];

  [(MyShortcutsViewController *)self _configureNavItemsForEditMode:0];
}

- (void)_configureNavItemsForEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    id v5 = [(MyShortcutsViewController *)self pinnedTitle];
    id v6 = [(MyShortcutsViewController *)self customNavItem];
    [v6 setTitle:v5];

    id v7 = [(MyShortcutsViewController *)self dismissButton];
    v23 = v7;
    id v8 = +[NSArray arrayWithObjects:&v23 count:1];
    CFStringRef v9 = [(MyShortcutsViewController *)self customNavItem];
    [v9 setLeftBarButtonItems:v8];

    if (v3)
    {
      v10 = [(MyShortcutsViewController *)self doneEditingBarButtonItem];
      v22 = v10;
      uint64_t v11 = +[NSArray arrayWithObjects:&v22 count:1];
      objc_super v12 = (void *)v11;
    }
    else
    {
      v10 = [(MyShortcutsViewController *)self editBarButtonItem];
      v21[0] = v10;
      objc_super v12 = [(MyShortcutsViewController *)self addBarButtonItem];
      v21[1] = v12;
      uint64_t v11 = +[NSArray arrayWithObjects:v21 count:2];
    }
    unsigned int v13 = (void *)v11;
    id v14 = [(MyShortcutsViewController *)self customNavItem];
    [v14 setRightBarButtonItems:v13];

    if (v3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v3)
  {
    v10 = [(MyShortcutsViewController *)self pinnedTitle];
  }
  else
  {
    v10 = &stru_101324E70;
  }
  objc_super v12 = [(MyShortcutsViewController *)self customNavItem];
  [v12 setTitle:v10];

  if (v3)
  {

    v10 = [(MyShortcutsViewController *)self doneEditingBarButtonItem];
    v20 = v10;
    unsigned int v13 = +[NSArray arrayWithObjects:&v20 count:1];
  }
  else
  {
    objc_super v12 = [(MyShortcutsViewController *)self titleLabelButton];
    id v19 = v12;
    unsigned int v13 = +[NSArray arrayWithObjects:&v19 count:1];
  }
  objc_super v15 = [(MyShortcutsViewController *)self customNavItem];
  [v15 setLeftBarButtonItems:v13];

  if (v3)
  {

    v16 = &__NSArray0__struct;
  }
  else
  {

    v10 = [(MyShortcutsViewController *)self dismissButton];
    objc_super v12 = [(MyShortcutsViewController *)self editBarButtonItem];
    v18[1] = v12;
    unsigned int v13 = [(MyShortcutsViewController *)self addBarButtonItem];
    v18[2] = v13;
    v16 = +[NSArray arrayWithObjects:v18 count:3];
  }
  id v17 = [(MyShortcutsViewController *)self customNavItem];
  [v17 setRightBarButtonItems:v16];

  if (!v3)
  {

LABEL_18:
LABEL_19:
  }
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (UINavigationItem)customNavItem
{
  return self->_customNavItem;
}

- (void)setCustomNavItem:(id)a3
{
}

- (void)setEditBarButtonItem:(id)a3
{
}

- (void)setAddBarButtonItem:(id)a3
{
}

- (void)setDoneEditingBarButtonItem:(id)a3
{
}

- (void)setTitleLabelButton:(id)a3
{
}

- (void)setDismissButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_titleLabelButton, 0);
  objc_storeStrong((id *)&self->_doneEditingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addBarButtonItem, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
  objc_storeStrong((id *)&self->_customNavItem, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_myShortcutsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);

  objc_storeStrong((id *)&self->_hideableFooterView, 0);
}

@end