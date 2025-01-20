@interface TravelPreferencesDataSource
+ (void)registerCellsInCollectionView:(id)a3;
- (GEOCyclingUserPreferences)cyclingPreferences;
- (NSArray)sectionTitles;
- (SupplementaryElementsDataSourceDelegate)privacyDelegate;
- (TransitPreferences)transitPreferences;
- (TransitPreferencesViewControllerDataSource)transitDataSource;
- (TravelPreferencesDataSource)init;
- (UNNotificationSettings)notificationSettings;
- (double)heightOfViewAtSection:(int64_t)a3 collectionView:(id)a4;
- (id)_cyclingSectionTitle;
- (id)_directionsSectionTitle;
- (id)_distancesSectionTitle;
- (id)_drivingSectionTitle;
- (id)_ebikeSectionTitle;
- (id)_notificationsRowTitle;
- (id)_photoCreditNameValidationErrorMessage;
- (id)_photoCreditSectionTitle;
- (id)_settingsRowTitle;
- (id)_transitSectionTitle;
- (id)_walkingSectionTitle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)dealloc;
- (void)fetchPhotoCreditPreferences;
- (void)loadPreferences;
- (void)prepareContent;
- (void)privacyTextTapped;
- (void)setNotificationSettings:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setTransitDataSource:(id)a3;
- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3;
@end

@implementation TravelPreferencesDataSource

+ (void)registerCellsInCollectionView:(id)a3
{
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___TravelPreferencesDataSource;
  id v3 = a3;
  [super registerCellsInCollectionView:v3];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = _UICollectionViewListLayoutElementKindSectionHeader;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = _UICollectionViewListLayoutElementKindSectionFooter;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v3 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v11];

  uint64_t v12 = objc_opt_class();
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v3 registerClass:v12 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v14];
}

- (TravelPreferencesDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)TravelPreferencesDataSource;
  v2 = [(TravelPreferencesDataSource *)&v5 init];
  if (v2)
  {
    if (MapsFeature_IsEnabled_SydneyARP()) {
      [(TravelPreferencesDataSource *)v2 fetchPhotoCreditPreferences];
    }
    int IsEnabled_LagunaBeach = MapsFeature_IsEnabled_LagunaBeach();
    if (IsEnabled_LagunaBeach) {
      LOBYTE(IsEnabled_LagunaBeach) = GEODoesUserHaveValidAccountForMakingContributions();
    }
    v2->_lagunaBeachSupported = IsEnabled_LagunaBeach;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_countryObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_countryObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)TravelPreferencesDataSource;
  [(TravelPreferencesDataSource *)&v4 dealloc];
}

