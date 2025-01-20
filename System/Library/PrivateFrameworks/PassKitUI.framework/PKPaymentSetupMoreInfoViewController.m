@interface PKPaymentSetupMoreInfoViewController
- (BOOL)_isExpressEducation;
- (BOOL)isFinalViewController;
- (CGSize)_snapshotSize;
- (NSArray)moreInfoItems;
- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7;
- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7 reportingSource:(int64_t)a8;
- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKSecureElementPass)pass;
- (id)_currentItem;
- (id)_nextItems;
- (id)_paymentNetworkNamesForExpressReporting;
- (id)_reportingSubject;
- (id)dismissalHandler;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)edgesForExtendedLayout;
- (void)_alternateActionWithCompletion:(id)a3;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)_handleDismissal;
- (void)_handlePush;
- (void)_linkTapped;
- (void)_next;
- (void)_reportDoneButtonTapped;
- (void)_reportExpressEventIfNeeded:(id)a3;
- (void)_reportExpressModeDisable;
- (void)_reportExpressModeEnable;
- (void)_reportTurnOffExpressButtonTapped;
- (void)_reportViewDidAppear;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)setDismissalHandler:(id)a3;
- (void)setIsFinalViewController:(BOOL)a3;
- (void)setReporter:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupMoreInfoViewController

- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7
{
  return [(PKPaymentSetupMoreInfoViewController *)self initWithMoreInfoItems:a3 paymentPass:a4 targetDevice:a5 context:a6 dismissalHandler:a7 reportingSource:0];
}

- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7 reportingSource:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  v18 = [(PKExplanationViewController *)&v25 initWithContext:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a4);
    uint64_t v20 = [v14 copy];
    moreInfoItems = v19->_moreInfoItems;
    v19->_moreInfoItems = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_targetDevice, a5);
    uint64_t v22 = [v17 copy];
    id dismissalHandler = v19->_dismissalHandler;
    v19->_id dismissalHandler = (id)v22;

    v19->_isFinalViewController = 1;
    v19->_reportingSource = a8;
    [(PKSecureElementPass *)v19->_pass loadImageSetSync:0 preheat:1];
  }

  return v19;
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  [(PKExplanationViewController *)&v21 loadView];
  v3 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
  v4 = [(PKExplanationViewController *)self explanationView];
  v5 = [v4 dockView];
  v6 = [v5 footerView];
  v7 = [v3 title];
  [v4 setTitleText:v7];

  v8 = [v3 body];
  [v4 setBodyText:v8];

  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0 || !self->_isFinalViewController)
  {
    v10 = [v3 nextAction];
  }
  else
  {
    v9 = [(PKPaymentSetupMoreInfoViewController *)self _nextItems];
    if ([v9 count]) {
      [v3 nextAction];
    }
    else {
    v10 = [v3 doneAction];
    }
  }
  v11 = [v5 primaryButton];
  [v11 setTitle:v10 forState:0];

  if ([v3 hasAlternativeAction])
  {
    [v4 setForceShowSetupLaterButton:1];
    v12 = [v6 setupLaterButton];
    v13 = [v3 alternativeAction];
    [v12 setTitle:v13 forState:0];
  }
  else
  {
    [v6 setSetupLaterButton:0];
  }
  [v6 setManualEntryButton:0];
  [v5 setRequiresAdditionalPrimaryButtonPadding:1];
  [(PKExplanationViewController *)self context];
  if ((PKPaymentSetupContextIsiOSSetupAssistant() & 1) == 0)
  {
    id v14 = [v3 linkText];
    [v4 setBodyButtonText:v14];

    [v4 setBodyButtonNumberOfLines:0];
  }
  id v15 = [v3 imageData];

  if (!v15
    || (id v16 = (void *)MEMORY[0x1E4FB1818],
        [v3 imageData],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v16 imageWithData:v17 scale:PKUIScreenScale()],
        v18 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v18))
  {
    v19 = [[PKPassView alloc] initWithPass:self->_pass content:5 suppressedContent:1911];
    [(PKPaymentSetupMoreInfoViewController *)self _snapshotSize];
    v18 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v19, "snapshotOfFrontFaceWithRequestedSize:");
  }
  [v4 setImage:v18];
  [v4 setShowPrivacyView:0];
  [v4 setDelegate:self];
  [v4 setNeedsLayout];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  uint64_t v20 = [(PKPaymentSetupMoreInfoViewController *)self navigationItem];
  [v20 setHidesBackButton:1 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  [(PKPaymentSetupMoreInfoViewController *)&v4 viewDidAppear:a3];
  [(PKPaymentSetupMoreInfoViewController *)self _beginReportingIfNecessary];
  [(PKPaymentSetupMoreInfoViewController *)self _reportExpressModeEnable];
  [(PKPaymentSetupMoreInfoViewController *)self _reportViewDidAppear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  [(PKPaymentSetupMoreInfoViewController *)&v4 viewDidDisappear:a3];
  [(PKPaymentSetupMoreInfoViewController *)self _endReportingIfNecessary];
}

- (id)_currentItem
{
  return [(NSArray *)self->_moreInfoItems firstObject];
}

- (id)_nextItems
{
  moreInfoItems = self->_moreInfoItems;
  v3 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
  objc_super v4 = [(NSArray *)moreInfoItems pk_arrayByRemovingObject:v3];

  return v4;
}

- (void)_next
{
  v3 = [(PKPaymentSetupMoreInfoViewController *)self _nextItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(PKPaymentSetupMoreInfoViewController *)self _handlePush];
  }
  else
  {
    [(PKPaymentSetupMoreInfoViewController *)self _handleDismissal];
  }
}

