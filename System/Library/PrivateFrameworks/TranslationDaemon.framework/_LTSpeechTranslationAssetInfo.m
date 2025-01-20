@interface _LTSpeechTranslationAssetInfo
+ (BOOL)_createSymlinkDirectoryForLocalePair:(id)a3 assets:(id)a4 validateIfNeeded:(BOOL)a5;
+ (id)_languagePairDirectoryForLocalePair:(id)a3;
+ (void)_createSymlink:(id)a3 target:(id)a4 error:(id *)a5;
+ (void)_createSymlinksFromDirectory:(id)a3 target:(id)a4 error:(id *)a5;
- (BOOL)_validateSymlinksForAssets:(id)a3;
- (BOOL)isCompleteBidirectionalModel;
- (BOOL)isCompletePassthroughModel;
- (BOOL)updateAvailableInAssets:(id)a3;
- (_LTSpeechTranslationAssetInfo)initWithInstalledAssets:(id)a3 catalogAssets:(id)a4 localePair:(id)a5 offlineConfig:(id)a6 assetManager:(id)a7;
- (id)availabilityInfo;
- (id)description;
- (id)speechModelURLForLocale:(id)a3;
- (id)speechModelVersionForLocale:(id)a3;
- (id)translationModelURLs;
- (int64_t)_mtModelOfflineState;
- (void)_referenceAssets:(id)a3 catalogAssets:(id)a4;
- (void)createSymlinkDirectoryForMTAssets;
- (void)downloadAssetsUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5;
- (void)purgeAssetUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation _LTSpeechTranslationAssetInfo

- (id)description
{
  v3 = [(_LTLocalePair *)self->_localePair sourceLocale];
  v4 = [v3 localeIdentifier];

  v5 = [(_LTLocalePair *)self->_localePair targetLocale];
  v6 = [v5 localeIdentifier];

  v7 = [NSString stringWithFormat:@"%@ <-> %@ | %@ %@", v4, v6, self->_offlineConfig, self->_allAssets];

  return v7;
}

- (_LTSpeechTranslationAssetInfo)initWithInstalledAssets:(id)a3 catalogAssets:(id)a4 localePair:(id)a5 offlineConfig:(id)a6 assetManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_LTSpeechTranslationAssetInfo;
  v17 = [(_LTSpeechTranslationAssetInfo *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a7);
    objc_storeStrong((id *)&v18->_offlineConfig, a6);
    objc_storeStrong((id *)&v18->_localePair, a5);
    uint64_t v19 = [v16 modelURLsForLanguagePair:v14];
    modelURLs = v18->_modelURLs;
    v18->_modelURLs = (NSArray *)v19;

    v21 = [(_LTDOfflineConfigurationModel *)v18->_offlineConfig pairAssetList];
    uint64_t v22 = [(_LTDOfflineConfigurationModel *)v18->_offlineConfig pairAssetConfigFile];
    v23 = (void *)v22;
    if (v21) {
      BOOL v24 = v22 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24)
    {
      v25 = _LTOSLogAssets();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[_LTSpeechTranslationAssetInfo initWithInstalledAssets:catalogAssets:localePair:offlineConfig:assetManager:]((uint64_t)&v18->_offlineConfig, v25);
      }
    }
    [(_LTSpeechTranslationAssetInfo *)v18 _referenceAssets:v12 catalogAssets:v13];
    v18->_needsUpdate = [(_LTSpeechTranslationAssetInfo *)v18 updateAvailableInAssets:v13];
    if (([v14 isPassthrough] & 1) == 0
      && ![(NSArray *)v18->_missingAssets count]
      && [(NSArray *)v18->_allAssets count]
      && ![(_LTSpeechTranslationAssetInfo *)v18 _validateSymlinksForAssets:v18->_mtAssets])
    {
      +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:v14 assets:v18->_mtAssets validateIfNeeded:0];
    }
    v26 = v18;
  }
  return v18;
}

- (void)createSymlinkDirectoryForMTAssets
{
  if (![(NSArray *)self->_missingAssets count] && [(NSArray *)self->_allAssets count])
  {
    localePair = self->_localePair;
    mtAssets = self->_mtAssets;
    +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:localePair assets:mtAssets validateIfNeeded:0];
  }
}

