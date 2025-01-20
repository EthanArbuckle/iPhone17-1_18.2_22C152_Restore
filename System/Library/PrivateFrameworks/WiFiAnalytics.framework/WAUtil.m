@interface WAUtil
+ (BOOL)canPerformActionWithSamplingPercentage:(unint64_t)a3;
+ (BOOL)isAnalyticsProcessorAllowed;
+ (BOOL)isAnyWiFiAppInstalled;
+ (BOOL)isInternalInstall;
+ (BOOL)isKeyBagUnlocked;
+ (BOOL)isMacAddress:(id)a3;
+ (BOOL)isPreinstalledWiFiAppVisible;
+ (BOOL)isWiFiAppInstalled;
+ (BOOL)isWiFiFragmentSamplingEnabled;
+ (BOOL)isWildcardMacAddress:(id)a3;
+ (BOOL)isWritingWAMessageToJsonAllowed;
+ (BOOL)shouldEnableXPCStore;
+ (BOOL)shouldProcessAnalyticsImmediately;
+ (BOOL)storeToken:(id)a3 withIdentifier:(id)a4;
+ (id)_generateInvocationForMethod:(void *)a3;
+ (id)_getBaseTokenStorageKeychainQueryWithIdentifer:(id)a3;
+ (id)deviceName;
+ (id)getCopyOfMessage:(id)a3 withNumericalValuesSubstractedByValuesInMessage:(id)a4;
+ (id)getMessageInstanceForKey:(id)a3 andGroupType:(int64_t)a4;
+ (id)getTokenForIdentifier:(id)a3;
+ (id)getValueForEntitlementForCurrentProcess:(id)a3;
+ (id)groupTypeToString:(int64_t)a3;
+ (id)resourcePath;
+ (id)rotateUUIDsForMessage:(id)a3;
+ (id)trimTokenForLogging:(id)a3;
+ (id)wifianalyticsTmpDirectory;
+ (unint64_t)getAWDTimestamp;
+ (void)addDeltaNSNumberForTelemetryKey:(id)a3 dictKey:(id)a4 dictModule:(id)a5 telDict:(id)a6 recentDict:(id)a7 oldDict:(id)a8;
+ (void)getLazyNSNumberPreference:(id)a3 domain:(id)a4 exists:(id)a5;
+ (void)getLazyNSStringPreference:(id)a3 domain:(id)a4 exists:(id)a5;
+ (void)incrementValueForKey:(id)a3 inMutableDict:(id)a4 onQueue:(id)a5;
+ (void)initialize;
+ (void)logNestedDictionary:(id)a3 indent:(int)a4 prefix:(id)a5;
+ (void)sumNSNumberForKey:(id)a3 dstDict:(id)a4 otherDict:(id)a5;
@end

@implementation WAUtil

+ (void)incrementValueForKey:(id)a3 inMutableDict:(id)a4 onQueue:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9) {
    dispatch_assert_queue_V2(v9);
  }
  if (!v8)
  {
    v14 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v18 = 136446722;
    v19 = "+[WAUtil incrementValueForKey:inMutableDict:onQueue:]";
    __int16 v20 = 1024;
    int v21 = 412;
    __int16 v22 = 2112;
    id v23 = v7;
    v15 = "%{public}s::%d:Attempting to adjust nil dictionary with key %@";
    v16 = v14;
    uint32_t v17 = 28;
LABEL_11:
    _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, v17);
    goto LABEL_12;
  }
  if (!v7)
  {
    v14 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v18 = 136446466;
    v19 = "+[WAUtil incrementValueForKey:inMutableDict:onQueue:]";
    __int16 v20 = 1024;
    int v21 = 417;
    v15 = "%{public}s::%d:Attempting to adjust nil key in dictionary";
    v16 = v14;
    uint32_t v17 = 18;
    goto LABEL_11;
  }
  v11 = [v8 objectForKeyedSubscript:v7];

  if (!v11)
  {
    [v8 setObject:&unk_26CE65E00 forKey:v7];
    goto LABEL_13;
  }
  v12 = NSNumber;
  v13 = [v8 objectForKeyedSubscript:v7];
  v14 = objc_msgSend(v12, "numberWithUnsignedLong:", objc_msgSend(v13, "unsignedIntegerValue") + 1);

  [v8 removeObjectForKey:v7];
  [v8 setObject:v14 forKey:v7];
LABEL_12:

LABEL_13:
}

+ (void)initialize
{
  _isInternalInstall = MGGetBoolAnswer();
  id v2 = (id)MGGetStringAnswer();
  [v2 isEqualToString:@"Beta"];
}

+ (BOOL)isInternalInstall
{
  return _isInternalInstall;
}

+ (id)deviceName
{
  id v2 = [MEMORY[0x263F088B8] currentHost];
  v3 = [v2 name];

  return v3;
}

