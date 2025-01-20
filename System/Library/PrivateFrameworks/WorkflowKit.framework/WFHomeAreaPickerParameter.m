@interface WFHomeAreaPickerParameter
- (Class)singleStateClass;
- (WFHomeAreaPickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFHomeAreaPickerParameter

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  id v4 = a4;
  v5 = [v4 value];
  uint64_t v6 = [v5 areaType];

  if (!v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB49C8]);
    v9 = [MEMORY[0x1E4FB4760] clearBackground];
    v10 = @"house";
LABEL_7:
    v13 = (void *)[v8 initWithSymbolName:v10 background:v9];

    goto LABEL_8;
  }
  v7 = [v4 value];
  if ([v7 areaType] == 2)
  {

LABEL_6:
    id v8 = objc_alloc(MEMORY[0x1E4FB49C8]);
    v9 = [MEMORY[0x1E4FB4760] clearBackground];
    v10 = @"square.split.bottomrightquarter";
    goto LABEL_7;
  }
  v11 = [v4 value];
  uint64_t v12 = [v11 areaType];

  if (v12 == 1) {
    goto LABEL_6;
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = objc_msgSend(a4, "value", a3);
  v5 = [v4 name];

  return v5;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v5 = +[WFHomeManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__WFHomeAreaPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v7[3] = &unk_1E6558678;
  id v8 = v4;
  id v6 = v4;
  [v5 ensureHomesAreLoadedWithCompletionHandler:v7];
}

void __97__WFHomeAreaPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = +[WFHomeManager sharedManager];
  id v8 = [v2 primaryHome];

  if (v8)
  {
    v3 = [WFHMHomeAreaSubstitutableState alloc];
    id v4 = [[WFHMHomeAreaDescriptor alloc] initWithHome:v8];
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
  v8[2] = __91__WFHomeAreaPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v8[3] = &unk_1E6558678;
  id v9 = v5;
  id v7 = v5;
  [v6 ensureHomesAreLoadedWithCompletionHandler:v8];
}

void __91__WFHomeAreaPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA48];
  v2 = +[WFHomeManager sharedManager];
  v3 = [v2 homes];
  v40 = objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  id v4 = getWFActionsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = +[WFHomeManager sharedManager];
    uint64_t v6 = [v5 homes];
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFHomeAreaPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
    __int16 v60 = 2048;
    uint64_t v61 = [v6 count];
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEBUG, "%s Found %lu homes in WFHomeManager", buf, 0x16u);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = +[WFHomeManager sharedManager];
  id v8 = [v7 homes];

  uint64_t v41 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(v8);
        }
        uint64_t v42 = v9;
        v10 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
        v11 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v12 = [WFHMHomeAreaSubstitutableState alloc];
        v13 = [[WFHMHomeAreaDescriptor alloc] initWithHome:v10];
        v14 = [(WFVariableSubstitutableParameterState *)v12 initWithValue:v13];
        [v11 addObject:v14];

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v15 = [v10 zones];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v48 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              v21 = [WFHMHomeAreaSubstitutableState alloc];
              v22 = [[WFHMHomeAreaDescriptor alloc] initWithZone:v20 inHome:v10];
              v23 = [(WFVariableSubstitutableParameterState *)v21 initWithValue:v22];
              [v11 addObject:v23];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v17);
        }

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v24 = [v10 rooms];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              v30 = [WFHMHomeAreaSubstitutableState alloc];
              v31 = [[WFHMHomeAreaDescriptor alloc] initWithRoom:v29 inHome:v10];
              v32 = [(WFVariableSubstitutableParameterState *)v30 initWithValue:v31];
              [v11 addObject:v32];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v26);
        }

        id v33 = objc_alloc(MEMORY[0x1E4F30580]);
        v34 = [v10 name];
        v35 = (void *)[v33 initWithTitle:v34 items:v11];

        [v40 addObject:v35];
        uint64_t v9 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v41);
  }

  uint64_t v36 = *(void *)(a1 + 32);
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithSections:v40];
  (*(void (**)(uint64_t, void *, void))(v36 + 16))(v36, v37, 0);
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFHomeAreaPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFHomeAreaPickerParameter;
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