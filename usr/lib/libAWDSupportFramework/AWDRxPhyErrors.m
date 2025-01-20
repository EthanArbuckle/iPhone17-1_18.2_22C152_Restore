@interface AWDRxPhyErrors
- (BOOL)hasBphyBadplcp;
- (BOOL)hasBphyRxcrsglitch;
- (BOOL)hasRfdisable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bphyBadplcp;
- (unint64_t)bphyRxcrsglitch;
- (unint64_t)hash;
- (unint64_t)rfdisable;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBphyBadplcp:(unint64_t)a3;
- (void)setBphyRxcrsglitch:(unint64_t)a3;
- (void)setHasBphyBadplcp:(BOOL)a3;
- (void)setHasBphyRxcrsglitch:(BOOL)a3;
- (void)setHasRfdisable:(BOOL)a3;
- (void)setRfdisable:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDRxPhyErrors

- (void)setRfdisable:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rfdisable = a3;
}

- (void)setHasRfdisable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRfdisable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBphyRxcrsglitch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bphyRxcrsglitch = a3;
}

- (void)setHasBphyRxcrsglitch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBphyRxcrsglitch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBphyBadplcp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bphyBadplcp = a3;
}

- (void)setHasBphyBadplcp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBphyBadplcp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDRxPhyErrors;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDRxPhyErrors description](&v3, sel_description), -[AWDRxPhyErrors dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bphyRxcrsglitch] forKey:@"bphy_rxcrsglitch"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rfdisable] forKey:@"rfdisable"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bphyBadplcp] forKey:@"bphy_badplcp"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDRxPhyErrorsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_rfdisable;
    *((unsigned char *)a3 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((void *)a3 + 1) = self->_bphyBadplcp;
      *((unsigned char *)a3 + 32) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_bphyRxcrsglitch;
  *((unsigned char *)a3 + 32) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_rfdisable;
    *((unsigned char *)result + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_bphyRxcrsglitch;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = self->_bphyBadplcp;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_rfdisable != *((void *)a3 + 3)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_bphyRxcrsglitch != *((void *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_bphyBadplcp != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_rfdisable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_bphyRxcrsglitch;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_bphyBadplcp;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 4) != 0)
  {
    self->_rfdisable = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_bphyBadplcp = *((void *)a3 + 1);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bphyRxcrsglitch = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 32)) {
    goto LABEL_7;
  }
}

- (unint64_t)rfdisable
{
  return self->_rfdisable;
}

- (unint64_t)bphyRxcrsglitch
{
  return self->_bphyRxcrsglitch;
}

- (unint64_t)bphyBadplcp
{
  return self->_bphyBadplcp;
}

@end