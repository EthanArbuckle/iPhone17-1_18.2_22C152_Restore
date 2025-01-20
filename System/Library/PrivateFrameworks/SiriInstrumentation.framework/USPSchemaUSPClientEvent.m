@interface USPSchemaUSPClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasIterationEnded;
- (BOOL)hasIterationStarted;
- (BOOL)hasLoggingInitialized;
- (BOOL)hasLoggingReported;
- (BOOL)hasMeasureEnded;
- (BOOL)hasMeasureStarted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (USPSchemaUSPClientEvent)initWithDictionary:(id)a3;
- (USPSchemaUSPClientEvent)initWithJSON:(id)a3;
- (USPSchemaUSPClientEventMetadata)eventMetadata;
- (USPSchemaUSPIterationEnded)iterationEnded;
- (USPSchemaUSPIterationStarted)iterationStarted;
- (USPSchemaUSPLoggingInitalized)loggingInitialized;
- (USPSchemaUSPLoggingReported)loggingReported;
- (USPSchemaUSPMeasureEnded)measureEnded;
- (USPSchemaUSPMeasureStarted)measureStarted;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteIterationEnded;
- (void)deleteIterationStarted;
- (void)deleteLoggingInitialized;
- (void)deleteLoggingReported;
- (void)deleteMeasureEnded;
- (void)deleteMeasureStarted;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasIterationEnded:(BOOL)a3;
- (void)setHasIterationStarted:(BOOL)a3;
- (void)setHasLoggingInitialized:(BOOL)a3;
- (void)setHasLoggingReported:(BOOL)a3;
- (void)setHasMeasureEnded:(BOOL)a3;
- (void)setHasMeasureStarted:(BOOL)a3;
- (void)setIterationEnded:(id)a3;
- (void)setIterationStarted:(id)a3;
- (void)setLoggingInitialized:(id)a3;
- (void)setLoggingReported:(id)a3;
- (void)setMeasureEnded:(id)a3;
- (void)setMeasureStarted:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USPSchemaUSPClientEvent

