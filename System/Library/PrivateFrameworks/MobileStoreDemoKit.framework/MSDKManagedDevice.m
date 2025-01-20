@interface MSDKManagedDevice
+ (id)sharedInstance;
- (BOOL)_isContentFrozen_xpc:(id *)a3 checkDemo:(BOOL)a4;
- (BOOL)_isEnrolled:(id *)a3 checkDemo:(BOOL)a4;
- (BOOL)_manageWallpaperSettingsWithAction:(const char *)a3;
- (BOOL)_needOwnershipWarning:(id *)a3 error:(id *)a4;
- (BOOL)_prepareWithOptions:(id)a3;
- (BOOL)_unenrollWithOptions:(id)a3 outError:(id *)a4;
- (BOOL)_unlockDemoContentWithOptions:(id)a3 outError:(id *)a4;
- (BOOL)cancelOperation;
- (BOOL)checkInBlockingUI;
- (BOOL)clearCurrentSafariHistory;
- (BOOL)clearOwnershipWarning;
- (BOOL)closeRunningAppsExcept:(id)a3;
- (BOOL)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4;
- (BOOL)commitNewDemoContent;
- (BOOL)configureWiFi:(id)a3 password:(id)a4;
- (BOOL)deleteDataBlob;
- (BOOL)disconnectAndForgetWiFi:(id *)a3;
- (BOOL)enterOfflineModeWithOptions:(id)a3 error:(id *)a4;
- (BOOL)inferContentFrozenFromPreferencesFile;
- (BOOL)initializeAppSwitcherContent;
- (BOOL)initializeDeviceSettingsWithOverwrite:(BOOL)a3;
- (BOOL)isBetterTogetherDemoDevice;
- (BOOL)isContentFrozen;
- (BOOL)isContentFrozen:(id *)a3;
- (BOOL)isContentFrozen_xpc;
- (BOOL)isDeviceClassSupported;
- (BOOL)isDigitalSecurityEnabled;
- (BOOL)isEnrolled;
- (BOOL)isEnrolled:(id *)a3;
- (BOOL)isFeatureFlagEnabled:(id)a3;
- (BOOL)isOfflineMode:(id *)a3;
- (BOOL)isStoreOpen:(id *)a3;
- (BOOL)lockDemoContent;
- (BOOL)needOwnershipWarning:(id *)a3;
- (BOOL)prepare;
- (BOOL)prepareWithWiFi:(id)a3 password:(id)a4;
- (BOOL)preserveAppDataToPersistentStorageWithReturnError:(id *)a3;
- (BOOL)refreshDeviceSettings;
- (BOOL)reloadDemodsPreferencesFile;
- (BOOL)restoreWallpaperSettingsIfNeeded;
- (BOOL)revertDemoContent;
- (BOOL)saveBluetoothPairingInfo;
- (BOOL)saveScreenSaverConfig:(id)a3;
- (BOOL)sendAutoEnrollmentAbortEvent:(id)a3 countryCode:(id)a4;
- (BOOL)sendAutoEnrollmentResult:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5;
- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4;
- (BOOL)setIdleDelay:(int64_t)a3;
- (BOOL)setLastShallowRefreshTime:(id)a3;
- (BOOL)setSEPDemoMode:(BOOL)a3;
- (BOOL)setStoreOpenAt:(int64_t)a3 openMinute:(int64_t)a4 closeHour:(int64_t)a5 closeMinute:(int64_t)a6;
- (BOOL)setupConnection;
- (BOOL)setupConnection:(id)a3 withMachService:(id)a4;
- (BOOL)setupHelperConnection;
- (BOOL)stashCurrentWallpaperSettingsIfNeeded;
- (BOOL)storeDataBlob:(id)a3;
- (BOOL)unenroll:(BOOL)a3;
- (BOOL)unlockDemoContent;
- (MSDKManagedDevice)init;
- (MSDKManagedDeviceDelegate)delegate;
- (NSMutableDictionary)xpc_cache;
- (OS_xpc_object)connection;
- (OS_xpc_object)helperConnection;
- (id)_getCurrentNetworkInfoForKeys:(id)a3 outError:(id *)a4;
- (id)_getDeviceOptions:(id *)a3 checkDemo:(BOOL)a4;
- (id)_getStoreID:(id *)a3 checkDemo:(BOOL)a4;
- (id)_readOwnershipWarningFromNvram;
- (id)errorWithXPCDictionary:(id)a3;
- (id)getAppDataFolderPathWithReturnError:(id *)a3;
- (id)getCacheIdentifier;
- (id)getCurrentAppUsageSessionUUID;
- (id)getDeviceLanguageandRegion;
- (id)getDeviceOptions;
- (id)getDeviceOptions:(id *)a3;
- (id)getFriendlyDeviceName;
- (id)getPersistentWiFiSsid;
- (id)getScreenSaverConfig;
- (id)getStoreID;
- (id)getStoreID:(id *)a3;
- (id)getStoreType:(id *)a3;
- (id)nextStoreCloseDate:(id *)a3;
- (id)nextStoreOpenDate:(id *)a3;
- (id)readNVRam:(id)a3;
- (id)retrieveDataBlob;
- (id)retrieveXPCConnectionToPeerService;
- (id)saveScreenSaverIdleDelay:(id)a3;
- (id)saveStoreHour:(id)a3;
- (int64_t)getDemoInstallState;
- (unint64_t)_typeOfDemoDevice:(id *)a3 checkDemo:(BOOL)a4;
- (unint64_t)typeOfDemoDevice;
- (unint64_t)typeOfDemoDevice:(id *)a3;
- (void)_handleCheckInXPCResponse:(id)a3 withCompletion:(id)a4;
- (void)_handleMarkAsNotDemoXPCResponse:(id)a3 withCompletion:(id)a4;
- (void)_handleSearchXPCResponse:(id)a3 withCompletion:(id)a4;
- (void)cancelOperation;
- (void)checkInBlockingUI;
- (void)checkInWithCompletion:(id)a3;
- (void)clearOwnershipWarning;
- (void)commitNewDemoContent;
- (void)deleteDataBlob;
- (void)getDemoInstallState;
- (void)getDeviceLanguageandRegion;
- (void)getFriendlyDeviceName;
- (void)handleContentUpdateStatus:(const char *)a3 event:(id)a4;
- (void)handleMessage:(id)a3;
- (void)isBetterTogetherDemoDevice;
- (void)launchApp:(id)a3;
- (void)lockDemoContent;
- (void)markAsNotDemoWithCompletion:(id)a3;
- (void)retrieveDataBlob;
- (void)revertDemoContent;
- (void)saveBluetoothPairingInfo;
- (void)searchStoreWithOptions:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setXpc_cache:(id)a3;
- (void)updateStoreHours:(id)a3 evaluateAgainstDate:(id)a4;
@end

@implementation MSDKManagedDevice

- (BOOL)isBetterTogetherDemoDevice
{
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    v3 = +[MSDKDemoState sharedInstance];
    LODWORD(v4) = [v3 _isStoreDemoModeEnabled:0];

    if (v4)
    {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v5, "RequestOperation", "GetDeviceOptions");
      xpc_dictionary_set_string(v5, "SubKey", (const char *)[@"enable_better_together" UTF8String]);
      [(MSDKManagedDevice *)self setupConnection];
      v6 = [(MSDKManagedDevice *)self connection];

      if (v6)
      {
        v4 = [(MSDKManagedDevice *)self connection];
        v7 = xpc_connection_send_message_with_reply_sync(v4, v5);

        LOBYTE(v4) = xpc_dictionary_get_BOOL(v7, (const char *)[@"enable_better_together" UTF8String]);
      }
      else
      {
        v7 = defaultLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(MSDKManagedDevice *)v7 isBetterTogetherDemoDevice];
        }
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)isDeviceClassSupported
{
  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPhone", @"iPad", @"iPod", @"Watch", @"AppleTV", @"RealityDevice", 0);
  v4 = v3;
  BOOL v5 = v2 && ([v3 containsObject:v2] & 1) != 0;

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_device;
  return v2;
}

uint64_t __35__MSDKManagedDevice_sharedInstance__block_invoke()
{
  sharedInstance_device = objc_alloc_init(MSDKManagedDevice);
  return MEMORY[0x270F9A758]();
}

- (MSDKManagedDevice)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)MSDKManagedDevice;
  v2 = [(MSDKManagedDevice *)&v10 init];
  if (v2)
  {
    v3 = defaultLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21EF3DE4E, buf, 2u);
    }

    v4 = defaultLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [MEMORY[0x263F08AB0] processInfo];
      v6 = [v5 processName];
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ started to use MobileStoreDemoKit.", buf, 0xCu);
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MSDKManagedDevice *)v2 setXpc_cache:v7];

    v8 = v2;
  }

  return v2;
}

- (void)setXpc_cache:(id)a3
{
}

- (id)getAppDataFolderPathWithReturnError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F08850] defaultManager];
  id v11 = 0;
  BOOL v5 = [v4 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:0 error:&v11];
  id v6 = v11;

  if (v5)
  {
    id v7 = [v5 path];
    v8 = [v7 stringByAppendingPathComponent:@"MSDPersistentData"];

    uint64_t v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "appDataFolderPath:  %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (a3) {
      *a3 = v6;
    }
    uint64_t v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(PersistentStorage) getAppDataFolderPathWithReturnError:](v6, v9);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)preserveAppDataToPersistentStorageWithReturnError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v20 = 0;
  BOOL v5 = [(MSDKManagedDevice *)self getAppDataFolderPathWithReturnError:&v20];
  id v6 = v20;
  id v7 = v6;
  if (!v5)
  {
    if (a3)
    {
      BOOL v14 = 0;
      *a3 = v6;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "preserveSecondPartyAppDataToShelter");
  id v9 = v5;
  xpc_dictionary_set_string(v8, "SourcePath", (const char *)[v9 UTF8String]);
  [(MSDKManagedDevice *)self setupConnection];
  objc_super v10 = [(MSDKManagedDevice *)self connection];

  if (!v10)
  {
    safeAssignErrorWithReason(a3, 3727744774, @"Error preserving data to shelter.", @"Failed to setup XPC connection.");
    uint64_t v15 = defaultLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(PersistentStorage) preserveAppDataToPersistentStorageWithReturnError:](v15);
    }

    goto LABEL_18;
  }
  id v11 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v8);

  if (!xpc_dictionary_get_BOOL(v12, "Result"))
  {
    string = xpc_dictionary_get_string(v12, "ErrorMsg");
    if (string)
    {
      v17 = [NSString stringWithUTF8String:string];
    }
    else
    {
      v17 = @"Error preserving data to shelter.";
    }
    safeAssignErrorWithReason(a3, 3727744774, @"Error preserving data to shelter.", (uint64_t)v17);
    v18 = defaultLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice(PersistentStorage) *)(uint64_t)v9 preserveAppDataToPersistentStorageWithReturnError:v18];
    }

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v13 = defaultLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v9;
    _os_log_impl(&dword_21EF08000, v13, OS_LOG_TYPE_DEFAULT, "Successfully preserved app data from %{public}@ to persistent storage.", buf, 0xCu);
  }

  BOOL v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)closeRunningAppsExcept:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "CloseRunningApps");
  id v6 = [v4 xpcArrayFromArray];

  xpc_dictionary_set_value(v5, "ScreenSaverAppIDs", v6);
  [(MSDKManagedDevice *)self setupConnection];
  id v7 = [(MSDKManagedDevice *)self connection];

  if (v7)
  {
    xpc_object_t v8 = [(MSDKManagedDevice *)self connection];
    id v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    BOOL v10 = xpc_dictionary_get_BOOL(v9, "Result");
  }
  else
  {
    id v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(CloseApps) closeRunningAppsExcept:](v9);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)initializeAppSwitcherContent
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "InitializeAppSwitcherContent");
  [(MSDKManagedDevice *)self setupConnection];
  id v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(CloseApps) initializeAppSwitcherContent](v6);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)checkInWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  id v33 = (id)MEMORY[0x223C3E670]();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__10;
  v30[4] = __Block_byref_object_dispose__11;
  xpc_object_t v5 = self;
  v31 = v5;
  if ([(MSDKManagedDevice *)v5 isDeviceClassSupported])
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:]";
      _os_log_impl(&dword_21EF08000, v6, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "RequestOperation", "DeviceCheckIn");
    [(MSDKManagedDevice *)v5 setupConnection];
    xpc_object_t v8 = [(MSDKManagedDevice *)v5 connection];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      BOOL v10 = [(MSDKManagedDevice *)v5 connection];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __60__MSDKManagedDevice_DemoUnitRequest__checkInWithCompletion___block_invoke;
      v27[3] = &unk_2644FC6D8;
      v27[4] = v30;
      v27[5] = v32;
      xpc_connection_send_message_with_reply(v10, v7, 0, v27);

      id v11 = 0;
      goto LABEL_6;
    }
    id v28 = 0;
    safeAssignError(&v28, 3727741186, @"Failed to establish xpc connection to demod.");
    id v11 = v28;
    xpc_object_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    id v29 = 0;
    safeAssignError(&v29, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v11 = v29;
    xpc_object_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    xpc_object_t v7 = 0;
  }

  if (v4) {
    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v11);
  }
