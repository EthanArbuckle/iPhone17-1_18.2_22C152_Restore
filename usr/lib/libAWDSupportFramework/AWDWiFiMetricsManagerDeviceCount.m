@interface AWDWiFiMetricsManagerDeviceCount
- (BOOL)hasDeviceCount;
- (BOOL)hasDeviceIdentifierMap;
- (BOOL)hasDeviceInitFailureReason;
- (BOOL)hasTimeSinceBoot;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timeSinceBoot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)deviceCount;
- (unsigned)deviceIdentifierMap;
- (unsigned)deviceInitFailureReason;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceCount:(unsigned int)a3;
- (void)setDeviceIdentifierMap:(unsigned int)a3;
- (void)setDeviceInitFailureReason:(unsigned int)a3;
- (void)setHasDeviceCount:(BOOL)a3;
- (void)setHasDeviceIdentifierMap:(BOOL)a3;
- (void)setHasDeviceInitFailureReason:(BOOL)a3;
- (void)setHasTimeSinceBoot:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimeSinceBoot:(double)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerDeviceCount

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

- (void)setDeviceCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deviceCount = a3;
}

- (void)setHasDeviceCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceBoot:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeSinceBoot = a3;
}

- (void)setHasTimeSinceBoot:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceBoot
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceIdentifierMap:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deviceIdentifierMap = a3;
}

- (void)setHasDeviceIdentifierMap:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceIdentifierMap
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDeviceInitFailureReason:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_deviceInitFailureReason = a3;
}

- (void)setHasDeviceInitFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeviceInitFailureReason
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerDeviceCount;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerDeviceCount description](&v3, sel_description), -[AWDWiFiMetricsManagerDeviceCount dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_deviceCount] forKey:@"deviceCount"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_deviceIdentifierMap) forKey:@"deviceIdentifierMap"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithDouble:self->_timeSinceBoot] forKey:@"timeSinceBoot"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_deviceInitFailureReason] forKey:@"deviceInitFailureReason"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerDeviceCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
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
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 2u;
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
  *((_DWORD *)a3 + 6) = self->_deviceCount;
  *((unsigned char *)a3 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((void *)a3 + 1) = *(void *)&self->_timeSinceBoot;
  *((unsigned char *)a3 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 7) = self->_deviceIdentifierMap;
    *((unsigned char *)a3 + 36) |= 8u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 8) = self->_deviceInitFailureReason;
  *((unsigned char *)a3 + 36) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 36) |= 2u;
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
  *((_DWORD *)result + 6) = self->_deviceCount;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 1) = *(void *)&self->_timeSinceBoot;
  *((unsigned char *)result + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_deviceInitFailureReason;
  *((unsigned char *)result + 36) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 7) = self->_deviceIdentifierMap;
  *((unsigned char *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_deviceCount != *((_DWORD *)a3 + 6)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_26;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timeSinceBoot != *((double *)a3 + 1)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x10) == 0 || self->_deviceInitFailureReason != *((_DWORD *)a3 + 8)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_deviceIdentifierMap != *((_DWORD *)a3 + 7)) {
        goto LABEL_26;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_deviceCount;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double timeSinceBoot = self->_timeSinceBoot;
  double v7 = -timeSinceBoot;
  if (timeSinceBoot >= 0.0) {
    double v7 = self->_timeSinceBoot;
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
  if ((has & 0x10) != 0)
  {
    uint64_t v11 = 2654435761 * self->_deviceInitFailureReason;
    if ((has & 8) != 0) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v12 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v12 = 2654435761 * self->_deviceIdentifierMap;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_deviceCount = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_double timeSinceBoot = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_11:
    self->_deviceIdentifierMap = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_10:
  self->_deviceInitFailureReason = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 36) & 8) != 0) {
    goto LABEL_11;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)deviceCount
{
  return self->_deviceCount;
}

- (double)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (unsigned)deviceIdentifierMap
{
  return self->_deviceIdentifierMap;
}

- (unsigned)deviceInitFailureReason
{
  return self->_deviceInitFailureReason;
}

@end