@interface TPSPairedDeviceValidation
+ (id)airPodsDeviceInfo;
+ (id)homePodDeviceInfo;
+ (id)watchDeviceInfo;
- (NSArray)cachedDevices;
- (NSArray)cachedPeers;
- (OS_dispatch_queue)syncQueue;
- (TPSPairedDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4;
- (id)_bluetoothValidationForProductID:(unsigned int)a3 deviceType:(int64_t)a4;
- (id)_bluetoothValidationForProductIDs:(id)a3 deviceType:(int64_t)a4 joinType:(int64_t)a5;
- (id)_bluetoothValidationForTag:(id)a3 deviceType:(int64_t)a4;
- (id)_validationForDeviceNumber:(int64_t)a3;
- (id)_validationsForDevices:(id)a3;
- (id)completionQueue;
- (void)setCachedDevices:(id)a3;
- (void)setCachedPeers:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPairedDeviceValidation

uint64_t __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)watchDeviceInfo
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  if (v3 || [MEMORY[0x1E4FAF450] ignoreTargetingValidator])
  {
    v4 = [[TPSCloudDeviceInfo alloc] initWithModel:@"watch"];
    v5 = v4;
    if (v3)
    {
      v6 = [v3 valueForProperty:*MEMORY[0x1E4F79E60]];
      [(TPSCloudDeviceInfo *)v5 setMaxOSVersion:v6];
    }
    else
    {
      [(TPSCloudDeviceInfo *)v4 setMaxOSVersion:0];
    }
    [(TPSCloudDeviceInfo *)v5 setDisplayName:kTPSPairedAppleWatch];
  }
  else
  {
    v5 = 0;
  }
  [(TPSCloudDeviceInfo *)v5 setSymbolIdentifier:@"applewatch"];

  return v5;
}

