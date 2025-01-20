@interface UAFAssetSet
+ (id)autoAssetSet:(id)a3 usages:(id)a4 uuid:(id)a5 autoAssets:(id)a6 experiment:(id)a7 atomicInstance:(id)a8 error:(id *)a9;
+ (id)autoAssets:(id)a3 usages:(id)a4;
+ (id)getEntitledTrialAssets:(id)a3 usages:(id)a4;
+ (id)getTrialPurgeabilityLevel:(unint64_t)a3;
- (BOOL)experimentationEnabled;
- (BOOL)markAssetsPromoted:(id)a3 error:(id *)a4;
- (BOOL)markAssetsProvisional:(id)a3 error:(id *)a4;
- (NSDictionary)usages;
- (NSError)autoAssetSetError;
- (NSString)assetSetId;
- (NSString)experimentId;
- (NSString)name;
- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4;
- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5;
- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5 disableExperimentation:(BOOL)a6 consistencyToken:(id)a7;
- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5;
- (UAFAssetSetConsistencyToken)consistencyToken;
- (UAFAssetSetExperiment)experiment;
- (UAFAutoAssetSet)autoAssetSet;
- (id)_createAssetFromTrialInfo:(id)a3 assetName:(id)a4 fallback:(BOOL)a5 validPathOnly:(BOOL)a6;
- (id)applyAssetTransformations:(id)a3;
- (id)applyMinVersions:(id)a3;
- (id)applyOSCompatibility:(id)a3;
- (id)assetNamed:(id)a3;
- (id)assetNamed:(id)a3 withUsage:(id)a4;
- (id)assetNamed:(id)a3 withUsage:(id)a4 disableExperimentation:(BOOL)a5;
- (id)assetSetIdForSELF:(BOOL)a3;
- (id)assets;
- (id)createAssetFromMAAsset:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6;
- (id)createAssetFromPreinstalledWithAutoAssetInfo:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6;
- (id)createAssetFromTrialInfo:(id)a3 assetName:(id)a4;
- (id)createAssets;
- (id)getAutoAssetPreinstalled;
- (id)getTrialAssets;
- (id)namespacesOfAssetNames:(id)a3 error:(id *)a4;
- (id)overlayRoots:(id)a3;
- (void)dealloc;
- (void)invalidateWithQueue:(id)a3 completion:(id)a4;
- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)setAutoAssetSet:(id)a3;
- (void)setAutoAssetSetError:(id)a3;
- (void)setExperiment:(id)a3;
@end

@implementation UAFAssetSet

+ (id)autoAssetSet:(id)a3 usages:(id)a4 uuid:(id)a5 autoAssets:(id)a6 experiment:(id)a7 atomicInstance:(id)a8 error:(id *)a9
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = [v13 name];
    int v30 = 138543618;
    id v31 = v14;
    __int16 v32 = 2114;
    v33 = v22;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "AutoAsset Assets", "%{public}@:%{public}@", (uint8_t *)&v30, 0x16u);
  }
  if (a9) {
    *a9 = 0;
  }
  v23 = [UAFAutoAssetSet alloc];
  v24 = [v13 name];
  v25 = [(UAFAutoAssetSet *)v23 initWithAssetSetName:v24 autoAssets:v17 uuid:v14 experiment:v16 atomicInstance:v15 error:a9];

  v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v27 = v26;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    v28 = [v13 name];
    int v30 = 138543618;
    id v31 = v14;
    __int16 v32 = 2114;
    v33 = v28;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v27, OS_SIGNPOST_INTERVAL_END, v19, "AutoAsset Assets", "%{public}@:%{public}@", (uint8_t *)&v30, 0x16u);
  }

  return v25;
}

+ (id)autoAssets:(id)a3 usages:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 autoAssetType];

  if (v7)
  {
    v8 = [v5 getAutoAssets:v6];
    v9 = v8;
    if (v8 && [v8 count])
    {
      v9 = v9;
      v10 = v9;
      goto LABEL_10;
    }
    v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v5 name];
      int v14 = 136315394;
      id v15 = "+[UAFAssetSet autoAssets:usages:]";
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_debug_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEBUG, "%s No Auto assets defined for %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    v11 = [v5 name];
    int v14 = 136315394;
    id v15 = "+[UAFAssetSet autoAssets:usages:]";
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEBUG, "%s Auto asset type not specified for %{public}@", (uint8_t *)&v14, 0x16u);
  }

LABEL_9:
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)assetNamed:(id)a3 withUsage:(id)a4 disableExperimentation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x237E26B30]();
  if (v5)
  {
    BOOL experimentationEnabled = 0;
    experimentId = 0;
  }
  else
  {
    BOOL experimentationEnabled = self->_experimentationEnabled;
    experimentId = self->_experimentId;
  }
  id v13 = experimentId;
  if (!+[UAFPreinstalledAssetsCache isEnabled])
  {
    id v15 = 0;
    goto LABEL_12;
  }
  int v14 = [(UAFAssetSetConfiguration *)self->_cfg getAutoAssets:v9];
  id v15 = [v14 objectForKeyedSubscript:v8];
  if (!v15
    || ([(UAFAssetSet *)self createAssetFromPreinstalledWithAutoAssetInfo:v15 assetName:v8 experimentationEnabled:experimentationEnabled experimentId:v13], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_12:
    int v14 = +[UAFAssetSet autoAssets:self->_cfg usages:v9];
    if (v14)
    {
      v21 = self->_experiment;
      v22 = v21;
      if (v5)
      {

        v22 = 0;
      }
      cachingAutoAssetSet = self->_cachingAutoAssetSet;
      if (cachingAutoAssetSet)
      {
        id v24 = 0;
      }
      else
      {
        v36 = v13;
        v37 = v10;
        id v38 = v8;
        cfg = self->_cfg;
        uuid = self->_uuid;
        experiment = self->_experiment;
        v28 = [(UAFAssetSetConsistencyToken *)self->_consistencyToken atomicInstance];
        id v39 = 0;
        v29 = +[UAFAssetSet autoAssetSet:cfg usages:v9 uuid:uuid autoAssets:0 experiment:experiment atomicInstance:v28 error:&v39];
        id v24 = v39;
        int v30 = self->_cachingAutoAssetSet;
        self->_cachingAutoAssetSet = v29;

        cachingAutoAssetSet = self->_cachingAutoAssetSet;
        if (!cachingAutoAssetSet)
        {
          __int16 v32 = UAFGetLogCategory((void **)&UAFLogContextClient);
          id v8 = v38;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = self->_uuid;
            v35 = [(UAFAssetSetConfiguration *)self->_cfg name];
            *(_DWORD *)buf = 136315906;
            v41 = "-[UAFAssetSet assetNamed:withUsage:disableExperimentation:]";
            __int16 v42 = 2114;
            v43 = v34;
            __int16 v44 = 2114;
            id v45 = v35;
            __int16 v46 = 2114;
            id v47 = v24;
            _os_log_error_impl(&dword_23797A000, v32, OS_LOG_TYPE_ERROR, "%s %{public}@: Auto assets for Asset %{public}@ cannot be locked:%{public}@", buf, 0x2Au);
          }
          id v20 = 0;
          id v13 = v36;
          v10 = v37;
          goto LABEL_26;
        }
        v10 = v37;
        id v8 = v38;
        id v13 = v36;
      }
      id v31 = [(UAFAutoAssetSet *)cachingAutoAssetSet assetWithName:v8 autoAssets:v14 experiment:v22];
      if (v31)
      {
        id v20 = v31;
LABEL_26:

        goto LABEL_27;
      }
    }
    [(UAFAssetSetConfiguration *)self->_cfg isTrialAvailable];
    id v20 = 0;
    goto LABEL_27;
  }
  id v17 = (void *)v16;
  uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v19 = self->_uuid;
    *(_DWORD *)buf = 136315650;
    v41 = "-[UAFAssetSet assetNamed:withUsage:disableExperimentation:]";
    __int16 v42 = 2114;
    v43 = v19;
    __int16 v44 = 2114;
    id v45 = v8;
    _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Returning %{public}@ from MA Root", buf, 0x20u);
  }

  id v20 = v17;
LABEL_27:

  return v20;
}

