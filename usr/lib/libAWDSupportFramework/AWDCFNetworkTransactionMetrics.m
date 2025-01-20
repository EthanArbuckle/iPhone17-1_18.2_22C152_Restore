@interface AWDCFNetworkTransactionMetrics
- (BOOL)apsRelayAttempted;
- (BOOL)apsRelaySucceeded;
- (BOOL)hasApsRelayAttempted;
- (BOOL)hasApsRelaySucceeded;
- (BOOL)hasConnectionUUID;
- (BOOL)hasHttp3Status;
- (BOOL)hasIsRedirected;
- (BOOL)hasNetworkLoadType;
- (BOOL)hasNetworkProtocolName;
- (BOOL)hasRequestEnd;
- (BOOL)hasRequestStart;
- (BOOL)hasResponseEnd;
- (BOOL)hasResponseStart;
- (BOOL)hasReusedConnection;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalBytesExpectedToRead;
- (BOOL)hasTotalBytesExpectedToWrite;
- (BOOL)hasTotalBytesRead;
- (BOOL)hasTotalBytesWritten;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRedirected;
- (BOOL)readFrom:(id)a3;
- (BOOL)reusedConnection;
- (NSString)connectionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)http3StatusAsString:(int)a3;
- (id)networkLoadTypeAsString:(int)a3;
- (id)networkProtocolNameAsString:(int)a3;
- (int)StringAsHttp3Status:(id)a3;
- (int)StringAsNetworkLoadType:(id)a3;
- (int)StringAsNetworkProtocolName:(id)a3;
- (int)http3Status;
- (int)networkLoadType;
- (int)networkProtocolName;
- (unint64_t)hash;
- (unint64_t)requestEnd;
- (unint64_t)requestStart;
- (unint64_t)responseEnd;
- (unint64_t)responseStart;
- (unint64_t)timestamp;
- (unint64_t)totalBytesExpectedToRead;
- (unint64_t)totalBytesExpectedToWrite;
- (unint64_t)totalBytesRead;
- (unint64_t)totalBytesWritten;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApsRelayAttempted:(BOOL)a3;
- (void)setApsRelaySucceeded:(BOOL)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setHasApsRelayAttempted:(BOOL)a3;
- (void)setHasApsRelaySucceeded:(BOOL)a3;
- (void)setHasHttp3Status:(BOOL)a3;
- (void)setHasIsRedirected:(BOOL)a3;
- (void)setHasNetworkLoadType:(BOOL)a3;
- (void)setHasNetworkProtocolName:(BOOL)a3;
- (void)setHasRequestEnd:(BOOL)a3;
- (void)setHasRequestStart:(BOOL)a3;
- (void)setHasResponseEnd:(BOOL)a3;
- (void)setHasResponseStart:(BOOL)a3;
- (void)setHasReusedConnection:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalBytesExpectedToRead:(BOOL)a3;
- (void)setHasTotalBytesExpectedToWrite:(BOOL)a3;
- (void)setHasTotalBytesRead:(BOOL)a3;
- (void)setHasTotalBytesWritten:(BOOL)a3;
- (void)setHttp3Status:(int)a3;
- (void)setIsRedirected:(BOOL)a3;
- (void)setNetworkLoadType:(int)a3;
- (void)setNetworkProtocolName:(int)a3;
- (void)setRequestEnd:(unint64_t)a3;
- (void)setRequestStart:(unint64_t)a3;
- (void)setResponseEnd:(unint64_t)a3;
- (void)setResponseStart:(unint64_t)a3;
- (void)setReusedConnection:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalBytesExpectedToRead:(unint64_t)a3;
- (void)setTotalBytesExpectedToWrite:(unint64_t)a3;
- (void)setTotalBytesRead:(unint64_t)a3;
- (void)setTotalBytesWritten:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCFNetworkTransactionMetrics

- (void)dealloc
{
  [(AWDCFNetworkTransactionMetrics *)self setConnectionUUID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTransactionMetrics;
  [(AWDCFNetworkTransactionMetrics *)&v3 dealloc];
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

- (int)networkProtocolName
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_networkProtocolName;
  }
  else {
    return 1;
  }
}

- (void)setNetworkProtocolName:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_networkProtocolName = a3;
}

- (void)setHasNetworkProtocolName:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasNetworkProtocolName
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)networkProtocolNameAsString:(int)a3
{
  if ((a3 - 1) >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9568[a3 - 1];
  }
}

- (int)StringAsNetworkProtocolName:(id)a3
{
  if ([a3 isEqualToString:@"UNKNOWN_PROTOCOL_NAME"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"HTTP_1_0"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"HTTP_1_1"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"HTTP_2"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"HTTP_3"]) {
    return 5;
  }
  return 1;
}

- (int)networkLoadType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_networkLoadType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkLoadType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_networkLoadType = a3;
}

- (void)setHasNetworkLoadType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNetworkLoadType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)networkLoadTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9590[a3];
  }
}

- (int)StringAsNetworkLoadType:(id)a3
{
  if ([a3 isEqualToString:@"NSURLSessionTaskMetricsResourceFetchTypeUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NSURLSessionTaskMetricsResourceFetchTypeServerPush"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NSURLSessionTaskMetricsResourceFetchTypeLocalCache"]) {
    return 3;
  }
  return 0;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasReusedConnection
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setIsRedirected:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isRedirected = a3;
}

- (void)setHasIsRedirected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsRedirected
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setRequestStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRequestEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRequestEnd
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setResponseStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_responseStart = a3;
}

- (void)setHasResponseStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasResponseStart
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_responseEnd = a3;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasResponseEnd
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTotalBytesWritten:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalBytesWritten = a3;
}

- (void)setHasTotalBytesWritten:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalBytesWritten
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTotalBytesRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalBytesRead = a3;
}

- (void)setHasTotalBytesRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalBytesRead
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasConnectionUUID
{
  return self->_connectionUUID != 0;
}

- (void)setApsRelayAttempted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_apsRelayAttempted = a3;
}

- (void)setHasApsRelayAttempted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasApsRelayAttempted
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setApsRelaySucceeded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_apsRelaySucceeded = a3;
}

- (void)setHasApsRelaySucceeded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasApsRelaySucceeded
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTotalBytesExpectedToWrite:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalBytesExpectedToWrite = a3;
}

- (void)setHasTotalBytesExpectedToWrite:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalBytesExpectedToWrite
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalBytesExpectedToRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalBytesExpectedToRead = a3;
}

- (void)setHasTotalBytesExpectedToRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalBytesExpectedToRead
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)http3Status
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_http3Status;
  }
  else {
    return 1;
  }
}

- (void)setHttp3Status:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_http3Status = a3;
}

- (void)setHasHttp3Status:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHttp3Status
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)http3StatusAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B95B0[a3 - 1];
  }
}

- (int)StringAsHttp3Status:(id)a3
{
  if ([a3 isEqualToString:@"NOT_ENABLED"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NO_KNOWLEDGE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"ALT_SVC"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"KNOWN_CAPABLE"]) {
    return 4;
  }
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTransactionMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCFNetworkTransactionMetrics description](&v3, sel_description), -[AWDCFNetworkTransactionMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v7 = self->_networkProtocolName - 1;
  if (v7 >= 5) {
    v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_networkProtocolName];
  }
  else {
    v8 = off_2641B9568[v7];
  }
  [v3 setObject:v8 forKey:@"networkProtocolName"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_32:
  uint64_t networkLoadType = self->_networkLoadType;
  if (networkLoadType >= 4) {
    v12 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_networkLoadType];
  }
  else {
    v12 = off_2641B9590[networkLoadType];
  }
  [v3 setObject:v12 forKey:@"networkLoadType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithBool:self->_reusedConnection] forKey:@"reusedConnection"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithBool:self->_isRedirected] forKey:@"isRedirected"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestStart] forKey:@"requestStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestEnd] forKey:@"requestEnd"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_responseStart] forKey:@"responseStart"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_responseEnd] forKey:@"responseEnd"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalBytesWritten] forKey:@"totalBytesWritten"];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalBytesRead] forKey:@"totalBytesRead"];
