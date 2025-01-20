@interface SharedChannelPublishResponse
- (BOOL)hasRetryIntervalSeconds;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unsigned)retryIntervalSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRetryIntervalSeconds:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setRetryIntervalSeconds:(unsigned int)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelPublishResponse

- (int)status
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    char v3 = off_2646E1A58[a3];
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

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelPublishResponse;
  int v4 = [(SharedChannelPublishResponse *)&v8 description];
  v5 = [(SharedChannelPublishResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_2646E1A58[status];
    }
    [v3 setObject:v6 forKey:@"status"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_retryIntervalSeconds];
    [v3 setObject:v7 forKey:@"retry_interval_seconds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelPublishResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_status;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_retryIntervalSeconds;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_status;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_retryIntervalSeconds;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_status != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_status;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_retryIntervalSeconds;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t status = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_retryIntervalSeconds = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

@end