@interface PKPaymentDocumentSubmissionInfoViewController
- (PKPaymentDocumentSubmissionInfoViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5;
- (id)_secondaryButton;
- (unint64_t)onPresentationRemoveViewControllersAfterMarker;
- (unint64_t)paymentSetupMarker;
- (void)_cancelPressed;
- (void)_reportViewDidAppear:(BOOL)a3;
- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4;
- (void)captureController:(id)a3 showLoading:(BOOL)a4;
- (void)didSelectSetupLater;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)updateUIWithState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentDocumentSubmissionInfoViewController

- (PKPaymentDocumentSubmissionInfoViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  v10 = [(PKExplanationViewController *)&v14 initWithContext:a4];
  v11 = v10;
  if (v10)
  {
    v10->_featureIdentifier = a5;
    p_controller = (id *)&v10->_controller;
    objc_storeStrong((id *)&v10->_controller, a3);
    v11->_context = a4;
    v11->_currentState = [*p_controller state];
    v11->_currentSide = [*p_controller side];
  }

  return v11;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  [(PKExplanationViewController *)&v6 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  v4 = [v3 dockView];
  v5 = [v4 footerView];
  [v5 setManualEntryButton:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  [(PKPaymentDocumentSubmissionInfoViewController *)&v4 viewWillAppear:a3];
  [(PKPaymentDocumentSubmissionController *)self->_controller setState:self->_currentState];
  [(PKPaymentDocumentSubmissionController *)self->_controller setSide:self->_currentSide];
  [(PKPaymentDocumentSubmissionController *)self->_controller setDelegate:self];
  [(PKPaymentDocumentSubmissionInfoViewController *)self updateUIWithState:self->_currentState];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  [(PKPaymentDocumentSubmissionInfoViewController *)&v4 viewDidAppear:a3];
  [(PKPaymentDocumentSubmissionInfoViewController *)self _reportViewDidAppear:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  [(PKPaymentDocumentSubmissionInfoViewController *)&v4 viewDidDisappear:a3];
  [(PKPaymentDocumentSubmissionInfoViewController *)self _reportViewDidAppear:0];
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = v5;
  objc_super v6 = (void *)MEMORY[0x1E4F864A0];
  if (!v3) {
    objc_super v6 = (void *)MEMORY[0x1E4F864A8];
  }
  [v5 setObject:*v6 forKey:*MEMORY[0x1E4F86308]];
  [(PKPaymentDocumentSubmissionController *)self->_controller reportAnalyticsEvent:v7 pageTag:*MEMORY[0x1E4F85F58]];
}

- (void)_cancelPressed
{
}

- (id)_secondaryButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v3 setExclusiveTouch:1];
  objc_super v4 = [v3 titleLabel];
  [v4 setNumberOfLines:0];

  id v5 = [v3 titleLabel];
  [v5 setTextAlignment:1];

  objc_super v6 = [v3 titleLabel];
  id v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B0]);
  [v6 setFont:v7];

  [v3 addTarget:self action:sel_didSelectSetupLater forControlEvents:64];

  return v3;
}

