@interface TrimUnregisteredClients
@end

@implementation TrimUnregisteredClients

void ___TrimUnregisteredClients_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = _RegisteredClients();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___TrimUnregisteredClients_block_invoke_2;
  v4[3] = &unk_1E56E1900;
  id v2 = v0;
  id v5 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v4];

  if ([v2 count])
  {
    v3 = _RegisteredClients();
    [v3 removeObjectsForKeys:v2];

    _ArchiveRegisteredClients();
  }
}

void ___TrimUnregisteredClients_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v6 isValid] & 1) == 0)
  {
    v7 = [v6 activityRegistrations];
    v8 = [v7 allKeys];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          _XPCActivityIdentifier(v5, *(void *)(*((void *)&v16 + 1) + 8 * v13));
          id v14 = objc_claimAutoreleasedReturnValue();
          xpc_activity_unregister((const char *)objc_msgSend(v14, "UTF8String", (void)v16));

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v11);
    }

    v15 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Activity Client: %@ is no longer valid and will be removed.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
  }
}

@end