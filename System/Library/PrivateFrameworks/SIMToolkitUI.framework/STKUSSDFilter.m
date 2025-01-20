@interface STKUSSDFilter
+ (NSMutableDictionary)cachedExpressions;
- (BOOL)shouldFilterString:(id)a3 coalescable:(BOOL *)a4;
- (NSArray)alwaysFilteredPatterns;
- (NSArray)sometimesFilteredPatterns;
- (STKUSSDFilter)initWithAlwaysFilteredPatterns:(id)a3 sometimesFilteredPatterns:(id)a4;
- (double)lastWarningTime;
- (id)_matchesInString:(id)a3 forPattern:(id)a4;
- (void)reset;
- (void)setLastWarningTime:(double)a3;
@end

@implementation STKUSSDFilter

+ (NSMutableDictionary)cachedExpressions
{
  if (cachedExpressions_onceToken != -1) {
    dispatch_once(&cachedExpressions_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)cachedExpressions___cachedExpressions;

  return (NSMutableDictionary *)v2;
}

uint64_t __34__STKUSSDFilter_cachedExpressions__block_invoke()
{
  cachedExpressions___cachedExpressions = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

- (STKUSSDFilter)initWithAlwaysFilteredPatterns:(id)a3 sometimesFilteredPatterns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STKUSSDFilter;
  v8 = [(STKUSSDFilter *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    alwaysFilteredPatterns = v8->_alwaysFilteredPatterns;
    v8->_alwaysFilteredPatterns = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    sometimesFilteredPatterns = v8->_sometimesFilteredPatterns;
    v8->_sometimesFilteredPatterns = (NSArray *)v11;
  }
  return v8;
}

- (BOOL)shouldFilterString:(id)a3 coalescable:(BOOL *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 length])
  {
LABEL_23:
    BOOL v24 = 0;
    BOOL v25 = 1;
    if (!a4) {
      goto LABEL_25;
    }
LABEL_24:
    *a4 = v24;
    goto LABEL_25;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = [(STKUSSDFilter *)self alwaysFilteredPatterns];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = [(STKUSSDFilter *)self _matchesInString:v6 forPattern:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      uint64_t v13 = [v12 count];

      if (v13)
      {

        goto LABEL_23;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_10:

  double Current = CFAbsoluteTimeGetCurrent();
  [(STKUSSDFilter *)self lastWarningTime];
  double v16 = Current - v15;
  long long v33 = 0u;
  long long v34 = 0u;
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = -v16;
  }
  long long v35 = 0uLL;
  long long v36 = 0uLL;
  v18 = [(STKUSSDFilter *)self sometimesFilteredPatterns];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v34;
LABEL_15:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v34 != v20) {
        objc_enumerationMutation(v18);
      }
      v22 = [(STKUSSDFilter *)self _matchesInString:v6 forPattern:*(void *)(*((void *)&v33 + 1) + 8 * v21)];
      if ([v22 count]) {
        break;
      }

      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v19) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
    if (v17 < 300.0)
    {
LABEL_35:
      [(STKUSSDFilter *)self setLastWarningTime:Current];
      int v23 = 0;
      LODWORD(v19) = 1;
    }
    else
    {
      if ([v22 count] == 2)
      {
        v27 = [v22 objectAtIndexedSubscript:0];
        v28 = [v22 objectAtIndexedSubscript:1];
        [v27 floatValue];
        float v30 = v29;
        [v28 floatValue];
        BOOL v32 = v30 > 4.99 || v31 < 2.0;
        if (v32 || v31 < 5.01 && v17 > 180.0)
        {

          goto LABEL_35;
        }
      }
      LODWORD(v19) = 0;
      int v23 = 1;
    }

    goto LABEL_39;
  }
LABEL_21:
  int v23 = 0;
LABEL_39:

  BOOL v24 = v19 != 0;
  BOOL v25 = v23 != 0;
  if (a4) {
    goto LABEL_24;
  }
LABEL_25:

  return v25;
}

- (void)reset
{
  [(STKUSSDFilter *)self setLastWarningTime:2.22507386e-308];
  id v2 = [(id)objc_opt_class() cachedExpressions];
  [v2 removeAllObjects];
}

- (id)_matchesInString:(id)a3 forPattern:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() cachedExpressions];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v23 = 0;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v6 options:0 error:&v23];
    id v9 = v23;
    uint64_t v10 = v9;
    if (!v8 || v9)
    {
      uint64_t v11 = STKUSSDLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = v6;
        __int16 v26 = 2114;
        v27 = v10;
        _os_log_impl(&dword_221DC0000, v11, OS_LOG_TYPE_ERROR, "Invalid USSD filter regular expression pattern: /%{public}@/ %{public}@", buf, 0x16u);
      }
    }
    v12 = [(id)objc_opt_class() cachedExpressions];
    [v12 setObject:v8 forKeyedSubscript:v6];
  }
  uint64_t v13 = [v5 length];
  objc_super v14 = objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, v13);
  uint64_t v15 = [v14 numberOfRanges];
  double v16 = [MEMORY[0x263EFF980] arrayWithCapacity:v15];
  if (![v14 range] && v13 == v17 && v15 >= 2)
  {
    for (uint64_t i = 1; i != v15; ++i)
    {
      uint64_t v19 = [v14 rangeAtIndex:i];
      uint64_t v21 = objc_msgSend(v5, "substringWithRange:", v19, v20);
      [v16 addObject:v21];
    }
  }

  return v16;
}

- (NSArray)alwaysFilteredPatterns
{
  return self->_alwaysFilteredPatterns;
}

- (NSArray)sometimesFilteredPatterns
{
  return self->_sometimesFilteredPatterns;
}

- (double)lastWarningTime
{
  return self->_lastWarningTime;
}

- (void)setLastWarningTime:(double)a3
{
  self->_lastWarningTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sometimesFilteredPatterns, 0);

  objc_storeStrong((id *)&self->_alwaysFilteredPatterns, 0);
}

@end