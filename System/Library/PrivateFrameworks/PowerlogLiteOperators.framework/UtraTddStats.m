@interface UtraTddStats
- (BOOL)hasActiveDuration;
- (BOOL)hasDeepSleepCycleCount;
- (BOOL)hasDeepSleepDuration;
- (BOOL)hasDuration;
- (BOOL)hasNormalSleepDuration;
- (BOOL)hasStartTime;
- (BOOL)hasThClkOpt0Duration;
- (BOOL)hasThClkOpt1Duration;
- (BOOL)hasVoltHighDuration;
- (BOOL)hasVoltLowDuration;
- (BOOL)hasVoltMedDuration;
- (BOOL)hasZspClkOpt0Duration;
- (BOOL)hasZspClkOpt1Duration;
- (BOOL)hasZspClkOpt2Duration;
- (BOOL)hasZspClkOpt3Duration;
- (BOOL)hasZspClkOpt4Duration;
- (BOOL)hasZspClkOpt5Duration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)startTime;
- (unsigned)activeDuration;
- (unsigned)deepSleepCycleCount;
- (unsigned)deepSleepDuration;
- (unsigned)duration;
- (unsigned)normalSleepDuration;
- (unsigned)thClkOpt0Duration;
- (unsigned)thClkOpt1Duration;
- (unsigned)voltHighDuration;
- (unsigned)voltLowDuration;
- (unsigned)voltMedDuration;
- (unsigned)zspClkOpt0Duration;
- (unsigned)zspClkOpt1Duration;
- (unsigned)zspClkOpt2Duration;
- (unsigned)zspClkOpt3Duration;
- (unsigned)zspClkOpt4Duration;
- (unsigned)zspClkOpt5Duration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveDuration:(unsigned int)a3;
- (void)setDeepSleepCycleCount:(unsigned int)a3;
- (void)setDeepSleepDuration:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasActiveDuration:(BOOL)a3;
- (void)setHasDeepSleepCycleCount:(BOOL)a3;
- (void)setHasDeepSleepDuration:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasNormalSleepDuration:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasThClkOpt0Duration:(BOOL)a3;
- (void)setHasThClkOpt1Duration:(BOOL)a3;
- (void)setHasVoltHighDuration:(BOOL)a3;
- (void)setHasVoltLowDuration:(BOOL)a3;
- (void)setHasVoltMedDuration:(BOOL)a3;
- (void)setHasZspClkOpt0Duration:(BOOL)a3;
- (void)setHasZspClkOpt1Duration:(BOOL)a3;
- (void)setHasZspClkOpt2Duration:(BOOL)a3;
- (void)setHasZspClkOpt3Duration:(BOOL)a3;
- (void)setHasZspClkOpt4Duration:(BOOL)a3;
- (void)setHasZspClkOpt5Duration:(BOOL)a3;
- (void)setNormalSleepDuration:(unsigned int)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setThClkOpt0Duration:(unsigned int)a3;
- (void)setThClkOpt1Duration:(unsigned int)a3;
- (void)setVoltHighDuration:(unsigned int)a3;
- (void)setVoltLowDuration:(unsigned int)a3;
- (void)setVoltMedDuration:(unsigned int)a3;
- (void)setZspClkOpt0Duration:(unsigned int)a3;
- (void)setZspClkOpt1Duration:(unsigned int)a3;
- (void)setZspClkOpt2Duration:(unsigned int)a3;
- (void)setZspClkOpt3Duration:(unsigned int)a3;
- (void)setZspClkOpt4Duration:(unsigned int)a3;
- (void)setZspClkOpt5Duration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UtraTddStats

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setActiveDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeDuration = a3;
}

- (void)setHasActiveDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNormalSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_normalSleepDuration = a3;
}

- (void)setHasNormalSleepDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNormalSleepDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDeepSleepDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_deepSleepDuration = a3;
}

- (void)setHasDeepSleepDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeepSleepDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDeepSleepCycleCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_deepSleepCycleCount = a3;
}

- (void)setHasDeepSleepCycleCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDeepSleepCycleCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVoltLowDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_voltLowDuration = a3;
}

- (void)setHasVoltLowDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasVoltLowDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setVoltMedDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_voltMedDuration = a3;
}

- (void)setHasVoltMedDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasVoltMedDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setVoltHighDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_voltHighDuration = a3;
}

- (void)setHasVoltHighDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasVoltHighDuration
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setZspClkOpt0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_zspClkOpt0Duration = a3;
}

- (void)setHasZspClkOpt0Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasZspClkOpt0Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setZspClkOpt1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_zspClkOpt1Duration = a3;
}

- (void)setHasZspClkOpt1Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasZspClkOpt1Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setZspClkOpt2Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_zspClkOpt2Duration = a3;
}

- (void)setHasZspClkOpt2Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasZspClkOpt2Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setZspClkOpt3Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_zspClkOpt3Duration = a3;
}

- (void)setHasZspClkOpt3Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasZspClkOpt3Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setZspClkOpt4Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_zspClkOpt4Duration = a3;
}

