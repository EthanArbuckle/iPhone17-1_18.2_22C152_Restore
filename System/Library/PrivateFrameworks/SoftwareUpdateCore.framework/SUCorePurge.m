@interface SUCorePurge
+ (void)_trackPurgeBegin:(id)a3;
+ (void)_trackPurgeBegin:(id)a3 withIdentifier:(id)a4;
+ (void)_trackPurgeEnd:(id)a3;
+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4;
+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
+ (void)_trackPurgeEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
+ (void)checkForAssetsOfType:(id)a3 completion:(id)a4;
+ (void)checkForAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)checkForExistingAssetsWithPolicy:(id)a3 completion:(id)a4;
+ (void)checkForExistingAssetsWithPolicy:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)checkForExistingPrepare:(id)a3;
+ (void)checkForExistingPrepareWithCompletionQueue:(id)a3 completion:(id)a4;
+ (void)previousUpdateState:(BOOL *)a3 tetheredRestore:(BOOL *)a4 failedBackward:(BOOL *)a5 failedForward:(BOOL *)a6;
+ (void)removeAllAssetsOfType:(id)a3 completion:(id)a4;
+ (void)removeAllAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)removeAllAssetsOfTypes:(id)a3 completion:(id)a4;
+ (void)removeAllAssetsOfTypes:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5;
+ (void)removeAllUpdateContent:(id)a3;
+ (void)removeAllUpdateContentWithCompletionQueue:(id)a3 completion:(id)a4;
+ (void)removeAllUpdateContentWithPolicy:(id)a3 completion:(id)a4;
+ (void)removeAllUpdateContentWithPolicy:(id)a3 completionQueue:(id)a4 completion:(id)a5;
@end

@implementation SUCorePurge

+ (void)previousUpdateState:(BOOL *)a3 tetheredRestore:(BOOL *)a4 failedBackward:(BOOL *)a5 failedForward:(BOOL *)a6
{
  v10 = [MEMORY[0x263F77D78] beginTransactionWithName:@"purge.PreviousUpdateState"];
  unsigned int v26 = 0;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  +[SUCorePurge _trackPurgeBegin:@"MSURetrievePreviousUpdateState"];
  if (SUCoreBorder_MSURetrievePreviousUpdateState())
  {
    switch(v26)
    {
      case 0u:
        v11 = [MEMORY[0x263F77DE8] sharedLogger];
        v12 = [v11 oslog];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateNone [tethered restore]", buf, 2u);
        }

        if (!a4) {
          goto LABEL_30;
        }
        v13 = 0;
        *a4 = 1;
        break;
      case 1u:
        v20 = [MEMORY[0x263F77DE8] sharedLogger];
        v21 = [v20 oslog];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_20C8EA000, v21, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateSuccessful [successful OTA]", v24, 2u);
        }

        if (!a3) {
          goto LABEL_30;
        }
        v13 = 0;
        *a3 = 1;
        break;
      case 2u:
        v15 = [MEMORY[0x263F77DE8] sharedLogger];
        v16 = [v15 oslog];

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateFailedBackward [OTA attempt failed back to previous OS]", v23, 2u);
        }

        if (!a5) {
          goto LABEL_30;
        }
        v13 = 0;
        *a5 = 1;
        break;
      case 3u:
        v17 = [MEMORY[0x263F77DE8] sharedLogger];
        v18 = [v17 oslog];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "[PURGE] MSU previous update state:kMSUUpdateStateFailedForward [OTA attempt encountered failure but continued to the new OS]", v22, 2u);
        }

        if (a6)
        {
          v13 = 0;
          *a6 = 1;
        }
        else
        {
LABEL_30:
          v13 = 0;
        }
        break;
      default:
        v14 = [MEMORY[0x263F77D78] sharedCore];
        v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown previous update state: %d", v26);
        v13 = [v14 buildError:8116 underlying:0 description:v19];

        goto LABEL_16;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F77D78] sharedCore];
    v13 = [v14 buildError:8802 underlying:0 description:@"MSURetrievePreviousUpdateState failed to provide state"];
