@interface AWDSidecarPeerTraffic
+ (Class)rxDataRateType;
+ (Class)rxFWDelayType;
+ (Class)rxIPCDelayType;
+ (Class)rxRSSIType;
+ (Class)rxTotalDelayType;
+ (Class)txCCAType;
+ (Class)txDataRateType;
+ (Class)txFWDelayType;
+ (Class)txHWDelayType;
+ (Class)txIPCDelayType;
+ (Class)txPacketBurstIntervalType;
+ (Class)txPacketBurstSizeType;
+ (Class)txRetriesType;
+ (Class)txTotalDelayType;
- (BOOL)hasTxErrorCount;
- (BOOL)hasTxExpiredCount;
- (BOOL)hasTxSuccessCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rxDataRates;
- (NSMutableArray)rxFWDelays;
- (NSMutableArray)rxIPCDelays;
- (NSMutableArray)rxRSSIs;
- (NSMutableArray)rxTotalDelays;
- (NSMutableArray)txCCAs;
- (NSMutableArray)txDataRates;
- (NSMutableArray)txFWDelays;
- (NSMutableArray)txHWDelays;
- (NSMutableArray)txIPCDelays;
- (NSMutableArray)txPacketBurstIntervals;
- (NSMutableArray)txPacketBurstSizes;
- (NSMutableArray)txRetries;
- (NSMutableArray)txTotalDelays;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rxDataRateAtIndex:(unint64_t)a3;
- (id)rxFWDelayAtIndex:(unint64_t)a3;
- (id)rxIPCDelayAtIndex:(unint64_t)a3;
- (id)rxRSSIAtIndex:(unint64_t)a3;
- (id)rxTotalDelayAtIndex:(unint64_t)a3;
- (id)txCCAAtIndex:(unint64_t)a3;
- (id)txDataRateAtIndex:(unint64_t)a3;
- (id)txFWDelayAtIndex:(unint64_t)a3;
- (id)txHWDelayAtIndex:(unint64_t)a3;
- (id)txIPCDelayAtIndex:(unint64_t)a3;
- (id)txPacketBurstIntervalAtIndex:(unint64_t)a3;
- (id)txPacketBurstSizeAtIndex:(unint64_t)a3;
- (id)txRetriesAtIndex:(unint64_t)a3;
- (id)txTotalDelayAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rxDataRatesCount;
- (unint64_t)rxFWDelaysCount;
- (unint64_t)rxIPCDelaysCount;
- (unint64_t)rxRSSIsCount;
- (unint64_t)rxTotalDelaysCount;
- (unint64_t)txCCAsCount;
- (unint64_t)txDataRatesCount;
- (unint64_t)txErrorCount;
- (unint64_t)txExpiredCount;
- (unint64_t)txFWDelaysCount;
- (unint64_t)txHWDelaysCount;
- (unint64_t)txIPCDelaysCount;
- (unint64_t)txPacketBurstIntervalsCount;
- (unint64_t)txPacketBurstSizesCount;
- (unint64_t)txRetriesCount;
- (unint64_t)txSuccessCount;
- (unint64_t)txTotalDelaysCount;
- (void)addRxDataRate:(id)a3;
- (void)addRxFWDelay:(id)a3;
- (void)addRxIPCDelay:(id)a3;
- (void)addRxRSSI:(id)a3;
- (void)addRxTotalDelay:(id)a3;
- (void)addTxCCA:(id)a3;
- (void)addTxDataRate:(id)a3;
- (void)addTxFWDelay:(id)a3;
- (void)addTxHWDelay:(id)a3;
- (void)addTxIPCDelay:(id)a3;
- (void)addTxPacketBurstInterval:(id)a3;
- (void)addTxPacketBurstSize:(id)a3;
- (void)addTxRetries:(id)a3;
- (void)addTxTotalDelay:(id)a3;
- (void)clearRxDataRates;
- (void)clearRxFWDelays;
- (void)clearRxIPCDelays;
- (void)clearRxRSSIs;
- (void)clearRxTotalDelays;
- (void)clearTxCCAs;
- (void)clearTxDataRates;
- (void)clearTxFWDelays;
- (void)clearTxHWDelays;
- (void)clearTxIPCDelays;
- (void)clearTxPacketBurstIntervals;
- (void)clearTxPacketBurstSizes;
- (void)clearTxRetries;
- (void)clearTxTotalDelays;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTxErrorCount:(BOOL)a3;
- (void)setHasTxExpiredCount:(BOOL)a3;
- (void)setHasTxSuccessCount:(BOOL)a3;
- (void)setRxDataRates:(id)a3;
- (void)setRxFWDelays:(id)a3;
- (void)setRxIPCDelays:(id)a3;
- (void)setRxRSSIs:(id)a3;
- (void)setRxTotalDelays:(id)a3;
- (void)setTxCCAs:(id)a3;
- (void)setTxDataRates:(id)a3;
- (void)setTxErrorCount:(unint64_t)a3;
- (void)setTxExpiredCount:(unint64_t)a3;
- (void)setTxFWDelays:(id)a3;
- (void)setTxHWDelays:(id)a3;
- (void)setTxIPCDelays:(id)a3;
- (void)setTxPacketBurstIntervals:(id)a3;
- (void)setTxPacketBurstSizes:(id)a3;
- (void)setTxRetries:(id)a3;
- (void)setTxSuccessCount:(unint64_t)a3;
- (void)setTxTotalDelays:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSidecarPeerTraffic

- (void)dealloc
{
  [(AWDSidecarPeerTraffic *)self setTxTotalDelays:0];
  [(AWDSidecarPeerTraffic *)self setTxIPCDelays:0];
  [(AWDSidecarPeerTraffic *)self setTxFWDelays:0];
  [(AWDSidecarPeerTraffic *)self setTxHWDelays:0];
  [(AWDSidecarPeerTraffic *)self setTxDataRates:0];
  [(AWDSidecarPeerTraffic *)self setTxCCAs:0];
  [(AWDSidecarPeerTraffic *)self setTxRetries:0];
  [(AWDSidecarPeerTraffic *)self setTxPacketBurstSizes:0];
  [(AWDSidecarPeerTraffic *)self setTxPacketBurstIntervals:0];
  [(AWDSidecarPeerTraffic *)self setRxTotalDelays:0];
  [(AWDSidecarPeerTraffic *)self setRxIPCDelays:0];
  [(AWDSidecarPeerTraffic *)self setRxFWDelays:0];
  [(AWDSidecarPeerTraffic *)self setRxDataRates:0];
  [(AWDSidecarPeerTraffic *)self setRxRSSIs:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarPeerTraffic;
  [(AWDSidecarPeerTraffic *)&v3 dealloc];
}

- (void)setTxSuccessCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_txSuccessCount = a3;
}

- (void)setHasTxSuccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxSuccessCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTxExpiredCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_txExpiredCount = a3;
}

- (void)setHasTxExpiredCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTxExpiredCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTxErrorCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_txErrorCount = a3;
}

