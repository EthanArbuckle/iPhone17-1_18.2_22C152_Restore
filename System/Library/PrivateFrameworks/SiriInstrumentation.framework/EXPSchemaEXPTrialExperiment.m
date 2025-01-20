@interface EXPSchemaEXPTrialExperiment
- (BOOL)hasAllocationStatus;
- (BOOL)hasCompatibilityVersion;
- (BOOL)hasDeploymentId;
- (BOOL)hasExperimentId;
- (BOOL)hasExperimentNamespace;
- (BOOL)hasLastUpdatedAtInMs;
- (BOOL)hasTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSchemaEXPTrialExperiment)initWithDictionary:(id)a3;
- (EXPSchemaEXPTrialExperiment)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)experimentId;
- (NSString)experimentNamespace;
- (SISchemaUUID)treatmentId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)allocationStatus;
- (int64_t)deploymentId;
- (unint64_t)hash;
- (unint64_t)lastUpdatedAtInMs;
- (unsigned)compatibilityVersion;
- (void)deleteAllocationStatus;
- (void)deleteCompatibilityVersion;
- (void)deleteDeploymentId;
- (void)deleteExperimentId;
- (void)deleteExperimentNamespace;
- (void)deleteLastUpdatedAtInMs;
- (void)deleteTreatmentId;
- (void)setAllocationStatus:(int)a3;
- (void)setCompatibilityVersion:(unsigned int)a3;
- (void)setDeploymentId:(int64_t)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentNamespace:(id)a3;
- (void)setHasAllocationStatus:(BOOL)a3;
- (void)setHasCompatibilityVersion:(BOOL)a3;
- (void)setHasDeploymentId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasExperimentNamespace:(BOOL)a3;
- (void)setHasLastUpdatedAtInMs:(BOOL)a3;
- (void)setHasTreatmentId:(BOOL)a3;
- (void)setLastUpdatedAtInMs:(unint64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSchemaEXPTrialExperiment

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EXPSchemaEXPTrialExperiment;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(EXPSchemaEXPTrialExperiment *)self deleteTreatmentId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  [(SISensitiveConditionsSet *)v2 addCondition:2];
  [(SISensitiveConditionsSet *)v2 addCondition:4];
  [(SISensitiveConditionsSet *)v2 addCondition:5];
  [(SISensitiveConditionsSet *)v2 addCondition:6];
  [(SISensitiveConditionsSet *)v2 addCondition:7];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespace, 0);
}

- (void)setHasTreatmentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExperimentNamespace:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (unint64_t)lastUpdatedAtInMs
{
  return self->_lastUpdatedAtInMs;
}

