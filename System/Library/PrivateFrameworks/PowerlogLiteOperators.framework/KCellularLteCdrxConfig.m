@interface KCellularLteCdrxConfig
- (BOOL)hasCdrxConfigStatus;
- (BOOL)hasCellStatus;
- (BOOL)hasDrxInactivityMs;
- (BOOL)hasDrxRetxTimerMs;
- (BOOL)hasDrxShortCycleNum;
- (BOOL)hasLongDrxCycleMs;
- (BOOL)hasOnDurationMs;
- (BOOL)hasRrcState;
- (BOOL)hasShortDrxCycleMs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTransmissionMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rrcStateAsString:(int)a3;
- (int)StringAsRrcState:(id)a3;
- (int)rrcState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cdrxConfigStatus;
- (unsigned)cellStatus;
- (unsigned)drxInactivityMs;
- (unsigned)drxRetxTimerMs;
- (unsigned)drxShortCycleNum;
- (unsigned)longDrxCycleMs;
- (unsigned)onDurationMs;
- (unsigned)shortDrxCycleMs;
- (unsigned)subsId;
- (unsigned)transmissionMode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdrxConfigStatus:(unsigned int)a3;
- (void)setCellStatus:(unsigned int)a3;
- (void)setDrxInactivityMs:(unsigned int)a3;
- (void)setDrxRetxTimerMs:(unsigned int)a3;
- (void)setDrxShortCycleNum:(unsigned int)a3;
- (void)setHasCdrxConfigStatus:(BOOL)a3;
- (void)setHasCellStatus:(BOOL)a3;
- (void)setHasDrxInactivityMs:(BOOL)a3;
- (void)setHasDrxRetxTimerMs:(BOOL)a3;
- (void)setHasDrxShortCycleNum:(BOOL)a3;
- (void)setHasLongDrxCycleMs:(BOOL)a3;
- (void)setHasOnDurationMs:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasShortDrxCycleMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTransmissionMode:(BOOL)a3;
- (void)setLongDrxCycleMs:(unsigned int)a3;
- (void)setOnDurationMs:(unsigned int)a3;
- (void)setRrcState:(int)a3;
- (void)setShortDrxCycleMs:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransmissionMode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteCdrxConfig

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

- (void)setCellStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellStatus = a3;
}

- (void)setHasCellStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOnDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_onDurationMs = a3;
}

- (void)setHasOnDurationMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOnDurationMs
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDrxInactivityMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_drxInactivityMs = a3;
}

- (void)setHasDrxInactivityMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDrxInactivityMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDrxRetxTimerMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_drxRetxTimerMs = a3;
}

- (void)setHasDrxRetxTimerMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDrxRetxTimerMs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLongDrxCycleMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_longDrxCycleMs = a3;
}

- (void)setHasLongDrxCycleMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLongDrxCycleMs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setShortDrxCycleMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_shortDrxCycleMs = a3;
}

- (void)setHasShortDrxCycleMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasShortDrxCycleMs
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)rrcState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_rrcState;
  }
  else {
    return 0;
  }
}

- (void)setRrcState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRrcState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E670[a3];
  }
  return v3;
}

- (int)StringAsRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_RRC_STATE_NULL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_IDLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_ATMPT_CONNECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_CONNECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_ENDING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_ATMPT_OUTBND_MOBILITY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_STATE_ATMPT_INBND_MOBILITY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCdrxConfigStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cdrxConfigStatus = a3;
}

- (void)setHasCdrxConfigStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCdrxConfigStatus
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTransmissionMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_transmissionMode = a3;
}

