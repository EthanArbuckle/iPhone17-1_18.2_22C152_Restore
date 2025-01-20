@interface PKPaymentVerificationController
- (BOOL)isBankAppInstalled;
- (BOOL)shouldDisabledVerificationButton;
- (NSString)alternateMethodButtonTitle;
- (NSString)continueVerificationButtonTitle;
- (NSString)verificationBodyString;
- (NSString)verificationTitleString;
- (PKPassView)passView;
- (PKPaymentPass)pass;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 passView:(id)a4 webService:(id)a5 context:(int64_t)a6 delegate:(id)a7 setupDelegate:(id)a8 verificationContext:(int64_t)a9;
- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 verificationContext:(int64_t)a6;
- (PKPaymentVerificationControllerDelegate)delegate;
- (PKPaymentVerificationControllerFlowDelegate)flowDelegate;
- (PKPaymentWebService)webService;
- (PKVerificationRequestRecord)verificationRecord;
- (id)_bankAppName;
- (id)_bankAppStoreIDs;
- (id)_continueVerificationButtonTitleForBankAppChannel:(id)a3;
- (id)_formattedPhoneNumber:(id)a3 forTextMessage:(BOOL)a4;
- (id)_outboundCallPhoneNumber;
- (id)_verificationBodyStringForBankAppChannel:(id)a3;
- (id)_verificationBodyStringForOutboundPhoneCallChannel:(id)a3;
- (id)bankAppStoreID;
- (id)defaultVerificationBodyString;
- (id)passSnapshot;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (id)verificationSecureURL;
- (id)verificationURL;
- (id)verificationURLComponents;
- (int64_t)context;
- (int64_t)verificationContext;
- (unint64_t)_channelType;
- (void)_accessBankVerificationURLAsAppClip;
- (void)_accessBankVerificationURLAsWebPage:(id)a3;
- (void)_canPerformVerificationInlineForChannel:(id)a3 completion:(id)a4;
- (void)_completeVerificationUsingBankApp;
- (void)_didChangePresentation;
- (void)_downloadAndAddPassWithCompletion:(id)a3;
- (void)_isAppClipVerificationURLWithCompletion:(id)a3;
- (void)_lookForBankAppIfNecessary;
- (void)_presentVerificationViewController;
- (void)_presentVerificatonEntryCompletionViewController;
- (void)_queue_sharedPaymentWebServiceChanged;
- (void)_requestDelegatePresentationOfViewController:(id)a3 completion:(id)a4;
- (void)_resetState;
- (void)_updateVerificationStatusToComplete;
- (void)_wrapViewControllerAndRequestDelegatePresentationOfView:(id)a3;
- (void)canPerformAnyVerificationInline:(id)a3;
- (void)canPerformVerificationInline:(id)a3;
- (void)clearSelectedChannel;
- (void)completeVerificationUsingOutboundCall;
- (void)completeVerificationUsingURL;
- (void)continueVerification;
- (void)continueVerificationUsingMethods;
- (void)dealloc;
- (void)goToPreviousStep;
- (void)launchBankApp;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)performStoreLookupForBankAppWithCompletion:(id)a3;
- (void)performVerificationOptionsRequest:(id)a3 completion:(id)a4;
- (void)performVerificationUpdateRequest:(id)a3 completion:(id)a4;
- (void)selectOtherVerificationMethod;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setPass:(id)a3;
- (void)setPassView:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setVerificationContext:(int64_t)a3;
- (void)setVerificationRecord:(id)a3;
- (void)sharedPaymentServiceChanged;
- (void)submitVerificationCode:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentVerificationController

- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 passView:(id)a4 webService:(id)a5 context:(int64_t)a6 delegate:(id)a7 setupDelegate:(id)a8 verificationContext:(int64_t)a9
{
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  v19 = [(PKPaymentVerificationController *)self initWithPaymentPass:a3 webService:a5 context:a6 verificationContext:a9];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_passView, a4);
    objc_storeWeak((id *)&v20->_setupDelegate, v18);
    objc_storeWeak((id *)&v20->_delegate, v17);
    id v21 = [(PKPaymentVerificationController *)v20 passSnapshot];
  }

  return v20;
}

- (PKPaymentVerificationController)initWithPaymentPass:(id)a3 webService:(id)a4 context:(int64_t)a5 verificationContext:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentVerificationController;
  v13 = [(PKPaymentVerificationController *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pass, a3);
    objc_storeStrong((id *)&v14->_webService, a4);
    v14->_context = a5;
    v14->_verificationContext = a6;
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v14 selector:sel_sharedPaymentServiceChanged name:*MEMORY[0x1E4F87E88] object:0];

    [(PKPaymentVerificationController *)v14 _queue_sharedPaymentWebServiceChanged];
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F87E88] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationController;
  [(PKPaymentVerificationController *)&v4 dealloc];
}

- (void)setPassView:(id)a3
{
  v5 = (PKPassView *)a3;
  if (self->_passView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_passView, a3);
    passSnapshot = self->_passSnapshot;
    self->_passSnapshot = 0;

    v5 = v7;
  }
}

