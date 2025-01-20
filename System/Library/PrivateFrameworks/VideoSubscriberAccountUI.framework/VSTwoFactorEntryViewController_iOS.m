@interface VSTwoFactorEntryViewController_iOS
- (BOOL)isCancellationAllowed;
- (CGSize)preferredLogoSize;
- (NSArray)buttons;
- (UIBarButtonItem)verifyButton;
- (UIScrollView)scrollView;
- (VSAuthenticationViewControllerDelegate)delegate;
- (VSFontCenter)fontCenter;
- (VSIdentityProviderLogoView)logoView;
- (VSTwoFactorDigitView)digitView;
- (VSTwoFactorEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (VSTwoFactorEntryViewModel)viewModel;
- (void)buttonPressed:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitView:(id)a3;
- (void)setFontCenter:(id)a3;
- (void)setLogoView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setVerifyButton:(id)a3;
- (void)setViewModel:(id)a3;
- (void)startObservingViewModel:(id)a3;
- (void)stopObservingViewModel:(id)a3;
- (void)twoFactorDigitView:(id)a3 textDidChange:(id)a4;
- (void)verifyButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSTwoFactorEntryViewController_iOS

- (VSTwoFactorEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  v4 = [(VSTwoFactorEntryViewController_iOS *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[VSFontCenter alloc] initWithTraitEnvironment:v4];
    fontCenter = v4->_fontCenter;
    v4->_fontCenter = v5;
  }
  return v4;
}

- (void)dealloc
{
  [(VSTwoFactorEntryViewController_iOS *)self stopObservingViewModel:self->_viewModel];
  v3.receiver = self;
  v3.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v3 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  v124.receiver = self;
  v124.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v124 viewDidLoad];
  objc_super v3 = [(VSTwoFactorEntryViewController_iOS *)self view];
  id v4 = objc_alloc_init(MEMORY[0x263F1C940]);
  [(VSTwoFactorEntryViewController_iOS *)self setScrollView:v4];
  [v4 setDelegate:self];
  [v4 setAlwaysBounceVertical:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x263F1C550] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  v115 = v3;
  [v3 addSubview:v4];
  v6 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
  v7 = [v6 title];
  [(VSTwoFactorEntryViewController_iOS *)self setTitle:v7];

  objc_super v8 = objc_alloc_init(VSIdentityProviderLogoView);
  [(VSIdentityProviderLogoView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [v6 logo];
  [(VSIdentityProviderLogoView *)v8 setLogo:v9];

  [v4 addSubview:v8];
  v111 = v8;
  [(VSTwoFactorEntryViewController_iOS *)self setLogoView:v8];
  id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [v6 headerText];
  [v10 setText:v11];

  [v10 setNumberOfLines:0];
  [v10 setTextAlignment:1];
  fontCenter = self->_fontCenter;
  v13 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v10, "vs_bind:toObject:withKeyPath:options:", @"font", fontCenter, @"title2Font", v13);

  v110 = v10;
  [v4 addSubview:v10];
  id v14 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [v6 message];
  [v14 setText:v15];

  [v14 setNumberOfLines:0];
  [v14 setTextAlignment:1];
  v16 = self->_fontCenter;
  v17 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", @"font", v16, @"subheadlineFont", v17);

  v109 = v14;
  [v4 addSubview:v14];
  v18 = [VSTwoFactorDigitView alloc];
  v19 = [v6 twoFactorTextField];
  v20 = -[VSTwoFactorDigitView initWithDigitCount:](v18, "initWithDigitCount:", [v19 expectedLength]);

  [(VSTwoFactorEntryViewController_iOS *)self setDigitView:v20];
  v114 = self;
  [(VSTwoFactorDigitView *)v20 setDelegate:self];
  [(VSTwoFactorDigitView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [v6 twoFactorTextField];
  -[VSTwoFactorDigitView setKeyboardType:](v20, "setKeyboardType:", [v21 keyboardType]);

  v22 = [v6 twoFactorTextField];
  -[VSTwoFactorDigitView setAutocapitalizationType:](v20, "setAutocapitalizationType:", [v22 autocapitalizationType]);

  v107 = v4;
  v112 = v20;
  [v4 addSubview:v20];
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v108 = v6;
  v24 = [v6 buttons];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v120 objects:v127 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v121 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        v30 = objc_alloc_init(VSMultilineButton);
        v31 = [MEMORY[0x263F1C550] whiteColor];
        [(VSMultilineButton *)v30 setTitleColor:v31 forState:1];

        v32 = [v29 text];
        [(VSMultilineButton *)v30 setTitle:v32 forState:0];

        v33 = [(VSMultilineButton *)v30 titleLabel];
        [v33 setTextAlignment:1];

        v34 = [(VSMultilineButton *)v30 titleLabel];
        [v34 setNumberOfLines:0];

        [(VSMultilineButton *)v30 addTarget:v114 action:sel_buttonPressed_ forControlEvents:64];
        [v23 addObject:v30];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v120 objects:v127 count:16];
    }
    while (v26);
  }

  [(VSTwoFactorEntryViewController_iOS *)v114 setButtons:v23];
  v35 = [v107 topAnchor];
  v36 = [v115 topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [v107 bottomAnchor];
  v39 = [v115 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [v107 leftAnchor];
  v42 = [v115 leftAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [v107 rightAnchor];
  v45 = [v115 rightAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(VSIdentityProviderLogoView *)v111 topAnchor];
  v48 = [v107 topAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:10.0];
  [v49 setActive:1];

  v50 = [(VSIdentityProviderLogoView *)v111 centerXAnchor];
  v51 = [v107 centerXAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [v110 topAnchor];
  v54 = [(VSIdentityProviderLogoView *)v111 bottomAnchor];
  v55 = [v53 constraintEqualToAnchor:v54 constant:15.0];
  [v55 setActive:1];

  v56 = [v110 leftAnchor];
  v57 = [v107 safeAreaLayoutGuide];
  v58 = [v57 leftAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  [v59 setActive:1];

  v60 = [v110 rightAnchor];
  v61 = [v107 safeAreaLayoutGuide];
  v62 = [v61 rightAnchor];
  v63 = [v60 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  v64 = [v109 topAnchor];
  v65 = [v110 bottomAnchor];
  v66 = [v64 constraintEqualToAnchor:v65 constant:10.0];
  [v66 setActive:1];

  v67 = [v109 leftAnchor];
  v68 = [v107 safeAreaLayoutGuide];
  v69 = [v68 leftAnchor];
  v70 = [v67 constraintEqualToAnchor:v69];
  [v70 setActive:1];

  v71 = [v109 rightAnchor];
  v72 = [v107 safeAreaLayoutGuide];
  v73 = [v72 rightAnchor];
  v74 = [v71 constraintEqualToAnchor:v73];
  [v74 setActive:1];

  v75 = [(VSTwoFactorDigitView *)v20 topAnchor];
  v76 = [v109 bottomAnchor];
  v77 = [v75 constraintEqualToAnchor:v76 constant:10.0];
  [v77 setActive:1];

  v78 = [(VSTwoFactorDigitView *)v20 heightAnchor];
  v79 = [v78 constraintEqualToConstant:50.0];
  [v79 setActive:1];

  v80 = [(VSTwoFactorDigitView *)v20 centerXAnchor];
  v81 = [v107 centerXAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  [v82 setActive:1];

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v23;
  uint64_t v83 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    id v85 = 0;
    uint64_t v86 = *(void *)v117;
    do
    {
      uint64_t v87 = 0;
      v88 = v85;
      do
      {
        if (*(void *)v117 != v86) {
          objc_enumerationMutation(obj);
        }
        v89 = *(void **)(*((void *)&v116 + 1) + 8 * v87);
        [v89 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v115 addSubview:v89];
        v90 = [v89 centerXAnchor];
        v91 = [v107 centerXAnchor];
        v92 = [v90 constraintEqualToAnchor:v91];
        [v92 setActive:1];

        v93 = [v89 leftAnchor];
        v94 = [v107 safeAreaLayoutGuide];
        v95 = [v94 leftAnchor];
        v96 = [v93 constraintGreaterThanOrEqualToAnchor:v95];
        [v96 setActive:1];

        v97 = [v89 rightAnchor];
        v98 = [v107 safeAreaLayoutGuide];
        v99 = [v98 rightAnchor];
        v100 = [v97 constraintLessThanOrEqualToAnchor:v99];
        [v100 setActive:1];

        v101 = [v89 topAnchor];
        if (v88)
        {
          v102 = [v88 bottomAnchor];
          double v103 = 10.0;
        }
        else
        {
          v102 = [(VSTwoFactorDigitView *)v112 bottomAnchor];
          double v103 = 20.0;
        }
        v104 = [v101 constraintEqualToAnchor:v102 constant:v103];
        [v104 setActive:1];

        id v85 = v89;
        ++v87;
        v88 = v85;
      }
      while (v84 != v87);
      uint64_t v84 = [obj countByEnumeratingWithState:&v116 objects:v126 count:16];
    }
    while (v84);
  }
  else
  {
    id v85 = 0;
  }

  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:2];
  id v106 = (id)[(VSTwoFactorEntryViewController_iOS *)v114 registerForTraitChanges:v105 withHandler:&__block_literal_global_8];

  VSAuthenticationViewControllerViewDidLoad(v114);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v4 viewWillAppear:a3];
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v9 viewDidAppear:a3];
  objc_super v4 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
  v5 = [v4 twoFactorTextField];
  int v6 = [v5 autoShowKeyboard];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__VSTwoFactorEntryViewController_iOS_viewDidAppear___block_invoke;
    block[3] = &unk_265076A18;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x263EF83A0], block);
  }
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v4 viewWillDisappear:a3];
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  [(VSTwoFactorEntryViewController_iOS *)&v4 viewDidDisappear:a3];
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)verifyButtonPressed:(id)a3
{
  id v3 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
  [v3 setValidationState:1];
}

