@interface AWDLBClientConnectionReport
- (BOOL)hasBytesReceived;
- (BOOL)hasBytesSent;
- (BOOL)hasConnectionDuration;
- (BOOL)hasConnectionJoiningFailure;
- (BOOL)hasConnectionJoiningLbConnectionMigration;
- (BOOL)hasConnectionJoiningLbConnectionState;
- (BOOL)hasConnectionServiceId;
- (BOOL)hasDataPathResult;
- (BOOL)hasTimeToConnectionFailure;
- (BOOL)hasTimeToFirstResponse;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)connectionJoiningFailure;
- (int)connectionJoiningLbConnectionMigration;
- (int)connectionJoiningLbConnectionState;
- (int)dataPathResult;
- (int64_t)bytesReceived;
- (int64_t)bytesSent;
- (int64_t)connectionDuration;
- (int64_t)timeToConnectionFailure;
- (int64_t)timeToFirstResponse;
- (unint64_t)connectionServiceId;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setBytesSent:(int64_t)a3;
- (void)setConnectionDuration:(int64_t)a3;
- (void)setConnectionJoiningFailure:(int)a3;
- (void)setConnectionJoiningLbConnectionMigration:(int)a3;
- (void)setConnectionJoiningLbConnectionState:(int)a3;
- (void)setConnectionServiceId:(unint64_t)a3;
- (void)setDataPathResult:(int)a3;
- (void)setHasBytesReceived:(BOOL)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasConnectionDuration:(BOOL)a3;
- (void)setHasConnectionJoiningFailure:(BOOL)a3;
- (void)setHasConnectionJoiningLbConnectionMigration:(BOOL)a3;
- (void)setHasConnectionJoiningLbConnectionState:(BOOL)a3;
- (void)setHasConnectionServiceId:(BOOL)a3;
- (void)setHasDataPathResult:(BOOL)a3;
- (void)setHasTimeToConnectionFailure:(BOOL)a3;
- (void)setHasTimeToFirstResponse:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimeToConnectionFailure:(int64_t)a3;
- (void)setTimeToFirstResponse:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLBClientConnectionReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setConnectionJoiningFailure:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_connectionJoiningFailure = a3;
}

- (void)setHasConnectionJoiningFailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasConnectionJoiningFailure
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setConnectionJoiningLbConnectionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_connectionJoiningLbConnectionState = a3;
}

- (void)setHasConnectionJoiningLbConnectionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasConnectionJoiningLbConnectionState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionJoiningLbConnectionMigration:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_connectionJoiningLbConnectionMigration = a3;
}

- (void)setHasConnectionJoiningLbConnectionMigration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasConnectionJoiningLbConnectionMigration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConnectionServiceId:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionServiceId = a3;
}

- (void)setHasConnectionServiceId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionServiceId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectionDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDataPathResult:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_dataPathResult = a3;
}

- (void)setHasDataPathResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasDataPathResult
{
  return (*(_WORD *)&self->_has >> 10) & 1;
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

- (void)setTimeToFirstResponse:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeToFirstResponse = a3;
}

- (void)setHasTimeToFirstResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeToFirstResponse
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeToConnectionFailure:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timeToConnectionFailure = a3;
}

- (void)setHasTimeToConnectionFailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimeToConnectionFailure
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLBClientConnectionReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLBClientConnectionReport description](&v3, sel_description), -[AWDLBClientConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_connectionJoiningFailure] forKey:@"connection_joining_failure"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithInt:self->_connectionJoiningLbConnectionState] forKey:@"connection_joining_lb_connection_state"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithInt:self->_connectionJoiningLbConnectionMigration] forKey:@"connection_joining_lb_connection_migration"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionServiceId] forKey:@"connection_service_id"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithLongLong:self->_connectionDuration] forKey:@"connection_duration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithInt:self->_dataPathResult] forKey:@"data_path_result"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithLongLong:self->_bytesSent] forKey:@"bytes_sent"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    [v3 setObject:[NSNumber numberWithLongLong:self->_timeToFirstResponse] forKey:@"time_to_first_response"];
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithLongLong:self->_bytesReceived] forKey:@"bytes_received"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((has & 0x10) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_timeToConnectionFailure] forKey:@"time_to_connection_failure"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBClientConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    PBDataWriterWriteInt64Field();
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((_WORD *)a3 + 40) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = self->_connectionJoiningFailure;
  *((_WORD *)a3 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 18) = self->_connectionJoiningLbConnectionState;
  *((_WORD *)a3 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 17) = self->_connectionJoiningLbConnectionMigration;
  *((_WORD *)a3 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 4) = self->_connectionServiceId;
  *((_WORD *)a3 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 3) = self->_connectionDuration;
  *((_WORD *)a3 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 19) = self->_dataPathResult;
  *((_WORD *)a3 + 40) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 2) = self->_bytesSent;
  *((_WORD *)a3 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 1) = self->_bytesReceived;
  *((_WORD *)a3 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_23:
    *((void *)a3 + 5) = self->_timeToConnectionFailure;
    *((_WORD *)a3 + 40) |= 0x10u;
    return;
  }
