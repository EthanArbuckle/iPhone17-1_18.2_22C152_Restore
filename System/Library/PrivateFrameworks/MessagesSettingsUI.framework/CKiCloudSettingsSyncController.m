@interface CKiCloudSettingsSyncController
- (BOOL)isMiCEnabled;
- (BOOL)isSyncing;
- (BOOL)micAccountsMatch;
- (CKiCloudSettingsSyncController)initWithSyncStatusHandler:(id)a3;
- (NSString)syncSummary;
- (id)_syncSummaryForSyncState:(id)a3;
- (id)syncStatusHandler;
- (unint64_t)messagesToUploadCount;
- (void)_prepareForInitialSyncState;
- (void)_wrapperInit;
- (void)cancelCurrentSync;
- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4;
- (void)setMessagesToUploadCount:(unint64_t)a3;
- (void)setSyncStatusHandler:(id)a3;
- (void)setSyncSummary:(id)a3;
- (void)setSyncing:(BOOL)a3;
- (void)startSync;
@end

@implementation CKiCloudSettingsSyncController

- (CKiCloudSettingsSyncController)initWithSyncStatusHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKiCloudSettingsSyncController;
  v5 = [(CKiCloudSettingsSyncController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x25A2A3750](v4);
    id syncStatusHandler = v5->_syncStatusHandler;
    v5->_id syncStatusHandler = (id)v6;

    [(CKiCloudSettingsSyncController *)v5 _wrapperInit];
  }

  return v5;
}

- (void)_wrapperInit
{
  v3 = [MEMORY[0x263F4A558] sharedInstance];
  [v3 setupIMCloudKitHooks];

  id v4 = [MEMORY[0x263F4A550] sharedInstance];
  [v4 addEventHandler:self];

  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "Sync controller did finish configuring IMCloudKit hooks.", v6, 2u);
    }
  }
  [(CKiCloudSettingsSyncController *)self _prepareForInitialSyncState];
}

- (void)_prepareForInitialSyncState
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F4A558] sharedInstance];
  uint64_t v4 = [v3 isSyncing];

  [(CKiCloudSettingsSyncController *)self setSyncing:v4];
  [(CKiCloudSettingsSyncController *)self setMessagesToUploadCount:0];
  v5 = [MEMORY[0x263F4A550] sharedInstance];
  uint64_t v6 = [v5 accountHasiMessageEnabled];

  v7 = IMCloudKitGetSyncStateDictionary();
  v8 = (void *)[objc_alloc(MEMORY[0x263F4A560]) initWithAccountEnabled:v6 stateDictionary:v7];
  if (IMOSLoggingEnabled())
  {
    objc_super v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      [v8 syncJobState];
      v10 = IMStringFromIMCloudKitSyncJobState();
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2561DD000, v9, OS_LOG_TYPE_INFO, "Preparing UI for initial sync state - syncJobState={%@}.", (uint8_t *)&v12, 0xCu);
    }
  }
  v11 = [(CKiCloudSettingsSyncController *)self syncStatusHandler];
  ((void (**)(void, void *))v11)[2](v11, v8);
}

- (void)startSync
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Messages"];
  v3 = [v2 objectForKey:@"hasFinishedNewDeviceBringUpSync"];
  int v4 = [v3 BOOLValue];
  v5 = @"Initial";
  if (v4) {
    v5 = @"UserInitiated";
  }
  uint64_t v6 = v5;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_2561DD000, v7, OS_LOG_TYPE_INFO, "Attempting to start {%@} sync now.", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [MEMORY[0x263F4A558] sharedInstance];
  [v8 initiateSync:v6 forceRunNow:1 reply:&__block_literal_global_1];
}

void __43__CKiCloudSettingsSyncController_startSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"NO";
      if (a2) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_2561DD000, v5, OS_LOG_TYPE_INFO, "Initiate sync replied with success={%@}", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)cancelCurrentSync
{
  if (![(CKiCloudSettingsSyncController *)self isSyncing] && IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2561DD000, v2, OS_LOG_TYPE_INFO, "Tried to cancel a sync via UI, but we are not syncing. Programming error.", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2561DD000, v3, OS_LOG_TYPE_INFO, "Attempting to cancelling ongoing sync.", v5, 2u);
    }
  }
  id v4 = [MEMORY[0x263F4A558] sharedInstance];
  [v4 cancelSync:&__block_literal_global_53];
}

void __51__CKiCloudSettingsSyncController_cancelCurrentSync__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = IMStringFromIMCloudKitSyncType();
      v5 = (void *)v4;
      uint64_t v6 = @"NO";
      if (a2) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_2561DD000, v3, OS_LOG_TYPE_INFO, "Canceling {%@} sync. success={%@}", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)isMiCEnabled
{
  v2 = [MEMORY[0x263F4A558] sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)micAccountsMatch
{
  v2 = [MEMORY[0x263F4A558] sharedInstance];
  char v3 = [v2 mocAccountsMatch];

  return v3;
}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKiCloudSettingsSyncController *)self syncStatusHandler];

  if (v8)
  {
    __int16 v9 = [v7 statistics];
    uint64_t v10 = [v9 remainingMessagesCount];
    uint64_t v11 = [v7 syncJobState];
    int v12 = IMStringFromIMCloudKitSyncJobState();
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = @"NO";
        *(_DWORD *)v18 = 138413058;
        if (v11) {
          uint64_t v14 = @"YES";
        }
        *(void *)&v18[4] = v14;
        __int16 v19 = 2112;
        v20 = v12;
        __int16 v21 = 2112;
        v22 = v9;
        __int16 v23 = 2048;
        uint64_t v24 = v10;
        _os_log_impl(&dword_2561DD000, v13, OS_LOG_TYPE_INFO, "syncStateDidChange – syncing={%@}, jobState={%@}, syncStatistics={%@}, messagesToUpload={%ld}", v18, 0x2Au);
      }
    }
    -[CKiCloudSettingsSyncController setSyncing:](self, "setSyncing:", v11 != 0, *(void *)v18);
    [(CKiCloudSettingsSyncController *)self setMessagesToUploadCount:v10];
    v15 = [(CKiCloudSettingsSyncController *)self _syncSummaryForSyncState:v7];
    [(CKiCloudSettingsSyncController *)self setSyncSummary:v15];

    v16 = [(CKiCloudSettingsSyncController *)self syncStatusHandler];
    ((void (**)(void, id))v16)[2](v16, v7);
  }
  else if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2561DD000, v17, OS_LOG_TYPE_INFO, "No callback block provided for syncStateDidChange. Programmer error.", v18, 2u);
    }
  }
}

- (id)_syncSummaryForSyncState:(id)a3
{
  [a3 syncJobState];
  char v3 = IMStringFromIMCloudKitSyncJobState();
  uint64_t v4 = [NSString stringWithFormat:@"[Internal]\nSync Job State:\n%@", v3];

  return v4;
}

- (BOOL)isSyncing
{
  return self->_syncing;
}

- (void)setSyncing:(BOOL)a3
{
  self->_syncing = a3;
}

- (unint64_t)messagesToUploadCount
{
  return self->_messagesToUploadCount;
}

- (void)setMessagesToUploadCount:(unint64_t)a3
{
  self->_messagesToUploadCount = a3;
}

- (NSString)syncSummary
{
  return self->_syncSummary;
}

- (void)setSyncSummary:(id)a3
{
}

- (id)syncStatusHandler
{
  return self->_syncStatusHandler;
}

- (void)setSyncStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncStatusHandler, 0);
  objc_storeStrong((id *)&self->_syncSummary, 0);
}

@end