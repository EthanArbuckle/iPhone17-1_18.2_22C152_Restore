@interface NFTimer
- (NFTimer)initWithCallback:(id)a3 queue:(id)a4;
- (id)description;
- (id)initSleepTimerWithCallback:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)startTimer:(double)a3;
- (void)startTimer:(double)a3 leeway:(double)a4;
- (void)stopTimer;
@end

@implementation NFTimer

- (void)startTimer:(double)a3
{
}

- (void)stopTimer
{
  self->_popTimeInSeconds = 0;
}

- (void)startTimer:(double)a3 leeway:(double)a4
{
  dispatch_time_t v6 = dispatch_time((unint64_t)self->_monotonic << 63, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_time_to_nsec()) {
    self->_popTimeInSeconds = 0;
  }
  dispatch_source_set_timer((dispatch_source_t)self->_src, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 * 1000000000.0));
}

- (NFTimer)initWithCallback:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFTimer;
  id v8 = [(NFTimer *)&v12 init];
  if (v8)
  {
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, v7);
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v6);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    *((unsigned char *)v8 + 24) = 0;
  }

  return (NFTimer *)v8;
}

- (id)initSleepTimerWithCallback:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NFTimer;
  id v8 = [(NFTimer *)&v12 init];
  if (v8)
  {
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 2uLL, 0, v7);
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), v6);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    *((unsigned char *)v8 + 24) = 1;
  }

  return v8;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_src);
  v3.receiver = self;
  v3.super_class = (Class)NFTimer;
  [(NFTimer *)&v3 dealloc];
}

- (id)description
{
  if (self->_popTimeInSeconds) {
    v2 = (__CFString *)[NSString alloc initWithFormat:@"NFTimer: popTimeInSeconds: %llu", self->_popTimeInSeconds];
  }
  else {
    v2 = @"NFTimer: nil";
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end