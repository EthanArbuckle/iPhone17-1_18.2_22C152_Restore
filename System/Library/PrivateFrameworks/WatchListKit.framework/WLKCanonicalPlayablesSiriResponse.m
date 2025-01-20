@interface WLKCanonicalPlayablesSiriResponse
+ (id)_parseChannelsFromPayload:(id)a3;
- (BOOL)isWatchListable;
- (BOOL)isWatchListed;
- (NSArray)playables;
- (NSDictionary)dictionary;
- (NSString)canonicalID;
- (WLKCanonicalPlayablesSiriResponse)init;
- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3;
- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3 statsID:(id)a4;
- (unint64_t)contentType;
- (void)setCanonicalID:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setPlayables:(id)a3;
- (void)setWatchListable:(BOOL)a3;
- (void)setWatchListed:(BOOL)a3;
@end

@implementation WLKCanonicalPlayablesSiriResponse

- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)WLKCanonicalPlayablesSiriResponse;
  v5 = [(WLKCanonicalPlayablesSiriResponse *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v35 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    id v36 = v4;
    v8 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    v34 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"content");
    v33 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"channels");
    v37 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"contentPersonalizedInfo");
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v8, "wlk_arrayForKey:", @"smartPlayables");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v15 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"playables");
          v16 = objc_msgSend(v14, "wlk_stringForKey:", @"playableId");
          v17 = objc_msgSend(v15, "wlk_dictionaryForKey:", v16);
          [v9 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v11);
    }
    BOOL v18 = +[WLKNetworkRequestUtilities isGDPRAccepted];
    v19 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v20 = objc_msgSend(v19, "ams_activeiTunesAccount");

    BOOL v21 = objc_msgSend(v37, "wlk_BOOLForKey:defaultValue:", @"isWatchlistEnabled", 0) & v18;
    if (!v20) {
      LOBYTE(v21) = 0;
    }
    v5 = v35;
    v35->_watchListable = v21;
    v22 = WLKSystemLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v45 = v18;
      _os_log_impl(&dword_1BA2E8000, v22, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isGDPRAccepted:%d", buf, 8u);
    }

    v23 = WLKSystemLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v45 = v20 != 0;
      _os_log_impl(&dword_1BA2E8000, v23, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isAccountPresent:%d", buf, 8u);
    }

    v35->_watchListed = objc_msgSend(v37, "wlk_BOOLForKey:defaultValue:", @"inUpNext", 0);
    v24 = +[WLKCanonicalPlayablesSiriResponse _parseChannelsFromPayload:v33];
    uint64_t v25 = objc_msgSend(v34, "wlk_stringForKey:", @"id");
    canonicalID = v35->_canonicalID;
    v35->_canonicalID = (NSString *)v25;

    v27 = objc_msgSend(v34, "wlk_stringForKey:", @"type");
    v35->_contentType = +[WLKBasicContentMetadata contentTypeForString:v27];

    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSString *)v35->_canonicalID length]) {
      [v28 setObject:v35->_canonicalID forKey:@"WLKModelContextKeyCanonicalID"];
    }
    if (v24) {
      [v28 setObject:v24 forKey:@"WLKModelContextKeyChannels"];
    }
    v29 = (void *)[v9 copy];
    uint64_t v30 = +[WLKPlayable playablesWithDictionaries:v29 context:v28];
    playables = v35->_playables;
    v35->_playables = (NSArray *)v30;

    id v4 = v36;
  }

  return v5;
}

- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3 statsID:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WLKCanonicalPlayablesSiriResponse;
  v8 = [(WLKCanonicalPlayablesSiriResponse *)&v31 init];
  id v9 = v8;
  if (v8)
  {
    p_canonicalID = &v8->_canonicalID;
    objc_storeStrong((id *)&v8->_canonicalID, a4);
    v9->_contentType = 5;
    uint64_t v11 = [v6 copy];
    dictionary = v9->_dictionary;
    v9->_dictionary = (NSDictionary *)v11;

    v13 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"data");
    v14 = objc_msgSend(v13, "wlk_dictionaryForKey:", @"playables");
    uint64_t v15 = objc_msgSend(v13, "wlk_dictionaryForKey:", @"channels");
    v16 = (void *)v15;
    if (v14 && v15 && *p_canonicalID)
    {
      v17 = objc_msgSend(v14, "wlk_dictionaryForKey:");
      BOOL v18 = [[WLKPlayable alloc] initWithDictionary:v17];
      v34[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      playables = v9->_playables;
      v9->_playables = (NSArray *)v19;

      uint64_t v30 = v17;
      v29 = [v17 objectForKey:@"channelId"];
      BOOL v21 = objc_msgSend(v16, "wlk_dictionaryForKey:");
      BOOL v22 = +[WLKNetworkRequestUtilities isGDPRAccepted];
      v23 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v24 = objc_msgSend(v23, "ams_activeiTunesAccount");

      BOOL v25 = objc_msgSend(v21, "wlk_BOOLForKey:defaultValue:", @"isWatchlistEnabled", 0) & v22;
      if (!v24) {
        LOBYTE(v25) = 0;
      }
      v9->_watchListable = v25;
      v26 = WLKSystemLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v33 = v22;
        _os_log_impl(&dword_1BA2E8000, v26, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isGDPRAccepted:%d", buf, 8u);
      }

      v27 = WLKSystemLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v33 = v24 != 0;
        _os_log_impl(&dword_1BA2E8000, v27, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isAccountPresent:%d", buf, 8u);
      }

      v9->_watchListed = 0;
    }
  }
  return v9;
}

+ (id)_parseChannelsFromPayload:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__WLKCanonicalPlayablesSiriResponse__parseChannelsFromPayload___block_invoke;
  v9[3] = &unk_1E620AB90;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v6 count]) {
    id v7 = (void *)[v6 copy];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __63__WLKCanonicalPlayablesSiriResponse__parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = [[WLKChannelDetails alloc] initWithDictionary:v4];

  v5 = [(WLKChannelDetails *)v6 channelID];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (WLKCanonicalPlayablesSiriResponse)init
{
  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (BOOL)isWatchListable
{
  return self->_watchListable;
}

- (void)setWatchListable:(BOOL)a3
{
  self->_watchListable = a3;
}

- (BOOL)isWatchListed
{
  return self->_watchListed;
}

- (void)setWatchListed:(BOOL)a3
{
  self->_watchListed = a3;
}

- (NSArray)playables
{
  return self->_playables;
}

- (void)setPlayables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end