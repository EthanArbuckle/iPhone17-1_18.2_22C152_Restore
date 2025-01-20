@interface AWDLBConnectionReport
- (BOOL)hasBytesReceived;
- (BOOL)hasBytesSent;
- (BOOL)hasClientConnectionCount;
- (BOOL)hasConnectionAttemptCount;
- (BOOL)hasConnectionCellularFallbackCount;
- (BOOL)hasConnectionDuration;
- (BOOL)hasConnectionFailureCount;
- (BOOL)hasConnectionSuccessMptcpCount;
- (BOOL)hasConnectionSuccessTcpCount;
- (BOOL)hasResumptionFailureCount;
- (BOOL)hasResumptionSuccessCount;
- (BOOL)hasSuspensionCount;
- (BOOL)hasTimestamp;
- (BOOL)hasUpgradeSuccessAndNotNeededCount;
- (BOOL)hasUpgradeSuccessAndPrimaryCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)connectionAttemptCount;
- (int)connectionCellularFallbackCount;
- (int)connectionFailureCount;
- (int)connectionSuccessMptcpCount;
- (int)connectionSuccessTcpCount;
- (int)resumptionFailureCount;
- (int)resumptionFailureErrors;
- (int)resumptionFailureErrorsAtIndex:(unint64_t)a3;
- (int)resumptionSuccessCount;
- (int)suspensionCount;
- (int)upgradeSuccessAndNotNeededCount;
- (int)upgradeSuccessAndPrimaryCount;
- (int64_t)bytesReceived;
- (int64_t)bytesSent;
- (int64_t)clientConnectionCount;
- (int64_t)connectionDuration;
- (int64_t)connectionReadyTimes;
- (int64_t)connectionReadyTimesAtIndex:(unint64_t)a3;
- (int64_t)resumptionFailureTimes;
- (int64_t)resumptionFailureTimesAtIndex:(unint64_t)a3;
- (int64_t)resumptionSuccessTimes;
- (int64_t)resumptionSuccessTimesAtIndex:(unint64_t)a3;
- (unint64_t)connectionReadyTimesCount;
- (unint64_t)hash;
- (unint64_t)resumptionFailureErrorsCount;
- (unint64_t)resumptionFailureTimesCount;
- (unint64_t)resumptionSuccessTimesCount;
- (unint64_t)timestamp;
- (void)addConnectionReadyTimes:(int64_t)a3;
- (void)addResumptionFailureErrors:(int)a3;
- (void)addResumptionFailureTimes:(int64_t)a3;
- (void)addResumptionSuccessTimes:(int64_t)a3;
- (void)clearConnectionReadyTimes;
- (void)clearResumptionFailureErrors;
- (void)clearResumptionFailureTimes;
- (void)clearResumptionSuccessTimes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setBytesSent:(int64_t)a3;
- (void)setClientConnectionCount:(int64_t)a3;
- (void)setConnectionAttemptCount:(int)a3;
- (void)setConnectionCellularFallbackCount:(int)a3;
- (void)setConnectionDuration:(int64_t)a3;
- (void)setConnectionFailureCount:(int)a3;
- (void)setConnectionReadyTimes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setConnectionSuccessMptcpCount:(int)a3;
- (void)setConnectionSuccessTcpCount:(int)a3;
- (void)setHasBytesReceived:(BOOL)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasClientConnectionCount:(BOOL)a3;
- (void)setHasConnectionAttemptCount:(BOOL)a3;
- (void)setHasConnectionCellularFallbackCount:(BOOL)a3;
- (void)setHasConnectionDuration:(BOOL)a3;
- (void)setHasConnectionFailureCount:(BOOL)a3;
- (void)setHasConnectionSuccessMptcpCount:(BOOL)a3;
- (void)setHasConnectionSuccessTcpCount:(BOOL)a3;
- (void)setHasResumptionFailureCount:(BOOL)a3;
- (void)setHasResumptionSuccessCount:(BOOL)a3;
- (void)setHasSuspensionCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUpgradeSuccessAndNotNeededCount:(BOOL)a3;
- (void)setHasUpgradeSuccessAndPrimaryCount:(BOOL)a3;
- (void)setResumptionFailureCount:(int)a3;
- (void)setResumptionFailureErrors:(int *)a3 count:(unint64_t)a4;
- (void)setResumptionFailureTimes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setResumptionSuccessCount:(int)a3;
- (void)setResumptionSuccessTimes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setSuspensionCount:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUpgradeSuccessAndNotNeededCount:(int)a3;
- (void)setUpgradeSuccessAndPrimaryCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLBConnectionReport

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDLBConnectionReport;
  [(AWDLBConnectionReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setConnectionAttemptCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_connectionAttemptCount = a3;
}

- (void)setHasConnectionAttemptCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConnectionAttemptCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionSuccessMptcpCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_connectionSuccessMptcpCount = a3;
}

- (void)setHasConnectionSuccessMptcpCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasConnectionSuccessMptcpCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConnectionSuccessTcpCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_connectionSuccessTcpCount = a3;
}

- (void)setHasConnectionSuccessTcpCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasConnectionSuccessTcpCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionFailureCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_connectionFailureCount = a3;
}

- (void)setHasConnectionFailureCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasConnectionFailureCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setConnectionCellularFallbackCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_connectionCellularFallbackCount = a3;
}

- (void)setHasConnectionCellularFallbackCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasConnectionCellularFallbackCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)connectionReadyTimesCount
{
  return self->_connectionReadyTimes.count;
}

- (int64_t)connectionReadyTimes
{
  return self->_connectionReadyTimes.list;
}

- (void)clearConnectionReadyTimes
{
}

- (void)addConnectionReadyTimes:(int64_t)a3
{
}

- (int64_t)connectionReadyTimesAtIndex:(unint64_t)a3
{
  p_connectionReadyTimes = &self->_connectionReadyTimes;
  unint64_t count = self->_connectionReadyTimes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_connectionReadyTimes->list[a3];
}

- (void)setConnectionReadyTimes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)setSuspensionCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_suspensionCount = a3;
}

- (void)setHasSuspensionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSuspensionCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setResumptionSuccessCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_resumptionSuccessCount = a3;
}

- (void)setHasResumptionSuccessCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasResumptionSuccessCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setResumptionFailureCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_resumptionFailureCount = a3;
}

- (void)setHasResumptionFailureCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasResumptionFailureCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)resumptionFailureErrorsCount
{
  return self->_resumptionFailureErrors.count;
}

- (int)resumptionFailureErrors
{
  return self->_resumptionFailureErrors.list;
}

- (void)clearResumptionFailureErrors
{
}

- (void)addResumptionFailureErrors:(int)a3
{
}

- (int)resumptionFailureErrorsAtIndex:(unint64_t)a3
{
  p_resumptionFailureErrors = &self->_resumptionFailureErrors;
  unint64_t count = self->_resumptionFailureErrors.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_resumptionFailureErrors->list[a3];
}

- (void)setResumptionFailureErrors:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)resumptionSuccessTimesCount
{
  return self->_resumptionSuccessTimes.count;
}

- (int64_t)resumptionSuccessTimes
{
  return self->_resumptionSuccessTimes.list;
}

- (void)clearResumptionSuccessTimes
{
}

- (void)addResumptionSuccessTimes:(int64_t)a3
{
}

- (int64_t)resumptionSuccessTimesAtIndex:(unint64_t)a3
{
  p_resumptionSuccessTimes = &self->_resumptionSuccessTimes;
  unint64_t count = self->_resumptionSuccessTimes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_resumptionSuccessTimes->list[a3];
}

- (void)setResumptionSuccessTimes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)resumptionFailureTimesCount
{
  return self->_resumptionFailureTimes.count;
}

- (int64_t)resumptionFailureTimes
{
  return self->_resumptionFailureTimes.list;
}

- (void)clearResumptionFailureTimes
{
}

- (void)addResumptionFailureTimes:(int64_t)a3
{
}

- (int64_t)resumptionFailureTimesAtIndex:(unint64_t)a3
{
  p_resumptionFailureTimes = &self->_resumptionFailureTimes;
  unint64_t count = self->_resumptionFailureTimes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_resumptionFailureTimes->list[a3];
}

