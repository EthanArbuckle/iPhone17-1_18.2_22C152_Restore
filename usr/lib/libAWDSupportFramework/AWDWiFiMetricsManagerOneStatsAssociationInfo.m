@interface AWDWiFiMetricsManagerOneStatsAssociationInfo
+ (Class)chipCountersPerSliceType;
- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange;
- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats;
- (AWDWiFiMetricsManagerChipCounters)chipCounters;
- (BOOL)hasBtCoexModeChange;
- (BOOL)hasBtCoexStats;
- (BOOL)hasChipCounters;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)chipCountersPerSlices;
- (id)chipCountersPerSliceAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)chipCountersPerSlicesCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addChipCountersPerSlice:(id)a3;
- (void)clearChipCountersPerSlices;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBtCoexModeChange:(id)a3;
- (void)setBtCoexStats:(id)a3;
- (void)setChipCounters:(id)a3;
- (void)setChipCountersPerSlices:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerOneStatsAssociationInfo

- (void)dealloc
{
  [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self setChipCounters:0];
  [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self setBtCoexStats:0];
  [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self setBtCoexModeChange:0];
  [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self setChipCountersPerSlices:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerOneStatsAssociationInfo;
  [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)&v3 dealloc];
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

- (BOOL)hasChipCounters
{
  return self->_chipCounters != 0;
}

- (BOOL)hasBtCoexStats
{
  return self->_btCoexStats != 0;
}

- (BOOL)hasBtCoexModeChange
{
  return self->_btCoexModeChange != 0;
}

- (void)clearChipCountersPerSlices
{
}

- (void)addChipCountersPerSlice:(id)a3
{
  chipCountersPerSlices = self->_chipCountersPerSlices;
  if (!chipCountersPerSlices)
  {
    chipCountersPerSlices = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_chipCountersPerSlices = chipCountersPerSlices;
  }

  [(NSMutableArray *)chipCountersPerSlices addObject:a3];
}

- (unint64_t)chipCountersPerSlicesCount
{
  return [(NSMutableArray *)self->_chipCountersPerSlices count];
}

- (id)chipCountersPerSliceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chipCountersPerSlices objectAtIndex:a3];
}

