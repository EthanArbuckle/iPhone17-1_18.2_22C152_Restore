@interface TSCellularPlanCardInfoViewController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSLayoutConstraint)infoTableViewHeightConstraint;
- (TSCellularPlanCardInfoViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (UILabel)enterActivationLabel;
- (UIScrollView)scrollView;
- (UITableView)infoTableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addNewPlanWithUserInfo:(id)a3;
- (void)configureCell:(id)a3 atIndexPath:(id)a4;
- (void)keyboardWasShown:(id)a3;
- (void)keyboardWillBeHidden:(id)a3;
- (void)onError;
- (void)resetFirstResponder;
- (void)scrollViewForKeyboardIfNecessary;
- (void)setDelegate:(id)a3;
- (void)setEnterActivationLabel:(id)a3;
- (void)setInfoTableView:(id)a3;
- (void)setInfoTableViewHeightConstraint:(id)a3;
- (void)setScrollView:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSCellularPlanCardInfoViewController

- (TSCellularPlanCardInfoViewController)init
{
  v31[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24.receiver = self;
  v24.super_class = (Class)TSCellularPlanCardInfoViewController;
  v4 = [(TSCellularPlanCardInfoViewController *)&v24 initWithNibName:@"TSCellularPlanCardInfoView" bundle:v3];

  if (v4)
  {
    [(TSCellularPlanCardInfoViewController *)v4 setModalInPresentation:1];
    uint64_t v5 = objc_opt_new();
    tableData = v4->_tableData;
    v4->_tableData = (NSArray *)v5;

    v30 = @"TITLE_KEY";
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_SMDP_LABEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v31[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v23 = (void *)[v9 mutableCopy];

    v28 = @"TITLE_KEY";
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_ACTIVATION_CODE_LABEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v29 = v11;
    v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v13 = (void *)[v12 mutableCopy];

    v26[0] = @"TITLE_KEY";
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_LABEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v26[1] = @"PLACEHOLDER_KEY";
    v27[0] = v15;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_PLACEHOLDER" value:&stru_26DBE8E78 table:@"Localizable"];
    v27[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v19 = (void *)[v18 mutableCopy];

    v25[0] = v23;
    v25[1] = v13;
    v25[2] = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
    v21 = v4->_tableData;
    v4->_tableData = (NSArray *)v20;
  }
  return v4;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)TSCellularPlanCardInfoViewController;
  [(SSUIViewController *)&v19 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanCardInfoViewController *)self view];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v6 = [(TSCellularPlanCardInfoViewController *)self navigationController];
  v7 = [v6 view];
  [v7 setBackgroundColor:v5];

  v8 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83608]];
  v9 = (void *)MEMORY[0x263F81708];
  v10 = [v8 fontDescriptorWithSymbolicTraits:2];
  v11 = [v9 fontWithDescriptor:v10 size:0.0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterActivationLabel);
  [WeakRetained setFont:v11];

  id v13 = objc_alloc(MEMORY[0x263F824A8]);
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"NPHCELLULAR_CARD_INFO_NEXT" value:&stru_26DBE8E78 table:@"Localizable"];
  v16 = (UIBarButtonItem *)[v13 initWithTitle:v15 style:2 target:self action:sel_addNewPlanWithUserInfo_];
  nextButton = self->_nextButton;
  self->_nextButton = v16;

  v18 = [(TSCellularPlanCardInfoViewController *)self navigationItem];
  [v18 setRightBarButtonItem:self->_nextButton animated:0];

  [(UIBarButtonItem *)self->_nextButton setEnabled:0];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanCardInfoViewController;
  [(TSCellularPlanCardInfoViewController *)&v8 viewDidLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  v4 = [MEMORY[0x263F088C8] indexPathWithIndex:0];
  [(TSCellularPlanCardInfoViewController *)self tableView:WeakRetained heightForRowAtIndexPath:v4];
  double v6 = v5;

  id v7 = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  [v7 setConstant:v6 * 3.0 + -0.5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanCardInfoViewController;
  [(TSCellularPlanCardInfoViewController *)&v6 viewWillAppear:a3];
  self->_keyboardSize = (CGSize)*MEMORY[0x263F001B0];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWasShown_ name:*MEMORY[0x263F837A8] object:0];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_keyboardWillBeHidden_ name:*MEMORY[0x263F83800] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanCardInfoViewController;
  [(TSCellularPlanCardInfoViewController *)&v4 viewDidAppear:a3];
  [(TSCellularPlanCardInfoViewController *)self resetFirstResponder];
}

