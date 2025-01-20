@interface UAFAssetExpansion
+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5;
+ (BOOL)isValidTemplate:(id)a3 requiredUsageTypes:(id)a4 error:(id *)a5;
+ (id)getTemplatePart:(id)a3;
+ (id)specializeTemplate:(id)a3 usages:(id)a4 invalid:(BOOL *)a5 error:(id *)a6;
- (BOOL)isValidUsages:(id)a3;
- (NSArray)requiredUsageTypes;
- (NSDictionary)usageValues;
- (NSString)autoAssetSpecifierTemplate;
- (NSString)trialFactorFallbackTemplate;
- (NSString)trialFactorTemplate;
- (UAFAssetExpansion)initWithDictionary:(id)a3;
- (id)getAutoAssetSpecifier:(id)a3;
- (id)getTrialFactorFallbackName:(id)a3;
- (id)getTrialFactorName:(id)a3;
- (id)specializeTemplate:(id)a3 usages:(id)a4;
- (void)setAutoAssetSpecifierTemplate:(id)a3;
- (void)setRequiredUsageTypes:(id)a3;
- (void)setTrialFactorFallbackTemplate:(id)a3;
- (void)setTrialFactorTemplate:(id)a3;
- (void)setUsageValues:(id)a3;
@end

@implementation UAFAssetExpansion

- (id)getAutoAssetSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(UAFAssetExpansion *)self autoAssetSpecifierTemplate];
  v6 = [(UAFAssetExpansion *)self specializeTemplate:v5 usages:v4];

  return v6;
}

- (id)getTrialFactorName:(id)a3
{
  id v4 = a3;
  v5 = [(UAFAssetExpansion *)self trialFactorTemplate];
  v6 = [(UAFAssetExpansion *)self specializeTemplate:v5 usages:v4];

  return v6;
}

- (id)specializeTemplate:(id)a3 usages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [(UAFAssetExpansion *)self isValidUsages:v7])
  {
    char v12 = 0;
    v8 = +[UAFAssetExpansion specializeTemplate:v6 usages:v7 invalid:&v12 error:0];
    v9 = v8;
    id v10 = 0;
    if (!v12) {
      id v10 = v8;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isValidUsages:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [(UAFAssetExpansion *)self requiredUsageTypes];
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [v4 objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v9)];

      if (!v10) {
        goto LABEL_24;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v4)
  {
    usageValues = self->_usageValues;
    if (usageValues)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v5 = usageValues;
      uint64_t v12 = [(NSDictionary *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v5);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v17 = objc_msgSend(v4, "objectForKeyedSubscript:", v16, (void)v22);
            if (v17)
            {
              v18 = (void *)v17;
              v19 = [(NSDictionary *)self->_usageValues objectForKeyedSubscript:v16];
              int v20 = [v19 containsObject:v18];

              if (!v20)
              {
                LOBYTE(v10) = 0;
                goto LABEL_24;
              }
            }
          }
          uint64_t v13 = [(NSDictionary *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
          LOBYTE(v10) = 1;
          if (v13) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v10) = 1;
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  LOBYTE(v10) = 1;
LABEL_25:

  return (char)v10;
}

- (NSString)trialFactorTemplate
{
  return self->_trialFactorTemplate;
}

- (NSArray)requiredUsageTypes
{
  return self->_requiredUsageTypes;
}

- (NSString)autoAssetSpecifierTemplate
{
  return self->_autoAssetSpecifierTemplate;
}

+ (id)specializeTemplate:(id)a3 usages:(id)a4 invalid:(BOOL *)a5 error:(id *)a6
{
  v42[2] = *MEMORY[0x263EF8340];
  id v9 = a4;
  *a5 = 0;
  id v10 = +[UAFAssetExpansion getTemplatePart:a3];
  if ([v10 count] == 1)
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
  }
  else if ((unint64_t)[v10 count] < 2 {
         || ([v10 objectAtIndexedSubscript:1],
  }
             uint64_t v12 = objc_claimAutoreleasedReturnValue(),
             [v9 objectForKey:v12],
             uint64_t v13 = objc_claimAutoreleasedReturnValue(),
             v13,
             v12,
             v13))
  {
    uint64_t v14 = [v10 objectAtIndexedSubscript:0];
    v15 = [v10 objectAtIndexedSubscript:1];
    uint64_t v16 = [v9 objectForKeyedSubscript:v15];
    uint64_t v17 = [v14 stringByAppendingString:v16];

    if ((unint64_t)[v10 count] > 2)
    {
      v18 = [v10 objectAtIndexedSubscript:2];
      v19 = +[UAFAssetExpansion specializeTemplate:v18 usages:v9 invalid:a5 error:a6];

      if (*a5)
      {
        id v11 = 0;
      }
      else
      {
        id v11 = [v17 stringByAppendingString:v19];
      }
    }
    else
    {
      id v11 = v17;
    }
  }
  else
  {
    if (a6)
    {
      int v20 = (void *)MEMORY[0x263F087E8];
      if (*a6)
      {
        v41[0] = *MEMORY[0x263F08320];
        v21 = NSString;
        long long v22 = [v10 objectAtIndexedSubscript:1];
        long long v23 = [v21 stringWithFormat:@"Templated usage for type \"%@\" is not in provided usages \"%@\"", v22, v9];
        v41[1] = *MEMORY[0x263F08608];
        v42[0] = v23;
        v42[1] = *a6;
        long long v24 = NSDictionary;
        long long v25 = (void **)v42;
        long long v26 = v41;
        uint64_t v27 = 2;
      }
      else
      {
        uint64_t v39 = *MEMORY[0x263F08320];
        long long v29 = NSString;
        long long v22 = [v10 objectAtIndexedSubscript:1];
        long long v23 = [v29 stringWithFormat:@"Templated usage for type \"%@\" is not in provided usages \"%@\"", v22, v9];
        v40 = v23;
        long long v24 = NSDictionary;
        long long v25 = &v40;
        long long v26 = &v39;
        uint64_t v27 = 1;
      }
      v30 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:v27];
      *a6 = [v20 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v30];
    }
    v31 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v10 objectAtIndexedSubscript:1];
      *(_DWORD *)buf = 136315650;
      v34 = "+[UAFAssetExpansion specializeTemplate:usages:invalid:error:]";
      __int16 v35 = 2112;
      v36 = v32;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_23797A000, v31, OS_LOG_TYPE_DEFAULT, "%s Templated usage for type \"%@\" is not in provided usages \"%@\"", buf, 0x20u);
    }
    id v11 = 0;
    *a5 = 1;
  }

  return v11;
}

