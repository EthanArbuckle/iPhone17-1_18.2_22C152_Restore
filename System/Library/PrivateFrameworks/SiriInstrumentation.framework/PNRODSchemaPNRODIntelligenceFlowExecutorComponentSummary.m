@interface PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary
- (BOOL)hasActionId;
- (BOOL)hasAppState;
- (BOOL)hasClientRequestId;
- (BOOL)hasExecutionTime;
- (BOOL)hasExecutorId;
- (BOOL)hasFailureInfo;
- (BOOL)hasIsAppForeground;
- (BOOL)hasPlanId;
- (BOOL)hasPqaMetrics;
- (BOOL)hasRawQueryEventId;
- (BOOL)isAppForeground;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)executionTime;
- (PNRODSchemaPNRODPQAMetrics)pqaMetrics;
- (SISchemaUUID)actionId;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)executorId;
- (SISchemaUUID)planId;
- (SISchemaUUID)rawQueryEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)appState;
- (unint64_t)hash;
- (void)deleteActionId;
- (void)deleteAppState;
- (void)deleteClientRequestId;
- (void)deleteExecutionTime;
- (void)deleteExecutorId;
- (void)deleteFailureInfo;
- (void)deleteIsAppForeground;
- (void)deletePlanId;
- (void)deletePqaMetrics;
- (void)deleteRawQueryEventId;
- (void)setActionId:(id)a3;
- (void)setAppState:(int64_t)a3;
- (void)setClientRequestId:(id)a3;
- (void)setExecutionTime:(id)a3;
- (void)setExecutorId:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasActionId:(BOOL)a3;
- (void)setHasAppState:(BOOL)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasExecutionTime:(BOOL)a3;
- (void)setHasExecutorId:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasIsAppForeground:(BOOL)a3;
- (void)setHasPlanId:(BOOL)a3;
- (void)setHasPqaMetrics:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setIsAppForeground:(BOOL)a3;
- (void)setPlanId:(id)a3;
- (void)setPqaMetrics:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteActionId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deletePlanId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteClientRequestId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteRawQueryEventId];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteExecutorId];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteExecutionTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deletePqaMetrics];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_pqaMetrics, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_executorId, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasExecutorId = a3;
}

- (void)setHasPqaMetrics:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasExecutorId:(BOOL)a3
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

- (void)setPqaMetrics:(id)a3
{
}

- (PNRODSchemaPNRODPQAMetrics)pqaMetrics
{
  return self->_pqaMetrics;
}

- (void)setExecutionTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)executionTime
{
  return self->_executionTime;
}

- (int64_t)appState
{
  return self->_appState;
}

- (BOOL)isAppForeground
{
  return self->_isAppForeground;
}

- (void)setExecutorId:(id)a3
{
}

