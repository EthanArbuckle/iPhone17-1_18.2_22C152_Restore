@interface SICSchemaSICClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasSiriInCallInvocationContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SICSchemaSICClientEvent)initWithDictionary:(id)a3;
- (SICSchemaSICClientEvent)initWithJSON:(id)a3;
- (SICSchemaSICClientEventMetadata)eventMetadata;
- (SICSchemaSICInvocationContext)siriInCallInvocationContext;
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
- (void)deleteSiriInCallInvocationContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasSiriInCallInvocationContext:(BOOL)a3;
- (void)setSiriInCallInvocationContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SICSchemaSICClientEvent

- (int)componentName
{
  v3 = [(SICSchemaSICClientEvent *)self eventMetadata];
  v4 = [v3 sicId];

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
    int v9 = 29;
  }
  else
  {
LABEL_5:
    v10 = [(SICSchemaSICClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        int v9 = [v14 length] != 0;
      }
      else
      {
        int v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      int v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

- (id)getComponentId
{
  v3 = [(SICSchemaSICClientEvent *)self eventMetadata];
  v4 = [v3 sicId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  int v9 = [(SICSchemaSICClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    id v11 = [v10 value];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v10 value];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v4 = v10;
LABEL_8:
      id v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SICSchemaSICClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SICSchemaSICClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SICSchemaSICClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SICSchemaSICClientEvent *)self deleteSiriInCallInvocationContext];
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
  if ([(SICSchemaSICClientEvent *)self whichEvent_Type] == 101) {
    v3 = self->_siriInCallInvocationContext;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101) {
    return @"siriInCallInvocationContext";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInCallInvocationContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSiriInCallInvocationContext:(BOOL)a3
{
  self->_hasSiriInCallInvocationContext = a3;
}

- (BOOL)hasSiriInCallInvocationContext
{
  return self->_hasSiriInCallInvocationContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SICSchemaSICClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SICSchemaSICClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SICSchemaSICClientEvent;
  uint64_t v5 = [(SICSchemaSICClientEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SICSchemaSICClientEventMetadata alloc] initWithDictionary:v6];
      [(SICSchemaSICClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriInCallInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[SICSchemaSICInvocationContext alloc] initWithDictionary:v8];
      [(SICSchemaSICClientEvent *)v5 setSiriInCallInvocationContext:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SICSchemaSICClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(SICSchemaSICClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SICSchemaSICClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(SICSchemaSICClientEvent *)self eventMetadata];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_siriInCallInvocationContext)
  {
    uint64_t v7 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"siriInCallInvocationContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"siriInCallInvocationContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SICSchemaSICClientEventMetadata *)self->_eventMetadata hash];
  return [(SICSchemaSICInvocationContext *)self->_siriInCallInvocationContext hash] ^ v3;
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
  v6 = [(SICSchemaSICClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(SICSchemaSICClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(SICSchemaSICClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
  uint64_t v7 = [v4 siriInCallInvocationContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
    v16 = [v4 siriInCallInvocationContext];
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
  id v4 = [(SICSchemaSICClientEvent *)self eventMetadata];

  if (v4)
  {
    uint64_t v5 = [(SICSchemaSICClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];

  if (v6)
  {
    uint64_t v7 = [(SICSchemaSICClientEvent *)self siriInCallInvocationContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SICSchemaSICClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriInCallInvocationContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriInCallInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SICSchemaSICInvocationContext)siriInCallInvocationContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_siriInCallInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSiriInCallInvocationContext:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_siriInCallInvocationContext, a3);
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
  if ([(SICSchemaSICClientEvent *)self whichEvent_Type] == 101) {
    return @"com.apple.aiml.siri.sic.SICClientEvent.SICInvocationContext";
  }
  else {
    return @"com.apple.aiml.siri.sic.SICClientEvent";
  }
}

- (int)getAnyEventType
{
  return 56;
}

@end