LABEL_6:
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

uint64_t __60__MSDKManagedDevice_DemoUnitRequest__checkInWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleCheckInXPCResponse:a2 withCompletion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)markAsNotDemoWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, id))a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  id v33 = (id)MEMORY[0x223C3E670]();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__10;
  v30[4] = __Block_byref_object_dispose__11;
  xpc_object_t v5 = self;
  v31 = v5;
  if ([(MSDKManagedDevice *)v5 isDeviceClassSupported])
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:]";
      _os_log_impl(&dword_21EF08000, v6, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "RequestOperation", "MarkAsNotDemo");
    [(MSDKManagedDevice *)v5 setupConnection];
    xpc_object_t v8 = [(MSDKManagedDevice *)v5 connection];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      BOOL v10 = [(MSDKManagedDevice *)v5 connection];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __66__MSDKManagedDevice_DemoUnitRequest__markAsNotDemoWithCompletion___block_invoke;
      v27[3] = &unk_2644FC6D8;
      v27[4] = v30;
      v27[5] = v32;
      xpc_connection_send_message_with_reply(v10, v7, 0, v27);

      id v11 = 0;
      goto LABEL_6;
    }
    id v28 = 0;
    safeAssignError(&v28, 3727741186, @"Failed to establish xpc connection to demod.");
    id v11 = v28;
    xpc_object_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:](v12, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    id v29 = 0;
    safeAssignError(&v29, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v11 = v29;
    xpc_object_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    xpc_object_t v7 = 0;
  }

  if (v4) {
    v4[2](v4, 0, v11);
  }
LABEL_6:

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

uint64_t __66__MSDKManagedDevice_DemoUnitRequest__markAsNotDemoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleMarkAsNotDemoXPCResponse:a2 withCompletion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)searchStoreWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  xpc_object_t v7 = (void (**)(id, void, id))a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__1;
  v36[4] = __Block_byref_object_dispose__1;
  id v37 = (id)MEMORY[0x223C3E670]();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__10;
  v34[4] = __Block_byref_object_dispose__11;
  xpc_object_t v8 = self;
  v35 = v8;
  if ([(MSDKManagedDevice *)v8 isDeviceClassSupported])
  {
    BOOL v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:]";
      _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    if (v6)
    {
      BOOL v10 = [v6 createXPCDictionary];
    }
    else
    {
      BOOL v10 = xpc_dictionary_create(0, 0, 0);
    }
    id v11 = v10;
    xpc_dictionary_set_string(v10, "RequestOperation", "StoreSearch");
    [(MSDKManagedDevice *)v8 setupConnection];
    xpc_object_t v12 = [(MSDKManagedDevice *)v8 connection];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      uint64_t v14 = [(MSDKManagedDevice *)v8 connection];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __72__MSDKManagedDevice_DemoUnitRequest__searchStoreWithOptions_completion___block_invoke;
      v31[3] = &unk_2644FC6D8;
      v31[4] = v34;
      v31[5] = v36;
      xpc_connection_send_message_with_reply(v14, v11, 0, v31);

      id v15 = 0;
      goto LABEL_9;
    }
    id v32 = 0;
    safeAssignError(&v32, 3727741186, @"Failed to establish xpc connection to demod.");
    id v15 = v32;
    uint64_t v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:](v16, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    id v33 = 0;
    safeAssignError(&v33, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v15 = v33;
    uint64_t v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    id v11 = 0;
  }

  if (v7) {
    v7[2](v7, 0, v15);
  }
LABEL_9:

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

uint64_t __72__MSDKManagedDevice_DemoUnitRequest__searchStoreWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleSearchXPCResponse:a2 withCompletion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)_handleCheckInXPCResponse:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, BOOL, BOOL, id))a4;
  if (MEMORY[0x223C3EAB0](v5) != MEMORY[0x263EF8708])
  {
    BOOL v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) _handleCheckInXPCResponse:withCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

LABEL_9:
    id v18 = 0;
    safeAssignError(&v18, 3727741189, @"Unexpected demod xpc response.");
    id v9 = v18;
    BOOL v8 = 0;
    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (!xpc_dictionary_get_BOOL(v5, "Result")) {
    goto LABEL_9;
  }
  BOOL v7 = xpc_dictionary_get_BOOL(v5, "Eligible");
  BOOL v8 = xpc_dictionary_get_BOOL(v5, "ShowUI");
  id v9 = 0;
  if (v6) {
LABEL_4:
  }
    v6[2](v6, v7, v8, v9);
LABEL_5:
}

- (void)_handleMarkAsNotDemoXPCResponse:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, BOOL, id))a4;
  BOOL v6 = xpc_dictionary_get_BOOL(a3, "Result");
  if (v6)
  {
    id v7 = 0;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v8 = 0;
  safeAssignError(&v8, 3727741189, @"Unexpected demod xpc response.");
  id v7 = v8;
  if (v5) {
LABEL_5:
  }
    v5[2](v5, v6, v7);
LABEL_6:
}

- (void)_handleSearchXPCResponse:(id)a3 withCompletion:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *, id))a4;
  size_t length = 0;
  if (MEMORY[0x223C3EAB0](v5) != MEMORY[0x263EF8708])
  {
    uint64_t v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.5(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_18;
  }
  if (!xpc_dictionary_get_BOOL(v5, "Result"))
  {
    uint64_t v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.4(v14, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_18:
    id v10 = 0;
    char v11 = 0;
    id v9 = 0;
    id v8 = 0;
    goto LABEL_28;
  }
  data = xpc_dictionary_get_data(v5, "ResultData", &length);
  if (data)
  {
    id v8 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:length];
    id v44 = 0;
    id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v44];
    id v10 = v44;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v11 = 1;
        goto LABEL_7;
      }
      uint64_t v14 = defaultLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:]((uint64_t)v9, v14);
      }
    }
    else
    {
      uint64_t v14 = defaultLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:](v14, v36, v37, v38, v39, v40, v41, v42);
      }
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:](v14, v29, v30, v31, v32, v33, v34, v35);
    }
    id v10 = 0;
    id v9 = 0;
    id v8 = 0;
  }
  char v11 = 1;
LABEL_28:

LABEL_7:
  uint64_t v12 = defaultLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:]";
    __int16 v48 = 2114;
    v49 = v9;
    _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s - Store Search return with result list - %{public}@", buf, 0x16u);
  }

  if ((v11 & 1) == 0)
  {
    id v43 = v10;
    safeAssignError(&v43, 3727741189, @"Unexpected demod xpc response.");
    id v13 = v43;

    id v10 = v13;
  }
  if (v6) {
    v6[2](v6, v9, v10);
  }
}

- (id)getCurrentAppUsageSessionUUID
{
  if ([(MSDKManagedDevice *)self isEnrolled]
    && [(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "RequestOperation", "GetAppUsageSessionUUID");
    [(MSDKManagedDevice *)self setupConnection];
    id v4 = [(MSDKManagedDevice *)self connection];

    if (v4)
    {
      id v5 = [(MSDKManagedDevice *)self connection];
      BOOL v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

      if (xpc_dictionary_get_BOOL(v6, "Result"))
      {
        string = xpc_dictionary_get_string(v6, "SessionUUID");
        if (string)
        {
          id v8 = [NSString stringWithUTF8String:string];
LABEL_7:

          goto LABEL_9;
        }
        uint64_t v17 = defaultLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(MSDKManagedDevice(dataCollection) *)v17 getCurrentAppUsageSessionUUID];
        }
      }
      else
      {
        uint64_t v17 = defaultLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(MSDKManagedDevice(dataCollection) *)v17 getCurrentAppUsageSessionUUID];
        }
      }
    }
    else
    {
      BOOL v6 = defaultLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(MSDKManagedDevice(dataCollection) *)v6 getCurrentAppUsageSessionUUID];
      }
    }
    id v8 = 0;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_9:
  return v8;
}

