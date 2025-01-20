@interface UIPrintAccountInfoOption
- (BOOL)canDismiss;
- (BOOL)isJobAccountIDRequired;
- (BOOL)shouldShow;
- (UIPrintAccountInfoOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UITextField)jobAccountIDTextField;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)changeJobAccountID:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)promptForJobAccountID;
- (void)selectJobAccountID;
- (void)setJobAccountIDTextField:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintAccountInfoOption

- (UIPrintAccountInfoOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIPrintAccountInfoOption;
  v4 = [(UIPrintOption *)&v8 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printInfo];
    [v6 addObserver:v5 forKeyPath:0x1F3C9DF38 options:0 context:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DF38];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintAccountInfoOption;
  [(UIPrintAccountInfoOption *)&v4 dealloc];
}

- (BOOL)isJobAccountIDRequired
{
  v3 = [(UIPrintOption *)self printInfo];
  objc_super v4 = [v3 currentPrinter];
  if (v4)
  {
    v5 = [(UIPrintOption *)self printInfo];
    v6 = [v5 currentPrinter];
    BOOL v7 = [v6 jobAccountIDSupport] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  objc_super v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"JobAccountIDCell"];

  if (!v5)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"JobAccountIDCell"];
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"Account" value:@"Account" table:@"Localizable"];
    objc_super v8 = [v5 textLabel];
    [v8 setText:v7];

    [v5 setSelectionStyle:0];
    id v9 = objc_alloc(MEMORY[0x1E4FB1D70]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    [(UIPrintAccountInfoOption *)self setJobAccountIDTextField:v14];

    v15 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v15 setDelegate:self];

    uint64_t v16 = 2 * ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 0);
    v17 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v17 setTextAlignment:v16];

    v18 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v18 setEnabled:1];

    v19 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v19 setSpellCheckingType:1];

    v20 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v20 setAutocorrectionType:1];

    v21 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v21 setHoverStyle:0];

    v22 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v22 addTarget:self action:sel_changeJobAccountID_ forControlEvents:0x40000];

    v23 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v5 setAccessoryView:v23];

    v24 = [MEMORY[0x1E4FB1948] cellConfiguration];
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v10, v11, v12, v13);
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"Account" value:@"Account" table:@"Localizable"];
    [v25 setText:v27];

    v28 = [v24 textProperties];
    v29 = [v28 font];
    [v25 setFont:v29];

    [v25 setNumberOfLines:1];
    [v25 sizeToFit];
    v30 = [(UIPrintOption *)self printPanelViewController];
    v31 = [v30 printOptionsTableView];
    v32 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [v31 rectForRowAtIndexPath:v32];
    double v34 = v33;
    double v36 = v35;

    v37 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    [v37 frame];
    double v39 = v38;
    double v41 = v40;

    [v25 frame];
    double v43 = v34 - (v42 + 64.0);
    v44 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
    objc_msgSend(v44, "setFrame:", v39, v41, v43, v36 + -8.0);
  }
  BOOL v45 = [(UIPrintAccountInfoOption *)self isJobAccountIDRequired];
  v46 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v47 = v46;
  if (v45) {
    v48 = @"Account Information (Required)";
  }
  else {
    v48 = @"Account Information";
  }
  v49 = [v46 localizedStringForKey:v48 value:v48 table:@"Localizable"];
  v50 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
  [v50 setPlaceholder:v49];

  v51 = [(UIPrintOption *)self printInfo];
  v52 = [v51 jobAccountID];
  v53 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
  [v53 setText:v52];

  v54 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
  [v54 setHoverStyle:0];

  [(UIPrintOption *)self setTableViewCell:v5];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__UIPrintAccountInfoOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__UIPrintAccountInfoOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)updateFromPrintInfo
{
  id v5 = [(UIPrintOption *)self printInfo];
  v3 = [v5 jobAccountID];
  objc_super v4 = [(UIPrintAccountInfoOption *)self jobAccountIDTextField];
  [v4 setText:v3];
}

- (void)changeJobAccountID:(id)a3
{
  id v5 = [a3 text];
  objc_super v4 = [(UIPrintOption *)self printInfo];
  [v4 setJobAccountID:v5];
}

- (BOOL)shouldShow
{
  v3 = [(UIPrintOption *)self printInfo];
  objc_super v4 = [v3 currentPrinter];
  if (v4)
  {
    id v5 = [(UIPrintOption *)self printInfo];
    v6 = [v5 currentPrinter];
    char v7 = [v6 supportsJobAccountID];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)summary
{
  return 0;
}

- (void)promptForJobAccountID
{
  v3 = NSString;
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"Account information required for “%@”" value:@"Account information required for “%@”" table:@"Localizable"];
  v6 = [(UIPrintOption *)self printInfo];
  char v7 = [v6 currentPrinter];
  objc_super v8 = [v7 displayName];
  id v9 = objc_msgSend(v3, "stringWithFormat:", v5, v8);

  double v10 = (void *)MEMORY[0x1E4FB1418];
  double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v12 = [v11 localizedStringForKey:@"Enter the account information in the print options." value:@"Enter the account information in the print options." table:@"Localizable"];
  double v13 = [v10 alertControllerWithTitle:v9 message:v12 preferredStyle:1];

  v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"ACCOUNT_ID_ALERT_BUTTON_TEXT" value:@"OK" table:@"Localizable"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__UIPrintAccountInfoOption_promptForJobAccountID__block_invoke;
  v19[3] = &unk_1E6DA1F68;
  v19[4] = self;
  v17 = [v14 actionWithTitle:v16 style:0 handler:v19];

  [v13 addAction:v17];
  v18 = [(UIPrintOption *)self printPanelViewController];
  [v18 presentViewController:v13 animated:1 completion:0];
}

uint64_t __49__UIPrintAccountInfoOption_promptForJobAccountID__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectJobAccountID];
}

- (void)selectJobAccountID
{
  v2 = [(UIPrintOption *)self tableViewCell];
  id v4 = [v2 editableTextField];

  v3 = v4;
  if (v4)
  {
    [v4 becomeFirstResponder];
    v3 = v4;
  }
}

- (BOOL)canDismiss
{
  v3 = [(UIPrintOption *)self tableViewCell];
  id v4 = [v3 editableTextField];

  if (v4 && [v4 isFirstResponder]) {
    [v4 resignFirstResponder];
  }
  id v5 = [(UIPrintOption *)self printInfo];
  v6 = [v5 currentPrinter];
  if ([v6 jobAccountIDSupport] == 1)
  {
    char v7 = [(UIPrintOption *)self printInfo];
    uint64_t v8 = [v7 jobAccountID];
    if (!v8)
    {

LABEL_11:
      [(UIPrintAccountInfoOption *)self promptForJobAccountID];
      BOOL v13 = 0;
      goto LABEL_12;
    }
    id v9 = (void *)v8;
    double v10 = [(UIPrintOption *)self printInfo];
    double v11 = [v10 jobAccountID];
    uint64_t v12 = [v11 length];

    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (UITextField)jobAccountIDTextField
{
  return self->_jobAccountIDTextField;
}

- (void)setJobAccountIDTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end