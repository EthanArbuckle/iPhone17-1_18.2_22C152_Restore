@interface PPSSQLiteContainsPredicate
+ (id)_arrayFromValues:(id)a3;
+ (id)_containsPredicateWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSArray)values;
- (PPSSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5;
- (id)description;
- (id)sqlForEntity:(id)a3;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation PPSSQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  v4 = [a1 _containsPredicateWithProperty:a3 values:a4 isNegative:0];
  return v4;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  v4 = [a1 _containsPredicateWithProperty:a3 values:a4 isNegative:1];
  return v4;
}

- (PPSSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPSSQLiteContainsPredicate;
  v10 = [(PPSSQLiteContainsPredicate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    property = v10->super._property;
    v10->super._property = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    values = v10->_values;
    v10->_values = (NSArray *)v13;

    v10->_isNegative = a5;
  }

  return v10;
}

+ (id)_containsPredicateWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [a1 _arrayFromValues:a4];
  if ([v9 count] == 1)
  {
    v10 = [v9 firstObject];
    if (v5) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    v12 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v8 value:v10 comparisonType:v11];
  }
  else
  {
    v12 = [[PPSSQLiteContainsPredicate alloc] initWithProperty:v8 values:v9 isNegative:v5];
  }

  return v12;
}

+ (id)_arrayFromValues:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    BOOL v5 = v4;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 allObjects];
    goto LABEL_5;
  }
  BOOL v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

LABEL_14:
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteContainsPredicate;
  if ([(PPSSQLitePropertyPredicate *)&v12 isEqual:v4]
    && (int v5 = [(PPSSQLiteContainsPredicate *)self isNegative],
        v5 == [v4 isNegative]))
  {
    uint64_t v7 = [(PPSSQLiteContainsPredicate *)self values];
    uint64_t v8 = [v4 values];
    if (v7 == v8)
    {
      char v6 = 1;
    }
    else
    {
      id v9 = [(PPSSQLiteContainsPredicate *)self values];
      v10 = [v4 values];
      char v6 = [v9 isEqual:v10];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v6 = [(PPSSQLiteContainsPredicate *)self values];
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
        PPSSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((void *)&v10 + 1) + 8 * v9));
        ++*a4;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)sqlForEntity:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  char v6 = [(PPSSQLitePropertyPredicate *)self property];
  uint64_t v7 = [v4 disambiguatedSQLForProperty:v6 shouldEscape:1];
  [v5 appendString:v7];

  if ([(PPSSQLiteContainsPredicate *)self isNegative]) {
    uint64_t v8 = CFSTR(" NOT IN (");
  }
  else {
    uint64_t v8 = CFSTR(" IN (");
  }
  [v5 appendString:v8];
  uint64_t v9 = [(PPSSQLiteContainsPredicate *)self values];
  unint64_t v10 = [v9 count];

  if (v10)
  {
    [v5 appendString:@"?"];
    if (v10 >= 2)
    {
      unint64_t v11 = v10 - 1;
      do
      {
        [v5 appendString:@", ?"];
        --v11;
      }
      while (v11);
    }
  }
  [v5 appendString:@""]);
  [v5 appendString:@""]);

  return v5;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(PPSSQLiteContainsPredicate *)self values];
  int v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v6 = [(PPSSQLiteContainsPredicate *)self values];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  unint64_t v11 = [v5 componentsJoinedByString:@", "];
  long long v12 = NSString;
  uint64_t v13 = [(PPSSQLitePropertyPredicate *)self property];
  long long v14 = (void *)v13;
  if (self->_isNegative) {
    uint64_t v15 = "";
  }
  else {
    uint64_t v15 = "NOT ";
  }
  uint64_t v16 = [v12 stringWithFormat:@"'%@' %sIN (%@)", v13, v15, v11];

  return v16;
}

- (BOOL)isNegative
{
  return self->_isNegative;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end