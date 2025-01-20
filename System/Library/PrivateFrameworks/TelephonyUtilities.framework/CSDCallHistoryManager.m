@interface CSDCallHistoryManager
- (CSDCHManager)chManager;
- (CSDCallHistoryManager)init;
- (CSDCallHistoryManager)initWithCHManager:(id)a3;
- (CSDCallHistoryManager)initWithCHManager:(id)a3 queue:(id)a4;
- (CSDCallHistoryManagerDelegate)delegateController;
- (OS_dispatch_queue)queue;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)handleCallHistoryDatabaseChangedNotification:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4;
@end

@implementation CSDCallHistoryManager

- (CSDCallHistoryManager)init
{
  id v3 = objc_alloc_init((Class)CHManager);
  v4 = [(CSDCallHistoryManager *)self initWithCHManager:v3];

  return v4;
}

- (CSDCallHistoryManager)initWithCHManager:(id)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  id v7 = a3;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callhistorymanager", v6);
  v9 = [(CSDCallHistoryManager *)self initWithCHManager:v7 queue:v8];

  return v9;
}

- (CSDCallHistoryManager)initWithCHManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSDCallHistoryManager;
  v9 = [(CSDCallHistoryManager *)&v14 init];
  if (v9)
  {
    v10 = (CSDCallHistoryManagerDelegate *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v9->_delegateController;
    v9->_delegateController = v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v9->_chManager, a3);
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"handleCallHistoryDatabaseChangedNotification:" name:kCallHistoryDatabaseChangedNotification object:0];
  }
  return v9;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kCallHistoryDatabaseChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)CSDCallHistoryManager;
  [(CSDCallHistoryManager *)&v4 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDCallHistoryManager *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryManager *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDCallHistoryManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C6B5C;
  block[3] = &unk_100504FE0;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDCallHistoryManager *)self delegateController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C6CC0;
  v13[3] = &unk_10050A0C8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateDelegatesUsingBlock:v13];
}

- (void)handleCallHistoryDatabaseChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", buf, 0x16u);
  }
  id v7 = [(CSDCallHistoryManager *)self delegateController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C6EFC;
  v8[3] = &unk_10050A0F0;
  v8[4] = self;
  [v7 enumerateDelegatesUsingBlock:v8];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCHManager)chManager
{
  return self->_chManager;
}

- (CSDCallHistoryManagerDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_chManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end