- (id)passSnapshot
{
  passSnapshot = self->_passSnapshot;
  if (!passSnapshot)
  {
    passSnapshot = self->_passView;
    if (passSnapshot)
    {
      objc_super v4 = [passSnapshot pass];
      [v4 loadImageSetSync:0 preheat:1];

      v5 = [(PKPassView *)self->_passView snapshotOfFrontFace];
      v6 = self->_passSnapshot;
      self->_passSnapshot = v5;

      passSnapshot = self->_passSnapshot;
    }
  }

  return passSnapshot;
}

- (void)sharedPaymentServiceChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentVerificationController_sharedPaymentServiceChanged__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__PKPaymentVerificationController_sharedPaymentServiceChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_sharedPaymentWebServiceChanged");
}

- (void)_queue_sharedPaymentWebServiceChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaymentWebService *)self->_webService verificationRecordForPass:self->_pass];
  if (!v3)
  {
    if (PKShowFakeVerificationChannels())
    {
      v3 = [MEMORY[0x1E4F85100] verificationRequestRecordForPass:self->_pass];
    }
    else
    {
      v3 = 0;
    }
  }
  [(PKPaymentVerificationController *)self setVerificationRecord:v3];
  objc_super v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Received updated record: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setVerificationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_verificationRecord, a3);
  [(PKPaymentVerificationController *)self _resetState];
  [(PKPaymentVerificationController *)self _didChangePresentation];

  [(PKPaymentVerificationController *)self _lookForBankAppIfNecessary];
}

- (void)_resetState
{
  installedBankAppBundleID = self->_installedBankAppBundleID;
  self->_installedBankAppBundleID = 0;

  installedBankAppTitle = self->_installedBankAppTitle;
  self->_installedBankAppTitle = 0;

  inStoreBankAppTitle = self->_inStoreBankAppTitle;
  self->_inStoreBankAppTitle = 0;

  inStoreBankAppStoreID = self->_inStoreBankAppStoreID;
  self->_inStoreBankAppStoreID = 0;

  self->_bankAppNotFound = 0;
}

- (void)_lookForBankAppIfNecessary
{
  verificationRecord = self->_verificationRecord;
  uint64_t v4 = [(PKVerificationRequestRecord *)verificationRecord verificationStatus];
  if (verificationRecord && ((unint64_t)(v4 - 2) < 2 || v4 == 4000))
  {
    uint64_t v5 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
      uint64_t v8 = [v7 type];

      if (v8 == 5 && ![(PKPaymentVerificationController *)self isBankAppInstalled])
      {
        [(PKPaymentVerificationController *)self performStoreLookupForBankAppWithCompletion:0];
      }
    }
  }
}

- (void)_didChangePresentation
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didChangeVerificationPresentation];
  }
}

- (BOOL)shouldDisabledVerificationButton
{
  return [(PKPaymentVerificationController *)self _channelType] == 5 && self->_bankAppNotFound;
}

- (unint64_t)_channelType
{
  v3 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
  unint64_t v4 = [v3 type];

  if (v4 == 5)
  {
    if (self->_bankAppNotFound)
    {
      if ([(PKPaymentPass *)self->_pass supportsBarcodePayment]) {
        return 5;
      }
      else {
        return 4;
      }
    }
    else
    {
      return 5;
    }
  }
  return v4;
}

- (NSString)verificationTitleString
{
  v3 = @"VERIFICATION_REQUIRED_TITLE";
  unint64_t v4 = PKLocalizedPaymentString(&cfstr_VerificationRe_1.isa);
  uint64_t v5 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if ((unint64_t)(v5 - 2) < 2 || v5 == 4000)
  {
    v6 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];

    if (!v6) {
      goto LABEL_7;
    }
    if ([(PKPaymentVerificationController *)self _channelType] - 1 < 2) {
      v3 = @"VERIFICATION_REQUESTED_TITLE";
    }
  }
  uint64_t v7 = PKLocalizedPaymentString(&v3->isa);

  unint64_t v4 = (void *)v7;
LABEL_7:

  return (NSString *)v4;
}

- (NSString)verificationBodyString
{
  v3 = [(PKPaymentVerificationController *)self defaultVerificationBodyString];
  uint64_t v4 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if ((unint64_t)(v4 - 2) < 2 || v4 == 4000)
  {
    uint64_t v5 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
    if (v5)
    {
      switch([(PKPaymentVerificationController *)self _channelType])
      {
        case 1uLL:
          uint64_t v6 = [v5 contactPoint];
          PKLocalizedPaymentString(&cfstr_VerificationSe.isa, &stru_1EF1B4C70.isa, v6);
          goto LABEL_16;
        case 2uLL:
          uint64_t v6 = [v5 contactPoint];
          uint64_t v8 = [(PKPaymentVerificationController *)self _formattedPhoneNumber:v6 forTextMessage:1];
          PKLocalizedPaymentString(&cfstr_VerificationSe_0.isa, &stru_1EF1B4C70.isa, v8);
          goto LABEL_10;
        case 3uLL:
          uint64_t v6 = [v5 contactPoint];
          uint64_t v8 = [(PKPaymentVerificationController *)self _formattedPhoneNumber:v6 forTextMessage:0];
          PKLocalizedPaymentString(&cfstr_VerificationSe_1.isa, &stru_1EF1B4C70.isa, v8);
          uint64_t v9 = LABEL_10:;

          goto LABEL_17;
        case 4uLL:
          uint64_t v7 = [(PKPaymentVerificationController *)self _verificationBodyStringForOutboundPhoneCallChannel:v5];
          goto LABEL_14;
        case 5uLL:
          uint64_t v7 = [(PKPaymentVerificationController *)self _verificationBodyStringForBankAppChannel:v5];
          goto LABEL_14;
        case 6uLL:
          uint64_t v7 = PKLocalizedPaymentString(&cfstr_VerificationSe_2.isa);
          goto LABEL_14;
        case 7uLL:
          goto LABEL_19;
        case 8uLL:
          uint64_t v6 = [v5 contactPoint];
          PKLocalizedPaymentString(&cfstr_VerificationUr.isa, &stru_1EF1B4C70.isa, v6);
          uint64_t v9 = LABEL_16:;

LABEL_17:
          v3 = (void *)v6;
          break;
        default:
          uint64_t v7 = [(PKPaymentVerificationController *)self defaultVerificationBodyString];
LABEL_14:
          uint64_t v9 = v7;
          break;
      }

      v3 = (void *)v9;
    }
  }
  else
  {
    [(PKPaymentVerificationController *)self defaultVerificationBodyString];
    v3 = uint64_t v5 = v3;
  }
LABEL_19:

  return (NSString *)v3;
}

