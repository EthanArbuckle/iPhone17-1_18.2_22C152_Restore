@interface SISchemaOpaqueClientEvent
- (BOOL)hasAnyEventPayload;
- (BOOL)hasComponentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)anyEventPayload;
- (NSData)jsonData;
- (SISchemaComponentIdentifier)componentId;
- (SISchemaOpaqueClientEvent)initWithDictionary:(id)a3;
- (SISchemaOpaqueClientEvent)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (void)deleteAnyEventPayload;
- (void)deleteComponentId;
- (void)setAnyEventPayload:(id)a3;
- (void)setComponentId:(id)a3;
- (void)setHasAnyEventPayload:(BOOL)a3;
- (void)setHasComponentId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaOpaqueClientEvent

- (id)getComponentId
{
  v2 = self;
  v3 = (void *)SISchemaOpaqueClientEvent.getComponentId()();

  return v3;
}

- (int)componentName
{
  v2 = self;
  int v3 = SISchemaOpaqueClientEvent.componentName.getter();

  return v3;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaOpaqueClientEvent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaOpaqueClientEvent *)self componentId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaOpaqueClientEvent *)self deleteComponentId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  [(SISensitiveConditionsSet *)v2 addCondition:2];
  [(SISensitiveConditionsSet *)v2 addCondition:4];
  [(SISensitiveConditionsSet *)v2 addCondition:5];
  [(SISensitiveConditionsSet *)v2 addCondition:6];
  [(SISensitiveConditionsSet *)v2 addCondition:7];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_anyEventPayload, 0);
}

- (void)setHasComponentId:(BOOL)a3
{
  self->_hasComponentId = a3;
}

- (void)setHasAnyEventPayload:(BOOL)a3
{
  self->_hasAnyEventPayload = a3;
}

- (void)setComponentId:(id)a3
{
}

- (SISchemaComponentIdentifier)componentId
{
  return self->_componentId;
}

- (void)setAnyEventPayload:(id)a3
{
}

- (NSData)anyEventPayload
{
  return self->_anyEventPayload;
}

- (SISchemaOpaqueClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaOpaqueClientEvent;
  v5 = [(SISchemaOpaqueClientEvent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"anyEventPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SISchemaOpaqueClientEvent *)v5 setAnyEventPayload:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"componentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaComponentIdentifier alloc] initWithDictionary:v8];
      [(SISchemaOpaqueClientEvent *)v5 setComponentId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaOpaqueClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaOpaqueClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaOpaqueClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    int v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    int v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_anyEventPayload)
  {
    id v4 = [(SISchemaOpaqueClientEvent *)self anyEventPayload];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"anyEventPayload"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"anyEventPayload"];
    }
  }
  if (self->_componentId)
  {
    uint64_t v7 = [(SISchemaOpaqueClientEvent *)self componentId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"componentId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"componentId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_anyEventPayload hash];
  return [(SISchemaComponentIdentifier *)self->_componentId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaOpaqueClientEvent *)self anyEventPayload];
  v6 = [v4 anyEventPayload];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaOpaqueClientEvent *)self anyEventPayload];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaOpaqueClientEvent *)self anyEventPayload];
    v10 = [v4 anyEventPayload];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaOpaqueClientEvent *)self componentId];
  v6 = [v4 componentId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaOpaqueClientEvent *)self componentId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaOpaqueClientEvent *)self componentId];
    v15 = [v4 componentId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(SISchemaOpaqueClientEvent *)self anyEventPayload];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  v5 = [(SISchemaOpaqueClientEvent *)self componentId];

  if (v5)
  {
    v6 = [(SISchemaOpaqueClientEvent *)self componentId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaOpaqueClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponentId
{
}

- (BOOL)hasComponentId
{
  return self->_componentId != 0;
}

- (void)deleteAnyEventPayload
{
}

- (BOOL)hasAnyEventPayload
{
  return self->_anyEventPayload != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.common.OpaqueClientEvent";
}

- (int)getAnyEventType
{
  return 76;
}

@end