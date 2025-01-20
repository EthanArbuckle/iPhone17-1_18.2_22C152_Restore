@interface PKPeerPaymentAssociatedAccountActivationViewController
- (BOOL)_isAssociatedAccountPending;
- (PKPeerPaymentAssociatedAccountActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3;
- (unint64_t)_nextStateAfterCheckingFamilyMemberAppleCashCapabilities:(BOOL *)a3;
- (void)_cancelTimer;
- (void)_checkFamilyMemberAppleCashCapabilities;
- (void)_handlePeerPaymentAccountDidChangeNotification;
- (void)_presentDisplayableError:(id)a3;
- (void)_sendMoneyInMessages;
- (void)_setState:(unint64_t)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_startTimerIfNeccessary;
- (void)_terminateAddAssociatedAccountFlowWithSucces:(BOOL)a3 updatedAccount:(id)a4;
- (void)dealloc;
- (void)deviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5;
- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentAssociatedAccountActivationViewController

- (PKPeerPaymentAssociatedAccountActivationViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, [v5 context]);
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    v9 = [*p_controller deviceCapabiltiesManager];
    [v9 registerObserver:v7];

    v10 = [*p_controller configuration];
    uint64_t v11 = [v10 peerPaymentSetupConfigurationType];

    if (v11 == 1)
    {
      v12 = [*p_controller configuration];
      uint64_t v13 = [v12 familyMember];
      familyMember = v7->_familyMember;
      v7->_familyMember = (PKFamilyMember *)v13;

      v15 = [v12 associatedAccountSetupDelegate];
      objc_storeWeak((id *)&v7->_delegate, v15);

      v7->_setupType = [v12 setupType];
    }
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4F87CC8];
    v18 = [*p_controller peerPaymentWebService];
    v19 = [v18 targetDevice];
    [v16 addObserver:v7 selector:sel__handlePeerPaymentAccountDidChangeNotification name:v17 object:v19];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(PKPeerPaymentSetupFlowController *)self->_controller deviceCapabiltiesManager];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  [(PKPeerPaymentAssociatedAccountActivationViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentAssociatedAccountActivationViewController;
  [(PKExplanationViewController *)&v14 viewDidLoad];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKPeerPaymentAssociatedAccountActivationViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  objc_super v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setDelegate:self];
  [v4 setForceShowSetupLaterButton:0];
  [v4 setShowPrivacyView:0];
  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    id v5 = PKPassKitUIBundle();
    v6 = [v5 URLForResource:@"AppleCashIcon" withExtension:@"pdf"];
    double v7 = PKUIScreenScale();
    v8 = PKUIImageFromPDF(v6, 80.0, 80.0, v7);

    [v4 setImage:v8];
    v9 = [v4 imageView];
    [v9 setClipsToBounds:1];
    [v9 _setContinuousCornerRadius:20.0];
    [v4 setTopMargin:30.0];
  }
  v10 = [(PKPeerPaymentSetupFlowController *)self->_controller peerPaymentAccount];
  account = self->_account;
  self->_account = v10;

  v12 = objc_alloc_init(PKPeerPaymentIconEducationView);
  iconEducationView = self->_iconEducationView;
  self->_iconEducationView = v12;

  [(PKPeerPaymentAssociatedAccountActivationViewController *)self _setState:1];
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state != a3)
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (state > 9) {
        double v7 = @"unknown";
      }
      else {
        double v7 = off_1E59DBC20[state];
      }
      if (a3 > 9) {
        v8 = @"unknown";
      }
      else {
        v8 = off_1E59DBC20[a3];
      }
      *(_DWORD *)buf = 138412546;
      v91 = v7;
      __int16 v92 = 2112;
      v93 = v8;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController transitioning from state %@ to state %@", buf, 0x16u);
    }

    self->_unint64_t state = a3;
    v9 = [(PKFamilyMember *)self->_familyMember firstName];
    v10 = [(PKExplanationViewController *)self explanationView];
    uint64_t v11 = [v10 dockView];
    v12 = [v11 footerView];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke;
    aBlock[3] = &unk_1E59DBC00;
    id v13 = v10;
    id v82 = v13;
    id v14 = v11;
    id v83 = v14;
    id v15 = v12;
    id v84 = v15;
    v85 = self;
    v16 = _Block_copy(aBlock);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_2;
    v78[3] = &unk_1E59CAEA8;
    id v17 = v14;
    id v79 = v17;
    v80 = self;
    v18 = _Block_copy(v78);
    v19 = v18;
    switch(self->_state)
    {
      case 1uLL:
        (*((void (**)(void *, uint64_t))v18 + 2))(v18, 1);
        [(PKPeerPaymentIconEducationView *)self->_iconEducationView removeFromSuperview];
        v28 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct.isa);
        [v13 setTitleText:v28];

        v29 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentPer_11.isa);
        [v13 setBodyText:v29];

        controller = self->_controller;
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_3;
        v77[3] = &unk_1E59CC380;
        v77[4] = self;
        [(PKPeerPaymentSetupFlowController *)controller nextViewControllerAfterPerfomingOperations:128 completion:v77];
        goto LABEL_34;
      case 2uLL:
        (*((void (**)(void *, uint64_t))v18 + 2))(v18, 1);
        v31 = [(PKPeerPaymentSetupFlowController *)self->_controller peerPaymentService];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_4;
        v76[3] = &unk_1E59CE240;
        v76[4] = self;
        [v31 updateAccountAndAssociatedAccountsWithCompletion:v76];
        goto LABEL_21;
      case 3uLL:
      case 4uLL:
        id v74 = v15;
        v20 = v9;
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        objc_super v21 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_12.isa);
        v22 = [(PKPeerPaymentAccount *)self->_account supportsFamilySharingFeatureDescriptor];
        v23 = [v22 osVersionRange];

        v24 = [v23 minimum];
        v25 = [v24 iphone];

        v26 = [v23 minimum];
        v27 = [v26 watch];

        if (v25 && v27) {
          PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_13.isa, &stru_1EF1BA430.isa, v20, v25, v27, v20);
        }
        else {
        v59 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_14.isa, &stru_1EF1B4C70.isa, v20);
        }
        (*((void (**)(void *, void *, void *, void, uint64_t, void))v16 + 2))(v16, v21, v59, 0, 1, 0);

        v9 = v20;
        goto LABEL_33;
      case 5uLL:
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        v68 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_15.isa);
        v70 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_16.isa);
        PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_17.isa, &stru_1EF1B5770.isa, v9, v70);
        v32 = v72 = v9;
        uint64_t v33 = [v32 rangeOfString:v70];
        uint64_t v65 = v34;
        uint64_t v66 = v33;
        id v35 = objc_alloc(MEMORY[0x1E4F28E48]);
        uint64_t v88 = *MEMORY[0x1E4FB0700];
        v36 = [MEMORY[0x1E4FB1618] labelColor];
        v89 = v36;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        v38 = (void *)[v35 initWithString:v32 attributes:v37];

        v39 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/102660"];
        v40 = [MEMORY[0x1E4FB1618] linkColor];
        objc_msgSend(v38, "pk_addLinkURL:toRange:withColor:isUnderlined:", v39, v66, v65, v40, 0);

        v41 = (void *)[v38 copy];
        (*((void (**)(void *, void *, void, void *, uint64_t, void))v16 + 2))(v16, v68, 0, v41, 1, 0);

        v9 = v72;
        goto LABEL_34;
      case 6uLL:
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        v31 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_18.isa);
        PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_19.isa, &stru_1EF1B4C70.isa, v9);
        goto LABEL_20;
      case 7uLL:
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        v71 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_20.isa);
        v42 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_22.isa);
        v43 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_21.isa, &stru_1EF1B5770.isa, v9, v42);

        v44 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_22.isa);
        uint64_t v45 = [v43 rangeOfString:v44];
        uint64_t v67 = v46;
        uint64_t v69 = v45;

        id v47 = objc_alloc(MEMORY[0x1E4F28E48]);
        uint64_t v86 = *MEMORY[0x1E4FB0700];
        [MEMORY[0x1E4FB1618] labelColor];
        id v75 = v15;
        v49 = v48 = v9;
        v87 = v49;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v51 = (void *)[v47 initWithString:v43 attributes:v50];

        v52 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT211324"];
        v53 = [MEMORY[0x1E4FB1618] linkColor];
        objc_msgSend(v51, "pk_addLinkURL:toRange:withColor:isUnderlined:", v52, v69, v67, v53, 0);

        v9 = v48;
        id v15 = v75;

        v54 = (void *)[v51 copy];
        (*((void (**)(void *, void *, void, void *, uint64_t, void))v16 + 2))(v16, v71, 0, v54, 1, 0);

        goto LABEL_34;
      case 8uLL:
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        v31 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_12.isa);
        PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_23.isa, &stru_1EF1B4C70.isa, v9);
        v55 = LABEL_20:;
        (*((void (**)(void *, void *, void *, void, uint64_t, void))v16 + 2))(v16, v31, v55, 0, 1, 0);

