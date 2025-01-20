@interface PKPhysicalCardReaderModeActivationViewController
- (PKPhysicalCardReaderModeActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7;
- (void)_dismiss;
- (void)_invalidate;
- (void)_presentActivationWithActivationCode:(id)a3;
- (void)_startTagReaderSession;
- (void)_stopTagReaderSession;
- (void)dealloc;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)nfcTagReaderSession:(id)a3 didDetectTags:(id)a4;
- (void)nfcTagReaderSessionDidEndUnexpectedly:(id)a3;
- (void)nfcTagReaderSessionDidTimeout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPhysicalCardReaderModeActivationViewController

- (PKPhysicalCardReaderModeActivationViewController)initWithAccountService:(id)a3 account:(id)a4 accountUser:(id)a5 paymentPass:(id)a6 physicalCard:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  v17 = [(PKExplanationViewController *)&v21 initWithContext:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accountService, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountUser, a5);
    objc_storeStrong((id *)&v18->_physicalCard, a7);
    objc_storeStrong((id *)&v18->_paymentPass, a6);
    v18->_feature = [v14 feature];
    v18->_deviceSupportsReaderMode = +[PKPhysicalCardController deviceSupportsContactlessActivation];
    [(PKExplanationViewController *)v18 setShowCancelButton:1];
    [(PKExplanationViewController *)v18 setShowDoneButton:0];
  }

  return v18;
}

