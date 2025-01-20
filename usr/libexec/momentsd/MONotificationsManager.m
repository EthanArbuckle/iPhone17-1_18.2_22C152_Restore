@interface MONotificationsManager
- (BOOL)_checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5;
- (BOOL)_checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:(id)a3 usingAppSchedule:(BOOL)a4;
- (BOOL)_isBundleUserInteractive:(id)a3;
- (BOOL)_isEligibleForUnscheduledNotification;
- (BOOL)_isUserInOnboardingPeriod:(BOOL)a3;
- (BOOL)_userConsentCompleted;
- (BOOL)_usingAppSchedule;
- (MOConfigurationManager)configManager;
- (MODefaultsManager)defaultsManager;
- (MOEngagementHistoryManager)engagementHistoryManager;
- (MOEventBundleManager)eventBundleManager;
- (MONotificationsManager)initWithUniverse:(id)a3;
- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence;
- (OS_dispatch_queue)queue;
- (UNUserNotificationCenter)userNotificationCenterAppBranded;
- (UNUserNotificationCenter)userNotificationCenterSystemBranded;
- (id)_getArrayScheduledDateComponents;
- (id)_getAuthorizationNotificationsError;
- (id)_getCurrentAppDefaultActionURL;
- (id)_getCurrentApplicationIcon;
- (id)_getCurrentSystemDefaultActionURL;
- (id)_getGenericNotificationErrorWithReason:(id)a3;
- (id)_getMomentsFrameworkNotAvailableNotificationsError;
- (id)_getNextNotificationDateComponentsWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6;
- (id)_getNextScheduledCalendarNotificationTrigger;
- (id)_getNextScheduledOpportunisticNotificationDate;
- (id)_getNextUnscheduledNotificationDate;
- (id)_getOnboardingNotCompleteNotificationsError;
- (id)_getOpportunisticNotificationTrigger;
- (id)_getSortedArrayScheduledDatesWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6;
- (id)_getUnscheduledNotificationTrigger;
- (id)allowedSourceTypes;
- (id)createBundleInformationForAnalyticsWithBundle:(id)a3;
- (id)getBiomeContextDictionaryWithUserInfo:(id)a3;
- (int64_t)getNotificationScheduledDeliverySetting;
- (unint64_t)_MOStatusFromUNStatus:(int64_t)a3;
- (unint64_t)getAppNotificationAuthorizationStatus;
- (unint64_t)getSystemNotificationAuthorizationStatus;
- (void)_clearAllNotifications;
- (void)_getArrayScheduledDateComponents;
- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_postNotificationWithTitle:(id)a3 message:(id)a4 defaultActionURL:(id)a5 notificationIdentifier:(id)a6 withIcon:(id)a7 usingTrigger:(id)a8 useSubordinateIcon:(BOOL)a9 userInfo:(id)a10 handler:(id)a11;
- (void)_postTimeToWriteSystemNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5 completionHandler:(id)a6;
- (void)_serviceSuggestionsNotificationsEnablingTest:(BOOL)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)_serviceSuggestionsNotificationsInternalUsingTrigger:(id)a3 useAppSchedule:(BOOL)a4 completionHandler:(id)a5;
- (void)_serviceSuggestionsNotificationsTestForBundle:(id)a3 usingTrigger:(id)a4 useAppSchedule:(BOOL)a5 completionHandler:(id)a6;
- (void)checkAuthorizationStatusForNotificationCenter:(id)a3 completion:(id)a4;
- (void)getMomentsNotificationsSchedule:(id)a3;
- (void)serviceSuggestionsNotificationsWithHandler:(id)a3;
- (void)setEventBundleManager:(id)a3;
- (void)setUserNotificationCenterAppBranded:(id)a3;
- (void)setUserNotificationCenterSystemBranded:(id)a3;
- (void)setupFallbackAppBrandedNotificationsWithDateComponents:(id)a3 handler:(id)a4;
- (void)setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5;
- (void)submitEngagementHistoryUpdateWithEvent:(id)a3 userInfo:(id)a4;
- (void)submitNotificationEngagementEventAnalyticsForBundles:(id)a3 userInfo:(id)a4 fromTrigger:(unint64_t)a5 withPostingDate:(id)a6;
- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MONotificationsManager

- (MONotificationsManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MONotificationsManager;
  v5 = [(MONotificationsManager *)&v37 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MONotificationsManager", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v4 getService:v10];
    defaultsManager = v5->_defaultsManager;
    v5->_defaultsManager = (MODefaultsManager *)v11;

    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    uint64_t v15 = [v4 getService:v14];
    configManager = v5->_configManager;
    v5->_configManager = (MOConfigurationManager *)v15;

    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    uint64_t v19 = [v4 getService:v18];
    engagementHistoryManager = v5->_engagementHistoryManager;
    v5->_engagementHistoryManager = (MOEngagementHistoryManager *)v19;

    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    uint64_t v23 = [v4 getService:v22];
    eventBundleManager = v5->_eventBundleManager;
    v5->_eventBundleManager = (MOEventBundleManager *)v23;

    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v4 getService:v26];
    onboardingAndSettingsPersistence = v5->_onboardingAndSettingsPersistence;
    v5->_onboardingAndSettingsPersistence = (MOOnboardingAndSettingsPersistence *)v27;

    v29 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.momentsd.MOUserNotifications" queue:v5->_queue];
    userNotificationCenterSystemBranded = v5->_userNotificationCenterSystemBranded;
    v5->_userNotificationCenterSystemBranded = v29;

    [(UNUserNotificationCenter *)v5->_userNotificationCenterSystemBranded setDelegate:v5];
    [(UNUserNotificationCenter *)v5->_userNotificationCenterSystemBranded setWantsNotificationResponsesDelivered];
    v31 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.momentsd.MOUserNotifications" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
    v32 = v5->_userNotificationCenterSystemBranded;
    v33 = +[NSSet setWithObject:v31];
    [(UNUserNotificationCenter *)v32 setNotificationCategories:v33];

    v34 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.journal" queue:v5->_queue];
    userNotificationCenterAppBranded = v5->_userNotificationCenterAppBranded;
    v5->_userNotificationCenterAppBranded = v34;
  }
  return v5;
}

- (BOOL)_userConsentCompleted
{
  v2 = [(MONotificationsManager *)self configManager];
  unsigned int v3 = [v2 getIntegerSettingForKey:@"OnboardingStatus" withFallback:0];

  unsigned int v4 = v3 & 0xFFFFFFFE;
  v5 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4 == 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TTW notifications allowed=%u", (uint8_t *)v7, 8u);
  }

  return v4 == 2;
}

- (id)_getAuthorizationNotificationsError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Journal App notifications not authorized";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned int v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:35 userInfo:v2];

  return v3;
}

- (id)_getMomentsFrameworkNotAvailableNotificationsError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Moments Framework not available";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned int v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:v2];

  return v3;
}

- (id)_getOnboardingNotCompleteNotificationsError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Onboarding not completed";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned int v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v2];

  return v3;
}

- (id)_getGenericNotificationErrorWithReason:(id)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  id v8 = a3;
  id v3 = a3;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  NSErrorUserInfoKey v5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:13 userInfo:v4];

  return v5;
}

- (id)_getCurrentSystemDefaultActionURL
{
  v2 = [(MONotificationsManager *)self configManager];
  id v3 = [v2 getStringSettingForKey:@"UserNotificationSystemURL" withFallback:@"moments://timetowrite"];

  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_getCurrentAppDefaultActionURL
{
  v2 = [(MONotificationsManager *)self configManager];
  id v3 = [v2 getStringSettingForKey:@"UserNotificationAppURL" withFallback:@"moments://canvas"];

  if ([v3 length]) {
    id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_usingAppSchedule
{
  v2 = [(MONotificationsManager *)self defaultsManager];
  id v3 = [v2 objectForKey:@"UserNotificationScheduleInMinutesArray"];

  BOOL v4 = v3 && [v3 count];
  return v4;
}

- (void)checkAuthorizationStatusForNotificationCenter:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke;
  v6[3] = &unk_1002CE9C8;
  id v7 = a4;
  id v5 = v7;
  [a3 getNotificationSettingsWithCompletionHandler:v6];
}

uint64_t __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t)[a2 authorizationStatus];
  BOOL v4 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 > 1, v3);
}

- (void)_serviceSuggestionsNotificationsInternalUsingTrigger:(id)a3 useAppSchedule:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(MONotificationsManager *)self userNotificationCenterSystemBranded];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke;
  v13[3] = &unk_1002CEA40;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  [(MONotificationsManager *)self checkAuthorizationStatusForNotificationCenter:v10 completion:v13];
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__21;
    v18[4] = __Block_byref_object_dispose__21;
    id v19 = (id)os_transaction_create();
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_577;
    v13[3] = &unk_1002CEA18;
    id v15 = *(id *)(a1 + 48);
    BOOL v16 = v18;
    id v5 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    char v17 = *(unsigned char *)(a1 + 56);
    id v14 = v5;
    [v3 _getNewTargetTimeToWriteEventBundlesUsingAppSchedule:v4 withCompletionHandler:v13];

    _Block_object_dispose(v18, 8);
  }
  else
  {
    [*(id *)(a1 + 32) _clearAllNotifications];
    CFStringRef v6 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_cold_1();
    }

    if (*(unsigned char *)(a1 + 56))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = +[NSDate now];
      id v9 = [v7 _getNextNotificationDateComponentsWithOptions:1 afterDate:v8 numWeeks:2 setComponents:0];

      v10 = *(void **)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_571;
      v20[3] = &unk_1002CDA18;
      id v21 = *(id *)(a1 + 48);
      [v10 setupFallbackAppBrandedNotificationsWithDateComponents:v9 handler:v20];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = [*(id *)(a1 + 32) _getGenericNotificationErrorWithReason:@"System notifications not authorized"];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }
}

uint64_t __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_571(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_577(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_577_cold_1(v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v30 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Notification eligible bundle count: %lu", buf, 0xCu);
    }

    id v11 = [v5 count];
    id v12 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v13 = *(unsigned __int8 *)(a1 + 64);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_579;
      v24[3] = &unk_1002CE9F0;
      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      id v25 = v15;
      uint64_t v26 = v16;
      [v12 _postTimeToWriteSystemNotificationUsingEventBundles:v5 withTrigger:v14 usingAppSchedule:v13 completionHandler:v24];
    }
    else
    {
      [*(id *)(a1 + 32) _clearAllNotifications];
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;

      if (*(unsigned char *)(a1 + 64))
      {
        id v19 = *(void **)(a1 + 32);
        v20 = +[NSDate now];
        id v21 = [v19 _getNextNotificationDateComponentsWithOptions:1 afterDate:v20 numWeeks:2 setComponents:0];

        v22 = *(void **)(a1 + 32);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_578;
        v27[3] = &unk_1002CDA18;
        id v28 = *(id *)(a1 + 48);
        [v22 setupFallbackAppBrandedNotificationsWithDateComponents:v21 handler:v27];
      }
      else
      {
        uint64_t v23 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "No bundles available for unscheduled notification", buf, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
}

uint64_t __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_578(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_579(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)_serviceSuggestionsNotificationsTestForBundle:(id)a3 usingTrigger:(id)a4 useAppSchedule:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(MONotificationsManager *)self userNotificationCenterSystemBranded];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __118__MONotificationsManager__serviceSuggestionsNotificationsTestForBundle_usingTrigger_useAppSchedule_completionHandler___block_invoke;
  v17[3] = &unk_1002CEA68;
  id v18 = v10;
  id v19 = self;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  [(MONotificationsManager *)self checkAuthorizationStatusForNotificationCenter:v13 completion:v17];
}

void __118__MONotificationsManager__serviceSuggestionsNotificationsTestForBundle_usingTrigger_useAppSchedule_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2 && [*(id *)(a1 + 32) count])
  {
    uint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134217984;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Got target bundle for notification (%lu new)", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _postTimeToWriteSystemNotificationUsingEventBundles:*(void *)(a1 + 32) withTrigger:*(void *)(a1 + 48) usingAppSchedule:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 40) _getGenericNotificationErrorWithReason:@"Not eligible for unscheduled notification"];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
}

