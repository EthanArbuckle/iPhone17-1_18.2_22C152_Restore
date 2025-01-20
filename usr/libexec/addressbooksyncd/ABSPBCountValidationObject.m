@interface ABSPBCountValidationObject
- (BOOL)hasFavoritesCount;
- (BOOL)hasRawCount;
- (BOOL)hasShowAlert;
- (BOOL)hasUnifiedCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)showAlert;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)favoritesCount;
- (int64_t)rawCount;
- (int64_t)unifiedCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFavoritesCount:(int64_t)a3;
- (void)setHasFavoritesCount:(BOOL)a3;
- (void)setHasRawCount:(BOOL)a3;
- (void)setHasShowAlert:(BOOL)a3;
- (void)setHasUnifiedCount:(BOOL)a3;
- (void)setRawCount:(int64_t)a3;
- (void)setShowAlert:(BOOL)a3;
- (void)setUnifiedCount:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBCountValidationObject

- (void)setRawCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rawCount = a3;
}

- (void)setHasRawCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRawCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnifiedCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unifiedCount = a3;
}

- (void)setHasUnifiedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnifiedCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFavoritesCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_favoritesCount = a3;
}

- (void)setHasFavoritesCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFavoritesCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShowAlert:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_showAlert = a3;
}

- (void)setHasShowAlert:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasShowAlert
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBCountValidationObject;
  char v3 = [(ABSPBCountValidationObject *)&v7 description];
  v4 = [(ABSPBCountValidationObject *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithLongLong:self->_rawCount];
    [v3 setObject:v7 forKey:@"rawCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithLongLong:self->_unifiedCount];
  [v3 setObject:v8 forKey:@"unifiedCount"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = +[NSNumber numberWithLongLong:self->_favoritesCount];
  [v3 setObject:v9 forKey:@"favoritesCount"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithBool:self->_showAlert];
    [v3 setObject:v5 forKey:@"showAlert"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBCountValidationObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_rawCount;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_unifiedCount;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[1] = self->_favoritesCount;
  *((unsigned char *)v4 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v4 + 32) = self->_showAlert;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_rawCount;
    *((unsigned char *)result + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_unifiedCount;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 1) = self->_favoritesCount;
  *((unsigned char *)result + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((unsigned char *)result + 32) = self->_showAlert;
  *((unsigned char *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_rawCount != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_unifiedCount != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_favoritesCount != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0)
    {
LABEL_19:
      BOOL v5 = 0;
      goto LABEL_20;
    }
    if (self->_showAlert)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_19;
    }
    BOOL v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_rawCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_unifiedCount;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_favoritesCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_showAlert;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_rawCount = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_unifiedCount = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_favoritesCount = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_5:
    self->_showAlert = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (int64_t)rawCount
{
  return self->_rawCount;
}

- (int64_t)unifiedCount
{
  return self->_unifiedCount;
}

- (int64_t)favoritesCount
{
  return self->_favoritesCount;
}

- (BOOL)showAlert
{
  return self->_showAlert;
}

@end