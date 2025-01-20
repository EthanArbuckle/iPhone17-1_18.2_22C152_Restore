@interface PPSSQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)description;
- (id)sqlForEntity:(id)a3;
@end

@implementation PPSSQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  *((unsigned char *)v4 + 16) = 0;
  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  *((unsigned char *)v4 + 16) = 1;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPSSQLiteNullPredicate;
  if ([(PPSSQLitePropertyPredicate *)&v8 isEqual:v4])
  {
    BOOL v5 = [(PPSSQLiteNullPredicate *)self matchesNull];
    int v6 = v5 ^ [v4 matchesNull] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)sqlForEntity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PPSSQLitePropertyPredicate *)self property];
  int v6 = [v4 disambiguatedSQLForProperty:v5 shouldEscape:1];

  v7 = NSString;
  BOOL v8 = [(PPSSQLiteNullPredicate *)self matchesNull];
  v9 = @"IS NOT NULL";
  if (v8) {
    v9 = @"IS NULL";
  }
  v10 = [v7 stringWithFormat:@"(%@ %@)", v6, v9];

  return v10;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = [(PPSSQLitePropertyPredicate *)self property];
  BOOL v5 = (void *)v4;
  if (self->_matchesNull) {
    int v6 = "";
  }
  else {
    int v6 = "NOT ";
  }
  v7 = [v3 stringWithFormat:@"'%@' IS %sNULL", v4, v6];

  return v7;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end