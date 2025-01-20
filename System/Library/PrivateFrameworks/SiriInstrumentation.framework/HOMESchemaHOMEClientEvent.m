@interface HOMESchemaHOMEClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasAssistantDeviceBirthday;
- (BOOL)hasAssistantInfoReported;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HOMESchemaHOMEAssistantDeviceBirthday)assistantDeviceBirthday;
- (HOMESchemaHOMEAssistantInfoReported)assistantInfoReported;
- (HOMESchemaHOMEClientEvent)initWithDictionary:(id)a3;
- (HOMESchemaHOMEClientEvent)initWithJSON:(id)a3;
- (HOMESchemaHOMEClientEventMetadata)eventMetadata;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAssistantDeviceBirthday;
- (void)deleteAssistantInfoReported;
- (void)deleteEventMetadata;
- (void)setAssistantDeviceBirthday:(id)a3;
- (void)setAssistantInfoReported:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasAssistantDeviceBirthday:(BOOL)a3;
- (void)setHasAssistantInfoReported:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HOMESchemaHOMEClientEvent

- (id)getComponentId
{
  v2 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
  v3 = [v2 homeComponentId];

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
  v16.super_class = (Class)HOMESchemaHOMEClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(HOMESchemaHOMEClientEvent *)self deleteEventMetadata];
  }
  v9 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(HOMESchemaHOMEClientEvent *)self deleteAssistantInfoReported];
  }
  v12 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(HOMESchemaHOMEClientEvent *)self deleteAssistantDeviceBirthday];
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
  unint64_t v3 = [(HOMESchemaHOMEClientEvent *)self whichEvent_Type];
  if (v3 == 101)
  {
    id v4 = &OBJC_IVAR___HOMESchemaHOMEClientEvent__assistantInfoReported;
    goto LABEL_5;
  }
  if (v3 == 102)
  {
    id v4 = &OBJC_IVAR___HOMESchemaHOMEClientEvent__assistantDeviceBirthday;
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
  unint64_t v3 = @"assistantDeviceBirthday";
  if (a3 != 102) {
    unint64_t v3 = 0;
  }
  if (a3 == 101) {
    return @"assistantInfoReported";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantDeviceBirthday, 0);
  objc_storeStrong((id *)&self->_assistantInfoReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasAssistantDeviceBirthday:(BOOL)a3
{
  self->_hasAssistantDeviceBirthday = a3;
}

- (BOOL)hasAssistantDeviceBirthday
{
  return self->_hasAssistantDeviceBirthday;
}

- (void)setHasAssistantInfoReported:(BOOL)a3
{
  self->_hasAssistantInfoReported = a3;
}

- (BOOL)hasAssistantInfoReported
{
  return self->_hasAssistantInfoReported;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (HOMESchemaHOMEClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HOMESchemaHOMEClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HOMESchemaHOMEClientEvent;
  id v5 = [(HOMESchemaHOMEClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[HOMESchemaHOMEClientEventMetadata alloc] initWithDictionary:v6];
      [(HOMESchemaHOMEClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"assistantInfoReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[HOMESchemaHOMEAssistantInfoReported alloc] initWithDictionary:v8];
      [(HOMESchemaHOMEClientEvent *)v5 setAssistantInfoReported:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assistantDeviceBirthday"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[HOMESchemaHOMEAssistantDeviceBirthday alloc] initWithDictionary:v10];
      [(HOMESchemaHOMEClientEvent *)v5 setAssistantDeviceBirthday:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (HOMESchemaHOMEClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(HOMESchemaHOMEClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HOMESchemaHOMEClientEvent *)self dictionaryRepresentation];
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
  if (self->_assistantDeviceBirthday)
  {
    id v4 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
    id v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assistantDeviceBirthday"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assistantDeviceBirthday"];
    }
  }
  if (self->_assistantInfoReported)
  {
    uint64_t v7 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"assistantInfoReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"assistantInfoReported"];
    }
  }
  if (self->_eventMetadata)
  {
    v10 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HOMESchemaHOMEClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(HOMESchemaHOMEAssistantInfoReported *)self->_assistantInfoReported hash] ^ v3;
  return v4 ^ [(HOMESchemaHOMEAssistantDeviceBirthday *)self->_assistantDeviceBirthday hash];
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
  uint64_t v6 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
  uint64_t v7 = [v4 assistantInfoReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
    objc_super v16 = [v4 assistantInfoReported];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
  uint64_t v7 = [v4 assistantDeviceBirthday];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
    v21 = [v4 assistantDeviceBirthday];
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
  id v4 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(HOMESchemaHOMEClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];

  if (v6)
  {
    uint64_t v7 = [(HOMESchemaHOMEClientEvent *)self assistantInfoReported];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];

  if (v8)
  {
    v9 = [(HOMESchemaHOMEClientEvent *)self assistantDeviceBirthday];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HOMESchemaHOMEClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssistantDeviceBirthday
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantDeviceBirthday = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HOMESchemaHOMEAssistantDeviceBirthday)assistantDeviceBirthday
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_assistantDeviceBirthday;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantDeviceBirthday:(id)a3
{
  id v4 = (HOMESchemaHOMEAssistantDeviceBirthday *)a3;
  assistantInfoReported = self->_assistantInfoReported;
  self->_assistantInfoReported = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  assistantDeviceBirthday = self->_assistantDeviceBirthday;
  self->_assistantDeviceBirthday = v4;
}

- (void)deleteAssistantInfoReported
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_assistantInfoReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HOMESchemaHOMEAssistantInfoReported)assistantInfoReported
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_assistantInfoReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAssistantInfoReported:(id)a3
{
  id v4 = (HOMESchemaHOMEAssistantInfoReported *)a3;
  assistantDeviceBirthday = self->_assistantDeviceBirthday;
  self->_assistantDeviceBirthday = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  assistantInfoReported = self->_assistantInfoReported;
  self->_assistantInfoReported = v4;
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
  unint64_t v2 = [(HOMESchemaHOMEClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.home.HOMEClientEvent";
  if (v2 == 102) {
    unint64_t v3 = @"com.apple.aiml.siri.home.HOMEClientEvent.HOMEAssistantDeviceBirthday";
  }
  if (v2 == 101) {
    return @"com.apple.aiml.siri.home.HOMEClientEvent.HOMEAssistantInfoReported";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 46;
}

@end