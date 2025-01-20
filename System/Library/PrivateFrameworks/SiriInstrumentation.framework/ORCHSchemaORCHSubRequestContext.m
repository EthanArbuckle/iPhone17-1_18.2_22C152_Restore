@interface ORCHSchemaORCHSubRequestContext
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStartedOrChanged;
- (BOOL)hasSubRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHSubRequestContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHSubRequestContext)initWithJSON:(id)a3;
- (ORCHSchemaORCHSubRequestEnded)ended;
- (ORCHSchemaORCHSubRequestFailed)failed;
- (ORCHSchemaORCHSubRequestStarted)startedOrChanged;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichSubrequestevent;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteStartedOrChanged;
- (void)deleteSubRequestId;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHSubRequestContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ORCHSchemaORCHSubRequestContext;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHSubRequestContext *)self deleteSubRequestId];
  }
  v9 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHSubRequestContext *)self deleteStartedOrChanged];
  }
  v12 = [(ORCHSchemaORCHSubRequestContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHSubRequestContext *)self deleteFailed];
  }
  v15 = [(ORCHSchemaORCHSubRequestContext *)self ended];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ORCHSchemaORCHSubRequestContext *)self deleteEnded];
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (unint64_t)whichSubrequestevent
{
  return self->_whichSubrequestevent;
}

- (ORCHSchemaORCHSubRequestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHSubRequestContext;
  v5 = [(ORCHSchemaORCHSubRequestContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHSubRequestContext *)v5 setSubRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ORCHSchemaORCHSubRequestStarted alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHSubRequestContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ORCHSchemaORCHSubRequestFailed alloc] initWithDictionary:v10];
      [(ORCHSchemaORCHSubRequestContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ORCHSchemaORCHSubRequestEnded alloc] initWithDictionary:v12];
      [(ORCHSchemaORCHSubRequestContext *)v5 setEnded:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHSubRequestContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHSubRequestContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHSubRequestContext *)self dictionaryRepresentation];
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
  if (self->_ended)
  {
    id v4 = [(ORCHSchemaORCHSubRequestContext *)self ended];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"ended"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_failed)
  {
    uint64_t v7 = [(ORCHSchemaORCHSubRequestContext *)self failed];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failed"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"failed"];
    }
  }
  if (self->_startedOrChanged)
  {
    v10 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
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
  if (self->_subRequestId)
  {
    v13 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"subRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_subRequestId hash];
  unint64_t v4 = [(ORCHSchemaORCHSubRequestStarted *)self->_startedOrChanged hash] ^ v3;
  unint64_t v5 = [(ORCHSchemaORCHSubRequestFailed *)self->_failed hash];
  return v4 ^ v5 ^ [(ORCHSchemaORCHSubRequestEnded *)self->_ended hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichSubrequestevent = self->_whichSubrequestevent;
  if (whichSubrequestevent != [v4 whichSubrequestevent]) {
    goto LABEL_23;
  }
  v6 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
  uint64_t v7 = [v4 subRequestId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
    int v11 = [v4 subRequestId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
    objc_super v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHSubRequestContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(ORCHSchemaORCHSubRequestContext *)self failed];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(ORCHSchemaORCHSubRequestContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHSubRequestContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(ORCHSchemaORCHSubRequestContext *)self ended];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(ORCHSchemaORCHSubRequestContext *)self ended];
    v26 = [v4 ended];
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
  id v4 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];

  if (v4)
  {
    unint64_t v5 = [(ORCHSchemaORCHSubRequestContext *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHSubRequestContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ORCHSchemaORCHSubRequestContext *)self failed];

  if (v8)
  {
    v9 = [(ORCHSchemaORCHSubRequestContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ORCHSchemaORCHSubRequestContext *)self ended];

  if (v10)
  {
    int v11 = [(ORCHSchemaORCHSubRequestContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHSubRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnded
{
  if (self->_whichSubrequestevent == 103)
  {
    self->_unint64_t whichSubrequestevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHSubRequestEnded)ended
{
  if (self->_whichSubrequestevent == 103) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (ORCHSchemaORCHSubRequestEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichSubrequestevent = v7;
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteFailed
{
  if (self->_whichSubrequestevent == 102)
  {
    self->_unint64_t whichSubrequestevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHSubRequestFailed)failed
{
  if (self->_whichSubrequestevent == 102) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (ORCHSchemaORCHSubRequestFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichSubrequestevent = v7;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichSubrequestevent == 101)
  {
    self->_unint64_t whichSubrequestevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHSubRequestStarted)startedOrChanged
{
  if (self->_whichSubrequestevent == 101) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (ORCHSchemaORCHSubRequestStarted *)a3;
  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichSubrequestevent = v7;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

@end