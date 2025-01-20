@interface NPKExpressGymKitAvailabilityManager
- (BOOL)isExpressGymKitAllowed;
- (NPKExpressGymKitAvailabilityManager)init;
- (NPKExpressGymKitAvailabilityManager)initWithDelegate:(id)a3;
- (NPKExpressGymKitAvailabilityManagerDelegate)delegate;
- (PKPaymentPass)conflictingPass;
- (id)_conflictingPassUniqueID;
- (void)allowEnableExpressGymKitWithVisibleViewController:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation NPKExpressGymKitAvailabilityManager

- (NPKExpressGymKitAvailabilityManager)init
{
  return [(NPKExpressGymKitAvailabilityManager *)self initWithDelegate:0];
}

- (NPKExpressGymKitAvailabilityManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKExpressGymKitAvailabilityManager;
  v5 = [(NPKExpressGymKitAvailabilityManager *)&v13 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = (const char *)[@"com.apple.nanopasskit.expressGymKitAvailable.didChange" UTF8String];
    v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__NPKExpressGymKitAvailabilityManager_initWithDelegate___block_invoke;
    v10[3] = &unk_2644D2870;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v5->_notificationToken, v7, v10);

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __56__NPKExpressGymKitAvailabilityManager_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained isExpressGymKitAllowed];
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [WeakRetained delegate];
      uint64_t v7 = objc_opt_class();
      id v8 = [WeakRetained delegate];
      int v10 = 138413058;
      id v11 = WeakRetained;
      __int16 v12 = 1024;
      int v13 = v2;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      v17 = v8;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@ handling com.apple.nanopasskit.expressGymKitAvailable.didChange notification isAllowed:%d delegate:<%@:%p>", (uint8_t *)&v10, 0x26u);
    }
  }
  v9 = [WeakRetained delegate];
  [v9 expressGymKitAvailabilityManager:WeakRetained didChangeIsExpressGymKitAllowed:v2];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_notificationToken)) {
    notify_cancel(self->_notificationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKExpressGymKitAvailabilityManager;
  [(NPKExpressGymKitAvailabilityManager *)&v3 dealloc];
}

- (BOOL)isExpressGymKitAllowed
{
  uint64_t v2 = [(NPKExpressGymKitAvailabilityManager *)self _conflictingPassUniqueID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (PKPaymentPass)conflictingPass
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v2 = [(NPKExpressGymKitAvailabilityManager *)self _conflictingPassUniqueID];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(NPKCompanionAgentConnection);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __54__NPKExpressGymKitAvailabilityManager_conflictingPass__block_invoke;
    v6[3] = &unk_2644D2898;
    v6[4] = &v7;
    [(NPKCompanionAgentConnection *)v3 paymentPassWithUniqueID:v2 synchronous:1 reply:v6];
  }
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (PKPaymentPass *)v4;
}

void __54__NPKExpressGymKitAvailabilityManager_conflictingPass__block_invoke(uint64_t a1, void *a2)
{
}

- (id)_conflictingPassUniqueID
{
  uint64_t v2 = NPKDomainAccessorForDomain(@"com.apple.nanopasskit.shared");
  BOOL v3 = [v2 stringForKey:@"NPKExpressGymKitConflictPassUniqueID"];

  return v3;
}

- (void)allowEnableExpressGymKitWithVisibleViewController:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: requested allow enable express GymKit with view controller:%@", buf, 0xCu);
    }
  }
  int v10 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/NanoPreferenceBundles/Applications/NanoPassbookBridgeSettings.bundle"];
  int v11 = [v10 isLoaded];
  id v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    __int16 v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v10;
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: Found settings bundle:%@ loaded:%d", buf, 0x12u);
    }
  }
  if ((v11 & 1) == 0) {
    [v10 load];
  }
  uint64_t v15 = (objc_class *)[v10 classNamed:@"NPKPassbookBridgeSettingsController"];
  if ([(objc_class *)v15 conformsToProtocol:&unk_26D045898])
  {
    id v16 = objc_alloc_init(v15);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __100__NPKExpressGymKitAvailabilityManager_allowEnableExpressGymKitWithVisibleViewController_completion___block_invoke;
    v17[3] = &unk_2644D28C0;
    id v18 = v6;
    [v16 allowEnableExpressGymKitWithVisibleViewController:v5 completion:v17];
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, [MEMORY[0x263F087E8] errorWithDomain:@"NPKExpressGymKitAvailabilityManagerErrorDomain" code:1 userInfo:0]);
  }
}

void __100__NPKExpressGymKitAvailabilityManager_allowEnableExpressGymKitWithVisibleViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = a2;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKExpressGymKitAvailabilityManager: did allowed enable express GymKit:%d error:%@", (uint8_t *)v9, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NPKExpressGymKitAvailabilityManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKExpressGymKitAvailabilityManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end