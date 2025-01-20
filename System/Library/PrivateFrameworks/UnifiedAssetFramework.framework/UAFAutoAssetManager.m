@interface UAFAutoAssetManager
+ (BOOL)autoAssetExistsWithEntries:(id)a3;
+ (BOOL)sendNotificationForAssetSet:(id)a3;
+ (BOOL)shouldCheckAssetSet:(id)a3 autoAssetSet:(id)a4 changed:(BOOL)a5 locked:(BOOL *)a6;
+ (BOOL)shouldWaitForMobileAssetStart:(id)a3;
+ (id)_createXPCConnection;
+ (id)assetSetNamesFromUsages:(id)a3 configurationManager:(id)a4;
+ (id)autoAssetSetForStatus:(id)a3;
+ (id)configureAssetSet:(id)a3 specifiers:(id)a4 changed:(BOOL *)a5;
+ (id)forceRemoveAutoAssetSet:(id)a3;
+ (id)getAutoAssetSet:(id)a3 specifiers:(id)a4 addEntries:(BOOL)a5 configured:(BOOL *)a6;
+ (id)getAutoSetEntries:(id)a3 specifiers:(id)a4;
+ (id)getConcurrentQueue;
+ (id)getCurrentSpecifiers:(id)a3 expectedAutoAssetType:(id)a4;
+ (id)getReason:(id)a3 operation:(id)a4;
+ (id)getSerialQueue;
+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4;
+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4 disableExperimentation:(BOOL)a5;
+ (id)latestAtomicInstanceForClients:(id)a3 OSSupported:(BOOL *)a4 error:(id *)a5;
+ (id)latestAtomicInstanceFromMA:(id)a3 error:(id *)a4;
+ (id)latestStatusForClients:(id)a3 error:(id *)a4;
+ (id)lockLatestAssetSet:(id)a3;
+ (id)manageAssetSet:(id)a3 specifiers:(id)a4 lockIfUnchanged:(BOOL)a5 userInitiated:(BOOL)a6;
+ (id)setLatestAtomicInstance:(id)a3 autoAssetSet:(id)a4;
+ (id)sizeInBytesForConfig:(id)a3 key:(id)a4 error:(id *)a5;
+ (id)spaceNeededForAssetSetUsages:(id)a3 key:(id)a4 configurationManager:(id)a5 error:(id *)a6;
+ (id)targetForAssetSet:(id)a3 specifiers:(id)a4 version:(id)a5 autoAssetSets:(id)a6;
+ (int)listenForUpdates:(id)a3 updateHandler:(id)a4;
+ (unint64_t)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4;
+ (unint64_t)getDownloadStatusFromMAAutoAssetSetStatus:(id)a3;
+ (void)_logDailyStatusEventForAssetSetArrived:(id)a3 entries:(id)a4 assetSetArrived:(BOOL)a5;
+ (void)conditionallyLockLatestAssetSet:(id)a3 newestInstance:(id)a4 checkAtomicError:(id)a5 completion:(id)a6;
+ (void)configureAutoAssetsFromAssetSetUsages:(id)a3 subscriptions:(id)a4 configurationManager:(id)a5 lockIfUnchanged:(BOOL)a6 userInitiated:(BOOL)a7;
+ (void)eliminateAssetType:(id)a3;
+ (void)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)invalidateAtomicInstance:(id)a3 assetSetName:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)lockLatestAssetSet:(id)a3 completion:(id)a4;
+ (void)logAtomicInstance:(id)a3 name:(id)a4 entries:(id)a5;
+ (void)observeAllAssetSets;
+ (void)observeAssetSet:(id)a3;
+ (void)observeAssetSetExperimentalNamespace:(id)a3;
+ (void)removeAutoAssetSet:(id)a3 completion:(id)a4;
+ (void)removeUnusedAutoAssetSets:(id)a3 usedAutoAssetSets:(id)a4;
+ (void)stageAssetSet:(id)a3 targets:(id)a4 autoAssetSet:(id)a5;
+ (void)stageAssetsWithSubscriptions:(id)a3 knownAutoAssetSets:(id)a4 usedAutoAssetSets:(id)a5 autoAssetSets:(id)a6;
+ (void)updateAutoAssetsFromAssetSetUsages:(id)a3 configurationManager:(id)a4 expensiveNetworking:(BOOL)a5 progress:(id)a6 requestId:(id)a7 completion:(id)a8;
+ (void)waitForMobileAssetStart:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation UAFAutoAssetManager

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_411(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v1 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworki"
                         "ng:progress:requestId:completion:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    _os_log_debug_impl(&dword_23797A000, v1, OS_LOG_TYPE_DEBUG, "%s Starting new request: %{public}@", buf, 0x16u);
  }

  group = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void (**)(uint64_t, uint64_t))(*((void *)&v52 + 1) + 8 * i);
        v4 = [*(id *)(a1 + 48) getAssetSet:v3];
        v5 = v4;
        if (v4)
        {
          v6 = [v4 autoAssetType];
          BOOL v7 = v6 == 0;

          if (!v7)
          {
            id v8 = objc_alloc(MEMORY[0x263F55980]);
            v9 = [v5 name];
            v10 = +[UAFAutoAssetManager getConcurrentQueue];
            id v51 = 0;
            v11 = (void *)[v8 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v9 comprisedOfEntries:0 completingFromQueue:v10 error:&v51];
            v12 = v51;

            if (v12)
            {
              v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = *(void *)(a1 + 32);
                v15 = [v5 name];
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expen"
                                     "siveNetworking:progress:requestId:completion:]_block_invoke";
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v14;
                *(_WORD *)&buf[22] = 2114;
                v65 = v15;
                LOWORD(v66) = 2114;
                *(void *)((char *)&v66 + 2) = v12;
                _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x2Au);
              }
              goto LABEL_23;
            }
            if (v11)
            {
              v18 = objc_opt_new();
              [v18 setUserInitiated:1];
              [v18 setAllowCheckDownloadOnBattery:1];
              [v18 setAllowCheckDownloadOverCellular:1];
              objc_msgSend(v18, "setAllowCheckDownloadOverExpensive:", objc_msgSend(v5, "enableExpensiveCellular"));
              if (*(unsigned char *)(a1 + 80)) {
                [v18 setAllowCheckDownloadOverExpensive:1];
              }
              dispatch_group_enter(group);
              v49[0] = 0;
              v49[1] = v49;
              v49[2] = 0x2020000000;
              int v50 = 0;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3042000000;
              v65 = __Block_byref_object_copy__7;
              *(void *)&long long v66 = __Block_byref_object_dispose__7;
              *((void *)&v66 + 1) = 0;
              v40[0] = MEMORY[0x263EF8330];
              v40[1] = 3221225472;
              v40[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_412;
              v40[3] = &unk_264CEC478;
              id v41 = *(id *)(a1 + 32);
              id v19 = v11;
              id v42 = v19;
              v47 = v49;
              id v43 = *(id *)(a1 + 56);
              v44 = group;
              v48 = buf;
              v13 = v18;
              v45 = v13;
              id v46 = *(id *)(a1 + 64);
              v20 = (void *)MEMORY[0x237E26D50](v40);
              objc_storeWeak((id *)(*(void *)&buf[8] + 40), v20);
              v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v22 = *(void *)(a1 + 32);
                v23 = [v19 assetSetIdentifier];
                int v24 = [v13 allowCheckDownloadOverExpensive];
                *(_DWORD *)v56 = 136315906;
                v57 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke_2";
                __int16 v58 = 2114;
                uint64_t v59 = v22;
                __int16 v60 = 2114;
                v61 = v23;
                __int16 v62 = 1024;
                int v63 = v24;
                _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Checking %{public}@ with expensive: %d", v56, 0x26u);
              }
              v25 = *(void **)(a1 + 56);
              v26 = [v19 assetSetIdentifier];
              [v25 started:v26];

              v27 = +[UAFAutoAssetManager getReason:v19 operation:@"checking"];
              [v19 checkAtomic:v27 forAtomicInstance:0 awaitingDownload:1 withNeedPolicy:v13 withTimeout:-2 reportingProgress:*(void *)(a1 + 64) completion:v20];

              _Block_object_dispose(buf, 8);
              objc_destroyWeak((id *)&v66 + 1);

              _Block_object_dispose(v49, 8);
LABEL_23:
            }
            goto LABEL_25;
          }
          v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensive"
                                 "Networking:progress:requestId:completion:]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 2114;
            v65 = v3;
            _os_log_debug_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEBUG, "%s %{public}@: No auto asset type defined for %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensive"
                                 "Networking:progress:requestId:completion:]_block_invoke";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v16;
            *(_WORD *)&buf[22] = 2114;
            v65 = v3;
            _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not get configuration for asset set %{public}@", buf, 0x20u);
          }
        }
LABEL_25:
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
    }
    while (v33);
  }

  v28 = +[UAFAutoAssetManager getConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_423;
  block[3] = &unk_264CEBFB8;
  id v36 = *(id *)(a1 + 56);
  id v37 = *(id *)(a1 + 32);
  id v38 = *(id *)(a1 + 40);
  id v39 = *(id *)(a1 + 72);
  dispatch_group_notify(group, v28, block);
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_17 != -1) {
    dispatch_once(&_MergedGlobals_17, &__block_literal_global_19);
  }
  v2 = (void *)qword_26AF0BB38;

  return v2;
}

+ (void)updateAutoAssetsFromAssetSetUsages:(id)a3 configurationManager:(id)a4 expensiveNetworking:(BOOL)a5 progress:(id)a6 requestId:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (!v14)
  {
    id v14 = +[UAFConfigurationManager defaultManager];
  }
  v18 = [[UAFAutoAssetProgress alloc] initWithAssetSetUsages:v13 configurationManager:v14 detailedProgressWithStatus:v15];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke;
  v37[3] = &unk_264CEC428;
  id v19 = v16;
  id v38 = v19;
  v20 = v18;
  id v39 = v20;
  v21 = (void *)MEMORY[0x237E26D50](v37);
  uint64_t v22 = +[UAFAutoAssetManager getConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_411;
  block[3] = &unk_264CEC4A0;
  id v30 = v19;
  id v31 = v13;
  BOOL v36 = a5;
  id v32 = v14;
  uint64_t v33 = v20;
  id v34 = v21;
  id v35 = v17;
  id v23 = v17;
  id v24 = v21;
  v25 = v20;
  id v26 = v14;
  id v27 = v13;
  id v28 = v19;
  dispatch_async(v22, block);
}

+ (id)getReason:(id)a3 operation:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 autoAssetSetClientName];
  v9 = [v7 clientDomainName];
  v10 = [v7 assetSetIdentifier];

  v11 = [v5 stringWithFormat:@"%@ in %@ %@ %@", v8, v9, v6, v10];

  return v11;
}

void __41__UAFAutoAssetManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAutoAssetManager.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0BB38;
  qword_26AF0BB38 = (uint64_t)v0;
}

+ (id)getSerialQueue
{
  if (qword_26AF0BB40 != -1) {
    dispatch_once(&qword_26AF0BB40, &__block_literal_global_316);
  }
  v2 = (void *)qword_26AF0BB48;

  return v2;
}

void __37__UAFAutoAssetManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAutoAssetManager.Serial", 0);
  v1 = (void *)qword_26AF0BB48;
  qword_26AF0BB48 = (uint64_t)v0;
}

+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4
{
  return (id)[a1 getSpecifiers:a3 assetSetUsages:a4 disableExperimentation:0];
}

+ (id)getSpecifiers:(id)a3 assetSetUsages:(id)a4 disableExperimentation:(BOOL)a5
{
  BOOL v48 = a5;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v9 = [v6 name];
  v49 = v7;
  v10 = [v7 objectForKeyedSubscript:v9];

  id obj = v10;
  uint64_t v52 = [v10 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v61 != v51) {
          objc_enumerationMutation(obj);
        }
        id v12 = v6;
        id v13 = [v6 getAutoAssets:*(void *)(*((void *)&v60 + 1) + 8 * i)];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v57 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * j)];
              id v19 = [v18 objectForKeyedSubscript:@"AssetSpecifier"];
              [v8 addObject:v19];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v15);
        }

        id v6 = v12;
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    }
    while (v52);
  }

  v20 = [v6 experimentalAssets];

  if (!v20)
  {
    v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v6 name];
      *(_DWORD *)buf = 136315394;
      v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
      __int16 v66 = 2114;
      v67 = v22;
      id v23 = "%s No experimental assets for asset set %{public}@";
      goto LABEL_21;
    }
LABEL_22:

    id v24 = v8;
    goto LABEL_37;
  }
  if (v48)
  {
    v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v6 name];
      *(_DWORD *)buf = 136315394;
      v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
      __int16 v66 = 2114;
      v67 = v22;
      id v23 = "%s Experimentation not enabled for asset set %{public}@";
LABEL_21:
      _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v25 = [v6 experimentalAssets];
  id v26 = [v25 trialProject];
  id v27 = +[UAFCommonUtilities trialClientWithProject:v26];

  if (v27)
  {
    id v28 = [v6 experimentalAssets];
    uint64_t v29 = [v28 trialNamespace];
    id v30 = [v6 experimentalAssets];
    id v31 = [v30 trialFactor];
    id v32 = +[UAFCommonUtilities getDirectoryPath:v27 trialNamespace:v29 trialFactor:v31];

    if (v32)
    {
      uint64_t v33 = [NSString stringWithFormat:@"%@/%@", v32, @"experiment.plist"];
      id v34 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v33];
      if (([v34 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        id v35 = (void *)[objc_alloc(NSURL) initWithString:v32];

        id v34 = [v35 URLByAppendingPathComponent:@"experiment.plist"];
      }
      BOOL v36 = v6;
      id v55 = 0;
      id v37 = +[UAFAssetSetExperimentConfiguration fromContentsOfURL:v34 error:&v55];
      id v38 = v55;
      if (v38)
      {
        id v39 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v47 = [v36 name];
          *(_DWORD *)buf = 136315394;
          v65 = "+[UAFAutoAssetManager getSpecifiers:assetSetUsages:disableExperimentation:]";
          __int16 v66 = 2114;
          v67 = v47;
          _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Unexpected experiment file content for Asset Set %{public}@", buf, 0x16u);
        }
        id v40 = v8;
      }
      else
      {
        id v43 = [v37 assetSpecifiers];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __75__UAFAutoAssetManager_getSpecifiers_assetSetUsages_disableExperimentation___block_invoke;
        v53[3] = &unk_264CEB780;
        id v44 = v8;
        id v54 = v44;
        [v43 enumerateKeysAndObjectsUsingBlock:v53];

        id v45 = v44;
      }

      id v6 = v36;
    }
    else
    {
      id v42 = v8;
    }
  }
  else
  {
    id v41 = v8;
  }

LABEL_37:

  return v8;
}

void __75__UAFAutoAssetManager_getSpecifiers_assetSetUsages_disableExperimentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

+ (id)getCurrentSpecifiers:(id)a3 expectedAutoAssetType:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v27 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = v5;
  id v7 = [v5 configuredAssetEntries];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v29;
    *(void *)&long long v9 = 136315906;
    long long v24 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "assetSelector", v24);
        uint64_t v15 = [v14 assetType];
        char v16 = [v15 isEqualToString:v6];

        if (v16)
        {
          id v17 = [v13 assetSelector];
          v18 = [v17 assetSpecifier];
          [v27 addObject:v18];
        }
        else
        {
          id v17 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v26 = [v13 assetSelector];
            id v19 = [v26 assetType];
            v20 = [v13 assetSelector];
            v21 = [v20 assetSpecifier];
            uint64_t v22 = [v25 assetSetIdentifier];
            *(_DWORD *)buf = v24;
            uint64_t v33 = "+[UAFAutoAssetManager getCurrentSpecifiers:expectedAutoAssetType:]";
            __int16 v34 = 2114;
            id v35 = v19;
            __int16 v36 = 2114;
            id v37 = v21;
            __int16 v38 = 2114;
            id v39 = v22;
            _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Unexpected auto asset type %{public}@ with specifier %{public}@ in auto asset set %{public}@", buf, 0x2Au);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v10);
  }

  return v27;
}

