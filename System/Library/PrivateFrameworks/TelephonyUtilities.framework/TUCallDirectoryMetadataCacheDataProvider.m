@interface TUCallDirectoryMetadataCacheDataProvider
- (CXCallDirectoryManager)callDirectoryManager;
- (TUCallDirectoryMetadataCacheDataProvider)init;
- (id)countryDialingCode;
- (id)firstIdentificationEntriesForEnabledExtensions;
- (int)identificationEntriesChangedNotifyToken;
- (void)dealloc;
- (void)setCountryDialingCode:(id)a3;
- (void)setFirstIdentificationEntriesForEnabledExtensions:(id)a3;
- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4;
@end

@implementation TUCallDirectoryMetadataCacheDataProvider

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  group = a4;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  id v26 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    v27 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = [v12 handle];
        if ([v13 type] == 2)
        {
          v14 = [v13 normalizedValue];
          if (![v14 length])
          {
            uint64_t v15 = [v13 value];

            v14 = (void *)v15;
          }
          if ([v14 length])
          {
            [v6 setObject:v12 forKeyedSubscript:v14];
            if ((objc_msgSend(v14, "pn_hasInternationalDirectDialingPrefix") & 1) == 0)
            {
              v16 = [v13 isoCountryCode];
              if ([v16 length])
              {
                v17 = [MEMORY[0x1E4F1CA20] nationalDirectDialingPrefixForISOCountryCode:v16];
                if ([v17 length] && objc_msgSend(v14, "hasPrefix:", v17))
                {
                  uint64_t v18 = objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v17, "length"));

                  v14 = (void *)v18;
                }
                v19 = [(TUCallDirectoryMetadataCacheDataProvider *)self countryDialingCode];
                v20 = ((void (**)(void, void *))v19)[2](v19, v16);

                v21 = [v20 stringByAppendingString:v14];
                if ([v21 length]) {
                  [v27 setObject:v12 forKeyedSubscript:v21];
                }

                id v7 = v26;
                v6 = v27;
              }
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    dispatch_group_enter(group);
    v22 = [(TUCallDirectoryMetadataCacheDataProvider *)self firstIdentificationEntriesForEnabledExtensions];
    v23 = [v6 allKeys];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
    v28[3] = &unk_1E58E5F40;
    id v29 = v6;
    v30 = self;
    v31 = group;
    ((void (**)(void, void *, void *))v22)[2](v22, v23, v28);

    id v7 = v26;
  }
}

void __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained callDirectoryManager];
  [v7 firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:v6 cacheOnly:1 completionHandler:v5];
}

- (id)firstIdentificationEntriesForEnabledExtensions
{
  return self->_firstIdentificationEntriesForEnabledExtensions;
}

- (CXCallDirectoryManager)callDirectoryManager
{
  return self->_callDirectoryManager;
}

- (TUCallDirectoryMetadataCacheDataProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)TUCallDirectoryMetadataCacheDataProvider;
  v2 = [(TUMetadataCacheDataProvider *)&v17 init];
  if (v2)
  {
    v3 = (CXCallDirectoryManager *)objc_alloc_init((Class)CUTWeakLinkClass());
    callDirectoryManager = v2->_callDirectoryManager;
    v2->_callDirectoryManager = v3;

    objc_initWeak(&location, v2);
    id countryDialingCode = v2->_countryDialingCode;
    v2->_id countryDialingCode = &__block_literal_global_1;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_2;
    aBlock[3] = &unk_1E58E5EF0;
    objc_copyWeak(&v15, &location);
    id v6 = _Block_copy(aBlock);
    id firstIdentificationEntriesForEnabledExtensions = v2->_firstIdentificationEntriesForEnabledExtensions;
    v2->_id firstIdentificationEntriesForEnabledExtensions = v6;

    if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1) {
      dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_54);
    }
    uint64_t v8 = (const char *)__CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_3;
    handler[3] = &unk_1E58E5F18;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v8, &v2->_identificationEntriesChangedNotifyToken, v9, handler);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = [v5 objectForKeyedSubscript:v7];
        uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        if (v9)
        {
          id v10 = NSString;
          v11 = TUBundle();
          v12 = [v11 localizedStringForKey:@"CALL_DIRECTORY_EXTENSION_%@_LABEL_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
          id v13 = [v8 localizedExtensionContainingAppName];
          v14 = [v8 localizedLabel];
          id v15 = objc_msgSend(v10, "stringWithFormat:", v12, v13, v14);

          [*(id *)(a1 + 40) setObject:v15 forDestinationID:v9];
        }
        else
        {
          id v15 = TUDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v7;
            _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "[WARN] No metadata destinationID found for phone number '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v19 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v19);
  }
  if (v17)
  {
    v16 = TUDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(a1, (uint64_t)v17, v16);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] ITUCountryCodeForISOCountryCode:a2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v2);
  }

  return v3;
}

void __48__TUCallDirectoryMetadataCacheDataProvider_init__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1) {
      dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_54);
    }
    int v4 = 136315138;
    uint64_t v5 = __CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by refreshing", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refresh];
}

- (void)dealloc
{
  notify_cancel(self->_identificationEntriesChangedNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)TUCallDirectoryMetadataCacheDataProvider;
  [(TUCallDirectoryMetadataCacheDataProvider *)&v3 dealloc];
}

- (int)identificationEntriesChangedNotifyToken
{
  return self->_identificationEntriesChangedNotifyToken;
}

- (id)countryDialingCode
{
  return self->_countryDialingCode;
}

- (void)setCountryDialingCode:(id)a3
{
}

- (void)setFirstIdentificationEntriesForEnabledExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_firstIdentificationEntriesForEnabledExtensions, 0);
  objc_storeStrong(&self->_countryDialingCode, 0);

  objc_storeStrong((id *)&self->_callDirectoryManager, 0);
}

void __84__TUCallDirectoryMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) allKeys];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19C496000, a3, OS_LOG_TYPE_ERROR, "Error retrieving first identification entries for phone numbers %@: %@", (uint8_t *)&v6, 0x16u);
}

@end