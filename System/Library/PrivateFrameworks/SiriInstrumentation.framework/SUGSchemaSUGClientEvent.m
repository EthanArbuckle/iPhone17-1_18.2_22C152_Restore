@interface SUGSchemaSUGClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEngagementMetricReported;
- (BOOL)hasEngagementReported;
- (BOOL)hasEventMetadata;
- (BOOL)hasFilteringStepContext;
- (BOOL)hasGenerationStepContext;
- (BOOL)hasRankingStepContext;
- (BOOL)hasRequestContext;
- (BOOL)hasResolutionStepContext;
- (BOOL)hasSugGeneratedTier1;
- (BOOL)hasSuggestionsGenerated;
- (BOOL)hasTypingWindowEnded;
- (BOOL)hasUiActivity;
- (BOOL)hasUiActivityTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (SUGSchemaSUGClientEvent)initWithDictionary:(id)a3;
- (SUGSchemaSUGClientEvent)initWithJSON:(id)a3;
- (SUGSchemaSUGClientEventMetadata)eventMetadata;
- (SUGSchemaSUGEngagementMetricReported)engagementMetricReported;
- (SUGSchemaSUGEngagementReported)engagementReported;
- (SUGSchemaSUGFilteringStepContext)filteringStepContext;
- (SUGSchemaSUGGenerationStepContext)generationStepContext;
- (SUGSchemaSUGRankingStepContext)rankingStepContext;
- (SUGSchemaSUGRequestContext)requestContext;
- (SUGSchemaSUGResolutionStepContext)resolutionStepContext;
- (SUGSchemaSUGSuggestionsGenerated)suggestionsGenerated;
- (SUGSchemaSUGSuggestionsGeneratedTier1)sugGeneratedTier1;
- (SUGSchemaSUGSuggestionsUIActivity)uiActivity;
- (SUGSchemaSUGSuggestionsUIActivityTier1)uiActivityTier1;
- (SUGSchemaSUGTypingWindowEnded)typingWindowEnded;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEngagementMetricReported;
- (void)deleteEngagementReported;
- (void)deleteEventMetadata;
- (void)deleteFilteringStepContext;
- (void)deleteGenerationStepContext;
- (void)deleteRankingStepContext;
- (void)deleteRequestContext;
- (void)deleteResolutionStepContext;
- (void)deleteSugGeneratedTier1;
- (void)deleteSuggestionsGenerated;
- (void)deleteTypingWindowEnded;
- (void)deleteUiActivity;
- (void)deleteUiActivityTier1;
- (void)setEngagementMetricReported:(id)a3;
- (void)setEngagementReported:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setFilteringStepContext:(id)a3;
- (void)setGenerationStepContext:(id)a3;
- (void)setHasEngagementMetricReported:(BOOL)a3;
- (void)setHasEngagementReported:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasFilteringStepContext:(BOOL)a3;
- (void)setHasGenerationStepContext:(BOOL)a3;
- (void)setHasRankingStepContext:(BOOL)a3;
- (void)setHasRequestContext:(BOOL)a3;
- (void)setHasResolutionStepContext:(BOOL)a3;
- (void)setHasSugGeneratedTier1:(BOOL)a3;
- (void)setHasSuggestionsGenerated:(BOOL)a3;
- (void)setHasTypingWindowEnded:(BOOL)a3;
- (void)setHasUiActivity:(BOOL)a3;
- (void)setHasUiActivityTier1:(BOOL)a3;
- (void)setRankingStepContext:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setResolutionStepContext:(id)a3;
- (void)setSugGeneratedTier1:(id)a3;
- (void)setSuggestionsGenerated:(id)a3;
- (void)setTypingWindowEnded:(id)a3;
- (void)setUiActivity:(id)a3;
- (void)setUiActivityTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGClientEvent

