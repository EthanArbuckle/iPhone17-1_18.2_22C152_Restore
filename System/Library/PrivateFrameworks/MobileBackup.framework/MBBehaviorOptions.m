@interface MBBehaviorOptions
+ (MBBehaviorOptions)sharedOptions;
- (BOOL)_getBoolOptionForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)cancelBackupDuringJournalReplay;
- (BOOL)d2dTransferUSBOnly;
- (BOOL)d2dTransferUseCompression;
- (BOOL)flushLogMessages;
- (BOOL)isAutomation;
- (BOOL)shouldKeepFileSystemSnapshotAfterBackupFailure;
- (BOOL)shouldKeepFileSystemSnapshotAfterBackupSuccess;
- (BOOL)shouldTriggerDeviceRecordOpLockFailureInBackupCommit;
- (BOOL)snapshotAfterForegroundRestore;
- (BOOL)sqlTrace;
- (BOOL)useABC;
- (BOOL)useBackgroundOperationsForBackup;
- (BOOL)usePowerLog;
- (BOOL)useRestoreOperationLog;
- (BOOL)useSandboxCKContainer;
- (BOOL)validateSignatureOnRestoreWithDefaultValue:(BOOL)a3;
- (BOOL)verifySnapshotAfterCommit;
- (BOOL)warnForLateiTunesBackups;
- (MBBehaviorOptions)init;
- (NSMutableDictionary)cachedPrefs;
- (NSNumber)dryRestoreGBAllowance;
- (NSNumber)dryRestoreInterval;
- (NSNumber)shouldRestoreFromLegacySnapshotFormat;
- (NSNumber)shouldVerifyRestore;
- (NSString)addRepairDomainToMBCKDevice;
- (NSString)backupPathsToFailVerifyingRegex;
- (NSString)cloudKitContainerName;
- (NSString)domainsToBackUpRegex;
- (NSString)domainsToSendInvalidChecksumRegex;
- (NSString)engineStateToCancelBackupAfter;
- (NSString)engineStateToCancelRestoreAfter;
- (NSString)minimumBuildVersionForFullBackup;
- (NSString)plistPath;
- (NSString)requiredRestoreSnapshotFormatString;
- (NSString)restoreAssetIDsToFailFetchingRegex;
- (NSString)restorePathsToFailPlacingRegex;
- (NSString)restorePathsToFailVerifyingRegex;
- (NSString)snapshotFormatString;
- (OS_dispatch_queue)cachedPrefsQueue;
- (double)SQLiteSpaceSavingsThresholdWithDefaultValue:(double)a3;
- (double)_getDoubleOptionForKey:(id)a3 defaultValue:(double)a4;
- (double)sqlBatchTime;
- (id)_behaviorOptionForKey:(id)a3;
- (id)_behaviorOptionForTopLevelKey:(id)a3;
- (id)_getArrayOptionForKey:(id)a3 defaultValue:(id)a4;
- (id)_getNumberOptionForKey:(id)a3;
- (id)_getStringOptionForKey:(id)a3 defaultValue:(id)a4;
- (id)_getStringOptionLockedForKey:(id)a3 defaultValue:(id)a4;
- (int)_getIntOptionForKey:(id)a3 defaultValue:(int)a4;
- (int)d2dTransferLargeFileBufferKilobytes;
- (int)d2dTransferLargeFileMaxTasks;
- (int)d2dTransferSmallFileMaxTasks;
- (int)maxBatchDeleteConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3;
- (int)maxBatchFetchConcurrentFetchRecordsOperationsWithDefaultValue:(int)a3;
- (int)maxBatchSaveConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3;
- (int)maxConcurrentRestoreDomainOperations;
- (int)sqlBatchCount;
- (int)validateFileEncodingWithDefaultValue:(int)a3;
- (int64_t)manifestPageSize;
- (int64_t)maxBatchCount;
- (int64_t)maxBatchFetchAssetSize;
- (int64_t)maxBatchSaveAssetSize;
- (int64_t)maxBatchSize;
- (int64_t)recordSaveAttempts;
- (unint64_t)numberOfRecordsToFetchBeforeCancellingPrivilegedSnapshotDownload;
- (void)_setPref:(id)a3 forKey:(id)a4;
- (void)_startListeningForNotifications;
- (void)setCachedPrefs:(id)a3;
- (void)setCachedPrefsQueue:(id)a3;
- (void)setDryRestoreGBAllowance:(id)a3;
- (void)setDryRestoreInterval:(id)a3;
- (void)setFlushLogMessages:(BOOL)a3;
- (void)setMinimumBuildVersionForFullBackup:(id)a3;
- (void)setShouldKeepFileSystemSnapshotAfterBackupSuccess:(BOOL)a3;
- (void)setSnapshotAfterForegroundRestore:(BOOL)a3;
- (void)setSnapshotFormatString:(id)a3;
- (void)setUseABC:(BOOL)a3;
- (void)setUseBackgroundOperationsForBackup:(BOOL)a3;
- (void)setWarnForLateiTunesBackups:(BOOL)a3;
@end

