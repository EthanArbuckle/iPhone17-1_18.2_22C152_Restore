@interface AWDPowerBatteryMetrics
- (BOOL)hasCycleCountKey;
- (BOOL)hasDurationDispOn;
- (BOOL)hasDurationPartialDispOff;
- (BOOL)hasDurationPartialDispOn;
- (BOOL)hasEnergyChargedMicroWatt;
- (BOOL)hasEnergyConsumedDisplayOffMicroWatt;
- (BOOL)hasEnergyConsumedDisplayOnMicroWatt;
- (BOOL)hasEnergyConsumedPartailDispOnMicrowatt;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cycleCountKey;
- (unsigned)durationDispOn;
- (unsigned)durationPartialDispOff;
- (unsigned)durationPartialDispOn;
- (unsigned)energyChargedMicroWatt;
- (unsigned)energyConsumedDisplayOffMicroWatt;
- (unsigned)energyConsumedDisplayOnMicroWatt;
- (unsigned)energyConsumedPartailDispOnMicrowatt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCycleCountKey:(unsigned int)a3;
- (void)setDurationDispOn:(unsigned int)a3;
- (void)setDurationPartialDispOff:(unsigned int)a3;
- (void)setDurationPartialDispOn:(unsigned int)a3;
- (void)setEnergyChargedMicroWatt:(unsigned int)a3;
- (void)setEnergyConsumedDisplayOffMicroWatt:(unsigned int)a3;
- (void)setEnergyConsumedDisplayOnMicroWatt:(unsigned int)a3;
- (void)setEnergyConsumedPartailDispOnMicrowatt:(unsigned int)a3;
- (void)setHasCycleCountKey:(BOOL)a3;
- (void)setHasDurationDispOn:(BOOL)a3;
- (void)setHasDurationPartialDispOff:(BOOL)a3;
- (void)setHasDurationPartialDispOn:(BOOL)a3;
- (void)setHasEnergyChargedMicroWatt:(BOOL)a3;
- (void)setHasEnergyConsumedDisplayOffMicroWatt:(BOOL)a3;
- (void)setHasEnergyConsumedDisplayOnMicroWatt:(BOOL)a3;
- (void)setHasEnergyConsumedPartailDispOnMicrowatt:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBatteryMetrics

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

- (void)setEnergyConsumedDisplayOnMicroWatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_energyConsumedDisplayOnMicroWatt = a3;
}

- (void)setHasEnergyConsumedDisplayOnMicroWatt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEnergyConsumedDisplayOnMicroWatt
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setEnergyConsumedDisplayOffMicroWatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_energyConsumedDisplayOffMicroWatt = a3;
}

- (void)setHasEnergyConsumedDisplayOffMicroWatt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEnergyConsumedDisplayOffMicroWatt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setEnergyChargedMicroWatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_energyChargedMicroWatt = a3;
}

- (void)setHasEnergyChargedMicroWatt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnergyChargedMicroWatt
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCycleCountKey:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cycleCountKey = a3;
}

- (void)setHasCycleCountKey:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCycleCountKey
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEnergyConsumedPartailDispOnMicrowatt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_energyConsumedPartailDispOnMicrowatt = a3;
}

- (void)setHasEnergyConsumedPartailDispOnMicrowatt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEnergyConsumedPartailDispOnMicrowatt
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDurationDispOn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_durationDispOn = a3;
}

- (void)setHasDurationDispOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDurationDispOn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDurationPartialDispOn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_durationPartialDispOn = a3;
}

- (void)setHasDurationPartialDispOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDurationPartialDispOn
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDurationPartialDispOff:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationPartialDispOff = a3;
}

- (void)setHasDurationPartialDispOff:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationPartialDispOff
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBatteryMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBatteryMetrics description](&v3, sel_description), -[AWDPowerBatteryMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_energyConsumedDisplayOnMicroWatt] forKey:@"energyConsumedDisplayOnMicroWatt"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_energyConsumedDisplayOffMicroWatt] forKey:@"energyConsumedDisplayOffMicroWatt"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_energyChargedMicroWatt] forKey:@"energyChargedMicroWatt"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cycleCountKey] forKey:@"cycleCountKey"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_energyConsumedPartailDispOnMicrowatt] forKey:@"energyConsumedPartailDispOnMicrowatt"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationPartialDispOn] forKey:@"durationPartialDispOn"];
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationDispOn] forKey:@"durationDispOn"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((has & 8) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationPartialDispOff] forKey:@"durationPartialDispOff"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBatteryMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((has & 8) == 0) {
    return;
  }
