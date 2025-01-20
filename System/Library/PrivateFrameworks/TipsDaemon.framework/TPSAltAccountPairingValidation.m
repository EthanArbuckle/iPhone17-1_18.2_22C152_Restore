@interface TPSAltAccountPairingValidation
+ (id)deviceSelectorBlockForMatchingType:(int64_t)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAltAccountPairingValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = [(TPSTargetingValidation *)self value];
  unint64_t v6 = 0x1E4FAF000uLL;
  if (v5
    && (v7 = (void *)v5,
        [(TPSTargetingValidation *)self value],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) != 0))
  {
    v10 = [(TPSTargetingValidation *)self value];
    uint64_t v11 = [v10 TPSSafeIntegerForKey:@"matchingType"];

    v12 = [(TPSTargetingValidation *)self value];
    int v13 = [v12 TPSSafeBoolForKey:@"value"];

    v14 = [(id)objc_opt_class() deviceSelectorBlockForMatchingType:v11];
    v15 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v16 = [v15 getAllDevicesWithArchivedAltAccountDevicesMatching:v14];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v30 = v4;
      uint64_t v20 = *(void *)v32;
      uint64_t v21 = *MEMORY[0x1E4F79DA0];
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          v23 = [*(id *)(*((void *)&v31 + 1) + 8 * i) valueForProperty:v21];
          int v24 = [v23 BOOLValue];

          if (v13 == v24)
          {
            uint64_t v25 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      uint64_t v25 = 0;
LABEL_16:
      v4 = v30;
      unint64_t v6 = 0x1E4FAF000;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v26 = [(TPSTargetingValidation *)self value];
      v27 = [(TPSTargetingValidation *)self value];
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      __int16 v37 = 2112;
      id v38 = (id)objc_opt_class();
      id v28 = v38;
      _os_log_impl(&dword_1E4492000, v14, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@.", buf, 0x16u);
    }
    uint64_t v25 = 0;
  }

  v29 = [*(id *)(v6 + 1152) targeting];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    [(TPSDictationLanguageValidation *)self validateWithCompletion:v29];
  }

  v4[2](v4, v25, 0);
}

+ (id)deviceSelectorBlockForMatchingType:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = [MEMORY[0x1E4F79EF0] activeDeviceSelectorBlock];
  }
  else
  {
    if (a3 == 2) {
      [MEMORY[0x1E4F79EF0] pairedDevicesSelectorBlock];
    }
    else {
    v3 = [MEMORY[0x1E4F79EF0] activePairedDeviceSelectorBlock];
    }
  }

  return v3;
}

@end