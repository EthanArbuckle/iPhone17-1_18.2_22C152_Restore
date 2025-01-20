@interface RTDataProtectionManager
+ (id)dataProtectionLockStateToString:(int64_t)a3;
+ (id)encryptedDataAvailabilityToString:(int64_t)a3;
- (BOOL)unlockedSinceBoot;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDataProtectionManager)init;
- (RTDataProtectionManager)initWithKeybagMonitor:(id)a3 notificationHelper:(id)a4;
- (RTKeybagMonitor)keybagMonitor;
- (int64_t)encryptedDataAvailability;
- (void)_shutdownWithHandler:(id)a3;
- (void)dealloc;
- (void)fetchLockStateDisabledWithHandler:(id)a3;
- (void)handleKeybagLockStatusChange:(int64_t)a3;
- (void)handleUnlockedSinceBoot;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setKeybagMonitor:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setUnlockedSinceBoot:(BOOL)a3;
@end

@implementation RTDataProtectionManager

- (RTDataProtectionManager)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(RTDataProtectionManager *)self initWithKeybagMonitor:v3 notificationHelper:v4];

  return v5;
}

- (RTDataProtectionManager)initWithKeybagMonitor:(id)a3 notificationHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTDataProtectionManager;
  v9 = [(RTNotifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationHelper, a4);
    objc_storeStrong((id *)&v10->_keybagMonitor, a3);
    v10->_encryptedDataAvailability = 0;
    v10->_unlockedSinceBoot = 1;
  }

  return v10;
}

+ (id)dataProtectionLockStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6B9D080[a3];
  }
}

+ (id)encryptedDataAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B9D0A0[a3 - 1];
  }
}

- (void)dealloc
{
  v3 = [(RTDataProtectionManager *)self notificationHelper];
  [v3 removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.lock_status" info:0];

  v4 = [(RTDataProtectionManager *)self notificationHelper];
  [v4 removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.first_unlock" info:0];

  v5.receiver = self;
  v5.super_class = (Class)RTDataProtectionManager;
  [(RTDataProtectionManager *)&v5 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v7 = a3;
  v4 = [(RTDataProtectionManager *)self notificationHelper];
  [v4 removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.lock_status" info:0];

  objc_super v5 = [(RTDataProtectionManager *)self notificationHelper];
  [v5 removeObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.first_unlock" info:0];

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v6 = v7;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [(__CFString *)v7 isEqualToString:v8];

  if (v9)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v7] == 1)
    {
      v10 = [(RTDataProtectionManager *)self notificationHelper];
      [v10 addObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.lock_status" callback:onKeybagLockStatusChange info:0 suspensionBehavior:1];

      v11 = [(RTDataProtectionManager *)self keybagMonitor];
      int v12 = [v11 getDeviceLockState];

      if (v12 < 0)
      {
        v24 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v28 = 134217984;
          v29 = (__CFString *)v12;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Failed to determine lock state, %ld", (uint8_t *)&v28, 0xCu);
        }

        v13 = self;
        uint64_t v14 = 0;
      }
      else
      {
        v13 = self;
        if (v12 == 2)
        {
          uint64_t v14 = 3;
        }
        else if (v12 == 1)
        {
          uint64_t v14 = 1;
        }
        else
        {
          uint64_t v14 = 2;
        }
      }
      [(RTDataProtectionManager *)v13 setEncryptedDataAvailability:v14];
      v25 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = +[RTDataProtectionManager dataProtectionLockStateToString:v12];
        v27 = +[RTDataProtectionManager encryptedDataAvailabilityToString:[(RTDataProtectionManager *)self encryptedDataAvailability]];
        int v28 = 138412546;
        v29 = v26;
        __int16 v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "lock state, %@, encrypted data availability, %@", (uint8_t *)&v28, 0x16u);
      }
    }
    v22 = [[RTDataProtectionManagerNotificationEncryptedDataAvailability alloc] initWithEncryptedDataAvailability:[(RTDataProtectionManager *)self encryptedDataAvailability]];
LABEL_26:
    p_super = &v22->super.super;
    [(RTNotifier *)self postNotification:v22 toObserver:v6];
    goto LABEL_27;
  }
  v15 = +[RTNotification notificationName];
  int v16 = [(__CFString *)v7 isEqualToString:v15];

  if (v16)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v7] == 1)
    {
      v17 = [(RTDataProtectionManager *)self notificationHelper];
      [v17 addObserver:self center:CFNotificationCenterGetDarwinNotifyCenter() key:@"com.apple.mobile.keybagd.first_unlock" callback:onUnlockedSinceBoot info:0 suspensionBehavior:1];
    }
    v18 = [(RTDataProtectionManager *)self keybagMonitor];
    -[RTDataProtectionManager setUnlockedSinceBoot:](self, "setUnlockedSinceBoot:", [v18 getUnlockedSinceBoot]);

    v19 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      BOOL v20 = [(RTDataProtectionManager *)self unlockedSinceBoot];
      v21 = @"NO";
      if (v20) {
        v21 = @"YES";
      }
      int v28 = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "unlocked since boot, %@", (uint8_t *)&v28, 0xCu);
    }

    v22 = [[RTDataProtectionManagerNotificationUnlockedSinceBoot alloc] initWithUnlockedSinceBoot:[(RTDataProtectionManager *)self unlockedSinceBoot]];
    goto LABEL_26;
  }
  p_super = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    int v28 = 138412290;
    v29 = v7;
    _os_log_error_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v28, 0xCu);
  }
