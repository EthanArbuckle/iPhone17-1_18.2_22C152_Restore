@interface PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary
- (BOOL)hasClientRequestId;
- (BOOL)hasClientSessionId;
- (BOOL)hasExecutionTime;
- (BOOL)hasFailureInfo;
- (BOOL)hasNumActionsCreated;
- (BOOL)hasNumPlansCreated;
- (BOOL)hasNumPlansCreatedForResponse;
- (BOOL)hasNumQueriesCreated;
- (BOOL)hasNumResponseGenerationRequests;
- (BOOL)hasNumStatementsEvaluated;
- (BOOL)hasNumStatementsEvaluatedFromPlanner;
- (BOOL)hasNumSystemPromptsResolved;
- (BOOL)hasNumSystemResponsesGenerated;
- (BOOL)hasPlanningTime;
- (BOOL)hasQueryTime;
- (BOOL)hasRawQueryEventId;
- (BOOL)hasRawSessionId;
- (BOOL)hasRequestResponseTime;
- (BOOL)hasResponsePreparationTime;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)bundleIds;
- (NSArray)toolIds;
- (NSData)jsonData;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)executionTime;
- (PNRODSchemaPNRODMetricDuration)planningTime;
- (PNRODSchemaPNRODMetricDuration)queryTime;
- (PNRODSchemaPNRODMetricDuration)requestResponseTime;
- (PNRODSchemaPNRODMetricDuration)responsePreparationTime;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)clientSessionId;
- (SISchemaUUID)rawQueryEventId;
- (SISchemaUUID)rawSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)bundleIdAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)toolIdAtIndex:(unint64_t)a3;
- (int64_t)status;
- (unint64_t)bundleIdCount;
- (unint64_t)hash;
- (unint64_t)toolIdCount;
- (unsigned)numActionsCreated;
- (unsigned)numPlansCreated;
- (unsigned)numPlansCreatedForResponse;
- (unsigned)numQueriesCreated;
- (unsigned)numResponseGenerationRequests;
- (unsigned)numStatementsEvaluated;
- (unsigned)numStatementsEvaluatedFromPlanner;
- (unsigned)numSystemPromptsResolved;
- (unsigned)numSystemResponsesGenerated;
- (void)addBundleId:(id)a3;
- (void)addToolId:(id)a3;
- (void)clearBundleId;
- (void)clearToolId;
- (void)deleteClientRequestId;
- (void)deleteClientSessionId;
- (void)deleteExecutionTime;
- (void)deleteFailureInfo;
- (void)deleteNumActionsCreated;
- (void)deleteNumPlansCreated;
- (void)deleteNumPlansCreatedForResponse;
- (void)deleteNumQueriesCreated;
- (void)deleteNumResponseGenerationRequests;
- (void)deleteNumStatementsEvaluated;
- (void)deleteNumStatementsEvaluatedFromPlanner;
- (void)deleteNumSystemPromptsResolved;
- (void)deleteNumSystemResponsesGenerated;
- (void)deletePlanningTime;
- (void)deleteQueryTime;
- (void)deleteRawQueryEventId;
- (void)deleteRawSessionId;
- (void)deleteRequestResponseTime;
- (void)deleteResponsePreparationTime;
- (void)deleteStatus;
- (void)setBundleIds:(id)a3;
- (void)setClientRequestId:(id)a3;
- (void)setClientSessionId:(id)a3;
- (void)setExecutionTime:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasClientSessionId:(BOOL)a3;
- (void)setHasExecutionTime:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasNumActionsCreated:(BOOL)a3;
- (void)setHasNumPlansCreated:(BOOL)a3;
- (void)setHasNumPlansCreatedForResponse:(BOOL)a3;
- (void)setHasNumQueriesCreated:(BOOL)a3;
- (void)setHasNumResponseGenerationRequests:(BOOL)a3;
- (void)setHasNumStatementsEvaluated:(BOOL)a3;
- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3;
- (void)setHasNumSystemPromptsResolved:(BOOL)a3;
- (void)setHasNumSystemResponsesGenerated:(BOOL)a3;
- (void)setHasPlanningTime:(BOOL)a3;
- (void)setHasQueryTime:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setHasRawSessionId:(BOOL)a3;
- (void)setHasRequestResponseTime:(BOOL)a3;
- (void)setHasResponsePreparationTime:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setNumActionsCreated:(unsigned int)a3;
- (void)setNumPlansCreated:(unsigned int)a3;
- (void)setNumPlansCreatedForResponse:(unsigned int)a3;
- (void)setNumQueriesCreated:(unsigned int)a3;
- (void)setNumResponseGenerationRequests:(unsigned int)a3;
- (void)setNumStatementsEvaluated:(unsigned int)a3;
- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3;
- (void)setNumSystemPromptsResolved:(unsigned int)a3;
- (void)setNumSystemResponsesGenerated:(unsigned int)a3;
- (void)setPlanningTime:(id)a3;
- (void)setQueryTime:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)setRawSessionId:(id)a3;
- (void)setRequestResponseTime:(id)a3;
- (void)setResponsePreparationTime:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setToolIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4])
  {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteToolId];
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteBundleId];
  }
  v6 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteClientRequestId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteClientSessionId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteRawSessionId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteRawQueryEventId];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteRequestResponseTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deletePlanningTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteQueryTime];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteExecutionTime];
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteResponsePreparationTime];
  }
  v33 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_queryTime, 0);
  objc_storeStrong((id *)&self->_planningTime, 0);
  objc_storeStrong((id *)&self->_requestResponseTime, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_toolIds, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasExecutionTime = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasQueryTime = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  self->_hasPlanningTime = a3;
}

