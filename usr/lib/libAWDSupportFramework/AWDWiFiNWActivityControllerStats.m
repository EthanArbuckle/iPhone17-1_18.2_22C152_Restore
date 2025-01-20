@interface AWDWiFiNWActivityControllerStats
+ (Class)rxmdpuLostType;
+ (Class)rxmpduWMEType;
+ (Class)txmpduWMEType;
- (AWDWiFiNWActivityAggregateMetrics)aggregateMetrics;
- (AWDWiFiNWActivityBtCoex)btCoex;
- (AWDWiFiNWActivityImpedingFunctions)impedingFunctions;
- (AWDWiFiNWActivityPowerPStats)powerActivity;
- (AWDWiFiNWActivityRateAndAggregation)phyrate;
- (AWDWiFiNWActivityScanActivity)scanActivity;
- (BOOL)hasAggregateMetrics;
- (BOOL)hasBackoffStuck;
- (BOOL)hasBtCoex;
- (BOOL)hasCcCaptureDriverLogs;
- (BOOL)hasChannel;
- (BOOL)hasChannelBandwidth;
- (BOOL)hasChannelsVisited0;
- (BOOL)hasChannelsVisited1;
- (BOOL)hasCommanderHalted;
- (BOOL)hasCommandsIssued;
- (BOOL)hasControllerResets;
- (BOOL)hasImpedingFunctions;
- (BOOL)hasIorSuccess;
- (BOOL)hasIorWA;
- (BOOL)hasPhyrate;
- (BOOL)hasPowerActivity;
- (BOOL)hasScanActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rxmdpuLosts;
- (NSMutableArray)rxmpduWMEs;
- (NSMutableArray)txmpduWMEs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rxmdpuLostAtIndex:(unint64_t)a3;
- (id)rxmpduWMEAtIndex:(unint64_t)a3;
- (id)txmpduWMEAtIndex:(unint64_t)a3;
- (unint64_t)commandsIssued;
- (unint64_t)hash;
- (unint64_t)rxmdpuLostsCount;
- (unint64_t)rxmpduWMEsCount;
- (unint64_t)txmpduWMEsCount;
- (unsigned)backoffStuck;
- (unsigned)ccCaptureDriverLogs;
- (unsigned)channel;
- (unsigned)channelBandwidth;
- (unsigned)channelsVisited0;
- (unsigned)channelsVisited1;
- (unsigned)commanderHalted;
- (unsigned)controllerResets;
- (unsigned)iorSuccess;
- (unsigned)iorWA;
- (void)addRxmdpuLost:(id)a3;
- (void)addRxmpduWME:(id)a3;
- (void)addTxmpduWME:(id)a3;
- (void)clearRxmdpuLosts;
- (void)clearRxmpduWMEs;
- (void)clearTxmpduWMEs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAggregateMetrics:(id)a3;
- (void)setBackoffStuck:(unsigned int)a3;
- (void)setBtCoex:(id)a3;
- (void)setCcCaptureDriverLogs:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelBandwidth:(unsigned int)a3;
- (void)setChannelsVisited0:(unsigned int)a3;
- (void)setChannelsVisited1:(unsigned int)a3;
- (void)setCommanderHalted:(unsigned int)a3;
- (void)setCommandsIssued:(unint64_t)a3;
- (void)setControllerResets:(unsigned int)a3;
- (void)setHasBackoffStuck:(BOOL)a3;
- (void)setHasCcCaptureDriverLogs:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelBandwidth:(BOOL)a3;
- (void)setHasChannelsVisited0:(BOOL)a3;
- (void)setHasChannelsVisited1:(BOOL)a3;
- (void)setHasCommanderHalted:(BOOL)a3;
- (void)setHasCommandsIssued:(BOOL)a3;
- (void)setHasControllerResets:(BOOL)a3;
- (void)setHasIorSuccess:(BOOL)a3;
- (void)setHasIorWA:(BOOL)a3;
- (void)setImpedingFunctions:(id)a3;
- (void)setIorSuccess:(unsigned int)a3;
- (void)setIorWA:(unsigned int)a3;
- (void)setPhyrate:(id)a3;
- (void)setPowerActivity:(id)a3;
- (void)setRxmdpuLosts:(id)a3;
- (void)setRxmpduWMEs:(id)a3;
- (void)setScanActivity:(id)a3;
- (void)setTxmpduWMEs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityControllerStats

- (void)dealloc
{
  [(AWDWiFiNWActivityControllerStats *)self setScanActivity:0];
  [(AWDWiFiNWActivityControllerStats *)self setPowerActivity:0];
  [(AWDWiFiNWActivityControllerStats *)self setImpedingFunctions:0];
  [(AWDWiFiNWActivityControllerStats *)self setAggregateMetrics:0];
  [(AWDWiFiNWActivityControllerStats *)self setBtCoex:0];
  [(AWDWiFiNWActivityControllerStats *)self setPhyrate:0];
  [(AWDWiFiNWActivityControllerStats *)self setTxmpduWMEs:0];
  [(AWDWiFiNWActivityControllerStats *)self setRxmpduWMEs:0];
  [(AWDWiFiNWActivityControllerStats *)self setRxmdpuLosts:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityControllerStats;
  [(AWDWiFiNWActivityControllerStats *)&v3 dealloc];
}

- (void)setControllerResets:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_controllerResets = a3;
}

- (void)setHasControllerResets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasControllerResets
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBackoffStuck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_backoffStuck = a3;
}

- (void)setHasBackoffStuck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBackoffStuck
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasScanActivity
{
  return self->_scanActivity != 0;
}

- (BOOL)hasPowerActivity
{
  return self->_powerActivity != 0;
}

- (BOOL)hasImpedingFunctions
{
  return self->_impedingFunctions != 0;
}

- (BOOL)hasAggregateMetrics
{
  return self->_aggregateMetrics != 0;
}

- (BOOL)hasBtCoex
{
  return self->_btCoex != 0;
}

- (void)setChannelsVisited0:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_channelsVisited0 = a3;
}

- (void)setHasChannelsVisited0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasChannelsVisited0
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setChannelsVisited1:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channelsVisited1 = a3;
}

- (void)setHasChannelsVisited1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannelsVisited1
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPhyrate
{
  return self->_phyrate != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setChannelBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_channelBandwidth = a3;
}

- (void)setHasChannelBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChannelBandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCcCaptureDriverLogs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccCaptureDriverLogs = a3;
}

- (void)setHasCcCaptureDriverLogs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcCaptureDriverLogs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCommandsIssued:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_commandsIssued = a3;
}

- (void)setHasCommandsIssued:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCommandsIssued
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCommanderHalted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_commanderHalted = a3;
}

- (void)setHasCommanderHalted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCommanderHalted
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIorSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_iorSuccess = a3;
}

- (void)setHasIorSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIorSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIorWA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_iorWA = a3;
}

- (void)setHasIorWA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIorWA
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearTxmpduWMEs
{
}

- (void)addTxmpduWME:(id)a3
{
  txmpduWMEs = self->_txmpduWMEs;
  if (!txmpduWMEs)
  {
    txmpduWMEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txmpduWMEs = txmpduWMEs;
  }

  [(NSMutableArray *)txmpduWMEs addObject:a3];
}

- (unint64_t)txmpduWMEsCount
{
  return [(NSMutableArray *)self->_txmpduWMEs count];
}

- (id)txmpduWMEAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txmpduWMEs objectAtIndex:a3];
}

+ (Class)txmpduWMEType
{
  return (Class)objc_opt_class();
}

- (void)clearRxmpduWMEs
{
}

- (void)addRxmpduWME:(id)a3
{
  rxmpduWMEs = self->_rxmpduWMEs;
  if (!rxmpduWMEs)
  {
    rxmpduWMEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxmpduWMEs = rxmpduWMEs;
  }

  [(NSMutableArray *)rxmpduWMEs addObject:a3];
}

- (unint64_t)rxmpduWMEsCount
{
  return [(NSMutableArray *)self->_rxmpduWMEs count];
}

- (id)rxmpduWMEAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxmpduWMEs objectAtIndex:a3];
}

+ (Class)rxmpduWMEType
{
  return (Class)objc_opt_class();
}

- (void)clearRxmdpuLosts
{
}