- (BOOL)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MSDKManagedDevice *)self isEnrolled]
    && [(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    [v6 timeIntervalSince1970];
    xpc_object_t v9 = xpc_double_create(v8);
    [v7 timeIntervalSince1970];
    xpc_object_t v11 = xpc_double_create(v10);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "RequestOperation", "CollectAppUsageData");
    xpc_dictionary_set_value(v12, "StartTime", v9);
    xpc_dictionary_set_value(v12, "EndTime", v11);
    [(MSDKManagedDevice *)self setupConnection];
    uint64_t v13 = [(MSDKManagedDevice *)self connection];

    if (v13)
    {
      uint64_t v14 = [(MSDKManagedDevice *)self connection];
      uint64_t v15 = xpc_connection_send_message_with_reply_sync(v14, v12);

      BOOL v16 = xpc_dictionary_get_BOOL(v15, "Result");
    }
    else
    {
      uint64_t v15 = defaultLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice(dataCollection) collectAppUsageWithSessionStart:andEnd:](v15, v18, v19, v20, v21, v22, v23, v24);
      }
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)sendAutoEnrollmentResult:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5
{
  double v8 = (__CFString *)a4;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "RequestOperation", "AutoEnrollmentResults");
  xpc_dictionary_set_double(v10, "AutoEnrollmentTimeStamp", a3);
  if (v8) {
    xpc_object_t v11 = v8;
  }
  else {
    xpc_object_t v11 = &stru_26D08A1B8;
  }
  xpc_object_t v12 = v11;
  xpc_dictionary_set_string(v10, "AutoEnrollmentSelectedStoreID", (const char *)[(__CFString *)v12 cStringUsingEncoding:4]);
  if (v9)
  {
    id v13 = v9;
    xpc_dictionary_set_data(v10, "AutoEnrollmentHelpMenuUserTapped", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  }
  [(MSDKManagedDevice *)self setupConnection];
  uint64_t v14 = [(MSDKManagedDevice *)self connection];

  if (v14)
  {
    uint64_t v15 = [(MSDKManagedDevice *)self connection];
    BOOL v16 = xpc_connection_send_message_with_reply_sync(v15, v10);

    BOOL v17 = xpc_dictionary_get_BOOL(v16, "Result");
  }
  else
  {
    BOOL v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentResult:withStoreId:withHelpMenuRowSelection:](v16);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)sendAutoEnrollmentAbortEvent:(id)a3 countryCode:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "AutoEnrollmentAbortEvent");
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &stru_26D08A1B8;
  }
  xpc_object_t v10 = v9;
  xpc_dictionary_set_string(v8, "AutoEnrollmentAbortLanguageCodeInfo", (const char *)[(__CFString *)v10 cStringUsingEncoding:4]);
  if (v7) {
    xpc_object_t v11 = v7;
  }
  else {
    xpc_object_t v11 = &stru_26D08A1B8;
  }
  xpc_object_t v12 = v11;
  xpc_dictionary_set_string(v8, "AutoEnrollmentAbortCountryCodeInfo", (const char *)[(__CFString *)v12 cStringUsingEncoding:4]);
  [(MSDKManagedDevice *)self setupConnection];
  id v13 = [(MSDKManagedDevice *)self connection];

  if (v13)
  {
    uint64_t v14 = [(MSDKManagedDevice *)self connection];
    uint64_t v15 = xpc_connection_send_message_with_reply_sync(v14, v8);

    BOOL v16 = xpc_dictionary_get_BOOL(v15, "Result");
  }
  else
  {
    uint64_t v15 = defaultLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentAbortEvent:countryCode:](v15);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)setLastShallowRefreshTime:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setDateFormat:@"dd-MM-yyyy_HH:mm:ss:SSS"];
  id v7 = [v6 stringFromDate:v5];

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "SetLastShallowRefreshTime");
  id v9 = v7;
  xpc_dictionary_set_string(v8, "LastShallowRefreshTime", (const char *)[v9 cStringUsingEncoding:4]);
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v10 = [(MSDKManagedDevice *)self connection];

  if (v10)
  {
    xpc_object_t v11 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v8);

    BOOL v13 = xpc_dictionary_get_BOOL(v12, "Result");
  }
  else
  {
    xpc_object_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(SetLastShallowRefreshTime) setLastShallowRefreshTime:](v12);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    [(MSDKManagedDevice *)self setupConnection];
  }
  else
  {
    id v5 = [(MSDKManagedDevice *)self connection];
    xpc_connection_cancel(v5);

    [(MSDKManagedDevice *)self setConnection:0];
  }
}

- (MSDKManagedDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSDKManagedDeviceDelegate *)WeakRetained;
}

- (BOOL)setSEPDemoMode:(BOOL)a3
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "SetSEPDemoMode");
  xpc_dictionary_set_BOOL(v5, "SEPDemoMode", a3);
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    id v7 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    BOOL v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    xpc_object_t v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice setSEPDemoMode:](v8, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)prepare
{
  return [(MSDKManagedDevice *)self _prepareWithOptions:0];
}

- (BOOL)enterOfflineModeWithOptions:(id)a3 error:(id *)a4
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    safeAssignError(a4, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    xpc_object_t v6 = 0;
    xpc_object_t v9 = 0;
    id v11 = 0;
    BOOL v10 = 0;
    goto LABEL_6;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "RequestOperation", "EnterOfflineMode");
  [(MSDKManagedDevice *)self setupConnection];
  id v7 = [(MSDKManagedDevice *)self connection];

  if (v7)
  {
    xpc_object_t v8 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v8, v6);

    BOOL v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    id v11 = 0;
    if (a4)
    {
LABEL_4:
      id v11 = v11;
      *a4 = v11;
    }
  }
  else
  {
    id v21 = 0;
    safeAssignError(&v21, 3727741186, @"Failed to establish xpc connection to demod.");
    id v11 = v21;
    uint64_t v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice enterOfflineModeWithOptions:error:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    xpc_object_t v9 = 0;
    BOOL v10 = 0;
    if (a4) {
      goto LABEL_4;
    }
  }
LABEL_6:

  return v10;
}

- (BOOL)isOfflineMode:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  xpc_object_t v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = "-[MSDKManagedDevice isOfflineMode:]";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "QueryDeviceInfo", "MSDDeviceInOfflineMode");
  [(MSDKManagedDevice *)self setupConnection];
  id v7 = [(MSDKManagedDevice *)self connection];

  if (v7)
  {
    xpc_object_t v8 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v8, v6);

    LOBYTE(v10) = xpc_dictionary_get_BOOL(v9, "QueryDeviceInfoResult")
               && xpc_dictionary_get_BOOL(v9, "MSDDeviceInOfflineMode");
  }
  else
  {
    id v21 = 0;
    safeAssignError(&v21, 3727741186, @"Failed to establish xpc connection to demod.");
    id v10 = v21;
    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice isOfflineMode:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (v10)
    {
      id v20 = v10;
      *a3 = v20;

      LOBYTE(v10) = 0;
    }
    xpc_object_t v9 = 0;
  }

  return (char)v10;
}

- (BOOL)prepareWithWiFi:(id)a3 password:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"SSID";
  v11[1] = @"Password";
  v12[0] = a3;
  v12[1] = a4;
  xpc_object_t v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  xpc_object_t v9 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];

  LOBYTE(v8) = [(MSDKManagedDevice *)self _prepareWithOptions:v9];
  return (char)v8;
}

- (BOOL)isEnrolled
{
  return [(MSDKManagedDevice *)self _isEnrolled:0 checkDemo:0];
}

- (BOOL)isEnrolled:(id *)a3
{
  return [(MSDKManagedDevice *)self _isEnrolled:a3 checkDemo:1];
}

- (BOOL)isContentFrozen_xpc
{
  return [(MSDKManagedDevice *)self _isContentFrozen_xpc:0 checkDemo:0];
}

- (BOOL)isContentFrozen:(id *)a3
{
  return [(MSDKManagedDevice *)self _isContentFrozen_xpc:a3 checkDemo:1];
}

- (unint64_t)typeOfDemoDevice
{
  return [(MSDKManagedDevice *)self _typeOfDemoDevice:0 checkDemo:0];
}

- (unint64_t)typeOfDemoDevice:(id *)a3
{
  return [(MSDKManagedDevice *)self _typeOfDemoDevice:a3 checkDemo:1];
}

- (int64_t)getDemoInstallState
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v3 = 0;
LABEL_6:
    xpc_object_t v6 = 0;
    goto LABEL_7;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "QueryDeviceInfo", "MSDDemoDeviceInstallState");
  [(MSDKManagedDevice *)self setupConnection];
  id v4 = [(MSDKManagedDevice *)self connection];

  if (!v4)
  {
    xpc_object_t v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v9 getDemoInstallState];
    }

    goto LABEL_6;
  }
  xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  if (!xpc_dictionary_get_BOOL(v6, "QueryDeviceInfoResult"))
  {
LABEL_7:
    int64_t int64 = 0;
    goto LABEL_8;
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "MSDDemoDeviceInstallState");
LABEL_8:

  return int64;
}

- (BOOL)isContentFrozen
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.plist"];

  if (!v4) {
    return 0;
  }
  xpc_object_t v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.demo-settings.plist"];

  if (!v6) {
    return 0;
  }
  return [(MSDKManagedDevice *)self inferContentFrozenFromPreferencesFile];
}

- (BOOL)lockDemoContent
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "Demo");
  [(MSDKManagedDevice *)self setupConnection];
  int v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    int v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    int v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 lockDemoContent];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)unlockDemoContent
{
  return [(MSDKManagedDevice *)self _unlockDemoContentWithOptions:0 outError:0];
}

- (BOOL)revertDemoContent
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "DemoSnapshotRevert");
  [(MSDKManagedDevice *)self setupConnection];
  int v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    int v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    int v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 revertDemoContent];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)commitNewDemoContent
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "DemoSnapshotCommit");
  [(MSDKManagedDevice *)self setupConnection];
  int v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    int v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    int v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 commitNewDemoContent];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)unenroll:(BOOL)a3
{
  if (a3)
  {
    int v4 = [NSDictionary dictionaryWithObject:MEMORY[0x263EFFA88] forKey:@"ObliterateDevice"];
  }
  else
  {
    int v4 = 0;
  }
  BOOL v5 = [(MSDKManagedDevice *)self _unenrollWithOptions:v4 outError:0];

  return v5;
}

- (id)getDeviceOptions
{
  return [(MSDKManagedDevice *)self _getDeviceOptions:0 checkDemo:0];
}

- (id)getDeviceOptions:(id *)a3
{
  return [(MSDKManagedDevice *)self _getDeviceOptions:a3 checkDemo:1];
}

- (id)getStoreType:(id *)a3
{
  int v4 = [(MSDKManagedDevice *)self _getDeviceOptions:a3 checkDemo:1];
  BOOL v5 = v4;
  if (v4)
  {
    int v6 = [v4 objectForKey:@"store_type"];
    if (!v6) {
      safeAssignError(a3, 3727744773, @"Invalid device options.");
    }
  }
  else
  {
    safeAssignErrorNoOverwrite(a3, 3727744768, @"An error has occurred.");
    int v6 = 0;
  }

  return v6;
}

- (id)getStoreID
{
  return [(MSDKManagedDevice *)self _getStoreID:0 checkDemo:0];
}

- (id)getStoreID:(id *)a3
{
  return [(MSDKManagedDevice *)self _getStoreID:a3 checkDemo:1];
}

- (id)getFriendlyDeviceName
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v3 = 0;
LABEL_7:
    xpc_object_t v6 = 0;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "QueryDeviceInfo", "MSDFriendlyDeviceName");
  [(MSDKManagedDevice *)self setupConnection];
  int v4 = [(MSDKManagedDevice *)self connection];

  if (!v4)
  {
    uint64_t v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v11 getFriendlyDeviceName];
    }

    goto LABEL_7;
  }
  BOOL v5 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  BOOL v7 = xpc_dictionary_get_BOOL(v6, "QueryDeviceInfoResult");
  string = xpc_dictionary_get_string(v6, "MSDFriendlyDeviceName");
  uint64_t v9 = 0;
  if (v7 && string)
  {
    uint64_t v9 = [NSString stringWithUTF8String:string];
  }
LABEL_8:

  return v9;
}

- (BOOL)setStoreOpenAt:(int64_t)a3 openMinute:(int64_t)a4 closeHour:(int64_t)a5 closeMinute:(int64_t)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136315138;
    uint64_t v32 = "-[MSDKManagedDevice setStoreOpenAt:openMinute:closeHour:closeMinute:]";
    _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v31, 0xCu);
  }

  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    if ((unint64_t)a3 < 0x18)
    {
      if ((unint64_t)a5 < 0x18)
      {
        if ((unint64_t)a4 < 0x3C)
        {
          if ((unint64_t)a6 < 0x3C)
          {
            uint64_t v12 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v12, "RequestOperation", "SetStoreHour");
            xpc_dictionary_set_int64(v12, "OpenHour", a3);
            xpc_dictionary_set_int64(v12, "OpenMinute", a4);
            xpc_dictionary_set_int64(v12, "CloseHour", a5);
            xpc_dictionary_set_int64(v12, "CloseMinute", a6);
            [(MSDKManagedDevice *)self setupConnection];
            uint64_t v16 = [(MSDKManagedDevice *)self connection];

            uint64_t v17 = defaultLogHandle();
            uint64_t v18 = v17;
            if (v16)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v31) = 0;
                _os_log_impl(&dword_21EF08000, v18, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v31, 2u);
              }

              uint64_t v19 = [(MSDKManagedDevice *)self connection];
              xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(v19, v12);

              id v21 = defaultLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v31) = 0;
                _os_log_impl(&dword_21EF08000, v21, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: received response from xpc...", (uint8_t *)&v31, 2u);
              }

              uint64_t v22 = defaultLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = MEMORY[0x223C3E920](v20);
                int v31 = 136315138;
                uint64_t v32 = (const char *)v23;
                _os_log_impl(&dword_21EF08000, v22, OS_LOG_TYPE_DEFAULT, "xpc dictionary from reply: %s", (uint8_t *)&v31, 0xCu);
              }

              BOOL v14 = xpc_dictionary_get_BOOL(v20, "Result");
              goto LABEL_19;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[MSDKManagedDevice setStoreOpenAt:openMinute:closeHour:closeMinute:](v18, v24, v25, v26, v27, v28, v29, v30);
            }
          }
          else
          {
            uint64_t v12 = defaultLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v31) = 0;
              uint64_t v13 = "Close minute out of range.";
              goto LABEL_17;
            }
          }
        }
        else
        {
          uint64_t v12 = defaultLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31) = 0;
            uint64_t v13 = "Open minute out of range.";
            goto LABEL_17;
          }
        }
      }
      else
      {
        uint64_t v12 = defaultLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          uint64_t v13 = "Close hour out of range.";
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v12 = defaultLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        uint64_t v13 = "Open hour out of range.";
LABEL_17:
        _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v31, 2u);
      }
    }
    BOOL v14 = 0;
