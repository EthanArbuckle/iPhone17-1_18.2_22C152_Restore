@interface WFAskParameterDialogViewController
+ (id)singleButtonSlotForParameter:(id)a3 state:(id)a4;
- (BOOL)isFinished;
- (UIButton)modalButton;
- (WFAction)fakeAction;
- (WFAskParameterDialogViewController)initWithRequest:(id)a3;
- (WFCompactUnlockService)unlockService;
- (WFModuleSummaryEditor)summaryEditor;
- (WFParameterEditorHostingCell)hostingCell;
- (WFSlotTemplateSlot)summarySlot;
- (WFWorkflow)fakeWorkflow;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (id)initialStateForSummaryEditor:(id)a3;
- (void)done;
- (void)loadView;
- (void)modalButtonTapped:(id)a3;
- (void)parameterEditorCell:(id)a3 didUpdateParameterState:(id)a4;
- (void)setFakeAction:(id)a3;
- (void)setFakeWorkflow:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHostingCell:(id)a3;
- (void)setModalButton:(id)a3;
- (void)setSummaryEditor:(id)a3;
- (void)setSummarySlot:(id)a3;
- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4;
- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4;
- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5;
- (void)summaryEditorDidRequestTextEntry:(id)a3;
@end

@implementation WFAskParameterDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_storeStrong((id *)&self->_modalButton, 0);
  objc_storeStrong((id *)&self->_summarySlot, 0);
  objc_storeStrong((id *)&self->_summaryEditor, 0);
  objc_storeStrong((id *)&self->_hostingCell, 0);
  objc_storeStrong((id *)&self->_fakeAction, 0);
  objc_storeStrong((id *)&self->_fakeWorkflow, 0);
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (void)setModalButton:(id)a3
{
}

- (UIButton)modalButton
{
  return self->_modalButton;
}

- (void)setSummarySlot:(id)a3
{
}

- (WFSlotTemplateSlot)summarySlot
{
  return self->_summarySlot;
}

- (void)setSummaryEditor:(id)a3
{
}

- (WFModuleSummaryEditor)summaryEditor
{
  return self->_summaryEditor;
}

- (void)setHostingCell:(id)a3
{
}

- (WFParameterEditorHostingCell)hostingCell
{
  return self->_hostingCell;
}

- (void)setFakeAction:(id)a3
{
}

- (WFAction)fakeAction
{
  return self->_fakeAction;
}

- (void)setFakeWorkflow:(id)a3
{
}

- (WFWorkflow)fakeWorkflow
{
  return self->_fakeWorkflow;
}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
}

- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F865D0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = [(WFAskParameterDialogViewController *)self modalButton];
  v11 = [(WFAskParameterDialogViewController *)self modalButton];
  [v11 bounds];
  id v12 = (id)objc_msgSend(v9, "initWithSourceViewController:sourceView:sourceRect:", self, v10);

  [v8 beginEditingSlotWithIdentifier:v7 presentationAnchor:v12];
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    v5 = "-[WFAskParameterDialogViewController summaryEditorDidRequestTextEntry:]";
    _os_log_impl(&dword_22D994000, v3, OS_LOG_TYPE_FAULT, "%s Text entry isn't supported in old-UI parameters represented as buttons", (uint8_t *)&v4, 0xCu);
  }
}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFAskParameterDialogViewController *)self fakeAction];
  id v9 = [v7 parameter];

  v10 = [v9 key];
  [v8 setParameterState:v6 forKey:v10];

  [(WFAskParameterDialogViewController *)self done];
}

- (id)initialStateForSummaryEditor:(id)a3
{
  id v4 = a3;
  v5 = [(WFAskParameterDialogViewController *)self fakeAction];
  id v6 = [v4 parameter];

  id v7 = [v6 key];
  id v8 = [v5 parameterStateForKey:v7];

  return v8;
}

- (void)modalButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = [(WFAskParameterDialogViewController *)self fakeAction];
  id v6 = [(WFCompactDialogViewController *)self request];
  id v7 = [v6 parameterKey];

  id v8 = [v5 parameterForKey:v7];
  objc_opt_class();
  id v9 = (objc_class *)WFModuleSummaryEditorClassForParameterClass();
  uint64_t v10 = [(WFAskParameterDialogViewController *)self summarySlot];
  v11 = (void *)v10;
  if (v9 && v10)
  {
    id v12 = (void *)[[v9 alloc] initWithParameter:v8 arrayIndex:0x7FFFFFFFFFFFFFFFLL processing:1];
    [v12 setDelegate:self];
    v13 = [(WFAskParameterDialogViewController *)self fakeAction];
    [v12 setVariableProvider:v13];

    objc_storeStrong((id *)&self->_summaryEditor, v12);
    v14 = [(WFAskParameterDialogViewController *)self unlockService];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__WFAskParameterDialogViewController_modalButtonTapped___block_invoke;
    v16[3] = &unk_2649CB0D0;
    v16[4] = self;
    id v17 = v4;
    id v18 = v12;
    id v19 = v11;
    id v15 = v12;
    [v14 requestUnlockIfNeeded:v16];
  }
}

