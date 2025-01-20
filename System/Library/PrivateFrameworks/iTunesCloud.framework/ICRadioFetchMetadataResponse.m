@interface ICRadioFetchMetadataResponse
- (NSArray)allStorePlatformMetadata;
- (id)_storePlatformMetadataDictionaryFromRadioMetadataDictionary:(id)a3;
- (id)storePlatformMetadataForStoreAdamID:(int64_t)a3;
@end

@implementation ICRadioFetchMetadataResponse

- (id)_storePlatformMetadataDictionaryFromRadioMetadataDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"album-id"];
  if (v4)
  {
    v5 = (void *)[v3 mutableCopy];
    [v5 setObject:v4 forKey:@"collectionId"];
  }
  else
  {
    v5 = 0;
  }
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)storePlatformMetadataForStoreAdamID:(int64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14811;
  v14 = __Block_byref_object_dispose__14812;
  id v15 = 0;
  v5 = [(ICRadioResponse *)self contentDictionary];
  v6 = [v5 objectForKey:@"results"];
  if (_NSIsNSDictionary())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__ICRadioFetchMetadataResponse_storePlatformMetadataForStoreAdamID___block_invoke;
    v9[3] = &unk_1E5AC8E78;
    v9[5] = &v10;
    v9[6] = a3;
    v9[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

void __68__ICRadioFetchMetadataResponse_storePlatformMetadataForStoreAdamID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && _NSIsNSDictionary()
    && [v14 storeAdamID] == *(void *)(a1 + 48))
  {
    v8 = [ICStorePlatformMetadata alloc];
    v9 = [*(id *)(a1 + 32) _storePlatformMetadataDictionaryFromRadioMetadataDictionary:v7];
    uint64_t v10 = [*(id *)(a1 + 32) expirationDate];
    uint64_t v11 = [(ICStorePlatformMetadata *)v8 initWithMetadataDictionary:v9 expirationDate:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

- (NSArray)allStorePlatformMetadata
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICRadioResponse *)self contentDictionary];
  v4 = [v3 objectForKey:@"results"];
  if (_NSIsNSDictionary())
  {
    v19 = v3;
    v5 = [(ICRadioResponse *)self expirationDate];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v18 = v4;
    v6 = [v4 allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v13 = [ICStorePlatformMetadata alloc];
            id v14 = [(ICRadioFetchMetadataResponse *)self _storePlatformMetadataDictionaryFromRadioMetadataDictionary:v12];
            id v15 = [(ICStorePlatformMetadata *)v13 initWithMetadataDictionary:v14 expirationDate:v5];

            if (v15)
            {
              if (!v9) {
                id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v9 addObject:v15];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    v4 = v18;
    id v3 = v19;
  }
  else
  {
    id v9 = 0;
  }
  v16 = (NSArray *)v9;

  return v16;
}

@end