+ (id)getAutoSetEntries:(id)a3 specifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v5 autoAssetType];
        BOOL v14 = +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:v13 autoAssetSpecifier:v12];

        id v15 = objc_alloc(MEMORY[0x263F55988]);
        char v16 = [v5 autoAssetType];
        id v17 = (void *)[v15 initForAssetType:v16 withAssetSpecifier:v12 assetLockedInhibitsRemoval:v14];

        [v7 addObject:v17];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)getAutoAssetSet:(id)a3 specifiers:(id)a4 addEntries:(BOOL)a5 configured:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  *a6 = 0;
  if (v7)
  {
    uint64_t v11 = +[UAFAutoAssetManager getAutoSetEntries:v9 specifiers:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = objc_alloc(MEMORY[0x263F55980]);
  id v13 = [v9 name];
  BOOL v14 = +[UAFAutoAssetManager getConcurrentQueue];
  id v107 = 0;
  id v15 = (void *)[v12 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v13 comprisedOfEntries:v11 completingFromQueue:v14 error:&v107];
  char v16 = (__CFString *)v107;

  if (v16)
  {
    id v17 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [v9 name];
      id v44 = v15;
      id v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
      __int16 v112 = 2114;
      v113 = v45;
      __int16 v114 = 2114;
      v115 = v16;
      _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);

      id v15 = v44;
    }

    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    id v18 = 0;
    goto LABEL_9;
  }
  if (v7)
  {
    *a6 = 1;
    long long v20 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v15 assetSetIdentifier];
      long long v21 = v15;
      long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      long long v23 = [v10 allObjects];
      *(_DWORD *)buf = 136315650;
      v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
      __int16 v112 = 2114;
      v113 = v22;
      __int16 v114 = 2114;
      v115 = v23;
      _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ created with specifiers %{public}@", buf, 0x20u);

      id v15 = v21;
    }

    id v18 = v15;
  }
  else
  {
    id v106 = 0;
    long long v24 = [v15 currentSetStatusSync:&v106];
    uint64_t v25 = (__CFString *)v106;
    id v26 = v25;
    if (!v24 || v25)
    {
      uint64_t v33 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        [v15 assetSetIdentifier];
        v80 = v15;
        v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
        __int16 v112 = 2114;
        v113 = v81;
        __int16 v114 = 2114;
        v115 = v26;
        _os_log_error_impl(&dword_23797A000, v33, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);

        id v15 = v80;
      }

      id v18 = 0;
    }
    else
    {
      v93 = v15;
      uint64_t v27 = [v24 schedulerPolicy];
      if (v27
        && (long long v28 = (void *)v27,
            [v24 schedulerPolicy],
            long long v29 = objc_claimAutoreleasedReturnValue(),
            int v30 = [v29 blockCheckDownload],
            v29,
            v28,
            v30))
      {
        long long v31 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v93 assetSetIdentifier];
          *(_DWORD *)buf = 136315394;
          v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
          __int16 v112 = 2114;
          v113 = v32;
          _os_log_impl(&dword_23797A000, v31, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ currently has downloads blocked", buf, 0x16u);
        }
        id v15 = v93;
        id v18 = v93;
        id v26 = 0;
      }
      else
      {
        __int16 v34 = [v9 autoAssetType];
        v87 = v24;
        id v35 = +[UAFAutoAssetManager getCurrentSpecifiers:v24 expectedAutoAssetType:v34];

        __int16 v36 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v82 = [v93 assetSetIdentifier];
          v83 = [v35 allObjects];
          *(_DWORD *)buf = 136315650;
          v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
          __int16 v112 = 2114;
          v113 = v82;
          __int16 v114 = 2114;
          v115 = v83;
          _os_log_debug_impl(&dword_23797A000, v36, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ has specifiers %{public}@", buf, 0x20u);
        }
        v92 = v11;
        id v15 = v93;
        if ([v35 isEqualToSet:v10])
        {
          id v84 = v9;
          *a6 = 1;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id obj = [v87 configuredAssetEntries];
          uint64_t v90 = [obj countByEnumeratingWithState:&v102 objects:v122 count:16];
          if (v90)
          {
            uint64_t v89 = *(void *)v103;
            id v85 = v10;
            while (2)
            {
              for (uint64_t i = 0; i != v90; ++i)
              {
                if (*(void *)v103 != v89) {
                  objc_enumerationMutation(obj);
                }
                __int16 v38 = *(void **)(*((void *)&v102 + 1) + 8 * i);
                id v39 = [v38 assetSelector];
                id v40 = [v39 assetType];
                uint64_t v41 = [v38 assetSelector];
                id v42 = [v41 assetSpecifier];
                int v43 = +[UAFAssetSetManager cacheDeleteDisabledForAutoAssetType:v40 autoAssetSpecifier:v42];

                if (v43 != [v38 assetLockedInhibitsRemoval])
                {
                  id v46 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
                  id v15 = v93;
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    if ([v38 assetLockedInhibitsRemoval]) {
                      v47 = @"YES";
                    }
                    else {
                      v47 = @"NO";
                    }
                    if (v43) {
                      BOOL v48 = @"YES";
                    }
                    else {
                      BOOL v48 = @"NO";
                    }
                    v91 = [v38 assetSelector];
                    v49 = [v91 assetType];
                    int v50 = [v38 assetSelector];
                    uint64_t v51 = [v50 assetSpecifier];
                    uint64_t v52 = [v93 assetSetIdentifier];
                    *(_DWORD *)buf = 136316418;
                    v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
                    __int16 v112 = 2114;
                    v113 = v47;
                    __int16 v114 = 2114;
                    v115 = v48;
                    __int16 v116 = 2114;
                    v117 = v49;
                    __int16 v118 = 2114;
                    v119 = v51;
                    __int16 v120 = 2114;
                    v121 = v52;
                    _os_log_impl(&dword_23797A000, v46, OS_LOG_TYPE_DEFAULT, "%s assetLockedInhibitsRemoval value %{public}@ doesn't match desired value %{public}@ for asset type %{public}@ and specifier %{public}@ in asset set %{public}@", buf, 0x3Eu);

                    id v15 = v93;
                  }

                  *a6 = 0;
                  id v10 = v85;
                  uint64_t v11 = v92;
                  goto LABEL_48;
                }
                uint64_t v11 = v92;
                id v15 = v93;
              }
              id v10 = v85;
              uint64_t v90 = [obj countByEnumeratingWithState:&v102 objects:v122 count:16];
              if (v90) {
                continue;
              }
              break;
            }
          }
LABEL_48:

          id v9 = v84;
        }
        BOOL v53 = *a6;
        id v54 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          if (v55)
          {
            long long v56 = [v15 assetSetIdentifier];
            long long v57 = [v10 allObjects];
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            __int16 v112 = 2114;
            v113 = v56;
            __int16 v114 = 2114;
            v115 = v57;
            _os_log_impl(&dword_23797A000, v54, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has expected specifiers %{public}@", buf, 0x20u);

            id v15 = v93;
          }
        }
        else
        {
          if (v55)
          {
            long long v58 = [v93 assetSetIdentifier];
            long long v59 = [v10 allObjects];
            long long v60 = [v35 allObjects];
            *(_DWORD *)buf = 136315906;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            __int16 v112 = 2114;
            v113 = v58;
            __int16 v114 = 2114;
            v115 = v59;
            __int16 v116 = 2114;
            v117 = v60;
            _os_log_impl(&dword_23797A000, v54, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ does not have expected specifiers %{public}@, has %{public}@", buf, 0x2Au);
          }
          id v54 = [MEMORY[0x263EFF9C0] set];
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v61 = v10;
          uint64_t v62 = [v61 countByEnumeratingWithState:&v98 objects:v109 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v99;
            do
            {
              for (uint64_t j = 0; j != v63; ++j)
              {
                if (*(void *)v99 != v64) {
                  objc_enumerationMutation(v61);
                }
                uint64_t v66 = *(void *)(*((void *)&v98 + 1) + 8 * j);
                if (([v35 containsObject:v66] & 1) == 0) {
                  [v54 addObject:v66];
                }
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v98 objects:v109 count:16];
            }
            while (v63);
          }
          id v86 = v10;

          v67 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v68 = [v93 assetSetIdentifier];
            v69 = [v54 allObjects];
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            __int16 v112 = 2114;
            v113 = v68;
            __int16 v114 = 2114;
            v115 = v69;
            _os_log_impl(&dword_23797A000, v67, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ missing specifiers: %{public}@", buf, 0x20u);
          }
          uint64_t v70 = [MEMORY[0x263EFF9C0] set];
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v71 = v35;
          uint64_t v72 = [v71 countByEnumeratingWithState:&v94 objects:v108 count:16];
          if (v72)
          {
            uint64_t v73 = v72;
            uint64_t v74 = *(void *)v95;
            do
            {
              for (uint64_t k = 0; k != v73; ++k)
              {
                if (*(void *)v95 != v74) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v76 = *(void *)(*((void *)&v94 + 1) + 8 * k);
                if (([v61 containsObject:v76] & 1) == 0) {
                  [v70 addObject:v76];
                }
              }
              uint64_t v73 = [v71 countByEnumeratingWithState:&v94 objects:v108 count:16];
            }
            while (v73);
          }

          v77 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            v78 = [v93 assetSetIdentifier];
            v79 = [v70 allObjects];
            *(_DWORD *)buf = 136315650;
            v111 = "+[UAFAutoAssetManager getAutoAssetSet:specifiers:addEntries:configured:]";
            __int16 v112 = 2114;
            v113 = v78;
            __int16 v114 = 2114;
            v115 = v79;
            _os_log_impl(&dword_23797A000, v77, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ extra specifiers: %{public}@", buf, 0x20u);
          }
          id v10 = v86;
          uint64_t v11 = v92;
          id v15 = v93;
        }
        id v26 = 0;

        id v18 = v15;
        long long v24 = v87;
      }
    }
  }
LABEL_9:

  return v18;
}

+ (id)configureAssetSet:(id)a3 specifiers:(id)a4 changed:(BOOL *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  *a5 = 0;
  char v44 = 0;
  id v9 = +[UAFAutoAssetManager getAutoAssetSet:v7 specifiers:v8 addEntries:0 configured:&v44];
  if (v9) {
    BOOL v10 = v44 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    [v11 setAllowCheckDownloadOverCellular:1];
    objc_msgSend(v11, "setAllowCheckDownloadOverExpensive:", objc_msgSend(v7, "enableExpensiveCellular"));
    if (v9)
    {
      id v12 = +[UAFAutoAssetManager getAutoSetEntries:v7 specifiers:v8];
      id v13 = NSString;
      BOOL v14 = [v7 name];
      id v15 = [v13 stringWithFormat:@"Update to %@", v14];
      char v16 = [v9 alterEntriesRepresentingAtomicSync:v15 toBeComprisedOfEntries:v12 withNeedPolicy:v11];

      id v17 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      id v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v37 = [v7 name];
          __int16 v38 = [v7 autoAssetType];
          id v39 = [v8 allObjects];
          *(_DWORD *)buf = 136316162;
          id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          __int16 v47 = 2114;
          BOOL v48 = v37;
          __int16 v49 = 2114;
          int v50 = v38;
          __int16 v51 = 2114;
          *(void *)uint64_t v52 = v39;
          *(_WORD *)&v52[8] = 2114;
          *(void *)&v52[10] = v16;
          _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Could not alter auto asset set %{public}@ with type %{public}@ specifiers %{public}@: %{public}@", buf, 0x34u);
        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v7 name];
          [v7 autoAssetType];
          v26 = int v43 = v12;
          int v42 = [v7 enableExpensiveCellular];
          uint64_t v27 = [v8 allObjects];
          *(_DWORD *)buf = 136316162;
          id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          __int16 v47 = 2114;
          BOOL v48 = v25;
          __int16 v49 = 2114;
          int v50 = v26;
          __int16 v51 = 1024;
          *(_DWORD *)uint64_t v52 = v42;
          *(_WORD *)&v52[4] = 2114;
          *(void *)&v52[6] = v27;
          _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s Altered auto asset set %{public}@ with type %{public}@ with expensive cellular: %d and specifiers %{public}@", buf, 0x30u);

          id v12 = v43;
        }

        long long v28 = +[UAFAutoAssetManager getReason:v9 operation:@"does need"];
        long long v29 = [v9 needForAtomicSync:v28 withNeedPolicy:v11];

        if (!v29)
        {
          *a5 = 1;
          +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:v9 entries:v12 isEliminating:0 reason:@"altered"];
          id v21 = v9;
          goto LABEL_26;
        }
        int v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = [v7 name];
          *(_DWORD *)buf = 136315650;
          id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          __int16 v47 = 2114;
          BOOL v48 = v41;
          __int16 v49 = 2114;
          int v50 = v29;
          _os_log_error_impl(&dword_23797A000, v30, OS_LOG_TYPE_ERROR, "%s Could not indicate need for newly created asset set %{public}@ : %{public}@", buf, 0x20u);
        }
      }
      id v21 = 0;
LABEL_26:

LABEL_32:
      goto LABEL_33;
    }
    id v9 = +[UAFAutoAssetManager getAutoAssetSet:v7 specifiers:v8 addEntries:1 configured:&v44];
    if (v44)
    {
      long long v22 = +[UAFAutoAssetManager getReason:v9 operation:@"does need"];
      long long v23 = [v9 needForAtomicSync:v22 withNeedPolicy:v11];

      if (!v23)
      {
        *a5 = 1;
        long long v31 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v7 name];
          int v33 = [v11 allowCheckDownloadOverExpensive];
          *(_DWORD *)buf = 136315650;
          id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
          __int16 v47 = 2114;
          BOOL v48 = v32;
          __int16 v49 = 1024;
          LODWORD(v50) = v33;
          _os_log_impl(&dword_23797A000, v31, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ newly created with expensive cellular policy: %d", buf, 0x1Cu);
        }
        __int16 v34 = [v9 autoAssetEntries];
        +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:v9 entries:v34 isEliminating:0 reason:@"created"];

        id v9 = v9;
        id v21 = v9;
        goto LABEL_32;
      }
      long long v24 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v40 = [v7 name];
        *(_DWORD *)buf = 136315650;
        id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
        __int16 v47 = 2114;
        BOOL v48 = v40;
        __int16 v49 = 2114;
        int v50 = v23;
        _os_log_error_impl(&dword_23797A000, v24, OS_LOG_TYPE_ERROR, "%s Could not indicate need for newly created asset set %{public}@ : %{public}@", buf, 0x20u);
      }
    }
    else
    {
      long long v23 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      long long v24 = [v7 name];
      *(_DWORD *)buf = 136315394;
      id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
      __int16 v47 = 2114;
      BOOL v48 = v24;
      _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s Auto asset set %{public}@ could not be created", buf, 0x16u);
    }

LABEL_28:
    id v21 = 0;
    goto LABEL_32;
  }
  id v19 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = [v7 name];
    *(_DWORD *)buf = 136315394;
    id v46 = "+[UAFAutoAssetManager configureAssetSet:specifiers:changed:]";
    __int16 v47 = 2114;
    BOOL v48 = v36;
    _os_log_debug_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ already defined and properly configured", buf, 0x16u);
  }
  id v9 = v9;
  id v21 = v9;
LABEL_33:

  return v21;
}

