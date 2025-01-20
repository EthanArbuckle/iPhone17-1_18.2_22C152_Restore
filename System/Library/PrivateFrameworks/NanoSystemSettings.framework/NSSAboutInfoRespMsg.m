@interface NSSAboutInfoRespMsg
- (BOOL)batteryIsCharging;
- (BOOL)hasAvailableStorageInBytes;
- (BOOL)hasBatteryCurrentCapacity;
- (BOOL)hasBatteryIsCharging;
- (BOOL)hasNumberOfApps;
- (BOOL)hasNumberOfPhotos;
- (BOOL)hasNumberOfSongs;
- (BOOL)hasPurgeableSpace;
- (BOOL)hasUserDeletableSpace;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)availableStorageInBytes;
- (unint64_t)batteryCurrentCapacity;
- (unint64_t)hash;
- (unint64_t)numberOfApps;
- (unint64_t)numberOfPhotos;
- (unint64_t)numberOfSongs;
- (unint64_t)purgeableSpace;
- (unint64_t)userDeletableSpace;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableStorageInBytes:(unint64_t)a3;
- (void)setBatteryCurrentCapacity:(unint64_t)a3;
- (void)setBatteryIsCharging:(BOOL)a3;
- (void)setHasAvailableStorageInBytes:(BOOL)a3;
- (void)setHasBatteryCurrentCapacity:(BOOL)a3;
- (void)setHasBatteryIsCharging:(BOOL)a3;
- (void)setHasNumberOfApps:(BOOL)a3;
- (void)setHasNumberOfPhotos:(BOOL)a3;
- (void)setHasNumberOfSongs:(BOOL)a3;
- (void)setHasPurgeableSpace:(BOOL)a3;
- (void)setHasUserDeletableSpace:(BOOL)a3;
- (void)setNumberOfApps:(unint64_t)a3;
- (void)setNumberOfPhotos:(unint64_t)a3;
- (void)setNumberOfSongs:(unint64_t)a3;
- (void)setPurgeableSpace:(unint64_t)a3;
- (void)setUserDeletableSpace:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSAboutInfoRespMsg

- (void)setAvailableStorageInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_availableStorageInBytes = a3;
}

- (void)setHasAvailableStorageInBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvailableStorageInBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfApps:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfApps = a3;
}

- (void)setHasNumberOfApps:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfApps
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfSongs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numberOfSongs = a3;
}

- (void)setHasNumberOfSongs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfSongs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumberOfPhotos:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfPhotos = a3;
}

- (void)setHasNumberOfPhotos:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfPhotos
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBatteryCurrentCapacity:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_batteryCurrentCapacity = a3;
}

- (void)setHasBatteryCurrentCapacity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBatteryCurrentCapacity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBatteryIsCharging:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_batteryIsCharging = a3;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasBatteryIsCharging
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setPurgeableSpace:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_purgeableSpace = a3;
}

- (void)setHasPurgeableSpace:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPurgeableSpace
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setUserDeletableSpace:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_userDeletableSpace = a3;
}

- (void)setHasUserDeletableSpace:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserDeletableSpace
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSAboutInfoRespMsg;
  v4 = [(NSSAboutInfoRespMsg *)&v8 description];
  v5 = [(NSSAboutInfoRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_availableStorageInBytes];
    [v3 setObject:v7 forKey:@"availableStorageInBytes"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_numberOfApps];
  [v3 setObject:v8 forKey:@"numberOfApps"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_numberOfSongs];
  [v3 setObject:v9 forKey:@"numberOfSongs"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_numberOfPhotos];
  [v3 setObject:v10 forKey:@"numberOfPhotos"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_batteryCurrentCapacity];
  [v3 setObject:v11 forKey:@"batteryCurrentCapacity"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithBool:self->_batteryIsCharging];
  [v3 setObject:v12 forKey:@"batteryIsCharging"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = [NSNumber numberWithUnsignedLongLong:self->_purgeableSpace];
  [v3 setObject:v13 forKey:@"purgeableSpace"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_userDeletableSpace];
    [v3 setObject:v5 forKey:@"userDeletableSpace"];
  }
LABEL_10:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAboutInfoRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint64Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_availableStorageInBytes;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_numberOfApps;
  *((unsigned char *)v4 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[5] = self->_numberOfSongs;
  *((unsigned char *)v4 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[4] = self->_numberOfPhotos;
  *((unsigned char *)v4 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[2] = self->_batteryCurrentCapacity;
  *((unsigned char *)v4 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 64) = self->_batteryIsCharging;
  *((unsigned char *)v4 + 68) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v4[6] = self->_purgeableSpace;
  *((unsigned char *)v4 + 68) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v4[7] = self->_userDeletableSpace;
    *((unsigned char *)v4 + 68) |= 0x40u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_availableStorageInBytes;
    *((unsigned char *)result + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_numberOfApps;
  *((unsigned char *)result + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 5) = self->_numberOfSongs;
  *((unsigned char *)result + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 4) = self->_numberOfPhotos;
  *((unsigned char *)result + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 2) = self->_batteryCurrentCapacity;
  *((unsigned char *)result + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 64) = self->_batteryIsCharging;
  *((unsigned char *)result + 68) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 6) = self->_purgeableSpace;
  *((unsigned char *)result + 68) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 7) = self->_userDeletableSpace;
  *((unsigned char *)result + 68) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_availableStorageInBytes != *((void *)v4 + 1)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_numberOfApps != *((void *)v4 + 3)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_numberOfSongs != *((void *)v4 + 5)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_numberOfPhotos != *((void *)v4 + 4)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_batteryCurrentCapacity != *((void *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x80) == 0) {
      goto LABEL_29;
    }
LABEL_43:
    BOOL v5 = 0;
    goto LABEL_44;
  }
  if ((*((unsigned char *)v4 + 68) & 0x80) == 0) {
    goto LABEL_43;
  }
  if (self->_batteryIsCharging)
  {
    if (!*((unsigned char *)v4 + 64)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_43;
  }
LABEL_29:
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0 || self->_purgeableSpace != *((void *)v4 + 6)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_43;
  }
  BOOL v5 = (*((unsigned char *)v4 + 68) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x40) == 0 || self->_userDeletableSpace != *((void *)v4 + 7)) {
      goto LABEL_43;
    }
    BOOL v5 = 1;
  }
LABEL_44:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_availableStorageInBytes;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_numberOfApps;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_numberOfSongs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_numberOfPhotos;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_batteryCurrentCapacity;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_batteryIsCharging;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_purgeableSpace;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_userDeletableSpace;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_availableStorageInBytes = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfApps = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_numberOfSongs = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_numberOfPhotos = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_batteryCurrentCapacity = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_batteryIsCharging = *((unsigned char *)v4 + 64);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_purgeableSpace = *((void *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 68) & 0x40) != 0)
  {
LABEL_9:
    self->_userDeletableSpace = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_10:
}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (unint64_t)numberOfApps
{
  return self->_numberOfApps;
}

- (unint64_t)numberOfSongs
{
  return self->_numberOfSongs;
}

- (unint64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (unint64_t)batteryCurrentCapacity
{
  return self->_batteryCurrentCapacity;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (unint64_t)purgeableSpace
{
  return self->_purgeableSpace;
}

- (unint64_t)userDeletableSpace
{
  return self->_userDeletableSpace;
}

@end