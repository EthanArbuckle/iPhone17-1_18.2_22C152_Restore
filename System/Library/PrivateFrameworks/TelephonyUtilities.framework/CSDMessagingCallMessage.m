@interface CSDMessagingCallMessage
- (BOOL)hasInviteData;
- (BOOL)hasOBSOLETEProtoMomentsAvailable;
- (BOOL)hasProtoMomentsV2Available;
- (BOOL)hasProtoProtocolVersion;
- (BOOL)hasProtoSenderMuteUplink;
- (BOOL)hasProtoShouldSuppressInCallUI;
- (BOOL)hasProtoUpgradeSessionUUID;
- (BOOL)hasProtoWantsVideo;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)oBSOLETEProtoMomentsAvailable;
- (BOOL)protoMomentsV2Available;
- (BOOL)protoSenderMuteUplink;
- (BOOL)protoShouldSuppressInCallUI;
- (BOOL)protoWantsVideo;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)inviteData;
- (NSString)protoUpgradeSessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)protoProtocolVersion;
- (void)addProtocolVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOBSOLETEProtoMomentsAvailable:(BOOL)a3;
- (void)setHasProtoMomentsV2Available:(BOOL)a3;
- (void)setHasProtoProtocolVersion:(BOOL)a3;
- (void)setHasProtoSenderMuteUplink:(BOOL)a3;
- (void)setHasProtoShouldSuppressInCallUI:(BOOL)a3;
- (void)setHasProtoWantsVideo:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInviteData:(id)a3;
- (void)setMomentsAvailable:(BOOL)a3;
- (void)setOBSOLETEProtoMomentsAvailable:(BOOL)a3;
- (void)setProtoMomentsV2Available:(BOOL)a3;
- (void)setProtoProtocolVersion:(unsigned int)a3;
- (void)setProtoSenderMuteUplink:(BOOL)a3;
- (void)setProtoShouldSuppressInCallUI:(BOOL)a3;
- (void)setProtoUpgradeSessionUUID:(id)a3;
- (void)setProtoWantsVideo:(BOOL)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setSenderMuteUplink:(BOOL)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setWantsVideo:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallMessage

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCallMessage *)self protoProtocolVersion])
  {
    [(CSDMessagingCallMessage *)self setProtoProtocolVersion:v3];
  }
}

- (void)setWantsVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCallMessage *)self protoWantsVideo])
  {
    [(CSDMessagingCallMessage *)self setProtoWantsVideo:v3];
  }
}

- (void)setSenderMuteUplink:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCallMessage *)self protoSenderMuteUplink])
  {
    [(CSDMessagingCallMessage *)self setProtoSenderMuteUplink:v3];
  }
}

- (void)setMomentsAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCallMessage *)self protoMomentsV2Available])
  {
    [(CSDMessagingCallMessage *)self setProtoMomentsV2Available:v3];
  }
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCallMessage *)self protoShouldSuppressInCallUI])
  {
    [(CSDMessagingCallMessage *)self setProtoShouldSuppressInCallUI:v3];
  }
}

- (void)addProtocolVersion
{
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100508268 + a3);
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
  else if ([v3 isEqualToString:@"Invite"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SenderMuteUplink"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_protoProtocolVersion = a3;
}

- (void)setHasProtoProtocolVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtoProtocolVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProtoWantsVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_protoWantsVideo = a3;
}

- (void)setHasProtoWantsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasProtoWantsVideo
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasInviteData
{
  return self->_inviteData != 0;
}

- (void)setOBSOLETEProtoMomentsAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_oBSOLETEProtoMomentsAvailable = a3;
}

- (void)setHasOBSOLETEProtoMomentsAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOBSOLETEProtoMomentsAvailable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProtoSenderMuteUplink:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_protoSenderMuteUplink = a3;
}

- (void)setHasProtoSenderMuteUplink:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtoSenderMuteUplink
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setProtoShouldSuppressInCallUI:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_protoShouldSuppressInCallUI = a3;
}

- (void)setHasProtoShouldSuppressInCallUI:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasProtoShouldSuppressInCallUI
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setProtoMomentsV2Available:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_protoMomentsV2Available = a3;
}

