@interface _NSPredicateRule
+ (BOOL)supportsSecureCoding;
- (_NSPredicateRule)initWithCoder:(id)a3;
- (_NSPredicateRule)initWithPredicate:(id)a3 fact:(id)a4 grade:(double)a5 asserting:(BOOL)a6;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)performActionWithSystem:(id)a3;
@end

@implementation _NSPredicateRule

- (void).cxx_destruct
{
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(NSPredicateRule *)self predicate];
  uint64_t v5 = [v4 debugDescription];
  v6 = (void *)v5;
  if (self->_asserting) {
    v7 = @"assert";
  }
  else {
    v7 = @"retract";
  }
  v8 = [v3 stringWithFormat:@"IF %@ THEN %@(%@) by %.2f", v5, v7, self->_fact, *(void *)&self->_grade];

  return v8;
}

- (void)performActionWithSystem:(id)a3
{
  fact = self->_fact;
  double grade = self->_grade;
  if (self->_asserting) {
    [a3 assertFact:fact grade:grade];
  }
  else {
    [a3 retractFact:fact grade:grade];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NSPredicateRule;
  id v4 = a3;
  [(NSPredicateRule *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_asserting, @"asserting", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"grade" forKey:self->_grade];
  [v4 encodeObject:self->_fact forKey:@"fact"];
}

- (_NSPredicateRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NSPredicateRule;
  objc_super v5 = [(NSPredicateRule *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_asserting = [v4 decodeBoolForKey:@"asserting"];
    [v4 decodeDoubleForKey:@"grade"];
    v5->_double grade = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fact"];
    fact = v5->_fact;
    v5->_fact = (NSString *)v7;
  }
  return v5;
}

- (_NSPredicateRule)initWithPredicate:(id)a3 fact:(id)a4 grade:(double)a5 asserting:(BOOL)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_NSPredicateRule;
  v12 = [(NSPredicateRule *)&v15 initWithPredicate:a3];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fact, a4);
    v13->_double grade = a5;
    v13->_asserting = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end