LABEL_21:
        goto LABEL_34;
      case 9uLL:
        (*((void (**)(void *, void))v18 + 2))(v18, 0);
        v56 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_24.isa);
        int64_t setupType = self->_setupType;
        v73 = v9;
        id v74 = v15;
        if (setupType == 1)
        {
          uint64_t v58 = PKLocalizedMadisonString(&cfstr_AccountUserPee.isa, &stru_1EF1B5770.isa, v9, v9);
          goto LABEL_28;
        }
        if (!setupType)
        {
          uint64_t v58 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_25.isa, &stru_1EF1B4C70.isa, v9);
LABEL_28:
          v60 = (void *)v58;
          goto LABEL_30;
        }
        v60 = 0;
LABEL_30:
        [(PKExplanationViewController *)self context];
        uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
        if ((IsSetupAssistant & 1) == 0)
        {
          [v15 manualEntryButton];
          v63 = v62 = v56;
          v64 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_26.isa);
          [v63 setTitle:v64 forState:0];

          [v63 addTarget:self action:sel__sendMoneyInMessages forControlEvents:64];
          v56 = v62;
        }
        [v13 setTitleLineBreakStrategy:1];
        [v13 showCheckmark:1 animated:1];
        (*((void (**)(void *, void *, void *, void, uint64_t, uint64_t))v16 + 2))(v16, v56, v60, 0, IsSetupAssistant, 1);

        v9 = v73;
