@interface GKBulletinController
+ (id)bulletinQueue;
+ (id)sharedController;
+ (void)startBulletinController;
- (GKAcceptedInviteManager)acceptedInviteManager;
- (GKBulletinController)init;
- (NSMutableDictionary)bulletins;
- (NSSet)notificationCategories;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)bulletinStorageFilePathForEnvironment:(int64_t)a3;
- (id)categoryWithIdentifier:(id)a3 acceptActionTitle:(id)a4 acceptActionIcon:(id)a5 declineActionTitle:(id)a6 declineActionIcon:(id)a7 viewActionTitle:(id)a8 viewActionIcon:(id)a9;
- (id)categoryWithIdentifier:(id)a3 defaultActionTitle:(id)a4 defaultActionIcon:(id)a5 dismissActionTitle:(id)a6 dismissActionIcon:(id)a7;
- (id)getBulletinsOfType:(Class)a3;
- (id)notificationRequestFromBulletin:(id)a3;
- (id)registeredCategories;
- (id)userInfoFromBulletin:(id)a3;
- (void)clearChallengeBulletinsForChallengeID:(id)a3;
- (void)clearSavedBulletins;
- (void)clearTurnBasedBulletinsForMatchID:(id)a3;
- (void)dealloc;
- (void)expireBulletin:(id)a3;
- (void)loadBulletins;
- (void)presentBulletin:(id)a3;
- (void)removeAllBulletins;
- (void)removeBulletin:(id)a3;
- (void)setAcceptedInviteManager:(id)a3;
- (void)setBulletins:(id)a3;
- (void)setNotificationCategories:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)updateSavedBulletins;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)withdrawBulletin:(id)a3;
@end

@implementation GKBulletinController

- (id)getBulletinsOfType:(Class)a3
{
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletinController+Common getBulletinsOfType:", buf, 2u);
  }
  v6 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [(GKBulletinController *)self bulletins];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(GKBulletinController *)self bulletins];
        v14 = [v13 objectForKey:v12];

        if (objc_opt_isKindOfClass()) {
          [v6 setObject:v14 forKey:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)bulletinQueue
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController+Common bulletinQueue", v6, 2u);
  }
  if (qword_100329970 != -1) {
    dispatch_once(&qword_100329970, &stru_1002DC860);
  }
  id v4 = (void *)qword_100329978;

  return v4;
}

- (id)bulletinStorageFilePathForEnvironment:(int64_t)a3
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common bulletinStorageFilePathForEnvironment:", v8, 2u);
  }
  v5 = GKSupportDataRoot();
  v6 = [v5 stringByAppendingPathComponent:@"Bulletins.bulletins"];

  return v6;
}

- (void)clearSavedBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearSavedBulletins", buf, 2u);
  }
  v5 = [(id)objc_opt_class() bulletinQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015BDB4;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_sync(v5, block);
}

- (void)updateSavedBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController+Common updateSavedBulletins", buf, 2u);
  }
  v5 = [(id)objc_opt_class() bulletinQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015C108;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_sync(v5, block);
}

- (void)loadBulletins
{
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletinController+Common loadBulletins", buf, 2u);
  }
  v6 = [(id)objc_opt_class() bulletinQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015C45C;
  v7[3] = &unk_1002D9B20;
  v7[4] = self;
  v7[5] = a2;
  dispatch_sync(v6, v7);
}

- (void)clearTurnBasedBulletinsForMatchID:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearTurnBasedBulletinsForMatchID:", buf, 2u);
  }
  v7 = [(GKBulletinController *)self getBulletinsOfType:objc_opt_class()];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015CE00;
  v9[3] = &unk_1002DC888;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

- (void)clearChallengeBulletinsForChallengeID:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController+Common clearChallengeBulletinsForChallengeID:", buf, 2u);
  }
  v7 = [(GKBulletinController *)self getBulletinsOfType:objc_opt_class()];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015CF9C;
  v9[3] = &unk_1002DC8B0;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

