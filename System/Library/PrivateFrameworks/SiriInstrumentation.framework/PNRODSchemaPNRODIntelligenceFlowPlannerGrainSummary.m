@interface PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary
- (BOOL)hasActionResolverRequestToLastResolverEventTime;
- (BOOL)hasClientRequestId;
- (BOOL)hasFailureInfo;
- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime;
- (BOOL)hasLastResolverEventToResponseGeneratedTime;
- (BOOL)hasNumActionResolverRequests;
- (BOOL)hasNumClientActionsCreated;
- (BOOL)hasNumPlansCreated;
- (BOOL)hasNumQueriesCreated;
- (BOOL)hasNumQueriesExecuted;
- (BOOL)hasNumStatementsEvaluated;
- (BOOL)hasNumStatementsEvaluatedFromPlanner;
- (BOOL)hasNumSystemPromptsResolved;
- (BOOL)hasPlanCreatedToActionResolverRequestTime;
- (BOOL)hasPlanCreatedToLastResolverEventTime;
- (BOOL)hasPlanId;
- (BOOL)hasPlannerGrainStage;
- (BOOL)hasPlannerResponseTime;
- (BOOL)hasRawQueryEventId;
- (BOOL)hasResolverTotalQueryTime;
- (BOOL)hasStartToActionResolverRequestTime;
- (BOOL)hasStartToContextRetrievedTime;
- (BOOL)hasStartToEntitySpanMatchedTime;
- (BOOL)hasStartToLastQueryDecorationEventTime;
- (BOOL)hasStartToLastResolverEventTime;
- (BOOL)hasStartToPlanCreatedTime;
- (BOOL)hasStartToToolsRetrievedTime;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)actionResolverRequestToLastResolverEventTime;
- (PNRODSchemaPNRODMetricDuration)lastQueryDecorationEventToPlanCreatedTime;
- (PNRODSchemaPNRODMetricDuration)lastResolverEventToResponseGeneratedTime;
- (PNRODSchemaPNRODMetricDuration)planCreatedToActionResolverRequestTime;
- (PNRODSchemaPNRODMetricDuration)planCreatedToLastResolverEventTime;
- (PNRODSchemaPNRODMetricDuration)plannerResponseTime;
- (PNRODSchemaPNRODMetricDuration)resolverTotalQueryTime;
- (PNRODSchemaPNRODMetricDuration)startToActionResolverRequestTime;
- (PNRODSchemaPNRODMetricDuration)startToContextRetrievedTime;
- (PNRODSchemaPNRODMetricDuration)startToEntitySpanMatchedTime;
- (PNRODSchemaPNRODMetricDuration)startToLastQueryDecorationEventTime;
- (PNRODSchemaPNRODMetricDuration)startToLastResolverEventTime;
- (PNRODSchemaPNRODMetricDuration)startToPlanCreatedTime;
- (PNRODSchemaPNRODMetricDuration)startToToolsRetrievedTime;
- (SISchemaUUID)clientRequestId;
- (SISchemaUUID)planId;
- (SISchemaUUID)rawQueryEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)plannerGrainStage;
- (int64_t)status;
- (unint64_t)hash;
- (unsigned)numActionResolverRequests;
- (unsigned)numClientActionsCreated;
- (unsigned)numPlansCreated;
- (unsigned)numQueriesCreated;
- (unsigned)numQueriesExecuted;
- (unsigned)numStatementsEvaluated;
- (unsigned)numStatementsEvaluatedFromPlanner;
- (unsigned)numSystemPromptsResolved;
- (void)deleteActionResolverRequestToLastResolverEventTime;
- (void)deleteClientRequestId;
- (void)deleteFailureInfo;
- (void)deleteLastQueryDecorationEventToPlanCreatedTime;
- (void)deleteLastResolverEventToResponseGeneratedTime;
- (void)deleteNumActionResolverRequests;
- (void)deleteNumClientActionsCreated;
- (void)deleteNumPlansCreated;
- (void)deleteNumQueriesCreated;
- (void)deleteNumQueriesExecuted;
- (void)deleteNumStatementsEvaluated;
- (void)deleteNumStatementsEvaluatedFromPlanner;
- (void)deleteNumSystemPromptsResolved;
- (void)deletePlanCreatedToActionResolverRequestTime;
- (void)deletePlanCreatedToLastResolverEventTime;
- (void)deletePlanId;
- (void)deletePlannerGrainStage;
- (void)deletePlannerResponseTime;
- (void)deleteRawQueryEventId;
- (void)deleteResolverTotalQueryTime;
- (void)deleteStartToActionResolverRequestTime;
- (void)deleteStartToContextRetrievedTime;
- (void)deleteStartToEntitySpanMatchedTime;
- (void)deleteStartToLastQueryDecorationEventTime;
- (void)deleteStartToLastResolverEventTime;
- (void)deleteStartToPlanCreatedTime;
- (void)deleteStartToToolsRetrievedTime;
- (void)deleteStatus;
- (void)setActionResolverRequestToLastResolverEventTime:(id)a3;
- (void)setClientRequestId:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3;
- (void)setHasClientRequestId:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3;
- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3;
- (void)setHasNumActionResolverRequests:(BOOL)a3;
- (void)setHasNumClientActionsCreated:(BOOL)a3;
- (void)setHasNumPlansCreated:(BOOL)a3;
- (void)setHasNumQueriesCreated:(BOOL)a3;
- (void)setHasNumQueriesExecuted:(BOOL)a3;
- (void)setHasNumStatementsEvaluated:(BOOL)a3;
- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3;
- (void)setHasNumSystemPromptsResolved:(BOOL)a3;
- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3;
- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3;
- (void)setHasPlanId:(BOOL)a3;
- (void)setHasPlannerGrainStage:(BOOL)a3;
- (void)setHasPlannerResponseTime:(BOOL)a3;
- (void)setHasRawQueryEventId:(BOOL)a3;
- (void)setHasResolverTotalQueryTime:(BOOL)a3;
- (void)setHasStartToActionResolverRequestTime:(BOOL)a3;
- (void)setHasStartToContextRetrievedTime:(BOOL)a3;
- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3;
- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3;
- (void)setHasStartToLastResolverEventTime:(BOOL)a3;
- (void)setHasStartToPlanCreatedTime:(BOOL)a3;
- (void)setHasStartToToolsRetrievedTime:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3;
- (void)setLastResolverEventToResponseGeneratedTime:(id)a3;
- (void)setNumActionResolverRequests:(unsigned int)a3;
- (void)setNumClientActionsCreated:(unsigned int)a3;
- (void)setNumPlansCreated:(unsigned int)a3;
- (void)setNumQueriesCreated:(unsigned int)a3;
- (void)setNumQueriesExecuted:(unsigned int)a3;
- (void)setNumStatementsEvaluated:(unsigned int)a3;
- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3;
- (void)setNumSystemPromptsResolved:(unsigned int)a3;
- (void)setPlanCreatedToActionResolverRequestTime:(id)a3;
- (void)setPlanCreatedToLastResolverEventTime:(id)a3;
- (void)setPlanId:(id)a3;
- (void)setPlannerGrainStage:(int64_t)a3;
- (void)setPlannerResponseTime:(id)a3;
- (void)setRawQueryEventId:(id)a3;
- (void)setResolverTotalQueryTime:(id)a3;
- (void)setStartToActionResolverRequestTime:(id)a3;
- (void)setStartToContextRetrievedTime:(id)a3;
- (void)setStartToEntitySpanMatchedTime:(id)a3;
- (void)setStartToLastQueryDecorationEventTime:(id)a3;
- (void)setStartToLastResolverEventTime:(id)a3;
- (void)setStartToPlanCreatedTime:(id)a3;
- (void)setStartToToolsRetrievedTime:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v61 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deletePlanId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteClientRequestId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteRawQueryEventId];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deletePlannerResponseTime];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToLastResolverEventTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToActionResolverRequestTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToPlanCreatedTime];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToLastQueryDecorationEventTime];
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteLastResolverEventToResponseGeneratedTime];
  }
  v33 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteActionResolverRequestToLastResolverEventTime];
  }
  v36 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deletePlanCreatedToLastResolverEventTime];
  }
  v39 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deletePlanCreatedToActionResolverRequestTime];
  }
  v42 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteLastQueryDecorationEventToPlanCreatedTime];
  }
  v45 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToContextRetrievedTime];
  }
  v48 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToToolsRetrievedTime];
  }
  v51 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteStartToEntitySpanMatchedTime];
  }
  v54 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteResolverTotalQueryTime];
  }
  v57 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, 0);
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, 0);
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, 0);
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, 0);
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, 0);
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_plannerResponseTime, 0);
  objc_storeStrong((id *)&self->_rawQueryEventId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasStartToEntitySpanMatchedTime = a3;
}

