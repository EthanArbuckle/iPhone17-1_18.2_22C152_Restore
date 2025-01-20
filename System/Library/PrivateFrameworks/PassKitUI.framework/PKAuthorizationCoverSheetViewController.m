@interface PKAuthorizationCoverSheetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isErrorRecovery;
- (PKAuthorizationCoverSheetViewController)initWithDelegate:(id)a3 authenticator:(id)a4 source:(int64_t)a5;
- (id)_genericBiometricFailureLabelAccessibilityLabel:(BOOL)a3;
- (id)_genericBiometricLabelAccessibilityLabel:(BOOL)a3;
- (id)_genericBiometricUnavailableLabelAccessibilityLabel:(BOOL)a3;
- (id)_passcodeLabelAccessibilityLabel:(BOOL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateInPasscodeViewController;
- (void)_fallbackToPasscode;
- (void)_presentPasscodeToExitLockout;
- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)fadeInUIAnimated:(BOOL)a3 performSynchronizedAnimation:(id)a4;
- (void)fadeOutUIWithCompletion:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)setIsErrorRecovery:(BOOL)a3;
- (void)startEvaluation;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAuthorizationCoverSheetViewController

- (PKAuthorizationCoverSheetViewController)initWithDelegate:(id)a3 authenticator:(id)a4 source:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKAuthorizationCoverSheetViewController;
  v10 = [(PKAuthorizationCoverSheetViewController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v11->_authenticator, a4);
    [(PKAuthenticator *)v11->_authenticator setDelegate:v11];
    v11->_presentationSource = a5;
  }

  return v11;
}

- (void)dealloc
{
  [(PKAuthorizationCoverSheetViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKAuthorizationCoverSheetViewController;
  [(PKAuthorizationCoverSheetViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAuthorizationCoverSheetViewController;
  [(PKAuthorizationCoverSheetViewController *)&v4 viewDidAppear:a3];
  if (self->_isErrorRecovery) {
    AudioServicesPlaySystemSound(0x573u);
  }
}

- (void)loadView
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKAuthorizationCoverSheetViewController;
  [(PKAuthorizationCoverSheetViewController *)&v38 loadView];
  objc_super v3 = [(PKAuthorizationCoverSheetViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  char IsAvailable = PKSystemApertureIsAvailable();
  self->_shouldDrawGlyph = IsAvailable ^ 1;
  if ((IsAvailable & 1) == 0)
  {
    v6 = (PKGlyphView *)[objc_alloc(MEMORY[0x1E4F88120]) initWithStyle:6];
    glyphView = self->_glyphView;
    self->_glyphView = v6;

    [v3 addSubview:self->_glyphView];
  }
  v34 = PKLocalizedPaymentString(&cfstr_GenericPasscod.isa);
  v33 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], (NSString *)*MEMORY[0x1E4FB2790]);
  [v33 lineHeight];
  PKFloatRoundToPixel();
  uint64_t v35 = v8;
  long long v36 = xmmword_1A040E960;
  int64x2_t v37 = vdupq_n_s64(2uLL);
  id v9 = [[PKContinuousButton alloc] initWithConfiguration:&v35];
  enterPasscodeButton = self->_enterPasscodeButton;
  self->_enterPasscodeButton = &v9->super;

  v11 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v34, v33, 4, 1);
  objc_msgSend(v11, "setContentInsets:", 8.0, 25.0, 8.0, 25.0);
  v12 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v11 setBaseForegroundColor:v12];

  [v11 setTitleAlignment:2];
  [(UIButton *)self->_enterPasscodeButton setConfiguration:v11];
  [(UIButton *)self->_enterPasscodeButton addTarget:self action:sel__fallbackToPasscode forControlEvents:64];
  [(UIButton *)self->_enterPasscodeButton sizeToFit];
  [(UIButton *)self->_enterPasscodeButton setAlpha:0.0];
  [v3 addSubview:self->_enterPasscodeButton];
  objc_super v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabelView = self->_titleLabelView;
  self->_titleLabelView = v13;

  [(UILabel *)self->_titleLabelView setAlpha:0.0];
  [(UILabel *)self->_titleLabelView setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabelView setTextAlignment:1];
  v15 = self->_titleLabelView;
  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v15 setTextColor:v16];

  [(UILabel *)self->_titleLabelView setNumberOfLines:2];
  v17 = self->_titleLabelView;
  v18 = (NSString *)*MEMORY[0x1E4FB2998];
  v19 = (NSString *)*MEMORY[0x1E4FB2780];
  v20 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], (NSString *)*MEMORY[0x1E4FB2780]);
  [(UILabel *)v17 setFont:v20];

  [(UILabel *)self->_titleLabelView setLineBreakMode:4];
  [(UILabel *)self->_titleLabelView setIsAccessibilityElement:0];
  [v3 addSubview:self->_titleLabelView];
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  subtitleLabelView = self->_subtitleLabelView;
  self->_subtitleLabelView = v21;

  [(UILabel *)self->_subtitleLabelView setAlpha:0.0];
  [(UILabel *)self->_subtitleLabelView setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_subtitleLabelView setTextAlignment:1];
  v23 = self->_subtitleLabelView;
  v24 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UILabel *)v23 setTextColor:v24];

  [(UILabel *)self->_subtitleLabelView setNumberOfLines:2];
  v25 = self->_subtitleLabelView;
  v26 = PKFontForDefaultDesign(v18, v19);
  [(UILabel *)v25 setFont:v26];

  [(UILabel *)self->_subtitleLabelView setLineBreakMode:4];
  [(UILabel *)self->_subtitleLabelView setIsAccessibilityElement:0];
  [v3 addSubview:self->_subtitleLabelView];
  v27 = (UIAccessibilityElement *)[objc_alloc(MEMORY[0x1E4FB13D0]) initWithAccessibilityContainer:v3];
  textAccessibilityElement = self->_textAccessibilityElement;
  self->_textAccessibilityElement = v27;

  [(UIAccessibilityElement *)self->_textAccessibilityElement setAccessibilityTraits:*MEMORY[0x1E4FB2578] | *MEMORY[0x1E4FB25C0]];
  v29 = (UIAccessibilityElement *)[objc_alloc(MEMORY[0x1E4FB13D0]) initWithAccessibilityContainer:v3];
  passcodeAccessibilityElement = self->_passcodeAccessibilityElement;
  self->_passcodeAccessibilityElement = v29;

  [(UIAccessibilityElement *)self->_passcodeAccessibilityElement setAccessibilityLabel:v34];
  [(UIAccessibilityElement *)self->_passcodeAccessibilityElement setAccessibilityTraits:*MEMORY[0x1E4FB2540]];
  v31 = self->_passcodeAccessibilityElement;
  v39[0] = self->_textAccessibilityElement;
  v39[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v3 setAccessibilityElements:v32];

  [(PKAuthorizationCoverSheetViewController *)self _transitionToState:1 animated:0];
}

