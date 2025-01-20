@interface ICWindowSceneDelegate
- (BOOL)isAnyWelcomeScreenVisible;
- (BOOL)pptLaunchTasksComplete;
- (ICViewControllerManager)viewControllerManager;
- (ICWindow)icWindow;
- (ICWindowSceneDelegate)init;
- (NSMutableDictionary)sessionIdentifierToStateRestorationActivity;
- (NSObject)sceneDidDisconnectNotificationToken;
- (id)archiveForLaunchingPPT;
- (id)archiveForUserActivities:(id)a3 isSourceApplicationExternal:(BOOL)a4 lastSavedArchive:(id)a5;
- (id)nextResponder;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)dealloc;
- (void)handleAcceptingCloudKitShareWithMetadata:(id)a3 withWindowScene:(id)a4;
- (void)handleLaunchingQuickNoteUnlocked;
- (void)handleOpeningURLContexts:(id)a3 withScene:(id)a4;
- (void)handleRecordingUserActivity:(id)a3;
- (void)makeKeyWindowWhenTransitioningFromCoverSheet;
- (void)performPPTForegroundLaunchTasksIfNecessary;
- (void)reportReferralDataFromSceneConnectionOptions:(id)a3;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setIcWindow:(id)a3;
- (void)setPptLaunchTasksComplete:(BOOL)a3;
- (void)setSceneDidDisconnectNotificationToken:(id)a3;
- (void)setSessionIdentifierToStateRestorationActivity:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
@end

@implementation ICWindowSceneDelegate

- (ICWindowSceneDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICWindowSceneDelegate;
  v2 = [(ICWindowSceneDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    sessionIdentifierToStateRestorationActivity = v2->_sessionIdentifierToStateRestorationActivity;
    v2->_sessionIdentifierToStateRestorationActivity = (NSMutableDictionary *)v3;

    [(ICWindowSceneDelegate *)v2 makeKeyWindowWhenTransitioningFromCoverSheet];
  }
  return v2;
}

- (void)sceneDidBecomeActive:(id)a3
{
  uint64_t v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[ICWindowSceneDelegate sceneDidBecomeActive:]";
    __int16 v6 = 1024;
    int v7 = 237;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }
}

- (void)makeKeyWindowWhenTransitioningFromCoverSheet
{
  objc_initWeak(&location, self);
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009B698;
  v6[3] = &unk_100627BE8;
  objc_copyWeak(&v7, &location);
  int v4 = [v3 addObserverForName:UISceneDidDisconnectNotification object:0 queue:0 usingBlock:v6];
  sceneDidDisconnectNotificationToken = self->_sceneDidDisconnectNotificationToken;
  self->_sceneDidDisconnectNotificationToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int v4 = ICDynamicCast();
  v5 = +[ICNAController sharedController];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1000982FC;
  v12 = &unk_100625AF0;
  id v13 = v4;
  id v6 = v4;
  [v5 startWindowSceneSessionWithType:2 windowScene:v6 successHandler:&v9];

  CFStringRef v14 = @"ICSessionSceneHasBecomeForegroundKey";
  v15 = &__kCFBooleanTrue;
  id v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, v9, v10, v11, v12);
  v8 = [v3 session];

  [v8 setUserInfo:v7];
  [UIApp setApplicationIconBadgeNumber:0];
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v6 = a3;
  id v7 = +[ICNAWindowSceneReportingManager sharedManager];
  [v7 windowSceneMayBeResized:v6];
}

- (void)reportReferralDataFromSceneConnectionOptions:(id)a3
{
  id v27 = a3;
  id v3 = [v27 sourceApplication];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v27 sourceApplication];
  }
  else
  {
    v5 = 0;
  }
  id v6 = [v27 URLContexts];
  id v7 = [v6 count];

  if (v7)
  {
    v8 = [v27 URLContexts];
    v9 = [v8 anyObject];
    uint64_t v10 = [v9 URL];

    goto LABEL_14;
  }
  v11 = [v27 handoffUserActivityType];

  if (v11)
  {
    uint64_t v12 = ICNAInbountURLComponentUserActivity;
    uint64_t v13 = ICNAInbountURLComponentHandoff;
    CFStringRef v14 = [v27 handoffUserActivityType];
    v15 = +[NSString stringWithFormat:@"%@/%@/%@", v12, v13, v14];
    uint64_t v10 = +[NSURL URLWithString:v15];

LABEL_13:
    goto LABEL_14;
  }
  v16 = [v27 userActivities];
  id v17 = [v16 count];

  if (v17)
  {
    uint64_t v18 = ICNAInbountURLComponentUserActivity;
    CFStringRef v14 = [v27 userActivities];
    v19 = [v14 anyObject];
    v20 = [v19 activityType];
    v21 = +[NSString stringWithFormat:@"%@/%@", v18, v20];
    uint64_t v10 = +[NSURL URLWithString:v21];

LABEL_12:
    goto LABEL_13;
  }
  v22 = [v27 shortcutItem];

  if (v22)
  {
    uint64_t v23 = ICNAInbountURLComponentShortcutItem;
    CFStringRef v14 = [v27 shortcutItem];
    v19 = [v14 type];
    v24 = +[NSString stringWithFormat:@"%@/%@", v23, v19];
    uint64_t v10 = +[NSURL URLWithString:v24];

    goto LABEL_12;
  }
  uint64_t v10 = [v27 cloudKitShareMetadata];

  if (v10)
  {
    uint64_t v10 = +[NSURL URLWithString:kICNACloudKitShareReferralURL];
  }
