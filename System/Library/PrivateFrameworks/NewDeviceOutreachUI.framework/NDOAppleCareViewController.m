@interface NDOAppleCareViewController
- (NDOAppleCareFlowDelegate)presentor;
- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4;
- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4 source:(id)a5 deeplinkParams:(id)a6;
- (NDOAppleCareViewController)initWithWarranty:(id)a3;
- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4;
- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4 serialNumber:(id)a5;
- (NDODeviceInfo)deviceInfo;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSString)deeplinkParams;
- (NSString)source;
- (UIButton)continueButton;
- (UIButton)notNowButton;
- (UILabel)acHeaderLabel;
- (UILabel)detailsText2Label;
- (UILabel)detailsTextLabel;
- (UILabel)promoTextLabel;
- (UIStackView)buttonStackView;
- (UIStackView)comboStackView;
- (unint64_t)presentationType;
- (unint64_t)supportedInterfaceOrientations;
- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3;
- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3 params:(id)a4;
- (void)cancelPressed:(id)a3;
- (void)completeWithStatus:(unint64_t)a3;
- (void)completeWithStatus:(unint64_t)a3 params:(id)a4;
- (void)getAppleCarePressed:(id)a3;
- (void)loadView;
- (void)notNowPressed:(id)a3;
- (void)okButtonPressed;
- (void)setAcHeaderLabel:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setComboStackView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDeeplinkParams:(id)a3;
- (void)setDetailsText2Label:(id)a3;
- (void)setDetailsTextLabel:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setPresentationType:(unint64_t)a3;
- (void)setPresentor:(id)a3;
- (void)setPromoTextLabel:(id)a3;
- (void)setSource:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)updatePromotionLabelWithWarranty:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)webviewFinishedWithCompletion:(unint64_t)a3;
@end

@implementation NDOAppleCareViewController

- (NDOAppleCareViewController)initWithWarranty:(id)a3
{
  return [(NDOAppleCareViewController *)self initWithWarranty:a3 presentationType:0];
}

- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4
{
  return [(NDOAppleCareViewController *)self initWithWarranty:a3 presentationType:a4 serialNumber:0];
}

- (NDOAppleCareViewController)initWithWarranty:(id)a3 presentationType:(unint64_t)a4 serialNumber:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    v9 = (void *)MEMORY[0x263F58710];
    v10 = NSString;
    id v11 = a3;
    v12 = [v10 stringWithFormat:@"DEBUG:%@", v8];
    [v9 deviceWithName:v12 serialNumber:v8 activationDate:0 deviceType:0];
  }
  else
  {
    id v13 = a3;
    v12 = objc_opt_new();
    [v12 defaultDevice];
  v14 = };

  v15 = [MEMORY[0x263F58718] deviceInfoWithDevice:v14 warranty:a3];

  v16 = [(NDOAppleCareViewController *)self source];
  v17 = [(NDOAppleCareViewController *)self initWithDeviceInfo:v15 presentationType:a4 source:v16 deeplinkParams:0];

  return v17;
}

- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4
{
  return [(NDOAppleCareViewController *)self initWithDeviceInfo:a3 presentationType:a4 source:@"UNKNOWN" deeplinkParams:0];
}

