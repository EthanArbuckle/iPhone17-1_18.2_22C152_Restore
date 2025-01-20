@interface AWDLibnetcoreTCPConnectionReport
+ (Class)connectionAttemptStatisticsReportsType;
- (AWDLibnetcoreCellularFallbackReport)cellularFallbackReport;
- (AWDLibnetcoreConnectionStatisticsReport)connectionStatisticsReport;
- (BOOL)delegated;
- (BOOL)hasCellularFallbackReport;
- (BOOL)hasClientIdentifier;
- (BOOL)hasConnectionStatisticsReport;
- (BOOL)hasDelegated;
- (BOOL)hasIPAddressAttemptCount;
- (BOOL)hasReportReason;
- (BOOL)hasSourceAppIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)connectionAttemptStatisticsReports;
- (NSString)clientIdentifier;
- (NSString)sourceAppIdentifier;
- (id)connectionAttemptStatisticsReportsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reportReasonAsString:(int)a3;
- (int)StringAsReportReason:(id)a3;
- (int)reportReason;
- (unint64_t)connectionAttemptStatisticsReportsCount;
- (unint64_t)hash;
- (unint64_t)iPAddressAttemptCount;
- (unint64_t)timestamp;
- (void)addConnectionAttemptStatisticsReports:(id)a3;
- (void)clearConnectionAttemptStatisticsReports;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCellularFallbackReport:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConnectionAttemptStatisticsReports:(id)a3;
- (void)setConnectionStatisticsReport:(id)a3;
- (void)setDelegated:(BOOL)a3;
- (void)setHasDelegated:(BOOL)a3;
- (void)setHasIPAddressAttemptCount:(BOOL)a3;
- (void)setHasReportReason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIPAddressAttemptCount:(unint64_t)a3;
- (void)setReportReason:(int)a3;
- (void)setSourceAppIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreTCPConnectionReport

- (void)dealloc
{
  [(AWDLibnetcoreTCPConnectionReport *)self setClientIdentifier:0];
  [(AWDLibnetcoreTCPConnectionReport *)self setConnectionStatisticsReport:0];
  [(AWDLibnetcoreTCPConnectionReport *)self setCellularFallbackReport:0];
  [(AWDLibnetcoreTCPConnectionReport *)self setConnectionAttemptStatisticsReports:0];
  [(AWDLibnetcoreTCPConnectionReport *)self setSourceAppIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPConnectionReport;
  [(AWDLibnetcoreTCPConnectionReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (void)setDelegated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_delegated = a3;
}

- (void)setHasDelegated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDelegated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)reportReason
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_reportReason;
  }
  else {
    return 1;
  }
}

- (void)setReportReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_reportReason = a3;
}

- (void)setHasReportReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)reportReasonAsString:(int)a3
{
  if ((a3 - 1) >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B97D8[a3 - 1];
  }
}

- (int)StringAsReportReason:(id)a3
{
  if ([a3 isEqualToString:@"REPORT_REASON_FALLBACK_SIGNAL"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"REPORT_REASON_MPTCP"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"REPORT_REASON_DATA_STALL_AT_APP_LAYER"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"REPORT_REASON_CELL_FALLBACK_METRICS_TESTING"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"REPORT_REASON_TLS_HANDSHAKE_TIMEOUT"]) {
    return 5;
  }
  return 1;
}

- (BOOL)hasConnectionStatisticsReport
{
  return self->_connectionStatisticsReport != 0;
}

- (BOOL)hasCellularFallbackReport
{
  return self->_cellularFallbackReport != 0;
}

- (void)setIPAddressAttemptCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iPAddressAttemptCount = a3;
}

- (void)setHasIPAddressAttemptCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIPAddressAttemptCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearConnectionAttemptStatisticsReports
{
}

- (void)addConnectionAttemptStatisticsReports:(id)a3
{
  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  if (!connectionAttemptStatisticsReports)
  {
    connectionAttemptStatisticsReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_connectionAttemptStatisticsReports = connectionAttemptStatisticsReports;
  }

  [(NSMutableArray *)connectionAttemptStatisticsReports addObject:a3];
}

- (unint64_t)connectionAttemptStatisticsReportsCount
{
  return [(NSMutableArray *)self->_connectionAttemptStatisticsReports count];
}

- (id)connectionAttemptStatisticsReportsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_connectionAttemptStatisticsReports objectAtIndex:a3];
}

+ (Class)connectionAttemptStatisticsReportsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSourceAppIdentifier
{
  return self->_sourceAppIdentifier != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPConnectionReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreTCPConnectionReport description](&v3, sel_description), -[AWDLibnetcoreTCPConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_delegated] forKey:@"delegated"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unsigned int v6 = self->_reportReason - 1;
    if (v6 >= 5) {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_reportReason];
    }
    else {
      v7 = off_2641B97D8[v6];
    }
    [v3 setObject:v7 forKey:@"reportReason"];
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  if (connectionStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreConnectionStatisticsReport dictionaryRepresentation](connectionStatisticsReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"connectionStatisticsReport"];
  }
  cellularFallbackReport = self->_cellularFallbackReport;
  if (cellularFallbackReport) {
    [v3 setObject:-[AWDLibnetcoreCellularFallbackReport dictionaryRepresentation](cellularFallbackReport, "dictionaryRepresentation") forKey:@"cellularFallbackReport"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_iPAddressAttemptCount] forKey:@"IPAddressAttemptCount"];
  }
  if ([(NSMutableArray *)self->_connectionAttemptStatisticsReports count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_connectionAttemptStatisticsReports, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
    uint64_t v12 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(connectionAttemptStatisticsReports);
          }
          [v10 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"connectionAttemptStatisticsReports"];
  }
  sourceAppIdentifier = self->_sourceAppIdentifier;
  if (sourceAppIdentifier) {
    [v3 setObject:sourceAppIdentifier forKey:@"sourceAppIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_connectionStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cellularFallbackReport) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  uint64_t v6 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(connectionAttemptStatisticsReports);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (self->_sourceAppIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 76) |= 2u;
  }
  if (self->_clientIdentifier) {
    [a3 setClientIdentifier:];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)a3 + 72) = self->_delegated;
    *((unsigned char *)a3 + 76) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_reportReason;
    *((unsigned char *)a3 + 76) |= 4u;
  }
  if (self->_connectionStatisticsReport) {
    [a3 setConnectionStatisticsReport:];
  }
  if (self->_cellularFallbackReport) {
    [a3 setCellularFallbackReport:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_iPAddressAttemptCount;
    *((unsigned char *)a3 + 76) |= 1u;
  }
  if ([(AWDLibnetcoreTCPConnectionReport *)self connectionAttemptStatisticsReportsCount])
  {
    [a3 clearConnectionAttemptStatisticsReports];
    unint64_t v6 = [(AWDLibnetcoreTCPConnectionReport *)self connectionAttemptStatisticsReportsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addConnectionAttemptStatisticsReports:-[AWDLibnetcoreTCPConnectionReport connectionAttemptStatisticsReportsAtIndex:](self, "connectionAttemptStatisticsReportsAtIndex:", i)];
    }
  }
  if (self->_sourceAppIdentifier)
  {
    [a3 setSourceAppIdentifier:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 76) |= 2u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 72) = self->_delegated;
    *(unsigned char *)(v6 + 76) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_reportReason;
    *(unsigned char *)(v6 + 76) |= 4u;
  }

  *(void *)(v6 + 48) = [(AWDLibnetcoreConnectionStatisticsReport *)self->_connectionStatisticsReport copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDLibnetcoreCellularFallbackReport *)self->_cellularFallbackReport copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_iPAddressAttemptCount;
    *(unsigned char *)(v6 + 76) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
  uint64_t v9 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(connectionAttemptStatisticsReports);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addConnectionAttemptStatisticsReports:v13];
      }
      uint64_t v10 = [(NSMutableArray *)connectionAttemptStatisticsReports countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  *(void *)(v6 + 64) = [(NSString *)self->_sourceAppIdentifier copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 2) != 0)
  {
    goto LABEL_36;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)a3 + 4))
  {
    int v5 = -[NSString isEqual:](clientIdentifier, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((*((unsigned char *)a3 + 76) & 8) != 0) {
      goto LABEL_36;
    }
    goto LABEL_18;
  }
  if ((*((unsigned char *)a3 + 76) & 8) == 0) {
    goto LABEL_36;
  }
  if (self->_delegated)
  {
    if (!*((unsigned char *)a3 + 72)) {
      goto LABEL_36;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 72))
  {
LABEL_36:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 76) & 4) == 0 || self->_reportReason != *((_DWORD *)a3 + 14)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)a3 + 76) & 4) != 0)
  {
    goto LABEL_36;
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  if (!((unint64_t)connectionStatisticsReport | *((void *)a3 + 6))
    || (int v5 = -[AWDLibnetcoreConnectionStatisticsReport isEqual:](connectionStatisticsReport, "isEqual:")) != 0)
  {
    cellularFallbackReport = self->_cellularFallbackReport;
    if (!((unint64_t)cellularFallbackReport | *((void *)a3 + 3))
      || (int v5 = -[AWDLibnetcoreCellularFallbackReport isEqual:](cellularFallbackReport, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 76) & 1) == 0 || self->_iPAddressAttemptCount != *((void *)a3 + 1)) {
          goto LABEL_36;
        }
      }
      else if (*((unsigned char *)a3 + 76))
      {
        goto LABEL_36;
      }
      connectionAttemptStatisticsReports = self->_connectionAttemptStatisticsReports;
      if (!((unint64_t)connectionAttemptStatisticsReports | *((void *)a3 + 5))
        || (int v5 = -[NSMutableArray isEqual:](connectionAttemptStatisticsReports, "isEqual:")) != 0)
      {
        sourceAppIdentifier = self->_sourceAppIdentifier;
        if ((unint64_t)sourceAppIdentifier | *((void *)a3 + 8))
        {
          LOBYTE(v5) = -[NSString isEqual:](sourceAppIdentifier, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_clientIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_delegated;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_reportReason;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  unint64_t v7 = [(AWDLibnetcoreConnectionStatisticsReport *)self->_connectionStatisticsReport hash];
  unint64_t v8 = [(AWDLibnetcoreCellularFallbackReport *)self->_cellularFallbackReport hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v9 = 2654435761u * self->_iPAddressAttemptCount;
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSMutableArray *)self->_connectionAttemptStatisticsReports hash];
  return v10 ^ [(NSString *)self->_sourceAppIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)a3 + 76) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDLibnetcoreTCPConnectionReport setClientIdentifier:](self, "setClientIdentifier:");
  }
  char v5 = *((unsigned char *)a3 + 76);
  if ((v5 & 8) != 0)
  {
    self->_delegated = *((unsigned char *)a3 + 72);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 76);
  }
  if ((v5 & 4) != 0)
  {
    self->_reportReason = *((_DWORD *)a3 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
  connectionStatisticsReport = self->_connectionStatisticsReport;
  uint64_t v7 = *((void *)a3 + 6);
  if (connectionStatisticsReport)
  {
    if (v7) {
      -[AWDLibnetcoreConnectionStatisticsReport mergeFrom:](connectionStatisticsReport, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDLibnetcoreTCPConnectionReport setConnectionStatisticsReport:](self, "setConnectionStatisticsReport:");
  }
  cellularFallbackReport = self->_cellularFallbackReport;
  uint64_t v9 = *((void *)a3 + 3);
  if (cellularFallbackReport)
  {
    if (v9) {
      -[AWDLibnetcoreCellularFallbackReport mergeFrom:](cellularFallbackReport, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDLibnetcoreTCPConnectionReport setCellularFallbackReport:](self, "setCellularFallbackReport:");
  }
  if (*((unsigned char *)a3 + 76))
  {
    self->_iPAddressAttemptCount = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDLibnetcoreTCPConnectionReport *)self addConnectionAttemptStatisticsReports:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  if (*((void *)a3 + 8)) {
    -[AWDLibnetcoreTCPConnectionReport setSourceAppIdentifier:](self, "setSourceAppIdentifier:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)delegated
{
  return self->_delegated;
}

- (AWDLibnetcoreConnectionStatisticsReport)connectionStatisticsReport
{
  return self->_connectionStatisticsReport;
}

- (void)setConnectionStatisticsReport:(id)a3
{
}

- (AWDLibnetcoreCellularFallbackReport)cellularFallbackReport
{
  return self->_cellularFallbackReport;
}

- (void)setCellularFallbackReport:(id)a3
{
}

- (unint64_t)iPAddressAttemptCount
{
  return self->_iPAddressAttemptCount;
}

- (NSMutableArray)connectionAttemptStatisticsReports
{
  return self->_connectionAttemptStatisticsReports;
}

- (void)setConnectionAttemptStatisticsReports:(id)a3
{
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (void)setSourceAppIdentifier:(id)a3
{
}

@end