+ (BOOL)isKeyBagUnlocked
{
  v17[1] = *MEMORY[0x263EF8340];
  if (MEMORY[0x263F55A20])
  {
    v16 = @"ExtendedDeviceLockState";
    v17[0] = MEMORY[0x263EFFA88];
    id v2 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    unsigned int v3 = MKBGetDeviceLockState();
    unsigned int v4 = (v3 < 8) & (0x89u >> v3);
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      int v8 = 136446978;
      v9 = "+[WAUtil isKeyBagUnlocked]";
      int v11 = 77;
      __int16 v10 = 1024;
      if (v4) {
        v6 = "YES";
      }
      __int16 v12 = 1024;
      unsigned int v13 = v3;
      __int16 v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:KeyBag ret:%d Unlocked: %s", (uint8_t *)&v8, 0x22u);
    }
  }
  else
  {
    id v2 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      v9 = "+[WAUtil isKeyBagUnlocked]";
      __int16 v10 = 1024;
      int v11 = 79;
      _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:MKBGetDeviceLockState not available. Assume unlocked.", (uint8_t *)&v8, 0x12u);
    }
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (BOOL)storeToken:(id)a3 withIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFDictionaryRef v6 = +[WAUtil _getBaseTokenStorageKeychainQueryWithIdentifer:a4];
  CFDictionaryRef v7 = v6;
  BOOL v8 = v6 == 0;
  if (!v6)
  {
    __int16 v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446466;
      v19 = "+[WAUtil storeToken:withIdentifier:]";
      __int16 v20 = 1024;
      int v21 = 90;
      unsigned int v13 = "%{public}s::%d:Failed to get base keychain query for write op";
      __int16 v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 18;
LABEL_9:
      _os_log_impl(&dword_21D96D000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
LABEL_10:

    goto LABEL_4;
  }
  SecItemDelete(v6);
  v9 = [v5 dataUsingEncoding:4];
  [(__CFDictionary *)v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F175A8]];

  [(__CFDictionary *)v7 setObject:*MEMORY[0x263F16EA8] forKeyedSubscript:*MEMORY[0x263F16E90]];
  OSStatus v10 = SecItemAdd(v7, 0);
  if (v10)
  {
    OSStatus v17 = v10;
    __int16 v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136446722;
      v19 = "+[WAUtil storeToken:withIdentifier:]";
      __int16 v20 = 1024;
      int v21 = 98;
      __int16 v22 = 1024;
      OSStatus v23 = v17;
      unsigned int v13 = "%{public}s::%d:Error back from SecItemUpdate()/SecItemAdd(): %d";
      __int16 v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
      uint32_t v16 = 24;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v8 = 1;
LABEL_4:

  return v8;
}

+ (id)getTokenForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  unsigned int v3 = +[WAUtil _getBaseTokenStorageKeychainQueryWithIdentifer:a3];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F17520]];
  if (v3)
  {
    OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
    if (v4)
    {
      OSStatus v12 = v4;
      CFDictionaryRef v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        uint32_t v16 = "+[WAUtil getTokenForIdentifier:]";
        __int16 v17 = 1024;
        int v18 = 115;
        __int16 v19 = 1024;
        OSStatus v20 = v12;
        v9 = "%{public}s::%d:Error back from SecItemCopyMatching(): %d";
        OSStatus v10 = v6;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        uint32_t v13 = 24;
LABEL_15:
        _os_log_impl(&dword_21D96D000, v10, v11, v9, buf, v13);
      }
    }
    else
    {
      if (result)
      {
        id v5 = [NSString alloc];
        CFDictionaryRef v6 = result;
        CFDictionaryRef v7 = (void *)[v5 initWithData:result encoding:4];
        goto LABEL_5;
      }
      CFDictionaryRef v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        uint32_t v16 = "+[WAUtil getTokenForIdentifier:]";
        __int16 v17 = 1024;
        int v18 = 116;
        v9 = "%{public}s::%d:Keychain didn't return any key data";
        OSStatus v10 = v6;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        goto LABEL_14;
      }
    }
  }
  else
  {
    CFDictionaryRef v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint32_t v16 = "+[WAUtil getTokenForIdentifier:]";
      __int16 v17 = 1024;
      int v18 = 112;
      v9 = "%{public}s::%d:Failed to get base keychain query for read op";
      OSStatus v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_14:
      uint32_t v13 = 18;
      goto LABEL_15;
    }
  }
  CFDictionaryRef v7 = 0;
LABEL_5:

  return v7;
}

+ (id)_getBaseTokenStorageKeychainQueryWithIdentifer:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  unsigned int v3 = [NSString stringWithFormat:@"com.apple.wifi.analytics.tokenStore.%@", a3, *MEMORY[0x263F16ED8]];
  uint64_t v4 = *MEMORY[0x263F17090];
  v11[0] = v3;
  v11[1] = @"WiFiAnalytics";
  uint64_t v5 = *MEMORY[0x263F16E80];
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = *MEMORY[0x263F171B8];
  uint64_t v6 = *MEMORY[0x263F171C8];
  v11[2] = @"wifianalyticsd";
  v11[3] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  BOOL v8 = (void *)[v7 mutableCopy];

  return v8;
}

+ (id)getMessageInstanceForKey:(id)a3 andGroupType:(int64_t)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFDictionaryRef v7 = [a1 resourcePath];
  BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"/%ld/", a4);
  v9 = [v7 stringByAppendingPathComponent:v8];

  if (!v9)
  {
    v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      __int16 v43 = 1024;
      int v44 = 137;
      v31 = "%{public}s::%d:Couldn't determine path for group";
      v32 = v30;
      uint32_t v33 = 18;
LABEL_14:
      _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    }
LABEL_15:
    OSStatus v23 = 0;
    id v26 = 0;
