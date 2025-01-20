@interface AWDChipErrorCountersTx
- (BOOL)hasTxchanrej;
- (BOOL)hasTxexptime;
- (BOOL)hasTxphycrs;
- (BOOL)hasTxphyerr;
- (BOOL)hasTxuflo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txchanrej;
- (unint64_t)txexptime;
- (unint64_t)txphycrs;
- (unint64_t)txphyerr;
- (unint64_t)txuflo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTxchanrej:(BOOL)a3;
- (void)setHasTxexptime:(BOOL)a3;
- (void)setHasTxphycrs:(BOOL)a3;
- (void)setHasTxphyerr:(BOOL)a3;
- (void)setHasTxuflo:(BOOL)a3;
- (void)setTxchanrej:(unint64_t)a3;
- (void)setTxexptime:(unint64_t)a3;
- (void)setTxphycrs:(unint64_t)a3;
- (void)setTxphyerr:(unint64_t)a3;
- (void)setTxuflo:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDChipErrorCountersTx

- (void)setTxuflo:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_txuflo = a3;
}

- (void)setHasTxuflo:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTxuflo
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTxphyerr:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_txphyerr = a3;
}

- (void)setHasTxphyerr:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxphyerr
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTxphycrs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_txphycrs = a3;
}

- (void)setHasTxphycrs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxphycrs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTxchanrej:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_txchanrej = a3;
}

- (void)setHasTxchanrej:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxchanrej
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTxexptime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_txexptime = a3;
}

- (void)setHasTxexptime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTxexptime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDChipErrorCountersTx;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDChipErrorCountersTx description](&v3, sel_description), -[AWDChipErrorCountersTx dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txuflo] forKey:@"txuflo"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txphyerr] forKey:@"txphyerr"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txchanrej] forKey:@"txchanrej"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txphycrs] forKey:@"txphycrs"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txexptime] forKey:@"txexptime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipErrorCountersTxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_txuflo;
    *((unsigned char *)a3 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_txphyerr;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((void *)a3 + 3) = self->_txphycrs;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((void *)a3 + 2) = self->_txexptime;
    *((unsigned char *)a3 + 48) |= 2u;
    return;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_txchanrej;
  *((unsigned char *)a3 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)result + 5) = self->_txuflo;
    *((unsigned char *)result + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_txphyerr;
  *((unsigned char *)result + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 3) = self->_txphycrs;
  *((unsigned char *)result + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 1) = self->_txchanrej;
  *((unsigned char *)result + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 2) = self->_txexptime;
  *((unsigned char *)result + 48) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_txuflo != *((void *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_txphyerr != *((void *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_txphycrs != *((void *)a3 + 3)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_26;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_txchanrej != *((void *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_txexptime != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unint64_t v2 = 2654435761u * self->_txuflo;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_txphyerr;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_txphycrs;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_txchanrej;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_txexptime;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x10) != 0)
  {
    self->_txuflo = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_txphyerr = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_txphycrs = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_txexptime = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_txchanrej = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 48) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)txuflo
{
  return self->_txuflo;
}

- (unint64_t)txphyerr
{
  return self->_txphyerr;
}

- (unint64_t)txphycrs
{
  return self->_txphycrs;
}

- (unint64_t)txchanrej
{
  return self->_txchanrej;
}

- (unint64_t)txexptime
{
  return self->_txexptime;
}

@end