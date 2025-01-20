@interface GATSchemaGATRequestContext
- (BOOL)hasCanceled;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasHandoff;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATRequestCanceled)canceled;
- (GATSchemaGATRequestContext)initWithDictionary:(id)a3;
- (GATSchemaGATRequestContext)initWithJSON:(id)a3;
- (GATSchemaGATRequestEnded)ended;
- (GATSchemaGATRequestFailed)failed;
- (GATSchemaGATRequestHandoff)handoff;
- (GATSchemaGATRequestStarted)startedOrChanged;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteCanceled;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteHandoff;
- (void)deleteStartedOrChanged;
- (void)setCanceled:(id)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHandoff:(id)a3;
- (void)setHasCanceled:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasHandoff:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATRequestContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GATSchemaGATRequestContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(GATSchemaGATRequestContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GATSchemaGATRequestContext *)self deleteStartedOrChanged];
  }
  v9 = [(GATSchemaGATRequestContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GATSchemaGATRequestContext *)self deleteEnded];
  }
  v12 = [(GATSchemaGATRequestContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(GATSchemaGATRequestContext *)self deleteFailed];
  }
  v15 = [(GATSchemaGATRequestContext *)self canceled];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(GATSchemaGATRequestContext *)self deleteCanceled];
  }
  v18 = [(GATSchemaGATRequestContext *)self handoff];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(GATSchemaGATRequestContext *)self deleteHandoff];
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
  objc_storeStrong((id *)&self->_handoff, 0);
  objc_storeStrong((id *)&self->_canceled, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

- (void)setHasHandoff:(BOOL)a3
{
  self->_hasHandoff = a3;
}

- (BOOL)hasHandoff
{
  return self->_hasHandoff;
}

- (void)setHasCanceled:(BOOL)a3
{
  self->_hasCanceled = a3;
}

- (BOOL)hasCanceled
{
  return self->_hasCanceled;
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

- (GATSchemaGATRequestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GATSchemaGATRequestContext;
  v5 = [(GATSchemaGATRequestContext *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GATSchemaGATRequestStarted alloc] initWithDictionary:v6];
      [(GATSchemaGATRequestContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GATSchemaGATRequestEnded alloc] initWithDictionary:v8];
      [(GATSchemaGATRequestContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[GATSchemaGATRequestFailed alloc] initWithDictionary:v10];
      [(GATSchemaGATRequestContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"canceled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[GATSchemaGATRequestCanceled alloc] initWithDictionary:v12];
      [(GATSchemaGATRequestContext *)v5 setCanceled:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"handoff"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[GATSchemaGATRequestHandoff alloc] initWithDictionary:v14];
      [(GATSchemaGATRequestContext *)v5 setHandoff:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (GATSchemaGATRequestContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATRequestContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATRequestContext *)self dictionaryRepresentation];
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
  if (self->_canceled)
  {
    id v4 = [(GATSchemaGATRequestContext *)self canceled];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"canceled"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"canceled"];
    }
  }
  if (self->_ended)
  {
    uint64_t v7 = [(GATSchemaGATRequestContext *)self ended];
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
    v10 = [(GATSchemaGATRequestContext *)self failed];
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
  if (self->_handoff)
  {
    v13 = [(GATSchemaGATRequestContext *)self handoff];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"handoff"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"handoff"];
    }
  }
  if (self->_startedOrChanged)
  {
    v16 = [(GATSchemaGATRequestContext *)self startedOrChanged];
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
  unint64_t v3 = [(GATSchemaGATRequestStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(GATSchemaGATRequestEnded *)self->_ended hash] ^ v3;
  unint64_t v5 = [(GATSchemaGATRequestFailed *)self->_failed hash];
  unint64_t v6 = v4 ^ v5 ^ [(GATSchemaGATRequestCanceled *)self->_canceled hash];
  return v6 ^ [(GATSchemaGATRequestHandoff *)self->_handoff hash];
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
  unint64_t v6 = [(GATSchemaGATRequestContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(GATSchemaGATRequestContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GATSchemaGATRequestContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATRequestContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(GATSchemaGATRequestContext *)self ended];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(GATSchemaGATRequestContext *)self ended];
    v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATRequestContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(GATSchemaGATRequestContext *)self failed];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(GATSchemaGATRequestContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATRequestContext *)self canceled];
  uint64_t v7 = [v4 canceled];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(GATSchemaGATRequestContext *)self canceled];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(GATSchemaGATRequestContext *)self canceled];
    v26 = [v4 canceled];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATRequestContext *)self handoff];
  uint64_t v7 = [v4 handoff];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(GATSchemaGATRequestContext *)self handoff];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(GATSchemaGATRequestContext *)self handoff];
    v31 = [v4 handoff];
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
  id v4 = [(GATSchemaGATRequestContext *)self startedOrChanged];

  if (v4)
  {
    unint64_t v5 = [(GATSchemaGATRequestContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(GATSchemaGATRequestContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(GATSchemaGATRequestContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(GATSchemaGATRequestContext *)self failed];

  if (v8)
  {
    v9 = [(GATSchemaGATRequestContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(GATSchemaGATRequestContext *)self canceled];

  if (v10)
  {
    int v11 = [(GATSchemaGATRequestContext *)self canceled];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(GATSchemaGATRequestContext *)self handoff];

  if (v12)
  {
    uint64_t v13 = [(GATSchemaGATRequestContext *)self handoff];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GATSchemaGATRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHandoff
{
  if (self->_whichContextevent == 5)
  {
    self->_unint64_t whichContextevent = 0;
    self->_handoff = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATRequestHandoff)handoff
{
  if (self->_whichContextevent == 5) {
    v2 = self->_handoff;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHandoff:(id)a3
{
  id v4 = (GATSchemaGATRequestHandoff *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  canceled = self->_canceled;
  self->_canceled = 0;

  unint64_t v9 = 5;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichContextevent = v9;
  handoff = self->_handoff;
  self->_handoff = v4;
}

- (void)deleteCanceled
{
  if (self->_whichContextevent == 4)
  {
    self->_unint64_t whichContextevent = 0;
    self->_canceled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATRequestCanceled)canceled
{
  if (self->_whichContextevent == 4) {
    v2 = self->_canceled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCanceled:(id)a3
{
  id v4 = (GATSchemaGATRequestCanceled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  handoff = self->_handoff;
  self->_handoff = 0;

  self->_unint64_t whichContextevent = 4 * (v4 != 0);
  canceled = self->_canceled;
  self->_canceled = v4;
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

- (GATSchemaGATRequestFailed)failed
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
  id v4 = (GATSchemaGATRequestFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  canceled = self->_canceled;
  self->_canceled = 0;

  handoff = self->_handoff;
  self->_handoff = 0;

  unint64_t v9 = 3;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichContextevent = v9;
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

- (GATSchemaGATRequestEnded)ended
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
  id v4 = (GATSchemaGATRequestEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  canceled = self->_canceled;
  self->_canceled = 0;

  handoff = self->_handoff;
  self->_handoff = 0;

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

- (GATSchemaGATRequestStarted)startedOrChanged
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
  id v4 = (GATSchemaGATRequestStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  canceled = self->_canceled;
  self->_canceled = 0;

  handoff = self->_handoff;
  self->_handoff = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end