void __56__WFAskParameterDialogViewController_modalButtonTapped___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = objc_alloc(MEMORY[0x263F865D0]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    [v5 bounds];
    id v9 = (id)objc_msgSend(v3, "initWithSourceViewController:sourceView:sourceRect:", v4, v5);
    id v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 56) identifier];
    [v6 beginEditingSlotWithIdentifier:v7 presentationAnchor:v9];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = (id)[objc_alloc(MEMORY[0x263F85180]) initWithSerializedParameterState:0 cancelled:1];
    objc_msgSend(v8, "finishWithResponse:");
  }
}

- (void)parameterEditorCell:(id)a3 didUpdateParameterState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 model];
  id v16 = [v8 parameter];

  id v9 = [(WFAskParameterDialogViewController *)self fakeAction];
  uint64_t v10 = [v16 key];
  [v9 setParameterState:v6 forKey:v10];

  id v11 = objc_alloc(MEMORY[0x263F865E8]);
  id v12 = [(WFAskParameterDialogViewController *)self fakeAction];
  v13 = [v16 key];
  v14 = [v12 parameterStateForKey:v13];
  id v15 = (void *)[v11 initWithParameter:v16 state:v14];
  [v7 updateModel:v15];
}

- (void)done
{
  if (![(WFAskParameterDialogViewController *)self isFinished])
  {
    [(WFAskParameterDialogViewController *)self setFinished:1];
    id v3 = [(WFAskParameterDialogViewController *)self view];
    [v3 endEditing:1];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WFAskParameterDialogViewController_done__block_invoke;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __42__WFAskParameterDialogViewController_done__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fakeAction];
  id v3 = [*(id *)(a1 + 32) request];
  uint64_t v4 = [v3 parameterKey];
  id v9 = [v2 parameterStateForKey:v4];

  v5 = *(void **)(a1 + 32);
  id v6 = objc_alloc(MEMORY[0x263F85180]);
  id v7 = [v9 serializedRepresentation];
  id v8 = (void *)[v6 initWithSerializedParameterState:v7 cancelled:0];
  [v5 finishWithResponse:v8];
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  id v7 = [(WFAskParameterDialogViewController *)self hostingCell];

  if (v7)
  {
    id v8 = [(WFAskParameterDialogViewController *)self hostingCell];
    objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
    double v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAskParameterDialogViewController;
    [(WFCompactPlatterViewController *)&v13 contentHeightForWidth:a3 withMaximumVisibleHeight:a4];
    return v11;
  }
  return v10;
}

