@interface PLCompoundPropertyValidationRule
+ (id)andCompoundPropertyValidationRuleWithRules:(id)a3;
+ (id)orCompoundPropertyValidationRuleWithRules:(id)a3;
- (NSArray)rules;
- (PLCompoundPropertyValidationRule)initWithType:(int64_t)a3 rules:(id)a4;
- (id)currentValuesOfObject:(id)a3;
- (id)keyPaths;
- (id)predicate;
- (int64_t)compoundType;
- (void)setCompoundType:(int64_t)a3;
- (void)setRules:(id)a3;
@end

@implementation PLCompoundPropertyValidationRule

- (void).cxx_destruct
{
}

- (void)setRules:(id)a3
{
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setCompoundType:(int64_t)a3
{
  self->_compoundType = a3;
}

- (int64_t)compoundType
{
  return self->_compoundType;
}

- (id)currentValuesOfObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(PLCompoundPropertyValidationRule *)self keyPaths];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v4 valueForKey:v11];
        if (v12)
        {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
        else
        {
          v13 = [MEMORY[0x1E4F1CA98] null];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)keyPaths
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PLCompoundPropertyValidationRule *)self rules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) keyPaths];
        [v3 unionSet:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)predicate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PLCompoundPropertyValidationRule *)self rules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) predicate];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  int64_t v10 = [(PLCompoundPropertyValidationRule *)self compoundType];
  if (v10 == 1)
  {
    long long v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v3];
  }
  else
  {
    if (v10) {
      goto LABEL_13;
    }
    long long v11 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];
  }
  self = v11;
LABEL_13:

  return self;
}

- (PLCompoundPropertyValidationRule)initWithType:(int64_t)a3 rules:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLCompoundPropertyValidationRule;
  uint64_t v8 = [(PLCompoundPropertyValidationRule *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(PLPropertyValidationRule *)v8 setType:13];
    v9->_compoundType = a3;
    objc_storeStrong((id *)&v9->_rules, a4);
  }

  return v9;
}

+ (id)orCompoundPropertyValidationRuleWithRules:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithType:1 rules:v4];

  return v5;
}

+ (id)andCompoundPropertyValidationRuleWithRules:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithType:0 rules:v4];

  return v5;
}

@end