- (void)_serviceSuggestionsNotificationsEnablingTest:(BOOL)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  BOOL v30 = a3;
  id v31 = a4;
  id v32 = a5;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__21;
  v46[4] = __Block_byref_object_dispose__21;
  id v47 = (id)os_transaction_create();
  id v33 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.journal" allowPlaceholder:0 error:0];
  if (v33)
  {
    unsigned int v29 = [(MONotificationsManager *)self _usingAppSchedule];
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[NSNumber numberWithBool:v29];
      *(_DWORD *)buf = 138412290;
      v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notification schedule set: %@", buf, 0xCu);
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke;
    v43[3] = &unk_1002CE9F0;
    id v27 = v32;
    id v44 = v27;
    v45 = v46;
    id v28 = objc_retainBlock(v43);
    id v8 = objc_opt_new();
    if (v30)
    {
      [v31 objectForKeyedSubscript:@"targetIdentifiers"];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v40;
        do
        {
          id v12 = 0;
          do
          {
            if (*(void *)v40 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v12);
            id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
            if (v14)
            {
              [v8 addObject:v14];
            }
            else
            {
              id v15 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v13;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Invalid targetIdentifiers item: %@", buf, 0xCu);
              }
            }
            id v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v10);
      }

      id v16 = [v31 objectForKeyedSubscript:@"ignoreAppSchedule"];
      unsigned int v17 = [v16 BOOLValue];

      id v18 = 0;
      uint64_t v19 = v29 & ~v17;
      goto LABEL_24;
    }
    if (v29)
    {
      id v18 = [(MONotificationsManager *)self _getNextScheduledCalendarNotificationTrigger];
      if (v18)
      {
        uint64_t v19 = 1;
LABEL_24:
        id v20 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[MONotificationsManager _serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:]();
        }

        if (!v30 || ![v8 count])
        {
          [(MONotificationsManager *)self _serviceSuggestionsNotificationsInternalUsingTrigger:v18 useAppSchedule:v19 completionHandler:v27];
LABEL_41:

          goto LABEL_42;
        }
        if (MomentsLibraryCore()
          && (id v21 = objc_alloc((Class)getMOPromptManagerClass()),
              uint64_t v22 = objc_opt_class(),
              (id v23 = [v21 initForSoftLinkwithMOEventClass:v22 moEventBundleClass:objc_opt_class()]) != 0))
        {
          v24 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[MONotificationsManager _serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:]();
          }

          id v25 = [[MOEventBundleFetchOptions alloc] initWithIdentifiers:v8 ascending:0 filterBundle:0];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_608;
          v35[3] = &unk_1002CEA90;
          objc_super v37 = v28;
          v35[4] = self;
          id v18 = v18;
          id v36 = v18;
          char v38 = v19;
          [v23 fetchEventBundlesWithOptions:v25 handler:v35];
        }
        else
        {
          uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", buf, 2u);
          }

          id v23 = [(MONotificationsManager *)self _getMomentsFrameworkNotAvailableNotificationsError];
          (*((void (**)(id, id))v27 + 2))(v27, v23);
        }
LABEL_40:

        goto LABEL_41;
      }
      id v23 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Failure getting next notification service time"];
      (*((void (**)(id, id))v27 + 2))(v27, v23);
    }
    else
    {
      if ([(MONotificationsManager *)self _isEligibleForUnscheduledNotification])
      {
        id v18 = [(MONotificationsManager *)self _getUnscheduledNotificationTrigger];
        uint64_t v19 = 0;
        goto LABEL_24;
      }
      id v23 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Ineligible for unscheduled notification now"];
      (*((void (**)(id, id))v27 + 2))(v27, v23);
    }
    id v18 = 0;
    goto LABEL_40;
  }
  [(MONotificationsManager *)self _clearAllNotifications];
  id v18 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Journal App not installed on device"];
  (*((void (**)(id, id))v32 + 2))(v32, v18);
LABEL_42:

  _Block_object_dispose(v46, 8);
}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_608(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_608_cold_1(v5, v6);
    }

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_609;
    v10[3] = &unk_1002CDA18;
    id v11 = *(id *)(a1 + 48);
    [v7 _serviceSuggestionsNotificationsTestForBundle:v5 usingTrigger:v8 useAppSchedule:v9 completionHandler:v10];
  }
}

uint64_t __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_609(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)serviceSuggestionsNotificationsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MONotificationsManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke;
  v7[3] = &unk_1002CCDC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userNotificationCenterSystemBranded];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_2;
  v4[3] = &unk_1002CEAB8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getDeliveredNotificationsWithCompletionHandler:v4];
}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Number of delivered notifications in NotificationCenter currently: %@", buf, 0xCu);
  }
  if ([v3 count])
  {
    id v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 request];
    id v8 = [v7 content];
    uint64_t v9 = [v8 userInfo];

    id v10 = [v9 objectForKey:@"suggestionID"];
    id v11 = [v3 objectAtIndexedSubscript:0];
    id v12 = [v11 date];

    uint64_t v13 = [*(id *)(a1 + 32) defaultsManager];
    id v14 = [v13 objectForKey:@"UserNotificationLastDeliveredID"];

    if (v10)
    {
      if (!v14 || ([v10 isEqualToString:v14] & 1) == 0)
      {
        [*(id *)(a1 + 32) submitNotificationEngagementEventAnalyticsForBundles:0 userInfo:v9 fromTrigger:2 withPostingDate:v12];
        [*(id *)(a1 + 32) submitEngagementHistoryUpdateWithEvent:@"suggestionNotificationPosted" userInfo:v9];
      }
      id v15 = [*(id *)(a1 + 32) defaultsManager];
      [v15 setObject:v10 forKey:@"UserNotificationLastDeliveredID"];
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_613;
  v17[3] = &unk_1002CDA18;
  id v16 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v16 _serviceSuggestionsNotificationsEnablingTest:0 withOptions:0 completionHandler:v17];
}

void __69__MONotificationsManager_serviceSuggestionsNotificationsWithHandler___block_invoke_613(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 localizedDescription];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "notification service complete, error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v42 = a5;
  v43 = objc_opt_new();
  id v8 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v9 = v7;
  id v39 = [v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v39)
  {
    uint64_t v10 = *(void *)v51;
    long long v41 = v9;
    uint64_t v37 = *(void *)v51;
    char v38 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v9);
        }
        uint64_t v40 = v11;
        id v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
        uint64_t v13 = [v12 hour:v37, v38];
        signed int v14 = [v13 intValue];

        id v15 = [v12 minute];
        signed int v16 = [v15 intValue];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        unsigned int v17 = [v12 weekdays];
        id v18 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v47;
          uint64_t v21 = v14;
          uint64_t v22 = v16;
          int v23 = v16 + 60 * v14 - 1440;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(v17);
              }
              id v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              uint64_t v26 = objc_opt_new();
              [v26 setWeekday:([v25 intValue]);
              [v26 setHour:v21];
              [v26 setMinute:v22];
              [v8 addObject:v26];
              uint64_t v27 = v23 + 1440 * [v25 intValue];
              if (v27 >> 5 >= 0x13B)
              {
                v34 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                  -[MONotificationsManager setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:options:handler:](v27);
                }

                NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
                CFStringRef v55 = @"Scheduled notification time out of week range.";
                v35 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
                id v36 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v35];

                id v33 = v42;
                (*((void (**)(id, void *))v42 + 2))(v42, v36);

                id v9 = v41;
                unsigned int v29 = v41;
                goto LABEL_21;
              }
              id v28 = +[NSNumber numberWithInt:v27];
              [v43 addObject:v28];
            }
            id v19 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v40 + 1;
        id v9 = v41;
        uint64_t v10 = v37;
        self = v38;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [v41 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v39);
  }

  unsigned int v29 = [v43 sortedArrayUsingSelector:"compare:"];
  BOOL v30 = [(MONotificationsManager *)self defaultsManager];
  [v30 setObject:v29 forKey:@"UserNotificationScheduleInMinutesArray"];

  [(MONotificationsManager *)self _clearAllNotifications];
  if ([v8 count])
  {
    id v31 = +[NSDate now];
    id v32 = [(MONotificationsManager *)self _getNextNotificationDateComponentsWithOptions:1 afterDate:v31 numWeeks:2 setComponents:v8];

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = __99__MONotificationsManager_setupPeriodicTimeToWriteMomentsNotificationsWithSchedule_options_handler___block_invoke;
    v44[3] = &unk_1002CDA18;
    id v33 = v42;
    id v45 = v42;
    [(MONotificationsManager *)self setupFallbackAppBrandedNotificationsWithDateComponents:v32 handler:v44];
  }
  else
  {
    id v33 = v42;
    if (v42) {
      (*((void (**)(id, void))v42 + 2))(v42, 0);
    }
  }
LABEL_21:
}

