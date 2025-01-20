@interface AWDWiFiMetricsManagerBTCoexModeChange
- (BOOL)hasA2dpConnectionCount;
- (BOOL)hasClamshellClosed;
- (BOOL)hasCoexMode;
- (BOOL)hasHidConnectionCount;
- (BOOL)hasRssi;
- (BOOL)hasScoConnectionCount;
- (BOOL)hasTimestamp;
- (BOOL)hasWifiInfraChainConfig;
- (BOOL)hasWifiInfraChannel;
- (BOOL)hasWifiInfraPhyMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)rssi;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)a2dpConnectionCount;
- (unsigned)clamshellClosed;
- (unsigned)coexMode;
- (unsigned)hidConnectionCount;
- (unsigned)scoConnectionCount;
- (unsigned)wifiInfraChainConfig;
- (unsigned)wifiInfraChannel;
- (unsigned)wifiInfraPhyMode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setA2dpConnectionCount:(unsigned int)a3;
- (void)setClamshellClosed:(unsigned int)a3;
- (void)setCoexMode:(unsigned int)a3;
- (void)setHasA2dpConnectionCount:(BOOL)a3;
- (void)setHasClamshellClosed:(BOOL)a3;
- (void)setHasCoexMode:(BOOL)a3;
- (void)setHasHidConnectionCount:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasScoConnectionCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWifiInfraChainConfig:(BOOL)a3;
- (void)setHasWifiInfraChannel:(BOOL)a3;
- (void)setHasWifiInfraPhyMode:(BOOL)a3;
- (void)setHidConnectionCount:(unsigned int)a3;
- (void)setRssi:(int)a3;
- (void)setScoConnectionCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWifiInfraChainConfig:(unsigned int)a3;
- (void)setWifiInfraChannel:(unsigned int)a3;
- (void)setWifiInfraPhyMode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerBTCoexModeChange

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCoexMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_coexMode = a3;
}

- (void)setHasCoexMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCoexMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setA2dpConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_a2dpConnectionCount = a3;
}

- (void)setHasA2dpConnectionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasA2dpConnectionCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHidConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hidConnectionCount = a3;
}

- (void)setHasHidConnectionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHidConnectionCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScoConnectionCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scoConnectionCount = a3;
}

- (void)setHasScoConnectionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScoConnectionCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWifiInfraChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_wifiInfraChannel = a3;
}

- (void)setHasWifiInfraChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWifiInfraChannel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWifiInfraChainConfig:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_wifiInfraChainConfig = a3;
}

- (void)setHasWifiInfraChainConfig:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWifiInfraChainConfig
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWifiInfraPhyMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wifiInfraPhyMode = a3;
}

- (void)setHasWifiInfraPhyMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWifiInfraPhyMode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setClamshellClosed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clamshellClosed = a3;
}

- (void)setHasClamshellClosed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClamshellClosed
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexModeChange;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerBTCoexModeChange description](&v3, sel_description), -[AWDWiFiMetricsManagerBTCoexModeChange dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coexMode] forKey:@"coexMode"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_a2dpConnectionCount] forKey:@"a2dpConnectionCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hidConnectionCount] forKey:@"hidConnectionCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scoConnectionCount] forKey:@"scoConnectionCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiInfraChannel] forKey:@"wifiInfraChannel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiInfraChainConfig] forKey:@"wifiInfraChainConfig"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_clamshellClosed] forKey:@"clamshellClosed"];
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiInfraPhyMode] forKey:@"wifiInfraPhyMode"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x20) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_rssi] forKey:@"rssi"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBTCoexModeChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_coexMode;
  *((_WORD *)a3 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_a2dpConnectionCount;
  *((_WORD *)a3 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_hidConnectionCount;
  *((_WORD *)a3 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 9) = self->_scoConnectionCount;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_wifiInfraChannel;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_wifiInfraChainConfig;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_wifiInfraPhyMode;
  *((_WORD *)a3 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_21:
    *((_DWORD *)a3 + 8) = self->_rssi;
    *((_WORD *)a3 + 26) |= 0x20u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_clamshellClosed;
  *((_WORD *)a3 + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_coexMode;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_a2dpConnectionCount;
  *((_WORD *)result + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 7) = self->_hidConnectionCount;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_scoConnectionCount;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_wifiInfraChannel;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_wifiInfraChainConfig;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_wifiInfraPhyMode;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_clamshellClosed;
  *((_WORD *)result + 26) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_rssi;
  *((_WORD *)result + 26) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 26);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_51;
      }
    }
    else if (v7)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_coexMode != *((_DWORD *)a3 + 6)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_a2dpConnectionCount != *((_DWORD *)a3 + 4)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_hidConnectionCount != *((_DWORD *)a3 + 7)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_scoConnectionCount != *((_DWORD *)a3 + 9)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_wifiInfraChannel != *((_DWORD *)a3 + 11)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_wifiInfraChainConfig != *((_DWORD *)a3 + 10)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x200) == 0 || self->_wifiInfraPhyMode != *((_DWORD *)a3 + 12)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_clamshellClosed != *((_DWORD *)a3 + 5)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_rssi != *((_DWORD *)a3 + 8)) {
        goto LABEL_51;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_coexMode;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_a2dpConnectionCount;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_hidConnectionCount;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_scoConnectionCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_wifiInfraChannel;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_wifiInfraChainConfig;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_wifiInfraPhyMode;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 4) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_clamshellClosed;
  if ((has & 0x20) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_rssi;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 26);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v3 = *((_WORD *)a3 + 26);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_coexMode = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_a2dpConnectionCount = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_hidConnectionCount = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_scoConnectionCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_wifiInfraChannel = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_wifiInfraChainConfig = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_9:
    if ((v3 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_wifiInfraPhyMode = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_21:
    self->_rssi = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 0x20u;
    return;
  }
LABEL_20:
  self->_clamshellClosed = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 26) & 0x20) != 0) {
    goto LABEL_21;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)coexMode
{
  return self->_coexMode;
}

- (unsigned)a2dpConnectionCount
{
  return self->_a2dpConnectionCount;
}

- (unsigned)hidConnectionCount
{
  return self->_hidConnectionCount;
}

- (unsigned)scoConnectionCount
{
  return self->_scoConnectionCount;
}

- (unsigned)wifiInfraChannel
{
  return self->_wifiInfraChannel;
}

- (unsigned)wifiInfraChainConfig
{
  return self->_wifiInfraChainConfig;
}

- (unsigned)wifiInfraPhyMode
{
  return self->_wifiInfraPhyMode;
}

- (unsigned)clamshellClosed
{
  return self->_clamshellClosed;
}

- (int)rssi
{
  return self->_rssi;
}

@end