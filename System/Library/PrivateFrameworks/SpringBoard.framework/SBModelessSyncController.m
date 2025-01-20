@interface SBModelessSyncController
+ (id)sharedInstance;
- (BOOL)isAppSyncing;
- (BOOL)isAutoSyncing;
- (BOOL)isRestoringFromICloud;
- (BOOL)isSyncing;
- (BOOL)isWirelessSyncing;
- (SBModelessSyncController)init;
- (void)_appSyncStateChanged;
- (void)_beginObservingICloudRestoreStatus;
- (void)_endObservingICloudRestoreStatus;
- (void)_iCloudStatusChanged;
- (void)_setAppSyncState:(BOOL)a3;
- (void)_updateIconsForStateChange;
- (void)beginMonitoring;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)connectionWasInterrupted:(id)a3;
- (void)dealloc;
- (void)endMonitoring;
- (void)gotLowBatteryWarning;
- (void)setIsSyncing:(BOOL)a3;
@end

@implementation SBModelessSyncController

- (SBModelessSyncController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBModelessSyncController;
  v2 = [(SBModelessSyncController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBModelessSyncController *)v2 _appSyncStateChanged];
  }
  return v3;
}

- (void)dealloc
{
  [(SBModelessSyncController *)self endMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)SBModelessSyncController;
  [(SBModelessSyncController *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_181);
  }
  v2 = (void *)sharedInstance___instance_6;
  return v2;
}

uint64_t __42__SBModelessSyncController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBModelessSyncController);
  v1 = (void *)sharedInstance___instance_6;
  sharedInstance___instance_6 = (uint64_t)v0;

  return kdebug_trace();
}

- (void)setIsSyncing:(BOOL)a3
{
  if (self->_isSyncing != a3)
  {
    self->_isSyncing = a3;
    objc_super v3 = @"kSBSyncSessionEnded";
    if (a3) {
      objc_super v3 = @"kSBSyncSessionBegan";
    }
    v4 = (void *)MEMORY[0x1E4F28EB8];
    objc_super v5 = v3;
    id v6 = [v4 defaultCenter];
    [v6 postNotificationName:v5 object:0 userInfo:0];
  }
}

- (BOOL)isAutoSyncing
{
  return self->_isSyncing && self->_isAutoSyncing;
}

- (BOOL)isWirelessSyncing
{
  return self->_isSyncing && self->_isWirelessSyncing;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"Enabled"];
  uint64_t v7 = [v6 BOOLValue];

  v8 = [v5 objectForKey:@"AutoSync"];
  char v9 = [v8 BOOLValue];

  v10 = [v5 objectForKey:@"Wireless"];

  LOBYTE(v5) = [v10 BOOLValue];
  [(SBModelessSyncController *)self setIsSyncing:v7];
  self->_isAutoSyncing = v9;
  self->_isWirelessSyncing = (char)v5;
}

- (void)connectionWasInterrupted:(id)a3
{
}

- (void)beginMonitoring
{
  [(SBModelessSyncController *)self _beginObservingICloudRestoreStatus];
  if (!self->_syncRegistrationToken)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__SBModelessSyncController_beginMonitoring__block_invoke;
    handler[3] = &unk_1E6AF5558;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.atc.wsyncnotify", &self->_syncRegistrationToken, MEMORY[0x1E4F14428], handler);
  }
  objc_super v3 = (ATConnection *)objc_alloc_init(MEMORY[0x1E4F4A2B8]);
  airTrafficConnection = self->_airTrafficConnection;
  self->_airTrafficConnection = v3;

  [(ATConnection *)self->_airTrafficConnection setDelegate:self];
  [(ATConnection *)self->_airTrafficConnection registerForStatus];
}

uint64_t __43__SBModelessSyncController_beginMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appSyncStateChanged];
}

- (void)endMonitoring
{
  [(SBModelessSyncController *)self _endObservingICloudRestoreStatus];
  int syncRegistrationToken = self->_syncRegistrationToken;
  if (syncRegistrationToken)
  {
    notify_cancel(syncRegistrationToken);
    self->_int syncRegistrationToken = 0;
  }
  [(ATConnection *)self->_airTrafficConnection setDelegate:0];
  airTrafficConnection = self->_airTrafficConnection;
  self->_airTrafficConnection = 0;
}

- (void)gotLowBatteryWarning
{
}

- (void)_appSyncStateChanged
{
  uint64_t state64 = 0;
  notify_get_state(self->_syncRegistrationToken, &state64);
  [(SBModelessSyncController *)self _setAppSyncState:state64 != 0];
}

- (void)_setAppSyncState:(BOOL)a3
{
  if (self->_isAppSyncing != a3)
  {
    self->_isAppSyncing = a3;
    v4 = @"kSBWirelessAppSyncEnded";
    if (a3) {
      v4 = @"kSBWirelessAppSyncBegan";
    }
    id v5 = (void *)MEMORY[0x1E4F28EB8];
    id v6 = v4;
    uint64_t v7 = [v5 defaultCenter];
    [v7 postNotificationName:v6 object:0 userInfo:0];

    if (!self->_isAppSyncing)
    {
      [(SBModelessSyncController *)self _updateIconsForStateChange];
    }
  }
}

- (void)_updateIconsForStateChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[SBIconController sharedInstance];
  objc_super v3 = [v2 model];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = objc_msgSend(v3, "leafIcons", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 hasApplicationPlaceholder]) {
          [v9 noteExternalApplicationPlaceholderStateChange];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isRestoringFromICloud
{
  return self->_restoringFromICloud;
}

- (void)_iCloudStatusChanged
{
  uint64_t state64 = 0;
  notify_get_state(self->_iCloudRestoreToken, &state64);
  uint64_t v3 = state64 - 1;
  BOOL v4 = state64 - 1 < 2;
  if (self->_restoringFromICloud != v4)
  {
    self->_restoringFromICloud = v4;
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = v5;
    if (v3 >= 2) {
      uint64_t v7 = @"SBICloudRestoreDidEndNotification";
    }
    else {
      uint64_t v7 = @"SBICloudRestoreDidBeginNotification";
    }
    [v5 postNotificationName:v7 object:0];
  }
}

- (void)_beginObservingICloudRestoreStatus
{
  uint64_t v3 = (const char *)[(id)*MEMORY[0x1E4F78040] UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __62__SBModelessSyncController__beginObservingICloudRestoreStatus__block_invoke;
  handler[3] = &unk_1E6AF5558;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_iCloudRestoreToken, MEMORY[0x1E4F14428], handler);
  [(SBModelessSyncController *)self _iCloudStatusChanged];
}

uint64_t __62__SBModelessSyncController__beginObservingICloudRestoreStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _iCloudStatusChanged];
}

- (void)_endObservingICloudRestoreStatus
{
  self->_iCloudRestoreToken = -1;
}

- (BOOL)isAppSyncing
{
  return self->_isAppSyncing;
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void).cxx_destruct
{
}

@end