- (void)setHasResolverTotalQueryTime:(BOOL)a3
{
  self->_hasStartToToolsRetrievedTime = a3;
}

- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3
{
  self->_hasStartToContextRetrievedTime = a3;
}

- (void)setHasStartToToolsRetrievedTime:(BOOL)a3
{
  self->_hasLastQueryDecorationEventToPlanCreatedTime = a3;
}

- (void)setHasStartToContextRetrievedTime:(BOOL)a3
{
  self->_hasPlanCreatedToActionResolverRequestTime = a3;
}

- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3
{
  self->_hasPlanCreatedToLastResolverEventTime = a3;
}

- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3
{
  self->_hasActionResolverRequestToLastResolverEventTime = a3;
}

- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3
{
  self->_hasLastResolverEventToResponseGeneratedTime = a3;
}

- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToLastQueryDecorationEventTime = a3;
}

- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3
{
  self->_hasStartToPlanCreatedTime = a3;
}

- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3
{
  self->_hasStartToActionResolverRequestTime = a3;
}

- (void)setHasStartToPlanCreatedTime:(BOOL)a3
{
  self->_hasStartToLastResolverEventTime = a3;
}

- (void)setHasStartToActionResolverRequestTime:(BOOL)a3
{
  self->_hasPlannerResponseTime = a3;
}

