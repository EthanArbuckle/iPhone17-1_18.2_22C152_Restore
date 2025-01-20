@interface AWDMETRICSCellularPowerLogGSMRRCStateChange
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

@implementation AWDMETRICSCellularPowerLogGSMRRCStateChange

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
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E692F4F0[a3];
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INACTIVE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUSPENDED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IDLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONNECTING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FACH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DCH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CONNECTED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLOSING"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PWR_SAVE_STATE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CELL_SEL_RESEL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"IRAT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BCH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PCH_BPLMN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CS_CONNECTED"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PS_CONNECTED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ENDC_ON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ENDC_OFF"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CS_END"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PS_END"])
  {
    int v4 = 20;
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
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E692F4F0[a3];
  }
  return v3;
}

- (int)StringAsPrevState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INACTIVE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUSPENDED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IDLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONNECTING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FACH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DCH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CONNECTED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLOSING"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PWR_SAVE_STATE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CELL_SEL_RESEL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"IRAT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BCH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PCH_BPLMN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CS_CONNECTED"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PS_CONNECTED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ENDC_ON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ENDC_OFF"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CS_END"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PS_END"])
  {
    int v4 = 20;
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
  int v4 = @"MO_FULL_SPEECH";
  switch(a3)
  {
    case 0:
      goto LABEL_44;
    case 1:
      int v4 = @"MO_HALF_SPEECH";
      break;
    case 2:
      int v4 = @"MO_DATA_9600";
      break;
    case 3:
      int v4 = @"MO_DATA_4800";
      break;
    case 4:
      int v4 = @"MO_DATA_2400";
      break;
    case 5:
      int v4 = @"SHORT_MESSAGE";
      break;
    case 6:
      int v4 = @"SUPPLEMENTARY_SERVICE";
      break;
    case 7:
      int v4 = @"LOCATION_UPDATE";
      break;
    case 8:
      int v4 = @"IMSI_DETACH";
      break;
    case 9:
      int v4 = @"CALL_REEST";
      break;
    case 10:
      int v4 = @"EMERGENCY_CALL";
      break;
    case 11:
      int v4 = @"ANSWER_TO_PAGING";
      break;
    default:
      if (a3 == 254)
      {
        int v4 = @"NONE";
      }
      else if (a3 == 255)
      {
        int v4 = @"NO_CNM_SERVICE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_44:
      }
      break;
  }
  return v4;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MO_FULL_SPEECH"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MO_HALF_SPEECH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MO_DATA_9600"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MO_DATA_4800"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MO_DATA_2400"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SHORT_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SUPPLEMENTARY_SERVICE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCATION_UPDATE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"IMSI_DETACH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CALL_REEST"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_CALL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ANSWER_TO_PAGING"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 254;
  }
  else if ([v3 isEqualToString:@"NO_CNM_SERVICE"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLogGSMRRCStateChange;
  int v4 = [(AWDMETRICSCellularPowerLogGSMRRCStateChange *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogGSMRRCStateChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

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
  uint64_t state = self->_state;
  if (state >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E692F4F0[state];
  }
  [v3 setObject:v7 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t prevState = self->_prevState;
  if (prevState >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevState);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E692F4F0[prevState];
  }
  [v3 setObject:v9 forKey:@"prev_state"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v10 forKey:@"prev_state_dur_ms"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v11 forKey:@"subs_id"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_37;
  }
LABEL_19:
  uint64_t cause = self->_cause;
  v13 = @"MO_FULL_SPEECH";
  switch((int)cause)
  {
    case 0:
      break;
    case 1:
      v13 = @"MO_HALF_SPEECH";
      break;
    case 2:
      v13 = @"MO_DATA_9600";
      break;
    case 3:
      v13 = @"MO_DATA_4800";
      break;
    case 4:
      v13 = @"MO_DATA_2400";
      break;
    case 5:
      v13 = @"SHORT_MESSAGE";
      break;
    case 6:
      v13 = @"SUPPLEMENTARY_SERVICE";
      break;
    case 7:
      v13 = @"LOCATION_UPDATE";
      break;
    case 8:
      v13 = @"IMSI_DETACH";
      break;
    case 9:
      v13 = @"CALL_REEST";
      break;
    case 10:
      v13 = @"EMERGENCY_CALL";
      break;
    case 11:
      v13 = @"ANSWER_TO_PAGING";
      break;
    default:
      if (cause == 254)
      {
        v13 = @"NONE";
      }
      else if (cause == 255)
      {
        v13 = @"NO_CNM_SERVICE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", cause);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v3 setObject:v13 forKey:@"cause"];

LABEL_37:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogGSMRRCStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
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
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 8) = self->_subsId;
  *((unsigned char *)v4 + 36) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = self->_cause;
    *((unsigned char *)v4 + 36) |= 2u;
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
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_subsId;
  *((unsigned char *)result + 36) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 4) = self->_cause;
  *((unsigned char *)result + 36) |= 2u;
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4)) {
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
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_cause;
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
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_prevStateDurMs = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_subsId = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_7:
    self->_uint64_t cause = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
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