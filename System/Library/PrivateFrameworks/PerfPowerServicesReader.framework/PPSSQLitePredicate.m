@interface PPSSQLitePredicate
- (BOOL)isEqual:(id)a3;
- (id)sqlForEntity:(id)a3;
- (id)sqlJoinClausesForEntity:(id)a3;
- (unint64_t)hash;
@end

@implementation PPSSQLitePredicate

- (id)sqlForEntity:(id)a3
{
  return 0;
}

- (id)sqlJoinClausesForEntity:(id)a3
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
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

@end