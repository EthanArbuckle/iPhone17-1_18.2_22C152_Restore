@interface WFActionOutputVariable
- (BOOL)isAvailable;
- (BOOL)isRenamed;
- (NSString)name;
- (NSString)outputUUID;
- (WFAction)action;
- (WFActionOutputVariable)initWithAction:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5;
- (WFActionOutputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4;
- (WFActionOutputVariable)initWithOutputUUID:(id)a3 outputName:(id)a4 variableProvider:(id)a5 aggrandizements:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultName;
- (id)icon;
- (id)possibleContentClassesWithContext:(id)a3;
- (id)variableBySettingAggrandizements:(id)a3;
- (id)variableProvider;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
- (void)variableProvider:(id)a3 variableNameDidChangeTo:(id)a4;
@end

@implementation WFActionOutputVariable

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_destroyWeak((id *)&self->_variableProvider);
}

- (id)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return WeakRetained;
}

- (id)variableBySettingAggrandizements:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFActionOutputVariable;
  v4 = [(WFVariable *)&v7 variableBySettingAggrandizements:a3];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
      objc_storeWeak(v4 + 5, WeakRetained);
    }
    else
    {
      id WeakRetained = v4;
      v4 = 0;
    }
  }
  else
  {
    id WeakRetained = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFActionOutputVariable;
  v4 = [(WFVariable *)&v7 copyWithZone:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
    objc_storeWeak(v4 + 5, WeakRetained);
  }
  return v4;
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
    [v9 setObject:v10 forKey:@"OutputName"];
  }
  else
  {
    [v9 removeObjectForKey:@"OutputName"];
  }
  [(WFVariable *)self setDictionary:v9];
  v11.receiver = self;
  v11.super_class = (Class)WFActionOutputVariable;
  [(WFVariable *)&v11 variableProvider:v7 variableNameDidChangeTo:v6];
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v11 = [(WFActionOutputVariable *)self outputUUID];
  v9 = [v11 stringByAppendingString:@"-output"];
  v10 = [v8 contentForVariableWithName:v9];

  (*((void (**)(id, void *, void))a4 + 2))(v7, v10, 0);
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFActionOutputVariable *)self action];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  id v7 = [v5 workflow];
  id v8 = [v5 inheritedOutputContentClassesInWorkflow:v7 context:v4];

  v9 = (void *)[v6 initWithArray:v8];
  return v9;
}

- (BOOL)isRenamed
{
  v2 = [(WFActionOutputVariable *)self action];
  char v3 = [v2 outputIsRenamed];

  return v3;
}

- (NSString)name
{
  char v3 = [(WFActionOutputVariable *)self action];
  id v4 = [v3 outputName];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(WFVariable *)self dictionary];
    id v6 = [v7 objectForKey:@"OutputName"];
  }
  return (NSString *)v6;
}

- (id)defaultName
{
  v2 = [(WFActionOutputVariable *)self action];
  char v3 = [v2 localizedDefaultOutputName];

  return v3;
}

- (WFAction)action
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  if (!WeakRetained)
  {
    id v4 = [(WFActionOutputVariable *)self variableProvider];
    v5 = [(WFActionOutputVariable *)self outputUUID];
    id WeakRetained = [v4 actionProvidingVariableWithOutputUUID:v5];

    if (!WeakRetained)
    {
      id v6 = getWFGeneralLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        v9 = "-[WFActionOutputVariable action]";
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s No associated action found for WFActionOutputVariable", (uint8_t *)&v8, 0xCu);
      }

      id WeakRetained = 0;
    }
  }
  return (WFAction *)WeakRetained;
}

- (id)icon
{
  v2 = [(WFActionOutputVariable *)self action];
  char v3 = [v2 outputIcon];

  return v3;
}

- (NSString)outputUUID
{
  v2 = [(WFVariable *)self dictionary];
  char v3 = [v2 objectForKey:@"OutputUUID"];

  return (NSString *)v3;
}

- (BOOL)isAvailable
{
  char v3 = [(WFActionOutputVariable *)self variableProvider];
  id v4 = [(WFActionOutputVariable *)self outputUUID];
  char v5 = [v3 isVariableWithOutputUUIDAvailable:v4];

  return v5;
}

- (WFActionOutputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 objectForKey:@"OutputUUID"];
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
        v17.super_class = (Class)WFActionOutputVariable,
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

- (WFActionOutputVariable)initWithOutputUUID:(id)a3 outputName:(id)a4 variableProvider:(id)a5 aggrandizements:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFActionOutputVariable.m", 38, @"Invalid parameter not satisfying: %@", @"outputUUID" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFActionOutputVariable.m", 39, @"Invalid parameter not satisfying: %@", @"outputName" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  v15 = WFVariableDictionaryWithAggrandizements(v14);
  v16 = (void *)[v15 mutableCopy];

  [v16 setObject:v11 forKey:@"OutputUUID"];
  [v16 setObject:v12 forKey:@"OutputName"];
  objc_super v17 = [(WFActionOutputVariable *)self initWithDictionary:v16 variableProvider:v13];

  return v17;
}

- (WFActionOutputVariable)initWithAction:(id)a3 variableProvider:(id)a4 aggrandizements:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFActionOutputVariable.m", 24, @"Invalid parameter not satisfying: %@", @"variableProvider" object file lineNumber description];
  }
  id v12 = [v9 outputName];
  id v13 = [v9 generateUUIDIfNecessaryWithUUIDProvider:0];
  id v14 = [(WFActionOutputVariable *)self initWithOutputUUID:v13 outputName:v12 variableProvider:v10 aggrandizements:v11];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_action, v9);
    v16 = v15;
  }

  return v15;
}

@end