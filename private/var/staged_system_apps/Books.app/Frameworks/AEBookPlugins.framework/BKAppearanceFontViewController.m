@interface BKAppearanceFontViewController
- (AEBookInfo)book;
- (BEHairlineDividerView)dividerView;
- (BKAppearanceFontViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKAppearanceFontViewControllerDelegate)delegate;
- (BOOL)isDisappearing;
- (BOOL)shownCannotDownloadFontAlert;
- (CGSize)contentSize;
- (CGSize)desiredContentSize;
- (CGSize)estimatedContentSize;
- (CGSize)preferredContentSize;
- (NSArray)fonts;
- (UITableView)tableView;
- (UIView)arrowBackgroundView;
- (double)fontSizeForFontFamilyName:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)indexPathForSelectedFont;
- (id)styleManager;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)downloadFont:(id)a3;
- (void)fontDownloadFailed:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseViews;
- (void)setArrowBackgroundView:(id)a3;
- (void)setBook:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredContentSize:(CGSize)a3;
- (void)setDisappearing:(BOOL)a3;
- (void)setDividerView:(id)a3;
- (void)setFonts:(id)a3;
- (void)setShownCannotDownloadFontAlert:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setTheme:(id)a3;
- (void)stopDownloadingFont:(id)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)useSelectedFont:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKAppearanceFontViewController

- (BKAppearanceFontViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKAppearanceFontViewController;
  v4 = [(BKViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = AEBundle();
    v6 = [v5 localizedStringForKey:@"Fonts" value:&stru_1DF0D8 table:0];
    [(BKAppearanceFontViewController *)v4 setTitle:v6];
  }
  return v4;
}

- (void)dealloc
{
  [(BKAppearanceFontViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKAppearanceFontViewController;
  [(BKViewController *)&v3 dealloc];
}

- (void)loadView
{
  v40.receiver = self;
  v40.super_class = (Class)BKAppearanceFontViewController;
  [(BKAppearanceFontViewController *)&v40 loadView];
  id v3 = objc_alloc((Class)UITableView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  tableView = self->_tableView;
  self->_tableView = v7;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 45.0, 0.0, 0.0);
  id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(UITableView *)self->_tableView setTableFooterView:v9];

  v10 = [(BKAppearanceFontViewController *)self view];
  v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  arrowBackgroundView = self->_arrowBackgroundView;
  self->_arrowBackgroundView = v11;

  [(UIView *)self->_arrowBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 addSubview:self->_arrowBackgroundView];
  [v10 addSubview:self->_tableView];
  v39 = [(UITableView *)self->_tableView leadingAnchor];
  v38 = [v10 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v41[0] = v37;
  v36 = [(UITableView *)self->_tableView trailingAnchor];
  v35 = [v10 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v41[1] = v34;
  v32 = [(UITableView *)self->_tableView topAnchor];
  v33 = [v10 safeAreaLayoutGuide];
  v31 = [v33 topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v41[2] = v30;
  v28 = [(UITableView *)self->_tableView bottomAnchor];
  v29 = [v10 safeAreaLayoutGuide];
  v27 = [v29 bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v41[3] = v26;
  v25 = [(UIView *)self->_arrowBackgroundView topAnchor];
  v24 = [v10 topAnchor];
  v22 = [v25 constraintEqualToAnchor:v24];
  v41[4] = v22;
  v13 = [(UIView *)self->_arrowBackgroundView leadingAnchor];
  v14 = [v10 leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v41[5] = v15;
  v16 = [(UIView *)self->_arrowBackgroundView trailingAnchor];
  v17 = [v10 trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v41[6] = v18;
  v19 = [(UIView *)self->_arrowBackgroundView bottomAnchor];
  v20 = [(UITableView *)self->_tableView topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v41[7] = v21;
  v23 = +[NSArray arrayWithObjects:v41 count:8];

  [v10 addConstraints:v23];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)BKAppearanceFontViewController;
  [(BKAppearanceFontViewController *)&v22 viewDidLoad];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"fontDownloadFailed:" name:BEFontDownloadFailedNotification object:0];

  v4 = [(BKAppearanceFontViewController *)self navigationController];
  v5 = [v4 navigationBar];

  v6 = [(BKAppearanceFontViewController *)self dividerView];
  [v5 _setHidesShadow:1];
  [v5 addSubview:v6];
  v21 = [v6 leadingAnchor];
  v20 = [v5 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  v18 = [v6 trailingAnchor];
  v7 = [v5 trailingAnchor];
  objc_super v8 = [v18 constraintEqualToAnchor:v7];
  v23[1] = v8;
  id v9 = [v6 bottomAnchor];
  v10 = [v5 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[2] = v11;
  v12 = [v6 heightAnchor];
  v13 = +[UIScreen mainScreen];
  [v13 scale];
  double v15 = 1.0 / v14;

  v16 = [v12 constraintEqualToConstant:v15];
  v23[3] = v16;
  v17 = +[NSArray arrayWithObjects:v23 count:4];

  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewWillAppear:](&v14, "viewWillAppear:");
  [(BKAppearanceFontViewController *)self stylizeForTheme];
  v5 = [(BKAppearanceFontViewController *)self ba_analyticsTracker];

  if (!v5) {
    id v6 = [(BKAppearanceFontViewController *)self ba_setupNewAnalyticsTrackerWithName:@"ContentFontSettings"];
  }
  v7 = [(BKAppearanceFontViewController *)self navigationController];
  [v7 setNavigationBarHidden:0 animated:v3];

  [(BKAppearanceFontViewController *)self preferredContentSize];
  double v9 = v8;
  double v11 = v10;
  v12 = [(BKAppearanceFontViewController *)self presentingViewController];
  v13 = [v12 presentedViewController];
  [v13 setPreferredContentSize:v9, v11];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceFontViewController;
  -[BKAppearanceFontViewController viewDidAppear:](&v6, "viewDidAppear:");
  v5 = [(BKAppearanceFontViewController *)self indexPathForSelectedFont];
  if (v5) {
    [(UITableView *)self->_tableView scrollToRowAtIndexPath:v5 atScrollPosition:0 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKAppearanceFontViewController *)self setDisappearing:1];
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  [(BKAppearanceFontViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKAppearanceFontViewController *)self setDisappearing:0];
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  [(BKAppearanceFontViewController *)&v5 viewDidDisappear:v3];
}

- (void)releaseViews
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppearanceFontViewController;
  [(BKViewController *)&v5 releaseViews];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BEFontDownloadFailedNotification object:0];

  tableView = self->_tableView;
  self->_tableView = 0;
}

- (CGSize)preferredContentSize
{
  BOOL v3 = [(BKAppearanceFontViewController *)self tableView];
  [v3 layoutIfNeeded];

  [(BKAppearanceFontViewController *)self contentSize];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)contentSize
{
  BOOL v3 = [(BKAppearanceFontViewController *)self tableView];
  [v3 contentSize];
  double v5 = v4;
  objc_super v6 = [(BKAppearanceFontViewController *)self navigationController];
  v7 = [v6 navigationBar];
  [v7 frame];
  double v8 = v5 + CGRectGetHeight(v14);

  [(BKAppearanceFontViewController *)self desiredContentSize];
  double v10 = v9;
  [(BKAppearanceFontViewController *)self desiredContentSize];
  if (v8 >= v11) {
    double v11 = v8;
  }
  double v12 = v10;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (CGSize)estimatedContentSize
{
  BOOL v3 = [(BKAppearanceFontViewController *)self tableView];
  double v4 = [v3 visibleCells];
  double v5 = [v4 firstObject];

  if (v5)
  {
    objc_super v6 = [v5 contentView];
    [v6 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  double v9 = [(BKAppearanceFontViewController *)self fonts];
  double v10 = (double)(unint64_t)[v9 count];
  +[IMRadialProgressButton minimumBoundingBox];
  double v12 = v11;
  double v13 = _BKFontCellAppearanceFontHeight() * 0.55;
  if (v12 >= v13) {
    double v13 = v12;
  }
  if (v8 >= v13) {
    double v13 = v8;
  }
  double v14 = v13 * v10;

  double v15 = [(BKAppearanceFontViewController *)self traitCollection];
  v16 = [v15 preferredContentSizeCategory];

  double v17 = _BKFontTableViewSizePaddingForContentSizeCategory(v16);
  v18 = [(BKAppearanceFontViewController *)self navigationController];
  v19 = [v18 navigationBar];
  [v19 frame];
  double v20 = v17 + v14 + CGRectGetHeight(v27);

  [(BKAppearanceFontViewController *)self desiredContentSize];
  double v22 = v21;
  [(BKAppearanceFontViewController *)self desiredContentSize];
  if (v20 < v23) {
    double v20 = v23;
  }

  double v24 = v22;
  double v25 = v20;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"state"] & 1) != 0
    || [v10 isEqualToString:@"downloadProgress"])
  {
    if ([(BKAppearanceFontViewController *)self isVisible])
    {
      NSUInteger v13 = [(NSArray *)self->_fonts indexOfObject:v11];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F6F80;
      block[3] = &unk_1DC500;
      block[4] = self;
      block[5] = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKAppearanceFontViewController;
    [(BKAppearanceFontViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)styleManager
{
  return [(AEBookInfo *)self->_book styleManager];
}

- (id)indexPathForSelectedFont
{
  BOOL v3 = [(BKAppearanceFontViewController *)self styleManager];
  double v4 = [v3 font];

  double v5 = [(BKAppearanceFontViewController *)self fonts];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    double v8 = 0;
    do
    {
      double v9 = [(BKAppearanceFontViewController *)self fonts];
      id v10 = [v9 objectAtIndex:v7];

      id v11 = [v10 familyName];
      unsigned int v12 = [v4 isEqualToString:v11];

      if (v12)
      {
        uint64_t v13 = +[NSIndexPath indexPathForRow:v7 inSection:0];

        double v8 = (void *)v13;
      }

      ++v7;
      objc_super v14 = [(BKAppearanceFontViewController *)self fonts];
      id v15 = [v14 count];
    }
    while ((unint64_t)v15 > v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (BEHairlineDividerView)dividerView
{
  dividerView = self->_dividerView;
  if (!dividerView)
  {
    double v4 = [objc_alloc((Class)BEHairlineDividerView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_dividerView;
    self->_dividerView = v4;

    [(BEHairlineDividerView *)self->_dividerView setTranslatesAutoresizingMaskIntoConstraints:0];
    dividerView = self->_dividerView;
  }

  return dividerView;
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceFontViewController *)self theme];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKAppearanceFontViewController;
    [(BKAppearanceFontViewController *)&v6 setTheme:v4];
    [(BKAppearanceFontViewController *)self stylizeForTheme];
  }
}

- (void)stylizeForTheme
{
  BOOL v3 = [(BKAppearanceFontViewController *)self themePage];
  id v4 = [(BKAppearanceFontViewController *)self overrideUserInterfaceStyle];
  id v5 = [(BKAppearanceFontViewController *)self navigationController];
  [v5 setOverrideUserInterfaceStyle:v4];

  [v3 stylizeTableView:self->_tableView];
  objc_super v6 = [v3 tableViewCellBackgroundColor];
  [(UITableView *)self->_tableView setBackgroundColor:v6];
  unint64_t v7 = [(BKAppearanceFontViewController *)self navigationController];
  double v8 = [v7 navigationBar];

  [v8 setOverrideUserInterfaceStyle:[self overrideUserInterfaceStyle]];
  double v9 = [v3 keyColor];
  [v8 setTintColor:v9];

  [v8 setBackgroundColor:v6];
  id v10 = [v8 backgroundColor];
  id v11 = [(BKAppearanceFontViewController *)self arrowBackgroundView];
  [v11 setBackgroundColor:v10];

  NSAttributedStringKey v18 = NSForegroundColorAttributeName;
  unsigned int v12 = [v3 primaryTextColor];
  v19 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v8 setTitleTextAttributes:v13];

  objc_super v14 = [v3 separatorColor];
  id v15 = [(BKAppearanceFontViewController *)self dividerView];
  [v15 setBackgroundColor:v14];

  v16 = [(BKAppearanceFontViewController *)self navigationController];
  double v17 = [v16 viewIfLoaded];
  [v17 setBackgroundColor:v6];

  [(UITableView *)self->_tableView reloadData];
}

- (double)fontSizeForFontFamilyName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Iowan Old Style"] & 1) != 0
    || ([v3 isEqualToString:@"Charter"] & 1) != 0
    || ([v3 isEqualToString:@"Athelas"] & 1) != 0
    || (double v4 = 20.0, [v3 isEqualToString:@"Seravek"]))
  {
    double v4 = 22.0;
  }
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v5 _scaledValueForValue:v4];
  double v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"BKFontTableViewCell"];
  if (!v7) {
    double v7 = [[BKFontTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"BKFontTableViewCell"];
  }
  double v8 = [(BKAppearanceFontViewController *)self fonts];
  double v9 = [v8 objectAtIndex:[v6 row]];
  id v10 = [v9 familyName];
  id v11 = [(BKAppearanceFontViewController *)self book];
  unsigned int v12 = [v11 useGlobalContentStyle];
  unsigned int v13 = [v12 BOOLValue];

  if (v10)
  {
    objc_super v14 = v7;
    id v15 = [v9 displayName];
    v51 = v8;
    id v52 = v6;
    if ([v9 kind] == (char *)&dword_0 + 1)
    {
      v16 = AEBundle();
      double v17 = [v16 localizedStringForKey:@"Original" value:&stru_1DF0D8 table:0];

      NSAttributedStringKey v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [v18 _scaledValueForValue:20.0];
      v19 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
      [(BKFontTableViewCell *)v14 setLabelFont:v19];

      int v20 = v13 ^ 1;
LABEL_16:
      v28 = [(BKFontTableViewCell *)v14 label];
      [v28 setText:v17];

      v29 = [(BKAppearanceFontViewController *)self themePage];
      v30 = [v29 keyColor];

      v31 = [(BKFontTableViewCell *)v14 selectionView];
      [v31 setHidden:v20 ^ 1u];

      v32 = [(BKFontTableViewCell *)v14 selectionView];
      [v32 setTintColor:v30];

      if ((v20 & 1) == 0)
      {
        v50 = v17;
        if ([v9 state] == 3)
        {
          v33 = [(BKFontTableViewCell *)v14 accessoryView];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v35 = [(BKFontTableViewCell *)v14 accessoryView];
          }
          else
          {
            id v35 = objc_alloc_init((Class)IMRadialProgressButton);
            [v35 addTarget:self action:"stopDownloadingFont:" forControlEvents:64];
          }
          v38 = v52;
          [v9 downloadProgress];
          [v35 setProgress:];
        }
        else if ([v9 state] == 2)
        {
          v36 = [v9 familyName];
          unsigned __int8 v37 = [v36 isEqualToString:&stru_1DF0D8];

          v38 = v52;
          if (v37)
          {
            id v35 = 0;
          }
          else
          {
            id v35 = +[UIButton buttonWithType:0];
            [v35 addTarget:self action:"downloadFont:" forControlEvents:64];
            v39 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle3];
            objc_super v40 = +[UIImage systemImageNamed:@"icloud.and.arrow.down"];
            v41 = [v40 bc_imageWithConfiguration:v39 limitedToContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];

            [v35 setImage:v41 forState:0];
            [v35 setTintColor:v30];
          }
        }
        else
        {
          id v35 = 0;
          v38 = v52;
        }
        [v35 setTag:[v38 row]];
        if (v35)
        {
          v42 = [(BKFontTableViewCell *)v14 buttonContainerView];
          [v42 addSubview:v35];

          v43 = [v35 bc_constraintsToFitInSuperviewCentered];
          +[NSLayoutConstraint activateConstraints:v43];

          +[IMRadialProgressButton minimumBoundingBox];
          double v45 = v44;
          double v46 = _BKFontCellAppearanceFontHeight() * 0.55;
          if (v45 < v46) {
            double v45 = v46;
          }
        }
        else
        {
          double v45 = 0.0;
        }
        v47 = [(BKFontTableViewCell *)v14 buttonContainerWidthConstraint];
        [v47 setConstant:v45];

        double v17 = v50;
      }

      double v8 = v51;
      id v6 = v52;
      goto LABEL_34;
    }
    [(BKAppearanceFontViewController *)self fontSizeForFontFamilyName:v10];
    double v22 = v21;
    [(BKFontTableViewCell *)v14 setFont:v9];
    v49 = v15;
    if ([v9 kind] && objc_msgSend(v9, "kind") != (char *)&dword_0 + 2)
    {
      if ([v9 kind] != &dword_4)
      {
        [v9 kind];
        goto LABEL_14;
      }
      double v24 = +[UIFont systemFontOfSize:kCTFontUIFontDesignSerif weight:v22 design:UIFontWeightRegular];
    }
    else
    {
      double v23 = +[UIFont fontWithName:v10 size:v22];
      double v24 = [v23 _fontAdjustedForCurrentContentSizeCategory];
    }
    if (v24)
    {
LABEL_15:
      [(BKFontTableViewCell *)v14 setLabelFont:v24];

      double v25 = [(BKAppearanceFontViewController *)self styleManager];
      v26 = [v25 font];
      unsigned int v27 = [v26 isEqualToString:v10];

      int v20 = v27 & v13;
      double v17 = v49;
      goto LABEL_16;
    }
LABEL_14:
    double v24 = +[UIFont systemFontOfSize:v22];
    goto LABEL_15;
  }
LABEL_34:

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(BKAppearanceFontViewController *)self fonts];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(BKAppearanceFontViewController *)self fonts];
  double v7 = [v6 objectAtIndex:[v5 row]];

  if (![v7 isInstalled]
    || [v7 state] == 2
    || (double v8 = v5, [v7 state] == 4))
  {
    double v9 = [v7 familyName];
    unsigned __int8 v10 = [v9 isEqualToString:&stru_1DF0D8];

    double v8 = v5;
    if ((v10 & 1) == 0)
    {

      double v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(BKAppearanceFontViewController *)self fonts];
  [v8 objectAtIndex:[v6 row]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(BKAppearanceFontViewController *)self useSelectedFont:v9];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  [v7 reloadData];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  double v8 = [(BKAppearanceFontViewController *)self theme];
  [v8 stylizeTableViewCell:v16];

  id v9 = [(BKAppearanceFontViewController *)self fonts];
  id v10 = [v7 row];

  id v11 = [v9 objectAtIndex:v10];

  unsigned int v12 = [v16 textLabel];
  unsigned int v13 = [v12 textColor];

  if ([v11 state] == 4)
  {
    objc_super v14 = [v13 colorWithAlphaComponent:0.5];
    id v15 = [v16 label];
    [v15 setTextColor:v14];
  }
  else
  {
    objc_super v14 = [v16 label];
    [v14 setTextColor:v13];
  }
}

- (void)useSelectedFont:(id)a3
{
  id v12 = a3;
  double v4 = [(BKAppearanceFontViewController *)self styleManager];
  id v5 = [v12 familyName];
  BOOL v6 = [v5 length] != 0;
  uint64_t v7 = [(BKAppearanceFontViewController *)self book];
  double v8 = +[NSNumber numberWithBool:v6];
  [(id)v7 setUseGlobalContentStyle:v8];

  id v9 = [v4 font];
  LOBYTE(v7) = [v5 isEqualToString:v9];

  if (v7)
  {
    [v4 notifyStyleChanged];
  }
  else
  {
    [v4 setFont:v5];
    id v10 = [(BKAppearanceFontViewController *)self delegate];
    id v11 = [v12 displayName];
    [v10 appearanceFontViewController:self didChangeToFontWithName:v11];
  }
}

- (void)downloadFont:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceFontViewController *)self fonts];
  id v6 = [v4 tag];

  id v7 = [v5 objectAtIndex:v6];

  self->_shownCannotDownloadFontAlert = 0;
  [v7 download];
}

- (void)stopDownloadingFont:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAppearanceFontViewController *)self fonts];
  id v6 = [v4 tag];

  id v7 = [v5 objectAtIndex:v6];

  [v7 cancelDownload];
}

