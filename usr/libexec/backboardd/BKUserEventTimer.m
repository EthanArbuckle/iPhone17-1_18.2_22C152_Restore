@interface BKUserEventTimer
+ (id)sharedInstance;
- (BKUserEventTimer)init;
- (BOOL)isSafeToResetIdleTimer;
- (double)lastUserEventTime;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_queue_clearTimer;
- (void)_queue_postNotification:(__CFString *)a3;
- (void)_queue_scheduleTimerWithTimeInterval:(double)a3;
- (void)_queue_userEventOccurredInIdleMode;
- (void)_queue_userEventOccurredInPresenceMode;
- (void)dealloc;
- (void)notifyOnNextUserEvent;
- (void)resetTimer:(double)a3 mode:(int)a4;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)userEventOccurredOnDisplay:(id)a3;
@end

@implementation BKUserEventTimer

- (void)userEventOccurredOnDisplay:(id)a3
{
  if (!a3)
  {
    v8[8] = v3;
    v8[9] = v4;
    CFTimeInterval v6 = CACurrentMediaTime();
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A86C;
    v8[3] = &unk_1000F8C30;
    v8[4] = self;
    *(CFTimeInterval *)&v8[5] = v6;
    dispatch_async(queue, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)_queue_clearTimer
{
  [(BSTimer *)self->_timer cancel];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_queue_scheduleTimerWithTimeInterval:(double)a3
{
  BSDispatchQueueAssert();
  [(BKUserEventTimer *)self _queue_clearTimer];
  if (BKSHIDServicesUserEventTimerIntervalForever == a3)
  {
    v5 = sub_10005FCE8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling timer because scheduled interval exceeds 'forever' threshold", buf, 2u);
    }
  }
  else
  {
    id v6 = objc_alloc((Class)BSTimer);
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100050FEC;
    v10[3] = &unk_1000F8C30;
    *(double *)&v10[5] = a3;
    v10[4] = self;
    v8 = (BSTimer *)[v6 initWithFireInterval:queue queue:v10 handler:a3];
    timer = self->_timer;
    self->_timer = v8;

    [(BSTimer *)self->_timer schedule];
  }
}

- (void)_queue_userEventOccurredInPresenceMode
{
  BSDispatchQueueAssert();
  if (self->_timer && self->_isIdle)
  {
    self->_isIdle = 0;
    uint64_t v3 = kBKSHIDServicesUserEventPresent;
    [(BKUserEventTimer *)self _queue_postNotification:v3];
  }
}

- (void)_queue_userEventOccurredInIdleMode
{
  BSDispatchQueueAssert();
  if (self->_isIdle)
  {
    self->_isIdle = 0;
    uint64_t v3 = kBKSHIDServicesUserEventUnIdled;
    [(BKUserEventTimer *)self _queue_postNotification:v3];
  }
}

- (void)_queue_postNotification:(__CFString *)a3
{
  BSDispatchQueueAssert();
  uint64_t v4 = sub_10005FCE8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "postNotification: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0, 0, 1u);
}

- (BOOL)isSafeToResetIdleTimer
{
  return self->_safeToResetIdleTimer;
}

- (void)notifyOnNextUserEvent
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005136C;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetTimer:(double)a3 mode:(int)a4
{
  if (BKSHIDServicesUserEventTimerIntervalForever <= a3 || a4 == 0 || a3 < 0.0) {
    double v8 = BKSHIDServicesUserEventTimerIntervalForever;
  }
  else {
    double v8 = a3;
  }
  CFTimeInterval v9 = CACurrentMediaTime();
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051430;
  v11[3] = &unk_1000F72D0;
  int v12 = a4;
  v11[4] = self;
  *(double *)&v11[5] = v8;
  *(CFTimeInterval *)&v11[6] = v9;
  dispatch_async(queue, v11);
}

- (double)lastUserEventTime
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005166C;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000516F4;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(BKUserEventTimer *)self succinctDescriptionBuilder];
  v5 = NSStringFromBKSHIDServicesUserEventTimerMode();
  id v6 = [v4 appendObject:v5 withName:@"currentMode"];

  id v7 = [v4 appendTimeInterval:@"currentTimeout" withName:0 decomposeUnits:self->_currentTimeout];
  id v8 = [v4 appendTimeInterval:@"lastUserEventTime" withName:0 decomposeUnits:self->_lastUserEvent];
  id v9 = [v4 appendTimeInterval:@"lastResetTimerRequestTime" withName:0 decomposeUnits:self->_lastResetTimerRequest];
  id v10 = [v4 appendBool:self->_isIdle withName:@"_isIdle"];
  id v11 = [v4 appendBool:self->_shouldNotify withName:@"_shouldNotify"];
  id v12 = [v4 appendBool:self->_safeToResetIdleTimer withName:@"_safeToResetIdleTimer"];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(BKUserEventTimer *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKUserEventTimer *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BKUserEventTimer.m" lineNumber:88 description:@"this object should never deallocate"];

  v5.receiver = self;
  v5.super_class = (Class)BKUserEventTimer;
  [(BKUserEventTimer *)&v5 dealloc];
}

- (BKUserEventTimer)init
{
  v19.receiver = self;
  v19.super_class = (Class)BKUserEventTimer;
  v2 = [(BKUserEventTimer *)&v19 init];
  double v3 = v2;
  if (v2)
  {
    *(void *)&v2->_currentTimeout = BKSHIDServicesUserEventTimerIntervalForever;
    v2->_currentMode = 0;
    v2->_lastUserEvent = CACurrentMediaTime();
    v3->_lastResetTimerRequest = CACurrentMediaTime();
    v3->_isIdle = 1;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    id v6 = +[BKSystemShellSentinel sharedInstance];
    id v7 = [v6 systemShellState];

    if (v7)
    {
      id v8 = v7[2];
      if (v8)
      {
        id v9 = v7[4];
        v3->_safeToResetIdleTimer = [v9 containsObject:v8];
      }
    }
    else
    {
      id v8 = 0;
    }
    id v10 = +[BKSystemShellSentinel sharedInstance];
    uint64_t v11 = [v10 addSystemShellObserver:v3 reason:@"BKUserEventTimer"];
    systemShellObserving = v3->_systemShellObserving;
    v3->_systemShellObserving = (BSInvalidatable *)v11;

    objc_initWeak(&location, v3);
    id v13 = &_dispatch_main_q;
    objc_copyWeak(&v17, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureAssertion = v3->_stateCaptureAssertion;
    v3->_stateCaptureAssertion = (BSInvalidatable *)v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100122F10 != -1) {
    dispatch_once(&qword_100122F10, &stru_1000F6DF8);
  }
  v2 = (void *)qword_100122F08;

  return v2;
}

@end