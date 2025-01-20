@interface BooksNotificationViewController
- (BCAppAnalyticsExtensionManager)analyticsManager;
- (BNFeedViewController)feedViewController;
- (BOOL)_isURLValid:(id)a3 hostPatterns:(id)a4 pathPatterns:(id)a5;
- (BooksNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TUISyncLayoutController)syncLayoutController;
- (id)appGroupIdentifierForBridge:(id)a3;
- (id)objectRegistrationsForBridge:(id)a3;
- (id)windowProviderForBridge:(id)a3;
- (void)_emitNotificationEngagementEventForResponse:(id)a3 notificationAction:(id)a4 actionType:(int64_t)a5;
- (void)_renderUserNotification:(id)a3;
- (void)_reportMetricsEvent:(id)a3;
- (void)_setupWithCompletion:(id)a3;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4;
- (void)setAnalyticsManager:(id)a3;
- (void)setFeedViewController:(id)a3;
- (void)syncLayoutControllerNeedsFlushing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BooksNotificationViewController

- (BooksNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BooksNotificationViewController;
  v4 = [(BooksNotificationViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = [objc_alloc((Class)BCAppAnalyticsExtensionManager) initWithUploadsEnabled:0];
    [(BooksNotificationViewController *)v4 setAnalyticsManager:v5];

    v6 = (TUISyncLayoutController *)[objc_alloc((Class)TUISyncLayoutController) initWithDelegate:v4];
    syncLayoutController = v4->_syncLayoutController;
    v4->_syncLayoutController = v6;
  }
  return v4;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v9 viewDidLoad];
  v3 = [(BooksNotificationViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v10);

  id v5 = objc_opt_new();
  [v5 expectedContentSize];
  double v7 = v6;

  -[BooksNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", Width, v7);
  +[BAEventReporter setupLibraryAnalyticsDataProvider];
  v8 = [(BooksNotificationViewController *)self analyticsManager];
  [v8 setupTrackingForRootViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(BooksNotificationViewController *)self feedViewController];

  if (v3)
  {
    v4 = [(BooksNotificationViewController *)self view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(BooksNotificationViewController *)self feedViewController];
    v14 = [v13 view];
    [v14 setFrame:v6, v8, v10, v12];
  }
  [(TUISyncLayoutController *)self->_syncLayoutController flush];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v5 viewWillAppear:a3];
  v4 = [(BooksNotificationViewController *)self analyticsManager];
  [v4 startSession];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v4 viewDidAppear:a3];
  [(BooksNotificationViewController *)self bc_analyticsVisibilityUpdateSubtree];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v4 viewWillDisappear:a3];
  [(BooksNotificationViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BooksNotificationViewController;
  [(BooksNotificationViewController *)&v8 viewDidDisappear:a3];
  objc_super v4 = BooksNotificationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "viewDidDisappear", buf, 2u);
  }

  [(BooksNotificationViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
  objc_super v5 = +[NSProcessInfo processInfo];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002E50;
  v6[3] = &unk_1000084B8;
  v6[4] = self;
  [v5 performExpiringActivityWithReason:@"uploading metrics" usingBlock:v6];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() userNotificationFromNotification:v4];
  double v6 = v5;
  if (v4)
  {
    double v7 = [v5 videoUrl];

    if (v7)
    {
      v15.receiver = self;
      v15.super_class = (Class)BooksNotificationViewController;
      [(BooksNotificationViewController *)&v15 didReceiveNotification:v4];
    }
    else
    {
      double v9 = +[BUBag defaultBag];
      double v10 = [v9 ixStoreSheetBooks];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100003084;
      v11[3] = &unk_100008508;
      id v12 = v6;
      v13 = self;
      id v14 = v4;
      [v10 valueWithCompletion:v11];
    }
  }
  else
  {
    objc_super v8 = BooksNotificationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100004FFC((uint64_t)self, v8);
    }
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = objc_opt_class();
  double v9 = [v6 notification];
  double v10 = [v8 userNotificationFromNotification:v9];

  double v11 = [v6 actionIdentifier];
  LODWORD(v9) = [v11 isEqualToString:UNNotificationDefaultActionIdentifier];

  id v52 = v7;
  v54 = v10;
  if (v9)
  {
    id v12 = [v10 defaultAction];
  }
  else
  {
    v13 = [v6 actionIdentifier];
    int v14 = [v13 isEqualToString:UNNotificationDismissActionIdentifier];

    if (v14)
    {
      id v12 = 0;
    }
    else
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      objc_super v15 = [v10 buttonActions];
      id v12 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v12)
      {
        uint64_t v16 = *(void *)v67;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v67 != v16) {
              objc_enumerationMutation(v15);
            }
            v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            v19 = [v18 identifier:v52];
            v20 = [v6 actionIdentifier];
            unsigned int v21 = [v19 isEqualToString:v20];

            if (v21)
            {
              id v12 = v18;
              goto LABEL_15;
            }
          }
          id v12 = [v15 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v12) {
            continue;
          }
          break;
        }
