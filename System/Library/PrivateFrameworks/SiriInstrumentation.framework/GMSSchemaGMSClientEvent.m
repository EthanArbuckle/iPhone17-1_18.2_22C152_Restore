@interface GMSSchemaGMSClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasGmsModelRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GMSSchemaGMSClientEvent)initWithDictionary:(id)a3;
- (GMSSchemaGMSClientEvent)initWithJSON:(id)a3;
- (GMSSchemaGMSClientEventMetadata)eventMetadata;
- (GMSSchemaGMSModelRequestContext)gmsModelRequestContext;
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
- (void)deleteGmsModelRequestContext;
- (void)setEventMetadata:(id)a3;
- (void)setGmsModelRequestContext:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasGmsModelRequestContext:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GMSSchemaGMSClientEvent

- (int)componentName
{
  v2 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
  v3 = [v2 gmsId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 62;
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
  v2 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
  v3 = [v2 gmsId];

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
  v13.receiver = self;
  v13.super_class = (Class)GMSSchemaGMSClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GMSSchemaGMSClientEvent *)self deleteEventMetadata];
  }
  v9 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GMSSchemaGMSClientEvent *)self deleteGmsModelRequestContext];
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
  if ([(GMSSchemaGMSClientEvent *)self whichEvent_Type] == 101) {
    v3 = self->_gmsModelRequestContext;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101) {
    return @"gmsModelRequestContext";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmsModelRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasGmsModelRequestContext:(BOOL)a3
{
  self->_hasGmsModelRequestContext = a3;
}

- (BOOL)hasGmsModelRequestContext
{
  return self->_hasGmsModelRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (GMSSchemaGMSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (GMSSchemaGMSClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GMSSchemaGMSClientEvent;
  v5 = [(GMSSchemaGMSClientEvent *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GMSSchemaGMSClientEventMetadata alloc] initWithDictionary:v6];
      [(GMSSchemaGMSClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"gmsModelRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GMSSchemaGMSModelRequestContext alloc] initWithDictionary:v8];
      [(GMSSchemaGMSClientEvent *)v5 setGmsModelRequestContext:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (GMSSchemaGMSClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GMSSchemaGMSClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GMSSchemaGMSClientEvent *)self dictionaryRepresentation];
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
  if (self->_eventMetadata)
  {
    id v4 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
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
  if (self->_gmsModelRequestContext)
  {
    uint64_t v7 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"gmsModelRequestContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"gmsModelRequestContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GMSSchemaGMSClientEventMetadata *)self->_eventMetadata hash];
  return [(GMSSchemaGMSModelRequestContext *)self->_gmsModelRequestContext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_13;
  }
  uint64_t v6 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v6 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
  uint64_t v7 = [v4 gmsModelRequestContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
    v16 = [v4 gmsModelRequestContext];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(GMSSchemaGMSClientEvent *)self eventMetadata];

  if (v4)
  {
    v5 = [(GMSSchemaGMSClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];

  if (v6)
  {
    uint64_t v7 = [(GMSSchemaGMSClientEvent *)self gmsModelRequestContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GMSSchemaGMSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteGmsModelRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_gmsModelRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GMSSchemaGMSModelRequestContext)gmsModelRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_gmsModelRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGmsModelRequestContext:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_gmsModelRequestContext, a3);
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
  if ([(GMSSchemaGMSClientEvent *)self whichEvent_Type] == 101) {
    return @"com.apple.aiml.siri.gms.GMSClientEvent.GMSModelRequestContext";
  }
  else {
    return @"com.apple.aiml.siri.gms.GMSClientEvent";
  }
}

- (int)getAnyEventType
{
  return 108;
}

@end