LABEL_27:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    if (![(RTNotifier *)self getNumberOfObservers:v5])
    {
      id v8 = [(RTDataProtectionManager *)self notificationHelper];
      CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v10 = @"com.apple.mobile.keybagd.lock_status";
LABEL_7:
      [v8 removeObserver:self center:DarwinNotifyCenter key:v10 info:0];
    }
  }
  else
  {
    v11 = +[RTNotification notificationName];
    int v12 = [v5 isEqualToString:v11];

    if (v12)
    {
      if (![(RTNotifier *)self getNumberOfObservers:v5])
      {
        id v8 = [(RTDataProtectionManager *)self notificationHelper];
        CFNotificationCenterRef DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v10 = @"com.apple.mobile.keybagd.first_unlock";
        goto LABEL_7;
      }
    }
    else
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)handleKeybagLockStatusChange:(int64_t)a3
{
  id v5 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__RTDataProtectionManager_handleKeybagLockStatusChange___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __56__RTDataProtectionManager_handleKeybagLockStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) encryptedDataAvailability];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = 2;
  if (v3 == 2) {
    uint64_t v4 = 3;
  }
  if (v3 == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  [*(id *)(a1 + 32) setEncryptedDataAvailability:v5];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = +[RTDataProtectionManager dataProtectionLockStateToString:*(void *)(a1 + 40)];
    id v8 = +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", [*(id *)(a1 + 32) encryptedDataAvailability]);
    int v10 = 138412546;
    v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "received lock state change, %@, encrypted data availability, %@", (uint8_t *)&v10, 0x16u);
  }
  if ([*(id *)(a1 + 32) encryptedDataAvailability] != v2)
  {
    int v9 = [[RTDataProtectionManagerNotificationEncryptedDataAvailability alloc] initWithEncryptedDataAvailability:*(void *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(a1 + 32) postNotification:v9];
  }
}

- (void)handleUnlockedSinceBoot
{
  uint64_t v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__RTDataProtectionManager_handleUnlockedSinceBoot__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

void __50__RTDataProtectionManager_handleUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityDataProtection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "received unlock since boot notification", v4, 2u);
  }

  [*(id *)(a1 + 32) setUnlockedSinceBoot:1];
  uint64_t v3 = -[RTDataProtectionManagerNotificationUnlockedSinceBoot initWithUnlockedSinceBoot:]([RTDataProtectionManagerNotificationUnlockedSinceBoot alloc], "initWithUnlockedSinceBoot:", [*(id *)(a1 + 32) unlockedSinceBoot]);
  [*(id *)(a1 + 32) postNotification:v3];
}

- (void)fetchLockStateDisabledWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__RTDataProtectionManager_fetchLockStateDisabledWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __61__RTDataProtectionManager_fetchLockStateDisabledWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keybagMonitor];
  [v2 getDeviceLockState];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (RTKeybagMonitor)keybagMonitor
{
  return self->_keybagMonitor;
}

- (void)setKeybagMonitor:(id)a3
{
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybagMonitor, 0);

  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end