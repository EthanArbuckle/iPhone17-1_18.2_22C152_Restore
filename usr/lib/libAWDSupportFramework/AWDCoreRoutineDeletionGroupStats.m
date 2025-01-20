@interface AWDCoreRoutineDeletionGroupStats
+ (Class)recordsType;
- (BOOL)hasItemType;
- (BOOL)hasOldestRecordAgeInDays;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)records;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recordsCount;
- (unsigned)itemType;
- (unsigned)oldestRecordAgeInDays;
- (void)addRecords:(id)a3;
- (void)clearRecords;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasOldestRecordAgeInDays:(BOOL)a3;
- (void)setItemType:(unsigned int)a3;
- (void)setOldestRecordAgeInDays:(unsigned int)a3;
- (void)setRecords:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineDeletionGroupStats

- (void)dealloc
{
  [(AWDCoreRoutineDeletionGroupStats *)self setRecords:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionGroupStats;
  [(AWDCoreRoutineDeletionGroupStats *)&v3 dealloc];
}

- (void)setItemType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOldestRecordAgeInDays:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_oldestRecordAgeInDays = a3;
}

- (void)setHasOldestRecordAgeInDays:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOldestRecordAgeInDays
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearRecords
{
}

- (void)addRecords:(id)a3
{
  records = self->_records;
  if (!records)
  {
    records = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_records = records;
  }

  [(NSMutableArray *)records addObject:a3];
}

- (unint64_t)recordsCount
{
  return [(NSMutableArray *)self->_records count];
}

- (id)recordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_records objectAtIndex:a3];
}

+ (Class)recordsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionGroupStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineDeletionGroupStats description](&v3, sel_description), -[AWDCoreRoutineDeletionGroupStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_itemType] forKey:@"itemType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_oldestRecordAgeInDays] forKey:@"oldestRecordAgeInDays"];
  }
  if ([(NSMutableArray *)self->_records count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_records, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    records = self->_records;
    uint64_t v7 = [(NSMutableArray *)records countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(records);
          }
          [v5 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)records countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"records"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionGroupStatsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  records = self->_records;
  uint64_t v6 = [(NSMutableArray *)records countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(records);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)records countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_itemType;
    *((unsigned char *)a3 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_oldestRecordAgeInDays;
    *((unsigned char *)a3 + 24) |= 2u;
  }
  if ([(AWDCoreRoutineDeletionGroupStats *)self recordsCount])
  {
    [a3 clearRecords];
    unint64_t v6 = [(AWDCoreRoutineDeletionGroupStats *)self recordsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addRecords:-[AWDCoreRoutineDeletionGroupStats recordsAtIndex:](self, "recordsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_itemType;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_oldestRecordAgeInDays;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  records = self->_records;
  uint64_t v9 = [(NSMutableArray *)records countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(records);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addRecords:v13];
      }
      uint64_t v10 = [(NSMutableArray *)records countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
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
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_itemType != *((_DWORD *)a3 + 2)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_oldestRecordAgeInDays != *((_DWORD *)a3 + 3)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_14;
    }
    records = self->_records;
    if ((unint64_t)records | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](records, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_itemType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSMutableArray *)self->_records hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_oldestRecordAgeInDays;
  return v3 ^ v2 ^ [(NSMutableArray *)self->_records hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v4 = *((unsigned char *)a3 + 24);
  if (v4)
  {
    self->_itemType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_oldestRecordAgeInDays = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
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
        [(AWDCoreRoutineDeletionGroupStats *)self addRecords:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (unsigned)oldestRecordAgeInDays
{
  return self->_oldestRecordAgeInDays;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

@end