@interface AWDWiFiSoftAP
- (BOOL)familyDevice;
- (BOOL)hasAppleDeviceConnectCount;
- (BOOL)hasAppleDeviceDisconnectCount;
- (BOOL)hasBringUpMethod;
- (BOOL)hasChannel;
- (BOOL)hasFamilyDevice;
- (BOOL)hasLowPowerModeDuration;
- (BOOL)hasMisToSoftAPActiveTimeInMilliseconds;
- (BOOL)hasOtherDeviceConnectCount;
- (BOOL)hasOtherDeviceDisconnectCount;
- (BOOL)hasReasonCode;
- (BOOL)hasSecurityTypes;
- (BOOL)hasSessionDuration;
- (BOOL)hasSsidChanged;
- (BOOL)hasTeardownReason;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)lowPowerModeDuration;
- (unint64_t)misToSoftAPActiveTimeInMilliseconds;
- (unint64_t)sessionDuration;
- (unint64_t)timestamp;
- (unsigned)appleDeviceConnectCount;
- (unsigned)appleDeviceDisconnectCount;
- (unsigned)bringUpMethod;
- (unsigned)channel;
- (unsigned)otherDeviceConnectCount;
- (unsigned)otherDeviceDisconnectCount;
- (unsigned)reasonCode;
- (unsigned)securityTypes;
- (unsigned)ssidChanged;
- (unsigned)teardownReason;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppleDeviceConnectCount:(unsigned int)a3;
- (void)setAppleDeviceDisconnectCount:(unsigned int)a3;
- (void)setBringUpMethod:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setFamilyDevice:(BOOL)a3;
- (void)setHasAppleDeviceConnectCount:(BOOL)a3;
- (void)setHasAppleDeviceDisconnectCount:(BOOL)a3;
- (void)setHasBringUpMethod:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasFamilyDevice:(BOOL)a3;
- (void)setHasLowPowerModeDuration:(BOOL)a3;
- (void)setHasMisToSoftAPActiveTimeInMilliseconds:(BOOL)a3;
- (void)setHasOtherDeviceConnectCount:(BOOL)a3;
- (void)setHasOtherDeviceDisconnectCount:(BOOL)a3;
- (void)setHasReasonCode:(BOOL)a3;
- (void)setHasSecurityTypes:(BOOL)a3;
- (void)setHasSessionDuration:(BOOL)a3;
- (void)setHasSsidChanged:(BOOL)a3;
- (void)setHasTeardownReason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLowPowerModeDuration:(unint64_t)a3;
- (void)setMisToSoftAPActiveTimeInMilliseconds:(unint64_t)a3;
- (void)setOtherDeviceConnectCount:(unsigned int)a3;
- (void)setOtherDeviceDisconnectCount:(unsigned int)a3;
- (void)setReasonCode:(unsigned int)a3;
- (void)setSecurityTypes:(unsigned int)a3;
- (void)setSessionDuration:(unint64_t)a3;
- (void)setSsidChanged:(unsigned int)a3;
- (void)setTeardownReason:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiSoftAP

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMisToSoftAPActiveTimeInMilliseconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_misToSoftAPActiveTimeInMilliseconds = a3;
}

- (void)setHasMisToSoftAPActiveTimeInMilliseconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMisToSoftAPActiveTimeInMilliseconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBringUpMethod:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_bringUpMethod = a3;
}

- (void)setHasBringUpMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasBringUpMethod
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setReasonCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_reasonCode = a3;
}

- (void)setHasReasonCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasReasonCode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTeardownReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_teardownReason = a3;
}

- (void)setHasTeardownReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTeardownReason
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setSessionDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sessionDuration = a3;
}

- (void)setHasSessionDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSessionDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppleDeviceConnectCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_appleDeviceConnectCount = a3;
}

- (void)setHasAppleDeviceConnectCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAppleDeviceConnectCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setOtherDeviceConnectCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_otherDeviceConnectCount = a3;
}

- (void)setHasOtherDeviceConnectCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasOtherDeviceConnectCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAppleDeviceDisconnectCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_appleDeviceDisconnectCount = a3;
}

- (void)setHasAppleDeviceDisconnectCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAppleDeviceDisconnectCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setOtherDeviceDisconnectCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_otherDeviceDisconnectCount = a3;
}

- (void)setHasOtherDeviceDisconnectCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOtherDeviceDisconnectCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSsidChanged:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_ssidChanged = a3;
}

