@interface CHPKPersistentAnalyticsController
+ (id)sharedInstance;
+ (id)userModelDataStorePath;
+ (void)registerScheduledEventsActivity;
- (BOOL)cachedSettingsBoolForKey:(id)a3 userModel:(id)a4;
- (BOOL)inputModeIdentifierIsValid:(id)a3;
- (CHPKPersistentAnalyticsController)init;
- (CHPKPersistentAnalyticsSessionDelegate)sessionDelegate;
- (id)durableCounterKeys;
- (id)newContextForAnalyticsWithUserModel:(id)a3 language:(id)a4;
- (id)settingsDictionary;
- (void)didBeginInputSession;
- (void)didEndInputSessionUsingScribbleWithInputMode:(id)a3;
- (void)didEndInputSessionWithInputMode:(id)a3;
- (void)didEndPKCanvasSession:(id)a3 withInputMode:(id)a4;
- (void)dispatchDailyUsageEvents;
- (void)dispatchLifecycleEventForFeature:(id)a3 denominatorKey:(id)a4 inputModeIdentifier:(id)a5 values:(id)a6 sinceDate:(id)a7;
- (void)dispatchLifecycleEvents;
- (void)dispatchScheduledEventsWithCompletionBlock:(id)a3;
- (void)dispatchSettingsEvents;
- (void)setSessionDelegate:(id)a3;
- (void)test_dispatchDailyEvent;
@end

@implementation CHPKPersistentAnalyticsController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003EB4;
  block[3] = &unk_100024828;
  block[4] = a1;
  if (qword_10002B0C8 == -1)
  {
    v2 = (void *)qword_10002B0C0;
  }
  else
  {
    dispatch_once(&qword_10002B0C8, block);
    v2 = (void *)qword_10002B0C0;
  }
  return v2;
}

- (CHPKPersistentAnalyticsController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CHPKPersistentAnalyticsController;
  v2 = [(CHPKPersistentAnalyticsController *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.handwritingd.analytics.scheduledEventsWorkerQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = [(id)objc_opt_class() userModelDataStorePath];
    uint64_t v8 = +[TIUserModelDataStore initializeDataStoreAtPath:v7];
    dataStore = v2->_dataStore;
    v2->_dataStore = (TIUserModelDataStore *)v8;
  }
  return v2;
}

+ (id)userModelDataStorePath
{
  v2 = TI_USER_DIRECTORY();
  v3 = [v2 stringByAppendingPathComponent:@"Handwriting"];

  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v6 = +[NSFileManager defaultManager];
    id v11 = 0;
    [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v7 = v11;

    if (v7)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      uint64_t v8 = (id)qword_10002B158;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to create directory for user store. %@", buf, 0xCu);
      }
    }
  }
  v9 = [v3 stringByAppendingPathComponent:@"TIUserData"];

  return v9;
}

+ (void)registerScheduledEventsActivity
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v3 = (id)qword_10002B158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v6 = @"com.apple.handwritingd.analytics.scheduledEventsActivity";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Preparing for %@ activity", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004298;
  handler[3] = &unk_1000248B8;
  handler[4] = a1;
  xpc_activity_register((const char *)[@"com.apple.handwritingd.analytics.scheduledEventsActivity" UTF8String], XPC_ACTIVITY_CHECK_IN, handler);
}