LABEL_14:
  v25 = +[ICAppDelegate sharedInstance];
  v26 = [v25 analyticsController];
  [v26 addReferralDataWithReferringInboundURL:v10 referringApplication:v5];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "-[ICWindowSceneDelegate scene:willConnectToSession:options:]";
    __int16 v76 = 1024;
    int v77 = 94;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v11 = [(ICWindowSceneDelegate *)self sessionIdentifierToStateRestorationActivity];
  uint64_t v12 = [v8 stateRestorationActivity];
  uint64_t v13 = [v8 persistentIdentifier];
  [v11 ic_setNonNilObject:v12 forNonNilKey:v13];

  CFStringRef v72 = @"ICSessionSceneHasBecomeForegroundKey";
  v73 = &__kCFBooleanFalse;
  CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  [v8 setUserInfo:v14];

  objc_opt_class();
  v15 = ICDynamicCast();
  v16 = [v15 screen];
  id v17 = [v16 displayIdentity];
  unsigned int v18 = [v17 expectsSecureRendering];

  if (v18)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICWindowSceneDelegate scene:willConnectToSession:options:]", 1, 0, @"Trying to show secure screen with non-secure window scene delegate");
    goto LABEL_40;
  }
  id v57 = v7;
  v58 = v15;
  v59 = v9;
  v60 = v8;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v19 = [v9 userActivities];
  id v20 = [v19 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v68;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        v25 = [v24 activityType];
        if ([v25 isEqual:@"TUUserActivityCreateCallRecording"])
        {
        }
        else
        {
          v26 = [v24 activityType];
          unsigned int v27 = [v26 isEqual:@"TUUserActivityFinishedCallRecording"];

          if (!v27) {
            continue;
          }
        }
        [(ICWindowSceneDelegate *)self handleRecordingUserActivity:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v21);
  }

  v28 = +[ICAppDelegate sharedInstance];
  unsigned __int8 v29 = [v28 isRunningPPT];

  if ((v29 & 1) != 0
    || (+[NSProcessInfo processInfo],
        v30 = objc_claimAutoreleasedReturnValue(),
        [v30 arguments],
        v31 = objc_claimAutoreleasedReturnValue(),
        id v32 = [v31 indexOfObjectPassingTest:&stru_100627B00],
        v31,
        v30,
        v32 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v40 = [(ICWindowSceneDelegate *)self archiveForLaunchingPPT];
    int v41 = 1;
    v33 = v59;
    v35 = v60;
  }
  else
  {
    v33 = v59;
    v34 = [v59 sourceApplication];

    v35 = v60;
    v36 = [v60 stateRestorationActivity];
    v37 = [v36 userInfo];
    v38 = [v37 objectForKeyedSubscript:@"ICCanvasStateArchiveKey"];

    if (v38)
    {
      v39 = +[ICWindowStateArchive windowStateArchiveFromDictionary:v38];
    }
    else
    {
      v39 = 0;
    }
    v42 = [v59 userActivities];
    [(ICWindowSceneDelegate *)self archiveForUserActivities:v42 isSourceApplicationExternal:v34 != 0 lastSavedArchive:v39];
    v40 = (ICWindowStateArchive *)objc_claimAutoreleasedReturnValue();

    int v41 = 0;
  }
  if (v40)
  {
    v43 = +[ICExpansionState sharedExpansionState];
    v44 = [(ICWindowStateArchive *)v40 expansionState];
    [v43 applyArchiveDictionary:v44];
  }
  else
  {
    v40 = objc_alloc_init(ICWindowStateArchive);
    [(ICWindowStateArchive *)v40 setCurrentNoteContainerViewMode:0];
  }
  id v7 = v57;
  v45 = [v35 configuration];
  v46 = [v45 name];
  unsigned int v47 = [v46 isEqualToString:off_100699250];

  if (v47) {
    [(ICWindowStateArchive *)v40 setIsAuxiliaryWindow:1];
  }
  if ([(ICWindowStateArchive *)v40 isAuxiliaryWindow])
  {
    v48 = +[NSPredicate predicateWithValue:0];
    v49 = [v58 activationConditions];
    [v49 setCanActivateForTargetContentIdentifierPredicate:v48];
  }
  if (+[UIDevice ic_isVision])
  {
    v50 = [v58 sizeRestrictions];
    [v50 setMinimumSize:488.0, 488.0];

    v51 = [v58 sizeRestrictions];
    [v51 setMaximumSize:1600.0, 900.0];
  }
  if (+[UIDevice ic_isVision])
  {
    uint64_t v52 = 3;
  }
  else if (sub_10000665C())
  {
    [(ICWindowStateArchive *)v40 setHostApplicationIdentifier:ICNoteMathNotesHostApplicationIdentifier];
    uint64_t v52 = 1;
  }
  else
  {
    uint64_t v52 = 0;
  }
  id v53 = [objc_alloc((Class)ICWindow) initWithWindowScene:v58 behavior:v52];
  v54 = objc_alloc_init(ICViewControllerManager);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000981EC;
  v62[3] = &unk_100625A78;
  id v55 = v33;
  id v63 = v55;
  v64 = self;
  id v65 = v58;
  v56 = v54;
  v66 = v56;
  [(ICViewControllerManager *)v56 setupWithWindow:v53 stateRestoreArchive:v40 completion:v62];
  [v53 setViewControllerManager:v56];
  [v53 makeKeyAndVisible];
  if (((v41 | +[ICUtilities isInternalInstall] ^ 1) & 1) == 0) {
    [v53 setUpDebugStatusWindow];
  }
  [(ICWindowSceneDelegate *)self setIcWindow:v53];
  [(ICWindowSceneDelegate *)self reportReferralDataFromSceneConnectionOptions:v55];

  id v9 = v59;
  id v8 = v60;
  v15 = v58;
LABEL_40:
}

