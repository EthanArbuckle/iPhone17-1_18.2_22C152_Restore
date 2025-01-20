@interface SUCoreSpace
+ (BOOL)_isUserVolume:(id)a3;
+ (id)cacheDeleteUrgencyName:(int)a3;
+ (id)sharedSpaceManager;
+ (void)_checkMinimumRequiredSpace:(unint64_t)a3 purgingFromBase:(id)a4 userInitiated:(BOOL)a5 totalRequiredFreeSpace:(unint64_t)a6 freeSpaceAvailable:(unint64_t)a7 checkAvailableSpaceTransaction:(id)a8 withCompletionQueue:(id)a9 completion:(id)a10;
+ (void)_issueAppOffloadPurgeCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurged:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8;
+ (void)_issueSpaceCheckCompletion:(id)a3 withCompletionQueue:(id)a4 haveEnoughSpace:(BOOL)a5 haveTotalRequired:(BOOL)a6 freeSpaceAvailable:(unint64_t)a7 error:(id)a8 releasingTransaction:(id)a9;
+ (void)_issueSpacePurgeableCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurgeable:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8;
+ (void)_spaceCheckPhaseError:(id)a3 checkingFromBase:(id)a4 withIdentier:(id)a5 completion:(id)a6;
+ (void)_trackSpaceBegin:(id)a3;
+ (void)_trackSpaceBegin:(id)a3 withIdentifier:(id)a4;
+ (void)_trackSpaceEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
+ (void)_trackSpaceEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
+ (void)cacheDeletePurge:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 completion:(id)a6;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 withCompletionQueue:(id)a7 completion:(id)a8;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)checkAvailableFreeSpace:(unint64_t)a3 checkingFromBase:(id)a4 withIdentifier:(id)a5 userInitiated:(BOOL)a6 completion:(id)a7;
+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 completion:(id)a7;
+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 withCompletionQueue:(id)a7 completion:(id)a8;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 additionalOptions:(id)a7 withCompletionQueue:(id)a8 completion:(id)a9;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)offloadAppsPurge:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)offloadAppsPurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7;
- (OS_dispatch_queue)spaceQueue;
- (SUCoreSpace)init;
@end

@implementation SUCoreSpace

+ (id)sharedSpaceManager
{
  if (sharedSpaceManager_spaceManagerOnce != -1) {
    dispatch_once(&sharedSpaceManager_spaceManagerOnce, &__block_literal_global_12);
  }
  v2 = (void *)sharedSpaceManager_spaceManager;

  return v2;
}

uint64_t __33__SUCoreSpace_sharedSpaceManager__block_invoke()
{
  v0 = objc_alloc_init(SUCoreSpace);
  v1 = (void *)sharedSpaceManager_spaceManager;
  sharedSpaceManager_spaceManager = (uint64_t)v0;

  [MEMORY[0x263F77DB0] associateLayer:151 withDomain:@"CacheDeleteErrorDomain"];
  [MEMORY[0x263F77DB0] attributesOfSUCoreErrorCode:8600 indicating:4];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:1 codeName:@"CacheDeleteErrorConnectionInterrupted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:2 codeName:@"CacheDeleteErrorConnectionInvalidated"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:3 codeName:@"CacheDeleteErrorConnectionCancelled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:4 codeName:@"CacheDeleteErrorMissingEntitlement"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:5 codeName:@"CacheDeleteErrorInsufficientPermissions"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:6 codeName:@"CacheDeleteErrorFailedToConnect"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:7 codeName:@"CacheDeleteErrorDuplicateService"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:8 codeName:@"CacheDeleteErrorUnresponsiveService"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:9 codeName:@"CacheDeleteErrorTimeout"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:10 codeName:@"CacheDeleteErrorInvalidVolume"];
  v2 = (void *)MEMORY[0x263F77DB0];

  return [v2 attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:11 codeName:@"CacheDeleteErrorInvalidParams"];
}

