@interface UAFTrialUpdateManager
+ (BOOL)isOnDemand:(id)a3;
+ (BOOL)isPresent:(id)a3;
+ (BOOL)isRemoveAllowed;
+ (BOOL)isSubscribed:(id)a3;
+ (BOOL)updateNamespaces:(id)a3 missingRolloutsOnly:(BOOL)a4 expensiveNetworking:(BOOL)a5 assetSetNamespaces:(id)a6 updateProgress:(id)a7;
+ (id)filterOnDemandFactors:(id)a3 namespaceName:(id)a4 trialClient:(id)a5;
+ (id)getConcurrentQueue;
+ (id)getSerialQueue;
+ (id)getTrialFactors:(id)a3 configurationManager:(id)a4 includeAllAssetSets:(BOOL)a5 noRemovalNamespaces:(id *)a6 assetSetNamespaces:(id *)a7;
+ (id)trialClientWithProject:(id)a3;
+ (unint64_t)getTrialDownloadStatusForUsages:(id)a3 configurationManager:(id)a4;
+ (unint64_t)sizeFromLevel:(id)a3;
+ (void)checkForOutOfSpace:(id)a3 updateProgress:(id)a4;
+ (void)getKnownFactors:(id)a3 namespace:(id)a4 knownFactors:(id *)a5 onDemandFactors:(id *)a6;
+ (void)updateOnDemandFactors:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11;
+ (void)updateTrialFactors:(id)a3 rolloutUpdateMode:(int64_t)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 assetSetNamespaces:(id)a10 progress:(id)a11 completion:(id)a12;
+ (void)updateTrialFromAssetSetUsages:(id)a3 rolloutUpdateMode:(int64_t)a4 expensiveNetworking:(BOOL)a5 storeManager:(id)a6 configurationManager:(id)a7 progress:(id)a8 completion:(id)a9;
+ (void)updateTrialFromAssetSetUsages:(id)a3 storeManager:(id)a4 configurationManager:(id)a5;
+ (void)updateTrialProject:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11;
@end

@implementation UAFTrialUpdateManager

void *__188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_303(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result onDemandFactorsStarted];
  }
  return result;
}

uint64_t __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_4(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  if (v2 && [v2 count])
  {
    v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v8 = 136315138;
    v9 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke";
    v4 = "%s All per-project updates complete as part of update for of all trial assets";
  }
  else
  {
    v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v8 = 136315138;
    v9 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke_4";
    v4 = "%s No trial assets to update";
  }
  _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, 0xCu);
LABEL_8:

  v6 = (void *)a1[5];
  if (v6) {
    [v6 updateFinished];
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

+ (void)updateTrialFromAssetSetUsages:(id)a3 rolloutUpdateMode:(int64_t)a4 expensiveNetworking:(BOOL)a5 storeManager:(id)a6 configurationManager:(id)a7 progress:(id)a8 completion:(id)a9
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]";
    _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s Configuring Trial from asset set usages", buf, 0xCu);
  }

  v20 = +[UAFTrialUpdateManager getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __147__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_rolloutUpdateMode_expensiveNetworking_storeManager_configurationManager_progress_completion___block_invoke;
  block[3] = &unk_264CEB308;
  id v27 = v14;
  id v28 = v16;
  BOOL v33 = a5;
  id v29 = v15;
  id v30 = v17;
  id v31 = v18;
  int64_t v32 = a4;
  id v21 = v18;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  id v25 = v14;
  dispatch_async(v20, block);
}

+ (id)getSerialQueue
{
  if (qword_26AF0B948 != -1) {
    dispatch_once(&qword_26AF0B948, &__block_literal_global_283);
  }
  v2 = (void *)qword_26AF0B950;

  return v2;
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2_304(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    v2 = +[UAFTrialUpdateManager getSerialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_3;
    block[3] = &unk_264CEB290;
    id v5 = *(id *)(a1 + 40);
    char v9 = *(unsigned char *)(a1 + 72);
    id v6 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v2, block);
  }
  else
  {
    v3 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v3);
  }
}

void __147__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_rolloutUpdateMode_expensiveNetworking_storeManager_configurationManager_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  v4 = +[UAFTrialUpdateManager getTrialFactors:v2 configurationManager:v3 includeAllAssetSets:0 noRemovalNamespaces:0 assetSetNamespaces:&v8];
  id v5 = v8;
  id v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]_block_invoke";
    __int16 v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEBUG, "%s All trial factors now %{public}@", buf, 0x16u);
  }

  +[UAFTrialUpdateManager updateTrialFactors:v4 rolloutUpdateMode:*(void *)(a1 + 72) removeUnneededFactors:0 expensiveNetworking:*(unsigned __int8 *)(a1 + 80) updateCount:0 storeManager:*(void *)(a1 + 48) noRemovalNamespaces:0 assetSetNamespaces:v5 progress:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:rolloutUpdateMode:expensiveNetworking:storeManager:confi"
          "gurationManager:progress:completion:]_block_invoke";
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished configuring Trial from asset set usages", buf, 0xCu);
  }
}

