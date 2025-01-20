@interface WFLinkResultDialogViewController
- (id)snippetInteractedResponseWithURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFLinkResultDialogViewController

- (id)snippetInteractedResponseWithURL:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F85360];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithRequestedOpenURL:v4];

  return v5;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)WFLinkResultDialogViewController;
  [(WFLinkDialogViewController *)&v13 viewDidLoad];
  v3 = [(WFCompactPlatterViewController *)self platterView];
  [v3 setAccessibilityIdentifier:@"junior_link_result_platter_view"];

  id v4 = objc_opt_new();
  objc_initWeak(&location, self);
  v5 = [(WFCompactDialogViewController *)self request];
  v6 = [v5 doneButton];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke;
  v10[3] = &unk_2649CBEF8;
  objc_copyWeak(&v11, &location);
  v7 = +[WFCompactDialogAction actionForButton:v6 handler:v10];
  [v4 addObject:v7];

  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v4];
  v8 = [(WFCompactDialogViewController *)self request];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke_2;
  v9[3] = &unk_2649CB6E0;
  v9[4] = self;
  [v8 getCATResultWithCompletionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)[objc_alloc(MEMORY[0x263F85360]) initWithCancelled:0];
  [WeakRetained finishWithResponse:v1];
}

void __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = [a2 captionPrint];
  v3 = [v5 firstObject];
  id v4 = [*(id *)(a1 + 32) platterView];
  [v4 setSecondaryText:v3];
}

@end