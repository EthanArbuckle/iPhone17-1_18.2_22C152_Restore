@interface VCCKCoherenceSyncCoordinator
- (BOOL)deviceOSVersionNumber:(id)a3 isGreaterThanOrEqualTo:(id)a4;
- (BOOL)isStarted;
- (CKContainer)container;
- (VCCKApplicationStateObserver)applicationObserver;
- (VCCKCoherenceSyncCoordinator)initWithContainer:(id)a3 applicationObserver:(id)a4;
- (void)checkDeviceRecords;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)recordsContainIncompatibleDevice:(id)a3;
- (void)setContainer:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)start;
@end

@implementation VCCKCoherenceSyncCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)VCCKCoherenceSyncCoordinatorObserverContext == a6)
  {
    v7 = [(VCCKCoherenceSyncCoordinator *)self applicationObserver];
    int v8 = [v7 isApplicationVisible];

    if (v8)
    {
      [(VCCKCoherenceSyncCoordinator *)self checkDeviceRecords];
    }
  }
}

- (BOOL)deviceOSVersionNumber:(id)a3 isGreaterThanOrEqualTo:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  id v5 = a4;
  MEMORY[0x1C87C4730](v8, a3);
  memset(v7, 0, sizeof(v7));
  MEMORY[0x1C87C4730](v7, v5);

  return _LSVersionNumberCompare() != -1;
}

- (void)recordsContainIncompatibleDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Fetching device records", buf, 0xCu);
  }

  v6 = [(VCCKCoherenceSyncCoordinator *)self container];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke;
  v8[3] = &unk_1E6540A20;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(v6, "wf_fetchDeviceRecords:", v8);
}

void __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = 0;
    v8[1] = v8;
    _OWORD v8[2] = 0x2020000000;
    char v9 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke_2;
    v7[3] = &unk_1E65409F8;
    v7[4] = *(void *)(a1 + 32);
    v7[5] = v8;
    [v5 enumerateObjectsUsingBlock:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_object_dispose(v8, 8);
  }
}

void __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB7400]];
  int v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB7408]];
  char v9 = getWFCloudKitSyncLogObject();
  v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Device record doesn't contain OS type and/or OS version number, skipping record", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = [v6 modifiedByDevice];
      v14 = [v6 modificationDate];
      int v17 = 136316162;
      v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke_2";
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v7;
      __int16 v23 = 2112;
      v24 = v8;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_INFO, "%s Found device record: name: %@, os type: %@, os version: %@, modification date: %@", (uint8_t *)&v17, 0x34u);
    }
    uint64_t v15 = [&unk_1F22707F0 objectForKeyedSubscript:v7];
    if (v15)
    {
      v10 = v15;
      if (([*(id *)(a1 + 32) deviceOSVersionNumber:v8 isGreaterThanOrEqualTo:v15] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
      v16 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315138;
        v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Device record contains unknown OS type, skipping record", (uint8_t *)&v17, 0xCu);
      }

      v10 = 0;
    }
  }
}

- (void)checkDeviceRecords
{
  if ([MEMORY[0x1E4F1CB18] syncCoherenceEnabled]
    && ([MEMORY[0x1E4F1CB18] shouldSyncCoherence] & 1) == 0)
  {
    [(VCCKCoherenceSyncCoordinator *)self recordsContainIncompatibleDevice:&__block_literal_global_2688];
  }
}

void __50__VCCKCoherenceSyncCoordinator_checkDeviceRecords__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v4;
      id v6 = "%s Failed to fetch device records: %{public}@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_15:
      _os_log_impl(&dword_1C7D7E000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (a2)
  {
    id v5 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v11 = 136315138;
    uint64_t v12 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    id v6 = "%s Incompatible devices found, not enabling coherence sync";
LABEL_14:
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
    uint32_t v9 = 12;
    goto LABEL_15;
  }
  if (![MEMORY[0x1E4F1CB18] databaseCoherenceEnabled]
    || ![MEMORY[0x1E4F1CB18] syncCoherenceEnabled])
  {
    id v5 = getWFCloudKitSyncLogObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v11 = 136315138;
    uint64_t v12 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    id v6 = "%s All devices in user's sync circle have updated but coherence migration is disabled, not enabling coherence sync";
    goto LABEL_14;
  }
  v10 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s All devices in user's sync circle have updated, enabling coherence sync", (uint8_t *)&v11, 0xCu);
  }

  [MEMORY[0x1E4F1CB18] setShouldSyncCoherence:1];
LABEL_17:
}

- (void)start
{
  if (![(VCCKCoherenceSyncCoordinator *)self isStarted])
  {
    [(VCCKCoherenceSyncCoordinator *)self setStarted:1];
    v3 = [(VCCKCoherenceSyncCoordinator *)self applicationObserver];
    [v3 addObserver:self forKeyPath:@"applicationVisible" options:0 context:VCCKCoherenceSyncCoordinatorObserverContext];

    [(VCCKCoherenceSyncCoordinator *)self checkDeviceRecords];
  }
}

- (void)dealloc
{
  if ([(VCCKCoherenceSyncCoordinator *)self isStarted])
  {
    v3 = [(VCCKCoherenceSyncCoordinator *)self applicationObserver];
    [v3 removeObserver:self forKeyPath:@"applicationVisible" context:VCCKCoherenceSyncCoordinatorObserverContext];
  }
  v4.receiver = self;
  v4.super_class = (Class)VCCKCoherenceSyncCoordinator;
  [(VCCKCoherenceSyncCoordinator *)&v4 dealloc];
}

- (VCCKCoherenceSyncCoordinator)initWithContainer:(id)a3 applicationObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCCKCoherenceSyncCoordinator;
  uint32_t v9 = [(VCCKCoherenceSyncCoordinator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_applicationObserver, a4);
    int v11 = v10;
  }

  return v10;
}

@end