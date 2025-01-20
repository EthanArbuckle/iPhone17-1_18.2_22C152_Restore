@interface PKEducationViewController
+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4;
+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4 reason:(id *)a5;
+ (id)assetBackgroundColor;
+ (id)assetBackgroundColorPad;
- (BOOL)_canShowWhileLocked;
- (BOOL)suppressFieldDetect;
- (NSString)bodyAddition;
- (NSString)titleOverride;
- (PKEducationViewController)init;
- (PKEducationViewController)initWithPaymentPass:(id)a3 setupContext:(int64_t)a4 educationContext:(unint64_t)a5;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)_heroPadImage;
- (id)continueHandler;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)performContinue;
- (void)setBodyAddition:(id)a3;
- (void)setContinueHandler:(id)a3;
- (void)setReporter:(id)a3;
- (void)setTitleOverride:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKEducationViewController

+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4
{
  return [a1 shouldPresentForPass:a3 inEducationContext:a4 reason:0];
}

+ (BOOL)shouldPresentForPass:(id)a3 inEducationContext:(unint64_t)a4 reason:(id *)a5
{
  id v7 = a3;
  char v8 = PKForceCardEducation();
  BOOL v9 = 1;
  if (!a4 && (v8 & 1) == 0)
  {
    if (PKHasSeenApplePayEducation())
    {
      if (a5)
      {
        v10 = @"user has already seen education";
LABEL_20:
        BOOL v9 = 0;
        *a5 = v10;
        goto LABEL_30;
      }
    }
    else
    {
      int v11 = PKIsPhone();
      if (v11 & 1) != 0 || PKIsPad() && (PKPearlIsAvailable())
      {
        if ([v7 isTransitPass])
        {
          if (a5)
          {
            v10 = @"pass is transit pass";
            goto LABEL_20;
          }
        }
        else if ([v7 isAccessPass])
        {
          if (a5)
          {
            v10 = @"pass is access pass";
            goto LABEL_20;
          }
        }
        else if ([v7 isAppleBalancePass])
        {
          if (a5)
          {
            v10 = @"pass is apple balance";
            goto LABEL_20;
          }
        }
        else
        {
          if (!v11) {
            goto LABEL_26;
          }
          v12 = [v7 devicePrimaryContactlessPaymentApplication];

          if (!v12)
          {
            if (a5)
            {
              v10 = @"pass doesn't support contactless transaction";
              goto LABEL_20;
            }
            goto LABEL_29;
          }
          v13 = [v7 issuerCountryCode];
          int v14 = [v13 isEqualToString:@"JP"];

          if (!v14)
          {
LABEL_26:
            BOOL v9 = 1;
            goto LABEL_30;
          }
          if (a5)
          {
            v10 = @"pass has Japan issuer";
            goto LABEL_20;
          }
        }
      }
      else if (a5)
      {
        v10 = @"device does not have expected biometric authentication type";
        goto LABEL_20;
      }
    }
LABEL_29:
    BOOL v9 = 0;
  }
LABEL_30:

  return v9;
}

+ (id)assetBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.843137255 green:0.843137255 blue:0.843137255 alpha:1.0];
}

+ (id)assetBackgroundColorPad
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.831372549 green:0.831372549 blue:0.831372549 alpha:1.0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKEducationViewController)init
{
  return [(PKEducationViewController *)self initWithPaymentPass:0 setupContext:0 educationContext:0];
}