+ (id)getTemplatePart:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 rangeOfString:@"{"];
  unint64_t v5 = [v3 rangeOfString:@"}"];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = v6;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0x7FFFFFFFFFFFFFFFLL || v5 <= v4)
  {
    [v6 addObject:v3];
    id v12 = v7;
  }
  else
  {
    uint64_t v8 = objc_msgSend(v3, "substringWithRange:", 0, v4);
    [v7 addObject:v8];
    id v9 = objc_msgSend(v3, "substringWithRange:", v4 + 1, v5 - (v4 + 1));
    [v7 addObject:v9];
    unint64_t v10 = v5 + 1;
    if (v10 == [v3 length])
    {
      id v11 = v7;
    }
    else
    {
      uint64_t v13 = objc_msgSend(v3, "substringWithRange:", v10, objc_msgSend(v3, "length") - v10);
      [v7 addObject:v13];
      id v14 = v7;
    }
  }

  return v7;
}

- (UAFAssetExpansion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UAFAssetExpansion;
  unint64_t v5 = [(UAFAssetExpansion *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"RequiredUsageTypes"];
    requiredUsageTypes = v5->_requiredUsageTypes;
    v5->_requiredUsageTypes = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"TrialFactorTemplate"];
    trialFactorTemplate = v5->_trialFactorTemplate;
    v5->_trialFactorTemplate = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"TrialFactorFallbackTemplate"];
    trialFactorFallbackTemplate = v5->_trialFactorFallbackTemplate;
    v5->_trialFactorFallbackTemplate = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"AutoAssetSpecifierTemplate"];
    autoAssetSpecifierTemplate = v5->_autoAssetSpecifierTemplate;
    v5->_autoAssetSpecifierTemplate = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"UsageValues"];
    usageValues = v5->_usageValues;
    v5->_usageValues = (NSDictionary *)v14;

    uint64_t v16 = v5;
  }

  return v5;
}

