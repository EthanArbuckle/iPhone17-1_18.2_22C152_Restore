@interface MorphunAssetsUtilities
+ (id)configFileValueForKey:(id)a3;
+ (id)configurationFromPropertiesFile:(id)a3;
+ (id)embeddedLanguages;
+ (id)embeddedPath;
+ (id)libmorphunVersion;
+ (id)userSiriXLocales;
+ (int)compareVersion:(id)a3;
+ (void)embeddedLanguages;
+ (void)libmorphunVersion;
@end

@implementation MorphunAssetsUtilities

+ (id)embeddedLanguages
{
  MorphunLogInitIfNeeded();
  if (embeddedLanguages_oncePredicate != -1) {
    dispatch_once(&embeddedLanguages_oncePredicate, &__block_literal_global_0);
  }
  if (embeddedLanguages_languages)
  {
    id v2 = (id)embeddedLanguages_languages;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR)) {
      +[MorphunAssetsUtilities embeddedLanguages]();
    }
    id v2 = (id)MEMORY[0x263EFFA68];
  }
  return v2;
}

+ (id)userSiriXLocales
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  v3 = [v2 languageCode];

  v4 = MorphunAssetOSLog;
  if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "+[MorphunAssetsUtilities userSiriXLocales]";
    __int16 v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2142D8000, v4, OS_LOG_TYPE_INFO, "%s AFPreferences returned %@", buf, 0x16u);
  }
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
    v6 = (void *)v5;
    if (v5)
    {
      uint64_t v9 = v5;
      v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)configurationFromPropertiesFile:(id)a3
{
  id v3 = a3;
  v4 = [v3 path];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    __int16 v12 = __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke;
    v13 = &unk_2642017B0;
    id v6 = v4;
    id v14 = v6;
    id v15 = v3;
    if (configurationFromPropertiesFile__oncePredicate != -1) {
      dispatch_once(&configurationFromPropertiesFile__oncePredicate, &v10);
    }
    if (configurationFromPropertiesFile__configurationStore
      && (objc_msgSend((id)configurationFromPropertiesFile__configurationStore, "objectForKeyedSubscript:", v6, v10, v11, v12, v13, v14, v15), v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      v8 = [(id)configurationFromPropertiesFile__configurationStore objectForKeyedSubscript:v6];
    }
    else
    {
      v8 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = (void *)configurationFromPropertiesFile__configurationStore;
  configurationFromPropertiesFile__configurationStore = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = (uint64_t *)(a1 + 32);
  [(id)configurationFromPropertiesFile__configurationStore setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

  id v6 = MorphunAssetOSLog;
  if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v35 = "+[MorphunAssetsUtilities configurationFromPropertiesFile:]_block_invoke";
    __int16 v36 = 2112;
    uint64_t v37 = v7;
    _os_log_impl(&dword_2142D8000, v6, OS_LOG_TYPE_INFO, "%s Reading configuration file %@", buf, 0x16u);
  }
  uint64_t v8 = *v5;
  id v32 = 0;
  uint64_t v9 = [NSString stringWithContentsOfFile:v8 encoding:4 error:&v32];
  id v10 = v32;
  if (v10)
  {
    id v11 = v10;
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR)) {
      __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_2();
    }
  }
  else
  {
    id v31 = 0;
    __int16 v12 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[ \t]*(.*?)[ \t]*[=|:][ \t]*(.*?)[ \t]*$" options:16 error:&v31];
    id v11 = v31;
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR)) {
        __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_1();
      }
    }
    else
    {
      v26 = v12;
      v13 = objc_msgSend(v12, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v19 = [v18 rangeAtIndex:1];
            v21 = objc_msgSend(v9, "substringWithRange:", v19, v20);
            uint64_t v22 = [v18 rangeAtIndex:2];
            v24 = objc_msgSend(v9, "substringWithRange:", v22, v23);
            v25 = [(id)configurationFromPropertiesFile__configurationStore objectForKeyedSubscript:*v5];
            [v25 setObject:v24 forKeyedSubscript:v21];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v15);
      }

      __int16 v12 = v26;
      id v11 = 0;
    }
  }
}