+ (void)updateTrialFactors:(id)a3 rolloutUpdateMode:(int64_t)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 assetSetNamespaces:(id)a10 progress:(id)a11 completion:(id)a12
{
  BOOL v55 = a6;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v54 = a8;
  id v53 = a9;
  id v15 = a10;
  id v16 = a11;
  id v48 = a12;
  if (v16) {
    id v17 = [[UAFTrialUpdateProgress alloc] initWithTrialFactors:v14 detailedProgressWithStatus:v16];
  }
  else {
    id v17 = 0;
  }
  v49 = v16;
  if ((unint64_t)a4 > 2) {
    id v18 = 0;
  }
  else {
    id v18 = off_264CEB348[a4];
  }
  v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v86 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateC"
          "ount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]";
    __int16 v87 = 2114;
    v88 = v18;
    _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces for %{public}@ prior to on-demand factor downloading", buf, 0x16u);
  }

  if (v17) {
    [(UAFTrialUpdateProgress *)v17 updateStarted];
  }
  v46 = v15;
  int64_t v47 = a4;
  v52 = v17;
  +[UAFTrialUpdateManager updateNamespaces:v14 missingRolloutsOnly:a4 != 2 expensiveNetworking:v55 assetSetNamespaces:v15 updateProgress:v17];
  v20 = dispatch_group_create();
  id v21 = dispatch_group_create();
  group = dispatch_group_create();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v22 = v14;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v81 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(__CFString **)(*((void *)&v80 + 1) + 8 * i);
        id v28 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v86 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:u"
                "pdateCount:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]";
          __int16 v87 = 2114;
          v88 = v27;
          _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s Updating trial assets in project %{public}@ as part of update of all trial assets", buf, 0x16u);
        }

        id v29 = v27;
        id v30 = [v22 objectForKeyedSubscript:v29];
        dispatch_group_enter(v20);
        dispatch_group_enter(v21);
        id v31 = +[UAFTrialUpdateManager getConcurrentQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke;
        block[3] = &unk_264CEB268;
        v70 = v29;
        id v71 = v30;
        BOOL v78 = a5;
        BOOL v79 = v55;
        unint64_t v77 = a7;
        id v72 = v54;
        id v73 = v53;
        v74 = v52;
        v75 = v21;
        v76 = v20;
        id v32 = v30;
        BOOL v33 = v29;
        dispatch_async(v31, block);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v80 objects:v84 count:16];
    }
    while (v24);
  }

  dispatch_group_enter(group);
  v34 = +[UAFTrialUpdateManager getConcurrentQueue];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_303;
  v67[3] = &unk_264CEAB50;
  v35 = v52;
  v68 = v35;
  dispatch_group_notify(v20, v34, v67);

  uint64_t v36 = +[UAFTrialUpdateManager getConcurrentQueue];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2_304;
  v60[3] = &unk_264CEB2B8;
  int64_t v65 = v47;
  v61 = group;
  id v37 = v22;
  BOOL v66 = v55;
  id v62 = v37;
  id v63 = v46;
  v38 = v35;
  v64 = v38;
  id v39 = v46;
  v40 = group;
  dispatch_group_notify(v21, v36, v60);

  v41 = +[UAFTrialUpdateManager getConcurrentQueue];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_4;
  v56[3] = &unk_264CEB0F8;
  id v57 = v37;
  v58 = v38;
  id v59 = v48;
  id v42 = v48;
  v43 = v38;
  id v44 = v37;
  dispatch_group_notify(v40, v41, v56);
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)qword_26AF0B940;

  return v2;
}

+ (BOOL)updateNamespaces:(id)a3 missingRolloutsOnly:(BOOL)a4 expensiveNetworking:(BOOL)a5 assetSetNamespaces:(id)a6 updateProgress:(id)a7
{
  BOOL v9 = a5;
  BOOL v60 = a4;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v55 = a6;
  id v11 = a7;
  v12 = v11;
  if (v10)
  {
    BOOL v52 = v9;
    id v53 = v11;
    v61 = objc_opt_new();
    uint64_t v13 = objc_opt_new();
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v54 = v10;
    obuint64_t j = v10;
    uint64_t v57 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v57)
    {
      uint64_t v56 = *(void *)v72;
      do
      {
        uint64_t v14 = 0;
        do
        {
          id v15 = v13;
          if (*(void *)v72 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v59 = v14;
          uint64_t v16 = *(void *)(*((void *)&v71 + 1) + 8 * v14);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v17 = [obj objectForKeyedSubscript:v16];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v82 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v68;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v68 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                uint64_t v23 = (void *)MEMORY[0x237E26B30]();
                uint64_t v24 = +[UAFTrialUpdateManager trialClientWithProject:v16];
                uint64_t v25 = v24;
                if (v24)
                {
                  if (!v60
                    || ([v24 rolloutIdentifiersWithNamespaceName:v22],
                        v26 = objc_claimAutoreleasedReturnValue(),
                        v26,
                        id v27 = v15,
                        !v26))
                  {
                    id v27 = v61;
                  }
                  [v27 addObject:v22];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v82 count:16];
            }
            while (v19);
          }

          uint64_t v13 = v15;
          if (v60)
          {
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v28 = v55;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v81 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v64;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v64 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v63 + 1) + 8 * j);
                  v34 = [v28 objectForKeyedSubscript:v33];
                  int v35 = [v34 intersectsSet:v15];

                  if (v35)
                  {
                    uint64_t v36 = UAFGetLogCategory((void **)&UAFLogContextClient);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      id v37 = [v28 objectForKeyedSubscript:v33];
                      *(_DWORD *)buf = 136315394;
                      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNam"
                            "espaces:updateProgress:]";
                      __int16 v77 = 2114;
                      BOOL v78 = v37;
                      _os_log_impl(&dword_23797A000, v36, OS_LOG_TYPE_DEFAULT, "%s Not updating the following namespaces, as at least one already exists within the same assetset: %{public}@", buf, 0x16u);
                    }
                    v38 = [v28 objectForKeyedSubscript:v33];
                    id v39 = [v38 allObjects];
                    [v61 removeObjectsInArray:v39];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v63 objects:v81 count:16];
              }
              while (v30);
            }
          }
          uint64_t v14 = v59 + 1;
        }
        while (v59 + 1 != v57);
        uint64_t v57 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v57);
    }

    v40 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
      _os_log_impl(&dword_23797A000, v40, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces", buf, 0xCu);
    }

    v12 = v53;
    if ([v61 count])
    {
      v41 = [obj allKeys];
      id v42 = [v41 firstObject];

      uint64_t v43 = +[UAFTrialUpdateManager trialClientWithProject:v42];
      if (!v43)
      {
        char v47 = 0;
LABEL_51:

        id v10 = v54;
        goto LABEL_52;
      }
      id v44 = (void *)v43;
      v45 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
        __int16 v77 = 2114;
        BOOL v78 = v61;
        _os_log_impl(&dword_23797A000, v45, OS_LOG_TYPE_DEFAULT, "%s Updating namespaces %{public}@", buf, 0x16u);
      }

      v46 = [MEMORY[0x263EFF9C0] setWithArray:v61];
      id v62 = 0;
      char v47 = [v44 immediateDownloadForNamespaceNames:v46 allowExpensiveNetworking:v52 error:&v62];
      id v48 = v62;

      v49 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v50 = v49;
      if (v47)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
          __int16 v77 = 2114;
          BOOL v78 = v61;
          _os_log_impl(&dword_23797A000, v50, OS_LOG_TYPE_DEFAULT, "%s Updated namespaces %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
        __int16 v77 = 2114;
        BOOL v78 = v61;
        __int16 v79 = 2114;
        id v80 = v48;
        _os_log_error_impl(&dword_23797A000, v50, OS_LOG_TYPE_ERROR, "%s Failed to update namespaces %{public}@: %{public}@", buf, 0x20u);
      }

      +[UAFTrialUpdateManager checkForOutOfSpace:v48 updateProgress:v53];
    }
    else
    {
      char v47 = 1;
    }
    id v42 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v76 = "+[UAFTrialUpdateManager updateNamespaces:missingRolloutsOnly:expensiveNetworking:assetSetNamespaces:updateProgress:]";
      _os_log_impl(&dword_23797A000, v42, OS_LOG_TYPE_DEFAULT, "%s Namespace updates complete", buf, 0xCu);
    }
    goto LABEL_51;
  }
  char v47 = 1;
