@interface UAFPlatform
+ (id)configurationManagers:(id)a3;
+ (id)maxVersionFromVersionString:(id)a3;
+ (id)versionComponentFromString:(id)a3;
+ (id)versionComponentsFromString:(id)a3;
+ (int64_t)compareVersion:(id)a3 with:(id)a4;
@end

@implementation UAFPlatform

+ (int64_t)compareVersion:(id)a3 with:(id)a4
{
  id v5 = a4;
  v6 = +[UAFPlatform versionComponentsFromString:a3];
  uint64_t v7 = +[UAFPlatform versionComponentsFromString:v5];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_12;
  }
  if ([v6 count])
  {
    unint64_t v10 = 0;
    int64_t v11 = 1;
    while (v10 < [v8 count])
    {
      v12 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v13 = [v12 integerValue];
      v14 = [v8 objectAtIndexedSubscript:v10];
      uint64_t v15 = [v14 integerValue];

      if (v13 < v15)
      {
        int64_t v11 = -1;
        goto LABEL_23;
      }
      v16 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v17 = [v16 integerValue];
      v18 = [v8 objectAtIndexedSubscript:v10];
      uint64_t v19 = [v18 integerValue];

      if (v17 > v19) {
        goto LABEL_23;
      }
      if (++v10 >= [v6 count]) {
        break;
      }
    }
  }
  uint64_t v20 = [v6 count];
  if (v20 == [v8 count])
  {
LABEL_12:
    int64_t v11 = 0;
  }
  else
  {
    id v21 = v6;
    id v22 = v8;
    unint64_t v23 = [v21 count];
    if (v23 <= [v22 count])
    {
      int64_t v11 = -1;
    }
    else
    {

      id v24 = v21;
      id v21 = v22;
      int64_t v11 = 1;
      id v22 = v24;
    }
    for (unint64_t i = [v21 count]; i < objc_msgSend(v22, "count"); ++i)
    {
      v26 = [v22 objectAtIndexedSubscript:i];
      uint64_t v27 = [v26 integerValue];

      if (v27) {
        goto LABEL_22;
      }
    }
    int64_t v11 = 0;
LABEL_22:
  }
LABEL_23:

  return v11;
}

+ (id)versionComponentsFromString:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"."];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = +[UAFPlatform versionComponentFromString:](UAFPlatform, "versionComponentFromString:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          if (!v12)
          {

            v14 = 0;
            goto LABEL_18;
          }
          uint64_t v13 = (void *)v12;
          if (!v9) {
            id v9 = (id)objc_opt_new();
          }
          [v9 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = 0;
    }

    id v9 = v9;
    v14 = v9;
LABEL_18:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)versionComponentFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    id v5 = [v4 invertedSet];

    if ([v3 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue"));
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)maxVersionFromVersionString:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.9999", a3];
}

+ (id)configurationManagers:(id)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 assetNamed:@"com.apple.siri.uaf.osupdates"];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 location];

    if (v6)
    {
      id v33 = v3;
      uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
      v32 = v5;
      uint64_t v8 = [v5 location];
      uint64_t v9 = *MEMORY[0x263EFF6A8];
      v52[0] = *MEMORY[0x263EFF6A8];
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
      int64_t v11 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:1 errorHandler:0];

      v36 = +[UAFCommonUtilities mobileGestaltQuery:@"ProductVersion"];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v15 = 0;
        v34 = 0;
        uint64_t v16 = *(void *)v41;
        uint64_t v37 = v9;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            long long v18 = v15;
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v12);
            }
            long long v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v38 = 0;
            id v39 = 0;
            int v20 = [v19 getResourceValue:&v39 forKey:v9 error:&v38];
            id v21 = v39;
            id v15 = v38;

            if (v20) {
              BOOL v22 = v15 == 0;
            }
            else {
              BOOL v22 = 0;
            }
            if (v22 && [v21 BOOLValue])
            {
              id v23 = v12;
              id v24 = [v19 lastPathComponent];
              v25 = [v19 lastPathComponent];
              v26 = +[UAFPlatform versionComponentsFromString:v25];

              if (v26)
              {
                if ([a1 compareVersion:v24 with:v36] == -1)
                {
                  v29 = UAFGetLogCategory((void **)&UAFLogContextClient);
                  id v12 = v23;
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v46 = "+[UAFPlatform configurationManagers:]";
                    __int16 v47 = 2114;
                    v48 = v24;
                    __int16 v49 = 2114;
                    v50 = v36;
                    _os_log_impl(&dword_23797A000, v29, OS_LOG_TYPE_INFO, "%s Skipping platform directory: %{public}@ < %{public}@", buf, 0x20u);
                  }
                }
                else
                {
                  uint64_t v27 = [UAFConfigurationManager alloc];
                  v44 = v19;
                  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
                  v29 = [(UAFConfigurationManager *)v27 initWithURLs:v28];

                  id v12 = v23;
                  if (v29)
                  {
                    v30 = v34;
                    if (!v34) {
                      v30 = objc_opt_new();
                    }
                    v34 = v30;
                    [v30 setObject:v29 forKeyedSubscript:v24];
                  }
                }
                uint64_t v9 = v37;
              }
              else
              {
                id v12 = v23;
                uint64_t v9 = v37;
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v51 count:16];
        }
        while (v14);
      }
      else
      {
        id v15 = 0;
        v34 = 0;
      }

      id v6 = v34;
      id v5 = v32;
      id v3 = v33;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end