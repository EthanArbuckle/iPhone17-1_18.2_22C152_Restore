@interface PAAccessoryManager
+ (id)sharedInstance;
- (AXDispatchTimer)pmeHysteresisTimer;
- (BOOL)shouldSendUpdate;
- (PAAccessoryManager)init;
- (void)routesDidChange:(id)a3;
- (void)sendPMEConfigurationToAccessory;
- (void)sendUpdateToAccessory;
- (void)setPmeHysteresisTimer:(id)a3;
- (void)setShouldSendUpdate:(BOOL)a3;
@end

@implementation PAAccessoryManager

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_2(uint64_t a1, unsigned int a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a2 && *(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57) && [*(id *)(a1 + 32) length])
  {
    v8 = +[PASettings sharedInstance];
    v9 = [v8 personalMediaConfiguration];

    v10 = [*(id *)(a1 + 40) address];
    v11 = [v9 onBudsMediaSettingsForRoute:v10];

    v12 = *(void **)(a1 + 48);
    v19[0] = *(void *)(a1 + 32);
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_3;
    v14[3] = &unk_2641031E0;
    id v15 = v11;
    id v16 = v9;
    id v5 = v9;
    id v4 = v11;
    [v12 getIdentifiersFromAddresses:v13 withCompletion:v14];
  }
  else
  {
    PAInitializeLogging();
    id v4 = [NSString stringWithFormat:@"Device isn't supported [%d, %d, %d] %@", a2, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void *)(a1 + 40)];
    id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke", 258, v4];
    v6 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v5;
      v7 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = [v5 UTF8String];
      _os_log_impl(&dword_20CD3E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __26__PAAccessoryManager_init__block_invoke_2_50(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  PAInitializeLogging();
  v3 = [NSString stringWithFormat:@"%@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke_2", 149, v3];
  id v5 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CD3E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke()
{
  v0 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  char v1 = [v0 getAACPCapabilityBit:17];
  id v2 = [v0 address];
  v3 = +[PAHMSManager sharedInstance];
  char v4 = [v3 yodelEnabledForAddress:v2];

  id v5 = [getHUAccessoryManagerClass() sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_2;
  v9[3] = &unk_264103228;
  char v13 = v1;
  char v14 = v4;
  id v10 = v2;
  id v11 = v0;
  id v12 = v5;
  id v6 = v5;
  id v7 = v0;
  id v8 = v2;
  [v6 getAudioOwnershipForAddress:v8 withCompletion:v9];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)sharedInstance_AccessoryManager;
  return v2;
}

uint64_t __36__PAAccessoryManager_sharedInstance__block_invoke()
{
  sharedInstance_AccessoryManager = objc_alloc_init(PAAccessoryManager);
  return MEMORY[0x270F9A758]();
}

- (PAAccessoryManager)init
{
  v47[1] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)PAAccessoryManager;
  id v2 = [(PAAccessoryManager *)&v37 init];
  if (v2)
  {
    v3 = +[PASettings sharedInstance];
    [v3 setShouldUpdateAccessory:1];

    char v4 = +[PASettings sharedInstance];
    v2->_shouldSendUpdate = [v4 shouldUpdateAccessory];

    id v5 = +[PAHMSManager sharedInstance];
    objc_initWeak(&location, v2);
    id v6 = +[PASettings sharedInstance];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __26__PAAccessoryManager_init__block_invoke;
    v34[3] = &unk_264103120;
    objc_copyWeak(&v35, &location);
    [v6 registerUpdateBlock:v34 forRetrieveSelector:sel_shouldUpdateAccessory withListener:v2];

    id v7 = +[PASettings sharedInstance];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __26__PAAccessoryManager_init__block_invoke_10;
    v32[3] = &unk_264103120;
    objc_copyWeak(&v33, &location);
    [v7 registerUpdateBlock:v32 forRetrieveSelector:sel_personalMediaConfigurationByRouteUID withListener:v2];

    id v8 = +[PASettings sharedInstance];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __26__PAAccessoryManager_init__block_invoke_16;
    v30[3] = &unk_264103120;
    objc_copyWeak(&v31, &location);
    [v8 registerUpdateBlock:v30 forRetrieveSelector:sel_personalMediaEnabledByRouteUID withListener:v2];

    uint64_t v9 = +[PASettings sharedInstance];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __26__PAAccessoryManager_init__block_invoke_22;
    v28[3] = &unk_264103120;
    objc_copyWeak(&v29, &location);
    [v9 registerUpdateBlock:v28 forRetrieveSelector:sel_accommodationTypesByRouteUID withListener:v2];

    id v10 = [getHUAccessoryManagerClass() sharedInstance];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __26__PAAccessoryManager_init__block_invoke_28;
    v25[3] = &unk_264103148;
    id v11 = v10;
    id v26 = v11;
    objc_copyWeak(&v27, &location);
    [v11 registerDiscoveryBlock:v25 withListener:v2];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __26__PAAccessoryManager_init__block_invoke_2;
    v22[3] = &unk_264103170;
    id v12 = v2;
    v23 = v12;
    id v13 = v11;
    id v24 = v13;
    char v14 = [MEMORY[0x263EFEF88] UUIDWithString:@"d5621cc1-f7ab-45db-9403-9eaf744d5390"];
    v47[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
    [v13 registerUpdateBlock:v22 forCharacteristicUUIDs:v15 withListener:v12];

    [v13 registerLoggingBlock:&__block_literal_global_53 withListener:v12];
    id v16 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    v17 = (id *)getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr;
    uint64_t v46 = getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr;
    if (!getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr)
    {
      uint64_t v38 = MEMORY[0x263EF8330];
      uint64_t v39 = 3221225472;
      v40 = __getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_block_invoke;
      v41 = &unk_264103250;
      v42 = &v43;
      uint64_t v18 = (void *)HearingUtilitiesLibrary();
      v19 = dlsym(v18, "AXHearingAidAudioRoutesChangedNotification");
      *(void *)(v42[1] + 24) = v19;
      getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr = *(void *)(v42[1] + 24);
      v17 = (id *)v44[3];
    }
    _Block_object_dispose(&v43, 8);
    if (!v17)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    id v20 = *v17;
    [v16 addObserver:v12 selector:sel_routesDidChange_ name:v20 object:0];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__PAAccessoryManager_init__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = +[PASettings sharedInstance];
  uint64_t v3 = [v2 shouldUpdateAccessory];

  PAInitializeLogging();
  char v4 = objc_msgSend(NSString, "stringWithFormat:", @"Should send %d", v3);
  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 63, v4];
  id v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldSendUpdate:v3];
}

void __26__PAAccessoryManager_init__block_invoke_10(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  PAInitializeLogging();
  id v2 = [NSString stringWithFormat:@"Configuration updated. Attempting to send to accessory"];
  uint64_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 69, v2];
  char v4 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_20CD3E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendPMEConfigurationToAccessory];
}

