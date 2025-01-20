@interface ML3Predicate
+ (BOOL)supportsSecureCoding;
- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5;
- (BOOL)isDynamicForEntityClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFalseAlways;
- (BOOL)isTrueAlways;
- (ML3Predicate)initWithCoder:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)databaseStatementParameters;
- (id)spotlightPredicate;
- (unint64_t)hash;
@end

@implementation ML3Predicate

- (id)databaseStatementParameters
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (id)spotlightPredicate
{
  return 0;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  return 0;
}

- (BOOL)isFalseAlways
{
  return 0;
}

- (BOOL)isTrueAlways
{
  return 0;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  return 0;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = [MEMORY[0x1E4F28E78] string];
  [(ML3Predicate *)self appendSQLToMutableString:v5 entityClass:a3];

  return v5;
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (ML3Predicate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ML3Predicate;
  return [(ML3Predicate *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end