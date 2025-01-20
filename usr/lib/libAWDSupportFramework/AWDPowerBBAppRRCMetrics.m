@interface AWDPowerBBAppRRCMetrics
+ (Class)appConnStatsType;
- (BOOL)hasNumRRCConnections;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appConnStats;
- (id)appConnStatsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appConnStatsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numRRCConnections;
- (void)addAppConnStats:(id)a3;
- (void)clearAppConnStats;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppConnStats:(id)a3;
- (void)setHasNumRRCConnections:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumRRCConnections:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBAppRRCMetrics

- (void)dealloc
{
  [(AWDPowerBBAppRRCMetrics *)self setAppConnStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBAppRRCMetrics;
  [(AWDPowerBBAppRRCMetrics *)&v3 dealloc];
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

- (void)clearAppConnStats
{
}

- (void)addAppConnStats:(id)a3
{
  appConnStats = self->_appConnStats;
  if (!appConnStats)
  {
    appConnStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_appConnStats = appConnStats;
  }

  [(NSMutableArray *)appConnStats addObject:a3];
}

- (unint64_t)appConnStatsCount
{
  return [(NSMutableArray *)self->_appConnStats count];
}

- (id)appConnStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appConnStats objectAtIndex:a3];
}

+ (Class)appConnStatsType
{
  return (Class)objc_opt_class();
}

- (void)setNumRRCConnections:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numRRCConnections = a3;
}

- (void)setHasNumRRCConnections:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumRRCConnections
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBAppRRCMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBAppRRCMetrics description](&v3, sel_description), -[AWDPowerBBAppRRCMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_appConnStats count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_appConnStats, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    appConnStats = self->_appConnStats;
    uint64_t v6 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(appConnStats);
          }
          [v4 addObject:[*(id *)(*((void *)&v11 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"appConnStats"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numRRCConnections] forKey:@"numRRCConnections"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBAppRRCMetricsReadFrom((uint64_t)self, (uint64_t)a3);
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
  appConnStats = self->_appConnStats;
  uint64_t v5 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(appConnStats);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v9 objects:v13 count:16];
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
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if ([(AWDPowerBBAppRRCMetrics *)self appConnStatsCount])
  {
    [a3 clearAppConnStats];
    unint64_t v5 = [(AWDPowerBBAppRRCMetrics *)self appConnStatsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addAppConnStats:-[AWDPowerBBAppRRCMetrics appConnStatsAtIndex:](self, "appConnStatsAtIndex:", i)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_numRRCConnections;
    *((unsigned char *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  appConnStats = self->_appConnStats;
  uint64_t v8 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(appConnStats);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addAppConnStats:v12];
      }
      uint64_t v9 = [(NSMutableArray *)appConnStats countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_numRRCConnections;
    *(unsigned char *)(v6 + 28) |= 2u;
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
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    appConnStats = self->_appConnStats;
    if ((unint64_t)appConnStats | *((void *)a3 + 2))
    {
      int v5 = -[NSMutableArray isEqual:](appConnStats, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_numRRCConnections != *((_DWORD *)a3 + 6)) {
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
  uint64_t v4 = [(NSMutableArray *)self->_appConnStats hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_numRRCConnections;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 2);
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
        [(AWDPowerBBAppRRCMetrics *)self addAppConnStats:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    self->_numRRCConnections = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)appConnStats
{
  return self->_appConnStats;
}

- (void)setAppConnStats:(id)a3
{
}

- (unsigned)numRRCConnections
{
  return self->_numRRCConnections;
}

@end