LABEL_19:

    return v14;
  }
  return 0;
}

- (BOOL)setIdleDelay:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    uint64_t v24 = "-[MSDKManagedDevice setIdleDelay:]";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v23, 0xCu);
  }

  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "RequestOperation", "SetScreenSaverIdleDelay");
  xpc_dictionary_set_int64(v6, "IdleDelay", a3);
  [(MSDKManagedDevice *)self setupConnection];
  BOOL v7 = [(MSDKManagedDevice *)self connection];

  id v8 = defaultLogHandle();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v23, 2u);
    }

    uint64_t v10 = [(MSDKManagedDevice *)self connection];
    uint64_t v9 = xpc_connection_send_message_with_reply_sync(v10, v6);

    uint64_t v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: received response from xpc...", (uint8_t *)&v23, 2u);
    }

    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = MEMORY[0x223C3E920](v9);
      int v23 = 136446210;
      uint64_t v24 = (const char *)v13;
      _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "xpc dictionary from reply: %{public}s", (uint8_t *)&v23, 0xCu);
    }

    BOOL v14 = xpc_dictionary_get_BOOL(v9, "Result");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice setIdleDelay:](v9, v16, v17, v18, v19, v20, v21, v22);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)configureWiFi:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "RequestOperation", "ConfigureWiFi");
    xpc_dictionary_set_string(v8, "SSID", (const char *)[v6 UTF8String]);
    if (v7) {
      xpc_dictionary_set_string(v8, "Password", (const char *)[v7 UTF8String]);
    }
    [(MSDKManagedDevice *)self setupConnection];
    uint64_t v9 = [(MSDKManagedDevice *)self connection];

    if (v9)
    {
      uint64_t v10 = [(MSDKManagedDevice *)self connection];
      uint64_t v11 = xpc_connection_send_message_with_reply_sync(v10, v8);

      BOOL v12 = xpc_dictionary_get_BOOL(v11, "Result");
    }
    else
    {
      uint64_t v11 = defaultLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice configureWiFi:password:](v11, v14, v15, v16, v17, v18, v19, v20);
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)disconnectAndForgetWiFi:(id *)a3
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    xpc_object_t v5 = 0;
    xpc_object_t v8 = 0;
    id v10 = 0;
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "DisconnectAndForgetWiFi");
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (!v6)
  {
    id v20 = 0;
    safeAssignError(&v20, 3727741186, @"Failed to establish xpc connection to demod.");
    id v10 = v20;
    BOOL v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice disconnectAndForgetWiFi:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (a3)
    {
      id v10 = v10;
      xpc_object_t v8 = 0;
      BOOL v9 = 0;
      *a3 = v10;
      goto LABEL_6;
    }
    xpc_object_t v8 = 0;
    goto LABEL_5;
  }
  id v7 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

  BOOL v9 = xpc_dictionary_get_BOOL(v8, "Result");
  id v10 = 0;
LABEL_6:

  return v9;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "RequestOperation", "SetLanguageAndRegion");
    xpc_dictionary_set_string(v8, "languageIdentifier", (const char *)[v6 UTF8String]);
    xpc_dictionary_set_string(v8, "regionCode", (const char *)[v7 UTF8String]);
    [(MSDKManagedDevice *)self setupConnection];
    BOOL v9 = [(MSDKManagedDevice *)self connection];

    if (v9)
    {
      id v10 = [(MSDKManagedDevice *)self connection];
      uint64_t v11 = xpc_connection_send_message_with_reply_sync(v10, v8);

      BOOL v12 = xpc_dictionary_get_BOOL(v11, "Result");
    }
    else
    {
      uint64_t v11 = defaultLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice setDeviceLanguage:andRegion:](v11, v14, v15, v16, v17, v18, v19, v20);
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)getDeviceLanguageandRegion
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[MSDKManagedDevice getDeviceLanguageandRegion]";
    _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "RequestOperation", "GetLanguageAndRegion");
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v5 = [(MSDKManagedDevice *)self connection];

  if (v5)
  {
    id v6 = [(MSDKManagedDevice *)self connection];
    id v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

    xpc_object_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v7, "languageIdentifier"));
    BOOL v9 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v7, "regionCode"));
    v19[0] = @"languageIdentifier";
    v19[1] = @"regionCode";
    v20[0] = v8;
    v20[1] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    id v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v7 getDeviceLanguageandRegion];
    }
    id v10 = 0;
  }

  return v10;
}

- (BOOL)saveBluetoothPairingInfo
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "SaveBTPairingInfo");
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 saveBluetoothPairingInfo];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)checkInBlockingUI
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "UICheckIn");
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 checkInBlockingUI];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)cancelOperation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "Cancel");
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v6 cancelOperation];
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isStoreOpen:(id *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "IsStoreOpen");
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    BOOL v7 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    BOOL v9 = xpc_dictionary_get_BOOL(v8, "ResultData");
    uint64_t v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MSDKManagedDevice isStoreOpen:](v9, v10);
    }

    id v11 = 0;
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    id v15 = 0;
    safeAssignError(&v15, 3727741186, @"Failed to establish xpc connection to demod.");
    id v13 = v15;
    id v11 = v13;
    if (a3)
    {
      id v11 = v13;
      *a3 = v11;
      if (v11)
      {
        uint64_t v14 = defaultLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MSDKManagedDevice isStoreOpen:](a3);
        }
      }
    }
    xpc_object_t v8 = 0;
    BOOL v9 = 0;
  }

  return v9;
}

- (id)nextStoreOpenDate:(id *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "NextStoreOpenDate");
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    BOOL v7 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    id v6 = [NSDictionary dictionaryWithXPCDictionary:v8];
    BOOL v9 = [v6 objectForKey:@"Result"];
    uint64_t v10 = v9;
    if (v9 && ([v9 BOOLValue] & 1) != 0)
    {
      uint64_t v11 = [v6 objectForKey:@"NextStoreHour"];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = defaultLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[MSDKManagedDevice nextStoreOpenDate:]();
        }

        id v14 = 0;
        if (a3) {
          *a3 = 0;
        }
        goto LABEL_9;
      }
      id v18 = 0;
      safeAssignError(&v18, 3727744768, @"Invalid value for nextStoreOpenDate returned by demod");
      id v14 = v18;
    }
    else
    {
      id v19 = 0;
      uint64_t v16 = [v6 objectForKey:@"ErrorMessage"];
      safeAssignError(&v19, 3727744515, (uint64_t)v16);
      id v14 = v19;
    }
  }
  else
  {
    id v20 = 0;
    safeAssignError(&v20, 3727741186, @"Failed to establish xpc connection to demod.");
    id v14 = v20;
    uint64_t v10 = 0;
    xpc_object_t v8 = 0;
  }
  if (a3)
  {
    id v14 = v14;
    *a3 = v14;
    if (v14)
    {
      uint64_t v17 = defaultLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice nextStoreOpenDate:](a3);
      }
    }
  }
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

- (id)nextStoreCloseDate:(id *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "NextStoreCloseDate");
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    BOOL v7 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    id v6 = [NSDictionary dictionaryWithXPCDictionary:v8];
    BOOL v9 = [v6 objectForKey:@"Result"];
    uint64_t v10 = v9;
    if (v9 && ([v9 BOOLValue] & 1) != 0)
    {
      uint64_t v11 = [v6 objectForKey:@"NextStoreHour"];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = defaultLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[MSDKManagedDevice nextStoreCloseDate:]();
        }

        id v14 = 0;
        if (a3) {
          *a3 = 0;
        }
        goto LABEL_9;
      }
      id v18 = 0;
      safeAssignError(&v18, 3727744768, @"Invalid value for nextStoreCloseDate returned by demod");
      id v14 = v18;
    }
    else
    {
      id v19 = 0;
      uint64_t v16 = [v6 objectForKey:@"ErrorMessage"];
      safeAssignError(&v19, 3727744515, (uint64_t)v16);
      id v14 = v19;
    }
  }
  else
  {
    id v20 = 0;
    safeAssignError(&v20, 3727741186, @"Failed to establish xpc connection to demod.");
    id v14 = v20;
    uint64_t v10 = 0;
    xpc_object_t v8 = 0;
  }
  if (a3)
  {
    id v14 = v14;
    *a3 = v14;
    if (v14)
    {
      uint64_t v17 = defaultLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice nextStoreCloseDate:](a3);
      }
    }
  }
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

- (void)updateStoreHours:(id)a3 evaluateAgainstDate:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 xpcArrayFromArray];
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "UpdateStoreHours");
  xpc_dictionary_set_value(v8, "RawStoreHours", v7);
  [v6 timeIntervalSince1970];
  double v10 = v9;

  xpc_dictionary_set_date(v8, "EvaluateAgainstDate", (uint64_t)v10);
  [(MSDKManagedDevice *)self setupConnection];
  uint64_t v11 = [(MSDKManagedDevice *)self connection];

  if (v11)
  {
    uint64_t v12 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v12, v8);

    if (xpc_dictionary_get_BOOL(v13, "Result")) {
      goto LABEL_6;
    }
  }
  else
  {
    id v15 = 0;
    safeAssignError(&v15, 3727741186, @"Failed to establish xpc connection to demod.");

    xpc_object_t v13 = 0;
  }
  id v14 = defaultLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[MSDKManagedDevice updateStoreHours:evaluateAgainstDate:]();
  }

LABEL_6:
}

- (BOOL)storeDataBlob:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    BOOL v13 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    BOOL v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice storeDataBlob:]();
    }
    goto LABEL_21;
  }
  if ((unint64_t)[v4 length] > 0x400000)
  {
    BOOL v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice storeDataBlob:](v4, v7);
    }
    goto LABEL_21;
  }
  xpc_object_t v5 = [(MSDKManagedDevice *)self getCacheIdentifier];
  id v6 = defaultLogHandle();
  BOOL v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice storeDataBlob:]();
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543618;
    uint64_t v24 = v5;
    __int16 v25 = 2048;
    uint64_t v26 = [v4 length];
    _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "uniqueIdentifier:%{public}@ %lu", (uint8_t *)&v23, 0x16u);
  }

  BOOL v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "RequestOperation", "StoreDataBlob");
  id v8 = v5;
  xpc_dictionary_set_string(v7, "ContainerUniqueIdentifier", (const char *)[v8 UTF8String]);
  id v9 = v4;
  xpc_dictionary_set_data(v7, "PersistentDataBlob", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
  [(MSDKManagedDevice *)self setupConnection];
  double v10 = [(MSDKManagedDevice *)self connection];

  if (!v10)
  {
    id v15 = defaultLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice storeDataBlob:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
    }

LABEL_21:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(v11, v7);

  BOOL v13 = xpc_dictionary_get_BOOL(v12, "Acknowledged");
LABEL_9:

LABEL_11:
  return v13;
}

