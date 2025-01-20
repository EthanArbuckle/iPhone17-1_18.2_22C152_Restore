@interface AWDLibnetcoreConnectionDataUsageSnapshot
- (BOOL)hasBytesIn;
- (BOOL)hasBytesOut;
- (BOOL)hasMultipathBytesInCell;
- (BOOL)hasMultipathBytesInInitial;
- (BOOL)hasMultipathBytesInWiFi;
- (BOOL)hasMultipathBytesOutCell;
- (BOOL)hasMultipathBytesOutInitial;
- (BOOL)hasMultipathBytesOutWiFi;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bytesIn;
- (unint64_t)bytesOut;
- (unint64_t)hash;
- (unint64_t)multipathBytesInCell;
- (unint64_t)multipathBytesInInitial;
- (unint64_t)multipathBytesInWiFi;
- (unint64_t)multipathBytesOutCell;
- (unint64_t)multipathBytesOutInitial;
- (unint64_t)multipathBytesOutWiFi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytesIn:(unint64_t)a3;
- (void)setBytesOut:(unint64_t)a3;
- (void)setHasBytesIn:(BOOL)a3;
- (void)setHasBytesOut:(BOOL)a3;
- (void)setHasMultipathBytesInCell:(BOOL)a3;
- (void)setHasMultipathBytesInInitial:(BOOL)a3;
- (void)setHasMultipathBytesInWiFi:(BOOL)a3;
- (void)setHasMultipathBytesOutCell:(BOOL)a3;
- (void)setHasMultipathBytesOutInitial:(BOOL)a3;
- (void)setHasMultipathBytesOutWiFi:(BOOL)a3;
- (void)setMultipathBytesInCell:(unint64_t)a3;
- (void)setMultipathBytesInInitial:(unint64_t)a3;
- (void)setMultipathBytesInWiFi:(unint64_t)a3;
- (void)setMultipathBytesOutCell:(unint64_t)a3;
- (void)setMultipathBytesOutInitial:(unint64_t)a3;
- (void)setMultipathBytesOutWiFi:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreConnectionDataUsageSnapshot

- (void)setBytesIn:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBytesIn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBytesOut
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMultipathBytesInCell
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMultipathBytesInInitial
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreConnectionDataUsageSnapshot;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreConnectionDataUsageSnapshot description](&v3, sel_description), -[AWDLibnetcoreConnectionDataUsageSnapshot dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesIn] forKey:@"bytesIn"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesOut] forKey:@"bytesOut"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInCell] forKey:@"multipathBytesInCell"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutCell] forKey:@"multipathBytesOutCell"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInWiFi] forKey:@"multipathBytesInWiFi"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInInitial] forKey:@"multipathBytesInInitial"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutWiFi] forKey:@"multipathBytesOutWiFi"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 0x40) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutInitial] forKey:@"multipathBytesOutInitial"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreConnectionDataUsageSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
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
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
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
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_bytesIn;
    *((unsigned char *)a3 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_bytesOut;
  *((unsigned char *)a3 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 3) = self->_multipathBytesInCell;
  *((unsigned char *)a3 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 6) = self->_multipathBytesOutCell;
  *((unsigned char *)a3 + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 5) = self->_multipathBytesInWiFi;
  *((unsigned char *)a3 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 8) = self->_multipathBytesOutWiFi;
  *((unsigned char *)a3 + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      return;
    }
LABEL_17:
    *((void *)a3 + 7) = self->_multipathBytesOutInitial;
    *((unsigned char *)a3 + 72) |= 0x40u;
    return;
  }
LABEL_16:
  *((void *)a3 + 4) = self->_multipathBytesInInitial;
  *((unsigned char *)a3 + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_bytesIn;
    *((unsigned char *)result + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_bytesOut;
  *((unsigned char *)result + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_multipathBytesInCell;
  *((unsigned char *)result + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 6) = self->_multipathBytesOutCell;
  *((unsigned char *)result + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 5) = self->_multipathBytesInWiFi;
  *((unsigned char *)result + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 8) = self->_multipathBytesOutWiFi;
  *((unsigned char *)result + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 4) = self->_multipathBytesInInitial;
  *((unsigned char *)result + 72) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 7) = self->_multipathBytesOutInitial;
  *((unsigned char *)result + 72) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_bytesIn != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_bytesOut != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_multipathBytesInCell != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_multipathBytesOutCell != *((void *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_multipathBytesInWiFi != *((void *)a3 + 5)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_multipathBytesOutWiFi != *((void *)a3 + 8)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_multipathBytesInInitial != *((void *)a3 + 4)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 0x40) == 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_multipathBytesOutInitial != *((void *)a3 + 7)) {
        goto LABEL_41;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_bytesIn;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_bytesOut;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_multipathBytesInCell;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_multipathBytesOutCell;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_multipathBytesInWiFi;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
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
  unint64_t v8 = 2654435761u * self->_multipathBytesInInitial;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_multipathBytesOutInitial;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 72);
  if (v3)
  {
    self->_bytesIn = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 72);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bytesOut = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_multipathBytesInCell = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_multipathBytesOutCell = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_multipathBytesInWiFi = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_multipathBytesOutWiFi = *((void *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      return;
    }
LABEL_17:
    self->_multipathBytesOutInitial = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    return;
  }
LABEL_16:
  self->_multipathBytesInInitial = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 72) & 0x40) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)bytesIn
{
  return self->_bytesIn;
}

- (unint64_t)bytesOut
{
  return self->_bytesOut;
}

- (unint64_t)multipathBytesInCell
{
  return self->_multipathBytesInCell;
}

- (unint64_t)multipathBytesOutCell
{
  return self->_multipathBytesOutCell;
}

- (unint64_t)multipathBytesInWiFi
{
  return self->_multipathBytesInWiFi;
}

- (unint64_t)multipathBytesOutWiFi
{
  return self->_multipathBytesOutWiFi;
}

- (unint64_t)multipathBytesInInitial
{
  return self->_multipathBytesInInitial;
}

- (unint64_t)multipathBytesOutInitial
{
  return self->_multipathBytesOutInitial;
}

@end