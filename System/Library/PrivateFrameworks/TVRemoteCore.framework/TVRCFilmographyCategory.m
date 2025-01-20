@interface TVRCFilmographyCategory
+ (id)filmographyCategoryWithDictionary:(id)a3;
- (NSArray)items;
- (NSArray)orderedItems;
- (NSString)title;
- (TVRCFilmographyCategory)initWithDictionary:(id)a3;
@end

@implementation TVRCFilmographyCategory

- (TVRCFilmographyCategory)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TVRCFilmographyCategory;
  v5 = [(TVRCFilmographyCategory *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v9 = [v4 objectForKeyedSubscript:@"items"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[TVRCMediaInfo mediaInfoWithDictionary:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
          [(NSArray *)v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }

    items = v5->_items;
    v5->_items = v8;
  }
  return v5;
}

+ (id)filmographyCategoryWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (NSArray)orderedItems
{
  if (!self->_orderedItems)
  {
    v3 = [(TVRCFilmographyCategory *)self items];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      v5 = [(TVRCFilmographyCategory *)self items];
      uint64_t v6 = (NSArray *)[v5 mutableCopy];

      [(NSArray *)v6 sortUsingComparator:&__block_literal_global];
      orderedItems = self->_orderedItems;
      self->_orderedItems = v6;
    }
  }
  if (self->_orderedItems) {
    v8 = self->_orderedItems;
  }
  else {
    v8 = (NSArray *)MEMORY[0x263EFFA68];
  }

  return v8;
}

uint64_t __39__TVRCFilmographyCategory_orderedItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 releaseDate];
  uint64_t v6 = [v4 releaseDate];

  uint64_t v7 = 0;
  if (v5 && v6) {
    uint64_t v7 = [v6 compare:v5];
  }

  return v7;
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

  objc_storeStrong((id *)&self->_orderedItems, 0);
}

@end