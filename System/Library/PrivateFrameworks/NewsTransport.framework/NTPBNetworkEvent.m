@interface NTPBNetworkEvent
- (BOOL)hasCacheState;
- (BOOL)hasConnectDuration;
- (BOOL)hasDnsDuration;
- (BOOL)hasErrorCode;
- (BOOL)hasHttpStatusCode;
- (BOOL)hasIsProxyConnection;
- (BOOL)hasRequestDuration;
- (BOOL)hasRequestUUID;
- (BOOL)hasRespondingPOP;
- (BOOL)hasResponseDuration;
- (BOOL)hasResponseSize;
- (BOOL)hasSessionID;
- (BOOL)hasStartTime;
- (BOOL)hasType;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxyConnection;
- (BOOL)readFrom:(id)a3;
- (NSString)requestUUID;
- (NSString)respondingPOP;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cacheState;
- (int)type;
- (int64_t)errorCode;
- (unint64_t)connectDuration;
- (unint64_t)dnsDuration;
- (unint64_t)hash;
- (unint64_t)httpStatusCode;
- (unint64_t)requestDuration;
- (unint64_t)responseDuration;
- (unint64_t)responseSize;
- (unint64_t)sessionID;
- (unint64_t)startTime;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCacheState:(int)a3;
- (void)setConnectDuration:(unint64_t)a3;
- (void)setDnsDuration:(unint64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setHasCacheState:(BOOL)a3;
- (void)setHasConnectDuration:(BOOL)a3;
- (void)setHasDnsDuration:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasHttpStatusCode:(BOOL)a3;
- (void)setHasIsProxyConnection:(BOOL)a3;
- (void)setHasRequestDuration:(BOOL)a3;
- (void)setHasResponseDuration:(BOOL)a3;
- (void)setHasResponseSize:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHttpStatusCode:(unint64_t)a3;
- (void)setIsProxyConnection:(BOOL)a3;
- (void)setRequestDuration:(unint64_t)a3;
- (void)setRequestUUID:(id)a3;
- (void)setRespondingPOP:(id)a3;
- (void)setResponseDuration:(unint64_t)a3;
- (void)setResponseSize:(unint64_t)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNetworkEvent

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setUrl:(id)a3
{
}

- (void)setRespondingPOP:(id)a3
{
}

- (void)setRequestUUID:(id)a3
{
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_type = a3;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_startTime = a3;
}

- (void)setSessionID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sessionID = a3;
}

- (void)setResponseSize:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_responseSize = a3;
}

- (void)setResponseDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_responseDuration = a3;
}

- (void)setRequestDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestDuration = a3;
}

- (void)setHttpStatusCode:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_httpStatusCode = a3;
}

- (void)setConnectDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectDuration = a3;
}

- (void)dealloc
{
  [(NTPBNetworkEvent *)self setUrl:0];
  [(NTPBNetworkEvent *)self setRequestUUID:0];
  [(NTPBNetworkEvent *)self setRespondingPOP:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEvent;
  [(NTPBNetworkEvent *)&v3 dealloc];
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStartTime
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDnsDuration:(unint64_t)a3
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

- (void)setHasConnectDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectDuration
{
  return *(_WORD *)&self->_has & 1;
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

- (void)setCacheState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_cacheState = a3;
}

- (void)setHasCacheState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCacheState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasRequestUUID
{
  return self->_requestUUID != 0;
}

- (BOOL)hasRespondingPOP
{
  return self->_respondingPOP != 0;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSessionID
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsProxyConnection:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isProxyConnection = a3;
}

- (void)setHasIsProxyConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsProxyConnection
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNetworkEvent description](&v3, sel_description), -[NTPBNetworkEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_startTime), @"start_time");
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_dnsDuration), @"dns_duration");
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_connectDuration), @"connect_duration");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_requestDuration), @"request_duration");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_responseDuration), @"response_duration");
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_responseSize), @"response_size");
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_cacheState), @"cache_state");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_httpStatusCode), @"http_status_code");
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_errorCode), @"error_code");
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_11:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_type), @"type");
LABEL_12:
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  requestUUID = self->_requestUUID;
  if (requestUUID) {
    [v3 setObject:requestUUID forKey:@"request_UUID"];
  }
  respondingPOP = self->_respondingPOP;
  if (respondingPOP) {
    [v3 setObject:respondingPOP forKey:@"responding_POP"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_sessionID), @"session_ID");
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x800) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isProxyConnection), @"is_proxy_connection");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_respondingPOP) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(void *)(v5 + 72) = self->_startTime;
    *(_WORD *)(v5 + 124) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_dnsDuration;
  *(_WORD *)(v5 + 124) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(void *)(v5 + 8) = self->_connectDuration;
  *(_WORD *)(v5 + 124) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(void *)(v5 + 40) = self->_requestDuration;
  *(_WORD *)(v5 + 124) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(void *)(v5 + 48) = self->_responseDuration;
  *(_WORD *)(v5 + 124) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 56) = self->_responseSize;
  *(_WORD *)(v5 + 124) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 80) = self->_cacheState;
  *(_WORD *)(v5 + 124) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(void *)(v5 + 32) = self->_httpStatusCode;
  *(_WORD *)(v5 + 124) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  *(void *)(v5 + 24) = self->_errorCode;
  *(_WORD *)(v5 + 124) |= 4u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 104) = self->_type;
    *(_WORD *)(v5 + 124) |= 0x400u;
  }
