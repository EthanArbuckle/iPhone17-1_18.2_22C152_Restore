@interface PGSensitiveLocationBlocklistConfiguration
+ (BOOL)dateInterval:(id)a3 intersectsSensitiveDateIntervals:(id)a4;
+ (BOOL)isAssetAtSensitiveLocationAndDate:(id)a3;
+ (BOOL)isSensitiveLocation:(id)a3 duringDateInterval:(id)a4;
+ (id)dateFormatter;
+ (id)obfuscatedBlocklistFromUnobfuscatedBlocklist:(id)a3;
+ (id)resolveConfigurationDictionary:(id)a3;
+ (id)sensitiveLocationBlocklist;
+ (id)sensitiveLocationBlocklistConfigurations;
+ (id)sensitiveLocationBlocklistConfigurationsLocal;
+ (id)sensitiveLocationBlocklistLocal;
+ (id)unobfuscatedBlocklistFromObfuscatedBlocklist:(id)a3;
- (NSArray)sensitiveDateIntervals;
- (PGSensitiveLocationBlocklistConfiguration)initWithConfigurationDictionary:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)radius;
@end

@implementation PGSensitiveLocationBlocklistConfiguration

- (void).cxx_destruct
{
}

- (NSArray)sensitiveDateIntervals
{
  return self->_sensitiveDateIntervals;
}

- (double)radius
{
  return self->_radius;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (PGSensitiveLocationBlocklistConfiguration)initWithConfigurationDictionary:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PGSensitiveLocationBlocklistConfiguration resolveConfigurationDictionary:a3];
  v5 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)PGSensitiveLocationBlocklistConfiguration;
  v7 = [(PGConfiguration *)&v9 initWithSources:v6 version:1.0];

  return v7;
}

+ (id)dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  return v2;
}

+ (id)sensitiveLocationBlocklistConfigurationsLocal
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 sensitiveLocationBlocklistLocal];
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v9 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          v10 = [[PGSensitiveLocationBlocklistConfiguration alloc] initWithConfigurationDictionary:v9];
          if (v10) {
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

+ (id)sensitiveLocationBlocklistLocal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"assets_394/sbl" withExtension:@"plist"];

  id v11 = 0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v11];
  id v5 = v11;
  if (v5)
  {
    uint64_t v6 = +[PGLogging sharedLogging];
    uint64_t v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error loading local file: %@", buf, 0xCu);
    }
  }
  if (![v4 count])
  {
    v8 = +[PGLogging sharedLogging];
    objc_super v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error: Empty local file loaded.", buf, 2u);
    }
  }
  return v4;
}

+ (id)obfuscatedBlocklistFromUnobfuscatedBlocklist:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v39 = +[PGSensitiveLocationBlocklistConfiguration dateFormatter];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = v3;
  uint64_t v32 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v32)
  {
    id v29 = v4;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v4);
        }
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v7 = [v4 objectForKeyedSubscript:v6];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v37 = [v7 objectForKeyedSubscript:@"sensitiveDateIntervalsAsDictionaries"];
        if (v37)
        {
          uint64_t v33 = v6;
          v34 = v8;
          v35 = v7;
          uint64_t v36 = i;
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          obuint64_t j = v37;
          uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v41 != v12) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v16 = [v14 objectForKeyedSubscript:@"startDate"];

                if (v16)
                {
                  uint64_t v17 = [v14 objectForKeyedSubscript:@"startDate"];
                  v18 = +[PGObfuscation obfuscatedStringFromPlaintextDate:v17 usingDateFormatter:v39];
                  [v15 setObject:v18 forKeyedSubscript:@"d"];
                }
                v19 = [v14 objectForKeyedSubscript:@"endDate"];

                if (v19)
                {
                  v20 = [v14 objectForKeyedSubscript:@"endDate"];
                  v21 = +[PGObfuscation obfuscatedStringFromPlaintextDate:v20 usingDateFormatter:v39];
                  [v15 setObject:v21 forKeyedSubscript:@"l"];
                }
                [v9 addObject:v15];
              }
              uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v11);
          }

          id v8 = v34;
          [v34 setObject:v9 forKeyedSubscript:@"e"];

          id v4 = v29;
          uint64_t v7 = v35;
          uint64_t i = v36;
          uint64_t v6 = v33;
        }
        v22 = [v7 objectForKeyedSubscript:@"latitude"];
        if (v22)
        {
          v23 = +[PGObfuscation obfuscatedStringFromPlaintextNumber:v22];
          [v8 setObject:v23 forKeyedSubscript:@"n"];
        }
        v24 = [v7 objectForKeyedSubscript:@"longitude"];
        if (v24)
        {
          v25 = +[PGObfuscation obfuscatedStringFromPlaintextNumber:v24];
          [v8 setObject:v25 forKeyedSubscript:@"c"];
        }
        v26 = [v7 objectForKeyedSubscript:@"radius"];
        if (v26)
        {
          v27 = +[PGObfuscation obfuscatedStringFromPlaintextNumber:v26];
          [v8 setObject:v27 forKeyedSubscript:@"g"];
        }
        [v31 setObject:v8 forKeyedSubscript:v6];
      }
      uint64_t v32 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v32);
  }

  return v31;
}

