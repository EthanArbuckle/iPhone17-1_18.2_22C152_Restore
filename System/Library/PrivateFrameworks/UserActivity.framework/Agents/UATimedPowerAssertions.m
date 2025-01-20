@interface UATimedPowerAssertions
+ (id)statusString;
- (BOOL)active;
- (BOOL)needToCallBlock;
- (NSDate)timerExpiration;
- (NSString)name;
- (NSUUID)uuid;
- (OS_dispatch_queue)mainDispatchQ;
- (OS_dispatch_source)timerSource;
- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 activityUUID:(id)a5 queue:(id)a6 runAtCompletion:(id)a7;
- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 queue:(id)a5;
- (id)block;
- (unint64_t)nextTimer;
- (unsigned)assertion;
- (void)_releaseAssertion:(BOOL)a3;
- (void)dealloc;
- (void)releaseAssertion;
- (void)releaseAssertion:(BOOL)a3;
- (void)setBlock:(id)a3;
- (void)setNeedToCallBlock:(BOOL)a3;
- (void)setNextTimer:(unint64_t)a3;
- (void)setTimerExpiration:(id)a3;
- (void)updateTimeUntilAssertionRelease:(double)a3;
@end

@implementation UATimedPowerAssertions

- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 activityUUID:(id)a5 queue:(id)a6 runAtCompletion:(id)a7
{
  v12 = (__CFString *)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)UATimedPowerAssertions;
  v16 = [(UATimedPowerAssertions *)&v31 init];
  if (v16)
  {
    uint64_t v17 = +[NSUUID UUID];
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v19 = @"-";
    if (v12) {
      CFStringRef v20 = v12;
    }
    else {
      CFStringRef v20 = @"-";
    }
    if (v13)
    {
      v19 = [v13 description];
    }
    uint64_t v21 = +[NSString stringWithFormat:@"%@.%@", v20, v19];
    name = v16->_name;
    v16->_name = (NSString *)v21;

    if (v13) {
    objc_storeStrong((id *)&v16->_mainDispatchQ, a6);
    }
    [(UATimedPowerAssertions *)v16 setNeedToCallBlock:1];
    [(UATimedPowerAssertions *)v16 setBlock:v15];
    timerExpiration = v16->_timerExpiration;
    v16->_timerExpiration = 0;

    objc_initWeak(&location, v16);
    v24 = sub_10003B3EC();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003B440;
    block[3] = &unk_1000C56C8;
    objc_copyWeak(&v29, &location);
    v25 = v16;
    v28 = v25;
    dispatch_sync(v24, block);

    [(UATimedPowerAssertions *)v25 updateTimeUntilAssertionRelease:a4];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 queue:(id)a5
{
  return [(UATimedPowerAssertions *)self initWithName:a3 delta:0 activityUUID:a5 queue:0 runAtCompletion:a4];
}

- (void)dealloc
{
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(UATimedPowerAssertions *)self name];
    v5 = [(UATimedPowerAssertions *)self uuid];
    v6 = [v5 UUIDString];
    *(_DWORD *)buf = 138543618;
    v24 = v4;
    __int16 v25 = 2114;
    unint64_t v26 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "-dealloc for power assertion %{public}@/%{public}@", buf, 0x16u);
  }
  v7 = sub_10003B3EC();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B888;
  block[3] = &unk_1000C4CF0;
  void block[4] = self;
  dispatch_sync(v7, block);

  v8 = [(UATimedPowerAssertions *)self timerSource];

  if (v8)
  {
    v9 = [(UATimedPowerAssertions *)self timerSource];
    dispatch_source_cancel(v9);
  }
  if ([(UATimedPowerAssertions *)self needToCallBlock])
  {
    v10 = [(UATimedPowerAssertions *)self block];

    if (v10)
    {
      v11 = sub_10000BA18(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = [(UATimedPowerAssertions *)self name];
        *(_DWORD *)buf = 138543362;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Calling block with NO, in -dealloc", buf, 0xCu);
      }
      id v13 = [(UATimedPowerAssertions *)self block];
      [(UATimedPowerAssertions *)self setBlock:0];
      id v14 = [(UATimedPowerAssertions *)self mainDispatchQ];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003B8F0;
      v20[3] = &unk_1000C4E78;
      id v21 = v13;
      id v15 = v13;
      dispatch_async(v14, v20);
    }
  }
  if ([(UATimedPowerAssertions *)self assertion])
  {
    v16 = sub_10000BA18(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [(UATimedPowerAssertions *)self name];
      unsigned int v18 = [(UATimedPowerAssertions *)self assertion];
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      __int16 v25 = 2048;
      unint64_t v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Releasing assertion %ld, in -dealloc", buf, 0x16u);
    }
    IOPMAssertionRelease([(UATimedPowerAssertions *)self assertion]);
    self->_assertion = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)UATimedPowerAssertions;
  [(UATimedPowerAssertions *)&v19 dealloc];
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(UATimedPowerAssertions *)v2 assertion] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateTimeUntilAssertionRelease:(double)a3
{
  if (a3 <= 0.0)
  {
    v11 = [(UATimedPowerAssertions *)self timerSource];

    if (!v11)
    {
      if ([(UATimedPowerAssertions *)self needToCallBlock])
      {
        v12 = [(UATimedPowerAssertions *)self block];

        if (v12)
        {
          [(UATimedPowerAssertions *)self setNeedToCallBlock:0];
          id v13 = [(UATimedPowerAssertions *)self mainDispatchQ];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10003C110;
          block[3] = &unk_1000C4CF0;
          void block[4] = self;
          dispatch_async(v13, block);
        }
      }
    }
  }
  else
  {
    unint64_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v6 = self;
    objc_sync_enter(v6);
    if (v6->_timerSource)
    {
      if ([(UATimedPowerAssertions *)v6 nextTimer]
        && [(UATimedPowerAssertions *)v6 nextTimer] >= v5)
      {
        v10 = sub_10000BA18(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v28 = [(UATimedPowerAssertions *)v6 name];
          *(_DWORD *)buf = 138543874;
          v38 = v28;
          __int16 v39 = 2048;
          double v40 = a3;
          __int16 v41 = 2048;
          double v42 = (double)(v5 - [(UATimedPowerAssertions *)v6 nextTimer]) / 1000000000.0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ No need to update assertion; request for %g seconds is less than current expiration, in %.2g seconds.",
            buf,
            0x20u);
        }
      }
      else
      {
        v7 = sub_10000BA18(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v8 = [(UATimedPowerAssertions *)v6 name];
          *(_DWORD *)buf = 138543874;
          v38 = v8;
          __int16 v39 = 2048;
          double v40 = a3;
          __int16 v41 = 2048;
          double v42 = (double)(v5 - [(UATimedPowerAssertions *)v6 nextTimer]) / 1000000000.0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Rescheduling assertion for %g seconds (was %.2g seconds from now).", buf, 0x20u);
        }
        [(UATimedPowerAssertions *)v6 setNextTimer:v5];
        v9 = +[NSDate dateWithTimeIntervalSinceNow:a3];
        [(UATimedPowerAssertions *)v6 setTimerExpiration:v9];

        v10 = [(UATimedPowerAssertions *)v6 timerSource];
        dispatch_source_set_timer(v10, v5, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
      }

      [(UATimedPowerAssertions *)v6 setNeedToCallBlock:1];
    }
    else
    {
      id v14 = sub_10000BA18(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [(UATimedPowerAssertions *)v6 name];
        *(_DWORD *)buf = 138543618;
        v38 = v15;
        __int16 v39 = 2048;
        double v40 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Scheduling assertion for %g seconds.", buf, 0x16u);
      }
      v16 = sub_10003C03C();
      dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v16);
      timerSource = v6->_timerSource;
      v6->_timerSource = (OS_dispatch_source *)v17;

      objc_initWeak((id *)buf, v6);
      objc_super v19 = [(UATimedPowerAssertions *)v6 timerSource];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10003C090;
      handler[3] = &unk_1000C4EE8;
      objc_copyWeak(&v34, (id *)buf);
      dispatch_source_set_event_handler(v19, handler);

      CFStringRef v20 = +[NSDate dateWithTimeIntervalSinceNow:a3];
      [(UATimedPowerAssertions *)v6 setTimerExpiration:v20];

      id v21 = [(UATimedPowerAssertions *)v6 timerSource];
      dispatch_source_set_timer(v21, v5, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);

      v22 = [(UATimedPowerAssertions *)v6 timerSource];
      dispatch_resume(v22);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    if (!v6->_assertion)
    {
      IOPMAssertionID AssertionID = 0;
      v35[0] = @"FrameworkBundleID";
      v35[1] = @"AssertType";
      v36[0] = @"com.apple.useractivityd";
      v36[1] = @"PreventUserIdleSystemSleep";
      v35[2] = @"AssertName";
      v23 = [(UATimedPowerAssertions *)v6 name];
      v36[2] = v23;
      v35[3] = @"TimeoutSeconds";
      v24 = +[NSNumber numberWithDouble:60.0];
      v35[4] = @"TimeoutAction";
      v36[3] = v24;
      v36[4] = @"TimeoutActionTurnOff";
      CFDictionaryRef v25 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];

      IOReturn v26 = IOPMAssertionCreateWithProperties(v25, &AssertionID);
      if (v26)
      {
        v27 = sub_10000BA18(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[UATimedPowerAssertions updateTimeUntilAssertionRelease:]";
          __int16 v39 = 1024;
          LODWORD(v40) = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s, IOPMAssertionCreateWithProperties returned %x", buf, 0x12u);
        }
      }
      else
      {
        v6->_assertion = AssertionID;
        v27 = sub_10000BA18(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [(UATimedPowerAssertions *)v6 name];
          unsigned int v30 = [(UATimedPowerAssertions *)v6 assertion];
          *(_DWORD *)buf = 138543618;
          v38 = v29;
          __int16 v39 = 2048;
          *(void *)&double v40 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Power assertion /%ld created.", buf, 0x16u);
        }
      }
    }
    objc_sync_exit(v6);
  }
}

