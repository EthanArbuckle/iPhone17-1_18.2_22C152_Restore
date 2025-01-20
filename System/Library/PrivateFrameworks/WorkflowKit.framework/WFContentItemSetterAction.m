@interface WFContentItemSetterAction
- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3;
- (BOOL)inputRequired;
- (BOOL)inputsMultipleItems;
- (BOOL)outputsMultipleItems;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSArray)properties;
- (WFContentProperty)selectedProperty;
- (id)appContentDestinationForSystemAppBundleIdentifier:(id)a3;
- (id)changeTransactionWithInput:(id)a3;
- (id)contentDestinationWithError:(id *)a3;
- (id)displayStringForTransactionModeState:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)inputParameterKey;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)outputContentClasses;
- (id)parameterDefinitions;
- (id)parameterKeyForProperty:(id)a3;
- (id)parameterSummary;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)requiredResourceForProperty:(id)a3;
- (id)setAdditionalPropertyIfNecessaryForValue:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)initializeParameters;
- (void)presentAlertWithUserInterface:(id)a3 input:(id)a4 completion:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setPromptForSelectedParameter;
- (void)userValueForSelectedPropertyWithCompletion:(id)a3;
@end

@implementation WFContentItemSetterAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to edit %2$@?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)[(WFAction *)self contentItemClass] isEqual:objc_opt_class()])
  {
    v4 = (void *)MEMORY[0x1E4FB4AB8];
LABEL_7:
    v5 = [(WFContentItemSetterAction *)self appContentDestinationForSystemAppBundleIdentifier:*v4];
    goto LABEL_8;
  }
  if ([(objc_class *)[(WFAction *)self contentItemClass] isEqual:objc_opt_class()])
  {
    v4 = (void *)MEMORY[0x1E4FB4AA8];
    goto LABEL_7;
  }
  if ([(objc_class *)[(WFAction *)self contentItemClass] isEqual:objc_opt_class()])
  {
    v4 = (void *)MEMORY[0x1E4FB4B50];
    goto LABEL_7;
  }
  id v7 = getWFSecurityLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    id v8 = NSStringFromClass([(WFAction *)self contentItemClass]);
    int v9 = 136315394;
    v10 = "-[WFContentItemSetterAction contentDestinationWithError:]";
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Missing a contentDestination for %@", (uint8_t *)&v9, 0x16u);
  }
  v5 = 0;
LABEL_8:
  return v5;
}

- (id)appContentDestinationForSystemAppBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F302A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  v6 = [MEMORY[0x1E4F302D0] sharedResolver];
  id v7 = [v6 resolvedAppMatchingDescriptor:v5];

  id v8 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v7];

  return v8;
}

- (id)setAdditionalPropertyIfNecessaryForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x1E4F5A9D0];
    id v6 = v4;
    id v7 = [v6 string];
    id v8 = [v6 contactName];

    int v9 = [(WFAction *)self processedParameters];
    v10 = [v9 objectForKey:@"ValueLabel"];
    id v11 = [v5 phoneNumberWithPhoneNumberString:v7 contactName:v8 label:v10];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)MEMORY[0x1E4F5A8E0];
    uint64_t v13 = [v4 address];
    v14 = [(WFAction *)self processedParameters];
    v15 = [v14 objectForKey:@"ValueLabel"];
    id v11 = [v12 addressWithEmailAddress:v13 label:v15];

LABEL_7:
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v4;
    uint64_t v13 = [(WFAction *)self processedParameters];
    v14 = [v13 objectForKey:@"ValueLabel"];
    id v11 = [v16 streetAddressWithLabel:v14];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v4;
    v19 = [(WFAction *)self processedParameters];
    v20 = [v19 objectForKey:@"ValueLabel"];
    int v21 = [v20 BOOLValue];
    uint64_t v22 = 1;
    if (!v21) {
      uint64_t v22 = 2;
    }
    uint64_t v42 = v22;

    id v41 = objc_alloc(MEMORY[0x1E4F5A9C0]);
    uint64_t v40 = [v18 URL];
    v23 = [v18 name];
    v24 = [v18 emailAddress];
    uint64_t v25 = [v18 status];
    uint64_t v26 = [v18 type];
    v27 = [v18 sourceIdentifier];
    char v28 = [v18 isManaged];
    char v29 = [v18 isCurrentUser];
    v30 = [v18 contactPredicate];

    BYTE1(v39) = v29;
    LOBYTE(v39) = v28;
    v31 = (void *)v40;
    id v11 = (id)objc_msgSend(v41, "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v40, v23, v24, v25, v42, v26, v27, v39, v30);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    v32 = [(WFContentItemSetterAction *)self selectedProperty];
    v33 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v32];
    v31 = [(WFAction *)self parameterValueForKey:v33 ofClass:objc_opt_class()];

    if (!v31)
    {
LABEL_19:
      id v11 = v4;
      goto LABEL_8;
    }
    v34 = [MEMORY[0x1E4F5A8B0] detectedDatesInString:v31 error:0];
    v35 = [v34 firstObject];

    LODWORD(v34) = [v35 timeIsSignificant];
    v36 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v37 = v36;
    if (v34)
    {
      v38 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      id v11 = [v37 componentsInTimeZone:v38 fromDate:v4];
    }
    else
    {
      id v11 = [v36 components:30 fromDate:v4];
    }
  }
LABEL_8:

  return v11;
}

