@interface NURule
+ (BOOL)supportsSecureCoding;
+ (id)ruleWithBlockPredicate:(id)a3 action:(id)a4;
+ (id)ruleWithPredicate:(id)a3 action:(id)a4;
+ (id)ruleWithPredicate:(id)a3 assertingFact:(id)a4 grade:(double)a5;
+ (id)ruleWithPredicate:(id)a3 retractingFact:(id)a4 grade:(double)a5;
- (BOOL)evaluatePredicateWithSystem:(id)a3;
- (int64_t)salience;
- (void)setSalience:(int64_t)a3;
@end

@implementation NURule

- (void)setSalience:(int64_t)a3
{
  self->_salience = a3;
}

- (int64_t)salience
{
  return self->_salience;
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  return 0;
}

+ (id)ruleWithBlockPredicate:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_NUBlockRule alloc] initWithPredicate:v6 action:v5];

  return v7;
}

+ (id)ruleWithPredicate:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_NSPredicateBlockRule alloc] initWithPredicate:v6 action:v5];

  return v7;
}

+ (id)ruleWithPredicate:(id)a3 retractingFact:(id)a4 grade:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[_NSPredicateRule alloc] initWithPredicate:v8 fact:v7 grade:0 asserting:a5];

  return v9;
}

+ (id)ruleWithPredicate:(id)a3 assertingFact:(id)a4 grade:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[_NSPredicateRule alloc] initWithPredicate:v8 fact:v7 grade:1 asserting:a5];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end