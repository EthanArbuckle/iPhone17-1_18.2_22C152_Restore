@interface SSSQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation SSSQLiteNullPredicate

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 0;
  *((void *)v4 + 1) = [a3 copy];
  return v4;
}

+ (id)isNullPredicateWithProperty:(id)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 1;
  *((void *)v4 + 1) = [a3 copy];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSSQLiteNullPredicate;
  unsigned int v5 = -[SSSQLitePropertyPredicate isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    BOOL v6 = [(SSSQLiteNullPredicate *)self matchesNull];
    LOBYTE(v5) = v6 ^ [a3 matchesNull] ^ 1;
  }
  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 disambiguatedSQLForProperty:[(SSSQLitePropertyPredicate *)self property]];
  unsigned int v5 = NSString;
  BOOL v6 = [(SSSQLiteNullPredicate *)self matchesNull];
  v7 = @"IS NOT NULL";
  if (v6) {
    v7 = @"IS NULL";
  }
  return (id)[v5 stringWithFormat:@"%@ %@", v4, v7];
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end