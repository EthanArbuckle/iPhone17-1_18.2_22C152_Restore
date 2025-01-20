@interface NTPBPersonalizedTodaySectionSpecificConfig
+ (Class)mandatoryArticlesType;
+ (Class)personalizedArticlesType;
- (BOOL)hasMaxArticlesShown;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mandatoryArticles;
- (NSMutableArray)personalizedArticles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mandatoryArticlesAtIndex:(unint64_t)a3;
- (id)personalizedArticlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mandatoryArticlesCount;
- (unint64_t)maxArticlesShown;
- (unint64_t)personalizedArticlesCount;
- (void)addMandatoryArticles:(id)a3;
- (void)addPersonalizedArticles:(id)a3;
- (void)clearMandatoryArticles;
- (void)clearPersonalizedArticles;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxArticlesShown:(BOOL)a3;
- (void)setMandatoryArticles:(id)a3;
- (void)setMaxArticlesShown:(unint64_t)a3;
- (void)setPersonalizedArticles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizedTodaySectionSpecificConfig

- (void)dealloc
{
  [(NTPBPersonalizedTodaySectionSpecificConfig *)self setMandatoryArticles:0];
  [(NTPBPersonalizedTodaySectionSpecificConfig *)self setPersonalizedArticles:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedTodaySectionSpecificConfig;
  [(NTPBPersonalizedTodaySectionSpecificConfig *)&v3 dealloc];
}

- (void)clearMandatoryArticles
{
}

- (void)addMandatoryArticles:(id)a3
{
  mandatoryArticles = self->_mandatoryArticles;
  if (!mandatoryArticles)
  {
    mandatoryArticles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_mandatoryArticles = mandatoryArticles;
  }

  [(NSMutableArray *)mandatoryArticles addObject:a3];
}

- (unint64_t)mandatoryArticlesCount
{
  return [(NSMutableArray *)self->_mandatoryArticles count];
}

- (id)mandatoryArticlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mandatoryArticles objectAtIndex:a3];
}

+ (Class)mandatoryArticlesType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizedArticles
{
}

- (void)addPersonalizedArticles:(id)a3
{
  personalizedArticles = self->_personalizedArticles;
  if (!personalizedArticles)
  {
    personalizedArticles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_personalizedArticles = personalizedArticles;
  }

  [(NSMutableArray *)personalizedArticles addObject:a3];
}

- (unint64_t)personalizedArticlesCount
{
  return [(NSMutableArray *)self->_personalizedArticles count];
}

- (id)personalizedArticlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_personalizedArticles objectAtIndex:a3];
}

+ (Class)personalizedArticlesType
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
  v3.super_class = (Class)NTPBPersonalizedTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizedTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBPersonalizedTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_mandatoryArticles count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_mandatoryArticles, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    mandatoryArticles = self->_mandatoryArticles;
    uint64_t v6 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(mandatoryArticles);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"mandatory_articles"];
  }
  if ([(NSMutableArray *)self->_personalizedArticles count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_personalizedArticles, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    personalizedArticles = self->_personalizedArticles;
    uint64_t v12 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(personalizedArticles);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"personalized_articles"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_maxArticlesShown), @"max_articles_shown");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizedTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mandatoryArticles = self->_mandatoryArticles;
  uint64_t v5 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(mandatoryArticles);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  personalizedArticles = self->_personalizedArticles;
  uint64_t v10 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(personalizedArticles);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  mandatoryArticles = self->_mandatoryArticles;
  uint64_t v7 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(mandatoryArticles);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addMandatoryArticles:v11];
      }
      uint64_t v8 = [(NSMutableArray *)mandatoryArticles countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  personalizedArticles = self->_personalizedArticles;
  uint64_t v13 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(personalizedArticles);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addPersonalizedArticles:v17];
      }
      uint64_t v14 = [(NSMutableArray *)personalizedArticles countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_maxArticlesShown;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    mandatoryArticles = self->_mandatoryArticles;
    if (!((unint64_t)mandatoryArticles | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](mandatoryArticles, "isEqual:")) != 0)
    {
      personalizedArticles = self->_personalizedArticles;
      if (!((unint64_t)personalizedArticles | *((void *)a3 + 3))
        || (int v5 = -[NSMutableArray isEqual:](personalizedArticles, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
        if (*(unsigned char *)&self->_has) {
          LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) != 0 && self->_maxArticlesShown == *((void *)a3 + 1);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_mandatoryArticles hash];
  uint64_t v4 = [(NSMutableArray *)self->_personalizedArticles hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_maxArticlesShown;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBPersonalizedTodaySectionSpecificConfig *)self addMandatoryArticles:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBPersonalizedTodaySectionSpecificConfig *)self addPersonalizedArticles:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
  if (*((unsigned char *)a3 + 32))
  {
    self->_maxArticlesShown = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)mandatoryArticles
{
  return self->_mandatoryArticles;
}

- (void)setMandatoryArticles:(id)a3
{
}

- (NSMutableArray)personalizedArticles
{
  return self->_personalizedArticles;
}

- (void)setPersonalizedArticles:(id)a3
{
}

- (unint64_t)maxArticlesShown
{
  return self->_maxArticlesShown;
}

@end