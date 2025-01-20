@interface GKFriendServicePrivate
+ (Class)interfaceClass;
+ (id)messageInboxLocation;
+ (os_unfair_lock_s)messageInboxEntriesLock;
+ (unint64_t)requiredEntitlements;
- (void)_invalidateCacheForFriendCode:(id)a3 handler:(id)a4;
- (void)acceptFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5;
- (void)cancelFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)clearActivityFeedCacheWithHandler:(id)a3;
- (void)didAccept:(BOOL)a3 friendRequest:(id)a4 handler:(id)a5;
- (void)expireFriendList;
- (void)getActiveFriendRequests:(id)a3;
- (void)getChallengableFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 completion:(id)a5;
- (void)getCombinedFriendInvitationListWithCompletion:(id)a3;
- (void)getCommonFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getConcernsForPlayer:(id)a3 handler:(id)a4;
- (void)getFakeActiveFriendRequests:(id)a3;
- (void)getFriendCodeDetailWithIdentifiers:(id)a3 handler:(id)a4;
- (void)getFriendIDsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendInvitationMailboxWithType:(id)a3 completion:(id)a4;
- (void)getFriendRequestsBannerDataWithCompletion:(id)a3;
- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5;
- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 withFilter:(int)a5 handler:(id)a6;
- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 handler:(id)a5;
- (void)getFriendsLatestActivityWithCompletion:(id)a3;
- (void)getMessageInboxEntries:(id)a3;
- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 gameCategoryFilter:(id)a6 handler:(id)a7;
- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 handler:(id)a6;
- (void)getPlayerActivityFeed:(id)a3 gameID:(id)a4 continuation:(id)a5 handler:(id)a6;
- (void)ignoreFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)notifyMessageBasedFriendRequestSentTo:(id)a3 nameKind:(int)a4;
- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeAllFriendsWithHandler:(id)a3;
- (void)removeFriendWithPlayer:(id)a3 handler:(id)a4;
- (void)removeMessageInboxEntries:(id)a3 handler:(id)a4;
- (void)reportConcern:(id)a3 handler:(id)a4;
- (void)sendFriendInvitationWithPlayerID:(id)a3 contactAssociationID:(id)a4 completion:(id)a5;
- (void)sendResponselessWithRequest:(id)a3 bagKey:(id)a4 refreshFriendsRequestContents:(BOOL)a5 completion:(id)a6;
@end

@implementation GKFriendServicePrivate

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = *(void *)&a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B860;
  v10[3] = &unk_1002D4F38;
  v11 = self;
  id v12 = a6;
  id v9 = v12;
  [(GKFriendServicePrivate *)v11 getFriendIDsForPlayer:a3 withFilter:v7 commonFriends:v6 handler:v10];
}

- (void)getActiveFriendRequests:(id)a3
{
  id v4 = a3;
  v5 = +[GKPreferences shared];
  id v6 = [v5 fakeFriendRequestCount];

  if (v6)
  {
    [(GKFriendServicePrivate *)self getFakeActiveFriendRequests:v4];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000113E0;
    v7[3] = &unk_1002D4F38;
    v7[4] = self;
    id v8 = v4;
    [(GKFriendServicePrivate *)self getMessageInboxEntries:v7];
  }
}

- (void)getMessageInboxEntries:(id)a3
{
  v24 = (void (**)(id, void *, void))a3;
  v30 = objc_opt_new();
  os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock]);
  v3 = +[GKFriendServicePrivate messageInboxLocation];
  id v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:v3];

  os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = v4;
  id obj = [v4 allValues];
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v29 = *(void *)v32;
    uint64_t v27 = GKFriendRequestURLSenderHandle;
    uint64_t v28 = GKFriendRequestURL;
    uint64_t v26 = GKFriendRequestURLSenderAlias;
    uint64_t v7 = GKFriendRequestURLContactID;
    uint64_t v8 = GKFriendRequestURLFriendCode;
    uint64_t v9 = GKFriendRequestTimestamp;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v10);
        id v12 = objc_alloc_init((Class)GKMessageInboxEntryInternal);
        id v13 = objc_alloc((Class)NSData);
        v14 = [v11 objectForKeyedSubscript:v28];
        id v15 = [v13 initWithBase64EncodedString:v14 options:0];

        id v16 = [objc_alloc((Class)NSString) initWithData:v15 encoding:4];
        v17 = +[NSURL URLWithString:v16];
        [v12 setUrl:v17];

        v18 = [v11 objectForKeyedSubscript:v27];
        [v12 setSenderHandle:v18];

        v19 = [v11 objectForKeyedSubscript:v26];
        [v12 setSenderAlias:v19];

        v20 = [v11 objectForKeyedSubscript:v7];
        [v12 setContactID:v20];

        v21 = [v11 objectForKeyedSubscript:v8];
        [v12 setFriendCode:v21];

        v22 = [v11 objectForKeyedSubscript:v9];
        [v12 setTimestamp:v22];

        [v30 addObject:v12];
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  v24[2](v24, v30, 0);
}

