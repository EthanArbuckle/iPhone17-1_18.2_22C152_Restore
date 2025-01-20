@interface IFTSchemaIFTClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasActionCancelled;
- (BOOL)hasActionCreated;
- (BOOL)hasActionResolverRequestCreated;
- (BOOL)hasAstFlatExprSearchVariantTier1;
- (BOOL)hasClientActionCreated;
- (BOOL)hasContextPrewarmCompleted;
- (BOOL)hasContextPrewarmRequest;
- (BOOL)hasContextRetrieved;
- (BOOL)hasContinuePlanning;
- (BOOL)hasCriticalError;
- (BOOL)hasEntitySpanMatched;
- (BOOL)hasEventMetadata;
- (BOOL)hasPlanCreated;
- (BOOL)hasQueriesCreated;
- (BOOL)hasQueriesExecuted;
- (BOOL)hasQueryDecorationResult;
- (BOOL)hasRecoverableError;
- (BOOL)hasRequest;
- (BOOL)hasRequestContextTextContentTier1;
- (BOOL)hasResponseGenerationRequest;
- (BOOL)hasSessionStart;
- (BOOL)hasStatementEvaluated;
- (BOOL)hasSystemResponseGenerated;
- (BOOL)hasTerminate;
- (BOOL)hasToolResolution;
- (BOOL)hasToolsRetrieved;
- (BOOL)hasVariablesSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTFlatExprSearchVariantTier1)astFlatExprSearchVariantTier1;
- (IFTSchemaIFTAction)actionCreated;
- (IFTSchemaIFTActionCancellation)actionCancelled;
- (IFTSchemaIFTActionResolverRequest)actionResolverRequestCreated;
- (IFTSchemaIFTClientAction)clientActionCreated;
- (IFTSchemaIFTClientEvent)initWithDictionary:(id)a3;
- (IFTSchemaIFTClientEvent)initWithJSON:(id)a3;
- (IFTSchemaIFTClientEventMetadata)eventMetadata;
- (IFTSchemaIFTContextPrewarmCompleted)contextPrewarmCompleted;
- (IFTSchemaIFTContextPrewarmRequest)contextPrewarmRequest;
- (IFTSchemaIFTContextRetrieved)contextRetrieved;
- (IFTSchemaIFTContinuePlanning)continuePlanning;
- (IFTSchemaIFTEntitySpanMatchResult)entitySpanMatched;
- (IFTSchemaIFTPlan)planCreated;
- (IFTSchemaIFTQueryDecorationResult)queryDecorationResult;
- (IFTSchemaIFTQueryStep)queriesCreated;
- (IFTSchemaIFTQueryStepResults)queriesExecuted;
- (IFTSchemaIFTRecoverableError)recoverableError;
- (IFTSchemaIFTRequest)request;
- (IFTSchemaIFTRequestContentTextContentTier1)requestContextTextContentTier1;
- (IFTSchemaIFTResponseGenerationRequest)responseGenerationRequest;
- (IFTSchemaIFTSessionError)criticalError;
- (IFTSchemaIFTSessionStart)sessionStart;
- (IFTSchemaIFTStatementResult)statementEvaluated;
- (IFTSchemaIFTSystemResponse)systemResponseGenerated;
- (IFTSchemaIFTTerminate)terminate;
- (IFTSchemaIFTToolResolution)toolResolution;
- (IFTSchemaIFTToolRetrievalResponse)toolsRetrieved;
- (IFTSchemaIFTVariableStep)variablesSet;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteActionCancelled;
- (void)deleteActionCreated;
- (void)deleteActionResolverRequestCreated;
- (void)deleteAstFlatExprSearchVariantTier1;
- (void)deleteClientActionCreated;
- (void)deleteContextPrewarmCompleted;
- (void)deleteContextPrewarmRequest;
- (void)deleteContextRetrieved;
- (void)deleteContinuePlanning;
- (void)deleteCriticalError;
- (void)deleteEntitySpanMatched;
- (void)deleteEventMetadata;
- (void)deletePlanCreated;
- (void)deleteQueriesCreated;
- (void)deleteQueriesExecuted;
- (void)deleteQueryDecorationResult;
- (void)deleteRecoverableError;
- (void)deleteRequest;
- (void)deleteRequestContextTextContentTier1;
- (void)deleteResponseGenerationRequest;
- (void)deleteSessionStart;
- (void)deleteStatementEvaluated;
- (void)deleteSystemResponseGenerated;
- (void)deleteTerminate;
- (void)deleteToolResolution;
- (void)deleteToolsRetrieved;
- (void)deleteVariablesSet;
- (void)setActionCancelled:(id)a3;
- (void)setActionCreated:(id)a3;
- (void)setActionResolverRequestCreated:(id)a3;
- (void)setAstFlatExprSearchVariantTier1:(id)a3;
- (void)setClientActionCreated:(id)a3;
- (void)setContextPrewarmCompleted:(id)a3;
- (void)setContextPrewarmRequest:(id)a3;
- (void)setContextRetrieved:(id)a3;
- (void)setContinuePlanning:(id)a3;
- (void)setCriticalError:(id)a3;
- (void)setEntitySpanMatched:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasActionCancelled:(BOOL)a3;
- (void)setHasActionCreated:(BOOL)a3;
- (void)setHasActionResolverRequestCreated:(BOOL)a3;
- (void)setHasAstFlatExprSearchVariantTier1:(BOOL)a3;
- (void)setHasClientActionCreated:(BOOL)a3;
- (void)setHasContextPrewarmCompleted:(BOOL)a3;
- (void)setHasContextPrewarmRequest:(BOOL)a3;
- (void)setHasContextRetrieved:(BOOL)a3;
- (void)setHasContinuePlanning:(BOOL)a3;
- (void)setHasCriticalError:(BOOL)a3;
- (void)setHasEntitySpanMatched:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPlanCreated:(BOOL)a3;
- (void)setHasQueriesCreated:(BOOL)a3;
- (void)setHasQueriesExecuted:(BOOL)a3;
- (void)setHasQueryDecorationResult:(BOOL)a3;
- (void)setHasRecoverableError:(BOOL)a3;
- (void)setHasRequest:(BOOL)a3;
- (void)setHasRequestContextTextContentTier1:(BOOL)a3;
- (void)setHasResponseGenerationRequest:(BOOL)a3;
- (void)setHasSessionStart:(BOOL)a3;
- (void)setHasStatementEvaluated:(BOOL)a3;
- (void)setHasSystemResponseGenerated:(BOOL)a3;
- (void)setHasTerminate:(BOOL)a3;
- (void)setHasToolResolution:(BOOL)a3;
- (void)setHasToolsRetrieved:(BOOL)a3;
- (void)setHasVariablesSet:(BOOL)a3;
- (void)setPlanCreated:(id)a3;
- (void)setQueriesCreated:(id)a3;
- (void)setQueriesExecuted:(id)a3;
- (void)setQueryDecorationResult:(id)a3;
- (void)setRecoverableError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestContextTextContentTier1:(id)a3;
- (void)setResponseGenerationRequest:(id)a3;
- (void)setSessionStart:(id)a3;
- (void)setStatementEvaluated:(id)a3;
- (void)setSystemResponseGenerated:(id)a3;
- (void)setTerminate:(id)a3;
- (void)setToolResolution:(id)a3;
- (void)setToolsRetrieved:(id)a3;
- (void)setVariablesSet:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTClientEvent

- (int)componentName
{
  v2 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
  v3 = [v2 ifRequestId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 45;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
  v3 = [v2 ifRequestId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v89.receiver = self;
  v89.super_class = (Class)IFTSchemaIFTClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v89 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  uint64_t v6 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTClientEvent *)self deleteEventMetadata];
  }
  v9 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTClientEvent *)self deleteContextPrewarmRequest];
  }
  v12 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTClientEvent *)self deleteContextPrewarmCompleted];
  }
  v15 = [(IFTSchemaIFTClientEvent *)self terminate];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTClientEvent *)self deleteTerminate];
  }
  v18 = [(IFTSchemaIFTClientEvent *)self sessionStart];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTClientEvent *)self deleteSessionStart];
  }
  v21 = [(IFTSchemaIFTClientEvent *)self request];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTClientEvent *)self deleteRequest];
  }
  v24 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(IFTSchemaIFTClientEvent *)self deleteRequestContextTextContentTier1];
  }
  v27 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(IFTSchemaIFTClientEvent *)self deleteEntitySpanMatched];
  }
  v30 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(IFTSchemaIFTClientEvent *)self deleteContextRetrieved];
  }
  v33 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(IFTSchemaIFTClientEvent *)self deleteToolsRetrieved];
  }
  v36 = [(IFTSchemaIFTClientEvent *)self planCreated];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(IFTSchemaIFTClientEvent *)self deletePlanCreated];
  }
  v39 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(IFTSchemaIFTClientEvent *)self deleteAstFlatExprSearchVariantTier1];
  }
  v42 = [(IFTSchemaIFTClientEvent *)self variablesSet];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(IFTSchemaIFTClientEvent *)self deleteVariablesSet];
  }
  v45 = [(IFTSchemaIFTClientEvent *)self toolResolution];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(IFTSchemaIFTClientEvent *)self deleteToolResolution];
  }
  v48 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(IFTSchemaIFTClientEvent *)self deleteQueriesCreated];
  }
  v51 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(IFTSchemaIFTClientEvent *)self deleteActionResolverRequestCreated];
  }
  v54 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(IFTSchemaIFTClientEvent *)self deleteResponseGenerationRequest];
  }
  v57 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(IFTSchemaIFTClientEvent *)self deleteActionCancelled];
  }
  v60 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(IFTSchemaIFTClientEvent *)self deleteContinuePlanning];
  }
  v63 = [(IFTSchemaIFTClientEvent *)self actionCreated];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(IFTSchemaIFTClientEvent *)self deleteActionCreated];
  }
  v66 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(IFTSchemaIFTClientEvent *)self deleteClientActionCreated];
  }
  v69 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(IFTSchemaIFTClientEvent *)self deleteQueriesExecuted];
  }
  v72 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(IFTSchemaIFTClientEvent *)self deleteStatementEvaluated];
  }
  v75 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(IFTSchemaIFTClientEvent *)self deleteSystemResponseGenerated];
  }
  v78 = [(IFTSchemaIFTClientEvent *)self criticalError];
  v79 = [v78 applySensitiveConditionsPolicy:v4];
  int v80 = [v79 suppressMessage];

  if (v80) {
    [(IFTSchemaIFTClientEvent *)self deleteCriticalError];
  }
  v81 = [(IFTSchemaIFTClientEvent *)self recoverableError];
  v82 = [v81 applySensitiveConditionsPolicy:v4];
  int v83 = [v82 suppressMessage];

  if (v83) {
    [(IFTSchemaIFTClientEvent *)self deleteRecoverableError];
  }
  v84 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
  v85 = [v84 applySensitiveConditionsPolicy:v4];
  int v86 = [v85 suppressMessage];

  if (v86) {
    [(IFTSchemaIFTClientEvent *)self deleteQueryDecorationResult];
  }
  id v87 = v5;

  return v87;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(IFTSchemaIFTClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0x19) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA7F8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x19) {
    return 0;
  }
  else {
    return off_1E5EAA8C8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDecorationResult, 0);
  objc_storeStrong((id *)&self->_recoverableError, 0);
  objc_storeStrong((id *)&self->_criticalError, 0);
  objc_storeStrong((id *)&self->_systemResponseGenerated, 0);
  objc_storeStrong((id *)&self->_statementEvaluated, 0);
  objc_storeStrong((id *)&self->_queriesExecuted, 0);
  objc_storeStrong((id *)&self->_clientActionCreated, 0);
  objc_storeStrong((id *)&self->_actionCreated, 0);
  objc_storeStrong((id *)&self->_continuePlanning, 0);
  objc_storeStrong((id *)&self->_actionCancelled, 0);
  objc_storeStrong((id *)&self->_responseGenerationRequest, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestCreated, 0);
  objc_storeStrong((id *)&self->_queriesCreated, 0);
  objc_storeStrong((id *)&self->_toolResolution, 0);
  objc_storeStrong((id *)&self->_variablesSet, 0);
  objc_storeStrong((id *)&self->_astFlatExprSearchVariantTier1, 0);
  objc_storeStrong((id *)&self->_planCreated, 0);
  objc_storeStrong((id *)&self->_toolsRetrieved, 0);
  objc_storeStrong((id *)&self->_contextRetrieved, 0);
  objc_storeStrong((id *)&self->_entitySpanMatched, 0);
  objc_storeStrong((id *)&self->_requestContextTextContentTier1, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_sessionStart, 0);
  objc_storeStrong((id *)&self->_terminate, 0);
  objc_storeStrong((id *)&self->_contextPrewarmCompleted, 0);
  objc_storeStrong((id *)&self->_contextPrewarmRequest, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasQueryDecorationResult:(BOOL)a3
{
  self->_hasQueryDecorationResult = a3;
}

- (BOOL)hasQueryDecorationResult
{
  return self->_hasQueryDecorationResult;
}

- (void)setHasRecoverableError:(BOOL)a3
{
  self->_hasRecoverableError = a3;
}

- (BOOL)hasRecoverableError
{
  return self->_hasRecoverableError;
}

- (void)setHasCriticalError:(BOOL)a3
{
  self->_hasCriticalError = a3;
}

- (BOOL)hasCriticalError
{
  return self->_hasCriticalError;
}

- (void)setHasSystemResponseGenerated:(BOOL)a3
{
  self->_hasSystemResponseGenerated = a3;
}

- (BOOL)hasSystemResponseGenerated
{
  return self->_hasSystemResponseGenerated;
}

- (void)setHasStatementEvaluated:(BOOL)a3
{
  self->_hasStatementEvaluated = a3;
}

- (BOOL)hasStatementEvaluated
{
  return self->_hasStatementEvaluated;
}

- (void)setHasQueriesExecuted:(BOOL)a3
{
  self->_hasQueriesExecuted = a3;
}

- (BOOL)hasQueriesExecuted
{
  return self->_hasQueriesExecuted;
}

- (void)setHasClientActionCreated:(BOOL)a3
{
  self->_hasClientActionCreated = a3;
}

- (BOOL)hasClientActionCreated
{
  return self->_hasClientActionCreated;
}

- (void)setHasActionCreated:(BOOL)a3
{
  self->_hasActionCreated = a3;
}

- (BOOL)hasActionCreated
{
  return self->_hasActionCreated;
}

- (void)setHasContinuePlanning:(BOOL)a3
{
  self->_hasContinuePlanning = a3;
}

- (BOOL)hasContinuePlanning
{
  return self->_hasContinuePlanning;
}

- (void)setHasActionCancelled:(BOOL)a3
{
  self->_hasActionCancelled = a3;
}

- (BOOL)hasActionCancelled
{
  return self->_hasActionCancelled;
}

- (void)setHasResponseGenerationRequest:(BOOL)a3
{
  self->_hasResponseGenerationRequest = a3;
}

- (BOOL)hasResponseGenerationRequest
{
  return self->_hasResponseGenerationRequest;
}

- (void)setHasActionResolverRequestCreated:(BOOL)a3
{
  self->_hasActionResolverRequestCreated = a3;
}

- (BOOL)hasActionResolverRequestCreated
{
  return self->_hasActionResolverRequestCreated;
}

- (void)setHasQueriesCreated:(BOOL)a3
{
  self->_hasQueriesCreated = a3;
}

- (BOOL)hasQueriesCreated
{
  return self->_hasQueriesCreated;
}

- (void)setHasToolResolution:(BOOL)a3
{
  self->_hasToolResolution = a3;
}

- (BOOL)hasToolResolution
{
  return self->_hasToolResolution;
}

- (void)setHasVariablesSet:(BOOL)a3
{
  self->_hasVariablesSet = a3;
}

- (BOOL)hasVariablesSet
{
  return self->_hasVariablesSet;
}

- (void)setHasAstFlatExprSearchVariantTier1:(BOOL)a3
{
  self->_hasAstFlatExprSearchVariantTier1 = a3;
}

- (BOOL)hasAstFlatExprSearchVariantTier1
{
  return self->_hasAstFlatExprSearchVariantTier1;
}

- (void)setHasPlanCreated:(BOOL)a3
{
  self->_hasPlanCreated = a3;
}

- (BOOL)hasPlanCreated
{
  return self->_hasPlanCreated;
}

- (void)setHasToolsRetrieved:(BOOL)a3
{
  self->_hasToolsRetrieved = a3;
}

- (BOOL)hasToolsRetrieved
{
  return self->_hasToolsRetrieved;
}

- (void)setHasContextRetrieved:(BOOL)a3
{
  self->_hasContextRetrieved = a3;
}

- (BOOL)hasContextRetrieved
{
  return self->_hasContextRetrieved;
}

- (void)setHasEntitySpanMatched:(BOOL)a3
{
  self->_hasEntitySpanMatched = a3;
}

- (BOOL)hasEntitySpanMatched
{
  return self->_hasEntitySpanMatched;
}

- (void)setHasRequestContextTextContentTier1:(BOOL)a3
{
  self->_hasRequestContextTextContentTier1 = a3;
}

- (BOOL)hasRequestContextTextContentTier1
{
  return self->_hasRequestContextTextContentTier1;
}

- (void)setHasRequest:(BOOL)a3
{
  self->_hasRequest = a3;
}

- (BOOL)hasRequest
{
  return self->_hasRequest;
}

- (void)setHasSessionStart:(BOOL)a3
{
  self->_hasSessionStart = a3;
}

- (BOOL)hasSessionStart
{
  return self->_hasSessionStart;
}

- (void)setHasTerminate:(BOOL)a3
{
  self->_hasTerminate = a3;
}

- (BOOL)hasTerminate
{
  return self->_hasTerminate;
}

- (void)setHasContextPrewarmCompleted:(BOOL)a3
{
  self->_hasContextPrewarmCompleted = a3;
}

- (BOOL)hasContextPrewarmCompleted
{
  return self->_hasContextPrewarmCompleted;
}

- (void)setHasContextPrewarmRequest:(BOOL)a3
{
  self->_hasContextPrewarmRequest = a3;
}

- (BOOL)hasContextPrewarmRequest
{
  return self->_hasContextPrewarmRequest;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (IFTSchemaIFTClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (IFTSchemaIFTClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)IFTSchemaIFTClientEvent;
  v5 = [(IFTSchemaIFTClientEvent *)&v82 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTClientEventMetadata alloc] initWithDictionary:v6];
      [(IFTSchemaIFTClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"contextPrewarmRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTContextPrewarmRequest alloc] initWithDictionary:v8];
      [(IFTSchemaIFTClientEvent *)v5 setContextPrewarmRequest:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"contextPrewarmCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTContextPrewarmCompleted alloc] initWithDictionary:v10];
      [(IFTSchemaIFTClientEvent *)v5 setContextPrewarmCompleted:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"terminate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTTerminate alloc] initWithDictionary:v12];
      [(IFTSchemaIFTClientEvent *)v5 setTerminate:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"sessionStart"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaIFTSessionStart alloc] initWithDictionary:v14];
      [(IFTSchemaIFTClientEvent *)v5 setSessionStart:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"request"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTRequest alloc] initWithDictionary:v16];
      [(IFTSchemaIFTClientEvent *)v5 setRequest:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"requestContextTextContentTier1"];
    objc_opt_class();
    v81 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[IFTSchemaIFTRequestContentTextContentTier1 alloc] initWithDictionary:v18];
      [(IFTSchemaIFTClientEvent *)v5 setRequestContextTextContentTier1:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"entitySpanMatched"];
    objc_opt_class();
    int v80 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[IFTSchemaIFTEntitySpanMatchResult alloc] initWithDictionary:v20];
      [(IFTSchemaIFTClientEvent *)v5 setEntitySpanMatched:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"contextRetrieved"];
    objc_opt_class();
    v79 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[IFTSchemaIFTContextRetrieved alloc] initWithDictionary:v22];
      [(IFTSchemaIFTClientEvent *)v5 setContextRetrieved:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"toolsRetrieved"];
    objc_opt_class();
    v78 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[IFTSchemaIFTToolRetrievalResponse alloc] initWithDictionary:v24];
      [(IFTSchemaIFTClientEvent *)v5 setToolsRetrieved:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"planCreated"];
    objc_opt_class();
    int v77 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[IFTSchemaIFTPlan alloc] initWithDictionary:v26];
      [(IFTSchemaIFTClientEvent *)v5 setPlanCreated:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"astFlatExprSearchVariantTier1"];
    objc_opt_class();
    v76 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[IFTSchemaASTFlatExprSearchVariantTier1 alloc] initWithDictionary:v28];
      [(IFTSchemaIFTClientEvent *)v5 setAstFlatExprSearchVariantTier1:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"variablesSet"];
    objc_opt_class();
    v75 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[IFTSchemaIFTVariableStep alloc] initWithDictionary:v30];
      [(IFTSchemaIFTClientEvent *)v5 setVariablesSet:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"toolResolution"];
    objc_opt_class();
    int v74 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[IFTSchemaIFTToolResolution alloc] initWithDictionary:v32];
      [(IFTSchemaIFTClientEvent *)v5 setToolResolution:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"queriesCreated"];
    objc_opt_class();
    v73 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[IFTSchemaIFTQueryStep alloc] initWithDictionary:v34];
      [(IFTSchemaIFTClientEvent *)v5 setQueriesCreated:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"actionResolverRequestCreated"];
    objc_opt_class();
    v72 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[IFTSchemaIFTActionResolverRequest alloc] initWithDictionary:v36];
      [(IFTSchemaIFTClientEvent *)v5 setActionResolverRequestCreated:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"responseGenerationRequest"];
    objc_opt_class();
    int v71 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[IFTSchemaIFTResponseGenerationRequest alloc] initWithDictionary:v38];
      [(IFTSchemaIFTClientEvent *)v5 setResponseGenerationRequest:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"actionCancelled"];
    objc_opt_class();
    v70 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[IFTSchemaIFTActionCancellation alloc] initWithDictionary:v40];
      [(IFTSchemaIFTClientEvent *)v5 setActionCancelled:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"continuePlanning"];
    objc_opt_class();
    v69 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[IFTSchemaIFTContinuePlanning alloc] initWithDictionary:v42];
      [(IFTSchemaIFTClientEvent *)v5 setContinuePlanning:v43];
    }
    v66 = (void *)v10;
    uint64_t v44 = [v4 objectForKeyedSubscript:@"actionCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[IFTSchemaIFTAction alloc] initWithDictionary:v44];
      [(IFTSchemaIFTClientEvent *)v5 setActionCreated:v45];
    }
    int v62 = (void *)v44;
    int v65 = (void *)v12;
    v46 = [v4 objectForKeyedSubscript:@"clientActionCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[IFTSchemaIFTClientAction alloc] initWithDictionary:v46];
      [(IFTSchemaIFTClientEvent *)v5 setClientActionCreated:v47];
    }
    v64 = (void *)v14;
    v48 = [v4 objectForKeyedSubscript:@"queriesExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[IFTSchemaIFTQueryStepResults alloc] initWithDictionary:v48];
      [(IFTSchemaIFTClientEvent *)v5 setQueriesExecuted:v49];
    }
    v63 = (void *)v16;
    int v50 = [v4 objectForKeyedSubscript:@"statementEvaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = [[IFTSchemaIFTStatementResult alloc] initWithDictionary:v50];
      [(IFTSchemaIFTClientEvent *)v5 setStatementEvaluated:v51];
    }
    int v68 = (void *)v6;
    v52 = [v4 objectForKeyedSubscript:@"systemResponseGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v53 = [[IFTSchemaIFTSystemResponse alloc] initWithDictionary:v52];
      [(IFTSchemaIFTClientEvent *)v5 setSystemResponseGenerated:v53];
    }
    v67 = (void *)v8;
    v54 = [v4 objectForKeyedSubscript:@"criticalError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55 = [[IFTSchemaIFTSessionError alloc] initWithDictionary:v54];
      [(IFTSchemaIFTClientEvent *)v5 setCriticalError:v55];
    }
    int v56 = [v4 objectForKeyedSubscript:@"recoverableError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [[IFTSchemaIFTRecoverableError alloc] initWithDictionary:v56];
      [(IFTSchemaIFTClientEvent *)v5 setRecoverableError:v57];
    }
    v58 = [v4 objectForKeyedSubscript:@"queryDecorationResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v59 = [[IFTSchemaIFTQueryDecorationResult alloc] initWithDictionary:v58];
      [(IFTSchemaIFTClientEvent *)v5 setQueryDecorationResult:v59];
    }
    v60 = v5;
  }
  return v5;
}

