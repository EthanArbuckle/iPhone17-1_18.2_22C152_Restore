@interface SSSQLiteCompoundPredicate
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)dealloc;
@end

@implementation SSSQLiteCompoundPredicate

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  predicates = self->_predicates;
  uint64_t v5 = [(NSArray *)predicates countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(predicates);
      }
      uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) SQLJoinClausesForEntityClass:a3];
      if (v10)
      {
        uint64_t v11 = v10;
        if (!v7) {
          v7 = (void *)[MEMORY[0x1E4F1CA80] set];
        }
        [v7 unionSet:v11];
      }
    }
    uint64_t v6 = [(NSArray *)predicates countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSArray *)self->_predicates count];
  uint64_t v6 = (void *)MEMORY[0x1E4F28E78];
  if (v5)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    predicates = self->_predicates;
    uint64_t v9 = [(NSArray *)predicates countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(predicates);
          }
          uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) SQLForEntityClass:a3];
          if (v13)
          {
            uint64_t v14 = v13;
            if ((unint64_t)[v7 length] >= 2) {
              [v7 appendString:self->_combinationOperation];
            }
            [v7 appendString:v14];
          }
        }
        uint64_t v10 = [(NSArray *)predicates countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    [v7 appendString:@""]);
    return v7;
  }
  else
  {
    return (id)[v6 stringWithString:@"1"];
  }
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  predicates = self->_predicates;
  uint64_t v7 = [(NSArray *)predicates countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(predicates);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) bindToStatement:a3 bindingIndex:a4];
      }
      uint64_t v8 = [(NSArray *)predicates countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteCompoundPredicate;
  [(SSSQLiteCompoundPredicate *)&v3 dealloc];
}

+ (id)predicateMatchingAllPredicates:(id)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = @" AND ";
  v4[2] = [a3 copy];
  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = @" OR ";
  v4[2] = [a3 copy];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v9, "addObject:", +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", a3, *(void *)(*((void *)&v16 + 1) + 8 * v13++), a5));
      }
      while (v11 != v13);
      uint64_t v11 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  long long v14 = (void *)[a1 predicateMatchingAnyPredicates:v9];

  return v14;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SSSQLiteCompoundPredicate;
  id v3 = [(SSSQLitePredicate *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_combinationOperation hash];
  return (unint64_t)v3
       + [(NSArray *)[(SSSQLiteCompoundPredicate *)self predicates] hash]
       + v4;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSSQLiteCompoundPredicate;
  unsigned int v5 = -[SSSQLitePredicate isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    combinationOperation = self->_combinationOperation;
    if (combinationOperation == *((NSString **)a3 + 1)
      || (unsigned int v5 = -[NSString isEqual:](combinationOperation, "isEqual:")) != 0)
    {
      predicates = self->_predicates;
      if (predicates == (NSArray *)[a3 predicates]) {
        LOBYTE(v5) = 1;
      }
      else {
        LOBYTE(v5) = -[NSArray isEqual:](self->_predicates, "isEqual:", [a3 predicates]);
      }
    }
  }
  return v5;
}

- (NSArray)predicates
{
  return self->_predicates;
}

@end