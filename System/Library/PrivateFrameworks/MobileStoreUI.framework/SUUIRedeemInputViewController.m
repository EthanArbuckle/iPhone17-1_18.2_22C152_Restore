@interface SUUIRedeemInputViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)initialCode;
- (SUUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3;
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

@implementation SUUIRedeemInputViewController

- (SUUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemInputViewController;
  v4 = [(SUUIRedeemInputViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_category = a3;
    [(SUUIRedeemInputViewController *)v4 setEdgesForExtendedLayout:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:0x270508410 object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];
  [(SUUIRedeemTextField *)self->_field setDelegate:0];
  [(SUUIRedeemITunesPassLockup *)self->_passbookLockup removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v4.receiver = self;
  v4.super_class = (Class)SUUIRedeemInputViewController;
  [(SUUIRedeemInputViewController *)&v4 dealloc];
}

- (void)loadView
{
  v103[1] = *MEMORY[0x263EF8340];
  v102.receiver = self;
  v102.super_class = (Class)SUUIRedeemInputViewController;
  [(SUUIRedeemInputViewController *)&v102 loadView];
  v3 = [(SUUIRedeemStepViewController *)self clientContext];
  objc_super v4 = [(SUUIRedeemInputViewController *)self view];
  v5 = [MEMORY[0x263F825C8] whiteColor];
  [v4 setBackgroundColor:v5];

  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  v11 = [MEMORY[0x263F82670] currentDevice];
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
  v101 = [MEMORY[0x263F08A00] defaultCenter];
  imageView = self->_imageView;
  if (!imageView)
  {
    id v16 = objc_alloc(MEMORY[0x263F82828]);
    v17 = [(SUUIRedeemStepViewController *)self configuration];
    v18 = [v17 inputImage];
    v19 = (UIImageView *)[v16 initWithImage:v18];
    v20 = self->_imageView;
    self->_imageView = v19;

    [(UIImageView *)self->_imageView setAutoresizingMask:5];
    v21 = [(SUUIRedeemStepViewController *)self configuration];
    [v101 addObserver:self selector:sel__redeemConfigurationImagesDidLoad_ name:0x270508410 object:v21];

    imageView = self->_imageView;
  }
  [(UIImageView *)imageView frame];
  v22 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  double v24 = dbl_2568A12D0[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  double v25 = dbl_2568A12E0[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  [v4 frame];
  float v27 = (v26 - v25) * 0.5;
  double v28 = floorf(v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v14, v25, v24);
  [v4 addSubview:self->_imageView];
  id v29 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v29 setAutoresizingMask:2];
  v30 = [v4 backgroundColor];
  [v29 setBackgroundColor:v30];

  v31 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [v29 setFont:v31];

  if (+[SUUIRedeemViewControllerLegacy redeemRequiresNationalId:v3])
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
  v33 = +[SUUIClientContext localizedStringForKey:v32 inBundles:0 inTable:@"Redeem"];
  }
  [v29 setText:v33];

  [v29 setTextAlignment:1];
  v34 = [MEMORY[0x263F825C8] blackColor];
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
  v43 = [(SUUIRedeemInputViewController *)self _newTextFieldWithClientContext:v3];
  field = self->_field;
  self->_field = v43;

  [(SUUIRedeemTextField *)self->_field setDelegate:self];
  [(SUUIRedeemTextField *)self->_field setText:self->_initialCode];
  [(SUUIRedeemTextField *)self->_field frame];
  [v29 frame];
  double MaxY = CGRectGetMaxY(v105);
  v46 = [MEMORY[0x263F82670] currentDevice];
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
  -[SUUIRedeemTextField setFrame:](self->_field, "setFrame:", 0.0, v49);
  [v4 addSubview:self->_field];
  [v101 addObserver:self selector:sel__textFieldTextDidChange_ name:*MEMORY[0x263F83AC8] object:self->_field];
  v54 = [[SUUILinkButton alloc] initWithArrowStyle:0];
  [(SUUILinkButton *)v54 setAutoresizingMask:5];
  v100 = v4;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_TERMS_LINK" inTable:@"Redeem"];
  }
  else {
  v55 = +[SUUIClientContext localizedStringForKey:@"REDEEM_TERMS_LINK" inBundles:0 inTable:@"Redeem"];
  }
  [(SUUILinkButton *)v54 setTitle:v55 forState:0];

  v56 = [(SUUILinkButton *)v54 titleLabel];
  v57 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [v56 setFont:v57];

  v58 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
  [(SUUILinkButton *)v54 setTitleColor:v58 forState:0];

  v59 = [MEMORY[0x263F825C8] blackColor];
  [(SUUILinkButton *)v54 setTitleColor:v59 forState:1];

  [(SUUILinkButton *)v54 addTarget:self action:sel__termsButtonAction_ forControlEvents:64];
  v60 = v100;
  v61 = [v100 backgroundColor];
  [(SUUILinkButton *)v54 setBackgroundColor:v61];

  if ([(SUUIRedeemStepViewController *)self shouldShowPassbookLearnMore])
  {
    passbookLockup = self->_passbookLockup;
    if (!passbookLockup)
    {
      v63 = [SUUIRedeemITunesPassLockup alloc];
      v64 = [(SUUIRedeemStepViewController *)self configuration];
      v65 = [v64 ITunesPassConfiguration];
      v66 = [(SUUIRedeemStepViewController *)self clientContext];
      v67 = [(SUUIRedeemITunesPassLockup *)v63 initWithITunesPassConfiguration:v65 clientContext:v66];
      v68 = self->_passbookLockup;
      self->_passbookLockup = v67;

      v60 = v100;
      [(SUUIRedeemITunesPassLockup *)self->_passbookLockup addTarget:self action:sel__passbookLockupAction_ forControlEvents:64];
      [(SUUIRedeemITunesPassLockup *)self->_passbookLockup setAutoresizingMask:5];
      passbookLockup = self->_passbookLockup;
    }
    [(SUUIRedeemITunesPassLockup *)passbookLockup frame];
    -[SUUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
    double v70 = v69;
    double v72 = v71;
    [v60 bounds];
    float v74 = (v73 - v70) * 0.5;
    double v75 = floorf(v74);
    v106.origin.x = 0.0;
    v106.origin.y = v49;
    v106.size.width = v51;
    v106.size.height = 44.0;
    -[SUUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v75, CGRectGetMaxY(v106) + 30.0, v70, v72);
    [v60 addSubview:self->_passbookLockup];
  }
  [(SUUILinkButton *)v54 sizeToFit];
  [(SUUILinkButton *)v54 frame];
  double v77 = v76;
  double v79 = v78;
  [v60 bounds];
  double v81 = v80;
  v82 = self->_passbookLockup;
  if (v82)
  {
    [(SUUIRedeemITunesPassLockup *)v82 frame];
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
  -[SUUILinkButton setFrame:](v54, "setFrame:", floorf(v89), v88, v77, v79);
  [v60 addSubview:v54];
  v90 = [(SUUIRedeemInputViewController *)self navigationItem];
  [v90 setHidesBackButton:1];
  id v91 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v91 setAction:sel__cancelAction_];
  [v91 setTarget:self];
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_CANCEL_BUTTON" inTable:@"Redeem"];
  }
  else {
  v92 = +[SUUIClientContext localizedStringForKey:@"REDEEM_CANCEL_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [v91 setTitle:v92];

  [v90 setLeftBarButtonItem:v91];
  v93 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x263F824A8]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v93;

  [(UIBarButtonItem *)self->_redeemButton setAction:sel__redeemAction_];
  [(UIBarButtonItem *)self->_redeemButton setTarget:self];
  v95 = self->_redeemButton;
  if (v3) {
    [v3 localizedStringForKey:@"REDEEM_REDEEM_BUTTON" inTable:@"Redeem"];
  }
  else {
  v96 = +[SUUIClientContext localizedStringForKey:@"REDEEM_REDEEM_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [(UIBarButtonItem *)v95 setTitle:v96];

  [(UIBarButtonItem *)self->_redeemButton setStyle:2];
  v97 = self->_redeemButton;
  v98 = [(SUUIRedeemTextField *)self->_field text];
  -[UIBarButtonItem setEnabled:](v97, "setEnabled:", [v98 length] != 0);

  v103[0] = self->_redeemButton;
  v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:1];
  [v90 setRightBarButtonItems:v99];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)_redeemConfigurationImagesDidLoad:(id)a3
{
  imageView = self->_imageView;
  id v5 = [(SUUIRedeemStepViewController *)self configuration];
  objc_super v4 = [v5 inputImage];
  [(UIImageView *)imageView setImage:v4];
}

- (void)_textFieldTextDidChange:(id)a3
{
  redeemButton = self->_redeemButton;
  id v4 = [(SUUIRedeemTextField *)self->_field text];
  -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", [v4 length] != 0);
}

- (void)_cancelAction:(id)a3
{
  id v4 = [(SUUIRedeemInputViewController *)self parentViewController];
  id v5 = v4;
  if (!v4) {
    id v4 = self;
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_passbookLockupAction:(id)a3
{
  double v8 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
  id v4 = [(SUUIRedeemStepViewController *)self clientContext];
  [(SUUIRedeemStepViewController *)v8 setClientContext:v4];

  id v5 = [(SUUIRedeemStepViewController *)self configuration];
  [(SUUIRedeemStepViewController *)v8 setConfiguration:v5];

  v6 = [(SUUIRedeemStepViewController *)self operationQueue];
  [(SUUIRedeemStepViewController *)v8 setOperationQueue:v6];

  double v7 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  [(SUUIRedeemInputViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_redeemAction:(id)a3
{
  [(SUUIRedeemTextField *)self->_field resignFirstResponder];
  UIKeyboardOrderOutAutomatic();
  [(SUUIRedeemInputViewController *)self _toggleActivityIndicatorBarButtonItem:1];
  id v4 = [SUUIRedeemOperation alloc];
  id v5 = [(SUUIRedeemTextField *)self->_field text];
  v6 = [(SUUIRedeemOperation *)v4 initWithCode:v5];

  [(SUUIRedeemOperation *)v6 setCameraRecognized:0];
  double v7 = [(SUUIRedeemStepViewController *)self clientContext];
  [(SUUIRedeemOperation *)v6 setClientContext:v7];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIRedeemInputViewController__redeemAction___block_invoke;
  v9[3] = &unk_265401B40;
  v9[4] = self;
  [(SUUIRedeemOperation *)v6 setResultBlock:v9];
  double v8 = [(SUUIRedeemStepViewController *)self operationQueue];
  [v8 addOperation:v6];
}

void __47__SUUIRedeemInputViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (v5)
  {
    double v8 = [[SUUIRedeemResultsViewController alloc] initWithRedeem:v5];
    double v9 = [*(id *)(a1 + 32) clientContext];
    [(SUUIRedeemStepViewController *)v8 setClientContext:v9];

    double v10 = [*(id *)(a1 + 32) configuration];
    [(SUUIRedeemStepViewController *)v8 setConfiguration:v10];

    v11 = [*(id *)(a1 + 32) operationQueue];
    [(SUUIRedeemStepViewController *)v8 setOperationQueue:v11];

    [(SUUIRedeemResultsViewController *)v8 setRedeemCategory:*(void *)(*(void *)(a1 + 32) + 1008)];
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
      id v16 = (void *)MEMORY[0x263F82418];
      if (v15) {
        [(SUUIRedeemResultsViewController *)v15 localizedStringForKey:@"REDEEM_FAILURE_TITLE" inTable:@"Redeem"];
      }
      else {
      v17 = +[SUUIClientContext localizedStringForKey:@"REDEEM_FAILURE_TITLE" inBundles:0 inTable:@"Redeem"];
      }
      v18 = [v7 localizedDescription];
      v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:1];

      if ([v7 code] == 9518)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__SUUIRedeemInputViewController__redeemAction___block_invoke_2;
        aBlock[3] = &unk_265401390;
        aBlock[4] = *(void *)(a1 + 32);
        v20 = _Block_copy(aBlock);
      }
      else
      {
        v20 = 0;
      }
      v21 = (void *)MEMORY[0x263F82400];
      if (v8) {
        [(SUUIRedeemResultsViewController *)v8 localizedStringForKey:@"REDEEM_OK_BUTTON" inTable:@"Redeem"];
      }
      else {
      v22 = +[SUUIClientContext localizedStringForKey:@"REDEEM_OK_BUTTON" inBundles:0 inTable:@"Redeem"];
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

void __47__SUUIRedeemInputViewController__redeemAction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) redeemStepDelegate];
  [v2 redeemStepViewControllerShouldValidateNationalID:*(void *)(a1 + 32)];
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(NSURL, "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);
}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SUUIRedeemTextField);
  [(SUUIRedeemTextField *)v5 setAutocapitalizationType:3];
  [(SUUIRedeemTextField *)v5 setAutocorrectionType:1];
  [(SUUIRedeemTextField *)v5 setAutoresizingMask:2];
  [(SUUIRedeemTextField *)v5 setEnablesReturnKeyAutomatically:1];
  [(SUUIRedeemTextField *)v5 setReturnKeyType:9];
  id v6 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [(SUUIRedeemTextField *)v5 setFont:v6];
  id v7 = objc_alloc(NSDictionary);
  uint64_t v8 = *MEMORY[0x263F814F0];
  double v9 = [(SUUIRedeemInputViewController *)self view];
  uint64_t v10 = [v9 tintColor];
  v11 = (void *)v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v10, *MEMORY[0x263F81500], 0);
  }
  else
  {
    double v13 = [MEMORY[0x263F825C8] colorWithWhite:0.7 alpha:1.0];
    uint64_t v12 = objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v13, *MEMORY[0x263F81500], 0);
  }
  id v14 = objc_alloc(MEMORY[0x263F086A0]);
  if (v4) {
    [v4 localizedStringForKey:@"REDEEM_CODE_PLACEHOLDER" inTable:@"Redeem"];
  }
  else {
  v15 = +[SUUIClientContext localizedStringForKey:@"REDEEM_CODE_PLACEHOLDER" inBundles:0 inTable:@"Redeem"];
  }
  id v16 = (void *)[v14 initWithString:v15 attributes:v12];

  [(SUUIRedeemTextField *)v5 setAttributedPlaceholder:v16];
  return v5;
}

- (void)_toggleActivityIndicatorBarButtonItem:(BOOL)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
    [v4 startAnimating];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v4];
    id v6 = [(SUUIRedeemInputViewController *)self navigationItem];
    v9[0] = self->_redeemButton;
    v9[1] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    [v6 setRightBarButtonItems:v7];
  }
  else
  {
    id v4 = [(SUUIRedeemInputViewController *)self navigationItem];
    redeemButton = self->_redeemButton;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&redeemButton count:1];
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

@end