- (void)fetchPhotoCreditPreferences
{
  objc_initWeak(&location, self);
  v2 = +[UGCPhotoAttributionPreferencesManager sharedManager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005328C4;
  v3[3] = &unk_1012E7538;
  objc_copyWeak(&v4, &location);
  [v2 photoAttributionPreferencesWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)updatePhotoCreditPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void (**)(void, void))v4;
  if (self->_didChangeAttributionPreferences)
  {
    uint64_t v6 = [(TravelPreferencesDataSource *)self _photoCreditNameValidationErrorMessage];
    v7 = (void *)v6;
    if (!self->_photoCredit || v6 == 0)
    {
      uint64_t v9 = +[UGCPhotoAttributionPreferencesManager sharedManager];
      BOOL photoCredit = self->_photoCredit;
      photoCreditName = self->_photoCreditName;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100532B7C;
      v12[3] = &unk_1012EDF20;
      v13 = v5;
      [v9 updatePhotoAttributionPreferencesAttributePhotos:photoCredit attributionName:photoCreditName completion:v12];
    }
    else
    {
      v5[2](v5, v6);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)_photoCreditNameValidationErrorMessage
{
  if (![(NSString *)self->_photoCreditName length])
  {
    uint64_t v6 = +[NSBundle mainBundle];
    v11 = [v6 localizedStringForKey:@"[Photo Credit] Photo Credit no nickname included error" value:@"localized string not found" table:0];
    goto LABEL_6;
  }
  unint64_t Integer = GEOConfigGetInteger();
  unint64_t v4 = GEOConfigGetInteger();
  if ([(NSString *)self->_photoCreditName length] < Integer
    || [(NSString *)self->_photoCreditName length] > v4)
  {
    objc_super v5 = +[NSNumber numberWithInteger:Integer];
    uint64_t v6 = +[NSNumberFormatter localizedStringFromNumber:v5 numberStyle:0];

    v7 = +[NSNumber numberWithInteger:v4];
    uint64_t v8 = +[NSNumberFormatter localizedStringFromNumber:v7 numberStyle:0];

    uint64_t v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"[Photo Credit] Photo Credit name too short or long" value:@"localized string not found" table:0];

    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v6, v8);

LABEL_6:
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (void)loadPreferences
{
  id v3 = (GEOCyclingUserPreferences *)objc_alloc_init((Class)GEOCyclingUserPreferences);
  cyclingPreferences = self->_cyclingPreferences;
  self->_cyclingPreferences = v3;

  objc_super v5 = [TransitPreferences alloc];
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [(WatchSyncedPreferences *)v5 initWithDefaults:v6];

  uint64_t v8 = [[TransitPreferencesViewControllerDataSource alloc] initWithPreferences:v7 displayHints:0];
  transitDataSource = self->_transitDataSource;
  self->_transitDataSource = v8;

  v10 = +[UNUserNotificationCenter currentNotificationCenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100532FF8;
  v11[3] = &unk_1012EDF48;
  v11[4] = self;
  [v10 getNotificationSettingsWithCompletionHandler:v11];
}

- (TransitPreferences)transitPreferences
{
  return (TransitPreferences *)[(TransitPreferencesViewControllerDataSource *)self->_transitDataSource preferences];
}

- (void)prepareContent
{
  v38.receiver = self;
  v38.super_class = (Class)TravelPreferencesDataSource;
  [(PreferenceValuesDataSource *)&v38 prepareContent];
  objc_initWeak(&location, self);
  id v3 = objc_opt_new();
  [v3 addObject:&off_1013A7630];
  [v3 addObject:&off_1013A7648];
  [v3 addObject:&off_1013A7660];
  [v3 addObject:&off_1013A7678];
  unint64_t v4 = [(TravelPreferencesDataSource *)self _directionsSectionTitle];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100533624;
  v35[3] = &unk_1012EE018;
  id v26 = v3;
  id v36 = v26;
  [(PreferenceValuesDataSource *)self addSectionWithTitle:v4 content:v35];

  objc_super v5 = [(TravelPreferencesDataSource *)self _drivingSectionTitle];
  [(PreferenceValuesDataSource *)self addSectionWithTitle:v5 content:&stru_1012EE038];

  uint64_t v6 = [(TravelPreferencesDataSource *)self _walkingSectionTitle];
  [(PreferenceValuesDataSource *)self addSectionWithTitle:v6 content:&stru_1012EE0D8];

  if (!self->_countryObserver)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = +[NSOperationQueue mainQueue];
    uint64_t v9 = GEOCountryConfigurationCountryCodeDidChangeNotification;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100533FE8;
    v33[3] = &unk_1012E6730;
    objc_copyWeak(&v34, &location);
    v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v33];
    countryObserver = self->_countryObserver;
    self->_countryObserver = v10;

    objc_destroyWeak(&v34);
  }
  if (sub_10050B708())
  {
    uint64_t v12 = [(TravelPreferencesDataSource *)self _ebikeSectionTitle];
    [(PreferenceValuesDataSource *)self addSectionWithTitle:v12 content:&stru_1012EE1B8];
  }
  if (sub_10050B784())
  {
    v13 = [(TravelPreferencesDataSource *)self _cyclingSectionTitle];
    [(PreferenceValuesDataSource *)self addSectionWithTitle:v13 content:&stru_1012EE218];
  }
  id v14 = objc_loadWeakRetained(&location);
  objc_super v15 = [v14 transitDataSource];

  uint64_t v16 = (uint64_t)[v15 numberOfSections];
  if (v16 >= 1)
  {
    for (i = 0; i != (char *)v16; ++i)
    {
      id v18 = [v15 numberOfRowsInSection:i];
      v19 = [(TravelPreferencesDataSource *)self _transitSectionTitle];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1005343EC;
      v30[3] = &unk_1012EE338;
      v32[1] = v18;
      id v31 = v15;
      v32[2] = i;
      objc_copyWeak(v32, &location);
      [(PreferenceValuesDataSource *)self addSectionWithTitle:v19 content:v30];

      objc_destroyWeak(v32);
    }
  }
  if (MapsFeature_IsEnabled_SydneyARP() && self->_lagunaBeachSupported)
  {
    v20 = [(TravelPreferencesDataSource *)self _photoCreditSectionTitle];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1005349C8;
    v28[3] = &unk_1012EE3E8;
    objc_copyWeak(&v29, &location);
    v28[4] = self;
    [(PreferenceValuesDataSource *)self addSectionWithTitle:v20 content:v28];

    objc_destroyWeak(&v29);
  }
  v21 = objc_alloc_init(MapsDebugTableSection);
  v22 = [(TravelPreferencesDataSource *)self _settingsRowTitle];
  id v23 = [(MapsDebugTableSection *)v21 addButtonRowWithTitle:v22 action:&stru_1012EE408];

  v24 = [(TravelPreferencesDataSource *)self _notificationsRowTitle];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10053506C;
  v27[3] = &unk_1012E5D08;
  v27[4] = self;
  id v25 = [(MapsDebugTableSection *)v21 addButtonRowWithTitle:v24 action:v27];

  [(PreferenceValuesDataSource *)self addSection:v21];
  objc_destroyWeak(&location);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _UICollectionViewListLayoutElementKindSectionHeader;
  if ([v9 isEqualToString:_UICollectionViewListLayoutElementKindSectionHeader])
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1005356F0;
    v44[3] = &unk_1012EE430;
    uint64_t v12 = &v45;
    id v45 = v8;
    v13 = &v46;
    id v14 = v9;
    id v46 = v14;
    id v15 = v10;
    id v47 = v15;
    uint64_t v16 = objc_retainBlock(v44);
    v17 = [(PreferenceValuesDataSource *)self sectionAtIndexPath:v15];
    if ([v14 isEqualToString:v11])
    {
      id v18 = [v17 title];
      v19 = ((void (*)(void *, void *, void))v16[2])(v16, v18, 0);
    }
    else
    {
      v19 = ((void (*)(void *, void, void))v16[2])(v16, 0, 0);
    }
  }
  else
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1005357EC;
    v41[3] = &unk_1012EE458;
    uint64_t v12 = &v42;
    id v20 = v8;
    id v42 = v20;
    id v21 = v10;
    v43[0] = v21;
    v43[1] = self;
    v22 = objc_retainBlock(v41);
    if (MapsFeature_IsEnabled_SydneyARP()
      && self->_lagunaBeachSupported
      && (id v23 = (char *)[v20 numberOfSections] - 2, objc_msgSend(v21, "section") == v23))
    {
      id v40 = objc_alloc_init((Class)NSMutableParagraphStyle);
      [v40 setLineBreakMode:0];
      v48[0] = NSParagraphStyleAttributeName;
      v48[1] = NSForegroundColorAttributeName;
      v49[0] = v40;
      v24 = +[UIColor secondaryLabelColor];
      v49[1] = v24;
      v39 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

      id v25 = objc_alloc((Class)NSString);
      id v26 = +[NSBundle mainBundle];
      v27 = [v26 localizedStringForKey:@"[Travel Preferences] See how your data is managed…" value:@"localized string not found" table:0];
      id v28 = [v25 initWithString:v27];

      id v29 = +[NSBundle mainBundle];
      v30 = [v29 localizedStringForKey:@"[Travel Preferences] Get public credit by a nickname you choose for all your photos on Maps. Changes may take a few days to apply. [Link]" value:@"localized string not found" table:0];
      id v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v28);

      id v32 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v31 attributes:v39];
      id v33 = [v31 rangeOfString:v28];
      uint64_t v35 = v34;
      id v36 = +[UIColor systemBlueColor];
      id v37 = v33;
      uint64_t v12 = &v42;
      [v32 addAttribute:NSForegroundColorAttributeName value:v36 range:v37];
    }
    else
    {
      id v32 = 0;
    }
    v19 = ((void (*)(void *, id, void))v22[2])(v22, v32, 0);

    v13 = (id *)v43;
  }

  return v19;
}

