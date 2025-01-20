@interface TravelPreferencesViewController
+ (BOOL)useCollectionView;
- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3;
- (TravelPreferencesDataSource)travelPreferencesDataSource;
- (TravelPreferencesViewController)initWithCompletionHandler:(id)a3;
- (int64_t)collectionViewConfigurationSeparatorStyle;
- (int64_t)collectionViewListLayoutAppearanceStyle;
- (void)dataSourceDidRebuildSections:(id)a3;
- (void)didTapOnPrivacyText;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)reloadData;
- (void)setupSubviews;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TravelPreferencesViewController

+ (BOOL)useCollectionView
{
  return 1;
}

- (TravelPreferencesViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TravelPreferencesViewController;
  v5 = [(TravelPreferencesViewController *)&v14 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = objc_alloc_init(TravelPreferencesDataSource);
    [(PreferenceValuesDataSource *)v6 setDelegate:v5];
    [(TravelPreferencesDataSource *)v6 setPrivacyDelegate:v5];
    dataSource = v5->super._dataSource;
    v5->super._dataSource = &v6->super;
    v8 = v6;

    [(TravelPreferencesDataSource *)v8 loadPreferences];
    v9 = [(ContaineeViewController *)v5 cardPresentationController];
    [v9 setPresentedModally:1];

    v10 = [(ContaineeViewController *)v5 cardPresentationController];
    [v10 setTakesAvailableHeight:1];

    id v11 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = v11;
  }
  return v5;
}

- (TravelPreferencesDataSource)travelPreferencesDataSource
{
  return (TravelPreferencesDataSource *)self->super._dataSource;
}

- (void)viewDidLoad
{
  v55.receiver = self;
  v55.super_class = (Class)TravelPreferencesViewController;
  [(PreferencesValuesContaineeViewController *)&v55 viewDidLoad];
  v3 = [(TravelPreferencesViewController *)self view];
  [v3 setAccessibilityIdentifier:@"TravelPreferencesView"];

  id v4 = +[UIColor clearColor];
  v5 = [(TravelPreferencesViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(ContaineeViewController *)self headerView];
  v7 = [(ContaineeViewController *)self contentView];
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(ContainerHeaderView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)v8 setDelegate:self];
  [(ContainerHeaderView *)v8 setHeaderSize:2];
  [(ContainerHeaderView *)v8 setHairLineAlpha:0.0];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[User Profile] Preferences" value:@"localized string not found" table:0];
  [(ContainerHeaderView *)v8 setTitle:v10];

  id v11 = +[UIColor clearColor];
  [(ContainerHeaderView *)v8 setBackgroundColor:v11];

  [v6 addSubview:v8];
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;
  v13 = v8;

  objc_super v14 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v14 setAccessibilityIdentifier:@"TravelPreferencesCollectionView"];

  v15 = +[UIColor clearColor];
  v16 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v16 setBackgroundColor:v15];

  v17 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = [(PreferencesValuesContaineeViewController *)self collectionView];
  +[TravelPreferencesDataSource registerCellsInCollectionView:v18];

  v19 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v7 addSubview:v19];

  v52 = [(ContainerHeaderView *)v13 topAnchor];
  v51 = [v6 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v56[0] = v50;
  v49 = [(ContainerHeaderView *)v13 leadingAnchor];
  v48 = [v6 leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v56[1] = v47;
  v53 = v13;
  v46 = [(ContainerHeaderView *)v13 trailingAnchor];
  v54 = v6;
  v45 = [v6 trailingAnchor];
  v43 = [v46 constraintEqualToAnchor:v45];
  v56[2] = v43;
  v42 = [(ContainerHeaderView *)v13 bottomAnchor];
  v41 = [v6 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v56[3] = v40;
  v39 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v38 = [v39 topAnchor];
  v20 = v7;
  v37 = [v7 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v56[4] = v36;
  v35 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v34 = [v35 leadingAnchor];
  v33 = [v7 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v56[5] = v32;
  v21 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v22 = [v21 trailingAnchor];
  v44 = v7;
  v23 = [v7 trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v56[6] = v24;
  v25 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v26 = [v25 bottomAnchor];
  v27 = [v20 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v56[7] = v28;
  v29 = +[NSArray arrayWithObjects:v56 count:8];
  +[NSLayoutConstraint activateConstraints:v29];

  v30 = +[NSNotificationCenter defaultCenter];
  [v30 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  _GEOConfigAddDelegateListenerForKey();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIKeyboardWillHideNotification object:0];

  GEOConfigRemoveDelegateListenerForKey();
  v7.receiver = self;
  v7.super_class = (Class)TravelPreferencesViewController;
  [(ContaineeViewController *)&v7 viewWillDisappear:v3];
}

- (void)setupSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)TravelPreferencesViewController;
  [(PreferencesValuesContaineeViewController *)&v2 setupSubviews];
}

- (int64_t)collectionViewListLayoutAppearanceStyle
{
  return 2 * (sub_1000BBB44(self) != 5);
}

- (int64_t)collectionViewConfigurationSeparatorStyle
{
  return sub_1000BBB44(self) != 5;
}

- (NSDirectionalEdgeInsets)collectionViewListSectionContentInsetsForSection:(int64_t)a3
{
  if ((char *)[(PreferenceValuesDataSource *)self->super._dataSource numberOfSections] - 2 == (unsigned char *)a3) {
    double v3 = 6.0;
  }
  else {
    double v3 = 10.0;
  }
  double v4 = 0.0;
  double v5 = 16.0;
  double v6 = 16.0;
  result.trailing = v6;
  result.bottom = v3;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  if (MapsFeature_IsEnabled_SydneyARP())
  {
    double v6 = [(TravelPreferencesViewController *)self travelPreferencesDataSource];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100791118;
    v7[3] = &unk_1012EBDD8;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [v6 updatePhotoCreditPreferencesWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
  else
  {
    [(ContaineeViewController *)self handleDismissAction:v5];
  }
  objc_destroyWeak(&location);
}

- (void)dataSourceDidRebuildSections:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TravelPreferencesViewController;
  [(PreferencesValuesContaineeViewController *)&v3 dataSourceDidRebuildSections:a3];
}

- (void)didTapOnPrivacyText
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.ratingsAndPhotos"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)keyboardWillShow:(id)a3
{
  double v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_super v14 = [(PreferencesValuesContaineeViewController *)self collectionView];
  v15 = +[UIScreen mainScreen];
  v16 = [v15 coordinateSpace];
  [v14 convertRect:v16 fromCoordinateSpace:v7, v9, v11, v13];
  double v18 = v17;

  id v19 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v19 setContentInset:0.0, 0.0, v18, 0.0];
}

- (void)keyboardWillHide:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v7 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v7 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  id v8 = [(PreferencesValuesContaineeViewController *)self collectionView];
  [v8 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_PreferencesUniqueEntityDidUpdate && a3.var1 == off_1015F1418) {
    [(TravelPreferencesViewController *)self reloadData];
  }
}

- (void)reloadData
{
  id v2 = [(TravelPreferencesViewController *)self travelPreferencesDataSource];
  [v2 loadPreferences];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end