+ (os_unfair_lock_s)messageInboxEntriesLock
{
  if (qword_100329678 != -1) {
    dispatch_once(&qword_100329678, &stru_1002D5968);
  }
  return (os_unfair_lock_s *)&dword_100329670;
}

- (void)getFriendInvitationMailboxWithType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[GKNetworkRequestManager commonNetworkRequestManager];
  CFStringRef v12 = @"type";
  id v13 = v7;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  uint64_t v10 = GKBagKeyGetFriendInvitationMailbox;
  v11 = [(GKService *)self clientProxy];
  [v8 readEntityWithRequest:v9 bagKey:v10 includeStaleCacheData:0 clientProxy:v11 completionHandler:v6 entityMaker:&stru_1002D5BA0];
}

- (void)getFriendCodeDetailWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 712, "-[GKFriendServicePrivate getFriendCodeDetailWithIdentifiers:handler:]");
  uint64_t v9 = [(GKService *)self transactionGroupWithName:v8];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000FF30;
  v18[3] = &unk_1002D3D30;
  id v10 = v6;
  id v19 = v10;
  v20 = self;
  id v11 = v9;
  id v21 = v11;
  [v11 performOnManagedObjectContext:v18];
  if (v7)
  {
    CFStringRef v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E11C;
    v14[3] = &unk_1002D3A48;
    id v15 = v11;
    id v16 = v10;
    id v17 = v7;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)getCombinedFriendInvitationListWithCompletion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 1447, "-[GKFriendServicePrivate getCombinedFriendInvitationListWithCompletion:]");
    id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

    id v7 = +[NSMutableDictionary dictionary];
    [v6 setResult:v7];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009540;
    v18[3] = &unk_1002D3A70;
    void v18[4] = self;
    id v8 = v6;
    id v19 = v8;
    [v8 perform:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100009A90;
    v16[3] = &unk_1002D3A70;
    v16[4] = self;
    id v9 = v8;
    id v17 = v9;
    [v9 perform:v16];
    id v10 = [(GKService *)self clientProxy];
    id v11 = [v10 replyQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E32C;
    v13[3] = &unk_1002D3C38;
    id v14 = v9;
    id v15 = v4;
    id v12 = v9;
    [v12 notifyOnQueue:v11 block:v13];
  }
  else
  {
    [(GKFriendServicePrivate *)self getActiveFriendRequests:v4];
  }
}

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 handler:(id)a5
{
}

- (void)getFriendIDsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
}

+ (unint64_t)requiredEntitlements
{
  return 0x40000;
}

+ (id)messageInboxLocation
{
  if (qword_100329668 != -1) {
    dispatch_once(&qword_100329668, &stru_1002D5948);
  }
  v2 = (void *)qword_100329660;

  return v2;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)getChallengableFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(GKService *)self transport];
  id v11 = [(GKService *)self clientProxy];
  id v12 = [(GKService *)self localPlayer];
  id v13 = +[GKService serviceWithTransport:v10 forClient:v11 localPlayer:v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100046F64;
  v16[3] = &unk_1002D5748;
  id v18 = v8;
  unint64_t v19 = a4;
  id v17 = v13;
  id v14 = v8;
  id v15 = v13;
  [(GKFriendService *)self getChallengableFriendIDsForPlayer:v9 handler:v16];
}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100047028;
  v9[3] = &unk_1002D5748;
  id v10 = a5;
  unint64_t v11 = a4;
  v9[4] = self;
  id v8 = v10;
  [(GKFriendService *)self getFriendIDsForPlayer:a3 commonFriends:0 handler:v9];
}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 withFilter:(int)a5 handler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000471AC;
  v11[3] = &unk_1002D5748;
  id v12 = a6;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v12;
  [(GKFriendServicePrivate *)self getFriendIDsForPlayer:a3 withFilter:v6 commonFriends:0 handler:v11];
}

