@interface PreferencesValuesContaineeViewController
+ (BOOL)useCollectionView;
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)shouldCollapseFirstCollectionViewSectionHeader;
- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3;
- (PreferenceValuesDataSource)dataSource;
- (UICollectionView)collectionView;
- (UITableView)tableView;
- (id)collectionViewDecorationItems;
- (id)collectionViewLayoutBoundarySupplementaryItems;
- (id)initialConstraints;
- (int64_t)collectionViewConfigurationSeparatorStyle;
- (int64_t)collectionViewListLayoutAppearanceStyle;
- (void)addSection:(id)a3;
- (void)addSectionWithTitle:(id)a3 content:(id)a4;
- (void)dataSourceDidRebuildSections:(id)a3;
- (void)loadContentNowIfNeeded;
- (void)prepareContent;
- (void)rebuildSections;
- (void)setCollectionView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setupSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PreferencesValuesContaineeViewController

+ (BOOL)useCollectionView
{
  return 0;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PreferencesValuesContaineeViewController;
  [(ContaineeViewController *)&v4 viewDidLoad];
  [(PreferencesValuesContaineeViewController *)self setupSubviews];
  v3 = [(PreferencesValuesContaineeViewController *)self initialConstraints];
  +[NSLayoutConstraint activateConstraints:v3];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 0;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  if (([(PreferencesValuesContaineeViewController *)self collectionViewListLayoutAppearanceStyle] & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    double leading = 16.0;
    double top = 0.0;
    double bottom = 0.0;
    double trailing = 16.0;
  }
  else
  {
    double top = NSDirectionalEdgeInsetsZero.top;
    double leading = NSDirectionalEdgeInsetsZero.leading;
    double bottom = NSDirectionalEdgeInsetsZero.bottom;
    double trailing = NSDirectionalEdgeInsetsZero.trailing;
  }
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)collectionViewLayoutBoundarySupplementaryItems
{
  return 0;
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return 0;
}

- (id)collectionViewDecorationItems
{
  return 0;
}

- (BOOL)shouldCollapseFirstCollectionViewSectionHeader
{
  return 0;
}

- (void)setupSubviews
{
  if ([(id)objc_opt_class() useCollectionView])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100C0A5B0;
    v31[3] = &unk_1012E93F0;
    v31[4] = self;
    id v3 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v31];
    id v4 = objc_alloc((Class)UICollectionView);
    v5 = [(PreferencesValuesContaineeViewController *)self view];
    [v5 bounds];
    id v6 = [v4 initWithFrame:v3];
    [(PreferencesValuesContaineeViewController *)self setCollectionView:v6];

    v7 = [(PreferencesValuesContaineeViewController *)self collectionView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(PreferencesValuesContaineeViewController *)self dataSource];
    v9 = [(PreferencesValuesContaineeViewController *)self collectionView];
    [v9 setDataSource:v8];

    v10 = [(PreferencesValuesContaineeViewController *)self dataSource];
    v11 = [(PreferencesValuesContaineeViewController *)self collectionView];
    [v11 setDelegate:v10];

    v12 = [(PreferencesValuesContaineeViewController *)self collectionView];
    +[PreferenceValuesDataSource registerCellsInCollectionView:v12];

    v13 = [(ContaineeViewController *)self contentView];
    v14 = [(PreferencesValuesContaineeViewController *)self collectionView];
    [v13 addSubview:v14];
  }
  else
  {
    id v15 = objc_alloc((Class)UITableView);
    v16 = [(PreferencesValuesContaineeViewController *)self view];
    [v16 bounds];
    id v17 = [v15 initWithFrame:1];
    [(PreferencesValuesContaineeViewController *)self setTableView:v17];

    v18 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(PreferencesValuesContaineeViewController *)self dataSource];
    v20 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v20 setDataSource:v19];

    v21 = [(PreferencesValuesContaineeViewController *)self dataSource];
    v22 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v22 setDelegate:v21];

    v23 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v23 setBackgroundView:0];

    v24 = +[UIColor clearColor];
    v25 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v25 setBackgroundColor:v24];

    v26 = [(PreferencesValuesContaineeViewController *)self theme];
    v27 = [v26 groupTableViewHairlineColor];
    v28 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v28 setSeparatorColor:v27];

    id v30 = [(ContaineeViewController *)self contentView];
    v29 = [(PreferencesValuesContaineeViewController *)self tableView];
    [v30 addSubview:v29];
  }
}

- (id)initialConstraints
{
  tableView = self->_tableView;
  if (!tableView) {
    tableView = self->_collectionView;
  }
  id v3 = [(ContaineeViewController *)self contentView];
  LODWORD(v4) = 1148846080;
  [tableView _maps_constraintsEqualToEdgesOfView:v3 priority:v4];
  id v6 = [v5 allConstraints];

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PreferencesValuesContaineeViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(MapsThemeViewController *)self updateTheme];
}

- (PreferenceValuesDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    objc_super v4 = objc_alloc_init(PreferenceValuesDataSource);
    v5 = self->_dataSource;
    self->_dataSource = v4;

    [(PreferenceValuesDataSource *)self->_dataSource setDelegate:self];
    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (void)prepareContent
{
  id v2 = [(PreferencesValuesContaineeViewController *)self dataSource];
  [v2 prepareContent];
}

- (void)addSection:(id)a3
{
  id v4 = a3;
  id v5 = [(PreferencesValuesContaineeViewController *)self dataSource];
  [v5 addSection:v4];
}

- (void)addSectionWithTitle:(id)a3 content:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PreferencesValuesContaineeViewController *)self dataSource];
  [v8 addSectionWithTitle:v7 content:v6];
}

- (void)loadContentNowIfNeeded
{
  id v2 = [(PreferencesValuesContaineeViewController *)self dataSource];
  [v2 loadContentNowIfNeeded];
}

- (void)rebuildSections
{
  id v2 = [(PreferencesValuesContaineeViewController *)self dataSource];
  [v2 rebuildSections];
}

- (void)dataSourceDidRebuildSections:(id)a3
{
  [(UITableView *)self->_tableView reloadData];
  collectionView = self->_collectionView;

  [(UICollectionView *)collectionView reloadData];
}

- (void)setTableView:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end