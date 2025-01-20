@interface UAFAutoAssetSet
+ (id)autoAssetEntryToAsset:(id)a3 withAssetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6;
+ (id)catalogAssetSetID:(id)a3;
+ (id)getClientName;
+ (id)getConcurrentQueue;
+ (id)getLockReason:(id)a3;
+ (id)getMapReason:(id)a3;
- (BOOL)experimentActivated;
- (BOOL)lockAutoAssets:(id)a3 error:(id *)a4;
- (MAAutoAssetSet)autoAssetSet;
- (MAAutoAssetSetStatus)autoAssetSetStatus;
- (NSMutableDictionary)assets;
- (NSString)assetSetName;
- (NSString)atomicInstance;
- (NSString)catalogAssetSetID;
- (NSUUID)uuid;
- (UAFAutoAssetSet)initWithAssetSetName:(id)a3 autoAssets:(id)a4 uuid:(id)a5 experiment:(id)a6 atomicInstance:(id)a7 error:(id *)a8;
- (id)assetWithName:(id)a3 autoAssets:(id)a4 experiment:(id)a5;
- (id)getMAAutoAssetDownloadErrorsSync;
- (id)loadAutoAssets:(id)a3 experiment:(id)a4 experimentActivated:(BOOL *)a5;
- (void)dealloc;
- (void)invalidateWithQueue:(id)a3 completion:(id)a4;
- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)setAssetSetName:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAtomicInstance:(id)a3;
- (void)setAutoAssetSet:(id)a3;
- (void)setAutoAssetSetStatus:(id)a3;
- (void)setCatalogAssetSetID:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAFAutoAssetSet

- (id)loadAutoAssets:(id)a3 experiment:(id)a4 experimentActivated:(BOOL *)a5
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v90 = a4;
  v85 = self;
  v86 = v8;
  if (!v8)
  {
    v50 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      assetSetName = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = uuid;
      *(_WORD *)&buf[22] = 2114;
      v125 = (uint64_t (*)(uint64_t, uint64_t))uuid;
      LOWORD(v126) = 2114;
      *(void *)((char *)&v126 + 2) = assetSetName;
      _os_log_error_impl(&dword_23797A000, v50, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as autoAssets is unexpectedly nil", buf, 0x2Au);
    }

    if (self->_autoAssetSetStatus) {
      goto LABEL_51;
    }
    goto LABEL_48;
  }
  if (!self->_autoAssetSetStatus)
  {
LABEL_48:
    v51 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v79 = self->_uuid;
      v80 = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v79;
      *(_WORD *)&buf[22] = 2114;
      v125 = (uint64_t (*)(uint64_t, uint64_t))v79;
      LOWORD(v126) = 2114;
      *(void *)((char *)&v126 + 2) = v80;
      _os_log_error_impl(&dword_23797A000, v51, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as _autoAssetSetStatus is unexpectedly nil", buf, 0x2Au);
    }

LABEL_51:
    id v52 = 0;
    goto LABEL_79;
  }
  v87 = a5;
  v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t spid = os_signpost_id_generate(v9);

  v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v11 = v10;
  unint64_t v82 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = self->_uuid;
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Load AutoAssets", "%{public}@", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v125 = __Block_byref_object_copy__2;
  *(void *)&long long v126 = __Block_byref_object_dispose__2;
  *((void *)&v126 + 1) = 0;
  v13 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v113 objects:v123 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v114;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v114 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v113 + 1) + 8 * i);
        v19 = [v14 objectForKeyedSubscript:v18];
        v20 = [v19 objectForKeyedSubscript:@"AssetSpecifier"];
        [v13 setObject:v18 forKeyedSubscript:v20];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v113 objects:v123 count:16];
    }
    while (v15);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v21 = [(MAAutoAssetSetStatus *)v85->_autoAssetSetStatus latestDowloadedAtomicInstanceEntries];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v110;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v110 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v109 + 1) + 8 * j);
        v26 = [v25 fullAssetSelector];
        v27 = [v26 assetSpecifier];
        v28 = [v13 objectForKeyedSubscript:v27];

        if (v28)
        {
          if (!*(void *)(*(void *)&buf[8] + 40))
          {
            uint64_t v29 = objc_opt_new();
            v30 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v29;
          }
          v31 = +[UAFAutoAssetSet autoAssetEntryToAsset:v25 withAssetName:v28 experimentationEnabled:v90 != 0 experimentId:0];
          [*(id *)(*(void *)&buf[8] + 40) setObject:v31 forKeyedSubscript:v28];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v22);
  }

  if (!v90
    || ([v90 assetSpecifiers], (v32 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([v90 experimentId],
        v33 = objc_claimAutoreleasedReturnValue(),
        BOOL v34 = v33 == 0,
        v33,
        v32,
        v34))
  {
    v53 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v54 = v53;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
    {
      v55 = v85->_uuid;
      *(_DWORD *)v120 = 138543362;
      v121 = v55;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v54, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
    }

    id v52 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_78;
  }
  v35 = objc_opt_new();
  v89 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v36 = [(MAAutoAssetSetStatus *)v85->_autoAssetSetStatus latestDowloadedAtomicInstanceEntries];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v106;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v106 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v105 + 1) + 8 * k);
        v41 = [v40 fullAssetSelector];
        v42 = [v41 assetSpecifier];
        [v89 addObject:v42];

        v43 = [v90 assetSpecifiers];
        v44 = [v40 fullAssetSelector];
        v45 = [v44 assetSpecifier];
        v46 = [v43 objectForKeyedSubscript:v45];

        if (v46) {
          [v35 addObject:v46];
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v119 count:16];
    }
    while (v37);
  }

  BOOL *v87 = 1;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v35;
  uint64_t v47 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v102;
    while (2)
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v102 != v48) {
          objc_enumerationMutation(obj);
        }
        if (([v89 containsObject:*(void *)(*((void *)&v101 + 1) + 8 * m)] & 1) == 0)
        {
          BOOL *v87 = 0;
          goto LABEL_57;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
      if (v47) {
        continue;
      }
      break;
    }
  }