- (SUCoreSpace)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)SUCoreSpace;
  v2 = [(SUCoreSpace *)&v16 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    v4 = [MEMORY[0x263F77D78] sharedCore];
    v5 = [v4 commonDomain];
    v6 = (void *)[v3 initWithFormat:@"%@.%@", v5, @"core.space.operation"];

    id v7 = v6;
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    spaceQueue = v2->_spaceQueue;
    v2->_spaceQueue = (OS_dispatch_queue *)v10;

    if (v2->_spaceQueue)
    {
      v12 = [MEMORY[0x263F77DE8] sharedLogger];
      v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[SPACE] DISPATCH: created dispatch queue domain(%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      v13 = [MEMORY[0x263F77DA8] sharedDiag];
      v14 = (void *)[[NSString alloc] initWithFormat:@"unable to create dispatch queue domain(%@)", v7];
      [v13 trackError:@"[SPACE]" forReason:v14 withResult:8100 withError:0];
    }
  }
  return v2;
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 completion:(id)a7
{
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v12 = (__CFString *)a5;
  id v13 = a7;
  id v14 = a8;
  +[SUCoreSpace _trackSpaceBegin:@"checkAvailableSpace" withIdentifier:@"total"];
  v15 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.CheckAvailableSpace"];
  objc_super v16 = [MEMORY[0x263F77DE8] sharedLogger];
  v17 = [v16 oslog];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"NIL";
    if (v12) {
      id v18 = v12;
    }
    *(_DWORD *)buf = 138412546;
    v35 = v18;
    __int16 v36 = 2048;
    unint64_t v37 = a3;
    _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "[SPACE] Checking available space from base path %@.  Required free space: %lld", buf, 0x16u);
  }
  BOOL v19 = a4 == 4;

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke;
  v25[3] = &unk_2640DE1B0;
  id v26 = v13;
  id v27 = v15;
  int v32 = a4;
  unint64_t v30 = a3;
  unint64_t v31 = a6;
  v28 = v12;
  id v29 = v14;
  BOOL v33 = a4 == 4;
  v20 = v12;
  id v21 = v15;
  id v22 = v13;
  id v23 = v14;
  +[SUCoreSpace checkAvailableFreeSpace:a3 checkingFromBase:v20 withIdentifier:@"total" userInitiated:v19 completion:v25];
}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v8 = +[SUCoreSpace sharedSpaceManager];
  v9 = [v8 spaceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_2640DE188;
  id v15 = v7;
  id v19 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v24 = a2;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v17 = v10;
  uint64_t v20 = v11;
  uint64_t v21 = a3;
  int v23 = *(_DWORD *)(a1 + 80);
  uint64_t v22 = v12;
  id v18 = *(id *)(a1 + 48);
  char v25 = *(unsigned char *)(a1 + 84);
  id v13 = v7;
  dispatch_async(v9, block);
}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", @"checkAvailableSpace", @"total", [v2 code], *(void *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 64) withCompletionQueue:*(void *)(a1 + 40) haveEnoughSpace:0 haveTotalRequired:0 freeSpaceAvailable:0 error:*(void *)(a1 + 32) releasingTransaction:*(void *)(a1 + 48)];
    return;
  }
  if (*(unsigned char *)(a1 + 100))
  {
    +[SUCoreSpace _trackSpaceEnd:@"checkAvailableSpace" withIdentifier:@"total" withResult:0 withError:0];
    id v3 = [MEMORY[0x263F77DE8] sharedLogger];
    v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 72);
      uint64_t v6 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134218240;
      v43 = v5;
      __int16 v44 = 2048;
      uint64_t v45 = v6;
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "[SPACE] total disk space available: need %llu and %llu is available (have enough space)", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v33 = *(void *)(a1 + 48);
    uint64_t v10 = 1;
LABEL_7:
    +[SUCoreSpace _issueSpaceCheckCompletion:v7 withCompletionQueue:v9 haveEnoughSpace:1 haveTotalRequired:v10 freeSpaceAvailable:v8 error:0 releasingTransaction:v33];
    return;
  }
  uint64_t v11 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *(void **)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 134218240;
    v43 = v13;
    __int16 v44 = 2048;
    uint64_t v45 = v14;
    _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[SPACE] not enough free space for total required: need %llu and %llu is available", buf, 0x16u);
  }

  if (*(_DWORD *)(a1 + 96) == -1)
  {
    unint64_t v20 = *(void *)(a1 + 88);
    if (v20)
    {
      if (*(void *)(a1 + 80) >= v20)
      {
        +[SUCoreSpace _trackSpaceEnd:@"checkAvailableSpace" withIdentifier:@"total" withResult:0 withError:0];
        id v29 = [MEMORY[0x263F77DE8] sharedLogger];
        unint64_t v30 = [v29 oslog];

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 80);
          unint64_t v31 = *(void **)(a1 + 88);
          *(_DWORD *)buf = 134218240;
          v43 = v31;
          __int16 v44 = 2048;
          uint64_t v45 = v32;
          _os_log_impl(&dword_20C8EA000, v30, OS_LOG_TYPE_DEFAULT, "[SPACE] not enough total but have minimal (did not try cache delete): need %llu and %llu is available", buf, 0x16u);
        }

        uint64_t v7 = *(void *)(a1 + 64);
        uint64_t v8 = *(void *)(a1 + 80);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v10 = 0;
        goto LABEL_7;
      }
      uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"not enough minimal space (did not try cache delete): need %llu and %llu is available", *(void *)(a1 + 88), *(void *)(a1 + 80));
      uint64_t v22 = [MEMORY[0x263F77D78] sharedCore];
      int v23 = [v22 buildError:8600 underlying:0 description:v21];

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", @"checkAvailableSpace", @"total", [v23 code], v23);
      char v24 = [MEMORY[0x263F77DE8] sharedLogger];
      char v25 = [v24 oslog];

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_20C8EA000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"not enough total space (did not try cache delete): need %llu and %llu is available", *(void *)(a1 + 72), *(void *)(a1 + 80));
      id v26 = [MEMORY[0x263F77D78] sharedCore];
      int v23 = [v26 buildError:8600 underlying:0 description:v21];

      id v27 = [MEMORY[0x263F77DE8] sharedLogger];
      v28 = [v27 oslog];

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", @"checkAvailableSpace", @"total", [v23 code], v23);
    }
    +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 64) withCompletionQueue:*(void *)(a1 + 40) haveEnoughSpace:0 haveTotalRequired:0 freeSpaceAvailable:*(void *)(a1 + 80) error:v23 releasingTransaction:*(void *)(a1 + 48)];

    return;
  }
  +[SUCoreSpace _trackSpaceEnd:@"checkAvailableSpace" withIdentifier:@"total" withResult:0 withError:0];
  +[SUCorePower setPowerAssertion:1 forIdentifierDomain:@"space.CheckAvailableSpace"];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_77;
  v34[3] = &unk_2640DE160;
  long long v39 = *(_OWORD *)(a1 + 72);
  id v38 = *(id *)(a1 + 64);
  id v35 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 88);
  id v36 = v15;
  uint64_t v40 = v16;
  id v37 = *(id *)(a1 + 56);
  char v41 = *(unsigned char *)(a1 + 101);
  id v17 = (void *)MEMORY[0x210550B20](v34);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 72) - *(void *)(a1 + 80);
  if (v18) {
    +[SUCoreSpace cacheDeletePurge:v19 fromBasePath:v18 cacheDeleteUrgency:*(unsigned int *)(a1 + 96) completion:v17];
  }
  else {
    +[SUCoreSpace cacheDeletePurge:v19 cacheDeleteUrgency:*(unsigned int *)(a1 + 96) withCompletionQueue:0 completion:v17];
  }
}

