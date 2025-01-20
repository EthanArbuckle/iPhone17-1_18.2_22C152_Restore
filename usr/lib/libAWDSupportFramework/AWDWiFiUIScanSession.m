@interface AWDWiFiUIScanSession
+ (Class)countsType;
- (BOOL)hasDuration;
- (BOOL)hasProcess;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)counts;
- (NSString)process;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)countsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)duration;
- (void)addCounts:(id)a3;
- (void)clearCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCounts:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProcess:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiUIScanSession

- (void)dealloc
{
  [(AWDWiFiUIScanSession *)self setCounts:0];
  [(AWDWiFiUIScanSession *)self setProcess:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanSession;
  [(AWDWiFiUIScanSession *)&v3 dealloc];
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

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearCounts
{
}

- (void)addCounts:(id)a3
{
  counts = self->_counts;
  if (!counts)
  {
    counts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_counts = counts;
  }

  [(NSMutableArray *)counts addObject:a3];
}

- (unint64_t)countsCount
{
  return [(NSMutableArray *)self->_counts count];
}

- (id)countsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_counts objectAtIndex:a3];
}

+ (Class)countsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProcess
{
  return self->_process != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUIScanSession;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiUIScanSession description](&v3, sel_description), -[AWDWiFiUIScanSession dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
  }
  if ([(NSMutableArray *)self->_counts count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_counts, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    counts = self->_counts;
    uint64_t v7 = [(NSMutableArray *)counts countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(counts);
          }
          [v5 addObject:[(*(id *)(*((void *)&v13 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)counts countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"counts"];
  }
  process = self->_process;
  if (process) {
    [v3 setObject:process forKey:@"process"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUIScanSessionReadFrom((uint64_t)self, (uint64_t)a3);
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
  counts = self->_counts;
  uint64_t v6 = [(NSMutableArray *)counts countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(counts);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)counts countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (self->_process) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_duration;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if ([(AWDWiFiUIScanSession *)self countsCount])
  {
    [a3 clearCounts];
    unint64_t v6 = [(AWDWiFiUIScanSession *)self countsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addCounts:-[AWDWiFiUIScanSession countsAtIndex:](self, "countsAtIndex:", i)];
    }
  }
  if (self->_process)
  {
    [a3 setProcess:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (id *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_duration;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  counts = self->_counts;
  uint64_t v9 = [(NSMutableArray *)counts countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(counts);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addCounts:v13];
      }
      uint64_t v10 = [(NSMutableArray *)counts countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v6[4] = (id)[(NSString *)self->_process copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_duration != *((_DWORD *)a3 + 6)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_16;
    }
    counts = self->_counts;
    if (!((unint64_t)counts | *((void *)a3 + 2)) || (int v5 = -[NSMutableArray isEqual:](counts, "isEqual:")) != 0)
    {
      process = self->_process;
      if ((unint64_t)process | *((void *)a3 + 4))
      {
        LOBYTE(v5) = -[NSString isEqual:](process, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_duration;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_counts hash];
  return v5 ^ [(NSString *)self->_process hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 40);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_duration = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = (void *)*((void *)a3 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiUIScanSession *)self addCounts:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if (*((void *)a3 + 4)) {
    -[AWDWiFiUIScanSession setProcess:](self, "setProcess:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
}

- (NSString)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

@end