- (void)setHasTxErrorCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxErrorCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearTxTotalDelays
{
}

- (void)addTxTotalDelay:(id)a3
{
  txTotalDelays = self->_txTotalDelays;
  if (!txTotalDelays)
  {
    txTotalDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txTotalDelays = txTotalDelays;
  }

  [(NSMutableArray *)txTotalDelays addObject:a3];
}

- (unint64_t)txTotalDelaysCount
{
  return [(NSMutableArray *)self->_txTotalDelays count];
}

- (id)txTotalDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txTotalDelays objectAtIndex:a3];
}

+ (Class)txTotalDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxIPCDelays
{
}

- (void)addTxIPCDelay:(id)a3
{
  txIPCDelays = self->_txIPCDelays;
  if (!txIPCDelays)
  {
    txIPCDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txIPCDelays = txIPCDelays;
  }

  [(NSMutableArray *)txIPCDelays addObject:a3];
}

- (unint64_t)txIPCDelaysCount
{
  return [(NSMutableArray *)self->_txIPCDelays count];
}

- (id)txIPCDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txIPCDelays objectAtIndex:a3];
}

+ (Class)txIPCDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxFWDelays
{
}

- (void)addTxFWDelay:(id)a3
{
  txFWDelays = self->_txFWDelays;
  if (!txFWDelays)
  {
    txFWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txFWDelays = txFWDelays;
  }

  [(NSMutableArray *)txFWDelays addObject:a3];
}

- (unint64_t)txFWDelaysCount
{
  return [(NSMutableArray *)self->_txFWDelays count];
}

- (id)txFWDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txFWDelays objectAtIndex:a3];
}

+ (Class)txFWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxHWDelays
{
}

- (void)addTxHWDelay:(id)a3
{
  txHWDelays = self->_txHWDelays;
  if (!txHWDelays)
  {
    txHWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txHWDelays = txHWDelays;
  }

  [(NSMutableArray *)txHWDelays addObject:a3];
}

- (unint64_t)txHWDelaysCount
{
  return [(NSMutableArray *)self->_txHWDelays count];
}

- (id)txHWDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txHWDelays objectAtIndex:a3];
}

+ (Class)txHWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearTxDataRates
{
}

- (void)addTxDataRate:(id)a3
{
  txDataRates = self->_txDataRates;
  if (!txDataRates)
  {
    txDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txDataRates = txDataRates;
  }

  [(NSMutableArray *)txDataRates addObject:a3];
}

- (unint64_t)txDataRatesCount
{
  return [(NSMutableArray *)self->_txDataRates count];
}

- (id)txDataRateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txDataRates objectAtIndex:a3];
}

+ (Class)txDataRateType
{
  return (Class)objc_opt_class();
}

- (void)clearTxCCAs
{
}

- (void)addTxCCA:(id)a3
{
  txCCAs = self->_txCCAs;
  if (!txCCAs)
  {
    txCCAs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txCCAs = txCCAs;
  }

  [(NSMutableArray *)txCCAs addObject:a3];
}

- (unint64_t)txCCAsCount
{
  return [(NSMutableArray *)self->_txCCAs count];
}

- (id)txCCAAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txCCAs objectAtIndex:a3];
}

+ (Class)txCCAType
{
  return (Class)objc_opt_class();
}

- (void)clearTxRetries
{
}

- (void)addTxRetries:(id)a3
{
  txRetries = self->_txRetries;
  if (!txRetries)
  {
    txRetries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txRetries = txRetries;
  }

  [(NSMutableArray *)txRetries addObject:a3];
}

- (unint64_t)txRetriesCount
{
  return [(NSMutableArray *)self->_txRetries count];
}

- (id)txRetriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txRetries objectAtIndex:a3];
}

+ (Class)txRetriesType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPacketBurstSizes
{
}

- (void)addTxPacketBurstSize:(id)a3
{
  txPacketBurstSizes = self->_txPacketBurstSizes;
  if (!txPacketBurstSizes)
  {
    txPacketBurstSizes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txPacketBurstSizes = txPacketBurstSizes;
  }

  [(NSMutableArray *)txPacketBurstSizes addObject:a3];
}

- (unint64_t)txPacketBurstSizesCount
{
  return [(NSMutableArray *)self->_txPacketBurstSizes count];
}

- (id)txPacketBurstSizeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txPacketBurstSizes objectAtIndex:a3];
}

+ (Class)txPacketBurstSizeType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPacketBurstIntervals
{
}

- (void)addTxPacketBurstInterval:(id)a3
{
  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  if (!txPacketBurstIntervals)
  {
    txPacketBurstIntervals = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txPacketBurstIntervals = txPacketBurstIntervals;
  }

  [(NSMutableArray *)txPacketBurstIntervals addObject:a3];
}

- (unint64_t)txPacketBurstIntervalsCount
{
  return [(NSMutableArray *)self->_txPacketBurstIntervals count];
}

- (id)txPacketBurstIntervalAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txPacketBurstIntervals objectAtIndex:a3];
}

+ (Class)txPacketBurstIntervalType
{
  return (Class)objc_opt_class();
}

- (void)clearRxTotalDelays
{
}

- (void)addRxTotalDelay:(id)a3
{
  rxTotalDelays = self->_rxTotalDelays;
  if (!rxTotalDelays)
  {
    rxTotalDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxTotalDelays = rxTotalDelays;
  }

  [(NSMutableArray *)rxTotalDelays addObject:a3];
}

- (unint64_t)rxTotalDelaysCount
{
  return [(NSMutableArray *)self->_rxTotalDelays count];
}

- (id)rxTotalDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxTotalDelays objectAtIndex:a3];
}

+ (Class)rxTotalDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxIPCDelays
{
}

- (void)addRxIPCDelay:(id)a3
{
  rxIPCDelays = self->_rxIPCDelays;
  if (!rxIPCDelays)
  {
    rxIPCDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxIPCDelays = rxIPCDelays;
  }

  [(NSMutableArray *)rxIPCDelays addObject:a3];
}

- (unint64_t)rxIPCDelaysCount
{
  return [(NSMutableArray *)self->_rxIPCDelays count];
}

- (id)rxIPCDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxIPCDelays objectAtIndex:a3];
}

+ (Class)rxIPCDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxFWDelays
{
}

- (void)addRxFWDelay:(id)a3
{
  rxFWDelays = self->_rxFWDelays;
  if (!rxFWDelays)
  {
    rxFWDelays = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxFWDelays = rxFWDelays;
  }

  [(NSMutableArray *)rxFWDelays addObject:a3];
}

- (unint64_t)rxFWDelaysCount
{
  return [(NSMutableArray *)self->_rxFWDelays count];
}

- (id)rxFWDelayAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxFWDelays objectAtIndex:a3];
}

+ (Class)rxFWDelayType
{
  return (Class)objc_opt_class();
}

- (void)clearRxDataRates
{
}

