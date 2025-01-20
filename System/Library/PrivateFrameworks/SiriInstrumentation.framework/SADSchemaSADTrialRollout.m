@interface SADSchemaSADTrialRollout
- (BOOL)hasDeployment;
- (BOOL)hasFactorPack;
- (BOOL)hasRolloutId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)factorPack;
- (NSString)rolloutId;
- (SADSchemaSADTrialRollout)initWithDictionary:(id)a3;
- (SADSchemaSADTrialRollout)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)deployment;
- (void)deleteDeployment;
- (void)deleteFactorPack;
- (void)deleteRolloutId;
- (void)setDeployment:(unsigned int)a3;
- (void)setFactorPack:(id)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasFactorPack:(BOOL)a3;
- (void)setHasRolloutId:(BOOL)a3;
- (void)setRolloutId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SADSchemaSADTrialRollout

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPack, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

- (void)setHasFactorPack:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRolloutId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFactorPack:(id)a3
{
}

- (NSString)factorPack
{
  return self->_factorPack;
}

- (unsigned)deployment
{
  return self->_deployment;
}

- (void)setRolloutId:(id)a3
{
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (SADSchemaSADTrialRollout)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SADSchemaSADTrialRollout;
  v5 = [(SADSchemaSADTrialRollout *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rolloutId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SADSchemaSADTrialRollout *)v5 setRolloutId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"deployment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SADSchemaSADTrialRollout setDeployment:](v5, "setDeployment:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"factorPack"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SADSchemaSADTrialRollout *)v5 setFactorPack:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SADSchemaSADTrialRollout)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SADSchemaSADTrialRollout *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SADSchemaSADTrialRollout *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SADSchemaSADTrialRollout deployment](self, "deployment"));
    [v3 setObject:v4 forKeyedSubscript:@"deployment"];
  }
  if (self->_factorPack)
  {
    v5 = [(SADSchemaSADTrialRollout *)self factorPack];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"factorPack"];
  }
  if (self->_rolloutId)
  {
    uint64_t v7 = [(SADSchemaSADTrialRollout *)self rolloutId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"rolloutId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rolloutId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_deployment;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_factorPack hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SADSchemaSADTrialRollout *)self rolloutId];
  v6 = [v4 rolloutId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SADSchemaSADTrialRollout *)self rolloutId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SADSchemaSADTrialRollout *)self rolloutId];
    v10 = [v4 rolloutId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int deployment = self->_deployment;
    if (deployment != [v4 deployment]) {
      goto LABEL_15;
    }
  }
  v5 = [(SADSchemaSADTrialRollout *)self factorPack];
  v6 = [v4 factorPack];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SADSchemaSADTrialRollout *)self factorPack];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SADSchemaSADTrialRollout *)self factorPack];
    v16 = [v4 factorPack];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SADSchemaSADTrialRollout *)self rolloutId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(SADSchemaSADTrialRollout *)self factorPack];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADTrialRolloutReadFrom(self, (uint64_t)a3);
}

- (void)deleteFactorPack
{
}

- (BOOL)hasFactorPack
{
  return self->_factorPack != 0;
}

- (void)deleteDeployment
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeployment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeployment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeployment:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int deployment = a3;
}

- (void)deleteRolloutId
{
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
}

@end