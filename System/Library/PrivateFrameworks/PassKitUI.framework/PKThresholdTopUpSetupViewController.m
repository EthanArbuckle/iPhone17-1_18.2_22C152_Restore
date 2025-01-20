@interface PKThresholdTopUpSetupViewController
- (BOOL)editingUnavailable;
- (BOOL)editingValues;
- (NSDecimalNumber)currentAmount;
- (NSDecimalNumber)currentThreshold;
- (NSOrderedSet)messages;
- (NSString)amountTitle;
- (NSString)cancelTitle;
- (NSString)paymentMethodIdentifier;
- (NSString)paymentMethodTitle;
- (NSString)thresholdTitle;
- (PKPaymentPass)selectedPass;
- (PKPaymentRequest)paymentRequest;
- (PKThresholdTopUpSetupViewController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 mode:(int64_t)a10 viewStyle:(int64_t)a11 delegate:(id)a12;
- (int64_t)mode;
- (void)_setupCreateNavigationItem;
- (void)_setupDefaultNavigationItem;
- (void)_setupEditNavigationItem;
- (void)cancel:(id)a3;
- (void)changeEditMode:(id)a3;
- (void)didSelectPaymentMethod;
- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4;
- (void)performedCancelWithCompletion:(id)a3;
- (void)reloadItem:(id)a3 animated:(BOOL)a4;
- (void)setAmountTitle:(id)a3;
- (void)setCancelTitle:(id)a3;
- (void)setEditingUnavailable:(BOOL)a3;
- (void)setEditingValues:(BOOL)a3;
- (void)setMessages:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPaymentMethodIdentifier:(id)a3;
- (void)setPaymentMethodTitle:(id)a3;
- (void)setPaymentRequest:(id)a3;
- (void)setShowNavigationBarSpinner:(BOOL)a3;
- (void)setThresholdTitle:(id)a3;
- (void)triggerUpdate:(id)a3;
- (void)turnOn:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKThresholdTopUpSetupViewController

- (PKThresholdTopUpSetupViewController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 mode:(int64_t)a10 viewStyle:(int64_t)a11 delegate:(id)a12
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id obj = a8;
  id v23 = a8;
  id v24 = a9;
  id v25 = a12;
  v53.receiver = self;
  v53.super_class = (Class)PKThresholdTopUpSetupViewController;
  v26 = [(PKPaymentSetupOptionsViewController *)&v53 init];
  if (v26)
  {
    id v52 = v25;
    id v48 = v24;
    id v49 = v20;
    id v50 = v19;
    v27 = [[PKThresholdTopUpSelectionSectionController alloc] initWithAmountSuggestions:v18 selectedAmount:v19 thresholdSuggestions:v20 selectedThreshold:v21 currencyCode:v22 paymentMethodName:v23 paymentMethodIdentifier:v24 viewStyle:a11 delegate:v26];
    sectionController = v26->_sectionController;
    v26->_sectionController = v27;

    v29 = [[PKThresholdTopUpActionsSectionController alloc] initWithExistingThresholdTopUp:a10 == 1 delegate:v26];
    actionController = v26->_actionController;
    v26->_actionController = v29;

    v31 = [PKDashboardMessageSectionController alloc];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    uint64_t v33 = [(PKDashboardMessageSectionController *)v31 initWithMessages:v32 delegate:v26];
    messageSectionController = v26->_messageSectionController;
    v26->_messageSectionController = (PKDashboardMessageSectionController *)v33;

    objc_storeStrong((id *)&v26->_paymentMethodName, obj);
    objc_storeStrong((id *)&v26->_paymentMethodIdentifier, a9);
    objc_storeWeak((id *)&v26->_delegate, v25);
    v26->_viewStyle = a11;
    v26->_mode = a10;
    switch(a10)
    {
      case 1:
        [(PKPaymentSetupOptionsViewController *)v26 setHeaderMode:1];
        [(PKThresholdTopUpSetupViewController *)v26 _setupDefaultNavigationItem];
        [(PKThresholdTopUpSelectionSectionController *)v26->_sectionController setEditing:0];
        break;
      case 2:
        v35 = [(PKPaymentSetupOptionsViewController *)v26 dockView];
        v36 = [v35 primaryButton];

        v37 = PKLocalizedPaymentString(&cfstr_ThresholdTurnO.isa);
        [v36 setTitle:v37 forState:0];

        [v36 addTarget:v26 action:sel__continuousButtonPressed_ forControlEvents:64];
        v38 = [(PKPaymentSetupOptionsViewController *)v26 dockView];
        v39 = [v38 footerView];
        v40 = [v39 skipCardButton];

        v41 = PKLocalizedPaymentString(&cfstr_ThresholdSkip.isa);
        [v40 setTitle:v41 forState:0];

        [v40 addTarget:v26 action:sel__skipButtonPressed_ forControlEvents:64];
        v42 = [(PKThresholdTopUpSetupViewController *)v26 navigationItem];
        [v42 setHidesBackButton:1];

        v43 = [(PKPaymentSetupOptionsViewController *)v26 dockView];
        v44 = [v43 footerView];
        [v44 setManualEntryButton:0];

        break;
      case 0:
        [(PKThresholdTopUpSetupViewController *)v26 _setupCreateNavigationItem];
        break;
    }
    [(PKDynamicCollectionViewController *)v26 setUseItemIdentityWhenUpdating:1];
    v54[0] = v26->_sectionController;
    v54[1] = v26->_actionController;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    [(PKPaymentSetupOptionsViewController *)v26 setSections:v45 animated:0];

    v46 = [(PKThresholdTopUpSetupViewController *)v26 navigationItem];
    objc_msgSend(v46, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v46, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

    id v20 = v49;
    id v19 = v50;
    id v24 = v48;
    id v25 = v52;
  }

  return v26;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKThresholdTopUpSetupViewController;
  [(PKPaymentSetupOptionsViewController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v3];
  v5 = [(PKThresholdTopUpSetupViewController *)self view];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85258]];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKThresholdTopUpSetupViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  v4 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKThresholdTopUpSetupViewController;
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](&v5, sel_setShowNavigationBarSpinner_);
  [(PKThresholdTopUpSetupViewController *)self setModalInPresentation:v3];
}

