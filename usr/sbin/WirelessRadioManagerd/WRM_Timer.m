@interface WRM_Timer
+ (unint64_t)getTimeStamp;
- (BOOL)isValid;
- (WRM_Timer)initWithFireTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation WRM_Timer

- (WRM_Timer)initWithFireTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"WRM_Timer.m", 12, @"Invalid parameter not satisfying: %@", @"queue != NULL" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)WRM_Timer;
  id v10 = [(WRM_Timer *)&v16 init];
  if (v10)
  {
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a4);
    *((void *)v10 + 1) = v11;
    if (!v11)
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v10 file:@"WRM_Timer.m" lineNumber:17 description:@"Cannot create dispatch timer"];
      v11 = *((void *)v10 + 1);
    }
    dispatch_time_t v12 = dispatch_walltime(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v13 = *((void *)v10 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006E91C;
    handler[3] = &unk_10020ED58;
    handler[4] = v10;
    handler[5] = a5;
    dispatch_source_set_event_handler(v13, handler);
    *((_DWORD *)v10 + 4) = 1;
    dispatch_resume(*((dispatch_object_t *)v10 + 1));
  }
  return (WRM_Timer *)v10;
}

- (void)dealloc
{
  [(WRM_Timer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WRM_Timer;
  [(WRM_Timer *)&v3 dealloc];
}

- (BOOL)isValid
{
  return self->_valid != 0;
}

- (void)invalidate
{
  int v3 = 1;
  atomic_compare_exchange_strong_explicit(&self->_valid, (unsigned int *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
  if (v3 == 1) {
    dispatch_source_cancel((dispatch_source_t)self->_source);
  }
  source = self->_source;
  if (source)
  {
    dispatch_release(source);
    self->_source = 0;
  }
}

+ (unint64_t)getTimeStamp
{
  v3.tv_sec = 0;
  *(void *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return 1000 * v3.tv_sec + v3.tv_usec / 0x3E8uLL;
}

@end