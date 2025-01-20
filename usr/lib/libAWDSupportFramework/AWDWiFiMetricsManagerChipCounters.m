@interface AWDWiFiMetricsManagerChipCounters
+ (Class)frameCounterPerInterfaceType;
- (AWDChipCountersRx)rxGeneralStats;
- (AWDChipCountersTx)txGeneralStats;
- (AWDChipErrorCountersTx)txErrorStats;
- (AWDMacCountersRx)rxMACCounterStats;
- (AWDMacCountersRxErrors)rxMACErrorStats;
- (AWDRxPhyErrors)rxPhyErrors;
- (AWDWPA2Counters)mcastWPA2Counters;
- (AWDWPA2Counters)ucastWPA2Counters;
- (AWDWiFiMetricsManagerFrameCounterStats)frameCounters;
- (BOOL)hasFrameCounters;
- (BOOL)hasMcastWPA2Counters;
- (BOOL)hasRxGeneralStats;
- (BOOL)hasRxMACCounterStats;
- (BOOL)hasRxMACErrorStats;
- (BOOL)hasRxPhyErrors;
- (BOOL)hasTimestamp;
- (BOOL)hasTxErrorStats;
- (BOOL)hasTxGeneralStats;
- (BOOL)hasUcastWPA2Counters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)frameCounterPerInterfaces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frameCounterPerInterfaceAtIndex:(unint64_t)a3;
- (unint64_t)frameCounterPerInterfacesCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addFrameCounterPerInterface:(id)a3;
- (void)clearFrameCounterPerInterfaces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFrameCounterPerInterfaces:(id)a3;
- (void)setFrameCounters:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMcastWPA2Counters:(id)a3;
- (void)setRxGeneralStats:(id)a3;
- (void)setRxMACCounterStats:(id)a3;
- (void)setRxMACErrorStats:(id)a3;
- (void)setRxPhyErrors:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxErrorStats:(id)a3;
- (void)setTxGeneralStats:(id)a3;
- (void)setUcastWPA2Counters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerChipCounters

- (void)dealloc
{
  [(AWDWiFiMetricsManagerChipCounters *)self setFrameCounters:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setTxGeneralStats:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setTxErrorStats:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setRxGeneralStats:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setRxMACErrorStats:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setRxMACCounterStats:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setRxPhyErrors:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setUcastWPA2Counters:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setMcastWPA2Counters:0];
  [(AWDWiFiMetricsManagerChipCounters *)self setFrameCounterPerInterfaces:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerChipCounters;
  [(AWDWiFiMetricsManagerChipCounters *)&v3 dealloc];
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

- (BOOL)hasFrameCounters
{
  return self->_frameCounters != 0;
}

- (BOOL)hasTxGeneralStats
{
  return self->_txGeneralStats != 0;
}

- (BOOL)hasTxErrorStats
{
  return self->_txErrorStats != 0;
}

- (BOOL)hasRxGeneralStats
{
  return self->_rxGeneralStats != 0;
}

- (BOOL)hasRxMACErrorStats
{
  return self->_rxMACErrorStats != 0;
}

- (BOOL)hasRxMACCounterStats
{
  return self->_rxMACCounterStats != 0;
}

- (BOOL)hasRxPhyErrors
{
  return self->_rxPhyErrors != 0;
}

- (BOOL)hasUcastWPA2Counters
{
  return self->_ucastWPA2Counters != 0;
}

- (BOOL)hasMcastWPA2Counters
{
  return self->_mcastWPA2Counters != 0;
}

- (void)clearFrameCounterPerInterfaces
{
}

- (void)addFrameCounterPerInterface:(id)a3
{
  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  if (!frameCounterPerInterfaces)
  {
    frameCounterPerInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_frameCounterPerInterfaces = frameCounterPerInterfaces;
  }

  [(NSMutableArray *)frameCounterPerInterfaces addObject:a3];
}

- (unint64_t)frameCounterPerInterfacesCount
{
  return [(NSMutableArray *)self->_frameCounterPerInterfaces count];
}

- (id)frameCounterPerInterfaceAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_frameCounterPerInterfaces objectAtIndex:a3];
}