- (void)_referenceAssets:(id)a3 catalogAssets:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(_LTDOfflineConfigurationModel *)self->_offlineConfig pairAssetList];
  v9 = (void *)[v8 mutableCopy];

  v10 = [MEMORY[0x263EFF980] array];
  v11 = [MEMORY[0x263EFF980] array];
  v59 = [MEMORY[0x263EFF980] array];
  v58 = [MEMORY[0x263EFF980] array];
  char v12 = _os_feature_enabled_impl();
  id v13 = [(_LTLocalePair *)self->_localePair sourceLocale];
  if (v12)
  {
    id v56 = v6;
    id v69 = 0;
    id v14 = +[_LTDAssetService matchingASRAssetForLocale:v13 error:&v69];
    id v15 = v69;
    sourceASRModel = self->_sourceASRModel;
    self->_sourceASRModel = v14;

    v17 = self->_sourceASRModel;
    if (v17)
    {
      if ([(_LTDAssetModel *)v17 isInstalled]) {
        v18 = v10;
      }
      else {
        v18 = v59;
      }
      [v18 addObject:self->_sourceASRModel];
    }
    uint64_t v19 = [(_LTLocalePair *)self->_localePair targetLocale];
    id v68 = v15;
    v20 = +[_LTDAssetService matchingASRAssetForLocale:v19 error:&v68];
    id v21 = v68;

    targetASRModel = self->_targetASRModel;
    self->_targetASRModel = v20;

    v23 = self->_targetASRModel;
    if (v23)
    {
      if ([(_LTDAssetModel *)v23 isInstalled]) {
        BOOL v24 = v10;
      }
      else {
        BOOL v24 = v59;
      }
      [v24 addObject:self->_targetASRModel];
    }

    id v6 = v56;
  }
  else
  {
    v25 = +[_LTDAssetService matchingASRAssetInAssets:v7 forLocale:v13];
    v26 = self->_sourceASRModel;
    self->_sourceASRModel = v25;

    v27 = self->_sourceASRModel;
    if (v27)
    {
      if ([(_LTDAssetModel *)v27 isInstalled]) {
        objc_super v28 = v10;
      }
      else {
        objc_super v28 = v59;
      }
      [v28 addObject:self->_sourceASRModel];
    }
    v29 = [(_LTLocalePair *)self->_localePair targetLocale];
    v30 = +[_LTDAssetService matchingASRAssetInAssets:v7 forLocale:v29];
    v31 = self->_targetASRModel;
    self->_targetASRModel = v30;

    v32 = self->_targetASRModel;
    if (v32)
    {
      if ([(_LTDAssetModel *)v32 isInstalled]) {
        v33 = v10;
      }
      else {
        v33 = v59;
      }
      [v33 addObject:self->_targetASRModel];
    }
  }
  v57 = self;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v34 = v6;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v65 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v40 = [v39 identifier];
        if ([v9 containsObject:v40]
          && (([v39 isMTModel] & 1) != 0 || objc_msgSend(v39, "isPhrasebook")))
        {
          [v11 addObject:v39];
          [v10 addObject:v39];
          [v9 removeObject:v40];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v36);
  }

  if ([v9 count])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v56 = v7;
    id v41 = v7;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v61 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          v47 = objc_msgSend(v46, "identifier", v56);
          if ([v9 containsObject:v47]
            && (([v46 isMTModel] & 1) != 0 || objc_msgSend(v46, "isPhrasebook")))
          {
            [v59 addObject:v46];
            [v58 addObject:v46];
            [v9 removeObject:v47];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v43);
    }

    id v7 = v56;
  }
  uint64_t v48 = objc_msgSend(v11, "copy", v56);
  mtAssets = v57->_mtAssets;
  v57->_mtAssets = (NSArray *)v48;

  uint64_t v50 = [v10 copy];
  allAssets = v57->_allAssets;
  v57->_allAssets = (NSArray *)v50;

  uint64_t v52 = [v59 copy];
  missingAssets = v57->_missingAssets;
  v57->_missingAssets = (NSArray *)v52;

  uint64_t v54 = [v58 copy];
  missingMTAssets = v57->_missingMTAssets;
  v57->_missingMTAssets = (NSArray *)v54;
}

