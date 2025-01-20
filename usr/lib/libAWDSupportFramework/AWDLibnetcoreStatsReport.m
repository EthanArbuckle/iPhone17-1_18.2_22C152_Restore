@interface AWDLibnetcoreStatsReport
+ (Class)tcpECNInterfaceReportType;
- (AWDLibnetcoreMPTCPStatsReport)mptcpStatisticsReport;
- (AWDLibnetcoreMbufStatsReport)mbufStatisticsReport;
- (AWDLibnetcoreNetworkdStatsReport)networkdStatisticsReport;
- (AWDLibnetcoreTCPECNStatsReport)tcpECNStatisticsReport;
- (AWDLibnetcoreTCPStatsReport)tcpStatisticsReport;
- (AWDLibnetcoreTCPTFOStatsReport)tcpTFOStatisticsReport;
- (AWDNWAPIUsage)nwAPIUsageReport;
- (BOOL)hasMbufStatisticsReport;
- (BOOL)hasMptcpStatisticsReport;
- (BOOL)hasNetworkdStatisticsReport;
- (BOOL)hasNwAPIUsageReport;
- (BOOL)hasReportReason;
- (BOOL)hasTcpECNStatisticsReport;
- (BOOL)hasTcpStatisticsReport;
- (BOOL)hasTcpTFOStatisticsReport;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tcpECNInterfaceReports;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tcpECNInterfaceReportAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tcpECNInterfaceReportsCount;
- (unint64_t)timestamp;
- (unsigned)reportReason;
- (void)addTcpECNInterfaceReport:(id)a3;
- (void)clearTcpECNInterfaceReports;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasReportReason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMbufStatisticsReport:(id)a3;
- (void)setMptcpStatisticsReport:(id)a3;
- (void)setNetworkdStatisticsReport:(id)a3;
- (void)setNwAPIUsageReport:(id)a3;
- (void)setReportReason:(unsigned int)a3;
- (void)setTcpECNInterfaceReports:(id)a3;
- (void)setTcpECNStatisticsReport:(id)a3;
- (void)setTcpStatisticsReport:(id)a3;
- (void)setTcpTFOStatisticsReport:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreStatsReport

- (void)dealloc
{
  [(AWDLibnetcoreStatsReport *)self setMbufStatisticsReport:0];
  [(AWDLibnetcoreStatsReport *)self setTcpStatisticsReport:0];
  [(AWDLibnetcoreStatsReport *)self setTcpECNStatisticsReport:0];
  [(AWDLibnetcoreStatsReport *)self setTcpTFOStatisticsReport:0];
  [(AWDLibnetcoreStatsReport *)self setNetworkdStatisticsReport:0];
  [(AWDLibnetcoreStatsReport *)self setTcpECNInterfaceReports:0];
  [(AWDLibnetcoreStatsReport *)self setNwAPIUsageReport:0];
  [(AWDLibnetcoreStatsReport *)self setMptcpStatisticsReport:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreStatsReport;
  [(AWDLibnetcoreStatsReport *)&v3 dealloc];
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

- (void)setReportReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reportReason = a3;
}

- (void)setHasReportReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMbufStatisticsReport
{
  return self->_mbufStatisticsReport != 0;
}

- (BOOL)hasTcpStatisticsReport
{
  return self->_tcpStatisticsReport != 0;
}

- (BOOL)hasTcpECNStatisticsReport
{
  return self->_tcpECNStatisticsReport != 0;
}

- (BOOL)hasTcpTFOStatisticsReport
{
  return self->_tcpTFOStatisticsReport != 0;
}

- (BOOL)hasNetworkdStatisticsReport
{
  return self->_networkdStatisticsReport != 0;
}

- (void)clearTcpECNInterfaceReports
{
}

- (void)addTcpECNInterfaceReport:(id)a3
{
  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  if (!tcpECNInterfaceReports)
  {
    tcpECNInterfaceReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_tcpECNInterfaceReports = tcpECNInterfaceReports;
  }

  [(NSMutableArray *)tcpECNInterfaceReports addObject:a3];
}

- (unint64_t)tcpECNInterfaceReportsCount
{
  return [(NSMutableArray *)self->_tcpECNInterfaceReports count];
}

- (id)tcpECNInterfaceReportAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tcpECNInterfaceReports objectAtIndex:a3];
}

+ (Class)tcpECNInterfaceReportType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNwAPIUsageReport
{
  return self->_nwAPIUsageReport != 0;
}

