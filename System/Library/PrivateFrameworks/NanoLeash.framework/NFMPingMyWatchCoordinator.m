@interface NFMPingMyWatchCoordinator
+ (BOOL)isPingMySupportedOnActiveDevice;
+ (void)_updateActiveDeviceSupportedState:(id)a3;
- (NFMPingMyWatchCoordinator)init;
- (NFMPingMyWatchCoordinatorDelegate)delegate;
- (void)_nanoRegistryStatusChanged:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)updatePingMyWatchSupportStateIfNeeded;
@end

@implementation NFMPingMyWatchCoordinator

- (NFMPingMyWatchCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)NFMPingMyWatchCoordinator;
  v2 = [(NFMPingMyWatchCoordinator *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__onActiveDeviceChange name:*MEMORY[0x263F57688] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__onActiveDeviceChange name:*MEMORY[0x263F57690] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__nanoRegistryStatusChanged_ name:*MEMORY[0x263F576E0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NFMPingMyWatchCoordinator;
  [(NFMPingMyWatchCoordinator *)&v4 dealloc];
}

- (void)_nanoRegistryStatusChanged:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x263F576E8]];

  if ([v5 unsignedIntegerValue] == 5)
  {
    v6 = nfm_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_24011F000, v6, OS_LOG_TYPE_DEFAULT, "########### Active device is unpairing. Updating PingMyWatch state to unsupported", v8, 2u);
    }

    CFPreferencesSetAppValue(@"isPingMySupported", (CFPropertyListRef)[NSNumber numberWithBool:0], @"com.apple.NanoLeash.NFMPingMyWatch");
    objc_super v7 = [(NFMPingMyWatchCoordinator *)self delegate];
    [v7 pingMyWatchCapabilityDidChange];
  }
}

- (void)updatePingMyWatchSupportStateIfNeeded
{
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Updating PingMyWatch support", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__NFMPingMyWatchCoordinator_updatePingMyWatchSupportStateIfNeeded__block_invoke;
  v4[3] = &unk_26509BD78;
  v4[4] = self;
  +[NFMPingMyWatchCoordinator _updateActiveDeviceSupportedState:v4];
}

void __66__NFMPingMyWatchCoordinator_updatePingMyWatchSupportStateIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 pingMyWatchCapabilityDidChange];
}

+ (BOOL)isPingMySupportedOnActiveDevice
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"isPingMySupported", @"com.apple.NanoLeash.NFMPingMyWatch", 0);
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = AppBooleanValue != 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Reading PingMyWatch support value: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  return AppBooleanValue != 0;
}

+ (void)_updateActiveDeviceSupportedState:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__NFMPingMyWatchCoordinator__updateActiveDeviceSupportedState___block_invoke;
  v7[3] = &unk_26509BDA0;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__NFMPingMyWatchCoordinator__updateActiveDeviceSupportedState___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C5BAD2E8-BB79-4E9E-8A0D-757C60D31053"];
  uint64_t v5 = [v3 supportsCapability:v4];

  uint64_t v6 = v5 ^ [*(id *)(a1 + 40) isPingMySupportedOnActiveDevice];
  if (v6 == 1)
  {
    CFPreferencesSetAppValue(@"isPingMySupported", (CFPropertyListRef)[NSNumber numberWithBool:v5], @"com.apple.NanoLeash.NFMPingMyWatch");
    objc_super v7 = nfm_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v10 = 67109120;
    int v11 = v5;
    id v8 = "########### Updated PingMyWatch support to: %{BOOL}d";
  }
  else
  {
    objc_super v7 = nfm_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v10 = 67109120;
    int v11 = v5;
    id v8 = "###########  PingMyWatch support has not changed. isSupported: %{BOOL}d";
  }
  _os_log_impl(&dword_24011F000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 8u);
LABEL_7:

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v6);
  }
}

- (NFMPingMyWatchCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NFMPingMyWatchCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end