- (BOOL)updateAvailableInAssets:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v10 = self->_allAssets;
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if ([v9 isNewerCompatibleVersionThan:*(void *)(*((void *)&v17 + 1) + 8 * j)])
              {

                BOOL v15 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
    }
    while (v6);
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)speechModelURLForLocale:(id)a3
{
  localePair = self->_localePair;
  id v5 = a3;
  uint64_t v6 = [(_LTLocalePair *)localePair sourceLocale];
  int v7 = [v6 isEqual:v5];

  uint64_t v8 = 40;
  if (v7) {
    uint64_t v8 = 32;
  }
  v9 = [*(id *)((char *)&self->super.isa + v8) getLocalFileUrl];
  return v9;
}

- (id)speechModelVersionForLocale:(id)a3
{
  localePair = self->_localePair;
  id v5 = a3;
  uint64_t v6 = [(_LTLocalePair *)localePair targetLocale];
  int v7 = [v6 isEqual:v5];

  uint64_t v8 = 32;
  if (v7) {
    uint64_t v8 = 40;
  }
  uint64_t v9 = [*(id *)((char *)&self->super.isa + v8) assetVersion];

  v10 = [NSNumber numberWithInteger:v9];
  uint64_t v11 = [v10 stringValue];

  return v11;
}

- (id)translationModelURLs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_allAssets;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7++), "getLocalFileUrl", (void)v11);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  modelURLs = self->_modelURLs;
  return modelURLs;
}

- (BOOL)isCompletePassthroughModel
{
  int v3 = [(_LTLocalePair *)self->_localePair isPassthrough];
  if (v3)
  {
    sourceASRModel = self->_sourceASRModel;
    LOBYTE(v3) = [(_LTDAssetModel *)sourceASRModel isInstalled];
  }
  return v3;
}

- (BOOL)isCompleteBidirectionalModel
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(_LTSpeechTranslationAssetInfo *)self _validateSymlinksForAssets:self->_mtAssets])
  {
    BOOL v3 = 1;
  }
  else
  {
    [(_LTSpeechTranslationAssetInfo *)self createSymlinkDirectoryForMTAssets];
    BOOL v3 = [(_LTSpeechTranslationAssetInfo *)self _validateSymlinksForAssets:self->_mtAssets];
  }
  sourceASRModel = self->_sourceASRModel;
  if (sourceASRModel) {
    int v5 = [(_LTDAssetModel *)sourceASRModel isInstalled];
  }
  else {
    int v5 = 1;
  }
  targetASRModel = self->_targetASRModel;
  if (targetASRModel) {
    int v7 = [(_LTDAssetModel *)targetASRModel isInstalled];
  }
  else {
    int v7 = 1;
  }
  int64_t v8 = [(_LTSpeechTranslationAssetInfo *)self _mtModelOfflineState];
  uint64_t v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109632;
    v11[1] = v5;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = v8 == 2;
    _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Models - sourceASR: %{BOOL}i, targetASR: %{BOOL}i, mt: %{BOOL}i", (uint8_t *)v11, 0x14u);
  }
  if (v8 == 2) {
    return v3 & v5 & v7;
  }
  else {
    return 0;
  }
}

- (int64_t)_mtModelOfflineState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_missingAssets count]) {
    return 0;
  }
  if (_anyDownloading(self->_mtAssets)) {
    return 1;
  }
  uint64_t v4 = self->_modelURLs;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = v4;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)MEMORY[0x263F08850];
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v9);
        __int16 v12 = objc_msgSend(v10, "defaultManager", (void)v14);
        int v13 = [v11 path];

        LODWORD(v11) = [v12 fileExistsAtPath:v13];
        if (!v11)
        {

          return 0;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (_allInstalled(self->_mtAssets)) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)availabilityInfo
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F1C0E0]) initWithLocales:self->_localePair];
  int64_t v4 = [(_LTSpeechTranslationAssetInfo *)self _mtModelOfflineState];
  int v5 = _LTOfflineStateString();
  [v3 setMtState:v5];

  uint64_t v6 = [(_LTDAssetModel *)self->_sourceASRModel stateDescription];
  [v3 setSourceASRState:v6];

  uint64_t v7 = [(_LTDAssetModel *)self->_targetASRModel stateDescription];
  [v3 setTargetASRState:v7];

  if (v4 == 2
    || [(_LTLocalePair *)self->_localePair isPassthrough]
    && _allInstalled(self->_allAssets)
    && ![(NSArray *)self->_missingAssets count])
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = _anyDownloading(self->_allAssets);
  }
  [v3 setPairState:v8];
  [v3 setNeedsUpdate:self->_needsUpdate];
  return v3;
}

