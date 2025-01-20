@interface ODMSiriSchemaODMTrialExperimentIdentifiers
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)experimentId;
- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithDictionary:(id)a3;
- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithJSON:(id)a3;
- (SISchemaUUID)treatmentId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)deploymentId;
- (unint64_t)hash;
- (void)deleteDeploymentId;
- (void)deleteExperimentId;
- (void)deleteTreatmentId;
- (void)setDeploymentId:(int64_t)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODMSiriSchemaODMTrialExperimentIdentifiers

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMTrialExperimentIdentifiers;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self deleteTreatmentId];
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
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (void)setHasTreatmentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)deploymentId
{
  return self->_deploymentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (SISchemaUUID)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODMSiriSchemaODMTrialExperimentIdentifiers;
  v5 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ODMSiriSchemaODMTrialExperimentIdentifiers *)v5 setExperimentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"treatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ODMSiriSchemaODMTrialExperimentIdentifiers *)v5 setTreatmentId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODMSiriSchemaODMTrialExperimentIdentifiers setDeploymentId:](v5, "setDeploymentId:", [v10 longLongValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (ODMSiriSchemaODMTrialExperimentIdentifiers)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ODMSiriSchemaODMTrialExperimentIdentifiers deploymentId](self, "deploymentId"));
    [v3 setObject:v4 forKeyedSubscript:@"deploymentId"];
  }
  if (self->_experimentId)
  {
    v5 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self experimentId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"experimentId"];
  }
  if (self->_treatmentId)
  {
    uint64_t v7 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"treatmentId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"treatmentId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_treatmentId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_deploymentId;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self experimentId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self experimentId];
    v10 = [v4 experimentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
  v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
    v15 = [v4 treatmentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int64_t deploymentId = self->_deploymentId, deploymentId == [v4 deploymentId]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self experimentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];

  if (v5)
  {
    v6 = [(ODMSiriSchemaODMTrialExperimentIdentifiers *)self treatmentId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMTrialExperimentIdentifiersReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeploymentId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeploymentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeploymentId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t deploymentId = a3;
}

- (void)deleteTreatmentId
{
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (void)deleteExperimentId
{
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

@end