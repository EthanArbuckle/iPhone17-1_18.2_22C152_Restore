@interface MSASPlatformImplementation
- (ACAccountStore)accountStore;
- (BOOL)MSASIsAllowedToTransferMetadata;
- (BOOL)MSASIsAllowedToUploadAssets;
- (BOOL)MSASPersonIDIsAllowedToDownloadAssets:(id)a3;
- (BOOL)deviceHasEnoughDiskSpaceRemainingToOperate;
- (BOOL)personIDEnabledForAlbumSharing:(id)a3;
- (BOOL)personIDUsesProductionPushEnvironment:(id)a3;
- (BOOL)shouldEnableNewFeatures;
- (BOOL)shouldLogAtLevel:(int)a3;
- (Class)pluginClass;
- (MSASPlatformImplementation)init;
- (id)MMCSDownloadSocketOptionsForPersonID:(id)a3;
- (id)MMCSUploadSocketOptionsForPersonID:(id)a3;
- (id)_accountForPersonID:(id)a3;
- (id)albumSharingDaemon;
- (id)baseSharingURLForPersonID:(id)a3;
- (id)pathAlbumSharingDir;
- (id)personIDsEnabledForAlbumSharing;
- (id)pushTokenForPersonID:(id)a3;
- (int)MMCSConcurrentConnectionsCount;
- (void)logLevel:(int)a3 personID:(id)a4 albumGUID:(id)a5 format:(id)a6;
- (void)setAccountStore:(id)a3;
@end

@implementation MSASPlatformImplementation

- (void).cxx_destruct
{
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (BOOL)shouldEnableNewFeatures
{
  return CFPreferencesGetAppBooleanValue(@"shouldEnableNewFeatures", @"com.apple.mediastream.mstreamd", 0) != 0;
}

- (int)MMCSConcurrentConnectionsCount
{
  v2 = (void *)CFPreferencesCopyAppValue(@"AlbumSharingMMCSConnections", @"com.apple.mediastream.mstreamd");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 intValue];
    NSLog(&cfstr_UsingUserDefin.isa, v4);
  }
  else
  {
    LODWORD(v4) = 6;
  }

  return v4;
}

- (id)personIDsEnabledForAlbumSharing
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(MSASPlatformImplementation *)self accountStore];
  v5 = [v4 accounts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = *MEMORY[0x1E4F17B18];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 isEnabledForDataclass:v9])
        {
          v12 = objc_msgSend(v11, "aa_personID");

          if (v12)
          {
            v13 = objc_msgSend(v11, "aa_personID");
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)personIDEnabledForAlbumSharing:(id)a3
{
  v3 = [(MSASPlatformImplementation *)self _accountForPersonID:a3];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 isEnabledForDataclass:*MEMORY[0x1E4F17B18]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)pushTokenForPersonID:(id)a3
{
  v3 = MSPlatform();
  uint64_t v4 = [v3 pushToken];

  return v4;
}

- (BOOL)personIDUsesProductionPushEnvironment:(id)a3
{
  v3 = [(MSASPlatformImplementation *)self _accountForPersonID:a3];
  uint64_t v4 = [v3 propertiesForDataclass:*MEMORY[0x1E4F17B18]];
  char v5 = [v4 objectForKey:@"apsEnv"];
  char v6 = [v5 isEqualToString:@"production"];

  return v6;
}

- (id)_accountForPersonID:(id)a3
{
  id v4 = a3;
  char v5 = [(MSASPlatformImplementation *)self accountStore];
  char v6 = objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);

  return v6;
}

- (BOOL)MSASPersonIDIsAllowedToDownloadAssets:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MSASPlatformImplementation *)self deviceHasEnoughDiskSpaceRemainingToOperate])
  {
    char v5 = [(MSASPlatformImplementation *)self albumSharingDaemon];
    int v6 = [v5 isPersonIDAllowedToDownloadAssets:v4];

    if (v6)
    {
      uint64_t v7 = +[MSPauseManager sharedManager];
      int v8 = [v7 isPaused];

      if (!v8)
      {
        BOOL v9 = 1;
        goto LABEL_13;
      }
      BOOL v9 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        v10 = MEMORY[0x1E4F14500];
        v11 = "mstreamd is paused. Not downloading assets at this time.";
LABEL_8:
        uint32_t v12 = 2;
LABEL_11:
        _os_log_impl(&dword_1DD956000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v12);
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        v10 = MEMORY[0x1E4F14500];
        v11 = "%@ is not allowed to download assets at this time.";
        uint32_t v12 = 12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = MEMORY[0x1E4F14500];
      v11 = "Not enough disk space to continue downloading assets.";
      goto LABEL_8;
    }
  }
