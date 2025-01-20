@interface INFERENCESchemaINFERENCETrialEnrollment
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasRolloutId;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCETrialEnrollment)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCETrialEnrollment)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)experimentId;
- (NSString)rolloutId;
- (NSString)treatmentId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)deploymentId;
- (unint64_t)hash;
- (void)deleteDeploymentId;
- (void)deleteExperimentId;
- (void)deleteRolloutId;
- (void)deleteTreatmentId;
- (void)setDeploymentId:(int64_t)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasRolloutId:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setRolloutId:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCETrialEnrollment

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (void)setHasRolloutId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRolloutId:(id)a3
{
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int64_t)deploymentId
{
  return self->_deploymentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
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

- (INFERENCESchemaINFERENCETrialEnrollment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCETrialEnrollment;
  v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCETrialEnrollment *)v5 setExperimentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"treatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(INFERENCESchemaINFERENCETrialEnrollment *)v5 setTreatmentId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCETrialEnrollment setDeploymentId:](v5, "setDeploymentId:", [v10 longLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"rolloutId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(INFERENCESchemaINFERENCETrialEnrollment *)v5 setRolloutId:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCETrialEnrollment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCETrialEnrollment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCETrialEnrollment *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCETrialEnrollment deploymentId](self, "deploymentId"));
    [v3 setObject:v4 forKeyedSubscript:@"deploymentId"];
  }
  if (self->_experimentId)
  {
    v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)self experimentId];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"experimentId"];
  }
  if (self->_rolloutId)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCETrialEnrollment *)self rolloutId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"rolloutId"];
  }
  if (self->_treatmentId)
  {
    v9 = [(INFERENCESchemaINFERENCETrialEnrollment *)self treatmentId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"treatmentId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_deploymentId;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_rolloutId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCETrialEnrollment *)self experimentId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCETrialEnrollment *)self experimentId];
    v10 = [v4 experimentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)self treatmentId];
  v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCETrialEnrollment *)self treatmentId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(INFERENCESchemaINFERENCETrialEnrollment *)self treatmentId];
    objc_super v15 = [v4 treatmentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t deploymentId = self->_deploymentId;
    if (deploymentId != [v4 deploymentId]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)self rolloutId];
  v6 = [v4 rolloutId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(INFERENCESchemaINFERENCETrialEnrollment *)self rolloutId];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(INFERENCESchemaINFERENCETrialEnrollment *)self rolloutId];
    v21 = [v4 rolloutId];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(INFERENCESchemaINFERENCETrialEnrollment *)self experimentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(INFERENCESchemaINFERENCETrialEnrollment *)self treatmentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  v6 = [(INFERENCESchemaINFERENCETrialEnrollment *)self rolloutId];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCETrialEnrollmentReadFrom(self, (uint64_t)a3);
}

- (void)deleteRolloutId
{
}

- (BOOL)hasRolloutId
{
  return self->_rolloutId != 0;
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