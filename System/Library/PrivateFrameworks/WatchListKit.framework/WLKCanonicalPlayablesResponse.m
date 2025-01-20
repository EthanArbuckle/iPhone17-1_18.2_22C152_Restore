@interface WLKCanonicalPlayablesResponse
+ (id)_parseChannelsFromPayload:(id)a3;
- (BOOL)isWatchListable;
- (BOOL)isWatchListed;
- (NSArray)playables;
- (NSDictionary)dictionary;
- (NSString)canonicalID;
- (WLKCanonicalPlayablesResponse)init;
- (WLKCanonicalPlayablesResponse)initWithDictionary:(id)a3;
- (WLKCanonicalPlayablesResponse)initWithSiriResponse:(id)a3 statsID:(id)a4;
- (unint64_t)contentType;
@end

@implementation WLKCanonicalPlayablesResponse

- (WLKCanonicalPlayablesResponse)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WLKCanonicalPlayablesResponse;
  v5 = [(WLKCanonicalPlayablesResponse *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v34 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    id v35 = v4;
    v8 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    v33 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"content");
    v32 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"channels");
    v36 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"contentPersonalizedInfo");
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v8, "wlk_arrayForKey:", @"smartPlayables");
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v15 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"playables");
          v16 = objc_msgSend(v14, "wlk_stringForKey:", @"playableId");
          v17 = objc_msgSend(v15, "wlk_dictionaryForKey:", v16);
          [v9 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v11);
    }
    BOOL v18 = +[WLKNetworkRequestUtilities isGDPRAccepted];
    v19 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v20 = objc_msgSend(v19, "ams_activeiTunesAccount");

    BOOL v21 = objc_msgSend(v36, "wlk_BOOLForKey:defaultValue:", @"isAddToUpNextEnabled", 0) & v18;
    if (!v20) {
      LOBYTE(v21) = 0;
    }
    v5 = v34;
    v34->_watchListable = v21;
    v22 = WLKSystemLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v44 = v18;
      _os_log_impl(&dword_1BA2E8000, v22, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesResponse - isGDPRAccepted:%d", buf, 8u);
    }

    v23 = WLKSystemLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v44 = v20 != 0;
      _os_log_impl(&dword_1BA2E8000, v23, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesResponse - isAccountPresent:%d", buf, 8u);
    }

    v34->_watchListed = objc_msgSend(v36, "wlk_BOOLForKey:defaultValue:", @"inUpNext", 0);
    v24 = +[WLKCanonicalPlayablesResponse _parseChannelsFromPayload:v32];
    uint64_t v25 = objc_msgSend(v33, "wlk_stringForKey:", @"id");
    canonicalID = v34->_canonicalID;
    v34->_canonicalID = (NSString *)v25;

    v27 = objc_msgSend(v33, "wlk_stringForKey:", @"type");
    v34->_contentType = +[WLKBasicContentMetadata contentTypeForString:v27];

    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSString *)v34->_canonicalID length]) {
      [v28 setObject:v34->_canonicalID forKey:@"WLKModelContextKeyCanonicalID"];
    }
    id v4 = v35;
    if (v24) {
      [v28 setObject:v24 forKey:@"WLKModelContextKeyChannels"];
    }
    uint64_t v29 = +[WLKPlayable playablesWithDictionaries:v9 context:v28];
    playables = v34->_playables;
    v34->_playables = (NSArray *)v29;
  }
  return v5;
}

- (WLKCanonicalPlayablesResponse)init
{
  return 0;
}

+ (id)_parseChannelsFromPayload:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__WLKCanonicalPlayablesResponse__parseChannelsFromPayload___block_invoke;
  v9[3] = &unk_1E620AB90;
  id v6 = v5;
  id v10 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v6 count]) {
    v7 = (void *)[v6 copy];
  }
  else {
    v7 = 0;
  }

  return v7;
}

void __59__WLKCanonicalPlayablesResponse__parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = [[WLKChannelDetails alloc] initWithDictionary:v4];

  v5 = [(WLKChannelDetails *)v6 channelID];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (WLKCanonicalPlayablesResponse)initWithSiriResponse:(id)a3 statsID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WLKCanonicalPlayablesResponse;
  v8 = [(WLKCanonicalPlayablesResponse *)&v21 init];
  id v9 = v8;
  if (v6 && v8)
  {
    id v10 = [[WLKCanonicalPlayablesSiriResponse alloc] initWithDictionary:v6 statsID:v7];
    uint64_t v11 = [(WLKCanonicalPlayablesSiriResponse *)v10 playables];
    uint64_t v12 = [v11 copy];
    playables = v9->_playables;
    v9->_playables = (NSArray *)v12;

    v14 = [(WLKCanonicalPlayablesSiriResponse *)v10 dictionary];
    uint64_t v15 = [v14 copy];
    dictionary = v9->_dictionary;
    v9->_dictionary = (NSDictionary *)v15;

    v9->_watchListed = [(WLKCanonicalPlayablesSiriResponse *)v10 isWatchListed];
    v9->_watchListable = [(WLKCanonicalPlayablesSiriResponse *)v10 isWatchListable];
    v9->_contentType = [(WLKCanonicalPlayablesSiriResponse *)v10 contentType];
    v17 = [(WLKCanonicalPlayablesSiriResponse *)v10 canonicalID];
    uint64_t v18 = [v17 copy];
    canonicalID = v9->_canonicalID;
    v9->_canonicalID = (NSString *)v18;
  }
  return v9;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (BOOL)isWatchListable
{
  return self->_watchListable;
}

- (BOOL)isWatchListed
{
  return self->_watchListed;
}

- (NSArray)playables
{
  return self->_playables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end