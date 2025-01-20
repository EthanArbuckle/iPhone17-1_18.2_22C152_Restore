@interface TRIClient(UAFTrialClient)
+ (id)_cachedLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:withCache:;
+ (id)_cachedLevelForFactorAnyLanguage:()UAFTrialClient withNamespaceName:withCache:;
+ (id)_factoryFactorLevelsWithNamespaceName:()UAFTrialClient onDemandClient:;
+ (id)_queryAssetsWithNamespaceName:()UAFTrialClient factorName:language:isRoot:withError:;
+ (id)_rootFactorLevelsWithNamespaceName:()UAFTrialClient;
+ (uint64_t)_factoryLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:;
+ (uint64_t)_levelKeyForCache:()UAFTrialClient withFactorName:withLanguage:;
+ (uint64_t)_rootLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:;
+ (void)UAFCacheUpdate;
+ (void)_addFactorLevelsToCache:()UAFTrialClient namespaceName:withFactorLevelsCache:withLevelCache:;
+ (void)_addLevelToCache:()UAFTrialClient namespaceName:factorName:withCache:;
- (id)UAFFactorLevelsWithNamespaceName:()UAFTrialClient;
- (id)UAFLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:;
- (id)_trialLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:;
- (void)_initOnce;
@end

@implementation TRIClient(UAFTrialClient)

- (id)UAFFactorLevelsWithNamespaceName:()UAFTrialClient
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 _initOnce];
  v5 = [a1 factorLevelsWithNamespaceName:v4];
  if (v5)
  {
    id v44 = v4;
    v6 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v43 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v8) {
      goto LABEL_21;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v48;
    id v45 = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v12 hasLevel])
        {
          v13 = [v12 level];
          int v14 = [v13 levelOneOfCase];

          if (v14 == 101)
          {
            v15 = [v12 level];
            uint64_t v16 = [v15 directoryValue];
            char v17 = [(id)v16 isOnDemand];

            v18 = [v12 level];
            LOBYTE(v16) = levelHasValidPath(v18);

            if ((v16 & 1) == 0) {
              goto LABEL_11;
            }
            memset(&v46, 0, sizeof(v46));
            v19 = [v12 level];
            v20 = [v19 directoryValue];
            id v21 = [v20 path];
            int v22 = stat((const char *)[v21 UTF8String], &v46);

            id v7 = v45;
            if (v22)
            {
LABEL_11:
              if ((v17 & 1) == 0)
              {
                v41 = newFactorLevelWithLevel(v12, 0);
                [v6 addObject:v41];

                continue;
              }
              if ([v12 hasLevel])
              {
                v23 = [v12 level];
                if ([v23 levelOneOfCase] == 101)
                {
                  v24 = [v12 level];
                  v25 = [v24 directoryValue];
                  int v26 = [v25 hasPath];

                  if (v26)
                  {
                    v27 = objc_opt_new();
                    v28 = objc_opt_new();
                    [v27 setDirectoryValue:v28];

                    v29 = [v27 directoryValue];
                    [v29 setHasPath:0];

                    v30 = [v12 level];
                    v31 = [v30 directoryValue];
                    uint64_t v32 = [v31 isOnDemand];
                    v33 = [v27 directoryValue];
                    [v33 setIsOnDemand:v32];

                    v34 = [v12 level];
                    v35 = [v34 directoryValue];
                    v36 = [v35 asset];
                    v37 = [v27 directoryValue];
                    [v37 setAsset:v36];

                    id v7 = v45;
                    v38 = [v12 level];
                    v39 = [v38 metadata];
                    [v27 setMetadata:v39];

                    v40 = newFactorLevelWithLevel(v12, v27);
                    [v6 addObject:v40];

                    continue;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v9)
      {
LABEL_21:

        v5 = v43;
        id v4 = v44;
        goto LABEL_23;
      }
    }
  }
  v6 = 0;
LABEL_23:

  return v6;
}

+ (id)_rootFactorLevelsWithNamespaceName:()UAFTrialClient
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v10 = 0;
  id v4 = [MEMORY[0x263F80E18] _queryAssetsWithNamespaceName:v3 factorName:0 language:0 isRoot:1 withError:&v10];
  id v5 = v10;
  if (v4)
  {
    v6 = factorLevelsFromAssets(v4, v3);
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v12 = "+[TRIClient(UAFTrialClient) _rootFactorLevelsWithNamespaceName:]";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s MAQuery for factorLevels roots %@ failed: %@", buf, 0x20u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)_factoryFactorLevelsWithNamespaceName:()UAFTrialClient onDemandClient:
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v38 = a4;
  id v49 = 0;
  v6 = [MEMORY[0x263F80E18] _queryAssetsWithNamespaceName:v5 factorName:0 language:0 isRoot:0 withError:&v49];
  id v7 = v49;
  uint64_t v8 = v7;
  if (v6)
  {
    id v35 = v7;
    v37 = v5;
    v39 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v14 = [v13 attributes];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"isRoot"];
        if (!v15)
        {

LABEL_11:
          [v39 addObject:v13];
          continue;
        }
        uint64_t v16 = (void *)v15;
        uint64_t v17 = [v13 attributes];
        v18 = [v17 objectForKeyedSubscript:@"isRoot"];
        char v19 = [v18 isEqualToString:@"1"];

        if ((v19 & 1) == 0) {
          goto LABEL_11;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (!v10)
      {
LABEL_14:

        v20 = v39;
        if (v38)
        {
          id v21 = [MEMORY[0x263EFF980] array];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v40 = v20;
          int v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v42 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                v28 = [v27 attributes];
                v29 = [v28 objectForKeyedSubscript:@"Factor"];

                v30 = [v38 levelForFactor:v29 withNamespaceName:v37];
                if ((levelHasValidPath(v30) & 1) == 0) {
                  [v21 addObject:v27];
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v24);
          }

          v31 = v21;
          v20 = v40;
        }
        else
        {
          v31 = 0;
          id v21 = v20;
        }
        id v5 = v37;
        v33 = factorLevelsFromAssets(v21, v37);

        uint64_t v8 = v35;
        goto LABEL_30;
      }
    }
  }
  v20 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v8 localizedDescription];
    *(_DWORD *)buf = 136315650;
    v53 = "+[TRIClient(UAFTrialClient) _factoryFactorLevelsWithNamespaceName:onDemandClient:]";
    __int16 v54 = 2112;
    id v55 = v5;
    __int16 v56 = 2112;
    v57 = v32;
    _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s MAQuery for factory assets %@ failed: %@", buf, 0x20u);
  }
  v33 = 0;
