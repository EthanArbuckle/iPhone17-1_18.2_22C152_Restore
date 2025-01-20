@interface WFVariableSuggester
- (NSArray)currentVariables;
- (NSArray)outputActions;
- (NSArray)suggestedVariables;
- (NSArray)userDefinedVariableNames;
- (WFVariableProvider)variableProvider;
- (WFVariableSuggester)init;
- (WFVariableSuggesterDelegate)delegate;
- (unint64_t)maxSuggestionsCount;
- (unint64_t)minSuggestionsCount;
- (void)availableVariablesDidChange;
- (void)setCurrentVariables:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxSuggestionsCount:(unint64_t)a3;
- (void)setMinSuggestionsCount:(unint64_t)a3;
- (void)setOutputActions:(id)a3;
- (void)setSuggestedVariables:(id)a3;
- (void)setUserDefinedVariableNames:(id)a3;
- (void)setVariableProvider:(id)a3;
@end

@implementation WFVariableSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputActions, 0);
  objc_storeStrong((id *)&self->_userDefinedVariableNames, 0);
  objc_storeStrong((id *)&self->_currentVariables, 0);
  objc_storeStrong((id *)&self->_suggestedVariables, 0);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)minSuggestionsCount
{
  return self->_minSuggestionsCount;
}

- (unint64_t)maxSuggestionsCount
{
  return self->_maxSuggestionsCount;
}

- (NSArray)outputActions
{
  return self->_outputActions;
}

- (NSArray)userDefinedVariableNames
{
  return self->_userDefinedVariableNames;
}

- (NSArray)currentVariables
{
  return self->_currentVariables;
}

- (NSArray)suggestedVariables
{
  return self->_suggestedVariables;
}

- (void)setVariableProvider:(id)a3
{
}

- (WFVariableProvider)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return (WFVariableProvider *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFVariableSuggesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFVariableSuggesterDelegate *)WeakRetained;
}

- (void)availableVariablesDidChange
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v33 = [(WFVariableSuggester *)self outputActions];
  v31 = [(WFVariableSuggester *)self userDefinedVariableNames];
  v3 = [(WFVariableSuggester *)self currentVariables];
  v32 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_49401);

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v32];
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v7 = [v33 reverseObjectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v12 = [v11 outputName];
        if (([v5 containsObject:v12] & 1) == 0)
        {
          [v5 addObject:v12];
          if ([v4 containsObject:v12]) {
            [v6 insertObject:v11 atIndex:0];
          }
          else {
            [v6 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v8);
  }

  unint64_t v13 = [(WFVariableSuggester *)self maxSuggestionsCount];
  uint64_t v14 = [v31 count];
  uint64_t v15 = [v6 count];
  if ((uint64_t)(v13 - v14) >= v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v13 - v14;
  }
  unint64_t v17 = [v6 count];
  unint64_t v18 = [(WFVariableSuggester *)self minSuggestionsCount];
  if (v17 >= v18) {
    int64_t v19 = v18;
  }
  else {
    int64_t v19 = v17;
  }
  if (v16 <= v19) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = v16;
  }
  v21 = objc_msgSend(v6, "subarrayWithRange:", 0, v20);
  v34 = (void *)[v21 mutableCopy];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v34];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_2;
  v40[3] = &unk_1E6554B98;
  id v30 = v22;
  id v41 = v30;
  v23 = objc_msgSend(v6, "if_compactMap:", v40);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v24 = [v34 reverseObjectEnumerator];
  v25 = [v24 allObjects];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_3;
  v35[3] = &unk_1E6554BC0;
  v38 = v39;
  id v26 = v23;
  id v36 = v26;
  v37 = self;
  v27 = objc_msgSend(v25, "if_map:", v35);
  v28 = [v27 reverseObjectEnumerator];
  v29 = [v28 allObjects];
  [(WFVariableSuggester *)self setSuggestedVariables:v29];

  _Block_object_dispose(v39, 8);
}

id __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 outputName];
  v5 = [v3 localizedDefaultOutputName];
  int v6 = [v4 isEqualToString:v5];

  if ([*(id *)(a1 + 32) containsObject:v3] | v6) {
    v7 = 0;
  }
  else {
    v7 = v3;
  }
  id v8 = v7;

  return v8;
}

WFActionOutputVariable *__50__WFVariableSuggester_availableVariablesDidChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 outputName];
  v5 = [v3 localizedDefaultOutputName];
  int v6 = [v4 isEqualToString:v5];

  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 <= 4)
  {
    int v8 = v7 < [*(id *)(a1 + 32) count] ? v6 : 0;
    if (v8 == 1)
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "count") + ~*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));

      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v3 = (id)v9;
    }
  }
  v10 = [WFActionOutputVariable alloc];
  v11 = [*(id *)(a1 + 40) variableProvider];
  v12 = [(WFActionOutputVariable *)v10 initWithAction:v3 variableProvider:v11 aggrandizements:0];

  return v12;
}

id __50__WFVariableSuggester_availableVariablesDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 action];
    v4 = [v3 outputName];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMinSuggestionsCount:(unint64_t)a3
{
  if (self->_minSuggestionsCount != a3)
  {
    self->_minSuggestionsCount = a3;
    [(WFVariableSuggester *)self availableVariablesDidChange];
  }
}

- (void)setMaxSuggestionsCount:(unint64_t)a3
{
  if (self->_maxSuggestionsCount != a3)
  {
    self->_maxSuggestionsCount = a3;
    [(WFVariableSuggester *)self availableVariablesDidChange];
  }
}

- (void)setOutputActions:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_outputActions] & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    outputActions = self->_outputActions;
    self->_outputActions = v4;
  }
}

- (void)setUserDefinedVariableNames:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_userDefinedVariableNames] & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    userDefinedVariableNames = self->_userDefinedVariableNames;
    self->_userDefinedVariableNames = v4;
  }
}

- (void)setCurrentVariables:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_currentVariables] & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    currentVariables = self->_currentVariables;
    self->_currentVariables = v4;

    [(WFVariableSuggester *)self availableVariablesDidChange];
  }
}

- (void)setSuggestedVariables:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_suggestedVariables] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedVariables, a3);
    v5 = [(WFVariableSuggester *)self delegate];
    [v5 variableSuggesterSuggestionsDidChange:self];
  }
}

- (WFVariableSuggester)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFVariableSuggester;
  id v2 = [(WFVariableSuggester *)&v6 init];
  id v3 = (WFVariableSuggester *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 56) = xmmword_1C856C730;
    v4 = v2;
  }

  return v3;
}

@end