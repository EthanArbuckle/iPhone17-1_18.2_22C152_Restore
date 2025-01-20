@interface WBSCloudBookmarksMigrationCoordinator
- (BOOL)isMigrationEnabled;
- (WBSCloudBookmarksMigrationCoordinator)init;
- (WBSCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3 localDataProvider:(id)a4;
- (WBSCloudBookmarksMigrationCoordinatorLocalDataProvider)localDataProvider;
- (WBSLogger)keyActionsLogger;
- (WBSSafariBookmarksSyncAgentProtocol)syncAgent;
- (void)_beginMigrationIfPossible;
- (void)_considerOverridingOtherMigratingDevice;
- (void)_determineCourseOfActionFromRemoteMigrationState;
- (void)_determineCourseOfActionFromSyncAgentMigrationState;
- (void)_logErrorAsKeyAction:(id)a3;
- (void)_logKeyAction:(id)a3;
- (void)setKeyActionsLogger:(id)a3;
- (void)setMigrationEnabled:(BOOL)a3;
- (void)startCoordinatingMigration;
@end

@implementation WBSCloudBookmarksMigrationCoordinator

- (void)setKeyActionsLogger:(id)a3
{
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_cold_1(v7, v6);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_13;
    v10[3] = &unk_1E5C8CF50;
    v10[4] = v8;
    v10[5] = a2;
    dispatch_async(v9, v10);
  }
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Error fetching remote migration state: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_determineCourseOfActionFromRemoteMigrationState
{
  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Requesting remote migration state from sync agent", buf, 2u);
  }
  syncAgent = self->_syncAgent;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke;
  v5[3] = &unk_1E5C8CFA0;
  v5[4] = self;
  [(WBSSafariBookmarksSyncAgentProtocol *)syncAgent fetchRemoteMigrationStateWithCompletionHandler:v5];
}

- (void)_determineCourseOfActionFromSyncAgentMigrationState
{
  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Requesting local migration state from data provider", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataProvider);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke;
  v5[3] = &unk_1E5C8CF78;
  v5[4] = self;
  [WeakRetained getLocalMigrationStateForMigrationCoordinator:self completionHandler:v5];
}

- (void)startCoordinatingMigration
{
  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.opaque[0]) = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Starting migration coordination", (uint8_t *)&buf, 2u);
  }
  v4 = _os_activity_create(&dword_1A6B5F000, "Start coordinating migration in UI process", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v4, &buf);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudBookmarksMigrationCoordinator_startCoordinatingMigration__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_async(processingQueue, block);
  os_activity_scope_leave(&buf);
}

void __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke_2(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v2 = *(void **)(a1 + 32);
      [v2 _logKeyAction:@"Could not open the database to check the state; do not migrate"];
      break;
    case 0:
      v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)os_activity_scope_state_s buf = 0;
        _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Sync agent is idle; consulting remote migration state to determine what to do",
          buf,
          2u);
      }
      [*(id *)(a1 + 32) _determineCourseOfActionFromRemoteMigrationState];
      v4 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Notifying the agent to periodically check the remote migration state", v9, 2u);
      }
      [*(id *)(*(void *)(a1 + 32) + 8) observeRemoteMigrationStateForSecondaryMigration];
      break;
    case 1:
      int v5 = *(void **)(a1 + 32);
      id v6 = @"Resuming migration because sync agent claims we are already responsible for migration";
      goto LABEL_12;
    case 2:
      int v5 = *(void **)(a1 + 32);
      id v6 = @"Trying to resume local-only local migration";
LABEL_12:
      [v5 _logKeyAction:v6];
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
      [v7 beginMigrationFromDAV];
      break;
    case 3:
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Not migrating because sync agent claims migration is already finished", v11, 2u);
      }
      break;
    default:
      return;
  }
}

uint64_t __61__WBSCloudBookmarksMigrationCoordinator_setMigrationEnabled___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 40))
  {
    *(unsigned char *)(v2 + 40) = v1;
    result = *(void *)(result + 32);
    if (*(unsigned char *)(result + 40))
    {
      if (*(void *)(result + 32) == 2) {
        return [(id)result startCoordinatingMigration];
      }
    }
  }
  return result;
}

uint64_t __67__WBSCloudBookmarksMigrationCoordinator_startCoordinatingMigration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[40])
  {
    return [v2 _determineCourseOfActionFromSyncAgentMigrationState];
  }
  else
  {
    uint64_t result = [v2 _logKeyAction:@"Not migrating because migration is disabled"];
    *(void *)(*(void *)(a1 + 32) + 32) = 2;
  }
  return result;
}