LABEL_30:

  return v33;
}

- (id)UAFLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _initOnce];
  uint64_t v11 = [a1 _trialLevelForFactor:v8 withNamespaceName:v9 withLanguage:v10];
  if (v11)
  {
    v12 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = "-[TRIClient(UAFTrialClient) UAFLevelForFactor:withNamespaceName:withLanguage:]";
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s Returning trial for levelForFactor:%@:%@:%@", (uint8_t *)&v15, 0x2Au);
    }

    id v13 = v11;
  }

  return v11;
}

+ (id)_cachedLevelForFactorAnyLanguage:()UAFTrialClient withNamespaceName:withCache:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 stringByAppendingFormat:@":%@:", v7];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  __int16 v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__TRIClient_UAFTrialClient___cachedLevelForFactorAnyLanguage_withNamespaceName_withCache___block_invoke;
  v14[3] = &unk_264CEB8F0;
  id v11 = v10;
  id v15 = v11;
  uint64_t v16 = &v17;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

+ (id)_cachedLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:withCache:
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() _levelKeyForCache:v11 withFactorName:v12 withLanguage:v10];

  id v14 = [v9 objectForKeyedSubscript:v13];

  return v14;
}

+ (uint64_t)_rootLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  return [MEMORY[0x263F80E18] _cachedLevelForFactor:a3 withNamespaceName:a4 withLanguage:a5 withCache:_MergedGlobals_8];
}

+ (uint64_t)_factoryLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  return [MEMORY[0x263F80E18] _cachedLevelForFactor:a3 withNamespaceName:a4 withLanguage:a5 withCache:qword_26AF0BA28];
}