@implementation MBBehaviorOptions

- (void)_startListeningForNotifications
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke;
  v7[3] = &unk_1E6D011C0;
  v7[4] = self;
  v2 = (void *)MEMORY[0x1E01C2CF0](v7, a2);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_2;
  v5[3] = &unk_1E6D012D8;
  id v6 = v2;
  uint64_t v3 = _startListeningForNotifications_once;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&_startListeningForNotifications_once, v5);
  }
}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD9AE000, v2, OS_LOG_TYPE_INFO, "Looks like our prefs changed. Reloading.", buf, 2u);
    _MBLog(@"INFO", (uint64_t)"Looks like our prefs changed. Reloading.", v3, v4, v5, v6, v7, v8, v19);
  }

  CFPreferencesSynchronize(@"com.apple.MobileBackup.BehaviorOptions", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  *(void *)buf = 0;
  v25 = buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  v9 = [*(id *)(a1 + 32) cachedPrefsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_159;
  block[3] = &unk_1E6D012B0;
  block[4] = *(void *)(a1 + 32);
  block[5] = buf;
  dispatch_sync(v9, block);

  v10 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = objc_msgSend(*((id *)v25 + 5), "allKeys", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v16 = [*((id *)v25 + 5) objectForKeyedSubscript:v15];
        v17 = [*(id *)(a1 + 32) _behaviorOptionForKey:v15];
        char v18 = [v16 isEqual:v17];

        if ((v18 & 1) == 0) {
          [v10 addObject:v15];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(buf, 8);
}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_159(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedPrefs];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) cachedPrefs];
  [v6 removeAllObjects];
}

void __52__MBBehaviorOptions__startListeningForNotifications__block_invoke_2(uint64_t a1)
{
  v2 = dispatch_get_global_queue(17, 0);
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &_startListeningForNotifications_token, v2, *(notify_handler_t *)(a1 + 32));

  notify_register_dispatch("com.apple.mobilebackup.BehaviorOptionDidChange", &_startListeningForNotifications_token2, v2, *(notify_handler_t *)(a1 + 32));
}

- (MBBehaviorOptions)init
{
  v12.receiver = self;
  v12.super_class = (Class)MBBehaviorOptions;
  v2 = [(MBBehaviorOptions *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedPrefs = v2->_cachedPrefs;
    v2->_cachedPrefs = (NSMutableDictionary *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mobilebackup.behavioroptions", v5);
    cachedPrefsQueue = v2->_cachedPrefsQueue;
    v2->_cachedPrefsQueue = (OS_dispatch_queue *)v6;

    [(MBBehaviorOptions *)v2 _startListeningForNotifications];
    CFPreferencesSynchronize(@"com.apple.MobileBackup.BehaviorOptions", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v8 = [@"com.apple.MobileBackup.BehaviorOptions" stringByAppendingPathExtension:@"plist"];
    uint64_t v9 = [@"/var/mobile/Library/Preferences" stringByAppendingPathComponent:v8];
    plistPath = v2->_plistPath;
    v2->_plistPath = (NSString *)v9;
  }
  return v2;
}

+ (MBBehaviorOptions)sharedOptions
{
  if (sharedOptions_onceToken != -1) {
    dispatch_once(&sharedOptions_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedOptions_sSharedOptions;
  return (MBBehaviorOptions *)v2;
}

uint64_t __34__MBBehaviorOptions_sharedOptions__block_invoke()
{
  sharedOptions_sSharedOptions = objc_alloc_init(MBBehaviorOptions);
  return MEMORY[0x1F41817F8]();
}

- (id)_behaviorOptionForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBBehaviorOptions *)self _behaviorOptionForTopLevelKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = (void *)CFPreferencesCopyValue(@"BehaviorOptions", @"com.apple.MobileBackup.BehaviorOptions", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v7 = [v7 objectForKeyedSubscript:v4];
    }
    id v6 = v7;
  }
  return v6;
}

- (id)_behaviorOptionForTopLevelKey:(id)a3
{
  uint64_t v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.MobileBackup.BehaviorOptions", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v3;
}

- (void)_setPref:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MBBehaviorOptions *)self cachedPrefsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MBBehaviorOptions__setPref_forKey___block_invoke;
  block[3] = &unk_1E6D01300;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);

  notify_post("com.apple.mobilebackup.BehaviorOptionDidChange");
}