LABEL_33:
        id v15 = v74;
LABEL_34:

        break;
      default:
        goto LABEL_34;
    }
  }
}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, int a6)
{
  id v18 = a3;
  id v11 = a4;
  [*(id *)(a1 + 32) setTitleText:a2];
  v12 = *(void **)(a1 + 32);
  if (v18) {
    objc_msgSend(v12, "setBodyText:");
  }
  else {
    [v12 setAttributedBodyText:v11];
  }
  id v13 = [*(id *)(a1 + 40) primaryButton];
  id v14 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAdd_11.isa);
  [v13 setTitle:v14 forState:0];

  [*(id *)(a1 + 48) setSkipCardButton:0];
  if (a5) {
    [*(id *)(a1 + 48) setManualEntryButton:0];
  }
  [*(id *)(a1 + 48) setSetupLaterButton:0];
  id v15 = *(void **)(*(void *)(a1 + 56) + 1080);
  if (a6)
  {
    [v15 setShowIconsView:1];
    v16 = *(void **)(a1 + 56);
    id v17 = (void *)v16[135];
    [v16 context];
    [v17 setShowWatchView:PKPaymentSetupContextIsBridge()];
    [*(id *)(a1 + 32) setBodyView:*(void *)(*(void *)(a1 + 56) + 1080)];
  }
  else
  {
    [v15 removeFromSuperview];
  }
}

uint64_t __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setHidden:a2];
  objc_super v4 = *(void **)(a1 + 40);

  return [v4 _showSpinner:a2];
}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_3(uint64_t a1, void *a2, int a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  if (v7)
  {
    [*(id *)(a1 + 32) _presentDisplayableError:v7];
  }
  else if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1056));
    [WeakRetained addPeerPaymentAssociatedAccountSetupCompletedWithSucess:0 updatedAccount:0 forFamilyMember:*(void *)(*(void *)(a1 + 32) + 1048)];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    if (v11)
    {
      v10 = [v9 navigationController];
      objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v11, 1, 0);
    }
    else
    {
      [v9 _setState:2];
    }
  }
}

void __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_5;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __68__PKPeerPaymentAssociatedAccountActivationViewController__setState___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _checkFamilyMemberAppleCashCapabilities];
}

- (BOOL)_isAssociatedAccountPending
{
  id v3 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v4 = [(PKPeerPaymentAccount *)self->_account peerPaymentAccountWithAltDSID:v3];
  id v5 = [(PKPeerPaymentAccount *)self->_account accountInvitationWithAltDSID:v3];
  id v6 = v5;
  BOOL v7 = v5 && [v5 status] == 1 || v4 == 0;

  return v7;
}

- (void)_cancelTimer
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
}

