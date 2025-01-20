@interface SISchemaUEIUserSpeakingContext
- (BOOL)hasEnded;
- (BOOL)hasStartedOrChanged;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIUserSpeakingContext)initWithDictionary:(id)a3;
- (SISchemaUEIUserSpeakingContext)initWithJSON:(id)a3;
- (SISchemaUEIUserSpeakingEnded)ended;
- (SISchemaUEIUserSpeakingStarted)startedOrChanged;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (void)deleteEnded;
- (void)deleteStartedOrChanged;
- (void)deleteTrpId;
- (void)setEnded:(id)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIUserSpeakingContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaUEIUserSpeakingContext;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUEIUserSpeakingContext *)self deleteStartedOrChanged];
  }
  v9 = [(SISchemaUEIUserSpeakingContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUEIUserSpeakingContext *)self deleteEnded];
  }
  v12 = [(SISchemaUEIUserSpeakingContext *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaUEIUserSpeakingContext *)self deleteTrpId];
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
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
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

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUEIUserSpeakingContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaUEIUserSpeakingContext;
  v5 = [(SISchemaUEIUserSpeakingContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUEIUserSpeakingStarted alloc] initWithDictionary:v6];
      [(SISchemaUEIUserSpeakingContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUEIUserSpeakingEnded alloc] initWithDictionary:v8];
      [(SISchemaUEIUserSpeakingContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(SISchemaUEIUserSpeakingContext *)v5 setTrpId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaUEIUserSpeakingContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIUserSpeakingContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIUserSpeakingContext *)self dictionaryRepresentation];
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
    id v4 = [(SISchemaUEIUserSpeakingContext *)self ended];
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
  if (self->_startedOrChanged)
  {
    uint64_t v7 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  if (self->_trpId)
  {
    v10 = [(SISchemaUEIUserSpeakingContext *)self trpId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUEIUserSpeakingStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(SISchemaUEIUserSpeakingEnded *)self->_ended hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_trpId hash];
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
  v6 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUEIUserSpeakingContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(SISchemaUEIUserSpeakingContext *)self ended];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(SISchemaUEIUserSpeakingContext *)self ended];
    objc_super v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(SISchemaUEIUserSpeakingContext *)self trpId];
  uint64_t v7 = [v4 trpId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(SISchemaUEIUserSpeakingContext *)self trpId];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(SISchemaUEIUserSpeakingContext *)self trpId];
    v21 = [v4 trpId];
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
  id v4 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];

  if (v4)
  {
    v5 = [(SISchemaUEIUserSpeakingContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaUEIUserSpeakingContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(SISchemaUEIUserSpeakingContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaUEIUserSpeakingContext *)self trpId];

  if (v8)
  {
    v9 = [(SISchemaUEIUserSpeakingContext *)self trpId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIUserSpeakingContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
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

- (SISchemaUEIUserSpeakingEnded)ended
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
  id v4 = (SISchemaUEIUserSpeakingEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

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

- (SISchemaUEIUserSpeakingStarted)startedOrChanged
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
  id v4 = (SISchemaUEIUserSpeakingStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  self->_unint64_t whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end