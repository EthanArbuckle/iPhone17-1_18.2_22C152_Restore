@interface ML3CompoundPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateMatchingPredicates:(id)a3;
- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5;
- (BOOL)isDynamicForEntityClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (ML3CompoundPredicate)initWithCoder:(id)a3;
- (ML3CompoundPredicate)initWithPredicates:(id)a3;
- (NSArray)predicates;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)databaseStatementParameters;
- (id)description;
- (id)spotlightPredicate;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicates:(id)a3;
@end

@implementation ML3CompoundPredicate

- (id)databaseStatementParameters
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_predicates;
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
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "databaseStatementParameters", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSArray *)self->_predicates count])
  {
    objc_msgSend(v6, "appendString:", @"(");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_predicates;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
          if (v10)
          {
            long long v14 = [(ML3CompoundPredicate *)self compoundOperatorJoiner];
            [v6 appendString:v14];
          }
          objc_msgSend(v13, "appendSQLToMutableString:entityClass:", v6, a4, (void)v16);
          ++v12;
          char v10 = 1;
        }
        while (v9 != v12);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v15 = @"");
  }
  else
  {
    v15 = @"1";
  }
  objc_msgSend(v6, "appendString:", v15, (void)v16);
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_predicates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        char v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "SQLJoinClausesForClass:", a3, (void)v12);
        if ([v10 count])
        {
          if (!v7)
          {
            uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSet];
          }
          [v7 unionOrderedSet:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)predicateMatchingPredicates:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6 == (objc_class *)objc_opt_class())
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"ML3Predicate.m" lineNumber:1072 description:@"ML3CompoundPredicate is an abstract class; use ML3AllCompoundPredicate or ML3AnyCompoundPredicate"];
  }
  uint64_t v7 = (void *)[[v6 alloc] initWithPredicates:v5];

  return v7;
}

- (ML3CompoundPredicate)initWithPredicates:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3CompoundPredicate;
  id v5 = [(ML3CompoundPredicate *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(ML3CompoundPredicate *)v5 setPredicates:v4];
  }

  return v6;
}

- (void)setPredicates:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ML3CompoundPredicate *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3CompoundPredicate;
    if ([(ML3Predicate *)&v9 isEqual:v4])
    {
      id v5 = [(ML3CompoundPredicate *)self predicates];
      uint64_t v6 = [(ML3CompoundPredicate *)v4 predicates];
      if (v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_predicates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isDynamicForEntityClass:", a3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)spotlightPredicate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_predicates;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "spotlightPredicate", (void)v10);
        if (v7)
        {
          objc_super v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  objc_super v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_predicates;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "containsPropertyPredicate:matchingValue:usingComparison:", v8, v9, v5, (void)v17))
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ML3CompoundPredicate;
  uint64_t v4 = [(ML3CompoundPredicate *)&v8 description];
  uint64_t v5 = [(ML3CompoundPredicate *)self predicates];
  uint64_t v6 = [v3 stringWithFormat:@"%@(%@)", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ML3CompoundPredicate;
  unint64_t v3 = [(ML3Predicate *)&v7 hash];
  uint64_t v4 = [(ML3CompoundPredicate *)self predicates];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ML3CompoundPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(ML3CompoundPredicate *)self predicates];
  [v4 encodeObject:v5 forKey:@"predicates"];
}

- (ML3CompoundPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3CompoundPredicate;
  unint64_t v5 = [(ML3Predicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"predicates"];
    [(ML3CompoundPredicate *)v5 setPredicates:v9];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end