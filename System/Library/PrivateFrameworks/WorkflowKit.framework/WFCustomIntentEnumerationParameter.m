@interface WFCustomIntentEnumerationParameter
- (Class)singleStateClass;
- (INCodableEnumAttribute)enumAttribute;
- (NSArray)possibleStates;
- (NSDictionary)enumNamesToKeys;
- (NSDictionary)enumNamesToLabels;
- (NSDictionary)keysToEnumNames;
- (WFCustomIntentEnumerationParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation WFCustomIntentEnumerationParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumNamesToLabels, 0);
  objc_storeStrong((id *)&self->_keysToEnumNames, 0);
  objc_storeStrong((id *)&self->_enumNamesToKeys, 0);
  objc_storeStrong((id *)&self->_enumAttribute, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (NSDictionary)enumNamesToLabels
{
  return self->_enumNamesToLabels;
}

- (NSDictionary)keysToEnumNames
{
  return self->_keysToEnumNames;
}

- (NSDictionary)enumNamesToKeys
{
  return self->_enumNamesToKeys;
}

- (INCodableEnumAttribute)enumAttribute
{
  return self->_enumAttribute;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  uint64_t v4 = [a3 value];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFCustomIntentEnumerationParameter *)self keysToEnumNames];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v5;
    }
    id v10 = v9;

    v11 = [(WFCustomIntentEnumerationParameter *)self enumNamesToLabels];
    v12 = [v11 objectForKeyedSubscript:v10];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSArray)possibleStates
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    uint64_t v4 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = [(WFCustomIntentEnumerationParameter *)self enumAttribute];
    v6 = [v5 codableEnum];
    uint64_t v7 = [v6 values];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v12 index])
          {
            v13 = [(WFCustomIntentEnumerationParameter *)self enumNamesToKeys];
            v14 = [v12 name];
            v15 = [v13 objectForKeyedSubscript:v14];
            v16 = v15;
            if (v15)
            {
              id v17 = v15;
            }
            else
            {
              id v17 = [v12 name];
            }
            v18 = v17;

            v19 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v18];
            [v4 addObject:v19];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    v20 = (NSArray *)[v4 copy];
    v21 = self->_possibleStates;
    self->_possibleStates = v20;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (WFCustomIntentEnumerationParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFCustomIntentEnumerationParameter;
  v5 = [(WFEnumerationParameter *)&v27 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"EnumAttribute"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    enumAttribute = v5->_enumAttribute;
    v5->_enumAttribute = (INCodableEnumAttribute *)v8;

    uint64_t v10 = [v4 objectForKey:@"IntentEnumOverrides"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = WFEnforceClass(v10, v11);
    enumNamesToKeys = v5->_enumNamesToKeys;
    v5->_enumNamesToKeys = (NSDictionary *)v12;

    v14 = objc_opt_new();
    v15 = v5->_enumNamesToKeys;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__WFCustomIntentEnumerationParameter_initWithDefinition___block_invoke;
    v25[3] = &unk_1E6554C00;
    v16 = v14;
    long long v26 = v16;
    [(NSDictionary *)v15 enumerateKeysAndObjectsUsingBlock:v25];
    keysToEnumNames = v5->_keysToEnumNames;
    v5->_keysToEnumNames = v16;
    v18 = v16;

    v19 = [v4 objectForKey:@"EnumNamesToLabel"];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = WFEnforceClass(v19, v20);
    enumNamesToLabels = v5->_enumNamesToLabels;
    v5->_enumNamesToLabels = (NSDictionary *)v21;

    long long v23 = v5;
  }

  return v5;
}

uint64_t __57__WFCustomIntentEnumerationParameter_initWithDefinition___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end