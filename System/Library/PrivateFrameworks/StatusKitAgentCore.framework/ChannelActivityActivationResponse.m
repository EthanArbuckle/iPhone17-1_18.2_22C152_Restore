@interface ChannelActivityActivationResponse
+ (Class)participantPayloadType;
- (BOOL)hasActivationExpirySeconds;
- (BOOL)hasResponseMessageIndex;
- (BOOL)hasRetryIntervalSeconds;
- (BOOL)hasServerTimestampSeconds;
- (BOOL)hasStatus;
- (BOOL)hasTotalResponseMessages;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuid;
- (NSMutableArray)participantPayloads;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantPayloadAtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)activationExpirySeconds;
- (unint64_t)hash;
- (unint64_t)participantPayloadsCount;
- (unint64_t)serverTimestampSeconds;
- (unint64_t)version;
- (unsigned)responseMessageIndex;
- (unsigned)retryIntervalSeconds;
- (unsigned)totalResponseMessages;
- (void)addParticipantPayload:(id)a3;
- (void)clearParticipantPayloads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationExpirySeconds:(unint64_t)a3;
- (void)setHasActivationExpirySeconds:(BOOL)a3;
- (void)setHasResponseMessageIndex:(BOOL)a3;
- (void)setHasRetryIntervalSeconds:(BOOL)a3;
- (void)setHasServerTimestampSeconds:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTotalResponseMessages:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setParticipantPayloads:(id)a3;
- (void)setResponseMessageIndex:(unsigned int)a3;
- (void)setRetryIntervalSeconds:(unsigned int)a3;
- (void)setServerTimestampSeconds:(unint64_t)a3;
- (void)setStatus:(int)a3;
- (void)setTotalResponseMessages:(unsigned int)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityActivationResponse

- (int)status
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
    char v3 = off_2646E2488[a3];
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
  *(unsigned char *)&self->_has |= 2u;
  self->_serverTimestampSeconds = a3;
}

- (void)setHasServerTimestampSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerTimestampSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearParticipantPayloads
{
}

- (void)addParticipantPayload:(id)a3
{
  id v4 = a3;
  participantPayloads = self->_participantPayloads;
  id v8 = v4;
  if (!participantPayloads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_participantPayloads;
    self->_participantPayloads = v6;

    id v4 = v8;
    participantPayloads = self->_participantPayloads;
  }
  [(NSMutableArray *)participantPayloads addObject:v4];
}

- (unint64_t)participantPayloadsCount
{
  return [(NSMutableArray *)self->_participantPayloads count];
}

- (id)participantPayloadAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participantPayloads objectAtIndex:a3];
}

+ (Class)participantPayloadType
{
  return (Class)objc_opt_class();
}

- (void)setResponseMessageIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_responseMessageIndex = a3;
}

- (void)setHasResponseMessageIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResponseMessageIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalResponseMessages:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_totalResponseMessages = a3;
}

- (void)setHasTotalResponseMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTotalResponseMessages
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setActivationExpirySeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activationExpirySeconds = a3;
}

- (void)setHasActivationExpirySeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivationExpirySeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRetryIntervalSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_retryIntervalSeconds = a3;
}

