@interface PAHMSManager
+ (id)sharedInstance;
- (BOOL)beamformingForAddress:(id)a3;
- (BOOL)hearingAidEnabledForAddress:(id)a3;
- (BOOL)yodelEnabledForAddress:(id)a3;
- (HMServiceClient)hmsClient;
- (NSMutableDictionary)yodelDeviceRecordByAddress;
- (OS_dispatch_queue)hmsQueue;
- (PAHMSManager)init;
- (double)amplificationForAddress:(id)a3;
- (double)balanceForAddress:(id)a3;
- (double)noiseSupressorForAddress:(id)a3;
- (double)toneForAddress:(id)a3;
- (void)sendConfigUpdate:(id)a3 forAddress:(id)a4;
- (void)sendConfigUpdate:(id)a3 forIdentifier:(id)a4 withCompletion:(id)a5;
- (void)setAccommodationType:(unint64_t)a3 forAddress:(id)a4;
- (void)setAmplification:(double)a3 forAddress:(id)a4;
- (void)setBalance:(double)a3 forAddress:(id)a4;
- (void)setBeamforming:(BOOL)a3 forAddress:(id)a4;
- (void)setHmsClient:(id)a3;
- (void)setHmsQueue:(id)a3;
- (void)setNoiseSupressor:(double)a3 forAddress:(id)a4;
- (void)setTone:(double)a3 forAddress:(id)a4;
- (void)setYodelDeviceRecordByAddress:(id)a3;
- (void)setupHearingModeService;
- (void)toggleHearingAidForAddress:(id)a3;
@end

@implementation PAHMSManager

void __39__PAHMSManager_yodelEnabledForAddress___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 hearingAssistEnabled] == 1;
}

- (BOOL)yodelEnabledForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PAHMSManager_yodelEnabledForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  LOBYTE(hmsQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)hmsQueue;
}

- (NSMutableDictionary)yodelDeviceRecordByAddress
{
  return self->_yodelDeviceRecordByAddress;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_Manager;
  return v2;
}

uint64_t __30__PAHMSManager_sharedInstance__block_invoke()
{
  sharedInstance_Manager = objc_alloc_init(PAHMSManager);
  return MEMORY[0x270F9A758]();
}

- (PAHMSManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PAHMSManager;
  v2 = [(PAHMSManager *)&v9 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(PAHMSManager *)v2 setYodelDeviceRecordByAddress:v3];

    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v5 = dispatch_queue_create("hearing_mode_service_queue", v4);
    hmsQueue = v2->_hmsQueue;
    v2->_hmsQueue = (OS_dispatch_queue *)v5;

    id v7 = (id)[getHUAccessoryManagerClass_0() sharedInstance];
    [(PAHMSManager *)v2 setupHearingModeService];
  }
  return v2;
}

- (void)setupHearingModeService
{
  id v3 = (HMServiceClient *)objc_alloc_init(getHMServiceClientClass());
  hmsClient = self->_hmsClient;
  self->_hmsClient = v3;

  [(HMServiceClient *)self->_hmsClient setDispatchQueue:self->_hmsQueue];
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = self->_hmsClient;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__PAHMSManager_setupHearingModeService__block_invoke;
  v15[3] = &unk_264103120;
  objc_copyWeak(&v16, &location);
  [(HMServiceClient *)v5 setInterruptionHandler:v15];
  id v6 = self->_hmsClient;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__PAHMSManager_setupHearingModeService__block_invoke_2;
  v13[3] = &unk_264103120;
  objc_copyWeak(&v14, &location);
  [(HMServiceClient *)v6 setInvalidationHandler:v13];
  id v7 = self->_hmsClient;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __39__PAHMSManager_setupHearingModeService__block_invoke_3;
  uint64_t v11 = &unk_264103780;
  objc_copyWeak(&v12, &location);
  [(HMServiceClient *)v7 setDeviceRecordChangedHandler:&v8];
  -[HMServiceClient activateWithCompletion:](self->_hmsClient, "activateWithCompletion:", &__block_literal_global_19, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __39__PAHMSManager_setupHearingModeService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setupHearingModeService];
}

void __39__PAHMSManager_setupHearingModeService__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setupHearingModeService];
}

