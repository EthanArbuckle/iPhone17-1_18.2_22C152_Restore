@interface DMDPowerAssertion
+ (id)assertionForOperation:(id)a3;
- (BOOL)isParked;
- (NSString)operation;
- (UMUserSwitchBlockingTask)blockingTask;
- (id)initForOperation:(id)a3;
- (void)_release;
- (void)_retain;
- (void)dealloc;
- (void)park;
- (void)setBlockingTask:(id)a3;
- (void)setIsParked:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)unpark;
@end

@implementation DMDPowerAssertion

+ (id)assertionForOperation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v9];
  }
  else
  {
    v5 = @"unknown";
  }
  id v6 = [objc_alloc((Class)a1) initForOperation:v5];

  return v6;
}

- (id)initForOperation:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMDPowerAssertion;
  id v6 = [(DMDPowerAssertion *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operation, a3);
    v8 = _assertionQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069E24;
    block[3] = &unk_1000CA508;
    v11 = v7;
    dispatch_sync(v8, block);
  }
  return v7;
}

- (void)dealloc
{
  if (!self->_isParked)
  {
    v3 = _assertionQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069ED8;
    block[3] = &unk_1000CA508;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)DMDPowerAssertion;
  [(DMDPowerAssertion *)&v4 dealloc];
}

- (void)park
{
  v3 = _assertionQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069F6C;
  block[3] = &unk_1000CA508;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)unpark
{
  v3 = _assertionQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A070;
  block[3] = &unk_1000CA508;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_retain
{
  uint64_t v3 = qword_1000FBCC0;
  if (!qword_1000FBCC0)
  {
    IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"dmd activity", 0, 0, 0, 3600.0, @"TimeoutActionTurnOff", (IOPMAssertionID *)&dword_1000FBCC8);
    uint64_t v3 = qword_1000FBCC0;
  }
  qword_1000FBCC0 = v3 + 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(DMDPowerAssertion *)self operation];
    int v10 = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning power assertion, operation: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = +[DMDUserSwitchStakeholder sharedStakeholder];
  unsigned int v6 = [v5 inEDUMode];

  if (v6)
  {
    v7 = [(DMDPowerAssertion *)self operation];
    v8 = +[UMUserSwitchBlockingTask taskWithName:@"DMDSwitchBlockingTask" reason:v7];
    [(DMDPowerAssertion *)self setBlockingTask:v8];

    uint64_t v9 = [(DMDPowerAssertion *)self blockingTask];
    [v9 begin];
  }
}

- (void)_release
{
  if (!--qword_1000FBCC0) {
    IOPMAssertionRelease(dword_1000FBCC8);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [(DMDPowerAssertion *)self operation];
    int v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending power assertion, operation: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  objc_super v4 = +[DMDUserSwitchStakeholder sharedStakeholder];
  unsigned int v5 = [v4 inEDUMode];

  if (v5)
  {
    unsigned int v6 = [(DMDPowerAssertion *)self blockingTask];
    [v6 end];
  }
}

- (BOOL)isParked
{
  return self->_isParked;
}

- (void)setIsParked:(BOOL)a3
{
  self->_isParked = a3;
}

- (NSString)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (UMUserSwitchBlockingTask)blockingTask
{
  return self->_blockingTask;
}

- (void)setBlockingTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingTask, 0);

  objc_storeStrong((id *)&self->_operation, 0);
}

@end