+ (void)eliminateAssetType:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[UAFConfigurationManager defaultManager];
  id v5 = [v3 assetSetIdentifier];
  id v6 = [v4 getAssetSet:v5];

  if (v6)
  {
    id v7 = [v6 autoAssetType];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x263F55960];
      id v9 = [v6 autoAssetType];
      BOOL v10 = [v8 eliminateAllForAssetTypeSync:v9];

      uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      id v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v13 = [v6 autoAssetType];
          BOOL v14 = [v3 assetSetIdentifier];
          int v15 = 136315906;
          char v16 = "+[UAFAutoAssetManager eliminateAssetType:]";
          __int16 v17 = 2114;
          id v18 = v13;
          __int16 v19 = 2114;
          long long v20 = v14;
          __int16 v21 = 2114;
          long long v22 = v10;
          _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to eliminate auto asset type %{public}@ of auto asset set %{public}@: %{public}@", (uint8_t *)&v15, 0x2Au);
LABEL_10:
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 autoAssetType];
        BOOL v14 = [v3 assetSetIdentifier];
        int v15 = 136315650;
        char v16 = "+[UAFAutoAssetManager eliminateAssetType:]";
        __int16 v17 = 2114;
        id v18 = v13;
        __int16 v19 = 2114;
        long long v20 = v14;
        _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Eliminated auto asset type %{public}@ for auto asset set %{public}@", (uint8_t *)&v15, 0x20u);
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
  }
  BOOL v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v12 = [v3 assetSetIdentifier];
    int v15 = 136315394;
    char v16 = "+[UAFAutoAssetManager eliminateAssetType:]";
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Could not get auto asset type of auto asset set %{public}@: no config file found", (uint8_t *)&v15, 0x16u);
    goto LABEL_11;
  }
LABEL_12:
}

+ (void)invalidateAtomicInstance:(id)a3 assetSetName:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (!v11)
  {
    id v11 = +[UAFAutoAssetManager getConcurrentQueue];
  }
  id v28 = 0;
  id v13 = +[UAFAutoAssetManager latestStatusForClients:v10 error:&v28];
  id v14 = v28;
  if (v14)
  {
    id v15 = v14;
    char v16 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v32 = "+[UAFAutoAssetManager invalidateAtomicInstance:assetSetName:queue:completion:]";
      __int16 v33 = 2114;
      id v34 = v10;
      __int16 v35 = 2114;
      id v36 = v15;
      _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s Could not get short term status for asset set %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_7;
  }
  if (v13)
  {
    __int16 v17 = [v13 latestDownloadedAtomicInstance];
    int v18 = [v17 isEqualToString:v9];

    if (v18)
    {
      __int16 v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08338];
      int v30 = @"Cannot invalidate latest atomic instance";
      long long v20 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v15 = [v19 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v20];

LABEL_7:
      v12[2](v12, v15);
      goto LABEL_17;
    }
  }
  id v27 = 0;
  __int16 v21 = (void *)[objc_alloc(MEMORY[0x263F55980]) initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v10 comprisedOfEntries:0 completingFromQueue:v11 error:&v27];
  id v15 = v27;
  if (v15)
  {
    long long v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v32 = "+[UAFAutoAssetManager invalidateAtomicInstance:assetSetName:queue:completion:]";
      __int16 v33 = 2114;
      id v34 = v10;
      __int16 v35 = 2114;
      id v36 = v15;
      _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s Could not construct auto asset set %{public}@: %{public}@", buf, 0x20u);
    }

    v12[2](v12, v15);
  }
  else
  {
    uint64_t v23 = +[UAFAutoAssetManager getReason:v21 operation:@"locking latest version of"];
    long long v24 = (void *)MEMORY[0x263F55980];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__UAFAutoAssetManager_invalidateAtomicInstance_assetSetName_queue_completion___block_invoke;
    v25[3] = &unk_264CEB088;
    id v26 = v12;
    [v24 endAtomicLocks:v23 usingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v10 ofAtomicInstance:v9 removingLockCount:-1 completion:v25];
  }
LABEL_17:
}

uint64_t __78__UAFAutoAssetManager_invalidateAtomicInstance_assetSetName_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)setLatestAtomicInstance:(id)a3 autoAssetSet:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v5 = a4;
  id v6 = +[UAFAutoAssetManager getSerialQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = +[UAFAutoAssetManager getReason:v5 operation:@"locking latest version of"];
  id v73 = 0;
  long long v56 = v5;
  id v8 = [v5 currentSetStatusSync:&v73];
  id v9 = v73;
  id v10 = v9;
  long long v58 = v8;
  if (v8 && !v9)
  {
    group = dispatch_group_create();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v11 = [v8 currentLockUsage];
    id v12 = [v11 objectForKeyedSubscript:v7];

    id obj = v12;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v69 objects:v84 count:16];
    if (!v13) {
      goto LABEL_14;
    }
    uint64_t v14 = v13;
    uint64_t v57 = *(void *)v70;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v70 != v57) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        __int16 v17 = [v58 currentLockUsage];
        int v18 = [v17 objectForKeyedSubscript:v7];
        [v18 objectForKeyedSubscript:v16];
        v20 = __int16 v19 = v7;
        uint64_t v21 = [v20 integerValue];

        if ([v16 isEqualToString:v59])
        {
          id v7 = v19;
          if (v21 < 2) {
            continue;
          }
          --v21;
        }
        dispatch_group_enter(group);
        long long v22 = (void *)MEMORY[0x263F55980];
        uint64_t v23 = [v56 assetSetIdentifier];
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke;
        v63[3] = &unk_264CEC338;
        uint64_t v64 = group;
        v65 = v16;
        id v66 = v56;
        id v67 = v19;
        uint64_t v68 = v21;
        [v22 endAtomicLocks:v67 usingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v23 ofAtomicInstance:v16 removingLockCount:v21 completion:v63];

        id v7 = v19;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v84 count:16];
      if (!v14)
      {
LABEL_14:

        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        long long v24 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          int v42 = [v56 assetSetIdentifier];
          *(_DWORD *)buf = 136315906;
          v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
          __int16 v78 = 2114;
          id v79 = v59;
          __int16 v80 = 2114;
          id v81 = v42;
          __int16 v82 = 2114;
          v83 = v7;
          _os_log_debug_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEBUG, "%s Updated locks to reflect latest atomic instance of %{public}@ for auto asset set %{public}@ with reason \"%{public}@\"", buf, 0x2Au);
        }
        if (v59)
        {
          id v25 = 0;
          id v10 = 0;
        }
        else
        {
          id v62 = 0;
          id v27 = [v56 currentSetStatusSync:&v62];
          id v28 = v62;
          id v10 = 0;
          if (v28)
          {
            uint64_t v29 = v28;
            int v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v52 = [v56 assetSetIdentifier];
              *(_DWORD *)buf = 136315650;
              v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
              __int16 v78 = 2114;
              id v79 = v52;
              __int16 v80 = 2114;
              id v81 = v29;
              _os_log_error_impl(&dword_23797A000, v30, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);
            }
            id v25 = v29;
            long long v31 = v27;
            id v27 = v25;
          }
          else
          {
            id v32 = [v27 currentLockUsage];
            uint64_t v33 = [v32 count];

            if (v33)
            {
              id v34 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v35 = [v56 assetSetIdentifier];
                *(_DWORD *)buf = 136315394;
                v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                __int16 v78 = 2114;
                id v79 = v35;
                _os_log_impl(&dword_23797A000, v34, OS_LOG_TYPE_DEFAULT, "%s Could not eliminate unneeded auto asset %{public}@ as there are current locks", buf, 0x16u);
              }
              id v36 = [v27 currentLockUsage];
              v60[0] = MEMORY[0x263EF8330];
              v60[1] = 3221225472;
              v60[2] = __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke_353;
              v60[3] = &unk_264CEC360;
              id v61 = v56;
              [v36 enumerateKeysAndObjectsUsingBlock:v60];

              uint64_t v37 = (void *)MEMORY[0x263F087E8];
              uint64_t v38 = *MEMORY[0x263F08320];
              v74[0] = *MEMORY[0x263F08338];
              v74[1] = v38;
              v75[0] = @"Could not eliminate as there are current locks";
              v75[1] = @"Could not eliminate as there are current locks";
              v74[2] = @"currentLockUsage";
              id v39 = [v27 currentLockUsage];
              v75[2] = v39;
              id v40 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
              uint64_t v41 = [v37 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v40];

              id v25 = v41;
              long long v31 = v27;
              id v27 = v25;
            }
            else
            {
              long long v31 = +[UAFAutoAssetManager getReason:v56 operation:@"should eliminate"];
              char v44 = (void *)MEMORY[0x263F55980];
              id v45 = [v56 assetSetIdentifier];
              id v25 = [v44 eliminateAtomicSync:v31 usingClientDomain:@"com.apple.UnifiedAssetFramework" forAssetSetIdentifier:v45 awaitingUnlocked:1];

              id v46 = [v56 autoAssetEntries];
              +[UAFAutoAssetHistory persistAssetSetInfoConfiguring:v56 entries:v46 isEliminating:1 reason:@"eliminated"];

              +[UAFAutoAssetHistory persistAssetSetInfoLocked:0 atomicEntries:0 autoAssetSet:v56 isEliminating:1 reason:@"eliminated"];
              __int16 v47 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              BOOL v48 = v47;
              if (v25)
              {
                id v10 = 0;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v53 = [v56 assetSetIdentifier];
                  *(_DWORD *)buf = 136315650;
                  v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                  __int16 v78 = 2114;
                  id v79 = v53;
                  __int16 v80 = 2114;
                  id v81 = v25;
                  _os_log_error_impl(&dword_23797A000, v48, OS_LOG_TYPE_ERROR, "%s Could not eliminate unneeded auto asset %{public}@ : %{public}@", buf, 0x20u);
                }
              }
              else
              {
                id v10 = 0;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v49 = [v56 assetSetIdentifier];
                  *(_DWORD *)buf = 136315394;
                  v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
                  __int16 v78 = 2114;
                  id v79 = v49;
                  _os_log_impl(&dword_23797A000, v48, OS_LOG_TYPE_DEFAULT, "%s Eliminated unneeded auto asset %{public}@", buf, 0x16u);
                }
                int v50 = [v56 assetSetIdentifier];
                +[UAFAssetSetObserver sendUAFNotificationForAssetSet:v50 forRoot:0];

                id v25 = 0;
                long long v31 = v27;
                id v27 = 0;
              }
            }
          }
        }
        goto LABEL_38;
      }
    }
  }
  id v26 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v43 = [v5 assetSetIdentifier];
    *(_DWORD *)buf = 136315650;
    v77 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]";
    __int16 v78 = 2114;
    id v79 = v43;
    __int16 v80 = 2114;
    id v81 = v10;
    _os_log_error_impl(&dword_23797A000, v26, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", buf, 0x20u);
  }
  id v25 = v10;
LABEL_38:

  return v25;
}

void __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) assetSetIdentifier];
      uint64_t v9 = *(void *)(a1 + 56);
      int v13 = 136316162;
      uint64_t v14 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      int v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Could not decrement locks for atomic instance %{public}@ in auto asset set %{public}@ with reason %{public}@: %{public}@", (uint8_t *)&v13, 0x34u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) assetSetIdentifier];
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(void **)(a1 + 64);
    int v13 = 136316162;
    uint64_t v14 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    int v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    id v22 = v12;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Decrement locks for atomic instance %{public}@ in auto asset set %{public}@ with reason %{public}@ lockCount: %ld", (uint8_t *)&v13, 0x34u);
    goto LABEL_6;
  }
}

void __60__UAFAutoAssetManager_setLatestAtomicInstance_autoAssetSet___block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) assetSetIdentifier];
    int v9 = 136315906;
    uint64_t v10 = "+[UAFAutoAssetManager setLatestAtomicInstance:autoAssetSet:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ Lock reason: %@, locks: %@", (uint8_t *)&v9, 0x2Au);
  }
}

+ (void)logAtomicInstance:(id)a3 name:(id)a4 entries:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[UAFAutoAssetManager getConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UAFAutoAssetManager_logAtomicInstance_name_entries___block_invoke;
  block[3] = &unk_264CEB638;
  id v15 = v9;
  id v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(v10, block);
}

void __54__UAFAutoAssetManager_logAtomicInstance_name_entries___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    id v6 = &stru_26EA999B8;
    do
    {
      uint64_t v7 = 0;
      id v8 = v6;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) summary];
        id v6 = [(__CFString *)v8 stringByAppendingFormat:@"%@\n", v9];

        ++v7;
        id v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    id v6 = &stru_26EA999B8;
  }

  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextLargeMessage);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    int v18 = "+[UAFAutoAssetManager logAtomicInstance:name:entries:]_block_invoke";
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    long long v24 = v6;
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Asset set %{public}@ atomic instance %{public}@ contains:\n%{public}@", buf, 0x2Au);
  }
}

+ (void)lockLatestAssetSet:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[UAFAutoAssetManager getSerialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke;
  v10[3] = &unk_264CEB0B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke(uint64_t a1)
{
  id v2 = +[UAFAutoAssetManager lockLatestAssetSet:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = +[UAFAutoAssetManager getConcurrentQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke_2;
    v4[3] = &unk_264CEB4D0;
    id v6 = *(id *)(a1 + 40);
    id v5 = v2;
    dispatch_async(v3, v4);
  }
}

uint64_t __53__UAFAutoAssetManager_lockLatestAssetSet_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)lockLatestAssetSet:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[UAFAutoAssetManager getReason:v3 operation:@"locking latest version of"];
  id v5 = objc_opt_new();
  [v5 setSupportingShortTermLocks:1];
  id v6 = [v3 assetSetIdentifier];
  id v37 = 0;
  uint64_t v7 = +[UAFAutoAssetManager latestStatusForClients:v6 error:&v37];
  id v26 = v37;

  if (v7)
  {
    id v8 = [v7 latestDownloadedAtomicInstance];
  }
  else
  {
    id v8 = 0;
  }
  id v35 = 0;
  id v36 = 0;
  id v9 = [v3 lockAtomicSync:v4 forAtomicInstance:0 withNeedPolicy:v5 withTimeout:0 lockedAtomicEntries:&v36 error:&v35];
  id v10 = v36;
  id v11 = v35;
  id v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  long long v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [v3 assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      id v39 = "+[UAFAutoAssetManager lockLatestAssetSet:]";
      __int16 v40 = 2114;
      uint64_t v41 = v23;
      long long v24 = (void *)v23;
      __int16 v42 = 2114;
      id v43 = v11;
      _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to lock auto asset set %{public}@: %{public}@", buf, 0x20u);
    }
    long long v14 = +[UAFAutoAssetManager getConcurrentQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke;
    block[3] = &unk_264CEB458;
    id v34 = a1;
    id v32 = v3;
    id v33 = v10;
    dispatch_async(v14, block);

    id v15 = v11;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [v3 assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      id v39 = "+[UAFAutoAssetManager lockLatestAssetSet:]";
      __int16 v40 = 2114;
      uint64_t v41 = (uint64_t)v16;
      __int16 v42 = 2114;
      id v43 = v9;
      _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s Locked auto asset set %{public}@ with atomic instance %{public}@", buf, 0x20u);
    }
    if (v9 && !v8 || v9 && v8 && ([v9 isEqualToString:v8] & 1) == 0)
    {
      id v17 = [v3 assetSetIdentifier];
      +[UAFAssetSetObserver sendUAFNotificationForAssetSet:v17 forRoot:0];

      int v18 = +[UAFAutoAssetManager getConcurrentQueue];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke_368;
      v27[3] = &unk_264CEB458;
      id v30 = a1;
      id v19 = v3;
      id v28 = v19;
      id v20 = v10;
      id v29 = v20;
      dispatch_async(v18, v27);

      +[UAFAutoAssetHistory persistAssetSetInfoLocked:v9 atomicEntries:v20 autoAssetSet:v19 isEliminating:0 reason:@"locked"];
    }
    __int16 v21 = [v3 assetSetIdentifier];
    +[UAFAutoAssetManager logAtomicInstance:v9 name:v21 entries:v10];

    id v15 = +[UAFAutoAssetManager setLatestAtomicInstance:v9 autoAssetSet:v3];
  }

  return v15;
}