- (void)_handlePush
{
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [(PKPaymentSetupMoreInfoViewController *)self _nextItems];
  v6 = (unsigned char *)objc_msgSend(v3, "initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:", v4, self->_pass, self->_targetDevice, -[PKExplanationViewController context](self, "context"), self->_dismissalHandler);

  v6[1056] = self->_isFinalViewController;
  v5 = [(PKPaymentSetupMoreInfoViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_handleDismissal
{
  id v3 = [(PKPaymentSetupMoreInfoViewController *)self navigationItem];
  uint64_t v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  id dismissalHandler = self->_dismissalHandler;
  if (dismissalHandler)
  {
    v6 = (void (*)(void))*((void *)dismissalHandler + 2);
    v6();
  }
  else
  {
    id v7 = [(PKPaymentSetupMoreInfoViewController *)self presentingViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return PKPaymentSetupContextIsBridge();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v4 = [a3 dockView];
  [v4 setButtonsEnabled:0];

  [(PKPaymentSetupMoreInfoViewController *)self _reportDoneButtonTapped];

  [(PKPaymentSetupMoreInfoViewController *)self _next];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4 = a3;
  [(PKExplanationViewController *)self showSpinner:1];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke;
  v5[3] = &unk_1E59CB100;
  objc_copyWeak(&v6, &location);
  [(PKPaymentSetupMoreInfoViewController *)self _alternateActionWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v3[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained showSpinner:0];
    id WeakRetained = v3;
    if (*(unsigned char *)(a1 + 40))
    {
      [v3 _next];
      id WeakRetained = v3;
    }
  }
}

- (void)_alternateActionWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CA9F8;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  id v7 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
  uint64_t v8 = [v7 type];

  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (!v8) {
      v6[2](v6, 1);
    }
  }
  else
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: User requested to disable Express mode from Express Education", buf, 2u);
    }

    [(PKPaymentSetupMoreInfoViewController *)self _reportTurnOffExpressButtonTapped];
    char v10 = objc_opt_respondsToSelector();
    targetDevice = self->_targetDevice;
    if (v10)
    {
      v12 = [(PKSecureElementPass *)self->_pass uniqueID];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_33;
      v19[3] = &unk_1E59D0180;
      v19[4] = self;
      uint64_t v20 = v6;
      [(PKPaymentWebServiceTargetDeviceProtocol *)targetDevice removeExpressPassWithUniqueIdentifierV2:v12 completion:v19];

      v13 = v20;
LABEL_10:

      goto LABEL_14;
    }
    if (objc_opt_respondsToSelector())
    {
      id v14 = self->_targetDevice;
      id v15 = [(PKSecureElementPass *)self->_pass uniqueID];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_37;
      v17[3] = &unk_1E59D0180;
      v17[4] = self;
      v18 = v6;
      [(PKPaymentWebServiceTargetDeviceProtocol *)v14 removeExpressPassWithUniqueIdentifier:v15 completion:v17];

      v13 = v18;
      goto LABEL_10;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_targetDevice;
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Failed to disable express mode due to respondsToSelector of TargetDevice:%@", buf, 0xCu);
    }

    v6[2](v6, 0);
  }
LABEL_14:
}

uint64_t __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Disabled express mode with success:%d from Express Education", (uint8_t *)v7, 8u);
  }

  if (a2) {
    [*(id *)(a1 + 32) _reportExpressModeDisable];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_37(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Disabled express mode with success:%d from Express Education", (uint8_t *)v7, 8u);
  }

  if (a2) {
    [*(id *)(a1 + 32) _reportExpressModeDisable];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_linkTapped
{
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v3 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
  id v4 = [v3 linkURL];
  [v5 openURL:v4 configuration:0 completionHandler:0];
}

- (CGSize)_snapshotSize
{
  double v2 = 220.0;
  double v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_beginReportingIfNecessary
{
  if ([(PKPaymentSetupMoreInfoViewController *)self _isExpressEducation])
  {
    id v4 = [(PKPaymentSetupMoreInfoViewController *)self _reportingSubject];
    double v3 = objc_msgSend(MEMORY[0x1E4F843E0], "reporterForSubject:");

    if (!v3)
    {
      self->_didBeginReportingSubject = 1;
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v4];
    }
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginReportingSubject)
  {
    double v2 = (void *)MEMORY[0x1E4F843E0];
    id v3 = [(PKPaymentSetupMoreInfoViewController *)self _reportingSubject];
    [v2 endSubjectReporting:v3];
  }
}

- (void)_reportViewDidAppear
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:*MEMORY[0x1E4F864A0] forKey:*MEMORY[0x1E4F86308]];
  [v3 setObject:*MEMORY[0x1E4F86EC8] forKey:*MEMORY[0x1E4F86730]];
  [(PKSecureElementPass *)self->_pass devicePaymentApplications];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v4);
        }
        char v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (v7 && v7 != objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "paymentType", (void)v38))
        {

          v11 = @"multiple";
          goto LABEL_13;
        }
        uint64_t v7 = objc_msgSend(v10, "paymentType", (void)v38);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  PKPaymentMethodTypeToString();
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  [v3 safelySetObject:v11 forKey:*MEMORY[0x1E4F86858]];
  pass = self->_pass;
  id v13 = v3;
  id v14 = pass;
  id v15 = v14;
  if (v13 && v14)
  {
    uint64_t v16 = [(PKSecureElementPass *)v14 passType];
    id v17 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v16 + 1) >= 3) {
      v18 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      v18 = off_1E59D01F0[v16 + 1];
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E4F867E8], (void)v38);

    unint64_t v19 = [(PKSecureElementPass *)v15 style];
    if (v19 < 0xD && ((0x13FFu >> v19) & 1) != 0) {
      uint64_t v20 = off_1E59D0208[v19];
    }
    else {
      uint64_t v20 = (__CFString *)*v17;
    }
    [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    objc_super v21 = [(PKSecureElementPass *)v15 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    v23 = v15;
    if ([(PKSecureElementPass *)v23 passType] == 1)
    {
      v24 = [(PKSecureElementPass *)v23 secureElementPass];
      unint64_t v25 = [v24 cardType];
      if (v25 <= 4) {
        id v22 = (__CFString *)**((id **)&unk_1E59D0270 + v25);
      }
    }
    else
    {
      id v22 = @"other";
    }

    [v13 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    v26 = [(PKSecureElementPass *)v23 secureElementPass];
    if ([v26 isIdentityPass])
    {
      uint64_t v27 = [v26 identityType];
      if ((unint64_t)(v27 - 1) < 3)
      {
        v28 = off_1E59D0298[v27 - 1];
        goto LABEL_34;
      }
    }
    else if ([v26 isAccessPass])
    {
      unint64_t v29 = [v26 accessType];
      if (v29 < 7)
      {
        v28 = off_1E59D02B0[v29];
        goto LABEL_34;
      }
    }
    v28 = (__CFString *)*v17;
LABEL_34:

    [v13 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    v30 = [(PKSecureElementPass *)v23 secureElementPass];
    v31 = [v30 devicePaymentApplications];
    [v31 count];

    v32 = PKAnalyticsReportSwitchToggleResultValue();

    [v13 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    v33 = [(PKSecureElementPass *)v23 secureElementPass];
    id v34 = *v17;
    v35 = [v33 organizationName];
    if ([v35 length])
    {
      unint64_t v36 = [v33 cardType];
      if (v36 <= 4 && ((1 << v36) & 0x16) != 0)
      {
        id v37 = v35;

        id v34 = v37;
      }
    }

    [v13 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
  }

  [(PKPaymentSetupMoreInfoViewController *)self _reportExpressEventIfNeeded:v13];
}

- (void)_reportExpressModeEnable
{
  id v3 = [(PKPaymentSetupMoreInfoViewController *)self _reportingSubject];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F87068]];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v5 setObject:*MEMORY[0x1E4F863B0] forKey:*MEMORY[0x1E4F86308]];
    [v5 setObject:*MEMORY[0x1E4F864B0] forKey:*MEMORY[0x1E4F86730]];
    [(PKPaymentSetupMoreInfoViewController *)self _reportExpressEventIfNeeded:v5];
  }
}

