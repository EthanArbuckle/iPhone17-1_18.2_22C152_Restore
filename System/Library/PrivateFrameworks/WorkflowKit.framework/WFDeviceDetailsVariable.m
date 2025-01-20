@interface WFDeviceDetailsVariable
- (BOOL)isAvailable;
- (WFDeviceDetailsVariable)initWithAggrandizements:(id)a3;
- (id)icon;
- (id)name;
- (id)possibleContentClassesWithContext:(id)a3;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
@end

@implementation WFDeviceDetailsVariable

- (id)possibleContentClassesWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", NSClassFromString(&cfstr_Wfdevicedetail.isa), 0);
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB49C8]);
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  v4 = [v3 symbolName];
  v5 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v6 = [MEMORY[0x1E4FB4760] clearBackground];
  v7 = (void *)[v2 initWithSymbolName:v4 symbolColor:v5 background:v6];

  return v7;
}

- (id)name
{
  return WFLocalizedString(@"Device Details");
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a4;
  Class v5 = NSClassFromString(&cfstr_Wfdevicedetail.isa);
  v6 = [MEMORY[0x1E4FB46B8] currentDevice];
  v7 = [MEMORY[0x1E4FB46B8] currentDevice];
  v8 = [v7 name];
  v9 = [(objc_class *)v5 itemWithObject:v6 named:v8];

  v10 = (void *)MEMORY[0x1E4F5A830];
  v13[0] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [v10 collectionWithItems:v11];
  v4[2](v4, v12, 0);
}

- (WFDeviceDetailsVariable)initWithAggrandizements:(id)a3
{
  v4 = WFVariableDictionaryWithAggrandizements(a3);
  Class v5 = [(WFVariable *)self initWithDictionary:v4 variableProvider:0];

  return v5;
}

@end