uint64_t __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_77(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  +[SUCorePower setPowerAssertion:0 forIdentifierDomain:@"space.CheckAvailableSpace"];
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v9 = [v8 oslog];

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 || !a2)
  {
    if (v10)
    {
      uint64_t v14 = *(void *)(a1 + 64);
      uint64_t v15 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218496;
      uint64_t v17 = v14;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete.  Not enough space to install update.", buf, 0x20u);
    }

    return +[SUCoreSpace _checkMinimumRequiredSpace:*(void *)(a1 + 80) purgingFromBase:*(void *)(a1 + 48) userInitiated:*(unsigned __int8 *)(a1 + 88) totalRequiredFreeSpace:*(void *)(a1 + 64) freeSpaceAvailable:*(void *)(a1 + 72) checkAvailableSpaceTransaction:*(void *)(a1 + 40) withCompletionQueue:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218496;
      uint64_t v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete (enough space to install update)", buf, 0x20u);
    }

    return +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 56) withCompletionQueue:*(void *)(a1 + 32) haveEnoughSpace:1 haveTotalRequired:1 freeSpaceAvailable:*(void *)(a1 + 72) + a3 error:0 releasingTransaction:*(void *)(a1 + 40)];
  }
}

+ (void)checkAvailableFreeSpace:(unint64_t)a3 checkingFromBase:(id)a4 withIdentifier:(id)a5 userInitiated:(BOOL)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = +[SUCoreSpace sharedSpaceManager];
  uint64_t v15 = [v14 spaceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke;
  block[3] = &unk_2640DE200;
  id v20 = v11;
  id v21 = v12;
  BOOL v24 = a6;
  id v22 = v13;
  unint64_t v23 = a3;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v15, block);
}

void __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = (__CFString *)*(id *)(a1 + 32);
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = @"/var/mobile/";
  }
  bzero(&v38, 0x878uLL);
  v4 = v3;
  if (statfs((const char *)[(__CFString *)v4 fileSystemRepresentation], &v38))
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"check for available space failed (unable to statfs basePath=%@)", v4];
    uint64_t v6 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v7 = [v6 buildError:8602 underlying:0 description:v5];

    +[SUCoreSpace _spaceCheckPhaseError:v7 checkingFromBase:v4 withIdentier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = [NSString stringWithCString:v38.f_mntonname encoding:4];
    if (v8)
    {
      uint64_t v27 = 0;
      uint64_t v9 = (void *)CacheDeleteCopyAvailableSpaceForVolume();
      BOOL v10 = v9;
      if (v9)
      {
        unint64_t v12 = [v9 unsignedLongLongValue];
        unint64_t v13 = *(void *)(a1 + 56);
        uint64_t v14 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v15 = [v14 oslog];

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 56);
          id v18 = @"NO";
          if (v12 >= v13) {
            id v18 = @"YES";
          }
          *(_DWORD *)buf = 138544386;
          id v29 = v8;
          __int16 v30 = 2114;
          uint64_t v31 = v16;
          __int16 v32 = 2048;
          uint64_t v33 = v17;
          __int16 v34 = 2048;
          unint64_t v35 = v12;
          __int16 v36 = 2114;
          id v37 = v18;
          _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[SPACE] checked space on %{public}@ (%{public}@): required %llu and %llu is available | haveEnoughSpace:%{public}@", buf, 0x34u);
        }

        uint64_t v19 = [MEMORY[0x263F77D78] sharedCore];
        id v20 = [v19 completionQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_100;
        block[3] = &unk_2640DE1D8;
        id v21 = *(id *)(a1 + 48);
        BOOL v26 = v12 >= v13;
        id v24 = v21;
        unint64_t v25 = v12;
        dispatch_async(v20, block);

        v5 = 0;
        uint64_t v7 = 0;
      }
      else
      {
        v5 = (void *)[[NSString alloc] initWithFormat:@"check for available space failed (unable to determine available space through cache delete for basePath=%@)", v4];
        id v22 = [MEMORY[0x263F77D78] sharedCore];
        uint64_t v7 = [v22 buildError:8602 underlying:0 description:v5];

        +[SUCoreSpace _spaceCheckPhaseError:v7 checkingFromBase:v4 withIdentier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
      }
    }
    else
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"check for available space failed (unable to determine volume name from basePath=%@)", v4];
      id v11 = [MEMORY[0x263F77D78] sharedCore];
      uint64_t v7 = [v11 buildError:8602 underlying:0 description:v5];

      +[SUCoreSpace _spaceCheckPhaseError:v7 checkingFromBase:v4 withIdentier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
  }
}

