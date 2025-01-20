@interface GRRSchemaGRRHypothesisRankingContext
- (BOOL)hasContextId;
- (BOOL)hasEnded;
- (BOOL)hasStartedOrChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRHypothesisRanked)ended;
- (GRRSchemaGRRHypothesisRankingContext)initWithDictionary:(id)a3;
- (GRRSchemaGRRHypothesisRankingContext)initWithJSON:(id)a3;
- (GRRSchemaGRRHypothesisRankingStarted)startedOrChanged;
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

@implementation GRRSchemaGRRHypothesisRankingContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GRRSchemaGRRHypothesisRankingContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GRRSchemaGRRHypothesisRankingContext *)self deleteContextId];
  }
  v9 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GRRSchemaGRRHypothesisRankingContext *)self deleteStartedOrChanged];
  }
  v12 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(GRRSchemaGRRHypothesisRankingContext *)self deleteEnded];
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

- (GRRSchemaGRRHypothesisRankingContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GRRSchemaGRRHypothesisRankingContext;
  v5 = [(GRRSchemaGRRHypothesisRankingContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(GRRSchemaGRRHypothesisRankingContext *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GRRSchemaGRRHypothesisRankingStarted alloc] initWithDictionary:v8];
      [(GRRSchemaGRRHypothesisRankingContext *)v5 setStartedOrChanged:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[GRRSchemaGRRHypothesisRanked alloc] initWithDictionary:v10];
      [(GRRSchemaGRRHypothesisRankingContext *)v5 setEnded:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (GRRSchemaGRRHypothesisRankingContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRHypothesisRankingContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRHypothesisRankingContext *)self dictionaryRepresentation];
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
    id v4 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
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
    uint64_t v7 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
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
    v10 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
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
  unint64_t v4 = [(GRRSchemaGRRHypothesisRankingStarted *)self->_startedOrChanged hash] ^ v3;
  return v4 ^ [(GRRSchemaGRRHypothesisRanked *)self->_ended hash];
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
  v6 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
  uint64_t v7 = [v4 contextId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
    int v11 = [v4 contextId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
    objc_super v16 = [v4 startedOrChanged];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
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
  id v4 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];

  if (v4)
  {
    v5 = [(GRRSchemaGRRHypothesisRankingContext *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];

  if (v6)
  {
    uint64_t v7 = [(GRRSchemaGRRHypothesisRankingContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];

  if (v8)
  {
    v9 = [(GRRSchemaGRRHypothesisRankingContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRHypothesisRankingContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnded
{
  if (self->_whichContextevent == 101)
  {
    self->_unint64_t whichContextevent = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRHypothesisRanked)ended
{
  if (self->_whichContextevent == 101) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  id v4 = (GRRSchemaGRRHypothesisRanked *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (self->_whichContextevent == 100)
  {
    self->_unint64_t whichContextevent = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRHypothesisRankingStarted)startedOrChanged
{
  if (self->_whichContextevent == 100) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  id v4 = (GRRSchemaGRRHypothesisRankingStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  unint64_t v6 = 100;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichContextevent = v6;
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