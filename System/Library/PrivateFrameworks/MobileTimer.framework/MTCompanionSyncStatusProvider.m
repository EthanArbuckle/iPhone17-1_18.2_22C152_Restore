@interface MTCompanionSyncStatusProvider
+ (BOOL)deviceSupportsSyncing;
- (MTCompanionSyncStatusProvider)init;
- (MTSyncStatusProviderDelegate)syncStatusProviderDelegate;
- (unint64_t)syncStatus;
- (void)activePairedDeviceDidChange;
- (void)setSyncStatusProviderDelegate:(id)a3;
@end

@implementation MTCompanionSyncStatusProvider

- (MTCompanionSyncStatusProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTCompanionSyncStatusProvider;
  v2 = [(MTCompanionSyncStatusProvider *)&v5 init];
  if (v2)
  {
    v3 = +[MTPairedDeviceListener sharedListener];
    [v3 registerObserver:v2];
  }
  return v2;
}

+ (BOOL)deviceSupportsSyncing
{
  if (deviceSupportsSyncing_onceToken != -1) {
    dispatch_once(&deviceSupportsSyncing_onceToken, &__block_literal_global_46);
  }
  return deviceSupportsSyncing_deviceSupportsSyncing;
}

uint64_t __54__MTCompanionSyncStatusProvider_deviceSupportsSyncing__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceSupportsSyncing_deviceSupportsSyncing = result;
  return result;
}

- (unint64_t)syncStatus
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() deviceSupportsSyncing])
  {
    v3 = +[MTPairedDeviceListener sharedListener];
    char v4 = [v3 hasActivePairedDeviceSupportingSyncing];

    if (v4) {
      return 1;
    }
    v6 = MTLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      v7 = "%{public}@ no active paired device supporting syncing.  Syncing is disabled";
      goto LABEL_8;
    }
  }
  else
  {
    v6 = MTLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      v7 = "%{public}@ this device doesn't support syncing.";
LABEL_8:
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 0xCu);
    }
  }

  return 3;
}

- (void)activePairedDeviceDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ active paired device changed.", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncStatusProviderDelegate);
  objc_msgSend(WeakRetained, "syncStatusProvider:didChangeSyncStatus:", self, -[MTCompanionSyncStatusProvider syncStatus](self, "syncStatus"));
}

- (MTSyncStatusProviderDelegate)syncStatusProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncStatusProviderDelegate);
  return (MTSyncStatusProviderDelegate *)WeakRetained;
}

- (void)setSyncStatusProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end