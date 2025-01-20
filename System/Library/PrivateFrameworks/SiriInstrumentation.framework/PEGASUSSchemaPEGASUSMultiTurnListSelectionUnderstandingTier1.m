@interface PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1
- (BOOL)hasFollowupQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)recommendations;
- (NSArray)results;
- (NSData)jsonData;
- (NSString)followupQuery;
- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)recommendationsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recommendationsCount;
- (unint64_t)resultsCount;
- (void)addRecommendations:(int)a3;
- (void)addResults:(id)a3;
- (void)clearRecommendations;
- (void)clearResults;
- (void)deleteFollowupQuery;
- (void)setFollowupQuery:(id)a3;
- (void)setHasFollowupQuery:(BOOL)a3;
- (void)setRecommendations:(id)a3;
- (void)setResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteFollowupQuery];
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteResults];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteFollowupQuery];
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteResults];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteFollowupQuery];
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteResults];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteFollowupQuery];
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteResults];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteFollowupQuery];
    [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self deleteResults];
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
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_followupQuery, 0);
}

- (void)setHasFollowupQuery:(BOOL)a3
{
  self->_hasFollowupQuery = a3;
}

- (void)setRecommendations:(id)a3
{
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setFollowupQuery:(id)a3
{
}

- (NSString)followupQuery
{
  return self->_followupQuery;
}

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1;
  v5 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"followupQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)v5 setFollowupQuery:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"results"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = (void *)[v14 copy];
              [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)v5 addResults:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v11);
      }
    }
    v16 = [v4 objectForKeyedSubscript:@"recommendations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 addRecommendations:](v5, "addRecommendations:", [v22 intValue]);
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v19);
      }

      v6 = v25;
    }
    v23 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self dictionaryRepresentation];
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
  if (self->_followupQuery)
  {
    id v4 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self followupQuery];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"followupQuery"];
  }
  if ([(NSArray *)self->_recommendations count])
  {
    v6 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self recommendations];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"recommendations"];
  }
  if (self->_results)
  {
    v8 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self results];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"results"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_followupQuery hash];
  uint64_t v4 = [(NSArray *)self->_results hash] ^ v3;
  return v4 ^ [(NSArray *)self->_recommendations hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self followupQuery];
  v6 = [v4 followupQuery];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self followupQuery];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self followupQuery];
    uint64_t v10 = [v4 followupQuery];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self results];
  v6 = [v4 results];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self results];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self results];
    v15 = [v4 results];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self recommendations];
  v6 = [v4 recommendations];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self recommendations];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self recommendations];
    uint64_t v20 = [v4 recommendations];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *)self followupQuery];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_results;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_recommendations;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15), "intValue", (void)v16);
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1ReadFrom(self, (uint64_t)a3);
}

- (int)recommendationsAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_recommendations objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)recommendationsCount
{
  return [(NSArray *)self->_recommendations count];
}

- (void)addRecommendations:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  recommendations = self->_recommendations;
  if (!recommendations)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recommendations;
    self->_recommendations = v6;

    recommendations = self->_recommendations;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)recommendations addObject:v8];
}

- (void)clearRecommendations
{
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultsCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResults
{
}

- (void)deleteFollowupQuery
{
}

- (BOOL)hasFollowupQuery
{
  return self->_followupQuery != 0;
}

@end