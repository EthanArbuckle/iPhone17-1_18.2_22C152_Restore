@interface DODMLSchemaDODMLClientEventMetadata
- (BOOL)hasDodMlId;
- (BOOL)hasExperimentName;
- (BOOL)hasTrialDeploymentId;
- (BOOL)hasTrialExperimentId;
- (BOOL)hasTrialTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLSchemaDODMLClientEventMetadata)initWithDictionary:(id)a3;
- (DODMLSchemaDODMLClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)experimentName;
- (NSString)trialExperimentId;
- (SISchemaUUID)dodMlId;
- (SISchemaUUID)trialTreatmentId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)trialDeploymentId;
- (unint64_t)hash;
- (void)deleteDodMlId;
- (void)deleteExperimentName;
- (void)deleteTrialDeploymentId;
- (void)deleteTrialExperimentId;
- (void)deleteTrialTreatmentId;
- (void)setDodMlId:(id)a3;
- (void)setExperimentName:(id)a3;
- (void)setHasDodMlId:(BOOL)a3;
- (void)setHasExperimentName:(BOOL)a3;
- (void)setHasTrialDeploymentId:(BOOL)a3;
- (void)setHasTrialExperimentId:(BOOL)a3;
- (void)setHasTrialTreatmentId:(BOOL)a3;
- (void)setTrialDeploymentId:(int64_t)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLSchemaDODMLClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DODMLSchemaDODMLClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DODMLSchemaDODMLClientEventMetadata *)self deleteDodMlId];
  }
  v9 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DODMLSchemaDODMLClientEventMetadata *)self deleteTrialTreatmentId];
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
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_dodMlId, 0);
}

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  self->_hasDodMlId = a3;
}

- (void)setHasTrialExperimentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasExperimentName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDodMlId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int64_t)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setExperimentName:(id)a3
{
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setDodMlId:(id)a3
{
}

- (SISchemaUUID)dodMlId
{
  return self->_dodMlId;
}

- (DODMLSchemaDODMLClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DODMLSchemaDODMLClientEventMetadata;
  v5 = [(DODMLSchemaDODMLClientEventMetadata *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dodMlId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DODMLSchemaDODMLClientEventMetadata *)v5 setDodMlId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"experimentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(DODMLSchemaDODMLClientEventMetadata *)v5 setExperimentName:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"trialExperimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(DODMLSchemaDODMLClientEventMetadata *)v5 setTrialExperimentId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"trialTreatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(DODMLSchemaDODMLClientEventMetadata *)v5 setTrialTreatmentId:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"trialDeploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLSchemaDODMLClientEventMetadata setTrialDeploymentId:](v5, "setTrialDeploymentId:", [v14 longLongValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (DODMLSchemaDODMLClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLSchemaDODMLClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLSchemaDODMLClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_dodMlId)
  {
    id v4 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"dodMlId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"dodMlId"];
    }
  }
  if (self->_experimentName)
  {
    uint64_t v7 = [(DODMLSchemaDODMLClientEventMetadata *)self experimentName];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"experimentName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[DODMLSchemaDODMLClientEventMetadata trialDeploymentId](self, "trialDeploymentId"));
    [v3 setObject:v9 forKeyedSubscript:@"trialDeploymentId"];
  }
  if (self->_trialExperimentId)
  {
    v10 = [(DODMLSchemaDODMLClientEventMetadata *)self trialExperimentId];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"trialExperimentId"];
  }
  if (self->_trialTreatmentId)
  {
    v12 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"trialTreatmentId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"trialTreatmentId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_dodMlId hash];
  NSUInteger v4 = [(NSString *)self->_experimentName hash];
  NSUInteger v5 = [(NSString *)self->_trialExperimentId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_trialTreatmentId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_trialDeploymentId;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
  unint64_t v6 = [v4 dodMlId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
    v10 = [v4 dodMlId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLSchemaDODMLClientEventMetadata *)self experimentName];
  unint64_t v6 = [v4 experimentName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(DODMLSchemaDODMLClientEventMetadata *)self experimentName];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(DODMLSchemaDODMLClientEventMetadata *)self experimentName];
    v15 = [v4 experimentName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLSchemaDODMLClientEventMetadata *)self trialExperimentId];
  unint64_t v6 = [v4 trialExperimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(DODMLSchemaDODMLClientEventMetadata *)self trialExperimentId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(DODMLSchemaDODMLClientEventMetadata *)self trialExperimentId];
    v20 = [v4 trialExperimentId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
  unint64_t v6 = [v4 trialTreatmentId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
    v25 = [v4 trialTreatmentId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[48] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int64_t trialDeploymentId = self->_trialDeploymentId, trialDeploymentId == [v4 trialDeploymentId]))
    {
      BOOL v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];

  if (v4)
  {
    NSUInteger v5 = [(DODMLSchemaDODMLClientEventMetadata *)self dodMlId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(DODMLSchemaDODMLClientEventMetadata *)self experimentName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(DODMLSchemaDODMLClientEventMetadata *)self trialExperimentId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];

  if (v8)
  {
    v9 = [(DODMLSchemaDODMLClientEventMetadata *)self trialTreatmentId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLSchemaDODMLClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialDeploymentId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTrialDeploymentId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrialDeploymentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTrialDeploymentId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t trialDeploymentId = a3;
}

- (void)deleteTrialTreatmentId
{
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteTrialExperimentId
{
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (void)deleteExperimentName
{
}

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)deleteDodMlId
{
}

- (BOOL)hasDodMlId
{
  return self->_dodMlId != 0;
}

@end