uint64_t __99__MONotificationsManager_setupPeriodicTimeToWriteMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setupFallbackAppBrandedNotificationsWithDateComponents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MONotificationsManager *)self userNotificationCenterAppBranded];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke;
  v11[3] = &unk_1002CEB08;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(MONotificationsManager *)self checkAuthorizationStatusForNotificationCenter:v8 completion:v11];
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke(id *a1, char a2)
{
  if (a2)
  {
    if (a1[5])
    {
      id v33 = objc_opt_new();
      if (MomentsLibraryCore()
        && (id v3 = objc_alloc((Class)getMOPromptManagerClass()),
            uint64_t v4 = objc_opt_class(),
            (id v5 = [v3 initForSoftLinkwithMOEventClass:v4 moEventBundleClass:objc_opt_class()]) != 0))
      {
        unsigned int v29 = v5;
        id v6 = [v5 localizedStringForKey:@"Time to Write"];
        [v33 setTitle:v6];

        id v7 = [v29 localizedStringForKey:@"Take a moment to reflect in your journal."];
        [v33 setBody:v7];

        id v8 = [a1[4] _getCurrentAppDefaultActionURL];
        [v33 setDefaultActionURL:v8];

        id v9 = +[UNNotificationSound defaultSound];
        [v33 setSound:v9];

        unsigned int v32 = [a1[5] count];
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2020000000;
        int v50 = 0;
        *(void *)v43 = 0;
        id v44 = v43;
        uint64_t v45 = 0x3032000000;
        long long v46 = __Block_byref_object_copy__21;
        long long v47 = __Block_byref_object_dispose__21;
        id v48 = 0;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id obj = a1[5];
        id v10 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
        if (v10)
        {
          uint64_t v31 = *(void *)v40;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(obj);
              }
              id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v13 = +[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:v12 repeats:0];
              signed int v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 month]);
              id v15 = [v14 stringValue];
              signed int v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 day]);
              unsigned int v17 = [v16 stringValue];
              id v18 = [v15 stringByAppendingString:v17];

              id v19 = [@"appTimeToWrite" stringByAppendingString:v18];
              uint64_t v20 = +[UNNotificationRequest requestWithIdentifier:v19 content:v33 trigger:v13];
              uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                long long v52 = v19;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "App sourced notification posted for time to write, identifer: %@", buf, 0xCu);
              }

              uint64_t v22 = [a1[4] userNotificationCenterAppBranded];
              v34[0] = _NSConcreteStackBlock;
              v34[1] = 3221225472;
              v34[2] = __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_637;
              v34[3] = &unk_1002CEAE0;
              id v36 = v49;
              uint64_t v37 = v43;
              unsigned int v38 = v32;
              id v35 = a1[6];
              [v22 addNotificationRequest:v20 withCompletionHandler:v34];
            }
            id v10 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
          }
          while (v10);
        }

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(v49, 8);
      }
      else
      {
        id v25 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", v43, 2u);
        }

        uint64_t v26 = (void (**)(id, void *))a1[6];
        unsigned int v29 = [a1[4] _getMomentsFrameworkNotAvailableNotificationsError];
        v26[2](v26, v29);
      }
    }
    else
    {
      uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_1();
      }

      id v28 = (void (**)(id, void *))a1[6];
      id v33 = [a1[4] _getGenericNotificationErrorWithReason:@"No date components set for fallback notifications"];
      v28[2](v28, v33);
    }
  }
  else
  {
    int v23 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_2();
    }

    v24 = (void (**)(id, void *))a1[6];
    id v33 = [a1[4] _getAuthorizationNotificationsError];
    v24[2](v24, v33);
  }
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_637(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v4 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_637_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  if (v8) {
    id v9 = v7;
  }
  else {
    id v9 = v3;
  }
  objc_storeStrong(v6, v9);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(_DWORD *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_getArrayScheduledDateComponents
{
  uint64_t v2 = [(MONotificationsManager *)self defaultsManager];
  id v3 = [v2 objectForKey:@"UserNotificationScheduleInMinutesArray"];

  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v3;
    id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      id v13 = v3;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          signed int v9 = [[*(id *)(*((void *)&v15 + 1) + 8 * i) intValue:v13];
          id v10 = objc_opt_new();
          [v10 setWeekday:v9 / 1440 + 1];
          unsigned int v11 = v9 % 1440 + ((-30583 * (v9 % 1440)) >> 16);
          [v10 setHour:((__int16)v11 >> 5) + ((unsigned __int16)(v11 & 0x8000) >> 15)];
          [v10 setMinute:v9 % 60];
          [v4 addObject:v10];
        }
        id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
      id v3 = v13;
    }
  }
  else
  {
    id obj = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      -[MONotificationsManager _getArrayScheduledDateComponents]();
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_getSortedArrayScheduledDatesWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6
{
  id v27 = a4;
  id v9 = a6;
  id v10 = v9;
  if (v9)
  {
    id v25 = v9;
  }
  else
  {
    id v25 = [(MONotificationsManager *)self _getArrayScheduledDateComponents];
    if (!v25)
    {
      uint64_t v22 = 0;
      goto LABEL_21;
    }
  }
  v24 = v10;
  unsigned int v11 = +[NSCalendar currentCalendar];
  id v12 = objc_opt_new();
  if (a5 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v28 = v13;
      signed int v14 = [v11 dateByAddingUnit:0x2000 value:v13 toDate:v27 options:a3];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v15 = v25;
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            if (v14)
            {
              uint64_t v20 = [v11 nextDateAfterDate:v14 matchingComponents:*(void *)(*((void *)&v29 + 1) + 8 * i) options:a3];
              if (v20)
              {
                [v12 addObject:v20];
                uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v34 = v20;
                  _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "scheduledDate, %@", buf, 0xCu);
                }
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v17);
      }

      uint64_t v13 = v28 + 1;
    }
    while (v28 + 1 != a5);
  }
  uint64_t v22 = [v12 sortedArrayUsingSelector:"compare:"];

  id v10 = v24;
LABEL_21:

  return v22;
}

- (id)_getNextUnscheduledNotificationDate
{
  id v3 = +[NSCalendar currentCalendar];
  uint64_t v4 = objc_opt_new();
  id v5 = [(MONotificationsManager *)self configManager];
  [v4 setHour:[v5 getIntegerSettingForKey:@"UserNotificationUnscheduledHour" withFallback:19]];

  id v6 = +[NSDate now];
  uint64_t v7 = [v3 nextDateAfterDate:v6 matchingComponents:v4 options:1];

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Next possible unscheduled notification time, %@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

- (id)_getNextScheduledOpportunisticNotificationDate
{
  id v3 = +[NSCalendar currentCalendar];
  uint64_t v4 = objc_opt_new();
  id v5 = [(MONotificationsManager *)self configManager];
  [v4 setHour:[v5 getIntegerSettingForKey:@"UserNotificationScheduledOpportunisticHour" withFallback:19]];

  id v6 = +[NSDate now];
  uint64_t v7 = [v3 nextDateAfterDate:v6 matchingComponents:v4 options:1];

  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Next possible opportunistic notification time, %@", (uint8_t *)&v10, 0xCu);
  }

  return v7;
}

- (id)_getUnscheduledNotificationTrigger
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MONotificationsManager *)self configManager];
  [v3 setHour:(int)[v4 getIntegerSettingForKey:@"UserNotificationUnscheduledHour" withFallback:19]];

  id v5 = +[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:v3 repeats:0];

  return v5;
}

- (id)_getOpportunisticNotificationTrigger
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MONotificationsManager *)self configManager];
  [v3 setHour:[v4 getIntegerSettingForKey:@"UserNotificationScheduledOpportunisticHour" withFallback:19]];

  id v5 = +[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:v3 repeats:0];

  return v5;
}

- (id)_getNextNotificationDateComponentsWithOptions:(unint64_t)a3 afterDate:(id)a4 numWeeks:(int64_t)a5 setComponents:(id)a6
{
  id v6 = [(MONotificationsManager *)self _getSortedArrayScheduledDatesWithOptions:a3 afterDate:a4 numWeeks:a5 setComponents:a6];
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    id v8 = objc_opt_new();
    id v9 = +[NSCalendar currentCalendar];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v16 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Next notification date: %@", buf, 0xCu);
          }

          id v17 = [v9 components:636 fromDate:v15];
          [v8 addObject:v17];
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v7 = v19;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)getMomentsNotificationsSchedule:(id)a3
{
  id v4 = a3;
  id v5 = [(MONotificationsManager *)self defaultsManager];
  id v6 = [v5 objectForKey:@"UserNotificationScheduleInMinutesArray"];

  if (v6)
  {
    long long v22 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v23 = v6;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = [[*(id *)(*((void *)&v26 + 1) + 8 * i) intValue:v22];
          if (v13 >> 5 <= 0x13A)
          {
            uint64_t v14 = (unsigned __int16)v13 / 0x5A0u + 1;
            uint64_t v15 = +[NSNumber numberWithLong:(unsigned __int16)v13 % 0x5A0u];
            id v16 = [v7 objectForKeyedSubscript:v15];
            id v17 = v16;
            if (v16)
            {
              id v18 = [v16 mutableCopy];
              id v19 = +[NSNumber numberWithInt:v14];
              [v18 addObject:v19];

              [v7 setObject:v18 forKey:v15];
            }
            else
            {
              id v18 = +[NSNumber numberWithInt:v14];
              id v30 = v18;
              long long v20 = +[NSArray arrayWithObjects:&v30 count:1];
              [v7 setObject:v20 forKey:v15];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __58__MONotificationsManager_getMomentsNotificationsSchedule___block_invoke;
    v24[3] = &unk_1002CEB30;
    id v25 = v22;
    id v21 = v22;
    [v7 enumerateKeysAndObjectsUsingBlock:v24];
    (*((void (**)(id, id, void, void))v4 + 2))(v4, v21, 0, 0);

    id v6 = v23;
  }
  else
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

void __58__MONotificationsManager_getMomentsNotificationsSchedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  signed int v6 = [a2 intValue];
  uint64_t v7 = (v6 / 60);
  uint64_t v8 = (v6 % 60);
  id v9 = [MONotificationScheduleItem alloc];
  id v10 = +[NSNumber numberWithInt:v7];
  uint64_t v11 = +[NSNumber numberWithInt:v8];
  id v12 = [(MONotificationScheduleItem *)v9 initScheduleWithHour:v10 minute:v11 weekdays:v5];

  [*(id *)(a1 + 32) addObject:v12];
}

- (BOOL)_isBundleUserInteractive:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rankingDictionary];
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = (void *)v4;
  signed int v6 = [v3 rankingDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"visibilityCategoryForUI"];

  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [v3 rankingDictionary];
  id v9 = [v8 objectForKeyedSubscript:@"visibilityCategoryForUI"];
  unsigned int v10 = [v9 unsignedIntValue];

  if (v10 - 1 > 1) {
    BOOL v11 = 0;
  }
  else {
LABEL_4:
  }
    BOOL v11 = 1;

  return v11;
}

- (BOOL)_isUserInOnboardingPeriod:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  id v5 = [(MONotificationsManager *)self configManager];
  LODWORD(v6) = 14.0;
  [v5 getFloatSettingForKey:@"UserNotificationMaximumDaysForOnboarding" withFallback:v6];
  float v8 = v7;

  id v9 = +[NSDate now];
  unsigned int v10 = [(MONotificationsManager *)self defaultsManager];
  BOOL v11 = [v10 objectForKey:@"OnboardingDate"];

  if (v11)
  {
    [v9 timeIntervalSinceDate:v11];
    BOOL v3 = v12 < (float)(v8 * 86400.0);
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)allowedSourceTypes
{
  BOOL v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = +[MOEventBundleSourceTypes all];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 associatedEventPermission];
        if (v10)
        {
          id v11 = v10;
          double v12 = [(MONotificationsManager *)self configManager];
          LODWORD(v11) = [v12 isAllowedToPromptEventCategory:v11];

          if (v11) {
            [v3 addObject:v9];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(MONotificationsManager *)self _isUserInOnboardingPeriod:v4];
  float v8 = +[NSDate now];
  id v9 = [(MONotificationsManager *)self configManager];
  int v10 = [v9 getIntegerSettingForKey:@"UserNotificationLookbackWindow" withFallback:2];

  double v11 = (double)v10;
  double v12 = [(MONotificationsManager *)self defaultsManager];
  unsigned int v13 = [v12 objectForKey:@"UserNotificationRecentUnscheduledNotificationDate"];

  long long v14 = [(MONotificationsManager *)self defaultsManager];
  long long v15 = [v14 objectForKey:@"UserNotificationOlderUnscheduledNotificationDate"];

  long long v16 = +[NSDate distantPast];
  if (v13 && (unsigned __int8 v17 = [v13 isBeforeDate:v8], v18 = v13, (v17 & 1) != 0)
    || v15 && (unsigned int v19 = [v15 isBeforeDate:v8], v18 = v15, v19))
  {
    id v20 = v18;

    long long v16 = v20;
  }
  double v21 = v11 * 86400.0;
  v81 = v16;
  if (!v7)
  {
    char v78 = 0;
    if (v4)
    {
      v34 = [v8 dateByAddingTimeInterval:-v21];
      if ([v16 isAfterDate:v34])
      {
        id v43 = v16;

        v34 = v43;
      }
      id v44 = [(MONotificationsManager *)self configManager];
      long long v46 = v44;
      CFStringRef v47 = @"UserNotificationScheduledGoodnessScoreThreshold";
    }
    else
    {
      int v50 = [(MONotificationsManager *)self _getNextUnscheduledNotificationDate];
      v34 = [v50 dateByAddingTimeInterval:-v21];

      if ([v16 isAfterDate:v34])
      {
        id v51 = v16;

        v34 = v51;
      }
      id v44 = [(MONotificationsManager *)self configManager];
      long long v46 = v44;
      CFStringRef v47 = @"UserNotificationUnscheduledGoodnessScoreThreshold";
    }
    LODWORD(v45) = 1036831949;
    [v44 getFloatSettingForKey:v47 withFallback:v45];
    int v41 = v52;

    if ([v34 isAfterDate:v8])
    {
      uint64_t v53 = [v8 dateByAddingTimeInterval:-86400.0];

      v34 = (void *)v53;
    }
    BOOL v79 = v4;
    v80 = v15;
    NSErrorUserInfoKey v54 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v92 = v34;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Lookback window for notification start date, %@", buf, 0xCu);
    }

    id v23 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v34 endDate:v8];
    goto LABEL_34;
  }
  long long v22 = [(MONotificationsManager *)self defaultsManager];
  id v23 = [v22 objectForKey:@"OnboardingDate"];

  [v8 timeIntervalSinceDate:v23];
  double v25 = v24;
  long long v26 = [(MONotificationsManager *)self configManager];
  LODWORD(v27) = 3.0;
  [v26 getFloatSettingForKey:@"UserNotificationMinimumDaysForOnboarding" withFallback:v27];
  double v29 = v28 * 86400.0;

  if (v25 >= v29)
  {
    char v78 = v7;
    BOOL v79 = v4;
    v80 = v15;
    id v30 = v13;
    id v31 = v23;
    id v32 = v31;
    if ([v81 isAfterDate:v31])
    {
      id v32 = v81;
    }
    id v33 = [(MONotificationsManager *)self _getNextUnscheduledNotificationDate];
    v34 = [v33 dateByAddingTimeInterval:-v21];

    if ([v81 isAfterDate:v34])
    {
      id v35 = v81;

      v34 = v35;
    }
    if ([v32 isAfterDate:v8])
    {
      id v36 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MONotificationsManager _getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:]();
      }

      id v37 = v34;
      id v32 = v37;
    }
    id v23 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v32 endDate:v8];
    unsigned int v38 = [(MONotificationsManager *)self configManager];
    LODWORD(v39) = 1032805417;
    [v38 getFloatSettingForKey:@"UserNotificationOnboardingBundleGoodnessThreshold" withFallback:v39];
    int v41 = v40;

    long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v92 = v32;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Lookback window for notification post onboarding start date, %@", buf, 0xCu);
    }

    unsigned int v13 = v30;
