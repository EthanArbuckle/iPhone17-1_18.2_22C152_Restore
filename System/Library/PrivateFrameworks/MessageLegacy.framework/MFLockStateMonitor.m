@interface MFLockStateMonitor
+ (id)sharedInstance;
- (BOOL)isLocked;
- (EFObservable)lockStateObservable;
- (MFLockStateMonitor)init;
- (void)_receiveLockState:(BOOL)a3;
- (void)dealloc;
@end

@implementation MFLockStateMonitor

+ (id)sharedInstance
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
  return v2;
}

uint64_t __36__MFLockStateMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
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
  v14.receiver = self;
  v14.super_class = (Class)MFLockStateMonitor;
  v2 = [(MFLockStateMonitor *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60DD8] observableObserver];
    observable = v2->_observable;
    v2->_observable = (EFObserver *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.message.lockStateMonitor", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.message.lockStateMonitor.notifyq", 0);
    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__MFLockStateMonitor_init__block_invoke;
    v11[3] = &unk_1E6867458;
    objc_copyWeak(&v12, &location);
    v8 = (void (**)(void *, void))_Block_copy(v11);
    p_int token = &v2->_token;
    if (notify_register_dispatch("com.apple.springboard.lockstate", &v2->_token, v7, v8)) {
      *p_int token = -1;
    }
    else {
      v8[2](v8, *p_token);
    }

    objc_destroyWeak(&v12);
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
  objc_super v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MFLockStateMonitor isLocked](self, "isLocked"));
  v8[0] = v4;
  dispatch_queue_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [v3 startWith:v5];

  return (EFObservable *)v6;
}

- (BOOL)isLocked
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MFLockStateMonitor_isLocked__block_invoke;
  v5[3] = &unk_1E6866DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__MFLockStateMonitor_isLocked__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)_receiveLockState:(BOOL)a3
{
  BOOL v3 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __40__MFLockStateMonitor__receiveLockState___block_invoke;
  v8[3] = &unk_1E6867480;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_barrier_sync(queue, v8);
  observable = self->_observable;
  v7 = [NSNumber numberWithBool:v3];
  [(EFObserver *)observable observerDidReceiveResult:v7];
}

uint64_t __40__MFLockStateMonitor__receiveLockState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end