+ (id)unobfuscatedBlocklistFromObfuscatedBlocklist:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v39 = +[PGSensitiveLocationBlocklistConfiguration dateFormatter];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = v3;
  uint64_t v32 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v32)
  {
    id v29 = v4;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v4);
        }
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v7 = [v4 objectForKeyedSubscript:v6];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v37 = [v7 objectForKeyedSubscript:@"e"];
        if (v37)
        {
          uint64_t v33 = v6;
          v34 = v8;
          v35 = v7;
          uint64_t v36 = i;
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          obuint64_t j = v37;
          uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v41 != v12) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v16 = [v14 objectForKeyedSubscript:@"d"];

                if (v16)
                {
                  uint64_t v17 = [v14 objectForKeyedSubscript:@"d"];
                  v18 = +[PGObfuscation plaintextDateFromObfuscatedString:v17 usingDateFormatter:v39];
                  [v15 setObject:v18 forKeyedSubscript:@"startDate"];
                }
                v19 = [v14 objectForKeyedSubscript:@"l"];

                if (v19)
                {
                  v20 = [v14 objectForKeyedSubscript:@"l"];
                  v21 = +[PGObfuscation plaintextDateFromObfuscatedString:v20 usingDateFormatter:v39];
                  [v15 setObject:v21 forKeyedSubscript:@"endDate"];
                }
                [v9 addObject:v15];
              }
              uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v11);
          }

          id v8 = v34;
          [v34 setObject:v9 forKeyedSubscript:@"sensitiveDateIntervalsAsDictionaries"];

          id v4 = v29;
          uint64_t v7 = v35;
          uint64_t i = v36;
          uint64_t v6 = v33;
        }
        v22 = [v7 objectForKeyedSubscript:@"n"];
        if (v22)
        {
          v23 = +[PGObfuscation plaintextNumberFromObfuscatedString:v22];
          [v8 setObject:v23 forKeyedSubscript:@"latitude"];
        }
        v24 = [v7 objectForKeyedSubscript:@"c"];
        if (v24)
        {
          v25 = +[PGObfuscation plaintextNumberFromObfuscatedString:v24];
          [v8 setObject:v25 forKeyedSubscript:@"longitude"];
        }
        v26 = [v7 objectForKeyedSubscript:@"g"];
        if (v26)
        {
          v27 = +[PGObfuscation plaintextNumberFromObfuscatedString:v26];
          [v8 setObject:v27 forKeyedSubscript:@"radius"];
        }
        [v31 setObject:v8 forKeyedSubscript:v6];
      }
      uint64_t v32 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v32);
  }

  return v31;
}

+ (BOOL)isAssetAtSensitiveLocationAndDate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localCreationDate];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v7 = [v4 localCreationDate];
    id v8 = [v4 localCreationDate];
    id v9 = [v6 initWithStartDate:v7 endDate:v8];

    uint64_t v10 = [v4 location];
    char v11 = [a1 isSensitiveLocation:v10 duringDateInterval:v9];
  }
  else
  {
    uint64_t v12 = +[PGLogging sharedLogging];
    id v9 = [v12 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error: Asset passed in with no local creation date.", v14, 2u);
    }
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)dateInterval:(id)a3 intersectsSensitiveDateIntervals:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "intersectsDateInterval:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)isSensitiveLocation:(id)a3 duringDateInterval:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    [a3 coordinate];
    uint64_t v31 = v7;
    uint64_t v32 = v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = [a1 sensitiveLocationBlocklistConfigurations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v14 latitude];
          CLLocationDegrees v16 = v15;
          [v14 longitude];
          CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
          CLLocationCoordinate2DGetDistanceFrom();
          double v20 = v19;
          v21 = objc_msgSend(v14, "sensitiveDateIntervals", *(void *)&v18.latitude, *(void *)&v18.longitude);
          [v14 radius];
          BOOL v23 = v20 <= v22 && v21 == 0;
          char v24 = v23;
          if (!v23 && v20 <= v22) {
            char v24 = [a1 dateInterval:v6 intersectsSensitiveDateIntervals:v21];
          }

          if (v24)
          {
            BOOL v25 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v25 = 0;
LABEL_21:
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

+ (id)sensitiveLocationBlocklistConfigurations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PGSensitiveLocationBlocklistConfiguration_sensitiveLocationBlocklistConfigurations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sensitiveLocationBlocklistConfigurations_onceToken != -1) {
    dispatch_once(&sensitiveLocationBlocklistConfigurations_onceToken, block);
  }
  id v2 = (void *)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations;
  return v2;
}

