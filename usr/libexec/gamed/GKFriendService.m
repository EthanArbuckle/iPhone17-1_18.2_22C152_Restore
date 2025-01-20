@interface GKFriendService
+ (Class)interfaceClass;
+ (id)filterFriends:(id)a3 filter:(int)a4;
+ (unint64_t)requiredEntitlements;
- (id)predicateForFriendPredicate:(id)a3 withFilter:(id)a4;
- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)establishNearbyRelationshipsUsingPlayerTokens:(id)a3 handler:(id)a4;
- (void)getChallengableFriendIDsForPlayer:(id)a3 handler:(id)a4;
- (void)getChallengableFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getFriendIDsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5;
- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 withFilter:(int)a5 commonFriends:(BOOL)a6 handler:(id)a7;
- (void)getFriendsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5;
- (void)getFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getNearbyTokenForLocalPlayerWithHandler:(id)a3;
- (void)notifyWidgetFriendListUpdated;
- (void)updateFriendsOfLocalPlayerWithHandler:(id)a3;
@end

@implementation GKFriendService

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 withFilter:(int)a5 commonFriends:(BOOL)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (v13)
  {
    if (v11)
    {
      v14 = [v11 playerID];
      v15 = [(GKService *)self localPlayer];
      v16 = [v15 playerID];
      unsigned int v17 = [v14 isEqualToString:v16];

      if (v17)
      {
LABEL_9:

        id v11 = 0;
        goto LABEL_10;
      }
      v18 = [v11 playerID];

      if (!v18)
      {
        if (!os_log_GKGeneral) {
          id v19 = (id)GKOSLoggers();
        }
        v20 = (void *)os_log_GKError;
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_10004E658((uint64_t)v11, v20);
        }
        goto LABEL_9;
      }
    }
LABEL_10:
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    char v40 = 0;
    v21 = [(GKService *)self transactionGroupBypassingMultiUser];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000BCB8;
    v33[3] = &unk_1002D56F8;
    id v11 = v11;
    id v34 = v11;
    id v22 = v21;
    id v35 = v22;
    id v23 = v13;
    v36 = self;
    id v37 = v23;
    v38 = v39;
    [v22 performOnManagedObjectContext:v33];
    v24 = [(GKService *)self clientProxy];
    v25 = [v24 replyQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000A220;
    v27[3] = &unk_1002D5720;
    id v26 = v22;
    id v28 = v26;
    int v32 = a5;
    id v30 = v23;
    v31 = v39;
    v29 = self;
    [v26 notifyOnQueue:v25 block:v27];

    _Block_object_dispose(v39, 8);
  }
}

+ (unint64_t)requiredEntitlements
{
  return 4;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)notifyWidgetFriendListUpdated
{
  id v3 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"FriendsArePlayingWidget" inBundleIdentifier:@"com.apple.gamecenter.widgets.extension"];
  id v2 = [v3 reloadTimeline];
}

- (void)getFriendsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)updateFriendsOfLocalPlayerWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100045974;
  v5[3] = &unk_1002D4F88;
  id v6 = a3;
  id v4 = v6;
  [(GKFriendService *)self getFriendIDsForPlayer:0 commonFriends:0 handler:v5];
}

- (void)getFriendsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045A3C;
  v8[3] = &unk_1002D4F38;
  v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(GKFriendService *)v9 getFriendIDsForPlayer:a3 commonFriends:v5 handler:v8];
}

- (void)getFriendIDsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
}

- (void)getChallengableFriendIDsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)getChallengableFriendsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GKService *)self transport];
  v9 = [(GKService *)self clientProxy];
  id v10 = [(GKService *)self localPlayer];
  id v11 = +[GKService serviceWithTransport:v8 forClient:v9 localPlayer:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100045CCC;
  v14[3] = &unk_1002D4F38;
  id v15 = v11;
  id v16 = v6;
  id v12 = v6;
  id v13 = v11;
  [(GKFriendService *)self getChallengableFriendIDsForPlayer:v7 handler:v14];
}

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
}

- (void)getNearbyTokenForLocalPlayerWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 280, "-[GKFriendService getNearbyTokenForLocalPlayerWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000461C8;
  v15[3] = &unk_1002D3A70;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  v8 = [(GKService *)self clientProxy];
  v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004642C;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (id)predicateForFriendPredicate:(id)a3 withFilter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 length])
  {
    v8 = +[NSPredicate predicateWithFormat:v7];
    v12[0] = v5;
    v12[1] = v8;
    v9 = +[NSArray arrayWithObjects:v12 count:2];
    id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (void)establishNearbyRelationshipsUsingPlayerTokens:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = (id)GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10004E848();
  }
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 316, "-[GKFriendService establishNearbyRelationshipsUsingPlayerTokens:handler:]");
  id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000467A8;
  v19[3] = &unk_1002D3980;
  id v12 = v6;
  id v20 = v12;
  v21 = self;
  id v13 = v11;
  id v22 = v13;
  [v13 perform:v19];
  if (v7)
  {
    id v14 = [(GKService *)self clientProxy];
    id v15 = [v14 replyQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100046998;
    v16[3] = &unk_1002D3930;
    id v18 = v7;
    id v17 = v13;
    [v17 notifyOnQueue:v15 block:v16];
  }
}

- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 339, "-[GKFriendService createFriendRequestWithIdentifier:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100046BB0;
  v17[3] = &unk_1002D3980;
  id v10 = v6;
  id v18 = v10;
  id v19 = self;
  id v11 = v9;
  id v20 = v11;
  [v11 perform:v17];
  if (v7)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100046DA0;
    v14[3] = &unk_1002D3930;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

+ (id)filterFriends:(id)a3 filter:(int)a4
{
  unint64_t v5 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for GKFilterableFriend();
    unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = sub_1001632A0(v5, a4);
  swift_bridgeObjectRelease();
  if (v6)
  {
    type metadata accessor for GKFilterableFriend();
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

@end