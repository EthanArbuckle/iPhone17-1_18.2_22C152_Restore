@interface ChannelActivityDeactivationResponse
- (BOOL)hasRetryIntervalSeconds;
- (BOOL)hasServerTimestampSeconds;
- (BOOL)hasStatus;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)serverTimestampSeconds;
- (unint64_t)version;
- (unsigned)retryIntervalSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRetryIntervalSeconds:(BOOL)a3;
- (void)setHasServerTimestampSeconds:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRetryIntervalSeconds:(unsigned int)a3;
- (void)setServerTimestampSeconds:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityDeactivationResponse

- (int)status
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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
    char v3 = off_2646E2420[a3];
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

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityDeactivationResponse;
  int v4 = [(ChannelActivityDeactivationResponse *)&v8 description];
  v5 = [(ChannelActivityDeactivationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_2646E2420[status];
    }
    [v3 setObject:v5 forKey:@"status"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_serverTimestampSeconds];
    [v3 setObject:v10 forKey:@"server_timestamp_seconds"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v11 = [NSNumber numberWithUnsignedLongLong:self->_version];
  [v3 setObject:v11 forKey:@"version"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_retryIntervalSeconds];
    [v3 setObject:v8 forKey:@"retry_interval_seconds"];
  }
LABEL_12:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityDeactivationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[7] = self->_status;
    *((unsigned char *)v4 + 40) |= 8u;
  }
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_serverTimestampSeconds;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_version;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    v4[6] = self->_retryIntervalSeconds;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_status;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
  uint64_t v7 = [(NSData *)self->_uuid copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(void *)(v6 + 16) = self->_version;
    *(unsigned char *)(v6 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(void *)(v6 + 8) = self->_serverTimestampSeconds;
  *(unsigned char *)(v6 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_retryIntervalSeconds;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_status != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_serverTimestampSeconds != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_24;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v5 = 2654435761u * self->_serverTimestampSeconds;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_version;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_retryIntervalSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    self->_uint64_t status = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[ChannelActivityDeactivationResponse setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_serverTimestampSeconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_version = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_8:
    self->_retryIntervalSeconds = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_9:
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)serverTimestampSeconds
{
  return self->_serverTimestampSeconds;
}

- (unint64_t)version
{
  return self->_version;
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (void).cxx_destruct
{
}

@end