- (id)createAssetFromPreinstalledWithAutoAssetInfo:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(UAFAssetSetConfiguration *)self->_cfg autoAssetType];

  if (v13)
  {
    int v14 = [v10 objectForKeyedSubscript:@"AssetSpecifier"];
    if (v14)
    {
      id v15 = +[UAFPreinstalledAssetsCache assetSpecifier:v14 assetSetConfiguration:self->_cfg];
      uint64_t v16 = v15;
      if (v15)
      {
        id v15 = [(UAFAssetSet *)self createAssetFromMAAsset:v15 assetName:v11 experimentationEnabled:v7 experimentId:v12];
      }
      id v17 = v15;

      uint64_t v18 = v17;
    }
    else
    {
      id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        int v21 = 136315650;
        v22 = "-[UAFAssetSet createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:]";
        __int16 v23 = 2114;
        id v24 = v11;
        __int16 v25 = 2114;
        v26 = name;
        _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s No AutoAssetSpecifier for \"%{public}@\" asset in \"%{public}@\" asset set, skipping", (uint8_t *)&v21, 0x20u);
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)assetNamed:(id)a3 withUsage:(id)a4
{
  return [(UAFAssetSet *)self assetNamed:a3 withUsage:a4 disableExperimentation:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_autoAssetSetError, 0);
  objc_storeStrong((id *)&self->_autoAssetSet, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_consistencyToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetNameToAutoAsset, 0);
  objc_storeStrong((id *)&self->_assetNameToTrial, 0);
  objc_storeStrong((id *)&self->_minVersions, 0);
  objc_storeStrong((id *)&self->_cachingAutoAssetSet, 0);
  objc_storeStrong((id *)&self->_cfg, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5 disableExperimentation:(BOOL)a6 consistencyToken:(id)a7
{
  BOOL v8 = a6;
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x237E26B30]();
  v143.receiver = self;
  v143.super_class = (Class)UAFAssetSet;
  uint64_t v18 = [(UAFAssetSet *)&v143 init];
  os_signpost_id_t v19 = v18;
  if (!v18) {
    goto LABEL_85;
  }
  v140 = v17;
  id v141 = v14;
  objc_storeStrong((id *)&v18->_name, a3);
  uint64_t v20 = [MEMORY[0x263F08C38] UUID];
  uuid = v19->_uuid;
  v19->_uuid = (NSUUID *)v20;

  v22 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v23 = os_signpost_id_generate(v22);

  id v24 = UAFGetLogCategory((void **)&UAFLogContextClient);
  __int16 v25 = v24;
  os_signpost_id_t spid = v23;
  unint64_t v26 = v23 - 1;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    uint64_t v27 = (const char *)v19->_uuid;
    *(_DWORD *)buf = 138543362;
    v145 = v27;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "AssetSet init", "%{public}@", buf, 0xCu);
  }

  *(_WORD *)&v19->_rootsPresent = 0;
  v28 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v29 = v28;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    int v30 = (const char *)v19->_uuid;
    *(_DWORD *)buf = 138543362;
    v145 = v30;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v23, "AssetSet Configuration", "%{public}@", buf, 0xCu);
  }

  id v31 = +[UAFConfigurationManager defaultManager];
  if (v15)
  {
    __int16 v32 = [[UAFConfigurationManager alloc] initWithURLs:v15];

    id v31 = v32;
  }
  uint64_t v33 = [v31 getAssetSet:v13];
  cfg = v19->_cfg;
  v19->_cfg = (UAFAssetSetConfiguration *)v33;

  if (!v19->_cfg)
  {
    id v39 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
      __int16 v146 = 2114;
      uint64_t v147 = (uint64_t)v13;
      _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Could not init asset set %{public}@", buf, 0x16u);
    }

    v40 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v41 = v40;
    if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      __int16 v42 = (const char *)v19->_uuid;
      *(_DWORD *)buf = 138543362;
      v145 = v42;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v41, OS_SIGNPOST_INTERVAL_END, v23, "AssetSet Configuration", "%{public}@", buf, 0xCu);
    }

    v43 = UAFGetLogCategory((void **)&UAFLogContextClient);
    __int16 v44 = v43;
    if (v26 > 0xFFFFFFFFFFFFFFFDLL)
    {
      id v17 = v140;
      id v14 = v141;
    }
    else
    {
      id v17 = v140;
      id v14 = v141;
      if (os_signpost_enabled(v43))
      {
        id v45 = (const char *)v19->_uuid;
        *(_DWORD *)buf = 138543362;
        v145 = v45;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v44, OS_SIGNPOST_INTERVAL_END, v23, "AssetSet init", "%{public}@", buf, 0xCu);
      }
    }
    goto LABEL_41;
  }
  uint64_t v35 = [v31 minVersions:v13];
  minVersions = v19->_minVersions;
  v19->_minVersions = (NSDictionary *)v35;

  uint64_t v37 = [(UAFAssetSetConfiguration *)v19->_cfg getAutoAssets:v141];
  assetNameToAutoAsset = v19->_assetNameToAutoAsset;
  v19->_assetNameToAutoAsset = (NSDictionary *)v37;

  if (v8)
  {
    v19->_BOOL experimentationEnabled = 0;
  }
  else
  {
    __int16 v46 = [(UAFAssetSetConfiguration *)v19->_cfg experimentalAssets];
    v19->_BOOL experimentationEnabled = v46 != 0;
  }
  id v138 = v13;
  id v47 = UAFGetLogCategory((void **)&UAFLogContextClient);
  uint64_t v48 = v47;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    v49 = (const char *)v19->_uuid;
    *(_DWORD *)buf = 138543362;
    v145 = v49;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v48, OS_SIGNPOST_INTERVAL_END, v23, "AssetSet Configuration", "%{public}@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v19->_usages, a4);
  v50 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v51 = os_signpost_id_generate(v50);

  v52 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v53 = v52;
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "Lock AutoAssets", (const char *)&unk_2379F143D, buf, 2u);
  }

  BOOL v54 = v16 != 0;
  if (!v16)
  {
    v60 = [(UAFAssetSetConfiguration *)v19->_cfg experimentalAssets];

    if (v60)
    {
      if (!v8)
      {
        v67 = [UAFAssetSetExperiment alloc];
        v61 = [(UAFAssetSetConfiguration *)v19->_cfg experimentalAssets];
        uint64_t v68 = [(UAFAssetSetExperiment *)v67 initWithConfiguration:v61 uuid:v19->_uuid];
        experiment = v19->_experiment;
        v19->_experiment = (UAFAssetSetExperiment *)v68;

        goto LABEL_46;
      }
      v61 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = v19->_uuid;
        name = v19->_name;
        *(_DWORD *)buf = 136315650;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v62;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)name;
        v64 = "%s %{public}@: Experimentation not enabled for asset set %{public}@";
LABEL_44:
        _os_log_impl(&dword_23797A000, v61, OS_LOG_TYPE_DEFAULT, v64, buf, 0x20u);
      }
    }
    else
    {
      v61 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v65 = v19->_uuid;
        v66 = v19->_name;
        *(_DWORD *)buf = 136315650;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v65;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v66;
        v64 = "%s %{public}@: No experimental assets for asset set %{public}@";
        goto LABEL_44;
      }
    }
