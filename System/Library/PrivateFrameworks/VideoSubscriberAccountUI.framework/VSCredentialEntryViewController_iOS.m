@interface VSCredentialEntryViewController_iOS
- (BOOL)isCancellationAllowed;
- (CGSize)preferredLogoSize;
- (Class)tableViewClass;
- (NSArray)buttons;
- (NSArray)fieldSpecifiers;
- (PSSpecifier)pickerButtonSpecifier;
- (PSSpecifier)pickerSpecifier;
- (UIButton)linkButton;
- (UIView)buttonView;
- (VSAuthenticationViewControllerDelegate)delegate;
- (VSCredentialEntryPicker)picker;
- (VSCredentialEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (VSCredentialEntryViewModel)viewModel;
- (VSIdentityProviderLogoView)logoView;
- (double)keyboardHeight;
- (id)_createSpecifierForField:(id)a3;
- (id)_credentialEntryFieldForSpecifier:(id)a3;
- (id)_linkURL;
- (id)_specifierForTextField:(id)a3;
- (id)_textFieldForSpecifier:(id)a3;
- (id)_textForSpecifier:(id)a3;
- (id)keyboardWillHideObserver;
- (id)keyboardWillShowObserver;
- (id)pickerTitle;
- (id)pickerViewCell:(id)a3 titleForRow:(int64_t)a4;
- (id)textFieldTextDidChangeObserver;
- (id)weakTarget;
- (int64_t)pickerViewCellInitialSelectedRow:(id)a3;
- (int64_t)pickerViewCellNumberOfRows:(id)a3;
- (void)_jsButtonTapped:(id)a3;
- (void)_linkButtonTapped:(id)a3;
- (void)_presentError:(id)a3;
- (void)_setText:(id)a3 forSpecifier:(id)a4;
- (void)_startObservingViewModel:(id)a3;
- (void)_startValidation;
- (void)_stopObservingViewModel:(id)a3;
- (void)_updateLinkButtonLayout;
- (void)buildButtonsIfNeeded;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)doneButtonPressed:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pickerButtonSelected;
- (void)pickerViewCell:(id)a3 didSelectRow:(int64_t)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setButtonView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldSpecifiers:(id)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setKeyboardWillHideObserver:(id)a3;
- (void)setKeyboardWillShowObserver:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setLogoView:(id)a3;
- (void)setPicker:(id)a3;
- (void)setPickerButtonSpecifier:(id)a3;
- (void)setPickerSpecifier:(id)a3;
- (void)setTextFieldTextDidChangeObserver:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setWeakTarget:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VSCredentialEntryViewController_iOS

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (VSCredentialEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VSCredentialEntryViewController_iOS;
  v8 = [(VSCredentialEntryViewController_iOS *)&v25 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F1E300]);
    [v9 setObject:v8];
    [(VSCredentialEntryViewController_iOS *)v8 setWeakTarget:v9];
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = [MEMORY[0x263F08A48] mainQueue];
    objc_initWeak(&location, v8);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke;
    v22[3] = &unk_265077D88;
    objc_copyWeak(&v23, &location);
    v12 = [v10 addObserverForName:*MEMORY[0x263F1D778] object:0 queue:v11 usingBlock:v22];
    objc_storeWeak(&v8->_textFieldTextDidChangeObserver, v12);

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_2;
    v20[3] = &unk_265077D88;
    objc_copyWeak(&v21, &location);
    v13 = [v10 addObserverForName:*MEMORY[0x263F1D488] object:0 queue:v11 usingBlock:v20];
    objc_storeWeak(&v8->_keyboardWillShowObserver, v13);

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_4;
    v18[3] = &unk_265077D88;
    objc_copyWeak(&v19, &location);
    v14 = [v10 addObserverForName:*MEMORY[0x263F1D480] object:0 queue:v11 usingBlock:v18];
    objc_storeWeak(&v8->_keyboardWillHideObserver, v14);

    v26[0] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    id v16 = (id)[(VSCredentialEntryViewController_iOS *)v8 registerForTraitChanges:v15 withHandler:&__block_literal_global_18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)dealloc
{
  [(VSCredentialEntryViewController_iOS *)self _stopObservingViewModel:self->_viewModel];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained(&self->_textFieldTextDidChangeObserver);
  if (WeakRetained) {
    [v3 removeObserver:WeakRetained];
  }
  id v5 = objc_loadWeakRetained(&self->_keyboardWillShowObserver);
  if (v5) {
    [v3 removeObserver:v5];
  }

  id v6 = objc_loadWeakRetained(&self->_keyboardWillHideObserver);
  if (v6) {
    [v3 removeObserver:v6];
  }

  v7.receiver = self;
  v7.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(ACUIViewController *)&v7 dealloc];
}

