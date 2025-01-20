@interface WAActivityManager
+ (id)sharedActivityManager;
- (BOOL)debugTimerEnabled;
- (BOOL)isEagerExitEnabled;
- (NSDate)dateFirstTransaction;
- (OS_dispatch_queue)queue;
- (WAActivityManager)init;
- (id)alternateExecutionBlockForCleanExit;
- (id)executeBeforePossibleEagerExit;
- (unint64_t)osTransactionsActive;
- (unint64_t)transactionsCompleted;
- (unint64_t)transactionsStarted;
- (void)_executeBeforePossibleEagerExit;
- (void)_executeTimerBlock;
- (void)debugTimer;
- (void)osTransactionComplete:(id)a3;
- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4;
- (void)setAlternateExecutionBlockForCleanExit:(id)a3;
- (void)setDateFirstTransaction:(id)a3;
- (void)setExecuteBeforePossibleEagerExit:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactionsCompleted:(unint64_t)a3;
- (void)setTransactionsStarted:(unint64_t)a3;
@end

@implementation WAActivityManager

+ (id)sharedActivityManager
{
  if (qword_1000F10A8 != -1) {
    dispatch_once(&qword_1000F10A8, &stru_1000D1B88);
  }
  v2 = (void *)qword_1000F10B0;

  return v2;
}

- (WAActivityManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)WAActivityManager;
  v2 = [(WAActivityManager *)&v21 init];
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0;

    uint64_t v5 = +[NSMutableArray array];
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("WAActivityManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v3->BOOL isEagerExitEnabled = 0;
    uint64_t v10 = MGGetProductType();
    v11 = WALogActivityManagerHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == 3348380076)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "-[WAActivityManager init]";
        __int16 v24 = 1024;
        int v25 = 77;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is b520, setting isEagerExitEnabled", buf, 0x12u);
      }

      v3->BOOL isEagerExitEnabled = 1;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v23 = "-[WAActivityManager init]";
        __int16 v24 = 1024;
        int v25 = 80;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager is not b520, no isEagerExitEnabled", buf, 0x12u);
      }
    }
    v13 = +[NSUserDefaults standardUserDefaults];
    v14 = [v13 persistentDomainForName:@"com.apple.wifianalyticsd"];

    v15 = [v14 objectForKey:@"eager-exit-enable"];
    v16 = v15;
    if (v15)
    {
      v3->BOOL isEagerExitEnabled = [v15 BOOLValue];
      v17 = WALogActivityManagerHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isEagerExitEnabled = v3->isEagerExitEnabled;
        *(_DWORD *)buf = 136447234;
        v23 = "-[WAActivityManager init]";
        __int16 v24 = 1024;
        int v25 = 88;
        __int16 v26 = 2112;
        CFStringRef v27 = @"com.apple.wifianalyticsd";
        __int16 v28 = 2112;
        CFStringRef v29 = @"eager-exit-enable";
        __int16 v30 = 1024;
        BOOL v31 = isEagerExitEnabled;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@ value: %d", buf, 0x2Cu);
      }
    }
    v3->waitingToInitDebugTimer = 0;
  }
  else
  {
    v20 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "-[WAActivityManager init]";
      __int16 v24 = 1024;
      int v25 = 100;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAActivityManager init error!", buf, 0x12u);
    }
  }
  return v3;
}

- (BOOL)isEagerExitEnabled
{
  return self->isEagerExitEnabled;
}

- (BOOL)debugTimerEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.wifianalyticsd"];

  v4 = [v3 objectForKey:@"eager-exit-debug"];
  if (v4)
  {
    uint64_t v5 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446978;
      v9 = "-[WAActivityManager debugTimerEnabled]";
      __int16 v10 = 1024;
      int v11 = 121;
      __int16 v12 = 2112;
      CFStringRef v13 = @"com.apple.wifianalyticsd";
      __int16 v14 = 2112;
      CFStringRef v15 = @"eager-exit-debug";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@", (uint8_t *)&v8, 0x26u);
    }

    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)debugTimer
{
  if (self->_periodicActiveListTimer)
  {
    v3 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[WAActivityManager debugTimer]";
      __int16 v8 = 1024;
      int v9 = 130;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WAActivityManager debugTimer already setup", buf, 0x12u);
    }
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    if (obj->waitingToInitDebugTimer)
    {
      objc_sync_exit(obj);
    }
    else
    {
      v2 = WALogActivityManagerHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v7 = "-[WAActivityManager debugTimer]";
        __int16 v8 = 1024;
        int v9 = 136;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:configuring _periodicActiveListTimer", buf, 0x12u);
      }

      obj->waitingToInitDebugTimer = 1;
      objc_sync_exit(obj);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007F0F0;
      block[3] = &unk_1000D0D98;
      block[4] = obj;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007F560;
    block[3] = &unk_1000D1BD8;
    block[4] = self;
    id v10 = v6;
    int v11 = a3;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
}

- (void)osTransactionComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v12 = 0;
  CFStringRef v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (self->isEagerExitEnabled)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007F8D0;
    block[3] = &unk_1000D1C28;
    id v9 = v4;
    id v10 = self;
    int v11 = &v12;
    dispatch_sync((dispatch_queue_t)queue, block);
    if (*((unsigned char *)v13 + 24))
    {
      v7 = WALogActivityManagerHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v17 = "-[WAActivityManager osTransactionComplete:]";
        __int16 v18 = 1024;
        int v19 = 269;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:osTransactionComplete TRANSACTION NOT FOUND ASSERT", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_executeBeforePossibleEagerExit
{
  v3 = [(WAActivityManager *)self executeBeforePossibleEagerExit];

  if (v3)
  {
    id v4 = [(WAActivityManager *)self executeBeforePossibleEagerExit];
    v4[2]();
  }
}

- (void)_executeTimerBlock
{
  v3 = [(WAActivityManager *)self alternateExecutionBlockForCleanExit];

  if (v3)
  {
    id v4 = [(WAActivityManager *)self alternateExecutionBlockForCleanExit];
    v4[2]();
  }
}

- (unint64_t)osTransactionsActive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000801AC;
  v5[3] = &unk_1000D0F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)alternateExecutionBlockForCleanExit
{
  return self->_alternateExecutionBlockForCleanExit;
}

- (void)setAlternateExecutionBlockForCleanExit:(id)a3
{
}

- (id)executeBeforePossibleEagerExit
{
  return self->_executeBeforePossibleEagerExit;
}

- (void)setExecuteBeforePossibleEagerExit:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)transactionsStarted
{
  return self->_transactionsStarted;
}

- (void)setTransactionsStarted:(unint64_t)a3
{
  self->_transactionsStarted = a3;
}

- (NSDate)dateFirstTransaction
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDateFirstTransaction:(id)a3
{
}

- (unint64_t)transactionsCompleted
{
  return self->_transactionsCompleted;
}

- (void)setTransactionsCompleted:(unint64_t)a3
{
  self->_transactionsCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFirstTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_executeBeforePossibleEagerExit, 0);
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);

  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end