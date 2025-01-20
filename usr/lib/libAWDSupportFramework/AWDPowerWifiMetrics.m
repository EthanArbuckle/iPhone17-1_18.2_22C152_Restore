@interface AWDPowerWifiMetrics
- (BOOL)hasTimestamp;
- (BOOL)hasWifi2P4GHzRxDuration;
- (BOOL)hasWifi2P4GHzTxDuration;
- (BOOL)hasWifi5GHz20MHzRxDuration;
- (BOOL)hasWifi5GHz20MHzTxDuration;
- (BOOL)hasWifi5GHz40MHzRxDuration;
- (BOOL)hasWifi5GHz40MHzTxDuration;
- (BOOL)hasWifi5GHz80MHzRxDuration;
- (BOOL)hasWifi5GHz80MHzTxDuration;
- (BOOL)hasWifiFRTSDuration;
- (BOOL)hasWifiHsicActiveDuration;
- (BOOL)hasWifiPcieL0Duration;
- (BOOL)hasWifiPcieL10Duration;
- (BOOL)hasWifiPcieL11Duration;
- (BOOL)hasWifiPcieL12Duration;
- (BOOL)hasWifiScanDuration;
- (BOOL)hasWifiSleepDuration;
- (BOOL)hasWifiTotalDuration;
- (BOOL)hasWifiTotalPowerMicroWatt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)wifi2P4GHzRxDuration;
- (unsigned)wifi2P4GHzTxDuration;
- (unsigned)wifi5GHz20MHzRxDuration;
- (unsigned)wifi5GHz20MHzTxDuration;
- (unsigned)wifi5GHz40MHzRxDuration;
- (unsigned)wifi5GHz40MHzTxDuration;
- (unsigned)wifi5GHz80MHzRxDuration;
- (unsigned)wifi5GHz80MHzTxDuration;
- (unsigned)wifiFRTSDuration;
- (unsigned)wifiHsicActiveDuration;
- (unsigned)wifiPcieL0Duration;
- (unsigned)wifiPcieL10Duration;
- (unsigned)wifiPcieL11Duration;
- (unsigned)wifiPcieL12Duration;
- (unsigned)wifiScanDuration;
- (unsigned)wifiSleepDuration;
- (unsigned)wifiTotalDuration;
- (unsigned)wifiTotalPowerMicroWatt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWifi2P4GHzRxDuration:(BOOL)a3;
- (void)setHasWifi2P4GHzTxDuration:(BOOL)a3;
- (void)setHasWifi5GHz20MHzRxDuration:(BOOL)a3;
- (void)setHasWifi5GHz20MHzTxDuration:(BOOL)a3;
- (void)setHasWifi5GHz40MHzRxDuration:(BOOL)a3;
- (void)setHasWifi5GHz40MHzTxDuration:(BOOL)a3;
- (void)setHasWifi5GHz80MHzRxDuration:(BOOL)a3;
- (void)setHasWifi5GHz80MHzTxDuration:(BOOL)a3;
- (void)setHasWifiFRTSDuration:(BOOL)a3;
- (void)setHasWifiHsicActiveDuration:(BOOL)a3;
- (void)setHasWifiPcieL0Duration:(BOOL)a3;
- (void)setHasWifiPcieL10Duration:(BOOL)a3;
- (void)setHasWifiPcieL11Duration:(BOOL)a3;
- (void)setHasWifiPcieL12Duration:(BOOL)a3;
- (void)setHasWifiScanDuration:(BOOL)a3;
- (void)setHasWifiSleepDuration:(BOOL)a3;
- (void)setHasWifiTotalDuration:(BOOL)a3;
- (void)setHasWifiTotalPowerMicroWatt:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWifi2P4GHzRxDuration:(unsigned int)a3;
- (void)setWifi2P4GHzTxDuration:(unsigned int)a3;
- (void)setWifi5GHz20MHzRxDuration:(unsigned int)a3;
- (void)setWifi5GHz20MHzTxDuration:(unsigned int)a3;
- (void)setWifi5GHz40MHzRxDuration:(unsigned int)a3;
- (void)setWifi5GHz40MHzTxDuration:(unsigned int)a3;
- (void)setWifi5GHz80MHzRxDuration:(unsigned int)a3;
- (void)setWifi5GHz80MHzTxDuration:(unsigned int)a3;
- (void)setWifiFRTSDuration:(unsigned int)a3;
- (void)setWifiHsicActiveDuration:(unsigned int)a3;
- (void)setWifiPcieL0Duration:(unsigned int)a3;
- (void)setWifiPcieL10Duration:(unsigned int)a3;
- (void)setWifiPcieL11Duration:(unsigned int)a3;
- (void)setWifiPcieL12Duration:(unsigned int)a3;
- (void)setWifiScanDuration:(unsigned int)a3;
- (void)setWifiSleepDuration:(unsigned int)a3;
- (void)setWifiTotalDuration:(unsigned int)a3;
- (void)setWifiTotalPowerMicroWatt:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerWifiMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifi2P4GHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_wifi2P4GHzTxDuration = a3;
}