- (void)updateUIWithState:(int64_t)a3
{
  id v5 = [(PKExplanationViewController *)self explanationView];
  objc_super v6 = [v5 dockView];
  id v7 = [v6 primaryButton];
  v8 = [v6 footerView];
  id v9 = [(PKPaymentDocumentSubmissionInfoViewController *)self navigationItem];
  [v5 setImage:0];
  [v5 setShowPrivacyView:0];
  [v6 setButtonExplanationText:0];
  v10 = [(PKPaymentDocumentSubmissionController *)self->_controller preferredLanguage];
  switch(a3)
  {
    case 0:
      v21 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v21];

      v22 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v22];

      [v7 setHidden:0];
      v23 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v23 forState:0];

      unint64_t featureIdentifier = self->_featureIdentifier;
      if (featureIdentifier == 3)
      {
        v76 = v5;
        uint64_t v77 = 0;
      }
      else
      {
        if (featureIdentifier == 2)
        {
          v25 = [(PKPaymentDocumentSubmissionInfoViewController *)self _secondaryButton];
          [v8 setSetupLaterButton:v25];

          [v5 setShowPrivacyView:0];
          v26 = PKLocalizedApplyFeatureString();
          [v6 setButtonExplanationText:v26];

          v27 = [v6 buttonExplanationTextView];
          [v27 setTextAlignment:0];

LABEL_31:
          [v8 setSetupLaterButton:0];
          [v5 setTopMargin:30.0];
          v78 = PKUIImageNamed(@"PhotoID");
          [v5 setImage:v78];

          v41 = self;
          uint64_t v42 = 1;
          goto LABEL_32;
        }
        [v6 setButtonExplanationText:0];
        v76 = v5;
        uint64_t v77 = 1;
      }
      [v76 setShowPrivacyView:v77];
      goto LABEL_31;
    case 1:
      v43 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v43];

      v44 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v44];

      [v7 setHidden:0];
      v45 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v45 forState:0];

      v46 = [(PKPaymentDocumentSubmissionInfoViewController *)self _secondaryButton];
      [v8 setSetupLaterButton:v46];

      v47 = [v8 setupLaterButton];
      PKLocalizedApplyFeatureString();
      int64_t v48 = a3;
      v49 = v7;
      v50 = v8;
      v52 = v51 = v9;
      [v47 setTitle:v52 forState:0];

      id v9 = v51;
      v8 = v50;
      id v7 = v49;
      a3 = v48;

      goto LABEL_18;
    case 3:
      v82 = v9;
      int64_t v53 = [(PKPaymentDocumentSubmissionController *)self->_controller side];
      controller = self->_controller;
      if (v53) {
        [(PKPaymentDocumentSubmissionController *)controller backID];
      }
      else {
      v55 = [(PKPaymentDocumentSubmissionController *)controller frontID];
      }
      v63 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v63];

      v64 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v64];

      [v55 size];
      if (v65 > 0.0)
      {
        [v55 size];
        if (v66 > 0.0)
        {
          [v55 size];
          double v68 = v67;
          [v55 size];
          double height = v84.height;
          v84.width = v68;
          UIGraphicsBeginImageContextWithOptions(v84, 0, 1.0);
          v70 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v68, height, 30.0);
          [v70 addClip];

          objc_msgSend(v55, "drawInRect:", 0.0, 0.0, v68, height);
          uint64_t v71 = UIGraphicsGetImageFromCurrentImageContext();

          UIGraphicsEndImageContext();
          v55 = (void *)v71;
        }
      }
      objc_msgSend(v5, "setImage:", v55, v55);
      if ((unint64_t)PKUIGetMinScreenWidthType() >= 5) {
        [v5 setTopMargin:30.0];
      }
      [v7 setHidden:0];
      v72 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v72 forState:0];

      v73 = [(PKPaymentDocumentSubmissionInfoViewController *)self _secondaryButton];
      [v8 setSetupLaterButton:v73];

      v74 = [v8 setupLaterButton];
      v75 = PKLocalizedApplyFeatureString();
      [v74 setTitle:v75 forState:0];

      [(PKExplanationViewController *)self setShowCancelButton:self->_featureIdentifier == 1];
      [(PKExplanationViewController *)self showNavigationBarSpinner:0];

      id v9 = v82;
      goto LABEL_33;
    case 4:
    case 8:
    case 10:
      v31 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v31];

      v32 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v32];

      [v7 setHidden:0];
      v33 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v33 forState:0];

      if (self->_featureIdentifier == 1)
      {
        v34 = [(PKPaymentDocumentSubmissionInfoViewController *)self _secondaryButton];
        [v8 setSetupLaterButton:v34];

        v35 = [v8 setupLaterButton];
        PKLocalizedApplyFeatureString();
        int64_t v36 = a3;
        v37 = v7;
        v38 = v8;
        v40 = v39 = v9;
        [v35 setTitle:v40 forState:0];

        id v9 = v39;
        v8 = v38;
        id v7 = v37;
        a3 = v36;
      }
      else
      {
        [v8 setSetupLaterButton:0];
      }
      v41 = self;
      uint64_t v42 = 0;
