@interface WiFiAnalyticsAWDWiFiNWActivity
+ (Class)activitiesType;
+ (Class)btleConnectionType;
+ (Class)interfaceStatsType;
+ (Class)peerStatsType;
+ (Class)scoreType;
- (BOOL)hasApIfStats;
- (BOOL)hasApProfile;
- (BOOL)hasAwdlIfStats;
- (BOOL)hasControllerStats;
- (BOOL)hasIrIfStats;
- (BOOL)hasLinkQualSample;
- (BOOL)hasNanIfStats;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)activities;
- (NSMutableArray)btleConnections;
- (NSMutableArray)interfaceStats;
- (NSMutableArray)peerStats;
- (NSMutableArray)scores;
- (NSString)apProfile;
- (WiFiAnalyticsAWDLinkQualityMeasurements)linkQualSample;
- (WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats)apIfStats;
- (WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats)awdlIfStats;
- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats;
- (WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats)irIfStats;
- (WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats)nanIfStats;
- (id)activitiesAtIndex:(unint64_t)a3;
- (id)btleConnectionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceStatsAtIndex:(unint64_t)a3;
- (id)peerStatsAtIndex:(unint64_t)a3;
- (id)scoreAtIndex:(unint64_t)a3;
- (unint64_t)activitiesCount;
- (unint64_t)btleConnectionsCount;
- (unint64_t)hash;
- (unint64_t)interfaceStatsCount;
- (unint64_t)peerStatsCount;
- (unint64_t)scoresCount;
- (unint64_t)timestamp;
- (void)addActivities:(id)a3;
- (void)addBtleConnection:(id)a3;
- (void)addInterfaceStats:(id)a3;
- (void)addPeerStats:(id)a3;
- (void)addScore:(id)a3;
- (void)clearActivities;
- (void)clearBtleConnections;
- (void)clearInterfaceStats;
- (void)clearPeerStats;
- (void)clearScores;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivities:(id)a3;
- (void)setApIfStats:(id)a3;
- (void)setApProfile:(id)a3;
- (void)setAwdlIfStats:(id)a3;
- (void)setBtleConnections:(id)a3;
- (void)setControllerStats:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceStats:(id)a3;
- (void)setIrIfStats:(id)a3;
- (void)setLinkQualSample:(id)a3;
- (void)setNanIfStats:(id)a3;
- (void)setPeerStats:(id)a3;
- (void)setScores:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_peerStats, 0);
  objc_storeStrong((id *)&self->_nanIfStats, 0);
  objc_storeStrong((id *)&self->_linkQualSample, 0);
  objc_storeStrong((id *)&self->_irIfStats, 0);
  objc_storeStrong((id *)&self->_interfaceStats, 0);
  objc_storeStrong((id *)&self->_controllerStats, 0);
  objc_storeStrong((id *)&self->_btleConnections, 0);
  objc_storeStrong((id *)&self->_awdlIfStats, 0);
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_apIfStats, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addInterfaceStats:(id)a3
{
  id v4 = a3;
  interfaceStats = self->_interfaceStats;
  id v8 = v4;
  if (!interfaceStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_interfaceStats;
    self->_interfaceStats = v6;

    id v4 = v8;
    interfaceStats = self->_interfaceStats;
  }
  [(NSMutableArray *)interfaceStats addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v5 = self->_activities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v10 = self->_interfaceStats;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v15 = self->_peerStats;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  if (self->_controllerStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkQualSample) {
    PBDataWriterWriteSubmessage();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_scores;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = self->_btleConnections;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }

  if (self->_apProfile) {
    PBDataWriterWriteStringField();
  }
  if (self->_awdlIfStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_apIfStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nanIfStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_irIfStats) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  activities = self->_activities;
  if (activities) {
    [v3 setObject:activities forKey:@"activities"];
  }
  if ([(NSMutableArray *)self->_interfaceStats count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_interfaceStats, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v7 = self->_interfaceStats;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v61 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v60 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"interfaceStats"];
  }
  if ([(NSMutableArray *)self->_peerStats count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_peerStats, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v14 = self->_peerStats;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v56 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"peerStats"];
  }
  controllerStats = self->_controllerStats;
  if (controllerStats)
  {
    uint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)controllerStats dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"controllerStats"];
  }
  linkQualSample = self->_linkQualSample;
  if (linkQualSample)
  {
    uint64_t v23 = [(WiFiAnalyticsAWDLinkQualityMeasurements *)linkQualSample dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"linkQualSample"];
  }
  if ([(NSMutableArray *)self->_scores count])
  {
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_scores, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v25 = self->_scores;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = [*(id *)(*((void *)&v52 + 1) + 8 * k) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"score"];
  }
  if ([(NSMutableArray *)self->_btleConnections count])
  {
    long long v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_btleConnections, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v32 = self->_btleConnections;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v48 objects:v64 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * m), "dictionaryRepresentation", (void)v48);
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v48 objects:v64 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"btleConnection"];
  }
  apProfile = self->_apProfile;
  if (apProfile) {
    [v3 setObject:apProfile forKey:@"apProfile"];
  }
  awdlIfStats = self->_awdlIfStats;
  if (awdlIfStats)
  {
    long long v40 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)awdlIfStats dictionaryRepresentation];
    [v3 setObject:v40 forKey:@"awdlIfStats"];
  }
  apIfStats = self->_apIfStats;
  if (apIfStats)
  {
    long long v42 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)apIfStats dictionaryRepresentation];
    [v3 setObject:v42 forKey:@"apIfStats"];
  }
  nanIfStats = self->_nanIfStats;
  if (nanIfStats)
  {
    long long v44 = [(WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *)nanIfStats dictionaryRepresentation];
    [v3 setObject:v44 forKey:@"nanIfStats"];
  }
  irIfStats = self->_irIfStats;
  if (irIfStats)
  {
    long long v46 = [(WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *)irIfStats dictionaryRepresentation];
    [v3 setObject:v46 forKey:@"irIfStats"];
  }
  return v3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setNanIfStats:(id)a3
{
}

