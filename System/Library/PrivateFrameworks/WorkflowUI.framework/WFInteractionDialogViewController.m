@interface WFInteractionDialogViewController
- (BOOL)canHandleFollowUpRequest:(id)a3;
- (BOOL)showCheckmarkOnAppear;
- (WFCompactDialogAction)confirmAction;
- (WFDialogRequest)followUpRequest;
- (WFInteractionCardProgressViewController)progressViewController;
- (WFInteractionCardViewController)cardViewController;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (void)handleFollowUpRequest:(id)a3;
- (void)interactionCardViewControllerDidLoad:(id)a3;
- (void)interactionCardViewControllerDidRequestCancel:(id)a3;
- (void)interactionCardViewControllerDidRequestPunchout:(id)a3;
- (void)loadView;
- (void)setCardViewController:(id)a3;
- (void)setConfirmAction:(id)a3;
- (void)setFollowUpRequest:(id)a3;
- (void)setProgressViewController:(id)a3;
- (void)showProgressWithEvent:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFInteractionDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpRequest, 0);
  objc_storeStrong((id *)&self->_confirmAction, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
}

- (void)setFollowUpRequest:(id)a3
{
}

- (WFDialogRequest)followUpRequest
{
  return self->_followUpRequest;
}

- (void)setConfirmAction:(id)a3
{
}

- (WFCompactDialogAction)confirmAction
{
  return self->_confirmAction;
}

- (void)setProgressViewController:(id)a3
{
}

- (WFInteractionCardProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setCardViewController:(id)a3
{
}

- (WFInteractionCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)interactionCardViewControllerDidRequestCancel:(id)a3
{
  v4 = [(WFInteractionDialogViewController *)self followUpRequest];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(WFCompactDialogViewController *)self request];
  }
  id v9 = v6;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (Class *)0x263F85200;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v7 = (Class *)0x263F852E8;
  }
  v8 = (void *)[objc_alloc(*v7) initWithInteractionResponseCode:0];
  [(WFCompactDialogViewController *)self finishWithResponse:v8];

LABEL_9:
}

- (void)interactionCardViewControllerDidRequestPunchout:(id)a3
{
  v4 = [(WFInteractionDialogViewController *)self followUpRequest];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(WFCompactDialogViewController *)self request];
  }
  id v10 = v6;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (Class *)0x263F85200;
    uint64_t v8 = 2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v7 = (Class *)0x263F852E8;
    uint64_t v8 = 1;
  }
  id v9 = (void *)[objc_alloc(*v7) initWithInteractionResponseCode:v8];
  [(WFCompactDialogViewController *)self finishWithResponse:v9];

LABEL_9:
}

- (void)interactionCardViewControllerDidLoad:(id)a3
{
  v4 = [(WFInteractionDialogViewController *)self confirmAction];
  [v4 setEnabled:1];

  [(WFCompactPlatterViewController *)self scrollToTopAnimated:0];
}

- (void)handleFollowUpRequest:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFInteractionDialogViewController;
  [(WFCompactDialogViewController *)&v18 handleFollowUpRequest:v4];
  [(WFInteractionDialogViewController *)self setFollowUpRequest:v4];
  v5 = [v4 promptForDisplay];
  id v6 = [(WFCompactPlatterViewController *)self platterView];
  [v6 setPrimaryText:v5];

  v7 = [v4 interaction];
  uint64_t v8 = [(WFInteractionDialogViewController *)self cardViewController];
  [v8 updateWithInteraction:v7];

  if ([v7 intentHandlingStatus] == 3) {
    [(WFInteractionDialogViewController *)self showProgressWithEvent:1];
  }
  objc_initWeak(&location, self);
  id v9 = [v4 doneButton];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __59__WFInteractionDialogViewController_handleFollowUpRequest___block_invoke;
  v15 = &unk_2649CBEF8;
  objc_copyWeak(&v16, &location);
  id v10 = +[WFCompactDialogAction actionForButton:v9 handler:&v12];

  v19[0] = v10;
  v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v19, 1, v12, v13, v14, v15);
  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__WFInteractionDialogViewController_handleFollowUpRequest___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[WFInteractionDialogViewController handleFollowUpRequest:]_block_invoke";
    _os_log_impl(&dword_22D994000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished interaction", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)[objc_alloc(MEMORY[0x263F852E8]) initWithInteractionResponseCode:0];
  [WeakRetained finishWithResponse:v3];
}

- (BOOL)canHandleFollowUpRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFInteractionDialogViewController;
  [(WFInteractionDialogViewController *)&v4 viewDidAppear:a3];
  if ([(WFInteractionDialogViewController *)self showCheckmarkOnAppear]) {
    [(WFInteractionDialogViewController *)self showProgressWithEvent:1];
  }
}

- (BOOL)showCheckmarkOnAppear
{
  v2 = [(WFCompactDialogViewController *)self request];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = [v2 interaction];
    objc_super v4 = [v3 intent];
    uint64_t v5 = [v4 _intentCategory];

    BOOL v7 = [v3 intentHandlingStatus] == 3 && v5 != 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)showProgressWithEvent:(unint64_t)a3
{
  [(WFCompactPlatterViewController *)self setPlatterHeightAnimationsDisabled:1];
  uint64_t v5 = [(WFCompactPlatterViewController *)self platterView];
  [v5 setFooterViewHidden:0];

  uint64_t v6 = [(WFInteractionDialogViewController *)self progressViewController];
  [v6 handleEvent:a3];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WFInteractionDialogViewController_showProgressWithEvent___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__WFInteractionDialogViewController_showProgressWithEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlatterHeightAnimationsDisabled:0];
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  uint64_t v5 = [(WFInteractionDialogViewController *)self cardViewController];
  [v5 contentHeightForWidth:a3];
  double v7 = v6;

  return v7;
}

