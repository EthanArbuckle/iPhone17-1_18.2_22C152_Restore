@interface AWDWiFiUSBEventNotification
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

@implementation AWDWiFiUSBEventNotification

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
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUSBEventNotification;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiUSBEventNotification description](&v3, sel_description), -[AWDWiFiUSBEventNotification dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_usbAction] forKey:@"usbAction"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_usbTotal] forKey:@"usbTotal"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithBool:self->_isVendorApple] forKey:@"isVendorApple"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_durationSinceUSBEventInSeconds] forKey:@"durationSinceUSBEventInSeconds"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_smartCCADesenseSupported] forKey:@"smartCCADesenseSupported"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUSBEventNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
      goto LABEL_9;
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
LABEL_10:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_usbAction;
    *((unsigned char *)a3 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_usbTotal;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((void *)a3 + 1) = self->_durationSinceUSBEventInSeconds;
  *((unsigned char *)a3 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_11:
    *((unsigned char *)a3 + 25) = self->_smartCCADesenseSupported;
    *((unsigned char *)a3 + 28) |= 0x10u;
    return;
  }
LABEL_10:
  *((unsigned char *)a3 + 24) = self->_isVendorApple;
  *((unsigned char *)a3 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
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
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_usbAction != *((_DWORD *)a3 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_usbTotal != *((_DWORD *)a3 + 5)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_durationSinceUSBEventInSeconds != *((void *)a3 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      if (self->_isVendorApple)
      {
        if (!*((unsigned char *)a3 + 24)) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)a3 + 24)) {
        goto LABEL_25;
      }
    }
LABEL_27:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_27;
  }
LABEL_25:
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) == 0) {
      goto LABEL_27;
    }
    if (self->_smartCCADesenseSupported)
    {
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)a3 + 25))
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = 1;
  }
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
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) != 0)
  {
    self->_usbAction = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_usbTotal = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_durationSinceUSBEventInSeconds = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_11:
    self->_smartCCADesenseSupported = *((unsigned char *)a3 + 25);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_10:
  self->_isVendorApple = *((unsigned char *)a3 + 24);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 28) & 0x10) != 0) {
    goto LABEL_11;
  }
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