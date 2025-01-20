@interface CAPContactFillerUserEvent
- (BOOL)hasHighConfidenceRuleCount;
- (BOOL)hasLowConfidenceRuleCount;
- (BOOL)hasMediumConfidenceRuleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)highConfidenceRuleCount;
- (unsigned)lowConfidenceRuleCount;
- (unsigned)mediumConfidenceRuleCount;
- (unsigned)shareInteractionsSent;
- (unsigned)textInteractionsReceived;
- (unsigned)textInteractionsSent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHighConfidenceRuleCount:(BOOL)a3;
- (void)setHasLowConfidenceRuleCount:(BOOL)a3;
- (void)setHasMediumConfidenceRuleCount:(BOOL)a3;
- (void)setHighConfidenceRuleCount:(unsigned int)a3;
- (void)setLowConfidenceRuleCount:(unsigned int)a3;
- (void)setMediumConfidenceRuleCount:(unsigned int)a3;
- (void)setShareInteractionsSent:(unsigned int)a3;
- (void)setTextInteractionsReceived:(unsigned int)a3;
- (void)setTextInteractionsSent:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAPContactFillerUserEvent

- (void)setHighConfidenceRuleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_highConfidenceRuleCount = a3;
}

- (void)setHasHighConfidenceRuleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHighConfidenceRuleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMediumConfidenceRuleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mediumConfidenceRuleCount = a3;
}

- (void)setHasMediumConfidenceRuleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMediumConfidenceRuleCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLowConfidenceRuleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lowConfidenceRuleCount = a3;
}

- (void)setHasLowConfidenceRuleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLowConfidenceRuleCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAPContactFillerUserEvent;
  v4 = [(CAPContactFillerUserEvent *)&v8 description];
  v5 = [(CAPContactFillerUserEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_textInteractionsSent];
  [v3 setObject:v4 forKey:@"textInteractionsSent"];

  v5 = [NSNumber numberWithUnsignedInt:self->_textInteractionsReceived];
  [v3 setObject:v5 forKey:@"textInteractionsReceived"];

  v6 = [NSNumber numberWithUnsignedInt:self->_shareInteractionsSent];
  [v3 setObject:v6 forKey:@"shareInteractionsSent"];

  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_highConfidenceRuleCount];
    [v3 setObject:v10 forKey:@"highConfidenceRuleCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = [NSNumber numberWithUnsignedInt:self->_mediumConfidenceRuleCount];
  [v3 setObject:v11 forKey:@"mediumConfidenceRuleCount"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_lowConfidenceRuleCount];
    [v3 setObject:v8 forKey:@"lowConfidenceRuleCount"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAPContactFillerUserEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[7] = self->_textInteractionsSent;
  v4[6] = self->_textInteractionsReceived;
  v4[5] = self->_shareInteractionsSent;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_highConfidenceRuleCount;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_mediumConfidenceRuleCount;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_lowConfidenceRuleCount;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 7) = self->_textInteractionsSent;
  *((_DWORD *)result + 6) = self->_textInteractionsReceived;
  *((_DWORD *)result + 5) = self->_shareInteractionsSent;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_highConfidenceRuleCount;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_mediumConfidenceRuleCount;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_lowConfidenceRuleCount;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_textInteractionsSent != *((_DWORD *)v4 + 7)
    || self->_textInteractionsReceived != *((_DWORD *)v4 + 6)
    || self->_shareInteractionsSent != *((_DWORD *)v4 + 5))
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_highConfidenceRuleCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_19:
    BOOL v5 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_mediumConfidenceRuleCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_lowConfidenceRuleCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_highConfidenceRuleCount;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_mediumConfidenceRuleCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v4 = 0;
    return (2654435761 * self->_textInteractionsReceived) ^ (2654435761 * self->_textInteractionsSent) ^ (2654435761 * self->_shareInteractionsSent) ^ v2 ^ v3 ^ v4;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v4 = 2654435761 * self->_lowConfidenceRuleCount;
  return (2654435761 * self->_textInteractionsReceived) ^ (2654435761 * self->_textInteractionsSent) ^ (2654435761 * self->_shareInteractionsSent) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_textInteractionsSent = v4[7];
  self->_textInteractionsReceived = v4[6];
  self->_shareInteractionsSent = v4[5];
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_highConfidenceRuleCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[8] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mediumConfidenceRuleCount = v4[4];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[8] & 2) != 0)
  {
LABEL_4:
    self->_lowConfidenceRuleCount = v4[3];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unsigned)textInteractionsSent
{
  return self->_textInteractionsSent;
}

- (void)setTextInteractionsSent:(unsigned int)a3
{
  self->_textInteractionsSent = a3;
}

- (unsigned)textInteractionsReceived
{
  return self->_textInteractionsReceived;
}

- (void)setTextInteractionsReceived:(unsigned int)a3
{
  self->_textInteractionsReceived = a3;
}

- (unsigned)shareInteractionsSent
{
  return self->_shareInteractionsSent;
}

- (void)setShareInteractionsSent:(unsigned int)a3
{
  self->_shareInteractionsSent = a3;
}

- (unsigned)highConfidenceRuleCount
{
  return self->_highConfidenceRuleCount;
}

- (unsigned)mediumConfidenceRuleCount
{
  return self->_mediumConfidenceRuleCount;
}

- (unsigned)lowConfidenceRuleCount
{
  return self->_lowConfidenceRuleCount;
}

@end