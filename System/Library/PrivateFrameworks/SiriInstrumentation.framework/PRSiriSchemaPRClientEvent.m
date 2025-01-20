@interface PRSiriSchemaPRClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasJrCallContext;
- (BOOL)hasRequestContext;
- (BOOL)hasRgRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PRSiriSchemaPRClientEvent)initWithDictionary:(id)a3;
- (PRSiriSchemaPRClientEvent)initWithJSON:(id)a3;
- (PRSiriSchemaPRClientEventMetadata)eventMetadata;
- (PRSiriSchemaPRJointResolverCallContext)jrCallContext;
- (PRSiriSchemaPRRequestContext)requestContext;
- (PRSiriSchemaPRResponseGenerationRequestContext)rgRequestContext;
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
- (void)deleteJrCallContext;
- (void)deleteRequestContext;
- (void)deleteRgRequestContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasJrCallContext:(BOOL)a3;
- (void)setHasRequestContext:(BOOL)a3;
- (void)setHasRgRequestContext:(BOOL)a3;
- (void)setJrCallContext:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setRgRequestContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PRSiriSchemaPRClientEvent

- (int)componentName
{
  v3 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  v4 = [v3 ifRequestId];

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
    int v9 = 45;
  }
  else
  {
LABEL_5:
    v10 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
    v11 = [v10 prId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        uint64_t v15 = [v14 length];

        if (v15) {
          int v9 = 59;
        }
        else {
          int v9 = 0;
        }
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
  v3 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  v4 = [v3 ifRequestId];

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
  int v9 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  v10 = [v9 prId];

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
  v19.receiver = self;
  v19.super_class = (Class)PRSiriSchemaPRClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PRSiriSchemaPRClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(PRSiriSchemaPRClientEvent *)self requestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PRSiriSchemaPRClientEvent *)self deleteRequestContext];
  }
  uint64_t v12 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PRSiriSchemaPRClientEvent *)self deleteRgRequestContext];
  }
  uint64_t v15 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PRSiriSchemaPRClientEvent *)self deleteJrCallContext];
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
  unint64_t v3 = [(PRSiriSchemaPRClientEvent *)self whichEvent_Type];
  if (v3 - 10 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABB48[v3 - 10]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 2) {
    return 0;
  }
  else {
    return off_1E5EABB60[a3 - 10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jrCallContext, 0);
  objc_storeStrong((id *)&self->_rgRequestContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasJrCallContext:(BOOL)a3
{
  self->_hasJrCallContext = a3;
}

- (BOOL)hasJrCallContext
{
  return self->_hasJrCallContext;
}

- (void)setHasRgRequestContext:(BOOL)a3
{
  self->_hasRgRequestContext = a3;
}

- (BOOL)hasRgRequestContext
{
  return self->_hasRgRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PRSiriSchemaPRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PRSiriSchemaPRClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSiriSchemaPRClientEvent;
  uint64_t v5 = [(PRSiriSchemaPRClientEvent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PRSiriSchemaPRClientEventMetadata alloc] initWithDictionary:v6];
      [(PRSiriSchemaPRClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[PRSiriSchemaPRRequestContext alloc] initWithDictionary:v8];
      [(PRSiriSchemaPRClientEvent *)v5 setRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"rgRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PRSiriSchemaPRResponseGenerationRequestContext alloc] initWithDictionary:v10];
      [(PRSiriSchemaPRClientEvent *)v5 setRgRequestContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"jrCallContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[PRSiriSchemaPRJointResolverCallContext alloc] initWithDictionary:v12];
      [(PRSiriSchemaPRClientEvent *)v5 setJrCallContext:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (PRSiriSchemaPRClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(PRSiriSchemaPRClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PRSiriSchemaPRClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
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
  if (self->_jrCallContext)
  {
    uint64_t v7 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"jrCallContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"jrCallContext"];
    }
  }
  if (self->_requestContext)
  {
    v10 = [(PRSiriSchemaPRClientEvent *)self requestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"requestContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"requestContext"];
    }
  }
  if (self->_rgRequestContext)
  {
    uint64_t v13 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"rgRequestContext"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"rgRequestContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PRSiriSchemaPRClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PRSiriSchemaPRRequestContext *)self->_requestContext hash] ^ v3;
  unint64_t v5 = [(PRSiriSchemaPRResponseGenerationRequestContext *)self->_rgRequestContext hash];
  return v4 ^ v5 ^ [(PRSiriSchemaPRJointResolverCallContext *)self->_jrCallContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_23;
  }
  v6 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  uint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(PRSiriSchemaPRClientEvent *)self requestContext];
  uint64_t v7 = [v4 requestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(PRSiriSchemaPRClientEvent *)self requestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(PRSiriSchemaPRClientEvent *)self requestContext];
    objc_super v16 = [v4 requestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
  uint64_t v7 = [v4 rgRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
    v21 = [v4 rgRequestContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
  uint64_t v7 = [v4 jrCallContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
    v26 = [v4 jrCallContext];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PRSiriSchemaPRClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PRSiriSchemaPRClientEvent *)self requestContext];

  if (v6)
  {
    uint64_t v7 = [(PRSiriSchemaPRClientEvent *)self requestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];

  if (v8)
  {
    int v9 = [(PRSiriSchemaPRClientEvent *)self rgRequestContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];

  if (v10)
  {
    int v11 = [(PRSiriSchemaPRClientEvent *)self jrCallContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteJrCallContext
{
  if (self->_whichEvent_Type == 12)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_jrCallContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRJointResolverCallContext)jrCallContext
{
  if (self->_whichEvent_Type == 12) {
    v2 = self->_jrCallContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setJrCallContext:(id)a3
{
  id v4 = (PRSiriSchemaPRJointResolverCallContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = 0;

  unint64_t v7 = 12;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = v4;
}

- (void)deleteRgRequestContext
{
  if (self->_whichEvent_Type == 11)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rgRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRResponseGenerationRequestContext)rgRequestContext
{
  if (self->_whichEvent_Type == 11) {
    v2 = self->_rgRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRgRequestContext:(id)a3
{
  id v4 = (PRSiriSchemaPRResponseGenerationRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = 0;

  unint64_t v7 = 11;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = v4;
}

- (void)deleteRequestContext
{
  if (self->_whichEvent_Type == 10)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PRSiriSchemaPRRequestContext)requestContext
{
  if (self->_whichEvent_Type == 10) {
    v2 = self->_requestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestContext:(id)a3
{
  id v4 = (PRSiriSchemaPRRequestContext *)a3;
  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = 0;

  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = 0;

  unint64_t v7 = 10;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichEvent_Type = v7;
  requestContext = self->_requestContext;
  self->_requestContext = v4;
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
  unint64_t v2 = [(PRSiriSchemaPRClientEvent *)self whichEvent_Type];
  if (v2 - 10 > 2) {
    return @"com.apple.aiml.siri.pr.PRClientEvent";
  }
  else {
    return off_1E5EBF2B0[v2 - 10];
  }
}

- (int)getAnyEventType
{
  return 94;
}

@end