- (void)setHasWifi2P4GHzTxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasWifi2P4GHzTxDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWifi2P4GHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_wifi2P4GHzRxDuration = a3;
}

- (void)setHasWifi2P4GHzRxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasWifi2P4GHzRxDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWifi5GHz20MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_wifi5GHz20MHzTxDuration = a3;
}

- (void)setHasWifi5GHz20MHzTxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasWifi5GHz20MHzTxDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWifi5GHz40MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_wifi5GHz40MHzTxDuration = a3;
}

- (void)setHasWifi5GHz40MHzTxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasWifi5GHz40MHzTxDuration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setWifi5GHz80MHzTxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_wifi5GHz80MHzTxDuration = a3;
}

- (void)setHasWifi5GHz80MHzTxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasWifi5GHz80MHzTxDuration
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setWifi5GHz20MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_wifi5GHz20MHzRxDuration = a3;
}

- (void)setHasWifi5GHz20MHzRxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasWifi5GHz20MHzRxDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWifi5GHz40MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_wifi5GHz40MHzRxDuration = a3;
}

- (void)setHasWifi5GHz40MHzRxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasWifi5GHz40MHzRxDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setWifi5GHz80MHzRxDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_wifi5GHz80MHzRxDuration = a3;
}

- (void)setHasWifi5GHz80MHzRxDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasWifi5GHz80MHzRxDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setWifiSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wifiSleepDuration = a3;
}

- (void)setHasWifiSleepDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWifiSleepDuration
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setWifiTotalDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_wifiTotalDuration = a3;
}

- (void)setHasWifiTotalDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasWifiTotalDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setWifiFRTSDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_wifiFRTSDuration = a3;
}

- (void)setHasWifiFRTSDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasWifiFRTSDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setWifiScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_wifiScanDuration = a3;
}

- (void)setHasWifiScanDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWifiScanDuration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWifiPcieL0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_wifiPcieL0Duration = a3;
}

- (void)setHasWifiPcieL0Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasWifiPcieL0Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setWifiPcieL10Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_wifiPcieL10Duration = a3;
}

- (void)setHasWifiPcieL10Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWifiPcieL10Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setWifiPcieL11Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_wifiPcieL11Duration = a3;
}

- (void)setHasWifiPcieL11Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWifiPcieL11Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWifiPcieL12Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_wifiPcieL12Duration = a3;
}

- (void)setHasWifiPcieL12Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWifiPcieL12Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWifiTotalPowerMicroWatt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_wifiTotalPowerMicroWatt = a3;
}

- (void)setHasWifiTotalPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasWifiTotalPowerMicroWatt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setWifiHsicActiveDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_wifiHsicActiveDuration = a3;
}

- (void)setHasWifiHsicActiveDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCFAC744CD0129BC9930EBEF1D8C9ACB)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasWifiHsicActiveDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerWifiMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerWifiMetrics description](&v3, sel_description), -[AWDPowerWifiMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi2P4GHzTxDuration] forKey:@"wifi2P4GHzTxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi2P4GHzRxDuration] forKey:@"wifi2P4GHzRxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz20MHzTxDuration] forKey:@"wifi5GHz20MHzTxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz40MHzTxDuration] forKey:@"wifi5GHz40MHzTxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz80MHzTxDuration] forKey:@"wifi5GHz80MHzTxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz20MHzRxDuration] forKey:@"wifi5GHz20MHzRxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz40MHzRxDuration] forKey:@"wifi5GHz40MHzRxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi5GHz80MHzRxDuration] forKey:@"wifi5GHz80MHzRxDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiSleepDuration] forKey:@"wifiSleepDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTotalDuration] forKey:@"wifiTotalDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiFRTSDuration] forKey:@"wifiFRTSDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiScanDuration] forKey:@"wifiScanDuration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiPcieL0Duration] forKey:@"wifiPcieL0Duration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiPcieL10Duration] forKey:@"wifiPcieL10Duration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiPcieL11Duration] forKey:@"wifiPcieL11Duration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
LABEL_39:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTotalPowerMicroWatt] forKey:@"wifiTotalPowerMicroWatt"];
    if ((*(_DWORD *)&self->_has & 0x400) == 0) {
      return v3;
    }
    goto LABEL_20;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiPcieL12Duration] forKey:@"wifiPcieL12Duration"];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0) {
    goto LABEL_39;
  }
LABEL_19:
  if ((*(_WORD *)&has & 0x400) != 0) {
LABEL_20:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiHsicActiveDuration] forKey:@"wifiHsicActiveDuration"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerWifiMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
LABEL_38:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x400) == 0) {
      return;
    }
    goto LABEL_39;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0) {
    goto LABEL_38;
  }
LABEL_19:
  if ((*(_WORD *)&has & 0x400) == 0) {
    return;
  }
LABEL_39:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 22) |= 1u;
    $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_wifi2P4GHzTxDuration;
  *((_DWORD *)a3 + 22) |= 4u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 4) = self->_wifi2P4GHzRxDuration;
  *((_DWORD *)a3 + 22) |= 2u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 7) = self->_wifi5GHz20MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x10u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 9) = self->_wifi5GHz40MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x40u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_wifi5GHz80MHzTxDuration;
  *((_DWORD *)a3 + 22) |= 0x100u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 6) = self->_wifi5GHz20MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 8u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_wifi5GHz40MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 0x20u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 10) = self->_wifi5GHz80MHzRxDuration;
  *((_DWORD *)a3 + 22) |= 0x80u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 19) = self->_wifiSleepDuration;
  *((_DWORD *)a3 + 22) |= 0x10000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 20) = self->_wifiTotalDuration;
  *((_DWORD *)a3 + 22) |= 0x20000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 12) = self->_wifiFRTSDuration;
  *((_DWORD *)a3 + 22) |= 0x200u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 18) = self->_wifiScanDuration;
  *((_DWORD *)a3 + 22) |= 0x8000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 14) = self->_wifiPcieL0Duration;
  *((_DWORD *)a3 + 22) |= 0x800u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 15) = self->_wifiPcieL10Duration;
  *((_DWORD *)a3 + 22) |= 0x1000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 16) = self->_wifiPcieL11Duration;
  *((_DWORD *)a3 + 22) |= 0x2000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_wifiPcieL12Duration;
  *((_DWORD *)a3 + 22) |= 0x4000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x400) == 0) {
      return;
    }
LABEL_39:
    *((_DWORD *)a3 + 13) = self->_wifiHsicActiveDuration;
    *((_DWORD *)a3 + 22) |= 0x400u;
    return;
  }