- (id)retrieveDataBlob
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    xpc_object_t v4 = 0;
    xpc_object_t v7 = 0;
    id v8 = 0;
    id v3 = 0;
    goto LABEL_9;
  }
  id v3 = [(MSDKManagedDevice *)self getCacheIdentifier];
  if (!v3)
  {
    xpc_object_t v4 = 0;
LABEL_8:
    xpc_object_t v7 = 0;
    id v8 = 0;
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "RequestOperation", "RetrieveSavedDataBlob");
  id v3 = v3;
  xpc_dictionary_set_string(v4, "ContainerUniqueIdentifier", (const char *)[v3 UTF8String]);
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v5 = [(MSDKManagedDevice *)self connection];

  if (!v5)
  {
    BOOL v13 = defaultLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v13 retrieveDataBlob];
    }

    goto LABEL_8;
  }
  id v6 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  id v8 = xpc_dictionary_get_value(v7, "SavedDataBlob");
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  size_t length = xpc_data_get_length(v8);
  if (length)
  {
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes_ptr length:length];
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)deleteDataBlob
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  uint64_t v3 = [(MSDKManagedDevice *)self getCacheIdentifier];
  if (!v3) {
    return 0;
  }
  xpc_object_t v4 = (void *)v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "DeleteDataBlob");
  id v6 = v4;
  xpc_dictionary_set_string(v5, "ContainerUniqueIdentifier", (const char *)[v6 UTF8String]);
  [(MSDKManagedDevice *)self setupConnection];
  xpc_object_t v7 = [(MSDKManagedDevice *)self connection];

  if (v7)
  {
    id v8 = [(MSDKManagedDevice *)self connection];
    id v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    BOOL v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    uint64_t v11 = v6;
    id v6 = v9;
  }
  else
  {
    uint64_t v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice *)v11 deleteDataBlob];
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)getPersistentWiFiSsid
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = @"PersistentWiFiSSID";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  xpc_object_t v4 = [(MSDKManagedDevice *)self _getCurrentNetworkInfoForKeys:v3 outError:0];

  if (v4)
  {
    xpc_object_t v5 = [v4 objectForKey:@"PersistentWiFiSSID"];
  }
  else
  {
    xpc_object_t v5 = 0;
  }

  return v5;
}

- (BOOL)isDigitalSecurityEnabled
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[MSDKManagedDevice isDigitalSecurityEnabled]";
    _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v8, 0xCu);
  }

  xpc_object_t v4 = [(MSDKManagedDevice *)self _readOwnershipWarningFromNvram];
  if (!v4) {
    goto LABEL_9;
  }
  xpc_object_t v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[MSDKManagedDevice isDigitalSecurityEnabled]";
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarning:  %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (([v4 isEqualToString:@"1"] & 1) != 0
    || ([v4 isEqualToString:@"2"] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
LABEL_9:
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)needOwnershipWarning:(id *)a3
{
  return [(MSDKManagedDevice *)self _needOwnershipWarning:a3 error:0];
}

- (BOOL)clearOwnershipWarning
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[MSDKManagedDevice clearOwnershipWarning]";
    _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v19, 0xCu);
  }

  xpc_object_t v4 = [(MSDKManagedDevice *)self readNVRam:@"ownership-warning"];
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "command", "deleteNvram:");
    xpc_dictionary_set_string(v5, "payload", (const char *)[@"ownership-warning" cStringUsingEncoding:4]);
    [(MSDKManagedDevice *)self setupHelperConnection];
    BOOL v6 = [(MSDKManagedDevice *)self helperConnection];

    xpc_object_t v7 = defaultLogHandle();
    int v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v19, 2u);
      }

      id v9 = [(MSDKManagedDevice *)self helperConnection];
      int v8 = xpc_connection_send_message_with_reply_sync(v9, v5);

      BOOL v10 = xpc_dictionary_get_BOOL(v8, "result");
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(MSDKManagedDevice *)v8 clearOwnershipWarning];
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)saveStoreHour:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  xpc_object_t v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[MSDKManagedDevice saveStoreHour:]";
    _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  int64_t int64 = xpc_dictionary_get_int64(v3, "OpenHour");
  int64_t v6 = xpc_dictionary_get_int64(v3, "OpenMinute");
  int64_t v20 = xpc_dictionary_get_int64(v3, "CloseHour");
  int64_t v7 = xpc_dictionary_get_int64(v3, "CloseMinute");
  int v8 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"];
  if (!v8)
  {
    int v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  }
  id v9 = NSDictionary;
  BOOL v10 = [NSNumber numberWithInteger:int64];
  uint64_t v11 = [NSNumber numberWithInteger:v6];
  uint64_t v12 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"Hour", v11, @"Minute", 0);

  [v8 setObject:v12 forKey:@"StoreOpenAt"];
  uint64_t v13 = NSDictionary;
  uint64_t v14 = [NSNumber numberWithInteger:v20];
  uint64_t v15 = [NSNumber numberWithInteger:v7];
  uint64_t v16 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, @"Hour", v15, @"Minute", 0);

  [v8 setObject:v16 forKey:@"StoreCloseAt"];
  [v8 writeToFile:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist" atomically:1];
  uint64_t v17 = defaultLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[MSDKManagedDevice saveStoreHour:]";
    _os_log_impl(&dword_21EF08000, v17, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s will return", buf, 0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_BOOL(reply, "Result", 1);

  return reply;
}

- (id)saveScreenSaverIdleDelay:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  xpc_object_t v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDKManagedDevice saveScreenSaverIdleDelay:]";
    _os_log_impl(&dword_21EF08000, v4, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v11, 0xCu);
  }

  int64_t int64 = xpc_dictionary_get_int64(v3, "IdleDelay");
  int64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"];
  if (!v6)
  {
    int64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  }
  int64_t v7 = [NSNumber numberWithInteger:int64];
  [v6 setObject:v7 forKey:@"IdleDelayInMinutes"];

  [v6 writeToFile:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist" atomically:1];
  int v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[MSDKManagedDevice saveScreenSaverIdleDelay:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s will return", (uint8_t *)&v11, 0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_BOOL(reply, "Result", 1);

  return reply;
}

- (id)getScreenSaverConfig
{
  return (id)[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"];
}

- (BOOL)saveScreenSaverConfig:(id)a3
{
  return 1;
}

- (BOOL)setupConnection:(id)a3 withMachService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MSDKManagedDevice *)v8 valueForKey:v6];

  if (!v9)
  {
    mach_service = xpc_connection_create_mach_service((const char *)[v7 cStringUsingEncoding:4], 0, 0);
    [(MSDKManagedDevice *)v8 setValue:mach_service forKey:v6];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke;
    int v19 = &unk_2644FCA70;
    int64_t v20 = v8;
    id v11 = v6;
    id v21 = v11;
    xpc_connection_set_event_handler(mach_service, &v16);
    if (mach_service)
    {
      -[MSDKManagedDevice valueForKey:](v8, "valueForKey:", v11, v16, v17, v18, v19, v20);
      uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_resume(v12);
    }
  }
  objc_sync_exit(v8);

  uint64_t v13 = [(MSDKManagedDevice *)v8 valueForKey:v6];
  BOOL v14 = v13 != 0;

  return v14;
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x223C3EAB0]();
  xpc_object_t v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_3(v4, v5);
  }

  id v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_2((uint64_t)v3, v6);
  }

  if (v4 == MEMORY[0x263EF8720])
  {
    [*(id *)(a1 + 32) setValue:0 forKey:*(void *)(a1 + 40)];
    if (v3 == (id)MEMORY[0x263EF86A8])
    {
      id v7 = defaultLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v8 = "XPC_ERROR_CONNECTION_INVALID";
        id v9 = buf;
        goto LABEL_14;
      }
    }
    else
    {
      if (v3 != (id)MEMORY[0x263EF86A0]) {
        goto LABEL_16;
      }
      id v7 = defaultLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        int v8 = "XPC_ERROR_CONNECTION_INTERRUPTED";
        id v9 = (uint8_t *)&v10;
LABEL_14:
        _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }

    goto LABEL_16;
  }
  if (v4 != MEMORY[0x263EF8708]) {
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) handleMessage:v3];
LABEL_16:
}

- (BOOL)setupConnection
{
  return [(MSDKManagedDevice *)self setupConnection:@"connection" withMachService:@"com.apple.mobilestoredemod"];
}

- (BOOL)setupHelperConnection
{
  return [(MSDKManagedDevice *)self setupConnection:@"helperConnection" withMachService:@"com.apple.mobilestoredemodhelper"];
}

- (void)handleMessage:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "ContentUpdateStatus");
  if (string) {
    [(MSDKManagedDevice *)self handleContentUpdateStatus:string event:v5];
  }
}

- (void)handleContentUpdateStatus:(const char *)a3 event:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!strncmp(a3, "Error", 6uLL))
  {
    int v8 = [(MSDKManagedDevice *)self errorWithXPCDictionary:v6];
    id v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [v8 userInfo];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "Received an error: %{public}@", buf, 0xCu);
    }
    id v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "Will call didReceiveError with %{public}@", buf, 0xCu);
    }

    uint64_t v12 = [(MSDKManagedDevice *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      BOOL v14 = [(MSDKManagedDevice *)self delegate];
      [v14 didReceiveError:v8];
    }
  }
  else
  {
    if (!strncmp(a3, "Progress", 9uLL))
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v44 = 0;
      uint64_t v15 = defaultLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[MSDKManagedDevice handleContentUpdateStatus:event:]();
      }

      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke;
      applier[3] = &unk_2644FCA98;
      applier[4] = buf;
      xpc_dictionary_apply(v6, applier);
      uint64_t v16 = defaultLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(*(void *)&buf[8] + 24);
        *(_DWORD *)uint64_t v41 = 134217984;
        uint64_t v42 = v17;
        _os_log_impl(&dword_21EF08000, v16, OS_LOG_TYPE_DEFAULT, "Will call didReceiveProgress with %td", v41, 0xCu);
      }

      uint64_t v18 = [(MSDKManagedDevice *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        int64_t v20 = [(MSDKManagedDevice *)self delegate];
        [v20 didReceiveProgress:*(void *)(*(void *)&buf[8] + 24)];
      }
      goto LABEL_29;
    }
    if (strncmp(a3, "Completed", 0xAuLL))
    {
      if (strncmp(a3, "AllowContentUpdateCancel", 0x19uLL))
      {
        id v7 = defaultLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = a3;
          _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "Unkown message from xpc: %{public}s", buf, 0xCu);
        }

        goto LABEL_30;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v44) = 0;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke_194;
      v39[3] = &unk_2644FCA98;
      v39[4] = buf;
      xpc_dictionary_apply(v6, v39);
      uint64_t v28 = defaultLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
        *(_DWORD *)uint64_t v41 = 67109120;
        LODWORD(v42) = v29;
        _os_log_impl(&dword_21EF08000, v28, OS_LOG_TYPE_DEFAULT, "Will call didReceiveAllowCancel with %d", v41, 8u);
      }

      uint64_t v30 = [(MSDKManagedDevice *)self delegate];
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        uint64_t v32 = [(MSDKManagedDevice *)self delegate];
        [v32 didReceiveAllowCancel:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
      }
LABEL_29:
      _Block_object_dispose(buf, 8);
