@interface SLGTimedLogger
- (BOOL)isActive;
- (BOOL)isEnabled;
- (SLGTimedLogger)initWithLogger:(id)a3 duration:(double)a4;
- (id)activationHandler;
- (id)deactivationHandler;
- (void)_startTimer;
- (void)_stopTimer;
- (void)invalidate;
- (void)logBlock:(id)a3 domain:(id)a4;
- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5;
- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6;
- (void)setActivationHandler:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeactivationHandler:(id)a3;
@end

@implementation SLGTimedLogger

- (SLGTimedLogger)initWithLogger:(id)a3 duration:(double)a4
{
  id v7 = a3;
  if ([v7 isEnabled])
  {
    objc_storeStrong((id *)&self->_logger, a3);
    self->_duration = a4;
    self->_lock._os_unfair_lock_opaque = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (id)activationHandler
{
  return (id)[(SLGActivatableLogging *)self->_logger activationHandler];
}

- (void)setActivationHandler:(id)a3
{
}

- (id)deactivationHandler
{
  return (id)[(SLGActivatableLogging *)self->_logger deactivationHandler];
}

- (void)setDeactivationHandler:(id)a3
{
}

- (BOOL)isActive
{
  return [(SLGActivatableLogging *)self->_logger isActive];
}

- (void)setActive:(BOOL)a3
{
  if (a3) {
    [(SLGTimedLogger *)self _startTimer];
  }
  else {
    [(SLGTimedLogger *)self _stopTimer];
  }
}

- (void)invalidate
{
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(SLGTimedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v7 domain:v6];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGTimedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v10 domain:v8 completion:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SLGTimedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v10 domain:v8 tags:v9];
  }
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(SLGTimedLogger *)self isActive]) {
    [(SLGActivatableLogging *)self->_logger logBlock:v13 domain:v10 tags:v11 completion:v12];
  }
}

- (void)_startTimer
{
  [(SLGActivatableLogging *)self->_logger setActive:1];
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  v4 = dispatch_get_global_queue(0, 0);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
  id v6 = self->_timer;
  self->_timer = v5;

  id v7 = self->_timer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__SLGTimedLogger__startTimer__block_invoke;
  handler[3] = &unk_1E6870138;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  id v8 = self->_timer;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_duration * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timer);
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __29__SLGTimedLogger__startTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopTimer];
}

- (void)_stopTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;
  }
  os_unfair_lock_unlock(p_lock);
  logger = self->_logger;

  [(SLGActivatableLogging *)logger setActive:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end