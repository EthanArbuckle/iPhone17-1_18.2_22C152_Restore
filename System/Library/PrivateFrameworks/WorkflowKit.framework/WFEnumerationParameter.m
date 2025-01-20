@interface WFEnumerationParameter
- (BOOL)alwaysShowsButton;
- (BOOL)displaysMultipleValueEditor;
- (BOOL)hideClearButton;
- (BOOL)hidesAccessoryIconInEditor;
- (BOOL)hidesSubtitleInEditor;
- (BOOL)liveUpdatesPossibleStatesInEditor;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)preferContextMenu;
- (BOOL)preferParameterValuePicker;
- (BOOL)prefersParameterValuePicker;
- (BOOL)providesLocalizedValuesForSummary;
- (BOOL)wf_allowsMultipleSelection;
- (BOOL)wf_alwaysScaleIconImage;
- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged;
- (BOOL)wf_supportsSearch;
- (BOOL)wf_usesGroupTableViewStyle;
- (BOOL)wf_usesTogglesForSelection;
- (Class)singleStateClass;
- (NSArray)displayNames;
- (NSArray)possibleStatesForLocalization;
- (NSArray)staticPossibleStates;
- (NSArray)subtitles;
- (NSArray)symbolNames;
- (NSString)selectionType;
- (NSString)tableViewStyle;
- (WFEnumerationParameter)initWithDefinition:(id)a3;
- (id)accessoryColorForPossibleState:(id)a3;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)localizedLabelForMultipleCompleteState:(id)a3;
- (id)localizedLabelForMultipleState:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)localizedSubtitleLabelForPossibleState:(id)a3;
- (id)localizedTitleForButtonWithState:(id)a3;
- (id)parameterStateFromDialogResponse:(id)a3;
- (id)statesForMultipleStateLabelWithStates:(id)a3;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)possibleStatesDidChange;
- (void)setPossibleStatesFromRemoteSource:(id)a3;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
@end

@implementation WFEnumerationParameter

