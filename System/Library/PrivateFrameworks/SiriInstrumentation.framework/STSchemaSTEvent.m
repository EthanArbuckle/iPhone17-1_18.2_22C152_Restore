@interface STSchemaSTEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasRequestEndedTier1;
- (BOOL)hasSearchToolHallucinationDetectionContext;
- (BOOL)hasStAnswerSynthesisContext;
- (BOOL)hasStDisambiguationContext;
- (BOOL)hasStGeneralSearchContext;
- (BOOL)hasStGlobalSearchContext;
- (BOOL)hasStLLMQUQueryArgumentsTier1;
- (BOOL)hasStLLMQueryUnderstandingContext;
- (BOOL)hasStSpotlightContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (STSchemaSTAnswerSynthesisContext)stAnswerSynthesisContext;
- (STSchemaSTClientEventMetadata)eventMetadata;
- (STSchemaSTDisambiguationContext)stDisambiguationContext;
- (STSchemaSTEvent)initWithDictionary:(id)a3;
- (STSchemaSTEvent)initWithJSON:(id)a3;
- (STSchemaSTGeneralSearchContext)stGeneralSearchContext;
- (STSchemaSTGeneralSearchEndedTier1)requestEndedTier1;
- (STSchemaSTGlobalSearchContext)stGlobalSearchContext;
- (STSchemaSTHallucinationDetectionContext)searchToolHallucinationDetectionContext;
- (STSchemaSTLLMQUQueryArgumentsTier1)stLLMQUQueryArgumentsTier1;
- (STSchemaSTLLMQueryUnderstandingContext)stLLMQueryUnderstandingContext;
- (STSchemaSTSpotlightContext)stSpotlightContext;
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
- (void)deleteRequestEndedTier1;
- (void)deleteSearchToolHallucinationDetectionContext;
- (void)deleteStAnswerSynthesisContext;
- (void)deleteStDisambiguationContext;
- (void)deleteStGeneralSearchContext;
- (void)deleteStGlobalSearchContext;
- (void)deleteStLLMQUQueryArgumentsTier1;
- (void)deleteStLLMQueryUnderstandingContext;
- (void)deleteStSpotlightContext;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasRequestEndedTier1:(BOOL)a3;
- (void)setHasSearchToolHallucinationDetectionContext:(BOOL)a3;
- (void)setHasStAnswerSynthesisContext:(BOOL)a3;
- (void)setHasStDisambiguationContext:(BOOL)a3;
- (void)setHasStGeneralSearchContext:(BOOL)a3;
- (void)setHasStGlobalSearchContext:(BOOL)a3;
- (void)setHasStLLMQUQueryArgumentsTier1:(BOOL)a3;
- (void)setHasStLLMQueryUnderstandingContext:(BOOL)a3;
- (void)setHasStSpotlightContext:(BOOL)a3;
- (void)setRequestEndedTier1:(id)a3;
- (void)setSearchToolHallucinationDetectionContext:(id)a3;
- (void)setStAnswerSynthesisContext:(id)a3;
- (void)setStDisambiguationContext:(id)a3;
- (void)setStGeneralSearchContext:(id)a3;
- (void)setStGlobalSearchContext:(id)a3;
- (void)setStLLMQUQueryArgumentsTier1:(id)a3;
- (void)setStLLMQueryUnderstandingContext:(id)a3;
- (void)setStSpotlightContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTEvent

- (int)componentName
{
  v2 = [(STSchemaSTEvent *)self eventMetadata];
  v3 = [v2 searchToolId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 55;
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
  v2 = [(STSchemaSTEvent *)self eventMetadata];
  v3 = [v2 searchToolId];

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
  v37.receiver = self;
  v37.super_class = (Class)STSchemaSTEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  if ([v4 isConditionSet:4]) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  if ([v4 isConditionSet:5]) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  if ([v4 isConditionSet:6]) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  if ([v4 isConditionSet:7]) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  uint64_t v6 = [(STSchemaSTEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(STSchemaSTEvent *)self deleteEventMetadata];
  }
  v9 = [(STSchemaSTEvent *)self stGeneralSearchContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(STSchemaSTEvent *)self deleteStGeneralSearchContext];
  }
  v12 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(STSchemaSTEvent *)self deleteStLLMQueryUnderstandingContext];
  }
  v15 = [(STSchemaSTEvent *)self stSpotlightContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(STSchemaSTEvent *)self deleteStSpotlightContext];
  }
  v18 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(STSchemaSTEvent *)self deleteStAnswerSynthesisContext];
  }
  v21 = [(STSchemaSTEvent *)self stGlobalSearchContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(STSchemaSTEvent *)self deleteStGlobalSearchContext];
  }
  v24 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(STSchemaSTEvent *)self deleteStLLMQUQueryArgumentsTier1];
  }
  v27 = [(STSchemaSTEvent *)self stDisambiguationContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(STSchemaSTEvent *)self deleteStDisambiguationContext];
  }
  v30 = [(STSchemaSTEvent *)self requestEndedTier1];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(STSchemaSTEvent *)self deleteRequestEndedTier1];
  }
  v33 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(STSchemaSTEvent *)self deleteSearchToolHallucinationDetectionContext];
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
  unint64_t v3 = [(STSchemaSTEvent *)self whichEvent_Type];
  if (v3 - 101 > 8) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABF58[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8) {
    return 0;
  }
  else {
    return off_1E5EABFA0[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchToolHallucinationDetectionContext, 0);
  objc_storeStrong((id *)&self->_requestEndedTier1, 0);
  objc_storeStrong((id *)&self->_stDisambiguationContext, 0);
  objc_storeStrong((id *)&self->_stLLMQUQueryArgumentsTier1, 0);
  objc_storeStrong((id *)&self->_stGlobalSearchContext, 0);
  objc_storeStrong((id *)&self->_stAnswerSynthesisContext, 0);
  objc_storeStrong((id *)&self->_stSpotlightContext, 0);
  objc_storeStrong((id *)&self->_stLLMQueryUnderstandingContext, 0);
  objc_storeStrong((id *)&self->_stGeneralSearchContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasSearchToolHallucinationDetectionContext:(BOOL)a3
{
  self->_hasSearchToolHallucinationDetectionContext = a3;
}

- (BOOL)hasSearchToolHallucinationDetectionContext
{
  return self->_hasSearchToolHallucinationDetectionContext;
}

- (void)setHasRequestEndedTier1:(BOOL)a3
{
  self->_hasRequestEndedTier1 = a3;
}

- (BOOL)hasRequestEndedTier1
{
  return self->_hasRequestEndedTier1;
}

- (void)setHasStDisambiguationContext:(BOOL)a3
{
  self->_hasStDisambiguationContext = a3;
}

- (BOOL)hasStDisambiguationContext
{
  return self->_hasStDisambiguationContext;
}

- (void)setHasStLLMQUQueryArgumentsTier1:(BOOL)a3
{
  self->_hasStLLMQUQueryArgumentsTier1 = a3;
}

- (BOOL)hasStLLMQUQueryArgumentsTier1
{
  return self->_hasStLLMQUQueryArgumentsTier1;
}

- (void)setHasStGlobalSearchContext:(BOOL)a3
{
  self->_hasStGlobalSearchContext = a3;
}

- (BOOL)hasStGlobalSearchContext
{
  return self->_hasStGlobalSearchContext;
}

- (void)setHasStAnswerSynthesisContext:(BOOL)a3
{
  self->_hasStAnswerSynthesisContext = a3;
}

- (BOOL)hasStAnswerSynthesisContext
{
  return self->_hasStAnswerSynthesisContext;
}

- (void)setHasStSpotlightContext:(BOOL)a3
{
  self->_hasStSpotlightContext = a3;
}

- (BOOL)hasStSpotlightContext
{
  return self->_hasStSpotlightContext;
}

- (void)setHasStLLMQueryUnderstandingContext:(BOOL)a3
{
  self->_hasStLLMQueryUnderstandingContext = a3;
}

- (BOOL)hasStLLMQueryUnderstandingContext
{
  return self->_hasStLLMQueryUnderstandingContext;
}

- (void)setHasStGeneralSearchContext:(BOOL)a3
{
  self->_hasStGeneralSearchContext = a3;
}

- (BOOL)hasStGeneralSearchContext
{
  return self->_hasStGeneralSearchContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (STSchemaSTClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (STSchemaSTEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)STSchemaSTEvent;
  v5 = [(STSchemaSTEvent *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[STSchemaSTClientEventMetadata alloc] initWithDictionary:v6];
      [(STSchemaSTEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"stGeneralSearchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[STSchemaSTGeneralSearchContext alloc] initWithDictionary:v8];
      [(STSchemaSTEvent *)v5 setStGeneralSearchContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"stLLMQueryUnderstandingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[STSchemaSTLLMQueryUnderstandingContext alloc] initWithDictionary:v10];
      [(STSchemaSTEvent *)v5 setStLLMQueryUnderstandingContext:v11];
    }
    v30 = (void *)v10;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"stSpotlightContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[STSchemaSTSpotlightContext alloc] initWithDictionary:v12];
      [(STSchemaSTEvent *)v5 setStSpotlightContext:v13];
    }
    int v29 = (void *)v12;
    int v14 = [v4 objectForKeyedSubscript:@"stAnswerSynthesisContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[STSchemaSTAnswerSynthesisContext alloc] initWithDictionary:v14];
      [(STSchemaSTEvent *)v5 setStAnswerSynthesisContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"stGlobalSearchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[STSchemaSTGlobalSearchContext alloc] initWithDictionary:v16];
      [(STSchemaSTEvent *)v5 setStGlobalSearchContext:v17];
    }
    v31 = (void *)v8;
    v18 = [v4 objectForKeyedSubscript:@"stLLMQUQueryArgumentsTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[STSchemaSTLLMQUQueryArgumentsTier1 alloc] initWithDictionary:v18];
      [(STSchemaSTEvent *)v5 setStLLMQUQueryArgumentsTier1:v19];
    }
    int v20 = (void *)v6;
    v21 = [v4 objectForKeyedSubscript:@"stDisambiguationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[STSchemaSTDisambiguationContext alloc] initWithDictionary:v21];
      [(STSchemaSTEvent *)v5 setStDisambiguationContext:v22];
    }
    int v23 = [v4 objectForKeyedSubscript:@"requestEndedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[STSchemaSTGeneralSearchEndedTier1 alloc] initWithDictionary:v23];
      [(STSchemaSTEvent *)v5 setRequestEndedTier1:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"searchToolHallucinationDetectionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[STSchemaSTHallucinationDetectionContext alloc] initWithDictionary:v25];
      [(STSchemaSTEvent *)v5 setSearchToolHallucinationDetectionContext:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (STSchemaSTEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTEvent *)self dictionaryRepresentation];
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
    id v4 = [(STSchemaSTEvent *)self eventMetadata];
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
  if (self->_requestEndedTier1)
  {
    uint64_t v7 = [(STSchemaSTEvent *)self requestEndedTier1];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"requestEndedTier1"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"requestEndedTier1"];
    }
  }
  if (self->_searchToolHallucinationDetectionContext)
  {
    uint64_t v10 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"searchToolHallucinationDetectionContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"searchToolHallucinationDetectionContext"];
    }
  }
  if (self->_stAnswerSynthesisContext)
  {
    v13 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"stAnswerSynthesisContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"stAnswerSynthesisContext"];
    }
  }
  if (self->_stDisambiguationContext)
  {
    v16 = [(STSchemaSTEvent *)self stDisambiguationContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"stDisambiguationContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"stDisambiguationContext"];
    }
  }
  if (self->_stGeneralSearchContext)
  {
    v19 = [(STSchemaSTEvent *)self stGeneralSearchContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"stGeneralSearchContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"stGeneralSearchContext"];
    }
  }
  if (self->_stGlobalSearchContext)
  {
    v22 = [(STSchemaSTEvent *)self stGlobalSearchContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"stGlobalSearchContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"stGlobalSearchContext"];
    }
  }
  if (self->_stLLMQUQueryArgumentsTier1)
  {
    v25 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"stLLMQUQueryArgumentsTier1"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"stLLMQUQueryArgumentsTier1"];
    }
  }
  if (self->_stLLMQueryUnderstandingContext)
  {
    v28 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"stLLMQueryUnderstandingContext"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"stLLMQueryUnderstandingContext"];
    }
  }
  if (self->_stSpotlightContext)
  {
    v31 = [(STSchemaSTEvent *)self stSpotlightContext];
    objc_super v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"stSpotlightContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"stSpotlightContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(STSchemaSTClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(STSchemaSTGeneralSearchContext *)self->_stGeneralSearchContext hash] ^ v3;
  unint64_t v5 = [(STSchemaSTLLMQueryUnderstandingContext *)self->_stLLMQueryUnderstandingContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(STSchemaSTSpotlightContext *)self->_stSpotlightContext hash];
  unint64_t v7 = [(STSchemaSTAnswerSynthesisContext *)self->_stAnswerSynthesisContext hash];
  unint64_t v8 = v7 ^ [(STSchemaSTGlobalSearchContext *)self->_stGlobalSearchContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(STSchemaSTLLMQUQueryArgumentsTier1 *)self->_stLLMQUQueryArgumentsTier1 hash];
  unint64_t v10 = [(STSchemaSTDisambiguationContext *)self->_stDisambiguationContext hash];
  unint64_t v11 = v10 ^ [(STSchemaSTGeneralSearchEndedTier1 *)self->_requestEndedTier1 hash];
  return v9 ^ v11 ^ [(STSchemaSTHallucinationDetectionContext *)self->_searchToolHallucinationDetectionContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_53;
  }
  unint64_t v6 = [(STSchemaSTEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v8 = [(STSchemaSTEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(STSchemaSTEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stGeneralSearchContext];
  unint64_t v7 = [v4 stGeneralSearchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v13 = [(STSchemaSTEvent *)self stGeneralSearchContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(STSchemaSTEvent *)self stGeneralSearchContext];
    v16 = [v4 stGeneralSearchContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
  unint64_t v7 = [v4 stLLMQueryUnderstandingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v18 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
    v21 = [v4 stLLMQueryUnderstandingContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stSpotlightContext];
  unint64_t v7 = [v4 stSpotlightContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v23 = [(STSchemaSTEvent *)self stSpotlightContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(STSchemaSTEvent *)self stSpotlightContext];
    int v26 = [v4 stSpotlightContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
  unint64_t v7 = [v4 stAnswerSynthesisContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v28 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
    v31 = [v4 stAnswerSynthesisContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stGlobalSearchContext];
  unint64_t v7 = [v4 stGlobalSearchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v33 = [(STSchemaSTEvent *)self stGlobalSearchContext];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(STSchemaSTEvent *)self stGlobalSearchContext];
    v36 = [v4 stGlobalSearchContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
  unint64_t v7 = [v4 stLLMQUQueryArgumentsTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v38 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
    v41 = [v4 stLLMQUQueryArgumentsTier1];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stDisambiguationContext];
  unint64_t v7 = [v4 stDisambiguationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v43 = [(STSchemaSTEvent *)self stDisambiguationContext];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(STSchemaSTEvent *)self stDisambiguationContext];
    v46 = [v4 stDisambiguationContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self requestEndedTier1];
  unint64_t v7 = [v4 requestEndedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v48 = [(STSchemaSTEvent *)self requestEndedTier1];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(STSchemaSTEvent *)self requestEndedTier1];
    v51 = [v4 requestEndedTier1];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
  unint64_t v7 = [v4 searchToolHallucinationDetectionContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v53 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
    if (!v53)
    {

LABEL_56:
      BOOL v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    v55 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
    v56 = [v4 searchToolHallucinationDetectionContext];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_56;
    }
  }
  else
  {
LABEL_52:
  }
LABEL_53:
  BOOL v58 = 0;
LABEL_54:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v24 = a3;
  id v4 = [(STSchemaSTEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(STSchemaSTEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(STSchemaSTEvent *)self stGeneralSearchContext];

  if (v6)
  {
    unint64_t v7 = [(STSchemaSTEvent *)self stGeneralSearchContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];

  if (v8)
  {
    unint64_t v9 = [(STSchemaSTEvent *)self stLLMQueryUnderstandingContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(STSchemaSTEvent *)self stSpotlightContext];

  if (v10)
  {
    unint64_t v11 = [(STSchemaSTEvent *)self stSpotlightContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];

  if (v12)
  {
    uint64_t v13 = [(STSchemaSTEvent *)self stAnswerSynthesisContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(STSchemaSTEvent *)self stGlobalSearchContext];

  if (v14)
  {
    v15 = [(STSchemaSTEvent *)self stGlobalSearchContext];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];

  if (v16)
  {
    int v17 = [(STSchemaSTEvent *)self stLLMQUQueryArgumentsTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(STSchemaSTEvent *)self stDisambiguationContext];

  if (v18)
  {
    v19 = [(STSchemaSTEvent *)self stDisambiguationContext];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(STSchemaSTEvent *)self requestEndedTier1];

  if (v20)
  {
    v21 = [(STSchemaSTEvent *)self requestEndedTier1];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];

  if (v22)
  {
    uint64_t v23 = [(STSchemaSTEvent *)self searchToolHallucinationDetectionContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSearchToolHallucinationDetectionContext
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_searchToolHallucinationDetectionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTHallucinationDetectionContext)searchToolHallucinationDetectionContext
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_searchToolHallucinationDetectionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchToolHallucinationDetectionContext:(id)a3
{
  id v4 = (STSchemaSTHallucinationDetectionContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  unint64_t v13 = 109;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = v4;
}

- (void)deleteRequestEndedTier1
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestEndedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTGeneralSearchEndedTier1)requestEndedTier1
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_requestEndedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestEndedTier1:(id)a3
{
  id v4 = (STSchemaSTGeneralSearchEndedTier1 *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 108;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = v4;
}

- (void)deleteStDisambiguationContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stDisambiguationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTDisambiguationContext)stDisambiguationContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_stDisambiguationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStDisambiguationContext:(id)a3
{
  id v4 = (STSchemaSTDisambiguationContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 107;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = v4;
}

- (void)deleteStLLMQUQueryArgumentsTier1
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stLLMQUQueryArgumentsTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTLLMQUQueryArgumentsTier1)stLLMQUQueryArgumentsTier1
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_stLLMQUQueryArgumentsTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStLLMQUQueryArgumentsTier1:(id)a3
{
  id v4 = (STSchemaSTLLMQUQueryArgumentsTier1 *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 106;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = v4;
}

- (void)deleteStGlobalSearchContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stGlobalSearchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTGlobalSearchContext)stGlobalSearchContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_stGlobalSearchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStGlobalSearchContext:(id)a3
{
  id v4 = (STSchemaSTGlobalSearchContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 105;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = v4;
}

- (void)deleteStAnswerSynthesisContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stAnswerSynthesisContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTAnswerSynthesisContext)stAnswerSynthesisContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_stAnswerSynthesisContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStAnswerSynthesisContext:(id)a3
{
  id v4 = (STSchemaSTAnswerSynthesisContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 104;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = v4;
}

- (void)deleteStSpotlightContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stSpotlightContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTSpotlightContext)stSpotlightContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_stSpotlightContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStSpotlightContext:(id)a3
{
  id v4 = (STSchemaSTSpotlightContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 103;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = v4;
}

- (void)deleteStLLMQueryUnderstandingContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stLLMQueryUnderstandingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTLLMQueryUnderstandingContext)stLLMQueryUnderstandingContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_stLLMQueryUnderstandingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStLLMQueryUnderstandingContext:(id)a3
{
  id v4 = (STSchemaSTLLMQueryUnderstandingContext *)a3;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 102;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = v4;
}

- (void)deleteStGeneralSearchContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_stGeneralSearchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (STSchemaSTGeneralSearchContext)stGeneralSearchContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_stGeneralSearchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setStGeneralSearchContext:(id)a3
{
  id v4 = (STSchemaSTGeneralSearchContext *)a3;
  stLLMQueryUnderstandingContext = self->_stLLMQueryUnderstandingContext;
  self->_stLLMQueryUnderstandingContext = 0;

  stSpotlightContext = self->_stSpotlightContext;
  self->_stSpotlightContext = 0;

  stAnswerSynthesisContext = self->_stAnswerSynthesisContext;
  self->_stAnswerSynthesisContext = 0;

  stGlobalSearchContext = self->_stGlobalSearchContext;
  self->_stGlobalSearchContext = 0;

  stLLMQUQueryArgumentsTier1 = self->_stLLMQUQueryArgumentsTier1;
  self->_stLLMQUQueryArgumentsTier1 = 0;

  stDisambiguationContext = self->_stDisambiguationContext;
  self->_stDisambiguationContext = 0;

  requestEndedTier1 = self->_requestEndedTier1;
  self->_requestEndedTier1 = 0;

  searchToolHallucinationDetectionContext = self->_searchToolHallucinationDetectionContext;
  self->_searchToolHallucinationDetectionContext = 0;

  unint64_t v13 = 101;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  stGeneralSearchContext = self->_stGeneralSearchContext;
  self->_stGeneralSearchContext = v4;
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
  unint64_t v2 = [(STSchemaSTEvent *)self whichEvent_Type];
  if (v2 - 101 > 8) {
    return @"com.apple.aiml.siri.searchtool.STEvent";
  }
  else {
    return off_1E5EC0CA8[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 102;
}

@end