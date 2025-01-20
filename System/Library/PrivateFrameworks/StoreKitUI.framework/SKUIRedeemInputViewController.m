@interface SKUIRedeemInputViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)initialCode;
- (SKUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3;
- (id)_newTextFieldWithClientContext:(id)a3;
- (int64_t)category;
- (void)_cancelAction:(id)a3;
- (void)_passbookLockupAction:(id)a3;
- (void)_redeemAction:(id)a3;
- (void)_redeemConfigurationImagesDidLoad:(id)a3;
- (void)_termsButtonAction:(id)a3;
- (void)_textFieldTextDidChange:(id)a3;
- (void)_toggleActivityIndicatorBarButtonItem:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)setInitialCode:(id)a3;
@end

@implementation SKUIRedeemInputViewController

- (SKUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemInputViewController initWithRedeemCategory:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemInputViewController;
  v5 = [(SKUIRedeemInputViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_category = a3;
    [(SKUIRedeemInputViewController *)v5 setEdgesForExtendedLayout:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1F1C9A328 object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3018] object:0];
  [(SKUIRedeemTextField *)self->_field setDelegate:0];
  [(SKUIRedeemITunesPassLockup *)self->_passbookLockup removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v4.receiver = self;
  v4.super_class = (Class)SKUIRedeemInputViewController;
  [(SKUIRedeemInputViewController *)&v4 dealloc];
}

- (void)loadView
{
  v103[1] = *MEMORY[0x1E4F143B8];
  v102.receiver = self;
  v102.super_class = (Class)SKUIRedeemInputViewController;
  [(SKUIRedeemInputViewController *)&v102 loadView];
  v3 = [(SKUIRedeemStepViewController *)self clientContext];
  objc_super v4 = [(SKUIRedeemInputViewController *)self view];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setBackgroundColor:v5];

  v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v13 = 50.0;
  if (v10 <= 480.0) {
    double v13 = 28.0;
  }
  if (v12) {
    double v14 = 30.0;
  }
  else {
    double v14 = v13;
  }
  v101 = [MEMORY[0x1E4F28EB8] defaultCenter];
  imageView = self->_imageView;
  if (!imageView)
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB1838]);
    v17 = [(SKUIRedeemStepViewController *)self configuration];
    v18 = [v17 inputImage];
    v19 = (UIImageView *)[v16 initWithImage:v18];
    v20 = self->_imageView;
    self->_imageView = v19;

    [(UIImageView *)self->_imageView setAutoresizingMask:5];
    v21 = [(SKUIRedeemStepViewController *)self configuration];
    [v101 addObserver:self selector:sel__redeemConfigurationImagesDidLoad_ name:0x1F1C9A328 object:v21];

    imageView = self->_imageView;
  }
  [(UIImageView *)imageView frame];
  v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  double v24 = dbl_1C1CCB530[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  double v25 = dbl_1C1CCB540[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  [v4 frame];
  float v27 = (v26 - v25) * 0.5;
  double v28 = floorf(v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v14, v25, v24);
  [v4 addSubview:self->_imageView];
  id v29 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v29 setAutoresizingMask:2];
  v30 = [v4 backgroundColor];
  [v29 setBackgroundColor:v30];

  v31 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [v29 setFont:v31];

  if (+[SKUIRedeemViewControllerLegacy redeemRequiresNationalId:v3])
  {
    v32 = @"REDEEM_PROMPT_CN";
  }
  else
  {
    v32 = @"REDEEM_PROMPT";
  }
  if (v3) {
    [v3 localizedStringForKey:v32 inTable:@"Redeem"];
  }
  else {
  v33 = +[SKUIClientContext localizedStringForKey:v32 inBundles:0 inTable:@"Redeem"];
  }
  [v29 setText:v33];

  [v29 setTextAlignment:1];
  v34 = [MEMORY[0x1E4FB1618] blackColor];
  [v29 setTextColor:v34];

  [v29 setNumberOfLines:0];
  [v29 frame];
  [v4 frame];
  double v36 = v35 + -20.0;
  [v4 frame];
  objc_msgSend(v29, "sizeThatFits:", v37 + -20.0, 1.79769313e308);
  double v39 = v38;
  v104.origin.x = v28;
  v104.origin.y = v14;
  v104.size.width = v25;
  v104.size.height = v24;
  CGFloat v40 = CGRectGetMaxY(v104) + 15.0;
  [v4 frame];
  float v42 = (v41 - v36) * 0.5;
  objc_msgSend(v29, "setFrame:", roundf(v42), v40, v36, v39);
  [v4 addSubview:v29];
  v43 = [(SKUIRedeemInputViewController *)self _newTextFieldWithClientContext:v3];
  field = self->_field;
  self->_field = v43;

  [(SKUIRedeemTextField *)self->_field setDelegate:self];
  [(SKUIRedeemTextField *)self->_field setText:self->_initialCode];
  [(SKUIRedeemTextField *)self->_field frame];
  [v29 frame];
  double MaxY = CGRectGetMaxY(v105);
  v46 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v47 = [v46 userInterfaceIdiom];

  double v48 = 6.0;
  if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v48 = 30.0;
  }
  double v49 = MaxY + v48;
  [v4 frame];
  CGFloat v51 = v50;
  CGFloat v52 = 0.0;
  CGFloat v53 = 44.0;
  -[SKUIRedeemTextField setFrame:](self->_field, "setFrame:", 0.0, v49);
  [v4 addSubview:self->_field];
  [v101 addObserver:self selector:sel__textFieldTextDidChange_ name:*MEMORY[0x1E4FB3018] object:self->_field];
  v54 = [[SKUILinkButton alloc] initWithArrowStyle:0];
  [(SKUILinkButton *)v54 setAutoresizingMask:5];
  v100 = v4;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_TERMS_LINK" inTable:@"Redeem"];
  }
  else {
  v55 = +[SKUIClientContext localizedStringForKey:@"REDEEM_TERMS_LINK" inBundles:0 inTable:@"Redeem"];
  }
  [(SKUILinkButton *)v54 setTitle:v55 forState:0];

  v56 = [(SKUILinkButton *)v54 titleLabel];
  v57 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v56 setFont:v57];

  v58 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  [(SKUILinkButton *)v54 setTitleColor:v58 forState:0];

  v59 = [MEMORY[0x1E4FB1618] blackColor];
  [(SKUILinkButton *)v54 setTitleColor:v59 forState:1];

  [(SKUILinkButton *)v54 addTarget:self action:sel__termsButtonAction_ forControlEvents:64];
  v60 = v100;
  v61 = [v100 backgroundColor];
  [(SKUILinkButton *)v54 setBackgroundColor:v61];

  if ([(SKUIRedeemStepViewController *)self shouldShowPassbookLearnMore])
  {
    passbookLockup = self->_passbookLockup;
    if (!passbookLockup)
    {
      v63 = [SKUIRedeemITunesPassLockup alloc];
      v64 = [(SKUIRedeemStepViewController *)self configuration];
      v65 = [v64 ITunesPassConfiguration];
      v66 = [(SKUIRedeemStepViewController *)self clientContext];
      v67 = [(SKUIRedeemITunesPassLockup *)v63 initWithITunesPassConfiguration:v65 clientContext:v66];
      v68 = self->_passbookLockup;
      self->_passbookLockup = v67;

      v60 = v100;
      [(SKUIRedeemITunesPassLockup *)self->_passbookLockup addTarget:self action:sel__passbookLockupAction_ forControlEvents:64];
      [(SKUIRedeemITunesPassLockup *)self->_passbookLockup setAutoresizingMask:5];
      passbookLockup = self->_passbookLockup;
    }
    [(SKUIRedeemITunesPassLockup *)passbookLockup frame];
    -[SKUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
    double v70 = v69;
    double v72 = v71;
    [v60 bounds];
    float v74 = (v73 - v70) * 0.5;
    double v75 = floorf(v74);
    v106.origin.x = 0.0;
    v106.origin.y = v49;
    v106.size.width = v51;
    v106.size.height = 44.0;
    -[SKUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v75, CGRectGetMaxY(v106) + 30.0, v70, v72);
    [v60 addSubview:self->_passbookLockup];
  }
  [(SKUILinkButton *)v54 sizeToFit];
  [(SKUILinkButton *)v54 frame];
  double v77 = v76;
  double v79 = v78;
  [v60 bounds];
  double v81 = v80;
  v82 = self->_passbookLockup;
  if (v82)
  {
    [(SKUIRedeemITunesPassLockup *)v82 frame];
    CGFloat v52 = v83;
    double v49 = v84;
    CGFloat v51 = v85;
    CGFloat v53 = v86;
    double v87 = 30.0;
  }
  else
  {
    double v87 = 26.0;
  }
  v107.origin.x = v52;
  v107.origin.y = v49;
  v107.size.width = v51;
  v107.size.height = v53;
  CGFloat v88 = CGRectGetMaxY(v107) + v87;
  float v89 = (v81 - v77) * 0.5;
  -[SKUILinkButton setFrame:](v54, "setFrame:", floorf(v89), v88, v77, v79);
  [v60 addSubview:v54];
  v90 = [(SKUIRedeemInputViewController *)self navigationItem];
  [v90 setHidesBackButton:1];
  id v91 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v91 setAction:sel__cancelAction_];
  [v91 setTarget:self];
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_CANCEL_BUTTON" inTable:@"Redeem"];
  }
  else {
  v92 = +[SKUIClientContext localizedStringForKey:@"REDEEM_CANCEL_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [v91 setTitle:v92];

  [v90 setLeftBarButtonItem:v91];
  v93 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB14A8]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v93;

  [(UIBarButtonItem *)self->_redeemButton setAction:sel__redeemAction_];
  [(UIBarButtonItem *)self->_redeemButton setTarget:self];
  v95 = self->_redeemButton;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_REDEEM_BUTTON" inTable:@"Redeem"];
  }
  else {
  v96 = +[SKUIClientContext localizedStringForKey:@"REDEEM_REDEEM_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [(UIBarButtonItem *)v95 setTitle:v96];

  [(UIBarButtonItem *)self->_redeemButton setStyle:2];
  v97 = self->_redeemButton;
  v98 = [(SKUIRedeemTextField *)self->_field text];
  -[UIBarButtonItem setEnabled:](v97, "setEnabled:", [v98 length] != 0);

  v103[0] = self->_redeemButton;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
  [v90 setRightBarButtonItems:v99];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)_redeemConfigurationImagesDidLoad:(id)a3
{
  imageView = self->_imageView;
  id v5 = [(SKUIRedeemStepViewController *)self configuration];
  objc_super v4 = [v5 inputImage];
  [(UIImageView *)imageView setImage:v4];
}

- (void)_textFieldTextDidChange:(id)a3
{
  redeemButton = self->_redeemButton;
  id v4 = [(SKUIRedeemTextField *)self->_field text];
  -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", [v4 length] != 0);
}

- (void)_cancelAction:(id)a3
{
  id v4 = [(SKUIRedeemInputViewController *)self parentViewController];
  id v5 = v4;
  if (!v4) {
    id v4 = self;
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_passbookLockupAction:(id)a3
{
  double v8 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreViewController);
  id v4 = [(SKUIRedeemStepViewController *)self clientContext];
  [(SKUIRedeemStepViewController *)v8 setClientContext:v4];

  id v5 = [(SKUIRedeemStepViewController *)self configuration];
  [(SKUIRedeemStepViewController *)v8 setConfiguration:v5];

  v6 = [(SKUIRedeemStepViewController *)self operationQueue];
  [(SKUIRedeemStepViewController *)v8 setOperationQueue:v6];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [(SKUIRedeemInputViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_redeemAction:(id)a3
{
  [(SKUIRedeemTextField *)self->_field resignFirstResponder];
  UIKeyboardOrderOutAutomatic();
  [(SKUIRedeemInputViewController *)self _toggleActivityIndicatorBarButtonItem:1];
  id v4 = [SKUIRedeemOperation alloc];
  id v5 = [(SKUIRedeemTextField *)self->_field text];
  v6 = [(SKUIRedeemOperation *)v4 initWithCode:v5];

  [(SKUIRedeemOperation *)v6 setCameraRecognized:0];
  double v7 = [(SKUIRedeemStepViewController *)self clientContext];
  [(SKUIRedeemOperation *)v6 setClientContext:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIRedeemInputViewController__redeemAction___block_invoke;
  v9[3] = &unk_1E6425BC8;
  v9[4] = self;
  [(SKUIRedeemOperation *)v6 setResultBlock:v9];
  double v8 = [(SKUIRedeemStepViewController *)self operationQueue];
  [v8 addOperation:v6];
}

void __47__SKUIRedeemInputViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (v5)
  {
    double v8 = [[SKUIRedeemResultsViewController alloc] initWithRedeem:v5];
    double v9 = [*(id *)(a1 + 32) clientContext];
    [(SKUIRedeemStepViewController *)v8 setClientContext:v9];

    double v10 = [*(id *)(a1 + 32) configuration];
    [(SKUIRedeemStepViewController *)v8 setConfiguration:v10];

    v11 = [*(id *)(a1 + 32) operationQueue];
    [(SKUIRedeemStepViewController *)v8 setOperationQueue:v11];

    [(SKUIRedeemResultsViewController *)v8 setRedeemCategory:*(void *)(*(void *)(a1 + 32) + 1008)];
    uint64_t v12 = [*(id *)(a1 + 32) navigationController];
    [v12 pushViewController:v8 animated:1];

    UIKeyboardOrderOutAutomatic();
LABEL_3:

    goto LABEL_4;
  }
  if (v6)
  {
    double v13 = [v6 userInfo];
    double v14 = [v13 valueForKey:@"hideError"];

    if (!v14)
    {
      v15 = [*(id *)(a1 + 32) clientContext];
      double v8 = v15;
      id v16 = (void *)MEMORY[0x1E4FB1418];
      if (v15) {
        [(SKUIRedeemResultsViewController *)v15 localizedStringForKey:@"REDEEM_FAILURE_TITLE" inTable:@"Redeem"];
      }
      else {
      v17 = +[SKUIClientContext localizedStringForKey:@"REDEEM_FAILURE_TITLE" inBundles:0 inTable:@"Redeem"];
      }
      v18 = [v7 localizedDescription];
      v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:1];

      if ([v7 code] == 9518)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__SKUIRedeemInputViewController__redeemAction___block_invoke_2;
        aBlock[3] = &unk_1E6425BA0;
        aBlock[4] = *(void *)(a1 + 32);
        v20 = _Block_copy(aBlock);
      }
      else
      {
        v20 = 0;
      }
      v21 = (void *)MEMORY[0x1E4FB1410];
      if (v8) {
        [(SKUIRedeemResultsViewController *)v8 localizedStringForKey:@"REDEEM_OK_BUTTON" inTable:@"Redeem"];
      }
      else {
      v22 = +[SKUIClientContext localizedStringForKey:@"REDEEM_OK_BUTTON" inBundles:0 inTable:@"Redeem"];
      }
      uint64_t v23 = [v21 actionWithTitle:v22 style:0 handler:v20];
      [v19 addAction:v23];

      [*(id *)(a1 + 32) presentViewController:v19 animated:1 completion:0];
      goto LABEL_3;
    }
  }
LABEL_4:
  [*(id *)(a1 + 32) _toggleActivityIndicatorBarButtonItem:0];
}

void __47__SKUIRedeemInputViewController__redeemAction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) redeemStepDelegate];
  [v2 redeemStepViewControllerShouldValidateNationalID:*(void *)(a1 + 32)];
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);
}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SKUIRedeemTextField);
  [(SKUIRedeemTextField *)v5 setAutocapitalizationType:3];
  [(SKUIRedeemTextField *)v5 setAutocorrectionType:1];
  [(SKUIRedeemTextField *)v5 setAutoresizingMask:2];
  [(SKUIRedeemTextField *)v5 setEnablesReturnKeyAutomatically:1];
  [(SKUIRedeemTextField *)v5 setReturnKeyType:9];
  id v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [(SKUIRedeemTextField *)v5 setFont:v6];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  double v9 = [(SKUIRedeemInputViewController *)self view];
  uint64_t v10 = [v9 tintColor];
  v11 = (void *)v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v10, *MEMORY[0x1E4FB0700], 0);
  }
  else
  {
    double v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
    uint64_t v12 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v13, *MEMORY[0x1E4FB0700], 0);
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v4) {
    [v4 localizedStringForKey:@"REDEEM_CODE_PLACEHOLDER" inTable:@"Redeem"];
  }
  else {
  v15 = +[SKUIClientContext localizedStringForKey:@"REDEEM_CODE_PLACEHOLDER" inBundles:0 inTable:@"Redeem"];
  }
  id v16 = (void *)[v14 initWithString:v15 attributes:v12];

  [(SKUIRedeemTextField *)v5 setAttributedPlaceholder:v16];
  return v5;
}

- (void)_toggleActivityIndicatorBarButtonItem:(BOOL)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
    [v4 startAnimating];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v4];
    id v6 = [(SKUIRedeemInputViewController *)self navigationItem];
    v9[0] = self->_redeemButton;
    v9[1] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    [v6 setRightBarButtonItems:v7];
  }
  else
  {
    id v4 = [(SKUIRedeemInputViewController *)self navigationItem];
    redeemButton = self->_redeemButton;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&redeemButton count:1];
    [v4 setRightBarButtonItems:v5];
  }
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_passbookLockup, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

- (void)initWithRedeemCategory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemInputViewController initWithRedeemCategory:]";
}

@end