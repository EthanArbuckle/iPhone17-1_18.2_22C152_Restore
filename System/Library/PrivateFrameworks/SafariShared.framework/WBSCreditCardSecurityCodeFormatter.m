@interface WBSCreditCardSecurityCodeFormatter
+ (id)_normalizedSecurityCode:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
- (id)stringForObjectValue:(id)a3;
@end

@implementation WBSCreditCardSecurityCodeFormatter

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v6 = a4;
  if ([v6 length])
  {
    v7 = +[WBSCreditCardSecurityCodeFormatter _normalizedSecurityCode:v6];
    v8 = v7;
    BOOL v9 = v7 != 0;
    if (a3 && v7) {
      *a3 = v7;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  id v6 = a3;
  if ([v6 length])
  {
    v7 = +[WBSCreditCardSecurityCodeFormatter _normalizedSecurityCode:v6];
    v8 = v7;
    BOOL v9 = v7 != 0;
    if (v7)
    {
      if (a4)
      {
        id v10 = v7;
LABEL_8:
        *a4 = v10;
      }
    }
    else if (a4)
    {
      id v10 = 0;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

+ (id)_normalizedSecurityCode:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && ([MEMORY[0x1E4F28B88] decimalDigitCharacterSet],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 stringByTrimmingCharactersInSet:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    id v7 = v3;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end