- (id)_trialLevelForFactor:()UAFTrialClient withNamespaceName:withLanguage:
{
  v1 = objc_msgSend(a1, "levelForFactor:withNamespaceName:");
  if (levelHasValidPath(v1)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (void)UAFCacheUpdate
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v36 = objc_opt_new();
  id v38 = objc_opt_new();
  v37 = objc_opt_new();
  uint64_t v39 = objc_opt_new();
  v0 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
    _os_log_impl(&dword_23797A000, v0, OS_LOG_TYPE_DEFAULT, "%s Running UAFCacheUpdate", buf, 0xCu);
  }

  v1 = +[UAFTrialConversions entitledTrialNamespaceNames];
  id v2 = v1;
  if (v1 && [v1 count])
  {
    _ProjectToNamespacesMapping();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v34 = [v3 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (!v34) {
      goto LABEL_41;
    }
    uint64_t v32 = *(void *)v46;
    v33 = v3;
    while (1)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v3);
        }
        uint64_t v35 = v4;
        id v5 = *(void **)(*((void *)&v45 + 1) + 8 * v4);
        v40 = objc_msgSend(MEMORY[0x263F80E18], "clientWithIdentifier:", objc_msgSend(v5, "intValue", v32));
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v6 = [v3 objectForKey:v5];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v42;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v42 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
              id v12 = objc_msgSend(MEMORY[0x263F80EA8], "namespaceNameFromId:", objc_msgSend(v11, "intValue"));
              if ([v2 containsObject:v12])
              {
                if (+[UAFCommonUtilities isInternalInstall])
                {
                  id v13 = [(id)objc_opt_class() _rootFactorLevelsWithNamespaceName:v12];
                  id v14 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    __int16 v51 = 2112;
                    uint64_t v52 = v12;
                    _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Processing any root factorlevels in %@ for cache", buf, 0x16u);
                  }

                  [MEMORY[0x263F80E18] _addFactorLevelsToCache:v13 namespaceName:v12 withFactorLevelsCache:v36 withLevelCache:v37];
                }
                int v15 = [v11 intValue];
                if (v15 == 401 || v15 == 751 || v15 == 406)
                {
                  uint64_t v16 = v40;
                  goto LABEL_24;
                }
                uint64_t v16 = [v40 rolloutIdentifiersWithNamespaceName:v12];
                uint64_t v17 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
                BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
                if (v16)
                {
                  if (v19)
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    __int16 v51 = 2112;
                    uint64_t v52 = v12;
                    _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s Active rollout exists for %@, skipping factory asset check", buf, 0x16u);
                  }
                }
                else
                {
                  if (v19)
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    __int16 v51 = 2112;
                    uint64_t v52 = v12;
                    _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s No active rollout for %@ exists, performing factory check", buf, 0x16u);
                  }

                  uint64_t v16 = 0;
LABEL_24:
                  uint64_t v17 = [(id)objc_opt_class() _factoryFactorLevelsWithNamespaceName:v12 onDemandClient:v16];
                  id v18 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                    __int16 v51 = 2112;
                    uint64_t v52 = v12;
                    _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s Processing any factory factorlevels in %@ for cache", buf, 0x16u);
                  }

                  [MEMORY[0x263F80E18] _addFactorLevelsToCache:v17 namespaceName:v12 withFactorLevelsCache:v38 withLevelCache:v39];
                }

                goto LABEL_30;
              }
              uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
                __int16 v51 = 2112;
                uint64_t v52 = v12;
                _os_log_debug_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEBUG, "%s Process is not entitled for %@, skipping", buf, 0x16u);
              }
LABEL_30:

              ++v10;
            }
            while (v8 != v10);
            uint64_t v20 = [v6 countByEnumeratingWithState:&v41 objects:v53 count:16];
            uint64_t v8 = v20;
          }
          while (v20);
        }

        uint64_t v4 = v35 + 1;
        id v3 = v33;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (!v34)
      {
LABEL_41:
        __int16 v21 = (void *)qword_26AF0BA30;
        qword_26AF0BA30 = (uint64_t)v36;
        id v22 = v36;

        uint64_t v23 = (void *)_MergedGlobals_8;
        _MergedGlobals_8 = (uint64_t)v37;
        id v24 = v37;

        uint64_t v25 = (void *)qword_26AF0BA38;
        qword_26AF0BA38 = (uint64_t)v38;
        id v26 = v38;

        v27 = (void *)qword_26AF0BA28;
        qword_26AF0BA28 = v39;

        goto LABEL_45;
      }
    }
  }
  v28 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v50 = "+[TRIClient(UAFTrialClient) UAFCacheUpdate]";
    _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s Process is not entitled for any trial namespaces, skipping cache population", buf, 0xCu);
  }

  v29 = (void *)qword_26AF0BA30;
  qword_26AF0BA30 = (uint64_t)v36;
  id v3 = v36;

  v30 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v37;
  id v22 = v37;

  v31 = (void *)qword_26AF0BA38;
  qword_26AF0BA38 = (uint64_t)v38;
  id v24 = v38;

  id v26 = (id)qword_26AF0BA28;
  qword_26AF0BA28 = v39;
