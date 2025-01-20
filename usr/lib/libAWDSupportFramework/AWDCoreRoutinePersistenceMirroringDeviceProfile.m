@interface AWDCoreRoutinePersistenceMirroringDeviceProfile
- (BOOL)hasAgeOfDevice;
- (BOOL)hasDeviceClass;
- (BOOL)hasPlacesAssociatedToDevice;
- (BOOL)hasTimeIntervalSinceLastRecordAssociation;
- (BOOL)hasTimestamp;
- (BOOL)hasTransitionsAssociatedToDevice;
- (BOOL)hasVisitsAssociatedToDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ageOfDevice;
- (int)deviceClass;
- (int)placesAssociatedToDevice;
- (int)timeIntervalSinceLastRecordAssociation;
- (int)transitionsAssociatedToDevice;
- (int)visitsAssociatedToDevice;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeOfDevice:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setHasAgeOfDevice:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasPlacesAssociatedToDevice:(BOOL)a3;
- (void)setHasTimeIntervalSinceLastRecordAssociation:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTransitionsAssociatedToDevice:(BOOL)a3;
- (void)setHasVisitsAssociatedToDevice:(BOOL)a3;
- (void)setPlacesAssociatedToDevice:(int)a3;
- (void)setTimeIntervalSinceLastRecordAssociation:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransitionsAssociatedToDevice:(int)a3;
- (void)setVisitsAssociatedToDevice:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePersistenceMirroringDeviceProfile

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

- (void)setDeviceClass:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deviceClass = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAgeOfDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ageOfDevice = a3;
}

- (void)setHasAgeOfDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAgeOfDevice
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVisitsAssociatedToDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_visitsAssociatedToDevice = a3;
}

- (void)setHasVisitsAssociatedToDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVisitsAssociatedToDevice
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPlacesAssociatedToDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_placesAssociatedToDevice = a3;
}

- (void)setHasPlacesAssociatedToDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPlacesAssociatedToDevice
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTransitionsAssociatedToDevice:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_transitionsAssociatedToDevice = a3;
}

- (void)setHasTransitionsAssociatedToDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTransitionsAssociatedToDevice
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTimeIntervalSinceLastRecordAssociation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timeIntervalSinceLastRecordAssociation = a3;
}

- (void)setHasTimeIntervalSinceLastRecordAssociation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeIntervalSinceLastRecordAssociation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringDeviceProfile;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePersistenceMirroringDeviceProfile description](&v3, sel_description), -[AWDCoreRoutinePersistenceMirroringDeviceProfile dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_deviceClass] forKey:@"deviceClass"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithInt:self->_ageOfDevice] forKey:@"ageOfDevice"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithInt:self->_visitsAssociatedToDevice] forKey:@"visitsAssociatedToDevice"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithInt:self->_transitionsAssociatedToDevice] forKey:@"transitionsAssociatedToDevice"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_placesAssociatedToDevice] forKey:@"placesAssociatedToDevice"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x10) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_timeIntervalSinceLastRecordAssociation] forKey:@"timeIntervalSinceLastRecordAssociation"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceMirroringDeviceProfileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_deviceClass;
  *((unsigned char *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 4) = self->_ageOfDevice;
  *((unsigned char *)a3 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 9) = self->_visitsAssociatedToDevice;
  *((unsigned char *)a3 + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_placesAssociatedToDevice;
  *((unsigned char *)a3 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 7) = self->_timeIntervalSinceLastRecordAssociation;
    *((unsigned char *)a3 + 40) |= 0x10u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 8) = self->_transitionsAssociatedToDevice;
  *((unsigned char *)a3 + 40) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_deviceClass;
  *((unsigned char *)result + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_ageOfDevice;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 9) = self->_visitsAssociatedToDevice;
  *((unsigned char *)result + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 6) = self->_placesAssociatedToDevice;
  *((unsigned char *)result + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 8) = self->_transitionsAssociatedToDevice;
  *((unsigned char *)result + 40) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 7) = self->_timeIntervalSinceLastRecordAssociation;
  *((unsigned char *)result + 40) |= 0x10u;
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_deviceClass != *((_DWORD *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_ageOfDevice != *((_DWORD *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x40) == 0 || self->_visitsAssociatedToDevice != *((_DWORD *)a3 + 9)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_placesAssociatedToDevice != *((_DWORD *)a3 + 6)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x20) == 0 || self->_transitionsAssociatedToDevice != *((_DWORD *)a3 + 8)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_timeIntervalSinceLastRecordAssociation != *((_DWORD *)a3 + 7)) {
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_deviceClass;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_ageOfDevice;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_visitsAssociatedToDevice;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_placesAssociatedToDevice;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_transitionsAssociatedToDevice;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_timeIntervalSinceLastRecordAssociation;
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
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_deviceClass = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_ageOfDevice = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_visitsAssociatedToDevice = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_placesAssociatedToDevice = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_15:
    self->_timeIntervalSinceLastRecordAssociation = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_14:
  self->_transitionsAssociatedToDevice = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 40) & 0x10) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)ageOfDevice
{
  return self->_ageOfDevice;
}

- (int)visitsAssociatedToDevice
{
  return self->_visitsAssociatedToDevice;
}

- (int)placesAssociatedToDevice
{
  return self->_placesAssociatedToDevice;
}

- (int)transitionsAssociatedToDevice
{
  return self->_transitionsAssociatedToDevice;
}

- (int)timeIntervalSinceLastRecordAssociation
{
  return self->_timeIntervalSinceLastRecordAssociation;
}

@end