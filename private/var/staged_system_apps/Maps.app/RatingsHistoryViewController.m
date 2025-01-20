@interface RatingsHistoryViewController
- (RatingsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_createCollectionViewLayout;
- (void)_createEmptyStateLayout;
- (void)_createOfflineStateLayout;
- (void)_setupCollectionViewConstraints;
- (void)_setupTitleHeaderConstraints;
- (void)_updateContent;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didTapOnPrivacyText;
- (void)loadDataSource;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RatingsHistoryViewController

- (RatingsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RatingsHistoryViewController;
  v4 = [(RatingsHistoryViewController *)&v10 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(RatingsHistoryViewController *)v4 setAccessibilityIdentifier:v6];

    v7 = [(ContaineeViewController *)v4 cardPresentationController];
    [v7 setPresentedModally:1];

    v8 = [(ContaineeViewController *)v4 cardPresentationController];
    [v8 setTakesAvailableHeight:1];
  }
  return v4;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)RatingsHistoryViewController;
  [(ContaineeViewController *)&v16 viewDidLoad];
  v3 = [(RatingsHistoryViewController *)self view];
  [v3 setAccessibilityIdentifier:@"RatingsHistoryView"];

  v4 = +[UIColor clearColor];
  v5 = [(RatingsHistoryViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(ContaineeViewController *)self headerView];
  uint64_t v7 = sub_1000BBB44(self);
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(ContainerHeaderView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)v8 setDelegate:self];
  if (v7 == 5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [(ContainerHeaderView *)v8 setHeaderSize:v9];
  objc_super v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"[User Profile] Ratings and Photos" value:@"localized string not found" table:0];
  [(ContainerHeaderView *)v8 setTitle:v11];

  [(ContainerHeaderView *)v8 setHairLineAlpha:0.0];
  v12 = +[UIColor clearColor];
  [(ContainerHeaderView *)v8 setBackgroundColor:v12];

  [v6 addSubview:v8];
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;
  v14 = v8;

  [(RatingsHistoryViewController *)self _setupTitleHeaderConstraints];
  [(RatingsHistoryViewController *)self _updateContent];
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"_updateContent" name:@"UsingOfflineMapsStateChangedNotification" object:0];
}

