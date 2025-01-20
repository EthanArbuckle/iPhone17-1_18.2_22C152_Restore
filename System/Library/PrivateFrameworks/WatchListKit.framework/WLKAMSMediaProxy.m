@interface WLKAMSMediaProxy
- (BOOL)hasInAppPurchases;
- (NSArray)buyParameters;
- (NSDictionary)contentRatingsBySystemDictionary;
- (NSString)subtitle;
- (WLKAMSMediaProxy)initWithDictionary:(id)a3;
- (void)_initializeProperties:(id)a3;
- (void)setHasInAppPurchases:(BOOL)a3;
@end

@implementation WLKAMSMediaProxy

- (WLKAMSMediaProxy)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLKAMSMediaProxy;
  v5 = [(WLKAMSMediaProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(WLKAMSMediaProxy *)v5 _initializeProperties:v4];
  }

  return v6;
}

- (void)_initializeProperties:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "wlk_arrayForKey:", @"data");
  if ([v4 count])
  {
    v23 = [v4 objectAtIndexedSubscript:0];
    v5 = objc_msgSend(v23, "wlk_dictionaryForKey:", @"attributes");
    objc_msgSend(v5, "wlk_dictionaryForKey:", @"contentRatingsBySystem");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    contentRatingsBySystemDictionary = self->_contentRatingsBySystemDictionary;
    self->_contentRatingsBySystemDictionary = v6;

    v22 = v5;
    v21 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"platformAttributes");
    objc_super v8 = objc_msgSend(v21, "wlk_dictionaryForKey:", @"appletvos");
    v9 = objc_msgSend(v8, "wlk_arrayForKey:", @"offers");
    self->_hasInAppPurchases = objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", @"hasInAppPurchases", 0);
    objc_msgSend(v8, "wlk_stringForKey:", @"subtitle");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v17), "wlk_stringForKey:", @"buyParams");
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    v19 = (NSArray *)[v12 copy];
    buyParameters = self->_buyParameters;
    self->_buyParameters = v19;

    NSLog(&cfstr_Wlkamsmediapro.isa, self->_contentRatingsBySystemDictionary, self->_hasInAppPurchases, self->_subtitle, self->_buyParameters);
  }
  else
  {
    NSLog(&cfstr_DictionaryResp.isa);
  }
}

- (NSArray)buyParameters
{
  return self->_buyParameters;
}

- (BOOL)hasInAppPurchases
{
  return self->_hasInAppPurchases;
}

- (void)setHasInAppPurchases:(BOOL)a3
{
  self->_hasInAppPurchases = a3;
}

- (NSDictionary)contentRatingsBySystemDictionary
{
  return self->_contentRatingsBySystemDictionary;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentRatingsBySystemDictionary, 0);

  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end