void __26__PAAccessoryManager_init__block_invoke_16(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  PAInitializeLogging();
  id v2 = [NSString stringWithFormat:@"PME updated. Attempting to send to accessory"];
  uint64_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 74, v2];
  char v4 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_20CD3E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendPMEConfigurationToAccessory];
}

void __26__PAAccessoryManager_init__block_invoke_22(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  PAInitializeLogging();
  id v2 = [NSString stringWithFormat:@"PME types updated. Attempting to send to accessory"];
  uint64_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 79, v2];
  char v4 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_20CD3E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendPMEConfigurationToAccessory];
}

void __26__PAAccessoryManager_init__block_invoke_28(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFEF88] UUIDWithString:@"d5621cc1-f7ab-45db-9403-9eaf744d5390"];
  [v2 readValueForCharacteristicUUID:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sendPMEConfigurationToAccessory];
}

void __26__PAAccessoryManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x263EFEF88];
  id v10 = a3;
  uint64_t v11 = [v9 UUIDWithString:@"d5621cc1-f7ab-45db-9403-9eaf744d5390"];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    id v13 = [MEMORY[0x263F2B998] sharedInstance];
    char v14 = [v13 deviceFromAddressString:v7];

    id v15 = +[PAHMSManager sharedInstance];
    id v16 = [v14 address];
    int v17 = [v15 yodelEnabledForAddress:v16];

    PAInitializeLogging();
    if (v17)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Skipping Yodel %@", v7];
      v19 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke_2", 100, v18];
      id v20 = (void *)*MEMORY[0x263F472C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v19;
        v22 = v20;
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = [v21 UTF8String];
        _os_log_impl(&dword_20CD3E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      v23 = [NSString stringWithFormat:@"Found value for transparency %@ - %@", v8, v7];
      id v24 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 105, v23];
      v25 = (os_log_t *)MEMORY[0x263F472C8];
      id v26 = (void *)*MEMORY[0x263F472C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v24;
        v28 = v26;
        v25 = (os_log_t *)MEMORY[0x263F472C8];
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = [v27 UTF8String];
        _os_log_impl(&dword_20CD3E000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      if (!v8)
      {
        [*(id *)(a1 + 32) sendUpdateToAccessory];
        goto LABEL_16;
      }
      int v62 = 0;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      *(_OWORD *)buf = 0u;
      long long v57 = 0u;
      [v8 getBytes:buf length:100];
      double v29 = fabs(*(float *)buf + -1.0);
      float v30 = fmaxf(fminf(*((float *)&v58 + 1), 2.0), -1.0);
      float v31 = fmaxf(fminf(*((float *)&v61 + 1), 2.0), -1.0);
      float v32 = fminf(*((float *)&v61 + 2), 1.0);
      float v33 = (float)((float)(v31 - fmaxf(v31 - v30, 0.0)) + 1.0) * 0.5;
      float v34 = (float)((float)(v31 - v30) + 1.0) * 0.5;
      if (v32 <= -1.0) {
        float v35 = 0.0;
      }
      else {
        float v35 = (float)(v32 + 1.0) * 0.5;
      }
      PAInitializeLogging();
      v36 = NSString;
      double v37 = *(float *)buf;
      uint64_t v38 = [NSNumber numberWithBool:v29 < 0.001];
      double v39 = v35;
      v40 = [v36 stringWithFormat:@"Reading transparency settings %lf (%@), %lf, %lf, %lf = %lf, %lf, %lf, %lf, %lf = %@", *(void *)&v37, v38, v30, v31, *(void *)&v39, v33, v34, *(void *)&v39, *(float *)&v59, *((float *)&v58 + 3), v7];

      v41 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager init]_block_invoke", 131, v40];
      os_log_t v42 = *v25;
      if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = v41;
        v44 = v42;
        *(_DWORD *)v54 = 136446210;
        uint64_t v55 = [v43 UTF8String];
        _os_log_impl(&dword_20CD3E000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s", v54, 0xCu);
      }
      uint64_t v45 = +[PASettings sharedInstance];
      [v45 setShouldUpdateAccessory:0];

      uint64_t v46 = +[PASettings sharedInstance];
      [v46 setTransparencyTone:v7 forAddress:v39];

      v47 = +[PASettings sharedInstance];
      [v47 setTransparencyBalance:v7 forAddress:v34];

      v48 = +[PASettings sharedInstance];
      [v48 setTransparencyAmplification:v7 forAddress:v33];

      v49 = +[PASettings sharedInstance];
      LODWORD(v50) = HIDWORD(v58);
      objc_msgSend(v49, "setTransparencyBeamforming:forAddress:", *((float *)&v58 + 3) != 0.0, v7, v50);

      v51 = +[PASettings sharedInstance];
      [v51 setTransparencyNoiseSupressor:v7 forAddress:*(float *)&v59];

      v52 = +[PASettings sharedInstance];
      [v52 setTransparencyCustomized:v29 < 0.001 forAddress:v7];

      dispatch_time_t v53 = dispatch_time(0, 100000000);
      uint64_t v18 = [*(id *)(a1 + 40) sharedQueue];
      dispatch_after(v53, v18, &__block_literal_global_47);
    }

LABEL_16:
  }
}

