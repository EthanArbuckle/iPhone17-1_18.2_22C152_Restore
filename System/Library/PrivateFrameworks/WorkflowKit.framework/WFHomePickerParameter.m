@interface WFHomePickerParameter
- (Class)singleStateClass;
- (WFHomePickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFHomePickerParameter

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = a4;
  v5 = +[WFHomeManager sharedManager];
  v6 = [v4 value];

  v7 = [v5 homeWithIdentifier:v6];
  v8 = [v7 name];

  return v8;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v5 = +[WFHomeManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__WFHomePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v7[3] = &unk_1E6558678;
  id v8 = v4;
  id v6 = v4;
  [v5 ensureHomesAreLoadedWithCompletionHandler:v7];
}

void __93__WFHomePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = +[WFHomeManager sharedManager];
  id v8 = [v2 primaryHome];

  if (v8)
  {
    v3 = [WFStringSubstitutableState alloc];
    id v4 = WFSerializableHomeIdentifier(v8);
    v5 = [(WFVariableSubstitutableParameterState *)v3 initWithValue:v4];

    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [(WFVariableSubstitutableParameterState *)v5 serializedRepresentation];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v5 = a5;
  uint64_t v6 = +[WFHomeManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__WFHomePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v8[3] = &unk_1E6558678;
  id v9 = v5;
  id v7 = v5;
  [v6 ensureHomesAreLoadedWithCompletionHandler:v8];
}

void __87__WFHomePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = +[WFHomeManager sharedManager];
  id v5 = [v4 homes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        v11 = [WFStringSubstitutableState alloc];
        v12 = WFSerializableHomeIdentifier(v10);
        v13 = [(WFVariableSubstitutableParameterState *)v11 initWithValue:v12];
        [v3 addObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F30580]) initWithTitle:0 items:v3];
  [v2 addObject:v14];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithSections:v2];
  (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFHomePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFHomePickerParameter;
  v3 = [(WFEnumerationParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end