- (void)loadView
{
  v55[5] = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)WFAskParameterDialogViewController;
  [(WFCompactDialogViewController *)&v54 loadView];
  v48 = objc_opt_new();
  v47 = [v48 view];
  [(WFCompactPlatterViewController *)self setContentViewController:v48];
  id v3 = [(WFCompactDialogViewController *)self request];
  v46 = [(WFAskParameterDialogViewController *)self fakeAction];
  v45 = [v3 parameterKey];
  v44 = [v46 parameterForKey:v45];
  uint64_t v4 = objc_opt_new();
  objc_initWeak(&location, self);
  v5 = [v3 cancelButton];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __46__WFAskParameterDialogViewController_loadView__block_invoke;
  v51[3] = &unk_2649CBEF8;
  objc_copyWeak(&v52, &location);
  id v6 = +[WFCompactDialogAction actionForButton:v5 handler:v51];
  [v4 addObject:v6];

  if ([v3 style] != 1)
  {
    id v7 = [v3 doneButton];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __46__WFAskParameterDialogViewController_loadView__block_invoke_2;
    v49[3] = &unk_2649CBEF8;
    objc_copyWeak(&v50, &location);
    id v8 = +[WFCompactDialogAction actionForButton:v7 handler:v49];
    [v4 addObject:v8];

    objc_destroyWeak(&v50);
  }
  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v4];
  if ([v3 style] != 1 || !objc_msgSend(v44, "conformsToProtocol:", &unk_26E252C50)) {
    goto LABEL_9;
  }
  id v9 = v44;
  double v10 = objc_opt_class();
  double v11 = [v9 key];
  id v12 = [v46 parameterStateForKey:v11];
  objc_super v13 = [v10 singleButtonSlotForParameter:v9 state:v12];

  if (!v13)
  {

LABEL_9:
    id v23 = objc_alloc(MEMORY[0x263F865E8]);
    v24 = [v46 parameterStateForKey:v45];
    id v9 = (id)[v23 initWithParameter:v44 state:v24];

    objc_msgSend(v9, "setBecomeFirstResponder:", objc_msgSend(v3, "focusImmediatelyWhenPresented"));
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x263F865E0]) initWithStyle:0 reuseIdentifier:0];
    [v47 bounds];
    objc_msgSend(v13, "setFrame:");
    [v13 setAutoresizingMask:18];
    [v13 setDelegate:self];
    [v13 setContainingViewController:v48];
    [v13 updateModel:v9];
    [v47 addSubview:v13];
    [(WFAskParameterDialogViewController *)self setHostingCell:v13];
    goto LABEL_10;
  }
  [(WFAskParameterDialogViewController *)self setSummarySlot:v13];
  v14 = +[WFMultilineBackgroundFadingButton buttonWithType:0];
  [v14 setDerivesTitleColorFromTintColor:1];
  id v15 = [v14 layer];
  [v15 setCornerRadius:10.0];

  objc_msgSend(v14, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);
  id v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  id v17 = [v14 titleLabel];
  [v17 setFont:v16];

  id v18 = [v14 titleLabel];
  [v18 setAdjustsFontForContentSizeCategory:1];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v19 = [v13 localizedName];
  if (v19)
  {
    v20 = NSString;
    v21 = WFLocalizedString(@"Choose %@");
    id v17 = [v13 localizedName];
    v22 = objc_msgSend(v20, "stringWithFormat:", v21, v17);
  }
  else
  {
    v22 = WFLocalizedString(@"Choose");
    v21 = v22;
  }
  [v14 setTitle:v22 forState:0];
  if (v19)
  {
  }
  [v14 addTarget:self action:sel_modalButtonTapped_ forControlEvents:64];
  v25 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.0500000007];
  [v14 setBackgroundColor:v25 forState:0];

  v26 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.100000001];
  [v14 setBackgroundColor:v26 forState:1];

  [v47 addSubview:v14];
  [(WFAskParameterDialogViewController *)self setModalButton:v14];
  v27 = [(WFCompactPlatterViewController *)self platterView];
  [v27 setHidesContentViewTopSeparator:1];

  v33 = (void *)MEMORY[0x263F08938];
  v43 = [v14 topAnchor];
  v42 = [v47 topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v55[0] = v41;
  v39 = [v14 leadingAnchor];
  v40 = [v47 leadingAnchor];
  v38 = [v39 constraintEqualToAnchor:v40 constant:16.0];
  v55[1] = v38;
  v37 = [v14 trailingAnchor];
  v36 = [v47 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:-16.0];
  v55[2] = v35;
  v34 = [v14 bottomAnchor];
  v28 = [v47 bottomAnchor];
  v29 = [v34 constraintEqualToAnchor:v28 constant:-16.0];
  v55[3] = v29;
  v30 = [v14 heightAnchor];
  v31 = [v30 constraintGreaterThanOrEqualToConstant:47.0];
  v55[4] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:5];
  [v33 activateConstraints:v32];

LABEL_10:
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

void __46__WFAskParameterDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)[objc_alloc(MEMORY[0x263F85180]) initWithSerializedParameterState:0 cancelled:1];
  [WeakRetained finishWithResponse:v1];
}

void __46__WFAskParameterDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained done];
}

- (WFAskParameterDialogViewController)initWithRequest:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFAskParameterDialogViewController;
  v5 = [(WFCompactDialogViewController *)&v20 initWithRequest:v4];
  if (v5)
  {
    id v6 = [v4 actionIdentifier];
    id v7 = [v4 serializedParameterStates];
    id v8 = (WFWorkflow *)objc_alloc_init(MEMORY[0x263F86FF8]);
    fakeWorkflow = v5->_fakeWorkflow;
    v5->_fakeWorkflow = v8;
    double v10 = v8;

    double v11 = [MEMORY[0x263F86898] sharedRegistry];
    id v12 = [v11 createActionWithIdentifier:v6 serializedParameters:v7];

    objc_super v13 = (void *)[v12 copyForProcessing];
    [v13 willBeAddedToWorkflow:v5->_fakeWorkflow];
    [v13 wasAddedToWorkflow:v5->_fakeWorkflow];
    fakeAction = v5->_fakeAction;
    v5->_fakeAction = (WFAction *)v13;
    id v15 = v13;

    uint64_t v16 = objc_opt_new();
    unlockService = v5->_unlockService;
    v5->_unlockService = (WFCompactUnlockService *)v16;

    id v18 = v5;
  }

  return v5;
}

+ (id)singleButtonSlotForParameter:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v5 moduleSummarySlotForState:v6];
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v5 moduleSummarySlotsForState:v6];
    if ([v8 count] == 1)
    {
      id v7 = [v8 firstObject];

      goto LABEL_8;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

@end