- (void)presentAlertWithUserInterface:(id)a3 input:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v33 = v8;
  v35 = [v8 items];
  id v11 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
  if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v12 = [v11 localizedLowercaseString];

    id v11 = (void *)v12;
  }
  uint64_t v13 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:1];
  v14 = NSString;
  v15 = WFLocalizedString(@"Choose the %@ to remove from the %@.");
  id v16 = [(WFContentItemSetterAction *)self selectedProperty];
  v17 = [v16 name];
  id v18 = [v17 lowercaseString];
  v19 = objc_msgSend(v14, "stringWithFormat:", v15, v18, v11);
  [v13 setTitle:v19];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke;
  v43[3] = &unk_1E6551C48;
  id v20 = v10;
  id v44 = v20;
  id v21 = v13;
  id v45 = v21;
  uint64_t v22 = objc_msgSend(v35, "if_compactMap:", v43);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        [v21 addButton:*(void *)(*((void *)&v39 + 1) + 8 * v26++)];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v24);
  }
  v27 = [MEMORY[0x1E4F5A770] cancelButtonWithTarget:self action:sel_cancel];
  [v21 addButton:v27];

  char v28 = (void *)MEMORY[0x1E4F5A770];
  char v29 = WFLocalizedString(@"Done");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_3;
  v36[3] = &unk_1E65572A0;
  id v37 = v22;
  id v38 = v9;
  id v30 = v9;
  id v31 = v22;
  v32 = [v28 buttonWithTitle:v29 style:0 preferred:1 handler:v36];
  [v21 addButton:v32];

  [v34 presentAlert:v21];
}

id __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 containsIndex:a3];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_2;
  v14 = &unk_1E6557050;
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = a3;
  id v8 = _Block_copy(&v11);
  id v9 = objc_msgSend(MEMORY[0x1E4F5A818], "buttonWithContentItem:selected:stickySelection:handler:", v6, v7, 1, v8, v11, v12, v13, v14);

  return v9;
}

void __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSelected", (void)v12))
        {
          id v9 = [v8 contentItem];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [MEMORY[0x1E4F5A830] collectionWithItems:v2];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) buttons];
  id v3 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = "WFEnforceClass";
      __int16 v11 = 2114;
      id v12 = v5;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      id v8 = v14;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "isSelected") ^ 1);
}

- (void)userValueForSelectedPropertyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItemSetterAction *)self selectedProperty];
  id v6 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v5];

  uint64_t v7 = [(WFAction *)self parameterForKey:v6];
  id v8 = [(WFAction *)self processedParameters];
  int v9 = [v8 objectForKey:v6];

  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass()) && objc_msgSend(v9, "wf_isEmpty"))
    && ([v7 supportedVariableTypes],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 containsObject:@"Ask"],
        v10,
        (v11 & 1) != 0))
  {
    id v12 = [(WFAction *)self userInterface];
    int v13 = [v12 isRunningWithSiriUI];

    if (v13)
    {
      id v14 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      [(WFAction *)self finishRunningWithError:v14];
    }
    else
    {
      [(WFContentItemSetterAction *)self setParameterState:0 forKey:v6];
      __int16 v15 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v7];
      uint64_t v16 = dispatch_get_global_queue(0, 0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__WFContentItemSetterAction_userValueForSelectedPropertyWithCompletion___block_invoke;
      v17[3] = &unk_1E6551C20;
      id v18 = v6;
      v19 = self;
      id v20 = v4;
      [(WFAction *)self askForValuesOfParameters:v15 withDefaultStates:MEMORY[0x1E4F1CC08] prompts:MEMORY[0x1E4F1CC08] input:0 workQueue:v16 completionHandler:v17];
    }
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

void __72__WFContentItemSetterAction_userValueForSelectedPropertyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [*(id *)(a1 + 40) processedParameters];
  id v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setProcessedParameters:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFContentItemSetterAction *)self selectedProperty];

  if (!v5)
  {
    [(WFAction *)self finishRunningWithError:0];
    goto LABEL_17;
  }
  id v6 = [v4 items];
  uint64_t v7 = [v6 firstObject];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(WFAction *)self contentItemClass];
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
      if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
      {
        uint64_t v9 = [v8 localizedLowercaseString];

        id v8 = (void *)v9;
      }
      uint64_t v10 = [(WFContentItemSetterAction *)self changeTransactionWithInput:v7];
      if (!v10)
      {
        id v21 = (void *)MEMORY[0x1E4F1CA60];
        uint64_t v39 = *MEMORY[0x1E4F28588];
        uint64_t v22 = NSString;
        uint64_t v23 = WFLocalizedString(@"The provided %@ cannot be edited.");
        uint64_t v24 = objc_msgSend(v22, "stringWithFormat:", v23, v8);
        v40[0] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        char v11 = [v21 dictionaryWithDictionary:v25];

        if ([(objc_class *)[(WFAction *)self contentItemClass] isEqual:objc_opt_class()])
        {
          uint64_t v26 = WFLocalizedString(@"Please use the Select Contact or Find Contacts action instead to provide a contact.");
          [v11 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F28568]];
        }
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:6 userInfo:v11];
        [(WFAction *)self finishRunningWithError:v27];

        goto LABEL_26;
      }
      char v11 = [(WFAction *)self parameterStateForKey:@"Mode"];
      id v12 = [v11 value];
      [v10 setMode:v12];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke;
      aBlock[3] = &unk_1E6551B60;
      aBlock[4] = self;
      id v13 = v10;
      id v38 = v13;
      id v14 = _Block_copy(aBlock);
      __int16 v15 = [v13 mode];
      if ([v15 isEqual:*MEMORY[0x1E4F5AAF0]])
      {
        uint64_t v16 = [(WFContentItemSetterAction *)self selectedProperty];
        int v17 = [v16 multipleValues];

        if (v17)
        {
          id v18 = [(WFAction *)self parameterStateForKey:@"RemoveSpecifiedValue"];
          if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v19 = [(WFAction *)self parameterValueForKey:@"RemoveSpecifiedValue" ofClass:objc_opt_class()];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_10;
            v32[3] = &unk_1E6551BA8;
            id v33 = v14;
            id v20 = [(WFContentItemSetterAction *)self selectedProperty];
            objc_msgSend(v19, "getObjectRepresentations:forClass:", v32, objc_msgSend(v20, "propertyClass"));
          }
          else
          {
            char v28 = [(WFContentItemSetterAction *)self selectedProperty];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_4;
            v34[3] = &unk_1E6551BD0;
            v34[4] = self;
            id v35 = v8;
            id v36 = v14;
            [v28 getValuesForObject:v7 completionHandler:v34];
          }
          goto LABEL_25;
        }
      }
      else
      {
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_11;
      v29[3] = &unk_1E6552410;
      v29[4] = self;
      id v31 = v14;
      id v30 = v7;
      [(WFContentItemSetterAction *)self userValueForSelectedPropertyWithCompletion:v29];

LABEL_25:
LABEL_26:

      goto LABEL_15;
    }
  }
  else
  {

    uint64_t v7 = 0;
  }
  [(WFAction *)self finishRunningWithError:0];
