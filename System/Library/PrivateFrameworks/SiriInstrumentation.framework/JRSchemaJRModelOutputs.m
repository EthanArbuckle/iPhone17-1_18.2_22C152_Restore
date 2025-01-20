@interface JRSchemaJRModelOutputs
- (BOOL)didJRForcePrompt;
- (BOOL)hasAction;
- (BOOL)hasCandidates;
- (BOOL)hasDidJRForcePrompt;
- (BOOL)hasJrAnonymizedHistoryAndContext;
- (BOOL)hasModelDiagnosticSignals;
- (BOOL)hasRanking;
- (BOOL)hasShadowAction;
- (BOOL)hasShadowCandidates;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRAction)action;
- (JRSchemaJRAction)shadowAction;
- (JRSchemaJRActionCandidateTuple)candidates;
- (JRSchemaJRActionCandidateTuple)shadowCandidates;
- (JRSchemaJRAnonymizedHistoryAndContext)jrAnonymizedHistoryAndContext;
- (JRSchemaJRModelDiagnosticsSignals)modelDiagnosticSignals;
- (JRSchemaJRModelOutputs)initWithDictionary:(id)a3;
- (JRSchemaJRModelOutputs)initWithJSON:(id)a3;
- (JRSchemaRanking)ranking;
- (NSArray)userHistorys;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)userHistoryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userHistoryCount;
- (void)addUserHistory:(id)a3;
- (void)clearUserHistory;
- (void)deleteAction;
- (void)deleteCandidates;
- (void)deleteDidJRForcePrompt;
- (void)deleteJrAnonymizedHistoryAndContext;
- (void)deleteModelDiagnosticSignals;
- (void)deleteRanking;
- (void)deleteShadowAction;
- (void)deleteShadowCandidates;
- (void)setAction:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setDidJRForcePrompt:(BOOL)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasCandidates:(BOOL)a3;
- (void)setHasDidJRForcePrompt:(BOOL)a3;
- (void)setHasJrAnonymizedHistoryAndContext:(BOOL)a3;
- (void)setHasModelDiagnosticSignals:(BOOL)a3;
- (void)setHasRanking:(BOOL)a3;
- (void)setHasShadowAction:(BOOL)a3;
- (void)setHasShadowCandidates:(BOOL)a3;
- (void)setJrAnonymizedHistoryAndContext:(id)a3;
- (void)setModelDiagnosticSignals:(id)a3;
- (void)setRanking:(id)a3;
- (void)setShadowAction:(id)a3;
- (void)setShadowCandidates:(id)a3;
- (void)setUserHistorys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRModelOutputs

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)JRSchemaJRModelOutputs;
  v5 = [(SISchemaInstrumentationMessage *)&v30 applySensitiveConditionsPolicy:v4];
  v6 = [(JRSchemaJRModelOutputs *)self action];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(JRSchemaJRModelOutputs *)self deleteAction];
  }
  v9 = [(JRSchemaJRModelOutputs *)self candidates];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(JRSchemaJRModelOutputs *)self deleteCandidates];
  }
  v12 = [(JRSchemaJRModelOutputs *)self ranking];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(JRSchemaJRModelOutputs *)self deleteRanking];
  }
  v15 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(JRSchemaJRModelOutputs *)self deleteJrAnonymizedHistoryAndContext];
  }
  v18 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(JRSchemaJRModelOutputs *)self deleteModelDiagnosticSignals];
  }
  v21 = [(JRSchemaJRModelOutputs *)self shadowAction];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(JRSchemaJRModelOutputs *)self deleteShadowAction];
  }
  v24 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(JRSchemaJRModelOutputs *)self deleteShadowCandidates];
  }
  v27 = [(JRSchemaJRModelOutputs *)self userHistorys];
  v28 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v27 underConditions:v4];
  [(JRSchemaJRModelOutputs *)self setUserHistorys:v28];

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
  objc_storeStrong((id *)&self->_userHistorys, 0);
  objc_storeStrong((id *)&self->_shadowCandidates, 0);
  objc_storeStrong((id *)&self->_shadowAction, 0);
  objc_storeStrong((id *)&self->_modelDiagnosticSignals, 0);
  objc_storeStrong((id *)&self->_jrAnonymizedHistoryAndContext, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setHasShadowCandidates:(BOOL)a3
{
  self->_hasJrAnonymizedHistoryAndContext = a3;
}

- (void)setHasShadowAction:(BOOL)a3
{
  self->_hasRanking = a3;
}

- (void)setHasModelDiagnosticSignals:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (void)setHasJrAnonymizedHistoryAndContext:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void)setHasRanking:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCandidates:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUserHistorys:(id)a3
{
}

