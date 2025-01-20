@interface WLKGenre
+ (id)genresWithDictionaries:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)uniqueID;
- (WLKGenre)init;
- (WLKGenre)initWithDictionary:(id)a3;
@end

@implementation WLKGenre

+ (id)genresWithDictionaries:(id)a3
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
          v11 = [WLKGenre alloc];
          v12 = -[WLKGenre initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (WLKGenre)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKGenre;
    id v5 = [(WLKGenre *)&v14 init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"id");
      uint64_t v7 = [v6 copy];
      uniqueID = v5->_uniqueID;
      v5->_uniqueID = (NSString *)v7;

      v9 = objc_msgSend(v4, "wlk_stringForKey:", @"name");
      uint64_t v10 = [v9 copy];
      name = v5->_name;
      v5->_name = (NSString *)v10;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WLKGenre)init
{
  return [(WLKGenre *)self initWithDictionary:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uniqueID = self->_uniqueID;
    uint64_t v6 = [v4 uniqueID];
    BOOL v7 = [(NSString *)uniqueID isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end