- (id)archiveForLaunchingPPT
{
  v2 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100036208(v2);
  }

  id v3 = +[ICAppDelegate sharedInstance];
  unsigned __int8 v4 = [v3 isRunningPPT];

  if ((v4 & 1) == 0) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICAppDelegate.sharedInstance.isRunningPPT", "-[ICWindowSceneDelegate archiveForLaunchingPPT]", 1, 0, @"should only call this for launching in PPT");
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"launchToFolderList"];

  if (v6)
  {
    id v7 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8644();
    }
  }
  id v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"launchToNotesList"];

  if (v9)
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8610();
    }
  }
  else
  {
    if (v6)
    {
      char v11 = 1;
      int v12 = 1;
      goto LABEL_17;
    }
    uint64_t v10 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000361D4();
    }
  }

  int v12 = 0;
  char v11 = v9;
LABEL_17:
  uint64_t v13 = objc_alloc_init(ICWindowStateArchive);
  [(ICWindowStateArchive *)v13 setCurrentNoteContainerViewMode:0];
  if (v12) {
    [(ICWindowStateArchive *)v13 setIsPrimaryContentVisible:1];
  }
  if (v9) {
    [(ICWindowStateArchive *)v13 setIsSupplementaryContentVisible:1];
  }
  CFStringRef v14 = +[ICNoteContext sharedContext];
  v15 = [v14 managedObjectContext];
  v16 = +[ICAccount localAccountInContext:v15];

  if (v16 && (!v12 || +[UIDevice ic_isiPad]))
  {
    id v17 = [v16 objectID];
    unsigned int v18 = [v17 URIRepresentation];
    id v32 = v18;
    v19 = +[NSArray arrayWithObjects:&v32 count:1];
    [(ICWindowStateArchive *)v13 setCurrentContainerObjectIDURLs:v19];

    id v20 = [v16 objectID];
    id v21 = [v20 URIRepresentation];
    [(ICWindowStateArchive *)v13 setCurrentObjectIDURL:v21];
  }
  if ((v11 & 1) == 0)
  {
    uint64_t v22 = +[ICApplicationTestingHelper sharedHelper];
    uint64_t v23 = [v22 testNoteIdentifier];

    v24 = +[ICNoteContext sharedContext];
    v25 = [v24 managedObjectContext];
    v26 = +[ICNote noteWithIdentifier:v23 includeDeleted:0 context:v25];

    unsigned int v27 = [v26 objectID];
    v28 = [v27 URIRepresentation];
    [(ICWindowStateArchive *)v13 setCurrentNoteObjectIDURL:v28];

    unsigned __int8 v29 = [v26 objectID];
    v30 = [v29 URIRepresentation];
    [(ICWindowStateArchive *)v13 setCurrentObjectIDURL:v30];

    [(ICWindowStateArchive *)v13 setIsPrimaryContentVisible:0];
    [(ICWindowStateArchive *)v13 setIsSupplementaryContentVisible:0];
  }

  return v13;
}

- (void)setIcWindow:(id)a3
{
}

- (NSMutableDictionary)sessionIdentifierToStateRestorationActivity
{
  return self->_sessionIdentifierToStateRestorationActivity;
}

- (void)dealloc
{
  id v3 = [(ICWindowSceneDelegate *)self sceneDidDisconnectNotificationToken];

  if (v3)
  {
    unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
    v5 = [(ICWindowSceneDelegate *)self sceneDidDisconnectNotificationToken];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICWindowSceneDelegate;
  [(ICWindowSceneDelegate *)&v6 dealloc];
}

- (ICViewControllerManager)viewControllerManager
{
  v2 = [(ICWindowSceneDelegate *)self icWindow];
  id v3 = [v2 viewControllerManager];

  return (ICViewControllerManager *)v3;
}

- (id)nextResponder
{
  v2 = [(ICWindowSceneDelegate *)self viewControllerManager];
  id v3 = [v2 keyboardHandler];

  return v3;
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = [(ICWindowSceneDelegate *)self viewControllerManager];
  [v5 updateSceneTitle:v4];

  objc_super v6 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ICWindowSceneDelegate sceneWillResignActive:]";
    __int16 v9 = 1024;
    int v10 = 243;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[ICWindowSceneDelegate sceneDidEnterBackground:]";
    __int16 v10 = 1024;
    int v11 = 248;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v8, 0x12u);
  }

  objc_opt_class();
  v5 = ICDynamicCast();

  objc_super v6 = +[ICNAWindowSceneReportingManager sharedManager];
  [v6 windowSceneDidEnd:v5];

  int v7 = +[ICNAController sharedController];
  [v7 endWindowSceneSessionSynchronously:0 forSessionType:2 endReason:1 windowScene:v5];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "-[ICWindowSceneDelegate sceneDidDisconnect:]";
    __int16 v17 = 1024;
    int v18 = 257;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v15, 0x12u);
  }

  v5 = [(ICWindowSceneDelegate *)self viewControllerManager];
  objc_super v6 = [v5 noteEditorViewController];
  int v7 = [v6 note];

  if (v7)
  {
    int v8 = +[ICAudioController sharedAudioController];
    __int16 v9 = [v8 currentAttachment];
    __int16 v10 = [v9 note];

    if (v7 == v10)
    {
      int v11 = +[ICAudioController sharedAudioController];
      [v11 stop];
    }
    int v12 = [(ICWindowSceneDelegate *)self viewControllerManager];
    if ([v12 isAuxiliary])
    {
      uint64_t v13 = +[ICAudioRecordingManager currentAttachment];
      CFStringRef v14 = [v13 note];

      if (v7 == v14) {
        +[ICAudioRecordingManager cancelCurrentAudioRecordingSessionWithCompletionHandler:&stru_100627B20];
      }
    }
    else
    {
    }
  }
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[ICWindowSceneDelegate windowScene:userDidAcceptCloudKitShareWithMetadata:]";
    __int16 v11 = 1024;
    int v12 = 288;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  [(ICWindowSceneDelegate *)self handleAcceptingCloudKitShareWithMetadata:v6 withWindowScene:v7];
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "-[ICWindowSceneDelegate stateRestorationActivityForScene:]";
    __int16 v33 = 1024;
    int v34 = 296;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  id v6 = [v4 session];
  id v7 = [v6 userInfo];
  int v8 = [v7 objectForKeyedSubscript:@"ICSessionSceneHasBecomeForegroundKey"];
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9) {
    goto LABEL_8;
  }
  __int16 v10 = [(ICWindowSceneDelegate *)self sessionIdentifierToStateRestorationActivity];
  __int16 v11 = [v4 session];
  int v12 = [v11 persistentIdentifier];
  uint64_t v13 = [v10 objectForKeyedSubscript:v12];

  if (!v13)
  {
LABEL_8:
    id v18 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"ICCanvasStateActivityType"];
    v19 = [(ICWindowSceneDelegate *)self icWindow];
    id v20 = [v19 viewControllerManager];
    int v15 = [v20 windowStateArchive];

    CFStringRef v29 = @"ICCanvasStateArchiveKey";
    id v21 = [v15 dictionaryRepresentation];
    v30 = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v18 setUserInfo:v22];

    if (!v15) {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((archive) != nil)", "-[ICWindowSceneDelegate stateRestorationActivityForScene:]", 1, 0, @"Expected non-nil value for '%s'", "archive");
    }
    if (ICInternalSettingsIsSelectionStateTrackingEnabled()
      && ([v15 selectionState], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v24 = [v15 currentNoteObjectIDURL];

      if (!v24) {
        goto LABEL_16;
      }
    }
    v16 = +[ICAppDelegate sharedInstance];
    [v16 saveLastBackgroundedArchiveState:v15];
  }
  else
  {
    CFStringRef v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8550();
    }

    int v15 = [(ICWindowSceneDelegate *)self sessionIdentifierToStateRestorationActivity];
    v16 = [v4 session];
    __int16 v17 = [v16 persistentIdentifier];
    id v18 = [v15 objectForKeyedSubscript:v17];
  }