+ (void)startBulletinController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinController startBulletinController", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting up the bulletin controller", buf, 2u);
  }
  v7 = +[GKDevice currentDevice];
  unsigned int v8 = [v7 isFocusDevice];

  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015D418;
    block[3] = &unk_1002DADF0;
    block[4] = a1;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = [a1 sharedController];
  }
}

+ (id)sharedController
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletinController sharedController", v6, 2u);
  }
  if (qword_100329988 != -1) {
    dispatch_once(&qword_100329988, &stru_1002DC8F0);
  }
  id v4 = (void *)qword_100329980;

  return v4;
}

- (void)dealloc
{
  [(UNUserNotificationCenter *)self->_userNotificationCenter removeAllPendingNotificationRequests];
  [(UNUserNotificationCenter *)self->_userNotificationCenter removeAllDeliveredNotifications];
  [(UNUserNotificationCenter *)self->_userNotificationCenter setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)GKBulletinController;
  [(GKBulletinController *)&v3 dealloc];
}

- (GKBulletinController)init
{
  v18.receiver = self;
  v18.super_class = (Class)GKBulletinController;
  id v2 = [(GKBulletinController *)&v18 init];
  if (v2)
  {
    objc_super v3 = objc_alloc_init(GKAcceptedInviteManager);
    acceptedInviteManager = v2->_acceptedInviteManager;
    v2->_acceptedInviteManager = v3;
    id v5 = v3;

    v6 = [(id)objc_opt_class() bulletinQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015D770;
    block[3] = &unk_1002D40E0;
    v7 = v2;
    long long v17 = v7;
    dispatch_sync(v6, block);

    id v8 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.gamecenter"];
    [(GKBulletinController *)v7 setUserNotificationCenter:v8];

    id v9 = [(GKBulletinController *)v7 userNotificationCenter];
    [v9 setDelegate:v7];

    id v10 = [(GKBulletinController *)v7 userNotificationCenter];
    [v10 setWantsNotificationResponsesDelivered];

    v11 = [(GKBulletinController *)v7 registeredCategories];
    [(GKBulletinController *)v7 setNotificationCategories:v11];

    uint64_t v12 = [(GKBulletinController *)v7 userNotificationCenter];
    v13 = [(GKBulletinController *)v7 notificationCategories];
    [v12 setNotificationCategories:v13];

    v14 = [(GKBulletinController *)v7 userNotificationCenter];
    [v14 requestAuthorizationWithOptions:71 completionHandler:&stru_1002DC910];
  }
  return v2;
}

- (id)registeredCategories
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = +[GCFLocalizedStrings APP_STORE];
  id v5 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE];
  v6 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsAppStoreClose" defaultActionTitle:v4 defaultActionIcon:@"appstore.app" dismissActionTitle:v5 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v6];

  v7 = +[GCFLocalizedStrings PLAY_TURN_BASED_TURN_BUTTON_TITLE];
  id v8 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE];
  id v9 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsPlayClose" defaultActionTitle:v7 defaultActionIcon:@"play" dismissActionTitle:v8 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v9];

  id v10 = +[GCFLocalizedStrings APP_STORE];
  v11 = +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE];
  uint64_t v12 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsAppStoreDecline" defaultActionTitle:v10 defaultActionIcon:@"appstore.app" dismissActionTitle:v11 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v12];

  v13 = +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE];
  v14 = +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE];
  v15 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsAcceptDecline" defaultActionTitle:v13 defaultActionIcon:@"checkmark.circle" dismissActionTitle:v14 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v15];

  long long v16 = +[GCFLocalizedStrings APP_STORE];
  long long v17 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE];
  objc_super v18 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsAppStoreIgnore" defaultActionTitle:v16 defaultActionIcon:@"appstore.app" dismissActionTitle:v17 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v18];

  long long v19 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME];
  v20 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_IGNORE];
  v21 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsLaunchGameIgnore" defaultActionTitle:v19 defaultActionIcon:@"play" dismissActionTitle:v20 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v21];

  v22 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_LAUNCH_GAME];
  v23 = +[GCFLocalizedStrings CHALLENGE_RECEIVED_DECLINE];
  v24 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsLaunchGameDecline" defaultActionTitle:v22 defaultActionIcon:@"play" dismissActionTitle:v23 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v24];

  v25 = +[GCFLocalizedStrings BULLETIN_VIEW];
  v26 = +[GCFLocalizedStrings BULLETIN_IGNORE];
  v27 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsViewIgnore" defaultActionTitle:v25 defaultActionIcon:@"play" dismissActionTitle:v26 dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v27];

  v28 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsTTRInitiation" defaultActionTitle:@"File a radar" defaultActionIcon:@"ant.circle" dismissActionTitle:@"Not for now" dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v28];

  v29 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationCategoryActionsTTRUploadRequest" defaultActionTitle:@"Upload in Tap-to-Radar" defaultActionIcon:@"ant.circle" dismissActionTitle:@"Not for now" dismissActionIcon:@"xmark.circle"];
  [v3 addObject:v29];

  v30 = +[GCFLocalizedStrings BULLETIN_ACCEPT];
  v31 = +[GCFLocalizedStrings BULLETIN_IGNORE];
  v32 = +[GCFLocalizedStrings BULLETIN_VIEW_PROFILE];
  v33 = [(GKBulletinController *)self categoryWithIdentifier:@"GKNotificationsCategoryActionsFriendRequest" acceptActionTitle:v30 acceptActionIcon:@"checkmark" declineActionTitle:v31 declineActionIcon:@"xmark" viewActionTitle:v32 viewActionIcon:@"arrow.up.forward.app"];
  [v3 addObject:v33];

  return v3;
}