- (void)_reportExpressModeDisable
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:*MEMORY[0x1E4F863A8] forKey:*MEMORY[0x1E4F86308]];
  [v3 setObject:*MEMORY[0x1E4F864B0] forKey:*MEMORY[0x1E4F86730]];
  [(PKPaymentSetupMoreInfoViewController *)self _reportExpressEventIfNeeded:v3];
}

- (void)_reportDoneButtonTapped
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:*MEMORY[0x1E4F86380] forKey:*MEMORY[0x1E4F86308]];
  [v3 setObject:*MEMORY[0x1E4F86EC8] forKey:*MEMORY[0x1E4F86730]];
  [v3 setObject:*MEMORY[0x1E4F862D0] forKey:*MEMORY[0x1E4F86120]];
  [(PKPaymentSetupMoreInfoViewController *)self _reportExpressEventIfNeeded:v3];
}

- (void)_reportTurnOffExpressButtonTapped
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:*MEMORY[0x1E4F86380] forKey:*MEMORY[0x1E4F86308]];
  [v3 setObject:*MEMORY[0x1E4F86EC8] forKey:*MEMORY[0x1E4F86730]];
  [v3 setObject:*MEMORY[0x1E4F86130] forKey:*MEMORY[0x1E4F86120]];
  [(PKPaymentSetupMoreInfoViewController *)self _reportExpressEventIfNeeded:v3];
}

