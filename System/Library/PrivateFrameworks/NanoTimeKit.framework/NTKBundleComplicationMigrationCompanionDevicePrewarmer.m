@interface NTKBundleComplicationMigrationCompanionDevicePrewarmer
+ (void)run;
- (NTKBundleComplicationMigrationCompanionDevicePrewarmer)init;
- (id)_nextDeviceToPrewarm;
- (unint64_t)_failureCountForDevice:(id)a3;
- (void)_handlePairedNotification;
- (void)_handleUnpairedNotification;
- (void)_incrementFailureCountForDevice:(id)a3;
- (void)_purgeCaches;
- (void)_queue_prewarmIfNeeded;
@end

@implementation NTKBundleComplicationMigrationCompanionDevicePrewarmer

+ (void)run
{
  if (run_onceToken != -1) {
    dispatch_once(&run_onceToken, &__block_literal_global_144);
  }
}

void __61__NTKBundleComplicationMigrationCompanionDevicePrewarmer_run__block_invoke()
{
  v0 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Starting", v3, 2u);
  }

  uint64_t v1 = objc_opt_new();
  v2 = (void *)run_prewarmer;
  run_prewarmer = v1;
}

- (NTKBundleComplicationMigrationCompanionDevicePrewarmer)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplicationMigrationCompanionDevicePrewarmer;
  v2 = [(NTKBundleComplicationMigrationCompanionDevicePrewarmer *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationMigrationCompanionDevicePrewarmer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    queue_failureCount = v2->_queue_failureCount;
    v2->_queue_failureCount = (NSMutableDictionary *)v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__handlePairedNotification name:*MEMORY[0x1E4F79EA0] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleUnpairedNotification name:*MEMORY[0x1E4F79EB8] object:0];

    v10 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__NTKBundleComplicationMigrationCompanionDevicePrewarmer_init__block_invoke;
    block[3] = &unk_1E62BFF20;
    v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

uint64_t __62__NTKBundleComplicationMigrationCompanionDevicePrewarmer_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _purgeCaches];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_prewarmIfNeeded");
}

- (void)_queue_prewarmIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_servicing)
  {
    v3 = [(NTKBundleComplicationMigrationCompanionDevicePrewarmer *)self _nextDeviceToPrewarm];
    if (v3)
    {
      self->_queue_servicing = 1;
      dispatch_queue_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = [v3 nrDeviceUUID];
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Prewarming %@ migration lookup", buf, 0xCu);
      }
      uint64_t v6 = +[NTKBundleComplicationMigrationProvider cachedInstance];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke;
      v8[3] = &unk_1E62C8800;
      v8[4] = self;
      id v9 = v3;
      [v6 ensureTypeLookupForDevice:v9 completion:v8];
    }
    else
    {
      v7 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Nothing to service", buf, 2u);
      }
    }
  }
}

void __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2;
  block[3] = &unk_1E62C04F0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[NTKBundleComplicationMigrationProvider cachedInstance];
  char v3 = [v2 hasTypeLookupForDevice:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  uint64_t v6 = v5;
  if (v4 || (v3 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2_cold_1((id *)(a1 + 32), (uint64_t *)(a1 + 40), v6);
    }

    [*(id *)(a1 + 48) _incrementFailureCountForDevice:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) nrDeviceUUID];
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Finished prewarming %@", (uint8_t *)&v9, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 48), "_queue_prewarmIfNeeded");
}

- (id)_nextDeviceToPrewarm
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v3 = [MEMORY[0x1E4F79EF0] sharedInstance];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__44;
  objc_super v14 = __Block_byref_object_dispose__44;
  id v15 = (id)objc_opt_new();
  uint64_t v4 = [v3 getPairedDevices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke;
  v9[3] = &unk_1E62C8828;
  v9[4] = self;
  v9[5] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];

  if ([(id)v11[5] count])
  {
    id v5 = (void *)v11[5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke_2;
    v8[3] = &unk_1E62C8850;
    v8[4] = self;
    [v5 sortUsingComparator:v8];
    uint64_t v6 = [(id)v11[5] firstObject];
  }
  else
  {
    uint64_t v6 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F19A30] deviceForNRDevice:a2];
  char v3 = +[NTKBundleComplicationMigrationProvider cachedInstance];
  char v4 = [v3 hasTypeLookupForDevice:v5];

  if ((v4 & 1) == 0 && (unint64_t)[*(id *)(a1 + 32) _failureCountForDevice:v5] <= 2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }
}

