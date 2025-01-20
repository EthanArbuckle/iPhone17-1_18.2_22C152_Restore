@interface SUUIStoreDialogController
- (SUUIStoreDialogController)init;
- (void)_performActionForDialog:(id)a3 buttonIndex:(int64_t)a4;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)alertViewCancel:(id)a3;
- (void)presentDialog:(id)a3;
- (void)presentDialog:(id)a3 fromViewController:(id)a4;
@end

@implementation SUUIStoreDialogController

- (SUUIStoreDialogController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIStoreDialogController;
  v2 = [(SUUIStoreDialogController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    alerts = v2->_alerts;
    v2->_alerts = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dialogs = v2->_dialogs;
    v2->_dialogs = v5;
  }
  return v2;
}

- (void)presentDialog:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 buttons];
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F82420]);
    [v6 setDelegate:self];
    v7 = [v4 message];
    [v6 setMessage:v7];

    objc_super v8 = [v4 title];
    [v6 setTitle:v8];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "title", (void)v15);
          [v6 addButtonWithTitle:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)self->_alerts addObject:v6];
    [(NSMutableArray *)self->_dialogs addObject:v4];
    [v6 show];
  }
}

- (void)presentDialog:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 buttons];
  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x263F82418];
    uint64_t v10 = [v6 title];
    uint64_t v11 = [v6 message];
    uint64_t v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__SUUIStoreDialogController_presentDialog_fromViewController___block_invoke;
    v15[3] = &unk_265402560;
    id v13 = v12;
    id v16 = v13;
    objc_copyWeak(&v19, &location);
    long long v17 = self;
    id v14 = v6;
    id v18 = v14;
    [v8 enumerateObjectsUsingBlock:v15];
    [(NSMutableArray *)self->_alerts addObject:v13];
    [(NSMutableArray *)self->_dialogs addObject:v14];
    [v7 presentViewController:v13 animated:1 completion:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __62__SUUIStoreDialogController_presentDialog_fromViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x263F82400];
  objc_super v8 = [v5 title];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__SUUIStoreDialogController_presentDialog_fromViewController___block_invoke_2;
  v12[3] = &unk_265402538;
  objc_copyWeak(v15, (id *)(a1 + 56));
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v14 = *(id *)(a1 + 48);
  v15[1] = a3;
  uint64_t v10 = [v7 actionWithTitle:v8 style:0 handler:v12];
  [v6 addAction:v10];

  objc_destroyWeak(v15);
}

void __62__SUUIStoreDialogController_presentDialog_fromViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 48)];
  [WeakRetained _performActionForDialog:*(void *)(a1 + 48) buttonIndex:*(void *)(a1 + 64)];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)self->_alerts indexOfObjectIdenticalTo:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    id v8 = [(NSMutableArray *)self->_dialogs objectAtIndex:v6];
    [(NSMutableArray *)self->_alerts removeObjectAtIndex:v7];
    [(NSMutableArray *)self->_dialogs removeObjectAtIndex:v7];
    [(SUUIStoreDialogController *)self _performActionForDialog:v8 buttonIndex:a4];
  }
}

- (void)alertViewCancel:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 cancelButtonIndex];
  [v5 dismissWithClickedButtonIndex:v4 animated:0];
  [(SUUIStoreDialogController *)self alertView:v5 didDismissWithButtonIndex:v4];
}

- (void)_performActionForDialog:(id)a3 buttonIndex:(int64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 buttons];
  if ([v6 count] > (unint64_t)a4)
  {
    uint64_t v7 = [v6 objectAtIndex:a4];
    int v8 = [v7 actionType];
    if (v8 == 9)
    {
      [MEMORY[0x263F7B178] retryAllRestoreDownloads];
    }
    else if (v8 == 3)
    {
      id v9 = [v7 parameter];
      id v10 = objc_alloc_init(MEMORY[0x263F7B2D8]);
      [v10 setBuyParameters:v9];
      id v11 = objc_alloc(MEMORY[0x263F7B2E8]);
      v15[0] = v10;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      int8x16_t v13 = (void *)[v11 initWithPurchases:v12];

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__SUUIStoreDialogController__performActionForDialog_buttonIndex___block_invoke;
      v14[3] = &unk_265402588;
      v14[4] = self;
      [v13 startWithPurchaseResponseBlock:v14 completionBlock:&__block_literal_global_9];
    }
  }
}

void __65__SUUIStoreDialogController__performActionForDialog_buttonIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SUUIItemStateCenter defaultCenter];
  [v4 evaluatePurchaseResponseForRentals:v3];

  id v9 = (id)objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v3, @"SUUIStoreDialogControllerPurchaseNotificationKeyPurchaseResponse", 0);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUUIStoreDialogControllerPurchaseRequestDidSucceedNotification" object:*(void *)(a1 + 32) userInfo:v9];

  id v6 = objc_alloc(NSDictionary);
  uint64_t v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", v3, *MEMORY[0x263F89770], 0);

  int v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:*MEMORY[0x263F89778] object:*(void *)(a1 + 32) userInfo:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogs, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
}

@end