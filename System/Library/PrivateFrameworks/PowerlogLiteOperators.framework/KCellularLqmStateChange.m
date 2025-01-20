@interface KCellularLqmStateChange
- (BOOL)hasHiPowerEvent;
- (BOOL)hasHiPowerExitReason;
- (BOOL)hasIsScreenOn;
- (BOOL)hasLqmState;
- (BOOL)hasLteRsrp;
- (BOOL)hasLteRsrq;
- (BOOL)hasLteRssi;
- (BOOL)hasLteRssnr;
- (BOOL)hasPrevIsScreenOn;
- (BOOL)hasPrevLqmState;
- (BOOL)hasPrevStateDurationSec;
- (BOOL)hasPrevSysMode;
- (BOOL)hasSysMode;
- (BOOL)hasTimestamp;
- (BOOL)hasWcdmaEcio;
- (BOOL)hasWcdmaRscp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScreenOn;
- (BOOL)prevIsScreenOn;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hiPowerEventAsString:(int)a3;
- (id)hiPowerExitReasonAsString:(int)a3;
- (int)StringAsHiPowerEvent:(id)a3;
- (int)StringAsHiPowerExitReason:(id)a3;
- (int)hiPowerEvent;
- (int)hiPowerExitReason;
- (int)lteRsrp;
- (int)lteRsrq;
- (int)lteRssi;
- (int)lteRssnr;
- (int)sysMode;
- (int)wcdmaEcio;
- (int)wcdmaRscp;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)lqmState;
- (unsigned)prevLqmState;
- (unsigned)prevStateDurationSec;
- (unsigned)prevSysMode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHiPowerEvent:(BOOL)a3;
- (void)setHasHiPowerExitReason:(BOOL)a3;
- (void)setHasIsScreenOn:(BOOL)a3;
- (void)setHasLqmState:(BOOL)a3;
- (void)setHasLteRsrp:(BOOL)a3;
- (void)setHasLteRsrq:(BOOL)a3;
- (void)setHasLteRssi:(BOOL)a3;
- (void)setHasLteRssnr:(BOOL)a3;
- (void)setHasPrevIsScreenOn:(BOOL)a3;
- (void)setHasPrevLqmState:(BOOL)a3;
- (void)setHasPrevStateDurationSec:(BOOL)a3;
- (void)setHasPrevSysMode:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWcdmaEcio:(BOOL)a3;
- (void)setHasWcdmaRscp:(BOOL)a3;
- (void)setHiPowerEvent:(int)a3;
- (void)setHiPowerExitReason:(int)a3;
- (void)setIsScreenOn:(BOOL)a3;
- (void)setLqmState:(unsigned int)a3;
- (void)setLteRsrp:(int)a3;
- (void)setLteRsrq:(int)a3;
- (void)setLteRssi:(int)a3;
- (void)setLteRssnr:(int)a3;
- (void)setPrevIsScreenOn:(BOOL)a3;
- (void)setPrevLqmState:(unsigned int)a3;
- (void)setPrevStateDurationSec:(unsigned int)a3;
- (void)setPrevSysMode:(unsigned int)a3;
- (void)setSysMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWcdmaEcio:(int)a3;
- (void)setWcdmaRscp:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLqmStateChange

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

- (void)setPrevStateDurationSec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prevStateDurationSec = a3;
}

- (void)setHasPrevStateDurationSec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrevStateDurationSec
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_lqmState = a3;
}

- (void)setHasLqmState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLqmState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isScreenOn = a3;
}

- (void)setHasIsScreenOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsScreenOn
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPrevLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prevLqmState = a3;
}

- (void)setHasPrevLqmState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrevLqmState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrevSysMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prevSysMode = a3;
}

- (void)setHasPrevSysMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrevSysMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setPrevIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_prevIsScreenOn = a3;
}

- (void)setHasPrevIsScreenOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasPrevIsScreenOn
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)hiPowerEvent
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_hiPowerEvent;
  }
  else {
    return 0;
  }
}

- (void)setHiPowerEvent:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hiPowerEvent = a3;
}

- (void)setHasHiPowerEvent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHiPowerEvent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)hiPowerEventAsString:(int)a3
{
  if (a3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E210[a3];
  }
  return v3;
}

- (int)StringAsHiPowerEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LQM_EVENT_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_POOR_SIGNAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_LTE_UL_TRICKLING_GRANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_EUTRA_RRC_CONN_FAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_UTRA_RRC_CONN_FAIL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_ERLC_MAX_RETX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_URLC_MAX_RETX"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_HIGH_POW_COST"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_PHY_ABORT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_RF_CONDITION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_GUARD_TIMER_EXPIRY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_RF_SIGNAL_IMPROVEMENT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_MAX"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)hiPowerExitReason
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_hiPowerExitReason;
  }
  else {
    return 0;
  }
}

- (void)setHiPowerExitReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hiPowerExitReason = a3;
}

- (void)setHasHiPowerExitReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHiPowerExitReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)hiPowerExitReasonAsString:(int)a3
{
  if (a3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E210[a3];
  }
  return v3;
}

