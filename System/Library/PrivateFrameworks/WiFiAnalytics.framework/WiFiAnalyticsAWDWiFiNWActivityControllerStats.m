@interface WiFiAnalyticsAWDWiFiNWActivityControllerStats
+ (Class)rxmdpuLostType;
+ (Class)rxmpduWMEType;
+ (Class)txmpduWMEType;
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
- (BOOL)hasOmi;
- (BOOL)hasPhyrate;
- (BOOL)hasPowerActivity;
- (BOOL)hasRuUsage;
- (BOOL)hasScanActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rxmdpuLosts;
- (NSMutableArray)rxmpduWMEs;
- (NSMutableArray)txmpduWMEs;
- (WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics)aggregateMetrics;
- (WiFiAnalyticsAWDWiFiNWActivityBtCoex)btCoex;
- (WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions)impedingFunctions;
- (WiFiAnalyticsAWDWiFiNWActivityOMI)omi;
- (WiFiAnalyticsAWDWiFiNWActivityPowerPStats)powerActivity;
- (WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation)phyrate;
- (WiFiAnalyticsAWDWiFiNWActivityRuUsage)ruUsage;
- (WiFiAnalyticsAWDWiFiNWActivityScanActivity)scanActivity;
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
- (void)setOmi:(id)a3;
- (void)setPhyrate:(id)a3;
- (void)setPowerActivity:(id)a3;
- (void)setRuUsage:(id)a3;
- (void)setRxmdpuLosts:(id)a3;
- (void)setRxmpduWMEs:(id)a3;
- (void)setScanActivity:(id)a3;
- (void)setTxmpduWMEs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityControllerStats

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
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
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_phyrate) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_57;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_28:
  }
    PBDataWriterWriteUint32Field();
LABEL_29:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v8 = self->_txmpduWMEs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v13 = self->_rxmpduWMEs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = self->_rxmdpuLosts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
  }

  if (self->_omi) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_ruUsage) {
    PBDataWriterWriteSubmessage();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txmpduWMEs, 0);
  objc_storeStrong((id *)&self->_scanActivity, 0);
  objc_storeStrong((id *)&self->_rxmpduWMEs, 0);
  objc_storeStrong((id *)&self->_rxmdpuLosts, 0);
  objc_storeStrong((id *)&self->_ruUsage, 0);
  objc_storeStrong((id *)&self->_powerActivity, 0);
  objc_storeStrong((id *)&self->_phyrate, 0);
  objc_storeStrong((id *)&self->_omi, 0);
  objc_storeStrong((id *)&self->_impedingFunctions, 0);
  objc_storeStrong((id *)&self->_btCoex, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics, 0);
}

- (void)addTxmpduWME:(id)a3
{
  id v4 = a3;
  txmpduWMEs = self->_txmpduWMEs;
  id v8 = v4;
  if (!txmpduWMEs)
  {
    __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    __int16 v7 = self->_txmpduWMEs;
    self->_txmpduWMEs = v6;

    id v4 = v8;
    txmpduWMEs = self->_txmpduWMEs;
  }
  [(NSMutableArray *)txmpduWMEs addObject:v4];
}

- (void)addRxmpduWME:(id)a3
{
  id v4 = a3;
  rxmpduWMEs = self->_rxmpduWMEs;
  id v8 = v4;
  if (!rxmpduWMEs)
  {
    __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    __int16 v7 = self->_rxmpduWMEs;
    self->_rxmpduWMEs = v6;

    id v4 = v8;
    rxmpduWMEs = self->_rxmpduWMEs;
  }
  [(NSMutableArray *)rxmpduWMEs addObject:v4];
}

