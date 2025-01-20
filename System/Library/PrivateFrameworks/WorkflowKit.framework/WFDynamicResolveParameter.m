@interface WFDynamicResolveParameter
- (BOOL)wf_allowsMultipleSelection;
- (BOOL)wf_alwaysScaleIconImage;
- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged;
- (BOOL)wf_supportsSearch;
- (BOOL)wf_usesGroupTableViewStyle;
- (BOOL)wf_usesTogglesForSelection;
- (Class)singleStateClass;
- (INCodableAttribute)codableAttribute;
- (INStringLocalizer)stringLocalizer;
- (WFDynamicResolveParameter)initWithDefinition:(id)a3;
- (WFDynamicResolveParameterDataSource)dataSource;
- (WFDynamicResolveParameterDelegate)delegate;
- (id)localizedLabelForState:(id)a3;
- (id)wf_pickerLocalizedImageForState:(id)a3;
- (id)wf_pickerLocalizedSubtitleForState:(id)a3;
- (id)wf_pickerLocalizedTitleForState:(id)a3;
- (void)endResolutionSession;
- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 completion:(id)a5;
- (void)resolveOptionsForUserInput:(id)a3 completionBlock:(id)a4;
- (void)setCodableAttribute:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStringLocalizer:(id)a3;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3;
@end

@implementation WFDynamicResolveParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

- (void)setDelegate:(id)a3
{
}

- (WFDynamicResolveParameterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFDynamicResolveParameterDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (WFDynamicResolveParameterDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WFDynamicResolveParameterDataSource *)WeakRetained;
}

- (void)setStringLocalizer:(id)a3
{
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (void)setCodableAttribute:(id)a3
{
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFDynamicResolveParameter *)self dataSource];

  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFDynamicResolveParameter.m", 52, @"Invalid parameter not satisfying: %@", @"self.dataSource" object file lineNumber description];
  }
  v12 = [(WFDynamicResolveParameter *)self dataSource];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(WFDynamicResolveParameter *)self dataSource];
    [v14 localizedDisambiguationPromptForItems:v16 intent:v9 dynamicResolveParameter:self completion:v10];
  }
}

- (void)endResolutionSession
{
  v4 = [(WFDynamicResolveParameter *)self delegate];

  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFDynamicResolveParameter.m", 45, @"Invalid parameter not satisfying: %@", @"self.delegate" object file lineNumber description];
  }
  v5 = [(WFDynamicResolveParameter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(WFDynamicResolveParameter *)self delegate];
    [v8 dynamicResolveParameterDidEndResolutionSession:self];
  }
}

- (void)resolveOptionsForUserInput:(id)a3 completionBlock:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  id v8 = [(WFDynamicResolveParameter *)self dataSource];

  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFDynamicResolveParameter.m", 38, @"Invalid parameter not satisfying: %@", @"self.dataSource" object file lineNumber description];
  }
  id v9 = [(WFDynamicResolveParameter *)self dataSource];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(WFDynamicResolveParameter *)self dataSource];
    [v11 resolveOptionsForUserInput:v13 forDynamicResolveParameter:self completion:v7];
  }
}

- (id)localizedLabelForState:(id)a3
{
  v4 = [a3 value];
  v5 = [(WFDynamicResolveParameter *)self stringLocalizer];
  if (v5)
  {
    char v6 = objc_msgSend(v4, "_intents_readableTitleWithLocalizer:", v5);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    char v6 = objc_msgSend(v4, "_intents_readableTitleWithLocalizer:", v7);
  }
  return v6;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFDynamicResolveParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFDynamicResolveParameter;
  v3 = [(WFParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (BOOL)wf_alwaysScaleIconImage
{
  return 0;
}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
}

- (id)wf_pickerLocalizedImageForState:(id)a3
{
  v4 = [a3 value];
  v5 = [(WFDynamicResolveParameter *)self stringLocalizer];
  char v6 = v5;
  if (!v5)
  {
    char v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  }
  objc_super v7 = objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v6);
  id v8 = objc_msgSend(v7, "wf_image");

  if (!v5) {
  return v8;
  }
}

- (id)wf_pickerLocalizedSubtitleForState:(id)a3
{
  return (id)[a3 readableSubtitle];
}

- (id)wf_pickerLocalizedTitleForState:(id)a3
{
  return (id)[a3 readableTitle];
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v8[3] = &unk_1E6557318;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFDynamicResolveParameter *)self resolveOptionsForUserInput:a3 completionBlock:v8];
}

void __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E65572F0;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v20 = v11;
    uint64_t v21 = v12;
    id v22 = v13;
    v14 = _Block_copy(aBlock);
    v15 = v14;
    if (a3 == 2)
    {
      id v16 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_3;
      v17[3] = &unk_1E6558C90;
      id v18 = v14;
      [v16 localizedDisambiguationPromptForItems:v11 intent:v10 completion:v17];
    }
    else
    {
      (*((void (**)(void *, void))v14 + 2))(v14, 0);
    }
  }
}

void __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFActionsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315651;
    id v18 = "-[WFDynamicResolveParameter(WFParameterPicker) wf_loadStatesWithSearchTerm:completionHandler:]_block_invoke_2";
    __int16 v19 = 2113;
    uint64_t v20 = v5;
    __int16 v21 = 2113;
    id v22 = v3;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Updating dynamic resolution results with: %{private}@, prompt: %{private}@", buf, 0x20u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_239;
  v16[3] = &unk_1E65572C8;
  id v6 = *(void **)(a1 + 32);
  v16[4] = *(void *)(a1 + 40);
  id v7 = objc_msgSend(v6, "if_map:", v16);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2_242;
  v12[3] = &unk_1E6557D28;
  id v9 = *(id *)(a1 + 48);
  id v14 = v3;
  id v15 = v9;
  id v13 = v8;
  id v10 = v3;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

WFCodableAttributeBackedSubstitutableState *__94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_239(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [WFCodableAttributeBackedSubstitutableState alloc];
  uint64_t v5 = [*(id *)(a1 + 32) codableAttribute];
  id v6 = [*(id *)(a1 + 32) stringLocalizer];
  id v7 = [(WFCodableAttributeBackedSubstitutableState *)v4 initWithValue:v3 codableAttribute:v5 stringLocalizer:v6];

  return v7;
}

uint64_t __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2_242(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (BOOL)wf_usesGroupTableViewStyle
{
  return 0;
}

- (BOOL)wf_usesTogglesForSelection
{
  return 0;
}

- (BOOL)wf_allowsMultipleSelection
{
  return 0;
}

- (BOOL)wf_supportsSearch
{
  return 1;
}

@end