LABEL_52:

  return v47;
}

+ (id)getTrialFactors:(id)a3 configurationManager:(id)a4 includeAllAssetSets:(BOOL)a5 noRemovalNamespaces:(id *)a6 assetSetNamespaces:(id *)a7
{
  BOOL v7 = a5;
  uint64_t v141 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  long long v82 = v9;
  if (!v9 && !v7)
  {
    v12 = 0;
    goto LABEL_99;
  }
  if (!v10)
  {
    id v11 = +[UAFConfigurationManager defaultManager];
  }
  id v102 = [MEMORY[0x263EFF9A0] dictionary];
  v107 = +[UAFTrialConversions entitledTrialNamespaceNames];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v126 objects:v140 count:16];
  v86 = v11;
  if (!v14)
  {
    v12 = 0;
    goto LABEL_56;
  }
  uint64_t v15 = v14;
  v12 = 0;
  uint64_t v16 = *(void *)v127;
  id v17 = @"TrialProject";
  uint64_t v18 = @"TrialNamespace";
  BOOL v85 = v7;
  uint64_t v83 = *(void *)v127;
  id v84 = v13;
  do
  {
    uint64_t v19 = 0;
    uint64_t v87 = v15;
    do
    {
      if (*(void *)v127 != v16)
      {
        uint64_t v20 = v19;
        objc_enumerationMutation(v13);
        uint64_t v19 = v20;
      }
      uint64_t v88 = v19;
      uint64_t v100 = *(void *)(*((void *)&v126 + 1) + 8 * v19);
      id v21 = objc_msgSend(v11, "getAssetSet:");
      uint64_t v22 = v21;
      if (v21)
      {
        uint64_t v23 = v12;
        v94 = v21;
        uint64_t v24 = [v21 autoAssetType];
        if (!v24) {
          goto LABEL_15;
        }
        uint64_t v25 = (void *)v24;
        if ([v94 isTrialAvailable])
        {
          BOOL v26 = +[UAFAutoAssetManager autoAssetExistsWithEntries:v100];

          if (v26) {
            goto LABEL_48;
          }
LABEL_15:
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          obuint64_t j = [v13 objectForKeyedSubscript:v100];
          uint64_t v96 = [obj countByEnumeratingWithState:&v122 objects:v139 count:16];
          if (v96)
          {
            uint64_t v92 = *(void *)v123;
            v12 = v23;
            uint64_t v22 = v94;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v123 != v92) {
                  objc_enumerationMutation(obj);
                }
                v103 = v12;
                uint64_t v98 = v27;
                id v28 = [v22 getTrialAssets:*(void *)(*((void *)&v122 + 1) + 8 * v27)];
                long long v118 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                long long v121 = 0u;
                uint64_t v108 = [v28 countByEnumeratingWithState:&v118 objects:v138 count:16];
                if (v108)
                {
                  uint64_t v105 = *(void *)v119;
                  do
                  {
                    for (uint64_t i = 0; i != v108; ++i)
                    {
                      if (*(void *)v119 != v105) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v118 + 1) + 8 * i);
                      uint64_t v31 = [v28 objectForKeyedSubscript:v30];
                      id v32 = [v31 objectForKeyedSubscript:v17];

                      uint64_t v33 = [v28 objectForKeyedSubscript:v30];
                      v34 = [v33 objectForKeyedSubscript:v18];

                      int v35 = [v28 objectForKeyedSubscript:v30];
                      uint64_t v36 = [v35 objectForKeyedSubscript:@"TrialFactor"];

                      if ([v107 containsObject:v34])
                      {
                        if (v36)
                        {
                          id v37 = v18;
                          v38 = v17;
                          id v39 = [v102 objectForKeyedSubscript:v100];

                          if (!v39)
                          {
                            v40 = [MEMORY[0x263EFF9C0] set];
                            [v102 setObject:v40 forKeyedSubscript:v100];
                          }
                          v41 = [v102 objectForKeyedSubscript:v100];
                          [v41 addObject:v34];

                          id v42 = v103;
                          if (!v103) {
                            id v42 = objc_opt_new();
                          }
                          uint64_t v43 = [v42 objectForKeyedSubscript:v32];

                          if (!v43)
                          {
                            id v44 = objc_opt_new();
                            [v42 setObject:v44 forKeyedSubscript:v32];
                          }
                          v45 = [v42 objectForKeyedSubscript:v32];
                          v46 = [v45 objectForKeyedSubscript:v34];

                          if (!v46)
                          {
                            char v47 = objc_opt_new();
                            id v48 = [v42 objectForKeyedSubscript:v32];
                            [v48 setObject:v47 forKeyedSubscript:v34];
                          }
                          v103 = v42;
                          v49 = [v42 objectForKeyedSubscript:v32];
                          v50 = [v49 objectForKeyedSubscript:v34];
                          [v50 addObject:v36];

                          id v17 = v38;
                          uint64_t v18 = v37;
                        }
                        else
                        {
                          v49 = UAFGetLogCategory((void **)&UAFLogContextClient);
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 136315394;
                            v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRe"
                                   "movalNamespaces:assetSetNamespaces:]";
                            __int16 v134 = 2114;
                            uint64_t v135 = v30;
                            _os_log_debug_impl(&dword_23797A000, v49, OS_LOG_TYPE_DEBUG, "%s Not including %{public}@ as its trial factor isn't specified", buf, 0x16u);
                          }
                        }
                      }
                      else
                      {
                        v49 = UAFGetLogCategory((void **)&UAFLogContextClient);
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315650;
                          v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemo"
                                 "valNamespaces:assetSetNamespaces:]";
                          __int16 v134 = 2114;
                          uint64_t v135 = v30;
                          __int16 v136 = 2114;
                          v137 = v34;
                          _os_log_impl(&dword_23797A000, v49, OS_LOG_TYPE_DEFAULT, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", buf, 0x20u);
                        }
                      }
                    }
                    uint64_t v108 = [v28 countByEnumeratingWithState:&v118 objects:v138 count:16];
                  }
                  while (v108);
                }

                uint64_t v27 = v98 + 1;
                v12 = v103;
                uint64_t v22 = v94;
              }
              while (v98 + 1 != v96);
              uint64_t v96 = [obj countByEnumeratingWithState:&v122 objects:v139 count:16];
            }
            while (v96);
            id v11 = v86;
            uint64_t v15 = v87;
            BOOL v7 = v85;
            uint64_t v16 = v83;
            id v13 = v84;
            goto LABEL_52;
          }
          v12 = v23;
        }
        else
        {

LABEL_48:
          obuint64_t j = UAFGetLogCategory((void **)&UAFLogContextClient);
          v12 = v23;
          if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:"
                   "assetSetNamespaces:]";
            __int16 v134 = 2114;
            uint64_t v135 = v100;
            _os_log_debug_impl(&dword_23797A000, obj, OS_LOG_TYPE_DEBUG, "%s Not generating trial factors for asset set %{public}@ as it using auto assets", buf, 0x16u);
          }
        }
        uint64_t v22 = v94;
        goto LABEL_52;
      }
      obuint64_t j = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespaces:asse"
               "tSetNamespaces:]";
        __int16 v134 = 2114;
        uint64_t v135 = v100;
        _os_log_error_impl(&dword_23797A000, obj, OS_LOG_TYPE_ERROR, "%s Could get trial assets for asset set %{public}@", buf, 0x16u);
      }
