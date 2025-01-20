@interface ORCHSchemaORCHPowerContextPolicyReported
- (BOOL)hasPowerContextPolicies;
- (BOOL)hasVisionPowerState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHPowerContextPolicies)powerContextPolicies;
- (ORCHSchemaORCHPowerContextPolicyReported)initWithDictionary:(id)a3;
- (ORCHSchemaORCHPowerContextPolicyReported)initWithJSON:(id)a3;
- (ORCHSchemaORCHVisionPowerState)visionPowerState;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichPlatformspecificpowerstates;
- (void)deletePowerContextPolicies;
- (void)deleteVisionPowerState;
- (void)setHasPowerContextPolicies:(BOOL)a3;
- (void)setHasVisionPowerState:(BOOL)a3;
- (void)setPowerContextPolicies:(id)a3;
- (void)setVisionPowerState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHPowerContextPolicyReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHPowerContextPolicyReported;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHPowerContextPolicyReported *)self deletePowerContextPolicies];
  }
  v9 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHPowerContextPolicyReported *)self deleteVisionPowerState];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionPowerState, 0);
  objc_storeStrong((id *)&self->_powerContextPolicies, 0);
}

- (void)setHasVisionPowerState:(BOOL)a3
{
  self->_hasVisionPowerState = a3;
}

- (BOOL)hasVisionPowerState
{
  return self->_hasVisionPowerState;
}

- (void)setHasPowerContextPolicies:(BOOL)a3
{
  self->_hasPowerContextPolicies = a3;
}

- (void)setPowerContextPolicies:(id)a3
{
}

- (ORCHSchemaORCHPowerContextPolicies)powerContextPolicies
{
  return self->_powerContextPolicies;
}

- (unint64_t)whichPlatformspecificpowerstates
{
  return self->_whichPlatformspecificpowerstates;
}

- (ORCHSchemaORCHPowerContextPolicyReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHPowerContextPolicyReported;
  v5 = [(ORCHSchemaORCHPowerContextPolicyReported *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"powerContextPolicies"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ORCHSchemaORCHPowerContextPolicies alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHPowerContextPolicyReported *)v5 setPowerContextPolicies:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"visionPowerState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ORCHSchemaORCHVisionPowerState alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHPowerContextPolicyReported *)v5 setVisionPowerState:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHPowerContextPolicyReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHPowerContextPolicyReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHPowerContextPolicyReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_powerContextPolicies)
  {
    id v4 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"powerContextPolicies"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"powerContextPolicies"];
    }
  }
  if (self->_visionPowerState)
  {
    uint64_t v7 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"visionPowerState"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"visionPowerState"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ORCHSchemaORCHPowerContextPolicies *)self->_powerContextPolicies hash];
  return [(ORCHSchemaORCHVisionPowerState *)self->_visionPowerState hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichPlatformspecificpowerstates = self->_whichPlatformspecificpowerstates;
  if (whichPlatformspecificpowerstates != [v4 whichPlatformspecificpowerstates]) {
    goto LABEL_13;
  }
  v6 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
  uint64_t v7 = [v4 powerContextPolicies];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
    int v11 = [v4 powerContextPolicies];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
  uint64_t v7 = [v4 visionPowerState];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
    v16 = [v4 visionPowerState];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];

  if (v4)
  {
    v5 = [(ORCHSchemaORCHPowerContextPolicyReported *)self powerContextPolicies];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHPowerContextPolicyReported *)self visionPowerState];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHPowerContextPolicyReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteVisionPowerState
{
  if (self->_whichPlatformspecificpowerstates == 101)
  {
    self->_unint64_t whichPlatformspecificpowerstates = 0;
    self->_visionPowerState = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHVisionPowerState)visionPowerState
{
  if (self->_whichPlatformspecificpowerstates == 101) {
    v2 = self->_visionPowerState;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVisionPowerState:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichPlatformspecificpowerstates = v3;
  objc_storeStrong((id *)&self->_visionPowerState, a3);
}

- (void)deletePowerContextPolicies
{
}

- (BOOL)hasPowerContextPolicies
{
  return self->_powerContextPolicies != 0;
}

@end