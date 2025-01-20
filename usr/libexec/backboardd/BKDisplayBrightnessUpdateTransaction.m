@interface BKDisplayBrightnessUpdateTransaction
+ (id)_sharedQueue;
+ (void)beginImplicitTransaction;
- (BKDisplayBrightnessUpdateTransaction)initWithIdentifier:(id)a3 transactionManager:(id)a4;
- (NSString)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_queue_invalidate;
- (void)_queue_setTimerWithTimeIntervalSinceNow:(double)a3;
- (void)_queue_updateExpirationTimeWithIntervalSinceNow:(double)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKDisplayBrightnessUpdateTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKDisplayBrightnessUpdateTransaction *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_identifier withName:@"identifier"];

  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKDisplayBrightnessUpdateTransaction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKDisplayBrightnessUpdateTransaction *)self descriptionWithMultilinePrefix:0];
}

- (void)_queue_updateExpirationTimeWithIntervalSinceNow:(double)a3
{
  BSDispatchQueueAssert();
  BSAbsoluteMachTimeNow();
  self->_expirationTime = v5 + a3;
  if (!self->_timer)
  {
    [(BKDisplayBrightnessUpdateTransaction *)self _queue_setTimerWithTimeIntervalSinceNow:a3];
  }
}

- (void)_queue_invalidate
{
  BSDispatchQueueAssert();
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BKDisplayBrightnessUpdateTransactionManager _endUpdateTransaction:](self->_transactionManager, "_endUpdateTransaction:");
    if ((BKDisplayBrightnessUpdateTransaction *)qword_1001230C8 == self)
    {
      qword_1001230C8 = 0;
    }
  }
}

- (void)_queue_setTimerWithTimeIntervalSinceNow:(double)a3
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (a3 <= 0.0)
  {
    [(BKDisplayBrightnessUpdateTransaction *)self _queue_invalidate];
  }
  else
  {
    v6 = (BSAbsoluteMachTimer *)[objc_alloc((Class)BSAbsoluteMachTimer) initWithIdentifier:@"BKDisplayBrightnessUpdateTransaction"];
    v7 = self->_timer;
    self->_timer = v6;

    v8 = self->_timer;
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100080664;
    v10[3] = &unk_1000F8198;
    v10[4] = self;
    [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:queue leewayInterval:v10 queue:a3 handler:0.0];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080740;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_invalidated == YES"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDisplayBrightnessUpdateTransactionManager.m";
      __int16 v17 = 1024;
      int v18 = 56;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000808BCLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayBrightnessUpdateTransaction;
  [(BKDisplayBrightnessUpdateTransaction *)&v8 dealloc];
}

- (BKDisplayBrightnessUpdateTransaction)initWithIdentifier:(id)a3 transactionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKDisplayBrightnessUpdateTransaction;
  objc_super v8 = [(BKDisplayBrightnessUpdateTransaction *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    uint64_t v11 = +[BKDisplayBrightnessUpdateTransaction _sharedQueue];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_transactionManager, a4);
    [v7 _beginUpdateTransaction:v8];
  }

  return v8;
}

+ (id)_sharedQueue
{
  if (qword_1001230D8 != -1) {
    dispatch_once(&qword_1001230D8, &stru_1000F8170);
  }
  v2 = (void *)qword_1001230D0;

  return v2;
}

+ (void)beginImplicitTransaction
{
  v2 = +[BKDisplayBrightnessUpdateTransaction _sharedQueue];
  dispatch_sync(v2, &stru_1000F8150);
}

@end