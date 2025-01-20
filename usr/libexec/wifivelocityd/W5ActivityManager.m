@interface W5ActivityManager
+ (id)sharedActivityManager;
- (BOOL)debugTimerEnabled;
- (NSDate)dateFirstTransaction;
- (OS_dispatch_queue)queue;
- (W5ActivityManager)init;
- (id)alternateExecutionBlockForCleanExit;
- (unint64_t)osTransactionsActive;
- (unint64_t)transactionsCompleted;
- (unint64_t)transactionsStarted;
- (void)_executeTimerBlock;
- (void)debugTimer;
- (void)osTransactionComplete:(id)a3;
- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4;
- (void)setAlternateExecutionBlockForCleanExit:(id)a3;
- (void)setDateFirstTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransactionsCompleted:(unint64_t)a3;
- (void)setTransactionsStarted:(unint64_t)a3;
@end

@implementation W5ActivityManager

+ (id)sharedActivityManager
{
  if (qword_100103668 != -1) {
    dispatch_once(&qword_100103668, &stru_1000DD6B0);
  }
  v2 = (void *)qword_100103670;

  return v2;
}

- (W5ActivityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)W5ActivityManager;
  v2 = [(W5ActivityManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    eagerExitTimeout = v2->_eagerExitTimeout;
    v2->_eagerExitTimeout = 0;

    uint64_t v5 = +[NSMutableArray array];
    active_transactions = v3->_active_transactions;
    v3->_active_transactions = (NSMutableArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("W5ActivityManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager init error!", v11, 2u);
  }
  return v3;
}

- (BOOL)debugTimerEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.wifivelocity"];

  v4 = [v3 objectForKey:@"eager-exit-debug"];
  if (v4)
  {
    NSLog(@"%s: Found preference value in domain: %@ key: %@", "-[W5ActivityManager debugTimerEnabled]", @"com.apple.wifivelocity", @"eager-exit-debug");
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)debugTimer
{
  periodicActiveListTimer = self->_periodicActiveListTimer;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (periodicActiveListTimer)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager debugTimer already setup", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager configuring _periodicActiveListTimer", buf, 2u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000173B8;
    block[3] = &unk_1000DD230;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)osTransactionCreate:(const char *)a3 transaction:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017734;
  block[3] = &unk_1000DD700;
  block[4] = self;
  id v10 = v6;
  v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)osTransactionComplete:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000179F0;
  block[3] = &unk_1000DD778;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  v11 = &v12;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v13 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete TRANSACTION NOT FOUND ASSERT", v7, 2u);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_executeTimerBlock
{
  v3 = [(W5ActivityManager *)self alternateExecutionBlockForCleanExit];

  if (v3)
  {
    id v4 = [(W5ActivityManager *)self alternateExecutionBlockForCleanExit];
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
  v5[2] = sub_1000180C4;
  v5[3] = &unk_1000DD7A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
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
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
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
  objc_storeStrong(&self->_alternateExecutionBlockForCleanExit, 0);
  objc_storeStrong((id *)&self->_active_transactions, 0);
  objc_storeStrong((id *)&self->_periodicActiveListTimer, 0);

  objc_storeStrong((id *)&self->_eagerExitTimeout, 0);
}

@end