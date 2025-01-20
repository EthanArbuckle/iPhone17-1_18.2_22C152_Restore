@interface CSDMessagingConversationInvitationPreference
+ (id)invitationPreferenceWithTUConversationInvitationPreference:(id)a3;
+ (int)messagingHandleTypeFor:(int64_t)a3;
- (BOOL)hasHandleType;
- (BOOL)hasNotificationStyles;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TUConversationInvitationPreference)tuInvitationPreference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handleTypeAsString:(int)a3;
- (int)StringAsHandleType:(id)a3;
- (int)handleType;
- (int64_t)tuHandleType;
- (unint64_t)hash;
- (unsigned)notificationStyles;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandleType:(int)a3;
- (void)setHasHandleType:(BOOL)a3;
- (void)setHasNotificationStyles:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setNotificationStyles:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationInvitationPreference

+ (id)invitationPreferenceWithTUConversationInvitationPreference:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = objc_alloc_init(CSDMessagingConversationInvitationPreference);
    -[CSDMessagingConversationInvitationPreference setHandleType:](v5, "setHandleType:", objc_msgSend(a1, "messagingHandleTypeFor:", objc_msgSend(v4, "handleType")));
    id v6 = [v4 notificationStyles];

    [(CSDMessagingConversationInvitationPreference *)v5 setNotificationStyles:v6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int)messagingHandleTypeFor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (TUConversationInvitationPreference)tuInvitationPreference
{
  if ([(CSDMessagingConversationInvitationPreference *)self hasHandleType]
    && [(CSDMessagingConversationInvitationPreference *)self hasNotificationStyles])
  {
    id v3 = objc_msgSend(objc_alloc((Class)TUConversationInvitationPreference), "initWithHandleType:notificationStyles:", -[CSDMessagingConversationInvitationPreference tuHandleType](self, "tuHandleType"), -[CSDMessagingConversationInvitationPreference notificationStyles](self, "notificationStyles"));
  }
  else
  {
    id v3 = 0;
  }

  return (TUConversationInvitationPreference *)v3;
}

- (int64_t)tuHandleType
{
  unsigned int v2 = [(CSDMessagingConversationInvitationPreference *)self handleType];
  if (v2 > 3) {
    return 0;
  }
  else {
    return qword_10048D6B8[v2];
  }
}

- (void)setVersion:(unsigned int)a3
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

- (int)handleType
{
  if (*(unsigned char *)&self->_has) {
    return self->_handleType;
  }
  else {
    return 0;
  }
}

- (void)setHandleType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_handleType = a3;
}

- (void)setHasHandleType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHandleType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)handleTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100508440[a3];
  }

  return v3;
}

- (int)StringAsHandleType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNotificationStyles:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_notificationStyles = a3;
}

- (void)setHasNotificationStyles:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNotificationStyles
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationInvitationPreference;
  char v3 = [(CSDMessagingConversationInvitationPreference *)&v7 description];
  int v4 = [(CSDMessagingConversationInvitationPreference *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v7 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t handleType = self->_handleType;
  if (handleType >= 4)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_handleType];
  }
  else
  {
    v9 = off_100508440[handleType];
  }
  [v3 setObject:v9 forKey:@"handleType"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithUnsignedInt:self->_notificationStyles];
  [v3 setObject:v5 forKey:@"notificationStyles"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013E05C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_handleType;
  *((unsigned char *)v4 + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_notificationStyles;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_version;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_handleType;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_notificationStyles;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_handleType != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_notificationStyles != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_handleType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_notificationStyles;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t handleType = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_notificationStyles = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)notificationStyles
{
  return self->_notificationStyles;
}

@end