uint64_t __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40), 0);
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 completion:(id)a6
{
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  v35[4] = *MEMORY[0x263EF8340];
  unint64_t v13 = (__CFString *)a4;
  id v14 = a7;
  id v15 = a8;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = @"/var/mobile/";
  }
  if (a6 >= 1) {
    uint64_t v17 = a6;
  }
  else {
    uint64_t v17 = 300;
  }
  v35[0] = v16;
  v34[0] = @"CACHE_DELETE_VOLUME";
  v34[1] = @"CACHE_DELETE_AMOUNT";
  id v18 = [NSNumber numberWithLongLong:a3];
  v35[1] = v18;
  v34[2] = @"CACHE_DELETE_URGENCY_LIMIT";
  uint64_t v19 = [NSNumber numberWithInt:v11];
  v35[2] = v19;
  v34[3] = @"CACHE_DELETE_PURGE_TIMEOUT";
  id v20 = [NSNumber numberWithInt:v17];
  v35[3] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

  id v22 = [MEMORY[0x263F77DE8] sharedLogger];
  unint64_t v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v21;
    _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering CacheDeletePurge with info: %{public}@", buf, 0xCu);
  }

  +[SUCoreSpace _trackSpaceBegin:@"CacheDeletePurgeSpaceWithInfo"];
  id v24 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.CacheDeletePurge"];
  id v27 = v15;
  id v25 = v14;
  id v26 = v24;
  v29[3] = CacheDeletePurgeSpaceWithInfo();

  _Block_object_dispose(&v28, 8);
}

void __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  valuePtr = 0;
  if (!a2)
  {
    uint64_t v11 = @"no results provided on cache delete purge complete";
LABEL_12:
    uint64_t v12 = 8601;
LABEL_15:
    id v3 = [MEMORY[0x263F77D78] sharedCore];
    id v14 = [v3 buildError:v12 underlying:0 description:v11];
    goto LABEL_16;
  }
  id v3 = a2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3))
  {
    unint64_t v13 = [MEMORY[0x263F77DA8] sharedDiag];
    [v13 trackAnomaly:@"cacheDeletePurge" forReason:@"result provided by CacheDeletePurgeSpaceWithInfo is not CFDictionary type - ignored" withResult:8112 withError:0];

    uint64_t v11 = @"invalid results type provided on cache delete purge complete";
    goto LABEL_12;
  }
  v5 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v3;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[PURGE] cache delete purge results: %@", buf, 0xCu);
  }

  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v3, @"CACHE_DELETE_AMOUNT");
  if (!Value)
  {
    uint64_t v11 = @"no amount of space purged provided on cache delete purge complete";
    uint64_t v12 = 8601;
    goto LABEL_14;
  }
  CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = valuePtr;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld bytes", buf, 0xCu);
  }

  if ((unint64_t)valuePtr < *(void *)(a1 + 64))
  {
    id v10 = [NSString alloc];
    uint64_t v11 = (__CFString *)objc_msgSend(v10, "initWithFormat:", @"purged %lld but needed to purge %lld (not enough space)", valuePtr, *(void *)(a1 + 64));
    uint64_t v12 = 8600;
LABEL_14:

    goto LABEL_15;
  }
  id v18 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v19 = [v18 oslog];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    id v29 = valuePtr;
    __int16 v30 = 2048;
    uint64_t v31 = v20;
    _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }

  uint64_t v12 = 0;
  uint64_t v11 = 0;
  id v14 = 0;
LABEL_16:

  +[SUCoreSpace _trackSpaceEnd:@"CacheDeletePurgeSpaceWithInfo" withResult:v12 withError:v14];
  if (*(void *)(a1 + 48))
  {
    id v15 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v16 = [v15 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_136;
    block[3] = &unk_2640DE228;
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = v12;
    id v26 = valuePtr;
    id v22 = v14;
    id v23 = *(id *)(a1 + 40);
    dispatch_async(v16, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurge"];
  }
  uint64_t v17 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v17)
  {
    CFRelease(v17);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

uint64_t __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_136(void *a1)
{
  (*(void (**)(void, BOOL, void, void))(a1[6] + 16))(a1[6], a1[7] == 0, a1[8], a1[4]);
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = a1[5];

  return [v2 endTransaction:v3 withName:@"space.CacheDeletePurge"];
}

+ (void)cacheDeletePurge:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:@"/var/mobile/"])
  {
    uint64_t v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.CacheDeletePurge"];
    uint64_t v12 = +[SUCoreSpace sharedSpaceManager];
    unint64_t v13 = [v12 spaceQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_2640DE2A0;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace cacheDeletePurge:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:v7 timeout:300 withCompletionQueue:v13 completion:v15];
  }
  else
  {
    +[SUCoreSpace cacheDeletePurge:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:v7 withCompletionQueue:v9 completion:v10];
  }
}

void __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DE278;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurge"];
  }
}