LABEL_16:

    v25 = 0;
    goto LABEL_9;
  }
  id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
  os_log_type_t v11 = [NSString stringWithFormat:@"%@/%@.wam", v9, v6];
  OSStatus v12 = (void *)[v10 initWithContentsOfFile:v11 options:8 error:0];

  if (!v12)
  {
    v30 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      __int16 v43 = 1024;
      int v44 = 139;
      __int16 v45 = 2112;
      id v46 = v6;
      v31 = "%{public}s::%d:Couldn't find obscured data for key: %@";
      v32 = v30;
      uint32_t v33 = 28;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v39 = v9;
  id v36 = v12;
  uint64_t v13 = MEMORY[0x223C0F2E0]();
  v37 = (void *)MEMORY[0x263F08928];
  context = (void *)v13;
  __int16 v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  id v16 = v6;
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  OSStatus v23 = v36;
  uint64_t v34 = v17;
  id v6 = v16;
  uint64_t v24 = objc_msgSend(v14, "setWithObjects:", v15, v34, v18, v19, v20, v21, v22, v35, objc_opt_class(), 0);
  id v40 = 0;
  v25 = [v37 unarchivedObjectOfClasses:v24 fromData:v36 error:&v40];
  id v26 = v40;

  if (v26)
  {
    v27 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      __int16 v43 = 1024;
      int v44 = 145;
      __int16 v45 = 2112;
      id v46 = v6;
      __int16 v47 = 2112;
      id v48 = v26;
      _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive a WAMessageAWD instance with key of %@. Error: %@", buf, 0x26u);
    }
  }
  if (!v25)
  {
    v30 = WALogCategoryDefaultHandle();
    v9 = v39;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "+[WAUtil getMessageInstanceForKey:andGroupType:]";
      __int16 v43 = 1024;
      int v44 = 147;
      _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive model data.", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v9 = v39;
LABEL_9:
  id v28 = v25;

  return v28;
}

+ (id)rotateUUIDsForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mutableFields];
  id v6 = [v5 allValues];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v4 mutableFields];
      id v10 = [v9 allValues];
      os_log_type_t v11 = [v10 objectAtIndexedSubscript:v8];

      if ([v11 type] == 10)
      {
        if ([v11 isRepeatable])
        {
          OSStatus v12 = [v11 repeatableValues];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            unint64_t v14 = 0;
            do
            {
              uint64_t v15 = [v11 repeatableValues];
              id v16 = [v15 objectAtIndexedSubscript:v14];

              id v17 = (id)[a1 rotateUUIDsForMessage:v16];
              ++v14;
              uint64_t v18 = [v11 repeatableValues];
              unint64_t v19 = [v18 count];
            }
            while (v14 < v19);
          }
        }
        else
        {
          uint64_t v20 = [v11 subMessageValue];
          id v21 = (id)[a1 rotateUUIDsForMessage:v20];
        }
      }

      ++v8;
      uint64_t v22 = [v4 mutableFields];
      OSStatus v23 = [v22 allValues];
      unint64_t v24 = [v23 count];
    }
    while (v8 < v24);
  }
  v25 = [MEMORY[0x263F08C38] UUID];
  id v26 = [v25 UUIDString];
  [v4 setUuid:v26];

  return v4;
}

+ (id)groupTypeToString:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 2) < 4) {
    return off_264467128[a3 - 2];
  }
  uint64_t v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136446722;
    uint64_t v7 = "+[WAUtil groupTypeToString:]";
    __int16 v8 = 1024;
    int v9 = 192;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled group type: %lu", (uint8_t *)&v6, 0x1Cu);
  }

  return 0;
}