void __26__PAAccessoryManager_init__block_invoke_45()
{
  id v0 = +[PASettings sharedInstance];
  [v0 setShouldUpdateAccessory:1];
}

- (void)routesDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PAInitializeLogging();
  id v5 = [NSString stringWithFormat:@"Routes changes: %@", v4];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager routesDidChange:]", 160, v5];
  id v7 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CD3E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(PAAccessoryManager *)self sendPMEConfigurationToAccessory];
  [(PAAccessoryManager *)self sendUpdateToAccessory];
}

- (void)sendUpdateToAccessory
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_shouldSendUpdate)
  {
    id v2 = [MEMORY[0x263EFEF88] UUIDWithString:@"d5621cc1-f7ab-45db-9403-9eaf744d5390"];
    uint64_t v3 = [getHUAccessoryManagerClass() sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke;
    v8[3] = &unk_2641031E0;
    id v9 = v3;
    id v10 = v2;
    id v4 = v2;
    id v5 = v3;
    [v5 getAvailableAddressesSupportingCharacteristic:0 withCompletion:v8];
  }
  else
  {
    PAInitializeLogging();
    id v5 = [NSString stringWithFormat:@"Skipping update"];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendUpdateToAccessory]", 205, v5];
    id v6 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v4;
      id v7 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = [v4 UTF8String];
      _os_log_impl(&dword_20CD3E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke_2;
  v4[3] = &unk_2641031B8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 enumerateObjectsUsingBlock:v4];
}