LABEL_30:
      int v8 = 0;
      goto LABEL_31;
    }
    int v8 = [(MSDKManagedDevice *)self errorWithXPCDictionary:v6];
    id v21 = defaultLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EF08000, v21, OS_LOG_TYPE_DEFAULT, "Will call operationCompleted.", buf, 2u);
      }

      uint64_t v33 = [(MSDKManagedDevice *)self delegate];
      char v34 = objc_opt_respondsToSelector();

      uint64_t v35 = [(MSDKManagedDevice *)self delegate];
      uint64_t v36 = v35;
      if (v34)
      {
        [v35 blockingStateChanged:0];
      }
      else
      {
        char v37 = objc_opt_respondsToSelector();

        if (v37)
        {
          uint64_t v38 = [(MSDKManagedDevice *)self delegate];
          [v38 operationCompleted];
        }
      }
      goto LABEL_30;
    }
    if (v22)
    {
      uint64_t v23 = [v8 code];
      uint64_t v24 = [v8 localizedDescription];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_21EF08000, v21, OS_LOG_TYPE_DEFAULT, "Will call operationFailed: with error %tx:%{public}@.", buf, 0x16u);
    }
    __int16 v25 = [(MSDKManagedDevice *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      uint64_t v27 = [(MSDKManagedDevice *)self delegate];
      [v27 operationFailed:v8];
    }
  }
LABEL_31:
}

uint64_t __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke(uint64_t a1, char *__s1, void *a3)
{
  if (!strncmp(__s1, "Percentage", 0xBuLL)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_int64_get_value(a3);
  }
  return 1;
}

uint64_t __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke_194(uint64_t a1, char *__s1, void *a3)
{
  if (!strncmp(__s1, "allowCancel", 0xCuLL)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_BOOL_get_value(a3);
  }
  return 1;
}

- (id)errorWithXPCDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __44__MSDKManagedDevice_errorWithXPCDictionary___block_invoke;
  applier[3] = &unk_2644FCAC0;
  applier[4] = &v20;
  void applier[5] = &v14;
  applier[6] = &v8;
  xpc_dictionary_apply(v3, applier);
  uint64_t v4 = v21[3];
  if (v4)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:v15[5] code:v4 userInfo:v9[5]];
  }
  else
  {
    id v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v5;
}

uint64_t __44__MSDKManagedDevice_errorWithXPCDictionary___block_invoke(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (!strncmp(a2, "ErrorCode", 0xAuLL))
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = xpc_int64_get_value(v5);
  }
  else if (!strncmp(a2, "ErrorDomain", 0xCuLL))
  {
    uint64_t v10 = [NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    uint64_t v11 = *(void *)(a1[5] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (strncmp(a2, "ContentUpdateStatus", 0x14uLL))
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (string_ptr)
    {
      id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
      uint64_t v8 = [NSString stringWithCString:string_ptr encoding:4];
      id v9 = [NSString stringWithCString:a2 encoding:4];
      [v7 setObject:v8 forKey:v9];
    }
  }

  return 1;
}

- (BOOL)inferContentFrozenFromPreferencesFile
{
  v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"demo-install-state"];

  uint64_t v4 = +[MSDPreferencesFile sharedInstance];
  id v5 = [v4 objectForKey:@"device_options"];
  id v6 = [v5 objectForKey:@"disable_snapshot_mode"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = [v3 integerValue] == 5;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (!v6)
    {
LABEL_8:
      LOBYTE(v8) = 1;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  int v8 = [v6 BOOLValue] ^ 1;
LABEL_9:
  BOOL v9 = v7 & v8;

  return v9;
}

- (id)getCacheIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    uint64_t v4 = (const void *)MGCopyAnswer();
    if (v4)
    {
      id v5 = v4;
      if (CFEqual(v4, @"Internal"))
      {
        id v6 = [MEMORY[0x263F08AB0] processInfo];
        id v3 = [v6 processName];
      }
      else
      {
        id v3 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)readNVRam:(id)a3
{
  id v3 = (__CFString *)a3;
  mach_port_t mainPort = 0;
  if (IOMasterPort(*MEMORY[0x263EF87F0], &mainPort))
  {
    NSLog(&cfstr_CouldnTLocateB.isa);
  }
  else
  {
    io_registry_entry_t v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v4)
    {
      io_object_t v5 = v4;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, v3, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      IOObjectRelease(v5);
      goto LABEL_4;
    }
    NSLog(&cfstr_CouldnTLocateO.isa);
  }
  CFProperty = 0;
LABEL_4:

  return CFProperty;
}

- (BOOL)_prepareWithOptions:(id)a3
{
  id v4 = a3;
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    goto LABEL_4;
  }
  if (v4)
  {
    io_object_t v5 = [v4 createXPCDictionary];
    if (!v5)
    {
LABEL_4:
      BOOL v6 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    io_object_t v5 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_string(v5, "RequestOperation", "DemoPrepare");
  [(MSDKManagedDevice *)self setupConnection];
  BOOL v7 = [(MSDKManagedDevice *)self connection];

  if (v7)
  {
    int v8 = [(MSDKManagedDevice *)self connection];
    BOOL v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    BOOL v6 = xpc_dictionary_get_BOOL(v9, "DemoPrepareAcknowledged");
  }
  else
  {
    BOOL v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice _prepareWithOptions:](v9, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v6 = 0;
  }

LABEL_9:
  return v6;
}

- (BOOL)_isEnrolled:(id *)a3 checkDemo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  BOOL v6 = self;
  objc_sync_enter(v6);
  BOOL v7 = [NSString stringWithUTF8String:"-[MSDKManagedDevice _isEnrolled:checkDemo:]"];
  if (![(MSDKManagedDevice *)v6 isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v13 = 0;
    uint64_t v14 = 0;
    xpc_object_t v15 = 0;
    xpc_object_t v16 = 0;
    LOBYTE(a3) = 0;
    goto LABEL_7;
  }
  int v8 = [(MSDKManagedDevice *)v6 xpc_cache];
  BOOL v9 = [v8 objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [(MSDKManagedDevice *)v6 xpc_cache];
    uint64_t v11 = [v10 objectForKey:v7];
    LODWORD(a3) = [v11 BOOLValue];

    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
      __int16 v41 = 1024;
      int v42 = (int)a3;
      _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %d", buf, 0x12u);
    }

    id v13 = 0;
    uint64_t v14 = 0;
    xpc_object_t v15 = 0;
    xpc_object_t v16 = 0;
    goto LABEL_7;
  }
  if (v4)
  {
    uint64_t v18 = +[MSDKDemoState sharedInstance];
    id v38 = 0;
    char v19 = [v18 _isDeviceEnrolledWithDeKOTA:&v38];
    id v13 = v38;

    if (v13)
    {
      xpc_object_t v16 = 0;
LABEL_20:
      if (a3)
      {
        id v13 = v13;
        uint64_t v14 = 0;
        xpc_object_t v15 = 0;
        uint64_t v32 = a3;
        LOBYTE(a3) = 0;
        *uint64_t v32 = v13;
      }
      else
      {
        uint64_t v14 = 0;
        xpc_object_t v15 = 0;
      }
      goto LABEL_7;
    }
    if ((v19 & 1) == 0)
    {
      uint64_t v33 = defaultLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
        _os_log_impl(&dword_21EF08000, v33, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      xpc_object_t v15 = 0;
      xpc_object_t v16 = 0;
      goto LABEL_26;
    }
  }
  uint64_t v20 = defaultLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
    _os_log_impl(&dword_21EF08000, v20, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "QueryDeviceInfo", "MSDDemoDeviceManaged");
  [(MSDKManagedDevice *)v6 setupConnection];
  id v21 = [(MSDKManagedDevice *)v6 connection];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    id v37 = 0;
    safeAssignError(&v37, 3727741186, @"Failed to establish xpc connection to demod.");
    id v13 = v37;
    uint64_t v24 = defaultLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice _isEnrolled:checkDemo:](v24, v25, v26, v27, v28, v29, v30, v31);
    }

    goto LABEL_20;
  }
  uint64_t v23 = [(MSDKManagedDevice *)v6 connection];
  xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v23, v16);

  if (!xpc_dictionary_get_BOOL(v15, "QueryDeviceInfoResult"))
  {
LABEL_26:
    a3 = 0;
    goto LABEL_27;
  }
  a3 = (id *)xpc_dictionary_get_BOOL(v15, "MSDDemoDeviceManaged");
LABEL_27:
  uint64_t v14 = (void *)MAEGetActivationStateWithError();
  id v13 = 0;
  if (!v13 && v14)
  {
    if ([v14 isEqualToString:*MEMORY[0x263F55840]])
    {
      char v34 = defaultLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
        __int16 v41 = 1024;
        int v42 = (int)a3;
        _os_log_impl(&dword_21EF08000, v34, OS_LOG_TYPE_DEFAULT, "%s - caching value %d", buf, 0x12u);
      }

      uint64_t v35 = [(MSDKManagedDevice *)v6 xpc_cache];
      uint64_t v36 = [NSNumber numberWithBool:a3];
      [v35 setObject:v36 forKey:v7];
    }
    id v13 = 0;
  }
LABEL_7:

  objc_sync_exit(v6);
  return (char)a3;
}

- (BOOL)_isContentFrozen_xpc:(id *)a3 checkDemo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x263EF8340];
  BOOL v6 = self;
  objc_sync_enter(v6);
  BOOL v7 = [NSString stringWithUTF8String:"-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]"];
  if (![(MSDKManagedDevice *)v6 isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v13 = 0;
    xpc_object_t v14 = 0;
    xpc_object_t v15 = 0;
LABEL_7:
    LOBYTE(a3) = 0;
    goto LABEL_30;
  }
  int v8 = [(MSDKManagedDevice *)v6 xpc_cache];
  BOOL v9 = [v8 objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [(MSDKManagedDevice *)v6 xpc_cache];
    uint64_t v11 = [v10 objectForKey:v7];
    LODWORD(a3) = [v11 BOOLValue];

    uint64_t v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
      __int16 v39 = 1024;
      int v40 = (int)a3;
      _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %d", buf, 0x12u);
    }

    id v13 = 0;
    xpc_object_t v14 = 0;
    xpc_object_t v15 = 0;
    goto LABEL_30;
  }
  if (v4)
  {
    xpc_object_t v16 = +[MSDKDemoState sharedInstance];
    id v36 = 0;
    char v17 = [v16 _isDeviceEnrolledWithDeKOTA:&v36];
    id v13 = v36;

    if (v13)
    {
      xpc_object_t v15 = 0;
LABEL_20:
      if (!a3)
      {
        xpc_object_t v14 = 0;
        goto LABEL_30;
      }
      id v13 = v13;
      xpc_object_t v14 = 0;
      *a3 = v13;
      goto LABEL_7;
    }
    if ((v17 & 1) == 0)
    {
      uint64_t v30 = defaultLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
        _os_log_impl(&dword_21EF08000, v30, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      xpc_object_t v14 = 0;
      xpc_object_t v15 = 0;
      goto LABEL_26;
    }
  }
  uint64_t v18 = defaultLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
    _os_log_impl(&dword_21EF08000, v18, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "QueryDeviceInfo", "MSDDemoDeviceFrozen");
  [(MSDKManagedDevice *)v6 setupConnection];
  char v19 = [(MSDKManagedDevice *)v6 connection];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    id v35 = 0;
    safeAssignError(&v35, 3727741186, @"Failed to establish xpc connection to demod.");
    id v13 = v35;
    BOOL v22 = defaultLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:](v22, v23, v24, v25, v26, v27, v28, v29);
    }

    goto LABEL_20;
  }
  id v21 = [(MSDKManagedDevice *)v6 connection];
  xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(v21, v15);

  if (!xpc_dictionary_get_BOOL(v14, "QueryDeviceInfoResult"))
  {
LABEL_26:
    a3 = 0;
    goto LABEL_27;
  }
  a3 = (id *)xpc_dictionary_get_BOOL(v14, "MSDDemoDeviceFrozen");
