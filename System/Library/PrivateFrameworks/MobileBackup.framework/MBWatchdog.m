@interface MBWatchdog
- (MBWatchdog)init;
- (MBWatchdog)initWithName:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (double)timeout;
- (id)timeoutBlock;
- (void)_cancelTimer;
- (void)_invokeTimeoutBlock;
- (void)_scheduleTimer;
- (void)resume;
- (void)setQueue:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setTimer:(id)a3;
- (void)suspend;
@end

@implementation MBWatchdog

- (MBWatchdog)initWithName:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBWatchdog initWithName:]", "MBWatchdog.m", 24, "name");
  }
  v5 = v4;
  v19.receiver = self;
  v19.super_class = (Class)MBWatchdog;
  v6 = [(MBWatchdog *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_timeout = 30.0;
    v8 = (const char *)[v5 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v7->_queue);
    timer = v7->_timer;
    v7->_timer = (OS_dispatch_source *)v12;

    dispatch_source_set_timer((dispatch_source_t)v7->_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, v7);
    v14 = v7->_timer;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001A64C0;
    v16[3] = &unk_100413770;
    objc_copyWeak(&v17, &location);
    dispatch_source_set_event_handler(v14, v16);
    dispatch_resume((dispatch_object_t)v7->_timer);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (MBWatchdog)init
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(MBWatchdog *)self initWithName:v4];

  return v5;
}

- (void)suspend
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A6668;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resume
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A66F4;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_cancelTimer
{
}

- (void)_invokeTimeoutBlock
{
  id v2 = objc_retainBlock(self->_timeoutBlock);
  if (v2)
  {
    v3 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A67C0;
    block[3] = &unk_100411B88;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

- (void)_scheduleTimer
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  timer = self->_timer;
  dispatch_source_set_timer(timer, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
}

@end