LABEL_46:

    uint64_t v58 = 0;
    goto LABEL_47;
  }
  id v13 = v138;
  if (!v8
    || ([v16 experiment], v55 = objc_claimAutoreleasedReturnValue(), v55, !v55))
  {
    uint64_t v56 = [v16 experiment];
    v57 = v19->_experiment;
    v19->_experiment = (UAFAssetSetExperiment *)v56;

    uint64_t v58 = [v16 atomicInstance];
    if (!v58)
    {
      BOOL v54 = 0;
      BOOL v135 = 0;
      v137 = 0;
      v59 = 0;
      goto LABEL_48;
    }
LABEL_47:
    BOOL v135 = v16 == 0;
    v70 = v19->_cfg;
    usages = v19->_usages;
    v72 = v19->_uuid;
    v73 = v19->_assetNameToAutoAsset;
    v74 = v19->_experiment;
    id v142 = 0;
    v137 = (void *)v58;
    uint64_t v75 = +[UAFAssetSet autoAssetSet:v70 usages:usages uuid:v72 autoAssets:v73 experiment:v74 atomicInstance:v58 error:&v142];
    id v76 = v142;
    v59 = v142;
    autoAssetSet = v19->_autoAssetSet;
    v19->_autoAssetSet = (UAFAutoAssetSet *)v75;

    objc_storeStrong((id *)&v19->_autoAssetSetError, v76);
LABEL_48:
    v19->_BOOL experimentationEnabled = v19->_experiment != 0;
    if ([(UAFAutoAssetSet *)v19->_autoAssetSet experimentActivated])
    {
      uint64_t v78 = [(UAFAssetSetExperiment *)v19->_experiment experimentId];
      experimentId = v19->_experimentId;
      v19->_experimentId = (NSString *)v78;
    }
    else
    {
      experimentId = v19->_experimentId;
      v19->_experimentId = (NSString *)&stru_26EA999B8;
    }
    id v13 = v138;

    v80 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v81 = v80;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v81, OS_SIGNPOST_INTERVAL_END, v51, "Lock AutoAssets", (const char *)&unk_2379F143D, buf, 2u);
    }
    v136 = v59;

    char v82 = !v54;
    v83 = v19->_autoAssetSet;
    if (!v16) {
      char v82 = 1;
    }
    if ((v82 & 1) == 0)
    {
      if (!v83)
      {
        v84 = UAFGetLogCategory((void **)&UAFLogContextClient);
        id v17 = v140;
        if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
LABEL_59:
          int v85 = 1;
          id v14 = v141;
LABEL_82:
          v59 = v136;
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136315906;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v138;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v16;
        __int16 v150 = 2114;
        p_super = v59;
        _os_log_error_impl(&dword_23797A000, v84, OS_LOG_TYPE_ERROR, "%s Could not init asset set %{public}@ with consistency token %{public}@: %{public}@", buf, 0x2Au);
        int v85 = 1;
        id v14 = v141;
LABEL_83:

        if (v85) {
          goto LABEL_84;
        }
LABEL_85:
        v106 = v19;
        goto LABEL_86;
      }
      goto LABEL_61;
    }
    if (v83)
    {
LABEL_61:
      v86 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        v87 = v19->_uuid;
        *(_DWORD *)buf = 136315650;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v87;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v138;
        _os_log_impl(&dword_23797A000, v86, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Using AutoAsset configuration instead of Trial for asset set %{public}@", buf, 0x20u);
      }

      goto LABEL_64;
    }
    if (![(UAFAssetSetConfiguration *)v19->_cfg isTrialAvailable])
    {
LABEL_64:
      v84 = +[UAFPreinstalledAssetsCache summary:v19->_cfg];
      if (v16
        && ([v16 preinstalledAssetsSummary],
            v88 = objc_claimAutoreleasedReturnValue(),
            v88,
            v88)
        && (!v84
         || ([v16 preinstalledAssetsSummary],
             v89 = objc_claimAutoreleasedReturnValue(),
             char v90 = [v89 isEqualToSet:v84],
             v89,
             (v90 & 1) == 0)))
      {
        v104 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          v130 = v19->_uuid;
          *(_DWORD *)buf = 136315906;
          v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
          __int16 v146 = 2114;
          uint64_t v147 = (uint64_t)v130;
          __int16 v148 = 2112;
          uint64_t v149 = (uint64_t)v16;
          __int16 v150 = 2112;
          p_super = v84;
          _os_log_error_impl(&dword_23797A000, v104, OS_LOG_TYPE_ERROR, "%s %{public}@: Consistency Token %@ does not match installed roots %@", buf, 0x2Au);
        }
        int v85 = 1;
        id v13 = v138;
        id v17 = v140;
        id v14 = v141;
      }
      else
      {
        if (v135)
        {
          v91 = [UAFAssetSetConsistencyToken alloc];
          v92 = v19->_name;
          v93 = [(UAFAutoAssetSet *)v19->_autoAssetSet atomicInstance];
          uint64_t v94 = [(UAFAssetSetConsistencyToken *)v91 initWithUUID:0 assetSetName:v92 atomicInstance:v93 experiment:v19->_experiment preinstalledAssetsSummary:v84];
          consistencyToken = v19->_consistencyToken;
          v19->_consistencyToken = (UAFAssetSetConsistencyToken *)v94;
        }
        else
        {
          v96 = (UAFAssetSetConsistencyToken *)v16;
          v93 = v19->_consistencyToken;
          v19->_consistencyToken = v96;
        }

        uint64_t v97 = [(UAFAssetSet *)v19 createAssets];
        assets = v19->_assets;
        v19->_assets = (NSDictionary *)v97;

        v99 = UAFGetLogCategory((void **)&UAFLogContextClient);
        id v13 = v138;
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v100 = v19->_uuid;
          v102 = v19->_usages;
          v101 = v19->_name;
          *(_DWORD *)buf = 136315906;
          v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
          __int16 v146 = 2114;
          uint64_t v147 = (uint64_t)v100;
          __int16 v148 = 2114;
          uint64_t v149 = (uint64_t)v101;
          __int16 v150 = 2114;
          p_super = &v102->super;
          _os_log_impl(&dword_23797A000, v99, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set initialized for %{public}@ with usages: %{public}@", buf, 0x2Au);
        }

        v103 = UAFGetLogCategory((void **)&UAFLogContextClient);
        v104 = v103;
        id v17 = v140;
        if (v26 > 0xFFFFFFFFFFFFFFFDLL)
        {
          int v85 = 0;
          id v14 = v141;
        }
        else
        {
          id v14 = v141;
          if (os_signpost_enabled(v103))
          {
            v105 = (const char *)v19->_uuid;
            *(_DWORD *)buf = 138543362;
            v145 = v105;
            _os_signpost_emit_with_name_impl(&dword_23797A000, v104, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet init", "%{public}@", buf, 0xCu);
          }
          int v85 = 0;
        }
      }

      goto LABEL_82;
    }
    uint64_t v108 = +[UAFAssetSet getEntitledTrialAssets:v19->_cfg usages:v141];
    assetNameToTrial = v19->_assetNameToTrial;
    v19->_assetNameToTrial = (NSDictionary *)v108;

    v110 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v111 = v110;
    if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
    {
      v112 = (const char *)v19->_uuid;
      *(_DWORD *)buf = 138543362;
      v145 = v112;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v111, OS_SIGNPOST_INTERVAL_BEGIN, spid, "TRIClient init", "%{public}@", buf, 0xCu);
    }

    v113 = (void *)MEMORY[0x263F80EB8];
    v114 = [(UAFAssetSetConfiguration *)v19->_cfg trialProject];
    uint64_t v115 = [v113 projectIdFromName:v114];

    if v115 && (TRIProject_ProjectId_IsValidValue())
    {
      uint64_t v116 = [MEMORY[0x263F80E18] clientWithIdentifier:v115];
      client = v19->_client;
      v19->_client = (TRIClient *)v116;

      v118 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v119 = v118;
      id v13 = v138;
      if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
      {
        v120 = (const char *)v19->_uuid;
        *(_DWORD *)buf = 138543362;
        v145 = v120;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v119, OS_SIGNPOST_INTERVAL_END, spid, "TRIClient init", "%{public}@", buf, 0xCu);
      }

      if (v19->_client) {
        goto LABEL_64;
      }
      v121 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        uint64_t v134 = [v138 UTF8String];
        *(_DWORD *)buf = 136315394;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2082;
        uint64_t v147 = v134;
        _os_log_error_impl(&dword_23797A000, v121, OS_LOG_TYPE_ERROR, "%s Could not create trial client for asset set %{public}s", buf, 0x16u);
      }

      v122 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v84 = v122;
      id v17 = v140;
      if (v26 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_59;
      }
      id v14 = v141;
      v59 = v136;
      if (os_signpost_enabled(v122)) {
        goto LABEL_109;
      }
    }
    else
    {
      v123 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        id v131 = [(UAFAssetSetConfiguration *)v19->_cfg trialProject];
        uint64_t v132 = [v131 UTF8String];
        uint64_t v133 = [v138 UTF8String];
        *(_DWORD *)buf = 136315650;
        v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
        __int16 v146 = 2082;
        uint64_t v147 = v132;
        __int16 v148 = 2082;
        uint64_t v149 = v133;
        _os_log_error_impl(&dword_23797A000, v123, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}s for asset set %{public}s", buf, 0x20u);
      }
      v124 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v125 = v124;
      if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
      {
        v126 = (const char *)v19->_uuid;
        *(_DWORD *)buf = 138543362;
        v145 = v126;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v125, OS_SIGNPOST_INTERVAL_END, spid, "TRIClient init", "%{public}@", buf, 0xCu);
      }

      v127 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v84 = v127;
      id v13 = v138;
      v59 = v136;
      if (v26 > 0xFFFFFFFFFFFFFFFDLL)
      {
        int v85 = 1;
        id v17 = v140;
        id v14 = v141;
        goto LABEL_83;
      }
      id v17 = v140;
      id v14 = v141;
      if (os_signpost_enabled(v127))
      {
LABEL_109:
        v128 = (const char *)v19->_uuid;
        *(_DWORD *)buf = 138543362;
        v145 = v128;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v84, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet init", "%{public}@", buf, 0xCu);
      }
    }
    int v85 = 1;
    goto LABEL_83;
  }
  __int16 v44 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    v129 = v19->_uuid;
    *(_DWORD *)buf = 136315650;
    v145 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:consistencyToken:]";
    __int16 v146 = 2114;
    uint64_t v147 = (uint64_t)v129;
    __int16 v148 = 2112;
    uint64_t v149 = (uint64_t)v16;
    _os_log_error_impl(&dword_23797A000, v44, OS_LOG_TYPE_ERROR, "%s %{public}@: Consistency Token %@ has an experiment in it but disableExperimentation is YES", buf, 0x20u);
  }
  id v17 = v140;
  id v14 = v141;