LABEL_16:
  }
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", @"MSURetrievePreviousUpdateState", [v13 code], v13);
  [MEMORY[0x263F77D78] endTransaction:v10 withName:@"purge.PreviousUpdateState"];
}

+ (void)checkForExistingPrepare:(id)a3
{
}

+ (void)checkForExistingPrepareWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F77D78] beginTransactionWithName:@"purge.CheckForExistingPrepare"];
  v8 = [MEMORY[0x263F77D78] sharedCore];
  v9 = [v8 buildError:8113 underlying:0 description:@"checkForExistingPrepare not yet supported by MSU SPI"];

  v10 = [MEMORY[0x263F77DA8] sharedDiag];
  [v10 trackError:@"[PURGE]" forReason:@"checkForExistingPrepare not yet supported" withResult:8113 withError:v9];

  if (v6)
  {
    v11 = [MEMORY[0x263F77D78] sharedCore];
    v12 = [v11 selectCompletionQueue:v5];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke;
    block[3] = &unk_2640DC2C0;
    id v16 = v6;
    id v14 = v9;
    id v15 = v7;
    dispatch_async(v12, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:v7 withName:@"purge.CheckForExistingPrepare"];
  }
}

uint64_t __69__SUCorePurge_checkForExistingPrepareWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"purge.CheckForExistingPrepare"];
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 completion:(id)a4
{
}

+ (void)checkForExistingAssetsWithPolicy:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)MEMORY[0x263F77D78];
  id v10 = a3;
  v11 = [v9 beginTransactionWithName:@"purge.CheckForExistingAssets"];
  v12 = (void *)[v10 copy];

  v13 = [v12 softwareUpdateAssetType];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke;
  v18[3] = &unk_2640DD810;
  id v19 = v12;
  id v20 = v7;
  id v21 = v11;
  id v22 = v8;
  id v14 = v11;
  id v15 = v7;
  id v16 = v8;
  id v17 = v12;
  +[SUCorePurge checkForAssetsOfType:v13 withCompletionQueue:0 completion:v18];
}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] documentationAssetType];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2;
  v10[3] = &unk_2640DD7E8;
  id v15 = a1[7];
  id v11 = v6;
  id v12 = a1[5];
  id v13 = v5;
  id v14 = a1[6];
  id v8 = v5;
  id v9 = v6;
  +[SUCorePurge checkForAssetsOfType:v7 withCompletionQueue:0 completion:v10];
}

void __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 64))
  {
    id v7 = *(id *)(a1 + 32);
    id v8 = v7;
    if (v6 && !v7) {
      id v8 = v6;
    }
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v10 = [v9 selectCompletionQueue:*(void *)(a1 + 40)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3;
    block[3] = &unk_2640DCE38;
    id v17 = *(id *)(a1 + 64);
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    id v15 = v8;
    id v16 = *(id *)(a1 + 56);
    id v11 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 56) withName:@"purge.CheckForExistingAssets"];
  }
}

uint64_t __79__SUCorePurge_checkForExistingAssetsWithPolicy_withCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 endTransaction:v3 withName:@"purge.CheckForExistingAssets"];
}

+ (void)checkForAssetsOfType:(id)a3 completion:(id)a4
{
}

+ (void)checkForAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F77D78] sharedCore];
  id v11 = [v10 waitedOperationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke;
  block[3] = &unk_2640DCD98;
  id v17 = v8;
  id v18 = v9;
  id v16 = v7;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v11, block);
}