void __37__MBBehaviorOptions__setPref_forKey___block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(*(CFStringRef *)(a1 + 32), *(CFPropertyListRef *)(a1 + 40), @"com.apple.MobileBackup.BehaviorOptions", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(@"com.apple.MobileBackup.BehaviorOptions", @"mobile", v2);
  id v3 = [*(id *)(a1 + 48) cachedPrefs];
  [v3 removeAllObjects];
}

- (id)_getNumberOptionForKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  uint64_t v5 = [(MBBehaviorOptions *)self cachedPrefsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MBBehaviorOptions__getNumberOptionForKey___block_invoke;
  block[3] = &unk_1E6D01328;
  id v12 = &v13;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(v5, block);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = 0;
  }
  else {
    id v7 = (void *)v14[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __44__MBBehaviorOptions__getNumberOptionForKey___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [*(id *)(a1 + 32) cachedPrefs];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _behaviorOptionForKey:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        long long v22 = [*(id *)(a1 + 32) cachedPrefs];
        [v22 setObject:v21 forKeyedSubscript:*(void *)(a1 + 40)];

        return;
      }
      id v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_ERROR, "For key %@, found value %@ which was not a NSNumber.  Ignoring.", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"For key %@, found value %@ which was not a NSNumber.  Ignoring.", v12, v13, v14, v15, v16, v17, *(void *)(a1 + 40));
      }
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    goto LABEL_8;
  }
}

- (BOOL)_getBoolOptionForKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = [(MBBehaviorOptions *)self _getNumberOptionForKey:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      a4 = [v5 BOOLValue];
    }
  }

  return a4;
}

- (int)_getIntOptionForKey:(id)a3 defaultValue:(int)a4
{
  uint64_t v5 = [(MBBehaviorOptions *)self _getNumberOptionForKey:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      a4 = [v5 intValue];
    }
  }

  return a4;
}

- (double)_getDoubleOptionForKey:(id)a3 defaultValue:(double)a4
{
  uint64_t v5 = [(MBBehaviorOptions *)self _getNumberOptionForKey:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v5 doubleValue];
      a4 = v6;
    }
  }

  return a4;
}

- (id)_getStringOptionLockedForKey:(id)a3 defaultValue:(id)a4
{
  id v5 = a3;
  double v6 = [(MBBehaviorOptions *)self cachedPrefs];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    uint64_t v8 = [(MBBehaviorOptions *)self _behaviorOptionForKey:v5];
    if (v8)
    {
      uint64_t v7 = (void *)v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 length])
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA98] null];

        uint64_t v7 = (void *)v9;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v10 = [(MBBehaviorOptions *)self cachedPrefs];
    [v10 setObject:v7 forKeyedSubscript:v5];
  }
  return v7;
}

- (id)_getStringOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint64_t v8 = [(MBBehaviorOptions *)self cachedPrefsQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__MBBehaviorOptions__getStringOptionForKey_defaultValue___block_invoke;
  v15[3] = &unk_1E6D01350;
  uint64_t v18 = &v19;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  dispatch_sync(v8, v15);

  uint64_t v11 = v10;
  if (v20[5])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v11 = v10;
    if ((isKindOfClass & 1) == 0) {
      uint64_t v11 = (void *)v20[5];
    }
  }
  id v13 = v11;

  _Block_object_dispose(&v19, 8);
  return v13;
}

uint64_t __57__MBBehaviorOptions__getStringOptionForKey_defaultValue___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _getStringOptionLockedForKey:*(void *)(a1 + 40) defaultValue:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)_getArrayOptionForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v8 = [(MBBehaviorOptions *)self cachedPrefsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MBBehaviorOptions__getArrayOptionForKey_defaultValue___block_invoke;
  block[3] = &unk_1E6D01328;
  id v16 = &v17;
  void block[4] = self;
  id v9 = v6;
  id v15 = v9;
  dispatch_sync(v8, block);

  id v10 = v7;
  if (v18[5])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = v7;
    if ((isKindOfClass & 1) == 0) {
      id v10 = (void *)v18[5];
    }
  }
  id v12 = v10;

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __56__MBBehaviorOptions__getArrayOptionForKey_defaultValue___block_invoke(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) cachedPrefs];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _behaviorOptionForTopLevelKey:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = [*(id *)(a1 + 32) cachedPrefs];
    [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (NSString)cloudKitContainerName
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"CloudKitContainer" defaultValue:@"com.apple.backup.ios"];
}

