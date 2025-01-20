@interface UserProfileCollectionViewController
- (UICollectionView)collectionView;
- (UserProfileCollectionViewController)initWithAccount:(id)a3 contentViewDelegate:(id)a4;
- (UserProfileContentViewDelegate)contentViewDelegate;
- (id)_createModelForType:(int64_t)a3;
- (id)_generateAvailableActionsForAnalytics;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_addRowContent;
- (void)_captureAvailableActions:(id)a3;
- (void)_createLayout;
- (void)_loadGarage;
- (void)_setupConstraints;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)countryConfigurationDidChange:(id)a3;
- (void)dataDidUpdateForUserProfileLinkType:(int64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentViewDelegate:(id)a3;
- (void)userDataDidUpdate;
- (void)userProfileLinkCellTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation UserProfileCollectionViewController

- (UserProfileCollectionViewController)initWithAccount:(id)a3 contentViewDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UserProfileCollectionViewController;
  v9 = [(UserProfileCollectionViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_contentViewDelegate, v8);
    [(UserProfileCollectionViewController *)v10 _loadGarage];
    [(UserProfileCollectionViewController *)v10 _addRowContent];
  }

  return v10;
}

- (void)_loadGarage
{
  v3 = +[UserProfileLinkGarageProvider sharedInstance];
  v4 = [v3 virtualGarage];
  virtualGarage = self->_virtualGarage;
  self->_virtualGarage = v4;

  [(UserProfileCollectionViewController *)self _addRowContent];
  id v7 = [(UserProfileCollectionViewController *)self collectionView];
  v6 = +[NSIndexSet indexSetWithIndex:0];
  [v7 reloadSections:v6];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)UserProfileCollectionViewController;
  [(UserProfileCollectionViewController *)&v30 viewDidLoad];
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  linkDictionaryByType = self->_linkDictionaryByType;
  self->_linkDictionaryByType = v3;

  v5 = [(UserProfileCollectionViewController *)self view];
  [v5 setAccessibilityIdentifier:@"UserProfileCollectionView"];

  v6 = [(UserProfileCollectionViewController *)self view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UserProfileCollectionViewController *)self _createLayout];
  [(UserProfileCollectionViewController *)self _setupConstraints];
  id v7 = [(UserProfileCollectionViewController *)self collectionView];
  [v7 setDataSource:self];

  id v8 = [(UserProfileCollectionViewController *)self collectionView];
  [v8 setDelegate:self];

  v9 = [(UserProfileCollectionViewController *)self collectionView];
  [v6 addSubview:v9];

  v10 = [(UserProfileCollectionViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UserProfileLinkCell"];

  v11 = +[UserInformationManager sharedInstance];
  objc_super v12 = [v11 observers];
  [v12 registerObserver:self];

  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v13 = &off_1012D4D90;
  }
  else
  {
    v14 = +[UserProfileLinkFavoritesProvider sharedInstance];
    v15 = [v14 observers];
    [v15 registerObserver:self];

    v13 = off_1012D4B10;
  }
  v16 = [(__objc2_class *)*v13 sharedInstance];
  v17 = [v16 observers];
  [v17 registerObserver:self];

  v18 = +[UserProfileLinkGarageProvider sharedInstance];
  v19 = [v18 observers];
  [v19 registerObserver:self];

  v20 = +[UserProfileLinkRatingsProvider sharedInstance];
  v21 = [v20 observers];
  [v21 registerObserver:self];

  v22 = +[UserProfileLinkReportsProvider sharedInstance];
  v23 = [v22 observers];
  [v23 registerObserver:self];

  v24 = +[UserProfileLinkPreferencesProvider sharedInstance];
  v25 = [v24 observers];
  [v25 registerObserver:self];

  v26 = +[UserProfileLinkOfflineMapsProvider sharedInstance];
  v27 = [v26 observers];
  [v27 registerObserver:self];

  v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

  v29 = [(UserProfileCollectionViewController *)self _generateAvailableActionsForAnalytics];
  [(UserProfileCollectionViewController *)self _captureAvailableActions:v29];
}

