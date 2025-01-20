@interface SXLineBalancingComponentTextStyleModifier
- (SXLineBalancingComponentTextStyleModifier)initWithSettings:(id)a3;
- (SXLineBalancingSettings)settings;
- (void)enableLineBalancingForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXLineBalancingComponentTextStyleModifier

- (SXLineBalancingComponentTextStyleModifier)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLineBalancingComponentTextStyleModifier;
  v6 = [(SXLineBalancingComponentTextStyleModifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SXLineBalancingSettings *)self->_settings enableLineBalancing])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = objc_msgSend(v6, "componentTextStyles", 0);
    objc_super v9 = [v8 allKeys];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(SXLineBalancingComponentTextStyleModifier *)self enableLineBalancingForComponentTextStyleWithIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * v13++) DOM:v6 context:v7];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)enableLineBalancingForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = [v7 componentTextStyles];
  uint64_t v10 = [v9 objectForKey:v18];

  if ([v10 textAlignment] == 2)
  {
    uint64_t v11 = [v10 JSONRepresentation];
    uint64_t v12 = v11;
    if (!v11) {
      uint64_t v11 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v13 = (void *)[v11 mutableCopy];

    [v13 setObject:MEMORY[0x263EFFA88] forKey:@"lineBalancing"];
    long long v14 = [SXComponentTextStyle alloc];
    long long v15 = [v8 specVersion];
    uint64_t v16 = [(SXJSONObject *)v14 initWithJSONObject:v13 andVersion:v15];

    long long v17 = [v7 componentTextStyles];
    [v17 setObject:v16 forKey:v18];

    uint64_t v10 = (void *)v16;
  }
}

- (SXLineBalancingSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end