- (void)addRxmdpuLost:(id)a3
{
  rxmdpuLosts = self->_rxmdpuLosts;
  if (!rxmdpuLosts)
  {
    rxmdpuLosts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxmdpuLosts = rxmdpuLosts;
  }

  [(NSMutableArray *)rxmdpuLosts addObject:a3];
}

- (unint64_t)rxmdpuLostsCount
{
  return [(NSMutableArray *)self->_rxmdpuLosts count];
}

- (id)rxmdpuLostAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxmdpuLosts objectAtIndex:a3];
}

+ (Class)rxmdpuLostType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityControllerStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityControllerStats description](&v3, sel_description), -[AWDWiFiNWActivityControllerStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_controllerResets] forKey:@"controllerResets"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_backoffStuck] forKey:@"backoffStuck"];
  }
  scanActivity = self->_scanActivity;
  if (scanActivity) {
    [v3 setObject: -[AWDWiFiNWActivityScanActivity dictionaryRepresentation](scanActivity, "dictionaryRepresentation") forKey:@"scanActivity"];
  }
  powerActivity = self->_powerActivity;
  if (powerActivity) {
    [v3 setObject:[[-[AWDWiFiNWActivityPowerPStats dictionaryRepresentation](powerActivity, "dictionaryRepresentation")] forKey:@"powerActivity"];
  }
  impedingFunctions = self->_impedingFunctions;
  if (impedingFunctions) {
    [v3 setObject:[[-[AWDWiFiNWActivityImpedingFunctions dictionaryRepresentation](impedingFunctions, "dictionaryRepresentation")];
  }
  aggregateMetrics = self->_aggregateMetrics;
  if (aggregateMetrics) {
    [v3 setObject:-[AWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](aggregateMetrics, "dictionaryRepresentation") forKey:@"aggregateMetrics"];
  }
  btCoex = self->_btCoex;
  if (btCoex) {
    [v3 setObject:[[-[AWDWiFiNWActivityBtCoex dictionaryRepresentation](btCoex, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"btCoex"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelsVisited0] forKey:@"channelsVisited0"];
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelsVisited1] forKey:@"channelsVisited1"];
  }
  phyrate = self->_phyrate;
  if (phyrate) {
    [v3 setObject:phyrate forKey:[AWDWiFiNWActivityRateAndAggregation dictionaryRepresentation]];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x10) == 0)
    {
LABEL_23:
      if ((v12 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_59;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelBandwidth] forKey:@"channelBandwidth"];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 4) == 0)
  {
LABEL_24:
    if ((v12 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccCaptureDriverLogs] forKey:@"ccCaptureDriverLogs"];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_25:
    if ((v12 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_commandsIssued] forKey:@"commandsIssued"];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_26:
    if ((v12 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_commanderHalted] forKey:@"commanderHalted"];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_27:
    if ((v12 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_iorSuccess] forKey:@"iorSuccess"];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_28:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_iorWA] forKey:@"iorWA"];
