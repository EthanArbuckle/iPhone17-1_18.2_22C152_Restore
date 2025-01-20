@interface VMDispatchTimer
- (OS_dispatch_queue)queue;
- (double)interval;
- (id)init:(double)a3 leeway:(double)a4 queue:(id)a5 block:(id)a6;
- (void)dealloc;
@end

@implementation VMDispatchTimer

- (id)init:(double)a3 leeway:(double)a4 queue:(id)a5 block:(id)a6
{
  v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VMDispatchTimer;
  v13 = [(VMDispatchTimer *)&v20 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v13->_queue, a5);
  v14->_interval = a3;
  dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
  dispatchSource = v14->_dispatchSource;
  v14->_dispatchSource = (OS_dispatch_source *)v15;

  v17 = v14->_dispatchSource;
  if (v17)
  {
    dispatch_time_t v18 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v17, v18, (unint64_t)(a3 * 1000000000.0), (unint64_t)(a4 * 1000000000.0));
    dispatch_source_set_event_handler((dispatch_source_t)v14->_dispatchSource, v12);
    dispatch_resume((dispatch_object_t)v14->_dispatchSource);
LABEL_4:
    v17 = v14;
  }

  return v17;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_dispatchSource);
  v3.receiver = self;
  v3.super_class = (Class)VMDispatchTimer;
  [(VMDispatchTimer *)&v3 dealloc];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dispatchSource, 0);
}

@end