- (void)getCommonFriendsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)removeFriendWithPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 425, "-[GKFriendServicePrivate removeFriendWithPlayer:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [v6 playerID];
  unint64_t v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v12 = (id)GKOSLoggers();
    unint64_t v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10004E918();
  }
  if (v10)
  {
    unint64_t v13 = [GKRemoveFriendNetworkRequest alloc];
    id v14 = [v6 playerID];
    id v15 = [(GKRemoveFriendNetworkRequest *)v13 initWithFriendPlayerID:v14];

    id v16 = +[GKNetworkRequestManager commonNetworkRequestManager];
    id v17 = [(GKService *)self clientProxy];
    [v16 writeToNetwork:v15 clientProxy:v17 handler:0];

    id v18 = [(GKService *)self clientProxy];
    unint64_t v19 = [(GKService *)self localPlayer];
    v20 = +[GKService serviceWithTransport:0 forClient:v18 localPlayer:v19];

    [v20 expireGamesFriendsPlayed];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004755C;
    v25[3] = &unk_1002D4078;
    id v26 = v10;
    id v27 = v6;
    [v9 performOnManagedObjectContext:v25];
  }
  if (v7)
  {
    id v21 = [(GKService *)self clientProxy];
    v22 = [v21 replyQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000477C4;
    v23[3] = &unk_1002D3930;
    v23[4] = self;
    id v24 = v7;
    [v9 notifyOnQueue:v22 block:v23];
  }
}

- (void)removeAllFriendsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = (id)GKOSLoggers();
    id v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10004E980();
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 468, "-[GKFriendServicePrivate removeAllFriendsWithHandler:]");
  id v8 = [(GKService *)self transactionGroupWithName:v7];

  id v9 = [[GKRemoveAllFriendsNetworkRequest alloc] initRequest];
  id v10 = +[GKNetworkRequestManager commonNetworkRequestManager];
  unint64_t v11 = [(GKService *)self clientProxy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000479C8;
  v14[3] = &unk_1002D3DD0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v4;
  id v12 = v4;
  id v13 = v8;
  [v10 writeToNetwork:v9 clientProxy:v11 handler:v14];
}

- (void)getConcernsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 508, "-[GKFriendServicePrivate getConcernsForPlayer:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100047EC8;
  v17[3] = &unk_1002D3980;
  id v10 = v6;
  id v18 = v10;
  unint64_t v19 = self;
  id v11 = v9;
  id v20 = v11;
  [v11 perform:v17];
  if (v7)
  {
    id v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000482C4;
    v14[3] = &unk_1002D3930;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)reportConcern:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 544, "-[GKFriendServicePrivate reportConcern:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  id v10 = [v6 player];
  id v11 = [v10 playerID];

  uint64_t v12 = [v6 message];
  id v13 = (void *)v12;
  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100048588;
    v20[3] = &unk_1002D4518;
    id v21 = v11;
    id v22 = v13;
    id v23 = v6;
    id v24 = self;
    id v25 = v9;
    [v25 perform:v20];

    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v14 = +[NSError userErrorForCode:17 userInfo:0];
  [v9 setError:v14];

  if (v7)
  {
LABEL_6:
    id v15 = [(GKService *)self clientProxy];
    id v16 = [v15 replyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100048764;
    v17[3] = &unk_1002D3930;
    id v19 = v7;
    id v18 = v9;
    [v18 notifyOnQueue:v16 block:v17];
  }
LABEL_7:
}

- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 610, "-[GKFriendServicePrivate cancelFriendRequestWithIdentifier:handler:]");
  id v9 = +[GKDispatchGroup dispatchGroupWithName:v8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000489DC;
  v17[3] = &unk_1002D3980;
  id v10 = v6;
  id v18 = v10;
  id v19 = self;
  id v11 = v9;
  id v20 = v11;
  [v11 perform:v17];
  if (v7)
  {
    uint64_t v12 = [(GKService *)self clientProxy];
    id v13 = [v12 replyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100048B74;
    v14[3] = &unk_1002D3930;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = +[GKAMPController controller];
  [v10 reportFriendInviteActivityEventAtStage:5 hostApp:0];

  v20[0] = @"friend-code";
  v20[1] = @"send-push";
  v21[0] = v8;
  id v11 = +[NSNumber numberWithBool:v6];
  v21[1] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  id v13 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v14 = [(GKService *)self clientProxy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100048D88;
  v17[3] = &unk_1002D5190;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v13 issueRequest:v12 bagKey:@"gk-use-friend-code" clientProxy:v14 handler:v17];
}

- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[GKAMPController controller];
  [v8 reportFriendInviteActivityEventAtStage:7 hostApp:0];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 662, "-[GKFriendServicePrivate rejectFriendRequestWithIdentifier:handler:]");
  id v10 = +[GKDispatchGroup dispatchGroupWithName:v9];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000490F4;
  v23[3] = &unk_1002D3980;
  id v11 = v6;
  id v24 = v11;
  id v25 = self;
  id v12 = v10;
  id v26 = v12;
  [v12 perform:v23];
  id v13 = [(GKService *)self clientProxy];
  id v14 = [v13 replyQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004928C;
  v18[3] = &unk_1002D39F8;
  id v19 = v12;
  id v20 = self;
  id v21 = v11;
  id v22 = v7;
  id v15 = v7;
  id v16 = v11;
  id v17 = v12;
  [v17 notifyOnQueue:v14 block:v18];
}

- (void)_invalidateCacheForFriendCode:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 688, "-[GKFriendServicePrivate _invalidateCacheForFriendCode:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100049504;
  v19[3] = &unk_1002D4078;
  id v20 = v6;
  id v10 = v9;
  id v21 = v10;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000496B8;
  v16[3] = &unk_1002D3930;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)getPlayerActivityFeed:(id)a3 gameID:(id)a4 continuation:(id)a5 handler:(id)a6
{
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 handler:(id)a6
{
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 gameCategoryFilter:(id)a6 handler:(id)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = (__CFString *)a6;
  id v49 = a7;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  id v17 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v71 = v12;
    __int16 v72 = 2112;
    id v73 = v13;
    __int16 v74 = 2112;
    v75 = v14;
    __int16 v76 = 2112;
    v77 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "targetPlayerId: %@ bundleId: %@ continuation: %@ filter: %@", buf, 0x2Au);
  }
  id v18 = +[GKCDPlayerActivity _gkFetchRequest];
  v50 = v13;
  if (!v13
    || ([v13 isEqualToString:GKDaemonIdentifier] & 1) != 0
    || ([v13 isEqualToString:GKGameCenterIdentifier] & 1) != 0)
  {
    id v19 = @"NoGameId";
  }
  else
  {
    id v19 = (__CFString *)v13;
  }
  id v20 = @"NoContinuation";
  if (v14) {
    id v20 = v14;
  }
  id v21 = v20;
  v41 = v21;
  id v22 = @"NoTargetPlayer";
  if (v12) {
    id v22 = v12;
  }
  id v23 = v22;
  v43 = v23;
  id v24 = @"NoCategoryFilter";
  if (v15) {
    id v24 = v15;
  }
  v46 = v24;
  v48 = +[NSPredicate predicateWithFormat:@"(continuation == %@) AND (gameID == %@) AND (targetPlayerID == %@) AND (gameCategoryFilter == %@)", v21, v19, v23, v46];
  [v18 setPredicate:v48];
  id v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 902, "-[GKFriendServicePrivate getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:]");
  id v26 = [(GKService *)self transactionGroupWithName:v25];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10004A438;
  v63[3] = &unk_1002D5868;
  id v27 = v18;
  id v64 = v27;
  uint64_t v28 = v14;
  v65 = v28;
  uint64_t v29 = v19;
  v66 = v29;
  v30 = v12;
  v67 = v30;
  long long v31 = v15;
  v68 = v31;
  id v32 = v26;
  id v69 = v32;
  [v32 performOnManagedObjectContext:v63];
  v40 = [(GKService *)self clientProxy];
  long long v33 = [v40 replyQueue];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10004A6D8;
  v51[3] = &unk_1002D5908;
  id v52 = v32;
  v53 = v29;
  v54 = v30;
  v55 = v28;
  v56 = v31;
  v57 = self;
  id v58 = v27;
  v59 = v41;
  v60 = v43;
  v61 = v46;
  id v62 = v49;
  v45 = v46;
  v44 = v43;
  v42 = v41;
  id v34 = v27;
  v47 = v31;
  v35 = v28;
  v36 = v30;
  v37 = v29;
  id v38 = v49;
  id v39 = v32;
  [v39 notifyOnQueue:v33 block:v51];
}