- (void)_presentError:(id)a3
{
  id v4 = a3;
  id v5 = VSErrorLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VSCredentialEntryViewController_iOS _presentError:]((uint64_t)v4, v5);
  }

  id v6 = VSAlertForError(v4, 0);
  [(VSCredentialEntryViewController_iOS *)self presentViewController:v6 animated:1 completion:0];
}

- (id)_specifierForTextField:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(ACUIViewController *)self specifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(VSCredentialEntryViewController_iOS *)self _textFieldForSpecifier:v10];
        if (v11 == v4)
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)_textFieldForSpecifier:(id)a3
{
  id v4 = [(VSCredentialEntryViewController_iOS *)self indexPathForSpecifier:a3];
  id v5 = [(VSCredentialEntryViewController_iOS *)self table];
  uint64_t v6 = [v5 cellForRowAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The cellOrNil parameter must not be nil."];
    }
    id v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263EFF940];
      uint64_t v9 = *MEMORY[0x263EFF4A0];
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      [v8 raise:v9, @"Unexpectedly, cell was %@, instead of PSEditableTableCell.", v11 format];
    }
    id v12 = [v7 textField];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_credentialEntryFieldForSpecifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  uint64_t v6 = [v5 credentialEntryFields];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 identifier];
        long long v14 = [v4 identifier];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          id v16 = v12;

          uint64_t v9 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_textForSpecifier:(id)a3
{
  v3 = [(VSCredentialEntryViewController_iOS *)self _credentialEntryFieldForSpecifier:a3];
  id v4 = [v3 text];

  return v4;
}

- (void)_setText:(id)a3 forSpecifier:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = &stru_26F361E90;
  if (v6) {
    uint64_t v7 = v6;
  }
  uint64_t v10 = v7;
  uint64_t v8 = [(VSCredentialEntryViewController_iOS *)self _credentialEntryFieldForSpecifier:a4];
  [v8 setText:v10];

  uint64_t v9 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  [v9 validateCredentialEntryFields];
}

- (id)_linkURL
{
  v2 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  v3 = [v2 linkURL];

  return v3;
}

- (void)_linkButtonTapped:(id)a3
{
  v3 = [(VSCredentialEntryViewController_iOS *)self _linkURL];
  if (v3)
  {
    id v4 = v3;
    VSOpenURL();
    v3 = v4;
  }
}

- (void)_jsButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(VSCredentialEntryViewController_iOS *)self buttons];
  uint64_t v6 = [v5 indexOfObject:v4];

  id v7 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  [v7 buttonTappedAtIndex:v6];
}

- (void)_startValidation
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self table];
  v2 = [v3 firstResponder];
  [v2 resignFirstResponder];
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_DoneButton;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"beginValidationButtonEnabled" options:4 context:v4];
  [v5 addObserver:self forKeyPath:@"logo" options:4 context:kVSKeyValueObservingContext_Image];
  [v5 addObserver:self forKeyPath:@"validationState" options:3 context:kVSKeyValueObservingContext_ValidationState_0];
  id v6 = [v5 picker];

  [v6 addObserver:self forKeyPath:@"selectedIndex" options:4 context:kVSKeyValueObservingContext_PickerSelectedItemIndex];
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_DoneButton;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"beginValidationButtonEnabled" context:v4];
  [v5 removeObserver:self forKeyPath:@"logo" context:kVSKeyValueObservingContext_Image];
  [v5 removeObserver:self forKeyPath:@"validationState" context:kVSKeyValueObservingContext_ValidationState_0];
  id v6 = [v5 picker];

  [v6 removeObserver:self forKeyPath:@"selectedIndex" context:kVSKeyValueObservingContext_PickerSelectedItemIndex];
}

