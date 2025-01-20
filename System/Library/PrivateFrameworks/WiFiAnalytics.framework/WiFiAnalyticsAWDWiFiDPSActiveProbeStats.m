@interface WiFiAnalyticsAWDWiFiDPSActiveProbeStats
- (BOOL)hasRttGatewayBE;
- (BOOL)hasRttGatewayBK;
- (BOOL)hasRttGatewayVI;
- (BOOL)hasRttGatewayVO;
- (BOOL)hasRttPrimaryDnsBE;
- (BOOL)hasRttPrimaryDnsBK;
- (BOOL)hasRttPrimaryDnsVI;
- (BOOL)hasRttPrimaryDnsVO;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)rttGatewayBE;
- (unsigned)rttGatewayBK;
- (unsigned)rttGatewayVI;
- (unsigned)rttGatewayVO;
- (unsigned)rttPrimaryDnsBE;
- (unsigned)rttPrimaryDnsBK;
- (unsigned)rttPrimaryDnsVI;
- (unsigned)rttPrimaryDnsVO;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRttGatewayBE:(BOOL)a3;
- (void)setHasRttGatewayBK:(BOOL)a3;
- (void)setHasRttGatewayVI:(BOOL)a3;
- (void)setHasRttGatewayVO:(BOOL)a3;
- (void)setHasRttPrimaryDnsBE:(BOOL)a3;
- (void)setHasRttPrimaryDnsBK:(BOOL)a3;
- (void)setHasRttPrimaryDnsVI:(BOOL)a3;
- (void)setHasRttPrimaryDnsVO:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRttGatewayBE:(unsigned int)a3;
- (void)setRttGatewayBK:(unsigned int)a3;
- (void)setRttGatewayVI:(unsigned int)a3;
- (void)setRttGatewayVO:(unsigned int)a3;
- (void)setRttPrimaryDnsBE:(unsigned int)a3;
- (void)setRttPrimaryDnsBK:(unsigned int)a3;
- (void)setRttPrimaryDnsVI:(unsigned int)a3;
- (void)setRttPrimaryDnsVO:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiDPSActiveProbeStats

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

- (void)setRttGatewayBE:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rttGatewayBE = a3;
}

- (void)setHasRttGatewayBE:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRttGatewayBE
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRttGatewayBK:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rttGatewayBK = a3;
}

- (void)setHasRttGatewayBK:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRttGatewayBK
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRttGatewayVO:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rttGatewayVO = a3;
}

- (void)setHasRttGatewayVO:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRttGatewayVO
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRttGatewayVI:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rttGatewayVI = a3;
}

- (void)setHasRttGatewayVI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRttGatewayVI
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRttPrimaryDnsBE:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rttPrimaryDnsBE = a3;
}

- (void)setHasRttPrimaryDnsBE:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRttPrimaryDnsBE
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRttPrimaryDnsBK:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rttPrimaryDnsBK = a3;
}

- (void)setHasRttPrimaryDnsBK:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRttPrimaryDnsBK
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRttPrimaryDnsVO:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rttPrimaryDnsVO = a3;
}

- (void)setHasRttPrimaryDnsVO:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRttPrimaryDnsVO
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRttPrimaryDnsVI:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rttPrimaryDnsVI = a3;
}

- (void)setHasRttPrimaryDnsVI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRttPrimaryDnsVI
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSActiveProbeStats;
  v4 = [(WiFiAnalyticsAWDWiFiDPSActiveProbeStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiDPSActiveProbeStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_rttGatewayBE];
  [v3 setObject:v8 forKey:@"rttGatewayBE"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithUnsignedInt:self->_rttGatewayBK];
  [v3 setObject:v9 forKey:@"rttGatewayBK"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithUnsignedInt:self->_rttGatewayVO];
  [v3 setObject:v10 forKey:@"rttGatewayVO"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedInt:self->_rttGatewayVI];
  [v3 setObject:v11 forKey:@"rttGatewayVI"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithUnsignedInt:self->_rttPrimaryDnsBE];
  [v3 setObject:v12 forKey:@"rttPrimaryDnsBE"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithUnsignedInt:self->_rttPrimaryDnsBK];
  [v3 setObject:v13 forKey:@"rttPrimaryDnsBK"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithUnsignedInt:self->_rttPrimaryDnsVO];
  [v3 setObject:v14 forKey:@"rttPrimaryDnsVO"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithUnsignedInt:self->_rttPrimaryDnsVI];
    [v3 setObject:v5 forKey:@"rttPrimaryDnsVI"];
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSActiveProbeStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_rttGatewayBE;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 5) = self->_rttGatewayBK;
  *((_WORD *)v4 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 7) = self->_rttGatewayVO;
  *((_WORD *)v4 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 6) = self->_rttGatewayVI;
  *((_WORD *)v4 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = self->_rttPrimaryDnsBE;
  *((_WORD *)v4 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 9) = self->_rttPrimaryDnsBK;
  *((_WORD *)v4 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  *((_DWORD *)v4 + 11) = self->_rttPrimaryDnsVO;
  *((_WORD *)v4 + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 10) = self->_rttPrimaryDnsVI;
    *((_WORD *)v4 + 24) |= 0x80u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_rttGatewayBE;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_rttGatewayBK;
  *((_WORD *)result + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_rttGatewayVO;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_rttGatewayVI;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_rttPrimaryDnsBE;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_rttPrimaryDnsBK;
  *((_WORD *)result + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 11) = self->_rttPrimaryDnsVO;
  *((_WORD *)result + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 10) = self->_rttPrimaryDnsVI;
  *((_WORD *)result + 24) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 24);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (v6)
  {
LABEL_47:
    BOOL v7 = 0;
    goto LABEL_48;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rttGatewayBE != *((_DWORD *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_rttGatewayBK != *((_DWORD *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rttGatewayVO != *((_DWORD *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_rttGatewayVI != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rttPrimaryDnsBE != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rttPrimaryDnsBK != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_rttPrimaryDnsVO != *((_DWORD *)v4 + 11)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rttPrimaryDnsVI != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rttGatewayBE;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rttGatewayBK;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_rttGatewayVO;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_rttGatewayVI;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_rttPrimaryDnsBE;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_rttPrimaryDnsBK;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_rttPrimaryDnsVO;
  if ((has & 0x80) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_rttPrimaryDnsVI;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_rttGatewayBE = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_rttGatewayBK = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_rttGatewayVO = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_rttGatewayVI = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_rttPrimaryDnsBE = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_rttPrimaryDnsBK = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_rttPrimaryDnsVO = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 24) & 0x80) != 0)
  {
LABEL_10:
    self->_rttPrimaryDnsVI = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_11:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)rttGatewayBE
{
  return self->_rttGatewayBE;
}

- (unsigned)rttGatewayBK
{
  return self->_rttGatewayBK;
}

- (unsigned)rttGatewayVO
{
  return self->_rttGatewayVO;
}

- (unsigned)rttGatewayVI
{
  return self->_rttGatewayVI;
}

- (unsigned)rttPrimaryDnsBE
{
  return self->_rttPrimaryDnsBE;
}

- (unsigned)rttPrimaryDnsBK
{
  return self->_rttPrimaryDnsBK;
}

- (unsigned)rttPrimaryDnsVO
{
  return self->_rttPrimaryDnsVO;
}

- (unsigned)rttPrimaryDnsVI
{
  return self->_rttPrimaryDnsVI;
}

@end