uint64_t __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.CacheDeletePurge"];
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 additionalOptions:(id)a7 withCompletionQueue:(id)a8 completion:(id)a9
{
  v59[3] = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a7;
  id v46 = a8;
  id v15 = a9;
  +[SUCoreSpace _trackSpaceBegin:@"CacheDeleteCopyPurgeableSpaceWithInfo"];
  uint64_t v45 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.CacheDeletePurgeable"];
  if (a6 >= 1) {
    uint64_t v16 = a6;
  }
  else {
    uint64_t v16 = 300;
  }
  v47 = v13;
  v59[0] = v13;
  v58[0] = @"CACHE_DELETE_VOLUME";
  v58[1] = @"CACHE_DELETE_URGENCY";
  id v17 = [NSNumber numberWithLongLong:a5];
  v59[1] = v17;
  v58[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  id v18 = [NSNumber numberWithInt:v16];
  v59[2] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
  uint64_t v20 = (void *)[v19 mutableCopy];

  if (v14) {
    [v20 addEntriesFromDictionary:v14];
  }
  id v21 = [MEMORY[0x263F77DE8] sharedLogger];
  id v22 = [v21 oslog];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v55 = (unint64_t)v20;
    _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering cache delete purgeable check with options: %{public}@", buf, 0xCu);
  }

  uint64_t v23 = CacheDeleteCopyPurgeableSpaceWithInfo();
  unint64_t v24 = 0x263F77000;
  if (!v23)
  {
    uint64_t v33 = v14;
    unint64_t v30 = 0;
    uint64_t v31 = @"no results provided on cache delete purgeable complete";
LABEL_18:
    uint64_t v32 = 8603;
LABEL_21:
    uint64_t v25 = [*(id *)(v24 + 3448) sharedCore];
    unint64_t v35 = [v25 buildError:v32 underlying:0 description:v31];
    goto LABEL_22;
  }
  uint64_t v25 = (void *)v23;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v25))
  {
    uint64_t v33 = v14;
    __int16 v34 = [MEMORY[0x263F77DA8] sharedDiag];
    [v34 trackAnomaly:@"cacheDeletePurgeable" forReason:@"result provided by CacheDeleteCopyPurgeableSpaceWithInfo is not CFDictionary type - ignored" withResult:8112 withError:0];

    CFRelease(v25);
    unint64_t v30 = 0;
    uint64_t v31 = @"invalid results type provided on cache delete purgeable complete";
    goto LABEL_18;
  }
  id v27 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v28 = [v27 oslog];

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v55 = (unint64_t)v25;
    _os_log_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] cache delete purgeable results: %@", buf, 0xCu);
  }

  id v29 = [v25 objectForKey:@"CACHE_DELETE_AMOUNT"];
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v30 = 0;
    uint64_t v31 = @"no amount of purgeable space provided on cache delete purgeable complete";
    uint64_t v32 = 8603;
    goto LABEL_20;
  }
  unint64_t v30 = [v29 unsignedLongLongValue];
  if (v30 < a3)
  {
    uint64_t v31 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"purgeable %lld but needed to purge %lld (not enough space)", v30, a3);
    uint64_t v32 = 8600;
LABEL_20:
    uint64_t v33 = v14;

    unint64_t v24 = 0x263F77000uLL;
    goto LABEL_21;
  }
  uint64_t v33 = v14;
  v42 = [MEMORY[0x263F77DE8] sharedLogger];
  v43 = [v42 oslog];

  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v55 = v30;
    __int16 v56 = 2048;
    unint64_t v57 = a3;
    _os_log_impl(&dword_20C8EA000, v43, OS_LOG_TYPE_DEFAULT, "[SPACE] purgeable %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }

  uint64_t v32 = 0;
  uint64_t v31 = 0;
  unint64_t v35 = 0;
  unint64_t v24 = 0x263F77000;
LABEL_22:

  +[SUCoreSpace _trackSpaceEnd:@"CacheDeleteCopyPurgeableSpaceWithInfo" withResult:v32 withError:v35];
  __int16 v36 = *(void **)(v24 + 3448);
  id v37 = v15;
  if (v15)
  {
    statfs v38 = [v36 sharedCore];
    uint64_t v39 = v46;
    uint64_t v40 = [v38 selectCompletionQueue:v46];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke;
    block[3] = &unk_2640DE228;
    id v51 = v37;
    uint64_t v52 = v32;
    unint64_t v53 = v30;
    id v49 = v35;
    char v41 = v45;
    id v50 = v45;
    dispatch_async(v40, block);
  }
  else
  {
    char v41 = v45;
    [v36 endTransaction:v45 withName:@"space.CacheDeletePurgeable"];
    uint64_t v39 = v46;
  }
}

uint64_t __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke(void *a1)
{
  (*(void (**)(void, BOOL, void, void))(a1[6] + 16))(a1[6], a1[7] == 0, a1[8], a1[4]);
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = a1[5];

  return [v2 endTransaction:v3 withName:@"space.CacheDeletePurgeable"];
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:@"/var/mobile/"])
  {
    uint64_t v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.CacheDeletePurgeable"];
    id v12 = +[SUCoreSpace sharedSpaceManager];
    id v13 = [v12 spaceQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_2640DE2A0;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:v7 timeout:300 additionalOptions:0 withCompletionQueue:v13 completion:v15];
  }
  else
  {
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:v7 withCompletionQueue:v9 completion:v10];
  }
}

void __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DE278;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurgeable"];
  }
}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.CacheDeletePurgeable"];
}

+ (id)cacheDeleteUrgencyName:(int)a3
{
  if ((a3 + 1) > 5) {
    return @"UNKNOWN TYPE";
  }
  else {
    return off_2640DE388[a3 + 1];
  }
}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = a7;
  id v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:@"ASDPurgeableAppRequest"];
  id v14 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.AppOffloadPurgeable"];
  id v15 = objc_alloc(MEMORY[0x263F254E0]);
  if (v13) {
    char v16 = v13;
  }
  else {
    char v16 = @"/var/mobile/";
  }
  id v17 = (void *)[v15 initWithVolume:v16 urgency:a5];

  [v17 setPerformAvailablityCheck:1];
  id v18 = [MEMORY[0x263F77DA0] sharedDevice];
  uint64_t v19 = [v18 deviceClass];
  if ([v19 isEqualToString:@"AppleTV"])
  {
    int v20 = _os_feature_enabled_impl();

    if (v20) {
      [v17 setSkipLaunchCheck:1];
    }
  }
  else
  {
  }
  id v21 = [MEMORY[0x263F77DE8] sharedLogger];
  id v22 = [v21 oslog];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v17;
    _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering app offload purgeable check with options: %{public}@", buf, 0xCu);
  }

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F254D0]) initWithOptions:v17];
  if (v23)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v27[3] = &unk_2640DE2C8;
    unint64_t v31 = a3;
    id v30 = v12;
    id v28 = v11;
    id v29 = v14;
    [v23 startWithCompletionBlock:v27];

    unint64_t v24 = v30;
  }
  else
  {
    uint64_t v25 = [MEMORY[0x263F77DA8] sharedDiag];
    [v25 trackAnomaly:@"ASDPurgeableAppRequest" forReason:@"Failed to create ASDPurgeableAppRequest instance" withResult:8100 withError:0];

    id v26 = [MEMORY[0x263F77D78] sharedCore];
    unint64_t v24 = [v26 buildError:8605 underlying:0 description:@"Failed to create ASDPurgeAppsRequest instance"];

    +[SUCoreSpace _trackSpaceEnd:@"ASDPurgeAppsRequest" withResult:8605 withError:v24];
    +[SUCoreSpace _issueSpacePurgeableCompetion:v12 withCompletionQueue:v11 result:0 spacePurgeable:0 error:v24 releasingTransaction:v14];
  }
}

