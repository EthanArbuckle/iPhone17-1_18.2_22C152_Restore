@interface PMMDataProtectionMonitor
+ (id)PMMDataProtectionMonitorDataProtectionStatus:(int64_t)a3;
+ (id)PMMDataProtectionMonitorEncryptedDataAvailabilityToString:(int64_t)a3;
+ (id)PMMDataProtectionMonitorLockStateToString:(int64_t)a3;
- (BOOL)dataProtectionEnabled;
- (BOOL)unlockedSinceBoot;
- (PMMDataProtectionMonitor)init;
- (PMMDataProtectionMonitorDelegate)delegate;
- (int64_t)dataProtectionStatus;
- (int64_t)encryptedDataAvailability;
- (void)_registerForKeyBagNotifications;
- (void)dealloc;
- (void)handkeKeybagLockStatusChange:(int64_t)a3;
- (void)handleUnlockedSinceBoot;
- (void)setDataProtectionStatus:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setUnlockedSinceBoot:(BOOL)a3;
@end

@implementation PMMDataProtectionMonitor

+ (id)PMMDataProtectionMonitorLockStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_2646DF988[a3];
  }
}

+ (id)PMMDataProtectionMonitorEncryptedDataAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_2646DF9A8[a3 - 1];
  }
}

+ (id)PMMDataProtectionMonitorDataProtectionStatus:(int64_t)a3
{
  v3 = @"unknown";
  if (a3 == 1) {
    v3 = @"enabled";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"disabled";
  }
}

- (PMMDataProtectionMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)PMMDataProtectionMonitor;
  v2 = [(PMMDataProtectionMonitor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_rwlock, 0);
    pthread_rwlock_wrlock(&v3->_rwlock);
    v3->_encryptedDataAvailability = 0;
    v3->_unlockedSinceBoot = 1;
    v3->_dataProtectionStatus = 2;
    pthread_rwlock_unlock(&v3->_rwlock);
    [(PMMDataProtectionMonitor *)v3 _registerForKeyBagNotifications];
  }
  return v3;
}

- (void)_registerForKeyBagNotifications
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2247FC000, a2, OS_LOG_TYPE_ERROR, "Failed to determine lock state, %ld", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)[NSString stringWithUTF8String:*MEMORY[0x263F55A78]], 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.mobile.keybagd.first_unlock", 0);
  pthread_rwlock_destroy(&self->_rwlock);
  v5.receiver = self;
  v5.super_class = (Class)PMMDataProtectionMonitor;
  [(PMMDataProtectionMonitor *)&v5 dealloc];
}

- (void)handkeKeybagLockStatusChange:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = 2;
  if (a3 == 2) {
    uint64_t v5 = 3;
  }
  if (a3 == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  [(PMMDataProtectionMonitor *)self setEncryptedDataAvailability:v6];
  [(PMMDataProtectionMonitor *)self setDataProtectionStatus:MKBGetDeviceLockState() != 3];
  v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = +[PMMDataProtectionMonitor PMMDataProtectionMonitorLockStateToString:a3];
    v9 = +[PMMDataProtectionMonitor PMMDataProtectionMonitorEncryptedDataAvailabilityToString:[(PMMDataProtectionMonitor *)self encryptedDataAvailability]];
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2247FC000, v7, OS_LOG_TYPE_INFO, "received lock state change, %@, encrypted data availability, %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)handleUnlockedSinceBoot
{
  uint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2247FC000, v3, OS_LOG_TYPE_INFO, "received unlock since boot notification", v4, 2u);
  }

  [(PMMDataProtectionMonitor *)self setUnlockedSinceBoot:1];
}

- (PMMDataProtectionMonitorDelegate)delegate
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  pthread_rwlock_unlock(p_rwlock);
  return (PMMDataProtectionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)p_delegate, obj);
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (int64_t)encryptedDataAvailability
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t encryptedDataAvailability = self->_encryptedDataAvailability;
  pthread_rwlock_unlock(p_rwlock);
  return encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_encryptedDataAvailability != a3)
  {
    self->_int64_t encryptedDataAvailability = a3;
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[PMMDataProtectionMonitor PMMDataProtectionMonitorEncryptedDataAvailabilityToString:self->_encryptedDataAvailability];
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_2247FC000, v6, OS_LOG_TYPE_INFO, "encrypted data availability changed to, %@", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained dataProtectionMonitor:self encryptedDataAvailbilityDidChange:self->_encryptedDataAvailability];
    }
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (BOOL)unlockedSinceBoot
{
  int v2 = self;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  LOBYTE(v2) = v2->_unlockedSinceBoot;
  pthread_rwlock_unlock(p_rwlock);
  return (char)v2;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_unlockedSinceBoot != v3)
  {
    self->_BOOL unlockedSinceBoot = v3;
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL unlockedSinceBoot = self->_unlockedSinceBoot;
      v9[0] = 67109120;
      v9[1] = unlockedSinceBoot;
      _os_log_impl(&dword_2247FC000, v6, OS_LOG_TYPE_INFO, "unlocked since boot changed to, %{BOOL}d", (uint8_t *)v9, 8u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained dataProtectionMonitor:self unlockedSinceBoot:self->_unlockedSinceBoot];
    }
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (BOOL)dataProtectionEnabled
{
  int v2 = self;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  LOBYTE(v2) = v2->_dataProtectionStatus != 0;
  pthread_rwlock_unlock(p_rwlock);
  return (char)v2;
}

- (void)setDataProtectionStatus:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (self->_dataProtectionStatus != v3)
  {
    self->_dataProtectionStatus = v3;
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[PMMDataProtectionMonitor PMMDataProtectionMonitorDataProtectionStatus:self->_dataProtectionStatus];
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_2247FC000, v6, OS_LOG_TYPE_INFO, "data protection enabled, %@", (uint8_t *)&v9, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained dataProtectionMonitor:self dataProtectionStatusDidChange:self->_dataProtectionStatus];
    }
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (int64_t)dataProtectionStatus
{
  return self->_dataProtectionStatus;
}

- (void).cxx_destruct
{
}

@end