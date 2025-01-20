@interface WakingTimer
- (BOOL)isInvalidated;
- (BOOL)isWaking;
- (NSString)identifier;
- (OS_dispatch_queue)handlerQueue;
- (WakingTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerQueue:(id)a6 handlerBlock:(id)a7;
- (double)delay;
- (double)gracePeriod;
- (id)handlerBlock;
- (unint64_t)deadline;
- (unint64_t)earliestFireTime;
- (unint64_t)startTime;
- (void)dealloc;
- (void)fireTimer;
- (void)invalidate;
- (void)setDeadline:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setEarliestFireTime:(unint64_t)a3;
- (void)setGracePeriod:(double)a3;
- (void)setHandlerBlock:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation WakingTimer

- (WakingTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerQueue:(id)a6 handlerBlock:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WakingTimer;
  v16 = [(WakingTimer *)&v22 init];
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

    v20 = +[WakingTimerScheduler sharedInstance];
    [v20 scheduleTimer:v17];
  }
  return v17;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v3 = nr_daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000FA148(v3);
    }

    [(WakingTimer *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)WakingTimer;
  [(WakingTimer *)&v4 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = +[WakingTimerScheduler sharedInstance];
    [v3 cancelTimer:self];

    id handlerBlock = self->_handlerBlock;
    self->_id handlerBlock = 0;

    handlerQueue = self->_handlerQueue;
    self->_handlerQueue = 0;
  }
}

- (BOOL)isWaking
{
  return 1;
}

- (void)fireTimer
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id v3 = objc_retainBlock(self->_handlerBlock);
    id handlerBlock = self->_handlerBlock;
    self->_id handlerBlock = 0;

    v5 = [(WakingTimer *)self handlerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008A1C0;
    block[3] = &unk_100165D10;
    id v8 = v3;
    id v6 = v3;
    dispatch_async(v5, block);
  }
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)earliestFireTime
{
  return self->_earliestFireTime;
}

- (void)setEarliestFireTime:(unint64_t)a3
{
  self->_earliestFireTime = a3;
}

- (unint64_t)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(unint64_t)a3
{
  self->_deadline = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end