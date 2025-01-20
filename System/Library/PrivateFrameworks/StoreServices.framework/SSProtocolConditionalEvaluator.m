@interface SSProtocolConditionalEvaluator
+ (id)defaultConditionalContext;
+ (void)setDefaultConditionalContext:(id)a3;
- (BOOL)_checkConditions:(id)a3 withOperator:(id)a4;
- (SSProtocolConditionalEvaluator)init;
- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3;
- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3 conditionalContext:(id)a4;
- (id)_arrayByEvaluatingChildrenOfArray:(id)a3 withForcedValue:(int64_t)a4;
- (id)_dictionaryByEvaluatingChildrenOfDictionary:(id)a3 withForcedValue:(int64_t)a4;
- (id)_dictionaryByEvaluatingDictionary:(id)a3 withForcedValue:(int64_t)a4;
- (id)_dictionaryByEvaluatingWithForcedValue:(int64_t)a3;
- (id)dictionaryByEvaluatingConditions;
- (id)dictionaryByRemovingConditions;
- (int)_logicalOperatorForString:(id)a3;
- (void)dealloc;
@end

@implementation SSProtocolConditionalEvaluator

- (SSProtocolConditionalEvaluator)init
{
  return [(SSProtocolConditionalEvaluator *)self initWithDictionary:0 conditionalContext:0];
}

- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3
{
  return [(SSProtocolConditionalEvaluator *)self initWithDictionary:a3 conditionalContext:0];
}

- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3 conditionalContext:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSProtocolConditionalEvaluator;
  v6 = [(SSProtocolConditionalEvaluator *)&v8 init];
  if (v6)
  {
    v6->_context = (SSProtocolConditionalContext *)[a4 copy];
    v6->_dictionary = (NSDictionary *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSProtocolConditionalEvaluator;
  [(SSProtocolConditionalEvaluator *)&v3 dealloc];
}

+ (id)defaultConditionalContext
{
  pthread_mutex_lock(&__DefaultContextLock);
  id v2 = (id)__DefaultContext;
  pthread_mutex_unlock(&__DefaultContextLock);
  return v2;
}

+ (void)setDefaultConditionalContext:(id)a3
{
  pthread_mutex_lock(&__DefaultContextLock);
  if ((id)__DefaultContext != a3)
  {

    __DefaultContext = [a3 copy];
  }
  pthread_mutex_unlock(&__DefaultContextLock);
}

- (id)dictionaryByEvaluatingConditions
{
  return [(SSProtocolConditionalEvaluator *)self _dictionaryByEvaluatingWithForcedValue:-1];
}

- (id)dictionaryByRemovingConditions
{
  return [(SSProtocolConditionalEvaluator *)self _dictionaryByEvaluatingWithForcedValue:1];
}

- (id)_arrayByEvaluatingChildrenOfArray:(id)a3 withForcedValue:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        id v12 = *(id *)(*((void *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [(SSProtocolConditionalEvaluator *)self _dictionaryByEvaluatingDictionary:v12 withForcedValue:a4];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v13 = [(SSProtocolConditionalEvaluator *)self _arrayByEvaluatingChildrenOfArray:v12 withForcedValue:a4];
        }
        id v12 = v13;
LABEL_11:
        [v7 addObject:v12];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return v7;
}

- (BOOL)_checkConditions:(id)a3 withOperator:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = [(SSProtocolConditionalEvaluator *)self _logicalOperatorForString:a4];
  if ([a3 count]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  char v8 = v7;
  context = self->_context;
  if (!context) {
    context = (SSProtocolConditionalContext *)[(id)objc_opt_class() defaultConditionalContext];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = +[SSProtocolCondition newConditionWithDictionary:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
        long long v15 = v14;
        if (v14)
        {
          if (v6 == 1)
          {
            if (v8)
            {
              char v8 = 1;
              goto LABEL_22;
            }
          }
          else
          {
            if (v6) {
              goto LABEL_22;
            }
            if ((v8 & 1) == 0)
            {
              char v8 = 0;
              goto LABEL_22;
            }
          }
          char v8 = [v14 evaluateWithContext:context];
        }
LABEL_22:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  return v8 & 1;
}

- (id)_dictionaryByEvaluatingChildrenOfDictionary:(id)a3 withForcedValue:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [a3 objectForKey:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [(SSProtocolConditionalEvaluator *)self _dictionaryByEvaluatingDictionary:v13 withForcedValue:a4];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v14 = [(SSProtocolConditionalEvaluator *)self _arrayByEvaluatingChildrenOfArray:v13 withForcedValue:a4];
        }
        uint64_t v13 = (uint64_t)v14;
LABEL_11:
        [v7 setObject:v13 forKey:v12];
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v7;
}

- (id)_dictionaryByEvaluatingDictionary:(id)a3 withForcedValue:(int64_t)a4
{
  v5 = [[SSProtocolConditionalEvaluator alloc] initWithDictionary:a3 conditionalContext:self->_context];
  id v6 = [(SSProtocolConditionalEvaluator *)v5 _dictionaryByEvaluatingWithForcedValue:a4];

  if (v6) {
    return v6;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  return (id)[v8 dictionary];
}

- (id)_dictionaryByEvaluatingWithForcedValue:(int64_t)a3
{
  id v5 = [(NSDictionary *)self->_dictionary objectForKey:@"conditions"];
  id v6 = [(NSDictionary *)self->_dictionary objectForKey:@"operator"];
  if (!v5 || ((v7 = v6, (unint64_t)[v5 count] >= 2) ? (BOOL v8 = v7 == 0) : (BOOL v8 = 0), v8))
  {
    dictionary = self->_dictionary;
  }
  else
  {
    if (a3 == 1
      || a3 == -1
      && [(SSProtocolConditionalEvaluator *)self _checkConditions:v5 withOperator:v7])
    {
      uint64_t v9 = self->_dictionary;
      uint64_t v10 = @"content";
    }
    else
    {
      uint64_t v9 = self->_dictionary;
      uint64_t v10 = @"alt-content";
    }
    dictionary = [(NSDictionary *)v9 objectForKey:v10];
  }
  uint64_t v12 = dictionary;
  if (!v12
    || (uint64_t v13 = v12, v12 != self->_dictionary)
    && (v14 = [[SSProtocolConditionalEvaluator alloc] initWithDictionary:v12 conditionalContext:self->_context], uint64_t v13 = [(SSProtocolConditionalEvaluator *)v14 _dictionaryByEvaluatingWithForcedValue:a3], v14, !v13))
  {
    uint64_t v13 = self->_dictionary;
  }
  return [(SSProtocolConditionalEvaluator *)self _dictionaryByEvaluatingChildrenOfDictionary:v13 withForcedValue:a3];
}

- (int)_logicalOperatorForString:(id)a3
{
  uint64_t v4 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v6 = i;
    if ([a3 isEqualToString:__LogicalOperatorNames[v4]]) {
      break;
    }
    uint64_t v4 = 1;
    if ((v6 & 1) == 0)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }
  return v4;
}

@end