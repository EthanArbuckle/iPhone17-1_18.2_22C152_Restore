@interface AWDControlFrames
- (BOOL)hasAck;
- (BOOL)hasBlockAck;
- (BOOL)hasBlockAckRequest;
- (BOOL)hasCFend;
- (BOOL)hasCFendCFack;
- (BOOL)hasCts;
- (BOOL)hasPsPoll;
- (BOOL)hasRts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)ack;
- (unint64_t)blockAck;
- (unint64_t)blockAckRequest;
- (unint64_t)cFend;
- (unint64_t)cFendCFack;
- (unint64_t)cts;
- (unint64_t)hash;
- (unint64_t)psPoll;
- (unint64_t)rts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAck:(unint64_t)a3;
- (void)setBlockAck:(unint64_t)a3;
- (void)setBlockAckRequest:(unint64_t)a3;
- (void)setCFend:(unint64_t)a3;
- (void)setCFendCFack:(unint64_t)a3;
- (void)setCts:(unint64_t)a3;
- (void)setHasAck:(BOOL)a3;
- (void)setHasBlockAck:(BOOL)a3;
- (void)setHasBlockAckRequest:(BOOL)a3;
- (void)setHasCFend:(BOOL)a3;
- (void)setHasCFendCFack:(BOOL)a3;
- (void)setHasCts:(BOOL)a3;
- (void)setHasPsPoll:(BOOL)a3;
- (void)setHasRts:(BOOL)a3;
- (void)setPsPoll:(unint64_t)a3;
- (void)setRts:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDControlFrames

- (void)setBlockAckRequest:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_blockAckRequest = a3;
}

- (void)setHasBlockAckRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBlockAckRequest
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBlockAck:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_blockAck = a3;
}

- (void)setHasBlockAck:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBlockAck
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPsPoll:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_psPoll = a3;
}

- (void)setHasPsPoll:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPsPoll
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRts:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_rts = a3;
}

- (void)setHasRts:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasRts
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCts:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_cts = a3;
}

- (void)setHasCts:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCts
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAck:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ack = a3;
}

- (void)setHasAck:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAck
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCFend:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_cFend = a3;
}

- (void)setHasCFend:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCFend
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCFendCFack:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_cFendCFack = a3;
}

- (void)setHasCFendCFack:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCFendCFack
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDControlFrames;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDControlFrames description](&v3, sel_description), -[AWDControlFrames dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_blockAckRequest] forKey:@"blockAckRequest"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_blockAck] forKey:@"blockAck"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_psPoll] forKey:@"psPoll"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rts] forKey:@"rts"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cts] forKey:@"cts"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cFend] forKey:@"CFend"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ack] forKey:@"ack"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 0x10) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cFendCFack] forKey:@"CFendCFack"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDControlFramesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_blockAckRequest;
    *((unsigned char *)a3 + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_blockAck;
  *((unsigned char *)a3 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 7) = self->_psPoll;
  *((unsigned char *)a3 + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 8) = self->_rts;
  *((unsigned char *)a3 + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 6) = self->_cts;
  *((unsigned char *)a3 + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 1) = self->_ack;
  *((unsigned char *)a3 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_17:
    *((void *)a3 + 5) = self->_cFendCFack;
    *((unsigned char *)a3 + 72) |= 0x10u;
    return;
  }
LABEL_16:
  *((void *)a3 + 4) = self->_cFend;
  *((unsigned char *)a3 + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_blockAckRequest;
    *((unsigned char *)result + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_blockAck;
  *((unsigned char *)result + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 7) = self->_psPoll;
  *((unsigned char *)result + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 8) = self->_rts;
  *((unsigned char *)result + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 6) = self->_cts;
  *((unsigned char *)result + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 1) = self->_ack;
  *((unsigned char *)result + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 4) = self->_cFend;
  *((unsigned char *)result + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 5) = self->_cFendCFack;
  *((unsigned char *)result + 72) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_blockAckRequest != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_blockAck != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_psPoll != *((void *)a3 + 7)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_rts != *((void *)a3 + 8)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_cts != *((void *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_ack != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_cFend != *((void *)a3 + 4)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_cFendCFack != *((void *)a3 + 5)) {
        goto LABEL_41;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_blockAckRequest;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_blockAck;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_psPoll;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_rts;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_cts;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_ack;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_cFend;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_cFendCFack;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 4) != 0)
  {
    self->_blockAckRequest = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 72);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_blockAck = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_psPoll = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_rts = *((void *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_cts = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_ack = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_17:
    self->_cFendCFack = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_16:
  self->_cFend = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 72) & 0x10) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)blockAckRequest
{
  return self->_blockAckRequest;
}

- (unint64_t)blockAck
{
  return self->_blockAck;
}

- (unint64_t)psPoll
{
  return self->_psPoll;
}

- (unint64_t)rts
{
  return self->_rts;
}

- (unint64_t)cts
{
  return self->_cts;
}

- (unint64_t)ack
{
  return self->_ack;
}

- (unint64_t)cFend
{
  return self->_cFend;
}

- (unint64_t)cFendCFack
{
  return self->_cFendCFack;
}

@end