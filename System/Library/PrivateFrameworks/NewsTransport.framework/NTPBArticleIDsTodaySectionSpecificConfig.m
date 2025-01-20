@interface NTPBArticleIDsTodaySectionSpecificConfig
+ (Class)articlesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)articles;
- (id)articlesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)articlesCount;
- (unint64_t)hash;
- (void)addArticles:(id)a3;
- (void)clearArticles;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleIDsTodaySectionSpecificConfig

- (void)dealloc
{
  [(NTPBArticleIDsTodaySectionSpecificConfig *)self setArticles:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleIDsTodaySectionSpecificConfig;
  [(NTPBArticleIDsTodaySectionSpecificConfig *)&v3 dealloc];
}

- (void)clearArticles
{
}

- (void)addArticles:(id)a3
{
  articles = self->_articles;
  if (!articles)
  {
    articles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_articles = articles;
  }

  [(NSMutableArray *)articles addObject:a3];
}

- (unint64_t)articlesCount
{
  return [(NSMutableArray *)self->_articles count];
}

- (id)articlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articles objectAtIndex:a3];
}

+ (Class)articlesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleIDsTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBArticleIDsTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBArticleIDsTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_articles count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_articles, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    articles = self->_articles;
    uint64_t v6 = [(NSMutableArray *)articles countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(articles);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)articles countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"articles"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleIDsTodaySectionSpecificConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  articles = self->_articles;
  uint64_t v4 = [(NSMutableArray *)articles countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(articles);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v5 = [(NSMutableArray *)articles countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  articles = self->_articles;
  uint64_t v7 = [(NSMutableArray *)articles countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(articles);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addArticles:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)articles countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    articles = self->_articles;
    if ((unint64_t)articles | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](articles, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_articles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = (void *)*((void *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NTPBArticleIDsTodaySectionSpecificConfig *)self addArticles:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)articles
{
  return self->_articles;
}

- (void)setArticles:(id)a3
{
}

@end