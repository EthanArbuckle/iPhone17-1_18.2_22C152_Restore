@interface ML3NegationPredicate
+ (BOOL)supportsSecureCoding;
- (id)description;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
@end

@implementation ML3NegationPredicate

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  objc_msgSend(v6, "appendString:", @"(NOT ");
  [(ML3Predicate *)self->super._predicate appendSQLToMutableString:v6 entityClass:a4];
  [v6 appendString:@""]);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3NegationPredicate;
  v4 = [(ML3NegationPredicate *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@(NOT %@)", v4, self->super._predicate];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end