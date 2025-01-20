@interface PPPBContactNameRecordCache
+ (Class)recordsType;
- (BOOL)hasCreatedAt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)records;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordsAtIndex:(unint64_t)a3;
- (int64_t)createdAt;
- (unint64_t)hash;
- (unint64_t)recordsCount;
- (void)addRecords:(id)a3;
- (void)clearRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreatedAt:(int64_t)a3;
- (void)setHasCreatedAt:(BOOL)a3;
- (void)setRecords:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBContactNameRecordCache

- (void).cxx_destruct
{
}

- (int64_t)createdAt
{
  return self->_createdAt;
}

- (void)setRecords:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[PPPBContactNameRecordCache addRecords:](self, "addRecords:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_createdAt = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_records hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_createdAt;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  records = self->_records;
  if ((unint64_t)records | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](records, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_createdAt == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = self->_records;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addRecords:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_createdAt;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(PPPBContactNameRecordCache *)self recordsCount])
  {
    [v8 clearRecords];
    unint64_t v4 = [(PPPBContactNameRecordCache *)self recordsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PPPBContactNameRecordCache *)self recordsAtIndex:i];
        [v8 addRecords:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_createdAt;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_records;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBContactNameRecordCacheReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_records count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v5 = self->_records;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"records"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v11 = [NSNumber numberWithLongLong:self->_createdAt];
    [v3 setObject:v11 forKey:@"created_at"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBContactNameRecordCache;
  id v4 = [(PPPBContactNameRecordCache *)&v8 description];
  unint64_t v5 = [(PPPBContactNameRecordCache *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCreatedAt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreatedAt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreatedAt:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdAt = a3;
}

- (id)recordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_records objectAtIndex:a3];
}

- (unint64_t)recordsCount
{
  return [(NSMutableArray *)self->_records count];
}

- (void)addRecords:(id)a3
{
  id v4 = a3;
  records = self->_records;
  id v8 = v4;
  if (!records)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_records;
    self->_records = v6;

    id v4 = v8;
    records = self->_records;
  }
  [(NSMutableArray *)records addObject:v4];
}

- (void)clearRecords
{
}

+ (Class)recordsType
{
  return (Class)objc_opt_class();
}

@end