+ (id)homePodDeviceInfo
{
  if (([getHMClientConnectionClass() areAnyHomePodsConfigured] & 1) != 0
    || [getHMClientConnectionClass() areAnyLargeHomePodConfigured])
  {
    v2 = @"homepod";
    char v3 = 1;
    v4 = @"homepod.and.homepodmini";
  }
  else
  {
    char v3 = 0;
    v2 = 0;
    v4 = @"homepodmini";
  }
  int v5 = [getHMClientConnectionClass() areAnyHomePodMiniConfigured];
  if (v5) {
    v2 = v4;
  }
  if (v5 & 1) != 0 || (v3) {
    goto LABEL_11;
  }
  if ([MEMORY[0x1E4FAF450] ignoreTargetingValidator])
  {
    v2 = @"homepod.and.homepodmini";
LABEL_11:
    v6 = [[TPSCloudDeviceInfo alloc] initWithModel:@"homepod"];
    [(TPSCloudDeviceInfo *)v6 setDisplayName:@"HomePod"];
    [(TPSCloudDeviceInfo *)v6 setSymbolIdentifier:v2];
    goto LABEL_13;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

+ (id)airPodsDeviceInfo
{
  v16[10] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4FAF450] ignoreTargetingValidator];
  char v3 = v2;
  if (v2) {
    v4 = &unk_1F4022218;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = &unk_1F4022218;
  if (v3) {
    goto LABEL_6;
  }
  v16[0] = &unk_1F4022290;
  v16[1] = &unk_1F4022278;
  v16[2] = &unk_1F4022218;
  v16[3] = &unk_1F4022230;
  v16[4] = &unk_1F4022248;
  v16[5] = &unk_1F4022260;
  v16[6] = &unk_1F40222A8;
  v16[7] = &unk_1F40222C0;
  v16[8] = &unk_1F40222D8;
  v16[9] = &unk_1F40222F0;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:10];
  v8 = +[TPSBluetoothChecker sharedInstance];
  v9 = [v8 pairedDevices];
  v6 = +[TPSBluetoothChecker bluetoothPairedForProductIDs:v7 withPairedDevices:v9];

  if (v6)
  {
LABEL_6:
    v10 = [[TPSCloudDeviceInfo alloc] initWithModel:@"airpods"];
    [(TPSCloudDeviceInfo *)v10 setDisplayName:@"AirPods"];
    v14[0] = &unk_1F4022278;
    v14[1] = &unk_1F4022290;
    v15[0] = @"airpods.gen4";
    v15[1] = @"airpods.gen4";
    v14[2] = &unk_1F4022218;
    v14[3] = &unk_1F4022230;
    v15[2] = @"airpodsmax";
    v15[3] = @"airpodsmax";
    v14[4] = &unk_1F4022248;
    v14[5] = &unk_1F4022260;
    v15[4] = @"airpodspro";
    v15[5] = @"airpodspro";
    v14[6] = &unk_1F40222A8;
    v14[7] = &unk_1F40222C0;
    v15[6] = @"airpods.gen3";
    v15[7] = @"airpodspro";
    v14[8] = &unk_1F40222D8;
    v14[9] = &unk_1F40222F0;
    v15[8] = @"airpods";
    v15[9] = @"airpods";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];
    v12 = [v11 objectForKeyedSubscript:v6];
    [(TPSCloudDeviceInfo *)v10 setSymbolIdentifier:v12];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TPSPairedDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4
{
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = a4;
  id v9 = a3;
  v10 = (OS_dispatch_queue *)dispatch_queue_create(0, v7);
  syncQueue = self->_syncQueue;
  self->_syncQueue = v10;

  v14.receiver = self;
  v14.super_class = (Class)TPSPairedDeviceValidation;
  v12 = [(TPSInclusivityValidation *)&v14 initWithTargetValues:v9 excludeValues:v8];

  return v12;
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) name];
  v6 = [*(id *)(a1 + 40) completionQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_2;
  v8[3] = &unk_1E6E6B5A8;
  id v9 = v3;
  id v7 = v3;
  +[TPSTargetingValidator validateConditions:v4 joinType:1 context:v5 cache:0 completionQueue:v6 completionHandler:v8];
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [(TPSPairedDeviceValidation *)self targetDevices];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(TPSPairedDeviceValidation *)self targetDevices];
    id v9 = [(TPSPairedDeviceValidation *)self _validationsForDevices:v8];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke;
    v25[3] = &unk_1E6E6C138;
    id v26 = v9;
    v27 = self;
    id v10 = v9;
    v11 = +[TPSBlockValidation blockValidationWithBlock:v25];
    [v5 addObject:v11];
  }
  v12 = [(TPSPairedDeviceValidation *)self excludeDevices];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    objc_super v14 = [(TPSPairedDeviceValidation *)self excludeDevices];
    v15 = [(TPSPairedDeviceValidation *)self _validationsForDevices:v14];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_3;
    v22[3] = &unk_1E6E6C138;
    id v23 = v15;
    v24 = self;
    id v16 = v15;
    v17 = +[TPSBlockValidation blockValidationWithBlock:v22];
    [v5 addObject:v17];
  }
  if ([v5 count])
  {
    v18 = [(TPSTargetingValidation *)self name];
    v19 = [(TPSPairedDeviceValidation *)self completionQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5;
    v20[3] = &unk_1E6E6C160;
    v20[4] = self;
    id v21 = v4;
    +[TPSTargetingValidator validateConditions:v5 joinType:0 context:v18 cache:0 completionQueue:v19 completionHandler:v20];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (id)completionQueue
{
  return dispatch_get_global_queue(0, 0);
}

- (id)_validationsForDevices:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __52__TPSPairedDeviceValidation__validationsForDevices___block_invoke;
  uint64_t v13 = &unk_1E6E6C188;
  objc_super v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);

  objc_storeStrong((id *)&self->_cachedPeers, 0);
}