LABEL_13:
  connectionUUID = self->_connectionUUID;
  if (connectionUUID) {
    [v3 setObject:connectionUUID forKey:@"connectionUUID"];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_apsRelayAttempted] forKey:@"apsRelayAttempted"];
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_apsRelaySucceeded] forKey:@"apsRelaySucceeded"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
LABEL_27:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalBytesExpectedToRead] forKey:@"totalBytesExpectedToRead"];
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v3;
    }
    goto LABEL_28;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalBytesExpectedToWrite] forKey:@"totalBytesExpectedToWrite"];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0) {
    goto LABEL_27;
  }
LABEL_19:
  if ((v6 & 0x200) == 0) {
    return v3;
  }
LABEL_28:
  unsigned int v9 = self->_http3Status - 1;
  if (v9 >= 4) {
    v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_http3Status];
  }
  else {
    v10 = off_2641B95B0[v9];
  }
  [v3 setObject:v10 forKey:@"http3Status"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkTransactionMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint64Field();
LABEL_13:
  if (self->_connectionUUID) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x2000) == 0)
    {
LABEL_17:
      if ((v5 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0) {
      goto LABEL_19;
    }
LABEL_35:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return;
    }
    goto LABEL_36;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0) {
    goto LABEL_35;
  }
LABEL_19:
  if ((v5 & 0x200) == 0) {
    return;
  }
LABEL_36:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 24) = self->_networkProtocolName;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 23) = self->_networkLoadType;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)a3 + 103) = self->_reusedConnection;
  *((_WORD *)a3 + 52) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)a3 + 102) = self->_isRedirected;
  *((_WORD *)a3 + 52) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 2) = self->_requestStart;
  *((_WORD *)a3 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 1) = self->_requestEnd;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 4) = self->_responseStart;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)a3 + 3) = self->_responseEnd;
  *((_WORD *)a3 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_31:
  *((void *)a3 + 9) = self->_totalBytesWritten;
  *((_WORD *)a3 + 52) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *((void *)a3 + 8) = self->_totalBytesRead;
    *((_WORD *)a3 + 52) |= 0x80u;
  }
LABEL_13:
  if (self->_connectionUUID) {
    [a3 setConnectionUUID:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    *((unsigned char *)a3 + 100) = self->_apsRelayAttempted;
    *((_WORD *)a3 + 52) |= 0x1000u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)a3 + 101) = self->_apsRelaySucceeded;
  *((_WORD *)a3 + 52) |= 0x2000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 7) = self->_totalBytesExpectedToWrite;
  *((_WORD *)a3 + 52) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0) {
      return;
    }
    goto LABEL_20;
  }
LABEL_36:
  *((void *)a3 + 6) = self->_totalBytesExpectedToRead;
  *((_WORD *)a3 + 52) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 22) = self->_http3Status;
  *((_WORD *)a3 + 52) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_networkProtocolName;
  *(_WORD *)(v5 + 104) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 92) = self->_networkLoadType;
  *(_WORD *)(v5 + 104) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(unsigned char *)(v5 + 103) = self->_reusedConnection;
  *(_WORD *)(v5 + 104) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v5 + 102) = self->_isRedirected;
  *(_WORD *)(v5 + 104) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(void *)(v5 + 16) = self->_requestStart;
  *(_WORD *)(v5 + 104) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(void *)(v5 + 8) = self->_requestEnd;
  *(_WORD *)(v5 + 104) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(void *)(v5 + 32) = self->_responseStart;
  *(_WORD *)(v5 + 104) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(void *)(v5 + 24) = self->_responseEnd;
  *(_WORD *)(v5 + 104) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_29:
  *(void *)(v5 + 72) = self->_totalBytesWritten;
  *(_WORD *)(v5 + 104) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *(void *)(v5 + 64) = self->_totalBytesRead;
    *(_WORD *)(v5 + 104) |= 0x80u;
  }
