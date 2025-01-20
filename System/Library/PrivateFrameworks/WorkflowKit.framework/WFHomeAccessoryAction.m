@interface WFHomeAccessoryAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (HMHome)home;
- (NSArray)actionSets;
- (NSArray)shortcutsDictionaryRepresentations;
- (NSString)homeIdentifier;
- (id)homeName;
- (id)localizedAttributionWithContext:(id)a3;
- (id)localizedSummaryText;
- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4;
- (void)dealloc;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)initializeParameters;
- (void)localizedParameterSummaryWithCompletion:(id)a3;
- (void)performHomeAccessoryAction;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFHomeAccessoryAction

- (void)homeManagerDidUpdateHomes:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WFHomeAccessoryAction_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__WFHomeAccessoryAction_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nameUpdated];
}

- (id)localizedSummaryText
{
  v3 = [(WFHomeAccessoryAction *)self home];
  if (v3)
  {
    id v4 = objc_alloc(getHFTriggerActionSetsBuilderClass_34592());
    v5 = [(WFHomeAccessoryAction *)self actionSets];
    v6 = (void *)[v4 initWithActionSets:v5 inHome:v3];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v6 actionSetsSummary];
  v8 = [v7 summaryText];

  if ([v8 length])
  {
    v9 = NSString;
    v10 = WFLocalizedString(@"Set %@");
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);
  }
  else
  {
    v11 = [(WFAction *)self localizedName];
  }

  return v11;
}

- (void)localizedParameterSummaryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[WFHomeManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__WFHomeAccessoryAction_localizedParameterSummaryWithCompletion___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 ensureHomesAreLoadedWithCompletionHandler:v7];
}

void __65__WFHomeAccessoryAction_localizedParameterSummaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) localizedSummaryText];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)homeName
{
  id v2 = [(WFHomeAccessoryAction *)self home];
  v3 = [v2 name];

  return v3;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFHomeAccessoryAction *)self homeName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHomeAccessoryAction;
    id v7 = [(WFAction *)&v10 localizedAttributionWithContext:v4];
  }
  id v8 = v7;

  return v8;
}

- (void)performHomeAccessoryAction
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v11 = [(WFAction *)self parameterStateForKey:@"WFHomeTriggerActionSets"];
  id v2 = [v11 home];
  v3 = [v11 actionSets];
  id v4 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__34613;
  v21[4] = __Block_byref_object_dispose__34614;
  id v22 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
        dispatch_group_enter(v4);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke;
        v14[3] = &unk_1E6551D78;
        v16 = v21;
        v15 = v4;
        [v2 executeActionSet:v8 completionHandler:v14];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke_2;
  block[3] = &unk_1E6558960;
  block[4] = self;
  void block[5] = v21;
  dispatch_group_notify(v4, v9, block);

  _Block_object_dispose(v21, 8);
}