- (void)setLinkQualSample:(id)a3
{
}

- (void)setIrIfStats:(id)a3
{
}

- (void)setControllerStats:(id)a3
{
}

- (void)setAwdlIfStats:(id)a3
{
}

- (void)setApProfile:(id)a3
{
}

- (void)setApIfStats:(id)a3
{
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearActivities
{
}

- (void)addActivities:(id)a3
{
  id v4 = a3;
  activities = self->_activities;
  id v8 = v4;
  if (!activities)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_activities;
    self->_activities = v6;

    id v4 = v8;
    activities = self->_activities;
  }
  [(NSMutableArray *)activities addObject:v4];
}

- (unint64_t)activitiesCount
{
  return [(NSMutableArray *)self->_activities count];
}

- (id)activitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activities objectAtIndex:a3];
}

+ (Class)activitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearInterfaceStats
{
}

- (unint64_t)interfaceStatsCount
{
  return [(NSMutableArray *)self->_interfaceStats count];
}

- (id)interfaceStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_interfaceStats objectAtIndex:a3];
}

+ (Class)interfaceStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearPeerStats
{
}

- (void)addPeerStats:(id)a3
{
  id v4 = a3;
  peerStats = self->_peerStats;
  id v8 = v4;
  if (!peerStats)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_peerStats;
    self->_peerStats = v6;

    id v4 = v8;
    peerStats = self->_peerStats;
  }
  [(NSMutableArray *)peerStats addObject:v4];
}

- (unint64_t)peerStatsCount
{
  return [(NSMutableArray *)self->_peerStats count];
}

- (id)peerStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_peerStats objectAtIndex:a3];
}

+ (Class)peerStatsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasControllerStats
{
  return self->_controllerStats != 0;
}

- (BOOL)hasLinkQualSample
{
  return self->_linkQualSample != 0;
}

- (void)clearScores
{
}

- (void)addScore:(id)a3
{
  id v4 = a3;
  scores = self->_scores;
  id v8 = v4;
  if (!scores)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_scores;
    self->_scores = v6;

    id v4 = v8;
    scores = self->_scores;
  }
  [(NSMutableArray *)scores addObject:v4];
}