- (NDOAppleCareViewController)initWithDeviceInfo:(id)a3 presentationType:(unint64_t)a4 source:(id)a5 deeplinkParams:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16.receiver = self;
  v16.super_class = (Class)NDOAppleCareViewController;
  v14 = [(NDOAppleCareViewController *)&v16 initWithNibName:@"NDOAppleCareView" bundle:v13];

  if (v14)
  {
    [(NDOAppleCareViewController *)v14 setDeviceInfo:v10];
    [(NDOAppleCareViewController *)v14 setPresentationType:a4];
    [(NDOAppleCareViewController *)v14 setSource:v11];
    [(NDOAppleCareViewController *)v14 setDeeplinkParams:v12];
  }

  return v14;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if ([v2 userInterfaceIdiom] == 6)
  {

    return 30;
  }
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    return 30;
  }
  return 2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)NDOAppleCareViewController;
  [(NDOAppleCareViewController *)&v5 loadView];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPressed_];
  uint64_t v4 = [(NDOAppleCareViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NDOAppleCareViewController;
  [(NDOAppleCareViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [(NDOAppleCareViewController *)self navigationItem];
  id v5 = objc_alloc_init(MEMORY[0x263F829A8]);
  [v5 configureWithTransparentBackground];
  [v4 setScrollEdgeAppearance:v5];
  [v4 setStandardAppearance:v5];
  [v4 setCompactAppearance:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)NDOAppleCareViewController;
  [(NDOAppleCareViewController *)&v9 viewDidAppear:a3];
  if ([MEMORY[0x263F58730] isInternal])
  {
    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v5 = [v4 BOOLForKey:@"NDOAppleCareViewControllerTestPurchase"];

    if (v5)
    {
      objc_super v6 = _NDOLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v11 = "-[NDOAppleCareViewController viewDidAppear:]";
        _os_log_impl(&dword_238845000, v6, OS_LOG_TYPE_DEFAULT, "%s: Testing kNDOAppleCareViewControllerTestPurchase", buf, 0xCu);
      }

      dispatch_time_t v7 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__NDOAppleCareViewController_viewDidAppear___block_invoke;
      block[3] = &unk_264D49560;
      block[4] = self;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __44__NDOAppleCareViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeWithStatus:2];
}

- (void)updatePromotionLabelWithWarranty:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [v24 acOfferPromoFormat];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    v21 = [(NDOAppleCareViewController *)self comboStackView];
    v22 = [(NDOAppleCareViewController *)self promoTextLabel];
    [v21 removeArrangedSubview:v22];

    id v13 = [(NDOAppleCareViewController *)self promoTextLabel];
    [v13 setHidden:1];
    goto LABEL_9;
  }
  objc_super v6 = [v24 acOfferPromoNew];
  uint64_t v7 = [v6 length];

  id v8 = objc_alloc(MEMORY[0x263F089B8]);
  if (!v7)
  {
    v20 = [v24 acOfferPromoFormat];
    id v13 = (void *)[v8 initWithString:v20];
    goto LABEL_7;
  }
  objc_super v9 = NSString;
  id v10 = [v24 acOfferPromoFormat];
  id v11 = [v24 acOfferPromoNew];
  uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);
  id v13 = (void *)[v8 initWithString:v12];

  v14 = [v13 mutableString];
  v15 = [v24 acOfferPromoNew];
  uint64_t v16 = [v14 rangeOfString:v15 options:1];
  uint64_t v18 = v17;

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = *MEMORY[0x263F81500];
    v20 = [MEMORY[0x263F825C8] systemOrangeColor];
    objc_msgSend(v13, "addAttribute:value:range:", v19, v20, v16, v18);
LABEL_7:
  }
  v23 = [(NDOAppleCareViewController *)self promoTextLabel];
  [v23 setAttributedText:v13];

LABEL_9:
}