- (void)resetFirstResponder
{
  v2 = [(NSArray *)self->_tableData objectAtIndexedSubscript:0];
  id v4 = [v2 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

  v3 = [v4 editableTextField];
  [v3 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSCellularPlanCardInfoViewController;
  [(TSCellularPlanCardInfoViewController *)&v7 viewWillDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained receivedResponse];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F837A8] object:0];

  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F83800] object:0];
}

- (void)keyboardWasShown:(id)a3
{
  id v7 = [a3 userInfo];
  id v4 = [v7 objectForKey:*MEMORY[0x263F837B8]];
  [v4 CGRectValue];
  self->_keyboardSize.width = v5;
  self->_keyboardSize.height = v6;

  [(TSCellularPlanCardInfoViewController *)self scrollViewForKeyboardIfNecessary];
}

- (void)keyboardWillBeHidden:(id)a3
{
  CGFloat v3 = -self->_keyboardSize.height;
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setContentInset:", 0.0, 0.0, v3, 0.0);

  id v6 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v6, "setScrollIndicatorInsets:", 0.0, 0.0, v3, 0.0);
}

- (void)scrollViewForKeyboardIfNecessary
{
  if (self->_activeTextField)
  {
    p_height = &self->_keyboardSize.height;
    double v4 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  else
  {
    double v6 = *MEMORY[0x263F834E8];
    double v5 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v4 = *(double *)(MEMORY[0x263F834E8] + 24);
    p_height = (CGFloat *)(MEMORY[0x263F834E8] + 16);
  }
  double v7 = *p_height;
  p_scrollView = &self->_scrollView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setScrollIndicatorInsets:", v6, v5, v7, v4);

  id v10 = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(v10, "setContentInset:", v6, v5, v7, v4);

  if (self->_activeTextField)
  {
    v11 = [(TSCellularPlanCardInfoViewController *)self view];
    [v11 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;

    CGFloat v20 = v19 - self->_keyboardSize.height;
    activeTextField = self->_activeTextField;
    [(UITextField *)activeTextField bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    id v30 = objc_loadWeakRetained((id *)p_scrollView);
    -[UITextField convertRect:toView:](activeTextField, "convertRect:toView:", v30, v23, v25, v27, v29);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    v41.origin.x = v13;
    v41.origin.y = v15;
    v41.size.width = v17;
    v41.size.height = v20;
    v42.origin.x = v32;
    v42.origin.y = v34;
    v42.size.width = v36;
    v42.size.height = v38;
    if (!CGRectContainsRect(v41, v42))
    {
      id v39 = objc_loadWeakRetained((id *)p_scrollView);
      objc_msgSend(v39, "scrollRectToVisible:animated:", 1, v32, v34, v36, v38);
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tableData count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v5 row]);
  double v7 = [v6 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

  if (!v7)
  {
    double v7 = -[TSCellularPlanTableViewCell initWithTag:delegate:]([TSCellularPlanTableViewCell alloc], "initWithTag:delegate:", [v5 row], self);
    objc_super v8 = -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v5 row]);
    [v8 setObject:v7 forKeyedSubscript:@"TABLE_CELL_KEY"];
  }
  [(TSCellularPlanCardInfoViewController *)self configureCell:v7 atIndexPath:v5];

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", [v6 row]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = [v15 objectForKeyedSubscript:@"TITLE_KEY"];
  v9 = [v7 textLabel];
  [v9 setText:v8];

  id v10 = [v15 objectForKeyedSubscript:@"PLACEHOLDER_KEY"];
  v11 = [v7 editableTextField];
  [v11 setPlaceholder:v10];

  double v12 = [v15 objectForKeyedSubscript:@"VALUE_KEY"];
  CGFloat v13 = [v7 editableTextField];
  [v13 setText:v12];

  uint64_t v14 = [v6 row];
  [v7 setTag:v14];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[TSCellularPlanTableViewCell rowHeight];
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  uint64_t v5 = [v4 tag];

  switch(v5)
  {
    case 2:
      [(TSCellularPlanCardInfoViewController *)self addNewPlanWithUserInfo:0];
      break;
    case 1:
      tableData = self->_tableData;
      uint64_t v7 = 2;
      goto LABEL_7;
    case 0:
      tableData = self->_tableData;
      uint64_t v7 = 1;
LABEL_7:
      objc_super v8 = [(NSArray *)tableData objectAtIndexedSubscript:v7];
      v9 = [v8 objectForKeyedSubscript:@"TABLE_CELL_KEY"];

      id v10 = [v9 editableTextField];
      [v10 becomeFirstResponder];

      break;
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = (UITextField *)a3;
  if ([(UITextField *)v4 tag] == 2) {
    uint64_t v5 = 11;
  }
  else {
    uint64_t v5 = 4;
  }
  [(UITextField *)v4 setReturnKeyType:v5];
  activeTextField = self->_activeTextField;
  self->_activeTextField = v4;

  [(TSCellularPlanCardInfoViewController *)self scrollViewForKeyboardIfNecessary];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if (![v9 tag])
  {
    v11 = [v9 text];
    double v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", [v12 length] != 0);
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  tableData = self->_tableData;
  id v5 = a3;
  -[NSArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", [v5 tag]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 text];

  uint64_t v7 = (void *)[v6 copy];
  [v9 setObject:v7 forKeyedSubscript:@"VALUE_KEY"];

  activeTextField = self->_activeTextField;
  self->_activeTextField = 0;
}

- (void)addNewPlanWithUserInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = [(TSCellularPlanCardInfoViewController *)self view];
  [v4 endEditing:1];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waitForResponse:self];

  uint64_t v7 = [(NSArray *)self->_tableData objectAtIndexedSubscript:0];
  objc_super v8 = [v7 objectForKeyedSubscript:@"VALUE_KEY"];

  id v9 = [(NSArray *)self->_tableData objectAtIndexedSubscript:1];
  id v10 = [v9 objectForKeyedSubscript:@"VALUE_KEY"];

  v11 = [(NSArray *)self->_tableData objectAtIndexedSubscript:2];
  double v12 = [v11 objectForKeyedSubscript:@"VALUE_KEY"];

  CGFloat v13 = _TSLogDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136316162;
    CGFloat v17 = "-[TSCellularPlanCardInfoViewController addNewPlanWithUserInfo:]";
    __int16 v18 = 2112;
    double v19 = v8;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    double v23 = v12;
    __int16 v24 = 2080;
    double v25 = "-[TSCellularPlanCardInfoViewController addNewPlanWithUserInfo:]";
    _os_log_debug_impl(&dword_227A17000, v13, OS_LOG_TYPE_DEBUG, "[Db] %s - addressField:%@, activationCode:%@, confirmationCode:%@ @%s", (uint8_t *)&v16, 0x34u);
  }

  uint64_t v14 = +[TSCellularPlanManagerCache sharedInstance];
  id v15 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v14, "addNewPlanWithAddress:matchingId:confirmationCode:userConsent:completion:", v8, v10, v12, objc_msgSend(v15, "signupUserConsentResponse"), &__block_literal_global_17);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)onError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained receivedResponseWithVC:self];

  [(TSCellularPlanCardInfoViewController *)self resetFirstResponder];
  id v4 = [(TSCellularPlanCardInfoViewController *)self navigationItem];
  [v4 setHidesBackButton:0];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)enterActivationLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterActivationLabel);
  return (UILabel *)WeakRetained;
}

- (void)setEnterActivationLabel:(id)a3
{
}

- (UITableView)infoTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  return (UITableView *)WeakRetained;
}

- (void)setInfoTableView:(id)a3
{
}

- (NSLayoutConstraint)infoTableViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setInfoTableViewHeightConstraint:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_infoTableViewHeightConstraint);
  objc_destroyWeak((id *)&self->_infoTableView);
  objc_destroyWeak((id *)&self->_enterActivationLabel);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_activeTextField, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end