- (void)setHasSsidChanged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSsidChanged
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFamilyDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_familyDevice = a3;
}

- (void)setHasFamilyDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasFamilyDevice
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setLowPowerModeDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_lowPowerModeDuration = a3;
}

- (void)setHasLowPowerModeDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLowPowerModeDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSecurityTypes:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_securityTypes = a3;
}

- (void)setHasSecurityTypes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSecurityTypes
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSoftAP;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiSoftAP description](&v3, sel_description), -[AWDWiFiSoftAP dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_misToSoftAPActiveTimeInMilliseconds] forKey:@"misToSoftAPActiveTimeInMilliseconds"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bringUpMethod] forKey:@"bringUpMethod"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reasonCode] forKey:@"reasonCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_teardownReason] forKey:@"teardownReason"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sessionDuration] forKey:@"sessionDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_appleDeviceConnectCount] forKey:@"appleDeviceConnectCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_otherDeviceConnectCount] forKey:@"otherDeviceConnectCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_appleDeviceDisconnectCount] forKey:@"appleDeviceDisconnectCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_otherDeviceDisconnectCount] forKey:@"otherDeviceDisconnectCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ssidChanged] forKey:@"ssidChanged"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowPowerModeDuration] forKey:@"lowPowerModeDuration"];
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return v3;
    }
    goto LABEL_16;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithBool:self->_familyDevice] forKey:@"familyDevice"];
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 0x800) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityTypes] forKey:@"securityTypes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSoftAPReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return;
    }
    goto LABEL_31;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_30;
  }
LABEL_15:
  if ((has & 0x800) == 0) {
    return;
  }
LABEL_31:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_misToSoftAPActiveTimeInMilliseconds;
  *((_WORD *)a3 + 42) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_bringUpMethod;
  *((_WORD *)a3 + 42) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 16) = self->_reasonCode;
  *((_WORD *)a3 + 42) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 19) = self->_teardownReason;
  *((_WORD *)a3 + 42) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 3) = self->_sessionDuration;
  *((_WORD *)a3 + 42) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 10) = self->_appleDeviceConnectCount;
  *((_WORD *)a3 + 42) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 14) = self->_otherDeviceConnectCount;
  *((_WORD *)a3 + 42) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 11) = self->_appleDeviceDisconnectCount;
  *((_WORD *)a3 + 42) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 15) = self->_otherDeviceDisconnectCount;
  *((_WORD *)a3 + 42) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 13) = self->_channel;
  *((_WORD *)a3 + 42) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_ssidChanged;
  *((_WORD *)a3 + 42) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((unsigned char *)a3 + 80) = self->_familyDevice;
  *((_WORD *)a3 + 42) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_15:
    if ((has & 0x800) == 0) {
      return;
    }
LABEL_31:
    *((_DWORD *)a3 + 17) = self->_securityTypes;
    *((_WORD *)a3 + 42) |= 0x800u;
    return;
  }
