@interface MBPrebuddyManager
+ (BOOL)hasPrebuddyFollowUp;
+ (NSString)backupToCloudImageName;
+ (NSString)twoDeviceImageName;
+ (id)baseFollowupItem;
+ (id)sharedManager;
- (BOOL)beginPrebuddyBackupFromManualSignal:(BOOL)a3 error:(id *)a4;
- (BOOL)isPrebuddyMode;
- (MBManagerDelegate)delegate;
- (MBPrebuddyManager)init;
- (MBXPCClient)managerClient;
- (id)dateOfLastBackup;
- (void)beginPrebuddyBackupFromManualSignal:(BOOL)a3;
- (void)cancelPrebuddy;
- (void)cancelPrebuddyOnAccountSignOut;
- (void)extendPrebuddy:(id)a3 completion:(id)a4;
- (void)followupAction:(id)a3;
- (void)prebuddyBackupDeleted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagerClient:(id)a3;
- (void)shortenPrebuddyExpiration;
- (void)signalPrebuddy:(id)a3;
- (void)turnOnBackup;
- (void)updateFollowUp;
@end

@implementation MBPrebuddyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_sharedManager;
  return v2;
}

uint64_t __34__MBPrebuddyManager_sharedManager__block_invoke()
{
  _sharedManager = objc_alloc_init(MBPrebuddyManager);
  return MEMORY[0x1F41817F8]();
}

- (MBPrebuddyManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MBPrebuddyManager;
  v2 = [(MBPrebuddyManager *)&v7 init];
  if (v2)
  {
    v3 = [MBXPCClient alloc];
    uint64_t v4 = [(MBXPCClient *)v3 initWithDelegate:v2 eventQueue:MEMORY[0x1E4F14428]];
    managerClient = v2->_managerClient;
    v2->_managerClient = (MBXPCClient *)v4;
  }
  return v2;
}

- (MBManagerDelegate)delegate
{
  return [(MBManager *)self->_managerClient delegate];
}

- (void)setDelegate:(id)a3
{
}

- (void)turnOnBackup
{
}

- (void)signalPrebuddy:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessageStartPrebuddySignal" arguments:v6 error:0];
}

- (void)extendPrebuddy:(id)a3 completion:(id)a4
{
  id v4 = a4;
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MBPrebuddyManager_extendPrebuddy_completion___block_invoke;
  block[3] = &unk_1E6D012D8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __47__MBPrebuddyManager_extendPrebuddy_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, MEMORY[0x1E4F1CC08]);
  }
  return result;
}

- (void)prebuddyBackupDeleted:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MBManager);
  id v15 = 0;
  BOOL v5 = [(MBManager *)v4 restorePreviousSettingsEnabledForMegaBackup:&v15];
  id v6 = v15;
  if (!v5)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "Failed to restore previous settings enabled for mega backup: %@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"Failed to restore previous settings enabled for mega backup: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    }
  }
  id v14 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessagePrebuddyBackupDeleted" arguments:0 error:0];
}

- (void)cancelPrebuddy
{
  id v2 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessageCancelPrebuddySignal" arguments:0 error:0];
}

- (void)cancelPrebuddyOnAccountSignOut
{
  id v2 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessageCancelPrebuddySignal" arguments:&unk_1F3959888 error:0];
}

- (void)beginPrebuddyBackupFromManualSignal:(BOOL)a3
{
}

- (BOOL)beginPrebuddyBackupFromManualSignal:(BOOL)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  managerClient = self->_managerClient;
  id v6 = [NSNumber numberWithBool:a3];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [(MBXPCClient *)managerClient _sendRequest:@"kMBMessageStartPrebuddyBackup" arguments:v7 error:a4];

  LOBYTE(a4) = [v8 BOOLValue];
  return (char)a4;
}

+ (NSString)twoDeviceImageName
{
  id v2 = MBDeviceClass();
  v3 = [v2 lowercaseString];

  id v4 = MBHomeButtonType();
  int v5 = [v4 integerValue];

  if ([v3 isEqualToString:@"ipad"])
  {
    if (v5 == 2) {
      id v6 = @"iPad";
    }
    else {
      id v6 = @"iPad_home";
    }
  }
  else
  {
    char v7 = [v3 isEqualToString:@"ipod"];
    uint64_t v8 = @"iPhone_home";
    if (v5 == 2) {
      uint64_t v8 = @"iPhone";
    }
    if (v7) {
      id v6 = @"ipod_touch";
    }
    else {
      id v6 = v8;
    }
  }

  return &v6->isa;
}