- (id)_createSpecifierForField:(id)a3
{
  id v4 = a3;
  if ([v4 isSecure]) {
    uint64_t v5 = 12;
  }
  else {
    uint64_t v5 = 8;
  }
  id v6 = (void *)MEMORY[0x263F5FCA8];
  id v7 = [v4 title];
  uint64_t v8 = [(VSCredentialEntryViewController_iOS *)self weakTarget];
  uint64_t v9 = [v6 preferenceSpecifierNamed:v7 target:v8 set:sel__setText_forSpecifier_ get:sel__textForSpecifier_ detail:0 cell:v5 edit:0];

  if ([v4 isSecure])
  {
    uint64_t v10 = [NSNumber numberWithBool:1];
    [v9 setProperty:v10 forKey:*MEMORY[0x263F601F0]];
  }
  objc_msgSend(v9, "setKeyboardType:autoCaps:autoCorrection:", objc_msgSend(v4, "keyboardType"), objc_msgSend(v4, "autocapitalizationType"), objc_msgSend(v4, "autocorrectionType"));
  id v11 = [v4 placeholder];
  [v9 setPlaceholder:v11];

  return v9;
}

- (void)setViewModel:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = (VSCredentialEntryViewModel *)a3;
  if (self->_viewModel != v5)
  {
    -[VSCredentialEntryViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    id v6 = [(VSViewModel *)v5 title];
    [(VSCredentialEntryViewController_iOS *)self setTitle:v6];

    id v7 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v8 = [(VSCuratedViewModel *)v5 beginValidationButtonTitle];
    uint64_t v9 = (void *)[v7 initWithTitle:v8 style:0 target:self action:sel_doneButtonPressed_];

    [v9 setEnabled:0];
    [(ACUIViewController *)self setDoneButton:v9];
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = [(VSCredentialEntryViewModel *)v5 credentialEntryFields];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v17 = [(VSCredentialEntryViewController_iOS *)self _createSpecifierForField:v16];
          long long v18 = [v16 identifier];
          [v17 setIdentifier:v18];

          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }

    long long v19 = [(VSCredentialEntryViewModel *)v5 picker];

    if (v19)
    {
      long long v20 = [(VSCredentialEntryViewModel *)v5 picker];

      if (!v20) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [viewModel picker] parameter must not be nil."];
      }
      long long v21 = [(VSCredentialEntryViewModel *)v5 picker];
      [(VSCredentialEntryViewController_iOS *)self setPicker:v21];
      v22 = (void *)MEMORY[0x263F5FC40];
      uint64_t v23 = [(VSCredentialEntryViewController_iOS *)self pickerTitle];
      v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v24 setButtonAction:sel_pickerButtonSelected];
      [(VSCredentialEntryViewController_iOS *)self setPickerButtonSpecifier:v24];
      [v10 addObject:v24];
    }
    if ([(VSCuratedViewModel *)v5 showFooter])
    {
      objc_super v25 = [(VSCuratedViewModel *)v5 message];
      v26 = [(VSCredentialEntryViewModel *)v5 additionalMessage];
      v27 = v26;
      if (v25 && [v26 length])
      {
        id v28 = v25;
        if (!v27) {
          [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The additionalMessageOrNil parameter must not be nil."];
        }
        v41[0] = v28;
        v41[1] = v27;
        v29 = (void *)MEMORY[0x263EFF8C0];
        id v30 = v27;
        v31 = [v29 arrayWithObjects:v41 count:2];

        objc_super v25 = [v31 componentsJoinedByString:@"\n\n"];
      }
      v32 = [(VSCuratedViewModel *)v5 notice];
      v33 = [(VSCuratedViewModel *)v5 footerText];
      v34 = VSSpecifierForFooter(v25, v32, v33);
      [v10 addObject:v34];
    }
    [(VSCredentialEntryViewController_iOS *)self setSpecifiers:v10];
    v35 = [(VSCredentialEntryViewController_iOS *)self logoView];
    v36 = [(VSCuratedViewModel *)v5 logoAccessibilityLabel];
    [v35 setAccessibilityLabel:v36];

    [(VSCredentialEntryViewController_iOS *)self _startObservingViewModel:v5];
  }
}