LABEL_38:
  *((_DWORD *)a3 + 21) = self->_wifiTotalPowerMicroWatt;
  *((_DWORD *)a3 + 22) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
    goto LABEL_39;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 22) |= 1u;
    $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_wifi2P4GHzTxDuration;
  *((_DWORD *)result + 22) |= 4u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_wifi2P4GHzRxDuration;
  *((_DWORD *)result + 22) |= 2u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 7) = self->_wifi5GHz20MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x10u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 9) = self->_wifi5GHz40MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x40u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_wifi5GHz80MHzTxDuration;
  *((_DWORD *)result + 22) |= 0x100u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 6) = self->_wifi5GHz20MHzRxDuration;
  *((_DWORD *)result + 22) |= 8u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 8) = self->_wifi5GHz40MHzRxDuration;
  *((_DWORD *)result + 22) |= 0x20u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 10) = self->_wifi5GHz80MHzRxDuration;
  *((_DWORD *)result + 22) |= 0x80u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 19) = self->_wifiSleepDuration;
  *((_DWORD *)result + 22) |= 0x10000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 20) = self->_wifiTotalDuration;
  *((_DWORD *)result + 22) |= 0x20000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 12) = self->_wifiFRTSDuration;
  *((_DWORD *)result + 22) |= 0x200u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_wifiScanDuration;
  *((_DWORD *)result + 22) |= 0x8000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 14) = self->_wifiPcieL0Duration;
  *((_DWORD *)result + 22) |= 0x800u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 15) = self->_wifiPcieL10Duration;
  *((_DWORD *)result + 22) |= 0x1000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 16) = self->_wifiPcieL11Duration;
  *((_DWORD *)result + 22) |= 0x2000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 17) = self->_wifiPcieL12Duration;
  *((_DWORD *)result + 22) |= 0x4000u;
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x400) == 0) {
      return result;
    }
    goto LABEL_20;
  }
LABEL_39:
  *((_DWORD *)result + 21) = self->_wifiTotalPowerMicroWatt;
  *((_DWORD *)result + 22) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x400) == 0) {
    return result;
  }
LABEL_20:
  *((_DWORD *)result + 13) = self->_wifiHsicActiveDuration;
  *((_DWORD *)result + 22) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
    int v7 = *((_DWORD *)a3 + 22);
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_96;
      }
    }
    else if (v7)
    {
LABEL_96:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_wifi2P4GHzTxDuration != *((_DWORD *)a3 + 5)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_wifi2P4GHzRxDuration != *((_DWORD *)a3 + 4)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_wifi5GHz20MHzTxDuration != *((_DWORD *)a3 + 7)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_wifi5GHz40MHzTxDuration != *((_DWORD *)a3 + 9)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_wifi5GHz80MHzTxDuration != *((_DWORD *)a3 + 11)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_wifi5GHz20MHzRxDuration != *((_DWORD *)a3 + 6)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_wifi5GHz40MHzRxDuration != *((_DWORD *)a3 + 8)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_96;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_wifi5GHz80MHzRxDuration != *((_DWORD *)a3 + 10)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_wifiSleepDuration != *((_DWORD *)a3 + 19)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_wifiTotalDuration != *((_DWORD *)a3 + 20)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_wifiFRTSDuration != *((_DWORD *)a3 + 12)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_wifiScanDuration != *((_DWORD *)a3 + 18)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_wifiPcieL0Duration != *((_DWORD *)a3 + 14)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_wifiPcieL10Duration != *((_DWORD *)a3 + 15)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_wifiPcieL11Duration != *((_DWORD *)a3 + 16)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_wifiPcieL12Duration != *((_DWORD *)a3 + 17)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_96;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_wifiTotalPowerMicroWatt != *((_DWORD *)a3 + 21)) {
        goto LABEL_96;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_96;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 22) & 0x400) == 0;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_wifiHsicActiveDuration != *((_DWORD *)a3 + 13)) {
        goto LABEL_96;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $FCFAC744CD0129BC9930EBEF1D8C9ACB has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_wifi2P4GHzTxDuration;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_wifi2P4GHzRxDuration;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_wifi5GHz20MHzTxDuration;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_wifi5GHz40MHzTxDuration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_wifi5GHz80MHzTxDuration;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_wifi5GHz20MHzRxDuration;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_wifi5GHz40MHzRxDuration;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_wifi5GHz80MHzRxDuration;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_wifiSleepDuration;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_wifiTotalDuration;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_wifiFRTSDuration;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_wifiScanDuration;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_wifiPcieL0Duration;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_wifiPcieL10Duration;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_wifiPcieL11Duration;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_wifiPcieL12Duration;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_19;
    }
