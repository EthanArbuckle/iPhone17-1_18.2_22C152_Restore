@interface GRPSchemaTrialExperimentIdentifiers
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRPSchemaTrialExperimentIdentifiers)initWithDictionary:(id)a3;
- (GRPSchemaTrialExperimentIdentifiers)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)deploymentId;
- (NSString)experimentId;
- (NSString)treatmentId;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDeploymentId;
- (void)deleteExperimentId;
- (void)deleteTreatmentId;
- (void)setDeploymentId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRPSchemaTrialExperimentIdentifiers

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
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

- (GRPSchemaTrialExperimentIdentifiers)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GRPSchemaTrialExperimentIdentifiers;
  v5 = [(GRPSchemaTrialExperimentIdentifiers *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(GRPSchemaTrialExperimentIdentifiers *)v5 setExperimentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"treatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(GRPSchemaTrialExperimentIdentifiers *)v5 setTreatmentId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(GRPSchemaTrialExperimentIdentifiers *)v5 setDeploymentId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (GRPSchemaTrialExperimentIdentifiers)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRPSchemaTrialExperimentIdentifiers *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRPSchemaTrialExperimentIdentifiers *)self dictionaryRepresentation];
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
    id v4 = [(GRPSchemaTrialExperimentIdentifiers *)self deploymentId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"deploymentId"];
  }
  if (self->_experimentId)
  {
    v6 = [(GRPSchemaTrialExperimentIdentifiers *)self experimentId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"experimentId"];
  }
  if (self->_treatmentId)
  {
    v8 = [(GRPSchemaTrialExperimentIdentifiers *)self treatmentId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"treatmentId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_treatmentId hash] ^ v3;
  return v4 ^ [(NSString *)self->_deploymentId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(GRPSchemaTrialExperimentIdentifiers *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(GRPSchemaTrialExperimentIdentifiers *)self experimentId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(GRPSchemaTrialExperimentIdentifiers *)self experimentId];
    v10 = [v4 experimentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRPSchemaTrialExperimentIdentifiers *)self treatmentId];
  v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(GRPSchemaTrialExperimentIdentifiers *)self treatmentId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(GRPSchemaTrialExperimentIdentifiers *)self treatmentId];
    v15 = [v4 treatmentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(GRPSchemaTrialExperimentIdentifiers *)self deploymentId];
  v6 = [v4 deploymentId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(GRPSchemaTrialExperimentIdentifiers *)self deploymentId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(GRPSchemaTrialExperimentIdentifiers *)self deploymentId];
    v20 = [v4 deploymentId];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(GRPSchemaTrialExperimentIdentifiers *)self experimentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(GRPSchemaTrialExperimentIdentifiers *)self treatmentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(GRPSchemaTrialExperimentIdentifiers *)self deploymentId];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaTrialExperimentIdentifiersReadFrom(self, (uint64_t)a3);
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