LABEL_16:

  v25 = [(ICWindowSceneDelegate *)self sessionIdentifierToStateRestorationActivity];
  v26 = [v4 session];
  unsigned int v27 = [v26 persistentIdentifier];
  [v25 ic_setNonNilObject:v18 forNonNilKey:v27];

  return v18;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4 = a4;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412802;
    id v7 = v4;
    __int16 v8 = 2080;
    unsigned __int8 v9 = "-[ICWindowSceneDelegate scene:willContinueUserActivityWithType:]";
    __int16 v10 = 1024;
    int v11 = 331;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "type == %@%s:%d", (uint8_t *)&v6, 0x1Cu);
  }
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  __int16 v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v17 = v6;
    __int16 v18 = 2112;
    __int16 v20 = 2080;
    id v19 = v7;
    id v21 = "-[ICWindowSceneDelegate scene:didFailToContinueUserActivityWithType:error:]";
    __int16 v22 = 1024;
    int v23 = 336;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@, %@%s:%d", buf, 0x26u);
  }

  unsigned __int8 v9 = +[ICAppDelegate sharedInstance];
  __int16 v10 = [v9 analyticsController];
  int v11 = +[NSString stringWithFormat:@"%@/%@", ICNAInbountURLComponentUserActivity, v6];
  int v12 = +[NSURL URLWithString:v11];
  [v10 startSessionWithReferralURL:v12 referralApplication:0];

  uint64_t v13 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1004D8584((uint64_t)v7, v13);
  }

  CFStringRef v14 = +[ICHandoffController sharedController];
  [v14 setInputStream:0];

  int v15 = +[ICHandoffController sharedController];
  [v15 setOutputStream:0];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [v6 activityType];
    int v23 = 138412802;
    v24 = v9;
    __int16 v25 = 2080;
    v26 = "-[ICWindowSceneDelegate scene:continueUserActivity:]";
    __int16 v27 = 1024;
    int v28 = 347;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "type == %@%s:%d", (uint8_t *)&v23, 0x1Cu);
  }
  __int16 v10 = [v6 activityType];
  if ([v10 isEqual:@"TUUserActivityCreateCallRecording"])
  {
  }
  else
  {
    int v11 = [v6 activityType];
    unsigned int v12 = [v11 isEqual:@"TUUserActivityFinishedCallRecording"];

    if (!v12) {
      goto LABEL_7;
    }
  }
  [(ICWindowSceneDelegate *)self handleRecordingUserActivity:v6];
LABEL_7:
  uint64_t v13 = [(ICWindowSceneDelegate *)self sessionIdentifierToStateRestorationActivity];
  CFStringRef v14 = [v7 session];

  int v15 = [v14 persistentIdentifier];
  v16 = [v13 objectForKeyedSubscript:v15];
  id v17 = [v16 userInfo];
  __int16 v18 = [v17 objectForKeyedSubscript:@"ICCanvasStateArchiveKey"];

  if (v18)
  {
    id v19 = +[ICWindowStateArchive windowStateArchiveFromDictionary:v18];
  }
  else
  {
    id v19 = 0;
  }
  __int16 v20 = +[NSSet setWithObject:v6];
  id v21 = [(ICWindowSceneDelegate *)self archiveForUserActivities:v20 isSourceApplicationExternal:1 lastSavedArchive:v19];

  __int16 v22 = [(ICWindowSceneDelegate *)self viewControllerManager];
  [v22 applyStateRestoreArchive:v21 completion:0];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[ICWindowSceneDelegate scene:openURLContexts:]";
    __int16 v11 = 1024;
    int v12 = 371;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  [(ICWindowSceneDelegate *)self handleOpeningURLContexts:v6 withScene:v7];
}

