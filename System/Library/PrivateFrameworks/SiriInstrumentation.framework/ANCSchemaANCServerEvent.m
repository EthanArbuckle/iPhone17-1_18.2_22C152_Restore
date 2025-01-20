@interface ANCSchemaANCServerEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (ANCSchemaANCServerEvent)initWithDictionary:(id)a3;
- (ANCSchemaANCServerEvent)initWithJSON:(id)a3;
- (ANCSchemaANCServerEventMetadata)eventMetadata;
- (ANCSchemaANCServerUserResponseEvaluated)userResponseEvaluated;
- (BOOL)hasEventMetadata;
- (BOOL)hasUserResponseEvaluated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)deleteUserResponseEvaluated;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasUserResponseEvaluated:(BOOL)a3;
- (void)setUserResponseEvaluated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCServerEvent

- (int)componentName
{
  v2 = [(ANCSchemaANCServerEvent *)self eventMetadata];
  v3 = [v2 ancId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 12;
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
  v2 = [(ANCSchemaANCServerEvent *)self eventMetadata];
  v3 = [v2 ancId];

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
  v13.super_class = (Class)ANCSchemaANCServerEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(ANCSchemaANCServerEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ANCSchemaANCServerEvent *)self deleteEventMetadata];
  }
  v9 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ANCSchemaANCServerEvent *)self deleteUserResponseEvaluated];
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
  if ([(ANCSchemaANCServerEvent *)self whichEvent_Type] == 2) {
    v3 = self->_userResponseEvaluated;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 2) {
    return @"userResponseEvaluated";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userResponseEvaluated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasUserResponseEvaluated:(BOOL)a3
{
  self->_hasUserResponseEvaluated = a3;
}

- (BOOL)hasUserResponseEvaluated
{
  return self->_hasUserResponseEvaluated;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (ANCSchemaANCServerEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ANCSchemaANCServerEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANCSchemaANCServerEvent;
  v5 = [(ANCSchemaANCServerEvent *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ANCSchemaANCServerEventMetadata alloc] initWithDictionary:v6];
      [(ANCSchemaANCServerEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"userResponseEvaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ANCSchemaANCServerUserResponseEvaluated alloc] initWithDictionary:v8];
      [(ANCSchemaANCServerEvent *)v5 setUserResponseEvaluated:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ANCSchemaANCServerEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCServerEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCServerEvent *)self dictionaryRepresentation];
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
    id v4 = [(ANCSchemaANCServerEvent *)self eventMetadata];
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
  if (self->_userResponseEvaluated)
  {
    uint64_t v7 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"userResponseEvaluated"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"userResponseEvaluated"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ANCSchemaANCServerEventMetadata *)self->_eventMetadata hash];
  return [(ANCSchemaANCServerUserResponseEvaluated *)self->_userResponseEvaluated hash] ^ v3;
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
  uint64_t v6 = [(ANCSchemaANCServerEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(ANCSchemaANCServerEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ANCSchemaANCServerEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v6 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
  uint64_t v7 = [v4 userResponseEvaluated];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
    v16 = [v4 userResponseEvaluated];
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
  id v4 = [(ANCSchemaANCServerEvent *)self eventMetadata];

  if (v4)
  {
    v5 = [(ANCSchemaANCServerEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];

  if (v6)
  {
    uint64_t v7 = [(ANCSchemaANCServerEvent *)self userResponseEvaluated];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCServerEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserResponseEvaluated
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userResponseEvaluated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (ANCSchemaANCServerUserResponseEvaluated)userResponseEvaluated
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_userResponseEvaluated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserResponseEvaluated:(id)a3
{
  self->_unint64_t whichEvent_Type = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_userResponseEvaluated, a3);
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
  if ([(ANCSchemaANCServerEvent *)self whichEvent_Type] == 2) {
    return @"com.apple.aiml.siri.anc.ANCServerEvent.ANCServerUserResponseEvaluated";
  }
  else {
    return @"com.apple.aiml.siri.anc.ANCServerEvent";
  }
}

- (int)getAnyEventType
{
  return 29;
}

@end