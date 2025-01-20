@interface BKSearchViewController
- (BEHairlineDividerView)footerTopBorderView;
- (BEHairlineDividerView)headerDividerView;
- (BESearchResultTableViewCell)dummySearchResultsCell;
- (BKPaginationController)paginationController;
- (BKSearchLoadingTableViewCell)dummySearchLoadingCell;
- (BKSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKSearchViewControllerDelegate)searchDelegate;
- (BOOL)_isRTL;
- (BOOL)_shouldShowSearchResultsView;
- (BOOL)accessibilityRequiresActivateForSearchField;
- (BOOL)isModalSheet;
- (BOOL)resizeAnimationInProgress;
- (BOOL)resizeRequestPending;
- (BOOL)searchStringIsPageNumber;
- (BOOL)showPhysicalPages;
- (CGSize)_preferredContentSizeIsMinimum:(BOOL *)a3;
- (NSLayoutConstraint)footerHeightConstraint;
- (NSLayoutConstraint)searchBarHeightConstraint;
- (NSString)searchString;
- (double)_resultsEstimatedRowHeight;
- (double)_resultsHeaderHeight;
- (double)maxContentHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_escapedSearchString;
- (id)_loadingCellForTableView:(id)a3;
- (id)_resultsCellForRow:(unint64_t)a3 inTableView:(id)a4;
- (id)environmentOverrideViewForSearchController:(id)a3;
- (id)physicalPageMapForPageTitle:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)searchController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)positionForBar:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3;
- (void)_buildConstraints;
- (void)_configureLoadingCell:(id)a3;
- (void)_configureResultsCell:(id)a3 forRow:(unint64_t)a4 inTableView:(id)a5;
- (void)_reloadResultsAndResizeIfNecessary:(BOOL)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateCancelButton;
- (void)_updateContentSize:(BOOL)a3;
- (void)_updateFooterConstraint;
- (void)_updateLoadingCell:(id)a3;
- (void)_updateWebsearchButtonsStatus;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)openURLUsingNSString:(id)a3;
- (void)paginationComplete;
- (void)releaseViews;
- (void)revealSearchResult:(id)a3;
- (void)revealSearchResult:(id)a3 animated:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchControllerDidFinishSearching:(id)a3;
- (void)searchControllerFinishedSearchingChapter:(id)a3;
- (void)searchControllerResultsChanged:(id)a3;
- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4;
- (void)searchEncyclopediaForString:(id)a3;
- (void)searchWeb:(id)a3;
- (void)searchWebForString:(id)a3;
- (void)searchWikipedia:(id)a3;
- (void)setDummySearchLoadingCell:(id)a3;
- (void)setDummySearchResultsCell:(id)a3;
- (void)setFooterHeightConstraint:(id)a3;
- (void)setFooterTopBorderView:(id)a3;
- (void)setHeaderDividerView:(id)a3;
- (void)setMaxContentHeight:(double)a3;
- (void)setPaginationController:(id)a3;
- (void)setResizeAnimationInProgress:(BOOL)a3;
- (void)setResizeRequestPending:(BOOL)a3;
- (void)setSearchBarHeightConstraint:(id)a3;
- (void)setSearchDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setShowPhysicalPages:(BOOL)a3;
- (void)setTheme:(id)a3;
- (void)stylizeForTheme;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKSearchViewController

- (BKSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BKSearchViewController;
  v4 = [(BKViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[UITraitCollection bc_allAPITraits];
    id v6 = [(BKSearchViewController *)v4 registerForTraitChanges:v5 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)releaseViews
{
  [(UISearchBar *)self->_searchField setDelegate:0];
  searchField = self->_searchField;
  self->_searchField = 0;

  [(UITableView *)self->_resultsTable setDelegate:0];
  [(UITableView *)self->_resultsTable setDataSource:0];
  resultsTable = self->_resultsTable;
  self->_resultsTable = 0;

  container = self->_container;
  self->_container = 0;

  footer = self->_footer;
  self->_footer = 0;

  [(UIButton *)self->_googleButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  googleButton = self->_googleButton;
  self->_googleButton = 0;

  [(UIButton *)self->_wikipediaButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  wikipediaButton = self->_wikipediaButton;
  self->_wikipediaButton = 0;

  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = 0;

  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = 0;

  dummySearchResultsCell = self->_dummySearchResultsCell;
  self->_dummySearchResultsCell = 0;

  dummySearchLoadingCell = self->_dummySearchLoadingCell;
  self->_dummySearchLoadingCell = 0;

  v13.receiver = self;
  v13.super_class = (Class)BKSearchViewController;
  [(BKViewController *)&v13 releaseViews];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  [(BKSearchViewController *)self releaseViews];
  objc_storeWeak((id *)&self->_searchDelegate, 0);
  [(BKSearchController *)self->_searchController setDelegate:0];
  [(BKSearchController *)self->_searchController cancelSearch];
  [(BKSearchViewController *)self setPaginationController:0];
  v4.receiver = self;
  v4.super_class = (Class)BKSearchViewController;
  [(BKViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v49 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  container = self->_container;
  self->_container = v7;

  [(UIView *)self->_container setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(BKSearchViewController *)self view];
  [v9 addSubview:self->_container];

  v10 = (BEHairlineDividerView *)objc_alloc_init((Class)BEHairlineDividerView);
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v10;

  [(BEHairlineDividerView *)self->_headerDividerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BEHairlineDividerView *)self->_headerDividerView setHorizontal:1];
  [(UIView *)self->_container addSubview:self->_headerDividerView];
  v12 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, y, width, height];
  resultsTable = self->_resultsTable;
  self->_resultsTable = v12;

  [(UITableView *)self->_resultsTable setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_resultsTable setDelegate:self];
  [(UITableView *)self->_resultsTable setDataSource:self];
  int v14 = isPad();
  v15 = (double *)&kBESearchSectionSearchResultCellHeightPad;
  if (!v14) {
    v15 = (double *)&kBESearchSectionSearchResultCellHeightPhone;
  }
  [(UITableView *)self->_resultsTable setEstimatedRowHeight:*v15];
  [(UITableView *)self->_resultsTable setRowHeight:UITableViewAutomaticDimension];
  [(BKSearchViewController *)self _resultsHeaderHeight];
  -[UITableView setSectionHeaderHeight:](self->_resultsTable, "setSectionHeaderHeight:");
  [(UITableView *)self->_resultsTable setSectionFooterHeight:0.0];
  [(UITableView *)self->_resultsTable registerClass:objc_opt_class() forCellReuseIdentifier:kBESearchTableViewCellResultsIdentifier];
  [(UITableView *)self->_resultsTable registerClass:objc_opt_class() forCellReuseIdentifier:kBESearchTableViewCellResultsNightIdentifier];
  -[UITableView setContentInset:](self->_resultsTable, "setContentInset:", 0.0, 0.0, -1.0, 0.0);
  [(UIView *)self->_container addSubview:self->_resultsTable];
  v16 = +[BESearchViewController p_standardSearchBar];
  searchField = self->_searchField;
  self->_searchField = v16;

  [(UISearchBar *)self->_searchField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISearchBar *)self->_searchField setDelegate:self];
  [(UISearchBar *)self->_searchField _setAutoDisableCancelButton:0];
  v18 = [(BKSearchViewController *)self view];
  [v18 addSubview:self->_searchField];

  [(UISearchBar *)self->_searchField sizeToFit];
  v19 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  footer = self->_footer;
  self->_footer = v19;

  [(UIView *)self->_footer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_container addSubview:self->_footer];
  [(UIView *)self->_footer bounds];
  double v21 = CGRectGetWidth(v50);
  v22 = +[UIScreen mainScreen];
  [v22 scale];
  double v24 = 1.0 / v23;

  v25 = [objc_alloc((Class)BEHairlineDividerView) initWithFrame:0.0, 0.0, v21, v24];
  footerTopBorderView = self->_footerTopBorderView;
  self->_footerTopBorderView = v25;

  [(BEHairlineDividerView *)self->_footerTopBorderView setAutoresizingMask:2];
  [(BEHairlineDividerView *)self->_footerTopBorderView setHorizontal:1];
  [(UIView *)self->_footer addSubview:self->_footerTopBorderView];
  v27 = +[UIFont systemFontOfSize:17.0];
  v28 = +[UIButton buttonWithType:1];
  googleButton = self->_googleButton;
  self->_googleButton = v28;

  [(UIButton *)self->_googleButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_footer addSubview:self->_googleButton];
  v30 = [(UIButton *)self->_googleButton titleLabel];
  [v30 setFont:v27];
  [v27 pointSize];
  [v30 setMinimumScaleFactor:8.0 / v31];
  [v30 setAdjustsFontSizeToFitWidth:1];
  [v30 setTextAlignment:1];
  if ([(BKSearchViewController *)self _isRTL]) {
    uint64_t v32 = 2;
  }
  else {
    uint64_t v32 = 1;
  }
  [(UIButton *)self->_googleButton setContentHorizontalAlignment:v32];
  [(UIButton *)self->_googleButton addTarget:self action:"searchWeb:" forControlEvents:64];
  v33 = self->_googleButton;
  v34 = AEBundle();
  v35 = [v34 localizedStringForKey:@"Search Web" value:&stru_1DF0D8 table:0];
  [(UIButton *)v33 setTitle:v35 forState:0];

  v36 = self->_googleButton;
  id v37 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(UIButton *)v36 addInteraction:v37];

  v38 = +[UIButton buttonWithType:1];
  wikipediaButton = self->_wikipediaButton;
  self->_wikipediaButton = v38;

  [(UIButton *)self->_wikipediaButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_footer addSubview:self->_wikipediaButton];
  v40 = [(UIButton *)self->_wikipediaButton titleLabel];
  [v40 setFont:v27];
  [v27 pointSize];
  [v40 setMinimumScaleFactor:8.0 / v41];
  [v40 setAdjustsFontSizeToFitWidth:1];
  [v40 setTextAlignment:1];
  if ([(BKSearchViewController *)self _isRTL]) {
    uint64_t v42 = 1;
  }
  else {
    uint64_t v42 = 2;
  }
  [(UIButton *)self->_wikipediaButton setContentHorizontalAlignment:v42];
  [(UIButton *)self->_wikipediaButton addTarget:self action:"searchWikipedia:" forControlEvents:64];
  v43 = self->_wikipediaButton;
  v44 = AEBundle();
  v45 = [v44 localizedStringForKey:@"Search Wikipedia" value:&stru_1DF0D8 table:0];
  [(UIButton *)v43 setTitle:v45 forState:0];

  v46 = self->_wikipediaButton;
  id v47 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
  [(UIButton *)v46 addInteraction:v47];

  [(BKSearchViewController *)self _buildConstraints];
  [(BKSearchViewController *)self _updateContentSize:0];
  v48 = +[NSNotificationCenter defaultCenter];
  [v48 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_buildConstraints
{
  searchField = self->_searchField;
  objc_super v4 = [(UISearchBar *)searchField constraints];
  [(UISearchBar *)searchField removeConstraints:v4];

  headerDividerView = self->_headerDividerView;
  id v6 = [(BEHairlineDividerView *)headerDividerView constraints];
  [(BEHairlineDividerView *)headerDividerView removeConstraints:v6];

  container = self->_container;
  objc_super v8 = [(UIView *)container constraints];
  [(UIView *)container removeConstraints:v8];

  resultsTable = self->_resultsTable;
  v10 = [(UITableView *)resultsTable constraints];
  [(UITableView *)resultsTable removeConstraints:v10];

  footer = self->_footer;
  v12 = [(UIView *)footer constraints];
  [(UIView *)footer removeConstraints:v12];

  googleButton = self->_googleButton;
  int v14 = [(UIButton *)googleButton constraints];
  [(UIButton *)googleButton removeConstraints:v14];

  wikipediaButton = self->_wikipediaButton;
  v16 = [(UIButton *)wikipediaButton constraints];
  [(UIButton *)wikipediaButton removeConstraints:v16];

  footerTopBorderView = self->_footerTopBorderView;
  v18 = [(BEHairlineDividerView *)footerTopBorderView constraints];
  [(BEHairlineDividerView *)footerTopBorderView removeConstraints:v18];

  if (!self->_footerHeightConstraint)
  {
    v19 = +[NSLayoutConstraint constraintWithItem:self->_footer attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
    footerHeightConstraint = self->_footerHeightConstraint;
    self->_footerHeightConstraint = v19;

    [(NSLayoutConstraint *)self->_footerHeightConstraint setActive:1];
  }
  if (!self->_searchBarHeightConstraint)
  {
    double v21 = +[NSLayoutConstraint constraintWithItem:self->_searchField attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:51.0];
    searchBarHeightConstraint = self->_searchBarHeightConstraint;
    self->_searchBarHeightConstraint = v21;

    [(NSLayoutConstraint *)self->_searchBarHeightConstraint setActive:1];
  }
  double v23 = [(BKSearchViewController *)self view];
  double v24 = [v23 safeAreaLayoutGuide];
  v124 = [(UISearchBar *)self->_searchField leadingAnchor];
  v123 = [v24 leadingAnchor];
  v122 = [v124 constraintEqualToAnchor:v123];
  v125[0] = v122;
  v121 = [(UISearchBar *)self->_searchField topAnchor];
  v120 = [v24 topAnchor];
  v119 = [v121 constraintEqualToAnchor:v120 constant:5.0];
  v125[1] = v119;
  v118 = [(UISearchBar *)self->_searchField trailingAnchor];
  v117 = [v24 trailingAnchor];
  v116 = [v118 constraintEqualToAnchor:v117];
  v125[2] = v116;
  v115 = [(BEHairlineDividerView *)self->_headerDividerView leftAnchor];
  v114 = [v23 leftAnchor];
  v113 = [v115 constraintEqualToAnchor:v114];
  v125[3] = v113;
  v112 = [(BEHairlineDividerView *)self->_headerDividerView rightAnchor];
  v111 = [v23 rightAnchor];
  v110 = [v112 constraintEqualToAnchor:v111];
  v125[4] = v110;
  v109 = [(BEHairlineDividerView *)self->_headerDividerView topAnchor];
  v108 = [(UIView *)self->_container topAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v125[5] = v107;
  v106 = [(BEHairlineDividerView *)self->_headerDividerView heightAnchor];
  v25 = +[UIScreen mainScreen];
  [v25 scale];
  double v27 = 1.0 / v26;

  v105 = [v106 constraintEqualToConstant:v27];
  v125[6] = v105;
  v104 = [(UIView *)self->_container topAnchor];
  v103 = [(UISearchBar *)self->_searchField bottomAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v125[7] = v102;
  v101 = [(UIView *)self->_container leadingAnchor];
  v100 = [v23 leadingAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v125[8] = v99;
  v98 = [(UIView *)self->_container trailingAnchor];
  v97 = [v23 trailingAnchor];
  v95 = [v98 constraintEqualToAnchor:v97];
  v125[9] = v95;
  v94 = [(UIView *)self->_container bottomAnchor];
  v93 = [v24 bottomAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v125[10] = v92;
  v90 = [(UITableView *)self->_resultsTable leftAnchor];
  v89 = [(UIView *)self->_container leftAnchor];
  v88 = [v90 constraintEqualToAnchor:v89];
  v125[11] = v88;
  v87 = [(UITableView *)self->_resultsTable topAnchor];
  v86 = [(BEHairlineDividerView *)self->_headerDividerView bottomAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v125[12] = v85;
  v84 = [(UITableView *)self->_resultsTable rightAnchor];
  v83 = [(UIView *)self->_container rightAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v125[13] = v82;
  v80 = [(UITableView *)self->_resultsTable bottomAnchor];
  v79 = [(UIView *)self->_footer topAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v125[14] = v78;
  v77 = [(UIView *)self->_footer leftAnchor];
  v96 = v23;
  v76 = [v23 leftAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v125[15] = v75;
  v74 = [(UIView *)self->_footer rightAnchor];
  v73 = [v23 rightAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v125[16] = v72;
  v71 = [(UIView *)self->_footer bottomAnchor];
  v70 = [(UIView *)self->_container bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v125[17] = v69;
  v68 = [(UIView *)self->_footer widthAnchor];
  v67 = [(UIView *)self->_container widthAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v125[18] = v66;
  v65 = [(UIButton *)self->_googleButton leadingAnchor];
  v81 = v24;
  v64 = [v24 leadingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:15.0];
  v125[19] = v63;
  v62 = [(UIButton *)self->_googleButton bottomAnchor];
  v61 = [(UIView *)self->_footer bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v125[20] = v60;
  v58 = [(UIButton *)self->_googleButton widthAnchor];
  v57 = [(UIView *)self->_footer widthAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 multiplier:0.5 constant:-15.0];
  v125[21] = v56;
  v59 = [(UIButton *)self->_googleButton heightAnchor];
  v55 = [(UIView *)self->_footer heightAnchor];
  v54 = [v59 constraintEqualToAnchor:v55];
  v125[22] = v54;
  v53 = [(UIButton *)self->_wikipediaButton trailingAnchor];
  v52 = [v24 trailingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-15.0];
  v125[23] = v51;
  CGRect v50 = [(UIButton *)self->_wikipediaButton bottomAnchor];
  objc_super v49 = [(UIView *)self->_footer bottomAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v125[24] = v48;
  id v47 = [(UIButton *)self->_wikipediaButton widthAnchor];
  v46 = [(UIView *)self->_footer widthAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 multiplier:0.5 constant:-15.0];
  v125[25] = v45;
  v91 = [(UIButton *)self->_wikipediaButton heightAnchor];
  v44 = [(UIView *)self->_footer heightAnchor];
  v43 = [v91 constraintEqualToAnchor:v44];
  v125[26] = v43;
  uint64_t v42 = [(BEHairlineDividerView *)self->_footerTopBorderView leadingAnchor];
  double v41 = [(BEHairlineDividerView *)self->_footerTopBorderView leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v125[27] = v40;
  v28 = [(BEHairlineDividerView *)self->_footerTopBorderView topAnchor];
  v29 = [(BEHairlineDividerView *)self->_footerTopBorderView topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v125[28] = v30;
  double v31 = [(BEHairlineDividerView *)self->_footerTopBorderView widthAnchor];
  uint64_t v32 = [(BEHairlineDividerView *)self->_footerTopBorderView widthAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v125[29] = v33;
  v34 = [(BEHairlineDividerView *)self->_footerTopBorderView heightAnchor];
  v35 = +[UIScreen mainScreen];
  [v35 scale];
  double v37 = 1.0 / v36;

  v38 = [v34 constraintEqualToConstant:v37];
  v125[30] = v38;
  v39 = +[NSArray arrayWithObjects:v125 count:31];
  +[NSLayoutConstraint activateConstraints:v39];

  [(UIView *)self->_footer setHidden:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = [(BKSearchViewController *)self ba_analyticsTracker];

  if (!v4) {
    id v5 = [(BKSearchViewController *)self ba_setupNewAnalyticsTrackerWithName:@"ContentSearch"];
  }
  [(UISearchBar *)self->_searchField setShowsCancelButton:[(BKSearchViewController *)self isModalSheet]];
  resultsTable = self->_resultsTable;
  v7 = [(UITableView *)resultsTable indexPathForSelectedRow];
  [(UITableView *)resultsTable deselectRowAtIndexPath:v7 animated:0];

  [(BKSearchViewController *)self stylizeForTheme];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v4 viewIsAppearing:a3];
  [(BKSearchViewController *)self _updateWebsearchButtonsStatus];
  [(BKSearchViewController *)self _updateContentSize:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v13 viewDidAppear:a3];
  objc_super v4 = [(BKSearchViewController *)self searchString];
  [(UISearchBar *)self->_searchField setText:v4];
  if ((unint64_t)[v4 length] > 2
    || [(BKSearchViewController *)self accessibilityRequiresActivateForSearchField])
  {
    id v5 = [(BKSearchViewController *)self searchController];
    if ([v5 searchWasCompleted])
    {
    }
    else
    {
      id v6 = [(BKSearchViewController *)self searchController];
      unsigned __int8 v7 = [v6 isSearching];

      if ((v7 & 1) == 0)
      {
        objc_super v8 = [(BKSearchViewController *)self searchController];
        v9 = [v8 results];
        id v10 = [v9 count];

        v11 = [(BKSearchViewController *)self searchController];
        v12 = v11;
        if (v10) {
          [v11 continueSearch];
        }
        else {
          [v11 beginSearchWithReportAnalytics:1];
        }
      }
    }
  }
  else
  {
    [(UISearchBar *)self->_searchField becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = [(BKSearchViewController *)self searchController];
  unsigned __int8 v5 = [v4 searchWasCompleted];

  if ((v5 & 1) == 0)
  {
    id v6 = [(BKSearchViewController *)self searchController];
    [v6 pauseSearch];
  }
  [(UISearchBar *)self->_searchField resignFirstResponder];
  [(BKSearchViewController *)self _updateWebsearchButtonsStatus];
  [(BKSearchViewController *)self _updateContentSize:0];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  [(BKSearchViewController *)self stylizeForTheme];
  [(BKSearchViewController *)self _updateCancelButton];
  [(BKSearchViewController *)self _updateWebsearchButtonsStatus];

  [(BKSearchViewController *)self _updateContentSize:0];
}

- (void)didReceiveMemoryWarning
{
  if ([(BKSearchViewController *)self isViewLoaded])
  {
    id v3 = [(BKSearchViewController *)self view];
    objc_super v4 = [v3 window];

    if (!v4)
    {
      unsigned __int8 v5 = [(BKSearchViewController *)self searchController];
      [v5 didReceiveMemoryWarning];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)BKSearchViewController;
  [(BKSearchViewController *)&v6 didReceiveMemoryWarning];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BKSearchViewController;
  -[BKSearchViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_super v8 = [(BKSearchViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
    [WeakRetained searchViewController:self willTransitionToSize:width, height];

    unsigned int v15 = [(BKSearchViewController *)self sizeChangesRequireBookRepagination];
    char v16 = v15;
    if (v15)
    {
      v17 = [(BKSearchViewController *)self searchController];
      [v17 cancelSearch];
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_96A68;
    v18[3] = &unk_1DCE68;
    v18[4] = self;
    *(double *)&v18[5] = width;
    *(double *)&v18[6] = height;
    char v19 = v16;
    [v7 animateAlongsideTransition:0 completion:v18];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(BKSearchViewController *)self isModalSheet]) {
    return 26;
  }
  else {
    return 30;
  }
}

- (BOOL)isModalSheet
{
  return [(BKSearchViewController *)self _isInPopoverPresentation] ^ 1;
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSearchViewController;
  id v5 = [(BKSearchViewController *)&v7 theme];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKSearchViewController;
    [(BKSearchViewController *)&v6 setTheme:v4];
    [(BKSearchViewController *)self stylizeForTheme];
  }
}

- (void)stylizeForTheme
{
  id v3 = [(BKSearchViewController *)self viewIfLoaded];
  if (v3)
  {
    id v33 = v3;
    id v4 = [(BKSearchViewController *)self themePage];
    id v5 = [v4 backgroundColorForTraitEnvironment:self];
    uint64_t v6 = [v4 secondaryTextColor];
    objc_super v7 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
    objc_super v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody];
    double v9 = [v7 imageWithConfiguration:v8];

    double v10 = [v9 imageWithTintColor:v6];

    uint64_t v11 = [v10 imageWithRenderingMode:1];

    double v12 = +[UIImage systemImageNamed:@"magnifyingglass"];
    objc_super v13 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody];
    int v14 = [v12 imageWithConfiguration:v13];

    unsigned int v15 = (void *)v6;
    uint64_t v16 = [v14 imageWithTintColor:v6];

    v17 = [v4 keyColor];
    [v33 setTintColor:v17];

    [(UIView *)self->_container setBackgroundColor:v5];
    [v33 setBackgroundColor:v5];
    [(UITableView *)self->_resultsTable setBackgroundColor:v5];
    [(UIView *)self->_footer setBackgroundColor:v5];
    v18 = [v4 tableViewSeparatorColor];
    [(UITableView *)self->_resultsTable setSeparatorColor:v18];

    char v19 = [(BKSearchViewController *)self popoverPresentationController];
    [v19 setBackgroundColor:v5];

    -[UISearchBar setBarStyle:](self->_searchField, "setBarStyle:", [v4 isNight:self]);
    [(UISearchBar *)self->_searchField setBackgroundColor:v5];
    -[UISearchBar setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", [v4 keyboardAppearance]);
    uint64_t v32 = (void *)v11;
    uint64_t v20 = v11;
    double v21 = (void *)v16;
    [(UISearchBar *)self->_searchField setImage:v20 forSearchBarIcon:1 state:0];
    [(UISearchBar *)self->_searchField setImage:v16 forSearchBarIcon:0 state:0];
    v22 = [(UISearchBar *)self->_searchField searchField];
    if (([(BKSearchViewController *)self im_isCompactWidth] & 1) != 0
      || [(BKSearchViewController *)self im_isCompactHeight])
    {
      double v23 = [v4 secondaryBackgroundColor];
      [v22 setBackgroundColor:v23];
    }
    else
    {
      [v22 setBackgroundColor:0];
    }
    double v24 = [v4 primaryTextColor];
    [v22 setTextColor:v24];

    v25 = [v22 _placeholderLabel];
    double v26 = v15;
    [v25 setTextColor:v15];

    double v27 = [v22 leftView];
    [v27 setTintColor:v15];

    if ([v22 isFirstResponder]) {
      [v22 reloadInputViewsWithoutReset];
    }
    v28 = [v4 separatorColor];
    [(BEHairlineDividerView *)self->_headerDividerView setDividerColor:v28];
    [(BEHairlineDividerView *)self->_footerTopBorderView setDividerColor:v28];
    uint64_t v29 = [v33 window];
    if (v29)
    {
      v30 = (void *)v29;
      unsigned int v31 = [(BKSearchViewController *)self isModalSheet];

      if (v31) {
        [(BKSearchViewController *)self setNeedsStatusBarAppearanceUpdate];
      }
    }
    [(UITableView *)self->_resultsTable reloadData];

    id v3 = v33;
  }
}

- (void)contentSizeCategoryDidChange
{
  self->_maxContentHeightWasReached = 0;
  [(BKSearchViewController *)self _reloadResultsAndResizeIfNecessary:0];
}

- (id)searchController
{
  searchController = self->_searchController;
  if (!searchController)
  {
    id v4 = objc_alloc_init(BKSearchController);
    id v5 = self->_searchController;
    self->_searchController = v4;

    [(BKSearchController *)self->_searchController setDelegate:self];
    [(BKSearchController *)self->_searchController setPageCount:[(BKPaginationController *)self->_paginationController pageTotal]];
    searchController = self->_searchController;
  }
  uint64_t v6 = searchController;

  return v6;
}

- (id)physicalPageMapForPageTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSearchViewController *)self searchController];
  uint64_t v6 = [v5 searchBook];
  objc_super v7 = [v6 physicalPageMap];

  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_971EC;
  v18 = sub_971FC;
  id v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_97204;
  v11[3] = &unk_1DCE90;
  id v8 = v4;
  id v12 = v8;
  objc_super v13 = &v14;
  [v7 indexOfObjectWithOptions:1 passingTest:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)searchStringIsPageNumber
{
  id v3 = [(BKSearchViewController *)self searchString];
  if ([(BKSearchViewController *)self showPhysicalPages])
  {
    id v4 = [(BKSearchViewController *)self physicalPageMapForPageTitle:v3];
    unsigned __int8 v5 = v4 != 0;
LABEL_7:

    goto LABEL_8;
  }
  int v6 = [v3 intValue];
  if (v6 >= 1)
  {
    unint64_t v7 = v6;
    id v8 = [(BKSearchViewController *)self searchController];
    id v9 = [v8 pageCount];

    if ((unint64_t)v9 >= v7)
    {
      id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      double v10 = [v3 stringByTrimmingCharactersInSet:v4];
      uint64_t v11 = +[NSString stringWithFormat:@"%ld", v7];
      unsigned __int8 v5 = [v10 isEqualToString:v11];

      goto LABEL_7;
    }
  }
  unsigned __int8 v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)_shouldShowSearchResultsView
{
  if ([(BKSearchViewController *)self isModalSheet]) {
    return 1;
  }
  id v4 = [(BKSearchViewController *)self searchString];
  if ((unint64_t)[v4 length] <= 2)
  {
    unsigned __int8 v5 = [(BKSearchViewController *)self searchController];
    int v6 = [v5 results];
    if ([v6 count])
    {
      BOOL v3 = 1;
    }
    else
    {
      unint64_t v7 = [(BKSearchViewController *)self searchController];
      if ([v7 searchWasCompleted])
      {
        BOOL v3 = 1;
      }
      else
      {
        id v8 = [(BKSearchViewController *)self searchController];
        if ([v8 isSearching]) {
          BOOL v3 = 1;
        }
        else {
          BOOL v3 = [(BKSearchViewController *)self searchStringIsPageNumber];
        }
      }
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (CGSize)_preferredContentSizeIsMinimum:(BOOL *)a3
{
  if (![(BKSearchViewController *)self isViewLoaded])
  {
    char v7 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  unsigned __int8 v5 = [(BKSearchViewController *)self view];
  [v5 layoutIfNeeded];

  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityMedium])
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])double width = 640.0; {
    else
    }
      double width = 480.0;
  }
  else
  {
    double width = 320.0;
  }
  [(BKSearchViewController *)self maxContentHeight];
  if (v9 <= 0.0)
  {
    double v11 = kBESearchPopoverViewMaxContentHeight;
  }
  else
  {
    [(BKSearchViewController *)self maxContentHeight];
    double v11 = v10;
  }
  [(UISearchBar *)self->_searchField layoutIfNeeded];
  -[UISearchBar sizeThatFits:](self->_searchField, "sizeThatFits:", width, v11);
  double v13 = v12 + 5.0;
  -[NSLayoutConstraint setConstant:](self->_searchBarHeightConstraint, "setConstant:");
  uint64_t v14 = [(UISearchBar *)self->_searchField superview];
  [v14 layoutIfNeeded];

  unsigned int v15 = [(BKSearchViewController *)self _shouldShowSearchResultsView];
  double v16 = 0.0;
  if (v15)
  {
    [(UISearchBar *)self->_searchField frame];
    CGFloat v17 = CGRectGetMaxY(v22) + 44.0;
    [(UITableView *)self->_resultsTable preferredContentHeightWithMax:v11 - v17];
    double v19 = v17 + v18;
    if (v11 < v19) {
      double v19 = v11;
    }
    if (v19 >= v13) {
      double v13 = v19;
    }
    double v16 = 1.0;
  }
  [(UIView *)self->_container setAlpha:v16];
  char v7 = v15 ^ 1;
  double height = ceil(v13);
  if (a3) {
LABEL_19:
  }
    *a3 = v7;
LABEL_20:
  double v20 = width;
  result.double height = height;
  result.double width = v20;
  return result;
}

- (void)_updateCancelButton
{
  BOOL v3 = [(BKSearchViewController *)self isModalSheet];
  searchField = self->_searchField;

  [(UISearchBar *)searchField setShowsCancelButton:v3];
}

- (void)_updateContentSize:(BOOL)a3
{
  char v12 = 0;
  [(BKSearchViewController *)self _preferredContentSizeIsMinimum:&v12];
  double v6 = v5;
  double v8 = v7;
  if ([(BKSearchViewController *)self resizeAnimationInProgress] && a3)
  {
    [(BKSearchViewController *)self setResizeRequestPending:1];
  }
  else
  {
    [(BKSearchViewController *)self maxContentHeight];
    if (v9 <= 0.0) {
      double v10 = kBESearchPopoverViewMaxContentHeight;
    }
    else {
      [(BKSearchViewController *)self maxContentHeight];
    }
    self->_maxContentHeightWasReached = v8 >= v10;
    +[CATransaction begin];
    [(BKSearchViewController *)self setResizeAnimationInProgress:1];
    [(BKSearchViewController *)self setResizeRequestPending:0];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_97814;
    v11[3] = &unk_1DAB88;
    void v11[4] = self;
    +[CATransaction setCompletionBlock:v11];
    -[BKSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    +[CATransaction commit];
    -[BKSearchViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    [(UITableView *)self->_resultsTable reloadData];
  }
}

- (void)_updateWebsearchButtonsStatus
{
  BOOL v3 = [(BKSearchViewController *)self searchString];
  id v4 = [v3 length];

  double v5 = 1.0;
  if (!v4 && ([(BKSearchViewController *)self im_isCompactWidth] & 1) == 0) {
    double v5 = (double)[(BKSearchViewController *)self im_isCompactHeight];
  }
  BOOL v6 = v4 != 0;
  [(UIButton *)self->_wikipediaButton setEnabled:v6];
  [(UIButton *)self->_googleButton setEnabled:v6];
  [(UIButton *)self->_wikipediaButton setAlpha:v5];
  [(UIButton *)self->_googleButton setAlpha:v5];

  [(BKSearchViewController *)self _updateFooterConstraint];
}

- (void)_updateFooterConstraint
{
  if ([(UIButton *)self->_wikipediaButton isEnabled]
    && ([(UIView *)self->_container alpha], v3 > 0.0)
    || ([(BKSearchViewController *)self im_isCompactWidth] & 1) != 0)
  {
    double v4 = 44.0;
  }
  else
  {
    unsigned int v5 = [(BKSearchViewController *)self im_isCompactHeight];
    double v4 = 44.0;
    if (!v5) {
      double v4 = 0.0;
    }
  }
  [(NSLayoutConstraint *)self->_footerHeightConstraint setConstant:v4];
  container = self->_container;

  [(UIView *)container layoutIfNeeded];
}

- (NSString)searchString
{
  return [(BKSearchController *)self->_searchController searchString];
}

- (void)setSearchString:(id)a3
{
  id v8 = a3;
  double v4 = [(UISearchBar *)self->_searchField text];
  id v5 = [v8 caseInsensitiveCompare:v4];

  if (v5)
  {
    [(UISearchBar *)self->_searchField setText:v8];
    BOOL v6 = [(BKSearchViewController *)self searchController];
    [v6 setSearchString:v8];

    double v7 = [(BKSearchViewController *)self searchController];
    [v7 beginSearchWithReportAnalytics:1];
  }
}

- (void)setShowPhysicalPages:(BOOL)a3
{
  if (self->_showPhysicalPages != a3)
  {
    self->_showPhysicalPages = a3;
    [(UITableView *)self->_resultsTable reloadData];
  }
}

- (void)paginationComplete
{
  [(BKSearchController *)self->_searchController setPageCount:[(BKPaginationController *)self->_paginationController pageTotal]];
  resultsTable = self->_resultsTable;

  [(UITableView *)resultsTable reloadData];
}

- (void)setPaginationController:(id)a3
{
  id v5 = (BKPaginationController *)a3;
  p_paginationController = &self->_paginationController;
  paginationController = self->_paginationController;
  double v10 = v5;
  if (paginationController != v5)
  {
    if (paginationController)
    {
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self name:BKPaginationCompleteForBookNotification object:*p_paginationController];
    }
    objc_storeStrong((id *)&self->_paginationController, a3);
    if (*p_paginationController)
    {
      double v9 = +[NSNotificationCenter defaultCenter];
      [v9 addObserver:self selector:"paginationComplete" name:BKPaginationCompleteForBookNotification object:*p_paginationController];
    }
  }
}

- (void)revealSearchResult:(id)a3
{
}

- (void)revealSearchResult:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_searchDelegate);
    [v8 searchViewController:self revealSearchResult:v9 animated:v4];
  }
}

- (void)searchWebForString:(id)a3
{
  [(BKSearchViewController *)self setSearchString:a3];

  [(BKSearchViewController *)self searchWeb:0];
}

- (void)searchEncyclopediaForString:(id)a3
{
  [(BKSearchViewController *)self setSearchString:a3];

  [(BKSearchViewController *)self searchWikipedia:0];
}

- (void)openURLUsingNSString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = [objc_alloc((Class)NSURL) initWithString:v3];

    if (v5)
    {
      BOOL v4 = +[UIApplication sharedApplication];
      [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
    }
  }
}

- (id)_escapedSearchString
{
  v2 = [(BKSearchViewController *)self searchString];
  id v3 = +[NSCharacterSet URLPathAllowedCharacterSet];
  BOOL v4 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  return v4;
}

- (void)searchWeb:(id)a3
{
  BOOL v4 = [(BKSearchViewController *)self _escapedSearchString];
  id v6 = +[NSString stringWithFormat:@"x-web-search://?%@", v4];

  id v5 = v6;
  if (v6)
  {
    [(BKSearchViewController *)self openURLUsingNSString:v6];
    id v5 = v6;
  }
}

- (void)searchWikipedia:(id)a3
{
  id v10 = +[NSLocale preferredLanguages];
  if ([v10 count])
  {
    BOOL v4 = [v10 objectAtIndex:0];
  }
  else
  {
    BOOL v4 = @"en";
  }
  id v5 = [(__CFString *)v4 substringToIndex:2];

  id v6 = AEBundle();
  char v7 = [v6 localizedStringForKey:@"https://%2$@.wikipedia.org/wiki/%1$@" value:&stru_1DF0D8 table:0];
  id v8 = [(BKSearchViewController *)self _escapedSearchString];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8, v5);

  if (v9) {
    [(BKSearchViewController *)self openURLUsingNSString:v9];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(BKSearchViewController *)self searchController];
  char v7 = v6;
  if (a4)
  {
    id v8 = [v6 results];
    id v9 = [v8 count];

    int64_t v10 = (int64_t)v9
        + [(BKSearchViewController *)self _shouldShowSearchResultsView];
  }
  else
  {
    int64_t v10 = [(BKSearchViewController *)self searchStringIsPageNumber];
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (char *)&dword_0 + 1)
  {
    id v8 = [v7 row];
    id v9 = [(BKSearchViewController *)self searchController];
    int64_t v10 = [v9 results];
    id v11 = [v10 count];

    if (v8 == v11) {
      [(BKSearchViewController *)self _loadingCellForTableView:v6];
    }
    else {
      -[BKSearchViewController _resultsCellForRow:inTableView:](self, "_resultsCellForRow:inTableView:", [v7 row], v6);
    }
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([v7 section]) {
    goto LABEL_13;
  }
  char v12 = [(BKSearchViewController *)self themePage];
  unsigned int v13 = [v12 isNight:self];
  uint64_t v14 = @"pageNumberCell";
  if (v13) {
    uint64_t v14 = @"pageNumberCell-night";
  }
  unsigned int v15 = v14;
  id v16 = [v6 dequeueReusableCellWithIdentifier:v15];
  if (!v16)
  {
    id v16 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:v15];
    CGFloat v17 = +[UIFont boldSystemFontOfSize:(double)kBESearchResultFontSize];
    double v18 = [v16 textLabel];
    [v18 setFont:v17];

    id v19 = objc_alloc((Class)UIView);
    double v20 = [v16 contentView];
    [v20 bounds];
    id v21 = [v19 initWithFrame:];
    [v16 setSelectedBackgroundView:v21];
  }
  uint64_t v42 = v15;
  CGRect v22 = [(BKSearchViewController *)self searchController];
  double v23 = [v22 searchString];

  double v41 = v23;
  if ([(BKSearchViewController *)self showPhysicalPages])
  {
    double v24 = [(BKSearchViewController *)self physicalPageMapForPageTitle:v23];
    v25 = [v24 valueForKey:@"name"];

    double v26 = AEBundle();
    double v27 = [v26 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v25);
  }
  else
  {
    id v30 = [v23 integerValue];
    unsigned int v31 = [(BKSearchViewController *)self searchDelegate];
    v25 = [v31 searchViewController:self chapterNameForSearchResult:0 pageNumber:v30];

    uint64_t v32 = AEBundle();
    double v26 = v32;
    if (v25)
    {
      double v27 = [v32 localizedStringForKey:@"Page %@, %@", &stru_1DF0D8, 0 value table];
      id v33 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v30 usesGroupingSeparator:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v33, v25);
    }
    else
    {
      double v27 = [v32 localizedStringForKey:@"Page %@" value:&stru_1DF0D8 table:0];
      id v33 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v30 usesGroupingSeparator:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v33, v40);
    v28 = };
  }
  v34 = [v16 textLabel];
  [v34 setText:v28];

  v35 = [(UITableView *)self->_resultsTable backgroundColor];
  [v16 setBackgroundColor:v35];

  double v36 = [v12 primaryTextColor];
  double v37 = [v16 textLabel];
  [v37 setTextColor:v36];

  v38 = [v12 tableViewCellSelectedColor];
  v39 = [v16 selectedBackgroundView];
  [v39 setBackgroundColor:v38];

  if (!v16) {
LABEL_13:
  }
    id v16 = objc_alloc_init((Class)UITableViewCell);
LABEL_14:

  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  [(BKSearchViewController *)self _resultsEstimatedRowHeight];
  return result;
}

- (BESearchResultTableViewCell)dummySearchResultsCell
{
  dummySearchResultsCell = self->_dummySearchResultsCell;
  if (!dummySearchResultsCell)
  {
    BOOL v4 = (BESearchResultTableViewCell *)[objc_alloc((Class)BESearchResultTableViewCell) initWithStyle:3 reuseIdentifier:0];
    id v5 = self->_dummySearchResultsCell;
    self->_dummySearchResultsCell = v4;

    dummySearchResultsCell = self->_dummySearchResultsCell;
  }

  return dummySearchResultsCell;
}

- (BKSearchLoadingTableViewCell)dummySearchLoadingCell
{
  dummySearchLoadingCell = self->_dummySearchLoadingCell;
  if (!dummySearchLoadingCell)
  {
    BOOL v4 = [[BKSearchLoadingTableViewCell alloc] initWithStyle:3 reuseIdentifier:0];
    id v5 = self->_dummySearchLoadingCell;
    self->_dummySearchLoadingCell = v4;

    [(BKSearchViewController *)self _configureLoadingCell:self->_dummySearchLoadingCell];
    dummySearchLoadingCell = self->_dummySearchLoadingCell;
  }

  return dummySearchLoadingCell;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = AEBundle();
    id v8 = v7;
    CFStringRef v9 = @"Text";
  }
  else
  {
    if (a4 || ![(BKSearchViewController *)self searchStringIsPageNumber])
    {
      int64_t v10 = 0;
      goto LABEL_8;
    }
    id v7 = AEBundle();
    id v8 = v7;
    CFStringRef v9 = @"Page Number";
  }
  int64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1DF0D8 table:0];

LABEL_8:
  id v11 = [(BKSearchViewController *)self themePage];
  id v12 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"BKSearchTableHeaderViewIdentifier"];
  if (!v12) {
    id v12 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithReuseIdentifier:@"BKSearchTableHeaderViewIdentifier"];
  }
  unsigned int v13 = [v12 textLabel];
  [v13 setText:v10];

  uint64_t v14 = [v11 secondaryTextColor];
  unsigned int v15 = [v12 textLabel];
  [v15 setTextColor:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_987E0;
  v19[3] = &unk_1DCEB8;
  id v20 = v11;
  id v21 = v6;
  id v16 = v6;
  id v17 = v11;
  [v12 _setBackgroundViewConfigurationProvider:v19];

  return v12;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1
    || (double v7 = 0.0, !a4) && [(BKSearchViewController *)self searchStringIsPageNumber])
  {
    [(BKSearchViewController *)self _resultsHeaderHeight];
    double v7 = v8;
  }

  return v7;
}

- (void)_updateLoadingCell:(id)a3
{
  id v31 = a3;
  BOOL v4 = [(BKSearchViewController *)self searchController];
  unsigned int v5 = [v4 isSearching];

  id v6 = [v31 activityIndicator];
  double v7 = v6;
  if (v5)
  {
    unsigned __int8 v8 = [v6 isAnimating];

    if ((v8 & 1) == 0)
    {
      CFStringRef v9 = [v31 activityIndicator];
      [v9 startAnimating];
    }
    int64_t v10 = AEBundle();
    id v11 = [v10 localizedStringForKey:@"Searching…" value:&stru_1DF0D8 table:0];
    id v12 = 0;
    goto LABEL_5;
  }
  [v6 stopAnimating];

  unsigned int v13 = [(BKSearchViewController *)self searchController];
  unsigned int v14 = [v13 wasAborted];

  if (v14)
  {
    unsigned int v15 = AEBundle();
    id v16 = v15;
    CFStringRef v17 = @"Search Cancelled";
  }
  else
  {
    double v18 = [(BKSearchViewController *)self searchController];
    unsigned int v19 = [v18 hasPartialResults];

    if (v19)
    {
      unsigned int v15 = AEBundle();
      id v16 = v15;
      CFStringRef v17 = @"Load More…";
    }
    else
    {
      id v20 = [(BKSearchViewController *)self searchController];
      unsigned int v21 = [v20 searchWasCompleted];

      if (!v21)
      {
        id v11 = 0;
        goto LABEL_19;
      }
      unsigned int v15 = AEBundle();
      id v16 = v15;
      CFStringRef v17 = @"Search Completed";
    }
  }
  id v11 = [v15 localizedStringForKey:v17 value:&stru_1DF0D8 table:0];

  if (v11)
  {
    CGRect v22 = [(BKSearchViewController *)self searchController];
    double v23 = [v22 results];
    double v24 = (char *)[v23 count];

    if (v24 == (unsigned char *)&dword_0 + 1)
    {
      int64_t v10 = AEBundle();
      v25 = [v10 localizedStringForKey:@"%@ match found" value:&stru_1DF0D8 table:0];
      double v26 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:1 usesGroupingSeparator:0];
      id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v26);
    }
    else
    {
      int64_t v10 = AEBundle();
      if (v24)
      {
        double v27 = [v10 localizedStringForKey:@"%@ matches found" value:&stru_1DF0D8 table:0];
        v28 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v24 usesGroupingSeparator:0];
        id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28);
      }
      else
      {
        id v12 = [v10 localizedStringForKey:@"No matches found" value:&stru_1DF0D8 table:0];
      }
    }
LABEL_5:

    goto LABEL_20;
  }
LABEL_19:
  id v12 = 0;
LABEL_20:
  uint64_t v29 = [v31 textLabel];
  [v29 setText:v11];

  id v30 = [v31 detailTextLabel];
  [v30 setText:v12];
}

- (void)_configureLoadingCell:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 setSelectionStyle:0];
    id v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    double v4 = (double)kBESearchResultFontSize;
    [v11 _scaledValueForValue:(double)kBESearchResultFontSize];
    unsigned int v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    id v6 = [v3 textLabel];
    [v6 setFont:v5];

    double v7 = [v3 textLabel];
    [v7 setTextAlignment:1];

    [v11 _scaledValueForValue:v4];
    unsigned __int8 v8 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    CFStringRef v9 = [v3 textLabel];
    [v9 setFont:v8];

    int64_t v10 = [v3 detailTextLabel];

    [v10 setTextAlignment:1];
  }
}

- (id)_loadingCellForTableView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKSearchViewController *)self themePage];
  unsigned int v6 = [v5 isNight:self];
  double v7 = @"loadingCell";
  if (v6) {
    double v7 = @"loadingCell-night";
  }
  unsigned __int8 v8 = v7;
  CFStringRef v9 = [v4 dequeueReusableCellWithIdentifier:v8];

  if (!v9)
  {
    CFStringRef v9 = [[BKSearchLoadingTableViewCell alloc] initWithStyle:3 reuseIdentifier:v8];
    [(BKSearchViewController *)self _configureLoadingCell:v9];
  }
  int64_t v10 = [v5 primaryTextColor];
  id v11 = [(UITableView *)self->_resultsTable backgroundColor];
  [(BKSearchLoadingTableViewCell *)v9 setBackgroundColor:v11];
  id v12 = [(BKSearchLoadingTableViewCell *)v9 contentView];
  [v12 setBackgroundColor:v11];

  unsigned int v13 = [(BKSearchLoadingTableViewCell *)v9 activityIndicator];
  [v13 setColor:v10];

  unsigned int v14 = [(BKSearchLoadingTableViewCell *)v9 textLabel];
  [v14 setTextColor:v10];

  unsigned int v15 = [(BKSearchLoadingTableViewCell *)v9 detailTextLabel];
  [v15 setTextColor:v10];

  [(BKSearchViewController *)self _updateLoadingCell:v9];

  return v9;
}

- (void)_configureResultsCell:(id)a3 forRow:(unint64_t)a4 inTableView:(id)a5
{
  id v62 = a3;
  id v9 = a5;
  int64_t v10 = [(BKSearchViewController *)self themePage];
  id v11 = [v10 primaryTextColor];
  id v12 = [(UITableView *)self->_resultsTable backgroundColor];
  unsigned int v13 = [v62 titleLabel];
  [v13 setTextColor:v11];

  unsigned int v14 = [v62 resultLabel];
  [v14 setTextColor:v11];

  unsigned int v15 = [v10 isNight:self];
  if (v15)
  {
    id v16 = [v10 buttonTitleColor];
  }
  else
  {
    id v16 = 0;
  }
  CFStringRef v17 = [v62 resultLabel];
  [v17 setBoldColor:v16];

  if (v15) {
  double v18 = [v10 secondaryTextColor];
  }
  unsigned int v19 = [v62 pageNumberLabel];
  [v19 setTextColor:v18];

  id v20 = [v10 tableViewCellSelectedColor];
  unsigned int v21 = [v62 selectedBackgroundView];
  [v21 setBackgroundColor:v20];

  [v62 setBackgroundColor:v12];
  [v9 frame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v64.origin.x = v23;
  v64.origin.double y = v25;
  v64.size.double width = v27;
  v64.size.double height = v29;
  [v62 setMaxWidth:CGRectGetWidth(v64)];
  id v30 = [(BKSearchViewController *)self searchController];
  id v31 = [v30 results];
  id v32 = [v31 count];

  if ((unint64_t)v32 > a4)
  {
    objc_opt_class();
    id v33 = [(BKSearchViewController *)self searchController];
    v34 = [v33 results];
    v35 = [v34 objectAtIndex:a4];
    double v36 = BUDynamicCast();

    double v37 = [(BKSearchViewController *)self searchDelegate];
    id v38 = [v37 searchViewController:self pageNumberForDocumentOrdinal:[v36 ordinal]];

    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    if (v38 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
    uint64_t v39 = (uint64_t)v38 + (void)[v36 pageOffset];
    uint64_t v40 = [(BKSearchViewController *)self searchController];
    v34 = [v40 searchBook];
    unsigned __int8 v41 = [v34 suppressTOC];

    if (v41)
    {
LABEL_9:
      uint64_t v42 = 0;
    }
    else
    {
      v43 = [(BKSearchViewController *)self paginationController];

      if (v43)
      {
        v34 = [(BKSearchViewController *)self paginationController];
        [v34 titleForChapterAtPageNumber:v39];
      }
      else
      {
        v34 = [(BKSearchViewController *)self searchDelegate];
        [v34 searchViewController:self chapterNameForSearchResult:v36 pageNumber:v39];
      uint64_t v42 = };
    }
    unsigned __int8 v44 = [(BKSearchViewController *)self showPhysicalPages];
    if ((v44 & 1) != 0
      || ([(BKSearchViewController *)self searchController],
          v34 = objc_claimAutoreleasedReturnValue(),
          [v34 searchBook],
          unsigned int v5 = objc_claimAutoreleasedReturnValue(),
          ([v5 isFixedLayout] & 1) != 0))
    {
      v45 = [v36 pageTitle];

      if ((v44 & 1) == 0)
      {
      }
      if (!v45)
      {
LABEL_22:
        if ((unint64_t)(v39 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
        {
          if (v42) {
            v46 = v42;
          }
          else {
            v46 = &stru_1DF0D8;
          }
          CGRect v50 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:v39 usesGroupingSeparator:0];
          goto LABEL_35;
        }
        id v47 = [v36 pageTitle];
        id v48 = [v47 length];

        if (v48)
        {
          if (v42)
          {
            objc_super v49 = AEBundle();
            CGRect v50 = &stru_1DF0D8;
            v51 = [v49 localizedStringForKey:@"%@, %@", &stru_1DF0D8, 0 value table];
            v52 = [v36 pageTitle];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v42, v52);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_35:
            v54 = [v62 titleLabel];
            [v54 setText:v46];

            v55 = [v36 text];
            v56 = [v62 resultLabel];
            [v56 setText:v55];

            id v57 = [v36 searchStringRange];
            uint64_t v59 = v58;
            v60 = [v62 resultLabel];
            [v60 setBoldRange:v57, v59];

            v61 = [v62 pageNumberLabel];
            [v61 setText:v50];

            [v62 applyLabelFonts];
            [v62 updateConstraintsIfNeeded];

            goto LABEL_36;
          }
          v53 = [v36 pageTitle];
        }
        else
        {
          if (!v42)
          {
            CGRect v50 = &stru_1DF0D8;
            v46 = &stru_1DF0D8;
            goto LABEL_35;
          }
          v53 = v42;
        }
        v46 = v53;
        CGRect v50 = &stru_1DF0D8;
        goto LABEL_35;
      }
      v34 = [v36 pageTitle];
      uint64_t v39 = (uint64_t)[v34 integerValue];
    }
    else
    {
    }
    goto LABEL_22;
  }
LABEL_36:
}

- (id)_resultsCellForRow:(unint64_t)a3 inTableView:(id)a4
{
  id v6 = a4;
  double v7 = [(BKSearchViewController *)self themePage];
  unsigned int v8 = [v7 isNight:self];

  id v9 = (id *)&kBESearchTableViewCellResultsNightIdentifier;
  if (!v8) {
    id v9 = (id *)&kBESearchTableViewCellResultsIdentifier;
  }
  id v10 = *v9;
  id v11 = [v6 dequeueReusableCellWithIdentifier:v10];
  if (!v11) {
    id v11 = [objc_alloc((Class)BESearchResultTableViewCell) initWithStyle:0 reuseIdentifier:v10];
  }
  [(BKSearchViewController *)self _configureResultsCell:v11 forRow:a3 inTableView:v6];

  return v11;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == (char *)&dword_0 + 1
    && (unsigned int v8 = (char *)[v7 row],
        (uint64_t)v8 >= (uint64_t)((char *)[v6 numberOfRowsInSection:1] - 1))
    && ([(BKSearchViewController *)self searchController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 hasPartialResults],
        v9,
        !v10))
  {
    id v11 = 0;
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v6 section] != (char *)&dword_0 + 1)
  {
    if ([v6 section]) {
      goto LABEL_14;
    }
    id v11 = [(BKSearchViewController *)self searchString];
    if ([(BKSearchViewController *)self showPhysicalPages])
    {
      id v12 = [(BKSearchViewController *)self physicalPageMapForPageTitle:v11];
      unsigned int v13 = [v12 valueForKey:@"href"];

      if (!v13)
      {
LABEL_12:

        goto LABEL_13;
      }
      unsigned int v14 = [[BKAnchorPathLocation alloc] initWithPath:v13];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);
      [WeakRetained searchViewController:self turnToLocation:v14 animated:1];
    }
    else
    {
      unsigned int v13 = objc_loadWeakRetained((id *)&self->_searchDelegate);
      unsigned int v14 = [(BKSearchViewController *)self searchString];
      [v13 searchViewController:self turnToPageNumber:[v14 intValue] animated:1];
    }

    goto LABEL_12;
  }
  id v7 = (char *)[v6 row];
  if ((uint64_t)v7 >= (uint64_t)((char *)[v18 numberOfRowsInSection:1] - 1))
  {
    id v16 = [(BKSearchViewController *)self searchController];
    unsigned int v17 = [v16 hasPartialResults];

    if (!v17) {
      goto LABEL_14;
    }
    id v11 = [(BKSearchViewController *)self searchController];
    [v11 loadMore];
  }
  else
  {
    objc_opt_class();
    unsigned int v8 = [(BKSearchViewController *)self searchController];
    id v9 = [v8 results];
    unsigned int v10 = [v9 objectAtIndex:[v6 row]];
    id v11 = BUDynamicCast();

    [(BKSearchViewController *)self revealSearchResult:v11];
  }
LABEL_13:

LABEL_14:
}

- (double)_resultsEstimatedRowHeight
{
  if (![(BKSearchViewController *)self isModalSheet])
  {
    id v3 = (double *)&kBESearchSectionSearchResultCellHeightPad;
    return *v3;
  }
  double v2 = kBESearchSectionSearchResultCellHeightPhone;
  if (+[UIFont bc_accessibilityFontSizesEnabled])
  {
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
    {
      id v3 = (double *)&kBESearchSectionSearchResultCellAccessibilityLargestHeightPhone;
      return *v3;
    }
    if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge])return kBESearchSectionSearchResultCellAccessibilityLargerHeightPhone; {
  }
    }
  return v2;
}