+ (id)_languagePairDirectoryForLocalePair:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[_LTOfflineAssetManager assetDirectory];
  int v5 = [v3 canonicalIdentifier];

  uint64_t v6 = [v4 URLByAppendingPathComponent:v5];

  return v6;
}

- (BOOL)_validateSymlinksForAssets:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_missingAssets = (void **)&self->_missingAssets;
  if ([(NSArray *)self->_missingAssets count] || ![(NSArray *)self->_allAssets count])
  {
    int v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_LTSpeechTranslationAssetInfo *)(uint64_t)self _validateSymlinksForAssets:v5];
    }
    return 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    localePair = self->_localePair;
    p_localePair = &self->_localePair;
    v10 = +[_LTSpeechTranslationAssetInfo _languagePairDirectoryForLocalePair:localePair];
    id v11 = [v10 URLByAppendingPathComponent:@"mt-quasar-config.json"];

    __int16 v12 = [v11 path];
    char v6 = [v7 fileExistsAtPath:v12];

    int v13 = _LTOSLogAssets();
    long long v14 = v13;
    if (v6)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v15 = *p_localePair;
        int v17 = 138543362;
        long long v18 = v15;
        _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Asset symlink skip accounting for %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:]();
    }
  }
  return v6;
}

+ (void)_createSymlink:(id)a3 target:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[_LTSpeechTranslationAssetInfo _createSymlink:target:error:](v9, v7);
  }
  v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [v8 path];
  __int16 v12 = [v7 path];
  [v10 createSymbolicLinkAtPath:v11 withDestinationPath:v12 error:a5];

  if (*a5)
  {
    int v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[_LTSpeechTranslationAssetInfo _createSymlink:target:error:]();
    }
  }
}

+ (void)_createSymlinksFromDirectory:(id)a3 target:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = [v9 path];
  [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:a5];

  if (*a5)
  {
    __int16 v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:]();
    }
  }
  else
  {
    int v13 = [v8 path];
    long long v14 = [v10 contentsOfDirectoryAtPath:v13 error:a5];

    if (*a5)
    {
      long long v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:]();
      }
    }
    else
    {
      id v27 = a1;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v25 = v14;
      obuint64_t j = v14;
      uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            long long v21 = [v9 URLByAppendingPathComponent:v20];
            long long v22 = [v8 URLByAppendingPathComponent:v20];
            char v28 = 0;
            long long v23 = [v22 path];
            [v10 fileExistsAtPath:v23 isDirectory:&v28];

            if (v28)
            {
              long long v24 = _LTOSLogAssets();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
                +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:](v33, v24, v22, &v34);
              }
              [v27 _createSymlinksFromDirectory:v22 target:v21 error:a5];
            }
            else
            {
              [v27 _createSymlink:v22 target:v21 error:a5];
            }
            if (*a5)
            {

              goto LABEL_22;
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_22:

      long long v14 = v25;
    }
  }
}

