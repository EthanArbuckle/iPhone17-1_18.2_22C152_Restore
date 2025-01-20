@interface PLUSSchemaPLUSMediaSuggestionEvaluation
- (BOOL)hasInferredMediaEntityAdamId;
- (BOOL)hasPommesSelectedMediaEntityAdamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)entitySummaries;
- (NSArray)pommesAlternativeEntityIds;
- (NSData)jsonData;
- (NSString)inferredMediaEntityAdamId;
- (NSString)pommesSelectedMediaEntityAdamId;
- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)entitySummariesAtIndex:(unint64_t)a3;
- (id)pommesAlternativeEntityIdsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)entitySummariesCount;
- (unint64_t)hash;
- (unint64_t)pommesAlternativeEntityIdsCount;
- (void)addEntitySummaries:(id)a3;
- (void)addPommesAlternativeEntityIds:(id)a3;
- (void)clearEntitySummaries;
- (void)clearPommesAlternativeEntityIds;
- (void)deleteInferredMediaEntityAdamId;
- (void)deletePommesSelectedMediaEntityAdamId;
- (void)setEntitySummaries:(id)a3;
- (void)setHasInferredMediaEntityAdamId:(BOOL)a3;
- (void)setHasPommesSelectedMediaEntityAdamId:(BOOL)a3;
- (void)setInferredMediaEntityAdamId:(id)a3;
- (void)setPommesAlternativeEntityIds:(id)a3;
- (void)setPommesSelectedMediaEntityAdamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaSuggestionEvaluation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSMediaSuggestionEvaluation;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesAlternativeEntityIds];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:4])
  {
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesAlternativeEntityIds];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:5])
  {
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesAlternativeEntityIds];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:6])
  {
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesAlternativeEntityIds];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deleteInferredMediaEntityAdamId];
  }
  if ([v4 isConditionSet:7])
  {
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesAlternativeEntityIds];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deletePommesSelectedMediaEntityAdamId];
    [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self deleteInferredMediaEntityAdamId];
  }
  v6 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self entitySummaries];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self setEntitySummaries:v7];

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
  objc_storeStrong((id *)&self->_inferredMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_pommesSelectedMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_pommesAlternativeEntityIds, 0);
  objc_storeStrong((id *)&self->_entitySummaries, 0);
}

- (void)setHasInferredMediaEntityAdamId:(BOOL)a3
{
  self->_hasInferredMediaEntityAdamId = a3;
}

- (void)setHasPommesSelectedMediaEntityAdamId:(BOOL)a3
{
  self->_hasPommesSelectedMediaEntityAdamId = a3;
}

- (void)setInferredMediaEntityAdamId:(id)a3
{
}

- (NSString)inferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId;
}

- (void)setPommesSelectedMediaEntityAdamId:(id)a3
{
}

- (NSString)pommesSelectedMediaEntityAdamId
{
  return self->_pommesSelectedMediaEntityAdamId;
}

- (void)setPommesAlternativeEntityIds:(id)a3
{
}

- (NSArray)pommesAlternativeEntityIds
{
  return self->_pommesAlternativeEntityIds;
}

- (void)setEntitySummaries:(id)a3
{
}

- (NSArray)entitySummaries
{
  return self->_entitySummaries;
}

- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PLUSSchemaPLUSMediaSuggestionEvaluation;
  v5 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entitySummaries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[PLUSSchemaPLUSMediaCandidateEntity alloc] initWithDictionary:v12];
              [(PLUSSchemaPLUSMediaSuggestionEvaluation *)v5 addEntitySummaries:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"pommesAlternativeEntityIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v28);
              [(PLUSSchemaPLUSMediaSuggestionEvaluation *)v5 addPommesAlternativeEntityIds:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"pommesSelectedMediaEntityAdamId", (void)v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(PLUSSchemaPLUSMediaSuggestionEvaluation *)v5 setPommesSelectedMediaEntityAdamId:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"inferredMediaEntityAdamId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(PLUSSchemaPLUSMediaSuggestionEvaluation *)v5 setInferredMediaEntityAdamId:v25];
    }
    v26 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_entitySummaries count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_entitySummaries;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"entitySummaries"];
  }
  if (self->_inferredMediaEntityAdamId)
  {
    uint64_t v12 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self inferredMediaEntityAdamId];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"inferredMediaEntityAdamId"];
  }
  if (self->_pommesAlternativeEntityIds)
  {
    v14 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesAlternativeEntityIds];
    id v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"pommesAlternativeEntityIds"];
  }
  if (self->_pommesSelectedMediaEntityAdamId)
  {
    uint64_t v16 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesSelectedMediaEntityAdamId];
    uint64_t v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"pommesSelectedMediaEntityAdamId"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_entitySummaries hash];
  uint64_t v4 = [(NSArray *)self->_pommesAlternativeEntityIds hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_pommesSelectedMediaEntityAdamId hash];
  return v4 ^ v5 ^ [(NSString *)self->_inferredMediaEntityAdamId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self entitySummaries];
  uint64_t v6 = [v4 entitySummaries];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self entitySummaries];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self entitySummaries];
    uint64_t v10 = [v4 entitySummaries];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesAlternativeEntityIds];
  uint64_t v6 = [v4 pommesAlternativeEntityIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesAlternativeEntityIds];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesAlternativeEntityIds];
    id v15 = [v4 pommesAlternativeEntityIds];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesSelectedMediaEntityAdamId];
  uint64_t v6 = [v4 pommesSelectedMediaEntityAdamId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesSelectedMediaEntityAdamId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    long long v19 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesSelectedMediaEntityAdamId];
    long long v20 = [v4 pommesSelectedMediaEntityAdamId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self inferredMediaEntityAdamId];
  uint64_t v6 = [v4 inferredMediaEntityAdamId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self inferredMediaEntityAdamId];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    uint64_t v24 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self inferredMediaEntityAdamId];
    v25 = [v4 inferredMediaEntityAdamId];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  NSUInteger v5 = self->_entitySummaries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_pommesAlternativeEntityIds;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  id v15 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self pommesSelectedMediaEntityAdamId];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(PLUSSchemaPLUSMediaSuggestionEvaluation *)self inferredMediaEntityAdamId];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaSuggestionEvaluationReadFrom(self, (uint64_t)a3);
}

- (void)deleteInferredMediaEntityAdamId
{
}

- (BOOL)hasInferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId != 0;
}

- (void)deletePommesSelectedMediaEntityAdamId
{
}

- (BOOL)hasPommesSelectedMediaEntityAdamId
{
  return self->_pommesSelectedMediaEntityAdamId != 0;
}

- (id)pommesAlternativeEntityIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pommesAlternativeEntityIds objectAtIndexedSubscript:a3];
}

- (unint64_t)pommesAlternativeEntityIdsCount
{
  return [(NSArray *)self->_pommesAlternativeEntityIds count];
}

- (void)addPommesAlternativeEntityIds:(id)a3
{
  id v4 = a3;
  pommesAlternativeEntityIds = self->_pommesAlternativeEntityIds;
  id v8 = v4;
  if (!pommesAlternativeEntityIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pommesAlternativeEntityIds;
    self->_pommesAlternativeEntityIds = v6;

    id v4 = v8;
    pommesAlternativeEntityIds = self->_pommesAlternativeEntityIds;
  }
  [(NSArray *)pommesAlternativeEntityIds addObject:v4];
}

- (void)clearPommesAlternativeEntityIds
{
}

- (id)entitySummariesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entitySummaries objectAtIndexedSubscript:a3];
}

- (unint64_t)entitySummariesCount
{
  return [(NSArray *)self->_entitySummaries count];
}

- (void)addEntitySummaries:(id)a3
{
  id v4 = a3;
  entitySummaries = self->_entitySummaries;
  id v8 = v4;
  if (!entitySummaries)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entitySummaries;
    self->_entitySummaries = v6;

    id v4 = v8;
    entitySummaries = self->_entitySummaries;
  }
  [(NSArray *)entitySummaries addObject:v4];
}

- (void)clearEntitySummaries
{
}

@end