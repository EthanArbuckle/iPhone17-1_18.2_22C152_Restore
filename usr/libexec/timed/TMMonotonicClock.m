@interface TMMonotonicClock
- (BOOL)isMachTimeValid:(unint64_t)a3;
- (OS_dispatch_queue)workQ;
- (TMMonotonicClock)init;
- (TMMonotonicClock)initWithSyncInterval:(double)a3;
- (double)coarseMonotonicTime;
- (unint64_t)lastWake;
- (void)dealloc;
- (void)montonicTimeForMachTime:(unint64_t)a3 toQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)setWorkQ:(id)a3;
@end

@implementation TMMonotonicClock

- (TMMonotonicClock)init
{
  return 0;
}

- (TMMonotonicClock)initWithSyncInterval:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TMMonotonicClock;
  v4 = [(TMMonotonicClock *)&v8 init];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = [+[NSString stringWithFormat:@"%@.%llx", NSStringFromClass(v5), v4] UTF8String];
    v4->_workQ = (OS_dispatch_queue *)dispatch_queue_create(v6, 0);
    v4->_lastCoarseMonotonicTimeMachTime = [(TMMonotonicClock *)v4 machTime];
    v4->_syncInterval = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TMMonotonicClock;
  [(TMMonotonicClock *)&v3 dealloc];
}

- (void)montonicTimeForMachTime:(unint64_t)a3 toQueue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v10 = mach_absolute_time();
  if (v10 < a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMMonotonicClock.m", 63, @"%lld < %lld", a3, v10 object file lineNumber description];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010BCC;
  block[3] = &unk_100029200;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  block[7] = a3;
  dispatch_async((dispatch_queue_t)[(TMMonotonicClock *)self workQ], block);
}

- (double)coarseMonotonicTime
{
  unint64_t v3 = [(TMMonotonicClock *)self machTime];
  double v4 = sub_100005CFC(0, 0);
  double v5 = sub_1000065F8(self->_lastCoarseMonotonicTimeMachTime, v3);
  double v6 = v4 - self->_lastCoarseMonotonicTime;
  double v7 = sub_100005990();
  if (v6 >= v7 * -0.5)
  {
    if (v5 > v7 + v7 && v6 < v7 * 0.5)
    {
      uint64_t v14 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
      {
        double lastCoarseMonotonicTime = self->_lastCoarseMonotonicTime;
        int v17 = 134219008;
        double v18 = v4;
        __int16 v19 = 2048;
        double v20 = lastCoarseMonotonicTime;
        __int16 v21 = 2048;
        double v22 = v6;
        __int16 v23 = 2048;
        double v24 = v5;
        __int16 v25 = 2048;
        double v26 = v7;
        uint64_t v10 = "PMU RTC appears stalled: %f - %f = %f; mach advanced by %f; resolution %f";
        v11 = v14;
        uint32_t v12 = 52;
        goto LABEL_12;
      }
    }
  }
  else
  {
    uint64_t v8 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      double v9 = self->_lastCoarseMonotonicTime;
      int v17 = 134218752;
      double v18 = v4;
      __int16 v19 = 2048;
      double v20 = v9;
      __int16 v21 = 2048;
      double v22 = v6;
      __int16 v23 = 2048;
      double v24 = v7;
      uint64_t v10 = "PMU RTC went backward: %f - %f = %f; resolution %f";
      v11 = v8;
      uint32_t v12 = 42;
LABEL_12:
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v17, v12);
    }
  }
  self->_double lastCoarseMonotonicTime = v4;
  self->_lastCoarseMonotonicTimeMachTime = v3;
  return v4;
}

- (unint64_t)lastWake
{
  if (qword_1000338E8 != -1) {
    dispatch_once(&qword_1000338E8, &stru_100029220);
  }
  size_t v7 = 8;
  unint64_t v8 = 0;
  if (sysctl((int *)&unk_1000338D8, qword_1000338E0, &v8, &v7, 0, 0))
  {
    unint64_t v3 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B54C(v3);
    }
    unint64_t v4 = -1;
    unint64_t v8 = -1;
  }
  else
  {
    unint64_t v4 = v8;
  }
  if (self->_lastWake != v4)
  {
    self->_lastWake = v4;
    double v5 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cmd,lastWake,mach,%llu", buf, 0xCu);
    }
    AnalyticsSendEventLazy();
    return v8;
  }
  return v4;
}

- (BOOL)isMachTimeValid:(unint64_t)a3
{
  return [(TMMonotonicClock *)self lastWake] < a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
}

@end