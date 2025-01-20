@interface UIPrintScalingOption
- (BOOL)keyboardShowing;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UIPrintScalingOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIStepper)scaleStepper;
- (UITextField)scaleTextField;
- (double)savedTableViewWidth;
- (id)printOptionTableViewCell;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)dealloc;
- (void)dismissKeyboard;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paperScaleStepperChanged:(id)a3;
- (void)paperScaleTextFieldDidChange;
- (void)printPanelDidChangeSize;
- (void)saveScaleValueToPrintInfo:(int64_t)a3;
- (void)setSavedTableViewWidth:(double)a3;
- (void)setScaleStepper:(id)a3;
- (void)setScaleTextField:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintScalingOption

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DEF8];

  v4 = [(UIPrintOption *)self printPanelViewController];
  v5 = [v4 printOptionsTableView];
  [v5 removeObserver:self forKeyPath:@"frame"];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)UIPrintScalingOption;
  [(UIPrintScalingOption *)&v7 dealloc];
}

- (UIPrintScalingOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)UIPrintScalingOption;
  v4 = [(UIPrintOption *)&v14 initWithPrintInfo:a3 printPanelViewController:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIPrintOption *)v4 printPanelViewController];
    -[UIPrintOption setShouldShow:](v5, "setShouldShow:", [v6 shouldShowScaling]);

    objc_super v7 = [(UIPrintOption *)v5 printInfo];
    [v7 addObserver:v5 forKeyPath:0x1F3C9DEF8 options:0 context:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = [(UIPrintOption *)v5 printPanelViewController];
    [v8 addObserver:v5 selector:sel_printPanelDidChangeSize name:@"UIPrintPanelDidChangeSizeNotification" object:v9];

    v10 = [(UIPrintOption *)v5 printPanelViewController];
    v11 = [v10 printOptionsTableView];
    [v11 frame];
    [(UIPrintScalingOption *)v5 setSavedTableViewWidth:v12];
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"frame", a4, a5, a6))
  {
    uint64_t v7 = [(UIPrintOption *)self tableViewCell];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(UIPrintOption *)self printPanelViewController];
      v10 = [v9 printOptionsTableView];
      [v10 frame];
      double v12 = v11;
      [(UIPrintScalingOption *)self savedTableViewWidth];
      double v14 = v13;

      if (v12 != v14)
      {
        v15 = [(UIPrintOption *)self printPanelViewController];
        v16 = [v15 printOptionsTableView];
        [v16 frame];
        [(UIPrintScalingOption *)self setSavedTableViewWidth:v17];

        v18 = [(UIPrintOption *)self printPanelViewController];
        v19 = [v18 printOptionsTableView];
        v20 = [(UIPrintOption *)self tableViewCell];
        v21 = [v19 indexPathForCell:v20];

        if (v21)
        {
          v22 = [(UIPrintOption *)self printPanelViewController];
          v23 = [v22 printOptionsTableView];
          v26[0] = v21;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
          [v23 reloadRowsAtIndexPaths:v24 withRowAnimation:0];
        }
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__UIPrintScalingOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6DA1408;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __71__UIPrintScalingOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)printPanelDidChangeSize
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIPrintOption *)self tableViewCell];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(UIPrintOption *)self printPanelViewController];
    v6 = [v5 printOptionsTableView];
    [v6 frame];
    double v8 = v7;
    [(UIPrintScalingOption *)self savedTableViewWidth];
    double v10 = v9;

    if (v8 != v10)
    {
      double v11 = [(UIPrintOption *)self printPanelViewController];
      double v12 = [v11 printOptionsTableView];
      [v12 frame];
      [(UIPrintScalingOption *)self setSavedTableViewWidth:v13];

      double v14 = [(UIPrintOption *)self printPanelViewController];
      v15 = [v14 printOptionsTableView];
      v16 = [(UIPrintOption *)self tableViewCell];
      double v17 = [v15 indexPathForCell:v16];

      if (v17)
      {
        v18 = [(UIPrintOption *)self printPanelViewController];
        v19 = [v18 printOptionsTableView];
        v21[0] = v17;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        [v19 reloadRowsAtIndexPaths:v20 withRowAnimation:0];
      }
    }
  }
}

