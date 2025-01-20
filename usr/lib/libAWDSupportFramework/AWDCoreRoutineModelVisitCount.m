@interface AWDCoreRoutineModelVisitCount
+ (Class)visitsType;
- (BOOL)hasCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)visits;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)visitsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)visitsCount;
- (unsigned)count;
- (void)addVisits:(id)a3;
- (void)clearVisits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVisits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineModelVisitCount

- (void)dealloc
{
  [(AWDCoreRoutineModelVisitCount *)self setVisits:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelVisitCount;
  [(AWDCoreRoutineModelVisitCount *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearVisits
{
}

- (void)addVisits:(id)a3
{
  visits = self->_visits;
  if (!visits)
  {
    visits = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_visits = visits;
  }

  [(NSMutableArray *)visits addObject:a3];
}

- (unint64_t)visitsCount
{
  return [(NSMutableArray *)self->_visits count];
}

- (id)visitsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visits objectAtIndex:a3];
}

+ (Class)visitsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelVisitCount;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineModelVisitCount description](&v3, sel_description), -[AWDCoreRoutineModelVisitCount dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_count] forKey:@"count"];
  }
  if ([(NSMutableArray *)self->_visits count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_visits, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    visits = self->_visits;
    uint64_t v7 = [(NSMutableArray *)visits countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(visits);
          }
          [v5 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)visits countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"visits"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelVisitCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  visits = self->_visits;
  uint64_t v6 = [(NSMutableArray *)visits countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(visits);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)visits countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_count;
    *((unsigned char *)a3 + 32) |= 2u;
  }
  if ([(AWDCoreRoutineModelVisitCount *)self visitsCount])
  {
    [a3 clearVisits];
    unint64_t v6 = [(AWDCoreRoutineModelVisitCount *)self visitsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addVisits:-[AWDCoreRoutineModelVisitCount visitsAtIndex:](self, "visitsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_count;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  visits = self->_visits;
  uint64_t v9 = [(NSMutableArray *)visits countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(visits);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addVisits:v13];
      }
      uint64_t v10 = [(NSMutableArray *)visits countByEnumeratingWithState:&v15 objects:v19 count:16];
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
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_count != *((_DWORD *)a3 + 4)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_14;
    }
    visits = self->_visits;
    if ((unint64_t)visits | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](visits, "isEqual:");
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSMutableArray *)self->_visits hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_count;
  return v3 ^ v2 ^ [(NSMutableArray *)self->_visits hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v4 = *((unsigned char *)a3 + 32);
  if (v4)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 32);
  }
  if ((v4 & 2) != 0)
  {
    self->_count = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 3);
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
        [(AWDCoreRoutineModelVisitCount *)self addVisits:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)count
{
  return self->_count;
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
}

@end