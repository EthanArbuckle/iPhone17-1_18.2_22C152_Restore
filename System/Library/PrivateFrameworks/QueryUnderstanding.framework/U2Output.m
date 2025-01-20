@interface U2Output
- (NSArray)argIds;
- (NSArray)argIdsForTokens;
- (NSArray)argScores;
- (NSArray)argScoresForTokens;
- (NSArray)tokenRanges;
- (NSArray)tokens;
- (NSNumber)confidenceScore;
- (NSNumber)intentId;
- (NSNumber)safetyScore;
- (unint64_t)embeddingsTime;
- (unint64_t)predictionTime;
- (void)setArgIdsForTokens:(id)a3;
- (void)setArgScoresForTokens:(id)a3;
- (void)setConfidenceScore:(id)a3;
- (void)setEmbeddingsTime:(unint64_t)a3;
- (void)setIntentId:(id)a3;
- (void)setPredictionTime:(unint64_t)a3;
- (void)setSafetyScore:(id)a3;
- (void)setTokenRanges:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation U2Output

- (NSArray)argIds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(U2Output *)self argIdsForTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectAtIndexedSubscript:0];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v3 copy];
  return (NSArray *)v9;
}

- (NSArray)argScores
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(U2Output *)self argScoresForTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) objectAtIndexedSubscript:0];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v3 copy];
  return (NSArray *)v9;
}

- (NSNumber)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(id)a3
{
}

- (NSNumber)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
}

- (NSNumber)safetyScore
{
  return self->_safetyScore;
}

- (void)setSafetyScore:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokenRanges
{
  return self->_tokenRanges;
}

- (void)setTokenRanges:(id)a3
{
}

- (NSArray)argIdsForTokens
{
  return self->_argIdsForTokens;
}

- (void)setArgIdsForTokens:(id)a3
{
}

- (NSArray)argScoresForTokens
{
  return self->_argScoresForTokens;
}

- (void)setArgScoresForTokens:(id)a3
{
}

- (unint64_t)predictionTime
{
  return self->_predictionTime;
}

- (void)setPredictionTime:(unint64_t)a3
{
  self->_predictionTime = a3;
}

- (unint64_t)embeddingsTime
{
  return self->_embeddingsTime;
}

- (void)setEmbeddingsTime:(unint64_t)a3
{
  self->_embeddingsTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argScoresForTokens, 0);
  objc_storeStrong((id *)&self->_argIdsForTokens, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_safetyScore, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);
}

@end