- (id)categoryWithIdentifier:(id)a3 defaultActionTitle:(id)a4 defaultActionIcon:(id)a5 dismissActionTitle:(id)a6 dismissActionIcon:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  if ([v12 length])
  {
    long long v16 = +[UNNotificationActionIcon iconWithSystemImageName:v12];
    long long v17 = +[UNNotificationAction actionWithIdentifier:@"GKDefault" title:v11 options:0 icon:v16];
  }
  else
  {
    long long v17 = +[UNNotificationAction actionWithIdentifier:@"GKDefault" title:v11 options:0 icon:0];
  }
  if ([v14 length])
  {
    objc_super v18 = +[UNNotificationActionIcon iconWithSystemImageName:v14];
    long long v19 = +[UNNotificationAction actionWithIdentifier:@"GKDismissed" title:v13 options:0 icon:v18];
  }
  else
  {
    long long v19 = +[UNNotificationAction actionWithIdentifier:@"GKDismissed" title:v13 options:0 icon:0];
  }
  v23[0] = v17;
  v23[1] = v19;
  v20 = +[NSArray arrayWithObjects:v23 count:2];
  v21 = +[UNNotificationCategory categoryWithIdentifier:v15 actions:v20 intentIdentifiers:&__NSArray0__struct options:1];

  return v21;
}