- (WFEnumerationParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WFEnumerationParameter;
  v5 = [(WFParameter *)&v64 initWithDefinition:v4];
  v6 = v5;
  if (v5)
  {
    if ([(WFParameter *)v5 allowsMultipleValues])
    {
      v6->_alwaysShowsButton = 1;
    }
    else
    {
      v7 = [v4 objectForKey:@"AlwaysShowsButton"];
      uint64_t v8 = objc_opt_class();
      v9 = WFEnforceClass(v7, v8);
      v6->_alwaysShowsButton = [v9 BOOLValue];
    }
    v10 = [v4 objectForKey:@"HideClearButton"];
    uint64_t v11 = objc_opt_class();
    v12 = WFEnforceClass(v10, v11);
    v6->_hideClearButton = [v12 BOOLValue];

    v13 = [v4 objectForKey:@"PreferParameterValuePicker"];
    uint64_t v14 = objc_opt_class();
    v15 = WFEnforceClass(v13, v14);
    v6->_prefersParameterValuePicker = [v15 BOOLValue];

    v16 = [v4 objectForKey:@"Items"];
    uint64_t v17 = objc_opt_class();
    v18 = WFEnforceClass(v16, v17);

    v19 = [v4 objectForKey:@"ItemDisplayNames"];
    uint64_t v20 = objc_opt_class();
    v21 = WFEnforceClass(v19, v20);

    uint64_t v22 = [v18 count];
    BOOL v23 = v22 == [v21 count];
    v24 = objc_opt_new();
    v25 = objc_opt_new();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __45__WFEnumerationParameter_initWithDefinition___block_invoke;
    v58[3] = &unk_1E654CE60;
    v26 = v24;
    v59 = v26;
    v27 = v6;
    v60 = v27;
    v28 = v25;
    BOOL v63 = v23;
    v61 = v28;
    id v62 = v21;
    id v29 = v21;
    [v18 enumerateObjectsUsingBlock:v58];
    staticPossibleStates = v27->_staticPossibleStates;
    v27->_staticPossibleStates = v26;
    v31 = v26;

    displayNames = v27->_displayNames;
    v27->_displayNames = v28;
    v33 = v28;

    v34 = [v4 objectForKey:@"ItemSubtitles"];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = WFEnforceClass(v34, v35);
    subtitles = v27->_subtitles;
    v27->_subtitles = (NSArray *)v36;

    v38 = [v4 objectForKey:@"ItemIconNames"];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = WFEnforceClass(v38, v39);
    symbolNames = v27->_symbolNames;
    v27->_symbolNames = (NSArray *)v40;

    v42 = [v4 objectForKey:@"ProvidesLocalizedValues"];
    uint64_t v43 = objc_opt_class();
    v44 = WFEnforceClass(v42, v43);
    v45 = v44;
    if (!v44) {
      v44 = (void *)MEMORY[0x1E4F1CC38];
    }
    v27->_providesLocalizedValuesForSummary = [v44 BOOLValue];

    v46 = [v4 objectForKey:@"SelectionType"];
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = WFEnforceClass(v46, v47);
    v49 = (void *)v48;
    if (v48) {
      v50 = (__CFString *)v48;
    }
    else {
      v50 = @"Checkmark";
    }
    objc_storeStrong((id *)&v27->_selectionType, v50);

    v51 = [v4 objectForKey:@"TableViewStyle"];
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = WFEnforceClass(v51, v52);
    v54 = (void *)v53;
    if (v53) {
      v55 = (__CFString *)v53;
    }
    else {
      v55 = @"Plain";
    }
    objc_storeStrong((id *)&v27->_tableViewStyle, v55);

    v56 = v27;
  }

  return v6;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v5 = 0;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if ([(WFParameter *)self doNotLocalizeValues])
  {
    id v5 = v5;
    v6 = v5;
    goto LABEL_7;
  }
  uint64_t v8 = [(WFEnumerationParameter *)self staticPossibleStates];
  if (![v8 count])
  {

    goto LABEL_6;
  }
  v9 = [(WFEnumerationParameter *)self displayNames];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [(WFEnumerationParameter *)self staticPossibleStates];
  uint64_t v12 = [v11 count];

  if (v10 != v12) {
    goto LABEL_6;
  }
  v13 = [(WFEnumerationParameter *)self staticPossibleStates];
  unint64_t v14 = [v13 indexOfObject:v4];

  v15 = [(WFEnumerationParameter *)self displayNames];
  unint64_t v16 = [v15 count];

  if (v14 >= v16) {
    goto LABEL_6;
  }
  uint64_t v17 = [(WFEnumerationParameter *)self displayNames];
  v6 = [v17 objectAtIndexedSubscript:v14];

LABEL_7:
  return v6;
}

- (NSArray)staticPossibleStates
{
  return self->_staticPossibleStates;
}

- (NSArray)displayNames
{
  return self->_displayNames;
}

void __45__WFEnumerationParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x1E4F1CA20];
    id v6 = v19;
    v7 = [v5 localeWithLocaleIdentifier:@"en_US"];
    [v6 setLocale:v7];

    uint64_t v8 = [v6 localize];
    v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [v6 setLocale:v9];

    uint64_t v10 = [v6 localize];

    uint64_t v11 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) singleStateClass];
    uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v8];
    [v11 addObject:v12];

    [*(id *)(a1 + 48) addObject:v10];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) singleStateClass];
    unint64_t v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v19];
    [v13 addObject:v14];

    if (*(unsigned char *)(a1 + 64))
    {
      v15 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v15 localize];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v17 = 0;
          goto LABEL_12;
        }
        id v16 = v15;
      }
      uint64_t v17 = v16;
LABEL_12:
      if (v17) {
        id v18 = v17;
      }
      else {
        id v18 = v19;
      }
      [*(id *)(a1 + 48) addObject:v18];

      goto LABEL_16;
    }
    [*(id *)(a1 + 48) addObject:v19];
  }
LABEL_16:
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEnumerationParameter *)self staticPossibleStates];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || ([(WFEnumerationParameter *)self subtitles],
        v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 >= v8))
  {
    uint64_t v10 = 0;
  }
  else
  {
    v9 = [(WFEnumerationParameter *)self subtitles];
    uint64_t v10 = [v9 objectAtIndex:v6];
  }
  return v10;
}

- (NSArray)subtitles
{
  return self->_subtitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_staticPossibleStates, 0);
  objc_storeStrong((id *)&self->_tableViewStyle, 0);
  objc_storeStrong((id *)&self->_selectionType, 0);
}

