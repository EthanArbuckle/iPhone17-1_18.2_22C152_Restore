@interface BatterySaverWatcher
- (BOOL)batterySaverEnabled;
- (BatterySaverWatcher)initWithDelegate:(id)a3;
- (BatterySaverWatcherDelegate)delegate;
- (unint64_t)_getState;
- (void)_notifyDelegate;
- (void)_registerNotifier;
- (void)_updateStatus;
- (void)dealloc;
@end

@implementation BatterySaverWatcher

- (BatterySaverWatcher)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BatterySaverWatcher;
  v5 = [(BatterySaverWatcher *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_enabled = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(BatterySaverWatcher *)v6 _registerNotifier];
  }

  return v6;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)BatterySaverWatcher;
  [(BatterySaverWatcher *)&v3 dealloc];
}

- (BOOL)batterySaverEnabled
{
  v2 = self;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  notifyQueue = self->_notifyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002CE6C;
  v5[3] = &unk_1003A34F0;
  v5[4] = v2;
  v5[5] = v6;
  dispatch_sync(notifyQueue, v5);
  LOBYTE(v2) = v2->_enabled;
  _Block_object_dispose(v6, 8);
  return (char)v2;
}

- (unint64_t)_getState
{
  uint64_t state64 = 0;
  int token = self->_token;
  if (!token) {
    return 0;
  }
  notify_get_state(token, &state64);
  return state64;
}

- (void)_notifyDelegate
{
  objc_super v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CF4C;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_registerNotifier
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.BatterySaverWatcher", 0);
  notifyQueue = self->_notifyQueue;
  self->_notifyQueue = v3;

  objc_initWeak(&location, self);
  v5 = self->_notifyQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002D0F0;
  handler[3] = &unk_1003A38E0;
  handler[4] = self;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.system.batterysavermode.discretionary", &self->_token, v5, handler);
  v6 = self->_notifyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D14C;
  v7[3] = &unk_1003A3140;
  v7[4] = self;
  dispatch_sync(v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateStatus
{
  BOOL v3 = [(BatterySaverWatcher *)self _getState] != 0;
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    [(BatterySaverWatcher *)self _notifyDelegate];
  }
}

- (BatterySaverWatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BatterySaverWatcherDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end