- (IFTSchemaIFTClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionCancelled)
  {
    id v4 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionCancelled"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionCancelled"];
    }
  }
  if (self->_actionCreated)
  {
    uint64_t v7 = [(IFTSchemaIFTClientEvent *)self actionCreated];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"actionCreated"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"actionCreated"];
    }
  }
  if (self->_actionResolverRequestCreated)
  {
    uint64_t v10 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"actionResolverRequestCreated"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"actionResolverRequestCreated"];
    }
  }
  if (self->_astFlatExprSearchVariantTier1)
  {
    v13 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"astFlatExprSearchVariantTier1"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"astFlatExprSearchVariantTier1"];
    }
  }
  if (self->_clientActionCreated)
  {
    uint64_t v16 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"clientActionCreated"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"clientActionCreated"];
    }
  }
  if (self->_contextPrewarmCompleted)
  {
    v19 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"contextPrewarmCompleted"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"contextPrewarmCompleted"];
    }
  }
  if (self->_contextPrewarmRequest)
  {
    uint64_t v22 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"contextPrewarmRequest"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"contextPrewarmRequest"];
    }
  }
  if (self->_contextRetrieved)
  {
    v25 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"contextRetrieved"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"contextRetrieved"];
    }
  }
  if (self->_continuePlanning)
  {
    uint64_t v28 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"continuePlanning"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"continuePlanning"];
    }
  }
  if (self->_criticalError)
  {
    v31 = [(IFTSchemaIFTClientEvent *)self criticalError];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"criticalError"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"criticalError"];
    }
  }
  if (self->_entitySpanMatched)
  {
    uint64_t v34 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"entitySpanMatched"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"entitySpanMatched"];
    }
  }
  if (self->_eventMetadata)
  {
    v37 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_planCreated)
  {
    uint64_t v40 = [(IFTSchemaIFTClientEvent *)self planCreated];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"planCreated"];
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"planCreated"];
    }
  }
  if (self->_queriesCreated)
  {
    v43 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
    uint64_t v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"queriesCreated"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"queriesCreated"];
    }
  }
  if (self->_queriesExecuted)
  {
    v46 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"queriesExecuted"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"queriesExecuted"];
    }
  }
  if (self->_queryDecorationResult)
  {
    v49 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"queryDecorationResult"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"queryDecorationResult"];
    }
  }
  if (self->_recoverableError)
  {
    v52 = [(IFTSchemaIFTClientEvent *)self recoverableError];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"recoverableError"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"recoverableError"];
    }
  }
  if (self->_request)
  {
    v55 = [(IFTSchemaIFTClientEvent *)self request];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"request"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"request"];
    }
  }
  if (self->_requestContextTextContentTier1)
  {
    v58 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"requestContextTextContentTier1"];
    }
    else
    {
      v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"requestContextTextContentTier1"];
    }
  }
  if (self->_responseGenerationRequest)
  {
    v61 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
    int v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"responseGenerationRequest"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"responseGenerationRequest"];
    }
  }
  if (self->_sessionStart)
  {
    v64 = [(IFTSchemaIFTClientEvent *)self sessionStart];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"sessionStart"];
    }
    else
    {
      v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"sessionStart"];
    }
  }
  if (self->_statementEvaluated)
  {
    v67 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
    int v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"statementEvaluated"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"statementEvaluated"];
    }
  }
  if (self->_systemResponseGenerated)
  {
    v70 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"systemResponseGenerated"];
    }
    else
    {
      v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"systemResponseGenerated"];
    }
  }
  if (self->_terminate)
  {
    v73 = [(IFTSchemaIFTClientEvent *)self terminate];
    int v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"terminate"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"terminate"];
    }
  }
  if (self->_toolResolution)
  {
    v76 = [(IFTSchemaIFTClientEvent *)self toolResolution];
    int v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"toolResolution"];
    }
    else
    {
      v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"toolResolution"];
    }
  }
  if (self->_toolsRetrieved)
  {
    v79 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
    int v80 = [v79 dictionaryRepresentation];
    if (v80)
    {
      [v3 setObject:v80 forKeyedSubscript:@"toolsRetrieved"];
    }
    else
    {
      v81 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v81 forKeyedSubscript:@"toolsRetrieved"];
    }
  }
  if (self->_variablesSet)
  {
    objc_super v82 = [(IFTSchemaIFTClientEvent *)self variablesSet];
    int v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"variablesSet"];
    }
    else
    {
      v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"variablesSet"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v85 = v3;

  return v85;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(IFTSchemaIFTContextPrewarmRequest *)self->_contextPrewarmRequest hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTContextPrewarmCompleted *)self->_contextPrewarmCompleted hash];
  unint64_t v6 = v4 ^ v5 ^ [(IFTSchemaIFTTerminate *)self->_terminate hash];
  unint64_t v7 = [(IFTSchemaIFTSessionStart *)self->_sessionStart hash];
  unint64_t v8 = v7 ^ [(IFTSchemaIFTRequest *)self->_request hash];
  unint64_t v9 = v6 ^ v8 ^ [(IFTSchemaIFTRequestContentTextContentTier1 *)self->_requestContextTextContentTier1 hash];
  unint64_t v10 = [(IFTSchemaIFTEntitySpanMatchResult *)self->_entitySpanMatched hash];
  unint64_t v11 = v10 ^ [(IFTSchemaIFTContextRetrieved *)self->_contextRetrieved hash];
  unint64_t v12 = v11 ^ [(IFTSchemaIFTToolRetrievalResponse *)self->_toolsRetrieved hash];
  unint64_t v13 = v9 ^ v12 ^ [(IFTSchemaIFTPlan *)self->_planCreated hash];
  unint64_t v14 = [(IFTSchemaASTFlatExprSearchVariantTier1 *)self->_astFlatExprSearchVariantTier1 hash];
  unint64_t v15 = v14 ^ [(IFTSchemaIFTVariableStep *)self->_variablesSet hash];
  unint64_t v16 = v15 ^ [(IFTSchemaIFTToolResolution *)self->_toolResolution hash];
  unint64_t v17 = v16 ^ [(IFTSchemaIFTQueryStep *)self->_queriesCreated hash];
  unint64_t v18 = v13 ^ v17 ^ [(IFTSchemaIFTActionResolverRequest *)self->_actionResolverRequestCreated hash];
  unint64_t v19 = [(IFTSchemaIFTResponseGenerationRequest *)self->_responseGenerationRequest hash];
  unint64_t v20 = v19 ^ [(IFTSchemaIFTActionCancellation *)self->_actionCancelled hash];
  unint64_t v21 = v20 ^ [(IFTSchemaIFTContinuePlanning *)self->_continuePlanning hash];
  unint64_t v22 = v21 ^ [(IFTSchemaIFTAction *)self->_actionCreated hash];
  unint64_t v23 = v22 ^ [(IFTSchemaIFTClientAction *)self->_clientActionCreated hash];
  unint64_t v24 = v18 ^ v23 ^ [(IFTSchemaIFTQueryStepResults *)self->_queriesExecuted hash];
  unint64_t v25 = [(IFTSchemaIFTStatementResult *)self->_statementEvaluated hash];
  unint64_t v26 = v25 ^ [(IFTSchemaIFTSystemResponse *)self->_systemResponseGenerated hash];
  unint64_t v27 = v26 ^ [(IFTSchemaIFTSessionError *)self->_criticalError hash];
  unint64_t v28 = v27 ^ [(IFTSchemaIFTRecoverableError *)self->_recoverableError hash];
  return v24 ^ v28 ^ [(IFTSchemaIFTQueryDecorationResult *)self->_queryDecorationResult hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_138;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_138;
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v8 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
  unint64_t v7 = [v4 contextPrewarmRequest];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v13 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
    unint64_t v16 = [v4 contextPrewarmRequest];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
  unint64_t v7 = [v4 contextPrewarmCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v18 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
    unint64_t v21 = [v4 contextPrewarmCompleted];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self terminate];
  unint64_t v7 = [v4 terminate];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v23 = [(IFTSchemaIFTClientEvent *)self terminate];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(IFTSchemaIFTClientEvent *)self terminate];
    unint64_t v26 = [v4 terminate];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self sessionStart];
  unint64_t v7 = [v4 sessionStart];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v28 = [(IFTSchemaIFTClientEvent *)self sessionStart];
  if (v28)
  {
    int v29 = (void *)v28;
    uint64_t v30 = [(IFTSchemaIFTClientEvent *)self sessionStart];
    v31 = [v4 sessionStart];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self request];
  unint64_t v7 = [v4 request];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v33 = [(IFTSchemaIFTClientEvent *)self request];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    int v35 = [(IFTSchemaIFTClientEvent *)self request];
    uint64_t v36 = [v4 request];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
  unint64_t v7 = [v4 requestContextTextContentTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v38 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
  if (v38)
  {
    v39 = (void *)v38;
    uint64_t v40 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
    int v41 = [v4 requestContextTextContentTier1];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
  unint64_t v7 = [v4 entitySpanMatched];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v43 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    v45 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
    v46 = [v4 entitySpanMatched];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
  unint64_t v7 = [v4 contextRetrieved];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v48 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
    v51 = [v4 contextRetrieved];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
  unint64_t v7 = [v4 toolsRetrieved];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v53 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
    int v56 = [v4 toolsRetrieved];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self planCreated];
  unint64_t v7 = [v4 planCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v58 = [(IFTSchemaIFTClientEvent *)self planCreated];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(IFTSchemaIFTClientEvent *)self planCreated];
    v61 = [v4 planCreated];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
  unint64_t v7 = [v4 astFlatExprSearchVariantTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v63 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
    v66 = [v4 astFlatExprSearchVariantTier1];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self variablesSet];
  unint64_t v7 = [v4 variablesSet];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v68 = [(IFTSchemaIFTClientEvent *)self variablesSet];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(IFTSchemaIFTClientEvent *)self variablesSet];
    int v71 = [v4 variablesSet];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self toolResolution];
  unint64_t v7 = [v4 toolResolution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v73 = [(IFTSchemaIFTClientEvent *)self toolResolution];
  if (v73)
  {
    int v74 = (void *)v73;
    v75 = [(IFTSchemaIFTClientEvent *)self toolResolution];
    v76 = [v4 toolResolution];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
  unint64_t v7 = [v4 queriesCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v78 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
  if (v78)
  {
    v79 = (void *)v78;
    int v80 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
    v81 = [v4 queriesCreated];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
  unint64_t v7 = [v4 actionResolverRequestCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v83 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
  if (v83)
  {
    v84 = (void *)v83;
    id v85 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
    int v86 = [v4 actionResolverRequestCreated];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
  unint64_t v7 = [v4 responseGenerationRequest];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v88 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
  if (v88)
  {
    objc_super v89 = (void *)v88;
    v90 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
    v91 = [v4 responseGenerationRequest];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
  unint64_t v7 = [v4 actionCancelled];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v93 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
    v96 = [v4 actionCancelled];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
  unint64_t v7 = [v4 continuePlanning];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v98 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
    v101 = [v4 continuePlanning];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self actionCreated];
  unint64_t v7 = [v4 actionCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v103 = [(IFTSchemaIFTClientEvent *)self actionCreated];
  if (v103)
  {
    v104 = (void *)v103;
    v105 = [(IFTSchemaIFTClientEvent *)self actionCreated];
    v106 = [v4 actionCreated];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
  unint64_t v7 = [v4 clientActionCreated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v108 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
  if (v108)
  {
    v109 = (void *)v108;
    v110 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
    v111 = [v4 clientActionCreated];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
  unint64_t v7 = [v4 queriesExecuted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v113 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
  if (v113)
  {
    v114 = (void *)v113;
    v115 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
    v116 = [v4 queriesExecuted];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
  unint64_t v7 = [v4 statementEvaluated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v118 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
    v121 = [v4 statementEvaluated];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
  unint64_t v7 = [v4 systemResponseGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v123 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
  if (v123)
  {
    v124 = (void *)v123;
    v125 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
    v126 = [v4 systemResponseGenerated];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self criticalError];
  unint64_t v7 = [v4 criticalError];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v128 = [(IFTSchemaIFTClientEvent *)self criticalError];
  if (v128)
  {
    v129 = (void *)v128;
    v130 = [(IFTSchemaIFTClientEvent *)self criticalError];
    v131 = [v4 criticalError];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self recoverableError];
  unint64_t v7 = [v4 recoverableError];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_137;
  }
  uint64_t v133 = [(IFTSchemaIFTClientEvent *)self recoverableError];
  if (v133)
  {
    v134 = (void *)v133;
    v135 = [(IFTSchemaIFTClientEvent *)self recoverableError];
    v136 = [v4 recoverableError];
    int v137 = [v135 isEqual:v136];

    if (!v137) {
      goto LABEL_138;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
  unint64_t v7 = [v4 queryDecorationResult];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v138 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
    if (!v138)
    {

LABEL_141:
      BOOL v143 = 1;
      goto LABEL_139;
    }
    v139 = (void *)v138;
    v140 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
    v141 = [v4 queryDecorationResult];
    char v142 = [v140 isEqual:v141];

    if (v142) {
      goto LABEL_141;
    }
  }
  else
  {
LABEL_137:
  }
LABEL_138:
  BOOL v143 = 0;
LABEL_139:

  return v143;
}

- (void)writeTo:(id)a3
{
  id v58 = a3;
  id v4 = [(IFTSchemaIFTClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];

  if (v6)
  {
    unint64_t v7 = [(IFTSchemaIFTClientEvent *)self contextPrewarmRequest];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];

  if (v8)
  {
    unint64_t v9 = [(IFTSchemaIFTClientEvent *)self contextPrewarmCompleted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(IFTSchemaIFTClientEvent *)self terminate];

  if (v10)
  {
    unint64_t v11 = [(IFTSchemaIFTClientEvent *)self terminate];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(IFTSchemaIFTClientEvent *)self sessionStart];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTClientEvent *)self sessionStart];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(IFTSchemaIFTClientEvent *)self request];

  if (v14)
  {
    unint64_t v15 = [(IFTSchemaIFTClientEvent *)self request];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];

  if (v16)
  {
    int v17 = [(IFTSchemaIFTClientEvent *)self requestContextTextContentTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];

  if (v18)
  {
    unint64_t v19 = [(IFTSchemaIFTClientEvent *)self entitySpanMatched];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];

  if (v20)
  {
    unint64_t v21 = [(IFTSchemaIFTClientEvent *)self contextRetrieved];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];

  if (v22)
  {
    uint64_t v23 = [(IFTSchemaIFTClientEvent *)self toolsRetrieved];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(IFTSchemaIFTClientEvent *)self planCreated];

  if (v24)
  {
    unint64_t v25 = [(IFTSchemaIFTClientEvent *)self planCreated];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v26 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];

  if (v26)
  {
    int v27 = [(IFTSchemaIFTClientEvent *)self astFlatExprSearchVariantTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(IFTSchemaIFTClientEvent *)self variablesSet];

  if (v28)
  {
    int v29 = [(IFTSchemaIFTClientEvent *)self variablesSet];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v30 = [(IFTSchemaIFTClientEvent *)self toolResolution];

  if (v30)
  {
    v31 = [(IFTSchemaIFTClientEvent *)self toolResolution];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(IFTSchemaIFTClientEvent *)self queriesCreated];

  if (v32)
  {
    uint64_t v33 = [(IFTSchemaIFTClientEvent *)self queriesCreated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v34 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];

  if (v34)
  {
    int v35 = [(IFTSchemaIFTClientEvent *)self actionResolverRequestCreated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v36 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];

  if (v36)
  {
    int v37 = [(IFTSchemaIFTClientEvent *)self responseGenerationRequest];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(IFTSchemaIFTClientEvent *)self actionCancelled];

  if (v38)
  {
    v39 = [(IFTSchemaIFTClientEvent *)self actionCancelled];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v40 = [(IFTSchemaIFTClientEvent *)self continuePlanning];

  if (v40)
  {
    int v41 = [(IFTSchemaIFTClientEvent *)self continuePlanning];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(IFTSchemaIFTClientEvent *)self actionCreated];

  if (v42)
  {
    uint64_t v43 = [(IFTSchemaIFTClientEvent *)self actionCreated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v44 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];

  if (v44)
  {
    v45 = [(IFTSchemaIFTClientEvent *)self clientActionCreated];
    PBDataWriterWriteSubmessage();
  }
  v46 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];

  if (v46)
  {
    int v47 = [(IFTSchemaIFTClientEvent *)self queriesExecuted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];

  if (v48)
  {
    v49 = [(IFTSchemaIFTClientEvent *)self statementEvaluated];
    PBDataWriterWriteSubmessage();
  }
  int v50 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];

  if (v50)
  {
    v51 = [(IFTSchemaIFTClientEvent *)self systemResponseGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v52 = [(IFTSchemaIFTClientEvent *)self criticalError];

  if (v52)
  {
    uint64_t v53 = [(IFTSchemaIFTClientEvent *)self criticalError];
    PBDataWriterWriteSubmessage();
  }
  v54 = [(IFTSchemaIFTClientEvent *)self recoverableError];

  if (v54)
  {
    v55 = [(IFTSchemaIFTClientEvent *)self recoverableError];
    PBDataWriterWriteSubmessage();
  }
  int v56 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];

  if (v56)
  {
    int v57 = [(IFTSchemaIFTClientEvent *)self queryDecorationResult];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteQueryDecorationResult
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_queryDecorationResult = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTQueryDecorationResult)queryDecorationResult
{
  if (self->_whichEvent_Type == 121) {
    v2 = self->_queryDecorationResult;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setQueryDecorationResult:(id)a3
{
  id v4 = (IFTSchemaIFTQueryDecorationResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  unint64_t v30 = 121;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = v4;
}

- (void)deleteRecoverableError
{
  if (self->_whichEvent_Type == 125)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_recoverableError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRecoverableError)recoverableError
{
  if (self->_whichEvent_Type == 125) {
    v2 = self->_recoverableError;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRecoverableError:(id)a3
{
  id v4 = (IFTSchemaIFTRecoverableError *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 125;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  recoverableError = self->_recoverableError;
  self->_recoverableError = v4;
}

- (void)deleteCriticalError
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_criticalError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSessionError)criticalError
{
  if (self->_whichEvent_Type == 120) {
    v2 = self->_criticalError;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCriticalError:(id)a3
{
  id v4 = (IFTSchemaIFTSessionError *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 120;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  criticalError = self->_criticalError;
  self->_criticalError = v4;
}

- (void)deleteSystemResponseGenerated
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_systemResponseGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSystemResponse)systemResponseGenerated
{
  if (self->_whichEvent_Type == 119) {
    v2 = self->_systemResponseGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSystemResponseGenerated:(id)a3
{
  id v4 = (IFTSchemaIFTSystemResponse *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 119;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = v4;
}

- (void)deleteStatementEvaluated
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_statementEvaluated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTStatementResult)statementEvaluated
{
  if (self->_whichEvent_Type == 118) {
    v2 = self->_statementEvaluated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStatementEvaluated:(id)a3
{
  id v4 = (IFTSchemaIFTStatementResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 118;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = v4;
}

- (void)deleteQueriesExecuted
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_queriesExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTQueryStepResults)queriesExecuted
{
  if (self->_whichEvent_Type == 117) {
    v2 = self->_queriesExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setQueriesExecuted:(id)a3
{
  id v4 = (IFTSchemaIFTQueryStepResults *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 117;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = v4;
}

- (void)deleteClientActionCreated
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_clientActionCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTClientAction)clientActionCreated
{
  if (self->_whichEvent_Type == 116) {
    v2 = self->_clientActionCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setClientActionCreated:(id)a3
{
  id v4 = (IFTSchemaIFTClientAction *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 116;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = v4;
}

- (void)deleteActionCreated
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTAction)actionCreated
{
  if (self->_whichEvent_Type == 115) {
    v2 = self->_actionCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionCreated:(id)a3
{
  id v4 = (IFTSchemaIFTAction *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 115;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  actionCreated = self->_actionCreated;
  self->_actionCreated = v4;
}

- (void)deleteContinuePlanning
{
  if (self->_whichEvent_Type == 124)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_continuePlanning = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTContinuePlanning)continuePlanning
{
  if (self->_whichEvent_Type == 124) {
    v2 = self->_continuePlanning;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContinuePlanning:(id)a3
{
  id v4 = (IFTSchemaIFTContinuePlanning *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 124;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = v4;
}

- (void)deleteActionCancelled
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionCancelled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionCancellation)actionCancelled
{
  if (self->_whichEvent_Type == 114) {
    v2 = self->_actionCancelled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionCancelled:(id)a3
{
  id v4 = (IFTSchemaIFTActionCancellation *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 114;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = v4;
}

- (void)deleteResponseGenerationRequest
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_responseGenerationRequest = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTResponseGenerationRequest)responseGenerationRequest
{
  if (self->_whichEvent_Type == 113) {
    v2 = self->_responseGenerationRequest;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResponseGenerationRequest:(id)a3
{
  id v4 = (IFTSchemaIFTResponseGenerationRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 113;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = v4;
}

- (void)deleteActionResolverRequestCreated
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_actionResolverRequestCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTActionResolverRequest)actionResolverRequestCreated
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_actionResolverRequestCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setActionResolverRequestCreated:(id)a3
{
  id v4 = (IFTSchemaIFTActionResolverRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 112;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = v4;
}

- (void)deleteQueriesCreated
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_queriesCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTQueryStep)queriesCreated
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_queriesCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setQueriesCreated:(id)a3
{
  id v4 = (IFTSchemaIFTQueryStep *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 111;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = v4;
}

- (void)deleteToolResolution
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_toolResolution = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTToolResolution)toolResolution
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_toolResolution;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setToolResolution:(id)a3
{
  id v4 = (IFTSchemaIFTToolResolution *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 110;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  toolResolution = self->_toolResolution;
  self->_toolResolution = v4;
}

- (void)deleteVariablesSet
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_variablesSet = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTVariableStep)variablesSet
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_variablesSet;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVariablesSet:(id)a3
{
  id v4 = (IFTSchemaIFTVariableStep *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 109;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  variablesSet = self->_variablesSet;
  self->_variablesSet = v4;
}

- (void)deleteAstFlatExprSearchVariantTier1
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_astFlatExprSearchVariantTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprSearchVariantTier1)astFlatExprSearchVariantTier1
{
  if (self->_whichEvent_Type == 123) {
    v2 = self->_astFlatExprSearchVariantTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAstFlatExprSearchVariantTier1:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprSearchVariantTier1 *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 123;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = v4;
}

- (void)deletePlanCreated
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_planCreated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPlan)planCreated
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_planCreated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlanCreated:(id)a3
{
  id v4 = (IFTSchemaIFTPlan *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 108;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  planCreated = self->_planCreated;
  self->_planCreated = v4;
}

- (void)deleteToolsRetrieved
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_toolsRetrieved = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTToolRetrievalResponse)toolsRetrieved
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_toolsRetrieved;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setToolsRetrieved:(id)a3
{
  id v4 = (IFTSchemaIFTToolRetrievalResponse *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 107;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = v4;
}

- (void)deleteContextRetrieved
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contextRetrieved = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTContextRetrieved)contextRetrieved
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_contextRetrieved;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContextRetrieved:(id)a3
{
  id v4 = (IFTSchemaIFTContextRetrieved *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 106;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = v4;
}

- (void)deleteEntitySpanMatched
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entitySpanMatched = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTEntitySpanMatchResult)entitySpanMatched
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_entitySpanMatched;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntitySpanMatched:(id)a3
{
  id v4 = (IFTSchemaIFTEntitySpanMatchResult *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 105;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = v4;
}

- (void)deleteRequestContextTextContentTier1
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContextTextContentTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequestContentTextContentTier1)requestContextTextContentTier1
{
  if (self->_whichEvent_Type == 122) {
    v2 = self->_requestContextTextContentTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestContextTextContentTier1:(id)a3
{
  id v4 = (IFTSchemaIFTRequestContentTextContentTier1 *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 122;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = v4;
}

- (void)deleteRequest
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_request = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRequest)request
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_request;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequest:(id)a3
{
  id v4 = (IFTSchemaIFTRequest *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 104;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  request = self->_request;
  self->_request = v4;
}

- (void)deleteSessionStart
{
  if (self->_whichEvent_Type == 126)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sessionStart = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSessionStart)sessionStart
{
  if (self->_whichEvent_Type == 126) {
    v2 = self->_sessionStart;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSessionStart:(id)a3
{
  id v4 = (IFTSchemaIFTSessionStart *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 126;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  sessionStart = self->_sessionStart;
  self->_sessionStart = v4;
}

- (void)deleteTerminate
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_terminate = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTTerminate)terminate
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_terminate;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTerminate:(id)a3
{
  id v4 = (IFTSchemaIFTTerminate *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 103;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  terminate = self->_terminate;
  self->_terminate = v4;
}

- (void)deleteContextPrewarmCompleted
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contextPrewarmCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTContextPrewarmCompleted)contextPrewarmCompleted
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_contextPrewarmCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContextPrewarmCompleted:(id)a3
{
  id v4 = (IFTSchemaIFTContextPrewarmCompleted *)a3;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 102;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = v4;
}

- (void)deleteContextPrewarmRequest
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contextPrewarmRequest = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTContextPrewarmRequest)contextPrewarmRequest
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_contextPrewarmRequest;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContextPrewarmRequest:(id)a3
{
  id v4 = (IFTSchemaIFTContextPrewarmRequest *)a3;
  contextPrewarmCompleted = self->_contextPrewarmCompleted;
  self->_contextPrewarmCompleted = 0;

  terminate = self->_terminate;
  self->_terminate = 0;

  sessionStart = self->_sessionStart;
  self->_sessionStart = 0;

  request = self->_request;
  self->_request = 0;

  requestContextTextContentTier1 = self->_requestContextTextContentTier1;
  self->_requestContextTextContentTier1 = 0;

  entitySpanMatched = self->_entitySpanMatched;
  self->_entitySpanMatched = 0;

  contextRetrieved = self->_contextRetrieved;
  self->_contextRetrieved = 0;

  toolsRetrieved = self->_toolsRetrieved;
  self->_toolsRetrieved = 0;

  planCreated = self->_planCreated;
  self->_planCreated = 0;

  astFlatExprSearchVariantTier1 = self->_astFlatExprSearchVariantTier1;
  self->_astFlatExprSearchVariantTier1 = 0;

  variablesSet = self->_variablesSet;
  self->_variablesSet = 0;

  toolResolution = self->_toolResolution;
  self->_toolResolution = 0;

  queriesCreated = self->_queriesCreated;
  self->_queriesCreated = 0;

  actionResolverRequestCreated = self->_actionResolverRequestCreated;
  self->_actionResolverRequestCreated = 0;

  responseGenerationRequest = self->_responseGenerationRequest;
  self->_responseGenerationRequest = 0;

  actionCancelled = self->_actionCancelled;
  self->_actionCancelled = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  actionCreated = self->_actionCreated;
  self->_actionCreated = 0;

  clientActionCreated = self->_clientActionCreated;
  self->_clientActionCreated = 0;

  queriesExecuted = self->_queriesExecuted;
  self->_queriesExecuted = 0;

  statementEvaluated = self->_statementEvaluated;
  self->_statementEvaluated = 0;

  systemResponseGenerated = self->_systemResponseGenerated;
  self->_systemResponseGenerated = 0;

  criticalError = self->_criticalError;
  self->_criticalError = 0;

  recoverableError = self->_recoverableError;
  self->_recoverableError = 0;

  queryDecorationResult = self->_queryDecorationResult;
  self->_queryDecorationResult = 0;

  unint64_t v30 = 101;
  if (!v4) {
    unint64_t v30 = 0;
  }
  self->_unint64_t whichEvent_Type = v30;
  contextPrewarmRequest = self->_contextPrewarmRequest;
  self->_contextPrewarmRequest = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(IFTSchemaIFTClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x19) {
    return @"com.apple.aiml.siri.ift.IFTClientEvent";
  }
  else {
    return off_1E5EBE978[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 89;
}

@end