- (void)_updateContent
{
  [(UICollectionView *)self->_collectionView removeFromSuperview];
  collectionView = self->_collectionView;
  self->_collectionView = 0;

  [(UIView *)self->_emptyStateView removeFromSuperview];
  emptyStateView = self->_emptyStateView;
  self->_emptyStateView = 0;

  [(ErrorModeView *)self->_errorView removeFromSuperview];
  errorView = self->_errorView;
  self->_errorView = 0;

  v6 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v7 = [v6 isUsingOfflineMaps];

  if (v7)
  {
    [(RatingsHistoryViewController *)self _createOfflineStateLayout];
  }
  else
  {
    v8 = +[UserProfileLinkRatingsProvider sharedInstance];
    unsigned int v9 = [v8 hasRatings];

    if (v9)
    {
      [(RatingsHistoryViewController *)self _createCollectionViewLayout];
      [(RatingsHistoryViewController *)self _updateHeaderHairline];
      [(RatingsHistoryViewController *)self _setupCollectionViewConstraints];
    }
    else
    {
      [(RatingsHistoryViewController *)self _createEmptyStateLayout];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RatingsHistoryViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(RatingsHistoryViewController *)self loadDataSource];
  [(RatingsHistoryViewController *)self _updateHeaderHairline];
}

- (void)_setupTitleHeaderConstraints
{
  v18 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v19 = [(ContaineeViewController *)self headerView];
  v17 = [v19 topAnchor];
  objc_super v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v15 = [(ContaineeViewController *)self headerView];
  v13 = [v15 leadingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  objc_super v4 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v5 = [(ContaineeViewController *)self headerView];
  v6 = [v5 trailingAnchor];
  unsigned int v7 = [v4 constraintEqualToAnchor:v6];
  v20[2] = v7;
  v8 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  unsigned int v9 = [(ContaineeViewController *)self headerView];
  objc_super v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v20[3] = v11;
  v12 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setupCollectionViewConstraints
{
  v18 = [(UICollectionView *)self->_collectionView topAnchor];
  v19 = [(ContaineeViewController *)self contentView];
  v17 = [v19 topAnchor];
  objc_super v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v15 = [(ContaineeViewController *)self contentView];
  v13 = [v15 leadingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  objc_super v4 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v5 = [(ContaineeViewController *)self contentView];
  v6 = [v5 trailingAnchor];
  unsigned int v7 = [v4 constraintEqualToAnchor:v6];
  v20[2] = v7;
  v8 = [(UICollectionView *)self->_collectionView bottomAnchor];
  unsigned int v9 = [(ContaineeViewController *)self contentView];
  objc_super v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:-8.0];
  v20[3] = v11;
  v12 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_createCollectionViewLayout
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100CA7DFC;
  v21[3] = &unk_1012E93F0;
  v21[4] = self;
  id v3 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v21];
  id v4 = objc_alloc((Class)UICollectionView);
  v5 = [(RatingsHistoryViewController *)self view];
  [v5 bounds];
  v6 = [v4 initWithFrame:v3 collectionViewLayout:];

  [(UICollectionView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned int v7 = +[UIColor clearColor];
  [(UICollectionView *)v6 setBackgroundColor:v7];

  [(UICollectionView *)v6 setAutoresizingMask:18];
  collectionView = self->_collectionView;
  self->_collectionView = v6;
  unsigned int v9 = v6;

  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"RatingsHistoryCollectionView"];
  objc_super v10 = [(ContaineeViewController *)self contentView];
  [v10 addSubview:v9];

  v11 = self->_collectionView;
  uint64_t v12 = objc_opt_class();
  v13 = +[TwoLineCollectionViewListCell identifier];
  [(UICollectionView *)v11 registerClass:v12 forCellWithReuseIdentifier:v13];

  v14 = self->_collectionView;
  uint64_t v15 = objc_opt_class();
  objc_super v16 = +[SectionHeaderCollectionReusableView reuseIdentifier];
  [(UICollectionView *)v14 registerClass:v15 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v16];

  v17 = self->_collectionView;
  uint64_t v18 = objc_opt_class();
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  [(UICollectionView *)v17 registerClass:v18 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v20];
}

- (void)_createEmptyStateLayout
{
  id v3 = -[EmptyStateView initWithFrame:]([_TtC4Maps14EmptyStateView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v4 = [(ContaineeViewController *)self contentView];
  [v4 addSubview:v3];

  objc_storeStrong((id *)&self->_emptyStateView, v3);
  [(EmptyStateView *)v3 setAccessibilityIdentifier:@"RatingsHistoryEmptyStateView"];
  [(EmptyStateView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"[User Profile - Ratings] No Ratings or Photos" value:@"localized string not found" table:0];
  [(EmptyStateView *)v3 setTitle:v6];

  uint64_t v7 = sub_1000BBB44(self);
  v8 = +[NSBundle mainBundle];
  unsigned int v9 = v8;
  if (v7 == 5) {
    CFStringRef v10 = @"[User Profile - Ratings, macOS] Rate places and add photos by clicking a place on the map and then clicking \"Rate This Place\" or \"Add Photos.\"";
  }
  else {
    CFStringRef v10 = @"[User Profile - Ratings] Rate places and add photos by tapping a place on the map and then tapping \"Rate This Place\" or \"Add Photos.\"";
  }
  v24 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

  [(EmptyStateView *)v3 setSubtitle:v24];
  v22 = [(EmptyStateView *)v3 centerYAnchor];
  v23 = [(ContaineeViewController *)self contentView];
  v21 = [v23 centerYAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v11 = [(EmptyStateView *)v3 leadingAnchor];
  uint64_t v12 = [(ContaineeViewController *)self contentView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
  v25[1] = v14;
  uint64_t v15 = [(EmptyStateView *)v3 trailingAnchor];
  objc_super v16 = [(ContaineeViewController *)self contentView];
  v17 = [v16 trailingAnchor];
  uint64_t v18 = [v15 constraintEqualToAnchor:v17 constant:-16.0];
  v25[2] = v18;
  v19 = +[NSArray arrayWithObjects:v25 count:3];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_createOfflineStateLayout
{
  id v3 = objc_alloc_init(ErrorModeView);
  id v4 = [(ContaineeViewController *)self contentView];
  [v4 addSubview:v3];

  objc_storeStrong((id *)&self->_errorView, v3);
  [(ErrorModeView *)v3 setAccessibilityIdentifier:@"RatingsHistoryOfflineStateView"];
  [(ErrorModeView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v6 = [v5 isUsingForcedOfflineMaps];

  uint64_t v7 = +[NSBundle mainBundle];
  v8 = v7;
  if (v6)
  {
    v31 = [v7 localizedStringForKey:@"[User Profile - Ratings] Using Offline Maps" value:@"localized string not found" table:@"Offline"];

    unsigned int v9 = +[NSBundle mainBundle];
    v30 = [v9 localizedStringForKey:@"[User Profile - Ratings] Forced Offline Message" value:@"localized string not found" table:@"Offline"];

    CFStringRef v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"[User Profile - Ratings] Settings" value:@"localized string not found" table:@"Offline"];

    objc_initWeak(&location, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100CA88E8;
    v32[3] = &unk_1012EE310;
    objc_copyWeak(&v33, &location);
    [(ErrorModeView *)v3 setButtonTitle:v11 handler:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v31 = [v7 localizedStringForKey:@"[User Profile - Ratings] You’re Offline" value:@"localized string not found" table:@"Offline"];

    uint64_t v12 = +[NSBundle mainBundle];
    v30 = [v12 localizedStringForKey:@"[User Profile - Ratings] Offline message" value:@"localized string not found" table:@"Offline"];
  }
  [(ErrorModeView *)v3 setTitle:v31 andMessage:v30];
  v28 = [(ErrorModeView *)v3 topAnchor];
  v29 = [(ContaineeViewController *)self contentView];
  v27 = [v29 topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v35[0] = v26;
  v24 = [(ErrorModeView *)v3 leadingAnchor];
  v25 = [(ContaineeViewController *)self contentView];
  v23 = [v25 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:32.0];
  v35[1] = v22;
  v13 = [(ErrorModeView *)v3 trailingAnchor];
  v14 = [(ContaineeViewController *)self contentView];
  uint64_t v15 = [v14 trailingAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15 constant:-32.0];
  v35[2] = v16;
  v17 = [(ErrorModeView *)v3 bottomAnchor];
  uint64_t v18 = [(ContaineeViewController *)self contentView];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19 constant:-8.0];
  v35[3] = v20;
  v21 = +[NSArray arrayWithObjects:v35 count:4];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)loadDataSource
{
  id v3 = [[RatingsHistoryDataSource alloc] initWithCollectionView:self->_collectionView updateLocation:0];
  ratingsDataSource = self->_ratingsDataSource;
  self->_ratingsDataSource = v3;

  [self->_ratingsDataSource setDelegate:self];
  [(RatingsHistoryDataSource *)self->_ratingsDataSource setPrivacyDelegate:self];
  [(UICollectionView *)self->_collectionView setDelegate:self->_ratingsDataSource];
  [(UICollectionView *)self->_collectionView setDataSource:self->_ratingsDataSource];
  v5 = self->_ratingsDataSource;

  [(DataSource *)v5 setActive:1];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RatingsHistoryViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(RatingsHistoryViewController *)self _updateHeaderHairline];
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_ratingsDataSource == a3)
  {
    [(UICollectionView *)self->_collectionView reloadData];
    [(RatingsHistoryViewController *)self _updateHeaderHairline];
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v8 mapItem];
    unsigned int v6 = [[SearchResult alloc] initWithMapItem:v5];
    uint64_t v7 = [(ControlContaineeViewController *)self delegate];
    [v7 viewController:self openSearchResult:v6];
  }
}

- (void)didTapOnPrivacyText
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.ratingsAndPhotos"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingsDataSource, 0);
  objc_storeStrong((id *)&self->_emptyStateView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end