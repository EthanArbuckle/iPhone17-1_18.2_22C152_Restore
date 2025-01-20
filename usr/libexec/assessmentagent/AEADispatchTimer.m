@interface AEADispatchTimer
+ (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5;
- (AEADispatchTimer)initWithDuration:(double)a3 queue:(id)a4 handler:(id)a5;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (OS_dispatch_source)timerSource;
- (double)duration;
- (id)fireHandler;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setFireHandler:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)timerDidFire;
@end

@implementation AEADispatchTimer

- (void)dealloc
{
  v3 = [(AEADispatchTimer *)self timerSource];
  dispatch_source_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)AEADispatchTimer;
  [(AEADispatchTimer *)&v4 dealloc];
}

- (AEADispatchTimer)initWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AEADispatchTimer;
  v11 = [(AEADispatchTimer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_duration = a3;
    id v13 = objc_retainBlock(v10);
    id fireHandler = v12->_fireHandler;
    v12->_id fireHandler = v13;

    objc_storeStrong((id *)&v12->_targetQueue, a4);
    dispatch_queue_t v15 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;
  }
  return v12;
}

+ (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithDuration:v9 queue:v8 handler:a3];

  [v10 resume];

  return v10;
}

- (void)resume
{
  v3 = [(AEADispatchTimer *)self queue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(AEADispatchTimer *)self setTimerSource:v4];

  v5 = [(AEADispatchTimer *)self timerSource];
  [(AEADispatchTimer *)self duration];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_initWeak(&location, self);
  id v8 = [(AEADispatchTimer *)self timerSource];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1000044E8;
  id v13 = &unk_10009DEC8;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  id v9 = [(AEADispatchTimer *)self timerSource];
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)timerDidFire
{
  v3 = [(AEADispatchTimer *)self fireHandler];

  if (v3)
  {
    dispatch_block_t block = [(AEADispatchTimer *)self fireHandler];
    [(AEADispatchTimer *)self setFireHandler:0];
    dispatch_source_t v4 = [(AEADispatchTimer *)self targetQueue];
    dispatch_async(v4, block);
  }
}

- (void)cancel
{
  v3 = [(AEADispatchTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004678;
  block[3] = &unk_10009DEF0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (double)duration
{
  return self->_duration;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (id)fireHandler
{
  return self->_fireHandler;
}

- (void)setFireHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireHandler, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end