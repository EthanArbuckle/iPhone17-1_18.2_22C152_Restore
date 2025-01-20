@interface ORCHSchemaORCHCandidateRequestContext
- (BOOL)hasCancelled;
- (BOOL)hasStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHCandidateRequestCancelled)cancelled;
- (ORCHSchemaORCHCandidateRequestContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHCandidateRequestContext)initWithJSON:(id)a3;
- (ORCHSchemaORCHCandidateRequestStarted)started;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteCancelled;
- (void)deleteStarted;
- (void)setCancelled:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setStarted:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHCandidateRequestContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHCandidateRequestContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHCandidateRequestContext *)self deleteStarted];
  }
  v9 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHCandidateRequestContext *)self deleteCancelled];
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
  objc_storeStrong((id *)&self->_started, 0);
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
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

- (ORCHSchemaORCHCandidateRequestContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHCandidateRequestContext;
  v5 = [(ORCHSchemaORCHCandidateRequestContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"started"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ORCHSchemaORCHCandidateRequestStarted alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHCandidateRequestContext *)v5 setStarted:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"cancelled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ORCHSchemaORCHCandidateRequestCancelled alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHCandidateRequestContext *)v5 setCancelled:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHCandidateRequestContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHCandidateRequestContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHCandidateRequestContext *)self dictionaryRepresentation];
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
    id v4 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
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
  if (self->_started)
  {
    uint64_t v7 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"started"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"started"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ORCHSchemaORCHCandidateRequestStarted *)self->_started hash];
  return [(ORCHSchemaORCHCandidateRequestCancelled *)self->_cancelled hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichContextevent = self->_whichContextevent;
  if (whichContextevent != [v4 whichContextevent]) {
    goto LABEL_13;
  }
  v6 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
  uint64_t v7 = [v4 started];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
    int v11 = [v4 started];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
  uint64_t v7 = [v4 cancelled];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
    v16 = [v4 cancelled];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ORCHSchemaORCHCandidateRequestContext *)self started];

  if (v4)
  {
    v5 = [(ORCHSchemaORCHCandidateRequestContext *)self started];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHCandidateRequestContext *)self cancelled];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHCandidateRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteCancelled
{
  if (self->_whichContextevent == 3)
  {
    self->_unint64_t whichContextevent = 0;
    self->_cancelled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ORCHSchemaORCHCandidateRequestCancelled)cancelled
{
  if (self->_whichContextevent == 3) {
    v2 = self->_cancelled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancelled:(id)a3
{
  id v4 = (ORCHSchemaORCHCandidateRequestCancelled *)a3;
  started = self->_started;
  self->_started = 0;

  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContextevent = v6;
  cancelled = self->_cancelled;
  self->_cancelled = v4;
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

- (ORCHSchemaORCHCandidateRequestStarted)started
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
  id v4 = (ORCHSchemaORCHCandidateRequestStarted *)a3;
  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  started = self->_started;
  self->_started = v4;
}

@end