- (unint64_t)scoresCount
{
  return [(NSMutableArray *)self->_scores count];
}

- (id)scoreAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_scores objectAtIndex:a3];
}

+ (Class)scoreType
{
  return (Class)objc_opt_class();
}

- (void)clearBtleConnections
{
}

- (void)addBtleConnection:(id)a3
{
  id v4 = a3;
  btleConnections = self->_btleConnections;
  id v8 = v4;
  if (!btleConnections)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_btleConnections;
    self->_btleConnections = v6;

    id v4 = v8;
    btleConnections = self->_btleConnections;
  }
  [(NSMutableArray *)btleConnections addObject:v4];
}

- (unint64_t)btleConnectionsCount
{
  return [(NSMutableArray *)self->_btleConnections count];
}

- (id)btleConnectionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_btleConnections objectAtIndex:a3];
}

+ (Class)btleConnectionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasApProfile
{
  return self->_apProfile != 0;
}

- (BOOL)hasAwdlIfStats
{
  return self->_awdlIfStats != 0;
}

- (BOOL)hasApIfStats
{
  return self->_apIfStats != 0;
}

- (BOOL)hasNanIfStats
{
  return self->_nanIfStats != 0;
}

- (BOOL)hasIrIfStats
{
  return self->_irIfStats != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivity;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivity *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivity *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  id v26 = v4;
  if ([(WiFiAnalyticsAWDWiFiNWActivity *)self activitiesCount])
  {
    [v26 clearActivities];
    unint64_t v5 = [(WiFiAnalyticsAWDWiFiNWActivity *)self activitiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(WiFiAnalyticsAWDWiFiNWActivity *)self activitiesAtIndex:i];
        [v26 addActivities:v8];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivity *)self interfaceStatsCount])
  {
    [v26 clearInterfaceStats];
    unint64_t v9 = [(WiFiAnalyticsAWDWiFiNWActivity *)self interfaceStatsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivity *)self interfaceStatsAtIndex:j];
        [v26 addInterfaceStats:v12];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivity *)self peerStatsCount])
  {
    [v26 clearPeerStats];
    unint64_t v13 = [(WiFiAnalyticsAWDWiFiNWActivity *)self peerStatsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivity *)self peerStatsAtIndex:k];
        [v26 addPeerStats:v16];
      }
    }
  }
  if (self->_controllerStats) {
    objc_msgSend(v26, "setControllerStats:");
  }
  if (self->_linkQualSample) {
    objc_msgSend(v26, "setLinkQualSample:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivity *)self scoresCount])
  {
    [v26 clearScores];
    unint64_t v17 = [(WiFiAnalyticsAWDWiFiNWActivity *)self scoresCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WiFiAnalyticsAWDWiFiNWActivity *)self scoreAtIndex:m];
        [v26 addScore:v20];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivity *)self btleConnectionsCount])
  {
    [v26 clearBtleConnections];
    unint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivity *)self btleConnectionsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(WiFiAnalyticsAWDWiFiNWActivity *)self btleConnectionAtIndex:n];
        [v26 addBtleConnection:v24];
      }
    }
  }
  if (self->_apProfile) {
    objc_msgSend(v26, "setApProfile:");
  }
  v25 = v26;
  if (self->_awdlIfStats)
  {
    objc_msgSend(v26, "setAwdlIfStats:");
    v25 = v26;
  }
  if (self->_apIfStats)
  {
    objc_msgSend(v26, "setApIfStats:");
    v25 = v26;
  }
  if (self->_nanIfStats)
  {
    objc_msgSend(v26, "setNanIfStats:");
    v25 = v26;
  }
  if (self->_irIfStats)
  {
    objc_msgSend(v26, "setIrIfStats:");
    v25 = v26;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v7 = self->_activities;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v69;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v68 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addActivities:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v9);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  unint64_t v13 = self->_interfaceStats;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v65;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v65 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addInterfaceStats:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v15);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v19 = self->_peerStats;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v61;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v61 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addPeerStats:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v21);
  }

  id v25 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self->_controllerStats copyWithZone:a3];
  id v26 = (void *)v6[7];
  v6[7] = v25;

  id v27 = [(WiFiAnalyticsAWDLinkQualityMeasurements *)self->_linkQualSample copyWithZone:a3];
  uint64_t v28 = (void *)v6[10];
  v6[10] = v27;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v29 = self->_scores;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v56 objects:v73 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v57;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v57 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * v33) copyWithZone:a3];
        [v6 addScore:v34];

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v56 objects:v73 count:16];
    }
    while (v31);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v35 = self->_btleConnections;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v52 objects:v72 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v53;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v35);
        }
        long long v40 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * v39), "copyWithZone:", a3, (void)v52);
        [v6 addBtleConnection:v40];

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v52 objects:v72 count:16];
    }
    while (v37);
  }

  uint64_t v41 = [(NSString *)self->_apProfile copyWithZone:a3];
  long long v42 = (void *)v6[4];
  v6[4] = v41;

  id v43 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self->_awdlIfStats copyWithZone:a3];
  long long v44 = (void *)v6[5];
  v6[5] = v43;

  id v45 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self->_apIfStats copyWithZone:a3];
  long long v46 = (void *)v6[3];
  v6[3] = v45;

  id v47 = [(WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *)self->_nanIfStats copyWithZone:a3];
  long long v48 = (void *)v6[11];
  v6[11] = v47;

  id v49 = [(WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *)self->_irIfStats copyWithZone:a3];
  long long v50 = (void *)v6[9];
  v6[9] = v49;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
