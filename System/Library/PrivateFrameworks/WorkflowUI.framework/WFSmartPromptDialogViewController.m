@interface WFSmartPromptDialogViewController
- (BOOL)shouldHideSashView;
- (NSArray)actions;
- (UIStackView)sourceDestinationView;
- (WFContentCollection)dataSource;
- (void)finishWithResult:(unint64_t)a3;
- (void)loadContentCollection;
- (void)loadView;
- (void)setActions:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSourceDestinationView:(id)a3;
@end

@implementation WFSmartPromptDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_sourceDestinationView);
}

- (void)setActions:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setSourceDestinationView:(id)a3
{
}

- (UIStackView)sourceDestinationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceDestinationView);
  return (UIStackView *)WeakRetained;
}

- (void)finishWithResult:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [(WFCompactDialogViewController *)self request];
  v7 = [v6 configuration];
  v8 = [v7 deletionAuthorizationState];

  v9 = (void *)MEMORY[0x263F86EC8];
  v10 = [(WFCompactDialogViewController *)self request];
  v11 = [v10 configuration];
  if (v8)
  {
    id v17 = 0;
    v12 = [v9 prepareDeletionAuthorizationDatabaseDataFromConfiguration:v11 resultCode:a3 error:&v17];
    id v13 = v17;
    [v5 addObject:v12];
  }
  else
  {
    id v16 = 0;
    v12 = [v9 prepareSmartPromptsDatabaseDataFromConfiguration:v11 resultCode:a3 error:&v16];
    id v13 = v16;
    uint64_t v14 = [v12 mutableCopy];

    v5 = (void *)v14;
  }

  v15 = (void *)[objc_alloc(MEMORY[0x263F86EC8]) initWithResult:a3 promptedStatesData:v5];
  [(WFCompactDialogViewController *)self finishWithResponse:v15];
}

- (BOOL)shouldHideSashView
{
  return 0;
}

- (void)loadContentCollection
{
  v3 = [(WFSmartPromptDialogViewController *)self dataSource];

  if (!v3)
  {
    v4 = [(WFCompactDialogViewController *)self request];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke;
    v5[3] = &unk_2649CBA88;
    v5[4] = self;
    [v4 getContentCollectionWithCompletionHandler:v5];
  }
}