- (NSArray)userHistorys
{
  return self->_userHistorys;
}

- (void)setShadowCandidates:(id)a3
{
}

- (JRSchemaJRActionCandidateTuple)shadowCandidates
{
  return self->_shadowCandidates;
}

- (void)setShadowAction:(id)a3
{
}

- (JRSchemaJRAction)shadowAction
{
  return self->_shadowAction;
}

- (void)setModelDiagnosticSignals:(id)a3
{
}

- (JRSchemaJRModelDiagnosticsSignals)modelDiagnosticSignals
{
  return self->_modelDiagnosticSignals;
}

- (BOOL)didJRForcePrompt
{
  return self->_didJRForcePrompt;
}

- (void)setJrAnonymizedHistoryAndContext:(id)a3
{
}

- (JRSchemaJRAnonymizedHistoryAndContext)jrAnonymizedHistoryAndContext
{
  return self->_jrAnonymizedHistoryAndContext;
}

- (void)setRanking:(id)a3
{
}

- (JRSchemaRanking)ranking
{
  return self->_ranking;
}

- (void)setCandidates:(id)a3
{
}

- (JRSchemaJRActionCandidateTuple)candidates
{
  return self->_candidates;
}

- (void)setAction:(id)a3
{
}

- (JRSchemaJRAction)action
{
  return self->_action;
}

