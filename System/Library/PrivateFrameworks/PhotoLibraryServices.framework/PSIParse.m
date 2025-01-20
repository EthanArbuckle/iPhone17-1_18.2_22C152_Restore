@interface PSIParse
- (BOOL)isImplicitlyTokenizedParse;
- (NSArray)datedTokens;
- (PSIDateFilter)dateFilter;
- (PSIParse)initWithToken:(id)a3;
- (PSIParse)initWithTokens:(id)a3 fromString:(id)a4;
- (id)description;
- (id)descriptionWithToken:(id)a3;
- (id)parseByReplacingTokenAtIndex:(unint64_t)a3 withToken:(id)a4;
- (id)parseByReplacingTokensInRange:(_NSRange)a3 withTokens:(id)a4;
- (id)tokenAtIndex:(unint64_t)a3;
- (unint64_t)numberOfTokens;
- (void)enumerateTokensUsingBlock:(id)a3;
- (void)setDateFilter:(id)a3;
@end

@implementation PSIParse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFilter, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

- (void)setDateFilter:(id)a3
{
}

- (PSIDateFilter)dateFilter
{
  return self->_dateFilter;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  NSUInteger v4 = [(NSArray *)self->_tokens count];
  if (self->_dateFilter) {
    v5 = @"with";
  }
  else {
    v5 = @"without";
  }
  v6 = [v3 stringWithFormat:@"%d tokens %@ date filter\n", v4, v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = self->_tokens;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [(PSIParse *)self descriptionWithToken:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v6 appendFormat:@"\t%@\n", v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  dateFilter = self->_dateFilter;
  if (dateFilter)
  {
    v14 = [(PSIDateFilter *)dateFilter displayString];
    [v6 appendFormat:@"\tDate: %@\n", v14];
  }
  return v6;
}

- (BOOL)isImplicitlyTokenizedParse
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_tokens;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "belongsToSearchText", (void)v8);
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
    LOBYTE(v3) = v4 > 1;
  }

  return v3;
}

- (id)descriptionWithToken:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = (void *)v4;
  v6 = NSString;
  if (v4)
  {
    v7 = [NSString stringWithFormat:@"Identifier: %@", v4];
  }
  else
  {
    long long v8 = [v3 resolvedText];
    long long v9 = [v3 groupMatchingText];
    long long v10 = [v3 wordEmbeddingMatch];
    if (v10)
    {
      long long v11 = NSString;
      v12 = [v3 wordEmbeddingMatch];
      uint64_t v13 = [v12 extendedWord];
      v14 = [v11 stringWithFormat:@" (%@)", v13];
      v7 = [v6 stringWithFormat:@"Text: %@, matching %@%@", v8, v9, v14];
    }
    else
    {
      v7 = [v6 stringWithFormat:@"Text: %@, matching %@%@", v8, v9, &stru_1EEB2EB80];
    }
  }
  return v7;
}

- (id)parseByReplacingTokensInRange:(_NSRange)a3 withTokens:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  tokens = self->_tokens;
  id v8 = a4;
  long long v9 = (void *)[(NSArray *)tokens mutableCopy];
  objc_msgSend(v9, "replaceObjectsInRange:withObjectsFromArray:", location, length, v8);

  long long v10 = [[PSIParse alloc] initWithTokens:v9 fromString:self->_string];
  [(PSIParse *)v10 setDateFilter:self->_dateFilter];

  return v10;
}

- (id)parseByReplacingTokenAtIndex:(unint64_t)a3 withToken:(id)a4
{
  tokens = self->_tokens;
  id v7 = a4;
  id v8 = (void *)[(NSArray *)tokens mutableCopy];
  [v8 replaceObjectAtIndex:a3 withObject:v7];

  long long v9 = [[PSIParse alloc] initWithTokens:v8 fromString:self->_string];
  [(PSIParse *)v9 setDateFilter:self->_dateFilter];

  return v9;
}

- (NSArray)datedTokens
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "matchType", (void)v11) == 3) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)tokenAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tokens objectAtIndexedSubscript:a3];
}

- (void)enumerateTokensUsingBlock:(id)a3
{
}

- (unint64_t)numberOfTokens
{
  return [(NSArray *)self->_tokens count];
}

- (PSIParse)initWithTokens:(id)a3 fromString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSIParse;
  id v8 = [(PSIParse *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_string, a4);
  }

  return v8;
}

- (PSIParse)initWithToken:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)PSIParse;
    uint64_t v5 = [(PSIParse *)&v11 init];
    if (v5)
    {
      v12[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      tokens = v5->_tokens;
      v5->_tokens = (NSArray *)v6;

      uint64_t v8 = [v4 text];
      string = v5->_string;
      v5->_string = (NSString *)v8;
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

@end