LABEL_57:

  if (![obj count])
  {
    BOOL *v87 = 0;
LABEL_73:
    v73 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v74 = v73;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      v75 = v85->_uuid;
      *(_DWORD *)v120 = 138543362;
      v121 = v75;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v74, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
    }

    id v52 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_77;
  }
  if (!*v87) {
    goto LABEL_73;
  }
  v56 = objc_opt_new();
  v57 = [v90 assetSpecifiers];
  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke;
  v98[3] = &unk_264CEB690;
  id v58 = v56;
  id v99 = v58;
  id v81 = v13;
  id v100 = v81;
  [v57 enumerateKeysAndObjectsUsingBlock:v98];

  v88 = objc_opt_new();
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v59 = [(MAAutoAssetSetStatus *)v85->_autoAssetSetStatus latestDowloadedAtomicInstanceEntries];
  uint64_t v60 = [v59 countByEnumeratingWithState:&v94 objects:v117 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v95;
    do
    {
      for (uint64_t n = 0; n != v60; ++n)
      {
        if (*(void *)v95 != v61) {
          objc_enumerationMutation(v59);
        }
        v63 = *(void **)(*((void *)&v94 + 1) + 8 * n);
        v64 = [v63 fullAssetSelector];
        v65 = [v64 assetSpecifier];
        v66 = [v58 objectForKeyedSubscript:v65];

        if (v66)
        {
          v67 = [v90 experimentId];
          v68 = +[UAFAutoAssetSet autoAssetEntryToAsset:v63 withAssetName:v66 experimentationEnabled:1 experimentId:v67];
          [v88 setObject:v68 forKeyedSubscript:v66];
        }
      }
      uint64_t v60 = [v59 countByEnumeratingWithState:&v94 objects:v117 count:16];
    }
    while (v60);
  }

  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke_2;
  v91[3] = &unk_264CEB6B8;
  id v69 = v88;
  id v92 = v69;
  v93 = buf;
  [v81 enumerateKeysAndObjectsUsingBlock:v91];
  v70 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v71 = v70;
  if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    v72 = v85->_uuid;
    *(_DWORD *)v120 = 138543362;
    v121 = v72;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v71, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
  }

  id v52 = *(id *)(*(void *)&buf[8] + 40);
LABEL_77:

LABEL_78:
  _Block_object_dispose(buf, 8);

LABEL_79:

  return v52;
}