LABEL_41:

LABEL_84:
  v106 = 0;
LABEL_86:

  return v106;
}

- (id)createAssets
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  BOOL v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
  id v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uuid = self->_uuid;
    int v32 = 138543362;
    uint64_t v33 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
  }

  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    id v10 = [(UAFAutoAssetSet *)autoAssetSet assets];
  }
  else
  {
    id v10 = 0;
  }
  if (![v10 count])
  {
    if ([(UAFAssetSetConfiguration *)self->_cfg isTrialAvailable])
    {
      id v16 = [(UAFAssetSet *)self getTrialAssets];
      id v11 = [(UAFAssetSet *)self applyAssetTransformations:v16];
      id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
      uint64_t v18 = v17;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        os_signpost_id_t v19 = self->_uuid;
        int v32 = 138543362;
        uint64_t v33 = (const char *)v19;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v18, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
      }

      if ([v11 count])
      {
        uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = self->_uuid;
          name = self->_name;
          int v32 = 136315650;
          uint64_t v33 = "-[UAFAssetSet createAssets]";
          __int16 v34 = 2114;
          uint64_t v35 = v21;
          __int16 v36 = 2114;
          uint64_t v37 = name;
          os_signpost_id_t v23 = "%s %{public}@: Preferring trial assets over preinstalled assets for assetset %{public}@";
          id v24 = v20;
          uint32_t v25 = 32;
LABEL_27:
          _os_log_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v32, v25);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    else
    {
      id v16 = objc_opt_new();
      id v11 = [(UAFAssetSet *)self applyAssetTransformations:v16];
      unint64_t v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
      uint64_t v27 = v26;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        v28 = self->_uuid;
        int v32 = 138543362;
        uint64_t v33 = (const char *)v28;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v27, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
      }

      if ([v11 count])
      {
        uint64_t v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v29 = self->_uuid;
          int v30 = [v11 count];
          int v32 = 136315650;
          uint64_t v33 = "-[UAFAssetSet createAssets]";
          __int16 v34 = 2114;
          uint64_t v35 = v29;
          __int16 v36 = 1024;
          LODWORD(v37) = v30;
          os_signpost_id_t v23 = "%s %{public}@: Returning %d transformed asset(s)";
          id v24 = v20;
          uint32_t v25 = 28;
          goto LABEL_27;
        }
LABEL_28:

        id v15 = v11;
LABEL_30:

        goto LABEL_31;
      }
    }
    id v15 = 0;
    goto LABEL_30;
  }
  id v11 = [(UAFAssetSet *)self applyAssetTransformations:v10];
  id v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
  id v13 = v12;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = self->_uuid;
    int v32 = 138543362;
    uint64_t v33 = (const char *)v14;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v13, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
  }

  if ([v11 count])
  {
    id v11 = v11;
    id v15 = v11;
  }
  else
  {
    id v15 = 0;
  }
LABEL_31:

  return v15;
}

- (id)applyAssetTransformations:(id)a3
{
  os_signpost_id_t v4 = [(UAFAssetSet *)self overlayRoots:a3];
  BOOL v5 = [(UAFAssetSet *)self applyOSCompatibility:v4];

  id v6 = [(UAFAssetSet *)self applyMinVersions:v5];

  return v6;
}

- (id)overlayRoots:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(UAFAssetSetConsistencyToken *)self->_consistencyToken preinstalledAssetsSummary];

  if (v5 && +[UAFPreinstalledAssetsCache isEnabled])
  {
    id v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    BOOL v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    id v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v22 = uuid;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Overlay Roots", "%{public}@", buf, 0xCu);
    }

    id v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    id v12 = [(UAFAssetSet *)self getAutoAssetPreinstalled];
    id v13 = v12;
    if (v12)
    {
      if ([v12 count]) {
        self->_rootsPresent = 1;
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __28__UAFAssetSet_overlayRoots___block_invoke;
      v18[3] = &unk_264CEC228;
      id v19 = v11;
      uint64_t v20 = self;
      [v13 enumerateKeysAndObjectsUsingBlock:v18];
    }
    id v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
    id v15 = v14;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v15, OS_SIGNPOST_INTERVAL_END, v7, "Overlay Roots", "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (id)applyOSCompatibility:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
  if (!v5) {
    goto LABEL_24;
  }
  id v6 = (void *)v5;
  os_signpost_id_t v7 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
  uint64_t v8 = [v4 objectForKeyedSubscript:v7];
  if (!v8)
  {

    goto LABEL_24;
  }
  id v9 = (void *)v8;
  id v10 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
  [v4 objectForKeyedSubscript:v10];
  id v11 = v50 = self;
  id v12 = [v11 location];

  id v13 = self;
  if (!v12)
  {
LABEL_24:
    id v27 = v4;
    goto LABEL_32;
  }
  id v14 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
  id v15 = [v4 objectForKeyedSubscript:v14];
  id v16 = [v15 location];
  id v55 = 0;
  id v17 = +[UAFAssetSetMetadata fromAssetDir:v16 error:&v55];
  id v49 = v55;

  if (v17)
  {
    if (![v17 OSSupported])
    {
      uint64_t v48 = v17;
      uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        uint64_t v20 = [(UAFAssetSetConfiguration *)self->_cfg name];
        int v21 = [v48 minOSVersion];
        v22 = [v48 maxOSVersion];
        uint64_t v23 = +[UAFAssetSetMetadata OSVersion];
        *(_DWORD *)buf = 136316418;
        uint64_t v58 = "-[UAFAssetSet applyOSCompatibility:]";
        __int16 v59 = 2114;
        v60 = uuid;
        __int16 v61 = 2114;
        v62 = v20;
        __int16 v63 = 2114;
        v64 = v21;
        __int16 v65 = 2114;
        v66 = v22;
        __int16 v67 = 2114;
        id v68 = v23;
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set %{public}@ with minOSVersion %{public}@ and maxOSVersion %{public}@ incompatible with current OS Version %{public}@", buf, 0x3Eu);

        id v13 = self;
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v24 = [(UAFAssetSetConfiguration *)v13->_cfg assets];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        id v27 = 0;
        uint64_t v28 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v52 != v28) {
              objc_enumerationMutation(v24);
            }
            int v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if (objc_msgSend(v30, "ignoreOSCompatibility", v48))
            {
              id v31 = [v30 name];
              int v32 = [v4 objectForKeyedSubscript:v31];

              if (v32)
              {
                if (!v27) {
                  id v27 = (id)objc_opt_new();
                }
                uint64_t v33 = [v30 name];
                __int16 v34 = [v4 objectForKeyedSubscript:v33];
                uint64_t v35 = [v30 name];
                [v27 setObject:v34 forKeyedSubscript:v35];

                __int16 v36 = UAFGetLogCategory((void **)&UAFLogContextClient);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v37 = v50->_uuid;
                  uint64_t v38 = [v30 name];
                  id v39 = [(UAFAssetSetConfiguration *)v50->_cfg name];
                  *(_DWORD *)buf = 136315906;
                  uint64_t v58 = "-[UAFAssetSet applyOSCompatibility:]";
                  __int16 v59 = 2114;
                  v60 = v37;
                  __int16 v61 = 2114;
                  v62 = v38;
                  __int16 v63 = 2114;
                  v64 = v39;
                  _os_log_impl(&dword_23797A000, v36, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset %{public}@ in asset set %{public}@ included as it ignores OS compatibility", buf, 0x2Au);
                }
              }
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v26);
      }
      else
      {
        id v27 = 0;
      }

      id v17 = v48;
      goto LABEL_31;
    }
  }
  else
  {
    v40 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = self->_uuid;
      v43 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
      __int16 v44 = [(UAFAssetSetConfiguration *)self->_cfg name];
      id v45 = [(UAFAssetSetConfiguration *)self->_cfg metadataAsset];
      __int16 v46 = [v4 objectForKeyedSubscript:v45];
      id v47 = [v46 location];
      *(_DWORD *)buf = 136316418;
      uint64_t v58 = "-[UAFAssetSet applyOSCompatibility:]";
      __int16 v59 = 2114;
      v60 = v42;
      id v17 = 0;
      __int16 v61 = 2114;
      v62 = v43;
      __int16 v63 = 2114;
      v64 = v44;
      __int16 v65 = 2112;
      v66 = v47;
      __int16 v67 = 2114;
      id v68 = v49;
      _os_log_error_impl(&dword_23797A000, v40, OS_LOG_TYPE_ERROR, "%s %{public}@: Failed to load asset set metadata from asset %{public}@ in asset set %{public}@ at location %@: %{public}@", buf, 0x3Eu);
    }
  }
  id v27 = v4;
