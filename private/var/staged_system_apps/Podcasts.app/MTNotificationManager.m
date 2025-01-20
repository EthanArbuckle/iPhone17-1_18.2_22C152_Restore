@interface MTNotificationManager
- (BOOL)autoSimulateNotificationOnAppActivate;
- (BOOL)canPromptForNotificationPermissionsWithPreWarmSheet;
- (BOOL)canSendNewEpisodeAlerts;
- (MTNotificationManager)init;
- (OS_dispatch_queue)workQueue;
- (id)computeNotificationsWithSchedulingOptions:(unint64_t)a3;
- (id)debugTestCases;
- (id)preWarmSheetMetricsOverlayDictionary;
- (void)_handleClearHistoryAction;
- (void)_handleShowNotificationsDebugMenuAction;
- (void)_showDetailUsingURL:(id)a3;
- (void)clearAllLocalNotifications;
- (void)clearAllNotifications;
- (void)determineCanSendNewEpisodeAlertsWithSchedulingOptions:(unint64_t)a3 completion:(id)a4;
- (void)markEpisodesAsNotified:(id)a3;
- (void)playPodcastDefaultBehaviorForNotificationEpisode:(id)a3;
- (void)playPodcastNotificationEpisodes:(id)a3;
- (void)postLocalNotificationForPlayerItem:(id)a3;
- (void)processNotificationsForDebuggingWithCompletion:(id)a3;
- (void)processNotificationsWithReason:(id)a3;
- (void)processNotificationsWithSchedulingOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)requestNotificationPermissionsIfNeeded;
- (void)requestNotificationPermissionsWithPreWarmSheetIfNeeded;
- (void)scheduleLocalNotificationForPodcast:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5;
- (void)scheduleLocalNotifications:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5;
- (void)sendMostRecentNotification;
- (void)sendOldestNotification;
- (void)sendRandomNotification;
- (void)setAutoSimulateNotificationOnAppActivate:(BOOL)a3;
- (void)setUpNotificationStatusIsAuthorizedUpdates;
- (void)showPodcastDetailForOneShowWithMultipleNotificationEpisodes:(id)a3;
- (void)showPodcastDetailForOneShowWithOneNotificationEpisode:(id)a3;
- (void)simulateAnyTestNotification;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MTNotificationManager

- (BOOL)autoSimulateNotificationOnAppActivate
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 BOOLForKey:@"MTDebugNotificationUI-SimulateOnAppActivate"];

  return +[IMRuntimeUtil associatedBoolValueForKey:@"MTAutoSimulateNotificationOnAppActivate" onObject:self withDefault:v4];
}

- (void)setUpNotificationStatusIsAuthorizedUpdates
{
  uint64_t v2 = MTApplicationDidBecomeActiveNotification;
  id v5 = +[NSNotificationCenter defaultCenter];
  v3 = +[NSOperationQueue mainQueue];
  id v4 = [v5 addObserverForName:v2 object:0 queue:v3 usingBlock:&stru_10054DA90];
}

- (MTNotificationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTNotificationManager;
  uint64_t v2 = [(MTNotificationManager *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    [(MTNotificationManager *)v2 setUpNotificationStatusIsAuthorizedUpdates];
    v7 = +[UNUserNotificationCenter currentNotificationCenter];
    [v7 setDelegate:v2];
  }
  return v2;
}

- (void)requestNotificationPermissionsIfNeeded
{
  uint64_t v2 = +[UNUserNotificationCenter currentNotificationCenter];
  v3 = +[UNNotificationCategory mt_allSupportedNotificationCategories];
  [v2 setNotificationCategories:v3];

  id v4 = +[UNUserNotificationCenter currentNotificationCenter];
  [v4 requestAuthorizationWithOptions:38 completionHandler:&stru_10054DB10];
}

- (BOOL)canPromptForNotificationPermissionsWithPreWarmSheet
{
  uint64_t v2 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:kMTDidPromptForNotificationsPermissionsKey];

  if (v3)
  {
    id v4 = _MTLogCategoryNotifications();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User was already prompted for notification permissions. Not showing pre-warming sheet.", buf, 2u);
    }
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  dispatch_queue_t v5 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  id v4 = [v5 objectForKey:kMTNotificationsPreWarmSheetShownDateKey];

  if (v4)
  {
    id v6 = objc_alloc_init((Class)NSDate);
    [v6 timeIntervalSinceDate:v4];
    if (fabs(v7) < 432000.0)
    {
      objc_super v9 = _MTLogCategoryNotifications();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User was shown the pre-warming sheet within the last five days. Not showing pre-warming sheet.", v11, 2u);
      }

      goto LABEL_11;
    }
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void)requestNotificationPermissionsWithPreWarmSheetIfNeeded
{
  if ([(MTNotificationManager *)self canPromptForNotificationPermissionsWithPreWarmSheet])
  {
    unsigned int v3 = +[AMSUserNotificationAuthorizationTask engagementRequestForFullSheet];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100064C28;
    v4[3] = &unk_10054DBC0;
    v4[4] = self;
    [v3 addFinishBlock:v4];
  }
}