+ (id)autoAssetEntryToAsset:(id)a3 withAssetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  BOOL v45 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v47 = a4;
  v46 = (__CFString *)a6;
  v9 = objc_opt_new();
  v10 = [v8 assetID];
  [v9 setObject:v10 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetId"];

  v11 = [v8 fullAssetSelector];
  v12 = [v11 assetType];
  [v9 setObject:v12 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetType"];

  v13 = [v8 fullAssetSelector];
  id v14 = [v13 assetSpecifier];
  [v9 setObject:v14 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetSpecifier"];

  [v9 setObject:@"MA" forKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];
  uint64_t v15 = [v8 assetAttributes];
  uint64_t v16 = [v15 objectForKey:@"_DownloadSize"];
  uint64_t v17 = [v16 longLongValue];

  uint64_t v18 = [NSNumber numberWithLongLong:v17];
  v19 = [v18 stringValue];
  uint64_t v48 = v9;
  [v9 setObject:v19 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.ReportedDownloadSize"];

  v20 = [v8 localContentURL];
  uint64_t v21 = [v8 localContentURL];
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    uint64_t v23 = [v8 localContentURL];
    v24 = [v23 scheme];

    if (!v24)
    {
      v25 = NSURL;
      v26 = [v8 localContentURL];
      v27 = [v26 absoluteString];
      uint64_t v28 = [v25 fileURLWithPath:v27 isDirectory:1];

      v20 = (void *)v28;
    }
  }
  v44 = v20;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v29 = [v8 assetAttributes];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        v35 = [v8 assetAttributes];
        v36 = [v35 objectForKeyedSubscript:v34];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v38 = [v8 assetAttributes];
          v39 = [v38 objectForKeyedSubscript:v34];
          [v48 setObject:v39 forKeyedSubscript:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v31);
  }

  if (v45) {
    v40 = @"YES";
  }
  else {
    v40 = @"NO";
  }
  [v48 setObject:v40 forKeyedSubscript:@"ExperimentationEnabled"];
  if (v46) {
    v41 = v46;
  }
  else {
    v41 = &stru_26EA999B8;
  }
  [v48 setObject:v41 forKeyedSubscript:@"ExperimentId"];
  v42 = [[UAFAsset alloc] initWithName:v47 location:v44 metadata:v48];

  return v42;
}

- (id)assetWithName:(id)a3 autoAssets:(id)a4 experiment:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (self->_autoAssetSetStatus)
  {
    LOBYTE(v15) = 0;
    v9 = [(UAFAutoAssetSet *)self loadAutoAssets:a4 experiment:a5 experimentActivated:&v15];
    v10 = [v9 objectForKeyedSubscript:v8];
  }
  else
  {
    v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      assetSetName = self->_assetSetName;
      int v15 = 136315906;
      uint64_t v16 = "-[UAFAutoAssetSet assetWithName:autoAssets:experiment:]";
      __int16 v17 = 2114;
      uint64_t v18 = uuid;
      __int16 v19 = 2114;
      v20 = uuid;
      __int16 v21 = 2114;
      uint64_t v22 = assetSetName;
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as _autoAssetSetStatus is unexpectedly nil", (uint8_t *)&v15, 0x2Au);
    }

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(UAFAutoAssetSet *)self invalidateWithQueue:0 completion:0];
  v3.receiver = self;
  v3.super_class = (Class)UAFAutoAssetSet;
  [(UAFAutoAssetSet *)&v3 dealloc];
}

