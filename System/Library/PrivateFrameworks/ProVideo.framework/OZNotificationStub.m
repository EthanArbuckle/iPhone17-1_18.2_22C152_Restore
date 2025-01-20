@interface OZNotificationStub
- (OZNotificationStub)initWithOZDocument:(void *)a3 useTimer:(BOOL)a4;
- (void)dealloc;
- (void)fire;
- (void)processNotifications:(id)a3;
- (void)releaseTimer;
@end

@implementation OZNotificationStub

- (OZNotificationStub)initWithOZDocument:(void *)a3 useTimer:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)OZNotificationStub;
  v6 = [(OZNotificationStub *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_pDocument = a3;
    if (v4) {
      [(OZNotificationStub *)v6 createTimer];
    }
  }
  return v7;
}

- (void)dealloc
{
  [(OZNotificationStub *)self releaseTimer];
  v3.receiver = self;
  v3.super_class = (Class)OZNotificationStub;
  [(OZNotificationStub *)&v3 dealloc];
}

- (void)releaseTimer
{
  pTimer = self->_pTimer;
  if (pTimer)
  {
    [(NSTimer *)pTimer invalidate];
  }
  self->_pTimer = 0;
}

- (void)processNotifications:(id)a3
{
  objc_super v3 = (OZNotificationManager *)*((void *)self->_pDocument + 21);
  if (v3) {
    OZNotificationManager::processNotifications(v3);
  }
}

- (void)fire
{
  pTimer = self->_pTimer;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];

  [(NSTimer *)pTimer setFireDate:v3];
}

@end