@interface NPKProtoCheckPasscodePolicyComplianceRequest
- (BOOL)applyBackgroundEnforcementIfNecessary;
- (BOOL)applyRestrictions;
- (BOOL)hasApplyBackgroundEnforcementIfNecessary;
- (BOOL)hasApplyRestrictions;
- (BOOL)hasEnforcedPolicy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enforcedPolicyAsString:(int)a3;
- (int)StringAsEnforcedPolicy:(id)a3;
- (int)enforcedPolicy;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplyBackgroundEnforcementIfNecessary:(BOOL)a3;
- (void)setApplyRestrictions:(BOOL)a3;
- (void)setEnforcedPolicy:(int)a3;
- (void)setHasApplyBackgroundEnforcementIfNecessary:(BOOL)a3;
- (void)setHasApplyRestrictions:(BOOL)a3;
- (void)setHasEnforcedPolicy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCheckPasscodePolicyComplianceRequest

- (int)enforcedPolicy
{
  if (*(unsigned char *)&self->_has) {
    return self->_enforcedPolicy;
  }
  else {
    return 0;
  }
}

- (void)setEnforcedPolicy:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enforcedPolicy = a3;
}

- (void)setHasEnforcedPolicy:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnforcedPolicy
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)enforcedPolicyAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"China";
  }
  return v4;
}

- (int)StringAsEnforcedPolicy:(id)a3
{
  return 0;
}

- (void)setApplyRestrictions:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_applyRestrictions = a3;
}

- (void)setHasApplyRestrictions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasApplyRestrictions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setApplyBackgroundEnforcementIfNecessary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_applyBackgroundEnforcementIfNecessary = a3;
}

- (void)setHasApplyBackgroundEnforcementIfNecessary:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApplyBackgroundEnforcementIfNecessary
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCheckPasscodePolicyComplianceRequest;
  v4 = [(NPKProtoCheckPasscodePolicyComplianceRequest *)&v8 description];
  v5 = [(NPKProtoCheckPasscodePolicyComplianceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    if (self->_enforcedPolicy)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_enforcedPolicy);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = @"China";
    }
    [v3 setObject:v7 forKey:@"enforcedPolicy"];

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
  objc_super v8 = [NSNumber numberWithBool:self->_applyRestrictions];
  [v3 setObject:v8 forKey:@"applyRestrictions"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithBool:self->_applyBackgroundEnforcementIfNecessary];
    [v3 setObject:v5 forKey:@"applyBackgroundEnforcementIfNecessary"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCheckPasscodePolicyComplianceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_enforcedPolicy;
    *((unsigned char *)v4 + 16) |= 1u;
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
  *((unsigned char *)v4 + 13) = self->_applyRestrictions;
  *((unsigned char *)v4 + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 12) = self->_applyBackgroundEnforcementIfNecessary;
    *((unsigned char *)v4 + 16) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_enforcedPolicy;
    *((unsigned char *)result + 16) |= 1u;
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
  *((unsigned char *)result + 13) = self->_applyRestrictions;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_applyBackgroundEnforcementIfNecessary;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_enforcedPolicy != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_applyRestrictions)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_applyBackgroundEnforcementIfNecessary)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_enforcedPolicy;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_applyRestrictions;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_applyBackgroundEnforcementIfNecessary;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_enforcedPolicy = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_applyRestrictions = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_4:
    self->_applyBackgroundEnforcementIfNecessary = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (BOOL)applyRestrictions
{
  return self->_applyRestrictions;
}

- (BOOL)applyBackgroundEnforcementIfNecessary
{
  return self->_applyBackgroundEnforcementIfNecessary;
}

@end