void __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  uint64_t v5 = getHMErrorDomain();
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 25)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      v15[0] = *MEMORY[0x1E4F28588];
      uint64_t v8 = WFLocalizedString(@"Scene or Accessory Not Found");
      v16[0] = v8;
      v15[1] = *MEMORY[0x1E4F28568];
      v9 = WFLocalizedString(@"Please make sure the selected Home scene or accessory is available in your home.");
      v16[1] = v9;
      objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      uint64_t v11 = [v7 errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v10];

      id v3 = (id)v11;
    }
  }
  else
  {
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
  id v14 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __51__WFHomeAccessoryAction_performHomeAccessoryAction__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = +[WFHomeManager sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E6558B28;
  v5[4] = self;
  [v4 ensureHomesAreLoadedWithCompletionHandler:v5];
}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) actionSets];
  id v3 = [*(id *)(a1 + 32) workflow];
  uint64_t v4 = [v3 environment];

  uint64_t v5 = [*(id *)(a1 + 32) userInterface];
  uint64_t v6 = [v5 userInterfaceType];
  if (v6 == (void *)*MEMORY[0x1E4F5ABF0])
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) userInterface];
    uint64_t v8 = [v7 userInterfaceType];
    BOOL v9 = v8 != (void *)*MEMORY[0x1E4F5ABF8];
  }
  if (v4 == 1 || v9)
  {
LABEL_32:
    [*(id *)(a1 + 32) performHomeAccessoryAction];
    goto LABEL_33;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:buf count:16];
  if (!v11)
  {
LABEL_14:

LABEL_31:
    goto LABEL_32;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v45;
LABEL_8:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v45 != v13) {
      objc_enumerationMutation(v10);
    }
    if ([*(id *)(*((void *)&v44 + 1) + 8 * v14) requiresDeviceUnlock]) {
      break;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:buf count:16];
      if (v12) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }

  int v15 = VCIsDeviceLocked();
  v16 = [*(id *)(a1 + 32) progress];
  long long v17 = [v16 userInfo];
  long long v18 = [v17 objectForKeyedSubscript:@"WFActionDidResume"];
  char v19 = [v18 BOOLValue];

  if (v19) {
    goto LABEL_32;
  }
  long long v20 = [*(id *)(a1 + 32) runningDelegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    id v22 = [*(id *)(a1 + 32) runningDelegate];
    id v10 = [v22 currentRunningContextForAction:*(void *)(a1 + 32)];
  }
  else
  {
    id v10 = 0;
  }
  v23 = [v10 rootWorkflowIdentifier];
  uint64_t v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    v26 = [*(id *)(a1 + 32) workflow];
    id v25 = [v26 workflowID];
  }
  v27 = +[WFDatabaseProxy defaultDatabase];
  v28 = [v27 configuredTriggersForWorkflowID:v25 error:0];

  v29 = [v28 firstObject];
  v30 = v29;
  if (v29)
  {
    if (![v29 shouldPrompt])
    {
      v31 = [v30 trigger];
      LOBYTE(v15) = v15 | [(id)objc_opt_class() isUserInitiated] ^ 1;
    }
    if (v15) {
      goto LABEL_26;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (!v15) {
    goto LABEL_30;
  }
LABEL_26:
  v32 = objc_opt_new();
  [v32 setPreferredStyle:1];
  v33 = [v30 trigger];
  v34 = [v33 localizedDescriptionWithConfigurationSummary];
  [v32 setTitle:v34];

  v35 = NSString;
  v36 = WFLocalizedStringWithKey(@"TapToRunAction", @"Tap to run “%@”");
  v37 = [*(id *)(a1 + 32) localizedSummaryText];
  v38 = objc_msgSend(v35, "stringWithFormat:", v36, v37);
  [v32 setMessage:v38];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_2;
  v43[3] = &unk_1E6558B28;
  v43[4] = *(void *)(a1 + 32);
  [v32 setSuccessHandler:v43];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_3;
  v42[3] = &unk_1E6558B28;
  v42[4] = *(void *)(a1 + 32);
  [v32 setCancellationHandler:v42];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_4;
  v41[3] = &unk_1E6558B28;
  v41[4] = *(void *)(a1 + 32);
  [v32 setFailureHandler:v41];
  v39 = getWFTriggersLogObject();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[WFHomeAccessoryAction runAsynchronouslyWithInput:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_INFO, "%s Presenting secure accessory confirmation dialog and suspending (if the display is off)", buf, 0xCu);
  }

  v40 = [*(id *)(a1 + 32) userInterface];
  [v40 presentAlert:v32];

LABEL_33:
}

uint64_t __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performHomeAccessoryAction];
}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  [v1 finishRunningWithError:v2];
}

void __52__WFHomeAccessoryAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 deviceLockedError];
  [v1 finishRunningWithError:v2];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"WFHome"])
  {
    id v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v9 = v8;
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
    id v11 = v9;

    uint64_t v12 = [v11 value];

    if (v12)
    {
      uint64_t v13 = [WFHFTriggerActionSetsBuilderParameterState alloc];
      uint64_t v14 = [(WFHFTriggerActionSetsBuilderParameterState *)v13 initWithActionSets:MEMORY[0x1E4F1CBF0] homeIdentifier:v12];
      BOOL v10 = [(WFHomeAccessoryAction *)self setParameterState:v14 forKey:@"WFHomeTriggerActionSets"];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFHomeAccessoryAction;
    BOOL v10 = [(WFAction *)&v16 setParameterState:v6 forKey:v7];
  }

  return v10;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"WFHome"])
  {
    id v7 = [(WFHomeAccessoryAction *)self homeIdentifier];
    if (v7) {
      id v8 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHomeAccessoryAction;
    id v8 = [(WFAction *)&v10 parameterStateForKey:v6 fallingBackToDefaultValue:v4];
  }

  return v8;
}

- (NSArray)shortcutsDictionaryRepresentations
{
  id v2 = [(WFAction *)self parameterStateForKey:@"WFHomeTriggerActionSets"];
  id v3 = [v2 serializedActionSets];

  return (NSArray *)v3;
}

- (NSString)homeIdentifier
{
  id v2 = [(WFAction *)self parameterStateForKey:@"WFHomeTriggerActionSets"];
  id v3 = [v2 homeIdentifier];

  return (NSString *)v3;
}