LABEL_15:

LABEL_17:
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 selectedProperty];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_1E6555928;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v5 updateWithValue:v4 withTransaction:v8 completion:v7];
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F5A830];
  id v4 = objc_msgSend(a2, "if_compactMap:", &__block_literal_global_474);
  id v5 = [v3 collectionWithItems:v4];

  id v6 = [*(id *)(a1 + 32) selectedProperty];
  int v7 = objc_msgSend((id)objc_msgSend(v6, "propertyClass"), "isEqual:", objc_opt_class());

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F5A830];
    uint64_t v9 = [v5 items];
    uint64_t v10 = objc_msgSend(v9, "if_objectsPassingTest:", &__block_literal_global_478);
    uint64_t v11 = [v8 collectionWithItems:v10];

    id v5 = (void *)v11;
  }
  id v12 = [v5 items];
  uint64_t v13 = [v12 count];

  id v14 = *(void **)(a1 + 32);
  if (v13)
  {
    __int16 v15 = [*(id *)(a1 + 32) userInterface];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_7;
    v25[3] = &unk_1E65553F0;
    v25[4] = *(void *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    [v14 presentAlertWithUserInterface:v15 input:v5 completion:v25];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    int v17 = NSString;
    id v18 = [v14 selectedProperty];
    v19 = [v18 name];
    id v20 = [v19 localizedLowercaseString];
    id v21 = [v17 stringWithFormat:@"There are no %@ to remove from the %@.", v20, *(void *)(a1 + 40)];
    uint64_t v22 = WFLocalizedString(v21);
    v28[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v24 = [v16 errorWithDomain:@"WFActionErrorDomain" code:6 userInfo:v23];
    [v14 finishRunningWithError:v24];
  }
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_11(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v4 = [MEMORY[0x1E4F5A848] itemWithObject:v3];
        id v5 = (void *)v4;
        if (v4) {
          id v6 = (void *)v4;
        }
        else {
          id v6 = v3;
        }
        id v7 = v6;

        id v3 = v7;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [a1[4] selectedProperty];
    int v9 = objc_msgSend((id)objc_msgSend(v8, "propertyClass"), "isEqual:", objc_opt_class());

    if (v9)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_12;
      v32[3] = &unk_1E65586C8;
      id v33 = a1[6];
      [v3 getFileRepresentations:v32 forType:0];
      uint64_t v10 = v33;
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_13;
      v29[3] = &unk_1E6553AC0;
      id v13 = a1[6];
      id v30 = a1[4];
      id v31 = v13;
      id v14 = [v30 selectedProperty];
      objc_msgSend(v3, "getObjectRepresentations:forClass:", v29, objc_msgSend(v14, "propertyClass"));

      uint64_t v10 = v31;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_15;
    v26[3] = &unk_1E6551BF8;
    id v11 = a1[6];
    id v27 = a1[4];
    id v28 = v11;
    id v12 = [v27 selectedProperty];
    objc_msgSend(v3, "getObjectRepresentation:forClass:", v26, objc_msgSend(v12, "propertyClass"));

    uint64_t v10 = v28;
LABEL_14:

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v15 = [a1[4] selectedProperty];
    int v16 = objc_msgSend((id)objc_msgSend(v15, "propertyClass"), "isEqual:", objc_opt_class());

    if (v16)
    {
      int v17 = [v3 unitString];
      unint64_t v18 = +[WFDurationQuantityFieldParameter calendarUnitFromUnitString:v17];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [a1[5] event];
        id v20 = [v19 startDate];
      }
      else
      {
        id v20 = [MEMORY[0x1E4F1C9C8] date];
      }
      id v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v22 = [v3 magnitude];
      uint64_t v23 = objc_msgSend(v21, "dateByAddingUnit:value:toDate:options:", v18, objc_msgSend(v22, "integerValue"), v20, 0);

      uint64_t v24 = NSNumber;
      [v23 timeIntervalSinceDate:v20];
      uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");

      id v3 = (id)v25;
    }
  }
  (*((void (**)(void))a1[6] + 2))();
LABEL_22:
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_14;
  v4[3] = &unk_1E65572C8;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v3 = objc_msgSend(a2, "if_map:", v4);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) setAdditionalPropertyIfNecessaryForValue:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAdditionalPropertyIfNecessaryForValue:a2];
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) selectedProperty];
  int v5 = objc_msgSend((id)objc_msgSend(v4, "propertyClass"), "isEqual:", objc_opt_class());

  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_8;
    v10[3] = &unk_1E65586C8;
    id v6 = &v11;
    id v11 = *(id *)(a1 + 40);
    [v3 getFileRepresentations:v10 forType:0];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9;
    v8[3] = &unk_1E6551BA8;
    id v6 = &v9;
    id v9 = *(id *)(a1 + 40);
    id v7 = objc_msgSend(*(id *)(a1 + 32), "selectedProperty", v8[0], 3221225472, __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9, &unk_1E6551BA8, v9);
    objc_msgSend(v3, "getObjectRepresentations:forClass:", v8, objc_msgSend(v7, "propertyClass"));
  }
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 participant];
  uint64_t v3 = [v2 isCurrentUser] ^ 1;

  return v3;
}

