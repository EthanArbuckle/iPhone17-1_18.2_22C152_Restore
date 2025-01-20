@interface UIPrintCopiesOption
- (BOOL)keyboardShowing;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UIPrintCopiesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIStepper)copiesStepper;
- (UITextField)copiesTextField;
- (id)printOptionTableViewCell;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)copiesStepperChanged:(id)a3;
- (void)copiesTextFieldDidChange;
- (void)dealloc;
- (void)dismissKeyboard;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCopiesStepper:(id)a3;
- (void)setCopiesTextField:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintCopiesOption

- (UIPrintCopiesOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintCopiesOption;
  v7 = [(UIPrintOption *)&v11 initWithPrintInfo:a3 printPanelViewController:v6];
  if (v7)
  {
    v8 = [v6 printInteractionController];
    -[UIPrintOption setShouldShow:](v7, "setShouldShow:", [v8 _canShowCopies]);

    v9 = [(UIPrintOption *)v7 printInfo];
    [v9 addObserver:v7 forKeyPath:0x1F3C9DE78 options:0 context:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DE78];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintCopiesOption;
  [(UIPrintCopiesOption *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__UIPrintCopiesOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__UIPrintCopiesOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (id)printOptionTableViewCell
{
  v57[2] = *MEMORY[0x1E4F143B8];
  v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  objc_super v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Copies" value:@"Copies" table:@"Localizable"];
  v8 = [v5 textLabel];
  [v8 setText:v7];

  v9 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v11 = [v10 localizedStringForKey:@"Copies" value:@"Copies" table:@"Localizable"];
  [v9 setText:v11];

  [v5 setContentConfiguration:v9];
  [v5 setSelectionStyle:0];
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setUserInteractionEnabled:1];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v13, v14, v15, v16);
  [(UIPrintCopiesOption *)self setCopiesTextField:v18];

  v19 = [(UIPrintCopiesOption *)self copiesTextField];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(UIPrintCopiesOption *)self copiesTextField];
  [v20 setDelegate:self];

  v21 = [(UIPrintCopiesOption *)self copiesTextField];
  [v21 setTextAlignment:1];

  v22 = [(UIPrintCopiesOption *)self copiesTextField];
  [v22 setKeyboardType:4];

  v23 = [(UIPrintCopiesOption *)self copiesTextField];
  [v23 setBorderStyle:3];

  v24 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
  v25 = [(UIPrintCopiesOption *)self copiesTextField];
  [v25 setBackgroundColor:v24];

  v26 = [(UIPrintCopiesOption *)self copiesTextField];
  [v17 addSubview:v26];

  v27 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  if (!v28)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
    [v29 sizeToFit];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v31 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissKeyboard];
    v57[0] = v30;
    v57[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    [v29 setItems:v32];

    v33 = [(UIPrintCopiesOption *)self copiesTextField];
    [v33 setInputAccessoryView:v29];
  }
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CA8]), "initWithFrame:", v13, v14, v15, v16);
  [(UIPrintCopiesOption *)self setCopiesStepper:v34];

  v35 = [(UIPrintCopiesOption *)self copiesStepper];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = [(UIPrintCopiesOption *)self copiesStepper];
  [v36 setMinimumValue:1.0];

  v37 = [(UIPrintCopiesOption *)self copiesStepper];
  [v37 setMaximumValue:999.0];

  v38 = [(UIPrintCopiesOption *)self copiesStepper];
  [v38 addTarget:self action:sel_copiesStepperChanged_ forControlEvents:4096];

  v39 = [(UIPrintCopiesOption *)self copiesStepper];
  [v17 addSubview:v39];

  v55[0] = @"copiesText";
  v40 = [(UIPrintCopiesOption *)self copiesTextField];
  v55[1] = @"copiesStepper";
  v56[0] = v40;
  v41 = [(UIPrintCopiesOption *)self copiesStepper];
  v56[1] = v41;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

  v43 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[copiesText]-[copiesStepper]|" options:0 metrics:0 views:v42];
  [v17 addConstraints:v43];

  v44 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[copiesText]|" options:0 metrics:0 views:v42];
  [v17 addConstraints:v44];

  v45 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[copiesStepper]|" options:0 metrics:0 views:v42];
  [v17 addConstraints:v45];

  v46 = (void *)MEMORY[0x1E4F28DC8];
  v47 = [(UIPrintCopiesOption *)self copiesTextField];
  v48 = [v46 constraintWithItem:v47 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:76.0];
  [v17 addConstraint:v48];

  [v17 layoutIfNeeded];
  [v17 bounds];
  objc_msgSend(v17, "setFrame:");
  id v49 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v17 bounds];
  v50 = objc_msgSend(v49, "initWithFrame:");
  [v50 setUserInteractionEnabled:1];
  [v50 addSubview:v17];
  [v5 setAccessoryView:v50];
  v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v52 = *MEMORY[0x1E4FB3018];
  v53 = [(UIPrintCopiesOption *)self copiesTextField];
  [v51 addObserver:self selector:sel_copiesTextFieldDidChange name:v52 object:v53];

  [(UIPrintCopiesOption *)self updateFromPrintInfo];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (void)updateFromPrintInfo
{
  v3 = [(UIPrintOption *)self printInfo];
  uint64_t v4 = [v3 copies];

  objc_super v5 = [(UIPrintCopiesOption *)self copiesStepper];
  [v5 setValue:(double)v4];

  id v6 = [(UIPrintCopiesOption *)self copiesTextField];
  char v7 = [v6 isEditing];

  if ((v7 & 1) == 0)
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = [(UIPrintCopiesOption *)self copiesTextField];
    [v8 setText:v9];
  }
}

