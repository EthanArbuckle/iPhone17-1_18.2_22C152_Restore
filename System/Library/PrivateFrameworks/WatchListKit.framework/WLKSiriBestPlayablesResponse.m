@interface WLKSiriBestPlayablesResponse
- (NSDictionary)dictionary;
- (NSDictionary)playablesByID;
- (WLKSiriBestPlayablesResponse)init;
- (WLKSiriBestPlayablesResponse)initWithDictionary:(id)a3;
- (id)playableForStatsID:(id)a3;
- (void)setPlayablesByID:(id)a3;
@end

@implementation WLKSiriBestPlayablesResponse

- (WLKSiriBestPlayablesResponse)init
{
  return 0;
}

- (WLKSiriBestPlayablesResponse)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WLKSiriBestPlayablesResponse;
  v5 = [(WLKSiriBestPlayablesResponse *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v22 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v23 = v4;
    v8 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    v9 = +[WLKChannelsResponse parseChannelsFromPayload:v8];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v25 = v8;
    id obj = [v8 allKeys];
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = objc_msgSend(v25, "wlk_dictionaryForKey:", v14);
            v16 = objc_msgSend(v15, "wlk_stringForKey:", @"canonicalId");
            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            if ([v16 length]) {
              [v17 setObject:v16 forKey:@"WLKModelContextKeyCanonicalID"];
            }
            if (v9) {
              [v17 setObject:v9 forKey:@"WLKModelContextKeyChannels"];
            }
            v18 = [[WLKPlayable alloc] initWithDictionary:v15 context:v17];
            if (v18) {
              [v24 setObject:v18 forKey:v14];
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    uint64_t v19 = [v24 copy];
    v5 = v22;
    playablesByID = v22->_playablesByID;
    v22->_playablesByID = (NSDictionary *)v19;

    id v4 = v23;
  }

  return v5;
}

- (id)playableForStatsID:(id)a3
{
  id v4 = a3;
  v5 = [(WLKSiriBestPlayablesResponse *)self playablesByID];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSDictionary)playablesByID
{
  return self->_playablesByID;
}

- (void)setPlayablesByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playablesByID, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end