LABEL_15:
        double v10 = v54;
      }
    }
  }
  v22 = [v12 defaultURL:v52];
  if (objc_msgSend(v22, "bc_isBookStoreAddToWantToReadURL"))
  {
    uint64_t v23 = 3;
LABEL_29:
    v25 = BooksNotificationLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v73 = v26;
      __int16 v74 = 2048;
      uint64_t v75 = v23;
      id v27 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Report Figaro metrics for action type %ld", buf, 0x16u);
    }
    v28 = [v12 metricsEvent];
    [(BooksNotificationViewController *)self _reportMetricsEvent:v28];
    goto LABEL_32;
  }
  if (objc_msgSend(v22, "bc_isBookStoreBuyNowURL"))
  {
    uint64_t v23 = 2;
    goto LABEL_29;
  }
  if (objc_msgSend(v22, "bc_isBookStoreViewInStoreURL"))
  {
    uint64_t v23 = 4;
    goto LABEL_29;
  }
  if (objc_msgSend(v22, "bc_isBookStoreStartReadingURL"))
  {
    uint64_t v23 = 5;
    goto LABEL_29;
  }
  uint64_t v23 = 6;
  if (objc_msgSend(v22, "bc_isBookStoreStartListeningURL")) {
    uint64_t v24 = 6;
  }
  else {
    uint64_t v24 = 0;
  }
  if ((unint64_t)(v24 - 2) <= 4) {
    goto LABEL_29;
  }
  v28 = BooksNotificationLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v50 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v73 = v50;
    __int16 v74 = 2048;
    uint64_t v75 = v24;
    id v51 = v50;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Skip Figaro metrics reporting for action type %ld", buf, 0x16u);
  }
  uint64_t v23 = 0;
LABEL_32:

  [(BooksNotificationViewController *)self _emitNotificationEngagementEventForResponse:v6 notificationAction:v12 actionType:v23];
  v29 = [v10 metricsEvent];
  v30 = [v29 objectForKeyedSubscript:@"details"];
  v31 = [v30 objectForKeyedSubscript:@"contentAdamId"];

  objc_opt_class();
  v32 = BUDynamicCast();
  v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    objc_opt_class();
    v35 = BUDynamicCast();
    id v34 = [v35 stringValue];
  }
  v70[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v70[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v71[0] = &__kCFBooleanTrue;
  v71[1] = &__kCFBooleanTrue;
  v70[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  v71[2] = v37;
  v38 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];

  if ((unint64_t)(v23 - 4) < 3)
  {
    v39 = [(BooksNotificationViewController *)self ba_effectiveAnalyticsTracker];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100003B54;
    v56[3] = &unk_100008530;
    v56[4] = self;
    id v57 = v34;
    uint64_t v61 = v23;
    id v58 = v22;
    id v59 = v38;
    v40 = v53;
    v60 = v53;
    +[BNBookDataStoreServices addStoreIDToWantToRead:v57 tracker:v39 completion:v56];

    v41 = v57;
LABEL_40:

    goto LABEL_41;
  }
  if (v23 == 2)
  {
    v43 = BooksNotificationLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v73 = v44;
      __int16 v74 = 2048;
      uint64_t v75 = 2;
      id v45 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL for action type %ld", buf, 0x16u);
    }
    v46 = +[LSApplicationWorkspace defaultWorkspace];
    [v46 openSensitiveURL:v22 withOptions:v38];

    v40 = v53;
    v53[2](v53, 1);
  }
  else
  {
    if (v23 == 3)
    {
      v42 = [(BooksNotificationViewController *)self ba_effectiveAnalyticsTracker];
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100003A60;
      v62[3] = &unk_100008468;
      v62[4] = self;
      id v63 = v34;
      uint64_t v65 = 3;
      v64 = v53;
      +[BNBookDataStoreServices addStoreIDToWantToRead:v63 tracker:v42 completion:v62];

      v40 = v53;
      v41 = v63;
      goto LABEL_40;
    }
    v47 = BooksNotificationLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v73 = v48;
      __int16 v74 = 2048;
      uint64_t v75 = v23;
      id v49 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: Let superclass to handle URL for action type %ld", buf, 0x16u);
    }
    v55.receiver = self;
    v55.super_class = (Class)BooksNotificationViewController;
    v40 = v53;
    [(BooksNotificationViewController *)&v55 didReceiveNotificationResponse:v6 completionHandler:v53];
  }
