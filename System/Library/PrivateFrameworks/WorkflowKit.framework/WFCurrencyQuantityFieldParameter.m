@interface WFCurrencyQuantityFieldParameter
- (WFCurrencyQuantityFieldParameter)initWithDefinition:(id)a3;
- (id)defaultUnit;
@end

@implementation WFCurrencyQuantityFieldParameter

- (id)defaultUnit
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v3 currencyCode];

  v5 = [(WFQuantityFieldParameter *)self possibleUnits];
  if ([v5 containsObject:v4])
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v5 firstObject];
  }
  v7 = v6;

  return v7;
}

- (WFCurrencyQuantityFieldParameter)initWithDefinition:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"PossibleUnits"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (![v7 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA20] ISOCurrencyCodes];

    v14 = @"PossibleUnits";
    v15[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v4 definitionByAddingEntriesInDictionary:v9];

    id v7 = (id)v8;
    id v4 = (id)v10;
  }
  v13.receiver = self;
  v13.super_class = (Class)WFCurrencyQuantityFieldParameter;
  v11 = [(WFQuantityFieldParameter *)&v13 initWithDefinition:v4];

  return v11;
}

@end