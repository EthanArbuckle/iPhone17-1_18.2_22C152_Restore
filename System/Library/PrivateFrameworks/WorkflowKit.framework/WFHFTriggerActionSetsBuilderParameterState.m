@interface WFHFTriggerActionSetsBuilderParameterState
- (BOOL)isEqual:(id)a3;
- (HFTriggerActionSetsBuilder)triggerActionSetsBuilder;
- (HMHome)home;
- (NSArray)actionSets;
- (NSArray)containedVariables;
- (NSArray)serializedActionSets;
- (NSString)homeIdentifier;
- (WFHFTriggerActionSetsBuilderParameterState)initWithActionSets:(id)a3 homeIdentifier:(id)a4;
- (WFHFTriggerActionSetsBuilderParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPropertyListObject)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFHFTriggerActionSetsBuilderParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedActionSets, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

- (NSArray)serializedActionSets
{
  return self->_serializedActionSets;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WFHFTriggerActionSetsBuilderParameterState *)self serializedActionSets];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];
  id v7 = (id)[v3 combine:v6];

  unint64_t v8 = [v3 finalize];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFHFTriggerActionSetsBuilderParameterState *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFHFTriggerActionSetsBuilderParameterState *)v4 serializedActionSets];
      v6 = [(WFHFTriggerActionSetsBuilderParameterState *)self serializedActionSets];
      if ([v5 isEqual:v6])
      {
        id v7 = [(WFHFTriggerActionSetsBuilderParameterState *)v4 homeIdentifier];
        unint64_t v8 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFHFTriggerActionSetsBuilderParameterState *)self serializedActionSets];
  [v3 setObject:v4 forKeyedSubscript:@"WFHFTriggerActionSetsBuilderParameterStateActionSets"];

  id v5 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];

  if (v5)
  {
    v6 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];
    [v3 setObject:v6 forKeyedSubscript:@"WFHFTriggerActionSetsBuilderParameterStateHome"];
  }
  return (WFPropertyListObject *)v3;
}

- (WFHFTriggerActionSetsBuilderParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFHFTriggerActionSetsBuilderParameterState;
  id v7 = [(WFHFTriggerActionSetsBuilderParameterState *)&v15 init];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v6;
    uint64_t v9 = [v8 objectForKeyedSubscript:@"WFHFTriggerActionSetsBuilderParameterStateHome"];
    homeIdentifier = v7->_homeIdentifier;
    v7->_homeIdentifier = (NSString *)v9;

    uint64_t v11 = [v8 objectForKeyedSubscript:@"WFHFTriggerActionSetsBuilderParameterStateActionSets"];

    serializedActionSets = v7->_serializedActionSets;
    v7->_serializedActionSets = (NSArray *)v11;

    v13 = v7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFHFTriggerActionSetsBuilderParameterState)initWithActionSets:(id)a3 homeIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHFTriggerActionSetsBuilderParameterState.m", 76, @"Invalid parameter not satisfying: %@", @"homeIdentifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFHFTriggerActionSetsBuilderParameterState;
  uint64_t v9 = [(WFHFTriggerActionSetsBuilderParameterState *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    homeIdentifier = v9->_homeIdentifier;
    v9->_homeIdentifier = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_37698);
    serializedActionSets = v9->_serializedActionSets;
    v9->_serializedActionSets = (NSArray *)v12;

    v14 = v9;
  }

  return v9;
}

uint64_t __80__WFHFTriggerActionSetsBuilderParameterState_initWithActionSets_homeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortcutsDictionaryRepresentation];
}

- (HFTriggerActionSetsBuilder)triggerActionSetsBuilder
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(WFHFTriggerActionSetsBuilderParameterState *)self home];
  if (v3)
  {
    v4 = [(WFHFTriggerActionSetsBuilderParameterState *)self actionSets];
    id v5 = (void *)[objc_alloc(getHFTriggerActionSetsBuilderClass_37708()) initWithActionSets:v4 inHome:v3];
  }
  else
  {
    id v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];
      int v9 = 136315394;
      uint64_t v10 = "-[WFHFTriggerActionSetsBuilderParameterState triggerActionSetsBuilder]";
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to find home with identifier: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v5 = 0;
  }

  return (HFTriggerActionSetsBuilder *)v5;
}

- (NSArray)actionSets
{
  v3 = [(WFHFTriggerActionSetsBuilderParameterState *)self home];
  if (v3)
  {
    v4 = [(WFHFTriggerActionSetsBuilderParameterState *)self serializedActionSets];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__WFHFTriggerActionSetsBuilderParameterState_actionSets__block_invoke;
    v7[3] = &unk_1E6552788;
    id v8 = v3;
    id v5 = objc_msgSend(v4, "if_compactMap:", v7);
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

id __56__WFHFTriggerActionSetsBuilderParameterState_actionSets__block_invoke(uint64_t a1, void *a2)
{
  v3 = (Class (__cdecl *)())getHMActionSetClass;
  id v4 = a2;
  id v5 = (void *)[objc_alloc(v3()) initWithShortcutsDictionaryRepresentation:v4 home:*(void *)(a1 + 32)];

  return v5;
}

- (HMHome)home
{
  v3 = +[WFHomeManager sharedManager];
  id v4 = [(WFHFTriggerActionSetsBuilderParameterState *)self homeIdentifier];
  id v5 = [v3 homeWithIdentifier:v4];

  return (HMHome *)v5;
}

@end