- (void)addRxmdpuLost:(id)a3
{
  id v4 = a3;
  rxmdpuLosts = self->_rxmdpuLosts;
  id v8 = v4;
  if (!rxmdpuLosts)
  {
    __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    __int16 v7 = self->_rxmdpuLosts;
    self->_rxmdpuLosts = v6;

    id v4 = v8;
    rxmdpuLosts = self->_rxmdpuLosts;
  }
  [(NSMutableArray *)rxmdpuLosts addObject:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_controllerResets];
    [v3 setObject:v5 forKey:@"controllerResets"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    __int16 v6 = [NSNumber numberWithUnsignedInt:self->_backoffStuck];
    [v3 setObject:v6 forKey:@"backoffStuck"];
  }
  scanActivity = self->_scanActivity;
  if (scanActivity)
  {
    id v8 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)scanActivity dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"scanActivity"];
  }
  powerActivity = self->_powerActivity;
  if (powerActivity)
  {
    uint64_t v10 = [(WiFiAnalyticsAWDWiFiNWActivityPowerPStats *)powerActivity dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"powerActivity"];
  }
  impedingFunctions = self->_impedingFunctions;
  if (impedingFunctions)
  {
    v12 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)impedingFunctions dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"impedingFunctions"];
  }
  aggregateMetrics = self->_aggregateMetrics;
  if (aggregateMetrics)
  {
    uint64_t v14 = [(WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *)aggregateMetrics dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"aggregateMetrics"];
  }
  btCoex = self->_btCoex;
  if (btCoex)
  {
    uint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoex *)btCoex dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"btCoex"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:self->_channelsVisited0];
    [v3 setObject:v18 forKey:@"channelsVisited0"];

    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x40) != 0)
  {
    uint64_t v19 = [NSNumber numberWithUnsignedInt:self->_channelsVisited1];
    [v3 setObject:v19 forKey:@"channelsVisited1"];
  }
  phyrate = self->_phyrate;
  if (phyrate)
  {
    uint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)phyrate dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"phyrate"];
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 8) != 0)
  {
    v50 = [NSNumber numberWithUnsignedInt:self->_channel];
    [v3 setObject:v50 forKey:@"channel"];

    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_23:
      if ((v22 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_65;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v51 = [NSNumber numberWithUnsignedInt:self->_channelBandwidth];
  [v3 setObject:v51 forKey:@"channelBandwidth"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_24:
    if ((v22 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  v52 = [NSNumber numberWithUnsignedInt:self->_ccCaptureDriverLogs];
  [v3 setObject:v52 forKey:@"ccCaptureDriverLogs"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 1) == 0)
  {
LABEL_25:
    if ((v22 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  v53 = [NSNumber numberWithUnsignedLongLong:self->_commandsIssued];
  [v3 setObject:v53 forKey:@"commandsIssued"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_26:
    if ((v22 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  v54 = [NSNumber numberWithUnsignedInt:self->_commanderHalted];
  [v3 setObject:v54 forKey:@"commanderHalted"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_27:
    if ((v22 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_68:
  v55 = [NSNumber numberWithUnsignedInt:self->_iorSuccess];
  [v3 setObject:v55 forKey:@"iorSuccess"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_28:
    long long v23 = [NSNumber numberWithUnsignedInt:self->_iorWA];
    [v3 setObject:v23 forKey:@"iorWA"];
  }
LABEL_29:
  if ([(NSMutableArray *)self->_txmpduWMEs count])
  {
    long long v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txmpduWMEs, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v25 = self->_txmpduWMEs;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v65 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v64 + 1) + 8 * i) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"txmpduWME"];
  }
  if ([(NSMutableArray *)self->_rxmpduWMEs count])
  {
    long long v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_rxmpduWMEs, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v32 = self->_rxmpduWMEs;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v61 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v60 + 1) + 8 * j) dictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"rxmpduWME"];
  }
  if ([(NSMutableArray *)self->_rxmdpuLosts count])
  {
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_rxmdpuLosts, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v39 = self->_rxmdpuLosts;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "dictionaryRepresentation", (void)v56);
          [v38 addObject:v44];
        }
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v41);
    }

    [v3 setObject:v38 forKey:@"rxmdpuLost"];
  }
  omuint64_t i = self->_omi;
  if (omi)
  {
    v46 = [(WiFiAnalyticsAWDWiFiNWActivityOMI *)omi dictionaryRepresentation];
    [v3 setObject:v46 forKey:@"omi"];
  }
  ruUsage = self->_ruUsage;
  if (ruUsage)
  {
    v48 = [(WiFiAnalyticsAWDWiFiNWActivityRuUsage *)ruUsage dictionaryRepresentation];
    [v3 setObject:v48 forKey:@"ruUsage"];
  }
  return v3;
}

- (void)setScanActivity:(id)a3
{
}

- (void)setRuUsage:(id)a3
{
}

- (void)setPowerActivity:(id)a3
{
}

- (void)setPhyrate:(id)a3
{
}

- (void)setOmi:(id)a3
{
}

- (void)setIorWA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_iorWA = a3;
}

- (void)setIorSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_iorSuccess = a3;
}

- (void)setImpedingFunctions:(id)a3
{
}

- (void)setControllerResets:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_controllerResets = a3;
}

