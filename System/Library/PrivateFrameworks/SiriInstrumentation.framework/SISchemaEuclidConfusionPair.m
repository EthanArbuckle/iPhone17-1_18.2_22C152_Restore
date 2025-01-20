@interface SISchemaEuclidConfusionPair
- (BOOL)hasCorrectedToken;
- (BOOL)hasRecognizedToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)suggestedTokens;
- (NSData)jsonData;
- (NSString)correctedToken;
- (NSString)recognizedToken;
- (SISchemaEuclidConfusionPair)initWithDictionary:(id)a3;
- (SISchemaEuclidConfusionPair)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suggestedTokensAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)suggestedTokensCount;
- (void)addSuggestedTokens:(id)a3;
- (void)clearSuggestedTokens;
- (void)deleteCorrectedToken;
- (void)deleteRecognizedToken;
- (void)setCorrectedToken:(id)a3;
- (void)setHasCorrectedToken:(BOOL)a3;
- (void)setHasRecognizedToken:(BOOL)a3;
- (void)setRecognizedToken:(id)a3;
- (void)setSuggestedTokens:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaEuclidConfusionPair

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedToken, 0);
  objc_storeStrong((id *)&self->_suggestedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedToken, 0);
}

- (void)setHasCorrectedToken:(BOOL)a3
{
  self->_hasCorrectedToken = a3;
}

- (void)setHasRecognizedToken:(BOOL)a3
{
  self->_hasRecognizedToken = a3;
}

- (void)setCorrectedToken:(id)a3
{
}

- (NSString)correctedToken
{
  return self->_correctedToken;
}

- (void)setSuggestedTokens:(id)a3
{
}

- (NSArray)suggestedTokens
{
  return self->_suggestedTokens;
}

- (void)setRecognizedToken:(id)a3
{
}

- (NSString)recognizedToken
{
  return self->_recognizedToken;
}

- (SISchemaEuclidConfusionPair)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaEuclidConfusionPair;
  v5 = [(SISchemaEuclidConfusionPair *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognizedToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaEuclidConfusionPair *)v5 setRecognizedToken:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"suggestedTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = objc_msgSend(v14, "copy", (void)v20);
              [(SISchemaEuclidConfusionPair *)v5 addSuggestedTokens:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"correctedToken", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(SISchemaEuclidConfusionPair *)v5 setCorrectedToken:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (SISchemaEuclidConfusionPair)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaEuclidConfusionPair *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaEuclidConfusionPair *)self dictionaryRepresentation];
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
  if (self->_correctedToken)
  {
    id v4 = [(SISchemaEuclidConfusionPair *)self correctedToken];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctedToken"];
  }
  if (self->_recognizedToken)
  {
    v6 = [(SISchemaEuclidConfusionPair *)self recognizedToken];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"recognizedToken"];
  }
  if (self->_suggestedTokens)
  {
    v8 = [(SISchemaEuclidConfusionPair *)self suggestedTokens];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"suggestedTokens"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recognizedToken hash];
  uint64_t v4 = [(NSArray *)self->_suggestedTokens hash] ^ v3;
  return v4 ^ [(NSString *)self->_correctedToken hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(SISchemaEuclidConfusionPair *)self recognizedToken];
  v6 = [v4 recognizedToken];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SISchemaEuclidConfusionPair *)self recognizedToken];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(SISchemaEuclidConfusionPair *)self recognizedToken];
    uint64_t v10 = [v4 recognizedToken];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaEuclidConfusionPair *)self suggestedTokens];
  v6 = [v4 suggestedTokens];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SISchemaEuclidConfusionPair *)self suggestedTokens];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(SISchemaEuclidConfusionPair *)self suggestedTokens];
    v15 = [v4 suggestedTokens];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SISchemaEuclidConfusionPair *)self correctedToken];
  v6 = [v4 correctedToken];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(SISchemaEuclidConfusionPair *)self correctedToken];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(SISchemaEuclidConfusionPair *)self correctedToken];
    long long v20 = [v4 correctedToken];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SISchemaEuclidConfusionPair *)self recognizedToken];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_suggestedTokens;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  int v11 = [(SISchemaEuclidConfusionPair *)self correctedToken];

  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEuclidConfusionPairReadFrom(self, (uint64_t)a3);
}

- (void)deleteCorrectedToken
{
}

- (BOOL)hasCorrectedToken
{
  return self->_correctedToken != 0;
}

- (id)suggestedTokensAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_suggestedTokens objectAtIndexedSubscript:a3];
}

- (unint64_t)suggestedTokensCount
{
  return [(NSArray *)self->_suggestedTokens count];
}

- (void)addSuggestedTokens:(id)a3
{
  id v4 = a3;
  suggestedTokens = self->_suggestedTokens;
  id v8 = v4;
  if (!suggestedTokens)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_suggestedTokens;
    self->_suggestedTokens = v6;

    id v4 = v8;
    suggestedTokens = self->_suggestedTokens;
  }
  [(NSArray *)suggestedTokens addObject:v4];
}

- (void)clearSuggestedTokens
{
}

- (void)deleteRecognizedToken
{
}

- (BOOL)hasRecognizedToken
{
  return self->_recognizedToken != 0;
}

@end