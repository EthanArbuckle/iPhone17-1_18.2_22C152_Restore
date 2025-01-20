@interface VSAutoAuthenticationViewController_iOS
- (BOOL)isCancellationAllowed;
- (CGSize)preferredLogoSize;
- (UIButton)manualSignInButton;
- (UILabel)accountNameLabel;
- (UILabel)footerLabel;
- (UILabel)manualSignInTitleLabel;
- (UILabel)messageLabel;
- (UILabel)messageTitleLabel;
- (UILabel)noticeLabel;
- (UIScrollView)scrollView;
- (VSAuthenticationViewControllerDelegate)delegate;
- (VSAutoAuthenticationViewController_iOS)initWithCoder:(id)a3;
- (VSAutoAuthenticationViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (VSAutoAuthenticationViewModel)viewModel;
- (VSFontCenter)fontCenter;
- (VSIdentityProviderLogoView)logoView;
- (void)_manualSignInButtonPressed:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccountNameLabel:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFontCenter:(id)a3;
- (void)setFooterLabel:(id)a3;
- (void)setLogoView:(id)a3;
- (void)setManualSignInButton:(id)a3;
- (void)setManualSignInTitleLabel:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageTitleLabel:(id)a3;
- (void)setNoticeLabel:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setViewModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSAutoAuthenticationViewController_iOS

- (VSAutoAuthenticationViewController_iOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  v3 = [(VSAutoAuthenticationViewController_iOS *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit_5(v3);
  }
  return v4;
}

- (VSAutoAuthenticationViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  v4 = [(VSAutoAuthenticationViewController_iOS *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    commonInit_5(v4);
  }
  return v5;
}

- (void)dealloc
{
  [(VSAutoAuthenticationViewController_iOS *)self _stopObservingViewModel:self->_viewModel];
  v3.receiver = self;
  v3.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v3 dealloc];
}

- (void)_startObservingViewModel:(id)a3
{
}

- (void)_stopObservingViewModel:(id)a3
{
}

- (void)_manualSignInButtonPressed:(id)a3
{
  id v3 = [(VSAutoAuthenticationViewController_iOS *)self viewModel];
  [v3 didSelectManualSignInButton];
}

- (void)setViewModel:(id)a3
{
  objc_super v7 = (VSAutoAuthenticationViewModel *)a3;
  if (self->_viewModel != v7)
  {
    -[VSAutoAuthenticationViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    v5 = [(VSAutoAuthenticationViewController_iOS *)self logoView];
    objc_super v6 = [(VSCuratedViewModel *)v7 logoAccessibilityLabel];
    [v5 setAccessibilityLabel:v6];

    [(VSAutoAuthenticationViewController_iOS *)self _startObservingViewModel:self->_viewModel];
  }
}

- (CGSize)preferredLogoSize
{
  v2 = [(VSAutoAuthenticationViewController_iOS *)self logoView];
  [v2 preferredImageSize];
  double v4 = v3;
  double v6 = v5;

  objc_super v7 = [MEMORY[0x263F1C920] mainScreen];
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
  if ((void *)kVSKeyValueObservingContext_ViewModelImage == a6)
  {
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The objectOrNil parameter must not be nil."];
    }
    id v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF4A0];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v14 raise:v15, @"Unexpectedly, object was %@, instead of VSAutoAuthenticationViewModel.", v17 format];
    }
    id v18 = v13;
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The keyPathOrNil parameter must not be nil."];
    }
    v19 = [v18 valueForKeyPath:v10];
    v20 = [(VSAutoAuthenticationViewController_iOS *)self logoView];
    [v20 setLogo:v19];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)VSAutoAuthenticationViewController_iOS;
    [(VSAutoAuthenticationViewController_iOS *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)viewDidLoad
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  v98.receiver = self;
  v98.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v98 viewDidLoad];
  v90 = [(VSAutoAuthenticationViewController_iOS *)self view];
  id v3 = objc_alloc_init(MEMORY[0x263F1C940]);
  [(VSAutoAuthenticationViewController_iOS *)self setScrollView:v3];
  [v3 setAlwaysBounceVertical:1];
  double v4 = [MEMORY[0x263F1C550] groupTableViewBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v90 addSubview:v3];
  double v5 = [(VSAutoAuthenticationViewController_iOS *)self viewModel];
  double v6 = [v5 title];
  [(VSAutoAuthenticationViewController_iOS *)self setTitle:v6];

  objc_super v7 = objc_alloc_init(VSIdentityProviderLogoView);
  double v8 = [v5 logo];
  [(VSIdentityProviderLogoView *)v7 setLogo:v8];

  [(VSAutoAuthenticationViewController_iOS *)self setLogoView:v7];
  double v9 = [(VSAutoAuthenticationViewController_iOS *)self fontCenter];
  id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
  id v11 = [v5 accountName];
  [v10 setText:v11];

  [v10 setNumberOfLines:0];
  [v10 setTextAlignment:1];
  id v12 = VSMainConcurrencyBindingOptions();
  v89 = v10;
  objc_msgSend(v10, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"title2Font", v12);

  [(VSAutoAuthenticationViewController_iOS *)self setAccountNameLabel:v10];
  id v13 = objc_alloc_init(MEMORY[0x263F1C768]);
  v14 = [v5 messageTitle];
  [v13 setText:v14];

  [v13 setNumberOfLines:0];
  [v13 setTextAlignment:1];
  uint64_t v15 = VSMainConcurrencyBindingOptions();
  v88 = v13;
  objc_msgSend(v13, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"bodyFont", v15);

  [(VSAutoAuthenticationViewController_iOS *)self setMessageTitleLabel:v13];
  id v16 = objc_alloc_init(MEMORY[0x263F1C768]);
  v17 = [v5 message];
  [v16 setText:v17];

  [v16 setNumberOfLines:0];
  [v16 setTextAlignment:1];
  id v18 = VSMainConcurrencyBindingOptions();
  v87 = v16;
  objc_msgSend(v16, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"bodyFont", v18);

  [(VSAutoAuthenticationViewController_iOS *)self setMessageLabel:v16];
  id v19 = objc_alloc_init(MEMORY[0x263F1C768]);
  v20 = [v5 notice];
  [v19 setText:v20];

  [v19 setNumberOfLines:0];
  [v19 setTextAlignment:1];
  objc_super v21 = VSMainConcurrencyBindingOptions();
  v86 = v19;
  objc_msgSend(v19, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"footnoteFont", v21);

  [(VSAutoAuthenticationViewController_iOS *)self setNoticeLabel:v19];
  id v22 = objc_alloc_init(MEMORY[0x263F1C768]);
  v23 = [v5 manualSignInTitle];
  [v22 setText:v23];

  [v22 setNumberOfLines:0];
  [v22 setTextAlignment:1];
  v24 = VSMainConcurrencyBindingOptions();
  v85 = v22;
  objc_msgSend(v22, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"footnoteFont", v24);

  [(VSAutoAuthenticationViewController_iOS *)self setManualSignInTitleLabel:v22];
  v25 = objc_alloc_init(VSMultilineButton);
  v26 = [MEMORY[0x263F1C550] whiteColor];
  [(VSMultilineButton *)v25 setTitleColor:v26 forState:1];

  v27 = [(VSMultilineButton *)v25 titleLabel];
  [v27 setNumberOfLines:0];

  v83 = v5;
  v28 = v5;
  v29 = v7;
  v30 = [v28 manualSignInButtonText];
  [(VSMultilineButton *)v25 setTitle:v30 forState:0];

  [(VSMultilineButton *)v25 addTarget:self action:sel__manualSignInButtonPressed_ forControlEvents:0x2000];
  v31 = [(VSMultilineButton *)v25 titleLabel];
  [v31 setTextAlignment:1];
  v32 = VSMainConcurrencyBindingOptions();
  v81 = v31;
  objc_msgSend(v31, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"bodyFont", v32);

  [(VSAutoAuthenticationViewController_iOS *)self setManualSignInButton:v25];
  id v33 = objc_alloc_init(MEMORY[0x263F1C768]);
  v34 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v35 = [v34 localizedStringForKey:@"CREDENTIAL_ENTRY_FOOTER" value:0 table:0];
  v36 = (void *)[v35 mutableCopy];

  [v36 appendString:@" "];
  v37 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v38 = [v37 localizedStringForKey:@"CREDENTIAL_ENTRY_FOOTER_IOS" value:0 table:0];
  [v36 appendString:v38];

  v79 = v36;
  [v33 setText:v36];
  [v33 setNumberOfLines:0];
  [v33 setTextAlignment:1];
  v39 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v33, "vs_bind:toObject:withKeyPath:options:", @"font", v9, @"footnoteFont", v39);

  v84 = self;
  [(VSAutoAuthenticationViewController_iOS *)self setFooterLabel:v33];
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  v41 = [v90 leftAnchor];
  v42 = [v3 leftAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v40 addObject:v43];

  v44 = [v90 rightAnchor];
  v45 = [v3 rightAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v40 addObject:v46];

  v47 = [v90 topAnchor];
  v48 = [v3 topAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v40 addObject:v49];

  v50 = [v90 bottomAnchor];
  v51 = [v3 bottomAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  v93 = v40;
  [v40 addObject:v52];

  v82 = v25;
  v80 = v33;
  _NSDictionaryOfVariableBindings(&cfstr_LogoviewFooter.isa, v29, v33, v89, v88, v87, v86, v85, v25, 0);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v78 = long long v97 = 0u;
  id obj = [v78 allValues];
  uint64_t v53 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v92 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v95 != v92) {
          objc_enumerationMutation(obj);
        }
        v56 = *(VSIdentityProviderLogoView **)(*((void *)&v94 + 1) + 8 * i);
        [(VSIdentityProviderLogoView *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v3 addSubview:v56];
        if (v56 == v29)
        {
          v67 = [(VSIdentityProviderLogoView *)v29 leftAnchor];
          v68 = [v90 leftAnchor];
          v69 = [v67 constraintEqualToAnchor:v68];
          [v93 addObject:v69];

          v63 = [(VSIdentityProviderLogoView *)v29 rightAnchor];
          v64 = [v90 rightAnchor];
          v65 = [v63 constraintEqualToAnchor:v64];
          [v93 addObject:v65];
        }
        else
        {
          v57 = [(VSIdentityProviderLogoView *)v56 leadingAnchor];
          v58 = [v3 readableContentGuide];
          [v58 leadingAnchor];
          v59 = v29;
          v61 = id v60 = v3;
          v62 = [v57 constraintEqualToAnchor:v61 constant:10.0];
          [v93 addObject:v62];

          id v3 = v60;
          v29 = v59;

          v63 = [(VSIdentityProviderLogoView *)v56 trailingAnchor];
          v64 = [v3 readableContentGuide];
          v65 = [v64 trailingAnchor];
          v66 = [v63 constraintEqualToAnchor:v65 constant:-10.0];
          [v93 addObject:v66];
        }
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    }
    while (v54);
  }
  v77 = v3;

  id v70 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v70 setObject:&unk_26F37E680 forKey:@"logoBottomSpace"];
  [v70 setObject:&unk_26F37E690 forKey:@"accountBottomSpace"];
  [v70 setObject:&unk_26F37E6A0 forKey:@"titleBottomSpace"];
  [v70 setObject:&unk_26F37E6A0 forKey:@"messageBottomSpace"];
  v71 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[logoView]-(logoBottomSpace)-[accountNameLabel]-(accountBottomSpace)-[messageTitleLabel]-(titleBottomSpace)-[messageLabel]-(messageBottomSpace)-[noticeLabel]-[footerLabel]|" options:0 metrics:v70 views:v78];
  [v93 addObjectsFromArray:v71];

  v72 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[noticeLabel]-(>=26)-[manualSignInTitleLabel]-(12)-[manualSignInButton]" options:0 metrics:v70 views:v78];
  [v93 addObjectsFromArray:v72];

  v73 = [(VSMultilineButton *)v82 bottomAnchor];
  v74 = [v90 bottomAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:-16.0];

  LODWORD(v76) = 1144733696;
  [v75 setPriority:v76];
  [v93 addObject:v75];
  [MEMORY[0x263F08938] activateConstraints:v93];
  [v90 layoutIfNeeded];
  VSAuthenticationViewControllerViewDidLoad(v84);
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v28 viewDidLayoutSubviews];
  id v3 = [(VSAutoAuthenticationViewController_iOS *)self scrollView];
  [v3 contentInset];
  double v25 = v5;
  double v26 = v4;
  double v27 = v6;
  objc_super v7 = [(VSAutoAuthenticationViewController_iOS *)self manualSignInTitleLabel];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = [(VSAutoAuthenticationViewController_iOS *)self manualSignInButton];
  [v16 frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  v31.origin.x = v18;
  v31.origin.y = v20;
  v31.size.width = v22;
  v31.size.height = v24;
  CGRect v30 = CGRectUnion(v29, v31);
  objc_msgSend(v3, "setContentInset:", v26, v25, CGRectGetHeight(v30) + 26.0 + 16.0, v27);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v4 viewWillAppear:a3];
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v4 viewDidAppear:a3];
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v4 viewWillDisappear:a3];
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  [(VSAutoAuthenticationViewController_iOS *)&v4 viewDidDisappear:a3];
  VSAuthenticationViewControllerViewDidDisappear(self);
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

- (VSAutoAuthenticationViewModel)viewModel
{
  return self->_viewModel;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
}

- (UILabel)accountNameLabel
{
  return self->_accountNameLabel;
}

- (void)setAccountNameLabel:(id)a3
{
}

- (UILabel)messageTitleLabel
{
  return self->_messageTitleLabel;
}

- (void)setMessageTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UILabel)noticeLabel
{
  return self->_noticeLabel;
}

- (void)setNoticeLabel:(id)a3
{
}

- (UILabel)manualSignInTitleLabel
{
  return self->_manualSignInTitleLabel;
}

- (void)setManualSignInTitleLabel:(id)a3
{
}

- (UIButton)manualSignInButton
{
  return self->_manualSignInButton;
}

- (void)setManualSignInButton:(id)a3
{
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
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
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_manualSignInButton, 0);
  objc_storeStrong((id *)&self->_manualSignInTitleLabel, 0);
  objc_storeStrong((id *)&self->_noticeLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_messageTitleLabel, 0);
  objc_storeStrong((id *)&self->_accountNameLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end