- (id)preWarmSheetMetricsOverlayDictionary
{
  id v2 = objc_alloc_init((Class)_TtC8ShelfKit26UniversalMetricsDictionary);
  unsigned int v3 = [v2 dictionary];
  id v4 = [v3 mutableCopy];

  dispatch_queue_t v5 = +[MetricsActivity shared];
  uint64_t v6 = [v5 pageContext];
  double v7 = (void *)v6;
  BOOL v8 = &stru_10056A8A0;
  if (v6) {
    BOOL v8 = (__CFString *)v6;
  }
  objc_super v9 = v8;

  [v4 setValue:v9 forKey:@"pageContext"];
  [v4 setValue:@"xp_amp_podcasts_main" forKey:@"topic"];
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  v11 = +[AnalyticsIdentifierManager sharedInstance];
  v12 = [v11 identifierPromise];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000651B4;
  v18[3] = &unk_10054DBE8;
  id v19 = v4;
  id v13 = v10;
  id v20 = v13;
  id v14 = v4;
  [v12 addFinishBlock:v18];

  v15 = v20;
  id v16 = v13;

  return v16;
}

- (void)determineCanSendNewEpisodeAlertsWithSchedulingOptions:(unint64_t)a3 completion:(id)a4
{
  char v4 = a3;
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = +[PodcastsApplicationStateMonitor shared];
    id v7 = [v6 currentState];

    if ((v4 & 1) != 0 || v7 == (id)2)
    {
      id v10 = +[UNUserNotificationCenter currentNotificationCenter];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000654C0;
      v11[3] = &unk_10054DC10;
      id v12 = v5;
      [v10 getNotificationSettingsWithCompletionHandler:v11];
    }
    else
    {
      BOOL v8 = _MTLogCategoryNotifications();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v9 = +[PodcastsApplicationStateMonitor descriptionForState:v7];
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "canSendNotifications is NO (reason: appState = %@)", buf, 0xCu);
      }
      (*((void (**)(id, void))v5 + 2))(v5, 0);
    }
  }
}

- (BOOL)canSendNewEpisodeAlerts
{
  return +[PFNotificationSettings canSendNotification];
}

- (void)processNotificationsWithReason:(id)a3
{
}

- (void)processNotificationsForDebuggingWithCompletion:(id)a3
{
}

- (void)processNotificationsWithSchedulingOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _MTLogCategoryNotifications();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = _MTLogCategoryNotifications();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ProcessNotifications", "SchedulingOptions=%{name=schedulingOptions}lu Reason=%{name=reason}@", buf, 0x16u);
  }

  id v14 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[BEGIN] processing notifications for '%@' (scheduling options = %d)", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  UIBackgroundTaskIdentifier v32 = UIBackgroundTaskInvalid;
  v15 = +[UIApplication sharedApplication];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100065910;
  v30[3] = &unk_10054D8A0;
  v30[4] = buf;
  id v16 = [v15 beginBackgroundTaskWithExpirationHandler:v30];
  *(void *)(*(void *)&buf[8] + 24) = v16;

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100065970;
  v25[3] = &unk_10054DC38;
  id v17 = v8;
  id v26 = v17;
  id v18 = v9;
  id v27 = v18;
  v28 = buf;
  os_signpost_id_t v29 = v11;
  id v19 = objc_retainBlock(v25);
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100065ACC;
  v21[3] = &unk_10054DCB0;
  objc_copyWeak(v23, &location);
  id v20 = v19;
  id v22 = v20;
  v23[1] = (id)a3;
  [(MTNotificationManager *)self determineCanSendNewEpisodeAlertsWithSchedulingOptions:a3 completion:v21];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
}

