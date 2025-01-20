@interface WLKChannel
+ (id)channelsWithDictionaries:(id)a3 context:(id)a4;
+ (id)channelsWithDictionaries:(id)a3 context:(id)a4 seasons:(id)a5;
- (NSArray)seasonNumbers;
- (NSArray)subscriptionOffers;
- (NSDictionary)punchoutUrls;
- (NSString)ID;
- (WLKChannel)init;
- (WLKChannel)initWithDictionary:(id)a3 context:(id)a4;
- (WLKChannelDetails)details;
@end

@implementation WLKChannel

- (WLKChannel)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)WLKChannel;
  v8 = [(WLKChannel *)&v26 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "wlk_stringForKey:", @"channelId");
    ID = v8->_ID;
    v8->_ID = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"punchoutUrls");
    punchoutUrls = v8->_punchoutUrls;
    v8->_punchoutUrls = (NSDictionary *)v11;

    uint64_t v13 = objc_msgSend(v6, "wlk_arrayForKey:", @"seasonNumbers");
    seasonNumbers = v8->_seasonNumbers;
    v8->_seasonNumbers = (NSArray *)v13;

    v15 = objc_msgSend(v6, "wlk_arrayForKey:", @"subscriptionOffers");
    if (v15)
    {
      uint64_t v16 = +[WLKStoreOffer offersWithSubscriptionDictionaries:v15];
      subscriptionOffers = v8->_subscriptionOffers;
      v8->_subscriptionOffers = (NSArray *)v16;
    }
    id v18 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = objc_msgSend(v18, "wlk_arrayForKey:", @"WLKModelContextKeyChannels");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __41__WLKChannel_initWithDictionary_context___block_invoke;
      v24[3] = &unk_1E620AA08;
      v25 = v8;
      [v19 enumerateObjectsUsingBlock:v24];
    }
    if (!v8->_details)
    {
      v20 = +[WLKChannelUtilities sharedInstance];
      uint64_t v21 = [v20 channelForID:v8->_ID];
      details = v8->_details;
      v8->_details = (WLKChannelDetails *)v21;
    }
  }

  return v8;
}

void __41__WLKChannel_initWithDictionary_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 channelID];
  int v8 = [v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
    *a4 = 1;
  }
}

- (WLKChannel)init
{
  return 0;
}

+ (id)channelsWithDictionaries:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [WLKChannel alloc];
        v15 = -[WLKChannel initWithDictionary:context:](v14, "initWithDictionary:context:", v13, v6, (void)v18);
        if (v15) {
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = (void *)[v7 copy];

  return v16;
}

+ (id)channelsWithDictionaries:(id)a3 context:(id)a4 seasons:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  id v8 = a5;
  v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    id v10 = 0;
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        uint64_t v30 = v11;
        v12 = objc_msgSend(v29, "wlk_arrayForKey:", @"seasons");

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v10 = v12;
        uint64_t v13 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v10);
              }
              v17 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "wlk_stringForKey:", @"id");
              long long v18 = objc_msgSend(v8, "wlk_dictionaryForKey:", v17);
              long long v19 = objc_msgSend(v18, "wlk_numberForKey:", @"seasonNumber");

              [v9 addObject:v19];
            }
            uint64_t v14 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }

        long long v20 = (void *)[v29 mutableCopy];
        [v20 setObject:v9 forKey:@"seasonNumbers"];
        long long v21 = [[WLKChannel alloc] initWithDictionary:v20 context:v27];
        if (v21) {
          [v25 addObject:v21];
        }

        uint64_t v11 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }
  v22 = (void *)[v25 copy];

  return v22;
}

- (NSString)ID
{
  return self->_ID;
}

- (WLKChannelDetails)details
{
  return self->_details;
}

- (NSDictionary)punchoutUrls
{
  return self->_punchoutUrls;
}

- (NSArray)seasonNumbers
{
  return self->_seasonNumbers;
}

- (NSArray)subscriptionOffers
{
  return self->_subscriptionOffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionOffers, 0);
  objc_storeStrong((id *)&self->_seasonNumbers, 0);
  objc_storeStrong((id *)&self->_punchoutUrls, 0);
  objc_storeStrong((id *)&self->_details, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end