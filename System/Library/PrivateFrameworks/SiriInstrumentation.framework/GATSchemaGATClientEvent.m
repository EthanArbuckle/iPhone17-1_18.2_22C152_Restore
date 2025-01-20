@interface GATSchemaGATClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCreateSessionContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasGenerativeRequestContext;
- (BOOL)hasImageResizingContext;
- (BOOL)hasLoadScreenContentContext;
- (BOOL)hasRegisterMediaContext;
- (BOOL)hasRequestContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATClientEvent)initWithDictionary:(id)a3;
- (GATSchemaGATClientEvent)initWithJSON:(id)a3;
- (GATSchemaGATClientEventMetadata)eventMetadata;
- (GATSchemaGATCreateSessionContext)createSessionContext;
- (GATSchemaGATGenerativeRequestContext)generativeRequestContext;
- (GATSchemaGATImageResizingContext)imageResizingContext;
- (GATSchemaGATLoadScreenContentContext)loadScreenContentContext;
- (GATSchemaGATRegisterMediaContext)registerMediaContext;
- (GATSchemaGATRequestContext)requestContext;
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
- (void)deleteCreateSessionContext;
- (void)deleteEventMetadata;
- (void)deleteGenerativeRequestContext;
- (void)deleteImageResizingContext;
- (void)deleteLoadScreenContentContext;
- (void)deleteRegisterMediaContext;
- (void)deleteRequestContext;
- (void)setCreateSessionContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setGenerativeRequestContext:(id)a3;
- (void)setHasCreateSessionContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasGenerativeRequestContext:(BOOL)a3;
- (void)setHasImageResizingContext:(BOOL)a3;
- (void)setHasLoadScreenContentContext:(BOOL)a3;
- (void)setHasRegisterMediaContext:(BOOL)a3;
- (void)setHasRequestContext:(BOOL)a3;
- (void)setImageResizingContext:(id)a3;
- (void)setLoadScreenContentContext:(id)a3;
- (void)setRegisterMediaContext:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATClientEvent

- (int)componentName
{
  v2 = [(GATSchemaGATClientEvent *)self eventMetadata];
  v3 = [v2 gatId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 56;
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
  v2 = [(GATSchemaGATClientEvent *)self eventMetadata];
  v3 = [v2 gatId];

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
  v28.receiver = self;
  v28.super_class = (Class)GATSchemaGATClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(GATSchemaGATClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GATSchemaGATClientEvent *)self deleteEventMetadata];
  }
  v9 = [(GATSchemaGATClientEvent *)self requestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GATSchemaGATClientEvent *)self deleteRequestContext];
  }
  v12 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(GATSchemaGATClientEvent *)self deleteLoadScreenContentContext];
  }
  v15 = [(GATSchemaGATClientEvent *)self createSessionContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(GATSchemaGATClientEvent *)self deleteCreateSessionContext];
  }
  v18 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(GATSchemaGATClientEvent *)self deleteGenerativeRequestContext];
  }
  v21 = [(GATSchemaGATClientEvent *)self imageResizingContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(GATSchemaGATClientEvent *)self deleteImageResizingContext];
  }
  v24 = [(GATSchemaGATClientEvent *)self registerMediaContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(GATSchemaGATClientEvent *)self deleteRegisterMediaContext];
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
  unint64_t v3 = [(GATSchemaGATClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA648[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5) {
    return 0;
  }
  else {
    return off_1E5EAA678[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerMediaContext, 0);
  objc_storeStrong((id *)&self->_imageResizingContext, 0);
  objc_storeStrong((id *)&self->_generativeRequestContext, 0);
  objc_storeStrong((id *)&self->_createSessionContext, 0);
  objc_storeStrong((id *)&self->_loadScreenContentContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasRegisterMediaContext:(BOOL)a3
{
  self->_hasRegisterMediaContext = a3;
}

- (BOOL)hasRegisterMediaContext
{
  return self->_hasRegisterMediaContext;
}

- (void)setHasImageResizingContext:(BOOL)a3
{
  self->_hasImageResizingContext = a3;
}

- (BOOL)hasImageResizingContext
{
  return self->_hasImageResizingContext;
}

- (void)setHasGenerativeRequestContext:(BOOL)a3
{
  self->_hasGenerativeRequestContext = a3;
}

- (BOOL)hasGenerativeRequestContext
{
  return self->_hasGenerativeRequestContext;
}

- (void)setHasCreateSessionContext:(BOOL)a3
{
  self->_hasCreateSessionContext = a3;
}

- (BOOL)hasCreateSessionContext
{
  return self->_hasCreateSessionContext;
}

- (void)setHasLoadScreenContentContext:(BOOL)a3
{
  self->_hasLoadScreenContentContext = a3;
}

- (BOOL)hasLoadScreenContentContext
{
  return self->_hasLoadScreenContentContext;
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

- (GATSchemaGATClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (GATSchemaGATClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GATSchemaGATClientEvent;
  v5 = [(GATSchemaGATClientEvent *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GATSchemaGATClientEventMetadata alloc] initWithDictionary:v6];
      [(GATSchemaGATClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[GATSchemaGATRequestContext alloc] initWithDictionary:v8];
      [(GATSchemaGATClientEvent *)v5 setRequestContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"loadScreenContentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[GATSchemaGATLoadScreenContentContext alloc] initWithDictionary:v10];
      [(GATSchemaGATClientEvent *)v5 setLoadScreenContentContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"createSessionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[GATSchemaGATCreateSessionContext alloc] initWithDictionary:v12];
      [(GATSchemaGATClientEvent *)v5 setCreateSessionContext:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"generativeRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[GATSchemaGATGenerativeRequestContext alloc] initWithDictionary:v14];
      [(GATSchemaGATClientEvent *)v5 setGenerativeRequestContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"imageResizingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[GATSchemaGATImageResizingContext alloc] initWithDictionary:v16];
      [(GATSchemaGATClientEvent *)v5 setImageResizingContext:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"registerMediaContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[GATSchemaGATRegisterMediaContext alloc] initWithDictionary:v18];
      [(GATSchemaGATClientEvent *)v5 setRegisterMediaContext:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (GATSchemaGATClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATClientEvent *)self dictionaryRepresentation];
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
  if (self->_createSessionContext)
  {
    id v4 = [(GATSchemaGATClientEvent *)self createSessionContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"createSessionContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"createSessionContext"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v7 = [(GATSchemaGATClientEvent *)self eventMetadata];
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
  if (self->_generativeRequestContext)
  {
    v10 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"generativeRequestContext"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"generativeRequestContext"];
    }
  }
  if (self->_imageResizingContext)
  {
    v13 = [(GATSchemaGATClientEvent *)self imageResizingContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"imageResizingContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"imageResizingContext"];
    }
  }
  if (self->_loadScreenContentContext)
  {
    v16 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"loadScreenContentContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"loadScreenContentContext"];
    }
  }
  if (self->_registerMediaContext)
  {
    v19 = [(GATSchemaGATClientEvent *)self registerMediaContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"registerMediaContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"registerMediaContext"];
    }
  }
  if (self->_requestContext)
  {
    objc_super v22 = [(GATSchemaGATClientEvent *)self requestContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"requestContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"requestContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GATSchemaGATClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(GATSchemaGATRequestContext *)self->_requestContext hash] ^ v3;
  unint64_t v5 = [(GATSchemaGATLoadScreenContentContext *)self->_loadScreenContentContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(GATSchemaGATCreateSessionContext *)self->_createSessionContext hash];
  unint64_t v7 = [(GATSchemaGATGenerativeRequestContext *)self->_generativeRequestContext hash];
  unint64_t v8 = v7 ^ [(GATSchemaGATImageResizingContext *)self->_imageResizingContext hash];
  return v6 ^ v8 ^ [(GATSchemaGATRegisterMediaContext *)self->_registerMediaContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_38;
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(GATSchemaGATClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(GATSchemaGATClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self requestContext];
  unint64_t v7 = [v4 requestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(GATSchemaGATClientEvent *)self requestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(GATSchemaGATClientEvent *)self requestContext];
    v16 = [v4 requestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
  unint64_t v7 = [v4 loadScreenContentContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
    v21 = [v4 loadScreenContentContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self createSessionContext];
  unint64_t v7 = [v4 createSessionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(GATSchemaGATClientEvent *)self createSessionContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(GATSchemaGATClientEvent *)self createSessionContext];
    int v26 = [v4 createSessionContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
  unint64_t v7 = [v4 generativeRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
    v31 = [v4 generativeRequestContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self imageResizingContext];
  unint64_t v7 = [v4 imageResizingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(GATSchemaGATClientEvent *)self imageResizingContext];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(GATSchemaGATClientEvent *)self imageResizingContext];
    v36 = [v4 imageResizingContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self registerMediaContext];
  unint64_t v7 = [v4 registerMediaContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(GATSchemaGATClientEvent *)self registerMediaContext];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(GATSchemaGATClientEvent *)self registerMediaContext];
    v41 = [v4 registerMediaContext];
    char v42 = [v40 isEqual:v41];

    if (v42) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(GATSchemaGATClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(GATSchemaGATClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(GATSchemaGATClientEvent *)self requestContext];

  if (v6)
  {
    unint64_t v7 = [(GATSchemaGATClientEvent *)self requestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];

  if (v8)
  {
    v9 = [(GATSchemaGATClientEvent *)self loadScreenContentContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(GATSchemaGATClientEvent *)self createSessionContext];

  if (v10)
  {
    int v11 = [(GATSchemaGATClientEvent *)self createSessionContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(GATSchemaGATClientEvent *)self generativeRequestContext];

  if (v12)
  {
    uint64_t v13 = [(GATSchemaGATClientEvent *)self generativeRequestContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(GATSchemaGATClientEvent *)self imageResizingContext];

  if (v14)
  {
    v15 = [(GATSchemaGATClientEvent *)self imageResizingContext];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(GATSchemaGATClientEvent *)self registerMediaContext];

  if (v16)
  {
    int v17 = [(GATSchemaGATClientEvent *)self registerMediaContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GATSchemaGATClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteRegisterMediaContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_registerMediaContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATRegisterMediaContext)registerMediaContext
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_registerMediaContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRegisterMediaContext:(id)a3
{
  id v4 = (GATSchemaGATRegisterMediaContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = 0;

  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = 0;

  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = 0;

  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = 0;

  unint64_t v10 = 106;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = v4;
}

- (void)deleteImageResizingContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_imageResizingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATImageResizingContext)imageResizingContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_imageResizingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setImageResizingContext:(id)a3
{
  id v4 = (GATSchemaGATImageResizingContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = 0;

  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = 0;

  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = 0;

  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = 0;

  unint64_t v10 = 105;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = v4;
}

- (void)deleteGenerativeRequestContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_generativeRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATGenerativeRequestContext)generativeRequestContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_generativeRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGenerativeRequestContext:(id)a3
{
  id v4 = (GATSchemaGATGenerativeRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = 0;

  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = 0;

  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = 0;

  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = v4;
}

- (void)deleteCreateSessionContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_createSessionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATCreateSessionContext)createSessionContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_createSessionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCreateSessionContext:(id)a3
{
  id v4 = (GATSchemaGATCreateSessionContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = 0;

  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = 0;

  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = 0;

  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = v4;
}

- (void)deleteLoadScreenContentContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_loadScreenContentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATLoadScreenContentContext)loadScreenContentContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_loadScreenContentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLoadScreenContentContext:(id)a3
{
  id v4 = (GATSchemaGATLoadScreenContentContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = 0;

  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = 0;

  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = 0;

  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = v4;
}

- (void)deleteRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GATSchemaGATRequestContext)requestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_requestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestContext:(id)a3
{
  id v4 = (GATSchemaGATRequestContext *)a3;
  loadScreenContentContext = self->_loadScreenContentContext;
  self->_loadScreenContentContext = 0;

  createSessionContext = self->_createSessionContext;
  self->_createSessionContext = 0;

  generativeRequestContext = self->_generativeRequestContext;
  self->_generativeRequestContext = 0;

  imageResizingContext = self->_imageResizingContext;
  self->_imageResizingContext = 0;

  registerMediaContext = self->_registerMediaContext;
  self->_registerMediaContext = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
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
  unint64_t v2 = [(GATSchemaGATClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 5) {
    return @"com.apple.aiml.siri.gat.GATClientEvent";
  }
  else {
    return off_1E5EC1438[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 104;
}

@end