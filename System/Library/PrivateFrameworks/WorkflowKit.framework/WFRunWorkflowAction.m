@interface WFRunWorkflowAction
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (BOOL)isProgressIndeterminate;
- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6;
- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6;
- (WFWorkflowController)workflowController;
- (id)contentDestinationWithError:(id *)a3;
- (id)getWorkflowWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)workflowNameFromParameter;
- (void)cancel;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
- (void)getHandoffWorkflowControllerState:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performWithSandboxExtensions:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setHandoffWorkflowControllerState:(id)a3;
- (void)setWorkflowController:(id)a3;
- (void)stop;
- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5;
- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5;
- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6;
@end

@implementation WFRunWorkflowAction

- (void).cxx_destruct
{
}

- (void)setWorkflowController:(id)a3
{
}

- (WFWorkflowController)workflowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflowController);
  return (WFWorkflowController *)WeakRetained;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  v11 = (void (**)(id, void *, void))a4;
  v6 = [(WFAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:a3];
  if (v6)
  {
    v7 = +[WFDatabaseProxy defaultDatabase];
    v8 = [v7 collectionWithIdentifier:v6 error:0];
    v9 = [v7 sortedVisibleWorkflowsInCollection:v8 error:0];
    v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_245_59105);
    v11[2](v11, v10, 0);
  }
  else
  {
    v11[2](v11, 0, 0);
  }
}

id __85__WFRunWorkflowAction_fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFWorkflowParameterStateDescriptor alloc] initWithWorkflowReference:v2 isSelf:0];
  v4 = [(WFVariableSubstitutableParameterState *)[WFWorkflowParameterState alloc] initWithValue:v3];
  uint64_t v5 = [v2 associatedAppBundleIdentifier];
  if (v5
    && (v6 = (void *)v5,
        [v2 associatedAppBundleIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB4560]);
    v10 = [v2 associatedAppBundleIdentifier];
    uint64_t v11 = [v9 initWithBundleIdentifier:v10];
  }
  else
  {
    v10 = [v2 icon];
    uint64_t v11 = [v10 icon];
  }
  v12 = (void *)v11;

  id v13 = objc_alloc(MEMORY[0x1E4FB45E8]);
  v14 = [v2 identifier];
  v15 = [v2 name];
  v16 = [(WFVariableSubstitutableParameterState *)v4 serializedRepresentation];
  v17 = (void *)[v13 initWithIdentifier:v14 name:v15 entryIcon:v12 accessoryIcon:0 serializedParameterState:v16];

  return v17;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  if (v4 == @"WFWorkflow")
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"WFWorkflow"];
  }
  else
  {
    char v6 = 0;
  }

  v7 = [(WFAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v5];

  if (v7) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  uint64_t v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to run another shortcut?");
  BOOL v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(WFAction *)self userInterface];
  v15 = [(WFAction *)self runningDelegate];
  v16 = [v13 runSource];

  char v17 = WFRemoteExecuteActionIfApplicable(v12, v10, v14, v15, v16, v11);
  if ((v17 & 1) == 0) {
    [(WFRunWorkflowAction *)self setHandoffWorkflowControllerState:v10];
  }

  return v17;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  return 0;
}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WFAction *)self userInterface];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(WFAction *)self userInterface];
    id v13 = [v12 dialogTransformer];
    [v13 setCurrentAction:self];

    v14 = [(WFAction *)self userInterface];
    v15 = [v14 dialogTransformer];
    v16 = [(WFAction *)self workflow];
    [v15 setWorkflow:v16];
  }
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)WFRunWorkflowAction;
    [(WFAction *)&v18 cancel];
  }
  else
  {
    char v17 = [v8 output];
    [(WFAction *)self setOutput:v17];

    [(WFAction *)self finishRunningWithError:v9];
  }
}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [MEMORY[0x1E4FB4890] sharedManager];
    id v12 = 0;
    char v10 = [v9 retakeResignedExtensionsWithReason:@"Run Workflow finished Run Workflow" error:&v12];
    id v11 = v12;

    if ((v10 & 1) == 0) {
      [v6 stopWithError:v11];
    }
  }
}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = (void (**)(void))a6;
  char v10 = [(WFAction *)self userInterface];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(WFAction *)self userInterface];
    id v13 = [v12 dialogTransformer];
    [v13 setCurrentAction:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [MEMORY[0x1E4FB4890] sharedManager];
    [v14 resignIssuedExtensionsWithReason:@"Run Workflow running Run Workflow"];

    v9[2](v9);
  }
  else
  {
    Class v15 = NSClassFromString(&cfstr_Wfhealthkitres.isa);
    if (!v15
      || (objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v15, 0),
          (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    }
    char v17 = [v8 resourceManager];
    objc_super v18 = [v17 resourceObjectsOfClasses:v16];
    v19 = objc_msgSend(v18, "if_compactMap:", &__block_literal_global_59131);

    v20 = [MEMORY[0x1E4FB4890] sharedManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
    v21[3] = &unk_1E6556318;
    v22 = v9;
    [v20 requestSandboxExtensionForRunningActionWithAccessResources:v19 completion:v21];
  }
}

uint64_t __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  if ([MEMORY[0x1E4FB4870] hasExtensionForResourceClassName:v1]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)getHandoffWorkflowControllerState:(id)a3
{
  id v9 = (void (**)(id, void))a3;
  v4 = [(WFAction *)self processedParameters];
  BOOL v5 = [v4 objectForKey:@"WFHandoffWorkflowControllerState"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)MEMORY[0x1E4F28DC0];
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    id v8 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v7, v9);
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)setHandoffWorkflowControllerState:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(WFAction *)self processedParameters];
  BOOL v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  [v8 setObject:v9 forKey:@"WFHandoffWorkflowControllerState"];
  [(WFAction *)self setProcessedParameters:v8];
}

