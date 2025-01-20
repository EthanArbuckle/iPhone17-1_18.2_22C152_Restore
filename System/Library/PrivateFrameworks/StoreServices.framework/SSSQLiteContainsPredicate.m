@interface SSSQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSArray)values;
- (NSString)queryProperty;
- (SSSQLiteQuery)query;
- (id)SQLForEntityClass:(Class)a3;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)dealloc;
@end

@implementation SSSQLiteContainsPredicate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteContainsPredicate;
  [(SSSQLitePropertyPredicate *)&v3 dealloc];
}

- (id)SQLForEntityClass:(Class)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(objc_class *)a3 disambiguatedSQLForProperty:[(SSSQLitePropertyPredicate *)self property]];
  v5 = (void *)[MEMORY[0x1E4F28E78] stringWithString:v4];
  v6 = v5;
  if (self->_negative) {
    v7 = CFSTR(" NOT IN (");
  }
  else {
    v7 = CFSTR(" IN (");
  }
  [v5 appendString:v7];
  query = self->_query;
  if (query)
  {
    v15[0] = self->_queryProperty;
    uint64_t v9 = [(SSSQLiteQuery *)query copySelectSQLWithProperties:v15 count:1];
    if (v9)
    {
      v10 = (void *)v9;
      [v6 appendString:v9];
    }
  }
  else
  {
    uint64_t v11 = [self->_values count];
    if (v11)
    {
      uint64_t v12 = v11;
      [v6 appendString:@"?"];
      uint64_t v13 = v12 - 1;
      if (v12 != 1)
      {
        do
        {
          [v6 appendString:@", ?"];
          --v13;
        }
        while (v13);
      }
    }
  }
  [v6 appendString:@""]);
  return v6;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_query)
  {
    query = self->_query;
    -[SSSQLiteQuery bindToSelectStatement:bindingIndex:](query, "bindToSelectStatement:bindingIndex:");
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id values = self->_values;
    uint64_t v8 = [values countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(values);
          }
          SSSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((void *)&v12 + 1) + 8 * i));
          ++*a4;
        }
        uint64_t v9 = [values countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = [a3 copy];
  *((unsigned char *)v6 + 16) = 0;
  v6[5] = [a4 copy];
  return v6;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = [a3 copy];
  *((unsigned char *)v6 + 16) = 1;
  v6[5] = [a4 copy];
  return v6;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  uint64_t v8 = objc_alloc_init((Class)objc_opt_class());
  v8[1] = [a3 copy];
  *((unsigned char *)v8 + 16) = 0;
  v8[3] = a4;
  v8[4] = [a5 copy];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SSSQLiteContainsPredicate;
  unsigned int v5 = -[SSSQLitePropertyPredicate isEqual:](&v10, sel_isEqual_);
  if (v5)
  {
    int v6 = [(SSSQLiteContainsPredicate *)self isNegative];
    if (v6 == [a3 isNegative])
    {
      v7 = [(SSSQLiteContainsPredicate *)self values];
      if (v7 == (NSArray *)[a3 values]
        || (unsigned int v5 = -[NSArray isEqual:](-[SSSQLiteContainsPredicate values](self, "values"), "isEqual:", [a3 values])) != 0)
      {
        uint64_t v8 = [(SSSQLiteContainsPredicate *)self query];
        if (v8 == (SSSQLiteQuery *)[a3 query]) {
          LOBYTE(v5) = 1;
        }
        else {
          LOBYTE(v5) = -[SSSQLiteQuery isEqual:](-[SSSQLiteContainsPredicate query](self, "query"), "isEqual:", [a3 query]);
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (SSSQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (NSArray)values
{
  return (NSArray *)self->_values;
}

@end