- (void)_createLayout
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_100C53284;
  v13 = &unk_1012EF3A8;
  objc_copyWeak(&v14, &location);
  id v4 = [v3 initWithSectionProvider:&v10];
  id v5 = objc_alloc((Class)UICollectionView);
  v6 = [(UserProfileCollectionViewController *)self view];
  [v6 bounds];
  id v7 = [v5 initWithFrame:v4 collectionViewLayout:];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAlwaysBounceVertical:0];
  id v8 = +[UIColor clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setAutoresizingMask:18];
  objc_storeStrong((id *)&self->_collectionView, v7);
  v9 = [(UserProfileCollectionViewController *)self view];
  [v9 addSubview:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  v23 = [(UserProfileCollectionViewController *)self collectionView];
  v21 = [v23 topAnchor];
  v22 = [(UserProfileCollectionViewController *)self view];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(UserProfileCollectionViewController *)self collectionView];
  v16 = [v18 leadingAnchor];
  v17 = [(UserProfileCollectionViewController *)self view];
  v15 = [v17 leadingAnchor];
  id v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  v13 = [(UserProfileCollectionViewController *)self collectionView];
  id v3 = [v13 trailingAnchor];
  id v4 = [(UserProfileCollectionViewController *)self view];
  id v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  id v7 = [(UserProfileCollectionViewController *)self collectionView];
  id v8 = [v7 bottomAnchor];
  v9 = [(UserProfileCollectionViewController *)self view];
  v10 = [v9 bottomAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  objc_super v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_addRowContent
{
  if ([(NSMutableArray *)self->_userProfilePersonalizationSections count]) {
    [(NSMutableArray *)self->_userProfilePersonalizationSections removeAllObjects];
  }
  id v3 = +[NSMutableArray array];
  userProfilePersonalizationSections = self->_userProfilePersonalizationSections;
  self->_userProfilePersonalizationSections = v3;

  unsigned int v5 = +[LibraryUIUtilities isMyPlacesEnabled];
  v6 = self->_userProfilePersonalizationSections;
  if (v5) {
    [(NSMutableArray *)v6 addObject:&off_1013AABD0];
  }
  else {
    [(NSMutableArray *)v6 addObjectsFromArray:&off_1013AE7A8];
  }
  [(NSMutableArray *)self->_userProfilePersonalizationSections addObject:&off_1013AAC18];
  if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0) {
    [(NSMutableArray *)self->_userProfilePersonalizationSections addObject:&off_1013AAC30];
  }
  id v7 = +[GEOCountryConfiguration sharedConfiguration];
  id v8 = [v7 countryCode];
  unsigned int v9 = [v8 isEqualToString:@"CN"];

  int LagunaBeachContributions = GEOCanUserMakeLagunaBeachContributions();
  uint64_t v11 = +[UserProfileLinkRatingsProvider sharedInstance];
  unsigned int v12 = [v11 hasRatings];

  if (!v9 && LagunaBeachContributions && v12) {
    [(NSMutableArray *)self->_userProfilePersonalizationSections addObject:&off_1013AAC48];
  }
  uint64_t v13 = sub_1000BBB44(self);
  unsigned int v14 = v13 == 5;
  v15 = +[UserProfileLinkGarageProvider sharedInstance];
  v16 = [v15 virtualGarage];
  v17 = [v16 vehicles];
  id v18 = [v17 count];
  if (v18) {
    unsigned int v14 = 0;
  }
  if (v13 != 5 && !v18)
  {
    v19 = +[UserProfileLinkGarageProvider sharedInstance];
    unsigned int v14 = [v19 hasUnpairedVehicles] ^ 1;
  }
  int IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  int IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  int v22 = v14 ^ 1;
  if (v13 != 5)
  {
    if ((v22 & IsEnabled_EVRouting | IsEnabled_Alberta) != 1) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v22 & (IsEnabled_EVRouting | IsEnabled_Alberta)) {
LABEL_22:
  }
    [(NSMutableArray *)self->_userProfilePersonalizationSections addObject:&off_1013AAC60];
LABEL_23:
  [(NSMutableArray *)self->_userProfilePersonalizationSections addObject:&off_1013AAC78];
  id v23 = [(NSMutableArray *)self->_userProfilePersonalizationSections count];
  v24 = [(UserProfileCollectionViewController *)self contentViewDelegate];
  id v25 = [v24 numberOfRows];

  if (v25 != v23)
  {
    v26 = [(UserProfileCollectionViewController *)self contentViewDelegate];
    [v26 setNumberOfRows:v23];

    id v27 = [(UserProfileCollectionViewController *)self contentViewDelegate];
    [v27 profileContentDidUpdate];
  }
}