uint64_t __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _logDailyStatusEventForAssetSetArrived:*(void *)(a1 + 32) entries:*(void *)(a1 + 40) assetSetArrived:0];
}

uint64_t __42__UAFAutoAssetManager_lockLatestAssetSet___block_invoke_368(uint64_t a1)
{
  return [*(id *)(a1 + 48) _logDailyStatusEventForAssetSetArrived:*(void *)(a1 + 32) entries:*(void *)(a1 + 40) assetSetArrived:1];
}

+ (BOOL)sendNotificationForAssetSet:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F55990] notifyRegistrationName:@"ATOMIC_INSTANCE_DOWNLOADED" forAssetSetIdentifier:a3];
  uint32_t v4 = notify_post((const char *)[v3 UTF8String]);
  if (v4)
  {
    id v5 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      id v8 = "+[UAFAutoAssetManager sendNotificationForAssetSet:]";
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2048;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s notify_post to %@ failed: %lu", (uint8_t *)&v7, 0x20u);
    }
  }
  return v4 == 0;
}

+ (int)listenForUpdates:(id)a3 updateHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = -1;
  int out_token = -1;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [&unk_26EAA1110 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v9 = 136315650;
    long long v20 = v9;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(&unk_26EAA1110);
      }
      objc_msgSend(MEMORY[0x263F55990], "notifyRegistrationName:forAssetSetIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * v12), v5, v20);
      id v13 = objc_claimAutoreleasedReturnValue();
      long long v14 = (const char *)[v13 UTF8String];
      id v15 = +[UAFAutoAssetManager getConcurrentQueue];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __54__UAFAutoAssetManager_listenForUpdates_updateHandler___block_invoke;
      handler[3] = &unk_264CEB528;
      id v16 = v13;
      id v22 = v16;
      id v23 = v6;
      uint32_t v17 = notify_register_dispatch(v14, &out_token, v15, handler);

      if (v17)
      {
        int v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          id v30 = "+[UAFAutoAssetManager listenForUpdates:updateHandler:]";
          __int16 v31 = 2112;
          id v32 = v16;
          __int16 v33 = 2048;
          uint64_t v34 = v17;
          _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s notify_register_dispatch for %@ failed: %lu", buf, 0x20u);
        }

        int v7 = out_token;
      }

      if (v17) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [&unk_26EAA1110 countByEnumeratingWithState:&v24 objects:v35 count:16];
        if (v10) {
          goto LABEL_3;
        }
        int v7 = out_token;
        break;
      }
    }
  }

  return v7;
}

uint64_t __54__UAFAutoAssetManager_listenForUpdates_updateHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "+[UAFAutoAssetManager listenForUpdates:updateHandler:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Received notification for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)observeAssetSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint32_t v4 = [v3 name];
  +[UAFAutoAssetManager observeAssetSetExperimentalNamespace:v3];

  if (qword_26AF0BB50 != -1) {
    dispatch_once(&qword_26AF0BB50, &__block_literal_global_381);
  }
  int v5 = [(id)qword_26AF0BB58 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v14 = "+[UAFAutoAssetManager observeAssetSet:]";
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s Already watching for updates to auto asset set %{public}@ to perform auto asset lock maintenance", buf, 0x16u);
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__UAFAutoAssetManager_observeAssetSet___block_invoke_383;
    v11[3] = &unk_264CEAB50;
    __int16 v7 = v4;
    uint64_t v12 = v7;
    uint64_t v8 = +[UAFAutoAssetManager listenForUpdates:v7 updateHandler:v11];
    uint64_t v9 = [NSNumber numberWithInt:v8];
    [(id)qword_26AF0BB58 setObject:v9 forKeyedSubscript:v7];

    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v14 = "+[UAFAutoAssetManager observeAssetSet:]";
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Watching for updates to auto asset set %{public}@ to perform auto asset lock maintenance", buf, 0x16u);
    }

    id v6 = v12;
  }
}

void __39__UAFAutoAssetManager_observeAssetSet___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26AF0BB58;
  qword_26AF0BB58 = v0;
}

void __39__UAFAutoAssetManager_observeAssetSet___block_invoke_383(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F55980]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint32_t v4 = +[UAFAutoAssetManager getConcurrentQueue];
  id v9 = 0;
  int v5 = (void *)[v2 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v3 comprisedOfEntries:0 completingFromQueue:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    __int16 v7 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "+[UAFAutoAssetManager observeAssetSet:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for updating: %{public}@", buf, 0x20u);
    }
  }
  else if (v5)
  {
    +[UAFAutoAssetManager lockLatestAssetSet:v5 completion:0];
  }
}

+ (void)observeAllAssetSets
{
  id v2 = +[UAFAutoAssetManager getSerialQueue];
  dispatch_async(v2, &__block_literal_global_386);
}

void __42__UAFAutoAssetManager_observeAllAssetSets__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v0 = +[UAFConfigurationManager defaultManager];
  v1 = [v0 getAllAssetSets];

  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        +[UAFAutoAssetManager observeAssetSet:](UAFAutoAssetManager, "observeAssetSet:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)observeAssetSetExperimentalNamespace:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 name];
  uint64_t v5 = [v3 experimentalAssets];

  uint64_t v6 = [v5 trialNamespace];

  if (v4 && v6)
  {
    if (qword_26AF0BB60 != -1) {
      dispatch_once(&qword_26AF0BB60, &__block_literal_global_388);
    }
    long long v7 = [(id)qword_26AF0BB68 objectForKeyedSubscript:v4];

    if (v7)
    {
      long long v8 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v24 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]";
        __int16 v25 = 2114;
        long long v26 = v4;
        _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Already watching for updates to experimental assets for asset set %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      id v19 = __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke_389;
      long long v20 = &unk_264CEC388;
      long long v9 = v4;
      __int16 v21 = v9;
      id v10 = v6;
      id v22 = v10;
      uint64_t v11 = (void *)MEMORY[0x237E26D50](&v17);
      uint64_t v12 = (void *)MEMORY[0x263F80E50];
      uint64_t v13 = +[UAFAssetSetManager getSerialQueue];
      __int16 v14 = [v12 registerUpdateForNamespaceName:v10 queue:v13 usingBlock:v11];

      if (v14)
      {
        [(id)qword_26AF0BB68 setObject:v14 forKeyedSubscript:v9];
      }
      else
      {
        id v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          long long v24 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]";
          __int16 v25 = 2114;
          long long v26 = v9;
          __int16 v27 = 2114;
          id v28 = v10;
          _os_log_fault_impl(&dword_23797A000, v15, OS_LOG_TYPE_FAULT, "%s Error registering update handler from %{public}@ for namespace %{public}@", buf, 0x20u);
        }

        uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
        UAFFaultCapture((uint64_t)v16, (uint64_t)kUAFABCNotifyRegisterFailure, @"trial", 0);
      }
      long long v8 = v21;
    }
  }
}

void __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26AF0BB68;
  qword_26AF0BB68 = v0;
}

void __60__UAFAutoAssetManager_observeAssetSetExperimentalNamespace___block_invoke_389(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 136315650;
    long long v8 = "+[UAFAutoAssetManager observeAssetSetExperimentalNamespace:]_block_invoke";
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Update notification from %{public}@ for namespace %{public}@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = +[UAFSubscriptionStoreManager writeManager];
  uint64_t v6 = +[UAFConfigurationManager defaultManager];
  +[UAFAssetSetManager configureAssetDelivery:v5 configurationManager:v6 lockIfUnchanged:0 subscriptions:0 assetSetUsages:0 userInitiated:0];
}

+ (id)latestAtomicInstanceFromMA:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[UAFAutoAssetManager getReason:v5 operation:@"checking"];
  int v7 = [v5 checkAtomicSync:v6 forAtomicInstance:0 withTimeout:0 discoveredAtomicEntries:0 error:a4];

  long long v8 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = [v5 assetSetIdentifier];
      int v15 = 136315650;
      uint64_t v16 = "+[UAFAutoAssetManager latestAtomicInstanceFromMA:error:]";
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is available and has atomic instance %{public}@", (uint8_t *)&v15, 0x20u);
    }
    id v11 = v7;
  }
  else
  {
    if (v9)
    {
      uint64_t v12 = [v5 assetSetIdentifier];
      id v13 = *a4;
      int v15 = 136315650;
      uint64_t v16 = "+[UAFAutoAssetManager latestAtomicInstanceFromMA:error:]";
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ does not yet have assets: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }

  return v7;
}

+ (id)latestStatusForClients:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F55980]) initLockerUsingClientDomain:@"com.apple.UnifiedAssetFramework" forAssetSetIdentifier:v5 error:a4];
  if (v6 && !*a4)
  {
    uint64_t v10 = +[UAFAutoAssetManager getReason:v6 operation:@"file locking latest version of"];
    id v11 = [v6 lockAtomicSync:v10 forAtomicInstance:0 error:a4];
    int v7 = v11;
    if (v11 && !*a4)
    {
      __int16 v14 = [v11 latestDownloadedAtomicInstance];
      *a4 = [v6 endAtomicLockSync:v10 ofAtomicInstance:v14];

      if (*a4)
      {
        int v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v7 latestDownloadedAtomicInstance];
          id v17 = *a4;
          int v19 = 136315906;
          id v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
          __int16 v21 = 2114;
          id v22 = v5;
          __int16 v23 = 2114;
          id v24 = v16;
          __int16 v25 = 2114;
          id v26 = v17;
          _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s Could not end lock of auto asset set %{public}@ atomic instance %{public}@ : %{public}@", (uint8_t *)&v19, 0x2Au);
        }
      }
      BOOL v9 = v7;
    }
    else
    {
      uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *a4;
        int v19 = 136315650;
        id v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
        __int16 v21 = 2114;
        id v22 = v5;
        __int16 v23 = 2114;
        id v24 = v13;
        _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Could not lock auto asset set %{public}@ : %{public}@", (uint8_t *)&v19, 0x20u);
      }

      BOOL v9 = 0;
    }
  }
  else
  {
    int v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *a4;
      int v19 = 136315650;
      id v20 = "+[UAFAutoAssetManager latestStatusForClients:error:]";
      __int16 v21 = 2114;
      id v22 = v5;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not initialize auto asset set %{public}@ : %{public}@", (uint8_t *)&v19, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)latestAtomicInstanceForClients:(id)a3 OSSupported:(BOOL *)a4 error:(id *)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v7 = a3;
  *a4 = 1;
  id v8 = [v7 name];
  uint64_t v53 = a5;
  BOOL v9 = +[UAFAutoAssetManager latestStatusForClients:v8 error:a5];

  if (v9)
  {
    uint64_t v10 = [v7 metadataAsset];

    if (v10)
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v11 = [v7 assets];
      uint64_t v50 = [v11 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v67;
        uint64_t v52 = v7;
        id v54 = v9;
        __int16 v49 = v11;
        __int16 v47 = a4;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v67 != v51) {
              objc_enumerationMutation(v11);
            }
            id v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            __int16 v14 = [v7 metadataAsset];
            int v15 = [v13 name];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              uint64_t v48 = i;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id obj = [v13 expansions];
              uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
              if (!v57) {
                goto LABEL_30;
              }
              uint64_t v56 = *(void *)v63;
              while (1)
              {
                for (uint64_t j = 0; j != v57; ++j)
                {
                  if (*(void *)v63 != v56) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v18 = [*(id *)(*((void *)&v62 + 1) + 8 * j) getAutoAssetSpecifier:0];
                  if (!v18) {
                    goto LABEL_28;
                  }
                  long long v60 = 0u;
                  long long v61 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  int v19 = [v9 latestDowloadedAtomicInstanceEntries];
                  uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v80 count:16];
                  if (!v20) {
                    goto LABEL_23;
                  }
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v59;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v21; ++k)
                    {
                      if (*(void *)v59 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      id v24 = *(void **)(*((void *)&v58 + 1) + 8 * k);
                      __int16 v25 = [v24 fullAssetSelector];
                      id v26 = [v25 assetSpecifier];
                      int v27 = [v18 isEqualToString:v26];

                      if (v27)
                      {
                        uint64_t v28 = [v24 localContentURL];
                        if (!v28) {
                          goto LABEL_36;
                        }
                        uint64_t v29 = (void *)v28;
                        id v30 = [v24 localContentURL];
                        __int16 v31 = [v30 scheme];

                        if (v31)
                        {
LABEL_36:
                          uint64_t v38 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
                          BOOL v9 = v54;
                          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v41 = [v52 metadataAsset];
                            __int16 v42 = [v52 name];
                            id v43 = [v24 localContentURL];
                            *(_DWORD *)buf = 136315906;
                            long long v71 = "+[UAFAutoAssetManager latestAtomicInstanceForClients:OSSupported:error:]";
                            __int16 v72 = 2114;
                            id v73 = v41;
                            __int16 v74 = 2114;
                            v75 = v42;
                            __int16 v76 = 2112;
                            v77 = v43;
                            _os_log_error_impl(&dword_23797A000, v38, OS_LOG_TYPE_ERROR, "%s Failed to get a valid URL for metadata asset %{public}@ in asset set %{public}@ at location %@", buf, 0x2Au);
                          }
                          id v37 = [v54 latestDownloadedAtomicInstance];
                        }
                        else
                        {
                          id v32 = NSURL;
                          __int16 v33 = [v24 localContentURL];
                          uint64_t v34 = [v33 absoluteString];
                          id v35 = [v32 fileURLWithPath:v34 isDirectory:1];

                          uint64_t v36 = +[UAFAssetSetMetadata fromAssetDir:v35 error:v53];
                          BOOL v9 = v54;
                          if (!*v53)
                          {

                            if (!v36) {
                              goto LABEL_28;
                            }

                            BOOL *v47 = [v36 OSSupported];
                            id v37 = [v54 latestDownloadedAtomicInstance];

                            goto LABEL_44;
                          }
                          id v39 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v44 = [v52 metadataAsset];
                            id v45 = [v52 name];
                            id v46 = *v53;
                            *(_DWORD *)buf = 136316162;
                            long long v71 = "+[UAFAutoAssetManager latestAtomicInstanceForClients:OSSupported:error:]";
                            __int16 v72 = 2114;
                            id v73 = v44;
                            __int16 v74 = 2114;
                            v75 = v45;
                            __int16 v76 = 2112;
                            v77 = v35;
                            __int16 v78 = 2114;
                            id v79 = v46;
                            _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load asset set metadata from asset %{public}@ in asset set %{public}@ at location %@: %{public}@", buf, 0x34u);
                          }
                          id v37 = [v54 latestDownloadedAtomicInstance];

                          int v19 = v36;
                        }

LABEL_44:
                        id v7 = v52;
                        goto LABEL_45;
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v80 count:16];
                    if (v21) {
                      continue;
                    }
                    break;
                  }
LABEL_23:

                  BOOL v9 = v54;
LABEL_28:
                }
                uint64_t v57 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
                if (!v57)
                {
LABEL_30:

                  uint64_t i = v48;
                  id v11 = v49;
                  break;
                }
              }
            }
            id v7 = v52;
          }
          uint64_t v50 = [v11 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v50);
      }
    }
    id v37 = [v9 latestDownloadedAtomicInstance];
  }
  else
  {
    id v37 = 0;
  }
LABEL_45:

  return v37;
}

