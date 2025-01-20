@interface AWDWiFiNWActivity
+ (Class)activitiesType;
+ (Class)btleConnectionType;
+ (Class)interfaceStatsType;
+ (Class)peerStatsType;
+ (Class)scoreType;
- (AWDLinkQualityMeasurements)linkQualSample;
- (AWDWiFiNWActivityControllerStats)controllerStats;
- (BOOL)hasApProfile;
- (BOOL)hasControllerStats;
- (BOOL)hasLinkQualSample;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)activities;
- (NSMutableArray)btleConnections;
- (NSMutableArray)interfaceStats;
- (NSMutableArray)peerStats;
- (NSMutableArray)scores;
- (NSString)apProfile;
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
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivities:(id)a3;
- (void)setApProfile:(id)a3;
- (void)setBtleConnections:(id)a3;
- (void)setControllerStats:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceStats:(id)a3;
- (void)setLinkQualSample:(id)a3;
- (void)setPeerStats:(id)a3;
- (void)setScores:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivity

- (void)dealloc
{
  [(AWDWiFiNWActivity *)self setActivities:0];
  [(AWDWiFiNWActivity *)self setInterfaceStats:0];
  [(AWDWiFiNWActivity *)self setPeerStats:0];
  [(AWDWiFiNWActivity *)self setControllerStats:0];
  [(AWDWiFiNWActivity *)self setLinkQualSample:0];
  [(AWDWiFiNWActivity *)self setScores:0];
  [(AWDWiFiNWActivity *)self setBtleConnections:0];
  [(AWDWiFiNWActivity *)self setApProfile:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivity;
  [(AWDWiFiNWActivity *)&v3 dealloc];
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

- (void)clearActivities
{
}

- (void)addActivities:(id)a3
{
  activities = self->_activities;
  if (!activities)
  {
    activities = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_activities = activities;
  }

  [(NSMutableArray *)activities addObject:a3];
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

- (void)addInterfaceStats:(id)a3
{
  interfaceStats = self->_interfaceStats;
  if (!interfaceStats)
  {
    interfaceStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_interfaceStats = interfaceStats;
  }

  [(NSMutableArray *)interfaceStats addObject:a3];
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
  peerStats = self->_peerStats;
  if (!peerStats)
  {
    peerStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_peerStats = peerStats;
  }

  [(NSMutableArray *)peerStats addObject:a3];
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
  scores = self->_scores;
  if (!scores)
  {
    scores = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_scores = scores;
  }

  [(NSMutableArray *)scores addObject:a3];
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
  btleConnections = self->_btleConnections;
  if (!btleConnections)
  {
    btleConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_btleConnections = btleConnections;
  }

  [(NSMutableArray *)btleConnections addObject:a3];
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivity;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivity description](&v3, sel_description), -[AWDWiFiNWActivity dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  activities = self->_activities;
  if (activities) {
    [v3 setObject:activities forKey:@"activities"];
  }
  if ([(NSMutableArray *)self->_interfaceStats count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_interfaceStats, "count")];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    interfaceStats = self->_interfaceStats;
    uint64_t v7 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(interfaceStats);
          }
          [v5 addObject:[*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"interfaceStats"];
  }
  if ([(NSMutableArray *)self->_peerStats count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_peerStats, "count")];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    peerStats = self->_peerStats;
    uint64_t v13 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(peerStats);
          }
          [v11 addObject:[(*(id *)(*((void *)&v41 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"peerStats"];
  }
  controllerStats = self->_controllerStats;
  if (controllerStats) {
    [v3 setObject:[[-[AWDWiFiNWActivityControllerStats dictionaryRepresentation](controllerStats, "dictionaryRepresentation")] forKey:@"controllerStats"];
  }
  linkQualSample = self->_linkQualSample;
  if (linkQualSample) {
    [v3 setObject:[[linkQualSample dictionaryRepresentation] forKey:@"linkQualSample"];
  }
  if ([(NSMutableArray *)self->_scores count])
  {
    v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_scores, "count")];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    scores = self->_scores;
    uint64_t v21 = [(NSMutableArray *)scores countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(scores);
          }
          [v19 addObject:[*(id *)(*((void *)&v37 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v22 = [(NSMutableArray *)scores countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v22);
    }
    [v3 setObject:v19 forKey:@"score"];
  }
  if ([(NSMutableArray *)self->_btleConnections count])
  {
    v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_btleConnections, "count")];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    btleConnections = self->_btleConnections;
    uint64_t v27 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(btleConnections);
          }
          [v25 addObject:[*(id *)(*((void *)&v33 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v28 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v28);
    }
    [v3 setObject:v25 forKey:@"btleConnection"];
  }
  apProfile = self->_apProfile;
  if (apProfile) {
    [v3 setObject:apProfile forKey:@"apProfile"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  activities = self->_activities;
  uint64_t v5 = [(NSMutableArray *)activities countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(activities);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)activities countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v6);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  interfaceStats = self->_interfaceStats;
  uint64_t v10 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(interfaceStats);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v11);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  peerStats = self->_peerStats;
  uint64_t v15 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(peerStats);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v16);
  }
  if (self->_controllerStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkQualSample) {
    PBDataWriterWriteSubmessage();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  scores = self->_scores;
  uint64_t v20 = [(NSMutableArray *)scores countByEnumeratingWithState:&v33 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(scores);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)scores countByEnumeratingWithState:&v33 objects:v50 count:16];
    }
    while (v21);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  btleConnections = self->_btleConnections;
  uint64_t v25 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v29 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t n = 0; n != v26; ++n)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(btleConnections);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v29 objects:v49 count:16];
    }
    while (v26);
  }
  if (self->_apProfile) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 80) |= 1u;
  }
  if ([(AWDWiFiNWActivity *)self activitiesCount])
  {
    [a3 clearActivities];
    unint64_t v5 = [(AWDWiFiNWActivity *)self activitiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addActivities:-[AWDWiFiNWActivity activitiesAtIndex:](self, "activitiesAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivity *)self interfaceStatsCount])
  {
    [a3 clearInterfaceStats];
    unint64_t v8 = [(AWDWiFiNWActivity *)self interfaceStatsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addInterfaceStats:-[AWDWiFiNWActivity interfaceStatsAtIndex:](self, "interfaceStatsAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivity *)self peerStatsCount])
  {
    [a3 clearPeerStats];
    unint64_t v11 = [(AWDWiFiNWActivity *)self peerStatsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addPeerStats:-[AWDWiFiNWActivity peerStatsAtIndex:](self, "peerStatsAtIndex:", k)];
    }
  }
  if (self->_controllerStats) {
    [a3 setControllerStats:];
  }
  if (self->_linkQualSample) {
    [a3 setLinkQualSample:];
  }
  if ([(AWDWiFiNWActivity *)self scoresCount])
  {
    [a3 clearScores];
    unint64_t v14 = [(AWDWiFiNWActivity *)self scoresCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addScore:-[AWDWiFiNWActivity scoreAtIndex:](self, "scoreAtIndex:", m)];
    }
  }
  if ([(AWDWiFiNWActivity *)self btleConnectionsCount])
  {
    [a3 clearBtleConnections];
    unint64_t v17 = [(AWDWiFiNWActivity *)self btleConnectionsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addBtleConnection:[[self btleConnectionAtIndex:n]];
    }
  }
  if (self->_apProfile)
  {
    [a3 setApProfile:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  unint64_t v6 = (id *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  activities = self->_activities;
  uint64_t v8 = [(NSMutableArray *)activities countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(activities);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) copyWithZone:a3];
        [v6 addActivities:v12];
      }
      uint64_t v9 = [(NSMutableArray *)activities countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v9);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  interfaceStats = self->_interfaceStats;
  uint64_t v14 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(interfaceStats);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * j) copyWithZone:a3];
        [v6 addInterfaceStats:v18];
      }
      uint64_t v15 = [(NSMutableArray *)interfaceStats countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v15);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  peerStats = self->_peerStats;
  uint64_t v20 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(peerStats);
        }
        v24 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * k) copyWithZone:a3];
        [v6 addPeerStats:v24];
      }
      uint64_t v21 = [(NSMutableArray *)peerStats countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v21);
  }

  v6[5] = [(AWDWiFiNWActivityControllerStats *)self->_controllerStats copyWithZone:a3];
  v6[7] = [(AWDLinkQualityMeasurements *)self->_linkQualSample copyWithZone:a3];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  scores = self->_scores;
  uint64_t v26 = [(NSMutableArray *)scores countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(scores);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * m) copyWithZone:a3];
        [v6 addScore:v30];
      }
      uint64_t v27 = [(NSMutableArray *)scores countByEnumeratingWithState:&v42 objects:v59 count:16];
    }
    while (v27);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  btleConnections = self->_btleConnections;
  uint64_t v32 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v38 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(btleConnections);
        }
        long long v36 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * n) copyWithZone:a3];
        [v6 addBtleConnection:v36];
      }
      uint64_t v33 = [(NSMutableArray *)btleConnections countByEnumeratingWithState:&v38 objects:v58 count:16];
    }
    while (v33);
  }

  v6[3] = (id)[(NSString *)self->_apProfile copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)a3 + 80))
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    activities = self->_activities;
    if (!((unint64_t)activities | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](activities, "isEqual:")) != 0)
    {
      interfaceStats = self->_interfaceStats;
      if (!((unint64_t)interfaceStats | *((void *)a3 + 6))
        || (int v5 = -[NSMutableArray isEqual:](interfaceStats, "isEqual:")) != 0)
      {
        peerStats = self->_peerStats;
        if (!((unint64_t)peerStats | *((void *)a3 + 8))
          || (int v5 = -[NSMutableArray isEqual:](peerStats, "isEqual:")) != 0)
        {
          controllerStats = self->_controllerStats;
          if (!((unint64_t)controllerStats | *((void *)a3 + 5))
            || (int v5 = -[AWDWiFiNWActivityControllerStats isEqual:](controllerStats, "isEqual:")) != 0)
          {
            linkQualSample = self->_linkQualSample;
            if (!((unint64_t)linkQualSample | *((void *)a3 + 7))
              || (int v5 = -[AWDLinkQualityMeasurements isEqual:](linkQualSample, "isEqual:")) != 0)
            {
              scores = self->_scores;
              if (!((unint64_t)scores | *((void *)a3 + 9))
                || (int v5 = -[NSMutableArray isEqual:](scores, "isEqual:")) != 0)
              {
                btleConnections = self->_btleConnections;
                if (!((unint64_t)btleConnections | *((void *)a3 + 4))
                  || (int v5 = -[NSMutableArray isEqual:](btleConnections, "isEqual:")) != 0)
                {
                  apProfile = self->_apProfile;
                  if ((unint64_t)apProfile | *((void *)a3 + 3))
                  {
                    LOBYTE(v5) = -[NSString isEqual:](apProfile, "isEqual:");
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
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_activities hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_interfaceStats hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_peerStats hash];
  unint64_t v7 = [(AWDWiFiNWActivityControllerStats *)self->_controllerStats hash];
  unint64_t v8 = v7 ^ [(AWDLinkQualityMeasurements *)self->_linkQualSample hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_scores hash];
  uint64_t v10 = [(NSMutableArray *)self->_btleConnections hash];
  return v9 ^ v10 ^ [(NSString *)self->_apProfile hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 80))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDWiFiNWActivity *)self addActivities:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v7);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDWiFiNWActivity *)self addInterfaceStats:*(void *)(*((void *)&v46 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v12);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 8);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDWiFiNWActivity *)self addPeerStats:*(void *)(*((void *)&v42 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v17);
  }
  controllerStats = self->_controllerStats;
  uint64_t v21 = *((void *)a3 + 5);
  if (controllerStats)
  {
    if (v21) {
      -[AWDWiFiNWActivityControllerStats mergeFrom:](controllerStats, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[AWDWiFiNWActivity setControllerStats:](self, "setControllerStats:");
  }
  linkQualSample = self->_linkQualSample;
  uint64_t v23 = *((void *)a3 + 7);
  if (linkQualSample)
  {
    if (v23) {
      -[AWDLinkQualityMeasurements mergeFrom:](linkQualSample, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[AWDWiFiNWActivity setLinkQualSample:](self, "setLinkQualSample:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v24 = (void *)*((void *)a3 + 9);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        [(AWDWiFiNWActivity *)self addScore:*(void *)(*((void *)&v38 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v26);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v29 = (void *)*((void *)a3 + 4);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        [(AWDWiFiNWActivity *)self addBtleConnection:*(void *)(*((void *)&v34 + 1) + 8 * n)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
    }
    while (v31);
  }
  if (*((void *)a3 + 3)) {
    -[AWDWiFiNWActivity setApProfile:](self, "setApProfile:");
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

- (AWDWiFiNWActivityControllerStats)controllerStats
{
  return self->_controllerStats;
}

- (void)setControllerStats:(id)a3
{
}

- (AWDLinkQualityMeasurements)linkQualSample
{
  return self->_linkQualSample;
}

- (void)setLinkQualSample:(id)a3
{
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

- (void)setApProfile:(id)a3
{
}

@end