- (void)viewWillLayoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)PKAuthorizationCoverSheetViewController;
  [(PKAuthorizationCoverSheetViewController *)&v56 viewWillLayoutSubviews];
  objc_super v3 = [(PKAuthorizationCoverSheetViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v52 = v12;
  objc_super v13 = [v3 readableContentGuide];
  [v13 layoutFrame];
  double v15 = v14;

  double v16 = fmin(v9, v15);
  v17 = [(PKAuthorizationCoverSheetViewController *)self traitCollection];
  v18 = [v17 preferredContentSizeCategory];
  NSComparisonResult v19 = UIContentSizeCategoryCompareToCategory(v18, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]);

  -[UILabel sizeThatFits:](self->_titleLabelView, "sizeThatFits:", v16, 1.79769313e308);
  double v21 = v20;
  -[UILabel sizeThatFits:](self->_subtitleLabelView, "sizeThatFits:", v16, 1.79769313e308);
  double v23 = v22;
  -[UIButton sizeThatFits:](self->_enterPasscodeButton, "sizeThatFits:", v16, 1.79769313e308);
  double v25 = v24;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  if (self->_shouldDrawGlyph)
  {
    v57.origin.x = v5;
    v57.origin.y = v7;
    v57.size.width = v9;
    v57.size.height = v11;
    CGRectDivide(v57, &slice, &remainder, v52 + 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 32.0, CGRectMinYEdge);
    glyphView = self->_glyphView;
    PKSizeAlignedInRect();
    -[PKGlyphView setFrame:](glyphView, "setFrame:");
  }
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  double v27 = v25 + 15.0;
  if (v19 == NSOrderedAscending) {
    double v27 = 0.0;
  }
  CGFloat v28 = (v11 - (v21 + v23 + v27)) * 0.5;
  double v53 = v5;
  v58.origin.x = v5;
  double v29 = v7;
  v58.origin.y = v7;
  double v30 = v9;
  v58.size.width = v9;
  double v31 = v11;
  v58.size.height = v11;
  CGRectDivide(v58, &slice, &remainder, v28, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v21, CGRectMinYEdge);
  titleLabelView = self->_titleLabelView;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabelView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
  subtitleLabelView = self->_subtitleLabelView;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](subtitleLabelView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 15.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
  enterPasscodeButton = self->_enterPasscodeButton;
  PKSizeAlignedInRect();
  -[UIButton setFrame:](enterPasscodeButton, "setFrame:");
  textAccessibilityElement = self->_textAccessibilityElement;
  [(UILabel *)self->_titleLabelView frame];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [(UILabel *)self->_subtitleLabelView frame];
  v61.origin.x = v44;
  v61.origin.y = v45;
  v61.size.width = v46;
  v61.size.height = v47;
  v59.origin.x = v37;
  v59.origin.y = v39;
  v59.size.width = v41;
  v59.size.height = v43;
  CGRect v60 = CGRectUnion(v59, v61);
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](textAccessibilityElement, "setAccessibilityFrameInContainerSpace:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
  passcodeAccessibilityElement = self->_passcodeAccessibilityElement;
  [(UIButton *)self->_enterPasscodeButton frame];
  -[UIAccessibilityElement setAccessibilityFrameInContainerSpace:](passcodeAccessibilityElement, "setAccessibilityFrameInContainerSpace:");
  passcodeViewController = self->_passcodeViewController;
  if (passcodeViewController)
  {
    v50 = [(UIViewController *)passcodeViewController parentViewController];

    if (v50)
    {
      v51 = [(UIViewController *)self->_passcodeViewController view];
      objc_msgSend(v51, "setFrame:", v53, v29, v30, v31);
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAuthorizationCoverSheetViewController;
  [(PKAuthorizationCoverSheetViewController *)&v5 traitCollectionDidChange:a3];
  double v4 = [(PKAuthorizationCoverSheetViewController *)self view];
  [v4 layoutIfNeeded];
}

- (void)startEvaluation
{
  if (self->_authenticating)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Skipping Evaluation, because already authenticating.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    BOOL isInvalid = self->_isInvalid;
    objc_super v5 = PKLogFacilityTypeGetObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (isInvalid)
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Skipping Evaluation, because already invalidated.", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Starting Evaluation", (uint8_t *)buf, 2u);
      }

      self->_authenticating = 1;
      self->_hasAttemptedBiometricAuth = 0;
      objc_initWeak(buf, self);
      if (self->_presentationSource == 6)
      {
        CGFloat v7 = PKLocalizedCredentialString(&cfstr_UwbBiolockoutP.isa);
        PKLocalizedCredentialString(&cfstr_UwbBiolockoutP_0.isa);
      }
      else
      {
        CGFloat v7 = PKLocalizedPaymentString(&cfstr_InAppPaymentPa.isa);
        PKLocalizedPaymentString(&cfstr_PrivacyCoverSh.isa);
      double v8 = };
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:10];
      [v9 setPasscodeTitle:v7];
      [v9 setReason:v8];
      authenticator = self->_authenticator;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      objc_super v13 = __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke;
      double v14 = &unk_1E59CC468;
      objc_copyWeak(&v16, buf);
      double v15 = self;
      [(PKAuthenticator *)authenticator evaluateRequest:v9 withCompletion:&v11];
      if ((objc_msgSend(MEMORY[0x1E4F88108], "currentStateForPolicy:", 10, v11, v12, v13, v14) & 6) == 0) {
        [(PKAuthorizationCoverSheetViewController *)self _transitionToState:6 animated:0];
      }
      objc_destroyWeak(&v16);

      objc_destroyWeak(buf);
    }
  }
}

