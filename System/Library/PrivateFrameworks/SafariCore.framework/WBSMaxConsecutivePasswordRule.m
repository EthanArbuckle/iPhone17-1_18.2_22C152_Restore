@interface WBSMaxConsecutivePasswordRule
+ (id)maxConsecutiveRuleWithValue:(id)a3;
@end

@implementation WBSMaxConsecutivePasswordRule

+ (id)maxConsecutiveRuleWithValue:(id)a3
{
  return (id)[a1 ruleWithType:2 value:a3];
}

@end