+ (NSString)backupToCloudImageName
{
  id v2 = MBDeviceClass();
  v3 = [v2 lowercaseString];

  id v4 = MBHomeButtonType();
  int v5 = [v4 integerValue];

  if ([v3 isEqualToString:@"ipad"])
  {
    if (v5 == 2) {
      id v6 = @"cloud-arrow-up-iPad";
    }
    else {
      id v6 = @"cloud-arrow-up-iPad-2";
    }
  }
  else
  {
    char v7 = [v3 isEqualToString:@"ipod"];
    uint64_t v8 = @"cloud-arrow-up-iphone-2";
    if (v5 == 2) {
      uint64_t v8 = @"cloud-arrow-up-iphone-1";
    }
    if (v7) {
      id v6 = @"cloud-arrow-up-iPod";
    }
    else {
      id v6 = v8;
    }
  }

  return &v6->isa;
}

+ (id)baseFollowupItem
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5B770]);
  [v3 setUniqueIdentifier:@"com.apple.backupd.prebuddy"];
  [v3 setGroupIdentifier:*MEMORY[0x1E4F5B738]];
  [v3 setTargetBundleIdentifier:*MEMORY[0x1E4F5B710]];
  [v3 setExtensionIdentifier:@"com.apple.MobileBackup.framework.MBPrebuddyFollowUpExtension"];
  [v3 setRepresentingBundlePath:@"/System/Library/PrivateFrameworks/MobileBackup.framework/PlugIns/MBPrebuddyFollowUpExtension.appex"];
  id v4 = [a1 twoDeviceImageName];
  [v3 setBundleIconName:v4];

  [v3 setDisplayStyle:18];
  return v3;
}

+ (BOOL)hasPrebuddyFollowUp
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.backupd"];
  id v26 = 0;
  id v3 = [v2 pendingFollowUpItems:&v26];
  id v4 = v26;
  if (v4)
  {
    int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_ERROR, "Unable to fetch pending follow ups: %@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Unable to fetch pending follow ups: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v3;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = [v17 uniqueIdentifier];
        if ([v18 isEqualToString:@"com.apple.backupd.prebuddy"])
        {
          char v19 = [v17 isExpired];

          if ((v19 & 1) == 0)
          {
            BOOL v20 = 1;
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v14);
  }
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (void)followupAction:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F5B760];
  id v4 = (void (**)(id, void *))a3;
  int v5 = MBLocalizedStringFromTable(@"MB_PREBUDDY_START_TITLE", @"MobileBackup");
  uint64_t v6 = [v3 actionWithLabel:v5 url:0];

  uint64_t v8 = @"manualSignal";
  v9[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v6 setUserInfo:v7];

  v4[2](v4, v6);
}

- (id)dateOfLastBackup
{
  id v2 = [(MBPrebuddyManager *)self managerClient];
  id v3 = [v2 dateOfLastBackup];

  return v3;
}

- (BOOL)isPrebuddyMode
{
  id v2 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessageIsPrebuddyMode" arguments:MEMORY[0x1E4F1CBF0] error:0];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)updateFollowUp
{
  id v2 = [(MBXPCClient *)self->_managerClient _sendRequest:@"kMBMessageUpdatePrebuddyFollowUp" arguments:0 error:0];
}

- (void)shortenPrebuddyExpiration
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(MBPrebuddyManager *)self isPrebuddyMode])
  {
    char v3 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v5 = [v4 dateByAddingUnit:64 value:5 toDate:v3 options:0];

    managerClient = self->_managerClient;
    id v30 = 0;
    BOOL v7 = [(MBXPCClient *)managerClient requestMegaBackupExpirationDate:v5 error:&v30];
    id v8 = v30;
    uint64_t v9 = MBGetDefaultLog();
    uint64_t v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v5;
        _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "Successfully shortened prebuddy expiration to %{public}@", buf, 0xCu);
        _MBLog(@"DEFAULT", (uint64_t)"Successfully shortened prebuddy expiration to %{public}@", v11, v12, v13, v14, v15, v16, (uint64_t)v5);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v5;
      __int16 v33 = 2114;
      id v34 = v8;
      _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_ERROR, "Unable to shorten prebuddy expiration to %{public}@. Error: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Unable to shorten prebuddy expiration to %{public}@. Error: %{public}@", v23, v24, v25, v26, v27, v28, (uint64_t)v5);
    }
  }
  else
  {
    char v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_DEFAULT, "Not in Prebuddy mode, so nothing to shorten.", buf, 2u);
      _MBLog(@"DEFAULT", (uint64_t)"Not in Prebuddy mode, so nothing to shorten.", v17, v18, v19, v20, v21, v22, v29);
    }
  }
}

- (MBXPCClient)managerClient
{
  return (MBXPCClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagerClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end