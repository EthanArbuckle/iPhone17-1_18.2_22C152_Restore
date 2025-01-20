@interface NTPBPurchaseOfferableConfiguration(FCAdditions)
+ (id)purchaseOfferableConfigurationsFromJSON:()FCAdditions;
@end

@implementation NTPBPurchaseOfferableConfiguration(FCAdditions)

+ (id)purchaseOfferableConfigurationsFromJSON:()FCAdditions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:", v3);
  if ([v4 count])
  {
    id v17 = v3;
    v16 = v4;
    [v4 objectForKeyedSubscript:@"purchaseIDs"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v9 = objc_alloc_init(MEMORY[0x1E4F82B68]);
          v10 = [v8 objectForKey:@"purchaseID"];
          [v9 setPurchaseId:v10];

          v11 = [v8 objectForKey:@"allowsPubIPhoneApp"];
          objc_msgSend(v9, "setAllowsPublisherPhoneApp:", objc_msgSend(v11, "BOOLValue"));

          v12 = [v8 objectForKey:@"allowsPubIPadApp"];
          objc_msgSend(v9, "setAllowsPublisherPadApp:", objc_msgSend(v12, "BOOLValue"));

          v13 = [v8 objectForKey:@"allowsPubWebsite"];
          objc_msgSend(v9, "setAllowsPublisherWebSite:", objc_msgSend(v13, "BOOLValue"));

          v14 = [v8 objectForKey:@"preferredOffer"];
          objc_msgSend(v9, "setPreferredOffer:", objc_msgSend(v14, "BOOLValue"));

          [v20 addObject:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    v4 = v16;
    id v3 = v17;
  }

  return v20;
}

@end