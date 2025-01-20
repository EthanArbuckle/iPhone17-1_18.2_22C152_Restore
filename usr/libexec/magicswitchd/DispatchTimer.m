@interface DispatchTimer
- (BOOL)isInvalidated;
- (BOOL)isWaking;
- (DispatchTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerBlock:(id)a6;
- (NSString)identifier;
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
- (void)setIdentifier:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation DispatchTimer

- (DispatchTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerBlock:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DispatchTimer;
  v13 = [(DispatchTimer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_delay = a4;
    v14->_gracePeriod = a5;
    id v15 = objc_retainBlock(v12);
    id handlerBlock = v14->_handlerBlock;
    v14->_id handlerBlock = v15;

    [(DispatchTimer *)v14 scheduleTimer];
  }

  return v14;
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
  }
}

- (BOOL)isWaking
{
  return 0;
}

- (void)scheduleTimer
{
  objc_super v3 = +[MagicSwitchEnabler sharedInstance];
  v4 = [v3 workQueue];
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A778;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, v9);
  timerSource = self->_timerSource;
  self->_timerSource = (OS_dispatch_source *)v5;
  v8 = v5;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fireTimer
{
  timerSource = self->_timerSource;
  self->_timerSource = 0;

  self->_invalidated = 1;
  v4 = (void (*)(void))*((void *)self->_handlerBlock + 2);

  v4();
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

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end