+ (id)getCopyOfMessage:(id)a3 withNumericalValuesSubstractedByValuesInMessage:(id)a4
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 key];
  v140 = v6;
  __int16 v8 = [v6 key];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    __int16 v10 = (void *)[v5 copy];
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    int64_t v11 = [v5 mutableFields];
    uint64_t v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v145 objects:v149 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v139 = v5;
      uint64_t v15 = *(void *)v146;
      unint64_t v16 = 0x264465000uLL;
      id v17 = v140;
      v143 = v12;
      uint64_t v141 = *(void *)v146;
      do
      {
        uint64_t v18 = 0;
        uint64_t v144 = v14;
        do
        {
          if (*(void *)v146 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v19 = *(void **)(*((void *)&v145 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "isNumerical", v139) & 1) != 0 || objc_msgSend(v19, "type") == 10)
          {
            uint64_t v20 = [v19 key];
            id v21 = [v17 fieldForKey:v20];

            switch([v19 type])
            {
              case 1:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  [v19 doubleValue];
                  double v119 = v118;
                  [v21 doubleValue];
                  [v117 setDoubleValue:v119 - v120];
                  goto LABEL_72;
                }
                uint64_t v22 = [v19 repeatableValues];
                uint64_t v23 = [v22 count];

                if (!v23) {
                  goto LABEL_58;
                }
                unint64_t v24 = 0;
                do
                {
                  v25 = [v19 repeatableValues];
                  id v26 = [v25 objectAtIndex:v24];

                  v27 = [v21 repeatableValues];
                  id v28 = [v27 objectAtIndex:v24];

                  v29 = [v19 key];
                  v30 = [v10 fieldForKey:v29];
                  int v31 = [v28 BOOLValue];
                  [v26 doubleValue];
                  double v33 = v32;
                  if (v31)
                  {
                    [v28 doubleValue];
                    double v33 = v33 - v34;
                  }
                  [v30 addRepeatableDoubleValue:v33];

                  ++v24;
                  uint64_t v35 = [v19 repeatableValues];
                  unint64_t v36 = [v35 count];
                }
                while (v24 < v36);
                goto LABEL_23;
              case 2:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  [v19 floatValue];
                  float v122 = v121;
                  [v21 floatValue];
                  *(float *)&double v124 = v122 - v123;
                  [v117 setFloatValue:v124];
                  goto LABEL_72;
                }
                v37 = [v19 repeatableValues];
                uint64_t v38 = [v37 count];

                if (v38)
                {
                  unint64_t v39 = 0;
                  do
                  {
                    id v40 = [v19 repeatableValues];
                    v41 = [v40 objectAtIndex:v39];

                    v42 = [v21 repeatableValues];
                    __int16 v43 = [v42 objectAtIndex:v39];

                    int v44 = [v19 key];
                    __int16 v45 = [v10 fieldForKey:v44];
                    int v46 = [v43 BOOLValue];
                    [v41 floatValue];
                    float v48 = *(float *)&v47;
                    if (v46)
                    {
                      [v43 floatValue];
                      float v48 = v48 - *(float *)&v47;
                    }
                    *(float *)&double v47 = v48;
                    [v45 addRepeatableFloatValue:v47];

                    ++v39;
                    uint64_t v49 = [v19 repeatableValues];
                    unint64_t v50 = [v49 count];
                  }
                  while (v39 < v50);
LABEL_23:
                  uint64_t v12 = v143;
                  uint64_t v14 = v144;
                  id v17 = v140;
                  uint64_t v15 = v141;
                }
                goto LABEL_58;
              case 3:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  objc_msgSend(v117, "setInt32Value:", objc_msgSend(v19, "int32Value") - objc_msgSend(v21, "int32Value"));
                  goto LABEL_72;
                }
                v64 = [v19 repeatableValues];
                uint64_t v65 = [v64 count];

                if (!v65) {
                  goto LABEL_58;
                }
                uint64_t v142 = v18;
                unint64_t v66 = 0;
                do
                {
                  v67 = [v19 repeatableValues];
                  v68 = [v67 objectAtIndex:v66];

                  v69 = [v21 repeatableValues];
                  v70 = [v69 objectAtIndex:v66];

                  v71 = [v19 key];
                  v72 = [v10 fieldForKey:v71];
                  int v73 = [v70 BOOLValue];
                  uint64_t v74 = [v68 intValue];
                  if (v73) {
                    uint64_t v74 = v74 - [v70 intValue];
                  }
                  [v72 addRepeatableInt32Value:v74];

                  ++v66;
                  v75 = [v19 repeatableValues];
                  unint64_t v76 = [v75 count];
                }
                while (v66 < v76);
                goto LABEL_51;
              case 4:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  objc_msgSend(v117, "setInt64Value:", objc_msgSend(v19, "int64Value") - objc_msgSend(v21, "int64Value"));
                  goto LABEL_72;
                }
                v77 = [v19 repeatableValues];
                uint64_t v78 = [v77 count];

                if (!v78) {
                  goto LABEL_58;
                }
                uint64_t v142 = v18;
                unint64_t v79 = 0;
                do
                {
                  v80 = [v19 repeatableValues];
                  v81 = [v80 objectAtIndex:v79];

                  v82 = [v21 repeatableValues];
                  v83 = [v82 objectAtIndex:v79];

                  v84 = [v19 key];
                  v85 = [v10 fieldForKey:v84];
                  int v86 = [v83 BOOLValue];
                  uint64_t v87 = [v81 longLongValue];
                  if (v86) {
                    v87 -= [v83 longLongValue];
                  }
                  [v85 addRepeatableInt64Value:v87];

                  ++v79;
                  v88 = [v19 repeatableValues];
                  unint64_t v89 = [v88 count];
                }
                while (v79 < v89);
                goto LABEL_51;
              case 5:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  unsigned int v127 = [v21 uint32Value];
                  if (v127 <= [v19 uint32Value])
                  {
                    int v134 = [v19 uint32Value];
                    uint64_t v128 = v134 - [v21 uint32Value];
                  }
                  else
                  {
                    uint64_t v128 = 0;
                  }
                  [v117 setUint32Value:v128];
                  goto LABEL_72;
                }
                v90 = [v19 repeatableValues];
                uint64_t v91 = [v90 count];

                if (!v91) {
                  goto LABEL_58;
                }
                uint64_t v142 = v18;
                unint64_t v92 = 0;
                do
                {
                  v93 = [v19 repeatableValues];
                  v94 = [v93 objectAtIndex:v92];

                  v95 = [v21 repeatableValues];
                  v96 = [v95 objectAtIndex:v92];

                  v97 = [v19 key];
                  v98 = [v10 fieldForKey:v97];
                  int v99 = [v96 BOOLValue];
                  uint64_t v100 = [v94 unsignedIntValue];
                  if (v99) {
                    uint64_t v100 = v100 - [v96 unsignedIntValue];
                  }
                  [v98 addRepeatableUInt32Value:v100];

                  ++v92;
                  v101 = [v19 repeatableValues];
                  unint64_t v102 = [v101 count];
                }
                while (v92 < v102);
                goto LABEL_51;
              case 6:
                if (![v19 isRepeatable])
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  unint64_t v125 = [v21 uint64Value];
                  if (v125 <= [v19 uint64Value])
                  {
                    uint64_t v133 = [v19 uint64Value];
                    uint64_t v126 = v133 - [v21 uint64Value];
                  }
                  else
                  {
                    uint64_t v126 = 0;
                  }
                  [v117 setUint64Value:v126];
                  goto LABEL_72;
                }
                v51 = [v19 repeatableValues];
                uint64_t v52 = [v51 count];

                if (!v52) {
                  goto LABEL_58;
                }
                uint64_t v142 = v18;
                unint64_t v53 = 0;
                do
                {
                  v54 = [v19 repeatableValues];
                  v55 = [v54 objectAtIndex:v53];

                  v56 = [v21 repeatableValues];
                  v57 = [v56 objectAtIndex:v53];

                  v58 = [v19 key];
                  v59 = [v10 fieldForKey:v58];
                  int v60 = [v57 BOOLValue];
                  uint64_t v61 = [v55 unsignedLongLongValue];
                  if (v60) {
                    v61 -= [v57 unsignedLongLongValue];
                  }
                  [v59 addRepeatableUInt64Value:v61];

                  ++v53;
                  v62 = [v19 repeatableValues];
                  unint64_t v63 = [v62 count];
                }
                while (v53 < v63);