- (void)invalidateWithQueue:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x237E26B30]();
  id v9 = v6;
  v10 = v9;
  if (!v9)
  {
    v10 = +[UAFAutoAssetSet getConcurrentQueue];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke;
  v34[3] = &unk_264CEB6E0;
  id v11 = v7;
  id v36 = v11;
  id v12 = v10;
  id v35 = v12;
  v13 = (void (**)(void, void))MEMORY[0x237E26D50](v34);
  id v14 = self->_uuid;
  int v15 = [(UAFAutoAssetSet *)self atomicInstance];
  if (v15)
  {
    id v28 = v11;
    uint64_t v29 = v8;
    uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
    __int16 v19 = v18;
    os_signpost_id_t spid = v17;
    unint64_t v20 = v17 - 1;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = uuid;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Unlock AutoAssets", "%{public}@", buf, 0xCu);
    }

    autoAssetSet = self->_autoAssetSet;
    uint64_t v23 = +[UAFAutoAssetSet getLockReason:autoAssetSet];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke_295;
    v30[3] = &unk_264CEB708;
    uint64_t v31 = v14;
    id v32 = v15;
    v33 = v13;
    [(MAAutoAssetSet *)autoAssetSet endAtomicLock:v23 ofAtomicInstance:v32 completion:v30];

    v24 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v25 = v24;
    if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      v26 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v25, OS_SIGNPOST_INTERVAL_END, spid, "Unlock AutoAssets", "%{public}@", buf, 0xCu);
    }

    id v11 = v28;
    id v8 = v29;
  }
  else
  {
    v13[2](v13, 0);
  }
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_7);
  }
  v2 = (void *)qword_26AF0B9F0;

  return v2;
}

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (UAFAutoAssetSet)initWithAssetSetName:(id)a3 autoAssets:(id)a4 uuid:(id)a5 experiment:(id)a6 atomicInstance:(id)a7 error:(id *)a8
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v46.receiver = self;
  v46.super_class = (Class)UAFAutoAssetSet;
  unint64_t v20 = [(UAFAutoAssetSet *)&v46 init];
  __int16 v21 = v20;
  if (v20)
  {
    id v42 = v16;
    id v43 = v19;
    id v22 = v18;
    id v23 = v17;
    id v41 = v15;
    if (a8) {
      *a8 = 0;
    }
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v21->_assetSetName, a3);
    id v24 = objc_alloc(MEMORY[0x263F55980]);
    assetSetName = v21->_assetSetName;
    v26 = +[UAFAutoAssetSet getConcurrentQueue];
    id v45 = 0;
    uint64_t v27 = [v24 initLockerUsingClientDomain:@"com.apple.UnifiedAssetFramework" forAssetSetIdentifier:assetSetName usingDesiredPolicyCategory:0 completingFromQueue:v26 error:&v45];
    id v28 = v45;
    autoAssetSet = v21->_autoAssetSet;
    v21->_autoAssetSet = (MAAutoAssetSet *)v27;

    if (a8) {
      *a8 = v28;
    }
    id v18 = v22;
    if (!v21->_autoAssetSet || v28)
    {
      id v36 = UAFGetLogCategory((void **)&UAFLogContextClient);
      id v15 = v41;
      id v17 = v23;
      id v19 = v43;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uuid = v21->_uuid;
        v40 = v21->_assetSetName;
        *(_DWORD *)buf = 136316162;
        uint64_t v48 = "-[UAFAutoAssetSet initWithAssetSetName:autoAssets:uuid:experiment:atomicInstance:error:]";
        __int16 v49 = 2114;
        long long v50 = uuid;
        __int16 v51 = 2114;
        long long v52 = uuid;
        __int16 v53 = 2114;
        uint64_t v54 = v40;
        __int16 v55 = 2114;
        id v56 = v28;
        _os_log_error_impl(&dword_23797A000, v36, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x34u);
      }

      uint64_t v37 = v21->_autoAssetSet;
      v21->_autoAssetSet = 0;

      id v35 = 0;
      id v16 = v42;
    }
    else
    {
      id v44 = 0;
      id v19 = v43;
      BOOL v30 = [(UAFAutoAssetSet *)v21 lockAutoAssets:v43 error:&v44];
      id v31 = v44;
      id v28 = v31;
      id v17 = v23;
      if (v30)
      {
        id v16 = v42;
        if (v42)
        {
          uint64_t v32 = [(UAFAutoAssetSet *)v21 loadAutoAssets:v42 experiment:v18 experimentActivated:&v21->_experimentActivated];
          assets = v21->_assets;
          v21->_assets = (NSMutableDictionary *)v32;

          autoAssetSetStatus = v21->_autoAssetSetStatus;
          v21->_autoAssetSetStatus = 0;
        }
        id v35 = v21;
      }
      else
      {
        id v16 = v42;
        if (a8)
        {
          id v28 = v31;
          id v35 = 0;
          *a8 = v28;
        }
        else
        {
          id v35 = 0;
        }
      }
      id v15 = v41;
    }
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (BOOL)lockAutoAssets:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = (NSString *)a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Lock AutoAssets", "%{public}@", buf, 0xCu);
  }

  autoAssetSet = self->_autoAssetSet;
  v13 = +[UAFAutoAssetSet getLockReason:autoAssetSet];
  id v35 = 0;
  id v14 = [(MAAutoAssetSet *)autoAssetSet lockAtomicSync:v13 forAtomicInstance:v6 error:&v35];
  id v15 = v35;
  autoAssetSetStatus = self->_autoAssetSetStatus;
  self->_autoAssetSetStatus = v14;

  id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    id v19 = self->_uuid;
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = (const char *)v19;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v18, OS_SIGNPOST_INTERVAL_END, v8, "Lock AutoAssets", "%{public}@", buf, 0xCu);
  }

  unint64_t v20 = self->_autoAssetSetStatus;
  if (v20
    && ([(MAAutoAssetSetStatus *)v20 latestDownloadedAtomicInstance],
        __int16 v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v21)
    && !v15)
  {
    id v22 = [(MAAutoAssetSetStatus *)self->_autoAssetSetStatus latestDownloadedAtomicInstance];
    atomicInstance = self->_atomicInstance;
    self->_atomicInstance = v22;

    id v24 = [(MAAutoAssetSetStatus *)self->_autoAssetSetStatus downloadedCatalogCachedAssetSetID];
    catalogAssetSetID = self->_catalogAssetSetID;
    self->_catalogAssetSetID = v24;

    v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = self->_uuid;
      assetSetName = self->_assetSetName;
      uint64_t v29 = self->_atomicInstance;
      *(_DWORD *)buf = 136316162;
      uint64_t v37 = "-[UAFAutoAssetSet lockAutoAssets:error:]";
      __int16 v38 = 2114;
      uint64_t v39 = v27;
      __int16 v40 = 2114;
      id v41 = v27;
      __int16 v42 = 2114;
      id v43 = assetSetName;
      __int16 v44 = 2114;
      id v45 = v29;
      _os_log_impl(&dword_23797A000, v26, OS_LOG_TYPE_DEFAULT, "%s %{public}@: %{public}@ Locked asset set %{public}@ atomic instance %{public}@", buf, 0x34u);
    }

    BOOL v30 = 1;
  }
  else
  {
    id v31 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v33 = self->_uuid;
      uint64_t v34 = self->_assetSetName;
      *(_DWORD *)buf = 136316418;
      uint64_t v37 = "-[UAFAutoAssetSet lockAutoAssets:error:]";
      __int16 v38 = 2114;
      uint64_t v39 = v33;
      __int16 v40 = 2114;
      id v41 = v33;
      __int16 v42 = 2114;
      id v43 = v6;
      __int16 v44 = 2114;
      id v45 = v34;
      __int16 v46 = 2114;
      id v47 = v15;
      _os_log_error_impl(&dword_23797A000, v31, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not lock asset set %{public}@ with atomic instance %{public}@: %{public}@", buf, 0x3Eu);
    }

    BOOL v30 = 0;
    if (a4) {
      *a4 = v15;
    }
  }

  return v30;
}