LABEL_32:
      [(PKExplanationViewController *)v41 setShowCancelButton:v42];
      [(PKExplanationViewController *)self showNavigationBarSpinner:0];
      goto LABEL_33;
    case 5:
      v28 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v28];

      [v5 setBodyText:0];
      [v5 setShowSpinner:1];
      [v9 setRightBarButtonItem:0];
      v29 = PKUIImageNamed(@"PhotoID");
      [v5 setImage:v29];

      [v7 setHidden:1];
      [v8 setSetupLaterButton:0];
      [(PKExplanationViewController *)self setShowCancelButton:0];
      v30 = [(PKPaymentDocumentSubmissionInfoViewController *)self navigationItem];
      [v30 setHidesBackButton:1];

      goto LABEL_33;
    case 6:
    case 11:
      v11 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v11];

      v12 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v12];

      [v5 showCheckmark:0 animated:0];
      [v5 setShowSpinner:0];
      v81 = v9;
      [v9 setRightBarButtonItem:0];
      v13 = PKUIImageNamed(@"PhotoID");
      [v5 setImage:v13];

      [v7 setHidden:0];
      objc_super v14 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v14 forState:0];

      [v8 setSetupLaterButton:0];
      unint64_t v15 = self->_featureIdentifier;
      int64_t v80 = a3;
      v16 = v7;
      if (v15 == 1)
      {
        v17 = [(PKPaymentDocumentSubmissionInfoViewController *)self _secondaryButton];
        [v8 setSetupLaterButton:v17];

        v18 = v8;
        v19 = [v8 setupLaterButton];
        v20 = PKLocalizedApplyFeatureString();
        [v19 setTitle:v20 forState:0];
      }
      else
      {
        v18 = v8;
        [v8 setSetupLaterButton:0];
      }
      [(PKExplanationViewController *)self setShowCancelButton:v15 == 1];
      [(PKExplanationViewController *)self showNavigationBarSpinner:0];
      v8 = v18;
      id v7 = v16;
      a3 = v80;
      id v9 = v81;
      goto LABEL_33;
    case 7:
      v56 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v56];

      [v5 setBodyText:0];
      [v5 showCheckmark:1 animated:0];
      [v5 setShowSpinner:0];
      [v9 setRightBarButtonItem:0];
      v57 = PKUIImageNamed(@"PhotoID");
      [v5 setImage:v57];

      [v7 setHidden:1];
      [v8 setSetupLaterButton:0];
      [(PKExplanationViewController *)self setShowCancelButton:0];
      v58 = [(PKPaymentDocumentSubmissionInfoViewController *)self navigationItem];
      [v58 setHidesBackButton:1];

      dispatch_time_t v59 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke;
      block[3] = &unk_1E59CA7D0;
      block[4] = self;
      dispatch_after(v59, MEMORY[0x1E4F14428], block);
      goto LABEL_33;
    case 9:
      v60 = PKLocalizedApplyFeatureString();
      [v5 setTitleText:v60];

      v61 = PKLocalizedApplyFeatureString();
      [v5 setBodyText:v61];

      [v7 setHidden:0];
      v62 = PKLocalizedApplyFeatureString();
      [v7 setTitle:v62 forState:0];

      [v8 setSetupLaterButton:0];
LABEL_18:
      [(PKExplanationViewController *)self setShowCancelButton:0];
      [(PKExplanationViewController *)self showNavigationBarSpinner:0];
      goto LABEL_33;
    default:
      [(PKExplanationViewController *)self setShowCancelButton:self->_featureIdentifier == 1];
LABEL_33:
      self->_currentState = a3;
      self->_currentSide = [(PKPaymentDocumentSubmissionController *)self->_controller side];
      PKPaymentSetupApplyContextAppearance(self->_context, v5);

      return;
  }
}