- (void)possibleStatesDidChange
{
  [(WFParameter *)self stateValidityCriteriaDidChange];
  [(WFParameter *)self attributesDidChange];
}

- (BOOL)prefersParameterValuePicker
{
  return self->_prefersParameterValuePicker;
}

- (BOOL)providesLocalizedValuesForSummary
{
  return self->_providesLocalizedValuesForSummary;
}

- (NSArray)symbolNames
{
  return self->_symbolNames;
}

- (NSString)tableViewStyle
{
  return self->_tableViewStyle;
}

- (NSString)selectionType
{
  return self->_selectionType;
}

- (BOOL)liveUpdatesPossibleStatesInEditor
{
  return self->_liveUpdatesPossibleStatesInEditor;
}

- (BOOL)hideClearButton
{
  return self->_hideClearButton;
}

- (BOOL)alwaysShowsButton
{
  return self->_alwaysShowsButton;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v20 = v4;
    unint64_t v6 = [v4 selectedItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v12 = objc_alloc([(WFEnumerationParameter *)self singleStateClass]);
          v13 = [v11 serializedPossibleState];
          unint64_t v14 = (void *)[v12 initWithSerializedRepresentation:v13 variableProvider:0 parameter:self];

          if (v14)
          {
            [v5 addObject:v14];
          }
          else
          {
            v15 = getWFWorkflowExecutionLogObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              id v16 = [v11 serializedPossibleState];
              *(_DWORD *)buf = 136315394;
              v26 = "-[WFEnumerationParameter parameterStateFromDialogResponse:]";
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Failed to instantiate selected parameter state from serializedRepresentation: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    if ([(WFParameter *)self allowsMultipleValues])
    {
      uint64_t v17 = objc_msgSend(objc_alloc(-[WFParameter stateClass](self, "stateClass")), "initWithParameterStates:", v5);
    }
    else
    {
      uint64_t v17 = [v5 firstObject];
    }
    id v18 = (void *)v17;
    id v4 = v20;
  }
  else
  {

    id v18 = 0;
  }

  return v18;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  if ([(WFEnumerationParameter *)self liveUpdatesPossibleStatesInEditor])
  {
    v13[2](v13, 0);
  }
  else
  {
    BOOL v14 = [(WFParameter *)self allowsMultipleValues];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    char v28 = 0;
    v15 = [(WFEnumerationParameter *)self possibleStates];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v22[3] = &unk_1E654CED8;
    BOOL v26 = v14;
    long long v24 = self;
    v25 = v27;
    id v23 = v11;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_3;
    v16[3] = &unk_1E654CF00;
    uint64_t v20 = v13;
    BOOL v21 = v14;
    id v17 = v10;
    id v18 = v12;
    id v19 = self;
    objc_msgSend(v15, "if_mapAsynchronously:completionHandler:", v22, v16);

    _Block_object_dispose(v27, 8);
  }
}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (*(unsigned char *)(a1 + 56)
    && [v6 stateIsEquivalent:*(void *)(a1 + 32)]
    && (uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8), !*(unsigned char *)(v8 + 24)))
  {
    char v9 = 1;
    *(unsigned char *)(v8 + 24) = 1;
  }
  else
  {
    char v9 = 0;
  }
  id v10 = [v6 serializedRepresentation];
  id v11 = [*(id *)(a1 + 40) localizedLabelForPossibleState:v6];
  id v12 = [*(id *)(a1 + 40) localizedSubtitleLabelForPossibleState:v6];
  v13 = [*(id *)(a1 + 40) accessoryImageForPossibleState:v6];
  BOOL v14 = (void *)[objc_alloc(MEMORY[0x1E4F5A958]) initWithTitle:v11 subtitle:v12 image:v13];
  v15 = [MEMORY[0x1E4F5A950] itemWithObject:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_2;
  v19[3] = &unk_1E654CEB0;
  char v23 = v9;
  id v20 = v15;
  id v21 = v10;
  id v22 = v7;
  id v16 = v7;
  id v17 = v10;
  id v18 = v15;
  [v18 encodedTypedValueWithCompletion:v19];
}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = (objc_class *)MEMORY[0x1E4FB45C8];
  id v5 = a2;
  id v6 = [v4 alloc];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = [*(id *)(a1 + 48) key];
  id v10 = (void *)[v6 initWithItems:v5 allowsMultipleSelection:v7 message:0 attribution:v8 prompt:v9 parameterKey:v11];

  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v10);
}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[WFDialogContentListItem alloc] initWithContentItem:*(void *)(a1 + 32) encodedTypedValue:v3 selected:*(unsigned __int8 *)(a1 + 56) serializedPossibleState:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)parameterStateIsValid:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 variable];

  if (v6)
  {
    id v7 = [(WFParameter *)self supportedVariableTypes];
    uint64_t v8 = [v5 variable];
    uint64_t v9 = [v8 type];
    char v10 = [v7 containsObject:v9];

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(WFParameter *)self allowsMultipleValues])
    {
      char v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"WFEnumerationParameter.m" lineNumber:253 description:@"Multiple state found in parameter that doesn't support multiple values"];
    }
    [v5 parameterStates];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v16 = [(WFEnumerationParameter *)self possibleStates];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __48__WFEnumerationParameter_parameterStateIsValid___block_invoke;
          v26[3] = &unk_1E6554000;
          v26[4] = v15;
          uint64_t v17 = [v16 indexOfObjectPassingTest:v26];

          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            char v10 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      char v10 = 1;
    }
    else
    {
      char v10 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  id v18 = [(WFEnumerationParameter *)self possibleStates];
  char v19 = [v18 containsObject:v5];

  if (v19)
  {
    char v10 = 1;
  }
  else
  {
    id v20 = [(WFEnumerationParameter *)self possibleStates];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__WFEnumerationParameter_parameterStateIsValid___block_invoke_2;
    v24[3] = &unk_1E6554000;
    id v25 = v5;
    id v21 = [v20 indexesOfObjectsPassingTest:v24];

    char v10 = [v21 count] == 1;
  }
LABEL_22:

  return v10;
}