+ (id)getLockReason:(id)a3
{
  objc_super v3 = NSString;
  id v4 = a3;
  v5 = [v4 assetSetIdentifier];
  id v6 = [v4 autoAssetSetClientName];

  id v7 = [v3 stringWithFormat:@"UAFAssetSet lock of %@ for %@", v5, v6];

  return v7;
}

void __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke_2;
    v6[3] = &unk_264CEB4D0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomicInstance, 0);
  objc_storeStrong((id *)&self->_catalogAssetSetID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_autoAssetSetStatus, 0);

  objc_storeStrong((id *)&self->_autoAssetSet, 0);
}

- (BOOL)experimentActivated
{
  return self->_experimentActivated;
}

- (NSMutableDictionary)assets
{
  return self->_assets;
}

void __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke_295(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  id v8 = v7;
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      int v13 = 136315906;
      id v14 = "-[UAFAutoAssetSet invalidateWithQueue:completion:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s %{public}@ Failed to unlock asset set %{public}@ instance %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v13 = 136315906;
    id v14 = "-[UAFAutoAssetSet invalidateWithQueue:completion:]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ Unlocked asset set %{public}@ atomic instance %{public}@", (uint8_t *)&v13, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __37__UAFAutoAssetSet_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAutoAssetSet.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0B9F0;
  qword_26AF0B9F0 = (uint64_t)v0;
}

+ (id)getClientName
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    id v4 = [MEMORY[0x263F086E0] mainBundle];
    id v3 = [v4 executablePath];
  }

  return v3;
}