+ (BOOL)shouldCheckAssetSet:(id)a3 autoAssetSet:(id)a4 changed:(BOOL)a5 locked:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  *a6 = 0;
  if (v7)
  {
    id v11 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 assetSetIdentifier];
      *(_DWORD *)buf = 136315394;
      id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
      __int16 v46 = 2114;
      __int16 v47 = v12;
      _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has had its configuration changed", buf, 0x16u);
    }
  }
  id v43 = 0;
  id v13 = +[UAFAutoAssetManager latestAtomicInstanceFromMA:v10 error:&v43];
  id v14 = v43;
  int v15 = v14;
  if (v13)
  {
    char v41 = 0;
    id v40 = v14;
    int v16 = +[UAFAutoAssetManager latestAtomicInstanceForClients:v9 OSSupported:&v41 error:&v40];
    id v17 = v40;

    if (([v13 isEqualToString:v16] & 1) == 0)
    {
      uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [v9 name];
        *(_DWORD *)buf = 136315650;
        id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
        __int16 v46 = 2114;
        __int16 v47 = v19;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v13;
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ has atomic instance %{public}@, but is not available to clients, locking latest instance", buf, 0x20u);
      }
      uint64_t v20 = +[UAFAutoAssetManager lockLatestAssetSet:v10];

      uint64_t v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v9 name];
        *(_DWORD *)buf = 136315650;
        id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
        __int16 v46 = 2114;
        __int16 v47 = v22;
        __int16 v48 = 2114;
        uint64_t v49 = v20;
        _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ locking complete with error: %{public}@", buf, 0x20u);
      }
      BOOL v23 = 1;
      if (v20)
      {
        id v17 = (id)v20;
LABEL_33:

        LOBYTE(v7) = v23;
        goto LABEL_34;
      }
      *a6 = 1;
      id v39 = 0;
      uint64_t v31 = +[UAFAutoAssetManager latestAtomicInstanceForClients:v9 OSSupported:&v41 error:&v39];
      id v17 = v39;

      int v16 = (void *)v31;
    }
    BOOL v23 = v41 == 0;
    if (v41)
    {
      if (v7)
      {
        BOOL v23 = 1;
        goto LABEL_33;
      }
      id v32 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = [v9 name];
        *(_DWORD *)buf = 136315650;
        id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
        __int16 v46 = 2114;
        __int16 v47 = v33;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v13;
        uint64_t v34 = "%s Auto asset set %{public}@ is configured, has atomic instance %{public}@, and is available to clients, n"
              "o further management needed";
        goto LABEL_31;
      }
    }
    else
    {
      id v32 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = [v9 name];
        *(_DWORD *)buf = 136315650;
        id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
        __int16 v46 = 2114;
        __int16 v47 = v33;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v13;
        uint64_t v34 = "%s Auto asset set %{public}@ is configured, has atomic instance %{public}@, and is available to clients bu"
              "t current OS is not supported";
LABEL_31:
        _os_log_impl(&dword_23797A000, v32, OS_LOG_TYPE_DEFAULT, v34, buf, 0x20u);
      }
    }

    goto LABEL_33;
  }
  id v42 = v14;
  id v24 = [v10 currentSetStatusSync:&v42];
  id v17 = v42;

  if (!v24 || v17)
  {
    uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    id v30 = [v10 assetSetIdentifier];
    *(_DWORD *)buf = 136315650;
    id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
    __int16 v46 = 2114;
    __int16 v47 = v30;
    __int16 v48 = 2114;
    uint64_t v49 = (uint64_t)v17;
    _os_log_error_impl(&dword_23797A000, v29, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);
    goto LABEL_19;
  }
  uint64_t v25 = [v24 newerAtomicInstanceDiscovered];
  if (v25)
  {
    id v26 = (void *)v25;
    int v27 = [v24 newerDiscoveredAtomicEntries];
    uint64_t v28 = [v27 count];

    if (!v28)
    {
      uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [v10 assetSetIdentifier];
        id v37 = [v24 newerAtomicInstanceDiscovered];
        uint64_t v38 = [v24 catalogCachedAssetSetID];
        *(_DWORD *)buf = 136315906;
        id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
        __int16 v46 = 2114;
        __int16 v47 = v36;
        __int16 v48 = 2114;
        uint64_t v49 = (uint64_t)v37;
        __int16 v50 = 2114;
        uint64_t v51 = v38;
        _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is desired but newest published atomic instance %{public}@ from catalog %{public}@ contains no assets", buf, 0x2Au);
      }
      goto LABEL_22;
    }
  }
  uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v10 assetSetIdentifier];
    *(_DWORD *)buf = 136315394;
    id v45 = "+[UAFAutoAssetManager shouldCheckAssetSet:autoAssetSet:changed:locked:]";
    __int16 v46 = 2114;
    __int16 v47 = v30;
    _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ is desired but no atomic instance is available", buf, 0x16u);
LABEL_19:
  }
LABEL_21:
  LOBYTE(v7) = 1;
LABEL_22:

LABEL_34:
  return v7;
}

+ (id)manageAssetSet:(id)a3 specifiers:(id)a4 lockIfUnchanged:(BOOL)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v39[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  unsigned __int8 v33 = 0;
  id v11 = +[UAFAutoAssetManager configureAssetSet:v10 specifiers:a4 changed:&v33];
  if (v11)
  {
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v10 name];
      *(_DWORD *)buf = 136315394;
      id v35 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]";
      __int16 v36 = 2114;
      id v37 = v13;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Managing auto asset set %{public}@", buf, 0x16u);
    }
    +[UAFAutoAssetManager observeAssetSet:v10];
    char v32 = 0;
    if (+[UAFAutoAssetManager shouldCheckAssetSet:v10 autoAssetSet:v11 changed:v33 locked:&v32])
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __79__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged_userInitiated___block_invoke;
      v29[3] = &unk_264CEC3B0;
      id v14 = v11;
      id v30 = v14;
      id v31 = a1;
      int v15 = (void *)MEMORY[0x237E26D50](v29);
      int v16 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v10 name];
        int v18 = [v10 enableExpensiveCellular];
        *(_DWORD *)buf = 136315906;
        id v35 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]";
        __int16 v36 = 2114;
        id v37 = v17;
        __int16 v38 = 1024;
        LODWORD(v39[0]) = v18;
        WORD2(v39[0]) = 1024;
        *(_DWORD *)((char *)v39 + 6) = v6;
        _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s Checking auto asset set %{public}@ with cellular: %d user initiated: %d", buf, 0x22u);
      }
      int v19 = objc_opt_new();
      [v19 setUserInitiated:v6];
      [v19 setAllowCheckDownloadOnBattery:1];
      [v19 setAllowCheckDownloadOverCellular:1];
      objc_msgSend(v19, "setAllowCheckDownloadOverExpensive:", objc_msgSend(v10, "enableExpensiveCellular"));
      uint64_t v20 = +[UAFAutoAssetManager getReason:v14 operation:@"checking"];
      [v14 checkAtomic:v20 forAtomicInstance:0 awaitingDownload:1 withNeedPolicy:v19 withTimeout:-2 completion:v15];

      id v21 = v14;
    }
    else
    {
      if (v7 && !v32)
      {
        uint64_t v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v23 = [v10 name];
          *(_DWORD *)buf = 136315394;
          id v35 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]";
          __int16 v36 = 2114;
          id v37 = v23;
          _os_log_impl(&dword_23797A000, v22, OS_LOG_TYPE_DEFAULT, "%s Locking latest instance of auto asset set %{public}@ although it is unchanged", buf, 0x16u);
        }
        id v24 = +[UAFAutoAssetManager lockLatestAssetSet:v11];
        uint64_t v25 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v10 name];
          *(_DWORD *)buf = 136315650;
          id v35 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]";
          __int16 v36 = 2114;
          id v37 = v26;
          __int16 v38 = 2114;
          v39[0] = v24;
          _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s Auto asset set %{public}@ locking complete with error: %{public}@", buf, 0x20u);
        }
      }
      id v27 = v11;
    }
  }

  return v11;
}

void __79__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged_userInitiated___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  id v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [*(id *)(a1 + 32) assetSetIdentifier];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]_block_invoke_2";
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s Checked auto asset set %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v16 = [*(id *)(a1 + 32) assetSetIdentifier];
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = "+[UAFAutoAssetManager manageAssetSet:specifiers:lockIfUnchanged:userInitiated:]_block_invoke";
    __int16 v23 = 2114;
    id v24 = v16;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s Could not check auto asset set %{public}@: %{public}@", buf, 0x20u);
  }
  id v11 = [v9 domain];
  if (![v11 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = [v9 code];

  if (v12 != 6205)
  {
    id v13 = +[UAFAutoAssetManager getConcurrentQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged_userInitiated___block_invoke_400;
    block[3] = &unk_264CEB458;
    id v14 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    int v18 = v14;
    id v19 = v8;
    dispatch_async(v13, block);

    id v11 = v18;
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __79__UAFAutoAssetManager_manageAssetSet_specifiers_lockIfUnchanged_userInitiated___block_invoke_400(uint64_t a1)
{
  return [*(id *)(a1 + 48) _logDailyStatusEventForAssetSetArrived:*(void *)(a1 + 32) entries:*(void *)(a1 + 40) assetSetArrived:0];
}

+ (id)targetForAssetSet:(id)a3 specifiers:(id)a4 version:(id)a5 autoAssetSets:(id)a6
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[UAFAutoAssetManager getAutoSetEntries:v9 specifiers:v10];
  id v14 = [v9 name];
  int v15 = [v12 objectForKey:v14];

  if (v15)
  {
    id v16 = 0;
    goto LABEL_3;
  }
  uint64_t v29 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v9 name];
    *(_DWORD *)buf = 136315394;
    BOOL v55 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSets:]";
    __int16 v56 = 2114;
    uint64_t v57 = v30;
    _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, "%s AutoAssetSet %{public}@ not previously initialized. Creating a new one for staging.", buf, 0x16u);
  }
  id v31 = objc_alloc(MEMORY[0x263F55980]);
  char v32 = [v9 name];
  unsigned __int8 v33 = +[UAFAutoAssetManager getConcurrentQueue];
  id v53 = 0;
  uint64_t v34 = (void *)[v31 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v32 comprisedOfEntries:v13 completingFromQueue:v33 error:&v53];
  id v16 = v53;

  int v15 = v34;
  if (!v34 || v16)
  {
    uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = [v34 assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      BOOL v55 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSets:]";
      __int16 v56 = 2114;
      uint64_t v57 = v46;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)v16;
      _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s Could not create auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if (v12)
  {
    id v16 = 0;
    goto LABEL_11;
  }
  id v52 = 0;
  uint64_t v20 = [v34 currentSetStatusSync:&v52];
  id v42 = v52;
  id v16 = v42;
  if (!v42)
  {
    if (v20)
    {
      id v16 = 0;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  id v43 = [v42 domain];
  if (![v43 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {

    if (v20) {
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  uint64_t v44 = [v16 code];

  if (v44 != 6301 && !v20)
  {
LABEL_32:
    id v45 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      __int16 v48 = [v9 name];
      *(_DWORD *)buf = 136315650;
      BOOL v55 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSets:]";
      __int16 v56 = 2114;
      uint64_t v57 = v48;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)v16;
      _os_log_error_impl(&dword_23797A000, v45, OS_LOG_TYPE_ERROR, "%s Could not determine status for set %{public}@ : %{public}@", buf, 0x20u);
    }
    uint64_t v20 = 0;
LABEL_17:
    id v19 = 0;
    goto LABEL_18;
  }

  if (v44 != 6301) {
    goto LABEL_3;
  }
LABEL_11:
  id v35 = v16;
  __int16 v36 = v13;
  id v37 = v35;
  uint64_t v20 = objc_opt_new();
  [v20 setBlockCheckDownload:1];
  __int16 v38 = +[UAFAutoAssetManager getReason:v15 operation:@"will in another OS need"];
  uint64_t v39 = [v15 needForAtomicSync:v38 withNeedPolicy:v20];

  if (!v39)
  {
    id v13 = v36;
    id v16 = 0;
LABEL_31:

LABEL_3:
    id v17 = objc_alloc(MEMORY[0x263F559A0]);
    int v18 = +[UAFPlatform maxVersionFromVersionString:v11];
    id v19 = (void *)[v17 initForMinTargetOSVersion:v11 toMaxTargetOSVersion:v18 asEntriesWhenTargeting:v13];

    uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v9 name];
      v21 = __int16 v50 = v15;
      [v19 minTargetOSVersion];
      id v51 = v11;
      v23 = uint64_t v22 = v10;
      id v24 = [v19 maxTargetOSVersion];
      __int16 v25 = [v9 autoAssetType];
      [v22 allObjects];
      id v49 = v16;
      id v26 = v9;
      v28 = uint64_t v27 = v13;
      *(_DWORD *)buf = 136316418;
      BOOL v55 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSets:]";
      __int16 v56 = 2114;
      uint64_t v57 = v21;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)v23;
      __int16 v60 = 2114;
      long long v61 = v24;
      __int16 v62 = 2114;
      long long v63 = v25;
      __int16 v64 = 2114;
      long long v65 = v28;
      _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s Staging asset set %{public}@ for OS versions %{public}@ through %{public}@ with type %{public}@ and entries %{public}@", buf, 0x3Eu);

      id v13 = v27;
      id v9 = v26;
      id v16 = v49;

      id v10 = v22;
      id v11 = v51;

      int v15 = v50;
    }
    goto LABEL_18;
  }
  id v40 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  id v13 = v36;
  id v16 = (id)v39;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    __int16 v47 = [v9 name];
    *(_DWORD *)buf = 136315650;
    BOOL v55 = "+[UAFAutoAssetManager targetForAssetSet:specifiers:version:autoAssetSets:]";
    __int16 v56 = 2114;
    uint64_t v57 = v47;
    __int16 v58 = 2114;
    uint64_t v59 = v39;
    _os_log_error_impl(&dword_23797A000, v40, OS_LOG_TYPE_ERROR, "%s Could not indicate lack of need in this OS for asset set %{public}@ : %{public}@", buf, 0x20u);
  }
  id v19 = 0;
LABEL_18:

  return v19;
}

