@interface CAARSchemaCAARTrialEnrollment
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasRolloutId;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARTrialEnrollment)initWithDictionary:(id)a3;
- (CAARSchemaCAARTrialEnrollment)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)deploymentId;
- (NSString)experimentId;
- (NSString)rolloutId;
- (NSString)treatmentId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDeploymentId;
- (void)deleteExperimentId;
- (void)deleteRolloutId;
- (void)deleteTreatmentId;
- (void)setDeploymentId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasRolloutId:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setRolloutId:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARTrialEnrollment

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (void)setHasRolloutId:(BOOL)a3
{
  self->_hasRolloutId = a3;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  self->_hasDeploymentId = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  self->_hasTreatmentId = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  self->_hasExperimentId = a3;
}

- (void)setRolloutId:(id)a3
{
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (void)setDeploymentId:(id)a3
{
}

- (NSString)deploymentId
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

- (CAARSchemaCAARTrialEnrollment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAARSchemaCAARTrialEnrollment;
  v5 = [(CAARSchemaCAARTrialEnrollment *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(CAARSchemaCAARTrialEnrollment *)v5 setExperimentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"treatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(CAARSchemaCAARTrialEnrollment *)v5 setTreatmentId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(CAARSchemaCAARTrialEnrollment *)v5 setDeploymentId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"rolloutId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(CAARSchemaCAARTrialEnrollment *)v5 setRolloutId:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (CAARSchemaCAARTrialEnrollment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARTrialEnrollment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARTrialEnrollment *)self dictionaryRepresentation];
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
  if (self->_deploymentId)
  {
    id v4 = [(CAARSchemaCAARTrialEnrollment *)self deploymentId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"deploymentId"];
  }
  if (self->_experimentId)
  {
    v6 = [(CAARSchemaCAARTrialEnrollment *)self experimentId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"experimentId"];
  }
  if (self->_rolloutId)
  {
    v8 = [(CAARSchemaCAARTrialEnrollment *)self rolloutId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"rolloutId"];
  }
  if (self->_treatmentId)
  {
    v10 = [(CAARSchemaCAARTrialEnrollment *)self treatmentId];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"treatmentId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deploymentId hash];
  return v4 ^ v5 ^ [(NSString *)self->_rolloutId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(CAARSchemaCAARTrialEnrollment *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(CAARSchemaCAARTrialEnrollment *)self experimentId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(CAARSchemaCAARTrialEnrollment *)self experimentId];
    v10 = [v4 experimentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(CAARSchemaCAARTrialEnrollment *)self treatmentId];
  v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(CAARSchemaCAARTrialEnrollment *)self treatmentId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(CAARSchemaCAARTrialEnrollment *)self treatmentId];
    v15 = [v4 treatmentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(CAARSchemaCAARTrialEnrollment *)self deploymentId];
  v6 = [v4 deploymentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(CAARSchemaCAARTrialEnrollment *)self deploymentId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(CAARSchemaCAARTrialEnrollment *)self deploymentId];
    v20 = [v4 deploymentId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(CAARSchemaCAARTrialEnrollment *)self rolloutId];
  v6 = [v4 rolloutId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(CAARSchemaCAARTrialEnrollment *)self rolloutId];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(CAARSchemaCAARTrialEnrollment *)self rolloutId];
    v25 = [v4 rolloutId];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(CAARSchemaCAARTrialEnrollment *)self experimentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(CAARSchemaCAARTrialEnrollment *)self treatmentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(CAARSchemaCAARTrialEnrollment *)self deploymentId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(CAARSchemaCAARTrialEnrollment *)self rolloutId];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARTrialEnrollmentReadFrom(self, (uint64_t)a3);
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
}

- (BOOL)hasDeploymentId
{
  return self->_deploymentId != 0;
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