- (double)_resultsHeaderHeight
{
  if (!+[UIFont bc_accessibilityFontSizesEnabled])
  {
    double v2 = (double *)&kBESearchTableViewHeaderHeight;
    return *v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
  {
    double v2 = (double *)&kBESearchTableViewAccessibilityHeaderLargestHeight;
    return *v2;
  }
  double v4 = kBESearchTableViewAccessibilityHeaderLargeHeight;
  unsigned int v5 = +[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge];
  double result = kBESearchTableViewAccessibilityHeaderLargerHeight;
  if (!v5) {
    return v4;
  }
  return result;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  unsigned int v5 = [(UISearchBar *)self->_searchField text];
  id v6 = [(BKSearchViewController *)self searchController];
  [v6 setSearchString:v5];

  [(BKSearchViewController *)self _updateWebsearchButtonsStatus];
  [(BKSearchViewController *)self _updateContentSize:1];

  [(BKSearchViewController *)self _updateFooterConstraint];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v17 = a3;
  double v4 = [v17 text];
  unsigned int v5 = [(BKSearchViewController *)self searchController];
  id v6 = [v5 searchString];
  if ([v4 isEqualToString:v6])
  {
    id v7 = [(BKSearchViewController *)self searchController];
    uint64_t v8 = [v7 results];
    if (v8)
    {
      id v9 = (void *)v8;
      unsigned int v10 = [(BKSearchViewController *)self searchController];
      id v11 = [v10 results];
      id v12 = [v11 count];

      unsigned int v13 = v17;
      if (v12) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  unsigned int v14 = [v17 text];
  unsigned int v15 = [(BKSearchViewController *)self searchController];
  [v15 setSearchString:v14];

  id v16 = [(BKSearchViewController *)self searchController];
  [v16 beginSearchWithReportAnalytics:1];

  unsigned int v13 = v17;
LABEL_8:
  [v13 resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  double v4 = [(BKSearchViewController *)self searchController];
  [v4 pauseSearch];

  [(BKSearchViewController *)self revealSearchResult:0];
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_searchField == a3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)searchControllerResultsChanged:(id)a3
{
}

- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4
{
  unsigned int v5 = [a3 searchString];
  [(BKSearchViewController *)self _analyticsSubmitInBookSearchEventWithSearchText:v5];

  self->_maxContentHeightWasReached = 0;

  [(BKSearchViewController *)self _reloadResultsAndResizeIfNecessary:1];
}

- (void)searchControllerDidFinishSearching:(id)a3
{
}

- (void)_reloadResultsAndResizeIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(BKSearchViewController *)self isModalSheet] && !self->_maxContentHeightWasReached)
  {
    [(BKSearchViewController *)self _updateContentSize:v3];
    [(BKSearchViewController *)self _updateFooterConstraint];
  }
  resultsTable = self->_resultsTable;

  [(UITableView *)resultsTable reloadData];
}

- (void)searchControllerFinishedSearchingChapter:(id)a3
{
  id v4 = [(BKSearchViewController *)self _loadingCellForTableView:self->_resultsTable];
  [(BKSearchViewController *)self _updateLoadingCell:v4];
}

- (id)environmentOverrideViewForSearchController:(id)a3
{
  if ([(BKSearchViewController *)self isModalSheet])
  {
    id v4 = [(BKSearchViewController *)self viewIfLoaded];
    uint64_t v5 = [v4 window];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(BKSearchViewController *)self view];

      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v8 = [(BKSearchViewController *)self searchDelegate];
  id v7 = [v8 environmentOverrideViewForSearchViewController:self];

LABEL_7:

  return v7;
}

- (BOOL)_isRTL
{
  double v2 = [(BKSearchViewController *)self view];
  BOOL v3 = (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v2 semanticContentAttribute]) == (char *)&dword_0 + 1;

  return v3;
}

