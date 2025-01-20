@interface SXMutableComponents
- (id)debugDescription;
- (id)debugDescriptionForComponents:(id)a3 depth:(unint64_t)a4;
- (id)description;
@end

@implementation SXMutableComponents

- (id)description
{
  v2 = [(SXComponents *)self components];
  v3 = [v2 description];

  return v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v4 = objc_opt_class();
  v5 = [(SXMutableComponents *)self debugDescriptionForComponents:self depth:0];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p>\n%@", v4, self, v5];

  return v6;
}

- (id)debugDescriptionForComponents:(id)a3 depth:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v19 = a3;
  v5 = [MEMORY[0x263F089D8] string];
  for (unint64_t i = 2 * a4; i; --i)
    [v5 appendString:@" "];
  v7 = [MEMORY[0x263F089D8] string];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [v19 components];
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    unint64_t v11 = a4 + 1;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        [v7 appendFormat:@"%@%@\n", v5, v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v13 identifier];
          v15 = [v19 componentsForContainerComponentWithIdentifier:v14];

          v16 = [(SXMutableComponents *)self debugDescriptionForComponents:v15 depth:v11];
          [v7 appendString:v16];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v7;
}

@end