void __39__PAHMSManager_setupHearingModeService__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 bluetoothAddress];
  int v5 = [v3 hearingAssistEnabled];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained yodelDeviceRecordByAddress];
  [v7 setObject:v3 forKey:v4];

  PAInitializeLogging();
  uint64_t v8 = NSString;
  uint64_t v9 = [NSNumber numberWithBool:v5 == 1];
  v10 = [v8 stringWithFormat:@"Device Updated %@ = %@, %@", v4, v9, v3];

  uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager setupHearingModeService]_block_invoke_3", 93, v10];
  id v12 = (os_log_t *)MEMORY[0x263F472C8];
  uint64_t v13 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v11;
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v44 = [v14 UTF8String];
    _os_log_impl(&dword_20CD3E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v5 != 1)
  {
    PAInitializeLogging();
    id v16 = [NSString stringWithFormat:@"Not a Yodel device. Clearing state %@", v4];
    v17 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager setupHearingModeService]_block_invoke", 99, v16];
    os_log_t v18 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v17;
      v20 = v18;
      uint64_t v21 = [v19 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v44 = v21;
      _os_log_impl(&dword_20CD3E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v22 = +[PASettings sharedInstance];
    v23 = [v22 personalMediaEnabledByRouteUID];
    v24 = (void *)[v23 mutableCopy];

    v25 = [v24 objectForKey:v4];

    if (v25)
    {
      [v24 removeObjectForKey:v4];
      v26 = +[PASettings sharedInstance];
      [v26 setPersonalMediaEnabledByRouteUID:v24];
    }
    v27 = +[PASettings sharedInstance];
    v28 = [v27 accommodationTypesByRouteUID];
    v29 = (void *)[v28 mutableCopy];

    v30 = [v29 objectForKey:v4];

    if (v30)
    {
      [v29 removeObjectForKey:v4];
      v31 = +[PASettings sharedInstance];
      [v31 setAccommodationTypesByRouteUID:v29];
    }
    v32 = +[PASettings sharedInstance];
    v33 = [v32 personalMediaConfiguration];

    if (!v33)
    {
      v34 = +[PASettings sharedInstance];
      v35 = +[PASettings sharedInstance];
      v36 = [v35 personalMediaConfigurationForRouteUID:v4];
      [v34 setPersonalMediaConfiguration:v36];
    }
    v37 = +[PASettings sharedInstance];
    v38 = [v37 personalMediaConfigurationByRouteUID];
    v39 = (void *)[v38 mutableCopy];

    v40 = [v39 objectForKey:v4];

    if (v40) {
      [v39 removeObjectForKey:v4];
    }
    v41 = +[PASettings sharedInstance];
    [v41 setPersonalMediaConfigurationByRouteUID:v39];
  }
  v42 = [MEMORY[0x263F08A00] defaultCenter];
  [v42 postNotificationName:@"com.apple.personalaudio.yodel.updated" object:0];
}

void __39__PAHMSManager_setupHearingModeService__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  PAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"Activating client %@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager setupHearingModeService]_block_invoke", 136, v3];
  int v5 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CD3E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (double)amplificationForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x3FE0000000000000;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PAHMSManager_amplificationForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__PAHMSManager_amplificationForAddress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 amplification];
  [v3 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (void)setAmplification:(double)a3 forAddress:(id)a4
{
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v9 = objc_alloc_init(v6());
  uint64_t v8 = [NSNumber numberWithDouble:a3];
  [v9 setAmplification:v8];

  [(PAHMSManager *)self sendConfigUpdate:v9 forAddress:v7];
}

- (double)balanceForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x3FE0000000000000;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__PAHMSManager_balanceForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __34__PAHMSManager_balanceForAddress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 balance];
  [v3 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (void)setBalance:(double)a3 forAddress:(id)a4
{
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v9 = objc_alloc_init(v6());
  uint64_t v8 = [NSNumber numberWithDouble:a3];
  [v9 setBalance:v8];

  [(PAHMSManager *)self sendConfigUpdate:v9 forAddress:v7];
}

- (double)toneForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x3FE0000000000000;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__PAHMSManager_toneForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__PAHMSManager_toneForAddress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 balance];
  [v3 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (void)setTone:(double)a3 forAddress:(id)a4
{
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v9 = objc_alloc_init(v6());
  uint64_t v8 = [NSNumber numberWithDouble:a3];
  [v9 setTone:v8];

  [(PAHMSManager *)self sendConfigUpdate:v9 forAddress:v7];
}

- (BOOL)beamformingForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PAHMSManager_beamformingForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  LOBYTE(hmsQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)hmsQueue;
}

void __38__PAHMSManager_beamformingForAddress___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v4 objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 beamFormer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 BOOLValue];
}

- (void)setBeamforming:(BOOL)a3 forAddress:(id)a4
{
  BOOL v4 = a3;
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v9 = objc_alloc_init(v6());
  uint64_t v8 = [NSNumber numberWithBool:v4];
  [v9 setBeamFormer:v8];

  [(PAHMSManager *)self sendConfigUpdate:v9 forAddress:v7];
}

