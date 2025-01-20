@interface PRSiriSchemaPRJointResolverCallContext
- (BOOL)hasActionStatementId;
- (BOOL)hasEnded;
- (BOOL)hasFailed;
- (BOOL)hasPlanEventId;
- (BOOL)hasStartedOrChanged;
- (BOOL)hasTraceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PRSiriSchemaPRJointResolverCallContext)initWithDictionary:(id)a3;
- (PRSiriSchemaPRJointResolverCallContext)initWithJSON:(id)a3;
- (PRSiriSchemaPRJointResolverCallEnded)ended;
- (PRSiriSchemaPRJointResolverCallFailed)failed;
- (PRSiriSchemaPRJointResolverCallStarted)startedOrChanged;
- (SISchemaUUID)planEventId;
- (SISchemaUUID)traceId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichContextevent;
- (unsigned)actionStatementId;
- (void)deleteActionStatementId;
- (void)deleteEnded;
- (void)deleteFailed;
- (void)deletePlanEventId;
- (void)deleteStartedOrChanged;
- (void)deleteTraceId;
- (void)setActionStatementId:(unsigned int)a3;
- (void)setEnded:(id)a3;
- (void)setFailed:(id)a3;
- (void)setHasActionStatementId:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setHasPlanEventId:(BOOL)a3;
- (void)setHasStartedOrChanged:(BOOL)a3;
- (void)setHasTraceId:(BOOL)a3;
- (void)setPlanEventId:(id)a3;
- (void)setStartedOrChanged:(id)a3;
- (void)setTraceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PRSiriSchemaPRJointResolverCallContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PRSiriSchemaPRJointResolverCallContext;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PRSiriSchemaPRJointResolverCallContext *)self deleteStartedOrChanged];
  }
  v9 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PRSiriSchemaPRJointResolverCallContext *)self deleteEnded];
  }
  v12 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PRSiriSchemaPRJointResolverCallContext *)self deleteFailed];
  }
  v15 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PRSiriSchemaPRJointResolverCallContext *)self deletePlanEventId];
  }
  v18 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PRSiriSchemaPRJointResolverCallContext *)self deleteTraceId];
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
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_planEventId, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

- (void)setHasTraceId:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (void)setHasPlanEventId:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (void)setHasFailed:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasFailed
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasEnded:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasEnded
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasStartedOrChanged
{
  return *((unsigned char *)&self->_has + 1);
}

- (void)setTraceId:(id)a3
{
}

- (SISchemaUUID)traceId
{
  return self->_traceId;
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (void)setPlanEventId:(id)a3
{
}

- (SISchemaUUID)planEventId
{
  return self->_planEventId;
}

- (unint64_t)whichContextevent
{
  return *(void *)&self->_hasTraceId;
}

- (PRSiriSchemaPRJointResolverCallContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PRSiriSchemaPRJointResolverCallContext;
  v5 = [(PRSiriSchemaPRJointResolverCallContext *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startedOrChanged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PRSiriSchemaPRJointResolverCallStarted alloc] initWithDictionary:v6];
      [(PRSiriSchemaPRJointResolverCallContext *)v5 setStartedOrChanged:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"ended"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PRSiriSchemaPRJointResolverCallEnded alloc] initWithDictionary:v8];
      [(PRSiriSchemaPRJointResolverCallContext *)v5 setEnded:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"failed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PRSiriSchemaPRJointResolverCallFailed alloc] initWithDictionary:v10];
      [(PRSiriSchemaPRJointResolverCallContext *)v5 setFailed:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"planEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(PRSiriSchemaPRJointResolverCallContext *)v5 setPlanEventId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"actionStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSiriSchemaPRJointResolverCallContext setActionStatementId:](v5, "setActionStatementId:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"traceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(PRSiriSchemaPRJointResolverCallContext *)v5 setTraceId:v16];
    }
    int v17 = v5;
  }
  return v5;
}

- (PRSiriSchemaPRJointResolverCallContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PRSiriSchemaPRJointResolverCallContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PRSiriSchemaPRJointResolverCallContext *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PRSiriSchemaPRJointResolverCallContext actionStatementId](self, "actionStatementId"));
    [v3 setObject:v4 forKeyedSubscript:@"actionStatementId"];
  }
  if (self->_ended)
  {
    v5 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"ended"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"ended"];
    }
  }
  if (self->_failed)
  {
    int v8 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"failed"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"failed"];
    }
  }
  if (self->_planEventId)
  {
    int v11 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"planEventId"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"planEventId"];
    }
  }
  if (self->_startedOrChanged)
  {
    int v14 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"startedOrChanged"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"startedOrChanged"];
    }
  }
  if (self->_traceId)
  {
    int v17 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"traceId"];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"traceId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PRSiriSchemaPRJointResolverCallStarted *)self->_startedOrChanged hash];
  unint64_t v4 = [(PRSiriSchemaPRJointResolverCallEnded *)self->_ended hash];
  unint64_t v5 = [(PRSiriSchemaPRJointResolverCallFailed *)self->_failed hash];
  unint64_t v6 = [(SISchemaUUID *)self->_planEventId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_actionStatementId;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(SISchemaUUID *)self->_traceId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  uint64_t v5 = *(void *)&self->_hasTraceId;
  if (v5 != [v4 whichContextevent]) {
    goto LABEL_31;
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
  uint64_t v7 = [v4 startedOrChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v8 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
    int v11 = [v4 startedOrChanged];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
  uint64_t v7 = [v4 ended];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v13 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
    v16 = [v4 ended];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
  uint64_t v7 = [v4 failed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v18 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    int v20 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
    v21 = [v4 failed];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
  uint64_t v7 = [v4 planEventId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v23 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
    v26 = [v4 planEventId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int actionStatementId = self->_actionStatementId;
    if (actionStatementId != [v4 actionStatementId]) {
      goto LABEL_31;
    }
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
  uint64_t v7 = [v4 traceId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v29 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
    v32 = [v4 traceId];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  unint64_t v4 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];

  if (v4)
  {
    uint64_t v5 = [(PRSiriSchemaPRJointResolverCallContext *)self startedOrChanged];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];

  if (v6)
  {
    uint64_t v7 = [(PRSiriSchemaPRJointResolverCallContext *)self ended];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];

  if (v8)
  {
    v9 = [(PRSiriSchemaPRJointResolverCallContext *)self failed];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];

  if (v10)
  {
    int v11 = [(PRSiriSchemaPRJointResolverCallContext *)self planEventId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  int v12 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];

  uint64_t v13 = v15;
  if (v12)
  {
    int v14 = [(PRSiriSchemaPRJointResolverCallContext *)self traceId];
    PBDataWriterWriteSubmessage();

    uint64_t v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRJointResolverCallContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTraceId
{
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (void)deleteActionStatementId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionStatementId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int actionStatementId = a3;
}

- (void)deletePlanEventId
{
}

- (BOOL)hasPlanEventId
{
  return self->_planEventId != 0;
}

- (void)deleteFailed
{
  if (*(void *)&self->_hasTraceId == 3)
  {
    *(void *)&self->_hasTraceId = 0;
    self->_failed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRJointResolverCallFailed)failed
{
  if (*(void *)&self->_hasTraceId == 3) {
    v2 = self->_failed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailed:(id)a3
{
  unint64_t v4 = (PRSiriSchemaPRJointResolverCallFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  uint64_t v7 = 3;
  if (!v4) {
    uint64_t v7 = 0;
  }
  *(void *)&self->_hasTraceId = v7;
  failed = self->_failed;
  self->_failed = v4;
}

- (void)deleteEnded
{
  if (*(void *)&self->_hasTraceId == 2)
  {
    *(void *)&self->_hasTraceId = 0;
    self->_ended = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRJointResolverCallEnded)ended
{
  if (*(void *)&self->_hasTraceId == 2) {
    v2 = self->_ended;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnded:(id)a3
{
  unint64_t v4 = (PRSiriSchemaPRJointResolverCallEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  *(void *)&self->_hasTraceId = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;
}

- (void)deleteStartedOrChanged
{
  if (*(void *)&self->_hasTraceId == 1)
  {
    *(void *)&self->_hasTraceId = 0;
    self->_startedOrChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRJointResolverCallStarted)startedOrChanged
{
  if (*(void *)&self->_hasTraceId == 1) {
    v2 = self->_startedOrChanged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStartedOrChanged:(id)a3
{
  unint64_t v4 = (PRSiriSchemaPRJointResolverCallStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  *(void *)&self->_hasTraceId = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;
}

@end