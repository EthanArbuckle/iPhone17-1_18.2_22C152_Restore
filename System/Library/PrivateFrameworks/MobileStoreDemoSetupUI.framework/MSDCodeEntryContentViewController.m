@interface MSDCodeEntryContentViewController
- (MSDCodeEntryContentViewController)initWithTitle:(id)a3 message:(id)a4 verificationCode:(id)a5 verificationErrorMesssage:(id)a6 andDelegate:(id)a7;
- (MSDCodeEntryContentViewControllerDelegate)delegate;
- (MSDCodeEntryView)codeEntryView;
- (NSArray)activeConstraints;
- (NSString)errorMessage;
- (NSString)verificationCode;
- (UILabel)messageLabel;
- (UILabel)promptLabel;
- (UILabel)titleLabel;
- (void)didEnterCode:(id)a3 forEntry:(id)a4;
- (void)setActiveConstraints:(id)a3;
- (void)setCodeEntryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setPromptLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerificationCode:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MSDCodeEntryContentViewController

- (MSDCodeEntryContentViewController)initWithTitle:(id)a3 message:(id)a4 verificationCode:(id)a5 verificationErrorMesssage:(id)a6 andDelegate:(id)a7
{
  id v12 = a3;
  id v69 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v70.receiver = self;
  v70.super_class = (Class)MSDCodeEntryContentViewController;
  v16 = [(MSDCodeEntryContentViewController *)&v70 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    [(MSDCodeEntryContentViewController *)v16 setVerificationCode:v13];
    [(MSDCodeEntryContentViewController *)v17 setDelegate:v15];
    [(MSDCodeEntryContentViewController *)v17 setActiveConstraints:0];
    [(MSDCodeEntryContentViewController *)v17 setErrorMessage:v14];
    v66 = +[MSDSetupUILocalization localizedStringForKey:@"DDL_AUTHENTICATION_PROMPT"];
    v67 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D298] addingSymbolicTraits:0 options:2];
    id v18 = objc_alloc(MEMORY[0x263F1C768]);
    double v19 = *MEMORY[0x263F001A8];
    double v20 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v21 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
    v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], v20, v21, v22);
    [(MSDCodeEntryContentViewController *)v17 setTitleLabel:v23];

    v24 = [MEMORY[0x263F81708] fontWithDescriptor:v67 size:0.0];
    v25 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v25 setFont:v24];

    v26 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v26 setNumberOfLines:0];

    v27 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v27 setTextAlignment:1];

    v28 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v28 setText:v12];

    v29 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v30 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    LODWORD(v31) = 1055286886;
    [v30 _setHyphenationFactor:v31];

    v32 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v32 setPreferredMaxLayoutWidth:238.0];

    v33 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v19, v20, v21, v22);
    [(MSDCodeEntryContentViewController *)v17 setMessageLabel:v33];

    uint64_t v34 = *MEMORY[0x263F1D280];
    v35 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:0x8000 options:2];
    v36 = [MEMORY[0x263F81708] fontWithDescriptor:v35 size:0.0];
    [(MSDCodeEntryContentViewController *)v17 messageLabel];
    v37 = id v68 = v12;
    [v37 setFont:v36];

    v38 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v38 setNumberOfLines:0];

    v39 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v39 setTextAlignment:1];

    v40 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v40 setAttributedText:v69];

    v41 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

    v42 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    LODWORD(v43) = 1055286886;
    [v42 _setHyphenationFactor:v43];

    v44 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v44 setPreferredMaxLayoutWidth:238.0];

    v45 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v19, v20, v21, v22);
    [(MSDCodeEntryContentViewController *)v17 setPromptLabel:v45];

    v46 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v34 addingSymbolicTraits:0x8000 options:2];
    v47 = [MEMORY[0x263F81708] fontWithDescriptor:v46 size:0.0];
    v48 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v48 setFont:v47];

    v49 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v49 setNumberOfLines:0];

    v50 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v50 setTextAlignment:1];

    v51 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v51 setText:v66];

    v52 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];

    v53 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    LODWORD(v54) = 1055286886;
    [v53 _setHyphenationFactor:v54];

    v55 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v55 setPreferredMaxLayoutWidth:238.0];

    v56 = [[MSDCodeEntryView alloc] initWithDelegate:v17];
    [(MSDCodeEntryContentViewController *)v17 setCodeEntryView:v56];

    v57 = [(MSDCodeEntryContentViewController *)v17 view];
    v58 = [(MSDCodeEntryContentViewController *)v17 titleLabel];
    [v57 addSubview:v58];

    v59 = [(MSDCodeEntryContentViewController *)v17 view];
    v60 = [(MSDCodeEntryContentViewController *)v17 messageLabel];
    [v59 addSubview:v60];

    v61 = [(MSDCodeEntryContentViewController *)v17 view];
    v62 = [(MSDCodeEntryContentViewController *)v17 promptLabel];
    [v61 addSubview:v62];

    v63 = [(MSDCodeEntryContentViewController *)v17 view];
    v64 = [(MSDCodeEntryContentViewController *)v17 codeEntryView];
    [v63 addSubview:v64];

    id v12 = v68;
  }

  return v17;
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MSDCodeEntryContentViewController;
  [(MSDCodeEntryContentViewController *)&v6 viewWillLayoutSubviews];
  v3 = [(MSDCodeEntryContentViewController *)self view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D498], *(double *)(MEMORY[0x263F1D498] + 8));
  double v5 = v4;

  -[MSDCodeEntryContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSDCodeEntryContentViewController;
  [(MSDCodeEntryContentViewController *)&v5 viewDidAppear:a3];
  double v4 = [(MSDCodeEntryContentViewController *)self codeEntryView];
  [v4 becomeFirstResponder];
}