LABEL_27:
  uint64_t v31 = defaultLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
    __int16 v39 = 1024;
    int v40 = (int)a3;
    _os_log_impl(&dword_21EF08000, v31, OS_LOG_TYPE_DEFAULT, "%s - caching value %d", buf, 0x12u);
  }

  uint64_t v32 = [(MSDKManagedDevice *)v6 xpc_cache];
  uint64_t v33 = [NSNumber numberWithBool:a3];
  [v32 setObject:v33 forKey:v7];

  id v13 = 0;
LABEL_30:

  objc_sync_exit(v6);
  return (char)a3;
}

- (unint64_t)_typeOfDemoDevice:(id *)a3 checkDemo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  BOOL v6 = self;
  objc_sync_enter(v6);
  BOOL v7 = [NSString stringWithUTF8String:"-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]"];
  int v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  if (![(MSDKManagedDevice *)v6 isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    id v16 = 0;
    a3 = 0;
    xpc_object_t v17 = 0;
    goto LABEL_9;
  }
  BOOL v9 = [(MSDKManagedDevice *)v6 xpc_cache];
  uint64_t v10 = [v9 objectForKey:v7];

  if (v10)
  {
    uint64_t v11 = [(MSDKManagedDevice *)v6 xpc_cache];
    uint64_t v12 = [v11 objectForKey:v7];
    unsigned int v13 = [v12 BOOLValue];

    xpc_object_t v14 = defaultLogHandle();
    uint64_t int64 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
      __int16 v38 = 2048;
      uint64_t v39 = v13;
      _os_log_impl(&dword_21EF08000, v14, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %lu", buf, 0x16u);
    }

    id v16 = 0;
    a3 = 0;
    xpc_object_t v17 = 0;
    goto LABEL_10;
  }
  if (!v4 || (MGGetBoolAnswer() & 1) != 0)
  {
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v17, "QueryDeviceInfo", "MSDTypeOfDemoDevice");
    [(MSDKManagedDevice *)v6 setupConnection];
    char v19 = [(MSDKManagedDevice *)v6 connection];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      id v35 = 0;
      safeAssignError(&v35, 3727741186, @"Failed to establish xpc connection to demod.");
      id v16 = v35;
      uint64_t v27 = defaultLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _typeOfDemoDevice:checkDemo:](v27, v28, v29, v30, v31, v32, v33, v34);
      }

      if (a3)
      {
        id v16 = v16;
        uint64_t int64 = 0;
        *a3 = v16;
        a3 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      id v21 = [(MSDKManagedDevice *)v6 connection];
      a3 = (id *)xpc_connection_send_message_with_reply_sync(v21, v17);

      if (xpc_dictionary_get_BOOL(a3, "QueryDeviceInfoResult"))
      {
        uint64_t int64 = xpc_dictionary_get_uint64(a3, "MSDTypeOfDemoDevice");
        if (uint64 != 1)
        {
          id v16 = 0;
          goto LABEL_10;
        }
        goto LABEL_21;
      }
      id v16 = 0;
    }
LABEL_9:
    uint64_t int64 = 0;
    goto LABEL_10;
  }
  BOOL v22 = defaultLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
    _os_log_impl(&dword_21EF08000, v22, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
  }

  xpc_object_t v17 = 0;
  a3 = 0;
LABEL_21:
  uint64_t v23 = (void *)MAEGetActivationStateWithError();
  id v16 = 0;
  if (!v16 && v23 && [v23 isEqualToString:*MEMORY[0x263F55840]])
  {
    uint64_t v24 = defaultLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
      __int16 v38 = 2048;
      uint64_t v39 = 1;
      _os_log_impl(&dword_21EF08000, v24, OS_LOG_TYPE_DEFAULT, "%s - caching value %lu", buf, 0x16u);
    }

    uint64_t v25 = [(MSDKManagedDevice *)v6 xpc_cache];
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:1];
    [v25 setObject:v26 forKey:v7];
  }
  uint64_t int64 = 1;
LABEL_10:

  objc_sync_exit(v6);
  return uint64;
}

- (BOOL)_unlockDemoContentWithOptions:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    if (v6)
    {
      BOOL v7 = [v6 createXPCDictionary];
      if (!v7)
      {
        id v23 = 0;
        safeAssignError(&v23, 3727744769, @"Input is invalid");
        id v8 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v7 = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_string(v7, "RequestOperation", "DemoMaualUpdate");
    [(MSDKManagedDevice *)self setupConnection];
    uint64_t v11 = [(MSDKManagedDevice *)self connection];

    if (!v11)
    {
      id v22 = 0;
      safeAssignError(&v22, 3727741186, @"Failed to establish xpc connection to demod.");
      id v8 = v22;
      xpc_object_t v14 = defaultLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _unlockDemoContentWithOptions:outError:](v14, v15, v16, v17, v18, v19, v20, v21);
      }

LABEL_14:
      xpc_object_t v9 = 0;
      BOOL v10 = 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v12 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v12, v7);

    BOOL v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    id v8 = 0;
    if (a4)
    {
LABEL_9:
      id v8 = v8;
      *a4 = v8;
    }
  }
  else
  {
    BOOL v7 = 0;
    xpc_object_t v9 = 0;
    id v8 = 0;
    BOOL v10 = 0;
  }
LABEL_10:

  return v10;
}

- (BOOL)_unenrollWithOptions:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    if (v6)
    {
      BOOL v7 = [v6 createXPCDictionary];
      if (!v7)
      {
        id v23 = 0;
        safeAssignError(&v23, 3727744769, @"Input is invalid");
        id v8 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v7 = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_string(v7, "RequestOperation", "Virgin");
    [(MSDKManagedDevice *)self setupConnection];
    uint64_t v11 = [(MSDKManagedDevice *)self connection];

    if (!v11)
    {
      id v22 = 0;
      safeAssignError(&v22, 3727741186, @"Failed to establish xpc connection to demod.");
      id v8 = v22;
      xpc_object_t v14 = defaultLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _unenrollWithOptions:outError:](v14, v15, v16, v17, v18, v19, v20, v21);
      }

LABEL_14:
      xpc_object_t v9 = 0;
      BOOL v10 = 0;
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v12 = [(MSDKManagedDevice *)self connection];
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v12, v7);

    BOOL v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    id v8 = 0;
    if (a4)
    {
LABEL_9:
      id v8 = v8;
      *a4 = v8;
    }
  }
  else
  {
    safeAssignError(a4, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    BOOL v7 = 0;
    xpc_object_t v9 = 0;
    id v8 = 0;
    BOOL v10 = 0;
  }
LABEL_10:

  return v10;
}

- (id)_getDeviceOptions:(id *)a3 checkDemo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
LABEL_9:
    xpc_object_t v11 = 0;
    xpc_object_t v9 = 0;
    xpc_object_t v12 = 0;
LABEL_10:
    unsigned int v13 = 0;
    goto LABEL_21;
  }
  if (!v4) {
    goto LABEL_13;
  }
  BOOL v7 = +[MSDKDemoState sharedInstance];
  id v29 = 0;
  char v8 = [v7 _isDeviceEnrolledWithDeKOTA:&v29];
  xpc_object_t v9 = (char *)v29;

  if (!v9 && (v8 & 1) == 0)
  {
    BOOL v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[MSDKManagedDevice _getDeviceOptions:checkDemo:]";
      _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (v9)
  {
    xpc_object_t v11 = 0;
    xpc_object_t v12 = 0;
  }
  else
  {
LABEL_13:
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "RequestOperation", "GetDeviceOptions");
    [(MSDKManagedDevice *)self setupConnection];
    xpc_object_t v14 = [(MSDKManagedDevice *)self connection];

    if (v14)
    {
      uint64_t v15 = [(MSDKManagedDevice *)self connection];
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v15, v12);

      string = xpc_dictionary_get_string(v11, "device_options");
      xpc_object_t v9 = (char *)string;
      if (string)
      {
        uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:string length:strlen(string)];
        id v27 = 0;
        unsigned int v13 = [MEMORY[0x263F08900] JSONObjectWithData:v17 options:0 error:&v27];
        xpc_object_t v9 = (char *)v27;

        goto LABEL_21;
      }
    }
    else
    {
      id v28 = 0;
      safeAssignError(&v28, 3727741186, @"Failed to establish xpc connection to demod.");
      xpc_object_t v9 = (char *)v28;
      uint64_t v18 = defaultLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _getDeviceOptions:checkDemo:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      xpc_object_t v11 = 0;
    }
  }
  if (!a3) {
    goto LABEL_10;
  }
  xpc_object_t v9 = v9;
  unsigned int v13 = 0;
  *a3 = v9;
LABEL_21:

  return v13;
}

