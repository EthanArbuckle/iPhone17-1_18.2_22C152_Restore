@interface AWDMETRICSCellularPowerLogLTECDRXConfig
- (BOOL)cdrxEnable;
- (BOOL)hasCdrxEnable;
- (BOOL)hasCycleStartOffset;
- (BOOL)hasDrxInactivity;
- (BOOL)hasDrxRetxTimer;
- (BOOL)hasDrxShortCycleNum;
- (BOOL)hasLongDrxCycle;
- (BOOL)hasOnDuration;
- (BOOL)hasShortDrxCycle;
- (BOOL)hasShortDrxCycleEnable;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shortDrxCycleEnable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cycleStartOffset;
- (unsigned)drxInactivity;
- (unsigned)drxRetxTimer;
- (unsigned)drxShortCycleNum;
- (unsigned)longDrxCycle;
- (unsigned)onDuration;
- (unsigned)shortDrxCycle;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdrxEnable:(BOOL)a3;
- (void)setCycleStartOffset:(unsigned int)a3;
- (void)setDrxInactivity:(unsigned int)a3;
- (void)setDrxRetxTimer:(unsigned int)a3;
- (void)setDrxShortCycleNum:(unsigned int)a3;
- (void)setHasCdrxEnable:(BOOL)a3;
- (void)setHasCycleStartOffset:(BOOL)a3;
- (void)setHasDrxInactivity:(BOOL)a3;
- (void)setHasDrxRetxTimer:(BOOL)a3;
- (void)setHasDrxShortCycleNum:(BOOL)a3;
- (void)setHasLongDrxCycle:(BOOL)a3;
- (void)setHasOnDuration:(BOOL)a3;
- (void)setHasShortDrxCycle:(BOOL)a3;
- (void)setHasShortDrxCycleEnable:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLongDrxCycle:(unsigned int)a3;
- (void)setOnDuration:(unsigned int)a3;
- (void)setShortDrxCycle:(unsigned int)a3;
- (void)setShortDrxCycleEnable:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularPowerLogLTECDRXConfig

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

- (void)setOnDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_onDuration = a3;
}

- (void)setHasOnDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOnDuration
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDrxInactivity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_drxInactivity = a3;
}

- (void)setHasDrxInactivity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDrxInactivity
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDrxRetxTimer:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_drxRetxTimer = a3;
}

- (void)setHasDrxRetxTimer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDrxRetxTimer
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLongDrxCycle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_longDrxCycle = a3;
}

- (void)setHasLongDrxCycle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLongDrxCycle
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCycleStartOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cycleStartOffset = a3;
}

- (void)setHasCycleStartOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCycleStartOffset
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setShortDrxCycleEnable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_shortDrxCycleEnable = a3;
}

- (void)setHasShortDrxCycleEnable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasShortDrxCycleEnable
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setShortDrxCycle:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_shortDrxCycle = a3;
}

- (void)setHasShortDrxCycle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasShortDrxCycle
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCdrxEnable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_cdrxEnable = a3;
}

- (void)setHasCdrxEnable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCdrxEnable
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogLTECDRXConfig;
  v4 = [(AWDMETRICSCellularPowerLogLTECDRXConfig *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogLTECDRXConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_onDuration];
  [v3 setObject:v8 forKey:@"on_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = [NSNumber numberWithUnsignedInt:self->_drxInactivity];
  [v3 setObject:v9 forKey:@"drx_inactivity"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = [NSNumber numberWithUnsignedInt:self->_drxRetxTimer];
  [v3 setObject:v10 forKey:@"drx_retx_timer"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = [NSNumber numberWithUnsignedInt:self->_longDrxCycle];
  [v3 setObject:v11 forKey:@"long_drx_cycle"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = [NSNumber numberWithUnsignedInt:self->_cycleStartOffset];
  [v3 setObject:v12 forKey:@"cycle_start_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = [NSNumber numberWithBool:self->_shortDrxCycleEnable];
  [v3 setObject:v13 forKey:@"short_drx_cycle_enable"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = [NSNumber numberWithUnsignedInt:self->_shortDrxCycle];
  [v3 setObject:v14 forKey:@"short_drx_cycle"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = [NSNumber numberWithUnsignedInt:self->_drxShortCycleNum];
  [v3 setObject:v15 forKey:@"drx_short_cycle_num"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v16 = [NSNumber numberWithBool:self->_cdrxEnable];
  [v3 setObject:v16 forKey:@"cdrx_enable"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_13:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogLTECDRXConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_onDuration;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 5) = self->_drxInactivity;
  *((_WORD *)v4 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 6) = self->_drxRetxTimer;
  *((_WORD *)v4 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 8) = self->_longDrxCycle;
  *((_WORD *)v4 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_cycleStartOffset;
  *((_WORD *)v4 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 49) = self->_shortDrxCycleEnable;
  *((_WORD *)v4 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 10) = self->_shortDrxCycle;
  *((_WORD *)v4 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 7) = self->_drxShortCycleNum;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  *((unsigned char *)v4 + 48) = self->_cdrxEnable;
  *((_WORD *)v4 + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 26) |= 0x100u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_onDuration;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 5) = self->_drxInactivity;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 6) = self->_drxRetxTimer;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_longDrxCycle;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 4) = self->_cycleStartOffset;
  *((_WORD *)result + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 49) = self->_shortDrxCycleEnable;
  *((_WORD *)result + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 10) = self->_shortDrxCycle;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_drxShortCycleNum;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((unsigned char *)result + 48) = self->_cdrxEnable;
  *((_WORD *)result + 26) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 11) = self->_subsId;
  *((_WORD *)result + 26) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_63;
    }
  }
  else if (v6)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_onDuration != *((_DWORD *)v4 + 9)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_drxInactivity != *((_DWORD *)v4 + 5)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_drxRetxTimer != *((_DWORD *)v4 + 6)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_longDrxCycle != *((_DWORD *)v4 + 8)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cycleStartOffset != *((_DWORD *)v4 + 4)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0) {
      goto LABEL_63;
    }
    if (self->_shortDrxCycleEnable)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_shortDrxCycle != *((_DWORD *)v4 + 10)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 7)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_cdrxEnable)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_63;
        }
        goto LABEL_58;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_58;
      }
    }
LABEL_63:
    BOOL v7 = 0;
    goto LABEL_64;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0) {
    goto LABEL_63;
  }
LABEL_58:
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 11)) {
      goto LABEL_63;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_64:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_onDuration;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_drxInactivity;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_drxRetxTimer;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_longDrxCycle;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_cycleStartOffset;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_shortDrxCycleEnable;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_shortDrxCycle;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_drxShortCycleNum;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_cdrxEnable;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_onDuration = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_drxInactivity = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_drxRetxTimer = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_longDrxCycle = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_cycleStartOffset = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_shortDrxCycleEnable = *((unsigned char *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_shortDrxCycle = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_drxShortCycleNum = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_cdrxEnable = *((unsigned char *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_13:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)onDuration
{
  return self->_onDuration;
}

- (unsigned)drxInactivity
{
  return self->_drxInactivity;
}

- (unsigned)drxRetxTimer
{
  return self->_drxRetxTimer;
}

- (unsigned)longDrxCycle
{
  return self->_longDrxCycle;
}

- (unsigned)cycleStartOffset
{
  return self->_cycleStartOffset;
}

- (BOOL)shortDrxCycleEnable
{
  return self->_shortDrxCycleEnable;
}

- (unsigned)shortDrxCycle
{
  return self->_shortDrxCycle;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

- (BOOL)cdrxEnable
{
  return self->_cdrxEnable;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end