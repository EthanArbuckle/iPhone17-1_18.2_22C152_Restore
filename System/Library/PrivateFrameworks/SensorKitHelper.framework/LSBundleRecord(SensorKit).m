@interface LSBundleRecord(SensorKit)
+ (uint64_t)sr_bundleRecordWithIdentifier:()SensorKit error:;
- (uint64_t)sr_isSocialNetworking;
- (uint64_t)sr_supportsDataGeneration;
- (uint64_t)sr_supportsMessagingIntents;
- (uint64_t)sr_supportsVOIP;
@end

@implementation LSBundleRecord(SensorKit)

+ (uint64_t)sr_bundleRecordWithIdentifier:()SensorKit error:
{
  uint64_t v4 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:0 error:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return v4;
}

- (uint64_t)sr_supportsVOIP
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1, "UIBackgroundModes"), "containsObject:", @"voip")) {
    return 1;
  }
  v3 = (void *)[a1 appTags];
  return [v3 containsObject:@"any-telephony"];
}

- (uint64_t)sr_supportsMessagingIntents
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend((id)objc_msgSend(a1, "supportedIntents"), "containsObject:", @"INSendMessageIntent")) {
      return 1;
    }
    uint64_t v4 = (void *)[a1 applicationExtensionRecords];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
LABEL_10:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "supportedIntents"), "containsObject:", @"INSendMessageIntent"))return 1; {
        if (v5 == ++v7)
        }
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t result = 0;
          if (v5) {
            goto LABEL_10;
          }
          return result;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = (void *)[a1 supportedIntents];
      return [v3 containsObject:@"INSendMessageIntent"];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)sr_supportsDataGeneration
{
  v1 = objc_msgSend((id)objc_msgSend(a1, "infoDictionary"), "objectForKey:ofClass:", @"SRResearchDataGeneration", objc_opt_class());
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  return [v1 BOOLValue];
}

- (uint64_t)sr_isSocialNetworking
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_opt_class();
  v2 = a1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [a1 containingBundleRecord];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v2 = (void *)v3;
      }
      else {
        v2 = 0;
      }
    }
    else
    {
      v2 = 0;
    }
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "iTunesMetadata"), "genreIdentifier");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v2, "iTunesMetadata"), "genre");
  uint64_t v6 = (void *)[v2 infoDictionary];
  uint64_t v7 = objc_opt_class();
  long long v8 = (void *)[v6 objectForKey:@"SBMatchingApplicationGenres" ofClass:v7 valuesOfClass:objc_opt_class()];
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_0);
  }
  long long v9 = qword_26B34E408;
  if (os_log_type_enabled((os_log_t)qword_26B34E408, OS_LOG_TYPE_INFO))
  {
    int v11 = 138478595;
    uint64_t v12 = [a1 bundleIdentifier];
    __int16 v13 = 2050;
    uint64_t v14 = v4;
    __int16 v15 = 2113;
    v16 = v5;
    __int16 v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_25C113000, v9, OS_LOG_TYPE_INFO, "bundle id: %{private}@, genre id: %{public}llu, genre: %{private}@, genres: %{private}@", (uint8_t *)&v11, 0x2Au);
  }
  if (v4 == 6005 || ([v5 isEqualToString:@"Social Networking"] & 1) != 0) {
    return 1;
  }
  else {
    return [v8 containsObject:@"Social Networking"];
  }
}

@end