- (void)_startTimerIfNeccessary
{
  if (!self->_timer && !self->_timerHasFired)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    timer = self->_timer;
    self->_timer = v3;

    id v5 = self->_timer;
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    BOOL v7 = self->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke;
    handler[3] = &unk_1E59CA7D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    v8 = self->_timer;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke_109;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = self;
    dispatch_source_set_cancel_handler(v8, v11);
    dispatch_resume((dispatch_object_t)self->_timer);
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Starting timer to wait for IDS responses for apple cash capabilities.", v10, 2u);
    }
  }
}

uint64_t __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 1096))
  {
    uint64_t v1 = result;
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Apple cash capabilities fetch timer fired.", v5, 2u);
    }

    uint64_t v3 = *(void *)(v1 + 32);
    id v4 = *(void **)(v3 + 1096);
    *(void *)(v3 + 1096) = 0;

    *(unsigned char *)(*(void *)(v1 + 32) + 1104) = 1;
    return [*(id *)(v1 + 32) _checkFamilyMemberAppleCashCapabilities];
  }
  return result;
}

void __81__PKPeerPaymentAssociatedAccountActivationViewController__startTimerIfNeccessary__block_invoke_109(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1096);
  *(void *)(v2 + 1096) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 1104) = 1;
}

- (void)_checkFamilyMemberAppleCashCapabilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController: Checking family member apple cash capabilities", buf, 2u);
  }

  if (self->_state - 3 <= 6)
  {
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self _cancelTimer];
    return;
  }
  if (![(PKPeerPaymentAssociatedAccountActivationViewController *)self _isAssociatedAccountPending]|| [(PKExplanationViewController *)self context] == 5)
  {
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self _cancelTimer];
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self _setState:9];
    return;
  }
  id v4 = [(PKPeerPaymentSetupFlowController *)self->_controller deviceCapabiltiesManager];
  id v5 = [(PKFamilyMember *)self->_familyMember appleID];
  dispatch_time_t v6 = [v4 currentFetchStatusForAppleID:v5];

  if (![v6 deviceCountFetchInProgress]
    || [v6 secondsPassedSinceFetchStart] < 11)
  {
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self _startTimerIfNeccessary];
    if (!self->_timerHasFired && ([v6 deviceCountFetchInProgress] & 1) != 0) {
      goto LABEL_34;
    }
    BOOL v7 = [(PKFamilyMember *)self->_familyMember appleID];
    v8 = [v6 fetchError];
    v9 = v8;
    if (!v8)
    {
      if ([v6 allPossibleCapabilitiesFetched])
      {
        unint64_t v16 = [(PKPeerPaymentAssociatedAccountActivationViewController *)self _nextStateAfterCheckingFamilyMemberAppleCashCapabilities:0];
      }
      else
      {
        unsigned __int8 v18 = 0;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Not all apple cash device capabilities have been fetched yet. Checking if one of the existing ones it capable.", buf, 2u);
        }

        unint64_t v16 = [(PKPeerPaymentAssociatedAccountActivationViewController *)self _nextStateAfterCheckingFamilyMemberAppleCashCapabilities:&v18];
        if (!(self->_timerHasFired | v18))
        {
          unint64_t state = self->_state;
          goto LABEL_33;
        }
      }
      unint64_t state = v16;
      goto LABEL_33;
    }
    v10 = [v8 domain];
    id v11 = (void *)*MEMORY[0x1E4F6A888];
    id v12 = v10;
    id v13 = v11;
    if (v12 == v13)
    {
    }
    else
    {
      id v14 = v13;
      if (!v12 || !v13)
      {

LABEL_27:
        unint64_t state = 7;
LABEL_33:
        [(PKPeerPaymentAssociatedAccountActivationViewController *)self _setState:state];

        goto LABEL_34;
      }
      int v15 = [v12 isEqualToString:v13];

      if (!v15) {
        goto LABEL_27;
      }
    }
    if ([v9 code] == 3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "The handle %@ is not registered with IDS which means they dont have a device signed in", buf, 0xCu);
      }

      unint64_t state = 3;
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  [(PKPeerPaymentAssociatedAccountActivationViewController *)self _cancelTimer];
  [(PKPeerPaymentAssociatedAccountActivationViewController *)self _setState:7];
LABEL_34:
}

