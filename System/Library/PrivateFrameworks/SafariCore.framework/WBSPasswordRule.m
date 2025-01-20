@interface WBSPasswordRule
+ (id)ruleWithType:(int64_t)a3 value:(id)a4;
- (WBSPasswordRule)initWithPasswordRuleType:(int64_t)a3 value:(id)a4;
- (id)value;
- (int64_t)type;
@end

@implementation WBSPasswordRule

+ (id)ruleWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithPasswordRuleType:a3 value:v6];

  return v7;
}

- (WBSPasswordRule)initWithPasswordRuleType:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordRule;
  v8 = [(WBSPasswordRule *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_value, a4);
    v10 = v9;
  }

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end