LABEL_31:

LABEL_32:

  return v27;
}

- (id)applyMinVersions:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138543362;
    __int16 v44 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Min Versions", "%{public}@", buf, 0xCu);
  }

  if (self->_minVersions)
  {
    os_signpost_id_t spid = v6;
    unint64_t v34 = v6 - 1;
    id v36 = (id)objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v35 = v4;
    id v10 = v4;
    uint64_t v38 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v40 != v37) {
            objc_enumerationMutation(v10);
          }
          uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v13 = [v10 objectForKeyedSubscript:v12];
          uint64_t v14 = [(NSDictionary *)self->_minVersions objectForKeyedSubscript:v12];
          if (!v14) {
            goto LABEL_12;
          }
          id v15 = (void *)v14;
          id v16 = [v13 metadata];
          id v17 = [v16 objectForKeyedSubscript:@"version"];
          [(NSDictionary *)self->_minVersions objectForKeyedSubscript:v12];
          id v19 = v18 = self;
          int64_t v20 = +[UAFPlatform compareVersion:v17 with:v19];

          self = v18;
          if (v20 == -1)
          {
            int v21 = UAFGetLogCategory((void **)&UAFLogContextClient);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v18->_uuid;
              uint64_t v23 = [v13 metadata];
              id v24 = [v23 objectForKeyedSubscript:@"version"];
              uint64_t v25 = [(NSDictionary *)v18->_minVersions objectForKeyedSubscript:v12];
              *(_DWORD *)buf = 136316162;
              __int16 v44 = "-[UAFAssetSet applyMinVersions:]";
              __int16 v45 = 2114;
              __int16 v46 = v22;
              __int16 v47 = 2112;
              uint64_t v48 = v12;
              __int16 v49 = 2112;
              v50 = v24;
              __int16 v51 = 2112;
              long long v52 = v25;
              _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Not included %@ as it's version %@ is less than the required minimum %@", buf, 0x34u);

              self = v18;
            }
          }
          else
          {
LABEL_12:
            [v36 setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v38 = [v10 countByEnumeratingWithState:&v39 objects:v53 count:16];
      }
      while (v38);
    }

    uint64_t v26 = UAFGetLogCategory((void **)&UAFLogContextClient);
    id v27 = v26;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      uint64_t v28 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      __int16 v44 = (const char *)v28;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v27, OS_SIGNPOST_INTERVAL_END, spid, "Min Versions", "%{public}@", buf, 0xCu);
    }

    id v4 = v35;
  }
  else
  {
    v29 = UAFGetLogCategory((void **)&UAFLogContextClient);
    int v30 = v29;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      id v31 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      __int16 v44 = (const char *)v31;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v30, OS_SIGNPOST_INTERVAL_END, v6, "Min Versions", "%{public}@", buf, 0xCu);
    }

    id v36 = v4;
  }

  return v36;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    os_signpost_id_t v7 = "-[UAFAssetSet dealloc]";
    __int16 v8 = 2114;
    id v9 = uuid;
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set dealloc'd", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)UAFAssetSet;
  [(UAFAssetSet *)&v5 dealloc];
}

- (id)assetNamed:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  assets = self->_assets;
  if (assets)
  {
    os_signpost_id_t v6 = [(NSDictionary *)assets objectForKeyedSubscript:v4];
    os_signpost_id_t v7 = v6;
    if (!v6)
    {
      id v11 = @"none";
      goto LABEL_12;
    }
    __int16 v8 = [v6 metadata];
    id v9 = [v8 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];

    if (v9)
    {
      uint64_t v10 = [v7 metadata];
      id v11 = [v10 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];
    }
    else
    {
      id v11 = @"none";
    }
    uint64_t v15 = [v7 location];
    if (!v15
      || (id v16 = (void *)v15,
          char v17 = [v7 isPresentOnDevice],
          v16,
          (v17 & 1) != 0))
    {
LABEL_12:
      uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        int v22 = 136315906;
        uint64_t v23 = "-[UAFAssetSet assetNamed:]";
        __int16 v24 = 2114;
        uint64_t v25 = uuid;
        __int16 v26 = 2114;
        p_isa = &v4->isa;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Returning %{public}@ from source %{public}@", (uint8_t *)&v22, 0x2Au);
      }
      goto LABEL_17;
    }
    id v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = self->_uuid;
      int v22 = 136315906;
      uint64_t v23 = "-[UAFAssetSet assetNamed:]";
      __int16 v24 = 2114;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      p_isa = &v4->isa;
      __int16 v28 = 2114;
      v29 = (__CFString *)v7;
      _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ is not valid, returning nil instead of: %{public}@", (uint8_t *)&v22, 0x2Au);
    }

    uint64_t v12 = v7;
    os_signpost_id_t v7 = 0;
  }
  else
  {
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = self->_uuid;
      name = self->_name;
      int v22 = 136315906;
      uint64_t v23 = "-[UAFAssetSet assetNamed:]";
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      p_isa = name;
      __int16 v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No assets in asset set %{public}@ while querying %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    os_signpost_id_t v7 = 0;
    id v11 = @"none";
  }
LABEL_17:

  return v7;
}

+ (id)getEntitledTrialAssets:(id)a3 usages:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v5 = a4;
  os_signpost_id_t v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  __int16 v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
  id v9 = v8;
  unint64_t v33 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TrialEntitlements", (const char *)&unk_2379F143D, buf, 2u);
  }
  os_signpost_id_t spid = v7;

  unint64_t v34 = v5;
  uint64_t v10 = [v36 getTrialAssets:v5];
  id v11 = +[UAFTrialConversions entitledTrialNamespaceNames];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v38;
    char v17 = @"TrialNamespace";
    id v35 = v12;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        int64_t v20 = [v12 objectForKeyedSubscript:v19];
        int v21 = [v20 objectForKeyedSubscript:v17];

        if ([v11 containsObject:v21])
        {
          if (!v15) {
            uint64_t v15 = objc_opt_new();
          }
          int v22 = [v12 objectForKeyedSubscript:v19];
          [v15 setObject:v22 forKeyedSubscript:v19];
        }
        else
        {
          int v22 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            [v36 name];
            uint64_t v23 = v14;
            __int16 v24 = v17;
            uint64_t v25 = v16;
            __int16 v26 = v15;
            v28 = id v27 = v11;
            *(_DWORD *)buf = 136315906;
            long long v42 = "+[UAFAssetSet getEntitledTrialAssets:usages:]";
            __int16 v43 = 2114;
            uint64_t v44 = v19;
            __int16 v45 = 2114;
            __int16 v46 = v28;
            __int16 v47 = 2114;
            uint64_t v48 = v21;
            _os_log_impl(&dword_23797A000, v22, OS_LOG_TYPE_DEFAULT, "%s Not including asset %{public}@ in asset set %{public}@ due to lack of entitlement for Namespace %{public}@", buf, 0x2Au);

            id v11 = v27;
            uint64_t v15 = v26;
            uint64_t v16 = v25;
            char v17 = v24;
            uint64_t v14 = v23;
            id v12 = v35;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  v29 = UAFGetLogCategory((void **)&UAFLogContextClient);
  uint64_t v30 = v29;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v30, OS_SIGNPOST_INTERVAL_END, spid, "TrialEntitlements", (const char *)&unk_2379F143D, buf, 2u);
  }

  return v15;
}