- (id)getWorkflowWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = [(WFAction *)self parameterValueForKey:@"WFWorkflow" ofClass:objc_opt_class()];
  if (!v4)
  {
    if (!a3) {
      goto LABEL_16;
    }
    char v10 = (void *)MEMORY[0x1E4F28C58];
    v24[0] = *MEMORY[0x1E4F28588];
    BOOL v5 = WFLocalizedString(@"Shortcut Not Found");
    v25[0] = v5;
    v24[1] = *MEMORY[0x1E4F28568];
    WFLocalizedString(@"Make sure a valid shortcut is selected in the Run Shortcut action.");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    *a3 = [v10 errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v11];

LABEL_14:
    a3 = 0;
    goto LABEL_15;
  }
  BOOL v5 = +[WFDatabaseProxy defaultDatabase];
  id v6 = [v5 workflowRecordForDescriptor:v4 error:a3];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "WFEnforceClass";
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2114;
      id v31 = (id)objc_opt_class();
      __int16 v32 = 2114;
      uint64_t v33 = v7;
      id v13 = v31;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  if (!v9)
  {
    if (!a3)
    {
      id v9 = 0;
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    v22[0] = *MEMORY[0x1E4F28588];
    Class v15 = WFLocalizedString(@"Shortcut Not Found");
    v23[0] = v15;
    v22[1] = *MEMORY[0x1E4F28568];
    v16 = NSString;
    char v17 = WFLocalizedString(@"An occurred while preparing “%@” to run.");
    objc_super v18 = [v4 name];
    v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);
    v23[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    *a3 = [v14 errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v20];

    id v9 = 0;
    goto LABEL_14;
  }
  a3 = [[WFWorkflow alloc] initWithRecord:v9 reference:v4 storageProvider:0 migrateIfNecessary:1 environment:0 error:a3];
LABEL_15:

LABEL_16:
  return a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFRunWorkflowActionProgressContext == a6)
  {
    uint64_t v7 = [(WFRunWorkflowAction *)self workflowController];
    id v11 = [v7 progress];

    [v11 fractionCompleted];
    uint64_t v9 = (uint64_t)(v8 * 100.0);
    char v10 = [(WFAction *)self progress];
    [v10 setCompletedUnitCount:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFRunWorkflowAction;
    -[WFRunWorkflowAction observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [(WFAction *)self parameterValueForKey:@"WFWorkflow" ofClass:objc_opt_class()];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_super v12 = 0;
    goto LABEL_12;
  }
  BOOL v5 = [v4 identifier];
  id v6 = [(WFAction *)self runningDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(WFAction *)self runningDelegate];
    uint64_t v9 = [v8 currentRunningContextForAction:self];
    char v10 = [v9 workflowIdentifier];

    if ([v5 isEqualToString:v10])
    {
      id v11 = getWFSecurityLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315138;
        v19 = "-[WFRunWorkflowAction contentDestinationWithError:]";
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEBUG, "%s Returning nil to avoid prompting for recursion.", (uint8_t *)&v18, 0xCu);
      }

      objc_super v12 = 0;
      goto LABEL_11;
    }
  }
  id v13 = objc_alloc(MEMORY[0x1E4F302A8]);
  v14 = (void *)[v13 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  Class v15 = [MEMORY[0x1E4F302D0] sharedResolver];
  v16 = [v15 resolvedAppMatchingDescriptor:v14];

  objc_super v12 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v16 promptingBehaviour:1];

