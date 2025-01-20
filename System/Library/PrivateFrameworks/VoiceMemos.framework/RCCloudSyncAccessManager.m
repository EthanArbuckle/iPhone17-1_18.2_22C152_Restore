@interface RCCloudSyncAccessManager
- (ACMonitoredAccountStore)accountStore;
- (BOOL)cloudSyncIsAvailable;
- (RCCloudSyncAccessManagerDelegate)delegate;
- (int)tccCloudAccess;
- (void)_availabilityChanged;
- (void)_startMonitoringAccountChanges;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setTccCloudAccess:(int)a3;
- (void)startMonitoringAccountChanges;
- (void)tccCloudAccess;
@end

@implementation RCCloudSyncAccessManager

uint64_t __57__RCCloudSyncAccessManager_startMonitoringAccountChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringAccountChanges];
}

- (void)_startMonitoringAccountChanges
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_monitoringAccountChanges)
  {
    v2->_monitoringAccountChanges = 1;
    v3 = [(RCCloudSyncAccessManager *)v2 accountStore];
    [v3 registerWithCompletion:&__block_literal_global_12];

    uint64_t v4 = objc_opt_new();
    managedConfigurationHelper = v2->_managedConfigurationHelper;
    v2->_managedConfigurationHelper = (RCManagedConfigurationHelper *)v4;

    [(RCManagedConfigurationHelper *)v2->_managedConfigurationHelper setDelegate:v2];
    objc_initWeak(&location, v2);
    v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__RCCloudSyncAccessManager__startMonitoringAccountChanges__block_invoke_2;
    v8[3] = &unk_1E6497158;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.tcc.access.changed", &v2->_tccNotifyToken, v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

- (BOOL)cloudSyncIsAvailable
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(RCCloudSyncAccessManager *)v2 accountStore];
  if (objc_msgSend(v3, "aa_isUsingiCloud")) {
    BOOL v4 = +[RCManagedConfigurationHelper cloudSyncIsAllowed];
  }
  else {
    BOOL v4 = 0;
  }

  objc_sync_exit(v2);
  return v4;
}

- (ACMonitoredAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    BOOL v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F17750]];
    v5 = (ACMonitoredAccountStore *)[objc_alloc(MEMORY[0x1E4F179E8]) initWithAccountTypes:v4 delegate:self];
    v6 = self->_accountStore;
    self->_accountStore = v5;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)startMonitoringAccountChanges
{
  v3 = dispatch_queue_create("com.apple.RCCloudSyncAccessManagerStartQueue", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RCCloudSyncAccessManager_startMonitoringAccountChanges__block_invoke;
  block[3] = &unk_1E64963A0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__RCCloudSyncAccessManager__startMonitoringAccountChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v2 tccCloudAccessChanged];
    }

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  int tccNotifyToken = self->_tccNotifyToken;
  if (tccNotifyToken) {
    notify_cancel(tccNotifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)RCCloudSyncAccessManager;
  [(RCCloudSyncAccessManager *)&v4 dealloc];
}

- (int)tccCloudAccess
{
  CFArrayRef v2 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (v2)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count < 1) {
      goto LABEL_14;
    }
    CFIndex v5 = Count;
    CFIndex v6 = 0;
    id v7 = (const void **)MEMORY[0x1E4FA9A00];
    v8 = (CFTypeRef *)MEMORY[0x1E4FA9A90];
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
      Value = CFDictionaryGetValue(ValueAtIndex, *v7);
      if (CFEqual(Value, *v8)) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_14;
      }
    }
    CFBooleanRef v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E4FA99E8]);
    if (v13)
    {
      if (CFBooleanGetValue(v13)) {
        int v12 = 2;
      }
      else {
        int v12 = 1;
      }
    }
    else
    {
LABEL_14:
      int v12 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v11 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RCCloudSyncAccessManager tccCloudAccess](v11);
    }

    return 0;
  }
  return v12;
}

- (void)setTccCloudAccess:(int)a3
{
  if (a3 == 2)
  {
    if (![(RCCloudSyncAccessManager *)self cloudSyncIsAvailable])
    {
      CFIndex v5 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[RCCloudSyncAccessManager setTccCloudAccess:](self, v5);
      }
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (a3 == 1)
  {
LABEL_10:
    if (TCCAccessSetForBundleId()) {
      return;
    }
    goto LABEL_11;
  }
  if (a3 || !TCCAccessResetForBundleId())
  {
LABEL_11:
    CFIndex v5 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[RCCloudSyncAccessManager setTccCloudAccess:](a3, v5);
    }
LABEL_13:
  }
}

- (void)_availabilityChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__RCCloudSyncAccessManager__availabilityChanged__block_invoke;
  block[3] = &unk_1E64963A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__RCCloudSyncAccessManager__availabilityChanged__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) delegate];
  if (v1)
  {
    CFArrayRef v3 = (void *)v1;
    if (objc_opt_respondsToSelector()) {
      [v3 cloudSyncAvailabilityChanged];
    }
  }
  return MEMORY[0x1F4181820]();
}

- (RCCloudSyncAccessManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RCCloudSyncAccessManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)tccCloudAccess
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  CFArrayRef v2 = "-[RCCloudSyncAccessManager tccCloudAccess]";
  _os_log_error_impl(&dword_1C3964000, log, OS_LOG_TYPE_ERROR, "%s -- TCCAccessCopyInformationForBundleId failed", (uint8_t *)&v1, 0xCu);
}

- (void)setTccCloudAccess:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[RCCloudSyncAccessManager setTccCloudAccess:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to set TCCCloudAccess to %i\n", (uint8_t *)&v2, 0x12u);
}

- (void)setTccCloudAccess:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 accountStore];
  if (objc_msgSend(v3, "aa_isUsingiCloud")) {
    __int16 v4 = @"is";
  }
  else {
    __int16 v4 = @"is not";
  }
  BOOL v5 = +[RCManagedConfigurationHelper cloudSyncIsAllowed];
  uint64_t v6 = @"does not";
  v8 = "-[RCCloudSyncAccessManager setTccCloudAccess:]";
  int v7 = 136315650;
  __int16 v9 = 2112;
  v10 = v4;
  if (v5) {
    uint64_t v6 = @"does";
  }
  __int16 v11 = 2112;
  int v12 = v6;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- Attempting to enable cloud sync when not available - User %@ logged in, Managed Configuration %@ allow cloud sync", (uint8_t *)&v7, 0x20u);
}

@end