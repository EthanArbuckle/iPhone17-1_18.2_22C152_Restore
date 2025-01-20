@interface WiFiAnalyticsAWDWiFiUSBEventNotification
- (BOOL)hasDurationSinceUSBEventInSeconds;
- (BOOL)hasIsVendorApple;
- (BOOL)hasSmartCCADesenseSupported;
- (BOOL)hasUsbAction;
- (BOOL)hasUsbTotal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVendorApple;
- (BOOL)readFrom:(id)a3;
- (BOOL)smartCCADesenseSupported;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)durationSinceUSBEventInSeconds;
- (unint64_t)hash;
- (unsigned)usbAction;
- (unsigned)usbTotal;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationSinceUSBEventInSeconds:(unint64_t)a3;
- (void)setHasDurationSinceUSBEventInSeconds:(BOOL)a3;
- (void)setHasIsVendorApple:(BOOL)a3;
- (void)setHasSmartCCADesenseSupported:(BOOL)a3;
- (void)setHasUsbAction:(BOOL)a3;
- (void)setHasUsbTotal:(BOOL)a3;
- (void)setIsVendorApple:(BOOL)a3;
- (void)setSmartCCADesenseSupported:(BOOL)a3;
- (void)setUsbAction:(unsigned int)a3;
- (void)setUsbTotal:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiUSBEventNotification

- (void)setUsbAction:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_usbAction = a3;
}

- (void)setHasUsbAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUsbAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUsbTotal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_usbTotal = a3;
}

- (void)setHasUsbTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsbTotal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDurationSinceUSBEventInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durationSinceUSBEventInSeconds = a3;
}

- (void)setHasDurationSinceUSBEventInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationSinceUSBEventInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsVendorApple:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isVendorApple = a3;
}

- (void)setHasIsVendorApple:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVendorApple
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSmartCCADesenseSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_smartCCADesenseSupported = a3;
}

- (void)setHasSmartCCADesenseSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSmartCCADesenseSupported
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiUSBEventNotification;
  v4 = [(WiFiAnalyticsAWDWiFiUSBEventNotification *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiUSBEventNotification *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_usbAction];
    [v3 setObject:v7 forKey:@"usbAction"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_usbTotal];
  [v3 setObject:v8 forKey:@"usbTotal"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_durationSinceUSBEventInSeconds];
  [v3 setObject:v9 forKey:@"durationSinceUSBEventInSeconds"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithBool:self->_isVendorApple];
  [v3 setObject:v10 forKey:@"isVendorApple"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithBool:self->_smartCCADesenseSupported];
    [v3 setObject:v5 forKey:@"smartCCADesenseSupported"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiUSBEventNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_usbAction;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_usbTotal;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)v4 + 1) = self->_durationSinceUSBEventInSeconds;
  *((unsigned char *)v4 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((unsigned char *)v4 + 24) = self->_isVendorApple;
  *((unsigned char *)v4 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 25) = self->_smartCCADesenseSupported;
    *((unsigned char *)v4 + 28) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_usbAction;
    *((unsigned char *)result + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_usbTotal;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 1) = self->_durationSinceUSBEventInSeconds;
  *((unsigned char *)result + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 24) = self->_isVendorApple;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 25) = self->_smartCCADesenseSupported;
  *((unsigned char *)result + 28) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_usbAction != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_usbTotal != *((_DWORD *)v4 + 5)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_durationSinceUSBEventInSeconds != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_isVendorApple)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
    goto LABEL_27;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
    {
      if (self->_smartCCADesenseSupported)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_27;
      }
      BOOL v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v5 = 0;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_usbAction;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_usbTotal;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_durationSinceUSBEventInSeconds;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isVendorApple;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_smartCCADesenseSupported;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_usbAction = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_usbTotal = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_durationSinceUSBEventInSeconds = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_isVendorApple = *((unsigned char *)v4 + 24);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
LABEL_6:
    self->_smartCCADesenseSupported = *((unsigned char *)v4 + 25);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unsigned)usbAction
{
  return self->_usbAction;
}

- (unsigned)usbTotal
{
  return self->_usbTotal;
}

- (unint64_t)durationSinceUSBEventInSeconds
{
  return self->_durationSinceUSBEventInSeconds;
}

- (BOOL)isVendorApple
{
  return self->_isVendorApple;
}

- (BOOL)smartCCADesenseSupported
{
  return self->_smartCCADesenseSupported;
}

@end