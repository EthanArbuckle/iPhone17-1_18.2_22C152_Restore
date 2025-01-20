@interface UIDelayedAction
- (BOOL)_canceled;
- (BOOL)scheduled;
- (NSDate)_startDate;
- (UIDelayedAction)init;
- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6;
- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6 mode:(id)a7;
- (double)delay;
- (id)target;
- (id)userInfo;
- (void)cancel;
- (void)dealloc;
- (void)setTarget:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)timerFired:(id)a3;
- (void)touch;
- (void)touchWithDelay:(double)a3;
- (void)unschedule;
@end

@implementation UIDelayedAction

- (void)dealloc
{
  [(NSTimer *)self->m_timer invalidate];
  m_timer = self->m_timer;
  self->m_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIDelayedAction;
  [(UIDelayedAction *)&v4 dealloc];
}

- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6 mode:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)UIDelayedAction;
  v16 = [(UIDelayedAction *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->m_target, a3);
    if (a4) {
      SEL v18 = a4;
    }
    else {
      SEL v18 = 0;
    }
    v17->m_action = v18;
    objc_storeStrong(&v17->m_userInfo, a5);
    v17->m_delay = a6;
    uint64_t v19 = [v15 copy];
    m_runLoopMode = v17->m_runLoopMode;
    v17->m_runLoopMode = (NSString *)v19;

    [(UIDelayedAction *)v17 touchWithDelay:v17->m_delay];
  }

  return v17;
}

- (void)touchWithDelay:(double)a3
{
  self->m_canceled = 0;
  self->m_delay = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  m_startDate = self->m_startDate;
  self->m_startDate = v5;

  uint64_t v7 = [(NSDate *)self->m_startDate dateByAddingTimeInterval:a3];
  m_timer = self->m_timer;
  id v12 = (id)v7;
  if (m_timer)
  {
    [(NSTimer *)m_timer setFireDate:v7];
  }
  else
  {
    v9 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v7 interval:self target:sel_timerFired_ selector:self->m_userInfo userInfo:0 repeats:a3];
    v10 = self->m_timer;
    self->m_timer = v9;

    v11 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v11 addTimer:self->m_timer forMode:self->m_runLoopMode];
  }
}

- (void)cancel
{
  self->m_canceled = 1;
  [(UIDelayedAction *)self unschedule];
}

- (void)unschedule
{
  [(NSTimer *)self->m_timer invalidate];
  m_timer = self->m_timer;
  self->m_timer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_startDate, 0);
  objc_storeStrong((id *)&self->m_runLoopMode, 0);
  objc_storeStrong((id *)&self->m_timer, 0);
  objc_storeStrong(&self->m_userInfo, 0);
  objc_storeStrong(&self->m_target, 0);
}

- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6
{
  return [(UIDelayedAction *)self initWithTarget:a3 action:a4 userInfo:a5 delay:*MEMORY[0x1E4F1C3A0] mode:a6];
}

- (void)timerFired:(id)a3
{
  if (!self->m_canceled)
  {
    m_action = self->m_action;
    id m_target = self->m_target;
    if (m_action) {
      objc_msgSend(m_target, m_action, self->m_userInfo);
    }
    else {
      objc_msgSend(m_target, 0, self->m_userInfo);
    }
  }
  [(UIDelayedAction *)self cancel];
}

- (UIDelayedAction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[UIDelayedAction init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (void)touch
{
  self->m_canceled = 0;
  [(UIDelayedAction *)self touchWithDelay:self->m_delay];
}

- (BOOL)scheduled
{
  return !self->m_canceled && [(NSTimer *)self->m_timer isValid];
}

- (double)delay
{
  return self->m_delay;
}

- (id)target
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDate)_startDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)_canceled
{
  return self->m_canceled;
}

@end