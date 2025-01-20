@interface NTPBTrendingLanguageConfig
+ (Class)trendingTopicsType;
- (BOOL)hasLanguageTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)trendingTopics;
- (NSString)languageTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trendingTopicsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)trendingTopicsCount;
- (void)addTrendingTopics:(id)a3;
- (void)clearTrendingTopics;
- (void)mergeFrom:(id)a3;
- (void)setLanguageTag:(id)a3;
- (void)setTrendingTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTrendingLanguageConfig

- (BOOL)hasLanguageTag
{
  return self->_languageTag != 0;
}

- (void)clearTrendingTopics
{
}

- (void)addTrendingTopics:(id)a3
{
  id v4 = a3;
  trendingTopics = self->_trendingTopics;
  id v8 = v4;
  if (!trendingTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_trendingTopics;
    self->_trendingTopics = v6;

    id v4 = v8;
    trendingTopics = self->_trendingTopics;
  }
  [(NSMutableArray *)trendingTopics addObject:v4];
}

- (unint64_t)trendingTopicsCount
{
  return [(NSMutableArray *)self->_trendingTopics count];
}

- (id)trendingTopicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_trendingTopics objectAtIndex:a3];
}

+ (Class)trendingTopicsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTrendingLanguageConfig;
  id v4 = [(NTPBTrendingLanguageConfig *)&v8 description];
  v5 = [(NTPBTrendingLanguageConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  languageTag = self->_languageTag;
  if (languageTag) {
    [v3 setObject:languageTag forKey:@"language_tag"];
  }
  trendingTopics = self->_trendingTopics;
  if (trendingTopics) {
    [v4 setObject:trendingTopics forKey:@"trending_topics"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTrendingLanguageConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_languageTag) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_trendingTopics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_languageTag copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_trendingTopics;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addTrendingTopics:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((languageTag = self->_languageTag, !((unint64_t)languageTag | v4[1]))
     || -[NSString isEqual:](languageTag, "isEqual:")))
  {
    trendingTopics = self->_trendingTopics;
    if ((unint64_t)trendingTopics | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](trendingTopics, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_languageTag hash];
  return [(NSMutableArray *)self->_trendingTopics hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NTPBTrendingLanguageConfig setLanguageTag:](self, "setLanguageTag:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTPBTrendingLanguageConfig addTrendingTopics:](self, "addTrendingTopics:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (NSMutableArray)trendingTopics
{
  return self->_trendingTopics;
}

- (void)setTrendingTopics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingTopics, 0);

  objc_storeStrong((id *)&self->_languageTag, 0);
}

@end