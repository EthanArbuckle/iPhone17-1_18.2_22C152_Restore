@interface PKPassFooterContentView
- (BOOL)isInvalidated;
- (BOOL)isPassAuthorized;
- (BOOL)isPhysicalButtonRequired;
- (BOOL)requestPileSuppression;
- (CGRect)infoButtonFrame;
- (PKLinkedAppIconView)appIconView;
- (PKPass)pass;
- (PKPassFooterContentView)init;
- (PKPassFooterContentView)initWithCoder:(id)a3;
- (PKPassFooterContentView)initWithFrame:(CGRect)a3;
- (PKPassFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4;
- (PKPassFooterContentViewDelegate)delegate;
- (PKPaymentPass)paymentPass;
- (PKSecureElementPass)secureElementPass;
- (UIView)bottomRule;
- (double)infoButtonAlpha;
- (id)_buttonWithTitle:(id)a3 action:(id)a4;
- (int64_t)coachingState;
- (int64_t)style;
- (void)_infoButtonPressed:(id)a3;
- (void)_setCoachingState:(int64_t)a3;
- (void)_setPhysicalButtonRequired:(BOOL)a3;
- (void)_setRequestPileSuppression:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setInfoButtonAlpha:(double)a3;
@end

@implementation PKPassFooterContentView

- (PKPassFooterContentView)init
{
  return 0;
}

- (PKPassFooterContentView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPassFooterContentView)initWithCoder:(id)a3
{
  return 0;
}

- (PKPassFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKPassFooterContentView;
  v9 = -[PKPassFooterContentView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  p_pass = (id *)&v9->_pass;
  objc_storeStrong((id *)&v9->_pass, a3);
  if (*p_pass)
  {
    if ([*p_pass passType] == 1)
    {
      objc_storeStrong((id *)&v10->_secureElementPass, *p_pass);
      if (v8 && [v8 isFieldDetect] && objc_msgSend(v8, "terminalType") == 4) {
        goto LABEL_12;
      }
      v12 = [*p_pass barcodeSettings];

      if (v12)
      {
        uint64_t v13 = 3;
        goto LABEL_14;
      }
      v14 = [(PKSecureElementPass *)v10->_secureElementPass devicePrimaryContactlessPaymentApplication];
      uint64_t v15 = [v14 requiresConsentForDataRelease];

      if (v15) {
LABEL_12:
      }
        uint64_t v13 = 4;
      else {
        uint64_t v13 = [*p_pass style] == 7;
      }
    }
    else
    {
      uint64_t v13 = 2;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_14:
  v10->_int64_t style = v13;
  v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  bottomRule = v10->_bottomRule;
  v10->_bottomRule = v16;

  v18 = v10->_bottomRule;
  v19 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)v18 setBackgroundColor:v19];

  v20 = PKUIBigInfoButtonImageWithDefaultConfiguration();
  v21 = (void *)MEMORY[0x1E4FB14D8];
  v22 = [v20 configuration];
  v23 = [MEMORY[0x1E4FB1618] labelColor];
  v24 = objc_msgSend(v21, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v20, v22, v23);

  objc_initWeak(&location, v10);
  v25 = (void *)MEMORY[0x1E4FB13F0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke;
  v35[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v36, &location);
  v26 = [v25 actionWithHandler:v35];
  uint64_t v27 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v24 primaryAction:v26];
  infoButton = v10->_infoButton;
  v10->_infoButton = (UIButton *)v27;

  [(UIButton *)v10->_infoButton setConfigurationUpdateHandler:&__block_literal_global_211];
  uint64_t v29 = *MEMORY[0x1E4FB27D0];
  [(UIButton *)v10->_infoButton setMaximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  [(UIButton *)v10->_infoButton setMinimumContentSizeCategory:v29];
  [(UIButton *)v10->_infoButton sizeToFit];
  int64_t style = v10->_style;
  if (style && style != 3 && PKRunningInRemoteContext())
  {
    v31 = [[PKLinkedApplication alloc] initWithPass:v7];
    [(PKLinkedApplication *)v31 setUseSmallIcon:1];
    v32 = [[PKLinkedAppIconView alloc] initWithLinkedApplication:v31];
    appIconView = v10->_appIconView;
    v10->_appIconView = v32;

    [(PKLinkedAppIconView *)v10->_appIconView setAlpha:0.0];
    [(PKPassFooterContentView *)v10 addSubview:v10->_bottomRule];
    [(PKPassFooterContentView *)v10 addSubview:v10->_appIconView];
    [(PKPassFooterContentView *)v10 addSubview:v10->_infoButton];
  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_19:
  return v10;
}

void __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained _infoButtonPressed:v4];
}

void __60__PKPassFooterContentView_initWithPass_presentationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(PKPassFooterContentView *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPassFooterContentView;
  [(PKPassFooterContentView *)&v3 dealloc];
}

- (void)setInfoButtonAlpha:(double)a3
{
}

- (double)infoButtonAlpha
{
  [(UIButton *)self->_infoButton alpha];
  return result;
}

- (CGRect)infoButtonFrame
{
  [(UIButton *)self->_infoButton frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (PKPaymentPass)paymentPass
{
  return (PKPaymentPass *)self->_secureElementPass;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)PKPassFooterContentView;
  [(PKPassFooterContentView *)&v39 layoutSubviews];
  [(PKPassFooterContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = PKUIGetMinScreenWidthType();
  double v12 = 4.0;
  if (!v11) {
    double v12 = 20.0;
  }
  double v13 = v4 + v12;
  double v14 = v6 + 0.0;
  double v15 = 40.0;
  if (v11) {
    double v15 = 8.0;
  }
  double v16 = v8 - v15;
  int v17 = [(PKPassFooterContentView *)self _shouldReverseLayoutDirection];
  v40.origin.x = v4;
  v40.origin.y = v6;
  double v18 = v10 + -27.0;
  v40.size.width = v8;
  v40.size.height = v10;
  double MaxY = CGRectGetMaxY(v40);
  double v34 = PKUIPixelLength();
  double v38 = PKUIPixelLength();
  [(PKLinkedAppIconView *)self->_appIconView intrinsicContentSize];
  double v21 = v20;
  double v37 = v22;
  double v23 = v13;
  if (v17)
  {
    v41.origin.x = v13;
    v41.origin.y = v14;
    v41.size.width = v16;
    v41.size.height = v10 + -27.0;
    double v23 = CGRectGetMaxX(v41) - v21;
  }
  double v35 = v23;
  double v36 = v21;
  v42.origin.x = v13;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v10 + -27.0;
  double v24 = CGRectGetMaxY(v42);
  [(UIButton *)self->_infoButton frame];
  CGFloat v32 = v25;
  double v33 = v26;
  double v28 = v27;
  double v29 = v13;
  if ((v17 & 1) == 0)
  {
    v43.origin.x = v13;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    double v29 = CGRectGetMaxX(v43) - v28;
  }
  v44.origin.y = v14;
  v44.origin.x = v13;
  v44.size.width = v16;
  v44.size.height = v18;
  double v30 = CGRectGetMaxY(v44);
  v45.origin.x = v29;
  v45.size.width = v28;
  v45.origin.y = v32;
  v45.size.height = v33;
  double v31 = v30 - CGRectGetHeight(v45);
  -[UIView setFrame:](self->_bottomRule, "setFrame:", v13, MaxY + -60.0 - v34, v16, v38);
  -[PKLinkedAppIconView setFrame:](self->_appIconView, "setFrame:", v35, v24 - v37, v36, v37);
  -[UIButton setFrame:](self->_infoButton, "setFrame:", v29, v31, v28, v33);
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(PKPassFooterContentView *)self _didInvalidate];
  }
}

- (BOOL)isPassAuthorized
{
  return 0;
}

- (void)_setPhysicalButtonRequired:(BOOL)a3
{
  if (((!self->_physicalButtonRequired ^ a3) & 1) == 0)
  {
    self->_physicalButtonRequired = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passFooterContentViewDidChangePhysicalButtonRequirement:self];
  }
}

- (void)_setCoachingState:(int64_t)a3
{
  if (self->_coachingState != a3)
  {
    self->_coachingState = a3;
    [(PKPassFooterContentView *)self coachingStateDidChange];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passFooterContentViewDidChangeCoachingState:self];
  }
}

- (void)_setRequestPileSuppression:(BOOL)a3
{
  if (self->_requestPileSuppression != a3)
  {
    self->_requestPileSuppression = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v5 = WeakRetained;
    if (WeakRetained)
    {
      double v7 = WeakRetained;
      char v6 = objc_opt_respondsToSelector();
      double v5 = v7;
      if (v6)
      {
        [v7 passFooterContentViewDidChangePileSuppressionRequirement:self];
        double v5 = v7;
      }
    }
  }
}

- (void)_infoButtonPressed:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F84E10], "sharedService", a3);
  double v5 = [v4 peerPaymentService];
  char v6 = [v5 account];
  double v7 = [v6 associatedPassUniqueID];

  double v8 = [(PKPass *)self->_pass uniqueID];
  double v9 = [(UIView *)self pkui_viewControllerFromResponderChain];
  if (PKStoreDemoModeEnabled())
  {
    id v10 = v7;
    id v11 = v8;
    if (v10 == v11)
    {

LABEL_11:
      double v15 = PKUIStoreDemoGatewayViewController();
      [v9 presentViewController:v15 animated:1 completion:0];

      goto LABEL_26;
    }
    double v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
    }
    else
    {
      int v14 = [v10 isEqualToString:v11];

      if (v14) {
        goto LABEL_11;
      }
    }
  }
  if (self->_style == 2)
  {
    double v16 = [[PKBarcodePassDetailViewController alloc] initWithPass:self->_pass];
    [(PKBarcodePassDetailViewController *)v16 setShowDoneButton:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v18 = [WeakRetained suppressedContentForContentView:self];
    }
    else
    {
      double v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Assuming all sensitive content is suppressed.", buf, 2u);
      }

      uint64_t v18 = 275;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKPassFooterContentView__infoButtonPressed___block_invoke;
    aBlock[3] = &unk_1E59DE2C8;
    id v23 = v9;
    id v37 = v23;
    double v24 = (void (**)(void))_Block_copy(aBlock);
    [(PKBarcodePassDetailViewController *)v16 setSuppressedContent:v18];
    double v25 = v24[2](v24);
    [(PKBarcodePassDetailViewController *)v16 setDeleteOverrider:v25];

    double v26 = [[PKNavigationController alloc] initWithRootViewController:v16];
    [v23 presentViewController:v26 animated:1 completion:0];
  }
  else
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    objc_opt_class();
    double v34 = v8;
    double v35 = v7;
    if (objc_opt_isKindOfClass())
    {
      double v21 = [v9 groupsController];
    }
    else
    {
      double v21 = 0;
    }
    double v27 = [PKPaymentPassDetailViewController alloc];
    double v28 = [(PKPassFooterContentView *)self paymentPass];
    double v29 = [MEMORY[0x1E4F84D50] sharedService];
    double v30 = [MEMORY[0x1E4F84E10] sharedService];
    double v31 = [(PKPaymentPassDetailViewController *)v27 initWithPass:v28 group:0 groupsController:v21 webService:v29 peerPaymentWebService:v30 style:0 passLibraryDataProvider:v19 paymentServiceDataProvider:v20];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v32 = [v9 groupStackView];
      [(PKPaymentPassDetailViewController *)v31 setDeleteOverrider:v32];
    }
    double v33 = [[PKNavigationController alloc] initWithRootViewController:v31];
    [v9 presentViewController:v33 animated:1 completion:0];

    double v8 = v34;
    double v7 = v35;
  }
