@interface AWDMETRICSCellularPowerLogNRSARRCStateChange
- (BOOL)hasCause;
- (BOOL)hasFr;
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
- (id)frAsString:(int)a3;
- (id)prevStateAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsCause:(id)a3;
- (int)StringAsFr:(id)a3;
- (int)StringAsPrevState:(id)a3;
- (int)StringAsState:(id)a3;
- (int)cause;
- (int)fr;
- (int)prevState;
- (int)state;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)prevStateDurMs;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCause:(int)a3;
- (void)setFr:(int)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasFr:(BOOL)a3;
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

@implementation AWDMETRICSCellularPowerLogNRSARRCStateChange

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
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265442DD8[a3];
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IDLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IDLE_NOT_CAMPED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONNECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INACTIVE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)prevState
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_prevState;
  }
  else {
    return 0;
  }
}

- (void)setPrevState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_prevState = a3;
}

- (void)setHasPrevState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)prevStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265442DD8[a3];
  }
  return v3;
}

- (int)StringAsPrevState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IDLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IDLE_NOT_CAMPED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONNECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INACTIVE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
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
  int v4 = @"EMERGENCY";
  switch(a3)
  {
    case 0:
      goto LABEL_34;
    case 1:
      int v4 = @"HIGH_PRIORITY_ACCESS";
      break;
    case 2:
      int v4 = @"MT_ACCESS";
      break;
    case 3:
      int v4 = @"MO_SIGNALLING";
      break;
    case 4:
      int v4 = @"MO_DATA";
      break;
    case 5:
      int v4 = @"MO_VOICE_CALL";
      break;
    case 6:
      int v4 = @"MO_VIDEO_CALL";
      break;
    case 7:
      int v4 = @"MO_SMS";
      break;
    case 8:
      int v4 = @"MPA_PRIORITY_ACCESS";
      break;
    case 9:
      int v4 = @"MCS_PRIORITY_ACCESS";
      break;
    default:
      if (a3 == 254)
      {
        int v4 = @"NONE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      }
      break;
  }
  return v4;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EMERGENCY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HIGH_PRIORITY_ACCESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MT_ACCESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MO_SIGNALLING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MO_DATA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MO_VOICE_CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MO_VIDEO_CALL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MO_SMS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MPA_PRIORITY_ACCESS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MCS_PRIORITY_ACCESS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 254;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)fr
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_fr;
  }
  else {
    return 0;
  }
}

- (void)setFr:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFr
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265442DF8[a3];
  }
  return v3;
}

- (int)StringAsFr:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUB6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MMWAVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)AWDMETRICSCellularPowerLogNRSARRCStateChange;
  int v4 = [(AWDMETRICSCellularPowerLogNRSARRCStateChange *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLogNRSARRCStateChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  uint64_t state = self->_state;
  if (state >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_265442DD8[state];
  }
  [v3 setObject:v7 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_14:
  uint64_t prevState = self->_prevState;
  if (prevState >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevState);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_265442DD8[prevState];
  }
  [v3 setObject:v9 forKey:@"prev_state"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = [NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v10 forKey:@"prev_state_dur_ms"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = [NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v11 forKey:@"subs_id"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_38;
    }
LABEL_34:
    uint64_t fr = self->_fr;
    if (fr >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fr);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_265442DF8[fr];
    }
    [v3 setObject:v15 forKey:@"fr"];

    goto LABEL_38;
  }
LABEL_20:
  int cause = self->_cause;
  v13 = @"EMERGENCY";
  switch(cause)
  {
    case 0:
      break;
    case 1:
      v13 = @"HIGH_PRIORITY_ACCESS";
      break;
    case 2:
      v13 = @"MT_ACCESS";
      break;
    case 3:
      v13 = @"MO_SIGNALLING";
      break;
    case 4:
      v13 = @"MO_DATA";
      break;
    case 5:
      v13 = @"MO_VOICE_CALL";
      break;
    case 6:
      v13 = @"MO_VIDEO_CALL";
      break;
    case 7:
      v13 = @"MO_SMS";
      break;
    case 8:
      v13 = @"MPA_PRIORITY_ACCESS";
      break;
    case 9:
      v13 = @"MCS_PRIORITY_ACCESS";
      break;
    default:
      if (cause == 254)
      {
        v13 = @"NONE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cause);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v3 setObject:v13 forKey:@"cause"];

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_34;
  }
LABEL_38:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogNRSARRCStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_state;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 6) = self->_prevState;
  *((unsigned char *)v4 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 7) = self->_prevStateDurMs;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 9) = self->_subsId;
  *((unsigned char *)v4 + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *((_DWORD *)v4 + 4) = self->_cause;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 5) = self->_fr;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_state;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_prevState;
  *((unsigned char *)result + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_prevStateDurMs;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 9) = self->_subsId;
  *((unsigned char *)result + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_cause;
  *((unsigned char *)result + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 5) = self->_fr;
  *((unsigned char *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0 || self->_state != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_prevState != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 9)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_fr != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_state;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_prevState;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_prevStateDurMs;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_subsId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_cause;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_fr;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t state = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t prevState = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_prevStateDurMs = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_subsId = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_int cause = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_8:
    self->_uint64_t fr = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_9:
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