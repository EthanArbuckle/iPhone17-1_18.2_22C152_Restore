@interface AWDWiFiMetricHotspotTransportType
- (BOOL)hasBt;
- (BOOL)hasTimestamp;
- (BOOL)hasUsb;
- (BOOL)hasWifi;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bt;
- (unsigned)usb;
- (unsigned)wifi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBt:(unsigned int)a3;
- (void)setHasBt:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUsb:(BOOL)a3;
- (void)setHasWifi:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsb:(unsigned int)a3;
- (void)setWifi:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricHotspotTransportType

- (void)setWifi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_wifi = a3;
}

- (void)setHasWifi:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifi
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bt = a3;
}

- (void)setHasBt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUsb:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_usb = a3;
}

- (void)setHasUsb:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsb
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricHotspotTransportType;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricHotspotTransportType description](&v3, sel_description), -[AWDWiFiMetricHotspotTransportType dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifi] forKey:@"wifi"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_usb] forKey:@"usb"];
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bt] forKey:@"bt"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricHotspotTransportTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 1) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_wifi;
    *((unsigned char *)a3 + 28) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_bt;
  *((unsigned char *)a3 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return;
    }
LABEL_9:
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 5) = self->_usb;
  *((unsigned char *)a3 + 28) |= 4u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_wifi;
    *((unsigned char *)result + 28) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_bt;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_usb;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = self->_timestamp;
  *((unsigned char *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_wifi != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_bt != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_usb != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_wifi;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_bt;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_usb;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_timestamp;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) != 0)
  {
    self->_wifi = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bt = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_9:
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_8:
  self->_usb = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)a3 + 28)) {
    goto LABEL_9;
  }
}

- (unsigned)wifi
{
  return self->_wifi;
}

- (unsigned)bt
{
  return self->_bt;
}

- (unsigned)usb
{
  return self->_usb;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end