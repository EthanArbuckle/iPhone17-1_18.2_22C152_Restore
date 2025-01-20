@interface NEKPreferencesObserver
- (BOOL)alertInviteeDeclines;
- (BOOL)handleDarwinNotificationOfName:(id)a3;
- (BOOL)showDeclinedEvents;
- (NEKPreferencesObserver)init;
- (void)_broadcastBool:(BOOL)a3 forKey:(id)a4;
- (void)migratePrefsIfNecessary;
- (void)rebroadcastAlertInviteeDeclinesChangeNotification;
- (void)rebroadcastAllObservedNotifications;
- (void)rebroadcastShowDeclinedChangeNotification;
@end

@implementation NEKPreferencesObserver

- (NEKPreferencesObserver)init
{
  v21.receiver = self;
  v21.super_class = (Class)NEKPreferencesObserver;
  v2 = [(NEKPreferencesObserver *)&v21 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.NanoCalendar", "preferences_observer");
    prefObserverLog = v2->_prefObserverLog;
    v2->_prefObserverLog = (OS_os_log *)v3;

    uint64_t v5 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v5;

    v7 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.mobilecal"];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v7;

    v9 = +[NSMutableDictionary dictionary];
    v10 = +[NSSet setWithObjects:@"LastDeselectedCalendarSyncHashes", @"LastDeselectedCalendarSyncIdentifiers", 0];
    [v9 setObject:v10 forKeyedSubscript:@"LastDeselectedCalendarSyncHashes"];

    v11 = +[NSSet setWithObjects:kCalTimeZonePrefAutoKey, kCalTimeZonePrefKey, kCalTimeZonePrefChosenKey, @"TimeZoneCityArray", 0];
    [v9 setObject:v11 forKeyedSubscript:@"kCalTimeZonePrefChangedDistributedNotification"];

    v12 = +[NSSet setWithObject:@"overlayCalendarID"];
    [v9 setObject:v12 forKeyedSubscript:@"overlayCalendarID"];

    v13 = +[NSSet setWithObjects:@"DefaultTimedAlarmOffset", @"DefaultAllDayAlarmOffset", 0];
    [v9 setObject:v13 forKeyedSubscript:@"com.apple.calendar.defaultAlarmChangedNotification"];

    v14 = +[NSSet setWithObject:@"ShowWeekNumbers"];
    [v9 setObject:v14 forKeyedSubscript:@"com.apple.mobilecal.preference.notification.showweeknumbers"];

    v15 = +[NSSet setWithObject:@"enableTravelAdvisoriesForAutomaticBehavior"];
    [v9 setObject:v15 forKeyedSubscript:@"com.apple.calendar.database.preference.notification.enableTravelAdvisoriesForAutomaticBehavior"];

    v16 = (NSDictionary *)[v9 copy];
    keysToDirectMirrorCompanionToGizmo = v2->_keysToDirectMirrorCompanionToGizmo;
    v2->_keysToDirectMirrorCompanionToGizmo = v16;

    uint64_t v18 = +[EKPreferences shared];
    ekPrefs = v2->_ekPrefs;
    v2->_ekPrefs = (EKPreferences *)v18;

    [(NEKPreferencesObserver *)v2 migratePrefsIfNecessary];
  }
  return v2;
}