- (void)viewDidLoad
{
  v63[2] = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)NDOAppleCareViewController;
  [(NDOAppleCareViewController *)&v60 viewDidLoad];
  if (![(NDOAppleCareViewController *)self presentationType])
  {
    v3 = [(NDOAppleCareViewController *)self buttonStackView];
    uint64_t v4 = [(NDOAppleCareViewController *)self notNowButton];
    [v3 removeArrangedSubview:v4];

    uint64_t v5 = [(NDOAppleCareViewController *)self notNowButton];
    [v5 setHidden:1];
  }
  objc_super v6 = [(NDOAppleCareViewController *)self deviceInfo];
  uint64_t v7 = [v6 warranty];

  [(NDOAppleCareViewController *)self updatePromotionLabelWithWarranty:v7];
  id v8 = [MEMORY[0x263F82670] currentDevice];
  if ([v8 userInterfaceIdiom] == 6)
  {
    unint64_t v9 = [(NDOAppleCareViewController *)self presentationType];

    if (v9 == 1)
    {
      id v10 = NSString;
      id v11 = [v7 acLocalizedOfferDetails];
      uint64_t v12 = [v10 stringWithFormat:@"%@", v11];
      id v13 = [(NDOAppleCareViewController *)self detailsTextLabel];
      [v13 setText:v12];

      v14 = NSString;
      v15 = [v7 acLocalizedOfferDetailsEligibility];
      uint64_t v16 = [v14 stringWithFormat:@"%@", v15];
      uint64_t v17 = [(NDOAppleCareViewController *)self detailsText2Label];
      [v17 setText:v16];

      uint64_t v18 = [(NDOAppleCareViewController *)self comboStackView];
      [v18 setSpacing:15.0];
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v19 = NSString;
  v20 = [v7 acLocalizedOfferDetails];
  v21 = [v19 stringWithFormat:@"%@", v20];
  v22 = [(NDOAppleCareViewController *)self detailsTextLabel];
  [v22 setText:v21];

  v23 = NSString;
  uint64_t v18 = [v7 acLocalizedOfferDetailsEligibility];
  id v24 = [v23 stringWithFormat:@"%@", v18];
  v25 = [(NDOAppleCareViewController *)self detailsText2Label];
  [v25 setText:v24];

LABEL_8:
  v26 = [MEMORY[0x263F82670] currentDevice];
  if ([v26 userInterfaceIdiom] == 1)
  {
  }
  else
  {
    v27 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    if (v28 != 6) {
      goto LABEL_14;
    }
  }
  v29 = (void *)MEMORY[0x263F08938];
  v30 = [(NDOAppleCareViewController *)self trailingConstraint];
  v63[0] = v30;
  v31 = [(NDOAppleCareViewController *)self leadingConstraint];
  v63[1] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
  [v29 deactivateConstraints:v32];

  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  v34 = (void *)MEMORY[0x263F08938];
  v35 = [(NDOAppleCareViewController *)self continueButton];
  v36 = [v34 constraintWithItem:v35 attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:1.0 constant:360.0];

  [v33 addObject:v36];
  [MEMORY[0x263F08938] activateConstraints:v33];
  v37 = [(NDOAppleCareViewController *)self view];
  [v37 setNeedsUpdateConstraints];

  v38 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v39 = [v38 userInterfaceIdiom];

  if (v39 == 6)
  {
    v40 = [MEMORY[0x263F81708] boldSystemFontOfSize:30.0];
    v41 = [(NDOAppleCareViewController *)self acHeaderLabel];
    [v41 setFont:v40];

    uint64_t v42 = *MEMORY[0x263F835F0];
    v43 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    v44 = [(NDOAppleCareViewController *)self promoTextLabel];
    [v44 setFont:v43];

    v45 = [MEMORY[0x263F81708] preferredFontForTextStyle:v42];
    v46 = [(NDOAppleCareViewController *)self detailsTextLabel];
    [v46 setFont:v45];

    v47 = [MEMORY[0x263F81708] preferredFontForTextStyle:v42];
    v48 = [(NDOAppleCareViewController *)self detailsText2Label];
    [v48 setFont:v47];

    -[NDOAppleCareViewController setPreferredContentSize:](self, "setPreferredContentSize:", 520.0, 420.0);
  }

LABEL_14:
  v49 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v50 = [v49 bundleIdentifier];

  if (v50) {
    v51 = (__CFString *)v50;
  }
  else {
    v51 = @"No identifier";
  }
  v61[0] = @"devicetype";
  v52 = [(NDOAppleCareViewController *)self deviceInfo];
  v53 = [v52 device];
  v54 = [v53 deviceTypeString];
  v62[0] = v54;
  v61[1] = @"remainingdays";
  v55 = NSNumber;
  v56 = [(NDOAppleCareViewController *)self deviceInfo];
  v57 = [v56 warranty];
  v58 = objc_msgSend(v55, "numberWithUnsignedInt:", objc_msgSend(v57, "daysEligible"));
  v61[2] = @"entrypoint";
  v62[1] = v58;
  v62[2] = v51;
  v59 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.viewload" eventDict:v59];
}

- (void)getAppleCarePressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[NDOAppleCareViewController getAppleCarePressed:]";
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v5 = [NDOAppleCareAMSUIViewController alloc];
  objc_super v6 = [(NDOAppleCareViewController *)self deviceInfo];
  uint64_t v7 = [v6 warranty];
  id v8 = [(NDOAppleCareViewController *)self deviceInfo];
  unint64_t v9 = [v8 device];
  id v10 = [v9 serialNumber];
  id v11 = [(NDOAppleCareViewController *)self source];
  uint64_t v12 = [(NDOAppleCareViewController *)self deeplinkParams];
  id v13 = [(NDOAppleCareAMSUIViewController *)v5 initWithWarranty:v7 serialNumber:v10 source:v11 deeplinkParams:v12];

  [(NDOAppleCareAMSUIViewController *)v13 setPresenter:self];
  [(NDOAppleCareAMSUIViewController *)v13 setModalPresentationStyle:3];
  v14 = [(NDOAppleCareViewController *)self navigationController];
  [v14 pushViewController:v13 animated:1];
}

