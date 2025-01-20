@interface AWDWiFiLprxStats
- (BOOL)hasLprxEnterCnt;
- (BOOL)hasLprxExitCnt;
- (BOOL)hasPhyActiveCount;
- (BOOL)hasPhyActiveDuration;
- (BOOL)hasPhySearchCount;
- (BOOL)hasPhySearchDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)phyActiveDuration;
- (unint64_t)phySearchDuration;
- (unint64_t)timestamp;
- (unsigned)lprxEnterCnt;
- (unsigned)lprxExitCnt;
- (unsigned)phyActiveCount;
- (unsigned)phySearchCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLprxEnterCnt:(BOOL)a3;
- (void)setHasLprxExitCnt:(BOOL)a3;
- (void)setHasPhyActiveCount:(BOOL)a3;
- (void)setHasPhyActiveDuration:(BOOL)a3;
- (void)setHasPhySearchCount:(BOOL)a3;
- (void)setHasPhySearchDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLprxEnterCnt:(unsigned int)a3;
- (void)setLprxExitCnt:(unsigned int)a3;
- (void)setPhyActiveCount:(unsigned int)a3;
- (void)setPhyActiveDuration:(unint64_t)a3;
- (void)setPhySearchCount:(unsigned int)a3;
- (void)setPhySearchDuration:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiLprxStats

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPhySearchDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_phySearchDuration = a3;
}

- (void)setHasPhySearchDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPhySearchDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPhySearchCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_phySearchCount = a3;
}

- (void)setHasPhySearchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPhySearchCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPhyActiveDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_phyActiveDuration = a3;
}

- (void)setHasPhyActiveDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhyActiveDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPhyActiveCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_phyActiveCount = a3;
}

- (void)setHasPhyActiveCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPhyActiveCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLprxEnterCnt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_lprxEnterCnt = a3;
}

- (void)setHasLprxEnterCnt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLprxEnterCnt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLprxExitCnt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_lprxExitCnt = a3;
}

- (void)setHasLprxExitCnt:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLprxExitCnt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLprxStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiLprxStats description](&v3, sel_description), -[AWDWiFiLprxStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
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
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_phySearchDuration] forKey:@"phySearchDuration"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phySearchCount] forKey:@"phySearchCount"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_phyActiveDuration] forKey:@"phyActiveDuration"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lprxEnterCnt] forKey:@"lprx_enter_cnt"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phyActiveCount] forKey:@"phyActiveCount"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x10) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lprxExitCnt] forKey:@"lprx_exit_cnt"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLprxStatsReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_11;
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
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_phySearchDuration;
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 11) = self->_phySearchCount;
  *((unsigned char *)a3 + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_phyActiveDuration;
  *((unsigned char *)a3 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 10) = self->_phyActiveCount;
  *((unsigned char *)a3 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 9) = self->_lprxExitCnt;
    *((unsigned char *)a3 + 48) |= 0x10u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 8) = self->_lprxEnterCnt;
  *((unsigned char *)a3 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 48) |= 4u;
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
  *((void *)result + 2) = self->_phySearchDuration;
  *((unsigned char *)result + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 11) = self->_phySearchCount;
  *((unsigned char *)result + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 1) = self->_phyActiveDuration;
  *((unsigned char *)result + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 10) = self->_phyActiveCount;
  *((unsigned char *)result + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 8) = self->_lprxEnterCnt;
  *((unsigned char *)result + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 9) = self->_lprxExitCnt;
  *((unsigned char *)result + 48) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_phySearchDuration != *((void *)a3 + 2)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_phySearchCount != *((_DWORD *)a3 + 11)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_phyActiveDuration != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_phyActiveCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_lprxEnterCnt != *((_DWORD *)a3 + 8)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_lprxExitCnt != *((_DWORD *)a3 + 9)) {
        goto LABEL_36;
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_phySearchDuration;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
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
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_phySearchCount;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_phyActiveDuration;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_phyActiveCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_lprxEnterCnt;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_lprxExitCnt;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_phySearchDuration = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_phySearchCount = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_phyActiveDuration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_phyActiveCount = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_15:
    self->_lprxExitCnt = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_14:
  self->_lprxEnterCnt = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 48) & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)phySearchDuration
{
  return self->_phySearchDuration;
}

- (unsigned)phySearchCount
{
  return self->_phySearchCount;
}

- (unint64_t)phyActiveDuration
{
  return self->_phyActiveDuration;
}

- (unsigned)phyActiveCount
{
  return self->_phyActiveCount;
}

- (unsigned)lprxEnterCnt
{
  return self->_lprxEnterCnt;
}

- (unsigned)lprxExitCnt
{
  return self->_lprxExitCnt;
}

@end