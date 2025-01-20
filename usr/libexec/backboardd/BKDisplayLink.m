@interface BKDisplayLink
- (BKDisplayLink)initWithDisplayLinkClass:(Class)a3 display:(id)a4 target:(id)a5 action:(SEL)a6;
- (BOOL)isPaused;
- (NSString)displayUUID;
- (void)_thread_displayLinkFired;
- (void)_thread_invalidate;
- (void)_thread_setPaused:(id)a3;
- (void)_thread_startRunLoop;
- (void)dealloc;
- (void)invalidate;
- (void)setDisplayUUID:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation BKDisplayLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_thread_displayLink, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong(&self->_target, 0);

  objc_storeStrong((id *)&self->_display, 0);
}

- (void)setDisplayUUID:(id)a3
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)_thread_startRunLoop
{
  sched_param v11 = (sched_param)63;
  v3 = pthread_self();
  int v4 = pthread_setschedparam(v3, 2, &v11);
  if (v4)
  {
    int v5 = v4;
    v6 = BKLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cannot set event router thread priority (error %d)", buf, 8u);
    }
  }
  v7 = +[NSRunLoop currentRunLoop];
  runLoop = self->_runLoop;
  self->_runLoop = v7;

  v9 = [(objc_class *)self->_displayLinkClass displayLinkWithDisplay:self->_display target:self selector:"_thread_displayLinkFired"];
  thread_displayLink = self->_thread_displayLink;
  self->_thread_displayLink = v9;

  [(CADisplayLink *)self->_thread_displayLink addToRunLoop:self->_runLoop forMode:NSRunLoopCommonModes];
  CFRunLoopRun();
}

- (void)_thread_displayLinkFired
{
  if (!self->_thread_invalid)
  {
    action = self->_action;
    id target = self->_target;
    if (action) {
      [target action];
    }
    else {
      [target 0];
    }
  }
}

- (void)_thread_invalidate
{
  BOOL thread_invalid = self->_thread_invalid;
  int v4 = BKLogMousePointer();
  int v5 = v4;
  if (thread_invalid)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      v10 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "BKDisplayLink %p _thread_invalidate already invalid", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p _thread_invalidate", (uint8_t *)&v9, 0xCu);
    }

    self->_BOOL thread_invalid = 1;
    [(CADisplayLink *)self->_thread_displayLink invalidate];
    thread_displayLink = self->_thread_displayLink;
    self->_thread_displayLink = 0;

    display = self->_display;
    self->_display = 0;

    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    CFRunLoopWakeUp(Current);
  }
}

- (void)_thread_setPaused:(id)a3
{
  thread_displayLink = self->_thread_displayLink;
  id v4 = [a3 BOOLValue];

  [(CADisplayLink *)thread_displayLink setPaused:v4];
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  thread = self->_thread;
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(BKDisplayLink *)self performSelector:"_thread_setPaused:" onThread:thread withObject:v5 waitUntilDone:0];
}

- (void)invalidate
{
  v3 = BKLogMousePointer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p invalidate start ", (uint8_t *)&v5, 0xCu);
  }

  [(BKDisplayLink *)self performSelector:"_thread_invalidate" onThread:self->_thread withObject:0 waitUntilDone:0];
  id v4 = BKLogMousePointer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKDisplayLink %p invalidate finish", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  if (!self->_thread_invalid)
  {
    id v4 = +[NSString stringWithFormat:@"must -invalidate before dealloc"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDisplayLink.m";
      __int16 v17 = 1024;
      int v18 = 55;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10001CD54);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayLink;
  [(BKDisplayLink *)&v8 dealloc];
}

- (BKDisplayLink)initWithDisplayLinkClass:(Class)a3 display:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BKDisplayLink;
  __int16 v13 = [(BKDisplayLink *)&v30 init];
  v14 = v13;
  if (v13)
  {
    v13->_displayLinkClass = a3;
    objc_storeStrong((id *)&v13->_display, a4);
    id v15 = [(CADisplay *)v14->_display uniqueId];
    id v16 = [v15 length];
    __int16 v17 = (void *)BKSDisplayUUIDMainKey;
    if (v16) {
      __int16 v17 = v15;
    }
    int v18 = v17;

    displayUUID = v14->_displayUUID;
    v14->_displayUUID = v18;

    objc_storeStrong(&v14->_target, a5);
    if (a6) {
      SEL v20 = a6;
    }
    else {
      SEL v20 = 0;
    }
    v14->_action = v20;
    v21 = BKLogMousePointer();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v14->_displayUUID;
      *(_DWORD *)buf = 134218242;
      v33 = v14;
      __int16 v34 = 2114;
      v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BKDisplayLink init %p %{public}@", buf, 0x16u);
    }

    v23 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v14 selector:"_thread_startRunLoop" object:0];
    thread = v14->_thread;
    v14->_thread = v23;

    [(NSThread *)v14->_thread start];
    v25 = [(id)objc_opt_class() description];
    v26 = +[NSString stringWithFormat:@"%@ BKDisplayLink:%p for %@", v25, v14, v14->_displayUUID];

    [(NSThread *)v14->_thread setName:v26];
    v27 = v14->_thread;
    NSRunLoopMode v31 = NSRunLoopCommonModes;
    v28 = +[NSArray arrayWithObjects:&v31 count:1];
    [(BKDisplayLink *)v14 performSelector:"description" onThread:v27 withObject:0 waitUntilDone:0 modes:v28];
  }
  return v14;
}

@end