void __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    unint64_t v9 = 0;
    id v12 = @"ASDPurgeableAppRequest returned null response";
    uint64_t v13 = 8605;
    goto LABEL_12;
  }
  unint64_t v9 = [v7 purgeableSize];
  id v10 = [MEMORY[0x263F77DE8] sharedLogger];
  id v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = v9;
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[SPACE] app offload purgeable space %lld bytes", buf, 0xCu);
  }

  if (v9 < a1[7])
  {
    id v12 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"purgeable %lld is less than requested %lld (not enough space)", v9, a1[7]);
    uint64_t v13 = 8600;
LABEL_12:
    id v15 = [MEMORY[0x263F77D78] sharedCore];
    id v17 = [v15 buildError:v13 underlying:v8 description:v12];
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  if (!a2)
  {
    id v12 = @"ASDPurgeableAppRequest returned result=NO";
    uint64_t v13 = 8606;
    goto LABEL_12;
  }
  id v14 = [MEMORY[0x263F77DE8] sharedLogger];
  id v15 = [v14 oslog];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = a1[7];
    *(_DWORD *)buf = 134218240;
    unint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[SPACE] app offload purgeable %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }
  uint64_t v13 = 0;
  id v12 = 0;
  id v17 = 0;
  uint64_t v18 = 1;
LABEL_13:

  +[SUCoreSpace _trackSpaceEnd:@"ASDPurgeableAppRequest" withResult:v13 withError:v17];
  +[SUCoreSpace _issueSpacePurgeableCompetion:a1[6] withCompletionQueue:a1[4] result:v18 spacePurgeable:v9 error:v17 releasingTransaction:a1[5]];
}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:@"/var/mobile/"])
  {
    id v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.AppOffloadPurgeable"];
    id v12 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v13 = [v12 selectCompletionQueue:v9];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_2640DE2A0;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:a4 withCompletionQueue:v13 completion:v15];
  }
  else
  {
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:a3 cacheDeleteUrgency:a4 withCompletionQueue:v9 completion:v10];
  }
}

void __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    id v8 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DE278;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurgeable"];
  }
}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.AppOffloadPurgeable"];
}

+ (void)offloadAppsPurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = a7;
  id v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:@"ASDPurgeAppsRequest"];
  id v14 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.AppOffloadPurge"];
  id v15 = objc_alloc(MEMORY[0x263F254C8]);
  if (v13) {
    char v16 = v13;
  }
  else {
    char v16 = @"/var/mobile/";
  }
  id v17 = (void *)[v15 initWithVolume:v16 urgency:a5];

  id v18 = [NSNumber numberWithUnsignedLongLong:a3];
  [v17 setDesiredPurgeAmount:v18];

  uint64_t v19 = [MEMORY[0x263F77DA0] sharedDevice];
  unint64_t v20 = [v19 deviceClass];
  if ([v20 isEqualToString:@"AppleTV"])
  {
    int v21 = _os_feature_enabled_impl();

    if (v21) {
      [v17 setSkipLaunchCheck:1];
    }
  }
  else
  {
  }
  uint64_t v22 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v17;
    _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering app offload purge with options: %{public}@", buf, 0xCu);
  }

  unint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F254C0]) initWithOptions:v17];
  if (v24)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v28[3] = &unk_2640DE2F0;
    unint64_t v32 = a3;
    id v31 = v12;
    id v29 = v11;
    id v30 = v14;
    [v24 startWithCompletionBlock:v28];

    uint64_t v25 = v31;
  }
  else
  {
    id v26 = [MEMORY[0x263F77DA8] sharedDiag];
    [v26 trackAnomaly:@"ASDPurgeAppsRequest" forReason:@"Failed to create ASDPurgeAppsRequest instance" withResult:8100 withError:0];

    id v27 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v25 = [v27 buildError:8607 underlying:0 description:@"Failed to create ASDPurgeAppsRequest instance"];

    +[SUCoreSpace _trackSpaceEnd:@"ASDPurgeAppsRequest" withResult:8607 withError:v25];
    +[SUCoreSpace _issueAppOffloadPurgeCompetion:v12 withCompletionQueue:v11 result:0 spacePurged:0 error:v25 releasingTransaction:v14];
  }
}