- (void)privacyTextTapped
{
  id v2 = [(TravelPreferencesDataSource *)self privacyDelegate];
  [v2 didTapOnPrivacyText];
}

- (double)heightOfViewAtSection:(int64_t)a3 collectionView:(id)a4
{
  [a4 frame];
  double v7 = v6;
  id v8 = -[UserProfilePreferencesHeaderView initWithFrame:]([UserProfilePreferencesHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v9 = [(TravelPreferencesDataSource *)self _directionsSectionTitle];
  id v10 = [(TravelPreferencesDataSource *)self _drivingSectionTitle];
  uint64_t v11 = [(TravelPreferencesDataSource *)self _walkingSectionTitle];
  uint64_t v12 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, v11, 0);

  if (sub_10050B708())
  {
    v13 = [(TravelPreferencesDataSource *)self _ebikeSectionTitle];
    [v12 addObject:v13];
  }
  double height = UILayoutFittingExpandedSize.height;
  if (sub_10050B784())
  {
    id v15 = [(TravelPreferencesDataSource *)self _cyclingSectionTitle];
    [v12 addObject:v15];
  }
  uint64_t v16 = [(TravelPreferencesDataSource *)self _transitSectionTitle];
  [v12 addObject:v16];

  v17 = [(TravelPreferencesDataSource *)self _distancesSectionTitle];
  [v12 addObject:v17];

  id v18 = [(TravelPreferencesDataSource *)self _settingsRowTitle];
  [v12 addObject:v18];

  v19 = [v12 objectAtIndexedSubscript:a3];
  id v20 = [(UserProfilePreferencesHeaderView *)v8 textLabel];
  [v20 setText:v19];

  LODWORD(v21) = 1148846080;
  LODWORD(v22) = 1132068864;
  -[UserProfilePreferencesHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v7, height, v21, v22);
  double v24 = v23;

  return v24;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TravelPreferencesDataSource;
  unint64_t v4 = [(PreferenceValuesDataSource *)&v8 collectionView:a3 cellForItemAtIndexPath:a4];
  objc_super v5 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
  double v6 = [v5 backgroundColor];
  [v4 setBackgroundColor:v6];

  return v4;
}

- (id)_directionsSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Directions" value:@"localized string not found" table:0];

  return v3;
}