LABEL_41:
}

- (id)appGroupIdentifierForBridge:(id)a3
{
  v3 = +[BUAppGroup books];
  id v4 = [v3 identifier];

  return v4;
}

- (id)windowProviderForBridge:(id)a3
{
  return +[BNJSAWindowProvider sharedInstance];
}

- (id)objectRegistrationsForBridge:(id)a3
{
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("TransactionController+JS.workQueue", v5);

  id v7 = [objc_alloc((Class)TUITransactionController) initWithQueue:v6];
  v14[0] = @"notification-extension";
  v13[0] = @"applicationContext";
  v13[1] = @"analyticsController";
  objc_super v8 = [(BooksNotificationViewController *)self analyticsManager];
  double v9 = [v8 analyticsController];
  v14[1] = v9;
  v13[2] = @"remoteConfigDataContainer";
  double v10 = +[BCRCDataContainer defaultContainer];
  v14[2] = v10;
  v14[3] = v7;
  v13[3] = @"transactionController";
  v13[4] = @"AlertController";
  v14[4] = objc_opt_class();
  v13[5] = @"DynamicArray";
  v14[5] = objc_opt_class();
  v13[6] = @"DynamicValue";
  v14[6] = objc_opt_class();
  v13[7] = @"FeedDataRequest";
  v14[7] = objc_opt_class();
  v13[8] = @"FeedViewController";
  v14[8] = objc_opt_class();
  v13[9] = @"NoticeViewController";
  v14[9] = objc_opt_class();
  v13[10] = @"OSFeatureFlags";
  v14[10] = objc_opt_class();
  v13[11] = @"Transaction";
  v14[11] = objc_opt_class();
  v13[12] = @"VCStack";
  v14[12] = objc_opt_class();
  double v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:13];

  return v11;
}

- (void)_setupWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = BSUIGetLibraryItemStateProvider();
  dispatch_queue_t v6 = +[BSUITemplate manager];
  id v7 = [v6 dynamicRegistry];
  objc_super v8 = [v5 stateCenter];
  [v7 registerStateProvider:v8 forKind:@"libraryItem"];

  id v9 = +[BCAnalyticsVisibilityPresentationNotifier sharedInstance];
  double v10 = +[JSABridge sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000040BC;
  v13[3] = &unk_100008580;
  id v14 = v6;
  id v15 = v4;
  id v11 = v4;
  id v12 = v6;
  [v10 initializeEnvironmentWithDataSource:self completion:v13];
}

- (void)_renderUserNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = BooksNotificationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v6 = [v4 logKey];
    *(_DWORD *)buf = 138543618;
    unsigned int v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Will render notification", buf, 0x16u);
  }
  id v7 = [v4 createUNNotificationActions];
  if (v7)
  {
    objc_super v8 = [(BooksNotificationViewController *)self extensionContext];
    [v8 setNotificationActions:v7];
  }
  id v9 = [v4 defaultAction];
  double v10 = [v9 defaultURL];
  id v11 = [v10 absoluteString];

  CFStringRef v18 = @"url";
  v19 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v13 = [[BNFeedViewController alloc] initWithOptions:v12];
  [(BooksNotificationViewController *)self setFeedViewController:v13];

  id v14 = [(BooksNotificationViewController *)self feedViewController];
  [v14 setModalPresentationStyle:0];

  id v15 = [(BooksNotificationViewController *)self feedViewController];
  [v15 setNotificationDelegate:self];

  uint64_t v16 = [(BooksNotificationViewController *)self feedViewController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004420;
  v17[3] = &unk_1000085A8;
  v17[4] = self;
  [(BooksNotificationViewController *)self presentViewController:v16 animated:0 completion:v17];
}