- (NSArray)actionSets
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAction *)self parameterStateForKey:@"WFHomeTriggerActionSets"];
  BOOL v4 = getWFHomeLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      id v6 = [v3 actionSets];
      int v20 = 136315394;
      char v21 = "-[WFHomeAccessoryAction actionSets]";
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEBUG, "%s Retrieved action sets from parameter state: %@", (uint8_t *)&v20, 0x16u);
    }
    id v7 = [v3 actionSets];
  }
  else
  {
    if (v5)
    {
      int v20 = 136315138;
      char v21 = "-[WFHomeAccessoryAction actionSets]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEBUG, "%s No WFHFTriggerActionSetsBuilderParameterState falling back to old run scene", (uint8_t *)&v20, 0xCu);
    }

    id v8 = [(WFAction *)self supplementalParameterValueForKey:@"WFHomeName" ofClass:objc_opt_class()];
    uint64_t v9 = [(WFAction *)self supplementalParameterValueForKey:@"WFHomeSceneName" ofClass:objc_opt_class()];
    objc_super v10 = (void *)v9;
    id v7 = 0;
    if (v8 && v9)
    {
      id v11 = +[WFHomeManager sharedManager];
      uint64_t v12 = [v11 homeNamed:v8];

      if (v12)
      {
        uint64_t v13 = +[WFHomeManager sharedManager];
        uint64_t v14 = [v13 sceneNamed:v10 inHome:v12];

        if (v14
          && (v24[0] = v14,
              [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1],
              (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v7 = (void *)v15;
          objc_super v16 = [WFHFTriggerActionSetsBuilderParameterState alloc];
          long long v17 = WFSerializableHomeIdentifier(v12);
          long long v18 = [(WFHFTriggerActionSetsBuilderParameterState *)v16 initWithActionSets:v7 homeIdentifier:v17];
          [(WFHomeAccessoryAction *)self setParameterState:v18 forKey:@"WFHomeTriggerActionSets"];
        }
        else
        {
          [(WFHomeAccessoryAction *)self setParameterState:0 forKey:@"WFHomeTriggerActionSets"];
          id v7 = 0;
        }
        [(WFAction *)self setSupplementalParameterValue:0 forKey:@"WFHomeName"];
        [(WFAction *)self setSupplementalParameterValue:0 forKey:@"WFHomeSceneName"];
      }
      else
      {
        id v7 = 0;
      }
    }
  }

  return (NSArray *)v7;
}

- (HMHome)home
{
  id v2 = [(WFAction *)self parameterStateForKey:@"WFHomeTriggerActionSets"];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (void)wasAddedToWorkflow:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFHomeAccessoryAction;
  [(WFAction *)&v7 wasAddedToWorkflow:v4];
  BOOL v5 = [(WFAction *)self parameterForKey:@"WFHome"];
  BOOL v6 = [v4 environment] == 2 || objc_msgSend(v4, "environment") == 1;
  [v5 setHidden:v6];
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFHomeAccessoryAction *)self home];

  if (!v5)
  {
    BOOL v6 = +[WFHomeManager sharedManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__WFHomeAccessoryAction_wasAddedToWorkflowByUser___block_invoke;
    v8[3] = &unk_1E6558B28;
    v8[4] = self;
    [v6 ensureHomesAreLoadedWithCompletionHandler:v8];
  }
  v7.receiver = self;
  v7.super_class = (Class)WFHomeAccessoryAction;
  [(WFAction *)&v7 wasAddedToWorkflowByUser:v4];
}

void __50__WFHomeAccessoryAction_wasAddedToWorkflowByUser___block_invoke(uint64_t a1)
{
  id v2 = +[WFHomeManager sharedManager];
  id v6 = [v2 primaryHome];

  if (v6)
  {
    id v3 = [WFHFTriggerActionSetsBuilderParameterState alloc];
    id v4 = WFSerializableHomeIdentifier(v6);
    BOOL v5 = [(WFHFTriggerActionSetsBuilderParameterState *)v3 initWithActionSets:MEMORY[0x1E4F1CBF0] homeIdentifier:v4];

    [*(id *)(a1 + 32) setParameterState:v5 forKey:@"WFHomeTriggerActionSets"];
  }
}

- (void)dealloc
{
  id v3 = +[WFHomeManager sharedManager];
  [v3 removeEventObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFHomeAccessoryAction;
  [(WFHomeAccessoryAction *)&v4 dealloc];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFHomeAccessoryAction;
  [(WFAction *)&v4 initializeParameters];
  id v3 = +[WFHomeManager sharedManager];
  [v3 addEventObserver:self];
}

@end