@interface SSSQLitePredicate
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation SSSQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

@end