- (int)StringAsHiPowerExitReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LQM_EVENT_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_POOR_SIGNAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_LTE_UL_TRICKLING_GRANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_EUTRA_RRC_CONN_FAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_UTRA_RRC_CONN_FAIL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_ERLC_MAX_RETX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_URLC_MAX_RETX"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_HIGH_POW_COST"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_PHY_ABORT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_RF_CONDITION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_GUARD_TIMER_EXPIRY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_RF_SIGNAL_IMPROVEMENT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_MAX"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setWcdmaEcio:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_wcdmaEcio = a3;
}

- (void)setHasWcdmaEcio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWcdmaEcio
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWcdmaRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_wcdmaRscp = a3;
}

- (void)setHasWcdmaRscp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWcdmaRscp
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setLteRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lteRssi = a3;
}

- (void)setHasLteRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLteRssi
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLteRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lteRsrp = a3;
}

- (void)setHasLteRsrp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLteRsrp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLteRsrq:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lteRsrq = a3;
}

- (void)setHasLteRsrq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLteRsrq
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLteRssnr:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lteRssnr = a3;
}

- (void)setHasLteRssnr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLteRssnr
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLqmStateChange;
  int v4 = [(KCellularLqmStateChange *)&v8 description];
  v5 = [(KCellularLqmStateChange *)self dictionaryRepresentation];
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
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_prevStateDurationSec];
  [v3 setObject:v8 forKey:@"prev_state_duration_sec"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v9 = [NSNumber numberWithUnsignedInt:self->_lqmState];
  [v3 setObject:v9 forKey:@"lqm_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v10 = [NSNumber numberWithInt:self->_sysMode];
  [v3 setObject:v10 forKey:@"sys_mode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v11 = [NSNumber numberWithBool:self->_isScreenOn];
  [v3 setObject:v11 forKey:@"is_screen_on"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = [NSNumber numberWithUnsignedInt:self->_prevLqmState];
  [v3 setObject:v12 forKey:@"prev_lqm_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = [NSNumber numberWithUnsignedInt:self->_prevSysMode];
  [v3 setObject:v13 forKey:@"prev_sys_mode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = [NSNumber numberWithBool:self->_prevIsScreenOn];
  [v3 setObject:v14 forKey:@"prev_is_screen_on"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_29:
  uint64_t hiPowerEvent = self->_hiPowerEvent;
  if (hiPowerEvent >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_hiPowerEvent);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E692E210[hiPowerEvent];
  }
  [v3 setObject:v16 forKey:@"hi_power_event"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t hiPowerExitReason = self->_hiPowerExitReason;
  if (hiPowerExitReason >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_hiPowerExitReason);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E692E210[hiPowerExitReason];
  }
  [v3 setObject:v18 forKey:@"hi_power_exit_reason"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  v19 = [NSNumber numberWithInt:self->_wcdmaEcio];
  [v3 setObject:v19 forKey:@"wcdma_ecio"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  v20 = [NSNumber numberWithInt:self->_wcdmaRscp];
  [v3 setObject:v20 forKey:@"wcdma_rscp"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  v21 = [NSNumber numberWithInt:self->_lteRssi];
  [v3 setObject:v21 forKey:@"lte_rssi"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  v22 = [NSNumber numberWithInt:self->_lteRsrp];
  [v3 setObject:v22 forKey:@"lte_rsrp"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_41:
  v23 = [NSNumber numberWithInt:self->_lteRsrq];
  [v3 setObject:v23 forKey:@"lte_rsrq"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    v5 = [NSNumber numberWithInt:self->_lteRssnr];
    [v3 setObject:v5 forKey:@"lte_rssnr"];
  }
LABEL_18:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLqmStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_17:
  }
    PBDataWriterWriteSint32Field();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 36) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_prevStateDurationSec;
  *((_WORD *)v4 + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 6) = self->_lqmState;
  *((_WORD *)v4 + 36) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 14) = self->_sysMode;
  *((_WORD *)v4 + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 68) = self->_isScreenOn;
  *((_WORD *)v4 + 36) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 11) = self->_prevLqmState;
  *((_WORD *)v4 + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 13) = self->_prevSysMode;
  *((_WORD *)v4 + 36) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)v4 + 69) = self->_prevIsScreenOn;
  *((_WORD *)v4 + 36) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 4) = self->_hiPowerEvent;
  *((_WORD *)v4 + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 5) = self->_hiPowerExitReason;
  *((_WORD *)v4 + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 15) = self->_wcdmaEcio;
  *((_WORD *)v4 + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 16) = self->_wcdmaRscp;
  *((_WORD *)v4 + 36) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 9) = self->_lteRssi;
  *((_WORD *)v4 + 36) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 7) = self->_lteRsrp;
  *((_WORD *)v4 + 36) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  *((_DWORD *)v4 + 8) = self->_lteRsrq;
  *((_WORD *)v4 + 36) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 10) = self->_lteRssnr;
    *((_WORD *)v4 + 36) |= 0x80u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 36) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_prevStateDurationSec;
  *((_WORD *)result + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_lqmState;
  *((_WORD *)result + 36) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_sysMode;
  *((_WORD *)result + 36) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)result + 68) = self->_isScreenOn;
  *((_WORD *)result + 36) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_prevLqmState;
  *((_WORD *)result + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 13) = self->_prevSysMode;
  *((_WORD *)result + 36) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)result + 69) = self->_prevIsScreenOn;
  *((_WORD *)result + 36) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 4) = self->_hiPowerEvent;
  *((_WORD *)result + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 5) = self->_hiPowerExitReason;
  *((_WORD *)result + 36) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 15) = self->_wcdmaEcio;
  *((_WORD *)result + 36) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 16) = self->_wcdmaRscp;
  *((_WORD *)result + 36) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 9) = self->_lteRssi;
  *((_WORD *)result + 36) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 7) = self->_lteRsrp;
  *((_WORD *)result + 36) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_17;
  }
