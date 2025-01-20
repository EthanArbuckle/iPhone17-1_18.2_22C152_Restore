@interface CollectionViewController
- (BOOL)_isCollectionEmpty;
- (BOOL)collectionSubHeaderViewShouldShowSortByDistance;
- (BOOL)shouldClearSearchPins;
- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4;
- (CollectionHandler)collection;
- (CollectionViewController)initWithCollection:(id)a3;
- (UIScrollView)pptTestScrollView;
- (id)_searchResults;
- (id)keyCommands;
- (id)loadingModeView;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)updateContentInjection;
- (int)listForDataSource:(id)a3;
- (unint64_t)_subHeaderTypeForCurrentState;
- (void)_addAPlaceAction:(id)a3;
- (void)_addItemsFromACToCollection;
- (void)_loadDataSource;
- (void)_presentDeletionConfirmationFor:(id)a3 inCollection:(id)a4 sourceView:(id)a5 completion:(id)a6;
- (void)_resetFooterState:(unint64_t)a3;
- (void)_transformURLCollectionInMSPCollection;
- (void)_updateFonts;
- (void)_updateFooterBottomConstraint;
- (void)_updateSorting:(int64_t)a3;
- (void)_updateState;
- (void)_updateTableInsets;
- (void)addContentToMapView;
- (void)collectionEditSessionUpdated:(id)a3;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)collectionPickerClosed:(id)a3;
- (void)collectionPickerNewCollection:(id)a3;
- (void)collectionViewTextFieldDidBecomeSelected:(id)a3;
- (void)collectionViewTextFieldDidResign:(id)a3;
- (void)contentSizeChanged:(id)a3;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSource:(id)a3 searchResultNeedsEditing:(id)a4 completion:(id)a5;
- (void)dataSourceUpdated:(id)a3;
- (void)deleteItem:(id)a3 sourceView:(id)a4 completion:(id)a5;
- (void)didChangeLayout:(unint64_t)a3;
- (void)handleDismissAction:(id)a3;
- (void)removeContentFromMapView;
- (void)requestsCollectionHeaderSaveActionForView:(id)a3;
- (void)requestsCollectionHeaderSortActionForView:(id)a3 forSortType:(int64_t)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setUpdateContentInjection:(id)a3;
- (void)showLoading:(BOOL)a3;
- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)updateTheme;
- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation CollectionViewController

- (CollectionViewController)initWithCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CollectionViewController;
  v6 = [(CollectionViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    [(CollectionHandler *)v7->_collection touch];
  }

  return v7;
}

