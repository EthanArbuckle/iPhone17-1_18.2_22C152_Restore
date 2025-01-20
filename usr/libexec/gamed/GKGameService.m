@interface GKGameService
+ (Class)interfaceClass;
+ (id)sharedGameActivityStore;
+ (unint64_t)requiredEntitlements;
- (void)_getPerGameFriendsPlayerIDForBundleID:(id)a3 handler:(id)a4;
- (void)checkTCCAuthorization:(id)a3;
- (void)fetchMostRecentGameActivityForBundleID:(id)a3 handler:(id)a4;
- (void)getArcadeHighlightForAdamID:(id)a3 count:(int64_t)a4 handler:(id)a5;
- (void)getPerGameFriendsForBundleID:(id)a3 handler:(id)a4;
- (void)getPerGameSettingsForBundleID:(id)a3 handler:(id)a4;
- (void)resetTCCAuthorization:(id)a3;
- (void)setPerGameSettings:(id)a3 handler:(id)a4;
- (void)storeGameForBundleIDs:(id)a3 completion:(id)a4;
@end

@implementation GKGameService

+ (unint64_t)requiredEntitlements
{
  return 16;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedGameActivityStore
{
  if (qword_100329688 != -1) {
    dispatch_once(&qword_100329688, &stru_1002D5C60);
  }
  v2 = (void *)qword_100329680;

  return v2;
}

- (void)getArcadeHighlightForAdamID:(id)a3 count:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (qword_100329690 != -1) {
    dispatch_once(&qword_100329690, &stru_1002D5C80);
  }
  id v10 = objc_alloc((Class)ASCCollectionRequest);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004F6F8;
  v14[3] = &unk_1002D5D20;
  id v15 = [v10 initWithID:ASCCollectionIDGamesForYou kind:ASCLockupKindApp context:ASCLockupContextGameCenter limit:a4];
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v11 = v8;
  id v12 = v9;
  id v13 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

- (void)getPerGameSettingsForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 152, "-[GKGameService getPerGameSettingsForBundleID:handler:]");
    id v9 = [(GKService *)self transactionGroupWithName:v8];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005010C;
    v17[3] = &unk_1002D3D30;
    id v18 = v6;
    v19 = self;
    id v10 = v9;
    id v20 = v10;
    [v10 performOnManagedObjectContext:v17];
    id v11 = [(GKService *)self clientProxy];
    id v12 = [v11 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100050728;
    v14[3] = &unk_1002D3C38;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)setPerGameSettings:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 218, "-[GKGameService setPerGameSettings:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005095C;
  v19[3] = &unk_1002D3D30;
  id v20 = v6;
  id v10 = v9;
  id v21 = v10;
  v22 = self;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000510F8;
  v16[3] = &unk_1002D3930;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)getPerGameFriendsForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 321, "-[GKGameService getPerGameFriendsForBundleID:handler:]");
    id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100051328;
    v17[3] = &unk_1002D3980;
    void v17[4] = self;
    id v18 = v6;
    id v10 = v9;
    id v19 = v10;
    [v10 perform:v17];
    id v11 = [(GKService *)self clientProxy];
    id v12 = [v11 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100051740;
    v14[3] = &unk_1002D3930;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)checkTCCAuthorization:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 369, "-[GKGameService checkTCCAuthorization:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100051950;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100051AA8;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)resetTCCAuthorization:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 394, "-[GKGameService resetTCCAuthorization:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [(GKService *)self clientProxy];
  id v8 = [v7 bundleIdentifier];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100051CD4;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v16 = v8;
  id v9 = v8;
  [v6 perform:v15];
  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100051D80;
  v13[3] = &unk_1002D3A20;
  id v14 = v4;
  id v12 = v4;
  [v6 notifyOnQueue:v11 block:v13];
}

- (void)_getPerGameFriendsPlayerIDForBundleID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 419, "-[GKGameService _getPerGameFriendsPlayerIDForBundleID:handler:]");
    id v9 = [(GKService *)self transactionGroupWithName:v8];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000521D0;
    v17[3] = &unk_1002D5E50;
    id v18 = v6;
    id v19 = self;
    id v10 = v9;
    id v20 = v10;
    id v21 = &stru_1002D5DD8;
    [v10 performOnManagedObjectContext:v17];
    id v11 = [(GKService *)self clientProxy];
    id v12 = [v11 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100052B04;
    v14[3] = &unk_1002D3C38;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [v13 notifyOnQueue:v12 block:v14];
  }
}

- (void)storeGameForBundleIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Add games: %@ ", buf, 0xCu);
  }
  id v10 = +[GKService serviceFromService:self];
  id v11 = [(GKService *)self credential];
  id v12 = [v11 playerInternal];
  id v13 = [v12 playerID];

  id v14 = [objc_alloc((Class)NSMutableSet) initWithArray:v6];
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKGameService.m", 521, "-[GKGameService storeGameForBundleIDs:completion:]");
  id v16 = [(GKService *)self transactionGroupWithName:v15 forPlayerID:0];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100052E84;
  v32[3] = &unk_1002D3D30;
  id v33 = v6;
  id v34 = v14;
  id v17 = v16;
  id v35 = v17;
  id v18 = v14;
  id v19 = v6;
  [v17 performOnManagedObjectContext:v32];
  id v20 = [(GKService *)self clientProxy];
  id v21 = [v20 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100053114;
  v26[3] = &unk_1002D5E78;
  id v27 = v17;
  id v28 = v13;
  v30 = self;
  id v31 = v7;
  id v29 = v10;
  id v22 = v10;
  id v23 = v7;
  id v24 = v13;
  id v25 = v17;
  [v25 notifyOnQueue:v21 block:v26];
}

- (void)fetchMostRecentGameActivityForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKGameService sharedGameActivityStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100053420;
  v9[3] = &unk_1002D5EA0;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchAndRemoveLatestActivityWithBundleID:v6 completionHandler:v9];
}

@end