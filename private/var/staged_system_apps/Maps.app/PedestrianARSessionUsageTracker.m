@interface PedestrianARSessionUsageTracker
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (PedestrianARSessionUsageTracker)sharedInstance;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)hasARElementRendered;
- (BOOL)hasAREverLocalized;
- (BOOL)hasAREverLocalizedForRoute:(id)a3;
- (BOOL)hasUserEnteredAR;
- (BOOL)hasUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4;
- (NSMutableDictionary)enteredEntryPointToRouteIDs;
- (NSMutableSet)localizedRouteIDs;
- (PedestrianARSessionUsageTracker)init;
- (int64_t)numberOfTimesARLocalized;
- (void)clearARElementRenderedFlag;
- (void)clearARLocalizationsFlag;
- (void)clearAll;
- (void)clearUserEnteredARFlag;
- (void)migrateUsageFromRoute:(id)a3 toRoute:(id)a4;
- (void)registerARElementRendered;
- (void)registerLocalizationSuccessForRoute:(id)a3;
- (void)registerUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4;
- (void)setEnteredEntryPointToRouteIDs:(id)a3;
- (void)setLocalizedRouteIDs:(id)a3;
- (void)setNumberOfTimesARLocalized:(int64_t)a3;
@end

@implementation PedestrianARSessionUsageTracker

- (PedestrianARSessionUsageTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)PedestrianARSessionUsageTracker;
  v2 = [(PedestrianARSessionUsageTracker *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    enteredEntryPointToRouteIDs = v2->_enteredEntryPointToRouteIDs;
    v2->_enteredEntryPointToRouteIDs = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableSet set];
    localizedRouteIDs = v2->_localizedRouteIDs;
    v2->_localizedRouteIDs = (NSMutableSet *)v5;

    v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v8 = [v7 BOOLForKey:@"kPedestrianARSessionUsageLocalizationSuccessKey"];

    if (v8)
    {
      v9 = +[NSUserDefaults standardUserDefaults];
      [v9 removeObjectForKey:@"kPedestrianARSessionUsageLocalizationSuccessKey"];

      [(PedestrianARSessionUsageTracker *)v2 setNumberOfTimesARLocalized:(char *)[(PedestrianARSessionUsageTracker *)v2 numberOfTimesARLocalized] + 1];
    }
  }
  return v2;
}

+ (PedestrianARSessionUsageTracker)sharedInstance
{
  if (qword_101611180 != -1) {
    dispatch_once(&qword_101611180, &stru_101323268);
  }
  v2 = (void *)qword_101611178;

  return (PedestrianARSessionUsageTracker *)v2;
}

- (BOOL)hasUserEnteredAR
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"kPedestrianARSessionUsageARWasEnteredKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAREverLocalized
{
  return [(PedestrianARSessionUsageTracker *)self numberOfTimesARLocalized] > 0;
}

- (int64_t)numberOfTimesARLocalized
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"kPedestrianARSessionUsageLocalizationSuccessCountKey"];

  return (int64_t)v3;
}

- (void)setNumberOfTimesARLocalized:(int64_t)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a3 forKey:@"kPedestrianARSessionUsageLocalizationSuccessCountKey"];
}

- (BOOL)hasARElementRendered
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kPedestrianARSessionUsageARElementRenderedKey"];

  return v3;
}

- (void)registerUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4
{
  id v6 = a3;
  v7 = sub_100D705BC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering user entered AR for route: %@", (uint8_t *)&v21, 0xCu);
  }

  unsigned int v8 = self;
  objc_sync_enter(v8);
  v9 = [(PedestrianARSessionUsageTracker *)v8 enteredEntryPointToRouteIDs];
  v10 = +[NSNumber numberWithInteger:a4];
  objc_super v11 = [v9 objectForKey:v10];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSMutableSet set];
  }
  v14 = v13;

  [v14 addObject:v6];
  v15 = [(PedestrianARSessionUsageTracker *)v8 enteredEntryPointToRouteIDs];
  v16 = +[NSNumber numberWithInteger:a4];
  [v15 setObject:v14 forKey:v16];

  objc_sync_exit(v8);
  v17 = NSStringFromSelector("hasUserEnteredAR");
  [(PedestrianARSessionUsageTracker *)v8 willChangeValueForKey:v17];

  v18 = +[NSUserDefaults standardUserDefaults];
  v19 = +[NSDate date];
  [v18 setObject:v19 forKey:@"kPedestrianARSessionUsageARWasEnteredKey"];

  v20 = NSStringFromSelector("hasUserEnteredAR");
  [(PedestrianARSessionUsageTracker *)v8 didChangeValueForKey:v20];
}

