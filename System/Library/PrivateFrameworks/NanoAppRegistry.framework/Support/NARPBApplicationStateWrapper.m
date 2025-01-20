@interface NARPBApplicationStateWrapper
- (BOOL)hasIsRemovedSystemApp;
- (BOOL)hasIsRestricted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemovedSystemApp;
- (BOOL)isRestricted;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsRemovedSystemApp:(BOOL)a3;
- (void)setHasIsRestricted:(BOOL)a3;
- (void)setIsRemovedSystemApp:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NARPBApplicationStateWrapper

- (void)setIsRestricted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isRestricted = a3;
}

- (void)setHasIsRestricted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsRestricted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsRemovedSystemApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isRemovedSystemApp = a3;
}

- (void)setHasIsRemovedSystemApp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsRemovedSystemApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NARPBApplicationStateWrapper;
  char v3 = [(NARPBApplicationStateWrapper *)&v7 description];
  v4 = [(NARPBApplicationStateWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithBool:self->_isRestricted];
    [v3 setObject:v5 forKey:@"isRestricted"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithBool:self->_isRemovedSystemApp];
    [v3 setObject:v6 forKey:@"isRemovedSystemApp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A214((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_isRestricted;
    v4[12] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[8] = self->_isRemovedSystemApp;
    v4[12] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_isRestricted;
    *((unsigned char *)result + 12) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)result + 8) = self->_isRemovedSystemApp;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_isRestricted)
    {
      if (!v4[9]) {
        goto LABEL_12;
      }
    }
    else if (v4[9])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (v4[12])
    {
      if (self->_isRemovedSystemApp)
      {
        if (!v4[8]) {
          goto LABEL_12;
        }
      }
      else if (v4[8])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isRestricted;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isRemovedSystemApp;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if ((v5 & 2) != 0)
  {
    self->_isRestricted = v4[9];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[12];
  }
  if (v5)
  {
    self->_isRemovedSystemApp = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (BOOL)isRemovedSystemApp
{
  return self->_isRemovedSystemApp;
}

@end