- (void)markEpisodesAsNotified:(id)a3
{
  id v3 = a3;
  char v4 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 descriptionForNotificationLogging];
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Marking as notified: %@", buf, 0xCu);
  }
  uint64_t v6 = +[MTDB sharedInstance];
  id v7 = [v6 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100065E10;
  v10[3] = &unk_10054D9B0;
  id v11 = v3;
  id v12 = v7;
  id v8 = v7;
  id v9 = v3;
  [v8 performBlockAndWait:v10];
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  uint64_t v6 = +[IMURLBag sharedInstance];
  id v7 = +[AMSUserNotification notificationCenter:v8 didChangeSettings:v5 bag:v6];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse", buf, 2u);
  }

  if (+[AMSUserNotification shouldHandleNotificationResponse:v9])
  {
    id v12 = _MTLogCategoryNotifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handing notification response over to AMS for further processing", buf, 2u);
    }

    id v13 = +[IMURLBag sharedInstance];
    id v14 = +[AMSUserNotification handleNotificationResponse:v9 bag:v13];
    v10[2](v10);
  }
  else
  {
    v15 = [v9 actionIdentifier];
    unsigned int v16 = [v15 isEqualToString:@"debugAction-showSettings"];

    id v17 = [v9 notification];
    id v13 = v17;
    if (v16)
    {
      [(MTNotificationManager *)self userNotificationCenter:v8 openSettingsForNotification:v17];
    }
    else
    {
      id v18 = [v17 request];
      id v19 = [v18 content];

      id v20 = [v19 mt_notificationEpisodes];
      v21 = _MTLogCategoryNotifications();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v20 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v50 = (uint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for %lu episodes", buf, 0xCu);
      }

      v23 = [v20 mt_compactMap:&stru_10054DCF0];
      v24 = +[NSSet setWithArray:v23];
      id v25 = [v24 count];

      if (v25)
      {
        v41 = self;
        uint64_t v26 = [v9 mt_actionType];
        v45 = v19;
        id v46 = v8;
        if (!v26 && v25 == (id)1)
        {
          if ([v20 count] == (id)1) {
            uint64_t v26 = 3;
          }
          else {
            uint64_t v26 = 4;
          }
        }
        v42 = +[MTFeedUpdateMetricsAction notificationTapped];
        v43 = +[MTFeedUpdateMetricsDataKey actionType];
        v47[0] = v43;
        id v27 = +[NSNumber numberWithInteger:v26];
        v48[0] = v27;
        v28 = +[MTFeedUpdateMetricsDataKey uniquePodcastUuidCount];
        v47[1] = v28;
        os_signpost_id_t v29 = +[NSNumber numberWithUnsignedInteger:v25];
        v48[1] = v29;
        v30 = +[MTFeedUpdateMetricsDataKey notificationEpisodesCount];
        v47[2] = v30;
        v44 = v20;
        v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 count]);
        v48[2] = v31;
        UIBackgroundTaskIdentifier v32 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
        +[IMMetrics recordUserAction:v42 dataSource:0 withData:v32];

        v33 = _MTLogCategoryNotifications();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v50 = v26;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for actionType %lu", buf, 0xCu);
        }

        id v19 = v45;
        id v8 = v46;
        id v20 = v44;
        switch(v26)
        {
          case 0:
            v34 = _MTLogCategoryDefault();
            if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              goto LABEL_27;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v9;
            v35 = "Unexpected notification action type encountered in %@";
            v36 = v34;
            os_log_type_t v37 = OS_LOG_TYPE_ERROR;
            uint32_t v38 = 12;
            goto LABEL_26;
          case 1:
            v40 = [v44 firstObject];
            [(MTNotificationManager *)v41 playPodcastDefaultBehaviorForNotificationEpisode:v40];
            goto LABEL_31;
          case 2:
            [(MTNotificationManager *)v41 playPodcastNotificationEpisodes:v44];
            break;
          case 3:
            v40 = [v44 firstObject];
            [(MTNotificationManager *)v41 showPodcastDetailForOneShowWithOneNotificationEpisode:v40];
LABEL_31:

            break;
          case 4:
            [(MTNotificationManager *)v41 showPodcastDetailForOneShowWithMultipleNotificationEpisodes:v44];
            break;
          default:
            break;
        }
      }
      else
      {
        v39 = _MTLogCategoryDefault();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = (uint64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unexpected notification content [no podcasts] in response %@", buf, 0xCu);
        }

        v34 = _MTLogCategoryNotifications();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v35 = "didReceiveNotificationResponse failed to find unique podcast UUID";
          v36 = v34;
          os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
          uint32_t v38 = 2;
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, v38);
        }
