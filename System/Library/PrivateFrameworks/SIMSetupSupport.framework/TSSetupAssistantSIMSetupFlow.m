@interface TSSetupAssistantSIMSetupFlow
+ (void)needsToRun:(id)a3;
- (BOOL)_needCustomizeBackAction:(id)a3;
- (BOOL)inBuddy;
- (NSMutableArray)currentItemsForIMessage;
- (TSSetupAssistantSIMSetupFlow)init;
- (TSSetupAssistantSIMSetupFlow)initWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5 allowDismiss:(BOOL)a6;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)dealloc;
- (void)firstViewController:(id)a3;
- (void)setCurrentItemsForIMessage:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setInBuddy:(BOOL)a3;
@end

@implementation TSSetupAssistantSIMSetupFlow

+ (void)needsToRun:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (+[TSUtilities hasCellularBaseband])
    {
      v4 = +[TSCellularPlanManagerCache sharedInstance];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __43__TSSetupAssistantSIMSetupFlow_needsToRun___block_invoke;
      v5[3] = &unk_264828078;
      id v6 = v3;
      [v4 planItemsWithCompletion:v5];
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void __43__TSSetupAssistantSIMSetupFlow_needsToRun___block_invoke(uint64_t a1)
{
  id v2 = +[TSCellularPlanManagerCache sharedInstance];
  [v2 shouldShowPlanSetupWithCompletion:*(void *)(a1 + 32)];
}

- (TSSetupAssistantSIMSetupFlow)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)TSSetupAssistantSIMSetupFlow;
  id v2 = [(TSSIMSetupFlow *)&v7 init];
  if (v2)
  {
    v2->_BOOL inBuddy = BYSetupAssistantNeedsToRun();
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL inBuddy = v2->_inBuddy;
      *(_DWORD *)buf = 67109378;
      BOOL v9 = inBuddy;
      __int16 v10 = 2080;
      v11 = "-[TSSetupAssistantSIMSetupFlow init]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "_inBuddy:%d @%s", buf, 0x12u);
    }

    v5 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v5 assertUserInPurchaseFlowStartOver:0 caller:v2];
  }
  return v2;
}

- (TSSetupAssistantSIMSetupFlow)initWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5 allowDismiss:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a3;
  uint64_t v12 = _TSLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109378;
    v19[1] = v6;
    __int16 v20 = 2080;
    v21 = "-[TSSetupAssistantSIMSetupFlow initWithIccid:showAddPlan:forceDualSIMSetup:allowDismiss:]";
    _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "allowDismiss: %d @%s", (uint8_t *)v19, 0x12u);
  }

  v13 = [(TSSetupAssistantSIMSetupFlow *)self init];
  v14 = v13;
  if (v13)
  {
    v13->_showAddPlan = a4;
    objc_storeStrong((id *)&v13->_iccid, a3);
    v14->_forceDualSIMSetup = a5;
    if (v6)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v14 action:sel_userDidTapCancel];
      cancelButton = v14->_cancelButton;
      v14->_cancelButton = (UIBarButtonItem *)v15;
    }
    v17 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v17 assertUserInPurchaseFlowStartOver:0 caller:v14];
  }
  return v14;
}

- (void)dealloc
{
  id v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSSetupAssistantSIMSetupFlow;
  [(TSSetupAssistantSIMSetupFlow *)&v4 dealloc];
}

- (id)firstViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [[TSAddCellularPlanViewController alloc] initWithType:!self->_showAddPlan allowDismiss:self->_cancelButton != 0];
  [(TSAddCellularPlanViewController *)v3 setDelegate:self];
  objc_super v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2080;
    __int16 v10 = "-[TSSetupAssistantSIMSetupFlow firstViewController]";
    id v5 = v8;
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);
  }
  [(TSSIMSetupFlow *)self setTopViewController:v3];
  return v3;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSSetupAssistantSIMSetupFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[TSCellularPlanLabelsViewController alloc] initWithIccid:self->_iccid forceDualSIMSetup:self->_forceDualSIMSetup allowDismiss:self->_cancelButton != 0];
LABEL_7:
    __int16 v9 = v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [TSCellularPlanUsesViewController alloc];
    uint64_t v7 = 0;
LABEL_5:
    BOOL v8 = 0;
LABEL_6:
    id v5 = [(TSCellularPlanUsesViewController *)v6 initWithType:v7 withDoneButton:v8];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 usesType];
    if (v11 == 2)
    {
      v17 = (void *)MEMORY[0x263EFF980];
      v18 = +[TSCellularPlanManagerCache sharedInstance];
      v19 = [v18 getDanglingPlanItems];
      __int16 v20 = [v17 arrayWithArray:v19];
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v20;

      uint64_t v22 = [TSCellularPlanUsesViewController alloc];
      if ([(NSMutableArray *)self->_danglingPlanItems count]) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = self->_cancelButton != 0;
      }
      id v6 = v22;
      uint64_t v7 = 1;
      goto LABEL_6;
    }
    if (v11 != 1)
    {
      if (!v11)
      {
        id v6 = [TSCellularPlanUsesViewController alloc];
        uint64_t v7 = 2;
        goto LABEL_5;
      }
      goto LABEL_24;
    }
    if ([(NSMutableArray *)self->_danglingPlanItems count])
    {
      v23 = [TSCellularPlanRemapViewController alloc];
      BOOL v13 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
      v14 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
      uint64_t v15 = v23;
      uint64_t v16 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] >= 2)
    {
      [(NSMutableArray *)self->_danglingPlanItems removeObjectAtIndex:0];
      uint64_t v12 = [TSCellularPlanRemapViewController alloc];
      BOOL v13 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
      v14 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
      uint64_t v15 = v12;
      uint64_t v16 = 0;
LABEL_23:
      __int16 v9 = [(TSCellularPlanRemapViewController *)v15 initWithBackButton:v16 continueButton:v13 danglingPlanItem:v14];

      goto LABEL_8;
    }
  }
LABEL_24:
  __int16 v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)_needCustomizeBackAction:(id)a3
{
  return 0;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v9 = a3;
  if (self->_cancelButton)
  {
    id v4 = [v9 navigationItem];
    [v4 setHidesBackButton:1 animated:0];

    id v5 = [v9 navigationItem];
    [v5 setLeftBarButtonItem:self->_cancelButton];
  }
  if (!+[TSUtilities inBuddy])
  {
    id v6 = [v9 navigationController];
    uint64_t v7 = [v6 navigationBar];
    BOOL v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v7 setBackgroundColor:v8];
  }
}

- (NSMutableArray)currentItemsForIMessage
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentItemsForIMessage:(id)a3
{
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_BOOL inBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemsForIMessage, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
}

@end