@interface CarShortcutsCardViewController
- (BOOL)_scrollsIfUsingCompactLayout:(BOOL)a3;
- (BOOL)_useCompactLayout;
- (BOOL)canBeExpanded;
- (BOOL)expanded;
- (BOOL)shouldBeVisible;
- (CGSize)_cellSizeUsingCompactLayout:(BOOL)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CarShortcutsCardViewController)init;
- (CarShortcutsCardViewControllerDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_preferredHeightUsingCompactLayout:(BOOL)a3;
- (id)_sortCells:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (int64_t)_numberOfItems;
- (int64_t)_numberOfRows;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_captureTapActionWithFavoriteItem:(id)a3;
- (void)_captureTapActionWithShortcut:(id)a3;
- (void)_updateHeightConstraint;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setCanBeExpanded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setShouldBeVisible:(BOOL)a3;
- (void)shortcutsProviderUpdated:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarShortcutsCardViewController

- (CarShortcutsCardViewController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarShortcutsCardViewController;
  v2 = [(CarShortcutsCardViewController *)&v14 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    [(CarShortcutsCardViewController *)v2 setShouldBeVisible:0];
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      v4 = +[MapsFavoritesManager sharedManager];
      [v4 registerObserver:v3];

      v5 = +[MapsFavoritesManager sharedManager];
      v6 = [v5 shortcutsForCarplay];
      -[CarShortcutsCardViewController setShouldBeVisible:](v3, "setShouldBeVisible:", [v6 count] != 0);

      v7 = +[MapsFavoritesManager sharedManager];
      v8 = [v7 shortcutsForCarplay];
      -[CarShortcutsCardViewController setCanBeExpanded:](v3, "setCanBeExpanded:", (unint64_t)[v8 count] > 2);
    }
    else
    {
      v9 = objc_alloc_init(CarShortcutsProvider);
      shortcutsProvider = v3->_shortcutsProvider;
      v3->_shortcutsProvider = v9;

      [(CarShortcutsProvider *)v3->_shortcutsProvider setDelegate:v3];
      [(CarShortcutsProvider *)v3->_shortcutsProvider start];
    }
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v3 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)CarShortcutsCardViewController;
  [(CarShortcutsCardViewController *)&v38 viewDidLoad];
  v3 = [(CarShortcutsCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarShortcutsCard"];

  id v4 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v4 setMinimumLineSpacing:12.0];
  [v4 setMinimumInteritemSpacing:10.0];
  v37 = v4;
  [v4 setScrollDirection:0];
  v5 = -[CarCollectionView initWithFrame:collectionViewLayout:]([CarCollectionView alloc], "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarCollectionView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = +[UIColor clearColor];
  [(CarCollectionView *)v5 setBackgroundColor:v6];

  uint64_t v7 = objc_opt_class();
  v8 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
  [(CarCollectionView *)v5 registerClass:v7 forCellWithReuseIdentifier:v8];

  uint64_t v9 = objc_opt_class();
  v10 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
  [(CarCollectionView *)v5 registerClass:v9 forCellWithReuseIdentifier:v10];

  [(CarCollectionView *)v5 setScrollEnabled:self->_expanded];
  v11 = [(CarShortcutsCardViewController *)self view];
  [v11 addSubview:v5];

  collectionView = self->_collectionView;
  self->_collectionView = v5;
  v13 = v5;

  objc_super v14 = [(CarShortcutsCardViewController *)self view];
  v15 = [v14 heightAnchor];
  v16 = [v15 constraintEqualToConstant:0.0];
  collectionHeight = self->_collectionHeight;
  self->_collectionHeight = v16;

  LODWORD(v18) = 1144750080;
  [(NSLayoutConstraint *)self->_collectionHeight setPriority:v18];
  [(CarShortcutsCardViewController *)self _updateHeightConstraint];
  v39[0] = self->_collectionHeight;
  v35 = [(CarCollectionView *)v13 topAnchor];
  v36 = [(CarShortcutsCardViewController *)self view];
  v34 = [v36 topAnchor];
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  v33 = [v35 constraintEqualToAnchor:v34 constant:-v19];
  v39[1] = v33;
  v31 = [(CarCollectionView *)v13 leadingAnchor];
  v32 = [(CarShortcutsCardViewController *)self view];
  v30 = [v32 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v39[2] = v29;
  v28 = [(CarShortcutsCardViewController *)self view];
  v20 = [v28 trailingAnchor];
  v21 = [(CarCollectionView *)v13 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v39[3] = v22;
  v23 = [(CarShortcutsCardViewController *)self view];
  v24 = [v23 bottomAnchor];
  v25 = [(CarCollectionView *)v13 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v39[4] = v26;
  v27 = +[NSArray arrayWithObjects:v39 count:5];
  +[NSLayoutConstraint activateConstraints:v27];

  [(CarCollectionView *)v13 setDataSource:self];
  [(CarCollectionView *)v13 setDelegate:self];
}

- (void)dealloc
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = +[MapsFavoritesManager sharedManager];
    [v3 unregisterObserver:self];
  }
  else
  {
    [(CarShortcutsProvider *)self->_shortcutsProvider stop];
  }
  v4.receiver = self;
  v4.super_class = (Class)CarShortcutsCardViewController;
  [(CarShortcutsCardViewController *)&v4 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CarShortcutsCardViewController;
  [(CarShortcutsCardViewController *)&v7 viewDidLayoutSubviews];
  [(CarShortcutsCardViewController *)self _cellSizeUsingCompactLayout:[(CarShortcutsCardViewController *)self _useCompactLayout]];
  if (v3 != self->_cellSize.width || v4 != self->_cellSize.height)
  {
    self->_cellSize.width = v3;
    self->_cellSize.height = v4;
    [(CarCollectionView *)self->_collectionView reloadData];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CE7338;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  +[UIView performWithoutAnimation:v6];
}

- (int64_t)_numberOfItems
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    double v3 = +[MapsFavoritesManager sharedManager];
    double v4 = [v3 shortcutsForCarplay];
    int64_t v5 = (int64_t)[v4 count];
  }
  else
  {
    double v3 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
    int64_t v5 = (int64_t)[v3 count];
  }

  int64_t v6 = 2;
  if (v5 < 2) {
    int64_t v6 = v5;
  }
  if (self->_expanded) {
    return v5;
  }
  else {
    return v6;
  }
}

- (int64_t)_numberOfRows
{
  uint64_t v2 = [(CarShortcutsCardViewController *)self _numberOfItems];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = v2 + 1;
  }
  int64_t v4 = v3 >> 1;
  if ((v2 & 0x8000000000000001) == 1) {
    return v4 + 1;
  }
  else {
    return v4;
  }
}

- (double)_preferredHeightUsingCompactLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CarShortcutsCardViewController *)self _numberOfRows];
  if (v5 < 1) {
    return 0.0;
  }
  double v6 = (double)v5;
  [(CarShortcutsCardViewController *)self _cellSizeUsingCompactLayout:v3];
  return (v6 + -1.0) * 12.0 + v7 * v6;
}