- (void)setHasStartToLastResolverEventTime:(BOOL)a3
{
  self->_hasRawQueryEventId = a3;
}

- (void)setHasPlannerResponseTime:(BOOL)a3
{
  self->_hasClientRequestId = a3;
}

- (void)setHasRawQueryEventId:(BOOL)a3
{
  self->_hasPlanId = a3;
}

- (void)setHasClientRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPlanId:(BOOL)a3
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

- (void)setResolverTotalQueryTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)resolverTotalQueryTime
{
  return self->_resolverTotalQueryTime;
}

- (void)setStartToEntitySpanMatchedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime;
}

- (void)setStartToToolsRetrievedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime;
}

- (void)setStartToContextRetrievedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToContextRetrievedTime
{
  return self->_startToContextRetrievedTime;
}

- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)lastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime;
}

- (void)setPlanCreatedToActionResolverRequestTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime;
}

- (void)setPlanCreatedToLastResolverEventTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime;
}

- (void)setActionResolverRequestToLastResolverEventTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)actionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime;
}

- (void)setLastResolverEventToResponseGeneratedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)lastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime;
}

- (void)setStartToLastQueryDecorationEventTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime;
}

- (void)setStartToPlanCreatedTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToPlanCreatedTime
{
  return self->_startToPlanCreatedTime;
}

- (void)setStartToActionResolverRequestTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime;
}

- (void)setStartToLastResolverEventTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)startToLastResolverEventTime
{
  return self->_startToLastResolverEventTime;
}

- (void)setPlannerResponseTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)plannerResponseTime
{
  return self->_plannerResponseTime;
}

- (unsigned)numSystemPromptsResolved
{
  return self->_numSystemPromptsResolved;
}

- (unsigned)numStatementsEvaluatedFromPlanner
{
  return self->_numStatementsEvaluatedFromPlanner;
}

- (unsigned)numStatementsEvaluated
{
  return self->_numStatementsEvaluated;
}

- (unsigned)numActionResolverRequests
{
  return self->_numActionResolverRequests;
}

- (unsigned)numClientActionsCreated
{
  return self->_numClientActionsCreated;
}

- (unsigned)numQueriesExecuted
{
  return self->_numQueriesExecuted;
}

- (unsigned)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (unsigned)numPlansCreated
{
  return self->_numPlansCreated;
}