- (void)setCommandsIssued:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_commandsIssued = a3;
}

- (void)setCommanderHalted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_commanderHalted = a3;
}

- (void)setChannelsVisited1:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channelsVisited1 = a3;
}

- (void)setChannelsVisited0:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_channelsVisited0 = a3;
}

- (void)setChannelBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_channelBandwidth = a3;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setCcCaptureDriverLogs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccCaptureDriverLogs = a3;
}

- (void)setBtCoex:(id)a3
{
}

- (void)setBackoffStuck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_backoffStucuint64_t k = a3;
}

- (void)setAggregateMetrics:(id)a3
{
}

- (void)setHasControllerResets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasControllerResets
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasBackoffStuck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
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

- (void)setHasChannelsVisited0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasChannelsVisited0
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasChannelsVisited1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannelsVisited1
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPhyrate
{
  return self->_phyrate != 0;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasChannelBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChannelBandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasCcCaptureDriverLogs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcCaptureDriverLogs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasCommandsIssued:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCommandsIssued
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasCommanderHalted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCommanderHalted
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIorSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIorSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIorWA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIorWA
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearTxmpduWMEs
{
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

- (BOOL)hasOmi
{
  return self->_omi != 0;
}

- (BOOL)hasRuUsage
{
  return self->_ruUsage != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityControllerStats;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityControllerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[16] = self->_controllerResets;
    *((_WORD *)v4 + 76) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_backoffStuck;
    *((_WORD *)v4 + 76) |= 2u;
  }
  uint64_t v21 = v4;
  if (self->_scanActivity)
  {
    objc_msgSend(v4, "setScanActivity:");
    id v4 = v21;
  }
  if (self->_powerActivity)
  {
    objc_msgSend(v21, "setPowerActivity:");
    id v4 = v21;
  }
  if (self->_impedingFunctions)
  {
    objc_msgSend(v21, "setImpedingFunctions:");
    id v4 = v21;
  }
  if (self->_aggregateMetrics)
  {
    objc_msgSend(v21, "setAggregateMetrics:");
    id v4 = v21;
  }
  if (self->_btCoex)
  {
    objc_msgSend(v21, "setBtCoex:");
    id v4 = v21;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[13] = self->_channelsVisited0;
    *((_WORD *)v4 + 76) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    v4[14] = self->_channelsVisited1;
    *((_WORD *)v4 + 76) |= 0x40u;
  }
  if (self->_phyrate)
  {
    objc_msgSend(v21, "setPhyrate:");
    id v4 = v21;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v4[11] = self->_channel;
    *((_WORD *)v4 + 76) |= 8u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_23:
      if ((v7 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_50;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v4[12] = self->_channelBandwidth;
  *((_WORD *)v4 + 76) |= 0x10u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_24:
    if ((v7 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[10] = self->_ccCaptureDriverLogs;
  *((_WORD *)v4 + 76) |= 4u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_25:
    if ((v7 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v4 + 1) = self->_commandsIssued;
  *((_WORD *)v4 + 76) |= 1u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) == 0)
  {
LABEL_26:
    if ((v7 & 0x200) == 0) {
      goto LABEL_27;
    }
LABEL_53:
    v4[20] = self->_iorSuccess;
    *((_WORD *)v4 + 76) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_52:
  v4[15] = self->_commanderHalted;
  *((_WORD *)v4 + 76) |= 0x80u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0) {
    goto LABEL_53;
  }
LABEL_27:
  if ((v7 & 0x400) != 0)
  {
LABEL_28:
    v4[21] = self->_iorWA;
    *((_WORD *)v4 + 76) |= 0x400u;
  }
LABEL_29:
  if ([(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self txmpduWMEsCount])
  {
    [v21 clearTxmpduWMEs];
    unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self txmpduWMEsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self txmpduWMEAtIndex:i];
        [v21 addTxmpduWME:v11];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmpduWMEsCount])
  {
    [v21 clearRxmpduWMEs];
    unint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmpduWMEsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        uint64_t v15 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmpduWMEAtIndex:j];
        [v21 addRxmpduWME:v15];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmdpuLostsCount])
  {
    [v21 clearRxmdpuLosts];
    unint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmdpuLostsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t k = 0; k != v17; ++k)
      {
        uint64_t v19 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self rxmdpuLostAtIndex:k];
        [v21 addRxmdpuLost:v19];
      }
    }
  }
  if (self->_omi) {
    objc_msgSend(v21, "setOmi:");
  }
  uint64_t v20 = v21;
  if (self->_ruUsage)
  {
    objc_msgSend(v21, "setRuUsage:");
    uint64_t v20 = v21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_controllerResets;
    *(_WORD *)(v5 + 152) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_backoffStuck;
    *(_WORD *)(v5 + 152) |= 2u;
  }
  id v8 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)self->_scanActivity copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v8;

  id v10 = [(WiFiAnalyticsAWDWiFiNWActivityPowerPStats *)self->_powerActivity copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v10;

  id v12 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self->_impedingFunctions copyWithZone:a3];
  unint64_t v13 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v12;

  id v14 = [(WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *)self->_aggregateMetrics copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v14;

  id v16 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoex *)self->_btCoex copyWithZone:a3];
  unint64_t v17 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v16;

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_channelsVisited0;
    *(_WORD *)(v6 + 152) |= 0x20u;
    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_channelsVisited1;
    *(_WORD *)(v6 + 152) |= 0x40u;
  }
  id v19 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self->_phyrate copyWithZone:a3];
  uint64_t v20 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v19;

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_channel;
    *(_WORD *)(v6 + 152) |= 8u;
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 0x10) == 0)
    {
LABEL_11:
      if ((v21 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_41;
    }
  }
  else if ((v21 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 48) = self->_channelBandwidth;
  *(_WORD *)(v6 + 152) |= 0x10u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 4) == 0)
  {
LABEL_12:
    if ((v21 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 40) = self->_ccCaptureDriverLogs;
  *(_WORD *)(v6 + 152) |= 4u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 1) == 0)
  {
LABEL_13:
    if ((v21 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(void *)(v6 + 8) = self->_commandsIssued;
  *(_WORD *)(v6 + 152) |= 1u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x80) == 0)
  {
LABEL_14:
    if ((v21 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 60) = self->_commanderHalted;
  *(_WORD *)(v6 + 152) |= 0x80u;
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x200) == 0)
  {
LABEL_15:
    if ((v21 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_44:
  *(_DWORD *)(v6 + 80) = self->_iorSuccess;
  *(_WORD *)(v6 + 152) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 84) = self->_iorWA;
    *(_WORD *)(v6 + 152) |= 0x400u;
  }
LABEL_17:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  __int16 v22 = self->_txmpduWMEs;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addTxmpduWME:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v24);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v28 = self->_rxmpduWMEs;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addRxmpduWME:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v30);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v34 = self->_rxmdpuLosts;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * k), "copyWithZone:", a3, (void)v45);
        [(id)v6 addRxmdpuLost:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v36);
  }

  id v40 = [(WiFiAnalyticsAWDWiFiNWActivityOMI *)self->_omi copyWithZone:a3];
  uint64_t v41 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v40;

  id v42 = [(WiFiAnalyticsAWDWiFiNWActivityRuUsage *)self->_ruUsage copyWithZone:a3];
  v43 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v42;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 76);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x100) == 0 || self->_controllerResets != *((_DWORD *)v4 + 16)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 76) & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_backoffStuck != *((_DWORD *)v4 + 6)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_80;
  }
  scanActivity = self->_scanActivity;
  if ((unint64_t)scanActivity | *((void *)v4 + 17)
    && !-[WiFiAnalyticsAWDWiFiNWActivityScanActivity isEqual:](scanActivity, "isEqual:"))
  {
    goto LABEL_80;
  }
  powerActivity = self->_powerActivity;
  if ((unint64_t)powerActivity | *((void *)v4 + 13))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityPowerPStats isEqual:](powerActivity, "isEqual:")) {
      goto LABEL_80;
    }
  }
  impedingFunctions = self->_impedingFunctions;
  if ((unint64_t)impedingFunctions | *((void *)v4 + 9))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions isEqual:](impedingFunctions, "isEqual:")) {
      goto LABEL_80;
    }
  }
  aggregateMetrics = self->_aggregateMetrics;
  if ((unint64_t)aggregateMetrics | *((void *)v4 + 2))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics isEqual:](aggregateMetrics, "isEqual:")) {
      goto LABEL_80;
    }
  }
  btCoex = self->_btCoex;
  if ((unint64_t)btCoex | *((void *)v4 + 4))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityBtCoex isEqual:](btCoex, "isEqual:")) {
      goto LABEL_80;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 76);
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_channelsVisited0 != *((_DWORD *)v4 + 13)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_channelsVisited1 != *((_DWORD *)v4 + 14)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  phyrate = self->_phyrate;
  if ((unint64_t)phyrate | *((void *)v4 + 12))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation isEqual:](phyrate, "isEqual:"))
    {
LABEL_80:
      char v20 = 0;
      goto LABEL_81;
    }
    __int16 v12 = (__int16)self->_has;
    __int16 v13 = *((_WORD *)v4 + 76);
  }
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 11)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_channelBandwidth != *((_DWORD *)v4 + 12)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_ccCaptureDriverLogs != *((_DWORD *)v4 + 10)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_80;
  }
  if (v12)
  {
    if ((v13 & 1) == 0 || self->_commandsIssued != *((void *)v4 + 1)) {
      goto LABEL_80;
    }
  }
  else if (v13)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_commanderHalted != *((_DWORD *)v4 + 15)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_iorSuccess != *((_DWORD *)v4 + 20)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_iorWA != *((_DWORD *)v4 + 21)) {
      goto LABEL_80;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_80;
  }
  txmpduWMEs = self->_txmpduWMEs;
  if ((unint64_t)txmpduWMEs | *((void *)v4 + 18)
    && !-[NSMutableArray isEqual:](txmpduWMEs, "isEqual:"))
  {
    goto LABEL_80;
  }
  rxmpduWMEs = self->_rxmpduWMEs;
  if ((unint64_t)rxmpduWMEs | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](rxmpduWMEs, "isEqual:")) {
      goto LABEL_80;
    }
  }
  rxmdpuLosts = self->_rxmdpuLosts;
  if ((unint64_t)rxmdpuLosts | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](rxmdpuLosts, "isEqual:")) {
      goto LABEL_80;
    }
  }
  omuint64_t i = self->_omi;
  if ((unint64_t)omi | *((void *)v4 + 11))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityOMI isEqual:](omi, "isEqual:")) {
      goto LABEL_80;
    }
  }
  ruUsage = self->_ruUsage;
  if ((unint64_t)ruUsage | *((void *)v4 + 14)) {
    char v20 = -[WiFiAnalyticsAWDWiFiNWActivityRuUsage isEqual:](ruUsage, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_81:

  return v20;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v29 = 2654435761 * self->_controllerResets;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)self->_scanActivity hash];
      goto LABEL_6;
    }
  }
  unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)self->_scanActivity hash];