- (BOOL)hasMptcpStatisticsReport
{
  return self->_mptcpStatisticsReport != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreStatsReport description](&v3, sel_description), -[AWDLibnetcoreStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reportReason] forKey:@"reportReason"];
  }
  mbufStatisticsReport = self->_mbufStatisticsReport;
  if (mbufStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreMbufStatsReport dictionaryRepresentation](mbufStatisticsReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"mbufStatisticsReport"];
  }
  tcpStatisticsReport = self->_tcpStatisticsReport;
  if (tcpStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreTCPStatsReport dictionaryRepresentation](tcpStatisticsReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"tcpStatisticsReport"];
  }
  tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
  if (tcpECNStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreTCPECNStatsReport dictionaryRepresentation](tcpECNStatisticsReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"tcpECNStatisticsReport"];
  }
  tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
  if (tcpTFOStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreTCPTFOStatsReport dictionaryRepresentation](tcpTFOStatisticsReport, "dictionaryRepresentation")] forKey:@"tcpTFOStatisticsReport"];
  }
  networkdStatisticsReport = self->_networkdStatisticsReport;
  if (networkdStatisticsReport) {
    [v3 setObject:[[-[AWDLibnetcoreNetworkdStatsReport dictionaryRepresentation](networkdStatisticsReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"networkdStatisticsReport"];
  }
  if ([(NSMutableArray *)self->_tcpECNInterfaceReports count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_tcpECNInterfaceReports, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
    uint64_t v12 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(tcpECNInterfaceReports);
          }
          [v10 addObject:[*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"tcpECNInterfaceReport"];
  }
  nwAPIUsageReport = self->_nwAPIUsageReport;
  if (nwAPIUsageReport) {
    [v3 setObject:[[-[AWDNWAPIUsage dictionaryRepresentation](nwAPIUsageReport, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"nwAPIUsageReport"];
  }
  mptcpStatisticsReport = self->_mptcpStatisticsReport;
  if (mptcpStatisticsReport) {
    [v3 setObject: -[AWDLibnetcoreMPTCPStatsReport dictionaryRepresentation](mptcpStatisticsReport, "dictionaryRepresentation") forKey:@"mptcpStatisticsReport"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_mbufStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tcpStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tcpECNStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tcpTFOStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_networkdStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  uint64_t v6 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(tcpECNInterfaceReports);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (self->_nwAPIUsageReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mptcpStatisticsReport) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_reportReason;
    *((unsigned char *)a3 + 88) |= 2u;
  }
  if (self->_mbufStatisticsReport) {
    [a3 setMbufStatisticsReport:];
  }
  if (self->_tcpStatisticsReport) {
    [a3 setTcpStatisticsReport:];
  }
  if (self->_tcpECNStatisticsReport) {
    [a3 setTcpECNStatisticsReport:];
  }
  if (self->_tcpTFOStatisticsReport) {
    [a3 setTcpTFOStatisticsReport:];
  }
  if (self->_networkdStatisticsReport) {
    [a3 setNetworkdStatisticsReport:];
  }
  if ([(AWDLibnetcoreStatsReport *)self tcpECNInterfaceReportsCount])
  {
    [a3 clearTcpECNInterfaceReports];
    unint64_t v6 = [(AWDLibnetcoreStatsReport *)self tcpECNInterfaceReportsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addTcpECNInterfaceReport:-[AWDLibnetcoreStatsReport tcpECNInterfaceReportAtIndex:](self, "tcpECNInterfaceReportAtIndex:", i)];
    }
  }
  if (self->_nwAPIUsageReport) {
    [a3 setNwAPIUsageReport:];
  }
  if (self->_mptcpStatisticsReport)
  {
    [a3 setMptcpStatisticsReport:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_reportReason;
    *(unsigned char *)(v5 + 88) |= 2u;
  }

  *(void *)(v6 + 16) = [(AWDLibnetcoreMbufStatsReport *)self->_mbufStatisticsReport copyWithZone:a3];
  *(void *)(v6 + 72) = [(AWDLibnetcoreTCPStatsReport *)self->_tcpStatisticsReport copyWithZone:a3];

  *(void *)(v6 + 64) = [(AWDLibnetcoreTCPECNStatsReport *)self->_tcpECNStatisticsReport copyWithZone:a3];
  *(void *)(v6 + 80) = [(AWDLibnetcoreTCPTFOStatsReport *)self->_tcpTFOStatisticsReport copyWithZone:a3];

  *(void *)(v6 + 32) = [(AWDLibnetcoreNetworkdStatsReport *)self->_networkdStatisticsReport copyWithZone:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
  uint64_t v9 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(tcpECNInterfaceReports);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addTcpECNInterfaceReport:v13];
      }
      uint64_t v10 = [(NSMutableArray *)tcpECNInterfaceReports countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  *(void *)(v6 + 40) = [(AWDNWAPIUsage *)self->_nwAPIUsageReport copyWithZone:a3];
  *(void *)(v6 + 24) = [(AWDLibnetcoreMPTCPStatsReport *)self->_mptcpStatisticsReport copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 88) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)a3 + 88))
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 88) & 2) == 0 || self->_reportReason != *((_DWORD *)a3 + 12)) {
        goto LABEL_28;
      }
    }
    else if ((*((unsigned char *)a3 + 88) & 2) != 0)
    {
      goto LABEL_28;
    }
    mbufStatisticsReport = self->_mbufStatisticsReport;
    if (!((unint64_t)mbufStatisticsReport | *((void *)a3 + 2))
      || (int v5 = -[AWDLibnetcoreMbufStatsReport isEqual:](mbufStatisticsReport, "isEqual:")) != 0)
    {
      tcpStatisticsReport = self->_tcpStatisticsReport;
      if (!((unint64_t)tcpStatisticsReport | *((void *)a3 + 9))
        || (int v5 = -[AWDLibnetcoreTCPStatsReport isEqual:](tcpStatisticsReport, "isEqual:")) != 0)
      {
        tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
        if (!((unint64_t)tcpECNStatisticsReport | *((void *)a3 + 8))
          || (int v5 = -[AWDLibnetcoreTCPECNStatsReport isEqual:](tcpECNStatisticsReport, "isEqual:")) != 0)
        {
          tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
          if (!((unint64_t)tcpTFOStatisticsReport | *((void *)a3 + 10))
            || (int v5 = -[AWDLibnetcoreTCPTFOStatsReport isEqual:](tcpTFOStatisticsReport, "isEqual:")) != 0)
          {
            networkdStatisticsReport = self->_networkdStatisticsReport;
            if (!((unint64_t)networkdStatisticsReport | *((void *)a3 + 4))
              || (int v5 = -[AWDLibnetcoreNetworkdStatsReport isEqual:](networkdStatisticsReport, "isEqual:")) != 0)
            {
              tcpECNInterfaceReports = self->_tcpECNInterfaceReports;
              if (!((unint64_t)tcpECNInterfaceReports | *((void *)a3 + 7))
                || (int v5 = -[NSMutableArray isEqual:](tcpECNInterfaceReports, "isEqual:")) != 0)
              {
                nwAPIUsageReport = self->_nwAPIUsageReport;
                if (!((unint64_t)nwAPIUsageReport | *((void *)a3 + 5))
                  || (int v5 = -[AWDNWAPIUsage isEqual:](nwAPIUsageReport, "isEqual:")) != 0)
                {
                  mptcpStatisticsReport = self->_mptcpStatisticsReport;
                  if ((unint64_t)mptcpStatisticsReport | *((void *)a3 + 3))
                  {
                    LOBYTE(v5) = -[AWDLibnetcoreMPTCPStatsReport isEqual:](mptcpStatisticsReport, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_reportReason;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(AWDLibnetcoreMbufStatsReport *)self->_mbufStatisticsReport hash];
  unint64_t v6 = [(AWDLibnetcoreTCPStatsReport *)self->_tcpStatisticsReport hash];
  unint64_t v7 = v5 ^ v6 ^ [(AWDLibnetcoreTCPECNStatsReport *)self->_tcpECNStatisticsReport hash];
  unint64_t v8 = [(AWDLibnetcoreTCPTFOStatsReport *)self->_tcpTFOStatisticsReport hash];
  unint64_t v9 = v8 ^ [(AWDLibnetcoreNetworkdStatsReport *)self->_networkdStatisticsReport hash];
  uint64_t v10 = v7 ^ v9 ^ [(NSMutableArray *)self->_tcpECNInterfaceReports hash];
  unint64_t v11 = [(AWDNWAPIUsage *)self->_nwAPIUsageReport hash];
  return v10 ^ v11 ^ [(AWDLibnetcoreMPTCPStatsReport *)self->_mptcpStatisticsReport hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 88);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 88);
  }
  if ((v5 & 2) != 0)
  {
    self->_reportReason = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  mbufStatisticsReport = self->_mbufStatisticsReport;
  uint64_t v7 = *((void *)a3 + 2);
  if (mbufStatisticsReport)
  {
    if (v7) {
      -[AWDLibnetcoreMbufStatsReport mergeFrom:](mbufStatisticsReport, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDLibnetcoreStatsReport setMbufStatisticsReport:](self, "setMbufStatisticsReport:");
  }
  tcpStatisticsReport = self->_tcpStatisticsReport;
  uint64_t v9 = *((void *)a3 + 9);
  if (tcpStatisticsReport)
  {
    if (v9) {
      -[AWDLibnetcoreTCPStatsReport mergeFrom:](tcpStatisticsReport, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDLibnetcoreStatsReport setTcpStatisticsReport:](self, "setTcpStatisticsReport:");
  }
  tcpECNStatisticsReport = self->_tcpECNStatisticsReport;
  uint64_t v11 = *((void *)a3 + 8);
  if (tcpECNStatisticsReport)
  {
    if (v11) {
      -[AWDLibnetcoreTCPECNStatsReport mergeFrom:](tcpECNStatisticsReport, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDLibnetcoreStatsReport setTcpECNStatisticsReport:](self, "setTcpECNStatisticsReport:");
  }
  tcpTFOStatisticsReport = self->_tcpTFOStatisticsReport;
  uint64_t v13 = *((void *)a3 + 10);
  if (tcpTFOStatisticsReport)
  {
    if (v13) {
      -[AWDLibnetcoreTCPTFOStatsReport mergeFrom:](tcpTFOStatisticsReport, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDLibnetcoreStatsReport setTcpTFOStatisticsReport:](self, "setTcpTFOStatisticsReport:");
  }
  networkdStatisticsReport = self->_networkdStatisticsReport;
  uint64_t v15 = *((void *)a3 + 4);
  if (networkdStatisticsReport)
  {
    if (v15) {
      -[AWDLibnetcoreNetworkdStatsReport mergeFrom:](networkdStatisticsReport, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDLibnetcoreStatsReport setNetworkdStatisticsReport:](self, "setNetworkdStatisticsReport:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v16 = (void *)*((void *)a3 + 7);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [(AWDLibnetcoreStatsReport *)self addTcpECNInterfaceReport:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }
  nwAPIUsageReport = self->_nwAPIUsageReport;
  uint64_t v22 = *((void *)a3 + 5);
  if (nwAPIUsageReport)
  {
    if (v22) {
      -[AWDNWAPIUsage mergeFrom:](nwAPIUsageReport, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[AWDLibnetcoreStatsReport setNwAPIUsageReport:](self, "setNwAPIUsageReport:");
  }
  mptcpStatisticsReport = self->_mptcpStatisticsReport;
  uint64_t v24 = *((void *)a3 + 3);
  if (mptcpStatisticsReport)
  {
    if (v24) {
      -[AWDLibnetcoreMPTCPStatsReport mergeFrom:](mptcpStatisticsReport, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[AWDLibnetcoreStatsReport setMptcpStatisticsReport:](self, "setMptcpStatisticsReport:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reportReason
{
  return self->_reportReason;
}

- (AWDLibnetcoreMbufStatsReport)mbufStatisticsReport
{
  return self->_mbufStatisticsReport;
}

- (void)setMbufStatisticsReport:(id)a3
{
}

- (AWDLibnetcoreTCPStatsReport)tcpStatisticsReport
{
  return self->_tcpStatisticsReport;
}

- (void)setTcpStatisticsReport:(id)a3
{
}

- (AWDLibnetcoreTCPECNStatsReport)tcpECNStatisticsReport
{
  return self->_tcpECNStatisticsReport;
}

- (void)setTcpECNStatisticsReport:(id)a3
{
}

- (AWDLibnetcoreTCPTFOStatsReport)tcpTFOStatisticsReport
{
  return self->_tcpTFOStatisticsReport;
}

- (void)setTcpTFOStatisticsReport:(id)a3
{
}

- (AWDLibnetcoreNetworkdStatsReport)networkdStatisticsReport
{
  return self->_networkdStatisticsReport;
}

- (void)setNetworkdStatisticsReport:(id)a3
{
}

- (NSMutableArray)tcpECNInterfaceReports
{
  return self->_tcpECNInterfaceReports;
}

- (void)setTcpECNInterfaceReports:(id)a3
{
}

- (AWDNWAPIUsage)nwAPIUsageReport
{
  return self->_nwAPIUsageReport;
}

- (void)setNwAPIUsageReport:(id)a3
{
}

- (AWDLibnetcoreMPTCPStatsReport)mptcpStatisticsReport
{
  return self->_mptcpStatisticsReport;
}

- (void)setMptcpStatisticsReport:(id)a3
{
}

@end