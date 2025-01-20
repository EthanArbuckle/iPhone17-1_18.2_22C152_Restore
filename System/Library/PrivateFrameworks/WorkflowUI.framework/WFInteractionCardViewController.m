@interface WFInteractionCardViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (CRKCardPresentation)cardPresentation;
- (INInteraction)interaction;
- (UIActivityIndicatorView)activityIndicatorView;
- (WFCompactUnlockService)unlockService;
- (WFInteractionCardViewController)initWithInteraction:(id)a3;
- (WFInteractionCardViewControllerDelegate)delegate;
- (double)contentHeightForWidth:(double)a3;
- (id)cardRequestForInteraction:(id)a3;
- (id)cardViewController;
- (void)buttonOverlayTouchWasCancelled:(id)a3;
- (void)buttonOverlayWasTouchedDown:(id)a3;
- (void)buttonOverlayWasTouchedUpInside:(id)a3;
- (void)buttonOverlayWasTouchedUpOutside:(id)a3;
- (void)cardViewControllerDidLoad:(id)a3;
- (void)loadView;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCardPresentation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCardViewSize;
- (void)updateWithInteraction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFInteractionCardViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_destroyWeak((id *)&self->_activityIndicatorView);
  objc_storeStrong((id *)&self->_cardPresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interaction, 0);
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicatorView);
  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setCardPresentation:(id)a3
{
}

- (CRKCardPresentation)cardPresentation
{
  return self->_cardPresentation;
}

- (void)setDelegate:(id)a3
{
}

- (WFInteractionCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFInteractionCardViewControllerDelegate *)WeakRetained;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)buttonOverlayTouchWasCancelled:(id)a3
{
}

- (void)buttonOverlayWasTouchedDown:(id)a3
{
}

- (void)buttonOverlayWasTouchedUpOutside:(id)a3
{
}

- (void)buttonOverlayWasTouchedUpInside:(id)a3
{
  id v4 = a3;
  v5 = [(WFInteractionCardViewController *)self delegate];
  [v5 interactionCardViewControllerDidRequestPunchout:self];

  dispatch_time_t v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WFInteractionCardViewController_buttonOverlayWasTouchedUpInside___block_invoke;
  block[3] = &unk_2649CBF20;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __67__WFInteractionCardViewController_buttonOverlayWasTouchedUpInside___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:0 animated:1];
}

- (void)cardViewControllerDidLoad:(id)a3
{
  id v4 = [(WFInteractionCardViewController *)self delegate];
  [v4 interactionCardViewControllerDidLoad:self];

  [(WFInteractionCardViewController *)self updateCardViewSize];
}

- (void)updateCardViewSize
{
  id v3 = [(WFInteractionCardViewController *)self delegate];
  [v3 interactionCardViewControllerDidInvalidateSize:self];
}

- (double)contentHeightForWidth:(double)a3
{
  v5 = [(WFInteractionCardViewController *)self cardViewController];

  if (!v5) {
    return 98.0;
  }
  dispatch_time_t v6 = [(WFInteractionCardViewController *)self cardViewController];
  [v6 contentHeightForWidth:a3];
  double v8 = v7;

  return v8;
}

- (void)updateWithInteraction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFInteractionCardViewController.m", 179, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_interaction, a3);
  double v7 = [(WFInteractionCardViewController *)self cardRequestForInteraction:v6];
  double v8 = getWFDialogLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFInteractionCardViewController updateWithInteraction:]";
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating existing card; sending CardKit request: %@, for interaction: %{public}@",
      buf,
      0x20u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__WFInteractionCardViewController_updateWithInteraction___block_invoke;
  v10[3] = &unk_2649CAD68;
  v10[4] = self;
  [v7 startWithReply:v10];
}

void __57__WFInteractionCardViewController_updateWithInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = getWFDialogLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFInteractionCardViewController updateWithInteraction:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_22D994000, v7, OS_LOG_TYPE_DEFAULT, "%s Received CardKit response: %@, error: %@", buf, 0x20u);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WFInteractionCardViewController_updateWithInteraction___block_invoke_30;
  v9[3] = &unk_2649CC018;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __57__WFInteractionCardViewController_updateWithInteraction___block_invoke_30(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cardViewController];
  v2 = [*(id *)(a1 + 40) card];
  [v3 setCard:v2];
}

- (id)cardViewController
{
  v2 = [(WFInteractionCardViewController *)self cardPresentation];
  id v3 = [v2 cardViewController];

  return v3;
}

