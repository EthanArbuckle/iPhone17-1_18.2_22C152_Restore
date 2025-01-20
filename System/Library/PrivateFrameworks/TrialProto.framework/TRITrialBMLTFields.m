@interface TRITrialBMLTFields
- (BOOL)hasClientBmltFactorPackSetId;
- (BOOL)hasClientBmltId;
- (BOOL)hasClientBmltTargetingRuleGroupOrdinal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientBmltFactorPackSetId;
- (NSString)clientBmltId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clientBmltTargetingRuleGroupOrdinal;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientBmltFactorPackSetId:(id)a3;
- (void)setClientBmltId:(id)a3;
- (void)setClientBmltTargetingRuleGroupOrdinal:(int)a3;
- (void)setHasClientBmltTargetingRuleGroupOrdinal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialBMLTFields

- (BOOL)hasClientBmltId
{
  return self->_clientBmltId != 0;
}

- (BOOL)hasClientBmltFactorPackSetId
{
  return self->_clientBmltFactorPackSetId != 0;
}

- (void)setClientBmltTargetingRuleGroupOrdinal:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientBmltTargetingRuleGroupOrdinal = a3;
}

- (void)setHasClientBmltTargetingRuleGroupOrdinal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientBmltTargetingRuleGroupOrdinal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialBMLTFields;
  v4 = [(TRITrialBMLTFields *)&v8 description];
  v5 = [(TRITrialBMLTFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientBmltId = self->_clientBmltId;
  if (clientBmltId) {
    [v3 setObject:clientBmltId forKey:@"client_bmlt_id"];
  }
  clientBmltFactorPackSetId = self->_clientBmltFactorPackSetId;
  if (clientBmltFactorPackSetId) {
    [v4 setObject:clientBmltFactorPackSetId forKey:@"client_bmlt_factor_pack_set_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_clientBmltTargetingRuleGroupOrdinal];
    [v4 setObject:v7 forKey:@"client_bmlt_targeting_rule_group_ordinal"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialBMLTFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientBmltId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientBmltFactorPackSetId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientBmltId)
  {
    objc_msgSend(v4, "setClientBmltId:");
    id v4 = v5;
  }
  if (self->_clientBmltFactorPackSetId)
  {
    objc_msgSend(v5, "setClientBmltFactorPackSetId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_clientBmltTargetingRuleGroupOrdinal;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientBmltId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_clientBmltFactorPackSetId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_clientBmltTargetingRuleGroupOrdinal;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  clientBmltId = self->_clientBmltId;
  if ((unint64_t)clientBmltId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientBmltId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  clientBmltFactorPackSetId = self->_clientBmltFactorPackSetId;
  if ((unint64_t)clientBmltFactorPackSetId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientBmltFactorPackSetId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_clientBmltTargetingRuleGroupOrdinal == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientBmltId hash];
  NSUInteger v4 = [(NSString *)self->_clientBmltFactorPackSetId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_clientBmltTargetingRuleGroupOrdinal;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[TRITrialBMLTFields setClientBmltId:](self, "setClientBmltId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[TRITrialBMLTFields setClientBmltFactorPackSetId:](self, "setClientBmltFactorPackSetId:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    self->_clientBmltTargetingRuleGroupOrdinal = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)clientBmltId
{
  return self->_clientBmltId;
}

- (void)setClientBmltId:(id)a3
{
}

- (NSString)clientBmltFactorPackSetId
{
  return self->_clientBmltFactorPackSetId;
}

- (void)setClientBmltFactorPackSetId:(id)a3
{
}

- (int)clientBmltTargetingRuleGroupOrdinal
{
  return self->_clientBmltTargetingRuleGroupOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBmltId, 0);
  objc_storeStrong((id *)&self->_clientBmltFactorPackSetId, 0);
}

@end