@interface HDSPCFUserNotificationCenterManager
+ (id)sharedManager;
- (HDSPCFUserNotificationCenterManager)init;
- (NSMutableArray)registrations;
- (os_unfair_lock_s)registrationLock;
- (void)_withLock:(id)a3;
- (void)cancelNotification:(id)a3 fromCenter:(id)a4;
- (void)postNotification:(id)a3 fromCenter:(id)a4;
@end

@implementation HDSPCFUserNotificationCenterManager

+ (id)sharedManager
{
  if (qword_26AB790C0 != -1) {
    dispatch_once(&qword_26AB790C0, &__block_literal_global_8);
  }
  v2 = (void *)_MergedGlobals_14;

  return v2;
}

uint64_t __52__HDSPCFUserNotificationCenterManager_sharedManager__block_invoke()
{
  _MergedGlobals_14 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (HDSPCFUserNotificationCenterManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDSPCFUserNotificationCenterManager;
  v2 = [(HDSPCFUserNotificationCenterManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_registrationLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    registrations = v3->_registrations;
    v3->_registrations = v4;

    v6 = v3;
  }

  return v3;
}

- (void)_withLock:(id)a3
{
  p_registrationLock = &self->_registrationLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_registrationLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_registrationLock);
}

- (void)postNotification:(id)a3 fromCenter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, (CFUserNotificationRef)[v7 notification], (CFUserNotificationCallBack)_CFUserNotificationCallback, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  CFRelease(RunLoopSource);
  v10 = objc_alloc_init(_HDSPCFUserNotificationCenterRegistration);
  [(_HDSPCFUserNotificationCenterRegistration *)v10 setNotification:v7];

  [(_HDSPCFUserNotificationCenterRegistration *)v10 setNotificationCenter:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPCFUserNotificationCenterManager_postNotification_fromCenter___block_invoke;
  v12[3] = &unk_2645D9288;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  [(HDSPCFUserNotificationCenterManager *)self _withLock:v12];
}

uint64_t __67__HDSPCFUserNotificationCenterManager_postNotification_fromCenter___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)cancelNotification:(id)a3 fromCenter:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    CFUserNotificationCancel((CFUserNotificationRef)[v5 notification]);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke;
    v7[3] = &unk_2645D9288;
    v7[4] = self;
    id v8 = v6;
    [(HDSPCFUserNotificationCenterManager *)self _withLock:v7];
  }
}

void __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke_2;
  v4[3] = &unk_2645DA0A8;
  id v5 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", v4);
  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v3];
  }
}

BOOL __69__HDSPCFUserNotificationCenterManager_cancelNotification_fromCenter___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 notification];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (os_unfair_lock_s)registrationLock
{
  return self->_registrationLock;
}

- (NSMutableArray)registrations
{
  return self->_registrations;
}

- (void).cxx_destruct
{
}

@end