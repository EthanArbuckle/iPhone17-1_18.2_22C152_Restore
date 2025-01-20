@interface KmlXpcService
- (void)queueCrossPlatformSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 callback:(id)a6;
- (void)queueManagementSession:(id)a3 callback:(id)a4;
- (void)queueOwnerPairingSession:(id)a3 callback:(id)a4;
- (void)queueSharingSession:(id)a3 callback:(id)a4;
- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3;
- (void)registerCrossPlatformTestMessageSendHandler:(id)a3;
- (void)registerFriendSideInvitationUnusableHandler:(id)a3;
- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3;
- (void)registerFriendSideSharingTestCompletion:(id)a3;
- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3;
- (void)registerOwnerSideInvitationRequestHandler:(id)a3;
- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4;
- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4;
- (void)unregisterSharingTestHandlers;
@end

@implementation KmlXpcService

- (void)queueOwnerPairingSession:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, KmlOwnerPairingSession *, BOOL, void *))a4;
  v8 = +[NSXPCConnection currentConnection];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueOwnerPairingSession:callback:]", 41, &stru_100421848, v9, v10, v11, v12, v26);
  v13 = +[KeyManagementLibrary sharedLibrary];
  char v27 = 0;
  if ([v13 numberOfPairingSessionsQueued] < 6)
  {
    v23 = [(KmlSession *)[KmlOwnerPairingSession alloc] initWithRemoteObject:v6 connection:v8 andQueue:self->_workQueue];
    v24 = [v8 userInfo];
    v25 = [v24 objectForKeyedSubscript:@"ProxyObjects"];
    [v25 addObject:v23];
    [v13 addNewSession:v23 firstInQueue:&v27];

    v21 = 0;
    BOOL v22 = v27 != 0;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KmlXpcService queueOwnerPairingSession:callback:]", 48, @"Number of sessions higher than max allowed (%u)", v14, v15, v16, v17, 5);
    v18 = +[NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:KmlErrorString(13)];
    v29 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v21 = +[NSError errorWithDomain:v18 code:13 userInfo:v20];

    BOOL v22 = 0;
    v23 = 0;
  }
  v7[2](v7, v23, v22, v21);
}

- (void)queueSharingSession:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSXPCConnection currentConnection];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueSharingSession:callback:]", 71, &stru_100421848, v9, v10, v11, v12, v17);
  v13 = [(KmlSession *)[KmlKeySharingSession alloc] initWithRemoteObject:v7 connection:v8 andQueue:self->_workQueue];

  uint64_t v14 = [v8 userInfo];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"ProxyObjects"];
  [v15 addObject:v13];
  uint64_t v16 = +[KeyManagementLibrary sharedLibrary];
  unsigned __int8 v18 = 0;
  [v16 addNewSession:v13 firstInQueue:&v18];
  (*((void (**)(id, KmlKeySharingSession *, void, void))v6 + 2))(v6, v13, v18, 0);
}

- (void)queueManagementSession:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSXPCConnection currentConnection];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueManagementSession:callback:]", 95, &stru_100421848, v9, v10, v11, v12, v17);
  v13 = [(KmlSession *)[KmlKeyManagementSession alloc] initWithRemoteObject:v7 connection:v8 andQueue:self->_workQueue];

  uint64_t v14 = [v8 userInfo];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"ProxyObjects"];
  [v15 addObject:v13];
  uint64_t v16 = +[KeyManagementLibrary sharedLibrary];
  unsigned __int8 v18 = 0;
  [v16 addNewSession:v13 firstInQueue:&v18];
  (*((void (**)(id, KmlKeyManagementSession *, void, void))v6 + 2))(v6, v13, v18, 0);
}

- (void)queueCrossPlatformSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 callback:(id)a6
{
  uint64_t v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService queueCrossPlatformSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:callback:]", 117, &stru_100421848, v13, v14, v15, v16, v17);
  sub_10031DB48();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_10031E804((uint64_t)v18, v12, v11, v10);

  v9[2](v9, 0);
}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerOwnerSideSharingTestInvitations:callback:]", 127, &stru_100421848, v8, v9, v10, v11, v15[0]);
  workQueue = self->_workQueue;
  v15[0] = (uint64_t)_NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)sub_1002FA3C4;
  v15[3] = (uint64_t)&unk_10040BE80;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(workQueue, v15);
}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerOwnerSideInvitationRequestHandler:]", 137, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA4F0;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideSharingTestInvitationUUIDHandler:]", 147, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA61C;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideSharingTestCompletion:]", 157, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA748;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSideInvitationUnusableHandler:]", 167, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA874;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerCrossPlatformTestMessageOverIDSHandler:]", 177, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FA9A0;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)registerCrossPlatformTestMessageSendHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerCrossPlatformTestMessageSendHandler:]", 187, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FAACC;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService sendCrossPlatformTestData:toIdsIdentifier:]", 197, &stru_100421848, v8, v9, v10, v11, v15[0]);
  workQueue = self->_workQueue;
  v15[0] = (uint64_t)_NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)sub_1002FAC20;
  v15[3] = (uint64_t)&unk_10040D1A0;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(workQueue, v15);
}

- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService registerFriendSidePasscodeRetryRequestHandler:]", 207, &stru_100421848, v5, v6, v7, v8, v11);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FAD4C;
  block[3] = &unk_10040C108;
  id v13 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)unregisterSharingTestHandlers
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlXpcService unregisterSharingTestHandlers]", 217, &stru_100421848, v2, v3, v4, v5, v8);
  workQueue = self->_workQueue;

  dispatch_async(workQueue, &stru_100419948);
}

- (void).cxx_destruct
{
}

@end