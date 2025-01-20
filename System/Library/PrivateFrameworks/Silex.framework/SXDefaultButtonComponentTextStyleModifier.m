@interface SXDefaultButtonComponentTextStyleModifier
- (BOOL)shouldReturnUnmodifiedDOM;
- (void)modifyDOM:(id)a3 context:(id)a4;
- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3;
@end

@implementation SXDefaultButtonComponentTextStyleModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_shouldReturnUnmodifiedDOM)
  {
    v8 = +[SXButtonComponentClassification typeString];
    v9 = +[SXComponentClassification classificationForComponentWithType:v8];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v10 = objc_msgSend(v9, "defaultTextStyleIdentifiers", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v16 = [v6 componentTextStyles];
          v17 = [v16 objectForKey:v15];

          if (v17 && [(SXComponentTextStyle *)v17 textAlignment])
          {
            self->_shouldReturnUnmodifiedDOM = 1;
            goto LABEL_17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v18 = +[SXButtonComponentClassification typeString];
    v10 = SXDefaultTextStyleIdentifierForRole((uint64_t)v18);

    v19 = [v6 componentTextStyles];
    v20 = [v19 objectForKey:v10];

    v21 = [v20 JSONRepresentation];
    v22 = v21;
    if (!v21) {
      v21 = (void *)MEMORY[0x263EFFA78];
    }
    v23 = (void *)[v21 mutableCopy];

    [v23 setObject:@"center" forKey:@"textAlignment"];
    v24 = [v20 identifier];

    if (!v24) {
      [v23 setObject:v10 forKey:@"identifier"];
    }
    v25 = [SXComponentTextStyle alloc];
    v26 = [v7 specVersion];
    v17 = [(SXJSONObject *)v25 initWithJSONObject:v23 andVersion:v26];

    v27 = [v6 componentTextStyles];
    [v27 setObject:v17 forKey:v10];

LABEL_17:
  }
}

- (BOOL)shouldReturnUnmodifiedDOM
{
  return self->_shouldReturnUnmodifiedDOM;
}

- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3
{
  self->_shouldReturnUnmodifiedDOM = a3;
}

@end