@interface SQLiteHasAssociatedEntityPredicate
+ (id)predicateWithAssociatedEntityClass:(Class)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation SQLiteHasAssociatedEntityPredicate

+ (id)predicateWithAssociatedEntityClass:(Class)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = a3;
  return v4;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = [(objc_class *)a3 associationPropertyForEntityClass:self->_associatedEntityClass];
  uint64_t v6 = [(objc_class *)self->_associatedEntityClass associationPropertyForEntityClass:a3];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v11 = +[NSMutableString stringWithFormat:@"0"];
  }
  else
  {
    v21 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];
    v9 = [(objc_class *)self->_associatedEntityClass disambiguatedSQLForProperty:v7];
    v10 = [(objc_class *)self->_associatedEntityClass databaseTable];
    v11 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("((SELECT 1 FROM %@"), v10);

    id v12 = objc_alloc_init((Class)NSMutableSet);
    [(objc_class *)self->_associatedEntityClass addJoinClausesForProperty:v9 toJoins:v12];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          [v11 appendString:@" "];
          [v11 appendString:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    [v11 appendFormat:@" WHERE %@ = %@ LIMIT 1 IS NOT NULL]"), v21, v9);
  }
  id v19 = [v11 copy];

  return v19;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"associatedEntityClass: %@; ", self->_associatedEntityClass];
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end