- (void)setHasZspClkOpt4Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasZspClkOpt4Duration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setZspClkOpt5Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_zspClkOpt5Duration = a3;
}

- (void)setHasZspClkOpt5Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasZspClkOpt5Duration
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setThClkOpt0Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_thClkOpt0Duration = a3;
}

- (void)setHasThClkOpt0Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasThClkOpt0Duration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setThClkOpt1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_thClkOpt1Duration = a3;
}

- (void)setHasThClkOpt1Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasThClkOpt1Duration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_has = ($47EACDA4C9A419300A4563DF10B362A3)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasStartTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UtraTddStats;
  v4 = [(UtraTddStats *)&v8 description];
  v5 = [(UtraTddStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_duration];
    [v3 setObject:v7 forKey:@"duration"];

    $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_activeDuration];
  [v3 setObject:v8 forKey:@"active_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v9 = [NSNumber numberWithUnsignedInt:self->_normalSleepDuration];
  [v3 setObject:v9 forKey:@"normal_sleep_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v10 = [NSNumber numberWithUnsignedInt:self->_deepSleepDuration];
  [v3 setObject:v10 forKey:@"deep_sleep_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v11 = [NSNumber numberWithUnsignedInt:self->_deepSleepCycleCount];
  [v3 setObject:v11 forKey:@"deep_sleep_cycle_count"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v12 = [NSNumber numberWithUnsignedInt:self->_voltLowDuration];
  [v3 setObject:v12 forKey:@"volt_low_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v13 = [NSNumber numberWithUnsignedInt:self->_voltMedDuration];
  [v3 setObject:v13 forKey:@"volt_med_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v14 = [NSNumber numberWithUnsignedInt:self->_voltHighDuration];
  [v3 setObject:v14 forKey:@"volt_high_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v15 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt0Duration];
  [v3 setObject:v15 forKey:@"zsp_clk_opt0_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt1Duration];
  [v3 setObject:v16 forKey:@"zsp_clk_opt1_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt2Duration];
  [v3 setObject:v17 forKey:@"zsp_clk_opt2_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt3Duration];
  [v3 setObject:v18 forKey:@"zsp_clk_opt3_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt4Duration];
  [v3 setObject:v19 forKey:@"zsp_clk_opt4_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = [NSNumber numberWithUnsignedInt:self->_zspClkOpt5Duration];
  [v3 setObject:v20 forKey:@"zsp_clk_opt5_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = [NSNumber numberWithUnsignedInt:self->_thClkOpt0Duration];
  [v3 setObject:v21 forKey:@"th_clk_opt0_duration"];

  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  v22 = [NSNumber numberWithUnsignedInt:self->_thClkOpt1Duration];
  [v3 setObject:v22 forKey:@"th_clk_opt1_duration"];

  if (*(_DWORD *)&self->_has)
  {
LABEL_18:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_startTime];
    [v3 setObject:v5 forKey:@"start_time"];
  }
LABEL_19:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UtraTddStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  if (*(_DWORD *)&self->_has) {
LABEL_18:
  }
    PBDataWriterWriteUint64Field();
LABEL_19:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    v4[7] = self->_duration;
    v4[20] |= 0x10u;
    $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_activeDuration;
  v4[20] |= 2u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[8] = self->_normalSleepDuration;
  v4[20] |= 0x20u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[6] = self->_deepSleepDuration;
  v4[20] |= 8u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[5] = self->_deepSleepCycleCount;
  v4[20] |= 4u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[12] = self->_voltLowDuration;
  v4[20] |= 0x200u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[13] = self->_voltMedDuration;
  v4[20] |= 0x400u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[11] = self->_voltHighDuration;
  v4[20] |= 0x100u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[14] = self->_zspClkOpt0Duration;
  v4[20] |= 0x800u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[15] = self->_zspClkOpt1Duration;
  v4[20] |= 0x1000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[16] = self->_zspClkOpt2Duration;
  v4[20] |= 0x2000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[17] = self->_zspClkOpt3Duration;
  v4[20] |= 0x4000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[18] = self->_zspClkOpt4Duration;
  v4[20] |= 0x8000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[19] = self->_zspClkOpt5Duration;
  v4[20] |= 0x10000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[9] = self->_thClkOpt0Duration;
  v4[20] |= 0x40u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  v4[10] = self->_thClkOpt1Duration;
  v4[20] |= 0x80u;
  if (*(_DWORD *)&self->_has)
  {
LABEL_18:
    *((void *)v4 + 1) = self->_startTime;
    v4[20] |= 1u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *((_DWORD *)result + 7) = self->_duration;
    *((_DWORD *)result + 20) |= 0x10u;
    $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_activeDuration;
  *((_DWORD *)result + 20) |= 2u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 8) = self->_normalSleepDuration;
  *((_DWORD *)result + 20) |= 0x20u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 6) = self->_deepSleepDuration;
  *((_DWORD *)result + 20) |= 8u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 5) = self->_deepSleepCycleCount;
  *((_DWORD *)result + 20) |= 4u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_voltLowDuration;
  *((_DWORD *)result + 20) |= 0x200u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 13) = self->_voltMedDuration;
  *((_DWORD *)result + 20) |= 0x400u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_voltHighDuration;
  *((_DWORD *)result + 20) |= 0x100u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 14) = self->_zspClkOpt0Duration;
  *((_DWORD *)result + 20) |= 0x800u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 15) = self->_zspClkOpt1Duration;
  *((_DWORD *)result + 20) |= 0x1000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 16) = self->_zspClkOpt2Duration;
  *((_DWORD *)result + 20) |= 0x2000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 17) = self->_zspClkOpt3Duration;
  *((_DWORD *)result + 20) |= 0x4000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 18) = self->_zspClkOpt4Duration;
  *((_DWORD *)result + 20) |= 0x8000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 19) = self->_zspClkOpt5Duration;
  *((_DWORD *)result + 20) |= 0x10000u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 9) = self->_thClkOpt0Duration;
  *((_DWORD *)result + 20) |= 0x40u;
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      return result;
    }
    goto LABEL_18;
  }
