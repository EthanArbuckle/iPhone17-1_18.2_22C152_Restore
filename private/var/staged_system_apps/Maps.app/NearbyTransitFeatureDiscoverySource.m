@interface NearbyTransitFeatureDiscoverySource
- (BOOL)_isUserEligibleForNotification;
- (BOOL)_shouldShowNearbyTransitBanner;
- (BOOL)active;
- (BOOL)hasAddedFavorite;
- (BOOL)hasDismissedNotificationRecently;
- (BOOL)hasInitialData;
- (BOOL)hasRecordedSession;
- (BOOL)hasUserIgnoredTipTooMuch;
- (BOOL)isTransitUserHere;
- (BOOL)shouldForceTransitUser;
- (BOOL)shouldShowFeature;
- (GEOObserverHashTable)observers;
- (NearbyTransitFeatureDiscoveryDataStore)dataStore;
- (NearbyTransitFeatureDiscoverySource)init;
- (NearbyTransitFeatureDiscoverySource)initWithDataStore:(id)a3;
- (id)discoveryModelWithActionHandler:(id)a3 displayHandler:(id)a4 cancelHandler:(id)a5;
- (unint64_t)_daysSinceDate:(id)a3;
- (void)_checkForExistingNearbyTransitFavorite;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)_updateIsTransitUserHere;
- (void)_updateShouldShowFeature;
- (void)dismissedTipNotification;
- (void)setActive:(BOOL)a3;
- (void)setAddedFavorite:(BOOL)a3;
- (void)setDataStore:(id)a3;
- (void)setHasInitialData:(BOOL)a3;
- (void)setRecordedSession:(BOOL)a3;
- (void)setShouldForceTransitUser:(BOOL)a3;
- (void)setShowFeature:(BOOL)a3;
- (void)setTransitUserHere:(BOOL)a3;
- (void)shortcutManagerMeCardDidChange:(id)a3;
- (void)updateFeatureAvailabilityIfNecessary;
@end

@implementation NearbyTransitFeatureDiscoverySource

