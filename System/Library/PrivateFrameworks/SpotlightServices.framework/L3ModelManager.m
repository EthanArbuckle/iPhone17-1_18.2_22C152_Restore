@interface L3ModelManager
- (BOOL)getBoolFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(BOOL)a6;
- (BOOL)loadDictionary;
- (BOOL)loadModel;
- (BOOL)loadModelConfig;
- (BOOL)loadUnitTestData:(id)a3;
- (BOOL)loaded;
- (L3ModelManager)init;
- (NSMutableArray)denseFeatureConfigs;
- (NSMutableArray)idFeatureConfigs;
- (SSPlistDataReader)bundleDict;
- (SSPlistDataReader)localeDict;
- (_MDPlistContainer)loadMdpData:(id)a3;
- (const)getStringFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 log:(BOOL)a6;
- (float)getFloatFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(float)a6;
- (float)minMaxNormalize:(float)a3 min:(float)a4 max:(float)a5;
- (float)sigmoid:(float)a3;
- (id)get2DArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5;
- (id)getArrayDictionaryFeatureField:(id *)a3 fieldName:(const char *)a4;
- (id)getArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5;
- (id)predict:(id)a3;
- (id)predict:(id)a3 unitTest:(BOOL)a4;
- (id)predictProcessedFeatures:(id)a3 denseFeatures:(id)a4;
- (int64_t)getBundleId:(id)a3 defaultValue:(int64_t)a4 hashing:(BOOL)a5 hashBucketStart:(int)a6 embeddingTableSize:(int)a7;
- (int64_t)getIntFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(int64_t)a6;
- (int64_t)getLocaleId:(id)a3 defaultValue:(int64_t)a4;
- (spotlight_l3_1)model;
- (void)extractFeatures:(id)a3 idFeatures:(id)a4 denseFeatures:(id)a5 index:(int64_t)a6 unitTest:(BOOL)a7;
- (void)loadModel;
- (void)loadModelConfig;
- (void)setBundleDict:(id)a3;
- (void)setDenseFeatureConfigs:(id)a3;
- (void)setIdFeatureConfigs:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setLocaleDict:(id)a3;
- (void)setModel:(id)a3;
- (void)unloadModel;
@end

@implementation L3ModelManager

- (L3ModelManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)L3ModelManager;
  v2 = [(L3ModelManager *)&v6 init];
  if (v2)
  {
    v3 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    condition = v2->_condition;
    v2->_condition = v3;
  }
  return v2;
}

- (BOOL)loadModel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSCondition *)self->_condition lock];
  if (self->_loaded)
  {
    v3 = SSGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v3, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3 - model is already loaded!", buf, 2u);
    }

    [(NSCondition *)self->_condition unlock];
    return 1;
  }
  self->_loaded = 0;
  if (![(L3ModelManager *)self loadDictionary])
  {
    v15 = SSGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[L3ModelManager loadModel]();
    }
    goto LABEL_17;
  }
  if (![(L3ModelManager *)self loadModelConfig])
  {
    v15 = SSGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[L3ModelManager loadModel]();
    }
LABEL_17:

    [(NSCondition *)self->_condition unlock];
    return 0;
  }
  v5 = @"spotlight_l3_ios_v1.mlmodelc";
  uint64_t v6 = SSDefaultsGetAssetPath(@"spotlight_l3_ios_v1.mlmodelc");
  if (!v6)
  {
    v5 = @"spotlight_l3_ios.mlmodelc";
    uint64_t v6 = SSDefaultsGetAssetPath(@"spotlight_l3_ios.mlmodelc");
  }
  v7 = (void *)v6;
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  v9 = objc_opt_new();
  [v9 setComputeUnits:0];
  id v17 = 0;
  v10 = [[spotlight_l3_1 alloc] initWithContentsOfURL:v8 configuration:v9 error:&v17];
  id v11 = v17;
  model = self->_model;
  self->_model = v10;

  BOOL v4 = v11 == 0;
  v13 = SSGeneralLog();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(L3ModelManager *)(uint64_t)v5 loadModel];
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3 - successfully loaded l3 model %@ ", buf, 0xCu);
    }

    self->_loaded = 1;
  }
  [(NSCondition *)self->_condition unlock];

  return v4;
}