LABEL_34:
    long long v49 = [[MOEventBundleFetchOptions alloc] initWithDateInterval:v23 ascending:1 limit:0 filterBundle:0];
    if (MomentsLibraryCore()
      && (id v55 = objc_alloc((Class)getMOPromptManagerClass()),
          uint64_t v56 = objc_opt_class(),
          (id v57 = [v55 initForSoftLinkwithMOEventClass:v56 moEventBundleClass:objc_opt_class()]) != 0))
    {
      v58 = v57;
      v75 = v49;
      v76 = v8;
      v59 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
        -[MONotificationsManager _getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:]();
      }
      v77 = v6;

      v74 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1002F5930, &off_1002F5948, &off_1002F5960, &off_1002F5978, 0);
      v60 = objc_opt_new();
      for (uint64_t i = 0; i != 17; ++i)
      {
        v62 = [(MONotificationsManager *)self configManager];
        unsigned int v63 = [v62 isAllowedToPromptResourceType:i];

        if (v63)
        {
          v64 = +[NSNumber numberWithUnsignedInteger:i];
          [v60 addObject:v64];
        }
      }
      v65 = objc_opt_new();
      for (uint64_t j = 0; j != 25; ++j)
      {
        v67 = [(MONotificationsManager *)self configManager];
        unsigned int v68 = [v67 isAllowedToPromptEventCategory:j];

        if (v68)
        {
          v69 = +[NSNumber numberWithUnsignedInteger:j];
          [v65 addObject:v69];
        }
      }
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke;
      v82[3] = &unk_1002CEB78;
      id v6 = v77;
      id v87 = v77;
      v82[4] = self;
      char v89 = v78;
      id v83 = v34;
      id v84 = v74;
      int v88 = v41;
      id v85 = v60;
      id v86 = v65;
      BOOL v90 = v79;
      id v70 = v65;
      id v71 = v60;
      id v72 = v74;
      long long v49 = v75;
      [v58 fetchEventBundlesWithOptions:v75 handler:v82];

      float v8 = v76;
    }
    else
    {
      v73 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Soft link Moments framework skipped", buf, 2u);
      }

      v58 = [(MONotificationsManager *)self _getMomentsFrameworkNotAvailableNotificationsError];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v58);
    }

    long long v15 = v80;
    goto LABEL_51;
  }
  id v48 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "User onboarded too recently to get notifications.", buf, 2u);
  }

  long long v49 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"User onboarded too recently to get notifications."];
  (*((void (**)(id, void, MOEventBundleFetchOptions *))v6 + 2))(v6, 0, v49);
  v34 = 0;
LABEL_51:
}

void __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_89;
  }
  id v6 = [*(id *)(a1 + 32) allowedSourceTypes];
  unsigned int v7 = +[MOEventBundleProcessor trimmedFrom:v5 with:v6 respectOnboardingDate:1 shouldUseStandardSuite:0];

  id v94 = v5;
  if (*(unsigned char *)(a1 + 84))
  {
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v116 objects:v130 count:16];
    if (!v9)
    {
      int v11 = 0;
      goto LABEL_19;
    }
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v117;
    CFStringRef v13 = @"visibilityCategoryForUI";
    uint64_t v99 = *(void *)v117;
    while (1)
    {
      long long v14 = 0;
      id v101 = v10;
      do
      {
        if (*(void *)v117 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v15 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v14);
        long long v16 = [v15 rankingDictionary];
        unsigned __int8 v17 = [v16 objectForKeyedSubscript:v13];
        if ([v17 intValue] == 1)
        {
        }
        else
        {
          [v15 rankingDictionary];
          id v18 = v103 = v11;
          [v18 objectForKeyedSubscript:v13];
          v20 = CFStringRef v19 = v13;
          id v21 = v8;
          unsigned int v22 = [v20 intValue];

          CFStringRef v13 = v19;
          int v11 = v103;
          uint64_t v12 = v99;

          BOOL v23 = v22 == 2;
          id v8 = v21;
          id v10 = v101;
          if (!v23) {
            goto LABEL_15;
          }
        }
        if ([v15 interfaceType] != (id)11) {
          ++v11;
        }
LABEL_15:
        long long v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      id v10 = [v8 countByEnumeratingWithState:&v116 objects:v130 count:16];
      if (!v10)
      {
LABEL_19:

        double v24 = [*(id *)(a1 + 32) configManager];
        LODWORD(v25) = 5.0;
        [v24 getFloatSettingForKey:@"UserNotificationMinimumBundlesOnboarding" withFallback:v25];
        float v27 = v26;

        if (v27 > (float)v11)
        {
          float v28 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          id v5 = v94;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_cold_1();
          }

          uint64_t v29 = *(void *)(a1 + 72);
          id v30 = [*(id *)(a1 + 32) _getGenericNotificationErrorWithReason:@"Not enough non-evergreen bundles to notify user during onboarding period."];
          (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);
          goto LABEL_88;
        }
        id v31 = +[NSPredicate predicateWithFormat:@"startDate >= %@", *(void *)(a1 + 40)];
        unsigned int v7 = [v8 filteredArrayUsingPredicate:v31];

        break;
      }
    }
  }
  v95 = objc_opt_new();
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v8 = v7;
  id v32 = [v8 countByEnumeratingWithState:&v112 objects:v129 count:16];
  if (!v32) {
    goto LABEL_82;
  }
  id v33 = v32;
  v34 = NSAssertionHandler_ptr;
  uint64_t v102 = *(void *)v113;
  id v96 = v8;
  do
  {
    id v35 = 0;
    id v97 = v33;
    do
    {
      if (*(void *)v113 != v102) {
        objc_enumerationMutation(v8);
      }
      id v36 = *(void **)(*((void *)&v112 + 1) + 8 * (void)v35);
      id v37 = *(void **)(a1 + 48);
      unsigned int v38 = [v34[32] numberWithUnsignedInteger:[v36 interfaceType]];
      LOBYTE(v37) = [v37 containsObject:v38];

      if ((v37 & 1) == 0)
      {
        double v39 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          int v40 = [[v34[32] numberWithUnsignedInteger:[v36 interfaceType]];
          int v41 = [v36 suggestionID];
          [v36 bundleIdentifier];
          v43 = long long v42 = v35;
          *(_DWORD *)buf = 138412802;
          id v124 = v40;
          __int16 v125 = 2112;
          v126 = v41;
          __int16 v127 = 2112;
          v128 = v43;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Ignoring bundle with interfaceType: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);
          goto LABEL_35;
        }
        goto LABEL_38;
      }
      if ([v36 bundleSubType] == (id)202)
      {
        double v39 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          int v40 = [v36 suggestionID];
          int v41 = [v36 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          id v124 = v40;
          __int16 v125 = 2112;
          v126 = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Ignoring weekly workout summary bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);
          goto LABEL_36;
        }
        goto LABEL_38;
      }
      if (!*(unsigned char *)(a1 + 84))
      {
        id v44 = [v36 rankingDictionary];
        double v45 = [v44 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v45 floatValue];
        float v47 = v46;
        float v48 = *(float *)(a1 + 80);

        if (v47 < v48)
        {
          double v39 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            int v40 = [v36 suggestionID];
            int v41 = [v36 bundleIdentifier];
            [v36 rankingDictionary];
            v43 = long long v42 = v35;
            long long v49 = [v43 objectForKeyedSubscript:@"bundleGoodnessScore"];
            *(_DWORD *)buf = 138412802;
            id v124 = v40;
            __int16 v125 = 2112;
            v126 = v41;
            __int16 v127 = 2112;
            v128 = v49;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Ignoring bundle with low goodness score. SuggestionID: %@, bundleID: %@, goodnessScore: %@", buf, 0x20u);

LABEL_35:
            id v35 = v42;
LABEL_36:

LABEL_37:
          }
          goto LABEL_38;
        }
      }
      v100 = v35;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      int v50 = [v36 resources];
      id v51 = [v50 countByEnumeratingWithState:&v108 objects:v122 count:16];
      if (v51)
      {
        id v52 = v51;
        uint64_t v53 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v109 != v53) {
              objc_enumerationMutation(v50);
            }
            id v55 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            uint64_t v56 = *(void **)(a1 + 56);
            id v57 = [v34[32] numberWithUnsignedInteger:[v55 type]];
            LOBYTE(v56) = [v56 containsObject:v57];

            if ((v56 & 1) == 0)
            {
              v58 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                v59 = [v34[32] numberWithUnsignedInteger:[v55 type]];
                v60 = [v36 suggestionID];
                v61 = [v36 bundleIdentifier];
                *(_DWORD *)buf = 138412802;
                id v124 = v59;
                __int16 v125 = 2112;
                v126 = v60;
                __int16 v127 = 2112;
                v128 = v61;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Ignoring bundle with resource type: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);

                v34 = NSAssertionHandler_ptr;
              }
            }
          }
          id v52 = [v50 countByEnumeratingWithState:&v108 objects:v122 count:16];
        }
        while (v52);
      }

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v62 = [v36 events];
      id v63 = [v62 countByEnumeratingWithState:&v104 objects:v121 count:16];
      if (v63)
      {
        id v64 = v63;
        uint64_t v65 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v64; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v105 != v65) {
              objc_enumerationMutation(v62);
            }
            v67 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
            unsigned int v68 = *(void **)(a1 + 64);
            v69 = [v34[32] numberWithUnsignedInteger:[v67 category]];
            LOBYTE(v68) = [v68 containsObject:v69];

            if ((v68 & 1) == 0)
            {
              id v70 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                id v71 = [v34[32] numberWithUnsignedInteger:[v67 category]];
                id v72 = [v36 suggestionID];
                v73 = [v36 bundleIdentifier];
                *(_DWORD *)buf = 138412802;
                id v124 = v71;
                __int16 v125 = 2112;
                v126 = v72;
                __int16 v127 = 2112;
                v128 = v73;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Ignoring bundle with event category: %@.  SuggestionID: %@, bundleID:  %@", buf, 0x20u);

                v34 = NSAssertionHandler_ptr;
              }
            }
          }
          id v64 = [v62 countByEnumeratingWithState:&v104 objects:v121 count:16];
        }
        while (v64);
      }

      v74 = [v36 labels];
      v75 = [v74 firstObject];

      id v8 = v96;
      id v33 = v97;
      id v35 = v100;
      if (v75)
      {
        unsigned __int8 v98 = [v36 hasSuggestionEngagementEvent:@"suggestionsSelected"];
        unsigned __int8 v76 = [v36 hasSuggestionEngagementEvent:@"suggestionsQuickAddEntry"];
        unsigned __int8 v77 = [v36 hasSuggestionEngagementEvent:@"suggestionsDeleted"];
        char v78 = [v36 rankingDictionary];
        BOOL v79 = [v78 objectForKeyedSubscript:@"isBundleOrSubBundleDeleted"];
        unsigned __int8 v80 = [v79 BOOLValue];

        v81 = [v36 rankingDictionary];
        v82 = [v81 objectForKeyedSubscript:@"isBundleOrSubBundlesSelectedOrQuickAdded"];
        unsigned int v83 = [v82 BOOLValue];

        if ((v98 & 1) != 0 || (v76 & 1) != 0 || (v77 & 1) != 0 || (v80 & 1) != 0 || v83)
        {
          id v84 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            id v85 = [v36 suggestionID];
            id v86 = [v36 bundleIdentifier];
            *(_DWORD *)buf = 138412546;
            id v124 = v85;
            __int16 v125 = 2112;
            v126 = v86;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "Ignoring 'used' bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);
          }
        }
        else
        {
          if (([*(id *)(a1 + 32) _isBundleUserInteractive:v36] & 1) == 0)
          {
            double v39 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
            v34 = NSAssertionHandler_ptr;
            id v35 = v100;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              int v40 = [v36 suggestionID];
              id v87 = [v36 bundleIdentifier];
              *(_DWORD *)buf = 138412546;
              id v124 = v40;
              __int16 v125 = 2112;
              v126 = v87;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Ignoring ranking ineligible bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);

              goto LABEL_37;
            }
