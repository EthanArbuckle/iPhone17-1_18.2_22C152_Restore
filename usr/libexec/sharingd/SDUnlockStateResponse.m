@interface SDUnlockStateResponse
- (BOOL)hasPasscodeEnabled;
- (BOOL)hasUnlockEnabled;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)passcodeEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)unlockEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPasscodeEnabled:(BOOL)a3;
- (void)setHasUnlockEnabled:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPasscodeEnabled:(BOOL)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockStateResponse

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unlockEnabled = a3;
}

- (void)setHasUnlockEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnlockEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_passcodeEnabled = a3;
}

- (void)setHasPasscodeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPasscodeEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockStateResponse;
  char v3 = [(SDUnlockStateResponse *)&v7 description];
  v4 = [(SDUnlockStateResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v7 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithBool:self->_unlockEnabled];
  [v3 setObject:v8 forKey:@"unlockEnabled"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithBool:self->_passcodeEnabled];
    [v3 setObject:v5 forKey:@"passcodeEnabled"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockStateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_version;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 13) = self->_unlockEnabled;
  *((unsigned char *)v4 + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 12) = self->_passcodeEnabled;
    *((unsigned char *)v4 + 16) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_version;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 13) = self->_unlockEnabled;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_passcodeEnabled;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_version != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_unlockEnabled)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_passcodeEnabled)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_unlockEnabled;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_passcodeEnabled;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_version = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_unlockEnabled = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_4:
    self->_passcodeEnabled = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (BOOL)passcodeEnabled
{
  return self->_passcodeEnabled;
}

@end