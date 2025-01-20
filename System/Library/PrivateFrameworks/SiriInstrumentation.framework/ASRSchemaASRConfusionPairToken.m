@interface ASRSchemaASRConfusionPairToken
- (ASRSchemaASRConfusionPairToken)initWithDictionary:(id)a3;
- (ASRSchemaASRConfusionPairToken)initWithJSON:(id)a3;
- (BOOL)hasRecognizedTokensStartIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)correctedTokens;
- (NSArray)recognizedTokens;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)correctedTokensAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)recognizedTokensAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)recognizedTokensStartIndex;
- (unint64_t)correctedTokensCount;
- (unint64_t)hash;
- (unint64_t)recognizedTokensCount;
- (void)addCorrectedTokens:(id)a3;
- (void)addRecognizedTokens:(id)a3;
- (void)clearCorrectedTokens;
- (void)clearRecognizedTokens;
- (void)deleteRecognizedTokensStartIndex;
- (void)setCorrectedTokens:(id)a3;
- (void)setHasRecognizedTokensStartIndex:(BOOL)a3;
- (void)setRecognizedTokens:(id)a3;
- (void)setRecognizedTokensStartIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRConfusionPairToken

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASRSchemaASRConfusionPairToken;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRConfusionPairToken *)self deleteRecognizedTokens];
    [(ASRSchemaASRConfusionPairToken *)self deleteCorrectedTokens];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRConfusionPairToken *)self deleteRecognizedTokens];
    [(ASRSchemaASRConfusionPairToken *)self deleteCorrectedTokens];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRConfusionPairToken *)self deleteRecognizedTokens];
    [(ASRSchemaASRConfusionPairToken *)self deleteCorrectedTokens];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRConfusionPairToken *)self deleteRecognizedTokens];
    [(ASRSchemaASRConfusionPairToken *)self deleteCorrectedTokens];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRConfusionPairToken *)self deleteRecognizedTokens];
    [(ASRSchemaASRConfusionPairToken *)self deleteCorrectedTokens];
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
  objc_storeStrong((id *)&self->_correctedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
}

- (int)recognizedTokensStartIndex
{
  return self->_recognizedTokensStartIndex;
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

- (ASRSchemaASRConfusionPairToken)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ASRSchemaASRConfusionPairToken;
  v5 = [(ASRSchemaASRConfusionPairToken *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"recognizedTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(ASRSchemaASRConfusionPairToken *)v5 addRecognizedTokens:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"correctedTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v25);
              [(ASRSchemaASRConfusionPairToken *)v5 addCorrectedTokens:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"recognizedTokensStartIndex", (void)v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRConfusionPairToken setRecognizedTokensStartIndex:](v5, "setRecognizedTokensStartIndex:", [v22 intValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (ASRSchemaASRConfusionPairToken)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRConfusionPairToken *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRConfusionPairToken *)self dictionaryRepresentation];
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
    id v4 = [(ASRSchemaASRConfusionPairToken *)self correctedTokens];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctedTokens"];
  }
  if (self->_recognizedTokens)
  {
    v6 = [(ASRSchemaASRConfusionPairToken *)self recognizedTokens];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"recognizedTokens"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRConfusionPairToken recognizedTokensStartIndex](self, "recognizedTokensStartIndex"));
    [v3 setObject:v8 forKeyedSubscript:@"recognizedTokensStartIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_recognizedTokens hash];
  uint64_t v4 = [(NSArray *)self->_correctedTokens hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_recognizedTokensStartIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(ASRSchemaASRConfusionPairToken *)self recognizedTokens];
  v6 = [v4 recognizedTokens];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ASRSchemaASRConfusionPairToken *)self recognizedTokens];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRConfusionPairToken *)self recognizedTokens];
    uint64_t v10 = [v4 recognizedTokens];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ASRSchemaASRConfusionPairToken *)self correctedTokens];
  v6 = [v4 correctedTokens];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(ASRSchemaASRConfusionPairToken *)self correctedTokens];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRConfusionPairToken *)self correctedTokens];
    id v15 = [v4 correctedTokens];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int recognizedTokensStartIndex = self->_recognizedTokensStartIndex,
          recognizedTokensStartIndex == [v4 recognizedTokensStartIndex]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_recognizedTokens;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_correctedTokens;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRConfusionPairTokenReadFrom(self, (uint64_t)a3);
}

- (void)deleteRecognizedTokensStartIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRecognizedTokensStartIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecognizedTokensStartIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRecognizedTokensStartIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int recognizedTokensStartIndex = a3;
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