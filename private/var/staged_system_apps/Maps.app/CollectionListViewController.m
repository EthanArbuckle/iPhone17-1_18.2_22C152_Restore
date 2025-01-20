@interface CollectionListViewController
- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIScrollView)pptTestScrollView;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_createNewCollectionAction;
- (void)_deleteCollections:(id)a3 completion:(id)a4;
- (void)_updateFooterInset;
- (void)_updateHeaderHairlineAnimated:(BOOL)a3;
- (void)dataSource:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (void)dataSource:(id)a3 didChangeSelectedCollections:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSource:(id)a3 shareCollection:(id)a4 sourceView:(id)a5;
- (void)dataSourceUpdated:(id)a3;
- (void)didChangeLayout:(unint64_t)a3;
- (void)loadDataSource;
- (void)pptPresentFirstCollection;
- (void)scrollViewDidScroll:(id)a3;
- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CollectionListViewController

- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CollectionListViewController;
  v4 = [(CollectionListViewController *)&v9 initWithNibName:0 bundle:0];
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

- (id)keyCommands
{
  v12.receiver = self;
  v12.super_class = (Class)CollectionListViewController;
  v3 = [(ContaineeViewController *)&v12 keyCommands];
  id v4 = [v3 mutableCopy];

  v5 = [(CollectionListViewController *)self presentedViewController];

  if (!v5)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"[Guide] Add New Guide" value:@"localized string not found" table:0];

    v8 = +[UIKeyCommand commandWithTitle:v7 image:0 action:"_createNewCollectionAction" input:@"a" modifierFlags:0x100000 propertyList:0];
    [v4 addObject:v8];

    objc_super v9 = [(CollectionListDataSource *)self->_collectionListDataSource keyCommands];
    [v4 addObjectsFromArray:v9];
  }
  id v10 = [v4 copy];

  return v10;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(CollectionListDataSource *)self->_collectionListDataSource keyCommands];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    objc_super v9 = self->_collectionListDataSource;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CollectionListViewController;
    objc_super v9 = [(CollectionListViewController *)&v12 targetForAction:a3 withSender:v6];
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
  v76.receiver = self;
  v76.super_class = (Class)CollectionListViewController;
  [(ContaineeViewController *)&v76 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(CollectionListViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(ContaineeViewController *)self headerView];
  id v6 = [(ContaineeViewController *)self contentView];
  v7 = [(CollectionListViewController *)self view];
  [v7 setAccessibilityIdentifier:@"CollectionListView"];

  [v6 setAccessibilityIdentifier:@"CollectionListContent"];
  unsigned int v8 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v12 = -[ContainerHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v12;

  [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_titleHeaderView setDelegate:self];
  [(ContainerHeaderView *)self->_titleHeaderView setHeaderSize:2];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[Guide] Collections" value:@"localized string not found" table:0];
  [(ContainerHeaderView *)self->_titleHeaderView setTitle:v15];

  [v5 addSubview:self->_titleHeaderView];
  v16 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v16;

  [(MapsThemeTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = +[UIColor clearColor];
  [(MapsThemeTableView *)self->_tableView setBackgroundColor:v18];

  [(MapsThemeTableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
  [(MapsThemeTableView *)self->_tableView setAccessibilityIdentifier:@"CollectionListTable"];
  [v6 addSubview:self->_tableView];
  v19 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  hideableFooterView = self->_hideableFooterView;
  self->_hideableFooterView = v19;

  [(UIView *)self->_hideableFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:self->_hideableFooterView];
  v21 = -[FooterToolBarView initWithFrame:]([CollectionFooterToolBarView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footerContentView = self->_footerContentView;
  self->_footerContentView = v21;

  [(CollectionFooterToolBarView *)self->_footerContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(FooterToolBarView *)self->_footerContentView setDelegate:self];
  [(UIView *)self->_hideableFooterView addSubview:self->_footerContentView];
  if (sub_1000BBB44(self) == 5)
  {
    [(CollectionFooterToolBarView *)self->_footerContentView setUseMacConfig:1];
    [(CollectionFooterToolBarView *)self->_footerContentView setHideEditButton:1];
  }
  [(FooterToolBarView *)self->_footerContentView setState:4];
  v75 = [(UIView *)self->_hideableFooterView leadingAnchor];
  v74 = [v6 leadingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v77[0] = v73;
  v72 = [(UIView *)self->_hideableFooterView trailingAnchor];
  v71 = [v6 trailingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v77[1] = v70;
  v68 = [(UIView *)self->_hideableFooterView bottomAnchor];
  v69 = [(CollectionListViewController *)self view];
  v67 = [v69 bottomAnchor];
  LODWORD(v23) = 1140457472;
  v66 = [v68 constraintEqualToAnchor:v67 constant:0.0 priority:v23];
  v77[2] = v66;
  v65 = [(UIView *)self->_hideableFooterView topAnchor];
  v64 = [v5 bottomAnchor];
  v63 = [v65 constraintGreaterThanOrEqualToAnchor:v64];
  v77[3] = v63;
  v62 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v61 = [v5 topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v77[4] = v60;
  v59 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v58 = [v5 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v77[5] = v57;
  v56 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v55 = [v5 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v77[6] = v54;
  v53 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  v51 = [v5 bottomAnchor];
  v49 = [v53 constraintEqualToAnchor:v51];
  v77[7] = v49;
  v48 = [(MapsThemeTableView *)self->_tableView topAnchor];
  v47 = [v6 topAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v77[8] = v46;
  v45 = [(MapsThemeTableView *)self->_tableView leadingAnchor];
  v44 = [v6 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v77[9] = v43;
  v42 = [(MapsThemeTableView *)self->_tableView trailingAnchor];
  v41 = [v6 trailingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v77[10] = v40;
  v39 = [(MapsThemeTableView *)self->_tableView bottomAnchor];
  v38 = [v6 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v77[11] = v37;
  v36 = [(UIView *)self->_hideableFooterView topAnchor];
  v35 = [(CollectionFooterToolBarView *)self->_footerContentView topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v77[12] = v34;
  v33 = [(UIView *)self->_hideableFooterView bottomAnchor];
  [(CollectionFooterToolBarView *)self->_footerContentView bottomAnchor];
  v24 = v52 = v5;
  [v33 constraintEqualToAnchor:v24];
  v25 = v50 = v6;
  v77[13] = v25;
  v26 = [(UIView *)self->_hideableFooterView leadingAnchor];
  v27 = [(CollectionFooterToolBarView *)self->_footerContentView leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v77[14] = v28;
  v29 = [(UIView *)self->_hideableFooterView trailingAnchor];
  v30 = [(CollectionFooterToolBarView *)self->_footerContentView trailingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v77[15] = v31;
  v32 = +[NSArray arrayWithObjects:v77 count:16];
  +[NSLayoutConstraint activateConstraints:v32];

  [(CollectionListViewController *)self loadDataSource];
  [(CollectionListViewController *)self _updateHeaderHairlineAnimated:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CollectionListViewController;
  [(ContaineeViewController *)&v3 viewDidLayoutSubviews];
  [(CollectionListViewController *)self _updateFooterInset];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionListViewController;
  [(ContaineeViewController *)&v4 didChangeLayout:a3];
  [(CollectionListViewController *)self _updateFooterInset];
}

- (void)_updateFooterInset
{
  [(UIView *)self->_hideableFooterView frame];
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", 0.0, 0.0, CGRectGetHeight(v5), 0.0);
  [(MapsThemeTableView *)self->_tableView contentInset];
  tableView = self->_tableView;

  -[MapsThemeTableView setScrollIndicatorInsets:](tableView, "setScrollIndicatorInsets:");
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsThemeTableView *)self->_tableView _maps_shouldShowTopHairline];
  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A17764;
  v8[3] = &unk_1012EB708;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A17778;
  v7[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:v3 animated:v8 getter:v7 setter:v6];
}

- (void)loadDataSource
{
  BOOL v3 = [[CollectionListDataSource alloc] initWithTableView:self->_tableView editSession:0 showsAddCollection:0];
  collectionListDataSource = self->_collectionListDataSource;
  self->_collectionListDataSource = v3;

  [(CollectionListDataSource *)self->_collectionListDataSource setCellsSize:0];
  [self->_collectionListDataSource setDelegate:self];
  [(MapsThemeTableView *)self->_tableView setDelegate:self->_collectionListDataSource];
  [(MapsThemeTableView *)self->_tableView setDataSource:self->_collectionListDataSource];
  unsigned int v5 = self->_collectionListDataSource;

  [(DataSource *)v5 setActive:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CollectionListViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(CollectionListViewController *)self _updateHeaderHairlineAnimated:1];
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_collectionListDataSource == a3)
  {
    [(MapsThemeTableView *)self->_tableView reloadData];
    [(CollectionListViewController *)self _updateHeaderHairlineAnimated:0];
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v12 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v12;
      int64_t v6 = [(CollectionListDataSource *)self->_collectionListDataSource indexForObject:v5];
      if ((v6 & 0x8000000000000000) == 0)
      {
        int64_t v7 = v6;
        unsigned int v8 = [v5 curatedCollectionIdentifier];
        objc_super v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
        id v10 = +[NSNumber numberWithInteger:v7];
        +[GEOAPPortal captureCuratedCollectionUserAction:2099 target:251 value:0 publisherId:0 following:0 collectionId:v9 collectionCategory:0 collectionCurrentlySaved:&__kCFBooleanTrue verticalIndex:v10 horizontalIndex:0 placeCardType:0 possibleActions:0 impossibleActions:0 modules:0];
      }
    }
    else
    {
      if ([v12 handlerType])
      {
LABEL_8:
        v11 = [(ControlContaineeViewController *)self delegate];
        [v11 viewController:self showCollection:v12];

        goto LABEL_9;
      }
      id v5 = +[MKMapService sharedService];
      [v5 captureUserAction:73 onTarget:251 eventValue:0];
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (void)dataSource:(id)a3 didChangeSelectedCollections:(id)a4
{
  footerContentView = self->_footerContentView;
  if (objc_msgSend(a4, "count", a3)) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 6;
  }

  [(FooterToolBarView *)footerContentView setState:v5];
}

- (void)dataSource:(id)a3 confirmDeleteCollections:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = [(ControlContaineeViewController *)self delegate];
  [v17 viewController:self confirmDeleteCollections:v16 sourceView:v15 sourceRect:v14 x:x y:y width:width height:height];
}

- (void)view:(id)a3 requestsCollectionFooterAction:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3uLL:
      [(CollectionListDataSource *)self->_collectionListDataSource setEditing:1];
      [(FooterToolBarView *)self->_footerContentView setState:6];
      +[GEOAPPortal captureUserAction:2120 target:251 value:0];
      break;
    case 4uLL:
      [(CollectionListDataSource *)self->_collectionListDataSource setEditing:0];
      [(FooterToolBarView *)self->_footerContentView setState:4];
      break;
    case 5uLL:
      int64_t v7 = [(CollectionListDataSource *)self->_collectionListDataSource selected];
      objc_initWeak(&location, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100A17D70;
      v8[3] = &unk_1012E6998;
      objc_copyWeak(&v9, &location);
      [(CollectionListViewController *)self _deleteCollections:v7 completion:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);

      break;
    case 8uLL:
      [(CollectionListViewController *)self _createNewCollectionAction];
      break;
    default:
      break;
  }
}

- (void)_createNewCollectionAction
{
  id v3 = [(ControlContaineeViewController *)self delegate];
  [v3 viewController:self createNewCollectionWithSession:0];
}

- (void)_deleteCollections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unsigned int v8 = [(ControlContaineeViewController *)self delegate];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A17F50;
    v9[3] = &unk_1012F1600;
    id v11 = v7;
    id v10 = v6;
    [v8 viewController:self confirmDeleteCollections:v10 sourceView:0 sourceRect:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)dataSource:(id)a3 shareCollection:(id)a4 sourceView:(id)a5
{
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A183AC;
  v15[3] = &unk_101314750;
  id v8 = a5;
  id v16 = v8;
  id v17 = self;
  id v9 = objc_retainBlock(v15);
  if ([v7 canShare])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100A18494;
      v12[3] = &unk_101314778;
      v13 = (PersonalCollectionShareItemSource *)v7;
      id v14 = v9;
      [(PersonalCollectionShareItemSource *)v13 retrieveGeoCollectionWithRefinedItems:v12];

      id v10 = v13;
    }
    else
    {
      id v10 = [[PersonalCollectionShareItemSource alloc] initWithCollectionHandlerInfo:v7];
      if (v10)
      {
        id v11 = [[MapsActivityViewController alloc] initWithShareItem:v10];
        ((void (*)(void *, MapsActivityViewController *))v9[2])(v9, v11);
      }
    }
  }
}

- (void)pptPresentFirstCollection
{
  uint64_t v3 = [(CollectionListDataSource *)self->_collectionListDataSource entriesCount];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = +[NSIndexPath indexPathForRow:0 inSection:0];
    if ((uint64_t)[v5 row] < v4)
    {
      while (1)
      {
        id v6 = [(CollectionListDataSource *)self->_collectionListDataSource objectAtIndexPath:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        id v10 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v5 row] + 1, 0);

        id v7 = [v10 row];
        id v8 = v10;
        uint64_t v5 = v10;
        if ((uint64_t)v7 >= v4) {
          goto LABEL_11;
        }
      }
      id v9 = v6;
      if (![v9 handlerType]) {
        [(CollectionListViewController *)self dataSource:self->_collectionListDataSource itemTapped:v9];
      }
    }
    id v8 = v5;
LABEL_11:
  }
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerContentView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);

  objc_storeStrong((id *)&self->_hideableFooterView, 0);
}

@end