- (void)setHasProtoMomentsV2Available:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasProtoMomentsV2Available
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasProtoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallMessage;
  char v3 = [(CSDMessagingCallMessage *)&v7 description];
  int v4 = [(CSDMessagingCallMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 3)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v6 = *(&off_100508268 + type);
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_protoProtocolVersion];
    [v3 setObject:v7 forKey:@"protoProtocolVersion"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_protoWantsVideo];
    [v3 setObject:v8 forKey:@"protoWantsVideo"];
  }
  inviteData = self->_inviteData;
  if (inviteData)
  {
    v10 = [(CSDMessagingAVConferenceInviteData *)inviteData dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"inviteData"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v15 = +[NSNumber numberWithBool:self->_oBSOLETEProtoMomentsAvailable];
    [v3 setObject:v15 forKey:@"OBSOLETE_protoMomentsAvailable"];

    char v11 = (char)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_14:
      if ((v11 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  v16 = +[NSNumber numberWithBool:self->_protoSenderMuteUplink];
  [v3 setObject:v16 forKey:@"protoSenderMuteUplink"];

  char v11 = (char)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_24:
  v17 = +[NSNumber numberWithBool:self->_protoShouldSuppressInCallUI];
  [v3 setObject:v17 forKey:@"protoShouldSuppressInCallUI"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    v12 = +[NSNumber numberWithBool:self->_protoMomentsV2Available];
    [v3 setObject:v12 forKey:@"protoMomentsV2Available"];
  }
LABEL_17:
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if (protoUpgradeSessionUUID) {
    [v3 setObject:protoUpgradeSessionUUID forKey:@"protoUpgradeSessionUUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013A138((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_5:
  if (self->_inviteData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_12:
  if (self->_protoUpgradeSessionUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_type;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_protoProtocolVersion;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 40) = self->_protoWantsVideo;
    *((unsigned char *)v4 + 44) |= 0x40u;
  }
LABEL_5:
  id v7 = v4;
  if (self->_inviteData)
  {
    objc_msgSend(v4, "setInviteData:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_oBSOLETEProtoMomentsAvailable;
    *((unsigned char *)v4 + 44) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 38) = self->_protoSenderMuteUplink;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_22:
  *((unsigned char *)v4 + 39) = self->_protoShouldSuppressInCallUI;
  *((unsigned char *)v4 + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 37) = self->_protoMomentsV2Available;
    *((unsigned char *)v4 + 44) |= 8u;
  }
LABEL_12:
  if (self->_protoUpgradeSessionUUID)
  {
    objc_msgSend(v7, "setProtoUpgradeSessionUUID:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[8] = self->_type;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_protoProtocolVersion;
  *((unsigned char *)v5 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 40) = self->_protoWantsVideo;
    *((unsigned char *)v5 + 44) |= 0x40u;
  }
LABEL_5:
  id v8 = [(CSDMessagingAVConferenceInviteData *)self->_inviteData copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((unsigned char *)v6 + 36) = self->_oBSOLETEProtoMomentsAvailable;
    *((unsigned char *)v6 + 44) |= 4u;
    char v10 = (char)self->_has;
    if ((v10 & 0x10) == 0)
    {
LABEL_7:
      if ((v10 & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      *((unsigned char *)v6 + 39) = self->_protoShouldSuppressInCallUI;
      *((unsigned char *)v6 + 44) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v6 + 38) = self->_protoSenderMuteUplink;
  *((unsigned char *)v6 + 44) |= 0x10u;
  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v10 & 8) != 0)
  {
LABEL_9:
    *((unsigned char *)v6 + 37) = self->_protoMomentsV2Available;
    *((unsigned char *)v6 + 44) |= 8u;
  }
LABEL_10:
  id v11 = [(NSString *)self->_protoUpgradeSessionUUID copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_51;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_protoProtocolVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_51;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x40) == 0) {
      goto LABEL_51;
    }
    if (self->_protoWantsVideo)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_51;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_51;
  }
  inviteData = self->_inviteData;
  if ((unint64_t)inviteData | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingAVConferenceInviteData isEqual:](inviteData, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0) {
      goto LABEL_51;
    }
    if (self->_oBSOLETEProtoMomentsAvailable)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_51;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_51;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_51;
    }
    if (self->_protoSenderMuteUplink)
    {
      if (!*((unsigned char *)v4 + 38)) {
        goto LABEL_51;
      }
    }
    else if (*((unsigned char *)v4 + 38))
    {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_51;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0) {
      goto LABEL_51;
    }
    if (self->_protoShouldSuppressInCallUI)
    {
      if (!*((unsigned char *)v4 + 39)) {
        goto LABEL_51;
      }
    }
    else if (*((unsigned char *)v4 + 39))
    {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  if ((has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_57;
    }
LABEL_51:
    unsigned __int8 v7 = 0;
    goto LABEL_52;
  }
  if ((*((unsigned char *)v4 + 44) & 8) == 0) {
    goto LABEL_51;
  }
  if (!self->_protoMomentsV2Available)
  {
    if (!*((unsigned char *)v4 + 37)) {
      goto LABEL_57;
    }
    goto LABEL_51;
  }
  if (!*((unsigned char *)v4 + 37)) {
    goto LABEL_51;
  }
LABEL_57:
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if ((unint64_t)protoUpgradeSessionUUID | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[NSString isEqual:](protoUpgradeSessionUUID, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_52:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_protoProtocolVersion;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_protoWantsVideo;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(CSDMessagingAVConferenceInviteData *)self->_inviteData hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_oBSOLETEProtoMomentsAvailable;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_10:
      uint64_t v8 = 2654435761 * self->_protoSenderMuteUplink;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_12;
      }
LABEL_16:
      uint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6 ^ [(NSString *)self->_protoUpgradeSessionUUID hash];
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_protoShouldSuppressInCallUI;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v10 = 2654435761 * self->_protoMomentsV2Available;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v6 ^ [(NSString *)self->_protoUpgradeSessionUUID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 44);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_protoProtocolVersion = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
  {
LABEL_4:
    self->_protoWantsVideo = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_5:
  inviteData = self->_inviteData;
  uint64_t v8 = *((void *)v5 + 1);
  id v10 = v5;
  if (inviteData)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[CSDMessagingAVConferenceInviteData mergeFrom:](inviteData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[CSDMessagingCallMessage setInviteData:](self, "setInviteData:");
  }
  id v5 = v10;
LABEL_14:
  char v9 = *((unsigned char *)v5 + 44);
  if ((v9 & 4) != 0)
  {
    self->_oBSOLETEProtoMomentsAvailable = *((unsigned char *)v5 + 36);
    *(unsigned char *)&self->_has |= 4u;
    char v9 = *((unsigned char *)v5 + 44);
    if ((v9 & 0x10) == 0)
    {
LABEL_16:
      if ((v9 & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v5 + 44) & 0x10) == 0)
  {
    goto LABEL_16;
  }
  self->_protoSenderMuteUplink = *((unsigned char *)v5 + 38);
  *(unsigned char *)&self->_has |= 0x10u;
  char v9 = *((unsigned char *)v5 + 44);
  if ((v9 & 0x20) == 0)
  {
LABEL_17:
    if ((v9 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_26:
  self->_protoShouldSuppressInCallUI = *((unsigned char *)v5 + 39);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v5 + 44) & 8) != 0)
  {
LABEL_18:
    self->_protoMomentsV2Available = *((unsigned char *)v5 + 37);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_19:
  if (*((void *)v5 + 3))
  {
    -[CSDMessagingCallMessage setProtoUpgradeSessionUUID:](self, "setProtoUpgradeSessionUUID:");
    id v5 = v10;
  }
}

- (unsigned)protoProtocolVersion
{
  return self->_protoProtocolVersion;
}

- (BOOL)protoWantsVideo
{
  return self->_protoWantsVideo;
}

- (CSDMessagingAVConferenceInviteData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
}

- (BOOL)oBSOLETEProtoMomentsAvailable
{
  return self->_oBSOLETEProtoMomentsAvailable;
}

- (BOOL)protoSenderMuteUplink
{
  return self->_protoSenderMuteUplink;
}

- (BOOL)protoShouldSuppressInCallUI
{
  return self->_protoShouldSuppressInCallUI;
}

- (BOOL)protoMomentsV2Available
{
  return self->_protoMomentsV2Available;
}

- (NSString)protoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID;
}

- (void)setProtoUpgradeSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoUpgradeSessionUUID, 0);

  objc_storeStrong((id *)&self->_inviteData, 0);
}

@end