- (void)setResumptionFailureTimes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)setUpgradeSuccessAndPrimaryCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_upgradeSuccessAndPrimaryCount = a3;
}

- (void)setHasUpgradeSuccessAndPrimaryCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUpgradeSuccessAndPrimaryCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setUpgradeSuccessAndNotNeededCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_upgradeSuccessAndNotNeededCount = a3;
}

- (void)setHasUpgradeSuccessAndNotNeededCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUpgradeSuccessAndNotNeededCount
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setConnectionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBytesSent:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBytesReceived:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClientConnectionCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientConnectionCount = a3;
}

- (void)setHasClientConnectionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientConnectionCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLBConnectionReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLBConnectionReport description](&v3, sel_description), -[AWDLBConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_connectionAttemptCount] forKey:@"connection_attempt_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithInt:self->_connectionSuccessMptcpCount] forKey:@"connection_success_mptcp_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithInt:self->_connectionSuccessTcpCount] forKey:@"connection_success_tcp_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithInt:self->_connectionFailureCount] forKey:@"connection_failure_count"];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_connectionCellularFallbackCount] forKey:@"connection_cellular_fallback_count"];
LABEL_8:
  [v3 setObject:PBRepeatedInt64NSArray() forKey:@"connection_ready_times"];
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_suspensionCount] forKey:@"suspension_count"];
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x800) == 0)
    {
LABEL_10:
      if ((v5 & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_resumptionSuccessCount] forKey:@"resumption_success_count"];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_resumptionFailureCount] forKey:@"resumption_failure_count"];
LABEL_12:
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"resumption_failure_errors"];
  [v3 setObject:PBRepeatedInt64NSArray() forKey:@"resumption_success_times"];
  [v3 setObject:PBRepeatedInt64NSArray() forKey:@"resumption_failure_times"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_upgradeSuccessAndPrimaryCount] forKey:@"upgrade_success_and_primary_count"];
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_14:
      if ((v6 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_14;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_upgradeSuccessAndNotNeededCount] forKey:@"upgrade_success_and_not_needed_count"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_15:
    if ((v6 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithLongLong:self->_connectionDuration] forKey:@"connection_duration"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_33:
    [v3 setObject:[NSNumber numberWithLongLong:self->_bytesReceived] forKey:@"bytes_received"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_18;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithLongLong:self->_bytesSent] forKey:@"bytes_sent"];
  __int16 v6 = (__int16)self->_has;
  if (v6) {
    goto LABEL_33;
  }
LABEL_17:
  if ((v6 & 4) != 0) {
LABEL_18:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_clientConnectionCount] forKey:@"client_connection_count"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  if (self->_connectionReadyTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_connectionReadyTimes.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v5;
      }
      while (v5 < self->_connectionReadyTimes.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x800) == 0)
    {
LABEL_15:
      if ((v6 & 0x400) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_resumptionFailureErrors.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionFailureErrors.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_resumptionFailureErrors.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_resumptionSuccessTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionSuccessTimes.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v8;
      }
      while (v8 < self->_resumptionSuccessTimes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_resumptionFailureTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionFailureTimes.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v9;
      }
      while (v9 < self->_resumptionFailureTimes.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x2000) == 0)
    {
LABEL_34:
      if ((v10 & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_35:
    if ((v10 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_36:
    if ((v10 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_37:
    if ((v10 & 4) == 0) {
      return;
    }
    goto LABEL_38;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 17) = self->_timestamp;
    *((_WORD *)a3 + 92) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 36) = self->_connectionAttemptCount;
  *((_WORD *)a3 + 92) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 39) = self->_connectionSuccessMptcpCount;
  *((_WORD *)a3 + 92) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
LABEL_40:
    *((_DWORD *)a3 + 38) = self->_connectionFailureCount;
    *((_WORD *)a3 + 92) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_39:
  *((_DWORD *)a3 + 40) = self->_connectionSuccessTcpCount;
  *((_WORD *)a3 + 92) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_40;
  }
LABEL_6:
  if ((has & 0x40) != 0)
  {
LABEL_7:
    *((_DWORD *)a3 + 37) = self->_connectionCellularFallbackCount;
    *((_WORD *)a3 + 92) |= 0x40u;
  }
LABEL_8:
  if ([(AWDLBConnectionReport *)self connectionReadyTimesCount])
  {
    [a3 clearConnectionReadyTimes];
    unint64_t v6 = [(AWDLBConnectionReport *)self connectionReadyTimesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addConnectionReadyTimes:-[AWDLBConnectionReport connectionReadyTimesAtIndex:](self, "connectionReadyTimesAtIndex:", i)];
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x1000) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_14;
    }
LABEL_43:
    *((_DWORD *)a3 + 42) = self->_resumptionSuccessCount;
    *((_WORD *)a3 + 92) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 43) = self->_suspensionCount;
  *((_WORD *)a3 + 92) |= 0x1000u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0) {
    goto LABEL_43;
  }
