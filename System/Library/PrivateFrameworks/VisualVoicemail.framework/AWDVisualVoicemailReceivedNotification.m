@interface AWDVisualVoicemailReceivedNotification
- (BOOL)hasAccountType;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNotificationType;
- (BOOL)hasSubsid;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)mcc;
- (NSString)mnc;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)accountType;
- (unsigned)notificationType;
- (unsigned)subsid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountType:(unsigned int)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasNotificationType:(BOOL)a3;
- (void)setHasSubsid:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
- (void)setNotificationType:(unsigned int)a3;
- (void)setSubsid:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDVisualVoicemailReceivedNotification

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNotificationType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNotificationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAccountType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccountType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSubsid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_subsid = a3;
}

- (void)setHasSubsid:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubsid
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasMcc
{
  return self->_mcc != 0;
}

- (BOOL)hasMnc
{
  return self->_mnc != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDVisualVoicemailReceivedNotification;
  char v3 = [(AWDVisualVoicemailReceivedNotification *)&v7 description];
  v4 = [(AWDVisualVoicemailReceivedNotification *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_notificationType];
  [v3 setObject:v10 forKey:@"notificationType"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v11 = +[NSNumber numberWithUnsignedInt:self->_accountType];
  [v3 setObject:v11 forKey:@"accountType"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsid];
    [v3 setObject:v5 forKey:@"subsid"];
  }
LABEL_6:
  mcc = self->_mcc;
  if (mcc) {
    [v3 setObject:mcc forKey:@"mcc"];
  }
  mnc = self->_mnc;
  if (mnc) {
    [v3 setObject:mnc forKey:@"mnc"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007E934((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_6:
  if (self->_mcc)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_mnc)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_notificationType;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_accountType;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 11) = self->_subsid;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_6:
  id v6 = v4;
  if (self->_mcc)
  {
    objc_msgSend(v4, "setMcc:");
    id v4 = v6;
  }
  if (self->_mnc)
  {
    objc_msgSend(v6, "setMnc:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v5 + 4) = self->_accountType;
      *((unsigned char *)v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_notificationType;
  *((unsigned char *)v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 11) = self->_subsid;
    *((unsigned char *)v5 + 48) |= 8u;
  }
LABEL_6:
  id v8 = [(NSString *)self->_mcc copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = [(NSString *)self->_mnc copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_26:
    unsigned __int8 v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_notificationType != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_accountType != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_subsid != *((_DWORD *)v4 + 11)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  mcc = self->_mcc;
  if ((unint64_t)mcc | *((void *)v4 + 3) && !-[NSString isEqual:](mcc, "isEqual:")) {
    goto LABEL_26;
  }
  mnc = self->_mnc;
  if ((unint64_t)mnc | *((void *)v4 + 4)) {
    unsigned __int8 v7 = -[NSString isEqual:](mnc, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_notificationType;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_accountType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_subsid;
LABEL_10:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_mcc hash];
  return v7 ^ [(NSString *)self->_mnc hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_notificationType = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  self->_accountType = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_5:
    self->_subsid = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[AWDVisualVoicemailReceivedNotification setMcc:](self, "setMcc:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[AWDVisualVoicemailReceivedNotification setMnc:](self, "setMnc:");
    id v4 = v6;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)notificationType
{
  return self->_notificationType;
}

- (unsigned)accountType
{
  return self->_accountType;
}

- (unsigned)subsid
{
  return self->_subsid;
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
}

@end