LABEL_38:

            goto LABEL_39;
          }
          [v95 addObject:v36];
        }
        v34 = NSAssertionHandler_ptr;
        id v35 = v100;
      }
LABEL_39:
      id v35 = (char *)v35 + 1;
    }
    while (v35 != v33);
    id v88 = [v8 countByEnumeratingWithState:&v112 objects:v129 count:16];
    id v33 = v88;
  }
  while (v88);
LABEL_82:

  char v89 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  id v30 = v95;
  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
  {
    id v90 = [v95 count];
    *(_DWORD *)buf = 134217984;
    id v124 = v90;
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "%lu new bundles found", buf, 0xCu);
  }

  [v95 sortUsingComparator:&__block_literal_global_24];
  id v5 = v94;
  if (*(unsigned char *)(a1 + 85) && (unint64_t)[v95 count] >= 2)
  {
    uint64_t v91 = *(void *)(a1 + 72);
    id v92 = [v95 objectAtIndexedSubscript:0];
    v120 = v92;
    v93 = +[NSArray arrayWithObjects:&v120 count:1];
    (*(void (**)(uint64_t, void *, void))(v91 + 16))(v91, v93, 0);
  }
  else
  {
    (*(void (**)(void, void *, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v95, 0);
  }
LABEL_88:

LABEL_89:
}

int64_t __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_700(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  BOOL v4 = a3;
  id v5 = [(MOEventBundle *)a2 rankingDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v6 floatValue];
  float v8 = v7;

  id v9 = [(MOEventBundle *)v4 rankingDictionary];

  id v10 = [v9 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v10 floatValue];
  float v12 = v11;

  int64_t v13 = -1;
  if (v8 < v12) {
    int64_t v13 = 1;
  }
  if (v8 == v12) {
    return 0;
  }
  else {
    return v13;
  }
}

- (BOOL)_checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:(id)a3 usingAppSchedule:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v31 = self;
  unsigned int v7 = [(MONotificationsManager *)self _isUserInOnboardingPeriod:v4];
  if (!v7)
  {
    char v26 = 0;
    goto LABEL_19;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v8)
  {
    char v26 = 0;
    goto LABEL_18;
  }
  id v9 = v8;
  id v28 = v6;
  char v29 = v7;
  uint64_t v10 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(obj);
      }
      float v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      int64_t v13 = [v12 rankingDictionary:v28];
      long long v14 = [v13 objectForKeyedSubscript:@"visibilityCategoryForUI"];
      if ([v14 intValue] == 1)
      {
      }
      else
      {
        long long v15 = [v12 rankingDictionary];
        long long v16 = [v15 objectForKeyedSubscript:@"visibilityCategoryForUI"];
        unsigned int v17 = [v16 intValue];

        if (v17 != 2) {
          continue;
        }
      }
      id v18 = [v12 rankingDictionary];
      CFStringRef v19 = [v18 objectForKeyedSubscript:@"bundleGoodnessScore"];
      [v19 floatValue];
      float v21 = v20;
      unsigned int v22 = [(MONotificationsManager *)v31 configManager];
      LODWORD(v23) = 1032805417;
      [v22 getFloatSettingForKey:@"UserNotificationOnboardingBundleGoodnessThreshold" withFallback:v23];
      float v25 = v24;

      if (v21 >= v25)
      {
        char v26 = 1;
        goto LABEL_16;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  char v26 = 0;
LABEL_16:
  LOBYTE(v7) = v29;
  id v6 = v28;
LABEL_18:

LABEL_19:
  return v26 | v7 ^ 1;
}

- (BOOL)_checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5 && [v8 count])
  {
    uint64_t v10 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      float v11 = [v8 objectAtIndexedSubscript:0];
      float v12 = [v11 suggestionID];
      *(_DWORD *)buf = 138412290;
      id v43 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Check if eligible for opportunistic notification for suggID: %@", buf, 0xCu);
    }
    int64_t v13 = +[NSDate now];
    if (+[JournalAppSettingsUtilities BOOLForKey:@"streakReminderEnabled"])
    {
      long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Streak notifications are turned on.", buf, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_51;
    }
    long long v16 = [(MONotificationsManager *)self configManager];
    LODWORD(v17) = 1041865114;
    [v16 getFloatSettingForKey:@"UserNotificationScheduledOpportunisticGoodnessScoreThreshold" withFallback:v17];
    float v19 = v18;

    float v20 = [v8 objectAtIndexedSubscript:0];
    float v21 = [v20 rankingDictionary];
    long long v14 = [v21 objectForKeyedSubscript:@"bundleGoodnessScore"];

    [v14 floatValue];
    if (v22 < v19)
    {
      double v23 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Goodness score too low: %@", buf, 0xCu);
      }
      BOOL v15 = 0;
      goto LABEL_50;
    }
    double v23 = +[NSCalendar currentCalendar];
    float v24 = [v9 nextTriggerDate];
    if (v24)
    {
      float v25 = [v9 nextTriggerDate];
    }
    else
    {
      float v25 = v13;
    }
    char v26 = v25;

    if ([v23 isDateInToday:v26])
    {
      float v27 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There is already been another notification scheduled today.", buf, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_49;
    }
    id v28 = [(MONotificationsManager *)self defaultsManager];
    float v27 = [v28 objectForKey:@"UserNotificationRecentUnscheduledNotificationDate"];

    char v29 = [(MONotificationsManager *)self defaultsManager];
    int v41 = [v29 objectForKey:@"UserNotificationOlderUnscheduledNotificationDate"];

    id v30 = +[NSDate distantPast];
    if (v27 && (id v31 = v27, ([v27 isBeforeDate:v13] & 1) != 0)
      || (id v31 = v41) != 0 && [v41 isBeforeDate:v13])
    {
      long long v32 = v31;

      id v30 = v32;
    }
    if (([v23 isDateInToday:v30] & 1) != 0
      || [v23 isDateInYesterday:v30])
    {
      long long v33 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There has already been another system notification recently.", buf, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_48;
    }
    int v40 = v26;
    long long v34 = [(MONotificationsManager *)self defaultsManager];
    long long v33 = [v34 objectForKey:@"UserNotificationLastScheduledOpportunisticPostingDate"];

    if (v33
      && [v33 isBeforeDate:v13]
      && ([v13 timeIntervalSinceDate:v33], v35 < 604800.0))
    {
      id v36 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      double v39 = v36;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. There has already been another opportunistic notification this week.", buf, 2u);
      }
      BOOL v15 = 0;
    }
    else
    {
      double v39 = [(MONotificationsManager *)self _getNextScheduledOpportunisticNotificationDate];
      if (-[NSObject isDateInTomorrow:](v23, "isDateInTomorrow:"))
      {
        char v26 = v40;
        if ([v23 isDateInTomorrow:v40])
        {
          id v37 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. Next available opportunistic time is tomorrow, and there is a scheduled notification for tomorrow.", buf, 2u);
          }

          BOOL v15 = 0;
        }
        else
        {
          BOOL v15 = 1;
        }
        goto LABEL_47;
      }
      BOOL v15 = 1;
    }
    char v26 = v40;
LABEL_47:

LABEL_48:
LABEL_49:

LABEL_50:
LABEL_51:

    goto LABEL_52;
  }
  int64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Opportunistic notification ineligible. App schedule not set or no bundles available", buf, 2u);
  }
  BOOL v15 = 0;