LABEL_51:
                id v17 = v140;
                uint64_t v15 = v141;
                uint64_t v12 = v143;
                uint64_t v14 = v144;
                unint64_t v16 = 0x264465000;
                goto LABEL_57;
              case 10:
                if ([v19 isRepeatable])
                {
                  v103 = [v19 repeatableValues];
                  uint64_t v104 = [v103 count];

                  if (v104)
                  {
                    uint64_t v142 = v18;
                    unint64_t v105 = 0;
                    do
                    {
                      v106 = [v19 repeatableValues];
                      v107 = [v106 objectAtIndex:v105];

                      v108 = [v21 repeatableValues];
                      v109 = [v108 objectAtIndex:v105];

                      v110 = [v19 key];
                      v111 = [v10 fieldForKey:v110];
                      v112 = +[WAUtil getCopyOfMessage:v107 withNumericalValuesSubstractedByValuesInMessage:v109];
                      [v111 addRepeatableSubMessageValue:v112];

                      ++v105;
                      v113 = [v19 repeatableValues];
                      unint64_t v114 = [v113 count];
                    }
                    while (v105 < v114);
                    id v17 = v140;
                    uint64_t v15 = v141;
                    unint64_t v16 = 0x264465000uLL;
                    uint64_t v12 = v143;
                    uint64_t v14 = v144;
LABEL_57:
                    uint64_t v18 = v142;
                  }
                  else
                  {
LABEL_58:
                    unint64_t v16 = 0x264465000;
                  }
                }
                else
                {
                  v115 = v17;
                  v116 = [v19 key];
                  v117 = [v10 fieldForKey:v116];
                  v129 = *(void **)(v16 + 3192);
                  v130 = [v19 subMessageValue];
                  v131 = [v21 subMessageValue];
                  v132 = [v129 getCopyOfMessage:v130 withNumericalValuesSubstractedByValuesInMessage:v131];
                  [v117 setSubMessageValue:v132];

                  uint64_t v15 = v141;
                  unint64_t v16 = 0x264465000;
LABEL_72:

                  id v17 = v115;
                  uint64_t v12 = v143;
                  uint64_t v14 = v144;
                }
                break;
              default:
                break;
            }
          }
          else
          {
            id v21 = 0;
          }

          ++v18;
        }
        while (v18 != v14);
        uint64_t v135 = [v12 countByEnumeratingWithState:&v145 objects:v149 count:16];
        uint64_t v14 = v135;
      }
      while (v135);
      id v5 = v139;
    }
  }
  else
  {
    uint64_t v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v137 = [v5 key];
      v138 = [v140 key];
      *(_DWORD *)buf = 136446978;
      v151 = "+[WAUtil getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage:]";
      __int16 v152 = 1024;
      int v153 = 201;
      __int16 v154 = 2112;
      v155 = v137;
      __int16 v156 = 2112;
      v157 = v138;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:[WAUtil getCopyOfMessage:withNumericalValuesSubstractedByValuesInMessage: given two different messages(message 1 key: %@ vs message 2 key: %@), won't attempt to delta. Returning nil!", buf, 0x26u);
    }
    __int16 v10 = 0;
  }

  return v10;
}

+ (id)trimTokenForLogging:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = [v3 length];
  if (v4 > 9)
  {
    uint64_t v6 = v5 - 5;
    goto LABEL_5;
  }
  if (v5)
  {
    uint64_t v6 = 1;
LABEL_5:
    uint64_t v7 = [v3 substringFromIndex:v6];
    goto LABEL_7;
  }
  uint64_t v7 = @"Nil or empty token";
LABEL_7:

  return v7;
}

+ (id)getValueForEntitlementForCurrentProcess:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (getpid() < 0)
  {
    char v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      __int16 v20 = 1024;
      int v21 = 322;
      unint64_t v16 = "%{public}s::%d:Failed to get PID";
LABEL_24:
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
LABEL_25:
    uint64_t v5 = 0;
LABEL_26:
    __int16 v8 = 0;
    goto LABEL_16;
  }
  getpid();
  xpc_generate_audit_token();
  objc_msgSend(v3, "UTF8String", 0, 0, 0, 0);
  uint64_t v4 = xpc_copy_entitlement_for_token();
  if (!v4)
  {
    char v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      __int16 v20 = 1024;
      int v21 = 330;
      unint64_t v16 = "%{public}s::%d:Failed to copy entitlement object(does this entitlement exist for the current process?)";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = MEMORY[0x223C0F960]();
  if (!v6)
  {
    char v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      __int16 v20 = 1024;
      int v21 = 333;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to determine type of XPC entitlement object", buf, 0x12u);
    }
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  if (v6 == MEMORY[0x263EF86E0])
  {
    __int16 v8 = [NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
  }
  else
  {
    __int16 v8 = 0;
  }
  if (v7 != MEMORY[0x263EF86D8]) {
    goto LABEL_17;
  }
  char v9 = [MEMORY[0x263EFF980] array];
  __int16 v10 = xpc_array_get_value(v5, 0);
  if (MEMORY[0x223C0F960]() == MEMORY[0x263EF8798])
  {
    if (xpc_array_get_count(v5))
    {
      size_t v11 = 0;
      do
      {
        uint64_t v12 = xpc_array_get_value(v5, v11);
        uint64_t v13 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v12)];
        [v9 addObject:v13];

        ++v11;
      }
      while (v11 < xpc_array_get_count(v5));
    }
  }
  else
  {
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil getValueForEntitlementForCurrentProcess:]";
      __int16 v20 = 1024;
      int v21 = 341;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC Array object contains non-string values", buf, 0x12u);
    }
  }
  if ([v9 count])
  {
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  }
  else
  {
    uint64_t v14 = 0;
  }

  __int16 v8 = (void *)v14;
LABEL_16:

LABEL_17:
  return v8;
}

+ (id)_generateInvocationForMethod:(void *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil _generateInvocationForMethod:]";
      __int16 v20 = 1024;
      int v21 = 362;
      uint64_t v14 = "%{public}s::%d:Didn't get infoForInvocation (InvokeMakerInfo instance)";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    }