- (BOOL)_isURLValid:(id)a3 hostPatterns:(id)a4 pathPatterns:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  double v10 = [v7 host];
  unsigned int v11 = [v10 bc_hasMatchInRegexPatterns:v9];

  if (v11)
  {
    id v12 = [v7 path];
    unsigned __int8 v13 = [v12 bc_hasMatchInRegexPatterns:v8];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)_reportMetricsEvent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init((Class)AMSMetrics);
    [v5 enqueueEvent:v4];

    dispatch_queue_t v6 = [v5 flush];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004620;
    v7[3] = &unk_1000085D0;
    v7[4] = self;
    [v6 addFinishBlock:v7];
  }
}

- (void)_emitNotificationEngagementEventForResponse:(id)a3 notificationAction:(id)a4 actionType:(int64_t)a5
{
  id v6 = a4;
  id v7 = [a3 notification];
  id v8 = [v7 request];

  id v9 = [v8 content];
  double v10 = [v6 metricsEvent];
  unsigned int v11 = [v10 underlyingDictionary];
  id v12 = [v11 objectForKeyedSubscript:@"details"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"contentAdamId"];

  objc_opt_class();
  id v14 = BUDynamicCast();
  v43 = (void *)v13;
  if (v14
    || (objc_opt_class(),
        BUDynamicCast(),
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 stringValue],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14))
  {
    v48 = v14;
    uint64_t v16 = +[NSArray arrayWithObjects:&v48 count:1];
  }
  else
  {
    uint64_t v16 = &__NSArray0__struct;
  }
  v17 = [v6 metricsEvent];
  CFStringRef v18 = [v17 underlyingDictionary];
  v19 = [v18 objectForKeyedSubscript:@"notificationId"];
  v20 = v19;
  id v45 = v8;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v8 identifier];
  }
  id v22 = v21;

  v47 = [v9 title];
  v46 = [v9 body];
  uint64_t v23 = [v6 metricsEvent];
  uint64_t v24 = [v23 underlyingDictionary];
  v25 = [v24 objectForKeyedSubscript:@"details"];
  v26 = [v25 objectForKeyedSubscript:@"notificationSubtype"];

  v44 = v9;
  if ([v26 isEqualToString:@"newBookAuthor"]) {
    uint64_t v27 = 2;
  }
  else {
    uint64_t v27 = [v26 isEqualToString:@"newBookSeries"];
  }
  v40 = v22;
  id v28 = [objc_alloc((Class)BANotificationData) initWithNotificationContentID:v16 notificationID:v22 notificationType:1 recoType:v27 goalType:0 titleCode:&stru_100008A70 title:v47 messageCode:&stru_100008A70 message:v46];
  v29 = [v6 defaultURL];
  uint64_t v30 = [v29 absoluteString];
  v31 = (void *)v30;
  if (v30) {
    v32 = (__CFString *)v30;
  }
  else {
    v32 = &stru_100008A70;
  }
  v33 = v32;

  uint64_t v34 = 0;
  if ((unint64_t)(a5 - 1) <= 3) {
    uint64_t v34 = qword_1000067B0[a5 - 1];
  }
  id v35 = [objc_alloc((Class)BANotificationEngagementData) initWithActionType:a5 actionUrl:v33 targetID:v16 targetType:v34];

  v36 = [(BooksNotificationViewController *)self analyticsManager];
  v37 = [v36 analyticsController];
  v38 = [v37 applicationTracker];

  v39 = +[BAEventReporter sharedReporter];
  [v39 emitNotificationEngagementEventWithTracker:v38 engagementData:v35 notificationData:v28];
}

- (void)feedViewController:(id)a3 willTransitionToContentHeight:(double)a4
{
  id v6 = [(BooksNotificationViewController *)self viewIfLoaded];
  [v6 frame];
  -[BooksNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", CGRectGetWidth(v8), a4);
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v3 = [(BooksNotificationViewController *)self view];
  [v3 setNeedsLayout];
}

- (TUISyncLayoutController)syncLayoutController
{
  return self->_syncLayoutController;
}

- (BNFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
}

- (BCAppAnalyticsExtensionManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);

  objc_storeStrong((id *)&self->_syncLayoutController, 0);
}

@end