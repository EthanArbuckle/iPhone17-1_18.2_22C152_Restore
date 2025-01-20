@interface KCellularProtocolStackState
- (BOOL)hasCurrState;
- (BOOL)hasPrevState;
- (BOOL)hasPrevStateDurMs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currStateAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)prevStateAsString:(int)a3;
- (int)StringAsCurrState:(id)a3;
- (int)StringAsPrevState:(id)a3;
- (int)currState;
- (int)prevState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)prevStateDurMs;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrState:(int)a3;
- (void)setHasCurrState:(BOOL)a3;
- (void)setHasPrevState:(BOOL)a3;
- (void)setHasPrevStateDurMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPrevState:(int)a3;
- (void)setPrevStateDurMs:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularProtocolStackState

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

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E692E438[a3];
  }
  return v3;
}

- (int)StringAsPrevState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KPS_STATE_OFF_OR_AIRPLANE_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_IDLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_NETWORK_SCAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_IDLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_ESTABLISHING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_CONNECTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_RELEASING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_TX_RX_SUSPENDED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_SRLTE_NETWORK_SCAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_HYBRID_NETWORK_SCAN"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_SRLTE_IDLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_HYBRID_IDLE"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)currState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_currState;
  }
  else {
    return 0;
  }
}

- (void)setCurrState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_currState = a3;
}

- (void)setHasCurrState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)currStateAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E692E438[a3];
  }
  return v3;
}

- (int)StringAsCurrState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KPS_STATE_OFF_OR_AIRPLANE_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_IDLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_NETWORK_SCAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_IDLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_ESTABLISHING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_CONNECTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_RELEASING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_TX_RX_SUSPENDED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_SRLTE_NETWORK_SCAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_OOS_HYBRID_NETWORK_SCAN"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_SRLTE_IDLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KPS_STATE_HYBRID_IDLE"])
  {
    int v4 = 11;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularProtocolStackState;
  int v4 = [(KCellularProtocolStackState *)&v8 description];
  v5 = [(KCellularProtocolStackState *)self dictionaryRepresentation];
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
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v8 forKey:@"subs_id"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t prevState = self->_prevState;
  if (prevState >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevState);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E692E438[prevState];
  }
  [v3 setObject:v10 forKey:@"prev_state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  uint64_t currState = self->_currState;
  if (currState >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currState);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E692E438[currState];
  }
  [v3 setObject:v12 forKey:@"curr_state"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  v5 = [NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v5 forKey:@"prev_state_dur_ms"];

LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularProtocolStackStateReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_subsId;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 5) = self->_prevState;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 4) = self->_currState;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_subsId;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_prevState;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_currState;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_prevState != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_currState != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

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
      uint64_t v3 = 2654435761 * self->_subsId;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_currState;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_prevStateDurMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_uint64_t prevState = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t currState = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_6:
    self->_prevStateDurMs = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

@end