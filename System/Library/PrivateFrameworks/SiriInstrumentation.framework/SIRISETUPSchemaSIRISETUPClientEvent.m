@interface SIRISETUPSchemaSIRISETUPClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEnrollmentUICompleted;
- (BOOL)hasEnrollmentUIStarted;
- (BOOL)hasEnrollmentUIUtteranceTrainingAttempted;
- (BOOL)hasEnrollmentUtteranceCompleted;
- (BOOL)hasEnrollmentUtteranceDetected;
- (BOOL)hasEnrollmentZeroDetectionCompleted;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SIRISETUPSchemaSIRISETUPClientEvent)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPClientEvent)initWithJSON:(id)a3;
- (SIRISETUPSchemaSIRISETUPClientEventMetadata)eventMetadata;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)enrollmentZeroDetectionCompleted;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)enrollmentUICompleted;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)enrollmentUIStarted;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)enrollmentUIUtteranceTrainingAttempted;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)enrollmentUtteranceCompleted;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)enrollmentUtteranceDetected;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEnrollmentUICompleted;
- (void)deleteEnrollmentUIStarted;
- (void)deleteEnrollmentUIUtteranceTrainingAttempted;
- (void)deleteEnrollmentUtteranceCompleted;
- (void)deleteEnrollmentUtteranceDetected;
- (void)deleteEnrollmentZeroDetectionCompleted;
- (void)deleteEventMetadata;
- (void)setEnrollmentUICompleted:(id)a3;
- (void)setEnrollmentUIStarted:(id)a3;
- (void)setEnrollmentUIUtteranceTrainingAttempted:(id)a3;
- (void)setEnrollmentUtteranceCompleted:(id)a3;
- (void)setEnrollmentUtteranceDetected:(id)a3;
- (void)setEnrollmentZeroDetectionCompleted:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasEnrollmentUICompleted:(BOOL)a3;
- (void)setHasEnrollmentUIStarted:(BOOL)a3;
- (void)setHasEnrollmentUIUtteranceTrainingAttempted:(BOOL)a3;
- (void)setHasEnrollmentUtteranceCompleted:(BOOL)a3;
- (void)setHasEnrollmentUtteranceDetected:(BOOL)a3;
- (void)setHasEnrollmentZeroDetectionCompleted:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPClientEvent

- (int)componentName
{
  v2 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
  v3 = [v2 siriSetupId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 33;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
  v3 = [v2 siriSetupId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SIRISETUPSchemaSIRISETUPClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEventMetadata];
  }
  v9 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentZeroDetectionCompleted];
  }
  v12 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentUtteranceCompleted];
  }
  v15 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentUtteranceDetected];
  }
  v18 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentUIStarted];
  }
  v21 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentUIUtteranceTrainingAttempted];
  }
  v24 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(SIRISETUPSchemaSIRISETUPClientEvent *)self deleteEnrollmentUICompleted];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABEC8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5) {
    return 0;
  }
  else {
    return off_1E5EABEF8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentUICompleted, 0);
  objc_storeStrong((id *)&self->_enrollmentUIUtteranceTrainingAttempted, 0);
  objc_storeStrong((id *)&self->_enrollmentUIStarted, 0);
  objc_storeStrong((id *)&self->_enrollmentUtteranceDetected, 0);
  objc_storeStrong((id *)&self->_enrollmentUtteranceCompleted, 0);
  objc_storeStrong((id *)&self->_enrollmentZeroDetectionCompleted, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasEnrollmentUICompleted:(BOOL)a3
{
  self->_hasEnrollmentUICompleted = a3;
}

- (BOOL)hasEnrollmentUICompleted
{
  return self->_hasEnrollmentUICompleted;
}

- (void)setHasEnrollmentUIUtteranceTrainingAttempted:(BOOL)a3
{
  self->_hasEnrollmentUIUtteranceTrainingAttempted = a3;
}

- (BOOL)hasEnrollmentUIUtteranceTrainingAttempted
{
  return self->_hasEnrollmentUIUtteranceTrainingAttempted;
}

- (void)setHasEnrollmentUIStarted:(BOOL)a3
{
  self->_hasEnrollmentUIStarted = a3;
}

- (BOOL)hasEnrollmentUIStarted
{
  return self->_hasEnrollmentUIStarted;
}

- (void)setHasEnrollmentUtteranceDetected:(BOOL)a3
{
  self->_hasEnrollmentUtteranceDetected = a3;
}

- (BOOL)hasEnrollmentUtteranceDetected
{
  return self->_hasEnrollmentUtteranceDetected;
}

- (void)setHasEnrollmentUtteranceCompleted:(BOOL)a3
{
  self->_hasEnrollmentUtteranceCompleted = a3;
}

- (BOOL)hasEnrollmentUtteranceCompleted
{
  return self->_hasEnrollmentUtteranceCompleted;
}

- (void)setHasEnrollmentZeroDetectionCompleted:(BOOL)a3
{
  self->_hasEnrollmentZeroDetectionCompleted = a3;
}

- (BOOL)hasEnrollmentZeroDetectionCompleted
{
  return self->_hasEnrollmentZeroDetectionCompleted;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SIRISETUPSchemaSIRISETUPClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SIRISETUPSchemaSIRISETUPClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRISETUPSchemaSIRISETUPClientEvent;
  v5 = [(SIRISETUPSchemaSIRISETUPClientEvent *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SIRISETUPSchemaSIRISETUPClientEventMetadata alloc] initWithDictionary:v6];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"enrollmentZeroDetectionCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted alloc] initWithDictionary:v8];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentZeroDetectionCompleted:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"enrollmentUtteranceCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted alloc] initWithDictionary:v10];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentUtteranceCompleted:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"enrollmentUtteranceDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected alloc] initWithDictionary:v12];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentUtteranceDetected:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"enrollmentUIStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted alloc] initWithDictionary:v14];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentUIStarted:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"enrollmentUIUtteranceTrainingAttempted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted alloc] initWithDictionary:v16];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentUIUtteranceTrainingAttempted:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"enrollmentUICompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted alloc] initWithDictionary:v18];
      [(SIRISETUPSchemaSIRISETUPClientEvent *)v5 setEnrollmentUICompleted:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_enrollmentUICompleted)
  {
    id v4 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"enrollmentUICompleted"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"enrollmentUICompleted"];
    }
  }
  if (self->_enrollmentUIStarted)
  {
    uint64_t v7 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"enrollmentUIStarted"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"enrollmentUIStarted"];
    }
  }
  if (self->_enrollmentUIUtteranceTrainingAttempted)
  {
    v10 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"enrollmentUIUtteranceTrainingAttempted"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"enrollmentUIUtteranceTrainingAttempted"];
    }
  }
  if (self->_enrollmentUtteranceCompleted)
  {
    v13 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"enrollmentUtteranceCompleted"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"enrollmentUtteranceCompleted"];
    }
  }
  if (self->_enrollmentUtteranceDetected)
  {
    v16 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"enrollmentUtteranceDetected"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"enrollmentUtteranceDetected"];
    }
  }
  if (self->_enrollmentZeroDetectionCompleted)
  {
    v19 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"enrollmentZeroDetectionCompleted"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"enrollmentZeroDetectionCompleted"];
    }
  }
  if (self->_eventMetadata)
  {
    objc_super v22 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"eventMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRISETUPSchemaSIRISETUPClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self->_enrollmentZeroDetectionCompleted hash] ^ v3;
  unint64_t v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)self->_enrollmentUtteranceCompleted hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self->_enrollmentUtteranceDetected hash];
  unint64_t v7 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self->_enrollmentUIStarted hash];
  unint64_t v8 = v7 ^ [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self->_enrollmentUIUtteranceTrainingAttempted hash];
  return v6 ^ v8 ^ [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self->_enrollmentUICompleted hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_38;
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
  unint64_t v7 = [v4 enrollmentZeroDetectionCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
    v16 = [v4 enrollmentZeroDetectionCompleted];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
  unint64_t v7 = [v4 enrollmentUtteranceCompleted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
    v21 = [v4 enrollmentUtteranceCompleted];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
  unint64_t v7 = [v4 enrollmentUtteranceDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
    int v26 = [v4 enrollmentUtteranceDetected];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
  unint64_t v7 = [v4 enrollmentUIStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
    v31 = [v4 enrollmentUIStarted];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
  unint64_t v7 = [v4 enrollmentUIUtteranceTrainingAttempted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
    v36 = [v4 enrollmentUIUtteranceTrainingAttempted];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
  unint64_t v7 = [v4 enrollmentUICompleted];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
    v41 = [v4 enrollmentUICompleted];
    char v42 = [v40 isEqual:v41];

    if (v42) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];

  if (v6)
  {
    unint64_t v7 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentZeroDetectionCompleted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];

  if (v8)
  {
    v9 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceCompleted];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];

  if (v10)
  {
    int v11 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUtteranceDetected];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];

  if (v12)
  {
    uint64_t v13 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIStarted];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];

  if (v14)
  {
    v15 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUIUtteranceTrainingAttempted];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];

  if (v16)
  {
    int v17 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self enrollmentUICompleted];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteEnrollmentUICompleted
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentUICompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)enrollmentUICompleted
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_enrollmentUICompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentUICompleted:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  unint64_t v10 = 106;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = v4;
}