- (void)setHasQueryTime:(BOOL)a3
{
  self->_hasRequestResponseTime = a3;
}

- (void)setHasPlanningTime:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasRequestResponseTime:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void)setHasRawQueryEventId:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasClientSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setFailureInfo:(id)a3
{
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setResponsePreparationTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (void)setExecutionTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)executionTime
{
  return self->_executionTime;
}

- (void)setQueryTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryTime
{
  return self->_queryTime;
}

- (void)setPlanningTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planningTime
{
  return self->_planningTime;
}

- (void)setRequestResponseTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)requestResponseTime
{
  return self->_requestResponseTime;
}

- (unsigned)numSystemPromptsResolved
{
  return self->_numSystemPromptsResolved;
}

- (unsigned)numSystemResponsesGenerated
{
  return self->_numSystemResponsesGenerated;
}

- (unsigned)numResponseGenerationRequests
{
  return self->_numResponseGenerationRequests;
}

- (unsigned)numStatementsEvaluatedFromPlanner
{
  return self->_numStatementsEvaluatedFromPlanner;
}

- (unsigned)numStatementsEvaluated
{
  return self->_numStatementsEvaluated;
}

- (unsigned)numActionsCreated
{
  return self->_numActionsCreated;
}

- (unsigned)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (unsigned)numPlansCreatedForResponse
{
  return self->_numPlansCreatedForResponse;
}

- (unsigned)numPlansCreated
{
  return self->_numPlansCreated;
}

