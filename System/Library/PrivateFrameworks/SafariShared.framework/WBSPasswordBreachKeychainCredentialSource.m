@interface WBSPasswordBreachKeychainCredentialSource
- (NSArray)credentials;
- (id)savedAccountsForPersistentIdentifiers:(id)a3;
- (void)credentials;
@end

@implementation WBSPasswordBreachKeychainCredentialSource

- (NSArray)credentials
{
  v36[8] = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  uint64_t v2 = *MEMORY[0x1E4F3B998];
  uint64_t v3 = *MEMORY[0x1E4F3B550];
  v35[0] = *MEMORY[0x1E4F3B978];
  v35[1] = v3;
  v36[0] = v2;
  v36[1] = @"com.apple.cfnetwork";
  uint64_t v4 = *MEMORY[0x1E4F3B880];
  uint64_t v5 = *MEMORY[0x1E4F3B5E8];
  v35[2] = *MEMORY[0x1E4F3B878];
  v35[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B5F8];
  v36[2] = v4;
  v36[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3BB88];
  uint64_t v8 = *MEMORY[0x1E4F3BC68];
  v35[4] = *MEMORY[0x1E4F3BB80];
  v35[5] = v8;
  v36[4] = v7;
  v36[5] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4F3BC78];
  v35[6] = *MEMORY[0x1E4F3BC70];
  v35[7] = v9;
  v36[6] = MEMORY[0x1E4F1CC38];
  v36[7] = MEMORY[0x1E4F1CC38];
  OSStatus v10 = SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:8], &result);
  if (v10)
  {
    int v11 = v10;
    if (v10 == -25300)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Keychain does not contain any saved passwords.", buf, 2u);
      }
    }
    else
    {
      v25 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(WBSPasswordBreachKeychainCredentialSource *)v11 credentials];
      }
    }
    id v27 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v13 = [MEMORY[0x1E4F97E98] dontSaveMarker];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v14 = (id)result;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      uint64_t v18 = *MEMORY[0x1E4F3B5C0];
      uint64_t v19 = *MEMORY[0x1E4F3B848];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "safari_stringForKey:", v18);
          if (([v22 isEqualToString:v13] & 1) == 0)
          {
            v23 = [v21 objectForKeyedSubscript:v19];
            if ([v23 length])
            {
              v24 = (void *)[objc_alloc(MEMORY[0x1E4F97F08]) initWithSecItemDictionary:v21];
              if (v24) {
                [v27 addObject:v24];
              }
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v16);
    }
  }
  return (NSArray *)v27;
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F97FD0];
  id v4 = a3;
  uint64_t v5 = [v3 sharedStore];
  uint64_t v6 = [v5 savedAccountsForPersistentIdentifiers:v4];

  return v6;
}

- (void)credentials
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch passwords. SecItemCopyMatching failed with error code %{public}d.", (uint8_t *)v2, 8u);
}

@end