- (id)keyCommands
{
  v12.receiver = self;
  v12.super_class = (Class)CollectionViewController;
  v3 = [(ContaineeViewController *)&v12 keyCommands];
  id v4 = [v3 mutableCopy];

  id v5 = [(CollectionViewController *)self presentedViewController];

  if (!v5)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"[Collection] Add Places" value:@"localized string not found" table:0];

    v8 = +[UIKeyCommand commandWithTitle:v7 image:0 action:"_addItemsFromACToCollection" input:@"a" modifierFlags:0x100000 propertyList:0];
    [v4 addObject:v8];

    objc_super v9 = [(CollectionDataSource *)self->_collectionDataSource keyCommands];
    [v4 addObjectsFromArray:v9];
  }
  id v10 = [v4 copy];

  return v10;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(CollectionDataSource *)self->_collectionDataSource keyCommands];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    objc_super v9 = self->_collectionDataSource;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CollectionViewController;
    objc_super v9 = [(CollectionViewController *)&v12 targetForAction:a3 withSender:v6];
  }
  id v10 = v9;

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
  v176.receiver = self;
  v176.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v176 viewDidLoad];
  v3 = [(CollectionViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CollectionView"];

  id v4 = [(ContaineeViewController *)self contentView];
  [v4 setAccessibilityIdentifier:@"CollectionContent"];

  id v5 = [[CollectionView alloc] initWithCollectionViewSize:1];
  collectionHeaderView = self->_collectionHeaderView;
  self->_collectionHeaderView = v5;

  [(CollectionView *)self->_collectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CollectionView *)self->_collectionHeaderView setCollectionInfo:self->_collection];
  [(CollectionView *)self->_collectionHeaderView setDelegate:self];
  [(CollectionView *)self->_collectionHeaderView setMaxContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
  [(CollectionView *)self->_collectionHeaderView setAllowAccessibilityTextWrapping:0];
  v7 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[ContainerHeaderView initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v11;

  [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [(ContainerHeaderView *)self->_titleHeaderView setContentCompressionResistancePriority:1 forAxis:v13];
  [(ContainerHeaderView *)self->_titleHeaderView setDelegate:self];
  [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:0.0];
  [(ContainerHeaderView *)self->_titleHeaderView setTitleView:self->_collectionHeaderView];
  -[ContainerHeaderView setTitleViewInsets:](self->_titleHeaderView, "setTitleViewInsets:", 4.0, 0.0, 0.0, 0.0);
  v14 = [(ContaineeViewController *)self headerView];
  [v14 addSubview:self->_titleHeaderView];

  v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  subHeaderView = self->_subHeaderView;
  self->_subHeaderView = v15;

  LODWORD(v17) = 1148829696;
  [(UIView *)self->_subHeaderView setContentCompressionResistancePriority:1 forAxis:v17];
  [(UIView *)self->_subHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_subHeaderView setAccessibilityIdentifier:@"CollectionSubHeader"];
  v18 = [(ContaineeViewController *)self contentView];
  [v18 addSubview:self->_subHeaderView];

  v19 = [[CollectionSubHeaderView alloc] initWithType:[(CollectionViewController *)self _subHeaderTypeForCurrentState]];
  subHeaderContentView = self->_subHeaderContentView;
  self->_subHeaderContentView = v19;

  [(CollectionSubHeaderView *)self->_subHeaderContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CollectionSubHeaderView *)self->_subHeaderContentView setDelegate:self];
  [(CollectionSubHeaderView *)self->_subHeaderContentView setSortType:[(CollectionHandler *)self->_collection sortType]];
  [(UIView *)self->_subHeaderView addSubview:self->_subHeaderContentView];
  v21 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = &v21->super;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v23];

  [(UITableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"CollectionTable"];
  v24 = [(ContaineeViewController *)self contentView];
  [v24 insertSubview:self->_tableView atIndex:0];

  [(UITableView *)self->_tableView setDropDelegate:self];
  v25 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  emptyStateView = self->_emptyStateView;
  self->_emptyStateView = v25;

  [(UIView *)self->_emptyStateView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_emptyStateView setAccessibilityIdentifier:@"CollectionEmptyStateView"];
  v27 = [(ContaineeViewController *)self contentView];
  [v27 addSubview:self->_emptyStateView];

  [(UIView *)self->_emptyStateView setAlpha:0.0];
  v28 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v29 = [v28 isUsingOfflineMaps];

  unsigned __int8 v174 = v29;
  if ((v29 & 1) == 0)
  {
    v30 = [objc_alloc((Class)MKVibrantView) initWithFrame:CGRectZero.origin.x, y, width, height];
    addPlaceVibrantView = self->_addPlaceVibrantView;
    self->_addPlaceVibrantView = v30;

    [(MKVibrantView *)self->_addPlaceVibrantView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKVibrantView *)self->_addPlaceVibrantView setAccessibilityIdentifier:@"CollectionAddPlaceView"];
    [(MKVibrantView *)self->_addPlaceVibrantView setContinuousCornerRadius:8.0];
    [(UIView *)self->_emptyStateView addSubview:self->_addPlaceVibrantView];
    v32 = +[UIButton buttonWithType:1];
    addPlaceButton = self->_addPlaceButton;
    self->_addPlaceButton = v32;

    [(UIButton *)self->_addPlaceButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(UIButton *)self->_addPlaceButton titleLabel];
    [v34 setAdjustsFontSizeToFitWidth:1];

    v35 = [(UIButton *)self->_addPlaceButton titleLabel];
    [v35 setMinimumScaleFactor:0.6];

    -[UIButton _setTouchInsets:](self->_addPlaceButton, "_setTouchInsets:", -8.0, -10.0, -8.0, -10.0);
    v36 = self->_addPlaceButton;
    v37 = +[NSBundle mainBundle];
    v38 = [v37 localizedStringForKey:@"[Collection] Add a Place" value:@"localized string not found" table:0];
    [(UIButton *)v36 setTitle:v38 forState:0];

    v39 = self->_addPlaceButton;
    v40 = +[UIImage systemImageNamed:@"plus.square.fill"];
    [(UIButton *)v39 setImage:v40 forState:0];

    [(UIButton *)self->_addPlaceButton addTarget:self action:"_addAPlaceAction:" forControlEvents:64];
    [(UIButton *)self->_addPlaceButton setAccessibilityIdentifier:@"CollectionAddPlaceButton"];
    [(UIView *)self->_emptyStateView addSubview:self->_addPlaceButton];
  }
  v41 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v41;

  [(UIView *)self->_hideableFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_hideableFooterView setAccessibilityIdentifier:@"CollectionFooter"];
  v43 = [(CollectionViewController *)self view];
  [v43 addSubview:self->_hideableFooterView];

  v44 = -[FooterToolBarView initWithFrame:]([CollectionFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footerContentView = self->_footerContentView;
  self->_footerContentView = v44;

  [(CollectionFooterToolBarView *)self->_footerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (sub_1000BBB44(self) == 5)
  {
    [(CollectionFooterToolBarView *)self->_footerContentView setUseMacConfig:1];
    if ([(CollectionHandler *)self->_collection canEditImage]) {
      uint64_t v46 = 0;
    }
    else {
      uint64_t v46 = [(CollectionHandler *)self->_collection canEditTitle] ^ 1;
    }
    [(CollectionFooterToolBarView *)self->_footerContentView setHideEditButton:v46];
  }
  [(FooterToolBarView *)self->_footerContentView setDelegate:self];
  [(UIView *)self->_hideableFooterView addSubview:self->_footerContentView];
  [(CollectionViewController *)self _resetFooterState:1];
  v47 = [(UIView *)self->_hideableFooterView bottomAnchor];
  v48 = [(CollectionViewController *)self view];
  v49 = [v48 bottomAnchor];
  double v50 = 0.0;
  v51 = [v47 constraintEqualToAnchor:v49 constant:0.0];
  hideableFooterViewBottomConstraint = self->_hideableFooterViewBottomConstraint;
  self->_hideableFooterViewBottomConstraint = v51;

  if (sub_1000BBB44(self) == 5) {
    double v50 = 16.0;
  }
  v170 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v172 = [(ContaineeViewController *)self headerView];
  v168 = [v172 topAnchor];
  v166 = [v170 constraintEqualToAnchor:v168];
  v178[0] = v166;
  v162 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v164 = [(ContaineeViewController *)self headerView];
  v160 = [v164 leadingAnchor];
  v158 = [v162 constraintEqualToAnchor:v160];
  v178[1] = v158;
  v155 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v157 = [(ContaineeViewController *)self headerView];
  v153 = [v157 trailingAnchor];
  v151 = [v155 constraintEqualToAnchor:v153];
  v178[2] = v151;
  v147 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  v149 = [(ContaineeViewController *)self headerView];
  v145 = [v149 bottomAnchor];
  v143 = [v147 constraintEqualToAnchor:v145 constant:5.0];
  v178[3] = v143;
  v141 = [(UIView *)self->_subHeaderView topAnchor];
  v142 = [(ContaineeViewController *)self contentView];
  v140 = [v142 topAnchor];
  v139 = [v141 constraintEqualToAnchor:v140];
  v178[4] = v139;
  v137 = [(UIView *)self->_subHeaderView leadingAnchor];
  v138 = [(ContaineeViewController *)self contentView];
  v136 = [v138 leadingAnchor];
  v135 = [v137 constraintEqualToAnchor:v136];
  v178[5] = v135;
  v133 = [(UIView *)self->_subHeaderView trailingAnchor];
  v134 = [(ContaineeViewController *)self contentView];
  v132 = [v134 trailingAnchor];
  v131 = [v133 constraintEqualToAnchor:v132];
  v178[6] = v131;
  v130 = [(UIView *)self->_subHeaderView topAnchor];
  v129 = [(CollectionSubHeaderView *)self->_subHeaderContentView topAnchor];
  v128 = [v130 constraintEqualToAnchor:v129];
  v178[7] = v128;
  v127 = [(UIView *)self->_subHeaderView bottomAnchor];
  v126 = [(CollectionSubHeaderView *)self->_subHeaderContentView bottomAnchor];
  v125 = [v127 constraintEqualToAnchor:v126];
  v178[8] = v125;
  v124 = [(UIView *)self->_subHeaderView leadingAnchor];
  v123 = [(CollectionSubHeaderView *)self->_subHeaderContentView leadingAnchor];
  v122 = [v124 constraintEqualToAnchor:v123];
  v178[9] = v122;
  v121 = [(UIView *)self->_subHeaderView trailingAnchor];
  v120 = [(CollectionSubHeaderView *)self->_subHeaderContentView trailingAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v178[10] = v119;
  v117 = [(UITableView *)self->_tableView topAnchor];
  v118 = [(ContaineeViewController *)self contentView];
  v116 = [v118 topAnchor];
  v115 = [v117 constraintEqualToAnchor:v116];
  v178[11] = v115;
  v113 = [(UITableView *)self->_tableView leadingAnchor];
  v114 = [(ContaineeViewController *)self contentView];
  v112 = [v114 leadingAnchor];
  v111 = [v113 constraintEqualToAnchor:v112 constant:v50];
  v178[12] = v111;
  v109 = [(UITableView *)self->_tableView trailingAnchor];
  v110 = [(ContaineeViewController *)self contentView];
  v108 = [v110 trailingAnchor];
  v107 = [v109 constraintEqualToAnchor:v108 constant:-v50];
  v178[13] = v107;
  v105 = [(UITableView *)self->_tableView bottomAnchor];
  v106 = [(ContaineeViewController *)self contentView];
  v103 = [v106 bottomAnchor];
  v102 = [v105 constraintEqualToAnchor:v103];
  v178[14] = v102;
  v100 = [(UIView *)self->_hideableFooterView leadingAnchor];
  v101 = [(ContaineeViewController *)self contentView];
  v99 = [v101 leadingAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v178[15] = v98;
  v96 = [(UIView *)self->_hideableFooterView trailingAnchor];
  v97 = [(ContaineeViewController *)self contentView];
  v95 = [v97 trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v53 = self->_hideableFooterViewBottomConstraint;
  v178[16] = v94;
  v178[17] = v53;
  v104 = [(UIView *)self->_hideableFooterView topAnchor];
  v93 = [(CollectionFooterToolBarView *)self->_footerContentView topAnchor];
  v92 = [v104 constraintEqualToAnchor:v93];
  v178[18] = v92;
  v91 = [(UIView *)self->_hideableFooterView bottomAnchor];
  v90 = [(CollectionFooterToolBarView *)self->_footerContentView bottomAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v178[19] = v89;
  v88 = [(UIView *)self->_hideableFooterView leadingAnchor];
  v87 = [(CollectionFooterToolBarView *)self->_footerContentView leadingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v178[20] = v86;
  v85 = [(UIView *)self->_hideableFooterView trailingAnchor];
  v84 = [(CollectionFooterToolBarView *)self->_footerContentView trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v178[21] = v83;
  v81 = [(UIView *)self->_emptyStateView leadingAnchor];
  v82 = [(ContaineeViewController *)self contentView];
  v80 = [v82 leadingAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v178[22] = v79;
  v77 = [(UIView *)self->_emptyStateView trailingAnchor];
  v78 = [(ContaineeViewController *)self contentView];
  v76 = [v78 trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v178[23] = v75;
  v74 = [(UIView *)self->_emptyStateView topAnchor];
  v54 = [(ContaineeViewController *)self contentView];
  v55 = [v54 topAnchor];
  v56 = [v74 constraintEqualToAnchor:v55];
  v178[24] = v56;
  v57 = [(UIView *)self->_emptyStateView bottomAnchor];
  v58 = [(ContaineeViewController *)self contentView];
  v59 = [v58 safeAreaLayoutGuide];
  v60 = [v59 bottomAnchor];
  LODWORD(v61) = 1140457472;
  v62 = [v57 constraintEqualToAnchor:v60 constant:0.0 priority:v61];
  v178[25] = v62;
  v63 = +[NSArray arrayWithObjects:v178 count:26];
  +[NSLayoutConstraint activateConstraints:v63];

  if ((v174 & 1) == 0)
  {
    v175 = [(MKVibrantView *)self->_addPlaceVibrantView centerXAnchor];
    v173 = [(UIView *)self->_emptyStateView centerXAnchor];
    v171 = [v175 constraintEqualToAnchor:v173];
    v177[0] = v171;
    v169 = [(MKVibrantView *)self->_addPlaceVibrantView centerYAnchor];
    v167 = [(UIView *)self->_emptyStateView centerYAnchor];
    v165 = [v169 constraintEqualToAnchor:v167];
    v177[1] = v165;
    v163 = [(MKVibrantView *)self->_addPlaceVibrantView leadingAnchor];
    v161 = [(UIView *)self->_emptyStateView leadingAnchor];
    v159 = [v163 constraintGreaterThanOrEqualToAnchor:v161 constant:16.0];
    v177[2] = v159;
    v156 = [(MKVibrantView *)self->_addPlaceVibrantView trailingAnchor];
    v154 = [(UIView *)self->_emptyStateView trailingAnchor];
    v152 = [v156 constraintLessThanOrEqualToAnchor:v154 constant:-16.0];
    v177[3] = v152;
    v150 = [(UIButton *)self->_addPlaceButton leadingAnchor];
    v148 = [(MKVibrantView *)self->_addPlaceVibrantView leadingAnchor];
    v146 = [v150 constraintEqualToAnchor:v148 constant:10.0];
    v177[4] = v146;
    v144 = [(UIButton *)self->_addPlaceButton trailingAnchor];
    v64 = [(MKVibrantView *)self->_addPlaceVibrantView trailingAnchor];
    v65 = [v144 constraintEqualToAnchor:v64 constant:-10.0];
    v177[5] = v65;
    v66 = [(UIButton *)self->_addPlaceButton topAnchor];
    v67 = [(MKVibrantView *)self->_addPlaceVibrantView topAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:8.0];
    v177[6] = v68;
    v69 = [(UIButton *)self->_addPlaceButton bottomAnchor];
    v70 = [(MKVibrantView *)self->_addPlaceVibrantView bottomAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 constant:-8.0];
    v177[7] = v71;
    v72 = +[NSArray arrayWithObjects:v177 count:8];
    +[NSLayoutConstraint activateConstraints:v72];
  }
  self->_emptyState = 0;
  [(UIView *)self->_emptyStateView setHidden:[(CollectionHandler *)self->_collection handlerType] != 0];
  [(CollectionViewController *)self _loadDataSource];
  v73 = +[NSNotificationCenter defaultCenter];
  [v73 addObserver:self selector:"contentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(CollectionViewController *)self _updateFonts];
  +[GEOAPPortal captureUserAction:2067 target:0 value:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  self->_hasScrolled = 0;
  [(ContainerHeaderView *)self->_titleHeaderView sizeToFit];
  [(CollectionDataSource *)self->_collectionDataSource setActive:1];
  [(CollectionHandler *)self->_collection addObserver:self];
  [(CollectionViewController *)self _updateState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v4 viewWillDisappear:a3];
  [(ContainerHeaderView *)self->_titleHeaderView sizeToFit];
  [(CollectionDataSource *)self->_collectionDataSource setActive:0];
  [(CollectionHandler *)self->_collection removeObserver:self];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v3 viewDidLayoutSubviews];
  [(CollectionViewController *)self _updateFooterBottomConstraint];
  [(CollectionViewController *)self _updateTableInsets];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v4 didChangeLayout:a3];
  [(CollectionViewController *)self _updateTableInsets];
}

- (void)_updateFonts
{
  objc_super v3 = [(CollectionViewController *)self traitCollection];
  objc_super v4 = [v3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
  id v8 = +[UIFont system15MediumCompatibleWithTraitCollection:v4];

  id v5 = [(UIButton *)self->_addPlaceButton titleLabel];
  [v5 setFont:v8];

  addPlaceButton = self->_addPlaceButton;
  [v8 pointSize];
  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5);
  [(UIButton *)addPlaceButton setPreferredSymbolConfiguration:v7 forImageInState:0];
}

- (void)contentSizeChanged:(id)a3
{
  [(CollectionViewController *)self _updateFonts];
  [(CollectionView *)self->_collectionHeaderView invalidateIntrinsicContentSize];
  [(CollectionSubHeaderView *)self->_subHeaderContentView invalidateIntrinsicContentSize];
  id v4 = [(CollectionViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)updateTheme
{
  v5.receiver = self;
  v5.super_class = (Class)CollectionViewController;
  [(MapsThemeViewController *)&v5 updateTheme];
  objc_super v3 = [(CollectionViewController *)self theme];
  id v4 = [v3 keyColor];
  [(UIButton *)self->_addPlaceButton setTintColor:v4];
}

- (id)loadingModeView
{
  loadingModeView = self->_loadingModeView;
  if (!loadingModeView)
  {
    id v4 = [LoadingModeView alloc];
    objc_super v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
    v7 = [(LoadingModeView *)v4 initWithTitle:v6];
    id v8 = self->_loadingModeView;
    self->_loadingModeView = v7;

    [(LoadingModeView *)self->_loadingModeView setTranslatesAutoresizingMaskIntoConstraints:0];
    loadingModeView = self->_loadingModeView;
  }

  return loadingModeView;
}

- (void)showLoading:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(LoadingModeView *)self->_loadingModeView superview];
  BOOL v6 = v5 == 0;

  if (((v6 ^ v3) & 1) == 0)
  {
    if (v3)
    {
      v7 = [(ContaineeViewController *)self contentView];
      id v8 = [(CollectionViewController *)self loadingModeView];
      [v7 addSubview:v8];

      v23 = [(LoadingModeView *)self->_loadingModeView topAnchor];
      v22 = [(UITableView *)self->_tableView topAnchor];
      v21 = [v23 constraintEqualToAnchor:v22];
      v24[0] = v21;
      objc_super v9 = [(LoadingModeView *)self->_loadingModeView bottomAnchor];
      id v10 = [(UITableView *)self->_tableView bottomAnchor];
      v11 = [v9 constraintEqualToAnchor:v10];
      v24[1] = v11;
      objc_super v12 = [(LoadingModeView *)self->_loadingModeView leadingAnchor];
      double v13 = [(UITableView *)self->_tableView leadingAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v24[2] = v14;
      v15 = [(LoadingModeView *)self->_loadingModeView trailingAnchor];
      v16 = [(UITableView *)self->_tableView trailingAnchor];
      double v17 = [v15 constraintEqualToAnchor:v16];
      v24[3] = v17;
      v18 = +[NSArray arrayWithObjects:v24 count:4];
      +[NSLayoutConstraint activateConstraints:v18];
    }
    else
    {
      v19 = [(CollectionViewController *)self loadingModeView];
      [v19 removeFromSuperview];

      loadingModeView = self->_loadingModeView;
      self->_loadingModeView = 0;
    }
  }
}

- (void)_updateTableInsets
{
  double headerMaxY = self->_headerMaxY;
  [(UIView *)self->_subHeaderView frame];
  if (headerMaxY <= CGRectGetMaxY(v13))
  {
    [(UIView *)self->_subHeaderView frame];
    CGFloat MaxY = CGRectGetMaxY(v14);
  }
  else
  {
    CGFloat MaxY = self->_headerMaxY;
  }
  self->_double headerMaxY = MaxY;
  if (!self->_hasScrolled)
  {
    -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", 0.0, -MaxY);
    CGFloat MaxY = self->_headerMaxY;
  }
  [(UIView *)self->_hideableFooterView frame];
  double Height = CGRectGetHeight(v15);
  BOOL v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 bottomSafeOffset];
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", MaxY, 0.0, Height - v7, 0.0);

  double v8 = self->_headerMaxY;
  [(UIView *)self->_hideableFooterView frame];
  double v9 = CGRectGetHeight(v16);
  id v11 = [(ContaineeViewController *)self cardPresentationController];
  [v11 bottomSafeOffset];
  -[UITableView setVerticalScrollIndicatorInsets:](self->_tableView, "setVerticalScrollIndicatorInsets:", v8, 0.0, v9 - v10, 0.0);
}

- (void)_updateFooterBottomConstraint
{
  BOOL v3 = [(CollectionViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v14);

  [(ContaineeViewController *)self heightForLayout:2];
  double v6 = v5;
  [(ContaineeViewController *)self heightForLayout:3];
  double v8 = 0.0;
  if (Height > v6)
  {
    double v8 = 1.0;
    if (Height < v7 && v7 > v6) {
      double v8 = (Height - v6) / (v7 - v6);
    }
  }
  double v10 = [(CollectionViewController *)self view];
  [v10 layoutIfNeeded];

  [(UIView *)self->_hideableFooterView frame];
  hideableFooterViewBottomConstraint = self->_hideableFooterViewBottomConstraint;

  [(NSLayoutConstraint *)hideableFooterViewBottomConstraint setConstant:(1.0 - v8) * v11];
}

- (void)_resetFooterState:(unint64_t)a3
{
  [(FooterToolBarView *)self->_footerContentView setCanDeleteOnly:[(CollectionHandler *)self->_collection handlerType] != 0];
  [(FooterToolBarView *)self->_footerContentView setCanBeSaved:(id)[(CollectionHandler *)self->_collection handlerType] == (id)3];
  [(FooterToolBarView *)self->_footerContentView setCanMove:(id)[(CollectionHandler *)self->_collection contentType] == (id)1];
  [(FooterToolBarView *)self->_footerContentView setState:0];
  footerContentView = self->_footerContentView;

  [(FooterToolBarView *)footerContentView setState:a3];
}

- (void)_loadDataSource
{
  BOOL v3 = [[CollectionDataSource alloc] initWithTableView:self->_tableView collection:self->_collection];
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v3;

  [self->_collectionDataSource setDelegate:self];
  double v5 = [(ControlContaineeViewController *)self delegate];
  double v6 = [v5 appCoordinator];
  [(CollectionDataSource *)self->_collectionDataSource setShareDelegate:v6];

  [(CollectionDataSource *)self->_collectionDataSource setDeleteDelegate:self];
  [(UITableView *)self->_tableView setDelegate:self->_collectionDataSource];
  double v7 = self->_collectionDataSource;
  tableView = self->_tableView;

  [(UITableView *)tableView setDataSource:v7];
}

- (BOOL)_isCollectionEmpty
{
  v2 = [(CollectionHandler *)self->_collection content];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)_subHeaderTypeForCurrentState
{
  if ((id)[(CollectionHandler *)self->_collection handlerType] == (id)3) {
    return 2;
  }
  else {
    return [(CollectionViewController *)self _isCollectionEmpty] ^ 1;
  }
}

- (void)_updateState
{
  BOOL v3 = [(CollectionViewController *)self _isCollectionEmpty];
  if (self->_emptyState != v3)
  {
    BOOL v4 = v3;
    self->_emptyState = v3;
    [(CollectionSubHeaderView *)self->_subHeaderContentView setType:[(CollectionViewController *)self _subHeaderTypeForCurrentState]];
    if (v4) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    [(UITableView *)self->_tableView setAlpha:v5];
    [(UIView *)self->_hideableFooterView setAlpha:v5];
    if ((id)[(CollectionHandler *)self->_collection contentType] == (id)1)
    {
      if (v4) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
      [(UIView *)self->_emptyStateView setAlpha:v6];
    }
    if (self->_emptyState && (id)[(CollectionHandler *)self->_collection handlerType] == (id)3)
    {
      [(UIView *)self->_emptyStateView setAlpha:0.0];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(CollectionViewController *)self showLoading:v7];
  }
}

- (void)_addAPlaceAction:(id)a3
{
}

- (id)_searchResults
{
  BOOL v3 = +[NSMutableArray array];
  if ((id)[(CollectionHandler *)self->_collection contentType] == (id)1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = [(CollectionHandler *)self->_collection content];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = [[SearchResult alloc] initWithMapItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  id v10 = [v3 copy];

  return v10;
}

- (void)addContentToMapView
{
  id v6 = [(CollectionViewController *)self _searchResults];
  BOOL v3 = +[SearchInfo searchInfoWithResults:v6];
  BOOL v4 = [(ControlContaineeViewController *)self delegate];
  id v5 = [v4 searchPinsManager];
  [v5 setSearchPinsFromSearchInfo:v3 scrollToResults:1 displayPlaceCardForResult:0 animated:1 completion:0];
}

- (void)removeContentFromMapView
{
  if ([(CollectionViewController *)self shouldClearSearchPins])
  {
    id v4 = [(ControlContaineeViewController *)self delegate];
    BOOL v3 = [v4 searchPinsManager];
    [v3 clearSearchPins];
  }
}

- (BOOL)shouldClearSearchPins
{
  BOOL v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 searchPinsManager];
  id v5 = [v4 allSearchResults];

  id v6 = [(CollectionViewController *)self _searchResults];
  if (v5 == v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v7 = [v5 count];
    if (v7 == [v6 count])
    {
      uint64_t v13 = 0;
      long long v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 1;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100C80868;
      v10[3] = &unk_1012F7E68;
      id v11 = v6;
      long long v12 = &v13;
      [v5 enumerateObjectsUsingBlock:v10];
      BOOL v8 = *((unsigned char *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)scrollViewDidScroll:(id)a3
{
  self->_hasScrolled = 1;
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  double v8 = v7;

  double v9 = v6 + v8;
  [(CollectionView *)self->_collectionHeaderView setShrinkFactor:fmin(fmax(v9 / 35.0, 0.0), 1.0)];
  double v10 = fmin(fmax((v9 + -20.0) / 35.0, 0.0), 1.0);
  subHeaderContentView = self->_subHeaderContentView;

  [(CollectionSubHeaderView *)subHeaderContentView setShrinkFactor:v10];
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  [(CollectionViewController *)self _updateState];
  id v4 = [(CollectionViewController *)self updateContentInjection];

  if (v4)
  {
    double v5 = [(CollectionViewController *)self updateContentInjection];
    v5[2](v5, self);
  }
}

- (void)_transformURLCollectionInMSPCollection
{
  double v8 = self->_collection;
  BOOL v3 = [self->_collectionDataSource active];
  [(CollectionHandler *)self->_collection removeObserver:self];
  id v4 = +[CollectionHandler collectionWithCollectionHandler:self->_collection];
  collection = self->_collection;
  self->_collection = v4;

  if (v3) {
    [(CollectionHandler *)self->_collection addObserver:self];
  }
  id v6 = [(CollectionHandler *)v8 sortType];
  [(CollectionHandler *)self->_collection setSortType:v6];
  [(CollectionSubHeaderView *)self->_subHeaderContentView setSortType:v6];
  [(CollectionSubHeaderView *)self->_subHeaderContentView setType:1];
  [(CollectionViewController *)self _resetFooterState:1];
  double v7 = [(CollectionViewController *)self view];
  [v7 layoutIfNeeded];

  self->_hasScrolled = 0;
  self->_double headerMaxY = 0.0;
  [(CollectionViewController *)self _updateTableInsets];
  [(CollectionViewController *)self _loadDataSource];
  [(CollectionDataSource *)self->_collectionDataSource setActive:v3];
  [(UITableView *)self->_tableView reloadData];
}

- (void)collectionEditSessionUpdated:(id)a3
{
  id v4 = [a3 selectedObjectSet];
  id v5 = [v4 count];

  footerContentView = self->_footerContentView;
  if (v5) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }

  [(FooterToolBarView *)footerContentView setState:v7];
}

- (void)collectionViewTextFieldDidBecomeSelected:(id)a3
{
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  if ([v4 containeeLayout] == (id)1)
  {
  }
  else
  {
    id v5 = [(ContaineeViewController *)self cardPresentationController];
    id v6 = [v5 containeeLayout];

    if (v6 != (id)2) {
      return;
    }
  }
  id v7 = [(ContaineeViewController *)self cardPresentationController];
  [v7 wantsLayout:3];
}

- (void)collectionViewTextFieldDidResign:(id)a3
{
}

- (void)requestsCollectionHeaderSaveActionForView:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000B944C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    collection = self->_collection;
    *(_DWORD *)buf = 138412290;
    id v11 = collection;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Saving URL collection: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v7 = self->_collection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C80E58;
  v8[3] = &unk_101316D00;
  objc_copyWeak(&v9, (id *)buf);
  [(CollectionHandler *)v7 createCollection:v8];
  +[GEOAPPortal captureUserAction:2071 target:256 value:0];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)requestsCollectionHeaderSortActionForView:(id)a3 forSortType:(int64_t)a4
{
  if ((unint64_t)a4 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (2077 - a4);
  }
  -[CollectionViewController _updateSorting:](self, "_updateSorting:");

  +[GEOAPPortal captureUserAction:v4 target:252 value:0];
}

- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_1000BBB44(self);
  switch(a4)
  {
    case 0uLL:
      BOOL v8 = v7 == 5;
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_100C81A80;
      v79[3] = &unk_1012E5D08;
      v79[4] = self;
      +[UIView animateWithDuration:v79 animations:0.25];
      if (!v8) {
        [(CollectionDataSource *)self->_collectionDataSource setEditing:1];
      }
      id v9 = [(CollectionDataSource *)self->_collectionDataSource editSession];
      [v9 setDelegate:self];

      [(FooterToolBarView *)self->_footerContentView setState:3];
      +[GEOAPPortal captureUserAction:2120 target:252 value:0];
      break;
    case 1uLL:
      double v10 = [(CollectionViewController *)self view];
      [v10 endEditing:1];

      [(CollectionDataSource *)self->_collectionDataSource setEditing:0];
      if ([(CollectionHandler *)self->_collection canEditImage]
        || [(CollectionHandler *)self->_collection canEditTitle])
      {
        [(CollectionHandler *)self->_collection updateCollection:&stru_10131D5B8];
      }
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100C81BC0;
      v78[3] = &unk_1012E5D08;
      v78[4] = self;
      +[UIView animateWithDuration:v78 animations:0.25];
      [(FooterToolBarView *)self->_footerContentView setState:1];
      break;
    case 2uLL:
      id v11 = [(CollectionDataSource *)self->_collectionDataSource editSession];
      long long v12 = [v11 selectedObjectSet];
      id v13 = [v12 count];

      if (!v13)
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v14 = [(CollectionHandler *)self->_collection content];
        id v15 = [v14 countByEnumeratingWithState:&v70 objects:v87 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v71;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v71 != v16) {
                objc_enumerationMutation(v14);
              }
              [v11 addSelectedObject:*(void *)(*((void *)&v70 + 1) + 8 * i)];
            }
            id v15 = [v14 countByEnumeratingWithState:&v70 objects:v87 count:16];
          }
          while (v15);
        }
      }
      v18 = +[CollectionEditSession collectionSessionWithSession:v11];
      [v11 clearSelectedobjects];
      v19 = [v18 selectedObjectSet];
      v20 = [v19 allObjects];

      collection = self->_collection;
      footerContentView = self->_footerContentView;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_100C81D08;
      v68[3] = &unk_1012E7D28;
      id v69 = v18;
      id v23 = v18;
      [(CollectionViewController *)self _presentDeletionConfirmationFor:v20 inCollection:collection sourceView:footerContentView completion:v68];
      +[GEOAPPortal captureUserAction:48 target:252 value:0];

      break;
    case 6uLL:
      [(CollectionDataSource *)self->_collectionDataSource selectAll];
      break;
    case 7uLL:
      v24 = [(CollectionDataSource *)self->_collectionDataSource editSession];
      v25 = +[CollectionEditSession collectionSessionWithSession:v24];
      v26 = [CollectionPicker alloc];
      [v6 bounds];
      v27 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:](v26, "initWithCollectionEditSession:sourceView:sourceRect:", v25, v6);
      collectionPicker = self->_collectionPicker;
      self->_collectionPicker = v27;

      [(CollectionPicker *)self->_collectionPicker setDelegate:self];
      objc_initWeak((id *)location, self);
      unsigned __int8 v29 = self->_collectionPicker;
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100C81C1C;
      v76[3] = &unk_1012F5830;
      objc_copyWeak(&v77, (id *)location);
      v76[4] = self;
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100C81C9C;
      v74[3] = &unk_1012F5858;
      objc_copyWeak(&v75, (id *)location);
      [(CollectionPicker *)v29 viewControllerToPresentIfContainee:v76 ifAlertController:v74];
      objc_destroyWeak(&v75);
      objc_destroyWeak(&v77);
      objc_destroyWeak((id *)location);

      break;
    case 9uLL:
      [(CollectionViewController *)self _addItemsFromACToCollection];
      break;
    case 0xAuLL:
      if ([(CollectionHandler *)self->_collection canShare])
      {
        v30 = self->_footerContentView;
        v31 = [(CollectionHandler *)self->_collection sharingURL];
        v32 = self->_collection;
        objc_initWeak((id *)location, self);
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100C81E5C;
        v63[3] = &unk_1012EB6B8;
        id v59 = v31;
        id v64 = v59;
        v60 = v32;
        v65 = v60;
        v33 = v30;
        v66 = v33;
        objc_copyWeak(&v67, (id *)location);
        v34 = objc_retainBlock(v63);
        v35 = +[NSUserDefaults standardUserDefaults];
        if ([v35 BOOLForKey:@"__internal_CollectionSharingWarning"])
        {
          ((void (*)(void *))v34[2])(v34);
        }
        else
        {
          v40 = +[NSBundle mainBundle];
          v58 = [v40 localizedStringForKey:@"[Guide] Alert's text confirmation" value:@"localized string not found" table:0];

          v41 = +[NSBundle mainBundle];
          v57 = [v41 localizedStringForKey:@"[Guide] Alert's Share Guide button title" value:@"localized string not found" table:0];

          v42 = +[UIAlertController alertControllerWithTitle:0 message:v58 preferredStyle:0];
          v43 = [v42 popoverPresentationController];
          [v43 setSourceView:v33];

          [(CollectionFooterToolBarView *)v33 bounds];
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          double v51 = v50;
          v52 = [v42 popoverPresentationController];
          [v52 setSourceRect:v45, v47, v49, v51];

          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_100C81F88;
          v61[3] = &unk_1012E6E08;
          v62 = v34;
          v53 = +[UIAlertAction actionWithTitle:v57 style:0 handler:v61];
          [v42 addAction:v53];

          v54 = +[NSBundle mainBundle];
          v55 = [v54 localizedStringForKey:@"[Collection] Alert's cancel button title" value:@"localized string not found" table:0];
          v56 = +[UIAlertAction actionWithTitle:v55 style:1 handler:&stru_10131D5D8];
          [v42 addAction:v56];

          [(CollectionViewController *)self presentViewController:v42 animated:1 completion:0];
          [v35 setBool:1 forKey:@"__internal_CollectionSharingWarning"];
        }
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2082, 252, 0, v57);

        objc_destroyWeak(&v67);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v36 = sub_1005762E4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = +[NSString stringWithFormat:@"Attempting to share an empty collection. Share action should be disabled or hidden on the UI"];
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[CollectionViewController view:requestsCollectionFooterAction:]";
          __int16 v81 = 2080;
          v82 = "CollectionViewController.m";
          __int16 v83 = 1024;
          int v84 = 720;
          __int16 v85 = 2112;
          v86 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);
        }
        if (sub_100BB36BC())
        {
          v38 = sub_1005762E4();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = +[NSThread callStackSymbols];
            *(_DWORD *)location = 138412290;
            *(void *)&location[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
          }
        }
      }
      break;
    default:
      break;
  }
}

- (void)_addItemsFromACToCollection
{
  uint64_t v4 = [(CollectionEditSession *)[CollectionSaveSession alloc] initWithCollection:self->_collection];
  BOOL v3 = [(ControlContaineeViewController *)self delegate];
  [v3 viewController:self addItemsFromACToCollection:v4];
}

- (void)_updateSorting:(int64_t)a3
{
  -[CollectionHandler setSortType:](self->_collection, "setSortType:");
  subHeaderContentView = self->_subHeaderContentView;

  [(CollectionSubHeaderView *)subHeaderContentView setSortType:a3];
}

- (BOOL)collectionSubHeaderViewShouldShowSortByDistance
{
  if ((id)[(CollectionHandler *)self->_collection contentType] != (id)1) {
    return 0;
  }
  v2 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v3 = [v2 isAuthorizedForPreciseLocation];

  return v3;
}

- (void)collectionPickerClosed:(id)a3
{
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

  id v5 = [(CollectionViewController *)self view];
  [(CollectionViewController *)self view:v5 requestsCollectionFooterAction:1];
}

- (void)collectionPickerNewCollection:(id)a3
{
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
  id v5 = a3;

  id v6 = [(ControlContaineeViewController *)self delegate];
  uint64_t v7 = [v5 editSession];

  [v6 viewController:self createNewCollectionWithSession:v7];
  id v8 = [(CollectionViewController *)self view];
  [(CollectionViewController *)self view:v8 requestsCollectionFooterAction:1];
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self->_collection;
  id v8 = [a4 session];
  uint64_t v9 = objc_opt_class();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100C82308;
  v13[3] = &unk_10131D600;
  v13[4] = self;
  long long v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = [v8 loadObjectsOfClass:v9 completion:v13];
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = a4;
  unsigned __int8 v5 = [v4 canLoadObjectsOfClass:objc_opt_class()];

  return v5;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v5 = [objc_alloc((Class)UITableViewDropProposal) initWithDropOperation:2 intent:2];

  return v5;
}

- (void)dataSourceUpdated:(id)a3
{
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[SearchResult alloc] initWithMapItem:v8];
    id v6 = [(ControlContaineeViewController *)self delegate];
    [v6 viewController:self focusSearchResult:v5];

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = 0;
  }
  else
  {
    if (self->_lastItemTapped) {
      goto LABEL_6;
    }
    id v5 = [(ControlContaineeViewController *)self delegate];
    [(SearchResult *)v5 viewControllerRemoveSearchResultFocus:self];
  }

LABEL_6:
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v15 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [[SearchResult alloc] initWithMapItem:v5];
    uint64_t v7 = [(ControlContaineeViewController *)self delegate];
    id v8 = [v7 mapSelectionManager];
    [v8 selectSearchResult:v6 animated:1];

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = v5;
    id v10 = v5;

    id v11 = +[MKMapService sharedService];
    id v12 = [v10 _identifier];
    id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 muid]);

    long long v14 = [v13 stringValue];
    [v11 captureUserAction:478 onTarget:254 eventValue:v14];
  }
  else
  {
    if (![v15 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine]) {
      goto LABEL_6;
    }
    id v6 = [[IncompleteTransitLineItem alloc] initWithTransitLine:v15];
    id v11 = [(ControlContaineeViewController *)self delegate];
    [v11 viewController:self selectTransitLineItem:v6 zoomToMapRegion:1];
  }

LABEL_6:
}

- (void)dataSource:(id)a3 searchResultNeedsEditing:(id)a4 completion:(id)a5
{
  id v7 = a5;
  [a4 mapItem];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100C82B00;
  v16[3] = &unk_1012F8668;
  v16[4] = self;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v7;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100C82C7C;
  long long v14 = &unk_1012E6EA8;
  id v15 = v18;
  id v8 = v18;
  id v9 = v17;
  id v10 = +[UIViewController _maps_viewControllerForRenamingMapItem:v9 saveHandler:v16 cancelHandler:&v11];
  -[CollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);
}

- (int)listForDataSource:(id)a3
{
  return 7;
}

- (void)deleteItem:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  if (a3)
  {
    id v12 = a3;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    -[CollectionViewController _presentDeletionConfirmationFor:inCollection:sourceView:completion:](self, "_presentDeletionConfirmationFor:inCollection:sourceView:completion:", v11, self->_collection, v9, v8, v12);
  }
}

- (void)_presentDeletionConfirmationFor:(id)a3 inCollection:(id)a4 sourceView:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 count];
  if (v12 && v11 && v14)
  {
    if ([v11 handlerType] == (id)2)
    {
      v39 = self;
      if ([v10 count] == (id)1)
      {
        id v15 = [v10 firstObject];
        uint64_t v16 = +[NSBundle mainBundle];
        id v17 = [v16 localizedStringForKey:@"[Guide] Alert's Title when deleting a place" value:@"localized string not found" table:0];
        id v18 = [v15 name];
        uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);
      }
      else
      {
        id v15 = +[NSBundle mainBundle];
        uint64_t v19 = [v15 localizedStringForKey:@"[Guide] Alert's Title when deleting multiple place" value:@"localized string not found" table:0];
      }
      v38 = (void *)v19;

      v20 = +[UIAlertController alertControllerWithTitle:v19 message:0 preferredStyle:0];
      v21 = [v20 popoverPresentationController];
      [v21 setSourceView:v12];

      [v12 bounds];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      v30 = [v20 popoverPresentationController];
      [v30 setSourceRect:v23, v25, v27, v29];

      v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"[Collection] Alert's Delete button title" value:@"localized string not found" table:0];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100C83150;
      v42[3] = &unk_1012E6E08;
      id v33 = v13;
      id v43 = v33;
      v34 = +[UIAlertAction actionWithTitle:v32 style:2 handler:v42];
      [v20 addAction:v34];

      v35 = +[NSBundle mainBundle];
      v36 = [v35 localizedStringForKey:@"[Collection] Alert's cancel button title" value:@"localized string not found" table:0];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100C83164;
      v40[3] = &unk_1012E6E08;
      id v41 = v33;
      v37 = +[UIAlertAction actionWithTitle:v36 style:1 handler:v40];
      [v20 addAction:v37];

      [(CollectionViewController *)v39 presentViewController:v20 animated:1 completion:0];
    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

- (void)handleDismissAction:(id)a3
{
  collectionHeaderView = self->_collectionHeaderView;
  id v5 = a3;
  [(CollectionView *)collectionHeaderView setEditing:0];
  v6.receiver = self;
  v6.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v6 handleDismissAction:v5];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CollectionViewController;
  [(ContaineeViewController *)&v5 willChangeContainerStyle:a3];
  id v4 = [(CollectionViewController *)self view];
  [v4 endEditing:1];
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateContentInjection, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_hideableFooterViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_addPlaceButton, 0);
  objc_storeStrong((id *)&self->_addPlaceVibrantView, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_hideableFooterView, 0);
  objc_storeStrong((id *)&self->_subHeaderView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_subHeaderContentView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_collectionHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end