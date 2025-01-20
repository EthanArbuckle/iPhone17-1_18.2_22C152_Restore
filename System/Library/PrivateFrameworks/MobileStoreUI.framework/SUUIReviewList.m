@interface SUUIReviewList
- (NSArray)reviews;
- (NSMutableDictionary)cacheRepresentation;
- (NSURL)writeReviewURL;
- (SUUIReviewList)initWithCacheRepresentation:(id)a3;
- (SUUIReviewList)initWithReviewListDictionary:(id)a3;
- (float)userRating;
- (int64_t)fiveStarRatingCount;
- (int64_t)fourStarRatingCount;
- (int64_t)numberOfPages;
- (int64_t)oneStarRatingCount;
- (int64_t)ratingCount;
- (int64_t)threeStarRatingCount;
- (int64_t)twoStarRatingCount;
- (void)addReviews:(id)a3;
@end

@implementation SUUIReviewList

- (SUUIReviewList)initWithReviewListDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIReviewList;
  v5 = [(SUUIReviewList *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = [v4 objectForKey:@"review_list"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v20 = v8;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[SUUIReview alloc] initWithReviewDictionary:v15];
              if (v16) {
                [v9 addObject:v16];
              }
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v12);
      }

      uint64_t v17 = [v9 mutableCopy];
      reviews = v5->_reviews;
      v5->_reviews = (NSMutableArray *)v17;

      v8 = v20;
    }
  }
  return v5;
}

- (void)addReviews:(id)a3
{
}

- (int64_t)fiveStarRatingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count_5stars"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)fourStarRatingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count_4stars"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)numberOfPages
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"total_num_pages"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)oneStarRatingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count_1star"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)ratingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)threeStarRatingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count_3stars"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)twoStarRatingCount
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_count_2stars"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (float)userRating
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"rating_average"];
  objc_opt_class();
  float v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 floatValue];
    float v3 = v4;
  }

  return v3;
}

- (NSURL)writeReviewURL
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"writeReviewUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v3 = [NSURL URLWithString:v2];
  }
  else
  {
    float v3 = 0;
  }

  return (NSURL *)v3;
}

- (SUUIReviewList)initWithCacheRepresentation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25.receiver = self;
    v25.super_class = (Class)SUUIReviewList;
    v5 = [(SUUIReviewList *)&v25 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v6;

      v8 = [v4 objectForKey:@"reviews"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
              v16 = [SUUIReview alloc];
              uint64_t v17 = -[SUUIReview initWithCacheRepresentation:](v16, "initWithCacheRepresentation:", v15, (void)v21);
              if (v17) {
                [v9 addObject:v17];
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v12);
        }

        uint64_t v18 = [v9 copy];
        reviews = v5->_reviews;
        v5->_reviews = (NSMutableArray *)v18;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  float v3 = (void *)[(NSDictionary *)self->_dictionary mutableCopy];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_reviews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "cacheRepresentation", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKey:@"reviews"];
  return (NSMutableDictionary *)v3;
}

- (NSArray)reviews
{
  return &self->_reviews->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviews, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end