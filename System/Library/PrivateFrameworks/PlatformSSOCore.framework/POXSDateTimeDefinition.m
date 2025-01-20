@interface POXSDateTimeDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSDateTimeDefinition

- (id)valueFromString:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (valueFromString__onceToken_1 != -1) {
    dispatch_once(&valueFromString__onceToken_1, &__block_literal_global_13);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)valueFromString__dateTimeFormatters;
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

uint64_t __42__POXSDateTimeDefinition_valueFromString___block_invoke()
{
  valueFromString__dateTimeFormatters = +[POXSDateFormatterFactory newDateTimeFormatters];
  return MEMORY[0x270F9A758]();
}

- (id)stringFromValue:(id)a3
{
  id v3 = a3;
  id v4 = [v3 timeZone];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  if ([v4 isEqualToTimeZone:v5])
  {
    uint64_t v6 = 2;
  }
  else
  {
    if (v4)
    {
      id v7 = +[POXSDateFormatterFactory newDateTimeFormatterWithTimeZoneStyle:1];
      [v7 setTimeZone:v4];
      goto LABEL_7;
    }
    uint64_t v6 = 0;
  }
  id v7 = +[POXSDateFormatterFactory newDateTimeFormatterWithTimeZoneStyle:v6];
LABEL_7:
  v8 = [v7 calendar];
  uint64_t v9 = [v8 dateFromComponents:v3];

  v10 = [v7 stringFromDate:v9];

  return v10;
}

@end