LABEL_15:

    __int16 v8 = 0;
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = a3;
  uint64_t v5 = [v4 target];
  uint64_t v6 = objc_msgSend(v5, "methodSignatureForSelector:", objc_msgSend(v4, "selector"));

  if (!v6)
  {
    uint64_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil _generateInvocationForMethod:]";
      __int16 v20 = 1024;
      int v21 = 365;
      uint64_t v14 = "%{public}s::%d:Couldn't create NSMethodSignature from -InvokeMakerInfo.selector";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v7 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v6];
  if (v7)
  {
    __int16 v8 = (void *)v7;
    char v9 = [v4 target];
    [v8 setTarget:v9];

    objc_msgSend(v8, "setSelector:", objc_msgSend(v4, "selector"));
    id v17 = &v25;
    uint64_t v16 = v24;
    int v10 = 2;
    do
    {
      [v8 setArgument:&v16 atIndex:v10++];
      size_t v11 = v17++;
      uint64_t v16 = *v11;
    }
    while (v16);
    objc_msgSend(v8, "retainArguments", 0);
  }
  else
  {
    uint64_t v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v19 = "+[WAUtil _generateInvocationForMethod:]";
      __int16 v20 = 1024;
      int v21 = 367;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldn't create NSInvocation from NSMethodSignature", buf, 0x12u);
    }

    __int16 v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (unint64_t)getAWDTimestamp
{
  v3.tv_sec = 0;
  *(void *)&v3.tv_usec = 0;
  gettimeofday(&v3, 0);
  return 1000 * v3.tv_sec + v3.tv_usec / 1000;
}

+ (void)sumNSNumberForKey:(id)a3 dstDict:(id)a4 otherDict:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  if (!v8)
  {
    id v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      unint64_t v19 = "+[WAUtil sumNSNumberForKey:dstDict:otherDict:]";
      __int16 v20 = 1024;
      int v21 = 433;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempting to adjust nil dictionary with key %@", (uint8_t *)&v18, 0x1Cu);
    }
    goto LABEL_9;
  }
  size_t v11 = [v9 objectForKeyedSubscript:v7];

  if (v11)
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:v7];

    if (v12)
    {
      uint64_t v13 = NSNumber;
      uint64_t v14 = [v8 objectForKeyedSubscript:v7];
      uint64_t v15 = [v14 unsignedIntegerValue];
      uint64_t v16 = [v10 objectForKeyedSubscript:v7];
      id v17 = objc_msgSend(v13, "numberWithUnsignedLong:", objc_msgSend(v16, "unsignedIntegerValue") + v15);

      [v8 removeObjectForKey:v7];
    }
    else
    {
      id v17 = [v10 objectForKeyedSubscript:v7];
    }
    [v8 setObject:v17 forKey:v7];
LABEL_9:
  }
}

+ (void)addDeltaNSNumberForTelemetryKey:(id)a3 dictKey:(id)a4 dictModule:(id)a5 telDict:(id)a6 recentDict:(id)a7 oldDict:(id)a8
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v16)
  {
    double v32 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      unint64_t v39 = "+[WAUtil addDeltaNSNumberForTelemetryKey:dictKey:dictModule:telDict:recentDict:oldDict:]";
      __int16 v40 = 1024;
      int v41 = 453;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempting to adjust nil telDict with key %@", buf, 0x1Cu);
    }
    goto LABEL_12;
  }
  uint64_t v19 = [v17 objectForKeyedSubscript:v15];
  if (!v19) {
    goto LABEL_7;
  }
  __int16 v20 = (void *)v19;
  int v21 = [v17 objectForKeyedSubscript:v15];
  __int16 v22 = [v21 objectForKeyedSubscript:v14];

  if (!v22)
  {
LABEL_7:
    double v32 = [NSNumber numberWithUnsignedLong:0];
LABEL_11:
    [v16 removeObjectForKey:v13];
    [v16 setObject:v32 forKey:v13];
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v23 = [v18 objectForKeyedSubscript:v15];
  if (!v23) {
    goto LABEL_10;
  }
  uint64_t v24 = (void *)v23;
  uint64_t v25 = [v18 objectForKeyedSubscript:v15];
  id v26 = [v25 objectForKeyedSubscript:v14];

  if (!v26)
  {
LABEL_10:
    double v33 = NSNumber;
    double v34 = [v17 objectForKeyedSubscript:v15];
    uint64_t v35 = [v34 objectForKeyedSubscript:v14];
    double v32 = objc_msgSend(v33, "numberWithUnsignedLong:", objc_msgSend(v35, "unsignedLongValue"));

    goto LABEL_11;
  }
  unint64_t v36 = NSNumber;
  v37 = [v17 objectForKeyedSubscript:v15];
  v27 = [v37 objectForKeyedSubscript:v14];
  uint64_t v28 = [v27 unsignedLongValue];
  v29 = [v18 objectForKeyedSubscript:v15];
  v30 = [v29 objectForKeyedSubscript:v14];
  int v31 = objc_msgSend(v36, "numberWithUnsignedLong:", v28 - objc_msgSend(v30, "unsignedLongValue"));

  [v16 removeObjectForKey:v13];
  [v16 setObject:v31 forKey:v13];

LABEL_13:
}

