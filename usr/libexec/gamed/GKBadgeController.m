@interface GKBadgeController
+ (id)sharedController;
- (BOOL)isBadgingEnabledForBundleID:(id)a3;
- (GKBadgeController)init;
- (id)_badgeCountURL;
- (id)_dictionaryForBadgeType:(unint64_t)a3;
- (id)_plistKeyForBadgeType:(unint64_t)a3;
- (unint64_t)_badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4;
- (unint64_t)_totalBadgeCountForBundleID:(id)a3;
- (unint64_t)badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4;
- (void)badgeAllApplications;
- (void)badgeApplicationWithBundleID:(id)a3 badgeCount:(unint64_t)a4;
- (void)badgeBundleID:(id)a3 badgeCount:(unint64_t)a4;
- (void)registerBadgePermissionForBundleID:(id)a3 completionHandler:(id)a4;
- (void)setBadgeCount:(unint64_t)a3 forBundleID:(id)a4 badgeType:(unint64_t)a5;
- (void)synchronize;
- (void)unbadgeAllApplications;
@end

@implementation GKBadgeController

+ (id)sharedController
{
  if (qword_100329760 != -1) {
    dispatch_once(&qword_100329760, &stru_1002D9AF8);
  }
  v2 = (void *)qword_100329758;

  return v2;
}

- (id)_badgeCountURL
{
  v2 = GKInsecureCacheRoot();
  v3 = [v2 stringByAppendingPathComponent:GKGameCenterIdentifier];
  v4 = [v3 stringByAppendingPathExtension:@"badgeCounts"];

  v5 = +[NSURL fileURLWithPath:v4];

  return v5;
}

- (GKBadgeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKBadgeController;
  v2 = [(GKBadgeController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.badgecontroller.syncqueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    [(GKBadgeController *)v2 synchronize];
  }
  return v2;
}

- (id)_plistKeyForBadgeType:(unint64_t)a3
{
  return +[NSString stringWithFormat:@"%ld", a3];
}

- (void)synchronize
{
  if (self->_dirty)
  {
    uint64_t v3 = ++qword_100329768;
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    syncQueue = self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DD978;
    block[3] = &unk_1002D9B20;
    block[4] = self;
    block[5] = v3;
    dispatch_after(v4, syncQueue, block);
  }
  else
  {
    objc_super v6 = self->_syncQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000DDB48;
    v7[3] = &unk_1002D40E0;
    v7[4] = self;
    dispatch_async(v6, v7);
  }
}

- (BOOL)isBadgingEnabledForBundleID:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = +[GKPreferences shared];
  if ([v4 notificationBadgesEnabled])
  {
    v5 = +[NSBundle _gkBundleWithIdentifier:v3];
    unsigned __int8 v6 = [v5 _gkIsBadgingEnabled];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)badgeApplicationWithBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  id v6 = a3;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKBadgeController: badgeApplicationWithBundleID", buf, 2u);
  }
  if ([(GKBadgeController *)self isBadgingEnabledForBundleID:v6])
  {
    [(GKBadgeController *)self badgeBundleID:v6 badgeCount:a4];
  }
  else
  {
    v9 = +[NSBundle _gkBundleWithIdentifier:v6];
    unsigned int v10 = [v9 _gkIsBadgingEnabled];

    if (v10)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000DDF90;
      v16[3] = &unk_1002D9B48;
      v16[4] = self;
      id v17 = v6;
      unint64_t v18 = a4;
      [(GKBadgeController *)self registerBadgePermissionForBundleID:v17 completionHandler:v16];
    }
  }
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DE044;
  block[3] = &unk_1002D3B38;
  id v14 = v6;
  v15 = self;
  id v12 = v6;
  dispatch_async(syncQueue, block);
}

- (void)badgeBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  id v6 = (__CFString *)a3;
  id v7 = +[GKPreferences shared];
  unsigned int v8 = [v7 notificationBadgesEnabled];

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    unsigned int v10 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKBadgeController: badgeApplicationWithBundleID - Badging enabled", buf, 2u);
    }
    bzero(buf, 0x400uLL);
    if ([(GKBadgeController *)self isBadgingEnabledForBundleID:v6]
      && CFStringGetCString(v6, (char *)buf, 1024, 0x8000100u))
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers();
      }
      id v12 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        id v14 = +[NSNumber numberWithUnsignedInteger:a4];
        int v17 = 138412546;
        unint64_t v18 = v6;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Setting badge count for bundleID: %@ count: %@", (uint8_t *)&v17, 0x16u);
      }
      id v15 = [objc_alloc((Class)UISApplicationState) initWithBundleIdentifier:v6];
      v16 = +[NSNumber numberWithUnsignedInteger:a4];
      [v15 setBadgeValue:v16];
    }
  }
}