+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = 0;
  if (+[UAFConfiguration isValidValue:v7 key:@"RequiredUsageTypes" kind:objc_opt_class() required:0 error:a5])
  {
    if (v8)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v10 = [v7 objectForKeyedSubscript:@"RequiredUsageTypes"];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v67 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v51;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v51 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(__CFString **)(*((void *)&v50 + 1) + 8 * i);
            if (([v8 containsObject:v15] & 1) == 0)
            {
              uint64_t v17 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v60 = "+[UAFAssetExpansion isValid:validUsageTypes:error:]";
                __int16 v61 = 2112;
                v62 = @"RequiredUsageTypes";
                __int16 v63 = 2112;
                v64 = v15;
                __int16 v65 = 2112;
                id v66 = v8;
                _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s %@ has value \"%@\" which isn't one of \"%@\"", buf, 0x2Au);
              }

              goto LABEL_17;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v50 objects:v67 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v16 = [v7 objectForKeyedSubscript:@"TrialFactorTemplate"];
    if (v16)
    {
    }
    else
    {
      objc_super v18 = [v7 objectForKeyedSubscript:@"AutoAssetSpecifierTemplate"];

      if (!v18)
      {
        if (a5)
        {
          uint64_t v39 = (void *)MEMORY[0x263F087E8];
          if (*a5)
          {
            v57[0] = *MEMORY[0x263F08320];
            v40 = [NSString stringWithFormat:@"One of keys %@ and %@ must have a value", @"TrialFactorTemplate", @"AutoAssetSpecifierTemplate"];
            v57[1] = *MEMORY[0x263F08608];
            v58[0] = v40;
            v58[1] = *a5;
            v41 = NSDictionary;
            v42 = (void **)v58;
            v43 = v57;
            uint64_t v44 = 2;
          }
          else
          {
            uint64_t v55 = *MEMORY[0x263F08320];
            v40 = [NSString stringWithFormat:@"One of keys %@ and %@ must have a value", @"TrialFactorTemplate", @"AutoAssetSpecifierTemplate"];
            v56 = v40;
            v41 = NSDictionary;
            v42 = &v56;
            v43 = &v55;
            uint64_t v44 = 1;
          }
          v45 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:v44];
          *a5 = [v39 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v45];
        }
        uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v60 = "+[UAFAssetExpansion isValid:validUsageTypes:error:]";
          __int16 v61 = 2112;
          v62 = @"TrialFactorTemplate";
          __int16 v63 = 2112;
          v64 = @"AutoAssetSpecifierTemplate";
          _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s One of keys %@ and %@ must have a value", buf, 0x20u);
        }
LABEL_17:
        BOOL v9 = 0;
LABEL_18:

        goto LABEL_42;
      }
    }
    BOOL v9 = 0;
    if (!+[UAFConfiguration isValidValue:v7 key:@"TrialFactorTemplate" kind:objc_opt_class() required:0 error:a5])goto LABEL_42; {
    v19 = [v7 objectForKeyedSubscript:@"TrialFactorTemplate"];
    }

    if (v19)
    {
      int v20 = [v7 objectForKeyedSubscript:@"TrialFactorTemplate"];
      v21 = [v7 objectForKeyedSubscript:@"RequiredUsageTypes"];
      BOOL v22 = +[UAFAssetExpansion isValidTemplate:v20 requiredUsageTypes:v21 error:a5];

      if (!v22) {
        goto LABEL_41;
      }
    }
    BOOL v9 = 0;
    if (!+[UAFConfiguration isValidValue:v7 key:@"TrialFactorFallbackTemplate" kind:objc_opt_class() required:0 error:a5])goto LABEL_42; {
    uint64_t v23 = [v7 objectForKeyedSubscript:@"TrialFactorFallbackTemplate"];
    }
    if (v23)
    {
      long long v24 = (void *)v23;
      long long v25 = [v7 objectForKeyedSubscript:@"TrialFactorFallbackTemplate"];
      long long v26 = [v7 objectForKeyedSubscript:@"RequiredUsageTypes"];
      BOOL v27 = +[UAFAssetExpansion isValidTemplate:v25 requiredUsageTypes:v26 error:a5];

      if (!v27) {
        goto LABEL_41;
      }
    }
    BOOL v9 = 0;
    if (!+[UAFConfiguration isValidValue:v7 key:@"AutoAssetSpecifierTemplate" kind:objc_opt_class() required:0 error:a5])goto LABEL_42; {
    long long v28 = [v7 objectForKeyedSubscript:@"AutoAssetSpecifierTemplate"];
    }

    if (v28)
    {
      long long v29 = [v7 objectForKeyedSubscript:@"AutoAssetSpecifierTemplate"];
      v30 = [v7 objectForKeyedSubscript:@"RequiredUsageTypes"];
      BOOL v31 = +[UAFAssetExpansion isValidTemplate:v29 requiredUsageTypes:v30 error:a5];

      if (!v31)
      {
LABEL_41:
        BOOL v9 = 0;
        goto LABEL_42;
      }
    }
    BOOL v9 = 0;
    if (!+[UAFConfiguration isValidValue:v7 key:@"UsageValues" kind:objc_opt_class() required:0 error:a5])goto LABEL_42; {
    [v7 objectForKeyedSubscript:@"UsageValues"];
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v10);
          }
          uint64_t v36 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          __int16 v37 = [v10 objectForKeyedSubscript:v36];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v8 && ![v8 containsObject:v36])
          {

            BOOL v9 = 0;
            goto LABEL_52;
          }
        }
        uint64_t v33 = [v10 countByEnumeratingWithState:&v46 objects:v54 count:16];
        BOOL v9 = 1;
        if (v33) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
