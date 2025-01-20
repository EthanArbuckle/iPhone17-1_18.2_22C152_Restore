@interface AWDWifiAwdlD2dMigrationStats
- (BOOL)hasAvgCCA;
- (BOOL)hasChannel;
- (BOOL)hasMigrationRole;
- (BOOL)hasPeerRssi;
- (BOOL)hasRxBytes;
- (BOOL)hasSessionDuration;
- (BOOL)hasTxBytes;
- (BOOL)hasTxFailureCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)peerRssi;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)sessionDuration;
- (unint64_t)txBytes;
- (unsigned)avgCCA;
- (unsigned)channel;
- (unsigned)migrationRole;
- (unsigned)txFailureCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgCCA:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setHasAvgCCA:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasMigrationRole:(BOOL)a3;
- (void)setHasPeerRssi:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasSessionDuration:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxFailureCount:(BOOL)a3;
- (void)setMigrationRole:(unsigned int)a3;
- (void)setPeerRssi:(int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setSessionDuration:(unint64_t)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxFailureCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiAwdlD2dMigrationStats

- (void)setSessionDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionDuration = a3;
}

- (void)setHasSessionDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRxBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPeerRssi:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_peerRssi = a3;
}

- (void)setHasPeerRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPeerRssi
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTxFailureCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_txFailureCount = a3;
}

- (void)setHasTxFailureCount:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTxFailureCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTxBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMigrationRole:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_migrationRole = a3;
}

- (void)setHasMigrationRole:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMigrationRole
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAvgCCA:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_avgCCA = a3;
}

- (void)setHasAvgCCA:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAvgCCA
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlD2dMigrationStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiAwdlD2dMigrationStats description](&v3, sel_description), -[AWDWifiAwdlD2dMigrationStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sessionDuration] forKey:@"sessionDuration"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxBytes] forKey:@"rxBytes"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_peerRssi] forKey:@"peerRssi"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txFailureCount] forKey:@"txFailureCount"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_migrationRole] forKey:@"migrationRole"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytes] forKey:@"txBytes"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 8) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_avgCCA] forKey:@"avgCCA"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAwdlD2dMigrationStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
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
  if ((has & 8) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_sessionDuration;
    *((unsigned char *)a3 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 9) = self->_channel;
  *((unsigned char *)a3 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 1) = self->_rxBytes;
  *((unsigned char *)a3 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 11) = self->_peerRssi;
  *((unsigned char *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 12) = self->_txFailureCount;
  *((unsigned char *)a3 + 52) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 3) = self->_txBytes;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      return;
    }
LABEL_17:
    *((_DWORD *)a3 + 8) = self->_avgCCA;
    *((unsigned char *)a3 + 52) |= 8u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_migrationRole;
  *((unsigned char *)a3 + 52) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_sessionDuration;
    *((unsigned char *)result + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_channel;
  *((unsigned char *)result + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 1) = self->_rxBytes;
  *((unsigned char *)result + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 11) = self->_peerRssi;
  *((unsigned char *)result + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 12) = self->_txFailureCount;
  *((unsigned char *)result + 52) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 3) = self->_txBytes;
  *((unsigned char *)result + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_migrationRole;
  *((unsigned char *)result + 52) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 8) = self->_avgCCA;
  *((unsigned char *)result + 52) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_sessionDuration != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 9)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_rxBytes != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 52))
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_peerRssi != *((_DWORD *)a3 + 11)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x80) == 0 || self->_txFailureCount != *((_DWORD *)a3 + 12)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_txBytes != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_migrationRole != *((_DWORD *)a3 + 10)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_avgCCA != *((_DWORD *)a3 + 8)) {
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
    unint64_t v2 = 2654435761u * self->_sessionDuration;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_channel;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_rxBytes;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_peerRssi;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_txFailureCount;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_txBytes;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_migrationRole;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_avgCCA;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 2) != 0)
  {
    self->_sessionDuration = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 52);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_channel = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_rxBytes = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_peerRssi = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_txFailureCount = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_txBytes = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_17:
    self->_avgCCA = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_16:
  self->_migrationRole = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 52) & 8) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)sessionDuration
{
  return self->_sessionDuration;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (int)peerRssi
{
  return self->_peerRssi;
}

- (unsigned)txFailureCount
{
  return self->_txFailureCount;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unsigned)migrationRole
{
  return self->_migrationRole;
}

- (unsigned)avgCCA
{
  return self->_avgCCA;
}

@end