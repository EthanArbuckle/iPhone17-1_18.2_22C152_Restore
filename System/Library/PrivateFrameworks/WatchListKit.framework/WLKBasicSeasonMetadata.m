@interface WLKBasicSeasonMetadata
+ (id)seasonsWithDictionaries:(id)a3;
- (NSNumber)seasonNumber;
- (NSString)canonicalShowID;
- (WLKBasicSeasonMetadata)initWithDictionary:(id)a3;
@end

@implementation WLKBasicSeasonMetadata

+ (id)seasonsWithDictionaries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [WLKBasicSeasonMetadata alloc];
          v12 = -[WLKBasicSeasonMetadata initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (WLKBasicSeasonMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WLKBasicSeasonMetadata;
  id v5 = [(WLKBasicContentMetadata *)&v12 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "wlk_numberForKey:", @"seasonNumber");
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v6;

    uint64_t v8 = objc_msgSend(v4, "wlk_stringForKey:", @"showId");
    uint64_t v9 = [v8 copy];
    canonicalShowID = v5->_canonicalShowID;
    v5->_canonicalShowID = (NSString *)v9;
  }
  return v5;
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalShowID, 0);

  objc_storeStrong((id *)&self->_seasonNumber, 0);
}

@end