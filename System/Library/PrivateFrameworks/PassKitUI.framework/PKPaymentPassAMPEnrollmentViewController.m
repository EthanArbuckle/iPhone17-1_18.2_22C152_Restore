@interface PKPaymentPassAMPEnrollmentViewController
+ (void)shouldOfferAMPEnrollmentForPass:(id)a3 provisioningController:(id)a4 withCompletion:(id)a5;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)_snapshotSize;
- (PKPaymentPassAMPEnrollmentViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5;
- (PKPaymentPassAMPEnrollmentViewControllerFlowDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)_createBodyImage:(id)a3;
- (void)_displayTermsWithCompletion:(id)a3;
- (void)_done;
- (void)_performAMPEnrollmentWithPass:(id)a3 asDefault:(BOOL)a4 completion:(id)a5;
- (void)_performTerms;
- (void)_updateBodyImage;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)proceedToNextScreen;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setFlowItemDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPaymentPassAMPEnrollmentViewController

+ (void)shouldOfferAMPEnrollmentForPass:(id)a3 provisioningController:(id)a4 withCompletion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = [MEMORY[0x1E4F84188] sharedManager];
  v9 = [v6 paymentPass];
  char v10 = [v8 shouldOfferAMPEnrollmentForPaymentPass:v9];

  if (v10)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke;
    aBlock[3] = &unk_1E59CE160;
    id v18 = v7;
    v11 = _Block_copy(aBlock);
    v12 = [v6 paymentPass];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke_11;
    v14[3] = &unk_1E59CD3C0;
    id v15 = v6;
    id v16 = v11;
    id v13 = v11;
    [v8 enrollmentStatusForPaymentPass:v12 completion:v14 progress:0];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5) {
    a2 = 0;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "AMP offer should be presented:%d (%@)", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__PKPaymentPassAMPEnrollmentViewController_shouldOfferAMPEnrollmentForPass_provisioningController_withCompletion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 secureElementPass];
  id v11 = [v7 devicePrimaryBarcodePaymentApplication];

  uint64_t v8 = [v11 paymentNetworkIdentifier];
  BOOL v10 = a2 == 1 && v8 == 123;
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v6);
}

- (PKPaymentPassAMPEnrollmentViewController)initWithProvisioningController:(id)a3 paymentPass:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  id v11 = [(PKExplanationViewController *)&v14 initWithContext:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a3);
    objc_storeStrong((id *)&v12->_pass, a4);
  }

  return v12;
}

- (void)loadView
{
  v32[3] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  [(PKExplanationViewController *)&v28 loadView];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v25 = [v4 footerView];
  id v5 = [(PKSecureElementPass *)self->_pass organizationName];
  v27 = PKLocalizedPaymentString(&cfstr_PaymentAmpEnro.isa, &stru_1EF1B4C70.isa, v5);

  [v3 setTitleText:v27];
  id v6 = [v4 primaryButton];
  id v7 = PKLocalizedPaymentString(&cfstr_PaymentAmpEnro_0.isa);
  [v6 setTitle:v7 forState:0];

  [v3 setForceShowSetupLaterButton:1];
  [v25 setManualEntryButton:0];
  uint64_t v8 = [(PKSecureElementPass *)self->_pass organizationName];
  v26 = PKLocalizedPaymentString(&cfstr_PaymentAmpEnro_1.isa, &stru_1EF1B4C70.isa, v8);

  [v3 setBodyText:v26];
  id v9 = [v4 buttonExplanationTextView];
  id v10 = [(PKSecureElementPass *)self->_pass organizationName];
  id v11 = PKLocalizedPaymentString(&cfstr_PaymentAmpEnro_2.isa, &stru_1EF1B4C70.isa, v10);

  v12 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v13 = (void *)[v12 mutableCopy];

  [v13 setLineBreakMode:0];
  [v13 setAlignment:1];
  v31[0] = *MEMORY[0x1E4FB06F8];
  objc_super v14 = [v9 font];
  uint64_t v15 = *MEMORY[0x1E4FB0738];
  v32[0] = v14;
  v32[1] = v13;
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  v31[1] = v15;
  v31[2] = v16;
  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v32[2] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  v19 = PKAttributedStringByParsingLinksInString();
  [v9 setAttributedText:v19];
  [v9 setDataDetectorTypes:2];
  [v9 setDelegate:self];
  uint64_t v29 = v16;
  v20 = [MEMORY[0x1E4FB1618] linkColor];
  v30 = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [v9 setLinkTextAttributes:v21];

  v22 = [v25 setupLaterButton];
  v23 = PKLocalizedPaymentString(&cfstr_PaymentAmpEnro_3.isa);
  [v22 setTitle:v23 forState:0];

  [v3 setImage:0];
  [(PKPaymentPassAMPEnrollmentViewController *)self _updateBodyImage];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  [v3 showCheckmark:0 animated:0];
  [v3 setNeedsLayout];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  v24 = [(PKPaymentPassAMPEnrollmentViewController *)self navigationItem];
  [v24 setHidesBackButton:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassAMPEnrollmentViewController;
  [(PKPaymentPassAMPEnrollmentViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  id v5 = [v4 dockView];
  [v5 setButtonsEnabled:0];

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  id v6 = [(PKSecureElementPass *)self->_pass paymentPass];
  [(PKPaymentPassAMPEnrollmentViewController *)self _performAMPEnrollmentWithPass:v6 asDefault:0 completion:0];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  id v5 = [v4 dockView];
  [v5 setButtonsEnabled:0];

  reporter = self->_reporter;
  uint64_t v8 = *MEMORY[0x1E4F86BA0];
  v9[0] = *MEMORY[0x1E4F86B98];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:3 context:v7];

  [(PKPaymentPassAMPEnrollmentViewController *)self proceedToNextScreen];
}

- (void)proceedToNextScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained ampEnrollmentViewControllerDidFinish:self];
}