- (void)copiesStepperChanged:(id)a3
{
  [a3 value];
  unint64_t v5 = vcvtmd_s64_f64(v4);
  id v6 = [(UIPrintOption *)self printInfo];
  [v6 setCopies:v5];

  char v7 = [(UIPrintCopiesOption *)self copiesTextField];
  int v8 = [v7 isEditing];

  if (v8)
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [(UIPrintCopiesOption *)self copiesTextField];
    [v9 setText:v10];
  }
}

- (void)copiesTextFieldDidChange
{
  v3 = [(UIPrintCopiesOption *)self copiesTextField];
  double v4 = [v3 text];
  double v5 = (double)[v4 integerValue];

  id v6 = [(UIPrintCopiesOption *)self copiesStepper];
  [v6 setValue:(double)(uint64_t)v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([v10 length])
  {
    if ([v9 keyboardType] == 4)
    {
      objc_super v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      id v12 = [v11 invertedSet];
      uint64_t v13 = [v10 rangeOfCharacterFromSet:v12];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v16 = 0;
        goto LABEL_13;
      }
    }
    double v14 = [v9 text];
    double v15 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    if ((unint64_t)[v15 length] > 4) {
      goto LABEL_5;
    }
    uint64_t v17 = [v15 integerValue];
    v18 = [(UIPrintCopiesOption *)self copiesStepper];
    [v18 minimumValue];
    BOOL v16 = v19 <= (double)v17;
    if (v19 <= (double)v17)
    {
      v20 = [(UIPrintCopiesOption *)self copiesStepper];
      [v20 maximumValue];
      double v22 = v21;

      if (v22 < (double)v17)
      {
LABEL_5:
        BOOL v16 = 0;
LABEL_11:

        goto LABEL_13;
      }
      v18 = [(UIPrintOption *)self printInfo];
      [v18 setCopies:v17];
    }

    goto LABEL_11;
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void)textFieldDidEndEditing:(id)a3
{
  double v4 = [a3 text];
  uint64_t v5 = [v4 integerValue];

  id v6 = [(UIPrintOption *)self printInfo];
  id v9 = v6;
  if (v5)
  {
    uint64_t v7 = [v6 copies];

    if (v5 == v7) {
      return;
    }
    id v6 = [(UIPrintOption *)self printInfo];
    id v9 = v6;
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v8 = 1;
  }
  [v6 setCopies:v8];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)keyboardShowing
{
  v2 = [(UIPrintCopiesOption *)self copiesTextField];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (void)dismissKeyboard
{
  char v3 = [(UIPrintCopiesOption *)self copiesTextField];
  double v4 = [(UIPrintCopiesOption *)self copiesTextField];
  uint64_t v5 = [(UIPrintCopiesOption *)self copiesTextField];
  id v6 = [v5 beginningOfDocument];
  uint64_t v7 = [(UIPrintCopiesOption *)self copiesTextField];
  uint64_t v8 = [v7 beginningOfDocument];
  id v9 = [v4 textRangeFromPosition:v6 toPosition:v8];
  [v3 setSelectedTextRange:v9];

  id v10 = [(UIPrintCopiesOption *)self copiesTextField];
  [v10 resignFirstResponder];
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = *MEMORY[0x1E4FB2D90];
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(id *)(*((void *)&v15 + 1) + 8 * v10);
      id v12 = objc_msgSend(v11, "identifier", (void)v15);
      char v13 = [v12 isEqualToString:v9];

      if (v13) {
        break;
      }

      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v11 = 0;
  }

  return v11;
}

- (UIStepper)copiesStepper
{
  return self->_copiesStepper;
}

- (void)setCopiesStepper:(id)a3
{
}

- (UITextField)copiesTextField
{
  return self->_copiesTextField;
}

- (void)setCopiesTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copiesTextField, 0);
  objc_storeStrong((id *)&self->_copiesStepper, 0);
}

@end