- (void)clearActivityFeedCacheWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 1029, "-[GKFriendServicePrivate clearActivityFeedCacheWithHandler:]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004B4B8;
  v15[3] = &unk_1002D51F8;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 replyQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004B58C;
  v12[3] = &unk_1002D3930;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)expireFriendList
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring friends list", buf, 2u);
  }
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 1050, "-[GKFriendServicePrivate expireFriendList]");
  id v6 = [(GKService *)self transactionGroupWithName:v5];

  [v6 performOnManagedObjectContext:&stru_1002D5928];
  id v7 = [(GKService *)self clientProxy];
  id v8 = [v7 replyQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004B828;
  v9[3] = &unk_1002D40E0;
  v9[4] = self;
  [v6 notifyOnQueue:v8 block:v9];
}

- (void)removeMessageInboxEntries:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v5)
  {
    os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock]);
    id v7 = +[GKFriendServicePrivate messageInboxLocation];
    id v8 = +[NSMutableDictionary dictionaryWithContentsOfFile:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v15 = [v14 friendCode:v18];

          if (v15)
          {
            id v16 = [v14 friendCode];
            [v8 setObject:0 forKeyedSubscript:v16];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v17 = +[GKFriendServicePrivate messageInboxLocation];
    [v8 writeToFile:v17 atomically:1];

    os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock]);
    v6[2](v6, 0);
  }
  else
  {
    id v8 = +[NSError userErrorForCode:17 underlyingError:0];
    ((void (**)(id, void *))v6)[2](v6, v8);
  }
}

- (void)getFakeActiveFriendRequests:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BB88;
  v4[3] = &unk_1002D4F38;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(GKFriendServicePrivate *)v5 getMessageInboxEntries:v4];
}

- (void)didAccept:(BOOL)a3 friendRequest:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKFriendService.m", 1324, "-[GKFriendServicePrivate didAccept:friendRequest:handler:]");
  id v11 = +[GKDispatchGroup dispatchGroupWithName:v10];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_10004CC60;
  v21[3] = &unk_1002D5AF8;
  id v12 = v8;
  BOOL v25 = a3;
  id v22 = v12;
  id v23 = self;
  id v24 = v26;
  [v11 perform:v21];
  id v13 = [(GKService *)self clientProxy];
  id v14 = [v13 replyQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004D424;
  v17[3] = &unk_1002D5B20;
  long long v20 = v26;
  void v17[4] = self;
  id v15 = v9;
  id v19 = v15;
  id v16 = v11;
  id v18 = v16;
  [v16 notifyOnQueue:v14 block:v17];

  _Block_object_dispose(v26, 8);
}

- (void)notifyMessageBasedFriendRequestSentTo:(id)a3 nameKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKFriendService: notifyMessageBasedFriendRequestSentTo:%@ nameKind:%d", buf, 0x12u);
  }
  v13[0] = GKFriendRequestRecipientNameKey;
  v13[1] = GKFriendRequestRecipientNameKindKey;
  v14[0] = v5;
  id v8 = +[NSNumber numberWithInt:v4];
  v14[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004D664;
  v11[3] = &unk_1002D3DF8;
  id v12 = v9;
  id v10 = v9;
  +[GKClientProxy enumerateClientsUsingBlock:v11];
}

