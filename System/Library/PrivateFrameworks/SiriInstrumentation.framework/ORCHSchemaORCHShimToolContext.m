@interface ORCHSchemaORCHShimToolContext
- (BOOL)hasClientTraceId;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStartedOrChanged;
- (BOOL)hasSubRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHShimToolContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHShimToolContext)initWithJSON:(id)a3;
- (ORCHSchemaORCHShimToolEnded)ended;
- (ORCHSchemaORCHShimToolFailed)failed;
- (ORCHSchemaORCHShimToolStarted)startedOrChanged;
- (SISchemaUUID)clientTraceId;
- (SISchemaUUID)subRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteClientTraceId;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteStartedOrChanged;
- (void)deleteSubRequestId;
- (void)setClientTraceId:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasClientTraceId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHShimToolContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ORCHSchemaORCHShimToolContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHShimToolContext *)self deleteClientTraceId];
  }
  v9 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHShimToolContext *)self deleteSubRequestId];
  }
  v12 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHShimToolContext *)self deleteStartedOrChanged];
  }
  v15 = [(ORCHSchemaORCHShimToolContext *)self failed];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ORCHSchemaORCHShimToolContext *)self deleteFailed];
  }
  v18 = [(ORCHSchemaORCHShimToolContext *)self ended];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ORCHSchemaORCHShimToolContext *)self deleteEnded];
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
  objc_storeStrong((id *)&self->_clientTraceId, 0);
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

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasClientTraceId = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setClientTraceId:(id)a3
{
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (ORCHSchemaORCHShimToolContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ORCHSchemaORCHShimToolContext;
  v5 = [(ORCHSchemaORCHShimToolContext *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clientTraceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHShimToolContext *)v5 setClientTraceId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHShimToolContext *)v5 setSubRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ORCHSchemaORCHShimToolStarted alloc] initWithDictionary:v10];
      [(ORCHSchemaORCHShimToolContext *)v5 setStartedOrChanged:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ORCHSchemaORCHShimToolFailed alloc] initWithDictionary:v12];
      [(ORCHSchemaORCHShimToolContext *)v5 setFailed:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ORCHSchemaORCHShimToolEnded alloc] initWithDictionary:v14];
      [(ORCHSchemaORCHShimToolContext *)v5 setEnded:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHShimToolContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHShimToolContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHShimToolContext *)self dictionaryRepresentation];
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
  if (self->_clientTraceId)
  {
    id v4 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientTraceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientTraceId"];
    }
  }
  if (self->_ended)
  {
    uint64_t v7 = [(ORCHSchemaORCHShimToolContext *)self ended];
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
    v10 = [(ORCHSchemaORCHShimToolContext *)self failed];
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
    v13 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
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
  if (self->_subRequestId)
  {
    v16 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"subRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clientTraceId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_subRequestId hash] ^ v3;
  unint64_t v5 = [(ORCHSchemaORCHShimToolStarted *)self->_startedOrChanged hash];
  unint64_t v6 = v4 ^ v5 ^ [(ORCHSchemaORCHShimToolFailed *)self->_failed hash];
  return v6 ^ [(ORCHSchemaORCHShimToolEnded *)self->_ended hash];
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
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
  uint64_t v7 = [v4 clientTraceId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
    int v11 = [v4 clientTraceId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
  uint64_t v7 = [v4 subRequestId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
    v16 = [v4 subRequestId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
    v21 = [v4 startedOrChanged];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(ORCHSchemaORCHShimToolContext *)self failed];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(ORCHSchemaORCHShimToolContext *)self failed];
    v26 = [v4 failed];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(ORCHSchemaORCHShimToolContext *)self ended];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(ORCHSchemaORCHShimToolContext *)self ended];
    v31 = [v4 ended];
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
  id v4 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];

  if (v4)
  {
    unint64_t v5 = [(ORCHSchemaORCHShimToolContext *)self clientTraceId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHShimToolContext *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];

  if (v8)
  {
    v9 = [(ORCHSchemaORCHShimToolContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ORCHSchemaORCHShimToolContext *)self failed];

  if (v10)
  {
    int v11 = [(ORCHSchemaORCHShimToolContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(ORCHSchemaORCHShimToolContext *)self ended];

  if (v12)
  {
    uint64_t v13 = [(ORCHSchemaORCHShimToolContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHShimToolContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 103)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHShimToolEnded)ended
{
  if (self->_whichContextevent == 103) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (ORCHSchemaORCHShimToolEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v7 = 103;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteFailed
{
  if (self->_whichContextevent == 102)
  {
    self->_unint64_t whichContextevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHShimToolFailed)failed
{
  if (self->_whichContextevent == 102) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (ORCHSchemaORCHShimToolFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 102;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 101)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHShimToolStarted)startedOrChanged
{
  if (self->_whichContextevent == 101) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (ORCHSchemaORCHShimToolStarted *)a3;
  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 101;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContextevent = v7;
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

- (void)deleteClientTraceId
{
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

@end