void __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1040) nextViewController];
  BOOL v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_super v4 = [v3 navigationController];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke_2;
    v5[3] = &unk_1E59CB6D8;
    v5[4] = *(void *)(a1 + 32);
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", v2, 1, v5);
  }
  else
  {
    [v3[130] terminateSetupFlow];
  }
}

uint64_t __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error: Failed to present view controller terminating setup flow from: %@", (uint8_t *)&v6, 0xCu);
    }
    return [*(id *)(*(void *)(v2 + 32) + 1040) terminateSetupFlow];
  }
  return result;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  controller = self->_controller;
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v7[0] = *MEMORY[0x1E4F861B8];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKPaymentDocumentSubmissionController *)controller reportAnalyticsEvent:v5 pageTag:*MEMORY[0x1E4F85F58]];

  switch(self->_currentState)
  {
    case 0:
      [(PKPaymentDocumentSubmissionController *)self->_controller userWantsToContinue];
      break;
    case 1:
    case 0xALL:
      [(PKPaymentDocumentSubmissionController *)self->_controller contactApplePressed];
      break;
    case 3:
      [(PKPaymentDocumentSubmissionController *)self->_controller userApprovedCapturedID];
      break;
    case 4:
    case 8:
      [(PKPaymentDocumentSubmissionController *)self->_controller scanAgain];
      break;
    case 6:
    case 0xBLL:
      [(PKPaymentDocumentSubmissionController *)self->_controller tryUploadAgain];
      break;
    case 9:
      [(PKPaymentDocumentSubmissionController *)self->_controller terminateSetupFlow];
      break;
    default:
      return;
  }
}

- (void)didSelectSetupLater
{
  unint64_t currentState = self->_currentState;
  if (currentState > 0xB) {
    goto LABEL_14;
  }
  if (((1 << currentState) & 0x503) != 0)
  {
    PKAnalyticsSendEventForFeature();
    controller = self->_controller;
    [(PKPaymentDocumentSubmissionController *)controller terminateSetupFlow];
    return;
  }
  if (((1 << currentState) & 0x840) != 0)
  {
    id v5 = self->_controller;
    [(PKPaymentDocumentSubmissionController *)v5 userWantsToCancel];
    return;
  }
  if (currentState == 3)
  {
    uint64_t v6 = self->_controller;
    [(PKPaymentDocumentSubmissionController *)v6 userRejectedCapturedID];
  }
  else
  {
LABEL_14:
    id v7 = self->_controller;
    [(PKPaymentDocumentSubmissionController *)v7 scanAgain];
  }
}

- (void)captureController:(id)a3 showLoading:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKExplanationViewController *)self showNavigationBarSpinner:a4];
  id v7 = [(PKExplanationViewController *)self explanationView];
  uint64_t v6 = [v7 dockView];
  [v6 setButtonsEnabled:!v4];
}

- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4
{
  int64_t currentState = self->_currentState;
  if (currentState == 11 || currentState == 6)
  {
    if (a4 == 5)
    {
LABEL_7:
      [(PKPaymentDocumentSubmissionInfoViewController *)self updateUIWithState:a4];
      return;
    }
  }
  else if (currentState == 5 && (unint64_t)a4 <= 0xB && ((1 << a4) & 0x8C0) != 0)
  {
    goto LABEL_7;
  }
  id v11 = [(PKPaymentDocumentSubmissionController *)self->_controller nextViewController];
  if (v11)
  {
    v10 = [(PKPaymentDocumentSubmissionInfoViewController *)self navigationController];
    objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    [(PKPaymentDocumentSubmissionInfoViewController *)self updateUIWithState:a4];
  }
}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  if (self->_currentState) {
    return 4;
  }
  if (self->_featureIdentifier == 2) {
    return 3;
  }
  return 0;
}

- (unint64_t)paymentSetupMarker
{
  return 4 * (self->_currentState == 0);
}

- (void).cxx_destruct
{
}

@end