uint64_t __78__NTKBundleComplicationMigrationCompanionDevicePrewarmer__nextDeviceToPrewarm__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isBridgeActive] && !objc_msgSend(v6, "isBridgeActive"))
  {
    uint64_t v7 = -1;
  }
  else if (([v5 isBridgeActive] & 1) != 0 || (objc_msgSend(v6, "isBridgeActive") & 1) == 0)
  {
    unint64_t v8 = [*(id *)(a1 + 32) _failureCountForDevice:v5];
    if (v8 >= [*(id *)(a1 + 32) _failureCountForDevice:v6]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)_failureCountForDevice:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_failureCount = self->_queue_failureCount;
  uint64_t v7 = [v5 nrDeviceUUID];

  unint64_t v8 = [(NSMutableDictionary *)queue_failureCount objectForKey:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

- (void)_incrementFailureCountForDevice:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  queue_failureCount = self->_queue_failureCount;
  uint64_t v7 = [v5 nrDeviceUUID];
  unint64_t v8 = [(NSMutableDictionary *)queue_failureCount objectForKey:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  id v12 = [NSNumber numberWithUnsignedInteger:v9 + 1];
  uint64_t v10 = self->_queue_failureCount;
  uint64_t v11 = [v5 nrDeviceUUID];

  [(NSMutableDictionary *)v10 setObject:v12 forKeyedSubscript:v11];
}

- (void)_purgeCaches
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v26 = [MEMORY[0x1E4F79EF0] sharedInstance];
  char v3 = [v26 getPairedDevices];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __70__NTKBundleComplicationMigrationCompanionDevicePrewarmer__purgeCaches__block_invoke;
  v35[3] = &unk_1E62C8878;
  id v4 = v2;
  id v36 = v4;
  [v3 enumerateObjectsUsingBlock:v35];

  unint64_t v5 = 0x1E4F28000uLL;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = NTKBundleComplicationMigrationServiceLookupDirectory();
  unint64_t v8 = [v6 enumeratorAtPath:v7];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    id v27 = v9;
    id v28 = v4;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        char v30 = 0;
        id v15 = [*(id *)(v5 + 3256) defaultManager];
        [v15 fileExistsAtPath:v14 isDirectory:&v30];

        if (!v30)
        {
          v16 = [v14 lastPathComponent];
          v17 = [v16 stringByDeletingPathExtension];

          if (([v4 containsObject:v17] & 1) == 0)
          {
            v18 = NTKBundleComplicationMigrationServiceLookupDirectory();
            v19 = [v18 stringByAppendingPathComponent:v14];

            unint64_t v20 = v5;
            v21 = [*(id *)(v5 + 3256) defaultManager];
            id v29 = 0;
            int v22 = [v21 removeItemAtPath:v19 error:&v29];
            id v23 = v29;

            v24 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
            v25 = v24;
            if (v22)
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v14;
                _os_log_impl(&dword_1BC5A9000, v25, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Purged %@", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v38 = v14;
              __int16 v39 = 2112;
              id v40 = v23;
              _os_log_error_impl(&dword_1BC5A9000, v25, OS_LOG_TYPE_ERROR, "CompanionDevicePrewarmer: Error purging %@: %@", buf, 0x16u);
            }

            unint64_t v5 = v20;
            id v9 = v27;
            id v4 = v28;
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v11);
  }
}

void __70__NTKBundleComplicationMigrationCompanionDevicePrewarmer__purgeCaches__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 pairingID];
  char v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

- (void)_handlePairedNotification
{
  char v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Received paired notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handlePairedNotification__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __83__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handlePairedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_prewarmIfNeeded");
}

- (void)_handleUnpairedNotification
{
  char v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "CompanionDevicePrewarmer: Received unpaired notification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handleUnpairedNotification__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __85__NTKBundleComplicationMigrationCompanionDevicePrewarmer__handleUnpairedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeCaches];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_queue_failureCount, 0);
}

void __80__NTKBundleComplicationMigrationCompanionDevicePrewarmer__queue_prewarmIfNeeded__block_invoke_2_cold_1(id *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [*a1 nrDeviceUUID];
  uint64_t v6 = *a2;
  int v7 = 138412546;
  unint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "CompanionDevicePrewarmer: Error prewarming for %@: %@", (uint8_t *)&v7, 0x16u);
}

@end