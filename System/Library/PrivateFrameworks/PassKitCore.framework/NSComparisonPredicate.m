@interface NSComparisonPredicate
- (id)_checkTypeForValue:(id)a3 inKeyPath:(id)a4;
- (id)passd_sqlPredicateForSelect;
@end

@implementation NSComparisonPredicate

- (id)passd_sqlPredicateForSelect
{
  v3 = [(NSComparisonPredicate *)self leftExpression];
  v4 = [(NSComparisonPredicate *)self rightExpression];
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = 3;
  switch([(NSComparisonPredicate *)self predicateOperatorType])
  {
    case NSLessThanPredicateOperatorType:
      break;
    case NSLessThanOrEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 4;
      break;
    case NSGreaterThanPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 5;
      break;
    case NSGreaterThanOrEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 6;
      break;
    case NSEqualToPredicateOperatorType:
      int v6 = 0;
      int v5 = 1;
      uint64_t v7 = 1;
      break;
    case NSNotEqualToPredicateOperatorType:
      int v5 = 0;
      int v6 = 1;
      uint64_t v7 = 2;
      break;
    default:
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = 0;
      break;
  }
  if ([v3 expressionType] == (id)3) {
    [v3 keyPath];
  }
  else {
  v8 = [v3 description];
  }
  if (![v4 expressionType])
  {
    uint64_t v10 = [v4 constantValue];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [(NSComparisonPredicate *)self _checkTypeForValue:v10 inKeyPath:v8];

      v13 = +[SQLiteComparisonPredicate predicateWithProperty:v8 value:v12 comparisonType:v7];

      goto LABEL_20;
    }
  }
  if (v5)
  {
    uint64_t v9 = +[SQLiteNullPredicate isNullPredicateWithProperty:v8];
LABEL_18:
    v13 = (void *)v9;
    goto LABEL_20;
  }
  if (v6)
  {
    uint64_t v9 = +[SQLiteNullPredicate isNotNullPredicateWithProperty:v8];
    goto LABEL_18;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)_checkTypeForValue:(id)a3 inKeyPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)_SQLValueForDate();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (id)_SQLValueForUUID();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (id)_SQLValueForURL();
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v5 = (id)_SQLValueForString();
        }
        else {
          id v5 = v4;
        }
      }
    }
  }
  int v6 = v5;

  return v6;
}

@end