id __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [MEMORY[0x1E4F5A848] itemWithFile:v2];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F5A848] itemWithObject:v2];
  }

  return v3;
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_3;
    v5[3] = &unk_1E6551B38;
    id v2 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    return [v2 saveWithCompletionHandler:v5 isNew:0];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 finishRunningWithError:0];
  }
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    int v5 = [v3 output];
    [v5 addItem:v4];
  }
  id v6 = *(void **)(a1 + 32);
  return [v6 finishRunningWithError:0];
}

- (id)changeTransactionWithInput:(id)a3
{
  return (id)[a3 changeTransaction];
}

- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3
{
  return 0;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 key];
  int v9 = [v8 isEqual:@"WFContentItemPropertyName"];

  if (v9)
  {
    uint64_t v10 = [(WFAction *)self parameterStateForKey:@"Mode"];
    id v11 = [(WFAction *)self contentItemClass];
    id v12 = [v7 value];
    id v13 = [(objc_class *)v11 propertyForName:v12];

    if (!v13)
    {
      uint64_t v22 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v14 = [v10 value];
    if ([v14 isEqual:*MEMORY[0x1E4F5AAE8]])
    {
      __int16 v15 = [v13 singularItemName];

      if (v15)
      {
        uint64_t v16 = [v13 localizedSingularItemName];
LABEL_13:
        uint64_t v22 = (void *)v16;
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v16 = [v13 localizedName];
    goto LABEL_13;
  }
  int v17 = [v6 key];
  int v18 = [v17 isEqual:@"ValueLabel"];

  if (v18)
  {
    v19 = [v7 value];

    if (v19)
    {
      id v20 = (void *)MEMORY[0x1E4F5A808];
      id v21 = [v7 value];
      uint64_t v22 = [v20 localizedStringForLabel:v21];
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = [(WFContentItemSetterAction *)self displayStringForTransactionModeState:v7];
  }
LABEL_15:

  return v22;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4 = a3;
  int v5 = [v4 key];
  int v6 = [v5 isEqual:@"WFContentItemPropertyName"];

  if (v6)
  {
    id v7 = [(WFContentItemSetterAction *)self properties];
    id v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_445);
    goto LABEL_9;
  }
  int v9 = [v4 key];
  int v10 = [v9 isEqual:@"ValueLabel"];

  if (v10)
  {
    id v7 = [(WFContentItemSetterAction *)self selectedProperty];
    id v11 = [v7 possibleLabels];
    id v8 = objc_msgSend(v11, "if_map:", &__block_literal_global_448);
  }
  else
  {
    id v7 = [(WFAction *)self parameterStateForKey:@"WFContentItemPropertyName"];
    id v12 = [v7 variable];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    id v11 = [(WFContentItemSetterAction *)self selectedProperty];
    id v14 = [v11 allowedTransactionModes];
    __int16 v15 = [v14 allObjects];
    id v8 = objc_msgSend(v15, "if_map:", &__block_literal_global_451);
  }
LABEL_9:

  return v8;
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v2];

  return v3;
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v2];

  return v3;
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [WFStringSubstitutableState alloc];
  id v4 = [v2 name];

  int v5 = [(WFVariableSubstitutableParameterState *)v3 initWithValue:v4];
  return v5;
}

- (id)displayStringForTransactionModeState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 value];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F5AAE8]];

  if (v5)
  {
    uint64_t v6 = WFLocalizedStringWithKey(@"Add (WFContentItemChangeTransactionMode)", @"Add");
  }
  else
  {
    id v7 = [v3 value];
    int v8 = [v7 isEqual:*MEMORY[0x1E4F5AAF0]];

    if (v8)
    {
      int v9 = @"Remove";
    }
    else
    {
      int v10 = [v3 value];
      int v11 = [v10 isEqual:*MEMORY[0x1E4F5AAF8]];

      if (v11) {
        int v9 = @"Remove All";
      }
      else {
        int v9 = @"Set";
      }
    }
    uint64_t v6 = WFLocalizedString(v9);
  }
  id v12 = (void *)v6;

  return v12;
}