LABEL_33:
  *((_DWORD *)result + 8) = self->_lteRsrq;
  *((_WORD *)result + 36) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_lteRssnr;
  *((_WORD *)result + 36) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 36);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_88;
    }
  }
  else if (v6)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x200) == 0 || self->_prevStateDurationSec != *((_DWORD *)v4 + 12)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_lqmState != *((_DWORD *)v4 + 6)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x800) == 0 || self->_sysMode != *((_DWORD *)v4 + 14)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x800) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x4000) == 0) {
      goto LABEL_88;
    }
    if (self->_isScreenOn)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x4000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x100) == 0 || self->_prevLqmState != *((_DWORD *)v4 + 11)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x100) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x400) == 0 || self->_prevSysMode != *((_DWORD *)v4 + 13)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x8000) == 0) {
      goto LABEL_42;
    }
LABEL_88:
    BOOL v7 = 0;
    goto LABEL_89;
  }
  if ((*((_WORD *)v4 + 36) & 0x8000) == 0) {
    goto LABEL_88;
  }
  if (self->_prevIsScreenOn)
  {
    if (!*((unsigned char *)v4 + 69)) {
      goto LABEL_88;
    }
  }
  else if (*((unsigned char *)v4 + 69))
  {
    goto LABEL_88;
  }
LABEL_42:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_hiPowerEvent != *((_DWORD *)v4 + 4)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_hiPowerExitReason != *((_DWORD *)v4 + 5)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x1000) == 0 || self->_wcdmaEcio != *((_DWORD *)v4 + 15)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x1000) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 36) & 0x2000) == 0 || self->_wcdmaRscp != *((_DWORD *)v4 + 16)) {
      goto LABEL_88;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x2000) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lteRssi != *((_DWORD *)v4 + 9)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lteRsrp != *((_DWORD *)v4 + 7)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lteRsrq != *((_DWORD *)v4 + 8)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lteRssnr != *((_DWORD *)v4 + 10)) {
      goto LABEL_88;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_89:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_prevStateDurationSec;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_lqmState;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_sysMode;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_isScreenOn;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_prevLqmState;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_prevSysMode;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_prevIsScreenOn;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_hiPowerEvent;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_hiPowerExitReason;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_wcdmaEcio;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_wcdmaRscp;
    if ((has & 0x40) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_lteRssi;
    if ((has & 0x10) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_lteRsrp;
    if ((has & 0x20) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v17 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_33:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  uint64_t v16 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_lteRsrq;
  if ((has & 0x80) == 0) {
    goto LABEL_33;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_lteRssnr;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 36);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)v4 + 36) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_prevStateDurationSec = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_lqmState = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_sysMode = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_isScreenOn = *((unsigned char *)v4 + 68);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_prevLqmState = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_prevSysMode = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_prevIsScreenOn = *((unsigned char *)v4 + 69);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_uint64_t hiPowerEvent = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_uint64_t hiPowerExitReason = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_wcdmaEcio = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_wcdmaRscp = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_lteRssi = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_lteRsrp = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  self->_lteRsrq = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 36) & 0x80) != 0)
  {
LABEL_17:
    self->_lteRssnr = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurationSec
{
  return self->_prevStateDurationSec;
}

- (unsigned)lqmState
{
  return self->_lqmState;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (unsigned)prevLqmState
{
  return self->_prevLqmState;
}

- (unsigned)prevSysMode
{
  return self->_prevSysMode;
}

- (BOOL)prevIsScreenOn
{
  return self->_prevIsScreenOn;
}

- (int)wcdmaEcio
{
  return self->_wcdmaEcio;
}

- (int)wcdmaRscp
{
  return self->_wcdmaRscp;
}

- (int)lteRssi
{
  return self->_lteRssi;
}

- (int)lteRsrp
{
  return self->_lteRsrp;
}

- (int)lteRsrq
{
  return self->_lteRsrq;
}

- (int)lteRssnr
{
  return self->_lteRssnr;
}

@end