void __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:*(void *)(a1 + 32)];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  [v2 returnTypes:1];
  uint64_t v3 = [v2 queryMetaDataSync];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (void *)[[NSString alloc] initWithFormat:@"failed to query for installed %@ assets (MAQuery domain)", *(void *)(a1 + 32)];
    id v6 = [MEMORY[0x263F77D78] sharedCore];
    id v7 = [v6 buildError:v4 underlying:0 description:v5];

    id v8 = [MEMORY[0x263F77DA8] sharedDiag];
    [v8 trackError:@"[PURGE]" forReason:v5 withResult:v4 withError:v7];

    id v9 = 0;
    if (!*(void *)(a1 + 48)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v9 = [v2 assetIds];
  id v10 = [MEMORY[0x263F77DE8] sharedLogger];
  id v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 count];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [v9 count];
    id v15 = @"s";
    *(_DWORD *)buf = 134218754;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    if (v14 == 1) {
      id v15 = &stru_26C1810A0;
    }
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    v27 = v15;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[PURGE] MobileAsset found %ld installed %{public}@ asset%{public}@, assetIDs: %{public}@", buf, 0x2Au);
  }

  if (*(void *)(a1 + 48))
  {
    if (v9 && ![v9 count])
    {

      id v7 = 0;
      id v9 = 0;
    }
    else
    {
      id v7 = 0;
    }
LABEL_14:
    id v16 = [MEMORY[0x263F77D78] sharedCore];
    id v17 = [v16 selectCompletionQueue:*(void *)(a1 + 40)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_320;
    block[3] = &unk_2640DC2C0;
    id v21 = *(id *)(a1 + 48);
    id v9 = v9;
    id v19 = v9;
    id v7 = v7;
    id v20 = v7;
    dispatch_async(v17, block);

    goto LABEL_15;
  }
  id v7 = 0;
LABEL_15:
}

uint64_t __67__SUCorePurge_checkForAssetsOfType_withCompletionQueue_completion___block_invoke_320(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)removeAllUpdateContent:(id)a3
{
}

+ (void)removeAllUpdateContentWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F77D78] sharedCore];
  id v8 = [v7 buildError:8123, 0, @"removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead" underlying description];

  id v9 = [MEMORY[0x263F77DA8] sharedDiag];
  [v9 trackError:@"PURGE", @"removeAllUpdateContent method has been deprecated, use removeAllUpdateContentWithPolicy instead", 8123, v8 forReason withResult withError];

  if (v6)
  {
    id v10 = [MEMORY[0x263F77D78] sharedCore];
    id v11 = [v10 selectCompletionQueue:v5];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke;
    v12[3] = &unk_2640DC4C8;
    id v14 = v6;
    id v13 = v8;
    dispatch_async(v11, v12);
  }
}

uint64_t __68__SUCorePurge_removeAllUpdateContentWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completion:(id)a4
{
}

+ (void)removeAllUpdateContentWithPolicy:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F77D78] beginTransactionWithName:@"purge.RemoveAllUpdateContentWithPolicy"];
  id v11 = [MEMORY[0x263F77D78] sharedCore];
  uint64_t v12 = [v11 waitedOperationQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke;
  v17[3] = &unk_2640DC4A0;
  id v18 = v8;
  id v19 = v10;
  id v20 = v7;
  id v21 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v12, v17);
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__7;
  id v29 = __Block_byref_object_dispose__7;
  id v30 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_327;
  v21[3] = &unk_2640DD838;
  id v24 = a1[7];
  id v22 = a1[4];
  id v23 = a1[5];
  v2 = (void *)MEMORY[0x210550B20](v21);
  +[SUCorePurge _trackPurgeBegin:@"MSUPurgeSuspendedUpdate"];
  uint64_t v3 = SUCoreBorder_MSUPurgeSuspendedUpdate();
  uint64_t v4 = (void *)v26[5];
  v26[5] = v3;

  uint64_t v5 = [(id)v26[5] code];
  +[SUCorePurge _trackPurgeEnd:@"MSUPurgeSuspendedUpdate" withResult:v5 withError:v26[5]];
  id v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1[6] assetTypeSummary];
    *(_DWORD *)buf = 138543362;
    id v32 = v8;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[PURGE] removeAllUpdateContentWithPolicy is using provided policy asset types: %{public}@", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = [a1[6] softwareUpdateAssetType];

  if (v10)
  {
    id v11 = [a1[6] softwareUpdateAssetType];
    [v9 addObject:v11];
  }
  uint64_t v12 = [a1[6] documentationAssetType];

  if (v12)
  {
    id v13 = [a1[6] documentationAssetType];
    [v9 addObject:v13];
  }
  id v14 = [MEMORY[0x263F77DE8] sharedLogger];
  id v15 = [v14 oslog];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v9;
    _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[PURGE] removing all assets with types: %{public}@", buf, 0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:@"MAPurgeAll"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_330;
  v17[3] = &unk_2640DD860;
  id v20 = &v25;
  id v18 = a1[6];
  id v16 = v2;
  id v19 = v16;
  SUCoreBorder_MAPurgeAll(v9, v17);

  _Block_object_dispose(&v25, 8);
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_327(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 48))
  {
    uint64_t v4 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v5 = [v4 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DC2C0;
    id v9 = *(id *)(a1 + 48);
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAllUpdateContentWithPolicy"];
  }
}