- (int64_t)plannerGrainStage
{
  return self->_plannerGrainStage;
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

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)&v76 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"planId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setPlanId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"clientRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setClientRequestId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"rawQueryEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setRawQueryEventId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setStatus:](v5, "setStatus:", [v12 longLongValue]);
    }
    v62 = v12;
    v13 = [v4 objectForKeyedSubscript:@"plannerGrainStage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setPlannerGrainStage:](v5, "setPlannerGrainStage:", [v13 longLongValue]);
    }
    int v14 = (void *)v6;
    v15 = [v4 objectForKeyedSubscript:@"numPlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumPlansCreated:](v5, "setNumPlansCreated:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"numQueriesCreated"];
    objc_opt_class();
    v75 = v16;
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesCreated:](v5, "setNumQueriesCreated:", [v16 unsignedIntValue]);
    }
    int v17 = [v4 objectForKeyedSubscript:@"numQueriesExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumQueriesExecuted:](v5, "setNumQueriesExecuted:", [v17 unsignedIntValue]);
    }
    int v59 = v17;
    v18 = [v4 objectForKeyedSubscript:@"numClientActionsCreated"];
    objc_opt_class();
    v74 = v18;
    v65 = v14;
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumClientActionsCreated:](v5, "setNumClientActionsCreated:", [v18 unsignedIntValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"numActionResolverRequests"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumActionResolverRequests:](v5, "setNumActionResolverRequests:", [v19 unsignedIntValue]);
    }
    int v20 = [v4 objectForKeyedSubscript:@"numStatementsEvaluated"];
    objc_opt_class();
    v73 = v20;
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluated:](v5, "setNumStatementsEvaluated:", [v20 unsignedIntValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"numStatementsEvaluatedFromPlanner"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumStatementsEvaluatedFromPlanner:](v5, "setNumStatementsEvaluatedFromPlanner:", [v21 unsignedIntValue]);
    }
    v64 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"numSystemPromptsResolved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary setNumSystemPromptsResolved:](v5, "setNumSystemPromptsResolved:", [v22 unsignedIntValue]);
    }
    int v56 = v22;
    uint64_t v23 = [v4 objectForKeyedSubscript:@"plannerResponseTime"];
    objc_opt_class();
    v72 = (void *)v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v23];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setPlannerResponseTime:v24];
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"startToLastResolverEventTime"];
    objc_opt_class();
    v71 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v25];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToLastResolverEventTime:v26];
    }
    uint64_t v27 = [v4 objectForKeyedSubscript:@"startToActionResolverRequestTime"];
    objc_opt_class();
    v70 = (void *)v27;
    if (objc_opt_isKindOfClass())
    {
      v28 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v27];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToActionResolverRequestTime:v28];
    }
    uint64_t v29 = [v4 objectForKeyedSubscript:@"startToPlanCreatedTime"];
    objc_opt_class();
    v69 = (void *)v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v29];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToPlanCreatedTime:v30];
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    objc_opt_class();
    v68 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      int v32 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v31];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToLastQueryDecorationEventTime:v32];
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    objc_opt_class();
    v67 = (void *)v33;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v33];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setLastResolverEventToResponseGeneratedTime:v34];
    }
    uint64_t v35 = [v4 objectForKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    objc_opt_class();
    v66 = (void *)v35;
    if (objc_opt_isKindOfClass())
    {
      v36 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v35];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setActionResolverRequestToLastResolverEventTime:v36];
    }
    v63 = (void *)v10;
    uint64_t v37 = [v4 objectForKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v38 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v37];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setPlanCreatedToLastResolverEventTime:v38];
    }
    objc_super v61 = v13;
    v39 = objc_msgSend(v4, "objectForKeyedSubscript:", @"planCreatedToActionResolverRequestTime", v37);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v39];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setPlanCreatedToActionResolverRequestTime:v40];
    }
    v60 = v15;
    int v41 = [v4 objectForKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v41];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setLastQueryDecorationEventToPlanCreatedTime:v42];
    }
    v58 = v19;
    v43 = [v4 objectForKeyedSubscript:@"startToContextRetrievedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v44 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v43];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToContextRetrievedTime:v44];
    }
    v57 = v21;
    v45 = [v4 objectForKeyedSubscript:@"startToToolsRetrievedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v45];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToToolsRetrievedTime:v46];
    }
    int v47 = [v4 objectForKeyedSubscript:@"startToEntitySpanMatchedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v47];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setStartToEntitySpanMatchedTime:v48];
    }
    v49 = [v4 objectForKeyedSubscript:@"resolverTotalQueryTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v50 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v49];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setResolverTotalQueryTime:v50];
    }
    v51 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v51];
      [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)v5 setFailureInfo:v52];
    }
    int v53 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self dictionaryRepresentation];
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
  if (self->_actionResolverRequestToLastResolverEventTime)
  {
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    }
  }
  if (self->_clientRequestId)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"clientRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"clientRequestId"];
    }
  }
  if (self->_failureInfo)
  {
    uint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_lastQueryDecorationEventToPlanCreatedTime)
  {
    v13 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    }
  }
  if (self->_lastResolverEventToResponseGeneratedTime)
  {
    v16 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numActionResolverRequests](self, "numActionResolverRequests"));
    [v3 setObject:v23 forKeyedSubscript:@"numActionResolverRequests"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_28:
      if ((has & 4) == 0) {
        goto LABEL_29;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_28;
  }
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numClientActionsCreated](self, "numClientActionsCreated"));
  [v3 setObject:v24 forKeyedSubscript:@"numClientActionsCreated"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_29:
    if ((has & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numPlansCreated](self, "numPlansCreated"));
  [v3 setObject:v25 forKeyedSubscript:@"numPlansCreated"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_30:
    if ((has & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_42;
  }
LABEL_41:
  int v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numQueriesCreated](self, "numQueriesCreated"));
  [v3 setObject:v26 forKeyedSubscript:@"numQueriesCreated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_31:
    if ((has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numQueriesExecuted](self, "numQueriesExecuted"));
  [v3 setObject:v27 forKeyedSubscript:@"numQueriesExecuted"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_32:
    if ((has & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_44;
  }
LABEL_43:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numStatementsEvaluated](self, "numStatementsEvaluated"));
  [v3 setObject:v28 forKeyedSubscript:@"numStatementsEvaluated"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_33:
    if ((has & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_44:
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numStatementsEvaluatedFromPlanner](self, "numStatementsEvaluatedFromPlanner"));
  [v3 setObject:v29 forKeyedSubscript:@"numStatementsEvaluatedFromPlanner"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_34:
    int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary numSystemPromptsResolved](self, "numSystemPromptsResolved"));
    [v3 setObject:v20 forKeyedSubscript:@"numSystemPromptsResolved"];
  }
LABEL_35:
  if (self->_planCreatedToActionResolverRequestTime)
  {
    v21 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"planCreatedToActionResolverRequestTime"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"planCreatedToActionResolverRequestTime"];
    }
  }
  if (self->_planCreatedToLastResolverEventTime)
  {
    uint64_t v31 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    }
    else
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    }
  }
  if (self->_planId)
  {
    v34 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
    uint64_t v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"planId"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"planId"];
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary plannerGrainStage](self, "plannerGrainStage"));
    [v3 setObject:v37 forKeyedSubscript:@"plannerGrainStage"];
  }
  if (self->_plannerResponseTime)
  {
    int v38 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"plannerResponseTime"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"plannerResponseTime"];
    }
  }
  if (self->_rawQueryEventId)
  {
    int v41 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
    v42 = [v41 dictionaryRepresentation];
    if (v42)
    {
      [v3 setObject:v42 forKeyedSubscript:@"rawQueryEventId"];
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v43 forKeyedSubscript:@"rawQueryEventId"];
    }
  }
  if (self->_resolverTotalQueryTime)
  {
    int v44 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
    v45 = [v44 dictionaryRepresentation];
    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"resolverTotalQueryTime"];
    }
    else
    {
      v46 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v46 forKeyedSubscript:@"resolverTotalQueryTime"];
    }
  }
  if (self->_startToActionResolverRequestTime)
  {
    int v47 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
    v48 = [v47 dictionaryRepresentation];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"startToActionResolverRequestTime"];
    }
    else
    {
      v49 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v49 forKeyedSubscript:@"startToActionResolverRequestTime"];
    }
  }
  if (self->_startToContextRetrievedTime)
  {
    int v50 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
    v51 = [v50 dictionaryRepresentation];
    if (v51)
    {
      [v3 setObject:v51 forKeyedSubscript:@"startToContextRetrievedTime"];
    }
    else
    {
      v52 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v52 forKeyedSubscript:@"startToContextRetrievedTime"];
    }
  }
  if (self->_startToEntitySpanMatchedTime)
  {
    int v53 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
    v54 = [v53 dictionaryRepresentation];
    if (v54)
    {
      [v3 setObject:v54 forKeyedSubscript:@"startToEntitySpanMatchedTime"];
    }
    else
    {
      v55 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v55 forKeyedSubscript:@"startToEntitySpanMatchedTime"];
    }
  }
  if (self->_startToLastQueryDecorationEventTime)
  {
    int v56 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
    v57 = [v56 dictionaryRepresentation];
    if (v57)
    {
      [v3 setObject:v57 forKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    }
    else
    {
      v58 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v58 forKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    }
  }
  if (self->_startToLastResolverEventTime)
  {
    int v59 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
    v60 = [v59 dictionaryRepresentation];
    if (v60)
    {
      [v3 setObject:v60 forKeyedSubscript:@"startToLastResolverEventTime"];
    }
    else
    {
      objc_super v61 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v61 forKeyedSubscript:@"startToLastResolverEventTime"];
    }
  }
  if (self->_startToPlanCreatedTime)
  {
    v62 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
    v63 = [v62 dictionaryRepresentation];
    if (v63)
    {
      [v3 setObject:v63 forKeyedSubscript:@"startToPlanCreatedTime"];
    }
    else
    {
      v64 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v64 forKeyedSubscript:@"startToPlanCreatedTime"];
    }
  }
  if (self->_startToToolsRetrievedTime)
  {
    v65 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
    v66 = [v65 dictionaryRepresentation];
    if (v66)
    {
      [v3 setObject:v66 forKeyedSubscript:@"startToToolsRetrievedTime"];
    }
    else
    {
      v67 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v67 forKeyedSubscript:@"startToToolsRetrievedTime"];
    }
  }
  if (*(_WORD *)&self->_has)
  {
    v68 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary status](self, "status"));
    [v3 setObject:v68 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v69 = v3;

  return v69;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_planId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_clientRequestId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_rawQueryEventId hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v7 = 2654435761 * self->_status;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_plannerGrainStage;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_numPlansCreated;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v10 = 2654435761 * self->_numQueriesCreated;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v11 = 2654435761 * self->_numQueriesExecuted;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v12 = 2654435761 * self->_numClientActionsCreated;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v13 = 2654435761 * self->_numActionResolverRequests;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v14 = 2654435761 * self->_numStatementsEvaluated;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v15 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v15 = 2654435761 * self->_numStatementsEvaluatedFromPlanner;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v16 = 2654435761 * self->_numSystemPromptsResolved;
LABEL_22:
  unint64_t v17 = v4 ^ v3 ^ v5 ^ v7;
  unint64_t v18 = v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(PNRODSchemaPNRODMetricDuration *)self->_plannerResponseTime hash];
  unint64_t v19 = v17 ^ v18 ^ [(PNRODSchemaPNRODMetricDuration *)self->_startToLastResolverEventTime hash];
  unint64_t v20 = [(PNRODSchemaPNRODMetricDuration *)self->_startToActionResolverRequestTime hash];
  unint64_t v21 = v20 ^ [(PNRODSchemaPNRODMetricDuration *)self->_startToPlanCreatedTime hash];
  unint64_t v22 = v21 ^ [(PNRODSchemaPNRODMetricDuration *)self->_startToLastQueryDecorationEventTime hash];
  unint64_t v23 = v19 ^ v22 ^ [(PNRODSchemaPNRODMetricDuration *)self->_lastResolverEventToResponseGeneratedTime hash];
  unint64_t v24 = [(PNRODSchemaPNRODMetricDuration *)self->_actionResolverRequestToLastResolverEventTime hash];
  unint64_t v25 = v24 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planCreatedToLastResolverEventTime hash];
  unint64_t v26 = v25 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planCreatedToActionResolverRequestTime hash];
  unint64_t v27 = v26 ^ [(PNRODSchemaPNRODMetricDuration *)self->_lastQueryDecorationEventToPlanCreatedTime hash];
  unint64_t v28 = v23 ^ v27 ^ [(PNRODSchemaPNRODMetricDuration *)self->_startToContextRetrievedTime hash];
  unint64_t v29 = [(PNRODSchemaPNRODMetricDuration *)self->_startToToolsRetrievedTime hash];
  unint64_t v30 = v29 ^ [(PNRODSchemaPNRODMetricDuration *)self->_startToEntitySpanMatchedTime hash];
  unint64_t v31 = v30 ^ [(PNRODSchemaPNRODMetricDuration *)self->_resolverTotalQueryTime hash];
  return v28 ^ v31 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_131;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
  uint64_t v6 = [v4 planId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
    uint64_t v10 = [v4 planId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
  uint64_t v6 = [v4 clientRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
    uint64_t v15 = [v4 clientRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
  uint64_t v6 = [v4 rawQueryEventId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
    unint64_t v20 = [v4 rawQueryEventId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
  unsigned int v23 = v4[100];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_131;
  }
  if (*(unsigned char *)&has)
  {
    int64_t status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_131;
  }
  if (v25)
  {
    int64_t plannerGrainStage = self->_plannerGrainStage;
    if (plannerGrainStage != [v4 plannerGrainStage]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v23 >> 2) & 1)) {
    goto LABEL_131;
  }
  if (v27)
  {
    unsigned int numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != [v4 numPlansCreated]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v23 >> 3) & 1)) {
    goto LABEL_131;
  }
  if (v29)
  {
    unsigned int numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != [v4 numQueriesCreated]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v31 = (*(unsigned int *)&has >> 4) & 1;
  if (v31 != ((v23 >> 4) & 1)) {
    goto LABEL_131;
  }
  if (v31)
  {
    unsigned int numQueriesExecuted = self->_numQueriesExecuted;
    if (numQueriesExecuted != [v4 numQueriesExecuted]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v33 = (*(unsigned int *)&has >> 5) & 1;
  if (v33 != ((v23 >> 5) & 1)) {
    goto LABEL_131;
  }
  if (v33)
  {
    unsigned int numClientActionsCreated = self->_numClientActionsCreated;
    if (numClientActionsCreated != [v4 numClientActionsCreated]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v35 = (*(unsigned int *)&has >> 6) & 1;
  if (v35 != ((v23 >> 6) & 1)) {
    goto LABEL_131;
  }
  if (v35)
  {
    unsigned int numActionResolverRequests = self->_numActionResolverRequests;
    if (numActionResolverRequests != [v4 numActionResolverRequests]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v37 = (*(unsigned int *)&has >> 7) & 1;
  if (v37 != ((v23 >> 7) & 1)) {
    goto LABEL_131;
  }
  if (v37)
  {
    unsigned int numStatementsEvaluated = self->_numStatementsEvaluated;
    if (numStatementsEvaluated != [v4 numStatementsEvaluated]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v39 = (*(unsigned int *)&has >> 8) & 1;
  if (v39 != ((v23 >> 8) & 1)) {
    goto LABEL_131;
  }
  if (v39)
  {
    unsigned int numStatementsEvaluatedFromPlanner = self->_numStatementsEvaluatedFromPlanner;
    if (numStatementsEvaluatedFromPlanner != [v4 numStatementsEvaluatedFromPlanner]) {
      goto LABEL_131;
    }
    $8430FF52068553F0F90F8ECDB9A62020 has = self->_has;
    unsigned int v23 = v4[100];
  }
  int v41 = (*(unsigned int *)&has >> 9) & 1;
  if (v41 != ((v23 >> 9) & 1)) {
    goto LABEL_131;
  }
  if (v41)
  {
    unsigned int numSystemPromptsResolved = self->_numSystemPromptsResolved;
    if (numSystemPromptsResolved != [v4 numSystemPromptsResolved]) {
      goto LABEL_131;
    }
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
  uint64_t v6 = [v4 plannerResponseTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v43 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
    v46 = [v4 plannerResponseTime];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
  uint64_t v6 = [v4 startToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v48 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
    v51 = [v4 startToLastResolverEventTime];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
  uint64_t v6 = [v4 startToActionResolverRequestTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v53 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
    int v56 = [v4 startToActionResolverRequestTime];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
  uint64_t v6 = [v4 startToPlanCreatedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v58 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
    objc_super v61 = [v4 startToPlanCreatedTime];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
  uint64_t v6 = [v4 startToLastQueryDecorationEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v63 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
    v66 = [v4 startToLastQueryDecorationEventTime];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
  uint64_t v6 = [v4 lastResolverEventToResponseGeneratedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v68 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
  if (v68)
  {
    id v69 = (void *)v68;
    v70 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
    v71 = [v4 lastResolverEventToResponseGeneratedTime];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
  uint64_t v6 = [v4 actionResolverRequestToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v73 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
    objc_super v76 = [v4 actionResolverRequestToLastResolverEventTime];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
  uint64_t v6 = [v4 planCreatedToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v78 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
    v81 = [v4 planCreatedToLastResolverEventTime];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
  uint64_t v6 = [v4 planCreatedToActionResolverRequestTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v83 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
    v86 = [v4 planCreatedToActionResolverRequestTime];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
  uint64_t v6 = [v4 lastQueryDecorationEventToPlanCreatedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v88 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
    v91 = [v4 lastQueryDecorationEventToPlanCreatedTime];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
  uint64_t v6 = [v4 startToContextRetrievedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v93 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
    v96 = [v4 startToContextRetrievedTime];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
  uint64_t v6 = [v4 startToToolsRetrievedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v98 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
    v101 = [v4 startToToolsRetrievedTime];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
  uint64_t v6 = [v4 startToEntitySpanMatchedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v103 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
  if (v103)
  {
    v104 = (void *)v103;
    v105 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
    v106 = [v4 startToEntitySpanMatchedTime];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
  uint64_t v6 = [v4 resolverTotalQueryTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_130;
  }
  uint64_t v108 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
  if (v108)
  {
    v109 = (void *)v108;
    v110 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
    v111 = [v4 resolverTotalQueryTime];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_131;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
  uint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_130:

    goto LABEL_131;
  }
  uint64_t v113 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
  if (!v113)
  {

LABEL_134:
    BOOL v118 = 1;
    goto LABEL_132;
  }
  v114 = (void *)v113;
  v115 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
  v116 = [v4 failureInfo];
  char v117 = [v115 isEqual:v116];

  if (v117) {
    goto LABEL_134;
  }
LABEL_131:
  BOOL v118 = 0;
LABEL_132:

  return v118;
}

- (void)writeTo:(id)a3
{
  id v42 = a3;
  unint64_t v4 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self clientRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];

  if (v8)
  {
    uint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self rawQueryEventId];
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_53;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  int v11 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];

  if (v11)
  {
    uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self plannerResponseTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];

  if (v13)
  {
    uint64_t v14 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];

  if (v15)
  {
    int v16 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToActionResolverRequestTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];

  if (v17)
  {
    unint64_t v18 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToPlanCreatedTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v19 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];

  if (v19)
  {
    unint64_t v20 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToLastQueryDecorationEventTime];
    PBDataWriterWriteSubmessage();
  }
  int v21 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];

  if (v21)
  {
    unint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastResolverEventToResponseGeneratedTime];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v23 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];

  if (v23)
  {
    unint64_t v24 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self actionResolverRequestToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  int v25 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];

  if (v25)
  {
    unint64_t v26 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  int v27 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];

  if (v27)
  {
    unint64_t v28 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self planCreatedToActionResolverRequestTime];
    PBDataWriterWriteSubmessage();
  }
  int v29 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];

  if (v29)
  {
    unint64_t v30 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self lastQueryDecorationEventToPlanCreatedTime];
    PBDataWriterWriteSubmessage();
  }
  int v31 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];

  if (v31)
  {
    int v32 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToContextRetrievedTime];
    PBDataWriterWriteSubmessage();
  }
  int v33 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];

  if (v33)
  {
    v34 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToToolsRetrievedTime];
    PBDataWriterWriteSubmessage();
  }
  int v35 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];

  if (v35)
  {
    v36 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self startToEntitySpanMatchedTime];
    PBDataWriterWriteSubmessage();
  }
  int v37 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];

  if (v37)
  {
    int v38 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self resolverTotalQueryTime];
    PBDataWriterWriteSubmessage();
  }
  int v39 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];

  v40 = v42;
  if (v39)
  {
    int v41 = [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();

    v40 = v42;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteResolverTotalQueryTime
{
}

- (BOOL)hasResolverTotalQueryTime
{
  return self->_resolverTotalQueryTime != 0;
}

- (void)deleteStartToEntitySpanMatchedTime
{
}

- (BOOL)hasStartToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime != 0;
}

- (void)deleteStartToToolsRetrievedTime
{
}

- (BOOL)hasStartToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime != 0;
}

- (void)deleteStartToContextRetrievedTime
{
}

- (BOOL)hasStartToContextRetrievedTime
{
  return self->_startToContextRetrievedTime != 0;
}

- (void)deleteLastQueryDecorationEventToPlanCreatedTime
{
}

- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime != 0;
}

- (void)deletePlanCreatedToActionResolverRequestTime
{
}

- (BOOL)hasPlanCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime != 0;
}

- (void)deletePlanCreatedToLastResolverEventTime
{
}

- (BOOL)hasPlanCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime != 0;
}

- (void)deleteActionResolverRequestToLastResolverEventTime
{
}

- (BOOL)hasActionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime != 0;
}

- (void)deleteLastResolverEventToResponseGeneratedTime
{
}

- (BOOL)hasLastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime != 0;
}

- (void)deleteStartToLastQueryDecorationEventTime
{
}

- (BOOL)hasStartToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime != 0;
}

- (void)deleteStartToPlanCreatedTime
{
}

- (BOOL)hasStartToPlanCreatedTime
{
  return self->_startToPlanCreatedTime != 0;
}

- (void)deleteStartToActionResolverRequestTime
{
}

- (BOOL)hasStartToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime != 0;
}

- (void)deleteStartToLastResolverEventTime
{
}

- (BOOL)hasStartToLastResolverEventTime
{
  return self->_startToLastResolverEventTime != 0;
}

- (void)deletePlannerResponseTime
{
}

- (BOOL)hasPlannerResponseTime
{
  return self->_plannerResponseTime != 0;
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

- (void)deleteNumStatementsEvaluatedFromPlanner
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumStatementsEvaluatedFromPlanner:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumStatementsEvaluatedFromPlanner
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumStatementsEvaluatedFromPlanner:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int numStatementsEvaluatedFromPlanner = a3;
}

- (void)deleteNumStatementsEvaluated
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumStatementsEvaluated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumStatementsEvaluated
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumStatementsEvaluated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int numStatementsEvaluated = a3;
}

- (void)deleteNumActionResolverRequests
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumActionResolverRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumActionResolverRequests
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumActionResolverRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int numActionResolverRequests = a3;
}

- (void)deleteNumClientActionsCreated
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumClientActionsCreated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumClientActionsCreated
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumClientActionsCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int numClientActionsCreated = a3;
}

- (void)deleteNumQueriesExecuted
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumQueriesExecuted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumQueriesExecuted
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumQueriesExecuted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numQueriesExecuted = a3;
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

- (void)deleteNumPlansCreated
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumPlansCreated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numPlansCreated = a3;
}

- (void)deletePlannerGrainStage
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasPlannerGrainStage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPlannerGrainStage
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPlannerGrainStage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int64_t plannerGrainStage = a3;
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

@end