- (SISchemaUUID)executorId
{
  return self->_executorId;
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

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"actionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setActionId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setPlanId:v9];
    }
    v28 = (void *)v6;
    uint64_t v10 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setClientRequestId:v11];
    }
    int v26 = (void *)v10;
    v27 = (void *)v8;
    v12 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setRawQueryEventId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"executorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setExecutorId:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"isAppForeground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setIsAppForeground:](v5, "setIsAppForeground:", [v16 BOOLValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"appState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary setAppState:](v5, "setAppState:", [v17 longLongValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"executionTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setExecutionTime:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"pqaMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PNRODSchemaPNRODPQAMetrics alloc] initWithDictionary:v20];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setPqaMetrics:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v22];
      [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)v5 setFailureInfo:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self dictionaryRepresentation];
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
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary appState](self, "appState"));
    [v3 setObject:v7 forKeyedSubscript:@"appState"];
  }
  if (self->_clientRequestId)
  {
    uint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"clientRequestId"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"clientRequestId"];
    }
  }
  if (self->_executionTime)
  {
    int v11 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"executionTime"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"executionTime"];
    }
  }
  if (self->_executorId)
  {
    int v14 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"executorId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"executorId"];
    }
  }
  if (self->_failureInfo)
  {
    int v17 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary isAppForeground](self, "isAppForeground"));
    [v3 setObject:v20 forKeyedSubscript:@"isAppForeground"];
  }
  if (self->_planId)
  {
    v21 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"planId"];
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"planId"];
    }
  }
  if (self->_pqaMetrics)
  {
    v24 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"pqaMetrics"];
    }
    else
    {
      int v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"pqaMetrics"];
    }
  }
  if (self->_rawQueryEventId)
  {
    v27 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      objc_super v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"rawQueryEventId"];
    }
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
  unint64_t v7 = [(SISchemaUUID *)self->_executorId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_isAppForeground;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_appState;
LABEL_6:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v11 = [(PNRODSchemaPNRODMetricDuration *)self->_executionTime hash];
  unint64_t v12 = v11 ^ [(PNRODSchemaPNRODPQAMetrics *)self->_pqaMetrics hash];
  return v10 ^ v12 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
  unint64_t v6 = [v4 actionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
    unint64_t v10 = [v4 actionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
  unint64_t v6 = [v4 planId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
    v15 = [v4 planId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
  unint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
    int v20 = [v4 clientRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
  unint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
    v25 = [v4 rawQueryEventId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
  unint64_t v6 = [v4 executorId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v27 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
  if (v27)
  {
    v28 = (void *)v27;
    objc_super v29 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
    v30 = [v4 executorId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  $A41C79A17919520033C13DBDEFD0BD61 has = self->_has;
  unsigned int v33 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v33 & 1)) {
    goto LABEL_49;
  }
  if (*(unsigned char *)&has)
  {
    int isAppForeground = self->_isAppForeground;
    if (isAppForeground != [v4 isAppForeground]) {
      goto LABEL_49;
    }
    $A41C79A17919520033C13DBDEFD0BD61 has = self->_has;
    unsigned int v33 = v4[88];
  }
  int v35 = (*(unsigned int *)&has >> 1) & 1;
  if (v35 != ((v33 >> 1) & 1)) {
    goto LABEL_49;
  }
  if (v35)
  {
    int64_t appState = self->_appState;
    if (appState != [v4 appState]) {
      goto LABEL_49;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
  unint64_t v6 = [v4 executionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v37 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
    v40 = [v4 executionTime];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
  unint64_t v6 = [v4 pqaMetrics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_48;
  }
  uint64_t v42 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
    v45 = [v4 pqaMetrics];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
  unint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_48:

    goto LABEL_49;
  }
  uint64_t v47 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
  if (!v47)
  {

LABEL_52:
    BOOL v52 = 1;
    goto LABEL_50;
  }
  v48 = (void *)v47;
  v49 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
  v50 = [v4 failureInfo];
  char v51 = [v49 isEqual:v50];

  if (v51) {
    goto LABEL_52;
  }
LABEL_49:
  BOOL v52 = 0;
LABEL_50:

  return v52;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  unint64_t v4 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self actionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self planId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];

  if (v8)
  {
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];

  if (v10)
  {
    int v11 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];

  if (v12)
  {
    v13 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executorId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];

  if (v15)
  {
    int v16 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self executionTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];

  if (v17)
  {
    v18 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self pqaMetrics];
    PBDataWriterWriteSubmessage();
  }
  v19 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];

  int v20 = v22;
  if (v19)
  {
    int v21 = [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    int v20 = v22;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deletePqaMetrics
{
}

- (BOOL)hasPqaMetrics
{
  return self->_pqaMetrics != 0;
}

- (void)deleteExecutionTime
{
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteAppState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t appState = a3;
}

- (void)deleteIsAppForeground
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAppForeground:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAppForeground
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAppForeground:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAppForeground = a3;
}

- (void)deleteExecutorId
{
}

- (BOOL)hasExecutorId
{
  return self->_executorId != 0;
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