void __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F77DE8] sharedLogger];
  id v10 = [v9 oslog];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v46 = @"ASDPurgeAppsRequest returned null response";
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: %@", buf, 0xCu);
    }

    unint64_t v29 = 0;
    id v30 = @"ASDPurgeAppsRequest returned null response";
    uint64_t v31 = 8607;
    goto LABEL_27;
  }
  if (v11)
  {
    *(_DWORD *)buf = 134217984;
    id v46 = (__CFString *)[v7 purgedSize];
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: purged size %lld bytes", buf, 0xCu);
  }
  int v37 = a2;
  statfs v38 = a1;
  id v39 = v8;

  id v12 = [MEMORY[0x263F77DE8] sharedLogger];
  id v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v7 purgedApps];
    int v15 = [v14 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v15;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: number of purgedApps: %d", buf, 8u);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v40 = v7;
  char v16 = [v7 purgedApps];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v22 = [v21 bundleID];

        if (v22)
        {
          uint64_t v23 = [MEMORY[0x263F77DE8] sharedLogger];
          unint64_t v24 = [v23 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v21 bundleID];
            id v26 = [v21 purgeableReason];
            int v27 = [v21 purgeableType];
            uint64_t v28 = [v21 staticDiskUsage];
            *(_DWORD *)buf = 138413058;
            id v46 = v25;
            __int16 v47 = 2112;
            v48 = v26;
            __int16 v49 = 1024;
            int v50 = v27;
            __int16 v51 = 2048;
            uint64_t v52 = v28;
            _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload purged app bundleID: '%@'; reason: '%@'; purgeableType: '%d'; diskUsage: '%lld'",
              buf,
              0x26u);
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v18);
  }

  id v7 = v40;
  unint64_t v29 = [v40 purgedSize];
  a1 = v38;
  if (v29 < v38[7])
  {
    id v30 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"purged %lld but needed to purge %lld (not enough space)", v29, v38[7]);
    uint64_t v31 = 8600;
    id v8 = v39;
LABEL_27:
    uint64_t v33 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v35 = [v33 buildError:v31 underlying:v8 description:v30];
    uint64_t v36 = 0;
    goto LABEL_28;
  }
  id v8 = v39;
  if (!v37)
  {
    id v30 = @"ASDPurgeAppsRequest returned result=NO";
    uint64_t v31 = 8608;
    goto LABEL_27;
  }
  unint64_t v32 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v33 = [v32 oslog];

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = (void *)v38[7];
    *(_DWORD *)buf = 134218240;
    id v46 = (__CFString *)v29;
    __int16 v47 = 2048;
    v48 = v34;
    _os_log_impl(&dword_20C8EA000, v33, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }
  uint64_t v31 = 0;
  id v30 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 1;
LABEL_28:

  +[SUCoreSpace _trackSpaceEnd:@"ASDPurgeAppsRequest" withResult:v31 withError:v35];
  +[SUCoreSpace _issueAppOffloadPurgeCompetion:a1[6] withCompletionQueue:a1[4] result:v36 spacePurged:v29 error:v35 releasingTransaction:a1[5]];
}

+ (void)offloadAppsPurge:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:@"/var/mobile/"])
  {
    BOOL v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"space.AppOffloadPurge"];
    id v12 = +[SUCoreSpace sharedSpaceManager];
    id v13 = [v12 spaceQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_2640DE2A0;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace offloadAppsPurge:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:a4 withCompletionQueue:v13 completion:v15];
  }
  else
  {
    +[SUCoreSpace offloadAppsPurge:a3 fromBasePath:@"/var/mobile/" cacheDeleteUrgency:a4 withCompletionQueue:v9 completion:v10];
  }
}

void __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    id v8 = [MEMORY[0x263F77D78] sharedCore];
    id v9 = [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DE278;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurge"];
  }
}

uint64_t __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.AppOffloadPurge"];
}

+ (void)_issueAppOffloadPurgeCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurged:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    id v17 = [MEMORY[0x263F77D78] sharedCore];
    id v18 = [v17 selectCompletionQueue:v14];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke;
    block[3] = &unk_2640DE278;
    BOOL v24 = a5;
    id v22 = v13;
    int64_t v23 = a6;
    id v20 = v15;
    id v21 = v16;
    dispatch_async(v18, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:v16 withName:@"space.AppOffloadPurge"];
  }
}

uint64_t __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.AppOffloadPurge"];
}

+ (void)_issueSpacePurgeableCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurgeable:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    id v17 = [MEMORY[0x263F77D78] sharedCore];
    id v18 = [v17 selectCompletionQueue:v14];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke;
    block[3] = &unk_2640DE278;
    BOOL v24 = a5;
    id v22 = v13;
    int64_t v23 = a6;
    id v20 = v15;
    id v21 = v16;
    dispatch_async(v18, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:v16 withName:@"space.AppOffloadPurgeable"];
  }
}

uint64_t __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"space.AppOffloadPurgeable"];
}