- (void)buildButtonsIfNeeded
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  if (v3)
  {
    id v4 = [(VSCredentialEntryViewController_iOS *)self buttonView];
    [v4 removeFromSuperview];

    v72 = v3;
    id v5 = v3;
    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    uint64_t v8 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v7, *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v8 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    int v15 = [(VSCredentialEntryViewController_iOS *)self view];
    [v15 bounds];
    CGFloat Width = CGRectGetWidth(v86);

    double v69 = v12;
    double v70 = v10;
    v87.origin.double x = v10;
    v87.origin.y = v12;
    double v68 = Width;
    v87.size.width = Width;
    v87.size.double height = v14;
    double v17 = CGRectGetWidth(v87);
    [(VSCredentialEntryViewController_iOS *)self setButtons:MEMORY[0x263EFFA68]];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v71 = v5;
    obuint64_t j = [v5 buttons];
    uint64_t v18 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v80;
      double v74 = v17 + -40.0;
      double v21 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          uint64_t v23 = v8;
          if (*(void *)v80 != v20) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          objc_super v25 = objc_alloc_init(VSMultilineButton);
          v26 = [MEMORY[0x263F1C550] whiteColor];
          [(VSMultilineButton *)v25 setTitleColor:v26 forState:1];

          v27 = [v24 title];
          [(VSMultilineButton *)v25 setTitle:v27 forState:0];

          id v28 = [(VSMultilineButton *)v25 titleLabel];
          [v28 setTextAlignment:1];

          v29 = [(VSMultilineButton *)v25 titleLabel];
          [v29 setNumberOfLines:0];

          [(VSMultilineButton *)v25 addTarget:self action:sel__jsButtonTapped_ forControlEvents:64];
          -[VSMultilineButton sizeThatFits:](v25, "sizeThatFits:", v74, 1.79769313e308);
          double v31 = v30 + 20.0;
          double v33 = v32 + 10.0;
          double v34 = v17;
          *(float *)&double v30 = v17 - (v30 + 20.0);
          double v35 = floorf(*(float *)&v30 * 0.5);
          -[VSMultilineButton setFrame:](v25, "setFrame:", v35, v7, v31, v32 + 10.0);
          v36 = [(VSCredentialEntryViewController_iOS *)self buttons];
          long long v37 = (void *)[v36 mutableCopy];
          long long v38 = v37;
          if (v37)
          {
            id v39 = v37;
          }
          else
          {
            id v39 = [MEMORY[0x263EFF980] array];
          }
          long long v40 = v39;

          [v40 addObject:v25];
          v41 = (void *)[v40 copy];
          [(VSCredentialEntryViewController_iOS *)self setButtons:v41];

          uint64_t v8 = v23;
          [v23 addSubview:v25];
          v88.origin.double x = v35;
          v88.origin.y = v7;
          v88.size.width = v31;
          v88.size.double height = v33;
          double v21 = v21 + CGRectGetHeight(v88) + 20.0;

          double v17 = v34;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v19);
    }
    else
    {
      double v21 = 0.0;
    }

    v42 = [v71 linkURL];

    if (v42)
    {
      uint64_t v43 = objc_alloc_init(VSMultilineButton);
      v44 = [MEMORY[0x263F1C550] whiteColor];
      [(VSMultilineButton *)v43 setTitleColor:v44 forState:1];

      v45 = [v71 linkTitle];
      [(VSMultilineButton *)v43 setTitle:v45 forState:0];

      v46 = [(VSMultilineButton *)v43 titleLabel];
      [v46 setNumberOfLines:0];

      v47 = [(VSMultilineButton *)v43 titleLabel];
      [v47 setTextAlignment:1];

      [(VSMultilineButton *)v43 addTarget:self action:sel__linkButtonTapped_ forControlEvents:64];
      -[VSMultilineButton sizeThatFits:](v43, "sizeThatFits:", v17 + -40.0, 1.79769313e308);
      CGFloat v49 = v48 + 20.0;
      CGFloat v51 = v50 + 10.0;
      *(float *)&double v48 = v17 - (v48 + 20.0);
      CGFloat v52 = floorf(*(float *)&v48 * 0.5);
      -[VSMultilineButton setFrame:](v43, "setFrame:", v52, v7, v49, v50 + 10.0);
      [(VSCredentialEntryViewController_iOS *)self setLinkButton:v43];
      [v8 addSubview:v43];
      v89.origin.double x = v52;
      v89.origin.y = v7;
      v89.size.width = v49;
      v89.size.double height = v51;
      double v21 = v21 + CGRectGetHeight(v89) + 20.0;
    }
    objc_msgSend(v8, "setFrame:", v70, v69, v68, v21);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v53 = [(VSCredentialEntryViewController_iOS *)self linkButton];
    v54 = [(VSCredentialEntryViewController_iOS *)self buttons];
    if (v53)
    {
      v55 = [(VSCredentialEntryViewController_iOS *)self linkButton];
      uint64_t v56 = [v54 arrayByAddingObject:v55];

      v54 = (void *)v56;
    }

    uint64_t v57 = [v54 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v76;
      double v60 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v76 != v59) {
            objc_enumerationMutation(v54);
          }
          v62 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          [v62 frame];
          double x = v90.origin.x;
          double v64 = v90.size.width;
          double height = v90.size.height;
          double v66 = v60 + 20.0;
          v90.origin.y = v60 + 20.0;
          double v60 = v60 + 20.0 + CGRectGetHeight(v90);
          objc_msgSend(v62, "setFrame:", x, v66, v64, height);
        }
        uint64_t v58 = [v54 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v58);
    }

    [(VSCredentialEntryViewController_iOS *)self setButtonView:v8];
    v67 = [(VSCredentialEntryViewController_iOS *)self view];
    [v67 addSubview:v8];

    id v3 = v72;
  }
}

