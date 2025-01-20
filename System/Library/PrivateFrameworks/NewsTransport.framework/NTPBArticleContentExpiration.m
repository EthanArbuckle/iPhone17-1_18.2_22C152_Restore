@interface NTPBArticleContentExpiration
+ (Class)tagsExpirationListType;
- (BOOL)hasGlobalExpireUtcTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tagsExpirationLists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tagsExpirationListAtIndex:(unint64_t)a3;
- (int64_t)globalExpireUtcTime;
- (unint64_t)hash;
- (unint64_t)tagsExpirationListsCount;
- (void)addTagsExpirationList:(id)a3;
- (void)clearTagsExpirationLists;
- (void)mergeFrom:(id)a3;
- (void)setGlobalExpireUtcTime:(int64_t)a3;
- (void)setHasGlobalExpireUtcTime:(BOOL)a3;
- (void)setTagsExpirationLists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleContentExpiration

- (void)setGlobalExpireUtcTime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_globalExpireUtcTime = a3;
}

- (void)setHasGlobalExpireUtcTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalExpireUtcTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearTagsExpirationLists
{
}

- (void)addTagsExpirationList:(id)a3
{
  id v4 = a3;
  tagsExpirationLists = self->_tagsExpirationLists;
  id v8 = v4;
  if (!tagsExpirationLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tagsExpirationLists;
    self->_tagsExpirationLists = v6;

    id v4 = v8;
    tagsExpirationLists = self->_tagsExpirationLists;
  }
  [(NSMutableArray *)tagsExpirationLists addObject:v4];
}

- (unint64_t)tagsExpirationListsCount
{
  return [(NSMutableArray *)self->_tagsExpirationLists count];
}

- (id)tagsExpirationListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tagsExpirationLists objectAtIndex:a3];
}

+ (Class)tagsExpirationListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleContentExpiration;
  id v4 = [(NTPBArticleContentExpiration *)&v8 description];
  v5 = [(NTPBArticleContentExpiration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_globalExpireUtcTime];
    [v3 setObject:v4 forKey:@"global_expire_utc_time"];
  }
  if ([(NSMutableArray *)self->_tagsExpirationLists count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_tagsExpirationLists, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_tagsExpirationLists;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"tags_expiration_list"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleContentExpirationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_tagsExpirationLists;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_globalExpireUtcTime;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_tagsExpirationLists;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addTagsExpirationList:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_globalExpireUtcTime != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  tagsExpirationLists = self->_tagsExpirationLists;
  if ((unint64_t)tagsExpirationLists | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](tagsExpirationLists, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_globalExpireUtcTime;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_tagsExpirationLists hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_globalExpireUtcTime = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBArticleContentExpiration addTagsExpirationList:](self, "addTagsExpirationList:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int64_t)globalExpireUtcTime
{
  return self->_globalExpireUtcTime;
}

- (NSMutableArray)tagsExpirationLists
{
  return self->_tagsExpirationLists;
}

- (void)setTagsExpirationLists:(id)a3
{
}

- (void).cxx_destruct
{
}

@end