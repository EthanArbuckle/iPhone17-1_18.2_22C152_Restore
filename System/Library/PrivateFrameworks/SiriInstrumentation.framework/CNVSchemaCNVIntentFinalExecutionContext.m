@interface CNVSchemaCNVIntentFinalExecutionContext
- (BOOL)hasCancelled;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasHypothesisId;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionCancelled)cancelled;
- (CNVSchemaCNVIntentFinalExecutionContext)initWithDictionary:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionContext)initWithJSON:(id)a3;
- (CNVSchemaCNVIntentFinalExecutionEnded)ended;
- (CNVSchemaCNVIntentFinalExecutionFailed)failed;
- (CNVSchemaCNVIntentFinalExecutionStarted)startedOrChanged;
- (NSData)jsonData;
- (SISchemaUUID)hypothesisId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteCancelled;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteHypothesisId;
- (void)deleteStartedOrChanged;
- (void)setCancelled:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasHypothesisId:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHypothesisId:(id)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVIntentFinalExecutionContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNVSchemaCNVIntentFinalExecutionContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CNVSchemaCNVIntentFinalExecutionContext *)self deleteStartedOrChanged];
  }
  v9 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CNVSchemaCNVIntentFinalExecutionContext *)self deleteEnded];
  }
  v12 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CNVSchemaCNVIntentFinalExecutionContext *)self deleteFailed];
  }
  v15 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CNVSchemaCNVIntentFinalExecutionContext *)self deleteCancelled];
  }
  v18 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CNVSchemaCNVIntentFinalExecutionContext *)self deleteHypothesisId];
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
  objc_storeStrong((id *)&self->_hypothesisId, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

- (void)setHasHypothesisId:(BOOL)a3
{
  self->_hasHypothesisId = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHypothesisId:(id)a3
{
}

- (SISchemaUUID)hypothesisId
{
  return self->_hypothesisId;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (CNVSchemaCNVIntentFinalExecutionContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVSchemaCNVIntentFinalExecutionContext;
  v5 = [(CNVSchemaCNVIntentFinalExecutionContext *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CNVSchemaCNVIntentFinalExecutionStarted alloc] initWithDictionary:v6];
      [(CNVSchemaCNVIntentFinalExecutionContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CNVSchemaCNVIntentFinalExecutionEnded alloc] initWithDictionary:v8];
      [(CNVSchemaCNVIntentFinalExecutionContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CNVSchemaCNVIntentFinalExecutionFailed alloc] initWithDictionary:v10];
      [(CNVSchemaCNVIntentFinalExecutionContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"cancelled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CNVSchemaCNVIntentFinalExecutionCancelled alloc] initWithDictionary:v12];
      [(CNVSchemaCNVIntentFinalExecutionContext *)v5 setCancelled:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"hypothesisId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(CNVSchemaCNVIntentFinalExecutionContext *)v5 setHypothesisId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVIntentFinalExecutionContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVIntentFinalExecutionContext *)self dictionaryRepresentation];
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
  if (self->_cancelled)
  {
    id v4 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cancelled"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cancelled"];
    }
  }
  if (self->_ended)
  {
    uint64_t v7 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ended"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_failed)
  {
    v10 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"failed"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"failed"];
    }
  }
  if (self->_hypothesisId)
  {
    v13 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"hypothesisId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"hypothesisId"];
    }
  }
  if (self->_startedOrChanged)
  {
    v16 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CNVSchemaCNVIntentFinalExecutionStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(CNVSchemaCNVIntentFinalExecutionEnded *)self->_ended hash] ^ v3;
  unint64_t v5 = [(CNVSchemaCNVIntentFinalExecutionFailed *)self->_failed hash];
  unint64_t v6 = v4 ^ v5 ^ [(CNVSchemaCNVIntentFinalExecutionCancelled *)self->_cancelled hash];
  return v6 ^ [(SISchemaUUID *)self->_hypothesisId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_28;
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
    v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
  uint64_t v7 = [v4 cancelled];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
    v26 = [v4 cancelled];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
  uint64_t v7 = [v4 hypothesisId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
    v31 = [v4 hypothesisId];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_31;
    }
  }
  else
  {
LABEL_27:
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];

  if (v4)
  {
    unint64_t v5 = [(CNVSchemaCNVIntentFinalExecutionContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(CNVSchemaCNVIntentFinalExecutionContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];

  if (v8)
  {
    v9 = [(CNVSchemaCNVIntentFinalExecutionContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];

  if (v10)
  {
    int v11 = [(CNVSchemaCNVIntentFinalExecutionContext *)self cancelled];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];

  if (v12)
  {
    uint64_t v13 = [(CNVSchemaCNVIntentFinalExecutionContext *)self hypothesisId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHypothesisId
{
}

- (BOOL)hasHypothesisId
{
  return self->_hypothesisId != 0;
}

- (void)deleteCancelled
{
  if (self->_whichContextevent == 4)
  {
    self->_unint64_t whichContextevent = 0;
    self->_cancelled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVIntentFinalExecutionCancelled)cancelled
{
  if (self->_whichContextevent == 4) {
    v2 = self->_cancelled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancelled:(id)a3
{
  id v4 = (CNVSchemaCNVIntentFinalExecutionCancelled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_unint64_t whichContextevent = 4 * (v4 != 0);
  cancelled = self->_cancelled;
  self->_cancelled = v4;
}

- (void)deleteFailed
{
  if (self->_whichContextevent == 3)
  {
    self->_unint64_t whichContextevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVIntentFinalExecutionFailed)failed
{
  if (self->_whichContextevent == 3) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (CNVSchemaCNVIntentFinalExecutionFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichContextevent = v8;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 2)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVIntentFinalExecutionEnded)ended
{
  if (self->_whichContextevent == 2) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (CNVSchemaCNVIntentFinalExecutionEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_unint64_t whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 1)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVIntentFinalExecutionStarted)startedOrChanged
{
  if (self->_whichContextevent == 1) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (CNVSchemaCNVIntentFinalExecutionStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end