- (BOOL)hasUserEnteredARForRoute:(id)a3 entryPoint:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  unsigned int v8 = [(PedestrianARSessionUsageTracker *)v7 enteredEntryPointToRouteIDs];
  v9 = +[NSNumber numberWithInteger:a4];
  v10 = [v8 objectForKey:v9];
  unsigned __int8 v11 = [v10 containsObject:v6];

  objc_sync_exit(v7);
  return v11;
}

- (void)registerLocalizationSuccessForRoute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100D705BC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registering localization success for route: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = NSStringFromSelector("numberOfTimesARLocalized");
  [(PedestrianARSessionUsageTracker *)self willChangeValueForKey:v6];

  v7 = self;
  objc_sync_enter(v7);
  unsigned int v8 = [(PedestrianARSessionUsageTracker *)v7 localizedRouteIDs];
  [v8 addObject:v4];

  [(PedestrianARSessionUsageTracker *)v7 setNumberOfTimesARLocalized:(char *)[(PedestrianARSessionUsageTracker *)v7 numberOfTimesARLocalized] + 1];
  objc_sync_exit(v7);

  v9 = NSStringFromSelector("numberOfTimesARLocalized");
  [(PedestrianARSessionUsageTracker *)v7 didChangeValueForKey:v9];
}

- (BOOL)hasAREverLocalizedForRoute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PedestrianARSessionUsageTracker *)v5 localizedRouteIDs];
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)registerARElementRendered
{
  unsigned __int8 v3 = sub_100D705BC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Registering AR element rendered", v7, 2u);
  }

  id v4 = NSStringFromSelector("hasARElementRendered");
  [(PedestrianARSessionUsageTracker *)self willChangeValueForKey:v4];

  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:1 forKey:@"kPedestrianARSessionUsageARElementRenderedKey"];

  id v6 = NSStringFromSelector("hasARElementRendered");
  [(PedestrianARSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (void)migrateUsageFromRoute:(id)a3 toRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = sub_100D705BC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Migrating usage flags from %@ to %@", (uint8_t *)&v26, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  int v10 = [(PedestrianARSessionUsageTracker *)v9 localizedRouteIDs];
  unsigned int v11 = [v10 containsObject:v6];

  if (v11)
  {
    v12 = sub_100D705BC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Migrating localized flag", (uint8_t *)&v26, 2u);
    }

    id v13 = [(PedestrianARSessionUsageTracker *)v9 localizedRouteIDs];
    [v13 addObject:v7];
  }
  v14 = [(PedestrianARSessionUsageTracker *)v9 enteredEntryPointToRouteIDs];
  v15 = [v14 objectForKey:&off_1013AB800];
  unsigned int v16 = [v15 containsObject:v6];

  if (v16)
  {
    v17 = sub_100D705BC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Migrating route planning entry flag", (uint8_t *)&v26, 2u);
    }

    v18 = [(PedestrianARSessionUsageTracker *)v9 enteredEntryPointToRouteIDs];
    v19 = [v18 objectForKey:&off_1013AB800];
    [v19 addObject:v7];
  }
  v20 = [(PedestrianARSessionUsageTracker *)v9 enteredEntryPointToRouteIDs];
  int v21 = [v20 objectForKey:&off_1013AB818];
  unsigned int v22 = [v21 containsObject:v6];

  if (v22)
  {
    v23 = sub_100D705BC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Migrating navigation entry flag", (uint8_t *)&v26, 2u);
    }

    v24 = [(PedestrianARSessionUsageTracker *)v9 enteredEntryPointToRouteIDs];
    v25 = [v24 objectForKey:&off_1013AB818];
    [v25 addObject:v7];
  }
  objc_sync_exit(v9);
}