- (id)defaultVerificationBodyString
{
  return (id)PKLocalizedPaymentString(&cfstr_VerificationRe_3.isa);
}

- (id)_formattedPhoneNumber:(id)a3 forTextMessage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 containsString:@"•"])
  {
    id v6 = v5;
  }
  else if (v4)
  {
    id v6 = (id)CPPhoneNumberCopyFormattedStringForTextMessage();
  }
  else
  {
    id v6 = (id)CPPhoneNumberCopyFormattedStringForVoiceCall();
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_verificationBodyStringForOutboundPhoneCallChannel:(id)a3
{
  BOOL v4 = [a3 contactPoint];
  if (![v4 length] || self->_bankAppNotFound)
  {
    uint64_t v5 = [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];

    BOOL v4 = (void *)v5;
  }
  id v6 = [(PKPaymentVerificationController *)self _formattedPhoneNumber:v4 forTextMessage:0];
  uint64_t v7 = PKLocalizedPaymentString(&cfstr_VerificationSe_3.isa, &stru_1EF1B4C70.isa, v6);

  return v7;
}

- (id)_verificationBodyStringForBankAppChannel:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  char v6 = [(PKPaymentPass *)pass supportsBarcodePayment];
  uint64_t v7 = [v5 contactPoint];

  if (v6) {
    PKLocalizedAquamanString(&cfstr_AccountVerific_0.isa, &stru_1EF1B4C70.isa, v7);
  }
  else {
  uint64_t v8 = PKLocalizedPaymentString(&cfstr_VerificationSe_4.isa, &stru_1EF1B4C70.isa, v7);
  }

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [(PKPaymentVerificationController *)self defaultVerificationBodyString];
  }
  v10 = v9;

  return v10;
}

- (NSString)continueVerificationButtonTitle
{
  uint64_t v3 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if (((unint64_t)(v3 - 2) < 2 || v3 == 4000)
    && ([(PKVerificationRequestRecord *)self->_verificationRecord channel],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    switch([(PKPaymentVerificationController *)self _channelType])
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 6uLL:
        id v5 = @"ENTER_CODE_BUTTON";
        goto LABEL_7;
      case 4uLL:
        uint64_t v8 = [(PKPaymentPass *)self->_pass organizationName];
        uint64_t v9 = PKLocalizedPaymentString(&cfstr_CallIssuerButt.isa, &stru_1EF1B4C70.isa, v8);
        goto LABEL_14;
      case 5uLL:
        uint64_t v8 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
        uint64_t v9 = [(PKPaymentVerificationController *)self _continueVerificationButtonTitleForBankAppChannel:v8];
LABEL_14:
        char v6 = (void *)v9;
        break;
      case 8uLL:
        uint64_t v8 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
        v10 = [v8 contactPoint];
        char v6 = PKLocalizedPaymentString(&cfstr_OpenBankUrlBut.isa, &stru_1EF1B4C70.isa, v10);

        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    id v5 = @"COMPLETE_VERIFICATION_TITLE";
LABEL_7:
    char v6 = PKLocalizedPaymentString(&v5->isa);
  }

  return (NSString *)v6;
}

- (id)_continueVerificationButtonTitleForBankAppChannel:(id)a3
{
  BOOL v4 = [(PKPaymentVerificationController *)self _bankAppName];
  if ([(PKPaymentVerificationController *)self isBankAppInstalled])
  {
    PKLocalizedPaymentString(&cfstr_OpenBankAppBut.isa, &stru_1EF1B4C70.isa, v4);
    uint64_t v5 = LABEL_5:;
LABEL_6:
    char v6 = (void *)v5;
    goto LABEL_7;
  }
  if (self->_inStoreBankAppTitle)
  {
    PKLocalizedPaymentString(&cfstr_ViewBankAppBut.isa, &stru_1EF1B4C70.isa, v4);
    goto LABEL_5;
  }
  if (self->_bankAppNotFound)
  {
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_NotAvailable.isa);
    goto LABEL_6;
  }
  char v6 = 0;
LABEL_7:

  return v6;
}

