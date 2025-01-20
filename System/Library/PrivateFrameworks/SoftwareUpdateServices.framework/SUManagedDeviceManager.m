@interface SUManagedDeviceManager
+ (id)sharedInstance;
- (BOOL)allowSplat;
- (BOOL)allowSplatRollback;
- (BOOL)isDelayingUpdates;
- (BOOL)isManagedByMDM;
- (SUManagedDeviceManager)init;
- (SUManagedDeviceManagerDelegate)delegate;
- (SUManagedDeviceUpdateDelay)mdmDelay;
- (unint64_t)MCPathToSUMDMPath:(int64_t)a3;
- (unint64_t)delayPeriodInDays;
- (unint64_t)softwareUpdatePathRestriction;
- (void)dealloc;
- (void)profileChanged;
- (void)refreshAssetAudience;
- (void)registerProfileChangeListener;
- (void)setAssetAudience:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMdmDelay:(id)a3;
- (void)unregisterProfileChangeListener;
@end

@implementation SUManagedDeviceManager

- (SUManagedDeviceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUManagedDeviceManager;
  v2 = [(SUManagedDeviceManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.softwareupdateservices.mdmWorkQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = +[SUState currentState];
    uint64_t v6 = [v5 lastAssetAudience];
    assetAudience = v2->_assetAudience;
    v2->_assetAudience = (NSString *)v6;

    v2->_notifyToken = 0;
    [(SUManagedDeviceManager *)v2 registerProfileChangeListener];
  }
  return v2;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0;

  [(SUManagedDeviceManager *)self unregisterProfileChangeListener];
  v4.receiver = self;
  v4.super_class = (Class)SUManagedDeviceManager;
  [(SUManagedDeviceManager *)&v4 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_2 != -1) {
    dispatch_once(&sharedInstance_pred_2, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance___instance_6;
  return v2;
}

uint64_t __40__SUManagedDeviceManager_sharedInstance__block_invoke()
{
  sharedInstance___instance_6 = objc_alloc_init(SUManagedDeviceManager);
  return MEMORY[0x270F9A758]();
}

- (BOOL)isManagedByMDM
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isSupervised];

  return v3;
}

- (BOOL)isDelayingUpdates
{
  BOOL v2 = [(SUManagedDeviceManager *)self isManagedByMDM];
  if (v2)
  {
    char v3 = [MEMORY[0x263F53C50] sharedConnection];
    char v4 = [v3 isSoftwareUpdateResisted];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)allowSplat
{
  BOOL v2 = [(SUManagedDeviceManager *)self isManagedByMDM];
  if (v2)
  {
    char v3 = [MEMORY[0x263F53C50] sharedConnection];
    char v4 = [v3 isRapidSecurityResponseInstallationAllowed];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)allowSplatRollback
{
  BOOL v2 = [(SUManagedDeviceManager *)self isManagedByMDM];
  if (v2)
  {
    char v3 = [MEMORY[0x263F53C50] sharedConnection];
    char v4 = [v3 isRapidSecurityResponseRemovalAllowed];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (unint64_t)delayPeriodInDays
{
  if (![(SUManagedDeviceManager *)self isDelayingUpdates]) {
    return 0;
  }
  BOOL v2 = [MEMORY[0x263F53C50] sharedConnection];
  unint64_t v3 = [v2 enforcedSoftwareUpdateDelayInDays];

  return v3;
}

- (unint64_t)softwareUpdatePathRestriction
{
  if (![(SUManagedDeviceManager *)self isManagedByMDM]) {
    return 3;
  }
  unint64_t v3 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v4 = [v3 softwareUpdatePath];

  return [(SUManagedDeviceManager *)self MCPathToSUMDMPath:v4];
}

- (void)registerProfileChangeListener
{
  unint64_t v3 = (const char *)[(id)*MEMORY[0x263F53B18] UTF8String];
  uint64_t v4 = +[SUUtility mainWorkQueue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__SUManagedDeviceManager_registerProfileChangeListener__block_invoke;
  handler[3] = &unk_26447DBF0;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_notifyToken, v4, handler);
}

uint64_t __55__SUManagedDeviceManager_registerProfileChangeListener__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Received profile change notification in registerProfileChangeListener", a2, a3, a4, a5, a6, a7, a8, v11);
  objc_super v9 = *(void **)(a1 + 32);
  return [v9 profileChanged];
}

- (void)unregisterProfileChangeListener
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
}

- (void)profileChanged
{
  SULogInfo(@"recived profile change notification", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v11);
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  v10 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUManagedDeviceManager_profileChanged__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_after(v9, v10, block);
}

void __40__SUManagedDeviceManager_profileChanged__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  MEMORY[0x223C17D00](@"com.apple.MobileAsset.SoftwareUpdate");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setAssetAudience:v2];
}

- (void)setAssetAudience:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUManagedDeviceManager_setAssetAudience___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

void __43__SUManagedDeviceManager_setAssetAudience___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 16) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    SULogInfo(@"Asset audience changed from:%@ to:%@", v2, v3, v4, v5, v6, v7, v8, *(void *)(*(void *)(a1 + 32) + 16));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    id v9 = +[SUState currentState];
    [v9 setLastAssetAudience:*(void *)(*(void *)(a1 + 32) + 16)];
    [v9 save];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "assetAudienceChanged:");
    }
  }
}

- (void)refreshAssetAudience
{
  MEMORY[0x223C17D00](@"com.apple.MobileAsset.SoftwareUpdate", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SUManagedDeviceManager *)self setAssetAudience:v3];
}

- (unint64_t)MCPathToSUMDMPath:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (SUManagedDeviceManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (SUManagedDeviceUpdateDelay)mdmDelay
{
  return self->_mdmDelay;
}

- (void)setMdmDelay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmDelay, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end