- (void)_performTerms
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PKPaymentPassAMPEnrollmentViewController__performTerms__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKPaymentPassAMPEnrollmentViewController *)self _displayTermsWithCompletion:v2];
}

uint64_t __57__PKPaymentPassAMPEnrollmentViewController__performTerms__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showSpinner:0];
}

- (void)_displayTermsWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  id v5 = [MEMORY[0x1E4F4DBD8] bagForProfile:*MEMORY[0x1E4F85150] profileVersion:*MEMORY[0x1E4F85158]];
  id v6 = [v5 URLForKey:@"alipay-terms-url"];
  v48[0] = 0;
  id v7 = [v6 valueWithError:v48];
  id v8 = v48[0];

  if (v7)
  {
    id v9 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
    termsController = self->_termsController;
    self->_termsController = v9;

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CB128;
    objc_copyWeak(&v46, &location);
    v45 = v4;
    v36 = _Block_copy(aBlock);
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    id v35 = v8;
    v12 = [[PKExplanationView alloc] initWithContext:[(PKExplanationViewController *)self context] delegate:self];
    id v13 = [(PKExplanationView *)v12 dockView];
    [v13 setPrimaryButton:0];

    objc_super v14 = PKProvisioningBackgroundColor();
    [(PKExplanationView *)v12 setBackgroundColor:v14];

    uint64_t v15 = PKLocalizedAquamanString(&cfstr_TermsAndCondit_0.isa);
    [(PKExplanationView *)v12 setTitleText:v15];

    [(PKExplanationView *)v12 setTitleTextNumberOfLines:1];
    [v11 setView:v12];
    [v11 setModalInPresentation:1];
    id v16 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v17 = PKLocalizedAquamanString(&cfstr_Done.isa);
    uint64_t v18 = [v16 initWithTitle:v17 style:2 target:self action:sel__done];

    v19 = [v11 navigationItem];
    [v19 setRightBarButtonItem:v18];

    v20 = [v11 navigationItem];
    [v20 setHidesBackButton:1];
    v32 = (void *)v18;
    v33 = v5;
    v34 = v4;

    v21 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v22 = (void *)[v21 mutableCopy];

    [v22 setLineBreakMode:0];
    [v22 setAlignment:1];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v23 configureWithOpaqueBackground];
    v24 = [v11 navigationItem];
    [v24 setStandardAppearance:v23];

    v25 = [(RemoteUIController *)self->_termsController loader];
    v26 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    v27 = [v26 context];
    objc_msgSend(v25, "setAllowNonSecureHTTP:", objc_msgSend(v27, "devSigned"));

    objc_super v28 = self->_termsController;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_2;
    v37[3] = &unk_1E59D7988;
    objc_copyWeak(&v43, &location);
    id v38 = v7;
    uint64_t v29 = v12;
    v39 = v29;
    v40 = self;
    id v30 = v11;
    id v41 = v30;
    id v31 = v36;
    id v42 = v31;
    [(RemoteUIController *)v28 loadURL:v38 postBody:0 completion:v37];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
    id v5 = v33;
    objc_super v4 = v34;
    id v8 = v35;
  }
  else
  {
    v4[2](v4);
  }
}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = (void *)*((void *)WeakRetained + 132);
    *((void *)WeakRetained + 132) = 0;
    id v6 = WeakRetained;

    v3 = v6;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
      v3 = v6;
    }
  }
}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_3;
  block[3] = &unk_1E59D2670;
  objc_copyWeak(&v13, (id *)(a1 + 72));
  char v14 = a2;
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_3(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      v3 = [NSString stringWithContentsOfURL:*(void *)(a1 + 32) encoding:4 error:0];
      id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v5 = [v3 dataUsingEncoding:10];
      uint64_t v16 = *MEMORY[0x1E4FB06D8];
      v17[0] = *MEMORY[0x1E4FB0708];
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v7 = (void *)[v4 initWithData:v5 options:v6 documentAttributes:0 error:0];

      [*(id *)(a1 + 40) setAttributedBodyText:v7];
      [*(id *)(a1 + 40) setBodyTextAlignment:0];
      id v8 = [*(id *)(a1 + 48) navigationController];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_4;
      v12[3] = &unk_1E59CA9F8;
      uint64_t v9 = *(void *)(a1 + 56);
      id v13 = *(id *)(a1 + 64);
      objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v9, 1, v12);
    }
    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error loading terms UI at %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