- (void)migratePrefsIfNecessary
{
  if ((sub_1000176EC() & 1) == 0)
  {
    id v3 = [(NPSDomainAccessor *)self->_domainAccessor integerForKey:@"com.apple.NanoCalendar.PrefSync.PrefMigrationSeed"];
    if (v3 != (id)2)
    {
      uint64_t v4 = (uint64_t)v3;
      prefObserverLog = self->_prefObserverLog;
      if (os_log_type_enabled(prefObserverLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134218240;
        uint64_t v12 = v4;
        __int16 v13 = 2048;
        uint64_t v14 = 2;
        _os_log_impl((void *)&_mh_execute_header, prefObserverLog, OS_LOG_TYPE_DEFAULT, "Migrated prefs; version %zd -> %zd",
          (uint8_t *)&v11,
          0x16u);
      }
      if (v4 <= 0)
      {
        npsManager = self->_npsManager;
        v7 = [(NSDictionary *)self->_keysToDirectMirrorCompanionToGizmo objectForKeyedSubscript:@"com.apple.calendar.database.preference.notification.enableTravelAdvisoriesForAutomaticBehavior"];
        [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.mobilecal" keys:v7];
      }
      else if (v4 != 1)
      {
        goto LABEL_10;
      }
      v8 = self->_npsManager;
      v9 = +[NSSet setWithObject:@"icaluuid"];
      [(NPSManager *)v8 synchronizeUserDefaultsDomain:@"com.apple.calaccessd" keys:v9];

LABEL_10:
      [(NPSDomainAccessor *)self->_domainAccessor setInteger:2 forKey:@"com.apple.NanoCalendar.PrefSync.PrefMigrationSeed"];
      id v10 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
    }
  }
}

- (void)rebroadcastAlertInviteeDeclinesChangeNotification
{
  [(NEKPreferencesObserver *)self _broadcastBool:[(EKPreferences *)self->_ekPrefs alertInviteeDeclines] forKey:@"InviteeDeclineAlerts-rebroadcast"];
  prefObserverLog = self->_prefObserverLog;
  if (os_log_type_enabled(prefObserverLog, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"InviteeDeclineAlerts-rebroadcast";
    _os_log_impl((void *)&_mh_execute_header, prefObserverLog, OS_LOG_TYPE_DEFAULT, "Rebroadcast pref for key %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)rebroadcastShowDeclinedChangeNotification
{
  [(NEKPreferencesObserver *)self _broadcastBool:[(EKPreferences *)self->_ekPrefs showDeclinedEvents] forKey:@"ShowDeclinedEvents-rebroadcast"];
  prefObserverLog = self->_prefObserverLog;
  if (os_log_type_enabled(prefObserverLog, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"ShowDeclinedEvents-rebroadcast";
    _os_log_impl((void *)&_mh_execute_header, prefObserverLog, OS_LOG_TYPE_DEFAULT, "Rebroadcast pref for key %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)rebroadcastAllObservedNotifications
{
  [(NEKPreferencesObserver *)self rebroadcastShowDeclinedChangeNotification];

  [(NEKPreferencesObserver *)self rebroadcastAlertInviteeDeclinesChangeNotification];
}

- (void)_broadcastBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  domainAccessor = self->_domainAccessor;
  id v7 = a4;
  [(NPSDomainAccessor *)domainAccessor setBool:v4 forKey:v7];
  id v8 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  npsManager = self->_npsManager;
  id v10 = +[NSSet setWithObject:v7];

  [(NPSManager *)npsManager synchronizeNanoDomain:@"com.apple.mobilecal" keys:v10];
}

- (BOOL)alertInviteeDeclines
{
  char v5 = 0;
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  BOOL result = [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:@"InviteeDeclineAlerts-rebroadcast" keyExistsAndHasValidFormat:&v5];
  if (!v5) {
    return 0;
  }
  return result;
}

- (BOOL)showDeclinedEvents
{
  char v5 = 0;
  id v3 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  BOOL result = [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:@"ShowDeclinedEvents-rebroadcast" keyExistsAndHasValidFormat:&v5];
  if (!v5) {
    return 0;
  }
  return result;
}

- (BOOL)handleDarwinNotificationOfName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!sub_1000176EC())
  {
    if ([v4 isEqualToString:@"CalEventDeclineEventPrefChanged"])
    {
      [(NEKPreferencesObserver *)self rebroadcastShowDeclinedChangeNotification];
    }
    else
    {
      if (![v4 isEqualToString:@"CalEventShowInviteeDeclinesPrefChanged"])
      {
        objc_initWeak(&location, self);
        keysToDirectMirrorCompanionToGizmo = self->_keysToDirectMirrorCompanionToGizmo;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1000273F4;
        v8[3] = &unk_1000A9268;
        objc_copyWeak(&v11, &location);
        id v9 = v4;
        id v10 = &v13;
        [(NSDictionary *)keysToDirectMirrorCompanionToGizmo enumerateKeysAndObjectsUsingBlock:v8];

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
      [(NEKPreferencesObserver *)self rebroadcastAlertInviteeDeclinesChangeNotification];
    }
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"CalEventDeclineEventPrefChangedRebroadcast"])
  {
    [(NEKPreferencesObserver *)self applyRebroadcastShowDeclinedEvents];
LABEL_10:
    *((unsigned char *)v14 + 24) = 1;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"CalEventShowInviteeDeclinesPrefChangedRebroadcast"])
  {
    [(NEKPreferencesObserver *)self applyRebroadcastAlertInviteeDeclines];
    goto LABEL_10;
  }
LABEL_11:
  char v5 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekPrefs, 0);
  objc_storeStrong((id *)&self->_keysToDirectMirrorCompanionToGizmo, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);

  objc_storeStrong((id *)&self->_prefObserverLog, 0);
}

@end