@interface OBWelcomeController
@end

@implementation OBWelcomeController

uint64_t __67__OBWelcomeController_Spinner___showButtonTraySpinnerWithBusyText___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    v4 = [v3 buttonTray];
    int v5 = [v4 _containsSSOBBoldTrayButton];

    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      v7 = [v6 buttonTray];
      [v7 showButtonsBusy];
    }
    else
    {
      [v6 _prepareSpinner];
      v8 = [*(id *)(a1 + 32) buttonTray];
      v9 = [v8 _hide];
      [*(id *)(a1 + 32) setCachedButtons:v9];

      v10 = [*(id *)(a1 + 32) buttonTray];
      v11 = [*(id *)(a1 + 32) spinnerContainer];
      [v10 addButton:v11];

      v7 = [*(id *)(a1 + 32) spinner];
      [v7 startAnimating];
    }

    v3 = *(void **)(a1 + 32);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  return [v3 _updateBusyText:v12];
}

void __54__OBWelcomeController_Spinner___hideButtonTraySpinner__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimating:0];
  int v2 = [*(id *)(a1 + 32) buttonTray];
  int v3 = [v2 _containsSSOBBoldTrayButton];

  v4 = [*(id *)(a1 + 32) buttonTray];
  id v13 = v4;
  if (v3)
  {
    [v4 showButtonsAvailable];
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) spinnerContainer];
    int v6 = [v13 _containsButton:v5];

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) buttonTray];
      v8 = [*(id *)(a1 + 32) spinnerContainer];
      [v7 removeButton:v8];
    }
    v9 = [*(id *)(a1 + 32) spinner];
    [v9 stopAnimating];

    v10 = [*(id *)(a1 + 32) buttonTray];
    v11 = [*(id *)(a1 + 32) cachedButtons];
    [v10 _show:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    [v12 setCachedButtons:0];
  }
}

@end