LABEL_22:
  *((void *)a3 + 6) = self->_timeToFirstResponse;
  *((_WORD *)a3 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    goto LABEL_23;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((void *)result + 7) = self->_timestamp;
    *((_WORD *)result + 40) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_connectionJoiningFailure;
  *((_WORD *)result + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 18) = self->_connectionJoiningLbConnectionState;
  *((_WORD *)result + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 17) = self->_connectionJoiningLbConnectionMigration;
  *((_WORD *)result + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 4) = self->_connectionServiceId;
  *((_WORD *)result + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 3) = self->_connectionDuration;
  *((_WORD *)result + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 19) = self->_dataPathResult;
  *((_WORD *)result + 40) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 2) = self->_bytesSent;
  *((_WORD *)result + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 1) = self->_bytesReceived;
  *((_WORD *)result + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((void *)result + 6) = self->_timeToFirstResponse;
  *((_WORD *)result + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_12:
  *((void *)result + 5) = self->_timeToConnectionFailure;
  *((_WORD *)result + 40) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 40);
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_timestamp != *((void *)a3 + 7)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_connectionJoiningFailure != *((_DWORD *)a3 + 16)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x200) == 0 || self->_connectionJoiningLbConnectionState != *((_DWORD *)a3 + 18)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 40) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x100) == 0 || self->_connectionJoiningLbConnectionMigration != *((_DWORD *)a3 + 17)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_connectionServiceId != *((void *)a3 + 4)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connectionDuration != *((void *)a3 + 3)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 40) & 0x400) == 0 || self->_dataPathResult != *((_DWORD *)a3 + 19)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_bytesSent != *((void *)a3 + 2)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_bytesReceived != *((void *)a3 + 1)) {
        goto LABEL_56;
      }
    }
    else if (v7)
    {
      goto LABEL_56;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_timeToFirstResponse != *((void *)a3 + 6)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 0x10) == 0;
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timeToConnectionFailure != *((void *)a3 + 5)) {
        goto LABEL_56;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_connectionJoiningFailure;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_connectionJoiningLbConnectionState;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_connectionJoiningLbConnectionMigration;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_connectionServiceId;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_connectionDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_dataPathResult;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_bytesSent;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if (has)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_bytesReceived;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_timeToFirstResponse;
  if ((has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_timeToConnectionFailure;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x40) != 0)
  {
    self->_timestamp = *((void *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v3 = *((_WORD *)a3 + 40);
    if ((v3 & 0x80) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_connectionJoiningFailure = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_connectionJoiningLbConnectionState = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_connectionJoiningLbConnectionMigration = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_connectionServiceId = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_connectionDuration = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x400) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_dataPathResult = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_bytesSent = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_bytesReceived = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_11:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_23:
    self->_timeToConnectionFailure = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    return;
  }
LABEL_22:
  self->_timeToFirstResponse = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 40) & 0x10) != 0) {
    goto LABEL_23;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)connectionJoiningFailure
{
  return self->_connectionJoiningFailure;
}

- (int)connectionJoiningLbConnectionState
{
  return self->_connectionJoiningLbConnectionState;
}

- (int)connectionJoiningLbConnectionMigration
{
  return self->_connectionJoiningLbConnectionMigration;
}

- (unint64_t)connectionServiceId
{
  return self->_connectionServiceId;
}

- (int64_t)connectionDuration
{
  return self->_connectionDuration;
}

- (int)dataPathResult
{
  return self->_dataPathResult;
}

- (int64_t)bytesSent
{
  return self->_bytesSent;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)timeToFirstResponse
{
  return self->_timeToFirstResponse;
}

- (int64_t)timeToConnectionFailure
{
  return self->_timeToConnectionFailure;
}

@end