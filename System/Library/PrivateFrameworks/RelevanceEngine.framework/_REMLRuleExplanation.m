@interface _REMLRuleExplanation
- (_REMLRuleExplanation)initWithRule:(id)a3;
@end

@implementation _REMLRuleExplanation

- (_REMLRuleExplanation)initWithRule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMLRuleExplanation;
  v6 = [(_REMLRuleExplanation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rule, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end