@interface PKPassShareActivationOverviewViewController
- (PKPassShareActivationOverviewViewController)init;
- (PKPassShareActivationOverviewViewController)initWithActivationOptions:(id)a3 recipient:(id)a4 isFinalScreen:(BOOL)a5 delegate:(id)a6;
- (void)closeButtonPressed;
- (void)externalKeyEdicationViewDidSelectNext:(id)a3;
- (void)loadView;
- (void)shareActivationCodeViewDidSelectCopy:(id)a3;
- (void)shareActivationCodeViewDidSelectPhone:(id)a3;
- (void)shareActivationCodeViewDidSelectShare:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPassShareActivationOverviewViewController

- (PKPassShareActivationOverviewViewController)init
{
  return 0;
}

- (PKPassShareActivationOverviewViewController)initWithActivationOptions:(id)a3 recipient:(id)a4 isFinalScreen:(BOOL)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareActivationOverviewViewController;
  v14 = [(PKPassShareActivationOverviewViewController *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activationOptions, a3);
    objc_storeStrong((id *)&v15->_recipient, a4);
    v15->_isFinalScreen = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
  }

  return v15;
}

- (void)loadView
{
  v34.receiver = self;
  v34.super_class = (Class)PKPassShareActivationOverviewViewController;
  [(PKPassShareActivationOverviewViewController *)&v34 loadView];
  v3 = [(PKPassShareActivationOverviewViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  if (self->_isFinalScreen)
  {
    v5 = [(PKPassShareActivationOverviewViewController *)self navigationItem];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel_closeButtonPressed];
    [v5 setRightBarButtonItem:v6];
    objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    [v5 setHidesBackButton:1];
    v7 = [(PKPassShareActivationOverviewViewController *)self navigationController];
    [v7 setNavigationBarHidden:0];
  }
  v8 = [(PKPassShareActivationOptions *)self->_activationOptions primaryOption];
  uint64_t v9 = [v8 type];
  v10 = [v8 localizationKeyPostfix];
  id v11 = [@"SHARE_ACTIVATION_OVERVIEW_TITLE_" stringByAppendingString:v10];

  id v12 = [(PKPassShareActivationOptions *)self->_activationOptions localizationKeyPostfix];
  id v13 = [@"SHARE_OVERVIEW_ACTIVATION_FOOTER_" stringByAppendingString:v12];

  v14 = objc_alloc_init(PKCollapsibleHeaderView);
  headerView = self->_headerView;
  self->_headerView = v14;

  v16 = self->_headerView;
  v33 = v11;
  objc_super v17 = PKLocalizedShareableCredentialString(v11);
  v18 = PKLocalizedShareableCredentialString(v13);
  [(PKCollapsibleHeaderView *)v16 setTitle:v17 subtitle:v18];

  [v3 addSubview:self->_headerView];
  if (PKPassShareActivationOptionTypeIsActivationCode())
  {
    v19 = [[PKPassShareActivationShareActivationCodeView alloc] initWithDelegate:self];
    v20 = [v8 value];
    [(PKPassShareActivationShareActivationCodeView *)v19 setActivationCode:v20];

    v21 = [(PKContact *)self->_recipient phoneNumber];
    BOOL v22 = v21 != 0;

    [(PKPassShareActivationShareActivationCodeView *)v19 setShowPhoneCallButton:v22];
    contentView = self->_contentView;
    self->_contentView = &v19->super;
  }
  else if (v9 == 3)
  {
    if (self->_isFinalScreen) {
      v24 = @"DONE_BUTTON";
    }
    else {
      v24 = @"NEXT";
    }
    contentView = PKLocalizedPaymentString(&v24->isa);
    v25 = [[PKPassShareActivationExternalKeyEducationView alloc] initWithContinueButtonText:contentView delegate:self];
    v26 = (void *)MEMORY[0x1E4FB1818];
    v27 = PKPassKitUIBundle();
    v28 = [v26 imageNamed:@"Car-Key-Share-Activation-Key-Fob" inBundle:v27 withConfiguration:0];

    [(PKPassShareActivationExternalKeyEducationView *)v25 setEducationImage:v28];
    v29 = self->_contentView;
    self->_contentView = &v25->super;
  }
  else
  {
    v30 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v31 = self->_contentView;
    self->_contentView = v30;

    v32 = self->_contentView;
    contentView = [MEMORY[0x1E4FB1618] lightGrayColor];
    [(UIView *)v32 setBackgroundColor:contentView];
  }

  [v3 addSubview:self->_contentView];
}

- (void)viewWillLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationOverviewViewController;
  [(PKPassShareActivationOverviewViewController *)&v23 viewWillLayoutSubviews];
  v3 = [(PKPassShareActivationOverviewViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  id v12 = [v3 readableContentGuide];
  [v12 layoutFrame];
  double v14 = v13;

  memset(&slice, 0, sizeof(slice));
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  -[PKCollapsibleHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v14, v11);
  CGFloat v16 = v15;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGRectDivide(v24, &slice, &v21, 12.0, CGRectMinYEdge);
  CGRectDivide(v21, &slice, &v21, v16, CGRectMinYEdge);
  headerView = self->_headerView;
  PKSizeAlignedInRect();
  -[PKCollapsibleHeaderView setFrame:](headerView, "setFrame:");
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v14, v11);
  CGFloat v19 = v18;
  CGRectDivide(v21, &slice, &v21, 16.0, CGRectMinYEdge);
  CGRectDivide(v21, &slice, &v21, v19, CGRectMinYEdge);
  contentView = self->_contentView;
  PKSizeAlignedInRect();
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)closeButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationOverviewViewControllerDidFinish:self];
}

- (void)shareActivationCodeViewDidSelectPhone:(id)a3
{
  id v4 = a3;
  CGFloat v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v13 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Sharing activation code over the phone", v13, 2u);
  }

  double v6 = [(PKContact *)self->_recipient phoneNumber];
  CGFloat v7 = [v6 stringValue];

  double v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EF1B5B50];
  id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
  double v10 = [@"telprompt://" stringByAppendingString:v8];
  double v11 = (void *)[v9 initWithString:v10];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v12 openURL:v11 options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

- (void)shareActivationCodeViewDidSelectShare:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Sharing activation code with share sheet", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationOverviewViewControllerDidSelectShareCode:self];
}

- (void)shareActivationCodeViewDidSelectCopy:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Copying activation code", v8, 2u);
  }

  CGFloat v5 = [(PKPassShareActivationOptions *)self->_activationOptions primaryOption];
  double v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  CGFloat v7 = [v5 value];
  [v6 setString:v7];
}

- (void)externalKeyEdicationViewDidSelectNext:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shareActivationOverviewViewControllerDidFinish:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipient, 0);

  objc_storeStrong((id *)&self->_activationOptions, 0);
}

@end