- (void)_analyticsSubmitInBookSearchEventWithSearchText:(id)a3
{
  id v9 = [(BKSearchViewController *)self ba_effectiveAnalyticsTracker];
  id v4 = [(BKSearchViewController *)self searchDelegate];
  uint64_t v5 = [v4 readingSessionDataForSearchViewController:self];

  id v6 = [(BKSearchViewController *)self searchDelegate];
  id v7 = [v6 contentDataForSearchViewController:self];

  if (v9 && v5 && v7)
  {
    uint64_t v8 = +[BAEventReporter sharedReporter];
    [v8 emitInBookSearchEventWithTracker:v9 readingSessionData:v5 contentData:v7];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 view];
  unsigned int v10 = [v9 titleLabel];
  [v10 bounds];
  [v10 convertRect:v9 toView:];
  double v12 = v11;
  double v14 = v13;
  [v7 rect];
  double v16 = v15;
  double v18 = v17;

  [v8 location];
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v27.origin.x = v12;
  v27.origin.double y = v16;
  v27.size.double width = v14;
  v27.size.double height = v18;
  v26.x = v20;
  v26.double y = v22;
  if (CGRectContainsPoint(v27, v26))
  {
    CGFloat v23 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v12, v16, v14, v18);
  }
  else
  {
    CGFloat v23 = 0;
  }

  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = [a3 view];
  uint64_t v5 = [v4 titleLabel];
  [v5 bounds];
  double v7 = v6 + -8.0;
  double v9 = v8 + -4.0;
  double v11 = v10 + 16.0;
  double v13 = v12 + 8.0;
  double v14 = [v5 superview];
  [v5 convertRect:v14 toView:v7];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  CGFloat v23 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v16, v18, v20, v22);
  id v24 = [objc_alloc((Class)UITargetedPreview) initWithView:v5];
  CGFloat v25 = +[UIPointerHighlightEffect effectWithPreview:v24];
  CGPoint v26 = +[UIPointerStyle styleWithEffect:v25 shape:v23];

  return v26;
}

