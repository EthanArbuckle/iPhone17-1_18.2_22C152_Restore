@interface WLKSportsFavoriteResponse
- (NSArray)favorites;
- (WLKSportsFavoriteResponse)initWithDictionary:(id)a3;
@end

@implementation WLKSportsFavoriteResponse

- (WLKSportsFavoriteResponse)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WLKSportsFavoriteResponse;
  v5 = [(WLKSportsFavoriteResponse *)&v21 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(v4, "wlk_arrayForKey:", @"data", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = +[WLKSportsFavoriteFactory favoriteFromDictionary:v12];
            if (v13) {
              [v6 addObject:v13];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [v6 copy];
    favorites = v5->_favorites;
    v5->_favorites = (NSArray *)v14;
  }
  return v5;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
}

@end