- (void)unloadModel
{
  [(NSCondition *)self->_condition lock];
  bundleDict = self->_bundleDict;
  if (bundleDict)
  {
    self->_bundleDict = 0;
  }
  localeDict = self->_localeDict;
  if (localeDict)
  {
    self->_localeDict = 0;
  }
  idFeatureConfigs = self->_idFeatureConfigs;
  if (idFeatureConfigs)
  {
    self->_idFeatureConfigs = 0;
  }
  denseFeatureConfigs = self->_denseFeatureConfigs;
  if (denseFeatureConfigs)
  {
    self->_denseFeatureConfigs = 0;
  }
  v7 = [(spotlight_l3_1 *)self->_model model];

  if (v7)
  {
    model = self->_model;
    self->_model = 0;
  }
  self->_loaded = 0;
  v9 = SSGeneralLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BDB2A000, v9, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3 - unloaded L3 model!", v10, 2u);
  }

  [(NSCondition *)self->_condition unlock];
}

- (_MDPlistContainer)loadMdpData:(id)a3
{
  v3 = SSDefaultsGetAssetPath(a3);
  BOOL v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:8 error:0];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
      [v7 bytes];
      [v7 length];
      v8 = (_MDPlistContainer *)_MDPlistContainerCreateWithBytesAndDeallocator();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __30__L3ModelManager_loadMdpData___block_invoke(uint64_t a1)
{
}

