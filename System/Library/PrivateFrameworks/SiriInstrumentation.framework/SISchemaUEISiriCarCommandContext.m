@interface SISchemaUEISiriCarCommandContext
- (BOOL)hasCancelled;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEISiriCarCommandCancelled)cancelled;
- (SISchemaUEISiriCarCommandContext)initWithDictionary:(id)a3;
- (SISchemaUEISiriCarCommandContext)initWithJSON:(id)a3;
- (SISchemaUEISiriCarCommandEnded)ended;
- (SISchemaUEISiriCarCommandFailed)failed;
- (SISchemaUEISiriCarCommandStarted)startedOrChanged;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteCancelled;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteStartedOrChanged;
- (void)setCancelled:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEISiriCarCommandContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaUEISiriCarCommandContext;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUEISiriCarCommandContext *)self deleteStartedOrChanged];
  }
  v9 = [(SISchemaUEISiriCarCommandContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUEISiriCarCommandContext *)self deleteEnded];
  }
  v12 = [(SISchemaUEISiriCarCommandContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaUEISiriCarCommandContext *)self deleteFailed];
  }
  v15 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaUEISiriCarCommandContext *)self deleteCancelled];
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
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
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

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUEISiriCarCommandContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaUEISiriCarCommandContext;
  v5 = [(SISchemaUEISiriCarCommandContext *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUEISiriCarCommandStarted alloc] initWithDictionary:v6];
      [(SISchemaUEISiriCarCommandContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUEISiriCarCommandEnded alloc] initWithDictionary:v8];
      [(SISchemaUEISiriCarCommandContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUEISiriCarCommandFailed alloc] initWithDictionary:v10];
      [(SISchemaUEISiriCarCommandContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"cancelled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUEISiriCarCommandCancelled alloc] initWithDictionary:v12];
      [(SISchemaUEISiriCarCommandContext *)v5 setCancelled:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (SISchemaUEISiriCarCommandContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEISiriCarCommandContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEISiriCarCommandContext *)self dictionaryRepresentation];
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
    id v4 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
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
    uint64_t v7 = [(SISchemaUEISiriCarCommandContext *)self ended];
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
    v10 = [(SISchemaUEISiriCarCommandContext *)self failed];
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
    v13 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
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
  unint64_t v3 = [(SISchemaUEISiriCarCommandStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(SISchemaUEISiriCarCommandEnded *)self->_ended hash] ^ v3;
  unint64_t v5 = [(SISchemaUEISiriCarCommandFailed *)self->_failed hash];
  return v4 ^ v5 ^ [(SISchemaUEISiriCarCommandCancelled *)self->_cancelled hash];
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
  v6 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUEISiriCarCommandContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(SISchemaUEISiriCarCommandContext *)self ended];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SISchemaUEISiriCarCommandContext *)self ended];
    objc_super v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUEISiriCarCommandContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(SISchemaUEISiriCarCommandContext *)self failed];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(SISchemaUEISiriCarCommandContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
  uint64_t v7 = [v4 cancelled];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
    v26 = [v4 cancelled];
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
  id v4 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];

  if (v4)
  {
    unint64_t v5 = [(SISchemaUEISiriCarCommandContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaUEISiriCarCommandContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(SISchemaUEISiriCarCommandContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaUEISiriCarCommandContext *)self failed];

  if (v8)
  {
    v9 = [(SISchemaUEISiriCarCommandContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SISchemaUEISiriCarCommandContext *)self cancelled];

  if (v10)
  {
    int v11 = [(SISchemaUEISiriCarCommandContext *)self cancelled];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEISiriCarCommandContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteCancelled
{
  if (self->_whichContextevent == 104)
  {
    self->_unint64_t whichContextevent = 0;
    self->_cancelled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEISiriCarCommandCancelled)cancelled
{
  if (self->_whichContextevent == 104) {
    v2 = self->_cancelled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancelled:(id)a3
{
  id v4 = (SISchemaUEISiriCarCommandCancelled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  unint64_t v8 = 104;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichContextevent = v8;
  cancelled = self->_cancelled;
  self->_cancelled = v4;
}

- (void)deleteFailed
{
  if (self->_whichContextevent == 103)
  {
    self->_unint64_t whichContextevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEISiriCarCommandFailed)failed
{
  if (self->_whichContextevent == 103) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (SISchemaUEISiriCarCommandFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  unint64_t v8 = 103;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichContextevent = v8;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 102)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEISiriCarCommandEnded)ended
{
  if (self->_whichContextevent == 102) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (SISchemaUEISiriCarCommandEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  unint64_t v8 = 102;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichContextevent = v8;
  ended = self->_ended;
  self->_ended = v4;
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

- (SISchemaUEISiriCarCommandStarted)startedOrChanged
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
  id v4 = (SISchemaUEISiriCarCommandStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  unint64_t v8 = 101;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichContextevent = v8;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end