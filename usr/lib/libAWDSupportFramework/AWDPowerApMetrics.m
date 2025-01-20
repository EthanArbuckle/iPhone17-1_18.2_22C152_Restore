@interface AWDPowerApMetrics
- (BOOL)hasApAwakeDuration;
- (BOOL)hasCpuPowerMicroWatt;
- (BOOL)hasDramPowerMicroWatt;
- (BOOL)hasGpuPowerMicroWatt;
- (BOOL)hasSocPowerMicroWatt;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)apAwakeDuration;
- (unsigned)cpuPowerMicroWatt;
- (unsigned)dramPowerMicroWatt;
- (unsigned)gpuPowerMicroWatt;
- (unsigned)socPowerMicroWatt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApAwakeDuration:(unsigned int)a3;
- (void)setCpuPowerMicroWatt:(unsigned int)a3;
- (void)setDramPowerMicroWatt:(unsigned int)a3;
- (void)setGpuPowerMicroWatt:(unsigned int)a3;
- (void)setHasApAwakeDuration:(BOOL)a3;
- (void)setHasCpuPowerMicroWatt:(BOOL)a3;
- (void)setHasDramPowerMicroWatt:(BOOL)a3;
- (void)setHasGpuPowerMicroWatt:(BOOL)a3;
- (void)setHasSocPowerMicroWatt:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSocPowerMicroWatt:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerApMetrics

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

- (void)setCpuPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cpuPowerMicroWatt = a3;
}

- (void)setHasCpuPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCpuPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSocPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_socPowerMicroWatt = a3;
}

- (void)setHasSocPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSocPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setGpuPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_gpuPowerMicroWatt = a3;
}

- (void)setHasGpuPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasGpuPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDramPowerMicroWatt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dramPowerMicroWatt = a3;
}

- (void)setHasDramPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDramPowerMicroWatt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setApAwakeDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_apAwakeDuration = a3;
}

- (void)setHasApAwakeDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApAwakeDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerApMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerApMetrics description](&v3, sel_description), -[AWDPowerApMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
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
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cpuPowerMicroWatt] forKey:@"cpuPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_socPowerMicroWatt] forKey:@"socPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dramPowerMicroWatt] forKey:@"dramPowerMicroWatt"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gpuPowerMicroWatt] forKey:@"gpuPowerMicroWatt"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 2) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_apAwakeDuration] forKey:@"apAwakeDuration"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerApMetricsReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 2) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_cpuPowerMicroWatt;
  *((unsigned char *)a3 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)a3 + 8) = self->_socPowerMicroWatt;
  *((unsigned char *)a3 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 7) = self->_gpuPowerMicroWatt;
  *((unsigned char *)a3 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 4) = self->_apAwakeDuration;
    *((unsigned char *)a3 + 36) |= 2u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_dramPowerMicroWatt;
  *((unsigned char *)a3 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_cpuPowerMicroWatt;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_socPowerMicroWatt;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_gpuPowerMicroWatt;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_dramPowerMicroWatt;
  *((unsigned char *)result + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 4) = self->_apAwakeDuration;
  *((unsigned char *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_cpuPowerMicroWatt != *((_DWORD *)a3 + 5)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x20) == 0 || self->_socPowerMicroWatt != *((_DWORD *)a3 + 8)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x20) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 0x10) == 0 || self->_gpuPowerMicroWatt != *((_DWORD *)a3 + 7)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 0x10) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_dramPowerMicroWatt != *((_DWORD *)a3 + 6)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_31;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 36) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_apAwakeDuration != *((_DWORD *)a3 + 4)) {
        goto LABEL_31;
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
      uint64_t v3 = 2654435761 * self->_cpuPowerMicroWatt;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_socPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_gpuPowerMicroWatt;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_dramPowerMicroWatt;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_apAwakeDuration;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_cpuPowerMicroWatt = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_socPowerMicroWatt = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_gpuPowerMicroWatt = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_13:
    self->_apAwakeDuration = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_12:
  self->_dramPowerMicroWatt = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 36) & 2) != 0) {
    goto LABEL_13;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cpuPowerMicroWatt
{
  return self->_cpuPowerMicroWatt;
}

- (unsigned)socPowerMicroWatt
{
  return self->_socPowerMicroWatt;
}

- (unsigned)gpuPowerMicroWatt
{
  return self->_gpuPowerMicroWatt;
}

- (unsigned)dramPowerMicroWatt
{
  return self->_dramPowerMicroWatt;
}

- (unsigned)apAwakeDuration
{
  return self->_apAwakeDuration;
}

@end