LABEL_14:
  if ((v9 & 0x400) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 41) = self->_resumptionFailureCount;
    *((_WORD *)a3 + 92) |= 0x400u;
  }
LABEL_16:
  if ([(AWDLBConnectionReport *)self resumptionFailureErrorsCount])
  {
    [a3 clearResumptionFailureErrors];
    unint64_t v10 = [(AWDLBConnectionReport *)self resumptionFailureErrorsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addResumptionFailureErrors:-[AWDLBConnectionReport resumptionFailureErrorsAtIndex:](self, "resumptionFailureErrorsAtIndex:", j)];
    }
  }
  if ([(AWDLBConnectionReport *)self resumptionSuccessTimesCount])
  {
    [a3 clearResumptionSuccessTimes];
    unint64_t v13 = [(AWDLBConnectionReport *)self resumptionSuccessTimesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addResumptionSuccessTimes:-[AWDLBConnectionReport resumptionSuccessTimesAtIndex:](self, "resumptionSuccessTimesAtIndex:", k)];
    }
  }
  if ([(AWDLBConnectionReport *)self resumptionFailureTimesCount])
  {
    [a3 clearResumptionFailureTimes];
    unint64_t v16 = [(AWDLBConnectionReport *)self resumptionFailureTimesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addResumptionFailureTimes:-[AWDLBConnectionReport resumptionFailureTimesAtIndex:](self, "resumptionFailureTimesAtIndex:", m)];
    }
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x4000) != 0)
  {
    *((_DWORD *)a3 + 45) = self->_upgradeSuccessAndPrimaryCount;
    *((_WORD *)a3 + 92) |= 0x4000u;
    __int16 v19 = (__int16)self->_has;
    if ((v19 & 0x2000) == 0)
    {
LABEL_30:
      if ((v19 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_30;
  }
  *((_DWORD *)a3 + 44) = self->_upgradeSuccessAndNotNeededCount;
  *((_WORD *)a3 + 92) |= 0x2000u;
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_31:
    if ((v19 & 2) == 0) {
      goto LABEL_32;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 16) = self->_connectionDuration;
  *((_WORD *)a3 + 92) |= 8u;
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 2) == 0)
  {
LABEL_32:
    if ((v19 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 14) = self->_bytesSent;
  *((_WORD *)a3 + 92) |= 2u;
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 1) == 0)
  {
LABEL_33:
    if ((v19 & 4) == 0) {
      return;
    }
    goto LABEL_34;
  }
LABEL_49:
  *((void *)a3 + 13) = self->_bytesReceived;
  *((_WORD *)a3 + 92) |= 1u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return;
  }
LABEL_34:
  *((void *)a3 + 15) = self->_clientConnectionCount;
  *((_WORD *)a3 + 92) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(void *)(v4 + 136) = self->_timestamp;
    *(_WORD *)(v4 + 184) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 144) = self->_connectionAttemptCount;
  *(_WORD *)(v4 + 184) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v4 + 156) = self->_connectionSuccessMptcpCount;
  *(_WORD *)(v4 + 184) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v4 + 160) = self->_connectionSuccessTcpCount;
  *(_WORD *)(v4 + 184) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  *(_DWORD *)(v4 + 152) = self->_connectionFailureCount;
  *(_WORD *)(v4 + 184) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 148) = self->_connectionCellularFallbackCount;
    *(_WORD *)(v4 + 184) |= 0x40u;
  }
