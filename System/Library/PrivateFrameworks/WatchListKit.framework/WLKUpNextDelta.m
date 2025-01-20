@interface WLKUpNextDelta
+ (BOOL)supportsSecureCoding;
+ (id)useWidgetImagesIfAvailable:(id)a3;
- (BOOL)isExpired;
- (NSArray)additions;
- (NSArray)items;
- (NSArray)removals;
- (NSDate)expirationDate;
- (NSDate)timestamp;
- (WLKUpNextDelta)initWithCoder:(id)a3;
- (WLKUpNextDelta)initWithDictionary:(id)a3;
- (id)_deltaByMergingItemsFromDelta:(id)a3;
- (id)dataByMergingWith:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLKUpNextDelta

- (WLKUpNextDelta)initWithDictionary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WLKUpNextDelta;
  v5 = [(WLKUpNextDelta *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    backingDictionary = v5->_backingDictionary;
    v5->_backingDictionary = (NSDictionary *)v6;

    v24 = v4;
    v8 = objc_msgSend(v4, "wlk_arrayForKey:", @"upNextChanges");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = +[WLKUpNextDelta useWidgetImagesIfAvailable:*(void *)(*((void *)&v25 + 1) + 8 * v14)];
          v16 = [[WLKDeltaContinuationMetadata alloc] initWithDictionary:v15 context:0];
          if (v16) {
            [v9 addObject:v16];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    uint64_t v17 = [v9 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v17;

    id v4 = v24;
    uint64_t v19 = objc_msgSend(v24, "wlk_dateFromMillisecondsSince1970ForKey:", @"timestamp");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v19;

    uint64_t v21 = objc_msgSend(v24, "wlk_dateFromMillisecondsSince1970ForKey:", @"expiresAt");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v21;
  }
  return v5;
}

- (NSArray)removals
{
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"deltaType = %d", 1);
  id v4 = [(NSArray *)self->_items filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (NSArray)additions
{
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"deltaType = %d", 2);
  id v4 = [(NSArray *)self->_items filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [v3 compare:self->_expirationDate] == 1;

  return (char)self;
}

- (id)dataByMergingWith:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WLKUpNextDelta *)self _deltaByMergingItemsFromDelta:v4];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"class must conform to <WLKMergingCoding>"];
    v5 = self;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_deltaByMergingItemsFromDelta:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)[(NSArray *)self->_items mutableCopy];
  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [v4 additions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        +[WLKContinuationMetadataBase add:*(void *)(*((void *)&v35 + 1) + 8 * i) toCollection:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = [v4 removals];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        +[WLKContinuationMetadataBase remove:*(void *)(*((void *)&v31 + 1) + 8 * j) fromCollection:v5];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v13);
  }

  v16 = (void *)[(NSDictionary *)self->_backingDictionary mutableCopy];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * k), "dictionary", (void)v27);
        if (v23) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v20);
  }

  v24 = (void *)[v17 copy];
  [v16 setObject:v24 forKeyedSubscript:@"upNextChanges"];

  long long v25 = [[WLKUpNextDelta alloc] initWithDictionary:v16];

  return v25;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WLKUpNextDelta;
  id v4 = [(WLKUpNextDelta *)&v9 description];
  NSUInteger v5 = [(NSArray *)self->_items count];
  uint64_t v6 = [(WLKUpNextDelta *)self expirationDate];
  uint64_t v7 = [v3 stringWithFormat:@"%@ items:%lu expires:%@", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKUpNextDelta)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    NSUInteger v5 = WLKPlistClasses();
    uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"upNextDelta"];

    self = [(WLKUpNextDelta *)self initWithDictionary:v6];
    uint64_t v7 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_backingDictionary forKey:@"upNextDelta"];
}

+ (id)useWidgetImagesIfAvailable:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"widgetImages");
  if ([v4 count])
  {
    NSUInteger v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
    [v5 setValue:v4 forKey:@"images"];
    [v5 removeObjectForKey:@"widgetImages"];
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

@end