@interface WBSMaxLengthPasswordRule
+ (id)maxLengthRuleWithValue:(id)a3;
@end

@implementation WBSMaxLengthPasswordRule

+ (id)maxLengthRuleWithValue:(id)a3
{
  return (id)[a1 ruleWithType:4 value:a3];
}

@end