LABEL_30:
  *((void *)a3 + 1) = self->_lowPowerModeDuration;
  *((_WORD *)a3 + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    goto LABEL_31;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init]];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)result + 4) = self->_timestamp;
    *((_WORD *)result + 42) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_misToSoftAPActiveTimeInMilliseconds;
  *((_WORD *)result + 42) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_bringUpMethod;
  *((_WORD *)result + 42) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 16) = self->_reasonCode;
  *((_WORD *)result + 42) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 19) = self->_teardownReason;
  *((_WORD *)result + 42) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 3) = self->_sessionDuration;
  *((_WORD *)result + 42) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 10) = self->_appleDeviceConnectCount;
  *((_WORD *)result + 42) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_otherDeviceConnectCount;
  *((_WORD *)result + 42) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 11) = self->_appleDeviceDisconnectCount;
  *((_WORD *)result + 42) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 15) = self->_otherDeviceDisconnectCount;
  *((_WORD *)result + 42) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 13) = self->_channel;
  *((_WORD *)result + 42) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 18) = self->_ssidChanged;
  *((_WORD *)result + 42) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)result + 80) = self->_familyDevice;
  *((_WORD *)result + 42) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_15:
    if ((has & 0x800) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((void *)result + 1) = self->_lowPowerModeDuration;
  *((_WORD *)result + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_16:
  *((_DWORD *)result + 17) = self->_securityTypes;
  *((_WORD *)result + 42) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 42);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_misToSoftAPActiveTimeInMilliseconds != *((void *)a3 + 2)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_bringUpMethod != *((_DWORD *)a3 + 12)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x400) == 0 || self->_reasonCode != *((_DWORD *)a3 + 16)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x2000) == 0 || self->_teardownReason != *((_DWORD *)a3 + 19)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x2000) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_sessionDuration != *((void *)a3 + 3)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_appleDeviceConnectCount != *((_DWORD *)a3 + 10)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_otherDeviceConnectCount != *((_DWORD *)a3 + 14)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_appleDeviceDisconnectCount != *((_DWORD *)a3 + 11)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x200) == 0 || self->_otherDeviceDisconnectCount != *((_DWORD *)a3 + 15)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_channel != *((_DWORD *)a3 + 13)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x1000) == 0 || self->_ssidChanged != *((_DWORD *)a3 + 18)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x4000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_70;
  }
  if ((*((_WORD *)a3 + 42) & 0x4000) == 0) {
    goto LABEL_79;
  }
  if (self->_familyDevice)
  {
    if (!*((unsigned char *)a3 + 80)) {
      goto LABEL_79;
    }
    goto LABEL_70;
  }
  if (*((unsigned char *)a3 + 80))
  {
LABEL_79:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_70:
  if (has)
  {
    if ((v7 & 1) == 0 || self->_lowPowerModeDuration != *((void *)a3 + 1)) {
      goto LABEL_79;
    }
  }
  else if (v7)
  {
    goto LABEL_79;
  }
  LOBYTE(v5) = (v7 & 0x800) == 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x800) == 0 || self->_securityTypes != *((_DWORD *)a3 + 17)) {
      goto LABEL_79;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_misToSoftAPActiveTimeInMilliseconds;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_bringUpMethod;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_reasonCode;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_teardownReason;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_sessionDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_appleDeviceConnectCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_otherDeviceConnectCount;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_appleDeviceDisconnectCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_otherDeviceDisconnectCount;
    if ((has & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_channel;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_ssidChanged;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_familyDevice;
    if (has) {
      goto LABEL_15;
    }
LABEL_30:
    unint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((has & 1) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  unint64_t v16 = 2654435761u * self->_lowPowerModeDuration;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_securityTypes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v3 = *((_WORD *)a3 + 42);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_misToSoftAPActiveTimeInMilliseconds = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_bringUpMethod = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_reasonCode = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_teardownReason = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_sessionDuration = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_appleDeviceConnectCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_otherDeviceConnectCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_appleDeviceDisconnectCount = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_otherDeviceDisconnectCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x80) == 0)
  {
LABEL_12:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_channel = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x1000) == 0)
  {
LABEL_13:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_ssidChanged = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 0x4000) == 0)
  {
LABEL_14:
    if ((v3 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_familyDevice = *((unsigned char *)a3 + 80);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v3 = *((_WORD *)a3 + 42);
  if ((v3 & 1) == 0)
  {
LABEL_15:
    if ((v3 & 0x800) == 0) {
      return;
    }
LABEL_31:
    self->_securityTypes = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x800u;
    return;
  }
LABEL_30:
  self->_lowPowerModeDuration = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 42) & 0x800) != 0) {
    goto LABEL_31;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)misToSoftAPActiveTimeInMilliseconds
{
  return self->_misToSoftAPActiveTimeInMilliseconds;
}

- (unsigned)bringUpMethod
{
  return self->_bringUpMethod;
}

- (unsigned)reasonCode
{
  return self->_reasonCode;
}

- (unsigned)teardownReason
{
  return self->_teardownReason;
}

- (unint64_t)sessionDuration
{
  return self->_sessionDuration;
}

- (unsigned)appleDeviceConnectCount
{
  return self->_appleDeviceConnectCount;
}

- (unsigned)otherDeviceConnectCount
{
  return self->_otherDeviceConnectCount;
}

- (unsigned)appleDeviceDisconnectCount
{
  return self->_appleDeviceDisconnectCount;
}

- (unsigned)otherDeviceDisconnectCount
{
  return self->_otherDeviceDisconnectCount;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)ssidChanged
{
  return self->_ssidChanged;
}

- (BOOL)familyDevice
{
  return self->_familyDevice;
}

- (unint64_t)lowPowerModeDuration
{
  return self->_lowPowerModeDuration;
}

- (unsigned)securityTypes
{
  return self->_securityTypes;
}

@end