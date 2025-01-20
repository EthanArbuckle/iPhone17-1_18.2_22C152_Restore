@interface IFTSchemaIFTASTFlatExpr
- (BOOL)endOfPlan;
- (BOOL)hasCall;
- (BOOL)hasCancel;
- (BOOL)hasConfirm;
- (BOOL)hasContinuePlanning;
- (BOOL)hasDot;
- (BOOL)hasEndOfPlan;
- (BOOL)hasIndex;
- (BOOL)hasInfix;
- (BOOL)hasNoMatchingTool;
- (BOOL)hasPick;
- (BOOL)hasPickOne;
- (BOOL)hasPrefix;
- (BOOL)hasReject;
- (BOOL)hasResolveTool;
- (BOOL)hasSay;
- (BOOL)hasSearch;
- (BOOL)hasUndo;
- (BOOL)hasUpdate;
- (BOOL)hasUpdateParameters;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)noMatchingTool;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTExprContinuePlanningVariant)continuePlanning;
- (IFTSchemaASTFlatExprCallVariant)call;
- (IFTSchemaASTFlatExprCancelVariant)cancel;
- (IFTSchemaASTFlatExprConfirmVariant)confirm;
- (IFTSchemaASTFlatExprDotVariant)dot;
- (IFTSchemaASTFlatExprIndexVariant)index;
- (IFTSchemaASTFlatExprInfixVariant)infix;
- (IFTSchemaASTFlatExprPickOneVariant)pickOne;
- (IFTSchemaASTFlatExprPickVariant)pick;
- (IFTSchemaASTFlatExprPrefixVariant)prefix;
- (IFTSchemaASTFlatExprRejectVariant)reject;
- (IFTSchemaASTFlatExprResolveToolVariant)resolveTool;
- (IFTSchemaASTFlatExprSayVariant)say;
- (IFTSchemaASTFlatExprSearchVariant)search;
- (IFTSchemaASTFlatExprUndoVariant)undo;
- (IFTSchemaASTFlatExprUpdateParametersVariant)updateParameters;
- (IFTSchemaASTFlatExprUpdateVariant)update;
- (IFTSchemaASTFlatValue)value;
- (IFTSchemaIFTASTFlatExpr)initWithDictionary:(id)a3;
- (IFTSchemaIFTASTFlatExpr)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Astflatexpr;
- (void)deleteCall;
- (void)deleteCancel;
- (void)deleteConfirm;
- (void)deleteContinuePlanning;
- (void)deleteDot;
- (void)deleteEndOfPlan;
- (void)deleteIndex;
- (void)deleteInfix;
- (void)deleteNoMatchingTool;
- (void)deletePick;
- (void)deletePickOne;
- (void)deletePrefix;
- (void)deleteReject;
- (void)deleteResolveTool;
- (void)deleteSay;
- (void)deleteSearch;
- (void)deleteUndo;
- (void)deleteUpdate;
- (void)deleteUpdateParameters;
- (void)deleteValue;
- (void)setCall:(id)a3;
- (void)setCancel:(id)a3;
- (void)setConfirm:(id)a3;
- (void)setContinuePlanning:(id)a3;
- (void)setDot:(id)a3;
- (void)setEndOfPlan:(BOOL)a3;
- (void)setHasCall:(BOOL)a3;
- (void)setHasCancel:(BOOL)a3;
- (void)setHasConfirm:(BOOL)a3;
- (void)setHasContinuePlanning:(BOOL)a3;
- (void)setHasDot:(BOOL)a3;
- (void)setHasEndOfPlan:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasInfix:(BOOL)a3;
- (void)setHasNoMatchingTool:(BOOL)a3;
- (void)setHasPick:(BOOL)a3;
- (void)setHasPickOne:(BOOL)a3;
- (void)setHasPrefix:(BOOL)a3;
- (void)setHasReject:(BOOL)a3;
- (void)setHasResolveTool:(BOOL)a3;
- (void)setHasSay:(BOOL)a3;
- (void)setHasSearch:(BOOL)a3;
- (void)setHasUndo:(BOOL)a3;
- (void)setHasUpdate:(BOOL)a3;
- (void)setHasUpdateParameters:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setInfix:(id)a3;
- (void)setNoMatchingTool:(BOOL)a3;
- (void)setPick:(id)a3;
- (void)setPickOne:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setReject:(id)a3;
- (void)setResolveTool:(id)a3;
- (void)setSay:(id)a3;
- (void)setSearch:(id)a3;
- (void)setUndo:(id)a3;
- (void)setUpdate:(id)a3;
- (void)setUpdateParameters:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTASTFlatExpr

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)IFTSchemaIFTASTFlatExpr;
  v5 = [(SISchemaInstrumentationMessage *)&v61 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTASTFlatExpr *)self value];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteValue];
  }
  v9 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTASTFlatExpr *)self deletePrefix];
  }
  v12 = [(IFTSchemaIFTASTFlatExpr *)self infix];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteInfix];
  }
  v15 = [(IFTSchemaIFTASTFlatExpr *)self dot];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteDot];
  }
  v18 = [(IFTSchemaIFTASTFlatExpr *)self index];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteIndex];
  }
  v21 = [(IFTSchemaIFTASTFlatExpr *)self call];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteCall];
  }
  v24 = [(IFTSchemaIFTASTFlatExpr *)self update];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteUpdate];
  }
  v27 = [(IFTSchemaIFTASTFlatExpr *)self say];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteSay];
  }
  v30 = [(IFTSchemaIFTASTFlatExpr *)self pick];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(IFTSchemaIFTASTFlatExpr *)self deletePick];
  }
  v33 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteConfirm];
  }
  v36 = [(IFTSchemaIFTASTFlatExpr *)self search];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteSearch];
  }
  v39 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(IFTSchemaIFTASTFlatExpr *)self deletePickOne];
  }
  v42 = [(IFTSchemaIFTASTFlatExpr *)self undo];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteUndo];
  }
  v45 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteResolveTool];
  }
  v48 = [(IFTSchemaIFTASTFlatExpr *)self reject];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteReject];
  }
  v51 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteCancel];
  }
  v54 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteContinuePlanning];
  }
  v57 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(IFTSchemaIFTASTFlatExpr *)self deleteUpdateParameters];
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
  objc_storeStrong((id *)&self->_updateParameters, 0);
  objc_storeStrong((id *)&self->_continuePlanning, 0);
  objc_storeStrong((id *)&self->_cancel, 0);
  objc_storeStrong((id *)&self->_reject, 0);
  objc_storeStrong((id *)&self->_resolveTool, 0);
  objc_storeStrong((id *)&self->_undo, 0);
  objc_storeStrong((id *)&self->_pickOne, 0);
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_confirm, 0);
  objc_storeStrong((id *)&self->_pick, 0);
  objc_storeStrong((id *)&self->_say, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_dot, 0);
  objc_storeStrong((id *)&self->_infix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setHasUpdateParameters:(BOOL)a3
{
  self->_hasUpdateParameters = a3;
}

- (BOOL)hasUpdateParameters
{
  return self->_hasUpdateParameters;
}

- (void)setHasContinuePlanning:(BOOL)a3
{
  self->_hasContinuePlanning = a3;
}

- (BOOL)hasContinuePlanning
{
  return self->_hasContinuePlanning;
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

- (void)setHasResolveTool:(BOOL)a3
{
  self->_hasResolveTool = a3;
}

- (BOOL)hasResolveTool
{
  return self->_hasResolveTool;
}

- (void)setHasUndo:(BOOL)a3
{
  self->_hasUndo = a3;
}

- (BOOL)hasUndo
{
  return self->_hasUndo;
}

- (void)setHasNoMatchingTool:(BOOL)a3
{
  self->_hasNoMatchingTool = a3;
}

- (BOOL)hasNoMatchingTool
{
  return self->_hasNoMatchingTool;
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

- (void)setHasEndOfPlan:(BOOL)a3
{
  self->_hasEndOfPlan = a3;
}

- (BOOL)hasEndOfPlan
{
  return self->_hasEndOfPlan;
}

- (void)setHasUpdate:(BOOL)a3
{
  self->_hasUpdate = a3;
}

- (BOOL)hasUpdate
{
  return self->_hasUpdate;
}

- (void)setHasCall:(BOOL)a3
{
  self->_hasCall = a3;
}

- (BOOL)hasCall
{
  return self->_hasCall;
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

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (unint64_t)whichOneof_Astflatexpr
{
  return self->_whichOneof_Astflatexpr;
}

- (IFTSchemaIFTASTFlatExpr)initWithDictionary:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)IFTSchemaIFTASTFlatExpr;
  v5 = [(IFTSchemaIFTASTFlatExpr *)&v59 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaASTFlatValue alloc] initWithDictionary:v6];
      [(IFTSchemaIFTASTFlatExpr *)v5 setValue:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"prefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaASTFlatExprPrefixVariant alloc] initWithDictionary:v8];
      [(IFTSchemaIFTASTFlatExpr *)v5 setPrefix:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"infix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaASTFlatExprInfixVariant alloc] initWithDictionary:v10];
      [(IFTSchemaIFTASTFlatExpr *)v5 setInfix:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"dot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaASTFlatExprDotVariant alloc] initWithDictionary:v12];
      [(IFTSchemaIFTASTFlatExpr *)v5 setDot:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaASTFlatExprIndexVariant alloc] initWithDictionary:v14];
      [(IFTSchemaIFTASTFlatExpr *)v5 setIndex:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"call"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaASTFlatExprCallVariant alloc] initWithDictionary:v16];
      [(IFTSchemaIFTASTFlatExpr *)v5 setCall:v17];
    }
    v54 = (void *)v6;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"update"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[IFTSchemaASTFlatExprUpdateVariant alloc] initWithDictionary:v18];
      [(IFTSchemaIFTASTFlatExpr *)v5 setUpdate:v19];
    }
    v48 = (void *)v18;
    int v20 = [v4 objectForKeyedSubscript:@"endOfPlan"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTASTFlatExpr setEndOfPlan:](v5, "setEndOfPlan:", [v20 BOOLValue]);
    }
    int v47 = v20;
    uint64_t v21 = [v4 objectForKeyedSubscript:@"say"];
    objc_opt_class();
    v58 = (void *)v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = [[IFTSchemaASTFlatExprSayVariant alloc] initWithDictionary:v21];
      [(IFTSchemaIFTASTFlatExpr *)v5 setSay:v22];
    }
    uint64_t v23 = [v4 objectForKeyedSubscript:@"pick"];
    objc_opt_class();
    v57 = (void *)v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = [[IFTSchemaASTFlatExprPickVariant alloc] initWithDictionary:v23];
      [(IFTSchemaIFTASTFlatExpr *)v5 setPick:v24];
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"confirm"];
    objc_opt_class();
    int v56 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[IFTSchemaASTFlatExprConfirmVariant alloc] initWithDictionary:v25];
      [(IFTSchemaIFTASTFlatExpr *)v5 setConfirm:v26];
    }
    uint64_t v27 = [v4 objectForKeyedSubscript:@"search"];
    objc_opt_class();
    v55 = (void *)v27;
    if (objc_opt_isKindOfClass())
    {
      v28 = [[IFTSchemaASTFlatExprSearchVariant alloc] initWithDictionary:v27];
      [(IFTSchemaIFTASTFlatExpr *)v5 setSearch:v28];
    }
    v51 = (void *)v12;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"pickOne"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[IFTSchemaASTFlatExprPickOneVariant alloc] initWithDictionary:v29];
      [(IFTSchemaIFTASTFlatExpr *)v5 setPickOne:v30];
    }
    v46 = (void *)v29;
    int v50 = (void *)v14;
    v31 = [v4 objectForKeyedSubscript:@"noMatchingTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTASTFlatExpr setNoMatchingTool:](v5, "setNoMatchingTool:", [v31 BOOLValue]);
    }
    v49 = (void *)v16;
    int v32 = [v4 objectForKeyedSubscript:@"undo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[IFTSchemaASTFlatExprUndoVariant alloc] initWithDictionary:v32];
      [(IFTSchemaIFTASTFlatExpr *)v5 setUndo:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"resolveTool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[IFTSchemaASTFlatExprResolveToolVariant alloc] initWithDictionary:v34];
      [(IFTSchemaIFTASTFlatExpr *)v5 setResolveTool:v35];
    }
    int v53 = (void *)v8;
    v36 = [v4 objectForKeyedSubscript:@"reject"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[IFTSchemaASTFlatExprRejectVariant alloc] initWithDictionary:v36];
      [(IFTSchemaIFTASTFlatExpr *)v5 setReject:v37];
    }
    v52 = (void *)v10;
    int v38 = [v4 objectForKeyedSubscript:@"cancel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[IFTSchemaASTFlatExprCancelVariant alloc] initWithDictionary:v38];
      [(IFTSchemaIFTASTFlatExpr *)v5 setCancel:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"continuePlanning"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[IFTSchemaASTExprContinuePlanningVariant alloc] initWithDictionary:v40];
      [(IFTSchemaIFTASTFlatExpr *)v5 setContinuePlanning:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"updateParameters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[IFTSchemaASTFlatExprUpdateParametersVariant alloc] initWithDictionary:v42];
      [(IFTSchemaIFTASTFlatExpr *)v5 setUpdateParameters:v43];
    }
    int v44 = v5;
  }
  return v5;
}