+ (BOOL)_createSymlinkDirectoryForLocalePair:(id)a3 assets:(id)a4 validateIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && [v9 count])
  {
    if (([v8 isPassthrough] & 1) != 0 || objc_msgSend(v8, "isVariantPair"))
    {
      id v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = v11;
        int v13 = [v8 identifier];
        *(_DWORD *)buf = 138543362;
        id v104 = v13;
        _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Skipping symlinks creation for passthrough / variant pair %{public}@", buf, 0xCu);
      }
      goto LABEL_7;
    }
    uint64_t v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = v16;
      uint64_t v18 = [v8 identifier];
      *(_DWORD *)buf = 138543362;
      id v104 = v18;
      _os_log_impl(&dword_2600DC000, v17, OS_LOG_TYPE_INFO, "Updating symlinks for %{public}@", buf, 0xCu);
    }
    id v102 = 0;
    uint64_t v19 = +[_LTDAssetService configAssetIfAvailableWithError:&v102];
    id v20 = v102;
    if (v20)
    {
      long long v21 = v20;
      long long v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:]0();
      }
      BOOL v14 = 0;
      goto LABEL_74;
    }
    long long v23 = [v19 getLocalFileUrl];
    if (!v23)
    {
      char v28 = _LTOSLogAssets();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](v28);
      }
      long long v21 = 0;
      BOOL v14 = 0;
      goto LABEL_73;
    }
    id v101 = 0;
    long long v24 = +[_LTDConfigurationService offlineConfigurationWithError:&v101];
    id v25 = v101;
    if (v25)
    {
      long long v21 = v25;
      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.9();
      }
      BOOL v14 = 0;
      id v27 = v24;
      goto LABEL_72;
    }
    long long v29 = [v8 canonicalIdentifier];
    v81 = v24;
    long long v30 = [v24 offlinePairConfigurationWithIdentifier:v29];

    v80 = v30;
    uint64_t v31 = [v30 pairAssetConfigFile];
    v82 = (void *)v31;
    if (!v31)
    {
      v46 = _LTOSLogAssets();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](v46);
      }
      long long v21 = 0;
      BOOL v14 = 0;
      v45 = v30;
      id v27 = v81;
LABEL_71:

LABEL_72:
LABEL_73:

LABEL_74:
      goto LABEL_8;
    }
    uint64_t v32 = v31;
    v33 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v34 = [a1 _languagePairDirectoryForLocalePair:v8];
    v79 = [v23 URLByAppendingPathComponent:v32];
    v83 = v23;
    v85 = v33;
    if (v5)
    {
      uint64_t v35 = v19;
      uint64_t v36 = v34;
      uint64_t v37 = [v34 URLByAppendingPathComponent:@"mt-quasar-config.json"];
      v38 = [v37 path];
      id v100 = 0;
      v39 = [v33 destinationOfSymbolicLinkAtPath:v38 error:&v100];
      id v40 = v100;

      v89 = v37;
      id v41 = [v37 path];
      if (![v33 fileExistsAtPath:v41] || v40)
      {
      }
      else
      {
        uint64_t v42 = [v79 path];
        int v43 = [v39 isEqualToString:v42];

        if (v43)
        {
          uint64_t v44 = _LTOSLogAssets();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v104 = v8;
            _os_log_impl(&dword_2600DC000, v44, OS_LOG_TYPE_INFO, "Skipping symlink directory creation, found quasar symlink on disk for %{public}@", buf, 0xCu);
          }

          long long v21 = 0;
          BOOL v14 = 0;
          uint64_t v19 = v35;
          long long v23 = v83;
          v45 = v80;
          id v27 = v81;
          goto LABEL_70;
        }
      }

      uint64_t v19 = v35;
      long long v23 = v83;
      v33 = v85;
      uint64_t v34 = v36;
    }
    v78 = v34;
    v47 = [v34 URLByAppendingPathExtension:@"tmp"];
    [v33 removeItemAtURL:v47 error:0];
    id v99 = 0;
    [v33 createDirectoryAtURL:v47 withIntermediateDirectories:1 attributes:0 error:&v99];
    v89 = v47;
    id v77 = v99;
    if (v77)
    {
      uint64_t v48 = _LTOSLogAssets();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        BOOL v14 = 0;
        v45 = v80;
        id v27 = v81;
        goto LABEL_69;
      }
      long long v21 = v77;
      +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.8((uint64_t)v47);
      BOOL v14 = 0;
      v45 = v80;
      id v27 = v81;
      uint64_t v36 = v34;
