@interface TRITrialRolloutFields
- (BOOL)hasClientFactorPackSetId;
- (BOOL)hasClientRampId;
- (BOOL)hasClientRolloutId;
- (BOOL)hasClientTargetingRuleGroupOrdinal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientFactorPackSetId;
- (NSString)clientRampId;
- (NSString)clientRolloutId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clientTargetingRuleGroupOrdinal;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientFactorPackSetId:(id)a3;
- (void)setClientRampId:(id)a3;
- (void)setClientRolloutId:(id)a3;
- (void)setClientTargetingRuleGroupOrdinal:(int)a3;
- (void)setHasClientTargetingRuleGroupOrdinal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialRolloutFields

- (BOOL)hasClientRolloutId
{
  return self->_clientRolloutId != 0;
}

- (BOOL)hasClientFactorPackSetId
{
  return self->_clientFactorPackSetId != 0;
}

- (BOOL)hasClientRampId
{
  return self->_clientRampId != 0;
}

- (void)setClientTargetingRuleGroupOrdinal:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientTargetingRuleGroupOrdinal = a3;
}

- (void)setHasClientTargetingRuleGroupOrdinal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientTargetingRuleGroupOrdinal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialRolloutFields;
  v4 = [(TRITrialRolloutFields *)&v8 description];
  v5 = [(TRITrialRolloutFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientRolloutId = self->_clientRolloutId;
  if (clientRolloutId) {
    [v3 setObject:clientRolloutId forKey:@"client_rollout_id"];
  }
  clientFactorPackSetId = self->_clientFactorPackSetId;
  if (clientFactorPackSetId) {
    [v4 setObject:clientFactorPackSetId forKey:@"client_factor_pack_set_id"];
  }
  clientRampId = self->_clientRampId;
  if (clientRampId) {
    [v4 setObject:clientRampId forKey:@"client_ramp_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_clientTargetingRuleGroupOrdinal];
    [v4 setObject:v8 forKey:@"client_targeting_rule_group_ordinal"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialRolloutFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientRolloutId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientFactorPackSetId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientRampId)
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
  if (self->_clientRolloutId)
  {
    objc_msgSend(v4, "setClientRolloutId:");
    id v4 = v5;
  }
  if (self->_clientFactorPackSetId)
  {
    objc_msgSend(v5, "setClientFactorPackSetId:");
    id v4 = v5;
  }
  if (self->_clientRampId)
  {
    objc_msgSend(v5, "setClientRampId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_clientTargetingRuleGroupOrdinal;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientRolloutId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_clientFactorPackSetId copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_clientRampId copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_clientTargetingRuleGroupOrdinal;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  clientRolloutId = self->_clientRolloutId;
  if ((unint64_t)clientRolloutId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientRolloutId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  clientFactorPackSetId = self->_clientFactorPackSetId;
  if ((unint64_t)clientFactorPackSetId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientFactorPackSetId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  clientRampId = self->_clientRampId;
  if ((unint64_t)clientRampId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientRampId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_clientTargetingRuleGroupOrdinal == *((_DWORD *)v4 + 8))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientRolloutId hash];
  NSUInteger v4 = [(NSString *)self->_clientFactorPackSetId hash];
  NSUInteger v5 = [(NSString *)self->_clientRampId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_clientTargetingRuleGroupOrdinal;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3))
  {
    [(TRITrialRolloutFields *)self setClientRolloutId:"setClientRolloutId:"];
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[TRITrialRolloutFields setClientFactorPackSetId:](self, "setClientFactorPackSetId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[TRITrialRolloutFields setClientRampId:](self, "setClientRampId:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    self->_clientTargetingRuleGroupOrdinal = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)clientRolloutId
{
  return self->_clientRolloutId;
}

- (void)setClientRolloutId:(id)a3
{
}

- (NSString)clientFactorPackSetId
{
  return self->_clientFactorPackSetId;
}

- (void)setClientFactorPackSetId:(id)a3
{
}

- (NSString)clientRampId
{
  return self->_clientRampId;
}

- (void)setClientRampId:(id)a3
{
}

- (int)clientTargetingRuleGroupOrdinal
{
  return self->_clientTargetingRuleGroupOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRolloutId, 0);
  objc_storeStrong((id *)&self->_clientRampId, 0);
  objc_storeStrong((id *)&self->_clientFactorPackSetId, 0);
}

@end