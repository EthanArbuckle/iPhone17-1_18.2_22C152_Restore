@interface WFVariablePickerParameter
- (BOOL)alwaysShowsButton;
- (Class)singleStateClass;
- (id)defaultSupportedVariableTypes;
- (id)importQuestionBehavior;
- (id)possibleStates;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
@end

@implementation WFVariablePickerParameter

- (id)importQuestionBehavior
{
  v2 = @"NotSupported";
  return @"NotSupported";
}

- (id)defaultSupportedVariableTypes
{
  v2 = [(id)objc_opt_class() allInsertableVariableTypes];
  v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:@"Ask"];
  return v3;
}

- (id)possibleStates
{
  return 0;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc(MEMORY[0x1E4F30570]);
  v6 = (void *)[v5 initWithItems:MEMORY[0x1E4F1CBF0]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__WFVariablePickerParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E65572A0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __94__WFVariablePickerParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

@end