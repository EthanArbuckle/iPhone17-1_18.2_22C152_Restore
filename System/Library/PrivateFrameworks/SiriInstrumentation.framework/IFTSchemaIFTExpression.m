@interface IFTSchemaIFTExpression
- (BOOL)hasCall;
- (BOOL)hasCancel;
- (BOOL)hasConfirm;
- (BOOL)hasContinuePlanning;
- (BOOL)hasDot;
- (BOOL)hasEndOfPlan;
- (BOOL)hasExplicitResolutionRequest;
- (BOOL)hasGetMentionedApps;
- (BOOL)hasIndex;
- (BOOL)hasInfix;
- (BOOL)hasNoMatchingTool;
- (BOOL)hasOpen;
- (BOOL)hasPick;
- (BOOL)hasPickOne;
- (BOOL)hasPrefix;
- (BOOL)hasReject;
- (BOOL)hasResolveTool;
- (BOOL)hasSay;
- (BOOL)hasSearch;
- (BOOL)hasStatementId;
- (BOOL)hasUndo;
- (BOOL)hasUpdateParameters;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCallExpression)call;
- (IFTSchemaIFTCancelExpression)cancel;
- (IFTSchemaIFTConfirmExpression)confirm;
- (IFTSchemaIFTContinuePlanningExpression)continuePlanning;
- (IFTSchemaIFTDotExpression)dot;
- (IFTSchemaIFTEndOfPlanExpression)endOfPlan;
- (IFTSchemaIFTExplicitResolutionRequest)explicitResolutionRequest;
- (IFTSchemaIFTExpression)initWithDictionary:(id)a3;
- (IFTSchemaIFTExpression)initWithJSON:(id)a3;
- (IFTSchemaIFTGetMentionedAppsExpression)getMentionedApps;
- (IFTSchemaIFTIndexExpression)index;
- (IFTSchemaIFTInfixExpression)infix;
- (IFTSchemaIFTNoMatchingToolExpression)noMatchingTool;
- (IFTSchemaIFTOpenExpression)open;
- (IFTSchemaIFTPickExpression)pick;
- (IFTSchemaIFTPickOneExpression)pickOne;
- (IFTSchemaIFTPrefixExpression)prefix;
- (IFTSchemaIFTRejectExpression)reject;
- (IFTSchemaIFTResolveToolExpression)resolveTool;
- (IFTSchemaIFTSayExpression)say;
- (IFTSchemaIFTSearchExpression)search;
- (IFTSchemaIFTStatementId)statementId;
- (IFTSchemaIFTUndoExpression)undo;
- (IFTSchemaIFTUpdateParametersExpression)updateParameters;
- (IFTSchemaIFTValueExpression)value;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Expression;
- (void)deleteCall;
- (void)deleteCancel;
- (void)deleteConfirm;
- (void)deleteContinuePlanning;
- (void)deleteDot;
- (void)deleteEndOfPlan;
- (void)deleteExplicitResolutionRequest;
- (void)deleteGetMentionedApps;
- (void)deleteIndex;
- (void)deleteInfix;
- (void)deleteNoMatchingTool;
- (void)deleteOpen;
- (void)deletePick;
- (void)deletePickOne;
- (void)deletePrefix;
- (void)deleteReject;
- (void)deleteResolveTool;
- (void)deleteSay;
- (void)deleteSearch;
- (void)deleteStatementId;
- (void)deleteUndo;
- (void)deleteUpdateParameters;
- (void)deleteValue;
- (void)setCall:(id)a3;
- (void)setCancel:(id)a3;
- (void)setConfirm:(id)a3;
- (void)setContinuePlanning:(id)a3;
- (void)setDot:(id)a3;
- (void)setEndOfPlan:(id)a3;
- (void)setExplicitResolutionRequest:(id)a3;
- (void)setGetMentionedApps:(id)a3;
- (void)setHasCall:(BOOL)a3;
- (void)setHasCancel:(BOOL)a3;
- (void)setHasConfirm:(BOOL)a3;
- (void)setHasContinuePlanning:(BOOL)a3;
- (void)setHasDot:(BOOL)a3;
- (void)setHasEndOfPlan:(BOOL)a3;
- (void)setHasExplicitResolutionRequest:(BOOL)a3;
- (void)setHasGetMentionedApps:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasInfix:(BOOL)a3;
- (void)setHasNoMatchingTool:(BOOL)a3;
- (void)setHasOpen:(BOOL)a3;
- (void)setHasPick:(BOOL)a3;
- (void)setHasPickOne:(BOOL)a3;
- (void)setHasPrefix:(BOOL)a3;
- (void)setHasReject:(BOOL)a3;
- (void)setHasResolveTool:(BOOL)a3;
- (void)setHasSay:(BOOL)a3;
- (void)setHasSearch:(BOOL)a3;
- (void)setHasStatementId:(BOOL)a3;
- (void)setHasUndo:(BOOL)a3;
- (void)setHasUpdateParameters:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setInfix:(id)a3;
- (void)setNoMatchingTool:(id)a3;
- (void)setOpen:(id)a3;
- (void)setPick:(id)a3;
- (void)setPickOne:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setReject:(id)a3;
- (void)setResolveTool:(id)a3;
- (void)setSay:(id)a3;
- (void)setSearch:(id)a3;
- (void)setStatementId:(id)a3;
- (void)setUndo:(id)a3;
- (void)setUpdateParameters:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTExpression

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)IFTSchemaIFTExpression;
  v5 = [(SISchemaInstrumentationMessage *)&v76 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTExpression *)self value];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTExpression *)self deleteValue];
  }
  v9 = [(IFTSchemaIFTExpression *)self statementId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTExpression *)self deleteStatementId];
  }
  v12 = [(IFTSchemaIFTExpression *)self prefix];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTExpression *)self deletePrefix];
  }
  v15 = [(IFTSchemaIFTExpression *)self infix];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTExpression *)self deleteInfix];
  }
  v18 = [(IFTSchemaIFTExpression *)self dot];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTExpression *)self deleteDot];
  }
  v21 = [(IFTSchemaIFTExpression *)self index];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTExpression *)self deleteIndex];
  }
  v24 = [(IFTSchemaIFTExpression *)self updateParameters];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(IFTSchemaIFTExpression *)self deleteUpdateParameters];
  }
  v27 = [(IFTSchemaIFTExpression *)self call];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(IFTSchemaIFTExpression *)self deleteCall];
  }
  v30 = [(IFTSchemaIFTExpression *)self say];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(IFTSchemaIFTExpression *)self deleteSay];
  }
  v33 = [(IFTSchemaIFTExpression *)self pick];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(IFTSchemaIFTExpression *)self deletePick];
  }
  v36 = [(IFTSchemaIFTExpression *)self confirm];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(IFTSchemaIFTExpression *)self deleteConfirm];
  }
  v39 = [(IFTSchemaIFTExpression *)self search];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(IFTSchemaIFTExpression *)self deleteSearch];
  }
  v42 = [(IFTSchemaIFTExpression *)self pickOne];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(IFTSchemaIFTExpression *)self deletePickOne];
  }
  v45 = [(IFTSchemaIFTExpression *)self resolveTool];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(IFTSchemaIFTExpression *)self deleteResolveTool];
  }
  v48 = [(IFTSchemaIFTExpression *)self undo];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(IFTSchemaIFTExpression *)self deleteUndo];
  }
  v51 = [(IFTSchemaIFTExpression *)self reject];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(IFTSchemaIFTExpression *)self deleteReject];
  }
  v54 = [(IFTSchemaIFTExpression *)self cancel];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(IFTSchemaIFTExpression *)self deleteCancel];
  }
  v57 = [(IFTSchemaIFTExpression *)self noMatchingTool];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(IFTSchemaIFTExpression *)self deleteNoMatchingTool];
  }
  v60 = [(IFTSchemaIFTExpression *)self continuePlanning];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(IFTSchemaIFTExpression *)self deleteContinuePlanning];
  }
  v63 = [(IFTSchemaIFTExpression *)self endOfPlan];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(IFTSchemaIFTExpression *)self deleteEndOfPlan];
  }
  v66 = [(IFTSchemaIFTExpression *)self getMentionedApps];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(IFTSchemaIFTExpression *)self deleteGetMentionedApps];
  }
  v69 = [(IFTSchemaIFTExpression *)self open];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(IFTSchemaIFTExpression *)self deleteOpen];
  }
  v72 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(IFTSchemaIFTExpression *)self deleteExplicitResolutionRequest];
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
  objc_storeStrong((id *)&self->_explicitResolutionRequest, 0);
  objc_storeStrong((id *)&self->_open, 0);
  objc_storeStrong((id *)&self->_getMentionedApps, 0);
  objc_storeStrong((id *)&self->_endOfPlan, 0);
  objc_storeStrong((id *)&self->_continuePlanning, 0);
  objc_storeStrong((id *)&self->_noMatchingTool, 0);
  objc_storeStrong((id *)&self->_cancel, 0);
  objc_storeStrong((id *)&self->_reject, 0);
  objc_storeStrong((id *)&self->_undo, 0);
  objc_storeStrong((id *)&self->_resolveTool, 0);
  objc_storeStrong((id *)&self->_pickOne, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_confirm, 0);
  objc_storeStrong((id *)&self->_pick, 0);
  objc_storeStrong((id *)&self->_say, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_dot, 0);
  objc_storeStrong((id *)&self->_infix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setHasExplicitResolutionRequest:(BOOL)a3
{
  self->_hasExplicitResolutionRequest = a3;
}

- (BOOL)hasExplicitResolutionRequest
{
  return self->_hasExplicitResolutionRequest;
}

- (void)setHasOpen:(BOOL)a3
{
  self->_hasOpen = a3;
}

- (BOOL)hasOpen
{
  return self->_hasOpen;
}

- (void)setHasGetMentionedApps:(BOOL)a3
{
  self->_hasGetMentionedApps = a3;
}

- (BOOL)hasGetMentionedApps
{
  return self->_hasGetMentionedApps;
}

- (void)setHasEndOfPlan:(BOOL)a3
{
  self->_hasEndOfPlan = a3;
}

- (BOOL)hasEndOfPlan
{
  return self->_hasEndOfPlan;
}

- (void)setHasContinuePlanning:(BOOL)a3
{
  self->_hasContinuePlanning = a3;
}

- (BOOL)hasContinuePlanning
{
  return self->_hasContinuePlanning;
}

- (void)setHasNoMatchingTool:(BOOL)a3
{
  self->_hasNoMatchingTool = a3;
}

- (BOOL)hasNoMatchingTool
{
  return self->_hasNoMatchingTool;
}

- (void)setHasCancel:(BOOL)a3
{
  self->_hasCancel = a3;
}

- (BOOL)hasCancel
{
  return self->_hasCancel;
}

- (void)setHasReject:(BOOL)a3
{
  self->_hasReject = a3;
}

- (BOOL)hasReject
{
  return self->_hasReject;
}

- (void)setHasUndo:(BOOL)a3
{
  self->_hasUndo = a3;
}

- (BOOL)hasUndo
{
  return self->_hasUndo;
}

- (void)setHasResolveTool:(BOOL)a3
{
  self->_hasResolveTool = a3;
}

- (BOOL)hasResolveTool
{
  return self->_hasResolveTool;
}

- (void)setHasPickOne:(BOOL)a3
{
  self->_hasPickOne = a3;
}

- (BOOL)hasPickOne
{
  return self->_hasPickOne;
}

- (void)setHasSearch:(BOOL)a3
{
  self->_hasSearch = a3;
}

- (BOOL)hasSearch
{
  return self->_hasSearch;
}

- (void)setHasConfirm:(BOOL)a3
{
  self->_hasConfirm = a3;
}

- (BOOL)hasConfirm
{
  return self->_hasConfirm;
}

- (void)setHasPick:(BOOL)a3
{
  self->_hasPick = a3;
}

- (BOOL)hasPick
{
  return self->_hasPick;
}

- (void)setHasSay:(BOOL)a3
{
  self->_hasSay = a3;
}

- (BOOL)hasSay
{
  return self->_hasSay;
}

- (void)setHasCall:(BOOL)a3
{
  self->_hasCall = a3;
}

- (BOOL)hasCall
{
  return self->_hasCall;
}

- (void)setHasUpdateParameters:(BOOL)a3
{
  self->_hasUpdateParameters = a3;
}

- (BOOL)hasUpdateParameters
{
  return self->_hasUpdateParameters;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (void)setHasDot:(BOOL)a3
{
  self->_hasDot = a3;
}

- (BOOL)hasDot
{
  return self->_hasDot;
}

- (void)setHasInfix:(BOOL)a3
{
  self->_hasInfix = a3;
}

- (BOOL)hasInfix
{
  return self->_hasInfix;
}

- (void)setHasPrefix:(BOOL)a3
{
  self->_hasPrefix = a3;
}

- (BOOL)hasPrefix
{
  return self->_hasPrefix;
}

- (void)setHasStatementId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (BOOL)hasStatementId
{
  return self->_hasStatementId;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (unint64_t)whichOneof_Expression
{
  return self->_whichOneof_Expression;
}

- (IFTSchemaIFTExpression)initWithDictionary:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)IFTSchemaIFTExpression;
  v5 = [(IFTSchemaIFTExpression *)&v70 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTValueExpression alloc] initWithDictionary:v6];
      [(IFTSchemaIFTExpression *)v5 setValue:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"statementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v8];
      [(IFTSchemaIFTExpression *)v5 setStatementId:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"prefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTPrefixExpression alloc] initWithDictionary:v10];
      [(IFTSchemaIFTExpression *)v5 setPrefix:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"infix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTInfixExpression alloc] initWithDictionary:v12];
      [(IFTSchemaIFTExpression *)v5 setInfix:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"dot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaIFTDotExpression alloc] initWithDictionary:v14];
      [(IFTSchemaIFTExpression *)v5 setDot:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTIndexExpression alloc] initWithDictionary:v16];
      [(IFTSchemaIFTExpression *)v5 setIndex:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"updateParameters"];
    objc_opt_class();
    v69 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[IFTSchemaIFTUpdateParametersExpression alloc] initWithDictionary:v18];
      [(IFTSchemaIFTExpression *)v5 setUpdateParameters:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"call"];
    objc_opt_class();
    int v68 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[IFTSchemaIFTCallExpression alloc] initWithDictionary:v20];
      [(IFTSchemaIFTExpression *)v5 setCall:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"say"];
    objc_opt_class();
    v67 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[IFTSchemaIFTSayExpression alloc] initWithDictionary:v22];
      [(IFTSchemaIFTExpression *)v5 setSay:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"pick"];
    objc_opt_class();
    v66 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[IFTSchemaIFTPickExpression alloc] initWithDictionary:v24];
      [(IFTSchemaIFTExpression *)v5 setPick:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"confirm"];
    objc_opt_class();
    int v65 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[IFTSchemaIFTConfirmExpression alloc] initWithDictionary:v26];
      [(IFTSchemaIFTExpression *)v5 setConfirm:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"search"];
    objc_opt_class();
    v64 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[IFTSchemaIFTSearchExpression alloc] initWithDictionary:v28];
      [(IFTSchemaIFTExpression *)v5 setSearch:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"pickOne"];
    objc_opt_class();
    v63 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[IFTSchemaIFTPickOneExpression alloc] initWithDictionary:v30];
      [(IFTSchemaIFTExpression *)v5 setPickOne:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"resolveTool"];
    objc_opt_class();
    int v62 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[IFTSchemaIFTResolveToolExpression alloc] initWithDictionary:v32];
      [(IFTSchemaIFTExpression *)v5 setResolveTool:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"undo"];
    objc_opt_class();
    v61 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[IFTSchemaIFTUndoExpression alloc] initWithDictionary:v34];
      [(IFTSchemaIFTExpression *)v5 setUndo:v35];
    }
    v60 = (void *)v6;
    uint64_t v36 = [v4 objectForKeyedSubscript:@"reject"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[IFTSchemaIFTRejectExpression alloc] initWithDictionary:v36];
      [(IFTSchemaIFTExpression *)v5 setReject:v37];
    }
    int v59 = (void *)v8;
    int v38 = objc_msgSend(v4, "objectForKeyedSubscript:", @"cancel", v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[IFTSchemaIFTCancelExpression alloc] initWithDictionary:v38];
      [(IFTSchemaIFTExpression *)v5 setCancel:v39];
    }
    v58 = (void *)v10;
    v40 = [v4 objectForKeyedSubscript:@"noMatchingTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[IFTSchemaIFTNoMatchingToolExpression alloc] initWithDictionary:v40];
      [(IFTSchemaIFTExpression *)v5 setNoMatchingTool:v41];
    }
    v57 = (void *)v12;
    v42 = [v4 objectForKeyedSubscript:@"continuePlanning"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[IFTSchemaIFTContinuePlanningExpression alloc] initWithDictionary:v42];
      [(IFTSchemaIFTExpression *)v5 setContinuePlanning:v43];
    }
    int v56 = (void *)v14;
    int v44 = [v4 objectForKeyedSubscript:@"endOfPlan"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[IFTSchemaIFTEndOfPlanExpression alloc] initWithDictionary:v44];
      [(IFTSchemaIFTExpression *)v5 setEndOfPlan:v45];
    }
    v55 = (void *)v16;
    v46 = [v4 objectForKeyedSubscript:@"getMentionedApps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[IFTSchemaIFTGetMentionedAppsExpression alloc] initWithDictionary:v46];
      [(IFTSchemaIFTExpression *)v5 setGetMentionedApps:v47];
    }
    v48 = [v4 objectForKeyedSubscript:@"open"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[IFTSchemaIFTOpenExpression alloc] initWithDictionary:v48];
      [(IFTSchemaIFTExpression *)v5 setOpen:v49];
    }
    int v50 = [v4 objectForKeyedSubscript:@"explicitResolutionRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = [[IFTSchemaIFTExplicitResolutionRequest alloc] initWithDictionary:v50];
      [(IFTSchemaIFTExpression *)v5 setExplicitResolutionRequest:v51];
    }
    v52 = v5;
  }
  return v5;
}