- (NearbyTransitFeatureDiscoverySource)init
{
  v3 = objc_alloc_init(NearbyTransitFeatureDiscoveryDataStore);
  v4 = [(NearbyTransitFeatureDiscoverySource *)self initWithDataStore:v3];

  return v4;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    [(NearbyTransitFeatureDiscoverySource *)self updateFeatureAvailabilityIfNecessary];
    v5 = +[ShortcutManager sharedManager];
    id v6 = v5;
    if (v3)
    {
      [v5 addObserver:self];

      [(NearbyTransitFeatureDiscoverySource *)self _checkForExistingNearbyTransitFavorite];
    }
    else
    {
      [v5 removeObserver:self];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)_updateIsTransitUserHere
{
  objc_initWeak(&location, self);
  mapsSuggestionsHomeFeatureDiscoveryQueue = self->_mapsSuggestionsHomeFeatureDiscoveryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005BEF8;
  v5[3] = &unk_1012EB590;
  v5[4] = self;
  v6[1] = (id)a2;
  objc_copyWeak(v6, &location);
  dispatch_async(mapsSuggestionsHomeFeatureDiscoveryQueue, v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)updateFeatureAvailabilityIfNecessary
{
  if (self->_active)
  {
    if ([(NearbyTransitFeatureDiscoverySource *)self _isUserEligibleForNotification])
    {
      [(NearbyTransitFeatureDiscoverySource *)self _updateIsTransitUserHere];
    }
  }
  else
  {
    v4 = sub_10005C134();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      id v6 = v5;
      v7 = NSStringFromSelector(a2);
      int v8 = 138412546;
      v9 = v5;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@: Exiting early since the source is inactive", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (NearbyTransitFeatureDiscoverySource)initWithDataStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NearbyTransitFeatureDiscoverySource;
  id v6 = [(NearbyTransitFeatureDiscoverySource *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Maps.home.mapsSuggestions", v7);
    mapsSuggestionsHomeFeatureDiscoveryQueue = v6->_mapsSuggestionsHomeFeatureDiscoveryQueue;
    v6->_mapsSuggestionsHomeFeatureDiscoveryQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_dataStore, a3);
    v6->_addedFavorite = [(NearbyTransitFeatureDiscoveryDataStore *)v6->_dataStore hasUserEverAddedFavorite];
    v6->_showFeature = 0;
    v6->_hasInitialData = [(NearbyTransitFeatureDiscoveryDataStore *)v6->_dataStore hasUserEverAddedFavorite];
    __int16 v10 = +[GEOPlatform sharedPlatform];
    LODWORD(v7) = [v10 isInternalInstall];

    if (v7)
    {
      v11 = +[NSUserDefaults standardUserDefaults];
      v6->_shouldForceTransitUser = [v11 BOOLForKey:@"__internal__NearbyTransitDebugForceTransitUser"];
    }
    else
    {
      v6->_shouldForceTransitUser = 0;
    }
  }

  return v6;
}

- (void)_checkForExistingNearbyTransitFavorite
{
  BOOL v3 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  unsigned int v4 = [v3 hasUserEverAddedFavorite];

  if (v4)
  {
    [(NearbyTransitFeatureDiscoverySource *)self setAddedFavorite:1];
    [(NearbyTransitFeatureDiscoverySource *)self setHasInitialData:1];
  }
  else
  {
    id v5 = +[ShortcutManager sharedManager];
    id v6 = [v5 meCard];

    if (v6)
    {
      v7 = [v6 shortcutsForAll];
      uint64_t v9 = 0;
      __int16 v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100107ABC;
      v8[3] = &unk_1012EB568;
      v8[4] = &v9;
      [v7 enumerateObjectsUsingBlock:v8];
      [(NearbyTransitFeatureDiscoverySource *)self setAddedFavorite:*((unsigned __int8 *)v10 + 24)];
      [(NearbyTransitFeatureDiscoverySource *)self setHasInitialData:1];
      _Block_object_dispose(&v9, 8);
    }
  }
}

- (BOOL)_isUserEligibleForNotification
{
  BOOL v4 = [(NearbyTransitFeatureDiscoverySource *)self hasInitialData];
  if (v4)
  {
    id v5 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
    unsigned int v6 = [v5 hasUserEverAddedFavorite];

    if (v6)
    {
      v7 = sub_10005C134();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v8 = objc_opt_class();
        id v9 = v8;
        __int16 v10 = NSStringFromSelector(a2);
        int v15 = 138412546;
        v16 = v8;
        __int16 v17 = 2112;
        v18 = v10;
        uint64_t v11 = "%@ %@: _isUserEligibleForNotification: user either currently has or previously had the favorite";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0x16u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([(NearbyTransitFeatureDiscoverySource *)self hasDismissedNotificationRecently])
    {
      v7 = sub_10005C134();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        char v12 = objc_opt_class();
        id v9 = v12;
        __int16 v10 = NSStringFromSelector(a2);
        int v15 = 138412546;
        v16 = v12;
        __int16 v17 = 2112;
        v18 = v10;
        uint64_t v11 = "%@ %@: _isUserEligibleForNotification: tip was dismissed too recently";
        goto LABEL_11;
      }
LABEL_12:

      LOBYTE(v4) = 0;
      return v4;
    }
    if ([(NearbyTransitFeatureDiscoverySource *)self hasUserIgnoredTipTooMuch])
    {
      v7 = sub_10005C134();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_super v13 = objc_opt_class();
        id v9 = v13;
        __int16 v10 = NSStringFromSelector(a2);
        int v15 = 138412546;
        v16 = v13;
        __int16 v17 = 2112;
        v18 = v10;
        uint64_t v11 = "%@ %@: _isUserEligibleForNotification: tip has been displayed too much with no user activity";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)hasUserIgnoredTipTooMuch
{
  if ([(NearbyTransitFeatureDiscoverySource *)self hasRecordedSession]) {
    return 0;
  }
  BOOL v3 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  unsigned __int8 v4 = [v3 hasUserEverAddedFavorite];

  if (v4) {
    return 1;
  }
  unsigned int v6 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  id v7 = [v6 numberOfTimesDismissed];

  if (v7) {
    return 0;
  }
  id v9 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  id v10 = [v9 numberOfSessionsShown];

  unint64_t UInteger = GEOConfigGetUInteger();
  char v12 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  objc_super v13 = [v12 initialTipDisplayDate];

  if (v13)
  {
    unint64_t v14 = [(NearbyTransitFeatureDiscoverySource *)self _daysSinceDate:v13];
    BOOL v5 = v14 > GEOConfigGetUInteger() && (unint64_t)v10 > UInteger;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NearbyTransitFeatureDiscoveryDataStore)dataStore
{
  return self->_dataStore;
}

- (BOOL)hasRecordedSession
{
  return self->_recordedSession;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)hasDismissedNotificationRecently
{
  BOOL v3 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  id v4 = [v3 numberOfTimesDismissed];

  if (!v4) {
    return 0;
  }
  if ((unint64_t)v4 >= GEOConfigGetUInteger()) {
    return 1;
  }
  BOOL v5 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  unsigned int v6 = [v5 lastDismissedDate];

  if (v6)
  {
    unint64_t v7 = [(NearbyTransitFeatureDiscoverySource *)self _daysSinceDate:v6];
    BOOL v8 = v7 < GEOConfigGetUInteger();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldShowFeature
{
  return self->_showFeature;
}

- (BOOL)shouldForceTransitUser
{
  return self->_shouldForceTransitUser;
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
}

- (void)setTransitUserHere:(BOOL)a3
{
  if (self->_transitUserHere != a3)
  {
    self->_transitUserHere = a3;
    [(NearbyTransitFeatureDiscoverySource *)self _updateShouldShowFeature];
  }
}

- (void)setShowFeature:(BOOL)a3
{
  if (self->_showFeature != a3)
  {
    self->_showFeature = a3;
    [(NearbyTransitFeatureDiscoverySource *)self _updateAndNotifyObservers:1];
  }
}

- (void)setHasInitialData:(BOOL)a3
{
  if (self->_hasInitialData != a3)
  {
    self->_hasInitialData = a3;
    [(NearbyTransitFeatureDiscoverySource *)self _updateShouldShowFeature];
    [(NearbyTransitFeatureDiscoverySource *)self updateFeatureAvailabilityIfNecessary];
    [(NearbyTransitFeatureDiscoverySource *)self _updateAndNotifyObservers:1];
  }
}

- (void)setAddedFavorite:(BOOL)a3
{
  if (self->_addedFavorite != a3)
  {
    self->_addedFavorite = a3;
    if (a3) {
      [(NearbyTransitFeatureDiscoveryDataStore *)self->_dataStore setUserEverAddedFavorite:1];
    }
    [(NearbyTransitFeatureDiscoverySource *)self _updateShouldShowFeature];
  }
}

- (BOOL)isTransitUserHere
{
  return self->_transitUserHere;
}

- (void)_updateShouldShowFeature
{
  BOOL v3 = [(NearbyTransitFeatureDiscoverySource *)self _shouldShowNearbyTransitBanner];

  [(NearbyTransitFeatureDiscoverySource *)self setShowFeature:v3];
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active && a3) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (BOOL)_shouldShowNearbyTransitBanner
{
  BOOL v3 = [(NearbyTransitFeatureDiscoverySource *)self _isUserEligibleForNotification];
  if (v3)
  {
    if ([(NearbyTransitFeatureDiscoverySource *)self isTransitUserHere])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(NearbyTransitFeatureDiscoverySource *)self shouldForceTransitUser];
    }
  }
  return v3;
}

- (unint64_t)_daysSinceDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  BOOL v5 = +[NSDate date];
  unsigned int v6 = [v4 components:16 fromDate:v3 toDate:v5 options:0];

  uint64_t v7 = (uint64_t)[v6 day];
  if (v7 >= 0) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = -v7;
  }

  return v8;
}

- (void)dismissedTipNotification
{
  id v3 = [(NearbyTransitFeatureDiscoverySource *)self dataStore];
  [v3 userDismissedTip];

  [(NearbyTransitFeatureDiscoverySource *)self _updateShouldShowFeature];
}

- (id)discoveryModelWithActionHandler:(id)a3 displayHandler:(id)a4 cancelHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  uint64_t v11 = +[NSBundle mainBundle];
  v33 = [v11 localizedStringForKey:@"[Feature Discoverability] Nearby Transit title" value:@"localized string not found" table:0];

  char v12 = +[NSBundle mainBundle];
  v31 = [v12 localizedStringForKey:@"[Feature Discoverability]  Nearby Transit  description" value:@"localized string not found" table:0];

  LODWORD(v12) = +[LibraryUIUtilities isMyPlacesEnabled];
  objc_super v13 = +[NSBundle mainBundle];
  unint64_t v14 = v13;
  if (v12) {
    CFStringRef v15 = @"[Feature Discoverability] Nearby Transit action - pin";
  }
  else {
    CFStringRef v15 = @"[Feature Discoverability] Nearby Transit action - add to favorites";
  }
  v30 = [v13 localizedStringForKey:v15 value:@"localized string not found" table:0];

  v16 = +[GEOFeatureStyleAttributes nearbyTransitStyleAttributes];
  __int16 v17 = +[UIScreen mainScreen];
  [v17 scale];
  double v19 = v18;
  v20 = [v17 traitCollection];
  BOOL v21 = [v20 userInterfaceStyle] == (id)2;

  v22 = +[MKIconManager imageForStyle:v16 size:4 forScale:0 format:v21 nightMode:v19];
  v23 = [FeatureDiscoveryModel alloc];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100471A64;
  v40[3] = &unk_1012EB5B8;
  id v41 = v9;
  SEL v42 = a2;
  v40[4] = self;
  SEL v36 = a2;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100471B68;
  v37[3] = &unk_1012EB5B8;
  id v38 = v10;
  SEL v39 = a2;
  v37[4] = self;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100471C9C;
  v34[3] = &unk_1012EB5B8;
  v34[4] = self;
  id v35 = v32;
  id v24 = v32;
  id v25 = v10;
  id v26 = v9;
  LOBYTE(v29) = 0;
  v27 = [(FeatureDiscoveryModel *)v23 initWithImage:v22 title:v33 subtitle:v31 actionTitle:v30 actionHandler:v40 bodyTapHandler:0 displayedHandler:v37 dismissHandler:v34 disableAffordanceAfterAction:v29];

  return v27;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasAddedFavorite
{
  return self->_addedFavorite;
}

- (void)setRecordedSession:(BOOL)a3
{
  self->_recordedSession = a3;
}

- (void)setDataStore:(id)a3
{
}

- (void)setShouldForceTransitUser:(BOOL)a3
{
  self->_shouldForceTransitUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_mapsSuggestionsHomeFeatureDiscoveryQueue, 0);
}

@end