- (id)settingsDictionary
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  v3 = +[NSUserDefaults standardUserDefaults];
  v30[0] = @"PKLastSeenWhatsNewVersionKey";
  v30[1] = @"UIPencilOnlyDrawWithPencilKey";
  v31[0] = v2;
  v31[1] = v2;
  v30[2] = @"UIPencilPreferredTapAction";
  v30[3] = @"ApplePencilTextInputEnabled";
  v31[2] = v2;
  v31[3] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100004D08;
  v28[3] = &unk_1000248E0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v28];
  CFStringRef v6 = +[CHTextInputProtoSettings sharedSettings];
  unint64_t v7 = (unint64_t)[v6 isScribbleActive];

  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  v9 = [v8 objectForKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];

  if (v9)
  {
    unint64_t v10 = (unint64_t)[v9 BOOLValue];
  }
  else
  {
    v27 = v3;
    unsigned int v26 = v7;
    if (_os_feature_enabled_impl())
    {
      id v11 = [&off_100026078 arrayByAddingObjectsFromArray:&off_100026090];
    }
    else
    {
      id v11 = &off_100026078;
    }
    v12 = +[NSLocale _deviceLanguage];
    v32 = v12;
    id v13 = +[NSArray arrayWithObjects:&v32 count:1];
    v14 = +[NSLocale matchedLanguagesFromAvailableLanguages:v11 forPreferredLanguages:v13];

    unint64_t v10 = [v14 count] != 0;
    v3 = v27;
    unint64_t v7 = v26;
  }

  if (_os_feature_enabled_impl())
  {
    v15 = [&off_100026078 arrayByAddingObjectsFromArray:&off_100026090];
  }
  else
  {
    v15 = &off_100026078;
  }
  v16 = +[NSLocale _deviceLanguage];
  v32 = v16;
  v17 = +[NSArray arrayWithObjects:&v32 count:1];
  v18 = +[NSLocale matchedLanguagesFromAvailableLanguages:v15 forPreferredLanguages:v17];

  BOOL v19 = [v18 count] != 0;
  BOOL v20 = (uint64_t)[v2 integerForKey:@"PKLastSeenWhatsNewVersionKey"] > 1;
  v21 = +[NSNumber numberWithBool:v7];
  [v5 setObject:v21 forKey:@"ApplePencilTextInputActive"];

  v22 = +[NSNumber numberWithBool:v20];
  [v5 setObject:v22 forKey:@"PencilAttachedForCurrentWhatsNewVersion"];

  v23 = +[NSNumber numberWithBool:v10];
  [v5 setObject:v23 forKey:@"LiveTextEnabledKey"];

  v24 = +[NSNumber numberWithBool:v19];
  [v5 setObject:v24 forKey:@"LiveTextSupportedByPrimaryLanguageKey"];

  return v5;
}

- (id)durableCounterKeys
{
  return &__NSArray0__struct;
}

- (BOOL)cachedSettingsBoolForKey:(id)a3 userModel:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = [a4 cachedSettingsDictionary];
  unint64_t v7 = [v6 objectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = [v7 BOOLValue];

    return v8;
  }
  else
  {

    return 0;
  }
}

- (id)newContextForAnalyticsWithUserModel:(id)a3 language:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [CHPKAnalyticsMetricsContext alloc];
  v9 = TIInputModeGetLanguage();
  unint64_t v10 = TIInputModeGetRegion();

  id v11 = [(CHPKAnalyticsMetricsContext *)v8 initWithInputLanguage:v9 inputRegion:v10];
  [(CHPKAnalyticsMetricsContext *)v11 setFingerDrawingEnabled:[(CHPKPersistentAnalyticsController *)self cachedSettingsBoolForKey:@"UIPencilOnlyDrawWithPencilKey" userModel:v7]];
  BOOL v12 = [(CHPKPersistentAnalyticsController *)self cachedSettingsBoolForKey:@"ApplePencilTextInputEnabled" userModel:v7];

  [(CHPKAnalyticsMetricsContext *)v11 setScribbleEnabled:v12];
  return v11;
}

- (void)dispatchScheduledEventsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004FA8;
  v7[3] = &unk_100024908;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)dispatchSettingsEvents
{
  id v2 = [@"com.apple.pencilkit." stringByAppendingString:@"scheduled.settings"];
  AnalyticsSendEventLazy();
}

