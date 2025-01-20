@interface HomeViewController
- (BOOL)isActive;
- (BOOL)shouldShowTopHairline;
- (HomeActionDelegate)homeActionDelegate;
- (HomeViewController)initWithDelegate:(id)a3;
- (SuggestionsItemSource)suggestionsItemSource;
- (UIScrollView)scrollView;
- (double)_footerHeight;
- (double)mediumContentHeight;
- (id)_linkButtonWithTitle:(id)a3;
- (id)keyCommands;
- (id)newTraits;
- (id)preferredFocusEnvironments;
- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int)listForDataSource:(id)a3;
- (void)_configureForceTouchIfNeeded;
- (void)_openTermsAndConditions:(id)a3;
- (void)_updateFooterAnimated:(BOOL)a3;
- (void)clearSelectionWithReason:(id)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSource:(id)a3 sectionHeaderTapped:(id)a4;
- (void)editCollection:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)homeSetNeedsUpdate;
- (void)keyboardProxyViewCreated:(id)a3;
- (void)presentVenueWithVenueCardItem:(id)a3;
- (void)scrollContentToOriginalPosition;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActive:(BOOL)a3;
- (void)showCollection:(id)a3;
- (void)venueDidReceiveEVChargersUpdate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HomeViewController

- (void)setActive:(BOOL)a3
{
  if (self->_active == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_active = a3;
  if (sub_1000BBB44(self) == 5)
  {
    [(HomeOutlineRootController *)self->_outlineController setActive:v3];
    v5 = [(HomeViewController *)self view];
    [v5 setUserInteractionEnabled:v3];

    if (!v3) {
      return;
    }
    goto LABEL_9;
  }
  if (GEOConfigGetBOOL()) {
    uint64_t v6 = 32;
  }
  else {
    uint64_t v6 = 8;
  }
  [*(id *)((char *)&self->super.super.super.isa + v6) setActive:v3];
  if (v3)
  {
LABEL_9:
    [(HomeViewController *)self _configureForceTouchIfNeeded];
  }
}

- (HomeViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HomeViewController;
  v5 = [(HomeViewController *)&v8 initWithNibName:0 bundle:0];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_homeActionDelegate, v4);
  }

  return v6;
}

- (void)_configureForceTouchIfNeeded
{
  if (sub_1000BBB44(self) != 5 && !self->_quickActionMenuPresenter)
  {
    if (GEOConfigGetBOOL()) {
      BOOL v3 = [[_TtC4Maps32MapsHomeQuickActionMenuPresenter alloc] initWithCollectionView:self->_collectionView];
    }
    else {
      BOOL v3 = [[SearchResultQuickActionMenuPresenter alloc] initWithTableView:self->_tableView];
    }
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = &v3->super;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter setDelegate:WeakRetained];
  }
}

