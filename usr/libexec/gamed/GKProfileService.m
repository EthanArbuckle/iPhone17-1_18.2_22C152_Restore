@interface GKProfileService
+ (Class)interfaceClass;
+ (id)profileRequestForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4;
+ (unint64_t)requiredEntitlements;
- (void)fetchProfilesForPlayerIDs:(id)a3 familiarity:(int)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7;
- (void)getFriendSupportPageURLWithHandler:(id)a3;
- (void)getOcelotStateForCurrentAppWithHandler:(id)a3;
- (void)getProfilesForPlayerIDs:(id)a3 discardingStaleData:(BOOL)a4 handler:(id)a5;
- (void)getProfilesForPlayerIDs:(id)a3 handler:(id)a4;
- (void)loadProfilesForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6;
- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5;
- (void)setOcelotStateForCurrentApp;
- (void)updateChallengedGames:(id)a3 forPlayers:(id)a4 group:(id)a5;
- (void)updateGames:(id)a3 forPlayers:(id)a4 group:(id)a5 updater:(id)a6;
- (void)updateLastPlayedGames:(id)a3 forPlayers:(id)a4 group:(id)a5;
@end

@implementation GKProfileService

- (void)loadScopedPlayerIDs:(id)a3 gameBundleIDs:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[GKService serviceFromService:self];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100016F80;
  v13[3] = &unk_1002D4F88;
  id v14 = v8;
  id v12 = v8;
  [v11 loadScopedPlayerIDs:v10 gameBundleIDs:v9 handler:v13];
}

- (void)getProfilesForPlayerIDs:(id)a3 discardingStaleData:(BOOL)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKProfileService: getProfilesForPlayerIDs", buf, 2u);
  }
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.gamed.getProfiles.results", 0);
  id v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  v13 = [(GKService *)self credential];
  if (!v13)
  {
    id v14 = +[GKPlayerCredentialController sharedController];
    v15 = [(GKService *)self clientProxy];
    v13 = [v14 primaryCredentialForEnvironment:[v15 environment]];
  }
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 432, "-[GKProfileService getProfilesForPlayerIDs:discardingStaleData:handler:]");
  v17 = [v13 playerInternal];
  v18 = [v17 playerID];
  v19 = [(GKService *)self transactionGroupWithName:v16 forPlayerID:v18];

  v20 = [(GKService *)self clientProxy];
  v21 = [v20 replyQueue];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000E740;
  v46[3] = &unk_1002D4F10;
  v22 = v11;
  v47 = v22;
  id v23 = v12;
  id v48 = v23;
  id v24 = v19;
  id v49 = v24;
  id v25 = v7;
  id v50 = v25;
  v51 = self;
  id v26 = v8;
  id v52 = v26;
  BOOL v53 = a4;
  [v24 performOnQueue:v21 block:v46];

  if (v26)
  {
    v27 = [(GKService *)self clientProxy];
    v28 = [v27 bundleIdentifier];

    if (v28)
    {
      v29 = [(GKService *)self clientProxy];
      v30 = [v29 replyQueue];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000A8F0;
      v42[3] = &unk_1002D48B0;
      v42[4] = self;
      id v43 = v25;
      id v44 = v28;
      id v45 = v24;
      [v45 performOnQueue:v30 block:v42];
    }
    else
    {
      v31 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v32 = (id)GKOSLoggers();
        v31 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100044B44();
      }
    }
    v33 = [(GKService *)self clientProxy];
    v34 = [v33 replyQueue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000D6F4;
    v36[3] = &unk_1002D39A8;
    id v37 = v24;
    v38 = v22;
    id v39 = v25;
    id v40 = v23;
    id v41 = v26;
    [v37 notifyOnQueue:v34 block:v36];
  }
}

- (void)getProfilesForPlayerIDs:(id)a3 handler:(id)a4
{
}

+ (unint64_t)requiredEntitlements
{
  return 2;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

+ (id)profileRequestForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4
{
  CFStringRef v10 = @"player-ids";
  id v11 = a3;
  id v5 = a3;
  v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-details"];
  if ((a4 & 8) == 0)
  {
    if ((a4 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-stats"];
    if ((a4 & 0x80) == 0) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-emails"];
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"show-emails-hashed"];
  if ((a4 & 0x10) != 0) {
    goto LABEL_8;
  }
LABEL_3:
  if ((a4 & 0x80) == 0) {
    goto LABEL_4;
  }
LABEL_9:
  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:@"check-friend-invitation-ability"];
LABEL_4:
  id v8 = [v7 copy];

  return v8;
}

- (void)updateGames:(id)a3 forPlayers:(id)a4 group:(id)a5 updater:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100036284;
  v23[3] = &unk_1002D49D0;
  id v15 = v10;
  id v24 = v15;
  id v16 = v14;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  [v17 enumerateObjectsUsingBlock:v23];
  v18 = [v16 allKeys];
  if ([v18 count])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100036348;
    v19[3] = &unk_1002D4A70;
    v19[4] = self;
    id v20 = v18;
    id v21 = v16;
    id v22 = v13;
    [v12 perform:v19];
  }
}

- (void)updateLastPlayedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKProfileService: updateLastPlayedGames:", v13, 2u);
  }
  [(GKProfileService *)self updateGames:v8 forPlayers:v9 group:v10 updater:&stru_1002D4AB0];
}