- (void)dispatchDailyUsageEvents
{
  v35[0] = CHPKStrokesDrawnKey;
  v35[1] = CHPKSmartSelectionUsedKey;
  v36[0] = &off_100025EA0;
  v36[1] = &off_100025EA0;
  v35[2] = CHPKCopyAsTextUsedKey;
  v35[3] = CHPKSmartShapesUsedKey;
  v36[2] = &off_100025EA0;
  v36[3] = &off_100025EA0;
  v35[4] = CHPKInsertSpaceUsedKey;
  v35[5] = CHPKDataDetectorUsedKey;
  v36[4] = &off_100025EA0;
  v36[5] = &off_100025EA0;
  v35[6] = CHPKTextLineStraighteningUsedKey;
  v36[6] = &off_100025EA0;
  v3 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];
  id v4 = [v3 mutableCopy];
  v17 = self;
  [(TIUserModelDataStore *)self->_dataStore getAllKnownInputModes];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v5;
        id v7 = [objc_alloc((Class)TIUserModel) initWithInputMode:*(void *)(*((void *)&v29 + 1) + 8 * v5) userModelDataStore:v17->_dataStore];
        [v7 setConfigurationDelegate:v17];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = [v7 contexts];
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [v7 valuesFromContext:*(void *)(*((void *)&v25 + 1) + 8 * i)];
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_100005460;
              v21[3] = &unk_100024958;
              id v22 = v13;
              id v23 = v7;
              id v24 = v4;
              id v14 = v13;
              [v3 enumerateKeysAndObjectsUsingBlock:v21];
            }
            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        id v6 = [@"com.apple.pencilkit." stringByAppendingString:@"scheduled.dailyUsage"];
        id v20 = v4;
        AnalyticsSendEventLazy();

        uint64_t v5 = v19 + 1;
      }
      while ((id)(v19 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)dispatchLifecycleEvents
{
  CFStringRef v31 = @"scribbledInSession";
  CFStringRef v32 = @"totalSessions";
  v3 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [(TIUserModelDataStore *)self->_dataStore getAllKnownInputModes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * v4);
        id v6 = [objc_alloc((Class)TIUserModel) initWithInputMode:v5 userModelDataStore:self->_dataStore];
        [v6 setConfigurationDelegate:self];
        id v7 = [v6 contexts];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              BOOL v12 = [v6 valuesFromContext:*(void *)(*((void *)&v21 + 1) + 8 * (void)v11)];
              v18[0] = _NSConcreteStackBlock;
              v18[1] = 3221225472;
              v18[2] = sub_100005808;
              v18[3] = &unk_100024980;
              v18[4] = self;
              v18[5] = v5;
              id v19 = v12;
              id v20 = v6;
              id v13 = v12;
              [v3 enumerateKeysAndObjectsUsingBlock:v18];

              uint64_t v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v17 + 1;
      }
      while ((id)(v17 + 1) != v16);
      id v16 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)dispatchLifecycleEventForFeature:(id)a3 denominatorKey:(id)a4 inputModeIdentifier:(id)a5 values:(id)a6 sinceDate:(id)a7
{
  id v11 = a5;
  v30[0] = kFeatureUsageStateInactive;
  v30[1] = kFeatureUsageStateActiveVeryLow;
  v30[2] = kFeatureUsageStateActiveLow;
  v30[3] = kFeatureUsageStateActiveMedium;
  void v30[4] = kFeatureUsageStateActiveHigh;
  v30[5] = kFeatureUsageStateActiveVeryHigh;
  v30[6] = kFeatureUsageStateActiveUnusuallyHigh;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[NSArray arrayWithObjects:v30 count:7];
  uint64_t v17 = [v13 aggregatedCountFromTransientCounterWithName:v14 forNumberOfDays:kFeatureUsageQueryTimeFrame fromLoadedDate:v12];

  id v18 = [v13 aggregatedCountFromTransientCounterWithName:v15 forNumberOfDays:kFeatureUsageQueryTimeFrame fromLoadedDate:v12];

  id v19 = kFeatureUsageStateInsufficientData;
  if (((unint64_t)[v17 integerValue] & 0x8000000000000000) == 0)
  {
    [v18 doubleValue];
    double v21 = v20;
    [v17 doubleValue];
    long long v23 = +[NSNumber numberWithDouble:v21 / v22];
    uint64_t v24 = +[TIAnalyticsUtil bucketNumber:v23 bucketThresholds:&off_100026060 bucketValues:v16];

    id v19 = (id)v24;
  }
  long long v25 = [@"com.apple.pencilkit." stringByAppendingString:@"scheduled.inputMode.scribbleUsage"];
  long long v28 = v11;
  long long v29 = v19;
  id v26 = v19;
  id v27 = v11;
  AnalyticsSendEventLazy();
}

