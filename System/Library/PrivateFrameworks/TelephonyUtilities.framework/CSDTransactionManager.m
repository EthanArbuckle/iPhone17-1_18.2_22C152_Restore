@interface CSDTransactionManager
+ (CSDTransactionManager)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDTransactionManager)initWithQueue:(id)a3;
- (NSMapTable)openTransactions;
- (OS_dispatch_queue)queue;
- (void)beginTransactionIfNecessaryForObject:(id)a3 withReason:(id)a4;
- (void)dealloc;
- (void)endTransactionIfNecessaryForObject:(id)a3;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleSessionStateChanged:(id)a3;
@end

@implementation CSDTransactionManager

+ (CSDTransactionManager)sharedInstance
{
  return (CSDTransactionManager *)+[CSDTransactionManager sharedInstanceWithQueue:0];
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010BF4;
  v8[3] = &unk_100504EE8;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_10058C1A8;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_10058C1A8, v8);
  }
  id v6 = (id)qword_10058C1A0;

  return v6;
}

- (CSDTransactionManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSDTransactionManager;
  id v5 = [(CSDTransactionManager *)&v30 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }
    else
    {
      id v8 = &_dispatch_main_q;
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)&_dispatch_main_q;
    }

    uint64_t v9 = +[NSMapTable strongToStrongObjectsMapTable];
    openTransactions = v5->_openTransactions;
    v5->_openTransactions = (NSMapTable *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v5 selector:"handleCallStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v5 selector:"handleCallStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v5 selector:"handleSessionStateChanged:" name:@"CSDIDSDualSessionStateChangedNotification" object:0];

    [(CSDTransactionManager *)v5 beginTransactionIfNecessaryForObject:v5 withReason:@"CSDTransactionManager"];
    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    v15 = v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010F20;
    block[3] = &unk_100504EC0;
    v16 = v5;
    v29 = v16;
    dispatch_after(v14, v15, block);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v17 = +[TUCallCenter sharedInstance];
    v18 = [v17 _allCalls];

    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          [(CSDTransactionManager *)v16 beginTransactionIfNecessaryForObject:*(void *)(*((void *)&v24 + 1) + 8 * (void)v22) withReason:@"TUCallCenter_allCalls"];
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }
      while (v20);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDTransactionManager;
  [(CSDTransactionManager *)&v4 dealloc];
}

- (void)beginTransactionIfNecessaryForObject:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDTransactionManager *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    uint64_t v9 = [(CSDTransactionManager *)self openTransactions];
    id v10 = [v9 objectForKey:v6];

    if (!v10)
    {
      id v11 = [@"com.apple.calls.callservicesd." stringByAppendingFormat:@"%@:%@", v7, v6];
      [v11 UTF8String];
      v12 = (void *)os_transaction_create();

      v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v14 = [(CSDTransactionManager *)self openTransactions];
        *(_DWORD *)buf = 138412802;
        id v17 = v6;
        __int16 v18 = 2048;
        id v19 = [v14 count];
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Beginning transaction for %@. Transaction count is now %lu. Added transaction: %@", buf, 0x20u);
      }
      v15 = [(CSDTransactionManager *)self openTransactions];
      [v15 setObject:v12 forKey:v6];
    }
  }
}

- (void)endTransactionIfNecessaryForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDTransactionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(CSDTransactionManager *)self openTransactions];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      id v8 = [(CSDTransactionManager *)self openTransactions];
      uint64_t v9 = [v8 objectForKey:v4];

      id v10 = [(CSDTransactionManager *)self openTransactions];
      [v10 removeObjectForKey:v4];

      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(CSDTransactionManager *)self openTransactions];
        int v13 = 138412802;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = [v12 count];
        __int16 v17 = 2112;
        __int16 v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ending transaction for %@. Transaction count is now %lu. Ended transaction: %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDTransactionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 object];

  if ([v6 status] == 6) {
    [(CSDTransactionManager *)self endTransactionIfNecessaryForObject:v6];
  }
  else {
    [(CSDTransactionManager *)self beginTransactionIfNecessaryForObject:v6 withReason:@"handleCallStatusChanged"];
  }
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDTransactionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011404;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSMapTable)openTransactions
{
  return self->_openTransactions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_openTransactions, 0);
}

@end