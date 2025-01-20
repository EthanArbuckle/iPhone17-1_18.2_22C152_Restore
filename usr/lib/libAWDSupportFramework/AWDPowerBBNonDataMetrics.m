@interface AWDPowerBBNonDataMetrics
- (BOOL)hasAPWakeCacheFlushCnt;
- (BOOL)hasIdlePowerMicroWatt;
- (BOOL)hasOOSPowerMicroWatt;
- (BOOL)hasRegistrationPowerMicroWatt;
- (BOOL)hasScanPowerMicroWatt;
- (BOOL)hasTimestamp;
- (BOOL)hasVoicePowerMicroWatt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)aPWakeCacheFlushCnt;
- (unsigned)idlePowerMicroWatt;
- (unsigned)oOSPowerMicroWatt;
- (unsigned)registrationPowerMicroWatt;
- (unsigned)scanPowerMicroWatt;
- (unsigned)voicePowerMicroWatt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAPWakeCacheFlushCnt:(unsigned int)a3;
- (void)setHasAPWakeCacheFlushCnt:(BOOL)a3;
- (void)setHasIdlePowerMicroWatt:(BOOL)a3;
- (void)setHasOOSPowerMicroWatt:(BOOL)a3;
- (void)setHasRegistrationPowerMicroWatt:(BOOL)a3;
- (void)setHasScanPowerMicroWatt:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVoicePowerMicroWatt:(BOOL)a3;
- (void)setIdlePowerMicroWatt:(unsigned int)a3;
- (void)setOOSPowerMicroWatt:(unsigned int)a3;
- (void)setRegistrationPowerMicroWatt:(unsigned int)a3;
- (void)setScanPowerMicroWatt:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVoicePowerMicroWatt:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBNonDataMetrics

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

- (void)setScanPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_scanPowerMicroWatt = a3;
}

- (void)setHasScanPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScanPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setOOSPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_oOSPowerMicroWatt = a3;
}

- (void)setHasOOSPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOOSPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRegistrationPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_registrationPowerMicroWatt = a3;
}

- (void)setHasRegistrationPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRegistrationPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIdlePowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_idlePowerMicroWatt = a3;
}

- (void)setHasIdlePowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIdlePowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVoicePowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_voicePowerMicroWatt = a3;
}

- (void)setHasVoicePowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVoicePowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAPWakeCacheFlushCnt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_aPWakeCacheFlushCnt = a3;
}

- (void)setHasAPWakeCacheFlushCnt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAPWakeCacheFlushCnt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBNonDataMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBNonDataMetrics description](&v3, sel_description), -[AWDPowerBBNonDataMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanPowerMicroWatt] forKey:@"ScanPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_oOSPowerMicroWatt] forKey:@"OOSPowerMicroWatt"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_registrationPowerMicroWatt] forKey:@"RegistrationPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voicePowerMicroWatt] forKey:@"VoicePowerMicroWatt"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_idlePowerMicroWatt] forKey:@"IdlePowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 2) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_aPWakeCacheFlushCnt] forKey:@"APWakeCacheFlushCnt"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBNonDataMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 2) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_scanPowerMicroWatt;
  *((unsigned char *)a3 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 6) = self->_oOSPowerMicroWatt;
  *((unsigned char *)a3 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 7) = self->_registrationPowerMicroWatt;
  *((unsigned char *)a3 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_idlePowerMicroWatt;
  *((unsigned char *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 4) = self->_aPWakeCacheFlushCnt;
    *((unsigned char *)a3 + 40) |= 2u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 9) = self->_voicePowerMicroWatt;
  *((unsigned char *)a3 + 40) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
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
    *((unsigned char *)result + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_scanPowerMicroWatt;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_oOSPowerMicroWatt;
  *((unsigned char *)result + 40) |= 8u;
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
  *((_DWORD *)result + 7) = self->_registrationPowerMicroWatt;
  *((unsigned char *)result + 40) |= 0x10u;
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
  *((_DWORD *)result + 5) = self->_idlePowerMicroWatt;
  *((unsigned char *)result + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_voicePowerMicroWatt;
  *((unsigned char *)result + 40) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 4) = self->_aPWakeCacheFlushCnt;
  *((unsigned char *)result + 40) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x20) == 0 || self->_scanPowerMicroWatt != *((_DWORD *)a3 + 8)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_oOSPowerMicroWatt != *((_DWORD *)a3 + 6)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_registrationPowerMicroWatt != *((_DWORD *)a3 + 7)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_idlePowerMicroWatt != *((_DWORD *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x40) == 0 || self->_voicePowerMicroWatt != *((_DWORD *)a3 + 9)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_aPWakeCacheFlushCnt != *((_DWORD *)a3 + 4)) {
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
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_scanPowerMicroWatt;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_oOSPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_registrationPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_idlePowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_voicePowerMicroWatt;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_aPWakeCacheFlushCnt;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 40);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 40);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_scanPowerMicroWatt = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_oOSPowerMicroWatt = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_registrationPowerMicroWatt = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_idlePowerMicroWatt = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_15:
    self->_aPWakeCacheFlushCnt = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_14:
  self->_voicePowerMicroWatt = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)a3 + 40) & 2) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)scanPowerMicroWatt
{
  return self->_scanPowerMicroWatt;
}

- (unsigned)oOSPowerMicroWatt
{
  return self->_oOSPowerMicroWatt;
}

- (unsigned)registrationPowerMicroWatt
{
  return self->_registrationPowerMicroWatt;
}

- (unsigned)idlePowerMicroWatt
{
  return self->_idlePowerMicroWatt;
}

- (unsigned)voicePowerMicroWatt
{
  return self->_voicePowerMicroWatt;
}

- (unsigned)aPWakeCacheFlushCnt
{
  return self->_aPWakeCacheFlushCnt;
}

@end