- (id)_getCurrentNetworkInfoForKeys:(id)a3 outError:(id *)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CurrentWiFiSSID", @"PersistentWiFiSSID", @"EmbeddedSIMInstalled", @"ActiveNetworkInterface", 0);
  if ([(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    if (v6
      && ([MEMORY[0x263EFFA08] setWithArray:v6],
          char v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isSubsetOfSet:v7],
          v8,
          (v9 & 1) != 0))
    {
      v63 = a4;
      BOOL v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v10, "RequestOperation", "GetCurrentNetworkInfo");
      xpc_object_t empty = xpc_array_create_empty();
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v65 != v15) {
              objc_enumerationMutation(v12);
            }
            xpc_object_t v17 = xpc_string_create((const char *)[*(id *)(*((void *)&v64 + 1) + 8 * i) UTF8String]);
            xpc_array_append_value(empty, v17);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
        }
        while (v14);
      }

      xpc_dictionary_set_value(v10, "NetworkInfoKeys", empty);
      [(MSDKManagedDevice *)self setupConnection];
      uint64_t v18 = [(MSDKManagedDevice *)self connection];

      if (v18)
      {
        uint64_t v19 = [(MSDKManagedDevice *)self connection];
        xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(v19, v10);

        if (v20 == (xpc_object_t)MEMORY[0x263EF86A8] || !v20 || v20 == (xpc_object_t)MEMORY[0x263EF86A0])
        {
          safeAssignError(v63, 3727741186, @"Failed to establish xpc connection to demod.");
          __int16 v48 = defaultLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:](v48, v49, v50, v51, v52, v53, v54, v55);
          }
        }
        else
        {
          id v21 = objc_alloc(NSDictionary);
          uint64_t v22 = xpc_dictionary_get_value(v20, "Result");
          uint64_t v23 = (void *)[v21 initWithXPCDictionary:v22];

          if (v23)
          {
            uint64_t v24 = v23;

            BOOL v10 = v24;
            goto LABEL_20;
          }
          safeAssignError(v63, 3727741189, @"Unexpected demod xpc response.");
          __int16 v48 = defaultLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.4(v48, v56, v57, v58, v59, v60, v61, v62);
          }
        }
      }
      else
      {
        safeAssignError(v63, 3727741186, @"Failed to establish xpc connection to demod.");
        uint64_t v40 = defaultLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:](v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
    else
    {
      safeAssignError(a4, 3727744769, @"Input is invalid");
      BOOL v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:](v10, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
  else
  {
    safeAssignError(a4, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
    BOOL v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.5(v10, v33, v34, v35, v36, v37, v38, v39);
    }
  }
  uint64_t v24 = 0;
LABEL_20:

  return v24;
}

- (id)_getStoreID:(id *)a3 checkDemo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![(MSDKManagedDevice *)self isDeviceClassSupported])
  {
    safeAssignError(a3, 3727741188, @"Device is unsupported by MobileStoreDemoKit.");
LABEL_9:
    xpc_object_t v11 = 0;
    id v9 = 0;
    xpc_object_t v12 = 0;
LABEL_10:
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  if (!v4) {
    goto LABEL_14;
  }
  BOOL v7 = +[MSDKDemoState sharedInstance];
  id v27 = 0;
  char v8 = [v7 _isDeviceEnrolledWithDeKOTA:&v27];
  id v9 = v27;

  if (!v9 && (v8 & 1) == 0)
  {
    BOOL v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[MSDKManagedDevice _getStoreID:checkDemo:]";
      _os_log_impl(&dword_21EF08000, v10, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (v9)
  {
    xpc_object_t v11 = 0;
    xpc_object_t v12 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_14:
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "RequestOperation", "GetDeviceOptions");
    xpc_dictionary_set_string(v12, "SubKey", (const char *)[@"store_id" UTF8String]);
    [(MSDKManagedDevice *)self setupConnection];
    uint64_t v14 = [(MSDKManagedDevice *)self connection];

    if (v14)
    {
      uint64_t v15 = [(MSDKManagedDevice *)self connection];
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v15, v12);

      string = xpc_dictionary_get_string(v11, (const char *)[@"store_id" UTF8String]);
      if (string)
      {
        uint64_t v13 = [NSString stringWithUTF8String:string];
        id v9 = 0;
        goto LABEL_19;
      }
      id v9 = 0;
      if (!a3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v26 = 0;
      safeAssignError(&v26, 3727741186, @"Failed to establish xpc connection to demod.");
      id v9 = v26;
      uint64_t v18 = defaultLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MSDKManagedDevice _getStoreID:checkDemo:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      xpc_object_t v11 = 0;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }
  id v9 = v9;
  uint64_t v13 = 0;
  *a3 = v9;
LABEL_19:

  return v13;
}

- (id)_readOwnershipWarningFromNvram
{
  v2 = [(MSDKManagedDevice *)self readNVRam:@"ownership-warning"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = objc_msgSend(NSString, "stringWithCString:encoding:", objc_msgSend(v2, "bytes"), 4);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_needOwnershipWarning:(id *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[MSDKManagedDevice _needOwnershipWarning:error:]";
    _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  char v8 = (void *)MAEGetActivationStateWithError();
  id v9 = 0;
  if (!v9
    && v8
    && (([v8 isEqualToString:*MEMORY[0x263F55840]] & 1) != 0
     || ([v8 isEqualToString:*MEMORY[0x263F55848]] & 1) != 0))
  {
    BOOL v10 = 0;
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_17;
  }
  BOOL v10 = [(MSDKManagedDevice *)self _readOwnershipWarningFromNvram];
  if (!v10) {
    goto LABEL_18;
  }
  xpc_object_t v12 = defaultLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[MSDKManagedDevice _needOwnershipWarning:error:]";
    __int16 v16 = 2114;
    xpc_object_t v17 = v10;
    _os_log_impl(&dword_21EF08000, v12, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarning:  %{public}@", buf, 0x16u);
  }

  if (([v10 isEqualToString:@"1"] & 1) == 0
    && ![v10 isEqualToString:@"2"])
  {
LABEL_18:
    if (a4)
    {
      BOOL v11 = 0;
      *a4 = v9;
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    *a3 = +[MSDLocalization getLocalizedOwnershipWarnings:v10];
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)helperConnection
{
  return self->_helperConnection;
}

- (void)setHelperConnection:(id)a3
{
}

- (NSMutableDictionary)xpc_cache
{
  return self->_xpc_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc_cache, 0);
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)stashCurrentWallpaperSettingsIfNeeded
{
  return [(MSDKManagedDevice *)self _manageWallpaperSettingsWithAction:"Stash"];
}

- (BOOL)restoreWallpaperSettingsIfNeeded
{
  return [(MSDKManagedDevice *)self _manageWallpaperSettingsWithAction:"Restore"];
}

- (BOOL)_manageWallpaperSettingsWithAction:(const char *)a3
{
  if (![(MSDKManagedDevice *)self isDeviceClassSupported]) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "ManageWallpaperSettings");
  xpc_dictionary_set_string(v5, "Action", a3);
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    BOOL v7 = [(MSDKManagedDevice *)self connection];
    char v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    BOOL v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    char v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(Wallpaper) _manageWallpaperSettingsWithAction:](v8);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)retrieveXPCConnectionToPeerService
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "SetUpPeerService");
  [(MSDKManagedDevice *)self setupConnection];
  BOOL v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    if (MEMORY[0x223C3EAB0](v6) == MEMORY[0x263EF8720])
    {
      uint64_t v19 = defaultLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(MSDKManagedDevice(PeerService) *)v19 retrieveXPCConnectionToPeerService];
      }
    }
    else if (xpc_dictionary_get_BOOL(v6, "Result"))
    {
      uint64_t v7 = xpc_dictionary_get_value(v6, "PeerServiceXPCEndpoint");
      if (v7)
      {
        char v8 = (void *)v7;
        BOOL v9 = objc_alloc_init(MEMORY[0x263F08D98]);
        [v9 _setEndpoint:v8];
        BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v9];

        id v6 = v9;
        goto LABEL_6;
      }
      uint64_t v19 = defaultLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(MSDKManagedDevice(PeerService) *)v19 retrieveXPCConnectionToPeerService];
      }
    }
    else
    {
      uint64_t v19 = defaultLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(MSDKManagedDevice(PeerService) *)v19 retrieveXPCConnectionToPeerService];
      }
    }
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MSDKManagedDevice(PeerService) *)v6 retrieveXPCConnectionToPeerService];
    }
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)isFeatureFlagEnabled:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "queryFeatureFlag");
  id v6 = v4;
  uint64_t v7 = (const char *)[v6 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v5, "FeatureFlag", v7);
  [(MSDKManagedDevice *)self setupConnection];
  char v8 = [(MSDKManagedDevice *)self connection];

  if (v8)
  {
    BOOL v9 = [(MSDKManagedDevice *)self connection];
    BOOL v10 = xpc_connection_send_message_with_reply_sync(v9, v5);

    BOOL v11 = xpc_dictionary_get_BOOL(v10, "Result");
  }
  else
  {
    BOOL v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(FeatureFlag) isFeatureFlagEnabled:](v10);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)refreshDeviceSettings
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "RefreshDeviceSettings");
  [(MSDKManagedDevice *)self setupConnection];
  id v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(RefreshSettings) refreshDeviceSettings](v6);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)initializeDeviceSettingsWithOverwrite:(BOOL)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "InitializeDeviceSettings");
  xpc_dictionary_set_BOOL(v5, "InitializeSettingsOverwrite", a3);
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (v6)
  {
    BOOL v7 = [(MSDKManagedDevice *)self connection];
    char v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    BOOL v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    char v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(RefreshSettings) initializeDeviceSettingsWithOverwrite:](v8);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)launchApp:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  [(MSDKManagedDevice *)self setupConnection];
  id v6 = [(MSDKManagedDevice *)self connection];

  if (!v6)
  {
    BOOL v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(Test) launchApp:](v7);
    }
  }
  xpc_dictionary_set_string(v5, "RequestOperation", "LaunchApp");
  id v8 = v4;
  BOOL v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(v5, "BundleID", v9);
  BOOL v10 = [(MSDKManagedDevice *)self connection];
  xpc_connection_send_message(v10, v5);
}

- (BOOL)reloadDemodsPreferencesFile
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  [(MSDKManagedDevice *)self setupConnection];
  id v4 = [(MSDKManagedDevice *)self connection];

  if (!v4)
  {
    xpc_object_t v5 = defaultLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(Test) reloadDemodsPreferencesFile](v5);
    }
  }
  xpc_dictionary_set_string(v3, "RequestOperation", "ReloadDemodsPreferencesFile");
  id v6 = [(MSDKManagedDevice *)self connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v3);

  LOBYTE(v6) = xpc_dictionary_get_BOOL(v7, "Result");
  return (char)v6;
}

- (BOOL)clearCurrentSafariHistory
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "ClearSafariHistory");
  [(MSDKManagedDevice *)self setupConnection];
  id v4 = [(MSDKManagedDevice *)self connection];

  if (v4)
  {
    xpc_object_t v5 = [(MSDKManagedDevice *)self connection];
    id v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    BOOL v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSDKManagedDevice(ClearSafariHistory) clearCurrentSafariHistory](v6);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setSEPDemoMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enterOfflineModeWithOptions:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isOfflineMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDemoInstallState
{
}

- (void)lockDemoContent
{
}

- (void)revertDemoContent
{
}

- (void)commitNewDemoContent
{
}

- (void)isBetterTogetherDemoDevice
{
}

- (void)getFriendlyDeviceName
{
}

- (void)setStoreOpenAt:(uint64_t)a3 openMinute:(uint64_t)a4 closeHour:(uint64_t)a5 closeMinute:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIdleDelay:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configureWiFi:(uint64_t)a3 password:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)disconnectAndForgetWiFi:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDeviceLanguageandRegion
{
}

- (void)saveBluetoothPairingInfo
{
}

- (void)checkInBlockingUI
{
}

- (void)cancelOperation
{
}

- (void)isStoreOpen:(id *)a1 .cold.1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_21EF08000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);
}

- (void)isStoreOpen:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[MSDKManagedDevice isStoreOpen:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "%s - result :%d", (uint8_t *)&v2, 0x12u);
}

- (void)nextStoreOpenDate:(id *)a1 .cold.1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_21EF08000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);
}

- (void)nextStoreOpenDate:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_21EF08000, v0, OS_LOG_TYPE_DEBUG, "%s Date: %@", (uint8_t *)v1, 0x16u);
}

- (void)nextStoreCloseDate:(id *)a1 .cold.1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_21EF08000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);
}

- (void)nextStoreCloseDate:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_21EF08000, v0, OS_LOG_TYPE_DEBUG, "%s Date: %@", (uint8_t *)v1, 0x16u);
}

- (void)updateStoreHours:evaluateAgainstDate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Failed to update demod's saved store hours", v2, v3, v4, v5, v6);
}

- (void)storeDataBlob:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "there is no data to store.", v2, v3, v4, v5, v6);
}

- (void)storeDataBlob:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Data store size requested (%lu) is greater than MAX limit", (uint8_t *)&v3, 0xCu);
}

- (void)storeDataBlob:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_21EF08000, v0, v1, "Could not create a valid unique identifier.", v2, v3, v4, v5, v6);
}

- (void)storeDataBlob:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)retrieveDataBlob
{
}

- (void)deleteDataBlob
{
}

- (void)clearOwnershipWarning
{
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_1()
{
  __assert_rtn("-[MSDKManagedDevice setupConnection:withMachService:]_block_invoke", "MSDKManagedDevice.m", 1964, "type == XPC_TYPE_DICTIONARY");
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136446210;
  uint64_t v4 = MEMORY[0x223C3E920]();
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "description of xpc reply: %{public}s", (uint8_t *)&v3, 0xCu);
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "XPC type is %{public}@\n", (uint8_t *)&v2, 0xCu);
}

- (void)handleContentUpdateStatus:event:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21EF08000, v0, OS_LOG_TYPE_DEBUG, "Receiving a progress", v1, 2u);
}

- (void)_prepareWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isEnrolled:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_isContentFrozen_xpc:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_typeOfDemoDevice:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_unlockDemoContentWithOptions:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_unenrollWithOptions:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getDeviceOptions:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getStoreID:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end