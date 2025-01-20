@interface ChannelPublishPayload
- (BOOL)hasAdopter;
- (BOOL)hasChannelIdentity;
- (BOOL)hasPendingPublishHint;
- (BOOL)hasPublishInitiateTimestampMillis;
- (BOOL)hasPublishPayload;
- (BOOL)hasPublishPayloadExpiryTtlMillis;
- (BOOL)hasPushPriority;
- (BOOL)hasRetryCount;
- (BOOL)hasScheduledPublishHint;
- (BOOL)isEqual:(id)a3;
- (BOOL)pendingPublishHint;
- (BOOL)readFrom:(id)a3;
- (BOOL)scheduledPublishHint;
- (ChannelIdentity)channelIdentity;
- (NSData)publishPayload;
- (NSString)adopter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pushPriorityAsString:(int)a3;
- (int)StringAsPushPriority:(id)a3;
- (int)pushPriority;
- (unint64_t)hash;
- (unint64_t)publishInitiateTimestampMillis;
- (unint64_t)publishPayloadExpiryTtlMillis;
- (unsigned)retryCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopter:(id)a3;
- (void)setChannelIdentity:(id)a3;
- (void)setHasPendingPublishHint:(BOOL)a3;
- (void)setHasPublishInitiateTimestampMillis:(BOOL)a3;
- (void)setHasPublishPayloadExpiryTtlMillis:(BOOL)a3;
- (void)setHasPushPriority:(BOOL)a3;
- (void)setHasRetryCount:(BOOL)a3;
- (void)setHasScheduledPublishHint:(BOOL)a3;
- (void)setPendingPublishHint:(BOOL)a3;
- (void)setPublishInitiateTimestampMillis:(unint64_t)a3;
- (void)setPublishPayload:(id)a3;
- (void)setPublishPayloadExpiryTtlMillis:(unint64_t)a3;
- (void)setPushPriority:(int)a3;
- (void)setRetryCount:(unsigned int)a3;
- (void)setScheduledPublishHint:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelPublishPayload

- (void)setPublishInitiateTimestampMillis:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_publishInitiateTimestampMillis = a3;
}

- (void)setHasPublishInitiateTimestampMillis:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublishInitiateTimestampMillis
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (BOOL)hasPublishPayload
{
  return self->_publishPayload != 0;
}

- (void)setPublishPayloadExpiryTtlMillis:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_publishPayloadExpiryTtlMillis = a3;
}

- (void)setHasPublishPayloadExpiryTtlMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPublishPayloadExpiryTtlMillis
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)pushPriority
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_pushPriority;
  }
  else {
    return 0;
  }
}

- (void)setPushPriority:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pushPriority = a3;
}

- (void)setHasPushPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPushPriority
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)pushPriorityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2646E1DD0[a3];
  }
  return v3;
}

- (int)StringAsPushPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPendingPublishHint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_pendingPublishHint = a3;
}

- (void)setHasPendingPublishHint:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPendingPublishHint
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setScheduledPublishHint:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_scheduledPublishHint = a3;
}

- (void)setHasScheduledPublishHint:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScheduledPublishHint
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRetryCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_retryCount = a3;
}

