@interface GKInviteURLManager
+ (id)sharedManager;
- (BOOL)isRecordEqualToMostRecentInviteShare:(id)a3;
- (CKRecordID)mostRecentInviteShareRootRecordID;
- (GKInviteURLManager)init;
- (NSMutableSet)acceptingInProgressRecordIDs;
- (OS_dispatch_queue)inviteManagerQueue;
- (void)setAcceptingInProgressRecordIDs:(id)a3;
- (void)setInviteManagerQueue:(id)a3;
- (void)setMostRecentInviteShareRootRecordID:(id)a3;
@end

@implementation GKInviteURLManager

+ (id)sharedManager
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKInviteURLManager sharedManager", v6, 2u);
  }
  if (qword_1003296B8 != -1) {
    dispatch_once(&qword_1003296B8, &stru_1002D8D08);
  }
  v4 = (void *)qword_1003296B0;

  return v4;
}

- (GKInviteURLManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKInviteURLManager;
  id v2 = [(GKInviteURLManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableSet set];
    [(GKInviteURLManager *)v2 setAcceptingInProgressRecordIDs:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.gamecenter.inviteurlmanager", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(GKInviteURLManager *)v2 setInviteManagerQueue:v4];
  }
  return v2;
}

- (BOOL)isRecordEqualToMostRecentInviteShare:(id)a3
{
  if (!a3) {
    return 0;
  }
  dispatch_queue_t v4 = [a3 recordID];
  v5 = [(GKInviteURLManager *)self mostRecentInviteShareRootRecordID];
  unsigned __int8 v6 = [v4 isEqual:v5];

  return v6;
}

- (CKRecordID)mostRecentInviteShareRootRecordID
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000B6668;
  v11 = sub_1000B6678;
  id v12 = 0;
  v3 = [(GKInviteURLManager *)self inviteManagerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B6680;
  v6[3] = &unk_1002D6B58;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CKRecordID *)v4;
}

- (void)setMostRecentInviteShareRootRecordID:(id)a3
{
  id v4 = (CKRecordID *)a3;
  if (self->_mostRecentInviteShareRootRecordID != v4)
  {
    v5 = [(GKInviteURLManager *)self inviteManagerQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B6754;
    v6[3] = &unk_1002D3B38;
    v6[4] = self;
    uint64_t v7 = v4;
    dispatch_barrier_async(v5, v6);
  }
}

- (NSMutableSet)acceptingInProgressRecordIDs
{
  return self->_acceptingInProgressRecordIDs;
}

- (void)setAcceptingInProgressRecordIDs:(id)a3
{
}

- (OS_dispatch_queue)inviteManagerQueue
{
  return self->_inviteManagerQueue;
}

- (void)setInviteManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteManagerQueue, 0);
  objc_storeStrong((id *)&self->_acceptingInProgressRecordIDs, 0);

  objc_storeStrong((id *)&self->_mostRecentInviteShareRootRecordID, 0);
}

@end