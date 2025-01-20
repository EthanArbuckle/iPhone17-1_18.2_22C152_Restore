@interface SATrueCondition
+ (id)trueCondition;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SATrueCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"TrueCondition";
}

+ (id)trueCondition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end