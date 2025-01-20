@interface TUMapsMetadataCacheDataProvider
- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4;
@end

@implementation TUMapsMetadataCacheDataProvider

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  v8 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v24 + 1) + 8 * v13) handle];
        v15 = [v14 normalizedValue];

        if ([v15 length])
        {
          uint64_t v16 = CFPhoneNumberCreate();
          if (v16)
          {
            v17 = (const void *)v16;
            [v8 addObject:v16];
            CFRelease(v17);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    dispatch_group_enter(v7);
    id v18 = objc_alloc_init((Class)CUTWeakLinkClass());
    [v18 _setAllowPhoneNumberLookupUsingCellular:1];
    v19 = [v8 allObjects];
    [v18 _setPhoneNumbers:v19];

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.telephonyutilities.metadatacache.mapsQueue", 0);
    v21 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithRequest:v18];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__TUMapsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
    v22[3] = &unk_1E58E7C10;
    v22[4] = self;
    v23 = v7;
    [v21 _phoneOnlyStartWithCompletionHandler:v22 queue:v20];
  }
}

void __75__TUMapsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = [a2 mapItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    id v6 = &off_1E58E5000;
    do
    {
      uint64_t v7 = 0;
      uint64_t v23 = v4;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        id v9 = [v8 name];
        if ([v9 length])
        {
          uint64_t v10 = [v8 phoneNumber];
          uint64_t v11 = [v10 length];

          if (!v11) {
            goto LABEL_15;
          }
          id v9 = [v8 phoneNumber];
          if ([v9 length])
          {
            uint64_t v12 = [v8 placemark];
            uint64_t v13 = [v12 countryCode];

            v14 = [v6[219] normalizedPhoneNumberHandleForValue:v9 isoCountryCode:v13];
            if (v14)
            {
              v15 = [[TUMetadataDestinationID alloc] initWithHandle:v14];
              if (v15)
              {
                uint64_t v16 = v5;
                v17 = v2;
                id v18 = v6;
                v19 = *(void **)(a1 + 32);
                dispatch_queue_t v20 = [v8 name];
                v21 = v19;
                id v6 = v18;
                v2 = v17;
                uint64_t v5 = v16;
                uint64_t v4 = v23;
                [v21 setObject:v20 forDestinationID:v15];
              }
            }
          }
        }

LABEL_15:
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end