LABEL_13:

  return v9;
}

- (BOOL)MSASIsAllowedToUploadAssets
{
  if (![(MSASPlatformImplementation *)self deviceHasEnoughDiskSpaceRemainingToOperate])
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    __int16 v10 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Not enough disk space to continue uploading assets.";
    int v8 = (uint8_t *)&v10;
    goto LABEL_7;
  }
  v2 = +[MSPauseManager sharedManager];
  int v3 = [v2 isPaused];

  if (v3)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v4) {
      return result;
    }
    __int16 v11 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "mstreamd is paused. Not uploading assets at this time.";
    int v8 = (uint8_t *)&v11;
LABEL_7:
    _os_log_impl(&dword_1DD956000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return 0;
  }
  return 1;
}

- (BOOL)MSASIsAllowedToTransferMetadata
{
  if (![(MSASPlatformImplementation *)self deviceHasEnoughDiskSpaceRemainingToOperate])
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    __int16 v10 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Not enough disk space to continue transferring metadata.";
    int v8 = (uint8_t *)&v10;
    goto LABEL_7;
  }
  v2 = +[MSPauseManager sharedManager];
  int v3 = [v2 isPaused];

  if (v3)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v4) {
      return result;
    }
    __int16 v11 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "mstreamd is paused. Not transferring metadata at this time.";
    int v8 = (uint8_t *)&v11;
LABEL_7:
    _os_log_impl(&dword_1DD956000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return 0;
  }
  return 1;
}

- (id)MMCSUploadSocketOptionsForPersonID:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  char v5 = [v3 dictionary];
  int v6 = MSASPlatform();
  uint64_t v7 = [v6 albumSharingDaemon];
  int v8 = [v7 powerBudgetForPersonID:v4];

  if (([v8 hasForegroundFocus] & 1) == 0) {
    [v5 setObject:*MEMORY[0x1E4F19030] forKey:*MEMORY[0x1E4F19018]];
  }
  if ([v5 count]) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)MMCSDownloadSocketOptionsForPersonID:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  char v5 = [v3 dictionary];
  int v6 = MSASPlatform();
  uint64_t v7 = [v6 albumSharingDaemon];
  int v8 = [v7 powerBudgetForPersonID:v4];

  if (([v8 hasForegroundFocus] & 1) == 0) {
    [v5 setObject:*MEMORY[0x1E4F19030] forKey:*MEMORY[0x1E4F19018]];
  }
  if (([v8 hasForegroundFocus] & 1) == 0 && (objc_msgSend(v8, "hasActiveTimers") & 1) == 0)
  {
    id v9 = [NSNumber numberWithBool:1];
    [v5 setObject:v9 forKey:*MEMORY[0x1E4F190F0]];
  }
  if ([v5 count]) {
    id v10 = v5;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)deviceHasEnoughDiskSpaceRemainingToOperate
{
  if (deviceHasEnoughDiskSpaceRemainingToOperate_onceToken != -1) {
    dispatch_once(&deviceHasEnoughDiskSpaceRemainingToOperate_onceToken, &__block_literal_global_33);
  }
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke_2;
  block[3] = &unk_1E6CFCCB0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)deviceHasEnoughDiskSpaceRemainingToOperate_queue, block);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke_2(uint64_t a1)
{
  if (!deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Checking remaining disk space for the first time.", v25, 2u);
    }
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = _throttledIndicatorFilePath();
    int v11 = [v9 fileExistsAtPath:v10];

    if (!v11)
    {
      BOOL v12 = _availableDiskBlocks() >> 9 < 0x4B;
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)v24 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Detected that the process was shut down while throttled by disk space. Remaining throttled.";
    char v8 = v24;
    goto LABEL_14;
  }
  char v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate];
  double v4 = v3;

  if (v4 < 7.0) {
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Checking remaining disk space again.", buf, 2u);
  }
  uint64_t v5 = _availableDiskBlocks();
  if ((deviceHasEnoughDiskSpaceRemainingToOperate_state & 1) == 0 && v5 >> 9 <= 0x4A)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:
      BOOL v12 = 1;
      goto LABEL_17;
    }
    __int16 v22 = 0;
    int v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Disk space has become too low for continued operation.";
    char v8 = (uint8_t *)&v22;