+ (void)stageAssetSet:(id)a3 targets:(id)a4 autoAssetSet:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s AutoAssetSet %{public}@ not provided, creating a new one for staging.", buf, 0x16u);
    }

    id v11 = objc_alloc(MEMORY[0x263F55980]);
    id v12 = +[UAFAutoAssetManager getConcurrentQueue];
    id v17 = 0;
    id v9 = (id)[v11 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v7 comprisedOfEntries:0 completingFromQueue:v12 error:&v17];
    id v13 = v17;

    if (!v9 || v13)
    {
      int v15 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
        __int16 v20 = 2114;
        id v21 = v7;
        __int16 v22 = 2114;
        id v23 = v13;
        id v16 = "%s Could not get auto asset set %{public}@ : %{public}@";
        goto LABEL_13;
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  id v14 = +[UAFAutoAssetManager getReason:v9 operation:@"will in another OS need"];
  id v13 = [v9 assetSetForStagingSync:v14 asEntriesWhenTargeting:v8];

  if (v13)
  {
    int v15 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "+[UAFAutoAssetManager stageAssetSet:targets:autoAssetSet:]";
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v13;
      id v16 = "%s Could get not stage asset set %{public}@ for other OS versions: %{public}@";
LABEL_13:
      _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
}

+ (void)stageAssetsWithSubscriptions:(id)a3 knownAutoAssetSets:(id)a4 usedAutoAssetSets:(id)a5 autoAssetSets:(id)a6
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v54 = a3;
  id v63 = a4;
  id v59 = a5;
  id v60 = a6;
  id v9 = +[UAFAssetSetManager sharedManager];
  id v10 = [v9 retrieveAssetSet:@"com.apple.siri.uaf.platform" usages:0];

  if (!v10)
  {
    id v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s No platform assets available when attempting to staging assets", buf, 0xCu);
    }
    goto LABEL_52;
  }
  id v11 = +[UAFPlatform configurationManagers:v10];
  id v12 = v11;
  if (!v11)
  {
    char v41 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
    __int16 v50 = "%s No version -> configuration managers available when attempting to staging assets";
    goto LABEL_50;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v55 = [v11 countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (!v55) {
    goto LABEL_46;
  }
  long long v61 = 0;
  id v51 = v10;
  uint64_t v52 = *(void *)v75;
  id v13 = (void **)&UAFLogContextMAConfig;
  unint64_t v14 = 0x264CEA000uLL;
  id v53 = v12;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v75 != v52) {
        objc_enumerationMutation(v12);
      }
      uint64_t v56 = v15;
      uint64_t v16 = *(void *)(*((void *)&v74 + 1) + 8 * v15);
      id v17 = -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v16, v51);
      int v18 = [v17 applySubscriptions:v54];
      id v19 = [v17 getAllAssetSets];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obj = v19;
      uint64_t v65 = [v19 countByEnumeratingWithState:&v70 objects:v85 count:16];
      if (v65)
      {
        uint64_t v64 = *(void *)v71;
        uint64_t v57 = v17;
        uint64_t v58 = v16;
        do
        {
          for (uint64_t i = 0; i != v65; ++i)
          {
            if (*(void *)v71 != v64) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            __int16 v22 = [v21 autoAssetType];

            if (v22)
            {
              id v23 = [v21 name];
              [v63 addObject:v23];

              uint64_t v24 = [v21 name];
              __int16 v25 = [v17 getPrestage:v24];

              if (v25)
              {
                uint64_t v26 = [v25 mergeAssetSetUsages:v18];

                int v18 = (void *)v26;
              }
              uint64_t v27 = v18;
              uint64_t v28 = +[UAFAutoAssetManager getSpecifiers:v21 assetSetUsages:v18];
              if ([v28 count])
              {
                uint64_t v29 = [v21 name];
                [v59 addObject:v29];

                id v30 = +[UAFAutoAssetManager targetForAssetSet:v21 specifiers:v28 version:v16 autoAssetSets:v60];
                if (v30)
                {
                  id v31 = v13;
                  char v32 = v61;
                  if (!v61) {
                    char v32 = objc_opt_new();
                  }
                  unsigned __int8 v33 = [v21 name];
                  uint64_t v34 = [v32 objectForKeyedSubscript:v33];

                  if (!v34)
                  {
                    id v35 = objc_opt_new();
                    __int16 v36 = [v21 name];
                    [v32 setObject:v35 forKeyedSubscript:v36];
                  }
                  id v37 = [v21 name];
                  long long v61 = v32;
                  __int16 v38 = [v32 objectForKeyedSubscript:v37];
                  [v38 addObject:v30];

                  id v13 = v31;
                  id v17 = v57;
                  uint64_t v16 = v58;
                }
                else
                {
                  id v37 = UAFGetLogCategory(v13);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    id v40 = [v21 name];
                    *(_DWORD *)buf = 136315650;
                    __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
                    __int16 v81 = 2114;
                    __int16 v82 = v40;
                    __int16 v83 = 2114;
                    uint64_t v84 = v16;
                    _os_log_impl(&dword_23797A000, v37, OS_LOG_TYPE_DEFAULT, "%s Failed to generate target for Asset set %{public}@ for OS version %{public}@", buf, 0x20u);
                  }
                }
LABEL_29:

                unint64_t v14 = 0x264CEA000uLL;
              }
              else
              {
                id v30 = UAFGetLogCategory(v13);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  id v37 = [v21 name];
                  *(_DWORD *)buf = 136315650;
                  __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
                  __int16 v81 = 2114;
                  __int16 v82 = v37;
                  __int16 v83 = 2114;
                  uint64_t v84 = v16;
                  _os_log_impl(&dword_23797A000, v30, OS_LOG_TYPE_DEFAULT, "%s Asset set %{public}@ should not have any entries for OS version %{public}@", buf, 0x20u);
                  goto LABEL_29;
                }
              }

              int v18 = v27;
              goto LABEL_31;
            }
            __int16 v25 = UAFGetLogCategory(v13);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = [v21 name];
              *(_DWORD *)buf = 136315650;
              __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
              __int16 v81 = 2114;
              __int16 v82 = v39;
              __int16 v83 = 2114;
              uint64_t v84 = v16;
              _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@ for OS version %{public}@", buf, 0x20u);
            }
LABEL_31:
          }
          uint64_t v65 = [obj countByEnumeratingWithState:&v70 objects:v85 count:16];
        }
        while (v65);
      }

      uint64_t v15 = v56 + 1;
      id v12 = v53;
    }
    while (v56 + 1 != v55);
    uint64_t v55 = [v53 countByEnumeratingWithState:&v74 objects:v86 count:16];
  }
  while (v55);
  id v10 = v51;
  if (!v61)
  {
LABEL_46:
    char v41 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v80 = "+[UAFAutoAssetManager stageAssetsWithSubscriptions:knownAutoAssetSets:usedAutoAssetSets:autoAssetSets:]";
    __int16 v50 = "%s No staging targets for other OS versions";
LABEL_50:
    _os_log_impl(&dword_23797A000, v41, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
    goto LABEL_51;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  char v41 = v61;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v66 + 1) + 8 * j);
        __int16 v47 = *(void **)(v14 + 2312);
        __int16 v48 = [v41 objectForKeyedSubscript:v46];
        id v49 = [v60 objectForKey:v46];
        [v47 stageAssetSet:v46 targets:v48 autoAssetSet:v49];

        unint64_t v14 = 0x264CEA000;
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v66 objects:v78 count:16];
    }
    while (v43);
  }

LABEL_51:
LABEL_52:
}

+ (id)forceRemoveAutoAssetSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F55980]);
  id v5 = +[UAFAutoAssetManager getConcurrentQueue];
  id v17 = 0;
  BOOL v6 = (void *)[v4 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v3 comprisedOfEntries:0 completingFromQueue:v5 error:&v17];
  id v7 = v17;

  if (v7)
  {
    id v8 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v19 = "+[UAFAutoAssetManager forceRemoveAutoAssetSet:]";
      __int16 v20 = 2114;
      id v21 = v3;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }

    id v9 = v7;
  }
  else
  {
    id v10 = +[UAFAutoAssetManager getReason:v6 operation:@"should eliminate"];
    id v11 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 assetSetIdentifier];
      *(_DWORD *)buf = 136315394;
      id v19 = "+[UAFAutoAssetManager forceRemoveAutoAssetSet:]";
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s Forcibly eliminating auto asset %{public}@ using awaitingUnlocked:NO", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x263F55980];
    unint64_t v14 = [v6 assetSetIdentifier];
    id v9 = [v13 eliminateAtomicSync:v10 usingClientDomain:@"com.apple.UnifiedAssetFramework" forAssetSetIdentifier:v14 awaitingUnlocked:0];

    if (v9)
    {
      id v15 = v9;
    }
    else
    {
      +[UAFAutoAssetManager eliminateAssetType:v6];
      +[UAFAssetSetObserver sendUAFNotificationForAssetSet:v3 forRoot:0];
    }
  }

  return v9;
}

+ (void)removeAutoAssetSet:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __53__UAFAutoAssetManager_removeAutoAssetSet_completion___block_invoke;
  v22[3] = &unk_264CEB038;
  id v7 = v6;
  id v23 = v7;
  id v8 = (void (**)(void, void))MEMORY[0x237E26D50](v22);
  id v9 = objc_alloc(MEMORY[0x263F55980]);
  id v10 = +[UAFAutoAssetManager getConcurrentQueue];
  id v21 = 0;
  id v11 = (void *)[v9 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v5 comprisedOfEntries:0 completingFromQueue:v10 error:&v21];
  id v12 = v21;

  if (v12)
  {
    id v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
      __int16 v26 = 2114;
      id v27 = v5;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }

    ((void (**)(void, id))v8)[2](v8, v12);
  }
  else
  {
    id v20 = 0;
    unint64_t v14 = [v11 currentSetStatusSync:&v20];
    id v15 = v20;
    id v12 = v15;
    if (!v14 || v15)
    {
      id v19 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
        __int16 v26 = 2114;
        id v27 = v5;
        __int16 v28 = 2114;
        id v29 = v12;
        _os_log_debug_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEBUG, "%s Undesired auto asset set %{public}@ doesn't exist: %{public}@", buf, 0x20u);
      }

      if (v12 && [v12 code] == 6301) {
        v8[2](v8, 0);
      }
      else {
        ((void (**)(void, id))v8)[2](v8, v12);
      }
    }
    else
    {
      uint64_t v16 = objc_opt_new();
      [v16 setBlockCheckDownload:1];
      id v17 = +[UAFAutoAssetManager getReason:v11 operation:@"does not need"];
      id v12 = [v11 needForAtomicSync:v17 withNeedPolicy:v16];

      if (v12)
      {
        int v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v25 = "+[UAFAutoAssetManager removeAutoAssetSet:completion:]";
          __int16 v26 = 2114;
          id v27 = v5;
          __int16 v28 = 2114;
          id v29 = v12;
          _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Could not indicate lack of need for asset set %{public}@ : %{public}@", buf, 0x20u);
        }
      }
      else
      {
        id v12 = +[UAFAutoAssetManager setLatestAtomicInstance:0 autoAssetSet:v11];
      }
      ((void (**)(void, id))v8)[2](v8, v12);
    }
  }
}

uint64_t __53__UAFAutoAssetManager_removeAutoAssetSet_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)removeUnusedAutoAssetSets:(id)a3 usedAutoAssetSets:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([v6 containsObject:v11] & 1) == 0) {
          +[UAFAutoAssetManager removeAutoAssetSet:v11 completion:0];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (void)configureAutoAssetsFromAssetSetUsages:(id)a3 subscriptions:(id)a4 configurationManager:(id)a5 lockIfUnchanged:(BOOL)a6 userInitiated:(BOOL)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v14 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v26 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged"
          ":userInitiated:]";
    _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Configuring MobileAsset from asset set usages", buf, 0xCu);
  }

  if (!v13)
  {
    id v13 = +[UAFConfigurationManager defaultManager];
  }
  long long v15 = +[UAFAutoAssetManager getSerialQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __126__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged_userInitiated___block_invoke;
  v19[3] = &unk_264CEC3D8;
  id v20 = v13;
  id v21 = v11;
  BOOL v23 = a6;
  BOOL v24 = a7;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  dispatch_sync(v15, v19);
}

void __126__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged_userInitiated___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  id v22 = objc_opt_new();
  id v21 = objc_opt_new();
  [*(id *)(a1 + 32) getAllAssetSets];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v8 = [v7 autoAssetType];

        if (v8)
        {
          uint64_t v9 = [v7 name];
          [v2 addObject:v9];

          id v10 = +[UAFAutoAssetManager getSpecifiers:v7 assetSetUsages:*(void *)(a1 + 40)];
          if ([v10 count])
          {
            if (![v7 subjectToAppleIntelligenceWaitlist]
              || +[UAFCommonUtilities gmsAllowsAssets])
            {
              id v11 = [v7 name];
              [v22 addObject:v11];

              id v12 = +[UAFAutoAssetManager manageAssetSet:v7 specifiers:v10 lockIfUnchanged:*(unsigned __int8 *)(a1 + 56) userInitiated:*(unsigned __int8 *)(a1 + 57)];
              if (v12 && [v10 count])
              {
                id v13 = [v7 name];
                [v21 setObject:v12 forKeyedSubscript:v13];
              }
              long long v14 = [v7 name];
              +[UAFAutoAssetInstance clear:v14 path:0];
              goto LABEL_21;
            }
            id v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              long long v14 = [v7 name];
              *(_DWORD *)buf = 136315394;
              uint64_t v34 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockI"
                    "fUnchanged:userInitiated:]_block_invoke";
              __int16 v35 = 2114;
              __int16 v36 = v14;
              long long v15 = v12;
              id v16 = "%s Asset set %{public}@ is not allowed on this device";
              goto LABEL_20;
            }
          }
          else
          {
            id v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              long long v14 = [v7 name];
              *(_DWORD *)buf = 136315394;
              uint64_t v34 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockI"
                    "fUnchanged:userInitiated:]_block_invoke";
              __int16 v35 = 2114;
              __int16 v36 = v14;
              long long v15 = v12;
              id v16 = "%s Asset set %{public}@ should not have any entries";
LABEL_20:
              _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
LABEL_21:
            }
          }
        }
        else
        {
          id v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v12 = [v7 name];
          *(_DWORD *)buf = 136315394;
          uint64_t v34 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnc"
                "hanged:userInitiated:]_block_invoke";
          __int16 v35 = 2114;
          __int16 v36 = v12;
          _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@", buf, 0x16u);
        }

LABEL_23:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v4);
  }
  id v17 = +[UAFAutoAssetManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __126__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged_userInitiated___block_invoke_407;
  block[3] = &unk_264CEBB58;
  id v25 = *(id *)(a1 + 48);
  id v26 = v2;
  id v27 = v22;
  id v28 = v21;
  id v18 = v21;
  id v19 = v22;
  id v20 = v2;
  dispatch_async(v17, block);
}

void __126__UAFAutoAssetManager_configureAutoAssetsFromAssetSetUsages_subscriptions_configurationManager_lockIfUnchanged_userInitiated___block_invoke_407(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  +[UAFAutoAssetManager stageAssetsWithSubscriptions:a1[4] knownAutoAssetSets:a1[5] usedAutoAssetSets:a1[6] autoAssetSets:a1[7]];
  +[UAFAutoAssetManager removeUnusedAutoAssetSets:a1[5] usedAutoAssetSets:a1[6]];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "+[UAFAutoAssetManager configureAutoAssetsFromAssetSetUsages:subscriptions:configurationManager:lockIfUnchanged:"
         "userInitiated:]_block_invoke";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished configuring MobileAsset from asset set usages", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)_createXPCConnection
{
  id v2 = objc_opt_new();

  return v2;
}

+ (void)conditionallyLockLatestAssetSet:(id)a3 newestInstance:(id)a4 checkAtomicError:(id)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = [v9 assetSetIdentifier];
  uint64_t v39 = 0;
  long long v14 = +[UAFAutoAssetManager latestStatusForClients:v13 error:&v39];

  if (v14)
  {
    uint64_t v15 = [v14 latestDownloadedAtomicInstance];
    id v16 = (void *)v15;
    BOOL v17 = v10 != 0;
    BOOL v18 = v15 != 0;
    if (v15) {
      int v19 = 1;
    }
    else {
      int v19 = v10 == 0;
    }
    if (v10 && v15)
    {
      v19 &= [v10 isEqualToString:v15];
      BOOL v17 = 1;
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
    id v16 = 0;
    int v19 = v10 == 0;
    BOOL v17 = v10 != 0;
  }
  unsigned __int8 v33 = v10;
  if (!v11)
  {
LABEL_17:
    id v23 = 0;
    if (v19) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  id v20 = [v11 domain];
  if (([v20 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"] & 1) == 0)
  {

    goto LABEL_17;
  }
  int v21 = v19 ^ 1;
  id v32 = v11;
  uint64_t v22 = [v11 code];

  if (v22 != 6205) {
    goto LABEL_14;
  }
  if (v17 || !v18)
  {
    v21 |= !v18;
LABEL_14:
    id v23 = 0;
    id v11 = v32;
    if (v21) {
      goto LABEL_26;
    }
LABEL_18:
    v12[2](v12, v23);
    goto LABEL_29;
  }
  id v38 = 0;
  BOOL v24 = +[UAFAutoAssetManager latestAtomicInstanceFromMA:v9 error:&v38];
  id v23 = v38;
  if (v24 && ([v16 isEqualToString:v24] & 1) == 0)
  {
    id v25 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      char v41 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]";
      __int16 v42 = 2114;
      uint64_t v43 = v24;
      __int16 v44 = 2114;
      id v45 = v16;
      _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s Newer instance discovered from MA than is available to clients: %{public}@, client instance: %{public}@", buf, 0x20u);
    }

    id v11 = v32;
    goto LABEL_26;
  }

  id v11 = v32;
  if (v19) {
    goto LABEL_18;
  }
LABEL_26:
  id v26 = v11;
  id v27 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v9 assetSetIdentifier];
    *(_DWORD *)buf = 136315906;
    char v41 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]";
    __int16 v42 = 2114;
    uint64_t v43 = v28;
    __int16 v44 = 2114;
    id v45 = v33;
    __int16 v46 = 2114;
    __int16 v47 = v16;
    _os_log_impl(&dword_23797A000, v27, OS_LOG_TYPE_DEFAULT, "%s Discovered newer instance of %{public}@: %{public}@ vs %{public}@, XPC'ing to siriknowledged to lock", buf, 0x2Au);
  }
  long long v29 = +[UAFAutoAssetManager _createXPCConnection];
  long long v30 = [v9 assetSetIdentifier];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __98__UAFAutoAssetManager_conditionallyLockLatestAssetSet_newestInstance_checkAtomicError_completion___block_invoke;
  v34[3] = &unk_264CEC400;
  id v35 = v9;
  id v36 = v29;
  id v37 = v12;
  id v31 = v29;
  [v31 lockLatestAtomicInstance:v30 completion:v34];

  id v11 = v26;
LABEL_29:
}

