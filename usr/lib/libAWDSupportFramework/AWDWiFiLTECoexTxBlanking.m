@interface AWDWiFiLTECoexTxBlanking
- (BOOL)hasTimestamp;
- (BOOL)hasType4BlankingCount;
- (BOOL)hasType4BlankingTimeInMS;
- (BOOL)hasType4ResumeCount;
- (BOOL)hasType7BlankingCount;
- (BOOL)hasType7BlankingTimeInMS;
- (BOOL)hasType7ResumeCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)type4BlankingCount;
- (unint64_t)type4BlankingTimeInMS;
- (unint64_t)type4ResumeCount;
- (unint64_t)type7BlankingCount;
- (unint64_t)type7BlankingTimeInMS;
- (unint64_t)type7ResumeCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType4BlankingCount:(BOOL)a3;
- (void)setHasType4BlankingTimeInMS:(BOOL)a3;
- (void)setHasType4ResumeCount:(BOOL)a3;
- (void)setHasType7BlankingCount:(BOOL)a3;
- (void)setHasType7BlankingTimeInMS:(BOOL)a3;
- (void)setHasType7ResumeCount:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType4BlankingCount:(unint64_t)a3;
- (void)setType4BlankingTimeInMS:(unint64_t)a3;
- (void)setType4ResumeCount:(unint64_t)a3;
- (void)setType7BlankingCount:(unint64_t)a3;
- (void)setType7BlankingTimeInMS:(unint64_t)a3;
- (void)setType7ResumeCount:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiLTECoexTxBlanking

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType4BlankingCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type4BlankingCount = a3;
}

- (void)setHasType4BlankingCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType4BlankingCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType4ResumeCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type4ResumeCount = a3;
}

- (void)setHasType4ResumeCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType4ResumeCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setType4BlankingTimeInMS:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type4BlankingTimeInMS = a3;
}

- (void)setHasType4BlankingTimeInMS:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType4BlankingTimeInMS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType7BlankingCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type7BlankingCount = a3;
}

- (void)setHasType7BlankingCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType7BlankingCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setType7ResumeCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_type7ResumeCount = a3;
}

- (void)setHasType7ResumeCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasType7ResumeCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setType7BlankingTimeInMS:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_type7BlankingTimeInMS = a3;
}

- (void)setHasType7BlankingTimeInMS:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasType7BlankingTimeInMS
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexTxBlanking;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiLTECoexTxBlanking description](&v3, sel_description), -[AWDWiFiLTECoexTxBlanking dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type4BlankingCount] forKey:@"type4BlankingCount"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type4ResumeCount] forKey:@"type4ResumeCount"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type4BlankingTimeInMS] forKey:@"type4BlankingTimeInMS"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type7ResumeCount] forKey:@"type7ResumeCount"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type7BlankingCount] forKey:@"type7BlankingCount"];
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x20) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type7BlankingTimeInMS] forKey:@"type7BlankingTimeInMS"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTECoexTxBlankingReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_type4BlankingCount;
  *((unsigned char *)a3 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)a3 + 4) = self->_type4ResumeCount;
  *((unsigned char *)a3 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 3) = self->_type4BlankingTimeInMS;
  *((unsigned char *)a3 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 5) = self->_type7BlankingCount;
  *((unsigned char *)a3 + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_15:
    *((void *)a3 + 6) = self->_type7BlankingTimeInMS;
    *((unsigned char *)a3 + 64) |= 0x20u;
    return;
  }
LABEL_14:
  *((void *)a3 + 7) = self->_type7ResumeCount;
  *((unsigned char *)a3 + 64) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_type4BlankingCount;
  *((unsigned char *)result + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 4) = self->_type4ResumeCount;
  *((unsigned char *)result + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_type4BlankingTimeInMS;
  *((unsigned char *)result + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_type7BlankingCount;
  *((unsigned char *)result + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 7) = self->_type7ResumeCount;
  *((unsigned char *)result + 64) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 6) = self->_type7BlankingTimeInMS;
  *((unsigned char *)result + 64) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_type4BlankingCount != *((void *)a3 + 2)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_type4ResumeCount != *((void *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_type4BlankingTimeInMS != *((void *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_type7BlankingCount != *((void *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x40) == 0 || self->_type7ResumeCount != *((void *)a3 + 7)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 64) & 0x20) == 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_type7BlankingTimeInMS != *((void *)a3 + 6)) {
        goto LABEL_36;
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_type4BlankingCount;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_type4ResumeCount;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_type4BlankingTimeInMS;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_type7BlankingCount;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_type7ResumeCount;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_type7BlankingTimeInMS;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 64);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 64);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_type4BlankingCount = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_type4ResumeCount = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_type4BlankingTimeInMS = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_type7BlankingCount = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 64);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_15:
    self->_type7BlankingTimeInMS = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    return;
  }
LABEL_14:
  self->_type7ResumeCount = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)a3 + 64) & 0x20) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)type4BlankingCount
{
  return self->_type4BlankingCount;
}

- (unint64_t)type4ResumeCount
{
  return self->_type4ResumeCount;
}

- (unint64_t)type4BlankingTimeInMS
{
  return self->_type4BlankingTimeInMS;
}

- (unint64_t)type7BlankingCount
{
  return self->_type7BlankingCount;
}

- (unint64_t)type7ResumeCount
{
  return self->_type7ResumeCount;
}

- (unint64_t)type7BlankingTimeInMS
{
  return self->_type7BlankingTimeInMS;
}

@end