- (void)buttonPressed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    dispatch_time_t v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"Unexpectedly, sender was %@, instead of VSMultilineButton.", v8 format];
  }
  id v9 = v4;
  id v10 = [(VSTwoFactorEntryViewController_iOS *)self buttons];
  uint64_t v11 = [v10 indexOfObject:v9];

  v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v11;
    _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Generic two factor button with index %lu pressed.", buf, 0xCu);
  }

  v13 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
  [v13 buttonAtIndexWasPressed:v11];
}

- (void)startObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_LogoImage;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"logo" options:4 context:v4];
  [v5 addObserver:self forKeyPath:@"beginValidationButtonEnabled" options:4 context:kVSKeyValueObservingContext_VerifyButton];
  [v5 addObserver:self forKeyPath:@"validationState" options:3 context:kVSKeyValueObservingContext_ValidationState];
  [v5 addObserver:self forKeyPath:@"twoFactorTextField.text" options:3 context:kVSKeyValueObservingContext_TwoFactorCode];
}

- (void)stopObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_LogoImage;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"logo" context:v4];
  [v5 removeObserver:self forKeyPath:@"beginValidationButtonEnabled" context:kVSKeyValueObservingContext_VerifyButton];
  [v5 removeObserver:self forKeyPath:@"validationState" context:kVSKeyValueObservingContext_ValidationState];
  [v5 removeObserver:self forKeyPath:@"twoFactorTextField.text" context:kVSKeyValueObservingContext_TwoFactorCode];
}

