@interface RTPredicateInspector
- (BOOL)predicate:(id)a3 referencesSubstitutionVariablesFromSet:(id)a4;
- (BOOL)predicateContainsSubstitutionVariables;
- (NSSet)substitutionVariables;
- (void)_inspectExpression:(id)a3;
- (void)setPredicateContainsSubstitutionVariables:(BOOL)a3;
- (void)setSubstitutionVariables:(id)a3;
- (void)visitPredicate:(id)a3;
@end

@implementation RTPredicateInspector

- (void)visitPredicate:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
    v5 = [v4 leftExpression];
    [(RTPredicateInspector *)self _inspectExpression:v5];

    v6 = [v4 rightExpression];

    [(RTPredicateInspector *)self _inspectExpression:v6];
  }
}

- (void)_inspectExpression:(id)a3
{
  id v6 = a3;
  if ([v6 expressionType] == 2)
  {
    substitutionVariables = self->_substitutionVariables;
    v5 = [v6 variable];
    LODWORD(substitutionVariables) = [(NSSet *)substitutionVariables containsObject:v5];

    if (substitutionVariables) {
      self->_predicateContainsSubstitutionVariables = 1;
    }
  }
}

- (BOOL)predicate:(id)a3 referencesSubstitutionVariablesFromSet:(id)a4
{
  self->_predicateContainsSubstitutionVariables = 0;
  id v6 = a3;
  id v7 = (NSSet *)[a4 copy];
  substitutionVariables = self->_substitutionVariables;
  self->_substitutionVariables = v7;

  [v6 acceptVisitor:self flags:3];
  return self->_predicateContainsSubstitutionVariables;
}

- (BOOL)predicateContainsSubstitutionVariables
{
  return self->_predicateContainsSubstitutionVariables;
}

- (void)setPredicateContainsSubstitutionVariables:(BOOL)a3
{
  self->_predicateContainsSubstitutionVariables = a3;
}

- (NSSet)substitutionVariables
{
  return self->_substitutionVariables;
}

- (void)setSubstitutionVariables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end