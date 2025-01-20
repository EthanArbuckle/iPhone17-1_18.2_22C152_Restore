@interface WFMainSceneDelegate
- (BOOL)handleOpenURL:(id)a3 options:(id)a4;
- (BOOL)handleShortcutItem:(id)a3;
- (BOOL)openFile:(id)a3 sourceApplication:(id)a4 completionHandler:(id)a5;
- (BOOL)openWorkflow:(id)a3;
- (BOOL)scene:(id)a3 handleUserActivityWithType:(id)a4 webpageURL:(id)a5 userInfo:(id)a6 interaction:(id)a7;
- (NSSet)pendingOpenURLContexts;
- (NSUserActivity)pendingUserActivity;
- (UIApplicationShortcutItem)pendingShortcutItem;
- (UIWindow)window;
- (WFRootView)rootViewController;
- (id)topViewController;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setPendingOpenURLContexts:(id)a3;
- (void)setPendingShortcutItem:(id)a3;
- (void)setPendingUserActivity:(id)a3;
- (void)setWindow:(id)a3;
- (void)showAlertWithError:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation WFMainSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  WFEnsureDaemonIsRunningForSyncIfNeeded();
  v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 setSuspended:0];

  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10000C658;
  v10 = &unk_1000E7D78;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v7);
  +[WFAppStorePromptController didBecomeActive];
}

- (NSUserActivity)pendingUserActivity
{
  return self->_pendingUserActivity;
}

- (UIApplicationShortcutItem)pendingShortcutItem
{
  return self->_pendingShortcutItem;
}

- (NSSet)pendingOpenURLContexts
{
  return self->_pendingOpenURLContexts;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  id v10 = v7;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v35 = 136315906;
      *(void *)&v35[4] = "WFEnforceClass";
      *(_WORD *)&v35[12] = 2114;
      *(void *)&v35[14] = v10;
      *(_WORD *)&v35[22] = 2114;
      id v36 = (id)objc_opt_class();
      LOWORD(v37) = 2114;
      *(void *)((char *)&v37 + 2) = v9;
      id v13 = v36;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v35, 0x2Au);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }

  id v14 = [objc_alloc((Class)UIWindow) initWithWindowScene:v11];
  [(WFMainSceneDelegate *)self setWindow:v14];

  v15 = +[UIColor blackColor];
  v16 = [(WFMainSceneDelegate *)self window];
  [v16 setBackgroundColor:v15];

  v17 = +[UIApplication sharedApplication];
  v18 = [v17 delegate];

  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  id v20 = v19;

  id v21 = [v20 initializationResult];
  if (v21 == (id)2)
  {
    v22 = objc_opt_new();
    rootViewController = [(WFMainSceneDelegate *)self window];
    [rootViewController setRootViewController:v22];
  }
  else
  {
    v22 = +[WFDatabase defaultDatabase];
    v24 = [[WFMainViewController alloc] initWithDatabase:v22];
    v25 = [(WFMainSceneDelegate *)self window];
    [v25 setRootViewController:v24];

    rootViewController = self->_rootViewController;
    self->_rootViewController = (WFRootView *)v24;
  }

  v26 = [(WFMainSceneDelegate *)self window];
  [v26 makeKeyAndVisible];

  v27 = [(WFMainSceneDelegate *)self window];
  v28 = [v27 rootViewController];
  v29 = WFUserInterfaceFromViewController();

  if (v21 == (id)2)
  {
    [v20 initializationResult];
    WFPresentInitializationErrorIfNecessary();
  }
  v30 = [v8 shortcutItem:*(_OWORD *)v35, *(void *)&v35[16], v36, v37];
  [(WFMainSceneDelegate *)self setPendingShortcutItem:v30];

  v31 = [v8 URLContexts];
  [(WFMainSceneDelegate *)self setPendingOpenURLContexts:v31];

  v32 = [v8 userActivities];

  v33 = [v32 anyObject];
  [(WFMainSceneDelegate *)self setPendingUserActivity:v33];

  v34 = [(WFMainSceneDelegate *)self window];
  +[WFDebugUtilities setupDebuggingForWindow:v34];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setPendingUserActivity:(id)a3
{
}

