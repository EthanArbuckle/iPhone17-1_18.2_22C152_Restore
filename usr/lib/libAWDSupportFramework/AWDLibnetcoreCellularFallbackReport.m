@interface AWDLibnetcoreCellularFallbackReport
+ (Class)dataUsageSnapshotsAtNetworkEventsType;
+ (Class)primaryInterfaceAttemptStatisticsReportsType;
- (BOOL)fellback;
- (BOOL)hasDenyReason;
- (BOOL)hasFallbackTimerMsecs;
- (BOOL)hasFellback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dataUsageSnapshotsAtNetworkEvents;
- (NSMutableArray)primaryInterfaceAttemptStatisticsReports;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataUsageSnapshotsAtNetworkEventsAtIndex:(unint64_t)a3;
- (id)denyReasonAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkEventsAsString:(int)a3;
- (id)primaryInterfaceAttemptStatisticsReportsAtIndex:(unint64_t)a3;
- (int)StringAsDenyReason:(id)a3;
- (int)StringAsNetworkEvents:(id)a3;
- (int)denyReason;
- (int)networkEvents;
- (int)networkEventsAtIndex:(unint64_t)a3;
- (unint64_t)dataUsageSnapshotsAtNetworkEventsCount;
- (unint64_t)fallbackTimerMsecs;
- (unint64_t)hash;
- (unint64_t)networkEventsCount;
- (unint64_t)primaryInterfaceAttemptStatisticsReportsCount;
- (unint64_t)timeToNetworkEventsMsecs;
- (unint64_t)timeToNetworkEventsMsecsAtIndex:(unint64_t)a3;
- (unint64_t)timeToNetworkEventsMsecsCount;
- (void)addDataUsageSnapshotsAtNetworkEvents:(id)a3;
- (void)addNetworkEvents:(int)a3;
- (void)addPrimaryInterfaceAttemptStatisticsReports:(id)a3;
- (void)addTimeToNetworkEventsMsecs:(unint64_t)a3;
- (void)clearDataUsageSnapshotsAtNetworkEvents;
- (void)clearNetworkEvents;
- (void)clearPrimaryInterfaceAttemptStatisticsReports;
- (void)clearTimeToNetworkEventsMsecs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDataUsageSnapshotsAtNetworkEvents:(id)a3;
- (void)setDenyReason:(int)a3;
- (void)setFallbackTimerMsecs:(unint64_t)a3;
- (void)setFellback:(BOOL)a3;
- (void)setHasDenyReason:(BOOL)a3;
- (void)setHasFallbackTimerMsecs:(BOOL)a3;
- (void)setHasFellback:(BOOL)a3;
- (void)setNetworkEvents:(int *)a3 count:(unint64_t)a4;
- (void)setPrimaryInterfaceAttemptStatisticsReports:(id)a3;
- (void)setTimeToNetworkEventsMsecs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreCellularFallbackReport

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  [(AWDLibnetcoreCellularFallbackReport *)self setPrimaryInterfaceAttemptStatisticsReports:0];
  [(AWDLibnetcoreCellularFallbackReport *)self setDataUsageSnapshotsAtNetworkEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreCellularFallbackReport;
  [(AWDLibnetcoreCellularFallbackReport *)&v3 dealloc];
}

- (void)setFellback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fellback = a3;
}

- (void)setHasFellback:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFellback
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)denyReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_denyReason;
  }
  else {
    return 1;
  }
}

- (void)setDenyReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_denyReason = a3;
}

- (void)setHasDenyReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDenyReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)denyReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9750[a3 - 1];
  }
}

- (int)StringAsDenyReason:(id)a3
{
  if ([a3 isEqualToString:@"DENY_REASON_BLOCKED_FROM_USING_CELL_DATA"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"DENY_REASON_EXCEEDED_CELL_FALLBACK_DATA_BUDGET"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"DENY_REASON_METRICS_TESTING_DENIED"]) {
    return 3;
  }
  return 1;
}

- (void)setFallbackTimerMsecs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fallbackTimerMsecs = a3;
}

- (void)setHasFallbackTimerMsecs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFallbackTimerMsecs
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)networkEventsCount
{
  return self->_networkEvents.count;
}

- (int)networkEvents
{
  return self->_networkEvents.list;
}

- (void)clearNetworkEvents
{
}

- (void)addNetworkEvents:(int)a3
{
}

