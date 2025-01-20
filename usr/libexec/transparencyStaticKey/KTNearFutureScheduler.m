@interface KTNearFutureScheduler
- (BOOL)keepProcessAlive;
- (BOOL)liveRequest;
- (KTCondition)liveRequestReceived;
- (KTNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7;
- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8;
- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9;
- (KTResultOperation)operationDependency;
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
- (id)status;
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

@implementation KTNearFutureScheduler

- (KTNearFutureScheduler)initWithName:(id)a3 delay:(unint64_t)a4 keepProcessAlive:(BOOL)a5 dependencyDescriptionCode:(int64_t)a6 block:(id)a7
{
  return [(KTNearFutureScheduler *)self initWithName:a3 initialDelay:a4 continuingDelay:a4 keepProcessAlive:a5 dependencyDescriptionCode:a6 block:a7];
}

- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 continuingDelay:(unint64_t)a5 keepProcessAlive:(BOOL)a6 dependencyDescriptionCode:(int64_t)a7 block:(id)a8
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
  return -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](self, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", a3, (double)v8);
}

- (KTNearFutureScheduler)initWithName:(id)a3 initialDelay:(unint64_t)a4 exponentialBackoff:(double)a5 maximumDelay:(unint64_t)a6 keepProcessAlive:(BOOL)a7 dependencyDescriptionCode:(int64_t)a8 block:(id)a9
{
  id v17 = a3;
  id v18 = a9;
  v36.receiver = self;
  v36.super_class = (Class)KTNearFutureScheduler;
  v19 = [(KTNearFutureScheduler *)&v36 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    id v21 = +[NSString stringWithFormat:@"near-future-scheduler-%@", v17];
    v22 = (const char *)[v21 UTF8String];
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v24;

    v20->_initialDelay = a4;
    v20->_currentDelay = a4;
    v20->_maximumDelay = a6;
    v20->_backoff = a5;
    id v26 = objc_retainBlock(v18);
    id futureBlock = v20->_futureBlock;
    v20->_id futureBlock = v26;

    v20->_liveRequest = 0;
    v28 = objc_alloc_init(KTCondition);
    liveRequestReceived = v20->_liveRequestReceived;
    v20->_liveRequestReceived = v28;

    predictedNextFireTime = v20->_predictedNextFireTime;
    v20->_predictedNextFireTime = 0;

    v20->_keepProcessAlive = a7;
    v31 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v20->_operationQueue;
    v20->_operationQueue = v31;

    v20->_operationDependencyDescriptionCode = a8;
    uint64_t v33 = [(KTNearFutureScheduler *)v20 makeOperationDependency];
    operationDependency = v20->_operationDependency;
    v20->_operationDependency = (KTResultOperation *)v33;
  }
  return v20;
}

- (void)changeDelays:(unint64_t)a3 continuingDelay:(unint64_t)a4
{
  v7 = [(KTNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E324;
  block[3] = &unk_10008D928;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);
}

- (id)makeOperationDependency
{
  v3 = [(KTNearFutureScheduler *)self name];
  v4 = +[NSString stringWithFormat:@"nfs-%@", v3];
  v5 = +[KTResultOperation named:v4 withBlock:&stru_10008D948];

  [v5 setDescriptionErrorCode:-[KTNearFutureScheduler operationDependencyDescriptionCode](self, "operationDependencyDescriptionCode")];

  return v5;
}

- (id)description
{
  v3 = [(KTNearFutureScheduler *)self nextFireTime];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v5 = [(KTNearFutureScheduler *)self name];
    v6 = [v4 stringFromDate:v3];
    v7 = +[NSString stringWithFormat:@"<KTNearFutureScheduler(%@): next at %@", v5, v6];
  }
  else
  {
    id v4 = [(KTNearFutureScheduler *)self name];
    v7 = +[NSString stringWithFormat:@"<KTNearFutureScheduler(%@): no pending attempts", v4];
  }

  return v7;
}