- (void)_reportExpressEventIfNeeded:(id)a3
{
  id v12 = a3;
  int v4 = [(PKPaymentSetupMoreInfoViewController *)self _reportingSubject];
  if ([(PKPaymentSetupMoreInfoViewController *)self _isExpressEducation] && v4)
  {
    [(PKExplanationViewController *)self context];
    int IsBridge = PKPaymentSetupContextIsBridge();
    uint64_t v6 = (void *)MEMORY[0x1E4F86B28];
    if (!IsBridge) {
      uint64_t v6 = (void *)MEMORY[0x1E4F86B68];
    }
    [v12 setObject:*v6 forKey:*MEMORY[0x1E4F86B38]];
    uint64_t v7 = [(PKPaymentSetupMoreInfoViewController *)self _paymentNetworkNamesForExpressReporting];
    uint64_t v8 = [v7 componentsJoinedByString:*MEMORY[0x1E4F86090]];
    [v12 setObject:v8 forKey:*MEMORY[0x1E4F86860]];

    v9 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
    char v10 = [v9 reportingMetadata];
    if (v10) {
      [v12 addEntriesFromDictionary:v10];
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F87068]] && (reporter = self->_reporter) != 0) {
      [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportEvent:v12];
    }
    else {
      [MEMORY[0x1E4F843E0] subject:v4 sendEvent:v12];
    }
  }
}

