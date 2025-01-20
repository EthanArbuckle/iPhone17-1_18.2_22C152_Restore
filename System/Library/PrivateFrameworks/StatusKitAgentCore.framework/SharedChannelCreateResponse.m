@interface SharedChannelCreateResponse
- (BOOL)hasChannelIdentity;
- (BOOL)hasRetryIntervalSeconds;
- (BOOL)hasServerTimestampSeconds;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelIdentity)channelIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)serverTimestampSeconds;
- (unsigned)retryIntervalSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelIdentity:(id)a3;
- (void)setHasRetryIntervalSeconds:(BOOL)a3;
- (void)setHasServerTimestampSeconds:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setRetryIntervalSeconds:(unsigned int)a3;
- (void)setServerTimestampSeconds:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelCreateResponse

- (int)status
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2646E1C08[a3];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTH_EXPIRED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTH_FAILED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BAD_REQUEST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CHANNEL_IDENTITY_VALIDATION_FAILED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INTERNAL_ERROR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STALE_PUBLISH_REJECTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RATE_LIMITED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"INVALID_NONCE"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerTimestampSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_serverTimestampSeconds = a3;
}

- (void)setHasServerTimestampSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServerTimestampSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelCreateResponse;
  int v4 = [(SharedChannelCreateResponse *)&v8 description];
  v5 = [(SharedChannelCreateResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_2646E1C08[status];
    }
    [v3 setObject:v5 forKey:@"status"];
  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    v7 = [(ChannelIdentity *)channelIdentity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"channel_identity"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_retryIntervalSeconds];
    [v3 setObject:v9 forKey:@"retry_interval_seconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_serverTimestampSeconds];
    [v3 setObject:v10 forKey:@"server_timestamp_seconds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelCreateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_channelIdentity) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[7] = self->_status;
    *((unsigned char *)v4 + 32) |= 4u;
  }
  if (self->_channelIdentity)
  {
    v6 = v4;
    objc_msgSend(v4, "setChannelIdentity:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_retryIntervalSeconds;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_serverTimestampSeconds;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  id v7 = [(ChannelIdentity *)self->_channelIdentity copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_retryIntervalSeconds;
    *(unsigned char *)(v6 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_serverTimestampSeconds;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_status != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((void *)v4 + 2))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_serverTimestampSeconds != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ChannelIdentity *)self->_channelIdentity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_retryIntervalSeconds;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_serverTimestampSeconds;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[8] & 4) != 0)
  {
    self->_uint64_t status = v4[7];
    *(unsigned char *)&self->_has |= 4u;
  }
  channelIdentity = self->_channelIdentity;
  uint64_t v7 = *((void *)v5 + 2);
  if (channelIdentity)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[SharedChannelCreateResponse setChannelIdentity:](self, "setChannelIdentity:");
  }
  uint64_t v5 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v5 + 32);
  if ((v8 & 2) != 0)
  {
    self->_retryIntervalSeconds = v5[6];
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v5 + 32);
  }
  if (v8)
  {
    self->_serverTimestampSeconds = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (unint64_t)serverTimestampSeconds
{
  return self->_serverTimestampSeconds;
}

- (void).cxx_destruct
{
}

@end