- (void)setViewModel:(id)a3
{
  objc_super v8 = (VSTwoFactorEntryViewModel *)a3;
  if (self->_viewModel != v8)
  {
    -[VSTwoFactorEntryViewController_iOS stopObservingViewModel:](self, "stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    id v5 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v6 = [(VSCuratedViewModel *)v8 beginValidationButtonTitle];
    dispatch_time_t v7 = (void *)[v5 initWithTitle:v6 style:0 target:self action:sel_verifyButtonPressed_];

    [v7 setEnabled:0];
    [(VSTwoFactorEntryViewController_iOS *)self setVerifyButton:v7];
    [(VSTwoFactorEntryViewController_iOS *)self startObservingViewModel:v8];
  }
}

- (CGSize)preferredLogoSize
{
  v2 = [(VSTwoFactorEntryViewController_iOS *)self logoView];
  [v2 preferredImageSize];
  double v4 = v3;
  double v6 = v5;

  dispatch_time_t v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = v8;

  double v10 = v6 * v9;
  double v11 = v4 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)kVSKeyValueObservingContext_LogoImage == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF4A0];
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v14 raise:v15, @"Unexpectedly, objectOrNil was %@, instead of VSTwoFactorEntryViewModel.", v17 format];
    }
    id v18 = v11;
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The keyPathOrNil parameter must not be nil."];
    }
    v19 = [v18 valueForKeyPath:v10];
    v20 = [(VSTwoFactorEntryViewController_iOS *)self logoView];
    [v20 setLogo:v19];

    goto LABEL_12;
  }
  if ((void *)kVSKeyValueObservingContext_VerifyButton == a6)
  {
    id v18 = [(VSTwoFactorEntryViewController_iOS *)self verifyButton];
    v21 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
    objc_msgSend(v18, "setEnabled:", objc_msgSend(v21, "isBeginValidationButtonEnabled"));

LABEL_12:
    goto LABEL_13;
  }
  if ((void *)kVSKeyValueObservingContext_ValidationState == a6)
  {
    v22 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    [v22 unsignedIntegerValue];

    id v23 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v24 = [v23 unsignedIntegerValue];

    if (v24 == 2 || v24 == 1) {
      [(VSTwoFactorEntryViewController_iOS *)self resignFirstResponder];
    }
  }
  else if ((void *)kVSKeyValueObservingContext_TwoFactorCode != a6)
  {
    v25.receiver = self;
    v25.super_class = (Class)VSTwoFactorEntryViewController_iOS;
    [(VSTwoFactorEntryViewController_iOS *)&v25 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_13:
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(VSTwoFactorEntryViewController_iOS *)self digitView];
  [v3 resignFirstResponder];
}

- (void)twoFactorDigitView:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v7 = [(VSTwoFactorEntryViewController_iOS *)self viewModel];
  double v6 = [v7 twoFactorTextField];
  [v6 setText:v5];
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSAuthenticationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSTwoFactorEntryViewModel)viewModel
{
  return self->_viewModel;
}

- (UIBarButtonItem)verifyButton
{
  return self->_verifyButton;
}

- (void)setVerifyButton:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (VSTwoFactorDigitView)digitView
{
  return self->_digitView;
}

- (void)setDigitView:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_digitView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_verifyButton, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end