void __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __58__PKAuthorizationCoverSheetViewController_startEvaluation__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 993) = 0;
    switch([*(id *)(a1 + 32) result])
    {
      case 0:
        BOOL v6 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication successful.", (uint8_t *)&v16, 2u);
        }

        if ([*(id *)(a1 + 32) biometricMatch])
        {
          id v7 = v3;
          uint64_t v8 = 7;
        }
        else
        {
          id v7 = v3;
          uint64_t v8 = 8;
        }
        [v7 _transitionToState:v8 animated:1];
        goto LABEL_24;
      case 1:
        id v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication canceled by user.", (uint8_t *)&v16, 2u);
        }

        double v10 = (id *)(*(void *)(a1 + 40) + 1104);
        goto LABEL_22;
      case 2:
      case 3:
        uint64_t v4 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        LOWORD(v16) = 0;
        id v5 = "PKAuthorizationCoverSheetViewController: Authentication canceled by app.";
        break;
      case 4:
        uint64_t v11 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v12 = [v11 processName];
        int v13 = [v11 processIdentifier];
        double v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          v17 = v12;
          __int16 v18 = 2048;
          uint64_t v19 = v13;
          _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Authentication by %@[%ld] preempted by another process.", (uint8_t *)&v16, 0x16u);
        }

        id v15 = objc_loadWeakRetained(v3 + 138);
        [v15 authorizationCoverSheetViewControllerDidCompleteWithSuccess:0];

        goto LABEL_23;
      case 5:
        uint64_t v4 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        LOWORD(v16) = 0;
        id v5 = "PKAuthorizationCoverSheetViewController: Failed to authenticate";
        break;
      case 6:
        [v3 _transitionToState:5 animated:1];
        [v3 _presentPasscodeToExitLockout];
        goto LABEL_24;
      case 7:
        uint64_t v4 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        LOWORD(v16) = 0;
        id v5 = "PKAuthorizationCoverSheetViewController: Authentication selected fallback - this is not supported";
        break;
      default:
        goto LABEL_24;
    }
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v16, 2u);
LABEL_21:

    double v10 = v3 + 138;
LABEL_22:
    uint64_t v11 = objc_loadWeakRetained(v10);
    [v11 authorizationCoverSheetViewControllerDidCompleteWithSuccess:0];
LABEL_23:
  }
LABEL_24:
}

