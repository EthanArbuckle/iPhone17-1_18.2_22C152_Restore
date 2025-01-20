@interface VSLocalizedString
+ (id)appendRandomizationKey:(id)a3 withCount:(int)a4;
+ (id)localizedInterstitialStringForKey:(id)a3 language:(id)a4;
+ (id)localizedOOBStringForKey:(id)a3 language:(id)a4;
+ (id)localizedStringForKey:(id)a3 language:(id)a4 table:(id)a5;
+ (id)predefinedStringForKey:(id)a3 language:(id)a4 table:(id)a5;
@end

@implementation VSLocalizedString

+ (id)localizedOOBStringForKey:(id)a3 language:(id)a4
{
  return (id)[a1 predefinedStringForKey:a3 language:a4 table:@"DeviceSetup"];
}

+ (id)localizedInterstitialStringForKey:(id)a3 language:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  if (v6 == @"VOICE_SERVICES_NETWORK_STALL")
  {
    v6 = [a1 appendRandomizationKey:@"VOICE_SERVICES_NETWORK_STALL" withCount:3];
  }
  v8 = [a1 localizedStringForKey:v6 language:v7 table:@"Interstitials"];

  return v8;
}

+ (id)appendRandomizationKey:(id)a3 withCount:(int)a4
{
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"%@_%d", v5, (rand() % a4 + 1)];

  return v6;
}

+ (id)predefinedStringForKey:(id)a3 language:(id)a4 table:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = VSGetLogDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412546;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_20CABC000, v11, OS_LOG_TYPE_INFO, "Searching predefined string for '%@' in '%{public}@'", (uint8_t *)&v23, 0x16u);
  }

  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 pathForResource:v9 ofType:@"strings" inDirectory:v10];

  v14 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v13];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 objectForKeyedSubscript:v8];

    if (v16)
    {
      uint64_t v17 = [v15 objectForKeyedSubscript:v8];
LABEL_13:
      v21 = (__CFString *)v17;
      goto LABEL_14;
    }
  }
  char v18 = [v9 isEqualToString:@"en-US"];
  v19 = VSGetLogDefault();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if ((v18 & 1) == 0)
  {
    if (v20)
    {
      int v23 = 138543618;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_error_impl(&dword_20CABC000, v19, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' predefined string for key '%@', return default en-US string", (uint8_t *)&v23, 0x16u);
    }

    uint64_t v17 = [a1 predefinedStringForKey:v8 language:@"en-US" table:v10];
    goto LABEL_13;
  }
  if (v20)
  {
    int v23 = 138543618;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_error_impl(&dword_20CABC000, v19, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' predefined string for key '%@', return empty string", (uint8_t *)&v23, 0x16u);
  }

  v21 = &stru_26C1B0528;
LABEL_14:

  return v21;
}

+ (id)localizedStringForKey:(id)a3 language:(id)a4 table:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v34 = a5;
  id v9 = VSGetLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = v7;
    __int16 v43 = 2114;
    id v44 = v8;
    _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_INFO, "Localize for '%@' in '%{public}@'", buf, 0x16u);
  }

  id v33 = v7;
  v32 = [v7 stringByAppendingString:@"_MALE"];
  id v10 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/VoiceServices.framework/"];
  v11 = (void *)MEMORY[0x263F086E0];
  v12 = [v10 localizations];
  id v31 = v8;
  id v40 = v8;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
  v14 = [v11 preferredLocalizationsFromArray:v12 forPreferences:v13];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v16) {
    goto LABEL_13;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v36;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v36 != v18) {
        objc_enumerationMutation(v15);
      }
      BOOL v20 = [v10 URLForResource:v34 withExtension:@"strings" subdirectory:0 localization:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      v21 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v20];
      v22 = v21;
      if (v21)
      {
        int v23 = [v21 objectForKeyedSubscript:v33];

        if (v23)
        {
          uint64_t v27 = v33;
          v28 = v33;
        }
        else
        {
          id v24 = [v22 objectForKeyedSubscript:v32];

          if (!v24) {
            goto LABEL_11;
          }
          v28 = v32;
          uint64_t v27 = v33;
        }
        id v26 = [v22 objectForKeyedSubscript:v28];

        __int16 v25 = v15;
        goto LABEL_18;
      }
LABEL_11:
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_13:

  __int16 v25 = VSGetLogDefault();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v31;
    id v42 = v31;
    __int16 v43 = 2112;
    uint64_t v27 = v33;
    id v44 = v33;
    _os_log_error_impl(&dword_20CABC000, v25, OS_LOG_TYPE_ERROR, "Unable to find '%{public}@' localized string for key '%@', return empty string", buf, 0x16u);
    id v26 = &stru_26C1B0528;
  }
  else
  {
    id v26 = &stru_26C1B0528;
    uint64_t v27 = v33;
LABEL_18:
    v29 = v31;
  }

  return v26;
}

@end