- (void)handleOpeningURLContexts:(id)a3 withScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v9 = 138412290;
    long long v23 = v9;
    do
    {
      int v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v12) URL:v23];
        CFStringRef v14 = +[ICAppDelegate sharedInstance];
        int v15 = [v14 analyticsController];
        [v15 startSessionWithReferralURL:v13 referralApplication:0];

        v16 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          v30 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Got openURL: %@", buf, 0xCu);
        }

        unsigned int v17 = +[ICAppURLUtilities isQuickNoteModeURL:v13];
        unsigned __int8 v18 = +[ICAppURLUtilities quickNoteURLIsContinuing:v13];
        objc_opt_class();
        id v19 = ICDynamicCast();
        __int16 v20 = v19;
        if (!v17 || (v18 & 1) != 0)
        {
          id v21 = [(ICWindowSceneDelegate *)self viewControllerManager];
          [v21 openURL:v13];
LABEL_14:

          goto LABEL_15;
        }
        id v21 = [v19 screen];
        if (objc_msgSend(v21, "ic_isSecure")) {
          goto LABEL_14;
        }
        unsigned __int8 v22 = +[UIDevice ic_isLocked];

        if ((v22 & 1) == 0) {
          [(ICWindowSceneDelegate *)self handleLaunchingQuickNoteUnlocked];
        }
LABEL_15:

        int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }
}

- (void)handleLaunchingQuickNoteUnlocked
{
  id v3 = [(ICWindowSceneDelegate *)self viewControllerManager];
  id v4 = [v3 mainSplitViewController];
  v5 = [v4 presentedViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICWindowSceneDelegate *)self viewControllerManager];
    id v8 = [v7 mainSplitViewController];
    long long v9 = [v8 presentedViewController];

    [v9 prepareForDismissal];
  }
  id v10 = +[ICQuickNoteSessionSettings showOnLockScreen];
  id v11 = +[ICQuickNoteSessionSettings showOnLockScreen];
  if (v11 != (id)3 && v10 != (id)2) {
    goto LABEL_10;
  }
  int v12 = +[ICAppDelegate sharedInstance];
  uint64_t v13 = v12;
  if (v11 == (id)3) {
    [v12 quicknoteArchiveState];
  }
  else {
  id v16 = [v12 lastBackgroundedArchiveState];
  }

  if (v16)
  {
    CFStringRef v14 = [(ICWindowSceneDelegate *)self viewControllerManager];
    [v14 applyStateRestoreArchive:v16 completion:0];
  }
  else
  {
LABEL_10:
    id v16 = [(ICWindowSceneDelegate *)self viewControllerManager];
    id v15 = [v16 showNewNoteWithApproach:12 sender:self animated:1];
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ICWindowSceneDelegate windowScene:performActionForShortcutItem:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 439;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  id v8 = +[ICAppDelegate sharedInstance];
  long long v9 = [v8 analyticsController];
  uint64_t v10 = ICNAInbountURLComponentShortcutItem;
  id v11 = [v6 type];
  int v12 = +[NSString stringWithFormat:@"%@/%@", v10, v11];
  uint64_t v13 = +[NSURL URLWithString:v12];
  [v9 startSessionWithReferralURL:v13 referralApplication:0];

  CFStringRef v14 = [(ICWindowSceneDelegate *)self viewControllerManager];
  [v14 performActionForShortcutItem:v6];
}

- (void)performPPTForegroundLaunchTasksIfNecessary
{
  if ([(ICWindowSceneDelegate *)self pptLaunchTasksComplete]) {
    return;
  }
  [(ICWindowSceneDelegate *)self setPptLaunchTasksComplete:1];
  id v3 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D8678(v3);
  }

  id v4 = +[ICAppDelegate sharedInstance];
  unsigned int v5 = [v4 isRunningPPT];

  if (!v5)
  {
    int v12 = 0;
LABEL_18:
    int v13 = 0;
    goto LABEL_19;
  }
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"launchToFolderList"];

  if (v7)
  {
    id v8 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8644();
    }
  }
  long long v9 = +[NSUserDefaults standardUserDefaults];
  unsigned int v10 = [v9 BOOLForKey:@"launchToNotesList"];

  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8610();
    }
LABEL_17:
    int v12 = v10 ^ 1;

    goto LABEL_18;
  }
  if ((v7 & 1) == 0)
  {
    id v11 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000361D4();
    }
    goto LABEL_17;
  }
  int v12 = 0;
  int v13 = 1;
LABEL_19:
  CFStringRef v14 = +[ICApplicationTestingHelper sharedHelper];
  id v15 = [v14 testNoteIdentifier];

  if (v13)
  {
    id v16 = [(ICWindowSceneDelegate *)self viewControllerManager];
    [v16 showAccountListAnimated:0];
  }
  else
  {
    if (v15) {
      int v17 = v12;
    }
    else {
      int v17 = 0;
    }
    if (v17 == 1 && [v15 length])
    {
      int v18 = +[ICNoteContext sharedContext];
      id v19 = [v18 managedObjectContext];
      id v16 = +[ICNote noteWithIdentifier:v15 includeDeleted:0 context:v19];

      __int16 v20 = [(ICWindowSceneDelegate *)self viewControllerManager];
      id v21 = [v16 objectID];
      [v20 selectNoteWithObjectID:v21 scrollState:0 startEditing:0 animated:0 ensurePresented:1];
    }
    else
    {
      unsigned __int8 v22 = +[ICNoteContext sharedContext];
      long long v23 = [v22 managedObjectContext];
      id v16 = +[ICAccount localAccountInContext:v23];

      __int16 v20 = [(ICWindowSceneDelegate *)self viewControllerManager];
      id v21 = [v16 objectID];
      [v20 selectContainerWithIdentifier:v21 usingRootViewController:1 deferUntilDataLoaded:0 animated:0];
    }
  }
}

- (void)handleRecordingUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[ICNoteContext sharedContext];
  unsigned int v5 = [v4 managedObjectContext];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v6 = +[UIApplication sharedApplication];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100099D70;
  v14[3] = &unk_1006265A8;
  v14[4] = &v15;
  id v7 = [v6 beginBackgroundTaskWithExpirationHandler:v14];

  v16[3] = (uint64_t)v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100099D8C;
  v10[3] = &unk_100625CA0;
  id v8 = v3;
  id v11 = v8;
  id v9 = v5;
  id v12 = v9;
  int v13 = &v15;
  [v9 performBlockAndWait:v10];

  _Block_object_dispose(&v15, 8);
}