- (IFTSchemaIFTASTFlatExpr)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTASTFlatExpr *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTASTFlatExpr *)self dictionaryRepresentation];
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
    id v4 = [(IFTSchemaIFTASTFlatExpr *)self call];
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
    uint64_t v7 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
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
    uint64_t v10 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
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
    v13 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
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
    uint64_t v16 = [(IFTSchemaIFTASTFlatExpr *)self dot];
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
  if (self->_whichOneof_Astflatexpr == 8)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTASTFlatExpr endOfPlan](self, "endOfPlan"));
    [v3 setObject:v19 forKeyedSubscript:@"endOfPlan"];
  }
  if (self->_index)
  {
    int v20 = [(IFTSchemaIFTASTFlatExpr *)self index];
    uint64_t v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"index"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"index"];
    }
  }
  if (self->_infix)
  {
    uint64_t v23 = [(IFTSchemaIFTASTFlatExpr *)self infix];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"infix"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"infix"];
    }
  }
  if (self->_whichOneof_Astflatexpr == 14)
  {
    int v26 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTASTFlatExpr noMatchingTool](self, "noMatchingTool"));
    [v3 setObject:v26 forKeyedSubscript:@"noMatchingTool"];
  }
  if (self->_pick)
  {
    uint64_t v27 = [(IFTSchemaIFTASTFlatExpr *)self pick];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"pick"];
    }
    else
    {
      uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"pick"];
    }
  }
  if (self->_pickOne)
  {
    v30 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"pickOne"];
    }
    else
    {
      int v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"pickOne"];
    }
  }
  if (self->_prefix)
  {
    v33 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
    v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"prefix"];
    }
    else
    {
      int v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"prefix"];
    }
  }
  if (self->_reject)
  {
    v36 = [(IFTSchemaIFTASTFlatExpr *)self reject];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"reject"];
    }
    else
    {
      int v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"reject"];
    }
  }
  if (self->_resolveTool)
  {
    v39 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"resolveTool"];
    }
    else
    {
      int v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"resolveTool"];
    }
  }
  if (self->_say)
  {
    v42 = [(IFTSchemaIFTASTFlatExpr *)self say];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"say"];
    }
    else
    {
      int v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"say"];
    }
  }
  if (self->_search)
  {
    v45 = [(IFTSchemaIFTASTFlatExpr *)self search];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"search"];
    }
    else
    {
      int v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"search"];
    }
  }
  if (self->_undo)
  {
    v48 = [(IFTSchemaIFTASTFlatExpr *)self undo];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"undo"];
    }
    else
    {
      int v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"undo"];
    }
  }
  if (self->_update)
  {
    v51 = [(IFTSchemaIFTASTFlatExpr *)self update];
    v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"update"];
    }
    else
    {
      int v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"update"];
    }
  }
  if (self->_updateParameters)
  {
    v54 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
    v55 = [v54 dictionaryRepresentation];
    if (v55)
    {
      [v3 setObject:v55 forKeyedSubscript:@"updateParameters"];
    }
    else
    {
      int v56 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v56 forKeyedSubscript:@"updateParameters"];
    }
  }
  if (self->_value)
  {
    v57 = [(IFTSchemaIFTASTFlatExpr *)self value];
    v58 = [v57 dictionaryRepresentation];
    if (v58)
    {
      [v3 setObject:v58 forKeyedSubscript:@"value"];
    }
    else
    {
      objc_super v59 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v59 forKeyedSubscript:@"value"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v22 = [(IFTSchemaASTFlatValue *)self->_value hash];
  unint64_t v21 = [(IFTSchemaASTFlatExprPrefixVariant *)self->_prefix hash];
  unint64_t v20 = [(IFTSchemaASTFlatExprInfixVariant *)self->_infix hash];
  unint64_t v19 = [(IFTSchemaASTFlatExprDotVariant *)self->_dot hash];
  unint64_t v18 = [(IFTSchemaASTFlatExprIndexVariant *)self->_index hash];
  unint64_t v3 = [(IFTSchemaASTFlatExprCallVariant *)self->_call hash];
  unint64_t v4 = [(IFTSchemaASTFlatExprUpdateVariant *)self->_update hash];
  if (self->_whichOneof_Astflatexpr == 8) {
    uint64_t v5 = 2654435761 * self->_endOfPlan;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(IFTSchemaASTFlatExprSayVariant *)self->_say hash];
  unint64_t v7 = [(IFTSchemaASTFlatExprPickVariant *)self->_pick hash];
  unint64_t v8 = [(IFTSchemaASTFlatExprConfirmVariant *)self->_confirm hash];
  unint64_t v9 = [(IFTSchemaASTFlatExprSearchVariant *)self->_search hash];
  unint64_t v10 = [(IFTSchemaASTFlatExprPickOneVariant *)self->_pickOne hash];
  if (self->_whichOneof_Astflatexpr == 14) {
    uint64_t v11 = 2654435761 * self->_noMatchingTool;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v9 ^ v10 ^ v11 ^ [(IFTSchemaASTFlatExprUndoVariant *)self->_undo hash];
  unint64_t v13 = v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ [(IFTSchemaASTFlatExprResolveToolVariant *)self->_resolveTool hash];
  unint64_t v14 = [(IFTSchemaASTFlatExprRejectVariant *)self->_reject hash];
  unint64_t v15 = v14 ^ [(IFTSchemaASTFlatExprCancelVariant *)self->_cancel hash];
  unint64_t v16 = v15 ^ [(IFTSchemaASTExprContinuePlanningVariant *)self->_continuePlanning hash];
  return v13 ^ v16 ^ [(IFTSchemaASTFlatExprUpdateParametersVariant *)self->_updateParameters hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_95;
  }
  unint64_t whichOneof_Astflatexpr = self->_whichOneof_Astflatexpr;
  if (whichOneof_Astflatexpr != objc_msgSend(v4, "whichOneof_Astflatexpr")) {
    goto LABEL_95;
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self value];
  unint64_t v7 = [v4 value];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v8 = [(IFTSchemaIFTASTFlatExpr *)self value];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(IFTSchemaIFTASTFlatExpr *)self value];
    uint64_t v11 = [v4 value];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
  unint64_t v7 = [v4 prefix];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v13 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
    unint64_t v16 = [v4 prefix];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self infix];
  unint64_t v7 = [v4 infix];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v18 = [(IFTSchemaIFTASTFlatExpr *)self infix];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(IFTSchemaIFTASTFlatExpr *)self infix];
    unint64_t v21 = [v4 infix];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self dot];
  unint64_t v7 = [v4 dot];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v23 = [(IFTSchemaIFTASTFlatExpr *)self dot];
  if (v23)
  {
    v24 = (void *)v23;
    uint64_t v25 = [(IFTSchemaIFTASTFlatExpr *)self dot];
    int v26 = [v4 dot];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self index];
  unint64_t v7 = [v4 index];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v28 = [(IFTSchemaIFTASTFlatExpr *)self index];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    v30 = [(IFTSchemaIFTASTFlatExpr *)self index];
    v31 = [v4 index];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self call];
  unint64_t v7 = [v4 call];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v33 = [(IFTSchemaIFTASTFlatExpr *)self call];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(IFTSchemaIFTASTFlatExpr *)self call];
    v36 = [v4 call];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self update];
  unint64_t v7 = [v4 update];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v38 = [(IFTSchemaIFTASTFlatExpr *)self update];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(IFTSchemaIFTASTFlatExpr *)self update];
    int v41 = [v4 update];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  int endOfPlan = self->_endOfPlan;
  if (endOfPlan != [v4 endOfPlan]) {
    goto LABEL_95;
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self say];
  unint64_t v7 = [v4 say];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v44 = [(IFTSchemaIFTASTFlatExpr *)self say];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(IFTSchemaIFTASTFlatExpr *)self say];
    int v47 = [v4 say];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self pick];
  unint64_t v7 = [v4 pick];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v49 = [(IFTSchemaIFTASTFlatExpr *)self pick];
  if (v49)
  {
    int v50 = (void *)v49;
    v51 = [(IFTSchemaIFTASTFlatExpr *)self pick];
    v52 = [v4 pick];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
  unint64_t v7 = [v4 confirm];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v54 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
  if (v54)
  {
    v55 = (void *)v54;
    int v56 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
    v57 = [v4 confirm];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self search];
  unint64_t v7 = [v4 search];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v59 = [(IFTSchemaIFTASTFlatExpr *)self search];
  if (v59)
  {
    v60 = (void *)v59;
    objc_super v61 = [(IFTSchemaIFTASTFlatExpr *)self search];
    v62 = [v4 search];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
  unint64_t v7 = [v4 pickOne];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v64 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
    v67 = [v4 pickOne];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  int noMatchingTool = self->_noMatchingTool;
  if (noMatchingTool != [v4 noMatchingTool]) {
    goto LABEL_95;
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self undo];
  unint64_t v7 = [v4 undo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v70 = [(IFTSchemaIFTASTFlatExpr *)self undo];
  if (v70)
  {
    v71 = (void *)v70;
    v72 = [(IFTSchemaIFTASTFlatExpr *)self undo];
    v73 = [v4 undo];
    int v74 = [v72 isEqual:v73];

    if (!v74) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
  unint64_t v7 = [v4 resolveTool];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v75 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
  if (v75)
  {
    v76 = (void *)v75;
    v77 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
    v78 = [v4 resolveTool];
    int v79 = [v77 isEqual:v78];

    if (!v79) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self reject];
  unint64_t v7 = [v4 reject];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v80 = [(IFTSchemaIFTASTFlatExpr *)self reject];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(IFTSchemaIFTASTFlatExpr *)self reject];
    v83 = [v4 reject];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
  unint64_t v7 = [v4 cancel];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v85 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
    v88 = [v4 cancel];
    int v89 = [v87 isEqual:v88];

    if (!v89) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
  unint64_t v7 = [v4 continuePlanning];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_94;
  }
  uint64_t v90 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
  if (v90)
  {
    v91 = (void *)v90;
    v92 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
    v93 = [v4 continuePlanning];
    int v94 = [v92 isEqual:v93];

    if (!v94) {
      goto LABEL_95;
    }
  }
  else
  {
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
  unint64_t v7 = [v4 updateParameters];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_94:

    goto LABEL_95;
  }
  uint64_t v95 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
  if (!v95)
  {

LABEL_98:
    BOOL v100 = 1;
    goto LABEL_96;
  }
  v96 = (void *)v95;
  v97 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
  v98 = [v4 updateParameters];
  char v99 = [v97 isEqual:v98];

  if (v99) {
    goto LABEL_98;
  }
LABEL_95:
  BOOL v100 = 0;
LABEL_96:

  return v100;
}

- (void)writeTo:(id)a3
{
  id v41 = a3;
  id v4 = [(IFTSchemaIFTASTFlatExpr *)self value];

  if (v4)
  {
    uint64_t v5 = [(IFTSchemaIFTASTFlatExpr *)self value];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTASTFlatExpr *)self prefix];

  if (v6)
  {
    unint64_t v7 = [(IFTSchemaIFTASTFlatExpr *)self prefix];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTASTFlatExpr *)self infix];

  if (v8)
  {
    unint64_t v9 = [(IFTSchemaIFTASTFlatExpr *)self infix];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(IFTSchemaIFTASTFlatExpr *)self dot];

  if (v10)
  {
    uint64_t v11 = [(IFTSchemaIFTASTFlatExpr *)self dot];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(IFTSchemaIFTASTFlatExpr *)self index];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTASTFlatExpr *)self index];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(IFTSchemaIFTASTFlatExpr *)self call];

  if (v14)
  {
    unint64_t v15 = [(IFTSchemaIFTASTFlatExpr *)self call];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(IFTSchemaIFTASTFlatExpr *)self update];

  if (v16)
  {
    int v17 = [(IFTSchemaIFTASTFlatExpr *)self update];
    PBDataWriterWriteSubmessage();
  }
  if (self->_whichOneof_Astflatexpr == 8) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v18 = [(IFTSchemaIFTASTFlatExpr *)self say];

  if (v18)
  {
    unint64_t v19 = [(IFTSchemaIFTASTFlatExpr *)self say];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(IFTSchemaIFTASTFlatExpr *)self pick];

  if (v20)
  {
    unint64_t v21 = [(IFTSchemaIFTASTFlatExpr *)self pick];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(IFTSchemaIFTASTFlatExpr *)self confirm];

  if (v22)
  {
    uint64_t v23 = [(IFTSchemaIFTASTFlatExpr *)self confirm];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(IFTSchemaIFTASTFlatExpr *)self search];

  if (v24)
  {
    uint64_t v25 = [(IFTSchemaIFTASTFlatExpr *)self search];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];

  if (v26)
  {
    int v27 = [(IFTSchemaIFTASTFlatExpr *)self pickOne];
    PBDataWriterWriteSubmessage();
  }
  if (self->_whichOneof_Astflatexpr == 14) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v28 = [(IFTSchemaIFTASTFlatExpr *)self undo];

  if (v28)
  {
    uint64_t v29 = [(IFTSchemaIFTASTFlatExpr *)self undo];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];

  if (v30)
  {
    v31 = [(IFTSchemaIFTASTFlatExpr *)self resolveTool];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(IFTSchemaIFTASTFlatExpr *)self reject];

  if (v32)
  {
    uint64_t v33 = [(IFTSchemaIFTASTFlatExpr *)self reject];
    PBDataWriterWriteSubmessage();
  }
  v34 = [(IFTSchemaIFTASTFlatExpr *)self cancel];

  if (v34)
  {
    int v35 = [(IFTSchemaIFTASTFlatExpr *)self cancel];
    PBDataWriterWriteSubmessage();
  }
  v36 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];

  if (v36)
  {
    int v37 = [(IFTSchemaIFTASTFlatExpr *)self continuePlanning];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];

  v39 = v41;
  if (v38)
  {
    v40 = [(IFTSchemaIFTASTFlatExpr *)self updateParameters];
    PBDataWriterWriteSubmessage();

    v39 = v41;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTASTFlatExprReadFrom(self, (uint64_t)a3);
}

