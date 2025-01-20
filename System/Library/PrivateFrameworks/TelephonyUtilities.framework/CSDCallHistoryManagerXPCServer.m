@interface CSDCallHistoryManagerXPCServer
- (CSDCallHistoryManager)callHistoryManager;
- (CSDCallHistoryManagerXPCServer)initWithManager:(id)a3;
- (CSDClientManager)clientManager;
- (OS_dispatch_queue)queue;
- (void)invalidate;
- (void)registerClient:(id)a3;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)unregisterClient:(id)a3;
- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4;
@end

@implementation CSDCallHistoryManagerXPCServer

- (CSDCallHistoryManagerXPCServer)initWithManager:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSDCallHistoryManagerXPCServer;
  v6 = [(CSDCallHistoryManagerXPCServer *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callhistorymanagerxpcserver", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_callHistoryManager, a3);
    [(CSDCallHistoryManager *)v6->_callHistoryManager addDelegate:v6 queue:v6->_queue];
    v9 = [[CSDClientManager alloc] initWithSerialQueue:v6->_queue];
    clientManager = v6->_clientManager;
    v6->_clientManager = v9;

    v11 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BA1B8;
    block[3] = &unk_100504EC0;
    v12 = v6;
    v18 = v12;
    dispatch_sync(v11, block);
    v13 = [(CSDCallHistoryManagerXPCServer *)v12 queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BA430;
    v15[3] = &unk_100504EC0;
    v16 = v12;
    dispatch_async(v13, v15);
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(CSDCallHistoryManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA4CC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(CSDCallHistoryManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v10);

  v11 = [(CSDCallHistoryManagerXPCServer *)self clientManager];
  v12 = [v11 currentClient];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BA638;
  v15[3] = &unk_100506BD0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a5;
  id v13 = v9;
  id v14 = v8;
  sub_1000085AC(v12, @"modify-call-history", v15, 0, (uint64_t)"-[CSDCallHistoryManagerXPCServer reportRecentCallForConversation:withStartDate:avMode:]");
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallHistoryManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDCallHistoryManagerXPCServer *)self clientManager];
  v10 = [v9 currentClient];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BA7B4;
  v13[3] = &unk_100504FE0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  sub_1000085AC(v10, @"modify-call-history", v13, 0, (uint64_t)"-[CSDCallHistoryManagerXPCServer updateOutgoingLocalParticipantUUID:forCallsWithOutgoingLocalParticipantUUID:]");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BA8BC;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BA9C4;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallHistoryManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end