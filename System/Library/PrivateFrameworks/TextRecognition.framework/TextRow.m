@interface TextRow
- (NSArray)features;
- (NSArray)tokens;
- (NSMutableArray)mutableTokens;
- (NSString)string;
- (TextRow)init;
- (double)cachedScore;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)tokenCount;
- (void)addToken:(id)a3;
- (void)setCachedScore:(double)a3;
- (void)setMutableTokens:(id)a3;
@end

@implementation TextRow

- (TextRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)TextRow;
  v2 = [(TextRow *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    mutableTokens = v2->_mutableTokens;
    v2->_mutableTokens = (NSMutableArray *)v3;

    v2->_cachedScore = 0.0;
  }
  return v2;
}

- (void)addToken:(id)a3
{
  mutableTokens = self->_mutableTokens;
  if (mutableTokens) {
    [(NSMutableArray *)mutableTokens addObject:a3];
  }
}

- (NSArray)tokens
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_mutableTokens];
}

- (unint64_t)tokenCount
{
  return [(NSMutableArray *)self->_mutableTokens count];
}

- (NSString)string
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_mutableTokens;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "string", (void)v12);
        [v3 appendString:v10];

        if (v7 + i < [(TextRow *)self tokenCount] - 1) {
          [v3 appendString:@" "];
        }
      }
      v7 += v6;
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (double)score
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double cachedScore = self->_cachedScore;
  if (cachedScore == 0.0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_mutableTokens;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      double cachedScore = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "score", (void)v11);
          double cachedScore = cachedScore + v9;
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    else
    {
      double cachedScore = 0.0;
    }

    self->_double cachedScore = cachedScore;
  }
  return cachedScore;
}

- (NSArray)features
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_mutableTokens;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "features", (void)v12);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(TextRow);
  uint64_t v5 = (void *)[(NSMutableArray *)self->_mutableTokens mutableCopy];
  [(TextRow *)v4 setMutableTokens:v5];

  return v4;
}

- (NSMutableArray)mutableTokens
{
  return self->_mutableTokens;
}

- (void)setMutableTokens:(id)a3
{
}

- (double)cachedScore
{
  return self->_cachedScore;
}

- (void)setCachedScore:(double)a3
{
  self->_double cachedScore = a3;
}

- (void).cxx_destruct
{
}

@end