@interface CAARSchemaCAARClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCaarRequestContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasFeaturesGenerated;
- (BOOL)hasModelExecuted;
- (BOOL)hasTieBreakersExecuted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARClientEvent)initWithDictionary:(id)a3;
- (CAARSchemaCAARClientEvent)initWithJSON:(id)a3;
- (CAARSchemaCAARClientEventMetadata)eventMetadata;
- (CAARSchemaCAARFeaturesGenerated)featuresGenerated;
- (CAARSchemaCAARModelExecuted)modelExecuted;
- (CAARSchemaCAARRequestContext)caarRequestContext;
- (CAARSchemaCAARTieBreakersExecuted)tieBreakersExecuted;
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
- (void)deleteCaarRequestContext;
- (void)deleteEventMetadata;
- (void)deleteFeaturesGenerated;
- (void)deleteModelExecuted;
- (void)deleteTieBreakersExecuted;
- (void)setCaarRequestContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFeaturesGenerated:(id)a3;
- (void)setHasCaarRequestContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFeaturesGenerated:(BOOL)a3;
- (void)setHasModelExecuted:(BOOL)a3;
- (void)setHasTieBreakersExecuted:(BOOL)a3;
- (void)setModelExecuted:(id)a3;
- (void)setTieBreakersExecuted:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARClientEvent

- (int)componentName
{
  v3 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
  v4 = [v3 caarId];

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
    LODWORD(v9) = 30;
  }
  else
  {
LABEL_5:
    v10 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
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
      v16 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
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
  v3 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
  v4 = [v3 caarId];

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
  v9 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
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
  uint64_t v15 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
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
  v22.super_class = (Class)CAARSchemaCAARClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAARSchemaCAARClientEvent *)self deleteEventMetadata];
  }
  v9 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAARSchemaCAARClientEvent *)self deleteCaarRequestContext];
  }
  uint64_t v12 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAARSchemaCAARClientEvent *)self deleteFeaturesGenerated];
  }
  uint64_t v15 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
  id v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAARSchemaCAARClientEvent *)self deleteModelExecuted];
  }
  uint64_t v18 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(CAARSchemaCAARClientEvent *)self deleteTieBreakersExecuted];
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
  unint64_t v3 = [(CAARSchemaCAARClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EA9F10[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3) {
    return 0;
  }
  else {
    return off_1E5EA9F30[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tieBreakersExecuted, 0);
  objc_storeStrong((id *)&self->_modelExecuted, 0);
  objc_storeStrong((id *)&self->_featuresGenerated, 0);
  objc_storeStrong((id *)&self->_caarRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasTieBreakersExecuted:(BOOL)a3
{
  self->_hasTieBreakersExecuted = a3;
}

- (BOOL)hasTieBreakersExecuted
{
  return self->_hasTieBreakersExecuted;
}

- (void)setHasModelExecuted:(BOOL)a3
{
  self->_hasModelExecuted = a3;
}

- (BOOL)hasModelExecuted
{
  return self->_hasModelExecuted;
}

- (void)setHasFeaturesGenerated:(BOOL)a3
{
  self->_hasFeaturesGenerated = a3;
}

- (BOOL)hasFeaturesGenerated
{
  return self->_hasFeaturesGenerated;
}

- (void)setHasCaarRequestContext:(BOOL)a3
{
  self->_hasCaarRequestContext = a3;
}

- (BOOL)hasCaarRequestContext
{
  return self->_hasCaarRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (CAARSchemaCAARClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CAARSchemaCAARClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAARSchemaCAARClientEvent;
  uint64_t v5 = [(CAARSchemaCAARClientEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CAARSchemaCAARClientEventMetadata alloc] initWithDictionary:v6];
      [(CAARSchemaCAARClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"caarRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CAARSchemaCAARRequestContext alloc] initWithDictionary:v8];
      [(CAARSchemaCAARClientEvent *)v5 setCaarRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"featuresGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CAARSchemaCAARFeaturesGenerated alloc] initWithDictionary:v10];
      [(CAARSchemaCAARClientEvent *)v5 setFeaturesGenerated:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"modelExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[CAARSchemaCAARModelExecuted alloc] initWithDictionary:v12];
      [(CAARSchemaCAARClientEvent *)v5 setModelExecuted:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"tieBreakersExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[CAARSchemaCAARTieBreakersExecuted alloc] initWithDictionary:v14];
      [(CAARSchemaCAARClientEvent *)v5 setTieBreakersExecuted:v15];
    }
    id v16 = v5;
  }
  return v5;
}

- (CAARSchemaCAARClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARClientEvent *)self dictionaryRepresentation];
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
  if (self->_caarRequestContext)
  {
    id v4 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"caarRequestContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"caarRequestContext"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
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
  if (self->_featuresGenerated)
  {
    v10 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"featuresGenerated"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"featuresGenerated"];
    }
  }
  if (self->_modelExecuted)
  {
    v13 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"modelExecuted"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"modelExecuted"];
    }
  }
  if (self->_tieBreakersExecuted)
  {
    id v16 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"tieBreakersExecuted"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"tieBreakersExecuted"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CAARSchemaCAARClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(CAARSchemaCAARRequestContext *)self->_caarRequestContext hash] ^ v3;
  unint64_t v5 = [(CAARSchemaCAARFeaturesGenerated *)self->_featuresGenerated hash];
  unint64_t v6 = v4 ^ v5 ^ [(CAARSchemaCAARModelExecuted *)self->_modelExecuted hash];
  return v6 ^ [(CAARSchemaCAARTieBreakersExecuted *)self->_tieBreakersExecuted hash];
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
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v8 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
  uint64_t v7 = [v4 caarRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
    id v16 = [v4 caarRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
  uint64_t v7 = [v4 featuresGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
    v21 = [v4 featuresGenerated];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
  uint64_t v7 = [v4 modelExecuted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
    v26 = [v4 modelExecuted];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
  uint64_t v7 = [v4 tieBreakersExecuted];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v28 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
    if (!v28)
    {

LABEL_31:
      BOOL v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    v30 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
    v31 = [v4 tieBreakersExecuted];
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
  id v4 = [(CAARSchemaCAARClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(CAARSchemaCAARClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];

  if (v6)
  {
    uint64_t v7 = [(CAARSchemaCAARClientEvent *)self caarRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];

  if (v8)
  {
    v9 = [(CAARSchemaCAARClientEvent *)self featuresGenerated];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(CAARSchemaCAARClientEvent *)self modelExecuted];

  if (v10)
  {
    int v11 = [(CAARSchemaCAARClientEvent *)self modelExecuted];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];

  if (v12)
  {
    uint64_t v13 = [(CAARSchemaCAARClientEvent *)self tieBreakersExecuted];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteTieBreakersExecuted
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_tieBreakersExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAARSchemaCAARTieBreakersExecuted)tieBreakersExecuted
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_tieBreakersExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTieBreakersExecuted:(id)a3
{
  id v4 = (CAARSchemaCAARTieBreakersExecuted *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  unint64_t v8 = 104;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = v4;
}

- (void)deleteModelExecuted
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_modelExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAARSchemaCAARModelExecuted)modelExecuted
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_modelExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setModelExecuted:(id)a3
{
  id v4 = (CAARSchemaCAARModelExecuted *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  unint64_t v8 = 103;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = v4;
}

- (void)deleteFeaturesGenerated
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_featuresGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAARSchemaCAARFeaturesGenerated)featuresGenerated
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_featuresGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFeaturesGenerated:(id)a3
{
  id v4 = (CAARSchemaCAARFeaturesGenerated *)a3;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  unint64_t v8 = 102;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = v4;
}

- (void)deleteCaarRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_caarRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CAARSchemaCAARRequestContext)caarRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_caarRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCaarRequestContext:(id)a3
{
  id v4 = (CAARSchemaCAARRequestContext *)a3;
  featuresGenerated = self->_featuresGenerated;
  self->_featuresGenerated = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  tieBreakersExecuted = self->_tieBreakersExecuted;
  self->_tieBreakersExecuted = 0;

  unint64_t v8 = 101;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichEvent_Type = v8;
  caarRequestContext = self->_caarRequestContext;
  self->_caarRequestContext = v4;
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
  unint64_t v2 = [(CAARSchemaCAARClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 3) {
    return @"com.apple.aiml.siri.caar.CAARClientEvent";
  }
  else {
    return off_1E5EACAE8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 58;
}

@end