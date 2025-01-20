@interface PNRODSchemaPNRODIntelligenceFlowActionGrainSummary
- (BOOL)hasActionId;
- (BOOL)hasBundleId;
- (BOOL)hasClientRequestId;
- (BOOL)hasExecutionTime;
- (BOOL)hasFailureInfo;
- (BOOL)hasPlanId;
- (BOOL)hasRawQueryEventId;
- (BOOL)hasStatus;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)toolId;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)executionTime;
- (SISchemaUUID)actionId;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)planId;
- (SISchemaUUID)rawQueryEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)status;
- (unint64_t)hash;
- (void)deleteActionId;
- (void)deleteBundleId;
- (void)deleteClientRequestId;
- (void)deleteExecutionTime;
- (void)deleteFailureInfo;
- (void)deletePlanId;
- (void)deleteRawQueryEventId;
- (void)deleteStatus;
- (void)deleteToolId;
- (void)setActionId:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setClientRequestId:(id)a3;
- (void)setExecutionTime:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasActionId:(BOOL)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasExecutionTime:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasPlanId:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setPlanId:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowActionGrainSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowActionGrainSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4])
  {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteToolId];
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteBundleId];
  }
  v6 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteActionId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deletePlanId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteClientRequestId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteRawQueryEventId];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteExecutionTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasToolId = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasRawQueryEventId:(BOOL)a3
{
  self->_hasActionId = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPlanId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasActionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFailureInfo:(id)a3
{
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setExecutionTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)executionTime
{
  return self->_executionTime;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setToolId:(id)a3
{
}

- (NSString)toolId
{
  return self->_toolId;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setRawQueryEventId:(id)a3
{
}

- (SISchemaUUID)rawQueryEventId
{
  return self->_rawQueryEventId;
}

- (void)setClientRequestId:(id)a3
{
}

- (SISchemaUUID)clientRequestId
{
  return self->_clientRequestId;
}

- (void)setPlanId:(id)a3
{
}

- (SISchemaUUID)planId
{
  return self->_planId;
}

- (void)setActionId:(id)a3
{
}

- (SISchemaUUID)actionId
{
  return self->_actionId;
}

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowActionGrainSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"actionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setActionId:v7];
    }
    v26 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setPlanId:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"clientRequestId", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setClientRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setRawQueryEventId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary setStatus:](v5, "setStatus:", [v14 longLongValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setToolId:v16];
    }
    int v17 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setBundleId:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"executionTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v20 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v19];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setExecutionTime:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v21];
      [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)v5 setFailureInfo:v22];
    }
    int v23 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self dictionaryRepresentation];
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
  if (self->_actionId)
  {
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionId"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionId"];
    }
  }
  if (self->_bundleId)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self bundleId];
    uint64_t v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"bundleId"];
  }
  if (self->_clientRequestId)
  {
    v9 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"clientRequestId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"clientRequestId"];
    }
  }
  if (self->_executionTime)
  {
    v12 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"executionTime"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"executionTime"];
    }
  }
  if (self->_failureInfo)
  {
    v15 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_planId)
  {
    v18 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"planId"];
    }
    else
    {
      int v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"planId"];
    }
  }
  if (self->_rawQueryEventId)
  {
    v21 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"rawQueryEventId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v24 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary status](self, "status"));
    [v3 setObject:v24 forKeyedSubscript:@"status"];
  }
  if (self->_toolId)
  {
    objc_super v25 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self toolId];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"toolId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_actionId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_planId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_clientRequestId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_rawQueryEventId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_status;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_toolId hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_bundleId hash];
  unint64_t v11 = [(PNRODSchemaPNRODMetricDuration *)self->_executionTime hash];
  return v10 ^ v11 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
  unint64_t v6 = [v4 actionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    NSUInteger v9 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
    NSUInteger v10 = [v4 actionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
  unint64_t v6 = [v4 planId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
    v15 = [v4 planId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
  unint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
    int v20 = [v4 clientRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
  unint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
    objc_super v25 = [v4 rawQueryEventId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[80] & 1)) {
    goto LABEL_45;
  }
  if (*(unsigned char *)&self->_has)
  {
    int64_t status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_45;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self toolId];
  unint64_t v6 = [v4 toolId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v28 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self toolId];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self toolId];
    v31 = [v4 toolId];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self bundleId];
  unint64_t v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v33 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self bundleId];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self bundleId];
    v36 = [v4 bundleId];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
  unint64_t v6 = [v4 executionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v38 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
    v41 = [v4 executionTime];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
  unint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v43 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
    if (!v43)
    {

LABEL_48:
      BOOL v48 = 1;
      goto LABEL_46;
    }
    v44 = (void *)v43;
    v45 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
    v46 = [v4 failureInfo];
    char v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_48;
    }
  }
  else
  {
LABEL_44:
  }
LABEL_45:
  BOOL v48 = 0;
LABEL_46:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  unint64_t v4 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self actionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self planId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];

  if (v8)
  {
    NSUInteger v9 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v10 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];

  if (v10)
  {
    int v11 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self toolId];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  v13 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self bundleId];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  int v14 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];

  if (v14)
  {
    v15 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self executionTime];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];

  uint64_t v17 = v19;
  if (v16)
  {
    v18 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    uint64_t v17 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowActionGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteExecutionTime
{
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t status = a3;
}

- (void)deleteRawQueryEventId
{
}

- (BOOL)hasRawQueryEventId
{
  return self->_rawQueryEventId != 0;
}

- (void)deleteClientRequestId
{
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

- (void)deletePlanId
{
}

- (BOOL)hasPlanId
{
  return self->_planId != 0;
}

- (void)deleteActionId
{
}

- (BOOL)hasActionId
{
  return self->_actionId != 0;
}

@end