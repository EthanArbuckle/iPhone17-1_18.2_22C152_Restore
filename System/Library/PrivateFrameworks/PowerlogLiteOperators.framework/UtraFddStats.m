@interface UtraFddStats
- (BOOL)hasActiveDuration;
- (BOOL)hasClkHighDuration;
- (BOOL)hasClkLowDuration;
- (BOOL)hasClkMedDuration;
- (BOOL)hasDeepSleepCycleCount;
- (BOOL)hasDeepSleepDuration;
- (BOOL)hasDuration;
- (BOOL)hasLightSleepCycleCount;
- (BOOL)hasLightSleepDuration;
- (BOOL)hasStartTime;
- (BOOL)hasVoltHighDuration;
- (BOOL)hasVoltLowDuration;
- (BOOL)hasVoltMedDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)startTime;
- (unsigned)activeDuration;
- (unsigned)clkHighDuration;
- (unsigned)clkLowDuration;
- (unsigned)clkMedDuration;
- (unsigned)deepSleepCycleCount;
- (unsigned)deepSleepDuration;
- (unsigned)duration;
- (unsigned)lightSleepCycleCount;
- (unsigned)lightSleepDuration;
- (unsigned)voltHighDuration;
- (unsigned)voltLowDuration;
- (unsigned)voltMedDuration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveDuration:(unsigned int)a3;
- (void)setClkHighDuration:(unsigned int)a3;
- (void)setClkLowDuration:(unsigned int)a3;
- (void)setClkMedDuration:(unsigned int)a3;
- (void)setDeepSleepCycleCount:(unsigned int)a3;
- (void)setDeepSleepDuration:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasActiveDuration:(BOOL)a3;
- (void)setHasClkHighDuration:(BOOL)a3;
- (void)setHasClkLowDuration:(BOOL)a3;
- (void)setHasClkMedDuration:(BOOL)a3;
- (void)setHasDeepSleepCycleCount:(BOOL)a3;
- (void)setHasDeepSleepDuration:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasLightSleepCycleCount:(BOOL)a3;
- (void)setHasLightSleepDuration:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasVoltHighDuration:(BOOL)a3;
- (void)setHasVoltLowDuration:(BOOL)a3;
- (void)setHasVoltMedDuration:(BOOL)a3;
- (void)setLightSleepCycleCount:(unsigned int)a3;
- (void)setLightSleepDuration:(unsigned int)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setVoltHighDuration:(unsigned int)a3;
- (void)setVoltLowDuration:(unsigned int)a3;
- (void)setVoltMedDuration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UtraFddStats

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setActiveDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActiveDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLightSleepDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_lightSleepDuration = a3;
}

- (void)setHasLightSleepDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLightSleepDuration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDeepSleepDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deepSleepDuration = a3;
}

- (void)setHasDeepSleepDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDeepSleepDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLightSleepCycleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lightSleepCycleCount = a3;
}

- (void)setHasLightSleepCycleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLightSleepCycleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDeepSleepCycleCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_deepSleepCycleCount = a3;
}

- (void)setHasDeepSleepCycleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDeepSleepCycleCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setVoltLowDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_voltLowDuration = a3;
}

- (void)setHasVoltLowDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVoltLowDuration
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVoltMedDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_voltMedDuration = a3;
}

- (void)setHasVoltMedDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVoltMedDuration
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setVoltHighDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_voltHighDuration = a3;
}

- (void)setHasVoltHighDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVoltHighDuration
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setClkLowDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_clkLowDuration = a3;
}

- (void)setHasClkLowDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasClkLowDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClkMedDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_clkMedDuration = a3;
}

- (void)setHasClkMedDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasClkMedDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setClkHighDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clkHighDuration = a3;
}