- (void)fontDownloadFailed:(id)a3
{
  if (!self->_shownCannotDownloadFontAlert)
  {
    id v4 = a3;
    int v5 = MGGetBoolAnswer();
    id v6 = AEBundle();
    id v7 = v6;
    if (v5) {
      CFStringRef v8 = @"To download fonts, connect to WLAN.";
    }
    else {
      CFStringRef v8 = @"To download fonts, connect to Wi-Fi.";
    }
    id v16 = [v6 localizedStringForKey:v8 value:&stru_1DF0D8 table:0];

    id v9 = AEBundle();
    id v10 = [v9 localizedStringForKey:@"Couldn’t Download" value:&stru_1DF0D8 table:0];
    id v11 = +[UIAlertController alertControllerWithTitle:v10 message:v16 preferredStyle:1];

    id v12 = AEBundle();
    unsigned int v13 = [v12 localizedStringForKey:@"OK" value:&stru_1DF0D8 table:0];
    objc_super v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
    [v11 addAction:v14];

    [(BKAppearanceFontViewController *)self presentViewController:v11 animated:1 completion:0];
    self->_shownCannotDownloadFontAlert = 1;
    id v15 = [v4 object];

    [v15 checkStateSynchronously:0];
    [(UITableView *)self->_tableView reloadData];
  }
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
}

- (BOOL)isDisappearing
{
  return self->_disappearing;
}

- (void)setDisappearing:(BOOL)a3
{
  self->_disappearing = a3;
}

- (BKAppearanceFontViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAppearanceFontViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)desiredContentSize
{
  double width = self->_desiredContentSize.width;
  double height = self->_desiredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredContentSize:(CGSize)a3
{
  self->_desiredContentSize = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
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

- (void)setDividerView:(id)a3
{
}

- (UIView)arrowBackgroundView
{
  return self->_arrowBackgroundView;
}

- (void)setArrowBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fonts, 0);

  objc_storeStrong((id *)&self->_book, 0);
}

@end