@interface MFLockStateMonitor
+ (MFLockStateMonitor)sharedInstance;
- (BOOL)isLocked;
- (EFObservable)lockStateObservable;
- (MFLockStateMonitor)init;
- (void)_receiveLockState:(BOOL)a3;
- (void)dealloc;
@end

@implementation MFLockStateMonitor

+ (MFLockStateMonitor)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MFLockStateMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return (MFLockStateMonitor *)v2;
}

void __36__MFLockStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1) {
    notify_cancel(token);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFLockStateMonitor;
  [(MFLockStateMonitor *)&v4 dealloc];
}

- (MFLockStateMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)MFLockStateMonitor;
  v2 = [(MFLockStateMonitor *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60DD8] observableObserver];
    observable = v2->_observable;
    v2->_observable = (EFObserver *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_create("com.apple.message.lockStateMonitor.notifyq", v5);

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __26__MFLockStateMonitor_init__block_invoke;
    v10[3] = &unk_1E5D3F168;
    objc_copyWeak(&v11, &location);
    v7 = (void (**)(void *, void))_Block_copy(v10);
    p_int token = &v2->_token;
    if (notify_register_dispatch("com.apple.springboard.lockstate", &v2->_token, v6, v7)) {
      *p_int token = -1;
    }
    else {
      v7[2](v7, *p_token);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__MFLockStateMonitor_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t state64 = 0;
  notify_get_state(a2, &state64);
  [WeakRetained _receiveLockState:state64 != 0];
}

- (EFObservable)lockStateObservable
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EFObserver *)self->_observable distinctUntilChanged];
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MFLockStateMonitor isLocked](self, "isLocked"));
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [v3 startWith:v5];

  return (EFObservable *)v6;
}

- (BOOL)isLocked
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isLocked);
  return v2 & 1;
}

- (void)_receiveLockState:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_isLocked);
  observable = self->_observable;
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFObserver observerDidReceiveResult:](observable, "observerDidReceiveResult:");
}

- (void).cxx_destruct
{
}

@end