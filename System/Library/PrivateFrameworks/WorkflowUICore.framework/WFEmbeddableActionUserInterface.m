@interface WFEmbeddableActionUserInterface
- (BOOL)prefersModalPresentation;
- (BOOL)presentContent:(id)a3 completion:(id)a4;
- (UIViewController)contentViewController;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)presentContent:(id)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation WFEmbeddableActionUserInterface

- (void).cxx_destruct
{
}

- (void)setContentViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = [(WFEmbeddableActionUserInterface *)self contentViewController];

  if (v5)
  {
    if ([(WFEmbeddableActionUserInterface *)self prefersModalPresentation]
      && ([(WFActionUserInterface *)self viewControllerForPresenting],
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      v7 = [(WFActionUserInterface *)self viewControllerForPresenting];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
      v12[3] = &unk_264C50E38;
      v12[4] = self;
      v13 = v4;
      [v7 dismissViewControllerAnimated:1 completion:v12];

      v8 = v13;
    }
    else
    {
      v9 = [(WFActionUserInterface *)self delegate];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke_2;
      v10[3] = &unk_264C50E38;
      v10[4] = self;
      v11 = v4;
      [v9 dismissPlatterForActionUserInterface:self completionHandler:v10];

      v8 = v11;
    }
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContentViewController:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __75__WFEmbeddableActionUserInterface_cancelPresentationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setContentViewController:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)presentContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFEmbeddableActionUserInterface *)self prefersModalPresentation]
    && ([(WFActionUserInterface *)self viewControllerForPresenting],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = [(WFActionUserInterface *)self viewControllerForPresenting];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__WFEmbeddableActionUserInterface_presentContent_completion___block_invoke;
    v12[3] = &unk_264C50E10;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    BOOL v10 = 1;
    [v9 presentViewController:v13 animated:1 completion:v12];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __61__WFEmbeddableActionUserInterface_presentContent_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContentViewController:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)presentContent:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = [(WFEmbeddableActionUserInterface *)self contentViewController];

  if (v5)
  {
    id v6 = getWFDialogLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[WFEmbeddableActionUserInterface presentContent:]";
      _os_log_impl(&dword_2352F5000, v6, OS_LOG_TYPE_FAULT, "%s Unable to present a content view controller while one is already active.", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (![(WFEmbeddableActionUserInterface *)self presentContent:v4 completion:0])
  {
    id v7 = [(WFActionUserInterface *)self delegate];
    [v7 actionUserInterface:self showViewControllerInPlatter:v4];

    [(WFEmbeddableActionUserInterface *)self setContentViewController:v4];
  }
}

@end