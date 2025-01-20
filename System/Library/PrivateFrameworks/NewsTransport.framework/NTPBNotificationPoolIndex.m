@interface NTPBNotificationPoolIndex
+ (Class)entriesType;
- (BOOL)hasCreationDate;
- (BOOL)hasIsPaidVariant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidVariant;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)entries;
- (NTPBDate)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entriesAtIndex:(unint64_t)a3;
- (unint64_t)entriesCount;
- (unint64_t)hash;
- (void)addEntries:(id)a3;
- (void)clearEntries;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEntries:(id)a3;
- (void)setHasIsPaidVariant:(BOOL)a3;
- (void)setIsPaidVariant:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationPoolIndex

- (void)dealloc
{
  [(NTPBNotificationPoolIndex *)self setCreationDate:0];
  [(NTPBNotificationPoolIndex *)self setEntries:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationPoolIndex;
  [(NTPBNotificationPoolIndex *)&v3 dealloc];
}

- (BOOL)hasCreationDate
{
  return self->_creationDate != 0;
}

- (void)setIsPaidVariant:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isPaidVariant = a3;
}

- (void)setHasIsPaidVariant:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPaidVariant
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearEntries
{
}

- (void)addEntries:(id)a3
{
  entries = self->_entries;
  if (!entries)
  {
    entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_entries = entries;
  }

  [(NSMutableArray *)entries addObject:a3];
}

- (unint64_t)entriesCount
{
  return [(NSMutableArray *)self->_entries count];
}

- (id)entriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entries objectAtIndex:a3];
}

+ (Class)entriesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationPoolIndex;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNotificationPoolIndex description](&v3, sel_description), -[NTPBNotificationPoolIndex dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  creationDate = self->_creationDate;
  if (creationDate) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](creationDate, "dictionaryRepresentation"), @"creationDate");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isPaidVariant), @"isPaidVariant");
  }
  if ([(NSMutableArray *)self->_entries count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_entries, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    entries = self->_entries;
    uint64_t v7 = [(NSMutableArray *)entries countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(entries);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v8 = [(NSMutableArray *)entries countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"entries"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationPoolIndexReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_creationDate) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  entries = self->_entries;
  uint64_t v5 = [(NSMutableArray *)entries countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(entries);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)entries countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 8) = [(NTPBDate *)self->_creationDate copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isPaidVariant;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  entries = self->_entries;
  uint64_t v7 = [(NSMutableArray *)entries countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(entries);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addEntries:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)entries countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  creationDate = self->_creationDate;
  if ((unint64_t)creationDate | *((void *)a3 + 1))
  {
    int v5 = -[NTPBDate isEqual:](creationDate, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)a3 + 28))
    {
      if (self->_isPaidVariant)
      {
        if (*((unsigned char *)a3 + 24)) {
          goto LABEL_13;
        }
      }
      else if (!*((unsigned char *)a3 + 24))
      {
        goto LABEL_13;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (*((unsigned char *)a3 + 28)) {
    goto LABEL_8;
  }
LABEL_13:
  entries = self->_entries;
  if ((unint64_t)entries | *((void *)a3 + 2))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](entries, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBDate *)self->_creationDate hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isPaidVariant;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSMutableArray *)self->_entries hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  creationDate = self->_creationDate;
  uint64_t v6 = *((void *)a3 + 1);
  if (creationDate)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](creationDate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBNotificationPoolIndex setCreationDate:](self, "setCreationDate:");
  }
  if (*((unsigned char *)a3 + 28))
  {
    self->_isPaidVariant = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 2);
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
        [(NTPBNotificationPoolIndex *)self addEntries:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NTPBDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)isPaidVariant
{
  return self->_isPaidVariant;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

@end