- (void)_updateHeightConstraint
{
  [(CarShortcutsCardViewController *)self _preferredHeightUsingCompactLayout:0];
  collectionHeight = self->_collectionHeight;

  -[NSLayoutConstraint setConstant:](collectionHeight, "setConstant:");
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[CarCollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:");
    [(CarShortcutsCardViewController *)self _updateHeightConstraint];
    collectionView = self->_collectionView;
    [(CarCollectionView *)collectionView reloadData];
  }
}

- (void)setShouldBeVisible:(BOOL)a3
{
  if (self->_shouldBeVisible != a3)
  {
    self->_shouldBeVisible = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carShortcutsCardViewController:self visibilityUpdated:self->_shouldBeVisible];
  }
}

- (void)setCanBeExpanded:(BOOL)a3
{
  if (self->_canBeExpanded != a3)
  {
    self->_canBeExpanded = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained carShortcutsCardViewController:self canBeExpandedUpdated:self->_canBeExpanded];
  }
}

- (CGSize)_cellSizeUsingCompactLayout:(BOOL)a3
{
  if (a3) {
    int64_t v4 = CarShortcutCompactCollectionViewCell;
  }
  else {
    int64_t v4 = CarShortcutCollectionViewCell;
  }
  uint64_t v5 = [(CarShortcutsCardViewController *)self traitCollection];
  [(__objc2_class *)v4 cellSizeWithTraitCollection:v5];
  double v7 = v6;

  [(CarCollectionView *)self->_collectionView bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  if (CGRectGetWidth(v15) + -12.0 + -20.0 >= 0.0)
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRectGetWidth(v16);
  }
  UIFloorToViewScale();
  double v13 = v7;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (BOOL)_useCompactLayout
{
  if ([(CarShortcutsCardViewController *)self expanded]) {
    return 0;
  }

  return [(CarShortcutsCardViewController *)self _scrollsIfUsingCompactLayout:0];
}

- (BOOL)_scrollsIfUsingCompactLayout:(BOOL)a3
{
  BOOL v3 = a3;
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  double v6 = v5;
  [(CarShortcutsCardViewController *)self _preferredHeightUsingCompactLayout:v3];
  double v8 = v7;
  [(CarCollectionView *)self->_collectionView bounds];
  return v8 > CGRectGetHeight(v10) - v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CarShortcutsCardViewController;
  id v4 = a3;
  [(CarShortcutsCardViewController *)&v11 traitCollectionDidChange:v4];
  double v5 = [(CarShortcutsCardViewController *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9)
  {
    [(CarShortcutsCardViewController *)self _updateHeightConstraint];
    CGRect v10 = [(CarCollectionView *)self->_collectionView collectionViewLayout];
    [v10 invalidateLayout];
  }
}

- (void)shortcutsProviderUpdated:(id)a3
{
  id v4 = a3;
  double v5 = [v4 shortcuts];
  -[CarShortcutsCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", [v5 count] != 0);

  double v6 = [v4 shortcuts];

  -[CarShortcutsCardViewController setCanBeExpanded:](self, "setCanBeExpanded:", (unint64_t)[v6 count] > 2);
  [(CarShortcutsCardViewController *)self _updateHeightConstraint];
  collectionView = self->_collectionView;

  [(CarCollectionView *)collectionView reloadData];
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4 = +[MapsFavoritesManager sharedManager];
  double v5 = [v4 shortcutsForCarplay];
  -[CarShortcutsCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", [v5 count] != 0);

  double v6 = +[MapsFavoritesManager sharedManager];
  double v7 = [v6 shortcutsForCarplay];
  -[CarShortcutsCardViewController setCanBeExpanded:](self, "setCanBeExpanded:", (unint64_t)[v7 count] > 2);

  [(CarShortcutsCardViewController *)self _updateHeightConstraint];
  collectionView = self->_collectionView;

  [(CarCollectionView *)collectionView reloadData];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(CarShortcutsCardViewController *)self _useCompactLayout];
  double v9 = off_1012D26D0;
  if (!v8) {
    double v9 = off_1012D26C8;
  }
  CGRect v10 = [(__objc2_class *)*v9 cellReuseIdentifier];
  objc_super v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    double v12 = +[MapsFavoritesManager sharedManager];
    double v13 = [v12 shortcutsForCarplay];
    objc_super v14 = [v13 objectAtIndexedSubscript:[v6 row]];

    CGRect v15 = [[SuggestionShortcutsRowCellModel alloc] initWithMapsFavoriteItem:v14];
  }
  else
  {
    CGRect v16 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
    objc_super v14 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    CGRect v15 = [[SuggestionShortcutsRowCellModel alloc] initWithMapsSuggestionsEntry:v14];
  }
  v17 = v15;

  [v11 setModel:v17];

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  BOOL v6 = [(CarShortcutsCardViewController *)self _useCompactLayout];

  [(CarShortcutsCardViewController *)self _cellSizeUsingCompactLayout:v6];
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  double v6 = 10.0;
  double v7 = 0.0;
  double v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    double v6 = +[MapsFavoritesManager sharedManager];
    double v7 = [v6 shortcutsForCarplay];
    id v8 = [v5 row];

    id v13 = [v7 objectAtIndexedSubscript:v8];

    double v9 = +[CarChromeModeCoordinator sharedInstance];
    [v9 displayRoutePlanningForDestination:v13];

    [(CarShortcutsCardViewController *)self _captureTapActionWithFavoriteItem:v13];
  }
  else
  {
    CGRect v10 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
    id v11 = [v5 row];

    id v13 = [v10 objectAtIndexedSubscript:v11];

    double v12 = +[CarChromeModeCoordinator sharedInstance];
    [v12 displayRoutePlanningForDestination:v13];

    [(CarShortcutsCardViewController *)self _captureTapActionWithShortcut:v13];
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  if ([(CarShortcutsCardViewController *)self shouldBeVisible])
  {
    BOOL v3 = +[NSIndexPath indexPathForRow:0 inSection:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_sortCells:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_101321628];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarShortcutsCardViewController *)self shouldBeVisible])
  {
    BOOL v3 = [(CarCollectionView *)self->_collectionView visibleCells];
    id v4 = [(CarShortcutsCardViewController *)self _sortCells:v3];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (void)_captureTapActionWithShortcut:(id)a3
{
  id v7 = a3;
  id v3 = [v7 type];
  if (v3 == (id)18)
  {
    id v5 = [v7 geoMapItem];
    double v6 = [v5 _mapsCategoryId];

    +[GEOAPPortal captureUserAction:2049 target:1005 value:v6];
  }
  else
  {
    if (v3 == (id)2)
    {
      uint64_t v4 = 2047;
    }
    else
    {
      if (v3 != (id)1) {
        goto LABEL_8;
      }
      uint64_t v4 = 2046;
    }
    +[GEOAPPortal captureUserAction:v4 target:1005 value:0];
  }
LABEL_8:
}

- (void)_captureTapActionWithFavoriteItem:(id)a3
{
  id v7 = a3;
  id v3 = [v7 type];
  if (v3 == (id)1)
  {
    id v5 = [v7 geoMapItem];
    double v6 = [v5 _mapsCategoryId];
    +[GEOAPPortal captureUserAction:2049 target:1005 value:v6];
  }
  else
  {
    if (v3 == (id)3)
    {
      uint64_t v4 = 2047;
    }
    else
    {
      if (v3 != (id)2) {
        goto LABEL_8;
      }
      uint64_t v4 = 2046;
    }
    +[GEOAPPortal captureUserAction:v4 target:1005 value:0];
  }
LABEL_8:
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    [v5 registerObserver:self];
  }
  else
  {
    shortcutsProvider = self->_shortcutsProvider;
    [(CarShortcutsProvider *)shortcutsProvider start];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    [v5 unregisterObserver:self];
  }
  else
  {
    shortcutsProvider = self->_shortcutsProvider;
    [(CarShortcutsProvider *)shortcutsProvider stop];
  }
}

- (CarShortcutsCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarShortcutsCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (BOOL)canBeExpanded
{
  return self->_canBeExpanded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shortcutsProvider, 0);
  objc_storeStrong((id *)&self->_collectionHeight, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end