LABEL_12:

  *(void *)(v6 + 112) = [(NSString *)self->_url copyWithZone:a3];
  *(void *)(v6 + 88) = [(NSString *)self->_requestUUID copyWithZone:a3];

  *(void *)(v6 + 96) = [(NSString *)self->_respondingPOP copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x80) != 0)
  {
    *(void *)(v6 + 64) = self->_sessionID;
    *(_WORD *)(v6 + 124) |= 0x80u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 120) = self->_isProxyConnection;
    *(_WORD *)(v6 + 124) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 62);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x100) == 0 || self->_startTime != *((void *)a3 + 9)) {
        goto LABEL_65;
      }
    }
    else if ((*((_WORD *)a3 + 62) & 0x100) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_dnsDuration != *((void *)a3 + 2)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_65;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_connectDuration != *((void *)a3 + 1)) {
        goto LABEL_65;
      }
    }
    else if (v7)
    {
      goto LABEL_65;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_requestDuration != *((void *)a3 + 5)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_responseDuration != *((void *)a3 + 6)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_responseSize != *((void *)a3 + 7)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x200) == 0 || self->_cacheState != *((_DWORD *)a3 + 20)) {
        goto LABEL_65;
      }
    }
    else if ((*((_WORD *)a3 + 62) & 0x200) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_httpStatusCode != *((void *)a3 + 4)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_65;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_errorCode != *((void *)a3 + 3)) {
        goto LABEL_65;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_65;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x400) == 0 || self->_type != *((_DWORD *)a3 + 26)) {
        goto LABEL_65;
      }
    }
    else if ((*((_WORD *)a3 + 62) & 0x400) != 0)
    {
      goto LABEL_65;
    }
    url = self->_url;
    if (!((unint64_t)url | *((void *)a3 + 14)) || (int v5 = -[NSString isEqual:](url, "isEqual:")) != 0)
    {
      requestUUID = self->_requestUUID;
      if (!((unint64_t)requestUUID | *((void *)a3 + 11))
        || (int v5 = -[NSString isEqual:](requestUUID, "isEqual:")) != 0)
      {
        respondingPOP = self->_respondingPOP;
        if (!((unint64_t)respondingPOP | *((void *)a3 + 12))
          || (int v5 = -[NSString isEqual:](respondingPOP, "isEqual:")) != 0)
        {
          __int16 v11 = *((_WORD *)a3 + 62);
          if ((*(_WORD *)&self->_has & 0x80) != 0)
          {
            if ((v11 & 0x80) == 0 || self->_sessionID != *((void *)a3 + 8)) {
              goto LABEL_65;
            }
          }
          else if ((v11 & 0x80) != 0)
          {
            goto LABEL_65;
          }
          LOBYTE(v5) = (v11 & 0x800) == 0;
          if ((*(_WORD *)&self->_has & 0x800) != 0)
          {
            if ((*((_WORD *)a3 + 62) & 0x800) == 0)
            {
LABEL_65:
              LOBYTE(v5) = 0;
              return v5;
            }
            if (self->_isProxyConnection)
            {
              if (!*((unsigned char *)a3 + 120)) {
                goto LABEL_65;
              }
            }
            else if (*((unsigned char *)a3 + 120))
            {
              goto LABEL_65;
            }
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    unint64_t v19 = 2654435761u * self->_startTime;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v18 = 2654435761u * self->_dnsDuration;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v19 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v18 = 0;
  if (has)
  {
LABEL_4:
    unint64_t v17 = 2654435761u * self->_connectDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v17 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v16 = 2654435761u * self->_requestDuration;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v16 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    unint64_t v15 = 2654435761u * self->_responseDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v15 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    unint64_t v4 = 2654435761u * self->_responseSize;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_cacheState;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    unint64_t v6 = 2654435761u * self->_httpStatusCode;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v6 = 0;
  if ((has & 4) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v7 = 2654435761 * self->_errorCode;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_type;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
LABEL_22:
  NSUInteger v9 = [(NSString *)self->_url hash];
  NSUInteger v10 = [(NSString *)self->_requestUUID hash];
  NSUInteger v11 = [(NSString *)self->_respondingPOP hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    unint64_t v12 = 2654435761u * self->_sessionID;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v13 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  unint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v13 = 2654435761 * self->_isProxyConnection;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x100) != 0)
  {
    self->_startTime = *((void *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)a3 + 62);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dnsDuration = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_connectDuration = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_requestDuration = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_responseDuration = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_responseSize = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_cacheState = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_httpStatusCode = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 62);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_31:
  self->_errorCode = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 62) & 0x400) != 0)
  {
LABEL_11:
    self->_type = *((_DWORD *)a3 + 26);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_12:
  if (*((void *)a3 + 14)) {
    -[NTPBNetworkEvent setUrl:](self, "setUrl:");
  }
  if (*((void *)a3 + 11)) {
    -[NTPBNetworkEvent setRequestUUID:](self, "setRequestUUID:");
  }
  if (*((void *)a3 + 12)) {
    -[NTPBNetworkEvent setRespondingPOP:](self, "setRespondingPOP:");
  }
  __int16 v6 = *((_WORD *)a3 + 62);
  if ((v6 & 0x80) != 0)
  {
    self->_sessionID = *((void *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v6 = *((_WORD *)a3 + 62);
  }
  if ((v6 & 0x800) != 0)
  {
    self->_isProxyConnection = *((unsigned char *)a3 + 120);
    *(_WORD *)&self->_has |= 0x800u;
  }
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)dnsDuration
{
  return self->_dnsDuration;
}

- (unint64_t)connectDuration
{
  return self->_connectDuration;
}

- (unint64_t)requestDuration
{
  return self->_requestDuration;
}

- (unint64_t)responseDuration
{
  return self->_responseDuration;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (int)cacheState
{
  return self->_cacheState;
}

- (unint64_t)httpStatusCode
{
  return self->_httpStatusCode;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (int)type
{
  return self->_type;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (NSString)respondingPOP
{
  return self->_respondingPOP;
}

- (BOOL)isProxyConnection
{
  return self->_isProxyConnection;
}

@end