- (void)updateViewConstraints
{
  v58.receiver = self;
  v58.super_class = (Class)MSDCodeEntryContentViewController;
  [(MSDCodeEntryContentViewController *)&v58 updateViewConstraints];
  v3 = [(MSDCodeEntryContentViewController *)self activeConstraints];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F08938];
    objc_super v5 = [(MSDCodeEntryContentViewController *)self activeConstraints];
    [v4 deactivateConstraints:v5];
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v55 = objc_alloc_init(MEMORY[0x263F81668]);
  [v55 setWantsBaselineOffset:1];
  [v55 baselineOffset];
  double v8 = v7;
  double v54 = +[MSDCodeEntryView generatorFieldFont];
  [v54 descender];
  double v10 = v9;
  uint64_t v11 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelMess.isa, self->_titleLabel, self->_messageLabel, 0);
  id v12 = [MEMORY[0x263F1C668] metricsForTextStyle:*MEMORY[0x263F1D260]];
  id v13 = (void *)MEMORY[0x263F08938];
  id v14 = [(MSDCodeEntryContentViewController *)self titleLabel];
  id v15 = [(MSDCodeEntryContentViewController *)self view];
  [v12 scaledValueForValue:36.0];
  v16 = [MEMORY[0x263F1C920] mainScreen];
  UIRoundToScreenScale();
  v57 = [v13 constraintWithItem:v14 attribute:12 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:v17];

  id v18 = (void *)MEMORY[0x263F08938];
  double v19 = [(MSDCodeEntryContentViewController *)self titleLabel];
  double v20 = [(MSDCodeEntryContentViewController *)self messageLabel];
  [v12 scaledValueForValue:-20.0];
  double v21 = [MEMORY[0x263F1C920] mainScreen];
  UIRoundToScreenScale();
  v56 = [v18 constraintWithItem:v19 attribute:11 relatedBy:0 toItem:v20 attribute:12 multiplier:1.0 constant:v22];

  v53 = (void *)v11;
  v52 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(H_MARGIN)-[_titleLabel]-(H_MARGIN)-|" options:0 metrics:&unk_26EC99188 views:v11];
  v51 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(H_MARGIN)-[_messageLabel]-(H_MARGIN)-|" options:0 metrics:&unk_26EC99188 views:v11];
  v23 = (void *)MEMORY[0x263F08938];
  v24 = [(MSDCodeEntryContentViewController *)self promptLabel];
  v25 = [(MSDCodeEntryContentViewController *)self view];
  v50 = [v23 constraintWithItem:v24 attribute:9 relatedBy:0 toItem:v25 attribute:9 multiplier:1.0 constant:0.0];

  v26 = (void *)MEMORY[0x263F08938];
  v27 = [(MSDCodeEntryContentViewController *)self messageLabel];
  v28 = [(MSDCodeEntryContentViewController *)self promptLabel];
  v29 = v12;
  [v12 scaledValueForValue:-30.0];
  v30 = [MEMORY[0x263F1C920] mainScreen];
  UIRoundToScreenScale();
  uint64_t v32 = [v26 constraintWithItem:v27 attribute:11 relatedBy:0 toItem:v28 attribute:12 multiplier:1.0 constant:v31];

  [v6 addObject:v57];
  [v6 addObject:v56];
  [v6 addObjectsFromArray:v52];
  [v6 addObjectsFromArray:v51];
  [v6 addObject:v50];
  v33 = (void *)v32;
  [v6 addObject:v32];
  uint64_t v34 = (void *)MEMORY[0x263F08938];
  v35 = [(MSDCodeEntryContentViewController *)self codeEntryView];
  v36 = [(MSDCodeEntryContentViewController *)self view];
  v37 = [v34 constraintWithItem:v35 attribute:9 relatedBy:0 toItem:v36 attribute:9 multiplier:1.0 constant:0.0];

  v38 = (void *)MEMORY[0x263F08938];
  v39 = [(MSDCodeEntryContentViewController *)self codeEntryView];
  v40 = [(MSDCodeEntryContentViewController *)self promptLabel];
  [v29 scaledValueForValue:12.0];
  v42 = [v38 constraintWithItem:v39 attribute:3 relatedBy:0 toItem:v40 attribute:11 multiplier:1.0 constant:ceil(v41 - v8)];

  double v43 = (void *)MEMORY[0x263F08938];
  v44 = [(MSDCodeEntryContentViewController *)self codeEntryView];
  v45 = [(MSDCodeEntryContentViewController *)self view];
  [v29 scaledValueForValue:-32.0];
  v47 = [v43 constraintWithItem:v44 attribute:4 relatedBy:0 toItem:v45 attribute:4 multiplier:1.0 constant:ceil(v46 - v10)];

  [v6 addObject:v37];
  [v6 addObject:v42];
  [v6 addObject:v47];
  [MEMORY[0x263F08938] activateConstraints:v6];
  v48 = (NSArray *)[v6 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v48;
}

