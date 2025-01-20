@interface CallRecordConverter
+ (id)sharedInstance;
- (CallRecordConverter)init;
- (NSCache)handleToPersonCache;
- (NSCache)recentCallIdToCallRecordCache;
- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5;
- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6;
- (int64_t)callCapabilityFromRecentCall:(id)a3;
- (int64_t)preferredCallProviderFromRecentCall:(id)a3;
- (void)setHandleToPersonCache:(id)a3;
- (void)setRecentCallIdToCallRecordCache:(id)a3;
@end

@implementation CallRecordConverter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CallRecordConverter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __37__CallRecordConverter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CallRecordConverter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CallRecordConverter;
  v2 = [(CallRecordConverter *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    recentCallIdToCallRecordCache = v2->_recentCallIdToCallRecordCache;
    v2->_recentCallIdToCallRecordCache = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    handleToPersonCache = v2->_handleToPersonCache;
    v2->_handleToPersonCache = v5;
  }
  return v2;
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5
{
  return [(CallRecordConverter *)self callRecordsForRecentCalls:a3 withContactsDataSource:a4 withCallProviderManager:a5 withCurrentISOCountryCodes:MEMORY[0x263EFFA68]];
}

- (id)callRecordsForRecentCalls:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
        v18 = [(CallRecordConverter *)self recentCallIdToCallRecordCache];
        v19 = [v17 uniqueId];
        v20 = [v18 objectForKey:v19];

        v21 = IntentHandlerDefaultLog();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22) {
            -[CallRecordConverter callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:](&buf, v30, v21);
          }
        }
        else
        {
          if (v22) {
            -[CallRecordConverter callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:](v35, v17, &v36, v21);
          }

          v20 = [(CallRecordConverter *)self callRecordForRecentCall:v17 withContactsDataSource:v28 withCallProviderManager:v27 withCurrentISOCountryCodes:v26];
          v21 = [(CallRecordConverter *)self recentCallIdToCallRecordCache];
          v23 = [v17 uniqueId];
          [v21 setObject:v20 forKey:v23];
        }
        [v11 addObject:v20];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v14);
  }

  v24 = (void *)[v11 copy];
  return v24;
}

- (id)callRecordForRecentCall:(id)a3 withContactsDataSource:(id)a4 withCallProviderManager:(id)a5 withCurrentISOCountryCodes:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v50 = a4;
  id v11 = a5;
  id v49 = a6;
  v52 = [MEMORY[0x263EFF980] array];
  v51 = v10;
  v48 = v11;
  if ([v10 callerIdIsBlocked])
  {
    id v12 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_25DA54000, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Caller ID is blocked", buf, 2u);
    }
    goto LABEL_35;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v12 = [v10 remoteParticipantHandles];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v58;
    v54 = v12;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v58 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "tu_tuHandle");
        if (v18)
        {
          v19 = [(CallRecordConverter *)self handleToPersonCache];
          v20 = [v19 objectForKey:v18];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = v20;
            id v22 = v15;
            goto LABEL_25;
          }
          if (v20)
          {
            v23 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint8_t buf = 0;
              _os_log_impl(&dword_25DA54000, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Found an entry of unknown type in handleToPerson cache", buf, 2u);
            }

            uint64_t v15 = 0;
          }
          else
          {
            v24 = [v10 isoCountryCode];
            if (v24)
            {
              v25 = [v10 isoCountryCode];
              v63 = v25;
              id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
            }
            else
            {
              id v22 = v49;
            }

            v21 = objc_msgSend(MEMORY[0x263F0FD18], "tu_personMatchingHandle:contactsDataSource:isoCountryCodes:", v18, v50, v22);

            if (v21)
            {
              id v26 = v21;
            }
            else
            {
              id v26 = [MEMORY[0x263EFF9D0] null];
            }
            id v27 = v26;
            id v28 = [(CallRecordConverter *)self handleToPersonCache];
            [v28 setObject:v27 forKey:v18];

            id v10 = v51;
LABEL_25:

            if (v21)
            {
              [v52 addObject:v21];
              uint64_t v15 = v21;
            }
            else
            {
              uint64_t v15 = 0;
            }
            id v12 = v54;
          }
          v29 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            v62 = v15;
            _os_log_impl(&dword_25DA54000, v29, OS_LOG_TYPE_DEFAULT, "person added to particpants in callrecord: %@", buf, 0xCu);
          }

          goto LABEL_32;
        }
        v20 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint8_t buf = 0;
          _os_log_impl(&dword_25DA54000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine remoteParticipantHandle for CHRecentCall", buf, 2u);
        }
LABEL_32:
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (!v14)
      {
        id v11 = v48;
        goto LABEL_36;
      }
    }
  }
