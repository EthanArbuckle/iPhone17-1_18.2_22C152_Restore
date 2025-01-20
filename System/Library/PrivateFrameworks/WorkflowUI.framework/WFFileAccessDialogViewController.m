@interface WFFileAccessDialogViewController
- (void)loadView;
@end

@implementation WFFileAccessDialogViewController

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)WFFileAccessDialogViewController;
  [(WFCompactDialogViewController *)&v22 loadView];
  v3 = [(WFCompactDialogViewController *)self request];
  v4 = [v3 message];
  v5 = [(WFCompactPlatterViewController *)self platterView];
  [v5 setSecondaryText:v4];

  objc_initWeak(&location, self);
  v6 = objc_opt_new();
  v7 = [v3 cancelButton];

  if (v7)
  {
    v8 = [v3 cancelButton];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __44__WFFileAccessDialogViewController_loadView__block_invoke;
    v19[3] = &unk_2649CBEF8;
    objc_copyWeak(&v20, &location);
    v9 = +[WFCompactDialogAction actionForButton:v8 handler:v19];
    [v6 addObject:v9];

    objc_destroyWeak(&v20);
  }
  v10 = [v3 okButton];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __44__WFFileAccessDialogViewController_loadView__block_invoke_2;
  v16 = &unk_2649CB368;
  objc_copyWeak(&v18, &location);
  id v11 = v3;
  id v17 = v11;
  v12 = +[WFCompactDialogAction actionForButton:v10 handler:&v13];
  objc_msgSend(v6, "addObject:", v12, v13, v14, v15, v16);

  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v6];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __44__WFFileAccessDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)[objc_alloc(MEMORY[0x263F86B30]) initWithFileResponseCode:0 error:0];
  [WeakRetained finishWithResponse:v1];
}

void __44__WFFileAccessDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x263F86B38]);
  v4 = [*(id *)(a1 + 32) URLs];
  v5 = [*(id *)(a1 + 32) workflowID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__WFFileAccessDialogViewController_loadView__block_invoke_3;
  v6[3] = &unk_2649CBCE0;
  v6[4] = WeakRetained;
  [v3 extendDocumentURLs:v4 workflowID:v5 completion:v6];
}

void __44__WFFileAccessDialogViewController_loadView__block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  v5 = *(void **)(a1 + 32);
  id v6 = objc_alloc(MEMORY[0x263F86B30]);
  if (a2)
  {
    uint64_t v7 = 1;
    id v8 = 0;
  }
  else
  {
    uint64_t v7 = 2;
    id v8 = v10;
  }
  v9 = (void *)[v6 initWithFileResponseCode:v7 error:v8];
  [v5 finishWithResponse:v9];
}

@end