LABEL_70:

      goto LABEL_71;
    }
    v49 = [v47 URLByAppendingPathComponent:@"mt-quasar-config.json"];
    uint64_t v50 = [v49 path];
    v51 = [v79 path];
    id v98 = 0;
    [v33 createSymbolicLinkAtPath:v50 withDestinationPath:v51 error:&v98];
    id v52 = v98;

    v76 = v52;
    if (v52)
    {
      v53 = _LTOSLogAssets();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.7();
      }
    }
    v86 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v19);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = v10;
    uint64_t v54 = v85;
    uint64_t v88 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (!v88) {
      goto LABEL_58;
    }
    uint64_t v87 = *(void *)v95;
LABEL_44:
    uint64_t v55 = 0;
    while (1)
    {
      if (*(void *)v95 != v87) {
        objc_enumerationMutation(obj);
      }
      id v56 = *(void **)(*((void *)&v94 + 1) + 8 * v55);
      if ([v56 isMTModel]) {
        break;
      }
      if ([v56 isPhrasebook])
      {
        v57 = [v56 identifier];
        long long v62 = [v56 identifier];
        [v86 setObject:v57 forKeyedSubscript:v62];

        v59 = [v47 URLByAppendingPathComponent:v57];
        long long v63 = [v56 getLocalFileUrl];
        long long v64 = _LTOSLogAssets();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          id v104 = v63;
          __int16 v105 = 2114;
          v106 = v59;
          _os_log_impl(&dword_2600DC000, v64, OS_LOG_TYPE_INFO, "Creating link from %{public}@ to %{public}@", buf, 0x16u);
        }
        long long v65 = [v59 path];
        long long v66 = [v63 path];
        id v92 = 0;
        [v85 createSymbolicLinkAtPath:v65 withDestinationPath:v66 error:&v92];
        id v61 = v92;

        if (v61)
        {
          id v69 = _LTOSLogAssets();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
            +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.6();
          }

          uint64_t v19 = v75;
          long long v23 = v83;
          v45 = v80;
          id v27 = v81;
          uint64_t v54 = v85;
          goto LABEL_66;
        }

        long long v23 = v83;
        uint64_t v54 = v85;
        goto LABEL_55;
      }
LABEL_56:
      if (v88 == ++v55)
      {
        uint64_t v88 = [obj countByEnumeratingWithState:&v94 objects:v107 count:16];
        if (v88) {
          goto LABEL_44;
        }
LABEL_58:

        uint64_t v19 = v75;
        if (v76)
        {
          id v61 = 0;
          v45 = v80;
          id v27 = v81;
LABEL_67:
          [v54 removeItemAtURL:v47 error:0];
          BOOL v14 = 0;
        }
        else
        {
          id v91 = 0;
          v70 = [MEMORY[0x263F08900] dataWithJSONObject:v86 options:0 error:&v91];
          id v61 = v91;
          if (v61)
          {
            v71 = _LTOSLogAssets();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
              +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.4();
            }
          }
          uint64_t v72 = [v47 URLByAppendingPathComponent:@"assets.json"];
          [v70 writeToURL:v72 atomically:1];

          [v85 removeItemAtURL:v78 error:0];
          id v90 = 0;
          [v85 moveItemAtURL:v47 toURL:v78 error:&v90];
          id v73 = v90;
          if (v73)
          {
            v74 = _LTOSLogAssets();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:]();
            }
          }

          BOOL v14 = 1;
          long long v23 = v83;
          v45 = v80;
          id v27 = v81;
        }

LABEL_69:
        long long v21 = v77;
        uint64_t v36 = v78;
        goto LABEL_70;
      }
    }
    v57 = [v56 coreAssetName];
    v58 = [v56 identifier];
    [v86 setObject:v57 forKeyedSubscript:v58];

    v59 = [v47 URLByAppendingPathComponent:v57];
    long long v60 = [v56 getLocalFileUrl];
    id v93 = 0;
    [a1 _createSymlinksFromDirectory:v60 target:v59 error:&v93];
    id v61 = v93;

    if (v61)
    {
      long long v67 = _LTOSLogAssets();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.5();
      }
      uint64_t v19 = v75;
      v45 = v80;
      id v27 = v81;
LABEL_66:

      v47 = v89;
      goto LABEL_67;
    }
LABEL_55:

    v47 = v89;
    goto LABEL_56;
  }