- (void)didEnterCode:(id)a3 forEntry:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_23911B000, v8, OS_LOG_TYPE_DEFAULT, "User entered verification code: %{public}@", buf, 0xCu);
  }

  double v9 = [(MSDCodeEntryContentViewController *)self verificationCode];
  uint64_t v10 = [v6 isEqualToString:v9];

  uint64_t v11 = defaultLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v11, OS_LOG_TYPE_DEFAULT, "Verification successful", buf, 2u);
    }
  }
  else
  {
    if (v12)
    {
      id v13 = [(MSDCodeEntryContentViewController *)self verificationCode];
      *(_DWORD *)buf = 138543618;
      id v20 = v6;
      __int16 v21 = 2114;
      double v22 = v13;
      _os_log_impl(&dword_23911B000, v11, OS_LOG_TYPE_DEFAULT, "Entered code: %{public}@ is not expected code: %{public}@", buf, 0x16u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__MSDCodeEntryContentViewController_didEnterCode_forEntry___block_invoke;
    v16[3] = &unk_264D882F0;
    double v17 = v7;
    id v18 = self;
    dispatch_async(MEMORY[0x263EF83A0], v16);
    uint64_t v11 = v17;
  }

  id v14 = [(MSDCodeEntryContentViewController *)self delegate];
  id v15 = [(MSDCodeEntryContentViewController *)self verificationCode];
  [v14 didCompleteVerification:v10 forCode:v15];
}

void __59__MSDCodeEntryContentViewController_didEnterCode_forEntry___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearEntry];
  [*(id *)(a1 + 32) jiggleAView];
  v2 = [*(id *)(a1 + 40) errorMessage];
  v3 = [*(id *)(a1 + 40) promptLabel];
  [v3 setText:v2];

  id v5 = [MEMORY[0x263F1C550] redColor];
  double v4 = [*(id *)(a1 + 40) promptLabel];
  [v4 setColor:v5];
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (MSDCodeEntryView)codeEntryView
{
  return self->_codeEntryView;
}

- (void)setCodeEntryView:(id)a3
{
}

- (MSDCodeEntryContentViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_codeEntryView, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
}

@end