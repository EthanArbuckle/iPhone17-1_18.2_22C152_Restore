@interface NUGroupPattern
- (BOOL)isEqualToGroupPattern:(id)a3;
- (BOOL)isEqualToPattern:(id)a3;
- (BOOL)isFixedOrder;
- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5;
- (NSArray)group;
- (NUGroupPattern)init;
- (NUGroupPattern)initWithGroup:(id)a3;
- (id)optimizedPattern;
- (id)shortestMatch;
- (id)stringRepresentation;
- (id)tokens;
@end

@implementation NUGroupPattern

- (void).cxx_destruct
{
}

- (NSArray)group
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  v11 = a5;
  id v7 = a3;
  v8 = (void *)[(NSArray *)self->_group mutableCopy];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  while (1)
  {
    uint64_t v9 = objc_msgSend(v8, "count", v11);
    if (!v9) {
      break;
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__NUGroupPattern_match_location_count___block_invoke;
    v12[3] = &unk_1E5D94318;
    id v13 = v7;
    v14 = &v17;
    v15 = &v21;
    v16 = a4;
    [v8 enumerateObjectsUsingBlock:v12];
    if (v18[3] == 0x7FFFFFFFFFFFFFFFLL)
    {

      _Block_object_dispose(&v17, 8);
      break;
    }
    objc_msgSend(v8, "removeObjectAtIndex:");

    _Block_object_dispose(&v17, 8);
  }
  unint64_t *v11 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v9 == 0;
}

uint64_t __39__NUGroupPattern_match_location_count___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = 0;
  uint64_t result = [a2 match:a1[4] location:a1[7] count:&v8];
  if (result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    if (v8)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) += v8;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isEqualToGroupPattern:(id)a3
{
  id v4 = a3;
  v5 = [(NUGroupPattern *)self group];
  v6 = [v4 group];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NUGroupPattern *)self isEqualToGroupPattern:v4];

  return v5;
}

- (id)stringRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_group, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_group;
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
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) stringRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  v11 = [v3 componentsJoinedByString:@", "];
  v12 = [v10 stringWithFormat:@"(%@)", v11];

  return v12;
}

- (id)optimizedPattern
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_group, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_group;
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "optimizedPattern", (void)v13);
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
      v10 = [v3 objectAtIndexedSubscript:0];
    }
    else
    {
      v10 = [[NUGroupPattern alloc] initWithGroup:v3];
    }
  }
  else
  {
    v10 = objc_alloc_init(NUEmptyPattern);
  }
  v11 = v10;

  return v11;
}

- (id)shortestMatch
{
  if ([(NSArray *)self->_group count])
  {
    if ([(NSArray *)self->_group count] == 1)
    {
      v3 = [(NSArray *)self->_group objectAtIndexedSubscript:0];
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
  if (![(NSArray *)self->_group count]) {
    return 1;
  }
  if ([(NSArray *)self->_group count] != 1) {
    return 0;
  }
  v3 = [(NSArray *)self->_group objectAtIndexedSubscript:0];
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
  char v4 = self->_group;
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
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tokens", (void)v11);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NUGroupPattern)initWithGroup:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = NUAssertLogger_4520();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "group != nil");
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
        uint64_t v20 = [v18 callStackSymbols];
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
    _NUAssertFailHandler((uint64_t)"-[NUGroupPattern initWithGroup:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 445, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"group != nil");
  }
  uint64_t v5 = v4;
  v26.receiver = self;
  v26.super_class = (Class)NUGroupPattern;
  uint64_t v6 = [(NUGroupPattern *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    group = v6->_group;
    v6->_group = (NSArray *)v7;
  }
  return v6;
}

- (NUGroupPattern)init
{
  return [(NUGroupPattern *)self initWithGroup:MEMORY[0x1E4F1CBF0]];
}

@end