- (NSDate)nextFireTime
{
  if ([(KTNearFutureScheduler *)self liveRequest]
    || ([(KTNearFutureScheduler *)self liveRequestReceived],
        v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 wait:50000],
        v3,
        !v4))
  {
    v5 = [(KTNearFutureScheduler *)self predictedNextFireTime];
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)waitUntil:(unint64_t)a3
{
  v5 = [(KTNearFutureScheduler *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E66C;
  v6[3] = &unk_10008D970;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)triggerAt:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v5 = [(KTNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E75C;
  block[3] = &unk_10008D998;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(v5, block);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_onqueueTimerTick
{
  v3 = [(KTNearFutureScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(KTNearFutureScheduler *)self liveRequest])
  {
    id v18 = [(KTNearFutureScheduler *)self operationDependency];
    id v4 = [(KTNearFutureScheduler *)self makeOperationDependency];
    [(KTNearFutureScheduler *)self setOperationDependency:v4];

    v5 = [(KTNearFutureScheduler *)self futureBlock];
    v5[2]();

    [(KTNearFutureScheduler *)self setLiveRequest:0];
    v6 = objc_alloc_init(KTCondition);
    [(KTNearFutureScheduler *)self setLiveRequestReceived:v6];

    [(KTNearFutureScheduler *)self setTransaction:0];
    if ([(KTNearFutureScheduler *)self currentDelay])
    {
      double v7 = (double)[(KTNearFutureScheduler *)self currentDelay];
      [(KTNearFutureScheduler *)self backoff];
      double v9 = v8 * v7;
      double v10 = (double)[(KTNearFutureScheduler *)self maximumDelay];
      if (v9 < v10) {
        double v10 = v9;
      }
      unint64_t v11 = (unint64_t)v10;
    }
    else
    {
      unint64_t v11 = [(KTNearFutureScheduler *)self maximumDelay];
    }
    [(KTNearFutureScheduler *)self setCurrentDelay:v11];
    v14 = [(KTNearFutureScheduler *)self timer];
    dispatch_time_t v15 = dispatch_walltime(0, [(KTNearFutureScheduler *)self currentDelay]);
    dispatch_source_set_timer(v14, v15, [(KTNearFutureScheduler *)self currentDelay], 0x2FAF080uLL);

    v16 = [(KTNearFutureScheduler *)self operationQueue];
    [v16 addOperation:v18];

    id v17 = +[NSDate dateWithTimeIntervalSinceNow:(double)[(KTNearFutureScheduler *)self currentDelay] / 1000000000.0];
    [(KTNearFutureScheduler *)self setPredictedNextFireTime:v17];
  }
  else
  {
    v12 = [(KTNearFutureScheduler *)self timer];
    dispatch_source_cancel(v12);

    [(KTNearFutureScheduler *)self setPredictedNextFireTime:0];
    unint64_t v13 = [(KTNearFutureScheduler *)self initialDelay];
    [(KTNearFutureScheduler *)self setCurrentDelay:v13];
  }
}

- (void)trigger
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(KTNearFutureScheduler *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EAF4;
  v4[3] = &unk_10008CAD8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_onqueueTrigger:(unint64_t)a3 maximumDelay:(unint64_t)a4
{
  double v7 = [(KTNearFutureScheduler *)self queue];
  dispatch_assert_queue_V2(v7);

  id location = 0;
  objc_initWeak(&location, self);
  if ([(KTNearFutureScheduler *)self keepProcessAlive])
  {
    double v8 = [(KTNearFutureScheduler *)self transaction];

    if (!v8)
    {
      double v9 = [(KTNearFutureScheduler *)self name];
      id v10 = +[NSString stringWithFormat:@"com.apple.transparencyd.%@", v9];
      [v10 UTF8String];
      unint64_t v11 = (void *)os_transaction_create();
      [(KTNearFutureScheduler *)self setTransaction:v11];
    }
  }
  if (a3)
  {
    v12 = [(KTNearFutureScheduler *)self predictedNextFireTime];

    if (v12)
    {
      unint64_t v13 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3 / 1000000000.0];
      v14 = [(KTNearFutureScheduler *)self predictedNextFireTime];
      id v15 = [v13 compare:v14];

      if (v15 == (id)1)
      {
        v16 = [(KTNearFutureScheduler *)self timer];
        dispatch_source_cancel(v16);

        [(KTNearFutureScheduler *)self setPredictedNextFireTime:0];
      }
    }
  }
  if (a4 != -1)
  {
    id v17 = [(KTNearFutureScheduler *)self predictedNextFireTime];

    if (v17)
    {
      id v18 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3 / 1000000000.0];
      v19 = [(KTNearFutureScheduler *)self predictedNextFireTime];
      id v20 = [v18 compare:v19];

      if (v20 != (id)1)
      {
        id v21 = [(KTNearFutureScheduler *)self timer];
        dispatch_source_cancel(v21);

        [(KTNearFutureScheduler *)self setPredictedNextFireTime:0];
      }
    }
  }
  v22 = [(KTNearFutureScheduler *)self timer];
  if (!v22
    || ([(KTNearFutureScheduler *)self timer],
        v23 = objc_claimAutoreleasedReturnValue(),
        intptr_t v24 = dispatch_source_testcancel(v23),
        v23,
        v22,
        v24))
  {
    v25 = [(KTNearFutureScheduler *)self queue];
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v25);
    [(KTNearFutureScheduler *)self setTimer:v26];

    v27 = [(KTNearFutureScheduler *)self timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001EF50;
    handler[3] = &unk_10008CAD8;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v27, handler);

    unint64_t v28 = [(KTNearFutureScheduler *)self currentDelay];
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
    v32 = [(KTNearFutureScheduler *)self timer];
    dispatch_time_t v33 = dispatch_walltime(0, v31);
    dispatch_source_set_timer(v32, v33, [(KTNearFutureScheduler *)self currentDelay], 0x2FAF080uLL);

    v34 = [(KTNearFutureScheduler *)self timer];
    dispatch_resume(v34);

    v35 = +[NSDate dateWithTimeIntervalSinceNow:(double)(unint64_t)v31 / 1000000000.0];
    [(KTNearFutureScheduler *)self setPredictedNextFireTime:v35];

    objc_destroyWeak(&v37);
  }
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = [(KTNearFutureScheduler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F018;
  block[3] = &unk_10008CE40;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)status
{
  CFStringRef v10 = @"currentDelay";
  v3 = +[NSNumber numberWithUnsignedLongLong:[(KTNearFutureScheduler *)self currentDelay] / 0x3B9ACA00];
  unint64_t v11 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v5 = [v4 mutableCopy];

  v6 = [(KTNearFutureScheduler *)self predictedNextFireTime];

  if (v6)
  {
    double v7 = [(KTNearFutureScheduler *)self predictedNextFireTime];
    [v7 timeIntervalSinceNow];
    double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v8 forKeyedSubscript:@"nextFire"];
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (id)futureBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFutureBlock:(id)a3
{
}

- (KTResultOperation)operationDependency
{
  return (KTResultOperation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperationDependency:(id)a3
{
}

- (KTCondition)liveRequestReceived
{
  return (KTCondition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLiveRequestReceived:(id)a3
{
}

- (unint64_t)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(unint64_t)a3
{
  self->_initialDelay = a3;
}

- (unint64_t)currentDelay
{
  return self->_currentDelay;
}

- (void)setCurrentDelay:(unint64_t)a3
{
  self->_currentDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (double)backoff
{
  return self->_backoff;
}

- (void)setBackoff:(double)a3
{
  self->_backoff = a3;
}

- (int64_t)operationDependencyDescriptionCode
{
  return self->_operationDependencyDescriptionCode;
}

- (void)setOperationDependencyDescriptionCode:(int64_t)a3
{
  self->_operationDependencyDescriptionCode = a3;
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSDate)predictedNextFireTime
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPredictedNextFireTime:(id)a3
{
}

- (BOOL)liveRequest
{
  return self->_liveRequest;
}

- (void)setLiveRequest:(BOOL)a3
{
  self->_liveRequest = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)keepProcessAlive
{
  return self->_keepProcessAlive;
}

- (void)setKeepProcessAlive:(BOOL)a3
{
  self->_keepProcessAlive = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_predictedNextFireTime, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_liveRequestReceived, 0);
  objc_storeStrong((id *)&self->_operationDependency, 0);
  objc_storeStrong(&self->_futureBlock, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end