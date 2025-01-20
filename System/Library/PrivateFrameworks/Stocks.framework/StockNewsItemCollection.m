@interface StockNewsItemCollection
- (NSArray)newsItems;
- (StockNewsItemCollection)initWithArchiveArray:(id)a3;
- (double)expirationTime;
- (id)archiveArray;
- (void)setExpirationTime:(double)a3;
- (void)setNewsItems:(id)a3;
@end

@implementation StockNewsItemCollection

- (StockNewsItemCollection)initWithArchiveArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)StockNewsItemCollection;
  v5 = [(StockNewsItemCollection *)&v22 init];
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        v13 = v10;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          v15 = [StockNewsItem alloc];
          v10 = -[StockNewsItem initWithArchiveDictionary:](v15, "initWithArchiveDictionary:", v14, (void)v18);

          if (v10) {
            [(NSArray *)v6 addObject:v10];
          }
          ++v12;
          v13 = v10;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }
    newsItems = v5->_newsItems;
    v5->_newsItems = v6;
  }
  return v5;
}

- (id)archiveArray
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_newsItems, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_newsItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "archiveDictionary", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)newsItems
{
  return self->_newsItems;
}

- (void)setNewsItems:(id)a3
{
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (void).cxx_destruct
{
}

@end