LABEL_52:

      uint64_t v19 = v88 + 1;
    }
    while (v88 + 1 != v15);
    uint64_t v15 = [v13 countByEnumeratingWithState:&v126 objects:v140 count:16];
  }
  while (v15);
LABEL_56:

  if (!v7)
  {
    v51 = v102;
    goto LABEL_96;
  }
  [v11 getAllAssetSets];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v51 = v102;
  uint64_t v95 = [obja countByEnumeratingWithState:&v114 objects:v131 count:16];
  if (!v95)
  {
    v104 = 0;
    goto LABEL_95;
  }
  v104 = 0;
  uint64_t v93 = *(void *)v115;
  while (2)
  {
    uint64_t v52 = 0;
    while (2)
    {
      if (*(void *)v115 != v93) {
        objc_enumerationMutation(obja);
      }
      uint64_t v97 = v52;
      id v53 = *(void **)(*((void *)&v114 + 1) + 8 * v52);
      id v54 = [v53 getTrialAssets:0];
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v109 = [v54 countByEnumeratingWithState:&v110 objects:v130 count:16];
      if (v109)
      {
        v106 = v53;
        uint64_t v55 = *(void *)v111;
        v99 = v54;
        uint64_t v101 = *(void *)v111;
        do
        {
          uint64_t v56 = 0;
          do
          {
            if (*(void *)v111 != v55) {
              objc_enumerationMutation(v54);
            }
            uint64_t v57 = *(void *)(*((void *)&v110 + 1) + 8 * v56);
            v58 = [v54 objectForKeyedSubscript:v57];
            uint64_t v59 = [v58 objectForKeyedSubscript:@"TrialProject"];

            BOOL v60 = [v54 objectForKeyedSubscript:v57];
            v61 = [v60 objectForKeyedSubscript:@"TrialNamespace"];

            if (([v107 containsObject:v61] & 1) == 0)
            {
              BOOL v78 = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v133 = "+[UAFTrialUpdateManager getTrialFactors:configurationManager:includeAllAssetSets:noRemovalNamespa"
                       "ces:assetSetNamespaces:]";
                __int16 v134 = 2114;
                uint64_t v135 = v57;
                __int16 v136 = 2114;
                v137 = v61;
                _os_log_impl(&dword_23797A000, v78, OS_LOG_TYPE_DEFAULT, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", buf, 0x20u);
              }
LABEL_85:

              goto LABEL_86;
            }
            id v62 = [v106 name];
            long long v63 = [v102 objectForKeyedSubscript:v62];

            if (!v63)
            {
              long long v64 = [MEMORY[0x263EFF9C0] set];
              long long v65 = [v106 name];
              [v102 setObject:v64 forKeyedSubscript:v65];
            }
            long long v66 = [v106 name];
            long long v67 = [v102 objectForKeyedSubscript:v66];
            [v67 addObject:v61];

            if (!v12) {
              v12 = objc_opt_new();
            }
            long long v68 = [v12 objectForKeyedSubscript:v59];

            id v54 = v99;
            if (!v68)
            {
              long long v69 = objc_opt_new();
              [v12 setObject:v69 forKeyedSubscript:v59];
            }
            long long v70 = [v12 objectForKeyedSubscript:v59];
            long long v71 = [v70 objectForKeyedSubscript:v61];

            if (!v71)
            {
              long long v72 = objc_opt_new();
              long long v73 = [v12 objectForKeyedSubscript:v59];
              [v73 setObject:v72 forKeyedSubscript:v61];
            }
            int v74 = [v106 disableAssetRemoval];
            if (a6)
            {
              id v75 = v104;
              uint64_t v55 = v101;
              if (!v74) {
                goto LABEL_86;
              }
              if (!v104)
              {
                id v75 = objc_opt_new();
                *a6 = v75;
              }
              v76 = [v75 objectForKeyedSubscript:v59];

              if (!v76)
              {
                __int16 v77 = objc_opt_new();
                [v75 setObject:v77 forKeyedSubscript:v59];
              }
              v104 = v75;
              BOOL v78 = [v75 objectForKeyedSubscript:v59];
              [v78 addObject:v61];
              goto LABEL_85;
            }
            uint64_t v55 = v101;
LABEL_86:

            ++v56;
          }
          while (v109 != v56);
          uint64_t v79 = [v54 countByEnumeratingWithState:&v110 objects:v130 count:16];
          uint64_t v109 = v79;
        }
        while (v79);
      }

      uint64_t v52 = v97 + 1;
      v51 = v102;
      if (v97 + 1 != v95) {
        continue;
      }
      break;
    }
    uint64_t v95 = [obja countByEnumeratingWithState:&v114 objects:v131 count:16];
    if (v95) {
      continue;
    }
    break;
  }
LABEL_95:

  id v11 = v86;
LABEL_96:
  if (a7) {
    *a7 = v51;
  }

LABEL_99:

  return v12;
}

void __39__UAFTrialUpdateManager_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFTrialUpdateManager.Serial", 0);
  v1 = (void *)qword_26AF0B950;
  qword_26AF0B950 = (uint64_t)v0;
}

void __43__UAFTrialUpdateManager_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFTrialUpdateManager.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0B940;
  qword_26AF0B940 = (uint64_t)v0;
}

