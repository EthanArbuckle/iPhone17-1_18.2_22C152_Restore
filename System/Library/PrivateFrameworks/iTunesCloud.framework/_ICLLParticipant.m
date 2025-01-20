@interface _ICLLParticipant
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantUUID, 0);

  objc_storeStrong((id *)&self->_externalId, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_participantId;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_externalId hash];
  NSUInteger v5 = [(NSString *)self->_participantUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_storefront;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_unreliablePlaybackSyncStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_participantId != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  externalId = self->_externalId;
  if ((unint64_t)externalId | *((void *)v4 + 2) && !-[NSString isEqual:](externalId, "isEqual:")) {
    goto LABEL_20;
  }
  participantUUID = self->_participantUUID;
  if ((unint64_t)participantUUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](participantUUID, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_storefront != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_unreliablePlaybackSyncStatus != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_participantId;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_externalId copyWithZone:a3];
  v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_participantUUID copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_storefront;
    *(unsigned char *)(v6 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_unreliablePlaybackSyncStatus;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_externalId) {
    PBDataWriterWriteStringField();
  }
  if (self->_participantUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLParticipantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_participantId];
    [v3 setObject:v4 forKey:@"participantId"];
  }
  externalId = self->_externalId;
  if (externalId) {
    [v3 setObject:externalId forKey:@"externalId"];
  }
  participantUUID = self->_participantUUID;
  if (participantUUID) {
    [v3 setObject:participantUUID forKey:@"participantUUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithInt:self->_storefront];
    [v3 setObject:v8 forKey:@"storefront"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v9 = [NSNumber numberWithInt:self->_unreliablePlaybackSyncStatus];
    [v3 setObject:v9 forKey:@"unreliablePlaybackSyncStatus"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLParticipant;
  id v4 = [(_ICLLParticipant *)&v8 description];
  id v5 = [(_ICLLParticipant *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end