- (id)getComponentId
{
  v2 = [(USPSchemaUSPClientEvent *)self eventMetadata];
  v3 = [v2 uspId];

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
  return 1;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)USPSchemaUSPClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(USPSchemaUSPClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USPSchemaUSPClientEvent *)self deleteEventMetadata];
  }
  v9 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(USPSchemaUSPClientEvent *)self deleteLoggingInitialized];
  }
  v12 = [(USPSchemaUSPClientEvent *)self loggingReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(USPSchemaUSPClientEvent *)self deleteLoggingReported];
  }
  v15 = [(USPSchemaUSPClientEvent *)self measureStarted];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(USPSchemaUSPClientEvent *)self deleteMeasureStarted];
  }
  v18 = [(USPSchemaUSPClientEvent *)self measureEnded];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(USPSchemaUSPClientEvent *)self deleteMeasureEnded];
  }
  v21 = [(USPSchemaUSPClientEvent *)self iterationStarted];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(USPSchemaUSPClientEvent *)self deleteIterationStarted];
  }
  v24 = [(USPSchemaUSPClientEvent *)self iterationEnded];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(USPSchemaUSPClientEvent *)self deleteIterationEnded];
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
  unint64_t v3 = [(USPSchemaUSPClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAC1C8[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 5) {
    return 0;
  }
  else {
    return off_1E5EAC1F8[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationEnded, 0);
  objc_storeStrong((id *)&self->_iterationStarted, 0);
  objc_storeStrong((id *)&self->_measureEnded, 0);
  objc_storeStrong((id *)&self->_measureStarted, 0);
  objc_storeStrong((id *)&self->_loggingReported, 0);
  objc_storeStrong((id *)&self->_loggingInitialized, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasIterationEnded:(BOOL)a3
{
  self->_hasIterationEnded = a3;
}

- (BOOL)hasIterationEnded
{
  return self->_hasIterationEnded;
}

- (void)setHasIterationStarted:(BOOL)a3
{
  self->_hasIterationStarted = a3;
}

- (BOOL)hasIterationStarted
{
  return self->_hasIterationStarted;
}

- (void)setHasMeasureEnded:(BOOL)a3
{
  self->_hasMeasureEnded = a3;
}

- (BOOL)hasMeasureEnded
{
  return self->_hasMeasureEnded;
}

- (void)setHasMeasureStarted:(BOOL)a3
{
  self->_hasMeasureStarted = a3;
}

- (BOOL)hasMeasureStarted
{
  return self->_hasMeasureStarted;
}

- (void)setHasLoggingReported:(BOOL)a3
{
  self->_hasLoggingReported = a3;
}

- (BOOL)hasLoggingReported
{
  return self->_hasLoggingReported;
}

- (void)setHasLoggingInitialized:(BOOL)a3
{
  self->_hasLoggingInitialized = a3;
}

- (BOOL)hasLoggingInitialized
{
  return self->_hasLoggingInitialized;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (USPSchemaUSPClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (USPSchemaUSPClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)USPSchemaUSPClientEvent;
  v5 = [(USPSchemaUSPClientEvent *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USPSchemaUSPClientEventMetadata alloc] initWithDictionary:v6];
      [(USPSchemaUSPClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"loggingInitialized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USPSchemaUSPLoggingInitalized alloc] initWithDictionary:v8];
      [(USPSchemaUSPClientEvent *)v5 setLoggingInitialized:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"loggingReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[USPSchemaUSPLoggingReported alloc] initWithDictionary:v10];
      [(USPSchemaUSPClientEvent *)v5 setLoggingReported:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"measureStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[USPSchemaUSPMeasureStarted alloc] initWithDictionary:v12];
      [(USPSchemaUSPClientEvent *)v5 setMeasureStarted:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"measureEnded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[USPSchemaUSPMeasureEnded alloc] initWithDictionary:v14];
      [(USPSchemaUSPClientEvent *)v5 setMeasureEnded:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"iterationStarted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[USPSchemaUSPIterationStarted alloc] initWithDictionary:v16];
      [(USPSchemaUSPClientEvent *)v5 setIterationStarted:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"iterationEnded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[USPSchemaUSPIterationEnded alloc] initWithDictionary:v18];
      [(USPSchemaUSPClientEvent *)v5 setIterationEnded:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (USPSchemaUSPClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USPSchemaUSPClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USPSchemaUSPClientEvent *)self dictionaryRepresentation];
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
  if (self->_eventMetadata)
  {
    id v4 = [(USPSchemaUSPClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_iterationEnded)
  {
    uint64_t v7 = [(USPSchemaUSPClientEvent *)self iterationEnded];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"iterationEnded"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"iterationEnded"];
    }
  }
  if (self->_iterationStarted)
  {
    v10 = [(USPSchemaUSPClientEvent *)self iterationStarted];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"iterationStarted"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"iterationStarted"];
    }
  }
  if (self->_loggingInitialized)
  {
    v13 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"loggingInitialized"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"loggingInitialized"];
    }
  }
  if (self->_loggingReported)
  {
    v16 = [(USPSchemaUSPClientEvent *)self loggingReported];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"loggingReported"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"loggingReported"];
    }
  }
  if (self->_measureEnded)
  {
    v19 = [(USPSchemaUSPClientEvent *)self measureEnded];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"measureEnded"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"measureEnded"];
    }
  }
  if (self->_measureStarted)
  {
    objc_super v22 = [(USPSchemaUSPClientEvent *)self measureStarted];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"measureStarted"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"measureStarted"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USPSchemaUSPClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(USPSchemaUSPLoggingInitalized *)self->_loggingInitialized hash] ^ v3;
  unint64_t v5 = [(USPSchemaUSPLoggingReported *)self->_loggingReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(USPSchemaUSPMeasureStarted *)self->_measureStarted hash];
  unint64_t v7 = [(USPSchemaUSPMeasureEnded *)self->_measureEnded hash];
  unint64_t v8 = v7 ^ [(USPSchemaUSPIterationStarted *)self->_iterationStarted hash];
  return v6 ^ v8 ^ [(USPSchemaUSPIterationEnded *)self->_iterationEnded hash];
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
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(USPSchemaUSPClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(USPSchemaUSPClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
  unint64_t v7 = [v4 loggingInitialized];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
    v16 = [v4 loggingInitialized];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self loggingReported];
  unint64_t v7 = [v4 loggingReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(USPSchemaUSPClientEvent *)self loggingReported];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(USPSchemaUSPClientEvent *)self loggingReported];
    v21 = [v4 loggingReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self measureStarted];
  unint64_t v7 = [v4 measureStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(USPSchemaUSPClientEvent *)self measureStarted];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(USPSchemaUSPClientEvent *)self measureStarted];
    int v26 = [v4 measureStarted];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self measureEnded];
  unint64_t v7 = [v4 measureEnded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(USPSchemaUSPClientEvent *)self measureEnded];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(USPSchemaUSPClientEvent *)self measureEnded];
    v31 = [v4 measureEnded];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self iterationStarted];
  unint64_t v7 = [v4 iterationStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(USPSchemaUSPClientEvent *)self iterationStarted];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(USPSchemaUSPClientEvent *)self iterationStarted];
    v36 = [v4 iterationStarted];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self iterationEnded];
  unint64_t v7 = [v4 iterationEnded];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(USPSchemaUSPClientEvent *)self iterationEnded];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(USPSchemaUSPClientEvent *)self iterationEnded];
    v41 = [v4 iterationEnded];
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
  id v4 = [(USPSchemaUSPClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(USPSchemaUSPClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(USPSchemaUSPClientEvent *)self loggingInitialized];

  if (v6)
  {
    unint64_t v7 = [(USPSchemaUSPClientEvent *)self loggingInitialized];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(USPSchemaUSPClientEvent *)self loggingReported];

  if (v8)
  {
    v9 = [(USPSchemaUSPClientEvent *)self loggingReported];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(USPSchemaUSPClientEvent *)self measureStarted];

  if (v10)
  {
    int v11 = [(USPSchemaUSPClientEvent *)self measureStarted];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(USPSchemaUSPClientEvent *)self measureEnded];

  if (v12)
  {
    uint64_t v13 = [(USPSchemaUSPClientEvent *)self measureEnded];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(USPSchemaUSPClientEvent *)self iterationStarted];

  if (v14)
  {
    v15 = [(USPSchemaUSPClientEvent *)self iterationStarted];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(USPSchemaUSPClientEvent *)self iterationEnded];

  if (v16)
  {
    int v17 = [(USPSchemaUSPClientEvent *)self iterationEnded];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteIterationEnded
{
  if (self->_whichEvent_Type == 7)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_iterationEnded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPIterationEnded)iterationEnded
{
  if (self->_whichEvent_Type == 7) {
    v2 = self->_iterationEnded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIterationEnded:(id)a3
{
  id v4 = (USPSchemaUSPIterationEnded *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  unint64_t v10 = 7;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = v4;
}

- (void)deleteIterationStarted
{
  if (self->_whichEvent_Type == 6)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_iterationStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPIterationStarted)iterationStarted
{
  if (self->_whichEvent_Type == 6) {
    v2 = self->_iterationStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIterationStarted:(id)a3
{
  id v4 = (USPSchemaUSPIterationStarted *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  unint64_t v10 = 6;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = v4;
}

- (void)deleteMeasureEnded
{
  if (self->_whichEvent_Type == 5)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_measureEnded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPMeasureEnded)measureEnded
{
  if (self->_whichEvent_Type == 5) {
    v2 = self->_measureEnded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMeasureEnded:(id)a3
{
  id v4 = (USPSchemaUSPMeasureEnded *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  unint64_t v10 = 5;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  measureEnded = self->_measureEnded;
  self->_measureEnded = v4;
}

- (void)deleteMeasureStarted
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_measureStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPMeasureStarted)measureStarted
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_measureStarted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMeasureStarted:(id)a3
{
  id v4 = (USPSchemaUSPMeasureStarted *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  measureStarted = self->_measureStarted;
  self->_measureStarted = v4;
}

- (void)deleteLoggingReported
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_loggingReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPLoggingReported)loggingReported
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_loggingReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLoggingReported:(id)a3
{
  id v4 = (USPSchemaUSPLoggingReported *)a3;
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  unint64_t v10 = 3;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  loggingReported = self->_loggingReported;
  self->_loggingReported = v4;
}

- (void)deleteLoggingInitialized
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_loggingInitialized = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (USPSchemaUSPLoggingInitalized)loggingInitialized
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_loggingInitialized;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLoggingInitialized:(id)a3
{
  id v4 = (USPSchemaUSPLoggingInitalized *)a3;
  loggingReported = self->_loggingReported;
  self->_loggingReported = 0;

  measureStarted = self->_measureStarted;
  self->_measureStarted = 0;

  measureEnded = self->_measureEnded;
  self->_measureEnded = 0;

  iterationStarted = self->_iterationStarted;
  self->_iterationStarted = 0;

  iterationEnded = self->_iterationEnded;
  self->_iterationEnded = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  loggingInitialized = self->_loggingInitialized;
  self->_loggingInitialized = v4;
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
  unint64_t v2 = [(USPSchemaUSPClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 5) {
    return @"com.apple.aiml.siri.usp.USPClientEvent";
  }
  else {
    return off_1E5EB9D10[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 15;
}

@end