void __52__TPSPairedDeviceValidation__validationsForDevices___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_validationForDeviceNumber:", objc_msgSend(a2, "integerValue"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_validationForDeviceNumber:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v4 = [TPSPairedWatchValidation alloc];
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"36A0EB23-E045-4E99-9D71-8FB9A853ADA7"];
      v6 = [(TPSPairedWatchValidation *)v4 initWithCapability:v5];

      if (!v6) {
        goto LABEL_29;
      }
      goto LABEL_30;
    case 1:
      id v7 = @"A1603";
      uint64_t v8 = 1;
      goto LABEL_26;
    case 2:
      id v9 = TPSPairedCarPlayValidation;
      goto LABEL_20;
    case 3:
      uint64_t v10 = 8194;
      uint64_t v11 = 3;
      goto LABEL_23;
    case 4:
      id v9 = TPSPairedHomePodValidation;
      goto LABEL_20;
    case 5:
      id v7 = @"A2051";
      uint64_t v8 = 5;
      goto LABEL_26;
    case 6:
      uint64_t v10 = 8207;
      uint64_t v11 = 6;
      goto LABEL_23;
    case 7:
      id v9 = TPSPairedAirTagValidation;
      goto LABEL_20;
    case 8:
      uint64_t v10 = 8206;
      uint64_t v11 = 8;
      goto LABEL_23;
    case 9:
      id v9 = TPSPairedHomePodMiniValidation;
      goto LABEL_20;
    case 10:
      uint64_t v10 = 8202;
      uint64_t v11 = 10;
      goto LABEL_23;
    case 12:
      uint64_t v10 = 8211;
      uint64_t v11 = 12;
      goto LABEL_23;
    case 21:
      uint64_t v13 = [(TPSPairedDeviceValidation *)self _bluetoothValidationForProductIDs:&unk_1F4022338 deviceType:21 joinType:1];
      goto LABEL_28;
    case 22:
      id v9 = TPSPairedLargeHomePodValidation;
LABEL_20:
      uint64_t v13 = (TPSTargetingValidation *)objc_alloc_init(v9);
      goto LABEL_28;
    case 24:
      uint64_t v10 = 8217;
      uint64_t v11 = 24;
      goto LABEL_23;
    case 25:
      uint64_t v10 = 8219;
      uint64_t v11 = 25;
LABEL_23:
      uint64_t v13 = [(TPSPairedDeviceValidation *)self _bluetoothValidationForProductID:v10 deviceType:v11];
      goto LABEL_28;
    case 26:
      id v7 = @"A2538";
      uint64_t v8 = 26;
      goto LABEL_26;
    case 27:
      id v7 = @"A3085";
      uint64_t v8 = 27;
LABEL_26:
      uint64_t v13 = [(TPSPairedDeviceValidation *)self _bluetoothValidationForTag:v7 deviceType:v8];
      goto LABEL_28;
    case 28:
      uint64_t v13 = +[TPSBlockValidation blockValidationWithBlock:&__block_literal_global_6];
LABEL_28:
      v6 = v13;
      if (!v13) {
        goto LABEL_29;
      }
      goto LABEL_30;
    default:
      v12 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TPSPairedDeviceValidation _validationForDeviceNumber:](a3, v12);
      }

LABEL_29:
      v6 = objc_alloc_init(TPSTargetingValidation);
LABEL_30:
      return v6;
  }
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4FAF480];
  id v6 = a3;
  id v7 = [v5 targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5_cold_1(a1, a2, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSArray)cachedPeers
{
  id v3 = [(TPSPairedDeviceValidation *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__TPSPairedDeviceValidation_cachedPeers__block_invoke;
  block[3] = &unk_1E6E6B0A8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_cachedPeers;
}

void __40__TPSPairedDeviceValidation_cachedPeers__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    id v5 = +[TPSBluetoothChecker sharedInstance];
    uint64_t v2 = [v5 pairedPeers];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;
  }
}

- (NSArray)cachedDevices
{
  uint64_t v3 = [(TPSPairedDeviceValidation *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__TPSPairedDeviceValidation_cachedDevices__block_invoke;
  block[3] = &unk_1E6E6B0A8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_cachedDevices;
}

void __42__TPSPairedDeviceValidation_cachedDevices__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v5 = +[TPSBluetoothChecker sharedInstance];
    uint64_t v2 = [v5 pairedDevices];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;
  }
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) name];
  id v6 = [*(id *)(a1 + 40) completionQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_4;
  v8[3] = &unk_1E6E6B5A8;
  id v9 = v3;
  id v7 = v3;
  +[TPSTargetingValidator validateConditions:v4 joinType:1 context:v5 cache:0 completionQueue:v6 completionHandler:v8];
}