LABEL_31:
    char v17 = 0;
    goto LABEL_32;
  }
  activities = self->_activities;
  if ((unint64_t)activities | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](activities, "isEqual:"))
  {
    goto LABEL_31;
  }
  interfaceStats = self->_interfaceStats;
  if ((unint64_t)interfaceStats | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](interfaceStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  peerStats = self->_peerStats;
  if ((unint64_t)peerStats | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](peerStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  controllerStats = self->_controllerStats;
  if ((unint64_t)controllerStats | *((void *)v4 + 7))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  linkQualSample = self->_linkQualSample;
  if ((unint64_t)linkQualSample | *((void *)v4 + 10))
  {
    if (!-[WiFiAnalyticsAWDLinkQualityMeasurements isEqual:](linkQualSample, "isEqual:")) {
      goto LABEL_31;
    }
  }
  scores = self->_scores;
  if ((unint64_t)scores | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](scores, "isEqual:")) {
      goto LABEL_31;
    }
  }
  btleConnections = self->_btleConnections;
  if ((unint64_t)btleConnections | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](btleConnections, "isEqual:")) {
      goto LABEL_31;
    }
  }
  apProfile = self->_apProfile;
  if ((unint64_t)apProfile | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](apProfile, "isEqual:")) {
      goto LABEL_31;
    }
  }
  awdlIfStats = self->_awdlIfStats;
  if ((unint64_t)awdlIfStats | *((void *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats isEqual:](awdlIfStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  apIfStats = self->_apIfStats;
  if ((unint64_t)apIfStats | *((void *)v4 + 3))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats isEqual:](apIfStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  nanIfStats = self->_nanIfStats;
  if ((unint64_t)nanIfStats | *((void *)v4 + 11))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats isEqual:](nanIfStats, "isEqual:")) {
      goto LABEL_31;
    }
  }
  irIfStats = self->_irIfStats;
  if ((unint64_t)irIfStats | *((void *)v4 + 9)) {
    char v17 = -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats isEqual:](irIfStats, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_32:

  return v17;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_activities hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_interfaceStats hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_peerStats hash];
  unint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityControllerStats *)self->_controllerStats hash];
  unint64_t v8 = v7 ^ [(WiFiAnalyticsAWDLinkQualityMeasurements *)self->_linkQualSample hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_scores hash];
  uint64_t v10 = [(NSMutableArray *)self->_btleConnections hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_apProfile hash];
  unint64_t v12 = v11 ^ [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self->_awdlIfStats hash];
  unint64_t v13 = v9 ^ v12 ^ [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self->_apIfStats hash];
  unint64_t v14 = [(WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats *)self->_nanIfStats hash];
  return v13 ^ v14 ^ [(WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats *)self->_irIfStats hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 112))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WiFiAnalyticsAWDWiFiNWActivity *)self addActivities:*(void *)(*((void *)&v59 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v8);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = v5[8];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(v11);
        }
        [(WiFiAnalyticsAWDWiFiNWActivity *)self addInterfaceStats:*(void *)(*((void *)&v55 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v13);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v16 = v5[12];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        [(WiFiAnalyticsAWDWiFiNWActivity *)self addPeerStats:*(void *)(*((void *)&v51 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v18);
  }

  controllerStats = self->_controllerStats;
  id v22 = v5[7];
  if (controllerStats)
  {
    if (v22) {
      -[WiFiAnalyticsAWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setControllerStats:](self, "setControllerStats:");
  }
  linkQualSample = self->_linkQualSample;
  id v24 = v5[10];
  if (linkQualSample)
  {
    if (v24) {
      -[WiFiAnalyticsAWDLinkQualityMeasurements mergeFrom:](linkQualSample, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setLinkQualSample:](self, "setLinkQualSample:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = v5[13];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v48;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v48 != v28) {
          objc_enumerationMutation(v25);
        }
        [(WiFiAnalyticsAWDWiFiNWActivity *)self addScore:*(void *)(*((void *)&v47 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v64 count:16];
    }
    while (v27);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v30 = v5[6];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v63 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v30);
        }
        -[WiFiAnalyticsAWDWiFiNWActivity addBtleConnection:](self, "addBtleConnection:", *(void *)(*((void *)&v43 + 1) + 8 * n), (void)v43);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v63 count:16];
    }
    while (v32);
  }

  if (v5[4]) {
    -[WiFiAnalyticsAWDWiFiNWActivity setApProfile:](self, "setApProfile:");
  }
  awdlIfStats = self->_awdlIfStats;
  id v36 = v5[5];
  if (awdlIfStats)
  {
    if (v36) {
      -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats mergeFrom:](awdlIfStats, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setAwdlIfStats:](self, "setAwdlIfStats:");
  }
  apIfStats = self->_apIfStats;
  id v38 = v5[3];
  if (apIfStats)
  {
    if (v38) {
      -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats mergeFrom:](apIfStats, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setApIfStats:](self, "setApIfStats:");
  }
  nanIfStats = self->_nanIfStats;
  id v40 = v5[11];
  if (nanIfStats)
  {
    if (v40) {
      -[WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats mergeFrom:](nanIfStats, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setNanIfStats:](self, "setNanIfStats:");
  }
  irIfStats = self->_irIfStats;
  id v42 = v5[9];
  if (irIfStats)
  {
    if (v42) {
      -[WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats mergeFrom:](irIfStats, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[WiFiAnalyticsAWDWiFiNWActivity setIrIfStats:](self, "setIrIfStats:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSMutableArray)interfaceStats
{
  return self->_interfaceStats;
}

- (void)setInterfaceStats:(id)a3
{
}

- (NSMutableArray)peerStats
{
  return self->_peerStats;
}

- (void)setPeerStats:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (WiFiAnalyticsAWDLinkQualityMeasurements)linkQualSample
{
  return self->_linkQualSample;
}

- (NSMutableArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (NSMutableArray)btleConnections
{
  return self->_btleConnections;
}

- (void)setBtleConnections:(id)a3
{
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats)awdlIfStats
{
  return self->_awdlIfStats;
}

- (WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats)apIfStats
{
  return self->_apIfStats;
}

- (WiFiAnalyticsAWDWiFiNWActivityNANInterfaceStats)nanIfStats
{
  return self->_nanIfStats;
}

- (WiFiAnalyticsAWDWiFiNWActivityIRInterfaceStats)irIfStats
{
  return self->_irIfStats;
}

@end