- (NSString)alternateMethodButtonTitle
{
  uint64_t v3 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if (((unint64_t)(v3 - 2) < 2 || v3 == 4000)
    && ([(PKVerificationRequestRecord *)self->_verificationRecord channel],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = [(PKPaymentVerificationController *)self _channelType];
    if (v5)
    {
      uint64_t v5 = PKLocalizedPaymentString(&cfstr_TryAgainButton_0.isa);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (id)_bankAppName
{
  uint64_t v3 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
  BOOL v4 = [v3 contactPoint];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    char v6 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
    uint64_t v7 = [v6 contactPoint];
  }
  else if ([(PKPaymentVerificationController *)self isBankAppInstalled] {
         && (installedBankAppTitle = self->_installedBankAppTitle) != 0
  }
         || (installedBankAppTitle = self->_inStoreBankAppTitle) != 0)
  {
    uint64_t v7 = installedBankAppTitle;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isBankAppInstalled
{
  installedBankAppBundleID = self->_installedBankAppBundleID;
  if (!installedBankAppBundleID)
  {
    BOOL v4 = [(PKPaymentVerificationController *)self _bankAppStoreIDs];
    if ([v4 count])
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x3032000000;
      id v21 = __Block_byref_object_copy__15;
      v22 = __Block_byref_object_dispose__15;
      id v23 = 0;
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      id v6 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __53__PKPaymentVerificationController_isBankAppInstalled__block_invoke;
      v14[3] = &unk_1E59D2378;
      id v15 = v4;
      objc_super v17 = &v18;
      uint64_t v7 = v5;
      id v16 = v7;
      [v6 getLibraryItemsForITunesStoreItemIdentifiers:v15 completionBlock:v14];
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v8 = (void *)v19[5];
      if (v8)
      {
        uint64_t v9 = [v8 valueForProperty:*MEMORY[0x1E4FA8928]];
        v10 = self->_installedBankAppBundleID;
        self->_installedBankAppBundleID = v9;

        id v11 = [(id)v19[5] valueForProperty:*MEMORY[0x1E4FA8958]];
        installedBankAppTitle = self->_installedBankAppTitle;
        self->_installedBankAppTitle = v11;
      }
      _Block_object_dispose(&v18, 8);
    }
    installedBankAppBundleID = self->_installedBankAppBundleID;
  }
  return installedBankAppBundleID != 0;
}

void __53__PKPaymentVerificationController_isBankAppInstalled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  uint64_t v18 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    uint64_t v3 = *MEMORY[0x1E4FA8948];
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = *(void *)(*((void *)&v23 + 1) + 8 * v4);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = v17;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            id v12 = [v11 valueForProperty:v3];
            int v13 = [v12 isEqual:v5];

            if (v13)
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(v18 + 48) + 8) + 40), v11);
              goto LABEL_16;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      if (*(void *)(*(void *)(*(void *)(v18 + 48) + 8) + 40)) {
        break;
      }
      if (++v4 == v16)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v18 + 40));
}

- (id)_bankAppStoreIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
  uint64_t v5 = [v4 sourceAddress];
  uint64_t v6 = [v5 integerValue];

  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(PKPaymentPass *)self->_pass storeIdentifiers];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [(PKPaymentPass *)self->_pass storeIdentifiers];
    [v3 addObjectsFromArray:v10];
  }
  id v11 = (void *)[v3 copy];

  return v11;
}

- (void)performStoreLookupForBankAppWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(PKPaymentVerificationController *)self _bankAppStoreIDs];
  if ([v5 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke;
    v7[3] = &unk_1E59D23A0;
    v7[4] = self;
    id v8 = v5;
    uint64_t v9 = v4;
    id v6 = PKLookupAppStoreApplications(v8, v7);
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59CB728;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __78__PKPaymentVerificationController_performStoreLookupForBankAppWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 displayName];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    uint64_t v7 = [v3 appStoreIdentifier];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v7;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (!*(void *)(v10 + 32) && !*(void *)(v10 + 8))
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "None of the specified bank apps (%@) were found installed or on the store, will fall back to Outbound Call (Customer Service) verification", (uint8_t *)&v14, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 48) = 1;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
  [*(id *)(a1 + 40) _didChangePresentation];
}

- (id)verificationURL
{
  v2 = [(PKPaymentVerificationController *)self verificationURLComponents];
  id v3 = [v2 URL];

  return v3;
}

- (id)verificationSecureURL
{
  v2 = [(PKPaymentVerificationController *)self verificationURLComponents];
  [v2 setScheme:@"https"];
  id v3 = [v2 URL];

  return v3;
}

