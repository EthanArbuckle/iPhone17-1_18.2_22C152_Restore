@interface NTPBTelemetryNetworkEvent
- (BOOL)hasCacheState;
- (BOOL)hasConnectDuration;
- (BOOL)hasDnsDuration;
- (BOOL)hasErrorCode;
- (BOOL)hasHttpStatusCode;
- (BOOL)hasRequestDuration;
- (BOOL)hasResponseDuration;
- (BOOL)hasResponseSize;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cacheState;
- (int64_t)connectDuration;
- (int64_t)dnsDuration;
- (int64_t)errorCode;
- (int64_t)httpStatusCode;
- (int64_t)requestDuration;
- (int64_t)responseDuration;
- (int64_t)responseSize;
- (int64_t)startTime;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setCacheState:(int)a3;
- (void)setConnectDuration:(int64_t)a3;
- (void)setDnsDuration:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setHasCacheState:(BOOL)a3;
- (void)setHasConnectDuration:(BOOL)a3;
- (void)setHasDnsDuration:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasHttpStatusCode:(BOOL)a3;
- (void)setHasRequestDuration:(BOOL)a3;
- (void)setHasResponseDuration:(BOOL)a3;
- (void)setHasResponseSize:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHttpStatusCode:(int64_t)a3;
- (void)setRequestDuration:(int64_t)a3;
- (void)setResponseDuration:(int64_t)a3;
- (void)setResponseSize:(int64_t)a3;
- (void)setStartTime:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTelemetryNetworkEvent

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDnsDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dnsDuration = a3;
}

- (void)setHasDnsDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDnsDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setConnectDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRequestDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestDuration = a3;
}

- (void)setHasRequestDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setResponseDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_responseDuration = a3;
}

- (void)setHasResponseDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResponseDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResponseSize:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_responseSize = a3;
}

- (void)setHasResponseSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResponseSize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)cacheState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_cacheState;
  }
  else {
    return 0;
  }
}

- (void)setCacheState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_cacheState = a3;
}

- (void)setHasCacheState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCacheState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHttpStatusCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_httpStatusCode = a3;
}

- (void)setHasHttpStatusCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHttpStatusCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTelemetryNetworkEvent;
  v4 = [(NTPBTelemetryNetworkEvent *)&v8 description];
  v5 = [(NTPBTelemetryNetworkEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_startTime];
    [v3 setObject:v7 forKey:@"start_time"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_dnsDuration];
  [v3 setObject:v8 forKey:@"dns_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithLongLong:self->_connectDuration];
  [v3 setObject:v9 forKey:@"connect_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithLongLong:self->_requestDuration];
  [v3 setObject:v10 forKey:@"request_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithLongLong:self->_responseDuration];
  [v3 setObject:v11 forKey:@"response_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithLongLong:self->_responseSize];
  [v3 setObject:v12 forKey:@"response_size"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithInt:self->_cacheState];
  [v3 setObject:v13 forKey:@"cache_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithLongLong:self->_httpStatusCode];
  [v3 setObject:v14 forKey:@"http_status_code"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithLongLong:self->_errorCode];
    [v3 setObject:v5 forKey:@"error_code"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryNetworkEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt64Field();
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((void *)result + 8) = self->_startTime;
    *((_WORD *)result + 38) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_dnsDuration;
  *((_WORD *)result + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 1) = self->_connectDuration;
  *((_WORD *)result + 38) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 5) = self->_requestDuration;
  *((_WORD *)result + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 6) = self->_responseDuration;
  *((_WORD *)result + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 7) = self->_responseSize;
  *((_WORD *)result + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 18) = self->_cacheState;
  *((_WORD *)result + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 4) = self->_httpStatusCode;
  *((_WORD *)result + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 3) = self->_errorCode;
  *((_WORD *)result + 38) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_startTime != *((void *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
LABEL_47:
    BOOL v7 = 0;
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dnsDuration != *((void *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_connectDuration != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (v6)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_requestDuration != *((void *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_responseDuration != *((void *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_responseSize != *((void *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_cacheState != *((_DWORD *)v4 + 18)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_httpStatusCode != *((void *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_errorCode != *((void *)v4 + 3)) {
      goto LABEL_47;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 4) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    uint64_t v3 = 2654435761 * self->_startTime;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dnsDuration;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if (has)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_connectDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_requestDuration;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_responseDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_responseSize;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_cacheState;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 8) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_httpStatusCode;
  if ((has & 4) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_errorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x80) != 0)
  {
    self->_startTime = *((void *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 38);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dnsDuration = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_connectDuration = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_requestDuration = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_responseDuration = *((void *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_responseSize = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_cacheState = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_httpStatusCode = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 38) & 4) != 0)
  {
LABEL_10:
    self->_errorCode = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_11:
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)dnsDuration
{
  return self->_dnsDuration;
}

- (int64_t)connectDuration
{
  return self->_connectDuration;
}

- (int64_t)requestDuration
{
  return self->_requestDuration;
}

- (int64_t)responseDuration
{
  return self->_responseDuration;
}

- (int64_t)responseSize
{
  return self->_responseSize;
}

- (int64_t)httpStatusCode
{
  return self->_httpStatusCode;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end