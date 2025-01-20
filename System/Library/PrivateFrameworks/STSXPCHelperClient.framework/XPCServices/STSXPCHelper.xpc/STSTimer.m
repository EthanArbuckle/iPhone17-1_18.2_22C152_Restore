@interface STSTimer
- (BOOL)monotonic;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)src;
- (STSTimer)initWithCallback:(id)a3 queue:(id)a4;
- (id)description;
- (id)initSleepTimerWithCallback:(id)a3 queue:(id)a4;
- (unint64_t)popTimeInSeconds;
- (void)dealloc;
- (void)setMonotonic:(BOOL)a3;
- (void)setPopTimeInSeconds:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSrc:(id)a3;
- (void)startTimer:(double)a3;
- (void)startTimer:(double)a3 leeway:(double)a4;
- (void)stopTimer;
@end

@implementation STSTimer

- (STSTimer)initWithCallback:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STSTimer;
  v8 = [(STSTimer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 1uLL, 0, v7);
    src = v9->_src;
    v9->_src = (OS_dispatch_source *)v10;

    dispatch_source_set_event_handler((dispatch_source_t)v9->_src, v6);
    dispatch_activate((dispatch_object_t)v9->_src);
    v9->_monotonic = 0;
  }

  return v9;
}

- (id)initSleepTimerWithCallback:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STSTimer;
  v8 = [(STSTimer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 2uLL, 0, v7);
    src = v9->_src;
    v9->_src = (OS_dispatch_source *)v10;

    dispatch_source_set_event_handler((dispatch_source_t)v9->_src, v6);
    dispatch_activate((dispatch_object_t)v9->_src);
    v9->_monotonic = 1;
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(STSTimer *)self src];
  dispatch_source_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)STSTimer;
  [(STSTimer *)&v4 dealloc];
}

- (void)startTimer:(double)a3
{
}

- (void)startTimer:(double)a3 leeway:(double)a4
{
  if ([(STSTimer *)self monotonic]) {
    dispatch_time_t v7 = 0x8000000000000000;
  }
  else {
    dispatch_time_t v7 = 0;
  }
  dispatch_time_t v8 = dispatch_time(v7, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_time_to_nsec()) {
    -[STSTimer setPopTimeInSeconds:](self, "setPopTimeInSeconds:", 0, 2);
  }
  dispatch_source_set_timer((dispatch_source_t)self->_src, v8, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
}

- (void)stopTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_src, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  [(STSTimer *)self setPopTimeInSeconds:0];
}

- (id)description
{
  if ([(STSTimer *)self popTimeInSeconds])
  {
    v3 = +[NSString stringWithFormat:@"STSTimer: popTimeInSeconds: %llu", self->_popTimeInSeconds];
  }
  else
  {
    v3 = @"STSTimer: nil";
  }

  return v3;
}

- (OS_dispatch_source)src
{
  return self->_src;
}

- (void)setSrc:(id)a3
{
}

- (unint64_t)popTimeInSeconds
{
  return self->_popTimeInSeconds;
}

- (void)setPopTimeInSeconds:(unint64_t)a3
{
  self->_popTimeInSeconds = a3;
}

- (BOOL)monotonic
{
  return self->_monotonic;
}

- (void)setMonotonic:(BOOL)a3
{
  self->_monotonic = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_src, 0);
}

@end