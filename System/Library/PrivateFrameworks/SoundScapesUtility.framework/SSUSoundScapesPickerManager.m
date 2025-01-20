@interface SSUSoundScapesPickerManager
+ (BOOL)pickerSupportHome:(id)a3 targetMediaProfileContainers:(id)a4;
+ (id)pickerForMediaProfileContainers:(id)a3 forDelegate:(id)a4;
+ (id)pickerIdentity;
+ (id)sharedManager;
- (SSUSoundScapesPickerManager)init;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)registerViewController:(id)a3 forMediaProfiles:(id)a4 andDelegate:(id)a5;
@end

@implementation SSUSoundScapesPickerManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SSUSoundScapesPickerManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __44__SSUSoundScapesPickerManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SSUSoundScapesPickerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSUSoundScapesPickerManager;
  v2 = [(SSUSoundScapesPickerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithKeyOptions:513 valueOptions:0];
    targetMediaProfile = v2->_targetMediaProfile;
    v2->_targetMediaProfile = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] mapTableWithKeyOptions:513 valueOptions:0];
    delegates = v2->_delegates;
    v2->_delegates = (NSMapTable *)v5;
  }
  return v2;
}

- (void)registerViewController:(id)a3 forMediaProfiles:(id)a4 andDelegate:(id)a5
{
  targetMediaProfile = self->_targetMediaProfile;
  id v9 = a5;
  id v10 = a3;
  [(NSMapTable *)targetMediaProfile setObject:a4 forKey:v10];
  id v11 = [[_SSUSoundScapesDelegateForwarder alloc] initForViewController:v10];
  [v11 setDelegate:v9];

  [(NSMapTable *)self->_delegates setObject:v11 forKey:v10];
}

+ (BOOL)pickerSupportHome:(id)a3 targetMediaProfileContainers:(id)a4
{
  v4 = [a3 residentDevices];
  uint64_t v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_0);
  BOOL v6 = v5 != 0;

  return v6;
}

unint64_t __78__SSUSoundScapesPickerManager_pickerSupportHome_targetMediaProfileContainers___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 24) & 1;
}

+ (id)pickerIdentity
{
  if (pickerIdentity_onceToken != -1) {
    dispatch_once(&pickerIdentity_onceToken, &__block_literal_global_98);
  }
  v2 = (void *)pickerIdentity_identity;

  return v2;
}

void __45__SSUSoundScapesPickerManager_pickerIdentity__block_invoke()
{
  v0 = _SSULoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25E2B6000, v0, OS_LOG_TYPE_INFO, "Start looking for picker", v5, 2u);
  }

  v1 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:@"com.apple.SoundScapesViewServices.ViewService"];
  v2 = [MEMORY[0x263F04DF0] executeQuery:v1];
  uint64_t v3 = [v2 firstObject];
  v4 = (void *)pickerIdentity_identity;
  pickerIdentity_identity = v3;
}