- (id)verificationURLComponents
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F29088]);
  uint64_t v4 = [(PKPaymentVerificationController *)self verificationRecord];
  uint64_t v5 = [v4 channel];
  id v6 = [v5 sourceAddress];
  long long v24 = (void *)[v3 initWithString:v6];

  uint64_t v7 = [(PKPaymentVerificationController *)self pass];
  uint64_t v8 = [v7 paymentPass];

  uint64_t v9 = [v8 deviceAccountIdentifier];
  id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v10 setScheme:*MEMORY[0x1E4F88088]];
  [v10 setHost:*MEMORY[0x1E4F88038]];
  id v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"deviceAccountIdentifier" value:v9];
  v26[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"success" value:@"true"];
  v26[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v10 setQueryItems:v13];

  int v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"deviceAccountIdentifier" value:v9];
  v25[0] = v14;
  uint64_t v15 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v16 = [v8 primaryAccountNumberSuffix];
  id v17 = [v15 queryItemWithName:@"primaryAccountNumberSuffix" value:v16];
  v25[1] = v17;
  uint64_t v18 = (void *)MEMORY[0x1E4F290C8];
  long long v19 = [v10 URL];
  long long v20 = [v19 absoluteString];
  long long v21 = [v18 queryItemWithName:@"redirectUrl" value:v20];
  v25[2] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  [v24 setQueryItems:v22];

  return v24;
}

- (void)_isAppClipVerificationURLWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentVerificationController *)self verificationURL];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F590E8]) initWithURL:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentVerificationController__isAppClipVerificationURLWithCompletion___block_invoke;
  v8[3] = &unk_1E59D23C8;
  id v9 = v4;
  id v7 = v4;
  [v6 requestMetadataWithCompletion:v8];
}

uint64_t __75__PKPaymentVerificationController__isAppClipVerificationURLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)bankAppStoreID
{
  return self->_inStoreBankAppStoreID;
}

- (id)_outboundCallPhoneNumber
{
  id v3 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
  id v4 = [v3 contactPoint];

  if (!v4)
  {
LABEL_4:
    [(PKPaymentPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
    id v4 = v5 = v4;
    goto LABEL_5;
  }
  uint64_t v5 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
  if ([v5 type] == 5)
  {
    BOOL bankAppNotFound = self->_bankAppNotFound;

    if (!bankAppNotFound) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_5:

LABEL_6:

  return v4;
}

- (void)canPerformVerificationInline:(id)a3
{
  verificationRecord = self->_verificationRecord;
  uint64_t v5 = (void (**)(id, void))a3;
  uint64_t v6 = [(PKVerificationRequestRecord *)verificationRecord channel];
  id v7 = (id)v6;
  if (v6) {
    [(PKPaymentVerificationController *)self _canPerformVerificationInlineForChannel:v6 completion:v5];
  }
  else {
    v5[2](v5, 0);
  }
}

- (void)canPerformAnyVerificationInline:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int v14 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [(PKVerificationRequestRecord *)self->_verificationRecord allChannels];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke;
          v18[3] = &unk_1E59CC7D8;
          v18[4] = self;
          v18[5] = v11;
          v18[6] = v23;
          objc_msgSend(v6, "addOperation:", v18, v14);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
    }

    uint64_t v5 = v14;
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_3;
    v15[3] = &unk_1E59D23F0;
    id v16 = v14;
    id v17 = v23;
    id v13 = (id)[v6 evaluateWithInput:v12 completion:v15];

    _Block_object_dispose(v23, 8);
  }
}

void __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_2;
  v13[3] = &unk_1E59D20A8;
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 _canPerformVerificationInlineForChannel:v9 completion:v13];
}

uint64_t __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_2(void *a1, int a2)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 == 2)
  {
    if (!a2)
    {
      uint64_t v3 = 2;
      return (*(uint64_t (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v3 == 1);
    }
    uint64_t v4 = 1;
    goto LABEL_8;
  }
  if (!v3)
  {
    uint64_t v4 = 1;
    if (!a2) {
      uint64_t v4 = 2;
    }
LABEL_8:
    *(void *)(v2 + 24) = v4;
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 24);
  }
  return (*(uint64_t (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v3 == 1);
}

uint64_t __67__PKPaymentVerificationController_canPerformAnyVerificationInline___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 2);
}

- (void)_canPerformVerificationInlineForChannel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke;
    aBlock[3] = &unk_1E59CF408;
    id v8 = v6;
    id v14 = v8;
    id v15 = v7;
    uint64_t v9 = _Block_copy(aBlock);
    uint64_t v10 = [v8 type];
    if (v10 == 8)
    {
      if (![(PKPaymentVerificationController *)self isBankAppInstalled])
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke_141;
        v11[3] = &unk_1E59CA9F8;
        id v12 = v9;
        [(PKPaymentVerificationController *)self _isAppClipVerificationURLWithCompletion:v11];

        goto LABEL_7;
      }
    }
    else if (v10 == 2)
    {
      (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(void *, void))v9 + 2))(v9, 0);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v5 = @"Yes";
    }
    else {
      uint64_t v5 = @"No";
    }
    id v6 = [*(id *)(a1 + 32) identifier];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Can perform verification inline: '%@' for '%@'", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __86__PKPaymentVerificationController__canPerformVerificationInlineForChannel_completion___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)selectOtherVerificationMethod
{
  uint64_t v3 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if ((unint64_t)(v3 - 2) < 2 || v3 == 4000)
  {
    [(PKPaymentVerificationController *)self goToPreviousStep];
  }
  else
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present other verification methods for fields", v5, 2u);
    }
  }
}