LABEL_52:

  return v15;
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:(id)a3 withTrigger:(id)a4 usingAppSchedule:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  float v12 = (void (**)(void))a6;
  id v13 = v11;
  uint64_t v14 = [(MONotificationsManager *)self _getCurrentSystemDefaultActionURL];
  if (v14)
  {
    BOOL v15 = (void *)v14;
    if (MomentsLibraryCore()
      && (id v16 = objc_alloc((Class)getMOPromptManagerClass()),
          uint64_t v17 = objc_opt_class(),
          (id v18 = [v16 initForSoftLinkwithMOEventClass:v17 moEventBundleClass:objc_opt_class()]) != 0))
    {
      float v19 = v18;
      if ([(MONotificationsManager *)self _checkIfEligibleToPostInOnboardingPeriodUsingEventBundles:v10 usingAppSchedule:v7])
      {
        long long v132 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v129 = 0u;
        id v100 = v10;
        id obj = v10;
        id v20 = [obj countByEnumeratingWithState:&v129 objects:v139 count:16];
        id v104 = v13;
        long long v105 = v12;
        uint64_t v102 = self;
        int v103 = v19;
        unsigned int v101 = v7;
        if (!v20)
        {
          int v41 = 0;
          float v27 = 0;
          id v31 = 0;
          goto LABEL_46;
        }
        id v21 = v20;
        long long v111 = 0;
        id v116 = 0;
        uint64_t v22 = *(void *)v130;
LABEL_7:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v130 != v22) {
            objc_enumerationMutation(obj);
          }
          float v24 = *(void **)(*((void *)&v129 + 1) + 8 * v23);
          float v25 = [v24 labels];
          char v26 = [v25 firstObject];
          float v27 = [v26 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

          if (v27)
          {
            if (([v27 containsString:@"{time}"] & 1) != 0
              || ([v27 containsString:@"{place"] & 1) != 0
              || ([v27 containsString:@"{action"] & 1) != 0
              || ([v27 containsString:@"{unique_"] & 1) != 0
              || ([v27 containsString:@"{city"] & 1) != 0
              || [v27 containsString:@"{date_"])
            {
              id v28 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v134 = v116;
                _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Label potentially contains eng text: %@", buf, 0xCu);
              }
            }
            else
            {
              id v31 = v116;
              if (v116)
              {
                id v13 = v104;
                self = v102;
                float v19 = v103;
LABEL_45:
                uint64_t v7 = v101;
                int v41 = v111;
LABEL_46:

                long long v42 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
                  -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:].cold.4();
                }

                if (v31)
                {
                  id v43 = v13;
                  long long v117 = v31;
                  unsigned int v106 = [(MONotificationsManager *)self _checkIfEligibleForOpportunisticScheduledNotificationUsingEventBundles:obj withTrigger:v13 usingAppSchedule:v7];
                  if (v106)
                  {
                    long long v114 = [(MONotificationsManager *)self _getOpportunisticNotificationTrigger];

                    id v44 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                    {
                      double v45 = [v114 nextTriggerDate];
                      *(_DWORD *)buf = 138412290;
                      id v134 = v45;
                      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Eligible for opportunistic posting; updating the trigger posting time to: %@",
                        buf,
                        0xCu);
                    }
                    id v43 = v114;
                  }
                  long long v113 = v41;
                  float v46 = +[NSCalendar currentCalendar];
                  float v47 = +[NSDate now];
                  uint64_t v48 = [v43 nextTriggerDate];
                  long long v49 = v43;
                  int v50 = (void *)v48;
                  long long v115 = v49;
                  id v97 = v47;
                  if (v48)
                  {
                    id v51 = [v49 nextTriggerDate];
                  }
                  else
                  {
                    id v51 = v47;
                  }
                  id v53 = v51;

                  uint64_t v99 = [v46 dateByAddingUnit:16 value:-1 toDate:v53 options:0];
                  NSErrorUserInfoKey v54 = +[NSMutableString stringWithString:@"“%@”"];
                  id v55 = [v113 interfaceType];
                  uint64_t v56 = 0;
                  unsigned __int8 v98 = v46;
                  long long v108 = v53;
                  long long v110 = v54;
                  if (v55 == (id)13) {
                    goto LABEL_70;
                  }
                  id v57 = [v113 startDate];
                  if ([v46 isDate:v57 inSameDayAsDate:v53])
                  {

                    goto LABEL_64;
                  }
                  uint64_t v58 = [v113 startDate];
                  v59 = v46;
                  v60 = (void *)v58;
                  unsigned __int8 v61 = [v59 isDate:v58 inSameDayAsDate:v99];

                  if (v61)
                  {
LABEL_64:
                    uint64_t v56 = 0;
                    NSErrorUserInfoKey v54 = v110;
                  }
                  else
                  {
                    v62 = [v113 startDate];
                    uint64_t v63 = [v62 getBundleRelativeDate];

                    NSErrorUserInfoKey v54 = v110;
                    [v110 appendString:@" on "];
                    [v110 appendString:v63];
                    uint64_t v56 = (void *)v63;
                  }
                  if (!v27)
                  {
LABEL_70:
                    id v96 = v56;
                    [v54 appendString:@". Take some time to write."];
                  }
                  else
                  {
                    id v96 = v56;
                    id v64 = [v19 localizedString:@"NUM_MOMENTS_NOTIFICATION_FORMAT" withTable:@"Localizable"];
                    uint64_t v65 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v64, (char *)[obj count] - 1);
                    [v110 appendString:@" and %@. Take some time to write."];

                    if (v65)
                    {
                      v66 = [v19 localizedStringForKey:v110];
                      long long v119 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v66, v117, v65);

                      goto LABEL_72;
                    }
                    NSErrorUserInfoKey v54 = v110;
                  }
                  uint64_t v65 = [v19 localizedStringForKey:v54];
                  long long v119 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v65, v117);
LABEL_72:

                  if ([obj count] == (id)1) {
                    CFStringRef v67 = @"New Journaling Suggestion";
                  }
                  else {
                    CFStringRef v67 = @"New Journaling Suggestions";
                  }
                  v95 = [v19 localizedStringForKey:v67];
                  uint64_t v68 = 1;
                  if (v7) {
                    uint64_t v68 = 2;
                  }
                  if (v106) {
                    uint64_t v68 = 3;
                  }
                  uint64_t v91 = v68;
                  id v69 = [objc_alloc((Class)NSURLComponents) initWithURL:v15 resolvingAgainstBaseURL:0];
                  id v70 = objc_alloc((Class)NSMutableArray);
                  id v71 = [v69 queryItems];
                  id v72 = [v70 initWithArray:v71];

                  v73 = [obj objectAtIndexedSubscript:0];
                  v74 = [v73 suggestionID];
                  uint64_t v75 = [v74 UUIDString];

                  uint64_t v76 = v75;
                  v93 = (void *)v75;
                  id v94 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"suggestionID" value:v75];
                  [v72 addObject:v94];
                  [v69 setQueryItems:v72];
                  uint64_t v92 = [v69 URL];

                  unsigned __int8 v77 = objc_opt_new();
                  [v77 setObject:v76 forKey:@"suggestionID"];
                  char v78 = [obj objectAtIndexedSubscript:0];
                  BOOL v79 = [v78 bundleIdentifier];
                  unsigned __int8 v80 = [v79 UUIDString];
                  [v77 setObject:v80 forKey:@"bundleID"];

                  [v77 setObject:v53 forKey:@"postingDate"];
                  v81 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj count]);
                  [v77 setObject:v81 forKey:@"numSuggestionInNotification"];

                  v82 = [obj objectAtIndexedSubscript:0];
                  unsigned int v83 = [v82 endDate];
                  [v77 setObject:v83 forKey:@"bundleEndDate"];

                  id v84 = +[NSNumber numberWithInteger:v91];
                  [v77 setObject:v84 forKey:@"postingScheduleType"];

                  id v85 = [obj objectAtIndexedSubscript:0];
                  id v86 = [(MONotificationsManager *)v102 createBundleInformationForAnalyticsWithBundle:v85];

                  [v77 setObject:v86 forKey:@"analyticsDict"];
                  id v87 = [(MONotificationsManager *)v102 _getCurrentApplicationIcon];
                  v121[0] = _NSConcreteStackBlock;
                  v121[1] = 3221225472;
                  v121[2] = __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke;
                  v121[3] = &unk_1002CEBA0;
                  v121[4] = v102;
                  id v38 = v115;
                  id v122 = v38;
                  id v123 = v97;
                  char v127 = v106;
                  id v124 = obj;
                  id v125 = v77;
                  char v128 = v101;
                  float v12 = v105;
                  v126 = v105;
                  id v88 = v77;
                  id v89 = v97;
                  LOBYTE(v90) = 1;
                  [(MONotificationsManager *)v102 _postNotificationWithTitle:v95 message:v119 defaultActionURL:v92 notificationIdentifier:@"moments-time-to-write" withIcon:v87 usingTrigger:v38 useSubordinateIcon:v90 userInfo:v88 handler:v121];

                  float v19 = v103;
                  BOOL v15 = (void *)v92;
                  id v13 = v104;
                  id v31 = v117;
                  int v41 = v113;
                }
                else
                {
                  id v52 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                    -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:]();
                  }

                  if (v12)
                  {
                    long long v118 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Expecting valid bundle for notification"];
                    v12[2](v12);
                    id v38 = v13;
                  }
                  else
                  {
                    id v38 = v13;
                  }
                }

                id v10 = v100;
LABEL_40:

LABEL_41:
                goto LABEL_42;
              }
              id v116 = v27;
              id v32 = v24;

              id v28 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                long long v112 = [v32 suggestionID];
                long long v107 = [v32 bundleIdentifier];
                long long v109 = [v32 rankingDictionary];
                uint64_t v33 = [v109 objectForKeyedSubscript:@"bundleGoodnessScore"];
                *(_DWORD *)buf = 138412802;
                id v134 = v112;
                __int16 v135 = 2112;
                v136 = v107;
                __int16 v137 = 2112;
                uint64_t v138 = v33;
                long long v34 = (void *)v33;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Top bundle in notification. SuggestionID: %@, bundleID:  %@, goodnessScore: %@", buf, 0x20u);
              }
              long long v111 = v32;
            }
          }
          else
          {
            id v28 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              char v29 = [v24 suggestionID];
              id v30 = [v24 bundleIdentifier];
              *(_DWORD *)buf = 138412546;
              id v134 = v29;
              __int16 v135 = 2112;
              v136 = v30;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Ignoring top bundle. SuggestionID: %@, bundleID:  %@", buf, 0x16u);
            }
          }

          if (v21 == (id)++v23)
          {
            id v35 = [obj countByEnumeratingWithState:&v129 objects:v139 count:16];
            id v21 = v35;
            if (!v35)
            {
              float v27 = 0;
              id v13 = v104;
              self = v102;
              float v19 = v103;
              id v31 = v116;
              goto LABEL_45;
            }
            goto LABEL_7;
          }
        }
      }
      double v39 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Didn't find a good enough bundle to notify during onboarding.", buf, 2u);
      }

      int v40 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Didn't find a good enough bundle to notify during onboarding."];
      ((void (*)(void (**)(void), void *))v12[2])(v12, v40);
    }
    else
    {
      id v36 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:]();
      }

      float v19 = [(MONotificationsManager *)self _getMomentsFrameworkNotAvailableNotificationsError];
      ((void (*)(void (**)(void), void *))v12[2])(v12, v19);
    }
    id v38 = v13;
    goto LABEL_40;
  }
  id v37 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    -[MONotificationsManager _postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:]();
  }

  id v38 = v13;
  if (v12)
  {
    BOOL v15 = [(MONotificationsManager *)self _getGenericNotificationErrorWithReason:@"Empty action URL"];
    ((void (*)(void (**)(void), void *))v12[2])(v12, v15);
    id v38 = v13;
    goto LABEL_41;
  }
LABEL_42:
}

