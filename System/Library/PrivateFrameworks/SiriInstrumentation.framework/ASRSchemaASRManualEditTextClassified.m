@interface ASRSchemaASRManualEditTextClassified
- (ASRSchemaASRManualEditTextClassified)initWithDictionary:(id)a3;
- (ASRSchemaASRManualEditTextClassified)initWithJSON:(id)a3;
- (BOOL)hasFullCorrectedText;
- (BOOL)hasOriginalAsrId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)manualEdits;
- (NSData)jsonData;
- (NSString)fullCorrectedText;
- (SISchemaUUID)originalAsrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)manualEditsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)manualEditsCount;
- (void)addManualEdits:(id)a3;
- (void)clearManualEdits;
- (void)deleteFullCorrectedText;
- (void)deleteOriginalAsrId;
- (void)setFullCorrectedText:(id)a3;
- (void)setHasFullCorrectedText:(BOOL)a3;
- (void)setHasOriginalAsrId:(BOOL)a3;
- (void)setManualEdits:(id)a3;
- (void)setOriginalAsrId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRManualEditTextClassified

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRManualEditTextClassified;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRManualEditTextClassified *)self deleteManualEdits];
    [(ASRSchemaASRManualEditTextClassified *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRManualEditTextClassified *)self deleteManualEdits];
    [(ASRSchemaASRManualEditTextClassified *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRManualEditTextClassified *)self deleteManualEdits];
    [(ASRSchemaASRManualEditTextClassified *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRManualEditTextClassified *)self deleteManualEdits];
    [(ASRSchemaASRManualEditTextClassified *)self deleteFullCorrectedText];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRManualEditTextClassified *)self deleteManualEdits];
    [(ASRSchemaASRManualEditTextClassified *)self deleteFullCorrectedText];
  }
  v6 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRManualEditTextClassified *)self deleteOriginalAsrId];
  }
  v9 = [(ASRSchemaASRManualEditTextClassified *)self manualEdits];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ASRSchemaASRManualEditTextClassified *)self setManualEdits:v10];

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
  objc_storeStrong((id *)&self->_fullCorrectedText, 0);
  objc_storeStrong((id *)&self->_manualEdits, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

- (void)setHasFullCorrectedText:(BOOL)a3
{
  self->_hasFullCorrectedText = a3;
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  self->_hasOriginalAsrId = a3;
}

- (void)setFullCorrectedText:(id)a3
{
}

- (NSString)fullCorrectedText
{
  return self->_fullCorrectedText;
}

- (void)setManualEdits:(id)a3
{
}

- (NSArray)manualEdits
{
  return self->_manualEdits;
}

- (void)setOriginalAsrId:(id)a3
{
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (ASRSchemaASRManualEditTextClassified)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASRSchemaASRManualEditTextClassified;
  v5 = [(ASRSchemaASRManualEditTextClassified *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalAsrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRManualEditTextClassified *)v5 setOriginalAsrId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"manualEdits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[ASRSchemaASRConfusionPairToken alloc] initWithDictionary:v14];
              [(ASRSchemaASRManualEditTextClassified *)v5 addManualEdits:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v11);
      }

      v6 = v20;
    }
    v16 = [v4 objectForKeyedSubscript:@"fullCorrectedText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(ASRSchemaASRManualEditTextClassified *)v5 setFullCorrectedText:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (ASRSchemaASRManualEditTextClassified)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRManualEditTextClassified *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRManualEditTextClassified *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_fullCorrectedText)
  {
    id v4 = [(ASRSchemaASRManualEditTextClassified *)self fullCorrectedText];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"fullCorrectedText"];
  }
  if ([(NSArray *)self->_manualEdits count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_manualEdits;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"manualEdits"];
  }
  if (self->_originalAsrId)
  {
    uint64_t v14 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"originalAsrId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"originalAsrId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalAsrId hash];
  uint64_t v4 = [(NSArray *)self->_manualEdits hash] ^ v3;
  return v4 ^ [(NSString *)self->_fullCorrectedText hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
  v6 = [v4 originalAsrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
    uint64_t v10 = [v4 originalAsrId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRManualEditTextClassified *)self manualEdits];
  v6 = [v4 manualEdits];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ASRSchemaASRManualEditTextClassified *)self manualEdits];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ASRSchemaASRManualEditTextClassified *)self manualEdits];
    v15 = [v4 manualEdits];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRManualEditTextClassified *)self fullCorrectedText];
  v6 = [v4 fullCorrectedText];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ASRSchemaASRManualEditTextClassified *)self fullCorrectedText];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(ASRSchemaASRManualEditTextClassified *)self fullCorrectedText];
    long long v20 = [v4 fullCorrectedText];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];

  if (v5)
  {
    v6 = [(ASRSchemaASRManualEditTextClassified *)self originalAsrId];
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_manualEdits;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(ASRSchemaASRManualEditTextClassified *)self fullCorrectedText];

  if (v12) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRManualEditTextClassifiedReadFrom(self, (uint64_t)a3);
}

- (void)deleteFullCorrectedText
{
}

- (BOOL)hasFullCorrectedText
{
  return self->_fullCorrectedText != 0;
}

- (id)manualEditsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_manualEdits objectAtIndexedSubscript:a3];
}

- (unint64_t)manualEditsCount
{
  return [(NSArray *)self->_manualEdits count];
}

- (void)addManualEdits:(id)a3
{
  id v4 = a3;
  manualEdits = self->_manualEdits;
  id v8 = v4;
  if (!manualEdits)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_manualEdits;
    self->_manualEdits = v6;

    id v4 = v8;
    manualEdits = self->_manualEdits;
  }
  [(NSArray *)manualEdits addObject:v4];
}

- (void)clearManualEdits
{
}

- (void)deleteOriginalAsrId
{
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

@end