LABEL_8:
  PBRepeatedInt64Copy();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_suspensionCount;
    *(_WORD *)(v5 + 184) |= 0x1000u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_10:
      if ((v7 & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 168) = self->_resumptionSuccessCount;
  *(_WORD *)(v5 + 184) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 164) = self->_resumptionFailureCount;
    *(_WORD *)(v5 + 184) |= 0x400u;
  }
LABEL_12:
  PBRepeatedInt32Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 180) = self->_upgradeSuccessAndPrimaryCount;
    *(_WORD *)(v5 + 184) |= 0x4000u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_14:
      if ((v8 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 176) = self->_upgradeSuccessAndNotNeededCount;
  *(_WORD *)(v5 + 184) |= 0x2000u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_15:
    if ((v8 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v5 + 128) = self->_connectionDuration;
  *(_WORD *)(v5 + 184) |= 8u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_33:
    *(void *)(v5 + 104) = self->_bytesReceived;
    *(_WORD *)(v5 + 184) |= 1u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_18;
  }
LABEL_32:
  *(void *)(v5 + 112) = self->_bytesSent;
  *(_WORD *)(v5 + 184) |= 2u;
  __int16 v8 = (__int16)self->_has;
  if (v8) {
    goto LABEL_33;
  }
LABEL_17:
  if ((v8 & 4) != 0)
  {
LABEL_18:
    *(void *)(v5 + 120) = self->_clientConnectionCount;
    *(_WORD *)(v5 + 184) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 92);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 17)) {
        goto LABEL_80;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_80:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_connectionAttemptCount != *((_DWORD *)a3 + 36)) {
        goto LABEL_80;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_80;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 92) & 0x100) == 0 || self->_connectionSuccessMptcpCount != *((_DWORD *)a3 + 39)) {
        goto LABEL_80;
      }
    }
    else if ((*((_WORD *)a3 + 92) & 0x100) != 0)
    {
      goto LABEL_80;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 92) & 0x200) == 0 || self->_connectionSuccessTcpCount != *((_DWORD *)a3 + 40)) {
        goto LABEL_80;
      }
    }
    else if ((*((_WORD *)a3 + 92) & 0x200) != 0)
    {
      goto LABEL_80;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_connectionFailureCount != *((_DWORD *)a3 + 38)) {
        goto LABEL_80;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_80;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_connectionCellularFallbackCount != *((_DWORD *)a3 + 37)) {
        goto LABEL_80;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_80;
    }
    int IsEqual = PBRepeatedInt64IsEqual();
    if (IsEqual)
    {
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x1000) == 0 || self->_suspensionCount != *((_DWORD *)a3 + 43)) {
          goto LABEL_80;
        }
      }
      else if ((*((_WORD *)a3 + 92) & 0x1000) != 0)
      {
        goto LABEL_80;
      }
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x800) == 0 || self->_resumptionSuccessCount != *((_DWORD *)a3 + 42)) {
          goto LABEL_80;
        }
      }
      else if ((*((_WORD *)a3 + 92) & 0x800) != 0)
      {
        goto LABEL_80;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x400) == 0 || self->_resumptionFailureCount != *((_DWORD *)a3 + 41)) {
          goto LABEL_80;
        }
      }
      else if ((*((_WORD *)a3 + 92) & 0x400) != 0)
      {
        goto LABEL_80;
      }
      int IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedInt64IsEqual();
        if (IsEqual)
        {
          int IsEqual = PBRepeatedInt64IsEqual();
          if (IsEqual)
          {
            __int16 v8 = (__int16)self->_has;
            __int16 v9 = *((_WORD *)a3 + 92);
            if ((v8 & 0x4000) != 0)
            {
              if ((*((_WORD *)a3 + 92) & 0x4000) == 0 || self->_upgradeSuccessAndPrimaryCount != *((_DWORD *)a3 + 45)) {
                goto LABEL_80;
              }
            }
            else if ((*((_WORD *)a3 + 92) & 0x4000) != 0)
            {
              goto LABEL_80;
            }
            if ((*(_WORD *)&self->_has & 0x2000) != 0)
            {
              if ((*((_WORD *)a3 + 92) & 0x2000) == 0 || self->_upgradeSuccessAndNotNeededCount != *((_DWORD *)a3 + 44)) {
                goto LABEL_80;
              }
            }
            else if ((*((_WORD *)a3 + 92) & 0x2000) != 0)
            {
              goto LABEL_80;
            }
            if ((v8 & 8) != 0)
            {
              if ((v9 & 8) == 0 || self->_connectionDuration != *((void *)a3 + 16)) {
                goto LABEL_80;
              }
            }
            else if ((v9 & 8) != 0)
            {
              goto LABEL_80;
            }
            if ((v8 & 2) != 0)
            {
              if ((v9 & 2) == 0 || self->_bytesSent != *((void *)a3 + 14)) {
                goto LABEL_80;
              }
            }
            else if ((v9 & 2) != 0)
            {
              goto LABEL_80;
            }
            if (v8)
            {
              if ((v9 & 1) == 0 || self->_bytesReceived != *((void *)a3 + 13)) {
                goto LABEL_80;
              }
            }
            else if (v9)
            {
              goto LABEL_80;
            }
            LOBYTE(IsEqual) = (v9 & 4) == 0;
            if ((v8 & 4) != 0)
            {
              if ((v9 & 4) == 0 || self->_clientConnectionCount != *((void *)a3 + 15)) {
                goto LABEL_80;
              }
              LOBYTE(IsEqual) = 1;
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    unint64_t v24 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_connectionAttemptCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v24 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v22 = 2654435761 * self->_connectionSuccessMptcpCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v21 = 2654435761 * self->_connectionSuccessTcpCount;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v20 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v21 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v20 = 2654435761 * self->_connectionFailureCount;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_connectionCellularFallbackCount;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v4 = 0;
LABEL_14:
  uint64_t v5 = PBRepeatedInt64Hash();
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    uint64_t v6 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  uint64_t v6 = 2654435761 * self->_suspensionCount;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v7 = 2654435761 * self->_resumptionSuccessCount;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_17:
    uint64_t v8 = 2654435761 * self->_resumptionFailureCount;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
LABEL_21:
  uint64_t v9 = PBRepeatedInt32Hash();
  uint64_t v10 = PBRepeatedInt64Hash();
  uint64_t v11 = PBRepeatedInt64Hash();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x4000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_upgradeSuccessAndPrimaryCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_23:
      uint64_t v14 = 2654435761 * self->_upgradeSuccessAndNotNeededCount;
      if ((v12 & 8) != 0) {
        goto LABEL_24;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 8) != 0)
  {
LABEL_24:
    uint64_t v15 = 2654435761 * self->_connectionDuration;
    if ((v12 & 2) != 0) {
      goto LABEL_25;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_25:
    uint64_t v16 = 2654435761 * self->_bytesSent;
    if (v12) {
      goto LABEL_26;
    }
LABEL_32:
    uint64_t v17 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_27;
    }
LABEL_33:
    uint64_t v18 = 0;
    return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  uint64_t v16 = 0;
  if ((v12 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_26:
  uint64_t v17 = 2654435761 * self->_bytesReceived;
  if ((v12 & 4) == 0) {
    goto LABEL_33;
  }
LABEL_27:
  uint64_t v18 = 2654435761 * self->_clientConnectionCount;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 17);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)a3 + 92);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_connectionAttemptCount = *((_DWORD *)a3 + 36);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_connectionSuccessMptcpCount = *((_DWORD *)a3 + 39);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_connectionSuccessTcpCount = *((_DWORD *)a3 + 40);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_36:
  self->_connectionFailureCount = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 92) & 0x40) != 0)
  {
LABEL_7:
    self->_connectionCellularFallbackCount = *((_DWORD *)a3 + 37);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_8:
  uint64_t v6 = [a3 connectionReadyTimesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDLBConnectionReport addConnectionReadyTimes:](self, "addConnectionReadyTimes:", [a3 connectionReadyTimesAtIndex:i]);
  }
  __int16 v9 = *((_WORD *)a3 + 92);
  if ((v9 & 0x1000) != 0)
  {
    self->_suspensionCount = *((_DWORD *)a3 + 43);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v9 = *((_WORD *)a3 + 92);
    if ((v9 & 0x800) == 0)
    {
LABEL_13:
      if ((v9 & 0x400) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)a3 + 92) & 0x800) == 0)
  {
    goto LABEL_13;
  }
  self->_resumptionSuccessCount = *((_DWORD *)a3 + 42);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 92) & 0x400) != 0)
  {
LABEL_14:
    self->_resumptionFailureCount = *((_DWORD *)a3 + 41);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_15:
  uint64_t v10 = [a3 resumptionFailureErrorsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDLBConnectionReport addResumptionFailureErrors:](self, "addResumptionFailureErrors:", [a3 resumptionFailureErrorsAtIndex:j]);
  }
  uint64_t v13 = [a3 resumptionSuccessTimesCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[AWDLBConnectionReport addResumptionSuccessTimes:](self, "addResumptionSuccessTimes:", [a3 resumptionSuccessTimesAtIndex:k]);
  }
  uint64_t v16 = [a3 resumptionFailureTimesCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t m = 0; m != v17; ++m)
      -[AWDLBConnectionReport addResumptionFailureTimes:](self, "addResumptionFailureTimes:", [a3 resumptionFailureTimesAtIndex:m]);
  }
  __int16 v19 = *((_WORD *)a3 + 92);
  if ((v19 & 0x4000) != 0)
  {
    self->_upgradeSuccessAndPrimaryCount = *((_DWORD *)a3 + 45);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v19 = *((_WORD *)a3 + 92);
    if ((v19 & 0x2000) == 0)
    {
LABEL_26:
      if ((v19 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_43;
    }
  }
  else if ((*((_WORD *)a3 + 92) & 0x2000) == 0)
  {
    goto LABEL_26;
  }
  self->_upgradeSuccessAndNotNeededCount = *((_DWORD *)a3 + 44);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v19 = *((_WORD *)a3 + 92);
  if ((v19 & 8) == 0)
  {
LABEL_27:
    if ((v19 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_connectionDuration = *((void *)a3 + 16);
  *(_WORD *)&self->_has |= 8u;
  __int16 v19 = *((_WORD *)a3 + 92);
  if ((v19 & 2) == 0)
  {
LABEL_28:
    if ((v19 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_bytesSent = *((void *)a3 + 14);
  *(_WORD *)&self->_has |= 2u;
  __int16 v19 = *((_WORD *)a3 + 92);
  if ((v19 & 1) == 0)
  {
LABEL_29:
    if ((v19 & 4) == 0) {
      return;
    }
    goto LABEL_30;
  }
LABEL_45:
  self->_bytesReceived = *((void *)a3 + 13);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 92) & 4) == 0) {
    return;
  }
LABEL_30:
  self->_clientConnectionCount = *((void *)a3 + 15);
  *(_WORD *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)connectionAttemptCount
{
  return self->_connectionAttemptCount;
}

- (int)connectionSuccessMptcpCount
{
  return self->_connectionSuccessMptcpCount;
}

- (int)connectionSuccessTcpCount
{
  return self->_connectionSuccessTcpCount;
}

- (int)connectionFailureCount
{
  return self->_connectionFailureCount;
}

- (int)connectionCellularFallbackCount
{
  return self->_connectionCellularFallbackCount;
}

- (int)suspensionCount
{
  return self->_suspensionCount;
}

- (int)resumptionSuccessCount
{
  return self->_resumptionSuccessCount;
}

- (int)resumptionFailureCount
{
  return self->_resumptionFailureCount;
}

- (int)upgradeSuccessAndPrimaryCount
{
  return self->_upgradeSuccessAndPrimaryCount;
}

- (int)upgradeSuccessAndNotNeededCount
{
  return self->_upgradeSuccessAndNotNeededCount;
}

- (int64_t)connectionDuration
{
  return self->_connectionDuration;
}

- (int64_t)bytesSent
{
  return self->_bytesSent;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)clientConnectionCount
{
  return self->_clientConnectionCount;
}

@end