- (void)addRxDataRate:(id)a3
{
  rxDataRates = self->_rxDataRates;
  if (!rxDataRates)
  {
    rxDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxDataRates = rxDataRates;
  }

  [(NSMutableArray *)rxDataRates addObject:a3];
}

- (unint64_t)rxDataRatesCount
{
  return [(NSMutableArray *)self->_rxDataRates count];
}

- (id)rxDataRateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxDataRates objectAtIndex:a3];
}

+ (Class)rxDataRateType
{
  return (Class)objc_opt_class();
}

- (void)clearRxRSSIs
{
}

- (void)addRxRSSI:(id)a3
{
  rxRSSIs = self->_rxRSSIs;
  if (!rxRSSIs)
  {
    rxRSSIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxRSSIs = rxRSSIs;
  }

  [(NSMutableArray *)rxRSSIs addObject:a3];
}

- (unint64_t)rxRSSIsCount
{
  return [(NSMutableArray *)self->_rxRSSIs count];
}

- (id)rxRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxRSSIs objectAtIndex:a3];
}

+ (Class)rxRSSIType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarPeerTraffic;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSidecarPeerTraffic description](&v3, sel_description), -[AWDSidecarPeerTraffic dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txSuccessCount] forKey:@"txSuccessCount"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txExpiredCount] forKey:@"txExpiredCount"];
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txErrorCount] forKey:@"txErrorCount"];
LABEL_5:
  if ([(NSMutableArray *)self->_txTotalDelays count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txTotalDelays, "count")];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    txTotalDelays = self->_txTotalDelays;
    uint64_t v7 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v142 objects:v159 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v143;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v143 != v9) {
            objc_enumerationMutation(txTotalDelays);
          }
          [v5 addObject:[(*(id *)(*((void *)&v142 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v142 objects:v159 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"txTotalDelay"];
  }
  if ([(NSMutableArray *)self->_txIPCDelays count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txIPCDelays, "count")];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    txIPCDelays = self->_txIPCDelays;
    uint64_t v13 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v138 objects:v158 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v139;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v139 != v15) {
            objc_enumerationMutation(txIPCDelays);
          }
          [v11 addObject:[(*(id *)(*((void *)&v138 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v138 objects:v158 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"txIPCDelay"];
  }
  if ([(NSMutableArray *)self->_txFWDelays count])
  {
    v17 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txFWDelays, "count")];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    txFWDelays = self->_txFWDelays;
    uint64_t v19 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v134 objects:v157 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v135;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v135 != v21) {
            objc_enumerationMutation(txFWDelays);
          }
          [v17 addObject:[*(id *)(*((void *)&v134 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v20 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v134 objects:v157 count:16];
      }
      while (v20);
    }
    [v3 setObject:v17 forKey:@"txFWDelay"];
  }
  if ([(NSMutableArray *)self->_txHWDelays count])
  {
    v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txHWDelays, "count")];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    txHWDelays = self->_txHWDelays;
    uint64_t v25 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v130 objects:v156 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v131;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v131 != v27) {
            objc_enumerationMutation(txHWDelays);
          }
          [v23 addObject:[*(id *)(*((void *)&v130 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v26 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v130 objects:v156 count:16];
      }
      while (v26);
    }
    [v3 setObject:v23 forKey:@"txHWDelay"];
  }
  if ([(NSMutableArray *)self->_txDataRates count])
  {
    v29 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txDataRates, "count")];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    txDataRates = self->_txDataRates;
    uint64_t v31 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v126 objects:v155 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v127;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v127 != v33) {
            objc_enumerationMutation(txDataRates);
          }
          [v29 addObject:[*(id *)(*((void *)&v126 + 1) + 8 * n) dictionaryRepresentation]];
        }
        uint64_t v32 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v126 objects:v155 count:16];
      }
      while (v32);
    }
    [v3 setObject:v29 forKey:@"txDataRate"];
  }
  if ([(NSMutableArray *)self->_txCCAs count])
  {
    v35 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txCCAs, "count")];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    txCCAs = self->_txCCAs;
    uint64_t v37 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v122 objects:v154 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v123;
      do
      {
        for (iuint64_t i = 0; ii != v38; ++ii)
        {
          if (*(void *)v123 != v39) {
            objc_enumerationMutation(txCCAs);
          }
          [v35 addObject:[(*(id *)(*((void *)&v122 + 1) + 8 * ii)) dictionaryRepresentation]];
        }
        uint64_t v38 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v122 objects:v154 count:16];
      }
      while (v38);
    }
    [v3 setObject:v35 forKey:@"txCCA"];
  }
  if ([(NSMutableArray *)self->_txRetries count])
  {
    v41 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txRetries, "count")];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    txRetries = self->_txRetries;
    uint64_t v43 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v118 objects:v153 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v119;
      do
      {
        for (juint64_t j = 0; jj != v44; ++jj)
        {
          if (*(void *)v119 != v45) {
            objc_enumerationMutation(txRetries);
          }
          [v41 addObject:[*(id *)(*((void *)&v118 + 1) + 8 * jj) dictionaryRepresentation]];
        }
        uint64_t v44 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v118 objects:v153 count:16];
      }
      while (v44);
    }
    [v3 setObject:v41 forKey:@"txRetries"];
  }
  if ([(NSMutableArray *)self->_txPacketBurstSizes count])
  {
    v47 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txPacketBurstSizes, "count")];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    txPacketBurstSizes = self->_txPacketBurstSizes;
    uint64_t v49 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v114 objects:v152 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v115;
      do
      {
        for (kuint64_t k = 0; kk != v50; ++kk)
        {
          if (*(void *)v115 != v51) {
            objc_enumerationMutation(txPacketBurstSizes);
          }
          [v47 addObject:[*(id *)(*((void *)&v114 + 1) + 8 * kk) dictionaryRepresentation]];
        }
        uint64_t v50 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v114 objects:v152 count:16];
      }
      while (v50);
    }
    [v3 setObject:v47 forKey:@"txPacketBurstSize"];
  }
  if ([(NSMutableArray *)self->_txPacketBurstIntervals count])
  {
    v53 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txPacketBurstIntervals, "count")];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    txPacketBurstIntervals = self->_txPacketBurstIntervals;
    uint64_t v55 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v110 objects:v151 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v111;
      do
      {
        for (muint64_t m = 0; mm != v56; ++mm)
        {
          if (*(void *)v111 != v57) {
            objc_enumerationMutation(txPacketBurstIntervals);
          }
          [v53 addObject:[(*(id *)(*((void *)&v110 + 1) + 8 * mm)) dictionaryRepresentation]];
        }
        uint64_t v56 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v110 objects:v151 count:16];
      }
      while (v56);
    }
    [v3 setObject:v53 forKey:@"txPacketBurstInterval"];
  }
  if ([(NSMutableArray *)self->_rxTotalDelays count])
  {
    v59 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxTotalDelays, "count")];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    rxTotalDelays = self->_rxTotalDelays;
    uint64_t v61 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v106 objects:v150 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v107;
      do
      {
        for (nuint64_t n = 0; nn != v62; ++nn)
        {
          if (*(void *)v107 != v63) {
            objc_enumerationMutation(rxTotalDelays);
          }
          [v59 addObject:[(*(id *)(*((void *)&v106 + 1) + 8 * nn)) dictionaryRepresentation]];
        }
        uint64_t v62 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v106 objects:v150 count:16];
      }
      while (v62);
    }
    [v3 setObject:v59 forKey:@"rxTotalDelay"];
  }
  if ([(NSMutableArray *)self->_rxIPCDelays count])
  {
    v65 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxIPCDelays, "count")];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    rxIPCDelays = self->_rxIPCDelays;
    uint64_t v67 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v102 objects:v149 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v103;
      do
      {
        for (uint64_t i1 = 0; i1 != v68; ++i1)
        {
          if (*(void *)v103 != v69) {
            objc_enumerationMutation(rxIPCDelays);
          }
          [v65 addObject:[v102 dictionaryRepresentation]];
        }
        uint64_t v68 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v102 objects:v149 count:16];
      }
      while (v68);
    }
    [v3 setObject:v65 forKey:@"rxIPCDelay"];
  }
  if ([(NSMutableArray *)self->_rxFWDelays count])
  {
    v71 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxFWDelays, "count")];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    rxFWDelays = self->_rxFWDelays;
    uint64_t v73 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v98 objects:v148 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v99;
      do
      {
        for (uint64_t i2 = 0; i2 != v74; ++i2)
        {
          if (*(void *)v99 != v75) {
            objc_enumerationMutation(rxFWDelays);
          }
          [v71 addObject:[*(id *)(*((void *)&v98 + 1) + 8 * i2) dictionaryRepresentation]];
        }
        uint64_t v74 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v98 objects:v148 count:16];
      }
      while (v74);
    }
    [v3 setObject:v71 forKey:@"rxFWDelay"];
  }
  if ([(NSMutableArray *)self->_rxDataRates count])
  {
    v77 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxDataRates, "count")];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    rxDataRates = self->_rxDataRates;
    uint64_t v79 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v94 objects:v147 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v95;
      do
      {
        for (uint64_t i3 = 0; i3 != v80; ++i3)
        {
          if (*(void *)v95 != v81) {
            objc_enumerationMutation(rxDataRates);
          }
          [v77 addObject:[*(id *)(*((void *)&v94 + 1) + 8 * i3) dictionaryRepresentation]];
        }
        uint64_t v80 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v94 objects:v147 count:16];
      }
      while (v80);
    }
    [v3 setObject:v77 forKey:@"rxDataRate"];
  }
  if ([(NSMutableArray *)self->_rxRSSIs count])
  {
    v83 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxRSSIs, "count")];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    rxRSSIs = self->_rxRSSIs;
    uint64_t v85 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v90 objects:v146 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v91;
      do
      {
        for (uint64_t i4 = 0; i4 != v86; ++i4)
        {
          if (*(void *)v91 != v87) {
            objc_enumerationMutation(rxRSSIs);
          }
          [v83 addObject:[*(id *)(*((void *)&v90 + 1) + 8 * i4) dictionaryRepresentation]];
        }
        uint64_t v86 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v90 objects:v146 count:16];
      }
      while (v86);
    }
    [v3 setObject:v83 forKey:@"rxRSSI"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSidecarPeerTrafficReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  txTotalDelays = self->_txTotalDelays;
  uint64_t v6 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v127 objects:v144 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v128 != v8) {
          objc_enumerationMutation(txTotalDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v127 objects:v144 count:16];
    }
    while (v7);
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  txIPCDelays = self->_txIPCDelays;
  uint64_t v11 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v123 objects:v143 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v124;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v124 != v13) {
          objc_enumerationMutation(txIPCDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v123 objects:v143 count:16];
    }
    while (v12);
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  txFWDelays = self->_txFWDelays;
  uint64_t v16 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v119 objects:v142 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v120;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v120 != v18) {
          objc_enumerationMutation(txFWDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v119 objects:v142 count:16];
    }
    while (v17);
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  txHWDelays = self->_txHWDelays;
  uint64_t v21 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v115 objects:v141 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v116;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v116 != v23) {
          objc_enumerationMutation(txHWDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v115 objects:v141 count:16];
    }
    while (v22);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  txDataRates = self->_txDataRates;
  uint64_t v26 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v111 objects:v140 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v112;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v112 != v28) {
          objc_enumerationMutation(txDataRates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v111 objects:v140 count:16];
    }
    while (v27);
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  txCCAs = self->_txCCAs;
  uint64_t v31 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v107 objects:v139 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v108;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v108 != v33) {
          objc_enumerationMutation(txCCAs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v32 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v107 objects:v139 count:16];
    }
    while (v32);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  txRetries = self->_txRetries;
  uint64_t v36 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v103 objects:v138 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v104;
    do
    {
      for (juint64_t j = 0; jj != v37; ++jj)
      {
        if (*(void *)v104 != v38) {
          objc_enumerationMutation(txRetries);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v37 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v103 objects:v138 count:16];
    }
    while (v37);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  txPacketBurstSizes = self->_txPacketBurstSizes;
  uint64_t v41 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v99 objects:v137 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v100;
    do
    {
      for (kuint64_t k = 0; kk != v42; ++kk)
      {
        if (*(void *)v100 != v43) {
          objc_enumerationMutation(txPacketBurstSizes);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v42 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v99 objects:v137 count:16];
    }
    while (v42);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  uint64_t v46 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v95 objects:v136 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v96;
    do
    {
      for (muint64_t m = 0; mm != v47; ++mm)
      {
        if (*(void *)v96 != v48) {
          objc_enumerationMutation(txPacketBurstIntervals);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v47 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v95 objects:v136 count:16];
    }
    while (v47);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  rxTotalDelays = self->_rxTotalDelays;
  uint64_t v51 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v91 objects:v135 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v92;
    do
    {
      for (nuint64_t n = 0; nn != v52; ++nn)
      {
        if (*(void *)v92 != v53) {
          objc_enumerationMutation(rxTotalDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v52 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v91 objects:v135 count:16];
    }
    while (v52);
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  rxIPCDelays = self->_rxIPCDelays;
  uint64_t v56 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v87 objects:v134 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v88;
    do
    {
      for (uint64_t i1 = 0; i1 != v57; ++i1)
      {
        if (*(void *)v88 != v58) {
          objc_enumerationMutation(rxIPCDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v57 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v87 objects:v134 count:16];
    }
    while (v57);
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  rxFWDelays = self->_rxFWDelays;
  uint64_t v61 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v83 objects:v133 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v84;
    do
    {
      for (uint64_t i2 = 0; i2 != v62; ++i2)
      {
        if (*(void *)v84 != v63) {
          objc_enumerationMutation(rxFWDelays);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v62 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v83 objects:v133 count:16];
    }
    while (v62);
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  rxDataRates = self->_rxDataRates;
  uint64_t v66 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v79 objects:v132 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v80;
    do
    {
      for (uint64_t i3 = 0; i3 != v67; ++i3)
      {
        if (*(void *)v80 != v68) {
          objc_enumerationMutation(rxDataRates);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v67 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v79 objects:v132 count:16];
    }
    while (v67);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  rxRSSIs = self->_rxRSSIs;
  uint64_t v71 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v75 objects:v131 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v76;
    do
    {
      for (uint64_t i4 = 0; i4 != v72; ++i4)
      {
        if (*(void *)v76 != v73) {
          objc_enumerationMutation(rxRSSIs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v72 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v75 objects:v131 count:16];
    }
    while (v72);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_63:
    *((void *)a3 + 2) = self->_txExpiredCount;
    *((unsigned char *)a3 + 144) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 3) = self->_txSuccessCount;
  *((unsigned char *)a3 + 144) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_63;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *((void *)a3 + 1) = self->_txErrorCount;
    *((unsigned char *)a3 + 144) |= 1u;
  }
LABEL_5:
  if ([(AWDSidecarPeerTraffic *)self txTotalDelaysCount])
  {
    [a3 clearTxTotalDelays];
    unint64_t v6 = [(AWDSidecarPeerTraffic *)self txTotalDelaysCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addTxTotalDelay:-[AWDSidecarPeerTraffic txTotalDelayAtIndex:](self, "txTotalDelayAtIndex:", i)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txIPCDelaysCount])
  {
    [a3 clearTxIPCDelays];
    unint64_t v9 = [(AWDSidecarPeerTraffic *)self txIPCDelaysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addTxIPCDelay:-[AWDSidecarPeerTraffic txIPCDelayAtIndex:](self, "txIPCDelayAtIndex:", j)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txFWDelaysCount])
  {
    [a3 clearTxFWDelays];
    unint64_t v12 = [(AWDSidecarPeerTraffic *)self txFWDelaysCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addTxFWDelay:-[AWDSidecarPeerTraffic txFWDelayAtIndex:](self, "txFWDelayAtIndex:", k)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txHWDelaysCount])
  {
    [a3 clearTxHWDelays];
    unint64_t v15 = [(AWDSidecarPeerTraffic *)self txHWDelaysCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addTxHWDelay:-[AWDSidecarPeerTraffic txHWDelayAtIndex:](self, "txHWDelayAtIndex:", m)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txDataRatesCount])
  {
    [a3 clearTxDataRates];
    unint64_t v18 = [(AWDSidecarPeerTraffic *)self txDataRatesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [a3 addTxDataRate:-[AWDSidecarPeerTraffic txDataRateAtIndex:](self, "txDataRateAtIndex:", n)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txCCAsCount])
  {
    [a3 clearTxCCAs];
    unint64_t v21 = [(AWDSidecarPeerTraffic *)self txCCAsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [a3 addTxCCA:-[AWDSidecarPeerTraffic txCCAAtIndex:](self, "txCCAAtIndex:", ii)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txRetriesCount])
  {
    [a3 clearTxRetries];
    unint64_t v24 = [(AWDSidecarPeerTraffic *)self txRetriesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [a3 addTxRetries:-[AWDSidecarPeerTraffic txRetriesAtIndex:](self, "txRetriesAtIndex:", jj)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txPacketBurstSizesCount])
  {
    [a3 clearTxPacketBurstSizes];
    unint64_t v27 = [(AWDSidecarPeerTraffic *)self txPacketBurstSizesCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [a3 addTxPacketBurstSize:-[AWDSidecarPeerTraffic txPacketBurstSizeAtIndex:](self, "txPacketBurstSizeAtIndex:", kk)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self txPacketBurstIntervalsCount])
  {
    [a3 clearTxPacketBurstIntervals];
    unint64_t v30 = [(AWDSidecarPeerTraffic *)self txPacketBurstIntervalsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (muint64_t m = 0; mm != v31; ++mm)
        [a3 addTxPacketBurstInterval:-[AWDSidecarPeerTraffic txPacketBurstIntervalAtIndex:](self, "txPacketBurstIntervalAtIndex:", mm)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self rxTotalDelaysCount])
  {
    [a3 clearRxTotalDelays];
    unint64_t v33 = [(AWDSidecarPeerTraffic *)self rxTotalDelaysCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (nuint64_t n = 0; nn != v34; ++nn)
        [a3 addRxTotalDelay:-[AWDSidecarPeerTraffic rxTotalDelayAtIndex:](self, "rxTotalDelayAtIndex:", nn)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self rxIPCDelaysCount])
  {
    [a3 clearRxIPCDelays];
    unint64_t v36 = [(AWDSidecarPeerTraffic *)self rxIPCDelaysCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (uint64_t i1 = 0; i1 != v37; ++i1)
        [a3 addRxIPCDelay:-[AWDSidecarPeerTraffic rxIPCDelayAtIndex:](self, "rxIPCDelayAtIndex:", i1)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self rxFWDelaysCount])
  {
    [a3 clearRxFWDelays];
    unint64_t v39 = [(AWDSidecarPeerTraffic *)self rxFWDelaysCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (uint64_t i2 = 0; i2 != v40; ++i2)
        [a3 addRxFWDelay:-[AWDSidecarPeerTraffic rxFWDelayAtIndex:](self, "rxFWDelayAtIndex:", i2)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self rxDataRatesCount])
  {
    [a3 clearRxDataRates];
    unint64_t v42 = [(AWDSidecarPeerTraffic *)self rxDataRatesCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (uint64_t i3 = 0; i3 != v43; ++i3)
        [a3 addRxDataRate:-[AWDSidecarPeerTraffic rxDataRateAtIndex:](self, "rxDataRateAtIndex:", i3)];
    }
  }
  if ([(AWDSidecarPeerTraffic *)self rxRSSIsCount])
  {
    [a3 clearRxRSSIs];
    unint64_t v45 = [(AWDSidecarPeerTraffic *)self rxRSSIsCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i4 = 0; i4 != v46; ++i4)
        [a3 addRxRSSI:-[AWDSidecarPeerTraffic rxRSSIAtIndex:](self, "rxRSSIAtIndex:", i4)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_txSuccessCount;
    *(unsigned char *)(v5 + 144) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_txExpiredCount;
  *(unsigned char *)(v5 + 144) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_txErrorCount;
    *(unsigned char *)(v5 + 144) |= 1u;
  }
LABEL_5:
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  txTotalDelays = self->_txTotalDelays;
  uint64_t v9 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v145 objects:v162 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v146;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v146 != v11) {
          objc_enumerationMutation(txTotalDelays);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v145 + 1) + 8 * i) copyWithZone:a3];
        [v6 addTxTotalDelay:v13];
      }
      uint64_t v10 = [(NSMutableArray *)txTotalDelays countByEnumeratingWithState:&v145 objects:v162 count:16];
    }
    while (v10);
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  txIPCDelays = self->_txIPCDelays;
  uint64_t v15 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v141 objects:v161 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v142;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v142 != v17) {
          objc_enumerationMutation(txIPCDelays);
        }
        unint64_t v19 = (void *)[*(id *)(*((void *)&v141 + 1) + 8 * j) copyWithZone:a3];
        [v6 addTxIPCDelay:v19];
      }
      uint64_t v16 = [(NSMutableArray *)txIPCDelays countByEnumeratingWithState:&v141 objects:v161 count:16];
    }
    while (v16);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  txFWDelays = self->_txFWDelays;
  uint64_t v21 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v137 objects:v160 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v138;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v138 != v23) {
          objc_enumerationMutation(txFWDelays);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v137 + 1) + 8 * k) copyWithZone:a3];
        [v6 addTxFWDelay:v25];
      }
      uint64_t v22 = [(NSMutableArray *)txFWDelays countByEnumeratingWithState:&v137 objects:v160 count:16];
    }
    while (v22);
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  txHWDelays = self->_txHWDelays;
  uint64_t v27 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v133 objects:v159 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v134;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v134 != v29) {
          objc_enumerationMutation(txHWDelays);
        }
        unint64_t v31 = (void *)[*(id *)(*((void *)&v133 + 1) + 8 * m) copyWithZone:a3];
        [v6 addTxHWDelay:v31];
      }
      uint64_t v28 = [(NSMutableArray *)txHWDelays countByEnumeratingWithState:&v133 objects:v159 count:16];
    }
    while (v28);
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  txDataRates = self->_txDataRates;
  uint64_t v33 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v129 objects:v158 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v130;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v130 != v35) {
          objc_enumerationMutation(txDataRates);
        }
        unint64_t v37 = (void *)[*(id *)(*((void *)&v129 + 1) + 8 * n) copyWithZone:a3];
        [v6 addTxDataRate:v37];
      }
      uint64_t v34 = [(NSMutableArray *)txDataRates countByEnumeratingWithState:&v129 objects:v158 count:16];
    }
    while (v34);
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  txCCAs = self->_txCCAs;
  uint64_t v39 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v125 objects:v157 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v126;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v126 != v41) {
          objc_enumerationMutation(txCCAs);
        }
        unint64_t v43 = (void *)[*(id *)(*((void *)&v125 + 1) + 8 * ii) copyWithZone:a3];
        [v6 addTxCCA:v43];
      }
      uint64_t v40 = [(NSMutableArray *)txCCAs countByEnumeratingWithState:&v125 objects:v157 count:16];
    }
    while (v40);
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  txRetries = self->_txRetries;
  uint64_t v45 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v121 objects:v156 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v122;
    do
    {
      for (juint64_t j = 0; jj != v46; ++jj)
      {
        if (*(void *)v122 != v47) {
          objc_enumerationMutation(txRetries);
        }
        uint64_t v49 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * jj) copyWithZone:a3];
        [v6 addTxRetries:v49];
      }
      uint64_t v46 = [(NSMutableArray *)txRetries countByEnumeratingWithState:&v121 objects:v156 count:16];
    }
    while (v46);
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  txPacketBurstSizes = self->_txPacketBurstSizes;
  uint64_t v51 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v117 objects:v155 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v118;
    do
    {
      for (kuint64_t k = 0; kk != v52; ++kk)
      {
        if (*(void *)v118 != v53) {
          objc_enumerationMutation(txPacketBurstSizes);
        }
        uint64_t v55 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * kk) copyWithZone:a3];
        [v6 addTxPacketBurstSize:v55];
      }
      uint64_t v52 = [(NSMutableArray *)txPacketBurstSizes countByEnumeratingWithState:&v117 objects:v155 count:16];
    }
    while (v52);
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  txPacketBurstIntervals = self->_txPacketBurstIntervals;
  uint64_t v57 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v113 objects:v154 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v114;
    do
    {
      for (muint64_t m = 0; mm != v58; ++mm)
      {
        if (*(void *)v114 != v59) {
          objc_enumerationMutation(txPacketBurstIntervals);
        }
        uint64_t v61 = (void *)[*(id *)(*((void *)&v113 + 1) + 8 * mm) copyWithZone:a3];
        [v6 addTxPacketBurstInterval:v61];
      }
      uint64_t v58 = [(NSMutableArray *)txPacketBurstIntervals countByEnumeratingWithState:&v113 objects:v154 count:16];
    }
    while (v58);
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  rxTotalDelays = self->_rxTotalDelays;
  uint64_t v63 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v109 objects:v153 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v110;
    do
    {
      for (nuint64_t n = 0; nn != v64; ++nn)
      {
        if (*(void *)v110 != v65) {
          objc_enumerationMutation(rxTotalDelays);
        }
        uint64_t v67 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * nn) copyWithZone:a3];
        [v6 addRxTotalDelay:v67];
      }
      uint64_t v64 = [(NSMutableArray *)rxTotalDelays countByEnumeratingWithState:&v109 objects:v153 count:16];
    }
    while (v64);
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  rxIPCDelays = self->_rxIPCDelays;
  uint64_t v69 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v105 objects:v152 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v106;
    do
    {
      for (uint64_t i1 = 0; i1 != v70; ++i1)
      {
        if (*(void *)v106 != v71) {
          objc_enumerationMutation(rxIPCDelays);
        }
        uint64_t v73 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * i1) copyWithZone:a3];
        [v6 addRxIPCDelay:v73];
      }
      uint64_t v70 = [(NSMutableArray *)rxIPCDelays countByEnumeratingWithState:&v105 objects:v152 count:16];
    }
    while (v70);
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  rxFWDelays = self->_rxFWDelays;
  uint64_t v75 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v101 objects:v151 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v102;
    do
    {
      for (uint64_t i2 = 0; i2 != v76; ++i2)
      {
        if (*(void *)v102 != v77) {
          objc_enumerationMutation(rxFWDelays);
        }
        long long v79 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * i2) copyWithZone:a3];
        [v6 addRxFWDelay:v79];
      }
      uint64_t v76 = [(NSMutableArray *)rxFWDelays countByEnumeratingWithState:&v101 objects:v151 count:16];
    }
    while (v76);
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  rxDataRates = self->_rxDataRates;
  uint64_t v81 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v97 objects:v150 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v98;
    do
    {
      for (uint64_t i3 = 0; i3 != v82; ++i3)
      {
        if (*(void *)v98 != v83) {
          objc_enumerationMutation(rxDataRates);
        }
        long long v85 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * i3) copyWithZone:a3];
        [v6 addRxDataRate:v85];
      }
      uint64_t v82 = [(NSMutableArray *)rxDataRates countByEnumeratingWithState:&v97 objects:v150 count:16];
    }
    while (v82);
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  rxRSSIs = self->_rxRSSIs;
  uint64_t v87 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v93 objects:v149 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v94;
    do
    {
      for (uint64_t i4 = 0; i4 != v88; ++i4)
      {
        if (*(void *)v94 != v89) {
          objc_enumerationMutation(rxRSSIs);
        }
        long long v91 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * i4) copyWithZone:a3];
        [v6 addRxRSSI:v91];
      }
      uint64_t v88 = [(NSMutableArray *)rxRSSIs countByEnumeratingWithState:&v93 objects:v149 count:16];
    }
    while (v88);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 144) & 4) == 0 || self->_txSuccessCount != *((void *)a3 + 3)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 144) & 4) != 0)
    {
LABEL_45:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 144) & 2) == 0 || self->_txExpiredCount != *((void *)a3 + 2)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 144) & 2) != 0)
    {
      goto LABEL_45;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 144) & 1) == 0 || self->_txErrorCount != *((void *)a3 + 1)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)a3 + 144))
    {
      goto LABEL_45;
    }
    txTotalDelays = self->_txTotalDelays;
    if (!((unint64_t)txTotalDelays | *((void *)a3 + 17))
      || (int v5 = -[NSMutableArray isEqual:](txTotalDelays, "isEqual:")) != 0)
    {
      txIPCDelays = self->_txIPCDelays;
      if (!((unint64_t)txIPCDelays | *((void *)a3 + 13))
        || (int v5 = -[NSMutableArray isEqual:](txIPCDelays, "isEqual:")) != 0)
      {
        txFWDelays = self->_txFWDelays;
        if (!((unint64_t)txFWDelays | *((void *)a3 + 11))
          || (int v5 = -[NSMutableArray isEqual:](txFWDelays, "isEqual:")) != 0)
        {
          txHWDelays = self->_txHWDelays;
          if (!((unint64_t)txHWDelays | *((void *)a3 + 12))
            || (int v5 = -[NSMutableArray isEqual:](txHWDelays, "isEqual:")) != 0)
          {
            txDataRates = self->_txDataRates;
            if (!((unint64_t)txDataRates | *((void *)a3 + 10))
              || (int v5 = -[NSMutableArray isEqual:](txDataRates, "isEqual:")) != 0)
            {
              txCCAs = self->_txCCAs;
              if (!((unint64_t)txCCAs | *((void *)a3 + 9))
                || (int v5 = -[NSMutableArray isEqual:](txCCAs, "isEqual:")) != 0)
              {
                txRetries = self->_txRetries;
                if (!((unint64_t)txRetries | *((void *)a3 + 16))
                  || (int v5 = -[NSMutableArray isEqual:](txRetries, "isEqual:")) != 0)
                {
                  txPacketBurstSizes = self->_txPacketBurstSizes;
                  if (!((unint64_t)txPacketBurstSizes | *((void *)a3 + 15))
                    || (int v5 = -[NSMutableArray isEqual:](txPacketBurstSizes, "isEqual:")) != 0)
                  {
                    txPacketBurstIntervals = self->_txPacketBurstIntervals;
                    if (!((unint64_t)txPacketBurstIntervals | *((void *)a3 + 14))
                      || (int v5 = -[NSMutableArray isEqual:](txPacketBurstIntervals, "isEqual:")) != 0)
                    {
                      rxTotalDelays = self->_rxTotalDelays;
                      if (!((unint64_t)rxTotalDelays | *((void *)a3 + 8))
                        || (int v5 = -[NSMutableArray isEqual:](rxTotalDelays, "isEqual:")) != 0)
                      {
                        rxIPCDelays = self->_rxIPCDelays;
                        if (!((unint64_t)rxIPCDelays | *((void *)a3 + 6))
                          || (int v5 = -[NSMutableArray isEqual:](rxIPCDelays, "isEqual:")) != 0)
                        {
                          rxFWDelays = self->_rxFWDelays;
                          if (!((unint64_t)rxFWDelays | *((void *)a3 + 5))
                            || (int v5 = -[NSMutableArray isEqual:](rxFWDelays, "isEqual:")) != 0)
                          {
                            rxDataRates = self->_rxDataRates;
                            if (!((unint64_t)rxDataRates | *((void *)a3 + 4))
                              || (int v5 = -[NSMutableArray isEqual:](rxDataRates, "isEqual:")) != 0)
                            {
                              rxRSSIs = self->_rxRSSIs;
                              if ((unint64_t)rxRSSIs | *((void *)a3 + 7))
                              {
                                LOBYTE(v5) = -[NSMutableArray isEqual:](rxRSSIs, "isEqual:");
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
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  unint64_t v3 = 2654435761u * self->_txSuccessCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_txExpiredCount;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_txErrorCount;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_txTotalDelays hash];
  uint64_t v7 = [(NSMutableArray *)self->_txIPCDelays hash];
  uint64_t v8 = v6 ^ v7 ^ [(NSMutableArray *)self->_txFWDelays hash];
  uint64_t v9 = [(NSMutableArray *)self->_txHWDelays hash];
  uint64_t v10 = v9 ^ [(NSMutableArray *)self->_txDataRates hash];
  uint64_t v11 = v8 ^ v10 ^ [(NSMutableArray *)self->_txCCAs hash];
  uint64_t v12 = [(NSMutableArray *)self->_txRetries hash];
  uint64_t v13 = v12 ^ [(NSMutableArray *)self->_txPacketBurstSizes hash];
  uint64_t v14 = v13 ^ [(NSMutableArray *)self->_txPacketBurstIntervals hash];
  uint64_t v15 = v11 ^ v14 ^ [(NSMutableArray *)self->_rxTotalDelays hash];
  uint64_t v16 = [(NSMutableArray *)self->_rxIPCDelays hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_rxFWDelays hash];
  uint64_t v18 = v17 ^ [(NSMutableArray *)self->_rxDataRates hash];
  return v15 ^ v18 ^ [(NSMutableArray *)self->_rxRSSIs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 144);
  if ((v5 & 4) != 0)
  {
    self->_txSuccessCount = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 144);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 144) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_txExpiredCount = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 144))
  {
LABEL_4:
    self->_txErrorCount = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 17);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v128 objects:v145 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v129 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDSidecarPeerTraffic *)self addTxTotalDelay:*(void *)(*((void *)&v128 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v128 objects:v145 count:16];
    }
    while (v8);
  }
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 13);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v124 objects:v144 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v125;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v125 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDSidecarPeerTraffic *)self addTxIPCDelay:*(void *)(*((void *)&v124 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v124 objects:v144 count:16];
    }
    while (v13);
  }
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v16 = (void *)*((void *)a3 + 11);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v143 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v121;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v121 != v19) {
          objc_enumerationMutation(v16);
        }
        [(AWDSidecarPeerTraffic *)self addTxFWDelay:*(void *)(*((void *)&v120 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v120 objects:v143 count:16];
    }
    while (v18);
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  uint64_t v21 = (void *)*((void *)a3 + 12);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v116 objects:v142 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v117;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v117 != v24) {
          objc_enumerationMutation(v21);
        }
        [(AWDSidecarPeerTraffic *)self addTxHWDelay:*(void *)(*((void *)&v116 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v116 objects:v142 count:16];
    }
    while (v23);
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  uint64_t v26 = (void *)*((void *)a3 + 10);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v112 objects:v141 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v113;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v113 != v29) {
          objc_enumerationMutation(v26);
        }
        [(AWDSidecarPeerTraffic *)self addTxDataRate:*(void *)(*((void *)&v112 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v112 objects:v141 count:16];
    }
    while (v28);
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  unint64_t v31 = (void *)*((void *)a3 + 9);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v108 objects:v140 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v109;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v109 != v34) {
          objc_enumerationMutation(v31);
        }
        [(AWDSidecarPeerTraffic *)self addTxCCA:*(void *)(*((void *)&v108 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v108 objects:v140 count:16];
    }
    while (v33);
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  unint64_t v36 = (void *)*((void *)a3 + 16);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v104 objects:v139 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v105;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v105 != v39) {
          objc_enumerationMutation(v36);
        }
        [(AWDSidecarPeerTraffic *)self addTxRetries:*(void *)(*((void *)&v104 + 1) + 8 * jj)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v104 objects:v139 count:16];
    }
    while (v38);
  }
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v41 = (void *)*((void *)a3 + 15);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v100 objects:v138 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v101;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v101 != v44) {
          objc_enumerationMutation(v41);
        }
        [(AWDSidecarPeerTraffic *)self addTxPacketBurstSize:*(void *)(*((void *)&v100 + 1) + 8 * kk)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v100 objects:v138 count:16];
    }
    while (v43);
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v46 = (void *)*((void *)a3 + 14);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v96 objects:v137 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v97;
    do
    {
      for (muint64_t m = 0; mm != v48; ++mm)
      {
        if (*(void *)v97 != v49) {
          objc_enumerationMutation(v46);
        }
        [(AWDSidecarPeerTraffic *)self addTxPacketBurstInterval:*(void *)(*((void *)&v96 + 1) + 8 * mm)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v96 objects:v137 count:16];
    }
    while (v48);
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v51 = (void *)*((void *)a3 + 8);
  uint64_t v52 = [v51 countByEnumeratingWithState:&v92 objects:v136 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v93;
    do
    {
      for (nuint64_t n = 0; nn != v53; ++nn)
      {
        if (*(void *)v93 != v54) {
          objc_enumerationMutation(v51);
        }
        [(AWDSidecarPeerTraffic *)self addRxTotalDelay:*(void *)(*((void *)&v92 + 1) + 8 * nn)];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v92 objects:v136 count:16];
    }
    while (v53);
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v56 = (void *)*((void *)a3 + 6);
  uint64_t v57 = [v56 countByEnumeratingWithState:&v88 objects:v135 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v89;
    do
    {
      for (uint64_t i1 = 0; i1 != v58; ++i1)
      {
        if (*(void *)v89 != v59) {
          objc_enumerationMutation(v56);
        }
        [(AWDSidecarPeerTraffic *)self addRxIPCDelay:*(void *)(*((void *)&v88 + 1) + 8 * i1)];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v88 objects:v135 count:16];
    }
    while (v58);
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v61 = (void *)*((void *)a3 + 5);
  uint64_t v62 = [v61 countByEnumeratingWithState:&v84 objects:v134 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v85;
    do
    {
      for (uint64_t i2 = 0; i2 != v63; ++i2)
      {
        if (*(void *)v85 != v64) {
          objc_enumerationMutation(v61);
        }
        [(AWDSidecarPeerTraffic *)self addRxFWDelay:*(void *)(*((void *)&v84 + 1) + 8 * i2)];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v84 objects:v134 count:16];
    }
    while (v63);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v66 = (void *)*((void *)a3 + 4);
  uint64_t v67 = [v66 countByEnumeratingWithState:&v80 objects:v133 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v81;
    do
    {
      for (uint64_t i3 = 0; i3 != v68; ++i3)
      {
        if (*(void *)v81 != v69) {
          objc_enumerationMutation(v66);
        }
        [(AWDSidecarPeerTraffic *)self addRxDataRate:*(void *)(*((void *)&v80 + 1) + 8 * i3)];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v80 objects:v133 count:16];
    }
    while (v68);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v71 = (void *)*((void *)a3 + 7);
  uint64_t v72 = [v71 countByEnumeratingWithState:&v76 objects:v132 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v77;
    do
    {
      for (uint64_t i4 = 0; i4 != v73; ++i4)
      {
        if (*(void *)v77 != v74) {
          objc_enumerationMutation(v71);
        }
        [(AWDSidecarPeerTraffic *)self addRxRSSI:*(void *)(*((void *)&v76 + 1) + 8 * i4)];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v76 objects:v132 count:16];
    }
    while (v73);
  }
}

- (unint64_t)txSuccessCount
{
  return self->_txSuccessCount;
}

- (unint64_t)txExpiredCount
{
  return self->_txExpiredCount;
}

- (unint64_t)txErrorCount
{
  return self->_txErrorCount;
}

- (NSMutableArray)txTotalDelays
{
  return self->_txTotalDelays;
}

- (void)setTxTotalDelays:(id)a3
{
}

- (NSMutableArray)txIPCDelays
{
  return self->_txIPCDelays;
}

- (void)setTxIPCDelays:(id)a3
{
}

- (NSMutableArray)txFWDelays
{
  return self->_txFWDelays;
}

- (void)setTxFWDelays:(id)a3
{
}

- (NSMutableArray)txHWDelays
{
  return self->_txHWDelays;
}

- (void)setTxHWDelays:(id)a3
{
}

- (NSMutableArray)txDataRates
{
  return self->_txDataRates;
}

- (void)setTxDataRates:(id)a3
{
}

- (NSMutableArray)txCCAs
{
  return self->_txCCAs;
}

- (void)setTxCCAs:(id)a3
{
}

- (NSMutableArray)txRetries
{
  return self->_txRetries;
}

- (void)setTxRetries:(id)a3
{
}

- (NSMutableArray)txPacketBurstSizes
{
  return self->_txPacketBurstSizes;
}

- (void)setTxPacketBurstSizes:(id)a3
{
}

- (NSMutableArray)txPacketBurstIntervals
{
  return self->_txPacketBurstIntervals;
}

- (void)setTxPacketBurstIntervals:(id)a3
{
}

- (NSMutableArray)rxTotalDelays
{
  return self->_rxTotalDelays;
}

- (void)setRxTotalDelays:(id)a3
{
}

- (NSMutableArray)rxIPCDelays
{
  return self->_rxIPCDelays;
}

- (void)setRxIPCDelays:(id)a3
{
}

- (NSMutableArray)rxFWDelays
{
  return self->_rxFWDelays;
}

- (void)setRxFWDelays:(id)a3
{
}

- (NSMutableArray)rxDataRates
{
  return self->_rxDataRates;
}

- (void)setRxDataRates:(id)a3
{
}

- (NSMutableArray)rxRSSIs
{
  return self->_rxRSSIs;
}

- (void)setRxRSSIs:(id)a3
{
}

@end