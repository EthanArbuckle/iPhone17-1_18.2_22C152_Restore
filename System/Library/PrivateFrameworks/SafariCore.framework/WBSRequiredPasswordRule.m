@interface WBSRequiredPasswordRule
+ (id)requiredRuleWithCharacterClasses:(id)a3;
@end

@implementation WBSRequiredPasswordRule

+ (id)requiredRuleWithCharacterClasses:(id)a3
{
  return (id)[a1 ruleWithType:1 value:a3];
}

@end