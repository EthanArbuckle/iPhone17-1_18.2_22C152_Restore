@interface WFShortcutInputVariable
- (BOOL)isAvailable;
- (WFShortcutInputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4;
- (WFShortcutInputVariable)initWithVariableProvider:(id)a3 aggrandizements:(id)a4;
- (id)icon;
- (id)name;
- (id)possibleContentClassesWithContext:(id)a3;
- (id)variableProvider;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
@end

@implementation WFShortcutInputVariable

- (void).cxx_destruct
{
}

- (id)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return WeakRetained;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v5 = [(WFShortcutInputVariable *)self variableProvider];
  v6 = [v5 workflowInputClasses];
  v7 = (void *)[v4 initWithArray:v6];

  return v7;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB49C8]);
  v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  id v4 = [MEMORY[0x1E4FB4760] clearBackground];
  v5 = (void *)[v2 initWithSymbolName:@"arrow.down.app.2.stack.3d" symbolColor:v3 background:v4];

  return v5;
}

- (id)name
{
  return WFLocalizedString(@"Shortcut Input");
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 workflowInput];
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
}

- (WFShortcutInputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFShortcutInputVariable;
  id v7 = [(WFVariable *)&v11 initWithDictionary:a3 variableProvider:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_variableProvider, v6);
    v9 = v8;
  }

  return v8;
}

- (WFShortcutInputVariable)initWithVariableProvider:(id)a3 aggrandizements:(id)a4
{
  id v6 = a3;
  id v7 = WFVariableDictionaryWithAggrandizements(a4);
  v8 = [(WFShortcutInputVariable *)self initWithDictionary:v7 variableProvider:v6];

  return v8;
}

@end