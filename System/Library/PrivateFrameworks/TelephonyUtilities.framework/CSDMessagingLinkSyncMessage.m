@interface CSDMessagingLinkSyncMessage
- (BOOL)hasCheckInMessage;
- (BOOL)hasRecoverMessage;
- (BOOL)hasType;
- (BOOL)hasUpdateMessage;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingLinkSyncCheckInMessage)checkInMessage;
- (CSDMessagingLinkSyncRecoverMessage)recoverMessage;
- (CSDMessagingLinkSyncUpdateMessage)updateMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCheckInMessage:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRecoverMessage:(id)a3;
- (void)setType:(int)a3;
- (void)setUpdateMessage:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLinkSyncMessage

- (void)setVersion:(unsigned int)a3
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

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100505CB0 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CheckIn"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Recover"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUpdateMessage
{
  return self->_updateMessage != 0;
}

- (BOOL)hasCheckInMessage
{
  return self->_checkInMessage != 0;
}

- (BOOL)hasRecoverMessage
{
  return self->_recoverMessage != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingLinkSyncMessage;
  id v3 = [(CSDMessagingLinkSyncMessage *)&v7 description];
  int v4 = [(CSDMessagingLinkSyncMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      objc_super v7 = *(&off_100505CB0 + type);
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  updateMessage = self->_updateMessage;
  if (updateMessage)
  {
    v9 = [(CSDMessagingLinkSyncUpdateMessage *)updateMessage dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"updateMessage"];
  }
  checkInMessage = self->_checkInMessage;
  if (checkInMessage)
  {
    v11 = [(CSDMessagingLinkSyncCheckInMessage *)checkInMessage dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"checkInMessage"];
  }
  recoverMessage = self->_recoverMessage;
  if (recoverMessage)
  {
    v13 = [(CSDMessagingLinkSyncRecoverMessage *)recoverMessage dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"recoverMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006F044((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_updateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_checkInMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_recoverMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_version;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v6 = v4;
  if (self->_updateMessage)
  {
    objc_msgSend(v4, "setUpdateMessage:");
    id v4 = v6;
  }
  if (self->_checkInMessage)
  {
    objc_msgSend(v6, "setCheckInMessage:");
    id v4 = v6;
  }
  if (self->_recoverMessage)
  {
    objc_msgSend(v6, "setRecoverMessage:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_version;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  id v8 = [(CSDMessagingLinkSyncUpdateMessage *)self->_updateMessage copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = [(CSDMessagingLinkSyncCheckInMessage *)self->_checkInMessage copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = [(CSDMessagingLinkSyncRecoverMessage *)self->_recoverMessage copyWithZone:a3];
  v13 = (void *)v6[2];
  v6[2] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  updateMessage = self->_updateMessage;
  if ((unint64_t)updateMessage | *((void *)v4 + 4)
    && !-[CSDMessagingLinkSyncUpdateMessage isEqual:](updateMessage, "isEqual:"))
  {
    goto LABEL_18;
  }
  checkInMessage = self->_checkInMessage;
  if ((unint64_t)checkInMessage | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingLinkSyncCheckInMessage isEqual:](checkInMessage, "isEqual:")) {
      goto LABEL_18;
    }
  }
  recoverMessage = self->_recoverMessage;
  if ((unint64_t)recoverMessage | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[CSDMessagingLinkSyncRecoverMessage isEqual:](recoverMessage, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_type;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(CSDMessagingLinkSyncUpdateMessage *)self->_updateMessage hash];
  unint64_t v6 = [(CSDMessagingLinkSyncCheckInMessage *)self->_checkInMessage hash];
  return v5 ^ v6 ^ [(CSDMessagingLinkSyncRecoverMessage *)self->_recoverMessage hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if (v6)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  updateMessage = self->_updateMessage;
  uint64_t v8 = v5[4];
  v13 = v5;
  if (updateMessage)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingLinkSyncUpdateMessage mergeFrom:](updateMessage, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingLinkSyncMessage setUpdateMessage:](self, "setUpdateMessage:");
  }
  unint64_t v5 = v13;
LABEL_11:
  checkInMessage = self->_checkInMessage;
  uint64_t v10 = v5[1];
  if (checkInMessage)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[CSDMessagingLinkSyncCheckInMessage mergeFrom:](checkInMessage, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[CSDMessagingLinkSyncMessage setCheckInMessage:](self, "setCheckInMessage:");
  }
  unint64_t v5 = v13;
LABEL_17:
  recoverMessage = self->_recoverMessage;
  uint64_t v12 = v5[2];
  if (recoverMessage)
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[CSDMessagingLinkSyncRecoverMessage mergeFrom:](recoverMessage, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[CSDMessagingLinkSyncMessage setRecoverMessage:](self, "setRecoverMessage:");
  }
  unint64_t v5 = v13;
LABEL_23:
}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingLinkSyncUpdateMessage)updateMessage
{
  return self->_updateMessage;
}

- (void)setUpdateMessage:(id)a3
{
}

- (CSDMessagingLinkSyncCheckInMessage)checkInMessage
{
  return self->_checkInMessage;
}

- (void)setCheckInMessage:(id)a3
{
}

- (CSDMessagingLinkSyncRecoverMessage)recoverMessage
{
  return self->_recoverMessage;
}

- (void)setRecoverMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateMessage, 0);
  objc_storeStrong((id *)&self->_recoverMessage, 0);

  objc_storeStrong((id *)&self->_checkInMessage, 0);
}

@end