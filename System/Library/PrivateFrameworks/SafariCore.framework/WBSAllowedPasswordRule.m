@interface WBSAllowedPasswordRule
+ (id)allowedRuleWithCharacterClasses:(id)a3;
@end

@implementation WBSAllowedPasswordRule

+ (id)allowedRuleWithCharacterClasses:(id)a3
{
  return (id)[a1 ruleWithType:0 value:a3];
}

@end