- (id)_createModelForType:(int64_t)a3
{
  unsigned int v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  v6 = [(NSMutableDictionary *)self->_linkDictionaryByType objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v7 = objc_alloc_init(UserProfileLinkFactory);
    v6 = [(UserProfileLinkFactory *)v7 createModelForType:a3];
    [(NSMutableDictionary *)self->_linkDictionaryByType setObject:v6 forKey:v5];
  }

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 row];
  unsigned int v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"UserProfileLinkCell" forIndexPath:v6];

  v10 = [(NSMutableArray *)self->_userProfilePersonalizationSections objectAtIndexedSubscript:v8];
  unint64_t v11 = (unint64_t)[v10 integerValue];

  if (v11 > 7)
  {
    uint64_t v13 = 0;
  }
  else
  {
    unsigned int v12 = off_10131C8F0[v11];
    uint64_t v13 = [(UserProfileCollectionViewController *)self _createModelForType:v11];
    unsigned int v14 = +[UIColor colorNamed:v12];
    [v9 setGlyphBackgroundColor:v14];
  }
  [v9 setUserProfileLink:v13];

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_userProfilePersonalizationSections count];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 cellForItemAtIndexPath:v6];
  id v8 = [(UserProfileCollectionViewController *)self contentViewDelegate];
  unsigned int v9 = [v11 userProfileLink];
  v10 = [(UserProfileCollectionViewController *)self _generateAvailableActionsForAnalytics];
  [v8 userProfileLinkTapped:v9 availableActions:v10];

  [v7 deselectItemAtIndexPath:v6 animated:1];
}

- (void)userProfileLinkCellTapped:(id)a3
{
  id v4 = a3;
  id v7 = [(UserProfileCollectionViewController *)self contentViewDelegate];
  unsigned int v5 = [v4 userProfileLink];

  id v6 = [(UserProfileCollectionViewController *)self _generateAvailableActionsForAnalytics];
  [v7 userProfileLinkTapped:v5 availableActions:v6];
}

- (void)userDataDidUpdate
{
  [(UserProfileCollectionViewController *)self _addRowContent];
  id v3 = [(UserProfileCollectionViewController *)self collectionView];
  [v3 reloadData];
}

- (void)dataDidUpdateForUserProfileLinkType:(int64_t)a3
{
  id v6 = sub_100011FD4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    unsigned int v9 = NSStringFromSelector(a2);
    int v18 = 138412802;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 1024;
    int v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@%d", (uint8_t *)&v18, 0x1Cu);
  }
  v10 = +[NSNumber numberWithInteger:a3];
  id v11 = [(NSMutableDictionary *)self->_linkDictionaryByType objectForKeyedSubscript:v10];
  if (v11)
  {
    if (a3) {
      goto LABEL_5;
    }
LABEL_9:
    unsigned int v12 = &off_1012D4D90;
    goto LABEL_11;
  }
  uint64_t v13 = objc_alloc_init(UserProfileLinkFactory);
  id v11 = [(UserProfileLinkFactory *)v13 createModelForType:a3];

  if (!a3) {
    goto LABEL_9;
  }
LABEL_5:
  if (a3 == 4)
  {
    unsigned int v12 = off_1012D4B28;
    goto LABEL_11;
  }
  if (a3 == 3)
  {
    unsigned int v12 = &off_1012D4B30;
LABEL_11:
    unsigned int v14 = [(__objc2_class *)*v12 sharedInstance];
    v15 = [v14 retrieveSubtitleText];
    [v11 setSubtitle:v15];
  }
  [(NSMutableDictionary *)self->_linkDictionaryByType setObject:v11 forKey:v10];
  [(UserProfileCollectionViewController *)self _addRowContent];
  v16 = [(UserProfileCollectionViewController *)self collectionView];
  v17 = +[NSIndexSet indexSetWithIndex:0];
  [v16 reloadSections:v17];
}

- (void)countryConfigurationDidChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(UserProfileCollectionViewController *)self _addRowContent];
  id v4 = [(UserProfileCollectionViewController *)self collectionView];
  [v4 reloadData];
}

- (id)_generateAvailableActionsForAnalytics
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_userProfilePersonalizationSections;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) integerValue] - 1;
        if (v9 <= 6) {
          [v3 addObject:(&off_10131C930)[v9]];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_captureAvailableActions:(id)a3
{
  id v6 = a3;
  id v3 = +[UserInformationManager sharedInstance];
  unsigned __int8 v4 = [v3 loggedIn];

  if ((v4 & 1) == 0) {
    [v6 addObject:&off_1013AAD38];
  }
  id v5 = +[UserInformationManager sharedInstance];
  +[UserProfileAnalyticsManager captureAccountDidAppearWithAvailableActions:signedIntoICloud:](UserProfileAnalyticsManager, "captureAccountDidAppearWithAvailableActions:signedIntoICloud:", v6, [v5 loggedIn]);

  +[MapsAnalyticStateProvider setUserProfileAvailableActions:v6];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UserProfileContentViewDelegate)contentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewDelegate);

  return (UserProfileContentViewDelegate *)WeakRetained;
}

- (void)setContentViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewDelegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_linkDictionaryByType, 0);
  objc_storeStrong((id *)&self->_userProfilePersonalizationSections, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end