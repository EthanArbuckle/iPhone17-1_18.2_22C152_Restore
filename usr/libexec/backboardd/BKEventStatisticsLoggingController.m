@interface BKEventStatisticsLoggingController
+ (OS_dispatch_queue)workQueue;
- (BKEventStatisticsLoggingController)initWithLabel:(id)a3 logCategory:(id)a4;
- (NSArray)statistics;
- (id)beginTransactionForReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setStatistics:(id)a3;
- (void)updateStatistics:(id)a3;
@end

@implementation BKEventStatisticsLoggingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionAssertion, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_logCategory, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (BKEventStatisticsLoggingController)initWithLabel:(id)a3 logCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BKEventStatisticsLoggingController;
  v8 = [(BKEventStatisticsLoggingController *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v8->_resetStartTime = 1;
    v10 = (NSString *)[v6 copy];
    label = v9->_label;
    v9->_label = v10;

    objc_storeStrong((id *)&v9->_logCategory, a4);
    objc_initWeak(&location, v9);
    v12 = [@"BKEventStatistics-" stringByAppendingString:v6];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100009DF8;
    v21 = &unk_1000F7F58;
    objc_copyWeak(&v22, &location);
    uint64_t v13 = +[BSCompoundAssertion assertionWithIdentifier:v12 stateDidChangeHandler:&v18];
    transactionAssertion = v9->_transactionAssertion;
    v9->_transactionAssertion = (BSCompoundAssertion *)v13;

    uint64_t v15 = [objc_opt_class() workQueue:v18, v19, v20, v21];
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)beginTransactionForReason:(id)a3
{
  return [(BSCompoundAssertion *)self->_transactionAssertion acquireForReason:a3];
}

- (void)updateStatistics:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E14C;
  v7[3] = &unk_1000F7FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)setStatistics:(id)a3
{
}

- (void)invalidate
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AE3C;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  if (!self->_invalid)
  {
    id v4 = +[NSString stringWithFormat:@"someone forgot to invoke -invalidate on %@", self];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKEventStatisticsLoggingController.m";
      __int16 v17 = 1024;
      int v18 = 439;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10001BE40);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKEventStatisticsLoggingController;
  [(BKEventStatisticsLoggingController *)&v8 dealloc];
}

+ (OS_dispatch_queue)workQueue
{
  if (qword_100123098 != -1) {
    dispatch_once(&qword_100123098, &stru_1000F7F30);
  }
  v2 = (void *)qword_1001230A0;

  return (OS_dispatch_queue *)v2;
}

- (NSArray)statistics
{
  return self->_statistics;
}

@end