- (void)clearAll
{
  [(PedestrianARSessionUsageTracker *)self clearUserEnteredARFlag];
  [(PedestrianARSessionUsageTracker *)self clearARLocalizationsFlag];

  [(PedestrianARSessionUsageTracker *)self clearARElementRenderedFlag];
}

- (void)clearUserEnteredARFlag
{
  unsigned __int8 v3 = sub_100D705BC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing user entered AR flag", v9, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(PedestrianARSessionUsageTracker *)v4 enteredEntryPointToRouteIDs];
  [v5 removeAllObjects];

  objc_sync_exit(v4);
  id v6 = NSStringFromSelector("hasUserEnteredAR");
  [(PedestrianARSessionUsageTracker *)v4 willChangeValueForKey:v6];

  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 removeObjectForKey:@"kPedestrianARSessionUsageARWasEnteredKey"];

  unsigned int v8 = NSStringFromSelector("hasUserEnteredAR");
  [(PedestrianARSessionUsageTracker *)v4 didChangeValueForKey:v8];
}

- (void)clearARLocalizationsFlag
{
  unsigned __int8 v3 = sub_100D705BC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing AR localizations flag", v9, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(PedestrianARSessionUsageTracker *)v4 localizedRouteIDs];
  [v5 removeAllObjects];

  objc_sync_exit(v4);
  id v6 = NSStringFromSelector("hasAREverLocalized");
  [(PedestrianARSessionUsageTracker *)v4 willChangeValueForKey:v6];

  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 removeObjectForKey:@"kPedestrianARSessionUsageLocalizationSuccessCountKey"];

  unsigned int v8 = NSStringFromSelector("hasAREverLocalized");
  [(PedestrianARSessionUsageTracker *)v4 didChangeValueForKey:v8];
}

- (void)clearARElementRenderedFlag
{
  unsigned __int8 v3 = sub_100D705BC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing user entered VLF flag", v7, 2u);
  }

  id v4 = NSStringFromSelector("hasARElementRendered");
  [(PedestrianARSessionUsageTracker *)self willChangeValueForKey:v4];

  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kPedestrianARSessionUsageARElementRenderedKey"];

  id v6 = NSStringFromSelector("hasARElementRendered");
  [(PedestrianARSessionUsageTracker *)self didChangeValueForKey:v6];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector("hasUserEnteredAR");
  if ([v4 isEqualToString:v5]) {
    goto LABEL_4;
  }
  id v6 = NSStringFromSelector("numberOfTimesARLocalized");
  if ([v4 isEqualToString:v6])
  {

LABEL_4:
LABEL_5:
    unsigned __int8 v7 = 0;
    goto LABEL_6;
  }
  v9 = NSStringFromSelector("hasARElementRendered");
  unsigned __int8 v10 = [v4 isEqualToString:v9];

  if (v10) {
    goto LABEL_5;
  }
  unsigned int v11 = NSStringFromSelector("hasAREverLocalized");
  unsigned __int8 v12 = [v4 isEqualToString:v11];

  if (v12)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___PedestrianARSessionUsageTracker;
    unsigned __int8 v7 = [super automaticallyNotifiesObserversForKey:v4];
  }
LABEL_6:

  return v7;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector("hasAREverLocalized");
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned __int8 v7 = NSStringFromSelector("numberOfTimesARLocalized");
    unsigned int v8 = +[NSSet setWithObject:v7];
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PedestrianARSessionUsageTracker;
    unsigned int v8 = [super keyPathsForValuesAffectingValueForKey:v4];
  }

  return v8;
}

- (NSMutableDictionary)enteredEntryPointToRouteIDs
{
  return self->_enteredEntryPointToRouteIDs;
}

- (void)setEnteredEntryPointToRouteIDs:(id)a3
{
}

- (NSMutableSet)localizedRouteIDs
{
  return self->_localizedRouteIDs;
}

- (void)setLocalizedRouteIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedRouteIDs, 0);

  objc_storeStrong((id *)&self->_enteredEntryPointToRouteIDs, 0);
}

@end