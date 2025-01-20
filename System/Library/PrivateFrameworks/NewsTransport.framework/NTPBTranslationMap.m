@interface NTPBTranslationMap
+ (Class)favoritesLanguageBucketsType;
+ (Class)topicLanguageBucketsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)favoritesLanguageBuckets;
- (NSMutableArray)topicLanguageBuckets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)favoritesLanguageBucketsAtIndex:(unint64_t)a3;
- (id)topicLanguageBucketsAtIndex:(unint64_t)a3;
- (unint64_t)favoritesLanguageBucketsCount;
- (unint64_t)hash;
- (unint64_t)topicLanguageBucketsCount;
- (void)addFavoritesLanguageBuckets:(id)a3;
- (void)addTopicLanguageBuckets:(id)a3;
- (void)clearFavoritesLanguageBuckets;
- (void)clearTopicLanguageBuckets;
- (void)mergeFrom:(id)a3;
- (void)setFavoritesLanguageBuckets:(id)a3;
- (void)setTopicLanguageBuckets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTranslationMap

- (void)clearTopicLanguageBuckets
{
}

- (void)addTopicLanguageBuckets:(id)a3
{
  id v4 = a3;
  topicLanguageBuckets = self->_topicLanguageBuckets;
  id v8 = v4;
  if (!topicLanguageBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicLanguageBuckets;
    self->_topicLanguageBuckets = v6;

    id v4 = v8;
    topicLanguageBuckets = self->_topicLanguageBuckets;
  }
  [(NSMutableArray *)topicLanguageBuckets addObject:v4];
}

- (unint64_t)topicLanguageBucketsCount
{
  return [(NSMutableArray *)self->_topicLanguageBuckets count];
}

- (id)topicLanguageBucketsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicLanguageBuckets objectAtIndex:a3];
}

+ (Class)topicLanguageBucketsType
{
  return (Class)objc_opt_class();
}

- (void)clearFavoritesLanguageBuckets
{
}

- (void)addFavoritesLanguageBuckets:(id)a3
{
  id v4 = a3;
  favoritesLanguageBuckets = self->_favoritesLanguageBuckets;
  id v8 = v4;
  if (!favoritesLanguageBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_favoritesLanguageBuckets;
    self->_favoritesLanguageBuckets = v6;

    id v4 = v8;
    favoritesLanguageBuckets = self->_favoritesLanguageBuckets;
  }
  [(NSMutableArray *)favoritesLanguageBuckets addObject:v4];
}

- (unint64_t)favoritesLanguageBucketsCount
{
  return [(NSMutableArray *)self->_favoritesLanguageBuckets count];
}

- (id)favoritesLanguageBucketsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_favoritesLanguageBuckets objectAtIndex:a3];
}

+ (Class)favoritesLanguageBucketsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTranslationMap;
  id v4 = [(NTPBTranslationMap *)&v8 description];
  v5 = [(NTPBTranslationMap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_topicLanguageBuckets count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_topicLanguageBuckets, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_topicLanguageBuckets;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"topic_language_buckets"];
  }
  if ([(NSMutableArray *)self->_favoritesLanguageBuckets count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_favoritesLanguageBuckets, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_favoritesLanguageBuckets;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"favorites_language_buckets"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTranslationMapReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_topicLanguageBuckets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_favoritesLanguageBuckets;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_topicLanguageBuckets;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTopicLanguageBuckets:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_favoritesLanguageBuckets;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addFavoritesLanguageBuckets:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topicLanguageBuckets = self->_topicLanguageBuckets, !((unint64_t)topicLanguageBuckets | v4[2]))
     || -[NSMutableArray isEqual:](topicLanguageBuckets, "isEqual:")))
  {
    favoritesLanguageBuckets = self->_favoritesLanguageBuckets;
    if ((unint64_t)favoritesLanguageBuckets | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](favoritesLanguageBuckets, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_topicLanguageBuckets hash];
  return [(NSMutableArray *)self->_favoritesLanguageBuckets hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBTranslationMap *)self addTopicLanguageBuckets:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NTPBTranslationMap addFavoritesLanguageBuckets:](self, "addFavoritesLanguageBuckets:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)topicLanguageBuckets
{
  return self->_topicLanguageBuckets;
}

- (void)setTopicLanguageBuckets:(id)a3
{
}

- (NSMutableArray)favoritesLanguageBuckets
{
  return self->_favoritesLanguageBuckets;
}

- (void)setFavoritesLanguageBuckets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicLanguageBuckets, 0);

  objc_storeStrong((id *)&self->_favoritesLanguageBuckets, 0);
}

@end