- (void)setBundleIds:(id)a3
{
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setToolIds:(id)a3
{
}

- (NSArray)toolIds
{
  return self->_toolIds;
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

- (void)setRawSessionId:(id)a3
{
}

- (SISchemaUUID)rawSessionId
{
  return self->_rawSessionId;
}

- (void)setClientSessionId:(id)a3
{
}

- (SISchemaUUID)clientSessionId
{
  return self->_clientSessionId;
}

- (void)setClientRequestId:(id)a3
{
}

- (SISchemaUUID)clientRequestId
{
  return self->_clientRequestId;
}

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithDictionary:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)&v77 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setClientRequestId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"clientSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setClientSessionId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"rawSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setRawSessionId:v11];
    }
    v64 = (void *)v8;
    v65 = (void *)v6;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setRawQueryEventId:v13];
    }
    v62 = (void *)v12;
    v63 = (void *)v10;
    int v14 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setStatus:](v5, "setStatus:", [v14 longLongValue]);
    }
    v61 = v14;
    v15 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    v68 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v74 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = (void *)[v21 copy];
              [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 addToolId:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v73 objects:v79 count:16];
        }
        while (v18);
      }
    }
    int v23 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    v67 = v23;
    if (objc_opt_isKindOfClass())
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v69 objects:v78 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v70;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v70 != v27) {
              objc_enumerationMutation(v24);
            }
            int v29 = *(void **)(*((void *)&v69 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = (void *)[v29 copy];
              [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 addBundleId:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v69 objects:v78 count:16];
        }
        while (v26);
      }
    }
    v31 = [v4 objectForKeyedSubscript:@"numPlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreated:](v5, "setNumPlansCreated:", [v31 unsignedIntValue]);
    }
    int v32 = [v4 objectForKeyedSubscript:@"numPlansCreatedForResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumPlansCreatedForResponse:](v5, "setNumPlansCreatedForResponse:", [v32 unsignedIntValue]);
    }
    v33 = [v4 objectForKeyedSubscript:@"numQueriesCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumQueriesCreated:](v5, "setNumQueriesCreated:", [v33 unsignedIntValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"numActionsCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumActionsCreated:](v5, "setNumActionsCreated:", [v34 unsignedIntValue]);
    }
    v57 = v34;
    int v35 = [v4 objectForKeyedSubscript:@"numStatementsEvaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluated:](v5, "setNumStatementsEvaluated:", [v35 unsignedIntValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"numStatementsEvaluatedFromPlanner"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumStatementsEvaluatedFromPlanner:](v5, "setNumStatementsEvaluatedFromPlanner:", [v36 unsignedIntValue]);
    }
    objc_super v37 = [v4 objectForKeyedSubscript:@"numResponseGenerationRequests"];
    objc_opt_class();
    v66 = v37;
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumResponseGenerationRequests:](v5, "setNumResponseGenerationRequests:", [v37 unsignedIntValue]);
    }
    v55 = v36;
    v38 = [v4 objectForKeyedSubscript:@"numSystemResponsesGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemResponsesGenerated:](v5, "setNumSystemResponsesGenerated:", [v38 unsignedIntValue]);
    }
    v56 = v35;
    v59 = v32;
    v60 = v31;
    v39 = [v4 objectForKeyedSubscript:@"numSystemPromptsResolved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary setNumSystemPromptsResolved:](v5, "setNumSystemPromptsResolved:", [v39 unsignedIntValue]);
    }
    v58 = v33;
    v40 = [v4 objectForKeyedSubscript:@"requestResponseTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v40];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setRequestResponseTime:v41];
    }
    v54 = v38;
    v42 = [v4 objectForKeyedSubscript:@"planningTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v42];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setPlanningTime:v43];
    }
    v44 = [v4 objectForKeyedSubscript:@"queryTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v44];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setQueryTime:v45];
    }
    v46 = [v4 objectForKeyedSubscript:@"executionTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v46];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setExecutionTime:v47];
    }
    v48 = [v4 objectForKeyedSubscript:@"responsePreparationTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v48];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setResponsePreparationTime:v49];
    }
    v50 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v50];
      [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)v5 setFailureInfo:v51];
    }
    v52 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self dictionaryRepresentation];
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
  if (self->_bundleIds)
  {
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self bundleIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_clientRequestId)
  {
    uint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"clientRequestId"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"clientRequestId"];
    }
  }
  if (self->_clientSessionId)
  {
    v9 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"clientSessionId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"clientSessionId"];
    }
  }
  if (self->_executionTime)
  {
    uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
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
    v15 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
    id v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"failureInfo"];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numActionsCreated](self, "numActionsCreated"));
    [v3 setObject:v22 forKeyedSubscript:@"numActionsCreated"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_25:
      if ((has & 4) == 0) {
        goto LABEL_26;
      }
      goto LABEL_38;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_25;
  }
  int v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numPlansCreated](self, "numPlansCreated"));
  [v3 setObject:v23 forKeyedSubscript:@"numPlansCreated"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_26:
    if ((has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numPlansCreatedForResponse](self, "numPlansCreatedForResponse"));
  [v3 setObject:v24 forKeyedSubscript:@"numPlansCreatedForResponse"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numQueriesCreated](self, "numQueriesCreated"));
  [v3 setObject:v25 forKeyedSubscript:@"numQueriesCreated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_28:
    if ((has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numResponseGenerationRequests](self, "numResponseGenerationRequests"));
  [v3 setObject:v26 forKeyedSubscript:@"numResponseGenerationRequests"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_29:
    if ((has & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numStatementsEvaluated](self, "numStatementsEvaluated"));
  [v3 setObject:v27 forKeyedSubscript:@"numStatementsEvaluated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
LABEL_42:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numStatementsEvaluatedFromPlanner](self, "numStatementsEvaluatedFromPlanner"));
  [v3 setObject:v28 forKeyedSubscript:@"numStatementsEvaluatedFromPlanner"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_43:
  int v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numSystemPromptsResolved](self, "numSystemPromptsResolved"));
  [v3 setObject:v29 forKeyedSubscript:@"numSystemPromptsResolved"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_32:
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary numSystemResponsesGenerated](self, "numSystemResponsesGenerated"));
    [v3 setObject:v19 forKeyedSubscript:@"numSystemResponsesGenerated"];
  }