void __98__UAFAutoAssetManager_conditionallyLockLatestAssetSet_newestInstance_checkAtomicError_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) assetSetIdentifier];
      int v6 = 136315650;
      uint64_t v7 = "+[UAFAutoAssetManager conditionallyLockLatestAssetSet:newestInstance:checkAtomicError:completion:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v5;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Could not lock latest instance of %{public}@: %{public}@", (uint8_t *)&v6, 0x20u);
    }
  }
  [*(id *)(a1 + 40) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v5 assetSetIdentifier];
      int v10 = 136315906;
      id v11 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@: Error while getting progress about %{public}@: %{public}@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 40) progress:v5];
  }
}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_412(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (!v9)
  {
    int v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = [*(id *)(a1 + 40) assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      __int16 v72 = 2114;
      uint64_t v73 = v22;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v23;
      _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: @Checked %{public}@", buf, 0x20u);
    }
    uint64_t v24 = 4;
    goto LABEL_58;
  }
  id v11 = [v9 domain];
  if (![v11 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {

    goto LABEL_14;
  }
  uint64_t v12 = [v10 code];

  if (v12 != 6115)
  {
LABEL_14:
    id v25 = [v10 domain];
    if ([v25 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"]
      && [v10 code] == 6107)
    {
      id v26 = [v10 userInfo];

      if (v26)
      {
        id v27 = [v10 userInfo];
        int v21 = [v27 objectForKeyedSubscript:*MEMORY[0x263F08608]];

        if (v21)
        {
          id v28 = [v21 domain];
          if ([v28 isEqualToString:@"com.apple.MobileAssetError.Download"])
          {
            uint64_t v29 = [v21 code];

            if (v29 == 37)
            {
              long long v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = *(void *)(a1 + 32);
                id v32 = [*(id *)(a1 + 40) assetSetIdentifier];
                *(_DWORD *)buf = 136315650;
                long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke";
                __int16 v72 = 2114;
                uint64_t v73 = v31;
                __int16 v74 = 2114;
                uint64_t v75 = (uint64_t)v32;
                _os_log_impl(&dword_23797A000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Out of space condition encountered for %{public}@", buf, 0x20u);
              }
              uint64_t v24 = 5;
LABEL_57:

              goto LABEL_58;
            }
          }
          else
          {
          }
          uint64_t v48 = [v21 domain];
          if ([v48 isEqualToString:@"com.apple.MobileAssetError.Download"])
          {
            uint64_t v49 = [v21 code];

            if (v49 == 44)
            {
              long long v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v50 = *(void *)(a1 + 32);
                id v51 = [*(id *)(a1 + 40) assetSetIdentifier];
                *(_DWORD *)buf = 136315906;
                long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:"
                      "progress:requestId:completion:]_block_invoke";
                __int16 v72 = 2114;
                uint64_t v73 = v50;
                __int16 v74 = 2114;
                uint64_t v75 = (uint64_t)v51;
                __int16 v76 = 2114;
                uint64_t v77 = (uint64_t)v10;
                _os_log_impl(&dword_23797A000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Not Found condition encountered for %{public}@: %{public}@", buf, 0x2Au);
              }
              uint64_t v24 = 4;
              goto LABEL_57;
            }
          }
          else
          {
          }
          uint64_t v52 = [v21 domain];
          int v53 = [v52 isEqualToString:@"com.apple.MobileAssetError.Download"];

          if (v53)
          {
            long long v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v54 = *(void *)(a1 + 32);
              uint64_t v55 = [*(id *)(a1 + 40) assetSetIdentifier];
              *(_DWORD *)buf = 136315906;
              long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:pr"
                    "ogress:requestId:completion:]_block_invoke";
              __int16 v72 = 2114;
              uint64_t v73 = v54;
              __int16 v74 = 2114;
              uint64_t v75 = (uint64_t)v55;
              __int16 v76 = 2114;
              uint64_t v77 = (uint64_t)v10;
              _os_log_impl(&dword_23797A000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Network related error condition encountered for %{public}@: %{public}@", buf, 0x2Au);
            }
            uint64_t v24 = 7;
            goto LABEL_57;
          }
        }
        long long v30 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v56 = *(void *)(a1 + 32);
          uint64_t v57 = [*(id *)(a1 + 40) assetSetIdentifier];
          *(_DWORD *)buf = 136315906;
          long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progre"
                "ss:requestId:completion:]_block_invoke";
          __int16 v72 = 2114;
          uint64_t v73 = v56;
          __int16 v74 = 2114;
          uint64_t v75 = (uint64_t)v57;
          __int16 v76 = 2114;
          uint64_t v77 = (uint64_t)v10;
          _os_log_impl(&dword_23797A000, v30, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Error condition encountered for %{public}@: %{public}@", buf, 0x2Au);
        }
        uint64_t v24 = 6;
        goto LABEL_57;
      }
    }
    else
    {
    }
    unsigned __int8 v33 = [v10 domain];
    if ([v33 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
    {
      uint64_t v34 = [v10 code];

      if (v34 == 6209)
      {
        id v35 = [v10 userInfo];
        int v21 = [v35 objectForKeyedSubscript:@"DownloadSpaceDetails"];

        id v36 = [v21 objectForKeyedSubscript:@"TotalRequiredSpaceForSetDownload"];
        id v37 = [v21 objectForKeyedSubscript:@"StillNeededSpaceForSetDownload"];
        id v38 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v64 = *(void *)(a1 + 32);
          uint64_t v63 = [v36 integerValue];
          uint64_t v61 = [v37 integerValue];
          __int16 v62 = [*(id *)(a1 + 40) assetSetIdentifier];
          *(_DWORD *)buf = 136316418;
          long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progre"
                "ss:requestId:completion:]_block_invoke";
          __int16 v72 = 2114;
          uint64_t v73 = v64;
          __int16 v74 = 2048;
          uint64_t v75 = v63;
          __int16 v76 = 2048;
          uint64_t v77 = v61;
          __int16 v78 = 2114;
          id v79 = v62;
          __int16 v80 = 2114;
          __int16 v81 = v10;
          _os_log_error_impl(&dword_23797A000, v38, OS_LOG_TYPE_ERROR, "%s %{public}@: Out of Space condition encountered (total: %lld, needed: %lld) for the set %{public}@: %{public}@", buf, 0x3Eu);
        }
        uint64_t v24 = 5;
        goto LABEL_58;
      }
    }
    else
    {
    }
    uint64_t v39 = [v10 domain];
    if ([v39 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
    {
      uint64_t v40 = [v10 code];

      if (v40 == 6205)
      {
        uint64_t v24 = 4;
LABEL_59:
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_422;
        v65[3] = &unk_264CEC450;
        uint64_t v58 = *(void *)(a1 + 40);
        id v66 = *(id *)(a1 + 48);
        id v67 = *(id *)(a1 + 40);
        uint64_t v69 = v24;
        id v68 = *(id *)(a1 + 56);
        +[UAFAutoAssetManager conditionallyLockLatestAssetSet:v58 newestInstance:v7 checkAtomicError:v10 completion:v65];

        goto LABEL_60;
      }
    }
    else
    {
    }
    int v21 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = *(void *)(a1 + 32);
      id v60 = [*(id *)(a1 + 40) assetSetIdentifier];
      *(_DWORD *)buf = 136315906;
      long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      __int16 v72 = 2114;
      uint64_t v73 = v59;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v60;
      __int16 v76 = 2114;
      uint64_t v77 = (uint64_t)v10;
      _os_log_error_impl(&dword_23797A000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not check auto asset set %{public}@: %{public}@", buf, 0x2Au);
    }
    uint64_t v24 = 6;
LABEL_58:

    goto LABEL_59;
  }
  uint64_t v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = [*(id *)(a1 + 40) assetSetIdentifier];
    *(_DWORD *)buf = 136315650;
    long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:req"
          "uestId:completion:]_block_invoke";
    __int16 v72 = 2114;
    uint64_t v73 = v14;
    __int16 v74 = 2114;
    uint64_t v75 = (uint64_t)v15;
    _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Checking %{public}@ was cancelled, retrying", buf, 0x20u);
  }
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) < 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
    if (WeakRetained)
    {
      __int16 v42 = *(void **)(a1 + 40);
      uint64_t v43 = +[UAFAutoAssetManager getReason:v42 operation:@"checking"];
      [v42 checkAtomic:v43 forAtomicInstance:0 awaitingDownload:1 withNeedPolicy:*(void *)(a1 + 64) withTimeout:-2 reportingProgress:*(void *)(a1 + 72) completion:WeakRetained];
    }
    else
    {
      __int16 v44 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress"
              ":requestId:completion:]_block_invoke";
        __int16 v72 = 2114;
        uint64_t v73 = v45;
        _os_log_impl(&dword_23797A000, v44, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No strong completion routine, exiting retry cycle", buf, 0x16u);
      }

      __int16 v46 = *(void **)(a1 + 48);
      __int16 v47 = [*(id *)(a1 + 40) assetSetIdentifier];
      [v46 finished:v47 withStatus:6];

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }
  }
  else
  {
    __int16 v16 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [*(id *)(a1 + 40) assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      long long v71 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:r"
            "equestId:completion:]_block_invoke";
      __int16 v72 = 2114;
      uint64_t v73 = v17;
      __int16 v74 = 2114;
      uint64_t v75 = (uint64_t)v18;
      _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Retry count exceeded for %{public}@", buf, 0x20u);
    }
    int v19 = *(void **)(a1 + 48);
    id v20 = [*(id *)(a1 + 40) assetSetIdentifier];
    [v19 finished:v20 withStatus:6];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
LABEL_60:
}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_422(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) assetSetIdentifier];
  if (a2) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = *(void *)(a1 + 56);
  }
  [v4 finished:v5 withStatus:v6];

  id v7 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v7);
}

void __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_423(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_2;
  v3[3] = &unk_264CEB0F8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 updateFinished:v3];
}

uint64_t __129__UAFAutoAssetManager_updateAutoAssetsFromAssetSetUsages_configurationManager_expensiveNetworking_progress_requestId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) allKeys];
    int v6 = 136315650;
    id v7 = "+[UAFAutoAssetManager updateAutoAssetsFromAssetSetUsages:configurationManager:expensiveNetworking:progress:requ"
         "estId:completion:]_block_invoke_2";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Updates asset sets %{public}@ complete", (uint8_t *)&v6, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (unint64_t)getDownloadStatusFromMAAutoAssetSetStatus:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 availableForUseError];
  id v5 = [v4 domain];
  if (([v5 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"] & 1) == 0)
  {

LABEL_7:
    uint64_t v15 = [v3 downloadProgress];

    if (v15)
    {
      __int16 v16 = [v3 downloadProgress];
      int v17 = [v16 isStalled];

      if (v17) {
        unint64_t v14 = 3;
      }
      else {
        unint64_t v14 = 2;
      }
    }
    else
    {
      unint64_t v14 = 4;
    }
    goto LABEL_12;
  }
  int v6 = [v3 availableForUseError];
  uint64_t v7 = [v6 code];

  if (v7 != 6209) {
    goto LABEL_7;
  }
  __int16 v8 = [v3 availableForUseError];
  uint64_t v9 = [v8 userInfo];
  __int16 v10 = [v9 objectForKeyedSubscript:@"DownloadSpaceDetails"];

  id v11 = [v10 objectForKeyedSubscript:@"TotalRequiredSpaceForSetDownload"];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"StillNeededSpaceForSetDownload"];
  uint64_t v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = [v11 integerValue];
    uint64_t v20 = [v12 integerValue];
    int v21 = [v3 assetSetIdentifier];
    int v22 = 136315906;
    id v23 = "+[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:]";
    __int16 v24 = 2048;
    uint64_t v25 = v19;
    __int16 v26 = 2048;
    uint64_t v27 = v20;
    __int16 v28 = 2114;
    uint64_t v29 = v21;
    _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, "%s Out of Space condition encountered (total: %lld, needed: %lld) for the set %{public}@", (uint8_t *)&v22, 0x2Au);
  }
  unint64_t v14 = 5;
LABEL_12:

  return v14;
}

+ (id)assetSetNamesFromUsages:(id)a3 configurationManager:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[UAFConfigurationManager defaultManager];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    id v11 = 0;
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v9 = 136315394;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v6, "getAssetSet:", v14, v20, (void)v21);
        __int16 v16 = v15;
        if (v15)
        {
          int v17 = [v15 autoAssetType];

          if (v17)
          {
            if (!v11) {
              id v11 = objc_opt_new();
            }
            uint64_t v18 = [v16 name];
            [v11 addObject:v18];
          }
          else
          {
            uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              __int16 v26 = "+[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:]";
              __int16 v27 = 2114;
              uint64_t v28 = v14;
              _os_log_debug_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            __int16 v26 = "+[UAFAutoAssetManager assetSetNamesFromUsages:configurationManager:]";
            __int16 v27 = 2114;
            uint64_t v28 = v14;
            _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Could not get configuration for for asset set %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)autoAssetSetForStatus:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F55980]);
  id v5 = +[UAFAutoAssetManager getConcurrentQueue];
  id v11 = 0;
  id v6 = (void *)[v4 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v3 comprisedOfEntries:0 completingFromQueue:v5 error:&v11];
  id v7 = v11;

  if (v7)
  {
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "+[UAFAutoAssetManager autoAssetSetForStatus:]";
      __int16 v14 = 2114;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ for status: %{public}@", buf, 0x20u);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

+ (unint64_t)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v24 = objc_opt_new();
  long long v22 = v6;
  long long v23 = v5;
  id v7 = +[UAFAutoAssetManager assetSetNamesFromUsages:v5 configurationManager:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = +[UAFAutoAssetManager autoAssetSetForStatus:v12];
        id v25 = 0;
        __int16 v14 = [v13 currentSetStatusSync:&v25];
        id v15 = v25;
        __int16 v16 = v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          unint64_t v19 = +[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:v14];
          uint64_t v18 = [NSNumber numberWithUnsignedInteger:v19];
          [v24 setObject:v18 forKeyedSubscript:v12];
        }
        else
        {
          uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v31 = "+[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:]";
            __int16 v32 = 2114;
            uint64_t v33 = v12;
            __int16 v34 = 2114;
            id v35 = v16;
            _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v9);
  }
  unint64_t v20 = +[UAFAssetSetManager coalesceDownloadStatus:v24];

  return v20;
}