- (double)noiseSupressorForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PAHMSManager_noiseSupressorForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__PAHMSManager_noiseSupressorForAddress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 noiseSuppression];
  [v3 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

- (void)setNoiseSupressor:(double)a3 forAddress:(id)a4
{
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v9 = objc_alloc_init(v6());
  uint64_t v8 = [NSNumber numberWithDouble:a3];
  [v9 setNoiseSuppression:v8];

  [(PAHMSManager *)self sendConfigUpdate:v9 forAddress:v7];
}

- (void)setAccommodationType:(unint64_t)a3 forAddress:(id)a4
{
  char v4 = a3;
  id v6 = (Class (__cdecl *)())getHMDeviceConfigurationsClass_0;
  id v7 = a4;
  id v8 = objc_alloc_init(v6());
  id v11 = v8;
  if ((v4 & 2) != 0) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v8 setEnablePMEVoice:v9];
  if ((v4 & 4) != 0) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  [v11 setEnablePMEMedia:v10];
  [(PAHMSManager *)self sendConfigUpdate:v11 forAddress:v7];
}

- (BOOL)hearingAidEnabledForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  hmsQueue = self->_hmsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PAHMSManager_hearingAidEnabledForAddress___block_invoke;
  block[3] = &unk_2641037A8;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(hmsQueue, block);
  LOBYTE(hmsQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)hmsQueue;
}

void __44__PAHMSManager_hearingAidEnabledForAddress___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 hearingAidEnabled] == 1;
}

- (void)toggleHearingAidForAddress:(id)a3
{
  id v4 = a3;
  hmsQueue = self->_hmsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PAHMSManager_toggleHearingAidForAddress___block_invoke;
  v7[3] = &unk_2641037D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(hmsQueue, v7);
}

void __43__PAHMSManager_toggleHearingAidForAddress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) yodelDeviceRecordByAddress];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  int v4 = [v3 hearingAidEnabled];

  id v5 = objc_alloc_init(getHMDeviceConfigurationsClass_0());
  id v7 = v5;
  if (v4 == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 setEnableHearingAid:v6];
  [*(id *)(a1 + 32) sendConfigUpdate:v7 forAddress:*(void *)(a1 + 40)];
}

- (void)sendConfigUpdate:(id)a3 forAddress:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [getHUAccessoryManagerClass_0() sharedInstance];
    v19[0] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__PAHMSManager_sendConfigUpdate_forAddress___block_invoke;
    v14[3] = &unk_264103820;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [v8 getIdentifiersFromAddresses:v9 withCompletion:v14];
  }
  else
  {
    PAInitializeLogging();
    id v8 = [NSString stringWithFormat:@"Skipping update. No address"];
    uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager sendConfigUpdate:forAddress:]", 295, v8];
    uint64_t v11 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      uint64_t v13 = v11;
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = [v12 UTF8String];
      _os_log_impl(&dword_20CD3E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __44__PAHMSManager_sendConfigUpdate_forAddress___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [a2 firstObject];
  if ([v3 length])
  {
    id v5 = (void *)a1[4];
    uint64_t v4 = a1[5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__PAHMSManager_sendConfigUpdate_forAddress___block_invoke_2;
    v11[3] = &unk_2641037F8;
    id v12 = v3;
    [v5 sendConfigUpdate:v4 forIdentifier:v12 withCompletion:v11];
    id v6 = v12;
  }
  else
  {
    PAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"Couldn't find identifier %@", a1[6]];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager sendConfigUpdate:forAddress:]_block_invoke", 289, v6];
    id v8 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v14 = [v9 UTF8String];
      _os_log_impl(&dword_20CD3E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __44__PAHMSManager_sendConfigUpdate_forAddress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  PAInitializeLogging();
  uint64_t v4 = [NSString stringWithFormat:@"Updated %@ with error: %@", *(void *)(a1 + 32), v3];

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[PAHMSManager sendConfigUpdate:forAddress:]_block_invoke_2", 284, v4];
  id v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)sendConfigUpdate:(id)a3 forIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PAHMSManager *)self hmsClient];
  [v11 modifyDeviceConfig:v10 identifier:v9 completion:v8];
}

- (HMServiceClient)hmsClient
{
  return self->_hmsClient;
}

- (void)setHmsClient:(id)a3
{
}

- (void)setYodelDeviceRecordByAddress:(id)a3
{
}

- (OS_dispatch_queue)hmsQueue
{
  return self->_hmsQueue;
}

- (void)setHmsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmsQueue, 0);
  objc_storeStrong((id *)&self->_yodelDeviceRecordByAddress, 0);
  objc_storeStrong((id *)&self->_hmsClient, 0);
}

@end