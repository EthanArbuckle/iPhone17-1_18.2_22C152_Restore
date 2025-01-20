@interface SDUnlockSessionConfirmation
- (BOOL)hasSessionID;
- (BOOL)hasSuccess;
- (BOOL)hasSupportsACK;
- (BOOL)hasSuppressNotification;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (BOOL)supportsACK;
- (BOOL)suppressNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasSupportsACK:(BOOL)a3;
- (void)setHasSuppressNotification:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setSupportsACK:(BOOL)a3;
- (void)setSuppressNotification:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionConfirmation

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

- (void)setSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsACK:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsACK = a3;
}

- (void)setHasSupportsACK:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsACK
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSuppressNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_suppressNotification = a3;
}

- (void)setHasSuppressNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressNotification
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSessionConfirmation;
  char v3 = [(SDUnlockSessionConfirmation *)&v7 description];
  v4 = [(SDUnlockSessionConfirmation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v7 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_sessionID];
  [v3 setObject:v8 forKey:@"sessionID"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = +[NSNumber numberWithBool:self->_success];
  [v3 setObject:v9 forKey:@"success"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = +[NSNumber numberWithBool:self->_supportsACK];
  [v3 setObject:v10 forKey:@"supportsACK"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithBool:self->_suppressNotification];
    [v3 setObject:v5 forKey:@"suppressNotification"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionConfirmationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_version;
    *((unsigned char *)v4 + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_sessionID;
  *((unsigned char *)v4 + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)v4 + 16) = self->_success;
  *((unsigned char *)v4 + 20) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((unsigned char *)v4 + 17) = self->_supportsACK;
  *((unsigned char *)v4 + 20) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 18) = self->_suppressNotification;
    *((unsigned char *)v4 + 20) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_version;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_sessionID;
  *((unsigned char *)result + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 16) = self->_success;
  *((unsigned char *)result + 20) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 17) = self->_supportsACK;
  *((unsigned char *)result + 20) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 18) = self->_suppressNotification;
  *((unsigned char *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_version != *((_DWORD *)v4 + 3)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_supportsACK)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) != 0)
  {
    goto LABEL_30;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
    {
      if (self->_suppressNotification)
      {
        if (!*((unsigned char *)v4 + 18)) {
          goto LABEL_30;
        }
      }
      else if (*((unsigned char *)v4 + 18))
      {
        goto LABEL_30;
      }
      BOOL v5 = 1;
      goto LABEL_31;
    }
LABEL_30:
    BOOL v5 = 0;
  }
LABEL_31:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_sessionID;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_success;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_supportsACK;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_suppressNotification;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_success = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_supportsACK = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
  {
LABEL_6:
    self->_suppressNotification = *((unsigned char *)v4 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)supportsACK
{
  return self->_supportsACK;
}

- (BOOL)suppressNotification
{
  return self->_suppressNotification;
}

@end