- (JRSchemaJRModelOutputs)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)JRSchemaJRModelOutputs;
  v5 = [(JRSchemaJRModelOutputs *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"action"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[JRSchemaJRAction alloc] initWithDictionary:v6];
      [(JRSchemaJRModelOutputs *)v5 setAction:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"candidates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[JRSchemaJRActionCandidateTuple alloc] initWithDictionary:v8];
      [(JRSchemaJRModelOutputs *)v5 setCandidates:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ranking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[JRSchemaRanking alloc] initWithDictionary:v10];
      [(JRSchemaJRModelOutputs *)v5 setRanking:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"jrAnonymizedHistoryAndContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[JRSchemaJRAnonymizedHistoryAndContext alloc] initWithDictionary:v12];
      [(JRSchemaJRModelOutputs *)v5 setJrAnonymizedHistoryAndContext:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"didJRForcePrompt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[JRSchemaJRModelOutputs setDidJRForcePrompt:](v5, "setDidJRForcePrompt:", [v14 BOOLValue]);
    }
    v35 = v14;
    uint64_t v15 = [v4 objectForKeyedSubscript:@"modelDiagnosticSignals"];
    objc_opt_class();
    v37 = (void *)v15;
    if (objc_opt_isKindOfClass())
    {
      v16 = [[JRSchemaJRModelDiagnosticsSignals alloc] initWithDictionary:v15];
      [(JRSchemaJRModelOutputs *)v5 setModelDiagnosticSignals:v16];
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"shadowAction"];
    objc_opt_class();
    v36 = (void *)v17;
    if (objc_opt_isKindOfClass())
    {
      v18 = [[JRSchemaJRAction alloc] initWithDictionary:v17];
      [(JRSchemaJRModelOutputs *)v5 setShadowAction:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"shadowCandidates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v20 = [[JRSchemaJRActionCandidateTuple alloc] initWithDictionary:v19];
      [(JRSchemaJRModelOutputs *)v5 setShadowCandidates:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"userHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v19;
      v32 = v12;
      v33 = v8;
      v34 = v6;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[JRSchemaUserHistory alloc] initWithDictionary:v27];
              [(JRSchemaJRModelOutputs *)v5 addUserHistory:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v24);
      }

      int v8 = v33;
      v6 = v34;
      v12 = v32;
      v19 = v31;
    }
    v29 = v5;
  }
  return v5;
}

- (JRSchemaJRModelOutputs)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRModelOutputs *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRModelOutputs *)self dictionaryRepresentation];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_action)
  {
    id v4 = [(JRSchemaJRModelOutputs *)self action];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"action"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"action"];
    }
  }
  if (self->_candidates)
  {
    uint64_t v7 = [(JRSchemaJRModelOutputs *)self candidates];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"candidates"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"candidates"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[JRSchemaJRModelOutputs didJRForcePrompt](self, "didJRForcePrompt"));
    [v3 setObject:v10 forKeyedSubscript:@"didJRForcePrompt"];
  }
  if (self->_jrAnonymizedHistoryAndContext)
  {
    int v11 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"jrAnonymizedHistoryAndContext"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"jrAnonymizedHistoryAndContext"];
    }
  }
  if (self->_modelDiagnosticSignals)
  {
    int v14 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
    uint64_t v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"modelDiagnosticSignals"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"modelDiagnosticSignals"];
    }
  }
  if (self->_ranking)
  {
    uint64_t v17 = [(JRSchemaJRModelOutputs *)self ranking];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"ranking"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"ranking"];
    }
  }
  if (self->_shadowAction)
  {
    int v20 = [(JRSchemaJRModelOutputs *)self shadowAction];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"shadowAction"];
    }
    else
    {
      id v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"shadowAction"];
    }
  }
  if (self->_shadowCandidates)
  {
    uint64_t v23 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
    uint64_t v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"shadowCandidates"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"shadowCandidates"];
    }
  }
  if ([(NSArray *)self->_userHistorys count])
  {
    int v26 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v27 = self->_userHistorys;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (void)v35);
          if (v32)
          {
            [v26 addObject:v32];
          }
          else
          {
            v33 = [MEMORY[0x1E4F1CA98] null];
            [v26 addObject:v33];
          }
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"userHistory"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v35);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(JRSchemaJRAction *)self->_action hash];
  unint64_t v4 = [(JRSchemaJRActionCandidateTuple *)self->_candidates hash];
  unint64_t v5 = [(JRSchemaRanking *)self->_ranking hash];
  unint64_t v6 = [(JRSchemaJRAnonymizedHistoryAndContext *)self->_jrAnonymizedHistoryAndContext hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_didJRForcePrompt;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(JRSchemaJRModelDiagnosticsSignals *)self->_modelDiagnosticSignals hash];
  unint64_t v10 = v8 ^ v9 ^ [(JRSchemaJRAction *)self->_shadowAction hash];
  unint64_t v11 = [(JRSchemaJRActionCandidateTuple *)self->_shadowCandidates hash];
  return v10 ^ v11 ^ [(NSArray *)self->_userHistorys hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self action];
  unint64_t v6 = [v4 action];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v7 = [(JRSchemaJRModelOutputs *)self action];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(JRSchemaJRModelOutputs *)self action];
    unint64_t v10 = [v4 action];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self candidates];
  unint64_t v6 = [v4 candidates];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v12 = [(JRSchemaJRModelOutputs *)self candidates];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(JRSchemaJRModelOutputs *)self candidates];
    uint64_t v15 = [v4 candidates];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self ranking];
  unint64_t v6 = [v4 ranking];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v17 = [(JRSchemaJRModelOutputs *)self ranking];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(JRSchemaJRModelOutputs *)self ranking];
    int v20 = [v4 ranking];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
  unint64_t v6 = [v4 jrAnonymizedHistoryAndContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v22 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
    uint64_t v25 = [v4 jrAnonymizedHistoryAndContext];
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
    int didJRForcePrompt = self->_didJRForcePrompt;
    if (didJRForcePrompt != [v4 didJRForcePrompt]) {
      goto LABEL_45;
    }
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
  unint64_t v6 = [v4 modelDiagnosticSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v28 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
    v31 = [v4 modelDiagnosticSignals];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self shadowAction];
  unint64_t v6 = [v4 shadowAction];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v33 = [(JRSchemaJRModelOutputs *)self shadowAction];
  if (v33)
  {
    v34 = (void *)v33;
    long long v35 = [(JRSchemaJRModelOutputs *)self shadowAction];
    long long v36 = [v4 shadowAction];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
  unint64_t v6 = [v4 shadowCandidates];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v38 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
  if (v38)
  {
    long long v39 = (void *)v38;
    uint64_t v40 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
    long long v41 = [v4 shadowCandidates];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self userHistorys];
  unint64_t v6 = [v4 userHistorys];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v43 = [(JRSchemaJRModelOutputs *)self userHistorys];
    if (!v43)
    {

LABEL_48:
      BOOL v48 = 1;
      goto LABEL_46;
    }
    uint64_t v44 = (void *)v43;
    v45 = [(JRSchemaJRModelOutputs *)self userHistorys];
    v46 = [v4 userHistorys];
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(JRSchemaJRModelOutputs *)self action];

  if (v5)
  {
    unint64_t v6 = [(JRSchemaJRModelOutputs *)self action];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(JRSchemaJRModelOutputs *)self candidates];

  if (v7)
  {
    unint64_t v8 = [(JRSchemaJRModelOutputs *)self candidates];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(JRSchemaJRModelOutputs *)self ranking];

  if (v9)
  {
    unint64_t v10 = [(JRSchemaJRModelOutputs *)self ranking];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];

  if (v11)
  {
    uint64_t v12 = [(JRSchemaJRModelOutputs *)self jrAnonymizedHistoryAndContext];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v13 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];

  if (v13)
  {
    int v14 = [(JRSchemaJRModelOutputs *)self modelDiagnosticSignals];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v15 = [(JRSchemaJRModelOutputs *)self shadowAction];

  if (v15)
  {
    int v16 = [(JRSchemaJRModelOutputs *)self shadowAction];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(JRSchemaJRModelOutputs *)self shadowCandidates];

  if (v17)
  {
    v18 = [(JRSchemaJRModelOutputs *)self shadowCandidates];
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v19 = self->_userHistorys;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRModelOutputsReadFrom(self, (uint64_t)a3);
}

- (id)userHistoryAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userHistorys objectAtIndexedSubscript:a3];
}

