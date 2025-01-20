@interface _UICarPlaySessionAccessRequest
- (_UICarPlaySessionAccessRequest)initWithTimeout:(double)a3 completion:(id)a4;
- (id)completion;
- (id)timeoutHandler;
- (void)_cancelTimer;
- (void)dealloc;
- (void)setCompletion:(id)a3;
- (void)setTimeoutHandler:(id)a3;
@end

@implementation _UICarPlaySessionAccessRequest

- (_UICarPlaySessionAccessRequest)initWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UICarPlaySessionAccessRequest;
  id v7 = [(_UICarPlaySessionAccessRequest *)&v19 init];
  if (v7)
  {
    v8 = _Block_copy(v6);
    v9 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v8;

    if (a3 > 0.0)
    {
      dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      v11 = (void *)*((void *)v7 + 1);
      *((void *)v7 + 1) = v10;

      objc_initWeak(&location, v7);
      v12 = *((void *)v7 + 1);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __61___UICarPlaySessionAccessRequest_initWithTimeout_completion___block_invoke;
      v16[3] = &unk_1E52DC308;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_event_handler(v12, v16);
      v13 = *((void *)v7 + 1);
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(a3 / 10.0 * 1000000000.0));
      dispatch_activate(*((dispatch_object_t *)v7 + 1));
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return (_UICarPlaySessionAccessRequest *)v7;
}

- (void)_cancelTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)dealloc
{
  [(_UICarPlaySessionAccessRequest *)self _cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)_UICarPlaySessionAccessRequest;
  [(_UICarPlaySessionAccessRequest *)&v3 dealloc];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end