LABEL_27:
      }
      v10[2](v10);

      id v13 = v19;
    }
  }
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 request];
  id v8 = [v7 content];
  id v9 = [v8 mt_podcastUuid];

  id v10 = +[NSNotificationCenter defaultCenter];
  id v11 = +[UIApplication sharedApplication];
  [v11 beginIgnoringInteractionEvents];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100056E40;
  v36 = sub_1000571F8;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000669B4;
  v25[3] = &unk_10054DD18;
  v28 = v30;
  os_signpost_id_t v29 = &v32;
  id v12 = v10;
  id v26 = v12;
  id v13 = v9;
  id v27 = v13;
  id v14 = objc_retainBlock(v25);
  v15 = +[UIApplication sharedApplication];
  id v16 = [v15 applicationState];

  if (v16)
  {
    id v17 = +[NSOperationQueue mainQueue];
    uint64_t v18 = MTApplicationDidBecomeActiveNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    id v23[2] = sub_100066A7C;
    v23[3] = &unk_10054DD40;
    id v19 = v14;
    id v24 = v19;
    uint64_t v20 = [v12 addObserverForName:v18 object:0 queue:v17 usingBlock:v23];
    v21 = (void *)v33[5];
    v33[5] = v20;

    dispatch_time_t v22 = dispatch_time(0, 1000000000);
    dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, v19);
  }
  else
  {
    ((void (*)(void *))v14[2])(v14);
  }

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  id v6 = [a4 request];
  uint64_t v7 = (uint64_t)((void)objc_msgSend(v6, "mt_schedulingOptions") << 63) >> 63;

  v8[2](v8, v7);
}

- (void)showPodcastDetailForOneShowWithOneNotificationEpisode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[MTDB sharedInstance];
    id v6 = [v5 mainQueueContext];
    uint64_t v7 = [v4 uuid];
    id v8 = [v6 episodeForUuid:v7];

    if (v8) {
      [v8 displayURL];
    }
    else {
    id v9 = [MTPodcast productURLForStoreCollectionId:[v4 podcastStoreCollectionId] storeTrackId:[v4 storeTrackId]];
    }
    id v10 = _MTLogCategoryNotifications();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        id v12 = [v9 absoluteString];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with one episode with URL %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v11)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with one episode with null URL", (uint8_t *)&v13, 2u);
    }

    [(MTNotificationManager *)self _showDetailUsingURL:v9];
  }
  else
  {
    id v9 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid parameter", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)showPodcastDetailForOneShowWithMultipleNotificationEpisodes:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1)
  {
    id v5 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Invalid parameter", (uint8_t *)&v15, 2u);
    }
  }
  if ([v4 count])
  {
    id v6 = [v4 firstObject];
    uint64_t v7 = +[MTDB sharedInstance];
    id v8 = [v7 mainOrPrivateContext];
    id v9 = [v6 podcastUuid];
    id v10 = [v8 podcastForUuid:v9];

    if (v10) {
      [v10 displayURL];
    }
    else {
    BOOL v11 = +[MTPodcast productURLForStoreCollectionId:storeTrackId:](MTPodcast, "productURLForStoreCollectionId:storeTrackId:", [v6 podcastStoreCollectionId], 0);
    }
    id v12 = _MTLogCategoryNotifications();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        id v14 = [v11 absoluteString];
        int v15 = 138412290;
        id v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with multiple episodes with URL %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Showing Podcast Details with multiple episodes with URL", (uint8_t *)&v15, 2u);
    }

    [(MTNotificationManager *)self _showDetailUsingURL:v11];
  }
}

- (void)_showDetailUsingURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066FC8;
    block[3] = &unk_10054D570;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