uint64_t __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"purge.RemoveAllUpdateContentWithPolicy"];
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_330(uint64_t a1, void *a2)
{
  id v4 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", @"MAPurgeAll", [v4 code], v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, a2);
  }
  int v8 = [*(id *)(a1 + 32) enablePreSUStaging];
  id v9 = [MEMORY[0x263F77DE8] sharedLogger];
  id v10 = [v9 oslog];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[PURGE] PreSUStaging: removing all staged assets", buf, 2u);
    }

    +[SUCorePurge _trackPurgeBegin:@"stagePurgeAll"];
    uint64_t v12 = (void *)MEMORY[0x263F55960];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_332;
    v15[3] = &unk_2640DC3B0;
    long long v14 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v14;
    long long v16 = v14;
    objc_msgSend(v12, "SUCoreBorder_stagePurgeAll:", v15);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[PURGE] PreSUStaging: disabled by policy; nothing to purge",
        buf,
        2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__SUCorePurge_removeAllUpdateContentWithPolicy_completionQueue_completion___block_invoke_332(uint64_t a1, void *a2)
{
  id v7 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", @"stagePurgeAll", [v7 code], v7);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)removeAllAssetsOfType:(id)a3 completion:(id)a4
{
}

+ (void)removeAllAssetsOfType:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  int v8 = (objc_class *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v11, 0);

  [a1 removeAllAssetsOfTypes:v12 withCompletionQueue:v10 completion:v9];
}

+ (void)removeAllAssetsOfTypes:(id)a3 completion:(id)a4
{
}

+ (void)removeAllAssetsOfTypes:(id)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F77D78] beginTransactionWithName:@"purge.RemoveAssetsOfType"];
  id v11 = [MEMORY[0x263F77DE8] sharedLogger];
  id v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[PURGE] removing all assets with types: %{public}@", buf, 0xCu);
  }

  +[SUCorePurge _trackPurgeBegin:@"MAPurgeAll"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke;
  v16[3] = &unk_2640DD838;
  id v18 = v10;
  id v19 = v9;
  id v17 = v8;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  SUCoreBorder_MAPurgeAll(v7, v16);
}

void __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[SUCorePurge _trackPurgeEnd:withResult:withError:](SUCorePurge, "_trackPurgeEnd:withResult:withError:", @"MAPurgeAll", [v3 code], v3);
  if (*(void *)(a1 + 48))
  {
    uint64_t v4 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v5 = [v4 selectCompletionQueue:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_2640DC2C0;
    id v9 = *(id *)(a1 + 48);
    id v7 = v3;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"purge.RemoveAssetsOfType"];
  }
}

uint64_t __69__SUCorePurge_removeAllAssetsOfTypes_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"purge.RemoveAssetsOfType"];
}

+ (void)_trackPurgeBegin:(id)a3
{
}

+ (void)_trackPurgeBegin:(id)a3 withIdentifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F77DA8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDiag];
  [v8 trackBegin:v7 atLevel:1 forModule:@"purge" withIdentifier:v6];
}

+ (void)_trackPurgeEnd:(id)a3
{
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4
{
}

+ (void)_trackPurgeEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

+ (void)_trackPurgeEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x263F77DA8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 sharedDiag];
  [v13 trackEnd:v12 atLevel:1 forModule:@"purge" withIdentifier:v11 withResult:a5 withError:v10];
}

@end