@interface SQLiteCompoundPredicate
+ (id)negatedPredicate:(id)a3;
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteCompoundPredicate

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = +[SQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(void *)(*((void *)&v19 + 1) + 8 * i), a5, (void)v19);
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = [a1 predicateMatchingAnyPredicates:v10];

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_combinationOperation, 0);
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = 0;
  v4[9] = 0;
  v5 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = @" OR ";

  id v6 = [v3 copy];
  v7 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v6;

  return v4;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_predicates;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "bindToStatement:bindingIndex:", a3, a4, (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_predicates;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "SQLJoinClausesForEntityClass:", a3, (void)v12);
        if (v10)
        {
          if (!v7)
          {
            id v7 = +[NSMutableSet set];
          }
          [v7 unionSet:v10];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  if ([(NSArray *)self->_predicates count])
  {
    id v5 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
    id v6 = v5;
    if (self->_unary)
    {
      [v5 appendString:self->_combinationOperation];
      id v7 = [(NSArray *)self->_predicates objectAtIndex:0];
      uint64_t v8 = [v7 SQLForEntityClass:a3];
      [v6 appendString:v8];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = self->_predicates;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "SQLForEntityClass:", a3, (void)v17);
            if (v15)
            {
              if ((unint64_t)[v6 length] >= 2) {
                [v6 appendString:self->_combinationOperation];
              }
              [v6 appendString:v15];
            }
          }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    [v6 appendString:@""], (void)v17);
  }
  else
  {
    if (self->_trueIfNoPredicates) {
      CFStringRef v9 = @"1";
    }
    else {
      CFStringRef v9 = @"0";
    }
    id v6 = +[NSMutableString stringWithString:v9];
  }
  return v6;
}

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = 0;
  v4[9] = 1;
  id v5 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = @" AND ";

  id v6 = [v3 copy];
  id v7 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v6;

  return v4;
}

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  return _[a1 predicateWithProperty:a3 values:a4 comparisonType:1];
}

+ (id)negatedPredicate:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = 1;
  id v5 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = @"NOT ";

  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v3, 0);
  id v7 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v6;

  return v4;
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  v4 = +[SQLiteCompoundPredicate predicateWithProperty:a3 equalToValues:a4];
  id v5 = +[SQLiteCompoundPredicate negatedPredicate:v4];

  return v5;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  id v3 = self);
  v4 = v3;
  if (self->_unary) {
    CFStringRef v5 = @"Y";
  }
  else {
    CFStringRef v5 = @"N";
  }
  [v3 appendFormat:@"unary: %@; ", v5];
  if (self->_trueIfNoPredicates) {
    CFStringRef v6 = @"Y";
  }
  else {
    CFStringRef v6 = @"N";
  }
  [v4 appendFormat:@"trueIfNoPredicates: %@; ", v6];
  [v4 appendFormat:@"combinationOperation: %@; ", self->_combinationOperation];
  [v4 appendFormat:@"predicates: %@; ", self->_predicates];
  [v4 appendFormat:@">"];
  return v4;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SQLiteCompoundPredicate;
  id v3 = [(SQLitePredicate *)&v6 hash];
  v4 = &v3[[(NSString *)self->_combinationOperation hash]];
  return (unint64_t)[(NSArray *)self->_predicates hash] + (void)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SQLiteCompoundPredicate;
  if ([(SQLitePredicate *)&v10 isEqual:v4])
  {
    CFStringRef v5 = v4;
    combinationOperation = self->_combinationOperation;
    if (combinationOperation == (NSString *)v5[2]
      || -[NSString isEqual:](combinationOperation, "isEqual:"))
    {
      predicates = self->_predicates;
      if (predicates == (NSArray *)v5[3]) {
        unsigned __int8 v8 = 1;
      }
      else {
        unsigned __int8 v8 = -[NSArray isEqual:](predicates, "isEqual:");
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

- (NSArray)predicates
{
  return self->_predicates;
}

@end