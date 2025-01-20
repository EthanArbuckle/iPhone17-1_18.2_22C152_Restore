@interface WFCurrentAppVariable
- (BOOL)isAvailable;
- (WFCurrentAppVariable)initWithAggrandizements:(id)a3;
- (id)icon;
- (id)name;
- (id)possibleContentClassesWithContext:(id)a3;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
@end

@implementation WFCurrentAppVariable

- (id)possibleContentClassesWithContext:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 orderedSetWithObject:v4];
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB49C8]);
  v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  uint64_t v4 = [MEMORY[0x1E4FB4760] clearBackground];
  v5 = (void *)[v2 initWithSymbolName:@"app.dashed" symbolColor:v3 background:v4];

  return v5;
}

- (id)name
{
  return WFLocalizedString(@"Current App");
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v5 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__WFCurrentAppVariable_retrieveContentCollectionWithVariableSource_completionHandler___block_invoke;
  v7[3] = &unk_1E65586C8;
  id v8 = v4;
  id v6 = v4;
  [v5 getCurrentAppWithCompletionHandler:v7];
}

void __86__WFCurrentAppVariable_retrieveContentCollectionWithVariableSource_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (WFCurrentAppVariable)initWithAggrandizements:(id)a3
{
  id v4 = WFVariableDictionaryWithAggrandizements(a3);
  id v5 = [(WFVariable *)self initWithDictionary:v4 variableProvider:0];

  return v5;
}

@end