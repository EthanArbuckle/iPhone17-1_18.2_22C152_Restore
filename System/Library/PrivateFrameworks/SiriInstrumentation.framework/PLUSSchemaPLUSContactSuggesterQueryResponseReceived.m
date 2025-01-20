@interface PLUSSchemaPLUSContactSuggesterQueryResponseReceived
- (BOOL)hasHasMatchingResults;
- (BOOL)hasMatchingResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggesterQueryResponseReceived)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggesterQueryResponseReceived)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)deleteHasMatchingResults;
- (void)setHasHasMatchingResults:(BOOL)a3;
- (void)setHasMatchingResults:(BOOL)a3;
- (void)setResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggesterQueryResponseReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggesterQueryResponseReceived;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self results];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self setResults:v7];
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
}

- (BOOL)hasMatchingResults
{
  return self->_hasMatchingResults;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (PLUSSchemaPLUSContactSuggesterQueryResponseReceived)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLUSSchemaPLUSContactSuggesterQueryResponseReceived;
  v5 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"results"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [PLUSSchemaPLUSContactSuggestion alloc];
              v14 = -[PLUSSchemaPLUSContactSuggestion initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)v5 addResults:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"hasMatchingResults", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggesterQueryResponseReceived setHasMatchingResults:](v5, "setHasMatchingResults:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggesterQueryResponseReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self dictionaryRepresentation];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(&self->_hasMatchingResults + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PLUSSchemaPLUSContactSuggesterQueryResponseReceived hasMatchingResults](self, "hasMatchingResults"));
    [v3 setObject:v4 forKeyedSubscript:@"hasMatchingResults"];
  }
  if ([(NSArray *)self->_results count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_results;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"results"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v14);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_results hash];
  if (*(&self->_hasMatchingResults + 1)) {
    uint64_t v4 = 2654435761 * self->_hasMatchingResults;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self results];
  v6 = [v4 results];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self results];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(PLUSSchemaPLUSContactSuggesterQueryResponseReceived *)self results];
    uint64_t v11 = [v4 results];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_hasMatchingResults + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_hasMatchingResults + 1))
  {
    int hasMatchingResults = self->_hasMatchingResults;
    if (hasMatchingResults != [v4 hasMatchingResults]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(&self->_hasMatchingResults + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggesterQueryResponseReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasMatchingResults
{
  *(&self->_hasMatchingResults + 1) &= ~1u;
}

- (void)setHasHasMatchingResults:(BOOL)a3
{
  *(&self->_hasMatchingResults + 1) = *(&self->_hasMatchingResults + 1) & 0xFE | a3;
}

- (BOOL)hasHasMatchingResults
{
  return *(&self->_hasMatchingResults + 1);
}

- (void)setHasMatchingResults:(BOOL)a3
{
  *(&self->_hasMatchingResults + 1) |= 1u;
  self->_int hasMatchingResults = a3;
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
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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

@end