- (void)fadeOutUIWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = [(PKAuthorizationCoverSheetViewController *)self viewIfLoaded];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 layer];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PKAuthorizationCoverSheetViewController_fadeOutUIWithCompletion___block_invoke;
    v8[3] = &unk_1E59CA9F8;
    id v9 = v4;
    objc_msgSend(v7, "pkui_animateToOpacity:withCompletion:", v8, 0.0);
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __67__PKAuthorizationCoverSheetViewController_fadeOutUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fadeInUIAnimated:(BOOL)a3 performSynchronizedAnimation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_shouldUIBeShown)
  {
    self->_shouldUIBeShown = 1;
    aBlock = v6;
    if (self->_currentState == 6)
    {
      self->_isWaitingForPasscodeUI = 1;
      id v7 = _Block_copy(v6);
      id performSynchronizedFadeInAnimationBlock = self->_performSynchronizedFadeInAnimationBlock;
      self->_id performSynchronizedFadeInAnimationBlock = v7;

      id v6 = aBlock;
      if (!self->_passcodeViewController) {
        goto LABEL_11;
      }
      [(PKAuthorizationCoverSheetViewController *)self _animateInPasscodeViewController];
    }
    else
    {
      if (v4)
      {
        -[PKAuthorizationCoverSheetViewController _transitionToState:animated:](self, "_transitionToState:animated:");
        id v6 = aBlock;
      }
      if (v6) {
        (*((void (**)(void))aBlock + 2))();
      }
      [(PKAuthorizationCoverSheetViewController *)self _transitionToState:self->_currentState animated:v4];
    }
    id v6 = aBlock;
  }
LABEL_11:
}

- (void)invalidate
{
  if (!self->_isInvalid)
  {
    self->_BOOL isInvalid = 1;
    [(PKAuthenticator *)self->_authenticator setDelegate:0];
    authenticator = self->_authenticator;
    self->_authenticator = 0;

    self->_authenticating = 0;
  }
}

- (void)_presentPasscodeToExitLockout
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Prompting user to exit bio lockout", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:0];
  [v4 setPasscodeOnly:1];
  id v5 = PKLocalizedPaymentString(&cfstr_PresentmentFoo.isa);
  [v4 setPasscodeTitle:v5];

  id v6 = PKLocalizedPaymentString(&cfstr_PrivacyCoverSh.isa);
  [v4 setReason:v6];

  authenticator = self->_authenticator;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke;
  v8[3] = &unk_1E59CC468;
  objc_copyWeak(&v9, buf);
  void v8[4] = self;
  [(PKAuthenticator *)authenticator evaluateRequest:v4 withCompletion:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(buf);
}

void __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __72__PKAuthorizationCoverSheetViewController__presentPasscodeToExitLockout__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) result])
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Failed to exit lockout", v5, 2u);
      }

      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1104));
      [v4 authorizationCoverSheetViewControllerDidCompleteWithSuccess:0];
    }
    else
    {
      [WeakRetained startEvaluation];
    }
  }
}

- (void)_fallbackToPasscode
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Falling back to passcode", v4, 2u);
  }

  self->_hasPresentedPasscodePrompt = 1;
  if (self->_authenticating) {
    [(PKAuthenticator *)self->_authenticator fallbackToSystemPasscodeUI];
  }
  else {
    [(PKAuthorizationCoverSheetViewController *)self _presentPasscodeToExitLockout];
  }
}

- (void)_transitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_isInvalid) {
    return;
  }
  id v5 = 0;
  BOOL v6 = 0;
  BOOL shouldDrawGlyph = self->_shouldDrawGlyph;
  uint64_t v53 = 0;
  BOOL v51 = a4;
  int v52 = 1;
  int v8 = 0;
  BOOL v9 = 0;
  int v10 = 0;
  int v54 = 0;
  int v11 = 0;
  unint64_t v12 = a3;
  switch(a3)
  {
    case 0uLL:
      id v5 = 0;
      int v13 = 0;
      uint64_t v53 = 0;
      int v11 = 0;
      int v54 = 0;
      int v10 = 0;
      int v52 = 0;
      int v8 = 0;
      LOBYTE(v6) = 0;
      BOOL v9 = 1;
      unint64_t v12 = 2;
      if (self->_shouldDrawGlyph) {
        goto LABEL_44;
      }
      goto LABEL_53;
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      BOOL v6 = 1;
LABEL_7:
      id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:0];
      BOOL v9 = 1;
      uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:1];
      unint64_t v12 = 0;
      int v13 = 0;
      int v54 = 0;
      int v10 = 0;
      int v52 = 0;
      int v8 = 0;
      int v11 = v6;
      goto LABEL_12;
    case 3uLL:
      if (PKPearlIsAvailable()) {
        unint64_t v12 = 4;
      }
      else {
        unint64_t v12 = 0;
      }
      id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:0];
      BOOL v9 = 1;
      uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:1];
      int v13 = 0;
      int v11 = 0;
      int v54 = 0;
      int v10 = 0;
      int v52 = 0;
      int v8 = 0;
LABEL_12:
      LOBYTE(v6) = 0;
      if (!shouldDrawGlyph) {
        goto LABEL_53;
      }
      goto LABEL_44;
    case 4uLL:
      if (PKPearlIsAvailable()) {
        unint64_t v12 = 5;
      }
      else {
        unint64_t v12 = 1;
      }
      if (self->_currentState == 9)
      {
        id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricFailureLabelAccessibilityLabel:0];
        int v11 = 1;
        uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricFailureLabelAccessibilityLabel:1];
        int v54 = 0;
        if (!shouldDrawGlyph)
        {
          LOBYTE(v6) = 0;
          int v8 = 0;
          int v52 = 0;
          int v10 = 0;
          BOOL v9 = 1;
          goto LABEL_53;
        }
        int v13 = 0;
        int v10 = 0;
        BOOL v9 = 1;
        int v52 = 0;
        int v8 = 0;
      }
      else
      {
        id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:0];
        BOOL v9 = 1;
        uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricLabelAccessibilityLabel:1];
        int v11 = 0;
        if (!shouldDrawGlyph)
        {
          LOBYTE(v6) = 0;
          int v8 = 0;
          int v52 = 0;
          int v10 = 0;
          int v54 = 0;
          goto LABEL_53;
        }
        int v13 = 0;
        int v54 = 0;
        int v10 = 0;
        int v52 = 0;
        int v8 = 0;
      }