- (id)_dictionaryForBadgeType:(unint64_t)a3
{
  v5 = dispatch_get_current_queue();
  id v6 = v5;
  syncQueue = self->_syncQueue;
  if (v5 != syncQueue)
  {
    label = dispatch_queue_get_label(v5);
    id v9 = dispatch_queue_get_label(syncQueue);
    unsigned int v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKBadgeController _dictionaryForBadgeType:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", v11, "-[GKBadgeController _dictionaryForBadgeType:]", [v13 UTF8String], 207);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  id v15 = self->_badgeDictionaries[a3];

  return v15;
}

- (unint64_t)_badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = dispatch_get_current_queue();
  unsigned int v8 = v7;
  syncQueue = self->_syncQueue;
  if (v7 != syncQueue)
  {
    label = dispatch_queue_get_label(v7);
    id v11 = dispatch_queue_get_label(syncQueue);
    id v12 = +[NSThread callStackSymbols];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKBadgeController _badgeCountForBundleID:badgeType:]", label, v11, v12);
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"];
    id v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", v13, "-[GKBadgeController _badgeCountForBundleID:badgeType:]", [v15 UTF8String], 213);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }

  int v17 = [(GKBadgeController *)self _dictionaryForBadgeType:a4];
  unint64_t v18 = [v17 objectForKeyedSubscript:v6];
  id v19 = [v18 unsignedIntegerValue];

  return (unint64_t)v19;
}

- (unint64_t)badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_get_current_queue();
  id v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;

  if (v7 == syncQueue)
  {
    label = dispatch_queue_get_label((dispatch_queue_t)self->_syncQueue);
    unsigned int v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the same queue(\"%s\"), would deadlock at %@", "-[GKBadgeController badgeCountForBundleID:badgeType:]", label, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (dispatch_get_current_queue() != _syncQueue)\n[%s (%s:%d)]", v11, "-[GKBadgeController badgeCountForBundleID:badgeType:]", [v13 UTF8String], 219);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  if (!v6) {
    id v6 = GKGameCenterIdentifier;
  }
  id v15 = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DE814;
  block[3] = &unk_1002D9B70;
  void block[4] = self;
  id v20 = v6;
  v21 = &v23;
  unint64_t v22 = a4;
  id v16 = v6;
  dispatch_sync(v15, block);
  unint64_t v17 = v24[3];

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (unint64_t)_totalBadgeCountForBundleID:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  id v6 = v5;
  syncQueue = self->_syncQueue;
  if (v5 != syncQueue)
  {
    label = dispatch_queue_get_label(v5);
    id v9 = dispatch_queue_get_label(syncQueue);
    unsigned int v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKBadgeController _totalBadgeCountForBundleID:]", label, v9, v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", v11, "-[GKBadgeController _totalBadgeCountForBundleID:]", [v13 UTF8String], 232);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  uint64_t v15 = 0;
  unint64_t v16 = 0;
  badgeDictionaries = self->_badgeDictionaries;
  do
  {
    unint64_t v18 = [(NSMutableDictionary *)badgeDictionaries[v15] objectForKeyedSubscript:v4];
    v16 += (unint64_t)[v18 unsignedIntegerValue];

    ++v15;
  }
  while (v15 != 4);

  return v16;
}

- (void)setBadgeCount:(unint64_t)a3 forBundleID:(id)a4 badgeType:(unint64_t)a5
{
  id v8 = a4;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  unsigned int v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKBadgeController: setBadgeCount", buf, 2u);
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2
    && (+[GKPreferences shared],
        id v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 multiplayerAllowedPlayerType],
        v11,
        !v12))
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    uint64_t v15 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setBadgeCount: Ignoring TB and sessions badge count, multiplayer is restricted", buf, 2u);
    }
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    unint64_t v17 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "ignoring turn-based and sessions badge count update for %@ as multiplayer is restricted", buf, 0xCu);
    }
  }
  else
  {
    if (!v8) {
      id v8 = GKGameCenterIdentifier;
    }
    syncQueue = self->_syncQueue;
    unint64_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_1000DEC38;
    v21 = &unk_1002D9B98;
    unint64_t v22 = self;
    unint64_t v24 = a5;
    id v8 = v8;
    id v23 = v8;
    unint64_t v25 = a3;
    dispatch_async(syncQueue, &v18);
    [(GKBadgeController *)self synchronize];
  }
}

- (void)badgeAllApplications
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DED54;
  block[3] = &unk_1002D40E0;
  void block[4] = self;
  dispatch_async(syncQueue, block);
}

- (void)unbadgeAllApplications
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DEFB8;
  block[3] = &unk_1002D40E0;
  void block[4] = self;
  dispatch_async(syncQueue, block);
  [(GKBadgeController *)self synchronize];
}

- (void)registerBadgePermissionForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKBadgeController: registerBadgePermissionForBundleID:", buf, 2u);
  }
  if (v6 && ([v6 isEqualToString:GKGameCenterIdentifier] & 1) == 0)
  {
    unsigned int v10 = +[GKApplicationWorkspace defaultWorkspace];
    id v11 = [v10 applicationProxyForBundleID:v6];
    if ([v11 isInstalled] && (objc_msgSend(v11, "isRestricted") & 1) == 0)
    {
      syncQueue = self->_syncQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000DF2DC;
      block[3] = &unk_1002D3A48;
      void block[4] = self;
      id v14 = v6;
      id v15 = v7;
      dispatch_async(syncQueue, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  uint64_t v3 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end