@interface AWDCoreRoutinePersistenceStoreMigrationDuration
- (BOOL)didVacuum;
- (BOOL)hasByteSize;
- (BOOL)hasDeviceClass;
- (BOOL)hasDidVacuum;
- (BOOL)hasMigrationTimeInterval;
- (BOOL)hasNextModelVersion;
- (BOOL)hasPreviousModelVersion;
- (BOOL)hasStoreType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)migrationTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)byteSize;
- (int)deviceClass;
- (int)nextModelVersion;
- (int)previousModelVersion;
- (int)storeType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setByteSize:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDidVacuum:(BOOL)a3;
- (void)setHasByteSize:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasDidVacuum:(BOOL)a3;
- (void)setHasMigrationTimeInterval:(BOOL)a3;
- (void)setHasNextModelVersion:(BOOL)a3;
- (void)setHasPreviousModelVersion:(BOOL)a3;
- (void)setHasStoreType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMigrationTimeInterval:(double)a3;
- (void)setNextModelVersion:(int)a3;
- (void)setPreviousModelVersion:(int)a3;
- (void)setStoreType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePersistenceStoreMigrationDuration

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStoreType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_storeType = a3;
}

- (void)setHasStoreType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStoreType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMigrationTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_migrationTimeInterval = a3;
}

- (void)setHasMigrationTimeInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMigrationTimeInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDidVacuum:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_didVacuum = a3;
}

- (void)setHasDidVacuum:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasDidVacuum
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDeviceClass:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deviceClass = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPreviousModelVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_previousModelVersion = a3;
}

- (void)setHasPreviousModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPreviousModelVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNextModelVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_nextModelVersion = a3;
}

- (void)setHasNextModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNextModelVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setByteSize:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_byteSize = a3;
}

- (void)setHasByteSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasByteSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceStoreMigrationDuration;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePersistenceStoreMigrationDuration description](&v3, sel_description), -[AWDCoreRoutinePersistenceStoreMigrationDuration dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_storeType] forKey:@"storeType"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithDouble:self->_migrationTimeInterval] forKey:@"migrationTimeInterval"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithBool:self->_didVacuum] forKey:@"didVacuum"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithInt:self->_deviceClass] forKey:@"deviceClass"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithInt:self->_nextModelVersion] forKey:@"nextModelVersion"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithInt:self->_previousModelVersion] forKey:@"previousModelVersion"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 4) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_byteSize] forKey:@"byteSize"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceStoreMigrationDurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 4) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_storeType;
  *((unsigned char *)a3 + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 1) = *(void *)&self->_migrationTimeInterval;
  *((unsigned char *)a3 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)a3 + 44) = self->_didVacuum;
  *((unsigned char *)a3 + 48) |= 0x80u;
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
  *((_DWORD *)a3 + 7) = self->_deviceClass;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_previousModelVersion;
  *((unsigned char *)a3 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      return;
    }
LABEL_17:
    *((_DWORD *)a3 + 6) = self->_byteSize;
    *((unsigned char *)a3 + 48) |= 4u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 8) = self->_nextModelVersion;
  *((unsigned char *)a3 + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_storeType;
  *((unsigned char *)result + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 1) = *(void *)&self->_migrationTimeInterval;
  *((unsigned char *)result + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 44) = self->_didVacuum;
  *((unsigned char *)result + 48) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_deviceClass;
  *((unsigned char *)result + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_previousModelVersion;
  *((unsigned char *)result + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_nextModelVersion;
  *((unsigned char *)result + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_byteSize;
  *((unsigned char *)result + 48) |= 4u;
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
    if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_storeType != *((_DWORD *)a3 + 10)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_migrationTimeInterval != *((double *)a3 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)a3 + 48))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x80) == 0) {
      goto LABEL_19;
    }
LABEL_44:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 48) & 0x80) == 0) {
    goto LABEL_44;
  }
  if (self->_didVacuum)
  {
    if (!*((unsigned char *)a3 + 44)) {
      goto LABEL_44;
    }
    goto LABEL_19;
  }
  if (*((unsigned char *)a3 + 44)) {
    goto LABEL_44;
  }
LABEL_19:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_deviceClass != *((_DWORD *)a3 + 7)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_previousModelVersion != *((_DWORD *)a3 + 9)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_nextModelVersion != *((_DWORD *)a3 + 8)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_byteSize != *((_DWORD *)a3 + 6)) {
      goto LABEL_44;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_storeType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double migrationTimeInterval = self->_migrationTimeInterval;
  double v7 = -migrationTimeInterval;
  if (migrationTimeInterval >= 0.0) {
    double v7 = self->_migrationTimeInterval;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if (has < 0)
  {
    uint64_t v11 = 2654435761 * self->_didVacuum;
    if ((has & 8) == 0)
    {
LABEL_15:
      uint64_t v12 = 0;
      if ((has & 0x20) != 0) {
        goto LABEL_16;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
  }
  uint64_t v12 = 2654435761 * self->_deviceClass;
  if ((has & 0x20) != 0)
  {
LABEL_16:
    uint64_t v13 = 2654435761 * self->_previousModelVersion;
    if ((has & 0x10) != 0) {
      goto LABEL_17;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((has & 4) != 0) {
      goto LABEL_18;
    }
LABEL_23:
    uint64_t v15 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_nextModelVersion;
  if ((has & 4) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_byteSize;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_storeType = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double migrationTimeInterval = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_didVacuum = *((unsigned char *)a3 + 44);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_deviceClass = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_previousModelVersion = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_17:
    self->_byteSize = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_16:
  self->_nextModelVersion = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 48) & 4) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)storeType
{
  return self->_storeType;
}

- (double)migrationTimeInterval
{
  return self->_migrationTimeInterval;
}

- (BOOL)didVacuum
{
  return self->_didVacuum;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)previousModelVersion
{
  return self->_previousModelVersion;
}

- (int)nextModelVersion
{
  return self->_nextModelVersion;
}

- (int)byteSize
{
  return self->_byteSize;
}

@end