LABEL_14:
    _os_log_impl(&dword_1DD956000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_15;
  }
  if (v5 >> 11 > 0x18) {
    int v17 = deviceHasEnoughDiskSpaceRemainingToOperate_state;
  }
  else {
    int v17 = 0;
  }
  if (v17 != 1) {
    goto LABEL_18;
  }
  BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL v12 = 0;
  if (v18)
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Enough disk space has become available to continue operation.", v21, 2u);
    BOOL v12 = 0;
  }
LABEL_17:
  deviceHasEnoughDiskSpaceRemainingToOperate_state = v12;
LABEL_18:
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  int v14 = (void *)deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate;
  deviceHasEnoughDiskSpaceRemainingToOperate_lastCheckDate = v13;

LABEL_19:
  if (deviceHasEnoughDiskSpaceRemainingToOperate_state)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Disk space is too low for continued operation.", v19, 2u);
    }
    id v15 = [MEMORY[0x1E4F1C9B8] data];
    uint64_t v16 = _throttledIndicatorFilePath();
    [v15 writeToFile:v16 options:0 error:0];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Disk space is OK to continue operations.", v20, 2u);
    }
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = _throttledIndicatorFilePath();
    [v15 removeItemAtPath:v16 error:0];
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (deviceHasEnoughDiskSpaceRemainingToOperate_state & 1) == 0;
}

uint64_t __72__MSASPlatformImplementation_deviceHasEnoughDiskSpaceRemainingToOperate__block_invoke()
{
  deviceHasEnoughDiskSpaceRemainingToOperate_queue = (uint64_t)dispatch_queue_create("MSASPlatformImplementation disk space queue", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)baseSharingURLForPersonID:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  int v6 = [v4 standardUserDefaults];
  uint64_t v7 = [v6 objectForKey:@"MSASForcedBaseURL"];

  if (v7)
  {
    char v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    id v9 = [(MSASPlatformImplementation *)self accountStore];
    id v10 = objc_msgSend(v9, "aa_appleAccountWithPersonID:", v5);

    int v11 = [v10 propertiesForDataclass:*MEMORY[0x1E4F17B18]];
    BOOL v12 = [v11 objectForKey:@"url"];

    char v8 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  uint64_t v13 = [v8 URLByAppendingPathComponent:v5];

  int v14 = [v13 URLByAppendingPathComponent:@"sharedstreams"];

  return v14;
}

- (void)logLevel:(int)a3 personID:(id)a4 albumGUID:(id)a5 format:(id)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a6;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unexpected call to legacy logging method, please switch to os_log(): %@", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)shouldLogAtLevel:(int)a3
{
  return a3 != 7 || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
}

- (Class)pluginClass
{
  if (pluginClass_onceToken_701 != -1) {
    dispatch_once(&pluginClass_onceToken_701, &__block_literal_global_13);
  }
  char v2 = (void *)pluginClass_class;

  return (Class)v2;
}

void __41__MSASPlatformImplementation_pluginClass__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [@"/System/Library/MediaStreamPlugins" stringByAppendingPathComponent:@"PhotoSharingPlugin.mediastream"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = (uint64_t)v0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Loading Shared Streams plugin from %@", (uint8_t *)&v4, 0xCu);
  }
  v1 = [MEMORY[0x1E4F28B50] bundleWithPath:v0];
  uint64_t v2 = [v1 principalClass];
  double v3 = (void *)pluginClass_class;
  pluginClass_class = v2;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    uint64_t v5 = pluginClass_class;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Loaded class: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)pathAlbumSharingDir
{
  if (pathAlbumSharingDir_once != -1) {
    dispatch_once(&pathAlbumSharingDir_once, &__block_literal_global_706);
  }
  uint64_t v2 = (void *)pathAlbumSharingDir_path;

  return v2;
}

void __49__MSASPlatformImplementation_pathAlbumSharingDir__block_invoke()
{
  id v4 = [NSString MSMSUserDirectory];
  v0 = [v4 stringByAppendingPathComponent:@"Library"];
  v1 = [v0 stringByAppendingPathComponent:@"MediaStream"];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"albumshare"];
  double v3 = (void *)pathAlbumSharingDir_path;
  pathAlbumSharingDir_path = v2;
}

- (id)albumSharingDaemon
{
  return (id)_daemon;
}

- (MSASPlatformImplementation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSASPlatformImplementation;
  uint64_t v2 = [(MSASPlatformImplementation *)&v6 init];
  if (v2)
  {
    double v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

@end