- (void)dealloc
{
  [(PKPhysicalCardReaderModeActivationViewController *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  [(PKPhysicalCardReaderModeActivationViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  [(PKExplanationViewController *)&v15 viewDidLoad];
  objc_super v3 = objc_alloc_init(PKPhysicalCardActivationAnimationView);
  animationView = self->_animationView;
  self->_animationView = v3;

  v5 = self->_animationView;
  v6 = [(PKPhysicalCard *)self->_physicalCard nameOnCard];
  [(PKPhysicalCardActivationAnimationView *)v5 setNameOnCard:v6];

  v7 = [(PKExplanationViewController *)self explanationView];
  [v7 setDelegate:self];
  [v7 setShowPrivacyView:0];
  [v7 setForceShowSetupLaterButton:1];
  [v7 setHeroView:self->_animationView];
  v8 = PKLocalizedFeatureString();
  [v7 setTitleText:v8];

  v9 = PKLocalizedFeatureString();
  [v7 setBodyText:v9];

  v10 = [v7 dockView];
  [v10 setPrimaryButton:0];
  v11 = [v7 dockView];
  v12 = [v11 footerView];

  [v12 setSkipCardButton:0];
  [v12 setManualEntryButton:0];
  id v13 = [v12 setupLaterButton];
  id v14 = PKLocalizedFeatureString();
  [v13 setTitle:v14 forState:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  [(PKPhysicalCardReaderModeActivationViewController *)&v4 viewDidAppear:a3];
  [(PKPhysicalCardReaderModeActivationViewController *)self _startTagReaderSession];
  [(PKPhysicalCardActivationAnimationView *)self->_animationView startAnimation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardReaderModeActivationViewController;
  [(PKPhysicalCardReaderModeActivationViewController *)&v4 viewWillDisappear:a3];
  [(PKPhysicalCardReaderModeActivationViewController *)self _stopTagReaderSession];
}

- (void)nfcTagReaderSession:(id)a3 didDetectTags:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 firstObject];
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke;
    v9[3] = &unk_1E59D7A58;
    objc_copyWeak(&v11, &location);
    id v10 = v8;
    [v6 readNDEFMessageFromTag:v10 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_14;
  }
  v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v6 = [(__CFString *)v3 stringByTrimmingCharactersInSet:v5];

  objc_super v3 = v6;
  id v7 = @"wallet://activate/nfc";
  if (v3 == v7)
  {

LABEL_11:
    [WeakRetained _stopTagReaderSession];
    id v11 = [*(id *)(a1 + 32) tagIdentifier];
    v12 = [v11 hexEncoding];

    if (v12)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke_2;
      v13[3] = &unk_1E59CA870;
      v13[4] = WeakRetained;
      id v14 = v12;
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
    goto LABEL_14;
  }
  v8 = v7;
  if (v3) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {

    goto LABEL_14;
  }
  int v10 = [(__CFString *)v3 isEqualToString:v7];

  if (v10) {
    goto LABEL_11;
  }
LABEL_14:
}

uint64_t __86__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSession_didDetectTags___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentActivationWithActivationCode:*(void *)(a1 + 40)];
}

- (void)nfcTagReaderSessionDidEndUnexpectedly:(id)a3
{
  objc_super v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error in physical card activation reader session. Dismissing...", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopTagReaderSession];
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)nfcTagReaderSessionDidTimeout:(id)a3
{
  objc_super v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error in physical card activation reader session due to timeout. Dismissing...", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidTimeout___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKPhysicalCardReaderModeActivationViewController_nfcTagReaderSessionDidTimeout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopTagReaderSession];
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v5 = [[PKPhysicalCardSupportViewController alloc] initWithAccountService:self->_accountService account:self->_account accountUser:self->_accountUser paymentPass:self->_paymentPass physicalCard:self->_physicalCard];
  objc_super v4 = [(PKPhysicalCardReaderModeActivationViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)_dismiss
{
  [(PKPhysicalCardReaderModeActivationViewController *)self _stopTagReaderSession];
  id v3 = [(PKPhysicalCardReaderModeActivationViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_startTagReaderSession
{
  if (!self->_invalidated && self->_deviceSupportsReaderMode)
  {
    if (self->_sessionHandle)
    {
      readerSession = self->_readerSession;
      if (readerSession)
      {
        [(PKNFCTagReaderSession *)readerSession startPolling];
      }
    }
    else
    {
      objc_initWeak(&location, self);
      objc_super v4 = (void *)MEMORY[0x1E4F84800];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke;
      v7[3] = &unk_1E59D7A80;
      objc_copyWeak(&v8, &location);
      v5 = [v4 startReaderSessionWithCompletion:v7];
      sessionHandle = self->_sessionHandle;
      self->_sessionHandle = v5;

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __74__PKPhysicalCardReaderModeActivationViewController__startTagReaderSession__block_invoke_2(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1096))
  {
    id v3 = a1[4];
    BOOL v9 = WeakRetained;
    if (v3)
    {
      objc_storeStrong(WeakRetained + 139, v3);
      [a1[4] setDelegate:v9];
      [a1[4] startPolling];
LABEL_5:
      id WeakRetained = v9;
      goto LABEL_6;
    }
    objc_super v4 = [a1[5] domain];
    id v5 = [NSString stringWithUTF8String:"nfcd"];
    int v6 = [v4 isEqualToString:v5];

    id WeakRetained = v9;
    if (v6)
    {
      BOOL v7 = [a1[5] code] == 50;
      id WeakRetained = v9;
      if (v7)
      {
        id v8 = PKCreateAlertControllerForNFCRadioDisabled();
        [v9 presentViewController:v8 animated:1 completion:0];

        goto LABEL_5;
      }
    }
  }
LABEL_6:
}

- (void)_stopTagReaderSession
{
  if (!self->_invalidated)
  {
    [(PKPaymentSessionHandle *)self->_sessionHandle invalidateSession];
    readerSession = self->_readerSession;
    self->_readerSession = 0;

    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = 0;
  }
}

- (void)_presentActivationWithActivationCode:(id)a3
{
  id v4 = a3;
  int v6 = [[PKPhysicalCardManualActivationViewController alloc] initWithAccountService:self->_accountService account:self->_account accountUser:self->_accountUser paymentPass:self->_paymentPass physicalCard:self->_physicalCard activationCode:v4];

  id v5 = [(PKPhysicalCardReaderModeActivationViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_invalidate
{
  if (!self->_invalidated)
  {
    [(PKPhysicalCardReaderModeActivationViewController *)self _stopTagReaderSession];
    self->_invalidated = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end