- (void)deleteUpdateParameters
{
  if (self->_whichOneof_Astflatexpr == 20)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_updateParameters = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprUpdateParametersVariant)updateParameters
{
  if (self->_whichOneof_Astflatexpr == 20) {
    v2 = self->_updateParameters;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUpdateParameters:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprUpdateParametersVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  unint64_t v22 = 20;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  updateParameters = self->_updateParameters;
  self->_updateParameters = v4;
}

- (void)deleteContinuePlanning
{
  if (self->_whichOneof_Astflatexpr == 19)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_continuePlanning = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTExprContinuePlanningVariant)continuePlanning
{
  if (self->_whichOneof_Astflatexpr == 19) {
    v2 = self->_continuePlanning;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContinuePlanning:(id)a3
{
  id v4 = (IFTSchemaASTExprContinuePlanningVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 19;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = v4;
}

- (void)deleteCancel
{
  if (self->_whichOneof_Astflatexpr == 18)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_cancel = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprCancelVariant)cancel
{
  if (self->_whichOneof_Astflatexpr == 18) {
    v2 = self->_cancel;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancel:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprCancelVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 18;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  cancel = self->_cancel;
  self->_cancel = v4;
}

- (void)deleteReject
{
  if (self->_whichOneof_Astflatexpr == 17)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_reject = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprRejectVariant)reject
{
  if (self->_whichOneof_Astflatexpr == 17) {
    v2 = self->_reject;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReject:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprRejectVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 17;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  reject = self->_reject;
  self->_reject = v4;
}

- (void)deleteResolveTool
{
  if (self->_whichOneof_Astflatexpr == 16)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_resolveTool = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprResolveToolVariant)resolveTool
{
  if (self->_whichOneof_Astflatexpr == 16) {
    v2 = self->_resolveTool;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResolveTool:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprResolveToolVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = 16 * (v4 != 0);
  resolveTool = self->_resolveTool;
  self->_resolveTool = v4;
}

- (void)deleteUndo
{
  if (self->_whichOneof_Astflatexpr == 15)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_undo = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprUndoVariant)undo
{
  if (self->_whichOneof_Astflatexpr == 15) {
    v2 = self->_undo;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUndo:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprUndoVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 15;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  undo = self->_undo;
  self->_undo = v4;
}

- (void)deleteNoMatchingTool
{
  if (self->_whichOneof_Astflatexpr == 14)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_int noMatchingTool = 0;
  }
}

- (BOOL)noMatchingTool
{
  return self->_whichOneof_Astflatexpr == 14 && self->_noMatchingTool;
}

- (void)setNoMatchingTool:(BOOL)a3
{
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = 14;
  self->_int noMatchingTool = a3;
}

- (void)deletePickOne
{
  if (self->_whichOneof_Astflatexpr == 13)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_pickOne = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprPickOneVariant)pickOne
{
  if (self->_whichOneof_Astflatexpr == 13) {
    v2 = self->_pickOne;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPickOne:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprPickOneVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 13;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  pickOne = self->_pickOne;
  self->_pickOne = v4;
}

- (void)deleteSearch
{
  if (self->_whichOneof_Astflatexpr == 12)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_search = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprSearchVariant)search
{
  if (self->_whichOneof_Astflatexpr == 12) {
    v2 = self->_search;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearch:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprSearchVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 12;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  search = self->_search;
  self->_search = v4;
}

- (void)deleteConfirm
{
  if (self->_whichOneof_Astflatexpr == 11)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_confirm = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprConfirmVariant)confirm
{
  if (self->_whichOneof_Astflatexpr == 11) {
    v2 = self->_confirm;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConfirm:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprConfirmVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  pick = self->_pick;
  self->_pick = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 11;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  confirm = self->_confirm;
  self->_confirm = v4;
}

- (void)deletePick
{
  if (self->_whichOneof_Astflatexpr == 10)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_pick = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprPickVariant)pick
{
  if (self->_whichOneof_Astflatexpr == 10) {
    v2 = self->_pick;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPick:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprPickVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
  say = self->_say;
  self->_say = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 10;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  pick = self->_pick;
  self->_pick = v4;
}

- (void)deleteSay
{
  if (self->_whichOneof_Astflatexpr == 9)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_say = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprSayVariant)say
{
  if (self->_whichOneof_Astflatexpr == 9) {
    v2 = self->_say;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSay:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprSayVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
  pick = self->_pick;
  self->_pick = 0;

  confirm = self->_confirm;
  self->_confirm = 0;

  search = self->_search;
  self->_search = 0;

  pickOne = self->_pickOne;
  self->_pickOne = 0;

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 9;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  say = self->_say;
  self->_say = v4;
}

- (void)deleteEndOfPlan
{
  if (self->_whichOneof_Astflatexpr == 8)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_int endOfPlan = 0;
  }
}

- (BOOL)endOfPlan
{
  return self->_whichOneof_Astflatexpr == 8 && self->_endOfPlan;
}

- (void)setEndOfPlan:(BOOL)a3
{
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

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = 8;
  self->_int endOfPlan = a3;
}

- (void)deleteUpdate
{
  if (self->_whichOneof_Astflatexpr == 7)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_update = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprUpdateVariant)update
{
  if (self->_whichOneof_Astflatexpr == 7) {
    v2 = self->_update;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUpdate:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprUpdateVariant *)a3;
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

  call = self->_call;
  self->_call = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 7;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  update = self->_update;
  self->_update = v4;
}

- (void)deleteCall
{
  if (self->_whichOneof_Astflatexpr == 6)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_call = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprCallVariant)call
{
  if (self->_whichOneof_Astflatexpr == 6) {
    v2 = self->_call;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCall:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprCallVariant *)a3;
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

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 6;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  call = self->_call;
  self->_call = v4;
}

- (void)deleteIndex
{
  if (self->_whichOneof_Astflatexpr == 5)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_index = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprIndexVariant)index
{
  if (self->_whichOneof_Astflatexpr == 5) {
    v2 = self->_index;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIndex:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprIndexVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 5;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  index = self->_index;
  self->_index = v4;
}

- (void)deleteDot
{
  if (self->_whichOneof_Astflatexpr == 4)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_dot = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprDotVariant)dot
{
  if (self->_whichOneof_Astflatexpr == 4) {
    v2 = self->_dot;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDot:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprDotVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  infix = self->_infix;
  self->_infix = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = 4 * (v4 != 0);
  dot = self->_dot;
  self->_dot = v4;
}

- (void)deleteInfix
{
  if (self->_whichOneof_Astflatexpr == 3)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_infix = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprInfixVariant)infix
{
  if (self->_whichOneof_Astflatexpr == 3) {
    v2 = self->_infix;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInfix:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprInfixVariant *)a3;
  value = self->_value;
  self->_value = 0;

  prefix = self->_prefix;
  self->_prefix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  unint64_t v22 = 3;
  if (!v4) {
    unint64_t v22 = 0;
  }
  self->_unint64_t whichOneof_Astflatexpr = v22;
  infix = self->_infix;
  self->_infix = v4;
}

- (void)deletePrefix
{
  if (self->_whichOneof_Astflatexpr == 2)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_prefix = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatExprPrefixVariant)prefix
{
  if (self->_whichOneof_Astflatexpr == 2) {
    v2 = self->_prefix;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrefix:(id)a3
{
  id v4 = (IFTSchemaASTFlatExprPrefixVariant *)a3;
  value = self->_value;
  self->_value = 0;

  infix = self->_infix;
  self->_infix = 0;

  dot = self->_dot;
  self->_dot = 0;

  index = self->_index;
  self->_index = 0;

  call = self->_call;
  self->_call = 0;

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = 2 * (v4 != 0);
  prefix = self->_prefix;
  self->_prefix = v4;
}

- (void)deleteValue
{
  if (self->_whichOneof_Astflatexpr == 1)
  {
    self->_unint64_t whichOneof_Astflatexpr = 0;
    self->_value = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaASTFlatValue)value
{
  if (self->_whichOneof_Astflatexpr == 1) {
    v2 = self->_value;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setValue:(id)a3
{
  id v4 = (IFTSchemaASTFlatValue *)a3;
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

  update = self->_update;
  self->_update = 0;

  self->_int endOfPlan = 0;
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

  self->_int noMatchingTool = 0;
  undo = self->_undo;
  self->_undo = 0;

  resolveTool = self->_resolveTool;
  self->_resolveTool = 0;

  reject = self->_reject;
  self->_reject = 0;

  cancel = self->_cancel;
  self->_cancel = 0;

  continuePlanning = self->_continuePlanning;
  self->_continuePlanning = 0;

  updateParameters = self->_updateParameters;
  self->_updateParameters = 0;

  self->_unint64_t whichOneof_Astflatexpr = v4 != 0;
  value = self->_value;
  self->_value = v4;
}

@end