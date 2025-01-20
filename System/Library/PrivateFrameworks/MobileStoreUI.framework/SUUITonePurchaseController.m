@interface SUUITonePurchaseController
- (SUUIClientContext)clientContext;
- (SUUITonePurchaseController)initWithItem:(id)a3;
- (UIViewController)parentViewController;
- (void)_dismissContactPicker;
- (void)_finishContactPicker:(id)a3 withContact:(id)a4;
- (void)_finishWithTonePurchase:(id)a3;
- (void)_presentViewController:(id)a3;
- (void)_showContactPicker;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)setClientContext:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)showPurchaseFlowWithCompletionBlock:(id)a3;
@end

@implementation SUUITonePurchaseController

- (SUUITonePurchaseController)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITonePurchaseController;
  v6 = [(SUUITonePurchaseController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(CNContactPickerViewController *)self->_contactPickerController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUITonePurchaseController;
  [(SUUITonePurchaseController *)&v3 dealloc];
}

- (void)showPurchaseFlowWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)__TonePurchaseControllers;
  if (!__TonePurchaseControllers)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = (void *)__TonePurchaseControllers;
    __TonePurchaseControllers = (uint64_t)v6;

    id v5 = (void *)__TonePurchaseControllers;
  }
  [v5 addObject:self];
  v8 = (void *)[v4 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v8;

  v10 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"BUY_TONE_ALERT_TITLE" inTable:@"Tones"];
  }
  else {
  v12 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_ALERT_TITLE" inBundles:0 inTable:@"Tones"];
  }
  [v10 setTitle:v12];

  v13 = [(SUUIItem *)self->_item title];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = self->_clientContext;
    if (v15) {
      [(SUUIClientContext *)v15 localizedStringForKey:@"BUY_TONE_BODY_FORMAT" inTable:@"Tones"];
    }
    else {
    v16 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_BODY_FORMAT" inBundles:0 inTable:@"Tones"];
    }
    v17 = NSString;
    v18 = [(SUUIItem *)self->_item title];
    v19 = [v17 stringWithValidatedFormat:v16, @"%@", 0, v18 validFormatSpecifiers error];
    [v10 setMessage:v19];
  }
  objc_initWeak(location, self);
  if (MGGetBoolAnswer())
  {
    v20 = self->_clientContext;
    v21 = @"Tones";
    if (v20) {
      [(SUUIClientContext *)v20 localizedStringForKey:@"BUY_TONE_SET_AS_DEFAULT_RINGTONE" inTable:v21];
    }
    else {
    v22 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_SET_AS_DEFAULT_RINGTONE" inBundles:0 inTable:v21];
    }

    v23 = (void *)MEMORY[0x263F82400];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke;
    v47[3] = &unk_265401728;
    objc_copyWeak(&v48, location);
    v24 = [v23 actionWithTitle:v22 style:0 handler:v47];
    [v10 addAction:v24];

    objc_destroyWeak(&v48);
  }
  v25 = self->_clientContext;
  v26 = @"Tones";
  if (v25) {
    [(SUUIClientContext *)v25 localizedStringForKey:@"BUY_TONE_SET_AS_DEFAULT_TEXT_TONE" inTable:v26];
  }
  else {
  v27 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_SET_AS_DEFAULT_TEXT_TONE" inBundles:0 inTable:v26];
  }

  v28 = (void *)MEMORY[0x263F82400];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_2;
  v45[3] = &unk_265401728;
  objc_copyWeak(&v46, location);
  v29 = [v28 actionWithTitle:v27 style:0 handler:v45];
  [v10 addAction:v29];

  v30 = self->_clientContext;
  v31 = v26;
  if (v30) {
    [(SUUIClientContext *)v30 localizedStringForKey:@"BUY_TONE_ASSIGN_TO_CONTACT" inTable:v31];
  }
  else {
  v32 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_ASSIGN_TO_CONTACT" inBundles:0 inTable:v31];
  }
  v33 = v4;

  v34 = (void *)MEMORY[0x263F82400];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_3;
  v43[3] = &unk_265401728;
  objc_copyWeak(&v44, location);
  v35 = [v34 actionWithTitle:v32 style:0 handler:v43];
  [v10 addAction:v35];

  v36 = self->_clientContext;
  v37 = v31;
  if (v36) {
    [(SUUIClientContext *)v36 localizedStringForKey:@"BUY_TONE_DONE" inTable:v37];
  }
  else {
  v38 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_DONE" inBundles:0 inTable:v37];
  }

  v39 = (void *)MEMORY[0x263F82400];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_4;
  v41[3] = &unk_265401728;
  objc_copyWeak(&v42, location);
  v40 = [v39 actionWithTitle:v38 style:1 handler:v41];
  [v10 addAction:v40];

  [(SUUITonePurchaseController *)self _presentViewController:v10];
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(location);
}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B348]);
  [v3 setShouldMakeDefaultRingtone:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithTonePurchase:v3];
}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B348]);
  [v3 setShouldMakeDefaultTextTone:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithTonePurchase:v3];
}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showContactPicker];
}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithTonePurchase:0];
}

- (void)contactPickerDidCancel:(id)a3
{
  [(SUUITonePurchaseController *)self _dismissContactPicker];
  [(SUUITonePurchaseController *)self _finishWithTonePurchase:0];
}