- (unint64_t)userHistoryCount
{
  return [(NSArray *)self->_userHistorys count];
}

- (void)addUserHistory:(id)a3
{
  id v4 = a3;
  userHistorys = self->_userHistorys;
  id v8 = v4;
  if (!userHistorys)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userHistorys;
    self->_userHistorys = v6;

    id v4 = v8;
    userHistorys = self->_userHistorys;
  }
  [(NSArray *)userHistorys addObject:v4];
}

- (void)clearUserHistory
{
}

- (void)deleteShadowCandidates
{
}

- (BOOL)hasShadowCandidates
{
  return self->_shadowCandidates != 0;
}

- (void)deleteShadowAction
{
}

- (BOOL)hasShadowAction
{
  return self->_shadowAction != 0;
}

- (void)deleteModelDiagnosticSignals
{
}

- (BOOL)hasModelDiagnosticSignals
{
  return self->_modelDiagnosticSignals != 0;
}

- (void)deleteDidJRForcePrompt
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDidJRForcePrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDidJRForcePrompt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDidJRForcePrompt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int didJRForcePrompt = a3;
}

- (void)deleteJrAnonymizedHistoryAndContext
{
}

- (BOOL)hasJrAnonymizedHistoryAndContext
{
  return self->_jrAnonymizedHistoryAndContext != 0;
}

- (void)deleteRanking
{
}

- (BOOL)hasRanking
{
  return self->_ranking != 0;
}

- (void)deleteCandidates
{
}

- (BOOL)hasCandidates
{
  return self->_candidates != 0;
}

- (void)deleteAction
{
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

@end