- (void)updateChallengedGames:(id)a3 forPlayers:(id)a4 group:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKProfileService: updateChallengedGames:", v13, 2u);
  }
  [(GKProfileService *)self updateGames:v8 forPlayers:v9 group:v10 updater:&stru_1002D4AD0];
}

- (void)fetchProfilesForPlayerIDs:(id)a3 familiarity:(int)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v32 = a6;
  id v31 = a7;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers();
  }
  id v14 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKProfileService: fetchProfilesForPlayerIDs", buf, 2u);
  }
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 148, "-[GKProfileService fetchProfilesForPlayerIDs:familiarity:responseKind:context:handler:]");
  id v16 = [(GKService *)self clientProxy];
  id v17 = +[GKCacheTransactionGroup transactionGroupWithName:v15 context:v32 client:v16];

  *(void *)buf = 0;
  v54 = buf;
  uint64_t v55 = 0x2020000000;
  BOOL v56 = a5 == 2;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  switch((int)v10)
  {
    case 1:
      uint64_t v18 = objc_opt_class();
      char v19 = 0;
      goto LABEL_8;
    case 2:
      uint64_t v18 = objc_opt_class();
      char v19 = 1;
LABEL_8:
      char v20 = 1;
      break;
    default:
      uint64_t v18 = objc_opt_class();
      char v19 = 0;
      char v20 = 0;
      break;
  }
  unsigned __int8 v21 = +[GKPlayerProfileCacheObject piecesToLoadForFamiliarity:v10];
  id v22 = +[NSMutableSet setWithArray:v12];
  [v22 removeObject:GKAnonymousPlayerID];
  [v22 removeObject:GKUnknownPlayerID];
  [v22 allObjects];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100036BE8;
  v38[3] = &unk_1002D4B20;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v23;
  id v44 = buf;
  unsigned __int8 v48 = v21;
  id v45 = v51;
  int v47 = a5;
  id v24 = v22;
  id v40 = v24;
  char v49 = v20;
  char v50 = v19;
  id v25 = v17;
  id v41 = v25;
  id v26 = v12;
  uint64_t v46 = v18;
  id v42 = v26;
  id v43 = self;
  [v25 performOnManagedObjectContext:v38];
  v27 = [(GKService *)self clientProxy];
  v28 = [v27 replyQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100037224;
  v33[3] = &unk_1002D4B48;
  id v29 = v31;
  id v35 = v29;
  id v30 = v25;
  id v34 = v30;
  v36 = v51;
  id v37 = buf;
  [v30 notifyOnQueue:v28 block:v33];

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(buf, 8);
}

- (void)loadProfilesForPlayerIDs:(id)a3 pieces:(unsigned __int8)a4 context:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 281, "-[GKProfileService loadProfilesForPlayerIDs:pieces:context:handler:]");
  id v14 = [(GKService *)self clientProxy];
  id v15 = +[GKCacheTransactionGroup transactionGroupWithName:v13 context:v11 client:v14];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  id v16 = +[NSMutableSet setWithArray:v10];
  [v16 removeObject:GKAnonymousPlayerID];
  [v16 removeObject:GKUnknownPlayerID];
  id v17 = [v16 _gkMapWithBlock:&stru_1002D4B88];
  uint64_t v18 = [(GKService *)self clientProxy];
  char v19 = [v18 replyQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100037660;
  v31[3] = &unk_1002D4CE0;
  id v20 = v17;
  id v32 = v20;
  id v21 = v11;
  id v33 = v21;
  id v22 = v16;
  id v34 = v22;
  unsigned __int8 v39 = a4;
  id v23 = v15;
  id v35 = v23;
  id v24 = v12;
  v36 = self;
  id v37 = v24;
  v38 = v40;
  [v23 performOnQueue:v19 block:v31];

  id v25 = [(GKService *)self clientProxy];
  id v26 = [v25 replyQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100038060;
  v28[3] = &unk_1002D4D08;
  id v27 = v23;
  id v29 = v27;
  id v30 = v40;
  [v27 notifyOnQueue:v26 block:v28];

  _Block_object_dispose(v40, 8);
}

- (void)setOcelotStateForCurrentApp
{
  id v4 = [(GKService *)self clientProxy];
  v2 = [v4 bundleIdentifier];
  v3 = +[LSApplicationProxy applicationProxyForIdentifier:v2];

  [v4 setIsOcelot:[v3 isArcadeApp]];
}

- (void)getOcelotStateForCurrentAppWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(GKService *)self clientProxy];
  (*((void (**)(id, id))a3 + 2))(v5, [v6 isOcelot]);
}

- (void)getFriendSupportPageURLWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKProfileService.m", 550, "-[GKProfileService getFriendSupportPageURLWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  id v7 = [(GKService *)self transport];
  id v8 = [v7 storeBag];

  if (v8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000391A0;
    v16[3] = &unk_1002D3980;
    id v17 = v8;
    uint64_t v18 = self;
    id v19 = v6;
    [v19 perform:v16];
  }
  id v9 = [(GKService *)self clientProxy];
  id v10 = [v9 replyQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000393C8;
  v13[3] = &unk_1002D3930;
  id v14 = v6;
  id v15 = v4;
  id v11 = v6;
  id v12 = v4;
  [v11 notifyOnQueue:v10 block:v13];
}

@end