+ (id)getTrialPurgeabilityLevel:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return (id)qword_264CEC298[a3 - 1];
  }
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4
{
  return [(UAFAssetSet *)self initWithAssetSet:a3 usages:a4 configurationDirURLs:0];
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5
{
  return [(UAFAssetSet *)self initWithAssetSet:a3 usages:a4 configurationDirURLs:0 disableExperimentation:a5 consistencyToken:0];
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5
{
  return [(UAFAssetSet *)self initWithAssetSet:a3 usages:a4 configurationDirURLs:a5 disableExperimentation:0 consistencyToken:0];
}

- (id)createAssetFromTrialInfo:(id)a3 assetName:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UAFAssetSet *)self _createAssetFromTrialInfo:v6 assetName:v7 fallback:0 validPathOnly:1];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      int v19 = 136315650;
      int64_t v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
      __int16 v21 = 2114;
      int v22 = uuid;
      __int16 v23 = 2112;
      id v24 = v7;
      id v12 = "%s %{public}@: _createAssetFromTrialInfo using primary for assetName %@ with valid path";
LABEL_13:
      _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    uint64_t v13 = [(UAFAssetSet *)self _createAssetFromTrialInfo:v6 assetName:v7 fallback:1 validPathOnly:1];
    if (v13)
    {
      id v9 = (void *)v13;
      uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_uuid;
        int v19 = 136315650;
        int64_t v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
        __int16 v21 = 2114;
        int v22 = v14;
        __int16 v23 = 2112;
        id v24 = v7;
        id v12 = "%s %{public}@: _createAssetFromTrialInfo using fallback for assetName %@ with valid path";
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v15 = [(UAFAssetSet *)self _createAssetFromTrialInfo:v6 assetName:v7 fallback:0 validPathOnly:0];
      if (v15)
      {
        id v9 = (void *)v15;
        uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = self->_uuid;
          int v19 = 136315650;
          int64_t v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
          __int16 v21 = 2114;
          int v22 = v16;
          __int16 v23 = 2112;
          id v24 = v7;
          id v12 = "%s %{public}@: _createAssetFromTrialInfo using primary for assetName %@ without valid path";
          goto LABEL_13;
        }
      }
      else
      {
        id v9 = [(UAFAssetSet *)self _createAssetFromTrialInfo:v6 assetName:v7 fallback:1 validPathOnly:0];
        if (!v9) {
          goto LABEL_15;
        }
        uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          char v17 = self->_uuid;
          int v19 = 136315650;
          int64_t v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
          __int16 v21 = 2114;
          int v22 = v17;
          __int16 v23 = 2112;
          id v24 = v7;
          id v12 = "%s %{public}@: _createAssetFromTrialInfo using fallback for assetName %@ without valid path";
          goto LABEL_13;
        }
      }
    }
  }

LABEL_15:

  return v9;
}

- (id)_createAssetFromTrialInfo:(id)a3 assetName:(id)a4 fallback:(BOOL)a5 validPathOnly:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = kUAFTrialFactorFallback;
  if (!v7) {
    id v12 = kUAFTrialFactor;
  }
  uint64_t v13 = [v10 objectForKeyedSubscript:*v12];
  uint64_t v14 = [v10 objectForKeyedSubscript:@"TrialNamespace"];
  uint64_t v15 = (void *)v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    char v17 = 0;
    goto LABEL_46;
  }
  uint64_t v18 = [(TRIClient *)self->_client levelForFactor:v13 withNamespaceName:v14];
  int v19 = v18;
  if (!v18)
  {
    int v22 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 136315650;
      v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
      __int16 v67 = 2114;
      id v68 = uuid;
      __int16 v69 = 2112;
      v70 = v13;
      _os_log_impl(&dword_23797A000, v22, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No level for factor %@", buf, 0x20u);
    }
    goto LABEL_44;
  }
  if ([v18 levelOneOfCase] != 101
    && [v19 levelOneOfCase] != 100)
  {
    int v22 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v62 = self->_uuid;
      *(_DWORD *)buf = 136315906;
      v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
      __int16 v67 = 2114;
      id v68 = v62;
      __int16 v69 = 2112;
      v70 = v13;
      __int16 v71 = 1024;
      int v72 = [v19 levelOneOfCase];
      _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@: TRILevel is not a directory or file type: %@ %d", buf, 0x26u);
    }
LABEL_44:
    char v17 = 0;
    goto LABEL_45;
  }
  BOOL v63 = v6;
  int64_t v20 = (void *)MEMORY[0x263EFF9A0];
  __int16 v21 = [v19 metadata];
  int v22 = [v20 dictionaryWithDictionary:v21];

  __int16 v23 = [v10 objectForKeyedSubscript:@"TrialMAAssetType"];
  [v22 setObject:v23 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetType"];

  [v22 setObject:@"Trial" forKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];
  id v64 = v11;
  if ([v19 levelOneOfCase] != 101)
  {
    long long v40 = [v19 fileValue];
    if ([v40 hasAsset])
    {
      long long v42 = [v19 fileValue];
      __int16 v43 = [v42 asset];
      int v44 = [v43 hasAssetId];

      if (!v44) {
        goto LABEL_27;
      }
      __int16 v45 = [v19 fileValue];
      __int16 v46 = [v45 asset];
      __int16 v47 = [v46 assetId];
      [v22 setObject:v47 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetId"];

      uint64_t v48 = NSString;
      long long v40 = [v19 fileValue];
      __int16 v49 = [v40 asset];
      uint64_t v50 = objc_msgSend(v48, "stringWithFormat:", @"%llu", objc_msgSend(v49, "size"));
      [v22 setObject:v50 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.ReportedDownloadSize"];
    }
LABEL_27:
    unint64_t v34 = [v19 fileValue];
    if ([v34 hasPath])
    {
      __int16 v51 = [v19 fileValue];
      long long v52 = [v51 path];
      uint64_t v53 = [v52 length];

      if (v53)
      {
        long long v38 = [v19 fileValue];
LABEL_30:
        uint64_t v54 = v38;
        id v55 = [v38 path];

        if (v55) {
          goto LABEL_40;
        }
        goto LABEL_33;
      }
      goto LABEL_33;
    }
LABEL_32:

    goto LABEL_33;
  }
  id v24 = [v19 directoryValue];
  if ([v24 hasAsset])
  {
    uint64_t v25 = [v19 directoryValue];
    __int16 v26 = [v25 asset];
    int v27 = [v26 hasAssetId];

    if (!v27) {
      goto LABEL_18;
    }
    __int16 v28 = [v19 directoryValue];
    v29 = [v28 asset];
    uint64_t v30 = [v29 assetId];
    [v22 setObject:v30 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetId"];

    id v31 = NSString;
    id v24 = [v19 directoryValue];
    int v32 = [v24 asset];
    unint64_t v33 = objc_msgSend(v31, "stringWithFormat:", @"%llu", objc_msgSend(v32, "size"));
    [v22 setObject:v33 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.ReportedDownloadSize"];
  }
LABEL_18:
  unint64_t v34 = [v19 directoryValue];
  if (![v34 hasPath]) {
    goto LABEL_32;
  }
  id v35 = [v19 directoryValue];
  id v36 = [v35 path];
  uint64_t v37 = [v36 length];

  if (v37)
  {
    long long v38 = [v19 directoryValue];
    goto LABEL_30;
  }
LABEL_33:
  uint64_t v56 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = self->_uuid;
    *(_DWORD *)buf = 136315650;
    v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
    __int16 v67 = 2114;
    id v68 = v57;
    __int16 v69 = 2112;
    v70 = v13;
    _os_log_impl(&dword_23797A000, v56, OS_LOG_TYPE_DEFAULT, "%s %{public}@: nil path for factor %@", buf, 0x20u);
  }

  if (v63)
  {
    id v55 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = self->_uuid;
      *(_DWORD *)buf = 136315650;
      v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
      __int16 v67 = 2114;
      id v68 = v58;
      __int16 v69 = 2112;
      v70 = v13;
      _os_log_impl(&dword_23797A000, v55, OS_LOG_TYPE_DEFAULT, "%s %{public}@: validPathOnly nil path for factor %@", buf, 0x20u);
    }
    char v17 = 0;
    id v11 = v64;
    goto LABEL_41;
  }
  id v55 = &stru_26EA999B8;
LABEL_40:
  __int16 v59 = [UAFAsset alloc];
  v60 = [NSURL fileURLWithPath:v55];
  id v11 = v64;
  char v17 = [(UAFAsset *)v59 initWithName:v64 location:v60 metadata:v22];

LABEL_41:
LABEL_45:

LABEL_46:

  return v17;
}

- (id)createAssetFromMAAsset:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = (void *)MEMORY[0x263EFF9A0];
  id v11 = (__CFString *)a6;
  id v12 = a4;
  uint64_t v13 = [v10 dictionary];
  uint64_t v14 = [v9 assetId];
  [v13 setObject:v14 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetId"];

  uint64_t v15 = [v9 assetType];
  [v13 setObject:v15 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetType"];

  [v13 setObject:@"0" forKeyedSubscript:@"com.apple.UnifiedAssetFramework.ReportedDownloadSize"];
  BOOL v16 = [v9 attributes];
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  unint64_t v34 = __84__UAFAssetSet_createAssetFromMAAsset_assetName_experimentationEnabled_experimentId___block_invoke;
  id v35 = &unk_264CEC200;
  id v17 = v13;
  id v36 = v17;
  id v18 = v9;
  id v37 = v18;
  [v16 enumerateKeysAndObjectsUsingBlock:&v32];

  int v19 = objc_msgSend(v18, "attributes", v32, v33, v34, v35);
  uint64_t v20 = [v19 objectForKeyedSubscript:@"isRoot"];
  if (!v20)
  {

LABEL_5:
    if ([v18 wasPreinstalled])
    {
      [v17 setObject:@"YES" forKeyedSubscript:@"preinstalled"];
      uint64_t v25 = kUAFAssetMetadataSourceFactoryValue;
    }
    else
    {
      uint64_t v25 = kUAFAssetMetadataSourceUnknownValue;
    }
    goto LABEL_8;
  }
  __int16 v21 = (void *)v20;
  int v22 = [v18 attributes];
  __int16 v23 = [v22 objectForKeyedSubscript:@"isRoot"];
  char v24 = [v23 isEqualToString:@"1"];

  if ((v24 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v25 = kUAFAssetMetadataSourceRootValue;
LABEL_8:
  [v17 setObject:*v25 forKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];
  if (v7) {
    __int16 v26 = @"YES";
  }
  else {
    __int16 v26 = @"NO";
  }
  [v17 setObject:v26 forKeyedSubscript:@"ExperimentationEnabled"];
  if (v11) {
    int v27 = v11;
  }
  else {
    int v27 = &stru_26EA999B8;
  }
  [v17 setObject:v27 forKeyedSubscript:@"ExperimentId"];

  __int16 v28 = [UAFAsset alloc];
  v29 = [v18 getLocalFileUrl];
  uint64_t v30 = [(UAFAsset *)v28 initWithName:v12 location:v29 metadata:v17];

  return v30;
}

void __84__UAFAssetSet_createAssetFromMAAsset_assetName_experimentationEnabled_experimentId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v7 = [*(id *)(a1 + 40) attributes];
    uint64_t v8 = [v7 objectForKeyedSubscript:v9];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)assets
{
  return self->_assets;
}

- (id)assetSetIdForSELF:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_factoryAssetsPresent)
  {
    id v4 = @"Factory";
    goto LABEL_3;
  }
  BOOL v7 = a3;
  uint64_t v8 = [(UAFAssetSetConfiguration *)self->_cfg autoAssetType];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = +[UAFAutoAssetSet catalogAssetSetID:self->_name];
      goto LABEL_13;
    }
    autoAssetSet = self->_autoAssetSet;
    if (autoAssetSet)
    {
      uint64_t v9 = [(UAFAutoAssetSet *)autoAssetSet catalogAssetSetID];
LABEL_13:
      id v4 = (__CFString *)v9;
      if (v9) {
        goto LABEL_3;
      }
    }
  }
  if (self->_client)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = [(UAFAssetSetConfiguration *)self->_cfg assets];
    id v4 = (__CFString *)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      uint64_t v12 = *(void *)v19;
LABEL_17:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        uint64_t v15 = [v14 trialNamespace];

        if (v15) {
          break;
        }
        if (v4 == (__CFString *)++v13)
        {
          id v4 = (__CFString *)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v4) {
            goto LABEL_17;
          }
          goto LABEL_26;
        }
      }
      uint64_t v16 = [v14 trialNamespace];

      if (!v16) {
        goto LABEL_27;
      }
      id v17 = [(TRIClient *)self->_client rolloutIdentifiersWithNamespaceName:v16];
      id v4 = [v17 rolloutId];

      id v11 = (void *)v16;
    }
