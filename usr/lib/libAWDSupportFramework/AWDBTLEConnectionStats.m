@interface AWDBTLEConnectionStats
- (BOOL)hasComplete;
- (BOOL)hasDc0;
- (BOOL)hasDc1;
- (BOOL)hasDc2;
- (BOOL)hasDc3;
- (BOOL)hasDc4;
- (BOOL)hasDc5;
- (BOOL)hasPeakOutage;
- (BOOL)hasStart;
- (BOOL)hasTotalDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)complete;
- (unsigned)dc0;
- (unsigned)dc1;
- (unsigned)dc2;
- (unsigned)dc3;
- (unsigned)dc4;
- (unsigned)dc5;
- (unsigned)peakOutage;
- (unsigned)start;
- (unsigned)totalDuration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComplete:(unsigned int)a3;
- (void)setDc0:(unsigned int)a3;
- (void)setDc1:(unsigned int)a3;
- (void)setDc2:(unsigned int)a3;
- (void)setDc3:(unsigned int)a3;
- (void)setDc4:(unsigned int)a3;
- (void)setDc5:(unsigned int)a3;
- (void)setHasComplete:(BOOL)a3;
- (void)setHasDc0:(BOOL)a3;
- (void)setHasDc1:(BOOL)a3;
- (void)setHasDc2:(BOOL)a3;
- (void)setHasDc3:(BOOL)a3;
- (void)setHasDc4:(BOOL)a3;
- (void)setHasDc5:(BOOL)a3;
- (void)setHasPeakOutage:(BOOL)a3;
- (void)setHasStart:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setPeakOutage:(unsigned int)a3;
- (void)setStart:(unsigned int)a3;
- (void)setTotalDuration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBTLEConnectionStats

- (void)setStart:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStart
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setComplete:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_complete = a3;
}

- (void)setHasComplete:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasComplete
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPeakOutage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peakOutage = a3;
}

- (void)setHasPeakOutage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeakOutage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDc0:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dc0 = a3;
}

- (void)setHasDc0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDc0
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDc1:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dc1 = a3;
}

- (void)setHasDc1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDc1
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDc2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dc2 = a3;
}

- (void)setHasDc2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDc2
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDc3:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dc3 = a3;
}

- (void)setHasDc3:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDc3
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDc4:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_dc4 = a3;
}

- (void)setHasDc4:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDc4
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDc5:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_dc5 = a3;
}

- (void)setHasDc5:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDc5
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDBTLEConnectionStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDBTLEConnectionStats description](&v3, sel_description), -[AWDBTLEConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_start] forKey:@"start"];
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_complete] forKey:@"complete"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peakOutage] forKey:@"peakOutage"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalDuration] forKey:@"totalDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc0] forKey:@"dc0"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc1] forKey:@"dc1"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc2] forKey:@"dc2"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc4] forKey:@"dc4"];
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc3] forKey:@"dc3"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x40) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dc5] forKey:@"dc5"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBTLEConnectionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_start;
    *((_WORD *)a3 + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 2) = self->_complete;
  *((_WORD *)a3 + 24) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 9) = self->_peakOutage;
  *((_WORD *)a3 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 11) = self->_totalDuration;
  *((_WORD *)a3 + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 3) = self->_dc0;
  *((_WORD *)a3 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 4) = self->_dc1;
  *((_WORD *)a3 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 5) = self->_dc2;
  *((_WORD *)a3 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 6) = self->_dc3;
  *((_WORD *)a3 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      return;
    }
LABEL_21:
    *((_DWORD *)a3 + 8) = self->_dc5;
    *((_WORD *)a3 + 24) |= 0x40u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 7) = self->_dc4;
  *((_WORD *)a3 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_start;
    *((_WORD *)result + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_complete;
  *((_WORD *)result + 24) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_peakOutage;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 11) = self->_totalDuration;
  *((_WORD *)result + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 3) = self->_dc0;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_dc1;
  *((_WORD *)result + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 5) = self->_dc2;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_dc3;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 7) = self->_dc4;
  *((_WORD *)result + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_dc5;
  *((_WORD *)result + 24) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 24);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x100) == 0 || self->_start != *((_DWORD *)a3 + 10)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_complete != *((_DWORD *)a3 + 2)) {
        goto LABEL_51;
      }
    }
    else if (v7)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_peakOutage != *((_DWORD *)a3 + 9)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x200) == 0 || self->_totalDuration != *((_DWORD *)a3 + 11)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_dc0 != *((_DWORD *)a3 + 3)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_dc1 != *((_DWORD *)a3 + 4)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_dc2 != *((_DWORD *)a3 + 5)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_dc3 != *((_DWORD *)a3 + 6)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_dc4 != *((_DWORD *)a3 + 7)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_dc5 != *((_DWORD *)a3 + 8)) {
        goto LABEL_51;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v3 = 2654435761 * self->_start;
    if (has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_complete;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (has) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_peakOutage;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_totalDuration;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_dc0;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_dc1;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_dc2;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_dc3;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_dc4;
  if ((has & 0x40) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_dc5;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x100) != 0)
  {
    self->_start = *((_DWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v3 = *((_WORD *)a3 + 24);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_complete = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_peakOutage = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x200) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_totalDuration = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_dc0 = *((_DWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_dc1 = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_dc2 = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_dc3 = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x40) == 0) {
      return;
    }
LABEL_21:
    self->_dc5 = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 0x40u;
    return;
  }
LABEL_20:
  self->_dc4 = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 24) & 0x40) != 0) {
    goto LABEL_21;
  }
}

- (unsigned)start
{
  return self->_start;
}

- (unsigned)complete
{
  return self->_complete;
}

- (unsigned)peakOutage
{
  return self->_peakOutage;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)dc0
{
  return self->_dc0;
}

- (unsigned)dc1
{
  return self->_dc1;
}

- (unsigned)dc2
{
  return self->_dc2;
}

- (unsigned)dc3
{
  return self->_dc3;
}

- (unsigned)dc4
{
  return self->_dc4;
}

- (unsigned)dc5
{
  return self->_dc5;
}

@end