LABEL_44:
      BOOL v6 = ([MEMORY[0x1E4F88108] currentStateForPolicy:10] & 6) != 0;
LABEL_45:
      if (!v13)
      {
LABEL_53:
        if (PKPearlIsAvailable()) {
          PKLocalizedPearlString(&cfstr_PrivacyCoverSh_1.isa);
        }
        else {
        int v13 = PKLocalizedPaymentString(&cfstr_PrivacyCoverSh_2.isa);
        }
        if (!v6) {
          goto LABEL_47;
        }
        goto LABEL_57;
      }
      if (!v6)
      {
LABEL_47:
        unint64_t v45 = v12;
        int v44 = v8;
        if (!v11)
        {
          BOOL shouldUIBeShown = 0;
          int v50 = 0;
          int v19 = 0;
          double v18 = 0.0;
          if (v5) {
            goto LABEL_60;
          }
          goto LABEL_78;
        }
        BOOL v16 = 0;
        int v50 = 0;
        BOOL shouldUIBeShown = self->_shouldUIBeShown;
        double v18 = 0.0;
        goto LABEL_59;
      }
LABEL_57:
      unint64_t v45 = v12;
      BOOL shouldUIBeShown = self->_shouldUIBeShown;
      double v18 = (double)shouldUIBeShown;
      int v50 = 1;
      int v44 = v8;
      if (v11)
      {
        BOOL v16 = self->_shouldUIBeShown;
LABEL_59:
        int v19 = shouldUIBeShown;
        BOOL shouldUIBeShown = v16;
        if (v5) {
          goto LABEL_60;
        }
        goto LABEL_78;
      }
      int v19 = 0;
      if (v5)
      {
LABEL_60:
        BOOL v20 = self->_shouldUIBeShown;
        if (!v9) {
          goto LABEL_62;
        }
        goto LABEL_61;
      }
LABEL_78:
      BOOL v20 = 0;
      if (v9) {
LABEL_61:
      }
        BOOL v9 = self->_shouldUIBeShown;
LABEL_62:
      double v21 = (NSString **)MEMORY[0x1E4FB28C8];
      if (!v10) {
        double v21 = (NSString **)MEMORY[0x1E4FB2998];
      }
      double v22 = PKFontForDefaultDesign(*v21, (NSString *)*MEMORY[0x1E4FB2780]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke;
      aBlock[3] = &unk_1E59CB8B0;
      id v48 = v5;
      id v60 = v48;
      CGRect v61 = self;
      id v47 = v13;
      id v62 = v47;
      id v46 = v22;
      id v63 = v46;
      double v23 = _Block_copy(aBlock);
      double v24 = v23;
      if (v51 && self->_shouldUIBeShown)
      {
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v23 animations:0.25];
        double v25 = [(PKGlyphView *)self->_glyphView layer];
        objc_msgSend(v25, "pkui_animateToOpacity:withCompletion:", 0, v18);

        int v26 = 1056;
        double v27 = [(UIButton *)self->_enterPasscodeButton layer];
        objc_msgSend(v27, "pkui_animateToOpacity:withCompletion:", 0, (double)v19);

        CGFloat v28 = [(UILabel *)self->_titleLabelView layer];
        objc_msgSend(v28, "pkui_animateToOpacity:withCompletion:", 0, (double)v20);

        double v29 = [(UILabel *)self->_subtitleLabelView layer];
        objc_msgSend(v29, "pkui_animateToOpacity:withCompletion:", 0, (double)v9);
        uint64_t v30 = 1;
      }
      else
      {
        (*((void (**)(void *))v23 + 2))(v23);
        double v31 = [(PKGlyphView *)self->_glyphView layer];
        *(float *)&double v32 = (float)shouldUIBeShown;
        [v31 setOpacity:v32];

        int v26 = 1056;
        v33 = [(UIButton *)self->_enterPasscodeButton layer];
        *(float *)&double v34 = (float)v19;
        [v33 setOpacity:v34];

        uint64_t v35 = [(UILabel *)self->_titleLabelView layer];
        *(float *)&double v36 = (float)v20;
        [v35 setOpacity:v36];

        double v29 = [(UILabel *)self->_subtitleLabelView layer];
        *(float *)&double v37 = (float)v9;
        [v29 setOpacity:v37];
        uint64_t v30 = 0;
      }

      if (!v50)
      {
        CGFloat v39 = (void *)v53;
        if (v54)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained authorizationCoverSheetViewControllerDidCompleteWithSuccess:1];
        }
        goto LABEL_83;
      }
      if (v54) {
        [MEMORY[0x1E4F88120] invokeSuccessFeedback];
      }
      objc_initWeak(&location, self);
      glyphView = self->_glyphView;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke_2;
      v55[3] = &unk_1E59CC270;
      objc_copyWeak(&v56, &location);
      char v57 = v54;
      [(PKGlyphView *)glyphView setState:v45 animated:v30 completionHandler:v55];
      CGFloat v39 = (void *)v53;
      if (v44)
      {
        if (PKPearlIsAvailable())
        {
          if ((v30 & 1) == 0) {
            goto LABEL_82;
          }
          goto LABEL_81;
        }
        AudioServicesPlaySystemSound(0x573u);
        int v26 = 1064;
        if (v30)
        {
LABEL_81:
          CGFloat v41 = [*(id *)((char *)&self->super.super.super.isa + v26) layer];
          double v42 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_shakeAnimation");
          id v43 = (id)objc_msgSend(v41, "pkui_addAdditiveAnimation:", v42);
        }
      }