+ (void)getDownloadStatusFromAssetSetUsages:(id)a3 configurationManager:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v24 = a6;
  unint64_t v12 = 0x264CEA000uLL;
  if (!v11)
  {
    id v11 = +[UAFAutoAssetManager getConcurrentQueue];
  }
  uint64_t v13 = objc_opt_new();
  __int16 v14 = dispatch_group_create();
  id v25 = v10;
  long long v26 = v9;
  +[UAFAutoAssetManager assetSetNamesFromUsages:v9 configurationManager:v10];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(*(id *)(v12 + 2312), "autoAssetSetForStatus:", v19, v24);
        v21 = unint64_t v20 = v12;
        dispatch_group_enter(v14);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke;
        v31[3] = &unk_264CEC4C8;
        v31[4] = v19;
        __int16 v32 = v14;
        id v33 = v13;
        [v21 currentSetStatus:v31];

        unint64_t v12 = v20;
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke_424;
  block[3] = &unk_264CEB0B0;
  id v29 = v13;
  id v30 = v24;
  id v22 = v24;
  id v23 = v13;
  dispatch_group_notify(v14, v11, block);
}

void __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 136315650;
      __int16 v14 = "+[UAFAutoAssetManager getDownloadStatusFromAssetSetUsages:configurationManager:queue:completion:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s Could not get status of auto asset set %{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    unint64_t v8 = +[UAFAutoAssetManager getDownloadStatusFromMAAutoAssetSetStatus:v5];
    id v9 = *(id *)(a1 + 48);
    objc_sync_enter(v9);
    id v10 = [NSNumber numberWithUnsignedInteger:v8];
    [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:*(void *)(a1 + 32)];

    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __97__UAFAutoAssetManager_getDownloadStatusFromAssetSetUsages_configurationManager_queue_completion___block_invoke_424(uint64_t a1)
{
  +[UAFAssetSetManager coalesceDownloadStatus:*(void *)(a1 + 32)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (BOOL)shouldWaitForMobileAssetStart:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"]
      && [v4 code] == 6108)
    {
      id v6 = [v4 localizedDescription];
      if (v6)
      {
        id v7 = [v4 localizedDescription];
        char v8 = [v7 containsString:@"AtomicEntry in locked set-status for secure grafted/mounted auto-asset where required content is missing"];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (void)waitForMobileAssetStart:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  char v8 = (objc_class *)MEMORY[0x263F55980];
  id v9 = a4;
  id v10 = a3;
  id v16 = 0;
  id v11 = (void *)[[v8 alloc] initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v10 comprisedOfEntries:0 completingFromQueue:v9 error:&v16];

  id v12 = v16;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__UAFAutoAssetManager_waitForMobileAssetStart_queue_completion___block_invoke;
  v14[3] = &unk_264CEC4F0;
  id v15 = v7;
  id v13 = v7;
  [v11 currentSetStatus:v14];
}

uint64_t __64__UAFAutoAssetManager_waitForMobileAssetStart_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)autoAssetExistsWithEntries:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v19 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F55980]) initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v3 comprisedOfEntries:0 error:&v19];
  id v5 = v19;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v11 = v5;
    id v9 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
      __int16 v22 = 2114;
      id v23 = v3;
      __int16 v24 = 2114;
      id v25 = v11;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    BOOL v7 = 0;
  }
  else
  {
    char v8 = +[UAFAutoAssetManager getReason:v4 operation:@"checking"];
    id v17 = 0;
    id v18 = 0;
    id v9 = [v4 checkAtomicSync:v8 forAtomicInstance:0 withTimeout:0 discoveredAtomicEntries:&v18 error:&v17];
    id v10 = v18;
    id v11 = v17;

    id v12 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    id v13 = v12;
    if (v9) {
      BOOL v14 = v11 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v10 count];
        *(_DWORD *)buf = 136315906;
        long long v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2114;
        id v25 = v3;
        __int16 v26 = 2048;
        uint64_t v27 = v15;
        _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s Found existing instance %@ of auto asset set %{public}@ with %lu entries", buf, 0x2Au);
      }

      BOOL v7 = [v10 count] != 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        long long v21 = "+[UAFAutoAssetManager autoAssetExistsWithEntries:]";
        __int16 v22 = 2114;
        id v23 = v3;
        __int16 v24 = 2114;
        id v25 = v11;
        _os_log_debug_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEBUG, "%s Auto asset set %{public}@ does not exist with entries: %{public}@", buf, 0x20u);
      }

      BOOL v7 = 0;
    }
  }
  return v7;
}

+ (void)_logDailyStatusEventForAssetSetArrived:(id)a3 entries:(id)a4 assetSetArrived:(BOOL)a5
{
  BOOL v60 = a5;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v68 = 0;
  char v8 = [v6 currentSetStatusSync:&v68];
  id v9 = v68;
  if (v9)
  {
    id v10 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = [v6 assetSetIdentifier];
      *(_DWORD *)buf = 136315650;
      __int16 v72 = "+[UAFAutoAssetManager _logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:]";
      __int16 v73 = 2114;
      *(void *)__int16 v74 = v56;
      *(_WORD *)&v74[8] = 2114;
      *(void *)&v74[10] = v9;
      _os_log_debug_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEBUG, "%s Could not get status of auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
  }
  uint64_t v59 = v9;
  id v11 = objc_alloc_init(MEMORY[0x263F6F130]);
  uint64_t v61 = v6;
  id v12 = [v6 assetSetIdentifier];
  [v11 setAssetSetName:v12];

  __int16 v62 = v8;
  id v13 = [v8 downloadedCatalogCachedAssetSetID];
  uint64_t v63 = v11;
  [v11 setAssetSetId:v13];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(v15);
        }
        unint64_t v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v21 = objc_alloc_init(MEMORY[0x263F6F120]);
        __int16 v22 = [v20 fullAssetSelector];
        id v23 = [v22 assetSpecifier];
        [v21 setAssetName:v23];

        __int16 v24 = [v20 fullAssetSelector];
        id v25 = [v24 assetVersion];
        [v21 setAssetVersion:v25];

        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v17);
  }

  __int16 v26 = v63;
  [v63 setAssets:v14];
  uint64_t v27 = objc_opt_new();
  uint64_t v28 = v62;
  id v29 = [v62 availableForUseError];

  if (v29)
  {
    id v30 = v27;
    uint64_t v31 = objc_opt_new();
    __int16 v32 = [v62 availableForUseError];
    id v33 = [v32 domain];
    if ([v33 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
    {
      long long v34 = [v62 availableForUseError];
      if ([v34 code] == 6107)
      {
        long long v35 = [v62 availableForUseError];
        long long v36 = [v35 userInfo];

        uint64_t v28 = v62;
        if (v36)
        {
          long long v37 = [v62 availableForUseError];
          id v38 = [v37 userInfo];
          uint64_t v39 = [v38 objectForKeyedSubscript:*MEMORY[0x263F08608]];

          objc_msgSend(v31, "setMobileAssetDownloadErrorCode:", objc_msgSend(v39, "code"));
          uint64_t v40 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            int v41 = [v39 code];
            __int16 v42 = [v61 assetSetIdentifier];
            *(_DWORD *)buf = 136315650;
            __int16 v72 = "+[UAFAutoAssetManager _logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:]";
            __int16 v73 = 1024;
            *(_DWORD *)__int16 v74 = v41;
            *(_WORD *)&v74[4] = 2114;
            *(void *)&v74[6] = v42;
            _os_log_impl(&dword_23797A000, v40, OS_LOG_TYPE_DEFAULT, "%s Underlying error: %u found while logging MA download error for asset set %{public}@:", buf, 0x1Cu);
          }
          goto LABEL_22;
        }
LABEL_21:
        uint64_t v39 = [v28 availableForUseError];
        objc_msgSend(v31, "setMobileAssetDownloadErrorCode:", objc_msgSend(v39, "code"));
LABEL_22:

        [v31 setTimesOccurred:1];
        uint64_t v27 = v30;
        [v30 addObject:v31];

        __int16 v26 = v63;
        goto LABEL_23;
      }
    }
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v43 = [v28 newerVersionError];

  if (!v43) {
    goto LABEL_30;
  }
  if (v29)
  {
    uint64_t v58 = v27;
    __int16 v44 = [v28 newerVersionError];
    uint64_t v45 = [v44 domain];
    __int16 v46 = [v28 availableForUseError];
    __int16 v47 = [v46 domain];
    if (![v45 isEqualToString:v47])
    {

      uint64_t v27 = v58;
      goto LABEL_29;
    }
    uint64_t v48 = [v28 newerVersionError];
    uint64_t v57 = [v48 code];
    uint64_t v49 = [v28 availableForUseError];
    uint64_t v50 = [v49 code];

    uint64_t v28 = v62;
    uint64_t v27 = v58;
    BOOL v51 = v57 == v50;
    __int16 v26 = v63;
    if (v51) {
      goto LABEL_30;
    }
  }
  __int16 v44 = objc_opt_new();
  uint64_t v52 = [v28 newerVersionError];
  objc_msgSend(v44, "setMobileAssetDownloadErrorCode:", objc_msgSend(v52, "code"));

  [v44 setTimesOccurred:1];
  [v27 addObject:v44];
LABEL_29:

LABEL_30:
  [v26 setMobileAssetDownloadErrorCodeFrequencys:v27];
  int v53 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = [v61 assetSetIdentifier];
    *(_DWORD *)buf = 136315394;
    __int16 v72 = "+[UAFAutoAssetManager _logDailyStatusEventForAssetSetArrived:entries:assetSetArrived:]";
    __int16 v73 = 2114;
    *(void *)__int16 v74 = v54;
    _os_log_impl(&dword_23797A000, v53, OS_LOG_TYPE_DEFAULT, "%s Emitting asset set arrived daily status event for auto asset set %{public}@:", buf, 0x16u);
  }
  uint64_t v69 = v26;
  uint64_t v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
  +[UAFInstrumentationProvider logUAFAssetSetDailyStatus:v55 assetSetArrived:v60];
}

+ (id)spaceNeededForAssetSetUsages:(id)a3 key:(id)a4 configurationManager:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v9 = +[UAFConfigurationManager defaultManager];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v30 = 0;
    uint64_t v13 = *(void *)v32;
    id v14 = (void **)&UAFLogContextMAConfig;
    *(void *)&long long v11 = 136315394;
    long long v26 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v9, "getAssetSet:", v16, v26);
        uint64_t v18 = v17;
        if (v17)
        {
          id v19 = [v17 autoAssetType];

          if (v19)
          {
            unint64_t v20 = [(id)objc_opt_class() sizeInBytesForConfig:v18 key:v29 error:a6];
            uint64_t v21 = [v20 unsignedLongLongValue];
            __int16 v22 = v14;
            id v23 = UAFGetLogCategory(v14);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              long long v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
              __int16 v37 = 2114;
              uint64_t v38 = v16;
              __int16 v39 = 2048;
              uint64_t v40 = v21;
              __int16 v41 = 2114;
              id v42 = v29;
              _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s Configured asset name %{public}@ with size %llu for key %{public}@", buf, 0x2Au);
            }

            v30 += v21;
            id v14 = v22;
          }
          else
          {
            unint64_t v20 = UAFGetLogCategory(v14);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              long long v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
              __int16 v37 = 2114;
              uint64_t v38 = v16;
              _os_log_debug_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEBUG, "%s No auto asset type defined for %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          unint64_t v20 = UAFGetLogCategory(v14);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            long long v36 = "+[UAFAutoAssetManager spaceNeededForAssetSetUsages:key:configurationManager:error:]";
            __int16 v37 = 2114;
            uint64_t v38 = v16;
            _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s Could get not get configuration for for asset set %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v30 = 0;
  }

  __int16 v24 = [NSNumber numberWithUnsignedLongLong:v30];

  return v24;
}

+ (id)sizeInBytesForConfig:(id)a3 key:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x263F55980]);
  uint64_t v44 = v7;
  uint64_t v10 = [v7 name];
  long long v11 = +[UAFAutoAssetManager getConcurrentQueue];
  id v60 = 0;
  uint64_t v12 = (void *)[v9 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:@"manager" forAssetSetIdentifier:v10 comprisedOfEntries:0 completingFromQueue:v11 error:&v60];
  id v13 = v60;

  if (v13)
  {
    id v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      uint64_t v17 = 0;
      goto LABEL_9;
    }
    id v15 = [v44 name];
    *(_DWORD *)buf = 136315650;
    __int16 v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
    __int16 v63 = 2114;
    long long v64 = v15;
    __int16 v65 = 2114;
    uint64_t v66 = (uint64_t)v13;
    _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
LABEL_7:

    goto LABEL_8;
  }
  id v59 = 0;
  id v14 = [v12 currentSetStatusSync:&v59];
  id v16 = v59;
  if (v16)
  {
    id v13 = v16;
    id v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = [v44 name];
      *(_DWORD *)buf = 136315650;
      __int16 v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
      __int16 v63 = 2114;
      long long v64 = v41;
      __int16 v65 = 2114;
      uint64_t v66 = (uint64_t)v13;
      _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  id v42 = a5;
  uint64_t v43 = v12;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [v14 newerDiscoveredAtomicEntries];
  uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
  uint64_t v19 = 0;
  if (v49)
  {
    uint64_t v48 = *(void *)v56;
    unint64_t v20 = (void **)&UAFLogContextClient;
    id v46 = v8;
    __int16 v47 = v14;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(obj);
        }
        __int16 v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v23 = [v14 latestDowloadedAtomicInstanceEntries];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          long long v26 = v20;
          uint64_t v50 = v19;
          uint64_t v27 = *(void *)v52;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v52 != v27) {
                objc_enumerationMutation(v23);
              }
              id v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              uint64_t v30 = [v22 fullAssetSelector];
              long long v31 = [v29 fullAssetSelector];
              char v32 = [v30 isEqual:v31];

              if (v32)
              {

                unint64_t v20 = v26;
                id v23 = UAFGetLogCategory(v26);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  long long v33 = [v22 assetID];
                  *(_DWORD *)buf = 136315394;
                  __int16 v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
                  __int16 v63 = 2114;
                  long long v64 = v33;
                  _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s Newer asset entry %{public}@ skipped due to having a latest downloaded entry", buf, 0x16u);
                }
                id v8 = v46;
                id v14 = v47;
                uint64_t v19 = v50;
                goto LABEL_29;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v69 count:16];
            if (v25) {
              continue;
            }
            break;
          }
          id v14 = v47;
          uint64_t v19 = v50;
          unint64_t v20 = v26;
          id v8 = v46;
        }
LABEL_29:

        long long v34 = [v22 assetAttributes];
        long long v35 = [v34 objectForKey:v8];

        if (v35)
        {
          uint64_t v36 = [v35 unsignedLongLongValue];
          __int16 v37 = UAFGetLogCategory(v20);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = [v22 assetID];
            *(_DWORD *)buf = 136315906;
            __int16 v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
            __int16 v63 = 2114;
            long long v64 = v38;
            __int16 v65 = 2048;
            uint64_t v66 = v36;
            __int16 v67 = 2114;
            id v68 = v8;
            _os_log_impl(&dword_23797A000, v37, OS_LOG_TYPE_DEFAULT, "%s Newer asset entry %{public}@ has download size %llu for key %{public}@", buf, 0x2Au);
          }
          v19 += v36;
        }
        else
        {
          __int16 v39 = UAFGetLogCategory(v20);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = [v44 autoAssetType];
            *(_DWORD *)buf = 136315650;
            __int16 v62 = "+[UAFAutoAssetManager sizeInBytesForConfig:key:error:]";
            __int16 v63 = 2114;
            long long v64 = v40;
            __int16 v65 = 2114;
            uint64_t v66 = (uint64_t)v8;
            _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Newer asset entry %{public}@ missing download size metadata for key %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v70 count:16];
    }
    while (v49);
  }

  if (v42) {
    *id v42 = 0;
  }
  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v19];
  id v13 = 0;
  uint64_t v12 = v43;
LABEL_9:

  return v17;
}

@end