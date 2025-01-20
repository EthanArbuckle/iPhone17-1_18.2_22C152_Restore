@interface SUItemTableViewController
- (BOOL)openDocumentForItemAtIndexPath:(id)a3 withApplication:(id)a4;
- (BOOL)purchaseItemAtIndexPath:(id)a3;
- (SUItemTableViewController)init;
- (id)_preferredApplicationFromCandidates:(id)a3;
- (id)_tableCellForButton:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (void)_chooseApplicationToOpenDocumentAtIndexPath:(id)a3 withCompletionHandler:(id)a4;
- (void)_hidePurchaseConfirmationForButton:(id)a3;
- (void)_promptToOpenUTI:(id)a3 fromIndexPath:(id)a4 withCompletionHandler:(id)a5;
- (void)_purchasedItemSetChangedNotification:(id)a3;
- (void)_removeTouchCaptureView;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_showPurchaseConfirmationForButton:(id)a3;
- (void)_touchCaptureAction:(id)a3;
- (void)dealloc;
- (void)itemOfferButtonAction:(id)a3;
- (void)reloadData;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUItemTableViewController

- (SUItemTableViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUItemTableViewController;
  v2 = [(SUTableViewController *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x263F536E0] object:0];
    [v3 addObserver:v2 selector:sel__purchasedItemSetChangedNotification_ name:@"SUPurchasedItemIdentifiersChangedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F536E0] object:0];
  [v3 removeObserver:self name:@"SUPurchasedItemIdentifiersChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUItemTableViewController;
  [(SUTableViewController *)&v4 dealloc];
}

- (id)itemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)openDocumentForItemAtIndexPath:(id)a3 withApplication:(id)a4
{
  objc_super v5 = [(SUTableViewController *)self tableView];
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v5, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0), 5);
  return 1;
}

- (BOOL)purchaseItemAtIndexPath:(id)a3
{
  objc_super v4 = [(SUTableViewController *)self tableView];
  -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v4, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0), 5);
  return 1;
}

- (void)reloadData
{
  [(SUItemTableViewController *)self _removeTouchCaptureView];
  v3.receiver = self;
  v3.super_class = (Class)SUItemTableViewController;
  [(SUTableViewController *)&v3 reloadData];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUItemTableViewController *)self _removeTouchCaptureView];
  v5.receiver = self;
  v5.super_class = (Class)SUItemTableViewController;
  [(SUTableViewController *)&v5 viewWillDisappear:v3];
}

- (void)itemOfferButtonAction:(id)a3
{
  if (([a3 isShowingConfirmation] & 1) != 0 || !objc_msgSend(a3, "shouldShowConfirmation"))
  {
    uint64_t v5 = [a3 superviewOfClass:objc_opt_class()];
    if (!v5) {
      goto LABEL_16;
    }
    v6 = [(UITableView *)[(SUTableViewController *)self tableView] indexPathForCell:v5];
    if (!v6) {
      goto LABEL_16;
    }
    v7 = v6;
    id v8 = [(SUItemTableViewController *)self itemAtIndexPath:v6];
    if (!v8) {
      goto LABEL_16;
    }
    v9 = v8;
    if ([v8 itemType] == 11
      || (v10 = (void *)[v9 itemMediaKind],
          [v10 isEqualToString:*MEMORY[0x263F7B958]]))
    {
      [a3 setEnabled:0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __51__SUItemTableViewController_itemOfferButtonAction___block_invoke;
      v11[3] = &unk_264813DC0;
      v11[4] = a3;
      v11[5] = self;
      v11[6] = v7;
      v11[7] = v9;
      [(SUItemTableViewController *)self _chooseApplicationToOpenDocumentAtIndexPath:v7 withCompletionHandler:v11];
      return;
    }
    if ([(SUItemTableViewController *)self purchaseItemAtIndexPath:v7])
    {
      [(SUItemTableViewController *)self _removeTouchCaptureView];
    }
    else
    {
LABEL_16:
      [(SUItemTableViewController *)self _hidePurchaseConfirmationForButton:a3];
    }
  }
  else
  {
    [(SUItemTableViewController *)self _showPurchaseConfirmationForButton:a3];
  }
}

void __51__SUItemTableViewController_itemOfferButtonAction___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setEnabled:1];
  if (a3
    && ([*(id *)(a1 + 40) openDocumentForItemAtIndexPath:*(void *)(a1 + 48) withApplication:a3] & 1) != 0)
  {
    if (!a2) {
      return;
    }
  }
  else
  {
    [*(id *)(a1 + 40) _hidePurchaseConfirmationForButton:*(void *)(a1 + 32)];
    if (!a2) {
      return;
    }
  }
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F89488]), "initWithDialogDictionary:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "defaultStoreOffer"), "documentCannotOpenDialog"), "dialogDictionary"));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "clientInterface"), "_presentDialog:", v6);
}

- (void)_touchCaptureAction:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "passThroughViews"), "objectAtIndex:", 0);

  [(SUItemTableViewController *)self _hidePurchaseConfirmationForButton:v4];
}