+ (void)_checkMinimumRequiredSpace:(unint64_t)a3 purgingFromBase:(id)a4 userInitiated:(BOOL)a5 totalRequiredFreeSpace:(unint64_t)a6 freeSpaceAvailable:(unint64_t)a7 checkAvailableSpaceTransaction:(id)a8 withCompletionQueue:(id)a9 completion:(id)a10
{
  BOOL v13 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  if (a3)
  {
    uint64_t v19 = [MEMORY[0x263F77DE8] sharedLogger];
    id v20 = [v19 oslog];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = a3;
      _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "[SPACE] checking minimal disk space available: need %llu", buf, 0xCu);
    }

    +[SUCoreSpace _trackSpaceBegin:@"checkAvailableSpace" withIdentifier:@"minimal"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke;
    v26[3] = &unk_2640DE340;
    id v29 = v18;
    id v27 = v17;
    id v28 = v16;
    unint64_t v30 = a3;
    +[SUCoreSpace checkAvailableFreeSpace:a3 checkingFromBase:v15 withIdentifier:@"minimal" userInitiated:v13 completion:v26];

    id v21 = v29;
  }
  else
  {
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"not enough total space (no minimal): need %llu and %llu is available", a6, a7);
    id v22 = [MEMORY[0x263F77D78] sharedCore];
    int64_t v23 = [v22 buildError:8600 underlying:0 description:v21];

    BOOL v24 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v32 = (unint64_t)v21;
      _os_log_impl(&dword_20C8EA000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:v18 withCompletionQueue:v17 haveEnoughSpace:0 haveTotalRequired:0 freeSpaceAvailable:a7 error:v23 releasingTransaction:v16];
  }
}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = +[SUCoreSpace sharedSpaceManager];
  id v9 = [v8 spaceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_2640DE318;
  id v14 = v7;
  id v17 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v20 = a2;
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = v10;
  uint64_t v18 = v11;
  uint64_t v19 = a3;
  id v12 = v7;
  dispatch_async(v9, block);
}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", @"checkAvailableSpace", @"minimal", [v2 code], *(void *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 56) withCompletionQueue:*(void *)(a1 + 40) haveEnoughSpace:0 haveTotalRequired:0 freeSpaceAvailable:0 error:*(void *)(a1 + 32) releasingTransaction:*(void *)(a1 + 48)];
  }
  else if (*(unsigned char *)(a1 + 80))
  {
    +[SUCoreSpace _trackSpaceEnd:@"checkAvailableSpace" withIdentifier:@"minimal" withResult:0 withError:0];
    uint64_t v3 = [MEMORY[0x263F77DE8] sharedLogger];
    v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      BOOL v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "[SPACE] minimal disk space available: need %llu and %llu is available (have enough space)", buf, 0x16u);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 56) withCompletionQueue:*(void *)(a1 + 40) haveEnoughSpace:1 haveTotalRequired:0 freeSpaceAvailable:*(void *)(a1 + 72) error:0 releasingTransaction:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"not enough minimal space to install update: need %llu and %llu is available", *(void *)(a1 + 64), *(void *)(a1 + 72));
    id v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v13 = v7;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    id v10 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v11 = [v10 buildError:8600 underlying:0 description:v7];

    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", @"checkAvailableSpace", @"minimal", [v11 code], v11);
    +[SUCoreSpace _issueSpaceCheckCompletion:*(void *)(a1 + 56) withCompletionQueue:*(void *)(a1 + 40) haveEnoughSpace:0 haveTotalRequired:0 freeSpaceAvailable:*(void *)(a1 + 72) error:v11 releasingTransaction:*(void *)(a1 + 48)];
  }
}

+ (void)_spaceCheckPhaseError:(id)a3 checkingFromBase:(id)a4 withIdentier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x263F77DA8];
  id v12 = a5;
  id v13 = a4;
  __int16 v14 = [v11 sharedDiag];
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"space check from base(%@) phase(%@) failed", v13, v12];

  objc_msgSend(v14, "trackError:forReason:withResult:withError:", @"[SPACE]", v15, objc_msgSend(v9, "code"), v9);
  uint64_t v16 = [MEMORY[0x263F77D78] sharedCore];
  id v17 = [v16 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke;
  block[3] = &unk_2640DC4C8;
  id v21 = v9;
  id v22 = v10;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(v17, block);
}

uint64_t __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

+ (void)_issueSpaceCheckCompletion:(id)a3 withCompletionQueue:(id)a4 haveEnoughSpace:(BOOL)a5 haveTotalRequired:(BOOL)a6 freeSpaceAvailable:(unint64_t)a7 error:(id)a8 releasingTransaction:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = v17;
  if (v14)
  {
    id v19 = [MEMORY[0x263F77D78] sharedCore];
    char v20 = [v19 selectCompletionQueue:v15];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke;
    block[3] = &unk_2640DE368;
    BOOL v26 = a5;
    BOOL v27 = a6;
    id v24 = v14;
    unint64_t v25 = a7;
    id v22 = v16;
    id v23 = v18;
    dispatch_async(v20, block);
  }
  else if (v17)
  {
    [MEMORY[0x263F77D78] endTransaction:v17 withName:@"space.CheckAvailableSpace"];
  }
}

uint64_t __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = (void *)MEMORY[0x263F77D78];
    return objc_msgSend(v3, "endTransaction:withName:");
  }
  return result;
}

+ (BOOL)_isUserVolume:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  bzero(v8, 0x40CuLL);
  v7[2] = 0;
  v7[0] = 5;
  v7[1] = 2147491840;
  BOOL result = 0;
  if (getattrlist((const char *)objc_msgSend(a3, "fileSystemRepresentation", 5, 2147491840, 0), v7, v8, 0x40CuLL, 0) != -1)
  {
    v4 = [NSString stringWithCString:(char *)v9 + v9[0] encoding:4];
    char v5 = [v4 isEqualToString:@"User"];

    if (v5) {
      return 1;
    }
  }
  return result;
}

+ (void)_trackSpaceBegin:(id)a3
{
}

+ (void)_trackSpaceBegin:(id)a3 withIdentifier:(id)a4
{
  char v5 = (void *)MEMORY[0x263F77DA8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDiag];
  [v8 trackBegin:v7 atLevel:1 forModule:@"space" withIdentifier:v6];
}

+ (void)_trackSpaceEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

+ (void)_trackSpaceEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x263F77DA8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 sharedDiag];
  [v13 trackEnd:v12 atLevel:1 forModule:@"space" withIdentifier:v11 withResult:a5 withError:v10];
}

- (OS_dispatch_queue)spaceQueue
{
  return self->_spaceQueue;
}

- (void).cxx_destruct
{
}

@end