- (id)_paymentNetworkNamesForExpressReporting
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(PKSecureElementPass *)self->_pass paymentPass];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  unint64_t v29 = __Block_byref_object_copy__9;
  v30 = __Block_byref_object_dispose__9;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke;
  aBlock[3] = &unk_1E59D01A8;
  void aBlock[4] = self;
  unint64_t v19 = _Block_copy(aBlock);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F846E0]) initForPaymentPass:v4 withTechologyTest:v19];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke_2;
  v24[3] = &unk_1E59D01D0;
  v24[4] = &v26;
  [v5 enumerateCredentialsWithHandler:v24];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(PKPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice upgradeRequestForPass:v4];
    uint64_t v7 = [v6 paymentApplicationIdentifiers];

    if (v7) {
      [(id)v27[5] addObjectsFromArray:v7];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)v27[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = *MEMORY[0x1E4F86D78];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v4 devicePaymentApplicationForAID:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        id v14 = v13;
        if (v13)
        {
          [v13 paymentNetworkIdentifier];
          uint64_t v15 = PKPaymentNetworkNameForPaymentCredentialType();
          uint64_t v16 = (void *)v15;
          if (v15) {
            uint64_t v17 = v15;
          }
          else {
            uint64_t v17 = v11;
          }
          [v3 addObject:v17];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v9);
  }

  if (![v3 count]) {
    [v3 addObject:*MEMORY[0x1E4F86D78]];
  }

  _Block_object_dispose(&v26, 8);

  return v3;
}

uint64_t __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  int v4 = *(void **)(*(void *)(a1 + 32) + 1080);

  return [v4 supportsExpressForAutomaticSelectionTechnologyType:a2];
}

void __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  [MEMORY[0x1E4F846E0] extractApplicationIdentifier:&v3 subcredentialIdentifier:0 fromIdentifiers:a2];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "pk_safelyAddObject:", v3);
}

- (id)_reportingSubject
{
  int64_t reportingSource = self->_reportingSource;
  if (!reportingSource)
  {
    id v3 = (id *)MEMORY[0x1E4F87068];
    goto LABEL_5;
  }
  if (reportingSource == 1)
  {
    id v3 = (id *)MEMORY[0x1E4F87060];
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)_isExpressEducation
{
  double v2 = [(PKPaymentSetupMoreInfoViewController *)self _currentItem];
  uint64_t v3 = [v2 type];

  return (unint64_t)(v3 - 1) < 2;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(PKPaymentSetupMoreInfoViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (BOOL)isFinalViewController
{
  return self->_isFinalViewController;
}

- (void)setIsFinalViewController:(BOOL)a3
{
  self->_isFinalViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end