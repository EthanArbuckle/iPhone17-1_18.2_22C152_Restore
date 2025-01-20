@interface CNVSchemaCNVExecutionCommitContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasHypothesisId;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVExecutionCommitContext)initWithDictionary:(id)a3;
- (CNVSchemaCNVExecutionCommitContext)initWithJSON:(id)a3;
- (CNVSchemaCNVExecutionCommitEnded)ended;
- (CNVSchemaCNVExecutionCommitStarted)startedOrChanged;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (SISchemaUUID)hypothesisId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteContextId;
- (void)deleteEnded;
- (void)deleteHypothesisId;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasHypothesisId:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHypothesisId:(id)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVExecutionCommitContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNVSchemaCNVExecutionCommitContext;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CNVSchemaCNVExecutionCommitContext *)self deleteContextId];
  }
  v9 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CNVSchemaCNVExecutionCommitContext *)self deleteStartedOrChanged];
  }
  v12 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CNVSchemaCNVExecutionCommitContext *)self deleteEnded];
  }
  v15 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CNVSchemaCNVExecutionCommitContext *)self deleteHypothesisId];
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
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

- (void)setHasHypothesisId:(BOOL)a3
{
  self->_hasHypothesisId = a3;
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

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void)setHypothesisId:(id)a3
{
}

- (SISchemaUUID)hypothesisId
{
  return self->_hypothesisId;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (CNVSchemaCNVExecutionCommitContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNVSchemaCNVExecutionCommitContext;
  v5 = [(CNVSchemaCNVExecutionCommitContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CNVSchemaCNVExecutionCommitContext *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CNVSchemaCNVExecutionCommitStarted alloc] initWithDictionary:v8];
      [(CNVSchemaCNVExecutionCommitContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CNVSchemaCNVExecutionCommitEnded alloc] initWithDictionary:v10];
      [(CNVSchemaCNVExecutionCommitContext *)v5 setEnded:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"hypothesisId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(CNVSchemaCNVExecutionCommitContext *)v5 setHypothesisId:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (CNVSchemaCNVExecutionCommitContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVExecutionCommitContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVExecutionCommitContext *)self dictionaryRepresentation];
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
  if (self->_contextId)
  {
    id v4 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if (self->_ended)
  {
    uint64_t v7 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
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
  if (self->_hypothesisId)
  {
    v10 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"hypothesisId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"hypothesisId"];
    }
  }
  if (self->_startedOrChanged)
  {
    v13 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  unint64_t v4 = [(CNVSchemaCNVExecutionCommitStarted *)self->_startedOrChanged hash] ^ v3;
  unint64_t v5 = [(CNVSchemaCNVExecutionCommitEnded *)self->_ended hash];
  return v4 ^ v5 ^ [(SISchemaUUID *)self->_hypothesisId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_23;
  }
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
  uint64_t v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
    int v11 = [v4 contextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
    objc_super v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
    v21 = [v4 ended];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
  uint64_t v7 = [v4 hypothesisId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
    v26 = [v4 hypothesisId];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];

  if (v4)
  {
    unint64_t v5 = [(CNVSchemaCNVExecutionCommitContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(CNVSchemaCNVExecutionCommitContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CNVSchemaCNVExecutionCommitContext *)self ended];

  if (v8)
  {
    v9 = [(CNVSchemaCNVExecutionCommitContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];

  if (v10)
  {
    int v11 = [(CNVSchemaCNVExecutionCommitContext *)self hypothesisId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVExecutionCommitContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHypothesisId
{
}

- (BOOL)hasHypothesisId
{
  return self->_hypothesisId != 0;
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 3)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVExecutionCommitEnded)ended
{
  if (self->_whichContextevent == 3) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (CNVSchemaCNVExecutionCommitEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 2)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVExecutionCommitStarted)startedOrChanged
{
  if (self->_whichContextevent == 2) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (CNVSchemaCNVExecutionCommitStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = 2 * (v4 != 0);
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

@end