+ (id)getMapReason:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 assetSetIdentifier];
  id v6 = [v4 autoAssetSetClientName];

  id v7 = [v3 stringWithFormat:@"UAFAssetSet map of %@ for %@", v5, v6];

  return v7;
}

void __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (v4)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

uint64_t __50__UAFAutoAssetSet_invalidateWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)catalogAssetSetID:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F55980]);
  uint64_t v5 = +[UAFAutoAssetSet getClientName];
  uint64_t v6 = +[UAFAutoAssetSet getConcurrentQueue];
  id v22 = 0;
  id v7 = (void *)[v4 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:v5 forAssetSetIdentifier:v3 comprisedOfEntries:0 completingFromQueue:v6 error:&v22];
  id v8 = v22;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v21 = 0;
    uint64_t v12 = [v7 currentSetStatusSync:&v21];
    id v8 = v21;
    if (v8)
    {
      int v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
        __int16 v25 = 2114;
        id v26 = v3;
        __int16 v27 = 2114;
        id v28 = v8;
        id v14 = "%s Could not get status of auto asset set %{public}@ : %{public}@";
        __int16 v15 = v13;
        uint32_t v16 = 32;
LABEL_11:
        _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      __int16 v19 = [v12 downloadedCatalogCachedAssetSetID];
      if (v19)
      {
        __int16 v17 = v19;
        if (![v19 isEqualToString:v3]) {
          goto LABEL_14;
        }
        uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
          _os_log_fault_impl(&dword_23797A000, v20, OS_LOG_TYPE_FAULT, "%s MA AutoAssetSet's assetSetID is same as assetSetName", buf, 0xCu);
        }

        int v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
        UAFFaultCapture((uint64_t)v13, (uint64_t)kUAFABCMissingAssetSetIDFailure, (uint64_t)v3, 0);
LABEL_13:

LABEL_14:
        uint64_t v10 = v17;

        uint64_t v11 = v10;
        goto LABEL_15;
      }
      int v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
        __int16 v25 = 2114;
        id v26 = v3;
        id v14 = "%s MA AutoAssetSet's downloadedCatalogCachedAssetSetID is nil for asset set - %{public}@";
        __int16 v15 = v13;
        uint32_t v16 = 22;
        goto LABEL_11;
      }
    }
    __int16 v17 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
    __int16 v25 = 2114;
    id v26 = v3;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
  }
  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (id)getMAAutoAssetDownloadErrorsSync
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F08760]);
  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    id v19 = 0;
    uint64_t v5 = [(MAAutoAssetSet *)autoAssetSet currentSetStatusSync:&v19];
    uint64_t v6 = v19;
    if (v6)
    {
      id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      uuid = self->_uuid;
      BOOL v9 = [(MAAutoAssetSet *)self->_autoAssetSet summary];
      *(_DWORD *)buf = 136315906;
      id v21 = "-[UAFAutoAssetSet getMAAutoAssetDownloadErrorsSync]";
      __int16 v22 = 2114;
      id v23 = uuid;
      __int16 v24 = 2114;
      __int16 v25 = v9;
      __int16 v26 = 2114;
      __int16 v27 = v6;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not get the current status of auto asset  %{public}@ : %{public}@", buf, 0x2Au);
    }
    else
    {
      uint64_t v12 = [v5 availableForUseError];

      if (v12)
      {
        int v13 = NSNumber;
        id v14 = [v5 availableForUseError];
        __int16 v15 = objc_msgSend(v13, "numberWithLong:", objc_msgSend(v14, "code"));
        [v3 addObject:v15];
      }
      uint32_t v16 = [v5 newerVersionError];

      if (!v16) {
        goto LABEL_13;
      }
      __int16 v17 = NSNumber;
      id v7 = [v5 newerVersionError];
      objc_msgSend(v17, "numberWithLong:", -[NSObject code](v7, "code"));
      BOOL v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      [v3 addObject:v9];
    }

    goto LABEL_12;
  }
  uint64_t v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = self->_uuid;
    assetSetName = self->_assetSetName;
    *(_DWORD *)buf = 136315650;
    id v21 = "-[UAFAutoAssetSet getMAAutoAssetDownloadErrorsSync]";
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2114;
    __int16 v25 = assetSetName;
    _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s %{public}@: Did not have auto asset set object for set %{public}@ when attempting to gather errors", buf, 0x20u);
  }