void __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[PAHMSManager sharedInstance];
  char v5 = [v4 yodelEnabledForAddress:v3];

  if (v5)
  {
    PAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"Skipping update to unsupported device %@", v3];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendUpdateToAccessory]_block_invoke", 198, v6];
    id v8 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v9 = +[PASettings sharedInstance];
  id v10 = [v9 personalMediaConfiguration];
  uint64_t v11 = (void *)[v10 transparencySettingsForAddress:v3];

  if (!v11)
  {
    PAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"Not updating accessory. There is no configuration"];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendUpdateToAccessory]_block_invoke", 193, v6];
    id v8 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      id v17 = v7;
      uint64_t v18 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v20 = [v17 UTF8String];
      _os_log_impl(&dword_20CD3E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:100];
  PAInitializeLogging();
  uint64_t v12 = [NSString stringWithFormat:@"Sending update to %@ - %@ - %@", v3, v6, *(void *)(a1 + 32)];
  uint64_t v13 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendUpdateToAccessory]_block_invoke_2", 187, v12];
  char v14 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    id v16 = v14;
    *(_DWORD *)buf = 136446210;
    uint64_t v20 = [v15 UTF8String];
    _os_log_impl(&dword_20CD3E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [*(id *)(a1 + 32) writeValue:v6 forCharacteristicUUID:*(void *)(a1 + 40) andAddress:v3];
  free(v11);
LABEL_11:
}

- (void)sendPMEConfigurationToAccessory
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = +[PASettings sharedInstance];
  char v4 = [v3 shouldUpdateAccessory];

  if ((v4 & 1) == 0)
  {
    PAInitializeLogging();
    char v5 = [NSString stringWithFormat:@"Skipping update"];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendPMEConfigurationToAccessory]", 216, v5];
    id v7 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      id v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = [v8 UTF8String];
      _os_log_impl(&dword_20CD3E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  pmeHysteresisTimer = self->_pmeHysteresisTimer;
  if (!pmeHysteresisTimer)
  {
    id v11 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v12 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
    uint64_t v13 = (AXDispatchTimer *)[v11 initWithTargetSerialQueue:v12];
    char v14 = self->_pmeHysteresisTimer;
    self->_pmeHysteresisTimer = v13;

    pmeHysteresisTimer = self->_pmeHysteresisTimer;
  }
  if (([(AXDispatchTimer *)pmeHysteresisTimer isPending] & 1) == 0) {
    [(AXDispatchTimer *)self->_pmeHysteresisTimer afterDelay:&__block_literal_global_82 processBlock:0.5];
  }
}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [a2 firstObject];
  if ([v3 length] && *(void *)(a1 + 32))
  {
    char v4 = +[PAHMSManager sharedInstance];
    [v4 sendConfigUpdate:*(void *)(a1 + 32) forIdentifier:v3 withCompletion:&__block_literal_global_85];
  }
  else
  {
    PAInitializeLogging();
    char v5 = [NSString stringWithFormat:@"Media settings nil or identifier can't be found [%@]. Config is %@", v3, *(void *)(a1 + 40)];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke", 252, v5];
    id v7 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      id v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CD3E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  PAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"Sent updates to buds with error %@", v2];

  char v4 = [NSString stringWithFormat:@"%s:%d %@", "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke_4", 247, v3];
  char v5 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CD3E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (BOOL)shouldSendUpdate
{
  return self->_shouldSendUpdate;
}

- (void)setShouldSendUpdate:(BOOL)a3
{
  self->_shouldSendUpdate = a3;
}

- (AXDispatchTimer)pmeHysteresisTimer
{
  return self->_pmeHysteresisTimer;
}

- (void)setPmeHysteresisTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end