- (void)deleteEnrollmentUIUtteranceTrainingAttempted
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentUIUtteranceTrainingAttempted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)enrollmentUIUtteranceTrainingAttempted
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_enrollmentUIUtteranceTrainingAttempted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentUIUtteranceTrainingAttempted:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  unint64_t v10 = 105;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = v4;
}

- (void)deleteEnrollmentUIStarted
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentUIStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)enrollmentUIStarted
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_enrollmentUIStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentUIStarted:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = v4;
}

- (void)deleteEnrollmentUtteranceDetected
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentUtteranceDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)enrollmentUtteranceDetected
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_enrollmentUtteranceDetected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentUtteranceDetected:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = v4;
}

- (void)deleteEnrollmentUtteranceCompleted
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentUtteranceCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted)enrollmentUtteranceCompleted
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_enrollmentUtteranceCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentUtteranceCompleted:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceCompleted *)a3;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = v4;
}

- (void)deleteEnrollmentZeroDetectionCompleted
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_enrollmentZeroDetectionCompleted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)enrollmentZeroDetectionCompleted
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_enrollmentZeroDetectionCompleted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnrollmentZeroDetectionCompleted:(id)a3
{
  id v4 = (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)a3;
  enrollmentUtteranceCompleted = self->_enrollmentUtteranceCompleted;
  self->_enrollmentUtteranceCompleted = 0;

  enrollmentUtteranceDetected = self->_enrollmentUtteranceDetected;
  self->_enrollmentUtteranceDetected = 0;

  enrollmentUIStarted = self->_enrollmentUIStarted;
  self->_enrollmentUIStarted = 0;

  enrollmentUIUtteranceTrainingAttempted = self->_enrollmentUIUtteranceTrainingAttempted;
  self->_enrollmentUIUtteranceTrainingAttempted = 0;

  enrollmentUICompleted = self->_enrollmentUICompleted;
  self->_enrollmentUICompleted = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  enrollmentZeroDetectionCompleted = self->_enrollmentZeroDetectionCompleted;
  self->_enrollmentZeroDetectionCompleted = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(SIRISETUPSchemaSIRISETUPClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 5) {
    return @"com.apple.aiml.siri.setup.SIRISETUPClientEvent";
  }
  else {
    return off_1E5EB9F80[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 62;
}

@end