- (void)completeWithStatus:(unint64_t)a3
{
}

- (void)completeWithStatus:(unint64_t)a3 params:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NDOAppleCareViewController *)self presentor];
    int v23 = 136315906;
    id v24 = "-[NDOAppleCareViewController completeWithStatus:params:]";
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%s: status: %ld, params: %@, presentor: %@", (uint8_t *)&v23, 0x2Au);
  }
  if (a3 != 3)
  {
    if (a3 == 4)
    {
      unint64_t v9 = [NDOAppleCareWebViewController alloc];
      id v10 = [(NDOAppleCareViewController *)self deviceInfo];
      id v11 = [v10 warranty];
      uint64_t v12 = [(NDOAppleCareViewController *)self deviceInfo];
      id v13 = [v12 device];
      v14 = [v13 serialNumber];
      int v15 = [(NDOAppleCareWebViewController *)v9 initWithWarranty:v11 serialNumber:v14 params:v6];

      [(NDOAppleCareWebViewController *)v15 setPresenter:self];
      [(NDOAppleCareWebViewController *)v15 setModalPresentationStyle:3];
      uint64_t v16 = [(NDOAppleCareViewController *)self navigationController];

      if (!v16)
      {
        [(NDOAppleCareViewController *)self presentViewController:v15 animated:1 completion:&__block_literal_global];
        goto LABEL_12;
      }
      uint64_t v17 = [(NDOAppleCareViewController *)self navigationController];
      [v17 pushViewController:v15 animated:1];
    }
    else
    {
      uint64_t v18 = [(NDOAppleCareViewController *)self presentor];
      char v19 = objc_opt_respondsToSelector();

      v20 = [(NDOAppleCareViewController *)self presentor];
      int v15 = v20;
      if (v19)
      {
        [(NDOAppleCareWebViewController *)v20 outreachFinishedWithCompletion:a3];
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v17 = [(NDOAppleCareViewController *)self deviceInfo];
      v21 = [v17 device];
      v22 = [v21 serialNumber];
      [(NDOAppleCareWebViewController *)v15 outreachFinishedForDeviceWithSerialNumber:v22 withCompletion:a3];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)notNowPressed:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[NDOAppleCareViewController notNowPressed:]";
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x263F82670] currentDevice];
  if ([v5 userInterfaceIdiom] == 6)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
    BOOL v6 = [v7 userInterfaceIdiom] == 1;
  }
  id v8 = [(NDOAppleCareViewController *)self deviceInfo];
  unint64_t v9 = [v8 device];
  uint64_t v10 = [v9 deviceType];
  id v11 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v12 = v11;
  if (v10 == 1) {
    id v13 = @"ALERT_MSG_WATCH";
  }
  else {
    id v13 = @"ALERT_MSG_DEFAULT";
  }
  v30 = objc_msgSend(v11, "localizedStringForKey:value:table:", v13);

  v14 = (void *)MEMORY[0x263F82418];
  int v15 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v16 = [v15 localizedStringForKey:@"ALERT_TITLE" value:&stru_26EB85580 table:@"Localizable"];
  uint64_t v17 = [v14 alertControllerWithTitle:v16 message:v30 preferredStyle:v6];

  uint64_t v18 = (void *)MEMORY[0x263F82400];
  char v19 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  v20 = [v19 localizedStringForKey:@"Remind Me Later" value:&stru_26EB85580 table:@"Localizable"];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke;
  v33[3] = &unk_264D495A8;
  v33[4] = self;
  v21 = [v18 actionWithTitle:v20 style:0 handler:v33];

  v22 = (void *)MEMORY[0x263F82400];
  int v23 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v24 = [v23 localizedStringForKey:@"Don't Show Again" value:&stru_26EB85580 table:@"Localizable"];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_2;
  v32[3] = &unk_264D495A8;
  v32[4] = self;
  __int16 v25 = [v22 actionWithTitle:v24 style:2 handler:v32];

  unint64_t v26 = (void *)MEMORY[0x263F82400];
  __int16 v27 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_26EB85580 table:@"Localizable"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_4;
  v31[3] = &unk_264D495A8;
  v31[4] = self;
  __int16 v29 = [v26 actionWithTitle:v28 style:1 handler:v31];

  [v17 addAction:v21];
  [v17 addAction:v25];
  [v17 addAction:v29];
  [(NDOAppleCareViewController *)self presentViewController:v17 animated:1 completion:0];
}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"devicetype";
  v2 = [*(id *)(a1 + 32) deviceInfo];
  v3 = [v2 device];
  uint64_t v4 = [v3 deviceTypeString];
  v11[0] = v4;
  v10[1] = @"remainingdays";
  uint64_t v5 = NSNumber;
  BOOL v6 = [*(id *)(a1 + 32) deviceInfo];
  uint64_t v7 = [v6 warranty];
  id v8 = objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v7, "daysEligible"));
  v10[2] = @"actionorigin";
  v11[1] = v8;
  v11[2] = @"RemindMeLater";
  unint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.viewcancel" eventDict:v9];
  [*(id *)(a1 + 32) completeWithStatus:0];
}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_2(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v19[0] = @"devicetype";
  uint64_t v4 = [*(id *)(a1 + 32) deviceInfo];
  uint64_t v5 = [v4 device];
  BOOL v6 = [v5 deviceTypeString];
  v19[1] = @"remainingdays";
  v20[0] = v6;
  uint64_t v7 = NSNumber;
  id v8 = [*(id *)(a1 + 32) deviceInfo];
  unint64_t v9 = [v8 warranty];
  uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v9, "daysEligible"));
  v20[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.viewnotnow" eventDict:v11];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v12 = objc_opt_new();
  id v13 = [*(id *)(a1 + 32) deviceInfo];
  v14 = [v13 device];
  int v15 = [v14 serialNumber];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__NDOAppleCareViewController_notNowPressed___block_invoke_3;
  v16[3] = &unk_264D495D0;
  objc_copyWeak(&v17, &location);
  [v12 storeUserInitiatedFollowUpDismissalForSerialNumber:v15 withReply:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completeWithStatus:1];
}

