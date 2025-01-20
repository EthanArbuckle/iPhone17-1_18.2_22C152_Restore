@interface POXSRFC3339DateDefinition
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSRFC3339DateDefinition

- (id)valueFromString:(id)a3
{
  uint64_t v3 = valueFromString__onceToken_2;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&valueFromString__onceToken_2, &__block_literal_global_17);
  }
  v5 = [(id)valueFromString__dateTimeFormatter dateFromString:v4];

  return v5;
}

uint64_t __45__POXSRFC3339DateDefinition_valueFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)valueFromString__dateTimeFormatter;
  valueFromString__dateTimeFormatter = (uint64_t)v0;

  v2 = (void *)valueFromString__dateTimeFormatter;
  return [v2 setFormatOptions:3955];
}

- (id)stringFromValue:(id)a3
{
  uint64_t v3 = stringFromValue__onceToken_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringFromValue__onceToken_0, &__block_literal_global_2_0);
  }
  v5 = [(id)stringFromValue__dateTimeFormatter stringFromDate:v4];

  return v5;
}

uint64_t __45__POXSRFC3339DateDefinition_stringFromValue___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  v1 = (void *)stringFromValue__dateTimeFormatter;
  stringFromValue__dateTimeFormatter = (uint64_t)v0;

  v2 = (void *)stringFromValue__dateTimeFormatter;
  return [v2 setFormatOptions:3955];
}

@end