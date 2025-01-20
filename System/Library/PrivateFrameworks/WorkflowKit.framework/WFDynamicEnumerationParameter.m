@interface WFDynamicEnumerationParameter
- (BOOL)allowsMultipleValues;
- (BOOL)dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation;
- (BOOL)dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation;
- (BOOL)isAsynchronous;
- (BOOL)loadsDefaultStateAsynchronously;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)shouldAlwaysReloadPossibleStates;
- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged;
- (INObjectCollection)possibleStatesCollection;
- (NSArray)possibleStates;
- (NSError)possibleStatesLoadingError;
- (WFDynamicEnumerationDataSource)dataSource;
- (id)accessoryColorForPossibleState:(id)a3;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)localizedSubtitleLabelForPossibleState:(id)a3;
- (id)possibleStatesForLocalization;
- (unint64_t)defaultValueLoadingState;
- (unint64_t)possibleStatesLoadingState;
- (void)clearPossibleStates;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)defaultSerializedRepresentationDidChange;
- (void)loadDefaultSerializedRepresentationWithCompletionHandler:(id)a3;
- (void)loadPossibleStatesWithCompletionHandler:(id)a3;
- (void)possibleStatesDidChange;
- (void)reloadPossibleStates;
- (void)setDataSource:(id)a3;
- (void)setDefaultValueLoadingState:(unint64_t)a3;
- (void)setPossibleStates:(id)a3;
- (void)setPossibleStatesCollection:(id)a3;
- (void)setPossibleStatesFromRemoteSource:(id)a3;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3;
@end

@implementation WFDynamicEnumerationParameter

- (id)defaultSerializedRepresentation
{
  unint64_t v3 = [(WFDynamicEnumerationParameter *)self defaultValueLoadingState];
  if (v3 - 2 < 2)
  {
    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
LABEL_6:
    v8 = defaultSerializedRepresentation;
    goto LABEL_10;
  }
  if (v3) {
    goto LABEL_9;
  }
  if ([(WFDynamicEnumerationParameter *)self dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation])
  {
    v5 = [(WFDynamicEnumerationParameter *)self dataSource];
    v6 = [v5 defaultSerializedRepresentationForEnumeration:self];
    v7 = self->_defaultSerializedRepresentation;
    self->_defaultSerializedRepresentation = v6;

    [(WFDynamicEnumerationParameter *)self setDefaultValueLoadingState:2];
    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
    goto LABEL_6;
  }
  if ([(WFDynamicEnumerationParameter *)self dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation])
  {
    [(WFDynamicEnumerationParameter *)self loadDefaultSerializedRepresentationWithCompletionHandler:0];
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFDynamicEnumerationParameter;
  v8 = [(WFParameter *)&v10 defaultSerializedRepresentation];
LABEL_10:
  return v8;
}

- (unint64_t)defaultValueLoadingState
{
  return self->_defaultValueLoadingState;
}

- (void)loadPossibleStatesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if ([(WFDynamicEnumerationParameter *)self isAsynchronous])
  {
    if ([(WFDynamicEnumerationParameter *)self possibleStatesLoadingState] == 1)
    {
      v5 = [(WFDynamicEnumerationParameter *)self possibleStatesLoadingError];
      v4[2](v4, v5);
    }
    else
    {
      self->_possibleStatesLoadingState = 1;
      v6 = [(WFDynamicEnumerationParameter *)self dataSource];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke;
      v7[3] = &unk_1E6556648;
      v7[4] = self;
      v8 = v4;
      [v6 loadPossibleStatesForEnumeration:self searchTerm:0 completionHandler:v7];
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (unint64_t)possibleStatesLoadingState
{
  return self->_possibleStatesLoadingState;
}

- (BOOL)isAsynchronous
{
  v2 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  v6 = [v5 enumeration:self localizedLabelForPossibleState:v4];

  return v6;
}

uint64_t __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (!v3)
  {
    [v2 setDefaultValueLoadingState:2];
    v8 = *(void **)(a1 + 48);
    id v9 = *(id *)(*(void *)(a1 + 40) + 232);
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      v11 = v10;
      if (v9) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
      }
      else
      {
        char v13 = [v9 isEqual:v10];

        if (v13) {
          goto LABEL_16;
        }
      }
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 232), *(id *)(a1 + 48));
      v14.receiver = *(id *)(a1 + 40);
      v14.super_class = (Class)WFDynamicEnumerationParameter;
      objc_msgSendSuper2(&v14, sel_defaultSerializedRepresentationDidChange);
    }
LABEL_16:
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  [v2 setDefaultValueLoadingState:0];
  id v4 = getWFGeneralLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [*(id *)(a1 + 32) localizedDescription];
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFDynamicEnumerationParameter loadDefaultSerializedRepresentationWithCompletionHandler:]_block_invoke_2";
    __int16 v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Error loading default serialized representation for dynamic enumeration: %{error}@", buf, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(WFDynamicEnumerationParameter *)self dataSource];
    v8 = [v7 enumeration:self accessoryImageForPossibleState:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    v8 = [(WFEnumerationParameter *)&v10 accessoryImageForPossibleState:v4];
  }

  return v8;
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(WFDynamicEnumerationParameter *)self dataSource];
    v8 = [v7 enumeration:self localizedSubtitleLabelForPossibleState:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    v8 = [(WFEnumerationParameter *)&v10 localizedSubtitleLabelForPossibleState:v4];
  }

  return v8;
}

- (void)loadDefaultSerializedRepresentationWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if ([(WFDynamicEnumerationParameter *)self defaultValueLoadingState]
    || ![(WFDynamicEnumerationParameter *)self loadsDefaultStateAsynchronously])
  {
    if (v4)
    {
      char v6 = [(WFDynamicEnumerationParameter *)self defaultSerializedRepresentation];
      v4[2](v4, v6, 0);
    }
  }
  else
  {
    [(WFDynamicEnumerationParameter *)self setDefaultValueLoadingState:1];
    v5 = [(WFDynamicEnumerationParameter *)self dataSource];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E654FD70;
    v7[4] = self;
    v8 = v4;
    [v5 loadDefaultSerializedRepresentationForEnumeration:self completionHandler:v7];
  }
}

- (void)setDefaultValueLoadingState:(unint64_t)a3
{
  self->_defaultValueLoadingState = a3;
}

- (BOOL)loadsDefaultStateAsynchronously
{
  if ([(WFDynamicEnumerationParameter *)self dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation])
  {
    return 0;
  }
  return [(WFDynamicEnumerationParameter *)self dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation];
}

- (BOOL)dataSourceSupportsSynchronousFetchingOfDefaultSerializedRepresentation
{
  uint64_t v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = v5;
  if (v4) {
    char v7 = [v5 shouldLoadDefaultStateAsynchronouslyForEnumeration:self] ^ 1;
  }
  else {
    char v7 = objc_opt_respondsToSelector();
  }

  return v7 & 1;
}

- (BOOL)dataSourceSupportsAsynchronousFetchingOfDefaultSerializedRepresentation
{
  uint64_t v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = v5;
  if (v4) {
    char v7 = [v5 shouldLoadDefaultStateAsynchronouslyForEnumeration:self];
  }
  else {
    char v7 = objc_opt_respondsToSelector();
  }
  char v8 = v7;

  return v8 & 1;
}

- (WFDynamicEnumerationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WFDynamicEnumerationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  char v7 = [WeakRetained isEqual:v5];

  objc_storeWeak((id *)p_dataSource, v5);
  if ((v7 & 1) == 0)
  {
    [(WFDynamicEnumerationParameter *)self clearPossibleStates];
    if (self->_defaultSerializedRepresentation)
    {
      [(WFDynamicEnumerationParameter *)self defaultSerializedRepresentationDidChange];
    }
  }
}

- (void)clearPossibleStates
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  possibleStatesCollection = self->_possibleStatesCollection;
  self->_possibleStatesCollection = 0;

  self->_possibleStatesLoadingState = 0;
}

- (INObjectCollection)possibleStatesCollection
{
  return self->_possibleStatesCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStatesLoadingError, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleStatesCollection, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

void __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__WFDynamicEnumerationParameter_loadDefaultSerializedRepresentationWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E65586A0;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 256) = 2;
  [*(id *)(a1 + 32) setPossibleStatesCollection:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) possibleStatesLoadingError];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)setPossibleStatesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_possibleStatesCollection, a3);
  id v5 = a3;
  id v6 = [v5 allItems];

  [(WFDynamicEnumerationParameter *)self setPossibleStates:v6];
}

- (void)setPossibleStates:(id)a3
{
  char v4 = (NSArray *)[a3 copy];
  possibleStates = self->_possibleStates;
  self->_possibleStates = v4;

  [(WFDynamicEnumerationParameter *)self possibleStatesDidChange];
}

- (NSError)possibleStatesLoadingError
{
  return self->_possibleStatesLoadingError;
}

- (void)possibleStatesDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)WFDynamicEnumerationParameter;
  [(WFEnumerationParameter *)&v2 possibleStatesDidChange];
}

void __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__WFDynamicEnumerationParameter_loadPossibleStatesWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E65586A0;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(WFDynamicEnumerationParameter *)self possibleStatesLoadingState] == 3
    && ([(WFDynamicEnumerationParameter *)self possibleStates],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        v15))
  {
    v22.receiver = self;
    v22.super_class = (Class)WFDynamicEnumerationParameter;
    [(WFEnumerationParameter *)&v22 createDialogRequestWithAttribution:v10 defaultState:v11 prompt:v12 completionHandler:v13];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __106__WFDynamicEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v16[3] = &unk_1E654FD98;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    v20 = self;
    id v21 = v13;
    [(WFDynamicEnumerationParameter *)self loadPossibleStatesWithCompletionHandler:v16];
  }
}

id __106__WFDynamicEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  v6.receiver = *(id *)(a1 + 56);
  v6.super_class = (Class)WFDynamicEnumerationParameter;
  return objc_msgSendSuper2(&v6, sel_createDialogRequestWithAttribution_defaultState_prompt_completionHandler_, v1, v2, v3, v4);
}