LABEL_26:
  }
  else
  {
LABEL_27:
    id v4 = 0;
  }
LABEL_3:
  if (self->_rootsPresent)
  {
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"+roots"];

    id v4 = (__CFString *)v5;
  }

  return v4;
}

- (NSString)assetSetId
{
  return (NSString *)[(UAFAssetSet *)self assetSetIdForSELF:0];
}

- (id)namespacesOfAssetNames:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [(NSDictionary *)self->_assetNameToTrial objectForKeyedSubscript:v12];
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 objectForKeyedSubscript:@"TrialNamespace"];
          [v6 addObject:v15];
        }
        else
        {
          uint64_t v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uuid = self->_uuid;
            name = self->_name;
            *(_DWORD *)buf = 136315906;
            uint64_t v30 = "-[UAFAssetSet namespacesOfAssetNames:error:]";
            __int16 v31 = 2114;
            uint64_t v32 = uuid;
            __int16 v33 = 2112;
            uint64_t v34 = v12;
            __int16 v35 = 2112;
            id v36 = name;
            _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset name %@ does not exist in asset set %@", buf, 0x2Au);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v18 = v6;
  }
  else
  {
    if (a4)
    {
      long long v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08338];
      __int16 v28 = @"No namespaces for assets";
      long long v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a4 = [v19 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v20];
    }
    id v18 = 0;
  }

  return v18;
}

- (BOOL)markAssetsProvisional:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_autoAssetSet)
  {
    if (self->_client)
    {
      uint64_t v8 = [(UAFAssetSet *)self namespacesOfAssetNames:v6 error:a4];
      if (v8)
      {
        uint64_t v9 = v8;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          id v23 = v6;
          uint64_t v12 = *(void *)v25;
          char v7 = 1;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              if (([(TRIClient *)self->_client setFactorsProvisionalForNamespace:v14 error:a4] & 1) == 0)
              {
                if (a4)
                {
                  uint64_t v15 = [*a4 code];
                  uint64_t v16 = [*a4 localizedFailureReason];
                }
                else
                {
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                }
                id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  uuid = self->_uuid;
                  *(_DWORD *)buf = 136316162;
                  v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
                  __int16 v30 = 2114;
                  __int16 v31 = uuid;
                  __int16 v32 = 2112;
                  uint64_t v33 = v14;
                  __int16 v34 = 2048;
                  uint64_t v35 = v15;
                  __int16 v36 = 2112;
                  id v37 = v16;
                  _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: setFactorsProvisionalForNamespace failed for namespace %@: %ld %@", buf, 0x34u);
                }

                char v7 = 0;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
          }
          while (v11);
          id v6 = v23;
        }
        else
        {
          char v7 = 1;
        }
        goto LABEL_26;
      }
      long long v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
        __int16 v30 = 2114;
        __int16 v31 = v21;
        _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: No namespaces for assets", buf, 0x16u);
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
        __int16 v30 = 2114;
        __int16 v31 = v19;
        _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: Not supported for MAAutoAssetSet assets", buf, 0x16u);
      }
    }
    char v7 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v7 = 1;
LABEL_27:

  return v7 & 1;
}

- (BOOL)markAssetsPromoted:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_autoAssetSet)
  {
    if (self->_client)
    {
      uint64_t v8 = [(UAFAssetSet *)self namespacesOfAssetNames:v6 error:a4];
      if (!v8)
      {
        long long v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uuid = self->_uuid;
          *(_DWORD *)buf = 136315394;
          v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
          __int16 v30 = 2114;
          __int16 v31 = uuid;
          _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: No namespaces for assets", buf, 0x16u);
        }

        uint64_t v9 = 0;
        char v7 = 0;
        goto LABEL_26;
      }
      uint64_t v9 = v8;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v23 = v6;
        uint64_t v12 = *(void *)v25;
        char v7 = 1;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            if (([(TRIClient *)self->_client promoteFactorsForNamespace:v14 error:a4] & 1) == 0)
            {
              if (a4)
              {
                uint64_t v15 = [*a4 code];
                uint64_t v16 = [*a4 localizedFailureReason];
              }
              else
              {
                uint64_t v16 = 0;
                uint64_t v15 = 0;
              }
              id v17 = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                id v18 = self->_uuid;
                *(_DWORD *)buf = 136316162;
                v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
                __int16 v30 = 2114;
                __int16 v31 = v18;
                __int16 v32 = 2112;
                uint64_t v33 = v14;
                __int16 v34 = 2048;
                uint64_t v35 = v15;
                __int16 v36 = 2112;
                id v37 = v16;
                _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: promoteFactorsForNamespace failed for namespace %@: %ld %@", buf, 0x34u);
              }

              char v7 = 0;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v38 count:16];
        }
        while (v11);
        id v6 = v23;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
        __int16 v30 = 2114;
        __int16 v31 = v19;
        _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: Not supported for MAAutoAssetSet assets", buf, 0x16u);
      }
    }
    char v7 = 1;
