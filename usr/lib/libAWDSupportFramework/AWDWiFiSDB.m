@interface AWDWiFiSDB
+ (Class)sliceStatsType;
- (BOOL)hasRealTimeSessionStateResultingInSubmission;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sliceStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sliceStatsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sliceStatsCount;
- (unint64_t)timestamp;
- (unsigned)realTimeSessionStateResultingInSubmission;
- (void)addSliceStats:(id)a3;
- (void)clearSliceStats;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasRealTimeSessionStateResultingInSubmission:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRealTimeSessionStateResultingInSubmission:(unsigned int)a3;
- (void)setSliceStats:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiSDB

- (void)dealloc
{
  [(AWDWiFiSDB *)self setSliceStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSDB;
  [(AWDWiFiSDB *)&v3 dealloc];
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

- (void)clearSliceStats
{
}

- (void)addSliceStats:(id)a3
{
  sliceStats = self->_sliceStats;
  if (!sliceStats)
  {
    sliceStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_sliceStats = sliceStats;
  }

  [(NSMutableArray *)sliceStats addObject:a3];
}

- (unint64_t)sliceStatsCount
{
  return [(NSMutableArray *)self->_sliceStats count];
}

- (id)sliceStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sliceStats objectAtIndex:a3];
}

+ (Class)sliceStatsType
{
  return (Class)objc_opt_class();
}

- (void)setRealTimeSessionStateResultingInSubmission:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_realTimeSessionStateResultingInSubmission = a3;
}

- (void)setHasRealTimeSessionStateResultingInSubmission:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRealTimeSessionStateResultingInSubmission
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSDB;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiSDB description](&v3, sel_description), -[AWDWiFiSDB dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_sliceStats count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_sliceStats, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    sliceStats = self->_sliceStats;
    uint64_t v6 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(sliceStats);
          }
          [v4 addObject:[*(id *)(*((void *)&v11 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"sliceStats"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_realTimeSessionStateResultingInSubmission] forKey:@"realTimeSessionStateResultingInSubmission"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSDBReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  sliceStats = self->_sliceStats;
  uint64_t v5 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(sliceStats);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if ([(AWDWiFiSDB *)self sliceStatsCount])
  {
    [a3 clearSliceStats];
    unint64_t v5 = [(AWDWiFiSDB *)self sliceStatsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSliceStats:-[AWDWiFiSDB sliceStatsAtIndex:](self, "sliceStatsAtIndex:", i)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_realTimeSessionStateResultingInSubmission;
    *((unsigned char *)a3 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  sliceStats = self->_sliceStats;
  uint64_t v8 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(sliceStats);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSliceStats:v12];
      }
      uint64_t v9 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_realTimeSessionStateResultingInSubmission;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
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
    sliceStats = self->_sliceStats;
    if ((unint64_t)sliceStats | *((void *)a3 + 3))
    {
      int v5 = -[NSMutableArray isEqual:](sliceStats, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_realTimeSessionStateResultingInSubmission != *((_DWORD *)a3 + 4)) {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_sliceStats hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_realTimeSessionStateResultingInSubmission;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 3);
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
        [(AWDWiFiSDB *)self addSliceStats:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if ((*((unsigned char *)a3 + 32) & 2) != 0)
  {
    self->_realTimeSessionStateResultingInSubmission = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)sliceStats
{
  return self->_sliceStats;
}

- (void)setSliceStats:(id)a3
{
}

- (unsigned)realTimeSessionStateResultingInSubmission
{
  return self->_realTimeSessionStateResultingInSubmission;
}

@end