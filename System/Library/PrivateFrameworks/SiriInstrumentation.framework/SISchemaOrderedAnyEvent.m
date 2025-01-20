@interface SISchemaOrderedAnyEvent
- (BOOL)hasEvent;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAnyEvent)event;
- (SISchemaCommonEventMetadata)metadata;
- (SISchemaOrderedAnyEvent)initWithDictionary:(id)a3;
- (SISchemaOrderedAnyEvent)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (void)deleteEvent;
- (void)deleteMetadata;
- (void)setEvent:(id)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)unwrapMessageWithCompletion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaOrderedAnyEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaOrderedAnyEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaOrderedAnyEvent *)self metadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaOrderedAnyEvent *)self deleteMetadata];
  }
  v9 = [(SISchemaOrderedAnyEvent *)self event];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaOrderedAnyEvent *)self deleteEvent];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)unwrapMessageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SISchemaOrderedAnyEvent *)self event];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SISchemaOrderedAnyEvent_Introspection__unwrapMessageWithCompletion___block_invoke;
  v7[3] = &unk_1E5EAC230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 unwrapMessageWithCompletion:v7];
}

void __70__SISchemaOrderedAnyEvent_Introspection__unwrapMessageWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = [v6 metadata];
  v9 = [v8 timestamp];
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v9, "timestampInNanoseconds"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [*(id *)(a1 + 32) metadata];
  int v11 = [v10 timestamp];
  v12 = [v11 clockIdentifier];
  objc_super v13 = [v12 toSafeNSUUID];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)setHasEvent:(BOOL)a3
{
  self->_hasEvent = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_hasMetadata = a3;
}

- (void)setEvent:(id)a3
{
}

- (SISchemaAnyEvent)event
{
  return self->_event;
}

- (void)setMetadata:(id)a3
{
}

- (SISchemaCommonEventMetadata)metadata
{
  return self->_metadata;
}

- (SISchemaOrderedAnyEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaOrderedAnyEvent;
  v5 = [(SISchemaOrderedAnyEvent *)&v12 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [[SISchemaCommonEventMetadata alloc] initWithDictionary:v6];
      [(SISchemaOrderedAnyEvent *)v5 setMetadata:v7];
    }
    id v8 = [v4 objectForKeyedSubscript:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaAnyEvent alloc] initWithDictionary:v8];
      [(SISchemaOrderedAnyEvent *)v5 setEvent:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaOrderedAnyEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaOrderedAnyEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaOrderedAnyEvent *)self dictionaryRepresentation];
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
  if (self->_event)
  {
    id v4 = [(SISchemaOrderedAnyEvent *)self event];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"event"];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"event"];
    }
  }
  if (self->_metadata)
  {
    uint64_t v7 = [(SISchemaOrderedAnyEvent *)self metadata];
    id v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"metadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaCommonEventMetadata *)self->_metadata hash];
  return [(SISchemaAnyEvent *)self->_event hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaOrderedAnyEvent *)self metadata];
  id v6 = [v4 metadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaOrderedAnyEvent *)self metadata];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(SISchemaOrderedAnyEvent *)self metadata];
    v10 = [v4 metadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaOrderedAnyEvent *)self event];
  id v6 = [v4 event];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaOrderedAnyEvent *)self event];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    id v14 = [(SISchemaOrderedAnyEvent *)self event];
    v15 = [v4 event];
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
  id v8 = a3;
  id v4 = [(SISchemaOrderedAnyEvent *)self metadata];

  if (v4)
  {
    v5 = [(SISchemaOrderedAnyEvent *)self metadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(SISchemaOrderedAnyEvent *)self event];

  if (v6)
  {
    uint64_t v7 = [(SISchemaOrderedAnyEvent *)self event];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaOrderedAnyEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteEvent
{
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (void)deleteMetadata
{
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.common.OrderedAnyEvent";
}

- (int)getAnyEventType
{
  return 6;
}

@end