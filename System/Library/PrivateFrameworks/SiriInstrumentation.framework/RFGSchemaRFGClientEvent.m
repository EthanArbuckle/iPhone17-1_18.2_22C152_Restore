@interface RFGSchemaRFGClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasVisualResponseShownLink;
- (BOOL)hasVisualResponseShownTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RFGSchemaRFGClientEvent)initWithDictionary:(id)a3;
- (RFGSchemaRFGClientEvent)initWithJSON:(id)a3;
- (RFSchemaRFGClientEventMetadata)eventMetadata;
- (RFSchemaRFGVisualResponseShownLink)visualResponseShownLink;
- (RFSchemaRFGVisualResponseShownTier1)visualResponseShownTier1;
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
- (void)deleteVisualResponseShownLink;
- (void)deleteVisualResponseShownTier1;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasVisualResponseShownLink:(BOOL)a3;
- (void)setHasVisualResponseShownTier1:(BOOL)a3;
- (void)setVisualResponseShownLink:(id)a3;
- (void)setVisualResponseShownTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFGSchemaRFGClientEvent

- (int)componentName
{
  v2 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
  v3 = [v2 rfId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 28;
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
  v2 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
  v3 = [v2 rfId];

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
  v16.receiver = self;
  v16.super_class = (Class)RFGSchemaRFGClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  uint64_t v6 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RFGSchemaRFGClientEvent *)self deleteEventMetadata];
  }
  v9 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownTier1];
  }
  v12 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(RFGSchemaRFGClientEvent *)self deleteVisualResponseShownLink];
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
  unint64_t v3 = [(RFGSchemaRFGClientEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___RFGSchemaRFGClientEvent__visualResponseShownTier1;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___RFGSchemaRFGClientEvent__visualResponseShownLink;
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
  unint64_t v3 = @"visualResponseShownLink";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"visualResponseShownTier1";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualResponseShownLink, 0);
  objc_storeStrong((id *)&self->_visualResponseShownTier1, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasVisualResponseShownLink:(BOOL)a3
{
  self->_hasVisualResponseShownLink = a3;
}

- (BOOL)hasVisualResponseShownLink
{
  return self->_hasVisualResponseShownLink;
}

- (void)setHasVisualResponseShownTier1:(BOOL)a3
{
  self->_hasVisualResponseShownTier1 = a3;
}

- (BOOL)hasVisualResponseShownTier1
{
  return self->_hasVisualResponseShownTier1;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (RFSchemaRFGClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RFGSchemaRFGClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFGSchemaRFGClientEvent;
  id v5 = [(RFGSchemaRFGClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[RFSchemaRFGClientEventMetadata alloc] initWithDictionary:v6];
      [(RFGSchemaRFGClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"visualResponseShownTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[RFSchemaRFGVisualResponseShownTier1 alloc] initWithDictionary:v8];
      [(RFGSchemaRFGClientEvent *)v5 setVisualResponseShownTier1:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"visualResponseShownLink"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RFSchemaRFGVisualResponseShownLink alloc] initWithDictionary:v10];
      [(RFGSchemaRFGClientEvent *)v5 setVisualResponseShownLink:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (RFGSchemaRFGClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(RFGSchemaRFGClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFGSchemaRFGClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
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
  if (self->_visualResponseShownLink)
  {
    uint64_t v7 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"visualResponseShownLink"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"visualResponseShownLink"];
    }
  }
  if (self->_visualResponseShownTier1)
  {
    v10 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"visualResponseShownTier1"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"visualResponseShownTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RFSchemaRFGClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(RFSchemaRFGVisualResponseShownTier1 *)self->_visualResponseShownTier1 hash] ^ v3;
  return v4 ^ [(RFSchemaRFGVisualResponseShownLink *)self->_visualResponseShownLink hash];
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
  uint64_t v6 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
  uint64_t v7 = [v4 visualResponseShownTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
    objc_super v16 = [v4 visualResponseShownTier1];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
  uint64_t v7 = [v4 visualResponseShownLink];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
    v21 = [v4 visualResponseShownLink];
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
  id v4 = [(RFGSchemaRFGClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(RFGSchemaRFGClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];

  if (v6)
  {
    uint64_t v7 = [(RFGSchemaRFGClientEvent *)self visualResponseShownTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];

  if (v8)
  {
    v9 = [(RFGSchemaRFGClientEvent *)self visualResponseShownLink];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFGSchemaRFGClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteVisualResponseShownLink
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_visualResponseShownLink = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFGVisualResponseShownLink)visualResponseShownLink
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_visualResponseShownLink;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVisualResponseShownLink:(id)a3
{
  id v4 = (RFSchemaRFGVisualResponseShownLink *)a3;
  visualResponseShownTier1 = self->_visualResponseShownTier1;
  self->_visualResponseShownTier1 = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  visualResponseShownLink = self->_visualResponseShownLink;
  self->_visualResponseShownLink = v4;
}

- (void)deleteVisualResponseShownTier1
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_visualResponseShownTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (RFSchemaRFGVisualResponseShownTier1)visualResponseShownTier1
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_visualResponseShownTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVisualResponseShownTier1:(id)a3
{
  id v4 = (RFSchemaRFGVisualResponseShownTier1 *)a3;
  visualResponseShownLink = self->_visualResponseShownLink;
  self->_visualResponseShownLink = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  visualResponseShownTier1 = self->_visualResponseShownTier1;
  self->_visualResponseShownTier1 = v4;
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
  unint64_t v2 = [(RFGSchemaRFGClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.rf.RFGClientEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.siri.rf.RFGClientEvent.RFGVisualResponseShownLink";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.siri.rf.RFGClientEvent.RFGVisualResponseShownTier1";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 59;
}

@end