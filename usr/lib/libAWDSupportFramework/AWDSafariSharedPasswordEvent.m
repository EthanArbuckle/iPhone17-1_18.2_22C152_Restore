@interface AWDSafariSharedPasswordEvent
- (BOOL)hasInitiatedSharePasswordOutcome;
- (BOOL)hasPasswordSharingMechanism;
- (BOOL)hasReceivedSharedPasswordOutcome;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initiatedSharePasswordOutcomeAsString:(int)a3;
- (id)passwordSharingMechanismAsString:(int)a3;
- (id)receivedSharedPasswordOutcomeAsString:(int)a3;
- (int)StringAsInitiatedSharePasswordOutcome:(id)a3;
- (int)StringAsPasswordSharingMechanism:(id)a3;
- (int)StringAsReceivedSharedPasswordOutcome:(id)a3;
- (int)initiatedSharePasswordOutcome;
- (int)passwordSharingMechanism;
- (int)receivedSharedPasswordOutcome;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInitiatedSharePasswordOutcome:(BOOL)a3;
- (void)setHasPasswordSharingMechanism:(BOOL)a3;
- (void)setHasReceivedSharedPasswordOutcome:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInitiatedSharePasswordOutcome:(int)a3;
- (void)setPasswordSharingMechanism:(int)a3;
- (void)setReceivedSharedPasswordOutcome:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariSharedPasswordEvent

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

- (int)initiatedSharePasswordOutcome
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_initiatedSharePasswordOutcome;
  }
  else {
    return 0;
  }
}

- (void)setInitiatedSharePasswordOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_initiatedSharePasswordOutcome = a3;
}

- (void)setHasInitiatedSharePasswordOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInitiatedSharePasswordOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)initiatedSharePasswordOutcomeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9EF0[a3];
  }
}

- (int)StringAsInitiatedSharePasswordOutcome:(id)a3
{
  if ([a3 isEqualToString:@"COMPLETED"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"CANCELLED"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"FAILED_WITH_ERROR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"ABORTED_DUE_TO_LOCKOUT"]) {
    return 3;
  }
  return 0;
}

- (int)receivedSharedPasswordOutcome
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_receivedSharedPasswordOutcome;
  }
  else {
    return 0;
  }
}

- (void)setReceivedSharedPasswordOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_receivedSharedPasswordOutcome = a3;
}

- (void)setHasReceivedSharedPasswordOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReceivedSharedPasswordOutcome
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)receivedSharedPasswordOutcomeAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9F10[a3];
  }
}

- (int)StringAsReceivedSharedPasswordOutcome:(id)a3
{
  if ([a3 isEqualToString:@"NO_CONFLICT"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"UPDATE_EXISTING_PASSWORD_AFTER_CONFLICT"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"DO_NOT_UPDATE_EXISTING_PASSWORD_AFTER_CONFLICT"]) {
    return 2;
  }
  return 0;
}

- (int)passwordSharingMechanism
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_passwordSharingMechanism;
  }
  else {
    return 0;
  }
}

- (void)setPasswordSharingMechanism:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_passwordSharingMechanism = a3;
}

- (void)setHasPasswordSharingMechanism:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPasswordSharingMechanism
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)passwordSharingMechanismAsString:(int)a3
{
  if (a3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return @"AIRDROP";
  }
}

- (int)StringAsPasswordSharingMechanism:(id)a3
{
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariSharedPasswordEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariSharedPasswordEvent description](&v3, sel_description), -[AWDSafariSharedPasswordEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t initiatedSharePasswordOutcome = self->_initiatedSharePasswordOutcome;
  if (initiatedSharePasswordOutcome >= 4) {
    v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_initiatedSharePasswordOutcome];
  }
  else {
    v6 = off_2641B9EF0[initiatedSharePasswordOutcome];
  }
  [v3 setObject:v6 forKey:@"initiatedSharePasswordOutcome"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return v3;
    }
    goto LABEL_15;
  }
LABEL_11:
  uint64_t receivedSharedPasswordOutcome = self->_receivedSharedPasswordOutcome;
  if (receivedSharedPasswordOutcome >= 3) {
    v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_receivedSharedPasswordOutcome];
  }
  else {
    v8 = off_2641B9F10[receivedSharedPasswordOutcome];
  }
  [v3 setObject:v8 forKey:@"receivedSharedPasswordOutcome"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_15:
    if (self->_passwordSharingMechanism) {
      v9 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_passwordSharingMechanism];
    }
    else {
      v9 = @"AIRDROP";
    }
    [v3 setObject:v9 forKey:@"passwordSharingMechanism"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariSharedPasswordEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 4) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_initiatedSharePasswordOutcome;
  *((unsigned char *)a3 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 5) = self->_passwordSharingMechanism;
    *((unsigned char *)a3 + 28) |= 4u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 6) = self->_receivedSharedPasswordOutcome;
  *((unsigned char *)a3 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_initiatedSharePasswordOutcome;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_receivedSharedPasswordOutcome;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_passwordSharingMechanism;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_initiatedSharePasswordOutcome != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_receivedSharedPasswordOutcome != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_passwordSharingMechanism != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_initiatedSharePasswordOutcome;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_receivedSharedPasswordOutcome;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_passwordSharingMechanism;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t initiatedSharePasswordOutcome = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_9:
    self->_passwordSharingMechanism = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_8:
  self->_uint64_t receivedSharedPasswordOutcome = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 28) & 4) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end