void __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setDataSource:v3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_2;
  v6[3] = &unk_2649CC018;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_2(uint64_t a1)
{
  v31[4] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) numberOfItems])
  {
    v29 = objc_opt_new();
    [*(id *)(a1 + 40) setContentViewController:v29];
    v2 = [*(id *)(a1 + 40) dataSource];
    id v3 = +[WFSmartPromptHostingControllerFactory makeHostingController:v2];

    uint64_t v4 = [*(id *)(a1 + 40) contentViewController];
    [v4 addChildViewController:v3];

    id v5 = [*(id *)(a1 + 40) contentViewController];
    v6 = [v5 view];

    id v7 = [v3 view];
    [v6 addSubview:v7];
    v28 = v3;
    uint64_t v8 = [v3 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [MEMORY[0x263F825C8] clearColor];
    v10 = [v3 view];
    [v10 setBackgroundColor:v9];

    v21 = (void *)MEMORY[0x263F08938];
    v26 = [v7 topAnchor];
    v25 = [v6 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v31[0] = v24;
    v23 = [v7 bottomAnchor];
    v22 = [v6 bottomAnchor];
    v11 = [v23 constraintEqualToAnchor:v22];
    v31[1] = v11;
    v12 = [v7 leftAnchor];
    v27 = v6;
    id v13 = [v6 leftAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    v31[2] = v14;
    v15 = [v7 rightAnchor];
    id v16 = [v6 rightAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    v31[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    [v21 activateConstraints:v18];

    v19 = [*(id *)(a1 + 40) contentViewController];
    [v28 didMoveToParentViewController:v19];

    [*(id *)(a1 + 40) invalidateContentSize];
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_3;
    block[3] = &unk_2649CBF20;
    block[4] = *(void *)(a1 + 40);
    dispatch_after(v20, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateContentSize];
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)WFSmartPromptDialogViewController;
  [(WFCompactDialogViewController *)&v11 loadView];
  id v3 = [(WFSmartPromptDialogViewController *)self actions];
  BOOL v4 = (unint64_t)[v3 count] > 2;
  id v5 = [(WFCompactPlatterViewController *)self platterView];
  [v5 setArrangeActionsVertically:v4];

  v6 = [(WFCompactPlatterViewController *)self platterView];
  id v7 = [(WFCompactDialogViewController *)self request];
  uint64_t v8 = [v7 secondaryText];
  [v6 setSecondaryText:v8];

  v9 = [(WFCompactPlatterViewController *)self platterView];
  [v9 setSecondaryTextAlignment:1];

  v10 = [(WFCompactPlatterViewController *)self platterView];
  [v10 setSecondaryTextFontStyle:*MEMORY[0x263F835B8]];

  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v3];
  [(WFSmartPromptDialogViewController *)self loadContentCollection];
}

- (NSArray)actions
{
  p_actions = &self->_actions;
  actions = self->_actions;
  if (actions)
  {
    BOOL v4 = actions;
  }
  else
  {
    objc_initWeak(location, self);
    BOOL v4 = (NSArray *)objc_opt_new();
    v6 = [(WFCompactDialogViewController *)self request];
    id v7 = [v6 previewButton];

    if (v7)
    {
      uint64_t v8 = [(WFCompactDialogViewController *)self request];
      v9 = [v8 previewButton];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke;
      v36[3] = &unk_2649CBEF8;
      objc_copyWeak(&v37, location);
      v10 = +[WFCompactDialogAction actionForButton:v9 handler:v36];
      [(NSArray *)v4 addObject:v10];

      objc_destroyWeak(&v37);
    }
    objc_super v11 = [(WFCompactDialogViewController *)self request];
    v12 = [v11 allowOnceButton];

    if (v12)
    {
      id v13 = [(WFCompactDialogViewController *)self request];
      uint64_t v14 = [v13 allowOnceButton];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_3;
      v34[3] = &unk_2649CBEF8;
      objc_copyWeak(&v35, location);
      v15 = +[WFCompactDialogAction actionForButton:v14 handler:v34];
      [(NSArray *)v4 addObject:v15];

      objc_destroyWeak(&v35);
    }
    id v16 = [(WFCompactDialogViewController *)self request];
    id v17 = [v16 allowAlwaysButton];

    if (v17)
    {
      v18 = [(WFCompactDialogViewController *)self request];
      v19 = [v18 allowAlwaysButton];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_4;
      v32[3] = &unk_2649CBEF8;
      objc_copyWeak(&v33, location);
      dispatch_time_t v20 = +[WFCompactDialogAction actionForButton:v19 handler:v32];
      [(NSArray *)v4 addObject:v20];

      objc_destroyWeak(&v33);
    }
    v21 = [(WFCompactDialogViewController *)self request];
    v22 = [v21 denyButton];

    if (v22)
    {
      v23 = [(WFCompactDialogViewController *)self request];
      v24 = [v23 denyButton];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __44__WFSmartPromptDialogViewController_actions__block_invoke_5;
      v30 = &unk_2649CBEF8;
      objc_copyWeak(&v31, location);
      v25 = +[WFCompactDialogAction actionForButton:v24 handler:&v27];
      -[NSArray addObject:](v4, "addObject:", v25, v27, v28, v29, v30);

      objc_destroyWeak(&v31);
    }
    objc_storeStrong((id *)p_actions, v4);
    objc_destroyWeak(location);
  }
  return v4;
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained dataSource];
  id v3 = objc_alloc_init(MEMORY[0x263F865F0]);
  [v3 setDelegate:WeakRetained];
  [v3 setDataSource:v2];
  [v3 setModalPresentationStyle:2];
  [v3 setOverrideParentApplicationDisplayIdentifier:*MEMORY[0x263F85610]];
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  BOOL v4 = [v2 items];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_2;
  v5[3] = &unk_2649CBA60;
  v5[4] = &v10;
  void v5[5] = &v6;
  [v4 enumerateObjectsUsingBlock:v5];

  [v3 setIsContentManaged:v7[3] > v11[3]];
  [WeakRetained presentViewController:v3 animated:1 completion:0];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishWithResult:2];
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishWithResult:1];
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained request];
  v2 = [v1 denyButton];
  id v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F87468]];

  if (v4) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 0;
  }
  [WeakRetained finishWithResult:v5];
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 attributionSet];
  int v4 = [v3 isAllowedToBeSentToDestinationWithManagedLevel:1];

  if (v4)
  {
    uint64_t v5 = a1 + 32;
    uint64_t v6 = v9;
  }
  else
  {
    id v7 = [v9 attributionSet];
    int v8 = [v7 isAllowedToBeSentToDestinationWithManagedLevel:2];

    uint64_t v6 = v9;
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v5 = a1 + 40;
  }
  ++*(void *)(*(void *)(*(void *)v5 + 8) + 24);
LABEL_6:
}

@end