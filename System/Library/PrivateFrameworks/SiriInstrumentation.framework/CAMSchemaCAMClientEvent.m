@interface CAMSchemaCAMClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAutoSendFeaturesGenerated;
- (BOOL)hasEventMetadata;
- (BOOL)hasModelExecuted;
- (BOOL)hasRequestReceived;
- (BOOL)hasResponseGenerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMAutoSendFeaturesGenerated)autoSendFeaturesGenerated;
- (CAMSchemaCAMClientEvent)initWithDictionary:(id)a3;
- (CAMSchemaCAMClientEvent)initWithJSON:(id)a3;
- (CAMSchemaCAMClientEventMetadata)eventMetadata;
- (CAMSchemaCAMModelExecuted)modelExecuted;
- (CAMSchemaCAMRequestReceived)requestReceived;
- (CAMSchemaCAMResponseGenerated)responseGenerated;
- (NSData)jsonData;
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
- (void)deleteAutoSendFeaturesGenerated;
- (void)deleteEventMetadata;
- (void)deleteModelExecuted;
- (void)deleteRequestReceived;
- (void)deleteResponseGenerated;
- (void)setAutoSendFeaturesGenerated:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAutoSendFeaturesGenerated:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasModelExecuted:(BOOL)a3;
- (void)setHasRequestReceived:(BOOL)a3;
- (void)setHasResponseGenerated:(BOOL)a3;
- (void)setModelExecuted:(id)a3;
- (void)setRequestReceived:(id)a3;
- (void)setResponseGenerated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMClientEvent

- (int)componentName
{
  v3 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
  v4 = [v3 camId];

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
    LODWORD(v9) = 4;
  }
  else
  {
LABEL_5:
    v10 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
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
      v16 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
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
  v3 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
  v4 = [v3 camId];

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
  v9 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
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
  uint64_t v15 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
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
  v22.receiver = self;
  v22.super_class = (Class)CAMSchemaCAMClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAMSchemaCAMClientEvent *)self deleteEventMetadata];
  }
  v9 = [(CAMSchemaCAMClientEvent *)self requestReceived];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAMSchemaCAMClientEvent *)self deleteRequestReceived];
  }
  uint64_t v12 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAMSchemaCAMClientEvent *)self deleteModelExecuted];
  }
  uint64_t v15 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAMSchemaCAMClientEvent *)self deleteResponseGenerated];
  }
  uint64_t v18 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CAMSchemaCAMClientEvent *)self deleteAutoSendFeaturesGenerated];
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
  unint64_t v3 = [(CAMSchemaCAMClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9F50[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3) {
    return 0;
  }
  else {
    return off_1E5EA9F70[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSendFeaturesGenerated, 0);
  objc_storeStrong((id *)&self->_responseGenerated, 0);
  objc_storeStrong((id *)&self->_modelExecuted, 0);
  objc_storeStrong((id *)&self->_requestReceived, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAutoSendFeaturesGenerated:(BOOL)a3
{
  self->_hasAutoSendFeaturesGenerated = a3;
}

- (BOOL)hasAutoSendFeaturesGenerated
{
  return self->_hasAutoSendFeaturesGenerated;
}

- (void)setHasResponseGenerated:(BOOL)a3
{
  self->_hasResponseGenerated = a3;
}

- (BOOL)hasResponseGenerated
{
  return self->_hasResponseGenerated;
}

- (void)setHasModelExecuted:(BOOL)a3
{
  self->_hasModelExecuted = a3;
}

- (BOOL)hasModelExecuted
{
  return self->_hasModelExecuted;
}

- (void)setHasRequestReceived:(BOOL)a3
{
  self->_hasRequestReceived = a3;
}

- (BOOL)hasRequestReceived
{
  return self->_hasRequestReceived;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (CAMSchemaCAMClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CAMSchemaCAMClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMSchemaCAMClientEvent;
  uint64_t v5 = [(CAMSchemaCAMClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CAMSchemaCAMClientEventMetadata alloc] initWithDictionary:v6];
      [(CAMSchemaCAMClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CAMSchemaCAMRequestReceived alloc] initWithDictionary:v8];
      [(CAMSchemaCAMClientEvent *)v5 setRequestReceived:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"modelExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CAMSchemaCAMModelExecuted alloc] initWithDictionary:v10];
      [(CAMSchemaCAMClientEvent *)v5 setModelExecuted:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"responseGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CAMSchemaCAMResponseGenerated alloc] initWithDictionary:v12];
      [(CAMSchemaCAMClientEvent *)v5 setResponseGenerated:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"autoSendFeaturesGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[CAMSchemaCAMAutoSendFeaturesGenerated alloc] initWithDictionary:v14];
      [(CAMSchemaCAMClientEvent *)v5 setAutoSendFeaturesGenerated:v15];
    }
    id v16 = v5;
  }
  return v5;
}

- (CAMSchemaCAMClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMClientEvent *)self dictionaryRepresentation];
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
  if (self->_autoSendFeaturesGenerated)
  {
    id v4 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"autoSendFeaturesGenerated"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"autoSendFeaturesGenerated"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
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
  if (self->_modelExecuted)
  {
    v10 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"modelExecuted"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"modelExecuted"];
    }
  }
  if (self->_requestReceived)
  {
    v13 = [(CAMSchemaCAMClientEvent *)self requestReceived];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"requestReceived"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"requestReceived"];
    }
  }
  if (self->_responseGenerated)
  {
    id v16 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"responseGenerated"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"responseGenerated"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CAMSchemaCAMClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(CAMSchemaCAMRequestReceived *)self->_requestReceived hash] ^ v3;
  unint64_t v5 = [(CAMSchemaCAMModelExecuted *)self->_modelExecuted hash];
  unint64_t v6 = v4 ^ v5 ^ [(CAMSchemaCAMResponseGenerated *)self->_responseGenerated hash];
  return v6 ^ [(CAMSchemaCAMAutoSendFeaturesGenerated *)self->_autoSendFeaturesGenerated hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_28;
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self requestReceived];
  uint64_t v7 = [v4 requestReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(CAMSchemaCAMClientEvent *)self requestReceived];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(CAMSchemaCAMClientEvent *)self requestReceived];
    id v16 = [v4 requestReceived];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
  uint64_t v7 = [v4 modelExecuted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
    v21 = [v4 modelExecuted];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
  uint64_t v7 = [v4 responseGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
    v26 = [v4 responseGenerated];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
  uint64_t v7 = [v4 autoSendFeaturesGenerated];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
    v31 = [v4 autoSendFeaturesGenerated];
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
  id v4 = [(CAMSchemaCAMClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(CAMSchemaCAMClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CAMSchemaCAMClientEvent *)self requestReceived];

  if (v6)
  {
    uint64_t v7 = [(CAMSchemaCAMClientEvent *)self requestReceived];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CAMSchemaCAMClientEvent *)self modelExecuted];

  if (v8)
  {
    v9 = [(CAMSchemaCAMClientEvent *)self modelExecuted];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(CAMSchemaCAMClientEvent *)self responseGenerated];

  if (v10)
  {
    int v11 = [(CAMSchemaCAMClientEvent *)self responseGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];

  if (v12)
  {
    uint64_t v13 = [(CAMSchemaCAMClientEvent *)self autoSendFeaturesGenerated];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAutoSendFeaturesGenerated
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_autoSendFeaturesGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAMSchemaCAMAutoSendFeaturesGenerated)autoSendFeaturesGenerated
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_autoSendFeaturesGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAutoSendFeaturesGenerated:(id)a3
{
  id v4 = (CAMSchemaCAMAutoSendFeaturesGenerated *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  unint64_t v8 = 104;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = v4;
}

- (void)deleteResponseGenerated
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_responseGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAMSchemaCAMResponseGenerated)responseGenerated
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_responseGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResponseGenerated:(id)a3
{
  id v4 = (CAMSchemaCAMResponseGenerated *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  unint64_t v8 = 103;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = v4;
}

- (void)deleteModelExecuted
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_modelExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAMSchemaCAMModelExecuted)modelExecuted
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_modelExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setModelExecuted:(id)a3
{
  id v4 = (CAMSchemaCAMModelExecuted *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  unint64_t v8 = 102;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = v4;
}

- (void)deleteRequestReceived
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAMSchemaCAMRequestReceived)requestReceived
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_requestReceived;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestReceived:(id)a3
{
  id v4 = (CAMSchemaCAMRequestReceived *)a3;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  unint64_t v8 = 101;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  requestReceived = self->_requestReceived;
  self->_requestReceived = v4;
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
  unint64_t v2 = [(CAMSchemaCAMClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 3) {
    return @"com.apple.aiml.siri.cam.CAMClientEvent";
  }
  else {
    return off_1E5EACB30[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 14;
}

@end