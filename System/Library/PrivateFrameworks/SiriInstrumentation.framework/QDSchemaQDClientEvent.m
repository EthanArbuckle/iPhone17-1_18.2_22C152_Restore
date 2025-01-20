@interface QDSchemaQDClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCollectionContext;
- (BOOL)hasEntitiesCollected;
- (BOOL)hasEntitiesRanked;
- (BOOL)hasEventMetadata;
- (BOOL)hasSubComponentContext;
- (BOOL)hasTuplesGenerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (QDSchemaQDClientEvent)initWithDictionary:(id)a3;
- (QDSchemaQDClientEvent)initWithJSON:(id)a3;
- (QDSchemaQDClientEventMetadata)eventMetadata;
- (QDSchemaQDCollectionContext)collectionContext;
- (QDSchemaQDEntitiesCollected)entitiesCollected;
- (QDSchemaQDEntitiesRanked)entitiesRanked;
- (QDSchemaQDSubComponentContext)subComponentContext;
- (QDSchemaQDTuplesGenerated)tuplesGenerated;
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
- (void)deleteCollectionContext;
- (void)deleteEntitiesCollected;
- (void)deleteEntitiesRanked;
- (void)deleteEventMetadata;
- (void)deleteSubComponentContext;
- (void)deleteTuplesGenerated;
- (void)setCollectionContext:(id)a3;
- (void)setEntitiesCollected:(id)a3;
- (void)setEntitiesRanked:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCollectionContext:(BOOL)a3;
- (void)setHasEntitiesCollected:(BOOL)a3;
- (void)setHasEntitiesRanked:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasSubComponentContext:(BOOL)a3;
- (void)setHasTuplesGenerated:(BOOL)a3;
- (void)setSubComponentContext:(id)a3;
- (void)setTuplesGenerated:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDClientEvent

- (int)componentName
{
  v2 = [(QDSchemaQDClientEvent *)self eventMetadata];
  v3 = [v2 qdId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 50;
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
  v2 = [(QDSchemaQDClientEvent *)self eventMetadata];
  v3 = [v2 qdId];

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
  v25.receiver = self;
  v25.super_class = (Class)QDSchemaQDClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  uint64_t v6 = [(QDSchemaQDClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(QDSchemaQDClientEvent *)self deleteEventMetadata];
  }
  v9 = [(QDSchemaQDClientEvent *)self collectionContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(QDSchemaQDClientEvent *)self deleteCollectionContext];
  }
  v12 = [(QDSchemaQDClientEvent *)self entitiesCollected];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(QDSchemaQDClientEvent *)self deleteEntitiesCollected];
  }
  v15 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(QDSchemaQDClientEvent *)self deleteTuplesGenerated];
  }
  v18 = [(QDSchemaQDClientEvent *)self entitiesRanked];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(QDSchemaQDClientEvent *)self deleteEntitiesRanked];
  }
  v21 = [(QDSchemaQDClientEvent *)self subComponentContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(QDSchemaQDClientEvent *)self deleteSubComponentContext];
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
  unint64_t v3 = [(QDSchemaQDClientEvent *)self whichEvent_Type];
  if (v3 - 100 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABBF8[v3 - 100]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 100 > 4) {
    return 0;
  }
  else {
    return off_1E5EABC20[a3 - 100];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subComponentContext, 0);
  objc_storeStrong((id *)&self->_entitiesRanked, 0);
  objc_storeStrong((id *)&self->_tuplesGenerated, 0);
  objc_storeStrong((id *)&self->_entitiesCollected, 0);
  objc_storeStrong((id *)&self->_collectionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSubComponentContext:(BOOL)a3
{
  self->_hasSubComponentContext = a3;
}

- (BOOL)hasSubComponentContext
{
  return self->_hasSubComponentContext;
}

- (void)setHasEntitiesRanked:(BOOL)a3
{
  self->_hasEntitiesRanked = a3;
}

- (BOOL)hasEntitiesRanked
{
  return self->_hasEntitiesRanked;
}

- (void)setHasTuplesGenerated:(BOOL)a3
{
  self->_hasTuplesGenerated = a3;
}

- (BOOL)hasTuplesGenerated
{
  return self->_hasTuplesGenerated;
}

- (void)setHasEntitiesCollected:(BOOL)a3
{
  self->_hasEntitiesCollected = a3;
}

- (BOOL)hasEntitiesCollected
{
  return self->_hasEntitiesCollected;
}

- (void)setHasCollectionContext:(BOOL)a3
{
  self->_hasCollectionContext = a3;
}

- (BOOL)hasCollectionContext
{
  return self->_hasCollectionContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (QDSchemaQDClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (QDSchemaQDClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)QDSchemaQDClientEvent;
  v5 = [(QDSchemaQDClientEvent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[QDSchemaQDClientEventMetadata alloc] initWithDictionary:v6];
      [(QDSchemaQDClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"collectionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[QDSchemaQDCollectionContext alloc] initWithDictionary:v8];
      [(QDSchemaQDClientEvent *)v5 setCollectionContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"entitiesCollected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[QDSchemaQDEntitiesCollected alloc] initWithDictionary:v10];
      [(QDSchemaQDClientEvent *)v5 setEntitiesCollected:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"tuplesGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[QDSchemaQDTuplesGenerated alloc] initWithDictionary:v12];
      [(QDSchemaQDClientEvent *)v5 setTuplesGenerated:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"entitiesRanked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[QDSchemaQDEntitiesRanked alloc] initWithDictionary:v14];
      [(QDSchemaQDClientEvent *)v5 setEntitiesRanked:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"subComponentContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[QDSchemaQDSubComponentContext alloc] initWithDictionary:v16];
      [(QDSchemaQDClientEvent *)v5 setSubComponentContext:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (QDSchemaQDClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDClientEvent *)self dictionaryRepresentation];
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
  if (self->_collectionContext)
  {
    id v4 = [(QDSchemaQDClientEvent *)self collectionContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"collectionContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"collectionContext"];
    }
  }
  if (self->_entitiesCollected)
  {
    uint64_t v7 = [(QDSchemaQDClientEvent *)self entitiesCollected];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"entitiesCollected"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"entitiesCollected"];
    }
  }
  if (self->_entitiesRanked)
  {
    v10 = [(QDSchemaQDClientEvent *)self entitiesRanked];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"entitiesRanked"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"entitiesRanked"];
    }
  }
  if (self->_eventMetadata)
  {
    v13 = [(QDSchemaQDClientEvent *)self eventMetadata];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_subComponentContext)
  {
    v16 = [(QDSchemaQDClientEvent *)self subComponentContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"subComponentContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"subComponentContext"];
    }
  }
  if (self->_tuplesGenerated)
  {
    v19 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"tuplesGenerated"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"tuplesGenerated"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(QDSchemaQDClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(QDSchemaQDCollectionContext *)self->_collectionContext hash] ^ v3;
  unint64_t v5 = [(QDSchemaQDEntitiesCollected *)self->_entitiesCollected hash];
  unint64_t v6 = v4 ^ v5 ^ [(QDSchemaQDTuplesGenerated *)self->_tuplesGenerated hash];
  unint64_t v7 = [(QDSchemaQDEntitiesRanked *)self->_entitiesRanked hash];
  return v6 ^ v7 ^ [(QDSchemaQDSubComponentContext *)self->_subComponentContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_33;
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v8 = [(QDSchemaQDClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(QDSchemaQDClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self collectionContext];
  unint64_t v7 = [v4 collectionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v13 = [(QDSchemaQDClientEvent *)self collectionContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(QDSchemaQDClientEvent *)self collectionContext];
    v16 = [v4 collectionContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self entitiesCollected];
  unint64_t v7 = [v4 entitiesCollected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v18 = [(QDSchemaQDClientEvent *)self entitiesCollected];
  if (v18)
  {
    v19 = (void *)v18;
    objc_super v20 = [(QDSchemaQDClientEvent *)self entitiesCollected];
    v21 = [v4 entitiesCollected];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
  unint64_t v7 = [v4 tuplesGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v23 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
    v26 = [v4 tuplesGenerated];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self entitiesRanked];
  unint64_t v7 = [v4 entitiesRanked];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_32;
  }
  uint64_t v28 = [(QDSchemaQDClientEvent *)self entitiesRanked];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(QDSchemaQDClientEvent *)self entitiesRanked];
    v31 = [v4 entitiesRanked];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self subComponentContext];
  unint64_t v7 = [v4 subComponentContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v33 = [(QDSchemaQDClientEvent *)self subComponentContext];
    if (!v33)
    {

LABEL_36:
      BOOL v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    v35 = [(QDSchemaQDClientEvent *)self subComponentContext];
    v36 = [v4 subComponentContext];
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_36;
    }
  }
  else
  {
LABEL_32:
  }
LABEL_33:
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(QDSchemaQDClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(QDSchemaQDClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(QDSchemaQDClientEvent *)self collectionContext];

  if (v6)
  {
    unint64_t v7 = [(QDSchemaQDClientEvent *)self collectionContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(QDSchemaQDClientEvent *)self entitiesCollected];

  if (v8)
  {
    v9 = [(QDSchemaQDClientEvent *)self entitiesCollected];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(QDSchemaQDClientEvent *)self tuplesGenerated];

  if (v10)
  {
    int v11 = [(QDSchemaQDClientEvent *)self tuplesGenerated];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(QDSchemaQDClientEvent *)self entitiesRanked];

  if (v12)
  {
    uint64_t v13 = [(QDSchemaQDClientEvent *)self entitiesRanked];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(QDSchemaQDClientEvent *)self subComponentContext];

  if (v14)
  {
    v15 = [(QDSchemaQDClientEvent *)self subComponentContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubComponentContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_subComponentContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (QDSchemaQDSubComponentContext)subComponentContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_subComponentContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSubComponentContext:(id)a3
{
  id v4 = (QDSchemaQDSubComponentContext *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  unint64_t v9 = 104;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = v4;
}

- (void)deleteEntitiesRanked
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entitiesRanked = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (QDSchemaQDEntitiesRanked)entitiesRanked
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_entitiesRanked;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntitiesRanked:(id)a3
{
  id v4 = (QDSchemaQDEntitiesRanked *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  unint64_t v9 = 103;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = v4;
}

- (void)deleteTuplesGenerated
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_tuplesGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (QDSchemaQDTuplesGenerated)tuplesGenerated
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_tuplesGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTuplesGenerated:(id)a3
{
  id v4 = (QDSchemaQDTuplesGenerated *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  unint64_t v9 = 102;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = v4;
}

- (void)deleteEntitiesCollected
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_entitiesCollected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (QDSchemaQDEntitiesCollected)entitiesCollected
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_entitiesCollected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntitiesCollected:(id)a3
{
  id v4 = (QDSchemaQDEntitiesCollected *)a3;
  collectionContext = self->_collectionContext;
  self->_collectionContext = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  unint64_t v9 = 101;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = v4;
}

- (void)deleteCollectionContext
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_collectionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (QDSchemaQDCollectionContext)collectionContext
{
  if (self->_whichEvent_Type == 100) {
    v2 = self->_collectionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCollectionContext:(id)a3
{
  id v4 = (QDSchemaQDCollectionContext *)a3;
  entitiesCollected = self->_entitiesCollected;
  self->_entitiesCollected = 0;

  tuplesGenerated = self->_tuplesGenerated;
  self->_tuplesGenerated = 0;

  entitiesRanked = self->_entitiesRanked;
  self->_entitiesRanked = 0;

  subComponentContext = self->_subComponentContext;
  self->_subComponentContext = 0;

  unint64_t v9 = 100;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichEvent_Type = v9;
  collectionContext = self->_collectionContext;
  self->_collectionContext = v4;
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
  unint64_t v2 = [(QDSchemaQDClientEvent *)self whichEvent_Type];
  if (v2 - 100 > 4) {
    return @"com.apple.aiml.siri.qd.QDClientEvent";
  }
  else {
    return off_1E5EBF708[v2 - 100];
  }
}

- (int)getAnyEventType
{
  return 95;
}

@end