- (IFTSchemaIFTExpression)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTExpression *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTExpression *)self dictionaryRepresentation];
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
  if (self->_call)
  {
    id v4 = [(IFTSchemaIFTExpression *)self call];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"call"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"call"];
    }
  }
  if (self->_cancel)
  {
    uint64_t v7 = [(IFTSchemaIFTExpression *)self cancel];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"cancel"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"cancel"];
    }
  }
  if (self->_confirm)
  {
    uint64_t v10 = [(IFTSchemaIFTExpression *)self confirm];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"confirm"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"confirm"];
    }
  }
  if (self->_continuePlanning)
  {
    v13 = [(IFTSchemaIFTExpression *)self continuePlanning];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"continuePlanning"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"continuePlanning"];
    }
  }
  if (self->_dot)
  {
    uint64_t v16 = [(IFTSchemaIFTExpression *)self dot];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"dot"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"dot"];
    }
  }
  if (self->_endOfPlan)
  {
    v19 = [(IFTSchemaIFTExpression *)self endOfPlan];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"endOfPlan"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"endOfPlan"];
    }
  }
  if (self->_explicitResolutionRequest)
  {
    uint64_t v22 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"explicitResolutionRequest"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"explicitResolutionRequest"];
    }
  }
  if (self->_getMentionedApps)
  {
    v25 = [(IFTSchemaIFTExpression *)self getMentionedApps];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"getMentionedApps"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"getMentionedApps"];
    }
  }
  if (self->_index)
  {
    uint64_t v28 = [(IFTSchemaIFTExpression *)self index];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"index"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"index"];
    }
  }
  if (self->_infix)
  {
    v31 = [(IFTSchemaIFTExpression *)self infix];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"infix"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"infix"];
    }
  }
  if (self->_noMatchingTool)
  {
    uint64_t v34 = [(IFTSchemaIFTExpression *)self noMatchingTool];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"noMatchingTool"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"noMatchingTool"];
    }
  }
  if (self->_open)
  {
    v37 = [(IFTSchemaIFTExpression *)self open];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"open"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"open"];
    }
  }
  if (self->_pick)
  {
    v40 = [(IFTSchemaIFTExpression *)self pick];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"pick"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"pick"];
    }
  }
  if (self->_pickOne)
  {
    v43 = [(IFTSchemaIFTExpression *)self pickOne];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"pickOne"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"pickOne"];
    }
  }
  if (self->_prefix)
  {
    v46 = [(IFTSchemaIFTExpression *)self prefix];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"prefix"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"prefix"];
    }
  }
  if (self->_reject)
  {
    v49 = [(IFTSchemaIFTExpression *)self reject];
    int v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"reject"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"reject"];
    }
  }
  if (self->_resolveTool)
  {
    v52 = [(IFTSchemaIFTExpression *)self resolveTool];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"resolveTool"];
    }
    else
    {
      v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"resolveTool"];
    }
  }
  if (self->_say)
  {
    v55 = [(IFTSchemaIFTExpression *)self say];
    int v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"say"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"say"];
    }
  }
  if (self->_search)
  {
    v58 = [(IFTSchemaIFTExpression *)self search];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"search"];
    }
    else
    {
      v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"search"];
    }
  }
  if (self->_statementId)
  {
    v61 = [(IFTSchemaIFTExpression *)self statementId];
    int v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"statementId"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"statementId"];
    }
  }
  if (self->_undo)
  {
    v64 = [(IFTSchemaIFTExpression *)self undo];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"undo"];
    }
    else
    {
      v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"undo"];
    }
  }
  if (self->_updateParameters)
  {
    v67 = [(IFTSchemaIFTExpression *)self updateParameters];
    int v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"updateParameters"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"updateParameters"];
    }
  }
  if (self->_value)
  {
    objc_super v70 = [(IFTSchemaIFTExpression *)self value];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"value"];
    }
    else
    {
      v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"value"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v73 = v3;

  return v73;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTValueExpression *)self->_value hash];
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_statementId hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTPrefixExpression *)self->_prefix hash];
  unint64_t v6 = v4 ^ v5 ^ [(IFTSchemaIFTInfixExpression *)self->_infix hash];
  unint64_t v7 = [(IFTSchemaIFTDotExpression *)self->_dot hash];
  unint64_t v8 = v7 ^ [(IFTSchemaIFTIndexExpression *)self->_index hash];
  unint64_t v9 = v6 ^ v8 ^ [(IFTSchemaIFTUpdateParametersExpression *)self->_updateParameters hash];
  unint64_t v10 = [(IFTSchemaIFTCallExpression *)self->_call hash];
  unint64_t v11 = v10 ^ [(IFTSchemaIFTSayExpression *)self->_say hash];
  unint64_t v12 = v11 ^ [(IFTSchemaIFTPickExpression *)self->_pick hash];
  unint64_t v13 = v9 ^ v12 ^ [(IFTSchemaIFTConfirmExpression *)self->_confirm hash];
  unint64_t v14 = [(IFTSchemaIFTSearchExpression *)self->_search hash];
  unint64_t v15 = v14 ^ [(IFTSchemaIFTPickOneExpression *)self->_pickOne hash];
  unint64_t v16 = v15 ^ [(IFTSchemaIFTResolveToolExpression *)self->_resolveTool hash];
  unint64_t v17 = v16 ^ [(IFTSchemaIFTUndoExpression *)self->_undo hash];
  unint64_t v18 = v13 ^ v17 ^ [(IFTSchemaIFTRejectExpression *)self->_reject hash];
  unint64_t v19 = [(IFTSchemaIFTCancelExpression *)self->_cancel hash];
  unint64_t v20 = v19 ^ [(IFTSchemaIFTNoMatchingToolExpression *)self->_noMatchingTool hash];
  unint64_t v21 = v20 ^ [(IFTSchemaIFTContinuePlanningExpression *)self->_continuePlanning hash];
  unint64_t v22 = v21 ^ [(IFTSchemaIFTEndOfPlanExpression *)self->_endOfPlan hash];
  unint64_t v23 = v22 ^ [(IFTSchemaIFTGetMentionedAppsExpression *)self->_getMentionedApps hash];
  unint64_t v24 = v18 ^ v23 ^ [(IFTSchemaIFTOpenExpression *)self->_open hash];
  return v24 ^ [(IFTSchemaIFTExplicitResolutionRequest *)self->_explicitResolutionRequest hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  unint64_t whichOneof_Expression = self->_whichOneof_Expression;
  if (whichOneof_Expression != objc_msgSend(v4, "whichOneof_Expression")) {
    goto LABEL_118;
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self value];
  unint64_t v7 = [v4 value];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v8 = [(IFTSchemaIFTExpression *)self value];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(IFTSchemaIFTExpression *)self value];
    unint64_t v11 = [v4 value];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self statementId];
  unint64_t v7 = [v4 statementId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v13 = [(IFTSchemaIFTExpression *)self statementId];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(IFTSchemaIFTExpression *)self statementId];
    unint64_t v16 = [v4 statementId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self prefix];
  unint64_t v7 = [v4 prefix];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v18 = [(IFTSchemaIFTExpression *)self prefix];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(IFTSchemaIFTExpression *)self prefix];
    unint64_t v21 = [v4 prefix];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self infix];
  unint64_t v7 = [v4 infix];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v23 = [(IFTSchemaIFTExpression *)self infix];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    v25 = [(IFTSchemaIFTExpression *)self infix];
    uint64_t v26 = [v4 infix];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self dot];
  unint64_t v7 = [v4 dot];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v28 = [(IFTSchemaIFTExpression *)self dot];
  if (v28)
  {
    int v29 = (void *)v28;
    uint64_t v30 = [(IFTSchemaIFTExpression *)self dot];
    v31 = [v4 dot];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self index];
  unint64_t v7 = [v4 index];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v33 = [(IFTSchemaIFTExpression *)self index];
  if (v33)
  {
    uint64_t v34 = (void *)v33;
    int v35 = [(IFTSchemaIFTExpression *)self index];
    uint64_t v36 = [v4 index];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self updateParameters];
  unint64_t v7 = [v4 updateParameters];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v38 = [(IFTSchemaIFTExpression *)self updateParameters];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(IFTSchemaIFTExpression *)self updateParameters];
    int v41 = [v4 updateParameters];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self call];
  unint64_t v7 = [v4 call];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v43 = [(IFTSchemaIFTExpression *)self call];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(IFTSchemaIFTExpression *)self call];
    v46 = [v4 call];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self say];
  unint64_t v7 = [v4 say];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v48 = [(IFTSchemaIFTExpression *)self say];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(IFTSchemaIFTExpression *)self say];
    v51 = [v4 say];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self pick];
  unint64_t v7 = [v4 pick];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v53 = [(IFTSchemaIFTExpression *)self pick];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(IFTSchemaIFTExpression *)self pick];
    int v56 = [v4 pick];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self confirm];
  unint64_t v7 = [v4 confirm];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v58 = [(IFTSchemaIFTExpression *)self confirm];
  if (v58)
  {
    int v59 = (void *)v58;
    v60 = [(IFTSchemaIFTExpression *)self confirm];
    v61 = [v4 confirm];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self search];
  unint64_t v7 = [v4 search];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v63 = [(IFTSchemaIFTExpression *)self search];
  if (v63)
  {
    v64 = (void *)v63;
    int v65 = [(IFTSchemaIFTExpression *)self search];
    v66 = [v4 search];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self pickOne];
  unint64_t v7 = [v4 pickOne];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v68 = [(IFTSchemaIFTExpression *)self pickOne];
  if (v68)
  {
    v69 = (void *)v68;
    objc_super v70 = [(IFTSchemaIFTExpression *)self pickOne];
    int v71 = [v4 pickOne];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self resolveTool];
  unint64_t v7 = [v4 resolveTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v73 = [(IFTSchemaIFTExpression *)self resolveTool];
  if (v73)
  {
    int v74 = (void *)v73;
    v75 = [(IFTSchemaIFTExpression *)self resolveTool];
    objc_super v76 = [v4 resolveTool];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self undo];
  unint64_t v7 = [v4 undo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v78 = [(IFTSchemaIFTExpression *)self undo];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(IFTSchemaIFTExpression *)self undo];
    v81 = [v4 undo];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self reject];
  unint64_t v7 = [v4 reject];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v83 = [(IFTSchemaIFTExpression *)self reject];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(IFTSchemaIFTExpression *)self reject];
    v86 = [v4 reject];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self cancel];
  unint64_t v7 = [v4 cancel];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v88 = [(IFTSchemaIFTExpression *)self cancel];
  if (v88)
  {
    v89 = (void *)v88;
    v90 = [(IFTSchemaIFTExpression *)self cancel];
    v91 = [v4 cancel];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self noMatchingTool];
  unint64_t v7 = [v4 noMatchingTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v93 = [(IFTSchemaIFTExpression *)self noMatchingTool];
  if (v93)
  {
    v94 = (void *)v93;
    v95 = [(IFTSchemaIFTExpression *)self noMatchingTool];
    v96 = [v4 noMatchingTool];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self continuePlanning];
  unint64_t v7 = [v4 continuePlanning];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v98 = [(IFTSchemaIFTExpression *)self continuePlanning];
  if (v98)
  {
    v99 = (void *)v98;
    v100 = [(IFTSchemaIFTExpression *)self continuePlanning];
    v101 = [v4 continuePlanning];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self endOfPlan];
  unint64_t v7 = [v4 endOfPlan];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v103 = [(IFTSchemaIFTExpression *)self endOfPlan];
  if (v103)
  {
    v104 = (void *)v103;
    v105 = [(IFTSchemaIFTExpression *)self endOfPlan];
    v106 = [v4 endOfPlan];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self getMentionedApps];
  unint64_t v7 = [v4 getMentionedApps];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v108 = [(IFTSchemaIFTExpression *)self getMentionedApps];
  if (v108)
  {
    v109 = (void *)v108;
    v110 = [(IFTSchemaIFTExpression *)self getMentionedApps];
    v111 = [v4 getMentionedApps];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self open];
  unint64_t v7 = [v4 open];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_117;
  }
  uint64_t v113 = [(IFTSchemaIFTExpression *)self open];
  if (v113)
  {
    v114 = (void *)v113;
    v115 = [(IFTSchemaIFTExpression *)self open];
    v116 = [v4 open];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_118;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
  unint64_t v7 = [v4 explicitResolutionRequest];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v118 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
    if (!v118)
    {

LABEL_121:
      BOOL v123 = 1;
      goto LABEL_119;
    }
    v119 = (void *)v118;
    v120 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
    v121 = [v4 explicitResolutionRequest];
    char v122 = [v120 isEqual:v121];

    if (v122) {
      goto LABEL_121;
    }
  }
  else
  {
LABEL_117:
  }
