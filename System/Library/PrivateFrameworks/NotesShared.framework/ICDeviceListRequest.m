@interface ICDeviceListRequest
+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4;
+ (id)filteredDevices:(id)a3;
+ (id)setOfDeviceNamesFromDevices:(id)a3;
- (ACAccount)account;
- (BOOL)anyDeviceNeedsUpgrade;
- (BOOL)anyDeviceNotUpgradable;
- (BOOL)anyOSXDeviceNotUpgraded;
- (BOOL)didGetICloudDeviceList;
- (BOOL)waitForFetchWithTimeout:(double)a3;
- (ICDeviceListRequest)init;
- (ICDeviceListRequest)initWithAccount:(id)a3;
- (NSArray)devices;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)name;
- (NSString)softwareVersion;
- (OS_dispatch_semaphore)workSemaphore;
- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3;
- (void)fetchICloudDevicesWithCompletionBlock:(id)a3;
- (void)fetchWithCompletionBlock:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDidGetICloudDeviceList:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setModelDisplayName:(id)a3;
- (void)setName:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setWorkSemaphore:(id)a3;
@end

@implementation ICDeviceListRequest

- (ICDeviceListRequest)init
{
  return 0;
}

- (ICDeviceListRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeviceListRequest;
  v6 = [(ICDeviceListRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    workSemaphore = v7->_workSemaphore;
    v7->_workSemaphore = (OS_dispatch_semaphore *)v8;
  }
  return v7;
}

- (BOOL)anyDeviceNeedsUpgrade
{
  v2 = [(ICDeviceListRequest *)self devices];
  char v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_13);

  return v3;
}

uint64_t __44__ICDeviceListRequest_anyDeviceNeedsUpgrade__block_invoke(uint64_t a1, void *a2)
{
  return [a2 upgraded] ^ 1;
}

- (BOOL)anyDeviceNotUpgradable
{
  v2 = [(ICDeviceListRequest *)self devices];
  char v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_27);

  return v3;
}

uint64_t __45__ICDeviceListRequest_anyDeviceNotUpgradable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 upgradable] ^ 1;
}

- (BOOL)anyOSXDeviceNotUpgraded
{
  v2 = [(ICDeviceListRequest *)self devices];
  char v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_29);

  return v3;
}

uint64_t __46__ICDeviceListRequest_anyOSXDeviceNotUpgraded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOSXDevice]) {
    uint64_t v3 = [v2 upgraded] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)waitForFetchWithTimeout:(double)a3
{
  v4 = self;
  id v5 = [(ICDeviceListRequest *)self workSemaphore];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_semaphore_wait(v5, v6);

  v7 = [(ICDeviceListRequest *)v4 devices];
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4BF80]);
  dispatch_time_t v6 = [(ICDeviceListRequest *)self account];
  v7 = (void *)[v5 initWithAccount:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ICDeviceListRequest_fetchCloudKitDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E64A55B0;
  id v10 = v4;
  id v8 = v4;
  [v7 performRequestWithHandler:v9];
}

void __63__ICDeviceListRequest_fetchCloudKitDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || v7)
  {
    v12 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEFAULT, "CloudKit device list request failed, error: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v6 incompatibleDeviceNames];
    objc_super v11 = [v6 needUpgradeDeviceNames];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);
  }
}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v6 = [v5 name];
  id v7 = NSString;
  id v8 = [v5 systemName];
  uint64_t v9 = [v5 systemVersion];
  id v10 = [v7 stringWithFormat:@"%@;%@", v8, v9];

  id v11 = objc_alloc(MEMORY[0x1E4F4BFA8]);
  v12 = [(ICDeviceListRequest *)self account];
  int v13 = (void *)[v11 initWithAccount:v12];

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__ICDeviceListRequest_fetchICloudDevicesWithCompletionBlock___block_invoke;
  v17[3] = &unk_1E64A55D8;
  objc_copyWeak(&v21, &location);
  id v14 = v6;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  id v16 = v4;
  id v20 = v16;
  [v13 performRequestWithHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __61__ICDeviceListRequest_fetchICloudDevicesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_opt_class();
    id v6 = ICCheckedDynamicCast();
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      char v8 = [v7 BOOLForKey:*MEMORY[0x1E4F83848]];

      if ((v8 & 1) == 0)
      {
        id v26 = WeakRetained;
        id v27 = v4;
        uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v25 = v6;
        id obj = [v6 devices];
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (!v10) {
          goto LABEL_16;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            id v15 = *(void **)(a1 + 32);
            id v16 = [v14 name];
            if (([v15 isEqualToString:v16] & 1) == 0)
            {

LABEL_13:
              id v19 = [ICFullDeviceInfo alloc];
              id v20 = [v14 name];
              id v21 = [v14 model];
              v22 = [v14 modelDisplayName];
              v23 = [v14 swVersion];
              v24 = [(ICFullDeviceInfo *)v19 initWithName:v20 model:v21 modelDisplayName:v22 softwareVersion:v23];

              [v9 addObject:v24];
              continue;
            }
            v17 = *(void **)(a1 + 40);
            id v18 = [v14 swVersion];
            LOBYTE(v17) = [v17 isEqualToString:v18];

            if ((v17 & 1) == 0) {
              goto LABEL_13;
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (!v11)
          {
LABEL_16:

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            id WeakRetained = v26;
            id v4 = v27;
            id v6 = v25;
            break;
          }
        }
      }
    }
  }
  else
  {
    id v6 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Device list request was already torn down.", buf, 2u);
    }
  }
}

