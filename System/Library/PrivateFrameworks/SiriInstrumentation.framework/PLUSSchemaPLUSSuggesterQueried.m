@interface PLUSSchemaPLUSSuggesterQueried
- (BOOL)hasMatchedResultsPopulated;
- (BOOL)hasOriginalRequestId;
- (BOOL)hasSuggestionDomainMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchedResultsPopulated;
- (BOOL)readFrom:(id)a3;
- (NSArray)matchedResults;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggesterQueried)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterQueried)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata;
- (SISchemaUUID)originalRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchedResultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)matchedResultsCount;
- (void)addMatchedResults:(id)a3;
- (void)clearMatchedResults;
- (void)deleteMatchedResultsPopulated;
- (void)deleteOriginalRequestId;
- (void)deleteSuggestionDomainMetadata;
- (void)setHasMatchedResultsPopulated:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setHasSuggestionDomainMetadata:(BOOL)a3;
- (void)setMatchedResults:(id)a3;
- (void)setMatchedResultsPopulated:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)setSuggestionDomainMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterQueried

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLUSSchemaPLUSSuggesterQueried;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggesterQueried *)self deleteSuggestionDomainMetadata];
  }
  v9 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggesterQueried *)self deleteOriginalRequestId];
  }
  v12 = [(PLUSSchemaPLUSSuggesterQueried *)self matchedResults];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(PLUSSchemaPLUSSuggesterQueried *)self setMatchedResults:v13];

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
  objc_storeStrong((id *)&self->_matchedResults, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
  objc_storeStrong((id *)&self->_suggestionDomainMetadata, 0);
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 3) = a3;
}

- (void)setHasSuggestionDomainMetadata:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 2) = a3;
}

- (BOOL)matchedResultsPopulated
{
  return self->_matchedResultsPopulated;
}

- (void)setMatchedResults:(id)a3
{
}

- (NSArray)matchedResults
{
  return self->_matchedResults;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (void)setSuggestionDomainMetadata:(id)a3
{
}

- (PLUSSchemaPLUSSuggestionDomainMetadata)suggestionDomainMetadata
{
  return self->_suggestionDomainMetadata;
}

- (PLUSSchemaPLUSSuggesterQueried)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PLUSSchemaPLUSSuggesterQueried;
  v5 = [(PLUSSchemaPLUSSuggesterQueried *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionDomainMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggestionDomainMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggesterQueried *)v5 setSuggestionDomainMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggesterQueried *)v5 setOriginalRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"matchedResults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = v8;
      v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[PLUSSchemaPLUSSuggestionMatchResult alloc] initWithDictionary:v16];
              [(PLUSSchemaPLUSSuggesterQueried *)v5 addMatchedResults:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      int v8 = v21;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"matchedResultsPopulated", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSSuggesterQueried setMatchedResultsPopulated:](v5, "setMatchedResultsPopulated:", [v18 BOOLValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterQueried)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterQueried *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterQueried *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_matchedResults count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_matchedResults;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"matchedResults"];
  }
  if (*(&self->_matchedResultsPopulated + 1))
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSSuggesterQueried matchedResultsPopulated](self, "matchedResultsPopulated"));
    [v3 setObject:v12 forKeyedSubscript:@"matchedResultsPopulated"];
  }
  if (self->_originalRequestId)
  {
    uint64_t v13 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      objc_super v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"originalRequestId"];
    }
  }
  if (self->_suggestionDomainMetadata)
  {
    uint64_t v16 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"suggestionDomainMetadata"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSSuggestionDomainMetadata *)self->_suggestionDomainMetadata hash];
  unint64_t v4 = [(SISchemaUUID *)self->_originalRequestId hash];
  uint64_t v5 = [(NSArray *)self->_matchedResults hash];
  if (*(&self->_matchedResultsPopulated + 1)) {
    uint64_t v6 = 2654435761 * self->_matchedResultsPopulated;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
  uint64_t v6 = [v4 suggestionDomainMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
    v10 = [v4 suggestionDomainMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
  uint64_t v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
    objc_super v15 = [v4 originalRequestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterQueried *)self matchedResults];
  uint64_t v6 = [v4 matchedResults];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(PLUSSchemaPLUSSuggesterQueried *)self matchedResults];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PLUSSchemaPLUSSuggesterQueried *)self matchedResults];
    long long v20 = [v4 matchedResults];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (*(&self->_matchedResultsPopulated + 1) == (v4[33] & 1))
  {
    if (!*(&self->_matchedResultsPopulated + 1)
      || (int matchedResultsPopulated = self->_matchedResultsPopulated,
          matchedResultsPopulated == [v4 matchedResultsPopulated]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];

  if (v5)
  {
    uint64_t v6 = [(PLUSSchemaPLUSSuggesterQueried *)self suggestionDomainMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];

  if (v7)
  {
    uint64_t v8 = [(PLUSSchemaPLUSSuggesterQueried *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_matchedResults;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*(&self->_matchedResultsPopulated + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterQueriedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMatchedResultsPopulated
{
  *(&self->_matchedResultsPopulated + 1) &= ~1u;
}

- (void)setHasMatchedResultsPopulated:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 1) = *(&self->_matchedResultsPopulated + 1) & 0xFE | a3;
}

- (BOOL)hasMatchedResultsPopulated
{
  return *(&self->_matchedResultsPopulated + 1);
}

- (void)setMatchedResultsPopulated:(BOOL)a3
{
  *(&self->_matchedResultsPopulated + 1) |= 1u;
  self->_int matchedResultsPopulated = a3;
}

- (id)matchedResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchedResults objectAtIndexedSubscript:a3];
}

- (unint64_t)matchedResultsCount
{
  return [(NSArray *)self->_matchedResults count];
}

- (void)addMatchedResults:(id)a3
{
  id v4 = a3;
  matchedResults = self->_matchedResults;
  id v8 = v4;
  if (!matchedResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedResults;
    self->_matchedResults = v6;

    id v4 = v8;
    matchedResults = self->_matchedResults;
  }
  [(NSArray *)matchedResults addObject:v4];
}

- (void)clearMatchedResults
{
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

- (void)deleteSuggestionDomainMetadata
{
}

- (BOOL)hasSuggestionDomainMetadata
{
  return self->_suggestionDomainMetadata != 0;
}

@end