uint64_t __48__WFEnumerationParameter_parameterStateIsValid___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stateIsEquivalent:a2];
}

uint64_t __48__WFEnumerationParameter_parameterStateIsValid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stateIsEquivalent:a2];
}

- (BOOL)displaysMultipleValueEditor
{
  return 0;
}

- (BOOL)preferContextMenu
{
  if ([(WFEnumerationParameter *)self preferParameterValuePicker]) {
    return 0;
  }
  else {
    return ![(WFParameter *)self allowsMultipleValues];
  }
}

- (BOOL)preferParameterValuePicker
{
  return self->_prefersParameterValuePicker;
}

- (BOOL)hidesSubtitleInEditor
{
  return 0;
}

- (BOOL)hidesAccessoryIconInEditor
{
  return 0;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  return 0;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEnumerationParameter *)self staticPossibleStates];
  if (v5)
  {
    id v6 = [(WFEnumerationParameter *)self symbolNames];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(WFEnumerationParameter *)self staticPossibleStates];
    uint64_t v9 = [v8 count];

    if (v7 != v9)
    {
      id v5 = 0;
      goto LABEL_10;
    }
    char v10 = [(WFEnumerationParameter *)self staticPossibleStates];
    unint64_t v11 = [v10 indexOfObject:v4];

    uint64_t v12 = [(WFEnumerationParameter *)self symbolNames];
    unint64_t v13 = [v12 count];

    if (v11 >= v13)
    {
      uint64_t v15 = 0;
    }
    else
    {
      BOOL v14 = [(WFEnumerationParameter *)self symbolNames];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v11];

      if ((objc_msgSend(v15, "wf_isEmpty") & 1) == 0)
      {
        id v5 = [MEMORY[0x1E4FB4770] systemImageNamed:v15 configuration:0 renderingMode:2];
LABEL_9:

        goto LABEL_10;
      }
    }
    id v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  return 0;
}

- (id)localizedLabelForMultipleCompleteState:(id)a3
{
  return WFLocalizedString(@"All");
}

- (id)statesForMultipleStateLabelWithStates:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WFEnumerationParameter_statesForMultipleStateLabelWithStates___block_invoke;
  v5[3] = &unk_1E654CE88;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __64__WFEnumerationParameter_statesForMultipleStateLabelWithStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 possibleStates];
  uint64_t v10 = [v9 indexOfObject:v8];

  unint64_t v11 = [v5 numberWithUnsignedInteger:v10];
  uint64_t v12 = NSNumber;
  unint64_t v13 = [*(id *)(a1 + 32) possibleStates];
  uint64_t v14 = [v13 indexOfObject:v7];

  uint64_t v15 = [v12 numberWithUnsignedInteger:v14];
  uint64_t v16 = [v11 compare:v15];

  return v16;
}

