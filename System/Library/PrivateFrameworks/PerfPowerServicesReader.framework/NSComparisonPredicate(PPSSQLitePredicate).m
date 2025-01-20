@interface NSComparisonPredicate(PPSSQLitePredicate)
- (id)_checkTypeForValue:()PPSSQLitePredicate inKeyPath:;
- (id)pps_sqlPredicateForSelect;
@end

@implementation NSComparisonPredicate(PPSSQLitePredicate)

- (id)pps_sqlPredicateForSelect
{
  v2 = [a1 leftExpression];
  v3 = [a1 rightExpression];
  unint64_t v4 = [a1 predicateOperatorType];
  if (v4 < 0xB && ((0x4BFu >> v4) & 1) != 0)
  {
    uint64_t v6 = qword_258FB06B8[v4];
    if ([v2 expressionType] == 3) {
      [v2 keyPath];
    }
    else {
    v7 = [v2 description];
    }
    if ([v3 expressionType])
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unexpected constant value in right side of comparison expression: %@", a1 format];
      v8 = 0;
    }
    else
    {
      v8 = [v3 constantValue];
    }
    v9 = [a1 _checkTypeForValue:v8 inKeyPath:v7];

    v5 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v7 value:v9 comparisonType:v6];
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unsupported operator type in comparison expression: %@", a1 format];
    v5 = 0;
  }

  return v5;
}

- (id)_checkTypeForValue:()PPSSQLitePredicate inKeyPath:
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v3)
    {
LABEL_3:
      id v4 = v3;
      goto LABEL_16;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v3)
      {
        v5 = NSNumber;
        [v3 timeIntervalSinceReferenceDate];
        objc_msgSend(v5, "numberWithDouble:");
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v3)
        {
          id v4 = [v3 UUIDString];
          goto LABEL_16;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v3)
          {
            id v4 = [v3 absoluteString];
            goto LABEL_16;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v3) {
            goto LABEL_3;
          }
        }
      }
    }
  }
  id v4 = [MEMORY[0x263EFF9D0] null];
LABEL_16:
  uint64_t v6 = v4;

  return v6;
}

@end