- (void)continueVerification
{
  uint64_t v3 = [(PKVerificationRequestRecord *)self->_verificationRecord verificationStatus];
  if ((unint64_t)(v3 - 2) < 2 || v3 == 4000)
  {
    [(PKPaymentVerificationController *)self continueVerificationUsingMethods];
  }
  else
  {
    [(PKPaymentVerificationController *)self retryCurrentStep];
  }
}

- (void)continueVerificationUsingMethods
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PKVerificationRequestRecord *)self->_verificationRecord channel];
    uint64_t v5 = [v4 typeDescriptionUnlocalized];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Continuing verification with selected channel: '%@'", (uint8_t *)&v6, 0xCu);
  }
  switch([(PKPaymentVerificationController *)self _channelType])
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 6uLL:
      [(PKPaymentVerificationController *)self _presentVerificatonEntryCompletionViewController];
      break;
    case 4uLL:
      [(PKPaymentVerificationController *)self completeVerificationUsingOutboundCall];
      break;
    case 5uLL:
      [(PKPaymentVerificationController *)self _completeVerificationUsingBankApp];
      break;
    case 8uLL:
      [(PKPaymentVerificationController *)self completeVerificationUsingURL];
      break;
    default:
      [(PKPaymentVerificationController *)self retryCurrentStep];
      break;
  }
}

- (void)goToPreviousStep
{
  id v3 = [(PKVerificationRequestRecord *)self->_verificationRecord previousStepIdentifier];
  [(PKVerificationRequestRecord *)self->_verificationRecord setCurrentStepIdentifier:v3];
  [(PKPaymentWebService *)self->_webService updateVerificationRecord:self->_verificationRecord];
  [(PKPaymentVerificationController *)self _presentVerificationViewController];
}

- (void)_completeVerificationUsingBankApp
{
  if ([(PKPaymentVerificationController *)self isBankAppInstalled])
  {
    [(PKPaymentVerificationController *)self launchBankApp];
  }
  else if (self->_inStoreBankAppStoreID)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

    if (WeakRetained)
    {
      uint64_t v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Skipping completeVerificationUsingBankApp because flow item delegate present", buf, 2u);
      }
    }
    else
    {
      int v6 = [[PKStoreProductViewPresenter alloc] initWithProductDelegate:0];
      [(PKStoreProductViewPresenter *)v6 loadProductForItemIdentifier:self->_inStoreBankAppStoreID customProductPageIdentifier:0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__PKPaymentVerificationController__completeVerificationUsingBankApp__block_invoke;
      v7[3] = &unk_1E59D2418;
      void v7[4] = self;
      [(PKStoreProductViewPresenter *)v6 presentStoreViewWithBlock:v7];
    }
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "No matching bank app installed and no app matching app found in store, there was possibly a store lookup error", buf, 2u);
    }

    self->_BOOL bankAppNotFound = 1;
  }
}

uint64_t __68__PKPaymentVerificationController__completeVerificationUsingBankApp__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _requestDelegatePresentationOfViewController:a2 completion:a3];
}

- (void)completeVerificationUsingURL
{
  if ([(PKPaymentVerificationController *)self isBankAppInstalled])
  {
    [(PKPaymentVerificationController *)self launchBankApp];
  }
  else
  {
    [(PKPaymentVerificationController *)self _accessBankVerificationURLAsAppClip];
  }
}

- (void)launchBankApp
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (self->_installedBankAppBundleID)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Starting bank app verification", v12, 2u);
    }

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [(PKPaymentPass *)self->_pass appLaunchURL];
    if (v5)
    {
      int v6 = (void *)v5;
      v14[0] = @"verify";
      v13[0] = @"action";
      v13[1] = @"passTypeIdentifier";
      id v7 = [(PKPaymentPass *)self->_pass passTypeIdentifier];
      v14[1] = v7;
      v13[2] = @"serialNumber";
      uint64_t v8 = [(PKPaymentPass *)self->_pass serialNumber];
      v14[2] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
      __int16 v10 = PKURLByAppendingQueryParams();

      [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F62678]];
    }
    id v11 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v4];
    PKOpenApplication(self->_installedBankAppBundleID, v11);
  }
}

- (void)_accessBankVerificationURLAsAppClip
{
  id v3 = [(PKPaymentVerificationController *)self verificationURL];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F590F0]) initWithURL:v3];
  [v4 setShouldReturnErrorOnUserCancellation:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke;
  v6[3] = &unk_1E59CDC80;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 requestClipWithCompletion:v6];
}

void __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke_2;
  block[3] = &unk_1E59CD7B0;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKPaymentVerificationController__accessBankVerificationURLAsAppClip__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v1 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v1, OS_LOG_TYPE_DEFAULT, "Starting app clip verification", v4, 2u);
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(void **)(a1 + 32);
    [v3 _accessBankVerificationURLAsWebPage:v2];
  }
}

