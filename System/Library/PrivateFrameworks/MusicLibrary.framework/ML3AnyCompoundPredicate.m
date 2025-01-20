@interface ML3AnyCompoundPredicate
+ (BOOL)supportsSecureCoding;
- (id)compoundOperatorJoiner;
@end

@implementation ML3AnyCompoundPredicate

- (id)compoundOperatorJoiner
{
  return @" OR ";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end