void __85__PGSensitiveLocationBlocklistConfiguration_sensitiveLocationBlocklistConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) sensitiveLocationBlocklist];
  if ([v1 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = (void *)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations;
    sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations = (uint64_t)v2;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
          uint64_t v10 = [[PGSensitiveLocationBlocklistConfiguration alloc] initWithConfigurationDictionary:v9];
          if (v10) {
            [(id)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations addObject:v10];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

+ (id)sensitiveLocationBlocklist
{
  id v3 = objc_alloc_init(PGRemoteConfiguration);
  id v4 = [(PGRemoteConfiguration *)v3 dictionaryValueForKey:@"com.apple.photos.memories.sbl" withFallbackValue:MEMORY[0x1E4F1CC08]];
  if (![v4 count])
  {
    uint64_t v5 = +[PGLogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "[PGSenLoc] Couldn't load the senloc, falling back...", v9, 2u);
    }

    uint64_t v7 = [a1 sensitiveLocationBlocklistLocal];

    id v4 = (void *)v7;
  }

  return v4;
}

+ (id)resolveConfigurationDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"e"];
  v35 = +[PGSensitiveLocationBlocklistConfiguration dateFormatter];
  if (v5)
  {
    uint64_t v32 = v4;
    id v33 = v3;
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v31 = v5;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v12 = [v11 objectForKeyedSubscript:@"d"];

          if (v12)
          {
            long long v13 = [v11 objectForKeyedSubscript:@"d"];
            long long v12 = +[PGObfuscation plaintextDateFromObfuscatedString:v13 usingDateFormatter:v35];
          }
          long long v14 = [v11 objectForKeyedSubscript:@"l"];

          if (v14)
          {
            double v15 = [v11 objectForKeyedSubscript:@"l"];
            uint64_t v16 = +[PGObfuscation plaintextDateFromObfuscatedString:v15 usingDateFormatter:v35];

            if (v12 && v16)
            {
              CLLocationDegrees v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v16];
              [v34 addObject:v17];
            }
          }
          else
          {
            uint64_t v16 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v8);
    }

    id v4 = v32;
    [v32 setObject:v34 forKeyedSubscript:@"sensitiveDateIntervals"];

    id v3 = v33;
    uint64_t v5 = v31;
  }
  CLLocationCoordinate2D v18 = [v3 objectForKeyedSubscript:@"n"];
  if (v18)
  {
    double v19 = +[PGObfuscation plaintextNumberFromObfuscatedString:v18];
    [v4 setObject:v19 forKeyedSubscript:@"latitude"];
  }
  double v20 = [v4 objectForKeyedSubscript:@"latitude"];

  if (v20)
  {
    v21 = [v3 objectForKeyedSubscript:@"c"];
    if (v21)
    {
      double v22 = +[PGObfuscation plaintextNumberFromObfuscatedString:v21];
      [v4 setObject:v22 forKeyedSubscript:@"longitude"];
    }
    BOOL v23 = [v4 objectForKeyedSubscript:@"longitude"];

    if (v23)
    {
      char v24 = [v3 objectForKeyedSubscript:@"g"];
      if (v24)
      {
        BOOL v25 = +[PGObfuscation plaintextNumberFromObfuscatedString:v24];
        [v4 setObject:v25 forKeyedSubscript:@"radius"];
      }
      v26 = [v4 objectForKeyedSubscript:@"radius"];
      if (!v26) {
        [v4 setObject:&unk_1F28D5708 forKeyedSubscript:@"radius"];
      }
      id v27 = v4;
    }
    else
    {
      long long v29 = +[PGLogging sharedLogging];
      char v24 = [v29 loggingConnection];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v3;
        _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PGSensitiveLocationBlocklistConfiguration] Error unobfuscating blocklist, couldn't find or unobfuscate required key longitude in entry. Entry is %@", buf, 0xCu);
      }
      id v27 = 0;
    }
  }
  else
  {
    long long v28 = +[PGLogging sharedLogging];
    v21 = [v28 loggingConnection];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v3;
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[PGSensitiveLocationBlocklistConfiguration] Error unobfuscating blocklist, couldn't find or unobfuscate required key latitude in entry. Entry is %@", buf, 0xCu);
    }
    id v27 = 0;
  }

  return v27;
}

@end