LABEL_26:
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C60], 0);
}

id __46__PKPassFooterContentView__infoButtonPressed___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [*(id *)(a1 + 32) groupStackView];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = *(id *)(a1 + 32);
    }
    else {
      id v2 = 0;
    }
  }

  return v2;
}

- (id)_buttonWithTitle:(id)a3 action:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4FB14D8];
  char v6 = (void *)MEMORY[0x1E4FB08E0];
  double v7 = (void *)*MEMORY[0x1E4FB2798];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(v6, "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory(v7, 18.0));
  id v11 = objc_msgSend(v5, "pkui_plainConfigurationWithTitle:font:", v9, v10);

  double v12 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v11 primaryAction:v8];

  [v12 setConfigurationUpdateHandler:&__block_literal_global_38_0];
  [v12 sizeToFit];

  return v12;
}

void __51__PKPassFooterContentView__buttonWithTitle_action___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  double v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  double v4 = [v2 titleLabel];
  [v4 setLineBreakMode:4];

  id v5 = [v2 titleLabel];

  [v5 setMinimumScaleFactor:0.5];
}

- (int64_t)style
{
  return self->_style;
}

- (PKPassFooterContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassFooterContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (PKLinkedAppIconView)appIconView
{
  return self->_appIconView;
}

- (UIView)bottomRule
{
  return self->_bottomRule;
}

- (BOOL)isPhysicalButtonRequired
{
  return self->_physicalButtonRequired;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)requestPileSuppression
{
  return self->_requestPileSuppression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRule, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end