- (void)setPromptForSelectedParameter
{
  id v3 = [(WFAction *)self parameterStateForKey:@"Mode"];
  if (v3)
  {
    uint64_t v24 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v3 = v24;
    if (isKindOfClass)
    {
      int v5 = [(WFContentItemSetterAction *)self selectedProperty];
      uint64_t v6 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v5];
      id v7 = [(WFAction *)self parameterForKey:v6];

      int v8 = [v24 value];
      int v9 = [v8 isEqual:*MEMORY[0x1E4F5AAE8]];

      if (v9)
      {
        int v10 = [v5 singularItemName];
        if (v10) {
          [v5 localizedSingularItemName];
        }
        else {
        int v11 = [v5 localizedName];
        }

        if ([v5 canLowercaseName])
        {
          uint64_t v18 = [v11 localizedLowercaseString];

          int v11 = (void *)v18;
        }
        v19 = NSString;
        id v20 = WFLocalizedString(@"What %@ do you want to add?");
        id v21 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v11);
        [v7 setLocalizedPrompt:v21];

        uint64_t v16 = [(WFAction *)self parameterForKey:@"ValueLabel"];
        if (!v16) {
          goto LABEL_18;
        }
        uint64_t v22 = NSString;
        int v17 = WFLocalizedString(@"What label do you want for the %@?");
        uint64_t v23 = objc_msgSend(v22, "localizedStringWithFormat:", v17, v11);
        [v16 setLocalizedPrompt:v23];
      }
      else
      {
        int v11 = [v5 localizedName];
        if ([v5 canLowercaseName])
        {
          uint64_t v12 = [v11 localizedLowercaseString];

          int v11 = (void *)v12;
        }
        int v13 = [v5 multipleValues];
        id v14 = NSString;
        if (v13) {
          __int16 v15 = @"What %@ do you want to set? (Plural)";
        }
        else {
          __int16 v15 = @"What %@ do you want to set? (Singular)";
        }
        uint64_t v16 = WFLocalizedStringWithKey(v15, @"What %@ do you want to set?");
        int v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v11);
        [v7 setLocalizedPrompt:v17];
      }

LABEL_18:
      id v3 = v24;
    }
  }
}

