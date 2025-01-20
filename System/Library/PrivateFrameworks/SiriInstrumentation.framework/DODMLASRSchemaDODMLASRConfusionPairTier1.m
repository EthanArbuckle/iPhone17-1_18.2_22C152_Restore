@interface DODMLASRSchemaDODMLASRConfusionPairTier1
- (BOOL)hasLeftContextToken;
- (BOOL)hasRightContextToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRConfusionPairTier1)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRConfusionPairTier1)initWithJSON:(id)a3;
- (NSArray)correctedTokens;
- (NSArray)recognizedTokens;
- (NSData)jsonData;
- (NSString)leftContextToken;
- (NSString)rightContextToken;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)correctedTokensAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)recognizedTokensAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)correctedTokensCount;
- (unint64_t)hash;
- (unint64_t)recognizedTokensCount;
- (void)addCorrectedTokens:(id)a3;
- (void)addRecognizedTokens:(id)a3;
- (void)clearCorrectedTokens;
- (void)clearRecognizedTokens;
- (void)deleteLeftContextToken;
- (void)deleteRightContextToken;
- (void)setCorrectedTokens:(id)a3;
- (void)setHasLeftContextToken:(BOOL)a3;
- (void)setHasRightContextToken:(BOOL)a3;
- (void)setLeftContextToken:(id)a3;
- (void)setRecognizedTokens:(id)a3;
- (void)setRightContextToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRConfusionPairTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPairTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRecognizedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteCorrectedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteLeftContextToken];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRightContextToken];
  }
  if ([v4 isConditionSet:4])
  {
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRecognizedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteCorrectedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteLeftContextToken];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRightContextToken];
  }
  if ([v4 isConditionSet:5])
  {
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRecognizedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteCorrectedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteLeftContextToken];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRightContextToken];
  }
  if ([v4 isConditionSet:6])
  {
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRecognizedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteCorrectedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteLeftContextToken];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRightContextToken];
  }
  if ([v4 isConditionSet:7])
  {
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRecognizedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteCorrectedTokens];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteLeftContextToken];
    [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self deleteRightContextToken];
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
  objc_storeStrong((id *)&self->_rightContextToken, 0);
  objc_storeStrong((id *)&self->_leftContextToken, 0);
  objc_storeStrong((id *)&self->_correctedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
}

- (void)setHasRightContextToken:(BOOL)a3
{
  self->_hasRightContextToken = a3;
}

- (void)setHasLeftContextToken:(BOOL)a3
{
  self->_hasLeftContextToken = a3;
}

- (void)setRightContextToken:(id)a3
{
}

- (NSString)rightContextToken
{
  return self->_rightContextToken;
}

- (void)setLeftContextToken:(id)a3
{
}

- (NSString)leftContextToken
{
  return self->_leftContextToken;
}

- (void)setCorrectedTokens:(id)a3
{
}

- (NSArray)correctedTokens
{
  return self->_correctedTokens;
}

- (void)setRecognizedTokens:(id)a3
{
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (DODMLASRSchemaDODMLASRConfusionPairTier1)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DODMLASRSchemaDODMLASRConfusionPairTier1;
  v5 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognizedTokens"];
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
            v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)v5 addRecognizedTokens:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"correctedTokens"];
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
              [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)v5 addCorrectedTokens:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"leftContextToken", (void)v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)v5 setLeftContextToken:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"rightContextToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)v5 setRightContextToken:v25];
    }
    v26 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRConfusionPairTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self dictionaryRepresentation];
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
  if (self->_correctedTokens)
  {
    id v4 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self correctedTokens];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctedTokens"];
  }
  if (self->_leftContextToken)
  {
    v6 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self leftContextToken];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"leftContextToken"];
  }
  if (self->_recognizedTokens)
  {
    uint64_t v8 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self recognizedTokens];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"recognizedTokens"];
  }
  if (self->_rightContextToken)
  {
    uint64_t v10 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self rightContextToken];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"rightContextToken"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_recognizedTokens hash];
  uint64_t v4 = [(NSArray *)self->_correctedTokens hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_leftContextToken hash];
  return v4 ^ v5 ^ [(NSString *)self->_rightContextToken hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self recognizedTokens];
  v6 = [v4 recognizedTokens];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self recognizedTokens];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self recognizedTokens];
    uint64_t v10 = [v4 recognizedTokens];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self correctedTokens];
  v6 = [v4 correctedTokens];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self correctedTokens];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self correctedTokens];
    id v15 = [v4 correctedTokens];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self leftContextToken];
  v6 = [v4 leftContextToken];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self leftContextToken];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self leftContextToken];
    v20 = [v4 leftContextToken];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self rightContextToken];
  v6 = [v4 rightContextToken];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self rightContextToken];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self rightContextToken];
    v25 = [v4 rightContextToken];
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
  NSUInteger v5 = self->_recognizedTokens;
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
        PBDataWriterWriteStringField();
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
  uint64_t v10 = self->_correctedTokens;
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

  id v15 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self leftContextToken];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(DODMLASRSchemaDODMLASRConfusionPairTier1 *)self rightContextToken];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRConfusionPairTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteRightContextToken
{
}

- (BOOL)hasRightContextToken
{
  return self->_rightContextToken != 0;
}

- (void)deleteLeftContextToken
{
}

- (BOOL)hasLeftContextToken
{
  return self->_leftContextToken != 0;
}

- (id)correctedTokensAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_correctedTokens objectAtIndexedSubscript:a3];
}

- (unint64_t)correctedTokensCount
{
  return [(NSArray *)self->_correctedTokens count];
}

- (void)addCorrectedTokens:(id)a3
{
  id v4 = a3;
  correctedTokens = self->_correctedTokens;
  id v8 = v4;
  if (!correctedTokens)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_correctedTokens;
    self->_correctedTokens = v6;

    id v4 = v8;
    correctedTokens = self->_correctedTokens;
  }
  [(NSArray *)correctedTokens addObject:v4];
}

- (void)clearCorrectedTokens
{
}

- (id)recognizedTokensAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recognizedTokens objectAtIndexedSubscript:a3];
}

- (unint64_t)recognizedTokensCount
{
  return [(NSArray *)self->_recognizedTokens count];
}

- (void)addRecognizedTokens:(id)a3
{
  id v4 = a3;
  recognizedTokens = self->_recognizedTokens;
  id v8 = v4;
  if (!recognizedTokens)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recognizedTokens;
    self->_recognizedTokens = v6;

    id v4 = v8;
    recognizedTokens = self->_recognizedTokens;
  }
  [(NSArray *)recognizedTokens addObject:v4];
}

- (void)clearRecognizedTokens
{
}

@end