- (unint64_t)_nextStateAfterCheckingFamilyMemberAppleCashCapabilities:(BOOL *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKFamilyMember *)self->_familyMember appleID];
  v49 = self;
  dispatch_time_t v6 = [(PKPeerPaymentSetupFlowController *)self->_controller deviceCapabiltiesManager];
  BOOL v7 = [v6 currentFetchStatusForAppleID:v5];

  if ([v7 deviceCountFetchInProgress])
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v5;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "The initial IDS fetch is still progress for %@. Handling this as an unknown error", buf, 0xCu);
    }

    unint64_t v9 = 7;
    goto LABEL_79;
  }
  v10 = [v7 fetchedCapabilities];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    v40 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v5;
      _os_log_impl(&dword_19F450000, v40, OS_LOG_TYPE_DEFAULT, "The handle %@ has no devices", buf, 0xCu);
    }

    if (a3) {
      *a3 = 0;
    }
    unint64_t v9 = 3;
    goto LABEL_79;
  }
  id v12 = [(PKPeerPaymentAccount *)v49->_account supportsFamilySharingFeatureDescriptor];
  uint64_t v46 = [v12 osVersionRange];

  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v46 asDictionary];
    *(_DWORD *)buf = 138412546;
    v56 = v5;
    __int16 v57 = 2112;
    uint64_t v58 = v14;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Checking apple cash capabilites for %@ using required OS range %@", buf, 0x16u);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v15 = [v7 fetchedCapabilities];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v16)
  {

    BOOL v37 = 0;
    unint64_t v9 = 7;
    goto LABEL_76;
  }
  uint64_t v17 = v16;
  id obj = v15;
  v42 = a3;
  v43 = v7;
  v44 = v5;
  uint64_t v45 = 0;
  char v47 = 0;
  uint64_t v18 = *(void *)v51;
LABEL_10:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v51 != v18) {
      objc_enumerationMutation(obj);
    }
    v20 = *(__CFString **)(*((void *)&v50 + 1) + 8 * v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v20;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Checking apple cash device capabilities for %@", buf, 0xCu);
    }

    uint64_t v21 = [(__CFString *)v20 fromDeviceVersion];
    v22 = [(__CFString *)v20 deviceRegion];
    v23 = [(PKPeerPaymentSetupFlowController *)v49->_controller paymentWebService];
    v24 = [v23 context];
    v25 = [v24 configuration];

    if (([v25 peerPaymentEnabledForRegion:v22] & 1) == 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v22;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "This devices apple cash capabilities are not supported since %@ is not an eligible region", buf, 0xCu);
      }
      char v47 = 1;
      goto LABEL_42;
    }
    if (([(__CFString *)v20 supportsManatee] & 1) == 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "This devices apple cash capabilities are not supported since its not manatee capable", buf, 2u);
      }
      BYTE4(v45) = 1;
      goto LABEL_42;
    }
    if (v21) {
      break;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = v13;
      v32 = "Cannot check apple cash device capabilities for nil fromDeviceVersion";
LABEL_40:
      _os_log_impl(&dword_19F450000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
    }
LABEL_41:
    LOBYTE(v45) = 1;
LABEL_42:

LABEL_43:
    if (v17 == ++v19)
    {
      uint64_t v36 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      uint64_t v17 = v36;
      if (!v36)
      {

        BOOL v37 = 0;
        uint64_t v38 = 5;
        char v39 = BYTE4(v45);
        goto LABEL_67;
      }
      goto LABEL_10;
    }
  }
  if (!v46 && (PKPeerPaymentSkipFamilySharingVersionCheck() & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = v13;
      v32 = "Cannot check apple cash device capabilities for nil requiredOSVersionRange. The osVersionRequirement is prob"
            "ably not set on the supported feature";
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  v26 = [v21 iphone];

  if (!v26)
  {
    uint64_t v33 = [v21 ipad];

    if (v33)
    {
      LODWORD(v27) = [v46 versionMeetsRequirements:v21 deviceClass:@"iPad"];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      uint64_t v34 = @"NO";
      if (v27) {
        uint64_t v34 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v56 = v34;
      v29 = v13;
      v30 = "Compared version requirements for ipad. Meets requirements %@";
    }
    else
    {
      v27 = [v21 watch];

      if (!v27) {
        goto LABEL_52;
      }
      LODWORD(v27) = [v46 versionMeetsRequirements:v21 deviceClass:@"Watch"];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      id v35 = @"NO";
      if (v27) {
        id v35 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v56 = v35;
      v29 = v13;
      v30 = "Compared version requirements for watch. Meets requirements %@";
    }
LABEL_50:
    _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
    goto LABEL_51;
  }
  LODWORD(v27) = [v46 versionMeetsRequirements:v21 deviceClass:@"iPhone"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = @"NO";
    if (v27) {
      v28 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v56 = v28;
    v29 = v13;
    v30 = "Compared version requirements for phone. Meets requirements %@";
    goto LABEL_50;
  }
LABEL_51:

LABEL_52:
  if (!PKPeerPaymentSkipFamilySharingVersionCheck())
  {
    if (v27) {
      goto LABEL_66;
    }
    LOBYTE(v45) = 1;
    goto LABEL_43;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Skipping family sharing required version check", buf, 2u);
  }

LABEL_66:
  BOOL v37 = 1;
  uint64_t v38 = 8;
  char v39 = 1;
LABEL_67:
  if (v47)
  {
    a3 = v42;
    if ((v45 & 1) == 0)
    {
      unint64_t v9 = 6;
      goto LABEL_74;
    }
LABEL_71:
    BOOL v7 = v43;
    id v5 = v44;
    if ((v39 & 1) == 0)
    {
      unint64_t v9 = 4;
      goto LABEL_76;
    }
LABEL_75:
    unint64_t v9 = v38;
  }
  else
  {
    a3 = v42;
    if (v45) {
      goto LABEL_71;
    }
    unint64_t v9 = 7;
LABEL_74:
    BOOL v7 = v43;
    id v5 = v44;
    if (v39) {
      goto LABEL_75;
    }
  }
LABEL_76:
  if (a3) {
    *a3 = v37;
  }

LABEL_79:
  return v9;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  account = self->_account;
  id v7 = WeakRetained;
  if (account)
  {
    [WeakRetained addPeerPaymentAssociatedAccountSetupCompletedWithSucess:1 updatedAccount:account forFamilyMember:self->_familyMember];
  }
  else
  {
    dispatch_time_t v6 = [(PKPeerPaymentSetupFlowController *)self->_controller peerPaymentAccount];
    [v7 addPeerPaymentAssociatedAccountSetupCompletedWithSucess:1 updatedAccount:v6 forFamilyMember:self->_familyMember];
  }
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v12 = v8;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __124__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController deviceSharingCapabilitiesUpdated:newSharingCapabilties called for handle %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) _checkFamilyMemberAppleCashCapabilities];
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v12 = v8;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __125__PKPeerPaymentAssociatedAccountActivationViewController_deviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController deviceSharingCapabilitiesUpdated:maximumPossibleDevices called for handle %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) _checkFamilyMemberAppleCashCapabilities];
}

- (void)_handlePeerPaymentAccountDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PKPeerPaymentAssociatedAccountActivationViewController__handlePeerPaymentAccountDidChangeNotification__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __104__PKPeerPaymentAssociatedAccountActivationViewController__handlePeerPaymentAccountDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountActivationViewController _handlePeerPaymentAccountDidChangeNotification", v9, 2u);
  }

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1040) peerPaymentWebService];
  uint64_t v4 = [v3 targetDevice];
  uint64_t v5 = [v4 account];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 1088);
  *(void *)(v6 + 1088) = v5;

  return [*(id *)(a1 + 32) _checkFamilyMemberAppleCashCapabilities];
}

- (void)_sendMoneyInMessages
{
  id v9 = [(PKFamilyMember *)self->_familyMember appleID];
  uint64_t v3 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v4 = [(PKPeerPaymentSetupFlowController *)self->_controller peerPaymentAccount];
  uint64_t v5 = [v4 currentBalance];
  uint64_t v6 = [v5 currency];

  uint64_t v7 = PKPeerPaymentGetSendPaymentSensitiveURL();
  if (v7)
  {
    __int16 v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v8 openSensitiveURL:v7 withOptions:0];
  }
}

- (void)_presentDisplayableError:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPeerPaymentAssociatedAccountActivationViewController__presentDisplayableError___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  v6[4] = self;
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, v6, 0);
  if (v4)
  {
    uint64_t v5 = [(PKPeerPaymentAssociatedAccountActivationViewController *)self navigationController];
    [v5 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self _terminateAddAssociatedAccountFlowWithSucces:0 updatedAccount:0];
  }
}

uint64_t __83__PKPeerPaymentAssociatedAccountActivationViewController__presentDisplayableError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateAddAssociatedAccountFlowWithSucces:0 updatedAccount:0];
}

- (void)_terminateAddAssociatedAccountFlowWithSucces:(BOOL)a3 updatedAccount:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Terminating peer payment add associated account", v10, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained addPeerPaymentAssociatedAccountSetupCompletedWithSucess:v4 updatedAccount:v6 forFamilyMember:self->_familyMember];
  }
  else {
    [(PKPeerPaymentAssociatedAccountActivationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowSpinner:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAppleCashCapabilities, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_iconEducationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end