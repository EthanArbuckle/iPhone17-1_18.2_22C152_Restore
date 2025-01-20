@interface NTKDelayedBlock
- (BOOL)canceled;
- (BOOL)invalidated;
- (NSString)runLoopMode;
- (NSTimer)timer;
- (NTKDelayedBlock)initWithDelay:(double)a3 action:(id)a4;
- (NTKDelayedBlock)initWithDelay:(double)a3 runLoopMode:(id)a4 action:(id)a5;
- (double)delay;
- (id)action;
- (void)cancel;
- (void)dealloc;
- (void)reset;
- (void)resetWithDelay:(double)a3;
- (void)setAction:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setRunLoopMode:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerFired:(id)a3;
@end

@implementation NTKDelayedBlock

- (NTKDelayedBlock)initWithDelay:(double)a3 action:(id)a4
{
  return [(NTKDelayedBlock *)self initWithDelay:*MEMORY[0x1E4F1C3A0] runLoopMode:a4 action:a3];
}

- (NTKDelayedBlock)initWithDelay:(double)a3 runLoopMode:(id)a4 action:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NTKDelayedBlock;
  v10 = [(NTKDelayedBlock *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(NTKDelayedBlock *)v10 setDelay:a3];
    [(NTKDelayedBlock *)v11 setRunLoopMode:v8];
    [(NTKDelayedBlock *)v11 setAction:v9];
    [(NTKDelayedBlock *)v11 delay];
    -[NTKDelayedBlock resetWithDelay:](v11, "resetWithDelay:");
  }

  return v11;
}

- (void)dealloc
{
  v3 = [(NTKDelayedBlock *)self timer];
  [v3 invalidate];

  [(NTKDelayedBlock *)self setAction:0];
  v4.receiver = self;
  v4.super_class = (Class)NTKDelayedBlock;
  [(NTKDelayedBlock *)&v4 dealloc];
}

- (void)reset
{
  [(NTKDelayedBlock *)self delay];
  -[NTKDelayedBlock resetWithDelay:](self, "resetWithDelay:");
}

- (void)resetWithDelay:(double)a3
{
  if ([(NTKDelayedBlock *)self canceled])
  {
    v5 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "*** warning: attempting to reset an NTKDelayedBlock which has been canceled or whose block has been called.", v13, 2u);
    }
  }
  v6 = [(NTKDelayedBlock *)self action];

  if (v6)
  {
    if (a3 >= 0.0)
    {
      [(NTKDelayedBlock *)self setCanceled:0];
      [(NTKDelayedBlock *)self setDelay:a3];
      v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
      id v8 = [(NTKDelayedBlock *)self timer];

      if (v8)
      {
        id v9 = [(NTKDelayedBlock *)self timer];
        [v9 setFireDate:v7];
      }
      else
      {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v7 interval:self target:sel_timerFired_ selector:0 userInfo:0 repeats:a3];
        [(NTKDelayedBlock *)self setTimer:v10];

        id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        v11 = [(NTKDelayedBlock *)self timer];
        v12 = [(NTKDelayedBlock *)self runLoopMode];
        [v9 addTimer:v11 forMode:v12];
      }
    }
    else
    {
      [(NTKDelayedBlock *)self cancel];
    }
  }
}

- (void)timerFired:(id)a3
{
  if (![(NTKDelayedBlock *)self canceled])
  {
    objc_super v4 = [(NTKDelayedBlock *)self action];

    if (v4)
    {
      v5 = [(NTKDelayedBlock *)self action];
      ((void (**)(void, NTKDelayedBlock *))v5)[2](v5, self);
    }
  }
  [(NTKDelayedBlock *)self cancel];
}

- (void)cancel
{
  [(NTKDelayedBlock *)self setCanceled:1];
  v3 = [(NTKDelayedBlock *)self timer];
  [v3 invalidate];

  [(NTKDelayedBlock *)self setTimer:0];
  [(NTKDelayedBlock *)self setAction:0];
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_runLoopMode, 0);
}

@end