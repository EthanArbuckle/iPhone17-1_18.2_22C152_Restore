@interface DispatchTimer
- (BOOL)isInvalidated;
- (BOOL)isWaking;
- (DispatchTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerQueue:(id)a6 handlerBlock:(id)a7;
- (NSString)identifier;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_source)timerSource;
- (double)delay;
- (double)gracePeriod;
- (id)handlerBlock;
- (void)dealloc;
- (void)fireTimer;
- (void)invalidate;
- (void)scheduleTimer;
- (void)setDelay:(double)a3;
- (void)setGracePeriod:(double)a3;
- (void)setHandlerBlock:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation DispatchTimer

- (DispatchTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerQueue:(id)a6 handlerBlock:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)DispatchTimer;
  v16 = [(DispatchTimer *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_delay = a4;
    v17->_gracePeriod = a5;
    objc_storeStrong((id *)&v17->_handlerQueue, a6);
    id v18 = objc_retainBlock(v15);
    id handlerBlock = v17->_handlerBlock;
    v17->_id handlerBlock = v18;

    [(DispatchTimer *)v17 scheduleTimer];
  }

  return v17;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(DispatchTimer *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)DispatchTimer;
  [(DispatchTimer *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    timerSource = self->_timerSource;
    if (timerSource)
    {
      dispatch_source_cancel(timerSource);
      v4 = self->_timerSource;
      self->_timerSource = 0;
    }
    id handlerBlock = self->_handlerBlock;
    self->_id handlerBlock = 0;

    handlerQueue = self->_handlerQueue;
    self->_handlerQueue = 0;
  }
}

- (BOOL)isWaking
{
  return 0;
}

- (void)scheduleTimer
{
  objc_super v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_handlerQueue);
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009F090;
  v7[3] = &unk_100165E68;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v3, v7);
  timerSource = self->_timerSource;
  self->_timerSource = (OS_dispatch_source *)v3;
  v6 = v3;

  dispatch_resume(v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)fireTimer
{
  timerSource = self->_timerSource;
  self->_timerSource = 0;

  self->_invalidated = 1;
  v5 = (void (**)(void))objc_retainBlock(self->_handlerBlock);
  id handlerBlock = self->_handlerBlock;
  self->_id handlerBlock = 0;

  v5[2]();
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end