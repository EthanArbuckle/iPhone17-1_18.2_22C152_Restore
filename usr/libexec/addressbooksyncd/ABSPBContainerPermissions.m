@interface ABSPBContainerPermissions
- (BOOL)canCreateContacts;
- (BOOL)canCreateGrouops;
- (BOOL)canDeleteContacts;
- (BOOL)hasCanCreateContacts;
- (BOOL)hasCanCreateGrouops;
- (BOOL)hasCanDeleteContacts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanCreateContacts:(BOOL)a3;
- (void)setCanCreateGrouops:(BOOL)a3;
- (void)setCanDeleteContacts:(BOOL)a3;
- (void)setHasCanCreateContacts:(BOOL)a3;
- (void)setHasCanCreateGrouops:(BOOL)a3;
- (void)setHasCanDeleteContacts:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBContainerPermissions

- (void)setCanCreateContacts:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_canCreateContacts = a3;
}

- (void)setHasCanCreateContacts:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCanCreateContacts
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCanDeleteContacts:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_canDeleteContacts = a3;
}

- (void)setHasCanDeleteContacts:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCanDeleteContacts
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCanCreateGrouops:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_canCreateGrouops = a3;
}

- (void)setHasCanCreateGrouops:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanCreateGrouops
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBContainerPermissions;
  char v3 = [(ABSPBContainerPermissions *)&v7 description];
  v4 = [(ABSPBContainerPermissions *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_canCreateContacts];
    [v3 setObject:v7 forKey:@"canCreateContacts"];

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
  v8 = +[NSNumber numberWithBool:self->_canDeleteContacts];
  [v3 setObject:v8 forKey:@"canDeleteContacts"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithBool:self->_canCreateGrouops];
    [v3 setObject:v5 forKey:@"canCreateGrouops"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBContainerPermissionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
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
    v4[8] = self->_canCreateContacts;
    v4[12] |= 1u;
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
  v4[10] = self->_canDeleteContacts;
  v4[12] |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[9] = self->_canCreateGrouops;
    v4[12] |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_canCreateContacts;
    *((unsigned char *)result + 12) |= 1u;
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
  *((unsigned char *)result + 10) = self->_canDeleteContacts;
  *((unsigned char *)result + 12) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 9) = self->_canCreateGrouops;
  *((unsigned char *)result + 12) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_canCreateContacts)
    {
      if (!v4[8]) {
        goto LABEL_20;
      }
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if (v4[12])
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_canDeleteContacts)
    {
      if (!v4[10]) {
        goto LABEL_20;
      }
    }
    else if (v4[10])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_20;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_canCreateGrouops)
      {
        if (!v4[9]) {
          goto LABEL_20;
        }
      }
      else if (v4[9])
      {
        goto LABEL_20;
      }
      BOOL v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v5 = 0;
  }
LABEL_21:

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
  uint64_t v2 = 2654435761 * self->_canCreateContacts;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_canDeleteContacts;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_canCreateGrouops;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_canCreateContacts = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[12];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[12] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_canDeleteContacts = v4[10];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[12] & 2) != 0)
  {
LABEL_4:
    self->_canCreateGrouops = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (BOOL)canCreateContacts
{
  return self->_canCreateContacts;
}

- (BOOL)canDeleteContacts
{
  return self->_canDeleteContacts;
}

- (BOOL)canCreateGrouops
{
  return self->_canCreateGrouops;
}

@end