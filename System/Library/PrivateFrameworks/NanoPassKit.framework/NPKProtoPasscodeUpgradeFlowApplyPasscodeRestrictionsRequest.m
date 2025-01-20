@interface NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequest
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
- (void)setEnforcedPolicy:(int)a3;
- (void)setHasEnforcedPolicy:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequest

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

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequest;
  v4 = [(NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequest *)&v8 description];
  v5 = [(NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    if (self->_enforcedPolicy)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_enforcedPolicy);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = @"China";
    }
    [v3 setObject:v4 forKey:@"enforcedPolicy"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPasscodeUpgradeFlowApplyPasscodeRestrictionsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_enforcedPolicy;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_enforcedPolicy;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_enforcedPolicy == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_enforcedPolicy;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_enforcedPolicy = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end