LABEL_26:

    goto LABEL_27;
  }
  char v7 = 1;
LABEL_27:

  return v7 & 1;
}

void __28__UAFAssetSet_overlayRoots___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:v5];
  id v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 72);
    int v8 = 136315650;
    uint64_t v9 = "-[UAFAssetSet overlayRoots:]_block_invoke";
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@: using autoasset root for %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)getTrialAssets
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_client)
  {
    v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    id v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 138543362;
      id v23 = uuid;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Trial Assets", "%{public}@", buf, 0xCu);
    }

    int v8 = objc_opt_new();
    assetNameToTrial = self->_assetNameToTrial;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __29__UAFAssetSet_getTrialAssets__block_invoke;
    long long v19 = &unk_264CEC250;
    id v10 = v8;
    id v20 = v10;
    long long v21 = self;
    [(NSDictionary *)assetNameToTrial enumerateKeysAndObjectsUsingBlock:&v16];
    uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
    __int16 v12 = v11;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      id v13 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      id v23 = v13;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v12, OS_SIGNPOST_INTERVAL_END, v4, "Trial Assets", "%{public}@", buf, 0xCu);
    }

    if (objc_msgSend(v10, "count", v16, v17, v18, v19)) {
      id v14 = v10;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __29__UAFAssetSet_getTrialAssets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 createAssetFromTrialInfo:a3 assetName:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)getAutoAssetPreinstalled
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  os_signpost_id_t v4 = [(UAFAssetSetConfiguration *)self->_cfg autoAssetType];

  if (!v4)
  {
    id v31 = v3;
    goto LABEL_21;
  }
  assetNameToAutoAsset = self->_assetNameToAutoAsset;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke;
  v48[3] = &unk_264CEC250;
  id v6 = v3;
  id v49 = v6;
  uint64_t v50 = self;
  [(NSDictionary *)assetNameToAutoAsset enumerateKeysAndObjectsUsingBlock:v48];
  if (!self->_experiment)
  {
    id v32 = v6;
    goto LABEL_20;
  }
  +[UAFPreinstalledAssetsCache assetSpecifiersFromRoots:self->_cfg];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (!v8)
  {
LABEL_15:

LABEL_16:
    id v30 = v6;
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
      id v14 = [(UAFAssetSetExperiment *)self->_experiment assetSpecifiers];
      uint64_t v15 = [v14 objectForKeyedSubscript:v13];

      if (v15)
      {
        int v16 = [v7 containsObject:v15];

        if (!v16) {
          goto LABEL_15;
        }
        char v10 = 1;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  }
  while (v9);

  if ((v10 & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v17 = objc_opt_new();
  id v18 = self->_assetNameToAutoAsset;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_2;
  v41[3] = &unk_264CEC250;
  id v19 = v17;
  id v42 = v19;
  __int16 v43 = self;
  [(NSDictionary *)v18 enumerateKeysAndObjectsUsingBlock:v41];
  id v20 = objc_opt_new();
  long long v21 = self->_assetNameToAutoAsset;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_3;
  v37[3] = &unk_264CEC278;
  id v38 = v19;
  id v22 = v20;
  id v39 = v22;
  long long v40 = self;
  id v23 = v19;
  [(NSDictionary *)v21 enumerateKeysAndObjectsUsingBlock:v37];
  uint64_t v24 = [(UAFAssetSetExperiment *)self->_experiment experimentId];
  experimentId = self->_experimentId;
  self->_experimentId = v24;

  long long v26 = self->_assetNameToAutoAsset;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_4;
  v34[3] = &unk_264CEC250;
  id v35 = v22;
  id v27 = v6;
  id v36 = v27;
  id v28 = v22;
  [(NSDictionary *)v26 enumerateKeysAndObjectsUsingBlock:v34];
  id v29 = v27;

LABEL_17:
LABEL_20:

LABEL_21:

  return v3;
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(unsigned __int8 **)(a1 + 40);
  uint64_t v6 = v5[80];
  id v7 = a2;
  id v8 = [v5 createAssetFromPreinstalledWithAutoAssetInfo:a3 assetName:v7 experimentationEnabled:v6 experimentId:0];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 objectForKeyedSubscript:@"AssetSpecifier"];
  if (v6)
  {
    os_signpost_id_t v4 = [*(id *)(*(void *)(a1 + 40) + 136) assetSpecifiers];
    id v5 = [v4 objectForKeyedSubscript:v6];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  id v6 = [v5 objectForKeyedSubscript:@"AssetSpecifier"];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
      [v5 setObject:v8 forKeyedSubscript:@"AssetSpecifier"];

      uint64_t v9 = *(id **)(a1 + 48);
      char v10 = [v9[17] experimentId];
      uint64_t v11 = [v9 createAssetFromPreinstalledWithAutoAssetInfo:v5 assetName:v12 experimentationEnabled:1 experimentId:v10];
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v12];
    }
  }
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (v3)
  {
    os_signpost_id_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    dispatch_get_global_queue(0, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  id v28 = __41__UAFAssetSet_mapAsset_queue_completion___block_invoke;
  id v29 = &unk_264CEB6E0;
  id v11 = v10;
  id v31 = v11;
  id v12 = v9;
  id v30 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x237E26D50](&v26);
  if (!self->_autoAssetSet)
  {
    int v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 136315394;
      id v35 = "-[UAFAssetSet mapAsset:queue:completion:]";
      __int16 v36 = 2114;
      id v37 = uuid;
      _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@: mapping assets is only supported for autoassets", buf, 0x16u);
    }

    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41[0] = @"Not supported";
    id v18 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, &v40, 1, v26, v27, v28, v29);
    id v19 = v17;
    uint64_t v20 = 5000;
    goto LABEL_12;
  }
  id v14 = [(UAFAssetSet *)self assets];
  uint64_t v15 = [v14 objectForKeyedSubscript:v8];

  if (!v15)
  {
    long long v21 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v25 = self->_uuid;
      *(_DWORD *)buf = 136315650;
      id v35 = "-[UAFAssetSet mapAsset:queue:completion:]";
      __int16 v36 = 2114;
      id v37 = v25;
      __int16 v38 = 2114;
      id v39 = v8;
      _os_log_error_impl(&dword_23797A000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@: No '%{public}@' asset in asset set", buf, 0x20u);
    }

    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    uint64_t v33 = @"Asset missing";
    id v18 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v19 = v22;
    uint64_t v20 = 5001;
LABEL_12:
    id v23 = [v19 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v20 userInfo:v18];

    ((void (**)(void, void *))v13)[2](v13, v23);
    goto LABEL_13;
  }
  [(UAFAutoAssetSet *)self->_autoAssetSet mapAsset:v8 queue:v12 completion:v11];
LABEL_13:
}

void __41__UAFAssetSet_mapAsset_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__UAFAssetSet_mapAsset_queue_completion___block_invoke_2;
    v6[3] = &unk_264CEB4D0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __41__UAFAssetSet_mapAsset_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidateWithQueue:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[UAFAssetSet invalidateWithQueue:completion:]";
    __int16 v16 = 2114;
    uint64_t v17 = uuid;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Explicit invalidation", buf, 0x16u);
  }

  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    [(UAFAutoAssetSet *)autoAssetSet invalidateWithQueue:v6 completion:v7];
  }
  else if (v7)
  {
    id v11 = v6;
    if (!v11)
    {
      id v11 = dispatch_get_global_queue(0, 0);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__UAFAssetSet_invalidateWithQueue_completion___block_invoke;
    block[3] = &unk_264CEB800;
    id v13 = v7;
    dispatch_async(v11, block);
  }
}

uint64_t __46__UAFAssetSet_invalidateWithQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDictionary)usages
{
  return self->_usages;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (UAFAssetSetConsistencyToken)consistencyToken
{
  return (UAFAssetSetConsistencyToken *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)experimentationEnabled
{
  return self->_experimentationEnabled;
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (UAFAutoAssetSet)autoAssetSet
{
  return self->_autoAssetSet;
}

- (void)setAutoAssetSet:(id)a3
{
}

- (NSError)autoAssetSetError
{
  return self->_autoAssetSetError;
}

- (void)setAutoAssetSetError:(id)a3
{
}

- (UAFAssetSetExperiment)experiment
{
  return self->_experiment;
}

- (void)setExperiment:(id)a3
{
}

@end