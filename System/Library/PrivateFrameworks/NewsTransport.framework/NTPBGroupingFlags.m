@interface NTPBGroupingFlags
- (BOOL)hasIsEligibleForGrouping;
- (BOOL)hasIsEligibleForGroupingIfFavorited;
- (BOOL)hasIsHidden;
- (BOOL)isEligibleForGrouping;
- (BOOL)isEligibleForGroupingIfFavorited;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEligibleForGrouping:(BOOL)a3;
- (void)setHasIsEligibleForGroupingIfFavorited:(BOOL)a3;
- (void)setHasIsHidden:(BOOL)a3;
- (void)setIsEligibleForGrouping:(BOOL)a3;
- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBGroupingFlags

- (void)setIsHidden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isHidden = a3;
}

- (void)setHasIsHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsHidden
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsEligibleForGrouping:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isEligibleForGrouping = a3;
}

- (void)setHasIsEligibleForGrouping:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsEligibleForGrouping
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isEligibleForGroupingIfFavorited = a3;
}

- (void)setHasIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsEligibleForGroupingIfFavorited
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBGroupingFlags;
  v4 = [(NTPBGroupingFlags *)&v8 description];
  v5 = [(NTPBGroupingFlags *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isHidden];
    [v3 setObject:v7 forKey:@"is_hidden"];

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
  objc_super v8 = [NSNumber numberWithBool:self->_isEligibleForGrouping];
  [v3 setObject:v8 forKey:@"is_eligible_for_grouping"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithBool:self->_isEligibleForGroupingIfFavorited];
    [v3 setObject:v5 forKey:@"is_eligible_for_grouping_if_favorited"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBGroupingFlagsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 10) = self->_isHidden;
    *((unsigned char *)result + 12) |= 4u;
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
  *((unsigned char *)result + 8) = self->_isEligibleForGrouping;
  *((unsigned char *)result + 12) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 9) = self->_isEligibleForGroupingIfFavorited;
  *((unsigned char *)result + 12) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_isHidden)
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
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_20;
    }
    if (self->_isEligibleForGrouping)
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
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_isEligibleForGroupingIfFavorited)
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
  uint64_t v2 = 2654435761 * self->_isHidden;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isEligibleForGrouping;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isEligibleForGroupingIfFavorited;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if ((v5 & 4) != 0)
  {
    self->_isHidden = v4[10];
    *(unsigned char *)&self->_has |= 4u;
    BOOL v5 = v4[12];
    if (!v5)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v4[12])
  {
    goto LABEL_3;
  }
  self->_isEligibleForGrouping = v4[8];
  *(unsigned char *)&self->_has |= 1u;
  if ((v4[12] & 2) != 0)
  {
LABEL_4:
    self->_isEligibleForGroupingIfFavorited = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isEligibleForGrouping
{
  return self->_isEligibleForGrouping;
}

- (BOOL)isEligibleForGroupingIfFavorited
{
  return self->_isEligibleForGroupingIfFavorited;
}

@end