- (id)parameterDefinitions
{
  v155[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
  if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v4 = [v3 lowercaseString];

    id v3 = (void *)v4;
  }
  int v5 = objc_opt_new();
  uint64_t v6 = [WFParameterDefinition alloc];
  v154[0] = @"Class";
  id v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  v155[0] = v8;
  v155[1] = @"WFContentItemPropertyName";
  v154[1] = @"Key";
  v154[2] = @"Label";
  int v9 = WFLocalizedStringResourceWithKey(@"Detail (ContentItemSetter)", @"Detail");
  v155[2] = v9;
  v154[3] = @"DisallowedVariableTypes";
  v153 = @"Variable";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
  v155[3] = v10;
  v154[4] = @"Description";
  int v11 = NSString;
  uint64_t v12 = WFLocalizedString(@"The property of the %@ to edit.");
  int v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v3);
  v155[4] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:5];
  __int16 v15 = [(WFParameterDefinition *)v6 initWithDictionary:v14];
  [v5 addObject:v15];

  uint64_t v16 = [WFParameterDefinition alloc];
  v151[0] = @"Class";
  int v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  v152[0] = v18;
  v152[1] = @"Mode";
  v151[1] = @"Key";
  v151[2] = @"Description";
  v19 = NSString;
  id v20 = WFLocalizedString(@"The operation to perform on the selected property of the %@.");
  v113 = v3;
  v102 = v3;
  id v21 = v5;
  uint64_t v22 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v102);
  v152[2] = v22;
  v151[3] = @"DisallowedVariableTypes";
  v150 = @"Variable";
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
  v152[3] = v23;
  v151[4] = @"Label";
  uint64_t v24 = WFLocalizedStringResourceWithKey(@"Edit (ContentItemSetter)", @"Edit");
  v151[5] = @"DefaultValue";
  uint64_t v25 = *MEMORY[0x1E4F5AB00];
  v152[4] = v24;
  v152[5] = v25;
  uint64_t v105 = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:6];
  id v27 = [(WFParameterDefinition *)v16 initWithDictionary:v26];
  [v5 addObject:v27];

  uint64_t v120 = [(WFContentItemSetterAction *)self inputParameterKey];
  if (v120)
  {
    id v28 = [WFParameterDefinition alloc];
    v148[0] = @"Class";
    char v29 = (objc_class *)objc_opt_class();
    id v30 = NSStringFromClass(v29);
    v149[0] = v30;
    v149[1] = v120;
    v148[1] = @"Key";
    v148[2] = @"Label";
    uint64_t v31 = [(objc_class *)[(WFAction *)self contentItemClass] localizedFilterDescription];
    v32 = (void *)v31;
    if (v31) {
      id v33 = (__CFString *)v31;
    }
    else {
      id v33 = &stru_1F229A4D8;
    }
    v149[2] = v33;
    v148[3] = @"Placeholder";
    uint64_t v34 = [(objc_class *)[(WFAction *)self contentItemClass] localizedFilterDescription];
    id v35 = (void *)v34;
    if (v34) {
      id v36 = (__CFString *)v34;
    }
    else {
      id v36 = &stru_1F229A4D8;
    }
    v149[3] = v36;
    id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:4];
    id v38 = [(WFParameterDefinition *)v28 initWithDictionary:v37];
    [v5 addObject:v38];
  }
  v114 = [WFParameterDefinition alloc];
  v146[0] = @"Class";
  uint64_t v39 = (objc_class *)objc_opt_class();
  v118 = NSStringFromClass(v39);
  v147[0] = v118;
  v147[1] = @"RemoveSpecifiedValue";
  v146[1] = @"Key";
  v146[2] = @"Label";
  v116 = WFLocalizedStringResourceWithKey(@"Specified (ContentItemSetter)", @"Specified");
  v147[2] = v116;
  v146[3] = @"Description";
  long long v40 = NSString;
  v110 = WFLocalizedString(@"The value to remove from the selected property of the %@. If no value is provided, one will be requested when run.");
  v108 = objc_msgSend(v40, "localizedStringWithFormat:", v110, v113);
  v147[3] = v108;
  v146[4] = @"RequiredResources";
  v143[0] = @"WFParameterKey";
  v143[1] = @"WFParameterValue";
  uint64_t v41 = *MEMORY[0x1E4F5AAF0];
  v144[0] = @"Mode";
  v144[1] = v41;
  v143[2] = @"WFResourceClass";
  long long v42 = (objc_class *)objc_opt_class();
  v106 = NSStringFromClass(v42);
  v144[2] = v106;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v144 forKeys:v143 count:3];
  v145[0] = v43;
  v142[0] = @"WFContentItemPropertyName";
  v141[0] = @"WFParameterKey";
  v141[1] = @"WFParameterValues";
  id v44 = [(WFContentItemSetterAction *)self properties];
  id v45 = objc_msgSend(v44, "if_compactMap:", &__block_literal_global_32884);
  v142[1] = v45;
  v141[2] = @"WFResourceClass";
  v46 = (objc_class *)objc_opt_class();
  uint64_t v47 = NSStringFromClass(v46);
  v142[2] = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];
  v145[1] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:2];
  v147[4] = v49;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:5];
  v51 = [(WFParameterDefinition *)v114 initWithDictionary:v50];
  id v115 = v21;
  [v21 addObject:v51];

  v52 = objc_opt_new();
  v119 = objc_opt_new();
  v117 = objc_opt_new();
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v53 = [(WFContentItemSetterAction *)self properties];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v121 objects:v140 count:16];
  v55 = (void *)v120;
  if (v54)
  {
    uint64_t v56 = v54;
    uint64_t v57 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v122 != v57) {
          objc_enumerationMutation(v53);
        }
        v59 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        v60 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v59];
        v61 = [v52 valueForKey:v60];

        if (!v61)
        {
          v62 = (void *)MEMORY[0x1E4F1CA60];
          v63 = [v59 parameterDefinition];
          v64 = [v62 dictionaryWithDictionary:v63];

          [v64 setObject:v60 forKeyedSubscript:@"Key"];
          v65 = [(WFContentItemSetterAction *)self requiredResourceForProperty:v59];
          [v64 setObject:v65 forKeyedSubscript:@"RequiredResources"];

          v66 = [[WFParameterDefinition alloc] initWithDictionary:v64];
          [v52 setObject:v66 forKeyedSubscript:v60];

          if ([v59 isLabeledValue])
          {
            v67 = [v59 name];
            [v119 addObject:v67];
          }
          if (objc_msgSend((id)objc_msgSend(v59, "propertyClass"), "isEqual:", objc_opt_class()))
          {
            v68 = [v59 name];
            [v117 addObject:v68];
          }
          v55 = (void *)v120;
        }
      }
      uint64_t v56 = [v53 countByEnumeratingWithState:&v121 objects:v140 count:16];
    }
    while (v56);
  }

  v69 = [v52 allValues];
  [v115 addObjectsFromArray:v69];

  v70 = v119;
  uint64_t v71 = [v119 count];
  v72 = (uint64_t *)MEMORY[0x1E4F5AAE8];
  if (v71)
  {
    v73 = [WFParameterDefinition alloc];
    v138[0] = @"Class";
    v74 = (objc_class *)objc_opt_class();
    v111 = NSStringFromClass(v74);
    v139[0] = v111;
    v139[1] = @"ValueLabel";
    v138[1] = @"Key";
    v138[2] = @"Label";
    v75 = WFLocalizedStringResourceWithKey(@"Label (ContentItemSetter)", @"Label");
    uint64_t v76 = *MEMORY[0x1E4FB4DF0];
    v139[2] = v75;
    v139[3] = v76;
    v138[3] = @"AutocapitalizationType";
    v138[4] = @"RequiredResources";
    v135[0] = @"WFParameterKey";
    v135[1] = @"WFParameterValues";
    v136[0] = @"WFContentItemPropertyName";
    v136[1] = v119;
    v135[2] = @"WFResourceClass";
    v77 = (objc_class *)objc_opt_class();
    v78 = NSStringFromClass(v77);
    v136[2] = v78;
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:3];
    v137[0] = v79;
    v133[0] = @"WFParameterKey";
    v133[1] = @"WFParameterValue";
    uint64_t v80 = *MEMORY[0x1E4F5AAE8];
    v134[0] = @"Mode";
    v134[1] = v80;
    v133[2] = @"WFResourceClass";
    v81 = (objc_class *)objc_opt_class();
    v82 = NSStringFromClass(v81);
    v134[2] = v82;
    v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:3];
    v137[1] = v83;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];
    v139[4] = v84;
    v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:5];
    v86 = [(WFParameterDefinition *)v73 initWithDictionary:v85];
    [v115 addObject:v86];

    v72 = (uint64_t *)MEMORY[0x1E4F5AAE8];
    v55 = (void *)v120;

    v70 = v119;
  }
  v87 = v117;
  if ([v117 count])
  {
    v104 = [WFParameterDefinition alloc];
    v131[0] = @"Class";
    v88 = (objc_class *)objc_opt_class();
    v112 = NSStringFromClass(v88);
    v132[0] = v112;
    v132[1] = @"ValueLabel";
    v131[1] = @"Key";
    v131[2] = @"Label";
    v109 = WFLocalizedStringResourceWithKey(@"Role (ContentItemSetter)", @"Role");
    v132[2] = v109;
    v131[3] = @"OnDisplayName";
    v107 = WFLocalizedStringResourceWithKey(@"Required (ContentItemSetterRole)", @"Required");
    v132[3] = v107;
    v131[4] = @"OffDisplayName";
    v103 = WFLocalizedStringResourceWithKey(@"Optional (ContentItemSetterRole)", @"Optional");
    v132[4] = v103;
    v131[5] = @"DefaultValue";
    v89 = [NSNumber numberWithBool:1];
    v132[5] = v89;
    v131[6] = @"RequiredResources";
    v128[0] = @"WFParameterKey";
    v128[1] = @"WFParameterValues";
    v129[0] = @"WFContentItemPropertyName";
    v129[1] = v117;
    v128[2] = @"WFResourceClass";
    v90 = (objc_class *)objc_opt_class();
    v91 = NSStringFromClass(v90);
    v129[2] = v91;
    v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v128 count:3];
    v130[0] = v92;
    v127[0] = @"Mode";
    v126[0] = @"WFParameterKey";
    v126[1] = @"WFParameterValues";
    uint64_t v93 = *v72;
    v125[0] = v105;
    v125[1] = v93;
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:2];
    v127[1] = v94;
    v126[2] = @"WFResourceClass";
    v95 = (objc_class *)objc_opt_class();
    v96 = NSStringFromClass(v95);
    v127[2] = v96;
    v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:3];
    v130[1] = v97;
    v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
    v132[6] = v98;
    v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:7];
    v100 = [(WFParameterDefinition *)v104 initWithDictionary:v99];
    [v115 addObject:v100];

    v87 = v117;
    v55 = (void *)v120;

    v70 = v119;
  }

  return v115;
}