- (void)_dismissContactPicker
{
  id v4 = self->_contactPickerController;
  [(CNContactPickerViewController *)v4 setDelegate:0];
  contactPickerController = self->_contactPickerController;
  self->_contactPickerController = 0;

  [(CNContactPickerViewController *)v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_finishContactPicker:(id)a3 withContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F7B348]);
  if (v7)
  {
    objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "iOSLegacyIdentifier"));
    [v8 setAssigneeIdentifier:v9];
    v10 = [v7 identifier];
    [v8 setAssigneeContactIdentifier:v10];
  }
  [(SUUITonePurchaseController *)self _dismissContactPicker];
  if (MGGetBoolAnswer())
  {
    v11 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:1];
    objc_initWeak(location, self);
    v12 = self->_clientContext;
    v13 = @"Tones";
    v26 = v6;
    if (v12) {
      [(SUUIClientContext *)v12 localizedStringForKey:@"BUY_TONE_SET_AS_RINGTONE" inTable:v13];
    }
    else {
    uint64_t v14 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_SET_AS_RINGTONE" inBundles:0 inTable:v13];
    }

    v15 = (void *)MEMORY[0x263F82400];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke;
    v32[3] = &unk_265408190;
    id v16 = v8;
    id v33 = v16;
    objc_copyWeak(&v34, location);
    v17 = [v15 actionWithTitle:v14 style:0 handler:v32];
    v18 = self->_clientContext;
    v19 = v13;
    if (v18) {
      [(SUUIClientContext *)v18 localizedStringForKey:@"BUY_TONE_SET_AS_TEXT_TONE", v19, &v34 inTable];
    }
    else {
    v20 = +[SUUIClientContext localizedStringForKey:@"BUY_TONE_SET_AS_TEXT_TONE", 0, v19, &v34 inBundles inTable];
    }

    v21 = (void *)MEMORY[0x263F82400];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_2;
    v29[3] = &unk_265408190;
    id v30 = v16;
    objc_copyWeak(&v31, location);
    v22 = [v21 actionWithTitle:v20 style:0 handler:v29];
    if ([(SUUIItem *)self->_item itemKind] == 16)
    {
      [v11 addAction:v17];
      v23 = v22;
    }
    else
    {
      [v11 addAction:v22];
      v23 = v17;
    }
    [v11 addAction:v23];
    v24 = [v26 transitionCoordinator];
    if (v24)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_3;
      v27[3] = &unk_265406818;
      v27[4] = self;
      id v28 = v11;
      [v24 animateAlongsideTransition:0 completion:v27];
    }
    else
    {
      [(SUUITonePurchaseController *)self _presentViewController:v11];
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(v25);

    objc_destroyWeak(location);
    id v6 = v26;
  }
  else
  {
    [v8 setAssigneeToneStyle:*MEMORY[0x263F7B998]];
    [(SUUITonePurchaseController *)self _finishWithTonePurchase:v8];
  }
}

void __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssigneeToneStyle:*MEMORY[0x263F7B990]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithTonePurchase:*(void *)(a1 + 32)];
}

void __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssigneeToneStyle:*MEMORY[0x263F7B998]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithTonePurchase:*(void *)(a1 + 32)];
}

uint64_t __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentViewController:*(void *)(a1 + 40)];
}

- (void)_finishWithTonePurchase:(id)a3
{
  id completionBlock = self->_completionBlock;
  id v5 = a3;
  id v9 = (id)[completionBlock copy];
  id v6 = self->_completionBlock;
  self->_id completionBlock = 0;

  id v7 = +[SUUIItemStateCenter defaultCenter];
  [v7 purchaseTone:self->_item withProperties:v5 clientContext:self->_clientContext completionBlock:v9];

  [(id)__TonePurchaseControllers removeObject:self];
  if (![(id)__TonePurchaseControllers count])
  {
    id v8 = (void *)__TonePurchaseControllers;
    __TonePurchaseControllers = 0;
  }
}

- (void)_presentViewController:(id)a3
{
  id v8 = a3;
  id v4 = [(SUUITonePurchaseController *)self parentViewController];
  id v5 = [v4 presentedViewController];

  if (v5)
  {
    do
    {
      id v6 = [v4 presentedViewController];

      id v7 = [v6 presentedViewController];

      id v4 = v6;
    }
    while (v7);
  }
  else
  {
    id v6 = v4;
  }
  [v6 presentViewController:v8 animated:1 completion:0];
}

- (void)_showContactPicker
{
  uint64_t v3 = SUUIContactsUIFramework();
  id v4 = (objc_class *)SUUIWeakLinkedClassForString(&cfstr_Cncontactpicke.isa, v3);
  if (v4)
  {
    id v5 = (CNContactPickerViewController *)objc_alloc_init(v4);
    contactPickerController = self->_contactPickerController;
    self->_contactPickerController = v5;

    [(CNContactPickerViewController *)self->_contactPickerController setDelegate:self];
    id v7 = self->_contactPickerController;
    [(SUUITonePurchaseController *)self _presentViewController:v7];
  }
  else
  {
    [(SUUITonePurchaseController *)self _finishWithTonePurchase:0];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_contactPickerController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end