LABEL_45:
}

+ (void)_addFactorLevelsToCache:()UAFTrialClient namespaceName:withFactorLevelsCache:withLevelCache:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v21 = a5;
  id v11 = a6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v16 hasLevel])
        {
          uint64_t v17 = (void *)MEMORY[0x263F80E18];
          id v18 = [v16 level];
          BOOL v19 = [v16 factor];
          uint64_t v20 = [v19 name];
          [v17 _addLevelToCache:v18 namespaceName:v10 factorName:v20 withCache:v11];
        }
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  [v21 setObject:v9 forKeyedSubscript:v10];
}

+ (void)_addLevelToCache:()UAFTrialClient namespaceName:factorName:withCache:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v9 metadata];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"locale"];

  int v15 = [(id)objc_opt_class() _levelKeyForCache:v12 withFactorName:v11 withLanguage:v14];

  if (levelHasValidPath(v9))
  {
    uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextTrialCategory);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      id v18 = "+[TRIClient(UAFTrialClient) _addLevelToCache:namespaceName:factorName:withCache:]";
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s Adding level with key %@ to cache", (uint8_t *)&v17, 0x16u);
    }

    [v10 setObject:v9 forKeyedSubscript:v15];
  }
}

+ (uint64_t)_levelKeyForCache:()UAFTrialClient withFactorName:withLanguage:
{
  return [a3 stringByAppendingFormat:@":%@:%@", a4, a5];
}

+ (id)_queryAssetsWithNamespaceName:()UAFTrialClient factorName:language:isRoot:withError:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = +[UAFTrialConversions assetTypeFromNamespaceName:v11];
  if (!v14)
  {
    int v15 = [NSString stringWithFormat:@"failed to convert namespace %@ to asset type", v11];
    createError(a7, v15);
    __int16 v19 = 0;
    goto LABEL_16;
  }
  int v15 = [@"com.apple.MobileAsset.Trial.Siri." stringByAppendingString:v14];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v15];
  int v17 = v16;
  if (!v16)
  {
    [NSString stringWithFormat:@"failed to create MAAssetQuery for %@:%@:%@, assetType: %@", v11, v12, v13, v15];
    goto LABEL_13;
  }
  [v16 returnTypes:3];
  [v17 setDoNotBlockOnNetworkStatus:1];
  [v17 setDoNotBlockBeforeFirstUnlock:1];
  if (v12) {
    [v17 addKeyValuePair:@"Factor" with:v12];
  }
  if (v13) {
    [v17 addKeyValuePair:@"locale" with:v13];
  }
  if (a6) {
    [v17 addKeyValuePair:@"isRoot" with:@"1"];
  }
  uint64_t v18 = [v17 queryMetaDataSync];
  if (v18)
  {
    [NSString stringWithFormat:@"MA query for %@ failed with result: %ld", v15, v18, v24, v25];
LABEL_13:
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    createError(a7, v20);
    goto LABEL_14;
  }
  id v20 = [v17 results];
  if ([v20 count])
  {
    if (!a6 || (unint64_t v22 = [v20 count], !v12) || v22 < 2)
    {
      id v20 = v20;
      __int16 v19 = v20;
      goto LABEL_15;
    }
    [NSString stringWithFormat:@"MA query for roots of AssetType %@, factorName: %@, language: %@ had multiple results.  This is commonly due to multiple roots being installed.  Unclear which one to return.", v15, v12, v13];
  }
  else
  {
    [NSString stringWithFormat:@"MA query for AssetType %@, factorName: %@, language: %@ had no results", v15, v12, v13];
  long long v23 = };
  createError(a7, v23);

LABEL_14:
  __int16 v19 = 0;
LABEL_15:

LABEL_16:

  return v19;
}

- (void)_initOnce
{
  if (_initOnce_initOnce != -1) {
    dispatch_once(&_initOnce_initOnce, &__block_literal_global_9);
  }
}

@end