LABEL_82:
      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
LABEL_83:
      [(UIAccessibilityElement *)self->_textAccessibilityElement setAccessibilityLabel:v39];
      if (v52)
      {
        if (!self->_hasPresentedPasscodePrompt) {
          [(PKAuthorizationCoverSheetViewController *)self _fallbackToPasscode];
        }
      }
      self->_unint64_t currentState = a3;

      return;
    case 5uLL:
      id v5 = [(PKAuthorizationCoverSheetViewController *)self _passcodeLabelAccessibilityLabel:0];
      int v11 = 1;
      uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _passcodeLabelAccessibilityLabel:1];
      unint64_t v12 = 0;
      int v13 = 0;
      int v54 = 0;
      int v10 = 0;
      int v8 = 0;
      LOBYTE(v6) = 0;
      BOOL v9 = 1;
      int v52 = 1;
      if (!shouldDrawGlyph) {
        goto LABEL_53;
      }
      goto LABEL_44;
    case 6uLL:
      goto LABEL_53;
    case 7uLL:
      id v5 = 0;
      int v13 = 0;
      uint64_t v53 = 0;
      int v11 = 0;
      int v10 = 0;
      BOOL v9 = 0;
      int v52 = 0;
      int v8 = 0;
      LOBYTE(v6) = 0;
      if (PKPearlIsAvailable()) {
        unint64_t v12 = 5;
      }
      else {
        unint64_t v12 = 1;
      }
      int v54 = 1;
      if (!shouldDrawGlyph) {
        goto LABEL_53;
      }
      goto LABEL_44;
    case 8uLL:
      LOBYTE(v6) = 0;
      int v8 = 0;
      BOOL v9 = 0;
      int v10 = 0;
      int v11 = 0;
      uint64_t v53 = 0;
      id v5 = 0;
      int v52 = 1;
      unint64_t v12 = 6;
      int v54 = 1;
      goto LABEL_53;
    case 9uLL:
      if (PKPearlIsAvailable()) {
        unint64_t v12 = 3;
      }
      else {
        unint64_t v12 = 0;
      }
      id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricFailureLabelAccessibilityLabel:0];
      BOOL v6 = 1;
      uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricFailureLabelAccessibilityLabel:1];
      int v13 = PKLocalizedPaymentString(&cfstr_PrivacyCoverSh_0.isa);
      unint64_t currentState = self->_currentState;
      if (currentState != 4 && currentState != 1) {
        goto LABEL_38;
      }
      int v54 = 0;
      int v52 = 0;
      BOOL v6 = 0;
      int v11 = 1;
      int v10 = 1;
      BOOL v9 = 1;
      int v8 = 1;
      if (!shouldDrawGlyph) {
        goto LABEL_45;
      }
      goto LABEL_44;
    case 0xAuLL:
      id v5 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricUnavailableLabelAccessibilityLabel:0];
      int v11 = 1;
      uint64_t v53 = [(PKAuthorizationCoverSheetViewController *)self _genericBiometricUnavailableLabelAccessibilityLabel:1];
      unint64_t v12 = 0;
      int v13 = 0;
      int v54 = 0;
      int v10 = 0;
      int v52 = 0;
      int v8 = 0;
      LOBYTE(v6) = 0;
      BOOL v9 = 1;
      if (!shouldDrawGlyph) {
        goto LABEL_53;
      }
      goto LABEL_44;
    default:
      unint64_t v12 = 6;
      int v13 = 0;
LABEL_38:
      int v54 = 0;
      int v52 = 0;
      int v8 = 0;
      BOOL v9 = 1;
      int v11 = v6;
      int v10 = v6;
      BOOL v6 = 0;
      if (!shouldDrawGlyph) {
        goto LABEL_45;
      }
      goto LABEL_44;
  }
}

void __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1064), "setText:");
    [*(id *)(*(void *)(a1 + 40) + 1072) setText:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 1072) setFont:*(void *)(a1 + 56)];
    id v2 = [*(id *)(a1 + 40) view];
    [v2 setNeedsLayout];
  }
}

void __71__PKAuthorizationCoverSheetViewController__transitionToState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 138);
    [v3 authorizationCoverSheetViewControllerDidCompleteWithSuccess:1];

    id WeakRetained = v4;
  }
}