- (PKEducationViewController)initWithPaymentPass:(id)a3 setupContext:(int64_t)a4 educationContext:(unint64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKEducationViewController;
  v10 = [(PKExplanationViewController *)&v17 initWithContext:a4];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_paymentPass, a3);
    v11->_educationContext = a5;
    int IsAvailable = PKPearlIsAvailable();
    unint64_t biometricAuthenticationType = v11->_biometricAuthenticationType;
    if (IsAvailable)
    {
      uint64_t v14 = biometricAuthenticationType | 2;
    }
    else
    {
      if (biometricAuthenticationType)
      {
LABEL_7:
        v15 = [(PKEducationViewController *)v11 navigationItem];
        [v15 setHidesBackButton:1 animated:0];

        [(PKExplanationViewController *)v11 setShowDoneButton:0];
        [(PKExplanationViewController *)v11 setShowCancelButton:0];
        goto LABEL_8;
      }
      uint64_t v14 = 1;
    }
    v11->_unint64_t biometricAuthenticationType = v14;
    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (void)dealloc
{
  [(PKEducationViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKEducationViewController;
  [(PKEducationViewController *)&v3 dealloc];
}

- (void)loadView
{
  v63[1] = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)PKEducationViewController;
  [(PKExplanationViewController *)&v59 loadView];
  BOOL v3 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  if (v3)
  {
    v4 = [(PKEducationViewController *)self traitCollection];
    BOOL v5 = [v4 userInterfaceIdiom] != 6;
  }
  else
  {
    BOOL v5 = 0;
  }
  v6 = [(PKExplanationViewController *)self explanationView];
  [v6 setDelegate:self];
  [v6 setShowPrivacyView:0];
  id v7 = objc_alloc_init(PKEducationPhone);
  educationBodyView = self->_educationBodyView;
  self->_educationBodyView = v7;

  if (self->_educationContext)
  {
    if (v3) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
  id v9 = PKLocalizedPaymentString(&cfstr_ApplePayEducat.isa);
  [v6 setTitleText:v9];

  [v6 setTitleImage:0];
  uint64_t v56 = *MEMORY[0x1E4FB0700];
  uint64_t v62 = *MEMORY[0x1E4FB0700];
  v10 = [MEMORY[0x1E4FB1618] labelColor];
  v63[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"APPLE_PAY_EDUCATION"];
  v13 = v12;
  unint64_t biometricAuthenticationType = self->_biometricAuthenticationType;
  if (biometricAuthenticationType)
  {
    [v12 appendString:@"_TOUCH_ID"];
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    if ((biometricAuthenticationType & 2) == 0) {
      goto LABEL_13;
    }
    [v12 appendString:@"_FACE_ID"];
    if (!v5) {
      goto LABEL_13;
    }
  }
  [v13 appendString:@"_PAD"];
LABEL_13:
  id v15 = objc_alloc(MEMORY[0x1E4F28E48]);
  v16 = PKLocalizedPaymentString((NSString *)v13);
  objc_super v17 = (void *)[v15 initWithString:v16 attributes:v11];

  NSUInteger v18 = [(NSString *)self->_bodyAddition length];
  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  v20 = v19;
  if (v18)
  {
    v21 = (void *)[v19 initWithString:self->_bodyAddition attributes:v11];
  }
  else
  {
    v22 = PKLocalizedPaymentString(&cfstr_ApplePayEducat_1.isa);
    v21 = (void *)[v20 initWithString:v22 attributes:v11];
  }
  v23 = (void *)v11;
  [v17 appendAttributedString:v21];

  if (v3)
  {
    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    largeLayoutHeroBackground = self->_largeLayoutHeroBackground;
    self->_largeLayoutHeroBackground = v24;

    v26 = self->_largeLayoutHeroBackground;
    v27 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UIView *)v26 setBackgroundColor:v27];

    id v28 = objc_alloc(MEMORY[0x1E4FB1838]);
    v29 = [(PKEducationViewController *)self _heroPadImage];
    v30 = (UIImageView *)[v28 initWithImage:v29];
    largeLayoutHeroImageView = self->_largeLayoutHeroImageView;
    self->_largeLayoutHeroImageView = v30;

    [(UIImageView *)self->_largeLayoutHeroImageView setContentMode:1];
    v23 = (void *)v11;
    [(UIView *)self->_largeLayoutHeroBackground addSubview:self->_largeLayoutHeroImageView];
    v32 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v6 setTopBackgroundColor:v32];

    [v6 setTopMargin:44.0];
    [v6 setHeroView:self->_largeLayoutHeroBackground];
  }
  else
  {
    [v6 setBodyView:self->_educationBodyView];
    [v6 setHeroView:0];
    [v6 setImage:0];
    [v6 setBodyViewPadding:0.0];
    uint64_t v33 = PKUIGetMinScreenWidthType();
    double v34 = 20.0;
    if (!v33) {
      double v34 = 0.0;
    }
    [v6 setTopLogoPadding:v34];
    [(PKExplanationViewController *)self context];
    if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
    {
      id v55 = objc_alloc(MEMORY[0x1E4F28B18]);
      v35 = PKLocalizedPaymentString(&cfstr_LearnMoreLink.isa);
      v60[0] = v56;
      [MEMORY[0x1E4FB1618] linkColor];
      v57 = v13;
      v37 = v36 = (void *)v11;
      v61[0] = v37;
      v60[1] = *MEMORY[0x1E4FB0720];
      v38 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT201239"];
      v61[1] = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      v54 = (void *)[v55 initWithString:v35 attributes:v39];

      v23 = v36;
      v13 = v57;

      v40 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v23];
      [v17 appendAttributedString:v40];

      [v17 appendAttributedString:v54];
    }
  }
  v41 = objc_msgSend(v17, "copy", v54);
  [v6 setAttributedBodyText:v41];

  if (!v3)
  {
LABEL_23:
    paymentPass = self->_paymentPass;
    if (paymentPass)
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __37__PKEducationViewController_loadView__block_invoke;
      v58[3] = &unk_1E59CA7D0;
      v58[4] = self;
      [(PKSecureElementPass *)paymentPass loadContentAsyncWithCompletion:v58];
    }
    else
    {
      v43 = [MEMORY[0x1E4F84AC0] defaultImages];
      v44 = objc_msgSend(v43, "pk_shuffledArray");
      v45 = [v44 firstObject];

      v46 = self->_educationBodyView;
      v47 = (void *)MEMORY[0x1E4FB1818];
      v48 = [v45 imageWithScale:PKUIScreenScale()];
      v49 = [v47 imageWithData:v48];
      [(PKEducationPhone *)v46 setPassImage:v49];
    }
  }
