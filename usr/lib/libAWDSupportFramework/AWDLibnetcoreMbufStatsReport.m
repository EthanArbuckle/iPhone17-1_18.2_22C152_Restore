@interface AWDLibnetcoreMbufStatsReport
- (BOOL)hasMbuf16KBTotal;
- (BOOL)hasMbuf256BTotal;
- (BOOL)hasMbuf2KBTotal;
- (BOOL)hasMbuf4KBTotal;
- (BOOL)hasMbufDrainCount;
- (BOOL)hasMbufMemReleased;
- (BOOL)hasSockAtMBLimit;
- (BOOL)hasSockMBcnt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)mbuf16KBTotal;
- (unint64_t)mbuf256BTotal;
- (unint64_t)mbuf2KBTotal;
- (unint64_t)mbuf4KBTotal;
- (unint64_t)mbufDrainCount;
- (unint64_t)mbufMemReleased;
- (unint64_t)sockAtMBLimit;
- (unint64_t)sockMBcnt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMbuf16KBTotal:(BOOL)a3;
- (void)setHasMbuf256BTotal:(BOOL)a3;
- (void)setHasMbuf2KBTotal:(BOOL)a3;
- (void)setHasMbuf4KBTotal:(BOOL)a3;
- (void)setHasMbufDrainCount:(BOOL)a3;
- (void)setHasMbufMemReleased:(BOOL)a3;
- (void)setHasSockAtMBLimit:(BOOL)a3;
- (void)setHasSockMBcnt:(BOOL)a3;
- (void)setMbuf16KBTotal:(unint64_t)a3;
- (void)setMbuf256BTotal:(unint64_t)a3;
- (void)setMbuf2KBTotal:(unint64_t)a3;
- (void)setMbuf4KBTotal:(unint64_t)a3;
- (void)setMbufDrainCount:(unint64_t)a3;
- (void)setMbufMemReleased:(unint64_t)a3;
- (void)setSockAtMBLimit:(unint64_t)a3;
- (void)setSockMBcnt:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreMbufStatsReport

- (void)setMbuf256BTotal:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mbuf256BTotal = a3;
}

- (void)setHasMbuf256BTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMbuf256BTotal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMbuf2KBTotal:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mbuf2KBTotal = a3;
}

- (void)setHasMbuf2KBTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMbuf2KBTotal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMbuf4KBTotal:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mbuf4KBTotal = a3;
}

- (void)setHasMbuf4KBTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMbuf4KBTotal
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMbuf16KBTotal:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mbuf16KBTotal = a3;
}

- (void)setHasMbuf16KBTotal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMbuf16KBTotal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSockMBcnt:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_sockMBcnt = a3;
}

- (void)setHasSockMBcnt:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSockMBcnt
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSockAtMBLimit:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_sockAtMBLimit = a3;
}

- (void)setHasSockAtMBLimit:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSockAtMBLimit
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMbufMemReleased:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_mbufMemReleased = a3;
}

- (void)setHasMbufMemReleased:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMbufMemReleased
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMbufDrainCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_mbufDrainCount = a3;
}

- (void)setHasMbufDrainCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMbufDrainCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreMbufStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreMbufStatsReport description](&v3, sel_description), -[AWDLibnetcoreMbufStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbuf256BTotal] forKey:@"mbuf256BTotal"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbuf2KBTotal] forKey:@"mbuf2KBTotal"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbuf4KBTotal] forKey:@"mbuf4KBTotal"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbuf16KBTotal] forKey:@"mbuf16KBTotal"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sockMBcnt] forKey:@"sockMBcnt"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbufMemReleased] forKey:@"mbufMemReleased"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sockAtMBLimit] forKey:@"sockAtMBLimit"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 0x10) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mbufDrainCount] forKey:@"mbufDrainCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreMbufStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
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
  if ((has & 0x20) != 0) {
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
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_mbuf256BTotal;
    *((unsigned char *)a3 + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 3) = self->_mbuf2KBTotal;
  *((unsigned char *)a3 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 4) = self->_mbuf4KBTotal;
  *((unsigned char *)a3 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 1) = self->_mbuf16KBTotal;
  *((unsigned char *)a3 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 8) = self->_sockMBcnt;
  *((unsigned char *)a3 + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 7) = self->_sockAtMBLimit;
  *((unsigned char *)a3 + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_17:
    *((void *)a3 + 5) = self->_mbufDrainCount;
    *((unsigned char *)a3 + 72) |= 0x10u;
    return;
  }
LABEL_16:
  *((void *)a3 + 6) = self->_mbufMemReleased;
  *((unsigned char *)a3 + 72) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_mbuf256BTotal;
    *((unsigned char *)result + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_mbuf2KBTotal;
  *((unsigned char *)result + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 4) = self->_mbuf4KBTotal;
  *((unsigned char *)result + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 1) = self->_mbuf16KBTotal;
  *((unsigned char *)result + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 8) = self->_sockMBcnt;
  *((unsigned char *)result + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 7) = self->_sockAtMBLimit;
  *((unsigned char *)result + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 6) = self->_mbufMemReleased;
  *((unsigned char *)result + 72) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 5) = self->_mbufDrainCount;
  *((unsigned char *)result + 72) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_mbuf256BTotal != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_mbuf2KBTotal != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_mbuf4KBTotal != *((void *)a3 + 4)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_mbuf16KBTotal != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_sockMBcnt != *((void *)a3 + 8)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_sockAtMBLimit != *((void *)a3 + 7)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_mbufMemReleased != *((void *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_mbufDrainCount != *((void *)a3 + 5)) {
        goto LABEL_41;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_mbuf256BTotal;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_mbuf2KBTotal;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_mbuf4KBTotal;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_mbuf16KBTotal;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_sockMBcnt;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_sockAtMBLimit;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
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
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_mbufMemReleased;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_mbufDrainCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 2) != 0)
  {
    self->_mbuf256BTotal = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 72);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mbuf2KBTotal = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_mbuf4KBTotal = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_mbuf16KBTotal = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_sockMBcnt = *((void *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_sockAtMBLimit = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_17:
    self->_mbufDrainCount = *((void *)a3 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_16:
  self->_mbufMemReleased = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 72) & 0x10) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)mbuf256BTotal
{
  return self->_mbuf256BTotal;
}

- (unint64_t)mbuf2KBTotal
{
  return self->_mbuf2KBTotal;
}

- (unint64_t)mbuf4KBTotal
{
  return self->_mbuf4KBTotal;
}

- (unint64_t)mbuf16KBTotal
{
  return self->_mbuf16KBTotal;
}

- (unint64_t)sockMBcnt
{
  return self->_sockMBcnt;
}

- (unint64_t)sockAtMBLimit
{
  return self->_sockAtMBLimit;
}

- (unint64_t)mbufMemReleased
{
  return self->_mbufMemReleased;
}

- (unint64_t)mbufDrainCount
{
  return self->_mbufDrainCount;
}

@end