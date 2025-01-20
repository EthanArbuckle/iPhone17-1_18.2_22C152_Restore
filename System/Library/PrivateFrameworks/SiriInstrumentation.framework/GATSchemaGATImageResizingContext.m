@interface GATSchemaGATImageResizingContext
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATImageResizingContext)initWithDictionary:(id)a3;
- (GATSchemaGATImageResizingContext)initWithJSON:(id)a3;
- (GATSchemaGATImageResizingEventEnded)ended;
- (GATSchemaGATImageResizingEventFailed)failed;
- (GATSchemaGATImageResizingEventStarted)startedOrChanged;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContentevent;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deleteStartedOrChanged;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATImageResizingContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GATSchemaGATImageResizingContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GATSchemaGATImageResizingContext *)self deleteStartedOrChanged];
  }
  v9 = [(GATSchemaGATImageResizingContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GATSchemaGATImageResizingContext *)self deleteEnded];
  }
  v12 = [(GATSchemaGATImageResizingContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(GATSchemaGATImageResizingContext *)self deleteFailed];
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

- (unint64_t)whichContentevent
{
  return self->_whichContentevent;
}

- (GATSchemaGATImageResizingContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GATSchemaGATImageResizingContext;
  v5 = [(GATSchemaGATImageResizingContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GATSchemaGATImageResizingEventStarted alloc] initWithDictionary:v6];
      [(GATSchemaGATImageResizingContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GATSchemaGATImageResizingEventEnded alloc] initWithDictionary:v8];
      [(GATSchemaGATImageResizingContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[GATSchemaGATImageResizingEventFailed alloc] initWithDictionary:v10];
      [(GATSchemaGATImageResizingContext *)v5 setFailed:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (GATSchemaGATImageResizingContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATImageResizingContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATImageResizingContext *)self dictionaryRepresentation];
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
    id v4 = [(GATSchemaGATImageResizingContext *)self ended];
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
    uint64_t v7 = [(GATSchemaGATImageResizingContext *)self failed];
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
    v10 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
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
  unint64_t v3 = [(GATSchemaGATImageResizingEventStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(GATSchemaGATImageResizingEventEnded *)self->_ended hash] ^ v3;
  return v4 ^ [(GATSchemaGATImageResizingEventFailed *)self->_failed hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichContentevent = self->_whichContentevent;
  if (whichContentevent != [v4 whichContentevent]) {
    goto LABEL_18;
  }
  v6 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(GATSchemaGATImageResizingContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(GATSchemaGATImageResizingContext *)self ended];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(GATSchemaGATImageResizingContext *)self ended];
    objc_super v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(GATSchemaGATImageResizingContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(GATSchemaGATImageResizingContext *)self failed];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(GATSchemaGATImageResizingContext *)self failed];
    v21 = [v4 failed];
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
  id v4 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];

  if (v4)
  {
    v5 = [(GATSchemaGATImageResizingContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(GATSchemaGATImageResizingContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(GATSchemaGATImageResizingContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(GATSchemaGATImageResizingContext *)self failed];

  if (v8)
  {
    v9 = [(GATSchemaGATImageResizingContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GATSchemaGATImageResizingContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailed
{
  if (self->_whichContentevent == 3)
  {
    self->_unint64_t whichContentevent = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATImageResizingEventFailed)failed
{
  if (self->_whichContentevent == 3) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  id v4 = (GATSchemaGATImageResizingEventFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichContentevent = v7;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteEnded
{
  if (self->_whichContentevent == 2)
  {
    self->_unint64_t whichContentevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATImageResizingEventEnded)ended
{
  if (self->_whichContentevent == 2) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (GATSchemaGATImageResizingEventEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_unint64_t whichContentevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContentevent == 1)
  {
    self->_unint64_t whichContentevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATImageResizingEventStarted)startedOrChanged
{
  if (self->_whichContentevent == 1) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (GATSchemaGATImageResizingEventStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_unint64_t whichContentevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end