LABEL_35:
  *((_DWORD *)result + 10) = self->_thClkOpt1Duration;
  *((_DWORD *)result + 20) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_18:
  *((void *)result + 1) = self->_startTime;
  *((_DWORD *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_87;
  }
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  int v6 = *((_DWORD *)v4 + 20);
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_duration != *((_DWORD *)v4 + 7)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
LABEL_87:
    BOOL v7 = 0;
    goto LABEL_88;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDuration != *((_DWORD *)v4 + 4)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_normalSleepDuration != *((_DWORD *)v4 + 8)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_deepSleepDuration != *((_DWORD *)v4 + 6)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_deepSleepCycleCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_voltLowDuration != *((_DWORD *)v4 + 12)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_voltMedDuration != *((_DWORD *)v4 + 13)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_voltHighDuration != *((_DWORD *)v4 + 11)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_zspClkOpt0Duration != *((_DWORD *)v4 + 14)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_zspClkOpt1Duration != *((_DWORD *)v4 + 15)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_zspClkOpt2Duration != *((_DWORD *)v4 + 16)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_zspClkOpt3Duration != *((_DWORD *)v4 + 17)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_zspClkOpt4Duration != *((_DWORD *)v4 + 18)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_zspClkOpt5Duration != *((_DWORD *)v4 + 19)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_thClkOpt0Duration != *((_DWORD *)v4 + 9)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_thClkOpt1Duration != *((_DWORD *)v4 + 10)) {
      goto LABEL_87;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_startTime != *((void *)v4 + 1)) {
      goto LABEL_87;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 20) & 1) == 0;
  }
LABEL_88:

  return v7;
}

- (unint64_t)hash
{
  $47EACDA4C9A419300A4563DF10B362A3 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_duration;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_activeDuration;
      if ((*(unsigned char *)&has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_normalSleepDuration;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_deepSleepDuration;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_deepSleepCycleCount;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_voltLowDuration;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_voltMedDuration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_voltHighDuration;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_zspClkOpt0Duration;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_zspClkOpt1Duration;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_zspClkOpt2Duration;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_zspClkOpt3Duration;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_zspClkOpt4Duration;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_zspClkOpt5Duration;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_thClkOpt0Duration;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v18 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_18;
    }
LABEL_35:
    unint64_t v19 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
LABEL_33:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_thClkOpt1Duration;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  unint64_t v19 = 2654435761u * self->_startTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x10) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x10u;
    int v5 = *((_DWORD *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_activeDuration = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_normalSleepDuration = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_deepSleepDuration = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_deepSleepCycleCount = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_voltLowDuration = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_voltMedDuration = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_voltHighDuration = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_zspClkOpt0Duration = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_zspClkOpt1Duration = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_zspClkOpt2Duration = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_zspClkOpt3Duration = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x8000) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_zspClkOpt4Duration = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_zspClkOpt5Duration = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x40) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_thClkOpt0Duration = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 20);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_thClkOpt1Duration = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  if (*((_DWORD *)v4 + 20))
  {
LABEL_18:
    self->_startTime = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_19:
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)activeDuration
{
  return self->_activeDuration;
}

- (unsigned)normalSleepDuration
{
  return self->_normalSleepDuration;
}

- (unsigned)deepSleepDuration
{
  return self->_deepSleepDuration;
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

- (unsigned)zspClkOpt0Duration
{
  return self->_zspClkOpt0Duration;
}

- (unsigned)zspClkOpt1Duration
{
  return self->_zspClkOpt1Duration;
}

- (unsigned)zspClkOpt2Duration
{
  return self->_zspClkOpt2Duration;
}

- (unsigned)zspClkOpt3Duration
{
  return self->_zspClkOpt3Duration;
}

- (unsigned)zspClkOpt4Duration
{
  return self->_zspClkOpt4Duration;
}

- (unsigned)zspClkOpt5Duration
{
  return self->_zspClkOpt5Duration;
}

- (unsigned)thClkOpt0Duration
{
  return self->_thClkOpt0Duration;
}

- (unsigned)thClkOpt1Duration
{
  return self->_thClkOpt1Duration;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

@end