void __44__NDOAppleCareViewController_notNowPressed___block_invoke_4(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"devicetype";
  v2 = [*(id *)(a1 + 32) deviceInfo];
  id v3 = [v2 device];
  uint64_t v4 = [v3 deviceTypeString];
  v11[0] = v4;
  v10[1] = @"remainingdays";
  uint64_t v5 = NSNumber;
  BOOL v6 = [*(id *)(a1 + 32) deviceInfo];
  uint64_t v7 = [v6 warranty];
  id v8 = objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v7, "daysEligible"));
  v10[2] = @"actionorigin";
  v11[1] = v8;
  v11[2] = @"AlertCancel";
  unint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.viewcancel" eventDict:v9];
}

- (void)cancelPressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[NDOAppleCareViewController cancelPressed:]";
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v5 = [(NDOAppleCareViewController *)self deviceInfo];
  BOOL v6 = [v5 device];
  uint64_t v7 = [v6 deviceTypeString];
  v14[0] = v7;
  v13[1] = @"remainingdays";
  id v8 = NSNumber;
  unint64_t v9 = [(NDOAppleCareViewController *)self deviceInfo];
  uint64_t v10 = [v9 warranty];
  id v11 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v10, "daysEligible"));
  v13[2] = @"actionorigin";
  v14[1] = v11;
  v14[2] = @"NavigationCancel";
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  [MEMORY[0x263F58720] postCAEventFor:@"com.apple.newdeviceoutreach.purchaseflow.viewcancel" eventDict:v12];
  [(NDOAppleCareViewController *)self completeWithStatus:0];
}

