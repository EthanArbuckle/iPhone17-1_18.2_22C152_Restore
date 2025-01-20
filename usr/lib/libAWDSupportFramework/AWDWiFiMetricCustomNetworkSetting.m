@interface AWDWiFiMetricCustomNetworkSetting
- (BOOL)hasAutoProxySetCount;
- (BOOL)hasBootpSetCount;
- (BOOL)hasCustomNetworkCount;
- (BOOL)hasDhcpSetCount;
- (BOOL)hasManualProxySetCount;
- (BOOL)hasStaticSetCount;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalNetworkCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)autoProxySetCount;
- (unsigned)bootpSetCount;
- (unsigned)customNetworkCount;
- (unsigned)dhcpSetCount;
- (unsigned)manualProxySetCount;
- (unsigned)staticSetCount;
- (unsigned)totalNetworkCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutoProxySetCount:(unsigned int)a3;
- (void)setBootpSetCount:(unsigned int)a3;
- (void)setCustomNetworkCount:(unsigned int)a3;
- (void)setDhcpSetCount:(unsigned int)a3;
- (void)setHasAutoProxySetCount:(BOOL)a3;
- (void)setHasBootpSetCount:(BOOL)a3;
- (void)setHasCustomNetworkCount:(BOOL)a3;
- (void)setHasDhcpSetCount:(BOOL)a3;
- (void)setHasManualProxySetCount:(BOOL)a3;
- (void)setHasStaticSetCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalNetworkCount:(BOOL)a3;
- (void)setManualProxySetCount:(unsigned int)a3;
- (void)setStaticSetCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalNetworkCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricCustomNetworkSetting

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

- (void)setCustomNetworkCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_customNetworkCount = a3;
}

- (void)setHasCustomNetworkCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCustomNetworkCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalNetworkCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_totalNetworkCount = a3;
}

- (void)setHasTotalNetworkCount:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTotalNetworkCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDhcpSetCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_dhcpSetCount = a3;
}

- (void)setHasDhcpSetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDhcpSetCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBootpSetCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_bootpSetCount = a3;
}

- (void)setHasBootpSetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBootpSetCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStaticSetCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_staticSetCount = a3;
}

- (void)setHasStaticSetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStaticSetCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setManualProxySetCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_manualProxySetCount = a3;
}

- (void)setHasManualProxySetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasManualProxySetCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAutoProxySetCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_autoProxySetCount = a3;
}

- (void)setHasAutoProxySetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAutoProxySetCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricCustomNetworkSetting;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricCustomNetworkSetting description](&v3, sel_description), -[AWDWiFiMetricCustomNetworkSetting dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_customNetworkCount] forKey:@"customNetworkCount"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalNetworkCount] forKey:@"totalNetworkCount"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dhcpSetCount] forKey:@"dhcpSetCount"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bootpSetCount] forKey:@"bootpSetCount"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_manualProxySetCount] forKey:@"manualProxySetCount"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_staticSetCount] forKey:@"staticSetCount"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 2) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_autoProxySetCount] forKey:@"autoProxySetCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricCustomNetworkSettingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 2) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_customNetworkCount;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 10) = self->_totalNetworkCount;
  *((unsigned char *)a3 + 44) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 7) = self->_dhcpSetCount;
  *((unsigned char *)a3 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_bootpSetCount;
  *((unsigned char *)a3 + 44) |= 4u;
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
  *((_DWORD *)a3 + 9) = self->_staticSetCount;
  *((unsigned char *)a3 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      return;
    }
LABEL_17:
    *((_DWORD *)a3 + 4) = self->_autoProxySetCount;
    *((unsigned char *)a3 + 44) |= 2u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 8) = self->_manualProxySetCount;
  *((unsigned char *)a3 + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_customNetworkCount;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 10) = self->_totalNetworkCount;
  *((unsigned char *)result + 44) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_dhcpSetCount;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_bootpSetCount;
  *((unsigned char *)result + 44) |= 4u;
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
  *((_DWORD *)result + 9) = self->_staticSetCount;
  *((unsigned char *)result + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_manualProxySetCount;
  *((unsigned char *)result + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_autoProxySetCount;
  *((unsigned char *)result + 44) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_customNetworkCount != *((_DWORD *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x80) == 0 || self->_totalNetworkCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_dhcpSetCount != *((_DWORD *)a3 + 7)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_bootpSetCount != *((_DWORD *)a3 + 5)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x40) == 0 || self->_staticSetCount != *((_DWORD *)a3 + 9)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x20) == 0 || self->_manualProxySetCount != *((_DWORD *)a3 + 8)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_autoProxySetCount != *((_DWORD *)a3 + 4)) {
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_customNetworkCount;
      if ((*(unsigned char *)&self->_has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_totalNetworkCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_dhcpSetCount;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_bootpSetCount;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_staticSetCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_manualProxySetCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_autoProxySetCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 44);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_customNetworkCount = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_totalNetworkCount = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_dhcpSetCount = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_bootpSetCount = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_staticSetCount = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_17:
    self->_autoProxySetCount = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_16:
  self->_manualProxySetCount = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 44) & 2) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)customNetworkCount
{
  return self->_customNetworkCount;
}

- (unsigned)totalNetworkCount
{
  return self->_totalNetworkCount;
}

- (unsigned)dhcpSetCount
{
  return self->_dhcpSetCount;
}

- (unsigned)bootpSetCount
{
  return self->_bootpSetCount;
}

- (unsigned)staticSetCount
{
  return self->_staticSetCount;
}

- (unsigned)manualProxySetCount
{
  return self->_manualProxySetCount;
}

- (unsigned)autoProxySetCount
{
  return self->_autoProxySetCount;
}

@end