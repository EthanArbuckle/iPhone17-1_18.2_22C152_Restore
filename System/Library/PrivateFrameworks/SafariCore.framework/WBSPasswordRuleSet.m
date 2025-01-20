@interface WBSPasswordRuleSet
+ (id)ruleSetWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5;
+ (id)ruleSetWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5 minLengthRule:(id)a6 maxLengthRule:(id)a7;
- (NSArray)requiredRules;
- (WBSAllowedPasswordRule)allowedRule;
- (WBSMaxConsecutivePasswordRule)maxConsecutiveRule;
- (WBSMaxLengthPasswordRule)maxLengthRule;
- (WBSMinLengthPasswordRule)minLengthRule;
- (WBSPasswordRuleSet)initWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5 minLengthRule:(id)a6 maxLengthRule:(id)a7;
@end

@implementation WBSPasswordRuleSet

+ (id)ruleSetWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithAllowedRule:v10 requiredRules:v9 maxConsecutiveRule:v8 minLengthRule:0 maxLengthRule:0];

  return v11;
}

+ (id)ruleSetWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5 minLengthRule:(id)a6 maxLengthRule:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithAllowedRule:v16 requiredRules:v15 maxConsecutiveRule:v14 minLengthRule:v13 maxLengthRule:v12];

  return v17;
}

- (WBSPasswordRuleSet)initWithAllowedRule:(id)a3 requiredRules:(id)a4 maxConsecutiveRule:(id)a5 minLengthRule:(id)a6 maxLengthRule:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)WBSPasswordRuleSet;
  v18 = [(WBSPasswordRuleSet *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_allowedRule, a3);
    uint64_t v20 = [v14 copy];
    requiredRules = v19->_requiredRules;
    v19->_requiredRules = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_maxConsecutiveRule, a5);
    objc_storeStrong((id *)&v19->_minLengthRule, a6);
    objc_storeStrong((id *)&v19->_maxLengthRule, a7);
    v22 = v19;
  }

  return v19;
}

- (WBSAllowedPasswordRule)allowedRule
{
  return self->_allowedRule;
}

- (NSArray)requiredRules
{
  return self->_requiredRules;
}

- (WBSMaxConsecutivePasswordRule)maxConsecutiveRule
{
  return self->_maxConsecutiveRule;
}

- (WBSMinLengthPasswordRule)minLengthRule
{
  return self->_minLengthRule;
}

- (WBSMaxLengthPasswordRule)maxLengthRule
{
  return self->_maxLengthRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLengthRule, 0);
  objc_storeStrong((id *)&self->_minLengthRule, 0);
  objc_storeStrong((id *)&self->_maxConsecutiveRule, 0);
  objc_storeStrong((id *)&self->_requiredRules, 0);
  objc_storeStrong((id *)&self->_allowedRule, 0);
}

@end