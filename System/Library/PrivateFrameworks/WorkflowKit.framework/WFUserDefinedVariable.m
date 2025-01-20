@interface WFUserDefinedVariable
- (BOOL)isAvailable;
- (BOOL)requiresModernVariableSupport;
- (NSString)name;
- (WFUserDefinedVariable)initWithDictionary:(id)a3 variableProvider:(id)a4;
- (WFUserDefinedVariable)initWithName:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5;
- (id)icon;
- (id)possibleContentClassesWithContext:(id)a3;
- (id)variableProvider;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
- (void)variableProvider:(id)a3 variableNameDidChangeTo:(id)a4;
@end

@implementation WFUserDefinedVariable

- (void).cxx_destruct
{
}

- (id)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return WeakRetained;
}

- (void)variableProvider:(id)a3 variableNameDidChangeTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFVariable *)self dictionary];
  v9 = (void *)[v8 mutableCopy];

  if (v6)
  {
    v10 = (void *)[v6 copy];
    [v9 setObject:v10 forKey:@"VariableName"];
  }
  else
  {
    [v9 removeObjectForKey:@"VariableName"];
  }
  [(WFVariable *)self setDictionary:v9];
  v11.receiver = self;
  v11.super_class = (Class)WFUserDefinedVariable;
  [(WFVariable *)&v11 variableProvider:v7 variableNameDidChangeTo:v6];
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  v10 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = [(WFVariable *)self dictionary];
  v8 = [v7 objectForKey:@"VariableName"];
  id v9 = [v6 contentForVariableWithName:v8];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F5A830]);
  }
  v10[2](v10, v9, 0);
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFUserDefinedVariable *)self variableProvider];
  id v6 = [(WFVariable *)self dictionary];
  id v7 = [v6 objectForKey:@"VariableName"];
  v8 = [v5 possibleContentClassesForVariableNamed:v7 context:v4];

  return v8;
}

- (NSString)name
{
  v2 = [(WFVariable *)self dictionary];
  uint64_t v3 = [v2 objectForKey:@"VariableName"];
  id v4 = (void *)v3;
  v5 = &stru_1F229A4D8;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  if ([(__CFString *)v6 hasPrefix:@"Repeat Item"])
  {
    id v7 = WFLocalizedString(@"Repeat Item");
    v8 = @"Repeat Item %d";
  }
  else
  {
    if (![(__CFString *)v6 hasPrefix:@"Repeat Index"]) {
      goto LABEL_8;
    }
    id v7 = WFLocalizedString(@"Repeat Index");
    v8 = @"Repeat Index %d";
  }
  id v9 = WFLocalizedString(v8);
  uint64_t v10 = WFLocalizedRepeatActionVariableName(v6, v7, v9);

  id v6 = (__CFString *)v10;
LABEL_8:
  return (NSString *)v6;
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x1E4FB4778]);
  uint64_t v3 = [MEMORY[0x1E4FB4770] workflowKitImageNamed:@"Variable"];
  id v4 = (void *)[v2 initWithImage:v3];

  return v4;
}

- (BOOL)requiresModernVariableSupport
{
  id v2 = [(WFVariable *)self aggrandizements];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isAvailable
{
  BOOL v3 = [(WFUserDefinedVariable *)self variableProvider];
  id v4 = [(WFVariable *)self dictionary];
  v5 = [v4 objectForKey:@"VariableName"];
  char v6 = [v3 isVariableWithNameAvailable:v5];

  return v6;
}

- (WFUserDefinedVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"VariableName"];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "WFEnforceClass";
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      id v13 = v23;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }

  if (v11
    && (v17.receiver = self,
        v17.super_class = (Class)WFUserDefinedVariable,
        v14 = [(WFVariable *)&v17 initWithDictionary:v6 variableProvider:v7],
        (self = v14) != 0))
  {
    objc_storeWeak((id *)&v14->_variableProvider, v7);
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WFUserDefinedVariable)initWithName:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFUserDefinedVariable.m", 23, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v12 = WFVariableDictionaryWithAggrandizements(v11);
  id v13 = (void *)[v12 mutableCopy];

  [v13 setObject:v9 forKey:@"VariableName"];
  v14 = [(WFUserDefinedVariable *)self initWithDictionary:v13 variableProvider:v10];

  return v14;
}

@end