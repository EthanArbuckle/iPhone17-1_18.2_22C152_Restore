@interface WFHomeAccessoryPickerParameterEditingController
- (void)actionBuilderEditor:(id)a3 didFinishWithTriggerActionSetBuilder:(id)a4;
- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4;
- (void)finishWithActionSets:(id)a3 home:(id)a4;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
@end

@implementation WFHomeAccessoryPickerParameterEditingController

- (void)finishWithActionSets:(id)a3 home:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F86BC8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = WFSerializableHomeIdentifier();

  id v12 = (id)[v9 initWithActionSets:v8 homeIdentifier:v10];
  v11 = [(WFUIKitParameterEditingController *)self delegate];
  [v11 finishEditingWithParameterState:v12];
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v5 = a4;
  id v9 = v5;
  if (v5)
  {
    v6 = [v5 triggerActionSets];
    id v7 = [v6 allActionSets];
    id v8 = [v9 home];
    [(WFHomeAccessoryPickerParameterEditingController *)self finishWithActionSets:v7 home:v8];
  }
  else
  {
    v6 = [(WFUIKitParameterEditingController *)self delegate];
    [v6 cancelEditing];
  }
}

- (void)actionBuilderEditor:(id)a3 didFinishWithTriggerActionSetBuilder:(id)a4
{
  id v5 = a4;
  id v8 = v5;
  if (v5)
  {
    v6 = [v5 allActionSets];
    id v7 = [v8 home];
    [(WFHomeAccessoryPickerParameterEditingController *)self finishWithActionSets:v6 home:v7];
  }
  else
  {
    v6 = [(WFUIKitParameterEditingController *)self delegate];
    [v6 cancelEditing];
  }
}

- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F86C08] sharedManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__WFHomeAccessoryPickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke;
  v11[3] = &unk_264BFD958;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 ensureHomesAreLoadedWithCompletionHandler:v11];
}

void __106__WFHomeAccessoryPickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) triggerActionSetsBuilder];
  v3 = v2;
  if (v2)
  {
    if ([v2 hasActions])
    {
      Class HUTriggerSummaryViewControllerClass = getHUTriggerSummaryViewControllerClass();
      id v5 = [v3 home];
      id v6 = [(objc_class *)HUTriggerSummaryViewControllerClass createTriggerSummaryViewControllerForHome:v5 withTriggerActionSetBuilder:v3 andTriggerActionBuilderEditorDelegate:*(void *)(a1 + 40)];
    }
    else
    {
      Class HFPlaceholderTriggerBuilderClass = getHFPlaceholderTriggerBuilderClass();
      id v9 = [v3 home];
      getHUTriggerBuilderContextClass();
      id v10 = objc_opt_new();
      id v5 = [(objc_class *)HFPlaceholderTriggerBuilderClass createPlaceholderTriggerForHome:v9 withTriggerActionSetBuilder:v3 context:v10];

      v11 = (void *)[objc_alloc(getHUTriggerActionFlowClass()) initWithFlowState:4];
      id v6 = [(objc_class *)getHUShortcutsTriggerViewUtilitiesClass() triggerActionPickerViewControllerWithTriggerBuilder:v5 flow:v11 delegate:*(void *)(a1 + 40)];
      id v12 = (id)objc_msgSend(v6, "hu_preloadContent");
    }
    v13 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      v15 = "-[WFHomeAccessoryPickerParameterEditingController createViewControllerWithInitialState:completionHandler:]_block_invoke";
      _os_log_impl(&dword_23490C000, v7, OS_LOG_TYPE_FAULT, "%s Missing trigger action sets builder.", (uint8_t *)&v14, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end