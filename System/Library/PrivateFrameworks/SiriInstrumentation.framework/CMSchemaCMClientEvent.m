@interface CMSchemaCMClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasInsertContext;
- (BOOL)hasSearchContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CMSchemaCMClientEvent)initWithDictionary:(id)a3;
- (CMSchemaCMClientEvent)initWithJSON:(id)a3;
- (CMSchemaCMClientEventMetadata)eventMetadata;
- (CMSchemaCMInsertContext)insertContext;
- (CMSchemaCMSearchContext)searchContext;
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
- (void)deleteInsertContext;
- (void)deleteSearchContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasInsertContext:(BOOL)a3;
- (void)setHasSearchContext:(BOOL)a3;
- (void)setInsertContext:(id)a3;
- (void)setSearchContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CMSchemaCMClientEvent

- (int)componentName
{
  v2 = [(CMSchemaCMClientEvent *)self eventMetadata];
  v3 = [v2 cmId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 47;
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
  v2 = [(CMSchemaCMClientEvent *)self eventMetadata];
  v3 = [v2 cmId];

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
  v16.super_class = (Class)CMSchemaCMClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(CMSchemaCMClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CMSchemaCMClientEvent *)self deleteEventMetadata];
  }
  v9 = [(CMSchemaCMClientEvent *)self searchContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CMSchemaCMClientEvent *)self deleteSearchContext];
  }
  v12 = [(CMSchemaCMClientEvent *)self insertContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CMSchemaCMClientEvent *)self deleteInsertContext];
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
  unint64_t v3 = [(CMSchemaCMClientEvent *)self whichEvent_Type];
  if (v3 == 2)
  {
    id v4 = &OBJC_IVAR___CMSchemaCMClientEvent__searchContext;
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    id v4 = &OBJC_IVAR___CMSchemaCMClientEvent__insertContext;
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
  unint64_t v3 = @"insertContext";
  if (a3 != 3) {
    unint64_t v3 = 0;
  }
  if (a3 == 2) {
    return @"searchContext";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertContext, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasInsertContext:(BOOL)a3
{
  self->_hasInsertContext = a3;
}

- (BOOL)hasInsertContext
{
  return self->_hasInsertContext;
}

- (void)setHasSearchContext:(BOOL)a3
{
  self->_hasSearchContext = a3;
}

- (BOOL)hasSearchContext
{
  return self->_hasSearchContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (CMSchemaCMClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CMSchemaCMClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMSchemaCMClientEvent;
  id v5 = [(CMSchemaCMClientEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CMSchemaCMClientEventMetadata alloc] initWithDictionary:v6];
      [(CMSchemaCMClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"searchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[CMSchemaCMSearchContext alloc] initWithDictionary:v8];
      [(CMSchemaCMClientEvent *)v5 setSearchContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"insertContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[CMSchemaCMInsertContext alloc] initWithDictionary:v10];
      [(CMSchemaCMClientEvent *)v5 setInsertContext:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (CMSchemaCMClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = 0;
  }
  else
  {
    self = [(CMSchemaCMClientEvent *)self initWithDictionary:v4];
    id v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CMSchemaCMClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(CMSchemaCMClientEvent *)self eventMetadata];
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
  if (self->_insertContext)
  {
    uint64_t v7 = [(CMSchemaCMClientEvent *)self insertContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"insertContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"insertContext"];
    }
  }
  if (self->_searchContext)
  {
    v10 = [(CMSchemaCMClientEvent *)self searchContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"searchContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"searchContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CMSchemaCMClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(CMSchemaCMSearchContext *)self->_searchContext hash] ^ v3;
  return v4 ^ [(CMSchemaCMInsertContext *)self->_insertContext hash];
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
  uint64_t v6 = [(CMSchemaCMClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(CMSchemaCMClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(CMSchemaCMClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(CMSchemaCMClientEvent *)self searchContext];
  uint64_t v7 = [v4 searchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(CMSchemaCMClientEvent *)self searchContext];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(CMSchemaCMClientEvent *)self searchContext];
    objc_super v16 = [v4 searchContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(CMSchemaCMClientEvent *)self insertContext];
  uint64_t v7 = [v4 insertContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(CMSchemaCMClientEvent *)self insertContext];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(CMSchemaCMClientEvent *)self insertContext];
    v21 = [v4 insertContext];
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
  id v4 = [(CMSchemaCMClientEvent *)self eventMetadata];

  if (v4)
  {
    id v5 = [(CMSchemaCMClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(CMSchemaCMClientEvent *)self searchContext];

  if (v6)
  {
    uint64_t v7 = [(CMSchemaCMClientEvent *)self searchContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(CMSchemaCMClientEvent *)self insertContext];

  if (v8)
  {
    v9 = [(CMSchemaCMClientEvent *)self insertContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CMSchemaCMClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteInsertContext
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_insertContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CMSchemaCMInsertContext)insertContext
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_insertContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInsertContext:(id)a3
{
  id v4 = (CMSchemaCMInsertContext *)a3;
  searchContext = self->_searchContext;
  self->_searchContext = 0;

  unint64_t v6 = 3;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichEvent_Type = v6;
  insertContext = self->_insertContext;
  self->_insertContext = v4;
}

- (void)deleteSearchContext
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_searchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (CMSchemaCMSearchContext)searchContext
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_searchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchContext:(id)a3
{
  id v4 = (CMSchemaCMSearchContext *)a3;
  insertContext = self->_insertContext;
  self->_insertContext = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  searchContext = self->_searchContext;
  self->_searchContext = v4;
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
  unint64_t v2 = [(CMSchemaCMClientEvent *)self whichEvent_Type];
  unint64_t v3 = @"com.apple.aiml.siri.cm.CMClientEvent";
  if (v2 == 3) {
    unint64_t v3 = @"com.apple.aiml.siri.cm.CMClientEvent.CMInsertContext";
  }
  if (v2 == 2) {
    return @"com.apple.aiml.siri.cm.CMClientEvent.CMSearchContext";
  }
  else {
    return v3;
  }
}

- (int)getAnyEventType
{
  return 90;
}

@end