- (BOOL)loadDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(L3ModelManager *)self loadMdpData:@"spotlight_l3_dictionary.mdplist"];
  if (v3)
  {
    BOOL v4 = v3;
    long long v17 = xmmword_1E634C878;
    long long v18 = xmmword_1E634C868;
    long long v15 = 0uLL;
    uint64_t v16 = 0;
    localeDict = self->_localeDict;
    self->_localeDict = 0;

    bundleDict = self->_bundleDict;
    self->_bundleDict = 0;

    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      long long v13 = v15;
      uint64_t v14 = v16;
      id v7 = [[SSPlistDataReader alloc] initWithPlistContainer:v4 obj:&v13];
      v8 = self->_bundleDict;
      self->_bundleDict = v7;
    }
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      v9 = [SSPlistDataReader alloc];
      long long v13 = v15;
      uint64_t v14 = v16;
      v10 = [(SSPlistDataReader *)v9 initWithPlistContainer:v4 obj:&v13];
      id v11 = self->_localeDict;
      self->_localeDict = v10;
    }
    if (self->_bundleDict) {
      LOBYTE(v3) = self->_localeDict != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)loadModelConfig
{
  v2 = self;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [(L3ModelManager *)self loadMdpData:@"spotlight_l3_model_v1.mdplist"];
  if (v3
    || (uint64_t v4 = [(L3ModelManager *)v2 loadMdpData:@"spotlight_l3_model.mdplist"],
        (v3 = (_MDPlistContainer *)v4) != 0))
  {
    long long v56 = xmmword_1E634C888;
    long long v54 = 0uLL;
    uint64_t v55 = 0;
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      cf = v3;
      uint64_t v5 = objc_opt_new();
      idFeatureConfigs = v2->_idFeatureConfigs;
      p_idFeatureConfigs = &v2->_idFeatureConfigs;
      v2->_idFeatureConfigs = (NSMutableArray *)v5;

      uint64_t v7 = objc_opt_new();
      denseFeatureConfigs = v2->_denseFeatureConfigs;
      p_denseFeatureConfigs = (void **)&v2->_denseFeatureConfigs;
      v2->_denseFeatureConfigs = (NSMutableArray *)v7;

      long long v52 = v54;
      uint64_t v53 = v55;
      int Count = _MDPlistArrayGetCount();
      if (Count >= 1)
      {
        int v10 = Count;
        int v11 = 0;
        unint64_t v12 = 0x1E4F29000uLL;
        long long v13 = &off_1E634B000;
        v41 = v2;
        int v40 = Count;
        while (1)
        {
          long long v52 = 0uLL;
          uint64_t v53 = 0;
          long long v50 = v54;
          uint64_t v51 = v55;
          _MDPlistArrayGetPlistObjectAtIndex();
          long long v50 = 0uLL;
          uint64_t v51 = 0;
          if ([(L3ModelManager *)v2 getBoolFeatureField:&v52 valueObj:&v50 fieldName:"enabled" defaultValue:1])
          {
            break;
          }
LABEL_24:
          if (++v11 == v10) {
            goto LABEL_27;
          }
        }
        uint64_t v14 = [(L3ModelManager *)v2 getStringFeatureField:&v52 valueObj:&v50 fieldName:"name" log:1];
        if (!v14)
        {
          v37 = SSGeneralLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[L3ModelManager loadModelConfig]();
          }

          v36 = cf;
          goto LABEL_32;
        }
        uint64_t v15 = v14;
        uint64_t v16 = [*(id *)(v12 + 24) stringWithUTF8String:v14];
        if (!strcmp([(L3ModelManager *)v2 getStringFeatureField:&v52 valueObj:&v50 fieldName:"feature_type" log:1], "id_string"))
        {
          long long v17 = objc_opt_new();
          [v17 setName:v16];
          objc_msgSend(v17, "setEmbeddingTableSize:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v52, &v50, "embedding_size", 1024));
          objc_msgSend(v17, "setEmbeddingDimention:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v52, &v50, "embedding_dim", 128));
          objc_msgSend(v17, "setHashing:", -[L3ModelManager getBoolFeatureField:valueObj:fieldName:defaultValue:](v2, "getBoolFeatureField:valueObj:fieldName:defaultValue:", &v52, &v50, "hashing", 0));
          objc_msgSend(v17, "setHashBucketStart:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v52, &v50, "hash_bucket_start", 128));
          v21 = (id *)p_idFeatureConfigs;
        }
        else
        {
          uint64_t v46 = v15;
          long long v17 = objc_opt_new();
          [(L3ModelManager *)v2 getFloatFeatureField:&v52 valueObj:&v50 fieldName:"default_value" defaultValue:0.0];
          objc_msgSend(v17, "setDefaultValue:");
          long long v48 = v52;
          uint64_t v49 = v53;
          if (_MDPlistDictionaryGetPlistObjectForKey())
          {
            [v17 setNormalization:1];
            long long v48 = 0uLL;
            uint64_t v49 = 0;
            long long v18 = objc_msgSend(*(id *)(v12 + 24), "stringWithUTF8String:", -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v50, &v48, "type", 1));
            [v17 setNormalizationType:v18];

            *(float *)&double v19 = (float)[(L3ModelManager *)v2 getIntFeatureField:&v50 valueObj:&v48 fieldName:"min" defaultValue:0];
            [v17 setNormalizationMin:v19];
            *(float *)&double v20 = (float)[(L3ModelManager *)v2 getIntFeatureField:&v50 valueObj:&v48 fieldName:"max" defaultValue:10];
            [v17 setNormalizationMax:v20];
          }
          else
          {
            [v17 setNormalization:0];
          }
          uint64_t v22 = [(L3ModelManager *)v2 getStringFeatureField:&v52 valueObj:&v50 fieldName:"transform" log:0];
          if (v22)
          {
            uint64_t v23 = v22;
            [v17 setTransform:1];
            v24 = [NSString stringWithUTF8String:v23];
            [v17 setTransformType:v24];

            v25 = objc_msgSend(NSString, "stringWithUTF8String:", -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v52, &v50, "original_feature", 1));
            [v17 setOriginalFeatureName:v25];
          }
          if ([(L3ModelManager *)v2 getStringFeatureField:&v52 valueObj:&v50 fieldName:"nested_field" log:0])
          {
            uint64_t v26 = [(L3ModelManager *)v2 getStringFeatureField:&v52 valueObj:&v50 fieldName:"sub_name" log:1];
            if (!v26)
            {
              v38 = SSGeneralLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                -[L3ModelManager loadModelConfig]();
              }

              CFRelease(cf);
              goto LABEL_33;
            }
            uint64_t v27 = v26;
            int v28 = [(L3ModelManager *)v2 getIntFeatureField:&v52 valueObj:&v50 fieldName:"padding" defaultValue:3];
            if (v28 < 1)
            {
              unint64_t v12 = 0x1E4F29000;
            }
            else
            {
              int v43 = v11;
              uint64_t v29 = 0;
              v47 = v17;
              v30 = v13;
              uint64_t v31 = (uint64_t)v16;
              do
              {
                v32 = (void *)v31;
                uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s_%d", v46, v27, v29);

                v33 = *p_denseFeatureConfigs;
                v34 = (void *)[objc_alloc((Class)v30[122]) initWithConfig:v47 name:v31];
                [v33 addObject:v34];

                uint64_t v29 = (v29 + 1);
              }
              while (v28 != v29);
              v2 = v41;
              int v10 = v40;
              unint64_t v12 = 0x1E4F29000;
              int v11 = v43;
              v35 = v30;
              long long v17 = v47;
              uint64_t v16 = (void *)v31;
              long long v13 = v35;
            }
            goto LABEL_23;
          }
          [v17 setName:v16];
          v21 = p_denseFeatureConfigs;
          unint64_t v12 = 0x1E4F29000;
        }
        [*v21 addObject:v17];
LABEL_23:

        goto LABEL_24;
      }
LABEL_27:
      CFRelease(cf);
      LOBYTE(v4) = 1;
    }
    else
    {
      v36 = v3;
LABEL_32:
      CFRelease(v36);
LABEL_33:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)loadUnitTestData:(id)a3
{
  id v4 = a3;
  if ([(L3ModelManager *)self loadMdpData:@"spotlight_l3_ios_unit_test_data_v1.mdplist"])
  {
    memset(v11, 0, sizeof(v11));
    _MDPlistGetRootPlistObjectFromPlist();
    uint64_t v5 = [(L3ModelManager *)self get2DArrayFeatureField:v11 fieldName:"idFeatures" dataType:0];
    if (v5)
    {
      uint64_t v6 = [(L3ModelManager *)self get2DArrayFeatureField:v11 fieldName:"denseFeatures" dataType:1];
      BOOL v7 = v6 != 0;
      if (v6)
      {
        v8 = [(L3ModelManager *)self getArrayDictionaryFeatureField:v11 fieldName:"rawFeatures"];
        v9 = [(L3ModelManager *)self getArrayFeatureField:v11 fieldName:"scores" dataType:1];
        [v4 setObject:v5 forKeyedSubscript:@"idFeatures"];
        [v4 setObject:v6 forKeyedSubscript:@"denseFeatures"];
        [v4 setObject:v8 forKeyedSubscript:@"rawFeatures"];
        [v4 setObject:v9 forKeyedSubscript:@"scores"];
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (const)getStringFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 log:(BOOL)a6
{
  BOOL v6 = a6;
  if (_MDPlistDictionaryGetPlistObjectForKey()) {
    return (const char *)_MDPlistStringGetValue();
  }
  if (v6)
  {
    v9 = SSGeneralLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:]((uint64_t)a5, v9);
    }
  }
  return 0;
}

- (BOOL)getBoolFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(BOOL)a6
{
  if (_MDPlistDictionaryGetPlistObjectForKey()) {
    return _MDPlistBooleanGetValue() != 0;
  }
  return a6;
}

- (int64_t)getIntFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(int64_t)a6
{
  if (_MDPlistDictionaryGetPlistObjectForKey()) {
    return _MDPlistNumberGetIntValue();
  }
  return a6;
}

- (float)getFloatFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(float)a6
{
  if (_MDPlistDictionaryGetPlistObjectForKey())
  {
    _MDPlistNumberGetDoubleValue();
    return v7;
  }
  return a6;
}

- (id)get2DArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5
{
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    id v15 = 0;
    goto LABEL_16;
  }
  int Count = _MDPlistArrayGetCount();
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count < 1)
  {
LABEL_12:
    id v15 = v7;
    goto LABEL_15;
  }
  int v8 = 0;
  while (1)
  {
    _MDPlistArrayGetPlistObjectAtIndex();
    int v9 = _MDPlistArrayGetCount();
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    int v11 = v10;
    if (v9 >= 1) {
      break;
    }
LABEL_11:
    [v7 addObject:v11];

    if (++v8 == Count) {
      goto LABEL_12;
    }
  }
  if (a5 <= 1)
  {
    for (int i = 0; i != v9; ++i)
    {
      long long v13 = (void *)MEMORY[0x1E4F28ED0];
      _MDPlistArrayGetPlistObjectAtIndex();
      if (a5)
      {
        _MDPlistNumberGetDoubleValue();
        objc_msgSend(v13, "numberWithDouble:");
      }
      else
      {
        [v13 numberWithLongLong:_MDPlistNumberGetIntValue()];
      uint64_t v14 = };
      [v11 addObject:v14];
    }
    goto LABEL_11;
  }

  id v15 = 0;
LABEL_15:

LABEL_16:
  return v15;
}