- (BOOL)accessibilityRequiresActivateForSearchField
{
  return 0;
}

- (BOOL)showPhysicalPages
{
  return self->_showPhysicalPages;
}

- (BKSearchViewControllerDelegate)searchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate);

  return (BKSearchViewControllerDelegate *)WeakRetained;
}

- (void)setSearchDelegate:(id)a3
{
}

- (BKPaginationController)paginationController
{
  return self->_paginationController;
}

- (double)maxContentHeight
{
  return self->_maxContentHeight;
}

- (void)setMaxContentHeight:(double)a3
{
  self->_maxContentHeight = a3;
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
}

- (BEHairlineDividerView)footerTopBorderView
{
  return self->_footerTopBorderView;
}

- (void)setFooterTopBorderView:(id)a3
{
}

- (void)setDummySearchResultsCell:(id)a3
{
}

- (void)setDummySearchLoadingCell:(id)a3
{
}

- (BOOL)resizeAnimationInProgress
{
  return self->_resizeAnimationInProgress;
}

- (void)setResizeAnimationInProgress:(BOOL)a3
{
  self->_resizeAnimationInProgress = a3;
}

- (BOOL)resizeRequestPending
{
  return self->_resizeRequestPending;
}

- (void)setResizeRequestPending:(BOOL)a3
{
  self->_resizeRequestPending = a3;
}

- (NSLayoutConstraint)footerHeightConstraint
{
  return self->_footerHeightConstraint;
}

- (void)setFooterHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)searchBarHeightConstraint
{
  return self->_searchBarHeightConstraint;
}

- (void)setSearchBarHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dummySearchLoadingCell, 0);
  objc_storeStrong((id *)&self->_dummySearchResultsCell, 0);
  objc_storeStrong((id *)&self->_footerTopBorderView, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_storeStrong((id *)&self->_paginationController, 0);
  objc_destroyWeak((id *)&self->_searchDelegate);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_wikipediaButton, 0);
  objc_storeStrong((id *)&self->_googleButton, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_resultsTable, 0);

  objc_storeStrong((id *)&self->_searchField, 0);
}

@end