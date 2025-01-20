@interface NUChoicePattern
- (BOOL)isEqualToChoicePattern:(id)a3;
- (BOOL)isEqualToPattern:(id)a3;
- (BOOL)isFixedOrder;
- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5;
- (NSArray)choices;
- (NUChoicePattern)init;
- (NUChoicePattern)initWithChoices:(id)a3;
- (id)optimizedPattern;
- (id)shortestMatch;
- (id)stringRepresentation;
- (id)tokens;
@end

@implementation NUChoicePattern

- (void).cxx_destruct
{
}

- (NSArray)choices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([(NSArray *)self->_choices count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = self->_choices;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "match:location:count:", v8, a4, a5, (void)v16))
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_12:
  }
  else
  {
    *a5 = 0;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isEqualToChoicePattern:(id)a3
{
  id v4 = a3;
  v5 = [(NUChoicePattern *)self choices];
  v6 = [v4 choices];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NUChoicePattern *)self isEqualToChoicePattern:v4];

  return v5;
}

- (id)stringRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_choices, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_choices;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) stringRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v10 = NSString;
  uint64_t v11 = [v3 componentsJoinedByString:@", "];
  uint64_t v12 = [v10 stringWithFormat:@"{%@}", v11];

  return v12;
}

- (id)optimizedPattern
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_choices, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_choices;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "optimizedPattern", (void)v13);
        if (([v9 isEmpty] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v10 = [v3 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v10 = [[NUChoicePattern alloc] initWithChoices:v3];
    }
  }
  else
  {
    uint64_t v10 = objc_alloc_init(NUEmptyPattern);
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)shortestMatch
{
  if ([(NSArray *)self->_choices count])
  {
    if ([(NSArray *)self->_choices count] == 1)
    {
      v3 = [(NSArray *)self->_choices objectAtIndexedSubscript:0];
      id v4 = [v3 shortestMatch];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)isFixedOrder
{
  if (![(NSArray *)self->_choices count]) {
    return 1;
  }
  if ([(NSArray *)self->_choices count] != 1) {
    return 0;
  }
  v3 = [(NSArray *)self->_choices objectAtIndexedSubscript:0];
  char v4 = [v3 isFixedOrder];

  return v4;
}

- (id)tokens
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = self->_choices;
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
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tokens", (void)v11);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NUChoicePattern)initWithChoices:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = NUAssertLogger_4520();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "choices != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v13 = NUAssertLogger_4520();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        long long v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUChoicePattern initWithChoices:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 608, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"choices != nil");
  }
  uint64_t v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUChoicePattern;
  uint64_t v6 = [(NUChoicePattern *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    choices = v6->_choices;
    v6->_choices = (NSArray *)v7;
  }
  return v6;
}

- (NUChoicePattern)init
{
  return [(NUChoicePattern *)self initWithChoices:MEMORY[0x1E4F1CBF0]];
}

@end