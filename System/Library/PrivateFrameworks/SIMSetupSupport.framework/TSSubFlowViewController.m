@interface TSSubFlowViewController
- (BOOL)isOfferFallbackFlow;
- (BOOL)isViewControllerPresented;
- (BOOL)isViewControllerPresenting;
- (BOOL)usingFirstViewControllerParadigm;
- (TSSIMSetupFlow)subFlow;
- (TSSIMSetupFlowDelegate)delegate;
- (TSSubFlowViewController)initWithFlow:(id)a3 navigationController:(id)a4;
- (TSSubFlowViewController)initWithOptions:(id)a3 navigationController:(id)a4;
- (UIView)snapshot;
- (UIViewController)firstViewController;
- (UIViewController)prevViewController;
- (int64_t)backOption;
- (unint64_t)subFlowType;
- (void)_presentFirstViewController;
- (void)prepare:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstViewController:(id)a3;
- (void)setIsOfferFallbackFlow:(BOOL)a3;
- (void)setIsViewControllerPresented:(BOOL)a3;
- (void)setIsViewControllerPresenting:(BOOL)a3;
- (void)setPrevViewController:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSubFlow:(id)a3;
- (void)setSubFlowType:(unint64_t)a3;
- (void)setUsingFirstViewControllerParadigm:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)takeScreenShot:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSSubFlowViewController

- (TSSubFlowViewController)initWithOptions:(id)a3 navigationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSSubFlowViewController;
  v8 = [(TSSubFlowViewController *)&v14 initWithTitle:&stru_26DBE8E78 detailText:0 icon:0];
  if (v8)
  {
    uint64_t v9 = +[TSSIMSetupFlow flowWithOptions:v6];
    subFlow = v8->_subFlow;
    v8->_subFlow = (TSSIMSetupFlow *)v9;

    [(TSSIMSetupFlow *)v8->_subFlow setDelegate:v8];
    v11 = [v6 valueForKey:@"FlowTypeKey"];
    v8->_subFlowType = [v11 unsignedIntegerValue];

    [(TSSIMSetupFlow *)v8->_subFlow setNavigationController:v7];
    v8->_isViewControllerPresenting = 0;
    v8->_isViewControllerPresented = 0;
    v12 = v8;
  }

  return v8;
}

- (TSSubFlowViewController)initWithFlow:(id)a3 navigationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSSubFlowViewController;
  uint64_t v9 = [(TSSubFlowViewController *)&v14 initWithTitle:&stru_26DBE8E78 detailText:0 icon:0];
  v10 = v9;
  if (v9)
  {
    p_subFlow = (id *)&v9->_subFlow;
    objc_storeStrong((id *)&v9->_subFlow, a3);
    [*p_subFlow setDelegate:v10];
    v10->_subFlowType = [v7 flowType];
    [*p_subFlow setNavigationController:v8];
    v10->_isViewControllerPresenting = 0;
    v10->_isViewControllerPresented = 0;
    v12 = v10;
  }

  return v10;
}

- (void)takeScreenShot:(id)a3
{
  p_prevViewController = &self->_prevViewController;
  id v5 = a3;
  objc_storeWeak((id *)p_prevViewController, v5);
  id v8 = [v5 view];

  id v6 = [v8 snapshotViewAfterScreenUpdates:0];
  snapshot = self->_snapshot;
  self->_snapshot = v6;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TSSubFlowViewController;
  [(TSOBWelcomeController *)&v5 viewDidLoad];
  if (self->_snapshot)
  {
    v3 = [(TSSubFlowViewController *)self view];
    [v3 addSubview:self->_snapshot];
  }
  [(TSSubFlowViewController *)self _presentFirstViewController];
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setHidesBackButton:1 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)TSSubFlowViewController;
  [(TSSubFlowViewController *)&v8 viewWillAppear:a3];
  [(TSSubFlowViewController *)self _presentFirstViewController];
  if (self->_isViewControllerPresented)
  {
    v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TSSubFlowViewController viewWillAppear:]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "user tap back to cancel @%s", buf, 0xCu);
    }

    objc_super v5 = [(TSSubFlowViewController *)self navigationController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_prevViewController);
    id v7 = (id)[v5 popToViewController:WeakRetained animated:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)TSSubFlowViewController;
  [(TSSubFlowViewController *)&v18 viewDidDisappear:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(TSSubFlowViewController *)self navigationController];
  objc_super v5 = [v4 viewControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(UIViewController **)(*((void *)&v14 + 1) + 8 * i) == self->_firstViewController)
        {
          v10 = _TSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            firstViewController = self->_firstViewController;
            *(_DWORD *)buf = 138412546;
            uint64_t v20 = (uint64_t)firstViewController;
            __int16 v21 = 2080;
            v22 = "-[TSSubFlowViewController viewDidDisappear:]";
            _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "%@ presented @%s", buf, 0x16u);
          }

          self->_isViewControllerPresented = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v7);
  }

  if (!self->_usingFirstViewControllerParadigm)
  {
    v12 = _TSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      v22 = "-[TSSubFlowViewController viewDidDisappear:]";
      _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "flow %@ presents ViewController by itself @%s", buf, 0x16u);
    }

    self->_isViewControllerPresented = 1;
  }
}