+ (id)trialClientWithProject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F80EB8] projectIdFromName:v3];
  if v4 && (uint64_t v5 = v4, (TRIProject_ProjectId_IsValidValue()))
  {
    id v6 = [MEMORY[0x263F80E18] clientWithIdentifier:v5];
    if (v6)
    {
      BOOL v7 = v6;
      id v8 = v7;
      goto LABEL_8;
    }
    id v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[UAFTrialUpdateManager trialClientWithProject:]";
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", (uint8_t *)&v11, 0x16u);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[UAFTrialUpdateManager trialClientWithProject:]";
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

+ (BOOL)isOnDemand:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 levelOneOfCase] == 101)
  {
    uint64_t v5 = [v4 directoryValue];
    if (v5)
    {
      id v6 = [v4 directoryValue];
      int v7 = [v6 isOnDemand] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7 ^ 1;
}

+ (unint64_t)sizeFromLevel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3 || [v3 levelOneOfCase] != 101) {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 directoryValue];
  if (v5)
  {
    id v6 = [v4 directoryValue];
    int v7 = [v6 asset];

    if (v7)
    {
      id v8 = [v4 directoryValue];
      id v9 = [v8 asset];
      uint64_t v5 = (void *)[v9 size];

      goto LABEL_7;
    }
LABEL_6:
    uint64_t v5 = 0;
  }
LABEL_7:

  return (unint64_t)v5;
}

+ (BOOL)isSubscribed:(id)a3
{
  id v3 = a3;
  if (!+[UAFTrialUpdateManager isOnDemand:v3]) {
    goto LABEL_6;
  }
  uint64_t v4 = [v3 directoryValue];
  if (([v4 hasPath] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v5 = [v3 directoryValue];
  id v6 = [v5 path];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

+ (BOOL)isPresent:(id)a3
{
  id v3 = a3;
  if (+[UAFTrialUpdateManager isSubscribed:v3])
  {
    objc_msgSend(v3, "directoryValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    uint64_t v4 = 0);
    uint64_t v5 = [v4 path];
    BOOL v6 = +[UAFCommonUtilities stat:v5 withBuf:&v8 error:0] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isRemoveAllowed
{
  uint64_t v2 = +[UAFSubscriptionStoreManager defaultManager];
  id v3 = [v2 getSystemConfigurationForKey:@"NoRemove"];

  BOOL v4 = !v3 || ([v3 isEqualToString:@"1"] & 1) == 0;
  return v4;
}

+ (void)getKnownFactors:(id)a3 namespace:(id)a4 knownFactors:(id *)a5 onDemandFactors:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v8 = [a3 factorLevelsWithNamespaceName:a4];
  if ([v8 count])
  {
    BOOL v26 = a6;
    id v9 = objc_opt_new();
    id v10 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v27 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v17 = [v16 factor];
          uint64_t v18 = [v17 name];

          if (v18)
          {
            uint64_t v19 = [v16 factor];
            uint64_t v20 = [v19 name];
            [v9 addObject:v20];

            id v21 = [v16 level];
            LODWORD(v19) = +[UAFTrialUpdateManager isOnDemand:v21];

            if (v19)
            {
              uint64_t v22 = [v16 factor];
              uint64_t v23 = [v22 name];
              [v10 addObject:v23];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    id v24 = v9;
    *a5 = v24;
    id v25 = v10;
    id *v26 = v25;

    long long v8 = v27;
  }
}

+ (void)checkForOutOfSpace:(id)a3 updateProgress:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (v7)
  {
    uint64_t v6 = [v7 code];
    if (v5)
    {
      if (v6 == 4) {
        [v5 outOfSpaceEncountered];
      }
    }
  }
}

+ (void)updateOnDemandFactors:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11
{
  BOOL v86 = a6;
  BOOL v90 = a5;
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v91 = a3;
  id v13 = a4;
  id v88 = a8;
  id v89 = a9;
  id v107 = a10;
  id v85 = a11;
  uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v91;
    _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating on demand factors in project %{public}@", buf, 0x16u);
  }

  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  obuint64_t j = v13;
  uint64_t v93 = [obj countByEnumeratingWithState:&v148 objects:v162 count:16];
  if (!v93)
  {
    uint64_t v101 = 0;
    id v103 = 0;
    uint64_t v98 = 0;
    goto LABEL_67;
  }
  uint64_t v101 = 0;
  id v103 = 0;
  uint64_t v98 = 0;
  uint64_t v92 = *(void *)v149;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v149 != v92)
      {
        uint64_t v16 = v15;
        objc_enumerationMutation(obj);
        uint64_t v15 = v16;
      }
      uint64_t v94 = v15;
      uint64_t v17 = *(void *)(*((void *)&v148 + 1) + 8 * v15);
      context = (void *)MEMORY[0x237E26B30]();
      uint64_t v105 = +[UAFTrialUpdateManager trialClientWithProject:v91];
      id v147 = 0;
      id v146 = 0;
      +[UAFTrialUpdateManager getKnownFactors:v105 namespace:v17 knownFactors:&v147 onDemandFactors:&v146];
      id v18 = v147;
      id v96 = v146;
      uint64_t v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveN"
                             "etworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s Attempting to download needed factors for namespace %{public}@", buf, 0x16u);
      }

      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      uint64_t v20 = [obj objectForKeyedSubscript:v17];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v161 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v143;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v143 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v142 + 1) + 8 * i);
            if (objc_msgSend(v18, "containsObject:", v24, v85))
            {
              id v25 = [v105 levelForFactor:v24 withNamespaceName:v17];
              if (!+[UAFTrialUpdateManager isOnDemand:v25]
                || +[UAFTrialUpdateManager isPresent:v25])
              {
                BOOL v26 = +[UAFTrialUpdateManager isOnDemand:v25];
                uint64_t v27 = UAFGetLogCategory((void **)&UAFLogContextClient);
                BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                if (v26)
                {
                  if (v28)
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactor"
                                         "s:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v24;
                    long long v29 = v27;
                    long long v30 = "%s Cannot update downloaded on-demand factor %{public}@";
                    goto LABEL_25;
                  }
                }
                else if (v28)
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:"
                                       "expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v24;
                  long long v29 = v27;
                  long long v30 = "%s Cannot update regular factor %{public}@";
LABEL_25:
                  _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
                }

                if (v107) {
                  objc_msgSend(v107, "trialFactorStarted:namespace:size:status:", v24, v17, +[UAFTrialUpdateManager sizeFromLevel:](UAFTrialUpdateManager, "sizeFromLevel:", v25), 4);
                }
                goto LABEL_37;
              }
              long long v31 = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:ex"
                                     "pensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v24;
                _os_log_impl(&dword_23797A000, v31, OS_LOG_TYPE_DEFAULT, "%s Need to download desired on demand factor %{public}@", buf, 0x16u);
              }

              if (v107) {
                objc_msgSend(v107, "trialFactorStarted:namespace:size:status:", v24, v17, +[UAFTrialUpdateManager sizeFromLevel:](UAFTrialUpdateManager, "sizeFromLevel:", v25), 2);
              }
              id v32 = v103;
              if (!v103) {
                id v32 = objc_opt_new();
              }
              id v103 = v32;
              uint64_t v33 = [v32 objectForKeyedSubscript:v17];
              BOOL v34 = v33 == 0;

              if (v34)
              {
                int v35 = objc_opt_new();
                [v103 setObject:v35 forKeyedSubscript:v17];
              }
              uint64_t v36 = [v103 objectForKeyedSubscript:v17];
              [v36 addObject:v24];

              ++v101;
            }
            else
            {
              id v25 = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:ex"
                                     "pensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v24;
                _os_log_error_impl(&dword_23797A000, v25, OS_LOG_TYPE_ERROR, "%s Cannot update unknown factor %{public}@", buf, 0x16u);
              }
            }