- (BOOL)shouldAlwaysReloadPossibleStates
{
  uint64_t v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = [v5 enumerationShouldAlwaysReloadPossibleStates:self];

  return v6;
}

- (void)defaultSerializedRepresentationDidChange
{
  defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
  self->_defaultSerializedRepresentation = 0;

  [(WFDynamicEnumerationParameter *)self setDefaultValueLoadingState:0];
  v4.receiver = self;
  v4.super_class = (Class)WFDynamicEnumerationParameter;
  [(WFParameter *)&v4 defaultSerializedRepresentationDidChange];
}

- (NSArray)possibleStates
{
  unint64_t v3 = [(WFDynamicEnumerationParameter *)self possibleStatesLoadingState];
  if (v3 - 2 >= 2)
  {
    if (v3
      || ([(WFDynamicEnumerationParameter *)self dataSource],
          id v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = objc_opt_respondsToSelector(),
          v5,
          (v6 & 1) == 0))
    {
      objc_super v4 = 0;
    }
    else
    {
      uint64_t v7 = [(WFDynamicEnumerationParameter *)self dataSource];
      id v8 = [v7 possibleStatesForEnumeration:self];

      if (v8) {
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:v8];
      }
      else {
        id v9 = 0;
      }
      objc_storeStrong((id *)&self->_possibleStatesCollection, v9);
      if (v8) {

      }
      possibleStates = self->_possibleStates;
      self->_possibleStates = v8;
      id v11 = v8;

      self->_possibleStatesLoadingState = 2;
      objc_super v4 = self->_possibleStates;
    }
  }
  else
  {
    objc_super v4 = self->_possibleStates;
  }
  return v4;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(WFDynamicEnumerationParameter *)self dataSource];
    id v8 = [v7 enumeration:self accessoryColorForPossibleState:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(WFDynamicEnumerationParameter *)self dataSource];
    id v8 = [v7 enumeration:self accessoryIconForPossibleState:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFDynamicEnumerationParameter;
    id v8 = [(WFEnumerationParameter *)&v10 accessoryIconForPossibleState:v4];
  }

  return v8;
}

- (id)possibleStatesForLocalization
{
  unint64_t v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && ([(WFDynamicEnumerationParameter *)self dataSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 enumerationShouldProvideValuesForParameterSummaryLocalization:self],
        v5,
        !v6))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFDynamicEnumerationParameter;
    uint64_t v7 = [(WFEnumerationParameter *)&v9 possibleStatesForLocalization];
  }
  return v7;
}

- (void)setPossibleStatesFromRemoteSource:(id)a3
{
  self->_possibleStatesLoadingState = 3;
}

- (void)reloadPossibleStates
{
  [(WFDynamicEnumerationParameter *)self clearPossibleStates];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WFDynamicEnumerationParameter_reloadPossibleStates__block_invoke;
  v3[3] = &unk_1E6557668;
  v3[4] = self;
  [(WFDynamicEnumerationParameter *)self loadPossibleStatesWithCompletionHandler:v3];
}

void __53__WFDynamicEnumerationParameter_reloadPossibleStates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 localizedDescription];
      int v6 = 136315394;
      uint64_t v7 = "-[WFDynamicEnumerationParameter reloadPossibleStates]_block_invoke";
      __int16 v8 = 2112;
      objc_super v9 = v5;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Error reloading possible states: %{error}@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (([*(id *)(a1 + 32) isAsynchronous] & 1) == 0)
  {
    [*(id *)(a1 + 32) possibleStatesDidChange];
  }
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  if ([(WFDynamicEnumerationParameter *)self possibleStatesLoadingState] == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFDynamicEnumerationParameter;
    BOOL v5 = [(WFEnumerationParameter *)&v7 parameterStateIsValid:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)allowsMultipleValues
{
  id v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(WFDynamicEnumerationParameter *)self dataSource];
    char v6 = [v5 enumerationAllowsMultipleValues:self];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFDynamicEnumerationParameter;
    return [(WFParameter *)&v8 allowsMultipleValues];
  }
}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFDynamicEnumerationParameter *)self possibleStates];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F30570]);
    uint64_t v7 = [(WFDynamicEnumerationParameter *)self possibleStates];
    objc_super v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v10 = (void *)[v6 initWithItems:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __106__WFDynamicEnumerationParameter_WFParameterPicker__wf_reloadFromAttributesDidChangeWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E65572A0;
    id v13 = v10;
    id v14 = v4;
    id v11 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

uint64_t __106__WFDynamicEnumerationParameter_WFParameterPicker__wf_reloadFromAttributesDidChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v7[3] = &unk_1E6558AC8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(WFDynamicEnumerationParameter *)self loadPossibleStatesWithCompletionHandler:v7];
}

void __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F30570]);
    uint64_t v5 = [*(id *)(a1 + 32) possibleStates];
    id v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F1CBF0];
    }
    id v8 = (void *)[v4 initWithItems:v7];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
    v11[3] = &unk_1E65572A0;
    id v9 = *(id *)(a1 + 40);
    id v12 = v8;
    id v13 = v9;
    id v10 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __98__WFDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 0;
}

@end