- (id)cardRequestForInteraction:(id)a3
{
  id v3 = (Class (__cdecl *)())getAPUIActionCardViewConfigClass;
  id v4 = a3;
  id v5 = objc_alloc_init(v3());
  [v5 setStyle:0];
  [v5 setShowThumbnailImage:1];
  [v5 setShowActionButton:0];
  [v5 setShowAppFootnote:0];
  id v6 = (void *)[objc_alloc(getAPUIActionCardRequestClass()) initWithCardViewConfig:v5];
  [v6 setFormat:1];
  [v6 setContent:v4];

  [v6 setLoadsBundleServices:0];
  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInteractionCardViewController;
  [(WFInteractionCardViewController *)&v6 viewDidAppear:a3];
  id v4 = [(WFInteractionCardViewController *)self unlockService];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_2649CBE58;
  v5[4] = self;
  [v4 requestUnlockIfNeeded:v5];
}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) interaction];
    id v5 = [v3 cardRequestForInteraction:v4];

    objc_super v6 = getWFDialogLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [*(id *)(a1 + 32) interaction];
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEFAULT, "%s Created card request: %@, for interaction: %{public}@", buf, 0x20u);
    }
    id v8 = objc_alloc_init(getCRKCardPresentationClass());
    [v8 setDelegate:*(void *)(a1 + 32)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 992), v8);
    id v9 = (void *)[objc_alloc(getCRKCardPresentationConfigurationClass()) initWithCardRequest:v5];
    [v9 setRespectsUserConsent:0];
    [v9 setLoadsBundleProviders:0];
    id v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Setting CRKCardPresentation configuration to: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_16;
    v12[3] = &unk_2649CBD08;
    objc_copyWeak(&v13, (id *)buf);
    [v8 setConfiguration:v9 animated:0 completion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) delegate];
    [v11 interactionCardViewControllerDidRequestCancel:*(void *)(a1 + 32)];
  }
}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v6 = WeakRetained;
  if (v4
    || ([WeakRetained cardViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    double v7 = getWFDialogLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22D994000, v7, OS_LOG_TYPE_FAULT, "%s Failed to create a CardKit card: %@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = getWFDialogLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_DEFAULT, "%s Finished configuring CRKCardPresentation, installing card view", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_17;
    block[3] = &unk_2649CBF20;
    void block[4] = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke_17(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cardViewController];
  [*(id *)(a1 + 32) addChildViewController:v2];
  id v3 = [v2 view];
  [v3 setAlpha:0.0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [*(id *)(a1 + 32) view];
  [v4 addSubview:v3];

  id v5 = [*(id *)(a1 + 32) view];
  id v6 = (id)objc_msgSend(v3, "wf_addConstraintsToFillSuperview:", v5);

  [v2 didMoveToParentViewController:*(void *)(a1 + 32)];
  double v7 = [*(id *)(a1 + 32) activityIndicatorView];
  [v7 removeFromSuperview];

  [*(id *)(a1 + 32) updateCardViewSize];
  id v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.100000001];
  id v9 = objc_alloc_init(getCRKOverlayButtonClass());
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setBackgroundColor:v8 forState:1];
  [v9 setBackgroundColor:v8 forState:4];
  [v9 setBackgroundColor:v8 forState:5];
  [v9 addTarget:*(void *)(a1 + 32) action:sel_buttonOverlayWasTouchedUpInside_ forControlEvents:64];
  [v9 addTarget:*(void *)(a1 + 32) action:sel_buttonOverlayWasTouchedUpOutside_ forControlEvents:128];
  [v9 addTarget:*(void *)(a1 + 32) action:sel_buttonOverlayWasTouchedDown_ forControlEvents:1];
  [v9 addTarget:*(void *)(a1 + 32) action:sel_buttonOverlayTouchWasCancelled_ forControlEvents:256];
  id v10 = [*(id *)(a1 + 32) view];
  [v10 addSubview:v9];

  id v11 = [*(id *)(a1 + 32) view];
  id v12 = (id)objc_msgSend(v9, "wf_addConstraintsToFillSuperview:", v11);

  __int16 v13 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_2;
  v15[3] = &unk_2649CBF20;
  id v16 = v3;
  id v14 = v3;
  [v13 animateWithDuration:v15 animations:0.300000012];
}

uint64_t __49__WFInteractionCardViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)loadView
{
  v17[2] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)WFInteractionCardViewController;
  [(WFInteractionCardViewController *)&v16 loadView];
  id v3 = [(WFInteractionCardViewController *)self view];
  [v3 setClipsToBounds:1];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(WFInteractionCardViewController *)self view];
  [v5 addSubview:v4];

  [v4 startAnimating];
  [(WFInteractionCardViewController *)self setActivityIndicatorView:v4];
  uint64_t v15 = (void *)MEMORY[0x263F08938];
  id v6 = [v4 centerXAnchor];
  double v7 = [(WFInteractionCardViewController *)self view];
  id v8 = [v7 centerXAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  v17[0] = v9;
  id v10 = [v4 centerYAnchor];
  id v11 = [(WFInteractionCardViewController *)self view];
  id v12 = [v11 centerYAnchor];
  __int16 v13 = [v10 constraintEqualToAnchor:v12];
  v17[1] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  [v15 activateConstraints:v14];
}

- (WFInteractionCardViewController)initWithInteraction:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    __int16 v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFInteractionCardViewController.m", 62, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFInteractionCardViewController;
  double v7 = [(WFInteractionCardViewController *)&v14 initWithNibName:0 bundle:0];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interaction, a3);
    uint64_t v9 = objc_opt_new();
    unlockService = v8->_unlockService;
    v8->_unlockService = (WFCompactUnlockService *)v9;

    softLinkAPUIRegisterCardServicesIfNeeded();
    softLinkAPUIRegisterCardKitProvidersIfNeeded();
    id v11 = v8;
  }

  return v8;
}

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WFInteractionCardViewController_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __45__WFInteractionCardViewController_initialize__block_invoke(uint64_t a1)
{
  v1 = *(objc_class **)(a1 + 32);
  getCRKCardViewControllerDelegateProtocol();
  v2 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v1, v2);
}

@end