LABEL_14:

  return v3;
}

- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5
{
  v87[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = +[UAFAutoAssetSet getConcurrentQueue];
  }
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke;
  v69[3] = &unk_264CEB6E0;
  id v13 = v10;
  id v71 = v13;
  id v14 = v12;
  id v70 = v14;
  __int16 v15 = (void (**)(void, void))MEMORY[0x237E26D50](v69);
  if (self->_atomicInstance)
  {
    uint32_t v16 = [(UAFAutoAssetSet *)self assets];
    __int16 v17 = [v16 objectForKeyedSubscript:v8];

    if (v17)
    {
      id v18 = [v17 metadata];
      id v19 = [v18 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetType"];

      if (v19)
      {
        uint64_t v20 = [v17 metadata];
        id v21 = [v20 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetSpecifier"];

        if (v21)
        {
          v63 = v13;
          id v64 = v8;
          id v22 = objc_alloc(MEMORY[0x263F55980]);
          id v23 = +[UAFAutoAssetSet getClientName];
          assetSetName = self->_assetSetName;
          id v68 = 0;
          uint64_t v25 = [v22 initUsingClientDomain:@"com.apple.UnifiedAssetFramework" forClientName:v23 forAssetSetIdentifier:assetSetName comprisedOfEntries:0 completingFromQueue:v14 error:&v68];
          id v65 = v68;

          v62 = (void *)v25;
          if (v25)
          {
            __int16 v26 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:v19 withAssetSpecifier:v21];
            __int16 v27 = UAFGetLogCategory((void **)&UAFLogContextClient);
            uint64_t v28 = v27;
            id v61 = v14;
            if (v26)
            {
              uint64_t v60 = v26;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                uuid = self->_uuid;
                BOOL v30 = [v26 summary];
                atomicInstance = self->_atomicInstance;
                *(_DWORD *)buf = 136315906;
                v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
                __int16 v80 = 2114;
                id v81 = uuid;
                __int16 v82 = 2114;
                v83 = v30;
                __int16 v84 = 2114;
                v85 = atomicInstance;
                _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Mapping %{public}@ from atomic instance %{public}@", buf, 0x2Au);
              }
              uint64_t v32 = v62;
              v33 = +[UAFAutoAssetSet getMapReason:v62];
              uint64_t v34 = self->_atomicInstance;
              v66[0] = MEMORY[0x263EF8330];
              v66[1] = 3221225472;
              v66[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_315;
              v66[3] = &unk_264CEB730;
              v66[4] = self;
              id v67 = v63;
              id v35 = v34;
              id v13 = v63;
              id v36 = v60;
              [v62 mapLockedAtomicEntry:v33 forAtomicInstance:v35 mappingSelector:v60 completion:v66];

              id v8 = v64;
              uint64_t v37 = v65;
            }
            else
            {
              id v36 = 0;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v59 = self->_uuid;
                *(_DWORD *)buf = 136315906;
                v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
                __int16 v80 = 2114;
                id v81 = v59;
                __int16 v82 = 2114;
                v83 = v19;
                __int16 v84 = 2114;
                v85 = v21;
                _os_log_error_impl(&dword_23797A000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not create selector for asset type: %{public}@ specifier: %{public}@", buf, 0x2Au);
              }

              uint64_t v37 = v65;
              ((void (**)(void, id))v15)[2](v15, v65);
              id v13 = v63;
              id v8 = v64;
              uint64_t v32 = v62;
            }

            id v14 = v61;
          }
          else
          {
            __int16 v49 = UAFGetLogCategory((void **)&UAFLogContextClient);
            id v13 = v63;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              uint64_t v57 = self->_uuid;
              id v58 = self->_assetSetName;
              *(_DWORD *)buf = 136315906;
              v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
              __int16 v80 = 2114;
              id v81 = v57;
              __int16 v82 = 2114;
              v83 = v58;
              __int16 v84 = 2114;
              v85 = (NSString *)v65;
              _os_log_error_impl(&dword_23797A000, v49, OS_LOG_TYPE_ERROR, "%s %{public}@: Error initializing MAAutoAssetSet for %{public}@: %{public}@", buf, 0x2Au);
            }

            uint64_t v37 = v65;
            ((void (**)(void, id))v15)[2](v15, v65);
            id v8 = v64;
            uint64_t v32 = 0;
          }
        }
        else
        {
          __int16 v46 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            __int16 v55 = self->_uuid;
            id v56 = self->_assetSetName;
            *(_DWORD *)buf = 136315906;
            v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
            __int16 v80 = 2114;
            id v81 = v55;
            __int16 v82 = 2114;
            v83 = (NSString *)v8;
            __int16 v84 = 2114;
            v85 = v56;
            _os_log_error_impl(&dword_23797A000, v46, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ in asset set %{public}@ has no asset specifier", buf, 0x2Au);
          }

          id v47 = (void *)MEMORY[0x263F087E8];
          uint64_t v72 = *MEMORY[0x263F08320];
          v73 = @"No asset specifier found";
          id v21 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
          uint64_t v48 = [v47 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5001 userInfo:v21];
          ((void (**)(void, void *))v15)[2](v15, v48);
        }
        goto LABEL_33;
      }
      id v45 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = self->_uuid;
        uint64_t v54 = self->_assetSetName;
        *(_DWORD *)buf = 136315906;
        v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
        __int16 v80 = 2114;
        id v81 = v53;
        __int16 v82 = 2114;
        v83 = (NSString *)v8;
        __int16 v84 = 2114;
        v85 = v54;
        _os_log_error_impl(&dword_23797A000, v45, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ in asset set %{public}@ has no asset type", buf, 0x2Au);
      }

      id v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v74 = *MEMORY[0x263F08320];
      v75 = @"No asset type found";
      __int16 v42 = NSDictionary;
      id v43 = &v75;
      __int16 v44 = &v74;
    }
    else
    {
      __int16 v40 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        __int16 v51 = self->_uuid;
        long long v52 = self->_assetSetName;
        *(_DWORD *)buf = 136315906;
        v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
        __int16 v80 = 2114;
        id v81 = v51;
        __int16 v82 = 2114;
        v83 = (NSString *)v8;
        __int16 v84 = 2114;
        v85 = v52;
        _os_log_error_impl(&dword_23797A000, v40, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ not found in asset set %{public}@", buf, 0x2Au);
      }

      id v41 = (void *)MEMORY[0x263F087E8];
      uint64_t v76 = *MEMORY[0x263F08320];
      v77 = @"No asset found";
      __int16 v42 = NSDictionary;
      id v43 = &v77;
      __int16 v44 = &v76;
    }
    id v19 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
    id v21 = [v41 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5001 userInfo:v19];
    ((void (**)(void, NSString *))v15)[2](v15, v21);
LABEL_33:

    goto LABEL_34;
  }
  __int16 v38 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    long long v50 = self->_uuid;
    *(_DWORD *)buf = 136315394;
    v79 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
    __int16 v80 = 2114;
    id v81 = v50;
    _os_log_error_impl(&dword_23797A000, v38, OS_LOG_TYPE_ERROR, "%s %{public}@: object has no atomic instance.  invalidate previously called?", buf, 0x16u);
  }

  uint64_t v39 = (void *)MEMORY[0x263F087E8];
  uint64_t v86 = *MEMORY[0x263F08320];
  v87[0] = @"No atomic instance";
  __int16 v17 = [NSDictionary dictionaryWithObjects:v87 forKeys:&v86 count:1];
  id v19 = [v39 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5001 userInfo:v17];
  ((void (**)(void, NSString *))v15)[2](v15, v19);
LABEL_34:
}

void __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_2;
    v6[3] = &unk_264CEB4D0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_315(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v12 = [v8 assetSpecifier];
    int v13 = 136316162;
    id v14 = "-[UAFAutoAssetSet mapAsset:queue:completion:]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Mapped specifier %{public}@ from atomic instance %{public}@ with error: %{public}@", (uint8_t *)&v13, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MAAutoAssetSet)autoAssetSet
{
  return self->_autoAssetSet;
}

- (void)setAutoAssetSet:(id)a3
{
}

- (MAAutoAssetSetStatus)autoAssetSetStatus
{
  return self->_autoAssetSetStatus;
}

- (void)setAutoAssetSetStatus:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
}

- (void)setAssets:(id)a3
{
}

- (NSString)catalogAssetSetID
{
  return self->_catalogAssetSetID;
}

- (void)setCatalogAssetSetID:(id)a3
{
}

- (void)setAtomicInstance:(id)a3
{
}

@end