- (void)_presentFirstViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_firstViewController)
  {
    if (!self->_isViewControllerPresenting)
    {
      v3 = [(TSSubFlowViewController *)self navigationController];

      if (v3)
      {
        self->_isViewControllerPresenting = 1;
        v4 = _TSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          firstViewController = self->_firstViewController;
          int v7 = 138412546;
          uint64_t v8 = firstViewController;
          __int16 v9 = 2080;
          v10 = "-[TSSubFlowViewController _presentFirstViewController]";
          _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "presenting : %@ @%s", (uint8_t *)&v7, 0x16u);
        }

        uint64_t v6 = [(TSSubFlowViewController *)self navigationController];
        [v6 pushViewController:self->_firstViewController animated:1];
      }
    }
  }
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_subFlow)
  {
    objc_initWeak(&location, self);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_usingFirstViewControllerParadigm = 0;
      subFlow = self->_subFlow;
      int v7 = [(TSSIMSetupFlow *)subFlow navigationController];
      uint64_t v8 = [v7 topViewController];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __35__TSSubFlowViewController_prepare___block_invoke;
      v14[3] = &unk_2648286E0;
      id v15 = v5;
      [(TSSIMSetupFlow *)subFlow showFirstViewControllerWithHostController:v8 completion:v14];
      __int16 v9 = &v15;
    }
    else
    {
      self->_usingFirstViewControllerParadigm = 1;
      v10 = self->_subFlow;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __35__TSSubFlowViewController_prepare___block_invoke_2;
      v11[3] = &unk_264828CF8;
      id v12 = v5;
      objc_copyWeak(&v13, &location);
      [(TSSIMSetupFlow *)v10 firstViewController:v11];
      __int16 v9 = &v12;
      objc_destroyWeak(&v13);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __35__TSSubFlowViewController_prepare___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __35__TSSubFlowViewController_prepare___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setFirstViewController:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)backOption
{
  return 1;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subFlow = self->_subFlow;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v10 = 138413058;
    uint64_t v11 = subFlow;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    __int16 v14 = 2112;
    id v15 = WeakRetained;
    __int16 v16 = 2080;
    long long v17 = "-[TSSubFlowViewController simSetupFlowCompleted:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "sub flow %@ completed with type:%ld, delegate: %@ @%s", (uint8_t *)&v10, 0x2Au);
  }
  if (a3 == 3)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 attemptFailed];
    goto LABEL_12;
  }
  if (a3 == 2)
  {
LABEL_11:
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 viewControllerDidComplete:self];
    goto LABEL_12;
  }
  if (a3 != 1)
  {
    __int16 v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[TSSubFlowViewController simSetupFlowCompleted:](v9);
    }

    goto LABEL_11;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  [v8 userDidTapCancel];
LABEL_12:
}

- (unint64_t)subFlowType
{
  return self->_subFlowType;
}

- (void)setSubFlowType:(unint64_t)a3
{
  self->_subFlowType = a3;
}

- (TSSIMSetupFlow)subFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSubFlow:(id)a3
{
}

- (BOOL)isOfferFallbackFlow
{
  return self->_isOfferFallbackFlow;
}

- (void)setIsOfferFallbackFlow:(BOOL)a3
{
  self->_isOfferFallbackFlow = a3;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)firstViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setFirstViewController:(id)a3
{
}

- (BOOL)isViewControllerPresenting
{
  return self->_isViewControllerPresenting;
}

- (void)setIsViewControllerPresenting:(BOOL)a3
{
  self->_isViewControllerPresenting = a3;
}

- (BOOL)isViewControllerPresented
{
  return self->_isViewControllerPresented;
}

- (void)setIsViewControllerPresented:(BOOL)a3
{
  self->_isViewControllerPresented = a3;
}

- (BOOL)usingFirstViewControllerParadigm
{
  return self->_usingFirstViewControllerParadigm;
}

- (void)setUsingFirstViewControllerParadigm:(BOOL)a3
{
  self->_usingFirstViewControllerParadigm = a3;
}

- (UIView)snapshot
{
  return (UIView *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setSnapshot:(id)a3
{
}

- (UIViewController)prevViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prevViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPrevViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prevViewController);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_firstViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subFlow, 0);
}

- (void)simSetupFlowCompleted:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSSubFlowViewController simSetupFlowCompleted:]";
  _os_log_fault_impl(&dword_227A17000, log, OS_LOG_TYPE_FAULT, "[F]unhandled completion type @%s", (uint8_t *)&v1, 0xCu);
}

@end