- (void)getFriendsLatestActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v5 = [(GKService *)self clientProxy];
  [v6 readEntityWithRequest:0 bagKey:@"gk-get-friends-latest-activity" includeStaleCacheData:0 clientProxy:v5 completionHandler:v4 entityMaker:&stru_1002D5B60];
}

- (void)sendFriendInvitationWithPlayerID:(id)a3 contactAssociationID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[GKClientProxy nonGameCenterForegroundClient];
  id v12 = [v11 bundleIdentifier];

  if (!v12)
  {
    id v13 = [(GKService *)self clientProxy];
    id v12 = [v13 originalBundleIdentifier];
  }
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = v14;
  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:@"receiving-player-id"];
  }
  if (v9) {
    [v15 setObject:v9 forKeyedSubscript:@"receiving-player-caid"];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004D9D4;
  v18[3] = &unk_1002D3BC8;
  id v19 = v12;
  id v20 = v10;
  id v16 = v10;
  id v17 = v12;
  [(GKFriendServicePrivate *)self sendResponselessWithRequest:v15 bagKey:@"gk-send-friend-invitation" refreshFriendsRequestContents:0 completion:v18];
}

- (void)acceptFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  CFStringRef v12 = @"issuing-player-id";
  id v13 = a3;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004DC08;
  v10[3] = &unk_1002D45D8;
  id v11 = v6;
  id v9 = v6;
  [(GKFriendServicePrivate *)self sendResponselessWithRequest:v8 bagKey:@"gk-accept-friend-invitation" refreshFriendsRequestContents:1 completion:v10];
}

- (void)cancelFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  CFStringRef v9 = @"receiving-player-id";
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [(GKFriendServicePrivate *)self sendResponselessWithRequest:v8 bagKey:@"gk-cancel-friend-invitation" refreshFriendsRequestContents:0 completion:v6];
}

- (void)ignoreFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  CFStringRef v12 = @"issuing-player-id";
  id v13 = a3;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004DF04;
  v10[3] = &unk_1002D45D8;
  id v11 = v6;
  id v9 = v6;
  [(GKFriendServicePrivate *)self sendResponselessWithRequest:v8 bagKey:@"gk-ignore-friend-invitation" refreshFriendsRequestContents:1 completion:v10];
}

- (void)getFriendRequestsBannerDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(GKService *)self transport];
  id v6 = [v5 storeBag];
  id v7 = [v6 valueForKey:GKFriendRequestsBannerPercentAllowed];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (uint64_t)[v7 integerValue];
    uint64_t v9 = 100;
    if (v8 < 100) {
      uint64_t v9 = v8;
    }
    unint64_t v10 = v9 & ~(v9 >> 63);
  }
  else
  {
    unint64_t v10 = 100;
  }
  unint64_t v11 = arc4random_uniform(0x64u);
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  id v13 = (void *)os_log_GKFriending;
  if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = +[NSNumber numberWithInteger:v11];
    id v16 = +[NSNumber numberWithInteger:v10];
    int v21 = 138412546;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Friend requests banner dice roll: %@, bag value: %@", (uint8_t *)&v21, 0x16u);
  }
  if (v10 >= v11)
  {
    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers();
    }
    id v20 = os_log_GKFriending;
    if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Fetching required data for friend requests banner", (uint8_t *)&v21, 2u);
    }
    [(GKFriendServicePrivate *)self getCombinedFriendInvitationListWithCompletion:v4];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    int v18 = os_log_GKFriending;
    if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Friend requests banner has been disabled", (uint8_t *)&v21, 2u);
    }
    v4[2](v4, &__NSArray0__struct, 0);
  }
}

- (void)sendResponselessWithRequest:(id)a3 bagKey:(id)a4 refreshFriendsRequestContents:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v14 = [(GKService *)self clientProxy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004E3BC;
  v16[3] = &unk_1002D5C40;
  BOOL v18 = a5;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v13 issueRequest:v12 bagKey:v11 clientProxy:v14 handler:v16];
}

@end