LABEL_7:
  BOOL v14 = 0;
LABEL_8:

  return v14;
}

- (void)downloadAssetsUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  queue = a4;
  id v24 = a5;
  if ([(NSArray *)self->_missingAssets count])
  {
    id v8 = dispatch_group_create();
    id v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      localePair = self->_localePair;
      id v11 = v9;
      __int16 v12 = [(_LTLocalePair *)localePair identifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Requested to download asset for: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000;
    uint64_t v48 = __Block_byref_object_copy__10;
    v49 = __Block_byref_object_dispose__10;
    id v50 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__10;
    v41[4] = __Block_byref_object_dispose__10;
    uint64_t v42 = self->_localePair;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__10;
    v39[4] = __Block_byref_object_dispose__10;
    id v40 = [(NSArray *)self->_missingMTAssets arrayByAddingObjectsFromArray:self->_mtAssets];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = self->_missingAssets;
    uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v36;
      uint64_t v15 = v6 | 2;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v18 = _LTOSLogAssets();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int v43 = 138543362;
            uint64_t v44 = v17;
            _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, "Starting download for asset with attributes: %{public}@", v43, 0xCu);
          }
          dispatch_group_enter(v8);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke;
          v31[3] = &unk_2655480E0;
          p_long long buf = &buf;
          uint64_t v34 = v41;
          uint64_t v32 = v8;
          +[_LTDAssetService downloadAsset:v17 options:v15 progress:0 completion:v31];
        }
        uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_25;
    block[3] = &unk_265546188;
    char v28 = &buf;
    long long v29 = v41;
    long long v30 = v39;
    id v27 = v24;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v19 = _LTOSLogAssets();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = self->_localePair;
      long long v21 = v19;
      long long v22 = [(_LTLocalePair *)v20 identifier];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "No downloadable assets missing asset for: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    if (v24) {
      (*((void (**)(id, void))v24 + 2))(v24, 0);
    }
  }
}

- (void)purgeAssetUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v68 = *MEMORY[0x263EF8340];
  queue = a4;
  id v34 = a5;
  long long v36 = [MEMORY[0x263F08850] defaultManager];
  long long v35 = +[_LTOfflineAssetManager assetDirectory];
  id v40 = [(_LTOfflineAssetManager *)self->_assetManager assetIdentifierReferenceCountDictionary];
  id v7 = _LTOSLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    assetManager = self->_assetManager;
    id v9 = v7;
    v10 = [(_LTOfflineAssetManager *)assetManager assetIdentifierReferenceCountDictionary];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Reference counts before purge %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v64 = 0x3032000000;
  long long v65 = __Block_byref_object_copy__10;
  long long v66 = __Block_byref_object_dispose__10;
  id v67 = 0;
  id v11 = dispatch_group_create();
  __int16 v12 = [(_LTLocalePair *)self->_localePair identifier];
  long long v37 = [v35 URLByAppendingPathComponent:v12];

  uint64_t v13 = [v37 path];
  char v14 = [v36 fileExistsAtPath:v13];

  if (v14)
  {
    uint64_t v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 138543618;
      long long v60 = v37;
      __int16 v61 = 1024;
      BOOL v62 = v6;
      _os_log_impl(&dword_2600DC000, v15, OS_LOG_TYPE_DEFAULT, "Starting purge for %{public}@; userInitiated: %{BOOL}i",
        v59,
        0x12u);
    }
    id v56 = 0;
    [v36 removeItemAtURL:v37 error:&v56];
    id v32 = v56;
    if (v32)
    {
      uint64_t v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_LTSpeechTranslationAssetInfo purgeAssetUserInitiated:queue:completion:]((uint64_t)v37);
      }
    }
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v18 = self->_allAssets;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          long long v23 = [v22 identifier];
          id v24 = [v40 objectForKeyedSubscript:v23];

          if (!v24 || [v24 integerValue] <= 1) {
            [v17 addObject:v22];
          }
        }
        uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v19);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v17;
    uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(obj);
          }
          char v28 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          long long v29 = (id)_LTOSLogAssets();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            long long v30 = [v28 identifier];
            *(_DWORD *)v59 = 138543362;
            long long v60 = v30;
            _os_log_impl(&dword_2600DC000, v29, OS_LOG_TYPE_INFO, "Starting purge for asset %{public}@", v59, 0xCu);
          }
          dispatch_group_enter(v11);
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke;
          v45[3] = &unk_265548108;
          v45[4] = v28;
          p_long long buf = &buf;
          v46 = v11;
          +[_LTDAssetService purgeAsset:v28 completion:v45];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v25);
    }

    objc_initWeak((id *)v59, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_28;
    block[3] = &unk_265548130;
    objc_copyWeak(&v44, (id *)v59);
    int v43 = &buf;
    id v42 = v34;
    dispatch_group_notify(v11, queue, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)v59);
  }
  else
  {
    uint64_t v31 = _LTOSLogAssets();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v59 = 138543362;
      long long v60 = v37;
      _os_log_impl(&dword_2600DC000, v31, OS_LOG_TYPE_INFO, "Language pair directory doesn't exist %{public}@; nothing to purge",
        v59,
        0xCu);
    }
    id v32 = 0;
  }

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURLs, 0);
  objc_storeStrong((id *)&self->_missingMTAssets, 0);
  objc_storeStrong((id *)&self->_missingAssets, 0);
  objc_storeStrong((id *)&self->_mtAssets, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_targetASRModel, 0);
  objc_storeStrong((id *)&self->_sourceASRModel, 0);
  objc_storeStrong((id *)&self->_offlineConfig, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

- (void)initWithInstalledAssets:(uint64_t)a1 catalogAssets:(void *)a2 localePair:offlineConfig:assetManager:.cold.1(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [(id)OUTLINED_FUNCTION_1_5() debugDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_5(&dword_2600DC000, v5, v6, "Malformed config asset %@", v7, v8, v9, v10, v11);
}

- (void)_validateSymlinksForAssets:(void *)a3 .cold.1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *a2;
  uint64_t v6 = a3;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [*(id *)(a1 + 48) count];
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_2600DC000, v6, OS_LOG_TYPE_ERROR, "Asset symlink validation for %{public}@ failed due to missing assets %zu or no assets %zu", (uint8_t *)&v9, 0x20u);
}

