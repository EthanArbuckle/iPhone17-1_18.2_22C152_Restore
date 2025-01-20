@interface SCSchemaSCClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCorrectionChecked;
- (BOOL)hasEventMetadata;
- (BOOL)hasUndoChecked;
- (BOOL)hasUndoSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SCSchemaSCClientEvent)initWithDictionary:(id)a3;
- (SCSchemaSCClientEvent)initWithJSON:(id)a3;
- (SCSchemaSCClientEventMetadata)eventMetadata;
- (SCSchemaSCCorrectionChecked)correctionChecked;
- (SCSchemaSCUndoChecked)undoChecked;
- (SCSchemaSCUndoSet)undoSet;
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
- (void)deleteCorrectionChecked;
- (void)deleteEventMetadata;
- (void)deleteUndoChecked;
- (void)deleteUndoSet;
- (void)setCorrectionChecked:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCorrectionChecked:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasUndoChecked:(BOOL)a3;
- (void)setHasUndoSet:(BOOL)a3;
- (void)setUndoChecked:(id)a3;
- (void)setUndoSet:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCSchemaSCClientEvent

- (int)componentName
{
  v3 = [(SCSchemaSCClientEvent *)self eventMetadata];
  v4 = [v3 scId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    LODWORD(v9) = 31;
  }
  else
  {
LABEL_5:
    v10 = [(SCSchemaSCClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(SCSchemaSCClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (v4)
      {
        v9 = [v4 value];
        if (v9)
        {
          v17 = [v4 value];
          uint64_t v18 = [v17 length];

          if (v18) {
            LODWORD(v9) = 43;
          }
          else {
            LODWORD(v9) = 0;
          }
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
}

- (id)getComponentId
{
  v3 = [(SCSchemaSCClientEvent *)self eventMetadata];
  v4 = [v3 scId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_11;
      }
    }
  }
  v9 = [(SCSchemaSCClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_11:
        id v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  uint64_t v15 = [(SCSchemaSCClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    id v16 = [v4 value];
    if (!v16) {
      goto LABEL_13;
    }
    v17 = [v4 value];
    uint64_t v18 = [v17 length];

    if (v18) {
      goto LABEL_11;
    }
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SCSchemaSCClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(SCSchemaSCClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SCSchemaSCClientEvent *)self deleteEventMetadata];
  }
  v9 = [(SCSchemaSCClientEvent *)self undoChecked];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SCSchemaSCClientEvent *)self deleteUndoChecked];
  }
  uint64_t v12 = [(SCSchemaSCClientEvent *)self correctionChecked];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SCSchemaSCClientEvent *)self deleteCorrectionChecked];
  }
  uint64_t v15 = [(SCSchemaSCClientEvent *)self undoSet];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SCSchemaSCClientEvent *)self deleteUndoSet];
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
  unint64_t v3 = [(SCSchemaSCClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABE98[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    return 0;
  }
  else {
    return off_1E5EABEB0[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSet, 0);
  objc_storeStrong((id *)&self->_correctionChecked, 0);
  objc_storeStrong((id *)&self->_undoChecked, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasUndoSet:(BOOL)a3
{
  self->_hasUndoSet = a3;
}

- (BOOL)hasUndoSet
{
  return self->_hasUndoSet;
}

- (void)setHasCorrectionChecked:(BOOL)a3
{
  self->_hasCorrectionChecked = a3;
}

- (BOOL)hasCorrectionChecked
{
  return self->_hasCorrectionChecked;
}

- (void)setHasUndoChecked:(BOOL)a3
{
  self->_hasUndoChecked = a3;
}

- (BOOL)hasUndoChecked
{
  return self->_hasUndoChecked;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SCSchemaSCClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SCSchemaSCClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCSchemaSCClientEvent;
  uint64_t v5 = [(SCSchemaSCClientEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SCSchemaSCClientEventMetadata alloc] initWithDictionary:v6];
      [(SCSchemaSCClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"undoChecked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SCSchemaSCUndoChecked alloc] initWithDictionary:v8];
      [(SCSchemaSCClientEvent *)v5 setUndoChecked:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"correctionChecked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SCSchemaSCCorrectionChecked alloc] initWithDictionary:v10];
      [(SCSchemaSCClientEvent *)v5 setCorrectionChecked:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"undoSet"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SCSchemaSCUndoSet alloc] initWithDictionary:v12];
      [(SCSchemaSCClientEvent *)v5 setUndoSet:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (SCSchemaSCClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(SCSchemaSCClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SCSchemaSCClientEvent *)self dictionaryRepresentation];
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
  if (self->_correctionChecked)
  {
    id v4 = [(SCSchemaSCClientEvent *)self correctionChecked];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"correctionChecked"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"correctionChecked"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(SCSchemaSCClientEvent *)self eventMetadata];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_undoChecked)
  {
    v10 = [(SCSchemaSCClientEvent *)self undoChecked];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"undoChecked"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"undoChecked"];
    }
  }
  if (self->_undoSet)
  {
    v13 = [(SCSchemaSCClientEvent *)self undoSet];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"undoSet"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"undoSet"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCSchemaSCClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SCSchemaSCUndoChecked *)self->_undoChecked hash] ^ v3;
  unint64_t v5 = [(SCSchemaSCCorrectionChecked *)self->_correctionChecked hash];
  return v4 ^ v5 ^ [(SCSchemaSCUndoSet *)self->_undoSet hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  v6 = [(SCSchemaSCClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(SCSchemaSCClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SCSchemaSCClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SCSchemaSCClientEvent *)self undoChecked];
  uint64_t v7 = [v4 undoChecked];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(SCSchemaSCClientEvent *)self undoChecked];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(SCSchemaSCClientEvent *)self undoChecked];
    objc_super v16 = [v4 undoChecked];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SCSchemaSCClientEvent *)self correctionChecked];
  uint64_t v7 = [v4 correctionChecked];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(SCSchemaSCClientEvent *)self correctionChecked];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(SCSchemaSCClientEvent *)self correctionChecked];
    v21 = [v4 correctionChecked];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(SCSchemaSCClientEvent *)self undoSet];
  uint64_t v7 = [v4 undoSet];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(SCSchemaSCClientEvent *)self undoSet];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(SCSchemaSCClientEvent *)self undoSet];
    v26 = [v4 undoSet];
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
  id v4 = [(SCSchemaSCClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SCSchemaSCClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SCSchemaSCClientEvent *)self undoChecked];

  if (v6)
  {
    uint64_t v7 = [(SCSchemaSCClientEvent *)self undoChecked];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SCSchemaSCClientEvent *)self correctionChecked];

  if (v8)
  {
    v9 = [(SCSchemaSCClientEvent *)self correctionChecked];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SCSchemaSCClientEvent *)self undoSet];

  if (v10)
  {
    int v11 = [(SCSchemaSCClientEvent *)self undoSet];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SCSchemaSCClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteUndoSet
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_undoSet = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SCSchemaSCUndoSet)undoSet
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_undoSet;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUndoSet:(id)a3
{
  id v4 = (SCSchemaSCUndoSet *)a3;
  undoChecked = self->_undoChecked;
  self->_undoChecked = 0;

  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  undoSet = self->_undoSet;
  self->_undoSet = v4;
}

- (void)deleteCorrectionChecked
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_correctionChecked = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SCSchemaSCCorrectionChecked)correctionChecked
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_correctionChecked;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCorrectionChecked:(id)a3
{
  id v4 = (SCSchemaSCCorrectionChecked *)a3;
  undoChecked = self->_undoChecked;
  self->_undoChecked = 0;

  undoSet = self->_undoSet;
  self->_undoSet = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = v4;
}

- (void)deleteUndoChecked
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_undoChecked = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SCSchemaSCUndoChecked)undoChecked
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_undoChecked;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUndoChecked:(id)a3
{
  id v4 = (SCSchemaSCUndoChecked *)a3;
  correctionChecked = self->_correctionChecked;
  self->_correctionChecked = 0;

  undoSet = self->_undoSet;
  self->_undoSet = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  undoChecked = self->_undoChecked;
  self->_undoChecked = v4;
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
  unint64_t v2 = [(SCSchemaSCClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 2) {
    return @"com.apple.aiml.siri.sc.SCClientEvent";
  }
  else {
    return off_1E5EB0E08[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 61;
}

@end