- (id)_drivingSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Driving" value:@"localized string not found" table:0];

  return v3;
}

- (id)_walkingSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Walking" value:@"localized string not found" table:0];

  return v3;
}

- (id)_ebikeSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] My Bike" value:@"localized string not found" table:0];

  return v3;
}

- (id)_cyclingSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Cycling" value:@"localized string not found" table:0];

  return v3;
}

- (id)_transitSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Transit" value:@"localized string not found" table:0];

  return v3;
}

- (id)_distancesSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Distances" value:@"localized string not found" table:0];

  return v3;
}

- (id)_photoCreditSectionTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Photo Credit" value:@"localized string not found" table:0];

  return v3;
}

- (id)_settingsRowTitle
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"[User Profile] Maps Settings" value:@"localized string not found" table:0];

  return v3;
}

- (id)_notificationsRowTitle
{
  uint64_t v3 = [(TravelPreferencesDataSource *)self notificationSettings];
  if (v3
    && (unint64_t v4 = (void *)v3,
        [(TravelPreferencesDataSource *)self notificationSettings],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 authorizationStatus],
        v5,
        v4,
        !v6))
  {
    double v7 = +[NSBundle mainBundle];
    objc_super v8 = v7;
    CFStringRef v9 = @"[User Profile] Enable Notifications";
  }
  else
  {
    double v7 = +[NSBundle mainBundle];
    objc_super v8 = v7;
    CFStringRef v9 = @"[User Profile] Notification Settings";
  }
  id v10 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];

  return v10;
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
}

- (SupplementaryElementsDataSourceDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  return (SupplementaryElementsDataSourceDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (GEOCyclingUserPreferences)cyclingPreferences
{
  return self->_cyclingPreferences;
}

- (TransitPreferencesViewControllerDataSource)transitDataSource
{
  return self->_transitDataSource;
}

- (void)setTransitDataSource:(id)a3
{
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_transitDataSource, 0);
  objc_storeStrong((id *)&self->_cyclingPreferences, 0);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_photoCreditName, 0);
  objc_storeStrong((id *)&self->_countryObserver, 0);

  objc_storeStrong(&self->_originalPreferences, 0);
}

@end