- (void)setPendingShortcutItem:(id)a3
{
}

- (void)setPendingOpenURLContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserActivity, 0);
  objc_storeStrong((id *)&self->_pendingOpenURLContexts, 0);
  objc_storeStrong((id *)&self->_pendingShortcutItem, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (WFRootView)rootViewController
{
  return self->_rootViewController;
}

- (void)showAlertWithError:(id)a3
{
  id v4 = a3;
  v5 = [(WFMainSceneDelegate *)self topViewController];
  WFUserInterfaceFromViewController();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = +[WFAlert alertWithError:v4];

  [v7 presentAlert:v6];
}

- (id)topViewController
{
  v2 = [(WFMainSceneDelegate *)self window];
  v3 = [v2 rootViewController];

  id v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      v5 = [v3 presentedViewController];

      id v6 = [v5 presentedViewController];

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 openInPlace];
  uint64_t v9 = [v7 sourceApplication];

  if ([v6 isFileURL])
  {
    if (v8)
    {
      [v6 startAccessingSecurityScopedResource];
      id v10 = objc_opt_new();
      id v28 = v6;
      unsigned __int8 v11 = 1;
      id v12 = +[NSArray arrayWithObjects:&v28 count:1];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000B06FC;
      v23[3] = &unk_1000E7F08;
      id v24 = v10;
      id v25 = v6;
      v26 = self;
      id v27 = v9;
      id v13 = v10;
      [v13 prepareForReadingItemsAtURLs:v12 options:0 writingItemsAtURLs:&__NSArray0__struct options:0 error:0 byAccessor:v23];
    }
    else
    {
      id v14 = [v6 lastPathComponent];
      id v13 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v14];

      v15 = +[NSFileManager defaultManager];
      id v22 = 0;
      unsigned __int8 v16 = [v15 moveItemAtURL:v6 toURL:v13 error:&v22];
      id v17 = v22;

      if (v16)
      {
        v18 = +[WFFileRepresentation fileWithURL:v13 options:1];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000B0858;
        v21[3] = &unk_1000E7DA0;
        v21[4] = self;
        unsigned __int8 v11 = [(WFMainSceneDelegate *)self openFile:v18 sourceApplication:v9 completionHandler:v21];
      }
      else
      {
        [(WFMainSceneDelegate *)self showAlertWithError:v17];
        unsigned __int8 v11 = 0;
      }
    }
  }
  else
  {
    id v13 = +[ICManager sharedManager];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B08C0;
    v20[3] = &unk_1000E7DA0;
    v20[4] = self;
    unsigned __int8 v11 = [v13 handleOpenURL:v6 fromSourceApplication:v9 errorHandler:v20];
  }

  return v11;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v11 = [v10 URL];
        id v12 = [v10 options];
        [(WFMainSceneDelegate *)self handleOpenURL:v11 options:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)openFile:(id)a3 sourceApplication:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [v8 wfType];
  unsigned int v12 = +[WFShortcutExtractor isShortcutFileType:v11];

  if (v12)
  {
    id v13 = [objc_alloc((Class)WFShortcutExtractor) initWithFile:v8 suggestedName:0 sourceApplication:v9];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B0C88;
    v15[3] = &unk_1000E7E90;
    v15[4] = self;
    id v16 = v10;
    [v13 extractShortcutWithCompletion:v15];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }

  return v12;
}

- (BOOL)openWorkflow:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = +[ICManager sharedManager];
  id v6 = [v4 externalURLForViewing];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B0F3C;
  v9[3] = &unk_1000E7DA0;
  v9[4] = self;
  unsigned __int8 v7 = [v5 handleOpenURL:v6 fromSourceApplication:0 errorHandler:v9];

  return v7;
}