- (id)getComponentId
{
  v2 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
  v3 = [v2 sugId];

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
  return 1;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SUGSchemaSUGClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v46 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
  }
  uint64_t v6 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SUGSchemaSUGClientEvent *)self deleteEventMetadata];
  }
  v9 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SUGSchemaSUGClientEvent *)self deleteSuggestionsGenerated];
  }
  v12 = [(SUGSchemaSUGClientEvent *)self engagementReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SUGSchemaSUGClientEvent *)self deleteEngagementReported];
  }
  v15 = [(SUGSchemaSUGClientEvent *)self requestContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SUGSchemaSUGClientEvent *)self deleteRequestContext];
  }
  v18 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SUGSchemaSUGClientEvent *)self deleteGenerationStepContext];
  }
  v21 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(SUGSchemaSUGClientEvent *)self deleteResolutionStepContext];
  }
  v24 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(SUGSchemaSUGClientEvent *)self deleteFilteringStepContext];
  }
  v27 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(SUGSchemaSUGClientEvent *)self deleteRankingStepContext];
  }
  v30 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(SUGSchemaSUGClientEvent *)self deleteEngagementMetricReported];
  }
  v33 = [(SUGSchemaSUGClientEvent *)self uiActivity];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(SUGSchemaSUGClientEvent *)self deleteUiActivity];
  }
  v36 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(SUGSchemaSUGClientEvent *)self deleteTypingWindowEnded];
  }
  v39 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(SUGSchemaSUGClientEvent *)self deleteSugGeneratedTier1];
  }
  v42 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(SUGSchemaSUGClientEvent *)self deleteUiActivityTier1];
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
  unint64_t v3 = [(SUGSchemaSUGClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0xB) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABFE8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xB) {
    return 0;
  }
  else {
    return off_1E5EAC048[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(SUGSchemaSUGClientEvent *)self whichEvent_Type] == 102) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiActivityTier1, 0);
  objc_storeStrong((id *)&self->_sugGeneratedTier1, 0);
  objc_storeStrong((id *)&self->_typingWindowEnded, 0);
  objc_storeStrong((id *)&self->_uiActivity, 0);
  objc_storeStrong((id *)&self->_engagementMetricReported, 0);
  objc_storeStrong((id *)&self->_rankingStepContext, 0);
  objc_storeStrong((id *)&self->_filteringStepContext, 0);
  objc_storeStrong((id *)&self->_resolutionStepContext, 0);
  objc_storeStrong((id *)&self->_generationStepContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_engagementReported, 0);
  objc_storeStrong((id *)&self->_suggestionsGenerated, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasUiActivityTier1:(BOOL)a3
{
  self->_hasUiActivityTier1 = a3;
}

- (BOOL)hasUiActivityTier1
{
  return self->_hasUiActivityTier1;
}

- (void)setHasSugGeneratedTier1:(BOOL)a3
{
  self->_hasSugGeneratedTier1 = a3;
}

- (BOOL)hasSugGeneratedTier1
{
  return self->_hasSugGeneratedTier1;
}

- (void)setHasTypingWindowEnded:(BOOL)a3
{
  self->_hasTypingWindowEnded = a3;
}

- (BOOL)hasTypingWindowEnded
{
  return self->_hasTypingWindowEnded;
}

- (void)setHasUiActivity:(BOOL)a3
{
  self->_hasUiActivity = a3;
}

- (BOOL)hasUiActivity
{
  return self->_hasUiActivity;
}

- (void)setHasEngagementMetricReported:(BOOL)a3
{
  self->_hasEngagementMetricReported = a3;
}

- (BOOL)hasEngagementMetricReported
{
  return self->_hasEngagementMetricReported;
}

- (void)setHasRankingStepContext:(BOOL)a3
{
  self->_hasRankingStepContext = a3;
}

- (BOOL)hasRankingStepContext
{
  return self->_hasRankingStepContext;
}

- (void)setHasFilteringStepContext:(BOOL)a3
{
  self->_hasFilteringStepContext = a3;
}

- (BOOL)hasFilteringStepContext
{
  return self->_hasFilteringStepContext;
}

- (void)setHasResolutionStepContext:(BOOL)a3
{
  self->_hasResolutionStepContext = a3;
}

- (BOOL)hasResolutionStepContext
{
  return self->_hasResolutionStepContext;
}

- (void)setHasGenerationStepContext:(BOOL)a3
{
  self->_hasGenerationStepContext = a3;
}

- (BOOL)hasGenerationStepContext
{
  return self->_hasGenerationStepContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasEngagementReported:(BOOL)a3
{
  self->_hasEngagementReported = a3;
}

- (BOOL)hasEngagementReported
{
  return self->_hasEngagementReported;
}

- (void)setHasSuggestionsGenerated:(BOOL)a3
{
  self->_hasSuggestionsGenerated = a3;
}

- (BOOL)hasSuggestionsGenerated
{
  return self->_hasSuggestionsGenerated;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (SUGSchemaSUGClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SUGSchemaSUGClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUGSchemaSUGClientEvent;
  v5 = [(SUGSchemaSUGClientEvent *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SUGSchemaSUGClientEventMetadata alloc] initWithDictionary:v6];
      [(SUGSchemaSUGClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"suggestionsGenerated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SUGSchemaSUGSuggestionsGenerated alloc] initWithDictionary:v8];
      [(SUGSchemaSUGClientEvent *)v5 setSuggestionsGenerated:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"engagementReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SUGSchemaSUGEngagementReported alloc] initWithDictionary:v10];
      [(SUGSchemaSUGClientEvent *)v5 setEngagementReported:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"requestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SUGSchemaSUGRequestContext alloc] initWithDictionary:v12];
      [(SUGSchemaSUGClientEvent *)v5 setRequestContext:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"generationStepContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SUGSchemaSUGGenerationStepContext alloc] initWithDictionary:v14];
      [(SUGSchemaSUGClientEvent *)v5 setGenerationStepContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"resolutionStepContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SUGSchemaSUGResolutionStepContext alloc] initWithDictionary:v16];
      [(SUGSchemaSUGClientEvent *)v5 setResolutionStepContext:v17];
    }
    v36 = (void *)v16;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"filteringStepContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SUGSchemaSUGFilteringStepContext alloc] initWithDictionary:v18];
      [(SUGSchemaSUGClientEvent *)v5 setFilteringStepContext:v19];
    }
    v40 = (void *)v6;
    int v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"rankingStepContext", v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SUGSchemaSUGRankingStepContext alloc] initWithDictionary:v20];
      [(SUGSchemaSUGClientEvent *)v5 setRankingStepContext:v21];
    }
    v39 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"engagementMetricReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[SUGSchemaSUGEngagementMetricReported alloc] initWithDictionary:v22];
      [(SUGSchemaSUGClientEvent *)v5 setEngagementMetricReported:v23];
    }
    v37 = (void *)v14;
    int v38 = (void *)v10;
    v24 = [v4 objectForKeyedSubscript:@"uiActivity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[SUGSchemaSUGSuggestionsUIActivity alloc] initWithDictionary:v24];
      [(SUGSchemaSUGClientEvent *)v5 setUiActivity:v25];
    }
    int v26 = (void *)v12;
    v27 = [v4 objectForKeyedSubscript:@"typingWindowEnded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[SUGSchemaSUGTypingWindowEnded alloc] initWithDictionary:v27];
      [(SUGSchemaSUGClientEvent *)v5 setTypingWindowEnded:v28];
    }
    int v29 = [v4 objectForKeyedSubscript:@"sugGeneratedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[SUGSchemaSUGSuggestionsGeneratedTier1 alloc] initWithDictionary:v29];
      [(SUGSchemaSUGClientEvent *)v5 setSugGeneratedTier1:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"uiActivityTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v32 = [[SUGSchemaSUGSuggestionsUIActivityTier1 alloc] initWithDictionary:v31];
      [(SUGSchemaSUGClientEvent *)v5 setUiActivityTier1:v32];
    }
    v33 = v5;
  }
  return v5;
}

- (SUGSchemaSUGClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGClientEvent *)self dictionaryRepresentation];
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
  if (self->_engagementMetricReported)
  {
    id v4 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"engagementMetricReported"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"engagementMetricReported"];
    }
  }
  if (self->_engagementReported)
  {
    uint64_t v7 = [(SUGSchemaSUGClientEvent *)self engagementReported];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"engagementReported"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"engagementReported"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v10 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_filteringStepContext)
  {
    v13 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"filteringStepContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"filteringStepContext"];
    }
  }
  if (self->_generationStepContext)
  {
    uint64_t v16 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"generationStepContext"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"generationStepContext"];
    }
  }
  if (self->_rankingStepContext)
  {
    v19 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"rankingStepContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"rankingStepContext"];
    }
  }
  if (self->_requestContext)
  {
    v22 = [(SUGSchemaSUGClientEvent *)self requestContext];
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
  if (self->_resolutionStepContext)
  {
    v25 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"resolutionStepContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"resolutionStepContext"];
    }
  }
  if (self->_sugGeneratedTier1)
  {
    v28 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"sugGeneratedTier1"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"sugGeneratedTier1"];
    }
  }
  if (self->_suggestionsGenerated)
  {
    v31 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"suggestionsGenerated"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"suggestionsGenerated"];
    }
  }
  if (self->_typingWindowEnded)
  {
    v34 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"typingWindowEnded"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"typingWindowEnded"];
    }
  }
  if (self->_uiActivity)
  {
    v37 = [(SUGSchemaSUGClientEvent *)self uiActivity];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"uiActivity"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"uiActivity"];
    }
  }
  if (self->_uiActivityTier1)
  {
    v40 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
    objc_super v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"uiActivityTier1"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"uiActivityTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SUGSchemaSUGClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SUGSchemaSUGSuggestionsGenerated *)self->_suggestionsGenerated hash] ^ v3;
  unint64_t v5 = [(SUGSchemaSUGEngagementReported *)self->_engagementReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(SUGSchemaSUGRequestContext *)self->_requestContext hash];
  unint64_t v7 = [(SUGSchemaSUGGenerationStepContext *)self->_generationStepContext hash];
  unint64_t v8 = v7 ^ [(SUGSchemaSUGResolutionStepContext *)self->_resolutionStepContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(SUGSchemaSUGFilteringStepContext *)self->_filteringStepContext hash];
  unint64_t v10 = [(SUGSchemaSUGRankingStepContext *)self->_rankingStepContext hash];
  unint64_t v11 = v10 ^ [(SUGSchemaSUGEngagementMetricReported *)self->_engagementMetricReported hash];
  unint64_t v12 = v11 ^ [(SUGSchemaSUGSuggestionsUIActivity *)self->_uiActivity hash];
  unint64_t v13 = v9 ^ v12 ^ [(SUGSchemaSUGTypingWindowEnded *)self->_typingWindowEnded hash];
  unint64_t v14 = [(SUGSchemaSUGSuggestionsGeneratedTier1 *)self->_sugGeneratedTier1 hash];
  return v13 ^ v14 ^ [(SUGSchemaSUGSuggestionsUIActivityTier1 *)self->_uiActivityTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_68;
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v8 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
  unint64_t v7 = [v4 suggestionsGenerated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v13 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    v15 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
    uint64_t v16 = [v4 suggestionsGenerated];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self engagementReported];
  unint64_t v7 = [v4 engagementReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v18 = [(SUGSchemaSUGClientEvent *)self engagementReported];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(SUGSchemaSUGClientEvent *)self engagementReported];
    v21 = [v4 engagementReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self requestContext];
  unint64_t v7 = [v4 requestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v23 = [(SUGSchemaSUGClientEvent *)self requestContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(SUGSchemaSUGClientEvent *)self requestContext];
    int v26 = [v4 requestContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
  unint64_t v7 = [v4 generationStepContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v28 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
    v31 = [v4 generationStepContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
  unint64_t v7 = [v4 resolutionStepContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v33 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
    v36 = [v4 resolutionStepContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
  unint64_t v7 = [v4 filteringStepContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v38 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
    objc_super v41 = [v4 filteringStepContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
  unint64_t v7 = [v4 rankingStepContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v43 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
    objc_super v46 = [v4 rankingStepContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
  unint64_t v7 = [v4 engagementMetricReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v48 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
    v51 = [v4 engagementMetricReported];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self uiActivity];
  unint64_t v7 = [v4 uiActivity];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v53 = [(SUGSchemaSUGClientEvent *)self uiActivity];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(SUGSchemaSUGClientEvent *)self uiActivity];
    v56 = [v4 uiActivity];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
  unint64_t v7 = [v4 typingWindowEnded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v58 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
    v61 = [v4 typingWindowEnded];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
  unint64_t v7 = [v4 sugGeneratedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_67;
  }
  uint64_t v63 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
    v66 = [v4 sugGeneratedTier1];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_68;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
  unint64_t v7 = [v4 uiActivityTier1];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v68 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
    if (!v68)
    {

LABEL_71:
      BOOL v73 = 1;
      goto LABEL_69;
    }
    v69 = (void *)v68;
    v70 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
    v71 = [v4 uiActivityTier1];
    char v72 = [v70 isEqual:v71];

    if (v72) {
      goto LABEL_71;
    }
  }
  else
  {
LABEL_67:
  }
LABEL_68:
  BOOL v73 = 0;
LABEL_69:

  return v73;
}

- (void)writeTo:(id)a3
{
  id v30 = a3;
  id v4 = [(SUGSchemaSUGClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SUGSchemaSUGClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];

  if (v6)
  {
    unint64_t v7 = [(SUGSchemaSUGClientEvent *)self suggestionsGenerated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SUGSchemaSUGClientEvent *)self engagementReported];

  if (v8)
  {
    unint64_t v9 = [(SUGSchemaSUGClientEvent *)self engagementReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(SUGSchemaSUGClientEvent *)self requestContext];

  if (v10)
  {
    unint64_t v11 = [(SUGSchemaSUGClientEvent *)self requestContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(SUGSchemaSUGClientEvent *)self generationStepContext];

  if (v12)
  {
    uint64_t v13 = [(SUGSchemaSUGClientEvent *)self generationStepContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];

  if (v14)
  {
    v15 = [(SUGSchemaSUGClientEvent *)self resolutionStepContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v16 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];

  if (v16)
  {
    int v17 = [(SUGSchemaSUGClientEvent *)self filteringStepContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];

  if (v18)
  {
    v19 = [(SUGSchemaSUGClientEvent *)self rankingStepContext];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];

  if (v20)
  {
    v21 = [(SUGSchemaSUGClientEvent *)self engagementMetricReported];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(SUGSchemaSUGClientEvent *)self uiActivity];

  if (v22)
  {
    uint64_t v23 = [(SUGSchemaSUGClientEvent *)self uiActivity];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];

  if (v24)
  {
    v25 = [(SUGSchemaSUGClientEvent *)self typingWindowEnded];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];

  if (v26)
  {
    int v27 = [(SUGSchemaSUGClientEvent *)self sugGeneratedTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];

  if (v28)
  {
    int v29 = [(SUGSchemaSUGClientEvent *)self uiActivityTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteUiActivityTier1
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uiActivityTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGSuggestionsUIActivityTier1)uiActivityTier1
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_uiActivityTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUiActivityTier1:(id)a3
{
  id v4 = (SUGSchemaSUGSuggestionsUIActivityTier1 *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  unint64_t v16 = 112;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = v4;
}

- (void)deleteSugGeneratedTier1
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_sugGeneratedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGSuggestionsGeneratedTier1)sugGeneratedTier1
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_sugGeneratedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSugGeneratedTier1:(id)a3
{
  id v4 = (SUGSchemaSUGSuggestionsGeneratedTier1 *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 111;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = v4;
}

- (void)deleteTypingWindowEnded
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_typingWindowEnded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGTypingWindowEnded)typingWindowEnded
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_typingWindowEnded;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTypingWindowEnded:(id)a3
{
  id v4 = (SUGSchemaSUGTypingWindowEnded *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 110;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = v4;
}

- (void)deleteUiActivity
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uiActivity = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGSuggestionsUIActivity)uiActivity
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_uiActivity;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUiActivity:(id)a3
{
  id v4 = (SUGSchemaSUGSuggestionsUIActivity *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 109;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  uiActivity = self->_uiActivity;
  self->_uiActivity = v4;
}

- (void)deleteEngagementMetricReported
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_engagementMetricReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGEngagementMetricReported)engagementMetricReported
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_engagementMetricReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEngagementMetricReported:(id)a3
{
  id v4 = (SUGSchemaSUGEngagementMetricReported *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 108;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = v4;
}

- (void)deleteRankingStepContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_rankingStepContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGRankingStepContext)rankingStepContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_rankingStepContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRankingStepContext:(id)a3
{
  id v4 = (SUGSchemaSUGRankingStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 107;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = v4;
}

- (void)deleteFilteringStepContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_filteringStepContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGFilteringStepContext)filteringStepContext
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_filteringStepContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFilteringStepContext:(id)a3
{
  id v4 = (SUGSchemaSUGFilteringStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 106;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = v4;
}

- (void)deleteResolutionStepContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resolutionStepContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGResolutionStepContext)resolutionStepContext
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_resolutionStepContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResolutionStepContext:(id)a3
{
  id v4 = (SUGSchemaSUGResolutionStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 105;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = v4;
}

- (void)deleteGenerationStepContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_generationStepContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGGenerationStepContext)generationStepContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_generationStepContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setGenerationStepContext:(id)a3
{
  id v4 = (SUGSchemaSUGGenerationStepContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 104;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = v4;
}

- (void)deleteRequestContext
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_requestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGRequestContext)requestContext
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_requestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestContext:(id)a3
{
  id v4 = (SUGSchemaSUGRequestContext *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 103;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  requestContext = self->_requestContext;
  self->_requestContext = v4;
}

- (void)deleteEngagementReported
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_engagementReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGEngagementReported)engagementReported
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_engagementReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEngagementReported:(id)a3
{
  id v4 = (SUGSchemaSUGEngagementReported *)a3;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 102;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  engagementReported = self->_engagementReported;
  self->_engagementReported = v4;
}

- (void)deleteSuggestionsGenerated
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_suggestionsGenerated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SUGSchemaSUGSuggestionsGenerated)suggestionsGenerated
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_suggestionsGenerated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSuggestionsGenerated:(id)a3
{
  id v4 = (SUGSchemaSUGSuggestionsGenerated *)a3;
  engagementReported = self->_engagementReported;
  self->_engagementReported = 0;

  requestContext = self->_requestContext;
  self->_requestContext = 0;

  generationStepContext = self->_generationStepContext;
  self->_generationStepContext = 0;

  resolutionStepContext = self->_resolutionStepContext;
  self->_resolutionStepContext = 0;

  filteringStepContext = self->_filteringStepContext;
  self->_filteringStepContext = 0;

  rankingStepContext = self->_rankingStepContext;
  self->_rankingStepContext = 0;

  engagementMetricReported = self->_engagementMetricReported;
  self->_engagementMetricReported = 0;

  uiActivity = self->_uiActivity;
  self->_uiActivity = 0;

  typingWindowEnded = self->_typingWindowEnded;
  self->_typingWindowEnded = 0;

  sugGeneratedTier1 = self->_sugGeneratedTier1;
  self->_sugGeneratedTier1 = 0;

  uiActivityTier1 = self->_uiActivityTier1;
  self->_uiActivityTier1 = 0;

  unint64_t v16 = 101;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichEvent_Type = v16;
  suggestionsGenerated = self->_suggestionsGenerated;
  self->_suggestionsGenerated = v4;
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
  unint64_t v2 = [(SUGSchemaSUGClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0xB) {
    return @"com.apple.aiml.siri.sug.SUGClientEvent";
  }
  else {
    return off_1E5EB9568[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 52;
}

@end