LABEL_6:
  unint64_t v5 = v4;
  unint64_t v6 = [(WiFiAnalyticsAWDWiFiNWActivityPowerPStats *)self->_powerActivity hash];
  unint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self->_impedingFunctions hash];
  unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *)self->_aggregateMetrics hash];
  unint64_t v9 = [(WiFiAnalyticsAWDWiFiNWActivityBtCoex *)self->_btCoex hash];
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
  unint64_t v13 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self->_phyrate hash];
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
  unint64_t v22 = v28 ^ v29 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  uint64_t v23 = v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(NSMutableArray *)self->_txmpduWMEs hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_rxmpduWMEs hash];
  uint64_t v25 = v24 ^ [(NSMutableArray *)self->_rxmdpuLosts hash];
  unint64_t v26 = v22 ^ v25 ^ [(WiFiAnalyticsAWDWiFiNWActivityOMI *)self->_omi hash];
  return v26 ^ [(WiFiAnalyticsAWDWiFiNWActivityRuUsage *)self->_ruUsage hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unsigned int *)a3;
  unint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 76);
  if ((v6 & 0x100) != 0)
  {
    self->_controllerResets = v4[16];
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v6 = *((_WORD *)v4 + 76);
  }
  if ((v6 & 2) != 0)
  {
    self->_backoffStucuint64_t k = v4[6];
    *(_WORD *)&self->_has |= 2u;
  }
  scanActivity = self->_scanActivity;
  uint64_t v8 = *((void *)v5 + 17);
  if (scanActivity)
  {
    if (v8) {
      -[WiFiAnalyticsAWDWiFiNWActivityScanActivity mergeFrom:](scanActivity, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setScanActivity:](self, "setScanActivity:");
  }
  powerActivity = self->_powerActivity;
  uint64_t v10 = *((void *)v5 + 13);
  if (powerActivity)
  {
    if (v10) {
      -[WiFiAnalyticsAWDWiFiNWActivityPowerPStats mergeFrom:](powerActivity, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setPowerActivity:](self, "setPowerActivity:");
  }
  impedingFunctions = self->_impedingFunctions;
  uint64_t v12 = *((void *)v5 + 9);
  if (impedingFunctions)
  {
    if (v12) {
      -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions mergeFrom:](impedingFunctions, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setImpedingFunctions:](self, "setImpedingFunctions:");
  }
  aggregateMetrics = self->_aggregateMetrics;
  uint64_t v14 = *((void *)v5 + 2);
  if (aggregateMetrics)
  {
    if (v14) {
      -[WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics mergeFrom:](aggregateMetrics, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setAggregateMetrics:](self, "setAggregateMetrics:");
  }
  btCoex = self->_btCoex;
  uint64_t v16 = *((void *)v5 + 4);
  if (btCoex)
  {
    if (v16) {
      -[WiFiAnalyticsAWDWiFiNWActivityBtCoex mergeFrom:](btCoex, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setBtCoex:](self, "setBtCoex:");
  }
  __int16 v17 = *((_WORD *)v5 + 76);
  if ((v17 & 0x20) != 0)
  {
    self->_channelsVisited0 = v5[13];
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v17 = *((_WORD *)v5 + 76);
  }
  if ((v17 & 0x40) != 0)
  {
    self->_channelsVisited1 = v5[14];
    *(_WORD *)&self->_has |= 0x40u;
  }
  phyrate = self->_phyrate;
  uint64_t v19 = *((void *)v5 + 12);
  if (phyrate)
  {
    if (v19) {
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation mergeFrom:](phyrate, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setPhyrate:](self, "setPhyrate:");
  }
  __int16 v20 = *((_WORD *)v5 + 76);
  if ((v20 & 8) != 0)
  {
    self->_channel = v5[11];
    *(_WORD *)&self->_has |= 8u;
    __int16 v20 = *((_WORD *)v5 + 76);
    if ((v20 & 0x10) == 0)
    {
LABEL_41:
      if ((v20 & 4) == 0) {
        goto LABEL_42;
      }
      goto LABEL_73;
    }
  }
  else if ((v20 & 0x10) == 0)
  {
    goto LABEL_41;
  }
  self->_channelBandwidth = v5[12];
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v20 = *((_WORD *)v5 + 76);
  if ((v20 & 4) == 0)
  {
LABEL_42:
    if ((v20 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_ccCaptureDriverLogs = v5[10];
  *(_WORD *)&self->_has |= 4u;
  __int16 v20 = *((_WORD *)v5 + 76);
  if ((v20 & 1) == 0)
  {
LABEL_43:
    if ((v20 & 0x80) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_commandsIssued = *((void *)v5 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v20 = *((_WORD *)v5 + 76);
  if ((v20 & 0x80) == 0)
  {
LABEL_44:
    if ((v20 & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_commanderHalted = v5[15];
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v20 = *((_WORD *)v5 + 76);
  if ((v20 & 0x200) == 0)
  {
LABEL_45:
    if ((v20 & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_76:
  self->_iorSuccess = v5[20];
  *(_WORD *)&self->_has |= 0x200u;
  if ((v5[38] & 0x400) != 0)
  {
LABEL_46:
    self->_iorWA = v5[21];
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_47:
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v21 = *((id *)v5 + 18);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self addTxmpduWME:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v23);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v26 = *((id *)v5 + 16);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self addRxmpduWME:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v28);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v31 = *((id *)v5 + 15);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v31);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityControllerStats addRxmdpuLost:](self, "addRxmdpuLost:", *(void *)(*((void *)&v40 + 1) + 8 * k), (void)v40);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v33);
  }

  omuint64_t i = self->_omi;
  uint64_t v37 = *((void *)v5 + 11);
  if (omi)
  {
    if (v37) {
      -[WiFiAnalyticsAWDWiFiNWActivityOMI mergeFrom:](omi, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setOmi:](self, "setOmi:");
  }
  ruUsage = self->_ruUsage;
  uint64_t v39 = *((void *)v5 + 14);
  if (ruUsage)
  {
    if (v39) {
      -[WiFiAnalyticsAWDWiFiNWActivityRuUsage mergeFrom:](ruUsage, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityControllerStats setRuUsage:](self, "setRuUsage:");
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

- (WiFiAnalyticsAWDWiFiNWActivityScanActivity)scanActivity
{
  return self->_scanActivity;
}

- (WiFiAnalyticsAWDWiFiNWActivityPowerPStats)powerActivity
{
  return self->_powerActivity;
}

- (WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions)impedingFunctions
{
  return self->_impedingFunctions;
}

- (WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics)aggregateMetrics
{
  return self->_aggregateMetrics;
}

- (WiFiAnalyticsAWDWiFiNWActivityBtCoex)btCoex
{
  return self->_btCoex;
}

- (unsigned)channelsVisited0
{
  return self->_channelsVisited0;
}

- (unsigned)channelsVisited1
{
  return self->_channelsVisited1;
}

- (WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation)phyrate
{
  return self->_phyrate;
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

- (WiFiAnalyticsAWDWiFiNWActivityOMI)omi
{
  return self->_omi;
}

- (WiFiAnalyticsAWDWiFiNWActivityRuUsage)ruUsage
{
  return self->_ruUsage;
}

@end