LABEL_38:
    uint64_t v20 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_20;
    }
LABEL_39:
    uint64_t v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_38;
  }
LABEL_19:
  uint64_t v20 = 2654435761 * self->_wifiTotalPowerMicroWatt;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_39;
  }
LABEL_20:
  uint64_t v21 = 2654435761 * self->_wifiHsicActiveDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 22);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v3 = *((_DWORD *)a3 + 22);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifi2P4GHzTxDuration = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_wifi2P4GHzRxDuration = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_wifi5GHz20MHzTxDuration = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_wifi5GHz40MHzTxDuration = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_wifi5GHz80MHzTxDuration = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_wifi5GHz20MHzRxDuration = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_wifi5GHz40MHzRxDuration = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_wifi5GHz80MHzRxDuration = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_wifiSleepDuration = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x20000) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_wifiTotalDuration = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x200) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_wifiFRTSDuration = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_wifiScanDuration = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_wifiPcieL0Duration = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x1000) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_wifiPcieL10Duration = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x2000) == 0)
  {
LABEL_17:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_wifiPcieL11Duration = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x4000) == 0)
  {
LABEL_18:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_wifiPcieL12Duration = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 22);
  if ((v3 & 0x40000) == 0)
  {
LABEL_19:
    if ((v3 & 0x400) == 0) {
      return;
    }
LABEL_39:
    self->_wifiHsicActiveDuration = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
    return;
  }
LABEL_38:
  self->_wifiTotalPowerMicroWatt = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 22) & 0x400) != 0) {
    goto LABEL_39;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)wifi2P4GHzTxDuration
{
  return self->_wifi2P4GHzTxDuration;
}

- (unsigned)wifi2P4GHzRxDuration
{
  return self->_wifi2P4GHzRxDuration;
}

- (unsigned)wifi5GHz20MHzTxDuration
{
  return self->_wifi5GHz20MHzTxDuration;
}

- (unsigned)wifi5GHz40MHzTxDuration
{
  return self->_wifi5GHz40MHzTxDuration;
}

- (unsigned)wifi5GHz80MHzTxDuration
{
  return self->_wifi5GHz80MHzTxDuration;
}

- (unsigned)wifi5GHz20MHzRxDuration
{
  return self->_wifi5GHz20MHzRxDuration;
}

- (unsigned)wifi5GHz40MHzRxDuration
{
  return self->_wifi5GHz40MHzRxDuration;
}

- (unsigned)wifi5GHz80MHzRxDuration
{
  return self->_wifi5GHz80MHzRxDuration;
}

- (unsigned)wifiSleepDuration
{
  return self->_wifiSleepDuration;
}

- (unsigned)wifiTotalDuration
{
  return self->_wifiTotalDuration;
}

- (unsigned)wifiFRTSDuration
{
  return self->_wifiFRTSDuration;
}

- (unsigned)wifiScanDuration
{
  return self->_wifiScanDuration;
}

- (unsigned)wifiPcieL0Duration
{
  return self->_wifiPcieL0Duration;
}

- (unsigned)wifiPcieL10Duration
{
  return self->_wifiPcieL10Duration;
}

- (unsigned)wifiPcieL11Duration
{
  return self->_wifiPcieL11Duration;
}

- (unsigned)wifiPcieL12Duration
{
  return self->_wifiPcieL12Duration;
}

- (unsigned)wifiTotalPowerMicroWatt
{
  return self->_wifiTotalPowerMicroWatt;
}

- (unsigned)wifiHsicActiveDuration
{
  return self->_wifiHsicActiveDuration;
}

@end