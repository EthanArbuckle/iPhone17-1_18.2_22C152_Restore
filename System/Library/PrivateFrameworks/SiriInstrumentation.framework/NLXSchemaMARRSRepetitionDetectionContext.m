@interface NLXSchemaMARRSRepetitionDetectionContext
- (BOOL)hasEnded;
- (BOOL)hasEvaluated;
- (BOOL)hasFailed;
- (BOOL)hasStarted;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMARRSRepetitionDetectionContext)initWithDictionary:(id)a3;
- (NLXSchemaMARRSRepetitionDetectionContext)initWithJSON:(id)a3;
- (NLXSchemaMARRSRepetitionDetectionEvaluated)ended;
- (NLXSchemaMARRSRepetitionDetectionEvaluated)evaluated;
- (NLXSchemaMARRSRepetitionDetectionFailed)failed;
- (NLXSchemaMARRSRepetitionDetectionStarted)started;
- (NLXSchemaMARRSRepetitionDetectionStarted)startedOrChanged;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteEnded;
- (void)deleteEvaluated;
- (void)deleteFailed;
- (void)deleteStarted;
- (void)deleteStartedOrChanged;
- (void)setEnded:(id)a3;
- (void)setEvaluated:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasEvaluated:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setStarted:(id)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMARRSRepetitionDetectionContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NLXSchemaMARRSRepetitionDetectionContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaMARRSRepetitionDetectionContext *)self deleteStarted];
  }
  v9 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaMARRSRepetitionDetectionContext *)self deleteEvaluated];
  }
  v12 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaMARRSRepetitionDetectionContext *)self deleteFailed];
  }
  v15 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLXSchemaMARRSRepetitionDetectionContext *)self deleteStartedOrChanged];
  }
  v18 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(NLXSchemaMARRSRepetitionDetectionContext *)self deleteEnded];
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_evaluated, 0);
  objc_storeStrong((id *)&self->_started, 0);
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

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasEvaluated:(BOOL)a3
{
  self->_hasEvaluated = a3;
}

- (BOOL)hasEvaluated
{
  return self->_hasEvaluated;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (NLXSchemaMARRSRepetitionDetectionContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NLXSchemaMARRSRepetitionDetectionContext;
  v5 = [(NLXSchemaMARRSRepetitionDetectionContext *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"started"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[NLXSchemaMARRSRepetitionDetectionStarted alloc] initWithDictionary:v6];
      [(NLXSchemaMARRSRepetitionDetectionContext *)v5 setStarted:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"evaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[NLXSchemaMARRSRepetitionDetectionEvaluated alloc] initWithDictionary:v8];
      [(NLXSchemaMARRSRepetitionDetectionContext *)v5 setEvaluated:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaMARRSRepetitionDetectionFailed alloc] initWithDictionary:v10];
      [(NLXSchemaMARRSRepetitionDetectionContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[NLXSchemaMARRSRepetitionDetectionStarted alloc] initWithDictionary:v12];
      [(NLXSchemaMARRSRepetitionDetectionContext *)v5 setStartedOrChanged:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NLXSchemaMARRSRepetitionDetectionEvaluated alloc] initWithDictionary:v14];
      [(NLXSchemaMARRSRepetitionDetectionContext *)v5 setEnded:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (NLXSchemaMARRSRepetitionDetectionContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMARRSRepetitionDetectionContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMARRSRepetitionDetectionContext *)self dictionaryRepresentation];
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
    id v4 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
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
  if (self->_evaluated)
  {
    uint64_t v7 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"evaluated"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"evaluated"];
    }
  }
  if (self->_failed)
  {
    v10 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
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
  if (self->_started)
  {
    v13 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"started"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"started"];
    }
  }
  if (self->_startedOrChanged)
  {
    v16 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
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
  unint64_t v3 = [(NLXSchemaMARRSRepetitionDetectionStarted *)self->_started hash];
  unint64_t v4 = [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self->_evaluated hash] ^ v3;
  unint64_t v5 = [(NLXSchemaMARRSRepetitionDetectionFailed *)self->_failed hash];
  unint64_t v6 = v4 ^ v5 ^ [(NLXSchemaMARRSRepetitionDetectionStarted *)self->_startedOrChanged hash];
  return v6 ^ [(NLXSchemaMARRSRepetitionDetectionEvaluated *)self->_ended hash];
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
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
  uint64_t v7 = [v4 started];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
    int v11 = [v4 started];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
  uint64_t v7 = [v4 evaluated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
    v16 = [v4 evaluated];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
    v26 = [v4 startedOrChanged];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
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
  id v4 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaMARRSRepetitionDetectionContext *)self started];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaMARRSRepetitionDetectionContext *)self evaluated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];

  if (v8)
  {
    v9 = [(NLXSchemaMARRSRepetitionDetectionContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];

  if (v10)
  {
    int v11 = [(NLXSchemaMARRSRepetitionDetectionContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];

  if (v12)
  {
    uint64_t v13 = [(NLXSchemaMARRSRepetitionDetectionContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSRepetitionDetectionContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 5)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)ended
{
  if (self->_whichContextevent == 5) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (NLXSchemaMARRSRepetitionDetectionEvaluated *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  unint64_t v9 = 5;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichContextevent = v9;
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 4)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaMARRSRepetitionDetectionStarted)startedOrChanged
{
  if (self->_whichContextevent == 4) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (NLXSchemaMARRSRepetitionDetectionStarted *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = 4 * (v4 != 0);
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
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

- (NLXSchemaMARRSRepetitionDetectionFailed)failed
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
  id v4 = (NLXSchemaMARRSRepetitionDetectionFailed *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  unint64_t v9 = 3;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichContextevent = v9;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteEvaluated
{
  if (self->_whichContextevent == 2)
  {
    self->_unint64_t whichContextevent = 0;
    self->_evaluated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)evaluated
{
  if (self->_whichContextevent == 2) {
    v2 = self->_evaluated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEvaluated:(id)a3
{
  id v4 = (NLXSchemaMARRSRepetitionDetectionEvaluated *)a3;
  started = self->_started;
  self->_started = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = 2 * (v4 != 0);
  evaluated = self->_evaluated;
  self->_evaluated = v4;
}

- (void)deleteStarted
{
  if (self->_whichContextevent == 1)
  {
    self->_unint64_t whichContextevent = 0;
    self->_started = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaMARRSRepetitionDetectionStarted)started
{
  if (self->_whichContextevent == 1) {
    v2 = self->_started;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStarted:(id)a3
{
  id v4 = (NLXSchemaMARRSRepetitionDetectionStarted *)a3;
  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  started = self->_started;
  self->_started = v4;
}

@end