@interface KCellularLteRadioLinkFailure
- (BOOL)hasBand;
- (BOOL)hasCoexPolicy;
- (BOOL)hasFailCause;
- (BOOL)hasHstState;
- (BOOL)hasRrcState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)failCauseAsString:(int)a3;
- (id)rrcStateAsString:(int)a3;
- (int)StringAsFailCause:(id)a3;
- (int)StringAsRrcState:(id)a3;
- (int)failCause;
- (int)rrcState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)band;
- (unsigned)coexPolicy;
- (unsigned)hstState;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBand:(unsigned int)a3;
- (void)setCoexPolicy:(unsigned int)a3;
- (void)setFailCause:(int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasCoexPolicy:(BOOL)a3;
- (void)setHasFailCause:(BOOL)a3;
- (void)setHasHstState:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHstState:(unsigned int)a3;
- (void)setRrcState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteRadioLinkFailure

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

- (int)failCause
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_failCause;
  }
  else {
    return 0;
  }
}

- (void)setFailCause:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_failCause = a3;
}

- (void)setHasFailCause:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFailCause
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)failCauseAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6932518[a3];
  }
  return v3;
}

- (int)StringAsFailCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_T310_EXP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_RND_ACC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_MAX_RLC_RETX"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_REEST_T310_EXP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_REEST_RND_ACC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_RLF_CAUSE_REEST_MAX_RLC_RETX"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCoexPolicy:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_coexPolicy = a3;
}

- (void)setHasCoexPolicy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCoexPolicy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)rrcState
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_rrcState;
  }
  else {
    return 0;
  }
}

- (void)setRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRrcState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6932548[a3];
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

- (void)setHstState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hstState = a3;
}

- (void)setHasHstState:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHstState
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteRadioLinkFailure;
  int v4 = [(KCellularLteRadioLinkFailure *)&v8 description];
  v5 = [(KCellularLteRadioLinkFailure *)self dictionaryRepresentation];
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t failCause = self->_failCause;
  if (failCause >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_failCause);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6932518[failCause];
  }
  [v3 setObject:v9 forKey:@"fail_cause"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithUnsignedInt:self->_band];
  [v3 setObject:v10 forKey:@"band"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedInt:self->_coexPolicy];
  [v3 setObject:v11 forKey:@"coex_policy"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_19:
  uint64_t rrcState = self->_rrcState;
  if (rrcState >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rrcState);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E6932548[rrcState];
  }
  [v3 setObject:v13 forKey:@"rrc_state"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  v14 = [NSNumber numberWithUnsignedInt:self->_hstState];
  [v3 setObject:v14 forKey:@"hst_state"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_9:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteRadioLinkFailureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_failCause;
  *((unsigned char *)v4 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 4) = self->_band;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 5) = self->_coexPolicy;
  *((unsigned char *)v4 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_rrcState;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *((_DWORD *)v4 + 7) = self->_hstState;
  *((unsigned char *)v4 + 40) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 9) = self->_subsId;
    *((unsigned char *)v4 + 40) |= 0x40u;
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_failCause;
  *((unsigned char *)result + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_band;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_coexPolicy;
  *((unsigned char *)result + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_rrcState;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_hstState;
  *((unsigned char *)result + 40) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 9) = self->_subsId;
  *((unsigned char *)result + 40) |= 0x40u;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_failCause != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_band != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_coexPolicy != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0 || self->_rrcState != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_hstState != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 9)) {
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
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_failCause;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_band;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_coexPolicy;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_rrcState;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_hstState;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_subsId;
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
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t failCause = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_band = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_coexPolicy = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_uint64_t rrcState = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_hstState = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 40) & 0x40) != 0)
  {
LABEL_8:
    self->_subsId = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_9:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)coexPolicy
{
  return self->_coexPolicy;
}

- (unsigned)hstState
{
  return self->_hstState;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end