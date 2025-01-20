@interface NSDictionary(PKPlistTypeSafety)
- (PKCurrencyAmount)PKCurrencyAmountForKey:()PKPlistTypeSafety;
- (double)PKDoubleForKey:()PKPlistTypeSafety;
- (id)PKArrayContaining:()PKPlistTypeSafety forKey:;
- (id)PKArrayForKey:()PKPlistTypeSafety;
- (id)PKColorForKey:()PKPlistTypeSafety;
- (id)PKDataForKey:()PKPlistTypeSafety;
- (id)PKDateComponentsForKey:()PKPlistTypeSafety;
- (id)PKDateForKey:()PKPlistTypeSafety;
- (id)PKDecimalNumberForKey:()PKPlistTypeSafety;
- (id)PKDecimalNumberFromStringForKey:()PKPlistTypeSafety;
- (id)PKDictionaryForKey:()PKPlistTypeSafety;
- (id)PKDictionaryOfKeyClass:()PKPlistTypeSafety valueClass:ForKey:;
- (id)PKNumberForKey:()PKPlistTypeSafety;
- (id)PKSetContaining:()PKPlistTypeSafety forKey:;
- (id)PKSetForKey:()PKPlistTypeSafety;
- (id)PKStringForKey:()PKPlistTypeSafety;
- (id)PKURLForKey:()PKPlistTypeSafety;
- (id)PKUUIDForKey:()PKPlistTypeSafety;
- (uint64_t)PKBoolForKey:()PKPlistTypeSafety;
- (uint64_t)PKIntegerForKey:()PKPlistTypeSafety;
@end

@implementation NSDictionary(PKPlistTypeSafety)

- (id)PKArrayContaining:()PKPlistTypeSafety forKey:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a1 PKArrayForKey:a4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v4;
LABEL_11:

  return v9;
}

- (id)PKArrayForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)PKStringForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)PKDateForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v1, 0, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v3 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

- (id)PKURLForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKStringForKey:");
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)PKSetContaining:()PKPlistTypeSafety forKey:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a1 PKSetForKey:a4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v4;
LABEL_11:

  return v9;
}

- (id)PKSetForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_5:
    id v3 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:v1];
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

- (id)PKColorForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKStringForKey:");
  if (v1)
  {
    id v2 = +[PKColor colorFromString:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)PKBoolForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKNumberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)PKNumberForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)PKDictionaryForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)PKDictionaryOfKeyClass:()PKPlistTypeSafety valueClass:ForKey:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 PKDictionaryForKey:a5];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
          {

            id v13 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  id v13 = v6;
LABEL_14:

  return v13;
}

- (uint64_t)PKIntegerForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKNumberForKey:");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (id)PKDecimalNumberFromStringForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)PKDecimalNumberForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C28];
    if (v1)
    {
      [v1 decimalValue];
    }
    else
    {
      v5[0] = 0;
      v5[1] = 0;
      int v6 = 0;
    }
    id v3 = [v2 decimalNumberWithDecimal:v5];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)PKDateComponentsForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)PKUUIDForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKStringForKey:");
  if (v1) {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (double)PKDoubleForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKNumberForKey:");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (id)PKDataForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v2 = v1;
  }
  else {
    double v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (PKCurrencyAmount)PKCurrencyAmountForKey:()PKPlistTypeSafety
{
  v1 = objc_msgSend(a1, "PKDictionaryForKey:");
  double v2 = [[PKCurrencyAmount alloc] initWithDictionary:v1];

  return v2;
}

@end