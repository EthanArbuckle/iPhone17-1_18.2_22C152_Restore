@interface WLKContinueWatchingCollection
- (NSArray)items;
- (NSString)collectionID;
- (NSString)title;
- (WLKContinueWatchingCollection)init;
- (WLKContinueWatchingCollection)initWithDictionary:(id)a3;
@end

@implementation WLKContinueWatchingCollection

- (WLKContinueWatchingCollection)init
{
  return [(WLKContinueWatchingCollection *)self initWithDictionary:0];
}

- (WLKContinueWatchingCollection)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WLKContinueWatchingCollection;
  v5 = [(WLKContinueWatchingCollection *)&v27 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_stringForKey:", @"title");
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
    uint64_t v10 = [v9 copy];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = objc_msgSend(v4, "wlk_arrayForKey:", @"items", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [[WLKBasicContentMetadata alloc] initWithDictionary:v18];
            if (v19) {
              [v12 addObject:v19];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    uint64_t v20 = [v12 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v20;
  }
  return v5;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end