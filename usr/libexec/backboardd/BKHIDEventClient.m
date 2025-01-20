@interface BKHIDEventClient
- (BKHIDEventClient)init;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5 processName:(id)a6;
- (BKHIDEventClientDelegate)delegate;
- (BOOL)_deathByPid;
- (BOOL)_deathBySendRight;
- (BOOL)isTerminating;
- (BSMachPortSendRight)sendRight;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (void)_queue_invalidate;
- (void)_queue_performDelegateCallout:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setTerminating:(BOOL)a3;
@end

@implementation BKHIDEventClient

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AEC4;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = BSProcessDescriptionForPID();
  v11 = [(BKHIDEventClient *)self initWithPid:v6 sendRight:v9 queue:v8 processName:v10];

  return v11;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5 processName:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v38.receiver = self;
  v38.super_class = (Class)BKHIDEventClient;
  v14 = [(BKHIDEventClient *)&v38 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    if (!v15->_queue)
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = +[NSString stringWithFormat:@"<%@: (pid: %d) %p>", v17, v15->_queue_pid, v15];
      uint64_t Serial = BSDispatchQueueCreateSerial();
      queue = v15->_queue;
      v15->_queue = (OS_dispatch_queue *)Serial;
    }
    v15->_uint64_t queue_pid = a3;
    objc_storeStrong((id *)&v15->_queue_sendRight, a4);
    if (a3 >= 1)
    {
      v21 = (NSString *)[v13 copy];
      queue_procName = v15->_queue_procName;
      v15->_queue_procName = v21;
    }
    if ([(BKHIDEventClient *)v15 _deathByPid])
    {
      id v23 = objc_alloc((Class)BSProcessDeathWatcher);
      uint64_t queue_pid = v15->_queue_pid;
      v25 = v15->_queue;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000235C4;
      v36[3] = &unk_1000F8E78;
      v26 = (id *)&v37;
      v27 = v15;
      v37 = v27;
      v28 = (BSProcessDeathWatcher *)[v23 initWithPID:queue_pid queue:v25 deathHandler:v36];
      queue_pidWatcher = v27->_queue_pidWatcher;
      v27->_queue_pidWatcher = v28;

LABEL_10:
      goto LABEL_11;
    }
    if ([(BKHIDEventClient *)v15 _deathBySendRight])
    {
      v30 = (BSPortDeathSentinel *)[objc_alloc((Class)BSPortDeathSentinel) initWithSendRight:v15->_queue_sendRight];
      queue_portSentinel = v15->_queue_portSentinel;
      v15->_queue_portSentinel = v30;

      [(BSPortDeathSentinel *)v15->_queue_portSentinel setQueue:v15->_queue];
      v32 = v15->_queue_portSentinel;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000236D0;
      v34[3] = &unk_1000F8E78;
      v26 = (id *)&v35;
      v35 = v15;
      [(BSPortDeathSentinel *)v32 activateWithHandler:v34];
      goto LABEL_10;
    }
  }
LABEL_11:

  return v15;
}

- (BSMachPortSendRight)sendRight
{
  return self->_queue_sendRight;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4
{
  return [(BKHIDEventClient *)self initWithPid:*(void *)&a3 sendRight:a4 queue:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_procName, 0);
  objc_storeStrong((id *)&self->_queue_portSentinel, 0);
  objc_storeStrong((id *)&self->_queue_pidWatcher, 0);
  objc_storeStrong((id *)&self->_queue_sendRight, 0);
  objc_storeStrong((id *)&self->_queue_delegate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (int)pid
{
  return self->_queue_pid;
}

- (void)_queue_performDelegateCallout:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022DB8;
  v7[3] = &unk_1000F7FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_queue_invalidate
{
  if (!self->_queue_invalidated)
  {
    self->_queue_invalidated = 1;
    queue_delegate = self->_queue_delegate;
    self->_queue_delegate = 0;

    [(BSProcessDeathWatcher *)self->_queue_pidWatcher invalidate];
    queue_pidWatcher = self->_queue_pidWatcher;
    self->_queue_pidWatcher = 0;

    [(BSPortDeathSentinel *)self->_queue_portSentinel invalidate];
    queue_portSentinel = self->_queue_portSentinel;
    self->_queue_portSentinel = 0;
  }
}

- (BOOL)_deathBySendRight
{
  return 0;
}

- (BOOL)_deathByPid
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKHIDEventClient *)self succinctDescriptionBuilder];
  v5 = v4;
  queue_procName = self->_queue_procName;
  if (queue_procName) {
    id v7 = [v4 appendObject:queue_procName withName:@"name"];
  }
  else {
    id v8 = [v4 appendInt:self->_queue_pid withName:@"pid"];
  }
  queue_sendRight = self->_queue_sendRight;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022F90;
  v12[3] = &unk_1000F5CE8;
  id v10 = v5;
  id v13 = v10;
  [(BSMachPortSendRight *)queue_sendRight accessPort:v12];

  return v10;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKHIDEventClient *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKHIDEventClient *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKHIDEventClient *)self descriptionWithMultilinePrefix:0];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002312C;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BKHIDEventClientDelegate)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100023224;
  id v10 = sub_100023234;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002323C;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKHIDEventClientDelegate *)v3;
}

- (void)dealloc
{
  if (!self->_queue_invalidated)
  {
    id v7 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_queue_invalidated"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      v18 = self;
      LOWORD(v19) = 2114;
      *(void *)((char *)&v19 + 2) = @"BKHIDEventClient.m";
      WORD5(v19) = 1024;
      HIDWORD(v19) = 79;
      __int16 v20 = 2114;
      v21 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100023554);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v18 = (BKHIDEventClient *)sub_100023224;
  *(void *)&long long v19 = sub_100023234;
  id v3 = self->_queue;
  *((void *)&v19 + 1) = v3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100023224;
  v15[4] = sub_100023234;
  v16 = self->_queue_sendRight;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100023224;
  v13[4] = sub_100023234;
  v14 = self->_queue_procName;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002355C;
  block[3] = &unk_1000F5CC0;
  block[4] = buf;
  void block[5] = v15;
  block[6] = v13;
  dispatch_async((dispatch_queue_t)v3, block);
  queue = self->_queue;
  self->_queue = 0;

  queue_delegate = self->_queue_delegate;
  self->_queue_delegate = 0;

  self->_uint64_t queue_pid = -1;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(buf, 8);

  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventClient;
  [(BKHIDEventClient *)&v11 dealloc];
}

- (BKHIDEventClient)init
{
  id v4 = +[NSString stringWithFormat:@"use initWithPid:..."];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKHIDEventClient.m";
    __int16 v17 = 1024;
    int v18 = 29;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKHIDEventClient *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end