LABEL_26:
  v50 = [v6 dockView];
  v51 = [v50 primaryButton];
  v52 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v51 setTitle:v52 forState:0];

  v53 = [v50 footerView];
  [v53 setSkipCardButton:0];
  [v53 setSetupLaterButton:0];
  [v53 setManualEntryButton:0];
}

uint64_t __37__PKEducationViewController_loadView__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 1064);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PKEducationViewController_loadView__block_invoke_2;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = v1;
  return [v2 loadImageSetAsync:0 preheat:1 withCompletion:v4];
}

void __37__PKEducationViewController_loadView__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PKEducationViewController_loadView__block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__PKEducationViewController_loadView__block_invoke_3(uint64_t a1)
{
  BOOL v3 = [[PKPassView alloc] initWithPass:*(void *)(*(void *)(a1 + 32) + 1064) content:5 suppressedContent:887];
  v2 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v3, "snapshotOfFrontFaceWithRequestedSize:", 220.0, 134.0);
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 1080) setPassImage:v2];
  }
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKEducationViewController;
  [(PKExplanationViewController *)&v9 viewWillLayoutSubviews];
  if (self->_largeLayoutHeroBackground && self->_largeLayoutHeroImageView)
  {
    BOOL v3 = [(PKEducationViewController *)self traitCollection];
    if ([v3 userInterfaceIdiom] != 6)
    {
      v4 = [(PKEducationViewController *)self traitCollection];
      [v4 verticalSizeClass];
    }
    BOOL v5 = [(PKEducationViewController *)self view];
    [v5 bounds];
    double Width = CGRectGetWidth(v10);

    [(UIImageView *)self->_largeLayoutHeroImageView frame];
    PKSizeAspectFit();
    -[UIView setFrame:](self->_largeLayoutHeroBackground, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), Width, v7);
    PKContentAlignmentMake();
    largeLayoutHeroImageView = self->_largeLayoutHeroImageView;
    [(UIView *)self->_largeLayoutHeroBackground bounds];
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](largeLayoutHeroImageView, "setFrame:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKEducationViewController;
  [(PKEducationViewController *)&v6 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKEducationViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __43__PKEducationViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1080) startAnimation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKEducationViewController;
  [(PKEducationViewController *)&v11 viewWillAppear:a3];
  dispatch_time_t v4 = [(PKEducationViewController *)self navigationController];
  BOOL v5 = [(PKEducationViewController *)self navigationItem];
  if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    objc_super v6 = [v5 leftBarButtonItem];
    if (v6)
    {
    }
    else
    {
      double v7 = [v5 rightBarButtonItem];

      if (!v7)
      {
        self->_wasNavigationBarHidden = [v4 isNavigationBarHidden];
        [v4 setNavigationBarHidden:1];
        char v8 = [(PKExplanationViewController *)self explanationView];
        objc_super v9 = v8;
        double v10 = 20.0;
        goto LABEL_6;
      }
    }
  }
  char v8 = [(PKExplanationViewController *)self explanationView];
  objc_super v9 = v8;
  double v10 = 0.0;
LABEL_6:
  [v8 setTopMargin:v10];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKEducationViewController;
  [(PKEducationViewController *)&v5 viewWillDisappear:a3];
  if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    dispatch_time_t v4 = [(PKEducationViewController *)self navigationController];
    [v4 setNavigationBarHidden:self->_wasNavigationBarHidden];
  }
}

- (BOOL)suppressFieldDetect
{
  return 1;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v6 = *MEMORY[0x1E4F86BA0];
  v7[0] = *MEMORY[0x1E4F86BA8];
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:0 context:v5];

  [(PKEducationViewController *)self performContinue];
}

- (void)performContinue
{
  BOOL v3 = (void (**)(void *, void *))_Block_copy(self->_continueHandler);
  id continueHandler = self->_continueHandler;
  self->_id continueHandler = 0;

  if (v3)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__PKEducationViewController_performContinue__block_invoke;
    v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, &location);
    v3[2](v3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKEducationViewController *)self invalidate];
  }
}

void __44__PKEducationViewController_performContinue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained invalidate];
    id WeakRetained = v2;
  }
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134349056;
      objc_super v5 = self;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKFieldDetectEducationViewController (%{public}p): invalidated.", (uint8_t *)&v4, 0xCu);
    }

    self->_invalidated = 1;
  }
}

- (id)_heroPadImage
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"EducationPad"];
  int v4 = v3;
  if ((self->_biometricAuthenticationType & 2) != 0) {
    [v3 appendString:@"-FaceID"];
  }
  objc_super v5 = [v4 stringByAppendingString:@"-Dark"];
  uint64_t v6 = PKUIDynamicImageNamed(v4, v5);

  return v6;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(PKEducationViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
}

- (NSString)bodyAddition
{
  return self->_bodyAddition;
}

- (void)setBodyAddition:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_bodyAddition, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_educationBodyView, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_largeLayoutHeroImageView, 0);
  objc_storeStrong((id *)&self->_largeLayoutHeroBackground, 0);

  objc_storeStrong((id *)&self->_heroImageController, 0);
}

@end