- (id)printOptionTableViewCell
{
  v73[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionCell"];

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v7 = [v6 localizedStringForKey:@"Scaling" value:@"Scaling" table:@"Localizable"];
  double v8 = [v5 textLabel];
  [v8 setText:v7];

  double v9 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v11 = [v10 localizedStringForKey:@"Scaling" value:@"Scaling" table:@"Localizable"];
  [v9 setText:v11];

  [v5 setContentConfiguration:v9];
  [v5 setSelectionStyle:0];
  id v12 = objc_alloc(MEMORY[0x1E4FB1D70]);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
  [(UIPrintScalingOption *)self setScaleTextField:v17];

  v18 = [(UIPrintScalingOption *)self scaleTextField];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(UIPrintScalingOption *)self scaleTextField];
  [v19 setDelegate:self];

  v20 = [(UIPrintScalingOption *)self scaleTextField];
  [v20 setTextAlignment:1];

  v21 = [(UIPrintScalingOption *)self scaleTextField];
  [v21 setKeyboardType:4];

  v22 = [(UIPrintScalingOption *)self scaleTextField];
  [v22 setBorderStyle:3];

  v23 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
  v24 = [(UIPrintScalingOption *)self scaleTextField];
  [v24 setBackgroundColor:v23];

  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CA8]), "initWithFrame:", v13, v14, v15, v16);
  [(UIPrintScalingOption *)self setScaleStepper:v25];

  v26 = [(UIPrintScalingOption *)self scaleStepper];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(UIPrintScalingOption *)self scaleStepper];
  [v27 setMinimumValue:1.0];

  v28 = [(UIPrintScalingOption *)self scaleStepper];
  [v28 setMaximumValue:400.0];

  v29 = [(UIPrintScalingOption *)self scaleStepper];
  [v29 addTarget:self action:sel_paperScaleStepperChanged_ forControlEvents:4096];

  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v15, v16);
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v30 setUserInteractionEnabled:1];
  v31 = [(UIPrintScalingOption *)self scaleTextField];
  [v30 addSubview:v31];

  v32 = [(UIPrintScalingOption *)self scaleStepper];
  [v30 addSubview:v32];

  v72[0] = @"scaleText";
  v33 = [(UIPrintScalingOption *)self scaleTextField];
  v72[1] = @"scaleStepper";
  v73[0] = v33;
  v34 = [(UIPrintScalingOption *)self scaleStepper];
  v73[1] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];

  v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[scaleText]-[scaleStepper]|" options:0 metrics:0 views:v35];
  [v30 addConstraints:v36];

  v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[scaleText]|" options:0 metrics:0 views:v35];
  [v30 addConstraints:v37];

  v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[scaleStepper]|" options:0 metrics:0 views:v35];
  [v30 addConstraints:v38];

  v39 = (void *)MEMORY[0x1E4F28DC8];
  v40 = [(UIPrintScalingOption *)self scaleTextField];
  v41 = [v39 constraintWithItem:v40 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:76.0];
  [v30 addConstraint:v41];

  v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v13, v14, v15, v16);
  v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v44 = [v43 localizedStringForKey:@"Scaling" value:@"Scaling" table:@"Localizable"];
  [v42 setText:v44];

  v70 = v9;
  v45 = [v9 textProperties];
  v46 = [v45 font];
  [v42 setFont:v46];

  [v42 setNumberOfLines:1];
  [v42 sizeToFit];
  v47 = [(UIPrintOption *)self printPanelViewController];
  v48 = [v47 printOptionsTableView];
  v49 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  [v48 rectForRowAtIndexPath:v49];
  double v51 = v50;

  [v42 frame];
  double v53 = v52;
  [v30 frame];
  if (v53 > v51 - v54 + -48.0)
  {
    v55 = [(UIPrintScalingOption *)self scaleStepper];
    [v55 removeFromSuperview];

    v56 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[scaleText]|" options:0 metrics:0 views:v35];
    [v30 addConstraints:v56];
  }
  [v30 layoutIfNeeded];
  [v30 bounds];
  objc_msgSend(v30, "setFrame:");
  id v57 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v30 bounds];
  v58 = objc_msgSend(v57, "initWithFrame:");
  [v58 setUserInteractionEnabled:1];
  [v58 addSubview:v30];
  [v5 setAccessoryView:v58];
  v59 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v60 = [v59 userInterfaceIdiom];

  if (!v60)
  {
    id v61 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
    [v61 sizeToFit];
    v62 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v63 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissKeyboard];
    v71[0] = v62;
    v71[1] = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    [v61 setItems:v64];

    v65 = [(UIPrintScalingOption *)self scaleTextField];
    [v65 setInputAccessoryView:v61];
  }
  v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v67 = *MEMORY[0x1E4FB3018];
  v68 = [(UIPrintScalingOption *)self scaleTextField];
  [v66 addObserver:self selector:sel_paperScaleTextFieldDidChange name:v67 object:v68];

  [(UIPrintScalingOption *)self updateFromPrintInfo];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (void)updateFromPrintInfo
{
  uint64_t v3 = [(UIPrintOption *)self printInfo];
  [v3 scalingFactor];
  double v5 = v4 * 100.0;
  double v6 = round(v4 * 100.0);

  double v7 = [(UIPrintScalingOption *)self scaleStepper];
  [v7 setValue:(double)(uint64_t)v6];

  double v8 = [(UIPrintScalingOption *)self scaleTextField];
  char v9 = [v8 isEditing];

  if ((v9 & 1) == 0)
  {
    double v10 = NSString;
    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v11 = [v14 localizedStringForKey:@"%ld%%" value:@"%ld%%" table:@"Localizable"];
    id v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, llround(v5));
    double v13 = [(UIPrintScalingOption *)self scaleTextField];
    [v13 setText:v12];
  }
}

