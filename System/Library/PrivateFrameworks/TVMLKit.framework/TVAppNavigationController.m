@interface TVAppNavigationController
@end

@implementation TVAppNavigationController

uint64_t __80___TVAppNavigationController_iOS__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.15];
  uint64_t v1 = _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __68___TVAppNavigationController_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v7 = [v14 appDocument];
    int v8 = [v7 isEqual:*(void *)(a1 + 32)];

    if (v8)
    {
      v9 = [*(id *)(a1 + 40) viewControllers];
      v10 = (void *)[v9 mutableCopy];

      v11 = [[_TVAppDocumentRequestController alloc] initWithAppDocument:*(void *)(a1 + 48)];
      v12 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x263F4B308]];
      uint64_t v13 = [v12 BOOLValue];

      [(_TVAppDocumentController *)v11 setAdoptsContext:v13];
      [*(id *)(a1 + 40) _doWillLoadAppDocumentWithController:v11];
      [v10 insertObject:v11 atIndex:a3];
      [*(id *)(a1 + 40) setViewControllers:v10 animated:1];
      *a4 = 1;
    }
  }
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissed];
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"TVAppNavigationWillDisplayViewControllerNotification" object:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = +[TVStorePlaybackLaunchShroud sharedShroud];
  uint64_t v5 = [v4 isHidden];

  if ([*(id *)(a1 + 40) presentationStyle] == 7 && *(void *)(a1 + 48))
  {
    v6 = +[_TVModalPresenter presenter];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3;
    v38[3] = &unk_264BA7740;
    v7 = &v39;
    uint64_t v8 = *(void *)(a1 + 48);
    id v39 = *(id *)(a1 + 56);
    v9 = &v40;
    id v40 = WeakRetained;
    id v41 = *(id *)(a1 + 40);
    [v6 hideController:v8 animated:1 withCompletion:v38];

    v10 = v41;
  }
  else
  {
    v10 = +[_TVModalPresenter presenter];
    uint64_t v11 = *(void *)(a1 + 40);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_4;
    v35[3] = &unk_264BA64A0;
    v7 = &v36;
    uint64_t v12 = *(void *)(a1 + 56);
    id v36 = *(id *)(a1 + 48);
    v9 = &v37;
    id v37 = *(id *)(a1 + 40);
    [v10 showController:v12 fromController:WeakRetained withConfiguration:v11 animated:v5 andCompletionBlock:v35];
  }

  uint64_t v13 = [*(id *)(a1 + 56) appDocument];
  id v14 = [v13 templateElement];

  v15 = [v14 elementName];
  if ([v15 isEqualToString:@"playlist"])
  {
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    objc_initWeak(&location, v16);

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__11;
    v32 = __Block_byref_object_dispose__11;
    id v33 = 0;
    id v17 = objc_loadWeakRetained(&location);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_59;
    v24 = &unk_264BA9200;
    uint64_t v25 = *(void *)(a1 + 32);
    objc_copyWeak(&v27, &location);
    v26 = &v28;
    uint64_t v18 = [v17 addObserverForName:@"com.apple.tv.dismissing-playback" object:0 queue:0 usingBlock:&v21];
    v19 = (void *)v29[5];
    v29[5] = v18;

    objc_destroyWeak(&v27);
    _Block_object_dispose(&v28, 8);

    objc_destroyWeak(&location);
  }
  objc_msgSend(WeakRetained, "setPresentedModalViewController:", *(void *)(a1 + 56), v21, v22, v23, v24, v25);
  v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 postNotificationName:@"TVAppNavigationDidDisplayViewControllerNotification" object:*(void *)(a1 + 32)];
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3(void *a1)
{
  id v2 = +[_TVModalPresenter presenter];
  [v2 showController:a1[4] fromController:a1[5] withConfiguration:a1[6] andCompletionBlock:0];
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32) && [*(id *)(a1 + 40) navigationBarHidden])
  {
    id v2 = +[_TVModalPresenter presenter];
    [v2 hideController:*(void *)(a1 + 32) animated:0 withCompletion:0];
  }
}

void __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_59(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissed];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47___TVAppNavigationController_dismissAllModals___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67___TVAppNavigationController_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v19 = a2;
  uint64_t v7 = objc_opt_respondsToSelector();
  id v8 = v19;
  if (v7)
  {
    v9 = [v19 appDocument];
    int v10 = [v9 isEqual:*(void *)(a1 + 32)];

    id v8 = v19;
    if (v10)
    {
      uint64_t v11 = [v19 templateViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        [v19 replaceAppDocumentWithAppDocument:*(void *)(a1 + 40)];
        uint64_t v7 = [v19 setPresentedModal:*(unsigned __int8 *)(a1 + 64)];
      }
      else
      {
        uint64_t v13 = [[_TVAppDocumentRequestController alloc] initWithAppDocument:*(void *)(a1 + 40)];
        [(_TVAppDocumentController *)v13 setPresentedModal:*(unsigned __int8 *)(a1 + 64)];
        id v14 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x263F4B308]];
        uint64_t v15 = [v14 BOOLValue];

        [(_TVAppDocumentController *)v13 setAdoptsContext:v15];
        [*(id *)(a1 + 56) _doWillLoadAppDocumentWithController:v13];
        v16 = [*(id *)(a1 + 56) viewControllers];
        id v17 = (void *)[v16 mutableCopy];

        [v17 replaceObjectAtIndex:a3 withObject:v13];
        [*(id *)(a1 + 56) setViewControllers:v17 animated:1];
      }
      *a4 = 1;
      id v8 = v19;
    }
  }
  return MEMORY[0x270F9A758](v7, v8);
}

@end