- (id)getArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5
{
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    id v12 = 0;
    goto LABEL_13;
  }
  int Count = _MDPlistArrayGetCount();
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count < 1)
  {
LABEL_9:
    id v12 = v7;
    goto LABEL_12;
  }
  int v8 = 0;
  while (1)
  {
    _MDPlistArrayGetPlistObjectAtIndex();
    if (a5 == 1)
    {
      int v10 = (void *)MEMORY[0x1E4F28ED0];
      _MDPlistNumberGetDoubleValue();
      uint64_t v9 = objc_msgSend(v10, "numberWithDouble:", 0, 0, 0);
      goto LABEL_8;
    }
    if (a5) {
      break;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", _MDPlistNumberGetIntValue(), 0, 0, 0);
LABEL_8:
    int v11 = (void *)v9;
    [v7 addObject:v9];

    if (Count == ++v8) {
      goto LABEL_9;
    }
  }
  id v12 = 0;
LABEL_12:

LABEL_13:
  return v12;
}

- (id)getArrayDictionaryFeatureField:(id *)a3 fieldName:(const char *)a4
{
  if (_MDPlistDictionaryGetPlistObjectForKey())
  {
    int Count = _MDPlistArrayGetCount();
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count >= 1)
    {
      for (int i = 0; i != Count; ++i)
      {
        _MDPlistArrayGetPlistObjectAtIndex();
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:_MDPlistDictionaryGetCount()];
        id v7 = v9;
        _MDPlistDictionaryIterate();
        [v5 addObject:v7];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

void __59__L3ModelManager_getArrayDictionaryFeatureField_fieldName___block_invoke(uint64_t a1, uint64_t a2)
{
  if (_MDPlistGetPlistObjectType() == 244 || _MDPlistGetPlistObjectType() == 245)
  {
    id v4 = [NSString stringWithUTF8String:_MDPlistStringGetValue()];
    uint64_t v5 = *(void **)(a1 + 32);
    BOOL v6 = NSString;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28ED0];
    _MDPlistNumberGetDoubleValue();
    id v4 = objc_msgSend(v7, "numberWithDouble:");
    uint64_t v5 = *(void **)(a1 + 32);
    BOOL v6 = NSString;
  }
  int v8 = [v6 stringWithUTF8String:a2];
  [v5 setObject:v4 forKeyedSubscript:v8];
}

- (int64_t)getBundleId:(id)a3 defaultValue:(int64_t)a4 hashing:(BOOL)a5 hashBucketStart:(int)a6 embeddingTableSize:(int)a7
{
  if (a3)
  {
    bundleDict = self->_bundleDict;
    if (bundleDict)
    {
      BOOL v10 = a5;
      int64_t v11 = -[SSPlistDataReader intValueForBundle:defaultValue:](bundleDict, "intValueForBundle:defaultValue:");
      a4 = v11;
      if (v10 && v11 >= a6) {
        return (v11 - a6) % (a7 - a6) + a6;
      }
    }
  }
  return a4;
}

- (int64_t)getLocaleId:(id)a3 defaultValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && self->_localeDict)
  {
    int v8 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

    localeDict = self->_localeDict;
    id v7 = v8;
    a4 = -[SSPlistDataReader intValueForKey:defaultValue:](localeDict, "intValueForKey:defaultValue:", [v7 UTF8String], a4);
  }

  return a4;
}

