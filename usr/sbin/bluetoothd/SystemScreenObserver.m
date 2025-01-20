@interface SystemScreenObserver
- (BOOL)screenOn;
- (CUSystemMonitor)systemMonitor;
- (SystemScreenObserver)init;
- (void)activateWithSystemMonitor:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)screenStateChanged:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation SystemScreenObserver

- (SystemScreenObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)SystemScreenObserver;
  result = [(SystemScreenObserver *)&v3 init];
  if (result) {
    result->_screenUndimmedChangeNotifyToken = -1;
  }
  return result;
}

- (void)dealloc
{
  [(SystemScreenObserver *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SystemScreenObserver;
  [(SystemScreenObserver *)&v3 dealloc];
}

- (void)activateWithSystemMonitor:(id)a3
{
  id v5 = a3;
  if (self->_screenUndimmedChangeNotifyToken == -1)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v6 = *(void **)(sub_1004AF8EC() + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1003DD8FC;
    handler[3] = &unk_1009AC030;
    v7 = v6;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventUndimmed", &self->_screenUndimmedChangeNotifyToken, v7, handler);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_storeStrong((id *)&self->_systemMonitor, a3);
  unsigned __int8 v8 = [v5 screenOn];
  uint64_t v9 = sub_1004AF8EC();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003DD99C;
  v10[3] = &unk_100998BB0;
  v10[4] = self;
  unsigned __int8 v11 = v8;
  sub_100013018(v9, v10);
}

- (void)screenStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_1004AF8EC();
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 8));
  v6 = (os_unfair_lock_s *)sub_10003FFD4();
  if ([(SystemScreenObserver *)self screenOn] != v3)
  {
    [(SystemScreenObserver *)self setScreenOn:v3];
    if (v6)
    {
      sub_1002E1988(v6, v3);
    }
  }
}

- (void)invalidate
{
  [(SystemScreenObserver *)self setSystemMonitor:0];
  int screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_int screenUndimmedChangeNotifyToken = -1;
  }
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end