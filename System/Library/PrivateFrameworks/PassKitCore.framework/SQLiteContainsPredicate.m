@interface SQLiteContainsPredicate
+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegative;
- (NSString)queryProperty;
- (SQLiteQuery)query;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (id)values;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = [v6 copy];

  v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 0;
  id v10 = [v5 copy];

  v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  id v11 = [v9 copy];

  v12 = (void *)v10[1];
  v10[1] = v11;

  *((unsigned char *)v10 + 16) = 0;
  v13 = (void *)v10[3];
  v10[3] = v7;
  id v14 = v7;

  id v15 = [v8 copy];
  v16 = (void *)v10[4];
  v10[4] = v15;

  return v10;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = [v6 copy];

  id v9 = (void *)v7[1];
  v7[1] = v8;

  *((unsigned char *)v7 + 16) = 1;
  id v10 = [v5 copy];

  id v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"property: %@; ", self->super._property];
  if (self->_negative) {
    CFStringRef v4 = @"Y";
  }
  else {
    CFStringRef v4 = @"N";
  }
  [v3 appendFormat:@"negative: %@; ", v4];
  if (self->_values) {
    [v3 appendFormat:@"values: %@; ", self->_values];
  }
  if (self->_query || self->_queryProperty)
  {
    [v3 appendFormat:@"query: %@; ", self->_query];
    [v3 appendFormat:@"queryProperty: %@; ", self->_queryProperty];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  if (self->_query)
  {
    query = self->_query;
    -[SQLiteQuery bindToSelectStatement:bindingIndex:](query, "bindToSelectStatement:bindingIndex:");
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_values;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          SQLiteBindFoundationValueToStatement(a3, *a4, *(objc_object **)(*((void *)&v12 + 1) + 8 * (void)v11));
          ++*a4;
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SQLiteContainsPredicate;
  if ([(SQLitePropertyPredicate *)&v10 isEqual:v4])
  {
    id v5 = (SQLiteQuery **)v4;
    if (self->_negative == *((unsigned __int8 *)v5 + 16)
      && ((values = (SQLiteQuery *)self->_values, values == v5[5])
       || -[SQLiteQuery isEqual:](values, "isEqual:")))
    {
      query = self->_query;
      if (query == v5[3]) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = -[SQLiteQuery isEqual:](query, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v5 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
  id v6 = [(objc_class *)a3 disambiguatedSQLForProperty:self->super._property];
  [v5 appendString:v6];

  if (self->_negative) {
    CFStringRef v7 = CFSTR(" NOT IN (");
  }
  else {
    CFStringRef v7 = CFSTR(" IN (");
  }
  [v5 appendString:v7];
  query = self->_query;
  if (query)
  {
    id v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_queryProperty, 0);
    id v10 = [(SQLiteQuery *)query copySelectSQLWithProperties:v9];

    if (v10) {
      [v5 appendString:v10];
    }
  }
  else
  {
    long long v12 = (char *)[self->_values count];
    if (v12)
    {
      long long v13 = v12;
      [v5 appendString:@"?"];
      long long v14 = v13 - 1;
      if (v13 != (char *)1)
      {
        do
        {
          [v5 appendString:@", ?"];
          --v14;
        }
        while (v14);
      }
    }
  }
  [v5 appendString:@""]);
  [v5 appendString:@""]);
  return v5;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (SQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (id)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_values, 0);
  objc_storeStrong((id *)&self->_queryProperty, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end