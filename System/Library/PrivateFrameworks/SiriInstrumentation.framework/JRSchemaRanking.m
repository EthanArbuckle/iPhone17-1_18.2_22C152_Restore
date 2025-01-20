@interface JRSchemaRanking
- (BOOL)hasRankingCandidateMatrix;
- (BOOL)hasRankingScoreMatrix;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaRanking)initWithDictionary:(id)a3;
- (JRSchemaRanking)initWithJSON:(id)a3;
- (JRSchemaRankingCandidateMatrix)rankingCandidateMatrix;
- (JRSchemaRankingScoreMatrix)rankingScoreMatrix;
- (NSArray)rankingMatrices;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)rankingMatricesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)rankingMatricesCount;
- (void)addRankingMatrices:(id)a3;
- (void)clearRankingMatrices;
- (void)deleteRankingCandidateMatrix;
- (void)deleteRankingScoreMatrix;
- (void)setHasRankingCandidateMatrix:(BOOL)a3;
- (void)setHasRankingScoreMatrix:(BOOL)a3;
- (void)setRankingCandidateMatrix:(id)a3;
- (void)setRankingMatrices:(id)a3;
- (void)setRankingScoreMatrix:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaRanking

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)JRSchemaRanking;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(JRSchemaRanking *)self rankingMatrices];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(JRSchemaRanking *)self setRankingMatrices:v7];

  v8 = [(JRSchemaRanking *)self rankingScoreMatrix];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(JRSchemaRanking *)self deleteRankingScoreMatrix];
  }
  v11 = [(JRSchemaRanking *)self rankingCandidateMatrix];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(JRSchemaRanking *)self deleteRankingCandidateMatrix];
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
  objc_storeStrong((id *)&self->_rankingCandidateMatrix, 0);
  objc_storeStrong((id *)&self->_rankingScoreMatrix, 0);
  objc_storeStrong((id *)&self->_rankingMatrices, 0);
}

- (void)setHasRankingCandidateMatrix:(BOOL)a3
{
  self->_hasRankingCandidateMatrix = a3;
}

- (void)setHasRankingScoreMatrix:(BOOL)a3
{
  self->_hasRankingScoreMatrix = a3;
}

- (void)setRankingCandidateMatrix:(id)a3
{
}

- (JRSchemaRankingCandidateMatrix)rankingCandidateMatrix
{
  return self->_rankingCandidateMatrix;
}

- (void)setRankingScoreMatrix:(id)a3
{
}

- (JRSchemaRankingScoreMatrix)rankingScoreMatrix
{
  return self->_rankingScoreMatrix;
}

- (void)setRankingMatrices:(id)a3
{
}

- (NSArray)rankingMatrices
{
  return self->_rankingMatrices;
}

- (JRSchemaRanking)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)JRSchemaRanking;
  v5 = [(JRSchemaRanking *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rankingMatrices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [JRSchemaRankingMatrix alloc];
              v14 = -[JRSchemaRankingMatrix initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
              [(JRSchemaRanking *)v5 addRankingMatrices:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    objc_super v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"rankingScoreMatrix", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[JRSchemaRankingScoreMatrix alloc] initWithDictionary:v15];
      [(JRSchemaRanking *)v5 setRankingScoreMatrix:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"rankingCandidateMatrix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[JRSchemaRankingCandidateMatrix alloc] initWithDictionary:v17];
      [(JRSchemaRanking *)v5 setRankingCandidateMatrix:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (JRSchemaRanking)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaRanking *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaRanking *)self dictionaryRepresentation];
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
  if (self->_rankingCandidateMatrix)
  {
    id v4 = [(JRSchemaRanking *)self rankingCandidateMatrix];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"rankingCandidateMatrix"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"rankingCandidateMatrix"];
    }
  }
  if ([(NSArray *)self->_rankingMatrices count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = self->_rankingMatrices;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"rankingMatrices"];
  }
  if (self->_rankingScoreMatrix)
  {
    objc_super v15 = [(JRSchemaRanking *)self rankingScoreMatrix];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"rankingScoreMatrix"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"rankingScoreMatrix"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_rankingMatrices hash];
  unint64_t v4 = [(JRSchemaRankingScoreMatrix *)self->_rankingScoreMatrix hash] ^ v3;
  return v4 ^ [(JRSchemaRankingCandidateMatrix *)self->_rankingCandidateMatrix hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(JRSchemaRanking *)self rankingMatrices];
  v6 = [v4 rankingMatrices];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(JRSchemaRanking *)self rankingMatrices];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(JRSchemaRanking *)self rankingMatrices];
    uint64_t v10 = [v4 rankingMatrices];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(JRSchemaRanking *)self rankingScoreMatrix];
  v6 = [v4 rankingScoreMatrix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(JRSchemaRanking *)self rankingScoreMatrix];
  if (v12)
  {
    int v13 = (void *)v12;
    v14 = [(JRSchemaRanking *)self rankingScoreMatrix];
    objc_super v15 = [v4 rankingScoreMatrix];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(JRSchemaRanking *)self rankingCandidateMatrix];
  v6 = [v4 rankingCandidateMatrix];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(JRSchemaRanking *)self rankingCandidateMatrix];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(JRSchemaRanking *)self rankingCandidateMatrix];
    long long v20 = [v4 rankingCandidateMatrix];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_rankingMatrices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(JRSchemaRanking *)self rankingScoreMatrix];

  if (v10)
  {
    int v11 = [(JRSchemaRanking *)self rankingScoreMatrix];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(JRSchemaRanking *)self rankingCandidateMatrix];

  if (v12)
  {
    int v13 = [(JRSchemaRanking *)self rankingCandidateMatrix];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaRankingReadFrom(self, (uint64_t)a3);
}

- (void)deleteRankingCandidateMatrix
{
}

- (BOOL)hasRankingCandidateMatrix
{
  return self->_rankingCandidateMatrix != 0;
}

- (void)deleteRankingScoreMatrix
{
}

- (BOOL)hasRankingScoreMatrix
{
  return self->_rankingScoreMatrix != 0;
}

- (id)rankingMatricesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_rankingMatrices objectAtIndexedSubscript:a3];
}

- (unint64_t)rankingMatricesCount
{
  return [(NSArray *)self->_rankingMatrices count];
}

- (void)addRankingMatrices:(id)a3
{
  id v4 = a3;
  rankingMatrices = self->_rankingMatrices;
  id v8 = v4;
  if (!rankingMatrices)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_rankingMatrices;
    self->_rankingMatrices = v6;

    id v4 = v8;
    rankingMatrices = self->_rankingMatrices;
  }
  [(NSArray *)rankingMatrices addObject:v4];
}

- (void)clearRankingMatrices
{
}

@end