- (float)minMaxNormalize:(float)a3 min:(float)a4 max:(float)a5
{
  return (float)(a3 - a4) / (float)(a5 - a4);
}

- (float)sigmoid:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (void)extractFeatures:(id)a3 idFeatures:(id)a4 denseFeatures:(id)a5 index:(int64_t)a6 unitTest:(BOOL)a7
{
  BOOL v70 = a7;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v72 = a4;
  id v75 = a5;
  v76 = self;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obj = self->_idFeatureConfigs;
  uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    id v73 = *(id *)v84;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(id *)v84 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        id v15 = [v14 name];
        int v16 = [v15 isEqualToString:@"locale"];

        if (v16)
        {
          long long v17 = (void *)MEMORY[0x1E4F28ED0];
          long long v18 = [v14 name];
          double v19 = [v77 objectForKey:v18];
          double v20 = objc_msgSend(v17, "numberWithLong:", -[L3ModelManager getLocaleId:defaultValue:](self, "getLocaleId:defaultValue:", v19, 1));
          v21 = [MEMORY[0x1E4F28ED0] numberWithLong:a6];
          v93[0] = v21;
          uint64_t v22 = (v12 + 1);
          uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
          v93[1] = v23;
          v24 = (void *)MEMORY[0x1E4F1C978];
          v25 = v93;
LABEL_10:
          uint64_t v29 = [v24 arrayWithObjects:v25 count:2];
          [v72 setObject:v20 forKeyedSubscript:v29];

          uint64_t v12 = v22;
          goto LABEL_13;
        }
        uint64_t v26 = [v14 name];
        int v27 = [v26 isEqualToString:@"section_bundle_id"];

        if (v27)
        {
          int v28 = (void *)MEMORY[0x1E4F28ED0];
          long long v18 = [v14 name];
          double v19 = [v77 objectForKey:v18];
          double v20 = objc_msgSend(v28, "numberWithLong:", -[L3ModelManager getBundleId:defaultValue:hashing:hashBucketStart:embeddingTableSize:](self, "getBundleId:defaultValue:hashing:hashBucketStart:embeddingTableSize:", v19, 1006, objc_msgSend(v14, "hashing"), objc_msgSend(v14, "hashBucketStart"), objc_msgSend(v14, "embeddingTableSize")));
          v21 = [MEMORY[0x1E4F28ED0] numberWithLong:a6];
          v92[0] = v21;
          uint64_t v22 = (v12 + 1);
          uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
          v92[1] = v23;
          v24 = (void *)MEMORY[0x1E4F1C978];
          v25 = v92;
          goto LABEL_10;
        }
        long long v18 = SSGeneralLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:]((uint64_t)v91, (uint64_t)v14);
        }
