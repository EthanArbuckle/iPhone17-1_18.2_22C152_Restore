@interface CKKSNearFutureScheduler
- (BOOL)keepProcessAlive;
- (BOOL)liveRequest;
- (CKKSCondition)liveRequestReceived;
- (CKKSNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9;
- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 qosClass:(unsigned int)a9 block:(id)a10;
- (CKKSResultOperation)operationDependency;
- (NSDate)nextFireTime;
- (NSDate)predictedNextFireTime;
- (NSOperationQueue)operationQueue;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (double)backoff;
- (id)description;
- (id)futureBlock;
- (id)makeOperationDependency;
- (int64_t)operationDependencyDescriptionCode;
- (unint64_t)currentDelay;
- (unint64_t)initialDelay;
- (unint64_t)maximumDelay;
- (void)_onqueueTimerTick;
- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4;
- (void)cancel;
- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4;
- (void)setBackoff:(double)a3;
- (void)setCurrentDelay:(unint64_t)a3;
- (void)setFutureBlock:(id)a3;
- (void)setInitialDelay:(unint64_t)a3;
- (void)setKeepProcessAlive:(BOOL)a3;
- (void)setLiveRequest:(BOOL)a3;
- (void)setLiveRequestReceived:(id)a3;
- (void)setMaximumDelay:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setOperationDependency:(id)a3;
- (void)setOperationDependencyDescriptionCode:(int64_t)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPredictedNextFireTime:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTransaction:(id)a3;
- (void)trigger;
- (void)triggerAt:(unint64_t)a3;
- (void)waitUntil:(unint64_t)a3;
@end

@implementation CKKSNearFutureScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_predictedNextFireTime, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_liveRequestReceived, 0);
  objc_storeStrong((id *)&self->_operationDependency, 0);

  objc_storeStrong(&self->_futureBlock, 0);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 120, 1);
}

- (void)setKeepProcessAlive:(BOOL)a3
{
  self->_keepProcessAlive = a3;
}