- (void)didSelectPaymentMethod
{
  if (self->_paymentRequest)
  {
    if (!self->_selectedPass && [(NSString *)self->_paymentMethodIdentifier length])
    {
      BOOL v3 = [MEMORY[0x1E4F84898] sharedInstance];
      v4 = [v3 passWithFPANIdentifier:self->_paymentMethodIdentifier];
      selectedPass = self->_selectedPass;
      self->_selectedPass = v4;
    }
    v7 = [[PKPaymentMethodSelectionViewController alloc] initWithPaymentRequest:self->_paymentRequest selectedPass:self->_selectedPass paymentMethodName:self->_paymentMethodName paymentMethodIdentifier:self->_paymentMethodIdentifier allowAppleCashToggle:0 useAppleCashBalance:0 viewStyle:self->_viewStyle delegate:self];
    objc_super v6 = [(PKThresholdTopUpSetupViewController *)self navigationController];
    [v6 pushViewController:v7 animated:1];
  }
  else
  {
    [(PKThresholdTopUpSetupViewController *)self triggerUpdate:0];
  }
}

- (void)setAmountTitle:(id)a3
{
}

- (void)setThresholdTitle:(id)a3
{
}

- (void)setPaymentMethodTitle:(id)a3
{
}

- (void)setCancelTitle:(id)a3
{
}

- (NSDecimalNumber)currentThreshold
{
  return [(PKThresholdTopUpSelectionSectionController *)self->_sectionController currentThreshold];
}

- (NSDecimalNumber)currentAmount
{
  return [(PKThresholdTopUpSelectionSectionController *)self->_sectionController currentAmount];
}

- (void)_setupCreateNavigationItem
{
  id v9 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v4 = PKLocalizedPaymentString(&cfstr_ThresholdTurnO.isa);
  objc_super v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_turnOn_];

  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
  [v9 setRightBarButtonItem:v5];
  id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v7 = PKLocalizedString(&cfstr_Cancel.isa);
  v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_cancel_];

  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  [v9 setLeftBarButtonItem:v8];
}

- (void)_setupDefaultNavigationItem
{
  if (self->_mode == 1)
  {
    id v6 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
    if (self->_editingUnavailable)
    {
      [v6 setRightBarButtonItem:0];
    }
    else
    {
      id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v4 = PKLocalizedPaymentString(&cfstr_ThresholdEdit.isa);
      objc_super v5 = (void *)[v3 initWithTitle:v4 style:0 target:self action:sel_changeEditMode_];

      [v5 setEnabled:!self->_editingUnavailable];
      [v6 setRightBarButtonItem:v5];
    }
    [v6 setLeftBarButtonItem:0];
    [v6 setHidesBackButton:0];
  }
}

- (void)_setupEditNavigationItem
{
  if (self->_mode == 1)
  {
    id v9 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v4 = PKLocalizedPaymentString(&cfstr_ThresholdUpdat.isa);
    objc_super v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_triggerUpdate_];

    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
    objc_msgSend(v5, "setEnabled:", -[PKThresholdTopUpSelectionSectionController valuesEdited](self->_sectionController, "valuesEdited"));
    [v9 setRightBarButtonItem:v5];
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v7 = PKLocalizedString(&cfstr_Cancel.isa);
    v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_changeEditMode_];

    [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [v9 setLeftBarButtonItem:v8];
    [v9 setHidesBackButton:1];
  }
}

- (void)changeEditMode:(id)a3
{
}