LABEL_13:

  *(void *)(v6 + 80) = [(NSString *)self->_connectionUUID copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0)
  {
    *(unsigned char *)(v6 + 100) = self->_apsRelayAttempted;
    *(_WORD *)(v6 + 104) |= 0x1000u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_15:
      if ((v8 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *(unsigned char *)(v6 + 101) = self->_apsRelaySucceeded;
  *(_WORD *)(v6 + 104) |= 0x2000u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_16:
    if ((v8 & 0x20) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    *(void *)(v6 + 48) = self->_totalBytesExpectedToRead;
    *(_WORD *)(v6 + 104) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return (id)v6;
    }
    goto LABEL_18;
  }
LABEL_33:
  *(void *)(v6 + 56) = self->_totalBytesExpectedToWrite;
  *(_WORD *)(v6 + 104) |= 0x40u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((v8 & 0x200) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 88) = self->_http3Status;
    *(_WORD *)(v6 + 104) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 52);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
      goto LABEL_96;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_networkProtocolName != *((_DWORD *)a3 + 24)) {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_networkLoadType != *((_DWORD *)a3 + 23)) {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x8000) == 0) {
      goto LABEL_96;
    }
    if (self->_reusedConnection)
    {
      if (!*((unsigned char *)a3 + 103)) {
        goto LABEL_96;
      }
    }
    else if (*((unsigned char *)a3 + 103))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x8000) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x4000) == 0) {
      goto LABEL_96;
    }
    if (self->_isRedirected)
    {
      if (!*((unsigned char *)a3 + 102)) {
        goto LABEL_96;
      }
    }
    else if (*((unsigned char *)a3 + 102))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x4000) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_requestStart != *((void *)a3 + 2)) {
      goto LABEL_96;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_96;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_requestEnd != *((void *)a3 + 1)) {
      goto LABEL_96;
    }
  }
  else if (v7)
  {
    goto LABEL_96;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_responseStart != *((void *)a3 + 4)) {
      goto LABEL_96;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_responseEnd != *((void *)a3 + 3)) {
      goto LABEL_96;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_totalBytesWritten != *((void *)a3 + 9)) {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_totalBytesRead != *((void *)a3 + 8)) {
      goto LABEL_96;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_96;
  }
  connectionUUID = self->_connectionUUID;
  if ((unint64_t)connectionUUID | *((void *)a3 + 10))
  {
    int v5 = -[NSString isEqual:](connectionUUID, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 52);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x1000) == 0) {
      goto LABEL_96;
    }
    if (self->_apsRelayAttempted)
    {
      if (!*((unsigned char *)a3 + 100)) {
        goto LABEL_96;
      }
    }
    else if (*((unsigned char *)a3 + 100))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x2000) != 0) {
      goto LABEL_96;
    }
    goto LABEL_82;
  }
  if ((*((_WORD *)a3 + 52) & 0x2000) == 0) {
    goto LABEL_96;
  }
  if (self->_apsRelaySucceeded)
  {
    if (!*((unsigned char *)a3 + 101)) {
      goto LABEL_96;
    }
    goto LABEL_82;
  }
  if (*((unsigned char *)a3 + 101))
  {
LABEL_96:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_82:
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_totalBytesExpectedToWrite != *((void *)a3 + 7)) {
      goto LABEL_96;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_totalBytesExpectedToRead != *((void *)a3 + 6)) {
      goto LABEL_96;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_96;
  }
  LOBYTE(v5) = (v9 & 0x200) == 0;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_http3Status != *((_DWORD *)a3 + 22)) {
      goto LABEL_96;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_networkProtocolName;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_networkLoadType;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_reusedConnection;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isRedirected;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_requestStart;
    if (has) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v9 = 0;
  if (has)
  {
LABEL_8:
    unint64_t v10 = 2654435761u * self->_requestEnd;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    unint64_t v11 = 2654435761u * self->_responseStart;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    unint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v11 = 0;
  if ((has & 4) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  unint64_t v12 = 2654435761u * self->_responseEnd;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    unint64_t v13 = 2654435761u * self->_totalBytesWritten;
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v13 = 0;
LABEL_22:
  unint64_t v25 = v12;
  unint64_t v26 = v13;
  unint64_t v14 = v9;
  if ((has & 0x80) != 0) {
    unint64_t v15 = 2654435761u * self->_totalBytesRead;
  }
  else {
    unint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_connectionUUID hash];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x1000) != 0)
  {
    uint64_t v18 = 2654435761 * self->_apsRelayAttempted;
    unint64_t v19 = v25;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_27:
      uint64_t v20 = 2654435761 * self->_apsRelaySucceeded;
      if ((v17 & 0x40) != 0) {
        goto LABEL_28;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v19 = v25;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v20 = 0;
  if ((v17 & 0x40) != 0)
  {
LABEL_28:
    unint64_t v21 = 2654435761u * self->_totalBytesExpectedToWrite;
    if ((v17 & 0x20) != 0) {
      goto LABEL_29;
    }
LABEL_34:
    unint64_t v22 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_30;
    }
LABEL_35:
    uint64_t v23 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v14 ^ v10 ^ v11 ^ v19 ^ v26 ^ v15 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v16;
  }
LABEL_33:
  unint64_t v21 = 0;
  if ((v17 & 0x20) == 0) {
    goto LABEL_34;
  }
LABEL_29:
  unint64_t v22 = 2654435761u * self->_totalBytesExpectedToRead;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  uint64_t v23 = 2654435761 * self->_http3Status;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v14 ^ v10 ^ v11 ^ v19 ^ v26 ^ v15 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)a3 + 52);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_networkProtocolName = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_uint64_t networkLoadType = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x8000) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_reusedConnection = *((unsigned char *)a3 + 103);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_isRedirected = *((unsigned char *)a3 + 102);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_requestStart = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_requestEnd = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_responseStart = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_responseEnd = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_31:
  self->_totalBytesWritten = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0)
  {
LABEL_12:
    self->_totalBytesRead = *((void *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_13:
  if (*((void *)a3 + 10)) {
    -[AWDCFNetworkTransactionMetrics setConnectionUUID:](self, "setConnectionUUID:");
  }
  __int16 v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x1000) != 0)
  {
    self->_apsRelayAttempted = *((unsigned char *)a3 + 100);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v6 = *((_WORD *)a3 + 52);
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_35;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  self->_apsRelaySucceeded = *((unsigned char *)a3 + 101);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_totalBytesExpectedToWrite = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0) {
      return;
    }
    goto LABEL_20;
  }
LABEL_36:
  self->_totalBytesExpectedToRead = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 52) & 0x200) == 0) {
    return;
  }
LABEL_20:
  self->_http3Status = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x200u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (BOOL)isRedirected
{
  return self->_isRedirected;
}

- (unint64_t)requestStart
{
  return self->_requestStart;
}

- (unint64_t)requestEnd
{
  return self->_requestEnd;
}

- (unint64_t)responseStart
{
  return self->_responseStart;
}

- (unint64_t)responseEnd
{
  return self->_responseEnd;
}

- (unint64_t)totalBytesWritten
{
  return self->_totalBytesWritten;
}

- (unint64_t)totalBytesRead
{
  return self->_totalBytesRead;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (BOOL)apsRelayAttempted
{
  return self->_apsRelayAttempted;
}

- (BOOL)apsRelaySucceeded
{
  return self->_apsRelaySucceeded;
}

- (unint64_t)totalBytesExpectedToWrite
{
  return self->_totalBytesExpectedToWrite;
}

- (unint64_t)totalBytesExpectedToRead
{
  return self->_totalBytesExpectedToRead;
}

@end