id __49__WFContentItemSetterAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 multipleValues])
  {
    id v3 = [v2 name];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFContentItemSetterAction;
  BOOL v7 = [(WFAction *)&v19 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFContentItemPropertyName"])
  {
    [(WFAction *)self outputDetailsUpdated];
    int v8 = [(WFAction *)self parameterStateForKey:@"Mode"];
    int v9 = [v8 variable];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v11 = [WFStringSubstitutableState alloc];
      uint64_t v12 = objc_alloc_init(WFAskEachTimeVariable);
      int v13 = [(WFVariableSubstitutableParameterState *)v11 initWithVariable:v12];
    }
    else
    {
      id v14 = [(WFContentItemSetterAction *)self selectedProperty];
      __int16 v15 = [v8 value];
      uint64_t v12 = [v14 preferredTransactionModeWithCurrentMode:v15];

      if (!v12)
      {
        [(WFContentItemSetterAction *)self setParameterState:0 forKey:@"Mode"];
        goto LABEL_8;
      }
      int v13 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v12];
    }
    uint64_t v16 = v13;
    [(WFContentItemSetterAction *)self setParameterState:v13 forKey:@"Mode"];

LABEL_8:
    int v17 = [(WFAction *)self parameterForKey:@"Mode"];
    [v17 reloadPossibleStates];
  }
  if (([v6 isEqualToString:@"WFContentItemPropertyName"] & 1) != 0
    || [v6 isEqualToString:@"Mode"])
  {
    [(WFContentItemSetterAction *)self setPromptForSelectedParameter];
  }

  return v7;
}

- (id)requiredResourceForProperty:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = @"WFContentItemPropertyName";
  v17[0] = @"WFParameterKey";
  v17[1] = @"WFParameterValue";
  id v3 = [a3 name];
  v18[1] = v3;
  v17[2] = @"WFResourceClass";
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  v18[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v19[0] = v6;
  v16[0] = @"Mode";
  v15[0] = @"WFParameterKey";
  v15[1] = @"WFParameterValues";
  uint64_t v7 = *MEMORY[0x1E4F5AAE8];
  v14[0] = *MEMORY[0x1E4F5AB00];
  v14[1] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v16[1] = v8;
  v15[2] = @"WFResourceClass";
  int v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  v16[2] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v19[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v12;
}

- (id)parameterKeyForProperty:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [(objc_class *)[(WFAction *)self contentItemClass] description];
  uint64_t v7 = [v5 name];

  int v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F229A4D8];
  int v9 = [v4 stringWithFormat:@"%@%@", v6, v8];

  return v9;
}

- (void)initializeParameters
{
  v6.receiver = self;
  v6.super_class = (Class)WFContentItemSetterAction;
  [(WFAction *)&v6 initializeParameters];
  id v3 = [(WFAction *)self parameterForKey:@"Mode"];
  [v3 setDataSource:self];
  uint64_t v4 = [(WFAction *)self parameterForKey:@"WFContentItemPropertyName"];
  [v4 setDataSource:self];
  id v5 = [(WFAction *)self parameterForKey:@"ValueLabel"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 setDataSource:self];
    }
  }

  [(WFContentItemSetterAction *)self setPromptForSelectedParameter];
}

- (BOOL)outputsMultipleItems
{
  return 0;
}

- (BOOL)inputsMultipleItems
{
  return 0;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  objc_super v6 = WFLocalizedStringResourceWithKey(@"Edited %@", @"Edited %@");
  uint64_t v7 = [v5 localize:v6];

  int v8 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
  int v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (WFContentProperty)selectedProperty
{
  if ([(WFAction *)self isRunning]
    && ([(WFAction *)self processedParameters],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = [(WFAction *)self parameterValueForKey:@"WFContentItemPropertyName" ofClass:objc_opt_class()];
  }
  else
  {
    id v5 = [(WFAction *)self parameterStateForKey:@"WFContentItemPropertyName"];
    uint64_t v4 = [v5 value];
  }
  objc_super v6 = [(objc_class *)[(WFAction *)self contentItemClass] propertyForName:v4];

  return (WFContentProperty *)v6;
}

- (id)outputContentClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = [(WFAction *)self contentItemClass];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)inputParameterKey
{
  return @"WFInput";
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFContentItemSetterAction;
  id v3 = a3;
  uint64_t v4 = [(WFAction *)&v10 localizedKeywordsWithContext:v3];
  id v5 = WFLocalizedStringResourceWithKey(@"property|properties|add|update", @"property|properties|add|update");
  objc_super v6 = objc_msgSend(v3, "localize:", v5, v10.receiver, v10.super_class);

  uint64_t v7 = [v6 componentsSeparatedByString:@"|"];

  int v8 = [v4 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
  if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 lowercaseString];

    id v5 = (void *)v6;
  }
  uint64_t v7 = NSString;
  int v8 = WFLocalizedStringResourceWithKey(@"Sets a specific field of the %@ passed into the action.", @"Sets a specific field of the %@ passed into the action.");
  int v9 = [v4 localize:v8];

  objc_super v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);

  return v10;
}

