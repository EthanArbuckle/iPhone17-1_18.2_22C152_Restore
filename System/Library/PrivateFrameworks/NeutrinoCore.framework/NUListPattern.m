@interface NUListPattern
- (BOOL)isEqualToListPattern:(id)a3;
- (BOOL)isEqualToPattern:(id)a3;
- (BOOL)isFixedOrder;
- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5;
- (NSArray)list;
- (NUListPattern)init;
- (NUListPattern)initWithList:(id)a3;
- (id)optimizedPattern;
- (id)shortestMatch;
- (id)stringRepresentation;
- (id)tokens;
@end

@implementation NUListPattern

- (void).cxx_destruct
{
}

- (NSArray)list
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = self->_list;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v18 = 0;
        if (![v15 match:v8 location:a4 count:&v18])
        {
          BOOL v16 = 0;
          goto LABEL_13;
        }
        v12 += v18;
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  BOOL v16 = 1;
LABEL_13:

  *a5 = v12;
  return v16;
}

- (BOOL)isEqualToListPattern:(id)a3
{
  id v4 = a3;
  v5 = [(NUListPattern *)self list];
  v6 = [v4 list];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUListPattern *)self isEqualToListPattern:v4];

  return v5;
}

- (id)stringRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_list, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_list;
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
  unint64_t v12 = [v10 stringWithFormat:@"[%@]", v11];

  return v12;
}

- (id)optimizedPattern
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_list, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_list;
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
      uint64_t v10 = [[NUListPattern alloc] initWithList:v3];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_list;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "shortestMatch", (void)v13);
        if (!v9)
        {

          uint64_t v11 = 0;
          goto LABEL_11;
        }
        uint64_t v10 = (void *)v9;
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = (void *)[v3 copy];
LABEL_11:

  return v11;
}

- (BOOL)isFixedOrder
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_list;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isFixedOrder", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)tokens
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_list;
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
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tokens", (void)v11);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NUListPattern)initWithList:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    long long v10 = NUAssertLogger_4520();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "list != nil");
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
        long long v20 = [v18 callStackSymbols];
        long long v21 = [v20 componentsJoinedByString:@"\n"];
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
    _NUAssertFailHandler((uint64_t)"-[NUListPattern initWithList:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 302, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"list != nil");
  }
  uint64_t v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUListPattern;
  uint64_t v6 = [(NUListPattern *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    list = v6->_list;
    v6->_list = (NSArray *)v7;
  }
  return v6;
}

- (NUListPattern)init
{
  return [(NUListPattern *)self initWithList:MEMORY[0x1E4F1CBF0]];
}

@end