LABEL_19:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_energyConsumedDisplayOnMicroWatt;
  *((_WORD *)a3 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 9) = self->_energyConsumedDisplayOffMicroWatt;
  *((_WORD *)a3 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 8) = self->_energyChargedMicroWatt;
  *((_WORD *)a3 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 4) = self->_cycleCountKey;
  *((_WORD *)a3 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 11) = self->_energyConsumedPartailDispOnMicrowatt;
  *((_WORD *)a3 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 5) = self->_durationDispOn;
  *((_WORD *)a3 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      return;
    }
LABEL_19:
    *((_DWORD *)a3 + 6) = self->_durationPartialDispOff;
    *((_WORD *)a3 + 24) |= 8u;
    return;
  }
LABEL_18:
  *((_DWORD *)a3 + 7) = self->_durationPartialDispOn;
  *((_WORD *)a3 + 24) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0) {
    goto LABEL_19;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_energyConsumedDisplayOnMicroWatt;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 9) = self->_energyConsumedDisplayOffMicroWatt;
  *((_WORD *)result + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 8) = self->_energyChargedMicroWatt;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 4) = self->_cycleCountKey;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 11) = self->_energyConsumedPartailDispOnMicrowatt;
  *((_WORD *)result + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 5) = self->_durationDispOn;
  *((_WORD *)result + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_durationPartialDispOn;
  *((_WORD *)result + 24) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_durationPartialDispOff;
  *((_WORD *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 24);
    if (has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_46;
      }
    }
    else if (v7)
    {
LABEL_46:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_energyConsumedDisplayOnMicroWatt != *((_DWORD *)a3 + 10)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_energyConsumedDisplayOffMicroWatt != *((_DWORD *)a3 + 9)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_energyChargedMicroWatt != *((_DWORD *)a3 + 8)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_cycleCountKey != *((_DWORD *)a3 + 4)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_46;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x100) == 0 || self->_energyConsumedPartailDispOnMicrowatt != *((_DWORD *)a3 + 11)) {
        goto LABEL_46;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_durationDispOn != *((_DWORD *)a3 + 5)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_46;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_durationPartialDispOn != *((_DWORD *)a3 + 7)) {
        goto LABEL_46;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_46;
    }
    LOBYTE(v5) = (v7 & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_durationPartialDispOff != *((_DWORD *)a3 + 6)) {
        goto LABEL_46;
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
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_energyConsumedDisplayOnMicroWatt;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_energyConsumedDisplayOffMicroWatt;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_energyChargedMicroWatt;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_cycleCountKey;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_energyConsumedPartailDispOnMicrowatt;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_durationDispOn;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_durationPartialDispOn;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_durationPartialDispOff;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 24);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v3 = *((_WORD *)a3 + 24);
    if ((v3 & 0x80) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_energyConsumedDisplayOnMicroWatt = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_energyConsumedDisplayOffMicroWatt = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_energyChargedMicroWatt = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_cycleCountKey = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_energyConsumedPartailDispOnMicrowatt = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_durationDispOn = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_19:
    self->_durationPartialDispOff = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 8u;
    return;
  }
LABEL_18:
  self->_durationPartialDispOn = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 24) & 8) != 0) {
    goto LABEL_19;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)energyConsumedDisplayOnMicroWatt
{
  return self->_energyConsumedDisplayOnMicroWatt;
}

- (unsigned)energyConsumedDisplayOffMicroWatt
{
  return self->_energyConsumedDisplayOffMicroWatt;
}

- (unsigned)energyChargedMicroWatt
{
  return self->_energyChargedMicroWatt;
}

- (unsigned)cycleCountKey
{
  return self->_cycleCountKey;
}

- (unsigned)energyConsumedPartailDispOnMicrowatt
{
  return self->_energyConsumedPartailDispOnMicrowatt;
}

- (unsigned)durationDispOn
{
  return self->_durationDispOn;
}

- (unsigned)durationPartialDispOn
{
  return self->_durationPartialDispOn;
}

- (unsigned)durationPartialDispOff
{
  return self->_durationPartialDispOff;
}

@end