- (BOOL)scene:(id)a3 handleUserActivityWithType:(id)a4 webpageURL:(id)a5 userInfo:(id)a6 interaction:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = +[WFDatabase defaultDatabase];
  if ([v12 isEqualToString:WFHandoffOpenURLActivityType])
  {
    uint64_t v16 = [v14 objectForKey:WFHandoffURLKey];
    v43 = self;
    id v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v13;
    }
    id v19 = v18;

    id v20 = +[ICAppRegistry sharedRegistry];
    [v19 scheme];
    id v21 = v12;
    id v22 = v14;
    id v23 = v13;
    id v24 = v15;
    v26 = id v25 = v11;
    id v27 = [v20 appWithURLScheme:v26];
    id v28 = [v19 scheme];
    v42 = [v27 schemeNamed:v28];

    id v11 = v25;
    long long v15 = v24;
    id v13 = v23;
    id v14 = v22;
    id v12 = v21;

    v29 = +[ICManager sharedManager];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000B13C0;
    v48[3] = &unk_1000E7DA0;
    v48[4] = v43;
    v30 = +[_ICURLRequest requestWithURL:v19 scheme:v42 userInterface:0 bundleIdentifier:0 successHandler:0 failureHandler:v48];

    [v29 performRequest:v30];
    goto LABEL_11;
  }
  if ([v12 isEqualToString:WFHandoffContinueWorkflowActivityType])
  {
    if (v14)
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000B13CC;
      v47[3] = &unk_1000E7DC8;
      v47[4] = self;
      +[WFHandoffSimulator getStateForContinuingWorkflowFromUserActivityUserInfo:v14 completionHandler:v47];
LABEL_11:
      BOOL v34 = 1;
      goto LABEL_12;
    }
LABEL_24:
    BOOL v34 = 0;
    goto LABEL_12;
  }
  if ([v12 isEqualToString:WFHandoffRunActionActivityType])
  {
    v31 = [v14 objectForKey:WFHandoffActionRunRequestKey];
    v32 = +[NSSet setWithObject:objc_opt_class()];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000B1450;
    v44[3] = &unk_1000E7E18;
    id v45 = v11;
    v46 = self;
    id v33 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:v31 allowedClasses:v32 completionHandler:v44];

    goto LABEL_11;
  }
  if ([v12 isEqualToString:WFViewWorkflowActivityType])
  {
    id v36 = self;
    long long v37 = [v14 objectForKey:WFViewWorkflowActivityWorkflowIDKey];
    v38 = [v14 objectForKey:WFViewWorkflowActivityWorkflowNameKey];
    if (!v37
      || ([v15 referenceForWorkflowID:v37], (v39 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v38)
      {
        v39 = [v15 uniqueVisibleReferenceForWorkflowName:v38];
      }
      else
      {
        v39 = 0;
      }
    }
    unsigned __int8 v41 = [(WFMainSceneDelegate *)v36 openWorkflow:v39];

    if (v41) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
  unsigned int v40 = [v12 isEqualToString:NSUserActivityTypeBrowsingWeb];
  BOOL v34 = 0;
  if (v13 && v40)
  {
    if ([(WFMainSceneDelegate *)self handleOpenURL:v13 options:0]) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_12:

  return v34;
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v6 activityType];
  id v8 = [v6 webpageURL];
  id v9 = [v6 userInfo];
  id v10 = [v6 interaction];

  [(WFMainSceneDelegate *)self scene:v7 handleUserActivityWithType:v11 webpageURL:v8 userInfo:v9 interaction:v10];
}

- (BOOL)handleShortcutItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  unsigned __int8 v5 = [v4 isEqualToString:@"create_workflow"];

  if (v5)
  {
    CFStringRef v6 = @"shortcuts://create-workflow?source=3d_touch";
  }
  else
  {
    id v7 = [v3 type];
    unsigned int v8 = [v7 isEqualToString:@"view_gallery"];

    if (!v8)
    {
      unsigned __int8 v11 = 0;
      goto LABEL_7;
    }
    CFStringRef v6 = @"shortcuts://gallery";
  }
  id v9 = +[NSURL URLWithString:v6];
  id v10 = +[ICManager sharedManager];
  unsigned __int8 v11 = [v10 handleOpenURL:v9 fromSourceApplication:0 errorHandler:0];

LABEL_7:
  return v11;
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  (*((void (**)(id, BOOL))a5 + 2))(v8, [(WFMainSceneDelegate *)self handleShortcutItem:a4]);
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 setSuspended:1];
}

@end