- (void)handleAcceptingCloudKitShareWithMetadata:(id)a3 withWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICAppDelegate sharedInstance];
  id v9 = [v8 analyticsController];
  unsigned int v10 = +[NSURL URLWithString:kICNACloudKitShareReferralURL];
  [v9 startSessionWithReferralURL:v10 referralApplication:0];

  id v11 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User accepted CloudKit share with metadata: %@", buf, 0xCu);
  }

  id v12 = +[ICNoteContext sharedContext];
  int v13 = [v12 managedObjectContext];

  CFStringRef v14 = [(ICWindowSceneDelegate *)self icWindow];
  uint64_t v15 = [v14 viewControllerManager];

  if (+[ICAccount hasActiveCloudKitAccountInContext:v13])
  {
    id v16 = [v6 share];
    uint64_t v17 = [v16 URL];

    if (v17)
    {
      uint64_t v18 = +[ICCollaborationUIController sharedInstance];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10009A558;
      v44[3] = &unk_100627B48;
      v45 = v15;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10009A6B0;
      v42[3] = &unk_100627B70;
      v43 = v45;
      [v18 processShareAcceptanceWithMetadata:v6 windowScene:v7 managedObjectContext:v13 alertBlock:v44 showObjectBlock:v42];

      id v19 = v45;
    }
    else
    {
      id v19 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1004D86FC((uint64_t)v6, v19);
      }
    }
  }
  else
  {
    v36 = v7;
    __int16 v20 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tried to accept share, but didn't have modern notes.", buf, 2u);
    }

    int IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
    unsigned __int8 v22 = +[NSBundle mainBundle];
    long long v23 = v22;
    if (IsAppleAccountBrandingEnabled) {
      CFStringRef v24 = @"To open shared notes, you’ll need to upgrade your Apple Account.";
    }
    else {
      CFStringRef v24 = @"To open shared notes, you’ll need to upgrade your iCloud account.";
    }
    uint64_t v35 = [v22 localizedStringForKey:v24 value:&stru_10063F3D8 table:0];

    long long v25 = +[NSBundle mainBundle];
    long long v26 = [v25 localizedStringForKey:@"Upgrade Your Notes" value:&stru_10063F3D8 table:0];
    id v19 = +[UIAlertController alertControllerWithTitle:v26 message:v35 preferredStyle:1];

    long long v27 = +[NSBundle mainBundle];
    long long v28 = [v27 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];
    CFStringRef v29 = +[UIAlertAction actionWithTitle:v28 style:1 handler:0];

    [v19 addAction:v29];
    v30 = +[NSBundle mainBundle];
    v31 = [v30 localizedStringForKey:@"Upgrade" value:&stru_10063F3D8 table:0];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10009A7BC;
    v37[3] = &unk_100627BC0;
    v37[4] = self;
    id v32 = v15;
    id v38 = v32;
    id v39 = v13;
    id v40 = v36;
    id v41 = v6;
    __int16 v33 = +[UIAlertAction actionWithTitle:v31 style:0 handler:v37];

    [v19 addAction:v33];
    int v34 = [v32 trailingSidebarViewController];
    [v34 presentViewController:v19 animated:1 completion:0];

    id v7 = v36;
    uint64_t v17 = (void *)v35;
  }
}

