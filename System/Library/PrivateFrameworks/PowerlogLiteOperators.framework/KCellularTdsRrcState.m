@interface KCellularTdsRrcState
- (BOOL)hasNewRrcState;
- (BOOL)hasPrevStateDurMs;
- (BOOL)hasRrcState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newRrcStateAsString:(int)a3;
- (id)rrcStateAsString:(int)a3;
- (int)StringAsNewRrcState:(id)a3;
- (int)StringAsRrcState:(id)a3;
- (int)newRrcState;
- (int)rrcState;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)prevStateDurMs;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNewRrcState:(BOOL)a3;
- (void)setHasPrevStateDurMs:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNewRrcState:(int)a3;
- (void)setPrevStateDurMs:(unsigned int)a3;
- (void)setRrcState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularTdsRrcState

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

- (int)rrcState
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_rrcState;
  }
  else {
    return 0;
  }
}

- (void)setRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRrcState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  v4 = @"KTDS_RRC_STATE_CELL_DCH";
  switch(a3)
  {
    case 0:
      goto LABEL_28;
    case 1:
      v4 = @"KTDS_RRC_STATE_CELL_FACH";
      break;
    case 2:
      v4 = @"KTDS_RRC_STATE_CELL_PCH";
      break;
    case 3:
      v4 = @"KTDS_RRC_STATE_URA_PCH";
      break;
    case 4:
      v4 = @"KTDS_RRC_STATE_IDLE";
      break;
    case 5:
      v4 = @"KTDS_RRC_STATE_WAIT";
      break;
    case 6:
      v4 = @"KTDS_RRC_STATE_CELL_BARRED";
      break;
    case 7:
      v4 = @"KTDS_RRC_STATE_NULL";
      break;
    default:
      if (a3 == 255)
      {
        v4 = @"KTDS_RRC_STATE_INACTIVE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:
      }
      break;
  }
  return v4;
}

- (int)StringAsRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_DCH"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_FACH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_PCH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_URA_PCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_IDLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_WAIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_BARRED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_NULL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_INACTIVE"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)newRrcState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_newRrcState;
  }
  else {
    return 0;
  }
}

- (void)setNewRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_newRrcState = a3;
}

- (void)setHasNewRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewRrcState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)newRrcStateAsString:(int)a3
{
  id result = @"KTDS_RRC_STATE_CELL_DCH";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"KTDS_RRC_STATE_CELL_FACH";
      break;
    case 2:
      id result = @"KTDS_RRC_STATE_CELL_PCH";
      break;
    case 3:
      id result = @"KTDS_RRC_STATE_URA_PCH";
      break;
    case 4:
      id result = @"KTDS_RRC_STATE_IDLE";
      break;
    case 5:
      id result = @"KTDS_RRC_STATE_WAIT";
      break;
    case 6:
      id result = @"KTDS_RRC_STATE_CELL_BARRED";
      break;
    case 7:
      id result = @"KTDS_RRC_STATE_NULL";
      break;
    default:
      if (a3 == 255)
      {
        id result = @"KTDS_RRC_STATE_INACTIVE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id result = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return result;
}

- (int)StringAsNewRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_DCH"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_FACH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_PCH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_URA_PCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_IDLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_WAIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_CELL_BARRED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_NULL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KTDS_RRC_STATE_INACTIVE"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularTdsRrcState;
  int v4 = [(KCellularTdsRrcState *)&v8 description];
  v5 = [(KCellularTdsRrcState *)self dictionaryRepresentation];
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
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  int rrcState = self->_rrcState;
  v9 = @"KTDS_RRC_STATE_CELL_DCH";
  switch(rrcState)
  {
    case 0:
      break;
    case 1:
      v9 = @"KTDS_RRC_STATE_CELL_FACH";
      break;
    case 2:
      v9 = @"KTDS_RRC_STATE_CELL_PCH";
      break;
    case 3:
      v9 = @"KTDS_RRC_STATE_URA_PCH";
      break;
    case 4:
      v9 = @"KTDS_RRC_STATE_IDLE";
      break;
    case 5:
      v9 = @"KTDS_RRC_STATE_WAIT";
      break;
    case 6:
      v9 = @"KTDS_RRC_STATE_CELL_BARRED";
      break;
    case 7:
      v9 = @"KTDS_RRC_STATE_NULL";
      break;
    default:
      if (rrcState == 255)
      {
        v9 = @"KTDS_RRC_STATE_INACTIVE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rrcState);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v3 setObject:v9 forKey:@"rrc_state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_23:
  int newRrcState = self->_newRrcState;
  v11 = @"KTDS_RRC_STATE_CELL_DCH";
  switch(newRrcState)
  {
    case 0:
      break;
    case 1:
      v11 = @"KTDS_RRC_STATE_CELL_FACH";
      break;
    case 2:
      v11 = @"KTDS_RRC_STATE_CELL_PCH";
      break;
    case 3:
      v11 = @"KTDS_RRC_STATE_URA_PCH";
      break;
    case 4:
      v11 = @"KTDS_RRC_STATE_IDLE";
      break;
    case 5:
      v11 = @"KTDS_RRC_STATE_WAIT";
      break;
    case 6:
      v11 = @"KTDS_RRC_STATE_CELL_BARRED";
      break;
    case 7:
      v11 = @"KTDS_RRC_STATE_NULL";
      break;
    default:
      if (newRrcState == 255)
      {
        v11 = @"KTDS_RRC_STATE_INACTIVE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newRrcState);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  [v3 setObject:v11 forKey:@"new_rrc_state"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_35:
  v12 = [NSNumber numberWithUnsignedInt:self->_prevStateDurMs];
  [v3 setObject:v12 forKey:@"prev_state_dur_ms"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularTdsRrcStateReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_12;
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
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
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
  *((_DWORD *)v4 + 6) = self->_rrcState;
  *((unsigned char *)v4 + 32) |= 8u;
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
  *((_DWORD *)v4 + 4) = self->_newRrcState;
  *((unsigned char *)v4 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_prevStateDurMs;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 7) = self->_subsId;
    *((unsigned char *)v4 + 32) |= 0x10u;
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_rrcState;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_newRrcState;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_prevStateDurMs;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 7) = self->_subsId;
  *((unsigned char *)result + 32) |= 0x10u;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_rrcState != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_newRrcState != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 7)) {
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
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_rrcState;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
    uint64_t v4 = 2654435761 * self->_newRrcState;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_prevStateDurMs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_subsId;
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
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_int rrcState = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_int newRrcState = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_prevStateDurMs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
LABEL_6:
    self->_subsId = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
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