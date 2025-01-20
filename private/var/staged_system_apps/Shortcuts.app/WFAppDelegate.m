@interface WFAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (NSDate)lastForegroundDate;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int64_t)initializationResult;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationShouldRequestHealthAuthorization:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)setInitializationResult:(int64_t)a3;
- (void)setLastForegroundDate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WFAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  [a3 setShortcutItems:0, a4];
  v5 = +[UNUserNotificationCenter currentNotificationCenter];
  [v5 setDelegate:self];

  +[WFFileStorageUtilities createDocumentsDirectoryIfNecessary];
  if (+[CSSearchableIndex isIndexingAvailable])
  {
    v6 = +[CSSearchableIndex defaultSearchableIndex];
    [v6 deleteSearchableItemsWithDomainIdentifiers:&off_1000E87F0 completionHandler:0];
  }
  +[WFLinkActions register];
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  v8 = [v7 configuration];
  UISceneSessionRole v9 = [v7 role];

  if (v9 == UIWindowSceneSessionRoleApplication)
  {
    v10 = [v6 userActivities];
    v11 = [v10 anyObject];

    CFStringRef v12 = @"Main";
    if (v11)
    {
      v13 = +[WFWindowSceneManager workflowIdentifierFromUserActivity:v11];

      if (v13) {
        CFStringRef v12 = @"Workflow";
      }
    }
    uint64_t v14 = +[UISceneConfiguration configurationWithName:v12 sessionRole:v9];

    v8 = (void *)v14;
  }

  return v8;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  id v6 = +[WFApplicationContext sharedContext];
  [v6 setProvider:v5];

  LODWORD(v6) = [v5 launchedToTest];
  if (v6
    && (+[NSUserDefaults standardUserDefaults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 BOOLForKey:@"WFUsePPTPerformanceContent"],
        v7,
        (v8 & 1) == 0))
  {
    self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:0];
    +[WFPPTDispatcher setupDatabaseForTesting];
  }
  else
  {
    self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:1];
  }
  +[WFHandoffSimulator registerHandoffURLRequestHandler:&stru_1000E7FE8];
  UISceneSessionRole v9 = +[NSUserDefaults workflowUserDefaults];
  [v9 wf_loadValuesFromCloudKitWithCompletion:&stru_1000E8028];

  v10 = +[WFHomeManager sharedManager];
  [v10 reloadData];

  +[WFKeyboard beginObservingKeyboardNotifications];
  WFWorkflowIconDrawerGloballyCacheDrawerContext();
  v11 = +[WFHomeScreenController sharedInstance];
  [v11 startListeningForDatabaseChanges];

  +[WFDebugUtilities startLogStream];
  return 1;
}

- (int64_t)initializationResult
{
  return self->_initializationResult;
}

- (void).cxx_destruct
{
}

- (void)setLastForegroundDate:(id)a3
{
}

- (NSDate)lastForegroundDate
{
  return self->_lastForegroundDate;
}

- (void)setInitializationResult:(int64_t)a3
{
  self->_initializationResult = a3;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  return +[WFPPTDispatcher dispatchTest:a4];
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v5 = [a4 notification:a3];
  id v6 = [v5 request];
  id v7 = [v6 content];
  unsigned __int8 v8 = [v7 userInfo];
  WFTriggerIDFromNotificationUserInfo();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  UISceneSessionRole v9 = v15;
  if (v15)
  {
    v10 = +[WFWindowSceneManager mainScene];
    v11 = [v10 delegate];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CFStringRef v12 = v11;
      }
      else {
        CFStringRef v12 = 0;
      }
    }
    else
    {
      CFStringRef v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 rootViewController];

    [v14 highlightAutomationWithTriggerID:v15];
    UISceneSessionRole v9 = v15;
  }
}

- (void)applicationShouldRequestHealthAuthorization:(id)a3
{
  id v3 = +[HKHealthStore wf_shortcutsAppHealthStore];
  [v3 handleAuthorizationForExtensionWithCompletion:&stru_1000E8068];
}

- (void)applicationDidEnterBackground:(id)a3
{
  v4 = [(WFAppDelegate *)self lastForegroundDate];

  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [(WFAppDelegate *)self lastForegroundDate];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    id v9 = (id)objc_opt_new();
    [v9 setSource:WFWorkflowRunSourceMyWorkflows];
    [v9 setDuration:v8];
    [v9 track];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = (id)objc_opt_new();
  [(WFAppDelegate *)self setLastForegroundDate:v4];
}

@end