LABEL_13:
      }
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v11);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v74 = self->_denseFeatureConfigs;
  uint64_t v30 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (!v30) {
    goto LABEL_48;
  }
  uint64_t v31 = v30;
  uint64_t v32 = 0;
  BOOL v33 = !v70;
  uint64_t v34 = *(void *)v80;
  do
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v80 != v34) {
        objc_enumerationMutation(v74);
      }
      v36 = *(void **)(*((void *)&v79 + 1) + 8 * v35);
      v37 = [v36 name];
      char v38 = [v37 isEqualToString:@"position_section"] & v33;

      float v39 = 3.0;
      if ((v38 & 1) == 0)
      {
        uint64_t v40 = v32;
        uint64_t v41 = v31;
        uint64_t v42 = v34;
        BOOL v43 = v33;
        v44 = [v36 name];
        if ([v36 transform])
        {
          uint64_t v45 = [v36 originalFeatureName];

          v44 = (void *)v45;
        }
        if (v70)
        {
          uint64_t v46 = [v44 lowercaseString];

          v44 = (void *)v46;
        }
        v47 = [v77 objectForKeyedSubscript:v44];
        if (v47)
        {
          if ([v36 transform])
          {
            long long v48 = [v36 transformType];
            int v49 = [v48 isEqualToString:@"string_length"];

            if (v49)
            {
              float v39 = (float)(unint64_t)[v47 length];
            }
            else
            {
              v68 = SSGeneralLog();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:]((uint64_t)v89, (uint64_t)v36);
              }

              float v39 = 0.0;
            }
            goto LABEL_32;
          }
          [v47 floatValue];
        }
        else
        {
          [v36 defaultValue];
        }
        float v39 = v50;