LABEL_52:

    goto LABEL_18;
  }
LABEL_42:

  return v9;
}

+ (BOOL)isValidTemplate:(id)a3 requiredUsageTypes:(id)a4 error:(id *)a5
{
  v35[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = +[UAFAssetExpansion getTemplatePart:a3];
  if ((unint64_t)[v8 count] < 2
    || ([v8 objectAtIndexedSubscript:1],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v7 containsObject:v9],
        v9,
        (v10 & 1) != 0))
  {
    if ((unint64_t)[v8 count] >= 3)
    {
      uint64_t v12 = [v8 objectAtIndexedSubscript:2];
      BOOL v11 = +[UAFAssetExpansion isValidTemplate:v12 requiredUsageTypes:v7 error:a5];
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    if (a5)
    {
      uint64_t v13 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v34[0] = *MEMORY[0x263F08320];
        uint64_t v14 = NSString;
        v15 = [v8 objectAtIndexedSubscript:1];
        uint64_t v16 = [v14 stringWithFormat:@"Templated usage type \"%@\" is not in required usage types %@", v15, v7];
        v34[1] = *MEMORY[0x263F08608];
        v35[0] = v16;
        v35[1] = *a5;
        uint64_t v17 = NSDictionary;
        objc_super v18 = (void **)v35;
        v19 = v34;
        uint64_t v20 = 2;
      }
      else
      {
        uint64_t v32 = *MEMORY[0x263F08320];
        v21 = NSString;
        v15 = [v8 objectAtIndexedSubscript:1];
        uint64_t v16 = [v21 stringWithFormat:@"Templated usage type \"%@\" is not in required usage types %@", v15, v7];
        uint64_t v33 = v16;
        uint64_t v17 = NSDictionary;
        objc_super v18 = &v33;
        v19 = &v32;
        uint64_t v20 = 1;
      }
      BOOL v22 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
      *a5 = [v13 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v22];
    }
    uint64_t v23 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v24 = [v8 objectAtIndexedSubscript:1];
      *(_DWORD *)buf = 136315650;
      BOOL v27 = "+[UAFAssetExpansion isValidTemplate:requiredUsageTypes:error:]";
      __int16 v28 = 2112;
      long long v29 = v24;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s Templated usage type \"%@\" is not in required usage types %@", buf, 0x20u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)getTrialFactorFallbackName:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(UAFAssetExpansion *)self trialFactorFallbackTemplate];

  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(UAFAssetExpansion *)self requiredUsageTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = [v4 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];

          if (!v11)
          {

            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    char v16 = 0;
    uint64_t v12 = [(UAFAssetExpansion *)self trialFactorFallbackTemplate];
    uint64_t v13 = +[UAFAssetExpansion specializeTemplate:v12 usages:v4 invalid:&v16 error:0];

    id v14 = 0;
    if (!v16) {
      id v14 = v13;
    }
  }
  else
  {
LABEL_14:
    id v14 = 0;
  }

  return v14;
}

- (void)setRequiredUsageTypes:(id)a3
{
}

- (void)setTrialFactorTemplate:(id)a3
{
}

- (NSString)trialFactorFallbackTemplate
{
  return self->_trialFactorFallbackTemplate;
}

- (void)setTrialFactorFallbackTemplate:(id)a3
{
}

- (void)setAutoAssetSpecifierTemplate:(id)a3
{
}

- (NSDictionary)usageValues
{
  return self->_usageValues;
}

- (void)setUsageValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageValues, 0);
  objc_storeStrong((id *)&self->_autoAssetSpecifierTemplate, 0);
  objc_storeStrong((id *)&self->_trialFactorFallbackTemplate, 0);
  objc_storeStrong((id *)&self->_trialFactorTemplate, 0);

  objc_storeStrong((id *)&self->_requiredUsageTypes, 0);
}

@end