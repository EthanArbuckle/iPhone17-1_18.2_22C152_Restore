@interface TVRCFilmography
+ (id)filmographyWithDictionaries:(id)a3;
- (NSArray)categories;
- (TVRCFilmography)initWithDictionaries:(id)a3;
@end

@implementation TVRCFilmography

- (TVRCFilmography)initWithDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TVRCFilmography;
  v5 = [(TVRCFilmography *)&v19 init];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[TVRCFilmographyCategory filmographyCategoryWithDictionary:](TVRCFilmographyCategory, "filmographyCategoryWithDictionary:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
          [(NSArray *)v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    categories = v5->_categories;
    v5->_categories = v6;
  }
  return v5;
}

+ (id)filmographyWithDictionaries:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionaries:v4];

  return v5;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
}

@end