LABEL_37:
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v142 objects:v161 count:16];
        }
        while (v21);
      }

      if (v90 && ![v89 containsObject:v17])
      {
        v38 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiv"
                               "eNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          _os_log_impl(&dword_23797A000, v38, OS_LOG_TYPE_DEFAULT, "%s Attempting to remove unneeded factors for namespace %{public}@", buf, 0x16u);
        }

        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v37 = v96;
        uint64_t v39 = [v37 countByEnumeratingWithState:&v138 objects:v160 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v139;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v139 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v138 + 1) + 8 * j);
              uint64_t v43 = objc_msgSend(obj, "objectForKeyedSubscript:", v17, v85);
              int v44 = [v43 containsObject:v42];

              if (v44)
              {
                v45 = UAFGetLogCategory((void **)&UAFLogContextClient);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:"
                                       "expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v42;
                  _os_log_impl(&dword_23797A000, v45, OS_LOG_TYPE_DEFAULT, "%s No need to remove desired on demand factor %{public}@", buf, 0x16u);
                }
              }
              else
              {
                v45 = [v105 levelForFactor:v42 withNamespaceName:v17];
                if (+[UAFTrialUpdateManager isSubscribed:v45])
                {
                  v46 = UAFGetLogCategory((void **)&UAFLogContextClient);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactor"
                                         "s:expensiveNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v42;
                    _os_log_impl(&dword_23797A000, v46, OS_LOG_TYPE_DEFAULT, "%s Need to remove undesired on demand factor %{public}@", buf, 0x16u);
                  }

                  char v47 = v98;
                  if (!v98) {
                    char v47 = objc_opt_new();
                  }
                  uint64_t v98 = v47;
                  id v48 = [v47 objectForKeyedSubscript:v17];
                  BOOL v49 = v48 == 0;

                  if (v49)
                  {
                    v50 = objc_opt_new();
                    [v98 setObject:v50 forKeyedSubscript:v17];
                  }
                  v51 = [v98 objectForKeyedSubscript:v17];
                  [v51 addObject:v42];

                  ++v101;
                }
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v138 objects:v160 count:16];
          }
          while (v39);
        }
      }
      else
      {
        id v37 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiv"
                               "eNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          _os_log_impl(&dword_23797A000, v37, OS_LOG_TYPE_DEFAULT, "%s Not attempting to remove unneeded factors", buf, 0xCu);
        }
      }

      uint64_t v15 = v94 + 1;
    }
    while (v94 + 1 != v93);
    uint64_t v93 = [obj countByEnumeratingWithState:&v148 objects:v162 count:16];
  }
  while (v93);
LABEL_67:

  uint64_t v52 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v101;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v154 = (uint64_t)v91;
    _os_log_impl(&dword_23797A000, v52, OS_LOG_TYPE_DEFAULT, "%s Updating %lu on-demand factors in project %{public}@", buf, 0x20u);
  }

  if (v101)
  {
    v106 = +[UAFTrialUpdateManager trialClientWithProject:v91];
  }
  else
  {
    v106 = 0;
  }
  id v53 = dispatch_group_create();
  uint64_t v100 = (void *)[objc_alloc(MEMORY[0x263F80E30]) initWithAllowsCellular:v86 discretionaryBehavior:0];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v104 = v103;
  uint64_t v102 = [v104 countByEnumeratingWithState:&v134 objects:v159 count:16];
  if (v102)
  {
    uint64_t v97 = *(void *)v135;
    do
    {
      for (uint64_t k = 0; k != v102; ++k)
      {
        if (*(void *)v135 != v97) {
          objc_enumerationMutation(v104);
        }
        id v55 = *(id *)(*((void *)&v134 + 1) + 8 * k);
        uint64_t v56 = [v104 objectForKeyedSubscript:v55];
        uint64_t v57 = [v56 allObjects];

        dispatch_group_enter(v53);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        v58 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v157 = 136315650;
          *(void *)&v157[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensi"
                                "veNetworking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
          *(_WORD *)&v157[12] = 2114;
          *(void *)&v157[14] = v57;
          *(_WORD *)&v157[22] = 2114;
          id v158 = v55;
          _os_log_impl(&dword_23797A000, v58, OS_LOG_TYPE_DEFAULT, "%s downloadLevelsForFactors for %{public}@ with namespace %{public}@", v157, 0x20u);
        }

        uint64_t v59 = +[UAFTrialUpdateManager getSerialQueue];
        v128[0] = MEMORY[0x263EF8330];
        v128[1] = 3221225472;
        v128[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke;
        v128[3] = &unk_264CEB1C8;
        v133 = buf;
        id v60 = v57;
        id v129 = v60;
        id v61 = v107;
        id v130 = v61;
        id v62 = v55;
        id v131 = v62;
        long long v63 = v53;
        v132 = v63;
        [v106 downloadLevelsForFactors:v60 withNamespace:v62 queue:v59 options:v100 progress:0 completion:v128];

        if (v107)
        {
          *(void *)v157 = 0;
          *(void *)&v157[8] = v157;
          *(void *)&v157[16] = 0x2020000000;
          LOBYTE(v158) = 0;
          dispatch_group_enter(v63);
          long long v64 = +[UAFTrialUpdateManager getSerialQueue];
          v124[0] = MEMORY[0x263EF8330];
          v124[1] = 3221225472;
          v124[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_287;
          v124[3] = &unk_264CEB1F0;
          id v65 = v60;
          id v125 = v65;
          id v66 = v61;
          id v126 = v66;
          id v67 = v62;
          id v127 = v67;
          v119[0] = MEMORY[0x263EF8330];
          v119[1] = 3221225472;
          v119[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_289;
          v119[3] = &unk_264CEB218;
          long long v123 = v157;
          id v120 = v66;
          long long v121 = v63;
          id v122 = v65;
          [v106 statusOfDownloadForFactors:v122 withNamespace:v67 token:0 queue:v64 progress:v124 completion:v119];

          _Block_object_dispose(v157, 8);
        }

        _Block_object_dispose(buf, 8);
      }
      uint64_t v102 = [v104 countByEnumeratingWithState:&v134 objects:v159 count:16];
    }
    while (v102);
  }

  uint64_t v68 = [v88 updateCount];
  if (v68 != a7)
  {
    long long v69 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNet"
                           "working:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a7;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v154 = v68;
      _os_log_impl(&dword_23797A000, v69, OS_LOG_TYPE_DEFAULT, "%s Store update count mismatch: %llu vs %llu, skipping removes", buf, 0x20u);
    }

    uint64_t v98 = 0;
  }
  long long v70 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetwo"
                         "rking:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a7;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v154 = v68;
    __int16 v155 = 1024;
    BOOL v156 = v90;
    _os_log_impl(&dword_23797A000, v70, OS_LOG_TYPE_DEFAULT, "%s Store update count: %llu vs %llu and removeUnneededFactors: %d", buf, 0x26u);
  }

  if (v98)
  {
    if (+[UAFTrialUpdateManager isRemoveAllowed])
    {
      long long v71 = v98;
      goto LABEL_96;
    }
    long long v72 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNet"
                           "working:updateCount:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      _os_log_impl(&dword_23797A000, v72, OS_LOG_TYPE_DEFAULT, "%s Removes temporarily disallowed, skipping remove", buf, 0xCu);
    }
  }
  long long v71 = 0;
