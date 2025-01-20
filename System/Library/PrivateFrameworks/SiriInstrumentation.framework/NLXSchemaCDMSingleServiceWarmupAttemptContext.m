@interface NLXSchemaCDMSingleServiceWarmupAttemptContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSingleServiceWarmupAttemptContext)initWithDictionary:(id)a3;
- (NLXSchemaCDMSingleServiceWarmupAttemptContext)initWithJSON:(id)a3;
- (NLXSchemaCDMSingleServiceWarmupAttemptEnded)ended;
- (NLXSchemaCDMSingleServiceWarmupAttemptStarted)startedOrChanged;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteContextId;
- (void)deleteEnded;
- (void)deleteStartedOrChanged;
- (void)setContextId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSingleServiceWarmupAttemptContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMSingleServiceWarmupAttemptContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self deleteContextId];
  }
  v9 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self deleteStartedOrChanged];
  }
  v12 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self deleteEnded];
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
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
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

- (NLXSchemaCDMSingleServiceWarmupAttemptContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLXSchemaCDMSingleServiceWarmupAttemptContext;
  v5 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NLXSchemaCDMSingleServiceWarmupAttemptStarted alloc] initWithDictionary:v8];
      [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaCDMSingleServiceWarmupAttemptEnded alloc] initWithDictionary:v10];
      [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)v5 setEnded:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSingleServiceWarmupAttemptContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self dictionaryRepresentation];
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
    id v4 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
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
    uint64_t v7 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
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
  if (self->_startedOrChanged)
  {
    v10 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  unint64_t v4 = [(NLXSchemaCDMSingleServiceWarmupAttemptStarted *)self->_startedOrChanged hash] ^ v3;
  return v4 ^ [(NLXSchemaCDMSingleServiceWarmupAttemptEnded *)self->_ended hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_18;
  }
  v6 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
  uint64_t v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
    int v11 = [v4 contextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
    objc_super v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
    v21 = [v4 ended];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];

  if (v4)
  {
    v5 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];

  if (v8)
  {
    v9 = [(NLXSchemaCDMSingleServiceWarmupAttemptContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSingleServiceWarmupAttemptContextReadFrom(self, (uint64_t)a3);
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

- (NLXSchemaCDMSingleServiceWarmupAttemptEnded)ended
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
  id v4 = (NLXSchemaCDMSingleServiceWarmupAttemptEnded *)a3;
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

- (NLXSchemaCDMSingleServiceWarmupAttemptStarted)startedOrChanged
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
  id v4 = (NLXSchemaCDMSingleServiceWarmupAttemptStarted *)a3;
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