LABEL_32:

        BOOL v33 = v43;
        uint64_t v34 = v42;
        uint64_t v31 = v41;
        uint64_t v32 = v40;
      }
      if (![v36 normalization]) {
        goto LABEL_42;
      }
      long long v52 = [v36 normalizationType];
      int v53 = [v52 isEqualToString:@"minmax"];

      if (v53)
      {
        [v36 normalizationMin];
        int v55 = v54;
        [v36 normalizationMax];
        LODWORD(v57) = v56;
        *(float *)&double v58 = v39;
        LODWORD(v59) = v55;
        [(L3ModelManager *)v76 minMaxNormalize:v58 min:v59 max:v57];
LABEL_38:
        float v39 = *(float *)&v51;
        goto LABEL_42;
      }
      v60 = [v36 normalizationType];
      int v61 = [v60 isEqualToString:@"sigmoid"];

      if (v61)
      {
        *(float *)&double v62 = v39;
        [(L3ModelManager *)v76 sigmoid:v62];
        goto LABEL_38;
      }
      v63 = SSGeneralLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:]((uint64_t)v88, (uint64_t)v36);
      }

LABEL_42:
      *(float *)&double v51 = v39;
      v64 = [MEMORY[0x1E4F28ED0] numberWithFloat:v51];
      v65 = [MEMORY[0x1E4F28ED0] numberWithLong:a6];
      v87[0] = v65;
      v66 = [MEMORY[0x1E4F28ED0] numberWithInt:v32 + v35];
      v87[1] = v66;
      v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
      [v75 setObject:v64 forKeyedSubscript:v67];

      ++v35;
    }
    while (v31 != v35);
    uint64_t v69 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v79 objects:v90 count:16];
    uint64_t v31 = v69;
    uint64_t v32 = (v32 + v35);
  }
  while (v69);
LABEL_48:
}

- (id)predict:(id)a3
{
  return [(L3ModelManager *)self predict:a3 unitTest:0];
}