- (id)localizedLabelForMultipleState:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 parameterStates];
  id v6 = (void *)MEMORY[0x1E4F1CAA0];
  id v7 = [(WFEnumerationParameter *)self possibleStates];
  id v8 = [v6 orderedSetWithArray:v7];

  if (![v5 count])
  {
    uint64_t v11 = WFLocalizedString(@"Choose");
LABEL_5:
    id v10 = (id)v11;
    goto LABEL_22;
  }
  if ([v5 count] != 1)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    unint64_t v13 = [v8 set];
    if ([v12 isEqualToSet:v13])
    {
      unint64_t v14 = [v5 count];

      if (v14 >= 3)
      {
        uint64_t v11 = [(WFEnumerationParameter *)self localizedLabelForMultipleCompleteState:v4];
        goto LABEL_5;
      }
    }
    else
    {
    }
    uint64_t v9 = [(WFEnumerationParameter *)self statesForMultipleStateLabelWithStates:v5];
    uint64_t v15 = [v9 objectAtIndexedSubscript:0];
    uint64_t v16 = [(WFEnumerationParameter *)self localizedLabelForPossibleState:v15 inMultipleState:v4];

    if ([v9 count] == 2)
    {
      uint64_t v17 = [v9 objectAtIndexedSubscript:1];
      [(WFEnumerationParameter *)self localizedLabelForPossibleState:v17 inMultipleState:v4];
    }
    else
    {
      id v18 = NSString;
      uint64_t v17 = WFLocalizedPluralString(@"%ld more");
      objc_msgSend(v18, "localizedStringWithFormat:", v17, objc_msgSend(v9, "count") - 1);
    char v19 = };

    if (v16 && v19)
    {
      id v20 = (void *)MEMORY[0x1E4F28DF8];
      v24[0] = v16;
      v24[1] = v19;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      id v10 = [v20 localizedStringByJoiningStrings:v21];
    }
    else
    {
      if (v16) {
        id v22 = v16;
      }
      else {
        id v22 = v19;
      }
      id v10 = v22;
    }

    goto LABEL_21;
  }
  uint64_t v9 = [v5 objectAtIndexedSubscript:0];
  id v10 = [(WFEnumerationParameter *)self localizedTitleForButtonWithState:v9];
LABEL_21:

LABEL_22:
  return v10;
}

- (id)localizedTitleForButtonWithState:(id)a3
{
  id v4 = a3;
  if ([(WFParameter *)self allowsMultipleValues]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [(WFEnumerationParameter *)self localizedLabelForMultipleState:v4];
  }
  else
  {
    uint64_t v5 = [(WFEnumerationParameter *)self localizedLabelForPossibleState:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (NSArray)possibleStatesForLocalization
{
  if ([(WFEnumerationParameter *)self providesLocalizedValuesForSummary])
  {
    id v3 = [(WFEnumerationParameter *)self staticPossibleStates];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v3;
}

- (void)setPossibleStatesFromRemoteSource:(id)a3
{
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)wf_alwaysScaleIconImage
{
  return 0;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F30570]);
  id v7 = [(WFEnumerationParameter *)self possibleStates];
  id v8 = (void *)[v6 initWithItems:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__WFEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v11[3] = &unk_1E65572A0;
  id v12 = v8;
  id v13 = v5;
  id v9 = v8;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __91__WFEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0);
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (BOOL)wf_usesGroupTableViewStyle
{
  v2 = [(WFEnumerationParameter *)self tableViewStyle];
  char v3 = [v2 isEqualToString:@"InsetGrouped"];

  return v3;
}

- (BOOL)wf_usesTogglesForSelection
{
  v2 = [(WFEnumerationParameter *)self selectionType];
  char v3 = [v2 isEqualToString:@"Toggle"];

  return v3;
}

- (BOOL)wf_allowsMultipleSelection
{
  return 0;
}

- (BOOL)wf_supportsSearch
{
  return 0;
}

@end