- (void)saveScaleValueToPrintInfo:(int64_t)a3
{
  double v4 = (double)a3 / 100.0;
  double v5 = [(UIPrintOption *)self printInfo];
  [v5 scalingFactor];
  double v7 = v6;

  if (v4 != v7)
  {
    double v8 = [(UIPrintOption *)self printInfo];
    [v8 setScalingFactor:v4];

    char v9 = [(UIPrintOption *)self printInfo];
    double v10 = [v9 printPaper];
    [v10 setScalingFactor:v4];

    id v13 = [(UIPrintOption *)self printPanelViewController];
    double v11 = [v13 printInteractionController];
    id v12 = [v11 paper];
    [v12 setScalingFactor:v4];
  }
}

- (void)paperScaleStepperChanged:(id)a3
{
  [a3 value];
  unint64_t v5 = vcvtmd_s64_f64(v4);
  [(UIPrintScalingOption *)self saveScaleValueToPrintInfo:v5];
}

- (void)paperScaleTextFieldDidChange
{
  uint64_t v3 = [(UIPrintScalingOption *)self scaleTextField];
  double v4 = [v3 text];
  double v5 = (double)[v4 integerValue];

  id v6 = [(UIPrintScalingOption *)self scaleStepper];
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
    if ([v9 keyboardType] == 4
      && ([MEMORY[0x1E4F28B88] decimalDigitCharacterSet],
          double v11 = objc_claimAutoreleasedReturnValue(),
          [v11 invertedSet],
          id v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v10 rangeOfCharacterFromSet:v12],
          v12,
          v11,
          v13 != 0x7FFFFFFFFFFFFFFFLL))
    {
      BOOL v16 = 0;
    }
    else
    {
      id v14 = [v9 text];
      double v15 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);

      if ((unint64_t)[v15 length] <= 4)
      {
        double v17 = (double)[v15 integerValue];
        v18 = [(UIPrintScalingOption *)self scaleStepper];
        [v18 minimumValue];
        if (v19 <= v17)
        {
          v20 = [(UIPrintScalingOption *)self scaleStepper];
          [v20 maximumValue];
          BOOL v16 = v21 >= v17;
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPrintOption *)self printInfo];
  [v5 scalingFactor];
  *(float *)&double v6 = v6 * 100.0;
  unint64_t v7 = llroundf(*(float *)&v6);

  objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setText:v8];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  double v5 = [v4 text];
  uint64_t v6 = [v5 integerValue];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 100;
  }
  [(UIPrintScalingOption *)self saveScaleValueToPrintInfo:v7];
  id v8 = NSString;
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"%ld%%" value:@"%ld%%" table:@"Localizable"];
  double v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  [v4 setText:v11];

  id v12 = [(UIPrintScalingOption *)self scaleStepper];
  [v12 setValue:(double)v7];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)keyboardShowing
{
  v2 = [(UIPrintScalingOption *)self scaleTextField];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (void)dismissKeyboard
{
  char v3 = [(UIPrintScalingOption *)self scaleTextField];
  id v4 = [(UIPrintScalingOption *)self scaleTextField];
  double v5 = [(UIPrintScalingOption *)self scaleTextField];
  uint64_t v6 = [v5 beginningOfDocument];
  uint64_t v7 = [(UIPrintScalingOption *)self scaleTextField];
  id v8 = [v7 beginningOfDocument];
  id v9 = [v4 textRangeFromPosition:v6 toPosition:v8];
  [v3 setSelectedTextRange:v9];

  id v10 = [(UIPrintScalingOption *)self scaleTextField];
  [v10 resignFirstResponder];
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = [(UIPrintScalingOption *)self scaleTextField];
  char v8 = [v7 isEditing];

  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      uint64_t v13 = *MEMORY[0x1E4FB2D90];
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v21 + 1) + 8 * v14);
        BOOL v16 = objc_msgSend(v15, "identifier", (void)v21);
        char v17 = [v16 isEqualToString:v13];

        if (v17) {
          break;
        }

        if (v11 == ++v14)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      id v15 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4FB1970];
    double v19 = [MEMORY[0x1E4F1C978] array];
    id v15 = [v18 menuWithChildren:v19];
  }
  return v15;
}

- (UIStepper)scaleStepper
{
  return self->_scaleStepper;
}

- (void)setScaleStepper:(id)a3
{
}

- (UITextField)scaleTextField
{
  return self->_scaleTextField;
}

- (void)setScaleTextField:(id)a3
{
}

- (double)savedTableViewWidth
{
  return self->_savedTableViewWidth;
}

- (void)setSavedTableViewWidth:(double)a3
{
  self->_savedTableViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleTextField, 0);
  objc_storeStrong((id *)&self->_scaleStepper, 0);
}

@end