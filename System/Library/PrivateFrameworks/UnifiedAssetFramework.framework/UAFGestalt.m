@interface UAFGestalt
+ (BOOL)deviceMatch:(id)a3 onMatch:(id)a4;
+ (BOOL)dictionaryIsValid:(id)a3;
+ (BOOL)isKeySupported:(id)a3 key:(id)a4;
+ (BOOL)predicateMatch:(id)a3;
+ (UAFGestalt)sharedManager;
+ (id)dictionaryForGestalt:(id)a3;
+ (id)urlForGestalt:(id)a3;
- (BOOL)query:(id)a3 forKey:(id)a4;
- (UAFGestalt)init;
- (id)queryAllSupportedKeys:(id)a3;
@end

@implementation UAFGestalt

void __36__UAFGestalt_queryAllSupportedKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"SupportedKeys"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)queryAllSupportedKeys:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  uint64_t v4 = +[UAFGestalt dictionaryForGestalt:v3];
  id v5 = (id)MEMORY[0x263EFFA68];
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__UAFGestalt_queryAllSupportedKeys___block_invoke;
    v9[3] = &unk_264CEBBF0;
    v9[4] = &v10;
    if (!+[UAFGestalt deviceMatch:v4 onMatch:v9])
    {
      v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[UAFGestalt queryAllSupportedKeys:]";
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s No matching configs for %{public}@", buf, 0x16u);
      }

      v7 = (void *)v11[5];
      v11[5] = (uint64_t)v5;
    }
    id v5 = (id)v11[5];
  }

  _Block_object_dispose(&v10, 8);

  return v5;
}

+ (id)dictionaryForGestalt:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[UAFGestalt urlForGestalt:v3];
  if (v4)
  {
    id v15 = 0;
    id v5 = [NSDictionary dictionaryWithContentsOfURL:v4 error:&v15];
    v6 = v15;
    v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      if (+[UAFGestalt dictionaryIsValid:v5])
      {
        id v13 = v5;
LABEL_15:

        goto LABEL_16;
      }
      v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "+[UAFGestalt dictionaryForGestalt:]";
        uint64_t v10 = "%s Dictionary is not valid";
        v11 = v9;
        uint32_t v12 = 12;
        goto LABEL_20;
      }
    }
    else
    {
      v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "+[UAFGestalt dictionaryForGestalt:]";
        __int16 v18 = 2112;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v7;
        uint64_t v10 = "%s Error reading %@: %@";
        v11 = v9;
        uint32_t v12 = 32;
LABEL_20:
        _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
    }

    id v13 = 0;
    goto LABEL_15;
  }
  v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "+[UAFGestalt dictionaryForGestalt:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not find config file for %@", buf, 0x16u);
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

+ (BOOL)dictionaryIsValid:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"FileType"];
    v6 = v5;
    if (v5 && ([v5 isEqualToString:@"GestaltConfiguration"] & 1) != 0)
    {
      v7 = [v4 objectForKeyedSubscript:@"FileVersion"];
      BOOL v8 = v7;
      if (v7 && ([v7 isEqualToString:@"1.0.0"] & 1) != 0)
      {
        BOOL v9 = 1;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        id v13 = "+[UAFGestalt dictionaryIsValid:]";
        __int16 v14 = 2112;
        id v15 = v8;
        __int16 v16 = 2112;
        v17 = @"1.0.0";
        _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Mismatched file version %@ vs %@", (uint8_t *)&v12, 0x20u);
      }
    }
    else
    {
      BOOL v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315650;
        id v13 = "+[UAFGestalt dictionaryIsValid:]";
        __int16 v14 = 2112;
        id v15 = v6;
        __int16 v16 = 2112;
        v17 = @"GestaltConfiguration";
        _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Mismatched file type %@ vs %@", (uint8_t *)&v12, 0x20u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_16;
  }
  v6 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    id v13 = "+[UAFGestalt dictionaryIsValid:]";
    _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s dictionary is null", (uint8_t *)&v12, 0xCu);
  }
  BOOL v9 = 0;
LABEL_17:

  return v9;
}

+ (BOOL)deviceMatch:(id)a3 onMatch:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, id))a4;
  v6 = [a3 objectForKeyedSubscript:@"ValidConfigs"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[UAFGestalt deviceMatch:onMatch:]";
      __int16 v26 = 2112;
      v27 = @"ValidConfigs";
      __int16 v28 = 2112;
      v29 = v6;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Invalid %@ value: %@", buf, 0x20u);
    }
    BOOL v15 = 0;
    goto LABEL_27;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {
    BOOL v15 = 0;
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  uint64_t v18 = v6;
  uint64_t v10 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        __int16 v14 = [v13 objectForKeyedSubscript:@"TargetingType"];
        if ([(__CFString *)v14 isEqualToString:@"GestaltPredicate"])
        {
          if (!+[UAFGestalt predicateMatch:v13])
          {

            continue;
          }
          v5[2](v5, v13);
          BOOL v15 = 1;
          v6 = v18;
        }
        else
        {
          v6 = v18;
          if ([(__CFString *)v14 isEqualToString:@"AllDevices"])
          {
            v5[2](v5, v13);
            BOOL v15 = 1;
          }
          else
          {
            __int16 v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v25 = "+[UAFGestalt deviceMatch:onMatch:]";
              __int16 v26 = 2112;
              v27 = v14;
              _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s Unknown targeting type: %@", buf, 0x16u);
            }

            BOOL v15 = 0;
          }
        }

        goto LABEL_26;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  BOOL v15 = 0;
  v6 = v18;
