@interface DialogEngineSchemaDLGENGClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasDLGENGNamedEntitiesUsed;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DialogEngineSchemaDLGENGClientEvent)initWithDictionary:(id)a3;
- (DialogEngineSchemaDLGENGClientEvent)initWithJSON:(id)a3;
- (DialogEngineSchemaDLGENGClientEventMetadata)eventMetadata;
- (DialogEngineSchemaDLGENGNamedEntitiesUsed)DLGENGNamedEntitiesUsed;
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
- (void)deleteDLGENGNamedEntitiesUsed;
- (void)deleteEventMetadata;
- (void)setDLGENGNamedEntitiesUsed:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasDLGENGNamedEntitiesUsed:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DialogEngineSchemaDLGENGClientEvent

- (int)componentName
{
  v3 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
  v4 = [v3 dialogEngineId];

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
    LODWORD(v9) = 52;
  }
  else
  {
LABEL_5:
    v10 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
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
      v16 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
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
  v3 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
  v4 = [v3 dialogEngineId];

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
  v9 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
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
  uint64_t v15 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
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
  v13.receiver = self;
  v13.super_class = (Class)DialogEngineSchemaDLGENGClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DialogEngineSchemaDLGENGClientEvent *)self deleteEventMetadata];
  }
  v9 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DialogEngineSchemaDLGENGClientEvent *)self deleteDLGENGNamedEntitiesUsed];
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
  if ([(DialogEngineSchemaDLGENGClientEvent *)self whichEvent_Type] == 101) {
    v3 = self->_DLGENGNamedEntitiesUsed;
  }
  else {
    v3 = 0;
  }
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101) {
    return @"DLGENGNamedEntitiesUsed";
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DLGENGNamedEntitiesUsed, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasDLGENGNamedEntitiesUsed:(BOOL)a3
{
  self->_hasDLGENGNamedEntitiesUsed = a3;
}

- (BOOL)hasDLGENGNamedEntitiesUsed
{
  return self->_hasDLGENGNamedEntitiesUsed;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (DialogEngineSchemaDLGENGClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (DialogEngineSchemaDLGENGClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DialogEngineSchemaDLGENGClientEvent;
  uint64_t v5 = [(DialogEngineSchemaDLGENGClientEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[DialogEngineSchemaDLGENGClientEventMetadata alloc] initWithDictionary:v6];
      [(DialogEngineSchemaDLGENGClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"DLGENGNamedEntitiesUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[DialogEngineSchemaDLGENGNamedEntitiesUsed alloc] initWithDictionary:v8];
      [(DialogEngineSchemaDLGENGClientEvent *)v5 setDLGENGNamedEntitiesUsed:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (DialogEngineSchemaDLGENGClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(DialogEngineSchemaDLGENGClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DialogEngineSchemaDLGENGClientEvent *)self dictionaryRepresentation];
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
  if (self->_DLGENGNamedEntitiesUsed)
  {
    id v4 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"DLGENGNamedEntitiesUsed"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"DLGENGNamedEntitiesUsed"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
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
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DialogEngineSchemaDLGENGClientEventMetadata *)self->_eventMetadata hash];
  return [(DialogEngineSchemaDLGENGNamedEntitiesUsed *)self->_DLGENGNamedEntitiesUsed hash] ^ v3;
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
  v6 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
  uint64_t v7 = [v4 DLGENGNamedEntitiesUsed];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
    id v16 = [v4 DLGENGNamedEntitiesUsed];
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
  id v4 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];

  if (v4)
  {
    uint64_t v5 = [(DialogEngineSchemaDLGENGClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];

  if (v6)
  {
    uint64_t v7 = [(DialogEngineSchemaDLGENGClientEvent *)self DLGENGNamedEntitiesUsed];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DialogEngineSchemaDLGENGClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteDLGENGNamedEntitiesUsed
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_DLGENGNamedEntitiesUsed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DialogEngineSchemaDLGENGNamedEntitiesUsed)DLGENGNamedEntitiesUsed
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_DLGENGNamedEntitiesUsed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDLGENGNamedEntitiesUsed:(id)a3
{
  unint64_t v3 = 101;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_DLGENGNamedEntitiesUsed, a3);
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
  if ([(DialogEngineSchemaDLGENGClientEvent *)self whichEvent_Type] == 101) {
    return @"com.apple.aiml.siri.dlgeng.DLGENGClientEvent.DLGENGNamedEntitiesUsed";
  }
  else {
    return @"com.apple.aiml.siri.dlgeng.DLGENGClientEvent";
  }
}

- (int)getAnyEventType
{
  return 97;
}

@end