- (void)_releaseAssertion:(BOOL)a3
{
  v4 = sub_10003C03C();
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(UATimedPowerAssertions *)v5 assertion])
  {
    v6 = sub_10000BA18(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(UATimedPowerAssertions *)v5 name];
      *(_DWORD *)buf = 138543618;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = [(UATimedPowerAssertions *)v5 assertion];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Power assertion %ld released.", buf, 0x16u);
    }
    IOPMAssertionRelease(v5->_assertion);
    v5->_assertion = 0;
  }
  if ([(UATimedPowerAssertions *)v5 needToCallBlock])
  {
    v8 = [(UATimedPowerAssertions *)v5 block];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      v10 = sub_10000BA18(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [(UATimedPowerAssertions *)v5 name];
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ASSERTION: %{public}@ Updating needToCallBlock => NO", buf, 0xCu);
      }
      [(UATimedPowerAssertions *)v5 setNeedToCallBlock:0];
      [(UATimedPowerAssertions *)v5 setNextTimer:0];
      v12 = [(UATimedPowerAssertions *)v5 mainDispatchQ];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003C3B8;
      block[3] = &unk_1000C4CF0;
      void block[4] = v5;
      dispatch_async(v12, block);
    }
  }
  objc_sync_exit(v5);
}

- (void)releaseAssertion:(BOOL)a3
{
  unint64_t v5 = sub_10003C03C();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003C538;
  v6[3] = &unk_1000C57A8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (void)releaseAssertion
{
  BOOL v3 = sub_10003C03C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C5D0;
  block[3] = &unk_1000C4CF0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

+ (id)statusString
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = sub_10000F410;
  v10 = sub_10003C6D4;
  id v11 = 0;
  v2 = sub_10003B3EC();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C6DC;
  block[3] = &unk_1000C57D0;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (OS_dispatch_queue)mainDispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)needToCallBlock
{
  return self->_needToCallBlock;
}

- (void)setNeedToCallBlock:(BOOL)a3
{
  self->_needToCallBlock = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBlock:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)timerExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimerExpiration:(id)a3
{
}

- (unint64_t)nextTimer
{
  return self->_nextTimer;
}

- (void)setNextTimer:(unint64_t)a3
{
  self->_nextTimer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerExpiration, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_mainDispatchQ, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end