+ (Class)frameCounterPerInterfaceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerChipCounters;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerChipCounters description](&v3, sel_description), -[AWDWiFiMetricsManagerChipCounters dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  frameCounters = self->_frameCounters;
  if (frameCounters) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerFrameCounterStats dictionaryRepresentation](frameCounters, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"frameCounters"];
  }
  txGeneralStats = self->_txGeneralStats;
  if (txGeneralStats) {
    [v3 setObject:[[-[AWDChipCountersTx dictionaryRepresentation](txGeneralStats, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"txGeneralStats"];
  }
  txErrorStats = self->_txErrorStats;
  if (txErrorStats) {
    [v3 setObject: -[AWDChipErrorCountersTx dictionaryRepresentation](txErrorStats, "dictionaryRepresentation") forKey:@"txErrorStats"];
  }
  rxGeneralStats = self->_rxGeneralStats;
  if (rxGeneralStats) {
    [v3 setObject:[[rxGeneralStats dictionaryRepresentation] forKey:@"rxGeneralStats"];
  }
  rxMACErrorStats = self->_rxMACErrorStats;
  if (rxMACErrorStats) {
    [v3 setObject:[[-[AWDMacCountersRxErrors dictionaryRepresentation](rxMACErrorStats, "dictionaryRepresentation")] forKey:@"rxMACErrorStats"];
  }
  rxMACCounterStats = self->_rxMACCounterStats;
  if (rxMACCounterStats) {
    [v3 setObject:[[-[AWDMacCountersRx dictionaryRepresentation](rxMACCounterStats, "dictionaryRepresentation")] forKey:@"rxMACCounterStats"];
  }
  rxPhyErrors = self->_rxPhyErrors;
  if (rxPhyErrors) {
    [v3 setObject:[[rxPhyErrors dictionaryRepresentation] forKey:@"rxPhyErrors"];
  }
  ucastWPA2Counters = self->_ucastWPA2Counters;
  if (ucastWPA2Counters) {
    [v3 setObject:-[AWDWPA2Counters dictionaryRepresentation](ucastWPA2Counters, "dictionaryRepresentation") forKey:@"ucastWPA2Counters"];
  }
  mcastWPA2Counters = self->_mcastWPA2Counters;
  if (mcastWPA2Counters) {
    [v3 setObject:-[AWDWPA2Counters dictionaryRepresentation](mcastWPA2Counters, "dictionaryRepresentation") forKey:@"mcastWPA2Counters"];
  }
  if ([(NSMutableArray *)self->_frameCounterPerInterfaces count])
  {
    v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_frameCounterPerInterfaces, "count")];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
    uint64_t v15 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(frameCounterPerInterfaces);
          }
          [v13 addObject:[v20 dictionaryRepresentation]];
        }
        uint64_t v16 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
    [v3 setObject:v13 forKey:@"frameCounterPerInterface"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerChipCountersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_frameCounters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txGeneralStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txErrorStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxGeneralStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxMACErrorStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxMACCounterStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rxPhyErrors) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_ucastWPA2Counters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mcastWPA2Counters) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  uint64_t v5 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(frameCounterPerInterfaces);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 96) |= 1u;
  }
  if (self->_frameCounters) {
    [a3 setFrameCounters:];
  }
  if (self->_txGeneralStats) {
    [a3 setTxGeneralStats:];
  }
  if (self->_txErrorStats) {
    [a3 setTxErrorStats:];
  }
  if (self->_rxGeneralStats) {
    [a3 setRxGeneralStats:];
  }
  if (self->_rxMACErrorStats) {
    [a3 setRxMACErrorStats:];
  }
  if (self->_rxMACCounterStats) {
    [a3 setRxMACCounterStats:];
  }
  if (self->_rxPhyErrors) {
    [a3 setRxPhyErrors:];
  }
  if (self->_ucastWPA2Counters) {
    [a3 setUcastWPA2Counters:];
  }
  if (self->_mcastWPA2Counters) {
    [a3 setMcastWPA2Counters:];
  }
  if ([(AWDWiFiMetricsManagerChipCounters *)self frameCounterPerInterfacesCount])
  {
    [a3 clearFrameCounterPerInterfaces];
    unint64_t v5 = [(AWDWiFiMetricsManagerChipCounters *)self frameCounterPerInterfacesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addFrameCounterPerInterface:-[AWDWiFiMetricsManagerChipCounters frameCounterPerInterfaceAtIndex:](self, "frameCounterPerInterfaceAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 96) |= 1u;
  }

  *(void *)(v6 + 24) = [(AWDWiFiMetricsManagerFrameCounterStats *)self->_frameCounters copyWithZone:a3];
  *(void *)(v6 + 80) = [(AWDChipCountersTx *)self->_txGeneralStats copyWithZone:a3];

  *(void *)(v6 + 72) = [(AWDChipErrorCountersTx *)self->_txErrorStats copyWithZone:a3];
  *(void *)(v6 + 40) = [(AWDChipCountersRx *)self->_rxGeneralStats copyWithZone:a3];

  *(void *)(v6 + 56) = [(AWDMacCountersRxErrors *)self->_rxMACErrorStats copyWithZone:a3];
  *(void *)(v6 + 48) = [(AWDMacCountersRx *)self->_rxMACCounterStats copyWithZone:a3];

  *(void *)(v6 + 64) = [(AWDRxPhyErrors *)self->_rxPhyErrors copyWithZone:a3];
  *(void *)(v6 + 88) = [(AWDWPA2Counters *)self->_ucastWPA2Counters copyWithZone:a3];

  *(void *)(v6 + 32) = [(AWDWPA2Counters *)self->_mcastWPA2Counters copyWithZone:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
  uint64_t v8 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_enumerationMutation(frameCounterPerInterfaces);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v6 addFrameCounterPerInterface:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)frameCounterPerInterfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
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
      if ((*((unsigned char *)a3 + 96) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)a3 + 96))
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    frameCounters = self->_frameCounters;
    if (!((unint64_t)frameCounters | *((void *)a3 + 3))
      || (int v5 = -[AWDWiFiMetricsManagerFrameCounterStats isEqual:](frameCounters, "isEqual:")) != 0)
    {
      txGeneralStats = self->_txGeneralStats;
      if (!((unint64_t)txGeneralStats | *((void *)a3 + 10))
        || (int v5 = -[AWDChipCountersTx isEqual:](txGeneralStats, "isEqual:")) != 0)
      {
        txErrorStats = self->_txErrorStats;
        if (!((unint64_t)txErrorStats | *((void *)a3 + 9))
          || (int v5 = -[AWDChipErrorCountersTx isEqual:](txErrorStats, "isEqual:")) != 0)
        {
          rxGeneralStats = self->_rxGeneralStats;
          if (!((unint64_t)rxGeneralStats | *((void *)a3 + 5))
            || (int v5 = -[AWDChipCountersRx isEqual:](rxGeneralStats, "isEqual:")) != 0)
          {
            rxMACErrorStats = self->_rxMACErrorStats;
            if (!((unint64_t)rxMACErrorStats | *((void *)a3 + 7))
              || (int v5 = -[AWDMacCountersRxErrors isEqual:](rxMACErrorStats, "isEqual:")) != 0)
            {
              rxMACCounterStats = self->_rxMACCounterStats;
              if (!((unint64_t)rxMACCounterStats | *((void *)a3 + 6))
                || (int v5 = -[AWDMacCountersRx isEqual:](rxMACCounterStats, "isEqual:")) != 0)
              {
                rxPhyErrors = self->_rxPhyErrors;
                if (!((unint64_t)rxPhyErrors | *((void *)a3 + 8))
                  || (int v5 = -[AWDRxPhyErrors isEqual:](rxPhyErrors, "isEqual:")) != 0)
                {
                  ucastWPA2Counters = self->_ucastWPA2Counters;
                  if (!((unint64_t)ucastWPA2Counters | *((void *)a3 + 11))
                    || (int v5 = -[AWDWPA2Counters isEqual:](ucastWPA2Counters, "isEqual:")) != 0)
                  {
                    mcastWPA2Counters = self->_mcastWPA2Counters;
                    if (!((unint64_t)mcastWPA2Counters | *((void *)a3 + 4))
                      || (int v5 = -[AWDWPA2Counters isEqual:](mcastWPA2Counters, "isEqual:")) != 0)
                    {
                      frameCounterPerInterfaces = self->_frameCounterPerInterfaces;
                      if ((unint64_t)frameCounterPerInterfaces | *((void *)a3 + 2))
                      {
                        LOBYTE(v5) = -[NSMutableArray isEqual:](frameCounterPerInterfaces, "isEqual:");
                      }
                      else
                      {
                        LOBYTE(v5) = 1;
                      }
                    }
                  }
                }
              }
            }
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
  unint64_t v4 = [(AWDWiFiMetricsManagerFrameCounterStats *)self->_frameCounters hash] ^ v3;
  unint64_t v5 = [(AWDChipCountersTx *)self->_txGeneralStats hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDChipErrorCountersTx *)self->_txErrorStats hash];
  unint64_t v7 = [(AWDChipCountersRx *)self->_rxGeneralStats hash];
  unint64_t v8 = v7 ^ [(AWDMacCountersRxErrors *)self->_rxMACErrorStats hash];
  unint64_t v9 = v6 ^ v8 ^ [(AWDMacCountersRx *)self->_rxMACCounterStats hash];
  unint64_t v10 = [(AWDRxPhyErrors *)self->_rxPhyErrors hash];
  unint64_t v11 = v10 ^ [(AWDWPA2Counters *)self->_ucastWPA2Counters hash];
  unint64_t v12 = v11 ^ [(AWDWPA2Counters *)self->_mcastWPA2Counters hash];
  return v9 ^ v12 ^ [(NSMutableArray *)self->_frameCounterPerInterfaces hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 96))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  frameCounters = self->_frameCounters;
  uint64_t v6 = *((void *)a3 + 3);
  if (frameCounters)
  {
    if (v6) {
      -[AWDWiFiMetricsManagerFrameCounterStats mergeFrom:](frameCounters, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerChipCounters setFrameCounters:](self, "setFrameCounters:");
  }
  txGeneralStats = self->_txGeneralStats;
  uint64_t v8 = *((void *)a3 + 10);
  if (txGeneralStats)
  {
    if (v8) {
      -[AWDChipCountersTx mergeFrom:](txGeneralStats, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiMetricsManagerChipCounters setTxGeneralStats:](self, "setTxGeneralStats:");
  }
  txErrorStats = self->_txErrorStats;
  uint64_t v10 = *((void *)a3 + 9);
  if (txErrorStats)
  {
    if (v10) {
      -[AWDChipErrorCountersTx mergeFrom:](txErrorStats, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDWiFiMetricsManagerChipCounters setTxErrorStats:](self, "setTxErrorStats:");
  }
  rxGeneralStats = self->_rxGeneralStats;
  uint64_t v12 = *((void *)a3 + 5);
  if (rxGeneralStats)
  {
    if (v12) {
      -[AWDChipCountersRx mergeFrom:](rxGeneralStats, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxGeneralStats:](self, "setRxGeneralStats:");
  }
  rxMACErrorStats = self->_rxMACErrorStats;
  uint64_t v14 = *((void *)a3 + 7);
  if (rxMACErrorStats)
  {
    if (v14) {
      -[AWDMacCountersRxErrors mergeFrom:](rxMACErrorStats, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxMACErrorStats:](self, "setRxMACErrorStats:");
  }
  rxMACCounterStats = self->_rxMACCounterStats;
  uint64_t v16 = *((void *)a3 + 6);
  if (rxMACCounterStats)
  {
    if (v16) {
      -[AWDMacCountersRx mergeFrom:](rxMACCounterStats, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxMACCounterStats:](self, "setRxMACCounterStats:");
  }
  rxPhyErrors = self->_rxPhyErrors;
  uint64_t v18 = *((void *)a3 + 8);
  if (rxPhyErrors)
  {
    if (v18) {
      -[AWDRxPhyErrors mergeFrom:](rxPhyErrors, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[AWDWiFiMetricsManagerChipCounters setRxPhyErrors:](self, "setRxPhyErrors:");
  }
  ucastWPA2Counters = self->_ucastWPA2Counters;
  uint64_t v20 = *((void *)a3 + 11);
  if (ucastWPA2Counters)
  {
    if (v20) {
      -[AWDWPA2Counters mergeFrom:](ucastWPA2Counters, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[AWDWiFiMetricsManagerChipCounters setUcastWPA2Counters:](self, "setUcastWPA2Counters:");
  }
  mcastWPA2Counters = self->_mcastWPA2Counters;
  uint64_t v22 = *((void *)a3 + 4);
  if (mcastWPA2Counters)
  {
    if (v22) {
      -[AWDWPA2Counters mergeFrom:](mcastWPA2Counters, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[AWDWiFiMetricsManagerChipCounters setMcastWPA2Counters:](self, "setMcastWPA2Counters:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v23 = (void *)*((void *)a3 + 2);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        [(AWDWiFiMetricsManagerChipCounters *)self addFrameCounterPerInterface:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v25);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerFrameCounterStats)frameCounters
{
  return self->_frameCounters;
}

- (void)setFrameCounters:(id)a3
{
}

- (AWDChipCountersTx)txGeneralStats
{
  return self->_txGeneralStats;
}

- (void)setTxGeneralStats:(id)a3
{
}

- (AWDChipErrorCountersTx)txErrorStats
{
  return self->_txErrorStats;
}

- (void)setTxErrorStats:(id)a3
{
}

- (AWDChipCountersRx)rxGeneralStats
{
  return self->_rxGeneralStats;
}

- (void)setRxGeneralStats:(id)a3
{
}

- (AWDMacCountersRxErrors)rxMACErrorStats
{
  return self->_rxMACErrorStats;
}

- (void)setRxMACErrorStats:(id)a3
{
}

- (AWDMacCountersRx)rxMACCounterStats
{
  return self->_rxMACCounterStats;
}

- (void)setRxMACCounterStats:(id)a3
{
}

- (AWDRxPhyErrors)rxPhyErrors
{
  return self->_rxPhyErrors;
}

- (void)setRxPhyErrors:(id)a3
{
}

- (AWDWPA2Counters)ucastWPA2Counters
{
  return self->_ucastWPA2Counters;
}

- (void)setUcastWPA2Counters:(id)a3
{
}

- (AWDWPA2Counters)mcastWPA2Counters
{
  return self->_mcastWPA2Counters;
}

- (void)setMcastWPA2Counters:(id)a3
{
}

- (NSMutableArray)frameCounterPerInterfaces
{
  return self->_frameCounterPerInterfaces;
}

- (void)setFrameCounterPerInterfaces:(id)a3
{
}

@end