@interface PPSSQLiteCompoundPredicate
+ (id)negatedPredicate:(id)a3;
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)description;
- (id)sqlForEntity:(id)a3;
- (id)sqlJoinClausesForEntity:(id)a3;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation PPSSQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  if ([v16 count] == 1)
  {
    v15 = [v16 firstObject];
    goto LABEL_16;
  }
  v3 = objc_alloc_init((Class)objc_opt_class());
  v3[16] = 0;
  v3[17] = 1;
  v4 = (void *)*((void *)v3 + 3);
  v15 = v3;
  *((void *)v3 + 3) = @" AND ";

  v5 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v16;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([*((id *)v11 + 3) isEqualToString:@" AND "])
        {
          [v5 addObjectsFromArray:*((void *)v11 + 4)];

          continue;
        }
      }
      objc_msgSend(v5, "addObject:", v10, v15);
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v7);
LABEL_15:

  uint64_t v12 = [v5 copy];
  v13 = (void *)v15[4];
  v15[4] = v12;

LABEL_16:
  return v15;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  if ([v16 count] == 1)
  {
    v15 = [v16 firstObject];
    goto LABEL_16;
  }
  v3 = objc_alloc_init((Class)objc_opt_class());
  v3[16] = 0;
  v3[17] = 0;
  v4 = (void *)*((void *)v3 + 3);
  v15 = v3;
  *((void *)v3 + 3) = @" OR ";

  v5 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v16;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([*((id *)v11 + 3) isEqualToString:@" OR "])
        {
          [v5 addObjectsFromArray:*((void *)v11 + 4)];

          continue;
        }
      }
      objc_msgSend(v5, "addObject:", v10, v15);
    }
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v7);
LABEL_15:

  uint64_t v12 = [v5 copy];
  v13 = (void *)v15[4];
  v15[4] = v12;

LABEL_16:
  return v15;
}

+ (id)negatedPredicate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    v4[16] = 1;
    v5 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = @"NOT ";

    v9[0] = v3;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    uint64_t v7 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v17 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v17;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v8 value:*(void *)(*((void *)&v18 + 1) + 8 * i) comparisonType:a5];
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v15 = [a1 predicateMatchingAnyPredicates:v9];

  return v15;
}

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 values:a4 comparisonType:1];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  v5 = [a1 predicateWithProperty:a3 equalToValues:a4];
  uint64_t v6 = [a1 negatedPredicate:v5];

  return v6;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PPSSQLiteCompoundPredicate;
  id v3 = [(PPSSQLitePropertyPredicate *)&v8 hash];
  NSUInteger v4 = [(NSString *)self->_combineOperator hash];
  v5 = [(PPSSQLiteCompoundPredicate *)self predicates];
  unint64_t v6 = (unint64_t)v3 + v4 + [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteCompoundPredicate;
  if ([(PPSSQLitePropertyPredicate *)&v12 isEqual:v4]
    && ((combineOperator = self->_combineOperator, combineOperator == (NSString *)v4[3])
     || -[NSString isEqual:](combineOperator, "isEqual:")))
  {
    unint64_t v6 = [(PPSSQLiteCompoundPredicate *)self predicates];
    uint64_t v7 = [v4 predicates];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      objc_super v8 = [(PPSSQLiteCompoundPredicate *)self predicates];
      id v9 = [v4 predicates];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = [(PPSSQLiteCompoundPredicate *)self predicates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) bindToStatement:a3 bindingIndex:a4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)sqlForEntity:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PPSSQLiteCompoundPredicate *)self predicates];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
    uint64_t v8 = v7;
    if (self->_unary)
    {
      [v7 appendString:self->_combineOperator];
      uint64_t v9 = [(PPSSQLiteCompoundPredicate *)self predicates];
      long long v10 = [v9 objectAtIndexedSubscript:0];

      long long v11 = [v10 sqlForEntity:v4];
      [v8 appendString:v11];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v13 = [(PPSSQLiteCompoundPredicate *)self predicates];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) sqlForEntity:v4];
            if (v17)
            {
              if ((unint64_t)[v8 length] >= 2) {
                [v8 appendString:self->_combineOperator];
              }
              [v8 appendString:v17];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
    [v8 appendString:@""]);
  }
  else
  {
    if (self->_trueIfNoPredicates) {
      long long v12 = @"1";
    }
    else {
      long long v12 = @"0";
    }
    uint64_t v8 = [MEMORY[0x263F089D8] stringWithString:v12];
  }

  return v8;
}

- (id)sqlJoinClausesForEntity:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(PPSSQLiteCompoundPredicate *)self predicates];
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) sqlJoinClausesForEntity:v4];
        if (v10)
        {
          if (!v6)
          {
            uint64_t v6 = [MEMORY[0x263EFF9C0] set];
          }
          [v6 unionSet:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(PPSSQLiteCompoundPredicate *)self predicates];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(PPSSQLiteCompoundPredicate *)self predicates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  long long v11 = [v5 componentsJoinedByString:@",\n\t"];
  long long v12 = [NSString stringWithFormat:@"{%@:\n\t%@\n}", self->_combineOperator, v11];

  return v12;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_combineOperator, 0);
}

@end