LABEL_11:
LABEL_12:
  return v12;
}

- (id)workflowNameFromParameter
{
  id v2 = [(WFAction *)self parameterValueForKey:@"WFWorkflow" ofClass:objc_opt_class()];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  BOOL v5 = [v4 name];

  return v5;
}

- (void)cancel
{
  [(WFRunWorkflowAction *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)WFRunWorkflowAction;
  [(WFAction *)&v3 cancel];
}

- (void)stop
{
  id v2 = [(WFRunWorkflowAction *)self workflowController];
  [v2 stop];
}

- (void)performWithSandboxExtensions:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB4890] sharedManager];
  BOOL v5 = [MEMORY[0x1E4FB4898] all];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WFRunWorkflowAction_performWithSandboxExtensions___block_invoke;
  v7[3] = &unk_1E65562D0;
  id v8 = v3;
  id v6 = v3;
  [v4 performWithSandboxExtensions:v5 asynchronousBlock:v7];
}

uint64_t __52__WFRunWorkflowAction_performWithSandboxExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E65562A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WFRunWorkflowAction *)self performWithSandboxExtensions:v6];
}

void __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [v6 finishRunningWithError:a3];
  }
  else
  {
    id v27 = 0;
    id v7 = [v6 getWorkflowWithError:&v27];
    id v8 = v27;
    uint64_t v9 = *(void **)(a1 + 32);
    if (v7)
    {
      char v10 = [v9 userInterface];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        objc_super v12 = [*(id *)(a1 + 32) userInterface];
        id v13 = [v12 dialogTransformer];
        [v13 setWorkflow:v7];
      }
      v14 = objc_alloc_init(WFWorkflowController);
      [(WFWorkflowController *)v14 setWorkflow:v7];
      [(WFWorkflowController *)v14 setDelegate:*(void *)(a1 + 32)];
      [(WFWorkflowController *)v14 setInput:*(void *)(a1 + 40)];
      [(WFWorkflowController *)v14 setDonateInteraction:0];
      Class v15 = [*(id *)(a1 + 32) variableSource];
      v16 = [v15 listenerEndpoints];
      [(WFWorkflowController *)v14 setListenerEndpoints:v16];

      [(WFWorkflowController *)v14 setOutputBehavior:2];
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 328), v14);
      char v17 = [*(id *)(a1 + 32) progress];
      objc_msgSend(v17, "setTotalUnitCount:", objc_msgSend(v17, "totalUnitCount") + 100);

      [(WFWorkflowController *)v14 addObserver:*(void *)(a1 + 32) forKeyPath:@"progress.fractionCompleted" options:0 context:WFRunWorkflowActionProgressContext];
      int v18 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke_2;
      v22[3] = &unk_1E6556280;
      v23 = v14;
      id v19 = v7;
      uint64_t v20 = *(void *)(a1 + 32);
      id v24 = v19;
      uint64_t v25 = v20;
      id v26 = v5;
      v21 = v14;
      [v18 getHandoffWorkflowControllerState:v22];
    }
    else
    {
      [v9 finishRunningWithError:v8];
    }
  }
}

void __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCurrentState:a2];
  [*(id *)(a1 + 32) setRunSource:*MEMORY[0x1E4FB4F48]];
  id v3 = objc_alloc(MEMORY[0x1E4FB4A98]);
  id v4 = [*(id *)(a1 + 40) workflowID];
  id v5 = (void *)[v3 initWithWorkflowIdentifier:v4];
  [*(id *)(a1 + 32) setRunningContext:v5];

  uint64_t v6 = *MEMORY[0x1E4FB4EF0];
  id v7 = [*(id *)(a1 + 32) runningContext];
  [v7 setRunKind:v6];

  id v8 = [*(id *)(a1 + 48) runningDelegate];
  uint64_t v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [*(id *)(a1 + 48) runningDelegate];
    id v16 = [v10 currentRunningContextForAction:*(void *)(a1 + 48)];

    char v11 = v16;
  }
  else
  {
    char v11 = 0;
  }
  id v17 = v11;
  objc_super v12 = [v11 rootWorkflowIdentifier];
  id v13 = v12;
  if (!v12)
  {
    uint64_t v9 = [*(id *)(a1 + 48) workflow];
    id v13 = [(id)v9 workflowID];
  }
  v14 = [*(id *)(a1 + 32) runningContext];
  [v14 setRootWorkflowIdentifier:v13];

  if (!v12)
  {
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
  [*(id *)(a1 + 32) run];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end