+ (id)configFileValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 embeddedPath];
  id v6 = [v5 stringByAppendingPathComponent:@"config.properties"];

  uint64_t v7 = (void *)[objc_alloc(NSURL) initWithString:v6];
  uint64_t v8 = +[MorphunAssetsUtilities configurationFromPropertiesFile:v7];
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = [v9 objectForKeyedSubscript:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR)) {
      +[MorphunAssetsUtilities configFileValueForKey:]();
    }
    id v10 = 0;
  }

  return v10;
}

void __43__MorphunAssetsUtilities_embeddedLanguages__block_invoke()
{
  v0 = +[MorphunAssetsUtilities configFileValueForKey:@"languages.default"];
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 componentsSeparatedByString:@","];
    id v2 = (void *)embeddedLanguages_languages;
    embeddedLanguages_languages = v1;

    v0 = v3;
  }
}

+ (id)libmorphunVersion
{
  MorphunLogInitIfNeeded();
  if ([(id)libmorphunVersion_version isEqualToString:&stru_26C50E930])
  {
    id v2 = +[MorphunAssetsUtilities configFileValueForKey:@"library.version"];
    if (v2)
    {
      objc_storeStrong((id *)&libmorphunVersion_version, v2);
    }
    else if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR))
    {
      +[MorphunAssetsUtilities libmorphunVersion]();
    }
    id v3 = (id)libmorphunVersion_version;
  }
  else
  {
    id v3 = (id)libmorphunVersion_version;
  }
  return v3;
}

+ (int)compareVersion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentsSeparatedByString:@"."];
  uint64_t v5 = +[MorphunAssetsUtilities libmorphunVersion];
  id v6 = [v5 componentsSeparatedByString:@"."];

  if ((unint64_t)[v4 count] >= 2 && (unint64_t)objc_msgSend(v6, "count") > 1)
  {
    id v10 = [v4 objectAtIndexedSubscript:0];
    int v11 = [v10 intValue];
    __int16 v12 = [v6 objectAtIndexedSubscript:0];
    int v13 = [v12 intValue];

    if (v11 >= v13)
    {
      if (v11 == v13)
      {
        uint64_t v14 = [v4 objectAtIndexedSubscript:1];
        int v15 = [v14 intValue];
        uint64_t v16 = [v6 objectAtIndexedSubscript:1];
        int v17 = [v16 intValue];

        if (v15 < v17) {
          int v8 = -1;
        }
        else {
          int v8 = v15 != v17;
        }
      }
      else
      {
        int v8 = 1;
      }
    }
    else
    {
      int v8 = -1;
    }
  }
  else
  {
    uint64_t v7 = (void *)MorphunAssetOSLog;
    if (os_log_type_enabled((os_log_t)MorphunAssetOSLog, OS_LOG_TYPE_ERROR)) {
      +[MorphunAssetsUtilities compareVersion:]((uint64_t)v3, v7);
    }
    int v8 = 0;
  }

  return v8;
}

+ (id)embeddedPath
{
  return @"/usr/share/morphun";
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s Failed to parse configuration file at %@", v2, v3, v4, v5, 2u);
}

void __58__MorphunAssetsUtilities_configurationFromPropertiesFile___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s Failed to read configuration file at %@", v2, v3, v4, v5, 2u);
}

+ (void)configFileValueForKey:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s Retrieved configuration returned an empty dictionary for %@", v2, v3, v4, v5, 2u);
}

+ (void)embeddedLanguages
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s Configuration parser returned a nil value for key %@", v2, v3, v4, v5, 2u);
}

+ (void)libmorphunVersion
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s Configuration parser returned a nil value for key %@", v2, v3, v4, v5, 2u);
}

+ (void)compareVersion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = +[MorphunAssetsUtilities libmorphunVersion];
  v7[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = a1;
  __int16 v9 = v5;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2142D8000, v3, OS_LOG_TYPE_ERROR, "%s Error parsing version strings:\nInput version: %@\nlibmorphun version:%@", (uint8_t *)v7, 0x20u);
}

@end