+ (id)pickerForMediaProfileContainers:(id)a3 forDelegate:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [a1 pickerIdentity];
  id v9 = _SSULoggingFacility();
  id v10 = v9;
  if (v8)
  {
    id v38 = v7;
    id v39 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E2B6000, v10, OS_LOG_TYPE_INFO, "Start loading picker", buf, 2u);
    }

    id v10 = [objc_alloc(MEMORY[0x263F04E70]) initWithExtensionIdentity:v8];
    id v11 = (void *)[objc_alloc(MEMORY[0x263F04E68]) initWithConfiguration:v10];
    v12 = objc_opt_new();
    v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v12 setBackgroundColor:v13];

    v14 = (void *)MEMORY[0x263F086E0];
    v15 = [v8 url];
    v16 = [v14 bundleWithURL:v15];

    v17 = objc_opt_new();
    v18 = [v16 localizedStringForKey:@"ERROR" value:0 table:0];
    [v17 setText:v18];

    [v17 setTag:10001];
    [v17 setHidden:1];
    [v17 setTextAlignment:1];
    [v12 addSubview:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [v12 centerXAnchor];
    v20 = [v17 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [v12 centerYAnchor];
    v23 = [v17 centerYAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    v25 = [v17 leadingAnchor];
    v26 = [v12 safeAreaLayoutGuide];
    v27 = [v26 leadingAnchor];
    v28 = [v25 constraintEqualToAnchor:v27 constant:20.0];
    [v28 setActive:1];

    v29 = [v12 safeAreaLayoutGuide];
    v30 = [v29 topAnchor];
    v31 = [v17 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v32 setActive:1];

    [v11 setPlaceholderView:v12];
    v33 = [MEMORY[0x263F1C550] systemBackgroundColor];
    v34 = [v11 view];
    [v34 setBackgroundColor:v33];

    v35 = +[SSUSoundScapesPickerManager sharedManager];
    [v11 setDelegate:v35];
    id v7 = v38;
    id v6 = v39;
    [v35 registerViewController:v11 forMediaProfiles:v39 andDelegate:v38];
    v36 = _SSULoggingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v11;
      _os_log_impl(&dword_25E2B6000, v36, OS_LOG_TYPE_INFO, "Return picker: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[SSUSoundScapesPickerManager pickerForMediaProfileContainers:forDelegate:](v10);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _SSULoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25E2B6000, v5, OS_LOG_TYPE_INFO, "Picker become active", buf, 2u);
  }

  id v6 = [(NSMapTable *)self->_targetMediaProfile objectForKey:v4];
  v22 = [(NSMapTable *)self->_delegates objectForKey:v4];
  id v7 = [v6 anyObject];
  objc_super v8 = objc_msgSend(v7, "hf_home");

  id v9 = [v6 allObjects];
  v23 = objc_msgSend(v9, "na_map:", &__block_literal_global_114);

  id v10 = [v6 anyObject];
  id v11 = objc_msgSend(v10, "hf_home");
  v12 = [v11 residentDevices];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_2;
  v27[3] = &unk_26551E110;
  id v13 = v8;
  id v28 = v13;
  v14 = objc_msgSend(v12, "na_map:", v27);
  v15 = _SSULoggingFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v23;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_25E2B6000, v15, OS_LOG_TYPE_INFO, "Setup picker for target version %@, resident version %@", buf, 0x16u);
  }

  id v26 = 0;
  v16 = [v4 makeXPCConnectionWithError:&v26];
  id v17 = v26;
  if (v17)
  {
    v18 = _SSULoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[SSUSoundScapesPickerManager hostViewControllerDidActivate:]((uint64_t)v17, v18);
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B08170];
    [v16 setRemoteObjectInterface:v19];

    v20 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B07690];
    [v16 setExportedInterface:v20];

    [v16 setExportedObject:v22];
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_121;
    v24[3] = &unk_26551E138;
    objc_copyWeak(&v25, (id *)buf);
    [v16 setInvalidationHandler:v24];
    [v22 setConnection:v16];
    [v16 resume];
    v21 = [v16 remoteObjectProxy];
    [v21 setupDataSourceWithTargetDeviceVersions:v23 andFallbackResidentDeviceVersions:v14];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

id __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_backingAccessory");
  uint64_t v3 = [v2 softwareVersion];
  id v4 = [v3 shortVersionString];

  return v4;
}

id __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessories];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_3;
  v10[3] = &unk_26551E0E8;
  id v11 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v10);

  id v7 = [v6 softwareVersion];
  objc_super v8 = [v7 shortVersionString];

  return v8;
}

uint64_t __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [*(id *)(a1 + 32) device];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_121(uint64_t a1)
{
  v2 = _SSULoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_25E2B6000, v2, OS_LOG_TYPE_INFO, "Picker connection invalidate", v3, 2u);
  }
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  delegates = self->_delegates;
  id v6 = a3;
  id v7 = [(NSMapTable *)delegates objectForKey:v6];
  [v7 pickerDismissed];
  [(NSMapTable *)self->_targetMediaProfile removeObjectForKey:v6];
  [(NSMapTable *)self->_delegates removeObjectForKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_targetMediaProfile, 0);
}

+ (void)pickerForMediaProfileContainers:(os_log_t)log forDelegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_25E2B6000, log, OS_LOG_TYPE_FAULT, "No picker found to display", v1, 2u);
}

- (void)hostViewControllerDidActivate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_25E2B6000, a2, OS_LOG_TYPE_FAULT, "Failed to get picker connection: %@", (uint8_t *)&v2, 0xCu);
}

@end