@interface WFCloudKitSyncSession
+ (BOOL)ignoresUserDeletedZoneErrors;
+ (BOOL)isSyncEnabled;
+ (BOOL)isWalrusEnabled;
+ (BOOL)isWalrusForcedEnabled;
+ (BOOL)needsDefaultShortcutUpdate;
+ (BOOL)voiceShortcutMigrationDidRun;
+ (BOOL)voiceShortcutMigrationDidSync;
+ (BOOL)zoneWasPurged;
+ (int64_t)currentDefaultShortcutsVersion;
+ (int64_t)defaultShortcutsVersion;
+ (int64_t)lastSyncedFlagsHash;
+ (int64_t)syncedFlagsHash;
+ (void)fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:(id)a3;
+ (void)initialize;
+ (void)resolveWalrusStatus;
+ (void)setDefaultShortcutsVersion:(int64_t)a3;
+ (void)setIgnoresUserDeletedZoneErrors:(BOOL)a3;
+ (void)setLastSyncedFlagsHash:(int64_t)a3;
+ (void)setSyncEnabled:(BOOL)a3;
+ (void)setVoiceShortcutMigrationDidRun:(BOOL)a3;
+ (void)setVoiceShortcutMigrationDidSync:(BOOL)a3;
+ (void)setWalrusEnabled:(BOOL)a3;
+ (void)setWalrusForcedEnabled:(BOOL)a3;
+ (void)setZoneWasPurged:(BOOL)a3;
@end

@implementation WFCloudKitSyncSession

+ (BOOL)isWalrusEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFWalrusEnabled"];

  return v3;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_914);
  }
}

+ (BOOL)zoneWasPurged
{
  v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFCloudKitSyncZoneWasPurged"];

  return v3;
}

void __35__WFCloudKitSyncSession_initialize__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  v2 = @"WFCloudKitSyncEnabled";
  v3[0] = MEMORY[0x1E4F1CC38];
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

+ (BOOL)isSyncEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFCloudKitSyncEnabled"];

  return v3;
}

+ (void)setWalrusEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a1 isWalrusEnabled] != a3)
  {
    v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    [v5 setBool:v3 forKey:@"WFWalrusGroundTruthEnabled"];

    v6 = getWFWalrusLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      v8 = "+[WFCloudKitSyncSession setWalrusEnabled:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Walrus ground truth status has changed to %d", (uint8_t *)&v7, 0x12u);
    }

    [a1 resolveWalrusStatus];
  }
}

+ (void)fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a1 needsDefaultShortcutUpdate];
  int v7 = [a1 voiceShortcutMigrationDidSync];
  int v8 = v7;
  if ((v6 & 1) != 0 || !v7)
  {
    __int16 v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "+[WFCloudKitSyncSession fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:]";
      __int16 v25 = 1026;
      int v26 = v6;
      __int16 v27 = 1026;
      int v28 = v8;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Fetching sync flags record from CloudKit, needsDefaultShortcutUpdate = %{public}d, voiceShortcutMigrationDidSync = %{public}d", buf, 0x18u);
    }

    if (!v5)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, a1, @"WFCloudKitSyncSession.m", 176, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
    }
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F19EC8], "wf_shortcutsContainer");
    id v11 = objc_alloc(MEMORY[0x1E4F1A320]);
    v12 = (void *)[v11 initWithZoneName:@"Shortcuts" ownerName:*MEMORY[0x1E4F19C08]];
    v13 = [WFCloudKitItemRequest alloc];
    v14 = [v10 privateCloudDatabase];
    v15 = [(WFCloudKitItemRequest *)v13 initWithContainer:v10 database:v14];

    v16 = +[WFCloudKitSyncFlags recordIDWithZoneID:v12];
    uint64_t v17 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__WFCloudKitSyncSession_fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E654CB90;
    id v21 = v5;
    id v22 = a1;
    id v18 = [(WFCloudKitItemRequest *)v15 fetchItemWithID:v16 itemType:v17 groupName:@"InitialSetup" properties:0 completionHandler:v20];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

