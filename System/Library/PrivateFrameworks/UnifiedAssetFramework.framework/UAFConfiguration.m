@interface UAFConfiguration
+ (BOOL)assetRootSupported;
+ (BOOL)autoAssetFeatureEnabled:(id)a3;
+ (BOOL)isValid:(id)a3 fileType:(id)a4 fileVersions:(id)a5 error:(id *)a6;
+ (BOOL)isValidValue:(id)a3 key:(id)a4 kind:(Class)a5 required:(BOOL)a6 error:(id *)a7;
+ (BOOL)trialFeatureEnabled:(id)a3;
@end

@implementation UAFConfiguration

+ (BOOL)assetRootSupported
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isValidValue:(id)a3 key:(id)a4 kind:(Class)a5 required:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v56[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  if (v8)
  {
    v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13)
    {
      if (a7)
      {
        v26 = (void *)MEMORY[0x263F087E8];
        if (*a7)
        {
          v55[0] = *MEMORY[0x263F08320];
          v27 = [NSString stringWithFormat:@"Required key %@ has no value", v12];
          v55[1] = *MEMORY[0x263F08608];
          v56[0] = v27;
          v56[1] = *a7;
          v28 = NSDictionary;
          v29 = (void **)v56;
          v30 = v55;
          uint64_t v31 = 2;
        }
        else
        {
          uint64_t v53 = *MEMORY[0x263F08320];
          v27 = [NSString stringWithFormat:@"Required key %@ has no value", v12];
          v54 = v27;
          v28 = NSDictionary;
          v29 = &v54;
          v30 = &v53;
          uint64_t v31 = 1;
        }
        v37 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];
        *a7 = [v26 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v37];
      }
      v34 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "+[UAFConfiguration isValidValue:key:kind:required:error:]";
        __int16 v41 = 2112;
        id v42 = v12;
        _os_log_impl(&dword_23797A000, v34, OS_LOG_TYPE_DEFAULT, "%s Required key %@ has no value", buf, 0x16u);
      }
      goto LABEL_20;
    }
  }
  v14 = [v11 objectForKeyedSubscript:v12];

  if (v14)
  {
    v15 = [v11 objectForKeyedSubscript:v12];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (a7)
      {
        v18 = (void *)MEMORY[0x263F087E8];
        if (*a7)
        {
          v51[0] = *MEMORY[0x263F08320];
          v19 = NSString;
          v20 = [v11 objectForKeyedSubscript:v12];
          v21 = [v19 stringWithFormat:@"Key %@ is not expected kind \"%@\": %@ vs %@", v12, a5, v20, objc_opt_class()];
          v51[1] = *MEMORY[0x263F08608];
          v52[0] = v21;
          v52[1] = *a7;
          v22 = NSDictionary;
          v23 = (void **)v52;
          v24 = v51;
          uint64_t v25 = 2;
        }
        else
        {
          uint64_t v49 = *MEMORY[0x263F08320];
          v32 = NSString;
          v20 = [v11 objectForKeyedSubscript:v12];
          v21 = [v32 stringWithFormat:@"Key %@ is not expected kind \"%@\": %@ vs %@", v12, a5, v20, objc_opt_class()];
          v50 = v21;
          v22 = NSDictionary;
          v23 = &v50;
          v24 = &v49;
          uint64_t v25 = 1;
        }
        v33 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
        *a7 = [v18 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v33];
      }
      v34 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v11 objectForKeyedSubscript:v12];
        *(_DWORD *)buf = 136316162;
        v40 = "+[UAFConfiguration isValidValue:key:kind:required:error:]";
        __int16 v41 = 2112;
        id v42 = v12;
        __int16 v43 = 2112;
        Class v44 = a5;
        __int16 v45 = 2112;
        v46 = v35;
        __int16 v47 = 2112;
        id v48 = (id)objc_opt_class();
        id v36 = v48;
        _os_log_impl(&dword_23797A000, v34, OS_LOG_TYPE_DEFAULT, "%s Key %@ is not expected kind \"%@\": %@ vs %@", buf, 0x34u);
      }
LABEL_20:

      BOOL v17 = 0;
      goto LABEL_21;
    }
  }
  BOOL v17 = 1;
LABEL_21:

  return v17;
}