- (BOOL)inputModeIdentifierIsValid:(id)a3
{
  v3 = +[NSLocale localeWithLocaleIdentifier:a3];
  unsigned __int8 v4 = +[CHRecognitionSession isLocaleSupported:v3];

  return v4;
}

- (void)didBeginInputSession
{
  id v2 = [(CHPKPersistentAnalyticsController *)self sessionDelegate];
  [v2 sessionDidBegin];
}

- (void)didEndInputSessionWithInputMode:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = [(CHPKPersistentAnalyticsController *)self sessionDelegate];
  [v4 sessionDidEnd];

  if ([(CHPKPersistentAnalyticsController *)self inputModeIdentifierIsValid:v7])
  {
    id v5 = [objc_alloc((Class)TIUserModel) initWithInputMode:v7 userModelDataStore:self->_dataStore];
    [v5 setConfigurationDelegate:self];
    if ([(CHPKPersistentAnalyticsController *)self cachedSettingsBoolForKey:@"PencilAttachedForCurrentWhatsNewVersion" userModel:v5])
    {
      id v6 = [(CHPKPersistentAnalyticsController *)self newContextForAnalyticsWithUserModel:v5 language:v7];
      [v5 addIntegerToTransientCounter:1 forKey:@"totalSessions" andCandidateLength:0 andContext:v6];
    }
  }
}

- (void)didEndInputSessionUsingScribbleWithInputMode:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = [(CHPKPersistentAnalyticsController *)self sessionDelegate];
  [v4 sessionDidEnd];

  if ([(CHPKPersistentAnalyticsController *)self inputModeIdentifierIsValid:v7])
  {
    id v5 = [objc_alloc((Class)TIUserModel) initWithInputMode:v7 userModelDataStore:self->_dataStore];
    [v5 setConfigurationDelegate:self];
    if ([(CHPKPersistentAnalyticsController *)self cachedSettingsBoolForKey:@"PencilAttachedForCurrentWhatsNewVersion" userModel:v5])
    {
      id v6 = [(CHPKPersistentAnalyticsController *)self newContextForAnalyticsWithUserModel:v5 language:v7];
      [v5 addIntegerToTransientCounter:1 forKey:@"scribbledInSession" andCandidateLength:0 andContext:v6];
      [v5 addIntegerToTransientCounter:1 forKey:@"totalSessions" andCandidateLength:0 andContext:v6];
    }
  }
}

- (void)didEndPKCanvasSession:(id)a3 withInputMode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)TIUserModel) initWithInputMode:v7 userModelDataStore:self->_dataStore];
  [v8 setConfigurationDelegate:self];
  id v18 = v7;
  id v9 = [(CHPKPersistentAnalyticsController *)self newContextForAnalyticsWithUserModel:v8 language:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v6 allKeys];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v6 objectForKeyedSubscript:v15];
        int v17 = [v16 intValue];

        if (v17 >= 1) {
          [v8 addIntegerToTransientCounter:1 forKey:v15 andCandidateLength:0 andContext:v9];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)test_dispatchDailyEvent
{
}

- (CHPKPersistentAnalyticsSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);

  return (CHPKPersistentAnalyticsSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end