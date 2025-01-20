@interface WLKUpNextItemCollection
- (NSArray)items;
- (NSDate)timestamp;
- (NSString)title;
- (WLKUpNextItemCollection)initWithDictionary:(id)a3 context:(id)a4;
- (id)description;
@end

@implementation WLKUpNextItemCollection

- (WLKUpNextItemCollection)initWithDictionary:(id)a3 context:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WLKUpNextItemCollection;
  v8 = [(WLKUpNextItemCollection *)&v31 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "wlk_dateFromMillisecondsSince1970ForKey:", @"timestamp");
    timestamp = v8->_timestamp;
    v8->_timestamp = (NSDate *)v9;

    v11 = objc_msgSend(v6, "wlk_stringForKey:", @"title");
    uint64_t v12 = [v11 copy];
    title = v8->_title;
    v8->_title = (NSString *)v12;

    id v26 = v6;
    v14 = objc_msgSend(v6, "wlk_arrayForKey:", @"items");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [[WLKContinuationMetadata alloc] initWithDictionary:v21 context:v7];
            if (v22) {
              [v15 addObject:v22];
            }
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    if ([v15 count])
    {
      uint64_t v23 = [v15 copy];
      items = v8->_items;
      v8->_items = (NSArray *)v23;
    }
    id v6 = v26;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WLKUpNextItemCollection;
  v4 = [(WLKUpNextItemCollection *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ items:%@", v4, self->_items];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end