- (void)playPodcastDefaultBehaviorForNotificationEpisode:(id)a3
{
  id v3 = a3;
  id v4 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode", buf, 2u);
  }

  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  uint64_t v7 = [v3 uuid];
  if (v7)
  {
    id v8 = [v3 uuid];
    id v9 = [v6 episodeForUuid:v8];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      BOOL v11 = [v3 uuid];
      id v12 = +[MTPlaybackQueueFactory playEpisodeUuid:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
  }
  id v13 = [v3 storeTrackId];
  id v14 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = [v3 uuid];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode failed manifest from episode uuid %@. Will attempt to create from adam ID %lld", buf, 0x16u);
  }
  if (+[MTStoreIdentifier isNotEmpty:v13]
    && (id v16 = [MTNetworkMediaManifest alloc],
        +[NSString stringWithFormat:@"%llu", v13],
        id v17 = objc_claimAutoreleasedReturnValue(),
        id v12 = [(MTNetworkMediaManifest *)v16 initWithEpisodeAdamId:v17 assetInfo:0], v17, v12))
  {
LABEL_10:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v18 = +[UIApplication sharedApplication];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    id v23[2] = sub_100067420;
    v23[3] = &unk_10054D8A0;
    void v23[4] = buf;
    id v19 = [v18 beginBackgroundTaskWithName:@"com.apple.podcasts.NotifcationStartPlayback" expirationHandler:v23];

    *(void *)(*(void *)&buf[8] + 24) = v19;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100067480;
    v22[3] = &unk_10054DD68;
    v22[4] = buf;
    uint64_t v20 = objc_retainBlock(v22);
    if (os_feature_enabled_bluemoon())
    {
      v21 = +[UIApplication sharedPlaybackController];
      [v21 playManifest:v12 waitingForEngine:1 completion:v20];
    }
    else
    {
      v21 = +[MTPlayerController defaultInstance];
      [v21 playManifest:v12 reason:13 interactive:0 completion:v20];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = _MTLogCategoryNotifications();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastDefaultBehaviorForNotificationEpisode failed to create manifest", buf, 2u);
    }
  }
}

- (void)playPodcastNotificationEpisodes:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  uint64_t v21 = (uint64_t)sub_10006A51C;
  dispatch_time_t v22 = &unk_10054DF30;
  id v23 = v5;
  id v6 = v5;
  uint64_t v7 = [v3 mt_compactMap:&buf];

  id v8 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse playPodcastNotificationEpisodes for %lu episodes", (uint8_t *)&buf, 0xCu);
  }

  if ([v7 count])
  {
    BOOL v10 = [[MTItemListManifest alloc] initWithItems:v7];
    if (v10) {
      goto LABEL_9;
    }
  }
  BOOL v11 = [v3 mt_compactMap:&stru_10054DF70];
  id v12 = [v11 mt_compactMap:&stru_10054DDA8];
  id v13 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastNotificationEpisodes failed manifest from episode uuids. Will attempt to create from adam IDs %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v11 count])
  {
    BOOL v10 = [[MTNetworkMediaManifest alloc] initWithEpisodeAdamIds:v12 assetInfo:0];

    if (v10)
    {
LABEL_9:
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v21 = 0x2020000000;
      dispatch_time_t v22 = 0;
      id v14 = +[UIApplication sharedApplication];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100067920;
      v19[3] = &unk_10054D8A0;
      v19[4] = &buf;
      id v15 = [v14 beginBackgroundTaskWithName:@"com.apple.podcasts.NotifcationStartPlayback" expirationHandler:v19];

      *(void *)(*((void *)&buf + 1) + 24) = v15;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100067980;
      v18[3] = &unk_10054DD68;
      void v18[4] = &buf;
      id v16 = objc_retainBlock(v18);
      if (os_feature_enabled_bluemoon())
      {
        id v17 = +[UIApplication sharedPlaybackController];
        [v17 playManifest:v10 waitingForEngine:1 completion:v16];
      }
      else
      {
        id v17 = +[MTPlayerController defaultInstance];
        [v17 playManifest:v10 reason:13 interactive:0 completion:v16];
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_16;
    }
  }
  else
  {
  }
  _MTLogCategoryNotifications();
  BOOL v10 = (MTNetworkMediaManifest *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "didReceiveNotificationResponse playPodcastNotificationEpisodes failed to create manifest", (uint8_t *)&buf, 2u);
  }