- (id)categoryWithIdentifier:(id)a3 acceptActionTitle:(id)a4 acceptActionIcon:(id)a5 declineActionTitle:(id)a6 declineActionIcon:(id)a7 viewActionTitle:(id)a8 viewActionIcon:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v32 = a6;
  id v16 = a7;
  id v30 = a8;
  id v17 = a9;
  id v18 = a3;
  if ([v15 length])
  {
    long long v19 = +[UNNotificationActionIcon iconWithSystemImageName:v15];
    v20 = +[UNNotificationAction actionWithIdentifier:@"GKAccepted" title:v14 options:0 icon:v19];
  }
  else
  {
    v20 = +[UNNotificationAction actionWithIdentifier:@"GKAccepted" title:v14 options:0 icon:0];
  }
  v31 = v14;
  if ([v16 length])
  {
    v21 = +[UNNotificationActionIcon iconWithSystemImageName:v16];
    v22 = +[UNNotificationAction actionWithIdentifier:@"GKDeclined" title:v32 options:0 icon:v21];
  }
  else
  {
    v22 = +[UNNotificationAction actionWithIdentifier:@"GKDeclined" title:v32 options:0 icon:0];
  }
  if (objc_msgSend(v17, "length", v15))
  {
    v23 = +[UNNotificationActionIcon iconWithSystemImageName:v17];
    v24 = v30;
    v25 = +[UNNotificationAction actionWithIdentifier:@"GKView" title:v30 options:0 icon:v23];
  }
  else
  {
    v24 = v30;
    v25 = +[UNNotificationAction actionWithIdentifier:@"GKView" title:v30 options:0 icon:0];
  }
  v33[0] = v20;
  v33[1] = v22;
  v33[2] = v25;
  v26 = +[NSArray arrayWithObjects:v33 count:3];
  v27 = +[UNNotificationCategory categoryWithIdentifier:v18 actions:v26 intentIdentifiers:&__NSArray0__struct options:0];

  return v27;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v47 = a3;
  id v7 = a4;
  v48 = (void (**)(void))a5;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", (uint8_t *)&buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  id v11 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "response: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000;
  v58 = sub_10015E908;
  v59 = sub_10015E918;
  id v60 = 0;
  id v12 = [(id)objc_opt_class() bulletinQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015E920;
  block[3] = &unk_1002D6408;
  p_long long buf = &buf;
  void block[4] = self;
  id v13 = v7;
  id v51 = v13;
  dispatch_sync(v12, block);

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    id v15 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = *(void **)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v54 = 138412290;
      v55 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "bulletin: %@", v54, 0xCu);
    }
    v46 = [v13 actionIdentifier];
    id v17 = [v13 notification];
    id v18 = [v17 request];
    long long v19 = [v18 content];
    v20 = [v19 expirationDate];
    if (v20)
    {
      v21 = [v13 notification];
      v22 = [v21 request];
      v23 = [v22 content];
      v24 = [v23 expirationDate];
      [v24 timeIntervalSinceNow];
      BOOL v26 = v25 > 0.0;

      if (!v26)
      {
        v27 = &GKBulletinExpiredActionID;
        goto LABEL_26;
      }
    }
    else
    {
    }
    v33 = [v13 actionIdentifier];
    unsigned __int8 v34 = [v33 isEqualToString:UNNotificationDefaultActionIdentifier];

    if (v34)
    {
      v27 = &GKBulletinDefaultActionID;
    }
    else
    {
      v35 = [v13 actionIdentifier];
      unsigned int v36 = [v35 isEqualToString:UNNotificationDismissActionIdentifier];

      if (!v36)
      {
        v37 = v46;
        if (v46) {
          goto LABEL_27;
        }
LABEL_29:
        v29 = v37;
        if (!os_log_GKGeneral) {
          id v43 = (id)GKOSLoggers();
        }
        v44 = os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v45 = *(void **)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v54 = 138412290;
          v55 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "no action for bulletin: %@", v54, 0xCu);
        }
        goto LABEL_33;
      }
      v27 = &GKBulletinDismissedActionID;
    }
LABEL_26:
    v37 = *v27;

    if (v37)
    {
LABEL_27:
      v29 = v37;
      [*(id *)(*((void *)&buf + 1) + 40) handleAction:v37];
      v38 = [(GKBulletinController *)self userNotificationCenter];
      v39 = [v13 notification];
      v40 = [v39 request];
      v41 = [v40 identifier];
      v53 = v41;
      v42 = +[NSArray arrayWithObjects:&v53 count:1];
      [v38 removeDeliveredNotificationsWithIdentifiers:v42];

      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (!os_log_GKGeneral) {
    id v28 = (id)GKOSLoggers();
  }
  v29 = os_log_GKMatch;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = [v13 notification];
    v31 = [v30 request];
    id v32 = [v31 identifier];
    *(_DWORD *)v54 = 138412290;
    v55 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "no bulletin for ID: %@", v54, 0xCu);
  }
LABEL_33:

  v48[2]();
  _Block_object_dispose(&buf, 8);
}

