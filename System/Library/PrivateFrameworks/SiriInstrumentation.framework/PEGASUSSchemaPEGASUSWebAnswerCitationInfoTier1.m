@interface PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1
- (BOOL)hasSubText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)citationIndices;
- (NSData)jsonData;
- (NSString)subText;
- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)citationIndicesAtIndex:(unint64_t)a3;
- (unint64_t)citationIndicesCount;
- (unint64_t)hash;
- (void)addCitationIndices:(int)a3;
- (void)clearCitationIndices;
- (void)deleteSubText;
- (void)setCitationIndices:(id)a3;
- (void)setHasSubText:(BOOL)a3;
- (void)setSubText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self deleteSubText];
  }
  if ([v4 isConditionSet:4]) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self deleteSubText];
  }
  if ([v4 isConditionSet:5]) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self deleteSubText];
  }
  if ([v4 isConditionSet:6]) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self deleteSubText];
  }
  if ([v4 isConditionSet:7]) {
    [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self deleteSubText];
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
  objc_storeStrong((id *)&self->_citationIndices, 0);
  objc_storeStrong((id *)&self->_subText, 0);
}

- (void)setHasSubText:(BOOL)a3
{
  self->_hasSubText = a3;
}

- (void)setCitationIndices:(id)a3
{
}

- (NSArray)citationIndices
{
  return self->_citationIndices;
}

- (void)setSubText:(id)a3
{
}

- (NSString)subText
{
  return self->_subText;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"subText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)v5 setSubText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"citationIndices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 addCitationIndices:](v5, "addCitationIndices:", objc_msgSend(v14, "intValue", (void)v17));
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_citationIndices count])
  {
    id v4 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self citationIndices];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"citationIndices"];
  }
  if (self->_subText)
  {
    v6 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self subText];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"subText"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_subText hash];
  return [(NSArray *)self->_citationIndices hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self subText];
  v6 = [v4 subText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self subText];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self subText];
    uint64_t v10 = [v4 subText];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self citationIndices];
  v6 = [v4 citationIndices];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self citationIndices];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self citationIndices];
    v15 = [v4 citationIndices];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1 *)self subText];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_citationIndices;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "intValue", (void)v11);
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerCitationInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (int)citationIndicesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_citationIndices objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)citationIndicesCount
{
  return [(NSArray *)self->_citationIndices count];
}

- (void)addCitationIndices:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  citationIndices = self->_citationIndices;
  if (!citationIndices)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_citationIndices;
    self->_citationIndices = v6;

    citationIndices = self->_citationIndices;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)citationIndices addObject:v8];
}

- (void)clearCitationIndices
{
}

- (void)deleteSubText
{
}

- (BOOL)hasSubText
{
  return self->_subText != 0;
}

@end