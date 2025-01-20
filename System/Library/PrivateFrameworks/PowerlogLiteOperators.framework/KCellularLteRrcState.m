@interface KCellularLteRrcState
- (BOOL)hasCause;
- (BOOL)hasPrevState;
- (BOOL)hasPrevStateDurMs;
- (BOOL)hasState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)causeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)prevStateAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsCause:(id)a3;
- (int)StringAsPrevState:(id)a3;
- (int)StringAsState:(id)a3;
- (int)cause;
- (int)prevState;
- (int)state;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)prevStateDurMs;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCause:(int)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasPrevState:(BOOL)a3;
- (void)setHasPrevStateDurMs:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPrevState:(int)a3;
- (void)setPrevStateDurMs:(unsigned int)a3;
- (void)setState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteRrcState

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

- (int)state
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6932670[a3];
  }
  return v3;
}

- (int)StringAsState:(id)a3
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

- (int)prevState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_prevState;
  }
  else {
    return 0;
  }
}

- (void)setPrevState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_prevState = a3;
}

- (void)setHasPrevState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrevState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)prevStateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6932670[a3];
  }
  return v3;
}

- (int)StringAsPrevState:(id)a3
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

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)cause
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_cause;
  }
  else {
    return 0;
  }
}

- (void)setCause:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCause
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  int v4 = @"KLTE_RRC_CAUSE_EST_EMERGENCY";
  switch(a3)
  {
    case 0:
      goto LABEL_101;
    case 1:
      int v4 = @"KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC";
      break;
    case 2:
      int v4 = @"KLTE_RRC_CAUSE_EST_MT_ACC";
      break;
    case 3:
      int v4 = @"KLTE_RRC_CAUSE_EST_MO_SIGNAL";
      break;
    case 4:
      int v4 = @"KLTE_RRC_CAUSE_EST_MO_DATA";
      break;
    case 5:
      int v4 = @"KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC";
      break;
    case 6:
      int v4 = @"KLTE_RRC_CAUSE_REEST_RECFG_FAIL";
      break;
    case 7:
      int v4 = @"KLTE_RRC_CAUSE_REEST_HO_FAIL";
      break;
    case 8:
      int v4 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL";
      break;
    case 9:
      int v4 = @"KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL";
      break;
    case 10:
      int v4 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL";
      break;
    case 11:
      int v4 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP";
      break;
    case 12:
      int v4 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT";
      break;
    case 13:
      int v4 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ";
      break;
    case 14:
      int v4 = @"KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD";
      break;
    case 15:
      int v4 = @"KLTE_RRC_CAUSE_REL_OTHER";
      break;
    case 16:
      int v4 = @"KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO";
      break;
    case 17:
      int v4 = @"KLTE_RRC_CAUSE_REL_T310_EXP";
      break;
    case 18:
      int v4 = @"KLTE_RRC_CAUSE_REL_RND_ACC";
      break;
    case 19:
      int v4 = @"KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS";
      break;
    case 20:
      int v4 = @"KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN";
      break;
    case 21:
      int v4 = @"KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN";
      break;
    case 22:
      int v4 = @"KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL";
      break;
    case 23:
      int v4 = @"KLTE_RRC_CAUSE_EST_FAIL_REJ";
      break;
    case 24:
      int v4 = @"KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL";
      break;
    case 25:
      int v4 = @"KLTE_RRC_CAUSE_EST_FAIL_ABORTED";
      break;
    case 26:
      int v4 = @"KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED";
      break;
    case 27:
      int v4 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP";
      break;
    case 28:
      int v4 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC";
      break;
    case 29:
      int v4 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX";
      break;
    case 30:
      int v4 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK";
      break;
    default:
      if (a3 == 254)
      {
        int v4 = @"KLTE_RRC_CAUSE_NO_SERVICE";
      }
      else if (a3 == 255)
      {
        int v4 = @"KLTE_RRC_CAUSE_NA";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_101:
      }
      break;
  }
  return v4;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_EMERGENCY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_MT_ACC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_MO_SIGNAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_MO_DATA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_RECFG_FAIL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_HO_FAIL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_OTHER_FAIL"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_OTHER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_T310_EXP"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_RND_ACC"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_FAIL_REJ"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_FAIL_ABORTED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_NO_SERVICE"])
  {
    int v4 = 254;
  }
  else if ([v3 isEqualToString:@"KLTE_RRC_CAUSE_NA"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteRrcState;
  int v4 = [(KCellularLteRrcState *)&v8 description];
  v5 = [(KCellularLteRrcState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  uint64_t state = self->_state;
  if (state >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6932670[state];
  }
  [v3 setObject:v9 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_16:
  uint64_t prevState = self->_prevState;
  if (prevState >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E6932670[prevState];
  }
  [v3 setObject:v11 forKey:@"prev_state"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = [NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v12 forKey:@"prev_state_dur_ms"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  int cause = self->_cause;
  v14 = @"KLTE_RRC_CAUSE_EST_EMERGENCY";
  switch(cause)
  {
    case 0:
      break;
    case 1:
      v14 = @"KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC";
      break;
    case 2:
      v14 = @"KLTE_RRC_CAUSE_EST_MT_ACC";
      break;
    case 3:
      v14 = @"KLTE_RRC_CAUSE_EST_MO_SIGNAL";
      break;
    case 4:
      v14 = @"KLTE_RRC_CAUSE_EST_MO_DATA";
      break;
    case 5:
      v14 = @"KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC";
      break;
    case 6:
      v14 = @"KLTE_RRC_CAUSE_REEST_RECFG_FAIL";
      break;
    case 7:
      v14 = @"KLTE_RRC_CAUSE_REEST_HO_FAIL";
      break;
    case 8:
      v14 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL";
      break;
    case 9:
      v14 = @"KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL";
      break;
    case 10:
      v14 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL";
      break;
    case 11:
      v14 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP";
      break;
    case 12:
      v14 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT";
      break;
    case 13:
      v14 = @"KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ";
      break;
    case 14:
      v14 = @"KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD";
      break;
    case 15:
      v14 = @"KLTE_RRC_CAUSE_REL_OTHER";
      break;
    case 16:
      v14 = @"KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO";
      break;
    case 17:
      v14 = @"KLTE_RRC_CAUSE_REL_T310_EXP";
      break;
    case 18:
      v14 = @"KLTE_RRC_CAUSE_REL_RND_ACC";
      break;
    case 19:
      v14 = @"KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS";
      break;
    case 20:
      v14 = @"KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN";
      break;
    case 21:
      v14 = @"KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN";
      break;
    case 22:
      v14 = @"KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL";
      break;
    case 23:
      v14 = @"KLTE_RRC_CAUSE_EST_FAIL_REJ";
      break;
    case 24:
      v14 = @"KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL";
      break;
    case 25:
      v14 = @"KLTE_RRC_CAUSE_EST_FAIL_ABORTED";
      break;
    case 26:
      v14 = @"KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED";
      break;
    case 27:
      v14 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP";
      break;
    case 28:
      v14 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC";
      break;
    case 29:
      v14 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX";
      break;
    case 30:
      v14 = @"KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK";
      break;
    default:
      if (cause == 254)
      {
        v14 = @"KLTE_RRC_CAUSE_NO_SERVICE";
      }
      else if (cause == 255)
      {
        v14 = @"KLTE_RRC_CAUSE_NA";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cause);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v3 setObject:v14 forKey:@"cause"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_8:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteRrcStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_state;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_prevState;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_cause;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((unsigned char *)v4 + 36) |= 0x20u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_state;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_prevState;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_cause;
  *((unsigned char *)result + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 8) = self->_subsId;
  *((unsigned char *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_state != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_prevState != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_state;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_prevState;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_prevStateDurMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_cause;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t state = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_uint64_t prevState = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_prevStateDurMs = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_int cause = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
LABEL_7:
    self->_subsId = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_8:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end