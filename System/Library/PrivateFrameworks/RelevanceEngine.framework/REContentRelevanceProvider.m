@interface REContentRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (NSArray)keywords;
- (REContentRelevanceProvider)init;
- (REContentRelevanceProvider)initWithContent:(id)a3;
- (REContentRelevanceProvider)initWithDictionary:(id)a3;
- (REContentRelevanceProvider)initWithKeywords:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REContentRelevanceProvider

- (REContentRelevanceProvider)initWithKeywords:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REContentRelevanceProvider;
  v6 = [(RERelevanceProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    p_keywords = &v6->_keywords;
    objc_storeStrong((id *)&v6->_keywords, a3);
    if (!*p_keywords)
    {
      *p_keywords = (NSArray *)MEMORY[0x263EFFA68];
    }
  }

  return v7;
}

- (REContentRelevanceProvider)initWithContent:(id)a3
{
  v4 = RETokenizeString(a3);
  id v5 = [(REContentRelevanceProvider *)self initWithKeywords:v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (REContentRelevanceProvider)init
{
  return [(REContentRelevanceProvider *)self initWithContent:&stru_26CFA57D0];
}

+ (id)relevanceSimulatorID
{
  return @"content_terms";
}

- (REContentRelevanceProvider)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"keywords"];
  if (v4)
  {
    id v5 = [(REContentRelevanceProvider *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      v7 = (void *)v6;
      if (v6) {
        v8 = (void *)v6;
      }
      else {
        v8 = (void *)MEMORY[0x263EFFA68];
      }
      objc_storeStrong((id *)&v5->_keywords, v8);
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryEncoding
{
  v6[1] = *MEMORY[0x263EF8340];
  if (self->_keywords) {
    keywords = self->_keywords;
  }
  else {
    keywords = (NSArray *)MEMORY[0x263EFFA68];
  }
  id v5 = @"keywords";
  v6[0] = keywords;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[REContentRelevanceProvider allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_keywords, self->_keywords);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REContentRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)REContentRelevanceProvider,
          [(RERelevanceProvider *)&v11 isEqual:v4]))
    {
      keywords = self->_keywords;
      uint64_t v6 = v4->_keywords;
      v7 = keywords;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSArray *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_keywords;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)REContentRelevanceProvider;
  uint64_t v4 = [(REContentRelevanceProvider *)&v7 description];
  unint64_t v5 = [v3 stringWithFormat:@"%@, keywords=%@", v4, self->_keywords];

  return v5;
}

- (NSArray)keywords
{
  return self->_keywords;
}

@end