- (void)removeBulletin:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController removeBulletin:", buf, 2u);
  }
  id v7 = [(GKBulletinController *)self userNotificationCenter];
  id v8 = [v4 recordID];
  v23 = v8;
  id v9 = +[NSArray arrayWithObjects:&v23 count:1];
  [v7 removeDeliveredNotificationsWithIdentifiers:v9];

  id v10 = [(GKBulletinController *)self userNotificationCenter];
  id v11 = [v4 recordID];
  v22 = v11;
  id v12 = +[NSArray arrayWithObjects:&v22 count:1];
  [v10 removePendingNotificationRequestsWithIdentifiers:v12];

  id v13 = [(id)objc_opt_class() bulletinQueue];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10015EBCC;
  id v18 = &unk_1002D3B38;
  long long v19 = self;
  id v20 = v4;
  id v14 = v4;
  dispatch_sync(v13, &v15);

  [(GKBulletinController *)self updateSavedBulletins];
}

- (void)withdrawBulletin:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS withdrawBullentin", v7, 2u);
  }
  [(GKBulletinController *)self removeBulletin:v4];
}

- (void)expireBulletin:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS expireBulletin:", v7, 2u);
  }
  [(GKBulletinController *)self removeBulletin:v4];
}

- (id)userInfoFromBulletin:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletinController userInfoFromBulletin:", v27, 2u);
  }
  v6 = +[NSMutableDictionary dictionary];
  id v7 = [v3 acceptAction];

  if (v7)
  {
    id v8 = [v3 acceptAction];
    id v9 = [v8 actionDictionary];
    [v6 setObject:v9 forKey:GKBulletinActionDictionaryAcceptKey];

    id v10 = &GKBulletinActionDictionaryDefaultKey;
  }
  else
  {
    id v11 = [v3 defaultAction];

    if (!v11) {
      goto LABEL_10;
    }
    id v10 = &GKBulletinActionDictionaryAcceptKey;
  }
  id v12 = [v3 defaultAction];
  id v13 = [v12 actionDictionary];
  [v6 setObject:v13 forKey:*v10];

LABEL_10:
  id v14 = [v3 defaultAction];

  if (v14)
  {
    id v15 = [v3 defaultAction];
    uint64_t v16 = [v15 actionDictionary];
    [v6 setObject:v16 forKey:GKBulletinActionDictionaryDefaultKey];
  }
  id v17 = [v3 declineAction];

  if (v17)
  {
    id v18 = [v3 declineAction];
  }
  else
  {
    long long v19 = [v3 dismissAction];

    if (!v19) {
      goto LABEL_17;
    }
    id v18 = [v3 dismissAction];
  }
  id v20 = v18;
  v21 = [v18 actionDictionary];
  [v6 setObject:v21 forKey:GKBulletinActionDictionaryDeclineKey];

LABEL_17:
  v22 = [v3 recordID];

  if (v22)
  {
    v23 = [v3 recordID];
    [v6 setObject:v23 forKey:GKBulletinRecordIDUserDataKey];
  }
  v24 = [v3 categoryIdentifier];

  if (v24)
  {
    double v25 = [v3 categoryIdentifier];
    [v6 setObject:v25 forKey:GKBulletinCategoryIDUserDataKey];
  }

  return v6;
}

- (id)notificationRequestFromBulletin:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletinController userNotificationFromBulletin:", buf, 2u);
  }
  id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v8 = [v4 date];
  [v7 setDate:v8];

  id v9 = [v4 expirationDate];
  [v7 setExpirationDate:v9];

  id v10 = [v4 message];
  [v7 setBody:v10];

  id v11 = [v4 title];
  [v7 setTitle:v11];

  id v12 = [(GKBulletinController *)self userInfoFromBulletin:v4];
  [v7 setUserInfo:v12];

  [v7 setShouldBackgroundDefaultAction:1];
  id v13 = [v4 categoryIdentifier];
  id v14 = [v13 length];

  if (v14)
  {
    id v15 = [v4 categoryIdentifier];
    [v7 setCategoryIdentifier:v15];
  }
  if ([v4 hasSound])
  {
    uint64_t v16 = +[UNMutableNotificationSound soundWithAlertType:17];
    if ([v4 bulletinType] != (id)2)
    {
      id v17 = [v4 soundPath];
      id v18 = [v17 length];

      if (v18)
      {
        long long v19 = [v4 soundPath];
      }
      else
      {
        id v20 = GKGameCenterNotificationsBundle();
        long long v19 = [v20 pathForResource:@"GKInvite" ofType:@"caf"];
      }
      v21 = +[NSURL fileURLWithPath:v19];
      [v16 setToneFileURL:v21];
    }
    [v7 setSound:v16];
  }
  uint64_t v22 = [v4 gameIcon];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [v4 gameIcon];
    double v25 = [v24 absoluteString];
    id v26 = [v25 length];

    if (v26)
    {
      v27 = [v4 gameIcon];
      id v28 = [v27 absoluteString];
      v29 = +[UNNotificationIcon iconAtPath:v28];

      [v7 setIcon:v29];
      [v7 setShouldShowSubordinateIcon:1];
    }
  }
  uint64_t v30 = (uint64_t)[v4 bulletinType];
  if (v30 <= 399)
  {
    if ((unint64_t)(v30 - 200) >= 2 && v30 != 2) {
      goto LABEL_24;
    }
LABEL_23:
    [v7 setInterruptionLevel:2];
    goto LABEL_24;
  }
  if (v30 == 600 || v30 == 400) {
    goto LABEL_23;
  }