- (void)_accessBankVerificationURLAsWebPage:(id)a3
{
  id v4 = a3;
  char v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Starting web url verification", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = objc_alloc(getASWebAuthenticationSessionClass());
  uint64_t v7 = *MEMORY[0x1E4F88088];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PKPaymentVerificationController__accessBankVerificationURLAsWebPage___block_invoke;
  v9[3] = &unk_1E59D2440;
  objc_copyWeak(&v10, buf);
  uint64_t v8 = (void *)[v6 initWithURL:v4 callbackURLScheme:v7 completionHandler:v9];
  [v8 setPresentationContextProvider:self];
  [v8 start];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __71__PKPaymentVerificationController__accessBankVerificationURLAsWebPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_23;
  }
  uint64_t v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v9)
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "URL verification returned error %@", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v12 = [v6 domain];
    id v13 = getASWebAuthenticationSessionErrorDomain();
    id v14 = v12;
    id v15 = v13;
    if (v14 == v15)
    {
    }
    else
    {
      uint64_t v16 = v15;
      if (!v14 || !v15)
      {

        goto LABEL_22;
      }
      char v17 = [v14 isEqualToString:v15];

      if ((v17 & 1) == 0) {
        goto LABEL_22;
      }
    }
    if ([v6 code] == 1)
    {
      [WeakRetained clearSelectedChannel];
      goto LABEL_23;
    }
LABEL_22:
    [WeakRetained goToPreviousStep];
    goto LABEL_23;
  }
  if (v9)
  {
    int v20 = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "URL verification returned callbackURL %@", (uint8_t *)&v20, 0xCu);
  }

  [WeakRetained _updateVerificationStatusToComplete];
  id v10 = objc_loadWeakRetained(WeakRetained + 10);

  if (v10)
  {
    id v11 = objc_loadWeakRetained(WeakRetained + 10);
    [v11 didFinishVerification];
LABEL_20:

    goto LABEL_23;
  }
  id v18 = objc_loadWeakRetained(WeakRetained + 8);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v11 = objc_loadWeakRetained(WeakRetained + 8);
    [v11 dismissVerificationViewControllerAnimated:1];
    goto LABEL_20;
  }
LABEL_23:
}

- (void)completeVerificationUsingOutboundCall
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Starting outbound call verification", buf, 2u);
  }

  id v4 = [(PKPaymentVerificationController *)self _outboundCallPhoneNumber];
  id v5 = PKTelephoneURLFromPhoneNumber();
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v7 = [v6 canOpenURL:v5];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PKPaymentVerificationController_completeVerificationUsingOutboundCall__block_invoke;
    v9[3] = &unk_1E59CB6D8;
    void v9[4] = self;
    [v8 openURL:v5 options:MEMORY[0x1E4F1CC08] completionHandler:v9];
  }
}

uint64_t __72__PKPaymentVerificationController_completeVerificationUsingOutboundCall__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) clearSelectedChannel];
  }
  return result;
}

- (void)_presentVerificationViewController
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKVerificationRequestRecord *)self->_verificationRecord currentStepIdentifier];
  PKLogFacilityTypeGetObject();
  id v4 = (PKPaymentVerificationMethodsViewController *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_19F450000, &v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Presenting verification VC for Step: '%@'", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  if (WeakRetained)
  {
    if (os_log_type_enabled(&v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19F450000, &v4->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Skipping presentVerificationViewController because flow item delegate present", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    id v4 = [[PKPaymentVerificationMethodsViewController alloc] initWithVerificationController:self];
    [(PKPaymentVerificationMethodsViewController *)v4 setProvisioningController:self->_provisioningController];
    [(PKPaymentVerificationController *)self _wrapViewControllerAndRequestDelegatePresentationOfView:v4];
  }
}

- (void)_presentVerificatonEntryCompletionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Skipping presentVerificatonEntryCompletionViewController because flow item delegate present", buf, 2u);
    }
  }
  else
  {
    id v5 = [[PKPaymentSetupVerificationCompletionViewController alloc] initWithVerificationController:self mode:0 offerOtherMethods:self->_verificationContext == 2];
    [(PKPaymentSetupVerificationCompletionViewController *)v5 setProvisioningController:self->_provisioningController];
    [(PKPaymentVerificationController *)self _wrapViewControllerAndRequestDelegatePresentationOfView:v5];
  }
}

- (void)clearSelectedChannel
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Clearing selected verification channel", v5, 2u);
  }

  id v4 = self->_verificationRecord;
  [(PKVerificationRequestRecord *)v4 setChannel:0];
  [(PKVerificationRequestRecord *)v4 setVerificationStatus:2];
  [(PKPaymentVerificationController *)self setVerificationRecord:v4];
  [(PKPaymentWebService *)self->_webService updateVerificationRecord:v4];
}

- (void)_updateVerificationStatusToComplete
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Marking verification as complete", v5, 2u);
  }

  id v4 = self->_verificationRecord;
  [(PKVerificationRequestRecord *)v4 setVerificationStatus:3];
  [(PKPaymentVerificationController *)self setVerificationRecord:v4];
  [(PKPaymentWebService *)self->_webService updateVerificationRecord:v4];
}

- (void)_wrapViewControllerAndRequestDelegatePresentationOfView:(id)a3
{
  id v4 = (PKPortraitNavigationController *)a3;
  id v5 = v4;
  if (self->_verificationContext)
  {
    int v7 = [[PKPortraitNavigationController alloc] initWithRootViewController:v4];
    [(PKPortraitNavigationController *)v7 setDelegate:self];
    if ([(UIViewController *)v7 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKPortraitNavigationController *)v7 setModalPresentationStyle:2];
    }

    int v6 = v7;
  }
  else
  {
    int v6 = v4;
  }
  uint64_t v8 = v6;
  [(PKPaymentVerificationController *)self _requestDelegatePresentationOfViewController:v6 completion:0];
}