- (id)_genericBiometricLabelAccessibilityLabel:(BOOL)a3
{
  BOOL v3 = a3;
  char IsAvailable = PKPearlIsAvailable();
  if (v3)
  {
    if (IsAvailable)
    {
      id v5 = @"PRIVACY_COVER_SHEET_PEARL_ACCESSIBILITY_TEXT";
LABEL_6:
      BOOL v6 = PKLocalizedPearlString(&v5->isa);
      goto LABEL_10;
    }
    id v7 = @"PRIVACY_COVER_SHEET_TOUCH_ID_ACCESSIBILITY_TEXT";
  }
  else
  {
    if (IsAvailable)
    {
      id v5 = @"GENERIC_PEARL";
      goto LABEL_6;
    }
    id v7 = @"GENERIC_TOUCH_ID";
  }
  BOOL v6 = PKLocalizedPaymentString(&v7->isa);
LABEL_10:

  return v6;
}

- (id)_passcodeLabelAccessibilityLabel:(BOOL)a3
{
  if (a3) {
    BOOL v3 = @"PRIVACY_COVER_SHEET_PASSCODE_ACCESSIBILITY_TEXT";
  }
  else {
    BOOL v3 = @"PAYMENT_ERROR_NO_TOUCH_ID_OR_PASSCODE";
  }
  id v4 = PKLocalizedPaymentString(&v3->isa);

  return v4;
}

- (id)_genericBiometricFailureLabelAccessibilityLabel:(BOOL)a3
{
  BOOL v3 = a3;
  char IsAvailable = PKPearlIsAvailable();
  if (v3)
  {
    if (IsAvailable)
    {
      id v5 = @"PRIVACY_COVER_SHEET_PEARL_FAILURE_ACCESSIBILITY_TEXT";
LABEL_6:
      BOOL v6 = PKLocalizedPearlString(&v5->isa);
      goto LABEL_10;
    }
    id v7 = @"PRIVACY_COVER_SHEET_TOUCH_ID_FAILURE_ACCESSIBILITY_TEXT";
  }
  else
  {
    if (IsAvailable)
    {
      id v5 = @"GENERIC_PEARL_FAILURE";
      goto LABEL_6;
    }
    id v7 = @"GENERIC_TOUCH_ID_FAILURE";
  }
  BOOL v6 = PKLocalizedPaymentString(&v7->isa);
LABEL_10:

  return v6;
}

- (id)_genericBiometricUnavailableLabelAccessibilityLabel:(BOOL)a3
{
  BOOL v3 = a3;
  char IsAvailable = PKPearlIsAvailable();
  if (v3)
  {
    if (IsAvailable)
    {
      id v5 = @"PRIVACY_COVER_SHEET_PEARL_UNAVAILABLE_ACCESSIBILITY_TEXT";
LABEL_6:
      BOOL v6 = PKLocalizedPearlString(&v5->isa);
      goto LABEL_10;
    }
    id v7 = @"PRIVACY_COVER_SHEET_TOUCH_ID_UNAVAILABLE_ACCESSIBILITY_TEXT";
  }
  else
  {
    if (IsAvailable)
    {
      id v5 = @"GENERIC_PEARL_UNAVAILABLE";
      goto LABEL_6;
    }
    id v7 = @"GENERIC_TOUCH_ID_UNAVAILABLE";
  }
  BOOL v6 = PKLocalizedPaymentString(&v7->isa);
LABEL_10:

  return v6;
}

- (void)_animateInPasscodeViewController
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL isWaitingForPasscodeUI = self->_isWaitingForPasscodeUI;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke;
  aBlock[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v15, &location);
  BOOL v16 = isWaitingForPasscodeUI;
  id v4 = _Block_copy(aBlock);
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"Yes";
    if (!isWaitingForPasscodeUI) {
      BOOL v6 = @"No";
    }
    *(_DWORD *)buf = 138412290;
    int v19 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Presenting passcode VC fadeIn: %@", buf, 0xCu);
  }

  if (isWaitingForPasscodeUI)
  {
    id v7 = [(UIViewController *)self->_passcodeViewController view];
    int v8 = [v7 layer];
    [v8 setOpacity:0.0];
    [(PKAuthorizationCoverSheetViewController *)self addChildViewController:self->_passcodeViewController];
    BOOL v9 = [(PKAuthorizationCoverSheetViewController *)self view];
    [v9 addSubview:v7];

    [(UIViewController *)self->_passcodeViewController didMoveToParentViewController:self];
    [v7 setNeedsLayout];
    [v7 layoutIfNeeded];
    id performSynchronizedFadeInAnimationBlock = (void (**)(void))self->_performSynchronizedFadeInAnimationBlock;
    if (performSynchronizedFadeInAnimationBlock)
    {
      performSynchronizedFadeInAnimationBlock[2]();
      id v11 = self->_performSynchronizedFadeInAnimationBlock;
      self->_id performSynchronizedFadeInAnimationBlock = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke_111;
    v12[3] = &unk_1E59CA9F8;
    id v13 = v4;
    objc_msgSend(v8, "pkui_animateToOpacity:withCompletion:", v12, 1.0);
  }
  else
  {
    [(PKAuthorizationCoverSheetViewController *)self presentViewController:self->_passcodeViewController animated:1 completion:v4];
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 129);
    BOOL v6 = v3;
    if (v4)
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
      id v5 = (void *)*((void *)v6 + 129);
      *((void *)v6 + 129) = 0;

      BOOL v3 = v6;
    }
    if (*(unsigned char *)(a1 + 40)) {
      v3[1024] = 0;
    }
    [v3 _transitionToState:6 animated:1];
    BOOL v3 = v6;
  }
}