- (void)fetchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E64A56F0;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.deviceListDevicesMutex", v3);

  id v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2;
  block[3] = &unk_1E64A5650;
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  v25 = v6;
  objc_copyWeak(&v26, (id *)(a1 + 48));
  dispatch_group_async(v2, v5, block);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_48;
  v21[3] = &unk_1E64A5650;
  v21[4] = *(void *)(a1 + 32);
  id v7 = v6;
  v22 = v7;
  objc_copyWeak(&v23, (id *)(a1 + 48));
  dispatch_group_async(v2, v5, v21);

  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  if (!dispatch_group_wait(v2, v8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v14 = [WeakRetained workSemaphore];
    dispatch_semaphore_signal(v14);

    if (!*(void *)(a1 + 40))
    {
LABEL_9:

      goto LABEL_10;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_52;
    v19[3] = &unk_1E64A56A0;
    uint64_t v11 = &v20;
    id v20 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v19);
LABEL_8:

    goto LABEL_9;
  }
  id v9 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for both device lists", buf, 2u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1001 userInfo:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_54;
    v15[3] = &unk_1E64A56C8;
    uint64_t v11 = &v17;
    id v12 = *(id *)(a1 + 40);
    id v16 = v10;
    id v17 = v12;
    id WeakRetained = v10;
    dispatch_async(MEMORY[0x1E4F14428], v15);

    goto LABEL_8;
  }
LABEL_10:
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E64A5628;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  dispatch_queue_t v4 = v2;
  id v7 = v4;
  [v3 fetchCloudKitDevicesWithCompletionBlock:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = [[ICMinimalDeviceInfo alloc] initWithName:*(void *)(*((void *)&v30 + 1) + 8 * v12) upgradable:0 upgraded:0];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [[ICMinimalDeviceInfo alloc] initWithName:*(void *)(*((void *)&v26 + 1) + 8 * v18) upgradable:1 upgraded:0];
        [v7 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  if ([v7 count])
  {
    id v20 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E64A5600;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    id v24 = v7;
    dispatch_sync(v20, block);

    objc_destroyWeak(&v25);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  id v21 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_DEFAULT, "Got old device list", v22, 2u);
  }
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_semaphore_t v2 = [WeakRetained devices];
  if ([v2 count])
  {
    uint64_t v3 = +[ICDeviceListRequest combineICloudDevices:v2 withCloudKitDevices:*(void *)(a1 + 32)];
    [WeakRetained setDevices:v3];
  }
  else
  {
    [WeakRetained setDevices:*(void *)(a1 + 32)];
  }
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_48(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2_49;
  v5[3] = &unk_1E64A5678;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = v2;
  id v8 = v4;
  [v3 fetchICloudDevicesWithCompletionBlock:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v9);
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_queue_t v4 = +[ICDeviceListRequest filteredDevices:v3];
    id v5 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3_50;
    block[3] = &unk_1E64A5600;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    id v10 = v4;
    id v6 = v4;
    dispatch_sync(v5, block);

    objc_destroyWeak(&v11);
  }
  [*(id *)(a1 + 40) setDidGetICloudDeviceList:1];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  uint64_t v7 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Got new device list", v8, 2u);
  }
}

void __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_3_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_semaphore_t v2 = [WeakRetained devices];
  if ([v2 count])
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v3 = +[ICDeviceListRequest combineICloudDevices:*(void *)(a1 + 32) withCloudKitDevices:v2];
      [WeakRetained setDevices:v3];
    }
  }
  else
  {
    [WeakRetained setDevices:*(void *)(a1 + 32)];
  }
}

uint64_t __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__ICDeviceListRequest_fetchWithCompletionBlock___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)filteredDevices:(id)a3
{
  return (id)objc_msgSend(a3, "ic_objectsPassingTest:", &__block_literal_global_56);
}

uint64_t __39__ICDeviceListRequest_filteredDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldBeHidden] ^ 1;
}

+ (id)setOfDeviceNamesFromDevices:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "name", (void)v14);

        if (v11)
        {
          uint64_t v12 = [v10 name];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)combineICloudDevices:(id)a3 withCloudKitDevices:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 setOfDeviceNamesFromDevices:v6];
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "name", (void)v20);

        if (v16)
        {
          long long v17 = [v15 name];
          char v18 = [v8 containsObject:v17];

          if ((v18 & 1) == 0) {
            [v9 addObject:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevices:(id)a3
{
}

- (BOOL)didGetICloudDeviceList
{
  return self->_didGetICloudDeviceList;
}

- (void)setDidGetICloudDeviceList:(BOOL)a3
{
  self->_didGetICloudDeviceList = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (OS_dispatch_semaphore)workSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkSemaphore:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end