@interface JRSchemaJRAnonymizedHistoryAndContextTuple
- (BOOL)hasContextSimilarityScore;
- (BOOL)hasUflScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithDictionary:(id)a3;
- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithJSON:(id)a3;
- (NSArray)candidateIds;
- (NSData)jsonData;
- (float)contextSimilarityScore;
- (float)uflScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)candidateIdsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)candidateIdsCount;
- (unint64_t)hash;
- (void)addCandidateIds:(id)a3;
- (void)clearCandidateIds;
- (void)deleteContextSimilarityScore;
- (void)deleteUflScore;
- (void)setCandidateIds:(id)a3;
- (void)setContextSimilarityScore:(float)a3;
- (void)setHasContextSimilarityScore:(BOOL)a3;
- (void)setHasUflScore:(BOOL)a3;
- (void)setUflScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRAnonymizedHistoryAndContextTuple

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)JRSchemaJRAnonymizedHistoryAndContextTuple;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self candidateIds];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self setCandidateIds:v7];
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

- (float)uflScore
{
  return self->_uflScore;
}

- (float)contextSimilarityScore
{
  return self->_contextSimilarityScore;
}

- (void)setCandidateIds:(id)a3
{
}

- (NSArray)candidateIds
{
  return self->_candidateIds;
}

- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)JRSchemaJRAnonymizedHistoryAndContextTuple;
  v5 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"candidateIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [SISchemaUUID alloc];
              v14 = -[SISchemaUUID initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(JRSchemaJRAnonymizedHistoryAndContextTuple *)v5 addCandidateIds:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"contextSimilarityScore", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[JRSchemaJRAnonymizedHistoryAndContextTuple setContextSimilarityScore:](v5, "setContextSimilarityScore:");
    }
    v16 = [v4 objectForKeyedSubscript:@"uflScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[JRSchemaJRAnonymizedHistoryAndContextTuple setUflScore:](v5, "setUflScore:");
    }
    v17 = v5;
  }
  return v5;
}

- (JRSchemaJRAnonymizedHistoryAndContextTuple)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_candidateIds count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_candidateIds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"candidateIds"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = NSNumber;
    [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self contextSimilarityScore];
    v14 = objc_msgSend(v13, "numberWithFloat:");
    [v3 setObject:v14 forKeyedSubscript:@"contextSimilarityScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v15 = NSNumber;
    [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self uflScore];
    v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"uflScore"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_candidateIds hash];
  char has = (char)self->_has;
  if (has)
  {
    float contextSimilarityScore = self->_contextSimilarityScore;
    double v7 = contextSimilarityScore;
    if (contextSimilarityScore < 0.0) {
      double v7 = -contextSimilarityScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    float uflScore = self->_uflScore;
    double v12 = uflScore;
    if (uflScore < 0.0) {
      double v12 = -uflScore;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  unint64_t v5 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self candidateIds];
  uint64_t v6 = [v4 candidateIds];
  double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self candidateIds];
    if (v8)
    {
      double v9 = (void *)v8;
      unint64_t v10 = [(JRSchemaJRAnonymizedHistoryAndContextTuple *)self candidateIds];
      uint64_t v11 = [v4 candidateIds];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    $7AC9EAEF2958A6A46935EA7E9D286166 has = self->_has;
    unsigned int v14 = v4[24];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        float contextSimilarityScore = self->_contextSimilarityScore;
        [v4 contextSimilarityScore];
        if (contextSimilarityScore != v16) {
          goto LABEL_15;
        }
        $7AC9EAEF2958A6A46935EA7E9D286166 has = self->_has;
        unsigned int v14 = v4[24];
      }
      int v17 = (*(unsigned int *)&has >> 1) & 1;
      if (v17 == ((v14 >> 1) & 1))
      {
        if (!v17 || (float uflScore = self->_uflScore, [v4 uflScore], uflScore == v19))
        {
          BOOL v20 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_candidateIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRAnonymizedHistoryAndContextTupleReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteUflScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUflScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUflScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUflScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float uflScore = a3;
}

- (void)deleteContextSimilarityScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasContextSimilarityScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContextSimilarityScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContextSimilarityScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float contextSimilarityScore = a3;
}

- (id)candidateIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidateIds objectAtIndexedSubscript:a3];
}

- (unint64_t)candidateIdsCount
{
  return [(NSArray *)self->_candidateIds count];
}

- (void)addCandidateIds:(id)a3
{
  id v4 = a3;
  candidateIds = self->_candidateIds;
  id v8 = v4;
  if (!candidateIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidateIds;
    self->_candidateIds = v6;

    id v4 = v8;
    candidateIds = self->_candidateIds;
  }
  [(NSArray *)candidateIds addObject:v4];
}

- (void)clearCandidateIds
{
}

@end