- (void)setHasTransmissionMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTransmissionMode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteCdrxConfig;
  int v4 = [(KCellularLteCdrxConfig *)&v8 description];
  v5 = [(KCellularLteCdrxConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_cellStatus];
  [v3 setObject:v8 forKey:@"cell_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = [NSNumber numberWithUnsignedInt:self->_onDurationMs];
  [v3 setObject:v9 forKey:@"on_duration_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = [NSNumber numberWithUnsignedInt:self->_drxInactivityMs];
  [v3 setObject:v10 forKey:@"drx_inactivity_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = [NSNumber numberWithUnsignedInt:self->_drxRetxTimerMs];
  [v3 setObject:v11 forKey:@"drx_retx_timer_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithUnsignedInt:self->_longDrxCycleMs];
  [v3 setObject:v12 forKey:@"long_drx_cycle_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithUnsignedInt:self->_shortDrxCycleMs];
  [v3 setObject:v13 forKey:@"short_drx_cycle_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = [NSNumber numberWithUnsignedInt:self->_drxShortCycleNum];
  [v3 setObject:v14 forKey:@"drx_short_cycle_num"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t rrcState = self->_rrcState;
  if (rrcState >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rrcState);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E692E670[rrcState];
  }
  [v3 setObject:v16 forKey:@"rrc_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = [NSNumber numberWithUnsignedInt:self->_cdrxConfigStatus];
  [v3 setObject:v17 forKey:@"cdrx_config_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_30:
  v18 = [NSNumber numberWithUnsignedInt:self->_transmissionMode];
  [v3 setObject:v18 forKey:@"transmission_mode"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_14:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteCdrxConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_19;
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
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_cellStatus;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 10) = self->_onDurationMs;
  *((_WORD *)v4 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_drxInactivityMs;
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_drxRetxTimerMs;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 9) = self->_longDrxCycleMs;
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 12) = self->_shortDrxCycleMs;
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 8) = self->_drxShortCycleNum;
  *((_WORD *)v4 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 11) = self->_rrcState;
  *((_WORD *)v4 + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 4) = self->_cdrxConfigStatus;
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((_DWORD *)v4 + 14) = self->_transmissionMode;
  *((_WORD *)v4 + 30) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 30) |= 0x400u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_cellStatus;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_onDurationMs;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 6) = self->_drxInactivityMs;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_drxRetxTimerMs;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 9) = self->_longDrxCycleMs;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 12) = self->_shortDrxCycleMs;
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 8) = self->_drxShortCycleNum;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 11) = self->_rrcState;
  *((_WORD *)result + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_cdrxConfigStatus;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_transmissionMode;
  *((_WORD *)result + 30) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 30) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
LABEL_62:
    BOOL v7 = 0;
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cellStatus != *((_DWORD *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_onDurationMs != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_drxInactivityMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_drxRetxTimerMs != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_longDrxCycleMs != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_shortDrxCycleMs != *((_DWORD *)v4 + 12)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_rrcState != *((_DWORD *)v4 + 11)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cdrxConfigStatus != *((_DWORD *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_transmissionMode != *((_DWORD *)v4 + 14)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13)) {
      goto LABEL_62;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x400) == 0;
  }
LABEL_63:

  return v7;
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
      uint64_t v4 = 2654435761 * self->_cellStatus;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
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
    uint64_t v5 = 2654435761 * self->_onDurationMs;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_drxInactivityMs;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_drxRetxTimerMs;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_longDrxCycleMs;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_shortDrxCycleMs;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_drxShortCycleNum;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_rrcState;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_cdrxConfigStatus;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_transmissionMode;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_cellStatus = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_onDurationMs = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_drxInactivityMs = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_drxRetxTimerMs = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_longDrxCycleMs = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_shortDrxCycleMs = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_drxShortCycleNum = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_uint64_t rrcState = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_cdrxConfigStatus = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_transmissionMode = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
LABEL_13:
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_14:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellStatus
{
  return self->_cellStatus;
}

- (unsigned)onDurationMs
{
  return self->_onDurationMs;
}

- (unsigned)drxInactivityMs
{
  return self->_drxInactivityMs;
}

- (unsigned)drxRetxTimerMs
{
  return self->_drxRetxTimerMs;
}

- (unsigned)longDrxCycleMs
{
  return self->_longDrxCycleMs;
}

- (unsigned)shortDrxCycleMs
{
  return self->_shortDrxCycleMs;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

- (unsigned)cdrxConfigStatus
{
  return self->_cdrxConfigStatus;
}

- (unsigned)transmissionMode
{
  return self->_transmissionMode;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end