LABEL_96:
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v73 = v71;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v115 objects:v152 count:16];
  if (v74)
  {
    uint64_t v75 = *(void *)v116;
    do
    {
      for (uint64_t m = 0; m != v74; ++m)
      {
        if (*(void *)v116 != v75) {
          objc_enumerationMutation(v73);
        }
        uint64_t v77 = *(void *)(*((void *)&v115 + 1) + 8 * m);
        BOOL v78 = objc_msgSend(v73, "objectForKeyedSubscript:", v77, v85);
        uint64_t v79 = [v78 allObjects];

        dispatch_group_enter(v53);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v154) = 0;
        id v80 = +[UAFTrialUpdateManager getSerialQueue];
        v111[0] = MEMORY[0x263EF8330];
        v111[1] = 3221225472;
        v111[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_290;
        v111[3] = &unk_264CEB240;
        long long v114 = buf;
        id v81 = v79;
        id v112 = v81;
        long long v113 = v53;
        [v106 removeLevelsForFactors:v81 withNamespace:v77 queue:v80 completion:v111];

        _Block_object_dispose(buf, 8);
      }
      uint64_t v74 = [v73 countByEnumeratingWithState:&v115 objects:v152 count:16];
    }
    while (v74);
  }

  long long v82 = +[UAFTrialUpdateManager getConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_291;
  block[3] = &unk_264CEB0B0;
  id v109 = v91;
  id v110 = v85;
  id v83 = v85;
  id v84 = v91;
  dispatch_group_notify(v53, v82, block);
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = v16;
      _os_log_fault_impl(&dword_23797A000, v7, OS_LOG_TYPE_FAULT, "%s Callback for downloading factors %{public}@ called more than once!", buf, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 1;
    long long v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    id v9 = v8;
    if (a2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updat"
              "eCount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
        __int16 v25 = 2114;
        uint64_t v26 = v10;
        _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Factors %{public}@ downloaded", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to download factors %{public}@: %{public}@", buf, 0x20u);
    }

    +[UAFTrialUpdateManager checkForOutOfSpace:v5 updateProgress:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 40))
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(*(id *)(a1 + 40), "trialFactorFinished:namespace:", *(void *)(*((void *)&v18 + 1) + 8 * v15++), *(void *)(a1 + 48), (void)v18);
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_287(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 40), "trialFactorProgress:namespace:fractionCompleted:status:", *(void *)(*((void *)&v15 + 1) + 8 * v10++), *(void *)(a1 + 48), a2, a3, (void)v15);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v8);
  }

  id v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = UAFSubscriptionDownloadStatusDescription(a2);
    *(_DWORD *)buf = 136315906;
    long long v20 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCou"
          "nt:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    __int16 v25 = 2114;
    uint64_t v26 = v14;
    _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s statusOfDownload for %{public}@:%{public}@ status: %{public}@", buf, 0x2Au);
  }
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_289(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    id v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = a1[6];
      int v8 = 136315394;
      uint64_t v9 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCo"
           "unt:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_fault_impl(&dword_23797A000, v5, OS_LOG_TYPE_FAULT, "%s Completion Callback for status of factors %{public}@ called more than once!", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    +[UAFTrialUpdateManager checkForOutOfSpace:a3 updateProgress:a1[4]];
    id v6 = a1[5];
    dispatch_group_leave(v6);
  }
}

void __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_290(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 136315394;
      uint64_t v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_fault_impl(&dword_23797A000, v7, OS_LOG_TYPE_FAULT, "%s Callback for removing factors %{public}@ called more than once!", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 1;
    int v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    uint64_t v9 = v8;
    if (a2)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v13 = 136315394;
        uint64_t v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updat"
              "eCount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Factor %{public}@ removed", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 136315650;
      uint64_t v14 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateC"
            "ount:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to remove factor %{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

uint64_t __173__UAFTrialUpdateManager_updateOnDemandFactors_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke_291(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "+[UAFTrialUpdateManager updateOnDemandFactors:trialFactors:removeUnneededFactors:expensiveNetworking:updateCoun"
         "t:storeManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s All updates for on-demand factors in project %{public}@ complete", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)updateTrialProject:(id)a3 trialFactors:(id)a4 removeUnneededFactors:(BOOL)a5 expensiveNetworking:(BOOL)a6 updateCount:(unint64_t)a7 storeManager:(id)a8 noRemovalNamespaces:(id)a9 updateProgress:(id)a10 completion:(id)a11
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __170__UAFTrialUpdateManager_updateTrialProject_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke;
  v27[3] = &unk_264CEB0B0;
  id v21 = v15;
  id v28 = v21;
  id v22 = v20;
  id v29 = v22;
  __int16 v23 = (void (**)(void))MEMORY[0x237E26D50](v27);
  uint64_t v24 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v31 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:"
          "storeManager:noRemovalNamespaces:updateProgress:completion:]";
    __int16 v32 = 2114;
    id v33 = v16;
    __int16 v34 = 2114;
    id v35 = v21;
    _os_log_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEFAULT, "%s Updating trial factors %{public}@ for %{public}@", buf, 0x20u);
  }

  if (v16 && [v16 count])
  {
    +[UAFTrialUpdateManager updateOnDemandFactors:v21 trialFactors:v16 removeUnneededFactors:v13 expensiveNetworking:v12 updateCount:a7 storeManager:v17 noRemovalNamespaces:v18 updateProgress:v19 completion:v23];
  }
  else
  {
    __int16 v25 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v31 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCoun"
            "t:storeManager:noRemovalNamespaces:updateProgress:completion:]";
      __int16 v32 = 2114;
      id v33 = v21;
      _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s No trial assets to update for %{public}@", buf, 0x16u);
    }

    v23[2](v23);
  }
}

