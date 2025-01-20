@interface WBSMinLengthPasswordRule
+ (id)minLengthRuleWithValue:(id)a3;
@end

@implementation WBSMinLengthPasswordRule

+ (id)minLengthRuleWithValue:(id)a3
{
  return (id)[a1 ruleWithType:3 value:a3];
}

@end