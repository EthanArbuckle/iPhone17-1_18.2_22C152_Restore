@interface WiFiAnalyticsAWDWiFiNWActivityMpduWME
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

@implementation WiFiAnalyticsAWDWiFiNWActivityMpduWME

- (void)setTid7:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_tid7 = a3;
}

- (void)setTid6:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tid6 = a3;
}

- (void)setTid5:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tid5 = a3;
}

- (void)setTid4:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tid4 = a3;
}

- (void)setTid3:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tid3 = a3;
}

- (void)setTid2:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tid2 = a3;
}

- (void)setTid1:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tid1 = a3;
}

- (void)setTid0:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tid0 = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_14;
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
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
LABEL_9:
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_tid0];
    [v3 setObject:v6 forKey:@"tid0"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = [NSNumber numberWithUnsignedLongLong:self->_tid1];
  [v3 setObject:v7 forKey:@"tid1"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v8 = [NSNumber numberWithUnsignedLongLong:self->_tid2];
  [v3 setObject:v8 forKey:@"tid2"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_tid3];
  [v3 setObject:v9 forKey:@"tid3"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_tid4];
  [v3 setObject:v10 forKey:@"tid4"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    v12 = [NSNumber numberWithUnsignedLongLong:self->_tid6];
    [v3 setObject:v12 forKey:@"tid6"];

    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_tid5];
  [v3 setObject:v11 forKey:@"tid5"];

  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  v13 = [NSNumber numberWithUnsignedLongLong:self->_tid7];
  [v3 setObject:v13 forKey:@"tid7"];

LABEL_9:
  return v3;
}

- (void)setHasTid0:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTid0
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTid1:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTid1
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTid2:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTid2
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTid3:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTid3
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTid4:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTid4
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasTid5:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTid5
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTid6:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTid6
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTid7:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTid7
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityMpduWME;
  v4 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityMpduWME *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityMpduWMEReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_tid0;
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_tid1;
  *((unsigned char *)v4 + 72) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[3] = self->_tid2;
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[4] = self->_tid3;
  *((unsigned char *)v4 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[5] = self->_tid4;
  *((unsigned char *)v4 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    v4[7] = self->_tid6;
    *((unsigned char *)v4 + 72) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  v4[6] = self->_tid5;
  *((unsigned char *)v4 + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  v4[8] = self->_tid7;
  *((unsigned char *)v4 + 72) |= 0x80u;
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[72] & 1) == 0 || self->_tid0 != *((void *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (v4[72])
  {
LABEL_41:
    BOOL v5 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[72] & 2) == 0 || self->_tid1 != *((void *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[72] & 4) == 0 || self->_tid2 != *((void *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[72] & 8) == 0 || self->_tid3 != *((void *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[72] & 0x10) == 0 || self->_tid4 != *((void *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[72] & 0x20) == 0 || self->_tid5 != *((void *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[72] & 0x40) == 0 || self->_tid6 != *((void *)v4 + 7)) {
      goto LABEL_41;
    }
  }
  else if ((v4[72] & 0x40) != 0)
  {
    goto LABEL_41;
  }
  BOOL v5 = v4[72] >= 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v4[72] & 0x80) == 0 || self->_tid7 != *((void *)v4 + 8)) {
      goto LABEL_41;
    }
    BOOL v5 = 1;
  }
LABEL_42:

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
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 72);
  if (v5)
  {
    self->_tid0 = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 72);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_tid1 = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_tid2 = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_tid3 = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_tid4 = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    self->_tid6 = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
    if ((*((unsigned char *)v4 + 72) & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  self->_tid5 = *((void *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v5 & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  self->_tid7 = *((void *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_9:
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