void __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke_2;
  v4[3] = &unk_1E5C8CF50;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

- (void)setMigrationEnabled:(BOOL)a3
{
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WBSCloudBookmarksMigrationCoordinator_setMigrationEnabled___block_invoke;
  v4[3] = &unk_1E5C8CF28;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(processingQueue, v4);
}

- (WBSCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3 localDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCloudBookmarksMigrationCoordinator;
  v9 = [(WBSCloudBookmarksMigrationCoordinator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncAgent, a3);
    objc_storeWeak((id *)&v10->_localDataProvider, v8);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SafariShared.WBSCloudBookmarksMigrationCoordinatorProcessingQueue", 0);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v11;

    v10->_migrationEnabled = 1;
    v13 = v10;
  }

  return v10;
}

- (WBSCloudBookmarksMigrationCoordinator)init
{
  return 0;
}

- (WBSSafariBookmarksSyncAgentProtocol)syncAgent
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__WBSCloudBookmarksMigrationCoordinator_syncAgent__block_invoke;
  v5[3] = &unk_1E5C8CF00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSSafariBookmarksSyncAgentProtocol *)v3;
}

void __50__WBSCloudBookmarksMigrationCoordinator_syncAgent__block_invoke(uint64_t a1)
{
}

- (BOOL)isMigrationEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__WBSCloudBookmarksMigrationCoordinator_isMigrationEnabled__block_invoke;
  v5[3] = &unk_1E5C8CF00;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__WBSCloudBookmarksMigrationCoordinator_isMigrationEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_logKeyAction:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(WBSLogger *)self->_keyActionsLogger logMessage:v4];
}

- (void)_logErrorAsKeyAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[WBSCloudBookmarksMigrationCoordinator _logErrorAsKeyAction:]((uint64_t)v4, v5);
  }
  [(WBSLogger *)self->_keyActionsLogger logMessage:v4];
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_13(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_13_cold_1(v2);
      }
      break;
    case 0:
      char v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)os_activity_scope_state_s buf = 0;
        _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_DEFAULT, "Remote migration state indicates migration has not happened yet", buf, 2u);
      }
      [*(id *)(a1 + 32) _beginMigrationIfPossible];
      break;
    case 1:
      id v4 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_DEFAULT, "Remote migration state indicates someone else is migrating", v6, 2u);
      }
      [*(id *)(a1 + 32) _considerOverridingOtherMigratingDevice];
      break;
    case 2:
      [*(id *)(a1 + 32) _logKeyAction:@"Remote migration state indicates migration is done; triggering local migration"];
      BOOL v5 = *(void **)(*(void *)(a1 + 32) + 8);
      [v5 beginMigrationFromDAV];
      break;
    default:
      return;
  }
}

- (void)_considerOverridingOtherMigratingDevice
{
}

- (void)_beginMigrationIfPossible
{
  if (self->_didDetermineReadyToMigrate)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v11 = 0;
    char v3 = "Not doing anything since there was no change in migration readiness";
    id v4 = (uint8_t *)&v11;
    BOOL v5 = v2;
    goto LABEL_4;
  }
  self->_didDetermineReadyToMigrate = 1;
  id v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_activity_scope_state_s buf = 0;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_DEFAULT, "Decided migration is possible", buf, 2u);
  }
  BOOL migrationEnabled = self->_migrationEnabled;
  char v9 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (migrationEnabled)
  {
    if (v10)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Requesting migration from sync agent", v12, 2u);
    }
    [(WBSSafariBookmarksSyncAgentProtocol *)self->_syncAgent beginMigrationFromDAV];
  }
  else if (v10)
  {
    __int16 v13 = 0;
    char v3 = "Not migrating since migration has been disabled";
    id v4 = (uint8_t *)&v13;
    BOOL v5 = v9;
LABEL_4:
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
  }
}

- (WBSCloudBookmarksMigrationCoordinatorLocalDataProvider)localDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataProvider);
  return (WBSCloudBookmarksMigrationCoordinatorLocalDataProvider *)WeakRetained;
}

- (WBSLogger)keyActionsLogger
{
  return self->_keyActionsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyActionsLogger, 0);
  objc_destroyWeak((id *)&self->_localDataProvider);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_syncAgent, 0);
}

- (void)_logErrorAsKeyAction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_13_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Server is in an invalid migration state; not doing anything",
    v1,
    2u);
}

@end