LABEL_118:
  BOOL v123 = 0;
LABEL_119:

  return v123;
}

- (void)writeTo:(id)a3
{
  id v50 = a3;
  id v4 = [(IFTSchemaIFTExpression *)self value];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTExpression *)self value];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTExpression *)self statementId];

  if (v6)
  {
    unint64_t v7 = [(IFTSchemaIFTExpression *)self statementId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTExpression *)self prefix];

  if (v8)
  {
    unint64_t v9 = [(IFTSchemaIFTExpression *)self prefix];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(IFTSchemaIFTExpression *)self infix];

  if (v10)
  {
    unint64_t v11 = [(IFTSchemaIFTExpression *)self infix];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(IFTSchemaIFTExpression *)self dot];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTExpression *)self dot];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(IFTSchemaIFTExpression *)self index];

  if (v14)
  {
    unint64_t v15 = [(IFTSchemaIFTExpression *)self index];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(IFTSchemaIFTExpression *)self updateParameters];

  if (v16)
  {
    int v17 = [(IFTSchemaIFTExpression *)self updateParameters];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(IFTSchemaIFTExpression *)self call];

  if (v18)
  {
    unint64_t v19 = [(IFTSchemaIFTExpression *)self call];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(IFTSchemaIFTExpression *)self say];

  if (v20)
  {
    unint64_t v21 = [(IFTSchemaIFTExpression *)self say];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(IFTSchemaIFTExpression *)self pick];

  if (v22)
  {
    uint64_t v23 = [(IFTSchemaIFTExpression *)self pick];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(IFTSchemaIFTExpression *)self confirm];

  if (v24)
  {
    v25 = [(IFTSchemaIFTExpression *)self confirm];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v26 = [(IFTSchemaIFTExpression *)self search];

  if (v26)
  {
    int v27 = [(IFTSchemaIFTExpression *)self search];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(IFTSchemaIFTExpression *)self pickOne];

  if (v28)
  {
    int v29 = [(IFTSchemaIFTExpression *)self pickOne];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v30 = [(IFTSchemaIFTExpression *)self resolveTool];

  if (v30)
  {
    v31 = [(IFTSchemaIFTExpression *)self resolveTool];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(IFTSchemaIFTExpression *)self undo];

  if (v32)
  {
    uint64_t v33 = [(IFTSchemaIFTExpression *)self undo];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v34 = [(IFTSchemaIFTExpression *)self reject];

  if (v34)
  {
    int v35 = [(IFTSchemaIFTExpression *)self reject];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v36 = [(IFTSchemaIFTExpression *)self cancel];

  if (v36)
  {
    int v37 = [(IFTSchemaIFTExpression *)self cancel];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(IFTSchemaIFTExpression *)self noMatchingTool];

  if (v38)
  {
    v39 = [(IFTSchemaIFTExpression *)self noMatchingTool];
    PBDataWriterWriteSubmessage();
  }
  v40 = [(IFTSchemaIFTExpression *)self continuePlanning];

  if (v40)
  {
    int v41 = [(IFTSchemaIFTExpression *)self continuePlanning];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(IFTSchemaIFTExpression *)self endOfPlan];

  if (v42)
  {
    uint64_t v43 = [(IFTSchemaIFTExpression *)self endOfPlan];
    PBDataWriterWriteSubmessage();
  }
  int v44 = [(IFTSchemaIFTExpression *)self getMentionedApps];

  if (v44)
  {
    v45 = [(IFTSchemaIFTExpression *)self getMentionedApps];
    PBDataWriterWriteSubmessage();
  }
  v46 = [(IFTSchemaIFTExpression *)self open];

  if (v46)
  {
    int v47 = [(IFTSchemaIFTExpression *)self open];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];

  if (v48)
  {
    v49 = [(IFTSchemaIFTExpression *)self explicitResolutionRequest];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTExpressionReadFrom(self, (uint64_t)a3);
}

- (void)deleteExplicitResolutionRequest
{
  if (self->_whichOneof_Expression == 24)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_explicitResolutionRequest = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTExplicitResolutionRequest)explicitResolutionRequest
{
  if (self->_whichOneof_Expression == 24) {
    v2 = self->_explicitResolutionRequest;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExplicitResolutionRequest:(id)a3
{
  id v4 = (IFTSchemaIFTExplicitResolutionRequest *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  unint64_t v27 = 24;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = v4;
}

- (void)deleteOpen
{
  if (self->_whichOneof_Expression == 23)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_open = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTOpenExpression)open
{
  if (self->_whichOneof_Expression == 23) {
    v2 = self->_open;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpen:(id)a3
{
  id v4 = (IFTSchemaIFTOpenExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 23;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  open = self->_open;
  self->_open = v4;
}

- (void)deleteGetMentionedApps
{
  if (self->_whichOneof_Expression == 22)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_getMentionedApps = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTGetMentionedAppsExpression)getMentionedApps
{
  if (self->_whichOneof_Expression == 22) {
    v2 = self->_getMentionedApps;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGetMentionedApps:(id)a3
{
  id v4 = (IFTSchemaIFTGetMentionedAppsExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 22;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = v4;
}

- (void)deleteEndOfPlan
{
  if (self->_whichOneof_Expression == 21)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_endOfPlan = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTEndOfPlanExpression)endOfPlan
{
  if (self->_whichOneof_Expression == 21) {
    v2 = self->_endOfPlan;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEndOfPlan:(id)a3
{
  id v4 = (IFTSchemaIFTEndOfPlanExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 21;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = v4;
}

- (void)deleteContinuePlanning
{
  if (self->_whichOneof_Expression == 20)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_continuePlanning = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTContinuePlanningExpression)continuePlanning
{
  if (self->_whichOneof_Expression == 20) {
    v2 = self->_continuePlanning;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContinuePlanning:(id)a3
{
  id v4 = (IFTSchemaIFTContinuePlanningExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 20;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = v4;
}

- (void)deleteNoMatchingTool
{
  if (self->_whichOneof_Expression == 19)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_noMatchingTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTNoMatchingToolExpression)noMatchingTool
{
  if (self->_whichOneof_Expression == 19) {
    v2 = self->_noMatchingTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNoMatchingTool:(id)a3
{
  id v4 = (IFTSchemaIFTNoMatchingToolExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 19;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = v4;
}

- (void)deleteCancel
{
  if (self->_whichOneof_Expression == 18)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_cancel = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTCancelExpression)cancel
{
  if (self->_whichOneof_Expression == 18) {
    v2 = self->_cancel;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancel:(id)a3
{
  id v4 = (IFTSchemaIFTCancelExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 18;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  cancel = self->_cancel;
  self->_cancel = v4;
}

- (void)deleteReject
{
  if (self->_whichOneof_Expression == 17)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_reject = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTRejectExpression)reject
{
  if (self->_whichOneof_Expression == 17) {
    v2 = self->_reject;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReject:(id)a3
{
  id v4 = (IFTSchemaIFTRejectExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 17;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  reject = self->_reject;
  self->_reject = v4;
}

- (void)deleteUndo
{
  if (self->_whichOneof_Expression == 16)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_undo = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTUndoExpression)undo
{
  if (self->_whichOneof_Expression == 16) {
    v2 = self->_undo;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUndo:(id)a3
{
  id v4 = (IFTSchemaIFTUndoExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  self->_unint64_t whichOneof_Expression = 16 * (v4 != 0);
  undo = self->_undo;
  self->_undo = v4;
}

- (void)deleteResolveTool
{
  if (self->_whichOneof_Expression == 15)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_resolveTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTResolveToolExpression)resolveTool
{
  if (self->_whichOneof_Expression == 15) {
    v2 = self->_resolveTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResolveTool:(id)a3
{
  id v4 = (IFTSchemaIFTResolveToolExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 15;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  resolveTool = self->_resolveTool;
  self->_resolveTool = v4;
}

- (void)deletePickOne
{
  if (self->_whichOneof_Expression == 14)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_pickOne = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPickOneExpression)pickOne
{
  if (self->_whichOneof_Expression == 14) {
    v2 = self->_pickOne;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPickOne:(id)a3
{
  id v4 = (IFTSchemaIFTPickOneExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 14;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  pickOne = self->_pickOne;
  self->_pickOne = v4;
}

- (void)deleteSearch
{
  if (self->_whichOneof_Expression == 13)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_search = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSearchExpression)search
{
  if (self->_whichOneof_Expression == 13) {
    v2 = self->_search;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearch:(id)a3
{
  id v4 = (IFTSchemaIFTSearchExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 13;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  search = self->_search;
  self->_search = v4;
}

- (void)deleteConfirm
{
  if (self->_whichOneof_Expression == 12)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_confirm = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTConfirmExpression)confirm
{
  if (self->_whichOneof_Expression == 12) {
    v2 = self->_confirm;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConfirm:(id)a3
{
  id v4 = (IFTSchemaIFTConfirmExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 12;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  confirm = self->_confirm;
  self->_confirm = v4;
}

- (void)deletePick
{
  if (self->_whichOneof_Expression == 10)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_pick = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPickExpression)pick
{
  if (self->_whichOneof_Expression == 10) {
    v2 = self->_pick;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPick:(id)a3
{
  id v4 = (IFTSchemaIFTPickExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 10;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  pick = self->_pick;
  self->_pick = v4;
}

- (void)deleteSay
{
  if (self->_whichOneof_Expression == 9)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_say = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSayExpression)say
{
  if (self->_whichOneof_Expression == 9) {
    v2 = self->_say;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSay:(id)a3
{
  id v4 = (IFTSchemaIFTSayExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 9;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  say = self->_say;
  self->_say = v4;
}

- (void)deleteCall
{
  if (self->_whichOneof_Expression == 8)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_call = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTCallExpression)call
{
  if (self->_whichOneof_Expression == 8) {
    v2 = self->_call;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCall:(id)a3
{
  id v4 = (IFTSchemaIFTCallExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  self->_unint64_t whichOneof_Expression = 8 * (v4 != 0);
  call = self->_call;
  self->_call = v4;
}

- (void)deleteUpdateParameters
{
  if (self->_whichOneof_Expression == 7)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_updateParameters = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTUpdateParametersExpression)updateParameters
{
  if (self->_whichOneof_Expression == 7) {
    v2 = self->_updateParameters;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUpdateParameters:(id)a3
{
  id v4 = (IFTSchemaIFTUpdateParametersExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 7;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  updateParameters = self->_updateParameters;
  self->_updateParameters = v4;
}

- (void)deleteIndex
{
  if (self->_whichOneof_Expression == 6)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_index = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTIndexExpression)index
{
  if (self->_whichOneof_Expression == 6) {
    v2 = self->_index;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIndex:(id)a3
{
  id v4 = (IFTSchemaIFTIndexExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 6;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  index = self->_index;
  self->_index = v4;
}

- (void)deleteDot
{
  if (self->_whichOneof_Expression == 5)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_dot = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTDotExpression)dot
{
  if (self->_whichOneof_Expression == 5) {
    v2 = self->_dot;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDot:(id)a3
{
  id v4 = (IFTSchemaIFTDotExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 5;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  dot = self->_dot;
  self->_dot = v4;
}

- (void)deleteInfix
{
  if (self->_whichOneof_Expression == 4)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_infix = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTInfixExpression)infix
{
  if (self->_whichOneof_Expression == 4) {
    v2 = self->_infix;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInfix:(id)a3
{
  id v4 = (IFTSchemaIFTInfixExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  self->_unint64_t whichOneof_Expression = 4 * (v4 != 0);
  infix = self->_infix;
  self->_infix = v4;
}

- (void)deletePrefix
{
  if (self->_whichOneof_Expression == 3)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_prefix = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPrefixExpression)prefix
{
  if (self->_whichOneof_Expression == 3) {
    v2 = self->_prefix;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrefix:(id)a3
{
  id v4 = (IFTSchemaIFTPrefixExpression *)a3;
  value = self->_value;
  self->_value = 0;

  statementId = self->_statementId;
  self->_statementId = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  unint64_t v27 = 3;
  if (!v4) {
    unint64_t v27 = 0;
  }
  self->_unint64_t whichOneof_Expression = v27;
  prefix = self->_prefix;
  self->_prefix = v4;
}

- (void)deleteStatementId
{
  if (self->_whichOneof_Expression == 2)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_statementId = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTStatementId)statementId
{
  if (self->_whichOneof_Expression == 2) {
    v2 = self->_statementId;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStatementId:(id)a3
{
  id v4 = (IFTSchemaIFTStatementId *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  self->_unint64_t whichOneof_Expression = 2 * (v4 != 0);
  statementId = self->_statementId;
  self->_statementId = v4;
}

- (void)deleteValue
{
  if (self->_whichOneof_Expression == 1)
  {
    self->_unint64_t whichOneof_Expression = 0;
    self->_value = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTValueExpression)value
{
  if (self->_whichOneof_Expression == 1) {
    v2 = self->_value;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setValue:(id)a3
{
  id v4 = (IFTSchemaIFTValueExpression *)a3;
  statementId = self->_statementId;
  self->_statementId = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  call = self->_call;
  self->_call = 0;

  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  noMatchingTool = self->_noMatchingTool;
  self->_noMatchingTool = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  endOfPlan = self->_endOfPlan;
  self->_endOfPlan = 0;

  getMentionedApps = self->_getMentionedApps;
  self->_getMentionedApps = 0;

  open = self->_open;
  self->_open = 0;

  explicitResolutionRequest = self->_explicitResolutionRequest;
  self->_explicitResolutionRequest = 0;

  self->_unint64_t whichOneof_Expression = v4 != 0;
  value = self->_value;
  self->_value = v4;
}

@end