+ (void)logNestedDictionary:(id)a3 indent:(int)a4 prefix:(id)a5
{
  v48[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:1];
  id v9 = [v6 allKeys];
  v29 = (void *)v8;
  v48[0] = v8;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
  size_t v11 = [v9 sortedArrayUsingDescriptors:v10];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
        id v17 = [v6 objectForKeyedSubscript:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

LABEL_9:
          __int16 v20 = [NSString stringWithFormat:@"%@ %@", v7, v16];
          int v21 = [v6 objectForKeyedSubscript:v16];
          [a1 logNestedDictionary:v21 indent:(a4 + 4) prefix:v20];
LABEL_10:

          goto LABEL_11;
        }
        id v18 = [v6 objectForKeyedSubscript:v16];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_9;
        }
        __int16 v22 = [v6 objectForKeyedSubscript:v16];
        objc_opt_class();
        char v23 = objc_opt_isKindOfClass();

        uint64_t v24 = [v6 objectForKeyedSubscript:v16];
        uint64_t v25 = v24;
        if (v23)
        {
          uint64_t v26 = [v24 unsignedIntegerValue];

          if (v26)
          {
            __int16 v20 = WALogCategoryDefaultHandle();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_11;
            }
LABEL_20:
            int v21 = [v6 objectForKeyedSubscript:v16];
            *(_DWORD *)buf = 67110146;
            int v38 = a4;
            __int16 v39 = 2080;
            __int16 v40 = "";
            __int16 v41 = 2112;
            id v42 = v7;
            __int16 v43 = 2112;
            uint64_t v44 = v16;
            __int16 v45 = 2112;
            int v46 = v21;
            _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_DEFAULT, "%*s%@ %@ : %@", buf, 0x30u);
            goto LABEL_10;
          }
        }
        else
        {
          objc_opt_class();
          char v27 = objc_opt_isKindOfClass();

          if (v27)
          {
            __int16 v20 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_20;
            }
LABEL_11:
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
      uint64_t v13 = v28;
    }
    while (v28);
  }
}

+ (BOOL)isMacAddress:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  BOOL v6 = v3
    && (id v5 = v3, [v5 UTF8String])
    && ether_aton((const char *)[v5 UTF8String]) != 0;

  return v6;
}

+ (BOOL)isWildcardMacAddress:(id)a3
{
  id v4 = a3;
  if ([a1 isMacAddress:v4])
  {
    if ([v4 isEqualToString:@"00:00:00:00:00:00"]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 isEqualToString:@"0:0:0:0:0:0"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)resourcePath
{
  return @"/System/Library/PrivateFrameworks/WiFiAnalytics.framework";
}

+ (id)wifianalyticsTmpDirectory
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (_wifianalyticsTmpDirectory)
  {
    uint64_t v15 = 0;
    int v10 = 0;
  }
  else
  {
    id v2 = [NSURL fileURLWithPath:@"/var/tmp/com.apple.wifianalyticsd" isDirectory:1];
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v4 = [v2 path];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:0];

    if (v5)
    {
      BOOL v6 = [MEMORY[0x263F08850] defaultManager];
      id v21 = 0;
      [v6 removeItemAtURL:v2 error:&v21];
      id v7 = v21;

      uint64_t v8 = WALogCategoryDefaultHandle();
      id v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          char v23 = "+[WAUtil wifianalyticsTmpDirectory]";
          __int16 v24 = 1024;
          int v25 = 540;
          __int16 v26 = 2112;
          char v27 = v2;
          __int16 v28 = 2112;
          v29 = v7;
          _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to delete %@ with error %@", buf, 0x26u);
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          char v23 = "+[WAUtil wifianalyticsTmpDirectory]";
          __int16 v24 = 1024;
          int v25 = 542;
          __int16 v26 = 2112;
          char v27 = v2;
          _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:deleted %@", buf, 0x1Cu);
        }
        id v7 = v9;
      }
    }
    int v10 = [NSURL fileURLWithPath:@"/var/log/com.apple.wifi.analytics" isDirectory:1];

    if (v10)
    {
      size_t v11 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v12 = [v10 path];
      char v13 = [v11 fileExistsAtPath:v12 isDirectory:0];

      if ((v13 & 1) == 0
        && ([MEMORY[0x263F08850] defaultManager],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            id v20 = 0,
            [v14 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v20],
            uint64_t v15 = v20,
            v14,
            v15))
      {
        uint64_t v16 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [v10 path];
          *(_DWORD *)buf = 136446978;
          char v23 = "+[WAUtil wifianalyticsTmpDirectory]";
          __int16 v24 = 1024;
          int v25 = 556;
          __int16 v26 = 2112;
          char v27 = v19;
          __int16 v28 = 2112;
          v29 = v15;
          _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create wifianalytics tmp directory (%@) with error %@", buf, 0x26u);
        }
      }
      else
      {
        objc_storeStrong((id *)&_wifianalyticsTmpDirectory, v10);
        uint64_t v16 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446722;
          char v23 = "+[WAUtil wifianalyticsTmpDirectory]";
          __int16 v24 = 1024;
          int v25 = 559;
          __int16 v26 = 2112;
          char v27 = v10;
          _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:wifianalyticsDirectory: %@", buf, 0x1Cu);
        }
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  id v17 = (id)_wifianalyticsTmpDirectory;

  return v17;
}

+ (BOOL)isAnyWiFiAppInstalled
{
  if (+[WAUtil isPreinstalledWiFiAppVisible]) {
    return 1;
  }
  return +[WAUtil isWiFiAppInstalled];
}

+ (BOOL)isPreinstalledWiFiAppVisible
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)CFPreferencesCopyValue(@"SBIconVisibility", @"com.apple.wifi.app", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
  int v3 = [v2 BOOLValue];

  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    id v7 = "+[WAUtil isPreinstalledWiFiAppVisible]";
    __int16 v8 = 1024;
    int v9 = 579;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SBIconVisibility for com.apple.wifi.app=%d", (uint8_t *)&v6, 0x18u);
  }

  return v3;
}