- (id)predict:(id)a3 unitTest:(BOOL)a4
{
  BOOL v4 = a4;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (self->_model)
  {
    uint64_t v8 = [v6 count];
    id v9 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithLong:v8];
    v29[0] = v10;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_idFeatureConfigs, "count"));
    v29[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    id v27 = 0;
    long long v13 = (void *)[v9 initWithShape:v12 dataType:131104 error:&v27];
    id v14 = v27;

    id v23 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    id v15 = [MEMORY[0x1E4F28ED0] numberWithLong:v8];
    v28[0] = v15;
    int v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_denseFeatureConfigs, "count"));
    v28[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    id v26 = v14;
    long long v18 = (void *)[v23 initWithShape:v17 dataType:65568 error:&v26];
    id v24 = v26;

    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        double v20 = objc_msgSend(v7, "objectAtIndexedSubscript:", i, v24);
        [(L3ModelManager *)self extractFeatures:v20 idFeatures:v13 denseFeatures:v18 index:i unitTest:v4];
      }
    }
    v21 = -[L3ModelManager predictProcessedFeatures:denseFeatures:](self, "predictProcessedFeatures:denseFeatures:", v13, v18, v24);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)predictProcessedFeatures:(id)a3 denseFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[spotlight_l3_1Input alloc] initWithId_features:v6 dense_features:v7];
  model = self->_model;
  uint64_t v25 = 0;
  uint64_t v10 = [(spotlight_l3_1 *)model predictionFromFeatures:v8 error:&v25];
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  if (!v25 && v10)
  {
    long long v13 = [v10 y];
    uint64_t v14 = [v13 count];

    if (v14 < 1)
    {
      uint64_t v12 = 0;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F1CA48];
      int v16 = [v11 y];
      uint64_t v12 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

      long long v17 = [v11 y];
      uint64_t v18 = [v17 count];

      if (v18 >= 1)
      {
        uint64_t v19 = 0;
        do
        {
          double v20 = [v11 y];
          v21 = [v20 objectAtIndexedSubscript:v19];
          [v12 addObject:v21];

          ++v19;
          uint64_t v22 = [v11 y];
          uint64_t v23 = [v22 count];
        }
        while (v23 > v19);
      }
    }
  }

  return v12;
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (spotlight_l3_1)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (SSPlistDataReader)bundleDict
{
  return self->_bundleDict;
}

- (void)setBundleDict:(id)a3
{
}

- (SSPlistDataReader)localeDict
{
  return self->_localeDict;
}

- (void)setLocaleDict:(id)a3
{
}

- (NSMutableArray)idFeatureConfigs
{
  return self->_idFeatureConfigs;
}

- (void)setIdFeatureConfigs:(id)a3
{
}

- (NSMutableArray)denseFeatureConfigs
{
  return self->_denseFeatureConfigs;
}

- (void)setDenseFeatureConfigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denseFeatureConfigs, 0);
  objc_storeStrong((id *)&self->_idFeatureConfigs, 0);
  objc_storeStrong((id *)&self->_localeDict, 0);
  objc_storeStrong((id *)&self->_bundleDict, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (void)loadModel
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[SpotlightRanking] L3 - failed to load l3 model dictionary", v2, v3, v4, v5, v6);
}

- (void)loadModelConfig
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[SpotlightRanking] L3 error: Can not read model config features->sub_name", v2, v3, v4, v5, v6);
}

- (void)getStringFeatureField:(uint64_t)a1 valueObj:(NSObject *)a2 fieldName:log:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "[SpotlightRanking] L3 error: Can not read model config features->%s", (uint8_t *)&v2, 0xCu);
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "normalizationType");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BDB2A000, v5, v6, "[SpotlightRanking] L3 error: normalization type %@ is not supported");
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "transformType");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BDB2A000, v5, v6, "[SpotlightRanking] L3 error: transform type %@ is not supported");
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "name");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1BDB2A000, v5, v6, "[SpotlightRanking] L3 error: id feature %@ is not supported");
}

@end