- (void)pickerButtonSelected
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self pickerSpecifier];

  if (v3)
  {
    id v4 = [(ACUIViewController *)self specifiers];
    id v5 = (void *)[v4 mutableCopy];

    id v6 = [(VSCredentialEntryViewController_iOS *)self pickerSpecifier];

    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self pickerSpecifier] parameter must not be nil."];
    }
    double v7 = [(VSCredentialEntryViewController_iOS *)self pickerSpecifier];
    [v5 removeObject:v7];

    [(VSCredentialEntryViewController_iOS *)self setPickerSpecifier:0];
    [(VSCredentialEntryViewController_iOS *)self setSpecifiers:v5];
  }
  else
  {
    id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F361E90 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [v5 setIdentifier:@"TIME_PICKER"];
    uint64_t v8 = NSNumber;
    +[VSPSPickerTableViewCell preferredHeight];
    double v9 = objc_msgSend(v8, "numberWithDouble:");
    [v5 setProperty:v9 forKey:*MEMORY[0x263F602A8]];

    [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(VSCredentialEntryViewController_iOS *)self setPickerSpecifier:v5];
    CGFloat v10 = [(ACUIViewController *)self specifiers];
    double v11 = (void *)[v10 mutableCopy];

    CGFloat v12 = [(VSCredentialEntryViewController_iOS *)self pickerButtonSpecifier];
    objc_msgSend(v11, "ps_insertObject:afterObject:", v5, v12);

    [(VSCredentialEntryViewController_iOS *)self setSpecifiers:v11];
  }

  [(VSCredentialEntryViewController_iOS *)self _updateLinkButtonLayout];
}

- (id)pickerTitle
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self picker];

  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self picker] parameter must not be nil."];
  }
  id v4 = [(VSCredentialEntryViewController_iOS *)self picker];
  id v5 = [v4 title];
  id v6 = NSString;
  double v7 = [(VSCredentialEntryViewController_iOS *)self picker];
  uint64_t v8 = [v7 pickerItemAtCurrentIndex];
  double v9 = [v8 itemName];
  CGFloat v10 = [v6 stringWithFormat:@"%@ %@", v5, v9];

  return v10;
}

- (id)pickerViewCell:(id)a3 titleForRow:(int64_t)a4
{
  id v6 = [(VSCredentialEntryViewController_iOS *)self picker];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self picker] parameter must not be nil."];
  }
  double v7 = [(VSCredentialEntryViewController_iOS *)self picker];
  uint64_t v8 = [v7 pickerItems];
  double v9 = [v8 objectAtIndex:a4];
  CGFloat v10 = [v9 itemName];

  return v10;
}

- (int64_t)pickerViewCellInitialSelectedRow:(id)a3
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self picker];
  int64_t v4 = [v3 selectedIndex];

  return v4;
}

- (int64_t)pickerViewCellNumberOfRows:(id)a3
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self picker];
  int64_t v4 = [v3 pickerItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)pickerViewCell:(id)a3 didSelectRow:(int64_t)a4
{
  id v6 = [(VSCredentialEntryViewController_iOS *)self picker];
  [v6 setSelectedIndex:a4];

  double v7 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  [v7 pickerDidSelectRow:a4];

  uint64_t v8 = [(VSCredentialEntryViewController_iOS *)self pickerButtonSpecifier];
  double v9 = [(VSCredentialEntryViewController_iOS *)self pickerTitle];
  [v8 setName:v9];

  CGFloat v10 = [(VSCredentialEntryViewController_iOS *)self pickerButtonSpecifier];
  [(VSCredentialEntryViewController_iOS *)self reloadSpecifier:v10];

  [(VSCredentialEntryViewController_iOS *)self _updateLinkButtonLayout];
}