- (int64_t)maxBatchCount
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxBatchCount" defaultValue:100];
}

- (int64_t)maxBatchSize
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxBatchSize" defaultValue:1572864];
}

- (int64_t)maxBatchSaveAssetSize
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"maxBatchSaveAssetSize" defaultValue:125829120];
}

- (int)maxBatchSaveConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxBatchSaveConcurrentModifyRecordsOperations" defaultValue:*(void *)&a3];
}

- (int)maxBatchDeleteConcurrentModifyRecordsOperationsWithDefaultValue:(int)a3
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxBatchDeleteConcurrentModifyRecordsOperations" defaultValue:*(void *)&a3];
}

- (int)maxBatchFetchConcurrentFetchRecordsOperationsWithDefaultValue:(int)a3
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxBatchFetchConcurrentFetchRecordsOperations" defaultValue:*(void *)&a3];
}

- (int64_t)maxBatchFetchAssetSize
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"maxBatchFetchAssetSize" defaultValue:125829120];
}

- (int64_t)recordSaveAttempts
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"RecordSaveAttempts" defaultValue:2];
}

- (BOOL)sqlTrace
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"SQLTrace" defaultValue:0];
}

- (int64_t)manifestPageSize
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"ManifestPageSize" defaultValue:5000];
}

- (int)sqlBatchCount
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"SQLBatchCount" defaultValue:5000];
}

- (double)sqlBatchTime
{
  [(MBBehaviorOptions *)self _getDoubleOptionForKey:@"SQLBatchTime" defaultValue:5.0];
  return result;
}

- (BOOL)useBackgroundOperationsForBackup
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"UseBackgroundOperationsForBackupKey" defaultValue:0];
}

- (void)setUseBackgroundOperationsForBackup:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(MBBehaviorOptions *)self _setPref:v4 forKey:@"UseBackgroundOperationsForBackupKey"];
}

- (NSString)minimumBuildVersionForFullBackup
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"MinimumBuildVersionForFullBackupKey" defaultValue:0];
}

- (void)setMinimumBuildVersionForFullBackup:(id)a3
{
}

- (BOOL)shouldKeepFileSystemSnapshotAfterBackupSuccess
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"KeepDailySnapshots" defaultValue:0];
}

- (void)setShouldKeepFileSystemSnapshotAfterBackupSuccess:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(MBBehaviorOptions *)self _setPref:v4 forKey:@"KeepDailySnapshots"];
}

- (BOOL)shouldKeepFileSystemSnapshotAfterBackupFailure
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"KeepFileSystemSnapshotAfterBackupFailure" defaultValue:0];
}

- (BOOL)snapshotAfterForegroundRestore
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"SnapshotAfterForegroundRestore" defaultValue:0];
}

- (void)setSnapshotAfterForegroundRestore:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(MBBehaviorOptions *)self _setPref:v4 forKey:@"SnapshotAfterForegroundRestore"];
}

- (BOOL)usePowerLog
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"UsePowerLog" defaultValue:1];
}

- (BOOL)useABC
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"UseABC" defaultValue:1];
}

- (void)setUseABC:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(MBBehaviorOptions *)self _setPref:v4 forKey:@"UseABC"];
}

- (double)SQLiteSpaceSavingsThresholdWithDefaultValue:(double)a3
{
  [(MBBehaviorOptions *)self _getDoubleOptionForKey:@"SQLiteSpaceSavingsThreshold" defaultValue:a3];
  return result;
}

- (BOOL)validateSignatureOnRestoreWithDefaultValue:(BOOL)a3
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"ValidateSignatureOnRestore" defaultValue:a3];
}

- (int)validateFileEncodingWithDefaultValue:(int)a3
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"ValidateFileEncoding" defaultValue:*(void *)&a3];
}

- (BOOL)useRestoreOperationLog
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"UseRestoreOperationLog" defaultValue:0];
}

- (unint64_t)numberOfRecordsToFetchBeforeCancellingPrivilegedSnapshotDownload
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"RecordsToFetchBeforeCancellingPrivilegedSnapshotDownload" defaultValue:0xFFFFFFFFLL];
}

- (BOOL)cancelBackupDuringJournalReplay
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"CancelBackupDuringJournalReplay" defaultValue:0];
}

- (NSString)engineStateToCancelBackupAfter
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"CancelBackupAfterEngineState" defaultValue:0];
}