LABEL_33:
  if (self->_planningTime)
  {
    int v20 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"planningTime"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"planningTime"];
    }
  }
  if (self->_queryTime)
  {
    v31 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"queryTime"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"queryTime"];
    }
  }
  if (self->_rawQueryEventId)
  {
    v34 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"rawQueryEventId"];
    }
  }
  if (self->_rawSessionId)
  {
    objc_super v37 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
    v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"rawSessionId"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"rawSessionId"];
    }
  }
  if (self->_requestResponseTime)
  {
    v40 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
    v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"requestResponseTime"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"requestResponseTime"];
    }
  }
  if (self->_responsePreparationTime)
  {
    v43 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
    v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"responsePreparationTime"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"responsePreparationTime"];
    }
  }
  if (*(_WORD *)&self->_has)
  {
    v46 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary status](self, "status"));
    [v3 setObject:v46 forKeyedSubscript:@"status"];
  }
  if (self->_toolIds)
  {
    v47 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self toolIds];
    v48 = (void *)[v47 copy];
    [v3 setObject:v48 forKeyedSubscript:@"toolId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clientRequestId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_clientSessionId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_rawSessionId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_rawQueryEventId hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_status;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSArray *)self->_toolIds hash];
  uint64_t v9 = [(NSArray *)self->_bundleIds hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_numPlansCreated;
    if ((has & 4) != 0)
    {
LABEL_6:
      uint64_t v12 = 2654435761 * self->_numPlansCreatedForResponse;
      if ((has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v12 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v13 = 2654435761 * self->_numQueriesCreated;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v13 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v14 = 2654435761 * self->_numActionsCreated;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v14 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v15 = 2654435761 * self->_numStatementsEvaluated;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v15 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v16 = 2654435761 * self->_numStatementsEvaluatedFromPlanner;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v16 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v17 = 2654435761 * self->_numResponseGenerationRequests;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_13;
    }
LABEL_22:
    uint64_t v19 = 0;
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_12:
  uint64_t v18 = 2654435761 * self->_numSystemResponsesGenerated;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_13:
  uint64_t v19 = 2654435761 * self->_numSystemPromptsResolved;
LABEL_23:
  unint64_t v20 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v21 = v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(PNRODSchemaPNRODMetricDuration *)self->_requestResponseTime hash];
  unint64_t v22 = v21 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planningTime hash];
  unint64_t v23 = v20 ^ v22 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryTime hash];
  unint64_t v24 = [(PNRODSchemaPNRODMetricDuration *)self->_executionTime hash];
  unint64_t v25 = v24 ^ [(PNRODSchemaPNRODMetricDuration *)self->_responsePreparationTime hash];
  return v23 ^ v25 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_100;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
  unint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
    uint64_t v10 = [v4 clientRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
  unint64_t v6 = [v4 clientSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
    uint64_t v15 = [v4 clientSessionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
  unint64_t v6 = [v4 rawSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
    unint64_t v20 = [v4 rawSessionId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
  unint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    unint64_t v24 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
    unint64_t v25 = [v4 rawQueryEventId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  if ((*(_WORD *)&self->_has & 1) != (v4[76] & 1)) {
    goto LABEL_100;
  }
  if (*(_WORD *)&self->_has)
  {
    int64_t status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_100;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self toolIds];
  unint64_t v6 = [v4 toolIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v28 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self toolIds];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self toolIds];
    v31 = [v4 toolIds];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self bundleIds];
  unint64_t v6 = [v4 bundleIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v33 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self bundleIds];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self bundleIds];
    v36 = [v4 bundleIds];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
  int v39 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v40 = (unsigned __int16)v4[76];
  if (v39 != ((v40 >> 1) & 1)) {
    goto LABEL_100;
  }
  if (v39)
  {
    unsigned int numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != [v4 numPlansCreated]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v42 = (*(unsigned int *)&has >> 2) & 1;
  if (v42 != ((v40 >> 2) & 1)) {
    goto LABEL_100;
  }
  if (v42)
  {
    unsigned int numPlansCreatedForResponse = self->_numPlansCreatedForResponse;
    if (numPlansCreatedForResponse != [v4 numPlansCreatedForResponse]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v44 = (*(unsigned int *)&has >> 3) & 1;
  if (v44 != ((v40 >> 3) & 1)) {
    goto LABEL_100;
  }
  if (v44)
  {
    unsigned int numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != [v4 numQueriesCreated]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v46 = (*(unsigned int *)&has >> 4) & 1;
  if (v46 != ((v40 >> 4) & 1)) {
    goto LABEL_100;
  }
  if (v46)
  {
    unsigned int numActionsCreated = self->_numActionsCreated;
    if (numActionsCreated != [v4 numActionsCreated]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v48 = (*(unsigned int *)&has >> 5) & 1;
  if (v48 != ((v40 >> 5) & 1)) {
    goto LABEL_100;
  }
  if (v48)
  {
    unsigned int numStatementsEvaluated = self->_numStatementsEvaluated;
    if (numStatementsEvaluated != [v4 numStatementsEvaluated]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v50 = (*(unsigned int *)&has >> 6) & 1;
  if (v50 != ((v40 >> 6) & 1)) {
    goto LABEL_100;
  }
  if (v50)
  {
    unsigned int numStatementsEvaluatedFromPlanner = self->_numStatementsEvaluatedFromPlanner;
    if (numStatementsEvaluatedFromPlanner != [v4 numStatementsEvaluatedFromPlanner]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v52 = (*(unsigned int *)&has >> 7) & 1;
  if (v52 != ((v40 >> 7) & 1)) {
    goto LABEL_100;
  }
  if (v52)
  {
    unsigned int numResponseGenerationRequests = self->_numResponseGenerationRequests;
    if (numResponseGenerationRequests != [v4 numResponseGenerationRequests]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v54 = (*(unsigned int *)&has >> 8) & 1;
  if (v54 != ((v40 >> 8) & 1)) {
    goto LABEL_100;
  }
  if (v54)
  {
    unsigned int numSystemResponsesGenerated = self->_numSystemResponsesGenerated;
    if (numSystemResponsesGenerated != [v4 numSystemResponsesGenerated]) {
      goto LABEL_100;
    }
    $C769C4E5C1433512966D06E91CCE9505 has = self->_has;
    unsigned int v40 = (unsigned __int16)v4[76];
  }
  int v56 = (*(unsigned int *)&has >> 9) & 1;
  if (v56 != ((v40 >> 9) & 1)) {
    goto LABEL_100;
  }
  if (v56)
  {
    unsigned int numSystemPromptsResolved = self->_numSystemPromptsResolved;
    if (numSystemPromptsResolved != [v4 numSystemPromptsResolved]) {
      goto LABEL_100;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
  unint64_t v6 = [v4 requestResponseTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v58 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
    v61 = [v4 requestResponseTime];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
  unint64_t v6 = [v4 planningTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v63 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
    v66 = [v4 planningTime];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
  unint64_t v6 = [v4 queryTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v68 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
  if (v68)
  {
    long long v69 = (void *)v68;
    long long v70 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
    long long v71 = [v4 queryTime];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
  unint64_t v6 = [v4 executionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v73 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
  if (v73)
  {
    long long v74 = (void *)v73;
    long long v75 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
    long long v76 = [v4 executionTime];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
  unint64_t v6 = [v4 responsePreparationTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_99;
  }
  uint64_t v78 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
  if (v78)
  {
    v79 = (void *)v78;
    uint64_t v80 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
    v81 = [v4 responsePreparationTime];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_100;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
  unint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_99:

    goto LABEL_100;
  }
  uint64_t v83 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
  if (!v83)
  {

LABEL_103:
    BOOL v88 = 1;
    goto LABEL_101;
  }
  v84 = (void *)v83;
  v85 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
  v86 = [v4 failureInfo];
  char v87 = [v85 isEqual:v86];

  if (v87) {
    goto LABEL_103;
  }
LABEL_100:
  BOOL v88 = 0;
LABEL_101:

  return v88;
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];

  if (v5)
  {
    unint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];

  if (v7)
  {
    uint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self clientSessionId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];

  if (v9)
  {
    uint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawSessionId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];

  if (v11)
  {
    uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = self->_toolIds;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v15);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v18 = self->_bundleIds;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v20);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_27:
      if ((has & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_50;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_28:
    if ((has & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_29:
    if ((has & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_30:
    if ((has & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_31:
    if ((has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_32:
    if ((has & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_33:
    if ((has & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_34:
  }
    PBDataWriterWriteUint32Field();
LABEL_35:
  unint64_t v24 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];

  if (v24)
  {
    unint64_t v25 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self requestResponseTime];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];

  if (v26)
  {
    uint64_t v27 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self planningTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];

  if (v28)
  {
    int v29 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self queryTime];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];

  if (v30)
  {
    v31 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self executionTime];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];

  if (v32)
  {
    uint64_t v33 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self responsePreparationTime];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];

  if (v34)
  {
    int v35 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowRequestGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteResponsePreparationTime
{
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteExecutionTime
{
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteQueryTime
{
}

- (BOOL)hasQueryTime
{
  return self->_queryTime != 0;
}

- (void)deletePlanningTime
{
}

- (BOOL)hasPlanningTime
{
  return self->_planningTime != 0;
}

- (void)deleteRequestResponseTime
{
}

- (BOOL)hasRequestResponseTime
{
  return self->_requestResponseTime != 0;
}

- (void)deleteNumSystemPromptsResolved
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasNumSystemPromptsResolved:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumSystemPromptsResolved
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumSystemPromptsResolved:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int numSystemPromptsResolved = a3;
}

- (void)deleteNumSystemResponsesGenerated
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumSystemResponsesGenerated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumSystemResponsesGenerated
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumSystemResponsesGenerated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numSystemResponsesGenerated = a3;
}

- (void)deleteNumResponseGenerationRequests
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumResponseGenerationRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumResponseGenerationRequests
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumResponseGenerationRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numResponseGenerationRequests = a3;
}

- (void)deleteNumStatementsEvaluatedFromPlanner
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumStatementsEvaluatedFromPlanner
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numStatementsEvaluatedFromPlanner = a3;
}

- (void)deleteNumStatementsEvaluated
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumStatementsEvaluated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumStatementsEvaluated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumStatementsEvaluated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numStatementsEvaluated = a3;
}

- (void)deleteNumActionsCreated
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumActionsCreated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumActionsCreated
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumActionsCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numActionsCreated = a3;
}

- (void)deleteNumQueriesCreated
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNumQueriesCreated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumQueriesCreated
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumQueriesCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numQueriesCreated = a3;
}

- (void)deleteNumPlansCreatedForResponse
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumPlansCreatedForResponse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumPlansCreatedForResponse
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumPlansCreatedForResponse:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numPlansCreatedForResponse = a3;
}

- (void)deleteNumPlansCreated
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumPlansCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numPlansCreated = a3;
}

- (id)bundleIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_bundleIds objectAtIndexedSubscript:a3];
}

- (unint64_t)bundleIdCount
{
  return [(NSArray *)self->_bundleIds count];
}

- (void)addBundleId:(id)a3
{
  id v4 = a3;
  bundleIds = self->_bundleIds;
  id v8 = v4;
  if (!bundleIds)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_bundleIds;
    self->_bundleIds = v6;

    id v4 = v8;
    bundleIds = self->_bundleIds;
  }
  [(NSArray *)bundleIds addObject:v4];
}

- (void)clearBundleId
{
}

- (id)toolIdAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_toolIds objectAtIndexedSubscript:a3];
}

- (unint64_t)toolIdCount
{
  return [(NSArray *)self->_toolIds count];
}

- (void)addToolId:(id)a3
{
  id v4 = a3;
  toolIds = self->_toolIds;
  id v8 = v4;
  if (!toolIds)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_toolIds;
    self->_toolIds = v6;

    id v4 = v8;
    toolIds = self->_toolIds;
  }
  [(NSArray *)toolIds addObject:v4];
}

- (void)clearToolId
{
}

- (void)deleteStatus
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStatus
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int64_t status = a3;
}

- (void)deleteRawQueryEventId
{
}

- (BOOL)hasRawQueryEventId
{
  return self->_rawQueryEventId != 0;
}

- (void)deleteRawSessionId
{
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteClientSessionId
{
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

- (void)deleteClientRequestId
{
}

- (BOOL)hasClientRequestId
{
  return self->_clientRequestId != 0;
}

@end