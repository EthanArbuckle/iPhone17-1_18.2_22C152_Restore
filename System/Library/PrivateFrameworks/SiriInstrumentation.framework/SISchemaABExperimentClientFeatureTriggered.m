@interface SISchemaABExperimentClientFeatureTriggered
- (BOOL)hasExperimentId;
- (BOOL)hasTurnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)experimentId;
- (SISchemaABExperimentClientFeatureTriggered)initWithDictionary:(id)a3;
- (SISchemaABExperimentClientFeatureTriggered)initWithJSON:(id)a3;
- (SISchemaUUID)turnId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExperimentId;
- (void)deleteTurnId;
- (void)setExperimentId:(id)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasTurnId:(BOOL)a3;
- (void)setTurnId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaABExperimentClientFeatureTriggered

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaABExperimentClientFeatureTriggered;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaABExperimentClientFeatureTriggered *)self deleteTurnId];
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
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
}

- (void)setHasExperimentId:(BOOL)a3
{
  self->_hasExperimentId = a3;
}

- (void)setHasTurnId:(BOOL)a3
{
  self->_hasTurnId = a3;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setTurnId:(id)a3
{
}

- (SISchemaUUID)turnId
{
  return self->_turnId;
}

- (SISchemaABExperimentClientFeatureTriggered)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaABExperimentClientFeatureTriggered;
  v5 = [(SISchemaABExperimentClientFeatureTriggered *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"turnId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaABExperimentClientFeatureTriggered *)v5 setTurnId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SISchemaABExperimentClientFeatureTriggered *)v5 setExperimentId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaABExperimentClientFeatureTriggered)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaABExperimentClientFeatureTriggered *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaABExperimentClientFeatureTriggered *)self dictionaryRepresentation];
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
  if (self->_experimentId)
  {
    id v4 = [(SISchemaABExperimentClientFeatureTriggered *)self experimentId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"experimentId"];
  }
  if (self->_turnId)
  {
    v6 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"turnId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"turnId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_turnId hash];
  return [(NSString *)self->_experimentId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
  v6 = [v4 turnId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
    v10 = [v4 turnId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaABExperimentClientFeatureTriggered *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaABExperimentClientFeatureTriggered *)self experimentId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaABExperimentClientFeatureTriggered *)self experimentId];
    v15 = [v4 experimentId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];

  if (v4)
  {
    v5 = [(SISchemaABExperimentClientFeatureTriggered *)self turnId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaABExperimentClientFeatureTriggered *)self experimentId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABExperimentClientFeatureTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)deleteExperimentId
{
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (void)deleteTurnId
{
}

- (BOOL)hasTurnId
{
  return self->_turnId != 0;
}

@end