- (CGSize)preferredLogoSize
{
  v2 = [(VSCredentialEntryViewController_iOS *)self logoView];
  [v2 preferredImageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = v8;

  double v10 = v6 * v9;
  double v11 = v4 * v9;
  result.double height = v10;
  result.width = v11;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = v12;
  if ((void *)kVSKeyValueObservingContext_DoneButton == a6)
  {
    id v14 = [(ACUIViewController *)self doneButton];
    int v15 = [(VSCredentialEntryViewController_iOS *)self viewModel];
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v15, "isBeginValidationButtonEnabled"));

LABEL_14:
    goto LABEL_15;
  }
  if ((void *)kVSKeyValueObservingContext_Image == a6)
  {
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The objectOrNil parameter must not be nil."];
    }
    id v16 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v17 = (void *)MEMORY[0x263EFF940];
      uint64_t v18 = *MEMORY[0x263EFF4A0];
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      [v17 raise:v18, @"Unexpectedly, object was %@, instead of VSCredentialEntryViewModel.", v20 format];
    }
    id v14 = v16;
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The keyPathOrNil parameter must not be nil."];
    }
    double v21 = [v14 valueForKeyPath:v10];
    v22 = [(VSCredentialEntryViewController_iOS *)self logoView];
    [v22 setLogo:v21];

    goto LABEL_14;
  }
  if ((void *)kVSKeyValueObservingContext_ValidationState_0 == a6)
  {
    uint64_t v23 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    uint64_t v24 = [v23 unsignedIntegerValue];

    objc_super v25 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v26 = [v25 unsignedIntegerValue];

    v27 = VSDefaultLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v35 = v24;
      __int16 v36 = 2048;
      uint64_t v37 = v26;
      _os_log_impl(&dword_23F9AB000, v27, OS_LOG_TYPE_DEFAULT, "credential entry controller validation state changed from %lu to %lu", buf, 0x16u);
    }

    if (v26 != 3)
    {
      if (v26 == 2)
      {
        if (v24) {
          goto LABEL_15;
        }
      }
      else if (v26 != 1)
      {
        goto LABEL_15;
      }
      [(VSCredentialEntryViewController_iOS *)self _startValidation];
      goto LABEL_15;
    }
    if (v24 == 2) {
      [(ACUIViewController *)self setCellsChecked:1];
    }
  }
  else if ((void *)kVSKeyValueObservingContext_PickerSelectedItemIndex == a6)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    double v31 = __86__VSCredentialEntryViewController_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke;
    double v32 = &unk_265076A18;
    double v33 = self;
    VSPerformBlockOnMainThread();
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VSCredentialEntryViewController_iOS;
    [(VSCredentialEntryViewController_iOS *)&v28 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_15:
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v4 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = objc_msgSend(v4, "credentialEntryFields", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setText:&stru_26F361E90];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(VSCredentialEntryViewController_iOS *)self delegate];
  [v10 authenticationViewControllerDidCancel:self];
}

- (void)doneButtonPressed:(id)a3
{
  id v3 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  [v3 setValidationState:1];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(ACUIViewController *)&v11 viewDidLoad];
  id v3 = [(VSCredentialEntryViewController_iOS *)self table];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [(VSCredentialEntryViewController_iOS *)self table];
    [v4 setViewController:self];
  }
  [v3 setPreservesSuperviewLayoutMargins:1];
  double v5 = [VSIdentityProviderLogoView alloc];
  [v3 bounds];
  uint64_t v6 = -[VSIdentityProviderLogoView initWithFrame:](v5, "initWithFrame:");
  uint64_t v7 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  uint64_t v8 = [v7 logo];
  [(VSIdentityProviderLogoView *)v6 setLogo:v8];

  uint64_t v9 = [(VSCredentialEntryViewController_iOS *)self viewModel];
  id v10 = [v9 logoAccessibilityLabel];
  [(VSIdentityProviderLogoView *)v6 setAccessibilityLabel:v10];

  [(VSCredentialEntryViewController_iOS *)self setLogoView:v6];
  [(VSIdentityProviderLogoView *)v6 sizeToFit];
  [v3 setTableHeaderView:v6];
  VSAuthenticationViewControllerViewDidLoad(self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(VSCredentialEntryViewController_iOS *)&v4 viewWillAppear:a3];
  [(VSCredentialEntryViewController_iOS *)self buildButtonsIfNeeded];
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(VSCredentialEntryViewController_iOS *)&v4 viewDidAppear:a3];
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(VSCredentialEntryViewController_iOS *)&v4 viewWillDisappear:a3];
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(VSCredentialEntryViewController_iOS *)&v4 viewDidDisappear:a3];
  VSAuthenticationViewControllerViewDidDisappear(self);
}