uint64_t __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__TPSPairedDeviceValidation__validationForDeviceNumber___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F79EF0];
  id v3 = a2;
  uint64_t v4 = [v2 sharedInstance];
  id v11 = [v4 getActivePairedDevice];

  id v5 = [v11 valueForProperty:*MEMORY[0x1E4F79DF0]];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v11 valueForProperty:*MEMORY[0x1E4F79DE8]];
  uint64_t v8 = [v7 integerValue];

  BOOL v9 = v6 == 416 && v8 == 496 || v6 == 374 && v8 == 446;
  v3[2](v3, v9, 0);
}

- (id)_bluetoothValidationForTag:(id)a3 deviceType:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke;
  v10[3] = &unk_1E6E6C1D0;
  id v11 = v6;
  v12 = self;
  int64_t v13 = a4;
  id v7 = v6;
  uint64_t v8 = +[TPSBlockValidation blockValidationWithBlock:v10];

  return v8;
}

void __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = a2;
  id v5 = [v3 cachedPeers];
  BOOL v6 = +[TPSBluetoothChecker bluetoothPairedWithTag:v2 withPairedPeers:v5];

  id v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke_cold_1();
  }

  v4[2](v4, v6, 0);
}

- (id)_bluetoothValidationForProductID:(unsigned int)a3 deviceType:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke;
  v6[3] = &unk_1E6E6C1F8;
  unsigned int v7 = a3;
  v6[4] = self;
  v6[5] = a4;
  uint64_t v4 = +[TPSBlockValidation blockValidationWithBlock:v6];

  return v4;
}

void __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  id v5 = [v3 cachedDevices];
  BOOL v6 = +[TPSBluetoothChecker bluetoothPairedForProductID:v2 withPairedDevices:v5];

  unsigned int v7 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke_cold_1();
  }

  v4[2](v4, v6, 0);
}

- (id)_bluetoothValidationForProductIDs:(id)a3 deviceType:(int64_t)a4 joinType:(int64_t)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke;
  v12[3] = &unk_1E6E6C248;
  id v13 = v8;
  objc_super v14 = self;
  int64_t v15 = a5;
  int64_t v16 = a4;
  id v9 = v8;
  uint64_t v10 = +[TPSBlockValidation blockValidationWithBlock:v12];

  return v10;
}

void __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  if (v4 == 1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_3;
    v10[3] = &unk_1E6E6C220;
    unsigned int v7 = (void *)a1[4];
    void v10[4] = a1[5];
    uint64_t v6 = objc_msgSend(v7, "na_any:", v10);
    goto LABEL_5;
  }
  if (!v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_2;
    v11[3] = &unk_1E6E6C220;
    id v5 = (void *)a1[4];
    v11[4] = a1[5];
    uint64_t v6 = objc_msgSend(v5, "na_all:", v11);
LABEL_5:
    uint64_t v8 = v6;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  id v9 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_cold_1();
  }

  v3[2](v3, v8, 0);
}

BOOL __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntValue];
  uint64_t v4 = [*(id *)(a1 + 32) cachedDevices];
  BOOL v5 = +[TPSBluetoothChecker bluetoothPairedForProductID:v3 withPairedDevices:v4];

  return v5;
}

BOOL __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntValue];
  uint64_t v4 = [*(id *)(a1 + 32) cachedDevices];
  BOOL v5 = +[TPSBluetoothChecker bluetoothPairedForProductID:v3 withPairedDevices:v4];

  return v5;
}

- (void)setCachedPeers:(id)a3
{
}

- (void)setCachedDevices:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) name];
  unsigned int v7 = [*(id *)(a1 + 32) targetDevices];
  uint64_t v8 = [*(id *)(a1 + 32) excludeDevices];
  int v9 = 138413058;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  v12 = v7;
  __int16 v13 = 2112;
  objc_super v14 = v8;
  __int16 v15 = 1024;
  int v16 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - Include: %@, Exclude: %@. Valid: %d", (uint8_t *)&v9, 0x26u);
}

- (void)_validationForDeviceNumber:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unrecognized device number: %ld", (uint8_t *)&v2, 0xCu);
}

void __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4492000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
}

void __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4492000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
}

void __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1E4492000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
}

@end