- (int)networkEventsAtIndex:(unint64_t)a3
{
  p_networkEvents = &self->_networkEvents;
  unint64_t count = self->_networkEvents.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_networkEvents->list[a3];
}

- (void)setNetworkEvents:(int *)a3 count:(unint64_t)a4
{
}

- (id)networkEventsAsString:(int)a3
{
  if ((a3 - 1) >= 0xA) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9768[a3 - 1];
  }
}

- (int)StringAsNetworkEvents:(id)a3
{
  if ([a3 isEqualToString:@"NETWORK_EVENT_USER_TURNING_OFF_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_WIFI_TRIGGER_DISCONNECT"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_SYMPTOMS_SENDING_WIFI_RECOMMENDED_SIGNAL"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_SYMPTOMS_SENDING_WEAK_FALLBACK_SIGNAL"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_SYMPTOMS_SENDING_STRONG_FALLBACK_SIGNAL"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_CONNECTION_BEING_REUSED"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_DATA_STALL_AT_APP_LAYER"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_BETTER_ROUTE"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_CELLULAR_FALLBACK_TIMER_START"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"NETWORK_EVENT_CELLULAR_FALLBACK_ATTEMPT_START"]) {
    return 10;
  }
  return 1;
}

- (unint64_t)timeToNetworkEventsMsecsCount
{
  return self->_timeToNetworkEventsMsecs.count;
}

- (unint64_t)timeToNetworkEventsMsecs
{
  return self->_timeToNetworkEventsMsecs.list;
}

- (void)clearTimeToNetworkEventsMsecs
{
}

- (void)addTimeToNetworkEventsMsecs:(unint64_t)a3
{
}

- (unint64_t)timeToNetworkEventsMsecsAtIndex:(unint64_t)a3
{
  p_timeToNetworkEventsMsecs = &self->_timeToNetworkEventsMsecs;
  unint64_t count = self->_timeToNetworkEventsMsecs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_timeToNetworkEventsMsecs->list[a3];
}

- (void)setTimeToNetworkEventsMsecs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)clearPrimaryInterfaceAttemptStatisticsReports
{
}

- (void)addPrimaryInterfaceAttemptStatisticsReports:(id)a3
{
  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  if (!primaryInterfaceAttemptStatisticsReports)
  {
    primaryInterfaceAttemptStatisticsReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_primaryInterfaceAttemptStatisticsReports = primaryInterfaceAttemptStatisticsReports;
  }

  [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports addObject:a3];
}

- (unint64_t)primaryInterfaceAttemptStatisticsReportsCount
{
  return [(NSMutableArray *)self->_primaryInterfaceAttemptStatisticsReports count];
}

- (id)primaryInterfaceAttemptStatisticsReportsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_primaryInterfaceAttemptStatisticsReports objectAtIndex:a3];
}

+ (Class)primaryInterfaceAttemptStatisticsReportsType
{
  return (Class)objc_opt_class();
}

- (void)clearDataUsageSnapshotsAtNetworkEvents
{
}

- (void)addDataUsageSnapshotsAtNetworkEvents:(id)a3
{
  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  if (!dataUsageSnapshotsAtNetworkEvents)
  {
    dataUsageSnapshotsAtNetworkEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_dataUsageSnapshotsAtNetworkEvents = dataUsageSnapshotsAtNetworkEvents;
  }

  [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents addObject:a3];
}

- (unint64_t)dataUsageSnapshotsAtNetworkEventsCount
{
  return [(NSMutableArray *)self->_dataUsageSnapshotsAtNetworkEvents count];
}

- (id)dataUsageSnapshotsAtNetworkEventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dataUsageSnapshotsAtNetworkEvents objectAtIndex:a3];
}

