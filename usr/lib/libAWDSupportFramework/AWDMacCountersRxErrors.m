@interface AWDMacCountersRxErrors
- (BOOL)hasRxbadfcs;
- (BOOL)hasRxbadplcp;
- (BOOL)hasRxcrsglitch;
- (BOOL)hasRxfrmtoolong;
- (BOOL)hasRxfrmtooshrt;
- (BOOL)hasRxinvmachdr;
- (BOOL)hasRxstrt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxbadfcs;
- (unint64_t)rxbadplcp;
- (unint64_t)rxcrsglitch;
- (unint64_t)rxfrmtoolong;
- (unint64_t)rxfrmtooshrt;
- (unint64_t)rxinvmachdr;
- (unint64_t)rxstrt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRxbadfcs:(BOOL)a3;
- (void)setHasRxbadplcp:(BOOL)a3;
- (void)setHasRxcrsglitch:(BOOL)a3;
- (void)setHasRxfrmtoolong:(BOOL)a3;
- (void)setHasRxfrmtooshrt:(BOOL)a3;
- (void)setHasRxinvmachdr:(BOOL)a3;
- (void)setHasRxstrt:(BOOL)a3;
- (void)setRxbadfcs:(unint64_t)a3;
- (void)setRxbadplcp:(unint64_t)a3;
- (void)setRxcrsglitch:(unint64_t)a3;
- (void)setRxfrmtoolong:(unint64_t)a3;
- (void)setRxfrmtooshrt:(unint64_t)a3;
- (void)setRxinvmachdr:(unint64_t)a3;
- (void)setRxstrt:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMacCountersRxErrors

- (void)setRxfrmtoolong:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rxfrmtoolong = a3;
}

- (void)setHasRxfrmtoolong:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRxfrmtoolong
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRxfrmtooshrt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_rxfrmtooshrt = a3;
}

- (void)setHasRxfrmtooshrt:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRxfrmtooshrt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRxinvmachdr:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rxinvmachdr = a3;
}

- (void)setHasRxinvmachdr:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRxinvmachdr
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRxbadfcs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rxbadfcs = a3;
}

- (void)setHasRxbadfcs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRxbadfcs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRxbadplcp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rxbadplcp = a3;
}

- (void)setHasRxbadplcp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxbadplcp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRxcrsglitch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rxcrsglitch = a3;
}

- (void)setHasRxcrsglitch:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxcrsglitch
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRxstrt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_rxstrt = a3;
}

- (void)setHasRxstrt:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRxstrt
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMacCountersRxErrors;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMacCountersRxErrors description](&v3, sel_description), -[AWDMacCountersRxErrors dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxfrmtoolong] forKey:@"rxfrmtoolong"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxfrmtooshrt] forKey:@"rxfrmtooshrt"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxinvmachdr] forKey:@"rxinvmachdr"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadfcs] forKey:@"rxbadfcs"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxcrsglitch] forKey:@"rxcrsglitch"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxbadplcp] forKey:@"rxbadplcp"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x40) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxstrt] forKey:@"rxstrt"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMacCountersRxErrorsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_rxfrmtoolong;
    *((unsigned char *)a3 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 5) = self->_rxfrmtooshrt;
  *((unsigned char *)a3 + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)a3 + 6) = self->_rxinvmachdr;
  *((unsigned char *)a3 + 64) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_rxbadfcs;
  *((unsigned char *)a3 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 2) = self->_rxbadplcp;
  *((unsigned char *)a3 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      return;
    }
LABEL_15:
    *((void *)a3 + 7) = self->_rxstrt;
    *((unsigned char *)a3 + 64) |= 0x40u;
    return;
  }
LABEL_14:
  *((void *)a3 + 3) = self->_rxcrsglitch;
  *((unsigned char *)a3 + 64) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)result + 4) = self->_rxfrmtoolong;
    *((unsigned char *)result + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 5) = self->_rxfrmtooshrt;
  *((unsigned char *)result + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 6) = self->_rxinvmachdr;
  *((unsigned char *)result + 64) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 1) = self->_rxbadfcs;
  *((unsigned char *)result + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 2) = self->_rxbadplcp;
  *((unsigned char *)result + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 3) = self->_rxcrsglitch;
  *((unsigned char *)result + 64) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 7) = self->_rxstrt;
  *((unsigned char *)result + 64) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_rxfrmtoolong != *((void *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_rxfrmtooshrt != *((void *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_rxinvmachdr != *((void *)a3 + 6)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_rxbadfcs != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_rxbadplcp != *((void *)a3 + 2)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_rxcrsglitch != *((void *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 4) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 64) & 0x40) == 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x40) == 0 || self->_rxstrt != *((void *)a3 + 7)) {
        goto LABEL_36;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v2 = 2654435761u * self->_rxfrmtoolong;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_rxfrmtooshrt;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_rxinvmachdr;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_rxbadfcs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_rxbadplcp;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_rxcrsglitch;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_rxstrt;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 8) != 0)
  {
    self->_rxfrmtoolong = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v3 = *((unsigned char *)a3 + 64);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_rxfrmtooshrt = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_rxinvmachdr = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_rxbadfcs = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_rxbadplcp = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      return;
    }
LABEL_15:
    self->_rxstrt = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    return;
  }
LABEL_14:
  self->_rxcrsglitch = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 64) & 0x40) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)rxfrmtoolong
{
  return self->_rxfrmtoolong;
}

- (unint64_t)rxfrmtooshrt
{
  return self->_rxfrmtooshrt;
}

- (unint64_t)rxinvmachdr
{
  return self->_rxinvmachdr;
}

- (unint64_t)rxbadfcs
{
  return self->_rxbadfcs;
}

- (unint64_t)rxbadplcp
{
  return self->_rxbadplcp;
}

- (unint64_t)rxcrsglitch
{
  return self->_rxcrsglitch;
}

- (unint64_t)rxstrt
{
  return self->_rxstrt;
}

@end