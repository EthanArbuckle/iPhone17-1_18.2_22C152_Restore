@interface WLKContinueWatchingResponse
- (NSArray)items;
- (WLKContinueWatchingCollection)featured;
- (WLKContinueWatchingResponse)init;
- (WLKContinueWatchingResponse)initWithDictionary:(id)a3;
@end

@implementation WLKContinueWatchingResponse

- (WLKContinueWatchingResponse)init
{
  return 0;
}

- (WLKContinueWatchingResponse)initWithDictionary:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WLKContinueWatchingResponse;
  v5 = [(WLKContinueWatchingResponse *)&v31 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    uint64_t v7 = +[WLKChannelsResponse parseChannelsFromPayload:v6];
    id v26 = v4;
    v24 = (void *)v7;
    if (v7)
    {
      v33 = @"WLKModelContextKeyChannels";
      v34[0] = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    }
    else
    {
      v8 = 0;
    }
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v25 = v6;
    v10 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"shelf");
    v11 = objc_msgSend(v10, "wlk_arrayForKey:", @"items");

    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [[WLKContinuationMetadata alloc] initWithDictionary:v16 context:v8];
            if (v17) {
              [v9 addObject:v17];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v13);
    }

    uint64_t v18 = [v9 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v18;

    v20 = objc_msgSend(v25, "wlk_dictionaryForKey:", @"featured");
    if (v20)
    {
      v21 = [[WLKContinueWatchingCollection alloc] initWithDictionary:v20];
      featured = v5->_featured;
      v5->_featured = v21;
    }
    id v4 = v26;
  }

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (WLKContinueWatchingCollection)featured
{
  return self->_featured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featured, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end