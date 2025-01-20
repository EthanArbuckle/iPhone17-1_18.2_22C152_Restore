@interface NTPBArticleListRecord
+ (Class)articleIDsType;
- (BOOL)hasBase;
- (BOOL)hasMetadata;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)articleIDs;
- (NSString)metadata;
- (NTPBRecordBase)base;
- (id)articleIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)articleIDsCount;
- (unint64_t)hash;
- (void)addArticleIDs:(id)a3;
- (void)clearArticleIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleIDs:(id)a3;
- (void)setBase:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleListRecord

- (void)dealloc
{
  [(NTPBArticleListRecord *)self setBase:0];
  [(NTPBArticleListRecord *)self setArticleIDs:0];
  [(NTPBArticleListRecord *)self setMetadata:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListRecord;
  [(NTPBArticleListRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearArticleIDs
{
}

- (void)addArticleIDs:(id)a3
{
  articleIDs = self->_articleIDs;
  if (!articleIDs)
  {
    articleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_articleIDs = articleIDs;
  }

  [(NSMutableArray *)articleIDs addObject:a3];
}

- (unint64_t)articleIDsCount
{
  return [(NSMutableArray *)self->_articleIDs count];
}

- (id)articleIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_articleIDs objectAtIndex:a3];
}

+ (Class)articleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBArticleListRecord description](&v3, sel_description), -[NTPBArticleListRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_type), @"type");
  }
  articleIDs = self->_articleIDs;
  if (articleIDs) {
    [v3 setObject:articleIDs forKey:@"article_IDs"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v3 setObject:metadata forKey:@"metadata"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleListRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  articleIDs = self->_articleIDs;
  uint64_t v5 = [(NSMutableArray *)articleIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(articleIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)articleIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_metadata) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  articleIDs = self->_articleIDs;
  uint64_t v7 = [(NSMutableArray *)articleIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(articleIDs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addArticleIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)articleIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 24) = [(NSString *)self->_metadata copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 2)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_type != *((_DWORD *)a3 + 8)) {
          goto LABEL_13;
        }
      }
      else if (*((unsigned char *)a3 + 36))
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      articleIDs = self->_articleIDs;
      if (!((unint64_t)articleIDs | *((void *)a3 + 1))
        || (int v5 = -[NSMutableArray isEqual:](articleIDs, "isEqual:")) != 0)
      {
        metadata = self->_metadata;
        if ((unint64_t)metadata | *((void *)a3 + 3))
        {
          LOBYTE(v5) = -[NSString isEqual:](metadata, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSMutableArray *)self->_articleIDs hash];
  return v5 ^ v6 ^ [(NSString *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 2);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBArticleListRecord setBase:](self, "setBase:");
  }
  if (*((unsigned char *)a3 + 36))
  {
    self->_type = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBArticleListRecord *)self addArticleIDs:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  if (*((void *)a3 + 3)) {
    -[NTPBArticleListRecord setMetadata:](self, "setMetadata:");
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSMutableArray)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

@end