LABEL_16:
}

- (id)computeNotificationsWithSchedulingOptions:(unint64_t)a3
{
  char v80 = a3;
  v65 = objc_alloc_init(MTNotificationInfo);
  id v3 = +[MTEpisode predicateForEpisodesPublishedThisWeek];
  id v4 = +[MTEpisode predicateForEpisodesPriceTypeChangedThisWeek];
  v63 = [v3 OR:v4];

  id v5 = +[MTEpisode predicateForIsNew:1];
  id v6 = +[MTEpisode predicateForSentNotification:0];
  uint64_t v7 = [v5 AND:v6];
  id v8 = +[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  id v9 = [v7 AND:v8];
  BOOL v10 = +[MTEpisode predicateForEntitledEpisodes];
  BOOL v11 = [v9 AND:v10];
  id v12 = [v11 AND:v63];

  id v13 = +[MTDB sharedInstance];
  id v14 = [v13 privateQueueContext];

  id v15 = NSStringFromSelector("bestTitle");
  id v16 = NSStringFromSelector("bestSummary");
  v62 = +[MTPodcast allPossibleEpisodeListSortOrderProperties];
  uint64_t v75 = kEpisodeStoreTrackId;
  uint64_t v76 = kEpisodeUuid;
  v108[0] = kEpisodeUuid;
  v108[1] = kEpisodeStoreTrackId;
  uint64_t v73 = kEpisodeDuration;
  uint64_t v74 = kEpisodePubDate;
  v108[2] = kEpisodePubDate;
  v108[3] = kEpisodeDuration;
  uint64_t v71 = kEpisodeVideo;
  uint64_t v72 = kEpisodeByteSize;
  v108[4] = kEpisodeByteSize;
  v108[5] = kEpisodeVideo;
  v108[6] = kEpisodeSentNotification;
  v108[7] = kEpisodePodcastUuid;
  uint64_t v70 = kEpisodePodcastUuid;
  uint64_t v68 = kPodcastStoreCollectionId;
  id v17 = +[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:");
  v108[8] = v17;
  uint64_t v69 = kPodcastTitle;
  uint64_t v18 = +[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:");
  v108[9] = v18;
  uint64_t v66 = kPodcastNotifications;
  id v19 = +[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:");
  v108[10] = v19;
  uint64_t v64 = kPodcastSubscribed;
  uint64_t v20 = +[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:");
  v108[11] = v20;
  v61 = +[NSArray arrayWithObjects:v108 count:12];

  uint64_t v21 = +[NSSet setWithArray:v61];
  dispatch_time_t v22 = [v21 setByAddingObjectsFromArray:v62];
  id v23 = [v22 allObjects];

  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = sub_100056E40;
  v103 = sub_1000571F8;
  id v104 = 0;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10006838C;
  v92[3] = &unk_10054DDF8;
  id v93 = v14;
  id v58 = v12;
  id v94 = v58;
  id v60 = v23;
  id v95 = v60;
  id v78 = v15;
  id v96 = v78;
  id v77 = v16;
  id v97 = v77;
  v98 = &v99;
  id v59 = v93;
  [v93 performBlockAndWait:v92];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = (id)v100[5];
  id v24 = [obj countByEnumeratingWithState:&v88 objects:v107 count:16];
  if (v24)
  {
    uint64_t v79 = *(void *)v89;
    do
    {
      id v81 = v24;
      for (i = 0; i != v81; i = (char *)i + 1)
      {
        if (*(void *)v89 != v79) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if ((v80 & 2) != 0) {
          goto LABEL_9;
        }
        id v27 = +[MTEpisode propertyPathForPodcastProperty:v66];
        v28 = [v26 objectForKeyedSubscript:v27];
        unsigned __int8 v29 = [v28 BOOLValue];

        if (v29)
        {
          v30 = +[MTEpisode propertyPathForPodcastProperty:v64];
          char v31 = [v26 objectForKeyedSubscript:v30];
          unsigned int v32 = [v31 BOOLValue];

          if (v32)
          {
LABEL_9:
            v33 = [v26 objectForKeyedSubscript:v76];
            uint64_t v34 = [v26 objectForKeyedSubscript:v75];
            id v82 = [v34 longLongValue];

            v87 = [v26 objectForKeyedSubscript:v78];
            v83 = [v26 objectForKeyedSubscript:v77];
            v84 = [v26 objectForKeyedSubscript:v74];
            v86 = [v26 objectForKeyedSubscript:v73];
            v85 = [v26 objectForKeyedSubscript:v72];
            v35 = [v26 objectForKeyedSubscript:v71];
            v36 = [v26 objectForKeyedSubscript:v70];
            id v37 = +[MTEpisode propertyPathForPodcastProperty:v69];
            uint32_t v38 = [v26 objectForKeyedSubscript:v37];

            v39 = +[MTEpisode propertyPathForPodcastProperty:v68];
            v40 = [v26 objectForKeyedSubscript:v39];
            id v41 = [v40 longLongValue];

            v42 = +[MTPodcast allPossibleEpisodeListSortOrderProperties];
            v43 = [v26 mt_subdictionaryWithKeys:v42];

            if (v33 && v87 && v36 && v38)
            {
              v44 = [(MTNotificationInfo *)v65 podcastForUuid:v36];
              if (!v44)
              {
                v44 = [(MTNotificationInfo *)v65 addPodcastWithTitle:v38 uuid:v36];
              }
              v45 = v33;
              id v46 = [MTNotificationEpisode alloc];
              [v86 doubleValue];
              double v48 = v47;
              id v49 = [v85 longLongValue];
              LOBYTE(v57) = [v35 BOOLValue];
              uint64_t v50 = [(MTNotificationEpisode *)v46 initWithUuid:v45 storeTrackId:v82 bestTitle:v87 bestSummary:v83 pubDate:v84 duration:v49 byteSize:v48 isVideo:v57 sortPropertyValues:v43 podcastUuid:v36 podcastTitle:v38 podcastStoreCollectionId:v41];
              [v44 addEpisode:v50];
              v51 = _MTLogCategoryNotifications();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 134217984;
                id v106 = v82;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Adding episode for user notification item - episode %lld", buf, 0xCu);
              }

              v33 = v45;
            }
          }
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v88 objects:v107 count:16];
    }
    while (v24);
  }

  v52 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = [(MTNotificationInfo *)v65 descriptionForNotificationLogging];
    *(_DWORD *)long long buf = 138412290;
    id v106 = v53;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Computed notification items: %@", buf, 0xCu);
  }
  v54 = v97;
  v55 = v65;

  _Block_object_dispose(&v99, 8);

  return v55;
}

- (void)scheduleLocalNotifications:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000687B0;
  v20[3] = &unk_10054D6E8;
  id v9 = a5;
  id v21 = v9;
  BOOL v10 = objc_retainBlock(v20);
  BOOL v11 = [v8 podcasts];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    ((void (*)(void *))v10[2])(v10);
  }
  else
  {
    objc_initWeak(&location, self);
    id v13 = _MTLogCategoryNotifications();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 descriptionForNotificationLogging];
      *(_DWORD *)long long buf = 138412290;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to post notifications for: %@", buf, 0xCu);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000687C8;
    v15[3] = &unk_10054DE20;
    objc_copyWeak(v18, &location);
    id v16 = v8;
    v18[1] = (id)a4;
    id v17 = v10;
    [(MTNotificationManager *)self determineCanSendNewEpisodeAlertsWithSchedulingOptions:a4 completion:v15];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

- (void)postLocalNotificationForPlayerItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 podcastUuid];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [v3 artworkUrl];
    id v6 = [v7 absoluteString];
  }
  id v8 = +[NSMutableArray array];
  id v9 = +[PUIObjCArtworkProvider shared];
  BOOL v10 = [v3 podcastUuid];
  BOOL v11 = [v3 artworkUrl];
  BOOL v12 = [v11 absoluteString];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100068BE4;
  v16[3] = &unk_10054DE70;
  id v17 = v6;
  id v18 = v8;
  id v19 = v3;
  id v13 = v3;
  id v14 = v8;
  id v15 = v6;
  [v9 artworkPathForShow:v10 size:v12 source:v16 completionHandler:0x50uLL, 0x50uLL];
}

