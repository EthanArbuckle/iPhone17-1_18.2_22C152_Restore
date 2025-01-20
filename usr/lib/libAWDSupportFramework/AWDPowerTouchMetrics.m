@interface AWDPowerTouchMetrics
- (BOOL)hasTimestamp;
- (BOOL)hasTocuhTotalUserInteractionDuration;
- (BOOL)hasTouchStateActiveDuration;
- (BOOL)hasTouchStateAnticipateDuration;
- (BOOL)hasTouchStateOffDuration;
- (BOOL)hasTouchStateOnDuration;
- (BOOL)hasTouchStateOthersDuration;
- (BOOL)hasTouchStateReadyDuration;
- (BOOL)hasTouchTotalPowerMicroWatt;
- (BOOL)hasTouchTotalUserTouchCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)tocuhTotalUserInteractionDuration;
- (unsigned)touchStateActiveDuration;
- (unsigned)touchStateAnticipateDuration;
- (unsigned)touchStateOffDuration;
- (unsigned)touchStateOnDuration;
- (unsigned)touchStateOthersDuration;
- (unsigned)touchStateReadyDuration;
- (unsigned)touchTotalPowerMicroWatt;
- (unsigned)touchTotalUserTouchCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTocuhTotalUserInteractionDuration:(BOOL)a3;
- (void)setHasTouchStateActiveDuration:(BOOL)a3;
- (void)setHasTouchStateAnticipateDuration:(BOOL)a3;
- (void)setHasTouchStateOffDuration:(BOOL)a3;
- (void)setHasTouchStateOnDuration:(BOOL)a3;
- (void)setHasTouchStateOthersDuration:(BOOL)a3;
- (void)setHasTouchStateReadyDuration:(BOOL)a3;
- (void)setHasTouchTotalPowerMicroWatt:(BOOL)a3;
- (void)setHasTouchTotalUserTouchCount:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTocuhTotalUserInteractionDuration:(unsigned int)a3;
- (void)setTouchStateActiveDuration:(unsigned int)a3;
- (void)setTouchStateAnticipateDuration:(unsigned int)a3;
- (void)setTouchStateOffDuration:(unsigned int)a3;
- (void)setTouchStateOnDuration:(unsigned int)a3;
- (void)setTouchStateOthersDuration:(unsigned int)a3;
- (void)setTouchStateReadyDuration:(unsigned int)a3;
- (void)setTouchTotalPowerMicroWatt:(unsigned int)a3;
- (void)setTouchTotalUserTouchCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerTouchMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTouchStateActiveDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_touchStateActiveDuration = a3;
}

- (void)setHasTouchStateActiveDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTouchStateActiveDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTouchStateReadyDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_touchStateReadyDuration = a3;
}

- (void)setHasTouchStateReadyDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTouchStateReadyDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTouchStateAnticipateDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_touchStateAnticipateDuration = a3;
}

- (void)setHasTouchStateAnticipateDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTouchStateAnticipateDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTouchStateOffDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_touchStateOffDuration = a3;
}

- (void)setHasTouchStateOffDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTouchStateOffDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTouchStateOnDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_touchStateOnDuration = a3;
}

- (void)setHasTouchStateOnDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTouchStateOnDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTouchStateOthersDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_touchStateOthersDuration = a3;
}

- (void)setHasTouchStateOthersDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTouchStateOthersDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTouchTotalPowerMicroWatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_touchTotalPowerMicroWatt = a3;
}

- (void)setHasTouchTotalPowerMicroWatt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTouchTotalPowerMicroWatt
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTouchTotalUserTouchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_touchTotalUserTouchCount = a3;
}

- (void)setHasTouchTotalUserTouchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTouchTotalUserTouchCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTocuhTotalUserInteractionDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_tocuhTotalUserInteractionDuration = a3;
}

- (void)setHasTocuhTotalUserInteractionDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTocuhTotalUserInteractionDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerTouchMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerTouchMetrics description](&v3, sel_description), -[AWDPowerTouchMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateActiveDuration] forKey:@"touchStateActiveDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateReadyDuration] forKey:@"touchStateReadyDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateAnticipateDuration] forKey:@"touchStateAnticipateDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateOffDuration] forKey:@"touchStateOffDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateOnDuration] forKey:@"touchStateOnDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchStateOthersDuration] forKey:@"touchStateOthersDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchTotalUserTouchCount] forKey:@"touchTotalUserTouchCount"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_touchTotalPowerMicroWatt] forKey:@"touchTotalPowerMicroWatt"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 2) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tocuhTotalUserInteractionDuration] forKey:@"tocuhTotalUserInteractionDuration"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerTouchMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 2) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_touchStateActiveDuration;
  *((_WORD *)a3 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_touchStateReadyDuration;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 6) = self->_touchStateAnticipateDuration;
  *((_WORD *)a3 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 7) = self->_touchStateOffDuration;
  *((_WORD *)a3 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 8) = self->_touchStateOnDuration;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_touchStateOthersDuration;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_touchTotalPowerMicroWatt;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return;
    }
LABEL_21:
    *((_DWORD *)a3 + 4) = self->_tocuhTotalUserInteractionDuration;
    *((_WORD *)a3 + 26) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_touchTotalUserTouchCount;
  *((_WORD *)a3 + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_touchStateActiveDuration;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_touchStateReadyDuration;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_touchStateAnticipateDuration;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_touchStateOffDuration;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_touchStateOnDuration;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_touchStateOthersDuration;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_touchTotalPowerMicroWatt;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 12) = self->_touchTotalUserTouchCount;
  *((_WORD *)result + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_tocuhTotalUserInteractionDuration;
  *((_WORD *)result + 26) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 26);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_51;
      }
    }
    else if (v7)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_touchStateActiveDuration != *((_DWORD *)a3 + 5)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_touchStateReadyDuration != *((_DWORD *)a3 + 10)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_touchStateAnticipateDuration != *((_DWORD *)a3 + 6)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_touchStateOffDuration != *((_DWORD *)a3 + 7)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_touchStateOnDuration != *((_DWORD *)a3 + 8)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_touchStateOthersDuration != *((_DWORD *)a3 + 9)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_touchTotalPowerMicroWatt != *((_DWORD *)a3 + 11)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x200) == 0 || self->_touchTotalUserTouchCount != *((_DWORD *)a3 + 12)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_tocuhTotalUserInteractionDuration != *((_DWORD *)a3 + 4)) {
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
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_touchStateActiveDuration;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_touchStateReadyDuration;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_touchStateAnticipateDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_touchStateOffDuration;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_touchStateOnDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_touchStateOthersDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_touchTotalPowerMicroWatt;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_touchTotalUserTouchCount;
  if ((has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_tocuhTotalUserInteractionDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 26);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v3 = *((_WORD *)a3 + 26);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_touchStateActiveDuration = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_touchStateReadyDuration = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_touchStateAnticipateDuration = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_touchStateOffDuration = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_touchStateOnDuration = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_touchStateOthersDuration = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_touchTotalPowerMicroWatt = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_21:
    self->_tocuhTotalUserInteractionDuration = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_touchTotalUserTouchCount = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 26) & 2) != 0) {
    goto LABEL_21;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)touchStateActiveDuration
{
  return self->_touchStateActiveDuration;
}

- (unsigned)touchStateReadyDuration
{
  return self->_touchStateReadyDuration;
}

- (unsigned)touchStateAnticipateDuration
{
  return self->_touchStateAnticipateDuration;
}

- (unsigned)touchStateOffDuration
{
  return self->_touchStateOffDuration;
}

- (unsigned)touchStateOnDuration
{
  return self->_touchStateOnDuration;
}

- (unsigned)touchStateOthersDuration
{
  return self->_touchStateOthersDuration;
}

- (unsigned)touchTotalPowerMicroWatt
{
  return self->_touchTotalPowerMicroWatt;
}

- (unsigned)touchTotalUserTouchCount
{
  return self->_touchTotalUserTouchCount;
}

- (unsigned)tocuhTotalUserInteractionDuration
{
  return self->_tocuhTotalUserInteractionDuration;
}

@end