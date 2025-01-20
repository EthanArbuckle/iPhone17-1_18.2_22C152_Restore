@interface JRSchemaJRClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasJrExperimentTriggered;
- (BOOL)hasJrInferenceContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRClientEvent)initWithDictionary:(id)a3;
- (JRSchemaJRClientEvent)initWithJSON:(id)a3;
- (JRSchemaJRClientEventMetadata)eventMetadata;
- (JRSchemaJRExperimentTriggered)jrExperimentTriggered;
- (JRSchemaJRInferenceContext)jrInferenceContext;
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
- (void)deleteEventMetadata;
- (void)deleteJrExperimentTriggered;
- (void)deleteJrInferenceContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasJrExperimentTriggered:(BOOL)a3;
- (void)setHasJrInferenceContext:(BOOL)a3;
- (void)setJrExperimentTriggered:(id)a3;
- (void)setJrInferenceContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRClientEvent

- (int)componentName
{
  v2 = [(JRSchemaJRClientEvent *)self eventMetadata];
  v3 = [v2 jrId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 49;
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
  v2 = [(JRSchemaJRClientEvent *)self eventMetadata];
  v3 = [v2 jrId];

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
  v16.receiver = self;
  v16.super_class = (Class)JRSchemaJRClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(JRSchemaJRClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(JRSchemaJRClientEvent *)self deleteEventMetadata];
  }
  v9 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(JRSchemaJRClientEvent *)self deleteJrInferenceContext];
  }
  v12 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(JRSchemaJRClientEvent *)self deleteJrExperimentTriggered];
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
  unint64_t v3 = [(JRSchemaJRClientEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___JRSchemaJRClientEvent__jrInferenceContext;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___JRSchemaJRClientEvent__jrExperimentTriggered;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  unint64_t v3 = @"jrExperimentTriggered";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"jrInferenceContext";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jrExperimentTriggered, 0);
  objc_storeStrong((id *)&self->_jrInferenceContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasJrExperimentTriggered:(BOOL)a3
{
  self->_hasJrExperimentTriggered = a3;
}

- (BOOL)hasJrExperimentTriggered
{
  return self->_hasJrExperimentTriggered;
}

- (void)setHasJrInferenceContext:(BOOL)a3
{
  self->_hasJrInferenceContext = a3;
}

- (BOOL)hasJrInferenceContext
{
  return self->_hasJrInferenceContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (JRSchemaJRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (JRSchemaJRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JRSchemaJRClientEvent;
  id v5 = [(JRSchemaJRClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[JRSchemaJRClientEventMetadata alloc] initWithDictionary:v6];
      [(JRSchemaJRClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"jrInferenceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[JRSchemaJRInferenceContext alloc] initWithDictionary:v8];
      [(JRSchemaJRClientEvent *)v5 setJrInferenceContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"jrExperimentTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[JRSchemaJRExperimentTriggered alloc] initWithDictionary:v10];
      [(JRSchemaJRClientEvent *)v5 setJrExperimentTriggered:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (JRSchemaJRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(JRSchemaJRClientEvent *)self eventMetadata];
    id v5 = [v4 dictionaryRepresentation];
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
  if (self->_jrExperimentTriggered)
  {
    uint64_t v7 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"jrExperimentTriggered"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"jrExperimentTriggered"];
    }
  }
  if (self->_jrInferenceContext)
  {
    v10 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"jrInferenceContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"jrInferenceContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(JRSchemaJRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(JRSchemaJRInferenceContext *)self->_jrInferenceContext hash] ^ v3;
  return v4 ^ [(JRSchemaJRExperimentTriggered *)self->_jrExperimentTriggered hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_18;
  }
  uint64_t v6 = [(JRSchemaJRClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(JRSchemaJRClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(JRSchemaJRClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
  uint64_t v7 = [v4 jrInferenceContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
    objc_super v16 = [v4 jrInferenceContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
  uint64_t v7 = [v4 jrExperimentTriggered];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
    v21 = [v4 jrExperimentTriggered];
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
  id v4 = [(JRSchemaJRClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(JRSchemaJRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(JRSchemaJRClientEvent *)self jrInferenceContext];

  if (v6)
  {
    uint64_t v7 = [(JRSchemaJRClientEvent *)self jrInferenceContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];

  if (v8)
  {
    v9 = [(JRSchemaJRClientEvent *)self jrExperimentTriggered];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteJrExperimentTriggered
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_jrExperimentTriggered = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (JRSchemaJRExperimentTriggered)jrExperimentTriggered
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_jrExperimentTriggered;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setJrExperimentTriggered:(id)a3
{
  id v4 = (JRSchemaJRExperimentTriggered *)a3;
  jrInferenceContext = self->_jrInferenceContext;
  self->_jrInferenceContext = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  jrExperimentTriggered = self->_jrExperimentTriggered;
  self->_jrExperimentTriggered = v4;
}

- (void)deleteJrInferenceContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_jrInferenceContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (JRSchemaJRInferenceContext)jrInferenceContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_jrInferenceContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setJrInferenceContext:(id)a3
{
  id v4 = (JRSchemaJRInferenceContext *)a3;
  jrExperimentTriggered = self->_jrExperimentTriggered;
  self->_jrExperimentTriggered = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  jrInferenceContext = self->_jrInferenceContext;
  self->_jrInferenceContext = v4;
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
  unint64_t v2 = [(JRSchemaJRClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.jr.JRClientEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.siri.jr.JRClientEvent.JRExperimentTriggered";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.siri.jr.JRClientEvent.JRInferenceContext";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 92;
}

@end