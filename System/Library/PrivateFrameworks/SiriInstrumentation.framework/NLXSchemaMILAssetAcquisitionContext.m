@interface NLXSchemaMILAssetAcquisitionContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMILAssetAcquisitionContext)initWithDictionary:(id)a3;
- (NLXSchemaMILAssetAcquisitionContext)initWithJSON:(id)a3;
- (NLXSchemaMILAssetAcquisitionEnded)ended;
- (NLXSchemaMILAssetAcquisitionFailed)failed;
- (NLXSchemaMILAssetAcquisitionStarted)startedOrChanged;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteContextId;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMILAssetAcquisitionContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NLXSchemaMILAssetAcquisitionContext;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaMILAssetAcquisitionContext *)self deleteContextId];
  }
  v9 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaMILAssetAcquisitionContext *)self deleteStartedOrChanged];
  }
  v12 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaMILAssetAcquisitionContext *)self deleteEnded];
  }
  v15 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLXSchemaMILAssetAcquisitionContext *)self deleteFailed];
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
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

- (NLXSchemaMILAssetAcquisitionContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaMILAssetAcquisitionContext;
  v5 = [(NLXSchemaMILAssetAcquisitionContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaMILAssetAcquisitionContext *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NLXSchemaMILAssetAcquisitionStarted alloc] initWithDictionary:v8];
      [(NLXSchemaMILAssetAcquisitionContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaMILAssetAcquisitionEnded alloc] initWithDictionary:v10];
      [(NLXSchemaMILAssetAcquisitionContext *)v5 setEnded:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[NLXSchemaMILAssetAcquisitionFailed alloc] initWithDictionary:v12];
      [(NLXSchemaMILAssetAcquisitionContext *)v5 setFailed:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (NLXSchemaMILAssetAcquisitionContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMILAssetAcquisitionContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMILAssetAcquisitionContext *)self dictionaryRepresentation];
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
    id v4 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
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
    uint64_t v7 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
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
    v10 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
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
  if (self->_startedOrChanged)
  {
    v13 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
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
  unint64_t v4 = [(NLXSchemaMILAssetAcquisitionStarted *)self->_startedOrChanged hash] ^ v3;
  unint64_t v5 = [(NLXSchemaMILAssetAcquisitionEnded *)self->_ended hash];
  return v4 ^ v5 ^ [(NLXSchemaMILAssetAcquisitionFailed *)self->_failed hash];
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
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
  uint64_t v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
    int v11 = [v4 contextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
    objc_super v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
    v21 = [v4 ended];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
    v26 = [v4 failed];
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
  id v4 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaMILAssetAcquisitionContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaMILAssetAcquisitionContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];

  if (v8)
  {
    v9 = [(NLXSchemaMILAssetAcquisitionContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];

  if (v10)
  {
    int v11 = [(NLXSchemaMILAssetAcquisitionContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMILAssetAcquisitionContextReadFrom(self, (uint64_t)a3);
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

- (NLXSchemaMILAssetAcquisitionFailed)failed
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
  id v4 = (NLXSchemaMILAssetAcquisitionFailed *)a3;
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

- (NLXSchemaMILAssetAcquisitionEnded)ended
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
  id v4 = (NLXSchemaMILAssetAcquisitionEnded *)a3;
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

- (NLXSchemaMILAssetAcquisitionStarted)startedOrChanged
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
  id v4 = (NLXSchemaMILAssetAcquisitionStarted *)a3;
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