void __170__UAFTrialUpdateManager_updateTrialProject_trialFactors_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_updateProgress_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "+[UAFTrialUpdateManager updateTrialProject:trialFactors:removeUnneededFactors:expensiveNetworking:updateCount:s"
         "toreManager:noRemovalNamespaces:updateProgress:completion:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s All updating of trial assets in project %{public}@ complete", (uint8_t *)&v5, 0x16u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = +[UAFTrialUpdateManager getConcurrentQueue];
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));
  }
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 97);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 56) objectForKeyedSubscript:v2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2;
  v10[3] = &unk_264CEAC18;
  uint64_t v9 = *(void *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 32);
  +[UAFTrialUpdateManager updateTrialProject:v2 trialFactors:v3 removeUnneededFactors:v4 expensiveNetworking:v5 updateCount:v6 storeManager:v7 noRemovalNamespaces:v8 updateProgress:v9 completion:v10];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315394;
    uint64_t v5 = "+[UAFTrialUpdateManager updateTrialFactors:rolloutUpdateMode:removeUnneededFactors:expensiveNetworking:updateCo"
         "unt:storeManager:noRemovalNamespaces:assetSetNamespaces:progress:completion:]_block_invoke_2";
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Update of trial assets in project %{public}@ complete as part of update of all trial assets", (uint8_t *)&v4, 0x16u);
  }
}

void __188__UAFTrialUpdateManager_updateTrialFactors_rolloutUpdateMode_removeUnneededFactors_expensiveNetworking_updateCount_storeManager_noRemovalNamespaces_assetSetNamespaces_progress_completion___block_invoke_3(uint64_t a1)
{
  +[UAFTrialUpdateManager updateNamespaces:*(void *)(a1 + 32) missingRolloutsOnly:0 expensiveNetworking:*(unsigned __int8 *)(a1 + 64) assetSetNamespaces:*(void *)(a1 + 40) updateProgress:*(void *)(a1 + 48)];
  uint64_t v2 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v2);
}

+ (void)updateTrialFromAssetSetUsages:(id)a3 storeManager:(id)a4 configurationManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]";
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Configuring Trial from asset set usages", buf, 0xCu);
  }

  uint64_t v11 = [v8 updateCount];
  id v12 = +[UAFTrialUpdateManager getSerialQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_storeManager_configurationManager___block_invoke;
  v16[3] = &unk_264CEB2E0;
  id v17 = v7;
  id v18 = v9;
  id v19 = v8;
  uint64_t v20 = v11;
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  dispatch_async(v12, v16);
}

void __89__UAFTrialUpdateManager_updateTrialFromAssetSetUsages_storeManager_configurationManager___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v10 = 0;
  int v4 = +[UAFTrialUpdateManager getTrialFactors:v2 configurationManager:v3 includeAllAssetSets:1 noRemovalNamespaces:&v10 assetSetNamespaces:&v9];
  id v5 = v10;
  id v6 = v9;
  id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_debug_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEBUG, "%s All trial factors now %{public}@", buf, 0x16u);
  }

  +[UAFTrialUpdateManager updateTrialFactors:v4 rolloutUpdateMode:0 removeUnneededFactors:1 expensiveNetworking:0 updateCount:a1[7] storeManager:a1[6] noRemovalNamespaces:v5 assetSetNamespaces:v6 progress:0 completion:0];
  id v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "+[UAFTrialUpdateManager updateTrialFromAssetSetUsages:storeManager:configurationManager:]_block_invoke";
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Finished configuring Trial from asset set usages", buf, 0xCu);
  }
}

+ (id)filterOnDemandFactors:(id)a3 namespaceName:(id)a4 trialClient:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v17 = objc_msgSend(v9, "levelForFactor:withNamespaceName:", v16, v8, (void)v19);
        if (+[UAFTrialUpdateManager isOnDemand:v17]) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (unint64_t)getTrialDownloadStatusForUsages:(id)a3 configurationManager:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  int v4 = +[UAFTrialUpdateManager getTrialFactors:a3 configurationManager:a4 includeAllAssetSets:0 noRemovalNamespaces:0 assetSetNamespaces:0];
  id v28 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        uint64_t v6 = *(void *)(*((void *)&v35 + 1) + 8 * v5);
        id v7 = objc_msgSend(MEMORY[0x263F80E18], "clientWithIdentifier:", objc_msgSend(MEMORY[0x263F80EB8], "projectIdFromName:", v6));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v29 = v6;
        id v27 = [obj objectForKeyedSubscript:v6];
        uint64_t v8 = [v27 countByEnumeratingWithState:&v31 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v32;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v32 != v10) {
                objc_enumerationMutation(v27);
              }
              uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
              uint64_t v13 = [obj objectForKeyedSubscript:v29];
              uint64_t v14 = [v13 objectForKeyedSubscript:v12];
              uint64_t v15 = [v14 allObjects];
              uint64_t v16 = +[UAFTrialUpdateManager filterOnDemandFactors:v15 namespaceName:v12 trialClient:v7];

              if ([v16 count])
              {
                uint64_t v17 = [v7 statusOfDownloadForFactors:v16 withNamespace:v12 token:0 queue:0 progress:0 completion:0];
                id v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  long long v20 = [obj objectForKeyedSubscript:v29];
                  long long v21 = [v20 objectForKeyedSubscript:v12];
                  *(_DWORD *)buf = 136315906;
                  uint64_t v40 = "+[UAFTrialUpdateManager getTrialDownloadStatusForUsages:configurationManager:]";
                  __int16 v41 = 2050;
                  uint64_t v42 = v17;
                  __int16 v43 = 2114;
                  uint64_t v44 = v12;
                  __int16 v45 = 2114;
                  v46 = v21;
                  _os_log_debug_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEBUG, "%s Trial reports %{public}lu status for %{public}@:%{public}@", buf, 0x2Au);
                }
                long long v19 = [NSNumber numberWithUnsignedInteger:v17];
                [v28 setObject:v19 forKeyedSubscript:v12];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v27 countByEnumeratingWithState:&v31 objects:v47 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v25);
  }

  unint64_t v22 = +[UAFAssetSetManager coalesceDownloadStatus:v28];
  return v22;
}

@end