- (void)setHasRetryIntervalSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRetryIntervalSeconds
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityActivationResponse;
  id v4 = [(ChannelActivityActivationResponse *)&v8 description];
  v5 = [(ChannelActivityActivationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_2646E2488[status];
    }
    [v3 setObject:v5 forKey:@"status"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_serverTimestampSeconds];
    [v3 setObject:v8 forKey:@"server_timestamp_seconds"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_version];
    [v3 setObject:v9 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_participantPayloads count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_participantPayloads, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_participantPayloads;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"participant_payload"];
  }
  char v17 = (char)self->_has;
  if ((v17 & 8) != 0)
  {
    v20 = [NSNumber numberWithUnsignedInt:self->_responseMessageIndex];
    [v3 setObject:v20 forKey:@"response_message_index"];

    char v17 = (char)self->_has;
    if ((v17 & 0x40) == 0)
    {
LABEL_23:
      if ((v17 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_23;
  }
  v21 = [NSNumber numberWithUnsignedInt:self->_totalResponseMessages];
  [v3 setObject:v21 forKey:@"total_response_messages"];

  char v17 = (char)self->_has;
  if ((v17 & 1) == 0)
  {
LABEL_24:
    if ((v17 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_31:
  v22 = [NSNumber numberWithUnsignedLongLong:self->_activationExpirySeconds];
  [v3 setObject:v22 forKey:@"activation_expiry_seconds"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_25:
    v18 = [NSNumber numberWithUnsignedInt:self->_retryIntervalSeconds];
    [v3 setObject:v18 forKey:@"retry_interval_seconds"];
  }
LABEL_26:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityActivationResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_participantPayloads;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
    if ((v11 & 0x40) == 0)
    {
LABEL_18:
      if ((v11 & 1) == 0) {
        goto LABEL_19;
      }
LABEL_24:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  char v11 = (char)self->_has;
  if (v11) {
    goto LABEL_24;
  }
LABEL_19:
  if ((v11 & 0x10) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[12] = self->_status;
    *((unsigned char *)v4 + 64) |= 0x20u;
  }
  char v11 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_serverTimestampSeconds;
    *((unsigned char *)v4 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_version;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  if ([(ChannelActivityActivationResponse *)self participantPayloadsCount])
  {
    [v11 clearParticipantPayloads];
    unint64_t v6 = [(ChannelActivityActivationResponse *)self participantPayloadsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ChannelActivityActivationResponse *)self participantPayloadAtIndex:i];
        [v11 addParticipantPayload:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    v11[10] = self->_responseMessageIndex;
    *((unsigned char *)v11 + 64) |= 8u;
    char v10 = (char)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_15;
  }
  v11[13] = self->_totalResponseMessages;
  *((unsigned char *)v11 + 64) |= 0x40u;
  char v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_16:
    if ((v10 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_23:
  *((void *)v11 + 1) = self->_activationExpirySeconds;
  *((unsigned char *)v11 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    v11[11] = self->_retryIntervalSeconds;
    *((unsigned char *)v11 + 64) |= 0x10u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_status;
    *(unsigned char *)(v5 + 64) |= 0x20u;
  }
  uint64_t v7 = [(NSData *)self->_uuid copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_serverTimestampSeconds;
    *(unsigned char *)(v6 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_version;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v10 = self->_participantPayloads;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v6 addParticipantPayload:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_responseMessageIndex;
    *(unsigned char *)(v6 + 64) |= 8u;
    char v16 = (char)self->_has;
    if ((v16 & 0x40) == 0)
    {
LABEL_16:
      if ((v16 & 1) == 0) {
        goto LABEL_17;
      }
LABEL_22:
      *(void *)(v6 + 8) = self->_activationExpirySeconds;
      *(unsigned char *)(v6 + 64) |= 1u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return (id)v6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 52) = self->_totalResponseMessages;
  *(unsigned char *)(v6 + 64) |= 0x40u;
  char v16 = (char)self->_has;
  if (v16) {
    goto LABEL_22;
  }
LABEL_17:
  if ((v16 & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 44) = self->_retryIntervalSeconds;
    *(unsigned char *)(v6 + 64) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_42;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_serverTimestampSeconds != *((void *)v4 + 2)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_version != *((void *)v4 + 3)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_42;
  }
  participantPayloads = self->_participantPayloads;
  if ((unint64_t)participantPayloads | *((void *)v4 + 4))
  {
    if (-[NSMutableArray isEqual:](participantPayloads, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_42:
    BOOL v8 = 0;
    goto LABEL_43;
  }
LABEL_23:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_responseMessageIndex != *((_DWORD *)v4 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) == 0 || self->_totalResponseMessages != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_activationExpirySeconds != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_42;
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_retryIntervalSeconds != *((_DWORD *)v4 + 11)) {
      goto LABEL_42;
    }
    BOOL v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_serverTimestampSeconds;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_version;
      goto LABEL_9;
    }
  }
  unint64_t v6 = 0;
LABEL_9:
  uint64_t v7 = [(NSMutableArray *)self->_participantPayloads hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v8 = 2654435761 * self->_responseMessageIndex;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_11:
      uint64_t v9 = 2654435761 * self->_totalResponseMessages;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_12;
      }
LABEL_16:
      unint64_t v10 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  unint64_t v10 = 2654435761u * self->_activationExpirySeconds;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_retryIntervalSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if ((v4[16] & 0x20) != 0)
  {
    self->_uint64_t status = v4[12];
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 7)) {
    -[ChannelActivityActivationResponse setUuid:](self, "setUuid:");
  }
  char v6 = *((unsigned char *)v5 + 64);
  if ((v6 & 2) != 0)
  {
    self->_serverTimestampSeconds = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 64);
  }
  if ((v6 & 4) != 0)
  {
    self->_version = *((void *)v5 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v5 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ChannelActivityActivationResponse addParticipantPayload:](self, "addParticipantPayload:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v5 + 64);
  if ((v12 & 8) != 0)
  {
    self->_responseMessageIndex = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v12 = *((unsigned char *)v5 + 64);
    if ((v12 & 0x40) == 0)
    {
LABEL_18:
      if ((v12 & 1) == 0) {
        goto LABEL_19;
      }
LABEL_24:
      self->_activationExpirySeconds = *((void *)v5 + 1);
      *(unsigned char *)&self->_has |= 1u;
      if ((*((unsigned char *)v5 + 64) & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v5 + 64) & 0x40) == 0)
  {
    goto LABEL_18;
  }
  self->_totalResponseMessages = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_has |= 0x40u;
  char v12 = *((unsigned char *)v5 + 64);
  if (v12) {
    goto LABEL_24;
  }
LABEL_19:
  if ((v12 & 0x10) != 0)
  {
LABEL_20:
    self->_retryIntervalSeconds = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_21:
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

- (NSMutableArray)participantPayloads
{
  return self->_participantPayloads;
}

- (void)setParticipantPayloads:(id)a3
{
}

- (unsigned)responseMessageIndex
{
  return self->_responseMessageIndex;
}

- (unsigned)totalResponseMessages
{
  return self->_totalResponseMessages;
}

- (unint64_t)activationExpirySeconds
{
  return self->_activationExpirySeconds;
}

- (unsigned)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_participantPayloads, 0);
}

@end