- (void)viewDidLoad
{
  v141.receiver = self;
  v141.super_class = (Class)HomeViewController;
  [(HomeViewController *)&v141 viewDidLoad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
  id v4 = [WeakRetained homeActionCoordinator];

  v5 = [(HomeViewController *)self view];
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_super v8 = [v7 stringByReplacingOccurrencesOfString:@"Controller" withString:&stru_101324E70];
  [v5 setAccessibilityIdentifier:v8];

  if (sub_1000BBB44(self) == 5)
  {
    id v9 = objc_alloc((Class)UICollectionView);
    v10 = [(HomeViewController *)self view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v20 = [v9 initWithFrame:v19 collectionViewLayout:v12];
    collectionView = self->_collectionView;
    self->_collectionView = v20;

    [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)self->_collectionView setPreservesSuperviewLayoutMargins:1];
    v22 = +[UIColor clearColor];
    [(UICollectionView *)self->_collectionView setBackgroundColor:v22];

    [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
    [(UICollectionView *)self->_collectionView setSelectionFollowsFocus:1];
    [(UICollectionView *)self->_collectionView setAutomaticallyAdjustsScrollIndicatorInsets:0];
    [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"HomeCollectionView"];
    v23 = [(HomeViewController *)self view];
    [v23 addSubview:self->_collectionView];

    v24 = [HomeOutlineRootControllerConfiguration alloc];
    v25 = self->_collectionView;
    id v26 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    v139 = v4;
    v27 = [(HomeOutlineRootControllerConfiguration *)v24 initWithCollectionView:v25 actionCoordinator:v4 homeActionDelegate:v26 homeUpdateDelegate:self];

    v137 = (_TtC4Maps35HomeListRootControllerConfiguration *)v27;
    v28 = [[HomeOutlineRootController alloc] initWithConfiguration:v27];
    outlineController = self->_outlineController;
    self->_outlineController = v28;

    v30 = [(HomeOutlineRootController *)self->_outlineController collectionViewLayout];
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v30];

    v31 = [(HomeOutlineRootController *)self->_outlineController dataSource];
    [(UICollectionView *)self->_collectionView setDataSource:v31];

    [(UICollectionView *)self->_collectionView setDelegate:self->_outlineController];
    v32 = +[MapsDragAndDropManager sharedManager];
    LODWORD(v25) = [v32 deviceSupportsDragAndDrop];

    if (v25)
    {
      [(UICollectionView *)self->_collectionView setDragDelegate:self->_outlineController];
      [(UICollectionView *)self->_collectionView setDropDelegate:self->_outlineController];
    }
    v33 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    footerView = self->_footerView;
    self->_footerView = v33;

    [(UIView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_footerView setPreservesSuperviewLayoutMargins:1];
    [(UIView *)self->_footerView setAccessibilityIdentifier:@"HomeFooterView"];
    v35 = [(HomeViewController *)self view];
    [v35 addSubview:self->_footerView];

    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"[Maps Home] Terms & Conditions" value:@"localized string not found" table:0];
    v38 = [(HomeViewController *)self _linkButtonWithTitle:v37];
    termsAndConditionsButton = self->_termsAndConditionsButton;
    self->_termsAndConditionsButton = v38;

    [(MapsRightImageButton *)self->_termsAndConditionsButton addTarget:self action:"_openTermsAndConditions:" forControlEvents:0x2000];
    [(MapsRightImageButton *)self->_termsAndConditionsButton setAccessibilityIdentifier:@"HomeTermsAndConditionsButton"];
    [(UIView *)self->_footerView addSubview:self->_termsAndConditionsButton];
    v40 = [(UIView *)self->_footerView bottomAnchor];
    v41 = [(UICollectionView *)self->_collectionView bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    footerBottomConstraint = self->_footerBottomConstraint;
    self->_footerBottomConstraint = v42;

    v135 = [(UICollectionView *)self->_collectionView topAnchor];
    v133 = [(HomeViewController *)self view];
    v131 = [v133 topAnchor];
    v129 = [v135 constraintEqualToAnchor:v131];
    v143[0] = v129;
    v125 = [(UICollectionView *)self->_collectionView leadingAnchor];
    v127 = [(HomeViewController *)self view];
    v124 = [v127 leadingAnchor];
    v123 = [v125 constraintEqualToAnchor:v124];
    v143[1] = v123;
    v121 = [(UICollectionView *)self->_collectionView trailingAnchor];
    v122 = [(HomeViewController *)self view];
    v120 = [v122 trailingAnchor];
    v119 = [v121 constraintEqualToAnchor:v120];
    v143[2] = v119;
    v117 = [(UICollectionView *)self->_collectionView bottomAnchor];
    v118 = [(HomeViewController *)self view];
    v116 = [v118 bottomAnchor];
    v115 = [v117 constraintEqualToAnchor:v116];
    v143[3] = v115;
    v113 = [(UIView *)self->_footerView leadingAnchor];
    v114 = [(HomeViewController *)self view];
    v112 = [v114 leadingAnchor];
    v111 = [v113 constraintEqualToAnchor:v112];
    v143[4] = v111;
    v109 = [(UIView *)self->_footerView trailingAnchor];
    v110 = [(HomeViewController *)self view];
    v108 = [v110 trailingAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v44 = self->_footerBottomConstraint;
    v143[5] = v107;
    v143[6] = v44;
    v106 = [(MapsRightImageButton *)self->_termsAndConditionsButton topAnchor];
    v105 = [(UIView *)self->_footerView topAnchor];
    v104 = [v106 constraintEqualToAnchor:v105 constant:0.0];
    v143[7] = v104;
    v102 = [(MapsRightImageButton *)self->_termsAndConditionsButton leadingAnchor];
    v103 = [(UIView *)self->_footerView layoutMarginsGuide];
    v45 = [v103 leadingAnchor];
    v46 = [v102 constraintEqualToAnchor:v45];
    v143[8] = v46;
    v47 = [(MapsRightImageButton *)self->_termsAndConditionsButton trailingAnchor];
    v48 = [(UIView *)self->_footerView layoutMarginsGuide];
    v49 = [v48 trailingAnchor];
    v50 = [v47 constraintLessThanOrEqualToAnchor:v49];
    v143[9] = v50;
    v51 = [(MapsRightImageButton *)self->_termsAndConditionsButton bottomAnchor];
    v52 = [(UIView *)self->_footerView bottomAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:-13.0];
    v143[10] = v53;
    v54 = +[NSArray arrayWithObjects:v143 count:11];
    +[NSLayoutConstraint activateConstraints:v54];

    id v55 = v135;
    v56 = v137;
    id v4 = v139;
  }
  else if (GEOConfigGetBOOL())
  {
    [(HomeViewController *)self _mapsui_resetViewLayoutMarginsWithPreservesSuperview:1];
    id v57 = objc_alloc((Class)UICollectionView);
    id v58 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v59 = [v57 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height collectionViewLayout:v58];
    v60 = self->_collectionView;
    self->_collectionView = v59;

    v61 = +[UIColor clearColor];
    [(UICollectionView *)self->_collectionView setBackgroundColor:v61];

    v62 = [(UICollectionView *)self->_collectionView layer];
    [v62 setAllowsGroupOpacity:0];

    [(UICollectionView *)self->_collectionView _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
    v63 = [(HomeViewController *)self view];
    [v63 addSubview:self->_collectionView];

    v56 = [[_TtC4Maps35HomeListRootControllerConfiguration alloc] initWithCollectionView:self->_collectionView];
    id v64 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    [(HomeListRootControllerConfiguration *)v56 setHomeActionDelegate:v64];

    [(HomeListRootControllerConfiguration *)v56 setHomeUpdateDelegate:self];
    v65 = [[_TtC4Maps22HomeListRootController alloc] initWithConfiguration:v56];
    listController = self->_listController;
    self->_listController = v65;

    v67 = [(HomeListRootController *)self->_listController collectionViewLayout];
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v67];

    v68 = [(HomeListRootController *)self->_listController dataSource];
    [(UICollectionView *)self->_collectionView setDataSource:v68];

    [(UICollectionView *)self->_collectionView setDelegate:self->_listController];
    v69 = +[MapsDragAndDropManager sharedManager];
    LODWORD(v58) = [v69 deviceSupportsDragAndDrop];

    if (v58) {
      [(UICollectionView *)self->_collectionView setDragDelegate:self->_listController];
    }
    id v70 = objc_alloc((Class)MUEdgeLayout);
    v71 = self->_collectionView;
    v72 = [(HomeViewController *)self view];
    id v55 = [v70 initWithItem:v71 container:v72];

    [v55 activate];
  }
  else
  {
    [(HomeViewController *)self setViewRespectsSystemMinimumLayoutMargins:0];
    v73 = [(HomeViewController *)self view];
    [v73 setPreservesSuperviewLayoutMargins:1];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    v77 = [(HomeViewController *)self view];
    [v77 setLayoutMargins:UIEdgeInsetsZero.top, left, bottom, right];

    v78 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = self->_tableView;
    self->_tableView = v78;

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    v80 = +[UIColor clearColor];
    [(UITableView *)self->_tableView setBackgroundColor:v80];

    [(UITableView *)self->_tableView setEstimatedSectionHeaderHeight:0.0];
    [(UITableView *)self->_tableView _setHeaderAndFooterViewsFloat:0];
    v81 = +[UIColor clearColor];
    [(UITableView *)self->_tableView setBackgroundColor:v81];

    v82 = [(UITableView *)self->_tableView layer];
    [v82 setAllowsGroupOpacity:0];

    -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
    [(UITableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
    [(UITableView *)self->_tableView _setTopPadding:0.0];
    [(UITableView *)self->_tableView setAccessibilityIdentifier:@"HomeTableView"];
    v83 = [(HomeViewController *)self view];
    [v83 addSubview:self->_tableView];

    v84 = -[HomeCellProvider initWithTableView:viewMode:]([HomeCellProvider alloc], "initWithTableView:viewMode:", self->_tableView, [v4 displayedViewMode]);
    homeCellProvider = self->_homeCellProvider;
    self->_homeCellProvider = v84;

    [(DataSource *)self->_homeCellProvider setDelegate:self];
    id v86 = objc_loadWeakRetained((id *)&self->_homeActionDelegate);
    [(HomeCellProvider *)self->_homeCellProvider setHomeActionDelegate:v86];

    [(HomeCellProvider *)self->_homeCellProvider setHomeUpdateDelegate:self];
    v87 = [v4 appCoordinator];
    [(HomeCellProvider *)self->_homeCellProvider setShareDelegate:v87];

    v88 = [v4 appCoordinator];
    [(HomeCellProvider *)self->_homeCellProvider setPlaceCardActionDelegate:v88];

    v89 = [v4 appCoordinator];
    [(HomeCellProvider *)self->_homeCellProvider setParkedCarActionDelegate:v89];

    [(HomeCellProvider *)self->_homeCellProvider setPoiEnrichmentActionDelegate:v4];
    [(HomeCellProvider *)self->_homeCellProvider setTransitPayActionDelegate:v4];
    v140 = v4;
    [(HomeCellProvider *)self->_homeCellProvider setDeleteDelegate:v4];
    [(UITableView *)self->_tableView setDelegate:self->_homeCellProvider];
    v90 = +[MapsDragAndDropManager sharedManager];
    unsigned int v91 = [v90 deviceSupportsDragAndDrop];

    if (v91) {
      [(UITableView *)self->_tableView setDragDelegate:self->_homeCellProvider];
    }
    v138 = [(UITableView *)self->_tableView topAnchor];
    v136 = [(HomeViewController *)self view];
    v134 = [v136 topAnchor];
    v132 = [(HomeListRootControllerConfiguration *)v138 constraintEqualToAnchor:v134];
    v142[0] = v132;
    v128 = [(UITableView *)self->_tableView leadingAnchor];
    v130 = [(HomeViewController *)self view];
    v126 = [v130 leadingAnchor];
    v92 = [v128 constraintEqualToAnchor:v126];
    v142[1] = v92;
    v93 = [(UITableView *)self->_tableView trailingAnchor];
    v94 = [(HomeViewController *)self view];
    v95 = [v94 trailingAnchor];
    v96 = [v93 constraintEqualToAnchor:v95];
    v142[2] = v96;
    v97 = [(UITableView *)self->_tableView bottomAnchor];
    v98 = [(HomeViewController *)self view];
    v99 = [v98 bottomAnchor];
    v100 = [v97 constraintEqualToAnchor:v99];
    v142[3] = v100;
    v101 = +[NSArray arrayWithObjects:v142 count:4];
    +[NSLayoutConstraint activateConstraints:v101];

    id v55 = v136;
    v56 = v138;

    id v4 = v140;
  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  [(HomeViewController *)self loadViewIfNeeded];
  if (sub_1000BBB44(self) == 5)
  {
    BOOL v3 = &OBJC_IVAR___HomeViewController__outlineController;
  }
  else
  {
    int BOOL = GEOConfigGetBOOL();
    uint64_t v5 = 8;
    if (BOOL) {
      uint64_t v5 = 6;
    }
    BOOL v3 = &OBJC_IVAR___HomeViewController__homeActionDelegate[v5];
  }
  uint64_t v6 = [*(id *)((char *)&self->super.super.super.isa + *v3) suggestionsItemSource];

  return (SuggestionsItemSource *)v6;
}

- (BOOL)shouldShowTopHairline
{
  if (sub_1000BBB44(self) == 5) {
    return 0;
  }
  if (GEOConfigGetBOOL())
  {
    [(UICollectionView *)self->_collectionView contentOffset];
    return v3 > 0.0;
  }
  uint64_t v5 = [(HomeViewController *)self scrollView];
  [v5 contentOffset];
  double v7 = v6;

  if (v7 <= 0.0) {
    return 0;
  }
  tableView = self->_tableView;

  return [(UITableView *)tableView _maps_shouldShowTopHairline];
}

- (UIScrollView)scrollView
{
  if (sub_1000BBB44(self) == 5)
  {
    double v3 = &OBJC_IVAR___HomeViewController__collectionView;
  }
  else
  {
    int BOOL = GEOConfigGetBOOL();
    uint64_t v5 = 7;
    if (BOOL) {
      uint64_t v5 = 1;
    }
    double v3 = &OBJC_IVAR___HomeViewController__homeActionDelegate[v5];
  }
  double v6 = *(Class *)((char *)&self->super.super.super.isa + *v3);

  return (UIScrollView *)v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)homeSetNeedsUpdate
{
  id v2 = [(HomeViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)HomeViewController;
  [(HomeViewController *)&v10 viewDidLayoutSubviews];
  if (sub_1000BBB44(self) == 5)
  {
    [(HomeOutlineRootController *)self->_outlineController updateIfNeeded];
    [(HomeViewController *)self _updateFooterAnimated:0];
  }
  else if (GEOConfigGetBOOL())
  {
    [(HomeListRootController *)self->_listController setNeedsUpdate];
    [(UICollectionView *)self->_collectionView bounds];
    CGFloat v5 = v4;
    CGFloat v6 = v3;
    double width = self->_previousCollectionViewSize.width;
    if (v4 == width && width != 0.0 && v3 > self->_previousCollectionViewSize.height)
    {
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100CDADEC;
        v9[3] = &unk_1012E5D08;
        v9[4] = self;
        +[UIView performWithoutAnimation:v9];
      }
    }
    self->_previousCollectionViewSize.double width = v5;
    self->_previousCollectionViewSize.height = v6;
  }
  else
  {
    [(HomeCellProvider *)self->_homeCellProvider updateIfNeeded];
  }
}

- (void)scrollContentToOriginalPosition
{
  if (sub_1000BBB44(self) == 5)
  {
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView _maps_scrollContentToOriginalPosition];
  }
  else
  {
    if (GEOConfigGetBOOL())
    {
      objc_super v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      double v12 = sub_10010866C;
      double v13 = &unk_1012E5D08;
      double v14 = self;
      double v4 = &v10;
    }
    else
    {
      CGFloat v5 = _NSConcreteStackBlock;
      uint64_t v6 = 3221225472;
      double v7 = sub_100CDB08C;
      objc_super v8 = &unk_1012E5D08;
      id v9 = self;
      double v4 = &v5;
    }
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (id)preferredFocusEnvironments
{
  id v2 = [(HomeViewController *)self view];
  CGFloat v5 = v2;
  double v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)keyCommands
{
  int BOOL = GEOConfigGetBOOL();
  uint64_t v4 = 8;
  if (BOOL) {
    uint64_t v4 = 6;
  }
  CGFloat v5 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___HomeViewController__homeActionDelegate[v4]) keyCommands];

  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int BOOL = GEOConfigGetBOOL();
  uint64_t v8 = 8;
  if (BOOL) {
    uint64_t v8 = 6;
  }
  uint64_t v9 = OBJC_IVAR___HomeViewController__homeActionDelegate[v8];
  id v10 = *(id *)((char *)&self->super.super.super.isa + v9);
  uint64_t v11 = [*(id *)((char *)&self->super.super.super.isa + v9) keyCommands];
  if ([v11 containsObject:v6])
  {
    id v12 = v10;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HomeViewController;
    id v12 = [(HomeViewController *)&v15 targetForAction:a3 withSender:v6];
  }
  double v13 = v12;

  return v13;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HomeViewController;
  [(HomeViewController *)&v4 viewDidDisappear:a3];
  [(HomeViewController *)self scrollContentToOriginalPosition];
}

- (double)mediumContentHeight
{
  if (sub_1000BBB44(self) == 5) {
    return 0.0;
  }
  homeCellProvider = self->_homeCellProvider;

  [(HomeCellProvider *)homeCellProvider contentHeight];
  return result;
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
}

- (void)showCollection:(id)a3
{
}

- (void)editCollection:(id)a3
{
}

- (void)clearSelectionWithReason:(id)a3
{
}

- (void)keyboardProxyViewCreated:(id)a3
{
}

- (id)sourceViewForProfileTipPopoverWithViewController:(id)a3
{
  outlineController = self->_outlineController;
  id v4 = [a3 userProfileLinkType];

  return [(HomeOutlineRootController *)outlineController viewForProfileToolTipPopoverWithType:v4];
}

- (id)_linkButtonWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  CGFloat v5 = +[MapsRightImageButton buttonWithType:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = +[UIColor secondaryLabelColor];
  [v5 setTintColor:v6];

  double v7 = [v5 titleLabel];
  [v7 setFont:v4];

  [v5 setTitle:v3 forState:0];
  uint64_t v8 = +[UIColor secondaryLabelColor];
  [v5 setTitleColor:v8 forState:0];

  uint64_t v9 = +[UIImage systemImageNamed:@"chevron.forward"];
  [v5 setImage:v9 forState:0];

  id v10 = +[UIImageSymbolConfiguration configurationWithFont:v4 scale:2];
  [v5 setPreferredSymbolConfiguration:v10 forImageInState:0];

  return v5;
}

- (void)_openTermsAndConditions:(id)a3
{
  id v3 = [(HomeViewController *)self homeActionDelegate];
  [v3 homeDidTapTermsAndConditions];
}

- (void)_updateFooterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    [(HomeViewController *)self _footerHeight];
    double v6 = v5;
    [(HomeViewController *)self additionalSafeAreaInsets];
    if (v6 != v7) {
      -[HomeViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v6, 0.0);
    }
    [(UICollectionView *)self->_collectionView layoutIfNeeded];
    [(UICollectionView *)self->_collectionView adjustedContentInset];
    double v9 = v8;
    double v11 = v10;
    [(UICollectionView *)self->_collectionView contentSize];
    double v13 = v12;
    [(UICollectionView *)self->_collectionView bounds];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    double v18 = v11 + v9 + v13;
    double v19 = v18 - CGRectGetMaxY(v25);
    double v20 = 0.0;
    if (v19 >= 0.0)
    {
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double v20 = v18 - CGRectGetMaxY(v26);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100CDB4F4;
    v23[3] = &unk_1012E8FA8;
    v23[4] = self;
    BOOL v24 = v13 == 0.0;
    *(double *)&v23[5] = v20;
    v21 = objc_retainBlock(v23);
    v22 = v21;
    if (v3) {
      +[UIView animateWithDuration:v21 animations:0.25];
    }
    else {
      ((void (*)(void *))v21[2])(v21);
    }
  }
}

- (double)_footerHeight
{
  -[UIView systemLayoutSizeFittingSize:](self->_footerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (int)listForDataSource:(id)a3
{
  return 1;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  p_homeActionDelegate = &self->_homeActionDelegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  [WeakRetained homeItemTapped:v5];
}

- (void)dataSource:(id)a3 sectionHeaderTapped:(id)a4
{
  id v10 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v6 = v10;
  if (isKindOfClass)
  {
    id v7 = v10;
    if ([v7 type] == (id)3) {
      +[GEOAPPortal captureUserAction:2065 target:8 value:0];
    }
    double v8 = [(HomeViewController *)self homeActionDelegate];
    id v9 = [v7 type];

    [v8 homeSectionHeaderButtonTapped:v9];
    double v6 = v10;
  }
}

- (id)newTraits
{
  double v2 = [(HomeViewController *)self homeActionDelegate];
  id v3 = [v2 newTraits];

  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  p_homeActionDelegate = &self->_homeActionDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  id v7 = [WeakRetained homeContaineeViewController];
  [v7 scrollViewDidScroll:v5];

  [(HomeViewController *)self _updateFooterAnimated:0];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_homeActionDelegate = &self->_homeActionDelegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  id v5 = [WeakRetained homeContaineeViewController];
  [v5 scrollViewWillBeginDragging:v4];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  p_homeActionDelegate = &self->_homeActionDelegate;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_homeActionDelegate);
  id v10 = [WeakRetained homeContaineeViewController];
  [v10 scrollViewWillEndDragging:v9 withVelocity:a5 targetContentOffset:x, y];
}

- (HomeActionDelegate)homeActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);

  return (HomeActionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_footerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_outlineController, 0);
  objc_storeStrong((id *)&self->_listController, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_homeCellProvider, 0);
}

@end