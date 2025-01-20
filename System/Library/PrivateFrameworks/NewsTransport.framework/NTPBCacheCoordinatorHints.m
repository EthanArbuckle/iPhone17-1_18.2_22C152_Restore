@interface NTPBCacheCoordinatorHints
+ (Class)cacheHintsType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cacheHints;
- (id)cacheHintsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (unint64_t)cacheHintsCount;
- (unint64_t)hash;
- (void)addCacheHints:(id)a3;
- (void)clearCacheHints;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCacheHints:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCacheCoordinatorHints

- (void)dealloc
{
  [(NTPBCacheCoordinatorHints *)self setCacheHints:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheCoordinatorHints;
  [(NTPBCacheCoordinatorHints *)&v3 dealloc];
}

- (void)setCacheHints:(id)a3
{
}

- (void)addCacheHints:(id)a3
{
  cacheHints = self->_cacheHints;
  if (!cacheHints)
  {
    cacheHints = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_cacheHints = cacheHints;
  }

  [(NSMutableArray *)cacheHints addObject:a3];
}

- (NSMutableArray)cacheHints
{
  return self->_cacheHints;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearCacheHints
{
}

- (unint64_t)cacheHintsCount
{
  return [(NSMutableArray *)self->_cacheHints count];
}

- (id)cacheHintsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cacheHints objectAtIndex:a3];
}

+ (Class)cacheHintsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheCoordinatorHints;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBCacheCoordinatorHints description](&v3, sel_description), -[NTPBCacheCoordinatorHints dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_version), @"version");
  }
  if ([(NSMutableArray *)self->_cacheHints count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cacheHints, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    cacheHints = self->_cacheHints;
    uint64_t v6 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(cacheHints);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"cacheHints"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCacheCoordinatorHintsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  cacheHints = self->_cacheHints;
  uint64_t v5 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(cacheHints);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_version;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  cacheHints = self->_cacheHints;
  uint64_t v8 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(cacheHints);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addCacheHints:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)cacheHints countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_version != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    cacheHints = self->_cacheHints;
    if ((unint64_t)cacheHints | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](cacheHints, "isEqual:");
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
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_version;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_cacheHints hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 24))
  {
    self->_version = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = (void *)*((void *)a3 + 2);
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
        [(NTPBCacheCoordinatorHints *)self addCacheHints:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end