- (void)_requestDelegatePresentationOfViewController:(id)a3 completion:(id)a4
{
  int64_t context = self->_context;
  id v7 = a4;
  id v8 = a3;
  PKPaymentSetupApplyContextAppearance(context, v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presentVerificationViewController:v8 animated:1 completion:v7];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)performVerificationOptionsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Fetching verification options", buf, 2u);
  }

  BOOL v9 = [(PKVerificationRequestRecord *)self->_verificationRecord currentStepIdentifier];
  id v10 = [v6 stepIdentifier];

  if (!v10 && v9) {
    [v6 setStepIdentifier:v9];
  }
  webService = self->_webService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke;
  void v13[3] = &unk_1E59D2490;
  void v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [(PKPaymentWebService *)webService verificationOptionsForRequest:v6 completion:v13];
}

void __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke_2;
  block[3] = &unk_1E59D2468;
  uint64_t v16 = a2;
  BOOL v9 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PKPaymentVerificationController_performVerificationOptionsRequest_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 64) == 1) {
    [*(id *)(a1 + 32) setVerificationRecord:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performVerificationUpdateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 channel];

  BOOL v9 = [(PKVerificationRequestRecord *)self->_verificationRecord currentStepIdentifier];
  id v10 = [v6 stepIdentifier];

  if (!v10 && v9) {
    [v6 setStepIdentifier:v9];
  }
  BOOL v11 = v8 != 0;
  webService = self->_webService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke;
  v14[3] = &unk_1E59D2508;
  BOOL v16 = v11;
  void v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [(PKPaymentWebService *)webService updateVerification:v6 completion:v14];
}

void __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_2;
  void v13[3] = &unk_1E59D24E0;
  uint64_t v18 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  char v19 = *(unsigned char *)(a1 + 48);
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 64) == 1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Updated verification record: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setVerificationRecord:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 32) verificationStatus] == 3 && !*(unsigned char *)(a1 + 72))
    {
      id v7 = *(void **)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_157;
      v10[3] = &unk_1E59D24B8;
      id v8 = *(id *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      id v11 = v8;
      uint64_t v12 = v9;
      [v7 _downloadAndAddPassWithCompletion:v10];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 56);
      if (v4) {
        (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 64), *(void *)(a1 + 48));
      }
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

uint64_t __79__PKPaymentVerificationController_performVerificationUpdateRequest_completion___block_invoke_157(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 40), a2);
  }
  return result;
}

- (void)submitVerificationCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Submitting verification code", buf, 2u);
  }

  webService = self->_webService;
  pass = self->_pass;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke;
  v12[3] = &unk_1E59D2558;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(PKPaymentWebService *)webService submitVerificationCode:v6 verificationData:0 forPass:pass completion:v12];
}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2;
  block[3] = &unk_1E59D2468;
  uint64_t v16 = a2;
  uint64_t v9 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Successfully submitted verification code. Downloading pass.", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
    uint64_t v5 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_159;
    v10[3] = &unk_1E59D2530;
    void v10[4] = v5;
    id v11 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    id v12 = v6;
    uint64_t v13 = v7;
    [v5 _downloadAndAddPassWithCompletion:v10];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Failed to submit verification code with error: %@", buf, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
}

void __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_159(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2_160;
  block[3] = &unk_1E59D2468;
  BOOL v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKPaymentVerificationController_submitVerificationCode_completion___block_invoke_2_160(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_downloadAndAddPassWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Downloading verified pass", buf, 2u);
  }

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BC8]) initWithSecureElementPass:self->_pass];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84EE8]) initWithDestinationWebService:self->_webService managingWebService:self->_webService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PKPaymentVerificationController__downloadAndAddPassWithCompletion___block_invoke;
  v10[3] = &unk_1E59D2580;
  id v11 = v7;
  id v12 = v4;
  id v8 = v7;
  id v9 = v4;
  [v8 ingestProvisioningPassData:v6 cloudStoreCoordinatorDelegate:0 moreInfoURLs:0 ingestionProperties:0 sid:&stru_1EF1B5B50 completion:v10];
}

uint64_t __69__PKPaymentVerificationController__downloadAndAddPassWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a6);
  }
  return result;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  p_flowDelegate = &self->_flowDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  if (WeakRetained
    || (p_flowDelegate = &self->_delegate, id v6 = objc_loadWeakRetained((id *)&self->_delegate), v6, v6))
  {
    id v7 = objc_loadWeakRetained((id *)p_flowDelegate);
    id v8 = [v7 presentationContext];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKPaymentVerificationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentVerificationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPaymentVerificationControllerFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);

  return (PKPaymentVerificationControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_int64_t context = a3;
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (PKVerificationRequestRecord)verificationRecord
{
  return self->_verificationRecord;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (PKPassView)passView
{
  return self->_passView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationRecord, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_passSnapshot, 0);
  objc_storeStrong((id *)&self->_inStoreBankAppStoreID, 0);
  objc_storeStrong((id *)&self->_inStoreBankAppTitle, 0);
  objc_storeStrong((id *)&self->_installedBankAppTitle, 0);

  objc_storeStrong((id *)&self->_installedBankAppBundleID, 0);
}

@end