- (void)scheduleLocalNotificationForPodcast:(id)a3 schedulingOptions:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v35 = a5;
  v36 = [v6 title];
  uint64_t v7 = [v6 episodes];
  id v8 = [v7 count];

  id v9 = +[UNNotificationCategory mt_localNotificationForNewEpisodesAvailable];
  if (v8 != (id)1)
  {
    uint64_t v34 = [v6 title];
    BOOL v11 = +[NSBundle mainBundle];
    id v15 = [v11 localizedStringForKey:@"NOTIFICATION_MULTIPLE_EPISODES_AVAILABLE_MESSAGE_BODY_FORMAT" value:&stru_10056A8A0 table:0];
    uint64_t v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v8);
LABEL_6:
    id v14 = (void *)v16;

    goto LABEL_7;
  }
  BOOL v10 = [v6 episodes];
  BOOL v11 = [v10 firstObject];

  uint64_t v34 = [v6 title];
  BOOL v12 = [v11 bestTitle];
  id v13 = [v12 length];

  if (!v13)
  {
    id v15 = +[NSBundle mainBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"NOTIFICATION_SINGLE_EPISODE_NO_TITLE_FOR_PODCAST_AVAILABLE_MESSAGE_BODY" value:&stru_10056A8A0 table:0];
    goto LABEL_6;
  }
  id v14 = [v11 bestTitle];
