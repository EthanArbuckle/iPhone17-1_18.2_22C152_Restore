@interface AWDWiFiMetricsManagerWifidAvailability
- (BOOL)hasPid;
- (BOOL)hasTimestamp;
- (BOOL)hasWifidBootTimeDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)wifidBootTimeDiff;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)pid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWifidBootTimeDiff:(BOOL)a3;
- (void)setPid:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWifidBootTimeDiff:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerWifidAvailability

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

- (void)setWifidBootTimeDiff:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wifidBootTimeDiff = a3;
}

- (void)setHasWifidBootTimeDiff:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWifidBootTimeDiff
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPid
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerWifidAvailability;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerWifidAvailability description](&v3, sel_description), -[AWDWiFiMetricsManagerWifidAvailability dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithDouble:self->_wifidBootTimeDiff] forKey:@"wifidBootTimeDiff"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pid] forKey:@"pid"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerWifidAvailabilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 6) = self->_pid;
      *((unsigned char *)a3 + 28) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = *(void *)&self->_wifidBootTimeDiff;
  *((unsigned char *)a3 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = *(void *)&self->_wifidBootTimeDiff;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 6) = self->_pid;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_wifidBootTimeDiff != *((double *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_pid != *((_DWORD *)a3 + 6)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double wifidBootTimeDiff = self->_wifidBootTimeDiff;
  double v6 = -wifidBootTimeDiff;
  if (wifidBootTimeDiff >= 0.0) {
    double v6 = self->_wifidBootTimeDiff;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_pid;
  }
  else {
    uint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_pid = *((_DWORD *)a3 + 6);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double wifidBootTimeDiff = *((double *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 28) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)wifidBootTimeDiff
{
  return self->_wifidBootTimeDiff;
}

- (unsigned)pid
{
  return self->_pid;
}

@end