LABEL_35:
  uint64_t v15 = 0;
LABEL_36:

  int v30 = [v10 callStatus];
  if ((*MEMORY[0x263F305E0] & v30) != 0)
  {
    uint64_t v31 = 1;
  }
  else
  {
    int v32 = [v10 callStatus];
    if ((*MEMORY[0x263F305D8] & v32) != 0)
    {
      uint64_t v31 = 2;
    }
    else
    {
      int v33 = [v10 callStatus];
      uint64_t v31 = 3;
      if ((*MEMORY[0x263F305D0] & v33) == 0) {
        uint64_t v31 = 0;
      }
    }
  }
  id v55 = (id)v31;
  v46 = [v11 providerForRecentCall:v10];
  v43 = [v46 bundleIdentifier];
  int64_t v34 = [(CallRecordConverter *)self preferredCallProviderFromRecentCall:v10];
  int64_t v53 = [(CallRecordConverter *)self callCapabilityFromRecentCall:v10];
  id v35 = objc_alloc(MEMORY[0x263F0F9E8]);
  v47 = [v10 uniqueId];
  v45 = [v10 date];
  uint64_t v36 = v10;
  v37 = NSNumber;
  [v36 duration];
  v44 = objc_msgSend(v37, "numberWithDouble:");
  uint64_t v38 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v36, "read") ^ 1);
  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "numberOfOccurrences"));
  v40 = [v46 identifier];
  v41 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v36, "callerIdIsBlocked"));
  id v56 = (id)[v35 initWithIdentifier:v47 dateCreated:v45 callRecordType:v55 callCapability:v53 callDuration:v44 unseen:v38 preferredCallProvider:v34 participants:v52 numberOfCalls:v39 providerId:v40 providerBundleId:v43 isCallerIdBlocked:v41];

  return v56;
}

- (int64_t)preferredCallProviderFromRecentCall:(id)a3
{
  v3 = [a3 serviceProvider];
  if ([v3 isEqualToString:*MEMORY[0x263F30620]])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F30628]])
  {
    int64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 length];
    v6 = IntentHandlerDefaultLog();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[CallRecordConverter preferredCallProviderFromRecentCall:](v7);
      }
      int64_t v4 = 3;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CallRecordConverter preferredCallProviderFromRecentCall:](v7);
      }
      int64_t v4 = 0;
    }
  }
  return v4;
}

- (int64_t)callCapabilityFromRecentCall:(id)a3
{
  uint64_t v3 = [a3 mediaType];
  int64_t v4 = v3;
  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v5 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint8_t buf = 0;
        v6 = "Inferring video call capability from call to redial";
        v7 = buf;
        goto LABEL_10;
      }
    }
    else
    {
      if (v3 != 1) {
        return 0;
      }
      uint64_t v5 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        v6 = "Inferring audio call capability from call to redial";
        v7 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_25DA54000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
  }
  else
  {
    uint64_t v5 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v6 = "[WARN] Unable to infer callCapability from call to redial because media type of that call was unknown.";
      v7 = (uint8_t *)&v9;
      goto LABEL_10;
    }
  }

  return v4;
}

- (NSCache)recentCallIdToCallRecordCache
{
  return self->_recentCallIdToCallRecordCache;
}

- (void)setRecentCallIdToCallRecordCache:(id)a3
{
}

- (NSCache)handleToPersonCache
{
  return self->_handleToPersonCache;
}

- (void)setHandleToPersonCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToPersonCache, 0);
  objc_storeStrong((id *)&self->_recentCallIdToCallRecordCache, 0);
}

- (void)callRecordsForRecentCalls:(uint8_t *)a1 withContactsDataSource:(void *)a2 withCallProviderManager:(void *)a3 withCurrentISOCountryCodes:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  v7 = [a2 uniqueId];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_25DA54000, a4, OS_LOG_TYPE_DEBUG, "Converting CHRecentCall %@ to INCallRecord.", a1, 0xCu);
}

- (void)callRecordsForRecentCalls:(os_log_t)log withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_25DA54000, log, OS_LOG_TYPE_DEBUG, "Converted this CHRecentCall previously, using cached converted INCallRecord.", buf, 2u);
}

- (void)preferredCallProviderFromRecentCall:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25DA54000, log, OS_LOG_TYPE_ERROR, "No serviceProvider found on CHRecentCall - setting preferredCallProvider to unknown.", v1, 2u);
}

- (void)preferredCallProviderFromRecentCall:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25DA54000, log, OS_LOG_TYPE_DEBUG, "serviceProvider is not FT or telephony - must be a 3P provider.", v1, 2u);
}

@end