- (void)_updateLinkButtonLayout
{
  id v36 = [(VSCredentialEntryViewController_iOS *)self view];
  [v36 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VSCredentialEntryViewController_iOS *)self keyboardHeight];
  double v12 = v11;
  long long v13 = [(VSCredentialEntryViewController_iOS *)self buttonView];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v38.origin.double x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.double height = v10;
  double v20 = CGRectGetMaxY(v38) - v12 - v19 + -20.0;
  double v21 = [(VSCredentialEntryViewController_iOS *)self table];
  [v21 contentSize];
  double v23 = v22;
  [v21 contentOffset];
  double v25 = v24;
  uint64_t v26 = [(VSCredentialEntryViewController_iOS *)self view];
  [v21 bounds];
  objc_msgSend(v26, "convertRect:fromView:", v21);
  double v28 = v27;

  if (v23 + v28 - v25 + 10.0 <= v20) {
    double v29 = v20;
  }
  else {
    double v29 = v23 + v28 - v25 + 10.0;
  }
  [v21 contentInset];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  objc_msgSend(v13, "setFrame:", v15, v29, v17, v19);
  objc_msgSend(v21, "setContentInset:", v31, v33, v12 + v19 + 40.0, v35);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VSCredentialEntryViewController_iOS;
  [(VSCredentialEntryViewController_iOS *)&v3 viewDidLayoutSubviews];
  [(VSCredentialEntryViewController_iOS *)self _updateLinkButtonLayout];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F23160] instancesRespondToSelector:a2])
  {
    v6.receiver = self;
    v6.super_class = (Class)VSCredentialEntryViewController_iOS;
    [(VSCredentialEntryViewController_iOS *)&v6 scrollViewDidScroll:v5];
  }
  [(VSCredentialEntryViewController_iOS *)self _updateLinkButtonLayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(VSCredentialEntryViewController_iOS *)self buttonView];
  objc_super v6 = [v5 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 frame];
        float v13 = width - v12;
        [v11 setFrame:floorf(v13 * 0.5)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (VSCredentialEntryViewModel)viewModel
{
  return self->_viewModel;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (NSArray)fieldSpecifiers
{
  return self->_fieldSpecifiers;
}

- (void)setFieldSpecifiers:(id)a3
{
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (id)textFieldTextDidChangeObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_textFieldTextDidChangeObserver);
  return WeakRetained;
}

- (void)setTextFieldTextDidChangeObserver:(id)a3
{
}

- (id)keyboardWillShowObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_keyboardWillShowObserver);
  return WeakRetained;
}

- (void)setKeyboardWillShowObserver:(id)a3
{
}

- (id)keyboardWillHideObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_keyboardWillHideObserver);
  return WeakRetained;
}

- (void)setKeyboardWillHideObserver:(id)a3
{
}

- (id)weakTarget
{
  return self->_weakTarget;
}

- (void)setWeakTarget:(id)a3
{
}

- (PSSpecifier)pickerButtonSpecifier
{
  return self->_pickerButtonSpecifier;
}

- (void)setPickerButtonSpecifier:(id)a3
{
}

- (PSSpecifier)pickerSpecifier
{
  return self->_pickerSpecifier;
}

- (void)setPickerSpecifier:(id)a3
{
}

- (VSCredentialEntryPicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_pickerSpecifier, 0);
  objc_storeStrong((id *)&self->_pickerButtonSpecifier, 0);
  objc_storeStrong(&self->_weakTarget, 0);
  objc_destroyWeak(&self->_keyboardWillHideObserver);
  objc_destroyWeak(&self->_keyboardWillShowObserver);
  objc_destroyWeak(&self->_textFieldTextDidChangeObserver);
  objc_storeStrong((id *)&self->_fieldSpecifiers, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_presentError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Will present error: %@", (uint8_t *)&v2, 0xCu);
}

@end