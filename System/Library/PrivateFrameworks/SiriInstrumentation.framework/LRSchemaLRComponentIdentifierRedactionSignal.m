@interface LRSchemaLRComponentIdentifierRedactionSignal
- (BOOL)hasComponentId;
- (BOOL)hasRedactConnectedEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)redactConnectedEvents;
- (LRSchemaLRComponentIdentifierRedactionSignal)initWithDictionary:(id)a3;
- (LRSchemaLRComponentIdentifierRedactionSignal)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaRequestLinkInfo)componentId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteComponentId;
- (void)deleteRedactConnectedEvents;
- (void)setComponentId:(id)a3;
- (void)setHasComponentId:(BOOL)a3;
- (void)setHasRedactConnectedEvents:(BOOL)a3;
- (void)setRedactConnectedEvents:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRComponentIdentifierRedactionSignal

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LRSchemaLRComponentIdentifierRedactionSignal;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(LRSchemaLRComponentIdentifierRedactionSignal *)self deleteComponentId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasComponentId:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 2) = a3;
}

- (BOOL)redactConnectedEvents
{
  return self->_redactConnectedEvents;
}

- (void)setComponentId:(id)a3
{
}

- (SISchemaRequestLinkInfo)componentId
{
  return self->_componentId;
}

- (LRSchemaLRComponentIdentifierRedactionSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LRSchemaLRComponentIdentifierRedactionSignal;
  v5 = [(LRSchemaLRComponentIdentifierRedactionSignal *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"componentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaRequestLinkInfo alloc] initWithDictionary:v6];
      [(LRSchemaLRComponentIdentifierRedactionSignal *)v5 setComponentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"redactConnectedEvents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRComponentIdentifierRedactionSignal setRedactConnectedEvents:](v5, "setRedactConnectedEvents:", [v8 BOOLValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (LRSchemaLRComponentIdentifierRedactionSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRComponentIdentifierRedactionSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self dictionaryRepresentation];
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
  if (self->_componentId)
  {
    id v4 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"componentId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"componentId"];
    }
  }
  if (*(&self->_redactConnectedEvents + 1))
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[LRSchemaLRComponentIdentifierRedactionSignal redactConnectedEvents](self, "redactConnectedEvents"));
    [v3 setObject:v7 forKeyedSubscript:@"redactConnectedEvents"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaRequestLinkInfo *)self->_componentId hash];
  if (*(&self->_redactConnectedEvents + 1)) {
    uint64_t v4 = 2654435761 * self->_redactConnectedEvents;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
  v6 = [v4 componentId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
    objc_super v11 = [v4 componentId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_redactConnectedEvents + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_redactConnectedEvents + 1))
  {
    int redactConnectedEvents = self->_redactConnectedEvents;
    if (redactConnectedEvents != [v4 redactConnectedEvents]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];

  if (v4)
  {
    v5 = [(LRSchemaLRComponentIdentifierRedactionSignal *)self componentId];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_redactConnectedEvents + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRComponentIdentifierRedactionSignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteRedactConnectedEvents
{
  *(&self->_redactConnectedEvents + 1) &= ~1u;
}

- (void)setHasRedactConnectedEvents:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 1) = *(&self->_redactConnectedEvents + 1) & 0xFE | a3;
}

- (BOOL)hasRedactConnectedEvents
{
  return *(&self->_redactConnectedEvents + 1);
}

- (void)setRedactConnectedEvents:(BOOL)a3
{
  *(&self->_redactConnectedEvents + 1) |= 1u;
  self->_int redactConnectedEvents = a3;
}

- (void)deleteComponentId
{
}

- (BOOL)hasComponentId
{
  return self->_componentId != 0;
}

@end