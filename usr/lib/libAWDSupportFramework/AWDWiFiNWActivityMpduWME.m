@interface AWDWiFiNWActivityMpduWME
- (BOOL)hasTid0;
- (BOOL)hasTid1;
- (BOOL)hasTid2;
- (BOOL)hasTid3;
- (BOOL)hasTid4;
- (BOOL)hasTid5;
- (BOOL)hasTid6;
- (BOOL)hasTid7;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)tid0;
- (unint64_t)tid1;
- (unint64_t)tid2;
- (unint64_t)tid3;
- (unint64_t)tid4;
- (unint64_t)tid5;
- (unint64_t)tid6;
- (unint64_t)tid7;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTid0:(BOOL)a3;
- (void)setHasTid1:(BOOL)a3;
- (void)setHasTid2:(BOOL)a3;
- (void)setHasTid3:(BOOL)a3;
- (void)setHasTid4:(BOOL)a3;
- (void)setHasTid5:(BOOL)a3;
- (void)setHasTid6:(BOOL)a3;
- (void)setHasTid7:(BOOL)a3;
- (void)setTid0:(unint64_t)a3;
- (void)setTid1:(unint64_t)a3;
- (void)setTid2:(unint64_t)a3;
- (void)setTid3:(unint64_t)a3;
- (void)setTid4:(unint64_t)a3;
- (void)setTid5:(unint64_t)a3;
- (void)setTid6:(unint64_t)a3;
- (void)setTid7:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityMpduWME

- (void)setTid0:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tid0 = a3;
}

- (void)setHasTid0:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTid0
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTid1:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tid1 = a3;
}

- (void)setHasTid1:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTid1
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTid2:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tid2 = a3;
}

- (void)setHasTid2:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTid2
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTid3:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tid3 = a3;
}

- (void)setHasTid3:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTid3
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTid4:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tid4 = a3;
}

- (void)setHasTid4:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTid4
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTid5:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tid5 = a3;
}

- (void)setHasTid5:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTid5
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTid6:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tid6 = a3;
}

- (void)setHasTid6:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTid6
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTid7:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_tid7 = a3;
}

- (void)setHasTid7:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTid7
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityMpduWME;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityMpduWME description](&v3, sel_description), -[AWDWiFiNWActivityMpduWME dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid0] forKey:@"tid0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid1] forKey:@"tid1"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid2] forKey:@"tid2"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid3] forKey:@"tid3"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid4] forKey:@"tid4"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid6] forKey:@"tid6"];
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      return v3;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid7] forKey:@"tid7"];
    return v3;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tid5] forKey:@"tid5"];
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if (has < 0) {
    goto LABEL_17;
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityMpduWMEReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
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
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
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
    *((void *)a3 + 1) = self->_tid0;
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
  *((void *)a3 + 2) = self->_tid1;
  *((unsigned char *)a3 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 3) = self->_tid2;
  *((unsigned char *)a3 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 4) = self->_tid3;
  *((unsigned char *)a3 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 5) = self->_tid4;
  *((unsigned char *)a3 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 6) = self->_tid5;
  *((unsigned char *)a3 + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      return;
    }
LABEL_17:
    *((void *)a3 + 8) = self->_tid7;
    *((unsigned char *)a3 + 72) |= 0x80u;
    return;
  }
LABEL_16:
  *((void *)a3 + 7) = self->_tid6;
  *((unsigned char *)a3 + 72) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_tid0;
    *((unsigned char *)result + 72) |= 1u;
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
  *((void *)result + 2) = self->_tid1;
  *((unsigned char *)result + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 3) = self->_tid2;
  *((unsigned char *)result + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 4) = self->_tid3;
  *((unsigned char *)result + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_tid4;
  *((unsigned char *)result + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 6) = self->_tid5;
  *((unsigned char *)result + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      return result;
    }
LABEL_17:
    *((void *)result + 8) = self->_tid7;
    *((unsigned char *)result + 72) |= 0x80u;
    return result;
  }
LABEL_16:
  *((void *)result + 7) = self->_tid6;
  *((unsigned char *)result + 72) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    goto LABEL_17;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_tid0 != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_tid1 != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_tid2 != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_tid3 != *((void *)a3 + 4)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_tid4 != *((void *)a3 + 5)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_tid5 != *((void *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_tid6 != *((void *)a3 + 7)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = *((char *)a3 + 72) >= 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_tid7 != *((void *)a3 + 8)) {
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
    unint64_t v2 = 2654435761u * self->_tid0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_tid1;
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
    unint64_t v4 = 2654435761u * self->_tid2;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_tid3;
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
    unint64_t v6 = 2654435761u * self->_tid4;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_tid5;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_tid6;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_tid7;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 72);
  if (v3)
  {
    self->_tid0 = *((void *)a3 + 1);
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
  self->_tid1 = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_tid2 = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_tid3 = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_tid4 = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_tid5 = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      return;
    }
LABEL_17:
    self->_tid7 = *((void *)a3 + 8);
    *(unsigned char *)&self->_has |= 0x80u;
    return;
  }
LABEL_16:
  self->_tid6 = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)a3 + 72) & 0x80) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)tid0
{
  return self->_tid0;
}

- (unint64_t)tid1
{
  return self->_tid1;
}

- (unint64_t)tid2
{
  return self->_tid2;
}

- (unint64_t)tid3
{
  return self->_tid3;
}

- (unint64_t)tid4
{
  return self->_tid4;
}

- (unint64_t)tid5
{
  return self->_tid5;
}

- (unint64_t)tid6
{
  return self->_tid6;
}

- (unint64_t)tid7
{
  return self->_tid7;
}

@end