- (void)okButtonPressed
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NDOAppleCareViewController okButtonPressed]";
    _os_log_impl(&dword_238845000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(NDOAppleCareViewController *)self completeWithStatus:0];
}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3 params:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[NDOAppleCareViewController amsUIViewFinishedWithCompletion:params:]";
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%s: status: %ld, params: %@", (uint8_t *)&v9, 0x20u);
  }

  if (v6)
  {
    id v8 = [v6 objectForKey:@"paramString"];
  }
  else
  {
    id v8 = 0;
  }
  [(NDOAppleCareViewController *)self completeWithStatus:a3 params:v8];
}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[NDOAppleCareViewController amsUIViewFinishedWithCompletion:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl(&dword_238845000, v5, OS_LOG_TYPE_DEFAULT, "%s: status: %ld", (uint8_t *)&v7, 0x16u);
  }

  [(NDOAppleCareViewController *)self completeWithStatus:a3];
  id v6 = [(NDOAppleCareViewController *)self navigationController];

  if (!v6) {
    [(NDOAppleCareViewController *)self cancelPressed:0];
  }
}

- (void)webviewFinishedWithCompletion:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[NDOAppleCareViewController webviewFinishedWithCompletion:]";
    __int16 v8 = 2048;
    unint64_t v9 = a3;
    _os_log_impl(&dword_238845000, v5, OS_LOG_TYPE_DEFAULT, "%s: status: %ld", (uint8_t *)&v6, 0x16u);
  }

  [(NDOAppleCareViewController *)self completeWithStatus:a3];
}

- (NDOAppleCareFlowDelegate)presentor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentor);
  return (NDOAppleCareFlowDelegate *)WeakRetained;
}

- (void)setPresentor:(id)a3
{
}

- (NDODeviceInfo)deviceInfo
{
  return (NDODeviceInfo *)objc_getProperty(self, a2, 984, 1);
}

- (void)setDeviceInfo:(id)a3
{
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setSource:(id)a3
{
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setDeeplinkParams:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leadingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (UIStackView)comboStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_comboStackView);
  return (UIStackView *)WeakRetained;
}

- (void)setComboStackView:(id)a3
{
}

- (UILabel)acHeaderLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_acHeaderLabel);
  return (UILabel *)WeakRetained;
}

- (void)setAcHeaderLabel:(id)a3
{
}

- (UILabel)promoTextLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_promoTextLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPromoTextLabel:(id)a3
{
}

- (UILabel)detailsTextLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsTextLabel);
  return (UILabel *)WeakRetained;
}

- (void)setDetailsTextLabel:(id)a3
{
}

- (UILabel)detailsText2Label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsText2Label);
  return (UILabel *)WeakRetained;
}

- (void)setDetailsText2Label:(id)a3
{
}

- (UIStackView)buttonStackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonStackView);
  return (UIStackView *)WeakRetained;
}

- (void)setButtonStackView:(id)a3
{
}

- (UIButton)notNowButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notNowButton);
  return (UIButton *)WeakRetained;
}

- (void)setNotNowButton:(id)a3
{
}

- (UIButton)continueButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continueButton);
  return (UIButton *)WeakRetained;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_notNowButton);
  objc_destroyWeak((id *)&self->_buttonStackView);
  objc_destroyWeak((id *)&self->_detailsText2Label);
  objc_destroyWeak((id *)&self->_detailsTextLabel);
  objc_destroyWeak((id *)&self->_promoTextLabel);
  objc_destroyWeak((id *)&self->_acHeaderLabel);
  objc_destroyWeak((id *)&self->_comboStackView);
  objc_destroyWeak((id *)&self->_trailingConstraint);
  objc_destroyWeak((id *)&self->_leadingConstraint);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_destroyWeak((id *)&self->_presentor);
}

@end