void __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [v3 localizedDescription];
    *(_DWORD *)buf = 138412290;
    float v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "System notification posted, error: %@", buf, 0xCu);
  }
  if (!v3)
  {
    id v6 = [*(id *)(a1 + 32) defaultsManager];
    uint64_t v7 = [v6 objectForKey:@"UserNotificationRecentUnscheduledNotificationDate"];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) defaultsManager];
      [v8 setObject:v7 forKey:@"UserNotificationOlderUnscheduledNotificationDate"];
    }
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_cold_1(a1, v9);
    }

    id v10 = [*(id *)(a1 + 40) nextTriggerDate];
    if (v10)
    {
      id v11 = [*(id *)(a1 + 40) nextTriggerDate];
    }
    else
    {
      id v11 = *(id *)(a1 + 48);
    }
    float v12 = v11;

    id v13 = [*(id *)(a1 + 32) defaultsManager];
    [v13 setObject:v12 forKey:@"UserNotificationRecentUnscheduledNotificationDate"];

    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v14 = [*(id *)(a1 + 32) defaultsManager];
      [v14 setObject:v12 forKey:@"UserNotificationLastScheduledOpportunisticPostingDate"];
    }
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = [*(id *)(a1 + 40) nextTriggerDate];
    [v17 submitNotificationEngagementEventAnalyticsForBundles:v15 userInfo:v16 fromTrigger:0 withPostingDate:v18];

    [*(id *)(a1 + 32) submitEngagementHistoryUpdateWithEvent:@"suggestionNotificationQueued" userInfo:*(void *)(a1 + 64)];
  }
  if (*(unsigned char *)(a1 + 81))
  {
    float v19 = *(void **)(a1 + 32);
    id v20 = [*(id *)(a1 + 40) nextTriggerDate];
    id v21 = [v19 _getNextNotificationDateComponentsWithOptions:1 afterDate:v20 numWeeks:2 setComponents:0];

    uint64_t v22 = *(void **)(a1 + 32);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_769;
    v24[3] = &unk_1002CDA18;
    id v25 = *(id *)(a1 + 72);
    [v22 setupFallbackAppBrandedNotificationsWithDateComponents:v21 handler:v24];
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 72);
    if (v23) {
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v3);
    }
  }
}

uint64_t __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_769(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_isEligibleForUnscheduledNotification
{
  id v3 = +[NSDate now];
  BOOL v4 = [(MONotificationsManager *)self defaultsManager];
  BOOL v5 = [v4 objectForKey:@"UserNotificationRecentUnscheduledNotificationDate"];

  if (v5)
  {
    id v6 = [(MONotificationsManager *)self defaultsManager];
    uint64_t v7 = [v6 objectForKey:@"UserNotificationOlderUnscheduledNotificationDate"];

    id v8 = [(MONotificationsManager *)self _getNextUnscheduledNotificationDate];
    id v9 = v8;
    if (v7
      && ([v8 timeIntervalSinceDate:v7], v10 < 604800.0)
      && [v5 isBeforeDate:v3])
    {
      id v11 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Already 2 notifications in the last week. Ineligible for new notification", v14, 2u);
      }

      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    BOOL v12 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No set default for last notification date. Eligible for new notification", buf, 2u);
    }
  }

  return v12;
}

- (id)_getNextScheduledCalendarNotificationTrigger
{
  id v3 = +[NSDate now];
  BOOL v4 = [(MONotificationsManager *)self _getNextNotificationDateComponentsWithOptions:1 afterDate:v3 numWeeks:1 setComponents:0];

  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = +[UNCalendarNotificationTrigger triggerWithDateMatchingComponents:v5 repeats:0];
  }
  else
  {
    id v6 = 0;
    BOOL v5 = 0;
  }

  return v6;
}

- (id)_getCurrentApplicationIcon
{
  return +[UNNotificationIcon iconForApplicationIdentifier:@"com.apple.journal"];
}

- (void)_postNotificationWithTitle:(id)a3 message:(id)a4 defaultActionURL:(id)a5 notificationIdentifier:(id)a6 withIcon:(id)a7 usingTrigger:(id)a8 useSubordinateIcon:(BOOL)a9 userInfo:(id)a10 handler:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  id v35 = v18;
  if ([(MONotificationsManager *)self _userConsentCompleted])
  {
    [(MONotificationsManager *)self _clearAllNotifications];
    id v25 = objc_opt_new();
    id v26 = v17;
    float v27 = v25;
    long long v34 = v26;
    [v25 setTitle:];
    [v27 setBody:v18];
    id v28 = v21;
    [v27 setIcon:v21];
    [v27 setDefaultActionURL:v19];
    char v29 = +[UNNotificationSound defaultSound];
    [v27 setSound:v29];

    [v27 setShouldShowSubordinateIcon:a9];
    [v27 setCategoryIdentifier:@"com.apple.momentsd.MOUserNotifications"];
    [v27 setUserInfo:v23];
    [v27 setShouldBackgroundDefaultAction:1];
    id v30 = +[UNNotificationRequest requestWithIdentifier:v20 content:v27 trigger:v22];
    id v31 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v22;
      __int16 v38 = 2112;
      id v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "MOUserNotification requested, trigger, %@, actionUrl, %@", buf, 0x16u);
    }

    id v32 = [(MONotificationsManager *)self userNotificationCenterSystemBranded];
    [v32 addNotificationRequest:v30 withCompletionHandler:v24];

    id v17 = v34;
    id v21 = v28;
  }
  else
  {
    uint64_t v33 = [(MONotificationsManager *)self _getOnboardingNotCompleteNotificationsError];
    (*((void (**)(id, void *))v24 + 2))(v24, v33);
  }
}

- (void)_clearAllNotifications
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "UserNotification getPendingNotificationRequest timed-out for analytics", v1, 2u);
}

void __48__MONotificationsManager__clearAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    BOOL v4 = [v3 objectAtIndexedSubscript:0];
    BOOL v5 = [v4 content];
    id v6 = [v5 userInfo];

    uint64_t v7 = [v6 objectForKey:@"postingDate"];
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Clearing Moments notifications", v10, 2u);
    }

    id v9 = [*(id *)(a1 + 32) userNotificationCenterSystemBranded];
    [v9 removeAllPendingNotificationRequests];

    [*(id *)(a1 + 32) submitNotificationEngagementEventAnalyticsForBundles:0 userInfo:v6 fromTrigger:1 withPostingDate:v7];
    [*(id *)(a1 + 32) submitEngagementHistoryUpdateWithEvent:@"suggestionNotificationDequeued" userInfo:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [v7 notification];
  double v10 = [v9 request];
  id v11 = [v10 content];
  BOOL v12 = [v11 userInfo];

  id v13 = [v12 objectForKey:@"postingDate"];
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412290;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didReceiveNotificationResponse triggred with info %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v15 = [v7 actionIdentifier];
  unsigned __int8 v16 = [v15 isEqualToString:UNNotificationDismissActionIdentifier];

  if (v16)
  {
    id v17 = MOSuggestionEngagementEventNotificationDismissed;
    uint64_t v18 = 3;
LABEL_7:
    [(MONotificationsManager *)self submitNotificationEngagementEventAnalyticsForBundles:0 userInfo:v12 fromTrigger:v18 withPostingDate:v13];
    [(MONotificationsManager *)self submitEngagementHistoryUpdateWithEvent:*v17 userInfo:v12];
    goto LABEL_8;
  }
  id v19 = [v7 actionIdentifier];
  unsigned int v20 = [v19 isEqualToString:UNNotificationDefaultActionIdentifier];

  if (v20)
  {
    id v17 = MOSuggestionEngagementEventNotificationTapped;
    uint64_t v18 = 4;
    goto LABEL_7;
  }
LABEL_8:
  v8[2](v8);
}

- (unint64_t)_MOStatusFromUNStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (unint64_t)getAppNotificationAuthorizationStatus
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  BOOL v4 = [(MONotificationsManager *)self userNotificationCenterAppBranded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __63__MONotificationsManager_getAppNotificationAuthorizationStatus__block_invoke;
  v9[3] = &unk_1002CEBF0;
  id v11 = &v12;
  v9[4] = self;
  BOOL v5 = v3;
  double v10 = v5;
  [(MONotificationsManager *)self checkAuthorizationStatusForNotificationCenter:v4 completion:v9];

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__MONotificationsManager_getAppNotificationAuthorizationStatus__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _MOStatusFromUNStatus:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

- (unint64_t)getSystemNotificationAuthorizationStatus
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  BOOL v4 = [(MONotificationsManager *)self userNotificationCenterSystemBranded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __66__MONotificationsManager_getSystemNotificationAuthorizationStatus__block_invoke;
  v9[3] = &unk_1002CEBF0;
  id v11 = &v12;
  v9[4] = self;
  BOOL v5 = v3;
  double v10 = v5;
  [(MONotificationsManager *)self checkAuthorizationStatusForNotificationCenter:v4 completion:v9];

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__MONotificationsManager_getSystemNotificationAuthorizationStatus__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _MOStatusFromUNStatus:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

- (int64_t)getNotificationScheduledDeliverySetting
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  BOOL v4 = [(MONotificationsManager *)self userNotificationCenterSystemBranded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __65__MONotificationsManager_getNotificationScheduledDeliverySetting__block_invoke;
  v9[3] = &unk_1002CEC18;
  id v11 = &v12;
  BOOL v5 = v3;
  double v10 = v5;
  [v4 getNotificationSettingsWithCompletionHandler:v9];

  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v5, v6);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__MONotificationsManager_getNotificationScheduledDeliverySetting__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 scheduledDeliverySetting];
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

- (id)createBundleInformationForAnalyticsWithBundle:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  BOOL v5 = +[NSCalendar currentCalendar];
  dispatch_time_t v6 = [v3 bundleIdentifier];
  int64_t v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:@"bundleID"];

  id v8 = [v3 suggestionID];
  id v9 = [v8 UUIDString];
  [v4 setObject:v9 forKeyedSubscript:@"suggestionID"];

  double v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 interfaceType]);
  [v4 setObject:v10 forKeyedSubscript:@"interfaceType"];

  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 bundleSubType]);
  [v4 setObject:v11 forKeyedSubscript:@"subType"];

  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 bundleSuperType]);
  [v4 setObject:v12 forKeyedSubscript:@"superType"];

  id v13 = [v3 rankingDictionary];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"bundleGoodnessScore"];
  [v14 floatValue];
  *(float *)&double v16 = v15 * 10000.0;
  id v17 = +[NSNumber numberWithFloat:v16];
  [v4 setObject:v17 forKeyedSubscript:@"goodnessScore"];

  uint64_t v18 = [v3 endDate];

  id v19 = [v5 components:60 fromDate:v18];

  unsigned int v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 year]);
  [v4 setObject:v20 forKeyedSubscript:@"suggestionEndDateYear"];

  int v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 month]);
  [v4 setObject:v21 forKeyedSubscript:@"suggestionEndDateMonth"];

  id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 day]);
  [v4 setObject:v22 forKeyedSubscript:@"suggestionEndDateDay"];

  id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 hour]);
  [v4 setObject:v23 forKeyedSubscript:@"suggestionEndDateHour"];

  return v4;
}

