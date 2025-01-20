@interface PEGASUSSchemaPEGASUSVideoExecutionTier1
- (BOOL)hasVideoTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)resultEntityIds;
- (NSData)jsonData;
- (NSString)videoTitle;
- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)resultEntityIdsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)resultEntityIdsCount;
- (void)addResultEntityIds:(id)a3;
- (void)clearResultEntityIds;
- (void)deleteVideoTitle;
- (void)setHasVideoTitle:(BOOL)a3;
- (void)setResultEntityIds:(id)a3;
- (void)setVideoTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSVideoExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteResultEntityIds];
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteVideoTitle];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteResultEntityIds];
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteVideoTitle];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteResultEntityIds];
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteVideoTitle];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteResultEntityIds];
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteVideoTitle];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteResultEntityIds];
    [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self deleteVideoTitle];
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
  objc_storeStrong((id *)&self->_videoTitle, 0);
  objc_storeStrong((id *)&self->_resultEntityIds, 0);
}

- (void)setHasVideoTitle:(BOOL)a3
{
  self->_hasVideoTitle = a3;
}

- (void)setVideoTitle:(id)a3
{
}

- (NSString)videoTitle
{
  return self->_videoTitle;
}

- (void)setResultEntityIds:(id)a3
{
}

- (NSArray)resultEntityIds
{
  return self->_resultEntityIds;
}

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PEGASUSSchemaPEGASUSVideoExecutionTier1;
  v5 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"resultEntityIds"];
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
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v18);
              [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)v5 addResultEntityIds:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"videoTitle", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)v5 setVideoTitle:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self dictionaryRepresentation];
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
  if (self->_resultEntityIds)
  {
    id v4 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self resultEntityIds];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"resultEntityIds"];
  }
  if (self->_videoTitle)
  {
    v6 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self videoTitle];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"videoTitle"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_resultEntityIds hash];
  return [(NSString *)self->_videoTitle hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self resultEntityIds];
  v6 = [v4 resultEntityIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self resultEntityIds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self resultEntityIds];
    uint64_t v10 = [v4 resultEntityIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self videoTitle];
  v6 = [v4 videoTitle];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self videoTitle];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self videoTitle];
    v15 = [v4 videoTitle];
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
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_resultEntityIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self videoTitle];

  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSVideoExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteVideoTitle
{
}

- (BOOL)hasVideoTitle
{
  return self->_videoTitle != 0;
}

- (id)resultEntityIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_resultEntityIds objectAtIndexedSubscript:a3];
}

- (unint64_t)resultEntityIdsCount
{
  return [(NSArray *)self->_resultEntityIds count];
}

- (void)addResultEntityIds:(id)a3
{
  id v4 = a3;
  resultEntityIds = self->_resultEntityIds;
  id v8 = v4;
  if (!resultEntityIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_resultEntityIds;
    self->_resultEntityIds = v6;

    id v4 = v8;
    resultEntityIds = self->_resultEntityIds;
  }
  [(NSArray *)resultEntityIds addObject:v4];
}

- (void)clearResultEntityIds
{
}

@end