- (void)setEditingValues:(BOOL)a3
{
  if (((!self->_editingValues ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_editingValues = a3;
    -[PKThresholdTopUpSelectionSectionController setEditing:](self->_sectionController, "setEditing:");
    selectedPass = self->_selectedPass;
    self->_selectedPass = 0;

    if (v3)
    {
      [(PKThresholdTopUpSetupViewController *)self _setupEditNavigationItem];
    }
    else
    {
      [(PKThresholdTopUpSetupViewController *)self _setupDefaultNavigationItem];
    }
  }
}

- (void)setEditingUnavailable:(BOOL)a3
{
  if (self->_mode == 1 && ((!self->_editingUnavailable ^ a3) & 1) == 0)
  {
    self->_editingUnavailable = a3;
    [(PKThresholdTopUpSelectionSectionController *)self->_sectionController setEnabled:!a3];
    if (self->_editingValues)
    {
      [(PKThresholdTopUpSetupViewController *)self _setupEditNavigationItem];
    }
    else
    {
      [(PKThresholdTopUpSetupViewController *)self _setupDefaultNavigationItem];
    }
  }
}

- (void)setMessages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  messageSectionController = self->_messageSectionController;
  id v5 = a3;
  [(PKDashboardMessageSectionController *)messageSectionController updateWithMessages:v5 currentMessageIndex:0];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    sectionController = self->_sectionController;
    v15 = self->_messageSectionController;
    v16 = sectionController;
    actionController = self->_actionController;
    v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = &v15;
    uint64_t v10 = 3;
  }
  else
  {
    v11 = self->_actionController;
    v13 = self->_sectionController;
    v14 = v11;
    v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = (PKDashboardMessageSectionController **)&v13;
    uint64_t v10 = 2;
  }
  v12 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v13, v14, v15, v16, actionController, v18);
  [(PKPaymentSetupOptionsViewController *)self setSections:v12 animated:0];
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKThresholdTopUpSetupViewController;
  [(PKDynamicCollectionViewController *)&v7 reloadItem:a3 animated:a4];
  if (self->_editingValues)
  {
    id v5 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
    uint64_t v6 = [v5 rightBarButtonItem];
    objc_msgSend(v6, "setEnabled:", -[PKThresholdTopUpSelectionSectionController valuesEdited](self->_sectionController, "valuesEdited"));
  }
}

- (void)triggerUpdate:(id)a3
{
  id v4 = a3;
  [(PKThresholdTopUpSetupViewController *)self setShowNavigationBarSpinner:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__PKThresholdTopUpSetupViewController_triggerUpdate___block_invoke;
    v6[3] = &unk_1E59CB100;
    objc_copyWeak(&v7, &location);
    [WeakRetained thresholdTopUpDidSelectUpdate:self completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __53__PKThresholdTopUpSetupViewController_triggerUpdate___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowNavigationBarSpinner:0];
  if (a2)
  {
    [WeakRetained[160] applyUpdate];
    [WeakRetained setEditingValues:0];
  }
}

- (void)turnOn:(id)a3
{
  id v4 = a3;
  [(PKThresholdTopUpSetupViewController *)self setShowNavigationBarSpinner:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PKThresholdTopUpSetupViewController_turnOn___block_invoke;
    v6[3] = &unk_1E59CB100;
    objc_copyWeak(&v7, &location);
    [WeakRetained thresholdTopUpDidSelectContinue:self completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __46__PKThresholdTopUpSetupViewController_turnOn___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowNavigationBarSpinner:0];
}

- (void)cancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained thresholdTopUpDidSelectCancel:self];
  }
  else {
    [(PKThresholdTopUpSetupViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)performedCancelWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(PKThresholdTopUpSetupViewController *)self navigationItem];
    id v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:0];

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKThresholdTopUpSetupViewController_performedCancelWithCompletion___block_invoke;
    v8[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [WeakRetained thresholdTopUpPerformCancel:self completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __69__PKThresholdTopUpSetupViewController_performedCancelWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:1];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

- (void)paymentMethodSelectionViewController:(id)a3 didSelectPaymentMethod:(id)a4
{
  objc_storeStrong((id *)&self->_selectedPass, a4);
  id v6 = a4;
  [(PKThresholdTopUpSelectionSectionController *)self->_sectionController updatePaymentMethod:v6];

  id v8 = [(PKThresholdTopUpSetupViewController *)self navigationController];
  id v7 = (id)[v8 popToViewController:self animated:1];
}

- (NSString)amountTitle
{
  return self->_amountTitle;
}

- (NSString)thresholdTitle
{
  return self->_thresholdTitle;
}

- (NSString)paymentMethodTitle
{
  return self->_paymentMethodTitle;
}

- (NSString)paymentMethodIdentifier
{
  return self->_paymentMethodIdentifier;
}

- (void)setPaymentMethodIdentifier:(id)a3
{
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (PKPaymentPass)selectedPass
{
  return self->_selectedPass;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)editingValues
{
  return self->_editingValues;
}

- (BOOL)editingUnavailable
{
  return self->_editingUnavailable;
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentMethodTitle, 0);
  objc_storeStrong((id *)&self->_thresholdTitle, 0);
  objc_storeStrong((id *)&self->_amountTitle, 0);
  objc_storeStrong((id *)&self->_paymentMethodName, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageSectionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);

  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end