- (void)_validateSymlinksForAssets:.cold.2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Asset on disk quasar symlink not found for %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlink:target:error:.cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to link model file: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlink:(void *)a1 target:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 path];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_1_5() path];
  int v5 = 138543618;
  uint8_t v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Creating link from %{public}@ to %{public}@", (uint8_t *)&v5, 0x16u);
}

+ (void)_createSymlinksFromDirectory:(void *)a3 target:(void *)a4 error:.cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  __int16 v7 = a2;
  uint64_t v8 = [a3 path];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_debug_impl(&dword_2600DC000, v7, OS_LOG_TYPE_DEBUG, "File is a directory, further descending: %{public}@", a1, 0xCu);
}

+ (void)_createSymlinksFromDirectory:target:error:.cold.2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to obtain content of locale model files directory: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinksFromDirectory:target:error:.cold.3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create model directory: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:(void *)a1 assets:validateIfNeeded:.cold.1(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_1_5() assetVersion];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_5(&dword_2600DC000, v3, v4, "Failed to get local file URL for configuration [ver: %zd]", v5, v6, v7, v8, v9);
}

+ (void)_createSymlinkDirectoryForLocalePair:(void *)a1 assets:validateIfNeeded:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_5() canonicalIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_5(&dword_2600DC000, v4, v5, "Failed to find offline configuration for pair: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to rename temp language pair directory: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to serialize JSON data for asset identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create symlinks for model directory: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to link model file: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to link mt-quasar-config.json: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:(uint64_t)a1 assets:validateIfNeeded:.cold.8(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "Failed to create directory '%{public}@': %@", (void)v3, DWORD2(v3));
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.9()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read offline configuration: %@", v2, v3, v4, v5, v6);
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.10()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read asset configuration: %@", v2, v3, v4, v5, v6);
}

- (void)purgeAssetUserInitiated:(uint64_t)a1 queue:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v1, v2, "Error deleting directory %{public}@: %@", (void)v3, DWORD2(v3));
}

@end