- (id)archiveForUserActivities:(id)a3 isSourceApplicationExternal:(BOOL)a4 lastSavedArchive:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v107 = sub_1000C1484();
  v108 = +[ICNoteContext sharedContext];
  v112 = [v108 managedObjectContext];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v8 = v6;
  id v119 = [v8 countByEnumeratingWithState:&v121 objects:v129 count:16];
  if (!v119)
  {

    unsigned int v10 = 0;
    v97 = 0;
    id v12 = 0;
    v98 = 0;
    id v13 = 0;
    if (!v7) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  v104 = v7;
  unsigned int v10 = 0;
  char v115 = 0;
  uint64_t v11 = 0;
  id v12 = 0;
  v109 = 0;
  id v13 = 0;
  uint64_t v118 = *(void *)v122;
  uint64_t v113 = ICNotesEditNoteUserActivityType;
  uint64_t v111 = ICUserActivityInfoDictionaryNoteIDKey;
  *(void *)&long long v9 = 138412290;
  long long v103 = v9;
  id v110 = v8;
  do
  {
    CFStringRef v14 = 0;
    do
    {
      v120 = v10;
      if (*(void *)v122 != v118) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void **)(*((void *)&v121 + 1) + 8 * (void)v14);
      objc_opt_class();
      id v16 = [v15 userInfo];
      uint64_t v17 = [v16 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];
      uint64_t v18 = ICDynamicCast();

      if (v18)
      {
        +[NSURL URLWithString:v18];
        id v12 = v19 = v12;
LABEL_46:

        unsigned int v10 = v120;
        goto LABEL_47;
      }
      __int16 v20 = [v15 activityType];
      unsigned int v21 = [v20 isEqualToString:@"com.apple.notes.open.object"];

      id v117 = v13;
      if (v21)
      {
        unsigned __int8 v22 = [v15 targetContentIdentifier];
        id v19 = +[NSURL URLWithString:v22];

        uint64_t v114 = v11;
        if (v19)
        {
          if (+[ICAppURLUtilities isShowFolderListURL:v19])goto LABEL_11; {
          if (+[ICAppURLUtilities isShowDefaultFolderURL:v19])
          }
          {
            uint64_t v35 = +[NotesApp sharedNotesApp];
            v36 = [v35 noteContext];
            v37 = +[ICDefaultAccountUtilities defaultFolderWithHTMLNoteContext:v36];
            id v38 = [v37 objectID];
            uint64_t v39 = [v38 URIRepresentation];

            BOOL v23 = 0;
            id v12 = v39;
            id v8 = v110;
            goto LABEL_44;
          }
          if (v108)
          {
            id v55 = +[ICAppURLUtilities objectIDForModernFolderMentionedInURL:noteContext:](ICAppURLUtilities, "objectIDForModernFolderMentionedInURL:noteContext:", v19);

            if (!v55)
            {
              v109 = 0;
              goto LABEL_36;
            }
LABEL_43:
            uint64_t v59 = [v55 URIRepresentation:v103];

            BOOL v23 = 0;
            id v12 = v59;
            v109 = v55;
          }
          else
          {
LABEL_36:
            if (v112
              && +[ICAppURLUtilities isShowVirtualSmartFolderURL:v19])
            {
              uint64_t v56 = +[ICAppURLUtilities virtualSmartFolderMentionedInURL:v19 context:v112];

              BOOL v23 = 0;
              v120 = v56;
            }
            else
            {
              if (v107)
              {
                id v55 = +[ICAppURLUtilities objectIDForHTMLFolderMentionedInURL:context:](ICAppURLUtilities, "objectIDForHTMLFolderMentionedInURL:context:", v19);

                if (v55) {
                  goto LABEL_43;
                }
                v109 = 0;
              }
              if (v112
                && +[ICAppURLUtilities isShowNoteURL:v19])
              {
                v85 = +[ICAppURLUtilities predicateForNotesMentionedInURL:v19];
                BOOL v23 = v85 != 0;
                if (v85)
                {
                  v86 = +[ICNote notesMatchingPredicate:v85 context:v112];
                  v87 = [v86 firstObject];
                  v88 = [v87 objectID];
                  uint64_t v116 = [v88 URIRepresentation];

                  id v8 = v110;
                  id v12 = v116;
                }
              }
              else
              {
                uint64_t v89 = +[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:](ICAppURLUtilities, "objectIDURIRepresentationForHTMLNoteMentionedInURL:", v19, (void)v103);

                if (v89)
                {
                  BOOL v23 = 1;
                  id v12 = v89;
                }
                else if (+[ICAppURLUtilities isShowHTMLNoteURL:v19])
                {
                  id v12 = +[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:v19];
                  BOOL v23 = 1;
                }
                else
                {
                  id v12 = os_log_create("com.apple.notes", "UI");
                  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v103;
                    v126 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot handle open object URL {url: %@}", buf, 0xCu);
                  }
LABEL_11:

                  BOOL v23 = 0;
                  id v12 = 0;
                }
              }
            }
          }
        }
        else
        {
          int v34 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_1004D8774(v127, v15, &v128, v34);
          }

          BOOL v23 = 0;
        }
LABEL_44:
        v60 = [v15 userInfo:v103];
        v61 = [v60 objectForKeyedSubscript:@"ICUseAuxiliaryWindow"];
        unsigned __int8 v62 = [v61 isEqual:&__kCFBooleanTrue];

        char v115 = v23 & v62;
        uint64_t v11 = v114;
LABEL_45:
        id v13 = v117;
        goto LABEL_46;
      }
      CFStringRef v24 = (void *)v11;
      long long v25 = [v15 activityType];
      unsigned int v26 = [v25 isEqual:v113];

      if (v26)
      {
        long long v27 = [v15 userInfo];
        id v19 = [v27 objectForKeyedSubscript:v111];

        long long v28 = +[ICNote noteWithIdentifier:v19 context:v112];
        if ([v28 markedForDeletion]) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
      CFStringRef v29 = [v15 activityType];
      unsigned int v30 = [v29 isEqual:@"com.apple.Notes"];

      if (v30)
      {
        v31 = +[NotesApp sharedNotesApp];
        id v19 = [v31 noteContext];

        long long v28 = sub_100074554(v15, v19, 0);
        if ([v28 isMarkedForDeletion])
        {
LABEL_19:
          uint64_t v11 = (uint64_t)v24;

          goto LABEL_45;
        }
LABEL_17:
        if ((objc_msgSend(v28, "isDeleted", (void)v103) & 1) == 0)
        {
          id v32 = [v28 objectID];
          uint64_t v33 = [v32 URIRepresentation];

          id v12 = v33;
        }
        goto LABEL_19;
      }
      id v40 = [v15 activityType];
      id v41 = +[ICNotesFolderIntent className];
      unsigned int v42 = [v40 isEqual:v41];

      if (v42)
      {
        id v19 = [v15 interaction];
        uint64_t v43 = [v19 intent];
        if (v43)
        {
          v44 = (void *)v43;
          v45 = [v19 intent];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          id v8 = v110;
          if (isKindOfClass)
          {
            id v47 = [v19 intent];
            v48 = [v47 folder];
            uint64_t v11 = (uint64_t)v24;
            if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v105 = v47;
              v49 = [v48 identifier];
              uint64_t v50 = +[NSURL URLWithString:v49];

              v106 = (void *)v50;
              if (v108)
              {
                v51 = &ICFolderNameMaxLength_ptr;
                uint64_t v52 = +[ICAppURLUtilities objectIDForModernFolderMentionedInURL:noteContext:](ICAppURLUtilities, "objectIDForModernFolderMentionedInURL:noteContext:", v50);

                if (v52)
                {
                  uint64_t v53 = [v52 URIRepresentation];
                  v54 = v12;
                  id v12 = v53;
                  v109 = v52;
                  uint64_t v11 = (uint64_t)v24;
                  id v13 = v117;
                  goto LABEL_88;
                }
                v109 = 0;
                uint64_t v11 = (uint64_t)v24;
              }
              else
              {
                uint64_t v11 = (uint64_t)v24;
                v51 = &ICFolderNameMaxLength_ptr;
              }
              id v13 = v117;
              if (v107)
              {
                v93 = [v51[198] objectIDForHTMLFolderMentionedInURL:v106];

                if (v93)
                {
                  uint64_t v94 = [v93 URIRepresentation];
                  v54 = v12;
                  id v12 = v94;
                  v109 = v93;
LABEL_88:
                  id v47 = v105;
LABEL_92:

                  goto LABEL_93;
                }
                v109 = 0;
              }
              id v47 = v105;
              if (objc_msgSend(v51[198], "isShowVirtualSmartFolderURL:", v106, v103))
              {
                uint64_t v95 = +[ICAppURLUtilities virtualSmartFolderMentionedInURL:v106 context:v112];
                v54 = v120;
                v120 = v95;
                goto LABEL_92;
              }
LABEL_93:
            }
            else
            {
              id v13 = v117;
            }

            goto LABEL_46;
          }
        }
        else
        {
          id v8 = v110;
        }
        uint64_t v11 = (uint64_t)v24;
        goto LABEL_45;
      }
      id v57 = [v15 activityType];
      unsigned int v58 = [v57 isEqual:CSQueryContinuationActionType];

      if (v58)
      {
        id v19 = [v15 userInfo];
        uint64_t v11 = [v19 objectForKey:CSSearchQueryString];

        id v8 = v110;
        goto LABEL_45;
      }
      long long v70 = [v15 activityType];
      v71 = (objc_class *)objc_opt_class();
      CFStringRef v72 = NSStringFromClass(v71);
      unsigned int v73 = [v70 isEqual:v72];

      if (v73)
      {
        v74 = [v15 userInfo];
        v75 = NSStringFromSelector("content");
        __int16 v76 = [v74 objectForKey:v75];

        id v8 = v110;
        unsigned int v10 = v120;
        if (![v76 length])
        {
          [v15 userInfo];
          id v19 = v90 = v76;
          v91 = NSStringFromSelector("title");
          uint64_t v92 = [v19 objectForKeyedSubscript:v91];

          uint64_t v11 = v92;
          goto LABEL_45;
        }
        uint64_t v11 = (uint64_t)v76;
      }
      else
      {
        int v77 = [v15 activityType];
        unsigned int v78 = [v77 isEqual:@"TUUserActivityCreateCallRecording"];

        if (v78)
        {
          objc_opt_class();
          v79 = [v15 userInfo];
          v80 = [v79 objectForKeyedSubscript:@"uniqueProxyIdentifier"];
          id v19 = ICDynamicCast();

          v81 = [v19 UUIDString];
          v82 = +[ICNote noteWithIdentifier:v81 context:v112];
          id v8 = v110;
          if (([v82 markedForDeletion] & 1) == 0
            && ([v82 isDeleted] & 1) == 0)
          {
            v83 = [v82 objectID];
            uint64_t v84 = [v83 URIRepresentation];

            id v12 = v84;
          }
          uint64_t v11 = (uint64_t)v24;

          goto LABEL_45;
        }
        id v8 = v110;
        unsigned int v10 = v120;
        uint64_t v11 = (uint64_t)v24;
      }
      id v13 = v117;