- (BOOL)keepProcessAlive
{
  return self->_keepProcessAlive;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLiveRequest:(BOOL)a3
{
  self->_liveRequest = a3;
}

- (BOOL)liveRequest
{
  return self->_liveRequest;
}

- (void)setPredictedNextFireTime:(id)a3
{
}

- (NSDate)predictedNextFireTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOperationDependencyDescriptionCode:(int64_t)a3
{
  self->_operationDependencyDescriptionCode = a3;
}

- (int64_t)operationDependencyDescriptionCode
{
  return self->_operationDependencyDescriptionCode;
}

- (void)setBackoff:(double)a3
{
  self->_backoff = a3;
}

- (double)backoff
{
  return self->_backoff;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setCurrentDelay:(unint64_t)a3
{
  self->_currentDelay = a3;
}

- (unint64_t)currentDelay
{
  return self->_currentDelay;
}

- (void)setInitialDelay:(unint64_t)a3
{
  self->_initialDelay = a3;
}

- (unint64_t)initialDelay
{
  return self->_initialDelay;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLiveRequestReceived:(id)a3
{
}

- (CKKSCondition)liveRequestReceived
{
  return (CKKSCondition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationDependency:(id)a3
{
}

- (CKKSResultOperation)operationDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFutureBlock:(id)a3
{
}

- (id)futureBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)cancel
{
  v3 = [(CKKSNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6034;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4
{
  v7 = [(CKKSNearFutureScheduler *)self queue];
  dispatch_assert_queue_V2(v7);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ([(CKKSNearFutureScheduler *)self keepProcessAlive])
  {
    v8 = [(CKKSNearFutureScheduler *)self transaction];

    if (!v8)
    {
      v9 = [(CKKSNearFutureScheduler *)self name];
      id v10 = +[NSString stringWithFormat:@"com.apple.securityd.%@", v9];
      [v10 UTF8String];
      v11 = (void *)os_transaction_create();
      [(CKKSNearFutureScheduler *)self setTransaction:v11];
    }
  }
  if (a3)
  {
    v12 = [(CKKSNearFutureScheduler *)self predictedNextFireTime];

    if (v12)
    {
      v13 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3 / 1000000000.0];
      v14 = [(CKKSNearFutureScheduler *)self predictedNextFireTime];
      id v15 = [v13 compare:v14];

      if (v15 == (id)1)
      {
        v16 = [(CKKSNearFutureScheduler *)self timer];
        dispatch_source_cancel(v16);

        [(CKKSNearFutureScheduler *)self setPredictedNextFireTime:0];
      }
    }
  }
  if (a4 != -1)
  {
    v17 = [(CKKSNearFutureScheduler *)self predictedNextFireTime];

    if (v17)
    {
      v18 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3 / 1000000000.0];
      v19 = [(CKKSNearFutureScheduler *)self predictedNextFireTime];
      id v20 = [v18 compare:v19];

      if (v20 != (id)1)
      {
        v21 = [(CKKSNearFutureScheduler *)self timer];
        dispatch_source_cancel(v21);

        [(CKKSNearFutureScheduler *)self setPredictedNextFireTime:0];
      }
    }
  }
  v22 = [(CKKSNearFutureScheduler *)self timer];
  if (!v22
    || ([(CKKSNearFutureScheduler *)self timer],
        v23 = objc_claimAutoreleasedReturnValue(),
        intptr_t v24 = dispatch_source_testcancel(v23),
        v23,
        v22,
        v24))
  {
    v25 = [(CKKSNearFutureScheduler *)self queue];
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v25);
    [(CKKSNearFutureScheduler *)self setTimer:v26];

    v27 = [(CKKSNearFutureScheduler *)self timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000A64C4;
    handler[3] = &unk_1003077A0;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v27, handler);

    unint64_t v28 = [(CKKSNearFutureScheduler *)self currentDelay];
    if (v28 <= a3) {
      unint64_t v29 = a3;
    }
    else {
      unint64_t v29 = v28;
    }
    if (!a3) {
      unint64_t v29 = v28;
    }
    if (v29 >= a4) {
      unint64_t v30 = a4;
    }
    else {
      unint64_t v30 = v29;
    }
    if (a4 == -1) {
      int64_t v31 = v29;
    }
    else {
      int64_t v31 = v30;
    }
    v32 = [(CKKSNearFutureScheduler *)self timer];
    dispatch_time_t v33 = dispatch_walltime(0, v31);
    dispatch_source_set_timer(v32, v33, [(CKKSNearFutureScheduler *)self currentDelay], 0x2FAF080uLL);

    v34 = [(CKKSNearFutureScheduler *)self timer];
    dispatch_resume(v34);

    v35 = +[NSDate dateWithTimeIntervalSinceNow:(double)(unint64_t)v31 / 1000000000.0];
    [(CKKSNearFutureScheduler *)self setPredictedNextFireTime:v35];

    objc_destroyWeak(&v37);
  }
  objc_destroyWeak(&location);
}

- (void)trigger
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(CKKSNearFutureScheduler *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A65D8;
  v4[3] = &unk_1003077A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueueTimerTick
{
  v3 = [(CKKSNearFutureScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(CKKSNearFutureScheduler *)self liveRequest])
  {
    id v18 = [(CKKSNearFutureScheduler *)self operationDependency];
    v4 = [(CKKSNearFutureScheduler *)self makeOperationDependency];
    [(CKKSNearFutureScheduler *)self setOperationDependency:v4];

    id v5 = [(CKKSNearFutureScheduler *)self futureBlock];
    v5[2]();

    [(CKKSNearFutureScheduler *)self setLiveRequest:0];
    v6 = objc_alloc_init(CKKSCondition);
    [(CKKSNearFutureScheduler *)self setLiveRequestReceived:v6];

    [(CKKSNearFutureScheduler *)self setTransaction:0];
    if ([(CKKSNearFutureScheduler *)self currentDelay])
    {
      double v7 = (double)[(CKKSNearFutureScheduler *)self currentDelay];
      [(CKKSNearFutureScheduler *)self backoff];
      double v9 = v8 * v7;
      double v10 = (double)[(CKKSNearFutureScheduler *)self maximumDelay];
      if (v9 < v10) {
        double v10 = v9;
      }
      unint64_t v11 = (unint64_t)v10;
    }
    else
    {
      unint64_t v11 = [(CKKSNearFutureScheduler *)self maximumDelay];
    }
    [(CKKSNearFutureScheduler *)self setCurrentDelay:v11];
    v14 = [(CKKSNearFutureScheduler *)self timer];
    dispatch_time_t v15 = dispatch_walltime(0, [(CKKSNearFutureScheduler *)self currentDelay]);
    dispatch_source_set_timer(v14, v15, [(CKKSNearFutureScheduler *)self currentDelay], 0x2FAF080uLL);

    v16 = [(CKKSNearFutureScheduler *)self operationQueue];
    [v16 addOperation:v18];

    v17 = +[NSDate dateWithTimeIntervalSinceNow:(double)[(CKKSNearFutureScheduler *)self currentDelay] / 1000000000.0];
    [(CKKSNearFutureScheduler *)self setPredictedNextFireTime:v17];
  }
  else
  {
    v12 = [(CKKSNearFutureScheduler *)self timer];
    dispatch_source_cancel(v12);

    [(CKKSNearFutureScheduler *)self setPredictedNextFireTime:0];
    unint64_t v13 = [(CKKSNearFutureScheduler *)self initialDelay];
    [(CKKSNearFutureScheduler *)self setCurrentDelay:v13];
  }
}

- (void)triggerAt:(unint64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(CKKSNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A697C;
  block[3] = &unk_1002F8D98;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)waitUntil:(unint64_t)a3
{
  id v5 = [(CKKSNearFutureScheduler *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A6A8C;
  v6[3] = &unk_1002FA1B8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (NSDate)nextFireTime
{
  if ([(CKKSNearFutureScheduler *)self liveRequest]
    || ([(CKKSNearFutureScheduler *)self liveRequestReceived],
        v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 wait:50000],
        v3,
        !v4))
  {
    id v5 = [(CKKSNearFutureScheduler *)self predictedNextFireTime];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (id)description
{
  v3 = [(CKKSNearFutureScheduler *)self nextFireTime];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v5 = [(CKKSNearFutureScheduler *)self name];
    v6 = [v4 stringFromDate:v3];
    double v7 = +[NSString stringWithFormat:@"<CKKSNearFutureScheduler(%@): next at %@", v5, v6];
  }
  else
  {
    id v4 = [(CKKSNearFutureScheduler *)self name];
    double v7 = +[NSString stringWithFormat:@"<CKKSNearFutureScheduler(%@): no pending attempts", v4];
  }

  return v7;
}

- (id)makeOperationDependency
{
  v3 = [(CKKSNearFutureScheduler *)self name];
  id v4 = +[NSString stringWithFormat:@"nfs-%@", v3];
  id v5 = +[CKKSResultOperation named:v4 withBlock:&stru_1002F8D70];

  [v5 setDescriptionErrorCode:-[CKKSNearFutureScheduler operationDependencyDescriptionCode](self, "operationDependencyDescriptionCode")];

  return v5;
}

- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4
{
  double v7 = [(CKKSNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6D70;
  block[3] = &unk_1002F8D50;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 qosClass:(unsigned int)a9 block:(id)a10
{
  id v18 = a3;
  id v19 = a10;
  v37.receiver = self;
  v37.super_class = (Class)CKKSNearFutureScheduler;
  id v20 = [(CKKSNearFutureScheduler *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a3);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, (dispatch_qos_class_t)a9, 0);

    id v24 = +[NSString stringWithFormat:@"near-future-scheduler-%@", v18];
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], v23);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v25;

    v21->_initialDelay = a4;
    v21->_currentDelay = a4;
    v21->_maximumDelay = a6;
    v21->_backoff = a5;
    id v27 = objc_retainBlock(v19);
    id futureBlock = v21->_futureBlock;
    v21->_id futureBlock = v27;

    v21->_liveRequest = 0;
    unint64_t v29 = objc_alloc_init(CKKSCondition);
    liveRequestReceived = v21->_liveRequestReceived;
    v21->_liveRequestReceived = v29;

    predictedNextFireTime = v21->_predictedNextFireTime;
    v21->_predictedNextFireTime = 0;

    v21->_keepProcessAlive = a7;
    v32 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v21->_operationQueue;
    v21->_operationQueue = v32;

    v21->_operationDependencyDescriptionCode = a8;
    uint64_t v34 = [(CKKSNearFutureScheduler *)v21 makeOperationDependency];
    operationDependency = v21->_operationDependency;
    v21->_operationDependency = (CKKSResultOperation *)v34;
  }
  return v21;
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9
{
  return [(CKKSNearFutureScheduler *)self initWithName:a3 initialDelay:a4 exponentialBackoff:a6 maximumDelay:a7 keepProcessAlive:a8 dependencyDescriptionCode:0 qosClass:a5 block:a9];
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8
{
  if (a4) {
    unint64_t v8 = a5 / a4;
  }
  else {
    unint64_t v8 = 1;
  }
  if (v8 <= 1) {
    unint64_t v8 = 1;
  }
  return -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](self, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", a3, (double)v8);
}

- (CKKSNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7
{
  return [(CKKSNearFutureScheduler *)self initWithName:a3 initialDelay:a4 continuingDelay:a4 keepProcessAlive:a5 dependencyDescriptionCode:a6 block:a7];
}

@end