LABEL_29:
  if ([(NSMutableArray *)self->_txmpduWMEs count])
  {
    v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txmpduWMEs, "count")];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    txmpduWMEs = self->_txmpduWMEs;
    uint64_t v15 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(txmpduWMEs);
          }
          [v13 addObject:[*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v16 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v16);
    }
    [v3 setObject:v13 forKey:@"txmpduWME"];
  }
  if ([(NSMutableArray *)self->_rxmpduWMEs count])
  {
    v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxmpduWMEs, "count")];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    rxmpduWMEs = self->_rxmpduWMEs;
    uint64_t v21 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(rxmpduWMEs);
          }
          [v19 addObject:[*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v22 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v22);
    }
    [v3 setObject:v19 forKey:@"rxmpduWME"];
  }
  if ([(NSMutableArray *)self->_rxmdpuLosts count])
  {
    v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxmdpuLosts, "count")];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    rxmdpuLosts = self->_rxmdpuLosts;
    uint64_t v27 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(rxmdpuLosts);
          }
          [v25 addObject:[*(id *)(*((void *)&v32 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v28 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v28);
    }
    [v3 setObject:v25 forKey:@"rxmdpuLost"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityControllerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_scanActivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_powerActivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_impedingFunctions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_aggregateMetrics) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btCoex) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_phyrate) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_24:
    if ((v6 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_25:
    if ((v6 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_27:
    if ((v6 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_28:
  }
    PBDataWriterWriteUint32Field();
LABEL_29:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  txmpduWMEs = self->_txmpduWMEs;
  uint64_t v8 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(txmpduWMEs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  rxmpduWMEs = self->_rxmpduWMEs;
  uint64_t v13 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(rxmpduWMEs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  rxmdpuLosts = self->_rxmdpuLosts;
  uint64_t v18 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(rxmdpuLosts);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_controllerResets;
    *((_WORD *)a3 + 68) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_backoffStuck;
    *((_WORD *)a3 + 68) |= 2u;
  }
  if (self->_scanActivity) {
    [a3 setScanActivity:];
  }
  if (self->_powerActivity) {
    [a3 setPowerActivity:];
  }
  if (self->_impedingFunctions) {
    [a3 setImpedingFunctions:];
  }
  if (self->_aggregateMetrics) {
    [a3 setAggregateMetrics:];
  }
  if (self->_btCoex) {
    [a3 setBtCoex:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_channelsVisited0;
    *((_WORD *)a3 + 68) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_channelsVisited1;
    *((_WORD *)a3 + 68) |= 0x40u;
  }
  if (self->_phyrate) {
    [a3 setPhyrate:];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_channel;
    *((_WORD *)a3 + 68) |= 8u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_44;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)a3 + 12) = self->_channelBandwidth;
  *((_WORD *)a3 + 68) |= 0x10u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 10) = self->_ccCaptureDriverLogs;
  *((_WORD *)a3 + 68) |= 4u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 1) = self->_commandsIssued;
  *((_WORD *)a3 + 68) |= 1u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0) {
      goto LABEL_27;
    }
LABEL_47:
    *((_DWORD *)a3 + 20) = self->_iorSuccess;
    *((_WORD *)a3 + 68) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_46:
  *((_DWORD *)a3 + 15) = self->_commanderHalted;
  *((_WORD *)a3 + 68) |= 0x80u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0) {
    goto LABEL_47;
  }
LABEL_27:
  if ((v7 & 0x400) != 0)
  {
LABEL_28:
    *((_DWORD *)a3 + 21) = self->_iorWA;
    *((_WORD *)a3 + 68) |= 0x400u;
  }
LABEL_29:
  if ([(AWDWiFiNWActivityControllerStats *)self txmpduWMEsCount])
  {
    [a3 clearTxmpduWMEs];
    unint64_t v8 = [(AWDWiFiNWActivityControllerStats *)self txmpduWMEsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
        [a3 addTxmpduWME:-[AWDWiFiNWActivityControllerStats txmpduWMEAtIndex:](self, "txmpduWMEAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivityControllerStats *)self rxmpduWMEsCount])
  {
    [a3 clearRxmpduWMEs];
    unint64_t v11 = [(AWDWiFiNWActivityControllerStats *)self rxmpduWMEsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
        [a3 addRxmpduWME:-[AWDWiFiNWActivityControllerStats rxmpduWMEAtIndex:](self, "rxmpduWMEAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivityControllerStats *)self rxmdpuLostsCount])
  {
    [a3 clearRxmdpuLosts];
    unint64_t v14 = [(AWDWiFiNWActivityControllerStats *)self rxmdpuLostsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
        [a3 addRxmdpuLost:-[AWDWiFiNWActivityControllerStats rxmdpuLostAtIndex:](self, "rxmdpuLostAtIndex:", k)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_controllerResets;
    *(_WORD *)(v5 + 136) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_backoffStuck;
    *(_WORD *)(v5 + 136) |= 2u;
  }

  *(void *)(v6 + 120) = [(AWDWiFiNWActivityScanActivity *)self->_scanActivity copyWithZone:a3];
  *(void *)(v6 + 96) = [(AWDWiFiNWActivityPowerPStats *)self->_powerActivity copyWithZone:a3];

  *(void *)(v6 + 72) = [(AWDWiFiNWActivityImpedingFunctions *)self->_impedingFunctions copyWithZone:a3];
  *(void *)(v6 + 16) = [(AWDWiFiNWActivityAggregateMetrics *)self->_aggregateMetrics copyWithZone:a3];

  *(void *)(v6 + 32) = [(AWDWiFiNWActivityBtCoex *)self->_btCoex copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_channelsVisited0;
    *(_WORD *)(v6 + 136) |= 0x20u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_channelsVisited1;
    *(_WORD *)(v6 + 136) |= 0x40u;
  }

  *(void *)(v6 + 88) = [(AWDWiFiNWActivityRateAndAggregation *)self->_phyrate copyWithZone:a3];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_channel;
    *(_WORD *)(v6 + 136) |= 8u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x10) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_41;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 48) = self->_channelBandwidth;
  *(_WORD *)(v6 + 136) |= 0x10u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 40) = self->_ccCaptureDriverLogs;
  *(_WORD *)(v6 + 136) |= 4u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_13:
    if ((v9 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(void *)(v6 + 8) = self->_commandsIssued;
  *(_WORD *)(v6 + 136) |= 1u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_14:
    if ((v9 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 60) = self->_commanderHalted;
  *(_WORD *)(v6 + 136) |= 0x80u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_15:
    if ((v9 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_44:
  *(_DWORD *)(v6 + 80) = self->_iorSuccess;
  *(_WORD *)(v6 + 136) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 84) = self->_iorWA;
    *(_WORD *)(v6 + 136) |= 0x400u;
  }
LABEL_17:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  txmpduWMEs = self->_txmpduWMEs;
  uint64_t v11 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(txmpduWMEs);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addTxmpduWME:v15];
      }
      uint64_t v12 = [(NSMutableArray *)txmpduWMEs countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v12);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  rxmpduWMEs = self->_rxmpduWMEs;
  uint64_t v17 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(rxmpduWMEs);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addRxmpduWME:v21];
      }
      uint64_t v18 = [(NSMutableArray *)rxmpduWMEs countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v18);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  rxmdpuLosts = self->_rxmdpuLosts;
  uint64_t v23 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(rxmdpuLosts);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addRxmdpuLost:v27];
      }
      uint64_t v24 = [(NSMutableArray *)rxmdpuLosts countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 68);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 68) & 0x100) == 0 || self->_controllerResets != *((_DWORD *)a3 + 16)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 68) & 0x100) != 0)
    {
LABEL_76:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_backoffStuck != *((_DWORD *)a3 + 6)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_76;
    }
    scanActivity = self->_scanActivity;
    if (!((unint64_t)scanActivity | *((void *)a3 + 15))
      || (int v5 = -[AWDWiFiNWActivityScanActivity isEqual:](scanActivity, "isEqual:")) != 0)
    {
      powerActivity = self->_powerActivity;
      if (!((unint64_t)powerActivity | *((void *)a3 + 12))
        || (int v5 = -[AWDWiFiNWActivityPowerPStats isEqual:](powerActivity, "isEqual:")) != 0)
      {
        impedingFunctions = self->_impedingFunctions;
        if (!((unint64_t)impedingFunctions | *((void *)a3 + 9))
          || (int v5 = -[AWDWiFiNWActivityImpedingFunctions isEqual:](impedingFunctions, "isEqual:")) != 0)
        {
          aggregateMetrics = self->_aggregateMetrics;
          if (!((unint64_t)aggregateMetrics | *((void *)a3 + 2))
            || (int v5 = -[AWDWiFiNWActivityAggregateMetrics isEqual:](aggregateMetrics, "isEqual:")) != 0)
          {
            btCoex = self->_btCoex;
            if (!((unint64_t)btCoex | *((void *)a3 + 4))
              || (int v5 = -[AWDWiFiNWActivityBtCoex isEqual:](btCoex, "isEqual:")) != 0)
            {
              __int16 v13 = (__int16)self->_has;
              __int16 v14 = *((_WORD *)a3 + 68);
              if ((v13 & 0x20) != 0)
              {
                if ((v14 & 0x20) == 0 || self->_channelsVisited0 != *((_DWORD *)a3 + 13)) {
                  goto LABEL_76;
                }
              }
              else if ((v14 & 0x20) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x40) != 0)
              {
                if ((v14 & 0x40) == 0 || self->_channelsVisited1 != *((_DWORD *)a3 + 14)) {
                  goto LABEL_76;
                }
              }
              else if ((v14 & 0x40) != 0)
              {
                goto LABEL_76;
              }
              phyrate = self->_phyrate;
              if ((unint64_t)phyrate | *((void *)a3 + 11))
              {
                int v5 = -[AWDWiFiNWActivityRateAndAggregation isEqual:](phyrate, "isEqual:");
                if (!v5) {
                  return v5;
                }
                __int16 v13 = (__int16)self->_has;
              }
              __int16 v16 = *((_WORD *)a3 + 68);
              if ((v13 & 8) != 0)
              {
                if ((v16 & 8) == 0 || self->_channel != *((_DWORD *)a3 + 11)) {
                  goto LABEL_76;
                }
              }
              else if ((v16 & 8) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x10) != 0)
              {
                if ((v16 & 0x10) == 0 || self->_channelBandwidth != *((_DWORD *)a3 + 12)) {
                  goto LABEL_76;
                }
              }
              else if ((v16 & 0x10) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 4) != 0)
              {
                if ((v16 & 4) == 0 || self->_ccCaptureDriverLogs != *((_DWORD *)a3 + 10)) {
                  goto LABEL_76;
                }
              }
              else if ((v16 & 4) != 0)
              {
                goto LABEL_76;
              }
              if (v13)
              {
                if ((v16 & 1) == 0 || self->_commandsIssued != *((void *)a3 + 1)) {
                  goto LABEL_76;
                }
              }
              else if (v16)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x80) != 0)
              {
                if ((v16 & 0x80) == 0 || self->_commanderHalted != *((_DWORD *)a3 + 15)) {
                  goto LABEL_76;
                }
              }
              else if ((v16 & 0x80) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x200) != 0)
              {
                if ((*((_WORD *)a3 + 68) & 0x200) == 0 || self->_iorSuccess != *((_DWORD *)a3 + 20)) {
                  goto LABEL_76;
                }
              }
              else if ((*((_WORD *)a3 + 68) & 0x200) != 0)
              {
                goto LABEL_76;
              }
              if ((v13 & 0x400) != 0)
              {
                if ((*((_WORD *)a3 + 68) & 0x400) == 0 || self->_iorWA != *((_DWORD *)a3 + 21)) {
                  goto LABEL_76;
                }
              }
              else if ((*((_WORD *)a3 + 68) & 0x400) != 0)
              {
                goto LABEL_76;
              }
              txmpduWMEs = self->_txmpduWMEs;
              if (!((unint64_t)txmpduWMEs | *((void *)a3 + 16))
                || (int v5 = -[NSMutableArray isEqual:](txmpduWMEs, "isEqual:")) != 0)
              {
                rxmpduWMEs = self->_rxmpduWMEs;
                if (!((unint64_t)rxmpduWMEs | *((void *)a3 + 14))
                  || (int v5 = -[NSMutableArray isEqual:](rxmpduWMEs, "isEqual:")) != 0)
                {
                  rxmdpuLosts = self->_rxmdpuLosts;
                  if ((unint64_t)rxmdpuLosts | *((void *)a3 + 13))
                  {
                    LOBYTE(v5) = -[NSMutableArray isEqual:](rxmdpuLosts, "isEqual:");
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
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v27 = 2654435761 * self->_controllerResets;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = [(AWDWiFiNWActivityScanActivity *)self->_scanActivity hash];
      goto LABEL_6;
    }
  }
  unint64_t v4 = [(AWDWiFiNWActivityScanActivity *)self->_scanActivity hash];
LABEL_6:
  unint64_t v5 = v4;
  unint64_t v6 = [(AWDWiFiNWActivityPowerPStats *)self->_powerActivity hash];
  unint64_t v7 = [(AWDWiFiNWActivityImpedingFunctions *)self->_impedingFunctions hash];
  unint64_t v8 = [(AWDWiFiNWActivityAggregateMetrics *)self->_aggregateMetrics hash];
  unint64_t v9 = [(AWDWiFiNWActivityBtCoex *)self->_btCoex hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    uint64_t v11 = 2654435761 * self->_channelsVisited0;
    if ((v10 & 0x40) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((v10 & 0x40) != 0)
    {
LABEL_8:
      uint64_t v12 = 2654435761 * self->_channelsVisited1;
      goto LABEL_11;
    }
  }
  uint64_t v12 = 0;
LABEL_11:
  unint64_t v13 = [(AWDWiFiNWActivityRateAndAggregation *)self->_phyrate hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    uint64_t v15 = 2654435761 * self->_channel;
    if ((v14 & 0x10) != 0)
    {
LABEL_13:
      uint64_t v16 = 2654435761 * self->_channelBandwidth;
      if ((v14 & 4) != 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((v14 & 0x10) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v16 = 0;
  if ((v14 & 4) != 0)
  {
LABEL_14:
    uint64_t v17 = 2654435761 * self->_ccCaptureDriverLogs;
    if (v14) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v17 = 0;
  if (v14)
  {
LABEL_15:
    unint64_t v18 = 2654435761u * self->_commandsIssued;
    if ((v14 & 0x80) != 0) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v18 = 0;
  if ((v14 & 0x80) != 0)
  {
LABEL_16:
    uint64_t v19 = 2654435761 * self->_commanderHalted;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_24:
    uint64_t v20 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_18;
    }
LABEL_25:
    uint64_t v21 = 0;
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_24;
  }
LABEL_17:
  uint64_t v20 = 2654435761 * self->_iorSuccess;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_25;
  }
LABEL_18:
  uint64_t v21 = 2654435761 * self->_iorWA;
LABEL_26:
  unint64_t v22 = v26 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  uint64_t v23 = v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(NSMutableArray *)self->_txmpduWMEs hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_rxmpduWMEs hash];
  return v22 ^ v24 ^ [(NSMutableArray *)self->_rxmdpuLosts hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  __int16 v5 = *((_WORD *)a3 + 68);
  if ((v5 & 0x100) != 0)
  {
    self->_controllerResets = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)a3 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_backoffStucuint64_t k = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 2u;
  }
  scanActivity = self->_scanActivity;
  uint64_t v7 = *((void *)a3 + 15);
  if (scanActivity)
  {
    if (v7) {
      -[AWDWiFiNWActivityScanActivity mergeFrom:](scanActivity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiNWActivityControllerStats setScanActivity:](self, "setScanActivity:");
  }
  powerActivity = self->_powerActivity;
  uint64_t v9 = *((void *)a3 + 12);
  if (powerActivity)
  {
    if (v9) {
      -[AWDWiFiNWActivityPowerPStats mergeFrom:](powerActivity, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiNWActivityControllerStats setPowerActivity:](self, "setPowerActivity:");
  }
  impedingFunctions = self->_impedingFunctions;
  uint64_t v11 = *((void *)a3 + 9);
  if (impedingFunctions)
  {
    if (v11) {
      -[AWDWiFiNWActivityImpedingFunctions mergeFrom:](impedingFunctions, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiNWActivityControllerStats setImpedingFunctions:](self, "setImpedingFunctions:");
  }
  aggregateMetrics = self->_aggregateMetrics;
  uint64_t v13 = *((void *)a3 + 2);
  if (aggregateMetrics)
  {
    if (v13) {
      -[AWDWiFiNWActivityAggregateMetrics mergeFrom:](aggregateMetrics, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDWiFiNWActivityControllerStats setAggregateMetrics:](self, "setAggregateMetrics:");
  }
  btCoex = self->_btCoex;
  uint64_t v15 = *((void *)a3 + 4);
  if (btCoex)
  {
    if (v15) {
      -[AWDWiFiNWActivityBtCoex mergeFrom:](btCoex, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDWiFiNWActivityControllerStats setBtCoex:](self, "setBtCoex:");
  }
  __int16 v16 = *((_WORD *)a3 + 68);
  if ((v16 & 0x20) != 0)
  {
    self->_channelsVisited0 = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v16 = *((_WORD *)a3 + 68);
  }
  if ((v16 & 0x40) != 0)
  {
    self->_channelsVisited1 = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x40u;
  }
  phyrate = self->_phyrate;
  uint64_t v18 = *((void *)a3 + 11);
  if (phyrate)
  {
    if (v18) {
      -[AWDWiFiNWActivityRateAndAggregation mergeFrom:](phyrate, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[AWDWiFiNWActivityControllerStats setPhyrate:](self, "setPhyrate:");
  }
  __int16 v19 = *((_WORD *)a3 + 68);
  if ((v19 & 8) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 8u;
    __int16 v19 = *((_WORD *)a3 + 68);
    if ((v19 & 0x10) == 0)
    {
LABEL_41:
      if ((v19 & 4) == 0) {
        goto LABEL_42;
      }
      goto LABEL_71;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_41;
  }
  self->_channelBandwidth = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v19 = *((_WORD *)a3 + 68);
  if ((v19 & 4) == 0)
  {
LABEL_42:
    if ((v19 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_ccCaptureDriverLogs = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 4u;
  __int16 v19 = *((_WORD *)a3 + 68);
  if ((v19 & 1) == 0)
  {
LABEL_43:
    if ((v19 & 0x80) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_commandsIssued = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v19 = *((_WORD *)a3 + 68);
  if ((v19 & 0x80) == 0)
  {
LABEL_44:
    if ((v19 & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_commanderHalted = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v19 = *((_WORD *)a3 + 68);
  if ((v19 & 0x200) == 0)
  {
LABEL_45:
    if ((v19 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_74:
  self->_iorSuccess = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 68) & 0x400) != 0)
  {
LABEL_46:
    self->_iorWA = *((_DWORD *)a3 + 21);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_47:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v20 = (void *)*((void *)a3 + 16);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDWiFiNWActivityControllerStats *)self addTxmpduWME:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v22);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v25 = (void *)*((void *)a3 + 14);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        [(AWDWiFiNWActivityControllerStats *)self addRxmpduWME:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v27);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v30 = (void *)*((void *)a3 + 13);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        [(AWDWiFiNWActivityControllerStats *)self addRxmdpuLost:*(void *)(*((void *)&v35 + 1) + 8 * k)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v32);
  }
}

- (unsigned)controllerResets
{
  return self->_controllerResets;
}

- (unsigned)backoffStuck
{
  return self->_backoffStuck;
}

- (AWDWiFiNWActivityScanActivity)scanActivity
{
  return self->_scanActivity;
}

- (void)setScanActivity:(id)a3
{
}

- (AWDWiFiNWActivityPowerPStats)powerActivity
{
  return self->_powerActivity;
}

- (void)setPowerActivity:(id)a3
{
}

- (AWDWiFiNWActivityImpedingFunctions)impedingFunctions
{
  return self->_impedingFunctions;
}

- (void)setImpedingFunctions:(id)a3
{
}

- (AWDWiFiNWActivityAggregateMetrics)aggregateMetrics
{
  return self->_aggregateMetrics;
}

- (void)setAggregateMetrics:(id)a3
{
}

- (AWDWiFiNWActivityBtCoex)btCoex
{
  return self->_btCoex;
}

- (void)setBtCoex:(id)a3
{
}

- (unsigned)channelsVisited0
{
  return self->_channelsVisited0;
}

- (unsigned)channelsVisited1
{
  return self->_channelsVisited1;
}

- (AWDWiFiNWActivityRateAndAggregation)phyrate
{
  return self->_phyrate;
}

- (void)setPhyrate:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelBandwidth
{
  return self->_channelBandwidth;
}

- (unsigned)ccCaptureDriverLogs
{
  return self->_ccCaptureDriverLogs;
}

- (unint64_t)commandsIssued
{
  return self->_commandsIssued;
}

- (unsigned)commanderHalted
{
  return self->_commanderHalted;
}

- (unsigned)iorSuccess
{
  return self->_iorSuccess;
}

- (unsigned)iorWA
{
  return self->_iorWA;
}

- (NSMutableArray)txmpduWMEs
{
  return self->_txmpduWMEs;
}

- (void)setTxmpduWMEs:(id)a3
{
}

- (NSMutableArray)rxmpduWMEs
{
  return self->_rxmpduWMEs;
}

- (void)setRxmpduWMEs:(id)a3
{
}

- (NSMutableArray)rxmdpuLosts
{
  return self->_rxmdpuLosts;
}

- (void)setRxmdpuLosts:(id)a3
{
}

@end