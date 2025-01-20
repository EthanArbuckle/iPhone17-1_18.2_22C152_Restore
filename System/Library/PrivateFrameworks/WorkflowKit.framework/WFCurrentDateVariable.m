@interface WFCurrentDateVariable
- (BOOL)isAvailable;
- (WFCurrentDateVariable)initWithAggrandizements:(id)a3;
- (id)icon;
- (id)name;
- (id)possibleContentClassesWithContext:(id)a3;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
@end

@implementation WFCurrentDateVariable

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
  v5 = (void *)[v2 initWithSymbolName:@"calendar" symbolColor:v3 background:v4];

  return v5;
}

- (id)name
{
  return WFLocalizedString(@"Current Date");
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F5A8A8];
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  v6 = (void (**)(id, void *, void))a4;
  v7 = [v5 date];
  v8 = [v4 itemWithObject:v7];

  v9 = (void *)MEMORY[0x1E4F5A830];
  v12[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v11 = [v9 collectionWithItems:v10];
  v6[2](v6, v11, 0);
}

- (WFCurrentDateVariable)initWithAggrandizements:(id)a3
{
  uint64_t v4 = WFVariableDictionaryWithAggrandizements(a3);
  v5 = [(WFVariable *)self initWithDictionary:v4 variableProvider:0];

  return v5;
}

@end