- (void)setHasRetryCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRetryCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelPublishPayload;
  int v4 = [(ChannelPublishPayload *)&v8 description];
  v5 = [(ChannelPublishPayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithUnsignedLongLong:self->_publishInitiateTimestampMillis];
    [v3 setObject:v4 forKey:@"publish_initiate_timestamp_millis"];
  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    v6 = [(ChannelIdentity *)channelIdentity dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"channel_identity"];
  }
  publishPayload = self->_publishPayload;
  if (publishPayload) {
    [v3 setObject:publishPayload forKey:@"publish_payload"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithUnsignedLongLong:self->_publishPayloadExpiryTtlMillis];
    [v3 setObject:v12 forKey:@"publish_payload_expiry_ttl_millis"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  uint64_t pushPriority = self->_pushPriority;
  if (pushPriority >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pushPriority);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_2646E1DD0[pushPriority];
  }
  [v3 setObject:v14 forKey:@"push_priority"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  v15 = [NSNumber numberWithBool:self->_pendingPublishHint];
  [v3 setObject:v15 forKey:@"pending_publish_hint"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  v16 = [NSNumber numberWithBool:self->_scheduledPublishHint];
  [v3 setObject:v16 forKey:@"scheduled_publish_hint"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    v9 = [NSNumber numberWithUnsignedInt:self->_retryCount];
    [v3 setObject:v9 forKey:@"retry_count"];
  }
LABEL_13:
  adopter = self->_adopter;
  if (adopter) {
    [v3 setObject:adopter forKey:@"adopter"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelPublishPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_channelIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_publishPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_adopter)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_publishInitiateTimestampMillis;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  id v6 = v4;
  if (self->_channelIdentity)
  {
    objc_msgSend(v4, "setChannelIdentity:");
    id v4 = v6;
  }
  if (self->_publishPayload)
  {
    objc_msgSend(v6, "setPublishPayload:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_publishPayloadExpiryTtlMillis;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 12) = self->_pushPriority;
  *((unsigned char *)v4 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 56) = self->_pendingPublishHint;
  *((unsigned char *)v4 + 60) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  *((unsigned char *)v4 + 57) = self->_scheduledPublishHint;
  *((unsigned char *)v4 + 60) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 13) = self->_retryCount;
    *((unsigned char *)v4 + 60) |= 8u;
  }
LABEL_13:
  if (self->_adopter)
  {
    objc_msgSend(v6, "setAdopter:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_publishInitiateTimestampMillis;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  id v7 = [(ChannelIdentity *)self->_channelIdentity copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSData *)self->_publishPayload copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_publishPayloadExpiryTtlMillis;
    *(unsigned char *)(v6 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 48) = self->_pushPriority;
  *(unsigned char *)(v6 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(unsigned char *)(v6 + 57) = self->_scheduledPublishHint;
    *(unsigned char *)(v6 + 60) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(unsigned char *)(v6 + 56) = self->_pendingPublishHint;
  *(unsigned char *)(v6 + 60) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 52) = self->_retryCount;
    *(unsigned char *)(v6 + 60) |= 8u;
  }
LABEL_9:
  uint64_t v12 = [(NSString *)self->_adopter copyWithZone:a3];
  v13 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_publishInitiateTimestampMillis != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_44;
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((void *)v4 + 4)
    && !-[ChannelIdentity isEqual:](channelIdentity, "isEqual:"))
  {
    goto LABEL_44;
  }
  publishPayload = self->_publishPayload;
  if ((unint64_t)publishPayload | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](publishPayload, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_publishPayloadExpiryTtlMillis != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_pushPriority != *((_DWORD *)v4 + 12)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0) {
      goto LABEL_44;
    }
    if (self->_pendingPublishHint)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
    {
      if (self->_scheduledPublishHint)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_37;
      }
    }
LABEL_44:
    char v8 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 60) & 0x20) != 0) {
    goto LABEL_44;
  }
LABEL_37:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_retryCount != *((_DWORD *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](adopter, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_publishInitiateTimestampMillis;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(ChannelIdentity *)self->_channelIdentity hash];
  uint64_t v5 = [(NSData *)self->_publishPayload hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v6 = 2654435761u * self->_publishPayloadExpiryTtlMillis;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_pushPriority;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_pendingPublishHint;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_adopter hash];
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_scheduledPublishHint;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_retryCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_adopter hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_publishInitiateTimestampMillis = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  channelIdentity = self->_channelIdentity;
  uint64_t v7 = v5[4];
  uint64_t v9 = v5;
  if (channelIdentity)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ChannelPublishPayload setChannelIdentity:](self, "setChannelIdentity:");
  }
  uint64_t v5 = v9;
LABEL_9:
  if (v5[5])
  {
    -[ChannelPublishPayload setPublishPayload:](self, "setPublishPayload:");
    uint64_t v5 = v9;
  }
  char v8 = *((unsigned char *)v5 + 60);
  if ((v8 & 2) != 0)
  {
    self->_publishPayloadExpiryTtlMillis = v5[2];
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v5 + 60);
    if ((v8 & 4) == 0)
    {
LABEL_13:
      if ((v8 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v5 + 60) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_uint64_t pushPriority = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_has |= 4u;
  char v8 = *((unsigned char *)v5 + 60);
  if ((v8 & 0x10) == 0)
  {
LABEL_14:
    if ((v8 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_pendingPublishHint = *((unsigned char *)v5 + 56);
  *(unsigned char *)&self->_has |= 0x10u;
  char v8 = *((unsigned char *)v5 + 60);
  if ((v8 & 0x20) == 0)
  {
LABEL_15:
    if ((v8 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_25:
  self->_scheduledPublishHint = *((unsigned char *)v5 + 57);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v5 + 60) & 8) != 0)
  {
LABEL_16:
    self->_retryCount = *((_DWORD *)v5 + 13);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_17:
  if (v5[3]) {
    -[ChannelPublishPayload setAdopter:](self, "setAdopter:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)publishInitiateTimestampMillis
{
  return self->_publishInitiateTimestampMillis;
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
}

- (NSData)publishPayload
{
  return self->_publishPayload;
}

- (void)setPublishPayload:(id)a3
{
}

- (unint64_t)publishPayloadExpiryTtlMillis
{
  return self->_publishPayloadExpiryTtlMillis;
}

- (BOOL)pendingPublishHint
{
  return self->_pendingPublishHint;
}

- (BOOL)scheduledPublishHint
{
  return self->_scheduledPublishHint;
}

- (unsigned)retryCount
{
  return self->_retryCount;
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishPayload, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end