@interface NSPredicateRule
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluatePredicateWithSystem:(id)a3;
- (NSPredicate)predicate;
- (NSPredicateRule)init;
- (NSPredicateRule)initWithCoder:(id)a3;
- (NSPredicateRule)initWithPredicate:(id)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPredicateRule

- (void).cxx_destruct
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NSPredicate *)self->_predicate debugDescription];
  v7 = [v3 stringWithFormat:@"%@ : IF '%@'", v5, v6];

  return v7;
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  predicate = self->_predicate;
  id v4 = a3;
  v5 = [v4 constants];
  LOBYTE(predicate) = [(NSPredicate *)predicate evaluateWithObject:v4 substitutionVariables:v5];

  return (char)predicate;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSPredicateRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];

  v6 = [(NSPredicateRule *)self initWithPredicate:v5];
  return v6;
}

- (NSPredicateRule)initWithPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPredicateRule;
  v6 = [(NSPredicateRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_predicate, a3);
  }

  return v7;
}

- (NSPredicateRule)init
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  id v4 = [(NSPredicateRule *)self initWithPredicate:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end