- (id)parameterSummary
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v48 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__}", @"${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__}");
  uint64_t v47 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__} as ${ValueLabel}", @"${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__} as ${ValueLabel}");
  v46 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput}", @"${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput}");
  id v45 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput} as ${ValueLabel}", @"${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput} as ${ValueLabel}");
  v49 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v51 = *MEMORY[0x1E4F5AAE8];
  uint64_t v2 = *MEMORY[0x1E4F5AAE8];
  uint64_t v52 = *MEMORY[0x1E4F5AB00];
  v63[0] = *MEMORY[0x1E4F5AB00];
  v63[1] = v2;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v3;
        id v4 = *(void **)(*((void *)&v58 + 1) + 8 * v3);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v53 = [(WFContentItemSetterAction *)self properties];
        uint64_t v5 = [v53 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v55 != v7) {
                objc_enumerationMutation(v53);
              }
              int v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              objc_super v10 = [v9 allowedTransactionModes];
              int v11 = [v10 containsObject:v4];

              if (v11)
              {
                if ([v9 isLabeledValue] && (objc_msgSend(v4, "isEqual:", v51) & 1) != 0
                  || objc_msgSend((id)objc_msgSend(v9, "propertyClass"), "isEqual:", objc_opt_class()))
                {
                  int v12 = 1;
                  int v13 = @",ValueLabel";
                }
                else
                {
                  int v12 = 0;
                  int v13 = &stru_1F229A4D8;
                }
                if ([v4 isEqual:v52])
                {
                  id v14 = NSString;
                  __int16 v15 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v9];
                  uint64_t v16 = [v14 stringWithFormat:@"Mode(Set),WFContentItemPropertyName,WFInput,%@%@", v15, v13];

                  if (v12) {
                    int v17 = v47;
                  }
                  else {
                    int v17 = v48;
                  }
                  uint64_t v18 = [v17 localize];
                  objc_super v19 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v9];
                  id v20 = [v18 stringByReplacingOccurrencesOfString:@"__PARAMETER__" withString:v19];
                }
                else
                {
                  if (![v4 isEqual:v51]) {
                    continue;
                  }
                  id v21 = NSString;
                  uint64_t v22 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v9];
                  uint64_t v16 = [v21 stringWithFormat:@"Mode(Append),WFInput,WFContentItemPropertyName,%@%@", v22, v13];

                  if (v12) {
                    uint64_t v23 = v45;
                  }
                  else {
                    uint64_t v23 = v46;
                  }
                  uint64_t v24 = [v23 localize];
                  uint64_t v25 = [(WFContentItemSetterAction *)self parameterKeyForProperty:v9];
                  id v20 = [v24 stringByReplacingOccurrencesOfString:@"__PARAMETER__" withString:v25];
                }
                id v26 = [[WFActionParameterSummaryValue alloc] initWithKey:v16 localizedSummaryString:v20];
                [v49 addObject:v26];
              }
            }
            uint64_t v6 = [v53 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v43);
  }

  id v27 = [WFActionParameterSummaryValue alloc];
  id v28 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} of ${WFInput}", @"${Mode} ${WFContentItemPropertyName} of ${WFInput}");
  char v29 = [(WFActionParameterSummaryValue *)v27 initWithKey:@"Mode,WFContentItemPropertyName,WFInput" summaryString:v28];
  [v49 addObject:v29];

  id v30 = [WFActionParameterSummaryValue alloc];
  uint64_t v31 = WFLocalizedStringResourceWithKey(@"${Mode} ${RemoveSpecifiedValue} ${WFContentItemPropertyName} from ${WFInput}", @"${Mode} ${RemoveSpecifiedValue} ${WFContentItemPropertyName} from ${WFInput}");
  v32 = [(WFActionParameterSummaryValue *)v30 initWithKey:@"Mode(Remove),RemoveSpecifiedValue,WFContentItemPropertyName,WFInput" summaryString:v31];
  [v49 addObject:v32];

  id v33 = [WFActionParameterSummaryValue alloc];
  uint64_t v34 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} from ${WFInput}", @"${Mode} ${WFContentItemPropertyName} from ${WFInput}");
  id v35 = [(WFActionParameterSummaryValue *)v33 initWithKey:@"Mode(Remove),WFContentItemPropertyName,WFInput" summaryString:v34];
  [v49 addObject:v35];

  id v36 = [WFActionParameterSummaryValue alloc];
  id v37 = WFLocalizedStringResourceWithKey(@"${Mode} ${WFContentItemPropertyName} from ${WFInput}", @"${Mode} ${WFContentItemPropertyName} from ${WFInput}");
  id v38 = [(WFActionParameterSummaryValue *)v36 initWithKey:@"Mode(RemoveAll),WFContentItemPropertyName,WFInput" summaryString:v37];
  [v49 addObject:v38];

  uint64_t v39 = [[WFActionParameterSummary alloc] initWithValues:v49];
  return v39;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self definition];
  uint64_t v6 = [v5 name];

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentItemSetterAction;
    uint64_t v7 = [(WFAction *)&v13 localizedNameWithContext:v4];
  }
  else
  {
    int v8 = WFLocalizedStringResourceWithKey(@"WFContentItemSetterAction - Action Name", @"Edit %@");
    int v9 = NSString;
    objc_super v10 = [v4 localize:v8];
    int v11 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
    uint64_t v7 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
  }
  return v7;
}

- (NSArray)properties
{
  uint64_t v2 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"settable");
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

@end