LABEL_24:
  v31 = objc_opt_new();
  id v32 = [v4 attachments];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10015F490;
  v37[3] = &unk_1002DC938;
  id v38 = v31;
  id v33 = v31;
  [v32 enumerateObjectsUsingBlock:v37];

  [v7 setAttachments:v33];
  unsigned __int8 v34 = [v4 recordID];
  v35 = +[UNNotificationRequest requestWithIdentifier:v34 content:v7 trigger:0];

  return v35;
}

- (void)presentBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [(GKBulletinController *)self userNotificationCenter];
  v6 = [v5 notificationSettings];
  uint64_t v7 = (uint64_t)[v6 authorizationStatus];

  if (v7 > 1)
  {
    id v10 = [(GKBulletinController *)self notificationCategories];
    id v11 = [v4 updatedNotificationCategoriesOrNil:v10];

    if (v11)
    {
      [(GKBulletinController *)self setNotificationCategories:v11];
      id v12 = [(GKBulletinController *)self userNotificationCenter];
      id v13 = [(GKBulletinController *)self notificationCategories];
      [v12 setNotificationCategories:v13];
    }
    [v4 reportMetricsForPresented];
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    id v15 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS presentBulletin:", buf, 2u);
    }
    uint64_t v16 = [(id)objc_opt_class() bulletinQueue];
    uint64_t v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10015F91C;
    double v25 = &unk_1002D3B38;
    id v26 = self;
    id v17 = v4;
    id v27 = v17;
    dispatch_sync(v16, &v22);

    [(GKBulletinController *)self updateSavedBulletins];
    id v18 = [(GKBulletinController *)self notificationRequestFromBulletin:v17];
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    id v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "GKBulletinController: presenting notification request:%@", buf, 0xCu);
    }
    v21 = [(GKBulletinController *)self userNotificationCenter];
    [v21 addNotificationRequest:v18 withCompletionHandler:0];
  }
  else
  {
    id v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = (id)GKOSLoggers();
      id v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Not displaying notification because notifications are not authorized", buf, 2u);
    }
  }
}

- (void)removeAllBulletins
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinControlleriOS removeAllBulletins", buf, 2u);
  }
  id v5 = [(GKBulletinController *)self userNotificationCenter];
  [v5 removeAllDeliveredNotifications];

  v6 = [(id)objc_opt_class() bulletinQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015FAA0;
  block[3] = &unk_1002D40E0;
  void block[4] = self;
  dispatch_sync(v6, block);

  [(GKBulletinController *)self clearSavedBulletins];
}

- (NSMutableDictionary)bulletins
{
  return self->_bulletins;
}

- (void)setBulletins:(id)a3
{
}

- (GKAcceptedInviteManager)acceptedInviteManager
{
  return (GKAcceptedInviteManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcceptedInviteManager:(id)a3
{
}

- (NSSet)notificationCategories
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationCategories:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCategories, 0);
  objc_storeStrong((id *)&self->_acceptedInviteManager, 0);

  objc_storeStrong((id *)&self->_bulletins, 0);
}

@end