LABEL_47:
      if (v12) {
        BOOL v63 = 0;
      }
      else {
        BOOL v63 = v10 == 0;
      }
      if (!v63 || v11 != 0)
      {
        id v65 = +[ICWindowStateArchive windowStateArchiveWithEmptyState];

        [v65 setCurrentObjectIDURL:v12];
        [v65 setCurrentVirtualSmartFolderIdentifier:v10];
        [v10 type];
        long long v67 = v66 = v11;
        [v65 setCurrentVirtualSmartFolderType:v67];

        long long v68 = [v10 accountObjectID];
        long long v69 = [v68 URIRepresentation];
        [v65 setCurrentVirtualSmartFolderAccountObjectIDURL:v69];

        uint64_t v11 = v66;
        [v65 setIsAuxiliaryWindow:v115 & 1];
        [v65 setCurrentSearchTerm:v66];
        id v13 = v65;
      }

      CFStringRef v14 = (char *)v14 + 1;
    }
    while (v119 != v14);
    id v96 = [v8 countByEnumeratingWithState:&v121 objects:v129 count:16];
    id v119 = v96;
  }
  while (v96);

  id v7 = v104;
  if (!v104)
  {
    v97 = (void *)v11;
    v98 = v109;
    goto LABEL_105;
  }
  v97 = (void *)v11;
  if (!v13)
  {
    v98 = v109;
LABEL_104:
    id v13 = v7;
    goto LABEL_105;
  }
  [v13 setCurrentNoteContainerViewMode:[v104 currentNoteContainerViewMode]];
  [v13 setIsPrimaryContentVisible:[v104 isPrimaryContentVisible]];
  [v13 setIsSupplementaryContentVisible:[v104 isSupplementaryContentVisible]];
  v98 = v109;
  if (ICInternalSettingsIsSelectionStateTrackingEnabled())
  {
    v99 = [v104 selectionState];
    id v100 = [v99 copy];
    [v13 setSelectionState:v100];
  }
LABEL_105:
  id v101 = v13;

  return v101;
}

- (ICWindow)icWindow
{
  return self->_icWindow;
}

- (BOOL)pptLaunchTasksComplete
{
  return self->_pptLaunchTasksComplete;
}

- (void)setPptLaunchTasksComplete:(BOOL)a3
{
  self->_pptLaunchTasksComplete = a3;
}

- (BOOL)isAnyWelcomeScreenVisible
{
  return self->_isAnyWelcomeScreenVisible;
}

- (void)setSessionIdentifierToStateRestorationActivity:(id)a3
{
}

- (NSObject)sceneDidDisconnectNotificationToken
{
  return self->_sceneDidDisconnectNotificationToken;
}

- (void)setSceneDidDisconnectNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDidDisconnectNotificationToken, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierToStateRestorationActivity, 0);

  objc_storeStrong((id *)&self->_icWindow, 0);
}

@end