@interface POXSDateDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSDateDefinition

- (id)valueFromString:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (valueFromString__onceToken_0 != -1) {
    dispatch_once(&valueFromString__onceToken_0, &__block_literal_global_2);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)valueFromString__dateFormatters;
  v5 = (void *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "dateFromString:", v3, (void)v13);
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [v8 calendar];
          v5 = [v11 components:3178750 fromDate:v10];

          goto LABEL_13;
        }
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

uint64_t __38__POXSDateDefinition_valueFromString___block_invoke()
{
  valueFromString__dateFormatters = +[POXSDateFormatterFactory newDateFormatters];
  return MEMORY[0x270F9A758]();
}

- (id)stringFromValue:(id)a3
{
  uint64_t v3 = stringFromValue__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringFromValue__onceToken, &__block_literal_global_2);
  }
  v5 = [(id)stringFromValue__dateFormatter calendar];
  uint64_t v6 = [v5 dateFromComponents:v4];

  v7 = [(id)stringFromValue__dateFormatter stringFromDate:v6];

  return v7;
}

uint64_t __38__POXSDateDefinition_stringFromValue___block_invoke()
{
  stringFromValue__dateFormatter = +[POXSDateFormatterFactory newDateFormatter];
  return MEMORY[0x270F9A758]();
}

@end