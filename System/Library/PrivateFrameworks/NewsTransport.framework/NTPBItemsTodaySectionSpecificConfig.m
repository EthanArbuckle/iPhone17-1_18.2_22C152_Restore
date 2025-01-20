@interface NTPBItemsTodaySectionSpecificConfig
+ (Class)itemsType;
- (BOOL)hasMaxArticlesShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (unint64_t)maxArticlesShown;
- (void)addItems:(id)a3;
- (void)clearItems;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxArticlesShown:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setMaxArticlesShown:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBItemsTodaySectionSpecificConfig

- (void)dealloc
{
  [(NTPBItemsTodaySectionSpecificConfig *)self setItems:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBItemsTodaySectionSpecificConfig;
  [(NTPBItemsTodaySectionSpecificConfig *)&v3 dealloc];
}

- (void)clearItems
{
}

- (void)addItems:(id)a3
{
  items = self->_items;
  if (!items)
  {
    items = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_items = items;
  }

  [(NSMutableArray *)items addObject:a3];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

- (void)setMaxArticlesShown:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxArticlesShown = a3;
}

- (void)setHasMaxArticlesShown:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxArticlesShown
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBItemsTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBItemsTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBItemsTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_items count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    items = self->_items;
    uint64_t v6 = [(NSMutableArray *)items countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(items);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)items countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"items"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_maxArticlesShown), @"max_articles_shown");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBItemsTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  items = self->_items;
  uint64_t v5 = [(NSMutableArray *)items countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(items);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)items countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
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
  items = self->_items;
  uint64_t v7 = [(NSMutableArray *)items countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(items);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addItems:v11];
      }
      uint64_t v8 = [(NSMutableArray *)items countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxArticlesShown;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    items = self->_items;
    if (!((unint64_t)items | *((void *)a3 + 2)) || (int v5 = -[NSMutableArray isEqual:](items, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_maxArticlesShown == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_items hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_maxArticlesShown;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [(NTPBItemsTodaySectionSpecificConfig *)self addItems:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_maxArticlesShown = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)maxArticlesShown
{
  return self->_maxArticlesShown;
}

@end