@interface CNVSchemaCNVFlowPluginLoadContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasHypothesisId;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVFlowPluginLoadContext)initWithDictionary:(id)a3;
- (CNVSchemaCNVFlowPluginLoadContext)initWithJSON:(id)a3;
- (CNVSchemaCNVFlowPluginLoadContextEnded)ended;
- (CNVSchemaCNVFlowPluginLoadContextFailed)failed;
- (CNVSchemaCNVFlowPluginLoadContextStarted)startedOrChanged;
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
- (void)deleteFailed;
- (void)deleteHypothesisId;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasHypothesisId:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHypothesisId:(id)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVFlowPluginLoadContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNVSchemaCNVFlowPluginLoadContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CNVSchemaCNVFlowPluginLoadContext *)self deleteContextId];
  }
  v9 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CNVSchemaCNVFlowPluginLoadContext *)self deleteStartedOrChanged];
  }
  v12 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CNVSchemaCNVFlowPluginLoadContext *)self deleteEnded];
  }
  v15 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CNVSchemaCNVFlowPluginLoadContext *)self deleteFailed];
  }
  v18 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CNVSchemaCNVFlowPluginLoadContext *)self deleteHypothesisId];
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

- (void)setHasHypothesisId:(BOOL)a3
{
  self->_hasHypothesisId = a3;
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

- (CNVSchemaCNVFlowPluginLoadContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVSchemaCNVFlowPluginLoadContext;
  v5 = [(CNVSchemaCNVFlowPluginLoadContext *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CNVSchemaCNVFlowPluginLoadContext *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CNVSchemaCNVFlowPluginLoadContextStarted alloc] initWithDictionary:v8];
      [(CNVSchemaCNVFlowPluginLoadContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CNVSchemaCNVFlowPluginLoadContextEnded alloc] initWithDictionary:v10];
      [(CNVSchemaCNVFlowPluginLoadContext *)v5 setEnded:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CNVSchemaCNVFlowPluginLoadContextFailed alloc] initWithDictionary:v12];
      [(CNVSchemaCNVFlowPluginLoadContext *)v5 setFailed:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"hypothesisId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(CNVSchemaCNVFlowPluginLoadContext *)v5 setHypothesisId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (CNVSchemaCNVFlowPluginLoadContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVFlowPluginLoadContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVFlowPluginLoadContext *)self dictionaryRepresentation];
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
    id v4 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
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
    uint64_t v7 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
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
    v10 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
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
    v13 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
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
    v16 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
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
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  unint64_t v4 = [(CNVSchemaCNVFlowPluginLoadContextStarted *)self->_startedOrChanged hash] ^ v3;
  unint64_t v5 = [(CNVSchemaCNVFlowPluginLoadContextEnded *)self->_ended hash];
  unint64_t v6 = v4 ^ v5 ^ [(CNVSchemaCNVFlowPluginLoadContextFailed *)self->_failed hash];
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
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
  uint64_t v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
    int v11 = [v4 contextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
    v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
    v21 = [v4 ended];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
    v26 = [v4 failed];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
  uint64_t v7 = [v4 hypothesisId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
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
  id v4 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];

  if (v4)
  {
    unint64_t v5 = [(CNVSchemaCNVFlowPluginLoadContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(CNVSchemaCNVFlowPluginLoadContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];

  if (v8)
  {
    v9 = [(CNVSchemaCNVFlowPluginLoadContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];

  if (v10)
  {
    int v11 = [(CNVSchemaCNVFlowPluginLoadContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];

  if (v12)
  {
    uint64_t v13 = [(CNVSchemaCNVFlowPluginLoadContext *)self hypothesisId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVFlowPluginLoadContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHypothesisId
{
}

- (BOOL)hasHypothesisId
{
  return self->_hypothesisId != 0;
}

- (void)deleteFailed
{
  if (self->_whichContextevent == 4)
  {
    self->_unint64_t whichContextevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CNVSchemaCNVFlowPluginLoadContextFailed)failed
{
  if (self->_whichContextevent == 4) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (CNVSchemaCNVFlowPluginLoadContextFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = 4 * (v4 != 0);
  failed = self->_failed;
  self->_failed = v4;
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

- (CNVSchemaCNVFlowPluginLoadContextEnded)ended
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
  id v4 = (CNVSchemaCNVFlowPluginLoadContextEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
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

- (CNVSchemaCNVFlowPluginLoadContextStarted)startedOrChanged
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
  id v4 = (CNVSchemaCNVFlowPluginLoadContextStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

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