uint64_t __75__PKAuthorizationCoverSheetViewController__animateInPasscodeViewController__block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_authenticating)
  {
    int64_t var1 = a4.var1;
    int64_t var0 = a4.var0;
    if (PKPearlIsAvailable()) {
      BOOL v7 = (unint64_t)(self->_coachingState - 3) < 2;
    }
    else {
      BOOL v7 = 0;
    }
    switch(var0)
    {
      case 0:
        if (var1 == 3) {
          BOOL v7 = 1;
        }
        if (v7)
        {
          if (var1 != 3) {
            goto LABEL_25;
          }
          unint64_t currentState = 10;
        }
        else
        {
          if (self->_hasAttemptedBiometricAuth || (unint64_t)(var1 - 1) < 2) {
            goto LABEL_25;
          }
          unint64_t currentState = self->_currentState;
          if (currentState == 3)
          {
            unint64_t currentState = 2;
            goto LABEL_27;
          }
          if (currentState != 6) {
            goto LABEL_15;
          }
        }
        break;
      case 1:
        unint64_t currentState = 3;
        break;
      case 2:
        self->_hasAttemptedBiometricAuth = 1;
        unint64_t currentState = 4;
        break;
      case 3:
        if (self->_currentState == 9)
        {
LABEL_25:
          unint64_t currentState = 9;
          goto LABEL_27;
        }
LABEL_15:
        unint64_t currentState = 1;
        break;
      case 4:
        if (self->_currentState == 6)
        {
          unint64_t currentState = 6;
        }
        else
        {
          unint64_t currentState = 5;
LABEL_27:
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained authorizationCoverSheetViewControllerDidGetBiometricUnavailableOrFailure];
        }
        break;
      case 5:
        if (self->_currentState == 6) {
          unint64_t currentState = 8;
        }
        else {
          unint64_t currentState = 7;
        }
        break;
      default:
        unint64_t currentState = 0;
        break;
    }
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218496;
      int64_t v13 = var0;
      __int16 v14 = 2048;
      int64_t v15 = var1;
      __int16 v16 = 2048;
      unint64_t v17 = currentState;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Evaluating authenticator state %lu - %lu and  transitioning to state %lu", (uint8_t *)&v12, 0x20u);
    }

    [(PKAuthorizationCoverSheetViewController *)self _transitionToState:currentState animated:1];
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v9 = a3;
  int v10 = (void (**)(id, uint64_t))a4;
  id v11 = a5;
  if (self->_passcodeViewController)
  {
    if (v10) {
      v10[2](v10, 1);
    }
  }
  else
  {
    int v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v15 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: requested passcode presentation", v15, 2u);
    }

    objc_storeStrong((id *)&self->_passcodeViewController, a3);
    [(UIViewController *)self->_passcodeViewController setModalPresentationStyle:5];
    int64_t v13 = _Block_copy(v10);
    id showPasscodeUICompletion = self->_showPasscodeUICompletion;
    self->_id showPasscodeUICompletion = v13;

    if (self->_shouldUIBeShown) {
      [(PKAuthorizationCoverSheetViewController *)self _animateInPasscodeViewController];
    }
  }
}

- (void)dismissPasscodeViewController
{
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKAuthorizationCoverSheetViewController: Dismissing passcode view controller", v9, 2u);
  }

  uint64_t v4 = [(UIViewController *)self->_passcodeViewController parentViewController];

  passcodeViewController = self->_passcodeViewController;
  if (v4)
  {
    BOOL v6 = [(UIViewController *)passcodeViewController view];
    [v6 removeFromSuperview];

    [(UIViewController *)self->_passcodeViewController removeFromParentViewController];
    [(UIViewController *)self->_passcodeViewController didMoveToParentViewController:0];
  }
  else
  {
    BOOL v7 = [(UIViewController *)passcodeViewController presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
  int v8 = self->_passcodeViewController;
  self->_passcodeViewController = 0;
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  self->_coachingState = a4;
}

- (BOOL)isErrorRecovery
{
  return self->_isErrorRecovery;
}

- (void)setIsErrorRecovery:(BOOL)a3
{
  self->_isErrorRecovery = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_passcodeAccessibilityElement, 0);
  objc_storeStrong((id *)&self->_textAccessibilityElement, 0);
  objc_storeStrong((id *)&self->_subtitleLabelView, 0);
  objc_storeStrong((id *)&self->_titleLabelView, 0);
  objc_storeStrong((id *)&self->_enterPasscodeButton, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong(&self->_performSynchronizedFadeInAnimationBlock, 0);
  objc_storeStrong(&self->_showPasscodeUICompletion, 0);

  objc_storeStrong((id *)&self->_authenticator, 0);
}

@end