+ (BOOL)isValid:(id)a3 fileType:(id)a4 fileVersions:(id)a5 error:(id *)a6
{
  v65[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = a4;
  id v11 = a5;
  id v12 = [v9 objectForKeyedSubscript:@"FileType"];
  char v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    v14 = [v9 objectForKeyedSubscript:@"FileVersion"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v45 + 1) + 8 * i) isEqualToString:v14])
          {
            BOOL v35 = 1;
            goto LABEL_27;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if (a6)
    {
      Class v44 = (void *)MEMORY[0x263F087E8];
      if (*a6)
      {
        v51[0] = *MEMORY[0x263F08320];
        v20 = NSString;
        v21 = [v9 objectForKeyedSubscript:@"FileVersion"];
        v22 = [v20 stringWithFormat:@"%@ value \"%@\" is not one of \"%@\", @"FileVersion"", v21, v15];
        v51[1] = *MEMORY[0x263F08608];
        v52[0] = v22;
        v52[1] = *a6;
        v23 = NSDictionary;
        v24 = (void **)v52;
        uint64_t v25 = v51;
        uint64_t v26 = 2;
      }
      else
      {
        uint64_t v49 = *MEMORY[0x263F08320];
        v39 = NSString;
        v21 = [v9 objectForKeyedSubscript:@"FileVersion"];
        v22 = [v39 stringWithFormat:@"%@ value \"%@\" is not one of \"%@\", @"FileVersion"", v21, v15];
        v50 = v22;
        v23 = NSDictionary;
        v24 = &v50;
        uint64_t v25 = &v49;
        uint64_t v26 = 1;
      }
      v40 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
      *a6 = [v44 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v40];
    }
    __int16 v41 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [v9 objectForKeyedSubscript:@"FileVersion"];
      *(_DWORD *)buf = 136315906;
      v55 = "+[UAFConfiguration isValid:fileType:fileVersions:error:]";
      __int16 v56 = 2112;
      v57 = @"FileVersion";
      __int16 v58 = 2112;
      v59 = v42;
      __int16 v60 = 2112;
      v61 = v15;
      _os_log_impl(&dword_23797A000, v41, OS_LOG_TYPE_DEFAULT, "%s %@ value \"%@\" is not one of \"%@\"", buf, 0x2Au);
    }
    BOOL v35 = 0;
    v15 = v41;
LABEL_27:
  }
  else
  {
    if (a6)
    {
      v27 = (void *)MEMORY[0x263F087E8];
      if (*a6)
      {
        v64[0] = *MEMORY[0x263F08320];
        v28 = NSString;
        v29 = [v9 objectForKeyedSubscript:@"FileType"];
        v30 = [v28 stringWithFormat:@"%@ value \"%@\" is not \"%@\", @"FileType"", v29, v10];
        v64[1] = *MEMORY[0x263F08608];
        v65[0] = v30;
        v65[1] = *a6;
        uint64_t v31 = NSDictionary;
        v32 = (void **)v65;
        v33 = v64;
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v62 = *MEMORY[0x263F08320];
        id v36 = NSString;
        v29 = [v9 objectForKeyedSubscript:@"FileType"];
        v30 = [v36 stringWithFormat:@"%@ value \"%@\" is not \"%@\", @"FileType"", v29, v10];
        v63 = v30;
        uint64_t v31 = NSDictionary;
        v32 = &v63;
        v33 = &v62;
        uint64_t v34 = 1;
      }
      v37 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
      *a6 = [v27 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v37];
    }
    v14 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [v9 objectForKeyedSubscript:@"FileType"];
      *(_DWORD *)buf = 136315906;
      v55 = "+[UAFConfiguration isValid:fileType:fileVersions:error:]";
      __int16 v56 = 2112;
      v57 = @"FileType";
      __int16 v58 = 2112;
      v59 = v38;
      __int16 v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ value \"%@\" is not \"%@\"", buf, 0x2Au);
    }
    BOOL v35 = 0;
  }

  return v35;
}

+ (BOOL)autoAssetFeatureEnabled:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.siri.dialog"]
    || [v3 isEqualToString:@"com.apple.siri.asr.hammer"]
    || [v3 isEqualToString:@"com.apple.siri.findmy"]
    || [v3 isEqualToString:@"com.apple.siri.understanding"]
    || [v3 isEqualToString:@"com.apple.siri.understanding.nl.overrides"])
  {
    if (_os_feature_enabled_impl())
    {
LABEL_7:
      v4 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v7 = 136315394;
        BOOL v8 = "+[UAFConfiguration autoAssetFeatureEnabled:]";
        __int16 v9 = 2112;
        id v10 = v3;
        _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s Auto Asset Feature enabled for %@", (uint8_t *)&v7, 0x16u);
      }
      BOOL v5 = 1;
      goto LABEL_15;
    }
  }
  else if ([v3 isEqualToString:@"com.apple.siri.tts"] {
         && _os_feature_enabled_impl())
  }
  {
    goto LABEL_7;
  }
  v4 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    BOOL v8 = "+[UAFConfiguration autoAssetFeatureEnabled:]";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s Auto Asset Feature disabled for %@", (uint8_t *)&v7, 0x16u);
  }
  BOOL v5 = 0;
LABEL_15:

  return v5;
}

+ (BOOL)trialFeatureEnabled:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.siri.asr.hammer"]
     || [v3 isEqualToString:@"com.apple.siri.understanding"]
     || [v3 isEqualToString:@"com.apple.siri.understanding.nl.overrides"]
     || [v3 isEqualToString:@"com.apple.siri.tts"]
     || [v3 isEqualToString:@"com.apple.siri.dialog"]
     || [v3 isEqualToString:@"com.apple.siri.findmy"])
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      BOOL v8 = "+[UAFConfiguration trialFeatureEnabled:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s Trial Feature disabled for %@", (uint8_t *)&v7, 0x16u);
    }
    BOOL v5 = 0;
  }
  else
  {
    v4 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      BOOL v8 = "+[UAFConfiguration trialFeatureEnabled:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s Trial Feature enabled for %@", (uint8_t *)&v7, 0x16u);
    }
    BOOL v5 = 1;
  }

  return v5;
}

@end