+ (Class)dataUsageSnapshotsAtNetworkEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreCellularFallbackReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreCellularFallbackReport description](&v3, sel_description), -[AWDLibnetcoreCellularFallbackReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_fellback] forKey:@"fellback"];
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
  unsigned int v23 = self->_denyReason - 1;
  if (v23 >= 3) {
    v24 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_denyReason];
  }
  else {
    v24 = off_2641B9750[v23];
  }
  [v3 setObject:v24 forKey:@"denyReason"];
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_fallbackTimerMsecs] forKey:@"fallbackTimer_msecs"];
LABEL_5:
  p_networkEvents = &self->_networkEvents;
  if (self->_networkEvents.count)
  {
    v6 = [MEMORY[0x263EFF980] arrayWithCapacity:];
    if (self->_networkEvents.count)
    {
      unint64_t v7 = 0;
      do
      {
        unsigned int v8 = p_networkEvents->list[v7] - 1;
        if (v8 >= 0xA) {
          v9 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", p_networkEvents->list[v7]];
        }
        else {
          v9 = off_2641B9768[v8];
        }
        [v6 addObject:v9];
        ++v7;
      }
      while (v7 < self->_networkEvents.count);
    }
    [v3 setObject:v6 forKey:@"networkEvents"];
  }
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"timeToNetworkEvents_msecs"];
  if ([(NSMutableArray *)self->_primaryInterfaceAttemptStatisticsReports count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_primaryInterfaceAttemptStatisticsReports, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
    uint64_t v12 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
          }
          [v10 addObject:[(*(id *)(*((void *)&v29 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"primaryInterfaceAttemptStatisticsReports"];
  }
  if ([(NSMutableArray *)self->_dataUsageSnapshotsAtNetworkEvents count])
  {
    v16 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_dataUsageSnapshotsAtNetworkEvents, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
    uint64_t v18 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
          }
          [v16 addObject:[(*(id *)(*((void *)&v25 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v19 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }
    [v3 setObject:v16 forKey:@"dataUsageSnapshotsAtNetworkEvents"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreCellularFallbackReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_networkEvents.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_networkEvents.count);
  }
  if (self->_timeToNetworkEventsMsecs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_timeToNetworkEventsMsecs.count);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  uint64_t v8 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  uint64_t v13 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
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
LABEL_23:
    *((_DWORD *)a3 + 18) = self->_denyReason;
    *((unsigned char *)a3 + 92) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((unsigned char *)a3 + 88) = self->_fellback;
  *((unsigned char *)a3 + 92) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_23;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *((void *)a3 + 7) = self->_fallbackTimerMsecs;
    *((unsigned char *)a3 + 92) |= 1u;
  }
LABEL_5:
  if ([(AWDLibnetcoreCellularFallbackReport *)self networkEventsCount])
  {
    [a3 clearNetworkEvents];
    unint64_t v6 = [(AWDLibnetcoreCellularFallbackReport *)self networkEventsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addNetworkEvents:-[AWDLibnetcoreCellularFallbackReport networkEventsAtIndex:](self, "networkEventsAtIndex:", i)];
    }
  }
  if ([(AWDLibnetcoreCellularFallbackReport *)self timeToNetworkEventsMsecsCount])
  {
    [a3 clearTimeToNetworkEventsMsecs];
    unint64_t v9 = [(AWDLibnetcoreCellularFallbackReport *)self timeToNetworkEventsMsecsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addTimeToNetworkEventsMsecs:-[AWDLibnetcoreCellularFallbackReport timeToNetworkEventsMsecsAtIndex:](self, "timeToNetworkEventsMsecsAtIndex:", j)];
    }
  }
  if ([(AWDLibnetcoreCellularFallbackReport *)self primaryInterfaceAttemptStatisticsReportsCount])
  {
    [a3 clearPrimaryInterfaceAttemptStatisticsReports];
    unint64_t v12 = [(AWDLibnetcoreCellularFallbackReport *)self primaryInterfaceAttemptStatisticsReportsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addPrimaryInterfaceAttemptStatisticsReports:-[AWDLibnetcoreCellularFallbackReport primaryInterfaceAttemptStatisticsReportsAtIndex:](self, "primaryInterfaceAttemptStatisticsReportsAtIndex:", k)];
    }
  }
  if ([(AWDLibnetcoreCellularFallbackReport *)self dataUsageSnapshotsAtNetworkEventsCount])
  {
    [a3 clearDataUsageSnapshotsAtNetworkEvents];
    unint64_t v15 = [(AWDLibnetcoreCellularFallbackReport *)self dataUsageSnapshotsAtNetworkEventsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addDataUsageSnapshotsAtNetworkEvents:-[AWDLibnetcoreCellularFallbackReport dataUsageSnapshotsAtNetworkEventsAtIndex:](self, "dataUsageSnapshotsAtNetworkEventsAtIndex:", m)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_fellback;
    *(unsigned char *)(v5 + 92) |= 4u;
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
  *(_DWORD *)(v5 + 72) = self->_denyReason;
  *(unsigned char *)(v5 + 92) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 56) = self->_fallbackTimerMsecs;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  PBRepeatedUInt64Copy();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
  uint64_t v9 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(primaryInterfaceAttemptStatisticsReports);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addPrimaryInterfaceAttemptStatisticsReports:v13];
      }
      uint64_t v10 = [(NSMutableArray *)primaryInterfaceAttemptStatisticsReports countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
  uint64_t v15 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(dataUsageSnapshotsAtNetworkEvents);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [v6 addDataUsageSnapshotsAtNetworkEvents:v19];
      }
      uint64_t v16 = [(NSMutableArray *)dataUsageSnapshotsAtNetworkEvents countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (!IsEqual) {
    return IsEqual;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 92) & 4) != 0) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  if ((*((unsigned char *)a3 + 92) & 4) == 0) {
    goto LABEL_26;
  }
  if (self->_fellback)
  {
    if (!*((unsigned char *)a3 + 88)) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  if (*((unsigned char *)a3 + 88))
  {
LABEL_26:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 92) & 2) == 0 || self->_denyReason != *((_DWORD *)a3 + 18)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)a3 + 92) & 2) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 92) & 1) == 0 || self->_fallbackTimerMsecs != *((void *)a3 + 7)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)a3 + 92))
  {
    goto LABEL_26;
  }
  int IsEqual = PBRepeatedInt32IsEqual();
  if (IsEqual)
  {
    int IsEqual = PBRepeatedUInt64IsEqual();
    if (IsEqual)
    {
      primaryInterfaceAttemptStatisticsReports = self->_primaryInterfaceAttemptStatisticsReports;
      if (!((unint64_t)primaryInterfaceAttemptStatisticsReports | *((void *)a3 + 10))
        || (int IsEqual = -[NSMutableArray isEqual:](primaryInterfaceAttemptStatisticsReports, "isEqual:")) != 0)
      {
        dataUsageSnapshotsAtNetworkEvents = self->_dataUsageSnapshotsAtNetworkEvents;
        if ((unint64_t)dataUsageSnapshotsAtNetworkEvents | *((void *)a3 + 8))
        {
          LOBYTE(IsEqual) = -[NSMutableArray isEqual:](dataUsageSnapshotsAtNetworkEvents, "isEqual:");
        }
        else
        {
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_fellback;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_denyReason;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_fallbackTimerMsecs;
LABEL_8:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
  uint64_t v7 = v6 ^ PBRepeatedUInt64Hash();
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_primaryInterfaceAttemptStatisticsReports hash];
  return v8 ^ [(NSMutableArray *)self->_dataUsageSnapshotsAtNetworkEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 92);
  if ((v5 & 4) != 0)
  {
    self->_fellbacuint64_t k = *((unsigned char *)a3 + 88);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 92) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_denyReason = *((_DWORD *)a3 + 18);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 92))
  {
LABEL_4:
    self->_fallbackTimerMsecs = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  uint64_t v6 = [a3 networkEventsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDLibnetcoreCellularFallbackReport addNetworkEvents:](self, "addNetworkEvents:", [a3 networkEventsAtIndex:i]);
  }
  uint64_t v9 = [a3 timeToNetworkEventsMsecsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDLibnetcoreCellularFallbackReport addTimeToNetworkEventsMsecs:](self, "addTimeToNetworkEventsMsecs:", [a3 timeToNetworkEventsMsecsAtIndex:j]);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v12 = (void *)*((void *)a3 + 10);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDLibnetcoreCellularFallbackReport *)self addPrimaryInterfaceAttemptStatisticsReports:*(void *)(*((void *)&v26 + 1) + 8 * k)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v14);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = (void *)*((void *)a3 + 8);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t m = 0; m != v19; ++m)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [(AWDLibnetcoreCellularFallbackReport *)self addDataUsageSnapshotsAtNetworkEvents:*(void *)(*((void *)&v22 + 1) + 8 * m)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

- (BOOL)fellback
{
  return self->_fellback;
}

- (unint64_t)fallbackTimerMsecs
{
  return self->_fallbackTimerMsecs;
}

- (NSMutableArray)primaryInterfaceAttemptStatisticsReports
{
  return self->_primaryInterfaceAttemptStatisticsReports;
}

- (void)setPrimaryInterfaceAttemptStatisticsReports:(id)a3
{
}

- (NSMutableArray)dataUsageSnapshotsAtNetworkEvents
{
  return self->_dataUsageSnapshotsAtNetworkEvents;
}

- (void)setDataUsageSnapshotsAtNetworkEvents:(id)a3
{
}

@end