void __80__WFCloudKitSyncSession_fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315906;
    BOOL v10 = "+[WFCloudKitSyncSession fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:]_block_invoke";
    __int16 v11 = 2050;
    uint64_t v12 = [v5 defaultShortcutsVersion];
    __int16 v13 = 1026;
    int v14 = [v5 migratedVoiceShortcuts];
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished fetching sync flags record from CloudKit, item.defaultShortcutsVersion = %{public}ld, item.migratedVoiceShortcuts = %{public}d, error = %{public}@", (uint8_t *)&v9, 0x26u);
  }

  if (v5)
  {
    if ([v5 defaultShortcutsVersion]) {
      objc_msgSend(*(id *)(a1 + 40), "setDefaultShortcutsVersion:", objc_msgSend(v5, "defaultShortcutsVersion"));
    }
    if ([v5 migratedVoiceShortcuts])
    {
      [*(id *)(a1 + 40) setVoiceShortcutMigrationDidSync:1];
      [*(id *)(a1 + 40) setVoiceShortcutMigrationDidRun:1];
    }
    int v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

+ (int64_t)currentDefaultShortcutsVersion
{
  return 2;
}

+ (void)setWalrusForcedEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a1 isWalrusForcedEnabled] != a3)
  {
    id v5 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    [v5 setBool:v3 forKey:@"WFWalrusForcedEnabled"];

    id v6 = getWFWalrusLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "+[WFCloudKitSyncSession setWalrusForcedEnabled:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Walrus status has been FORCED to %d", (uint8_t *)&v7, 0x12u);
    }

    [a1 resolveWalrusStatus];
  }
}

+ (BOOL)isWalrusForcedEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFWalrusForcedEnabled"];

  return v3;
}

+ (void)resolveWalrusStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  int v3 = [v2 BOOLForKey:@"WFWalrusGroundTruthEnabled"];

  v4 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"WFWalrusForcedEnabled"];

  uint64_t v6 = v3 | v5;
  int v7 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v7 setBool:v6 forKey:@"WFWalrusEnabled"];

  int v8 = getWFWalrusLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    BOOL v10 = "+[WFCloudKitSyncSession resolveWalrusStatus]";
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Walrus final status has changed to %d", (uint8_t *)&v9, 0x12u);
  }
}

+ (int64_t)syncedFlagsHash
{
  uint64_t v3 = [a1 defaultShortcutsVersion];
  int v4 = [a1 voiceShortcutMigrationDidRun];
  uint64_t v5 = 3735928559;
  if (v4) {
    uint64_t v5 = 305419896;
  }
  return v5 ^ v3;
}

+ (void)setLastSyncedFlagsHash:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v4 setInteger:a3 forKey:@"WFLastSyncedFlagsHash"];
}

+ (int64_t)lastSyncedFlagsHash
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  int64_t v3 = [v2 integerForKey:@"WFLastSyncedFlagsHash"];

  return v3;
}

+ (BOOL)needsDefaultShortcutUpdate
{
  uint64_t v3 = [a1 defaultShortcutsVersion];
  return v3 < [a1 currentDefaultShortcutsVersion];
}

+ (void)setDefaultShortcutsVersion:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  [v4 setInteger:a3 forKey:@"WFDefaultShortcutsVersion"];
}

+ (int64_t)defaultShortcutsVersion
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  int64_t v3 = [v2 integerForKey:@"WFDefaultShortcutsVersion"];

  return v3;
}

+ (void)setVoiceShortcutMigrationDidSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setBool:v3 forKey:@"VCVoiceShortcutMigrationDidSync"];
}

+ (BOOL)voiceShortcutMigrationDidSync
{
  v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"VCVoiceShortcutMigrationDidSync"];

  return v3;
}

+ (void)setVoiceShortcutMigrationDidRun:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setBool:v3 forKey:@"VCVoiceShortcutMigrationDidRun"];
}

+ (BOOL)voiceShortcutMigrationDidRun
{
  v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"VCVoiceShortcutMigrationDidRun"];

  return v3;
}

+ (void)setIgnoresUserDeletedZoneErrors:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setBool:v3 forKey:@"WFCloudKitSyncIgnoresUserDeletedZoneErrors"];
}

+ (BOOL)ignoresUserDeletedZoneErrors
{
  v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFCloudKitSyncIgnoresUserDeletedZoneErrors"];

  return v3;
}

+ (void)setZoneWasPurged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setBool:v3 forKey:@"WFCloudKitSyncZoneWasPurged"];
}

+ (void)setSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  [v4 setBool:v3 forKey:@"WFCloudKitSyncEnabled"];
}

@end