- (NSString)engineStateToCancelRestoreAfter
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"CancelRestoreAfterEngineState" defaultValue:0];
}

- (BOOL)shouldTriggerDeviceRecordOpLockFailureInBackupCommit
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"ShouldTriggerDeviceRecordOpLockFailureInBackupCommit" defaultValue:0];
}

- (NSString)addRepairDomainToMBCKDevice
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"AddRepairDomainToMBCKDevice" defaultValue:0];
}

- (NSString)domainsToBackUpRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"DomainsToBackUpRegex" defaultValue:0];
}

- (NSString)domainsToSendInvalidChecksumRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"DomainsToSendInvalidChecksumRegex" defaultValue:0];
}

- (NSString)restoreAssetIDsToFailFetchingRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"RestoreAssetIDsToFailFetchingRegex" defaultValue:0];
}

- (NSString)restorePathsToFailPlacingRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"RestorePathsToFailPlacingRegex" defaultValue:0];
}

- (NSString)restorePathsToFailVerifyingRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"RestorePathsToFailVerifyingRegex" defaultValue:0];
}

- (NSString)backupPathsToFailVerifyingRegex
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"BackupPathsToFailVerifyingRegex" defaultValue:0];
}

- (BOOL)verifySnapshotAfterCommit
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"VerifySnapshotAfterCommit" defaultValue:0];
}

- (NSNumber)shouldVerifyRestore
{
  return (NSNumber *)[(MBBehaviorOptions *)self _getNumberOptionForKey:@"VerifyRestore"];
}

- (BOOL)useSandboxCKContainer
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"UseSandboxCKContainer" defaultValue:0];
}

- (NSString)snapshotFormatString
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"SnapshotFormat" defaultValue:0];
}

- (void)setSnapshotFormatString:(id)a3
{
}

- (NSNumber)shouldRestoreFromLegacySnapshotFormat
{
  return (NSNumber *)[(MBBehaviorOptions *)self _getNumberOptionForKey:@"ShouldRestoreLegacySnapshotFormat"];
}

- (NSString)requiredRestoreSnapshotFormatString
{
  return (NSString *)[(MBBehaviorOptions *)self _getStringOptionForKey:@"RequiredRestoreSnapshotFormat" defaultValue:0];
}

- (BOOL)isAutomation
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"IsAutomation" defaultValue:0];
}

- (int)maxConcurrentRestoreDomainOperations
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"MaxConcurrentRestoreDomainOperations" defaultValue:8];
}

- (NSNumber)dryRestoreInterval
{
  return (NSNumber *)[(MBBehaviorOptions *)self _getNumberOptionForKey:@"DryRestoreInterval"];
}

- (void)setDryRestoreInterval:(id)a3
{
}

- (NSNumber)dryRestoreGBAllowance
{
  return (NSNumber *)[(MBBehaviorOptions *)self _getNumberOptionForKey:@"DryRestoreGBAllowance"];
}

- (void)setDryRestoreGBAllowance:(id)a3
{
}

- (BOOL)d2dTransferUseCompression
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"D2DUseCompression" defaultValue:1];
}

- (BOOL)d2dTransferUSBOnly
{
  return [(MBBehaviorOptions *)self _getBoolOptionForKey:@"D2DUSBOnly" defaultValue:0];
}

- (int)d2dTransferSmallFileMaxTasks
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"D2DSmallFileMaxTasks" defaultValue:3];
}

- (int)d2dTransferLargeFileMaxTasks
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"D2DLargeFileMaxTasks" defaultValue:5];
}

- (int)d2dTransferLargeFileBufferKilobytes
{
  return [(MBBehaviorOptions *)self _getIntOptionForKey:@"D2DLargeFileBufferKB" defaultValue:1024];
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (BOOL)warnForLateiTunesBackups
{
  return self->_warnForLateiTunesBackups;
}

- (void)setWarnForLateiTunesBackups:(BOOL)a3
{
  self->_warnForLateiTunesBackups = a3;
}

- (NSMutableDictionary)cachedPrefs
{
  return self->_cachedPrefs;
}

- (void)setCachedPrefs:(id)a3
{
}

- (OS_dispatch_queue)cachedPrefsQueue
{
  return self->_cachedPrefsQueue;
}

- (void)setCachedPrefsQueue:(id)a3
{
}

- (BOOL)flushLogMessages
{
  return self->_flushLogMessages;
}

- (void)setFlushLogMessages:(BOOL)a3
{
  self->_flushLogMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrefsQueue, 0);
  objc_storeStrong((id *)&self->_cachedPrefs, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

@end