+ (Class)chipCountersPerSliceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerOneStatsAssociationInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerOneStatsAssociationInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerOneStatsAssociationInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  chipCounters = self->_chipCounters;
  if (chipCounters) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](chipCounters, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"chipCounters"];
  }
  btCoexStats = self->_btCoexStats;
  if (btCoexStats) {
    [v3 setObject:-[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](btCoexStats, "dictionaryRepresentation") forKey:@"btCoexStats"];
  }
  btCoexModeChange = self->_btCoexModeChange;
  if (btCoexModeChange) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](btCoexModeChange, "dictionaryRepresentation")] forKey:@"btCoexModeChange"];
  }
  if ([(NSMutableArray *)self->_chipCountersPerSlices count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_chipCountersPerSlices, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    chipCountersPerSlices = self->_chipCountersPerSlices;
    uint64_t v9 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(chipCountersPerSlices);
          }
          [v7 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"chipCountersPerSlice"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerOneStatsAssociationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_chipCounters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btCoexStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btCoexModeChange) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  uint64_t v5 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(chipCountersPerSlices);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if (self->_chipCounters) {
    [a3 setChipCounters:];
  }
  if (self->_btCoexStats) {
    [a3 setBtCoexStats:];
  }
  if (self->_btCoexModeChange) {
    [a3 setBtCoexModeChange:];
  }
  if ([(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self chipCountersPerSlicesCount])
  {
    [a3 clearChipCountersPerSlices];
    unint64_t v5 = [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self chipCountersPerSlicesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addChipCountersPerSlice:-[AWDWiFiMetricsManagerOneStatsAssociationInfo chipCountersPerSliceAtIndex:](self, "chipCountersPerSliceAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }

  *(void *)(v6 + 32) = [(AWDWiFiMetricsManagerChipCounters *)self->_chipCounters copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDWiFiMetricsManagerBTCoexStats *)self->_btCoexStats copyWithZone:a3];

  *(void *)(v6 + 16) = [(AWDWiFiMetricsManagerBTCoexModeChange *)self->_btCoexModeChange copyWithZone:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  chipCountersPerSlices = self->_chipCountersPerSlices;
  uint64_t v8 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(chipCountersPerSlices);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v6 addChipCountersPerSlice:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)chipCountersPerSlices countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    chipCounters = self->_chipCounters;
    if (!((unint64_t)chipCounters | *((void *)a3 + 4))
      || (int v5 = -[AWDWiFiMetricsManagerChipCounters isEqual:](chipCounters, "isEqual:")) != 0)
    {
      btCoexStats = self->_btCoexStats;
      if (!((unint64_t)btCoexStats | *((void *)a3 + 3))
        || (int v5 = -[AWDWiFiMetricsManagerBTCoexStats isEqual:](btCoexStats, "isEqual:")) != 0)
      {
        btCoexModeChange = self->_btCoexModeChange;
        if (!((unint64_t)btCoexModeChange | *((void *)a3 + 2))
          || (int v5 = -[AWDWiFiMetricsManagerBTCoexModeChange isEqual:](btCoexModeChange, "isEqual:")) != 0)
        {
          chipCountersPerSlices = self->_chipCountersPerSlices;
          if ((unint64_t)chipCountersPerSlices | *((void *)a3 + 5))
          {
            LOBYTE(v5) = -[NSMutableArray isEqual:](chipCountersPerSlices, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
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
  unint64_t v4 = [(AWDWiFiMetricsManagerChipCounters *)self->_chipCounters hash] ^ v3;
  unint64_t v5 = [(AWDWiFiMetricsManagerBTCoexStats *)self->_btCoexStats hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDWiFiMetricsManagerBTCoexModeChange *)self->_btCoexModeChange hash];
  return v6 ^ [(NSMutableArray *)self->_chipCountersPerSlices hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  chipCounters = self->_chipCounters;
  uint64_t v6 = *((void *)a3 + 4);
  if (chipCounters)
  {
    if (v6) {
      -[AWDWiFiMetricsManagerChipCounters mergeFrom:](chipCounters, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setChipCounters:](self, "setChipCounters:");
  }
  btCoexStats = self->_btCoexStats;
  uint64_t v8 = *((void *)a3 + 3);
  if (btCoexStats)
  {
    if (v8) {
      -[AWDWiFiMetricsManagerBTCoexStats mergeFrom:](btCoexStats, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexStats:](self, "setBtCoexStats:");
  }
  btCoexModeChange = self->_btCoexModeChange;
  uint64_t v10 = *((void *)a3 + 2);
  if (btCoexModeChange)
  {
    if (v10) {
      -[AWDWiFiMetricsManagerBTCoexModeChange mergeFrom:](btCoexModeChange, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerOneStatsAssociationInfo setBtCoexModeChange:](self, "setBtCoexModeChange:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDWiFiMetricsManagerOneStatsAssociationInfo *)self addChipCountersPerSlice:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerChipCounters)chipCounters
{
  return self->_chipCounters;
}

- (void)setChipCounters:(id)a3
{
}

- (AWDWiFiMetricsManagerBTCoexStats)btCoexStats
{
  return self->_btCoexStats;
}

- (void)setBtCoexStats:(id)a3
{
}

- (AWDWiFiMetricsManagerBTCoexModeChange)btCoexModeChange
{
  return self->_btCoexModeChange;
}

- (void)setBtCoexModeChange:(id)a3
{
}

- (NSMutableArray)chipCountersPerSlices
{
  return self->_chipCountersPerSlices;
}

- (void)setChipCountersPerSlices:(id)a3
{
}

@end