- (void)loadView
{
  v54[2] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)WFInteractionDialogViewController;
  [(WFCompactDialogViewController *)&v50 loadView];
  id v3 = [(WFCompactPlatterViewController *)self platterView];
  [v3 setAccessibilityIdentifier:@"junior_interaction_platter_view"];

  id v43 = [(WFCompactDialogViewController *)self request];
  if (v43)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = [v43 interaction];
      objc_initWeak(location, self);
      objc_super v4 = [v43 cancelButton];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __45__WFInteractionDialogViewController_loadView__block_invoke;
      v48[3] = &unk_2649CBEF8;
      objc_copyWeak(&v49, location);
      uint64_t v5 = +[WFCompactDialogAction actionForButton:v4 handler:v48];

      double v6 = [v43 confirmButton];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __45__WFInteractionDialogViewController_loadView__block_invoke_50;
      v46[3] = &unk_2649CBEF8;
      objc_copyWeak(&v47, location);
      double v7 = +[WFCompactDialogAction actionForButton:v6 handler:v46];

      [v7 setEnabled:0];
      [(WFInteractionDialogViewController *)self setConfirmAction:v7];
      v54[0] = v5;
      v54[1] = v7;
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
      [(WFCompactDialogViewController *)self configureActionGroupWithActions:v8];

      objc_destroyWeak(&v47);
      objc_destroyWeak(&v49);
      objc_destroyWeak(location);
      v32 = v43;
      goto LABEL_11;
    }

    id v10 = v43;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v10;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v11 = v9;

  v41 = [v11 interaction];
  uint64_t v12 = getWFDialogLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[WFInteractionDialogViewController loadView]";
    _os_log_impl(&dword_22D994000, v12, OS_LOG_TYPE_DEFAULT, "%s Handling interaction", (uint8_t *)location, 0xCu);
  }

  objc_initWeak(location, self);
  uint64_t v13 = [v11 doneButton];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __45__WFInteractionDialogViewController_loadView__block_invoke_53;
  v44[3] = &unk_2649CBEF8;
  objc_copyWeak(&v45, location);
  v14 = +[WFCompactDialogAction actionForButton:v13 handler:v44];

  v52 = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v15];

  objc_destroyWeak(&v45);
  objc_destroyWeak(location);

  v32 = 0;
LABEL_11:
  id v16 = [[WFInteractionCardViewController alloc] initWithInteraction:v41];
  [(WFInteractionCardViewController *)v16 setDelegate:self];
  [(WFCompactPlatterViewController *)self setContentViewController:v16];
  cardViewController = self->_cardViewController;
  self->_cardViewController = v16;
  v33 = v16;

  v42 = (WFInteractionCardProgressViewController *)objc_opt_new();
  [(WFInteractionDialogViewController *)self addChildViewController:v42];
  objc_super v18 = [(WFInteractionCardProgressViewController *)v42 view];
  v19 = [MEMORY[0x263F825C8] systemGray5Color];
  v20 = [v19 colorWithAlphaComponent:0.5];
  [v18 setBackgroundColor:v20];

  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(WFCompactPlatterViewController *)self platterView];
  v22 = [v21 footerView];

  [v22 setClipsToBounds:1];
  [v22 addSubview:v18];
  v34 = (void *)MEMORY[0x263F08938];
  v40 = [v18 topAnchor];
  v39 = [v22 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v51[0] = v38;
  v37 = [v18 leadingAnchor];
  v36 = [v22 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v51[1] = v35;
  v23 = [v18 trailingAnchor];
  v24 = [v22 trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v51[2] = v25;
  v26 = [v18 bottomAnchor];
  v27 = [v22 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v51[3] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
  [v34 activateConstraints:v29];

  [(WFInteractionDialogViewController *)self didMoveToParentViewController:self];
  progressViewController = self->_progressViewController;
  self->_progressViewController = v42;

  v31 = [(WFCompactPlatterViewController *)self platterView];
  [v31 setFooterViewHeight:40.0];

  if ([(WFInteractionDialogViewController *)self showCheckmarkOnAppear]) {
    -[WFInteractionDialogViewController showProgressWithEvent:](self, "showProgressWithEvent:", 0, v32);
  }
}

void __45__WFInteractionDialogViewController_loadView__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22D994000, v2, OS_LOG_TYPE_DEFAULT, "%s Cancelled interaction", (uint8_t *)&v4, 0xCu);
  }

  id v3 = (void *)[objc_alloc(MEMORY[0x263F85200]) initWithInteractionResponseCode:0];
  [WeakRetained finishWithResponse:v3];
}

void __45__WFInteractionDialogViewController_loadView__block_invoke_50(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22D994000, v2, OS_LOG_TYPE_DEFAULT, "%s Confirmed interaction", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [WeakRetained confirmAction];
  [v3 setEnabled:0];

  [WeakRetained showProgressWithEvent:0];
  int v4 = (void *)[objc_alloc(MEMORY[0x263F85200]) initWithInteractionResponseCode:1];
  [WeakRetained finishWithResponse:v4 waitForFollowUpRequest:1];
}

void __45__WFInteractionDialogViewController_loadView__block_invoke_53(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22D994000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished interaction", (uint8_t *)&v4, 0xCu);
  }

  id v3 = (void *)[objc_alloc(MEMORY[0x263F852E8]) initWithInteractionResponseCode:0];
  [WeakRetained finishWithResponse:v3];
}

@end