- (void)submitNotificationEngagementEventAnalyticsForBundles:(id)a3 userInfo:(id)a4 fromTrigger:(unint64_t)a5 withPostingDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_opt_new();
  uint64_t v14 = +[NSDate now];
  uint64_t v68 = +[NSCalendar currentCalendar];
  id v70 = (void *)v14;
  float v15 = [v68 components:124 fromDate:v14];
  double v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 year]);
  [v13 setObject:v16 forKeyedSubscript:@"submissionTimeYear"];

  id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 month]);
  [v13 setObject:v17 forKeyedSubscript:@"submissionTimeMonth"];

  uint64_t v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 day]);
  [v13 setObject:v18 forKeyedSubscript:@"submissionTimeDay"];

  id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 hour]);
  [v13 setObject:v19 forKeyedSubscript:@"submissionTimeHour"];

  unsigned int v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 minute]);
  [v13 setObject:v20 forKeyedSubscript:@"submissionTimeMinute"];

  int v21 = +[NSNumber numberWithUnsignedInteger:a5];
  [v13 setObject:v21 forKeyedSubscript:@"notificationEventTrigger"];

  id v69 = v12;
  if (v10 && [v10 count])
  {
    id v22 = [v10 objectAtIndexedSubscript:0];
    id v71 = [v22 endDate];
    id v23 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v22 suggestionID];
      [v24 UUIDString];
      CFStringRef v67 = v15;
      unint64_t v25 = a5;
      float v27 = v26 = v10;
      *(_DWORD *)buf = 138412290;
      v73 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "submit Notification engagement for suggID: %@", buf, 0xCu);

      id v10 = v26;
      a5 = v25;
      float v15 = v67;

      id v12 = v69;
    }

    id v28 = [(MONotificationsManager *)self createBundleInformationForAnalyticsWithBundle:v22];
    [v13 addEntriesFromDictionary:v28];
    if (!a5 && v12)
    {
      id v29 = v10;
      [v12 timeIntervalSinceDate:v70];
      id v31 = kMONotifications_queuePostingLatency;
LABEL_15:
      uint64_t v33 = +[NSNumber numberWithInteger:vcvtmd_s64_f64(v30 / 60.0)];
      [v13 setObject:v33 forKeyedSubscript:*v31];

      id v10 = v29;
      id v12 = v69;
    }
  }
  else
  {
    id v22 = [v11 objectForKey:@"suggestionID"];
    id v32 = _mo_log_facility_get_os_log(&MOLogFacilityNotificationManager);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v22;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "submit Notification engagement using userInfo for suggID: %@", buf, 0xCu);
    }

    id v71 = [v11 objectForKey:@"bundleEndDate"];
    id v28 = [v11 objectForKey:@"analyticsDict"];
    if (v28) {
      [v13 addEntriesFromDictionary:v28];
    }
    if (v12 && a5 - 3 <= 1)
    {
      id v29 = v10;
      [v70 timeIntervalSinceDate:v12];
      id v31 = kMONotifications_engagementNotificationLatency;
      goto LABEL_15;
    }
  }

  if (v12 && v71)
  {
    [v12 timeIntervalSinceDate:v71];
    id v35 = +[NSNumber numberWithInteger:vcvtmd_s64_f64(v34 / 60.0)];
    [v13 setObject:v35 forKeyedSubscript:@"suggestionNotificationLatency"];
  }
  id v36 = [(MONotificationsManager *)self defaultsManager];
  id v37 = [v36 objectForKey:@"UserNotificationScheduleInMinutesArray"];

  id v38 = [v37 count];
  id v39 = v38;
  if (v37) {
    BOOL v40 = v38 == 0;
  }
  else {
    BOOL v40 = 1;
  }
  uint64_t v41 = !v40;
  id v42 = [v37 isEqualToArray:&off_1002F8F18];
  id v43 = +[NSNumber numberWithBool:v41];
  [v13 setObject:v43 forKeyedSubscript:@"hasJournalSchedule"];

  id v44 = +[NSNumber numberWithBool:v42];
  [v13 setObject:v44 forKeyedSubscript:@"isOnDefaultNotificationSchedule"];

  double v45 = +[NSNumber numberWithUnsignedInteger:v39];
  [v13 setObject:v45 forKeyedSubscript:@"numScheduledDays"];

  float v46 = +[NSNumber numberWithInteger:[(MONotificationsManager *)self getNotificationScheduledDeliverySetting]];
  [v13 setObject:v46 forKeyedSubscript:@"scheduledDeliverySetting"];

  if (v11)
  {
    float v47 = [v11 objectForKeyedSubscript:@"postingScheduleType"];

    if (v47)
    {
      uint64_t v48 = [v11 objectForKeyedSubscript:@"postingScheduleType"];
      [v13 setObject:v48 forKeyedSubscript:@"postingScheduleType"];
    }
  }
  long long v49 = [(MONotificationsManager *)self defaultsManager];
  int v50 = [v49 objectForKey:@"OnboardingDate"];

  id v51 = [(MONotificationsManager *)self configManager];
  LODWORD(v52) = 14.0;
  [v51 getFloatSettingForKey:@"UserNotificationMaximumDaysForOnboarding" withFallback:v52];
  float v54 = v53;

  BOOL v56 = 0;
  if (v50)
  {
    [v70 timeIntervalSinceDate:v50];
    if (v55 < (float)(v54 * 86400.0)) {
      BOOL v56 = 1;
    }
  }
  id v57 = +[NSNumber numberWithBool:v56];
  [v13 setObject:v57 forKeyedSubscript:@"recentOnboarding"];

  if (v11)
  {
    uint64_t v58 = [v11 objectForKeyedSubscript:@"numSuggestionInNotification"];

    if (v58)
    {
      v59 = [v11 objectForKeyedSubscript:@"numSuggestionInNotification"];
      [v13 setObject:v59 forKeyedSubscript:@"numSuggestionInNotification"];
    }
  }
  v60 = [(MONotificationsManager *)self configManager];
  unsigned __int8 v61 = [v60 getTrialExperimentIdentifiers];

  if (v61)
  {
    v62 = [v61 experimentId];
    [v13 setObject:v62 forKeyedSubscript:@"trialExperimentId"];

    uint64_t v63 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v61 deploymentId]);
    id v64 = [v63 stringValue];
    [v13 setObject:v64 forKeyedSubscript:@"trialDeploymentId"];

    uint64_t v65 = [v61 treatmentId];
    [v13 setObject:v65 forKeyedSubscript:@"trialTreatmentId"];
  }
  AnalyticsSendEvent();
  v66 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v73 = v13;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Notification analytics submitted: %{private}@", buf, 0xCu);
  }
}

- (id)getBiomeContextDictionaryWithUserInfo:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setObject:@"com.apple.momentsd.MOUserNotifications" forKey:@"clientIdentifier"];
  BOOL v5 = [v3 objectForKey:@"numSuggestionInNotification"];
  if (v5) {
    [v4 setObject:v5 forKey:@"numSuggestionInNotification"];
  }
  dispatch_time_t v6 = [v3 objectForKey:@"postingDate"];
  if (v6) {
    [v4 setObject:v6 forKey:@"postingDate"];
  }

  return v4;
}

- (void)submitEngagementHistoryUpdateWithEvent:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKey:@"bundleID"];
  if (v8)
  {
    id v9 = [(MONotificationsManager *)self onboardingAndSettingsPersistence];
    id v10 = [v9 getSnapshotDictionaryForAnalytics];

    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    id v12 = [MOEventBundleFetchOptions alloc];
    id v21 = v11;
    id v13 = +[NSArray arrayWithObjects:&v21 count:1];
    uint64_t v14 = [(MOEventBundleFetchOptions *)v12 initWithIdentifiers:v13 ascending:0 filterBundle:0];

    float v15 = [(MONotificationsManager *)self eventBundleManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __74__MONotificationsManager_submitEngagementHistoryUpdateWithEvent_userInfo___block_invoke;
    v17[3] = &unk_1002CEC40;
    void v17[4] = self;
    id v18 = v7;
    id v19 = v6;
    id v20 = v10;
    id v16 = v10;
    [v15 fetchEventBundlesWithOptions:v14 CompletionHandler:v17];
  }
}

void __74__MONotificationsManager_submitEngagementHistoryUpdateWithEvent_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 count])
  {
    id v3 = [*(id *)(a1 + 32) getBiomeContextDictionaryWithUserInfo:*(void *)(a1 + 40)];
    [v3 setObject:v9 forKey:@"eventBundles"];
    BOOL v4 = [*(id *)(a1 + 32) configManager];
    BOOL v5 = [v4 getTrialExperimentIdentifiers];

    id v6 = [*(id *)(a1 + 32) engagementHistoryManager];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = +[NSDate now];
    [v6 didEngagementEventPosted:v7 withBundles:v9 timestamp:v8 withContext:v3 withTrialExperimentIDs:v5 withOnboardingStatus:*(void *)(a1 + 56)];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (UNUserNotificationCenter)userNotificationCenterSystemBranded
{
  return self->_userNotificationCenterSystemBranded;
}

- (void)setUserNotificationCenterSystemBranded:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenterAppBranded
{
  return self->_userNotificationCenterAppBranded;
}

- (void)setUserNotificationCenterAppBranded:(id)a3
{
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (MOEngagementHistoryManager)engagementHistoryManager
{
  return self->_engagementHistoryManager;
}

- (MOEventBundleManager)eventBundleManager
{
  return self->_eventBundleManager;
}

- (void)setEventBundleManager:(id)a3
{
}

- (MOOnboardingAndSettingsPersistence)onboardingAndSettingsPersistence
{
  return self->_onboardingAndSettingsPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingAndSettingsPersistence, 0);
  objc_storeStrong((id *)&self->_eventBundleManager, 0);
  objc_storeStrong((id *)&self->_engagementHistoryManager, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterAppBranded, 0);
  objc_storeStrong((id *)&self->_userNotificationCenterSystemBranded, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __83__MONotificationsManager_checkAuthorizationStatusForNotificationCenter_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "Notifications authorization status: %lu", v2);
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "System notifications not authorized", v2, v3, v4, v5, v6);
}

void __112__MONotificationsManager__serviceSuggestionsNotificationsInternalUsingTrigger_useAppSchedule_completionHandler___block_invoke_577_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "Bundle fetch error: %@", v4, v5, v6, v7, v8);
}

- (void)_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Requesting test notification bundles", v2, v3, v4, v5, v6);
}

- (void)_serviceSuggestionsNotificationsEnablingTest:withOptions:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, v0, v1, "targetIdentifiers: %@", v2);
}

void __101__MONotificationsManager__serviceSuggestionsNotificationsEnablingTest_withOptions_completionHandler___block_invoke_608_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1 count]);
  OUTLINED_FUNCTION_6_0();
  uint8_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "using %@ test identifiers: %@", v5, 0x16u);
}

- (void)setupPeriodicTimeToWriteMomentsNotificationsWithSchedule:(uint64_t)a1 options:handler:.cold.1(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "Scheduled notification time out of week range. dateInMinutes: %@", v4, v5, v6, v7, v8);
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "No date components set for fallback notifications", v2, v3, v4, v5, v6);
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "App branded notification unauthorized", v2, v3, v4, v5, v6);
}

void __89__MONotificationsManager_setupFallbackAppBrandedNotificationsWithDateComponents_handler___block_invoke_637_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, a2, v4, "Fallback app repeating trigger scheduled, error: %@", v5);
}

- (void)_getArrayScheduledDateComponents
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "No set scheduled stored", v2, v3, v4, v5, v6);
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Requesting event bundles from Prompt Manager (to self)", v2, v3, v4, v5, v6);
}

- (void)_getNewTargetTimeToWriteEventBundlesUsingAppSchedule:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Lookback window onboarding start date is after NOW, use default start date to define lookback window instead, %@", v1, 0xCu);
}

void __101__MONotificationsManager__getNewTargetTimeToWriteEventBundlesUsingAppSchedule_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Not enough non-evergreen bundles to notify user during onboarding period.", v2, v3, v4, v5, v6);
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Can't get action URL for system moments notifications", v2, v3, v4, v5, v6);
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Soft link Moments framework skipped", v2, v3, v4, v5, v6);
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Won't post time to write notification for 'empty label' bundles", v2, v3, v4, v5, v6);
}

- (void)_postTimeToWriteSystemNotificationUsingEventBundles:withTrigger:usingAppSchedule:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "1st label: %@, 2nd: %@", v2, 0x16u);
}

void __125__MONotificationsManager__postTimeToWriteSystemNotificationUsingEventBundles_withTrigger_usingAppSchedule_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) nextTriggerDate];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_3((void *)&_mh_execute_header, a2, v4, "trigger.nextTriggerDate: %@", v5);
}

@end