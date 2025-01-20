@interface NTPBWidgetSectionConfigRecord
+ (Class)articleIDs2Type;
+ (Class)articleListIDs2Type;
- (BOOL)hasBase;
- (BOOL)hasConfiguration2;
- (BOOL)hasSingleTagConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)articleIDs2s;
- (NSMutableArray)articleListIDs2s;
- (NSString)configuration2;
- (NSString)singleTagConfiguration;
- (NTPBRecordBase)base;
- (id)articleIDs2AtIndex:(unint64_t)a3;
- (id)articleListIDs2AtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)articleIDs2sCount;
- (unint64_t)articleListIDs2sCount;
- (unint64_t)hash;
- (void)addArticleIDs2:(id)a3;
- (void)addArticleListIDs2:(id)a3;
- (void)clearArticleIDs2s;
- (void)clearArticleListIDs2s;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleIDs2s:(id)a3;
- (void)setArticleListIDs2s:(id)a3;
- (void)setBase:(id)a3;
- (void)setConfiguration2:(id)a3;
- (void)setSingleTagConfiguration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWidgetSectionConfigRecord

- (void)dealloc
{
  [(NTPBWidgetSectionConfigRecord *)self setBase:0];
  [(NTPBWidgetSectionConfigRecord *)self setConfiguration2:0];
  [(NTPBWidgetSectionConfigRecord *)self setArticleListIDs2s:0];
  [(NTPBWidgetSectionConfigRecord *)self setArticleIDs2s:0];
  [(NTPBWidgetSectionConfigRecord *)self setSingleTagConfiguration:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionConfigRecord;
  [(NTPBWidgetSectionConfigRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration2
{
  return self->_configuration2 != 0;
}

- (void)clearArticleListIDs2s
{
}

- (void)addArticleListIDs2:(id)a3
{
  articleListIDs2s = self->_articleListIDs2s;
  if (!articleListIDs2s)
  {
    articleListIDs2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_articleListIDs2s = articleListIDs2s;
  }

  [(NSMutableArray *)articleListIDs2s addObject:a3];
}

- (unint64_t)articleListIDs2sCount
{
  return [(NSMutableArray *)self->_articleListIDs2s count];
}

- (id)articleListIDs2AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleListIDs2s objectAtIndex:a3];
}

+ (Class)articleListIDs2Type
{
  return (Class)objc_opt_class();
}

- (void)clearArticleIDs2s
{
}

- (void)addArticleIDs2:(id)a3
{
  articleIDs2s = self->_articleIDs2s;
  if (!articleIDs2s)
  {
    articleIDs2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_articleIDs2s = articleIDs2s;
  }

  [(NSMutableArray *)articleIDs2s addObject:a3];
}

- (unint64_t)articleIDs2sCount
{
  return [(NSMutableArray *)self->_articleIDs2s count];
}

- (id)articleIDs2AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleIDs2s objectAtIndex:a3];
}

+ (Class)articleIDs2Type
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSingleTagConfiguration
{
  return self->_singleTagConfiguration != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionConfigRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBWidgetSectionConfigRecord description](&v3, sel_description), -[NTPBWidgetSectionConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  configuration2 = self->_configuration2;
  if (configuration2) {
    [v3 setObject:configuration2 forKey:@"configuration2"];
  }
  articleListIDs2s = self->_articleListIDs2s;
  if (articleListIDs2s) {
    [v3 setObject:articleListIDs2s forKey:@"articleListIDs2"];
  }
  articleIDs2s = self->_articleIDs2s;
  if (articleIDs2s) {
    [v3 setObject:articleIDs2s forKey:@"articleIDs2"];
  }
  singleTagConfiguration = self->_singleTagConfiguration;
  if (singleTagConfiguration) {
    [v3 setObject:singleTagConfiguration forKey:@"singleTagConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetSectionConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_configuration2) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  articleListIDs2s = self->_articleListIDs2s;
  uint64_t v5 = [(NSMutableArray *)articleListIDs2s countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(articleListIDs2s);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)articleListIDs2s countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  articleIDs2s = self->_articleIDs2s;
  uint64_t v10 = [(NSMutableArray *)articleIDs2s countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(articleIDs2s);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)articleIDs2s countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  if (self->_singleTagConfiguration) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  v5[4] = (id)[(NSString *)self->_configuration2 copyWithZone:a3];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  articleListIDs2s = self->_articleListIDs2s;
  uint64_t v7 = [(NSMutableArray *)articleListIDs2s countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(articleListIDs2s);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addArticleListIDs2:v11];
      }
      uint64_t v8 = [(NSMutableArray *)articleListIDs2s countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  articleIDs2s = self->_articleIDs2s;
  uint64_t v13 = [(NSMutableArray *)articleIDs2s countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(articleIDs2s);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [v5 addArticleIDs2:v17];
      }
      uint64_t v14 = [(NSMutableArray *)articleIDs2s countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  v5[5] = (id)[(NSString *)self->_singleTagConfiguration copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 3)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      configuration2 = self->_configuration2;
      if (!((unint64_t)configuration2 | *((void *)a3 + 4))
        || (int v5 = -[NSString isEqual:](configuration2, "isEqual:")) != 0)
      {
        articleListIDs2s = self->_articleListIDs2s;
        if (!((unint64_t)articleListIDs2s | *((void *)a3 + 2))
          || (int v5 = -[NSMutableArray isEqual:](articleListIDs2s, "isEqual:")) != 0)
        {
          articleIDs2s = self->_articleIDs2s;
          if (!((unint64_t)articleIDs2s | *((void *)a3 + 1))
            || (int v5 = -[NSMutableArray isEqual:](articleIDs2s, "isEqual:")) != 0)
          {
            singleTagConfiguration = self->_singleTagConfiguration;
            if ((unint64_t)singleTagConfiguration | *((void *)a3 + 5))
            {
              LOBYTE(v5) = -[NSString isEqual:](singleTagConfiguration, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_configuration2 hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_articleListIDs2s hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_articleIDs2s hash];
  return v6 ^ [(NSString *)self->_singleTagConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 3);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBWidgetSectionConfigRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 4)) {
    -[NTPBWidgetSectionConfigRecord setConfiguration2:](self, "setConfiguration2:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBWidgetSectionConfigRecord *)self addArticleListIDs2:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 1);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBWidgetSectionConfigRecord *)self addArticleIDs2:*(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
  if (*((void *)a3 + 5)) {
    -[NTPBWidgetSectionConfigRecord setSingleTagConfiguration:](self, "setSingleTagConfiguration:");
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)configuration2
{
  return self->_configuration2;
}

- (void)setConfiguration2:(id)a3
{
}

- (NSMutableArray)articleListIDs2s
{
  return self->_articleListIDs2s;
}

- (void)setArticleListIDs2s:(id)a3
{
}

- (NSMutableArray)articleIDs2s
{
  return self->_articleIDs2s;
}

- (void)setArticleIDs2s:(id)a3
{
}

- (NSString)singleTagConfiguration
{
  return self->_singleTagConfiguration;
}

- (void)setSingleTagConfiguration:(id)a3
{
}

@end