- (void)_purchasedItemSetChangedNotification:(id)a3
{
  BOOL v3 = [(SUTableViewController *)self tableView];

  [(UITableView *)v3 reloadData];
}

- (void)_restrictionsChangedNotification:(id)a3
{
  BOOL v3 = (void *)[(SUItemTableViewController *)self mainThreadProxy];

  [v3 reloadData];
}

- (void)_chooseApplicationToOpenDocumentAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  v7 = objc_msgSend(-[SUItemTableViewController itemAtIndexPath:](self, "itemAtIndexPath:"), "defaultStoreOffer");
  id v8 = (void *)[v7 documentRequiredHandlers];
  if ([v8 count])
  {
    id v9 = [(SUItemTableViewController *)self _preferredApplicationFromCandidates:v8];
    if (!a4) {
      return;
    }
LABEL_3:
    v10 = (void (*)(id, BOOL))*((void *)a4 + 2);
    v10(a4, v9 == 0);
    return;
  }
  v11 = (void *)[v7 offerMedia];
  CFStringRef v12 = (CFStringRef)(id)[v7 documentUTI];
  if (!v12)
  {
    CFStringRef v12 = SUCopyUTIForFilePath(objc_msgSend((id)objc_msgSend(v11, "URL"), "path"), 1);
    if (!v12)
    {
      id v9 = 0;
      if (!a4) {
        return;
      }
      goto LABEL_3;
    }
  }
  v13 = (__CFString *)v12;
  [(SUItemTableViewController *)self _promptToOpenUTI:v12 fromIndexPath:a3 withCompletionHandler:a4];
}

- (void)_hidePurchaseConfirmationForButton:(id)a3
{
  id v5 = -[SUItemTableViewController _tableCellForButton:](self, "_tableCellForButton:");
  [(id)objc_opt_class() defaultAnimationDuration];
  double v7 = v6;
  objc_msgSend(a3, "setShowingConfirmation:duration:", 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke;
  v9[3] = &unk_264812130;
  v9[4] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke_2;
  v8[3] = &unk_264813DE8;
  v8[4] = v5;
  v8[5] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v9 animations:v8 completion:v7];
}

uint64_t __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

uint64_t __64__SUItemTableViewController__hidePurchaseConfirmationForButton___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUsesSubviews:0];
  v2 = *(void **)(a1 + 40);

  return [v2 _removeTouchCaptureView];
}

- (id)_preferredApplicationFromCandidates:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(a3);
    }
    id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if ([MEMORY[0x263F01868] applicationProxyForIdentifier:v8]) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_promptToOpenUTI:(id)a3 fromIndexPath:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263F1C5D0]);
  [v9 setName:&stru_26DB8C5F8];
  [v9 setUTI:a3];
  long long v10 = [[SUDocumentInteractionSession alloc] initWithDocumentInteractionController:v9];
  self->_documentInteractionSession = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__SUItemTableViewController__promptToOpenUTI_fromIndexPath_withCompletionHandler___block_invoke;
  v13[3] = &unk_264813E10;
  v13[4] = self;
  v13[5] = a5;
  [(SUDocumentInteractionSession *)v10 setCompletionHandler:v13];
  long long v11 = [(UITableView *)[(SUTableViewController *)self tableView] cellForRowAtIndexPath:a4];
  uint64_t v12 = [(UITableViewCell *)v11 accessoryView];
  if (v12) {
    long long v11 = (UITableViewCell *)v12;
  }
  [(UITableViewCell *)v11 bounds];
  if ((objc_msgSend(v9, "presentOpenInMenuFromRect:inView:animated:", v11, 1) & 1) == 0) {
    [(SUDocumentInteractionSession *)self->_documentInteractionSession cancel];
  }
}

uint64_t __82__SUItemTableViewController__promptToOpenUTI_fromIndexPath_withCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1176) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_removeTouchCaptureView
{
  if ([(SUItemTableViewController *)self isViewLoaded])
  {
    BOOL v3 = objc_msgSend((id)-[SUItemTableViewController view](self, "view"), "window");
    [v3 removeTouchCaptureViewWithTag:452];
  }
}

- (void)_showPurchaseConfirmationForButton:(id)a3
{
  id v5 = -[SUItemTableViewController _tableCellForButton:](self, "_tableCellForButton:");
  [v5 setUsesSubviews:1];
  [(id)objc_opt_class() defaultAnimationDuration];
  double v7 = v6;
  [MEMORY[0x263F1CB60] beginAnimations:0 context:a3];
  [MEMORY[0x263F1CB60] setAnimationDuration:v7];
  [a3 setShowingConfirmation:1 duration:v7];
  [v5 layoutSubviews];
  [MEMORY[0x263F1CB60] commitAnimations];
  id v8 = objc_msgSend((id)objc_msgSend(a3, "window"), "addTouchCaptureViewWithTag:", 452);
  [v8 addTarget:self action:sel__touchCaptureAction_ forControlEvents:1];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, 0);

  [v8 setPassThroughViews:v9];
}

- (id)_tableCellForButton:(id)a3
{
  for (i = (void *)[a3 superview]; i; i = objc_msgSend(i, "superview"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  return i;
}

@end