- (int)allocationStatus
{
  return self->_allocationStatus;
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

- (void)setExperimentNamespace:(id)a3
{
}

- (NSString)experimentNamespace
{
  return self->_experimentNamespace;
}

- (EXPSchemaEXPTrialExperiment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EXPSchemaEXPTrialExperiment;
  v5 = [(EXPSchemaEXPTrialExperiment *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentNamespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(EXPSchemaEXPTrialExperiment *)v5 setExperimentNamespace:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(EXPSchemaEXPTrialExperiment *)v5 setExperimentId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"treatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(EXPSchemaEXPTrialExperiment *)v5 setTreatmentId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"deploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialExperiment setDeploymentId:](v5, "setDeploymentId:", [v12 longLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"allocationStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialExperiment setAllocationStatus:](v5, "setAllocationStatus:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"lastUpdatedAtInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialExperiment setLastUpdatedAtInMs:](v5, "setLastUpdatedAtInMs:", [v14 unsignedLongLongValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"compatibilityVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[EXPSchemaEXPTrialExperiment setCompatibilityVersion:](v5, "setCompatibilityVersion:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (EXPSchemaEXPTrialExperiment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSchemaEXPTrialExperiment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSchemaEXPTrialExperiment *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(EXPSchemaEXPTrialExperiment *)self allocationStatus] - 1;
    if (v5 > 2) {
      v6 = @"EXPTREATMENTALLOCATIONSTATUS_UNKNOWN";
    }
    else {
      v6 = off_1E5EAE630[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"allocationStatus"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[EXPSchemaEXPTrialExperiment compatibilityVersion](self, "compatibilityVersion"));
    [v3 setObject:v7 forKeyedSubscript:@"compatibilityVersion"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[EXPSchemaEXPTrialExperiment deploymentId](self, "deploymentId"));
    [v3 setObject:v8 forKeyedSubscript:@"deploymentId"];
  }
  if (self->_experimentId)
  {
    objc_super v9 = [(EXPSchemaEXPTrialExperiment *)self experimentId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"experimentId"];
  }
  if (self->_experimentNamespace)
  {
    v11 = [(EXPSchemaEXPTrialExperiment *)self experimentNamespace];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"experimentNamespace"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[EXPSchemaEXPTrialExperiment lastUpdatedAtInMs](self, "lastUpdatedAtInMs"));
    [v3 setObject:v13 forKeyedSubscript:@"lastUpdatedAtInMs"];
  }
  if (self->_treatmentId)
  {
    v14 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"treatmentId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"treatmentId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentNamespace hash];
  NSUInteger v4 = [(NSString *)self->_experimentId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_treatmentId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_deploymentId;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_allocationStatus;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v8 = 2654435761u * self->_lastUpdatedAtInMs;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_compatibilityVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(EXPSchemaEXPTrialExperiment *)self experimentNamespace];
  uint64_t v6 = [v4 experimentNamespace];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(EXPSchemaEXPTrialExperiment *)self experimentNamespace];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(EXPSchemaEXPTrialExperiment *)self experimentNamespace];
    v10 = [v4 experimentNamespace];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSchemaEXPTrialExperiment *)self experimentId];
  uint64_t v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(EXPSchemaEXPTrialExperiment *)self experimentId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(EXPSchemaEXPTrialExperiment *)self experimentId];
    v15 = [v4 experimentId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
  uint64_t v6 = [v4 treatmentId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
    v20 = [v4 treatmentId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  $4AC247BD89C7D8007CA6E214AE01963F has = self->_has;
  unsigned int v25 = v4[60];
  if ((*(unsigned char *)&has & 1) == (v25 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int64_t deploymentId = self->_deploymentId;
      if (deploymentId != [v4 deploymentId]) {
        goto LABEL_17;
      }
      $4AC247BD89C7D8007CA6E214AE01963F has = self->_has;
      unsigned int v25 = v4[60];
    }
    int v27 = (*(unsigned int *)&has >> 1) & 1;
    if (v27 == ((v25 >> 1) & 1))
    {
      if (v27)
      {
        int allocationStatus = self->_allocationStatus;
        if (allocationStatus != [v4 allocationStatus]) {
          goto LABEL_17;
        }
        $4AC247BD89C7D8007CA6E214AE01963F has = self->_has;
        unsigned int v25 = v4[60];
      }
      int v29 = (*(unsigned int *)&has >> 2) & 1;
      if (v29 == ((v25 >> 2) & 1))
      {
        if (v29)
        {
          unint64_t lastUpdatedAtInMs = self->_lastUpdatedAtInMs;
          if (lastUpdatedAtInMs != [v4 lastUpdatedAtInMs]) {
            goto LABEL_17;
          }
          $4AC247BD89C7D8007CA6E214AE01963F has = self->_has;
          unsigned int v25 = v4[60];
        }
        int v31 = (*(unsigned int *)&has >> 3) & 1;
        if (v31 == ((v25 >> 3) & 1))
        {
          if (!v31
            || (unsigned int compatibilityVersion = self->_compatibilityVersion,
                compatibilityVersion == [v4 compatibilityVersion]))
          {
            BOOL v22 = 1;
            goto LABEL_18;
          }
        }
      }
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(EXPSchemaEXPTrialExperiment *)self experimentNamespace];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(EXPSchemaEXPTrialExperiment *)self experimentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];

  if (v6)
  {
    uint64_t v7 = [(EXPSchemaEXPTrialExperiment *)self treatmentId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  uint64_t v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v9 = v10;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  uint64_t v9 = v10;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    uint64_t v9 = v10;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return EXPSchemaEXPTrialExperimentReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompatibilityVersion
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCompatibilityVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompatibilityVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCompatibilityVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int compatibilityVersion = a3;
}

- (void)deleteLastUpdatedAtInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLastUpdatedAtInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastUpdatedAtInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLastUpdatedAtInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t lastUpdatedAtInMs = a3;
}

- (void)deleteAllocationStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAllocationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllocationStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAllocationStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int allocationStatus = a3;
}

- (void)deleteDeploymentId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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

- (void)deleteExperimentNamespace
{
}

- (BOOL)hasExperimentNamespace
{
  return self->_experimentNamespace != 0;
}

@end