+ (BOOL)isWiFiAppInstalled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    int v3 = [MEMORY[0x263F01880] defaultWorkspace];
    int v4 = [v3 applicationIsInstalled:@"com.apple.wifi.app-shack"];

    if (v4)
    {
      int v5 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136446722;
        __int16 v8 = "+[WAUtil isWiFiAppInstalled]";
        __int16 v9 = 1024;
        int v10 = 589;
        __int16 v11 = 2080;
        uint64_t v12 = "+[WAUtil isWiFiAppInstalled]";
        _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: com.apple.wifi.app-shack is installed", (uint8_t *)&v7, 0x1Cu);
      }

      LOBYTE(v2) = 1;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

+ (BOOL)isWiFiFragmentSamplingEnabled
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ((MGGetBoolAnswer() & 1) != 0
    || (uint64_t v2 = (void *)MGGetStringAnswer(), v3 = [v2 isEqualToString:@"Beta"], v2, v3))
  {
    if (MGGetProductType() != 3348380076) {
      *((unsigned char *)v8 + 24) = 1;
    }
  }
  if (MGGetBoolAnswer())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__WAUtil_isWiFiFragmentSamplingEnabled__block_invoke;
    v6[3] = &unk_264465F80;
    v6[4] = &v7;
    +[WAUtil getLazyNSNumberPreference:@"WiFiFragmentSampling" domain:@"com.apple.wifianalyticsd" exists:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__WAUtil_isWiFiFragmentSamplingEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 136447234;
    uint64_t v7 = "+[WAUtil isWiFiFragmentSamplingEnabled]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 609;
    __int16 v10 = 2080;
    __int16 v11 = "+[WAUtil isWiFiFragmentSamplingEnabled]_block_invoke";
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 1024;
    int v15 = [v3 unsignedIntValue];
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING kWAPreferenceWiFiFragmentSampling from %u to %u", (uint8_t *)&v6, 0x28u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

+ (BOOL)isAnalyticsProcessorAllowed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = _os_feature_enabled_impl();
  if ((v2 & 1) == 0)
  {
    id v3 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      int v6 = "+[WAUtil isAnalyticsProcessorAllowed]";
      __int16 v7 = 1024;
      int v8 = 620;
      _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2;
}

+ (BOOL)shouldProcessAnalyticsImmediately
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v9 = 0;
  BOOL v2 = +[WAUtil isAnyWiFiAppInstalled]
    || +[WAUtil isWiFiFragmentSamplingEnabled];
  BOOL v9 = v2;
  if (_isInternalInstall)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__WAUtil_shouldProcessAnalyticsImmediately__block_invoke;
    v5[3] = &unk_264465F80;
    v5[4] = &v6;
    +[WAUtil getLazyNSNumberPreference:@"WAStore_ProcessAnalyticsImmediately" domain:@"com.apple.wifianalyticsd" exists:v5];
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__WAUtil_shouldProcessAnalyticsImmediately__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 136447490;
    __int16 v7 = "+[WAUtil shouldProcessAnalyticsImmediately]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 632;
    __int16 v10 = 2080;
    __int16 v11 = "+[WAUtil shouldProcessAnalyticsImmediately]_block_invoke";
    __int16 v12 = 2112;
    int v13 = @"WAStore_ProcessAnalyticsImmediately";
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = [v3 unsignedIntValue];
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING %@ from %u to %u", (uint8_t *)&v6, 0x32u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

+ (BOOL)shouldEnableXPCStore
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if (_isInternalInstall)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__WAUtil_shouldEnableXPCStore__block_invoke;
    v4[3] = &unk_264465F80;
    v4[4] = &v5;
    +[WAUtil getLazyNSNumberPreference:@"WAStore_EnableXPCStore" domain:@"com.apple.wifianalyticsd" exists:v4];
    BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  }
  else
  {
    BOOL v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __30__WAUtil_shouldEnableXPCStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 136447490;
    uint64_t v7 = "+[WAUtil shouldEnableXPCStore]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 647;
    __int16 v10 = 2080;
    __int16 v11 = "+[WAUtil shouldEnableXPCStore]_block_invoke";
    __int16 v12 = 2112;
    int v13 = @"WAStore_EnableXPCStore";
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = [v3 unsignedIntValue];
    _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%s: OVERRIDING %@ from %u to %u", (uint8_t *)&v6, 0x32u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];
}

+ (BOOL)isWritingWAMessageToJsonAllowed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = _os_feature_enabled_impl();
  if ((v2 & 1) == 0)
  {
    id v3 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      int v6 = "+[WAUtil isWritingWAMessageToJsonAllowed]";
      __int16 v7 = 1024;
      int v8 = 661;
      _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:JSON file writing disabled on this platform", (uint8_t *)&v5, 0x12u);
    }
  }
  return v2;
}

+ (void)getLazyNSNumberPreference:(id)a3 domain:(id)a4 exists:(id)a5
{
  int v13 = (void (**)(id, void *))a5;
  __int16 v7 = (void *)MEMORY[0x263EFFA40];
  id v8 = a4;
  id v9 = a3;
  __int16 v10 = [v7 standardUserDefaults];
  __int16 v11 = [v10 persistentDomainForName:v8];

  __int16 v12 = [v11 objectForKey:v9];

  if (v12) {
    v13[2](v13, v12);
  }
}

+ (void)getLazyNSStringPreference:(id)a3 domain:(id)a4 exists:(id)a5
{
  int v13 = (void (**)(id, void *))a5;
  __int16 v7 = (void *)MEMORY[0x263EFFA40];
  id v8 = a4;
  id v9 = a3;
  __int16 v10 = [v7 standardUserDefaults];
  __int16 v11 = [v10 persistentDomainForName:v8];

  __int16 v12 = [v11 objectForKey:v9];

  if (v12) {
    v13[2](v13, v12);
  }
}

+ (BOOL)canPerformActionWithSamplingPercentage:(unint64_t)a3
{
  return arc4random_uniform(0x63u) <= a3;
}

@end