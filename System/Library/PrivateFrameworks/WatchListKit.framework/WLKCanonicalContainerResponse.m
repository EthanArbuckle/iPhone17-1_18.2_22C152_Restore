@interface WLKCanonicalContainerResponse
+ (id)parseChannelsFromPayload:(id)a3;
- (BOOL)isWatchListable;
- (BOOL)isWatchListed;
- (NSArray)channels;
- (NSDictionary)defaultSeason;
- (NSDictionary)dictionary;
- (NSString)canonicalID;
- (WLKBasicEpisodeMetadata)currentEpisode;
- (WLKCanonicalContainerResponse)init;
- (WLKCanonicalContainerResponse)initWithDictionary:(id)a3;
- (unint64_t)contentType;
@end

@implementation WLKCanonicalContainerResponse

- (WLKCanonicalContainerResponse)initWithDictionary:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v60.receiver = self;
  v60.super_class = (Class)WLKCanonicalContainerResponse;
  v6 = [(WLKCanonicalContainerResponse *)&v60 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"data");
    v9 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"content");
    uint64_t v10 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"channels");
    v11 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"contentPersonalizedInfo");
    v38 = objc_msgSend(v8, "wlk_arrayForKey:", @"howToWatch");
    v12 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"smartEpisode");
    v42 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"playables");
    v41 = objc_msgSend(v8, "wlk_arrayForKey:", @"smartEpisodePlayables");
    v13 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"seasons");
    v14 = objc_msgSend(v12, "wlk_stringForKey:", @"seasonId");
    v40 = objc_msgSend(v13, "wlk_dictionaryForKey:", v14);

    v15 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"seasons");
    v7->_watchListable = objc_msgSend(v11, "wlk_BOOLForKey:defaultValue:", @"isAddToUpNextEnabled", 0);
    v45 = v11;
    v7->_watchListed = objc_msgSend(v11, "wlk_BOOLForKey:defaultValue:", @"inUpNext", 0);
    v46 = (void *)v10;
    uint64_t v16 = +[WLKCanonicalContainerResponse parseChannelsFromPayload:v10];
    uint64_t v17 = objc_msgSend(v9, "wlk_stringForKey:", @"id");
    canonicalID = v7->_canonicalID;
    v7->_canonicalID = (NSString *)v17;

    v47 = v9;
    v19 = objc_msgSend(v9, "wlk_stringForKey:", @"type");
    v7->_contentType = +[WLKBasicContentMetadata contentTypeForString:v19];

    v44 = (void *)v16;
    if (v16)
    {
      v61 = @"WLKModelContextKeyChannels";
      v62[0] = v16;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    }
    else
    {
      v20 = 0;
    }
    v21 = dispatch_group_create();
    v22 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke;
    block[3] = &unk_1E620B3B0;
    v23 = v7;
    v56 = v23;
    id v24 = v38;
    id v57 = v24;
    id v25 = v20;
    id v58 = v25;
    id v39 = v15;
    id v59 = v39;
    dispatch_group_async(v21, v22, block);

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke_2;
    v48[3] = &unk_1E620B3D8;
    v26 = v23;
    v49 = v26;
    id v36 = v12;
    id v50 = v36;
    id v37 = v25;
    id v51 = v37;
    id v27 = v42;
    id v52 = v27;
    id v28 = v41;
    id v53 = v28;
    id v29 = v40;
    id v54 = v29;
    dispatch_group_async(v21, v22, v48);

    dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (v24 && objc_msgSend(v24, "count", v36, v37, v39))
    {
      id v43 = v5;
      v30 = [v24 firstObject];
      v31 = objc_msgSend(v30, "wlk_arrayForKey:", @"seasons");
      v32 = v31;
      if (v31 && [v31 count])
      {
        uint64_t v33 = [v32 firstObject];
        defaultSeason = v26->_defaultSeason;
        v26->_defaultSeason = (NSDictionary *)v33;
      }
      id v5 = v43;
    }
  }
  return v7;
}

uint64_t __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke(void *a1)
{
  *(void *)(a1[4] + 56) = +[WLKChannel channelsWithDictionaries:a1[5] context:a1[6] seasons:a1[7]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 40) = [[WLKBasicEpisodeMetadata alloc] initWithDictionary:a1[5] context:a1[6] playablesDict:a1[7] playablesId:a1[8] seasonsDict:a1[9]];

  return MEMORY[0x1F41817F8]();
}

+ (id)parseChannelsFromPayload:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__WLKCanonicalContainerResponse_parseChannelsFromPayload___block_invoke;
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

void __58__WLKCanonicalContainerResponse_parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = [[WLKChannelDetails alloc] initWithDictionary:v4];

  id v5 = [(WLKChannelDetails *)v6 channelID];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (WLKCanonicalContainerResponse)init
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

- (WLKBasicEpisodeMetadata)currentEpisode
{
  return self->_currentEpisode;
}

- (NSDictionary)defaultSeason
{
  return self->_defaultSeason;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_defaultSeason, 0);
  objc_storeStrong((id *)&self->_currentEpisode, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end