- (void)setHasClkHighDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClkHighDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UtraFddStats;
  v4 = [(UtraFddStats *)&v8 description];
  v5 = [(UtraFddStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_duration];
    [v3 setObject:v7 forKey:@"duration"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_activeDuration];
  [v3 setObject:v8 forKey:@"active_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v9 = [NSNumber numberWithUnsignedInt:self->_lightSleepDuration];
  [v3 setObject:v9 forKey:@"light_sleep_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v10 = [NSNumber numberWithUnsignedInt:self->_deepSleepDuration];
  [v3 setObject:v10 forKey:@"deep_sleep_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v11 = [NSNumber numberWithUnsignedInt:self->_lightSleepCycleCount];
  [v3 setObject:v11 forKey:@"light_sleep_cycle_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v12 = [NSNumber numberWithUnsignedInt:self->_deepSleepCycleCount];
  [v3 setObject:v12 forKey:@"deep_sleep_cycle_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v13 = [NSNumber numberWithUnsignedInt:self->_voltLowDuration];
  [v3 setObject:v13 forKey:@"volt_low_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = [NSNumber numberWithUnsignedInt:self->_voltMedDuration];
  [v3 setObject:v14 forKey:@"volt_med_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = [NSNumber numberWithUnsignedInt:self->_voltHighDuration];
  [v3 setObject:v15 forKey:@"volt_high_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = [NSNumber numberWithUnsignedInt:self->_clkLowDuration];
  [v3 setObject:v16 forKey:@"clk_low_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = [NSNumber numberWithUnsignedInt:self->_clkMedDuration];
  [v3 setObject:v17 forKey:@"clk_med_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v18 = [NSNumber numberWithUnsignedInt:self->_clkHighDuration];
  [v3 setObject:v18 forKey:@"clk_high_duration"];

  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_startTime];
    [v3 setObject:v5 forKey:@"start_time"];
  }
LABEL_15:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UtraFddStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_14:
  }
    PBDataWriterWriteUint64Field();
LABEL_15:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v4[10] = self->_duration;
    *((_WORD *)v4 + 32) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_activeDuration;
  *((_WORD *)v4 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[12] = self->_lightSleepDuration;
  *((_WORD *)v4 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[9] = self->_deepSleepDuration;
  *((_WORD *)v4 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[11] = self->_lightSleepCycleCount;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[8] = self->_deepSleepCycleCount;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[14] = self->_voltLowDuration;
  *((_WORD *)v4 + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[15] = self->_voltMedDuration;
  *((_WORD *)v4 + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[13] = self->_voltHighDuration;
  *((_WORD *)v4 + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[6] = self->_clkLowDuration;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[7] = self->_clkMedDuration;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v4[5] = self->_clkHighDuration;
  *((_WORD *)v4 + 32) |= 4u;
  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    *((void *)v4 + 1) = self->_startTime;
    *((_WORD *)v4 + 32) |= 1u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_DWORD *)result + 10) = self->_duration;
    *((_WORD *)result + 32) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_activeDuration;
  *((_WORD *)result + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_lightSleepDuration;
  *((_WORD *)result + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_deepSleepDuration;
  *((_WORD *)result + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_lightSleepCycleCount;
  *((_WORD *)result + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 8) = self->_deepSleepCycleCount;
  *((_WORD *)result + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_voltLowDuration;
  *((_WORD *)result + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 15) = self->_voltMedDuration;
  *((_WORD *)result + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 13) = self->_voltHighDuration;
  *((_WORD *)result + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 6) = self->_clkLowDuration;
  *((_WORD *)result + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = self->_clkMedDuration;
  *((_WORD *)result + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 5) = self->_clkHighDuration;
  *((_WORD *)result + 32) |= 4u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_14:
  *((void *)result + 1) = self->_startTime;
  *((_WORD *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_duration != *((_DWORD *)v4 + 10)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
LABEL_67:
    BOOL v7 = 0;
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDuration != *((_DWORD *)v4 + 4)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_lightSleepDuration != *((_DWORD *)v4 + 12)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_deepSleepDuration != *((_DWORD *)v4 + 9)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_lightSleepCycleCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_deepSleepCycleCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0 || self->_voltLowDuration != *((_DWORD *)v4 + 14)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0 || self->_voltMedDuration != *((_DWORD *)v4 + 15)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_voltHighDuration != *((_DWORD *)v4 + 13)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_clkLowDuration != *((_DWORD *)v4 + 6)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_clkMedDuration != *((_DWORD *)v4 + 7)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_clkHighDuration != *((_DWORD *)v4 + 5)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_67;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_startTime != *((void *)v4 + 1)) {
      goto LABEL_67;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 1) == 0;
  }
LABEL_68:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    uint64_t v3 = 2654435761 * self->_duration;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_activeDuration;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_lightSleepDuration;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_deepSleepDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_lightSleepCycleCount;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_deepSleepCycleCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_voltLowDuration;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_voltMedDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_voltHighDuration;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_clkLowDuration;
    if ((has & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_clkMedDuration;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 0;
    if (has) {
      goto LABEL_14;
    }
LABEL_27:
    unint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((has & 4) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_clkHighDuration;
  if ((has & 1) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  unint64_t v15 = 2654435761u * self->_startTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_activeDuration = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_lightSleepDuration = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_deepSleepDuration = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_lightSleepCycleCount = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_deepSleepCycleCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_voltLowDuration = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_voltMedDuration = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_voltHighDuration = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_clkLowDuration = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_clkMedDuration = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  self->_clkHighDuration = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  if (*((_WORD *)v4 + 32))
  {
LABEL_14:
    self->_startTime = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_15:
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)activeDuration
{
  return self->_activeDuration;
}

- (unsigned)lightSleepDuration
{
  return self->_lightSleepDuration;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
}

- (unsigned)lightSleepCycleCount
{
  return self->_lightSleepCycleCount;
}

- (unsigned)deepSleepCycleCount
{
  return self->_deepSleepCycleCount;
}

- (unsigned)voltLowDuration
{
  return self->_voltLowDuration;
}

- (unsigned)voltMedDuration
{
  return self->_voltMedDuration;
}

- (unsigned)voltHighDuration
{
  return self->_voltHighDuration;
}

- (unsigned)clkLowDuration
{
  return self->_clkLowDuration;
}

- (unsigned)clkMedDuration
{
  return self->_clkMedDuration;
}

- (unsigned)clkHighDuration
{
  return self->_clkHighDuration;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end