LABEL_26:

LABEL_27:
  return v15;
}

+ (BOOL)predicateMatch:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"TargetingPredicate"];
  if (v4)
  {
    id v5 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [&unk_26EAA10F8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(&unk_26EAA10F8);
          }
          uint64_t v10 = *(NSObject **)(*((void *)&v21 + 1) + 8 * i);
          v11 = [NSString stringWithFormat:@"'%@'", v10];
          if ([v5 containsString:v11])
          {
            uint64_t v12 = +[UAFCommonUtilities mobileGestaltQuery:v10];
            if (!v12)
            {
              long long v19 = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v26 = "+[UAFGestalt predicateMatch:]";
                __int16 v27 = 2112;
                __int16 v28 = v10;
                _os_log_error_impl(&dword_23797A000, v19, OS_LOG_TYPE_ERROR, "%s No mobile gestalt answer for %@", buf, 0x16u);
              }

              char v18 = 0;
              goto LABEL_21;
            }
            id v13 = (void *)v12;
            __int16 v14 = [NSString stringWithFormat:@"'%@'", v12];
            uint64_t v15 = [v5 stringByReplacingOccurrencesOfString:v11 withString:v14];

            id v5 = v15;
          }
        }
        uint64_t v7 = [&unk_26EAA10F8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    __int16 v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v26 = "+[UAFGestalt predicateMatch:]";
      __int16 v27 = 2114;
      __int16 v28 = v5;
      _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s Evaluating predicate string: '%{public}@'", buf, 0x16u);
    }

    v17 = [MEMORY[0x263F08A98] predicateWithFormat:v5];
    char v18 = [v17 evaluateWithObject:0];
  }
  else
  {
    id v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v26 = "+[UAFGestalt predicateMatch:]";
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s Missing predicate string", buf, 0xCu);
    }
    char v18 = 0;
  }
LABEL_21:

  return v18;
}

+ (id)urlForGestalt:(id)a3
{
  id v3 = NSURL;
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = +[UAFCommonUtilities rootDirectory];
  uint64_t v7 = [v4 stringWithFormat:@"file://%@%@/Gestalt/%@.plist", v6, @"/System/Library/UnifiedAssetFramework", v5];
  uint64_t v8 = [v3 URLWithString:v7];

  uint64_t v9 = NSURL;
  uint64_t v10 = NSString;
  v11 = +[UAFCommonUtilities rootDirectory];
  uint64_t v12 = [v10 stringWithFormat:@"file://%@%@/Gestalt/%@.plist", v11, @"/AppleInternal/Library/UnifiedAssetFramework", v5];

  id v13 = [v9 URLWithString:v12];

  memset(v19, 0, sizeof(v19));
  if (!+[UAFCommonUtilities isInternalInstall]
    || ([v13 path],
        __int16 v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = +[UAFCommonUtilities stat:v14 withBuf:v19 error:0], v14, v16 = v13, v15))
  {
    __int16 v16 = v8;
  }
  id v17 = v16;

  return v17;
}

+ (UAFGestalt)sharedManager
{
  if (_MergedGlobals_12 != -1) {
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_13);
  }
  v2 = (void *)qword_26AF0BA98;

  return (UAFGestalt *)v2;
}

void __27__UAFGestalt_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(UAFGestalt);
  v1 = (void *)qword_26AF0BA98;
  qword_26AF0BA98 = (uint64_t)v0;
}

- (UAFGestalt)init
{
  v6.receiver = self;
  v6.super_class = (Class)UAFGestalt;
  v2 = [(UAFGestalt *)&v6 init];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = v2;
  }

  return v3;
}

+ (BOOL)isKeySupported:(id)a3 key:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 objectForKeyedSubscript:@"SupportedKeys"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 containsObject:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)query:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  char v7 = +[UAFGestalt dictionaryForGestalt:v5];
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __27__UAFGestalt_query_forKey___block_invoke;
    v11[3] = &unk_264CEBBC8;
    id v13 = &v14;
    id v12 = v6;
    if (!+[UAFGestalt deviceMatch:v7 onMatch:v11])
    {
      uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v19 = "-[UAFGestalt query:forKey:]";
        __int16 v20 = 2114;
        id v21 = v5;
        _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s No matching configs for %{public}@", buf, 0x16u);
      }
    }
    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

BOOL __27__UAFGestalt_query_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL result = +[UAFGestalt isKeySupported:a2 key:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end