LABEL_7:

  id v17 = +[NSMutableArray array];
  id v18 = [v6 uuid];
  id v19 = _MTLogCategoryNotifications();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  id v21 = _MTLogCategoryNotifications();
  dispatch_time_t v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "LOAD_NOTIFICATION_ARTWORK", "", buf, 2u);
  }

  id v23 = _MTLogCategoryNotifications();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v6 descriptionForNotificationLogging];
    *(_DWORD *)long long buf = 138412290;
    v52 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loading image to attach to notification for: %@", buf, 0xCu);
  }
  uint64_t v25 = +[PUIObjCArtworkProvider shared];
  id v26 = [v6 uuid];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10006960C;
  v39[3] = &unk_10054DEC0;
  id v40 = v18;
  id v41 = v17;
  id v42 = v9;
  id v43 = v34;
  id v44 = v14;
  id v45 = v36;
  os_signpost_id_t v48 = v20;
  id v49 = v8;
  unint64_t v50 = a4;
  id v46 = v6;
  id v47 = v35;
  id v38 = v35;
  id v27 = v6;
  id v28 = v36;
  id v29 = v14;
  id v30 = v34;
  id v31 = v9;
  id v32 = v17;
  id v33 = v18;
  [v25 artworkPathForShow:v26 size:v39 completionHandler:0x50uLL, 0x50uLL];
}

- (void)clearAllNotifications
{
  id v2 = +[MTDB sharedInstance];
  id v3 = [v2 privateQueueContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100069EB4;
  v5[3] = &unk_10054D570;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlock:v5];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
}

- (void)setAutoSimulateNotificationOnAppActivate:(BOOL)a3
{
}

- (void)simulateAnyTestNotification
{
}

- (void)sendMostRecentNotification
{
}

- (void)sendOldestNotification
{
}

- (void)sendRandomNotification
{
}

- (void)clearAllLocalNotifications
{
}

- (id)debugTestCases
{
  objc_initWeak(&location, self);
  id v2 = [[_TtC8Podcasts25MTDebugActionTestCategory alloc] initWithName:@"NotificationsUI" title:@"User Notifications"];
  id v3 = [_TtC8Podcasts21MTDebugActionTestCase alloc];
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10011D750;
  BOOL v10 = &unk_1005521C8;
  objc_copyWeak(&v11, &location);
  id v4 = [(MTDebugActionTestCase *)v3 initWithCategory:v2 name:@"MTNotificationTestAction.DebugMenu" title:@"Testing Menu…" handler:&v7];
  id v13 = v4;
  id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

- (void)_handleShowNotificationsDebugMenuAction
{
  id v5 = +[MTNotificationTestActionFactory notificationTestActionsViewController];
  id v2 = +[UIWindow keyWindow];
  id v3 = [v2 rootViewController];
  id v4 = [v3 presentedViewController];

  [v4 pushViewController:v5 animated:1];
}

- (void)_handleClearHistoryAction
{
  id v2 = +[UNUserNotificationCenter currentNotificationCenter];
  [v2 removeAllDeliveredNotifications];

  id v3 = +[UNUserNotificationCenter currentNotificationCenter];
  [v3 removeAllPendingNotificationRequests];
}

@end