uint64_t __72__PKPaymentPassAMPEnrollmentViewController__displayTermsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_done
{
  id v3 = [(PKPaymentPassAMPEnrollmentViewController *)self navigationController];
  objc_msgSend(v3, "_pk_popToViewController:animated:", self, 1);
}

- (CGSize)_snapshotSize
{
  double v2 = 220.0;
  double v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_createBodyImage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4)
  {
    CGFloat v5 = (double)(v4 - 1) * 25.0 + (double)v4 * 48.0;
    double v6 = PKUIScreenScale();
    v25.double width = v5;
    v25.double height = 48.0;
    UIGraphicsBeginImageContextWithOptions(v25, 0, v6);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      double x = 0.0;
      double width = 48.0;
      double y = 0.0;
      double height = 48.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "drawInRect:", x, y, width, height, (void)v18);
          v26.origin.double x = x;
          v26.origin.double y = y;
          v26.size.double width = width;
          v26.size.double height = height;
          CGRect v27 = CGRectOffset(v26, 73.0, 0.0);
          double x = v27.origin.x;
          double y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v16 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)_updateBodyImage
{
  id v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  unint64_t v4 = (void *)[v3 initWithBundleIdentifier:*MEMORY[0x1E4F874A0] allowPlaceholder:1 error:0];
  CGFloat v5 = PKUIGetAppIconForApplicationRecord(v4);
  [v2 safelyAddObject:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v7 = (void *)[v6 initWithBundleIdentifier:*MEMORY[0x1E4F87078] allowPlaceholder:1 error:0];
  uint64_t v8 = PKUIGetAppIconForApplicationRecord(v7);
  [v2 safelyAddObject:v8];

  uint64_t v9 = PKUIImageNamed(@"iCloud");
  [v2 safelyAddObject:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke_2;
  v11[3] = &unk_1E59CA870;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v2;
  id v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __60__PKPaymentPassAMPEnrollmentViewController__updateBodyImage__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) explanationView];
  id v2 = [*(id *)(a1 + 32) _createBodyImage:*(void *)(a1 + 40)];
  [v3 setBodyImage:v2];
}

- (void)_performAMPEnrollmentWithPass:(id)a3 asDefault:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F84188] sharedManager];
  uint64_t v11 = AMPEnrollmentDismissedKeyForPass();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke;
  aBlock[3] = &unk_1E59CDC80;
  void aBlock[4] = self;
  id v25 = v11;
  id v12 = v11;
  id v13 = _Block_copy(aBlock);
  [(PKExplanationViewController *)self showSpinner:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_2;
  v18[3] = &unk_1E59D79B0;
  id v19 = v10;
  id v20 = v8;
  BOOL v23 = a4;
  id v21 = v13;
  id v22 = v9;
  id v14 = v9;
  id v15 = v13;
  id v16 = v8;
  id v17 = v10;
  [v17 enrollmentStatusForPaymentPass:v16 completion:v18 progress:v15];
}

void __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v9 = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "AMP enrollment completed:%d (%@)", buf, 0x12u);
  }

  [*(id *)(*(void *)(a1 + 32) + 1072) reportPageCompleted:a2 context:0];
  PKSharedCacheSetBoolForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_64;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_64(uint64_t a1)
{
  [*(id *)(a1 + 32) showSpinner:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 proceedToNextScreen];
}

void __95__PKPaymentPassAMPEnrollmentViewController__performAMPEnrollmentWithPass_asDefault_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      [*(id *)(a1 + 32) enrollPaymentPass:*(void *)(a1 + 40) isDefault:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
      uint64_t v5 = *(void *)(a1 + 56);
      if (!v5) {
        goto LABEL_9;
      }
      id v6 = *(void (**)(void))(v5 + 16);
      goto LABEL_8;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (!v7) {
    goto LABEL_9;
  }
  id v6 = *(void (**)(void))(v7 + 16);
LABEL_8:
  v6();
LABEL_9:
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v7 = objc_msgSend(a4, "absoluteString", a3);
  if ([v7 isEqualToString:@"OPEN_TERMS_AND_CONDITIONS"])
  {
    [(PKExplanationViewController *)self showSpinner:1];
    [(PKPaymentPassAMPEnrollmentViewController *)self _performTerms];
  }

  return 0;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_termsController == a3)
  {
    id v6 = a4;
    PKPaymentSetupApplyContextAppearance([(PKExplanationViewController *)self context], v6);
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(PKPaymentPassAMPEnrollmentViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (PKPaymentPassAMPEnrollmentViewControllerFlowDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentPassAMPEnrollmentViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end