@interface WFHomeServicePickerParameterEditingController
- (HMHome)home;
- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4;
- (void)servicePickerDidCancel:(id)a3;
- (void)servicePickerDidFinish:(id)a3 selectedServices:(id)a4;
- (void)setHome:(id)a3;
@end

@implementation WFHomeServicePickerParameterEditingController

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)servicePickerDidCancel:(id)a3
{
  id v3 = [(WFUIKitParameterEditingController *)self delegate];
  [v3 cancelEditing];
}

- (void)servicePickerDidFinish:(id)a3 selectedServices:(id)a4
{
  id v12 = a4;
  v5 = [(WFHomeServicePickerParameterEditingController *)self home];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F86BE0]);
    v7 = [v12 anyObject];
    v8 = [(WFHomeServicePickerParameterEditingController *)self home];
    v9 = WFSerializableHomeIdentifier();
    v10 = (void *)[v6 initWithService:v7 homeIdentifier:v9];

    v11 = [(WFUIKitParameterEditingController *)self delegate];
    [v11 finishEditingWithParameterState:v10];
  }
  else
  {
    v10 = [(WFUIKitParameterEditingController *)self delegate];
    [v10 cancelEditing];
  }
}

- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F86C08] sharedManager];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __104__WFHomeServicePickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke;
  v12[3] = &unk_264BFD790;
  id v13 = v6;
  id v14 = v8;
  v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  [v10 ensureHomesAreLoadedWithCompletionHandler:v12];
}

void __104__WFHomeServicePickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) homeIdentifier];
  uint64_t v3 = [v2 length];

  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v5 = [*(id *)(a1 + 32) homeIdentifier];
    id v11 = [v4 homeWithIdentifier:v5];

    uint64_t v6 = (uint64_t)v11;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) primaryHome];
  }
  id v12 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "setHome:");
    id v7 = [*(id *)(a1 + 32) service];
    if (v7)
    {
      v8 = [MEMORY[0x263EFFA08] setWithObject:v7];
    }
    else
    {
      v8 = 0;
    }
    id v9 = [[WFHUShortcutsTriggerViewAccessoryViewController alloc] initWithHome:v12 services:v8];
    [(WFHUShortcutsTriggerViewAccessoryViewController *)v9 setDelegate:*(void *)(a1 + 48)];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end